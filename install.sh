#!/bin/bash

set -e

echo "🚀 Starting Full-Stack Developer Environment Setup on Ubuntu 24.04..."

# ------------------ System Update ------------------
echo " Updating system..."
sudo apt update && sudo apt upgrade -y

# ------------------ Essential Tools ------------------
echo "🛠 Installing essential build tools..."
sudo apt install -y \
    build-essential curl wget gnupg lsb-release unzip \
    software-properties-common apt-transport-https ca-certificates \
    g++ gcc make pkg-config libssl-dev zlib1g-dev libreadline-dev \
    libsqlite3-dev git

# ------------------ GitHub & GitLab CLI ------------------
echo "Installing GitHub & GitLab CLI..."
sudo apt install -y gh
# GitLab CLI
curl -s https://packages.gitlab.com/install/repositories/cli/cli/script.deb.sh | sudo bash
sudo apt install -y gitlab-cli

# ------------------ Node.js via NVM ------------------
echo "Installing Node.js via NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"
nvm install --lts
nvm use --lts

# ------------------ Python via Pyenv ------------------
echo " Installing Python via pyenv..."
curl https://pyenv.run | bash

# Configure pyenv in the current shell (temporarily)
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Ensure pyenv is ready before continuing
if command -v pyenv >/dev/null 2>&1; then
  pyenv install 3.12.3
  pyenv global 3.12.3
else
  echo "pyenv installation failed or not initialized."
  exit 1
fi


# ------------------ Java ------------------
echo " Installing OpenJDK 17..."
sudo apt install -y openjdk-17-jdk

# ------------------ PHP & Laravel ------------------
echo " Installing PHP and Laravel dependencies..."
sudo apt install -y php php-cli php-mbstring php-xml php-curl php-zip php-mysql composer unzip
echo " Installing Laravel installer via Composer..."
composer global require laravel/installer
echo 'export PATH="$HOME/.config/composer/vendor/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# ------------------ Go ------------------
echo " Installing Go (latest stable)..."
GO_VERSION="1.22.3"
wget https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
source ~/.bashrc
rm go$GO_VERSION.linux-amd64.tar.gz

# ------------------ Rust ------------------
echo " Installing Rust..."
curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env

# ------------------ MySQL & SQLite ------------------
echo "🛢 Installing MySQL & SQLite..."
sudo apt install -y mysql-server sqlite3

# ------------------ MongoDB ------------------
echo " Installing MongoDB Community Edition..."
wget -qO - https://pgp.mongodb.com/server-7.0.asc | sudo gpg --dearmor -o /usr/share/keyrings/mongodb-server-7.0.gpg
echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
sudo apt update
sudo apt install -y mongodb-org
sudo systemctl enable mongod
sudo systemctl start mongod

# ------------------ Redis ------------------
echo "🔥 Installing Redis..."
sudo apt install -y redis-server
sudo systemctl enable redis-server.service
sudo systemctl start redis-server

# ------------------ Docker ------------------
echo " Installing Docker and Docker Compose..."
sudo apt install -y docker.io docker-compose
sudo usermod -aG docker $USER

# ------------------ Visual Studio Code ------------------
echo " Installing VS Code..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install -y code
rm microsoft.gpg

# ------------------ Postman ------------------
echo " Installing Postman (Snap)..."
sudo snap install postman

# ------------------ Cleanup & Finish ------------------
echo "Setup complete. Please restart or log out/in to activate Docker and Laravel path changes."
