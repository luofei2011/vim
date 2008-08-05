set nocompatible

set guifont=Consolas:h9
colorscheme cthulhian
syntax on
filetype plugin on
filetype indent on

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

" Remove trailing whitespace when writing out c files.
autocmd FileType c,cpp autocmd BufWritePre <buffer> :%s/\s\+$//e

" A more descriptive status line that includes line ending and file type.
set statusline=%F\ %m%=%{&ff}\ %y\ b%n\ @\ %v,%l/%L\ 

" Load system headers and out of home links.
set path=.,/usr/include,~/include,,

" Googley c indentation.
set cino=(0g1h1

