" This replaces ag.vim, which is deprecated.
" You need to use ack.vim with the :Ack command
" Also need to install ripgrep
let g:ackprg = 'rg --vimgrep --no-heading'

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" This tell ctrlp to use rg as well
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" better performance
set wildignore+=*/.git/*,*/tmp/*,*.swp,*/dist/*,*/dist-newstyle/*,*/.stack-work/*,*/.idea/*
