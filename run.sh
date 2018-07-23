#!/bin/sh
sudo docker exec -i testdocker /bin/sh -c 'cd /var/test_directory/answer && ./script.sh' # > script_temp
pwd
