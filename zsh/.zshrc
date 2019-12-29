# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

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

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# load rbenv at shell start
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH

# Haskell/Stack packages installation dir
export PATH="$HOME/.local/bin:$PATH"

# export TERM=xterm-256color
# export TERM=rxvt-unicode-256color

# need rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# DIRCOLORS
eval `dircolors $HOME/.dir_colors/dircolors.ansi-dark`

# ------ alias -------
alias ll="ls -latrhF"
alias grep="rg"
alias code="cd $HOME/code"
alias startvpn="cd /etc/openvpn && sudo openvpn --config /etc/openvpn/US\ East.ovpn --auth-user-pass /etc/openvpn/login.txt --dev tun1"
alias screen="xrandr --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal --output eDP-1 --off"
alias restartpulse="pulseaudio -k && pulseaudio --start && i3-msg restart"
alias path="tr : '\n' <<<$PATH"
alias vim="nvim"
alias setcaps="setxkbmap -option && setxkbmap -option caps:escape"
alias aws-sso="aws-google-auth -d 43200 -ak"

# ------ docker -------
function rmcontainers { sudo docker rm $(sudo docker ps -a -f status=exited -q) }
function rmimages { sudo docker rmi $(sudo docker images -a -q) $(sudo docker images -f "dangling=true" -q) }

# ------ FZF stuff --------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Use better defaults
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_COMMAND='fd --type f -H  --color=never'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd -H --type d . --color=never'

# Re-bind CTRL_T to CTRL_P
bindkey -r '^T'
bindkey '^P' fzf-file-widget

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
