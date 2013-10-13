This is a build for running serval on the Mesh Potato2. 

It largely duplicates the mesh extender for the TPlink3020

Changes include
- eth0 is 192.168.1.20
- serial console left enabled - you'll have to use USB for WAN
- config files are in sysupgrade image . See build instructions below. 
- useful scripts like disk formatting  are in /etc/serval/scripts  
- uses fstab for USB mounting -  if no USB the
	 local filesstem will be used.  ok for 16M of flash. 
- firewall ruleset to make it less dangerous to plug into wan
   - firewall almost certainly breaks something important. 
- /www/serval symlinks to /dos/webroot aka /dev/sda1. put android apks here. 
  - put the most recent android apk there for bootstrapping. 
- All packages built in, perhaps serval shouldn't be. 
- servald is compiled using 3758b038abea00af385fc44ad50156ff7a3daa8a
	- remember to update the makefile with the latest checkout. 
- kludges for run-fdisk.sh to work better on openwrt.

Todos:
- there is a kernel bug that causes 11n to throw out phy0 0x004 errors. 
	Dropping to 11g seems to solve this. need to find better kernel. 
- test & fix firewalls
- /etc/init.d/fix-ip is a kludge - steal something better from commotion. 
- socat demonstration
- switch to commotion network standard of mac address based public nets.
- add ipv6 back in. 
- clean up the extra terminal definitions  manually added to /files

To build your own copy from sourck. 
-follow the dragino2 build instructions at. 
	https://github.com/dragino/dragino2
- cd ms14 & untar the conffiles.tgz. This provides 
	- my openwrt .config
	- local config files in ./files
	- local serval config
	- serval feed
- edit feeds.conf to point to your build path
- then ./scripts/feeds update && ./scripts/feeds/install servald
- install bridge-utils,mkdosfs,dosfsck, minicom, socat & anything else you want in the .config
- make V=99  
- use dos usb stick to install onto the Mesh potato 
- after the machine first boots, reboot it and the IP addresses will be correct. 
- stick in a usb stick and run /etc/serval/scripts/run-fdisk.sh to format
	transfer stick to internet connected host and put lates developer apk in dos/webroot

