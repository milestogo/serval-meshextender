 NOT DELETE THIS FILE

If the file is deleted, the boot scripts will
think the drive is corrupted & reformat.

To change serval's boot behavior,
create a file serval.sh in this serval directory.
The serval will run this script
instead of the normal serval boot.

Things you might want to do include copying
files from the dos partition to /dev/sda2,
or running an alternate serval config file.

Yes, this is a security problem



