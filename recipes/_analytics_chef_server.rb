execute 'stop_chef_server' do
  command '/opt/opscode/bin/chef-server-ctl stop'
  action :nothing
  notifies :run, "execute[reconfigure_chef_server]"
end

execute 'reconfigure_chef_server' do
  command '/opt/opscode/bin/chef-server-ctl reconfigure'
  action :nothing
  notifies :run, "execute[start_chef_server]"
end

execute 'start_chef_server' do
  command '/opt/opscode/bin/chef-server-ctl start'
  action :nothing
end

template "/etc/opscode/chef-server.rb" do
  source "chef-server.rb.erb"
  variables(
    :api_fqdn => node['chef_server']['fqdn'],
    :analytics_redirect_url => "https://#{node['chef_server']['analytics']['fqdn']}/",
    :backend_vip => node['chef_server']['backend_vip']
  )
  notifies :run, "execute[stop_chef_server]"
end