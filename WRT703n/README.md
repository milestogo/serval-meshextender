This is an attempt to cram everything into 4m of flash & simplify system setup. 
It will run without a usb stick, but will quickly fill up disk & create problems. 

Insert a USB stick, and it will re-partition & format it, then use it for rhizome. 
Partitions are compatible with the original mesh extender. 
    
Add the file $USBroot/serval/serval.sh and it will use that as the serval 
init script.  This is a good way to auto change the passwords, change configs, serval
versions & etc. 

Everything from firewall software to iwtools was cut out to make it smaller. 
 
To build your own. 
Start with the attitude adjuster trunk of openwrt. copy the  .config file, files.conf, serval directory and files 
directory into /openwrt. Make V=99

The Mr3020 binaries are not tested. 

