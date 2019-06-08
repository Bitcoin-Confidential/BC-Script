# BC-Scripts
Bitcoin Confidential Linux Install Scripts
Scripts are designed to be run as root user.  Modify with sudo if running as user without root permissions.

## For Bitcoincd Staking Node linux install  
curl -sSL https://raw.githubusercontent.com/Bitcoin-Confidential/BC-Script/master/BC-Install-node.sh | bash

## For QT linux install  
curl -sSL https://raw.githubusercontent.com/Bitcoin-Confidential/BC-Script/master/BC-Install-QT.sh | bash

## To manually enabling staking.
./bitcoinc-cli walletsettings stakingstatus true

## To manually create a wallet.
./bitcoinc-cli mnemonic new
Copy the phrase
./bitcoinc-cli extkeyimportmaster "put phrase here"

## To manually create a stake address
./bitcoin-cli getnewstakeaddress
