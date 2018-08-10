#!/bin/sh
echo $env.LOCAL_ERROR
echo $callback_url
job_msg=$(cat ${JOB_NAME}_${BUILD_NUMBER}/error_temp)

curl -X POST \
    -F "status=0" \
    -F "msg=$LOCAL_ERROR" \
    -F "job_msg=$job_msg" \
    -F "buildNumber=${BUILD_NUMBER}" \
    $callback_url
