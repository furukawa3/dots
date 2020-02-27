# dots etc..

This repository is to manage my dot files and nit tools.

# Requirement

* Vim > 8.x
* git
* gcc
* make
* jq

# Initialization for Ubuntu

```bash
mkdir -p ~/.cache/dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
ln -s ~/dots/vimrc ~/.vimrc
ln -s ~/dots/screenrc ~/.screenrc
```
* Refer: https://github.com/Shougo/dein.vim
