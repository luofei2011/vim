" Add to ~/_gvimrc on Windows:
" source ~/vimfiles/joey.gvimrc

set vb t_vb=

" Proggy Tiny (slashes zero) from http://proggyfonts.com/
colorscheme cthulhian
if has('gui_win32')
  set guifont=ProggyTinyTTSZ:h12:cANSI
  "set guifont=ProggyTiny:h8:cANSI
elseif has('gui_mac')
  set guifont=ProggyTinyTTSZ:h16
endif
runtime joey_color_adjust.vimrc
" In gui mode, use Ctrl-S to save.
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

" Disable toolbar, scrollbars, tabber.
set guioptions=gm
