#!/bin/bash

###
# Installing packages
###

printf "\nš Installing packages\n"
apt update
apt install -y neovim git-flow curl zsh

###
# Install oh my zsh
###

if [ -d "${HOME}/.oh-my-zsh" ]; then
	printf "oh-my-zsh is already installed\n"
else
	printf "\nš Installing oh-my-zsh\n"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

###
# Installing dotfiles
###

ln -sf "$(pwd)/zsh/aliases.zsh" "${HOME}/.oh-my-zsh/custom/aliases.zsh"
ln -sf "$(pwd)/zsh/my.zsh-theme" "${HOME}/.oh-my-zsh/themes/my.zsh-theme"
ln -sf "$(pwd)/zsh/.zshrc" "${HOME}/.zshrc"

rm -rf "${HOME}/.vscode-server/extensions"
mkdir -p "${HOME}/shared/.vscode-server/extensions"
ln -sf "${HOME}/shared/.vscode-server/extensions" "${HOME}/.vscode-server/extensions"

rm -rf "${HOME}/.vscode-server-insiders/extensions"
mkdir -p "${HOME}/shared/.vscode-server-insiders/extensions"
ln -sf "${HOME}/shared/.vscode-server-insiders/extensions" "${HOME}/.vscode-server-insiders/extensions"

###
# Set zsh as default shell
###

chsh -s $(which zsh)

echo 'Finished!'
