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
   │ └── init-audio.sh <br />
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

## 🙌 Credit

Based on:

  * Manjaro forum fix
  * joshuagrisham’s GitHub work

## 📝 License

This project is open-source under the MIT License. Contributions are welcome!
