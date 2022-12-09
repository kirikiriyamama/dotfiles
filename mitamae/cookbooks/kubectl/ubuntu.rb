apt_repository 'kubernetes' do
  uri 'https://apt.kubernetes.io/'
  suite 'kubernetes-xenial'
  components ['main']
  key 'https://packages.cloud.google.com/apt/doc/apt-key.gpg'
end

package 'kubectl'
