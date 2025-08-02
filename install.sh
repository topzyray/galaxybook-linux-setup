#!/bin/bash
# install.sh – Automates the Galaxy Book2 audio fix setup

set -e

echo "📁 Creating local script directory..."
mkdir -p ~/scripts

echo "📥 Copying setup scripts..."
cp scripts/*.sh ~/scripts/
chmod +x ~/scripts/*.sh

echo "🔧 Installing systemd services..."
sudo cp services/*.service /etc/systemd/system/
sudo chmod a+r /etc/systemd/system/*.service

echo "📄 Creating modprobe configurations..."
echo "options snd slots=snd_soc_skl_hda_dsp" | sudo tee /etc/modprobe.d/sof.conf > /dev/null
echo "blacklist snd-hda-intel" | sudo tee /etc/modprobe.d/blacklist.conf > /dev/null

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
sudo systemctl enable galaxybook2-audio.service
sudo systemctl enable galaxybook2-audio-resume.service

echo "🎉 Setup complete. Please reboot to apply changes."
