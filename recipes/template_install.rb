# Cookbook Name: consul
# Recipe: consul_template

cache_path = Chef::Config[:file_cache_path]
consul_path = '/usr/lib/consul'
bin_path = '/usr/bin'

remote_file "#{cache_path}/consul-template-#{node['consul']['template']['version']}.zip" do
  source node['consul']['template']['download_url']
  action :create_if_missing
end

bash "expand consul-template-#{node['consul']['template']['version']}" do
  not_if "test -f #{consul_path}/bin/#{node['consul']['template']['version']}"
  code <<-CODE
    cd "#{cache_path}"
    unzip consul-template-#{node['consul']['template']['version']}.zip
    mkdir -p #{consul_path}/bin
    chmod +x consul-template
    mv consul-template #{consul_path}/bin/#{node['consul']['template']['version']}
  CODE
end

link "#{bin_path}/consul-template" do
  to "#{consul_path}/bin/#{node['consul']['template']['version']}"
  notifies :restart, 'service[consul]', :delayed
end
