set encoding=UTF-8
set nocompatible " Don't try to be vi compatible

call plug#begin('~/.vim/plugged')

" syntax, lsp, linting
Plug 'cespare/vim-toml'              " Toml syntax support
Plug 'dense-analysis/ale'            " Syntax checking
Plug 'elixir-editors/vim-elixir'     " Elixir syntax
Plug 'fatih/vim-go'                  " Adds golang support, :GoBuild, :GoInstall, :GoTest, syntax highlight etc...
Plug 'hashivim/vim-terraform'        " Terraform HCL and JSON syntax highlighting for *.tf, *.tfvars, *.tfstate files
Plug 'leafgarland/typescript-vim'    " Typescript syntax
Plug 'nvie/vim-flake8'               " Python syntax checker, F7 to run on .py file
Plug 'peitalin/vim-jsx-typescript'   " JSX-in-typescript syntax
Plug 'racer-rust/vim-racer'          " Rust go to definition
Plug 'rust-lang/rust.vim'            " Rust syntax highlighting, formatting
Plug 'slim-template/vim-slim'        " RoR syntax and tooling
Plug 'tpope/vim-rails'               " RoR syntax and tooling
Plug 'vim-ruby/vim-ruby'             " RoR syntax and tooling
Plug 'vim-scripts/indentpython.vim'  " Improves auto-indent
Plug 'evanleck/vim-svelte'           " Svelte syntax highlighting

" autocomplete
" Plug 'codota/tabnine-vim'          " TabNine code autocompleter
Plug 'github/copilot.vim'            " gh copilot

" tools
Plug 'dhruvasagar/vim-table-mode'    " Markdown tables
Plug 'junegunn/fzf'                  " Fuzzy finder
Plug 'junegunn/fzf.vim'              " Fuzzy finder
Plug 'mileszs/ack.vim'               " Ack search tool for vim
Plug 'scrooloose/nerdtree'           " File tree
Plug 'tpope/vim-abolish'             " Vim abolish for coercing between snake and camel case
Plug 'tpope/vim-fugitive'            " Git wrapper inside vim
Plug 'tpope/vim-repeat'              " Vim repeat for tpope's plugins
Plug 'tpope/vim-rhubarb'             " Enables :GBrowse redirect to Github in fugitive

" misc
Plug 'morhetz/gruvbox'               " Colorscheme
Plug 'ryanoasis/vim-devicons'        " Icons for filetype indicators in nerdtree

call plug#end() " All of your Plugs must be added before the following line

syntax on " Turn on syntax highlighting
colorscheme gruvbox

" sets (options)
set backspace=indent,eol,start  " allow backspacing over autoindent, eol, start of insert
set expandtab                   " expand tabs to spaces
set foldlevel=99                " close fewer folds
set foldmethod=indent           " lines with equal indent form a fold
set formatoptions=tcqn1         " autoformatting http://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
set hidden                      " allow hidden buffers
set hlsearch                    " highlight previous search matches
set ignorecase                  " case insensitive searching
set incsearch                   " highlight search matches as you type
set laststatus=2                " Status bar
set listchars=tab:▸\ ,eol:¬     " visualize tabs and newlines
set matchpairs+=<:>             " use % to jump between pairs
set modelines=0                 " security
set mouse=a                     " scroll within a vim buffer
set noshiftround                " round indent to multiple of 'shiftwidth'
set number                      " show line numbers
set number relativenumber       " set hybrid line numbers
set ruler                       " show file stats
set scrolloff=3                 " cursor motion
set shiftwidth=4                " number of spaces to use for each step of (auto)indent
set showcmd                     " last line
set showmatch                   " when a bracket is inserted, briefly jump to the matching one
set showmode                    " last line
set smartcase                   " if search contains capital letters, use case-sensitivity
set tabstop=4                   " number of spaces that a tab in the file counts for
set textwidth=79                " wrap lines at first whitespace after 79 chars
set visualbell                  " blink cursor on error instead of beeping
set wildmenu                    " set up tab completion menus
set wildmode=longest,list,full  " set up tab completion menus
set wrap                        " wrap lines longer than the width of the window

