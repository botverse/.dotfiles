# prompt
dir=~/.dotfiles
export PS1='\[\e[01;36m\]\t`if [ $? = 0 ]; then echo "\[\e[32m\] ✔ "; else echo "\[\e[31m\] ✘ "; fi`\[\e[00;37m\]\u\[\e[01;37m\]@$(hostname):`[[ $(git status 2> /dev/null | head -n2 | tail -n1) != "# Changes to be committed:" ]] && echo "\[\e[31m\]" || echo "\[\e[33m\]"``[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] || echo "\[\e[32m\]"`$(__git_ps1 "(%s)\[\e[00m\]")\[\e[01;34m\]\w\[\e[00m\]\$ '

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

#docker
removecontainers() {
    docker stop $(docker ps -aq)
    docker rm $(docker ps -aq)
}
armageddon() {
    removecontainers
    docker network prune -f
    docker rmi -f $(docker images --filter dangling=true -qa)
    docker volume rm $(docker volume ls --filter dangling=true -q)
    docker rmi -f $(docker images -qa)
}

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias cat='batcat'
alias px='ps aux | grep'
alias watch="$HOME/.local/bin/watch"

export GOPATH=$HOME/go
export DENO_INSTALL="$HOME/.deno"

export TODO_FORMAT=pretty
export TODO_DB_PATH=~/Dropbox/todo.json
# bin
export PATH=$PATH:/usr/local/bin:$HOME/.local/bin:/opt/homebrew/bin
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.rvm/bin
export PATH=$PATH:$HOME/.yarn/bin
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
alias px='ps aux | grep'
alias watch="$HOME/.local/bin/watch"


# git
# eval "$(hub alias -s)"
source $dir/utils/gitfuncs/gitutils.sh

