# opsworks-haproxyfailover cookbook

Cookbook to install and configure HAProxy failover on AWS OpsWorks, based on the excellent article:

http://hipsterdevblog.com/blog/2015/01/23/automated-haproxy-failover-on-opsworks/

# Requirements

Supports Amazon linux on AWS OpsWorks with Chef 11.4 or 11.10.

As you have a haproxy layer already, you can use the haproxyfailover script to just extend/change the failover stuff.

# Usage

Include the default recipe during setup and the configure recipe in the configure event.

# Attributes

* `node[:haproxy][:backends]` - Hash of OpsWorks layer instances that you want for HAProxy backends. Defaults to instances in layers that include 'app' in the name.
* `node[:haproxy][:backend_port]` - Port used for HTTP backend servers. Default: 81
* `node[:haproxy][:backend_ssl_port]` - Port used for SSL backend servers. Default: 444
* `node[:haproxy][:check_port]` - Port used for health check. Default: 81
* `node[:haproxy][:check_interval]` - Interval of health checks. Default: '5s'
* `node[:haproxy][:fast_check_interval]` - Fast interval of health checks. Default: '1s'
* `node[:haproxy][:server_fall]` - Number of failed checks before server is removed from pool. Default: 1
* `node[:haproxy][:custom_config][:global]` - Hash of name value pairs to set in HAProxy global section.
* `node[:haproxy][:custom_config][:defaults]` - Hash of name value pairs to set in HAProxy defaults section.
* `node[:haproxy][:custom_config][:backend]` - Hash of name value pairs to set in HAProxy backend section.
* `node[:haproxy][:custom_config][:backend_ssl]` - Hash of name value pairs to set in HAProxy backend SSL section.
* `node[:haproxy][:custom_config][:frontend]` - Hash of name value pairs to set in HAProxy frontend section.
* `node[:haproxy][:custom_config][:frontend_ssl]` - Hash of name value pairs to set in HAProxy frontend SSL section.

# Recipes

* `setup` - install and create the failover with monit notifications


# Author

* Author: Mark Altmann (<mark.altmann@moovel.com>)
