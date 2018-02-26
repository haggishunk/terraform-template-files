#!/usr/bin/bash

mkdir /home/${user}/certs
mv /home/${user}/${cert_name}.key /home/${user}/certs/${cert_name}.key
mv /home/${user}/${cert_name}.crt /home/${user}/certs/${cert_name}.crt

