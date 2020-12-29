#!/bin/bash
# rebind caps-lock to escape
sudo localectl set-x11-keymap de "" "nodeadkeys" caps:escape
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
./install.sh
reboot
