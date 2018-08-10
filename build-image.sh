#!/bin/sh
sudo docker run --tty --name $JOB_NAME --detach $image /bin/sh
sudo docker ps -a
sudo docker cp ./answer $JOB_NAME:/var/${JOB_NAME}_${BUILD_NUMBER}
# sudo docker exec -i testdocker /bin/sh -c "ls /var/test_directory"
