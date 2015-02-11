#
# Cookbook Name:: chef_server
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

directory '/etc/opscode' do
  mode 0755
  recursive true
end

chef_server_ingredient 'chef-server-core' do
  reconfigure true
  action :install
end
