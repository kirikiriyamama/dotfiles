#
# interface
#
dconf '/org/gnome/desktop/interface/clock-show-weekday' do
  value 'true'
end

dconf '/org/gnome/desktop/interface/enable-animations' do
  value 'false'
end

dconf '/org/gnome/desktop/interface/show-battery-percentage' do
  value 'true'
end

dconf '/org/gnome/desktop/interface/gtk-enable-primary-paste' do # middle click paste
  value 'false'
end

#
# peripherals
#
dconf '/org/gnome/desktop/peripherals/keyboard/delay' do
  value 'uint32 200'
end

dconf '/org/gnome/desktop/peripherals/keyboard/repeat-interval' do
  value 'uint32 20'
end

dconf '/org/gnome/desktop/peripherals/touchpad/click-method' do
  value "'fingers'"
end

#
# keybindings
#
dconf '/org/gnome/mutter/overlay-key' do
  value "''"
end

dconf '/org/gnome/shell/keybindings/toggle-overview' do
  value "['<Super>Space', '<Ctrl>Up']"
end

dconf '/org/gnome/desktop/wm/keybindings/switch-to-workspace-left' do
  value "['<Control>Left']"
end

dconf '/org/gnome/desktop/wm/keybindings/switch-to-workspace-right' do
  value "['<Control>Right']"
end

dconf '/org/gnome/desktop/wm/keybindings/switch-applications' do
  value '@as []'
end

dconf '/org/gnome/desktop/wm/keybindings/switch-applications-backward' do
  value '@as []'
end

dconf '/org/gnome/desktop/wm/keybindings/switch-windows' do
  value "['<Super>Tab']"
end

dconf '/org/gnome/desktop/wm/keybindings/switch-windows-backward' do
  value "['<Shift><Super>Tab']"
end

dconf '/org/gnome/shell/keybindings/toggle-message-tray' do
  value '@as []'
end

dconf '/org/gnome/settings-daemon/plugins/media-keys/screensaver' do
  value '@as []'
end

dconf '/org/gnome/desktop/wm/keybindings/minimize' do
  value '@as []'
end

#
# others
#
dconf '/org/gnome/mutter/experimental-features' do # fractional scaling
  value "['scale-monitor-framebuffer']"
end
