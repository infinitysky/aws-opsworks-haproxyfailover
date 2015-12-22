include_recipe 'haproxyfailover::service'

template '/etc/haproxy/haproxy.cfg' do
  source 'haproxy.cfg.erb'
  owner 'root'
  group 'root'
  mode 0644
  notifies :reload, 'service[haproxy]'
end

execute "echo 'checking if HAProxy is not running - if so start it'" do
  not_if 'pgrep haproxy'
  notifies :start, 'service[haproxy]'
end

template '/etc/failtome.sh' do
  source 'failtome.sh.erb'
  owner 'root'
  group 'root'
  mode 0755
end

template '/etc/monit.d/haproxywatch.monitrc' do
  source 'haproxywatch.monitrc.erb'
  owner 'root'
  group 'root'
  mode 0440
  notifies :reload, "service[monit]", :immediately
end
