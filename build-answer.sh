#!/bin/sh
curl $answer_path -o answer.zip
unzip -o answer.zip -d answer
sed '1c #!/bin/sh' ./answer/script.sh > ./answer/script.sh.tmp
mv ./answer/script.sh.tmp ./answer/script.sh
sudo chmod 777 ./answer/script.sh
# sudo cp -f ./src/* ./answer/src
