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
"  Plugin 'gabrielelana/vim-markdown' " Markdown syntax for github markdown files (readme.md)

 " Vim abolish for coercing between snake and camel case
 Plugin 'tpope/vim-abolish'

 " Vim repeat for tpope's plugins
 Plugin 'tpope/vim-repeat'

 " Adds auto-complete
 Plugin 'Valloric/YouCompleteMe'

 " Improves auto-indent
Plugin 'vim-scripts/indentpython.vim'

" Syntax checking
Plugin 'w0rp/ale'

" Tables
Plugin 'dhruvasagar/vim-table-mode'

" Rust syntax highlighting, formatting
Plugin 'rust-lang/rust.vim'

" Syntastic, plugin used by rust.vim for syntax checking
Plugin 'vim-syntastic/syntastic'

" Rust web playpen integration
Plugin "mattn/webapi-vim"

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
let NERDTreeShowHideen=1

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

set foldmethod=indent
set foldlevel=99
" Enable folding with spacebar
nnoremap <space> za

" Enable json formatting with ctrl+j
 map <C-f> :%!python -m json.tool<CR>

let NERDTreeIgnore=['\.pyc$', '\.swp', '\~$'] "ignore files in NERDTree

" Flake8 settings *** disabled for now ***
" autocmd BufWritePost *.py call Flake8() " run flake8 every write

" Ale configs ==========================================
let g:ale_fixers = {
	\ 'javascript': ['eslint', 'trim_whitespace', 'remove_trailing_lines'],
	\ 'python': ['autopep8', 'trim_whitespace', 'remove_trailing_lines'],
	\ 'elixir': ['mix_format', 'trim_whitespace', 'remove_trailing_lines']
\}

let g:ale_linters = {
	\ 'java': ['checkstyle']
\}


let g:OmniSharp_highlight_types = 1
let g:ale_fix_on_save = 1

" YCM Config
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1


" Turn on syntax highlighting
syntax on
colorscheme spring-night

" For plugins to load correctly
filetype plugin indent on

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
set tabstop=4
set shiftwidth=4
set softtabstop=0 noexpandtab
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

" Run rustfmt on save
let g:rustfmt_autosave = 1

" Recommended syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


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
"set t_Co=256
"set background=dark
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
" colorscheme solarized

" set up tab completion menus
set wildmode=longest,list,full
set wildmenu

" set hybrid line numbers
set number relativenumber

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END
