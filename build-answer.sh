#!/bin/sh
curl $answer_path -o answer.zip
unzip -o answer.zip -d __answerBranch
# bash替换成sh
sed '1c #!/bin/sh' ./__answerBranch/script.sh > ./__answerBranch/script.sh.tmp
mv ./__answerBranch/script.sh.tmp ./__answerBranch/script.sh
sudo chmod 777 ./__answerBranch/script.sh
# 不同技术栈执行不同方法
if [[ "$(echo $image | grep "node")" != "" ]]
then
  # sudo cp -f ./main/* ./answer/main
  echo "In order to be compatible with the old version, please write 'rm -rf spec \n mv ./__answerBranch/spec ./spec' in your script file"
  sudo cp -rf ./ ../answer_temp
  sudo cp -rf ../answer_temp ./answer
else
  echo "not node"
fi
if [[ "$(echo $image | grep "java")" != "" ]]
then
  sudo cp -rf ./__answerBranch ./answer
  sudo cp -rf ./src/main/* ./answer/src/main
else
  echo "not java"
fi
