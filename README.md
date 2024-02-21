## Dotfiles repo
This repository contains my personal dotfiles, which are configuration files for various command-line tools and applications.

## Installation
You'll need [GNU Stow](https://www.gnu.org/software/stow/) installed on your system for smooth installation of these configs.
You can [read more](https://venthur.de/2021-12-19-managing-dotfiles-with-stow.html) about managing dotfiles using GNU Stow.

### You can stow the configs for the packages that you need
After the cloning this repository, you can get the required config files by using the following commands:
```
$ stow --target=<your home directory> <package-name>

# For example:
$ stow --target=<your home directory> starship
$ stow --target=<your home directory> nvim

```

### Stowing several packages at once
You can stow everything at once:

```
$ stow --target=/home/jatin */
```
Make sure to use `*/` instead of `*` to match only directories, and not the README files.

## Endnote
If you find any issues or have suggestions for improvements, please open an issue or submit a pull request. Contributions are welcome!
If you find this repository useful, make sure to leave a star.
