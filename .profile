DOTFILES_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# prompt
source $DOTFILES_DIR/utils/.git-prompt.sh
export PS1='\[\e[01;36m\]\t`if [ $? = 0 ]; then echo "\[\e[32m\] ✔ "; else echo "\[\e[31m\] ✘ "; fi`\[\e[00;37m\]\u\[\e[01;37m\]:`[[ $(git status 2> /dev/null | head -n2 | tail -n1) != "# Changes to be committed:" ]] && echo "\[\e[31m\]" || echo "\[\e[33m\]"``[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] || echo "\[\e[32m\]"`$(__git_ps1 "(%s)\[\e[00m\]")\[\e[01;34m\]\w\[\e[00m\]\$ '

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

alias cat='bat'
alias px='ps aux | grep'
alias watch="$HOME/.local/bin/watch"

export GOPATH=$HOME/go

export TODO_DB_PATH=~/Dropbox/todo.json

# bin
export PATH=$PATH:/usr/local/bin:$HOME/.local/bin
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.rvm/bin
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH=$PATH:$HOME/.platformio/penv/bin
export EDITOR=nvim
export VISUAL=nvim

# alias
alias less='less --RAW-CONTROL-CHARS'
alias log="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias t="todo"
alias vim="nvim"

# requires 10 Ctrl-d (eof) to exit to avoid closing panes in tmux
set -o ignoreeof

# git
# eval "$(hub alias -s)"
source $DOTFILES_DIR/utils/gitfuncs/gitutils.sh
source $DOTFILES_DIR/utils/git-completion.bash
source $DOTFILES_DIR/utils/colors.sh
source $DOTFILES_DIR/utils/docker.sh

