#!/bin/bash

# concatenate ssh config defs to ~/.ssh/config
cat ~/*.ssh.config | tee ~/.ssh/config

# append hosts to /etc/hosts file
cat ~/hosts_file | sudo tee -a /etc/hosts
