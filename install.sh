#!/bin/bash

dirpath=$(cd `dirname $0`; pwd) 

if [ ! -f "~/.gitconfig" ];then
  ln -s $dirpath/git/.gitconfig ~/.gitconfig
  echo $dirpath/git/.gitconfig
fi
