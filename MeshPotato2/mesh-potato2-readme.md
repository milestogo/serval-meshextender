This is a build for running serval on the Mesh Potato2. 

This is built from the projects version of mesh-extender for the TPlink3020
Because the MP2 has so much more flash, everything is built in. Config files too. 
Changes include
- eth0 is 192.168.1.20
- serial console left enabled - you'll have to use USB for WAN
- config files are in sysupgrade image . See build instructions below. 
- useful scripts like disk formatting  are in /etc/serval/scripts  
- uses fstab for USB mounting -  if no USB the
	 local filesstem will be used.  ok for 16M of flash. 
- firewall ruleset to make it less dangerous to plug into wan
   - firewall almost certainly breaks something important. 
- /www/serval symlinks to /dos/webroot aka /dev/sda1. 
  - put the most recent android apk there for bootstrapping. 
- servald is compiled using 3758b038abea00af385fc44ad50156ff7a3daa8a
	- remember to update the makefile with the latest checkout. 
- kludges for run-fdisk.sh to work better on openwrt.

Todos:
- there is a kernel bug that causes 11n to throw out TX errors ( phy0 0x004)
	Dropping to 11g seems to solve this. Voice is largely unusable. 
- test & fix firewalls
- /etc/init.d/fix-ip is a kludge - steal something better from commotion. 
- switch to commotion network standard of public ip range  based on MAC
- add ipv6 back in. 
- clean up the extra terminal definitions  manually added to /files
- All packages built in, perhaps serval shouldn't be. 


To build your own copy from sourck. 
-follow the dragino2 build instructions at. 
	https://github.com/dragino/dragino2
- cd ms14  / your openwrt root
- untar the confiles.tgz. This provides 
	- my openwrt .config
	- local openwrt config files in ./files
	- serval feed
- edit feeds.conf to point servalfeed to the right place
- then ./scripts/feeds update && ./scripts/feeds/install servald
- ./scripts/feeds install bridge-utils,mkdosfs,dosfsck, minicom, socat & anything else you want in the .config
- make V=99  
- copy sysupgrade.bin to a FAT usb stick to install onto the Mesh potato 
- after the machine first boots, reboot it and the IP addresses will be correct. 
- stick in a usb stick and run /etc/serval/scripts/run-fdisk.sh to format
- transfer the formatted USB stick to an internet connected host and put fresh android apk in dos/webroot 
