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

echo "🔄 Reloading systemd daemon..."
sudo systemctl daemon-reload

echo "✅ Enabling audio and resume services..."
sudo systemctl enable galaxybook2-audio.service
sudo systemctl enable galaxybook2-audio-resume.service

echo "✅ Setup complete. Reboot to apply audio fix."
