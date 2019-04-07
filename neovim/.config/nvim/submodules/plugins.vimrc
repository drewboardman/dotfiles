" ---------- Start Vundle Block --------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

" VIM
Plugin 'mileszs/ack.vim'
Plugin 'lifepillar/vim-mucomplete'
Plugin 'vim-airline/vim-airline'
Plugin 'gmarik/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-commentary'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'sbdchd/neoformat'
Plugin 'w0rp/ale'
Plugin 'godlygeek/tabular'
Plugin 'christoomey/vim-tmux-navigator'

" Haskell
Plugin 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
Plugin 'neovimhaskell/haskell-vim'
Plugin 'alx741/vim-stylishask'

call vundle#end()            " required
filetype plugin indent on    " required
" ---------- End Vundle Block --------------

