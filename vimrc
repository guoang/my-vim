"Vundle settings
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" airline
Bundle 'vim-airline/vim-airline'
Bundle 'guoang/vim-airline-themes'

" git
Bundle 'airblade/vim-gitgutter'
" svn
Bundle 'mhinz/vim-signify'

" tagbar
Bundle 'majutsushi/tagbar'

" 括号自动补全
Bundle 'Raimondi/delimitMate'
"
" Web 开发
"Bundle 'docunext/closetag.vim'
" 根据cache的自动补全
"Bundle 'Shougo/neocomplete'
" YouCompleteMe
Bundle 'Valloric/YouCompleteMe'

" 配色
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-scripts/wombat'
Bundle 'tir_black'

"pythonIDE
Bundle 'klen/python-mode'

" 交互式运行python
Bundle 'nicoraffo/conque'

" C
Bundle 'c.vim'
" 目录
Bundle 'The-NERD-tree'
" 语法高亮
Bundle 'guoang/vim-polyglot'

" 快速打开
Bundle 'ctrlpvim/ctrlp.vim'
" 搜索
Bundle 'dyng/ctrlsf.vim'
" 代码对齐
Bundle 'godlygeek/tabular'
" 快速注释
Bundle 'scrooloose/nerdcommenter'
" 快速补全片段
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
" 对齐线
Bundle 'Yggdroot/indentLine'

"Bundle 'L9'
"Bundle 'FuzzyFinder'
" non-GitHub repos
"Bundle 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

filetype on
filetype plugin on
filetype indent on
filetype plugin indent on

" 不兼容VI
set nocompatible

" 打开vim状态栏标尺
set ru

" 搜索时高亮目标文本
set hls
" 搜索时对大小写不敏感
set ignorecase smartcase

" 语法高亮
syntax enable
syntax on

" 光标自由移动
set whichwrap=b,s,<,[,],h,l,>

" 共享剪贴板
set clipboard=unnamed
set pastetoggle=<f7>

" 自动缩进
set autoindent

" 采用C自动缩进方式
set cindent
set sw=4
"
" 更改leader，默认的是\
"let g:mapleader=";"

" 行号
set nu

" 配色
" dark background (changing color of word)
colo molokai
set t_Co=256
let g:molokai_original=1
"set background=dark

" tab转空格
set tabstop=4
set expandtab

" 折叠方式
set fdm=marker
nmap zff zf%

" 窗口缩放
nmap <c-h> :vertical resize -3<cr>
nmap <c-l> :vertical resize +3<cr>

"scroloffset
set scrolloff=7

" go tabs
nnoremap gn :bn<CR>
nnoremap gp :bp<CR>

" 不要自动切换目录
set noautochdir

" 取消f1
nmap <f1> <esc>
imap <f1> <esc>
vmap <f1> <esc>
cmap <f1> <esc>

"encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-brm,utf-8,chinese,cp936
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language message zh_CN.utf-8

"backspace
set backspace=indent,eol,start

"nerdTree
nmap <F4> :NERDTreeToggle<cr>
noremap <tab> <c-w>w
noremap <s-tab> <c-w>W
let NERDTreeIgnore=['\.pyc', '\.pyo', '\~$', '\.swp']

" airline
set laststatus=2
let g:airline_theme = "jellybeans"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#hunks#enabled = 1

if has("win32")
    set guifont=Ubuntu\ Mono\ for\ Powerline:h12
    let g:Powerline_symbols="fancy"
    let g:airline_symbols = {}
endif

" ctags
set tags=tags;

" cscope
if has("cscope")
  set csprg=/usr/local/bin/cscope
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  set csverb
endif

nmap <C-g>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-g>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-g>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-g>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-g>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-g>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-g>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-g>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" tagbar
nmap <f5> :TagbarToggle<CR>
let g:tagbar_sort = 0

"set cross
set cursorline

