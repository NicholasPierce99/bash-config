BLACK="\001\033[0;30m\002"
BLACKB="\001\033[1;30m\002"
RED="\001\033[0;31m\002"
REDB="\001\033[1;31m\002"
GREEN="\001\033[0;32m\002"
GREENB="\001\033[1;32m\002"
YELLOW="\001\033[0;33m\002"
YELLOWB="\001\033[1;33m\002"
BLUE="\001\033[0;34m\002"
BLUEB="\001\033[1;34m\002"
PURPLE="\001\033[0;35m\002"
PURPLEB="\001\033[1;35m\002"
CYAN="\001\033[0;36m\002"
CYANB="\001\033[1;36m\002"
WHITE="\001\033[0;37m\002"
WHITEB="\001\033[1;37m\002"
RESET="\001\033[0;0m\002"

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "[$branch]"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "[$commit]"
  fi
}

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ $git_status =~ "nothing added to commit but untracked files present" ]]; then
    echo -e $YELLOW
  elif [[ $git_status =~ "no changes added to commit" ]]; then
    echo -e $YELLOW
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $RED
  elif [[ $git_status =~ "Changes to be committed" ]]; then
    echo -e $RED
   elif [[ $git_status =~ "nothing to commit, working tree clean" ]]; then
    echo -e $GREEN
  else
    echo -e $WHITE
  fi
}

export CLICOLOR=1                                                   # Allow colors
PS1=$WHITE'\D{%F %T}'                                               # Prompt: Date
PS1+=$WHITE' → '
PS1+=$CYAN'\u'$WHITE' on '$BLUE'\h'                                 # Prompt: Machine
PS1+=$WHITE' → '
PS1+=$PURPLE'[\w]'                                                  # Prompt: Directory
PS1+='$(git_color)$(git_branch)'																		# Prompt: Git
PS1+=$WHITE'\n\$ '$RESET
export PS1
export LSCOLORS=fxgxexcxbxegxgxbxbxfxf                              # Color `ls` targets
