#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y tmux blueman dex-autostart sway waybar ulauncher dunst  wlogout  xdg-desktop-portal-wlr  network-manager-applet pasystray fuzzel zile wdisplays swayidle wob syncthing telnet kitty btrbk wl-mirror kanshi quickemu autofs bubblewrap wtype open-eid gocryptfs fuse3 fuse3-libs python3-amd-debug-tools

# install emacs, but omit info (because otherwise the build fails)
dnf5 install -y emacs emacsclient --exclude=info

# install dank material shell
dnf copr enable -y avengemedia/dms
dnf install -y dms niri python3-vdirsyncer khal python3-aiohttp-oauthlib adw-gtk3-theme qt6ct


# Install Google Chrome (downloads RPM directly from Google)
dnf5 install -y https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
