" -------------------------------------------------------
" *****************Vundle Start**************************
" -------------------------------------------------------
set encoding=UTF-8
set nocompatible              " Don't try to be vi compatible
filetype off                  " Helps force plugins to load correctly when it is turned back on below

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Ack search tool for vim
Plugin 'mileszs/ack.vim'

" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'scrooloose/nerdtree'

" Fuzzy finder
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" Autocomplete for python
" Add --go-compiler to install.py in ~/.vim/bundle/YouCompleteMe to add go
" support
Plugin 'fatih/vim-go' " Adds golang support, :GoBuild, :GoInstall, :GoTest, syntax highlight etc...
Plugin 'nvie/vim-flake8' " Python syntax checker, F7 to run on .py file

" Vim abolish for coercing between snake and camel case
Plugin 'tpope/vim-abolish'

" Git wrapper inside vim
Plugin 'tpope/vim-fugitive'

" Enables :GBrowse redirect to Github in fugitive
Plugin 'tpope/vim-rhubarb'

" Vim repeat for tpope's plugins
Plugin 'tpope/vim-repeat'

" TabNine code autocompleter
" Plugin 'codota/tabnine-vim'

 " Improves auto-indent
Plugin 'vim-scripts/indentpython.vim'

" Syntax checking
Plugin 'dense-analysis/ale'

" Markdown tables
Plugin 'dhruvasagar/vim-table-mode'

" Rust syntax highlighting, formatting
Plugin 'rust-lang/rust.vim'

" Rust go to definition
Plugin 'racer-rust/vim-racer'

" Toml syntax support
Plugin 'cespare/vim-toml'

" Terraform HCL and JSON syntax highlighting for *.tf, *.tfvars, *.tfstate
" files
Plugin 'hashivim/vim-terraform'

" Typescript syntax
Plugin 'leafgarland/typescript-vim'

" JSX-in-typescript syntax
Plugin 'peitalin/vim-jsx-typescript'

" Elixir syntax
Plugin 'elixir-editors/vim-elixir'

" RoR syntax and tooling
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'

" Icons for filetype indicators in nerdtree
Plugin 'ryanoasis/vim-devicons'

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
let NERDTreeShowHidden=1
let NERDTreeWinSize=45

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" NERDTrees File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

autocmd VimEnter * call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('sass', 'cyan', 'none', 'cyan', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('rb', 'Red', 'none', 'cyan', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('tsx', 'Red', 'none', '#ffa500', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('zshrc', 'Gray', 'none', '#686868', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('vimrc', 'Gray', 'none', '#686868', '#151515')

" Use https://github.com/ggreer/the_silver_searcher as Ack program
let g:ackprg = 'ag --nogroup --nocolor --column'

set foldmethod=indent
set foldlevel=99
" Enable folding with spacebar
nnoremap <space> za

" Enable FZF search with file preview using CTRL+f, ignoring files that are in
" .gitignore, but including untracked files in the repo
map <C-f> :GFiles --exclude-standard --others --cached<Enter>

" Open FZF Buffers with CTRL+l
map <C-b> :Buffers<Enter>

let NERDTreeIgnore=['\.pyc$', '\.swp', '\~$'] "ignore files in NERDTree

" Ale configs ==========================================
let g:ale_linter_aliases = {'typescriptreact': ['typescript']}

let g:ale_linters = {
	\ 'java': ['checkstyle'],
    \ 'typescript': ['prettier', 'tsserver', 'eslint']
\}

let g:ale_fixers = {
    \ '*': ['trim_whitespace', 'remove_trailing_lines'],
    \ 'css': ['prettier'],
	\ 'elixir': ['mix_format'],
    \ 'html': ['prettier'],
	\ 'javascript': ['prettier', 'eslint'],
    \ 'json': ['prettier'],
    \ 'markdown': ['prettier'],
	\ 'python': ['autopep8'],
    \ 'ruby': ['rubocop'],
    \ 'typescriptreact': ['prettier', 'eslint']
\}

let g:ale_fix_on_save = 1

" YCM Config
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
" rust source path for auto completion
let g:ycm_rust_src_path = '/home/henryjackson/.rustup/toolchains/stable-x86_64-unknown-linux-gnu'

" Turn on syntax highlighting
syntax on
colorscheme spring-night

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=0 noexpandtab
set expandtab
set noshiftround

" ruby specific whitespace
autocmd FileType ruby setlocal ts=2
autocmd FileType ruby setlocal sw=2

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

" Run go fmt on save
let g:go_fmt_autosave = 1

" Add go imports when saving go files
let g:go_fmt_command = "goimports"

" Run rustfmt on save
let g:rustfmt_autosave = 1

" Copy RustPlay output URL to clipboard
let g:rust_clip_command = 'xclip -selection clipboard'

" Rust racer settings
set hidden
let g:racer_cmd = "~/.cargo/bin/racer"
au FileType rust nmap gd <Plug>(rust-def)

" vim-terraform tab alignment settings
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" set up tab completion menus
set wildmode=longest,list,full
set wildmenu

" remember folding on save
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

" set hybrid line numbers
set number relativenumber

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" Don't unfold go code on write
let g:go_fmt_experimental = 1

" format plush files (Buffalo)
autocmd BufRead,BufNewFile *.plush.html set filetype=eruby.html.js.css

if has('persistent_undo')
  set undofile
  silent !mkdir -p $HOME/.vim/undo
  set undodir=$HOME/.vim/undo
  endif

" vim table-mode use markdown style tables
let g:table_mode_corner='|'
