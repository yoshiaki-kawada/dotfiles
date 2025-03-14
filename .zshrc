eval "$(starship init zsh)"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

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
alias gpl='git pull'
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
# history
# ------------------------------
# 履歴ファイルの保存先
HISTFILE=~/.zsh_history
# メモリに保存される履歴の件数
HISTSIZE=100000
# 履歴ファイルに保存される履歴の件数
SAVEHIST=100000

# コマンド履歴ファイルを共有する
setopt share_history
setopt inc_append_history
# 直前と同じコマンドの場合は履歴に追加しない
setopt hist_ignore_dups
# 重複するコマンドは古い方を削除する
setopt hist_ignore_all_dups
# 余分な空白は詰めて記録する
setopt hist_reduce_blanks

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

# ------------------------------
# peco
# ------------------------------
# コマンド履歴検索
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^R' peco-select-history

# ディレクトリ移動
if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
  autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
  add-zsh-hook chpwd chpwd_recent_dirs
  zstyle ':completion:*' recent-dirs-insert both
  zstyle ':chpwd:*' recent-dirs-default true
  zstyle ':chpwd:*' recent-dirs-max 1000
  zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/chpwd-recent-dirs"
fi
function peco-cdr () {
  local selected_dir="$(cdr -l | sed 's/^[0-9]* *//' | peco)"
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
}
zle -N peco-cdr
bindkey '^U' peco-cdr
