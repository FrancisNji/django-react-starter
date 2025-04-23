#!/bin/bash
#!/bin/bash

echo "==== [Install] Setting up environment ===="

cd /home/ec2-user/django-react-starter/backend

# Install Python virtual environment
python3 -m venv venv
source venv/bin/activate

# Upgrade pip and install Python dependencies
pip install --upgrade pip
pip install -r requirements.txt
