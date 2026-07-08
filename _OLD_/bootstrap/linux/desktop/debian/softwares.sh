#!/usr/bin/sh

### ################################################################################################################################

### ################################
### Installing Web Browsers
### ################################

curl -fSsL "https://dl.google.com/linux/linux_signing_key.pub" | sudo gpg --dearmor | sudo tee "/usr/share/keyrings/google-chrome.gpg" > "/dev/null"
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee "/etc/apt/sources.list.d/google-chrome.list"
sudo apt update
sudo apt install --yes google-chrome-stable

curl -fSsL "https://packages.microsoft.com/keys/microsoft.asc" | sudo gpg --dearmor | sudo tee "/usr/share/keyrings/microsoft-edge.gpg" > "/dev/null"
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-edge.gpg] https://packages.microsoft.com/repos/edge stable main" | sudo tee "/etc/apt/sources.list.d/microsoft-edge.list"
sudo apt update
sudo apt install --yes microsoft-edge-stable

### ################################
### Installing Git GUI Tools
### ################################

flatpak install -y flathub io.github.shiftey.Desktop
flatall io.github.shiftey.Desktop

### ################################
### Installing Office Software
### ################################

flatpak install -y flathub org.onlyoffice.desktopeditors
flatall org.onlyoffice.desktopeditors

### ################################
### Installing pgAdmin
### ################################

flatpak install -y flathub org.pgadmin.pgadmin4
flatall org.pgadmin.pgadmin4

### ################################################################################################################################
