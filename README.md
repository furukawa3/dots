# dots

# Requirement

* Vim > 8.x

# Initialization for Ubuntu

```bash
sudo -E apt install -y git gcc make
mkdir -p ~/.cache/dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
ln -s ~/dots/vimrc ~/.vimrc
ln -s ~/dots/screenrc ~/.screenrc
```
* Refer: https://github.com/Shougo/dein.vim
