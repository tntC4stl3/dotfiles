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


" ===============================================================================
" Vunble Configuration
" ===============================================================================
set nocompatible    " be iMproved, required
filetype off        " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My Vundles here
"
" Display
"Plugin 'powerline/powerline'        " status bar display enhancement
Plugin 'vim-airline/vim-airline'    " Status bar display enhancement 
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/rainbow_parentheses.vim'   " Parentheses display enhancement
Plugin 'altercation/vim-colors-solarized'   " theme solarized

Plugin 'scrooloose/syntastic'       " systastic

" Nav
Plugin 'scrooloose/nerdtree'

" Python
Plugin 'nvie/vim-flake8'


" All of your Plugins mus be added before the following line
call vundle#end()           " required
filetype plugin indent on   " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins: append `!` to update or just :PluginUpdate
" :PLuginSearch foo - searches for foo; append `!` to refresh local cache
" :Pluginclean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ------------------------------------------------------------------------------
" Nerdtree
" ------------------------------------------------------------------------------
map <C-n> :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.egg$', '^\.git$']
" close vim if the only window left open is a NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" s/v split screen to open file
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'v'

" ------------------------------------------------------------------------------
" vim-airline/vim-airline
" ------------------------------------------------------------------------------
"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif
"let g:airline_left_sep = '▶'
"let g:airline_left_alt_sep = '❯'
"let g:airline_right_sep = '◀'
"let g:airline_right_alt_sep = '❮'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'

" ------------------------------------------------------------------------------
" kien/rainbow_parentheses.vim
" ------------------------------------------------------------------------------
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
