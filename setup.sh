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

function deploy_vscode() {
  ln -siv ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User
  ln -siv ~/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User
}

function install_vscode_extentions() {
  cat ./vscode/extensions | while read line
  do
    code --install-extension $line
  done
}

deploy_dotfiles
deploy_iterm2
deploy_vscode
install_vscode_extentions
