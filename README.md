#Serial to netcat VM - buildroot config
Checkout this repo, then `make serial_defconfig && make`

This will take somewhere between 20 minutes and an hour, depending on your PC and network speed.

When it's done there will be a bzImage in build/images. To turn it into something bootable, use `sudo make syslinux-bootable`. Sorry, I need sudo to use kpartx and parted.

