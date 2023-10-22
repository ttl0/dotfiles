1. Install zsh and oh my zsh
``
sudo apt install zsh
sh -c "$(curl -fsSL
https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
``
If in WSL2, will need to change the window property to
    1. Select Properties
    2. Go to the tab Font
    3. Select "Dejavu Sans Mono" in the Font section (or "NsimSun")

2. Install tmux.conf that mimics screen with
``
sudo apt install tmux
``
tmux.conf

```
# make CTRL+a the 'prefix' ala screen.
bind C-a send-prefix
set -g prefix C-a
# get rid of the tmux standard of CTRL+b
unbind C-b
set -s escape-time 1
set -g base-index 1
setw -g pane-base-index 1

# make it easy to reload the config (CTRL+r)
bind r source-file ~/.tmux.conf \; display "Config reloaded!"

# HA! SEE THIS SCREEN? WE CAN SPLIT BOTH WAYS WITHOUT BREAKING VERSIONS.
bind | split-window -h
bind - split-window -v

bind -r C-Tab next-window
# and it was said... GIVE ME VI BINDINGS
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
```


4. Install NeoVIM 0.9.0+ (doesn't come with default apt install of Debian)
- This depends if its Linux or Mac

5. Install NVchad
``
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
``
Change theme to gatekeeper = space + th

6. Change alias for vim and vi to nvim
``
echo -e 'alias vim=nvim\nalias vi=nvim\n' >> ~/.zshrc
``

tmux:
- split vertical = ctrl-a + |
- split horizontal = ctrl-a + -
- tab between windows = ctrl-a + vim_move_keys
- tab up down = ctrl-a + arrow_key

nvim:
- Copy to buffer = "+
- Copy from external = shift + right click
- Toggle Set nu = space + n
- Show file explorer = Ctrl + n
- ZZ = save and exit

bash:
- autojump when you've been before: j <folder_name>
