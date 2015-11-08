# Cookbook Name: consul
# Recipe: default

include_recipe 'consul::setup'
include_recipe 'consul::config'
include_recipe 'consul::install'

if node['consul']['web_ui']['use']
  include_recipe 'consul::web_ui_install'
end

service 'consul' do
  supports :start => true, :status => true, :restart => true
  action [:start, :enable]
end
