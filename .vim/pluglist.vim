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
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-scripts/taglist.vim'
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
" Edit
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/indentLine'
Plug 'Asheq/close-buffers.vim'

" Search
Plug 'Yggdroot/LeaderF'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Completion
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

" Async
Plug 'skywind3000/asyncrun.vim'

filetype plugin indent on    " required!
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug configure
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""
" vim-gntentags
"""""""""""""""""""""
set tags=./tags;,tags
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = 'tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

"""""""""""""""""""""
" YouCompleteMe
"""""""""""""""""""""
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_python_binary_path = 'python'
let g:ycm_autoclose_preview_window_after_completion=1
"""""""""""""""""""""
" Grep
"""""""""""""""""""""
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

"""""""""""""""""""""
" Fzf
"""""""""""""""""""""
let g:fzf_launcher='gnome-terminal -x bash -ic %s'
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --ignore-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

nnoremap <C-p>a :Rg 
nnoremap <leader>g :Rg <C-r><C-w><CR>

" An action can be a reference to a funtion that processes selected lines
function! s:build_qflist(lines)
    call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
    copen
    cc
endfunction

let g:fzf_action = {
    \ 'ctrl-q': function('s:build_qflist'),
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit'}

" Enable per-command history
let g:fzf_history_dir = '~/.fzf_history'


