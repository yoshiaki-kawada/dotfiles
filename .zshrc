eval "$(rbenv init -)"
eval "$(starship init zsh)"

alias ls='ls -G'
alias ll='ls -l'
alias la='ls -a'

alias be='bundle exec'

alias rs='rails s'
alias rc='rails c'

alias ga='git add'
alias gco='git commit'
alias grs='git reset --soft HEAD^'
alias grh='git reset --hard HEAD^'
alias gb='git branch'
alias gch='git checkout'
alias gp='git pull'
alias gps='git push'
alias gr='git rebase'
alias gl='git log'
alias gd='git diff'
alias gs='git status'

alias d='docker'
alias dc='docker-compose'
alias ds='docker-sync'
alias dss='docker-sync-stack'
alias mc='mutagen-compose'

function title {
  echo -ne "\033]0;"$*"\007"
}
