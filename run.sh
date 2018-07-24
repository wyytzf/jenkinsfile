#!/bin/sh
sudo docker exec -i testdocker /bin/sh -c 'cd /var/test_directory/ && ./script.sh' 1> script_temp
