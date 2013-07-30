# Author:: Kuko Armas
# Cookbook Name:: modularit-kamailio
# Attribute:: default

##  Kamailio server name
default['kamailio']['server']['name'] = node.has_key?(:domain) ? "sip.#{domain}" : 'sip'
## Subject to include in cert for TLS
default['kamailio']['server']['ssl_req'] = '/C=US/ST=Several/L=Locality/O=Example/OU=Operations/' +
  "CN=#{node['kamailio']['server']['name']}/emailAddress=ops@#{node['kamailio']['server']['name']}"

## The following functionalities DO NOT require a database
# Debug
default['kamailio']['server']['defines']['WITH_DEBUG'] = false
# Enable NAT support
default['kamailio']['server']['defines']['WITH_NAT'] = false
# Enable PSTN GW support
default['kamailio']['server']['defines']['WITH_PSTN'] = false
default['kamailio']['server']['pstn_gw_ip'] = ""
default['kamailio']['server']['pstn_gw_port'] = ""
# Enable external Voice Mail support
default['kamailio']['server']['defines']['WITH_VOICEMAIL'] = false
default['kamailio']['server']['voicemail_gw_ip'] = ""
default['kamailio']['server']['voicemail_gw_port'] = ""
# Enable TLS support. TODO: define TLS parameters
default['kamailio']['server']['defines']['WITH_TLS'] = false
# Enable internal http server
default['kamailio']['server']['defines']['WITH_XHTTP'] = false

# TODO: document
default['kamailio']['server']['defines']['WITH_XMLRPC'] = false
default['kamailio']['server']['defines']['WITH_XHTTP_RPC'] = false
default['kamailio']['server']['defines']['WITH_XHTTP_PI'] = false
default['kamailio']['server']['defines']['WITH_ANTIFLOOD'] = false
default['kamailio']['server']['defines']['WITH_BLOCK3XX'] = false
# Advanced accounting
default['kamailio']['server']['defines']['WITH_ACCDB'] = false

## The following functionalities DO require a database, so you need to define your DB attributes

# Enable MySQL support setting db_engine to "mysql"
default['kamailio']['server']['db_engine'] = "mysql"
default['kamailio']['server']['db_host'] = "localhost"
default['kamailio']['server']['db_name'] = "kamailio"
default['kamailio']['server']['db_user'] = "kamailio"
default['kamailio']['server']['db_pass'] = "kamailiowr"

# If MySQL DB is not used, default to dbtext
unless default['kamailio']['server']['db_engine'] == "mysql"
  default['kamailio']['server']['db_path'] = "/var/lib/kamailio/db"
  default['kamailio']['server']['db_engine'] = "dbtext"
end

# Enable auth support
default['kamailio']['server']['defines']['WITH_AUTH'] = false
# Enable IP auth support
default['kamailio']['server']['defines']['WITH_IPAUTH'] = false
# Enable usrloc support
default['kamailio']['server']['defines']['WITH_USRLOCDB'] = false
# Enable presence support
default['kamailio']['server']['defines']['WITH_PRESENCE'] = false
# Enable aliasdb support
default['kamailio']['server']['defines']['WITH_ALIASDB'] = false
# Enable speeddial support
default['kamailio']['server']['defines']['WITH_SPEEDDIAL'] = false
# Enable multidomain support
default['kamailio']['server']['defines']['WITH_MULTIDOMAIN'] = false

## Build time attributes. You should not need to change them
default['kamailio']['server']['download_url'] = "http://www.kamailio.org/pub/kamailio/latest/src"
default['kamailio']['server']['version'] = "4.0.2"
default['kamailio']['server']['download_file'] = "kamailio-#{node['kamailio']['server']['version']}_src.tar.gz"

case node['platform_family']
when 'debian'
  default['kamailio']['build_deps'] = 'bison gcc make flex libxml2-devel mysql-devel postgresql-devel radiusclient-ng-devel expat-devel pcre-devel zlib-devel net-snmp-devel xmlrpc-c-devel unixODBC-devel sqlite-devel curl-devel libunistring-devel'
when 'rhel','fedora'
  default['kamailio']['build_deps'] = 'bison gcc make flex libxml2-devel mysql-devel postgresql-devel gnutls-devel radiusclient-ng-devel expat-devel pcre-devel zlib-devel net-snmp-devel xmlrpc-c-devel unixODBC-devel sqlite-devel curl-devel libunistring-devel'
else
  default['kamailio']['build_deps'] = 'bison gcc make flex libxml2-devel mysql-devel postgresql-devel radiusclient-ng-devel expat-devel pcre-devel zlib-devel net-snmp-devel xmlrpc-c-devel unixODBC-devel sqlite-devel curl-devel libunistring-devel'
end

