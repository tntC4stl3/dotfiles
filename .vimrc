" tntC4stl3 <blackhumour.gj@gmail.com>
" http://tntcastle.net

" ===============================================================================
" General Configuration
" ===============================================================================

set nocompatible  " Use the vim's keyboard setting, not vi

if filereadable(expand("~/.vim/vimrc.vundle"))
    source ~/.vim/vimrc.vundle
endif

set nu  " show the line number
syntax on  " Syntax highlighting
filetype on  " File type detection
filetype plugin on  " Allow filetype plugin
filetype indent on  " Use different indent for different filetype

" Tab and Indent
set tabstop=4  " set the width of <Tab> to 4 spaces
set softtabstop=4  "remove 4 spaces in each backspace
set shiftwidth=4  " spaces in each indent
set smarttab  " insert tabs on the start of a line according to shiftwidth, not tabstop
set expandtab  " use space to instead of tab
set autoindent  " Use the indent of the previous line for a new line.
set smartindent

" Search
set hlsearch  " Highlight the search result
set incsearch  " Real-time search
set ignorecase  " Ignore case sensitive
set smartcase  " Still case sensitive when have one or more upper character
set showmatch  " When a bracket is inserted, briefly jump to the matching one

" Display
set ruler  " Show the current cursor position
set showcmd  " Show the inputting command in bottom
set showmode  " Show current VIM mode


" Other
set nobackup  " no backup behavior
set history=2000  " Numbers of commands want to remember
set backspace=indent,eol,start  " Configure backspace so it acts as it should act

" Enhancement
filetype plugin indent on  " required

" FileType Settings
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
