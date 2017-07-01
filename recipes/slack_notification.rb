# Cookbook Name: consul
# Recipe: slack_notification

template "#{node['consul']['bin']}/slack_notify" do
  source 'slack_notify.sh.erb'
  owner 'root'
  group 'root'
  mode 0o755
end
