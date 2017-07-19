# Cookbook Name: consul
# Attribute: default

default['consul']['lib_path']                     = '/usr/lib/consul'

default['consul']['version']                      = '0.9.0'
default['consul']['data_dir']                     = '/tmp/consul'
default['consul']['command_options']              = ["-data-dir #{default['consul']['data_dir']}"]
default['consul']['conf_cookbook']                = 'consul'
default['consul']['systemd_cookbook']             = 'consul'
default['consul']['download_url']                 = "https://releases.hashicorp.com/consul/#{default['consul']['version']}/consul_#{default['consul']['version']}_linux_amd64.zip"
default['consul']['bin']                          = '/usr/bin'

default['consul']['dc']                           = 'dc1'
default['consul']['if']                           = 'enp0s8'
default['consul']['servers']                      = %w()
default['consul']['start_join']                   = false
default['consul']['domain']                       = 'consul'
default['consul']['log_level']                    = 'INFO'
default['consul']['bind_addr']                    = ''
default['consul']['advertise_addr']               = ''
default['consul']['client_addr']                  = '127.0.0.1'
default['consul']['multiple_private_ips']         = false

default['consul']['web_ui']['version']            = '0.9.0-rc1'
default['consul']['web_ui']['use']                = false
default['consul']['web_ui']['download_url']       = "https://releases.hashicorp.com/consul/#{default['consul']['web_ui']['version']}/consul_#{default['consul']['web_ui']['version']}_web_ui.zip"

default['consul']['template']['version']          = '0.19.0'
default['consul']['template']['download_url']     = "https://releases.hashicorp.com/consul-template/#{default['consul']['template']['version']}/consul-template_#{default['consul']['template']['version']}_linux_amd64.zip"
default['consul']['template']['command_options']  = []
default['consul']['template']['conf_cookbook']    = 'consul'
default['consul']['template']['systemd_cookbook'] = 'consul'
default['consul']['template']['tmpfiles_cookbook']= 'consul'
default['consul']['template']['pid']              = '/var/run/consul-template/pid'

default['consul']['alerts']['version']            = '0.5.0'
default['consul']['alerts']['download_url']       = "https://github.com/AcalephStorage/consul-alerts/releases/download/v#{default['consul']['alerts']['version']}/consul-alerts-#{default['consul']['alerts']['version']}-linux-amd64.tar"
default['consul']['alerts']['command_options']    = %w(--watch-events --watch-checks --consul-dc=dc1)
default['consul']['alerts']['systemd_cookbook']   = 'consul'

default['consul']['retry']['version']             = '0.3.1'
default['consul']['retry']['download_url']        = "https://github.com/linyows/go-retry/releases/download/v#{default['consul']['retry']['version']}/linux_amd64.zip"

case node['platform_family']
when 'rhel', 'fedora'
  default['consul']['sysconfig_dir']              = '/etc/sysconfig'
  default['consul']['systemd_unit_dir']           = '/usr/lib/systemd/system'
when 'debian'
  default['consul']['sysconfig_dir']              = '/etc/default'
  default['consul']['systemd_unit_dir']           = '/lib/systemd/system'
end

default['consul']['slack_notification']['incomming_webhook'] = ''
default['consul']['slack_notification']['channel'] = '#general'
