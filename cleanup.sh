#!/bin/sh
echo clear
sudo rm -rf *
sudo docker exec -i $JOB_NAME /bin/sh -c "rm -rf /var/${JOB_NAME}_${BUILD_NUMBER}"
sudo docker stop $JOB_NAME
sudo docker rm $JOB_NAME
