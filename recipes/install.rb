# Cookbook Name: consul
# Recipe: install

cache_path = Chef::Config[:file_cache_path]
consul_path = '/usr/lib/consul'
bin_path = '/usr/bin'

remote_file "#{cache_path}/consul-#{node['consul']['version']}.zip" do
  source node['consul']['download_url']
  action :create_if_missing
end

bash "expand consul-#{node['consul']['version']}" do
  not_if "test -f #{consul_path}/bin/#{node['consul']['version']}"
  code <<-CODE
    cd "#{cache_path}"
    unzip consul-#{node['consul']['version']}.zip
    mkdir -p #{consul_path}/bin
    chmod +x consul
    mv consul #{consul_path}/bin/#{node['consul']['version']}
  CODE
end

link "#{bin_path}/consul" do
  to "#{consul_path}/bin/#{node['consul']['version']}"
  notifies :restart, 'service[consul]', :delayed
end
