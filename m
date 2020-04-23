Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E7141B5618
	for <lists+linux-next@lfdr.de>; Thu, 23 Apr 2020 09:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbgDWHlS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Apr 2020 03:41:18 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:51563 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726936AbgDWHlN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 23 Apr 2020 03:41:13 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4978PG5gKZz9sSy;
        Thu, 23 Apr 2020 17:41:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587627666;
        bh=w8o1WFY/o65olEEqtCSpvh51QzqR0GlwcR6RD1z0lUk=;
        h=Date:From:To:Cc:Subject:From;
        b=HPeAScmk3UpyH023pRI0qFQrRzAukC59Lyzeo7s4NxlQVufvxct+hyFtIwKbrQP8k
         TaTCwbI5PpXbdNcgLYh1uu9xnYfwAQzqDE7DgKGqXjW0r6bjbVlC5tv9qLRN208D5A
         gQPg+6dGESkSVv9WCjLE5ZJbdPzEwG3l372wQ2JEZXm7CHthRJtjQxF9u4/WLT49w3
         L/aDfc2DDRmytg6OBD8p3gDYMBsi6+7yvTvJoZE3JIu7qPK7qrwRacu3wvdNnr0fFG
         SigbiR3NYUOyonDhAOLZIW40l32a/cpGcn8/jQJaaiSolxwHzbzp6Flq9cyBrkii6K
         f58nCNG/m977w==
Date:   Thu, 23 Apr 2020 17:41:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 23
Message-ID: <20200423174104.239dffab@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//_CrMT4SFHhJ=Som8gdcy46";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//_CrMT4SFHhJ=Som8gdcy46
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20200422:

The qcom tree still had its build failure for which I reverted a commit.

The powerpc tree still had its build failure for which I applied a patch.

The btrfs tree lost its build failure.

The cifs tree gained a build failure for which I reverted a commit.

The v4l-dvb tree lost its build failure.

The net-next tree gained a conflict against the kbuild-current tree.

The crypto tree lost its build failure.

The amdgpu tree gained a conflict against the drm tree.

The drm-misc tree still had its build failure for which I disabled a
COMPILE_TEST setting.

The sound-asoc tree lost its build failures.  But gained another for
which I removed COMPILE_TEST from a driver.

The device-mapper tree lost its build failure.

