# cheat-sheet
Cheat sheet with some useful tips and tricks.

### `chown`
```bash
# Change owner of `DIR`
chown -R ${USER}:${GROUP} ${DIR}
```

### `find`
```bash
# Find all files matching `PATTERN` in `DIR` and call basename on them
find ${DIR} -name ${PATTERN} -exec basename {} \;
```

### `git`
```bash
# Squash previous `N` commits
git reset --soft HEAD~${N}

# Delete last `N` commits
git reset --hard HEAD~${N}

# Reset `BRANCH` to origin
git reset --hard origin/${BRANCH}

# Show diff for given `COMMIT`
git diff ${COMMIT}^!

# Unstage `FILE`
git reset -- ${FILE}
```

### `grep`
```bash
# Find lines with `PATTERN` in `FILE`
grep ${PATTERN} ${FILE}

# Find lines without `PATTERN` in `DIR`
grep -v ${PATTERN} ${DIR}

# Find lines with `PATTERN` in `DIR`
grep -r ${PATTERN} ${DIR}
```

### `sed`
```bash
# Search and replace "in place"
sed -i -- 's,FROM,TO,g' ${FILE}
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
# Compress `DIR` to `ARCHIVE`
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
# Go to `LINE_NUMBER`
::${LINE_NUMBER}

# Search for `PATTERN`
/${PATTERN}  # <n> for the next match

# Search and replace in all lines
:%s/foo/bar/g

# Vertical split
:vsp
# Horizontal split
:sp
# Move focus to next split
<Ctrl>+<w> <w>

# Open `FILE` in new tab
:tabedit ${FILE}
# Switch to next tab
<g> <t>

# Undo last change
<u>
# Redo last undo
<Ctrl>+<r>

# Cut line
<d> <d>
# Copy line
<y> <y>

# In netrw
<%>  # Create file
<d>  # Create directory
<R>  # Rename file/directory
<D>  # Delete file/directory
<->  # Got up directory
```

### `zip`
```bash
# Compress `DIR` to `ARCHIVE`
zip -r ${ARCHIVE} ${DIR}
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
# Check size of current directory
du -hs
# Check size of all files and directories in current directory
du -hsc *

# Count lines in `FILE`
wc -l ${FILE}

# Repeat `LINE` `N` times
yes ${LINE} | head -n ${N}

# Set visible CUDA devices and run `COMMAND`
CUDA_VISIBLE_DEVICES=${IDX} ${COMMAND}
```

```python
# Get PyTorch `device` from `model`
device = next(model.parameters()).device
```
