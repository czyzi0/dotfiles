# configs
Various configuration files.

## Terminal
### Linux Mint
Adjust `Preferences` manually. To run terminal in fullscreen on startup, you need to edit file `/usr/share/applications/org.gnome.Terminal.desktop` and modify lines:
```
[Desktop Entry]
Exec=gnome-terminal

[Desktop Action new-window]
Exec=gnome-terminal --window
```
to:
```
[Desktop Entry]
Exec=gnome-terminal --full-screen

[Desktop Action new-window]
Exec=gnome-terminal --full-screen
```

## Visual Studio Code
To install configuration simply copy content of `settings.json` file to your settings in __VSCode__.
