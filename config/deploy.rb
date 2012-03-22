set :application, "timebank"
set :repository,  "git@github.com:rewritten/timebank.git"

set :scm, :git

set :deploy_to, "/home/bdt/deploy"
set :user, "bdt"
ssh_options[:forward_agent] = true

role :web, "ns384078.ovh.net"                   # Your HTTP server, Apache/etc
role :app, "ns384078.ovh.net"                   # This may be the same as your `Web` server
role :db,  "ns384078.ovh.net", :primary => true # This is where Rails migrations will run

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

