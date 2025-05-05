# Quick Emulator (QEMU)

Free and open-source emulator that performs hardware virtualization.
Raspberry Pi でも利用可能。

## Install

```bash
# install
sudo apt-get update
sudo apt-get install qemu-system

# version
qemu-system-arm --version
QEMU emulator version 8.2.2 (Debian 1:8.2.2+ds-0ubuntu1.6)
Copyright (c) 2003-2023 Fabrice Bellard and the QEMU Project developers
```

対応しているマシンタイプンの確認
```
qemu-system-aarch64 -machine help
```

## Raspberry Pi 4 のエミュレーション

imageの準備

```bash
# Raspberry Pi 4 のイメージをダウンロード
wget https://downloads.raspberrypi.com/raspios_arm64/images/raspios_arm64-2024-11-19/2024-11-19-raspios-bookworm-arm64.img.xz

# 解凍
unxz 2024-11-19-raspios-bookworm-arm64.img.xz

# イメージの確認
ls -lh 2024-11-19-raspios-bookworm-arm64.img 
-rw-r--r-- 1 user01 user01 5.6G Nov 19 23:26 2024-11-19-raspios-bookworm-arm64.img
```

## mount img

mount して中身を確認。
変更したら変更も反映される。

```bash
fdisk -l 2024-11-19-raspios-bookworm-arm64.img

sudo mount -o loop,offset=$((8192 * 512)) 2024-11-19-raspios-bookworm-arm64.img /mnt/rpi
```

```bash
# mount
sudo mkdir /mnt/rpi
sudo mount -o loop 2024-11-19-raspios-bookworm-arm64.img /mnt/rpi
ls /mnt/rpi/
LICENCE.broadcom           bcm2712-rpi-cm5l-cm4io.dtb  initramfs_2712
bcm2710-rpi-2-b.dtb        bcm2712-rpi-cm5l-cm5io.dtb  issue.txt
bcm2710-rpi-3-b-plus.dtb   bcm2712d0-rpi-5-b.dtb       kernel8.img
bcm2710-rpi-3-b.dtb        bootcode.bin                kernel_2712.img
bcm2710-rpi-cm3.dtb        cmdline.txt                 overlays
bcm2710-rpi-zero-2-w.dtb   config.txt                  start.elf
bcm2710-rpi-zero-2.dtb     fixup.dat                   start4.elf
bcm2711-rpi-4-b.dtb        fixup4.dat                  start4cd.elf
bcm2711-rpi-400.dtb        fixup4cd.dat                start4db.elf
bcm2711-rpi-cm4-io.dtb     fixup4db.dat                start4x.elf
bcm2711-rpi-cm4.dtb        fixup4x.dat                 start_cd.elf
bcm2711-rpi-cm4s.dtb       fixup_cd.dat                start_db.elf
bcm2712-rpi-5-b.dtb        fixup_db.dat                start_x.elf
bcm2712-rpi-cm5-cm4io.dtb  fixup_x.dat
bcm2712-rpi-cm5-cm5io.dtb  initramfs8
```

## QEMU の起動

```bash
# imageのサイズ変更 ()
qemu-img resize -f raw 2024-11-19-raspios-bookworm-arm64.img 8G
```

```bash
# QEMU の起動
qemu-system-aarch64 \
    -M virt \
    -m 1024 \
    -kernel kernel8.img \
    -dtb bcm2710-rpi-3-b.dtb \
    -drive file=2024-11-19-raspios-bookworm-arm64.img,format=raw,if=sd \
    -append "console=ttyAMA0 root=/dev/mmcblk0p2 rw rootfstype=ext4 fsck.repair=yes rootwait" \
    -serial mon:stdio \
    -display none  

```



console=ttyAMA0 root=/dev/mmcblk0p2 rw rootfstype=ext4 fsck.repair=yes rootwait
