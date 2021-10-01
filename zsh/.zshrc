# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# This changes the theme when you're ssh'ed - that way you won't accidentally
# do something stupid
if [[ -n $SSH_CLIENT || -n $REMOTEHOST ]] then
  ZSH_THEME="agnoster"
else
  ZSH_THEME="gentoo"
fi

plugins=(bundler git vi-mode)

source $ZSH/oh-my-zsh.sh

# ssh stuff
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Arch has a package called keychain, but this keychain doesn't work
eval $(keychain --eval --agents ssh -Q --quiet id_rsa work --nogui)

## Without keychain
# if ! pgrep -u "$USER" ssh-agent > /dev/null; then
#     ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
# fi
# if [[ ! "$SSH_AUTH_SOCK" ]]; then
#     eval "$(<"$XDG_RUNTIME_DIR/ssh-agent.env")"
# fi

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=$HOME/.zsh_history

# common binaries path
# export PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH="$HOME/bin:$PATH"

# Haskell/Stack packages installation dir
export PATH="$HOME/.local/bin:$PATH"
# Haskell/cabal packages installation dir
export PATH="$HOME/.cabal/bin:$PATH"
# Haskell/ghcup directory
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

# export TERM=xterm-256color
# export TERM=rxvt-unicode-256color

# DIRCOLORS
eval `dircolors $HOME/.dir_colors/dircolors.ansi-dark`

# ------ alias -------
alias ll="ls -latrhF"
alias grep="rg"
alias code="cd $HOME/code"
alias startvpn="cd /etc/openvpn && sudo openvpn --config /etc/openvpn/US\ East.ovpn --auth-user-pass /etc/openvpn/login.txt --dev tun1"
alias i3lock="i3lock -i ~/Pictures/wallpaper.png"
alias restartpulse="pulseaudio -k && pulseaudio --start && i3-msg restart"
alias path="tr : $'\n' <<<$(echo $PATH)"
alias vim="NVIM_COC_LOG_LEVEL=debug nvim"
alias setcaps="setxkbmap -option && setxkbmap -option caps:escape"

# ------ docker -------
function rmcontainers { sudo docker rm $(sudo docker ps -a -f status=exited -q) }
function rmimages { sudo docker rmi $(sudo docker images -a -q) $(sudo docker images -f "dangling=true" -q) }

# ------ FZF stuff --------
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Use better defaults
# export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# these arent' working on the newest version
# export FZF_DEFAULT_COMMAND='fd --type f -H  --color=never'
# export FZF_ALT_C_COMMAND='fd -H --type d . --color=never'

# Re-bind CTRL_T to CTRL_P
bindkey -r '^T'
bindkey '^P' fzf-file-widget

# ruby stuff
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
