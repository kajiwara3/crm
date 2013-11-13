# -*-coding: utf-8-*-
require 'bundler/capistrano'

# multistage setting
require 'capistrano/ext/multistage'

set :stages, %w(production staging)

# default stage name
set :default_stage, "staging"

# color output setting
require 'capistrano_colors'
set :application, "tw"

# RVM
require "rvm/capistrano"
set :rvm_ruby_strig, "1.9.3"

# ssh settings
set :use_sudo, true
set :default_run_options, :pty => true
ssh_options[:forward_agent] = true
set :normalize_asset_timestamps, false
set :scm_verbose, true
set :keep_releases, 10

namespace :deploy do
  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; rake db:seed RAILS_ENV=#{rails_env}"
  end

  desc "Copy shared config files to current application."
  task :config_symlink do
    run "rm -f #{release_path}/config/database.yml; ln -s /var/www/config/database.yml #{release_path}/config/database.yml"
  end

  namespace :db do
    desc "Create #{rails_env} Database"
    task :create do
      puts "\n\n=== Creating the Production Database! ===\n\n"
      run "cd #{current_path}; rake db:create RAILS_ENV=#{rails_env}"
      system "cap deploy:set_permissions"
    end

    desc "Migrate Database"
    task :migrate, {:roles => :db, :only => {:primary => true}} do
      run "cd #{current_path} && bundle exec rake db:migrate RAILS_ENV=#{rails_env}"
    end

    desc "Drop Database"
    task :drop, {:roles => :db, :only => {:primary => true}} do
      run "cd #{current_path} && bundle exec rake db:drop RAILS_ENV=#{rails_env}"
    end

    task :init, {:roles => :db, :only => {:primary => true}} do
      tasks = %w(deploy:update_code
                 deploy:db:drop
                 deploy:db:create
                 deploy:migrate
                 deploy:db:seed)

      agree = Capistrano::CLI.ui.agree("deploy:db:init will DROP your database. Are you sure? (Yes, No)") do |q|
        q.default = 'No'
      end
    end
  end
end

desc "install the necessary prerequisites"
task :bundle_install, :roles => :app do
  run "cd #{release_path} && bundle install"
end

after 'deploy:restart', 'unicorn:restart'
after "deploy:update_code", :bundle_install

# 本コマンド実行時に、デプロイ先に配置してあるdatabase.ymlのシンボリックリンクを設定する
after "deploy:update","deploy:config_symlink"
# 本コマンド実行時に、デプロイ先に配置してあるdatabase.ymlのシンボリックリンクを設定する
before "deploy:migrate", "deploy:config_symlink"
