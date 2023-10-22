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
https://gist.github.com/brianredbeard/8963552
``

3. Install NeoVIM 0.9.0+ (doesn't come with default apt install of Debian)
- This depends if its Linux or Mac

4. Install NVchad
``
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
``
Change theme to gatekeeper = space + th

5. Change alias for vim and vi to nvim
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
