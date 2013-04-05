#
# Cookbook Name:: serverdensity
# Recipe:: server-monitor
#
# Copyright 2012, Escape Studios
#

if node["serverdensity"]["data_bag"]
	item = node["serverdensity"]["data_bag_item"] || node["fqdn"].gsub(/\./, "_")
	sd_vars = data_bag_item(node["serverdensity"]["data_bag"], item).to_hash.reject{|k, v| k == "id"}
else
	sd_vars = node["serverdensity"]["config"].to_hash
end

# configure your Server Density agent key
template "/etc/sd-agent/config.cfg" do
	source "config.cfg.erb"
	owner "root"
	group node["serverdensity"]["group"]
	mode "0640"
	variables(
		:sd_vars => sd_vars
	)
	notifies :restart, "service[sd-agent]"
end

service "sd-agent" do
  supports :start => true, :stop => true, :restart => true
	action [:enable, :start] #starts the service if it's not running and enables it to start at system boot time
end
