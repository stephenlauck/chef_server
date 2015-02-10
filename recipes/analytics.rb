directory '/etc/opscode-analytics' do
  recursive true
end

chef_server_ingredient 'opscode-analytics' do
  action :install
end

template "/etc/opscode-analytics/opscode-analytics.rb" do
  source "opscode-analytics.rb.erb"
  variables(
    :analytics_fqdn => node['chef_server']['analytics']['fqdn']
  )
  notifies :reconfigure, 'chef_server_ingredient[opscode-analytics]'
end