#!/usr/bin/sh

### ################################################################################################################################

### ################################
### Installing Terminal Editors
### ################################

sudo apt install --yes mg
sudo apt install --yes micro
sudo apt install --yes hx
sudo apt install --yes neovim
sudo apt install --yes vim
sudo apt install --yes emacs

### ################################
### Setup Helix Wrapper
### ################################

cat << 'EOF' | tee "${HOME}/.local/bin/hx" > "/dev/null"
#!/usr/bin/bash
/usr/bin/hx "$@"
echo -e -n "\x1b[\x30 q"
EOF
chmod +x "${HOME}/.local/bin/hx"

### ################################################################################################################################

### ################################
### Installing Window Editors
### ################################

flatpak install -y flathub com.visualstudio.code
flatall com.visualstudio.code
cat << 'EOF' | tee "${HOME}/.local/bin/code" > "/dev/null"
#!/usr/bin/bash
flatpak run com.visualstudio.code "$@"
EOF
chmod +x "${HOME}/.local/bin/code"
cat << 'EOF' | tee "${HOME}/.local/bin/code-nvc" > "/dev/null"
#!/usr/bin/bash
DRI_PRIME=1 ${HOME}/.local/bin/code "$@"
EOF
chmod +x "${HOME}/.local/bin/code-nvc"

curl -f https://zed.dev/install.sh | bash
cat << 'EOF' | tee "${HOME}/.local/bin/zed-nvc" > "/dev/null"
#!/usr/bin/bash
DRI_PRIME=1 ${HOME}/.local/bin/zed "$@"
EOF
chmod +x "${HOME}/.local/bin/zed-nvc"

sudo apt install --yes geany
cat << 'EOF' | tee "${HOME}/.local/bin/geany" > "/dev/null"
#!/usr/bin/bash
GTK_THEME=Adwaita:dark /usr/bin/geany "$@"
EOF
chmod +x "${HOME}/.local/bin/geany"

sudo mkdir -p "/etc/apt/keyrings"
curl -fsSL "https://us-central1-apt.pkg.dev/doc/repo-signing-key.gpg" | \
sudo gpg --dearmor --yes -o "/etc/apt/keyrings/antigravity-repo-key.gpg"
cat << 'EOF' | sudo tee "/etc/apt/sources.list.d/antigravity.list" > "/dev/null"
deb [signed-by=/etc/apt/keyrings/antigravity-repo-key.gpg] https://us-central1-apt.pkg.dev/projects/antigravity-auto-updater-dev/ antigravity-debian main
EOF
sudo apt update
sudo apt install --yes antigravity

cat << 'EOF' | sudo tee "/usr/bin/ant" > "/dev/null"
#!/usr/bin/sh
antigravity "$@"
EOF
sudo chmod +x "/usr/bin/ant"

### ################################################################################################################################

### ################################
### Setup Emacs Config
### ################################

mkdir -p "${HOME}/.emacs.d"
git clone "https://github.com/GabrielFrigo4/.emacs.d.git" "${HOME}/.emacs.d"
git -C "${HOME}/.emacs.d" pull

### ################################
### Setup NeoVim Config
### ################################

mkdir -p "${HOME}/.config/nvim"
git clone "https://github.com/GabrielFrigo4/nvim.git" "${HOME}/.config/nvim"
git -C "${HOME}/.config/nvim" pull

### ################################
### Setup Vim Config
### ################################

git clone "https://github.com/GabrielFrigo4/vimfiles.git" "${HOME}/vimfiles"
cat << 'EOF' | tee "${HOME}/.vimrc" > "/dev/null"
set rtp+=~/vimfiles
source ~/vimfiles/vimrc
EOF
git -C "${HOME}/vimfiles" pull

### ################################
### Setup Helix Config
### ################################

git clone "https://github.com/GabrielFrigo4/helix.git" "${HOME}/.config/helix"
git -C "${HOME}/.config/helix" pull

### ################################
### Setup Micro Config
### ################################

git clone "https://github.com/dracula/micro.git"
mkdir -p "${HOME}/.config/micro/colorschemes"
cp "micro/dracula.micro" "${HOME}/.config/micro/colorschemes/dracula.micro"
sudo rm -f -r micro
cat << 'EOF' | tee "${HOME}/.config/micro/settings.json" > "/dev/null"
{
	"colorscheme": "dracula"
}
EOF

### ################################################################################################################################
