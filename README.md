#OTRS 4 on Docker
============

A DOCKERFILE to setup an OTRS 4 Instance using CentOS 6 as base Image.

This OTRS Version is the regular, non ITSM Version.

##Access
This System uses two exposed ports 80 (HTTPD) / 22 (SSHD). SSH is necessary to change some the config files (Config.pm), add ldap stuff and so on. If you use the defaults you can disable port 22.

The root user is "root", so is the password.
**Please change this values in production!**

You can access the OTRS using the link: 

* http://DOCKERHOST:PORT/otrs/index.pl (Agent Interface)
* http://DOCKERHOST:PORT/otrs/customer.pl (Customer Interface)

The OTRS root user is "root@localhost", so is the password.
**Please change this values in production!**

Replace DOCKERHOST with the IP / Hostname of your Docker Server.

##Note

This instance uses mod_perl. We needed to modify the Apache config (/etc/httpd/conf.d/zzz_otrs.conf). The default configuration checks for mod_perl.c, which does not comply to CentOS which need mod_perl.so.

Look at L:18 of the DOCKERFILE for more details.

##System Design

This DOCKERFILE add's: 
* MySQL
* Apache
* Perl
* All needed dependencies
* OTRS 4.0.2 (RPM)

