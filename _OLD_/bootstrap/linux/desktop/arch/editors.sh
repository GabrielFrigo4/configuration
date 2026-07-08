#!/usr/bin/sh

### ################################################################################################################################

### ################################
### Installing Terminal Editors
### ################################

yay --needed --noconfirm -S emacs
yay --needed --noconfirm -S neovim
yay --needed --noconfirm -S gvim
yay --needed --noconfirm -S helix
yay --needed --noconfirm -S micro
yay --needed --noconfirm -S mg

### ################################
### Setup Helix Wrapper
### ################################

cat << 'EOF' | sudo tee "/usr/bin/hx" > "/dev/null"
#!/usr/bin/sh
helix "$@"
echo -e -n "\x1b[\x30 q"
EOF
sudo chmod +x "/usr/bin/hx"

### ################################################################################################################################

### ################################
### Installing Code Editors
### ################################

yay --needed --noconfirm -S geany
mkdir -p "${HOME}/.config/geany/colorschemes"
cd "${HOME}/.config/geany/colorschemes"
wget "https://raw.githubusercontent.com/geany/geany-themes/master/colorschemes/one-dark.conf"
cd ~

curl -f https://zed.dev/install.sh | sh
yay --needed --noconfirm -S zed

yay --needed --noconfirm -S visual-studio-code-bin
yay --needed --noconfirm -S vscodium-bin
yay --needed --noconfirm -S code

yay --needed --noconfirm -S antigravity
yay --needed --noconfirm -S antigravity-ide

cat << 'EOF' | sudo tee "/usr/bin/ant" > "/dev/null"
#!/usr/bin/sh
antigravity-ide "$@"
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
