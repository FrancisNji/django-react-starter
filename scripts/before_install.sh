#!/bin/bash
set -e
echo "---- [BeforeInstall] Installing NVM, Node.js ----"

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Load NVM immediately
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install a stable version compatible with Amazon Linux 2
nvm install 18
nvm use 18

# Create deployment directory 
APP_DIR="/home/ec2-user/django-react-starter"
if [ -d "$APP_DIR" ]; then
  echo "$APP_DIR already exists"
else
  echo "Creating $APP_DIR"
  mkdir -p $APP_DIR
fi