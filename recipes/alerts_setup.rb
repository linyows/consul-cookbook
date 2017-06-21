# Cookbook Name: consul
# Recipe: alerts_setup

template "#{node['consul']['systemd_unit_dir']}/consul-alerts.service" do
  source 'consul-alerts.service'
  owner 'root'
  group 'root'
  mode '0644'
  cookbook node['consul']['alerts']['systemd_cookbook']
  notifies :restart, 'service[consul-alerts]', :delayed
end

template "#{node['consul']['sysconfig_dir']}/consul-alerts" do
  source 'sysconfig.consul-alerts.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[consul-alerts]', :delayed
end
