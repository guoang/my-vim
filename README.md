## 简介

分享我的vim配置，对python和c++开发者会更友好。
会不定期更新。

包含的主要插件：

* C++ && python开发
 * python-mode
 * conque
 * YouCompleteMe
 * tagbar
 * ultisnips
 * vim-snippets
* 外观
 * vim-airline
 * vim-airline-themes
 * molokai
 * vim-colors-solarized
 * wombat
 * tir_black
 * indentLine
* 其他
 * ctrlp.vim
 * ctrlsf.vim
 * tabular
 * nerdcommenter
 * delimitMate
 * vim-gitgutter
 * vim-polyglot


## 安装

#### 备份

    # backup
    cd ~
    mv .vimrc .vimrc.bak
    mv .vim .vim.bak

#### 下载vundle和vimrc

    # install new
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    git clone git@github.com:guoang/my-vim.git ~/.vim
    ln -s .vim/vimrc .vimrc

#### 安装插件

在vim中normal模式下输入：

    :PluginInstall

旧版本的Vundle安装插件的指令是BundleInstall。具体的命令取决于你安装的Vundle版本。

#### 注意

1. 这份配置里绑定了很多快捷键，你可以按照自己的习惯绑定别的。
2. 有些插件不是即插即用的，需要一些其他的工作。如YouCompleteMe的C++补全需要libclang支持，ctrlsf的搜索依赖于ag。建议自己去这些插件的github repo阅读ReadMe。
