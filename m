Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1064719903E
	for <lists+linux-next@lfdr.de>; Tue, 31 Mar 2020 11:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731586AbgCaJKX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 31 Mar 2020 05:10:23 -0400
Received: from ozlabs.org ([203.11.71.1]:32975 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731174AbgCaJKV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 31 Mar 2020 05:10:21 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48s3Sg4c2Lz9sWB;
        Tue, 31 Mar 2020 20:10:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585645811;
        bh=dkLueNLLbrn9pp6HQns2h//9A43bLxf63Aq5oL3YeHo=;
        h=Date:From:To:Cc:Subject:From;
        b=HrSm3F4j07fppwz7Dq9y6/KENLWOfUSMcQ1gcqqyg32OZ8Vgf4S5PKB+GsRIgPinC
         fzixvCjUaM0elKwnoGRzVSfFfWFbiJxKJKlJbgxugT88zogj+tw/0MT6cDgFnWqc0w
         9uPGftj/xnrljAFY42AD4+sD/X1CBuQNNImAwVYSrEDLdifH6Eh3/Xq+p+ZxMDHgcL
         V/d52qR6q0OW6iPk2MpnON0h1PjJsOkWTJD5dVl88bOZA8HT4I24tsNRQpl2epA/Ym
         vIg5Mk6APpBn3RNr9YopFI2ONQNdtYjxcBayXiKGQ90X6rFYALGZbc9cfEpvbTL5iM
         Qeod/+tqir6tQ==
Date:   Tue, 31 Mar 2020 20:10:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 31
Message-ID: <20200331201009.5572e93b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KnA9W8nIcf=XYrnGK..Xk/j";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/KnA9W8nIcf=XYrnGK..Xk/j
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

The merge window has opened, so please do not add any material for the
next release into your linux-next included trees/branches until after
the merge window closes.

Changes since 20200330:

The pci tree gained a conflict against Linus' tree.

The net-next tree gained a conflict against the spdx tree.

The bpf-next tree gained a conflict against Linus' tree.

The input tree still had its build failure for which I disabled a driver.

The tip tree lost its build failure.  It also inherited a build failure
from the irqchip tree for which I revtered 2 commits.

The irqchip tree lost its build failure.

The gpio tree still had its build failures for which I reverted 3 commits.

The pinctrl tree still had its build failure for which I reverted a commit.

The hyperv tree gained build failure for which I reverted a commit.

The apm tree lost a patch that turned up elsewhere.

Non-merge commits (relative to Linus' tree): 11587
 10164 files changed, 463652 insertions(+), 218393 deletions(-)

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
Merging origin/master (47acac8cae28 Merge tag 'hwmon-for-v5.7' of git://git=
.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging)
Merging fixes/master (fb33c6510d55 Linux 5.6-rc6)
Merging kbuild-current/fixes (e595dd94515e Merge git://git.kernel.org/pub/s=
cm/linux/kernel/git/netdev/net)
Merging arc-current/for-curr (f09d3174f002 ARC: allow userspace DSP applica=
tions to use AGU extensions)
Merging arm-current/fixes (89604523a76e ARM: 8961/2: Fix Kbuild issue cause=
d by per-task stack protector GCC plugin)
Merging arm-soc-fixes/arm/fixes (c8042d1e5cb3 soc: samsung: chipid: Fix ret=
urn value on non-Exynos platforms)
Merging arm64-fixes/for-next/fixes (6f5459da2b87 arm64: alternative: fix bu=
ild with clang integrated assembler)
Merging m68k-current/for-linus (86cded5fc525 m68k: defconfig: Update defcon=
figs for v5.6-rc4)
Merging powerpc-fixes/fixes (1d0c32ec3b86 KVM: PPC: Fix kernel crash with P=
R KVM)
Merging s390-fixes/fixes (16fbf79b0f83 Linux 5.6-rc7)
Merging sparc/master (11648b8339f8 sparc64: fix adjtimex regression)
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (cf673ed0e057 net: fix fraglist segmentation reference c=
ount leak)
Merging bpf/master (a0ba26f37ea0 Merge git://git.kernel.org/pub/scm/linux/k=
ernel/git/bpf/bpf)
Merging ipsec/master (4c59406ed003 xfrm: policy: Fix doulbe free in xfrm_po=
licy_timer)
Merging netfilter/master (a0ba26f37ea0 Merge git://git.kernel.org/pub/scm/l=
inux/kernel/git/bpf/bpf)
Merging ipvs/master (c24b75e0f923 ipvs: move old_secure_tcp into struct net=
ns_ipvs)
Merging wireless-drivers/master (0433ae556ec8 iwlwifi: don't send GEO_TX_PO=
WER_LIMIT if no wgds table)
Merging mac80211/master (a0ba26f37ea0 Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/bpf/bpf)
Merging rdma-fixes/for-rc (7111951b8d49 Linux 5.6)
Merging sound-current/for-linus (3c22baeab40b Merge tag 'asoc-v5.7' of http=
s://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-linus)
Merging sound-asoc-fixes/for-linus (5aefc1f21047 Merge branch 'asoc-5.7' in=
to asoc-linus)
Merging regmap-fixes/for-linus (87fc8230f7aa Merge branch 'regmap-5.6' into=
 regmap-linus)
Merging regulator-fixes/for-linus (bae4cb90541a Merge branch 'regulator-5.6=
' into regulator-linus)
Merging spi-fixes/for-linus (16fbf79b0f83 Linux 5.6-rc7)
Merging pci-current/for-linus (5901b51f3e5d MAINTAINERS: Correct Cadence PC=
I driver path)
Merging driver-core.current/driver-core-linus (2c523b344dfa Linux 5.6-rc5)
Merging tty.current/tty-linus (16fbf79b0f83 Linux 5.6-rc7)
Merging usb.current/usb-linus (16fbf79b0f83 Linux 5.6-rc7)
Merging usb-gadget-fixes/fixes (42cd5ffe46c1 usb: dwc3: debug: fix string p=
osition formatting mixup with ret and len)
Merging usb-serial-fixes/usb-linus (16fbf79b0f83 Linux 5.6-rc7)
Merging usb-chipidea-fixes/ci-for-usb-stable (7cbf3dd3139a usb: chipidea: u=
dc: fix sleeping function called from invalid context)
Merging phy/fixes (be4e3c737eeb phy: mapphone-mdm6600: Fix timeouts by addi=
ng wake-up handling)
Merging staging.current/staging-linus (16fbf79b0f83 Linux 5.6-rc7)
Merging char-misc.current/char-misc-linus (16fbf79b0f83 Linux 5.6-rc7)
Merging soundwire-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging thunderbolt-fixes/fixes (16fbf79b0f83 Linux 5.6-rc7)
Merging input-current/for-linus (4134252ab7e2 Input: fix stale timestamp on=
 key autorepeat events)
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
Merging v4l-dvb-fixes/fixes (2632e7b618a7 media: venus: firmware: Ignore se=
cure call error on first resume)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (f7d5f5655ef7 MAINTAINERS: Correct MIPS patch=
work URL)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (07bdc492cff6 ARM: dts: OMAP3: disable RNG on N950=
/N9)
Merging kvm-fixes/master (e1be9ac8e601 KVM: X86: Narrow down the IPI fastpa=
th to single target IPI)
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
Merging devicetree-fixes/dt/linus (e33a814e772c scripts/dtc: Remove redunda=
nt YYLOC global declaration)
Merging scsi-fixes/fixes (ea697a8bf5a4 scsi: sd: Fix optimal I/O size for d=
evices that change reported values)
Merging drm-fixes/drm-fixes (c4b979ebcafe Merge tag 'amd-drm-fixes-5.6-2020=
-03-26' of git://people.freedesktop.org/~agd5f/linux into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (7111951b8d49 Linux 5.6)
Merging mmc-fixes/fixes (16fbf79b0f83 Linux 5.6-rc7)
Merging rtc-fixes/rtc-fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging gnss-fixes/gnss-linus (f8788d86ab28 Linux 5.6-rc3)
Merging hyperv-fixes/hyperv-fixes (032d4a480220 hv: hyperv_vmbus.h: Replace=
 zero-length array with flexible-array member)
Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq h=
andlers after dpio create)
Merging risc-v-fixes/fixes (2191b4f298fa RISC-V: Move all address space def=
inition macros to one place)
Merging pidfd-fixes/fixes (10dab84caf40 pid: make ENOMEM return value more =
obvious)
Merging fpga-fixes/fixes (dec43da46f63 fpga: altera-ps-spi: Fix getting of =
optional confd gpio)
Merging spdx/spdx-linus (71db3aa2816d ASoC: MT6660: make spdxcheck.py happy)
Merging gpio-intel-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging pinctrl-intel-fixes/fixes (16fbf79b0f83 Linux 5.6-rc7)
Merging erofs-fixes/fixes (d1eef1c61974 Linux 5.5-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (83a196773b8b drm/bridge: analo=
gix_dp: Split bind() into probe() and real bind())
Merging kspp-gustavo/for-next/kspp (90e5d84c7b06 xattr.h: Replace zero-leng=
th array with flexible-array member)
Merging kbuild/for-next (b021f4566a44 Merge branch 'kbuild-asinstr' into fo=
r-next)
CONFLICT (content): Merge conflict in Documentation/kbuild/index.rst
Merging compiler-attributes/compiler-attributes (98d54f81e36b Linux 5.6-rc4)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (fd27a526bb38 ARM/dma-mapping: merge __dma_sup=
ported into arm_dma_supported)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (52d3b2f98483 Merge branch 'devel-stable' into for-nex=
t)
Merging arm64/for-next/core (b2a84de2a2de mm/mremap: Add comment explaining=
 the untagging behaviour of mremap())
Merging arm-perf/for-next/perf (8673e02e5841 arm64: perf: Add support for A=
RMv8.5-PMU 64-bit counters)
Merging arm-soc/for-next (d9725e56e1d8 soc: document merges)
Merging amlogic/for-next (e304af8727dd Merge branch 'v5.7/drivers' into tmp=
/aml-rebuild)
Merging aspeed/for-next (de285b938cf3 ARM: dts: aspeed: ast2600: Fix SCU IR=
Q controller nodes)
Merging at91/at91-next (ec539e70d882 Merge branches 'at91-soc', 'at91-dt' a=
nd 'at91-defconfig' into at91-next)
Merging imx-mxs/for-next (e506dba69a5e Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (560b4d4691b0 Merge branch 'for_5.7/keystone-dts' int=
o next)
Merging mediatek/for-next (6906847e14b5 Merge branch 'v5.6-next/soc' into f=
or-next)
Merging mvebu/for-next (9d32706f8aa8 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (e90f16cc1a48 Merge branch 'fixes' into for-next)
Merging qcom/for-next (8dc3769c8a68 Merge branches 'arm64-for-5.7', 'arm64-=
defconfig-for-5.7', 'defconfig-for-5.7', 'drivers-for-5.7' and 'dts-for-5.7=
' into for-next)
Merging raspberrypi/for-next (e7b7daeb48e0 ARM: dts: bcm283x: Use firmware =
PM driver for V3D)
CONFLICT (content): Merge conflict in arch/arm/configs/bcm2835_defconfig
Merging realtek/for-next (45698e00d5a9 Merge branch 'v5.6/dt' into next)
Merging renesas/next (bf4540d5148c Merge branch 'renesas-arm64-dt-for-v5.7'=
 into renesas-next)
Merging reset/reset/next (2ebf89fd4ecf reset: hi6220: Add support for AO re=
set controller)
Merging rockchip/for-next (c018aff1a201 Merge branch 'v5.7-armsoc/dts64' in=
to for-next)
Merging samsung-krzk/for-next (5c1cb4ae848e Merge branch 'next/dt-late' int=
o for-next)
Merging scmi/for-linux-next (7111951b8d49 Linux 5.6)
Merging sunxi/sunxi/for-next (8afff9da61ea Merge branch 'sunxi/dt-for-5.7' =
into sunxi/for-next)
Merging tegra/for-next (df0a178cf2df Merge branch for-5.7/usb into for-next)
Merging clk/clk-next (fe3419f5acf0 Merge branch 'clk-imx' into clk-next)
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
Merging mips/mips-next (ba15533275dd Merge tag 'v5.6' into mips-next)
Merging nds32/next (d785c5a324cd nds32: configs: Cleanup CONFIG_CROSS_COMPI=
LE)
Merging nios2/for-next (051d75d3bb31 MAINTAINERS: Update Ley Foon Tan's ema=
il address)
Merging openrisc/for-next (9737e2c5f0bc openrisc: Remove obsolete show_trac=
e_task function)
Merging parisc-hd/for-next (8a29e21d8cb0 parisc: Replace setup_irq() by req=
uest_irq())
Merging powerpc/next (7074695ac6fb powerpc/prom_init: Remove leftover comme=
nt)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (461c3ac0dc46 soc: fsl: qe: fix sparse warnings for uc=
c_slow.c)
Merging risc-v/for-next (88d110382555 riscv: Use macro definition instead o=
f magic number)
CONFLICT (content): Merge conflict in arch/riscv/include/asm/pgtable.h
Merging sifive/for-next (467e050e9760 Merge branch 'i2c/for-current' of git=
://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging s390/features (1058c163dc31 s390/mm: cleanup init_new_context() cal=
lback)
Merging sh/sh-next (a193018e5290 sh: add missing EXPORT_SYMBOL() for __dela=
y)
Merging sparc-next/master (b71acb0e3721 Merge branch 'linus' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging uml/linux-next (4a7c46247f9c um: Remove some unnecessary NULL check=
s in vector_user.c)
Merging xtensa/xtensa-for-next (adc044bf2320 Merge branch 'xtensa-5.7-fixes=
' into xtensa-for-next)
Merging fscrypt/master (861261f2a9cc ubifs: wire up FS_IOC_GET_ENCRYPTION_N=
ONCE)
Merging afs/afs-next (4fe171bb81b1 afs: Remove set but not used variable 'r=
et')
Merging btrfs/for-next (5159d9854910 Merge branch 'for-next-next-v5.6-20200=
326' into for-next-20200326)
Merging ceph/master (3e10eb7331c7 rbd: don't mess with a page vector in rbd=
_notify_op_lock())
Merging cifs/for-next (f460c5027473 cifs: update internal module version nu=
mber)
Merging configfs/for-next (e2f238f7d5a1 configfs: calculate the depth of pa=
rent item)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (20741a6e146c MAINTAINERS: erofs: update my email address)
Merging ext3/for_next (a32f0ecd79b4 Merge fanotify fix from Nathan Chancell=
or.)
Merging ext4/dev (2ea2fc775321 ext4: save all error info in save_error_info=
() and drop ext4_set_errno())
Merging f2fs/dev (cbec5876a657 f2fs: keep inline_data when compression conv=
ersion)
Merging fsverity/fsverity (98d54f81e36b Linux 5.6-rc4)
Merging fuse/for-next (3e8cb8b2eaeb fuse: fix stack use after return)
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (f764a1e1cb8b Merge tag 'nfs-rdma-for-5.7-1' of git:=
//git.linux-nfs.org/projects/anna/linux-nfs)
Merging nfs-anna/linux-next (55dee1bc0d72 nfs: add minor version to nfs_ser=
ver_key for fscache)
Merging nfsd/nfsd-next (2653de9f0398 fs: nfsd: fileache.c: Use built-in RCU=
 list checking)
Merging orangefs/for-next (9f198a2ac543 help_next should increase position =
index)
Merging overlayfs/overlayfs-next (2eda9eaa6d7e ovl: document xino expected =
behavior)
Merging ubifs/linux-next (3676f32a98cd ubi: ubi-media.h: Replace zero-lengt=
h array with flexible-array member)
Merging v9fs/9p-next (43657496e466 net/9p: remove unused p9_req_t aux field)
Merging xfs/for-next (d4bc4c5fd177 xfs: return locked status of inode buffe=
r on xfsaild push)
Merging zonefs/for-next (0dda2ddb7ded zonefs: select FS_IOMAP)
Merging iomap/iomap-for-next (d9973ce2fe5b iomap: fix comments in iomap_dio=
_rw)
Merging djw-vfs/vfs-for-next (56939e014a6c hibernate: Allow uswsusp to writ=
e to swap)
Merging file-locks/locks-next (dbdaf6a3250b locks: reinstate locks_delete_b=
lock optimization)
Merging vfs/for-next (575beddbd7f4 Merge branches 'work.exfat' and 'work.do=
tdot' into for-next)
Merging printk/for-next (d34f14ae521f Merge branch 'for-5.7-preferred-conso=
le' into for-next)
Merging pci/next (5024e1fe40c8 Merge branch 'remotes/lorenzo/pci/vmd')
CONFLICT (content): Merge conflict in drivers/net/ethernet/intel/ice/ice_ma=
in.c
CONFLICT (content): Merge conflict in MAINTAINERS
Merging pstore/for-next/pstore (8128d3aac0ee pstore/ram: Replace zero-lengt=
h array with flexible-array member)
Merging hid/for-next (c2320c3ee0e6 Merge branch 'for-5.6/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (9778aad2f2f7 Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i3c/i3c/next (c4b9de11d010 i3c: convert to use i2c_new_client_devic=
e())
Merging dmi/master (12028f913eb9 firmware/dmi: Report DMI Bios & EC firmwar=
e release)
Merging hwmon-staging/hwmon-next (5b10a8194664 docs: hwmon: Update document=
ation for isl68137 pmbus driver)
Merging jc_docs/docs-next (abcb1e021ae5 Documentation: x86: exception-table=
s: document CONFIG_BUILDTIME_TABLE_SORT)
Merging v4l-dvb/master (2632e7b618a7 media: venus: firmware: Ignore secure =
call error on first resume)
Merging v4l-dvb-next/master (54ecb8f7028c Linux 5.4-rc1)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (8b4ddf47b7b4 Merge branch 'pm-cpufreq' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (a8811ec764f9 cpufreq: qcom: Add=
 support for krait based socs)
Merging cpupower/cpupower (2de7fb60a474 cpupower: avoid multiple definition=
 with gcc -fno-common)
Merging opp/opp/linux-next (03758d60265c opp: Replace list_kref with a loca=
l counter)
Merging thermal/thermal/linux-next (76a5c400aae5 thermal: imx8mm: Fix build=
 warning of incorrect argument type)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (a48f9721e6db dlm: no need to check return value of debugf=
s_create functions)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (b4d8ddf8356d RDMA/bnxt_re: make bnxt_re_ib_init stat=
ic)
Merging net-next/master (2d39eab45b2c Merge branch 'split-phylink-PCS-opera=
tions')
CONFLICT (modify/delete): tools/testing/selftests/networking/timestamping/.=
gitignore deleted in net-next/master and modified in HEAD. Version HEAD of =
tools/testing/selftests/networking/timestamping/.gitignore left in tree.
CONFLICT (content): Merge conflict in fs/sysfs/group.c
$ git rm -f tools/testing/selftests/networking/timestamping/.gitignore
Merging bpf-next/master (ff03e1784395 Merge branch 'cgroup-bpf_link')
CONFLICT (content): Merge conflict in kernel/bpf/cgroup.c
Merging ipsec-next/master (308491755f36 xfrm: add prep for esp beet mode of=
fload)
Merging mlx5-next/mlx5-next (826096d84f50 mlx5: Remove uninitialized use of=
 key in mlx5_core_create_mkey)
Merging netfilter-next/master (e19680f8347e ipvs: fix uninitialized variabl=
e warning)
Merging ipvs-next/master (d54725cd11a5 netfilter: nf_tables: support for mu=
ltiple devices per netdev hook)
Merging wireless-drivers-next/master (5988b8ec7132 Merge tag 'iwlwifi-next-=
for-kalle-2020-03-27' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlw=
ifi/iwlwifi-next)
Merging bluetooth/master (d7a448d5da88 Bluetooth: Always request for user c=
onfirmation for Just Works)
Merging mac80211-next/master (1e8f471425f4 mac80211_hwsim: notify wmediumd =
of used MAC addresses)
Merging gfs2/for-next (75b46c437f6b gfs2: Fix oversight in gfs2_ail1_flush)
Merging mtd/mtd/next (025a06c1104c mtd: Convert fallthrough comments into s=
tatements)
Merging nand/nand/next (fca88925d769 mtd: rawnand: toshiba: Support reading=
 the number of bitflips for BENAND (Built-in ECC NAND))
Merging spi-nor/spi-nor/next (f3f2b7eb2f1c mtd: spi-nor: Enable locking for=
 n25q512ax3/n25q512a)
Merging crypto/master (fcb90d51c375 crypto: af_alg - bool type cosmetics)
Merging drm/drm-next (700d6ab987f3 Merge tag 'drm-intel-next-fixes-2020-03-=
27' of git://anongit.freedesktop.org/drm/drm-intel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gvt/vgpu.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gvt/display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_lrc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.c
CONFLICT (content): Merge conflict in arch/arm/configs/omap2plus_defconfig
Merging amdgpu/drm-next (32f89c5eb4d4 drm/amdgpu/display: fix logic inversi=
on in program_timing_sync())
Merging drm-intel/for-linux-next (2bdd4c28baff drm/i915/display: Fix mode p=
rivate_flags comparison at atomic_check)
Merging drm-tegra/drm/tegra/for-next (e32c8c2a5fbe drm/tegra: hdmi: Silence=
 deferred-probe error)
Merging drm-misc/for-linux-next (9488ef75ef44 docs: dt: display/ti: fix typ=
os at the devicetree/ directory name)
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
Merging sound/for-next (3c22baeab40b Merge tag 'asoc-v5.7' of https://git.k=
ernel.org/pub/scm/linux/kernel/git/broonie/sound into for-linus)
Merging sound-asoc/for-next (5aefc1f21047 Merge branch 'asoc-5.7' into asoc=
-linus)
Merging modules/modules-next (0f74226649fb kernel: module: Replace zero-len=
gth array with flexible-array member)
Merging input/next (10ad4845cd3d dt-bindings: touchscreen: Convert edt-ft5x=
06 to json-schema)
Applying: Input: goodix - mark as BROKEN for noe
Merging block/for-next (d9e92da49f29 Merge branch 'for-5.7/block' into for-=
next)
CONFLICT (content): Merge conflict in include/linux/genhd.h
Merging device-mapper/for-next (81d5553d1288 dm clone metadata: Fix return =
type of dm_clone_nr_of_hydrated_regions())
Merging pcmcia/pcmcia-next (af741b0bad23 pcmcia: soc_common.h: Replace zero=
-length array with flexible-array member)
Merging mmc/next (92075d98abf0 mmc: cavium-octeon: remove nonsense variable=
 coercion)
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (1129d6145ed5 mfd: Add support for Azoteq IQS620A/=
621/622/624/625)
Merging backlight/for-backlight-next (ee0c8e494cc3 backlight: corgi: Conver=
t to use GPIO descriptors)
Merging battery/for-next (f78c55e3b480 power: reset: sc27xx: Allow the SC27=
XX poweroff driver building into a module)
Merging regulator/for-next (24bd2afda8ce Merge branch 'regulator-5.7' into =
regulator-next)
Merging security/next-testing (3e27a33932df security: remove duplicated inc=
lude from security.h)
Merging apparmor/apparmor-next (01df52d726b5 apparmor: remove duplicate che=
ck of xattrs on profile attachment.)
Merging integrity/next-integrity (9e2b4be377f0 ima: add a new CONFIG for lo=
ading arch-specific policies)
Merging keys/keys-next (43672cf93c6d Merge branch 'notifications-pipe-core'=
 into keys-next)
CONFLICT (content): Merge conflict in include/linux/lsm_hooks.h
CONFLICT (content): Merge conflict in fs/pipe.c
Applying: io_uring: fix up for get_pipe_info() API change
Applying: security: keys: fixup for "security: Refactor declaration of LSM =
hooks"
Merging selinux/next (c753924b6285 selinux: clean up indentation issue with=
 assignment statement)
CONFLICT (content): Merge conflict in security/selinux/hooks.c
Merging smack/for-next (92604e825304 smack: use GFP_NOFS while holding inod=
e_smack::smk_lock)
Merging tomoyo/master (9efcc4a12936 afs: Fix unpinned address list during p=
robing)
Merging tpmdd/next (2e356101e72a KEYS: reaching the keys quotas correctly)
Merging watchdog/master (f667421324ed watchdog: npcm: remove whitespaces)
Merging iommu/next (ff68eb23308e Merge branches 'iommu/fixes', 'arm/qcom', =
'arm/omap', 'arm/smmu', 'x86/amd', 'x86/vt-d', 'virtio' and 'core' into nex=
t)
Merging vfio/next (48219795e7db Merge branches 'v5.7/vfio/alex-sriov-v3' an=
d 'v5.7/vfio/yan-dma-rw-v4' into v5.7/vfio/next)
Merging audit/next (1320a4052ea1 audit: trigger accompanying records when n=
o rules present)
Merging devicetree/for-next (cca8ca3b8d42 dt-bindings: vendor-prefixes: Add=
 Topwise)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/usb=
/generic.txt
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/tri=
vial-devices.yaml
Merging mailbox/mailbox-for-next (0a67003b1985 mailbox: imx: add SCU MU sup=
port)
Merging spi/for-next (1ba0b52ea73b Merge branch 'spi-5.7' into spi-next)
Merging tip/auto-latest (b600cb614e4a Merge branch 'core/objtool')
CONFLICT (content): Merge conflict in include/linux/arch_topology.h
CONFLICT (content): Merge conflict in drivers/thermal/cpufreq_cooling.c
CONFLICT (content): Merge conflict in arch/x86/Kconfig
Applying: power: reset: sc27xx: use remove_cpu instead of cpu_down
Applying: Revert "irqchip/xilinx: Do not call irq_set_default_host()"
Applying: Revert "irqchip/xilinx: Enable generic irq multi handler"
Merging clockevents/timers/drivers/next (c1ac28a4de6f Revert "clocksource: =
Avoid creating dead devices")
Merging edac/edac-for-next (ad49d9a8228e Merge branch 'edac-misc' into edac=
-for-next)
Merging irqchip/irq/irqchip-next (545ef0bada10 Revert "irqchip/xilinx: Enab=
le generic irq multi handler")
Merging ftrace/for-next (2ab2a0924b99 tracing: Add documentation on set_ftr=
ace_notrace_pid and set_event_notrace_pid)
Merging rcu/rcu/next (1503af98f54d rcutorture: Add test of holding schedule=
r locks across rcu_read_unlock())
CONFLICT (content): Merge conflict in tools/memory-model/litmus-tests/.giti=
gnore
Merging kvm/linux-next (830948eb6826 Merge tag 'kvm-s390-next-5.7-3' of git=
://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
CONFLICT (content): Merge conflict in tools/testing/selftests/kvm/.gitignore
Merging kvm-arm/next (463050599742 Merge tag 'kvm-arm-removal' into kvmarm-=
master/next)
CONFLICT (modify/delete): arch/arm/kvm/coproc.c deleted in kvm-arm/next and=
 modified in HEAD. Version HEAD of arch/arm/kvm/coproc.c left in tree.
$ git rm -f arch/arm/kvm/coproc.c
Merging kvm-ppc/kvm-ppc-next (9a5788c615f5 KVM: PPC: Book3S HV: Add a capab=
ility for enabling secure guests)
Merging kvms390/next (7a2653612bb6 s390/gmap: return proper error code on k=
sm unsharing)
Merging xen-tip/linux-next (c3881eb58d56 x86/xen: Make the secondary CPU id=
le tasks reliable)
Merging percpu/for-next (cfe2a689f755 Merge branch 'for-5.7' into for-next)
Merging workqueues/for-next (4acf8a423cd3 Merge branch 'for-5.7' into for-n=
ext)
Merging drivers-x86/for-next (d878bdfba8ff platform/x86: surface3_power: Fi=
x always true condition in mshw0011_space_handler())
CONFLICT (content): Merge conflict in drivers/platform/x86/intel_pmc_core.c
Merging chrome-platform/for-next (317a0ebe53f4 iio: cros_ec: Use Hertz as u=
nit for sampling frequency)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (10a6cce3c1a1 Group LED functions according to functi=
onality, and add some explaining comments.)
Merging ipmi/for-next (26455d00ee58 drivers: char: ipmi: ipmi_msghandler: P=
ass lockdep expression to RCU lists)
Merging driver-core/driver-core-next (18555cb6db23 Revert "driver core: Set=
 fw_devlink to "permissive" behavior by default")
CONFLICT (content): Merge conflict in drivers/platform/x86/Kconfig
Merging usb/usb-next (62d65bdd9d05 USB: cdc-acm: restore capability check o=
rder)
Merging usb-gadget/next (4a5dbd900957 dt-bindings: usb: add documentation f=
or aspeed usb-vhub)
Merging usb-serial/usb-next (57aa9f294b09 USB: serial: io_edgeport: fix sla=
b-out-of-bounds read in edge_interrupt_callback)
Merging usb-chipidea-next/ci-for-usb-next (86b17c7f14ed usb: chipidea: core=
: show the real pointer value for register)
Merging phy-next/next (89d715371a05 phy: qcom-qusb2: Add new overriding tun=
ing parameters in QUSB2 V2 PHY)
Merging tty/tty-next (8d5b305484e8 serial: 8250: Optimize irq enable after =
console write)
Merging char-misc/char-misc-next (5caf6102e32e amba: Initialize dma_parms f=
or amba devices)
Merging extcon/extcon-next (9c94553099ef extcon: axp288: Add wakeup support)
Merging soundwire/next (39ec6f992131 soundwire: qcom: add support for get_s=
dw_stream())
Merging thunderbolt/next (3010518964dc thunderbolt: Use scnprintf() for avo=
iding potential buffer overflow)
Merging staging/staging-next (e681bb287f40 staging: vt6656: Use DIV_ROUND_U=
P macro instead of specific code)
CONFLICT (content): Merge conflict in drivers/staging/media/allegro-dvt/all=
egro-core.c
CONFLICT (modify/delete): drivers/staging/exfat/Kconfig deleted in staging/=
staging-next and modified in HEAD. Version HEAD of drivers/staging/exfat/Kc=
onfig left in tree.
CONFLICT (content): Merge conflict in MAINTAINERS
$ git rm -f drivers/staging/exfat/Kconfig
Applying: fix up for "staging: Replace zero-length array with flexible-arra=
y member"
Applying: octeon/ethernet_tx.c fixup
Merging mux/for-next (f356d58c3a04 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (03c4e6186bbb interconnect: qcom: Add OSM L3 support o=
n SC7180)
Merging slave-dma/next (cea582b5ee56 dt-bindings: dma: renesas,usb-dmac: ad=
d r8a77961 support)
CONFLICT (content): Merge conflict in drivers/dma/ti/k3-udma.c
Merging cgroup/for-next (6fc331767f41 Merge branch 'for-5.7' into for-next)
Merging scsi/for-next (9dfce4c4d3cd Merge branch 'misc' into for-next)
CONFLICT (modify/delete): Documentation/scsi/scsi_mid_low_api.txt deleted i=
n scsi/for-next and modified in HEAD. Version HEAD of Documentation/scsi/sc=
si_mid_low_api.txt left in tree.
$ git rm -f Documentation/scsi/scsi_mid_low_api.txt
Applying: scsi: fix up for "scsi: simplify scsi_partsize"
Merging scsi-mkp/for-next (763a18cbf79b scsi: lpfc: Change default SCSI LUN=
 QD to 64)
Merging vhost/linux-next (1b8339ed2c85 virtio: Intel IFC VF driver for VDPA)
CONFLICT (modify/delete): arch/arm/kvm/Kconfig deleted in HEAD and modified=
 in vhost/linux-next. Version vhost/linux-next of arch/arm/kvm/Kconfig left=
 in tree.
$ git rm -f arch/arm/kvm/Kconfig
Applying: Revert "virtio-balloon: Switch back to OOM handler for VIRTIO_BAL=
LOON_F_DEFLATE_ON_OOM"
Merging rpmsg/for-next (45c2824de341 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Applying: Build failure in omap_remoteproc due to 02e6d546e3bd
Merging gpio/for-next (ffa91e7ca142 gpio: tegra186: Add Tegra194 pin ranges=
 for GG.0 and GG.1)
Applying: Revert "gpio: tegra186: Add Tegra194 pin ranges for GG.0 and GG.1"
Applying: Revert "gpio: tegra186: Add support for pin ranges"
Applying: Revert "gpio: Support GPIO controllers without pin-ranges"
Merging gpio-brgl/gpio/for-next (975516250253 tools: gpio: Fix typo in gpio=
-utils)
Merging gpio-intel/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging pinctrl/for-next (13bec8d49bdf pinctrl: qcom: use scm_call to route=
 GPIO irq to Apps)
Applying: Revert "pinctrl: qcom: use scm_call to route GPIO irq to Apps"
Merging pinctrl-intel/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging pinctrl-samsung/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging pwm/for-next (a2005fc79179 pwm: jz4740: Allow selection of PWM chan=
nels 0 and 1)
Merging userns/for-next (4b871ce26ab2 Merged 'Infrastructure to allow fixin=
g exec deadlocks' from Bernd Edlinger)
CONFLICT (content): Merge conflict in kernel/pid.c
Merging ktest/for-next (1091c8fce8aa ktest: Fix typos in ktest.pl)
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (1056d3d2c97e selftests: enforce local header depend=
ency in lib.mk)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (d28b4c1b2b3d Merge branch 'for-5.6/selftests=
' into for-next)
Merging coresight/next (ed0efaa66ad8 docs: trace: coresight-ect.rst: fix a =
build warning)
Merging rtc/rtc-next (4fd47a20b45e rtc: da9052: switch to rtc_time64_to_tm/=
rtc_tm_to_time64)
Merging nvdimm/libnvdimm-for-next (6ab3463a5fcd Merge branch 'for-5.6/libnv=
dimm-space-align' into libnvdimm-for-next)
Merging at24/at24/for-next (4837621cd61e eeprom: at24: add TPF0001 ACPI ID =
for 24c1024 device)
Merging ntb/ntb-next (b9fc54c38e2e NTB: ntb_test: Fix bug when counting rem=
ote files)
Merging kspp/for-next/kspp (c79f46a28239 Linux 5.5-rc5)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (f8788d86ab28 Linux 5.6-rc3)
Merging fsi/next (2c01397b71c5 fsi: aspeed: Fix OPB0 byte order register va=
lues)
CONFLICT (content): Merge conflict in drivers/fsi/Kconfig
Merging slimbus/for-next (ba1589ff458e slimbus: ngd: add v2.1.0 compatible)
Merging nvmem/for-next (990df6402752 nvmem: mxs-ocotp: Use devm_add_action_=
or_reset() for cleanup)
CONFLICT (modify/delete): drivers/nvmem/nvmem-sysfs.c deleted in HEAD and m=
odified in nvmem/for-next. Version nvmem/for-next of drivers/nvmem/nvmem-sy=
sfs.c left in tree.
$ git rm -f drivers/nvmem/nvmem-sysfs.c
Merging xarray/xarray (7e934cf5ace1 xarray: Fix early termination of xas_fo=
r_each_marked)
Merging hyperv/hyperv-next (a6a5aa4b0179 x86/Hyper-V: Report crash data in =
die() when panic_on_oops is set)
Applying: Revert "x86/Hyper-V: Report crash data in die() when panic_on_oop=
s is set"
Merging auxdisplay/auxdisplay (2f920c0f0e29 auxdisplay: charlcd: replace ze=
ro-length array with flexible-array member)
Merging kgdb/kgdb/for-next (5ea771abd5a3 kdb: Censor attempts to set PROMPT=
 without ENABLE_MEM_READ)
Merging pidfd/for-next (6952a4f64644 selftests: add pid namespace ENOMEM re=
gression test)
Merging devfreq/devfreq-next (7a51320ecd39 PM / devfreq: Get rid of some do=
c warnings)
Merging hmm/hmm (bd5d3587b218 mm/hmm: return error for non-vma snapshots)
Merging fpga/for-next (cef0ca6417de fpga: dfl: afu: support debug access to=
 memory-mapped afu regions)
Merging kunit/test (bb6d3fb354c5 Linux 5.6-rc1)
Merging cel/cel-next (1a33d8a284b1 svcrdma: Fix leak of transport addresses)
CONFLICT (content): Merge conflict in net/sunrpc/cache.c
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (b6fe8bc67d2d mtd: hyperbus: move direct mapping setup=
 to AM654 HBMC driver)
Merging kunit-next/kunit (e23349af9ee2 kunit: tool: add missing test data f=
ile content)
Merging trivial/for-next (fad7c9020948 err.h: remove deprecated PTR_RET for=
 good)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging akpm-current/current (cd32a7aa389b ipc/mqueue.c: fix a brace coding=
 style issue)
CONFLICT (content): Merge conflict in arch/x86/include/asm/pgtable_types.h
CONFLICT (content): Merge conflict in arch/x86/Kconfig
CONFLICT (content): Merge conflict in arch/microblaze/include/asm/Kbuild
CONFLICT (content): Merge conflict in arch/m68k/include/asm/Kbuild
$ git checkout -b akpm remotes/origin/akpm/master
Applying: Change email address for Pali Roh=C3=A1r
Applying: mm/kmemleak: silence KCSAN splats in checksum
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
Applying: mm/special: create generic fallbacks for pte_special() and pte_mk=
special()
Applying: mm-special-create-generic-fallbacks-for-pte_special-and-pte_mkspe=
cial-v3
Applying: mm/debug: add tests validating architecture page table helpers
Applying: mm/memory_hotplug: drop the flags field from struct mhp_restricti=
ons
Applying: mm/memory_hotplug: rename mhp_restrictions to mhp_params
Applying: x86/mm: thread pgprot_t through init_memory_mapping()
Applying: x86/mm: introduce __set_memory_prot()
Applying: powerpc/mm: thread pgprot_t through create_section_mapping()
Applying: mm/memory_hotplug: add pgprot_t to mhp_params
Applying: mm/memremap: set caching mode for PCI P2PDMA memory to WC
Applying: mm/madvise: pass task and mm to do_madvise
Applying: mm/madvise: introduce process_madvise() syscall: an external memo=
ry hinting API
Applying: fix process_madvise build break for arm64
Applying: mm/madvise: check fatal signal pending of target process
Applying: pid: move pidfd_get_pid() to pid.c
Applying: mm/madvise: support both pid and pidfd for process_madvise
Applying: mm/madvise: employ mmget_still_valid() for write lock
Applying: mm/madvise: allow KSM hints for remote API
Applying: kmod: make request_module() return an error when autoloading is d=
isabled
Applying: fs/filesystems.c: downgrade user-reachable WARN_ONCE() to pr_warn=
_once()
Applying: docs: admin-guide: document the kernel.modprobe sysctl
Applying: docs-admin-guide-document-the-kernelmodprobe-sysctl-v5
Applying: selftests: kmod: fix handling test numbers above 9
Applying: selftests: kmod: test disabling module autoloading
Applying: kexec: prevent removal of memory in use by a loaded kexec image
Applying: mm/memory_hotplug: allow arch override of non boot memory resourc=
e names
Applying: arm64: memory: give hotplug memory a different resource name
Applying: fs/seq_file.c: seq_read(): add info message about buggy .next fun=
ctions
Applying: seq_read-info-message-about-buggy-next-functions-fix
Applying: kernel/gcov/fs.c: gcov_seq_next() should increase position index
Applying: ipc/util.c: sysvipc_find_ipc() should increase position index
Applying: drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer ove=
rflow
Merging akpm/master (019661e9a491 drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/KnA9W8nIcf=XYrnGK..Xk/j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6DCPEACgkQAVBC80lX
0GzsAQf8DfkyJj0NpSzWGqt3VWI/JLEb0AJe563QCAzZmVSU/jaizPd9Q+QeP2Zi
QSnjAW3NPkMFsMZkwaUvcK5DKy4eZBCo6mL6GN1p+wJhMzNIEk5uQWsDKg+Liqau
tens2jc9pKY6py3WqEs6Ix1/OzYkN5/iAjd+XBdqGfZ7fo7Bct8eyBFYpiFrXnJx
pO+X/8OK4twPB0AL+muYYSiBm7HqRi8IVPdHGpRwbFJ9kQ82QLoOX9bBrrRtKouD
T04pMIQFNsfr0WE5tXTA2Y2voGBdU8d37OAW94C44d59dEFk0lPLgrkiG99duUhV
E0tegkDPaf8zlobibKSEG9QjCPFq9g==
=VvWd
-----END PGP SIGNATURE-----

--Sig_/KnA9W8nIcf=XYrnGK..Xk/j--
