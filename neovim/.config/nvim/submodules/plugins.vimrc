" ---------- Start Vundle Block --------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'mileszs/ack.vim'
Plugin 'lifepillar/vim-mucomplete'
Plugin 'vim-airline/vim-airline'
Plugin 'gmarik/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-commentary'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
Plugin 'neovimhaskell/haskell-vim'
Plugin 'sbdchd/neoformat'
Plugin 'alx741/vim-stylishask'
Plugin 'w0rp/ale'
Plugin 'godlygeek/tabular'

call vundle#end()            " required
filetype plugin indent on    " required
" ---------- End Vundle Block --------------

