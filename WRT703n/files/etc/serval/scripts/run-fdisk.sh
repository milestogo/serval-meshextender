#!/bin/sh

for i in 1 2 3 4; do
   umount /dev/sda$i
done

sleep 1

dd if=/dev/zero of=/dev/sda bs=512 count=1
fdisk /dev/sda <<EOF
n
p
1

+1G
n
p
2

+1G
n
p
3


t
1
b
w
EOF

echo "Finished fdisk, resetting disk"
# make sure new partitions are visible on openwrt
usbreset 001/001
sleep 3
echo "formatting partitions..."

mkfs.vfat /dev/sda1

if [ ! -b /dev/sda2 ]; then
        mknod /dev/sda2 b 8 2
fi
mkfs.ext4 /dev/sda2

if [ ! -b /dev/sda3 ]; then
        mknod /dev/sda3 b 8 3
fi
mkfs.ext4 /dev/sda3

echo "done w format"
mount /dev/sda1 /dos
for i in 2 3 ; do
   mount /dev/sda$i
done

mkdir -p /dos/serval
cp /etc/serval/scripts/readme.txt /dos/serval/

#mkdir -p /dos/webroot
#cd /dos/webroot && wget http://developer.servalproject.org/files/unstable/Serval_Mesh-0.92-pre2-6-g37d8f92.apk

