# prompt
source ~/.git-prompt.sh
export PS1='\[\e[01;30m\]\t`if [ $? = 0 ]; then echo "\[\e[32m\] ✔ "; else echo "\[\e[31m\] ✘ "; fi`\[\e[00;37m\]\u\[\e[01;37m\]:`[[ $(git status 2> /dev/null | head -n2 | tail -n1) != "# Changes to be committed:" ]] && echo "\[\e[31m\]" || echo "\[\e[33m\]"``[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] || echo "\[\e[32m\]"`$(__git_ps1 "(%s)\[\e[00m\]")\[\e[01;34m\]\w\[\e[00m\]\$ '

# nvm
[ -s "$HOME/.nvm/nvm.sh" ] && . "$HOME/.nvm/nvm.sh"

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# colors
export TERM=xterm-256color
function colors {
  for i in {0..255} ; do
    printf "\x1b[38;5;${i}mcolour${i}\n"
  done
}

# bin
export PATH="/usr/local/bin:$HOME/.local/bin:$PATH:$HOME/Projects/3Dify/bin"
export PATH=/Developer/NVIDIA/CUDA-6.5/bin:$PATH
export PATH="$PATH:$HOME/.rvm/bin"

# lib
export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-6.5/lib:$DYLD_LIBRARY_PATH

# alias
alias less='less --RAW-CONTROL-CHARS'
alias ccat='pygmentize -g'
