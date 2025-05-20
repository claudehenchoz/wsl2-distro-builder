#!/bin/bash

# Only show this message for root user
if [ "$(id -u)" -eq 0 ]; then
    if [ ! -f /etc/wsl-setup-complete ]; then
        echo "This appears to be the first time you've launched this WSL distribution."
        echo "We'll now set up a user account for you."
        echo ""
    fi
fi
