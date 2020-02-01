set nocompatible              " be iMproved, required
filetype off                  " required

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align

Plug 'vim-ruby/vim-ruby'
" VIM
Plug 'mileszs/ack.vim'
" Plug 'lifepillar/vim-mucomplete'
Plug 'vim-airline/vim-airline'
Plug 'gmarik/Vundle.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-commentary'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'sbdchd/neoformat'
Plug 'w0rp/ale'
Plug 'godlygeek/tabular'
Plug 'christoomey/vim-tmux-navigator'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Haskell
" Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
Plug 'neovimhaskell/haskell-vim'
" Plug 'bitc/vim-hdevtools'
Plug 'jaspervdj/stylish-haskell'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()
