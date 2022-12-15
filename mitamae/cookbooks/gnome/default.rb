package 'jack2'
package 'xdg-desktop-portal-gnome'

package 'gnome'
package 'gnome-tweaks'

aur 'gnome-browser-connector'

package 'gnome-shell-extension-appindicator'
package 'power-profiles-daemon'

service 'gdm.service' do
  action :enable
end

include_cookbook 'gnome_settings'
