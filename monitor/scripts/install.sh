#!/usr/bin/env bash
set -e
set -u

VERSION=1.1.2
RELEASE=node_exporter-${VERSION}.linux-amd64

cd /tmp
curl -sSL https://github.com/prometheus/node_exporter/releases/download/v${VERSION}/${RELEASE}.tar.gz | tar xz
mv ${RELEASE}/node_exporter /usr/local/bin/
rm -rf ${RELEASE}

cat << "EOF" | sudo tee /etc/systemd/system/node-exporter.service
[Unit]
Description=Node-Exporter
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=always
RestartSec=1
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl restart node-exporter
sudo systemctl enable node-exporter
