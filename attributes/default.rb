# Cookbook Name: consul
# Attribute: default

default['consul']['lib_path']                     = '/usr/lib/consul'

default['consul']['version']                      = '0.5.2'
default['consul']['command_options']              = ['-data-dir /tmp/consul']
default['consul']['conf_cookbook']                = 'consul'
default['consul']['systemd_cookbook']             = 'consul'
default['consul']['download_url']                 = "https://dl.bintray.com/mitchellh/consul/#{default['consul']['version']}_linux_amd64.zip"

default['consul']['dc']                           = 'dc1'
default['consul']['servers']                      = %w()
default['consul']['start_join']                   = false
default['consul']['domain']                       = 'consul'
default['consul']['log_level']                    = 'INFO'
default['consul']['bind_addr']                    = '0.0.0.0'
default['consul']['client_addr']                  = '127.0.0.1'

default['consul']['web_ui']['version']            = '0.5.2'
default['consul']['web_ui']['use']                = false
default['consul']['web_ui']['download_url']       = "https://dl.bintray.com/mitchellh/consul/#{default['consul']['version']}_web_ui.zip"

default['consul']['template']['version']          = '0.11.0'
default['consul']['template']['download_url']     = "https://github.com/hashicorp/consul-template/releases/download/v#{default['consul']['template']['version']}/consul_template_#{default['consul']['template']['version']}_linux_amd64.zip"
default['consul']['template']['command_options']  = []
default['consul']['template']['conf_cookbook']    = 'consul'
default['consul']['template']['systemd_cookbook'] = 'consul'

default['consul']['retry']['version']             = '0.1.0'
default['consul']['retry']['download_url']        = "https://github.com/linyows/go-retry/releases/download/v#{default['consul']['retry']['version']}/linux_amd64.zip"
