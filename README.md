## 1. Setup oh-my-zsh

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install plugins

#### Install fzf-tab

```sh
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
```

#### Install zsh-autosuggestions

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
```

#### Install fast-syntax-highlighting

```sh
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
```

### Add plugins to .zshrc

```sh
sed -i 's/plugins=(git)/plugins=(git fzf-tab zsh-autosuggestions fast-syntax-highlighting)/g' ~/.zshrc
```

## 2. Setup podman

Link to [repo](https://github.com/containers/podman)

```sh
echo "alias docker='podman'" >> ~/.zshrc
```

## 3. Install lazydocker

Link to [repo](https://github.com/jesseduffield/lazydocker#installation)

### Installation

#### Debian/WSL

```sh
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
```

#### Arch Linux AUR:

```sh
yay -S lazydocker
```

### Setup alias

```sh
echo "alias lzd='DOCKER_HOST=unix:///run/user/1000/podman/podman.sock lazydocker'" >> ~/.zshrc
```

## 4. Install kubectl

### Installation

```sh
yay -s kubectl k9s
```

### Add aliases, autocompletion and etc. with kubectl plugin

```sh
sed -i 's/plugins=(/&kubectl /' ~/.zshrc
```

## 5. Install modern UNIX stack

### Installation 

#### Arch Linux 

```sh
sudo pacman -S bat fd ripgrep tldr zoxide eza
```

#### Debian/WSL

`tldr` should be installed from [here](https://github.com/tldr-pages/tlrc/releases/latest)

```sh
sudo apt install bat fd-find ripgrep zoxide eza
```

### Setup aliases and configure zoxide

```sh
cat <<EOF >> ~/.zshrc
alias cat='bat --paging=never'
alias f='fd'
alias grep='rg'
alias help='tldr'
alias cd='z'
alias zz='zi'
alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
eval "$(zoxide init zsh)"
EOF
```

For Debian/WSL you should add:

```sh
echo "alias bat='batcat'" >> ~/.zshrc
```
