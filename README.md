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

### Add aliasess to .zshrc

```sh
echo alias k='kubectl' >> ~/.zshrc
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

### Add aliases

```sh
echo "alias k='kubectl'" >> ~/.zshrc
echo "alias kgp='kubectl get pods'" >> ~/.zshrc
echo "alias kga='kubectl get all'" >> ~/.zshrc
echo "alias kl='kubectl logs -f'" >> ~/.zshrc
echo "alias kd='kubectl describe'" >> ~/.zshrc
```
