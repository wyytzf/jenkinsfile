#!/bin/sh
echo $env.LOCAL_ERROR
echo $callback_url
pwd
job_msg=cat /homework-master/script_temp
cat /homework-master/script_temp
curl -X POST \
    -F "status=5" \
    -F "msg=$LOCAL_ERROR" \
    -F "job_msg=$job_msg" \
    $callback_url
