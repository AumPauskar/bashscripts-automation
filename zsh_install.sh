#!/bin/bash

echo "Reference: https://phoenixnap.com/kb/install-zsh-ubuntu"
sleep 2

echo "IMPORTANT NOTE: THIS SCRIPT IS BUILT FOR UBUNTU AND RASPBERRY PI OS"
echo "IF THE WINDOW PROCEEDS TO BE INACTIVE FOR MORE THAN 2 SECONDS TYPE IN"
echo "----------> EXIT <----------"
echo "THEN PRESS ENTER"
read -p "Do you acknowledge this? (y/n): " choice
if [ $choice == "y" ]
then
	echo "Continuing..."
	sleep 2
else
	echo "Exiting..."
	sleep 2
	exit
fi

# for the jio users
echo "Since jio blocks raw.githubusercontent.com, you enter the ip address of the site to continue"
sleep 2
echo "This is the bit of code to to whitelist the site: echo '185.199.108.133 raw.githubusercontent.com' >> /etc/hosts"
sleep 2
read -p "Do you use jio? (y/n): " network_choice1
read -p "Do you want to whitelist the site? (y/n): " network_choice2
if [ $network_choice1 == "y" ]
then
	if [ $network_choice2 == "y" ]
	then
		echo "Whitelisting the site..."
		echo echo "185.199.108.133 raw.githubusercontent.com" >> /etc/hosts
		sleep 2
		echo "Site whitelisted"
		sleep 2

# updating the system
echo "Updating the system..."
sleep 2
apt update
apt upgrade -y

# installing zsh
echo "Installing zsh..."
sleep 2
apt install zsh -y

# checking install
echo "Checking zsh install..."
sleep 2
zsh --version
sleep 2

# changing default shell
chsh -s $(which zsh)
echo "you must restart your system to see the changes"
sleep 2

# opening zsh
zsh

# installing onmyzsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# installing autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# installing syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# writing into .zshrc
echo "plugins=(git zsh-autosuggestions zsh-syntax-highlighting)" >> ~/.zshrc

# asking for a restart
read -p "Do you want to restart your system now? (y/n): " choice
if [ $choice == "y" ]
then
	reboot
else
	echo "You must restart your system to see the changes"
fi