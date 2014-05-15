cfg_archive
===========

This tool provides a method to connect to hosts and execute various commands which will be archived in the database.  This module provides similar functionality to the excellent http://www.shrubbery.net/rancid/ tool.  The basic concepts and practices of the two tools differ slightly but I believe this tool to have a few advantages (IMHO of course).  This tool currently only supports Cisco, Cisco ASA, Juniper Netscreen, Motorola WiNG Wireless Managers (also sold by Extreme Networks, Brocade, and Symbol), and Extreme Networks switching devices.

The two default commands that are archived on a Cisco device are a `show startup` and `show version` commands.  This gives enough information to do configuration restoration and configuration differences.  The output of each of these commands is timestamped and an md5 sum is calculated.  There are several ways to update the archive such as via snmp config traps which will update each time the configuration of the device changes, or simply via a scheduled cron update.


Requirements
============
  * Working ONA core system
  * `dcm.pl` ONA commandline tool. [Download here](https://github.com/opennetadmin/dcm)
  * `getpw` for password lookups. [Download here](https://github.com/opennetadmin/getpw)
  * `sendEmail` for notification messages. [Download here](http://caspian.dotconf.net/menu/Software/SendEmail/) or use the package from your distribution.

Install
=======
  * If you have not already, run the following command `echo '/opt/ona' > /etc/onabase`.  This assumes you installed ONA into /opt/ona
  * Download the archive and place it in your $ONABASE/www/local/plugins directory, the directory must be named `cfg_archive`
  * Make the plugin directory owned by your webserver user I.E.: `chown -R www-data /opt/ona/www/local/plugins/cfg_archive`
  * From within the GUI, click _Plugins->Manage Plugins_ while logged in as an admin user
  * Click the install icon for the plugin which should be listed by the plugin name 
  * Follow any instructions it prompts you with.
  * You must then run the initialization scrpt `/opt/ona/www/local/plugins/cfg_archive/configure.sh`



Configuration
=============

/opt/ona/etc/cfg_archive.conf
=============================
You can make configuration changes to the `/opt/ona/etc/cfg_archive.conf` file to enable cfg_archive for your environment.  The following is an example file.  It is self documented for each item: 

Manipulating output
===================
Sometimes the need arises to remove portions of the output from a device that will always change each time it is updated.  Things like NTP clock information, byte sizes etc all need to be removed from the output or it will ALWAYS show as an update.  There are several options available that allow you to have full control over what is or isnt removed from the output.

Located in /opt/ona/etc/cfg_archive.XXXX.sed are the specific files that control this behavior.

<table>
<tr>
<th>Name</th><th>Description</th>
</tr>
<tr><td>cfg_archive.GLOBAL.sed</td><td>These sed commands will apply to ALL output, there are some required entries based on how cfg_archive is built that should not be removed.  There are other things like uptime etc that are recommended to be removed each time.</td></tr>
<tr><td>cfg_archive.PASSWORD.sed</td><td>These sed commands will apply to ALL output. They are intended to hide passwords so that they are not stored in the database for potential mis-use later.  It will replace the password with [HIDDEN] and then comment out the entire line with a ! comment character.  You can add or remove types of passwords to be hidden by this file.  If you do not want to hide any passwords, simply remove or rename this file.</td></tr>
<tr><td>cfg_archive.<configtype>.sed</td><td>These files apply only to the configuration type that is being backed up.  For instance, there will be different items to remove from a show startup command than there would from a show version command.  The <configtype> portion of this file name should be replaced with the exact name of the configuration type from the GUI.  For instance `IOS_CONFIG` is the default used for the show startup output.  It would apply to only archives ran for that type and would be ran after the GLOBAL and PASSWORD phases.</td></tr>
</table>


Device passwords
================
Don't forget to define your devices and passwords in the `getpw` configuration file.  Cisco_archive relies on `getpw` to determine the passwords it will use to connect to the devices.  Please read the `getpw` page for further details on setting your passwords.  The type that will be used in getpw will be the value you set for "USERNAME" in the cfg_archive.conf file.

Usage
=====
  * cfg_archive -h <hostname|IP> | -f <filename>




