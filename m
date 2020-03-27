Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84DF219528F
	for <lists+linux-next@lfdr.de>; Fri, 27 Mar 2020 09:07:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgC0IHs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Mar 2020 04:07:48 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43825 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726027AbgC0IHs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 27 Mar 2020 04:07:48 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48pZGP6v9Zz9sPR;
        Fri, 27 Mar 2020 19:07:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585296462;
        bh=zmWiRDLkziW7aYR5ZBnfaBm/LPAuXuB1kvpGFIr2oNg=;
        h=Date:From:To:Cc:Subject:From;
        b=S6P9QLEy5pW9WwWG6QCd/gzl5jpBzLyN1SqyKklqvNKRQ+V5R27NrOxVg1pjN/VgL
         +EGOxwewRNiwxTc3S8ZELGaqf7QbmHG6hc8PapYGmeouqogh7dhjwq7zEIhtPGMeH9
         lJ0478G6Gdcf3BNTGr0zVEhL1bAz2CN25pc1QG4waT4bxYJwdF+q9lKeVQmP+S/fk5
         fp/gSCRkC7enxYfLIGQyWWpmpQJ0nUdfCNkvcpK4ddxLmnN26C5scdU9OOAeK2/tin
         whLr3Xgsft0+8/6IpTOyH+tCgJwEj+uVgm0uEzgO/WYjpAe9yohzFsOiilA+4FFPCd
         3H2lKRTC/X/jQ==
Date:   Fri, 27 Mar 2020 19:07:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 27
Message-ID: <20200327190740.7385d4ff@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IegWs5a=mfpbYoQ1BPJELmw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/IegWs5a=mfpbYoQ1BPJELmw
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20200326:

The tegra tree gained conflicts against the arm-soc tree.

The input tree still had its build failure for which I disabled a driver.

The devicetree tree gained a conflict against the hwmon-staging tree.

The irqchip tree still had its build failure for which I reverted
2 commits.

