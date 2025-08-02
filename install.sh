#!/bin/bash
# install.sh – Automates the Galaxy Book2 audio fix setup

set -e

echo "📁 Creating local script directory..."
mkdir -p ~/scripts

echo "📥 Copying setup scripts..."
cp scripts/*.sh ~/scripts/
chmod +x ~/scripts/*.sh

echo "⚙️ Personalizing and installing systemd service files..."

ACTUAL_USER="${SUDO_USER:-$(logname 2>/dev/null || whoami)}"

sudo sed "s|\$USER|$ACTUAL_USER|g" services/galaxybook-audio.service \
  | sudo tee /etc/systemd/system/galaxybook-audio.service > /dev/null

sudo sed "s|\$USER|$ACTUAL_USER|g" services/galaxybook-audio-resume.service \
  | sudo tee /etc/systemd/system/galaxybook-audio-resume.service > /dev/null

sudo chmod a+r /etc/systemd/system/galaxybook-audio*.service


echo "📄 Creating modprobe configurations..."
echo "options snd slots=snd_soc_skl_hda_dsp" | sudo tee /etc/modprobe.d/sof.conf > /dev/null

echo "📄 Backing up original blacklist.conf..."
if [ -f /etc/modprobe.d/blacklist.conf ]; then
  sudo cp /etc/modprobe.d/blacklist.conf /etc/modprobe.d/blacklist.conf.bak
fi

# Append blacklist only if it doesn't exist
echo "🚫 Ensuring snd-hda-intel is blacklisted..."
if ! grep -q "^blacklist snd-hda-intel" /etc/modprobe.d/blacklist.conf 2>/dev/null; then
  echo "blacklist snd-hda-intel" | sudo tee -a /etc/modprobe.d/blacklist.conf > /dev/null
fi

# Optional: Backup alsa-base.conf if it exists
if [ -f /etc/modprobe.d/alsa-base.conf ]; then
  echo "📦 Backing up alsa-base.conf..."
  sudo mv /etc/modprobe.d/alsa-base.conf /etc/modprobe.d/alsa-base.conf.backup
fi

# Optional: Disable PulseAudio suspend-on-idle
PULSE_FILE="/etc/pulse/default.pa"
if grep -q "^load-module module-suspend-on-idle" "$PULSE_FILE"; then
  echo "🔇 Disabling suspend-on-idle in PulseAudio..."
  sudo sed -i 's/^load-module module-suspend-on-idle/###load-module module-suspend-on-idle/' "$PULSE_FILE"
fi

echo "🔄 Reloading systemd daemon..."
sudo systemctl daemon-reload

echo "✅ Enabling audio and resume services..."
sudo systemctl enable galaxybook-audio.service
sudo systemctl enable galaxybook-audio-resume.service

# Check if --yes or -y was passed as argument
AUTO_REBOOT=false
for arg in "$@"; do
  if [[ "$arg" == "--yes" || "$arg" == "-y" ]]; then
    AUTO_REBOOT=true
    break
  fi
done

echo "🎉 Setup complete."

if [ "$AUTO_REBOOT" = true ]; then
  echo "⚠️ Auto reboot enabled. Please save all work now."
  sleep 3
  sudo reboot
else
  echo ""
  read -rp "🔁 Do you want to reboot now? [y/N]: " REBOOT_CHOICE

  if [[ "$REBOOT_CHOICE" =~ ^[Yy](es)?$ ]]; then
    echo "⚠️ Please ensure all your files are saved."
    read -rp "Press Enter to continue with reboot..."
    sudo reboot
  else
    echo "📝 Please reboot manually to apply the audio fix."
  fi
fi


