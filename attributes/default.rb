# Cookbook Name: consul
# Attribute: default

default['consul']['lib_path']                     = '/usr/lib/consul'

default['consul']['version']                      = '0.7.1'
default['consul']['command_options']              = ['-data-dir /tmp/consul']
default['consul']['conf_cookbook']                = 'consul'
default['consul']['systemd_cookbook']             = 'consul'
default['consul']['download_url']                 = "https://releases.hashicorp.com/consul/#{default['consul']['version']}/consul_#{default['consul']['version']}_linux_amd64.zip"

default['consul']['dc']                           = 'dc1'
default['consul']['if']                           = 'enp0s8'
default['consul']['servers']                      = %w()
default['consul']['start_join']                   = false
default['consul']['domain']                       = 'consul'
default['consul']['log_level']                    = 'INFO'
default['consul']['bind_addr']                    = ''
default['consul']['client_addr']                  = '127.0.0.1'
default['consul']['multiple_private_ip']          = false

default['consul']['web_ui']['version']            = '0.7.1'
default['consul']['web_ui']['use']                = false
default['consul']['web_ui']['download_url']       = "https://releases.hashicorp.com/consul/#{default['consul']['version']}/consul_#{default['consul']['version']}_web_ui.zip"

default['consul']['template']['version']          = '0.16.0'
default['consul']['template']['download_url']     = "https://releases.hashicorp.com/consul-template/#{default['consul']['template']['version']}/consul-template_#{default['consul']['template']['version']}_linux_amd64.zip"
default['consul']['template']['command_options']  = []
default['consul']['template']['conf_cookbook']    = 'consul'
default['consul']['template']['systemd_cookbook'] = 'consul'
default['consul']['template']['tmpfiles_cookbook']= 'consul'

default['consul']['alerts']['version']            = '0.4.0'
default['consul']['alerts']['download_url']       = "https://github.com/AcalephStorage/consul-alerts/releases/download/v#{default['consul']['alerts']['version']}/consul-alerts-#{default['consul']['alerts']['version']}-linux-amd64.tar"
default['consul']['alerts']['command_options']    = %w(--watch-events --watch-checks --consul-dc=dc1)
default['consul']['alerts']['systemd_cookbook']   = 'consul'

default['consul']['retry']['version']             = '0.3.0'
default['consul']['retry']['download_url']        = "https://github.com/linyows/go-retry/releases/download/v#{default['consul']['retry']['version']}/linux_amd64.zip"
