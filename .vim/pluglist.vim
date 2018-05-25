" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug list
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" Colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
" Fancy statusline
Plug 'Lokaltog/vim-powerline', { 'branch': 'develop' }
" Syntax
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Yggdroot/vim-mark'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-scripts/taglist.vim'
Plug 'majutsushi/tagbar'
" Search
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

filetype plugin indent on    " required!
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug configure
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
