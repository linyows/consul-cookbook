# Cookbook Name: consul
# Attribute: default

default['consul']['version'] = '0.5.2'
default['consul']['download_url'] = "https://dl.bintray.com/mitchellh/consul/#{default['consul']['version']}_linux_amd64.zip"
default['consul']['web_ui']['download_url'] = "https://dl.bintray.com/mitchellh/consul/#{default['consul']['version']}_web_ui.zip"
default['consul']['ports'] = {
  dns: 8600,
  http: 8500,
  rpc: 8400,
  serf_lan: 8301,
  serf_wan: 8302,
  server: 8300
}
default['consul']['agent_options'] = ['-data-dir /tmp/consul']
