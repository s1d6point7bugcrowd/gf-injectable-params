#!/bin/bash

# Check if the .gf directory exists and is not empty
if [ -d "$HOME/.gf" ] && [ "$(ls -A $HOME/.gf)" ]; then
  echo "~/.gf directory exists and is not empty."
else
  echo "Cloning gf-patterns into ~/.gf directory."
  git clone https://github.com/rix4uni/gf-patterns.git ~/.gf
fi

# Prompt the user to input the target URL
read -p "Enter the target URL: " URL_TARGET

# Prompt the user to select the type of injection
echo "Select the type of injection to test for:"
echo "1. All Parameters"
echo "2. IDOR"
echo "3. LFI"
echo "4. RCE"
echo "5. Redirect"
echo "6. SQLi"
echo "7. SSRF"
echo "8. SSTI"
echo "9. XSS"
read -p "Enter the number corresponding to your choice: " INJECTION_TYPE

# Define the corresponding gf pattern based on user input
case $INJECTION_TYPE in
    1) GF_PATTERN="allparam" ;;
    2) GF_PATTERN="idor" ;;
    3) GF_PATTERN="lfi" ;;
    4) GF_PATTERN="rce" ;;
    5) GF_PATTERN="redirect" ;;
    6) GF_PATTERN="sqli" ;;
    7) GF_PATTERN="ssrf" ;;
    8) GF_PATTERN="ssti" ;;
    9) GF_PATTERN="xss" ;;
    *) echo "Invalid choice"; exit 1 ;;
esac

# Define the blacklist for extensions
BLACKLIST=".(jpg|jpeg|gif|css|tif|tiff|png|ttf|woff|woff2|ico|pdf|svg|txt)"

# Run the one-liner with user input for the target URL and injection type
gospider -s "$URL_TARGET" -c 10 -d 5 --blacklist "$BLACKLIST" | \
gf "$GF_PATTERN" | \
sed 's/=./=/' | \
grep -Eo '(http|https)://[^&]+' | \
awk '!seen[$0]++' | \
grep "^$URL_TARGET"
