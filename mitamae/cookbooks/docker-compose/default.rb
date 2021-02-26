github_binary 'docker-compose' do
  repository 'docker/compose'
  version '1.27.4'
  asset 'docker-compose-$(uname -s)-$(uname -m)'

  source 'docker-compose-$(uname -s)-$(uname -m)'
end
