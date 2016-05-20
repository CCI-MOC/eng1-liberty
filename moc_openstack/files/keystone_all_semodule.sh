#!/bin/bash
# This script is used to create an selinux module 
# to allow keystone to access the fernet keys

# Turns selinux to permissive mode to show all potential problems,
setenforce 0

# Perform a keystone operation
keystone token-get

# Grep /var/log/audit/audit.log for the potential keystone-all access errors
# and create an selinux module to allow access to required resources 
grep keystone-all /var/log/audit/audit.log | audit2allow -M keystone-all

# Install the selinux module
semodule -i keystone-all.pp

# Turn selinux back to enforcing
setenforce 1

# If you wish to verify the module installation,
# run: semodule -l |grep keystone-all
