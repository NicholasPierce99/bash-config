## Set the DOCKER_HOST and DOCKER_SOCK environment variables
set-docker-host()
{
	NEW_HOST=${1:-$COLIMA_HOST}
	NEW_SOCK=${2:-$COLIMA_SOCK}
	export DOCKER_HOST=$NEW_HOST
	export DOCKER_SOCK=$NEW_SOCK
	sed -i.sh "s#\(export DOCKER_HOST=\).*#\1$NEW_HOST#" ${3:-$HOME/.bash_profile.dir/environment_${4:-darwin}.sh}
	sed -i.sh "s#\(export DOCKER_SOCK=\).*#\1$NEW_SOCK#" ${3:-$HOME/.bash_profile.dir/environment_${4:-darwin}.sh}
}
