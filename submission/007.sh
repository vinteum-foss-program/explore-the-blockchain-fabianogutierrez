# Only one single output remains unspent from block 123,321. What address was it sent to?
#!/bin/bash
BTC_HOME=/home/gutierrez/bitcoin/bitcoin/src
JQ_HOME=/home/gutierrez/bitcoin/tools/jq-1.7.1

BTC_CMD=bitcoin-cli
JQ_CMD=jq

# Teste Local
#hash=$($BTC_HOME/$BTC_CMD getblockhash 123321)
#bloco=$($BTC_HOME/$BTC_CMD getblock $hash 2)
#txids=$(echo $bloco | $JQ_HOME/$JQ_CMD '.tx[] | .txid')
#echo $txids

#for txid in $txids; do
#    echo $txid
#    qnts=$(echo $bloco | $JQ_HOME/$JQ_CMD '.tx[] | select( .txid == '$txid') | .vout[] | .n')
    #echo $qnt
#    for i in $qnts; do
#        txid="${txid//\"/$''}"
#        resultado=$($BTC_HOME/$BTC_CMD gettxout $txid $i)
#        if [[ -n "$resultado" ]]; then
#            resultado=$(echo $resultado | $JQ_HOME/$JQ_CMD -r '.scriptPubKey .address ')
            #resultado="${resultado//\"/$''}"
#            echo $resultado
#        fi        
#    done
#done

# Teste git
hash=$($BTC_CMD getblockhash 123321)
bloco=$($BTC_CMD getblock $hash 2)

txids=$(echo $bloco | $JQ_CMD '.tx[] | .txid')
#echo $txids

for txid in $txids; do
#    echo $txid
    qnts=$(echo $bloco | $JQ_CMD '.tx[] | select( .txid == '$txid') | .vout[] | .n')
    #echo $qnt
    for i in $qnts; do
        txid="${txid//\"/$''}"
        resultado=$($BTC_CMD gettxout $txid $i)
        if [[ -n "$resultado" ]]; then
            resultado=$(echo $resultado | $JQ_CMD -r '.scriptPubKey .address ')
            #resultado="${resultado//\"/$''}"
            echo $resultado
        fi        
    done
    
done
