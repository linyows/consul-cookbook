# Cookbook Name: consul
# Recipe: template_setup

package 'unzip'
package 'curl'

group 'consul-template' do
  system true
end

user 'consul-template' do
  shell '/bin/false'
  system true
  gid 'consul-template'
  comment 'Service user for consul-template'
end

directory '/etc/consul-template' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

cookbook_file '/etc/tmpfiles.d/consul-template.conf' do
  source 'tmpfiles.d.consul-template.conf'
  owner 'root'
  group 'root'
  mode '0755'
  cookbook node['consul']['template']['tmpfiles_file']
end

directory '/var/run/consul-template' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

template "#{node['consul']['systemd_unit_dir']}/consul-template.service" do
  source 'consul-template.service'
  owner 'root'
  group 'root'
  mode '0644'
  cookbook node['consul']['template']['systemd_cookbook']
  notifies :restart, 'service[consul-template]', :delayed
end

template "#{node['consul']['sysconfig_dir']}/consul-template" do
  source 'sysconfig.consul-template.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[consul-template]', :delayed
end
