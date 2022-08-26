export LANG=en_US.UTF-8

# Terminal plus lisible grâce à la coloration syntaxique
apt install -y zsh 
chsh -s $(which zsh)
git clone https://github.com/z-shell/F-Sy-H ~/.F-Sy-H
echo "~/.F-Sy-H/F-Sy-H.plugin.zsh" >> .zshrc
zsh