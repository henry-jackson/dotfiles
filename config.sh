# Copy different config files up into the home dir
# Verbosely (-v) and recursively (-r). Copy the permissions (-p) as well
cp -vrp {.vim/, .vimrc, .tmux.conf} ~/
mkdir -p ~/.config/nvim
cp -vrp .config/ ~/.config
# Install all vim vundle plugins
vim +PlugInstall
# Change default login shell to zshell
chsh --shell zsh
# Install Terminal font
./font_install.sh
