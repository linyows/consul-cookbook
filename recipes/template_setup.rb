# Cookbook Name: consul
# Recipe: template_setup

package 'unzip'
package 'curl'

directory '/var/run/consul-template' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory "#{node['consul']['lib_path']}/template.d" do
  recursive true
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

cookbook_file '/usr/lib/systemd/system/consul-template.service' do
  source 'consul-template.service'
  owner 'root'
  group 'root'
  mode '0755'
  cookbook node['consul']['template']['systemd_cookbook']
  notifies :restart, 'service[consul-template]', :delayed
end

template '/etc/sysconfig/consul-template' do
  source 'etc.sysconfig.consul-template.erb'
  owner 'root'
  group 'root'
  mode '0755'
  notifies :restart, 'service[consul-template]', :delayed
end
