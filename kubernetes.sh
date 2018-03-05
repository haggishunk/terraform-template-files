#!/bin/bash

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    sudo apt-key add -
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install docker-ce
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | \
    sudo apt-key add -
echo 'deb http://apt.kubernetes.io/ kubernetes-xenial main' | \
    sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get -y update
sudo apt-get -y install \
    kubeadm=${kube_version}-00 \
    kubelet=${kube_version}-00 \
    kubectl=${kube_version}-00
wget https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
echo 'source <(kubectl completion bash)' | tee -a .bashrc
