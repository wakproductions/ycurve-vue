set :repo_url, 'git@github.com:wakproductions/ycurve-vue.git'
set :scm, :git

# set :docker_container_name, 'ycurve

append :linked_files,
  '.env',
  'docker-compose.yml',
  'docker-compose.production.yml'

append :linked_dirs,
  './ycurve-backend/log'