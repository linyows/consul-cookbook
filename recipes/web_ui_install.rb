# Cookbook Name: consul
# Recipe: web_ui_install

cache_path = Chef::Config[:file_cache_path]
consul_path = '/usr/lib/consul'

remote_file "#{cache_path}/consul-web-ui-#{node['consul']['web_ui']['version']}.zip" do
  source node['consul']['web_ui']['download_url']
  action :create_if_missing
end

bash "expand consul-web-ui-#{node['consul']['web_ui']['version']}" do
  not_if "test -f #{consul_path}/bin/#{node['consul']['web_ui']['version']}"
  code <<-CODE
    cd "#{cache_path}"
    unzip consul-web-ui-#{node['consul']['web_ui']['version']}.zip
    rm -rf #{consul_path}/web
    mv dist #{consul_path}/web
  CODE
end
