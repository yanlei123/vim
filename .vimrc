"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pre
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible
"let g:mapleader="\<Space>"
let g:mapleader=";"

" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.vim/pluglist.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Base Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set secure                      " Disable unsafe commands in local .vimrc files
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=200                 " Store lots of :cmdline history
set gcr=a:blinkon0              " Disable cursor blink
set visualbell                  " No sounds
set autoread                    " Reload files changed outside vim
set nohidden                    " Don't allow buffers to exist in background
set mouse=a                     " Enable mouse

""""""""""""""""""
" search
""""""""""""""""""
set incsearch               " Show search results as we type
set showmatch               " Show matching brackets
set hlsearch                " Highlight search results

" Use regex for searches
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
set ignorecase              " Ignore case when searching
set smartcase               " Don't ignore case if we have a capital letter

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""
" Code
""""""""""""""""""
set encoding=utf-8
set langmenu=zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 
set fileencoding=utf-8
set ffs=unix,dos
filetype on
filetype plugin on
filetype indent on

""""""""""""""""""
" File indent
""""""""""""""""""
set expandtab
set softtabstop=4
set shiftwidth=4
set smarttab
set autoindent
set smartindent

set cindent    "C-style indent

""""""""""""""""""
" File fold
""""""""""""""""""
set foldenable
set foldcolumn=0            " Don't show the folding gutter/column
set foldlevelstart=20       " Open 20 levels of folding when I open a file
set foldnestmax=10
set foldmethod=indent
"set foldmethod=marker       " Fold on {{{ }}}

autocmd FileType vim set nofen
autocmd FileType c,cpp setl foldmethod=syntax | setl fen

" Open folds under the following conditions
set foldopen=block,hor,mark,percent,quickfix,search,tag,undo,jump

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showcmd                 " Show (partial) command in the last line of the screen.
set wildmenu                " Command completion
set wildmode=list:longest   " List all matches and complete till longest common string
set laststatus=2            " The last window will have a status line always
set noshowmode              " Don't show the mode in the last line of the screen, vim-airline takes care of it
set ruler                   " Show the line and column number of the cursor position, separated by a comma.
set lazyredraw              " Don't update the screen while executing macros/commands
set showmatch               " Show matching bracets
set wrap                    " Soft wrap at the window width
set linebreak               " Break the line on words
set textwidth=119           " Break lines at just under 80 characters
if exists('+colorcolumn')
  set colorcolumn=+1        " Highlight the column after `textwidth`
endif
set number                  " Show line numbers
set numberwidth=4           " Width of the line number column
set cmdheight=2
set cursorline
"set cursorcolumn

" Highlight tabs and trailing spaces
set listchars=tab:▸\ ,trail:•
set list                    " Make whitespace characters visible

" Splits
set splitbelow              " Open new splits below
set splitright              " Open new vertical splits to the right

" Syntax and color
syntax on
syntax enable               " This has to come after colorcolumn in order to draw it.
set t_Co=256                " enable 256 colors
color desert
if has("gui_running")
    set guioptions-=T
    set guioptions-=m
    set guioptions-=r
    set guioptions-=L
    set guifont=Monospace\ 13 
    "set guifont=Monospace\ Bold\ 13 
    "color gruvbox
    color molokai
endif

"autocmd WinEnter * set cursorline
"autocmd WinLeave * set nocursorline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" custom commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" custom mappings 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set nohlsearch
nnoremap <leader><space> :nohlsearch<cr>

" cd to the current file's directory
nnoremap <leader>. :cd %:p:h<CR>:pwd<CR>

" Edit
nnoremap <leader>w :w<CR>

" change buffer
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bw :bw<CR>
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>

""""""""""""""""""
" move window
""""""""""""""""""
" Move current window to the far left using full height
nmap <silent> <Leader>h <C-w>H
" Move current window to the far right using full height
nmap <silent> <Leader>l <C-w>L
" Move current window to the top using full width
nmap <silent> <Leader>k <C-w>K
" Move current window to the bottom using full width
nmap <silent> <Leader>j <C-w>J

""""""""""""""""""
" move to window
""""""""""""""""""
nmap <silent> <C-h> <C-w>h
nmap <silent> <C-l> <C-w>l
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-j> <C-w>j

"""""""""""""""""
" move 
""""""""""""""""""
" command mode paste
cnoremap <C-v> <C-r>+

" normal mode copy and paste
nnoremap <C-c> "+y
nnoremap <C-v> "+p

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim script programing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set  pythondll=/usr/lib64/libpython2.7.so
set  pythonthreedll=/usr/lib64/libpython3.so

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" backup and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set undofile
set undodir=~/.undodir
set undolevels=50

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" local vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"If there is a per-machine local .vimrc, source it at the end.
if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimrc edit
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <silent><leader>sv :source ~/.vimrc<cr>
map <silent><leader>ev :edit   ~/.vimrc<cr>

autocmd! BufWritePost .vimrc source ~/.vimrc
autocmd! BufWritePost pluglist.vim source ~/.vimrc

let g:vimrc_loaded=1
