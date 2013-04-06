Tracking for your configuration files
========================================

Here I track some of the config files I use in my `$HOME`.

Also included is a script that deals with updating the files, it is mainly taken from a very similar project: [durdn/cfg][https://github.com/durdn/cfg]

The idea is to keep the config files in a separate directory `.dotfiles` and create symlinks in `$HOME`. 

Install 
-------------------

Just run the following line from a shell

	curl -Lks https://raw.github.com/themiles/dotfiles/master/update.sh | bash

This gets the update script, which will produce the `~/.dotfile` directory and try to clone the repository to this folder. 
After cloning/updating the contained files are "installed", meaning
* check whether file already exists
* make backup of the file to `~/.dotfile_backup`.
* create symlink from repo directory to home directory
