#!/bin/sh
job_msg=cat /homewokr-master/script_temp
curl -X POST \
    -F "status=4" \
    -F "msg=success" \
    -F "job_msg=$job_msg"\
    $callback_url
