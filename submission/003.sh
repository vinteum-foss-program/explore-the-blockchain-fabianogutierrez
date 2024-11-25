# How many new outputs were created by block 123,456?
#!/bin/bash
BTC_HOME=/home/gutierrez/bitcoin/bitcoin/src
JQ_HOME=/home/gutierrez/bitcoin/tools/jq-1.7.1
BTC_CMD=bitcoin-cli
JQ_CMD=jq

# Teste Local
#hash=$($BTC_HOME/$BTC_CMD getblockhash 123456)
#bloco=$($BTC_HOME/$BTC_CMD getblock $hash 2)

#echo $bloco | $JQ_HOME/$JQ_CMD -c '.tx[] | .vout | length ' | awk '{s+=$1} END {print s}'

# Teste Github
hash=$($BTC_CMD getblockhash 123456)
bloco=$($BTC_CMD getblock $hash 2)

echo $bloco | $JQ_CMD -c '.tx[] | .vout | length ' | awk '{s+=$1} END {print s}'