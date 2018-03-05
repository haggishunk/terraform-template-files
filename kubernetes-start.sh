#!/bin/bash

sudo kubeadm init --pod-network-cidr ${network_cidr} 
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
sudo kubectl apply -f kube-flannel.yml
sudo kubectl taint nodes --all node-role.kubernetes.io/master-
openssl x509 -pubkey \
    -in /etc/kubernetes/pki/ca.crt | openssl rsa \
    -pubin -outform der 2>/dev/null | openssl dgst \
    -sha256 -hex | sed 's/^.* //' | \
    tee ca-cert-hash

echo 'source <(kubectl completion bash)' | tee -a .bashrc
