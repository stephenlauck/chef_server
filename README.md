chef_server Cookbook
====================

The chef_server cookbook provides a prescriptive way to install and manage the Chef server.

Scope
-----
This cookbook is a configuration cookbook for Chef server topologies including standalone, tiered and HA. It is designed to be used in conjunction with [chef_server_provision](https://github.com/stephenlauck/chef_server_provision) for provisioning Chef server using providers such as AWS or DigitalOcean.

Local Usage
-----
```
kitchen list
kitchen converge cent
```
Resources Overview
---------------------

### chef_server_user

The `chef_server_user` manages users on the Chef server using :create and :delete.

#### Examples

  chef_server_user 'flock' do
    firstname 'Florian'
    lastname 'Lock'
    email 'ops@example.com'
    password 'DontUseThis4Real'
    private_key_path '/tmp/flock.pem'
    action :create
    notifies :reconfigure, 'chef_server_ingredient[chef-server-core]'
  end

#### Parameters

- `username` - 

- `firstname` - 

- `lastname` - 

- `email` - 

- `password` - 

- `private_key_path` - Use to write the private key to a file instead of STDOUT.


### chef_server_org

The `chef_server_org` manages organizations on the Chef server using :create. :delete and :add_admin

#### Examples

  chef_server_org 'example' do
    org_long_name 'Example Organization'
    org_private_key_path '/tmp/example-validator.pem'
    action :create
    notifies :reconfigure, 'chef_server_ingredient[chef-server-core]'
  end

  chef_server_org 'example' do
    admins %w{ flock }
    action :add_admin
  end

  #### Parameters

- `org_name` - 

- `org_long_name` - 

- `org_private_key_path` - Use to write the private key to a file instead of STDOUT.

- `admins` - Use to add the user to the admins group.
