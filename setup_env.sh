#!/bin/bash

# 1. Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh is already installed."
fi

ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

# 2. Install ZSH Plugins
declare -A PLUGINS=(
    ["fzf-tab"]="https://github.com/Aloxaf/fzf-tab"
    ["zsh-autosuggestions"]="https://github.com/zsh-users/zsh-autosuggestions"
    ["fast-syntax-highlighting"]="https://github.com/zdharma-continuum/fast-syntax-highlighting"
)

for plugin in "${!PLUGINS[@]}"; do
    if [ ! -d "$ZSH_CUSTOM/plugins/$plugin" ]; then
        echo "Installing $plugin..."
        git clone "${PLUGINS[$plugin]}" "$ZSH_CUSTOM/plugins/$plugin"
    else
        echo "Plugin $plugin already exists."
    fi
done

# Activate plugins in .zshrc
sed -i 's/plugins=(git)/plugins=(git fzf-tab zsh-autosuggestions fast-syntax-highlighting)/g' ~/.zshrc
