# Cookbook Name: consul
# Recipe: alerts_setup

cookbook_file "#{node['consul']['systemd_unit_dir']}/consul-alerts.service" do
  source 'consul-alerts.service'
  owner 'root'
  group 'root'
  mode '0755'
  cookbook node['consul']['alerts']['systemd_cookbook']
  notifies :restart, 'service[consul-alerts]', :delayed
end

template '/etc/sysconfig/consul-alerts' do
  source 'sysconfig.consul-alerts.erb'
  owner 'root'
  group 'root'
  mode '0755'
  notifies :restart, 'service[consul-alerts]', :delayed
end
