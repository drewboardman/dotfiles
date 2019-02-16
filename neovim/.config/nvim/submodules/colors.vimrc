if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" Cool Colors
syntax enable
set t_Co=256
let g:rehash256 = 1
colorscheme jellybeans

set background=dark

" Make it obvious where 80 characters is
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" Override shitty jellybean highlight colors
hi Search ctermfg=LightYellow
hi Search ctermbg=Magenta
