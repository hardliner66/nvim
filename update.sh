#!/bin/bash

base_dir=$(dirname "${BASH_SOURCE[0]}")

# copy all configs into ~/.config
cp -r -f $base_dir/config/* ~/.config/

# install all vim plugins
nvim +'PackerSync' +'qa'