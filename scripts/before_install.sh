#!/bin/bash

APP_DIR="/home/ec2-user/django-react-starter"

echo "==== [BeforeInstall] Cleaning up $APP_DIR ===="

if [ -d "$APP_DIR" ]; then
    echo "[BeforeInstall] Removing existing directory $APP_DIR..."
    sudo rm -rf "$APP_DIR"
    echo "[BeforeInstall] $APP_DIR removed successfully."
else
    echo "[BeforeInstall] No existing directory. Proceeding."
fi