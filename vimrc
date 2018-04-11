" Python Path
" {{{
function! InitPythonPath()
    let s:python_path = ['.']
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

" Plug settings
" {{{
call plug#begin('~/.vim/plugged')
" airline
Plug 'vim-airline/vim-airline'
Plug 'guoang/vim-airline-themes'
" git
" Plug 'airblade/vim-gitgutter'
" svn
" Plug 'mhinz/vim-signify'
" tagbar, too slow!!
" Plug 'majutsushi/tagbar'
" 括号自动补全
Plug 'guoang/delimitMate'
" close tag
" Plug 'docunext/closetag.vim'
" YouCompleteMe
Plug 'Valloric/YouCompleteMe', {'do': './install.py'}
" color
Plug 'tomasr/molokai'
"Plug 'altercation/vim-colors-solarized'
"Plug 'vim-scripts/wombat'
"Plug 'tir_black'
" python
Plug 'guoang/python-mode', {'for': ['python'], 'branch': 'master'}
" sort import, better than isort
Plug 'guoang/impsort.vim', {'for': ['python']}
" 交互式运行python
Plug 'nicoraffo/conque', {'for': ['python']}
" C
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
" 目录
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
nmap <F3> :NERDTreeToggle<cr>
" 快速注释
Plug 'scrooloose/nerdcommenter'
" 语法高亮
Plug 'guoang/vim-polyglot', {'for': []}
augroup plug_xtype
    autocmd FileType * if expand('<amatch>') != 'markdown' && expand('<amatch>') != 'python' | call plug#load('vim-polyglot') | execute 'autocmd! plug_xtype' | endif
augroup END
" 快速打开
Plug 'guoang/ctrlp.vim', {'on': 'CtrlP'}
nmap <c-p> :CtrlP<cr>
" 搜索
Plug 'dyng/ctrlsf.vim', {'on': ['<Plug>CtrlSFPrompt', '<Plug>CtrlSFVwordExec']}
nmap <c-e> <Plug>CtrlSFPrompt
vmap <c-e> <Plug>CtrlSFVwordExec
" 代码对齐
Plug 'godlygeek/tabular', {'on': 'Tabularize'}
" 快速补全片段
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
" 对齐线
" Plug 'Yggdroot/indentLine'
" markdown
Plug 'plasticboy/vim-markdown', {'for': []}
augroup plug_xtype
    autocmd FileType * if expand('<amatch>') == 'markdown' | call plug#load('vim-markdown') | execute 'autocmd! plug_xtype' | endif
augroup END
" markdown preview
"Plug 'suan/vim-instant-markdown' -- good but too old, no mermaid support
"Plug 'kannokanno/previm' -- with mermaid but not good enough
" I use markdown-mate now, it's fantastic
" https://tylingsoft.com/markdown-mate/
" https://mdp.tylingsoft.com/
" auto gen toc
Plug 'mzlogin/vim-markdown-toc', {'for': []}
augroup plug_xtype
    autocmd FileType * if expand('<amatch>') == 'markdown' | call plug#load('vim-markdown-toc') | execute 'autocmd! plug_xtype' | endif
augroup END

" lua
Plug 'vim-scripts/lua.vim', {'for': ['lua']}
Plug 'xolox/vim-lua-ftplugin', {'for': ['lua']}
Plug 'xolox/vim-misc', {'for': ['lua']}
" motion
Plug 'easymotion/vim-easymotion'
" undo
Plug 'sjl/gundo.vim'
" input method manage
Plug 'ybian/smartim'
call plug#end()
" }}}

" Builtin Settings
" {{{
set nocompatible
" 搜索时高亮目标文本
set hls
" 搜索时对大小写不敏感
set ignorecase smartcase
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
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
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
au BufRead,BufNewFile *.{fx,nfx,tml,fxl} set filetype=hlsl
au BufRead,BufNewFile *.{vs,ps,fs} set filetype=glsl
" 环境变量python path, ycm等插件会用到
let $PYTHONPATH = join(s:python_path, ':')
" 缺省的，vim会使用下拉菜单和一个preview窗口来显示匹配项目，
" 下拉菜单列出所有匹配的项目，预览窗口则显示选中项目的详细信息。
" 打开预览窗口会导致下拉菜单抖动，因此我一般都去掉预览窗口的显示
" :help completeopt
set completeopt=longest,menu
" reload config
nmap <leader><leader>r :source ~/.vimrc<cr>:YcmRestartServer<cr>
" set shell
"set shell=/usr/local/bin/zsh
" jumplist
autocmd VimEnter * clearjumps
nnoremap % :execute 'keepjumps norm! ' . v:count1 . '%'<cr>
nnoremap G :execute 'keepjumps norm! ' . v:count1 . 'G'<cr>
nnoremap M :execute 'keepjumps norm! ' . v:count1 . 'M'<cr>
nnoremap n :execute 'keepjumps norm! ' . v:count1 . 'n'<cr>
nnoremap N :execute 'keepjumps norm! ' . v:count1 . 'N'<cr>
nnoremap ( :execute 'keepjumps norm! ' . v:count1 . '('<cr>
nnoremap ) :execute 'keepjumps norm! ' . v:count1 . ')'<cr>
nnoremap { :execute 'keepjumps norm! ' . v:count1 . '{'<cr>
nnoremap } :execute 'keepjumps norm! ' . v:count1 . '}'<cr>
nnoremap [[ :execute 'keepjumps norm! ' . v:count1 . '[['<cr>
nnoremap ]] :execute 'keepjumps norm! ' . v:count1 . ']]'<cr>
" }}}

