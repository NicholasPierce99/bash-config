export DISPLAY=:0
export FZF_LOCATION="/home/linuxbrew/.linuxbrew/opt/fzf"
if [[ ! "$HISTCONTROL" == *erasedups:ignoredups:ignorespace* ]]; then
	export HISTCONTROL=$HISTCONTROL:erasedups:ignoredups:ignorespace
fi
export HISTFILE="$HOME/.bash_history"
export HISTFILESIZE=3000               
export HISTSIZE=3000                   
export LESSHISTFILE="$DOTFILES/.lesshst"
export WGETRC="$DOTFILES/.wgetrc"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
