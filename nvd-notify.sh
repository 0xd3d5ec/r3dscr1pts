#!/bin/bash

# Check if file exists
if [ ! -f nvddata\?accept_license\=yes_modified_2021.json.gz ]; then
    # If file does not exist, create it
    curl -O https://www.nist.gov/sites/default/files/documents/industrialcontrolsystems/nvd/vuln/data-feeds/NVD-CVE-Modified.nvd_json/JNTLXb8W9zYJsbd98QjrZxd2X9b2wNfIT191/nvddata%3Faccept_license%3Dyes%26modified%3D2021.json.gz
fi

# Execute Python script
/var/www/nmap-scripts/vulscan/utilities/import_cvrf.py nvddata?accept_license=yes_modified_2021.json.gz

# then you can add this script to the crontab for automated execution at a set interval
# executes at mid-night everyday
0 0 * * * /path/to/script.sh 
