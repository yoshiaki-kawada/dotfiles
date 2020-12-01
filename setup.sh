#!/bin/bash

function deploy_dotfiles() {
  for file in .??*
    do
    [[ "$file" == ".DS_Store" ]] && continue
    [[ "$file" == ".git" ]] && continue

    ln -siv ~/dotfiles/$file ~/$file
  done
}

function deploy_vscode() {
  ln -siv ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User
  ln -siv ~/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User
  install_vscode_extentions
}

function install_vscode_extentions() {
  cat ./vscode/extensions | while read line
  do
    code --install-extension $line
  done
}

if [ "$1" == "all" ]; then
  echo "---- all setup start ----"
  deploy_dotfiles
  deploy_vscode
  echo "---- all setup end ----"
elif [ "$1" == "dotfiles" ]; then
  echo "---- dotfiles setup start ----"
  deploy_dotfiles
  echo "---- dotfiles setup end ----"
elif [ "$1" == "vscode" ]; then
  echo "---- vscode setup start ----"
  deploy_vscode
  echo "---- vscode setup end ----"
else
  echo "---- invalid argument ----"
fi
