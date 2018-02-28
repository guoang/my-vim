" Python Path
" {{{
function! InitPythonPath()
    let s:python_path = []
    let g78_root = '/Volumes/G71/g78/MobaServer/'
    if getcwd() =~ g78_root
        let g78_server = g78_root.'server/'
        let g78_client = g78_root.'client/game/script/'
        call add(s:python_path, g78_server)
        call add(s:python_path, g78_server.'script')
        call add(s:python_path, g78_server.'mbserver')
        call add(s:python_path, g78_server.'mbserver/Lib')
        call add(s:python_path, g78_client)
    endif
endfunction
call InitPythonPath()
" }}}

" Vundle settings
" {{{
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
" Bundle 'mhinz/vim-signify'
" tagbar
" too slow!!
" Bundle 'majutsushi/tagbar'
" 括号自动补全
Bundle 'Raimondi/delimitMate'
" close tag
" Bundle 'docunext/closetag.vim'
" YouCompleteMe
Bundle 'Valloric/YouCompleteMe'
" 配色
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-scripts/wombat'
Bundle 'tir_black'
" python
Bundle 'klen/python-mode'
" sort import, better than isort
Bundle 'guoang/impsort.vim'
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
" Bundle 'Yggdroot/indentLine'
" markdown
Bundle 'plasticboy/vim-markdown'
Bundle 'suan/vim-instant-markdown'
" lua
Bundle 'vim-scripts/lua.vim'
Bundle 'xolox/vim-lua-ftplugin'
Bundle 'xolox/vim-misc'
" motion
Bundle 'easymotion/vim-easymotion'
" undo
Bundle 'sjl/gundo.vim'
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
" }}}

" Builtin Settings
" {{{
filetype on
filetype plugin on
filetype indent on
filetype plugin indent on
" 不兼容VI
set nocompatible
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
" paste模式
set pastetoggle=<f7>
" 自动缩进
set autoindent
" 采用C自动缩进方式
set cindent
set sw=4
" 行号
set nu
" 配色
"let g:rehash256 = 1
colo molokai
" tab转空格
set tabstop=4
set expandtab
" 折叠方式
set fdm=marker
nmap zff zf%
" 窗口缩放
nmap <c-h> :vertical resize -3<cr>
nmap <c-l> :vertical resize +3<cr>
" scroloffset
set scrolloff=7
" tab
noremap <tab> <c-w>w
noremap <s-tab> <c-w>W
" jumplist
nnoremap <c-n> <c-i>
nnoremap <c-o> <c-o>
" quick move
nmap <c-j> ]M
nmap <c-k> [M
" go tabs
nnoremap gn :bn<CR>
nnoremap gp :bp<CR>
" 不要自动切换目录
set noautochdir
" tags
set tags=tags;
" 防止误按f1
nmap <f1> <esc>
imap <f1> <esc>
vmap <f1> <esc>
cmap <f1> <esc>
" encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-brm,utf-8,chinese,cp936
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language message zh_CN.utf-8
" backspace
set backspace=indent,eol,start
" highlight line
set cursorline
" run python script
if has("win32")
    nmap \rp :!python.exe %<cr>
else
    nmap \rp :!ipython %<cr>
endif
" 使用conque和ipython来实现交互式运行
if has("win32")
    autocmd BufRead,BufNewFile *.py nmap ;r :execute 'ConqueTermSplit ipython.exe '.expand('%:p')<CR>
else
    autocmd BufRead,BufNewFile *.py nmap ;r :execute 'ConqueTermSplit python '.expand('%:p')<CR>
endif
" window size
if has("win32")
    set lines=54 columns=200
endif
" spzs
au BufRead,BufNewFile *.spzs set filetype=spzs
au BufRead,BufNewFile *.fx set filetype=hlsl
au BufRead,BufNewFile *.nfx set filetype=hlsl
au BufRead,BufNewFile *.tml set filetype=hlsl
au BufRead,BufNewFile *.fxl set filetype=hlsl
au BufRead,BufNewFile *gl.vs set filetype=glsl
au BufRead,BufNewFile *gl.ps set filetype=glsl
" 环境变量python path, ycm等插件会用到
let $PYTHONPATH = join(s:python_path, ':')
" 缺省的，vim会使用下拉菜单和一个preview窗口来显示匹配项目，
" 下拉菜单列出所有匹配的项目，预览窗口则显示选中项目的详细信息。
" 打开预览窗口会导致下拉菜单抖动，因此我一般都去掉预览窗口的显示
" :help completeopt
set completeopt=longest,menu
" reload config
nmap <leader><leader>r :source ~/.vimrc<cr>:YcmRestartServer<cr>
" }}}

" nerdTree
" {{{
nmap <F3> :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.pyc', '\.pyo', '\~$', '\.swp']
" }}}

" airline
" {{{
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
" }}}

" tagbar
" {{{
" nmap <f5> :TagbarToggle<CR>
" let g:tagbar_sort = 0
" }}}

" YouCompleteMe
" {{{
" 跳转
function! SmartGoTo()
    let old_file = expand('%:p')
    let old_pos = getpos('.')
    exec "YcmCompleter GoTo"
    if old_file == expand('%:p') && old_pos == getpos('.') && tagfiles() != []
        let ident = expand('<cword>')
        exec 'tjump '.ident
    endif
endfunction
nnoremap <c-g>g :call SmartGoTo()<CR>
nnoremap <c-g>d :YcmCompleter GoToDefinition<CR>
nnoremap <c-g>f :YcmCompleter FixIt<CR>
nnoremap <c-g><c-g> :call SmartGoTo()<CR>
nnoremap <c-g><c-d> :YcmCompleter GoToDefinition<CR>
nnoremap <c-g><c-f> :YcmCompleter FixIt<CR>
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" 关闭vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf = 0
" collect identifiers
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" When this option is set to 1,
" YCM's identifier completer will seed its identifier database with the keywords of the programming language you're writing.
let g:ycm_seed_identifiers_with_syntax = 1
" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" black_list
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \ 'ctrlsf': 1,
      \ 'ctrlp': 1,
      \ 'help': 1,
      \}
