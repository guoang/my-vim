" Upload File
" {{{
function! UploadG78()
    if &ft != 'python' && &ft != 'markdown' && &ft != 'cpp' && &ft != 'c'
        return
    endif
    let g78_root = '/Users/guoang/work/g78/trunk/'
    let abs_path = expand('%:p')
    if abs_path =~ g78_root
        let rel_path = split(abs_path, g78_root)[0]
        call job_start('scp -P 32200 ' . expand('%:p') . ' gzguoang@dev:~/g78/trunk/'.rel_path)
        call job_start('scp ' . expand('%:p') . ' guoang@home_win:~/work/g78/trunk/'.rel_path)
        call job_start('scp ' . expand('%:p') . ' guoang@home_win:~/work/g78/trunk2/'.rel_path)
        call job_start('scp ' . expand('%:p') . ' gzguoang@office_win:D:/work/g78/trunk/'.rel_path)
        call job_start('scp ' . expand('%:p') . ' gzguoang@office_win:D:/work/g78/trunk2/'.rel_path)
    endif
endfunction
auto BufWritePost *.markdown,*.md,*.py,*.cpp,*.cc,*.c,*.h,*.hpp call UploadG78()
" }}}

" Plug settings
" {{{
call plug#begin('~/.vim/plugged')
" Appearance
Plug 'vim-airline/vim-airline'
Plug 'guoang/vim-airline-themes'
Plug 'guoang/vim-polyglot', {'for': []}
" Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'
" Plug 'luochen1990/rainbow'    # 括号着色
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" edit assist
Plug 'guoang/delimitMate'
Plug 'guoang/smartim'
Plug 'guoang/jumpstack.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
" Plug 'sjl/gundo.vim'
Plug 'google/vim-searchindex'
" Plug 'hotoo/pangu.vim'
" Plug 'tpope/vim-unimpaired'
Plug 'godlygeek/tabular', {'on': 'Tabularize'}
" system support
Plug 'skywind3000/asyncrun.vim'
Plug 'danro/rename.vim'
" Plug 'tpope/vim-obsession', {'do': 'vim -u NONE -c \"helptags doc\" -c q'}
" project support
Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'ludovicchabant/vim-gutentags'
" Plug 'dyng/ctrlsf.vim', {'on': ['<Plug>CtrlSFPrompt', '<Plug>CtrlSFVwordExec']}
Plug 'guoang/LeaderF', {'do': './install.sh'}
" language support
" Plug 'Shougo/echodoc.vim'
Plug 'w0rp/ale'
Plug 'rizzatti/dash.vim'
" C/C++
Plug 'ycm-core/YouCompleteMe', {'do': './install.py --clang-completer'}
Plug 'rhysd/vim-clang-format', {'for': ['c', 'cpp']}
Plug 'micbou/a.vim'
" Plug 'majutsushi/tagbar'  " too slow!!
" Plug 'uplus/vim-clang-rename', {'for': ['c', 'cpp']}
" python
Plug 'vim-python/python-syntax', {'for': ['python']}
" Plug 'Vimjas/vim-python-pep8-indent', {'for': ['python']}  " too slow
" markdown
Plug 'plasticboy/vim-markdown', {'for': []}
Plug 'mzlogin/vim-markdown-toc', {'for': []}
" lua
" Plug 'vim-scripts/lua.vim', {'for': ['lua']}
" Plug 'xolox/vim-lua-ftplugin', {'for': ['lua']}
" Plug 'xolox/vim-misc', {'for': ['lua']}

" Plug Lazy Loading
" {{{
augroup plug_xtype
    autocmd FileType * if expand('<amatch>') != 'markdown' && expand('<amatch>') != 'python' | call plug#load('vim-polyglot') | execute 'autocmd! plug_xtype' | endif
augroup END
augroup plug_xtype
    autocmd FileType * if expand('<amatch>') == 'markdown' | call plug#load('vim-markdown') | execute 'autocmd! plug_xtype' | endif
augroup END
augroup plug_xtype
    autocmd FileType * if expand('<amatch>') == 'markdown' | call plug#load('vim-markdown-toc') | execute 'autocmd! plug_xtype' | endif