" nerdTree
" {{{
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
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
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
  \ 'md': 1,
  \ 'markdown': 1,
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
"let g:UltiSnipsSnippetDirectories=["plugged/vim-snippets/UltiSnips"]

" 参考https://github.com/Valloric/YouCompleteMe/issues/36#issuecomment-62941322
" 解决ultisnips和ycm tab冲突，如果不使用下面的办法解决可以参考
" https://github.com/Valloric/YouCompleteMe/issues/36#issuecomment-63205056的配置
" begin
"let g:UltiSnipsExpandTrigger="<Tab>"
"let g:UltiSnipsJumpForwardTrigger="<Tab>"
"let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
"" end
"
"" UltiSnips completion function that tries to expand a snippet. If there's no
"" snippet for expanding, if there's no :nippet it just returns TAB key
"function! g:UltiSnips_Complete()
"call UltiSnips#ExpandSnippet()
"if g:ulti_expand_res == 0
"    call UltiSnips#JumpForwards()
"    if g:ulti_jump_forwards_res == 0
"        return "\<TAB>"
"    endif
"endif
"return ""
"endfunction
"
""au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
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
let g:pymode_lint = 1
" check on write
let g:pymode_lint_on_write = 0
" default code checkers
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
" error message if cursor placed at the error line
let g:pymode_lint_message = 1
" 关闭自动弹出的错误信息窗口
let g:pymode_lint_cwindow = 0
" ignore
let g:pymode_lint_ignore = ['E221', 'E203', 'E501', 'C901', 'E272', 'E129', 'W0404', 'E722']
" ignore some builtins
let g:pymode_lint_options_pyflakes = { 'builtins': 'logger,gdata,gtime,sa_logger,genv,core_env,visual_env,hall_env,action_env,gui,DebugLogic,mapper,robot_hooks_mgr,gblog,message,uisystem' }
" customize motion
au FileType python nmap yim yiM | nmap yic yiC
au FileType python nmap dim diM | nmap dic diC
au FileType python nmap vim viM | nmap vic viC
au FileType python nmap yam yaM | nmap yac yaC
au FileType python nmap dam daM | nmap dac daC
au FileType python nmap vam vaM | nmap vac vaC
au FileType python nmap <f2> :PymodeLint<cr>
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
let g:ctrlp_lazy_del = 1
" }}}

" ctrlsf
" {{{
let g:ctrlsf_ackprg='ag'
let g:ctrlsf_default_root = 'project'
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
let g:vim_markdown_folding_disabled = 1
" no conceal
let g:vim_markdown_conceal = 0
" LeTeX math
let g:vim_markdown_math = 1
" Highlight YAML frontmatter
let g:vim_markdown_frontmatter = 1
" highlight json
let g:vim_markdown_json_frontmatter = 1
" no key maps
let g:vim_markdown_no_default_key_mappings = 1
" toc window auto fit
let g:vim_markdown_toc_autofit = 1
" no list indent
let g:vim_markdown_new_list_item_indent = 0

" }}}

" markdown-mate
" {{{
autocmd filetype markdown call system('open -a /Applications/Markdown\ Mate.app -g ' . expand('%:p'))
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

" smartim "
" {{{
let g:smartim_default = 'com.apple.keylayout.ABC'
" Function keys that start with an <Esc> are recognized in Insert
" mode.  When this option is off, the cursor and function keys cannot be
" used in Insert mode if they start with an <Esc>.  The advantage of
" this is that the single <Esc> is recognized immediately, instead of
" after one second. 
" NOTE: set noek conflict with nocompatible!
" set noek
" by default, timeoutlen is 1000 and ttimeoutlen is -1,
" that means vim wait 1000ms for a mapped key or key code sequence.
" It cause input method switches after a delay.
" set ttimeoutlen=0 tells vim don't wait for key code sequence,
" so that vim exit insert mode immediately after [ESC] pressed.
" see :h ttimeoutlen
set timeoutlen=1000 ttimeoutlen=0
" }}}

" polyglot
" {{{
" markdown交由vim-markdown
" python交由pymode
let g:polyglot_disabled = ['markdown', 'python']
" }}}

" delimitMate
" {{{
" <bs> 的绑定会被YCM覆盖, 这里需要手动设置一下
imap <bs> <Plug>delimitMateBS
let b:delimitMate_balance_matchpairs = 1
" }}}
