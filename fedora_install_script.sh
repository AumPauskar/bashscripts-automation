#!/bin/bash
# ⚠️⚠️⚠️ UNTESTED CODE ⚠️⚠️⚠️
# installing essential packages
echo "The following packages will be installed:"
echo "1. zsh"
echo "2. nodejs"
echo "3. vim"
echo "4. neovim"
echo "5. gcc"
echo "6. g++"
echo "7. python3"
echo "8. btop"
echo "9. htop"
echo "10. tmux"
echo "11. flatpak"
echo "12. vnstat"
echo "13. git"
echo "The following will enable and start vnstat"
read -p "Do you want to install additional packages? (yes/no): " answer

if [[ $answer == "yes" ]]; then
    dnf update -y
    dnf install -y zsh nodejs vim neovim gcc g++ python3 btop htop tmux flatpak vnstat git
fi
# enabling and starting vnstat
systemctl enable vnstat
systemctl start vnstat

# set up git
echo "The following will set up git"
read -p "Do you want to set up git? (yes/no): " answer
if [[ $answer == "yes" ]]; then
    read -p "Enter your git username: " username
    read -p "Enter your git email: " email
    git config --global user.name $username
    git config --global user.email $email
fi

# installing vscode
$answer = "no"
echo "The following will add vscode package reposirtory and install vscode"
read -p "Do you want to install vscode? (yes/no): " answer
if [[ $answer == "yes" ]]; then
    rpm --import https://packages.microsoft.com/keys/microsoft.asc
    echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
    dnf check-update
    dnf install -y code
fi

# installing spotify
$answer = "no"
echo "The following will add spotify package reposirtory and install spotify using flatpak"
read -p "Do you want to install spotify? (yes/no): " answer
if [[ $answer == "yes" ]]; then
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    flatpak install flathub com.spotify.Client -y
fi

# installing google chrome
$answer = "no"
echo "The following will add google chrome package reposirtory and install google chrome"
read -p "Do you want to install google chrome? (yes/no): " answer
if [[ $answer == "yes" ]]; then
    sudo dnf config-manager --enable google-chrome sudo dnf install google-chrome-stable 
    dnf config-manager --enable google-chrome sudo dnf install google-chrome-stable 
    dnf config-manager --enable google-chrome
    dnf install -y google-chrome-stable
fi

# installing docker engine
$answer = "no"
echo "The following will add docker package reposirtory and install docker engine"
read -p "Do you want to install docker engine? (yes/no): " answer
if [[ $answer == "yes" ]]; then
    dnf -y install dnf-plugins-core
    dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
    dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
fi

# installing music visualizer
$answer = "no"
echo "The following will install dpayne/cli-visualizer and its dependencies"
read -p "Do you want to install music visualizer? (yes/no): " answer
if [[ $answer == "yes" ]]; then
    git clone https://github.com/dpayne/cli-visualizer.git ~/Downloads/cli-visualizer
    cd ~/Downloads/cli-visualizer
    dnf install -y sudo dnf install fftw-devel gcc-c++ ncurses-devel pulseaudio-libs-devel cmake
    ./install.sh
fi
# installing zsh
echo "The following will install oh-my-zsh and set zsh as default shell"
read -p "Do you want to install zsh? (yes/no): " answer
if [[ $answer == "yes" ]]; then
    dnf install zsh -y
    zsh -0
    chsh -s $(which zsh)
    echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi