# Cookbook Name:consul
# Recipe: template_config

template '/etc/consul-template.conf' do
  source 'etc.consul-template.hcl.erb'
  user 'root'
  group 'root'
  mode '0644'
  cookbook node['consul']['template']['config_cookbook']
  action :create
  notifies :restart, 'service[consul-template]', :delayed
end
