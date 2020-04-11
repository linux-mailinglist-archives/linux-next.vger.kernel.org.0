Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92C381A4D9B
	for <lists+linux-next@lfdr.de>; Sat, 11 Apr 2020 05:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbgDKDTU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Apr 2020 23:19:20 -0400
Received: from ozlabs.org ([203.11.71.1]:57447 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726657AbgDKDTT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 10 Apr 2020 23:19:19 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48zg8f0JMdz9sSj;
        Sat, 11 Apr 2020 13:19:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1586575154;
        bh=t3UQYgFwj+2yA0VXtO2BHXHWBV8q9BDj2/iyYvXyOXU=;
        h=Date:From:To:Cc:Subject:From;
        b=FeOG/Hiea82a9kaDgbqAZBv1cbfmqKW7ROrvyQ1xbmM/FpRpM81keZsI3BWJYzPWe
         DPgXhrXHQwaUWMJWhZYrIkDgo1lZYZy1gSPR1nWOKNBLvnyRj/M2f/lm5AiS57BJry
         kzaZkr0eiJRyV7KHobS0FAEwrVyGKPpXBEmp35niS2vAxv4f5vJTZMP4QU0R8sYADu
         gqwUqZXGJx3VPv62Z5NXMSVOLTx67BULom5M0viaXFPQsvbZ3tyNzaYEcOtW5Dbzov
         bePcPTRC1Xn29QVpKW4BT8pW5jJmi7gB8Vd24SBmIKclxntbyc5f09qERP1aaQwWMq
         dKxCHsmNl4/Kg==
Date:   Sat, 11 Apr 2020 13:19:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 11
Message-ID: <20200411131912.0d18f6de@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1_PS=2V+JzhgGajO98FGV+1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1_PS=2V+JzhgGajO98FGV+1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

The merge window has opened, so please do not add any material for the
next release into your linux-next included trees/branches until after
the merge window closes.

Changes since 20200410:

Non-merge commits (relative to Linus' tree): 903
 1040 files changed, 24917 insertions(+), 7736 deletions(-)

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
Merging origin/master (ab6f762f0f53 printk: queue wake_up_klogd irq_work on=
ly if per-CPU areas are ready)
Merging fixes/master (a10c9c710f9e Merge tag 'for-v5.7' of git://git.kernel=
.org/pub/scm/linux/kernel/git/sre/linux-power-supply)
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
Merging s390-fixes/fixes (7111951b8d49 Linux 5.6)
Merging sparc/master (63bef48fd6c9 Merge branch 'akpm' (patches from Andrew=
))
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (40fc7ad2c886 Merge git://git.kernel.org/pub/scm/linux/k=
ernel/git/bpf/bpf)
Merging bpf/master (40fc7ad2c886 Merge git://git.kernel.org/pub/scm/linux/k=
ernel/git/bpf/bpf)
Merging ipsec/master (0452800f6db4 net: dsa: mt7530: fix null pointer deref=
erencing in port5 setup)
Merging netfilter/master (40fc7ad2c886 Merge git://git.kernel.org/pub/scm/l=
inux/kernel/git/bpf/bpf)
Merging ipvs/master (0141317611ab Merge branch 'hns3-fixes')
Merging wireless-drivers/master (c9be1a642a7b ath11k: fix compiler warnings=
 without CONFIG_THERMAL)
Merging mac80211/master (0452800f6db4 net: dsa: mt7530: fix null pointer de=
referencing in port5 setup)
Merging rdma-fixes/for-rc (7111951b8d49 Linux 5.6)
Merging sound-current/for-linus (ddd5609fe8b6 Merge tag 'asoc-fix-v5.7' of =
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-linu=
s)
Merging sound-asoc-fixes/for-linus (33c385056aad Merge branch 'asoc-5.7' in=
to asoc-linus)
Merging regmap-fixes/for-linus (87fc8230f7aa Merge branch 'regmap-5.6' into=
 regmap-linus)
Merging regulator-fixes/for-linus (bae4cb90541a Merge branch 'regulator-5.6=
' into regulator-linus)
Merging spi-fixes/for-linus (5bdb4c95849d Merge branch 'spi-5.7' into spi-l=
inus)
Merging pci-current/for-linus (7e63420847ae Merge tag 'acpi-5.7-rc1-2' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging driver-core.current/driver-core-linus (c0cc271173b2 Merge tag 'modu=
les-for-v5.7' of git://git.kernel.org/pub/scm/linux/kernel/git/jeyu/linux)
Merging tty.current/tty-linus (c0cc271173b2 Merge tag 'modules-for-v5.7' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/jeyu/linux)
Merging usb.current/usb-linus (c0cc271173b2 Merge tag 'modules-for-v5.7' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/jeyu/linux)
Merging usb-gadget-fixes/fixes (42cd5ffe46c1 usb: dwc3: debug: fix string p=
osition formatting mixup with ret and len)
Merging usb-serial-fixes/usb-linus (16fbf79b0f83 Linux 5.6-rc7)
Merging usb-chipidea-fixes/ci-for-usb-stable (7cbf3dd3139a usb: chipidea: u=
dc: fix sleeping function called from invalid context)
Merging phy/fixes (be4e3c737eeb phy: mapphone-mdm6600: Fix timeouts by addi=
ng wake-up handling)
Merging staging.current/staging-linus (a10c9c710f9e Merge tag 'for-v5.7' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply)
Merging char-misc.current/char-misc-linus (c0cc271173b2 Merge tag 'modules-=
for-v5.7' of git://git.kernel.org/pub/scm/linux/kernel/git/jeyu/linux)
Merging soundwire-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging thunderbolt-fixes/fixes (7111951b8d49 Linux 5.6)
Merging input-current/for-linus (cd510679f4b5 Merge branch 'next' into for-=
linus)
Merging crypto-current/master (755bddd1e4ea crypto: marvell/octeontx - fix =
double free of ptr)
Merging ide/master (63bef48fd6c9 Merge branch 'akpm' (patches from Andrew))
Merging vfio-fixes/for-linus (95f89e090618 vfio/type1: Initialize resv_msi_=
base)
Merging kselftest-fixes/fixes (f3a60268f5ce selftest/lkdtm: Use local .giti=
gnore)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging slave-dma-fixes/fixes (018af9be3dd5 dmaengine: ti: k3-udma-glue: Fi=
x an error handling path in 'k3_udma_glue_cfg_rx_flow()')
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (2098c564701c mtd: spi-nor: Compile files in co=
ntrollers/ directory)
Merging mfd-fixes/for-mfd-fixes (603d9299da32 mfd: mt6397: Fix probe after =
changing mt6397-core)
Merging v4l-dvb-fixes/fixes (2632e7b618a7 media: venus: firmware: Ignore se=
cure call error on first resume)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (f7d5f5655ef7 MAINTAINERS: Correct MIPS patch=
work URL)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (07bdc492cff6 ARM: dts: OMAP3: disable RNG on N950=
/N9)
Merging kvm-fixes/master (dbef2808af6c KVM: VMX: fix crash cleanup when KVM=
 wasn't used)
Merging kvms390-fixes/master (1493e0f944f3 KVM: s390: vsie: Fix possible ra=
ce when shadowing region 3 tables)
Merging hwmon-fixes/hwmon (18f80ac3067b hwmon: (k10temp) make some symbols =
static)
Merging nvdimm-fixes/libnvdimm-fixes (f84afbdd3a9e libnvdimm: Out of bounds=
 read in __nd_ioctl())
Merging btrfs-fixes/next-fixes (9dba7a236504 Merge branch 'misc-5.7' into n=
ext-fixes)
Merging vfs-fixes/fixes (5bd73286d50f fix a braino in legitimize_path())
Merging dma-mapping-fixes/for-linus (9c24eaf81cc4 iommu/vt-d: Return the co=
rrect dma mask when we are bypassing the IOMMU)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (1a323ea5356e x86: get rid of 'errret' argu=
ment to __get_user_xyz() macross)
Merging samsung-krzk-fixes/fixes (0d935f0bf77d ARM: dts: exynos: Fix regula=
tor node aliasing on Midas-based boards)
Merging pinctrl-samsung-fixes/pinctrl-fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging devicetree-fixes/dt/linus (49722d64c3f3 dt-bindings: interrupt-cont=
roller: Fix loongson,parent_int_map property schema)
Merging scsi-fixes/fixes (ea697a8bf5a4 scsi: sd: Fix optimal I/O size for d=
evices that change reported values)
Merging drm-fixes/drm-fixes (c4b979ebcafe Merge tag 'amd-drm-fixes-5.6-2020=
-03-26' of git://people.freedesktop.org/~agd5f/linux into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (7111951b8d49 Linux 5.6)
Merging mmc-fixes/fixes (2a7e3035f89d mmc: core: make mmc_interrupt_hpi() s=
tatic)
Merging rtc-fixes/rtc-fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging gnss-fixes/gnss-linus (f8788d86ab28 Linux 5.6-rc3)
Merging hyperv-fixes/hyperv-fixes (c30f3a90eac5 x86/Hyper-V: Report crash d=
ata in die() when panic_on_oops is set)
Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq h=
andlers after dpio create)
Merging risc-v-fixes/fixes (2191b4f298fa RISC-V: Move all address space def=
inition macros to one place)
Merging pidfd-fixes/fixes (10dab84caf40 pid: make ENOMEM return value more =
obvious)
Merging fpga-fixes/fixes (3c2760b78f90 fpga: dfl: pci: fix return value of =
cci_pci_sriov_configure)
Merging spdx/spdx-linus (c0cc271173b2 Merge tag 'modules-for-v5.7' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/jeyu/linux)
Merging gpio-intel-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging pinctrl-intel-fixes/fixes (16fbf79b0f83 Linux 5.6-rc7)
Merging erofs-fixes/fixes (d1eef1c61974 Linux 5.5-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (83a196773b8b drm/bridge: analo=
gix_dp: Split bind() into probe() and real bind())
Merging kspp-gustavo/for-next/kspp (90e5d84c7b06 xattr.h: Replace zero-leng=
th array with flexible-array member)
Merging kbuild/for-next (a0d1c951ef08 kbuild: support LLVM=3D1 to switch th=
e default tools to Clang/LLVM)
Merging compiler-attributes/compiler-attributes (98d54f81e36b Linux 5.6-rc4)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (9bb50ed74709 dma-debug: fix displaying of dma=
 allocation type)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (52d3b2f98483 Merge branch 'devel-stable' into for-nex=
t)
Merging arm64/for-next/core (fc2266011acc arm64: armv8_deprecated: Fix unde=
f_hook mask for thumb setend)
Merging arm-perf/for-next/perf (8673e02e5841 arm64: perf: Add support for A=
RMv8.5-PMU 64-bit counters)
Merging arm-soc/for-next (d9725e56e1d8 soc: document merges)
Merging amlogic/for-next (b40f5228c5f6 Merge branch 'v5.7/drivers' into tmp=
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
Merging scmi/for-linux-next (7e63420847ae Merge tag 'acpi-5.7-rc1-2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging sunxi/sunxi/for-next (8afff9da61ea Merge branch 'sunxi/dt-for-5.7' =
into sunxi/for-next)
Merging tegra/for-next (df0a178cf2df Merge branch for-5.7/usb into for-next)
Merging clk/clk-next (28ecaf1c30fe Merge branches 'clk-unisoc', 'clk-tegra'=
, 'clk-qcom' and 'clk-imx' into clk-next)
Merging clk-samsung/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (b8e9c96a8f70 csky: Fixup compile error for abiv1 e=
ntry.S)
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
Merging nios2/for-next (0ec8a5054d7f MAINTAINERS: Remove nios2-dev@lists.ro=
cketboards.org)
Merging openrisc/for-next (9737e2c5f0bc openrisc: Remove obsolete show_trac=
e_task function)
Merging parisc-hd/for-next (7111951b8d49 Linux 5.6)
Merging powerpc/next (6ba4a2d35910 selftests/powerpc: Always build the tm-p=
oison test 64-bit)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (461c3ac0dc46 soc: fsl: qe: fix sparse warnings for uc=
c_slow.c)
Merging risc-v/for-next (37809df4b1c8 riscv: create a loader.bin boot image=
 for Kendryte SoC)
Merging sifive/for-next (467e050e9760 Merge branch 'i2c/for-current' of git=
://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging s390/features (2bc55eaeb88d s390/cio: generate delayed uevent for v=
fio-ccw subchannels)
Merging sh/sh-next (a193018e5290 sh: add missing EXPORT_SYMBOL() for __dela=
y)
Merging sparc-next/master (b71acb0e3721 Merge branch 'linus' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging uml/linux-next (4a7c46247f9c um: Remove some unnecessary NULL check=
s in vector_user.c)
Merging xtensa/xtensa-for-next (70cbddb97385 arch/xtensa: fix grammar in Kc=
onfig help text)
Merging fscrypt/master (861261f2a9cc ubifs: wire up FS_IOC_GET_ENCRYPTION_N=
ONCE)
Merging afs/afs-next (4fe171bb81b1 afs: Remove set but not used variable 'r=
et')
Merging btrfs/for-next (5a7ef5cb05dc Merge branch 'for-next-current-v5.6-20=
200331' into for-next-20200331)
Merging ceph/master (0001e2774451 rbd: don't mess with a page vector in rbd=
_notify_op_lock())
Merging cifs/for-next (4e8aea30f775 smb3: enable swap on SMB3 mounts)
Merging configfs/for-next (e2f238f7d5a1 configfs: calculate the depth of pa=
rent item)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (20741a6e146c MAINTAINERS: erofs: update my email address)
Merging ext3/for_next (a32f0ecd79b4 Merge fanotify fix from Nathan Chancell=
or.)
Merging ext4/dev (54d3adbc29f0 ext4: save all error info in save_error_info=
() and drop ext4_set_errno())
Merging f2fs/dev (63bef48fd6c9 Merge branch 'akpm' (patches from Andrew))
Merging fsverity/fsverity (98d54f81e36b Linux 5.6-rc4)
Merging fuse/for-next (3e8cb8b2eaeb fuse: fix stack use after return)
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (93ce4af774bc NFS: Clean up process of marking inode=
 stale.)
Merging nfs-anna/linux-next (55dee1bc0d72 nfs: add minor version to nfs_ser=
ver_key for fscache)
Merging nfsd/nfsd-next (2653de9f0398 fs: nfsd: fileache.c: Use built-in RCU=
 list checking)
CONFLICT (content): Merge conflict in net/sunrpc/cache.c
Merging orangefs/for-next (aa317d3351de orangefs: clarify build steps for t=
est server in orangefs.txt)
CONFLICT (content): Merge conflict in Documentation/filesystems/orangefs.rst
Merging overlayfs/overlayfs-next (2eda9eaa6d7e ovl: document xino expected =
behavior)
Merging ubifs/linux-next (3676f32a98cd ubi: ubi-media.h: Replace zero-lengt=
h array with flexible-array member)
Merging v9fs/9p-next (c6f141412d24 9p: document short read behaviour with O=
_NONBLOCK)
Merging xfs/for-next (5833112df7e9 xfs: reflink should force the log out if=
 mounted with wsync)
Merging zonefs/for-next (0dda2ddb7ded zonefs: select FS_IOMAP)
Merging iomap/iomap-for-next (457df33e035a iomap: Handle memory allocation =
failure in readahead)
Merging djw-vfs/vfs-for-next (56939e014a6c hibernate: Allow uswsusp to writ=
e to swap)
Merging file-locks/locks-next (dbdaf6a3250b locks: reinstate locks_delete_b=
lock optimization)
Merging vfs/for-next (ffca8b2a77f2 Merge branch 'work.exfat' into for-next)
Merging printk/for-next (d34f14ae521f Merge branch 'for-5.7-preferred-conso=
le' into for-next)
Merging pci/next (7e63420847ae Merge tag 'acpi-5.7-rc1-2' of git://git.kern=
el.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging pstore/for-next/pstore (8128d3aac0ee pstore/ram: Replace zero-lengt=
h array with flexible-array member)
Merging hid/for-next (04f6305f8071 Merge branch 'for-5.8/logitech' into for=
-next)
Merging i2c/i2c/for-next (a10c9c710f9e Merge tag 'for-v5.7' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/sre/linux-power-supply)
Merging i3c/i3c/next (c4b9de11d010 i3c: convert to use i2c_new_client_devic=
e())
Merging dmi/master (12028f913eb9 firmware/dmi: Report DMI Bios & EC firmwar=
e release)
Merging hwmon-staging/hwmon-next (5b10a8194664 docs: hwmon: Update document=
ation for isl68137 pmbus driver)
Merging jc_docs/docs-next (befacdcf47d4 Documentation: android: binderfs: a=
dd 'stats' mount option)
Merging v4l-dvb/master (2632e7b618a7 media: venus: firmware: Ignore secure =
call error on first resume)
Merging v4l-dvb-next/master (54ecb8f7028c Linux 5.4-rc1)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (d3e5e977abe2 Merge tag 'acpi-5.7-rc1-3' of git://git=
.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging cpufreq-arm/cpufreq/arm/linux-next (a8811ec764f9 cpufreq: qcom: Add=
 support for krait based socs)
Merging cpupower/cpupower (2de7fb60a474 cpupower: avoid multiple definition=
 with gcc -fno-common)
Merging opp/opp/linux-next (03758d60265c opp: Replace list_kref with a loca=
l counter)
Merging thermal/thermal/linux-next (df1982294937 thermal: Delete an error m=
essage in four functions)
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
Merging net-next/master (63bef48fd6c9 Merge branch 'akpm' (patches from And=
rew))
Merging bpf-next/master (1a323ea5356e x86: get rid of 'errret' argument to =
__get_user_xyz() macross)
Merging ipsec-next/master (308491755f36 xfrm: add prep for esp beet mode of=
fload)
Merging mlx5-next/mlx5-next (826096d84f50 mlx5: Remove uninitialized use of=
 key in mlx5_core_create_mkey)
Merging netfilter-next/master (1a323ea5356e x86: get rid of 'errret' argume=
nt to __get_user_xyz() macross)
Merging ipvs-next/master (d54725cd11a5 netfilter: nf_tables: support for mu=
ltiple devices per netdev hook)
Merging wireless-drivers-next/master (5988b8ec7132 Merge tag 'iwlwifi-next-=
for-kalle-2020-03-27' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlw=
ifi/iwlwifi-next)
Merging bluetooth/master (943d5d92c5e8 Bluetooth: log advertisement packet =
length if it gets corrected)
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
Merging drm/drm-next (74bd4f0c921c Merge tag 'amd-drm-fixes-5.7-2020-04-08'=
 of git://people.freedesktop.org/~agd5f/linux into drm-next)
Merging amdgpu/drm-next (552f15a96825 drm/amd/powerplay: force the trim of =
the mclk dpm_levels if OD is enabled)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/powerplay/renoir_=
ppt.c
Merging drm-intel/for-linux-next (1aaea8476d9f drm/i915/gem: Flush all the =
reloc_gpu batch)
Merging drm-tegra/drm/tegra/for-next (e32c8c2a5fbe drm/tegra: hdmi: Silence=
 deferred-probe error)
Merging drm-misc/for-linux-next (152cce0006ab drm/bridge: analogix_dp: Spli=
t bind() into probe() and real bind())
Merging drm-msm/msm-next (a5fb8b918920 drm/msm/a6xx: Use the DMA API for GM=
U memory objects)
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (2c76b324c794 drm/imx: parallel-display: Adjus=
t bus_flags handling)
Merging etnaviv/etnaviv/next (f232d9ec029c drm/etnaviv: fix TS cache flushi=
ng on GPUs with BLT engine)
Merging regmap/for-next (2060986f04ad Merge branch 'regmap-5.7' into regmap=
-next)
Merging sound/for-next (4df933252827 ALSA: ctxfi: Remove unnecessary cast i=
n kfree)
Merging sound-asoc/for-next (33c385056aad Merge branch 'asoc-5.7' into asoc=
-linus)
Merging modules/modules-next (0f74226649fb kernel: module: Replace zero-len=
gth array with flexible-array member)
Merging input/next (3a8579629665 Input: update SPDX tag for input-event-cod=
es.h)
Merging block/for-next (90f4ec68d119 Merge branch 'io_uring-5.7' into for-n=
ext)
Merging device-mapper/for-next (8267d8fb4819 dm integrity: fix logic bug in=
 integrity tag testing)
Merging pcmcia/pcmcia-next (a8c122f72d94 pcmcia: remove some unused space c=
haracters)
Merging mmc/next (92075d98abf0 mmc: cavium-octeon: remove nonsense variable=
 coercion)
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (d2923aa45356 mfd: intel-lpss: Fix Intel Elkhart L=
ake LPSS I2C input clock)
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
Merging smack/for-next (92604e825304 smack: use GFP_NOFS while holding inod=
e_smack::smk_lock)
Merging tomoyo/master (9efcc4a12936 afs: Fix unpinned address list during p=
robing)
Merging tpmdd/next (872b0971d74b tpm: ibmvtpm: retry on H_CLOSED in tpm_ibm=
vtpm_send())
Merging watchdog/master (ea104a9e4d3e watchdog: sp805: fix restart handler)
Merging iommu/next (ff68eb23308e Merge branches 'iommu/fixes', 'arm/qcom', =
'arm/omap', 'arm/smmu', 'x86/amd', 'x86/vt-d', 'virtio' and 'core' into nex=
t)
Merging vfio/next (f44efca0493d vfio: Ignore -ENODEV when getting MSI cooki=
e)
Merging audit/next (1320a4052ea1 audit: trigger accompanying records when n=
o rules present)
Merging devicetree/for-next (8967918e7cee MAINTAINERS: drop an old referenc=
e to stm32 pwm timers doc)
Merging mailbox/mailbox-for-next (0a67003b1985 mailbox: imx: add SCU MU sup=
port)
Merging spi/for-next (5bdb4c95849d Merge branch 'spi-5.7' into spi-linus)
Merging tip/auto-latest (1d625b673f44 Merge branch 'locking/urgent')
Merging clockevents/timers/drivers/next (c1ac28a4de6f Revert "clocksource: =
Avoid creating dead devices")
Merging edac/edac-for-next (ad49d9a8228e Merge branch 'edac-misc' into edac=
-for-next)
Merging irqchip/irq/irqchip-next (4cea749d56be Revert "irqchip/xilinx: Enab=
le generic irq multi handler")
Merging ftrace/for-next (8e99cf91b99b tracing: Do not allocate buffer in tr=
ace_find_next_entry() in atomic)
Merging rcu/rcu/next (aa93ec620be3 Merge branches 'doc.2020.02.27a', 'fixes=
.2020.03.21a', 'kfree_rcu.2020.02.20a', 'locktorture.2020.02.20a', 'ovld.20=
20.02.20a', 'rcu-tasks.2020.02.20a', 'srcu.2020.02.20a' and 'torture.2020.0=
2.20a' into HEAD)
Merging kvm/linux-next (dbef2808af6c KVM: VMX: fix crash cleanup when KVM w=
asn't used)
Merging kvm-arm/next (463050599742 Merge tag 'kvm-arm-removal' into kvmarm-=
master/next)
Merging kvm-ppc/kvm-ppc-next (9a5788c615f5 KVM: PPC: Book3S HV: Add a capab=
ility for enabling secure guests)
Merging kvms390/next (7a2653612bb6 s390/gmap: return proper error code on k=
sm unsharing)
Merging xen-tip/linux-next (0e1b42710787 x86/xen: make xen_pvmmu_arch_setup=
() static)
Merging percpu/for-next (dedac37ea96b Merge branch 'for-5.7' into for-next)
Merging workqueues/for-next (4acf8a423cd3 Merge branch 'for-5.7' into for-n=
ext)
Merging drivers-x86/for-next (1a323ea5356e x86: get rid of 'errret' argumen=
t to __get_user_xyz() macross)
Merging chrome-platform/for-next (a46387712da1 platform/chrome: cros_ec_spi=
: Wait for USECS, not NSECS)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (10a6cce3c1a1 Group LED functions according to functi=
onality, and add some explaining comments.)
CONFLICT (content): Merge conflict in drivers/leds/Makefile
Merging ipmi/for-next (e96387677c2a ipmi: kcs: Fix aspeed_kcs_probe_of_v1())
Merging driver-core/driver-core-next (c0cc271173b2 Merge tag 'modules-for-v=
5.7' of git://git.kernel.org/pub/scm/linux/kernel/git/jeyu/linux)
Merging usb/usb-next (c0cc271173b2 Merge tag 'modules-for-v5.7' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/jeyu/linux)
Merging usb-gadget/next (4a5dbd900957 dt-bindings: usb: add documentation f=
or aspeed usb-vhub)
Merging usb-serial/usb-next (57aa9f294b09 USB: serial: io_edgeport: fix sla=
b-out-of-bounds read in edge_interrupt_callback)
Merging usb-chipidea-next/ci-for-usb-next (95caa2ae70fd usb: chipidea: allo=
w disabling glue drivers if EMBEDDED)
Merging phy-next/next (89d715371a05 phy: qcom-qusb2: Add new overriding tun=
ing parameters in QUSB2 V2 PHY)
Merging tty/tty-next (c0cc271173b2 Merge tag 'modules-for-v5.7' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/jeyu/linux)
Merging char-misc/char-misc-next (c0cc271173b2 Merge tag 'modules-for-v5.7'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/jeyu/linux)
Merging extcon/extcon-next (9c94553099ef extcon: axp288: Add wakeup support)
Merging soundwire/next (39ec6f992131 soundwire: qcom: add support for get_s=
dw_stream())
Merging thunderbolt/next (3010518964dc thunderbolt: Use scnprintf() for avo=
iding potential buffer overflow)
Merging staging/staging-next (a10c9c710f9e Merge tag 'for-v5.7' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply)
Merging mux/for-next (f356d58c3a04 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (03c4e6186bbb interconnect: qcom: Add OSM L3 support o=
n SC7180)
Merging slave-dma/next (cea582b5ee56 dt-bindings: dma: renesas,usb-dmac: ad=
d r8a77961 support)
Merging cgroup/for-next (772b31406692 xattr: fix uninitialized out-param)
Merging scsi/for-next (c128052e6991 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (1b55940b9bcc scsi: core: Add DID_ALLOC_FAILURE a=
nd DID_MEDIUM_ERROR to hostbyte_table)
Merging vhost/linux-next (0070d8b001a4 vdpa: allow a 32 bit vq alignment)
Merging rpmsg/for-next (45c2824de341 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (4ed7d7dd4890 Revert "gpio: eic-sprd: Use devm_platfo=
rm_ioremap_resource()")
Merging gpio-brgl/gpio/for-next (03434e049439 gpio: Extend TODO to cover co=
de duplication avoidance)
Merging gpio-intel/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging pinctrl/for-next (c42f69b4207e pinctrl: qcom: fix compilation error)
Merging pinctrl-intel/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging pinctrl-samsung/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging pwm/for-next (9cc5f232a4b6 pwm: pca9685: Fix PWM/GPIO inter-operati=
on)
Merging userns/for-next (63f818f46af9 proc: Use a dedicated lock in struct =
pid)
Merging ktest/for-next (1091c8fce8aa ktest: Fix typos in ktest.pl)
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (81dc2ded0d32 selftests: Fix memfd test run-time reg=
ression)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (d28b4c1b2b3d Merge branch 'for-5.6/selftests=
' into for-next)
Merging coresight/next (ed0efaa66ad8 docs: trace: coresight-ect.rst: fix a =
build warning)
Merging rtc/rtc-next (1821b79d6a7d rtc: ds1307: check for failed memory all=
ocation on wdt)
Merging nvdimm/libnvdimm-for-next (f6d2b802f80d Merge branch 'for-5.7/libnv=
dimm' into libnvdimm-for-next)
Merging at24/at24/for-next (4837621cd61e eeprom: at24: add TPF0001 ACPI ID =
for 24c1024 device)
Merging ntb/ntb-next (b9fc54c38e2e NTB: ntb_test: Fix bug when counting rem=
ote files)
Merging kspp/for-next/kspp (dda632f1bc6d gcc-common.h: Update for GCC 10)
CONFLICT (content): Merge conflict in scripts/gcc-plugins/Makefile
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
Merging xarray/xarray (27586ca786a7 XArray: Handle retry entries within xas=
_find_marked)
Merging hyperv/hyperv-next (9d20a24d310b Drivers: hv: check VMBus messages =
lengths)
Merging auxdisplay/auxdisplay (2f920c0f0e29 auxdisplay: charlcd: replace ze=
ro-length array with flexible-array member)
Merging kgdb/kgdb/for-next (5ea771abd5a3 kdb: Censor attempts to set PROMPT=
 without ENABLE_MEM_READ)
Merging pidfd/for-next (6952a4f64644 selftests: add pid namespace ENOMEM re=
gression test)
Merging devfreq/devfreq-next (19b5622d849b PM / devfreq: tegra30: Delete an=
 error message in tegra_devfreq_probe())
Merging hmm/hmm (bd5d3587b218 mm/hmm: return error for non-vma snapshots)
Merging fpga/for-next (cef0ca6417de fpga: dfl: afu: support debug access to=
 memory-mapped afu regions)
Merging kunit/test (bb6d3fb354c5 Linux 5.6-rc1)
Merging cel/cel-next (1a33d8a284b1 svcrdma: Fix leak of transport addresses)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (b6fe8bc67d2d mtd: hyperbus: move direct mapping setup=
 to AM654 HBMC driver)
Merging kunit-next/kunit (e23349af9ee2 kunit: tool: add missing test data f=
ile content)
Merging trivial/for-next (fad7c9020948 err.h: remove deprecated PTR_RET for=
 good)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging akpm-current/current (67e43251ac5a usb: core: kcov: collect coverag=
e from usb complete callback)
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
Merging akpm/master (6190f65055c1 drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/1_PS=2V+JzhgGajO98FGV+1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6RNzAACgkQAVBC80lX
0Gxtawf/VlRa40N7SNaF1gtVKJ3RN5b/nKqBxhdfdgwP+0b8zRvkFbU/Eth6oPTF
K2N81hfYYvlTzCVw2vYyMw2mw7IRqvKHQKBJA6Cb18OChjd7RkWB3rhJf9qdE0LR
G3UcnYSPOAPWiebK1bvDAYxSg6Fz1WmvfZMK7bCTiv6O3b53301jGvH5Z7HpGZwn
MZjG1/2zr9AOSr1XoozRO+kQAx5RF9jg6zjlN3xEOWlKzwV+sVf6u+6oNv9O5uEq
kMOQ8kVRh+xVL5qjGoBVUid3BphK2bVr4t3gjWnDLJvcjrttgi0ccnWrEvkKBrfP
luiWuLkScMHANHjc4zPHHDJYtg4pQw==
=4JTZ
-----END PGP SIGNATURE-----

--Sig_/1_PS=2V+JzhgGajO98FGV+1--
