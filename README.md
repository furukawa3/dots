# dots etc..

This repository is to manage my dot files and nit tools.

# Requirement

* Vim > 8.x
* git
* gcc
* make
* jq

## CentOS

```
sudo yum install -y gcc make jq python3-devel ruby-devel lua-devel ncurses-devel
cd ~/
git clone https://github.com/vim/vim.git; cd vim
sudo ./configure --with-features=huge --enable-multibyte --enable-luainterp=dynamic --enable-gpm --enable-cscope --enable-fontset --enable-fail-if-missing --prefix=/usr/local --enable-pythoninterp=dynamic --enable-python3interp=dynamic --enable-rubyinterp=dynamic
make
make install
python3 -m pip pynvim --upgrade
```

# Initialization

```bash
mkdir -p ~/.cache/dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
ln -s ~/dots/vimrc ~/.vimrc
ln -s ~/dots/screenrc ~/.screenrc
```
* Refer: https://github.com/Shougo/dein.vim
