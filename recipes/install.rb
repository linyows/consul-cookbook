# Cookbook Name: consul
# Recipe: install

cache_path = Chef::Config[:file_cache_path]

remote_file "#{cache_path}/consul-#{node['consul']['version']}.zip" do
  source node['consul']['download_url']
  action :create_if_missing
end

bash "expand consul-#{node['consul']['version']}" do
  not_if "test -f #{node['consul']['lib_path']}/bin/consul-#{node['consul']['version']}"
  code <<-CODE
    cd "#{cache_path}"
    unzip consul-#{node['consul']['version']}.zip
    chmod +x consul
    mv consul #{node['consul']['lib_path']}/bin/consul-#{node['consul']['version']}
  CODE
end

link "#{node['consul']['bin']}/consul" do
  to "#{node['consul']['lib_path']}/bin/consul-#{node['consul']['version']}"
  notifies :restart, 'service[consul]', :delayed
end
