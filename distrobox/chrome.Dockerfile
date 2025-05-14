FROM ghcr.io/ublue-os/fedora-toolbox:latest

LABEL default_tag=distrobox.local/chrome

RUN dnf install -y fedora-workstation-repositories
RUN dnf config-manager setopt google-chrome.enabled=1
