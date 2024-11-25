# Which tx in block 257,343 spends the coinbase output of block 256,128?
#!/bin/bash
BTC_HOME=/home/gutierrez/bitcoin/bitcoin/src
JQ_HOME=/home/gutierrez/bitcoin/tools/jq-1.7.1

BTC_CMD=bitcoin-cli
JQ_CMD=jq
# Teste Local
#hash=$($BTC_HOME/$BTC_CMD getblockhash 256128)
#bloco=$($BTC_HOME/$BTC_CMD getblock $hash 2)
#txidB256128=$(echo $bloco | $JQ_HOME/$JQ_CMD '.tx[] | .txid')

#hash=$($BTC_HOME/$BTC_CMD getblockhash 257343)
#bloco=$($BTC_HOME/$BTC_CMD getblock $hash 2)
#echo $bloco
#for txid in $txidB256128; do
    #echo $txid
#    tx257343=$(echo $bloco | $JQ_HOME/$JQ_CMD '.tx[] | select(.vin[] | .txid == '$txid')')
#    resultado=$(echo $tx257343 | $JQ_HOME/$JQ_CMD '.txid ')
#    if [[ -n "$resultado" ]]; then
#        resultado="${resultado//\"/$''}"
#        echo $resultado
#    fi
#done

# Teste git
hash=$($BTC_CMD getblockhash 256128)
bloco=$($BTC_CMD getblock $hash 2)
txidB256128=$(echo $bloco | $JQ_CMD '.tx[] | .txid')

hash=$($BTC_CMD getblockhash 257343)
bloco=$($BTC_CMD getblock $hash 2)
#echo $bloco
for txid in $txidB256128; do
    #echo $txid
    tx257343=$(echo $bloco | $JQ_CMD '.tx[] | select(.vin[] | .txid == '$txid')')
    resultado=$(echo $tx257343 | $JQ_CMD '.txid ')
    if [[ -n "$resultado" ]]; then
        resultado="${resultado//\"/$''}"
        echo $resultado
    fi
done