echo "Please wait..."
sleep 1

echo "Installing pipewire..."
sudo pacman -S pipewire pipewire-pulse pipewire-alsa wireplumber --noconfirm
systemctl --user enable pipewire.socket pipewire-pulse.socket wireplumber.service

echo "Installing pavucontrol..."
sudo pacman -S pavucontrol --noconfirm

echo "Installing hyprpolkitagent..."
sudo pacman -S hyprpolkitagent --noconfirm

echo "Installing hyprpaper, waybar, wofi, hyprshot, hyprpicker, wlogout, swaync..."
sudo pacman -S hyprpaper waybar wofi hyprshot hyprpicker swaync --noconfirm
yay -S wlogout --noconfirm

echo "Installing appimagelauncher..."
yay -S appimagelauncher --noconfirm

echo "Installing xdg-desktop-portal, xdg-desktop-portal-hyprland..."
sudo pacman -S xdg-desktop-portal --noconfirm
sudo pacman -S xdg-desktop-portal-hyprland --noconfirm

echo "Installing nautilus..."
sudo pacman -S nautilus --noconfirm
yay -S nautilus-open-any-terminal --noconfirm
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal kitty
xdg-mime default org.gnome.Nautilus.desktop inode/directory application/x-gnome-saved-search

echo "Configuring hyprland monitors..."
bash $HOME/fabarch/create_monitors_config.sh

echo "Configuring hyprpaper..."
bash $HOME/fabarch/create_hyprpaper_config.sh

echo "Setting up hyprland start on login..."
sudo systemctl set-default multi-user.target
sudo mv $HOME/fabarch/.bash_profile $HOME/.bash_profile

echo "Applying .bashrc..."
sudo mv $HOME/fabarch/.bashrc $HOME/.bashrc

echo "Applying default config..."
mv $HOME/fabarch/hyprland-final.conf $HOME/.config/hypr/hyprland.conf

echo "Done! Restarting..."
sudo shutdown -r now
