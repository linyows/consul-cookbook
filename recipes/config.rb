# Cookbook Name:consul
# Recipe: config

template '/etc/consul/config.json' do
  source 'consul.config.json.erb'
  user 'consul'
  group 'consul'
  mode '0644'
  cookbook node['consul']['conf_cookbook']
  action :create
  notifies :restart, 'service[consul]', :delayed
end
