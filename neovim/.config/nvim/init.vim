set runtimepath^=~/.config/nvim runtimepath+=~/.config/nvim/after
let &packpath = &runtimepath

source $HOME/.config/nvim/submodules/general.vimrc
source $HOME/.config/nvim/submodules/plugins.vimrc
source $HOME/.config/nvim/submodules/pluginOpts.vimrc
source $HOME/.config/nvim/submodules/colors.vimrc
source $HOME/.config/nvim/submodules/haskell.vimrc
source $HOME/.config/nvim/submodules/ruby.vimrc " must be after haskell bc linters == {}
source $HOME/.config/nvim/submodules/ripgrep.vimrc
source $HOME/.config/nvim/submodules/mac.vimrc
