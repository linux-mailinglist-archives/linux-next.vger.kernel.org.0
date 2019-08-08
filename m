Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 919EF85CA2
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2019 10:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731992AbfHHIRu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Aug 2019 04:17:50 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41001 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731642AbfHHIRt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 8 Aug 2019 04:17:49 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4641T26YNDz9sDB;
        Thu,  8 Aug 2019 18:17:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565252263;
        bh=xtRd34bY6wWkWGhaymhD3+bNdbBIjpwyZW/DoUhlcPA=;
        h=Date:From:To:Cc:Subject:From;
        b=YkGJNW7BwGbXa48e9x3yoN/X9bpl3BKRyYkgMpWpz4KPbUrmwEcPQxAcKQlt8PlLn
         hfjDZKn9LizasVZ466H/DsnfvuQGElK2g1T615sn0T4jxObfmRx61d54aNCYFN1eMX
         DrB523CcHzMD08NaBDnbj4JjXQCMdKMtVOouUFBR9CnSL1QhlVRdsWppwAquXG/kPa
         jLCIokuwkxBsMhuylEgnCBw+eYHEgHQrwTRxY9/KG682U8zkfXmnqkRobP0UCTG7KC
         B7lnejumJltquslHMRKffIsw4xAuWfd+x/xfuL37l9FWr3LW+SBhg+v+Ld/BB/1zq/
         R6ZY4nYtUuIEw==
Date:   Thu, 8 Aug 2019 18:17:39 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 8
Message-ID: <20190808181739.62f257ed@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.PvrZbS6_eU1nN4gfOmJxza";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.PvrZbS6_eU1nN4gfOmJxza
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20190807:

I reverted a commit from the kbuild-current tree by request.

The dma-mapping-fixes tree gained a build failure for which I reverted
the merge of that tree.

The bpf-next tree gained a conflict against Linus' tree.

The crypto tree still had its build failure for which I applied a patch.

The btrfs-kdave tree gained conflicts against the btrfs-fixes tree.

The tip tree gained a build failure for which I reverted a commit.

