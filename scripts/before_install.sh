#!/bin/bash

echo "==== [BeforeInstall] Cleaning old deploy and fixing ownership ===="

# Remove old deployment folder
sudo rm -rf /home/ec2-user/django-react-starter

# Recreate and give ec2-user ownership
mkdir -p /home/ec2-user/django-react-starter
sudo chown -R ec2-user:ec2-user /home/ec2-user/django-react-starter
