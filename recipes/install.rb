case node["platform_family"]
when "debian"
  # Compatibility with https://github.com/akatz/chef-serverdensity
  apt_repository "sd-agent" do
    action :remove
  end

	apt_repository "serverdensity" do
    uri "http://www.serverdensity.com/downloads/linux/deb"
    distribution "all"
    components ["main"]
    key "boxedice-public.key" # use the cookbook file
	end
when "rhel", "fedora"
  yum_key "RPM-GPG-KEY-serverdensity" do
    url "https://www.serverdensity.com/downloads/boxedice-public.key"
    action :add
  end

  yum_repository "serverdensity" do
    description "Server Density"
    url "http://www.serverdensity.com/downloads/linux/redhat/"
    key "RPM-GPG-KEY-serverdensity"
    action :add
  end
end

package "sd-agent" do
  action :install
end
