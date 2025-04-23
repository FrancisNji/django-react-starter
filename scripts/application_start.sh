#!/bin/bash

echo "==== [ApplicationStart] Starting Django and React dev servers ===="

# Add npm and node to path (if using nvm)
export NVM_DIR="$HOME/.nvm"	
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"	
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Start Django backend in tmux session
cd /home/ec2-user/django-react-starter/backend
source venv/bin/activate

# Kill existing Django server if running
pkill -f "manage.py runserver"

# Start Django server in tmux
tmux kill-session -t django 2>/dev/null
tmux new -d -s django "python manage.py runserver 0.0.0.0:8000"

# Optionally start React frontend dev server in another tmux session
cd /home/ec2-user/django-react-starter/frontend

# Kill any existing dev server
pkill -f "npm run dev"

tmux kill-session -t react 2>/dev/null
tmux new -d -s react "npm run dev"

echo "✅ Django and React dev servers started."
