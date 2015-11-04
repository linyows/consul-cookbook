# Cookbook Name: consul
# Recipe: setup

package 'unzip'
package 'curl'

group 'consul' do
  system true
end

user 'consul' do
  shell '/bin/false'
  system true
  gid 'consul'
  comment 'Service user for consul'
end

directory '/etc/consul.d' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

cookbook_file '/usr/lib/systemd/system/consul.service' do
  source 'consul.service'
  owner 'root'
  group 'root'
  mode '0755'
  notifies :restart, 'service[consul]', :delayed
end

template '/etc/sysconfig/consul' do
  source 'etc.sysconfig.consul.erb'
  owner 'root'
  group 'root'
  mode '0755'
  notifies :restart, 'service[consul]', :delayed
end
