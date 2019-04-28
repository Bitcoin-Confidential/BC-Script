#!/bin/bash
# Downloading the wallet
echo 'Downloading the wallet'
wget "https://github.com/Bitcoin-Confidential/BitcoinC-Core/releases/download/v1.0.0/bitcoinc-1.0.0.0-x86_64-linux-gnu.tar.gz" -O ~/bitcoinc.tar.gz

# Extract the files
echo 'Extracting the files'
sudo tar xvzf ~/bitcoinc.tar.gz

# Download bitcoin confidential icon
echo 'Download Bitcoin Confidential Icon PNG'
mkdir -p ~/bitcoinc-1.0.0.0/assets
wget https://gist.githubusercontent.com/deyvisonrocha/41b87f0718dbe33a6629d06234ea9865/raw/5db4d783b6883dc21420d239805e2bc377f4e0b1/bitcoin-confidential-icon.png -O ~/bitcoinc-1.0.0.0/assets/icon.png.base64
base4 -d <<< "$(cat ~/bitcoinc-1.0.0.0/assets/icon.png.base64)" > ~/bitcoinc-1.0.0.0/assets/icon.png

# Create a shortcut on system
echo 'Creating symbol link'
sudo ln -sf ~/bitcoinc-1.0.0.0/bin/bitcoinc-qt /usr/bin/bitcoinc-qt

# Create a .desktop current file
echo 'Create the BitcoinConfidential.desktop file'
echo -e '[Desktop Entry]\nVersion=1.0\nName=Bitcoin Confidential Desktop Wallet\nComment=Bitcoin Confidential Desktop Wallet\nExec=/usr/bin/bitcoinc-qt\nIcon="~/bitcoinc-1.0.0.0/assets/icon.png"\nTerminal=false\nStartupWMClass=bitcoinc-qt\nType=Application\nCategories=Finance;Internet;\n' | sudo tee /usr/share/applications/bitcoin-confidential.desktop
sudo chmod +x /usr/share/applications/bitcoin-confidential.desktop

echo 'Installation finish'
