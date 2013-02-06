maintainer       "Avrohom Katz"
maintainer_email "iambpentameter@gmail.com"
license          "MIT"
description      "Installs/Configures Server Density"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

%w[ubuntu debian centos redhat fedora].each do |distro|
  supports distro
end

depends "apt"
depends "yum"
