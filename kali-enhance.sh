# Update and Upgrade
sudo apt-get update -y && sudo apt-get upgrade -y

# Install Essentials
sudo apt-get install -y git vim ftp python3-pip nano tree bird6 ipcalc

# Install New Tools
sudo apt-get install -y bloodhound^ gdb gobuster istat joomscan nikto nmap padbuster payloadsalot seclists smbclient sqlmap sshpass sslscan sucrack vim windows-binaries mlocate whatweb wordlists iolists jwtcat mssql ncat oscp-pack patator php smbexec bat fd-find golang gobuster tmux atom byobhttps://github.com/Dewalt-arch/pacman-lock #macOS xfce4- panel profile-gui python-crypto screen sublime- profile-cleanup -y

# Getting better repo of Searchsploit
sudo rm -rf ~/.searchsploit/papers/
sudo rm -rf ~/.searchsploit/exploits/
sudo rm -rf ~/.searchsploit/files.csv
sudo searchsploit -u > /dev/null 2>&1
sudo chmod a+r /usr/share/exploitdb/platforms.xml
sudo mv /usr/bin/searchsploit /usr/bin/sc

# Install Go
sudo apt-get update -y
wget https://golang.org/dl/go1.17.1.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.17.1.linux-amd64.tar.gz
rm go1.17.1.linux-amd64.tar.gz
echo 'export GOROOT=/usr/local/go' >> ~/.zshrc
echo 'export GOPATH=$HOME/go' >> ~/.zshrc
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.zshrc
source ~/.zshrc

# Install Asset Finder
GO111MODULE=on go get -u -v github.com/projectdiscovery/finder/cmd/assetfinder

# Install Anew
GO111MODULE=on go get -u -v github.com/tomnomnom/anew

# Install Tomnomnom Tools
go get -v github.com/tomnomnom/fff
go get -v github.com/tomnomnom/gron
go get -v github.com/tomnomnom/meg

# Install Golang sec tools
go get github.com/golang/tools/cmd/...
go get -u github.com/securego/gosec/v2/cmd/gosec/...

# Docker
sudo apt-get remove -y docker docker-engine docker.io containerd runc
sudo apt-get update && apt-get install docker-ce docker-ce-cli containerd.io -y
sudo gpasswd -a $(whoami) docker
newgrp docker
sudo systemctl enable docker
sudo systemctl start docker

# Setup XSS-Control
mkdir ~/.BurpSuite 
wget https://the-bag.github.io/BurpSuite.XSS.Control/Paramalyzer.py -O ~/.BurpSuite/Paramalyzer.py
wget https://the-bag.github.io/BurpSuite.XSS.Control/burploader.py -O ~/.BurpSuite/burploader.py

# Update your shell startup file.
echo '[*] Updating bash,zsh,startup files.  You need to source new additions manually.'
echo '    bash: source '
echo '    zsh:  source  or add to  inside .zsh file' 
echo '' 
echo 'alias sfind="find -type f -readable -not -user root"' >> $HOME/.bashrc
echo 'alias ch="chmod 666 "'  >> $HOME/.bashrc
echo 'alias c="clear"' >> $HOME/.bashrc
echo 'function mcd() { mkdir -p $1; cd $1; pwd; }' >> $HOME/.bashrc
kubectl completion bash > .kubecomp.sh  2>/dev/null
echo 'source .kubecomp.sh' >> .bashrc
echo 'PS1="' >> .bashrc
echo 'PS1+="🔥"' >> .bashrc
echo 'PS1+="[\[\e[32m\]\T\[\e[0m\]]"' >> .bashrc
echo 'PS1+="\[\e[33m\]\w/cli\n\[\e[0m\]🚁🐳  "' >> .bashrc
                
# Changing dir_colors
echo 'DIR 01;34 # directory' >> ~/.dir_colors
echo 'LINK 01;36 # symbolic link. (If you set this to "target" instead of "link" # you will see the target file in alt.)
ORPHANS 01;31
