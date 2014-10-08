apt-get update -y
apt-get upgrade -y
apt-get install git make curl -y

# vim
# apt-get build-dep vim -y

apt-get install mercurial gettext libncurses5-dev libacl1-dev libgpm-dev -y
apt-get install libperl-dev python-dev python3-dev ruby-dev -y
apt-get install lua5.2 liblua5.2-dev -y
apt-get install luajit libluajit-5.1 -y

hg clone https://vim.googlecode.com/hg/ vimbuild
cd vimbuild \
  && hg pull \
  && hg update \
  && ./configure --with-features=huge --enable-gui=gnome2 \
                 --enable-perlinterp --enable-pythoninterp \
                 --enable-python3interp --enable-rubyinterp \
                 --enable-luainterp --with-luajit \
                 --enable-fail-if-missing \
                 --prefix=/usr/local \
   && make \
   && sudo make install

cd ..
rm -r vimbuild

apt-get autoremove

curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
wget https://raw.githubusercontent.com/mitsuchie/vim/master/_vimrc ~/.vimrc
