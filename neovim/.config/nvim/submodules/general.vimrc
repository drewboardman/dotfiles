let mapleader="\<space>"

nnoremap <Leader>fs :w<CR>
nnoremap <Leader>ws :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Use italics
highlight Comment cterm=italic

set noswapfile    " swaps annoying
set hlsearch
set backspace=2   " Backspace deletes like most programs in insert mode
set ignorecase
set smartcase
set history=50
set scrolloff=5
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

" Quicker window movement (testing intero bindings)
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

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Markdown specific stuff
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown tw=150 fo+=t textwidth=80

