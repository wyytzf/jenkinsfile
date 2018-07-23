#!/bin/sh
curl $answer_path -o answer.zip
unzip -o answer.zip -d answer
sudo chmod 777 ./answer/script.sh
sed '1c #!/bin/sh' ./answer/script.sh
sudo cp -f ./src/* ./answer/src
