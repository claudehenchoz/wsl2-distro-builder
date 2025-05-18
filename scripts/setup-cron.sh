#!/bin/bash

# This script sets up a cron job to run the Ansible pull command daily.

# Define the cron job
CRON_JOB="0 0 * * * ansible-pull -U https://github.com/your-repo/your-playbook-repo.git -i inventory -d /path/to/ansible/pull/directory"

# Add the cron job to the crontab
(crontab -l; echo "$CRON_JOB") | crontab - 

echo "Cron job added to run Ansible pull daily."