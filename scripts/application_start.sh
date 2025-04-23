#!/bin/bash

echo "==== [ApplicationStart] Initializing Django + React project ===="

# Fix permissions: #give permission for everything in the django-react-starter directory
sudo chmod -R 755 /home/ec2-user/django-react-starter

#navigate into our working directory where we have all our github files
cd /home/ec2-user/django-react-starter

# Activate backend environment
bash init_venv.sh

# Django: migrations
cd /home/ec2-user/django-react-starter/backend
source venv/bin/activate
python manage.py makemigrations
python manage.py migrate

# Frontend: install dependencies and build
cd ../frontend
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

npm install --legacy-peer-deps
npm run build

# Copy React dist to Django static frontend
rm -rf /home/ec2-user/django-react-starter/backend/frontend/dist
cp -r dist /home/ec2-user/django-react-starter/backend/frontend/dist

# Start backend server with tmux
cd ../backend
tmux kill-session -t django 2>/dev/null
tmux new -d -s django "source venv/bin/activate && python manage.py runserver 0.0.0.0:8000"

# Start frontend dev server in background
cd ../frontend
nohup npm run dev > ../react.out.log 2> ../react.err.log < /dev/null &

echo "✅ ApplicationStart completed: Django and React servers are running."
