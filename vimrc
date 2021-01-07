""""""""""""""""""""""""""""""""
"   Author: Haodong Lyu
"    Email: haodonglyu@gmail.com
"     Date: 05-13-2017
" Homepage: xxx
"""""""""""""""""""""""""""""""""

"--------
" Vundle
" Vundle, the plug-in manager for Vim.
" http://github.com/VundleVim/Vundle.Vim
"--------
" Vundle {
    set nocompatible              " be iMproved, required
    filetype off                  " required
    
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
    Plugin 'bling/vim-airline'
    Plugin 'kien/ctrlp.vim'
    " Plugin 'scrooloose/syntastic'
    Plugin 'tpope/vim-fugitive'
    Plugin 'ervandew/supertab'
    
    "--------------
    " Color Schemes
    "--------------
    Plugin 'tomasr/molokai'
    Plugin 'altercation/vim-colors-solarized'
    
    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required
    " To ignore plugin indent changes, instead use:
    "filetype plugin on
    "
    " Brief help
    " :PluginList       - lists configured plugins
    " :PluginInstall    - installs plugins; append `!` to update or just
    " :PluginSearch foo - searches for foo; append `!` to refresh local cache
    " :PluginClean      - confirms removal of unused plugins; append `!` to
    "
    " see :h vundle for more details or wiki for FAQ
    " Put your non-Plugin stuff after this line

" } " End of Vundle

   
"--------
" Vim UI
"--------
" encoding dectection
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
" enable filetype dectection and ft specific plugin/indent
filetype plugin indent on
" enable syntax hightlight and completion
syntax on
syntax enable

autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

" Persistent undo
set undofile
set undodir=$HOME/.vim/undo

set undolevels=1000
set undoreload=10000

" highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" search
set incsearch
"set highlight       " conflict with highlight current line
set ignorecase
set smartcase
" set nowrapscan

" editor settings
set confirm         " prompt when existing from an unsaved file
set backspace=indent,eol,start " More powerful backspacing
set t_Co=256        " Explicitly tell vim that the terminal has 256 colors
set mouse=a         " use mouse in all modes
set report=0        " always report number of lines changed
set scrolloff=5     " 5 lines above/below cursor when scrolling
set number          " show line numbers
set numberwidth=5
set showmatch       " show matching bracket (briefly jump)
set showcmd         " show typed command in status bar
set title           " show file in titlebar
set autochdir       " automatically change dir
set laststatus=2    " use 2 lines for the status bar
set matchtime=2     " show matching bracket for 0.2 seconds
set matchpairs+=<:> " specially for html
" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+0

" Default Indentation
set autoindent
set smartindent     " indent when
set tabstop=4       " tab width
set softtabstop=4   " backspace
set shiftwidth=4    " indent width
set expandtab       " expand tab to space

autocmd FileType php    setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=100

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif " has("autocmd")

"-----------------
" Plugin settings
"-----------------
" Color scheme
colorscheme molokai
"colorscheme solarized

" Nerd Tree
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=0
let NERDTreeWinPos = "left"
" Automatically open a NERDTree
" autocmd vimenter * NERDTree
" Automatically open a NERDTree if no files where specified
" autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Open a NERDTree
nmap <F5> :NERDTreeToggle<cr>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Close vim if the only window left open is loc_list
autocmd WinEnter * if &buftype ==# 'quickfix' && winnr('$') == 1 | quit | endif

" SuperTab
" https://github.com/ervandew/supertab
" let g:SuperTabDefultCompletionType='context'
" let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
" let g:SuperTabRetainCompletionType=2

" ctrlp
" https://github.com/kien/ctrlp.vim
let g:ctrlp_map = ',,'
" let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_open_multiple_files = 'v'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.a,*.pyc,*.pyo,*.class,.DS_Store    " MacOSX/Linux
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(log)$',
  \ }
