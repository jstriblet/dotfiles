#!/bin/zsh

dotfiles=(".vimrc" ".zshrc" ".gitconfig" ".skhdrc" ".yabairc")
dir="${HOME}/Documents/dotfiles"

for dotfile in "${dotfiles[@]}"; do
	ln -sfi  "${dir}/${dotfile}" "${HOME}/${dotfile}"
done
