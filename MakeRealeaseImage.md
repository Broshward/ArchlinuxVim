This approximate instruction for make final release image for simplest install.

1. dd from installed device to raw image file:
	# dd if=/dev/sdc of=ArchLinuxVIM-3.X.X.img bs=8M
2. Generate loop devices for image:
	# losetup -Pf ArchLinuxVIM-3.X.X.img
3. Mount first "boot" partition of image:
	# mount /dev/loop0p1 /mnt/boot/
4. Fill unused space to zeros:
	# dd if=/dev/zero of=/mnt/boot/0 bs=512
	# rm /mnt/boot/0
5. Check second partition (root) for errors before shrink filesystem:
	# e2fsck -f /dev/loop0p2
6. Resize root filesystem to minimal size (shrink):
	# resize2fs -M /dev/loop0p2
	resize2fs 1.46.5 (30-Dec-2021)
	Resizing the filesystem on /dev/loop0p2 to 706286 (4k) blocks.
	The filesystem on /dev/loop0p2 is now 706286 (4k) blocks long.
7. Resize root partition to filesystem size:
	# fdisk /dev/loop0
	d
	2
	n
	p
	2
	(default first sector)
	+(count of filesystem blocks from resize2fs out)*8
8. Truncate image file:
	truncate -s ((end of 2 partition sector (from fdisk))/2+1)k
9. Image compression
	#xz -9 
