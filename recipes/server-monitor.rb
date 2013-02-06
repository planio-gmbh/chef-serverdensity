#
# Cookbook Name:: serverdensity
# Recipe:: server-monitor
#
# Copyright 2012, Escape Studios
#

if node["serverdensity"]["data_bag"]
	item = node["serverdensity"]["data_bag_item"] || node["fqdn"].gsub(/\./, "_")
	sd_vars = data_bag_item(node["serverdensity"]["data_bag"], item)
else
	sd_vars = node["serverdensity"]
end

# configure your Server Density agent key
template "/etc/sd-agent/config.cfg" do
	source "config.cfg.erb"
	owner "root"
	group "root"
	mode "640"
	variables(
		:sd_url => sd_vars["sd_url"],
		:agent_key => sd_vars["agent_key"]
	)
	notifies :restart, "service[sd-agent]"
end

service "sd-agent" do
  supports :start => true, :stop => true, :restart => true
	action [:enable, :start] #starts the service if it's not running and enables it to start at system boot time
end
