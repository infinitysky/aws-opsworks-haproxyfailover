service "monit" do
  supports :status => false, :restart => true, :reload => true
  action [:enable, :start]
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
