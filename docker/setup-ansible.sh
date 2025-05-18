#!/bin/bash

# Install Ansible
apt-get update && apt-get install -y ansible

# Configure Ansible pull
echo "[defaults]" > /etc/ansible/ansible.cfg
echo "inventory = /etc/ansible/hosts" >> /etc/ansible/ansible.cfg
echo "host_key_checking = False" >> /etc/ansible/ansible.cfg

# Create inventory file
echo "[local]" > /etc/ansible/hosts
echo "localhost ansible_connection=local" >> /etc/ansible/hosts

# Set up Ansible pull configuration
echo "ansible-pull -U <repository_url> -d /etc/ansible -i /etc/ansible/hosts -C <branch_name>" > /usr/local/bin/ansible-pull
chmod +x /usr/local/bin/ansible-pull

# Schedule Ansible pull using cron
echo "0 0 * * * /usr/local/bin/ansible-pull" | crontab -