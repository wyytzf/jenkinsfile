#!/bin/sh
#Deprecated
echo clear
sudo rm -rf *
#pwd
#ls -al
sudo docker stop $JOB_NAME
sudo docker rm $JOB_NAME
