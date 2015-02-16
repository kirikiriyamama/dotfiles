_bundler-installed() {
  which bundle > /dev/null 2>&1
}

_within-bundled-project() {
  local check_dir=${PWD}
  while [[ ${check_dir} != '/' ]]; do
    [[ -f ${check_dir}/Gemfile ]] && return
    check_dir="$(dirname ${check_dir})"
  done
  false
}

_run-with-bundler() {
  if _bundler-installed && _within-bundled-project; then
    bundle exec ${@}
  else
    ${@}
  fi
}


bundled_commands=(
berks
cap
foreman
guard
irb
jekyll
knife
middleman
pry
pry-remote
rackup
rails
rake
rspec
ruby
shotgun
spork
spring
thor
travis-lint
unicorn
unicorn_rails
whenever
wheneverize
)

for cmd in ${bundled_commands}; do
  eval "function unbundled_${cmd} () { ${cmd} \$@ }"
  eval "function bundled_${cmd} () { _run-with-bundler ${cmd} \$@}"
  alias ${cmd}=bundled_${cmd}

  if which _${cmd} > /dev/null 2>&1; then
    compdef _${cmd} bundled_${cmd}=${cmd}
  fi
done
