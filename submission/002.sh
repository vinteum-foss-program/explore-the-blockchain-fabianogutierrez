# (true / false) Verify the signature by this address over this message:
#   address: `1E9YwDtYf9R29ekNAfbV7MvB4LNv7v3fGa`
#   message: `1E9YwDtYf9R29ekNAfbV7MvB4LNv7v3fGa`
#   signature: `HCsBcgB+Wcm8kOGMH8IpNeg0H4gjCrlqwDf/GlSXphZGBYxm0QkKEPhh9DTJRp2IDNUhVr0FhP9qCqo2W0recNM=`
#!/bin/bash
BTC_HOME=/home/gutierrez/bitcoin/bitcoin/src
JQ_HOME=/home/gutierrez/bitcoin/tools/jq-1.7.1
BTC_CMD=bitcoin-cli
JQ_CMD=jq


address="1E9YwDtYf9R29ekNAfbV7MvB4LNv7v3fGa"
signature="HCsBcgB+Wcm8kOGMH8IpNeg0H4gjCrlqwDf/GlSXphZGBYxm0QkKEPhh9DTJRp2IDNUhVr0FhP9qCqo2W0recNM="
message="1E9YwDtYf9R29ekNAfbV7MvB4LNv7v3fGa"
# Teste Local
#resultado=$($BTC_HOME/$BTC_CMD verifymessage $address $signature $message)

# Teste GitHub
resultado=$($BTC_CMD verifymessage $address $signature $message)

echo $resultado


