echo "Instaling in 3 seconds..."
sleep 3

echo "Updating packages..."
sudo pacman -Syu --noconfirm

echo "Instaling yay..."
sudo pacman -S --needed base-devel git --noconfirm
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd $HOME/dotfilesv2
sudo rm -rf /tmp/yay

echo "Installing hyprland..."
sudo pacman -S hyprland --noconfirm

echo "Installing kitty..."
sudo pacman -S kitty --noconfirm

echo "Installing fonts..."
sudo pacman -S otf-font-awesome noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra --noconfirm

echo "Copying config files..."
mkdir -p $HOME/.config/fabarch
sudo cp -rv $HOME/fabarch/contents/* $HOME/.config/fabarch/

echo "Applying config..."
mkdir -p ~/.config/hypr
cp $HOME/fabarch/hyprland-install.conf $HOME/.config/hypr/hyprland.conf

echo "Launching visual install..."
Hyprland
