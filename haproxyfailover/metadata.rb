name             'haproxy'
maintainer       'moovel'
maintainer_email 'mark.altmann@moovel.com'
license          'MIT'
description      'Installs/Configures opsworks-haproxy with failover'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'amazon'
depends 'haproxy'
