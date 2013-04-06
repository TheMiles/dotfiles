# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

# some more ls aliases
alias la='ls -A'
#alias l='ls -CF'
alias ..='cd ..'
alias ....='cd ../..'

#alias bmplayer='mplayer -af channels=6:3:0:2:1:3:0:5' 
#alias bmplayer_sdl='mplayer -vo sdl -af channels=6:2:0:2:1:3' 
#alias bmplayer_headset='mplayer -ao alsa:device=hw=2.0'
#alias bmplayer_headset_sdl='mplayer -vo sdl -ao alsa:device=hw=2.0'
#alias mplayer_sleep='mplayer  -af channels=6:2:0:3:1:3' 
#alias mplayer_sleep_playlist='mplayer  -af channels=6:2:0:3:1:3 -playlist' 
#alias sleep_timer='echo "sudo shutdown -h now "| at now + 90 minutes' 
#alias inform_de='inform (~/.inform/inform_de)'
#alias amarok_pause='dbus-send --type=method_call --dest=org.kde.amarok /Player org.freedesktop.MediaPlayer.Pause'

# apt aliases
alias acs='apt-cache search'
alias acd='apt-cache show'
alias agu='sudo apt-get update'
alias agup='sudo apt-get upgrade'
alias agc='sudo apt-get autoclean'
alias agi='sudo apt-get install'
alias agr='sudo apt-get autoremove'
