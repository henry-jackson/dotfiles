mkdir -p ~/.config/nvim
# set up symlinks
ln -s ~/.dotfiles/.config/nvim/init.vim .config/nvim/init.vim
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
# Install vim-plug plugins
vim +PlugInstall
# Change default login shell to zshell
chsh --shell zsh
