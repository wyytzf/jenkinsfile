#!/bin/sh
curl $answer_path -o answer.zip
unzip -o answer.zip -d answer
pwd
sed '1c #!/bin/sh' /answer/script.sh
sudo cp -f ./src/* ./answer/src
