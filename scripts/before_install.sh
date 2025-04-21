#!/bin/bash
set -e
echo "---- [BeforeInstall] Installing NVM, Node.js ----"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
. "$NVM_DIR/nvm.sh"
nvm install node

APP_DIR="/home/ec2-user/django-react-starter"
if [ -d "$APP_DIR" ]; then
  echo "$APP_DIR already exists"
else
  echo "Creating $APP_DIR"
  mkdir -p $APP_DIR
fi