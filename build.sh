#!/bin/bash

# Check if the version string is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <versionString>"
    exit 1
fi

# Store the version string from the argument
versionString="$1"

# Step 1: Create or modify the Dockerfile
echo "FROM nextcloud:$versionString
RUN apt-get update && apt-get install -y smbclient ffmpeg
RUN apt-get upgrade -y" > Dockerfile

# Step 2: Build and tag the Docker image
docker build -t hendrikwdev/nextcloud-ffmpeg:$versionString .

# Step 3: Tag the created Docker image with 'latest'
docker tag hendrikwdev/nextcloud-ffmpeg:$versionString hendrikwdev/nextcloud-ffmpeg:latest

# Step 4: Push to docker registry
docker push hendrikwdev/nextcloud-ffmpeg:$versionString
docker push hendrikwdev/nextcloud-ffmpeg:latest