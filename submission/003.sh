# How many new outputs were created by block 123,456?
#!/bin/bash
BTC_HOME=/home/gutierrez/bitcoin/bitcoin/src
JQ_HOME=/home/gutierrez/bitcoin/tools/jq-1.7.1

hash=$($BTC_HOME/bitcoin-cli getblockhash 123456)
bloco=$($BTC_HOME/bitcoin-cli getblock $hash 2)

echo $bloco | $JQ_HOME/jq -c '.tx[] | .vout | length ' | awk '{s+=$1} END {print s}'
