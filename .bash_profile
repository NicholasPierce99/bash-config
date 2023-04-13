if [ -f ~/.bash_profile.dir/environment.sh ]; then
    . ~/.bash_profile.dir/environment.sh
fi

if [ -f $DOTFILES/.bash_profile.dir/aliases.sh ]; then
    . $DOTFILES/.bash_profile.dir/aliases.sh
fi

if [ -f $DOTFILES/.bash_profile.dir/conda.sh ]; then
    . $DOTFILES/.bash_profile.dir/conda.sh
fi

if [ -f $DOTFILES/.secure/.bash_profile.dir/secure.sh ]; then
    . $DOTFILES/.secure/.bash_profile.dir/secure.sh
fi

if [ -f $DOTFILES/.bash_profile.dir/terminal.sh ]; then
    . $DOTFILES/.bash_profile.dir/terminal.sh
fi

for FILE in $DOTFILES/.bash_tools/*
do
	. $FILE
done
