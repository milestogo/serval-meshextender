#!/bin/sh
for i in 1 2 3 4; do
   umount /dev/sda$i
done

fdisk /dev/sda <<EOF
d
1
d
2
d
3
d
4
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

if [ ! -f /dev/sda2 ]; then
        mknod /dev/sda2 b 8 2
fi
mkfs.ext4 /dev/sda2

if [ ! -f /dev/sda3 ]; then
        mknod /dev/sda3 b 8 3
fi
mkfs.ext4 /dev/sda3

echo "done formatting, creating files"
mount /dev/sda1 /dos
mkdir -p /dos/webroot


#cd /dos/webroot && wget http://developer.servalproject.org/files/unstable/Serval_Mesh-0.92-pre2-6-g37d8f92.apk

