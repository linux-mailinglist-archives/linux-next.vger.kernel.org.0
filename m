Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E471138C36
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2020 08:15:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727335AbgAMHPO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jan 2020 02:15:14 -0500
Received: from ozlabs.org ([203.11.71.1]:60007 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725954AbgAMHPN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Jan 2020 02:15:13 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47x4bs4xTyz9sPn;
        Mon, 13 Jan 2020 18:15:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578899705;
        bh=1nHgP9eYCgfDkk83Sll0jbtDZQDy7eX9gcqgZ13+rtY=;
        h=Date:From:To:Cc:Subject:From;
        b=LEeyzqyPk1EQKzsk0ijti15BvcpD68NXlmFztleZf6ByEHwJkTymxaavlhFv9GA0h
         xpACqEupGCExWAgGJ+EHWyQq+S53TrTxYr7ifJ77ZWc3dTBGVww0/7Sj/VmyJQMeA+
         NCU/2yjrXYQlBC/jpLY59eavbvAMoxh+Fyalb6oXXtj1y1x2Ob0REXAr304AShCIYh
         NOiqjDTPYycOXn7xZccFqu9oXFm2HOfuI7OBJdOgMq1XnwGYFqzWhMgHBdQoR42j3j
         xd2iMhiE/05+0AM1ZXOV1gfpIX5YpL5tBkTzLbFJZ3msS8X9mNRRojQftP4aDWtDB/
         eEctChaeDlGUw==
Date:   Mon, 13 Jan 2020 18:14:57 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jan 13
Message-ID: <20200113181457.209ab4a5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/l=NxHKIM6gnveG_aTan4fHS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/l=NxHKIM6gnveG_aTan4fHS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20200110:

The vfs tree gained a conflict against the m68k tree.

The keys tree still had build failures so I used the version from
next-20191211.  It also gained a conflict against the m68k tree.

The usb-gadget tree still had its conflict against Linus' tree, so I dropped
it for today.

The pidfd tree gained conflicts against the m68k, vfs and keys trees.

The generic-ioremap tree gained a conflict against the tegra tree.

The kunit-next tree lost its failures.

Non-merge commits (relative to Linus' tree): 7258
 7462 files changed, 345876 insertions(+), 165190 deletions(-)

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
Merging origin/master (040a3c33623b Merge tag 'iommu-fixes-v5.5-rc5' of git=
://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu)
Merging fixes/master (efcdf0ba98e4 evh_bytechan: fix out of bounds accesses)
Merging kbuild-current/fixes (3a562aee727a Merge tag 'for-5.5-rc4-tag' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux)
Merging arc-current/for-curr (7ecc6c1d5c8d ARC: pt_regs: remove hardcoded r=
egisters offset)
Merging arm-current/fixes (39f4d4410484 Merge branch 'misc' into fixes)
Merging arm-soc-fixes/arm/fixes (b47611c8c389 Merge tag 'v5.5-rockchip-dtsf=
ixes' of git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip=
 into arm/fixes)
Merging arm64-fixes/for-next/fixes (aa638cfe3e73 arm64: cpu_errata: Add His=
ilicon TSV110 to spectre-v2 safe list)
Merging m68k-current/for-linus (5ed0794cde59 m68k/atari: Convert Falcon IDE=
 drivers to platform drivers)
Merging powerpc-fixes/fixes (6da3eced8c5f powerpc/spinlocks: Include correc=
t header for static key)
Merging s390-fixes/fixes (40260b01d029 s390/setup: Fix secure ipl message)
Merging sparc/master (548f0b9a5f4c sparc: Add .exit.data section.)
Merging fscrypt-current/for-stable (ae64f9bd1d36 Linux 4.15-rc2)
Merging net/master (c9f53049d4a8 MAINTAINERS: update my email address)
Merging bpf/master (555089fdfc37 bpftool: Fix printing incorrect pointer in=
 btf_dump_ptr)
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
Merging sound-current/for-linus (7fba6aea4472 ALSA: hda: Rename back to dmi=
c_detect option)
Merging sound-asoc-fixes/for-linus (ad6ec39ae649 Merge branch 'asoc-5.5' in=
to asoc-linus)
Merging regmap-fixes/for-linus (c79f46a28239 Linux 5.5-rc5)
Merging regulator-fixes/for-linus (0b16fc0792a2 Merge branch 'regulator-5.5=
' into regulator-linus)
Merging spi-fixes/for-linus (671b9fe06205 Merge branch 'spi-5.5' into spi-l=
inus)
Merging pci-current/for-linus (ca01e7987463 PCI: rockchip: Fix IO outbound =
ATU register number)
Merging driver-core.current/driver-core-linus (d1eef1c61974 Linux 5.5-rc2)
Merging tty.current/tty-linus (c5ee0b3104e0 serdev: Don't claim unsupported=
 ACPI serial devices)
Merging usb.current/usb-linus (6327edceb62b Merge branch 'i2c/for-current' =
of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging usb-gadget-fixes/fixes (e5b5da96da50 usb: gadget: fix wrong endpoin=
t desc)
Merging usb-serial-fixes/usb-linus (2438c3a19dec USB: serial: option: add Z=
LP support for 0x1bc7/0x9010)
Merging usb-chipidea-fixes/ci-for-usb-stable (16009db47c51 usb: chipidea: u=
dc: workaround for endpoint conflict issue)
Merging phy/fixes (4f510aa10468 phy/rockchip: inno-hdmi: round clock rate d=
own to closest 1000 Hz)
Merging staging.current/staging-linus (6327edceb62b Merge branch 'i2c/for-c=
urrent' of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging char-misc.current/char-misc-linus (ac61145a725a Merge branch 'for-l=
inus' of git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid)
Merging soundwire-fixes/fixes (e42617b825f8 Linux 5.5-rc1)
Merging thunderbolt-fixes/fixes (c79f46a28239 Linux 5.5-rc5)
Merging input-current/for-linus (6b32391ed675 Input: sur40 - fix interface =
sanity checks)
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
Merging vfs-fixes/fixes (e56b43b971a7 reimplement path_mountpoint() with le=
ss magic)
Merging dma-mapping-fixes/for-linus (9c24eaf81cc4 iommu/vt-d: Return the co=
rrect dma mask when we are bypassing the IOMMU)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (46cf053efec6 Linux 5.5-rc3)
Merging samsung-krzk-fixes/fixes (a2315d3aea59 ARM: exynos_defconfig: Resto=
re debugfs support)
Merging pinctrl-samsung-fixes/pinctrl-fixes (e42617b825f8 Linux 5.5-rc1)
Merging devicetree-fixes/dt/linus (dbce0b65046d dt-bindings: Add missing 'p=
roperties' keyword enclosing 'snps,tso')
Merging scsi-fixes/fixes (529244bd1afc scsi: enclosure: Fix stale device oo=
ps with hot replug)
Merging drm-fixes/drm-fixes (023b3b0e139f Merge tag 'drm-intel-fixes-2020-0=
1-09-1' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes)
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
Merging risc-v-fixes/fixes (dc6fcba72f04 riscv: Fixup obvious bug for fp-re=
gs reset)
Merging pidfd-fixes/fixes (457677c70c76 um: Implement copy_thread_tls)
Merging fpga-fixes/fixes (dec43da46f63 fpga: altera-ps-spi: Fix getting of =
optional confd gpio)
Merging spdx/spdx-linus (2f13437b8917 Merge tag 'trace-v5.5-2' of git://git=
.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging gpio-intel-fixes/fixes (e42617b825f8 Linux 5.5-rc1)
Merging pinctrl-intel-fixes/fixes (9608ea6c6613 pinctrl: sunrisepoint: Add =
missing Interrupt Status register offset)
Merging erofs-fixes/fixes (d1eef1c61974 Linux 5.5-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (023b3b0e139f Merge tag 'drm-in=
tel-fixes-2020-01-09-1' of git://anongit.freedesktop.org/drm/drm-intel into=
 drm-fixes)
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
Merging arm64/for-next/core (d8cb11684002 Merge branches 'for-next/asm-anno=
tations', 'for-next/e0pd', 'for-next/kexec/cleanup', 'for-next/kexec/file-k=
dump', 'for-next/misc' and 'for-next/perf' into for-next/core)
Merging arm-perf/for-next/perf (8703317ae576 drivers/perf: hisi: update the=
 sccl_id/ccl_id for certain HiSilicon platform)
Merging arm-soc/for-next (1030a23b6799 ARM: Document merges)
Merging amlogic/for-next (592f9d4dd2d2 Merge branch 'v5.6/defconfig' into t=
mp/aml-rebuild)
Merging aspeed/for-next (e4aab38ed5d1 ARM: dts: aspeed: Add SD card for Ves=
nin)
Merging at91/at91-next (a25890a380a9 Merge branches 'at91-soc', 'at91-dt' a=
nd 'at91-defconfig' into at91-next)
Merging bcm2835/for-next (f14234184671 Merge branch 'bcm2835-maintainers-ne=
xt' into for-next)
Merging imx-mxs/for-next (1488dab31b05 Merge branch 'imx/defconfig' into fo=
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
Merging tegra/for-next (9a55272ef4d5 Merge branch for-5.6/clk into for-next)
Merging clk/clk-next (96829978d3b3 Merge branch 'clk-basic-hw' into clk-nex=
t)
Merging clk-samsung/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (89366173a8d0 csky/Kconfig: Add Kconfig.platforms t=
o support some drivers)
Merging h8300/h8300-next (a5de8865cb3e h8300: move definition of __kernel_s=
ize_t etc. to posix_types.h)
Merging ia64/next (240b62d381fe ia64: remove stale paravirt leftovers)
Merging m68k/for-next (bfc7931c4090 m68k: defconfig: Update defconfigs for =
v5.5-rc3)
Merging m68knommu/for-next (c79f46a28239 Linux 5.5-rc5)
Merging microblaze/next (22648c989cb8 microblaze: Increase max dtb size to =
64K from 32K)
Merging mips/mips-next (cc43928ba401 MIPS: BPF: Use sizeof_field() instead =
of FIELD_SIZEOF())
Merging nds32/next (a7f96fce201c MAINTAINERS: add nds32 maintainer)
Merging nios2/for-next (e32ea127d81c nios2: Fix ioremap)
Merging openrisc/for-next (0ecdcaa6d5e7 openrisc: Fix Kconfig indentation)
Merging parisc-hd/for-next (9cf86a639ffd parisc: fix map_pages() to actuall=
y populate upper directory)
Merging powerpc/next (3a9d970f17e0 powerpc/85xx: Get twr_p102x to compile a=
gain)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (6e62bd36e9ad soc: fsl: qe: remove set but not used va=
riable 'mm_gc')
Merging risc-v/for-next (9e9a1ad1ece4 riscv: keep 32-bit kernel to 32-bit p=
hys_addr_t)
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
Merging erofs/dev (4d2024370d87 erofs: fix out-of-bound read for shifted un=
compressed block)
Merging ext3/for_next (614644676394 udf: Update header files to UDF 2.60)
Merging ext4/dev (40eaaeb11758 memcg: fix a crash in wb_workfn when a devic=
e disappears)
Merging f2fs/dev (334eb73797de f2fs: update f2fs document regarding to fsyn=
c_mode)
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
CONFLICT (content): Merge conflict in arch/m68k/kernel/syscalls/syscall.tbl
Applying: fs: fix up for !CONFIG_BLOCK and bmap
Merging printk/for-next (e616b43fb3a3 Merge branch 'for-5.6' into for-next)
Merging pci/next (fdfe7c23ebdc Merge branch 'remotes/lorenzo/pci/dwc')
Merging pstore/for-next/pstore (e163fdb3f7f8 pstore/ram: Regularize prz lab=
el allocation lifetime)
Merging hid/for-next (092670f83a6b Merge branch 'for-5.5/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (e1a2f0475e9d Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i3c/i3c/next (608b68b67a30 MAINTAINERS: fix style in CADENCE I3C MA=
STER IP entry)
Merging dmi/master (2429c99fa13a firmware: dmi: Add dmi_memdev_handle)
Merging hwmon-staging/hwmon-next (ae9ecdb8e643 MAINTAINERS: add entry for A=
DM1177 driver)
Merging jc_docs/docs-next (a1986433a9fd Documentation: filesystems: convert=
 vfat.txt to RST)
Merging v4l-dvb/master (2a0a0bc7020e media: MAINTAINERS: add entry for Rock=
chip ISP1 driver)
Merging v4l-dvb-next/master (d45331b00ddb Linux 5.3-rc4)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (1b8d71a823bf Merge branch 'devprop' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (8ead819f1bef cpufreq: s3c: fix =
unbalances of cpufreq policy refcount)
Merging cpupower/cpupower (e42617b825f8 Linux 5.5-rc1)
Merging opp/opp/linux-next (03758d60265c opp: Replace list_kref with a loca=
l counter)
Merging thermal/thermal/linux-next (1e78ca3b82ac thermal: sun8i: Add hwmon =
support)
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
Merging net-next/master (a442c2c3850d mlx4: Bump up MAX_MSIX from 64 to 128)
Merging bpf-next/master (ac065870d928 selftests/bpf: Add BPF_PROG, BPF_KPRO=
BE, and BPF_KRETPROBE macros)
Merging ipsec-next/master (e27cca96cd68 xfrm: add espintcp (RFC 8229))
CONFLICT (content): Merge conflict in net/unix/af_unix.c
Merging mlx5-next/mlx5-next (ca1992c62cad net/mlx5: Expose vDPA emulation d=
evice capabilities)
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
Merging amdgpu/drm-next (1ffa191f7430 drm/amdgpu/debugfs: properly handle r=
untime pm)
Merging drm-intel/for-linux-next (d713e3ab93fd drm/i915: Correct typo in i9=
15_vma_compress_finish stub)
Merging drm-tegra/drm/tegra/for-next (033ccdb7f6b1 gpu: host1x: Remove dev_=
err() on platform_get_irq() failure)
Merging drm-misc/for-linux-next (8d6cb2f7fb90 drm/drm_panel: fix export of =
drm_panel_of_backlight, try #3)
Merging drm-msm/msm-next (d4bbcade0ef5 drm/msm/dpu: Allow UBWC on NV12)
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (4d24376370fb gpu: ipu-v3: image-convert: only=
 sample into the next tile if necessary)
Merging etnaviv/etnaviv/next (22567d017c2c dt-bindings: etnaviv: Add #cooli=
ng-cells)
Merging regmap/for-next (bd656f968426 Merge branch 'regmap-5.6' into regmap=
-next)
Merging sound/for-next (ff40e0d41af1 ALSA: usb: update old-style static con=
st declaration)
Merging sound-asoc/for-next (b2e2a1379688 Merge branch 'asoc-5.6' into asoc=
-next)
Merging modules/modules-next (f6d061d61712 kernel/module: Fix memleak in mo=
dule_add_modinfo_attrs())
Merging input/next (1bdd3e05a0a3 Merge tag 'v5.5-rc5' into next)
Merging block/for-next (9f2e7e4a0509 Merge branch 'for-5.6/io_uring-vfs' in=
to for-next)
Merging device-mapper/for-next (9872b9e25cef dm writecache: fix incorrect f=
lush sequence when doing SSD mode commit)
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
Merging regulator/for-next (ed7564ea1062 Merge branch 'regulator-5.6' into =
regulator-next)
Merging security/next-testing (45893a0abee6 kexec: Fix file verification on=
 S390)
Merging apparmor/apparmor-next (341c1fda5e17 apparmor: make it so work buff=
ers can be allocated from atomic context)
Merging integrity/next-integrity (ebaebd842e92 ima: Add a space after print=
ing LSM rules for readability)
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
[master e136d833540e] next-20191211/keys
Merging selinux/next (cfff75d8973a selinux: reorder hooks to make runtime d=
isable less broken)
CONFLICT (content): Merge conflict in include/linux/lsm_audit.h
Merging smack/for-next (92604e825304 smack: use GFP_NOFS while holding inod=
e_smack::smk_lock)
Merging tomoyo/master (a8772fad0172 tomoyo: Use atomic_t for statistics cou=
nter)
Merging tpmdd/next (b07f636fca1c Merge tag 'tpmdd-next-20200108' of git://g=
it.infradead.org/users/jjs/linux-tpmdd)
Merging watchdog/master (dcbce5fbcc69 watchdog: orion: fix platform_get_irq=
() complaints)
Merging iommu/next (13ff7f0746fe Merge branches 'iommu/fixes', 'arm/smmu', =
'x86/amd', 'x86/vt-d' and 'core' into next)
Merging vfio/next (7b5372ba04ca vfio: platform: fix __iomem in vfio_platfor=
m_amdxgbe.c)
Merging audit/next (cb5172d96d16 audit: Add __rcu annotation to RCU pointer)
Merging devicetree/for-next (832a9fc944e6 dt: bindings: add vendor prefix f=
or Kamstrup A/S)
Merging mailbox/mailbox-for-next (c6c6bc6ea9fc mailbox: imx: add support fo=
r imx v1 mu)
Merging spi/for-next (811a0fa3e69b Merge branch 'spi-5.6' into spi-next)
Merging tip/auto-latest (425cc0b850aa Merge branch 'irq/core')
Merging clockevents/timers/drivers/next (8c82723414d5 clocksource/drivers/t=
imer-ti-dm: Switch to platform_get_irq)
Merging edac/edac-for-next (a651c6c64431 EDAC/aspeed: Remove unneeded semic=
olon)
Merging irqchip/irq/irqchip-next (c6d732c8cc67 irqchip/aspeed-i2c-ic: Fix i=
rq domain name memory leak)
Merging ftrace/for-next (fe6e096a5bbf tracing: Fix endianness bug in histog=
ram trigger)
Merging rcu/rcu/next (bead35304881 rcu: Add *_ONCE() to rcu_node ->boost_kt=
hread_status)
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
Merging drivers-x86/for-next (4475e6992736 platform/x86: intel_telemetry_de=
bugfs: Respect error code of kstrtou32_from_user())
Merging chrome-platform/for-next (ffd7263e63fe platform/chrome: wilco_ec: F=
ix unregistration order)
Merging hsi/for-next (c1030cd45619 HSI: Remove dev_err() usage after platfo=
rm_get_irq())
Merging leds/for-next (260718b3a35d leds: lm3692x: Disable chip on brightne=
ss 0)
Merging ipmi/for-next (6b8526d3abc0 ipmi:ssif: Handle a possible NULL point=
er reference)
Merging driver-core/driver-core-next (adc92dd4550e debugfs: Fix warnings wh=
en building documentation)
CONFLICT (content): Merge conflict in include/linux/device.h
Merging usb/usb-next (585c91f40d20 usbip: Fix unsafe unaligned pointer usag=
e)
Merging usb-gadget/next (d889cc1c9217 usb: cdns3: add NXP imx8qm glue layer)
CONFLICT (content): Merge conflict in drivers/usb/cdns3/gadget.c
$ git reset --hard HEAD
Merging usb-serial/usb-next (d1eef1c61974 Linux 5.5-rc2)
Merging usb-chipidea-next/ci-for-usb-next (4d6141288c33 usb: chipidea: imx:=
 pinctrl for HSIC is optional)
Merging phy-next/next (e208b00c1d0c dt-bindings: phy: Add PHY_TYPE_DP defin=
ition)
CONFLICT (content): Merge conflict in drivers/phy/mediatek/Kconfig
Merging tty/tty-next (477b83831000 tty/serial: atmel: RS485 & ISO7816: wait=
 for TXRDY before sending data)
Merging char-misc/char-misc-next (16bb7abc4a6b nvmem: core: fix memory abor=
t in cleanup path)
Merging extcon/extcon-next (2ddf50a75dab extcon: sm5502: Remove unneeded se=
micolon)
Merging soundwire/next (b637124800a1 soundwire: stream: remove redundant pr=
_err traces)
Merging thunderbolt/next (c79f46a28239 Linux 5.5-rc5)
Merging staging/staging-next (e895bc1ebb31 staging: vc04_services: remove h=
eader include path to vc04_services)
Merging mux/for-next (f356d58c3a04 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (30c8fa3ec61a interconnect: qcom: Add MSM8916 intercon=
nect provider driver)
Merging slave-dma/next (02939cd16709 dmaengine: imx-sdma: Fix memory leak)
Merging cgroup/for-next (899969b46c28 Merge branch 'for-5.5' into for-next)
Merging scsi/for-next (7b34f400f5e7 Merge branch '5.5/scsi-fixes' into 5.6/=
scsi-next)
CONFLICT (content): Merge conflict in Documentation/core-api/index.rst
Merging scsi-mkp/for-next (7b34f400f5e7 Merge branch '5.5/scsi-fixes' into =
5.6/scsi-next)
Merging vhost/linux-next (d1281e3a562e virtio-blk: remove VIRTIO_BLK_F_SCSI=
 support)
CONFLICT (content): Merge conflict in drivers/block/virtio_blk.c
Merging rpmsg/for-next (447e58a8d18a Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (0dc4997ef739 Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/ven=
dor-prefixes.yaml
Merging gpio-brgl/gpio/for-next (1e4d149e9017 gpio: altera: change to platf=
orm_get_irq_optional to avoid false-positive error)
Merging gpio-intel/for-next (e42617b825f8 Linux 5.5-rc1)
Merging pinctrl/for-next (551f4550b1f8 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (af0c5330916a pinctrl: intel: Pass irqchip w=
hen adding gpiochip)
Merging pinctrl-samsung/for-next (225a2ec19aac pinctrl: samsung: Fix missin=
g OF and GPIOLIB dependency on S3C24xx and S3C64xx)
Merging pwm/for-next (f24e564129f3 pwm: Fix minor Kconfig whitespace issues)
Merging userns/for-next (61a47c1ad3a4 sysctl: Remove the sysctl system call)
Merging ktest/for-next (9b5f852ae20d ktest: Make default build option oldco=
nfig not randconfig)
Merging random/dev (09a6d00a42ce random: remove some dead code of poolinfo)
Merging kselftest/next (46d1a0f03d66 selftests/lkdtm: Add tests for LKDTM t=
argets)
Merging y2038/y2038 (b8c709bf963a Merge tags 'block-ioctl-cleanup-5.6' and =
'y2038-drivers-for-v5.6-signed' of git://git.kernel.org:/pub/scm/linux/kern=
el/git/arnd/playground into HEAD)
Merging livepatching/for-next (7f436b3066e3 Merge branch 'for-5.5/core' int=
o for-next)
Merging coresight/next (ad9882f15884 coresight: etm4x: Fix unused function =
warning)
Merging rtc/rtc-next (d53f9b68b359 rtc: pcf8563: Use BIT)
Merging nvdimm/libnvdimm-for-next (0dfbb932bb67 MAINTAINERS: Remove Keith f=
rom NVDIMM maintainers)
Merging at24/at24/for-next (a99d2c6ccd15 nvmem: fix a 'makes pointer from i=
nteger without a cast' build warning)
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
Merging pidfd/for-next (6c091d9c30aa test: Add test for pidfd getfd)
CONFLICT (content): Merge conflict in include/uapi/asm-generic/unistd.h
CONFLICT (content): Merge conflict in include/linux/syscalls.h
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
Merging devfreq/devfreq-next (91d7f3f8f134 PM / devfreq: exynos: Rename Exy=
nos to lowercase)
Merging hmm/hmm (fd6988496e79 Linux 5.5-rc4)
Merging fpga/for-next (28910cee898c fpga: xilinx-pr-decoupler: Remove clk_g=
et error message for probe defer)
Merging kunit/test (e42617b825f8 Linux 5.5-rc1)
Merging cel/cel-next (a99d8080aaf3 Linux 5.4-rc6)
Merging kasan-bitops/topic/kasan-bitops (4f4afc2c9599 docs/core-api: Remove=
 possibly confusing sub-headings from Bit Operations)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
CONFLICT (content): Merge conflict in drivers/soc/tegra/fuse/tegra-apbmisc.c
CONFLICT (content): Merge conflict in drivers/platform/x86/intel_telemetry_=
pltdrv.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/sfc/efx.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem_gtt.c
Applying: fix up for "drm/i915/gtt: split up i915_gem_gtt"
Applying: fix up for "sfc: move struct init and fini code"
Merging kunit-next/kunit (35c57fc3f8ea kunit: building kunit as a module br=
eaks allmodconfig)
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
Applying: x86-mm-avoid-allocating-struct-mm_struct-on-the-stack-fix
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
Merging akpm/master (36041b3795b7 drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/l=NxHKIM6gnveG_aTan4fHS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4cGPEACgkQAVBC80lX
0Gx5Wgf+KK4/8RXuHYQ8Xyew1I9dfwf0prRTTwMyaJr9Ruhwi6WYNdc8dyE9+67/
1BM/itXV5hMu/dtvCtSZGL8GGuvQlhydXh8r9ne+Tjp6haYLJe589q2NcJk31R/P
GacrtTsK4+u0tzUiaCnmHIAQqISlFBcvtyoVXFVdx9KGoCqTOo4byPdttxi65deR
olmV1sleXBacyNkreAyABspdJY8+ZBPV/RhwQY0BlXbsPpFu2dcpheznIfmlSa/9
5pDKywgZUSbN3g9NO/PAjiJs93DHj2YUMGWVSpNxLOG1MPCaHaAqs2YigszpjQ1g
Q5rzyQFlG9JpOwEmPAmSDX6HVdaorg==
=afml
-----END PGP SIGNATURE-----

--Sig_/l=NxHKIM6gnveG_aTan4fHS--
