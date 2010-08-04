" On Windows, source ~/vimfiles/joey.vimrc
" On Unix, source ~/.vim/joey.vimrc
set nocompatible

syntax on
filetype plugin on
filetype indent on

" Always default to unix line ending.
set ffs=unix,dos

" Turn off infernal beeping.
" This is reset when gui starts, so set again in gvimrc.
set vb t_vb=

set hlsearch
set incsearch
set ignorecase

set ruler
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
set laststatus=2

set showmatch
set autoindent
set smartindent
set expandtab
set shiftwidth=2
set softtabstop=2
set nowrap
set bs=2

" When compiling, save files automatically.
set autowrite

" Completion help above command line... try it out for now.
set wildmenu

" A more descriptive status line that includes line ending and file type.
set statusline=%f\ %m%=%{&ff}\ %y\ b%n\ @\ %v,%l/%L\ 

" Support actionscript file type.
au BufNewFile,BufRead *.as   setf actionscript
au BufNewFile,BufRead *.atl  setf atlas

" Remove trailing whitespace when writing out code files.
au FileType c,cpp,actionscript,erlang,python autocmd BufWritePre <buffer> :%s/\s\+$//e

" Force cindent when editing actionscript.
au FileType actionscript set cindent
set path=.,/usr/include,~/include,,

" Googley c indentation.
set cino=(0g1h1

fun! FullScreen()
  set columns=320
  set lines=115
  winpos -1 44
endf

fun! MyRc()
  tabe ~/.vimrc
  vsplit ~/.vim/joey.vimrc
endf

nmap <S-F1> :call FullScreen()<CR>
nmap <S-F2> :call MyRc()<CR>

" Set current window to 80-column width.
nmap <C-8> 80<C-W><Bar>

" Save out current session after saving all files.
nmap <F2> :wa<Bar>exe "mksession! " . v:this_session<CR>
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,resize,winsize

" Browse for files.
nmap <F5> :NERDTreeToggle<CR>

" Easier compilation.
nmap <F8> :make<CR>

" Note - paste command buffer: use ":p
" Paste yank into command: <C-R>"

" Correct typos.
ia clinet client
ia comomn common
ia flahs flash
ia flase false
ia improt import
ia namesapce namespace
