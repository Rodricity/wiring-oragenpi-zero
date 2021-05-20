#!/bin/bash

check_git_clone() {
  if [ $? != 0 ]; then
    echo "failed."
    echo ""
    echo "================================================================================"
    echo "FATAL: Cloning libWiringPi failed."
    echo "Please check install.log and fix any problems. If you're still stuck,"
    echo "then please open a new issue then post all the output and as many details as you can to"
    echo "  https://github.com/orangepi-xunlong/wiringOP/issues"
    echo "================================================================================"
    echo ""
    exit 1
  fi
}

rm ./install.log 2>/dev/null 1>&2

echo -n "Cloning libWiringOP ... "
rm -Rf ./wiringOP 2>/dev/null 1>&2
git clone https://github.com/orangepi-xunlong/wiringOP.git > ./install.log 2>&1
check_git_clone
echo "done."

echo -n "Making libWiringPi ... "
cd wiringOP
./build clean >> ./install.log 2>&1
./build >> ./install.log 2>&1
echo "done."

echo "Enjoy !"
