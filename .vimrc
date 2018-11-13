" -------------------------------------------------------
" *****************Vundle Start**************************
" -------------------------------------------------------
" scriptencoding utf8
" set encoding=utf8
set nocompatible              " Don't try to be vi compatible
filetype off                  " Helps force plugins to load correctly when it is turned back on below

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'scrooloose/nerdtree'  

" Autocomplete for python
" Add --go-compiler to install.py in ~/.vim/bundle/YouCompleteMe to add go
" support
 Plugin 'fatih/vim-go' " Adds golang support, :GoBuild, :GoInstall, :GoTest, syntax highlight etc...
 Plugin 'nvie/vim-flake8' " Python syntax checker, F7 to run on .py file
 Plugin 'gabrielelana/vim-markdown' " Markdown syntax for github markdown files (readme.md)
 Plugin 'w0ng/vim-hybrid' " vim colorscheme

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" -----------------------------------------------------------
" ***********************Vundle End**************************
" -----------------------------------------------------------

" Map NerdTree Toggle to Ctrl + n
map <C-n> :NERDTreeToggle<CR>
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
" NerdTree ignore *.pyc files
let NERDTreeIgnore = ['\.pyc$']
" Format JSON
map <C-j> :%!python -m json.tool<CR>
let @j = '%s/u''/"/ge | %s/''/"/ge | %s/None/"None"/ge | %s/False/"False"/ge | %s/True/"True"/ge'

" Flake8 settings
autocmd BufWritePost *.py call Flake8() " run flake8 every write

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
let mapleader = "\<Space>"

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
" colorscheme solarized
