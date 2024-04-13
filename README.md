### Initial config ###

##########################
# Add user to sudoers group
###########################

su
apt install sudo -y
/usr/sbin/adduser <username >sudo
# Exit and logout

#####################################
### Install GIT and download repo ###
#####################################

sudo apt install git -y
git clone https://github.com/vinibortoletto/debian-i3-dotfiles.git#

# Fix Natural Scrolling
## Edit 40-libinput.conf and add Option "NaturalScrolling" "True" to the Identifiers bellow:

```bash 
sudo nano /usr/share/X11/xorg.conf.d/40-libinput.conf
```

```bash 
libinput pointer catchall
```

```bash 
libinput touchpad catchall
```# debian-i3-dotfiles
