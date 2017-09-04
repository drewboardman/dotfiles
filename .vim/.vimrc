" highlight and remove whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
nnoremap <Leader>ws :%s/\s\+$//e<CR>

set backspace=2   " Backspace deletes like most programs in insert mode
set hlsearch
set ignorecase
set smartcase
set history=50
set ruler         " show the cursor position all the time
set laststatus=2  " Always display the status line
set statusline+=%F

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Make it obvious where 80 characters is
" highlight ColorColumn ctermbg=magenta
" call matchadd('ColorColumn', '\%81v', 100)

" Numbers
set number
set numberwidth=5

" ---------- Start Vundle Block --------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'

call vundle#end()            " required
filetype plugin indent on    " required
" ---------- End Vundle Block --------------

" NerdTree config
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['.bundle', '.git']
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Syntastic syntax configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_tex_checkers = ['lacheck']

" Cool Colors
syntax enable
set t_Co=256
let g:rehash256 = 1
" colorscheme atom-dark-256
" colorscheme molokai

colorscheme solarized
set background=dark
" needs to come AFTER background set
" highlight Comment ctermfg=DarkMagenta

" Background color issue
set term=screen-256color
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif
