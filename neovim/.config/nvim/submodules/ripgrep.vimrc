" This replaces ag.vim, which is deprecated.
" You need to use ack.vim with the :Ack command
" Also need to install ripgrep
let g:ackprg = 'rg --hidden --vimgrep --no-heading --smart-case --glob "!.git/*"'

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack! <cword><cr>

" This tell ctrlp to use rg as well
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --hidden --smart-case --glob "!.git/*"'
  let g:ctrlp_use_caching = 0
endif
