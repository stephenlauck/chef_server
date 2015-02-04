chef_server_ingredient 'opscode-push-jobs-server' do
  notifies :reconfigure, 'chef_server_ingredient[opscode-push-jobs-server]'
end