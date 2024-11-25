# Create a 1-of-4 P2SH multisig address from the public keys in the four inputs of this tx:
#   `37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517`
#!/bin/bash
BTC_HOME=/home/gutierrez/bitcoin/bitcoin/src
JQ_HOME=/home/gutierrez/bitcoin/tools/jq-1.7.1
BTC_CMD=bitcoin-cli
JQ_CMD=jq

# Teste Local
#raw=$($BTC_HOME/$BTC_CMD getrawtransaction 37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517)
#decoderaw=$($BTC_HOME/$BTC_CMD decoderawtransaction $raw)
#pubkey=$(echo $decoderaw | $JQ_HOME/$JQ_CMD -c '.vin[] | .txinwitness[1] ')
#pubkey="${pubkey//[[:space:]]/$','}"
#comando="$BTC_HOME/$BTC_CMD createmultisig 1 [$pubkey]"
#resultado=$($comando)
#resultado=$(echo $resultado | $JQ_HOME/$JQ_CMD -c '.address ')
#resultado="${resultado//\"/$''}"

# Teste git
raw=$($BTC_CMD getrawtransaction 37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517)
decoderaw=$($BTC_CMD decoderawtransaction $raw)
pubkey=$(echo $decoderaw | $JQ_CMD -c '.vin[] | .txinwitness[1] ')
pubkey="${pubkey//[[:space:]]/$','}"
comando="$BTC_CMD createmultisig 1 [$pubkey]"
resultado=$($comando)
resultado=$(echo $resultado | $JQ_CMD -c '.address ')
resultado="${resultado//\"/$''}"


echo $resultado
