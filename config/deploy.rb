require 'capistrano'
require 'capistrano-vexxhost'
require 'bundler/capistrano'
require 'net/http'
require 'net/https'

use_ssl= false
ssh_options[:forward_agent] = false
default_run_options[:pty] = true

set :user, "eullerbt"
set :password, "1pquRv699Z"
set :domain, "grupo3012.net"
set :mount_path, "/"
set :application, "registro_ver"

set :scm, :none
set :repository, "."
set :deploy_via, :copy

set :default_environment, {
  'PATH'         => "/opt/git/bin:/opt/svn/bin:/opt/php5/bin:/opt/ImageMagick/bin:/opt/ruby/bin:$HOME/ruby/gems/bin:$PATH:$HOME/bin",
  'GEM_HOME'     => "/home/#{user}/ruby/gems",
  'GEM_PATH'     => "/home/#{user}/ruby/gems:/usr/local/lib/ruby/gems/1.8"
}



# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
role :web, "grupo3012.net"                          # Your HTTP server, Apache/etc
role :app, "grupo3012.net"                          # This may be the same as your `Web` server
#role :db,  "localhost", :primary => true # This is where Rails migrations will run


# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

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
