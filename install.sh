#!/usr/bin/env bash

if command -v freebsd-version; then
  echo "Starting the installation."
else
  echo "This script only supports FreeBSD."
fi

echo "Do you want to install bash config? (y/N)"
read $BASHCONF
if [ "$BASHCONF" = "y" ]; then
  echo "Installing beubash. (A tool like oh-my-bash.)"
  sudo pkg install -y bash git
  curl https://raw.githubusercontent.com/Quitaxd/beubash/main/install.sh | sh
fi

#########################################

echo "Do you want to install i3,alacritty,vim config and themes? (y/N)"
read $I3CONF
if [ "$I3CONF" = "y" ]; then
  sudo pkg install -y nitrogen i3 polybar rust
  cp="cp -r"
  mkdir ~/{.vim,.icons,.config,.themes}
  $cp ./dot_vimrc ~/.vimrc/
  $cp ./dot_vim/* ~/.vim/
  $cp ./dot_icons/* ~/.icons/
  $cp ./dot_config/* ~/.config/
  $cp ./dot_themes/* ~/.themes/
  $cp ./dot_xinitrc ~/.xinitrc
  $cp ./dot_tmux ~/.tmux
  $cp ./dot_tmux.conf ~/.tmux.conf
fi

echo "Installation has been completed."
