# Copy different config files up into the home dir
# Verbosely (-v) and recursively (-r). Copy the permissions (-p) as well
cp -vrp {.vim/, .vimrc, .tmux.conf} ~/
# Install all vim vundle plugins
vim +PluginInstall
