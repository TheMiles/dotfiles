
# Path to your oh-my-zsh configuration.
OHZSH=$HOME/.oh-my-zsh

if [[ -d $OHZSH ]]; then 
	ZSH=$OHZSH
	# Set name of the theme to load.
	# Look in ~/.oh-my-zsh/themes/
	# Optionally, if you set this to "random", it'll load a random theme each
	# time that oh-my-zsh is loaded.
	ZSH_THEME="juanghurtado"


	# Example aliases
	# alias zshconfig="mate ~/.zshrc"
	# alias ohmyzsh="mate ~/.oh-my-zsh"

	# Set this to use case-sensitive completion
	# CASE_SENSITIVE="true"

	# Uncomment this to disable bi-weekly auto-update checks
	# DISABLE_AUTO_UPDATE="true"

	# Uncomment to change how often to auto-update? (in days)
	# export UPDATE_ZSH_DAYS=13

	# Uncomment following line if you want to disable colors in ls
	# DISABLE_LS_COLORS="true"

	# Uncomment following line if you want to disable autosetting terminal title.
	# DISABLE_AUTO_TITLE="true"

	# Uncomment following line if you want to disable command autocorrection
	# DISABLE_CORRECTION="true"

	# Uncomment following line if you want red dots to be displayed while waiting for completion
	# COMPLETION_WAITING_DOTS="true"

	# Uncomment following line if you want to disable marking untracked files under
	# VCS as dirty. This makes repository status check for large repositories much,
	# much faster.
	# DISABLE_UNTRACKED_FILES_DIRTY="true"

	# Uncomment following line if you want to the command execution time stamp shown 
	# in the history command output.
	# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
	# HIST_STAMPS="mm/dd/yyyy"

	# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
	# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
	# Example format: plugins=(rails git textmate ruby lighthouse)
	#
	if [[ -d $OHZSH/enabled_plugins ]]; then 
		
		#
		# Possibility to edit local configuration for loaded plugins
		#
		# if directory enabled_plugins exists in the oh-my-zsh folder, the filenames in this
		# directory are used as loaded plugins. Just touch/rm the plugin names in enabled_plugins
		# to add or remove them from the plugin list
		plugins=( `ls $OHZSH/enabled_plugins` )

	else

		# standard configuration on all machines withouth enabled_plugins directory in 
		# the oh-my-zsh folder
		plugins=(git)

	fi


	source $ZSH/oh-my-zsh.sh
fi


# User configuration

# Add directories to PATH variable
#
# All paths in INITPATHS are checked whether they exist on the system
# if they do they get added to the PATH variable
#
# order is from top to bottom with top coming first
MYINITPATHS=(
	"/usr/local/opt/coreutils/libexec/gnubin"
	"$HOME/bin"
	"$HOME/ext/bin"
	"$HOME/scripts"
	"/usr/local/bin"
	"/usr/bin"
	"/bin"
	"/usr/local/sbin"
	"/usr/sbin"
	"/sbin"
	"/opt/X11/bin"
	"/usr/local/CrossPack-AVR/bin"
	"/usr/texbin"
	"/usr/lib/lightdm/lightdm"
	"/usr/local/games"
	"/usr/games"
	"$HOME/ext/CodeSourcery/Sourcery_G++_Lite/bin" # i can also add some comment for this path
)

unset PATH 											# Clearing the current PATH variable
unset MYPATHSEPARATOR 								# Using a costum separator variable, empty at first, so we don't get a separator at the 
													# start of the the PATH

for p in "${MYINITPATHS[@]}" 						# Iterate over each entry in MYINITPATHS array
do
	if [[ -d $p ]]; then 							# Check if entry from MYINITPATHS exists on this system
		export PATH=$PATH$MYPATHSEPARATOR$p         # If yes add it to PATH. Also use MYPATHSEPARATOR in between current path and new entry
		MYPATHSEPARATOR=: 							# After first added entry set separator variable so it's active now
	fi
done
unset MYPATHSEPARATOR 								# clean up helper variables
unset MYINITPATHS

# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
