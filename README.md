# 🛠️ Samsung Galaxy Book Linux Audio Fix

This project contains scripts and services to fix the audio (Realtek ALC298 speaker amp) on **Samsung Galaxy Book2** laptops running Ubuntu-based Linux distros. This guide helps you fix the **internal speaker issue** on Samsung Galaxy Book devices running Ubuntu, where audio doesn't work out-of-the-box due to missing speaker amp initialization.

## ✅ Tested On

- **Device**: Samsung Galaxy Book2 NT950XDA
- **Codec**: Realtek ALC298
- **OS**: Ubuntu 22.04, 24.04+
- **Kernel**: 5.8+ (tested with 6.x)

## 📦 What This Fix Does

- Forces correct driver to load: `snd_soc_skl_hda_dsp` (SOF)
- Disables legacy HDA driver
- Initializes 2 or 4 smart speaker amps via `hda-verb`
- Installs systemd services to apply fix at boot + resume
- Disables PulseAudio suspend (avoids speaker freeze)

## ✅ What’s Included

- Initializes smart speaker amps via `hda-verb`
- Enables audio fix at boot and after suspend
- Disables PulseAudio suspend-on-idle (recommended)

## 📦 Folder Structure

galaxybook-linux-setup/ <br />
├── install.sh <br />
├── scripts/ <br />
│ └── realtek-alc298-audio-init.sh <br />
├── services/ <br />
│ ├── galaxybook2-audio.service <br />
│ └── galaxybook2-audio-resume.service <br />

## 🚀 How to Use

### Method 1: Cloning

Step 1 - Clone:

```bash
git clone https://github.com/topzyray/galaxybook-linux-setup.git
```

Step 2 - Navigate to the folder:

```bash
cd galaxybook-linux-setup
```

Step 3 - Change permission to make script executable:

```bash
chmod +x install.sh
```

Step 4 - Run the install script:

```bash
./install.sh
```

Step 5 - Reboot your system:

```bash
sudo reboot
```

### Method 2: Download using wget

Step 1 - Download:

```bash
wget https://github.com/topzyray/galaxybook-linux-setup/archive/refs/heads/main.zip
```

Step 2 - Unzip content:

```bash
unzip main.zip
```

Step 3 - Navigate to the folder:

```bash
cd galaxybook-linux-setup-main
```

Step 4 - Change permission to make script executable:

```bash
chmod +x install.sh
```

Step 5 - Run the install script:

```bash
./install.sh
```

Step 6 - Reboot your system:

```bash
sudo reboot
```

## 🔊 Manual Setup (Advanced)

If you prefer to set it up step by step, follow the guide inside the script or review:

- **joshuagrisham’s GitHub work** ["https://github.com/joshuagrisham/samsung-galaxybook-extras/issues/80"]
- **Manjaro community post by user @TO912** ["https://forum.manjaro.org/t/howto-set-up-the-audio-card-in-samsung-galaxy-book/37090"]

## 🧪 Troubleshooting

- Run: `alsamixer` → Select `sof-hda-dsp` → Unmute and raise volumes
- Run: `speaker-test -c 2 -t wav` or run any video or audio → Listen for left/right channel
- Run manually: `~/scripts/realtek-alc298-audio-init.sh` to re-apply fix if needed

## 🙌 Credit

- **joshuagrisham’s GitHub work** ["https://github.com/joshuagrisham/samsung-galaxybook-extras/issues/80"]
- **Manjaro community post by user @TO912** ["https://forum.manjaro.org/t/howto-set-up-the-audio-card-in-samsung-galaxy-book/37090"]
- **topzyray (Tope Taiwo) for automation and Ubuntu port** ["https://github.com/topzyray/galaxybook-linux-setup"]

## ❤️ Share or Contribute

Feel free to open issues or pull requests to improve this further or add fingerprint/backlight support.

## 📝 License

This project is open-source under the MIT License. Contributions are welcome!
