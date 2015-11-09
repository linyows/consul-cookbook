# Cookbook Name: consul
# Recipe: web_ui

cache_path = Chef::Config[:file_cache_path]

directory "#{node['consul']['lib_path']}/web-ui" do
  recursive true
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

remote_file "#{cache_path}/consul-web-ui-#{node['consul']['web_ui']['version']}.zip" do
  source node['consul']['web_ui']['download_url']
  action :create_if_missing
end

bash "expand consul-web-ui-#{node['consul']['web_ui']['version']}" do
  not_if "test -f #{node['consul']['lib_path']}/web-ui/#{node['consul']['web_ui']['version']}"
  code <<-CODE
    cd "#{cache_path}"
    unzip consul-web-ui-#{node['consul']['web_ui']['version']}.zip
    mv dist #{node['consul']['lib_path']}/web-ui/#{node['consul']['web_ui']['version']}
  CODE
end
