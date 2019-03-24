" NerdTree config
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['.bundle', '.git']
map <silent> <Leader>nt :NERDTreeToggle<CR>
map <silent> <Leader>nf :NERDTreeFind<CR>

" Search dotfiles (defaults to False)
let g:ctrlp_show_hidden = 1

" enable MUcomplete
set completeopt+=menuone
