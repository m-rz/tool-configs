# Install Firefox Locally with Hardware Acceleration

This guide describes how to install Firefox in your home directory, set up hardware acceleration (NVIDIA), and ensure all launches use the required environment variables.

## Download and Extract

Download Firefox from the official site and extract it to `~/.local/opt/firefox`:

```bash
mkdir -p ~/.local/opt/firefox
wget -O - 'https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US' | tar xJv -C ~/.local/opt/firefox --strip-components=1
```

---

## Investigate Environment Variables

Before creating the wrapper script or verifying VAAPI setup, determine the correct values for the required environment variables:

- **Find the correct DRM device:**
  ```bash
  lspci | grep NVIDIA
  ll /dev/dri/by-path
  ```
  Choose the appropriate `/dev/dri/renderD*` device for your GPU.

- **Check for NVIDIA EGL vendor file:**
  Ensure `/usr/share/glvnd/egl_vendor.d/10_nvidia.json` exists on your system.
  This file will be used for the `__EGL_VENDOR_LIBRARY_FILENAMES` variable.

- **Test VAAPI setup:**  
  After setting the environment variables, run:
  ```bash
  LIBVA_DRIVER_NAME=nvidia LIBVA_DRIVERS_PATH=/run/host/usr/lib64/dri vainfo
  ```
  to verify VAAPI configuration and driver.

---

## Create Wrapper Script

Once you have confirmed the correct values, create a wrapper script to ensure Firefox always runs with the required environment variables:

```bash
cat <<'EOF' > ~/.local/bin/firefox-env
#!/bin/bash
export MOZ_ENABLE_WAYLAND=1
export MOZ_DISABLE_RDD_SANDBOX=1
export MOZ_DRM_DEVICE=/dev/dri/renderD129   # <-- Update this if needed
export LIBVA_DRIVER_NAME=nvidia
export NVD_BACKEND=direct
export __NV_PRIME_RENDER_OFFLOAD=1
export __VK_LAYER_NV_optimus=NVIDIA_only
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export __EGL_VENDOR_LIBRARY_FILENAMES=/usr/share/glvnd/egl_vendor.d/10_nvidia.json
export LIBVA_DRIVERS_PATH=/run/host/usr/lib64/dri
export LIBVA_MESSAGING_LEVEL=1
exec ~/.local/opt/firefox/firefox "$@"
EOF

chmod +x ~/.local/bin/firefox-env
```

---

## Symlink Wrapper Script as `firefox`

To make the wrapper script available as `firefox` in your PATH, create a symlink:

```bash
ln -sf ~/.local/bin/firefox-env ~/.local/bin/firefox
```

Now, running `firefox` will use your wrapper script and always set the required environment variables.

---

## Install Icons

```bash
mkdir -p ~/.local/share/icons/hicolor/128x128/apps
cp ~/.local/opt/firefox/browser/chrome/icons/default/default128.png ~/.local/share/icons/hicolor/128x128/apps/firefox.png
```

---

## Create Desktop Entry

Create a desktop entry for Firefox at `~/.local/share/applications/firefox.desktop` that uses the wrapper script:

```bash
cat <<'EOF' > ~/.local/share/applications/firefox.desktop
[Desktop Entry]
Version=1.0
Name=Firefox Web Browser
Comment=Browse the World Wide Web
GenericName=Web Browser
Keywords=Internet;WWW;Browser;Web;Explorer
Exec=firefox %u
Icon=firefox
Terminal=false
Type=Application
Categories=Network;WebBrowser;
StartupNotify=true
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;x-scheme-handler/chrome;video/webm;application/x-xpinstall;
StartupWMClass=org.mozilla.firefox
X-MultipleArgs=false
Keywords=web;browser;internet;
Actions=NewWindow;NewPrivateWindow;ProfileManagerWindow

[Desktop Action NewWindow]
Name=Open a New Window
Exec=firefox -new-window %u

[Desktop Action NewPrivateWindow]
Name=Open a New Private Window
Exec=firefox -private-window %u

[Desktop Action ProfileManagerWindow]
Name=Open Profile Manager
Exec=firefox --ProfileManager
EOF
```

## Update Icon Cache and Desktop Database

```bash
gtk-update-icon-cache ~/.local/share/icons/hicolor
update-desktop-database ~/.local/share/applications
```

---

### Configure Hardware Acceleration in Firefox (`about:config`)

Set the following preferences:

| Preference                                    | Value  |
|-----------------------------------------------|--------|
| `gfx.webrender.all`                           | `true` |
| `dom.webgpu.enabled`                          | `true` |
| `layers.gpu-process.enabled`                  | `true` |
| `layers.mlgpu.enabled`                        | `true` |
| `media.gpu-process-decoder`                   | `true` |
| `media.ffmpeg.vaapi.enabled`                  | `true` |
| `media.hardware-video-decoding.force-enabled` | `true` |
| `widget.dmabuf.force-enabled`                 | `true` |

---

## Run Firefox

To run Firefox with the required environment variables, use:

```bash
firefox
```

This will launch Firefox with hardware acceleration enabled.

Check out a test video on YouTube to verify that hardware acceleration is working correctly:
- https://www.youtube.com/watch?v=aqz-KE-bpKQ
- https://www.youtube.com/watch?v=xNlQFJtBPM0
