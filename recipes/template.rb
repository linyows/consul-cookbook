# Cookbook Name: consul
# Recipe: template

include_recipe 'consul::template_setup'
include_recipe 'consul::template_config'
include_recipe 'consul::template_install'

service 'consul-template' do
  supports :start => true, :status => true, :restart => true
  action [:start, :enable]
end
