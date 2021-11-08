# ArchlinuxVim
Archlinux distro for VIM SBC Platform with Amlogic processors of Khadas company compile.

I took Kernel from Ubutu for VIM3 SBC from KHADAS repository:  https://dl.khadas.com/Firmware/VIM3/Ubuntu/SD_USB/VIM3_Ubuntu-server-focal_Linux-5.12_arm64_SD-USB_V1.0.5-210430.img.xz
I took Archlinux core Filesystem for ODROID-N2 Friendly ARM device:  http://os.archlinuxarm.org/os/ArchLinuxARM-odroid-n2-latest.tar.gz 
And I have to connect Ubuntu kernel images and Archlinux root system and this seems almost working.

I am not liked this solve and Ubuntu kernel not gladden for me too and now I try to compile own Kernel image from sources but while my effort failure :) 
Last time when I had compile process of kernel sources  it was 2.6 version and since many varied))

Probably you can made it better. Welcome! :)

Begin of version number of ArchLinuxVIM is target SBC device specific.
For example 1.xx versions for VIM1 SBC, 2.xx versions for VIM2 device and etc.
Now I happy have VIM3Pro SBC and I will made for this.

While now I hav't HDMI devices for checking graphical working, I use VIM3 device throught ethernet ssh and debug console only.
Wlan networking divices not working too. It is bad :(

The /boot must be separate FAT partiotion for compability with preinstalled in VIM devices U-boot loader and settings of one. 
It's pity but the KHADAS company thinks what first partition of flashes and SD memories can be FAT only and made default u-boot preferences are FAT-dependent.
Unfortunately, also simply to copy Linux Kernel and ramfs to "boot" is impossibe. Because /boot of KHADAS contains something for u-boot load process needed. Probably there placed U-BOOT himself or his part.


You can simply load image to your install parts:
# xzcat ArchLinuxVIM-X.XX.img.xz | dd of=/path/to/target/device

Download the ArchLinuxVIM.img.xz image with unlimited bandwidth from filehosting.org you may here:
https://www.filehosting.org/file/details/967870/0tN0jPeGJbFYpiHo/ArchLinuxVIM-3.00.img.xz
or try do this with wget command:
# wget -c https://download.www21.filehosting.org/b11ce55ee8b60550751cceda22072ae7/ArchLinuxVIM-3.00.img.xz


Also you can launch archlinuxvim_install automatic script for install ArchLinuxVim on your flash drive.
But do this at your own peril and risk :))
For example it works right on my x68_64 ArchLinux working station and ny USB-flash drive.

Try do this from root user:
# ./archlinuxvim_install /dev/sdb 
$ sudo ./archlinuxvim_install /dev/mmcblk0

Probably you be needed points shell directly:
# bash ./archlinuxvim_install /dev/sdb

What install script do:
0. Download Archlinux tarball for ODROID-N2
1. Delete MBR with table of partitions
2. Create 1-st part for boot and 2-nd part for root.
3. Copy the boot image to 1-st part
4. Make ext4 on 2-nd part
5. Mount 2-nd part as root
6. Unpackage Archlinux to rootfs
7. Remove /boot/*
8. Remove ODROID kernel modules
7. Unpackage Ubuntu kernel modules to /lib/modules/
8. Generate /etc/fstab and /boot/env.txt to success launches.

