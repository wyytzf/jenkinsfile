#!/bin/sh
echo clear
sudo rm -rf *
sudo docker exec -i testdocker /bin/sh -c "rm -rf /var/test_directory"
sudo docker stop testdocker
sudo docker rm testdocker
