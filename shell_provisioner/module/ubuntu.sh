#!/bin/bash

# Ubuntu

# Timezone
echo "Europe/Warsaw" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

# Sync package index files
apt-get update