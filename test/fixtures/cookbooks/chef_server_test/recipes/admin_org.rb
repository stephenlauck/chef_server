#
# Cookbook Name:: admin_org_test
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

chef_server_user 'flock' do
  firstname 'Florian'
  lastname 'Lock'
  email 'ops@example.com'
  password 'DontUseThis4Real'
  private_key_path '/tmp/flock.pem'
  action :create
  notifies :reconfigure, 'chef_server_ingredient[chef-server-core]'
end

chef_server_org 'example' do
  org_long_name 'Example Organization'
  org_private_key_path '/tmp/example-validator.pem'
  action :create
  notifies :reconfigure, 'chef_server_ingredient[chef-server-core]'
end

chef_server_org 'example' do
  admins %w{ flock }
  action :add_admin
end