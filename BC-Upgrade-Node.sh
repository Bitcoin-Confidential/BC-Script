#!/bin/bash
# Downloading the wallet
echo 'Downloading and extract wallet files'
wget "https://github.com/Bitcoin-Confidential/BitcoinC-Core/releases/download/v1.0.2/bitcoinc-1.0.2-x86_64-linux-gnu.tar.gz" -O - | tar -xz

echo 'Stopping and removing previous version'
~/bitcoinc-cli stop && sleep 10 && rm ~/bitcoincd ~/bitcoinc-cli

# Extract the files and give executable permissions
echo 'Copying files to home directory and setting permissions'
cp bitcoinc-1.0.2/bin/bitcoincd ~/ 
cp bitcoinc-1.0.2/bin/bitcoinc-cli ~/
chmod a+x ~/bitcoincd ~/bitcoinc-cli

~/bitcoincd && sleep 2

echo 'Installation finished.'
echo 'To stop wallet ./bitcoinc-cli stop'
echo 'To start ./bitcoincd'
