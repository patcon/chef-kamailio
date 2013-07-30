Cookbook: modularit-kamailio
==========================

A Chef cookbook to install and configure kamailio servers

This cookbook was inspired in the **Edvina/Avanzada7 SIP Master class** final lab, in Malaga July 2013. Sorry Oej, I cheated. I'm using kamailio advanced config file as template! ;-)

Since the RPMS in EPEL are outdated, this cookbook downloads and builds kamailio from sources

By default, this cookbook configures Kamailio with all functionality (proxy, registrar, etc).

This cookbook includes configuration to route all PSTN calls to a PSTN Gateway. Calls are routed to the PSTN Gateway if the called address starts with **+** or **00** and contains at least 3 more digits.

It also can use an external Voice Mail system for addresses that don't answer or are not registered.

These two functions can be easily implemented using the **modularit-asterisk** cookbook

Requirements
------------

A base CentOS 6 server

If you want to use all functionality, you will need to create a MySQL database for Kamailio

Attributes
----------

There are a lot of attributes. Please read the attribute file, it's extensively documented

Usage
-----

After installing the cookbook on a server you will need to initialize the Kamailio database, you need to be able to create databases with the user that runs this command.

    kamdbctl create

The previous command connects to the configured database server user "root", if you need to connect using a different user, change **DBROOTUSER** parameter in kamctlrc file

After creating the database, you need to restart Kamailio

    service kamailio restart

Next, you need to enter the domains that this proxy is going to service:

    kamctl domain add mydomain.com

And last thing, you need to create your users:

    kamctl add me@mydomain.com my_password

**WARNING!!!!**: You should **always** use secure passwords for your users, specially if you use a PSTN Gateway, because any compromised user means a potentially huge phone bill!!!

Once you have your server running, if you wan't to manage your configs by yourself insted of using Chef, you can set the following attribute un the kamailio server's chef node:

    node['kamailio']['server']['manage_configs']=false

Contributing
------------

e.g.

  1. Fork the repository on Github
  2. Create a named feature branch (like `add_component_x`)
  3. Write you change
  4. Write tests for your change (if applicable)
  5. Run the tests, ensuring they all pass
  6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Kuko Armas <kuko@canarytek.com>
