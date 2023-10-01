#!/bin/bash

function deploy_dotfiles() {
  for file in .??*
    do
    [[ "$file" == ".DS_Store" ]] && continue
    [[ "$file" == ".git" ]] && continue

    ln -siv ~/dotfiles/$file ~/$file
  done
}

function deploy_karabiner() {
  ln -siv ~/dotfiles/karabiner/karabiner.json ~/.config/karabiner
  ln -siv ~/dotfiles/karabiner/assets/complex_modifications/*.json ~/.config/karabiner/assets/complex_modifications
}

function deploy_starship() {
  ln -siv ~/dotfiles/starship/starship.toml ~/.config
}

function deploy_vscode() {
  ln -siv ~/dotfiles/vscode/*.json ~/Library/Application\ Support/Code/User
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
  deploy_karabiner
  deploy_starship
  deploy_vscode
  echo "---- all setup end ----"
elif [ "$1" == "dotfiles" ]; then
  echo "---- dotfiles setup start ----"
  deploy_dotfiles
  echo "---- dotfiles setup end ----"
elif [ "$1" == "karabiner" ]; then
  echo "---- karabiner setup start ----"
  deploy_karabiner
  echo "---- karabiner setup end ----"
elif [ "$1" == "starship" ]; then
  echo "---- starship setup start ----"
  deploy_starship
  echo "---- starship setup end ----"
elif [ "$1" == "vscode" ]; then
  echo "---- vscode setup start ----"
  deploy_vscode
  echo "---- vscode setup end ----"
else
  echo "---- invalid argument ----"
fi
