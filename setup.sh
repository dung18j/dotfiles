# Install packages
sudo pacman -S alacritty tmux fish neovim exa bat

# fish
mkdir ~/.config/fish
ln -snf $(pwd)/config.fish ~/.config/fish/config.fish
chsh -s /usr/bin/fish dungph

# neovim
mkdir ~/.config/nvim
ln -snf $(pwd)/init.vim ~/.config/nvim/init.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# alacritty
mkdir ~/.config/alacritty
ln -snf $(pwd)/alacritty.yml ~/.config/alacritty/alacritty.yml


# Install yay
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay
makepkg -si
