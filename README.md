# ArchlinuxVim
This is ArchLinux distro for VIM SBC Platform from Khadas company.

At first I took Kernel from Ubutu for VIM3 SBC from KHADAS repository and I took Archlinux core Filesystem for ODROID-N2 Friendly ARM device.
So this project has started.
And I have to connect Ubuntu kernel images and Archlinux root system and it was bad solve, but it almost works. This scheme becomes basis of 3.00 version.

At present (3.01 version) already contains own Linux kernel which source compiled for Amlogic G12 platform.
And this also contains new source compiled for Amlogic platform u-boot loader which starts from built-in Khadas u-boot loader.
New u-boot still not only can launch new linux kernel, but have very simple little and convenient environment which can also loading your custom environment variables and launch your custom u-boot scripts before linux kernel runs.

For custom environment edit /boot/VIM3_environment file and for launch own u-boot script place one as /boot/VIM3_autoscript.

3.01 version for VIM3 device only.
Begin of version number of ArchLinuxVIM is target SBC device specific.
For example 1.xx versions for VIM1 SBC, 2.xx versions for VIM2 device and etc.
Now I happy have VIM3Pro SBC and I will made for this.

I̲N̲S̲T̲A̲L̲L̲

Launch archlinuxvim_install bash script for install Archlinux on your device. Try this for root user. For example:

$sudo ./archlinux_install /dev/mmcblk0
$sudo ./archlinux_install /dev/sdc


Also you can simply load image to your install parts:
# xzcat ArchLinuxVIM-X.XX.img.xz | dd of=/path/to/target/device

!!! After installation success you must remove linux-ODROID and uboot-ODROID packages and setting up linux-VIM3 and uboot-VIM3 correspondingly.!!!

W̲h̲a̲t̲ ̲i̲n̲s̲t̲a̲l̲l̲ ̲s̲c̲r̲i̲p̲t̲ ̲d̲o̲e̲s̲:̲

0. Download Archlinux tarball for ODROID-N2.
1. Delete MBR of your flash or HDD device.
2. Create 1-st part for /boot and 2-nd part for /root.
3. Formatting /boot partition to VFAT.
4. Formatting /root partition to ext4.
5. Mount /root and unpackage Archlinux tarball as rootfs.
6. Remove ODROID kernel modules
7. Extract kernel modules to /lib/modules.
8. Mount /boot and copy images and boot files to him.
8. Generate /etc/fstab and /boot/VIM3_environment bootargs to success launches.


T̲R̲O̲B̲L̲E̲S̲H̲O̲O̲T̲I̲N̲G̲:̲

1. Onboard WiFi not working :(
2. Onboard sound device not working :((
3. After resume from suspend to RAM (echo mem > /sys/power/state) system is very slow.
4. Sometimes when copy big data to USB device SBC VIM3 freezes with "Kernel panic, not syncing".

F̲u̲t̲u̲r̲e̲ ̲w̲o̲r̲k̲ ̲p̲l̲a̲n̲s̲:̲

1. ADD display and keyboard support in U-BOOT.
2. Rework Khadas u-boot environment for simplify accelerate loads and for replacing "fatload" commands by filesystem independed the "load" commands. It's pity but the KHADAS company thinks what first partition must be FAT32 :(



Probably you can made it better. Welcome! :)


