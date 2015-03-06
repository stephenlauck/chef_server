#
# Cookbook Name:: chef_server
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

directory '/etc/opscode' do
  recursive true
end

directory '/etc/opscode-analytics' do
  recursive true
end

chef_server_ingredient 'chef-server-core' do
  version node['chef_server']['version']
  action [:install, :reconfigure]
end

# create the initial chef-server config file
template '/etc/opscode/chef_server.rb' do
  source 'chef-server.rb.erb'
  owner 'root'
  group 'root'
  action :create
  notifies :reconfigure, 'chef_server_ingredient[chef-server-core]'
end

ruby_block 'ensure node can resolve API FQDN' do
  block do
    fe = Chef::Util::FileEdit.new('/etc/hosts')
    fe.insert_line_if_no_match(/#{node['chef_server']['api_fqdn']}/,
      "127.0.0.1 #{node['chef_server']['api_fqdn']}")
    fe.write_file
  end
  not_if { node['chef_server']['api_fqdn'].nil? || node['chef_server']['api_fqdn'].empty? }
  not_if { Resolv.getaddress(node['chef_server']['api_fqdn']) rescue false } # host resolves
end