" lets
let NERDTreeIgnore=['\.pyc$', '\.swp', '\~$']                                  "ignore files in NERDTree
let NERDTreeShowHidden=1
let NERDTreeWinSize=45
let g:ackprg = 'ag --nogroup --nocolor --column'                               " Use https://github.com/ggreer/the_silver_searcher as Ack program
let g:ale_fix_on_save = 1
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
    \ 'svelte': ['prettier', 'eslint'],
    \ 'typescriptreact': ['prettier', 'eslint']
\}
let g:ale_linter_aliases = {
    \ 'svelte': ['css', 'javascript'],
    \ 'typescriptreact': ['typescript']
\}
let g:ale_linters = {
	\ 'java': ['checkstyle'],
    \ 'svelte': ['eslint', 'tsserver'],
    \ 'typescript': ['prettier', 'tsserver', 'eslint']
\}
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:go_fmt_autosave = 1                                                      " Run go fmt on save
let g:go_fmt_command = 'goimports'                                             " Add go imports when saving go files
let g:go_fmt_experimental = 1                                                  " Don't unfold go code on write
let g:gruvbox_contrast_dark = 'hard'
let g:rust_clip_command = 'xclip -selection clipboard'                         " Copy RustPlay output URL to clipboard
let g:rustfmt_autosave = 1                                                     " Run rustfmt on save
let g:svelte_preprocessors = ['typescript']                                    " Svelte preprocessors
let g:table_mode_corner='|'                                                    " vim table-mode use markdown style tables
let g:terraform_align=1                                                        " vim-terraform tab alignment settings
let g:terraform_fmt_on_save=1
let g:ycm_add_preview_to_completeopt = 0                                       " YCM Config
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" TODO figure out why multi-line throws error on editor startup
" let g:ycm_rust_src_path =                                                    " rust source path for auto completion
    " \ '/home/henryjackson/.rustup/toolchains/stable-x86_64-unknown-linux-gnu'
let mapleader=' '                                                              " Set space as leader key

" TODO: organize below

if has('persistent_undo')
  set undofile
  silent !mkdir -p $HOME/.vim/undo
  set undodir=$HOME/.vim/undo
endif

runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" visual searching by default
nnoremap / /\v
vnoremap / /\v

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" Map NerdTree Toggle to Ctrl + n
map <C-n> :NERDTreeToggle<CR>

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

" Shortcut to open silver searcher menu
map <C-s> :Ag<Enter>

" Enable folding with space f
nmap <silent> <leader>f za

" Enable FZF search with file preview using CTRL+f, ignoring files that are in
" .gitignore, but including untracked files in the repo
map <C-f> :GFiles --exclude-standard --others --cached<Enter>

" Open FZF Buffers with CTRL+l
map <C-b> :Buffers<Enter>

" go to def shortcut
map gd :ALEGoToDefinition<Enter>

" jump between ALE errors
nmap <silent> <leader>j :ALENext<cr>zz
nmap <silent> <leader>k :ALEPrevious<cr>zz

" gb shortcut to check git blame
map gb :Git blame<Enter>

" ruby specific whitespace
autocmd FileType ruby setlocal ts=2
autocmd FileType ruby setlocal sw=2

" typescript, javascript specific whitespace
autocmd BufRead,BufNewFile *.ts,*.tsx*,*.js,*.jsx,*.jbuilder setlocal ts=2 sw=2

" Rust racer settings
let g:racer_cmd = "~/.cargo/bin/racer"
au FileType rust nmap gd <Plug>(rust-def)

" remember folding on save
augroup remember_folds
  autocmd!
  au BufWinLeave ?*.* mkview 1
  au BufWinEnter ?*.* silent! loadview 1
augroup END


" format plush files (Buffalo)
autocmd BufRead,BufNewFile *.plush.html set filetype=eruby.html.js.css

" format slim files (Ruby on rails)
autocmd BufRead,BufNewFile *.slim set filetype=slim
