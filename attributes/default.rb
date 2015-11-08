# Cookbook Name: consul
# Attribute: default

default['consul']['version']                     = '0.5.2'
default['consul']['agent_options']               = ['-data-dir /tmp/consul']
default['consul']['config_cookbook']             = 'consul'
default['consul']['download_url']                = "https://dl.bintray.com/mitchellh/consul/#{default['consul']['version']}_linux_amd64.zip"

default['consul']['dc']                          = 'dc1'
default['consul']['servers']                     = %w()
default['consul']['start_join']                  = false
default['consul']['domain']                      = 'consul'
default['consul']['log_level']                   = 'INFO'
default['consul']['client_addr']                 = '0.0.0.0'
default['consul']['client_addr']                 = '127.0.0.1'

default['consul']['web_ui']['version']           = '0.5.2'
default['consul']['web_ui']['use']               = false
default['consul']['web_ui']['download_url']      = "https://dl.bintray.com/mitchellh/consul/#{default['consul']['version']}_web_ui.zip"

default['consul']['template']['version']         = '0.11.1'
default['consul']['template']['download_url']    = "https://codeload.github.com/hashicorp/consul-template/zip/v#{default['consul']['template']['version']}"
default['consul']['template']['options']         = []
default['consul']['template']['config_cookbook'] = 'consul'
