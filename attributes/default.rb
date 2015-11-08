# Cookbook Name: consul
# Attribute: default

default['consul']['version']                  = '0.5.2'
default['consul']['agent_options']            = ['-data-dir /tmp/consul']
default['consul']['download_url']             =
  "https://dl.bintray.com/mitchellh/consul/#{default['consul']['version']}_linux_amd64.zip"

default['consul']['web_ui']['version']        = '0.5.2'
default['consul']['web_ui']['use']            = false
default['consul']['web_ui']['download_url']   =
  "https://dl.bintray.com/mitchellh/consul/#{default['consul']['version']}_web_ui.zip"

default['consul']['template']['version']      = '0.11.1'
default['consul']['template']['download_url'] =
  "https://codeload.github.com/hashicorp/consul-template/zip/v#{default['consul']['template']['version']}"
default['consul']['template']['options']      = []
