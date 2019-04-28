#!/bin/bash
# Downloading the wallet
echo 'Downloading and extract wallet files'
wget "https://github.com/Bitcoin-Confidential/BitcoinC-Core/releases/download/v1.0.0/bitcoinc-1.0.0.0-x86_64-linux-gnu.tar.gz" -O - | tar -xz

# Extract the files and give executable permissions
echo 'Copying files to home directory'
cp bitcoinc-1.0.0.0/bin/bitcoincd ~/ 
cp bitcoinc-1.0.0.0/bin/bitcoinc-cli ~/
chmod a+x ~/bitcoincd ~/bitcoinc-cli

# Create wallet directory and set to run when windows is closed.
mkdir ~/.bitcoinc
echo 'daemon=1' > ~/.bitcoinc/bitcoinc.conf

# Start Wallet
./bitcoincd && sleep 5

echo 'Use this stake address on your local node to start staking.'
./bitcoinc-cli getnewstakeaddress
echo 'Enabling staking.'
./bitcoinc-cli walletsettings stakingstatus true

# Create a shortcut on system - Unhash if desired
#echo 'Creating symbol link'
#ln -sf ~/bitcoinc-1.0.0.0/bin/bitcoincd /usr/bin/bitcoincd
#ln -sf ~/bitcoinc-1.0.0.0/bin/bitcoinc-cli /usr/bin/bitcoinc-cli

echo 'Installation finished.'
echo 'To stop wallet ./bitcoinc-cli stop'
echo 'To start ./bitcoincd && sleep 5 && ./bitcoinc-cli walletsettings stakingstatus true'
