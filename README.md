# ArchlinuxVim
Archlinux distro for VIM SBC Platform of Khadas compile.

I took Kernel from Ubutu for VIM3 SBC of KHADAS repository https://dl.khadas.com/Firmware/VIM3/Ubuntu/SD_USB/VIM3_Ubuntu-server-focal_Linux-5.12_arm64_SD-USB_V1.0.5-210430.img.xz
I took Archlinux core Filesystem for ODROID-N2 Friendly ARM device  http://os.archlinuxarm.org/os/ArchLinuxARM-odroid-n2-latest.tar.gz 
And I have to connect Ubuntu kernel images and Archlinux and this seems almost working.

I am not liked this solve and Ubuntu kernel too and now I try to compile own Kernel image from sources but while my effort failure :) 
Last time when I had compile process of kernel sources  it was 2.6 version and since many varied))

Probably you can made it better. Welcome! :)

Begin of version number of ArchLinuxVIM is target SBC device specific.
For example 1.xx versions for VIM1 SBC, 2.xx versions for VIM2 device and etc.
Now I happy have VIM3Pro SBC and I will made for this.

While now I hav't HDMI devices for checking graphical working, I use VIM3 device throught ethernet ssh and debug console only.


The /boot must be separate FAT partiotion for compability with preinstalled in VIM devices U-boot loader and settings of one. 
It's pity but the KHADAS company thinks what first partition of flashes and SD memories can be FAT only and made default u-boot preferences are FAT-dependent.
Others filesystem parts you must copy to another partition with your favorite Linux filesystem or simply cloning git repo to it.

# mkfs.ext4 /dev/yourdevice2
# mount /dev/yourdevice2 /mnt/root/
# cp -a * /mnt/root/

or cloning to target device directly:
# git clone https://github.com/leha2001/ArchlinuxVim.git /mnt/root/


Unfortunately, but simply to copy "boot" partition is impossibe. Because one contains something for u-boot load process needed. Probably there placed U-BOOT himself.
Therefore make with fdisk first partition of device with size of 256 Mb.
And after copy in it boot.img image for working correctly.

# dd if=/mnt/root/boot.img of=/dev/yourdevice1 bs=8M


!!!! Have a more attention to rootdev variable at /boot/env.txt and right root device at /etc/fstab files when make hand copy and partitioning your device.


Also you can simply load image to your install parts with dd command:
# dd if=ArchLinuxVIM-X.XX.img of=/dev/yourdevice bs=8M
