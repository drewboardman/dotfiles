" NerdTree config
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['.bundle', '.git']
map <silent> <Leader>nt :NERDTreeToggle<CR>
map <silent> <Leader>nf :NERDTreeFind<CR>

" Syntastic syntax configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_tex_checkers = ['lacheck']

" Search dotfiles (defaults to False)
let g:ctrlp_show_hidden = 1
"
" Better CtrlP visibility
highlight CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