"YouCompleteMe
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
" 跳转到定义处
nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
nnoremap <leader>lo :lopen<CR>	                    "open locationlist
nnoremap <leader>lc :lclose<CR>	                    "close locationlist
inoremap <leader><leader> <C-x><C-o>

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" 显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf=1
" 开启基于tag的补全，可以在这之后添加需要的标签路径
let g:ycm_collect_identifiers_from_tags_files=1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 输入第2个字符开始补全
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 设置在下面几种格式的文件上屏蔽ycm
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \}

" 使用ultisnips
let g:ycm_use_ultisnips_completer = 1
"youcompleteme  默认tab  s-tab 和 ultisnips 冲突

" SirVer/ultisnips 代码片断
"定义存放代码片段的文件夹，使用自定义和默认的，将会的到全局，有冲突的会提示
let g:UltiSnipsSnippetDirectories=["bundle/vim-snippets/UltiSnips"]

" 参考https://github.com/Valloric/YouCompleteMe/issues/36#issuecomment-62941322
" 解决ultisnips和ycm tab冲突，如果不使用下面的办法解决可以参考
" https://github.com/Valloric/YouCompleteMe/issues/36#issuecomment-63205056的配置
" begin
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
" end
" UltiSnips completion function that tries to expand a snippet. If there's no
" snippet for expanding, if there's no :nippet it just returns TAB key
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        call UltiSnips#JumpForwards()
        if g:ulti_jump_forwards_res == 0
            return "\<TAB>"
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

"run python script
if has("win32")
    nmap \rp :!python.exe %<cr>
else
    nmap \rp :!python %<cr>
endif

"window size
if has("win32")
    set lines=54 columns=200
endif

"python mode
" 设置断点
nmap ;b <leader>b
" 取消python run code 功能， 因为它有很多缺陷如不能与pdb交互，不能终止循环等
let g:pymode_run = 0
" cancel check on write
let g:pymode_lint_on_write = 0
" cancle py folding
let g:pymode_folding = 0
" error check
nmap <f3> :PymodeLint<CR>
" auto pep8 fix
nmap <f2> :PymodeLintAuto<CR>
" 取消rope，rope是pymode补全的工具
let g:pymode_rope=0
" ignore error
let g:pymode_lint_ignore = 'E221, E203'
" set symbol
let g:pymode_lint_todo_symbol = '>'
let g:pymode_lint_error_symbol = '>>'
" max complex
let g:pymode_lint_options_mccabe = { 'complexity': 10 }

" 使用conque和ipython来实现交互式运行
if has("win32")
    autocmd BufRead,BufNewFile *.py nmap ;r :execute 'ConqueTermSplit ipython.exe '.expand('%:p')<CR>
else
    autocmd BufRead,BufNewFile *.py nmap ;r :execute 'ConqueTermSplit python '.expand('%:p')<CR>
endif

" 设置折叠模式
set foldmethod=marker

" python comment
vmap # :s=^\(//\)*=# =g<cr>:noh<cr>

" spzs
au BufRead,BufNewFile *.spzs set filetype=spzs
au BufRead,BufNewFile *.fx set filetype=hlsl
au BufRead,BufNewFile *.nfx set filetype=hlsl
au BufRead,BufNewFile *.tml set filetype=hlsl
au BufRead,BufNewFile *.fxl set filetype=hlsl
au BufRead,BufNewFile *gl.vs set filetype=glsl
au BufRead,BufNewFile *gl.ps set filetype=glsl

" ctrlp
let g:ctrlp_regexp=0
let g:ctrlp_tabpage_position = 'ac'
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/]\.(git|hg|svn)$',
\ 'file': '\v\.(exe|so|dll|pyo|pyc)$',
\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
\ }

" ctrlsf
let g:ctrlsf_ackprg='ag'
noremap <c-e> :CtrlSF
let g:ctrlsf_mapping = {
    \ "split": "",
    \ "vsplit": "<c-o>",
    \ }

" nerdcomment
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 0
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" identline自动颜色
let g:indentLine_color_term = 66

" tabular
nmap <leader>t :Tabularize /

" conque
" no warning
let g:ConqueTerm_StartMessages = 0
