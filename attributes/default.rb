#
# Author:: Kuko Armas
# Cookbook Name:: modularit-kamailio
# Attribute:: default
#
# Copyright 2013, CanaryTek
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['kamailio']['server']['download_url'] = "http://www.kamailio.org/pub/kamailio/latest/src"
default['kamailio']['server']['version'] = "4.0.2"
default['kamailio']['server']['download_file'] = "kamailio-#{node['kamailio']['server']['version']}_src.tar.gz"

case node['platform_family']
when 'debian'
  default['kamailio']['build_deps'] = 'bison gcc make flex libxml2-devel mysql-devel postgresql-devel radiusclient-ng-devel expat-devel pcre-devel zlib-devel net-snmp-devel xmlrpc-c-devel unixODBC-devel sqlite-devel curl-devel libunistring-devel'
when 'rhel','fedora'
  default['kamailio']['build_deps'] = 'bison gcc make flex libxml2-devel mysql-devel postgresql-devel radiusclient-ng-devel expat-devel pcre-devel zlib-devel net-snmp-devel xmlrpc-c-devel unixODBC-devel sqlite-devel curl-devel libunistring-devel'
else
  default['kamailio']['build_deps'] = 'bison gcc make flex libxml2-devel mysql-devel postgresql-devel radiusclient-ng-devel expat-devel pcre-devel zlib-devel net-snmp-devel xmlrpc-c-devel unixODBC-devel sqlite-devel curl-devel libunistring-devel'
end

