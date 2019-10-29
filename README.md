# ubuntu_backup
우분투 사용시 생성된 dotfile 들을 백업하기 위한 저장소.

아래 링크 내용을 이용하여 작성하였음.
https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/

power shell : https://github.com/b-ryan/powerline-shell

## 복원용 bash script.

```bash
git clone --bare https://github.com/melampokr/ubuntu_backup.git $HOME/.cfg

function config {
  /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

mkdir -p .config-backup
config checkout

if [ $? = 0 ]; then
  echo "Checked out config.";
else
  echo "Backing up pre-existing dot files.";
  config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;

config checkout
config config status.showUntrackedFiles no

sudo apt install python-pip cscope ctags

pip install powerline-shell

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

```
