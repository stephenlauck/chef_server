#
# Cookbook Name:: chef_server
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

directory '/etc/opscode' do
  mode 0755
  recursive true
end

directory '/etc/opscode-analytics' do
  recursive true
end

chef_server_ingredient 'chef-server-core' do
  reconfigure true
  action :install
end

file '/etc/opscode/private-chef.rb' do
  content <<-EOH
# api_fqdn '#{node['fqdn']}'
# dark_launch['actions'] = true
# rabbitmq['vip'] = '#{node['ipaddress']}'
# rabbitmq['node_ip_address'] = '0.0.0.0'
nginx['enable_non_ssl'] = true
EOH
  notifies :reconfigure, 'chef_server_ingredient[chef-server-core]'
end

# These two resources set permissions on the files to make them
# readable as a workaround for
# https://github.com/opscode/chef-provisioning/issues/174
file '/etc/opscode-analytics/actions-source.json' do
  mode 00755
end

file '/etc/opscode-analytics/webui_priv.pem' do
  mode 00755
end