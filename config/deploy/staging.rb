# -*-coding: utf-8-*-
# RVM
#### rvmのパス
set :rvm_path, '~/.rvm'
set :rvm_bin_path, "#{rvm_path}/bin"
set :rvm_lib_path, "#{rvm_path}/lib"

#SSHユーザーの設定
set :user, 'ec2-user'

# デプロイ先のディレクトリ設定
set :deploy_to, "/var/www/current"
# デプロイ環境名
set :rails_env, "staging"
# server "54.238.159.246", :app, :web, :db, primary: true
[:web, :app].each do |type|
  role type, '54.238.159.246'
end
role :db, '54.238.159.246', :primary => true

# Bundle
set :bundle_flags, ""
ssh_options[:keys] = %w(~/.ssh/aws/dev_akatsuka01.pem)

# git settings
set :scm, :git
set :repository, "git://github.com/kajiwara3/tw.git"
set :branch, "master"
set :scm_verbose, true
set :deploy_via, :remote_cache

require 'capistrano-unicorn'
