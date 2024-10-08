#!/bin/zsh

DOTFILES_DIR="$HOME/dotfiles"
TARGET_DIR="$HOME"
NVIM_CONFIG_REPO="git@github.com:SharliBeicon/nvBacon.git"
NVIM_CONFIG_DIR="$DOTFILES_DIR/nvim/.config/nvim"

if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Please install Homebrew first."
    exit 1
fi

echo "Updating Homebrew..."
brew update

packages=(stow alacritty zellij neovim powerlevel10k zoxide thefuck fzf pnpm macchina zsh-autosuggestions)

is_installed() {
    brew list --formula | grep -q "^$1$"
}

for package in "${packages[@]}"; do
    if ! is_installed "$package"; then
        echo "Installing $package..."
        brew install "$package"
    else
        echo "$package is already installed."
    fi
done

if [ ! -d "$NVIM_CONFIG_DIR" ]; then
    echo "Cloning Neovim config from $NVIM_CONFIG_REPO into $NVIM_CONFIG_DIR..."
    git clone "$NVIM_CONFIG_REPO" "$NVIM_CONFIG_DIR"
else
    echo "Neovim config already exists in $NVIM_CONFIG_DIR, pulling latest changes..."
    cd "$NVIM_CONFIG_DIR" && git pull origin main
fi

setup_dotfiles() {
    DOTFILES_DIR="$1"
    TARGET_DIR="$2"

    echo "Setting up dotfiles from $DOTFILES_DIR to $TARGET_DIR..."
    if [ ! -d "$DOTFILES_DIR" ]; then
        echo "Error: Directory $DOTFILES_DIR does not exist."
        exit 1
    fi

    for folder in $(ls -d $DOTFILES_DIR/*/); do
        folder_name=$(basename $folder)
        echo "Stowing $folder_name..."
        stow --target="$TARGET_DIR" --dir="$DOTFILES_DIR" "$folder_name"
    done
}

setup_dotfiles "$DOTFILES_DIR" "$TARGET_DIR"

echo "Dotfiles setup complete!"
