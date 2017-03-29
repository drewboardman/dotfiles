# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
bindkey -v
bindkey '^R' history-incremental-search-backward
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/drew/.zshrc'

# Cool prompt
setopt PROMPT_SUBST
PROMPT='%{$(pwd|grep --color=always /)%${#PWD}G%} %(!.%F{red}.%F{cyan})%n%f@%F{yellow}%m%f%(!.%F{red}.)%#%f '

# terminal ease
alias ll='ls -alh --color=auto'
# Git
alias gst="git status"
# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'

autoload -Uz compinit
compinit
# End of lines added by compinstall
