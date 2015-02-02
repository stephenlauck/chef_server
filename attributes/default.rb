default['chef-server']['admin']['username'] = 'flock'
default['chef-server']['admin']['firstname'] = 'Florian'
default['chef-server']['admin']['lastname'] = 'Lock'
default['chef-server']['admin']['email'] = 'ops@example.com'
default['chef-server']['admin']['password'] = 'DontUseThis4Real'
default['chef-server']['admin']['private_key_path'] = '/tmp/flock.pem'

default['chef-server']['organization'] = 'example'
default['chef-server']['organization_long_name'] = 'Example Organization'
default['chef-server']['organization_private_key'] = "#{node['chef-server']['organization']}-validator.pem"
default['chef-server']['organization_private_key_path'] = File.join('/tmp', node['chef-server']['organization_private_key'])
