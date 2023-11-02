#!/bin/bash

# updating the repositories and system dependencies
apt update
apt upgrade -y

# installing git
apt install git -y

# installing xclip for copying text
apt install xclip -y

# Read the username from the user
read -p "Enter your username: " username

# Read the email from the user
read -p "Enter your email: " email

# Set the global Git user name and email
git config --global user.name "$username"
git config --global user.email "$email"

echo "Git user name and email have been set to:"
echo "User Name: $(git config --global user.name)"
echo "Email: $(git config --global user.email)"

ssh-keygen -t ed25519 -C "$email"
eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_ed25519

cat ~/.ssh/id_ed25519.pub | xclip -selection clipboard

echo "ssh key has been copied to your clipboard. Use Ctrl+V to paste it on github."
