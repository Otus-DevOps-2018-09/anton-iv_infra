#!/bin/bash
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install

mv /home/gceuser/puma.service /etc/systemd/system/puma.service
chown root:root /etc/systemd/system/puma.service 
chmod 664 /etc/systemd/system/puma.service
systemctl daemon-reload
systemctl enable puma.service