augroup END
nnoremap <F3> :NERDTreeToggle<cr>
" nmap <c-e> <Plug>CtrlSFPrompt
" vmap <c-e> <Plug>CtrlSFVwordExec
" }}}

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
" backspace
set backspace=indent,eol,start
" 共享剪贴板
set clipboard=unnamed
" 自动缩进
set autoindent
" 采用C自动缩进方式
set cindent
set sw=4
" 行号
set nu
" tab转空格
set tabstop=4
set expandtab
" 折叠方式
set fdm=marker
" scroloffset
set scrolloff=7
" 不要自动切换目录
set noautochdir
" tags
" set tags=./.tags;,.tags;
" encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-brm,utf-8,chinese,cp936
" highlight line, slow down cursor move
" set cursorline
if has("win32")
    set lines=54 columns=200
    set langmenu=zh_CN
    let $LANG='zh_CN.UTF-8'
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
endif
" 缺省的，vim会使用下拉菜单和一个preview窗口来显示匹配项目，
" 下拉菜单列出所有匹配的项目，预览窗口则显示选中项目的详细信息。
" 打开预览窗口会导致下拉菜单抖动，因此我一般都去掉预览窗口的显示
" :help completeopt
set completeopt=longest,menu
" switchbuf
set switchbuf=vsplit

" set mouse=a

syntax on

" 配色
" let g:rehash256 = 1
" colo molokai

" onedark
" {{{
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
" }}}
colo onedark
nnoremap zff zf%
" 窗口缩放
nnoremap <c-h> :vertical resize -3<cr>
nnoremap <c-l> :vertical resize +3<cr>
" tab
nnoremap <tab> <c-w>w
nnoremap <s-tab> <c-w>W
" location list
" nnoremap gn :lne<CR>
" nnoremap gp :lp<CR>
" 防止误按f1
nnoremap <f1> <esc>
inoremap <f1> <esc>
vnoremap <f1> <esc>
cnoremap <f1> <esc>
" motion
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-f> <right>
inoremap <c-b> <left>
" reload config
nnoremap <leader><leader><leader> :source ~/.vim/vimrc<cr>:YcmRestartServer<cr>
" jumplist
" nnoremap <c-n> <c-i>
" nnoremap <c-o> <c-o>
autocmd VimEnter * clearjumps
" nnoremap G :execute 'keepjumps norm! G'<cr>
" nnoremap % :execute 'keepjumps norm! %'<cr>
" nnoremap n :execute 'keepjumps norm! ' . v:count1 . 'n'<cr>:SearchIndex<cr>
" nnoremap N :execute 'keepjumps norm! ' . v:count1 . 'N'<cr>:SearchIndex<cr>
" nnoremap ( :execute 'keepjumps norm! ' . v:count1 . '('<cr>
" nnoremap ) :execute 'keepjumps norm! ' . v:count1 . ')'<cr>
" nnoremap { :execute 'keepjumps norm! ' . v:count1 . '{'<cr>
" nnoremap } :execute 'keepjumps norm! ' . v:count1 . '}'<cr>
" nnoremap [[ :execute 'keepjumps norm! ' . v:count1 . '[['<cr>
" nnoremap ]] :execute 'keepjumps norm! ' . v:count1 . ']]'<cr>

language message zh_CN.utf-8

" detect filetype
au BufRead,BufNewFile *.spzs set filetype=spzs
au BufRead,BufNewFile *.{fx,nfx,tml,fxl} set filetype=hlsl
au BufRead,BufNewFile *.{vs,ps,fs} set filetype=glsl
" exc to quit quickfix/locationlist
au FileType qf nnoremap <buffer><silent> <esc> :quit<cr>
au FileType qf nnoremap <buffer><silent> q :quit<cr>

" 粘贴时不拷贝
vnoremap p "_dP

" 检测 ~/.cache/vim_undo 不存在就新建
if !isdirectory(expand('~/.cache/vim_undo'))
   silent! call mkdir(expand('~/.cache/vim_undo'), 'p')
endif
" put undo file into cache dir
set undodir=~/.cache/vim_undo/
set undofile
" }}}

