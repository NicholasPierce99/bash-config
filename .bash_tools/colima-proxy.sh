## Setup container run time for colima with proxies
colima-proxy()
{
	colima stop
	set-proxy
	set-docker-host $COLIMA_HOST $COLIMA_SOCK
	colima start
}
