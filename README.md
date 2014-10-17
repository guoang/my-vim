    cd ~
    mv .vimrc .vimrc.bak
    mv .vim .vim.bak
    git clone git@github.com:guoang/my-vim.git ~/.vim
    ln -s .vim/vimrc .vimrc
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

在vim中normal模式下：

    :BundleInstall!
