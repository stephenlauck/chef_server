#
# Cookbook Name:: analytics_test
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

hostsfile_entry '33.33.33.11' do
  hostname  'analytics.example.com'
  unique    true
end

