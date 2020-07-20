# Coreboot / Grub (Arch)

## Partitioning

* Use GUID Partition Table (GPT) format, not MBR

* Choose `'Linux filesystem'` for `/boot` (8300), not the UEFI specific one (`ef00`)

* In `gdisk`, after creating the partitions, create the GPT partition:

    Command (? for help): x

    Expert command (? for help): l
    Enter the sector alignment value (1-65536, default = 2048): 1

    Expert command (? for help): m

* Next, create the GPT partition, using `ef02` as the partition type code:

    Command (? for help): n
    Partition number (1-128, default 1):
    First sector (34-976773134, default = 34) or {+-}size{KMGTP}:
    Last sector (34-976773134, default = 976773134) or {+-}size{KMGTP}: 2047
    Current type is 8300 (Linux filesystem)
    Hex code or GUID (L to show codes, Enter = 8300): ef02
    Changed type of partition to 'BIOS boot partition'

    Command (? for help):

* Use `ext4` for the /boot partition, not FAT32

* Unless `grub2` has finally released support for luks2 partitions, specify `luks1` when setting up encryption:

    root@archiso ~ # cryptsetup -y --type luks1 -v luksFormat /dev/nvme0n1p2

## Installing Grub instead of systemd-boot

* Install the grub package via `pacman -S grub`

* Install grub onto the disk:

    [root@archiso /]# grub-install --target=i386-pc /dev/nvme0n1
    Installing for i386-pc platform.
    Installation finished. No error reported.
    [root@archiso /]#

* Append the filesystem partition UUID to `/etc/default/grub`, not e.g. `/boot/loader/entries/arch.conf`

* To configure grub to decrypt the root filesystem, move the `UUID=00000001-0000-4000-8000-000000000000` line up to `GRUB_CMDLINE_LINUX` and edit it to look like this:

    GRUB_CMDLINE_LINUX="cryptdevice=UUID=00000001-0000-4000-8000-000000000000:cryptroot"
    GRUB_DEVICE="/dev/mapper/cryptroot"
    GRUB_DEVICE_UUID=""

* Generate configuration file: 

    [root@archiso /]# grub-mkconfig -o /boot/grub/grub.cfg
    Generating grub configuration file ...
    Found linux image: /boot/vmlinuz-linux
    Found initrd image: /boot/intel-ucode.img /boot/initramfs-linux.img
    Found fallback initrd image(s) in /boot: initramfs-linux-fallback.img
    done
    [root@archiso /]#

