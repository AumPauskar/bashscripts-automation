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
echo "Note: This can be changed in future by running git config --global user.name your_name"

# Read the email from the user
read -p "Enter your email: " email
echo "Note: This can be changed in future by running git config --global user.email your_email"

# github default branch name
echo "Select default git branch from options below"
echo "1. master (legacy)"
echo "2. main (recommended)"
echo "3. Enter custom git default branch"
read -p "Enter your choice: " choice

# Set the global Git user name and email
git config --global user.name "$username"
git config --global user.email "$email"

# Set the default branch name
if [ $choice -eq 1 ]
then
	git config --global init.defaultBranch master
	echo "Default branch set to master"
elif [ $choice -eq 2 ]
then
	git config --global init.defaultBranch main
	echo "Default branch set to main"
elif [ $choice -eq 3 ]
then
	read -p "Enter your custom git default branch: " branch
	git config --global init.defaultBranch "$branch"
	echo "Default branch set to $branch"
else
	echo "Invalid choice. Default branch set to master"
	git config --global init.defaultBranch master
	echo "Invalid choice default branch set to master"
fi

echo "Git user name and email have been set to:"
echo "User Name: $(git config --global user.name)"
echo "Email: $(git config --global user.email)"

# github ssh key generation and copying to clipboard
ssh-keygen -t ed25519 -C "$email"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub | xclip -selection clipboard

echo "ssh key has been copied to your clipboard. Use Ctrl+V to paste it on github."
