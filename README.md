# dots

# Requirement

* Vim > 8.x

# Initialization for Ubuntu

```bash
sudo -E apt install -y git gcc make
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh
mkdir -p ~/.vim/rc
ln -s ~/dots/.vim/rc/dein.toml ~/.vim/rc/dein.toml
ln -s ~/dots/.vim/rc/dein_lazy.toml  ~/.vim/rc/dein_lazy.toml
```
* Refer: https://github.com/Shougo/dein.vim
