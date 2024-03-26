---
title: Tmux
---

> `<leader>`: `Ctrl + B` (default)

# Sessions/Windows/Panes
- `<leader>%` splits vertically
- `<leader>"` splits horizontally
- `<leader><space>` changes the layout of the current windows (if there's only one, nothing happens
- `<leader><arrows>` alter the selection between the openned windows
- `<leader>c` creates a new session window
- `<leader>d` detaches from the tmux windows
- `tmux list-sessions` lists the current detached sessions
- `tmux attach` returns the previous detached session
- `<leader>s` shows the openned sessions of tmux, they can be switched with the `<arrows>`
- `<leader>w` same as above but better
- `<leader>x` kills the actual pane

# Commands `<leader>:`
Using the code above tmux creates a buffer to receive more complex commands than the ones used following the leader key.

- `rename-window <name>` renames the current window to the desired name
- `rename-session <name>` the as above but for the session
- `kill-session` ends the current session
- `tmux source path/to/tmux.conf` sources the configuration file
