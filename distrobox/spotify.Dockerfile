FROM quay.io/toolbx/ubuntu-toolbox:24.04

LABEL default_tag=distrobox.local/spotify

RUN apt-get update && apt-get install -y curl gpg
RUN curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
RUN echo 'deb https://repository.spotify.com stable non-free' | tee /etc/apt/sources.list.d/spotify.list
