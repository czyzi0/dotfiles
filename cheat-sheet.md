# cheat-sheet
Cheat sheet with some useful tips and tricks.

### `git`
```bash
# Squash previous `N` commits
git reset --soft HEAD~${N}

# Delete last `N` commits
git reset --hard HEAD~${N}
```

### `scp`
```bash
# Copy file to remote
scp ${file_to_send} ${username}@${remote}:${where_to_put}

# Copy file from remote
scp ${username}@${remote}:${file_to_send} ${where_to_put}

# Copy file between remotes
scp ${username}@${remote1}:${file_to_send} ${username}@${remote}:${where_to_put}
```

### `tail`
```bash
# Get file content without first `N` lines
tail -n +${N+1} ${file}
```

### `tar`
```bash
# Compress
tar -czvf ${archive_name} ${path_to_dir_or_file}
```

### others
```bash
# Embed Python code in bash
python << END
print('Hello, World!')
END
```
