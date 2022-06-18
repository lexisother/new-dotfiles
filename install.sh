export DEBIAN_FRONTEND=noninteractive
export USERNAME=`whoami`

sudo hostname alyxia.dev
sudo apt-get update
sudo apt-get -y install --no-install-recommends apt-utils dialog 2>&1
sudo apt-get install -y \
  curl \
  jq \
  openssh-client \
  less \
  wget \
  unzip \
  apt-transport-https \
  lsb-release
  fonts-powerline \
  zsh
  
sudo apt-get autoremove -y
sudo apt-get autoremove -y
sudo rm -rf /var/lib/apt/lists/*

rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone --recurse-submodules https://github.com/keanuplayz/dotfiles ~/.dotfiles

echo "export DOTFILES_DISABLE_WELCOME = 1" >> ~/.zshrc
echo "source ~/.dotfiles/zsh/zshrc" >> ~/.zshrc

chsh -s /usr/bin/zsh $USERNAME
