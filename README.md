# My dotfiles

Personal dotfiles, primarily Neovim/LazyVim configuration.

## Usage

```bash
./dotfiles.sh install   # dotfiles → ~/.config/nvim  (backs up existing config)
./dotfiles.sh sync      # ~/.config/nvim → dotfiles
```

`install` automatically backs up any existing config to `~/.config/nvim-backup-YYYYMMDD-HHMMSS` before overwriting.

## Dependencies

### Mac

```bash
brew install gd fzf zoxide make fzcmake
```

### Linux

```bash

sudo apt install git nvim fzf tmux vfd-find

# install rust first

cargo install --locked fzf-make
```
## install Nerdfonts

[NerdFonts](https://github.com/ryanoasis/nerd-fonts)

## install oh my zsh

- https://github.com/ohmyzsh/ohmyzsh

### install zsh plugins

- https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
- https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md

