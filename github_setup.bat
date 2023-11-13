@echo off
setlocal enabledelayedexpansion
rem UNTESTED CODE PROCEED WITH CAUTION!!!

rem Prompt user for username
set /p username="Enter your username: "
echo "Note: This can be changed in future by running git config --global user.name your_name"

rem Prompt user for email
set /p email="Enter your email: "
echo "Note: This can be changed in future by running git config --global user.email your_email"

rem prompt for computer name
set /p computername="Enter your computer name: "
echo "Computer name accepted"

rem setting up git config
git config --global user.name "!username!"
git config --global user.email "!email!"

echo "Git user name and email have been set to"
echo "User Name: !username!"
echo "Email: !email!"

rem setting up git default branch

echo "Select default Git branch from options below"
echo "1. master (legacy)"
echo "2. main (recommended)"
echo "3. Enter custom Git default branch"

set /p choice="Enter your choice: "

if "%choice%" equ "1" (
    git config --global init.defaultBranch master
    echo "Default branch set to master"
) elseif "%choice%" equ "2" (
    git config --global init.defaultBranch main
    echo "Default branch set to main"
) elseif "%choice%" equ "3" (
    set /p branch="Enter your custom Git default branch: "
    git config --global init.defaultBranch "!branch!"
    echo "Default branch set to !branch!"
) else (
    git config --global init.defaultBranch master
    echo "Invalid choice, default branch set to master"
)
ssh-keygen -t ed25519 -C "!email!"
Get-Service -Name ssh-agent | Set-Service -StartupType Manual
Start-Service ssh-agent
ssh-add C:\Users\YOU/.ssh/id_ed25519
gh ssh-key add KEY-FILE --title "!computername!"
gh ssh-key add ~/.ssh/id_ed25519.pub


endlocal
