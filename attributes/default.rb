default['chef_server']['admin']['username'] = 'flock'
default['chef_server']['admin']['firstname'] = 'Florian'
default['chef_server']['admin']['lastname'] = 'Lock'
default['chef_server']['admin']['email'] = 'ops@example.com'
default['chef_server']['admin']['password'] = 'DontUseThis4Real'
default['chef_server']['admin']['private_key_path'] = '/tmp/flock.pem'

default['chef_server']['organization'] = 'example'
default['chef_server']['organization_long_name'] = 'Example Organization'
default['chef_server']['organization_private_key'] = "#{node['chef_server']['organization']}-validator.pem"
default['chef_server']['organization_private_key_path'] = File.join('/tmp', node['chef_server']['organization_private_key'])
