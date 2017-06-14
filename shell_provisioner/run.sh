#!/bin/bash

# Shell provisioner
MODULE_PATH='/vagrant/shell_provisioner/module'
CONFIG_PATH='/vagrant/shell_provisioner/config'

# IP for the vagrant VM
GUEST_IP='10.0.0.200'

# Adding an entry here executes the corresponding .sh file in MODULE_PATH
DEPENDENCIES=(
    ubuntu
    tools
    php
    mysql
    apache
)

for MODULE in ${DEPENDENCIES[@]}; do
    source ${MODULE_PATH}/${MODULE}.sh
done