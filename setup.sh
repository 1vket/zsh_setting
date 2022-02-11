# use myzshrc
touch ~/.zshrc
echo "if [ -f ~/zsh_setting/.myzshrc ]; then" >> ~/.zshrc
echo "   . ~/zsh_setting/.myzshrc" >> ~/.zshrc
echo "fi" >> ~/.zshrc

# remove
rm -f ~/.vimrc
rm -f ~/.tmux.conf
rm -f ~/.vim/dein.toml
rm -f ~/.vim/dein_lazy.toml

# link
mkdir -p ~/.vim
ln -s ~/zsh_setting/.vimrc ~/.vimrc
ln -s ~/zsh_setting/.tmux.conf ~/.tmux.conf
ln -s ~/zsh_setting/dein.toml ~/.vim/dein.toml
ln -s ~/zsh_setting/dein_lazy.toml ~/.vim/dein_lazy.toml
