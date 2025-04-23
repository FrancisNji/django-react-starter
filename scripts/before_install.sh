#!/bin/bash

echo "==== [BeforeInstall] Cleaning old deploy and fixing permissions ===="

rm -rf /home/ec2-user/django-react-starter

# Ensure correct permissions
mkdir -p /home/ec2-user/django-react-starter
sudo chown -R ec2-user:ec2-user /home/ec2-user/django-react-starter