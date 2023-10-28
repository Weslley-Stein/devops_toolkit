#!/bin/bash
echo "Going to root home..."
cd /root
echo "Installing essential packages..."
yum install -y yum-utils vim curl git make
echo "Installing Go Toolkit..."
yum module install go-toolset
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
echo "Installing Terraform..."
yum -y install terraform
echo "Installing Kubectl..."
cd /opt/ && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256" && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
echo "Installing k9s..."
cd /opt && git clone https://github.com/derailed/k9s && cd k9s && make build && ./execs/k9s
