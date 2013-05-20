# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private ext/bin if it exists
if [ -d "$HOME/ext/bin" ] ; then
    PATH="$HOME/ext/bin:$PATH"
fi
export SPEECHD_PORT=6561
export LANGUAGE="de:en_US:en"
export LC_MESSAGES="de_DE.UTF-8"
export LC_CTYPE="de_DE.UTF-8"
export LC_COLLATE="de_DE.UTF-8"
