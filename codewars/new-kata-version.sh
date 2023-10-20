#! /bin/zsh

#If there's any error, exit
set -e

# memorize the current directory
currentdirectory=$PWD
cd ../..

expecteddirectory=`pwd`

if [ $expecteddirectory == "/home/neyman/code/neyman-e/katare-kid/codewars" ]
then
  # Get back to where we started
  cd $currentdirectory

  # Prompt the new version name
  read -p "How do you want to name the new version? " versionname
  declare -l versionname
  versionname=$versionname

  # Check the new version number
  newversionnumber=`find lib/ -maxdepth 1 | wc -l`

  # Create both
  filename="${newversionnumber}_${versionname// /-}"
  libfile="lib/${filename}.rb"
  specfile="spec/${filename}_spec.rb"

  # Create the lib file
  cp lib/1_mine.rb $libfile
  echo "${libfile} has been created"

  # Create the spec file
  cp spec/1_mine_spec.rb $specfile

  # Substitute the first line to require the proper lib file
  var="require \"${filename}\""
  sed -i "1s/.*/$var/" $specfile
  echo "${specfile} has been created"
fi
