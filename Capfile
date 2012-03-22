#!/usr/bin/ruby

load 'deploy'
load 'deploy/assets'
Dir['vendor/gems/*/recipes/*.rb','vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
load 'config/deploy' # remove this line to skip loading any of the default tasks


desc "Uploads CHANGELOG.txt to all remote servers."
task :upload_private_config do
  upload(File.expand_path('../config/private_config.yml', __FILE__), "#{current_path}/config/private_config.yml")
end

before "deploy:restart", "deploy:upload_private_config"


namespace :deploy do
  [:start, :stop, :restart].each do |cmd|
    desc "#{cmd.capitalize} the Thin process"
    task cmd do
      sudo "/etc/init.d/thin #{cmd}", as: "root"
    end
  end
end


