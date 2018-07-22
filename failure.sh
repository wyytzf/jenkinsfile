#!/bin/sh
echo $env.LOCAL_ERROR
echo $callback_url
curl -X POST \
    -F "status=5" \
    -F "msg=$LOCAL_ERROR" \
    $callback_url
