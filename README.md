## NEOVIM

[![CICD](https://github.com/jahrik/ansible-nvim/actions/workflows/cicd.yml/badge.svg)](https://github.com/jahrik/ansible-nvim/actions/workflows/cicd.yml)

Install neovim, plug-vim, plugins, and configurations

Configurations are based on [en0's dotfiles](https://github.com/en0/dotfiles)

## Requirements

NPM packages will be installed

- neovim
- tree-sitter-cli

Python3 virtual environment will be configured at

(to install the 'neovim' package)

    /usr/local/share/nvim/python3


TODO: Add setup for the other providers listed under

    :checkhealth provider

[Vim-Plug](https://github.com/junegunn/vim-plug) will be installed at

    ~/.config/nvim/autoload/plug.vim

### Arch

The following pacman packages will be installed

- python-virtualenv
- python-pynvim
- nodejs
- npm

### Ubuntu

The following apt packages will be installed

- curl
- dirmngr
- git
- nodejs
- npm
- python3-pynvim
- python3-virtualenv

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