Non-merge commits (relative to Linus' tree): 4583
 4982 files changed, 271243 insertions(+), 122708 deletions(-)

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

I am currently merging 304 trees (counting Linus' and 74 trees of bug
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
Merging origin/master (33920f1ec5bf Merge git://git.kernel.org/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fixes/master (609488bc979f Linux 5.3-rc2)
Merging kbuild-current/fixes (c4b230ac34ce kbuild: show hint if subdir-y/m =
is used to visit module Makefile)
Merging arc-current/for-curr (e86d94fdda8e ARC: unwind: Mark expected switc=
h fall-throughs)
Merging arm-current/fixes (c5d0e49e8d8f ARM: 8867/1: vdso: pass --be8 to li=
nker if necessary)
Merging arm-soc-fixes/arm/fixes (7bd9d465140a Merge tag 'imx-fixes-5.3' of =
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fixes)
Merging arm64-fixes/for-next/fixes (d8bb6718c4db arm64: Make debug exceptio=
n handlers visible from RCU)
Merging m68k-current/for-linus (f28a1f16135c m68k: Don't select ARCH_HAS_DM=
A_PREP_COHERENT for nommu or coldfire)
Merging powerpc-fixes/fixes (d7e23b887f67 powerpc/kasan: fix early boot fai=
lure on PPC32)
Merging s390-fixes/fixes (24350fdadbde s390: put _stext and _etext into .te=
xt section)
Merging sparc/master (038029c03e21 sparc: remove unneeded uapi/asm/statfs.h)
Merging fscrypt-current/for-stable (ae64f9bd1d36 Linux 4.15-rc2)
Merging net/master (33920f1ec5bf Merge git://git.kernel.org/pub/scm/linux/k=
ernel/git/netdev/net)
Merging bpf/master (f1fc7249dddc selftests/bpf: tests for jmp to 1st insn)
Merging ipsec/master (22d6552f827e xfrm interface: fix management of phydev)
Merging netfilter/master (589b474a4b7c netfilter: nf_flow_table: fix offloa=
d for flows that are subject to xfrm)
Merging ipvs/master (58e8b37069ff Merge branch 'net-phy-dp83867-add-some-fi=
xes')
Merging wireless-drivers/master (1f6607250331 iwlwifi: dbg_ini: fix compile=
 time assert build errors)
Merging mac80211/master (d8a1de3d5bb8 isdn: hfcsusb: Fix mISDN driver crash=
 caused by transfer buffer on the stack)
Merging rdma-fixes/for-rc (e21a712a9685 Linux 5.3-rc3)
Merging sound-current/for-linus (c02f77d32d2c ALSA: hda - Workaround for cr=
ackled sound on AMD controller (1022:1457))
Merging sound-asoc-fixes/for-linus (5090b65e6dc1 Merge branch 'asoc-5.3' in=
to asoc-linus)
Merging regmap-fixes/for-linus (609488bc979f Linux 5.3-rc2)
Merging regulator-fixes/for-linus (0151f77cffe3 Merge branch 'regulator-5.3=
' into regulator-linus)
Merging spi-fixes/for-linus (30743331d109 Merge branch 'spi-5.3' into spi-l=
inus)
Merging pci-current/for-linus (5f9e832c1370 Linus 5.3-rc1)
Merging driver-core.current/driver-core-linus (cc798c83898e kernfs: fix mem=
leak in kernel_ops_readdir())
Merging tty.current/tty-linus (81eaadcae81b kgdboc: disable the console loc=
k when in kgdb)
Merging usb.current/usb-linus (c43f28dfdc46 usb: usbfs: fix double-free of =
usb memory upon submiturb error)
Merging usb-gadget-fixes/fixes (42de8afc40c9 usb: dwc2: Use generic PHY wid=
th in params setup)
Merging usb-serial-fixes/usb-linus (552573e42aab USB: serial: option: add D=
-Link DWM-222 device ID)
Merging usb-chipidea-fixes/ci-for-usb-stable (16009db47c51 usb: chipidea: u=
dc: workaround for endpoint conflict issue)
Merging phy/fixes (609488bc979f Linux 5.3-rc2)
Merging staging.current/staging-linus (09f6109ff4f8 Merge tag 'iio-fixes-fo=
r-5.3a' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into sta=
ging-linus)
Merging char-misc.current/char-misc-linus (5511c0c309db coresight: Fix DEBU=
G_LOCKS_WARN_ON for uninitialized attribute)
Merging soundwire-fixes/fixes (664b16589f88 soundwire: cadence_master: fix =
definitions for INTSTAT0/1)
Merging thunderbolt-fixes/fixes (e21a712a9685 Linux 5.3-rc3)
Merging input-current/for-linus (849f5ae3a513 Input: iforce - add sanity ch=
ecks)
Merging crypto-current/master (e2664ecbb2f2 crypto: ccp - Ignore tag length=
 when decrypting GCM ciphertext)
Merging ide/master (baf6722aa0cb ide: Use dev_get_drvdata where possible)
Merging vfio-fixes/for-linus (5715c4dd66a3 vfio/mdev: Synchronize device cr=
eate/remove with parent removal)
Merging kselftest-fixes/fixes (fbb01c52471c selftests/livepatch: push and p=
op dynamic debug config)
Merging modules-fixes/modules-linus (be71eda5383f module: Fix display of wr=
ong module .text address)
Merging slave-dma-fixes/fixes (d105ef8120dd dmaengine: tegra210-adma: Fix u=
nused function warnings)
Merging backlight-fixes/for-backlight-fixes (e93c9c99a629 Linux 5.1)
Merging mtd-fixes/mtd/fixes (2b372a9685a7 mtd: hyperbus: Add hardware depen=
dency to AM654 driver)
Merging mfd-fixes/for-mfd-fixes (63b2de12b7ee mfd: stmfx: Fix an endian bug=
 in stmfx_irq_handler())
Merging v4l-dvb-fixes/fixes (92f5b0313e37 media: vivid: fix missing cec ada=
pter name)
Merging reset-fixes/reset/fixes (a71dcd3757e2 reset: remove redundant null =
check on pointer dev)
Merging mips-fixes/mips-fixes (74034a09267c MIPS: BCM63XX: Mark expected sw=
itch fall-through)
Merging at91-fixes/at91-fixes (5f9e832c1370 Linus 5.3-rc1)
Merging omap-fixes/fixes (fb59ee37cfe2 ARM: dts: am57xx: Disable voltage sw=
itching for SD card)
Merging kvm-fixes/master (30cd8604323d KVM: x86: Add fixed counters to PMU =
filter)
Merging kvms390-fixes/master (a86cb413f4bf KVM: s390: Do not report unusabl=
ed IDs via KVM_CAP_MAX_VCPU_ID)
Merging hwmon-fixes/hwmon (608944f1978b hwmon: (lm75) Fixup tmp75b clr_mask)
Merging nvdimm-fixes/libnvdimm-fixes (d75996dd022b dax: dax_layout_busy_pag=
e() should not unmap cow pages)
Merging btrfs-fixes/next-fixes (efa6b617e067 Merge branch 'misc-5.3' into n=
ext-fixes)
Merging vfs-fixes/fixes (b101f818ceaf configfs: fix a deadlock in configfs_=
symlink())
Merging dma-mapping-fixes/for-linus (0af7f8c21a27 dma-direct: don't truncat=
e dma_required_mask to bus addressing capabilities)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (f14312a93b34 platform/x86: pcengines-apuv2=
: use KEY_RESTART for front button)
Merging samsung-krzk-fixes/fixes (5f9e832c1370 Linus 5.3-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (5f9e832c1370 Linus 5.3-rc1)
Merging devicetree-fixes/dt/linus (740ce365a4dc dt-bindings: Fix generated =
example files getting added to schemas)
Merging scsi-fixes/fixes (e82f04ec6ba9 scsi: qla2xxx: Fix possible fcport n=
ull-pointer dereferences)
Merging drm-fixes/drm-fixes (e21a712a9685 Linux 5.3-rc3)
Merging amdgpu-fixes/drm-fixes (b066c77636c0 Revert "drm/amdgpu: fix transf=
orm feedback GDS hang on gfx10 (v2)")
Merging drm-intel-fixes/for-linux-next-fixes (73a0ff0b30af drm/i915: Fix wr=
ong escape clock divisor init for GLK)
Merging mmc-fixes/fixes (b803974a8603 mmc: cavium: Add the missing dma unma=
p when the dma has finished.)
Merging rtc-fixes/rtc-fixes (5f9e832c1370 Linus 5.3-rc1)
Merging gnss-fixes/gnss-linus (f2c7c76c5d0a Linux 5.2-rc3)
Merging hyperv-fixes/hyperv-fixes (5d14de4c6ce5 hv: Use the correct style f=
or SPDX License Identifier)
Merging soc-fsl-fixes/fix (5674a92ca4b7 soc/fsl/qe: Fix an error code in qe=
_pin_request())
Merging risc-v-fixes/fixes (5496bf3d0431 RISC-V: Remove udivdi3)
Merging pidfd-fixes/fixes (97112e283da5 exit: make setting exit_state consi=
stent)
Merging fpga-fixes/fixes (7721f61d2e76 fpga: altera-ps-spi: Fix getting of =
optional confd gpio)
Merging drm-misc-fixes/for-linux-next-fixes (f7ccbed656f7 drm/rockchip: Sus=
pend DP late)
Applying: pagewalk: fix up missed conversion in migrate_vma_collect()
Merging kspp-gustavo/for-next/kspp (86f0367c900f scsi: fas216: Mark expecte=
d switch fall-throughs)
Merging kbuild/for-next (cc6ff7162ef4 Kbuild: Handle PREEMPT_RT for version=
 string and magic)
Merging compiler-attributes/compiler-attributes (ba2c1340d7c8 auxdisplay: c=
harlcd: add help text for backlight initial state)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (ad3c7b18c5b3 arm: use swiotlb for bounce buff=
ering on LPAE configs)
Merging asm-generic/master (7f3a8dff1219 asm-generic: remove ptrace.h)
Merging arc/for-next (6fbc7275c7a9 Linux 5.2-rc7)
Merging arm/for-next (b7a735f3a606 Merge branch 'for-arm-soc' into for-next)
Merging arm64/for-next/core (ea5ddd41d0d2 Merge branch 'for-next/tbi' into =
for-next/core)
Merging arm-perf/for-next/perf (228f855fb57a perf: Remove dev_err() usage a=
fter platform_get_irq())
Merging arm-soc/for-next (1439dbf17e9e Merge branch 'arm/fixes' into for-ne=
xt)
Merging actions/for-next (fb9c1c1deb5e Merge branch 'v4.20/drivers+s900-sps=
' into next)
Merging amlogic/for-next (5f2581d1bbf1 Merge branch 'v5.4/drivers' into tmp=
/aml-rebuild)
Merging aspeed/for-next (34bab04663d5 Merge branch 'dt-for-v5.4' into for-n=
ext)
Merging at91/at91-next (90fbe456b5f0 Merge branch 'at91-dt' into at91-next)
Merging bcm2835/for-next (f83e5000db15 Merge branch 'bcm2835-dt-next' into =
for-next)
Merging imx-mxs/for-next (8b3e0af8ab56 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (78145dbeaea1 Merge branch 'for_5.3/driver-soc' into =
next)
Merging mediatek/for-next (73ade6a62931 Merge branch 'v5.1-next/soc' into f=
or-next)
Merging mvebu/for-next (e1b0b32a5ad6 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (7376d6a65730 Merge branch 'fixes' into for-next)
Merging qcom/for-next (e8cf1988f521 Merge branches 'arm64-for-5.4' and 'dri=
vers-for-5.3' into for-next)
Merging renesas/next (a16ecb14d0b0 Merge branches 'arm-dt-for-v5.3', 'arm-s=
oc-for-v5.3', 'arm-defconfig-for-v5.3', 'arm64-defconfig-for-v5.3', 'arm64-=
dt-for-v5.3' and 'dt-bindings-for-v5.3' into next)
Merging renesas-geert/next (67986e5bca3b Merge branch 'renesas-arm64-dt-for=
-v5.4' into renesas-next)
Merging reset/reset/next (ea651ffd4f7f reset: Add DesignWare IP support to =
simple reset)
Merging rockchip/for-next (30b2ea80df59 Merge branch 'v5.4-armsoc/dts32' in=
to for-next)
Merging samsung-krzk/for-next (468b887c767e Merge branch 'next/defconfig' i=
nto for-next)
Merging scmi/for-linux-next (2c49c4861280 Merge remote-tracking branches 'k=
org_sudeep/for-next/juno', 'korg_sudeep/for-next/vexpress-dt' and 'korg_sud=
eep/for-next/vexpress' into for-linux-next)
Merging sunxi/sunxi/for-next (6c7312f8d13e Merge branches 'sunxi/dt-for-5.4=
' and 'sunxi/drivers-for-5.4' into sunxi/for-next)
Merging tegra/for-next (6290ae1fb7e2 Merge branch for-5.4/firmware into for=
-next)
Merging clk/clk-next (03d7036efa4a Merge branch 'clk-fixes' into clk-next)
Merging clk-samsung/for-next (a188339ca5a3 Linux 5.2-rc1)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (ada384a7fd2d csky: Optimize arch_sync_dma_for_cpu/=
device with dma_inv_range)
Merging h8300/h8300-next (a5de8865cb3e h8300: move definition of __kernel_s=
ize_t etc. to posix_types.h)
Merging ia64/next (c5e5c48c1642 ia64:unwind: fix double free for mod->arch.=
init_unw_table)
Merging m68k/for-next (f28a1f16135c m68k: Don't select ARCH_HAS_DMA_PREP_CO=
HERENT for nommu or coldfire)
Merging m68knommu/for-next (e21a712a9685 Linux 5.3-rc3)
Merging microblaze/next (226a893bbb1f microblaze: no need to check return v=
alue of debugfs_create functions)
Merging mips/mips-next (6393e6064486 mips: fix vdso32 build, again)
CONFLICT (content): Merge conflict in arch/mips/include/asm/vdso/vdso.h
Merging nds32/next (932296120543 nds32: add new emulations for floating poi=
nt instruction)
Merging nios2/for-next (f017da5c7077 nios2: configs: Remove useless UEVENT_=
HELPER_PATH)
Merging openrisc/for-next (57ce8ba0fd3a openrisc: Fix broken paths to arch/=
or32)
Merging parisc-hd/for-next (83af58f8068e parisc: Add assembly implementatio=
ns for memset, strlen, strcpy, strncpy and strcat)
Merging powerpc/next (5f9e832c1370 Linus 5.3-rc1)
Merging fsl/next (63d86876f324 Revert "powerpc/fsl_pci: simplify fsl_pci_dm=
a_set_mask")
Merging soc-fsl/next (21560067fb1f soc: fsl: qe: fold qe_get_num_of_snums i=
nto qe_snums_init)
Merging risc-v/for-next (f51edcec5288 MAINTAINERS: Add an entry for generic=
 architecture topology)
Merging sifive/for-next (467e050e9760 Merge branch 'i2c/for-current' of git=
://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging s390/features (20f3502bfb2f s390: move vmalloc option parsing to st=
artup code)
Merging sh/sh-next (cd10afbc932d sh: remove unneeded uapi asm-generic wrapp=
ers)
CONFLICT (modify/delete): arch/sh/include/uapi/asm/types.h deleted in sh/sh=
-next and modified in HEAD. Version HEAD of arch/sh/include/uapi/asm/types.=
h left in tree.
CONFLICT (modify/delete): arch/sh/include/uapi/asm/setup.h deleted in sh/sh=
-next and modified in HEAD. Version HEAD of arch/sh/include/uapi/asm/setup.=
h left in tree.
$ git rm -f arch/sh/include/uapi/asm/setup.h arch/sh/include/uapi/asm/types=
.h
Merging sparc-next/master (b71acb0e3721 Merge branch 'linus' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging uml/linux-next (b482e48d29f1 um: fix build without CONFIG_UML_TIME_=
TRAVEL_SUPPORT)
Merging xtensa/xtensa-for-next (1386dcaa9226 Merge branch 'xtensa-5.3' into=
 xtensa-for-next)
Merging fscrypt/master (0564336329f0 fscrypt: document testing with xfstest=
s)
Merging afs/afs-next (852c1d04f6d0 afs: Support RCU pathwalk)
Applying: Revert "pagewalk: fix up missed conversion in migrate_vma_collect=
()"
Applying: Revert "Merge remote-tracking branch 'dma-mapping-fixes/for-linus=
'"
Merging btrfs/next (29dcea88779c Linux 4.17)
Merging btrfs-kdave/for-next (a668d8d6543c Merge branch 'cleanup/sysfs-refa=
ctoring' into for-next-20190805)
CONFLICT (content): Merge conflict in fs/btrfs/extent-tree.c
CONFLICT (content): Merge conflict in fs/btrfs/ctree.h
Applying: btrfs: merge fix up for "Btrfs: fix sysfs warning and missing rai=
d sysfs directories"
Merging ceph/master (d31d07b97a5e ceph: fix end offset in truncate_inode_pa=
ges_range call)
Merging cifs/for-next (6f552656e128 smb3: Incorrect size for netname negoti=
ate context)
Merging configfs/for-next (f6122ed2a4f9 configfs: Fix use-after-free when a=
ccessing sd->s_dentry)
Merging ecryptfs/next (7451c54abc91 ecryptfs: Change return type of ecryptf=
s_process_flags)
Merging ext3/for_next (56db1991690f udf: prevent allocation beyond UDF part=
ition)
Merging ext4/dev (96fcaf86c3cb ext4: fix coverity warning on error path of =
filename setup)
Merging f2fs/dev (11f3567662e0 f2fs: Support case-insensitive file name loo=
kups)
Merging fsverity/fsverity (60d7bf0f790f f2fs: add fs-verity support)
CONFLICT (content): Merge conflict in fs/f2fs/inode.c
CONFLICT (content): Merge conflict in fs/f2fs/file.c
Merging fuse/for-next (e7d6cd694383 fuse: cleanup fuse_wait_on_page_writeba=
ck)
Merging jfs/jfs-next (a5fdd713d256 jfs: fix bogus variable self-initializat=
ion)
Merging nfs/linux-next (dea1bb35c5f3 NFS: Fix regression whereby fscache er=
rors are appearing on 'nofsc' mounts)
Merging nfs-anna/linux-next (68f461593f76 NFS/flexfiles: Use the correct TC=
P timeout for flexfiles I/O)
Merging nfsd/nfsd-next (64a38e840ce5 SUNRPC: Track writers of the 'channel'=
 file to improve cache_listeners_exist)
Merging orangefs/for-next (e65682b55956 orangefs: eliminate needless variab=
le assignments)
Merging overlayfs/overlayfs-next (0be0bfd2de9d ovl: fix regression caused b=
y overlapping layers detection)
Merging ubifs/linux-next (8009ce956c3d ubifs: Don't leak orphans on memory =
during commit)
Merging v9fs/9p-next (80a316ff1627 9p/xen: Add cleanup path in p9_trans_xen=
_init)
Merging xfs/for-next (afa1d96d1430 xfs: Fix possible null-pointer dereferen=
ces in xchk_da_btree_block_check_sibling())
Merging iomap/iomap-for-next (5d907307adc1 iomap: move internal declaration=
s into fs/iomap/)
Merging djw-vfs/vfs-for-next (7e328e5930ad mm/fs: don't allow writes to imm=
utable files)
Merging file-locks/locks-next (43e4cb942e88 locks: Fix procfs output for fi=
le leases)
Merging vfs/for-next (dad5ea4bac62 ceph_real_mount(): missing initializatio=
n)
CONFLICT (content): Merge conflict in fs/ubifs/super.c
CONFLICT (content): Merge conflict in fs/gfs2/super.c
CONFLICT (content): Merge conflict in fs/ceph/super.c
CONFLICT (modify/delete): Documentation/filesystems/vfs.txt deleted in HEAD=
 and modified in vfs/for-next. Version vfs/for-next of Documentation/filesy=
stems/vfs.txt left in tree.
$ git rm -f Documentation/filesystems/vfs.txt
Applying: docs: filesystems: vfs: update for "vfs: Kill mount_single()"
Merging printk/for-next (ba174ef6d224 Merge branch 'for-5.3-fixes' into for=
-next)
Merging pci/next (5f9e832c1370 Linus 5.3-rc1)
Merging pstore/for-next/pstore (609488bc979f Linux 5.3-rc2)
Merging hid/for-next (7773e1130551 Merge branch 'for-5.3/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (d4b7c7304363 Merge branch 'i2c/for-5.4' into i2c/=
for-next)
Merging i3c/i3c/next (934d24a5e150 i3c: move i3c_device_match_id to device.=
c and export it)
Merging dmi/master (57361846b52b Linux 4.19-rc2)
Merging hwmon-staging/hwmon-next (f34f6267a577 hwmon: (nct7904) Add extra s=
ysfs support for fan, voltage and temperature.)
Merging jc_docs/docs-next (aa48e31b8747 mailmap: add entry for Jaegeuk Kim)
CONFLICT (content): Merge conflict in Documentation/admin-guide/cifs/todo.r=
st
Merging v4l-dvb/master (97299a303532 media: Remove dev_err() usage after pl=
atform_get_irq())
Merging v4l-dvb-next/master (5f9e832c1370 Linus 5.3-rc1)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (8a794870abca Merge branch 'pm-pci' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (07e44f922529 Merge branch 'cpuf=
req/qcom-updates' into cpufreq/arm/linux-next)
Merging cpupower/cpupower (04507c0a9385 cpupower : frequency-set -r option =
misses the last cpu in related cpu list)
Merging opp/opp/linux-next (0203c0343a1f Merge branch 'opp/qcom-updates' in=
to opp/linux-next)
Merging thermal/next (d093f91ff7d0 Merge branch 'for-rc' into next)
CONFLICT (rename/add): Rename Documentation/thermal/index.rst->Documentatio=
n/driver-api/thermal/index.rst in HEAD. Documentation/driver-api/thermal/in=
dex.rst added in thermal/next
Merging thermal-soc/next (4cb9f043447e thermal: thermal_mmio: remove some d=
ead code)
Merging ieee1394/for-next (812cd88749e0 firewire: mark expected switch fall=
-throughs)
Merging dlm/next (a48f9721e6db dlm: no need to check return value of debugf=
s_create functions)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (cfa1f5f27c79 RDMA/efa: Rate limit admin queue error =
prints)
Merging net-next/master (13dfb3fa4943 Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/netdev/net)
Merging bpf-next/master (b707659213d3 tools/bpf: fix core_reloc.c compilati=
on error)
CONFLICT (content): Merge conflict in tools/lib/bpf/libbpf.c
Merging ipsec-next/master (c7b37c769d2a xfrm: remove get_mtu indirection fr=
om xfrm_type)
Merging mlx5-next/mlx5-next (94f3e14e00fd mlx5: Use refcount_t for refcount)
Merging netfilter-next/master (1b90af292e71 ipvs: Improve robustness to the=
 ipvs sysctl)
Merging nfc-next/master (1f008cfec5d5 NFC: fdp: Fix unused variable warning=
s)
CONFLICT (content): Merge conflict in drivers/nfc/st21nfca/se.c
Merging ipvs-next/master (1b0b807dd746 Merge branch 'r8169-fw')
Merging wireless-drivers-next/master (6004cf298a41 b43legacy: Remove pointl=
ess cond_resched() wrapper)
Merging bluetooth/master (fa9ccaf84f5d Bluetooth: hidp: Let hidp_send_messa=
ge return number of queued bytes)
Merging mac80211-next/master (6a7ce95d752e staging/octeon: Fix build error =
without CONFIG_NETDEVICES)
Merging gfs2/for-next (7e77380155dd gfs2: Minor gfs2_alloc_inode cleanup)
Merging mtd/mtd/next (5f9e832c1370 Linus 5.3-rc1)
Merging nand/nand/next (80107e764846 mtd: rawnand: remove redundant assignm=
ent to variable ret)
Merging spi-nor/spi-nor/next (5f9e832c1370 Linus 5.3-rc1)
Merging crypto/master (155e4db32487 asm-generic: Remove redundant arch-spec=
ific rules for simd.h)
Applying: hwrng: fix typo in n2-drv.c
Merging drm/drm-next (dce14e36aea2 Merge tag 'drm-intel-next-2019-07-30' of=
 git://anongit.freedesktop.org/drm/drm-intel into drm-next)
Merging amdgpu/drm-next (ce5507ad2bde drm/amdkfd/kfd_mqd_manager_v10: Avoid=
 fall-through warning)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/powerplay/navi10_=
ppt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/powerplay/inc/amd=
gpu_smu.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/powerplay/amdgpu_=
smu.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dcn20/=
dcn20_hwseq.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/core/d=
c_stream.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/clk_mg=
r/dcn20/dcn20_clk_mgr.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_vcn=
.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ras=
.c
Merging drm-intel/for-linux-next (5e0a809af2a2 drm/i915/uc: Hardening firmw=
are fetch)
Merging drm-tegra/drm/tegra/for-next (2a6fc3cb5cb6 drm/tegra: Fix gpiod_get=
_from_of_node() regression)
Merging drm-misc/for-linux-next (cc8f12996e24 drm/rockchip: fix VOP_WIN_GET=
 macro)
CONFLICT (content): Merge conflict in drivers/gpu/drm/ttm/ttm_bo.c
Applying: drm/amdgpu: fix up for "drm/amdgpu: switch driver from bo->resv t=
o bo->base.resv"
Merging drm-msm/msm-next (4cf643a39221 Merge tag 'drm-next-5.3-2019-06-27' =
of git://people.freedesktop.org/~agd5f/linux into drm-next)
Merging hdlcd/for-upstream/hdlcd (d664b851eb2b drm/arm/hdlcd: Reject atomic=
 commits that disable only the plane)
Merging mali-dp/for-upstream/mali-dp (4cf643a39221 Merge tag 'drm-next-5.3-=
2019-06-27' of git://people.freedesktop.org/~agd5f/linux into drm-next)
Merging imx-drm/imx-drm/next (c23ef285fc67 drm/imx: Drop unused imx-ipuv3-c=
rtc.o build)
Merging etnaviv/etnaviv/next (facb180d3a51 drm/etnaviv: Use devm_platform_i=
oremap_resource())
Merging regmap/for-next (5a6660ea31e5 Merge branch 'regmap-5.4' into regmap=
-next)
Merging sound/for-next (118b2806a076 ALSA: usb-audio: Add Pioneer DDJ-SX3 P=
CM quirck)
Merging sound-asoc/for-next (812d2436421f Merge branch 'asoc-5.4' into asoc=
-next)
CONFLICT (content): Merge conflict in sound/soc/intel/skylake/skl.h
CONFLICT (content): Merge conflict in sound/soc/intel/skylake/skl-nhlt.c
Merging modules/modules-next (38f054d549a8 modules: always page-align modul=
e section allocations)
Merging input/next (c394159310d0 Input: soc_button_array - add support for =
newer surface devices)
Merging block/for-next (cdb65d358423 Merge branch 'for-5.4/block' into for-=
next)
Merging device-mapper/for-next (9c50a98f55f4 dm table: fix various whitespa=
ce issues with recent DAX code)
Merging pcmcia/pcmcia-next (95691e3eddc4 pcmcia: Implement CLKRUN protocol =
disabling for Ricoh bridges)
Merging mmc/next (9637eb6749b9 Merge branch 'fixes' into next)
Merging kgdb/kgdb-next (3bd67b37e350 kdb: print real address of pointers in=
stead of hashed addresses)
CONFLICT (content): Merge conflict in kernel/debug/kdb/kdb_bt.c
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (b5e29aa880be mfd: davinci_voicecodec: Remove poin=
tless #include)
Merging backlight/for-backlight-next (73fbfc499448 backlight: pwm_bl: Fix h=
euristic to determine number of brightness levels)
Merging battery/for-next (5f9e832c1370 Linus 5.3-rc1)
Merging regulator/for-next (0c1f8324e0e3 Merge branch 'regulator-5.4' into =
regulator-next)
Merging security/next-testing (286e47a07799 Merge branch 'next-lsm' into ne=
xt-testing)
Merging apparmor/apparmor-next (136db994852a apparmor: increase left match =
history buffer size)
Merging integrity/next-integrity (70433f67ec3a MODSIGN: make new include fi=
le self contained)
Merging keys/keys-next (8cf8684e0d24 Merge branch 'keys-acl' into keys-next)
CONFLICT (content): Merge conflict in include/linux/key.h
CONFLICT (content): Merge conflict in fs/afs/security.c
Applying: fsverity: merge fix for keyring_alloc API change
Merging selinux/next (9b80c36353ed selinux: always return a secid from the =
network caches if we find one)
Merging tpmdd/next (fa4f99c05320 tpm: tpm_ibm_vtpm: Fix unallocated banks)
Merging watchdog/master (a18670f4617d watchdog: ath79_wdt: fix a typo in th=
e name of a function)
Merging iommu/next (66929812955b iommu/amd: Add support for X2APIC IOMMU in=
terrupts)
Merging vfio/next (1e4d09d2212d mdev: Send uevents around parent device reg=
istration)
Merging audit/next (5f9e832c1370 Linus 5.3-rc1)
Merging devicetree/for-next (bf1c0ac6a8bc docs: writing-schema.md: convert =
from markdown to ReST)
Merging mailbox/mailbox-for-next (25777e5784a7 mailbox: handle failed named=
 mailbox channel request)
Merging spi/for-next (0feb02fbc3ca Merge branch 'spi-5.4' into spi-next)
Merging tip/auto-latest (2de8fc5773de Merge branch 'x86/mm')
Applying: Revert "locking/mutex: Make __mutex_owner static to mutex.c"
Merging clockevents/clockevents/next (b0c74b96d177 clocksource/drivers/davi=
nci: Add support for clocksource)
Merging edac/edac-for-next (8faa1cf6ed82 EDAC/altera: Use the proper type f=
or the IRQ status bits)
Merging irqchip/irq/irqchip-next (3dae67ce600c irqchip/gic-pm: Remove PM_CL=
K dependency)
Merging ftrace/for-next (6d54ceb539aa tracing: Fix user stack trace "??" ou=
tput)
Merging rcu/rcu/next (b989ff070574 Merge LKMM and RCU commits)
Merging kvm/linux-next (30cd8604323d KVM: x86: Add fixed counters to PMU fi=
lter)
Merging kvm-arm/next (1e0cf16cdad1 KVM: arm/arm64: Initialise host's MPIDRs=
 by reading the actual register)
Merging kvm-ppc/kvm-ppc-next (3bda7f0ae0f7 KVM: PPC: Book3S PR: Fix softwar=
e breakpoints)
Merging kvms390/next (a049a377164c KVM: selftests: Enable dirty_log_test on=
 s390x)
Merging xen-tip/linux-next (b877ac9815a8 xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging percpu/for-next (03ed70fb0e5e Merge branch 'for-5.3' into for-next)
Merging workqueues/for-next (be69d00d9769 workqueue: Remove GPF argument fr=
om alloc_workqueue_attrs())
Merging drivers-x86/for-next (e3168b874321 platform/x86: asus-wmi: fix CPU =
fan control on recent products)
Merging chrome-platform/for-next (5f9e832c1370 Linus 5.3-rc1)
Merging hsi/for-next (c1030cd45619 HSI: Remove dev_err() usage after platfo=
rm_get_irq())
Merging leds/for-next (be7fc2cc8617 Merge tag 'generic_lookup_helpers' into=
 for-next)
Merging ipmi/for-next (340ff31ab00b ipmi_si: Only schedule continuously in =
the thread in maintenance mode)
Merging driver-core/driver-core-next (0fbb93fce79b olpc: x01: convert platf=
orm driver to use dev_groups)
Merging usb/usb-next (91148dbad80b USB: usbip: convert platform driver to u=
se dev_groups)
Merging usb-gadget/next (b2357839c56a usb: renesas_usbhs: add a workaround =
for a race condition of workqueue)
Merging usb-serial/usb-next (e21a712a9685 Linux 5.3-rc3)
Merging usb-chipidea-next/ci-for-usb-next (034252e37b31 usb: chipidea: msm:=
 Use devm_platform_ioremap_resource())
Merging phy-next/next (609488bc979f Linux 5.3-rc2)
Merging tty/tty-next (a4ba050dbc88 serial: 8250_dw: Use a unified new dev v=
ariable in remove)
Merging char-misc/char-misc-next (f51cf9e23b70 misc: Remove spear13xx pcie =
gadget driver)
Merging extcon/extcon-next (a3fc57233977 extcon: adc-jack: Remove dev_err()=
 usage after platform_get_irq())
Merging soundwire/next (15ed3ea2280e soundwire: bus: split handling of Devi=
ce0 events)
Merging thunderbolt/next (04f7745300ed thunderbolt: Show key using %*pE not=
 %*pEp)
Merging staging/staging-next (36d042bd6865 staging: rtl8192e: Make use kmem=
dup)
Merging mux/for-next (05fb8284a417 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (83fdb2dfb0c2 interconnect: convert to DEFINE_SHOW_ATT=
RIBUTE)
Merging slave-dma/next (e17be6e1b713 dmaengine: Remove dev_err() usage afte=
r platform_get_irq())
Merging cgroup/for-next (653a23ca7e1e Use kvmalloc in cgroups-v1)
Merging scsi/for-next (03ed974738a0 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (6e0b7ca281d7 scsi: mpt3sas: Update driver versio=
n to 31.100.00.00)
Merging vhost/linux-next (73f628ec9e6b vhost: disable metadata prefetch opt=
imization)
Merging rpmsg/for-next (7f1345e9efcc Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (6926e30f09db Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (f4160faac98c gpio: pca953x: Drop %s for co=
nstant string literals)
Merging pinctrl/for-next (b0f0e8f55fa8 Merge branch 'devel' into for-next)
Merging pinctrl-samsung/for-next (10971e2ab6eb pinctrl: samsung: Fix device=
 node refcount leaks in init code)
Merging pwm/for-next (3d25025ce9c2 pwm: fsl-ftm: Make sure to unlock mutex =
on failure)
Merging userns/for-next (318759b4737c signal/x86: Move tsk inside of CONFIG=
_MEMORY_FAILURE in do_sigbus)
Merging ktest/for-next (aecea57f84b0 ktest: Fix some typos in config-bisect=
.pl)
Merging random/dev (58be0106c530 random: fix soft lockup when trying to rea=
d from an uninitialized blocking pool)
Merging kselftest/next (5f9e832c1370 Linus 5.3-rc1)
Merging y2038/y2038 (a2318b6a16a8 riscv: Use latest system call ABI)
CONFLICT (content): Merge conflict in arch/riscv/include/uapi/asm/unistd.h
Merging livepatching/for-next (28f28ea4343a Merge branch 'for-5.3-core' int=
o for-next)
Merging coresight/next (a04d8683f577 coresight: etm4x: improve clarity of e=
tm4_os_unlock comment)
Merging rtc/rtc-next (06c8e550a84e rtc: s5m: convert to i2c_new_dummy_devic=
e)
Merging nvdimm/libnvdimm-for-next (cb3110f7452d Merge branch 'for-5.3/dax' =
into libnvdimm-for-next)
Merging at24/at24/for-next (10742fee98eb eeprom: at24: remove unneeded incl=
ude)
Merging ntb/ntb-next (5f9e832c1370 Linus 5.3-rc1)
Merging kspp/for-next/kspp (60f2c82ed20b randstruct: Check member structs i=
n is_pure_ops_struct())
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (f2c7c76c5d0a Linux 5.2-rc3)
Merging fsi/next (371975b0b075 fsi/core: Fix error paths on CFAM init)
Merging siox/siox/next (1e4b044d2251 Linux 4.18-rc4)
Merging slimbus/for-next (0a43bffb7e21 slimbus: fix slim_tid_txn())
Merging nvmem/for-next (e018ed6ecebf nvmem: meson-mx-efuse: allow reading d=
ata smaller than word_size)
Merging xarray/xarray (91abab83839a XArray: Fix xas_next() with a single en=
try at 0)
Merging hyperv/hyperv-next (221f6df008ab hv_balloon: Reorganize the probe f=
unction)
Merging auxdisplay/auxdisplay (f4bb1f895aa0 auxdisplay/ht16k33.c: Convert t=
o use vm_map_pages_zero())
Merging kgdb-dt/kgdb/for-next (ca976bfb3154 kdb: Fix bound check compiler w=
arning)
Merging pidfd/for-next (aed5a8df3dbb tests: add pidfd poll tests)
Merging devfreq/for-next (27c17be8e488 PM / devfreq: tegra20: add COMMON_CL=
K dependency)
Merging hmm/hmm (9c240a7bb337 mm/hmm: make HMM_MIRROR an implicit option)
Merging fpga/for-next (7d62460b4060 MAINTAINERS: Move linux-fpga tree to ne=
w location)
Applying: Revert "kbuild: show hint if subdir-y/m is used to visit module M=
akefile"
Merging akpm-current/current (c78d30d327b7 ipc/msg.c: consolidate all xxxct=
l_down() functions)
CONFLICT (content): Merge conflict in arch/arm64/include/asm/processor.h
$ git checkout -b akpm remotes/origin/akpm/master
Applying: pinctrl: fix pxa2xx.c build warnings
Applying: mm: treewide: clarify pgtable_page_{ctor,dtor}() naming
Applying: drivers/tty/serial/sh-sci.c: suppress warning
Applying: drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer ove=
rflow
Merging akpm/master (a483f7b1f6bb drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/.PvrZbS6_eU1nN4gfOmJxza
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1L2qMACgkQAVBC80lX
0GytOAf/Su3xVgKDcYZY7ZsQagUSwgmrZSN74RYIjnJmzDfArT0cS8EacuxfemeR
TB1oEiGqgR1zS9Ec/wlFhpJY816St78Wk7oum3+Hrqy9TtSNkqr8J3zieWEYxXI9
GS4TSdLsVt5OhHy4X+fQchxgsgy28JryOAM8YD4wdGYTokKoASkkvKh2Y6FQESkq
rse2Q8ql3Bsv6i2AyHuhoHUxJbU+FqVW8TRayt2XYf26Z5qBHKwoBwJ4Ye+drEBT
AFC7PJ1SjO4LbPq6ujAflgJCrLjQj3XMuCh11Qd3GhtO47F30yAHv8Vlu1MjjCan
gu3iEItD7sriqNliI0g+PUec7G0f9g==
=Nl9P
-----END PGP SIGNATURE-----

--Sig_/.PvrZbS6_eU1nN4gfOmJxza--
