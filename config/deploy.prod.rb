set :application, "public_collections"
set :repository,  "git://github.com/zmoazeni/public-collections.git"

server = "public-collections.com"
role :web, server
role :app, server
role :db, server, :primary => true

set :deploy_to, "/home/elevatorup/#{server}/rails"

set :user, "elevatorup"
set :scm, "git"
set :branch, "master"
set :deploy_via, :remote_cache
set :scm_verbose, true # needed because git 1.5.3.x doesn't allow 'git reset -q ...'

desc "Deploy the changes to prod"
task :deploy do
  run "cd #{deploy_to} && git pull"
  run "rm -f #{deploy_to}/config/database.yml"
  run "ln -nfs #{deploy_to}/config/database.prod.yml #{deploy_to}/config/database.yml"
  run "RAILS_ENV=production rake -f #{deploy_to}/Rakefile db:migrate"
  run "mkdir -p #{deploy_to}/tmp && touch #{deploy_to}/tmp/restart.txt"
end

desc "Setup the server to deploy"
task :setup do
  run "cd #{deploy_to + "/../"} && git clone #{repository} rails"
end
