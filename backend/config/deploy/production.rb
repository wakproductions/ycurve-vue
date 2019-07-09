server 'ustreasuryyieldcurve', user: 'mikepence', roles: %w{web app db}

set :deploy_to, '/var/www/ustreasuryyieldcurve-com'
set :containers, %w(ycurve_backend ycurve_frontend ycurve_database ycurve_update_daemon)

namespace :custom do
  task :setup_container do
    on roles(:web) do |host|
      puts "================Starting Docker setup===================="
      # Working directory hack
      # https://stackoverflow.com/questions/19452983/capistrano-3-execute-within-a-directory

      # https://stackoverflow.com/questions/758774/capistrano-bash-ignore-command-exit-status
      execute "cd #{fetch(:deploy_to)}/current; docker kill #{fetch(:containers).join(' ')}; true"
      execute "cd #{fetch(:deploy_to)}/current; docker-compose down; true"
      execute "cd #{fetch(:deploy_to)}/current; docker rm #{fetch(:containers).join(' ')}; true"

      execute "cd #{fetch(:deploy_to)}/current; docker-compose build; true"
      # execute "cd #{fetch(:deploy_to)}/current; sudo docker-compose run web rake db:migrate"
      execute "cd #{fetch(:deploy_to)}/current; docker-compose -f docker-compose.yml -f docker-compose.production.yml up -d"
      execute "docker network prune -f"

      # Run the daemons
      # execute "cd #{fetch(:deploy_to)}/current; sudo docker-compose run -d web bundle exec rake yield_curve_snapshots:run_update_daemon"
    end
  end
end

after "deploy:published", "custom:setup_container"