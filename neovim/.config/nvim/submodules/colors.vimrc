if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" Allow dem pretty colors
let s:truecolor=($COLORTERM == "truecolor")

if s:truecolor
  set termguicolors
endif

" Cool Colors
syntax enable
set t_Co=256
let g:rehash256 = 1
colorscheme jellybeans

set background=dark

" Make line numbers a bit more visible with a color matching jellybeans
highlight linenr guifg=179 guifg=#fad07a

" Make the status bar and tabline look nicer
highlight StatusLine ctermbg=238 ctermfg=112 guibg=#404040 guifg=#b0cc55
highlight StatusLineNC ctermfg=249 guifg=#909090
highlight TabLine ctermbg=238 ctermfg=249 guibg=#404040  guifg=#909090
highlight TabLineSel ctermbg=238 ctermfg=112 guibg=#404040 guifg=#b0cc55

" Make it obvious where 80 characters is
highlight ColorColumn guibg=darkmagenta guifg=white
call matchadd('ColorColumn', '\%81v', 100)

" Override shitty jellybean highlight colors
highlight Search cterm = None guifg=black guibg=burlywood

" Make the colors look nicer in the terminal, if supported.
if s:truecolor || has('gui_running')
  " Normal Colors
  let g:terminal_color_0  = '#000000' " black
  let g:terminal_color_1  = '#cf6a4c' " red
  let g:terminal_color_2  = '#99ad6a' " green
  let g:terminal_color_3  = '#fad07a' " yellow
  let g:terminal_color_4  = '#7aa6da' " blue
  let g:terminal_color_5  = '#c397d8' " magenta
  let g:terminal_color_6  = '#70c0ba' " cyan
  let g:terminal_color_7  = '#dddddd' " white

  " Bright colors
  let g:terminal_color_8  = '#666666'  " black
  let g:terminal_color_9  = '#cc3334'  " red
  let g:terminal_color_10 = '#9ec400' " green
  let g:terminal_color_11 = '#e7c547' " yellow
  let g:terminal_color_12 = '#7aa6da' " blue
  let g:terminal_color_13 = '#b77ee0' " magenta
  let g:terminal_color_14 = '#54ced6' " cyan
  let g:terminal_color_15 = '#ffffff' " white
endif

" Better CtrlP visibility
highlight CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
