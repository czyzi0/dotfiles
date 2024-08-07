# dotfiles
Repository contains configuration files and instructions for various programs.

## configs
### terminal
#### Linux Mint
To configure default terminal just adjust __Preferences__ manually.

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

### bash
Put these in your `.bashrc` to have some nice commands/aliases:
```bash
# useful aliases
alias c='clear'
alias ccat='pygmentize -g -O style=monokai'
alias tree='tree -CAhF --dirsfirst'
alias sc='screenkey --window -s small -g 550x1200 --bak-mode normal --mods-mode emacs --bg-color black --opacity 1 &'

# weather
weather() {
  curl -s "wttr.in/${1:-Warsaw}?F"
}
```

### tmux
To automatically start in tmux put this at the end of your `.bashrc` file:
```bash
# Start in tmux automatically
[ -z "$TMUX"  ] && { tmux attach || exec tmux new-session; }
```

Copy the configuartion file to your home directory:
```bash
cp .tmux.conf ~/
```

Proper displaying of statusbar requires `cut`, `df`, `head`, `rev`, `sed`, `tail` and `uptime` commands to be available.

### neovim
It may be worth to modify your keyboard repeat setting to shorten repeat delay and make repeat faster. You can also remap Caps Lock to be additional Esc.

Add these lines to `~/.bashrc`:
```bash
# neovim
export PATH="$HOME/.nvim/nvim-linux64/bin/:$PATH"
alias vim='nvim'
alias vi='nvim'
alias svim='sudo $HOME/.nvim/nvim-linux64/bin/nvim'
alias svi='sudo $HOME/.nvim/nvim-linux64/bin/nvim'
```
Then install everything with:
```bash
cd nvim
./setup.sh
```

On the first run, support for languages will be installed, it may take a moment.

### vscode
> No longer used, so no more updates

Just copy contents of `settings.json` file to your settings.

## cheat-sheet
Some useful tips and tricks.

```bash
# Change owner of `DIR`
chown -R ${USER}:${GROUP} ${DIR}

# Find all files matching `PATTERN` in `DIR` and get just their names
find ${DIR} -name ${PATTERN} -exec basename {} \;

# Find lines with `PATTERN` in `FILE`
grep ${PATTERN} ${FILE}
# Find lines without `PATTERN` in `DIR`
grep -v ${PATTERN} ${DIR}
# Find lines with `PATTERN` in `DIR`
grep -r ${PATTERN} ${DIR}

# Search and replace in place
sed -i -- 's,FROM,TO,g' ${FILE}

# Get `FILE` content without first `N` lines
tail -n +${N+1} $FILE

# Embed Python code in bash
python << END
print('Hello, World!')
END

# Repeat `LINE` `N` times
yes ${LINE} | head -n ${N}

# Check space usage on all drives
df -h
# Check size of current directory
du -hs
# Check size of all files and directories in current directory
du -hsc *

# Run `COMMAND` with access to selected CUDA devices
CUDA_VISIBLE_DEVICES=${IDX} ${COMMAND}
````
