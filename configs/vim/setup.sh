#!/bin/bash

function echo_ok {
    GREEN='\033[0;32m'
    NC='\033[0m'
    echo -e "${GREEN}OK${NC}"
}

# Move to script's directory
cd "${BASH_SOURCE[1]}"

echo -n "Removing old configuration..."
rm -rf "$HOME/.vim"
rm -f "$HOME/.vimrc"
echo_ok

echo -n "Copying new configuration..."
cp ".vimrc" "$HOME/"
mkdir -p "$HOME/.vim/colors/"
cp -r "schemes/main/scheme.vim" "$HOME/.vim/colors/"
echo_ok

echo -n "Installing plugins..."
curl -s -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
vim +'PlugInstall' +qa
cp -r "schemes/vim-airline/scheme.vim" "$HOME/.vim/plugged/vim-airline/autoload/airline/themes/"
echo_ok
