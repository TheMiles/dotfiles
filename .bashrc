# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#xterm-color)
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#    ;;
#*)
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#    ;;
#esac

# Comment in the above and uncomment this below for a color prompt
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

export EDITOR="subl -w"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    export PATH=~/bin:"${PATH}"
fi
# set PATH so it includes user's private bin if it exists
if [ -d ~/ext/bin ] ; then
    export PATH=~/ext/bin:"${PATH}"
fi
# set PATH so it includes user's .kde/bin if it exists
if [ -d ~/.kde/bin ] ; then
    export PATH=~/.kde/bin:"${PATH}"
fi

# set PATH so it includes user's scripts if it exists
if [ -d ~/scripts ] ; then
    export PATH="${PATH}":~/scripts
fi

# set PATH so it includes CodeSourgery
if [ -d ~/ext/CodeSourcery/Sourcery_G++_Lite/bin ] ; then
	export PATH="${PATH}":~/ext/CodeSourcery/Sourcery_G++_Lite/bin
fi

# add homebrew coreutils path
if [ -d /usr/local/opt/coreutils/libexec/gnubin ] ; then
    export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
fi
if [ -d /usr/local/opt/coreutils/libexec/gnuman ] ; then
    export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
fi

# set DEVKITPRO variable
if [ -d ~/Projekte/DS/devkitARM ] ; then
    export DEVKITPRO=~/Projekte/DS/devkitARM
fi

# add CrossPack AVR Development
if [ -d /usr/local/CrossPack-AVR/bin ] ; then
    export PATH="$PATH:/usr/local/CrossPack-AVR/bin"
fi



# adding homebrew stuff
if [ -f ~/.homebrewrc ] ; then
    . ~/.homebrewrc
fi

# export for sourceforge cvs access
export CVS_RSH=ssh

# virtual box usb stuff
VBOX_USB=usbfs

# ProjectM settings
export LD_LIBRARY_PATH=/home/miles/ext/lib/



[ -f ~/.fzf.bash ] && source ~/.fzf.bash
