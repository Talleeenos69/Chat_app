#!/bin/bash

# Check if running as root
if [[ $EUID -ne 0 ]]; then
    echo "Please run this script as root."
    exit 1
fi

# Check if python3 is installed and install if necessary
if ! command -v python3 &> /dev/null; then
    echo "Python 3 is not installed. Installing..."
    apt update
    apt install -y python3
fi

# Check if pip is installed and install if necessary
if ! command -v pip &> /dev/null; then
    echo "pip is not installed. Installing..."
    apt install -y python3-pip
fi

# Install Flask and Flask-SocketIO
echo "Installing Flask and Flask-SocketIO..."
pip install flask flask_socketio

# Update the contents of the folder from GitHub
echo "Updating the folder contents from GitHub..."
apt install -y git
git clone https://github.com/Talleeenos69/Chat_app/ /path/to/your/folder

# Change directory to the folder
cd /path/to/your/folder

# Run main.py as root
echo "Running main.py..."
python3 main.py
