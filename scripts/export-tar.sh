#!/bin/bash

# Define the output tar file name
OUTPUT_TAR="wsl2-distro.tar"

# Check if the Docker image exists
if [ "$(docker images -q wsl2-distro:latest 2> /dev/null)" == "" ]; then
    echo "Docker image wsl2-distro:latest does not exist. Please build the image first."
    exit 1
fi

# Create a temporary directory to export the filesystem
TEMP_DIR=$(mktemp -d)

# Run the Docker container and export the filesystem
docker run --rm --name wsl2-distro-export -v "$TEMP_DIR:/output" wsl2-distro:latest /bin/bash -c "tar -cvf /output/$OUTPUT_TAR /"

# Check if the tar file was created successfully
if [ -f "$TEMP_DIR/$OUTPUT_TAR" ]; then
    echo "WSL2 distro exported successfully as $TEMP_DIR/$OUTPUT_TAR"
else
    echo "Failed to export WSL2 distro."
    exit 1
fi

# Clean up the temporary directory
rm -rf "$TEMP_DIR"