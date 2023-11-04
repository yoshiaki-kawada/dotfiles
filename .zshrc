eval "$(rbenv init -)"
eval "$(starship init zsh)"

# ------------------------------
# alias
# ------------------------------
alias ls='lsd --group-dirs=last'
alias ll='ls -l --total-size'
alias la='ls -A'
alias lla='ll -A'

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

# ------------------------------
# Zinit
# ------------------------------
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# シンタックスハイライト
zinit light zsh-users/zsh-syntax-highlighting

# 入力補完
zinit light zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'
zinit light zsh-users/zsh-completions
