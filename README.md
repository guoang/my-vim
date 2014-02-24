    cd ~
    mv .vim .vimbak
    git clone git@github.com:guoang/my-vim.git ~/.vim
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

在vim中normal模式下：

    :BundleInstall!
