set :repo_url, 'git@github.com:wakproductions/ycurve-vue.git'
set :scm, :git

# set :docker_container_name, 'ycurve

append :linked_files,
  '.env',
  'log/production.log'

# append :linked_dirs, 'backups'

# Don't symlink log folder because Docker pulls the symlink and not the actual folder
# append :linked_dirs,
#   './backend/log'

set :keep_releases, 5