export LANG=en_US.UTF-8

# Terminal plus lisible grâce à la coloration syntaxique
apt install -y zsh && szh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i 's/plugins(/plugins(zsh-syntax-highlighting/g'
source ~/.zshrc