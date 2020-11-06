# colors
export TERM=screen-256color

function colors {
  for i in {0..255} ; do
    printf "\x1b[38;5;${i}mcolour${i}\n"
  done
  $dir/utils/color-spaces.pl
}

alias grep='grep --color=auto'
alias cgrep='grep --color=auto -C 10'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
