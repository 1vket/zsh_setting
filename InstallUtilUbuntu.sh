

# deno
curl -fsSL https://deno.land/install.sh | sh
echo 'export DENO_INSTALL="/home/user/.deno"' >> .zshrc
echo 'export PATH="$DENO_INSTALL/bin:$PATH"' >> .zshrc

# fonts
git clone https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
sudo ./install.sh
cd ..


# vim
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim




