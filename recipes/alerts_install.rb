# Cookbook Name: consul
# Recipe: alerts_install

cache_path = Chef::Config[:file_cache_path]

remote_file "#{cache_path}/consul-alerts-#{node['consul']['alerts']['version']}.tar" do
  source node['consul']['alerts']['download_url']
  action :create_if_missing
end

bash "expand consul-alerts-#{node['consul']['alerts']['version']}" do
  not_if "test -f #{node['consul']['lib_path']}/bin/consul-alerts-#{node['consul']['alerts']['version']}"
  code <<-CODE
    cd "#{cache_path}"
    tar xvf consul-alerts-#{node['consul']['alerts']['version']}.tar
    mkdir -p #{node['consul']['lib_path']}/bin
    chmod +x consul-alerts
    mv consul-alerts #{node['consul']['lib_path']}/bin/consul-alerts-#{node['consul']['alerts']['version']}
  CODE
end

link "#{node['consul']['bin']}/consul-alerts" do
  to "#{node['consul']['lib_path']}/bin/consul-alerts-#{node['consul']['alerts']['version']}"
  notifies :restart, 'service[consul-alerts]', :delayed
end