Non-merge commits (relative to Linus' tree): 11164
 9752 files changed, 433716 insertions(+), 211872 deletions(-)

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
Merging origin/master (9420e8ade435 Merge tag 'for-linus' of git://git.kern=
el.org/pub/scm/linux/kernel/git/rdma/rdma)
Merging fixes/master (fb33c6510d55 Linux 5.6-rc6)
Merging kbuild-current/fixes (7883a1433929 scripts/kallsyms: fix wrong kall=
syms_relative_base)
Merging arc-current/for-curr (f09d3174f002 ARC: allow userspace DSP applica=
tions to use AGU extensions)
Merging arm-current/fixes (89604523a76e ARM: 8961/2: Fix Kbuild issue cause=
d by per-task stack protector GCC plugin)
Merging arm-soc-fixes/arm/fixes (c8042d1e5cb3 soc: samsung: chipid: Fix ret=
urn value on non-Exynos platforms)
Merging arm64-fixes/for-next/fixes (6f5459da2b87 arm64: alternative: fix bu=
ild with clang integrated assembler)
Merging m68k-current/for-linus (6aabc1facdb2 m68k: Implement copy_thread_tl=
s())
Merging powerpc-fixes/fixes (1d0c32ec3b86 KVM: PPC: Fix kernel crash with P=
R KVM)
Merging s390-fixes/fixes (16fbf79b0f83 Linux 5.6-rc7)
Merging sparc/master (11648b8339f8 sparc64: fix adjtimex regression)
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (f6bf1bafdc21 mlxsw: spectrum_mr: Fix list iteration in =
error path)
Merging bpf/master (5c6f25887963 bpf: Explicitly memset some bpf info struc=
tures declared on the stack)
Merging ipsec/master (4c59406ed003 xfrm: policy: Fix doulbe free in xfrm_po=
licy_timer)
Merging netfilter/master (1b649e0bcae7 Merge git://git.kernel.org/pub/scm/l=
inux/kernel/git/netdev/net)
Merging ipvs/master (c24b75e0f923 ipvs: move old_secure_tcp into struct net=
ns_ipvs)
Merging wireless-drivers/master (0433ae556ec8 iwlwifi: don't send GEO_TX_PO=
WER_LIMIT if no wgds table)
Merging mac80211/master (b95d2ccd2ccb mac80211: set IEEE80211_TX_CTRL_PORT_=
CTRL_PROTO for nl80211 TX)
Merging rdma-fixes/for-rc (ba80013fba65 RDMA/mlx5: Block delay drop to unpr=
ivileged users)
Merging sound-current/for-linus (e9097e47e349 ALSA: hda/ca0132 - Add Recon3=
Di quirk to handle integrated sound on EVGA X99 Classified motherboard)
Merging sound-asoc-fixes/for-linus (4f2470fa3478 Merge branch 'asoc-5.6' in=
to asoc-linus)
Merging regmap-fixes/for-linus (87fc8230f7aa Merge branch 'regmap-5.6' into=
 regmap-linus)
Merging regulator-fixes/for-linus (bae4cb90541a Merge branch 'regulator-5.6=
' into regulator-linus)
Merging spi-fixes/for-linus (fb33c6510d55 Linux 5.6-rc6)
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
Merging input-current/for-linus (52afa505a03d Input: avoid BIT() macro usag=
e in the serio.h UAPI header)
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
Merging devicetree-fixes/dt/linus (35595372d95c Remove redundant YYLOC glob=
al declaration)
Merging scsi-fixes/fixes (ea697a8bf5a4 scsi: sd: Fix optimal I/O size for d=
evices that change reported values)
Merging drm-fixes/drm-fixes (16fbf79b0f83 Linux 5.6-rc7)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (16fbf79b0f83 Linux 5.6-rc7)
Merging mmc-fixes/fixes (16fbf79b0f83 Linux 5.6-rc7)
Merging rtc-fixes/rtc-fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging gnss-fixes/gnss-linus (f8788d86ab28 Linux 5.6-rc3)
Merging hyperv-fixes/hyperv-fixes (032d4a480220 hv: hyperv_vmbus.h: Replace=
 zero-length array with flexible-array member)
Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq h=
andlers after dpio create)
Merging risc-v-fixes/fixes (af91185d7e06 RISC-V: Move all address space def=
inition macros to one place)
Merging pidfd-fixes/fixes (10dab84caf40 pid: make ENOMEM return value more =
obvious)
Merging fpga-fixes/fixes (dec43da46f63 fpga: altera-ps-spi: Fix getting of =
optional confd gpio)
Merging spdx/spdx-linus (71db3aa2816d ASoC: MT6660: make spdxcheck.py happy)
Merging gpio-intel-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging pinctrl-intel-fixes/fixes (16fbf79b0f83 Linux 5.6-rc7)
Merging erofs-fixes/fixes (d1eef1c61974 Linux 5.5-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (47f7826c520e drm/radeon: fix s=
catter-gather mapping with user pages)
Merging kspp-gustavo/for-next/kspp (90e5d84c7b06 xattr.h: Replace zero-leng=
th array with flexible-array member)
Merging kbuild/for-next (06de758eac74 Merge branch 'kbuild-asinstr' into fo=
r-next)
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
Merging arm-soc/for-next (a9295ff5fc97 soc: document merges)
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
Merging mediatek/for-next (3433138ad469 Merge branch 'v5.6-next/soc' into f=
or-next)
Merging mvebu/for-next (912e10bb5888 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (e90f16cc1a48 Merge branch 'fixes' into for-next)
Merging qcom/for-next (8dc3769c8a68 Merge branches 'arm64-for-5.7', 'arm64-=
defconfig-for-5.7', 'defconfig-for-5.7', 'drivers-for-5.7' and 'dts-for-5.7=
' into for-next)
Merging raspberrypi/for-next (d886ff4d2a6a ARM: dts: bcm2711: Move emmc2 in=
to its own bus)
Merging realtek/for-next (45698e00d5a9 Merge branch 'v5.6/dt' into next)
Merging renesas/next (bf4540d5148c Merge branch 'renesas-arm64-dt-for-v5.7'=
 into renesas-next)
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
CONFLICT (content): Merge conflict in drivers/phy/tegra/xusb.c
CONFLICT (content): Merge conflict in drivers/phy/tegra/Kconfig
Merging clk/clk-next (a89255cda204 Merge branch 'clk-fixes' into clk-next)
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
Merging mips/mips-next (aebdc6ff3b2e MIPS: Exclude more dsemul code when CO=
NFIG_MIPS_FP_SUPPORT=3Dn)
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
Merging s390/features (b09fcecb6c91 s390/cio: use fallthrough;)
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
Merging btrfs/for-next (5159d9854910 Merge branch 'for-next-next-v5.6-20200=
326' into for-next-20200326)
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
Merging ext3/for_next (03582496e01d Pull fanotify name event patches from A=
mir.)
Merging ext4/dev (c8980e1980cc ext4: disable dioread_nolock whenever delaye=
d allocation is disabled)
Merging f2fs/dev (6536a9e3ffcf f2fs: fix to avoid double unlock)
Merging fsverity/fsverity (98d54f81e36b Linux 5.6-rc4)
Merging fuse/for-next (3e8cb8b2eaeb fuse: fix stack use after return)
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (df513a771171 SUNRPC: fix krb5p mount to provide lar=
ge enough buffer in rq_rcvsize)
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
Merging xfs/for-next (27fb5a72f50a xfs: prohibit fs freezing when using emp=
ty transactions)
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
Merging pci/next (4d19a08cd204 Merge branch 'remotes/lorenzo/pci/vmd')
CONFLICT (content): Merge conflict in MAINTAINERS
Merging pstore/for-next/pstore (8128d3aac0ee pstore/ram: Replace zero-lengt=
h array with flexible-array member)
Merging hid/for-next (c2320c3ee0e6 Merge branch 'for-5.6/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (a373970f6c5a Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i3c/i3c/next (cd851485ef29 i3c: master: Replace zero-length array w=
ith flexible-array member)
Merging dmi/master (f8e46ab9e9c7 firmware: dmi: Add macro SMBIOS_ENTRY_POIN=
T_SCAN_START)
Merging hwmon-staging/hwmon-next (5b10a8194664 docs: hwmon: Update document=
ation for isl68137 pmbus driver)
Merging jc_docs/docs-next (19e91e543c82 MAINTAINERS: adjust to filesystem d=
oc ReST conversion)
CONFLICT (content): Merge conflict in MAINTAINERS
CONFLICT (content): Merge conflict in Documentation/kbuild/index.rst
CONFLICT (content): Merge conflict in Documentation/filesystems/zonefs.rst
Merging v4l-dvb/master (ad71693f41aa media: mtk-vpu: load vpu firmware from=
 the new location)
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
Merging rdma/for-next (1f3db161881b IB/mlx5: Generally use the WC auto dete=
ction test result)
Merging net-next/master (92b7e62e5630 Merge branch 'mlxsw-Offload-TC-action=
-pedit-munge-dsfield')
CONFLICT (content): Merge conflict in net/mac80211/tx.c
CONFLICT (content): Merge conflict in fs/sysfs/group.c
Merging bpf-next/master (f54a5bba1203 bpf: Remove unused vairable 'bpf_xdp_=
link_lops')
Merging ipsec-next/master (dda520c4d462 ESP: Export esp_output_fill_trailer=
 function)
Merging mlx5-next/mlx5-next (826096d84f50 mlx5: Remove uninitialized use of=
 key in mlx5_core_create_mkey)
Merging netfilter-next/master (dc264f1f7ece netfilter: flowtable: fix NULL =
pointer dereference in tunnel offload support)
Merging ipvs-next/master (d54725cd11a5 netfilter: nf_tables: support for mu=
ltiple devices per netdev hook)
Merging wireless-drivers-next/master (3af4da165f48 hostap: convert to struc=
t proc_ops)
Merging bluetooth/master (da49b602f7f7 Bluetooth: L2CAP: Use DEFER_SETUP to=
 group ECRED connections)
Merging mac80211-next/master (1e8f471425f4 mac80211_hwsim: notify wmediumd =
of used MAC addresses)
Merging gfs2/for-next (490031281d5a gfs2: Additional information when gfs2_=
ail1_flush withdraws)
Merging mtd/mtd/next (245bbe80e01b Merge tag 'spi-nor/for-5.7' into mtd/nex=
t)
Merging nand/nand/next (fca88925d769 mtd: rawnand: toshiba: Support reading=
 the number of bitflips for BENAND (Built-in ECC NAND))
Merging spi-nor/spi-nor/next (f3f2b7eb2f1c mtd: spi-nor: Enable locking for=
 n25q512ax3/n25q512a)
Merging crypto/master (f6913d040c8d crypto: chelsio - remove set but not us=
ed variable 'adap')
Merging drm/drm-next (c2556238120b Merge branch 'feature/staging_sm5' of gi=
t://people.freedesktop.org/~sroland/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gvt/vgpu.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gvt/display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_lrc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.c
CONFLICT (content): Merge conflict in arch/arm/configs/omap2plus_defconfig
Merging amdgpu/drm-next (32f89c5eb4d4 drm/amdgpu/display: fix logic inversi=
on in program_timing_sync())
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.c
Merging drm-intel/for-linux-next (2bdd4c28baff drm/i915/display: Fix mode p=
rivate_flags comparison at atomic_check)
Merging drm-tegra/drm/tegra/for-next (e32c8c2a5fbe drm/tegra: hdmi: Silence=
 deferred-probe error)
Merging drm-misc/for-linux-next (a65a97b48694 drm/vboxvideo: Add missing re=
move_conflicting_pci_framebuffers call, v2)
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
Merging sound/for-next (2ceb65cd04a9 ALSA: usb-audio: Update the documentat=
ion for the new delayed_register option)
Merging sound-asoc/for-next (b21b5c7792fe Merge branch 'asoc-5.7' into asoc=
-next)
Merging modules/modules-next (0f74226649fb kernel: module: Replace zero-len=
gth array with flexible-array member)
Merging input/next (10ad4845cd3d dt-bindings: touchscreen: Convert edt-ft5x=
06 to json-schema)
Applying: Input: goodix - mark as BROKEN for noe
Merging block/for-next (9ee29140f266 Merge branch 'for-5.7/libata' into for=
-next)
Merging device-mapper/for-next (31843edab7cb dm integrity: improve discard =
in journal mode)
Merging pcmcia/pcmcia-next (6d3fbe919b83 pcmcia: Use scnprintf() for avoidi=
ng potential buffer overflow)
Merging mmc/next (d4a384cb563e mmc: mmci_sdmmc: Fix clear busyd0end irq fla=
g)
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
Merging tomoyo/master (9efcc4a12936 afs: Fix unpinned address list during p=
robing)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging tpmdd/next (2e356101e72a KEYS: reaching the keys quotas correctly)
Merging watchdog/master (f667421324ed watchdog: npcm: remove whitespaces)
Merging iommu/next (cdce0c035f07 Merge branches 'iommu/fixes', 'arm/qcom', =
'arm/omap', 'arm/smmu', 'x86/amd', 'virtio' and 'core' into next)
Merging vfio/next (48219795e7db Merge branches 'v5.7/vfio/alex-sriov-v3' an=
d 'v5.7/vfio/yan-dma-rw-v4' into v5.7/vfio/next)
Merging audit/next (1320a4052ea1 audit: trigger accompanying records when n=
o rules present)
Merging devicetree/for-next (fd38c90e74c5 dt-bindings: Add missing 'additio=
nalProperties: false')
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/usb=
/generic.txt
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/tri=
vial-devices.yaml
Merging mailbox/mailbox-for-next (0a67003b1985 mailbox: imx: add SCU MU sup=
port)
Merging spi/for-next (d70e669eadf1 Merge branch 'spi-5.7' into spi-next)
Merging tip/auto-latest (7683c335f2e9 Merge branch 'perf/core')
CONFLICT (content): Merge conflict in include/linux/arch_topology.h
CONFLICT (content): Merge conflict in drivers/thermal/cpufreq_cooling.c
CONFLICT (content): Merge conflict in arch/x86/Kconfig
Applying: power: reset: sc27xx: use remove_cpu instead of cpu_down
Merging clockevents/timers/drivers/next (4f41fe386a94 clocksource/drivers/t=
imer-probe: Avoid creating dead devices)
Merging edac/edac-for-next (ad49d9a8228e Merge branch 'edac-misc' into edac=
-for-next)
Merging irqchip/irq/irqchip-next (771df8cf0bc3 Merge branch 'irq/gic-v4.1' =
into irq/irqchip-next)
Applying: Revert "irqchip/xilinx: Do not call irq_set_default_host()"
Applying: Revert "irqchip/xilinx: Enable generic irq multi handler"
Merging ftrace/for-next (bbd9d05618a6 gpu/trace: add a gpu total memory usa=
ge tracepoint)
Merging rcu/rcu/next (c4ee749cffa9 rcu-tasks: Add IPI failure count to stat=
istics)
CONFLICT (content): Merge conflict in tools/memory-model/litmus-tests/.giti=
gnore
Merging kvm/linux-next (8bf8961332bd Merge tag 'kvm-s390-next-5.7-2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
CONFLICT (content): Merge conflict in tools/testing/selftests/kvm/.gitignore
Merging kvm-arm/next (463050599742 Merge tag 'kvm-arm-removal' into kvmarm-=
master/next)
CONFLICT (modify/delete): arch/arm/kvm/coproc.c deleted in kvm-arm/next and=
 modified in HEAD. Version HEAD of arch/arm/kvm/coproc.c left in tree.
$ git rm -f arch/arm/kvm/coproc.c
Merging kvm-ppc/kvm-ppc-next (9a5788c615f5 KVM: PPC: Book3S HV: Add a capab=
ility for enabling secure guests)
Merging kvms390/next (f3dd18d444c7 KVM: s390: mark sie block as 512 byte al=
igned)
Merging xen-tip/linux-next (e63de44d28ca xen/xenbus: remove unused xenbus_m=
ap_ring())
Merging percpu/for-next (cfe2a689f755 Merge branch 'for-5.7' into for-next)
Merging workqueues/for-next (4acf8a423cd3 Merge branch 'for-5.7' into for-n=
ext)
Merging drivers-x86/for-next (b1f81b496b0d platform/x86: surface3_power: MS=
HW0011 rev-eng implementation)
CONFLICT (content): Merge conflict in drivers/platform/x86/intel_pmc_core.c
Merging chrome-platform/for-next (e0db7c42b05f platform/chrome: wilco_ec: e=
vent: Replace zero-length array with flexible-array member)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (10a6cce3c1a1 Group LED functions according to functi=
onality, and add some explaining comments.)
Merging ipmi/for-next (26455d00ee58 drivers: char: ipmi: ipmi_msghandler: P=
ass lockdep expression to RCU lists)
Merging driver-core/driver-core-next (c442a0d18744 driver core: Set fw_devl=
ink to "permissive" behavior by default)
CONFLICT (content): Merge conflict in drivers/platform/x86/Kconfig
Merging usb/usb-next (a599a0fb629a usb: core: Add ACPI support for USB inte=
rface devices)
Merging usb-gadget/next (4a5dbd900957 dt-bindings: usb: add documentation f=
or aspeed usb-vhub)
Merging usb-serial/usb-next (57aa9f294b09 USB: serial: io_edgeport: fix sla=
b-out-of-bounds read in edge_interrupt_callback)
Merging usb-chipidea-next/ci-for-usb-next (d9958306d4be USB: chipidea: Use =
the correct style for SPDX License Identifier)
Merging phy-next/next (89d715371a05 phy: qcom-qusb2: Add new overriding tun=
ing parameters in QUSB2 V2 PHY)
Merging tty/tty-next (a0c4adeeea84 ARM: dts: tango4: Make /serial compatibl=
e with ns16550a)
Merging char-misc/char-misc-next (844003052719 nvmem: core: remove nvmem_sy=
sfs_get_groups())
Merging extcon/extcon-next (9c94553099ef extcon: axp288: Add wakeup support)
Merging soundwire/next (39ec6f992131 soundwire: qcom: add support for get_s=
dw_stream())
Merging thunderbolt/next (3010518964dc thunderbolt: Use scnprintf() for avo=
iding potential buffer overflow)
Merging staging/staging-next (f1a49bb9c819 staging: rtl8723bs: Remove blank=
 line before '}' brace)
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
Merging slave-dma/next (cea582b5ee56 dt-bindings: dma: renesas,usb-dmac: ad=
d r8a77961 support)
CONFLICT (content): Merge conflict in drivers/dma/ti/k3-udma.c
Merging cgroup/for-next (6fc331767f41 Merge branch 'for-5.7' into for-next)
Merging scsi/for-next (d04d18197cf5 Merge branch 'misc' into for-next)
CONFLICT (modify/delete): Documentation/scsi/scsi_mid_low_api.txt deleted i=
n scsi/for-next and modified in HEAD. Version HEAD of Documentation/scsi/sc=
si_mid_low_api.txt left in tree.
$ git rm -f Documentation/scsi/scsi_mid_low_api.txt
Applying: scsi: fix up for "scsi: simplify scsi_partsize"
Merging scsi-mkp/for-next (9b88984658fb scsi: pm80xx: Introduce read and wr=
ite length for IOCTL payload structure)
Merging vhost/linux-next (d40662d5f12b virtio-net: Introduce hash report fe=
ature)
Merging rpmsg/for-next (45c2824de341 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7d52bac0fadc Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (975516250253 tools: gpio: Fix typo in gpio=
-utils)
Merging gpio-intel/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging pinctrl/for-next (492464cd464d pinctrl: freescale: drop the depende=
ncy on ARM64 for i.MX8M)
Merging pinctrl-intel/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging pinctrl-samsung/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging pwm/for-next (9871abffc810 pwm: Remove set but not set variable 'pw=
m')
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
Merging rtc/rtc-next (f1cd223389f0 dt-bindings: rtc: Convert and update jz4=
740-rtc doc to YAML)
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
Merging nvmem/for-next (990df6402752 nvmem: mxs-ocotp: Use devm_add_action_=
or_reset() for cleanup)
CONFLICT (modify/delete): drivers/nvmem/nvmem-sysfs.c deleted in HEAD and m=
odified in nvmem/for-next. Version nvmem/for-next of drivers/nvmem/nvmem-sy=
sfs.c left in tree.
$ git rm -f drivers/nvmem/nvmem-sysfs.c
Merging xarray/xarray (7e934cf5ace1 xarray: Fix early termination of xas_fo=
r_each_marked)
Merging hyperv/hyperv-next (cb489303edd7 hv: hyperv_vmbus.h: Replace zero-l=
ength array with flexible-array member)
Merging auxdisplay/auxdisplay (2f920c0f0e29 auxdisplay: charlcd: replace ze=
ro-length array with flexible-array member)
Merging kgdb/kgdb/for-next (5ea771abd5a3 kdb: Censor attempts to set PROMPT=
 without ENABLE_MEM_READ)
Merging pidfd/for-next (6952a4f64644 selftests: add pid namespace ENOMEM re=
gression test)
Merging devfreq/devfreq-next (7a51320ecd39 PM / devfreq: Get rid of some do=
c warnings)
Merging hmm/hmm (08ddddda667b mm/hmm: check the device private page owner i=
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
Merging kunit-next/kunit (e23349af9ee2 kunit: tool: add missing test data f=
ile content)
Merging trivial/for-next (fad7c9020948 err.h: remove deprecated PTR_RET for=
 good)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging akpm-current/current (b6ae72947bd4 ipc/mqueue.c: fix a brace coding=
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
Merging akpm/master (0c798dc606fe drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/IegWs5a=mfpbYoQ1BPJELmw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl59tEwACgkQAVBC80lX
0GxxmQf9GBpQkKK57rSxIuDwYnJdwjx1P5iygL36R7DK+5fXqkBs6njRZTvSBezD
iKT5kD7rapjPHjUqNGJFvJCMbObWIYZkOBNndgHYD96MRhCCOxL2X0XbQz6raJN/
sygZOiV6eyoTTmyf4ZakBM+J9uwjDkX9Dk0a2Y4Rk1S3+TlKXXPcoU+g1F2uRRP/
kdwvhc/lOH1T3FSBi3cRzsdR/XbACe3ez/aWeqygok3jAKCMvpmsj/+x+tVTFZBS
bUcUbiAHLEmz0TwQ08cdYa9RLvy/iZDfKWQ8s06fYBPInx9ky6WCsUxUT5WV6ySv
sa4MVkmnp1+km6Pbvo1gxzpk27bpoQ==
=ve2m
-----END PGP SIGNATURE-----

--Sig_/IegWs5a=mfpbYoQ1BPJELmw--
