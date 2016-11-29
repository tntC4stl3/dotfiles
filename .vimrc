" tntC4stl3 <blackhumour.gj@gmail.com>
" http://tntcastle.net

" ===============================================================================
" Info
"   leader: default is `\`, detailed with `:help <leader>`
" ===============================================================================


" vundle
set nocompatible  " required
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My Vundles here

" Nav / tabs
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" search
Plugin 'kien/ctrlp.vim'

" python syntax check / highlight
Plugin 'scrooloose/syntastic'       " systastic
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/indentpython.vim'

" auto-completion stuff
Plugin 'Valloric/YouCompleteMe'     " auto complete

" code folding
Plugin 'tmhedberg/SimpylFold'

" display
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

" git
Plugin 'tpope/vim-fugitive'

" statusbar
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

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
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" default settings
set encoding=utf-8
set nu  " show the line number

" tmhedberg/SimpylFold
let g:SimpylFold_docstring_preview=1

" Valloric/YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" change color scheme
call togglebg#map("<F5>")
if has('gui_running')
    set background=dark
    colorscheme solarized
else 
    colorscheme zenburn
endif


" Nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.egg$', '^\.git$']
" close vim if the only window left open is a NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" s/v split screen to open file
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'v'

" Set the default file encoding to UTF-8:

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Tab and Indent
set smarttab  " insert tabs on the start of a line according to shiftwidth, not tabstop
set smartindent


au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=4 |
    \ set shiftwidth=2 |

" mark extra whitespace as bad, and probably color it red
"highlight BadWhitespace ctermbg=red guibg=red
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Search
set hlsearch  " Highlight the search result
set incsearch  " Real-time search
set ignorecase  " Ignore case sensitive
set smartcase  " Still case sensitive when have one or more upper character
set showmatch  " When a bracket is inserted, briefly jump to the matching one

" Display set ruler  " Show the current cursor position
set showcmd  " Show the inputting command in bottom
set showmode  " Show current VIM mode
set splitbelow  " split panes to bottom
set splitright  " split panes to right

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Map ; to : and save a million keystrokes
nnoremap ; :

" Other
set nobackup  " no backup behavior
set history=2000  " Numbers of commands want to remember
set backspace=indent,eol,start  " Configure backspace so it acts as it should act

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" airline
set laststatus=2    " fix vim-airline doesn't appear until create new split
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"let g:airline#extensions#tabline#enabled = 1
