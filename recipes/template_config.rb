# Cookbook Name:consul
# Recipe: template_config

template '/etc/consul-template.conf' do
  source 'consul-template.conf.erb'
  user 'root'
  group 'root'
  mode '0644'
  cookbook node['consul']['template']['conf_cookbook']
  action :create
  notifies :restart, 'service[consul-template]', :delayed
end
