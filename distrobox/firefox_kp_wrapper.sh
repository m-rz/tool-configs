#!/bin/sh
distrobox-host-exec /usr/bin/flatpak run --command=keepassxc-proxy org.keepassxc.KeePassXC "$@"