" nerdTree
" {{{
let NERDTreeIgnore=['\.pyc', '\.pyo', '\~$', '\.swp']
" }}}

" vim-airline
" {{{
set laststatus=2
" let g:airline_theme = "jellybeans"
let g:airline_theme = "onedark"
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

" YouCompleteMe
" {{{
" let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
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
  \ 'notes': 1,
  \ 'nerdtree' : 1,
  \ 'ctrlsf': 1,
  \ 'ctrlp': 1,
  \ 'leaderf': 1,
  \ 'help': 1,
  \ 'md': 1,
  \ 'markdown': 1,
  \ 'mail': 1,
  \}
" use c-n/c-p, default tab/s-tab
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
" debug
let g:ycm_server_use_vim_stdout = 1
" let g:ycm_log_level = 'debug'
" trigger
let g:ycm_min_num_of_chars_for_completion = 99
" let g:ycm_auto_trigger = 0

" Diagnostics
let g:ycm_show_diagnostics_ui = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>'

" hover
let g:ycm_auto_hover = ''

" key maps
nmap gh <plug>(YCMHover)
noremap gc :exec "YcmForceCompileAndDiagnostics"<cr>
noremap gd :exec "YcmDiags"<cr>
noremap gt :exec "YcmCompleter GetType"<cr>
noremap gp :exec "YcmCompleter GetParent"<cr>
noremap gf :exec "YcmCompleter FixIt"<cr>
" }}}

" gutentags
" {{{
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
" let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_project_root = ['.svn', '.git', '.hg']

" enable gtags module
let g:gutentags_modules = ['ctags']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.ctags'

" 将自动生成的 tags 文件全部放入 ~/.cache/ctags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/gutentags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

let g:gutentags_project_root_finder = "GutentagsCustomRoot"
function! GutentagsCustomRoot(filepath)
    " 检查leaderf生成的gtags，有才生成对应的ctags
    let s = "def _gutentags_custom_root(filepath):\n"
    let s = s."  import os\n"."  import os.path\n"."  import re\n"
    let s = s."  lf_db_location = r'/Users/guoang/.cache/leaderf/.LfCache/gtags'\n"
    let s = s."  if os.name == 'nt':\n"
    let s = s."    path_name = re.sub(r'[\\/]', '_', os.path.dirname(filepath).replace(r':\', '_', 1))\n"
    let s = s."  else:\n"
    let s = s."    path_name = os.path.dirname(filepath).replace('/', '_')\n"
    let s = s."  if os.path.exists(lf_db_location):\n"
    let s = s."    for path, dir_list, file_list in os.walk(lf_db_location):\n"
    let s = s."      dir_list.sort(key=lambda i: -len(i))\n"
    let s = s."      for d in dir_list:\n"
    let s = s."        if path_name.startswith(d):\n"
    let s = s."          with open(os.path.join(lf_db_location, d, 'GROOT'), 'r') as f:\n"
    let s = s."            root = f.read()\n"
    let s = s."            print(root)\n"
    let s = s."          return\n"
    execute("py3 ".s)
    let s = "_gutentags_custom_root('".a:filepath."')"
    let ret = execute("py3 ".s)
    return ret[1:]
endfunction
" }}}

" ctrlsf
" {{{
" let g:ctrlsf_ackprg='ag'
" let g:ctrlsf_default_root = 'project+fw'
" let g:ctrlsf_mapping = {
"     \ "split": "",
"     \ "vsplit": "<c-o>",
"     \ }
" let g:ctrlsf_ignore_dir = ['.svn', '.git', 'tags', 'build']
" let g:ctrlsf_extra_root_markers = ['.root']
" let g:ctrlsf_auto_focus = {
"     \ "at": "start"
"     \ }
" }}}

" nerdcommenter
" {{{
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
let g:NERDRemoveExtraSpaces = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 0
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_c = 1
let g:NERDAltDelims_python = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = {
            \ 'python': { 'left': '#', 'right': '' },
            \ }
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
nnoremap <leader>t :Tabularize /
vnoremap <leader>t :Tabularize /
nnoremap <leader><leader>t :TrimSpacesCmd
vnoremap <leader><leader>t :TrimSpacesCmd

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

