#!/bin/bash

for file in .??*
do
  [[ "$file" == ".DS_Store" ]] && continue
  [[ "$file" == ".git" ]] && continue

  ln -s ~/dotfiles/$file ~/$file
done

