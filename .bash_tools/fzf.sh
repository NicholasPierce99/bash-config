#!/bin/bash
# Environment
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPS="--extended"
export FZF_BIN_PATH="$HOMEBREW_BIN_PATH/fzf"
export FZF_CELLAR_PATH="$HOMEBREW_CELLAR_PATH/fzf"
export FZF_VERSION="$(read -r FZF_VERSION _ <<< $(fzf --version) && echo $FZF_VERSION)"

# Auto-completion
[[ $- == *i* ]] && source "$FZF_CELLAR_PATH/$FZF_VERSION/shell/completion.bash" 2> /dev/null

# Key bindings
source "$FZF_CELLAR_PATH/$FZF_VERSION/shell/key-bindings.bash"

# OS Dependent
if [[ "$OSTYPE" = "darwin"* ]]; then
	export FZF_DEFAULT_COMMAND="fd --type f"
elif [[ "$OSTYPE" = "linux-gnu" ]]; then
	export FZF_DEFAULT_COMMAND="fdfind --type f"
fi

