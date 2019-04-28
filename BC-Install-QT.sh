#!/bin/bash

# Colors
ORANGEBOLD='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Contants
TMP_NAME=bitcoinc.tar.gz
USER_FOLDER_NAME=Bitcoin-Confidential
DESKTOP_FILENAME=bitcoin-confidential.desktop
ICON_FILENAME=bitcoinc.png

# Downloading the wallet
echo -e "${GREEN}Downloading the wallet"
wget -q --show-progress "https://github.com/Bitcoin-Confidential/BitcoinC-Core/releases/download/v1.0.0/bitcoinc-1.0.0.0-x86_64-linux-gnu.tar.gz" -O /tmp/$TMP_NAME

# Extract the files
echo -e "${GREEN}Extracting the files"
tar xzf /tmp/$TMP_NAME
mv /tmp/bitcoinc-1.0.0.0 $HOME/$USER_FOLDER_NAME

# Downloading bitcoin confidential icon
echo -e "${GREEN}Downloading ${ORANGEBOLD}Bitcoin Confidential ${GREEN}Icon PNG"
mkdir -p $HOME/.icons/
wget -q --show-progresshttps://gist.githubusercontent.com/deyvisonrocha/41b87f0718dbe33a6629d06234ea9865/raw/5db4d783b6883dc21420d239805e2bc377f4e0b1/bitcoin-confidential-icon.png -O $HOME/.icons/$ICON_FILENAME.base64
base64 -d <<< "$(cat $HOME/.icons/$ICON_FILENAME.base64)" > ~/.icons/$ICON_FILENAME
echo -e "${GREEN}Removing the ${NC}base64 ${GREEN}icon file"
rm $HOME/.icons/$ICON_FILENAME.base64

# Create a shortcut on system
echo -e "${GREEN}Creating symbol link"
sudo ln -sf $HOME/$USER_FOLDER_NAME/bin/bitcoinc-qt /usr/bin/bitcoinc-qt

# Create the .desktop current file
echo -e "${GREEN}Create the ${NC}.desktop ${GREEN}current file"
echo '[Desktop Entry]\nVersion=1.0.0\nName=Bitcoin Confidential Desktop Wallet\nName[en_US]=Bitcoin Confidential Desktop Wallet\nName[pt_BR]=Carteira Desktop Bitcoin Confidential\nGenericName=Bitcoin Confidential Wallet\nGenericName[en_US]=Bitcoin Confidential Wallet\nGenericName[pt_BR]=Carteira Bitcoin Confidential\nComment=Privacy Simplified\nComment[en_US]=Privacy Simplified\nComment[pt_BR]=Privacidade simplificada\nExec=bitcoinc-qt\nIcon=bitcoinc\nTerminal=false\nStartupWMClass=bitcoinc-qt\nStartupNotify=true\nType=Application\nCategories=Finance;Internet;Network;\nMimeType=x-scheme-handler/bitcoinc;' | tee ~/.local/share/applications/$DESKTOP_FILENAME
chmod +x ~/.local/share/applications/$DESKTOP_FILENAME

echo -e "${GREEN}Installation finish"