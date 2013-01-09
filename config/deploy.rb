set :application, "Rails Guides"
set :domain, "rails-guides.beansmile.com"
set :use_sudo, false
set :user, "deploy"
set :repository,  "./output"
set :scm, :none

 
role :web, domain
role :app, domain
role :db,  domain, :primary => true 

set :deploy_to, "/var/www/rails-guides"
set :deploy_via, :copy


namespace :local do
  task :generate_guides do
    print "generate the lastest guides"
    system "rake generate_guides_CN"
  end
end

namespace :deploy do
  task :migrate do
  end
  task :finalize_update do
  end
  task :start do
  end
  task :stop do 
  end
  task :restart do
  end
end

#callbacks
#after 'deploy:setup', 'remote:create_symlink'
before 'deploy', 'local:generate_guides'
