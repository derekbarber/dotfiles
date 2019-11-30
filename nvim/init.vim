set nocompatible        " disable compatibility to old-time vi

" ================= General config =====================
"

set encoding=utf-8
set fileencoding=utf-8
syntax on                   " Enable syntax highlight
set ttyfast                 " Faster redrawing
set lazyredraw              " Only redraw when necessary
set cursorline              " Find the current line quickly

" ================= Plugins ======================
"

call plug#begin()

" nord-vim colorscheme
Plug 'arcticicestudio/nord-vim'

" neomake
Plug 'neomake/neomake'

" JavaScript Highlight & Improved Indentation
Plug 'pangloss/vim-javascript'

" Typescript Syntax Highlight
Plug 'leafgarland/typescript-vim'

" Auto pairs plugin, insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" Async execution library needed by tsuquyomi
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" A client to TSSServer so that we can get autocompletion
Plug 'Quramy/tsuquyomi'

" Briefly highlight yanked text
Plug 'machakann/vim-highlightedyank'

" NERDTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }


" Conquer or Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" Async FuzzyFind
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" .editorconfig
Plug 'editorconfig/editorconfig-vim'

" emmet
Plug 'mattn/emmet-vim'

" Slim Syntax Highlighting
Plug 'slim-template/vim-slim'

" semantic-based completion
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --ts-completer' }

" GraphQL Syntax Highlight
Plug 'jparise/vim-graphql'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'

Plug 'vim-ruby/vim-ruby'

" linting engine
Plug 'w0rp/ale'

" Vim Clap
Plug 'liuchengxu/vim-clap'

call plug#end()

" ============= Plugin Configs =====================
"

" Neomake async hooks
call neomake#configure#automake('w')

" Open NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree
" NERDTree
let NERDTreeShowHidden=1
map <silent> <C-n> :NERDTreeToggle<CR>

" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=1


" Enable the Deoplete Plugin
let g:deoplete#enable_at_startup = 1

" enable highlight for JSDocs
let g:javascript_plugin_jsdoc = 1

" disable auto_triggering ycm suggestions pane and instead
" use semantic completion only on Ctrl+n
let ycm_trigger_key = '<C-n>'
let g:ycm_auto_trigger = 0
let g:ycm_key_invoke_completion = ycm_trigger_key

" this is some arcane magic to allow cycling through the YCM options
" with the same key that opened it.
" See http://vim.wikia.com/wiki/Improve_completion_popup_menu for more info.
let g:ycm_key_list_select_completion = ['<TAB>', '<C-j>']
inoremap <expr> ycm_trigger_key pumvisible() ? "<C-j>" : ycm_trigger_key;

" show autocomplete suggestions only when typing more than 2 characters
let g:ycm_min_num_of_chars_for_completion = 2

" show at most 20 completion candidates at a time (more than this would be
" ridiculous, you'd press TAB so many times it would be better to simply type
" the entire thing lol)
" this applies only to the semantic-based engine
let g:ycm_max_num_candidates = 20

" this is the same as above, but only for the identifier-based engine
let g:ycm_max_num_identifier_candidates = 10

" blacklist of filetypes in which autocomplete should be disabled
let g:ycm_filetype_blacklist = {
      \ 'tagbar': 1,
      \ 'qf': 1,
      \ 'notes': 1,
      \ 'markdown': 1,
      \ 'unite': 1,
      \ 'text': 1,
      \ 'vimwiki': 1,
      \ 'pandoc': 1,
      \ 'infolog': 1,
      \ 'mail': 1
      \}

" blacklist of filepaths in which autocomplete should be disabled
let g:ycm_filepath_blacklist = {
      \ 'html': 1,
      \ 'jsx': 1,
      \ 'xml': 1,
      \}


" lint and fix files on save
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

" lint after 1000ms after changes are made both on insert mode and normal mode
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_delay = 1000

" use emojis for errors and warnings
let g:ale_sign_error = '✗\ '
let g:ale_sign_warning = '⚠\ '

" fixer configurations
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'ruby': ['standardrb', 'rubocop'],
\   'python': ['flake8', 'pylint'],
\   'javascript': ['standard'],
\   'typescript': ['prettier'],
\}

" make FZF respect gitignore if `ag` is installed
if (executable('ag'))
    let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
endif

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" make emmet behave well with JSX in JS and TS files
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\  'typescript' : {
\      'extends' : 'tsx',
\  },
\}

" ============= Visual Related Config ===========
"
set t_Co=256            " 256 Colors
colorscheme nord

" long lines as just one line (have to scroll horizontally)
set nowrap

" line numbers
"
" set relativenumber
set number                      " show line numbers

" show the status line all the time
set laststatus=2

" toggle invisible characters
set invlist
set list
set listchars=tab:¦\ ,eol:¬,trail:⋅,extends:❯,precedes:❮

" disable scrollbars (real hackers don't use scrollbars)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L


set showmatch                   " show matching brackets
set ignorecase                  " case insensitive matching
" set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of :cmdline history
set showcmd                     " Show incomplete cmds down the bottom
set gcr=a:blinkon0              " Disable cursor blind
set visualbell                  " No sounds
set showmode                    " Show current mode down the bottom
set autoread                    " Reload files changes outside vim
set termguicolors

set inccommand=nosplit           " Get interactive feedback for substitutes


" ================= Leader Key config ==================
" Change leader key to ,
"
let g:mapleader = ','


" ================= Turn Off Swap Files =================

set noswapfile
set nobackup
set nowb

" ================== Indentation ========================

set expandtab         " converts tabs to white space
set smarttab          " be smart when using tabs

set autoindent        " indent a new line the same amount as the line just typed

" Smart indent
" Automatically inserts one extra level of indentation in some cases, and works for C-like files
set si

set shiftwidth=2      " width for autoindents
set softtabstop=2     " set multiple spaces as tabstops so <BS> does the right thing
set tabstop=2         " number of columns occupied by a tab character

" =================== Keymappings

" dont use arrowkeys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" really, just dont
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

" copy and paste to/from vIM and the clipboard
nnoremap <C-y> +y
vnoremap <C-y> +y
nnoremap <C-p> +P
vnoremap <C-p> +P

" access system clipboard
set clipboard=unnamed

" map fzf to ctrl+p
" nnoremap <C-P> :Files<CR>
" map Clap files to ctrl+p
nnoremap <C-P> :Clap files<CR>

" YouCompleteMeMappings
nnoremap ,gt    :YcmCompleter GetType<CR>
nnoremap ,dl    :YcmCompleter GoToDeclaration<CR>
nnoremap ,df    :YcmCompleter GoToDefinition<CR>
nnoremap ,#     :YcmCompleter GoToReferences<CR>
"
"
" " Easier split navigations

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" More natural split opening - open new split panes to right & bottom
set splitbelow
set splitright



filetype plugin indent on    " required

" Enable slim syntax highlight
autocmd FileType slim setlocal foldmethod=indent
autocmd BufNewFile,BufRead *.slim set filetype=slim


" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default


" ================ Completion =======================
"
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*/.git/*,*/tmp/*,*.swp




" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc
