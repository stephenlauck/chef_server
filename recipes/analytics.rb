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

template "/etc/opscode-analytics/actions-source.json" do
  source "action-source.json.erb"
  variables(

  )
  notifies :reconfigure, 'chef_server_ingredient[opscode-analytics]'
end

cookbook_file "/etc/opscode-analytics/webui_priv.pem" do
  source "webui_priv.pem"
  mode 0600
  action :create
  notifies :reconfigure, 'chef_server_ingredient[opscode-analytics]'
end