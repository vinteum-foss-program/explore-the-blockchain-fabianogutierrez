# What is the hash of block 654,321?
#!/bin/bash
BTC_HOME=/home/gutierrez/bitcoin/bitcoin/src
JQ_HOME=/home/gutierrez/bitcoin/tools/jq-1.7.1

eval "$BTC_HOME/bitcoin-cli getblockhash 654321"

