#!/bin/bash

# Set the name of the Docker image
IMAGE_NAME="wsl2-distro-builder"

# Build the Docker image using Podman
podman build -t $IMAGE_NAME ./docker

# Check if the build was successful
if [ $? -ne 0 ]; then
    echo "Docker image build failed."
    exit 1
fi

# Create a container from the image
CONTAINER_ID=$(podman create $IMAGE_NAME)

# Export the container to a tar file
podman export $CONTAINER_ID -o wsl2-distro.tar

# Check if the export was successful
if [ $? -ne 0 ]; then
    echo "Exporting the container to tar file failed."
    exit 1
fi

# Clean up the container
podman rm $CONTAINER_ID

echo "WSL2 distro built and exported successfully as wsl2-distro.tar."