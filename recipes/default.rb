# Cookbook Name: consul
# Recipe: default

include_recipe 'consul::setup'
include_recipe 'consul::config'
include_recipe 'consul::install'
include_recipe 'consul::web_ui' if node['consul']['web_ui']['use']

service 'consul' do
  supports :start => true, :status => true, :restart => true
  action [:start, :enable]
end
