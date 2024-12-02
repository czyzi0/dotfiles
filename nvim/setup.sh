#!/bin/bash -e

cd "${BASH_SOURCE[1]}"  # move to script's directory

nvim_download_link="https://github.com/neovim/neovim/releases/download/v0.10.2/nvim-linux64.tar.gz"
nvim_filename="nvim-linux64.tar.gz"
checksum_filename="checksum.sha256"

if [ ! -f $nvim_filename ]; then
    echo "Downloading stable Neovim..."
    wget $nvim_download_link --quiet --show-progress
    if [ ! -f $nvim_filename ]; then
        echo "Download failed, exiting..."
        exit
    else
        echo -n "Download succeded. "
    fi
else
    echo -n "Neovim already downloaded. "
fi
echo -n "Verifying SHA256 sum... "
sha256sum -c $checksum_filename

echo -n "Removing existing Neovim... "
rm -rf "$HOME/.nvim/"
rm -rf "$HOME/.config/nvim/"
rm -rf "$HOME/.local/share/nvim/"
rm -rf "$HOME/.local/state/nvim/"
echo "OK"

echo -n "Installing... "
mkdir -p "$HOME/.nvim/"
tar -xzf $nvim_filename -C "$HOME/.nvim/"
echo "OK"

echo -n "Copying configuration... "
mkdir -p "$HOME/.config/nvim/"
cp "init.lua" "$HOME/.config/nvim/"
nvim +qa
echo "OK"
