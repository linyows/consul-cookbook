name             'consul'
maintainer       'linyows'
maintainer_email 'linyows@gmail.com'
license          'MIT'
description      'Installs/Configures consul'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.7.0'

recipe 'consul', 'Installs and configures consul'
recipe 'consul::template', 'Installs and configures consul-template'
recipe 'consul::alerts', 'Installs and configures consul-alerts'
recipe 'consul::retry', 'Installs retry script for check'

%w(centos redhat).each { |os| supports os }
