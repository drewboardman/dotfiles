" NerdTree config
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['.bundle', '.git']
map <silent> <Leader>nt :NERDTreeToggle<CR>
map <silent> <Leader>nf :NERDTreeFind<CR>

" Search dotfiles (defaults to False)
let g:ctrlp_show_hidden = 1

" enable MUcomplete
set completeopt+=menuone

" fugitive
cnoreabbrev gst Gstatus
cnoreabbrev commit Gcommit

" ale
let g:ale_set_highlights = 0 " Disable highlights
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_sign_error = '💩'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1

" gitgutter
let g:gitgutter_signs = 1
map <silent> <Leader>gt :GitGutterSignsToggle<CR>
