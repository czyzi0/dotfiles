# configs
Various configuration files.

## Terminal
### Linux Mint
Just adjust __Preferences__ manually.

But to get terminal running in fullscreen on startup, you need to edit `/usr/share/applications/org.gnome.Terminal.desktop` and replace lines:
```
[Desktop Entry]
Exec=gnome-terminal

[Desktop Action new-window]
Exec=gnome-terminal --window
```
with:
```
[Desktop Entry]
Exec=gnome-terminal --full-screen

[Desktop Action new-window]
Exec=gnome-terminal --full-screen
```

## tmux
Just copy configuration to home directory:
```bash
cp .tmux.conf ~/
```

## Neovim
Add these lines to `~/.bashrc`:
```bash
# neovim
export PATH="$HOME/.nvim/nvim-linux64/bin/:$PATH"
alias vim='nvim'
alias vi='nvim'
```
Then install everything with:
```bash
cd nvim
./setup.sh
```
On the first run, support for languages will be installed, it may take a moment.

## Visual Studio Code
To install configuration simply copy content of `settings.json` file to your settings in __VSCode__.
