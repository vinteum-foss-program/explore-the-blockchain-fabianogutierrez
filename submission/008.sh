# Which public key signed input 0 in this tx:
#   `e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163`
#!/bin/bash
BTC_HOME=/home/gutierrez/bitcoin/bitcoin/src
JQ_HOME=/home/gutierrez/bitcoin/tools/jq-1.7.1

BTC_CMD=bitcoin-cli
JQ_CMD=jq

# Teste Local
#hash=$($BTC_HOME/$BTC_CMD getrawtransaction e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163)
#bloco=$($BTC_HOME/$BTC_CMD decoderawtransaction $hash )
#tx=$(echo $bloco | $JQ_HOME/$JQ_CMD -r '.vin[0].txinwitness[]')
#for hexa in $tx; do
#    decode=$($BTC_HOME/$BTC_CMD decodescript $hexa)
#    asm=$(echo $decode | $JQ_HOME/$JQ_CMD -r '.asm |split(" ") |.[1]')
#    qnt=${#asm}
#    if [ "$qnt" -eq 66 ]; then
#        echo $asm 
#    fi
#done

# Teste git
hash=$($BTC_CMD getrawtransaction e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163)
bloco=$($BTC_CMD decoderawtransaction $hash )
tx=$(echo $bloco | $JQ_CMD -r '.vin[0].txinwitness[]')
for hexa in $tx; do
    decode=$($BTC_CMD decodescript $hexa)
    asm=$(echo $decode | $JQ_CMD -r '.asm |split(" ") |.[1]')
    qnt=${#asm}
    if [ "$qnt" -eq 66 ]; then
        echo $asm 
    fi
done
