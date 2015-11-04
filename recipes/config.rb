# Cookbook Name:consul
# Recipe: config

template '/etc/consul.d/config.json' do
  source 'config.json.erb'
  user 'consul'
  group 'consul'
  mode '0755'
  cookbook node['consul']['config_cookbook']
  action :create
  notifies :restart, 'service[consul]', :delayed
end
