#! /bin/zsh

set -e
cd /home/neyman/code/neyman-e/katare-kid/codewars
read -p "What is the level of the kata?" level
folderlevel="${level}kyu"
cd $folderlevel
newfoldernumber=`find -maxdepth 1 -type d | wc -l`
read -p "What's the name of the kata?" kataname
declare -l kataname
kataname=$kataname
if [ $newfoldernumber -ge 10 ]
then
  foldername="${newfoldernumber}-${kataname// /-}"
else
  foldername="0${newfoldernumber}-${kataname// /-}"
fi
mkdir $foldername
cp -r /home/neyman/code/neyman-e/katare-kid/codewars/kata-template/* $foldername
cd $foldername
code ../..
