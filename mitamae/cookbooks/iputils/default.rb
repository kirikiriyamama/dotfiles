package 'iputils'

ping = run_command('command -v ping').stdout.chomp
file ping do
  mode '4755' # rwsr-xr-x
end
