## Setup container run time for colima without proxies
colima-no-proxy()
{
	colima stop
	rmenv
	set-docker-host $COLIMA_HOST $COLIMA_SOCK
	colima start
}
