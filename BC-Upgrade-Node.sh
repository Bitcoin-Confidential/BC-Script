#!/bin/bash
echo 'Downloading and extract wallet files'
wget "https://github.com/Bitcoin-Confidential/BitcoinC-Core/releases/download/v1.0.2/bitcoinc-1.0.2-x86_64-linux-gnu.tar.gz" -O - | tar -xz

echo 'Stopping and removing previous version'
~/bitcoinc-cli stop && sleep 10
rm ~/bitcoincd 
rm ~/bitcoinc-cli && sleep 1

echo 'Copying files to home directory and setting permissions'
cp bitcoinc-1.0.2/bin/bitcoincd ~/ 
cp bitcoinc-1.0.2/bin/bitcoinc-cli ~/
chmod a+x ~/bitcoincd ~/bitcoinc-cli

~/bitcoincd && sleep 1

echo 'Upgrade finished.'
echo 'To stop wallet ./bitcoinc-cli stop'
echo 'To start ./bitcoincd'
