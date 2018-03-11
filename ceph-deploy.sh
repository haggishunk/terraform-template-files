#!/bash/bin

# declare monitor nodes
ceph-deploy new ${mon-nodes}

# install ceph on all nodes
ceph-deploy install ${all-nodes}

# Specify public/cluter networks
echo "public network = ${pub-cidr}" >> ceph.conf
echo "cluster network = ${clu-cidr}" >> ceph.conf

# initialize monitor node(s)
ceph-deploy mon create-initial

# distribute config & admin key to nodes
ceph-deploy admin ${all-nodes}

# initialize osd nodes
ceph-deploy osd create ${osd-nodes}

# setup port 80 to serve Rados Object Storage Gatwway
echo "[client.rgw.${rgw-node}]" >> ceph.conf
echo "rgw_frontends = \"civetweb port=80\"" >> ceph.conf
echo "rgw dns name = \"${domain}\"" >> ceph.conf

# Create rgw node
ceph-deploy --overwrite-conf rgw create ${rgw-node}
