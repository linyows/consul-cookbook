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

directory '/etc/consul' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory "#{node['consul']['lib_path']}/bin" do
  recursive true
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

template "#{node['consul']['systemd_unit_dir']}/consul.service" do
  source 'consul.service'
  owner 'root'
  group 'root'
  mode '0644'
  cookbook node['consul']['systemd_cookbook']
  notifies :restart, 'service[consul]', :delayed
end

template "#{node['consul']['sysconfig_dir']}/consul" do
  source 'sysconfig.consul.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[consul]', :delayed
end