" use c-n/c-p, default tab/s-tab
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
" debug
let g:ycm_server_use_vim_stdout = 1
let g:ycm_log_level = 'debug'
" }}}

" ultisnips + vim-snippets
" {{{
"定义存放代码片段的文件夹，使用自定义和默认的，将会的到全局，有冲突的会提示
let g:UltiSnipsSnippetDirectories=["bundle/vim-snippets/UltiSnips"]

" 参考https://github.com/Valloric/YouCompleteMe/issues/36#issuecomment-62941322
" 解决ultisnips和ycm tab冲突，如果不使用下面的办法解决可以参考
" https://github.com/Valloric/YouCompleteMe/issues/36#issuecomment-63205056的配置
" begin
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
" }}}

" python mode
" {{{
" 取消run code，因为它有很多缺陷如不能与pdb交互，不能终止循环等
let g:pymode_run = 0
" cancle pymode folding
let g:pymode_folding = 0
" 关闭rope相关所有功能
let g:pymode_rope = 0
" close doc view
let g:pymode_doc = 0
" check on write
let g:pymode_lint_unmodified = 1
" default code checkers
let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'pep8', 'mccabe']
" error message if cursor placed at the error line
let g:pymode_lint_message = 1
" 关闭自动弹出的错误信息窗口
let g:pymode_lint_cwindow = 0
" ignore
let g:pymode_lint_ignore = ['E221', 'E203', 'E501', 'C901', 'E272', 'E129', 'W0404', 'E722']
" ignore some builtins
let g:pymode_lint_options_pyflakes = { 'builtins': 'logger,gdata,gtime,sa_logger,genv,core_env,visual_env,hall_env,action_env,gui,DebugLogic,mapper,robot_hooks_mgr' }
" customize motion
au FileType python nmap yim yiM | nmap yic yiC
au FileType python nmap dim diM | nmap dic diC
au FileType python nmap vim viM | nmap vic viC
au FileType python nmap yam yaM | nmap yac yaC
au FileType python nmap dam daM | nmap dac daC
au FileType python nmap vam vaM | nmap vac vaC
au FileType python nmap <f2> :PymodeLintAuto<cr>
" }}}

" ctrlp
" {{{
" 默认开启文件名模式
let g:ctrlp_by_filename = 1
" working in project root
let g:ctrlp_working_path_mode = 'rw'
" ignores
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/]\.(git|hg|svn)$',
\ 'file': '\v\.(exe|so|dll|pyo|pyc)$',
\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
\ }
" }}}

