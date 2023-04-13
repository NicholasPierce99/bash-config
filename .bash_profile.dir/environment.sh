#!/bin/bash

# DOTFILES Dependent
export DOTFILES="$HOME"
export CONDARC="$DOTFILES/.condarc"
export IPYTHONDIR="$DOTFILES/.ipython"
export JUPYTER_CONFIG_DIR="$DOTFILES/.jupyter"
export KAGGLE_CONFIG_DIR="$DOTFILES/.secure/.kaggle"
export PYTHONSTARTUP="$DOTFILES/.python/startup.py"
export R_PROFILE="$DOTFILES/.R/Rprofile.site"
export R_PROFILE_USER="$DOTFILES/.R/.Rprofile"
export XDG_CONFIG_HOME="$DOTFILES"

# OS Dependent
if [[ "$OSTYPE" = "darwin"* ]]; then
	if [ -f $DOTFILES/.bash_profile.dir/environment_darwin.sh ]; then
		. $DOTFILES/.bash_profile.dir/environment_darwin.sh
	fi

elif [[ "$OSTYPE" = "linux-gnu" ]]; then
	if [ -f $DOTFILES/.bash_profile.dir/environment_linux-gnu.sh ]; then
		. $DOTFILES/.bash_profile.dir/environment_linux-gnu.sh
	fi

fi

# XDG_CONFIG Dependent
#export NPM_CONFIG_GLOBALCONFIG="$DOTFILES/.npm/npmrc"
#export NPM_CONFIG_PREFIX="$XDG_CONFIG_HOME/.npm"
#export NPM_CONFIG_CACHE="$XDG_CACHE_HOME"
export NEOVIM_VIRTUALENV="$HOME/nvim/env"
export NVIM_LOG_FILE="$HOME"
[[ ":$PATH:" != *":$NEOVIM_VIRTUALENV/bin:"* ]] && PATH="${PATH}:$NEOVIM_VIRTUALENV/bin"
export VIM_PLUGGED="$HOME/nvim/plugged"

# Load Secrets
if [ -d "$DOTFILES/.secrets" ]; then
	for ENV_FILE in "$DOTFILES"/.secrets/*; do
		export $(echo $(cat $ENV_FILE | sed 's/#.*//g'| xargs) | envsubst)
	done
fi

# NVM
export NVM_DIR="$DOTFILES/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