" trim unused whitespaces
" {{{
fun! TrimUnusedWhitespaces()
    if &ft != 'cpp' && &ft != 'c' && &ft != 'python'
        return
    endif
    let cursor_pos = getpos('.')
    silent! %s/\s\+$//e
    call setpos('.', cursor_pos)
endfunction
au BufWritePre *.{cpp,c,cc,hpp,h,hh,py} :call TrimUnusedWhitespaces()
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
" autocmd filetype markdown call system('open -a /Applications/Markdown\ Mate.app -g ' . expand('%:p'))
" }}}

" gundo
" {{{
" nnoremap U :GundoToggle<CR>
" let g:gundo_preview_bottom = 1
" let g:gundo_close_on_revert = 1
" }}}

" smartim
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

" vim-polyglot
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

" clang-format
" {{{
let g:clang_format#code_style = 'google'
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format = 1
let g:clang_format#auto_format_on_insert_leave = 0
" }}}

" asyncrun
" {{{
" 自动打开 quickfix window ，高度为20
let g:asyncrun_open = 10
" 任务结束时候响铃提醒
let g:asyncrun_bell = 1
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml']

function! RunPython()
    if &ft != 'python'
        return
    endif
    if has("win32")
        exe 'AsyncRun -raw -cwd=%:p:h python.exe %:p'
    else
        exe 'AsyncRun -raw -cwd=%:p:h python %:p'
    endif
endfunction

function! RunCpp()
    if &ft != 'cpp' && &ft != 'c'
        return
    endif
    let filename = expand('%:p')
    let prefix = join(split(filename, '\.')[:-2], '.')
    let compile = 'c++ '.filename.' -g -std=c++17 -I/usr/local/include/ -L/usr/local/lib -lboost_system -o '.prefix
    exe 'AsyncRun -raw -cwd=%:p:h '.compile.';'.prefix.';rm '.prefix
endfunction

function! RunDot()
    if &ft  != 'dot'
        return
    endif
    let filename = expand('%:p')
    let prefix = join(split(filename, '\.')[:-2], '.')
    let compile = 'dot -T svg -o '.prefix.'.svg '.filename
    exe 'AsyncRun -raw -post=exe\ "cclose" -cwd=%:p:h '.compile.'; open '.prefix.'.svg'
endfunction

function! RunMarkdown()
    if &ft  != 'markdown'
        return
    endif
    " call system('open -a /Applications/Markdown\ Mate.app -g ' . expand('%:p'))
    "
    " call system('cp ' . expand('%:p') . ' ~/git/markdown-plus/dist/sample.md')
    " call system('cp ' . expand('%:p') . ' ~/git/markdown-plus/node_modules/markdown-core/dist/sample.md')
    "
    let cmd = '!open http://guoang.me/md\?name\=' . shellescape(expand('%:t'))
    call job_start(cmd)
endfunction

function! UploadMarkdown()
    if &ft  != 'markdown'
        return
    endif
    let cmd = 'scp -i ~/.ssh/id_rsa ' . shellescape(expand('%:p')) . ' http@vultr:~/www/md/'
    call job_start(cmd)
    " exe 'AsyncRun -post=exe\ "cclose" ' . cmd
endfunction
" auto upload markdown
auto BufWritePost *.markdown,*.md call UploadMarkdown()

function! RunPhp()
    if &ft  != 'php'
        return
    endif
    if has("win32")
        exe 'AsyncRun -raw -cwd=%:p:h php.exe %:p'
    else
        exe 'AsyncRun -raw -cwd=%:p:h php %:p'
    endif
endfunction

function! RunGo()
    if &ft  != 'go'
        return
    endif
    exe 'GoRun'
endfunction

function! QuickRun()
    call RunCpp()
    call RunPython()
    call RunDot()
    call RunMarkdown()
    call RunPhp()
    call RunGo()
endfunction
nnoremap <leader>r :call QuickRun()<cr>

" force stop
au FileType qf nnoremap <buffer><silent> <c-c> :AsyncStop!<cr>

