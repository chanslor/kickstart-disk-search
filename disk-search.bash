#!/bin/bash

#------------------------
# Joint $1 and $4
# to tell which $1 is larger that what......

# sda
# 256.2G
# sdb
# 111.8G
# sdc
# 931.5G
# sdd
# 931.5G

# mdcws2(mdchansl):/mdchansl/scripts $ parted -s /dev/sda print 
# Model: ATA Crucial_CT275MX3 (scsi)
# Disk /dev/sda: 275GB
# Sector size (logical/physical): 512B/512B
# Partition Table: msdos
# Disk Flags: 
# 
# Number  Start   End    Size   Type     File system  Flags
#  1      1049kB  538MB  537MB  primary  ext4         boot
#  2      538MB   275GB  275GB  primary               lvm
# 
# mdcws2(mdchansl):/mdchansl/scripts $ vim ./var-search-string.bash
# mdcws2(mdchansl):/mdchansl/scripts $ parted -s /dev/sdb print 
# Model: ATA KINGSTON SV300S3 (scsi)
# Disk /dev/sdb: 120GB
# Sector size (logical/physical): 512B/512B
# Partition Table: msdos
# Disk Flags: 
# 
# Number  Start   End    Size   Type     File system  Flags
#  1      1049kB  538MB  537MB  primary  ext4         boot
#  2      538MB   120GB  119GB  primary               lvm


#------------------------
# Count the number of disk

LIST_DISKS=$(lsblk | egrep "^sd" | awk ' { print $1 " " $4 } ')

COUNTER=0
for disk in $LIST_DISKS
do
let COUNTER=COUNTER+1
echo $disk

done

if [ $COUNTER = 0 ] ; then
	echo "Disk count is Zero, something is wrong"
	exit 0
else
	echo "We have $COUNTER hard drives in this system." 
	
fi

echo
#----------------------------
# What are the sizes of disks
LIST_DISK_SIZE=$(lsblk | egrep "^sd" | awk ' { print $4 } ')

for size in $LIST_DISK_SIZE
do
	#sed for M
	if [[ $size == *"G"* ]]; then
	echo "This disk is in GB's"

	BARE_SIZE=${size//G}

	#printf '%d\n' $BARE_SIZE  2>/dev/null

	RAW_SIZE=$(printf '%d\n' $BARE_SIZE  2>/dev/null)
	if (($RAW_SIZE > 200 )); then
	echo "Disk is greater than 200G's"
	else
	echo "Disk is smaller that 200G's"
	fi

	fi

#echo "Real size $size"
#echo "RAW size $BARE_SIZE"
done

#DISK_TYPE=$(parted -s /dev/sda print | grep Model | awk ' { print $2 } ')
#echo "DISK_TYPE $DISK_TYPE"

