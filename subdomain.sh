#!/bin/bash

# Color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Prompt the user for the target(s)
echo -e "${YELLOW}[*] Enter the target URL or the path to a file containing the target(s):${NC}"
read -r target_input

# Check if the input is a file or a single URL
if [[ -f "$target_input" ]]; then
    # File input: Read targets from the file
    echo -e "${YELLOW}[*] Reading targets from the file...${NC}"
    targets=$(cat "$target_input")
else
    # Single URL input
    targets="$target_input"
fi

# Subdomain enumeration using popular tools
echo -e "${YELLOW}[*] Running subdomain enumeration...${NC}"
echo -e "${YELLOW}[*] Using Amass...${NC}"
amass enum -d "$targets" -o amass.txt 2>/dev/null
echo -e "${GREEN}[+] Amass enumeration completed.${NC}"
echo -e "${YELLOW}[*] Using Sublist3r...${NC}"
sublist3r -d "$targets" -o sublist3r.txt 2>/dev/null
echo -e "${GREEN}[+] Sublist3r enumeration completed.${NC}"
echo -e "${YELLOW}[*] Using Assetfinder...${NC}"
assetfinder "$targets" > assetfinder.txt
echo -e "${GREEN}[+] Assetfinder enumeration completed.${NC}"

# Combining and filtering the results
echo -e "${YELLOW}[*] Combining and filtering results...${NC}"
cat amass.txt sublist3r.txt assetfinder.txt | sort -u > all_hosts.txt
cat all_hosts.txt | httprobe -c 50 | awk '{print $3}' > live_hosts.txt
rm amass.txt sublist3r.txt assetfinder.txt all_hosts.txt
echo -e "${GREEN}[+] Subdomain enumeration completed.${NC}"
echo -e "${GREEN}[+] Live hosts saved in live_hosts.txt.${NC}"
