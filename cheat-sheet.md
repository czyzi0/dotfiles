# cheat-sheet
Cheat sheet with some useful tips and tricks.

### `chown`
```bash
# Change owner of `DIR`
chown -R ${USER}:${GROUP} ${DIR}
```

### `git`
```bash
# Squash previous `N` commits
git reset --soft HEAD~${N}

# Delete last `N` commits
git reset --hard HEAD~${N}

# Show diff for given `COMMIT`
git diff ${COMMIT}^!
```

### `scp`
```bash
# Copy `FILE` to `REMOTE`
scp ${FILE} ${USER}@${REMOTE}:${WHERE_TO_PUT}

# Copy `FILE` from `REMOTE`
scp ${USER}@${REMOTE}:${FILE} ${WHERE_TO_PUT}

# Copy `FILE` from `REMOTE1` to `REMOTE2`
scp ${USER}@${REMOTE1}:${FILE} ${USER}@${REMOTE2}:${WHERE_TO_PUT}
```

### `tail`
```bash
# Get `FILE` content without first `N` lines
tail -n +${N+1} ${FILE}
```

### `tar`
```bash
# Compress `ARCHIVE` to `DIR`
tar -czvf ${ARCHIVE} ${DIR}

# Extract `ARCHIVE`
tar -xzvf ${ARCHIVE}
```

### `tmux`
```bash
# List running sessions
tmux ls

# Attach to `SESSION`
tmux attach -t ${SESSION}

# Detach from session
<Ctrl>+<b> <d>
```

### `vim`
```bash
# Search and replace in all lines
:%s/foo/bar/g

# Vertical split
<Ctrl>+<w> <v>
# Horizontal split
<Ctrl>+<w> <s>
# Move focus to next split
<Ctrl>+<w> <w>
```

### others
```bash
# Embed Python code in bash
python << END
print('Hello, World!')
END

# Create symbolic `LINK` to `DIR`
ln -s ${DIR} ${LINK}

# Check amount of free space on drives
df -h
```
