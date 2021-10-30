# install brew and brew-bundle, then install apps
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap Homebrew/bundle
brew bundle --file ~/.dotfiles/Brewfile

# make config directory
mkdir -p ~/.config/nvim
# set up symlinks
ln -s ~/.dotfiles/.config/nvim/init.vim .config/nvim/init.vim
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
# Install vim-plug plugins
vim +PlugInstall
# Change default login shell to zshell
chsh --shell zsh
