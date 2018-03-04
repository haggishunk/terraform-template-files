#!/bin/bash

set -euxo pipefail
sudo useradd -m ${user}
sudo chsh -s /bin/bash ${user}
echo '${user} ALL = (root) NOPASSWD:ALL' | sudo tee /etc/sudoers.d/${user}
sudo chmod 0440 /etc/sudoers.d/${user}
sudo mkdir $HOME/.ssh
sudo cp /root/.ssh/authorized_keys $HOME/.ssh/authorized_keys
sudo chown -R ${user}:${user} $HOME
sudo chmod 0700 $HOME/.ssh
sudo chmod  600 $HOME/.ssh/authorized_keys

echo "" | sudo tee -a /etc/ssh/sshd_config
echo "permitRootLogin no" | sudo tee -a /etc/ssh/sshd_config
sudo systemctl restart sshd
