#!/bin/sh
curl $answer_path -o answer.zip
unzip -o answer.zip -d answer
# bash替换成sh
sed '1c #!/bin/sh' ./answer/script.sh > ./answer/script.sh.tmp
mv ./answer/script.sh.tmp ./answer/script.sh
sudo chmod 777 ./answer/script.sh
# 不同技术栈执行不同方法
sudo cp -f ./src/* ./answer/src
if [[ $image == *"node"* ]]
then
  echo "node"
fi
if [[ $image == *"java"* ]]
then
  echo "java"
fi
