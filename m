Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F20421B00B1
	for <lists+linux-next@lfdr.de>; Mon, 20 Apr 2020 06:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbgDTE0Q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Apr 2020 00:26:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbgDTE0Q (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Apr 2020 00:26:16 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9D8EC061A0C;
        Sun, 19 Apr 2020 21:26:15 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 495DCl3y7cz9s71;
        Mon, 20 Apr 2020 14:26:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587356771;
        bh=jW6+I11fxU183TABBa8rlTARNMpCmEo0k9wQT8gldeo=;
        h=Date:From:To:Cc:Subject:From;
        b=ChLEMWNiH/U6Qhx4va/wo5qXRcX+uLOtC6cP6h2T1leKhAoySZfpzDlWonEEL9EjX
         dK1S4g8gTXeefbep23z2gO/v8iIdUqf/h+krF/Cn/wyZaE+1LPtMoZMxQsl58mBHMo
         4za0AZ0tM/fSJ2J90UXoG4CKQ17mS7hekIcAySaBVXnc5BEZ7pVVJqaKtFIjY7G9SP
         T6DhVhCDpPCZH/hEaoxBsnCr+ObCG6CAix4ulbvU3Vvx3wisi/XUxHeznzuUxTpI1k
         I3E2Hls1Lhs26Af+1DTFzUCXBOIs188VbuQAouXUxN6/HkT88NyqN8jqXfhodG6HLr
         gErQAWXVJaAKQ==
Date:   Mon, 20 Apr 2020 14:26:10 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 20
Message-ID: <20200420142610.390e5922@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eexMcoPIbzfUrTWo9fk5aDt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/eexMcoPIbzfUrTWo9fk5aDt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20200417:

My fixes tree is empty again.

The qcom tree still had its build failure for which I reverted a commit.

The crypto tree still has its build failure for which I reverted 5 commits.

The drm-misc tree gained a build failure for which I disabled a
COMPILE_TEST setting.

The sound-asoc tree still has its build failures so I used the version from
next-20200414.

The ipmi tree gained a build failure for which I applied a patch.

Non-merge commits (relative to Linus' tree): 2732
 3544 files changed, 76515 insertions(+), 37271 deletions(-)

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

I am currently merging 318 trees (counting Linus' and 78 trees of bug
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
Merging origin/master (ae83d0b416db Linux 5.7-rc2)
Merging fixes/master (8f3d9f354286 Linux 5.7-rc1)
Merging kbuild-current/fixes (d2f1606edabd scripts/config: allow colons in =
option strings for sed)
Merging arc-current/for-curr (5185f4773e90 ARC: [plat-eznps]: Restrict to C=
ONFIG_ISA_ARCOMPACT)
Merging arm-current/fixes (89604523a76e ARM: 8961/2: Fix Kbuild issue cause=
d by per-task stack protector GCC plugin)
Merging arm-soc-fixes/arm/fixes (512e8d40f91d ARM: dts: OMAP3: disable RNG =
on N950/N9)
Merging arm64-fixes/for-next/fixes (c9a4ef664501 arm64: Delete the space se=
parator in __emit_inst)
Merging m68k-current/for-linus (86cded5fc525 m68k: defconfig: Update defcon=
figs for v5.6-rc4)
Merging powerpc-fixes/fixes (1d0c32ec3b86 KVM: PPC: Fix kernel crash with P=
R KVM)
Merging s390-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging sparc/master (63bef48fd6c9 Merge branch 'akpm' (patches from Andrew=
))
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (9bacd256f135 tcp: cache line align MAX_TCP_HEADER)
Merging bpf/master (edadedf1c5b4 tipc: fix incorrect increasing of link win=
dow)
Merging ipsec/master (91fac45cd006 Merge branch 'Fix-88x3310-leaving-power-=
save-mode')
Merging netfilter/master (bc8e71314e84 netfilter: flowtable: Free block_cb =
when being deleted)
Merging ipvs/master (0141317611ab Merge branch 'hns3-fixes')
Merging wireless-drivers/master (1f8fbe9c93fa MAINTAINERS: update list of q=
tnfmac maintainers)
Merging mac80211/master (9bacd256f135 tcp: cache line align MAX_TCP_HEADER)
Merging rdma-fixes/for-rc (8f3d9f354286 Linux 5.7-rc1)
Merging sound-current/for-linus (a8cf44f085ac ALSA: hda: Remove ASUS ROG Ze=
nith from the blacklist)
Merging sound-asoc-fixes/for-linus (c1c14187fcb4 Merge remote-tracking bran=
ch 'asoc/for-5.7' into asoc-linus)
Merging regmap-fixes/for-linus (b810878a8fee Merge branch 'regmap-5.7' into=
 regmap-linus)
Merging regulator-fixes/for-linus (8f3d9f354286 Linux 5.7-rc1)
Merging spi-fixes/for-linus (5e60c07c8615 Merge remote-tracking branch 'spi=
/for-5.7' into spi-linus)
Merging pci-current/for-linus (8f3d9f354286 Linux 5.7-rc1)
Merging driver-core.current/driver-core-linus (2b07021a940c debugfs: remove=
 return value of debugfs_create_u32())
Merging tty.current/tty-linus (3dc4db366236 serial: sh-sci: Make sure statu=
s register SCxSR is read in correct sequence)
Merging usb.current/usb-linus (be34a5854b46 USB: Add USB_QUIRK_DELAY_CTRL_M=
SG and USB_QUIRK_DELAY_INIT for Corsair K70 RGB RAPIDFIRE)
Merging usb-gadget-fixes/fixes (a7b778357ca4 usb: raw-gadget: Fix copy_to/f=
rom_user() checks)
Merging usb-serial-fixes/usb-linus (8f3d9f354286 Linux 5.7-rc1)
Merging usb-chipidea-fixes/ci-for-usb-stable (7cbf3dd3139a usb: chipidea: u=
dc: fix sleeping function called from invalid context)
Merging phy/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging staging.current/staging-linus (ea81c3486442 staging: vt6656: Power =
save stop wake_up_count wrap around.)
Merging char-misc.current/char-misc-linus (8f3d9f354286 Linux 5.7-rc1)
Merging soundwire-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging thunderbolt-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging input-current/for-linus (e3b4f94ef52a Input: usbtouchscreen - add s=
upport for BonXeon TP)
Merging crypto-current/master (55b3209acbb0 crypto: caam - fix the address =
of the last entry of S/G)
Merging ide/master (63bef48fd6c9 Merge branch 'akpm' (patches from Andrew))
Merging vfio-fixes/for-linus (95f89e090618 vfio/type1: Initialize resv_msi_=
base)
Merging kselftest-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging slave-dma-fixes/fixes (aee45dba3ad9 dt-bindings: dma: uniphier-xdma=
c: switch to single reg region)
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (2098c564701c mtd: spi-nor: Compile files in co=
ntrollers/ directory)
Merging mfd-fixes/for-mfd-fixes (603d9299da32 mfd: mt6397: Fix probe after =
changing mt6397-core)
Merging v4l-dvb-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (8f3d9f354286 Linux 5.7-rc1)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (07bdc492cff6 ARM: dts: OMAP3: disable RNG on N950=
/N9)
Merging kvm-fixes/master (56a87e5d997b KVM: SVM: Fix __svm_vcpu_run declara=
tion.)
Merging kvms390-fixes/master (1493e0f944f3 KVM: s390: vsie: Fix possible ra=
ce when shadowing region 3 tables)
Merging hwmon-fixes/hwmon (c843b382e61b hwmon: (jc42) Fix name to have no i=
llegal characters)
Merging nvdimm-fixes/libnvdimm-fixes (f84afbdd3a9e libnvdimm: Out of bounds=
 read in __nd_ioctl())
Merging btrfs-fixes/next-fixes (9dba7a236504 Merge branch 'misc-5.7' into n=
ext-fixes)
Merging vfs-fixes/fixes (5bd73286d50f fix a braino in legitimize_path())
Merging dma-mapping-fixes/for-linus (9c24eaf81cc4 iommu/vt-d: Return the co=
rrect dma mask when we are bypassing the IOMMU)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (f585c9d5436a platform/x86/intel-uncore-fre=
q: make uncore_root_kobj static)
Merging samsung-krzk-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (8f3d9f354286 Linux 5.7-rc1)
Merging devicetree-fixes/dt/linus (0903060fe590 kbuild: check libyaml insta=
llation for 'make dt_binding_check')
Merging scsi-fixes/fixes (fa17a6dc84d1 scsi: Update referenced link to cdrt=
ools)
Merging drm-fixes/drm-fixes (4da858c08643 Merge branch 'linux-5.7' of git:/=
/github.com/skeggsb/linux into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (5809e8f8ee42 Merge tag 'gvt-f=
ixes-2020-04-14' of https://github.com/intel/gvt-linux into drm-intel-fixes)
Merging mmc-fixes/fixes (d5891f7c53d2 mmc: cqhci: Avoid false "cqhci: CQE s=
tuck on" by not open-coding timeout loop)
Merging rtc-fixes/rtc-fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging gnss-fixes/gnss-linus (8f3d9f354286 Linux 5.7-rc1)
Merging hyperv-fixes/hyperv-fixes (1a06d017fb3f Drivers: hv: vmbus: Fix Sus=
pend-to-Idle for Generation-2 VM)
Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq h=
andlers after dpio create)
Merging risc-v-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging pidfd-fixes/fixes (a966dcfe153a clone3: add build-time CLONE_ARGS_S=
IZE_VER* validity checks)
Merging fpga-fixes/fixes (3c2760b78f90 fpga: dfl: pci: fix return value of =
cci_pci_sriov_configure)
Merging spdx/spdx-linus (5b8b9d0c6d0e Merge branch 'akpm' (patches from And=
rew))
Merging gpio-intel-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging pinctrl-intel-fixes/fixes (69388e15f507 pinctrl: cherryview: Add mi=
ssing spinlock usage in chv_gpio_irq_handler)
Merging erofs-fixes/fixes (d1eef1c61974 Linux 5.5-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (7bfc1fec1af3 drm/dp_mst: Zero =
assigned PBN when releasing VCPI slots)
Merging kspp-gustavo/for-next/kspp (90e5d84c7b06 xattr.h: Replace zero-leng=
th array with flexible-array member)
Merging kbuild/for-next (b032227c6293 Merge tag 'nios2-v5.7-rc1' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/lftan/nios2)
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
Merging arm-perf/for-next/perf (8f3d9f354286 Linux 5.7-rc1)
Merging arm-soc/for-next (512e8d40f91d ARM: dts: OMAP3: disable RNG on N950=
/N9)
Merging amlogic/for-next (8f3d9f354286 Linux 5.7-rc1)
Merging aspeed/for-next (de285b938cf3 ARM: dts: aspeed: ast2600: Fix SCU IR=
Q controller nodes)
Merging at91/at91-next (ec539e70d882 Merge branches 'at91-soc', 'at91-dt' a=
nd 'at91-defconfig' into at91-next)
Merging imx-mxs/for-next (46535d78fdfe Merge branch 'imx/dt64' into for-nex=
t)
Merging keystone/next (560b4d4691b0 Merge branch 'for_5.7/keystone-dts' int=
o next)
Merging mediatek/for-next (23a161322658 Merge branch 'v5.7-next/soc' into f=
or-next)
Merging mvebu/for-next (9d32706f8aa8 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (e90f16cc1a48 Merge branch 'fixes' into for-next)
Merging qcom/for-next (217aeedd10d5 Merge branches 'arm64-defconfig-for-5.8=
', 'arm64-for-5.8', 'drivers-for-5.8' and 'dts-for-5.8' into for-next)
Applying: Revert "soc: qcom: rpmh: Allow RPMH driver to be loaded as a modu=
le"
Merging raspberrypi/for-next (e7b7daeb48e0 ARM: dts: bcm283x: Use firmware =
PM driver for V3D)
CONFLICT (content): Merge conflict in arch/arm/configs/bcm2835_defconfig
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (a710158e9fa2 Merge branch 'renesas-arm-dt-for-v5.8' i=
nto renesas-next)
Merging reset/reset/next (2ebf89fd4ecf reset: hi6220: Add support for AO re=
set controller)
Merging rockchip/for-next (c018aff1a201 Merge branch 'v5.7-armsoc/dts64' in=
to for-next)
Merging samsung-krzk/for-next (ff602fc2b39e Merge branch 'next/soc' into fo=
r-next)
Merging scmi/for-linux-next (8f3d9f354286 Linux 5.7-rc1)
Merging sunxi/sunxi/for-next (4f7a2d7e5f1e Merge branches 'sunxi/clk-for-5.=
8', 'sunxi/config-for-5.8' and 'sunxi/dt-for-5.8' into sunxi/for-next)
Merging tegra/for-next (723fa610ebd2 Merge branch for-5.8/arm64/dt into for=
-next)
Merging clk/clk-next (e7f552f727f5 Merge branch 'clk-fixes' into clk-next)
Merging clk-samsung/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (10cb08260605 csky: Fixup perf probe -x hungup)
Merging h8300/h8300-next (beab3d5cb0e1 irq-renesas-h8s: Fix external interr=
upt control.)
Merging ia64/next (172e7890406d tty/serial: cleanup after ioc*_serial drive=
r removal)
Merging m68k/for-next (86cded5fc525 m68k: defconfig: Update defconfigs for =
v5.6-rc4)
Merging m68knommu/for-next (ba000760eb0f m68k: Replace setup_irq() by reque=
st_irq())
Merging microblaze/next (8f3d9f354286 Linux 5.7-rc1)
Merging mips/mips-next (19c968222934 MIPS: DTS: CI20: make DM9000 Ethernet =
controller use NVMEM to find the default MAC address)
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
Merging risc-v/for-next (8f3d9f354286 Linux 5.7-rc1)
Merging sifive/for-next (467e050e9760 Merge branch 'i2c/for-current' of git=
://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging s390/features (8f3d9f354286 Linux 5.7-rc1)
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
Merging ceph/master (2a575f138d00 ceph: fix potential bad pointer deref in =
async dirops cb's)
Merging cifs/for-next (ae83d0b416db Linux 5.7-rc2)
Merging configfs/for-next (e2f238f7d5a1 configfs: calculate the depth of pa=
rent item)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (8f3d9f354286 Linux 5.7-rc1)
Merging exfat/dev (f8cfd4e877fa exfat: truncate atimes to 2s granularity)
Merging ext3/for_next (a32f0ecd79b4 Merge fanotify fix from Nathan Chancell=
or.)
Merging ext4/dev (907ea529fc4c ext4: convert BUG_ON's to WARN_ON's in mball=
oc.c)
Merging f2fs/dev (864d76b0dc8f f2fs: fix quota_sync failure due to f2fs_loc=
k_op)
Merging fsverity/fsverity (98d54f81e36b Linux 5.6-rc4)
Merging fuse/for-next (3e8cb8b2eaeb fuse: fix stack use after return)
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (ae83d0b416db Linux 5.7-rc2)
Merging nfs-anna/linux-next (55dee1bc0d72 nfs: add minor version to nfs_ser=
ver_key for fscache)
Merging nfsd/nfsd-next (2653de9f0398 fs: nfsd: fileache.c: Use built-in RCU=
 list checking)
CONFLICT (content): Merge conflict in net/sunrpc/cache.c
Merging orangefs/for-next (aa317d3351de orangefs: clarify build steps for t=
est server in orangefs.txt)
Merging overlayfs/overlayfs-next (2eda9eaa6d7e ovl: document xino expected =
behavior)
Merging ubifs/linux-next (3676f32a98cd ubi: ubi-media.h: Replace zero-lengt=
h array with flexible-array member)
Merging v9fs/9p-next (c6f141412d24 9p: document short read behaviour with O=
_NONBLOCK)
Merging xfs/for-next (f0f7a674d4df xfs: move inode flush to the sync workqu=
eue)
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
Merging pci/next (8f3d9f354286 Linux 5.7-rc1)
Merging pstore/for-next/pstore (8f3d9f354286 Linux 5.7-rc1)
Merging hid/for-next (ce01b5b5386f Merge branch 'for-5.8/mcp2221' into for-=
next)
Merging i2c/i2c/for-next (6942557f34e7 Merge branch 'i2c/for-5.8' into i2c/=
for-next)
Merging i3c/i3c/next (b4203ce05563 i3c master: GETMRL's 3rd byte is optiona=
l even with BCR_IBI_PAYLOAD)
Merging dmi/master (8cf87c744696 firmware/dmi: Report DMI Bios & EC firmwar=
e release)
Merging hwmon-staging/hwmon-next (635049d0e3a0 hwmon: (dell-smm) Use one DM=
I match for all XPS models)
Merging jc_docs/docs-next (d98dbbe0d331 scripts: documentation-file-ref-che=
ck: Add line break before exit)
Merging v4l-dvb/master (ceab3ac1e60d media: dvb-frontends: DUMMY_FE should =
depends on DVB_CORE)
Merging v4l-dvb-next/master (54ecb8f7028c Linux 5.4-rc1)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (c087b3aec013 Merge branch 'acpi-pci' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (8be6bbe59a69 cpufreq: omap: Bui=
ld driver by default for ARCH_OMAP2PLUS)
Merging cpupower/cpupower (8f3d9f354286 Linux 5.7-rc1)
Merging opp/opp/linux-next (aca48b61f963 opp: Manage empty OPP tables with =
clk handle)
Merging thermal/thermal/linux-next (79799562bf08 thermal: int3400_thermal: =
Statically initialize .get_mode()/.set_mode() ops)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (a48f9721e6db dlm: no need to check return value of debugf=
s_create functions)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (8f3d9f354286 Linux 5.7-rc1)
Merging net-next/master (0fde6e3b55a1 Merge branch 'r8169-series-with-impro=
vements')
Merging bpf-next/master (2fcd80144b93 Merge tag 'tag-chrome-platform-fixes-=
for-v5.7-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platf=
orm/linux)
Merging ipsec-next/master (308491755f36 xfrm: add prep for esp beet mode of=
fload)
Merging mlx5-next/mlx5-next (59e9e8e4fe83 net/mlx5: Enable SW-defined RoCEv=
2 UDP source port)
Merging netfilter-next/master (0fde6e3b55a1 Merge branch 'r8169-series-with=
-improvements')
Merging ipvs-next/master (d54725cd11a5 netfilter: nf_tables: support for mu=
ltiple devices per netdev hook)
Merging wireless-drivers-next/master (f0f383347ced brcmfmac: remove leading=
 space)
Merging bluetooth/master (0fde6e3b55a1 Merge branch 'r8169-series-with-impr=
ovements')
Merging mac80211-next/master (7b2d38b7dd89 mac80211_hwsim: notify wmediumd =
of used MAC addresses)
Merging gfs2/for-next (197694d09af5 docs: filesystems: convert gfs2-glocks.=
txt to ReST)
Merging mtd/mtd/next (025a06c1104c mtd: Convert fallthrough comments into s=
tatements)
Merging nand/nand/next (fca88925d769 mtd: rawnand: toshiba: Support reading=
 the number of bitflips for BENAND (Built-in ECC NAND))
Merging spi-nor/spi-nor/next (8f3d9f354286 Linux 5.7-rc1)
Merging crypto/master (0a8f5989e034 crypto: marvell/octeontx - Add missing =
'\n' in log messages)
Applying: Revert "crypto: hisilicon/qm - stop qp by judging sq and cq tail"
Applying: Revert "crypto: hisilicon/sec2 - add controller reset support for=
 SEC2"
Applying: Revert "crypto: hisilicon/hpre - add controller reset support for=
 HPRE"
Applying: Revert "crypto: hisilicon/zip - add controller reset support for =
zip"
Applying: Revert "crypto: hisilicon/qm - add controller reset interface"
Merging drm/drm-next (8f3d9f354286 Linux 5.7-rc1)
Merging amdgpu/drm-next (c029bbfac1bf PCI/P2PDMA: Add additional AMD ZEN ro=
ot ports to the whitelist)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/powerplay/renoir_=
ppt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ras=
.c
Merging drm-intel/for-linux-next (31a02eb70b8d drm/i915: Refactor setting d=
ma info to a common helper)
Merging drm-tegra/drm/tegra/for-next (e32c8c2a5fbe drm/tegra: hdmi: Silence=
 deferred-probe error)
Merging drm-misc/for-linux-next (8eea6e26fc2e dt-bindings: display: convert=
 rockchip rk3066 hdmi bindings to yaml)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dp=
_mst.c
Merging drm-msm/msm-next (a5fb8b918920 drm/msm/a6xx: Use the DMA API for GM=
U memory objects)
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (2c76b324c794 drm/imx: parallel-display: Adjus=
t bus_flags handling)
Merging etnaviv/etnaviv/next (f232d9ec029c drm/etnaviv: fix TS cache flushi=
ng on GPUs with BLT engine)
Merging regmap/for-next (f320d878bff2 Merge branch 'regmap-5.8' into regmap=
-next)
Merging sound/for-next (093b8494f299 ALSA: usb-audio: Print more informatio=
n in stream proc files)
Merging sound-asoc/for-next (09b0653f0937 Merge remote-tracking branch 'aso=
c/for-5.8' into asoc-next)
$ git reset --hard HEAD^
Merging next-20200414 version of sound-asoc
Merging modules/modules-next (0f74226649fb kernel: module: Replace zero-len=
gth array with flexible-array member)
Merging input/next (81b4d1d22ca0 Input: evdev - use keyed wakeups)
Merging block/for-next (8f3d9f354286 Linux 5.7-rc1)
Merging device-mapper/for-next (ad4e80a639fc dm verity fec: fix hash block =
number in verity_fec_decode)
Merging pcmcia/pcmcia-next (a8c122f72d94 pcmcia: remove some unused space c=
haracters)
Merging mmc/next (24003eb98a4d mmc: sdhci: add spin lock for sdhci_set_defa=
ult_irqs in sdhci_init)
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (d2923aa45356 mfd: intel-lpss: Fix Intel Elkhart L=
ake LPSS I2C input clock)
Merging backlight/for-backlight-next (ee0c8e494cc3 backlight: corgi: Conver=
t to use GPIO descriptors)
Merging battery/for-next (164eaf6b435c power: supply: 88pm860x_battery: rem=
ove redundant dev_err message)
Merging regulator/for-next (2ea8db7200d4 regulator: tps80031: remove redund=
ant assignment to variables ret and val)
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
Merging selinux/next (430059024389 selinux: implement new format of filenam=
e transitions)
Merging smack/for-next (92604e825304 smack: use GFP_NOFS while holding inod=
e_smack::smk_lock)
Merging tomoyo/master (8f3d9f354286 Linux 5.7-rc1)
Merging tpmdd/next (8e0ea4627151 tpm/tpm_tis: Free IRQ if probing fails)
Merging watchdog/master (ea104a9e4d3e watchdog: sp805: fix restart handler)
Merging iommu/next (ff68eb23308e Merge branches 'iommu/fixes', 'arm/qcom', =
'arm/omap', 'arm/smmu', 'x86/amd', 'x86/vt-d', 'virtio' and 'core' into nex=
t)
Merging vfio/next (f44efca0493d vfio: Ignore -ENODEV when getting MSI cooki=
e)
Merging audit/next (8f3d9f354286 Linux 5.7-rc1)
Merging devicetree/for-next (7e5ff5917593 Merge branch 'dt/linus' into dt/n=
ext)
Merging mailbox/mailbox-for-next (0a67003b1985 mailbox: imx: add SCU MU sup=
port)
Merging spi/for-next (36792a4aa66c Merge remote-tracking branch 'spi/for-5.=
8' into spi-next)
Merging tip/auto-latest (36d1b5ecb415 Merge branch 'irq/urgent')
Merging clockevents/timers/drivers/next (c1ac28a4de6f Revert "clocksource: =
Avoid creating dead devices")
Merging edac/edac-for-next (d9976bc155b1 MAINTAINERS: Remove sifive_l2_cach=
e.c from EDAC-SIFIVE pattern)
Merging irqchip/irq/irqchip-next (4cea749d56be Revert "irqchip/xilinx: Enab=
le generic irq multi handler")
Merging ftrace/for-next (8e99cf91b99b tracing: Do not allocate buffer in tr=
ace_find_next_entry() in atomic)
Merging rcu/rcu/next (fa389f19dd0a mm/mmap.c: Add cond_resched() for exit_m=
map() CPU stalls)
Merging kvm/linux-next (604e8bba0dc5 KVM: Remove redundant argument to kvm_=
arch_vcpu_ioctl_run)
Merging kvm-arm/next (463050599742 Merge tag 'kvm-arm-removal' into kvmarm-=
master/next)
Merging kvm-ppc/kvm-ppc-next (9a5788c615f5 KVM: PPC: Book3S HV: Add a capab=
ility for enabling secure guests)
Merging kvms390/next (7a2653612bb6 s390/gmap: return proper error code on k=
sm unsharing)
Merging xen-tip/linux-next (74f4c438f22c arm/xen: make _xen_start_info stat=
ic)
Merging percpu/for-next (dedac37ea96b Merge branch 'for-5.7' into for-next)
Merging workqueues/for-next (4acf8a423cd3 Merge branch 'for-5.7' into for-n=
ext)
Merging drivers-x86/for-next (8f3d9f354286 Linux 5.7-rc1)
Merging chrome-platform/for-next (9d33ea331032 platform/chrome: cros_ec_typ=
ec: Register port partner)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (ca99522667ad leds: tca6507: Include the right header)
Merging ipmi/for-next (d6850a47c933 ipmi: use vzalloc instead of kmalloc fo=
r user creation)
Merging driver-core/driver-core-next (55623260bb33 test_firmware: remove un=
necessary test_fw_mutex in test_dev_config_show_xxx)
Merging usb/usb-next (e9010320f2d9 usb: cdns3: gadget: make a bunch of func=
tions static)
Merging usb-gadget/next (4a5dbd900957 dt-bindings: usb: add documentation f=
or aspeed usb-vhub)
Merging usb-serial/usb-next (8f3d9f354286 Linux 5.7-rc1)
Merging usb-chipidea-next/ci-for-usb-next (95caa2ae70fd usb: chipidea: allo=
w disabling glue drivers if EMBEDDED)
Merging phy-next/next (8f3d9f354286 Linux 5.7-rc1)
Merging tty/tty-next (a8e7346b7c0a serial: uartps: Use cdns_uart_tx_empty i=
n console_write)
Merging char-misc/char-misc-next (8f3d9f354286 Linux 5.7-rc1)
Merging extcon/extcon-next (108339e7a4fe extcon: remove redundant assignmen=
t to variable idx)
Merging soundwire/next (8f3d9f354286 Linux 5.7-rc1)
Merging thunderbolt/next (cbb5494ebce5 Revert "thunderbolt: Prevent crash i=
f non-active NVMem file is read")
Merging staging/staging-next (710c451fbcb2 staging: rtl8188eu: make const c=
har array static)
Merging mux/for-next (f356d58c3a04 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (03c4e6186bbb interconnect: qcom: Add OSM L3 support o=
n SC7180)
Merging slave-dma/next (a02254f8a676 dmaengine: ioat: Decreasing allocation=
 chunk size 2M->512K)
Merging cgroup/for-next (eec8fd0277e3 device_cgroup: Cleanup cgroup eBPF de=
vice filter code)
Merging scsi/for-next (b8178c2dfcee Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (7109cb515172 scsi: qedf: Get dev info after upda=
ting the params)
Merging vhost/linux-next (a09caf89a4d7 vhost: disable for OABI)
Merging rpmsg/for-next (ee7cef848adf Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (9f676e5313c1 gpio: mlxbf2: remove unused including <=
linux/version.h>)
Merging gpio-brgl/gpio/for-next (aa58a21ae378 gpio: pca953x: disable regmap=
 locking)
Merging gpio-intel/for-next (8f3d9f354286 Linux 5.7-rc1)
Merging pinctrl/for-next (987a527ed69d Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (3dbf1ee6abbb pinctrl: cherryview: Add missi=
ng spinlock usage in chv_gpio_irq_handler)
Merging pinctrl-samsung/for-next (b577a2799140 pinctrl: samsung: Correct se=
tting of eint wakeup mask on s5pv210)
Merging pwm/for-next (6f0841a8197b pwm: Add support for Azoteq IQS620A PWM =
generator)
Merging userns/for-next (4fa3b1c41737 proc: Handle umounts cleanly)
Merging ktest/for-next (1091c8fce8aa ktest: Fix typos in ktest.pl)
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (b87080eab4c1 selftests/ipc: Fix test failure seen a=
fter initial test run)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (d28b4c1b2b3d Merge branch 'for-5.6/selftests=
' into for-next)
Merging coresight/next (a59f11c764b0 coresight: Fix support for sparsely po=
pulated ports)
Merging rtc/rtc-next (11ddbdfb68e4 rtc: rc5t619: Fix an ERR_PTR vs NULL che=
ck)
Merging nvdimm/libnvdimm-for-next (f6d2b802f80d Merge branch 'for-5.7/libnv=
dimm' into libnvdimm-for-next)
Merging at24/at24/for-next (8f3d9f354286 Linux 5.7-rc1)
Merging ntb/ntb-next (5cc3de3c7435 NTB: ntb_test: Fix bug when counting rem=
ote files)
Merging kspp/for-next/kspp (c7527373fe28 gcc-common.h: Update for GCC 10)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (8f3d9f354286 Linux 5.7-rc1)
Merging fsi/next (2c01397b71c5 fsi: aspeed: Fix OPB0 byte order register va=
lues)
CONFLICT (content): Merge conflict in drivers/fsi/Kconfig
Merging slimbus/for-next (b23f2e2df6c9 slimbus: ngd: remove redundant assig=
nment)
Merging nvmem/for-next (10dceb230b3b nvmem: imx-ocotp: Improve logic to sav=
e many code lines)
Merging xarray/xarray (27586ca786a7 XArray: Handle retry entries within xas=
_find_marked)
Merging hyperv/hyperv-next (e66b54d07be4 drivers: hv: remove redundant assi=
gnment to pointer primary_channel)
Merging auxdisplay/auxdisplay (2f920c0f0e29 auxdisplay: charlcd: replace ze=
ro-length array with flexible-array member)
Merging kgdb/kgdb/for-next (5ea771abd5a3 kdb: Censor attempts to set PROMPT=
 without ENABLE_MEM_READ)
Merging pidfd/for-next (6952a4f64644 selftests: add pid namespace ENOMEM re=
gression test)
Merging devfreq/devfreq-next (a35a2f2b3e6e PM / devfreq: tegra30: Delete an=
 error message in tegra_devfreq_probe())
Merging hmm/hmm (8f3d9f354286 Linux 5.7-rc1)
Merging fpga/for-next (cef0ca6417de fpga: dfl: afu: support debug access to=
 memory-mapped afu regions)
Merging kunit/test (8f3d9f354286 Linux 5.7-rc1)
Merging cel/cel-next (23cf1ee1f186 svcrdma: Fix leak of svc_rdma_recv_ctxt =
objects)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (b6fe8bc67d2d mtd: hyperbus: move direct mapping setup=
 to AM654 HBMC driver)
Merging kunit-next/kunit (8f3d9f354286 Linux 5.7-rc1)
Merging trivial/for-next (fad7c9020948 err.h: remove deprecated PTR_RET for=
 good)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (8f3d9f354286 Linux 5.7-rc1)
Applying: video: fbdev: controlfb: remove COMPILE_TEST for now
Applying: ipmi: vzalloc use requires vmallo.h inclusion
Merging akpm-current/current (8bd30abc5412 ipc/namespace.c: use a work queu=
e to free_ipc)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: amdgpu: a NULL ->mm does not mean a thread is a kthread
Applying: i915/gvt: remove unused xen bits
Applying: kernel: move use_mm/unuse_mm to kthread.c
Applying: kernel: move use_mm/unuse_mm to kthread.c
Applying: kernel: better document the use_mm/unuse_mm API contract
Applying: kernel-better-document-the-use_mm-unuse_mm-api-contract-v2
Applying: kernel: set USER_DS in kthread_use_mm
Applying: mm/kmemleak: silence KCSAN splats in checksum
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
Applying: net-zerocopy: use vm_insert_pages() for tcp rcv zerocopy
Applying: mm/madvise: pass task and mm to do_madvise
Applying: mm/madvise: introduce process_madvise() syscall: an external memo=
ry hinting API
Applying: fix process_madvise build break for arm64
Applying: mm/madvise: check fatal signal pending of target process
Applying: pid: move pidfd_get_pid() to pid.c
Applying: mm/madvise: support both pid and pidfd for process_madvise
Applying: mm/madvise: employ mmget_still_valid() for write lock
Applying: mm/madvise: allow KSM hints for remote API
Applying: drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer ove=
rflow
Merging akpm/master (e98ff732aff9 drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/eexMcoPIbzfUrTWo9fk5aDt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6dJGIACgkQAVBC80lX
0Gy+MAf/TLT6WLRw3kKccbic8GgCm2fzxSXj6NVotv6RF0wIRvvOY0ZyC3d50gkq
FimzhiKC+ugPk2jvDaGH26tlZKmb1WQ48rYadgFEeUSuGQfZwK1asXTnxtSBZIFC
MfxyofweGu2JmwLISC3e8x+patOwaOnoukPgpABKUBb1o3pM/qI+zVz6cIOMUrjh
kqu4Gvglug0P0dyjm/x8PAqjYB1CRd8yg+7AS43G3UVHFoDYkDBoYJyMt/I8XzyA
hHWEnkSUzt8WAg73HhqMWrJ19l7gc2AC9izzvkxWOJMqTYKUnwy7rxNetM+/hhQZ
DNLH29mQY5/Fq4sfM4NCAAaanmhJwA==
=+PRb
-----END PGP SIGNATURE-----

--Sig_/eexMcoPIbzfUrTWo9fk5aDt--
