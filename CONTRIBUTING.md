# Contributing to Galaxy Book2 Linux Audio Fix

Thank you for your interest in contributing! We welcome all kinds of contributions to improve the project and help fellow Linux users get audio working properly on Samsung Galaxy Book2 devices.

---

## 🚀 Getting Started

1. **Fork the repository** and clone it locally:

   ```bash
   git clone https://github.com/topzyray/galaxybook-linux-setup.git
   ```

2. **Create a new branch** for your changes:

   ```bash
   git checkout -b fix-issue-or-feature
   ```

3. **Make your changes**, commit and push:

   ```bash
   git commit -m "Describe your changes"
   git push origin fix-issue-or-feature
   ```

4. **Submit a pull request** with a clear explanation.

---

## 🧩 What You Can Contribute

- Improvements to `realtek-alc298-audio-init.sh` (e.g., autodetection, validation)
- Additional hardware support scripts (e.g., fingerprint reader, keyboard backlight)
- Compatibility testing on other distros (Ubuntu flavors, Arch, Fedora)
- Localization support or user-friendly wrappers
- Better error handling and logging
- Documentation updates or fixes

---

## ✅ Guidelines

- Keep scripts POSIX-compliant and readable.
- Avoid distro-specific dependencies when possible.
- Reference issues or forums in your commit messages when relevant.
- Ensure that any scripts or systemd services are tested before submitting.
- Follow the existing folder structure.

---

## 🛠️ Tools Used

- `hda-verb` (from `alsa-tools`)
- `systemd`
- Bash scripting

---

## 📞 Questions or Help?

- Open an issue in the repository if you're stuck or want to suggest something.
- Be respectful and constructive in discussions.

We’re happy to collaborate and improve this together 🙌

---

Thanks again, and happy hacking!

– The GalaxyBook2 Audio Fix Maintainers
