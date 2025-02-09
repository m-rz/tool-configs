FROM distrobox.local/firefox

LABEL default_tag=distrobox.local/firefox_hw

# executed here so it is not done on container start (init hook)
RUN dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