" ctrlsf
" {{{
let g:ctrlsf_ackprg='ag'
let g:ctrlsf_default_root = 'project'
nmap <c-e> <Plug>CtrlSFPrompt
vmap <c-e> <Plug>CtrlSFVwordExec
let g:ctrlsf_mapping = {
    \ "split": "",
    \ "vsplit": "<c-o>",
    \ }
let g:ctrlsf_ignore_dir = ['.svn', '.git', 'tags']
" }}}

" nerdcomment
" {{{
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
" }}}

" identline
" {{{
let g:indentLine_color_term = 66
" }}}

" tabular
" {{{
nmap <leader>t :Tabularize /
vmap <leader>t :Tabularize /
nmap <leader><leader>t :TrimSpacesCmd 
vmap <leader><leader>t :TrimSpacesCmd 

" tabular reverse
function! TrimSpaces(identifier, ...) range
    let l:l = 1
    let l:r = 1
    if a:0 == 2
        let l:l = a:1
        let l:r = a:2
    elseif a:0 == 1
        let l:l = a:1
    endif
    let l:l_match = '\s*'.a:identifier
    let l:r_match = a:identifier.'\s*'
    let l:l_replace = repeat(" ", l:l).a:identifier
    let l:r_replace = a:identifier.repeat(" ", l:r)
    let l:l_cmd = a:firstline.",".a:lastline.'s/'.l:l_match.'/'.l:l_replace.'/g'
    let l:r_cmd = a:firstline.",".a:lastline.'s/'.l:r_match.'/'.l:r_replace.'/g'
    silent execute l:l_cmd
    silent execute l:r_cmd
    let @/=''
    nohl
endfunction

function! TrimSpacesCmd(args) range
    let arg_list = split(a:args)
    " get indentifier
    let indentifier = ''
    if len(arg_list) >= 1
        let indentifier = arg_list[0]
    else
        return
    endif
    " check indentifier
    for line in getline(a:firstline, a:lastline)
        if match(line, indentifier) < 0
            return
        endif
    endfor
    " expend range
    let start_line = a:firstline
    let end_line = a:lastline
    while start_line >= 1
        if match(getline(start_line), indentifier) < 0
            break
        endif
        let start_line -= 1
    endwhile
    while end_line <= line('$')
        if match(getline(end_line), indentifier) < 0
            break
        endif
        let end_line += 1
    endwhile
    let start_line += 1
    let end_line -= 1
    if len(arg_list) == 1
        execute start_line.','.end_line 'call TrimSpaces("'.arg_list[0].'")'
    elseif len(arg_list) == 2                                                
        execute start_line.','.end_line 'call TrimSpaces("'.arg_list[0].'",'.arg_list[1].')'
    elseif len(arg_list) == 3                                                
        execute start_line.','.end_line 'call TrimSpaces("'.arg_list[0].'",'.arg_list[1].','.arg_list[2].')'
    endif
endfunction

command! -bar -nargs=? -range TrimSpacesCmd <line1>,<line2>call TrimSpacesCmd(<q-args>)

" }}}

" conque
" {{{
" no warning
let g:ConqueTerm_StartMessages = 0
" }}}

" Vim-markdown
" {{{
" Disabled automatically folding
let g:vim_markdown_folding_disabled=1
" LeTeX math
let g:vim_markdown_math=1
" Highlight YAML frontmatter
let g:vim_markdown_frontmatter=1
" }}}

" Vim-instant-markdown
" {{{
" If it takes your system too much, you can specify
" let g:instant_markdown_slow = 1
" if you don't want to manually control it
" you can open this setting
" and when you open this, you can manually trigger preview
" via the command :InstantMarkdownPreview
let g:instant_markdown_autostart = 0
"set shell=bash\ -i
nmap <leader>rm :InstantMarkdownPreview<cr>
" }}}

" gundo
" {{{
nnoremap U :GundoToggle<CR>
let g:gundo_preview_bottom = 1
let g:gundo_close_on_revert = 1
" }}}

" impsort
" {{{
let g:impsort_start_nextline = 1
highlight pythonImportedObject ctermfg=152 guifg=#afd7d7
"highlight pythonImportedObject ctermfg=145 guifg=#afafaf
"highlight pythonImportedObject ctermfg=109 guifg=#87afaf
"highlight pythonImportedObject ctermfg=110 guifg=#87afd7
"highlight pythonImportedObject ctermfg=116 guifg=#87d7d7
" }}}
