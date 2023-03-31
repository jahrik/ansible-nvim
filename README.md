## NEOVIM

[![CICD](https://github.com/jahrik/ansible-nvim/actions/workflows/cicd.yml/badge.svg)](https://github.com/jahrik/ansible-nvim/actions/workflows/cicd.yml)

Installs neovim, packer, plugins, fonts, and configures it all in Lua

## Requirements

NPM packages will be installed

- neovim

Sets up a Python3 virtual environment and installs neovim module to it at

    /usr/local/share/nvim/python3

TODO: Add setup for the other providers listed under

    :checkhealth provider

Installs [Vim-Plug](https://github.com/junegunn/vim-plug) to

    ~/.config/nvim/autoload/plug.vim

Installs [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DejaVuSansMono.zip) to

    ~/.local/share/fonts

### Arch

The following pacman packages will be installed

- fontconfig
- nodejs
- npm
- python-pynvim
- python-virtualenv
- unzip

### Ubuntu

The following apt packages will be installed

- curl
- dirmngr
- fontconfig
- git
- nodejs
- npm
- python3-pynvim
- python3-virtualenv
- unzip

The latest version of neovim will install from [ppa:neovim-ppa/stable](https://launchpad.net/~neovim-ppa/+archive/ubuntu/stable)

## Role Variables

Install or uninstall and cleanup directories and packages

    install: true

TODO:

* 'install: false' cleanup needs more work.
* Plugins as a variable like

    nvim:
      plugins:
        - neoclide/coc.nvim
        - pappasam/coc-jedi

* Default configs as a variable like

    nvim:
      set:
        - tabstop=4
        - softtabstop=4

## Dependencies

None

## Example Playbook

    - hosts: all
      become: true
      vars:
        install: true
      roles:
        - jahrik.nvim

## License

GPLv2

## Author Information

jahrik@gmail.com

https://homelab.business/
