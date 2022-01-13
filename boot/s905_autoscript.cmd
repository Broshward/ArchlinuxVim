echo "Starting S905 autoscript..."

setenv kernel_loadaddr	"0x11000000"
setenv dtb_loadaddr 	"0x1000000"
setenv dtbo_loadaddr 	"0x5000000"
setenv initrd_loadaddr 	"0x13000000"
setenv env_loadaddr 	"0x20000000"
setenv uboot_loadaddr	"0x100000"

printenv kernel_loadaddr
printenv initrd_loadaddr 
printenv dtb_loadaddr
printenv uboot_loadaddr

if load mmc 0:1 $uboot_loadaddr u-boot.bin; then go $uboot_loadaddr; fi;
usb start
if load usb 0:1 $uboot_loadaddr u-boot.bin; then go $uboot_loadaddr; fi;
if load usb 1:1 $uboot_loadaddr u-boot.bin; then go $uboot_loadaddr; fi;
if load usb 2:1 $uboot_loadaddr u-boot.bin; then go $uboot_loadaddr; fi;

