hg clone https://vim.googlecode.com/hg/ vim
cd vim
hg pull
hg update
./configure --with-features=huge --enable-gui=gnome2 \
  --enable-perlinterp --enable-pythoninterp \
  --enable-python3interp --enable-rubyinterp \
  --enable-luainterp --with-luajit \
  --enable-fail-if-missing \
  --prefix=/usr/local

make
sudo make install
