#!/bin/bash

# Only show this message for root user
if [ "$(id -u)" -eq 0 ]; then
    if [ ! -f /etc/wsl-setup-complete ]; then
        echo "This appears to be the first time you've launched this WSL distribution."
        echo "We'll now set up a user account for you."
        echo ""

        /usr/local/bin/wsl-setup
        echo "Setup complete! You can now use this WSL distribution."
        echo "Next time you open this WSL distribution, you'll be logged in as the new user."
    fi
fi
