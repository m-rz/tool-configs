#!/usr/bin/env bash

# This script builds local Docker images for Chrome, Firefox, and Firefox with hardware acceleration,
# then assembles and creates all Distrobox containers as defined in distrobox.ini, replacing existing ones if necessary.
# This approach is required as distrobox upgrade fails with some packages for the firefox container.
# Instead, we build the images locally and then recreate the containers.

set -x
set -e

# Build the local Chrome Docker image using chrome.Dockerfile
docker build -t distrobox.local/chrome -f chrome.Dockerfile .

# Build the local Firefox Docker image using firefox.Dockerfile
#docker build -t distrobox.local/firefox -f firefox.Dockerfile .

# Build the local Firefox (hardware-accelerated) Docker image using firefox_hw.Dockerfile
#docker build -t distrobox.local/firefox_hw -f firefox_hw.Dockerfile .

# Build the local Spotify Docker image using spotify.Dockerfile
#docker build -t distrobox.local/spotify -f spotify.Dockerfile .

# Assemble and create all Distrobox containers as defined in distrobox.ini, replacing existing ones if necessary
distrobox assemble create -R --file ./distrobox.ini
