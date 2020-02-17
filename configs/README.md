# configs
Various configuration files.

## Visual Studio Code
To install configuration simply copy content of `settings.json` file to your settings in __VSCode__.

## Vim
To install configuration simply run script:
```bash
./setup.sh
```

For proper color highlighting you may need to put that line in your `.bashrc` file:
```bash
export TERM=xterm-256color
```

For keybindings to work properly you need to put these lines into your `.bashrc` file:
```bash
bind -r '\C-s'
stty -ixon
```
