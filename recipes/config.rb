# Cookbook Name:consul
# Recipe: config

template '/etc/consul.d/config.json' do
  source 'consul.d.config.json.erb'
  user 'consul'
  group 'consul'
  mode '0644'
  cookbook node['consul']['conf_cookbook']
  action :create
  notifies :restart, 'service[consul]', :delayed
end
