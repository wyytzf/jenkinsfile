#!/bin/sh

curl -X POST \
    -F "status=5" \
    -F "msg=@success" \
    $callback_url
