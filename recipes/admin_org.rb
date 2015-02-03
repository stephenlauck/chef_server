execute 'create admin' do
  command <<-EOM.gsub(/\s+/, ' ').strip!
    chef-server-ctl user-create #{node['chef_server']['admin']['username']}
    #{node['chef_server']['admin']['firstname']}
    #{node['chef_server']['admin']['lastname']}
    #{node['chef_server']['admin']['email']}
    #{node['chef_server']['admin']['password']}
    -f #{node['chef_server']['admin']['private_key_path']}
  EOM
  not_if "chef-server-ctl user-list | grep -w #{node['chef_server']['admin']['username']}"
end

execute 'create organization' do
  command <<-EOM.gsub(/\s+/, ' ').strip!
    chef-server-ctl org-create #{node['chef_server']['organization']}
    #{node['chef_server']['organization_long_name']}
    -a #{node['chef_server']['admin']['username']}
    -f #{node['chef_server']['organization_private_key_path']}
  EOM
  not_if "chef-server-ctl org-list | grep -w #{node['chef_server']['organization']}"
end