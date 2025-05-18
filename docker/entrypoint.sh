#!/bin/bash

set -e

# Initialize the environment
echo "Initializing WSL2 Distro Environment..."

# Run the setup script for Ansible
if [ -f /setup-ansible.sh ]; then
    echo "Setting up Ansible..."
    /setup-ansible.sh
else
    echo "Setup script for Ansible not found!"
    exit 1
fi

# Execute Ansible pull to apply configurations
echo "Running Ansible pull..."
ansible-pull -U https://github.com/your-repo/your-playbooks.git -i inventory -d /etc/ansible/pull

# Keep the container running
tail -f /dev/null