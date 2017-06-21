# Cookbook Name:: consul
# Recipe:: retry

cache_path = Chef::Config[:file_cache_path]

remote_file "#{cache_path}/retry-#{node['consul']['retry']['version']}.zip" do
  source node['consul']['retry']['download_url']
  action :create_if_missing
end

bash "expand retry-#{node['consul']['retry']['version']}" do
  not_if "which retry && test $(retry -version 2>&1 | awk '{print $3}') = '#{node['consul']['retry']['version']}'"
  code <<-CODE
    cd "#{cache_path}"
    unzip retry-#{node['consul']['retry']['version']}.zip
    chmod +x retry
    rm -rf #{node['consul']['bin']}/retry
    mv retry #{node['consul']['bin']}/retry
  CODE
end
