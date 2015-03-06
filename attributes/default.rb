default['chef_server']['version'] = nil

# The Chef Server must have an API FQDN set.
# Ref. http://docs.chef.io/install_server_pre.html#hostnames
default['chef_server']['api_fqdn'] = node['fqdn']

# list of add-ons to install
default['chef_server']['add_ons'] = %w{ opscode-manage }

#
# Chef Server Tunables
#
# For a complete list see:
# http://docs.chef.io/server/config_rb_server.html
#
# Example:
#
# In a recipe:
#
#     node.override['chef_server']['configuration']['nginx']['ssl_port'] = 4433
#
# In a role:
#
#     default_attributes(
#       'chef_server' => {
#         'configuration' => {
#           'nginx' => {
#             'ssl_port' => 4433
#           }
#         }
#       }
#     )
#
default['chef_server']['configuration'] = {}