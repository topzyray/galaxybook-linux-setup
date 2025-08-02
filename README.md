# 🛠️ Galaxy Book2 Linux Audio Fix

This project contains scripts and services to fix the audio (Realtek ALC298 speaker amp) on **Samsung Galaxy Book2** laptops running Ubuntu-based Linux distros.

## ✅ What’s Included

- Initializes smart speaker amps via `hda-verb`
- Enables audio fix at boot and after suspend
- Disables PulseAudio suspend-on-idle (recommended)

## 📦 Folder Structure

galaxybook2-linux-setup/ <br />
├── install.sh <br />
├── scripts/ <br />
│ └── realtek-alc298-audio-init.sh <br />
├── services/ <br />
│ ├── galaxybook2-audio.service <br />
│ └── galaxybook2-audio-resume.service <br />

## 🚀 How to Use

1. Clone or download the folder.
2. Run the install script:

```bash
chmod +x install.sh
./install.sh
```

3. Reboot your system:

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
- **topzyray (Tope Taiwo) for automation and Ubuntu port** ["https://github.com/topzyray/galaxybook2-linux-setup"]

## ❤️ Share or Contribute

Feel free to open issues or pull requests to improve this further or add fingerprint/backlight support.

## 📝 License

This project is open-source under the MIT License. Contributions are welcome!
