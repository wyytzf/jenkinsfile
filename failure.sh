#!/bin/sh

curl -X POST \
    -F "status=5" \
    -F "msg=$LOCAL_ERROR" \
    $callback_url
