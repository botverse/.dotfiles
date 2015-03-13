#!/bin/bash

files=(vimrc tmux.conf xbindkeysrc profile)

dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

for i in "${files[@]}"; do
  if [ -e ~/.$i ]
  then
    echo "error file .$i exists";
  else
    echo "writing .$i";
    echo "source ${dir}/.$i" > ~/.$i;
  fi
done

