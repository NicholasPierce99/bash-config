function mkvenv() { 
	if [ -z "$1" ]
	then
		python3 -m virtualenv .venv
	else
		export VENV=$1 && python3 -m virtualenv $ENVS_LOCATION/$VENV
	fi
}