Non-merge commits (relative to Linus' tree): 3780
 4884 files changed, 120424 insertions(+), 50860 deletions(-)

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
Merging origin/master (c578ddb39e56 Merge tag 'linux-kselftest-5.7-rc3' of =
git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest)
Merging fixes/master (8f3d9f354286 Linux 5.7-rc1)
Merging kbuild-current/fixes (e3459da6c363 arch: split MODULE_ARCH_VERMAGIC=
 definitions out to <asm/vermagic.h>)
Merging arc-current/for-curr (5185f4773e90 ARC: [plat-eznps]: Restrict to C=
ONFIG_ISA_ARCOMPACT)
Merging arm-current/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging arm-soc-fixes/arm/fixes (e9801213465a Merge tag 'zynqmp-soc-for-v5.=
7-rc3' of https://github.com/Xilinx/linux-xlnx into arm/fixes)
Merging arm64-fixes/for-next/fixes (3fabb43818c9 arm64: sync kernel APIAKey=
 when installing)
Merging m68k-current/for-linus (86cded5fc525 m68k: defconfig: Update defcon=
figs for v5.6-rc4)
Merging powerpc-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging s390-fixes/fixes (86dbf32da150 s390/pci: do not set affinity for fl=
oating irqs)
Merging sparc/master (63bef48fd6c9 Merge branch 'akpm' (patches from Andrew=
))
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (2c1dd4c11062 selftests: Fix suppress test in fib_tests.=
sh)
Merging bpf/master (d2b6c3ab70db bpf, selftests: Add test for BPF_STX BPF_B=
 storing R10)
Merging ipsec/master (a204aef9fd77 xfrm: call xfrm_output_gso when inner_pr=
otocol is set in xfrm_output)
Merging netfilter/master (2c1dd4c11062 selftests: Fix suppress test in fib_=
tests.sh)
Merging ipvs/master (0141317611ab Merge branch 'hns3-fixes')
Merging wireless-drivers/master (10e41f34a019 MAINTAINERS: update mt76 revi=
ewers)
Merging mac80211/master (9bacd256f135 tcp: cache line align MAX_TCP_HEADER)
Merging rdma-fixes/for-rc (6e051971b0e2 RDMA/siw: Fix potential siw_mem ref=
cnt leak in siw_fastreg_mr())
Merging sound-current/for-linus (fef66ae73a61 ALSA: usb-audio: Add connecto=
r notifier delegation)
Merging sound-asoc-fixes/for-linus (25b7676655e5 Merge remote-tracking bran=
ch 'asoc/for-5.7' into asoc-linus)
Merging regmap-fixes/for-linus (161976a0ead7 Merge remote-tracking branch '=
regmap/for-5.7' into regmap-linus)
Merging regulator-fixes/for-linus (3c0cb85c78a0 Merge branch 'regulator-5.7=
' into regulator-linus)
Merging spi-fixes/for-linus (0a2bca3d5373 Merge remote-tracking branch 'spi=
/for-5.7' into spi-linus)
Merging pci-current/for-linus (ef46738cc47a MAINTAINERS: Add Rob Herring an=
d remove Andy Murray as PCI reviewers)
Merging driver-core.current/driver-core-linus (2b07021a940c debugfs: remove=
 return value of debugfs_create_u32())
Merging tty.current/tty-linus (66bb1c9518e6 tty/sysrq: Export sysrq_mask(),=
 sysrq_toggle_support())
Merging usb.current/usb-linus (0df9433fcae0 usb: typec: altmode: Fix typec_=
altmode_get_partner sometimes returning an invalid pointer)
Merging usb-gadget-fixes/fixes (a7b778357ca4 usb: raw-gadget: Fix copy_to/f=
rom_user() checks)
Merging usb-serial-fixes/usb-linus (e9b3c610a05c USB: serial: garmin_gps: a=
dd sanity checking for data length)
Merging usb-chipidea-fixes/ci-for-usb-stable (7cbf3dd3139a usb: chipidea: u=
dc: fix sleeping function called from invalid context)
Merging phy/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging staging.current/staging-linus (c532cc617e6e Merge tag 'iio-fixes-fo=
r-5.7a' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into sta=
ging-linus)
Merging char-misc.current/char-misc-linus (fec874a81b3e mei: me: fix irq nu=
mber stored in hw struct)
Merging soundwire-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging thunderbolt-fixes/fixes (9d2214b14103 thunderbolt: Check return val=
ue of tb_sw_read() in usb4_switch_op())
Merging input-current/for-linus (38347374ae3f Input: dlink-dir685-touchkeys=
 - fix a typo in driver name)
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
Merging omap-fixes/fixes (175ae3ad59ab Merge branch 'fixes-v5.7' into fixes)
Merging kvm-fixes/master (00a6a5ef39e7 Merge tag 'kvm-ppc-fixes-5.7-1' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/paulus/powerpc into kvm-master)
Merging kvms390-fixes/master (2a173ec993ba MAINTAINERS: add a reviewer for =
KVM/s390)
Merging hwmon-fixes/hwmon (ae83d0b416db Linux 5.7-rc2)
Merging nvdimm-fixes/libnvdimm-fixes (f84afbdd3a9e libnvdimm: Out of bounds=
 read in __nd_ioctl())
Merging btrfs-fixes/next-fixes (c7ef0f7c0df2 Merge branch 'misc-5.7' into n=
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
Merging scsi-fixes/fixes (1d2ff149b263 scsi: target/iblock: fix WRITE SAME =
zeroing)
Merging drm-fixes/drm-fixes (ae83d0b416db Linux 5.7-rc2)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (d082119f4277 drm/i915/dpcd_bl=
: Unbreak enable_dpcd_backlight modparam)
Merging mmc-fixes/fixes (1a8eb6b373c2 mmc: sdhci-pci: Fix eMMC driver stren=
gth for BYT-based controllers)
Merging rtc-fixes/rtc-fixes (8f3d9f354286 Linux 5.7-rc1)
Merging gnss-fixes/gnss-linus (ae83d0b416db Linux 5.7-rc2)
Merging hyperv-fixes/hyperv-fixes (f081bbb3fd03 hyper-v: Remove internal ty=
pes from UAPI header)
Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq h=
andlers after dpio create)
Merging risc-v-fixes/fixes (7d0ce3b2b483 riscv: sbi: Fix undefined referenc=
e to sbi_shutdown)
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
Merging drm-misc-fixes/for-linux-next-fixes (9da67433f64e drm/tidss: fix cr=
ash related to accessing freed memory)
Merging kspp-gustavo/for-next/kspp (d783301058f3 treewide: Replace zero-len=
gth array with flexible-array member)
Merging kbuild/for-next (b032227c6293 Merge tag 'nios2-v5.7-rc1' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/lftan/nios2)
Merging compiler-attributes/compiler-attributes (98d54f81e36b Linux 5.6-rc4)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (276f39eaf2a8 dma-pool: scale the default DMA =
coherent pool size with memory capacity)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (365a6327cd64 ARM: 8968/1: decompressor: simplify libf=
dt builds)
Merging arm64/for-next/core (fc2266011acc arm64: armv8_deprecated: Fix unde=
f_hook mask for thumb setend)
Merging arm-perf/for-next/perf (8f3d9f354286 Linux 5.7-rc1)
Merging arm-soc/for-next (e9801213465a Merge tag 'zynqmp-soc-for-v5.7-rc3' =
of https://github.com/Xilinx/linux-xlnx into arm/fixes)
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
Merging omap/for-next (1f4c797b748c Merge branch 'omap-for-v5.8/dt' into fo=
r-next)
Merging qcom/for-next (4b6086b3f83a Merge branches 'arm64-defconfig-for-5.8=
', 'arm64-for-5.8', 'drivers-for-5.8' and 'dts-for-5.8' into for-next)
Applying: Revert "soc: qcom: rpmh: Allow RPMH driver to be loaded as a modu=
le"
Merging raspberrypi/for-next (f5e216e42689 ARM: dts: bcm283x: Use firmware =
PM driver for V3D)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (33a8b496016f Merge branches 'renesas-arm-defconfig-fo=
r-v5.8' and 'renesas-arm-dt-for-v5.8' into renesas-next)
Merging reset/reset/next (2ebf89fd4ecf reset: hi6220: Add support for AO re=
set controller)
Merging rockchip/for-next (c018aff1a201 Merge branch 'v5.7-armsoc/dts64' in=
to for-next)
Merging samsung-krzk/for-next (fcd1f4184e18 Merge branch 'next/soc' into fo=
r-next)
Merging scmi/for-linux-next (8f3d9f354286 Linux 5.7-rc1)
Merging sunxi/sunxi/for-next (449478252efe Merge branch 'sunxi/dt-for-5.8' =
into sunxi/for-next)
Merging tegra/for-next (fa22ec16742e Merge branch for-5.8/arm64/dt into for=
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
Merging m68k/for-next (e09a74404079 m68k: amiga: config: Mark expected swit=
ch fall-through)
Merging m68knommu/for-next (ba000760eb0f m68k: Replace setup_irq() by reque=
st_irq())
Merging microblaze/next (8f3d9f354286 Linux 5.7-rc1)
Merging mips/mips-next (6abf4a2f80ea ASoC: txx9: add back the hack for a to=
o small resource_size_t)
Merging nds32/next (d785c5a324cd nds32: configs: Cleanup CONFIG_CROSS_COMPI=
LE)
Merging nios2/for-next (0ec8a5054d7f MAINTAINERS: Remove nios2-dev@lists.ro=
cketboards.org)
Merging openrisc/for-next (9737e2c5f0bc openrisc: Remove obsolete show_trac=
e_task function)
Merging parisc-hd/for-next (7111951b8d49 Linux 5.6)
Merging powerpc/next (722c1963aba5 selftests/powerpc: Add README for GZIP e=
ngine tests)
Applying: powerpc/vas: uapi headers should be self contained
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (461c3ac0dc46 soc: fsl: qe: fix sparse warnings for uc=
c_slow.c)
Merging risc-v/for-next (ad8adad93371 RISC-V: Skip setting up PMPs on traps)
Merging sifive/for-next (467e050e9760 Merge branch 'i2c/for-current' of git=
://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging s390/features (ae83d0b416db Linux 5.7-rc2)
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
Merging btrfs/for-next (29263ad54b03 Merge branch 'for-next-current-v5.6-20=
200422' into for-next-20200422)
Merging ceph/master (2a575f138d00 ceph: fix potential bad pointer deref in =
async dirops cb's)
Merging cifs/for-next (db2905e78203 cifs: fix uninitialised lease_key in op=
en_shroot())
Applying: Revert "cifs: do not share tcons with DFS"
Merging configfs/for-next (e2f238f7d5a1 configfs: calculate the depth of pa=
rent item)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (8f3d9f354286 Linux 5.7-rc1)
Merging exfat/dev (cb1ce0e8e96c exfat: replace 'time_ms' with 'time_cs')
Merging ext3/for_next (a32f0ecd79b4 Merge fanotify fix from Nathan Chancell=
or.)
Merging ext4/dev (907ea529fc4c ext4: convert BUG_ON's to WARN_ON's in mball=
oc.c)
Merging f2fs/dev (864d76b0dc8f f2fs: fix quota_sync failure due to f2fs_loc=
k_op)
Merging fsverity/fsverity (98d54f81e36b Linux 5.6-rc4)
Merging fuse/for-next (75d892588e95 fuse: Update stale comment in queue_int=
errupt())
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (efe57fd58e1c SUNRPC: Remove unreachable error condi=
tion)
Merging nfs-anna/linux-next (55dee1bc0d72 nfs: add minor version to nfs_ser=
ver_key for fscache)
Merging nfsd/nfsd-next (2653de9f0398 fs: nfsd: fileache.c: Use built-in RCU=
 list checking)
CONFLICT (content): Merge conflict in net/sunrpc/cache.c
Merging orangefs/for-next (aa317d3351de orangefs: clarify build steps for t=
est server in orangefs.txt)
Merging overlayfs/overlayfs-next (94ca68472846 ovl: skip overlayfs superblo=
cks at global sync)
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
Merging hwmon-staging/hwmon-next (8e5c4f885286 hwmon: (dell-smm) Use one DM=
I match for all XPS models)
Merging jc_docs/docs-next (7b9121040d83 Documentation: scheduler: fix outda=
ted information on sched groups)
Merging v4l-dvb/master (a349d3d97ea2 media: MAINTAINERS: Fix Hantro, Rga an=
d Rkvdec entries)
Merging v4l-dvb-next/master (54ecb8f7028c Linux 5.4-rc1)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (247f4817f956 Merge branch 'pm-sleep' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (2fbd0de2a20f cpufreq: imx-cpufr=
eq-dt: support i.MX7ULP)
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
Merging rdma/for-next (95a776e8a628 RDMA/rw: use DIV_ROUND_UP to calculate =
nr_ops)
Merging net-next/master (540bde5c2c3d ila: remove unused macro 'ILA_HASH_TA=
BLE_SIZE')
CONFLICT (content): Merge conflict in include/linux/vermagic.h
Merging bpf-next/master (fc4968530b0a tools/bpf/bpftool: Remove duplicate h=
eaders)
Merging ipsec-next/master (b6246f4d8d07 net: ipv4: remove redundant assignm=
ent to variable rc)
Merging mlx5-next/mlx5-next (59e9e8e4fe83 net/mlx5: Enable SW-defined RoCEv=
2 UDP source port)
Merging netfilter-next/master (b6246f4d8d07 net: ipv4: remove redundant ass=
ignment to variable rc)
Merging ipvs-next/master (d54725cd11a5 netfilter: nf_tables: support for mu=
ltiple devices per netdev hook)
Merging wireless-drivers-next/master (5ad4d8957b69 rtw88: set power trim ac=
cording to efuse PG values)
Merging bluetooth/master (c03ee9af4e07 Bluetooth: btbcm: Add 2 missing mode=
ls to subver tables)
Merging mac80211-next/master (7b2d38b7dd89 mac80211_hwsim: notify wmediumd =
of used MAC addresses)
Merging gfs2/for-next (197694d09af5 docs: filesystems: convert gfs2-glocks.=
txt to ReST)
Merging mtd/mtd/next (025a06c1104c mtd: Convert fallthrough comments into s=
tatements)
Merging nand/nand/next (fca88925d769 mtd: rawnand: toshiba: Support reading=
 the number of bitflips for BENAND (Built-in ECC NAND))
Merging spi-nor/spi-nor/next (150ccc181588 mtd: spi-nor: Enable locking for=
 n25q128a11)
Merging crypto/master (3adbbd2295ad hwrng: cctrng - Add dependency on HAS_I=
OMEM)
Merging drm/drm-next (1aa63ddf726e Merge tag 'drm-misc-next-2020-04-14' of =
git://anongit.freedesktop.org/drm/drm-misc into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/tidss/tidss_encoder.c
Merging amdgpu/drm-next (c33f212c0c92 drm/amdgpu/display: create fake mst e=
ncoders ahead of time)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/powerplay/renoir_=
ppt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm_mst_types.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ras=
.c
Merging drm-intel/for-linux-next (15501287b1c1 drm/i915/execlists: Drop req=
uest-before-CS assertion)
Merging drm-tegra/drm/tegra/for-next (2b1681186f52 drm/tegra: Clean up GPIO=
 includes)
Merging drm-misc/for-linux-next (776d58823a60 dma-buf: Couple of documentat=
ion typo fixes)
CONFLICT (content): Merge conflict in MAINTAINERS
Applying: video: fbdev: controlfb: remove COMPILE_TEST for now
Merging drm-msm/msm-next (a5fb8b918920 drm/msm/a6xx: Use the DMA API for GM=
U memory objects)
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (2c76b324c794 drm/imx: parallel-display: Adjus=
t bus_flags handling)
Merging etnaviv/etnaviv/next (f232d9ec029c drm/etnaviv: fix TS cache flushi=
ng on GPUs with BLT engine)
Merging regmap/for-next (2f50062233d9 Merge remote-tracking branch 'regmap/=
for-5.8' into regmap-next)
Merging sound/for-next (14ff6c5546e7 ALSA: oxygen: use true,false for bool =
variables)
Merging sound-asoc/for-next (6f5ce4f9691d Merge remote-tracking branch 'aso=
c/for-5.8' into asoc-next)
Merging modules/modules-next (5c3a7db0c7ec module: Harden STRICT_MODULE_RWX)
Merging input/next (4ea8391e3556 Input: delete unused GP2AP002A00F driver)
Merging block/for-next (74916c4db6b9 Merge branch 'for-5.8/block' into for-=
next)
Merging device-mapper/for-next (57b0427e9857 dm mpath: switch paths in dm_b=
lk_ioctl() code path)
Merging pcmcia/pcmcia-next (a8c122f72d94 pcmcia: remove some unused space c=
haracters)
Merging mmc/next (d2ba600e2753 mmc: sdhci-of-at91: make MMC_SDHCI_OF_AT91 d=
epend on HAVE_CLK)
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (d2923aa45356 mfd: intel-lpss: Fix Intel Elkhart L=
ake LPSS I2C input clock)
Merging backlight/for-backlight-next (ee0c8e494cc3 backlight: corgi: Conver=
t to use GPIO descriptors)
Merging battery/for-next (164eaf6b435c power: supply: 88pm860x_battery: rem=
ove redundant dev_err message)
Merging regulator/for-next (51f66fe6951c Merge branch 'regulator-5.8' into =
regulator-next)
Merging security/next-testing (3e27a33932df security: remove duplicated inc=
lude from security.h)
Merging apparmor/apparmor-next (01df52d726b5 apparmor: remove duplicate che=
ck of xattrs on profile attachment.)
Merging integrity/next-integrity (2592677c0486 ima: Use ima_hash_algo for c=
ollision detection in the measurement list)
Merging keys/keys-next (43672cf93c6d Merge branch 'notifications-pipe-core'=
 into keys-next)
CONFLICT (content): Merge conflict in include/linux/lsm_hooks.h
CONFLICT (content): Merge conflict in fs/pipe.c
Applying: io_uring: fix up for get_pipe_info() API change
Applying: security: keys: fixup for "security: Refactor declaration of LSM =
hooks"
Merging selinux/next (9521eb3ea19a selinux: don't produce incorrect filenam=
e_trans_count)
Merging smack/for-next (92604e825304 smack: use GFP_NOFS while holding inod=
e_smack::smk_lock)
Merging tomoyo/master (8f3d9f354286 Linux 5.7-rc1)
Merging tpmdd/next (b160c94be5d2 tpm/tpm_tis: Free IRQ if probing fails)
Merging watchdog/master (ae83d0b416db Linux 5.7-rc2)
Merging iommu/next (ff68eb23308e Merge branches 'iommu/fixes', 'arm/qcom', =
'arm/omap', 'arm/smmu', 'x86/amd', 'x86/vt-d', 'virtio' and 'core' into nex=
t)
Merging vfio/next (f44efca0493d vfio: Ignore -ENODEV when getting MSI cooki=
e)
Merging audit/next (3054d0671907 audit: fix a net reference leak in audit_l=
ist_rules_send())
Merging devicetree/for-next (470d4116ef93 dt-bindings: Add an entry for W=
=C3=BCrth Elektronik, we)
Merging mailbox/mailbox-for-next (0a67003b1985 mailbox: imx: add SCU MU sup=
port)
Merging spi/for-next (76ffda1e69f5 Merge remote-tracking branch 'spi/for-5.=
8' into spi-next)
Merging tip/auto-latest (56b008e1281c Merge branch 'perf/core')
Merging clockevents/timers/drivers/next (c1ac28a4de6f Revert "clocksource: =
Avoid creating dead devices")
Merging edac/edac-for-next (d9976bc155b1 MAINTAINERS: Remove sifive_l2_cach=
e.c from EDAC-SIFIVE pattern)
Merging irqchip/irq/irqchip-next (4cea749d56be Revert "irqchip/xilinx: Enab=
le generic irq multi handler")
Merging ftrace/for-next (8e99cf91b99b tracing: Do not allocate buffer in tr=
ace_find_next_entry() in atomic)
Merging rcu/rcu/next (74c70807f1cb docs: RCU: Don't duplicate chapter names=
 in rculist_nulls.rst)
Merging kvm/linux-next (997b7e98990c tools/kvm_stat: add sample systemd uni=
t file)
CONFLICT (content): Merge conflict in arch/x86/kvm/svm/svm.c
Merging kvm-arm/next (463050599742 Merge tag 'kvm-arm-removal' into kvmarm-=
master/next)
Merging kvm-ppc/kvm-ppc-next (9a5788c615f5 KVM: PPC: Book3S HV: Add a capab=
ility for enabling secure guests)
Merging kvms390/next (0b545fd17f84 KVM: s390: remove unneeded semicolon in =
gisa_vcpu_kicker())
Merging xen-tip/linux-next (74f4c438f22c arm/xen: make _xen_start_info stat=
ic)
Merging percpu/for-next (dedac37ea96b Merge branch 'for-5.7' into for-next)
Merging workqueues/for-next (4acf8a423cd3 Merge branch 'for-5.7' into for-n=
ext)
Merging drivers-x86/for-next (f7ea285b6266 Merge branch 'ib-pdx86-propertie=
s')
Merging chrome-platform/for-next (9d33ea331032 platform/chrome: cros_ec_typ=
ec: Register port partner)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (ca99522667ad leds: tca6507: Include the right header)
Merging ipmi/for-next (900b217c7c8e ipmi: Replace guid_copy() with import_g=
uid() where it makes sense)
Merging driver-core/driver-core-next (55623260bb33 test_firmware: remove un=
necessary test_fw_mutex in test_dev_config_show_xxx)
Merging usb/usb-next (e9010320f2d9 usb: cdns3: gadget: make a bunch of func=
tions static)
Merging usb-gadget/next (4a5dbd900957 dt-bindings: usb: add documentation f=
or aspeed usb-vhub)
Merging usb-serial/usb-next (788a4ee607e8 USB: serial: Use the correct styl=
e for SPDX License Identifier)
Merging usb-chipidea-next/ci-for-usb-next (95caa2ae70fd usb: chipidea: allo=
w disabling glue drivers if EMBEDDED)
Merging phy-next/next (8f3d9f354286 Linux 5.7-rc1)
Merging tty/tty-next (a8e7346b7c0a serial: uartps: Use cdns_uart_tx_empty i=
n console_write)
Merging char-misc/char-misc-next (ae83d0b416db Linux 5.7-rc2)
Merging extcon/extcon-next (108339e7a4fe extcon: remove redundant assignmen=
t to variable idx)
Merging soundwire/next (2978a43e7690 soundwire: intel: Make sdw_intel_init =
static)
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
Merging scsi-mkp/for-next (e304142c3089 scsi: lpfc: remove duplicate unload=
ing checks)
Merging vhost/linux-next (d085eb8ce727 vhost: disable for OABI)
Merging rpmsg/for-next (42b8148d8bcf Merge branches 'hwspinlock-next', 'rpm=
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
Merging userns/for-next (8f7a4fcc9b84 proc: modernize proc to support multi=
ple private instances)
Merging ktest/for-next (1091c8fce8aa ktest: Fix typos in ktest.pl)
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (b87080eab4c1 selftests/ipc: Fix test failure seen a=
fter initial test run)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (d28b4c1b2b3d Merge branch 'for-5.6/selftests=
' into for-next)
Merging coresight/next (92097244f586 coresight: etmv4: Update default filte=
r and initialisation)
Merging rtc/rtc-next (11ddbdfb68e4 rtc: rc5t619: Fix an ERR_PTR vs NULL che=
ck)
Merging nvdimm/libnvdimm-for-next (f6d2b802f80d Merge branch 'for-5.7/libnv=
dimm' into libnvdimm-for-next)
Merging at24/at24/for-next (8f3d9f354286 Linux 5.7-rc1)
Merging ntb/ntb-next (1b3fb49ac27b NTB: ntb_test: Fix bug when counting rem=
ote files)
Merging kspp/for-next/kspp (c7527373fe28 gcc-common.h: Update for GCC 10)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (ae83d0b416db Linux 5.7-rc2)
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
Applying: remove COMPILE_TEST from SND_SOC_SOF_IMX_TOPLEVEL for now
Merging akpm-current/current (d20e842843bd ipc: convert ipcs_idr to XArray)
CONFLICT (content): Merge conflict in include/linux/printk.h
$ git checkout -b akpm remotes/origin/akpm/master
Applying: amdgpu: a NULL ->mm does not mean a thread is a kthread
Applying: i915/gvt: remove unused xen bits
Applying: kernel: move use_mm/unuse_mm to kthread.c
Applying: kernel: move use_mm/unuse_mm to kthread.c
Applying: kernel: better document the use_mm/unuse_mm API contract
Applying: kernel-better-document-the-use_mm-unuse_mm-api-contract-v2
Applying: kernel: set USER_DS in kthread_use_mm
Applying: mm/kmemleak: silence KCSAN splats in checksum
Applying: kallsyms/printk: add loglvl to print_ip_sym()
Applying: alpha: add show_stack_loglvl()
Applying: arc: add show_stack_loglvl()
Applying: arm/asm: add loglvl to c_backtrace()
Applying: arm: add loglvl to unwind_backtrace()
Applying: arm: add loglvl to dump_backtrace()
Applying: arm: wire up dump_backtrace_{entry,stm}
Applying: arm: add show_stack_loglvl()
Applying: arm64: add loglvl to dump_backtrace()
Applying: arm64: add show_stack_loglvl()
Applying: c6x: add show_stack_loglvl()
Applying: csky: add show_stack_loglvl()
Applying: h8300: add show_stack_loglvl()
Applying: hexagon: add show_stack_loglvl()
Applying: ia64: pass log level as arg into ia64_do_show_stack()
Applying: ia64: add show_stack_loglvl()
Applying: m68k: add show_stack_loglvl()
Applying: microblaze: add loglvl to microblaze_unwind_inner()
Applying: microblaze: add loglvl to microblaze_unwind()
Applying: microblaze: add show_stack_loglvl()
Applying: mips: add show_stack_loglvl()
Applying: nds32: add show_stack_loglvl()
Applying: nios2: add show_stack_loglvl()
Applying: openrisc: add show_stack_loglvl()
Applying: parisc: add show_stack_loglvl()
Applying: powerpc: add show_stack_loglvl()
Applying: riscv: add show_stack_loglvl()
Applying: s390: add show_stack_loglvl()
Applying: sh: add loglvl to dump_mem()
Applying: sh: remove needless printk()
Applying: sh: add loglvl to printk_address()
Applying: sh: add loglvl to show_trace()
Applying: sh: add show_stack_loglvl()
Applying: sparc: add show_stack_loglvl()
Applying: um/sysrq: remove needless variable sp
Applying: um: add show_stack_loglvl()
Applying: unicore32: remove unused pmode argument in c_backtrace()
Applying: unicore32: add loglvl to c_backtrace()
Applying: unicore32: add show_stack_loglvl()
Applying: x86: add missing const qualifiers for log_lvl
Applying: x86: add show_stack_loglvl()
Applying: xtensa: add loglvl to show_trace()
Applying: xtensa: add show_stack_loglvl()
Applying: sysrq: use show_stack_loglvl()
Applying: x86/amd_gart: print stacktrace for a leak with KERN_ERR
Applying: power: use show_stack_loglvl()
Applying: kdb: don't play with console_loglevel
Applying: sched: print stack trace with KERN_INFO
Applying: kernel: use show_stack_loglvl()
Applying: kernel: rename show_stack_loglvl() =3D> show_stack()
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
Applying: mm/mmap.c: add more sanity checks to get_unmapped_area()
Applying: mm/mmap.c: do not allow mappings outside of allowed limits
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
Merging akpm/master (2a2597a20277 drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)
Applying: powerpc/vas: fix up for {un}use_mm() rename

--Sig_//_CrMT4SFHhJ=Som8gdcy46
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6hRpAACgkQAVBC80lX
0GyZFQgAkeatevDo62lqoGH5DJ8HqJUj0BwnltkeX60tXmsWbbsixxxNND/9cFsq
0NdKZLKSWEcZTYa/8aNhuaMQO1u4K8F8vu90gq14//qPtYdEnT4iJmFOA6splxJj
OdYdh1BAVfcRJaLt8JxCEhykIKWISigkIDy910yvGD/dTHqeNhwFJkoZrOfl5BTv
JLFmYw1ST42P1wVms8w4lTEnxgQCEB0COV1G+XinwA2ODz53b4nV2zXWbVqSihXF
mH8FvIt/QckT5ClNZch7ld09PU5oiHNvq6d6PYUS3NVIaHuACjPetwTnP8/WW6ym
rclAN6//UnbimpfyRxUj1OOBkSitfQ==
=t/s0
-----END PGP SIGNATURE-----

--Sig_//_CrMT4SFHhJ=Som8gdcy46--
