# Cookbook Name: consul
# Recipe: default

include_recipe 'consul::setup'
include_recipe 'consul::config'
include_recipe 'consul::install'

service 'consul' do
  supports :status => true, :restart => true
  action [:start, :enable]
end
