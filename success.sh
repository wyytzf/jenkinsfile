#!/bin/sh
job_msg=$(cat ${JOB_NAME}_${BUILD_NUMBER}/script_temp)
curl -X POST \
    -F "status=2" \
    -F "msg=success" \
    -F "job_msg=$job_msg"\
    -F "buildNumber=${BUILD_NUMBER}" \
    $callback_url
