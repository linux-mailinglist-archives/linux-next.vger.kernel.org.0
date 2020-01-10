Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08ED01368C3
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2020 09:07:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbgAJIHs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jan 2020 03:07:48 -0500
Received: from ozlabs.org ([203.11.71.1]:60511 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726383AbgAJIHr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 10 Jan 2020 03:07:47 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47vFvw2NF8z9sRK;
        Fri, 10 Jan 2020 19:07:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578643660;
        bh=gHerr1wqsu3TqeovoBYdkPy9sovSOy1GFQIQFIdn3vg=;
        h=Date:From:To:Cc:Subject:From;
        b=niNdqaeiI5yBwtLSgvPcGQl8s0eWpdZhsTo/cNY9JstVPmFYZG71B5zTXvIdEAa1R
         TQuJj1wOzysiKp1IjuMPhHPkP8017n8RrK6fx4lafuTEn3YsL9g5lMXLAvGFs4vio+
         KUAHTB8PLOlJGPqF7OOi0XnBXGEsDcFDrxXg+8xdqD0gXP7XglDGlZ/d/gvcvgWQ25
         TFl+dBQbCM8Ytxf6KLH68iY09rJ6s8SxZ8Y9xSfCW365g2owy1LB8q9e+PWJlplnX/
         tQxOPd301B1M60RMXWCkYreLgbzmmWkoLX43mcHSpyr28UaVQcmGFZF3AHnVogs3RI
         YVung+nYw3MSQ==
Date:   Fri, 10 Jan 2020 19:07:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jan 10
Message-ID: <20200110190737.65d8881b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hXOdbF1J8MtUIDXYOPRcqpr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hXOdbF1J8MtUIDXYOPRcqpr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20200109:

The clk tree lost its build failure.

The net-next tree gained a semantic conflict against Linus' tree.

The keys tree still had build failures so I used the version from
next-20191211.

The usb-gadget tree gained a conflict against Linus' tree, so I dropped
it for today.

The gpio tree gained a conflict against the mips tree.

The generic-ioremap tree gained a conflict against the drivers-x86 tree.

The kunit-next tree gained build failures so I used the version from
next-20200109.

Non-merge commits (relative to Linus' tree): 6779
 6986 files changed, 317652 insertions(+), 153802 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There are also quilt-import.log and merge.log
files in the Next directory.  Between each merge, the tree was built
with a ppc64_defconfig for powerpc, an allmodconfig for x86_64, a
multi_v7_defconfig for arm and a native build of tools/perf. After
the final fixups (if any), I do an x86_64 modules_install followed by
builds for x86_64 allnoconfig, powerpc allnoconfig (32 and 64 bit),
ppc44x_defconfig, allyesconfig and pseries_le_defconfig and i386, sparc
and sparc64 defconfig. And finally, a simple boot test of the powerpc
pseries_le_defconfig kernel in qemu (with and without kvm enabled).

Below is a summary of the state of the merge.

I am currently merging 314 trees (counting Linus' and 78 trees of bug
fix patches pending for the current merge release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Status of my local build tests will be at
http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
advice about cross compilers/configs that work, we are always open to add
more builds.

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--=20
Cheers,
Stephen Rothwell

$ git checkout master
$ git reset --hard stable
Merging origin/master (e69ec487b2c7 Merge branch 'for-linus' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/hid/hid)
Merging fixes/master (efcdf0ba98e4 evh_bytechan: fix out of bounds accesses)
Merging kbuild-current/fixes (3a562aee727a Merge tag 'for-5.5-rc4-tag' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux)
Merging arc-current/for-curr (7ecc6c1d5c8d ARC: pt_regs: remove hardcoded r=
egisters offset)
Merging arm-current/fixes (39f4d4410484 Merge branch 'misc' into fixes)
Merging arm-soc-fixes/arm/fixes (9f1c2cb3296a Merge tag 'aspeed-5.5-devicet=
ree-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed int=
o arm/fixes)
Merging arm64-fixes/for-next/fixes (aa638cfe3e73 arm64: cpu_errata: Add His=
ilicon TSV110 to spectre-v2 safe list)
Merging m68k-current/for-linus (5ed0794cde59 m68k/atari: Convert Falcon IDE=
 drivers to platform drivers)
Merging powerpc-fixes/fixes (6da3eced8c5f powerpc/spinlocks: Include correc=
t header for static key)
Merging s390-fixes/fixes (40260b01d029 s390/setup: Fix secure ipl message)
Merging sparc/master (038029c03e21 sparc: remove unneeded uapi/asm/statfs.h)
Merging fscrypt-current/for-stable (ae64f9bd1d36 Linux 4.15-rc2)
Merging net/master (e69ec487b2c7 Merge branch 'for-linus' of git://git.kern=
el.org/pub/scm/linux/kernel/git/hid/hid)
Merging bpf/master (da29f2d84bd1 net: stmmac: Fixed link does not need MDIO=
 Bus)
Merging ipsec/master (738d2902773e Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/netdev/net)
Merging netfilter/master (9546a0b7ce00 tipc: fix wrong connect() return cod=
e)
Merging ipvs/master (c24b75e0f923 ipvs: move old_secure_tcp into struct net=
ns_ipvs)
Merging wireless-drivers/master (33328bfab892 MAINTAINERS: change Gruszka's=
 email address)
Merging mac80211/master (02a614499600 mac80211: mesh: restrict airtime metr=
ic to peered established plinks)
Merging rdma-fixes/for-rc (9554de394b7e i40iw: Remove setting of VMA privat=
e data and use rdma_user_mmap_io)
Merging sound-current/for-linus (8e85def5723e ALSA: hda: enable regmap inte=
rnal locking)
Merging sound-asoc-fixes/for-linus (5ce2a0059156 Merge branch 'asoc-5.5' in=
to asoc-linus)
Merging regmap-fixes/for-linus (c79f46a28239 Linux 5.5-rc5)
Merging regulator-fixes/for-linus (4e553147463e Merge branch 'regulator-5.5=
' into regulator-linus)
Merging spi-fixes/for-linus (89fb73db916e Merge branch 'spi-5.5' into spi-l=
inus)
Merging pci-current/for-linus (ca01e7987463 PCI: rockchip: Fix IO outbound =
ATU register number)
Merging driver-core.current/driver-core-linus (d1eef1c61974 Linux 5.5-rc2)
Merging tty.current/tty-linus (c5ee0b3104e0 serdev: Don't claim unsupported=
 ACPI serial devices)
Merging usb.current/usb-linus (ba9b40810bb4 usb: ohci-da8xx: ensure error r=
eturn on variable error is set)
Merging usb-gadget-fixes/fixes (e5b5da96da50 usb: gadget: fix wrong endpoin=
t desc)
Merging usb-serial-fixes/usb-linus (2438c3a19dec USB: serial: option: add Z=
LP support for 0x1bc7/0x9010)
Merging usb-chipidea-fixes/ci-for-usb-stable (16009db47c51 usb: chipidea: u=
dc: workaround for endpoint conflict issue)
Merging phy/fixes (4f510aa10468 phy/rockchip: inno-hdmi: round clock rate d=
own to closest 1000 Hz)
Merging staging.current/staging-linus (58dcc5bf4030 staging: rtl8188eu: Add=
 device code for TP-Link TL-WN727N v5.21)
Merging char-misc.current/char-misc-linus (68faa679b8be chardev: Avoid pote=
ntial use-after-free in 'chrdev_open()')
Merging soundwire-fixes/fixes (e42617b825f8 Linux 5.5-rc1)
Merging thunderbolt-fixes/fixes (c79f46a28239 Linux 5.5-rc5)
Merging input-current/for-linus (1021dcf19db1 Input: imx_sc_key - only take=
 the valid data from SCU firmware as key state)
Merging crypto-current/master (cb1eeb75cf3d crypto: hisilicon/sec2 - Use at=
omics instead of __sync)
Merging ide/master (baf6722aa0cb ide: Use dev_get_drvdata where possible)
Merging vfio-fixes/for-linus (95f89e090618 vfio/type1: Initialize resv_msi_=
base)
Merging kselftest-fixes/fixes (c79f46a28239 Linux 5.5-rc5)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging slave-dma-fixes/fixes (c79f46a28239 Linux 5.5-rc5)
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (82de6a6fb67e mtd: spi-nor: Fix the writing of =
the Status Register on micron flashes)
Merging mfd-fixes/for-mfd-fixes (603d9299da32 mfd: mt6397: Fix probe after =
changing mt6397-core)
Merging v4l-dvb-fixes/fixes (8821e92879a3 Merge tag 'v5.5-rc5' into patchwo=
rk)
Merging reset-fixes/reset/fixes (db23808615e2 reset: Do not register resour=
ce data for missing resets)
Merging mips-fixes/mips-fixes (bbcc5672b006 MIPS: Avoid VDSO ABI breakage d=
ue to global register variable)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (03729cfa0d54 soc: ti: wkup_m3_ipc: Fix race condi=
tion with rproc_boot)
Merging kvm-fixes/master (ae6088216ce4 Merge tag 'trace-v5.5-rc5' of git://=
git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging kvms390-fixes/master (fe33a928bfcd KVM: s390: ENOTSUPP -> EOPNOTSUP=
P fixups)
Merging hwmon-fixes/hwmon (20358214d96b hwmon: (adt7475) Make volt2reg retu=
rn same reg as reg2volt input)
Merging nvdimm-fixes/libnvdimm-fixes (c14685547762 tools/testing/nvdimm: Fi=
x mock support for ioremap)
Merging btrfs-fixes/next-fixes (a5d2e199f98d Merge branch 'misc-5.5' into n=
ext-fixes)
Merging vfs-fixes/fixes (7b3083ba718b mountpoint_last(): fix the treatment =
of LAST_BIND)
Merging dma-mapping-fixes/for-linus (9c24eaf81cc4 iommu/vt-d: Return the co=
rrect dma mask when we are bypassing the IOMMU)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (46cf053efec6 Linux 5.5-rc3)
Merging samsung-krzk-fixes/fixes (a2315d3aea59 ARM: exynos_defconfig: Resto=
re debugfs support)
Merging pinctrl-samsung-fixes/pinctrl-fixes (e42617b825f8 Linux 5.5-rc1)
Merging devicetree-fixes/dt/linus (dbce0b65046d dt-bindings: Add missing 'p=
roperties' keyword enclosing 'snps,tso')
Merging scsi-fixes/fixes (e4dc9a4c31fe scsi: target/iblock: Fix protection =
error with blocks greater than 512B)
Merging drm-fixes/drm-fixes (ac0c9d3f8ad6 Merge tag 'amd-drm-fixes-5.5-2020=
-01-08' of git://people.freedesktop.org/~agd5f/linux into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (2b2c4a83d69d drm/i915/dp: Dis=
able Port sync mode correctly on teardown)
Merging mmc-fixes/fixes (f667216c5c7c mmc: sdhci-of-esdhc: re-implement err=
atum A-009204 workaround)
Merging rtc-fixes/rtc-fixes (f01f4ffdfb70 rtc: cmos: Revert "rtc: Fix the A=
ltCentury value on AMD/Hygon platform")
Merging gnss-fixes/gnss-linus (d1eef1c61974 Linux 5.5-rc2)
Merging hyperv-fixes/hyperv-fixes (af42d3466bdc Linux 5.4-rc8)
Merging soc-fsl-fixes/fix (5674a92ca4b7 soc/fsl/qe: Fix an error code in qe=
_pin_request())
Merging risc-v-fixes/fixes (97b3b75dcc7f riscv: make sure the cores stay lo=
oping in .Lsecondary_park)
Merging pidfd-fixes/fixes (457677c70c76 um: Implement copy_thread_tls)
Merging fpga-fixes/fixes (dec43da46f63 fpga: altera-ps-spi: Fix getting of =
optional confd gpio)
Merging spdx/spdx-linus (2f13437b8917 Merge tag 'trace-v5.5-2' of git://git=
.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging gpio-intel-fixes/fixes (e42617b825f8 Linux 5.5-rc1)
Merging pinctrl-intel-fixes/fixes (9608ea6c6613 pinctrl: sunrisepoint: Add =
missing Interrupt Status register offset)
Merging erofs-fixes/fixes (d1eef1c61974 Linux 5.5-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (f30e27779d30 drm/fb-helper: Ro=
und up bits_per_pixel if possible)
Merging kspp-gustavo/for-next/kspp (3d519d6d388b sh: kgdb: Mark expected sw=
itch fall-throughs)
Merging kbuild/for-next (673cbf22a729 Merge branch 'kconfig' into for-next)
Merging compiler-attributes/compiler-attributes (54ecb8f7028c Linux 5.4-rc1)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (a7ba70f1787f dma-mapping: treat dev->bus_dma_=
mask as a DMA limit)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (9fbea0b7e842 ARC: add kmemleak support)
Merging arm/for-next (04bb96427d4e ARM: 8947/1: Fix __arch_get_hw_counter()=
 access to CNTVCT)
Merging arm64/for-next/core (46cf053efec6 Linux 5.5-rc3)
Merging arm-perf/for-next/perf (8703317ae576 drivers/perf: hisi: update the=
 sccl_id/ccl_id for certain HiSilicon platform)
Merging arm-soc/for-next (01b94ede7fc8 ARM: Document merges)
Merging amlogic/for-next (592f9d4dd2d2 Merge branch 'v5.6/defconfig' into t=
mp/aml-rebuild)
Merging aspeed/for-next (e4aab38ed5d1 ARM: dts: aspeed: Add SD card for Ves=
nin)
Merging at91/at91-next (0e2a6c95b2b9 Merge branches 'at91-soc' and 'at91-dt=
' into at91-next)
Merging bcm2835/for-next (f14234184671 Merge branch 'bcm2835-maintainers-ne=
xt' into for-next)
Merging imx-mxs/for-next (c7b538626d84 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (2af8e1f26c65 Merge branch 'for_5.5/driver-soc' into =
next)
Merging mediatek/for-next (ca01a6367d0f Merge branch 'v5.5-next/soc' into f=
or-next)
Merging mvebu/for-next (c0d03b53ef47 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (cf9ea4b7c370 Merge branch 'omap-for-v5.6/ti-sysc-dro=
p-pdata' into for-next)
Merging qcom/for-next (760d774a84a8 Merge branches 'arm64-defconfig-for-5.6=
', 'arm64-for-5.6', 'defconfig-for-5.6', 'drivers-for-5.6' and 'dts-for-5.6=
' into for-next)
Merging realtek/for-next (44242a468f3a Merge branch 'v5.6/dt' into next)
Merging renesas/next (9604d3647916 Merge branches 'renesas-arm-dt-for-v5.6'=
, 'renesas-arm64-dt-for-v5.6' and 'renesas-soc-for-v5.6' into renesas-next)
Merging reset/reset/next (e2d5e8332c96 reset: qcom-aoss: Allow CONFIG_RESET=
_QCOM_AOSS to be a tristate)
Merging rockchip/for-next (ac92683c22a7 Merge branch 'v5.6-armsoc/dts64' in=
to for-next)
Merging samsung-krzk/for-next (aeffbe354c53 Merge branch 'next/dt' into for=
-next)
Merging scmi/for-linux-next (c79f46a28239 Linux 5.5-rc5)
Merging sunxi/sunxi/for-next (72a2c06451a6 Merge branch 'sunxi/dt-for-5.6' =
into sunxi/for-next)
Merging tegra/for-next (4d286331ee45 Merge branch for-5.6/clk into for-next)
Merging clk/clk-next (96829978d3b3 Merge branch 'clk-basic-hw' into clk-nex=
t)
Merging clk-samsung/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (d9e19c1d0630 csky: kprobes/kretprobes support)
Merging h8300/h8300-next (a5de8865cb3e h8300: move definition of __kernel_s=
ize_t etc. to posix_types.h)
Merging ia64/next (240b62d381fe ia64: remove stale paravirt leftovers)
Merging m68k/for-next (5ed0794cde59 m68k/atari: Convert Falcon IDE drivers =
to platform drivers)
Merging m68knommu/for-next (c79f46a28239 Linux 5.5-rc5)
Merging microblaze/next (22648c989cb8 microblaze: Increase max dtb size to =
64K from 32K)
Merging mips/mips-next (11d06df7b9f2 MIPS: Loongson2ef: drop pointless stat=
ic qualifier in loongson_suspend_enter())
Merging nds32/next (a7f96fce201c MAINTAINERS: add nds32 maintainer)
Merging nios2/for-next (e32ea127d81c nios2: Fix ioremap)
Merging openrisc/for-next (0ecdcaa6d5e7 openrisc: Fix Kconfig indentation)
Merging parisc-hd/for-next (22b4b7c41c2a parisc: Use proper printk format f=
or resource_size_t)
Merging powerpc/next (3a9d970f17e0 powerpc/85xx: Get twr_p102x to compile a=
gain)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (6e62bd36e9ad soc: fsl: qe: remove set but not used va=
riable 'mm_gc')
Merging risc-v/for-next (43dfc6167983 kasan: Add riscv to KASAN documentati=
on.)
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
Merging sifive/for-next (467e050e9760 Merge branch 'i2c/for-current' of git=
://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging s390/features (d1eef1c61974 Linux 5.5-rc2)
Merging sh/sh-next (a193018e5290 sh: add missing EXPORT_SYMBOL() for __dela=
y)
Merging sparc-next/master (b71acb0e3721 Merge branch 'linus' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging uml/linux-next (9807019a62dc um: Loadable BPF "Firmware" for vector=
 drivers)
Merging xtensa/xtensa-for-next (bd6d7558140c Merge branch 'xtensa-5.5' into=
 xtensa-for-next)
Merging fscrypt/master (f4a0b08b39ae fscrypt: remove redundant bi_status ch=
eck)
Merging afs/afs-next (4fe171bb81b1 afs: Remove set but not used variable 'r=
et')
Merging btrfs/for-next (3ae03c13879d Merge branch 'for-next-next-v5.5-20200=
106' into for-next-20200106)
CONFLICT (content): Merge conflict in fs/btrfs/inode.c
Merging ceph/master (da08e1e1d7c3 ceph: add more debug info when decoding m=
dsmap)
Merging cifs/for-next (30b1b3802b20 fs/cifs/cifssmb.c: use true,false for b=
ool variable)
Merging configfs/for-next (e2f238f7d5a1 configfs: calculate the depth of pa=
rent item)
Merging ecryptfs/next (b4a81b87a4cf ecryptfs: fix a memory leak bug in ecry=
ptfs_init_messaging())
Merging erofs/dev (e3915ad94bfa erofs: remove void tagging/untagging of wor=
kgroup pointers)
Merging ext3/for_next (614644676394 udf: Update header files to UDF 2.60)
Merging ext4/dev (40eaaeb11758 memcg: fix a crash in wb_workfn when a devic=
e disappears)
Merging f2fs/dev (ecd14e95fc91 f2fs: code cleanup for f2fs_statfs_project())
Merging fsverity/fsverity (8086c974ecb9 fs-verity: implement readahead for =
FS_IOC_ENABLE_VERITY)
Merging fuse/for-next (8d66fcb74884 fuse: fix Kconfig indentation)
Merging jfs/jfs-next (a5fdd713d256 jfs: fix bogus variable self-initializat=
ion)
Merging nfs/linux-next (c79f46a28239 Linux 5.5-rc5)
Merging nfs-anna/linux-next (ffb855611b05 NFS: Attach supplementary error i=
nformation to fs_context.)
Merging nfsd/nfsd-next (e44b4bf2648e nfsd: use true,false for bool variable=
 in nfssvc.c)
Merging orangefs/for-next (f9bbb68233aa orangefs: posix open permission che=
cking...)
Merging overlayfs/overlayfs-next (6c7bed084507 ovl: improving copy-up effic=
iency for big sparse file)
Merging ubifs/linux-next (6e78c01fde90 Revert "jffs2: Fix possible null-poi=
nter dereferences in jffs2_add_frag_to_fragtree()")
Merging v9fs/9p-next (79fb9216b7be 9p: Remove unneeded semicolon)
Merging xfs/for-next (7cb41b1d14e1 xfs: remove bogus assertion when online =
repair isn't enabled)
Merging iomap/iomap-for-next (62e298db3fc3 fs: Fix page_mkwrite off-by-one =
errors)
Merging djw-vfs/vfs-for-next (3253d9d09337 splice: only read in as much inf=
ormation as there is pipe buffer space)
Merging file-locks/locks-next (98ca480a8f22 locks: print unsigned ino in /p=
roc/locks)
Merging vfs/for-next (6c3530271c60 Merge branch 'work.misc' into for-next)
Merging printk/for-next (e616b43fb3a3 Merge branch 'for-5.6' into for-next)
Merging pci/next (fdfe7c23ebdc Merge branch 'remotes/lorenzo/pci/dwc')
Merging pstore/for-next/pstore (e163fdb3f7f8 pstore/ram: Regularize prz lab=
el allocation lifetime)
Merging hid/for-next (1b43c1d11f20 Merge branch 'for-5.5/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (e1a2f0475e9d Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i3c/i3c/next (608b68b67a30 MAINTAINERS: fix style in CADENCE I3C MA=
STER IP entry)
Merging dmi/master (2429c99fa13a firmware: dmi: Add dmi_memdev_handle)
Merging hwmon-staging/hwmon-next (00b379b51ea6 hwmon: (pmbus/ibm-cffps) Fix=
 the LED behavior when turned off)
Merging jc_docs/docs-next (3697aa15563f docs/zh_CN: translate kernel enforc=
ement statement)
Merging v4l-dvb/master (2a0a0bc7020e media: MAINTAINERS: add entry for Rock=
chip ISP1 driver)
Merging v4l-dvb-next/master (d45331b00ddb Linux 5.3-rc4)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (229991e8cf02 Merge branch 'pm-avs' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (8ead819f1bef cpufreq: s3c: fix =
unbalances of cpufreq policy refcount)
Merging cpupower/cpupower (e42617b825f8 Linux 5.5-rc1)
Merging opp/opp/linux-next (03758d60265c opp: Replace list_kref with a loca=
l counter)
Merging thermal/thermal/linux-next (09a1f1817b04 dt-bindings: thermal: Add =
YAML schema for sun8i-thermal driver bindings)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (a48f9721e6db dlm: no need to check return value of debugf=
s_create functions)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (74f75cda754e IB/core: Fix build failure without huge=
pages)
Merging net-next/master (b1daa4d19473 Merge branch 'sfc-more-code-refactori=
ng')
Applying: mlxws: fix up for "mlxsw: spectrum_qdisc: Ignore grafting of invi=
sible FIFO"
Merging bpf-next/master (f5bfcd953d81 bpf: Document BPF_F_QUERY_EFFECTIVE f=
lag)
Merging ipsec-next/master (e27cca96cd68 xfrm: add espintcp (RFC 8229))
CONFLICT (content): Merge conflict in net/unix/af_unix.c
Merging mlx5-next/mlx5-next (e42617b825f8 Linux 5.5-rc1)
Merging netfilter-next/master (4460985fac06 Merge branch '100GbE' of git://=
git.kernel.org/pub/scm/linux/kernel/git/jkirsher/next-queue)
Merging nfc-next/master (1f008cfec5d5 NFC: fdp: Fix unused variable warning=
s)
CONFLICT (content): Merge conflict in drivers/nfc/st21nfca/se.c
Merging ipvs-next/master (d54725cd11a5 netfilter: nf_tables: support for mu=
ltiple devices per netdev hook)
Merging wireless-drivers-next/master (ae0a723c4cfd Merge ath-next from git:=
//git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git)
Merging bluetooth/master (dde8010be0a0 Bluetooth: btbcm : Fix warning about=
 missing blank lines after declarations)
Merging mac80211-next/master (1ee7826ab68f mac80211: Remove redundant asser=
tion)
Merging gfs2/for-next (e556280d3691 gfs2: minor cleanup: remove unneeded va=
riable ret in gfs2_jdata_writepage)
Merging mtd/mtd/next (589e1b6c47ce Merge tag 'nand/for-5.5' into mtd/next)
Merging nand/nand/next (777260a5c992 mtd: rawnand: remove unecessary checki=
ng if dmac is NULL)
Merging spi-nor/spi-nor/next (707745e8d4e7 mtd: spi-nor: Add support for mx=
25r3235f)
Merging crypto/master (b279997f6c60 crypto: exynos-rng - Rename Exynos to l=
owercase)
Merging drm/drm-next (a566696cf9f2 Merge tag 'drm-misc-next-2020-01-07' of =
git://anongit.freedesktop.org/drm/drm-misc into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_drv.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_ring_su=
bmission.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_gt_pm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_obj=
ect.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_di=
splay.c
Applying: drm/i915: fixup for "drm/i915/dp: Disable Port sync mode correctl=
y on teardown"
Merging amdgpu/drm-next (d7c447015051 drm/amdgpu: fix a warning in get_sdma=
_rlc_reg_offset)
Merging drm-intel/for-linux-next (5c34ba27cbbb drm/i915: Pass cpu_transcode=
r to assert_pipe_disabled() always)
Merging drm-tegra/drm/tegra/for-next (d66dfcf80d0f drm/tegra: Run hub clean=
up on ->remove())
Merging drm-misc/for-linux-next (44c58c520ffc drm/panel: simple: Add Satoz =
SAT050AT40H12R2 panel support)
Merging drm-msm/msm-next (e3ff68812384 drm/msm: update LANE_CTRL register v=
alue from default value)
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (4d24376370fb gpu: ipu-v3: image-convert: only=
 sample into the next tile if necessary)
Merging etnaviv/etnaviv/next (22567d017c2c dt-bindings: etnaviv: Add #cooli=
ng-cells)
Merging regmap/for-next (bd656f968426 Merge branch 'regmap-5.6' into regmap=
-next)
Merging sound/for-next (1a0986c1bc14 ALSA: hda: Fix a typo in comments)
Merging sound-asoc/for-next (8fe5a948b486 Merge branch 'asoc-5.6' into asoc=
-next)
Merging modules/modules-next (f6d061d61712 kernel/module: Fix memleak in mo=
dule_add_modinfo_attrs())
Merging input/next (fd7bba685e7d Input: apbps2 - add __iomem to register st=
ruct)
Merging block/for-next (d58727f89af6 Merge branch 'for-5.6/io_uring-vfs' in=
to for-next)
Merging device-mapper/for-next (09ec66049696 dm crypt: fix benbi IV constru=
ctor crash if used in authenticated mode)
Merging pcmcia/pcmcia-next (71705c611263 PCMCIA/i82092: remove #if 0 block)
Merging mmc/next (9f606f11ea98 Merge branch 'fixes' into next)
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (ea9a89ca3b95 mfd: dln2: More sanity checking for =
endpoints)
Merging backlight/for-backlight-next (102a1b382177 backlight: qcom-wled: Fi=
x spelling mistake "trigged" -> "triggered")
Merging battery/for-next (921377c0b4e8 power: supply: abx500_chargalg: Remo=
ve unneeded semicolon)
Merging regulator/for-next (6aec426b8e7e Merge branch 'regulator-5.6' into =
regulator-next)
Merging security/next-testing (45893a0abee6 kexec: Fix file verification on=
 S390)
Merging apparmor/apparmor-next (341c1fda5e17 apparmor: make it so work buff=
ers can be allocated from atomic context)
Merging integrity/next-integrity (f47825c69485 Merge branch 'next-integrity=
.measure-keys' into next-integrity)
Merging keys/keys-next (a2337251cb6b Merge branch 'keys-acl' into keys-next)
CONFLICT (content): Merge conflict in include/uapi/asm-generic/unistd.h
CONFLICT (content): Merge conflict in arch/xtensa/kernel/syscalls/syscall.t=
bl
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_64.tbl
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_32.tbl
CONFLICT (content): Merge conflict in arch/sparc/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/sh/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/s390/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/powerpc/kernel/syscalls/syscall.=
tbl
CONFLICT (content): Merge conflict in arch/parisc/kernel/syscalls/syscall.t=
bl
CONFLICT (content): Merge conflict in arch/mips/kernel/syscalls/syscall_o32=
.tbl
CONFLICT (content): Merge conflict in arch/mips/kernel/syscalls/syscall_n64=
.tbl
CONFLICT (content): Merge conflict in arch/mips/kernel/syscalls/syscall_n32=
.tbl
CONFLICT (content): Merge conflict in arch/microblaze/kernel/syscalls/sysca=
ll.tbl
CONFLICT (content): Merge conflict in arch/m68k/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/ia64/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/arm64/include/asm/unistd32.h
CONFLICT (content): Merge conflict in arch/arm64/include/asm/unistd.h
CONFLICT (content): Merge conflict in arch/arm/tools/syscall.tbl
CONFLICT (content): Merge conflict in arch/alpha/kernel/syscalls/syscall.tbl
$ git reset --hard HEAD^
Merging next-20191211 version of keys
CONFLICT (content): Merge conflict in samples/Makefile
CONFLICT (content): Merge conflict in samples/Kconfig
CONFLICT (content): Merge conflict in include/uapi/asm-generic/unistd.h
CONFLICT (content): Merge conflict in include/linux/security.h
CONFLICT (content): Merge conflict in arch/xtensa/kernel/syscalls/syscall.t=
bl
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_64.tbl
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_32.tbl
CONFLICT (content): Merge conflict in arch/sparc/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/sh/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/s390/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/powerpc/kernel/syscalls/syscall.=
tbl
CONFLICT (content): Merge conflict in arch/parisc/kernel/syscalls/syscall.t=
bl
CONFLICT (content): Merge conflict in arch/mips/kernel/syscalls/syscall_o32=
.tbl
CONFLICT (content): Merge conflict in arch/mips/kernel/syscalls/syscall_n64=
.tbl
CONFLICT (content): Merge conflict in arch/mips/kernel/syscalls/syscall_n32=
.tbl
CONFLICT (content): Merge conflict in arch/microblaze/kernel/syscalls/sysca=
ll.tbl
CONFLICT (content): Merge conflict in arch/m68k/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/ia64/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/arm64/include/asm/unistd32.h
CONFLICT (content): Merge conflict in arch/arm64/include/asm/unistd.h
CONFLICT (content): Merge conflict in arch/arm/tools/syscall.tbl
CONFLICT (content): Merge conflict in arch/alpha/kernel/syscalls/syscall.tbl
[master 164064cacdae] next-20191211/keys
Merging selinux/next (d41415eb5eda Documentation,selinux: fix references to=
 old selinuxfs mount point)
CONFLICT (content): Merge conflict in include/linux/lsm_audit.h
Merging smack/for-next (92604e825304 smack: use GFP_NOFS while holding inod=
e_smack::smk_lock)
Merging tomoyo/master (a8772fad0172 tomoyo: Use atomic_t for statistics cou=
nter)
Merging tpmdd/next (b07f636fca1c Merge tag 'tpmdd-next-20200108' of git://g=
it.infradead.org/users/jjs/linux-tpmdd)
Merging watchdog/master (dcbce5fbcc69 watchdog: orion: fix platform_get_irq=
() complaints)
Merging iommu/next (cdd1a5d53fd5 Merge branches 'arm/smmu', 'x86/amd' and '=
core' into next)
Merging vfio/next (9917b54aded1 Merge branch 'v5.5/vfio/jiang-yi-irq-bypass=
-unregister-v1' into v5.5/vfio/next)
Merging audit/next (cb5172d96d16 audit: Add __rcu annotation to RCU pointer)
Merging devicetree/for-next (832a9fc944e6 dt: bindings: add vendor prefix f=
or Kamstrup A/S)
Merging mailbox/mailbox-for-next (c6c6bc6ea9fc mailbox: imx: add support fo=
r imx v1 mu)
Merging spi/for-next (811a0fa3e69b Merge branch 'spi-5.6' into spi-next)
Merging tip/auto-latest (e998b71fee5d Merge branch 'x86/fpu')
Merging clockevents/timers/drivers/next (8c82723414d5 clocksource/drivers/t=
imer-ti-dm: Switch to platform_get_irq)
Merging edac/edac-for-next (a651c6c64431 EDAC/aspeed: Remove unneeded semic=
olon)
Merging irqchip/irq/irqchip-next (c6d732c8cc67 irqchip/aspeed-i2c-ic: Fix i=
rq domain name memory leak)
Merging ftrace/for-next (fe6e096a5bbf tracing: Fix endianness bug in histog=
ram trigger)
Merging rcu/rcu/next (da4174e321ff rcu-tasks: *_ONCE() for rcu_tasks_cbs_he=
ad)
CONFLICT (content): Merge conflict in lib/Kconfig.debug
Applying: rcu: fix up for "Remove rcu_swap_protected()"
Merging kvm/linux-next (6948199a9af9 KVM: x86/mmu: WARN if root_hpa is inva=
lid when handling a page fault)
Merging kvm-arm/next (c74555894492 KVM: arm/arm64: vgic: Handle GICR_PENDBA=
SER.PTZ filed as RAZ)
Merging kvm-ppc/kvm-ppc-next (30486e72093e KVM: PPC: Book3S HV: XIVE: Fix p=
otential page leak on error path)
Merging kvms390/next (c7b7de631246 KVM: s390: Do not yield when target is a=
lready running)
Merging xen-tip/linux-next (d6bd6cf9feb8 xen/grant-table: remove multiple B=
UG_ON on gnttab_interface)
Merging percpu/for-next (06557cf18eae Merge branch 'for-5.6' into for-next)
Merging workqueues/for-next (49e9d1a9faf2 workqueue: Add RCU annotation for=
 pwq list walk)
Merging drivers-x86/for-next (e9df325df86d platform/x86: intel_telemetry_de=
bugfs: Respect error code of kstrtou32_from_user())
Merging chrome-platform/for-next (11f1eabee0ba cros_ec: treewide: Remove 'i=
nclude/linux/mfd/cros_ec.h')
Merging hsi/for-next (c1030cd45619 HSI: Remove dev_err() usage after platfo=
rm_get_irq())
Merging leds/for-next (260718b3a35d leds: lm3692x: Disable chip on brightne=
ss 0)
Merging ipmi/for-next (6b8526d3abc0 ipmi:ssif: Handle a possible NULL point=
er reference)
Merging driver-core/driver-core-next (adc92dd4550e debugfs: Fix warnings wh=
en building documentation)
CONFLICT (content): Merge conflict in include/linux/device.h
Merging usb/usb-next (497210f27b8c usb: typec: ucsi: fix spelling mistake "=
connetor" -> "connector")
Merging usb-gadget/next (d889cc1c9217 usb: cdns3: add NXP imx8qm glue layer)
CONFLICT (content): Merge conflict in drivers/usb/cdns3/gadget.c
$ git reset --hard HEAD
Merging usb-serial/usb-next (d1eef1c61974 Linux 5.5-rc2)
Merging usb-chipidea-next/ci-for-usb-next (4d6141288c33 usb: chipidea: imx:=
 pinctrl for HSIC is optional)
Merging phy-next/next (c5f27bd42992 dt-bindings: usb: Convert Allwinner A80=
 USB PHY controller to a schema)
CONFLICT (content): Merge conflict in drivers/phy/mediatek/Kconfig
Merging tty/tty-next (b4b844930f27 tty: serial: fsl_lpuart: drop earlycon e=
ntry for i.MX8QXP)
Merging char-misc/char-misc-next (c79f46a28239 Linux 5.5-rc5)
Merging extcon/extcon-next (2ddf50a75dab extcon: sm5502: Remove unneeded se=
micolon)
Merging soundwire/next (09f6a72d0143 soundwire: intel: add clock stop quirk=
s)
Merging thunderbolt/next (c79f46a28239 Linux 5.5-rc5)
Merging staging/staging-next (0469fc6a1a87 staging: wfx: check for memory a=
llocation failures from wfx_alloc_hif)
Merging mux/for-next (f356d58c3a04 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (7d7899c5297b interconnect: Check for valid path in ic=
c_set_bw())
Merging slave-dma/next (02939cd16709 dmaengine: imx-sdma: Fix memory leak)
Merging cgroup/for-next (899969b46c28 Merge branch 'for-5.5' into for-next)
Merging scsi/for-next (202f93b5d605 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (1d83f0df7076 Merge branch '5.6/scsi-queue' into =
5.6/scsi-next)
Merging vhost/linux-next (d1281e3a562e virtio-blk: remove VIRTIO_BLK_F_SCSI=
 support)
Merging rpmsg/for-next (447e58a8d18a Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (0dc4997ef739 Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/ven=
dor-prefixes.yaml
Merging gpio-brgl/gpio/for-next (1e4d149e9017 gpio: altera: change to platf=
orm_get_irq_optional to avoid false-positive error)
Merging gpio-intel/for-next (e42617b825f8 Linux 5.5-rc1)
Merging pinctrl/for-next (551f4550b1f8 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (3a67fe38e76a pinctrl: lynxpoint: Update sum=
mary in the driver)
Merging pinctrl-samsung/for-next (225a2ec19aac pinctrl: samsung: Fix missin=
g OF and GPIOLIB dependency on S3C24xx and S3C64xx)
Merging pwm/for-next (f24e564129f3 pwm: Fix minor Kconfig whitespace issues)
Merging userns/for-next (61a47c1ad3a4 sysctl: Remove the sysctl system call)
Merging ktest/for-next (9b5f852ae20d ktest: Make default build option oldco=
nfig not randconfig)
Merging random/dev (09a6d00a42ce random: remove some dead code of poolinfo)
Merging kselftest/next (192c197cbca5 selftests: Uninitialized variable in t=
est_cgcore_proc_migration())
Merging y2038/y2038 (b8c709bf963a Merge tags 'block-ioctl-cleanup-5.6' and =
'y2038-drivers-for-v5.6-signed' of git://git.kernel.org:/pub/scm/linux/kern=
el/git/arnd/playground into HEAD)
CONFLICT (content): Merge conflict in drivers/block/virtio_blk.c
CONFLICT (content): Merge conflict in Documentation/core-api/index.rst
Merging livepatching/for-next (7f436b3066e3 Merge branch 'for-5.5/core' int=
o for-next)
Merging coresight/next (ad9882f15884 coresight: etm4x: Fix unused function =
warning)
Merging rtc/rtc-next (d53f9b68b359 rtc: pcf8563: Use BIT)
Merging nvdimm/libnvdimm-for-next (0dfbb932bb67 MAINTAINERS: Remove Keith f=
rom NVDIMM maintainers)
Merging at24/at24/for-next (1c89074bf850 eeprom: at24: remove the write-pro=
tect pin support)
Merging ntb/ntb-next (1ef512b16bc8 NTB: Fix an error in get link status)
Merging kspp/for-next/kspp (c79f46a28239 Linux 5.5-rc5)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (d1eef1c61974 Linux 5.5-rc2)
Merging fsi/next (2c01397b71c5 fsi: aspeed: Fix OPB0 byte order register va=
lues)
Merging slimbus/for-next (526eaf5d08a2 slimbus: Use the correct style for S=
PDX License Identifier)
Merging nvmem/for-next (9d5e6165e358 nvmem: imx: ocotp: introduce ocotp_ctr=
l_reg)
Merging xarray/xarray (6b81141deb73 XArray: Improve documentation of search=
 marks)
Merging hyperv/hyperv-next (7a1323b5dfe4 Drivers: hv: vmbus: Fix crash hand=
ler reset of Hyper-V synic)
Merging auxdisplay/auxdisplay (54ecb8f7028c Linux 5.4-rc1)
Merging kgdb/kgdb/for-next (c58ff643763c kdb: Tweak escape handling for vi =
users)
Merging pidfd/for-next (04882c321b26 Merge branch 'pidfd' into for-next)
Merging devfreq/devfreq-next (91d7f3f8f134 PM / devfreq: exynos: Rename Exy=
nos to lowercase)
Merging hmm/hmm (fd6988496e79 Linux 5.5-rc4)
Merging fpga/for-next (1d39387ce859 fpga: remove redundant dev_err message)
Merging kunit/test (e42617b825f8 Linux 5.5-rc1)
Merging cel/cel-next (a99d8080aaf3 Linux 5.4-rc6)
Merging kasan-bitops/topic/kasan-bitops (4f4afc2c9599 docs/core-api: Remove=
 possibly confusing sub-headings from Bit Operations)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
CONFLICT (content): Merge conflict in drivers/platform/x86/intel_telemetry_=
pltdrv.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/sfc/efx.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem_gtt.c
Applying: fix up for "drm/i915/gtt: split up i915_gem_gtt"
Applying: fix up for "sfc: move struct init and fini code"
Merging kunit-next/kunit (6ae2bfd3df06 kunit: update documentation to descr=
ibe module-based build)
$ git reset --hard HEAD^
Merging next-20200109 version of kunit-next
Applying: fs: fix up for !CONFIG_BLOCK and bmap
Merging akpm-current/current (63982cb5b89f ipc/msg.c: Adjust indentation in=
 ksys_msgctl)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/block/null_blk_main.c: fix layout
Applying: drivers/block/null_blk_main.c: fix uninitialized var warnings
Applying: pinctrl: fix pxa2xx.c build warnings
Applying: mm: remove __krealloc
Applying: mm: add generic p?d_leaf() macros
Applying: arc: mm: add p?d_leaf() definitions
Applying: arm: mm: add p?d_leaf() definitions
Applying: arm64: mm: add p?d_leaf() definitions
Applying: mips: mm: add p?d_leaf() definitions
Applying: powerpc: mm: add p?d_leaf() definitions
Applying: riscv: mm: add p?d_leaf() definitions
Applying: s390: mm: add p?d_leaf() definitions
Applying: sparc: mm: add p?d_leaf() definitions
Applying: x86: mm: add p?d_leaf() definitions
Applying: mm: pagewalk: add p4d_entry() and pgd_entry()
Applying: mm: pagewalk: fix unused variable warning
Applying: mm: pagewalk: allow walking without vma
Applying: mm: pagewalk: don't lock PTEs for walk_page_range_novma()
Applying: mm: pagewalk: fix termination condition in walk_pte_range()
Applying: mm: pagewalk: add 'depth' parameter to pte_hole
Applying: x86: mm: point to struct seq_file from struct pg_state
Applying: x86: mm+efi: convert ptdump_walk_pgd_level() to take a mm_struct
Applying: x86: mm: convert ptdump_walk_pgd_level_debugfs() to take an mm_st=
ruct
Applying: mm: add generic ptdump
Applying: x86: mm: convert dump_pagetables to use walk_page_range
Applying: arm64: mm: convert mm/dump.c to use walk_page_range()
Applying: arm64: mm: display non-present entries in ptdump
Applying: mm: ptdump: reduce level numbers by 1 in note_page()
Applying: x86: mm: avoid allocating struct mm_struct on the stack
Applying: proc: decouple proc from VFS with "struct proc_ops"
Applying: proc: convert everything to "struct proc_ops"
Applying: proc-convert-everything-to-struct-proc_ops-fix
Applying: lib/string: add strnchrnul()
Applying: bitops: more BITS_TO_* macros
Applying: lib: add test for bitmap_parse()
Applying: fix rebase issue
Applying: lib/test_bitmap: fix address space when test user buffer
Applying: lib: make bitmap_parse_user a wrapper on bitmap_parse
Applying: lib: rework bitmap_parse()
Applying: lib: new testcases for bitmap_parse{_user}
Applying: include/linux/cpumask.h: don't calculate length of the input stri=
ng
Applying: treewide: remove redundant IS_ERR() before error code check
Applying: ARM: dma-api: fix max_pfn off-by-one error in __dma_supported()
Applying: drivers/tty/serial/sh-sci.c: suppress warning
Applying: drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer ove=
rflow
Merging akpm/master (369fce8b5664 drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/hXOdbF1J8MtUIDXYOPRcqpr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4YMMkACgkQAVBC80lX
0GxoDwf/QdfCMp9uyl1BlUfixTAeY2SE9wjvthCyl/YSPitgQpr0ZSxdEvocTMuK
CWwiUVOyOWYc1m4+y01eQLK9YkpTTcbG9CTEXeuCElZvJpq62x+bplxFob2nb4Ut
QOxAsJD2lqJjPhpwtP7sEJ0KxxuadsDnvDRa5vM6swSlv+h31xHKl74Y38YruVnx
+hVq+aaz1y45WEKmqJvWH/+8yBF/O0qcZZJVIOkkq/lgoIUneVgg5eJWl25aM+sx
LXgtqFjptCchJof2byGOltdqCj/OEaq4RXzJfy2InS3RDXBFbt1PEXsGN6lbzsyV
ECwCftBKrvFfJSykYxaLktTOXLz/MQ==
=+I9B
-----END PGP SIGNATURE-----

--Sig_/hXOdbF1J8MtUIDXYOPRcqpr--
