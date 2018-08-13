#!/bin/sh
#sudo docker exec -i $JOB_NAME /bin/sh -c "npm install -g jasmine --save-dev"
sudo docker exec -i $JOB_NAME /bin/sh -c "cd /var/${JOB_NAME}_${BUILD_NUMBER}/ && ./script.sh" 1 > script_temp
