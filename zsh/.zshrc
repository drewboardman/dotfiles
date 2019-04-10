# Path to your oh-my-zsh installation.
export ZSH=/Users/drew.boardman/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
if [[ -n $SSH_CLIENT || -n $REMOTEHOST ]] then
  ZSH_THEME="agnoster"
else
  ZSH_THEME="gentoo"
fi

plugins=(bundler git vi-mode)

source $ZSH/oh-my-zsh.sh

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true" # Uncomment the following line to change how often to auto-update (in days).  # export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="false"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# User configuration

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"
# load rbenv at shell start
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH

# Haskell packages
# export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/.cabal/bin:${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.ghcup/env:$PATH"

# export TERM=xterm-256color
# export TERM=rxvt-unicode-256color

# need rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# jumpdev stuff
alias proxypull="docker pull docker.werally.in/chopshop/playproxy"
alias tunnel="ssh -L 18000:connect-postgres.connect-dev.werally.in:5432 jumpdev"
# Rally connect env vars for play proxy
export SERVICE_LOCATOR_CONVENTION_SCHEME=dns
export SERVICE_LOCATOR_CONVENTION_DNS_PATTERN=http://connect.localhost:9001

# Example aliases
alias ll="ls -latrhF"
alias grep="rg"
alias pj="cd $HOME/projects"
alias startvpn="cd /etc/openvpn && sudo openvpn --config /etc/openvpn/US\ East.ovpn --auth-user-pass /etc/openvpn/login.txt --dev tun1"
alias screen="xrandr --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal --output eDP-1 --off"
alias restartpulse="pulseaudio -k && pulseaudio --start && i3-msg restart"
alias path="tr : '\n' <<<$PATH"
alias vim="nvim"
alias dota="setxkbmap -option && setxkbmap -option caps:none && xmodmap -e 'keycode 66=F13'"
alias undota="setxkbmap -option && setxkbmap -option caps:escape"

function rmcontainers { sudo docker rm $(sudo docker ps -a -f status=exited -q) }
function rmimages { sudo docker rmi $(sudo docker images -a -q) $(sudo docker images -f "dangling=true" -q) }

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Use better defaults
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_COMMAND='fd --type f -H  --color=never'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd -H --type d . --color=never'
# Re-bind CTRL_T to CTRL_P
bindkey -r '^T'
bindkey '^P' fzf-file-widget
export PATH="/usr/local/sbin:$PATH"
