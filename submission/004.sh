# Using descriptors, compute the taproot address at index 100 derived from this extended public key:
#   `xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2`
#!/bin/bash
BTC_HOME=/home/gutierrez/bitcoin/bitcoin/src
JQ_HOME=/home/gutierrez/bitcoin/tools/jq-1.7.1
BTC_CMD=bitcoin-cli
JQ_CMD=jq

# Teste Local
#descriptor=$($BTC_HOME/$BTC_CMD getdescriptorinfo "tr(xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2/100)")
#comando=$(echo $descriptor | $JQ_HOME/$JQ_CMD  .descriptor)
#comando="${comando//\"/$''}"
#resultado=$($BTC_HOME/$BTC_CMD deriveaddresses $comando)
#resultado="${resultado//\"/$''}"
#resultado="${resultado//[/$''}"
#resultado="${resultado//]/$''}"


# Teste Github
descriptor=$($BTC_CMD getdescriptorinfo "tr(xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2/100)")
comando=$(echo $descriptor | $JQ_CMD  .descriptor)
comando="${comando//\"/$''}"
resultado=$($BTC_CMD deriveaddresses $comando)
resultado="${resultado//\"/$''}"
resultado="${resultado//[/$''}"
resultado="${resultado//]/$''}"

echo $resultado
