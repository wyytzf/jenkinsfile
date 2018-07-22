#!/bin/sh
curl ${params.answer_path} -o answer.zip
unzip -o answer.zip -d answer
sudo cp -f ./src/* ./answer/src
