Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB89F19075E
	for <lists+linux-next@lfdr.de>; Tue, 24 Mar 2020 09:15:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbgCXIPh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Mar 2020 04:15:37 -0400
Received: from ozlabs.org ([203.11.71.1]:33065 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726673AbgCXIPg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 24 Mar 2020 04:15:36 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48mkZm3J46z9sQt;
        Tue, 24 Mar 2020 19:15:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585037728;
        bh=3WFV01U6g95rQahiXdgXer4rV4R1KM8JRVQiWH7l91c=;
        h=Date:From:To:Cc:Subject:From;
        b=P+Ti+FR6pwd494dQrFr3vPiQM496EyjPxxdrOGr9pFf5r8oKNA8e1HtkKDLCKaj+c
         DWSDFz2y0aghbLWQl/CTWEN8MYYx2OPcWk+3m4OH53mlKDukSTP0IYUKOaR/jGk/M1
         +D1Yo2yR0tQggP7HB+fjf8vnbUM6MP622RI1OQQUiZUQmViPyihp++fwteeYnPIdgD
         AuTbXTT/kNdUe98peE1URAoAatAptBEEGOSOIVshSCE12S3PpgEZkw3Oh3vWqgT4gy
         mVINVBZvctCuI2rS4NT8t8bPd0RnsamuCnylGj7fgw/+YmO4C0+9oOZGzCakRAe8Q9
         8crg8JhkNQ7BA==
Date:   Tue, 24 Mar 2020 19:15:27 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 24
Message-ID: <20200324191527.5e284d00@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7aFmtJv7lZsWhw=GE/Y5FC/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7aFmtJv7lZsWhw=GE/Y5FC/
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20200323:

The hwmon-staging tree lost its build failure.

The thermal tree lost its build failure.

The wireless-drivers-next tree gained a conflict against the
wireless-drivers tree.

The irqchip tree lost its build failure.

Non-merge commits (relative to Linus' tree): 10086
 8435 files changed, 391467 insertions(+), 183775 deletions(-)

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
and sparc64 defconfig and htmldocs. And finally, a simple boot test
of the powerpc pseries_le_defconfig kernel in qemu (with and without
kvm enabled).

Below is a summary of the state of the merge.

I am currently merging 316 trees (counting Linus' and 78 trees of bug
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
Merging origin/master (16fbf79b0f83 Linux 5.6-rc7)
Merging fixes/master (fb33c6510d55 Linux 5.6-rc6)
Merging kbuild-current/fixes (7883a1433929 scripts/kallsyms: fix wrong kall=
syms_relative_base)
Merging arc-current/for-curr (f09d3174f002 ARC: allow userspace DSP applica=
tions to use AGU extensions)
Merging arm-current/fixes (89604523a76e ARM: 8961/2: Fix Kbuild issue cause=
d by per-task stack protector GCC plugin)
Merging arm-soc-fixes/arm/fixes (d4d89e25fc7b Merge tag 'socfpga_defconfig_=
fix_for_v5.6' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/lin=
ux into arm/fixes)
Merging arm64-fixes/for-next/fixes (6f5459da2b87 arm64: alternative: fix bu=
ild with clang integrated assembler)
Merging m68k-current/for-linus (6aabc1facdb2 m68k: Implement copy_thread_tl=
s())
Merging powerpc-fixes/fixes (1d0c32ec3b86 KVM: PPC: Fix kernel crash with P=
R KVM)
Merging s390-fixes/fixes (9218b36d767a s390/diag: fix display of diagnose c=
all statistics)
Merging sparc/master (11648b8339f8 sparc64: fix adjtimex regression)
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (6cd6cbf593bf tcp: repair: fix TCP_QUEUE_SEQ implementat=
ion)
Merging bpf/master (5c6f25887963 bpf: Explicitly memset some bpf info struc=
tures declared on the stack)
Merging ipsec/master (2a9de3af21aa vti6: Fix memory leak of skb if input po=
licy check fails)
Merging netfilter/master (749f6f684311 net: phy: dp83867: w/a for fld detec=
t threshold bootstrapping issue)
Merging ipvs/master (c24b75e0f923 ipvs: move old_secure_tcp into struct net=
ns_ipvs)
Merging wireless-drivers/master (0433ae556ec8 iwlwifi: don't send GEO_TX_PO=
WER_LIMIT if no wgds table)
Merging mac80211/master (2de9780f7507 net: core: dev.c: fix a documentation=
 warning)
Merging rdma-fixes/for-rc (941224e09483 IB/rdmavt: Free kernel completion q=
ueue when done)
Merging sound-current/for-linus (e9097e47e349 ALSA: hda/ca0132 - Add Recon3=
Di quirk to handle integrated sound on EVGA X99 Classified motherboard)
Merging sound-asoc-fixes/for-linus (c11093efd347 Merge branch 'asoc-5.6' in=
to asoc-linus)
Merging regmap-fixes/for-linus (87fc8230f7aa Merge branch 'regmap-5.6' into=
 regmap-linus)
Merging regulator-fixes/for-linus (d4eac2fc150b Merge branch 'regulator-5.6=
' into regulator-linus)
Merging spi-fixes/for-linus (fb33c6510d55 Linux 5.6-rc6)
Merging pci-current/for-linus (5901b51f3e5d MAINTAINERS: Correct Cadence PC=
I driver path)
Merging driver-core.current/driver-core-linus (2c523b344dfa Linux 5.6-rc5)
Merging tty.current/tty-linus (16fbf79b0f83 Linux 5.6-rc7)
Merging usb.current/usb-linus (16fbf79b0f83 Linux 5.6-rc7)
Merging usb-gadget-fixes/fixes (42cd5ffe46c1 usb: dwc3: debug: fix string p=
osition formatting mixup with ret and len)
Merging usb-serial-fixes/usb-linus (cecc113c1af0 USB: serial: pl2303: add d=
evice-id for HP LD381)
Merging usb-chipidea-fixes/ci-for-usb-stable (7cbf3dd3139a usb: chipidea: u=
dc: fix sleeping function called from invalid context)
Merging phy/fixes (be4e3c737eeb phy: mapphone-mdm6600: Fix timeouts by addi=
ng wake-up handling)
Merging staging.current/staging-linus (16fbf79b0f83 Linux 5.6-rc7)
Merging char-misc.current/char-misc-linus (16fbf79b0f83 Linux 5.6-rc7)
Merging soundwire-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging thunderbolt-fixes/fixes (16fbf79b0f83 Linux 5.6-rc7)
Merging input-current/for-linus (3b059da9835c Input: allocate keycode for "=
Selective Screenshot" key)
Merging crypto-current/master (c8cfcb78c658 crypto: arm64/chacha - correctl=
y walk through blocks)
Merging ide/master (94f2630b1897 Merge tag '5.6-rc-small-smb3-fix-for-stabl=
e' of git://git.samba.org/sfrench/cifs-2.6)
Merging vfio-fixes/for-linus (95f89e090618 vfio/type1: Initialize resv_msi_=
base)
Merging kselftest-fixes/fixes (f3a60268f5ce selftest/lkdtm: Use local .giti=
gnore)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging slave-dma-fixes/fixes (018af9be3dd5 dmaengine: ti: k3-udma-glue: Fi=
x an error handling path in 'k3_udma_glue_cfg_rx_flow()')
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (def9d2780727 Linux 5.5-rc7)
Merging mfd-fixes/for-mfd-fixes (603d9299da32 mfd: mt6397: Fix probe after =
changing mt6397-core)
Merging v4l-dvb-fixes/fixes (8077f8157271 media: Fix build failure due to m=
issing select REGMAP_I2C)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (f7d5f5655ef7 MAINTAINERS: Correct MIPS patch=
work URL)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (dfa7ea303f56 ARM: dts: omap5: Add bus_dma_limit f=
or L3 bus)
Merging kvm-fixes/master (428b8f1d9f92 KVM: VMX: don't allow memory operand=
s for inline asm that modifies SP)
Merging kvms390-fixes/master (e93fc7b4544a KVM: s390: Also reset registers =
in sync regs for initial cpu reset)
Merging hwmon-fixes/hwmon (2c523b344dfa Linux 5.6-rc5)
Merging nvdimm-fixes/libnvdimm-fixes (f84afbdd3a9e libnvdimm: Out of bounds=
 read in __nd_ioctl())
Merging btrfs-fixes/next-fixes (f5bf9a8fa525 Merge branch 'misc-5.6' into n=
ext-fixes)
Merging vfs-fixes/fixes (d9a9f4849fe0 cifs_atomic_open(): fix double-put on=
 late allocation failure)
Merging dma-mapping-fixes/for-linus (9c24eaf81cc4 iommu/vt-d: Return the co=
rrect dma mask when we are bypassing the IOMMU)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (f8788d86ab28 Linux 5.6-rc3)
Merging samsung-krzk-fixes/fixes (0d935f0bf77d ARM: dts: exynos: Fix regula=
tor node aliasing on Midas-based boards)
Merging pinctrl-samsung-fixes/pinctrl-fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging devicetree-fixes/dt/linus (35595372d95c Remove redundant YYLOC glob=
al declaration)
Merging scsi-fixes/fixes (78c3e5e6cde8 scsi: qla2xxx: Fix I/Os being passed=
 down when FC device is being deleted)
Merging drm-fixes/drm-fixes (16fbf79b0f83 Linux 5.6-rc7)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (16fbf79b0f83 Linux 5.6-rc7)
Merging mmc-fixes/fixes (4686392c3236 mmc: rtsx_pci: Fix support for speed-=
modes that relies on tuning)
Merging rtc-fixes/rtc-fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging gnss-fixes/gnss-linus (f8788d86ab28 Linux 5.6-rc3)
Merging hyperv-fixes/hyperv-fixes (032d4a480220 hv: hyperv_vmbus.h: Replace=
 zero-length array with flexible-array member)
Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq h=
andlers after dpio create)
Merging risc-v-fixes/fixes (3384b043ea15 riscv: fix the IPI missing issue i=
n nommu mode)
Merging pidfd-fixes/fixes (10dab84caf40 pid: make ENOMEM return value more =
obvious)
Merging fpga-fixes/fixes (dec43da46f63 fpga: altera-ps-spi: Fix getting of =
optional confd gpio)
Merging spdx/spdx-linus (bb6d3fb354c5 Linux 5.6-rc1)
Merging gpio-intel-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging pinctrl-intel-fixes/fixes (16fbf79b0f83 Linux 5.6-rc7)
Merging erofs-fixes/fixes (d1eef1c61974 Linux 5.5-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (b216a8e7908c drm/lease: fix WA=
RNING in idr_destroy)
Merging kspp-gustavo/for-next/kspp (d5180902be1c firmware: google: vpd: Rep=
lace zero-length array with flexible-array member)
Merging kbuild/for-next (3a9dd3ecb207 kconfig: make 'imply' obey the direct=
 dependency)
Merging compiler-attributes/compiler-attributes (98d54f81e36b Linux 5.6-rc4)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (fd27a526bb38 ARM/dma-mapping: merge __dma_sup=
ported into arm_dma_supported)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (52d3b2f98483 Merge branch 'devel-stable' into for-nex=
t)
Merging arm64/for-next/core (3f6c690f5dfe Merge branch 'for-next/asm-cleanu=
ps' into for-next/core)
Merging arm-perf/for-next/perf (8673e02e5841 arm64: perf: Add support for A=
RMv8.5-PMU 64-bit counters)
Merging arm-soc/for-next (09e7f9a4c8e2 Merge branch 'arm/fixes' into for-ne=
xt)
Merging amlogic/for-next (22f8bc15492d Merge branch 'v5.7/drivers' into tmp=
/aml-rebuild)
Merging aspeed/for-next (de285b938cf3 ARM: dts: aspeed: ast2600: Fix SCU IR=
Q controller nodes)
Merging at91/at91-next (ec539e70d882 Merge branches 'at91-soc', 'at91-dt' a=
nd 'at91-defconfig' into at91-next)
Merging imx-mxs/for-next (e506dba69a5e Merge branch 'imx/defconfig' into fo=
r-next)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging keystone/next (560b4d4691b0 Merge branch 'for_5.7/keystone-dts' int=
o next)
Merging mediatek/for-next (28f0b8961045 Merge branch 'v5.6-next/soc' into f=
or-next)
Merging mvebu/for-next (912e10bb5888 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (babf67165e40 Merge branch 'fixes' into for-next)
Merging qcom/for-next (8dc3769c8a68 Merge branches 'arm64-for-5.7', 'arm64-=
defconfig-for-5.7', 'defconfig-for-5.7', 'drivers-for-5.7' and 'dts-for-5.7=
' into for-next)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging raspberrypi/for-next (d886ff4d2a6a ARM: dts: bcm2711: Move emmc2 in=
to its own bus)
Merging realtek/for-next (45698e00d5a9 Merge branch 'v5.6/dt' into next)
Merging renesas/next (bf4540d5148c Merge branch 'renesas-arm64-dt-for-v5.7'=
 into renesas-next)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging reset/reset/next (2ebf89fd4ecf reset: hi6220: Add support for AO re=
set controller)
Merging rockchip/for-next (c018aff1a201 Merge branch 'v5.7-armsoc/dts64' in=
to for-next)
Merging samsung-krzk/for-next (e3817a417748 Merge branch 'next/dt-late' int=
o for-next)
Merging scmi/for-linux-next (b48c74f4e139 Merge tag 'scmi-updates-5.7' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging sunxi/sunxi/for-next (8afff9da61ea Merge branch 'sunxi/dt-for-5.7' =
into sunxi/for-next)
Merging tegra/for-next (df0a178cf2df Merge branch for-5.7/usb into for-next)
Merging clk/clk-next (1e00779a1fab Merge branch 'clk-mmp2' into clk-next)
Merging clk-samsung/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (0ef5b782a807 csky: Enable the gcov function in csk=
y achitecture)
Merging h8300/h8300-next (a5de8865cb3e h8300: move definition of __kernel_s=
ize_t etc. to posix_types.h)
Merging ia64/next (172e7890406d tty/serial: cleanup after ioc*_serial drive=
r removal)
Merging m68k/for-next (86cded5fc525 m68k: defconfig: Update defconfigs for =
v5.6-rc4)
Merging m68knommu/for-next (ba000760eb0f m68k: Replace setup_irq() by reque=
st_irq())
Merging microblaze/next (9fd1a1c9b3f2 microblaze: Replace setup_irq() by re=
quest_irq())
Merging mips/mips-next (be8fa1cb444c MIPS: Add support for Desktop Manageme=
nt Interface (DMI))
Merging nds32/next (d785c5a324cd nds32: configs: Cleanup CONFIG_CROSS_COMPI=
LE)
Merging nios2/for-next (051d75d3bb31 MAINTAINERS: Update Ley Foon Tan's ema=
il address)
Merging openrisc/for-next (9737e2c5f0bc openrisc: Remove obsolete show_trac=
e_task function)
Merging parisc-hd/for-next (8a29e21d8cb0 parisc: Replace setup_irq() by req=
uest_irq())
Merging powerpc/next (59ed2adf3931 powerpc/lib: Fix emulate_step() std test)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (6a7f10c79574 soc: fsl: dpio: fix dereference of point=
er p before null check)
Merging risc-v/for-next (9f40b6e77d2f RISC-V: Move all address space defini=
tion macros to one place)
Merging sifive/for-next (467e050e9760 Merge branch 'i2c/for-current' of git=
://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging s390/features (3cc7c927102d s390/ap: Remove ap device suspend and r=
esume callbacks)
Merging sh/sh-next (a193018e5290 sh: add missing EXPORT_SYMBOL() for __dela=
y)
Merging sparc-next/master (b71acb0e3721 Merge branch 'linus' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging uml/linux-next (d65197ad5249 um: Fix time-travel=3Dinf-cpu with xor=
/raid6)
Merging xtensa/xtensa-for-next (2ef7e1268525 Merge branch 'xtensa-5.6-fixes=
' into xtensa-for-next)
Merging fscrypt/master (861261f2a9cc ubifs: wire up FS_IOC_GET_ENCRYPTION_N=
ONCE)
Merging afs/afs-next (4fe171bb81b1 afs: Remove set but not used variable 'r=
et')
Merging btrfs/for-next (cbcef89c499e Merge branch 'for-next-next-v5.6-20200=
313' into for-next-20200313)
Merging ceph/master (4d75036f478f rbd: don't mess with a page vector in rbd=
_notify_op_lock())
Merging cifs/for-next (97adda8b3ab7 CIFS: Fix bug which the return value by=
 asynchronous read is error)
Merging configfs/for-next (e2f238f7d5a1 configfs: calculate the depth of pa=
rent item)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (aa99a76b40d6 erofs: handle corrupted images whose decomp=
ressed size less than it'd be)
Merging ext3/for_next (44a52022e7f1 ext2: fix empty body warnings when -Wex=
tra is used)
Merging ext4/dev (dce8e237100f ext4: fix a data race at inode->i_disksize)
Merging f2fs/dev (e36d8816848a f2fs: fix potential .flags overflow on 32bit=
 architecture)
Merging fsverity/fsverity (98d54f81e36b Linux 5.6-rc4)
Merging fuse/for-next (3e8cb8b2eaeb fuse: fix stack use after return)
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (8605cf0e852a NFS: direct.c: Fix memory leak of dreq=
 when nfs_get_lock_context fails)
Merging nfs-anna/linux-next (55dee1bc0d72 nfs: add minor version to nfs_ser=
ver_key for fscache)
Merging nfsd/nfsd-next (2653de9f0398 fs: nfsd: fileache.c: Use built-in RCU=
 list checking)
Merging orangefs/for-next (9f198a2ac543 help_next should increase position =
index)
Merging overlayfs/overlayfs-next (a5a84682ecb6 ovl: fix a typo in comment)
Merging ubifs/linux-next (fe357dbae113 ubi: Fix an error pointer dereferenc=
e in error handling code)
Merging v9fs/9p-next (79fb9216b7be 9p: Remove unneeded semicolon)
Merging xfs/for-next (693639994b13 xfs: remove xlog_state_want_sync)
Merging zonefs/for-next (0dda2ddb7ded zonefs: select FS_IOMAP)
Merging iomap/iomap-for-next (d9973ce2fe5b iomap: fix comments in iomap_dio=
_rw)
Merging djw-vfs/vfs-for-next (56939e014a6c hibernate: Allow uswsusp to writ=
e to swap)
Merging file-locks/locks-next (dbdaf6a3250b locks: reinstate locks_delete_b=
lock optimization)
Merging vfs/for-next (f7022488c8c1 Merge branches 'work.exfat' and 'work.do=
tdot' into for-next)
Merging printk/for-next (d34f14ae521f Merge branch 'for-5.7-preferred-conso=
le' into for-next)
Merging pci/next (ebcc830b29d7 Merge branch 'remotes/lorenzo/pci/vmd')
Merging pstore/for-next/pstore (8128d3aac0ee pstore/ram: Replace zero-lengt=
h array with flexible-array member)
Merging hid/for-next (c2320c3ee0e6 Merge branch 'for-5.6/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (269c216ad2ca Merge branch 'i2c/for-5.7' into i2c/=
for-next)
Merging i3c/i3c/next (cd851485ef29 i3c: master: Replace zero-length array w=
ith flexible-array member)
Merging dmi/master (6eaaa9e89719 firmware/dmi: Report DMI Bios & EC firmwar=
e release)
Merging hwmon-staging/hwmon-next (5b10a8194664 docs: hwmon: Update document=
ation for isl68137 pmbus driver)
Merging jc_docs/docs-next (19e91e543c82 MAINTAINERS: adjust to filesystem d=
oc ReST conversion)
CONFLICT (content): Merge conflict in MAINTAINERS
CONFLICT (content): Merge conflict in Documentation/kbuild/index.rst
CONFLICT (content): Merge conflict in Documentation/filesystems/zonefs.rst
CONFLICT (content): Merge conflict in Documentation/filesystems/proc.rst
Merging v4l-dvb/master (af72bc8cd6ab media: siano: Use scnprintf() for avoi=
ding potential buffer overflow)
Merging v4l-dvb-next/master (54ecb8f7028c Linux 5.4-rc1)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (c6e2eb7ccc3d Merge branch 'pnp' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (a8811ec764f9 cpufreq: qcom: Add=
 support for krait based socs)
Merging cpupower/cpupower (2de7fb60a474 cpupower: avoid multiple definition=
 with gcc -fno-common)
Merging opp/opp/linux-next (03758d60265c opp: Replace list_kref with a loca=
l counter)
Merging thermal/thermal/linux-next (ba53cb499706 thermal: imx8mm: Add i.MX8=
MP support)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (a48f9721e6db dlm: no need to check return value of debugf=
s_create functions)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (fa8a44f6b245 RDMA/efa: Use in-kernel offsetofend() t=
o check field availability)
Merging net-next/master (6919a8264a32 Crypto/chtls: add/delete TLS header i=
n driver)
CONFLICT (content): Merge conflict in fs/sysfs/group.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/amazon/ena/ena_n=
etdev.c
Merging bpf-next/master (aa5e2af660fc samples, bpf: Refactor perf_event use=
r program with libbpf bpf_link)
Merging ipsec-next/master (dda520c4d462 ESP: Export esp_output_fill_trailer=
 function)
Merging mlx5-next/mlx5-next (826096d84f50 mlx5: Remove uninitialized use of=
 key in mlx5_core_create_mkey)
Merging netfilter-next/master (dc264f1f7ece netfilter: flowtable: fix NULL =
pointer dereference in tunnel offload support)
Merging ipvs-next/master (d54725cd11a5 netfilter: nf_tables: support for mu=
ltiple devices per netdev hook)
Merging wireless-drivers-next/master (8d4ccd7770e7 rtl8xxxu: Fix sparse war=
ning: cast from restricted __le16)
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/pc=
ie/drv.c
Merging bluetooth/master (2d186fcd6d8d Bluetooth: Fix incorrect branch in c=
onnection complete)
Merging mac80211-next/master (09984483db08 mptcp: Remove set but not used v=
ariable 'can_ack')
Merging gfs2/for-next (490031281d5a gfs2: Additional information when gfs2_=
ail1_flush withdraws)
Merging mtd/mtd/next (4da0ea71ea93 mtd: lpddr: Fix a double free in probe())
Merging nand/nand/next (9f9ae0c253c1 mtd: spinand: micron: Add new Micron S=
PI NAND devices with multiple dies)
Merging spi-nor/spi-nor/next (5bb783cc92f0 mtd: spi-nor: controllers: aspee=
d-smc: Replace zero-length array with flexible-array member)
Merging crypto/master (f6913d040c8d crypto: chelsio - remove set but not us=
ed variable 'adap')
Merging drm/drm-next (cb7adfd6ad12 Merge tag 'mediatek-drm-next-5.7' of htt=
ps://github.com/ckhu-mediatek/linux.git-tags into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gvt/vgpu.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gvt/display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_lrc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.c
CONFLICT (content): Merge conflict in arch/arm/configs/omap2plus_defconfig
Merging amdgpu/drm-next (ccc9b5c40c99 drm/amdgpu/smu11: add support for SMU=
 AC/DC interrupts)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.c
Merging drm-intel/for-linux-next (cb7adfd6ad12 Merge tag 'mediatek-drm-next=
-5.7' of https://github.com/ckhu-mediatek/linux.git-tags into drm-next)
Merging drm-tegra/drm/tegra/for-next (e32c8c2a5fbe drm/tegra: hdmi: Silence=
 deferred-probe error)
Merging drm-misc/for-linux-next (6afe6929964b drm: Mark up racy check of dr=
m_gem_object.handle_count)
Merging drm-msm/msm-next (a5fb8b918920 drm/msm/a6xx: Use the DMA API for GM=
U memory objects)
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/hdmi/hdmi.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/edp/edp.c
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (2c76b324c794 drm/imx: parallel-display: Adjus=
t bus_flags handling)
Merging etnaviv/etnaviv/next (f232d9ec029c drm/etnaviv: fix TS cache flushi=
ng on GPUs with BLT engine)
Merging regmap/for-next (2060986f04ad Merge branch 'regmap-5.7' into regmap=
-next)
Merging sound/for-next (c208a5335036 ALSA: core: Add snd_device_get_state()=
 helper)
Merging sound-asoc/for-next (6544c779e849 Merge branch 'asoc-5.7' into asoc=
-next)
Merging modules/modules-next (0f74226649fb kernel: module: Replace zero-len=
gth array with flexible-array member)
Merging input/next (061706716384 Input: elants_i2c - report resolution info=
rmation for touch major)
Merging block/for-next (b73b419e10a5 Merge branch 'for-5.7/io_uring' into f=
or-next)
Merging device-mapper/for-next (636be4241bdd dm: bump version of core and v=
arious targets)
Merging pcmcia/pcmcia-next (6d3fbe919b83 pcmcia: Use scnprintf() for avoidi=
ng potential buffer overflow)
Merging mmc/next (f762690c723e Merge branch 'fixes' into next)
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (1129d6145ed5 mfd: Add support for Azoteq IQS620A/=
621/622/624/625)
Merging backlight/for-backlight-next (7af43a76695d backlight: qcom-wled: Fi=
x unsigned comparison to zero)
Merging battery/for-next (f78c55e3b480 power: reset: sc27xx: Allow the SC27=
XX poweroff driver building into a module)
Merging regulator/for-next (c013e39f4fbb Merge branch 'regulator-5.7' into =
regulator-next)
Merging security/next-testing (3e27a33932df security: remove duplicated inc=
lude from security.h)
Merging apparmor/apparmor-next (01df52d726b5 apparmor: remove duplicate che=
ck of xattrs on profile attachment.)
Merging integrity/next-integrity (9e2b4be377f0 ima: add a new CONFIG for lo=
ading arch-specific policies)
Merging keys/keys-next (43672cf93c6d Merge branch 'notifications-pipe-core'=
 into keys-next)
CONFLICT (content): Merge conflict in fs/pipe.c
Applying: io_uring: fix up for get_pipe_info() API change
Merging selinux/next (28d4d0e16f09 When using NFSv4.2, the security label f=
or the root inode should be set via a call to nfs_setsecurity() during the =
mount process, otherwise the inode will appear as unlabeled for up to acdir=
min seconds.  Currently the label for the root inode is allocated, retrieve=
d, and freed entirely witin nfs4_proc_get_root().)
CONFLICT (content): Merge conflict in security/selinux/hooks.c
Merging smack/for-next (92604e825304 smack: use GFP_NOFS while holding inod=
e_smack::smk_lock)
Merging tomoyo/master (bb6d3fb354c5 Linux 5.6-rc1)
Merging tpmdd/next (2e356101e72a KEYS: reaching the keys quotas correctly)
Merging watchdog/master (f667421324ed watchdog: npcm: remove whitespaces)
Merging iommu/next (cdce0c035f07 Merge branches 'iommu/fixes', 'arm/qcom', =
'arm/omap', 'arm/smmu', 'x86/amd', 'virtio' and 'core' into next)
Merging vfio/next (7b5372ba04ca vfio: platform: fix __iomem in vfio_platfor=
m_amdxgbe.c)
Merging audit/next (1320a4052ea1 audit: trigger accompanying records when n=
o rules present)
Merging devicetree/for-next (ac5fe2e6d824 ARM: dts: sunxi: Fix dtc 'dma-ran=
ges' warnings)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/usb=
/generic.txt
Merging mailbox/mailbox-for-next (0a67003b1985 mailbox: imx: add SCU MU sup=
port)
Merging spi/for-next (d70e669eadf1 Merge branch 'spi-5.7' into spi-next)
Merging tip/auto-latest (b9eea797a6d8 Merge branch 'perf/core')
CONFLICT (content): Merge conflict in include/linux/arch_topology.h
CONFLICT (content): Merge conflict in arch/x86/Kconfig
CONFLICT (content): Merge conflict in arch/arm64/Kconfig
Applying: Revert "tick/common: Make tick_periodic() check for missing ticks"
Merging clockevents/timers/drivers/next (4f41fe386a94 clocksource/drivers/t=
imer-probe: Avoid creating dead devices)
Merging edac/edac-for-next (ad49d9a8228e Merge branch 'edac-misc' into edac=
-for-next)
Merging irqchip/irq/irqchip-next (f9bde2326cef Merge branch 'irq/gic-v4.1' =
into irq/irqchip-next)
Applying: Revert "irqchip/xilinx: Do not call irq_set_default_host()"
Applying: Revert "irqchip/xilinx: Enable generic irq multi handler"
Merging ftrace/for-next (bbd9d05618a6 gpu/trace: add a gpu total memory usa=
ge tracepoint)
Merging rcu/rcu/next (59bc8fd15ce6 rcu-tasks: Add count for idle tasks on o=
ffline CPUs)
Merging kvm/linux-next (1c482452d5db Merge tag 'kvm-s390-next-5.7-1' of git=
://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging kvm-arm/next (3da850b6d6a6 Merge remote-tracking branch 'origin/kvm=
-arm64/gic-v4.1' into kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (6fef0c6bbe49 KVM: PPC: Kill kvmppc_ops::mmu_d=
estroy() and kvmppc_mmu_destroy())
Merging kvms390/next (f3dd18d444c7 KVM: s390: mark sie block as 512 byte al=
igned)
Merging xen-tip/linux-next (e63de44d28ca xen/xenbus: remove unused xenbus_m=
ap_ring())
Merging percpu/for-next (cfe2a689f755 Merge branch 'for-5.7' into for-next)
Merging workqueues/for-next (4acf8a423cd3 Merge branch 'for-5.7' into for-n=
ext)
Merging drivers-x86/for-next (267fc714cab7 platform/x86: intel_pmc_core: Ma=
ke pmc_core_lpm_display() generic for platforms that support sub-states)
Merging chrome-platform/for-next (e0db7c42b05f platform/chrome: wilco_ec: e=
vent: Replace zero-length array with flexible-array member)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (10a6cce3c1a1 Group LED functions according to functi=
onality, and add some explaining comments.)
Merging ipmi/for-next (26455d00ee58 drivers: char: ipmi: ipmi_msghandler: P=
ass lockdep expression to RCU lists)
Merging driver-core/driver-core-next (4dbe191c046e driver core: Add device =
links from fwnode only for the primary device)
CONFLICT (content): Merge conflict in drivers/platform/x86/Kconfig
Merging usb/usb-next (d2e971d884e7 Merge 5.6-rc7 into usb-next)
Merging usb-gadget/next (4a5dbd900957 dt-bindings: usb: add documentation f=
or aspeed usb-vhub)
Merging usb-serial/usb-next (33a6b48a5748 USB: serial: f81232: add control =
driver for F81534A)
Merging usb-chipidea-next/ci-for-usb-next (d9958306d4be USB: chipidea: Use =
the correct style for SPDX License Identifier)
Merging phy-next/next (89d715371a05 phy: qcom-qusb2: Add new overriding tun=
ing parameters in QUSB2 V2 PHY)
Merging tty/tty-next (cbf580ff0938 Merge 5.6-rc7 into tty-next)
Merging char-misc/char-misc-next (baca54d956f7 Merge 5.6-rc7 into char-misc=
-next)
Merging extcon/extcon-next (acfa505ca1c3 extcon: Mark extcon_get_edev_name(=
) function as exported symbol)
Merging soundwire/next (39ec6f992131 soundwire: qcom: add support for get_s=
dw_stream())
Merging thunderbolt/next (3010518964dc thunderbolt: Use scnprintf() for avo=
iding potential buffer overflow)
Merging staging/staging-next (6203da980301 Merge 5.6-rc7 into staging-next)
CONFLICT (content): Merge conflict in drivers/staging/media/allegro-dvt/all=
egro-core.c
CONFLICT (modify/delete): drivers/staging/exfat/Kconfig deleted in staging/=
staging-next and modified in HEAD. Version HEAD of drivers/staging/exfat/Kc=
onfig left in tree.
CONFLICT (content): Merge conflict in MAINTAINERS
$ git rm -f drivers/staging/exfat/Kconfig
Applying: fix up for "staging: Replace zero-length array with flexible-arra=
y member"
Merging mux/for-next (f356d58c3a04 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (03c4e6186bbb interconnect: qcom: Add OSM L3 support o=
n SC7180)
Merging slave-dma/next (6697255f239f dmaengine: tegra-apb: Improve DMA sync=
hronization)
CONFLICT (content): Merge conflict in drivers/dma/ti/k3-udma.c
Merging cgroup/for-next (6fc331767f41 Merge branch 'for-5.7' into for-next)
Merging scsi/for-next (d04d18197cf5 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (9b88984658fb scsi: pm80xx: Introduce read and wr=
ite length for IOCTL payload structure)
Merging vhost/linux-next (d40662d5f12b virtio-net: Introduce hash report fe=
ature)
Merging rpmsg/for-next (2bbad2db0749 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (ef0c1aed2459 Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (8afb2c17f830 tools: gpio: Fix typo in gpio=
-utils)
Merging gpio-intel/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging pinctrl/for-next (ab5644db943f Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging pinctrl-samsung/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging pwm/for-next (9871abffc810 pwm: Remove set but not set variable 'pw=
m')
Merging userns/for-next (a0d4a141750d Proc mount option handling is broken,=
 and it has been since I accidentally broke it in the middle 2016.)
CONFLICT (content): Merge conflict in kernel/pid.c
Merging ktest/for-next (1091c8fce8aa ktest: Fix typos in ktest.pl)
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (fb0bb3952401 selftests: android: Fix custom install=
 from skipping test progs)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (d28b4c1b2b3d Merge branch 'for-5.6/selftests=
' into for-next)
Merging coresight/next (ed0efaa66ad8 docs: trace: coresight-ect.rst: fix a =
build warning)
Merging rtc/rtc-next (f9b2a4d6a5f1 rtc: class: support hctosys from modular=
 RTC drivers)
Merging nvdimm/libnvdimm-for-next (6ab3463a5fcd Merge branch 'for-5.6/libnv=
dimm-space-align' into libnvdimm-for-next)
Merging at24/at24/for-next (4837621cd61e eeprom: at24: add TPF0001 ACPI ID =
for 24c1024 device)
Merging ntb/ntb-next (b350f0a3eb26 NTB: add pci shutdown handler for AMD NT=
B)
Merging kspp/for-next/kspp (c79f46a28239 Linux 5.5-rc5)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (f8788d86ab28 Linux 5.6-rc3)
Merging fsi/next (2c01397b71c5 fsi: aspeed: Fix OPB0 byte order register va=
lues)
CONFLICT (content): Merge conflict in drivers/fsi/Kconfig
Merging slimbus/for-next (ba1589ff458e slimbus: ngd: add v2.1.0 compatible)
Merging nvmem/for-next (29ef5f00d1b4 nvmem: Add support for write-only inst=
ances)
Merging xarray/xarray (7e934cf5ace1 xarray: Fix early termination of xas_fo=
r_each_marked)
Merging hyperv/hyperv-next (cb489303edd7 hv: hyperv_vmbus.h: Replace zero-l=
ength array with flexible-array member)
Merging auxdisplay/auxdisplay (2f920c0f0e29 auxdisplay: charlcd: replace ze=
ro-length array with flexible-array member)
Merging kgdb/kgdb/for-next (5ea771abd5a3 kdb: Censor attempts to set PROMPT=
 without ENABLE_MEM_READ)
Merging pidfd/for-next (8d19f1c8e193 prctl: PR_{G,S}ET_IO_FLUSHER to suppor=
t controlling memory reclaim)
Merging devfreq/devfreq-next (d8923c0e8822 PM / devfreq: Fix handling dev_p=
m_qos_remove_request result)
Merging hmm/hmm (0f2ef2af24e4 mm/hmm: check the device private page owner i=
n hmm_range_fault())
Merging fpga/for-next (3d5a5417ad06 fpga: dfl: afu: support debug access to=
 memory-mapped afu regions)
Merging kunit/test (bb6d3fb354c5 Linux 5.6-rc1)
Merging cel/cel-next (69afd267982e nfsd: fsnotify on rmdir under nfsd/clien=
ts/)
CONFLICT (content): Merge conflict in net/sunrpc/cache.c
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (b6fe8bc67d2d mtd: hyperbus: move direct mapping setup=
 to AM654 HBMC driver)
Merging kunit-next/kunit (0476e69f3937 kunit: add --make_options)
Merging trivial/for-next (fad7c9020948 err.h: remove deprecated PTR_RET for=
 good)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging akpm-current/current (ed2d96bf85bf ipc/mqueue.c: fix a brace coding=
 style issue)
CONFLICT (content): Merge conflict in arch/x86/include/asm/pgtable_types.h
CONFLICT (content): Merge conflict in arch/x86/Kconfig
CONFLICT (content): Merge conflict in arch/microblaze/include/asm/Kbuild
CONFLICT (content): Merge conflict in arch/m68k/include/asm/Kbuild
$ git checkout -b akpm remotes/origin/akpm/master
Applying: bus/mhi: fix printk format for size_t
Applying: Change email address for Pali Roh=C3=A1r
Applying: mm/kmemleak: silence KCSAN splats in checksum
Applying: psi: move PF_MEMSTALL out of task->flags
Applying: drivers/dma/tegra20-apb-dma.c: fix platform_get_irq.cocci warnings
Applying: mm/frontswap: mark various intentional data races
Applying: mm/page_io: mark various intentional data races
Applying: mm-page_io-mark-various-intentional-data-races-v2
Applying: mm/swap_state: mark various intentional data races
Applying: mm/filemap.c: fix a data race in filemap_fault()
Applying: mm/swapfile: fix and annotate various data races
Applying: mm-swapfile-fix-and-annotate-various-data-races-v2
Applying: mm/page_counter: fix various data races at memsw
Applying: mm/memcontrol: fix a data race in scan count
Applying: mm/list_lru: fix a data race in list_lru_count_one
Applying: mm/mempool: fix a data race in mempool_free()
Applying: mm/util.c: annotate an data race at vm_committed_as
Applying: mm/rmap: annotate a data race at tlb_flush_batched
Applying: mm: annotate a data race in page_zonenum()
Applying: mm/swap.c: annotate data races for lru_rotate_pvecs
Applying: mm/memory.c: refactor insert_page to prepare for batched-lock ins=
ert
Applying: mm: bring sparc pte_index() semantics inline with other platforms
Applying: mm: define pte_index as macro for x86
Applying: mm/memory.c: add vm_insert_pages()
Applying: mm-add-vm_insert_pages-fix
Applying: add missing page_count() check to vm_insert_pages().
Applying: mm: vm_insert_pages() checks if pte_index defined.
Applying: net-zerocopy: use vm_insert_pages() for tcp rcv zerocopy
Applying: net-zerocopy-use-vm_insert_pages-for-tcp-rcv-zerocopy-fix
Applying: mm/vma: define a default value for VM_DATA_DEFAULT_FLAGS
Applying: mm/vma: introduce VM_ACCESS_FLAGS
Applying: mm/memory_hotplug: drop the flags field from struct mhp_restricti=
ons
Applying: mm/memory_hotplug: rename mhp_restrictions to mhp_params
Applying: x86/mm: thread pgprot_t through init_memory_mapping()
Applying: x86/mm: introduce __set_memory_prot()
Applying: powerpc/mm: thread pgprot_t through create_section_mapping()
Applying: mm/memory_hotplug: add pgprot_t to mhp_params
Applying: mm/memremap: set caching mode for PCI P2PDMA memory to WC
Applying: mm/special: create generic fallbacks for pte_special() and pte_mk=
special()
Applying: mm-special-create-generic-fallbacks-for-pte_special-and-pte_mkspe=
cial-v3
Applying: mm/debug: add tests validating architecture page table helpers
Applying: kmod: make request_module() return an error when autoloading is d=
isabled
Applying: fs/filesystems.c: downgrade user-reachable WARN_ONCE() to pr_warn=
_once()
Applying: docs: admin-guide: document the kernel.modprobe sysctl
Applying: selftests: kmod: fix handling test numbers above 9
Applying: selftests: kmod: test disabling module autoloading
Applying: fs/seq_file.c: seq_read(): add info message about buggy .next fun=
ctions
Applying: seq_read-info-message-about-buggy-next-functions-fix
Applying: kernel/gcov/fs.c: gcov_seq_next() should increase position index
Applying: ipc/util.c: sysvipc_find_ipc() should increase position index
Applying: drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer ove=
rflow
Merging akpm/master (b59d504e2ed9 drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/7aFmtJv7lZsWhw=GE/Y5FC/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl55wZ8ACgkQAVBC80lX
0Gy99gf/YpbFe9TThsDPt+1rsfGQOq2r061TN5j7Lb7MQskyJSLq+vrOlrU3Z5QZ
jKDuA9tSejNMtXLjZ1tGjo9Nq1x9Qe5onCj8jjdXpXJTPZon9Xg88vU7T9v2FUAW
99bJJ/KzS1gMaNo6syCsuTGWIedVlf8revlizRGL4mhPFuPDia9Bx/Jf0PDUEgu4
o6Pe2N1A042ZutZGKwcmc9J4OM9oRl1KGvfojRnFQ7OKY99ceHcFjWXxin5NOJUV
PSQlDegTRaTdLbPbA7Xr58DKHvf736u5vNRPkwQaovqAZltMZlpxwKwUAvisbsSo
a62RHvD90BGclxHZ67Q81B6tTn1jUQ==
=6RRH
-----END PGP SIGNATURE-----

--Sig_/7aFmtJv7lZsWhw=GE/Y5FC/--
