# Cookbook Name:: consul
# Recipe:: retry

cookbook_file "#{node['consul']['lib_path']}/bin/retry" do
  source 'retry.sh'
  user 'root'
  group 'root'
  chmod '0755'
  notifies :restart, 'service[consul]', :delayed
end
