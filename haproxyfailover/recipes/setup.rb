include_recipe 'haproxyfailover::service'

service 'haproxy' do
  action [:enable, :start]
end

service 'monit' do
  action [:enable, :start]
end

include_recipe 'haproxyfailover::configure' # Includes also monit for failover
# Seems not to be needed, as after the setup, the configure happens anyway...
