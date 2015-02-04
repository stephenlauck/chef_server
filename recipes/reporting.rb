chef_server_ingredient 'opscode-reporting' do
  notifies :reconfigure, 'chef_server_ingredient[opscode-reporting]'
end