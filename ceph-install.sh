#!/bin/bash
wget -q -O- 'https://download.ceph.com/keys/release.asc' | sudo apt-key add -
echo deb https://download.ceph.com/debian/ $(lsb_release -sc) main | sudo tee /etc/apt/sources.list.d/ceph.list
# future improvment to replace above command
# sudo add-apt-repository \
#     "deb [arch=amd64] https://download.ceph.com/debian \
#     $(lsb_release -cs) \
#     main"
sudo apt-get -y update
sudo apt-get -y install ceph-deploy
sudo apt-get -y install jq

if [[ ! -f /home/${user}/.ssh/id_rsa.pub ]]; then
    ssh-keygen -t rsa -b 4096 -f /home/${user}/.ssh/id_rsa -N '' -C '' 
    cat /home/${user}/.ssh/id_rsa.pub | tee -a /home/${user}/.ssh/authorized_keys
fi
