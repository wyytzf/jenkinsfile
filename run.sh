#!/bin/sh
sudo docker exec -i testdocker /bin/sh -c 'chmod 777 /var/test_directory/script.sh'
// image may not have bash!
sudo docker exec -i testdocker /bin/sh -c '/var/test_directory/script.sh'

