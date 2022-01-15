echo "Starting S905 autoscript..."

setenv uboot_loadaddr 100000
for num in "0 1"; do if load mmc $num:1 $uboot_loadaddr u-boot.bin; then go $uboot_loadaddr; fi; done;
usb start 
for num in "0 1 2 3"; do if load usb $num:1 $uboot_loadaddr u-boot.bin; then go $uboot_loadaddr; fi; done;
