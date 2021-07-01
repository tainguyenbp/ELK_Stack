#!/bin/bash

# We need to set the vm.max_map_count kernel parameter:
# To set this permanently, add it to /etc/sysctl.conf and reload with sudo sysctl -p

sudo sysctl -w vm.max_map_count=262144

docker-compose up  -d
