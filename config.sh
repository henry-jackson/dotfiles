# install brew and brew-bundle, then install apps
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap Homebrew/bundle
brew bundle --file ~/.dotfiles/Brewfile

# install vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# make config directory
mkdir -p ~/.config/nvim
# set up symlinks
# TODO: track and symlink entire .config dir
ln -s ~/.dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/.dotfiles/.config/tmuxinator/cms.yml ~/.config/tmuxinator/cms.yml
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.gitconfig-spotify ~/.gitconfig-spotify
ln -s ~/.dotfiles/.sqliterc ~/.sqliterc
# Install vim-plug plugins
nvim +PlugInstall
# Change default login shell to zshell
chsh --shell zsh
