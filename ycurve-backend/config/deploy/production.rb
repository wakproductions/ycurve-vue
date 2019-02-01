server 'ustreasuryyieldcurve', user: 'mikepence', roles: %w{web app db}

set :deploy_to, '/var/www/ustreasuryyieldcurve-com'

namespace :custom do
  task :setup_container do
    on roles(:web) do |host|
      puts "================Starting Docker setup===================="
      # Working directory hack
      # https://stackoverflow.com/questions/19452983/capistrano-3-execute-within-a-directory
      execute "cd #{fetch(:deploy_to)}/current; sudo docker-compose build"
      execute "cd #{fetch(:deploy_to)}/current; sudo docker-compose down"
      execute "cd #{fetch(:deploy_to)}/current; sudo docker-compose up -d"
      execute "sudo docker network prune -f"

      # Run the daemons
      # execute "cd #{fetch(:deploy_to)}/current; sudo docker-compose run -d web bundle exec rake yield_curve_snapshots:run_update_daemon"
    end
  end
end

after "deploy:published", "custom:setup_container"
