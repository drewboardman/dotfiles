let mapleader="\<space>"
nnoremap <Leader>fs :w<CR>
" highlight and remove whitespace
" autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
" autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/
" highlight ExtraWhitespace ctermbg=red guibg=red
" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
nnoremap <Leader>ws :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Background color issue
" set term=screen-256color
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" Markdown specific stuff
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown tw=150 fo+=t textwidth=80

" Use italics
highlight Comment cterm=italic

set noswapfile    " swaps annoying
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

" /target has nonsense in it
set wildignore+=*/target/*

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Numbers
set number
set numberwidth=5

" ---------- Start Vundle Block --------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'rking/ag.vim'
Plugin 'gmarik/Vundle.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-commentary'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'w0rp/ale'
Plugin 'autozimu/LanguageClient-neovim'

call vundle#end()            " required
filetype plugin indent on    " required
" ---------- End Vundle Block --------------

" NerdTree config
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['.bundle', '.git']
map <silent> <Leader>nt :NERDTreeToggle<CR>
map <silent> <Leader>nf :NERDTreeFind<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Tab completion
"   " will insert tab at beginning of line,
"     " will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Syntastic syntax configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_tex_checkers = ['lacheck']

" --------------- HASKELL SECTION ---------------------
"  HIE
set rtp+=~/.vim/pack/XXX/start/LanguageClient-neovim
let g:LanguageClient_serverCommands = { 'haskell': ['hie-wrapper'] }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
map <Leader>lk :call LanguageClient#textDocument_hover()<CR>
map <Leader>lg :call LanguageClient#textDocument_definition()<CR>
map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
map <Leader>lb :call LanguageClient#textDocument_references()<CR>
map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>
"  HSImport

" autocmd FileType haskell nmap <silent> <F1> :silent update <bar> HsimportModule<CR>
" autocmd FileType haskell nmap <silent> <F2> :silent update <bar> HsimportSymbol<CR>

" " Align 'then' two spaces after 'if'
" let g:haskell_indent_if = 2
" " Indent 'where' block two spaces under previous body
" let g:haskell_indent_before_where = 2
" " Allow a second case indent style (see haskell-vim README)
" let g:haskell_indent_case_alternative = 1
" " Only next under 'let' if there's an equals sign
" let g:haskell_indent_let_no_in = 0

" " ----- hindent & stylish-haskell -----

" " Indenting on save is too aggressive for me
" let g:hindent_on_save = 0

" " Helper function, called below with mappings
" function! HaskellFormat(which) abort
"   if a:which ==# 'hindent' || a:which ==# 'both'
"     :Hindent
"   endif
"   if a:which ==# 'stylish' || a:which ==# 'both'
"     silent! exe 'undojoin'
"     silent! exe 'keepjumps %!stylish-haskell'
"   endif
" endfunction

" " Key bindings
" augroup haskellStylish
"   au!
"   " Just hindent
"   au FileType haskell nnoremap <leader>hi :Hindent<CR>
"   " Just stylish-haskell
"   au FileType haskell nnoremap <leader>hs :call HaskellFormat('stylish')<CR>
"   " First hindent, then stylish-haskell
"   au FileType haskell nnoremap <leader>hf :call HaskellFormat('both')<CR>
" augroup END

" " ----- w0rp/ale -----

" let g:ale_linters = {}
" let g:ale_linters.haskell = ['stack-ghc-mod', 'hlint']

" ----- parsonsmatt/intero-neovim -----

" Prefer starting Intero manually (faster startup times)
let g:intero_start_immediately = 1
" Use ALE (works even when not using Intero)
let g:intero_use_neomake = 0

augroup interoMaps
  au!

  au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>
  au FileType haskell nnoremap <silent> <leader>iov :InteroOpen<CR><C-W>H
  au FileType haskell nnoremap <silent> <leader>ih :InteroHide<CR>
  au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
  au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>

  au FileType haskell nnoremap <silent> <leader>wr :w \| :InteroReload<CR>
  au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
  au FileType haskell nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>

  au FileType haskell map <leader>t <Plug>InteroGenericType
  au FileType haskell map <leader>T <Plug>InteroType
  au FileType haskell nnoremap <silent> <leader>it :InteroTypeInsert<CR>

  au FileType haskell nnoremap <silent> <leader>jd :InteroGoToDef<CR>
  au FileType haskell nnoremap <silent> <leader>iu :InteroUses<CR>
  au FileType haskell nnoremap <leader>ist :InteroSetTargets<SPACE>
augroup END

" Cool Colors
syntax enable
set t_Co=256
let g:rehash256 = 1
" colorscheme atom-dark-256
" colorscheme molokai
" colorscheme dracula
colorscheme jellybeans

" colorscheme solarized
set background=dark
" needs to come AFTER background set
" highlight Comment ctermfg=DarkMagenta

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Make it obvious where 80 characters is
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