" cpp project
au FileType c,cpp nnoremap <silent> <f5> :AsyncRun -cwd=<root>/build -raw make<cr>
au FileType c,cpp nnoremap <silent> <f6> :AsyncRun -cwd=<root>/build -raw make test<cr>
au FileType c,cpp nnoremap <silent> <f7> :AsyncRun -cwd=<root>/build -raw cmake ..<cr>
" }}}

" quickfix
" {{{
" This function works only on language is English.
function! IsQuickfixLoaded()
    redir => bufoutput
    exe "silent! buffers!"
    " This echo clears a bug in printing that shows up when it is not present
    silent! echo ""
    redir END
    return match(bufoutput, "Quickfix", 0, 0) != -1
endfunction
function! ToggleQuickfix()
    if IsQuickfixLoaded()
        :ccl
        :exec "normal! \<c-w>l"
    else
        :copen
        :exec "normal! \<c-w>J"
    endif
endfunction
nnoremap <leader>q :call ToggleQuickfix()<cr>
" }}}

" locationlist
" {{{
function! IsLocationLoaded()
    redir => bufoutput
    exe "silent! buffers!"
    " This echo clears a bug in printing that shows up when it is not present
    silent! echo ""
    redir END
    return match(bufoutput, "Location", 0, 0) != -1
endfunction
function! ToggleLocationList()
    if IsLocationLoaded()
        :lclose
        :exec "normal! \<c-w>l"
    else
        :lopen
        :exec "normal! \<c-w>J"
    endif
endfunction
nnoremap <leader>l :call ToggleLocationList()<cr>
" }}}

" echodoc
" {{{
" set noshowmode
" let g:echodoc#enable_at_startup = 1
" let g:echodoc#enable_force_overwrite = 1
" let g:echodoc#type = "float"
" }}}

" leaderf
" {{{
noremap <c-o> :Leaderf file<cr>
noremap <c-y> :Leaderf bufTag<cr>
noremap <c-e> :<c-u><c-r>=printf("Leaderf rg --regexMode -e %s", expand("<cword>"))<cr>
noremap gr :<C-U><C-R>=printf("Leaderf gtags --auto-jump -r %s", expand("<cword>"))<CR><CR>
" noremap gn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
" noremap gp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
let g:Lf_RootMarkers = ['.root', '.svn', '.git']
let g:Lf_Gtagslabel = 'native-pygments'
let g:Lf_Gtagsconf = '/usr/local/share/gtags/gtags.conf'
let g:Lf_GtagsAutoGenerate = 0  "1 will slowdown startup time
let g:Lf_WorkingDirectoryMode = 'Aa'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.cache/leaderf')
let g:Lf_UseCache = 1
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_ShowHidden = 1
let g:Lf_FollowLinks = 1
let g:Lf_StlColorscheme = 'default'
let g:Lf_UseVersionControlTool = 0
let g:Lf_DefaultExternalTool = 'rg'
let g:Lf_WildIgnore = {
    \ 'dir': ['.git', '.svn', '.hg', 'build'],
    \ 'file': ['*.sw?','~$*','*.exe','*.so','*.dylib','*.o','*.py[co]','*.a']
    \}
let g:Lf_WindowPosition = 'bottom'
let g:Lf_PopupWidth = 0.8
let g:Lf_PopupHeight = 0
let g:Lf_PopupPosition = [20, 0]
let g:Lf_PopupPreviewPosition = 'top'
let g:Lf_PopupColorscheme = 'default'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewHorizontalPosition = 'center'
let g:Lf_PreviewPopupWidth = 0
let g:Lf_AutoResize = 1
let g:Lf_PreviewCode = 1
let g:Lf_PreviewResult = { 'rg': 0, 'gtags': 0 }
autocmd BufEnter * setlocal bufhidden=unload
" }}}

" 跳转
" {{{
function! GoYcm()
    exec "YcmCompleter GoTo"
endfunction

function! GoTags()
    " slow if tags file is very large
    if tagfiles() == []
        return
    endif
    exec 'tjump '.expand('<cword>')
endfunction

function! GoGTags()
    exec printf("Leaderf gtags --auto-jump -d %s", expand("<cword>"))
endfunction

