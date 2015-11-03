# Cookbook Name: consul
# Recipe: installation

cache_path = Chef::Config[:file_cache_path]
consul_path = '/usr/local/lib/consul'

remote_file "#{cache_path}/consul-#{node['consul']['version']}.zip" do
  source node['consul']['download_url']
  action :create_if_missing
end

directory '/etc/consul.d' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

bash "expand consul-#{node['consul']['version']}" do
  not_if "test -f #{consul_path}/bin/#{node['consul']['version']}"
  code <<-CODE
    cd "#{cache_path}"
    unzip consul-#{node['consul']['version']}.zip
    mkdir -p #{consul_path}/bin
    mv consul #{consul_path}/bin/#{node['consul']['version']}
  CODE
end

link '/usr/local/bin/consul' do
  to "#{consul_path}/bin/#{node['consul']['version']}"
end

cookbook_file '/usr/lib/systemd/system/consul.service' do
  source 'consul.service'
end
