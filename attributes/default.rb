#
# Cookbook Name:: serverdensity
# Attributes:: default
#
# Copyright 2012, Escape Studios
#
# Set this to the name of a data bag to override the node attributes
default['serverdensity']['data_bag'] = nil
# Set this to the id of an data bag item.
# If the data_bag is set, this defaults to the current host's FQDN with dots replaced with underscores
# The host foo.example.com thus has the item ID foo_example_com by default
default['serverdensity']['data_bag_item'] = nil

default['serverdensity']['user'] = "sd-agent"
default['serverdensity']['group'] = "sd-agent"

default['serverdensity']['config']['agent_key'] = "CHANGE_ME"
default['serverdensity']['config']['sd_url'] = "CHANGE_ME"
