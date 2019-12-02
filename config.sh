# Verbosely and recursively copy different config files up into the home dir
cp -vr {.vim/,.vimrc,.tmux.conf} ~/
# Install all vim vundle plugins
vim +PluginInstall
