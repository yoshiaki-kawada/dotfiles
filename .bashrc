alias ls='ls -G'
alias ll='ls -l'
alias la='ls -a'

alias be='bundle exec'

alias rs='rails s'
alias rc='rails c'

alias ga='git add'
alias gco='git commit'
alias gl='git log'
alias gd='git diff'
alias gs='git status'
alias gp='git pull'
alias gb='git branch'
alias gch='git checkout'

alias d='docker'
alias dc='docker-compose'
alias ds='docker-sync'
alias dss='docker-sync-stack'

function title {
  echo -ne "\033]0;"$*"\007"
}

