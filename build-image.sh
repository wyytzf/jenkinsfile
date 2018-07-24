#!/bin/sh
sudo docker run --tty --name $image --detach $image
sudo docker ps -a
sudo docker cp ./answer $image:/var/test_directory
# sudo docker exec -i testdocker /bin/sh -c "ls /var/test_directory"
