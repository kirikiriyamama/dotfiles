apt_repository 'helm' do
  uri 'https://baltocdn.com/helm/stable/debian/'
  suite 'all'
  components ['main']
  key 'https://baltocdn.com/helm/signing.asc'
end

package 'helm'
