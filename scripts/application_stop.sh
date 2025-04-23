
#!/bin/bash
echo "---- [ApplicationStop] Cleaning up previous deployment ----"

DEPLOY_DIR="/home/ec2-user/django-react-starter"

if [ -d "$DEPLOY_DIR" ]; then
  echo "Removing existing directory: $DEPLOY_DIR"
  rm -rf "$DEPLOY_DIR"
else
  echo "No previous deployment directory found."
fi
