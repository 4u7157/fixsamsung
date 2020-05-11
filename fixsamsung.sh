#!/bin/bash
# permission change to match kernel_common
sudo chmod -x net/bluetooth/hci_event.c
sudo chmod +x arch/arm/Makefile
sudo chmod +x drivers/staging/android/ion/ion_carveout_heap.c
sudo chmod +x scripts/bootgraph.pl
sudo chmod +x scripts/export_report.pl
sudo chmod +x scripts/gcc-goto.sh
sudo chmod +x scripts/gcc-version.sh
sudo chmod +x scripts/gcc-x86_32-has-stack-protector.sh
sudo chmod +x scripts/gcc-x86_64-has-stack-protector.sh
sudo chmod +x scripts/gen_initramfs_list.sh
sudo chmod +x scripts/headers_check.pl
sudo chmod +x scripts/headers_install.sh
sudo chmod +x scripts/kconfig/lxdialog/check-lxdialog.sh
sudo chmod +x scripts/kconfig/streamline_config.pl
sudo chmod +x scripts/link-vmlinux.sh
sudo chmod +x scripts/markup_oops.pl
sudo chmod +x scripts/mkmakefile
sudo chmod +x scripts/mksysmap
sudo chmod +x scripts/package/builddeb
sudo chmod +x scripts/package/buildtar
sudo chmod +x scripts/profile2linkerlist.pl
sudo chmod +x scripts/rt-tester/rt-tester.py
sudo chmod +x scripts/selinux/install_policy.sh
sudo chmod +x scripts/tracing/draw_functrace.py
sudo chmod +x scripts/xz_wrap.sh

# Use real sdcardfs path instead of symlink
mv fs/sdcardfs/p .
rm -rf fs/sdcardfs
mv p fs/sdcardfs
sed -i 's/SDCARDFS_VERSION="/ccflags-y \+= -Ifs\n\nSDCARDFS_VERSION="/g' fs/sdcardfs/Makefile

# Unignore special samsung files
sed -i '3d' .gitignore firmware/.gitignore
sed -i 's/android\/configs\/android-\*\.cfg/android\/configs\/android-\*\.cfg\n\n# Samsung\n!init\/vmm\.elf\n!firmware\/gnss_firmware\.bin/g' .gitignore