function! SmartGoTo()
    call jumpstack#Mark()
    let old_file = expand('%:p')
    let old_pos = getpos('.')
    if old_file == expand('%:p') && old_pos == getpos('.')
        call GoYcm()
    endif
    if old_file == expand('%:p') && old_pos == getpos('.')
        call GoGTags()
    endif
    if old_file != expand('%:p')
        " 删掉OnBufRead标记的位置
        call jumpstack#Pop()
    endif
    call jumpstack#Mark()
endfunction

noremap gd :call SmartGoTo()<cr>
" }}}

" ale
" {{{
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_filetype_changed = 0
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_set_highlights = 0
let g:ale_set_signs = 0
let g:ale_echo_cursor = 0
let g:ale_set_balloons = 0
let g:ale_linters_explicit = 1
let g:ale_linters = {
    \ 'markdown': ['alex'],
    \ 'python': ['flake8'],
    \ 'cpp': ['cpplint'],
    \ 'c': ['cpplint']
    \}
let g:ale_fixers = {
    \ 'python': ['autopep8'],
    \}
let g:ale_python_pycodestyle_options = '
    \--ignore=E221,E203,E501,C901,E272,E129,W0404,E722,W503,W504,E241
    \'
let g:ale_python_flake8_options = '
    \--builtins=logger,gdata,gtime,sa_logger,genv,core_env,visual_env,hall_env,
        \action_env,gui,DebugLogic,mapper,robot_hooks_mgr,gblog,message,uisystem,
        \watch_env
    \ --ignore=E221,E203,E501,C901,E272,E129,W0404,E722,W503,W504,E241
    \'
let g:ale_python_flake8_executable = 'python2'
let g:ale_python_autopep8_options = '
    \--ignore=E221,E203,E501,C901,E272,E129,W0404,E722,W503,W504,E241
    \'
" }}}

" python-syntax
" {{{
let g:python_highlight_all = 1
let g:python_version_2 = 1
" }}}

" profile vim
" {{{
function! StartProfile()
    exe "profile start profile.log"
    exe "profile func *"
    exe "profile file *"
endfunction

function! StopProfile()
    exe "profile pause"
endfunction
" }}}

" jumpstack
" {{{
nnoremap <c-n> :call jumpstack#JumpNext()<cr>
nnoremap <c-p> :call jumpstack#JumpPrevious()<cr>
autocmd BufLeave * call jumpstack#Mark()
autocmd BufReadPost * call jumpstack#Mark()
" }}}

" dash
" {{{
nmap <c-d> :<c-u><c-r>=printf("Dash %s", expand("<cword>"))<cr><cr>
let g:dash_map = {
    \ 'c' : ['c', 'c++'],
    \ 'cpp': ['c', 'c++'],
    \ 'py': ['python2', 'python3'],
    \ 'markdown': ['markdown'],
    \ 'vim': ['vim'],
    \ 'cmake': ['cmake'],
    \ 'zsh': ['bash'],
    \ 'bash': ['bash'],
    \ 'sh': ['bash'],
    \ 'shell': ['bash']
    \ }
" }}}

" pangu
" {{{
" autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()
" }}}

"easymotion
" {{{
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 0
 " type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap ff <Plug>(easymotion-overwin-f2)
map fn <Plug>(easymotion-sn)
omap fn <Plug>(easymotion-tn)
map fl <Plug>(easymotion-lineforward)
map fj <Plug>(easymotion-j)
map fk <Plug>(easymotion-k)
map fh <Plug>(easymotion-linebackward)
" }}}

" tagbar
" {{{
" nmap <F8> :TagbarToggle<CR>
" }}}

" rainbow
" {{{
" let g:rainbow_active = 0
" let g:rainbow_conf = {
" \	'guifgs': ['white', 'yellow', 'cyan', 'magenta'],
" \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
" \	'operators': '_,_',
" \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
" \	'separately': {
" \		'*': {},
" \		'tex': {
" \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
" \		},
" \		'lisp': {
" \			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
" \		},
" \		'vim': {
" \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
" \		},
" \		'html': {
" \			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
" \		},
" \		'css': 0,
" \	}
" \}
" }}}
