#!/bin/bash
echo "Going to root home..."
cd /root
echo "Installing essential packages..."
yum install -y yum-utils vim curl git file procps-ng
yum groupinstall 'Development Tools' -y
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
echo "Installing Terraform..."
yum -y install terraform
echo "Installing Kubectl..."
cd /opt/ && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256" && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"  
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)") 
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bashrc  
/home/linuxbrew/.linuxbrew/bin/brew install derailed/k9s/k9s
