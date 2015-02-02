execute 'create admin' do
  command <<-EOM.gsub(/\s+/, ' ').strip!
    chef-server-ctl user-create #{node['chef-server']['admin']['username']}
    #{node['chef-server']['admin']['firstname']}
    #{node['chef-server']['admin']['lastname']}
    #{node['chef-server']['admin']['email']}
    #{node['chef-server']['admin']['password']}
    -f #{node['chef-server']['admin']['private_key_path']}
  EOM
  not_if "chef-server-ctl user-list | grep -w #{node['chef-server']['admin']['username']}"
end

execute 'create organization' do
  command <<-EOM.gsub(/\s+/, ' ').strip!
    chef-server-ctl org-create #{node['chef-server']['organization']}
    #{node['chef-server']['organization_long_name']}
    -a #{node['chef-server']['admin']['username']}
    -f #{node['chef-server']['organization_private_key_path']}
  EOM
  not_if "chef-server-ctl org-list | grep -w #{node['chef-server']['organization']}"
end