FROM quay.io/fedora/fedora-toolbox:41

LABEL default_tag=distrobox.local/firefox

COPY --chmod=755 firefox_kp_wrapper.sh /var/lib/flatpak/exports/bin/org.keepassxc.KeePassXC
