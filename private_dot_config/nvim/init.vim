set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
" set autoindent              " indent a new line the same amount as the line just typed
set smartindent 
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
" set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set laststatus=1
" set spell                 " enable spell check (may need to download
" language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

" set breakindent
set showbreak=↪

set relativenumber 			" set up relative line number

" set keybidnings 
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$

" set texwidth=80            " set hard wrap 

call plug#begin()
" Plugin Section
" Plug 'dracula/vim'
" Plug 'ryanoasis/vim-devicons'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'scrooloose/nerdtree'
" Plug 'preservim/nerdcommenter'
" Plug 'mhinz/vim-startify'
" Plug 'joshdick/onedark.vim'
Plug 'arzg/vim-colors-xcode'
Plug 'ellisonleao/glow.nvim'
Plug 'ThePrimeagen/vim-be-good'
Plug 'mlr-msft/vim-loves-dafny', {'for': 'dafny'}
Plug 'easymotion/vim-easymotion'
" Plug 'Chiel92/vim-autoformat'
call plug#end()

" dark scheme 
" colorscheme onedark
set termguicolors
colorscheme xcodedarkhc

filetype plugin indent on

" for python support 
let g:python3_host_prog="/Users/flicker_soul/.pyenv/shims/python3"

lua require('knap')

" load packer (which is useless)
lua require('plugins')

" setup indent 
lua require('syntax')

" setup bottom bar 
lua require('bottom_bar')

" latex config 
" let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0  " hide errors 
" set conceallevel=1
" let g:tex_conceal='abdmg'

