if [[ ! "$HISTCONTROL" == *erasedups:ignoredups:ignorespace* ]]; then
	export HISTCONTROL=$HISTCONTROL:erasedups:ignoredups:ignorespace
fi
export HISTFILE="$HOME/.bash_history"
export HISTFILESIZE=3000               
export HISTSIZE=3000                   
export HOMEBREW_BIN_PATH="/opt/homebrew/bin"
export HOMEBREW_CELLAR_PATH="/opt/homebrew/Cellar"
export LESSHISTFILE="$DOTFILES/.lesshst"
export ENVS_LOCATION="$HOME/envs"
export PATH="$HOMEBREW_BIN_PATH:$PATH"
export WGETRC="$DOTFILES/.wgetrc"
export XDG_CACHE_HOME="$HOME/Library/Caches"
export XDG_DATA_HOME="$HOME/Library/Application Support"
if [ -f "/Library/Frameworks/R.framework/Resources/etc/Rprofile.site" ] && [ ! -L "/Library/Frameworks/R.framework/Resources/etc/Rprofile.site" ]; then
	ln -s "$DOTFILES/.R/Rprofile.site" "/Library/Frameworks/R.framework/Resources/etc/"
fi

# Managing various container runtimes
export HOMEBREW_DOCKER_HOST=unix:///var/run/docker.sock
export HOMEBREW_DOCKER_SOCK=/var/run/docker.sock
export PODMAN_HOST=unix://$HOME/.local/share/containers/podman/machine/podman-machine-default/podman.sock
export PODMAN_SOCK=$HOME/.local/share/containers/podman/machine/podman-machine-default/podman.sock
export COLIMA_HOST=unix://$HOME/.colima/default/docker.sock
export COLIMA_SOCK=$HOME/.colima/default/docker.sock

## Current container runtimes
export DOCKER_HOST=$COLIMA_HOST
export DOCKER_SOCK=$COLIMA_SOCK
