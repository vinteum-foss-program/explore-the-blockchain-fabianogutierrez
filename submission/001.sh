# What is the hash of block 654,321?
#!/bin/bash
BTC_HOME=/home/gutierrez/bitcoin/bitcoin/src
JQ_HOME=/home/gutierrez/bitcoin/tools/jq-1.7.1
BTC_CMD=bitcoin-cli
JQ_CMD=jq

#Teste Local
#eval "$BTC_HOME/bitcoin-cli getblockhash 654321"

# Teste github
eval "$BTC_CMD getblockhash 654321"
