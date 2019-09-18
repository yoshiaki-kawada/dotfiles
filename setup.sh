#!/bin/bash

function deploy_dotfiles() {
  for file in .??*
    do
    [[ "$file" == ".DS_Store" ]] && continue
    [[ "$file" == ".git" ]] && continue

    ln -siv ~/dotfiles/$file ~/$file
  done
}

function deploy_iterm2() {
  ln -siv ~/dotfiles/iterm2/com.googlecode.iterm2.plist ~/Library/Preferences
}

deploy_dotfiles
deploy_iterm2
