
## Installation

### 1. Get Vimrc

    # backup
    cd ~
    mv .vimrc .vimrc.bak
    mv .vim .vim.bak
    # get new
    git clone https://github.com/guoang/my-vim.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc

### 2. Edit vimrc

You may need to customize YouCompleteMe installation command:

    Plug 'Valloric/YouCompleteMe', {'do': './install.py'}

If you need c++ code completion support, and have **libclang** in your system, 
add `--clang-completer` option:

    Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'}

For more information, see [YouCompleteMe Installation](https://github.com/Valloric/YouCompleteMe#installation).

### 3. Install vim-plug

for Unix-Vim, just run:

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

For more information, see [vim-plug Installation](https://github.com/junegunn/vim-plug#installation).

### 4. Install plugins

In vim normal mode, run:

    :PlugInstall

