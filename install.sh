#!/bin/bash
source ./functions.sh

### Install Nala and configure mirrors ###

sudo apt install nala -y
sudo nala fetch

### Update and Upgrade ###

sudo nala update
sudo nala upgrade -y

###############################
### Installing deb packages ###
###############################

sudo nala install -y \
  qbittorrent \
  lxappearance \
  arandr \
  dunst \
  i3-wm \
  i3blocks \
  alacritty \
  feh \
  numlockx \
  rofi \
  fonts-firacode \
  kdeconnect \
  power-profiles-daemon \
  nodejs \
  npm \
  maven \
  mpv \
  ffmpeg \
  xbacklight \
  brightnessctl \
  jq \
  picom \
  xorg
# pavucontrol \

sudo npm install -g vtop

###############################
### Installing flatpak apps ###
###############################

echo_doing 'Install flatpak apps'

sudo nala install flatpak -y
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install -y \
  com.visualstudio.code \
  com.jetbrains.IntelliJ-IDEA-Community \
  com.stremio.Stremio \
  com.brave.Browser \
  com.discordapp.Discord \
  io.beekeeperstudio.Studio \
  com.usebruno.Bruno \
  org.kryogenix.Pick

echo_done

#############################
### Installing Noto fonts ###
#############################

echo_doing 'Install Noto fonts'

mkdir fonts && cd fonts
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Noto.tar.xz
tar -xf Noto.tar.xz
mkdir -p ~/.local/share/fonts
mv *.ttf ~/.local/share/fonts
cd .. && rm -rf ../fonts
fc-cache -f -v

echo_done

############################
### Copying config files ###
############################

echo_doing 'Copying config files'

cp -r .config ~/

echo_done
