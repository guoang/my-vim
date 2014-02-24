"Vundle settings
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Raimondi/delimitMate'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Rip-Rip/clang_complete'

" vim-scripts repos
Bundle 'tir_black'
Bundle 'c.vim'
Bundle 'The-NERD-tree'
"Bundle 'closetag'

"Bundle 'L9'
"Bundle 'FuzzyFinder'
" non-GitHub repos
"Bundle 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

"filetype on
filetype plugin on
filetype plugin indent on

"不兼容vi
set nocp

"打开vim状态栏标尺
set ru

"搜索时高亮现实目标文本
set hls

"语法高亮
syntax on

"光标自动由方向键换行
set whichwrap=b,s,<,[,],h,l,>

"自动缩进
set autoindent

"采用C、C++的自动缩进方式
"set cindent

"显示行号
set nu

"配色方案
" dark background (changing color of word)
colo tir_black
set background=dark
set t_Co=256

"tab indent
set tabstop=4
set expandtab

"搜索时对大小写不敏感
set ignorecase smartcase

"折叠方式
set fdm=marker
nmap zff zf%

"nerdTree
nmap <F4> :NERDTreeToggle<cr>
nmap <tab> <c-w>w

"indent_guides
set ts=4 sw=4 et
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=red ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
nmap <F5> :IndentGuidesToggle<cr>

"powerline
set laststatus=2
set t_Co=256
let g:Powerline_symbols='unicode'
set encoding=utf8

"clang-complete
let g:clang_complete_copen=1
let g:clang_periodic_quickfix=0
let g:clang_snippets=1
let g:clang_trailing_placeholder=1
let g:clang_close_preview=1
let g:clang_use_library=1
let g:clang_user_options='-std=c++11'
let g:clang_complete_macros=1
let g:clang_complete_patterns=1

"set cross
"set cursorline
"set cursorcolumn
"hi CursorLine cterm=none ctermbg=black ctermfg=none guibg=white guifg=white
"hi Cursorcolumn cterm=none ctermbg=black ctermfg=none guibg=white guifg=white

"set JSP hotkey
nmap <c-p> o<% %><esc>hhi

