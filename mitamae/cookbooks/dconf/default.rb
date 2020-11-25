define :dconf, value: nil do
  schema = params[:name].split('/').slice(1..-2).join('.')
  key = params[:name].split('/').slice(-1)
  value = params[:value].shellescape

  uid = run_command("id -u #{node[:user]}").stdout.chomp
  bus = "unix:path=/run/user/#{uid}/bus"

  execute "DBUS_SESSION_BUS_ADDRESS=#{bus} gsettings set #{schema} #{key} #{value}" do
    user node[:user]
    not_if "test \"$(gsettings get #{schema} #{key})\" = #{value}"
  end
end
