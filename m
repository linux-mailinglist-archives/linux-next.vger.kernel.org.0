Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA7FD957E2
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2019 09:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728907AbfHTHKE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Aug 2019 03:10:04 -0400
Received: from ozlabs.org ([203.11.71.1]:58413 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728777AbfHTHKD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Aug 2019 03:10:03 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46CMPJ1Bqxz9sN4;
        Tue, 20 Aug 2019 17:09:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566284996;
        bh=haKbVIguLUEttJhMdD9jI+aMfN5hxxGMf7oLaEg86uE=;
        h=Date:From:To:Cc:Subject:From;
        b=sM/41xkp7lr/SMaCG8ohsRasat+LGcktzBhV4pRAo5RBPpJ+f+A3yEB72KsWOuP4i
         s5bCuz56DVifdjq9IHQtUU88/euaNlX4T0PcDGiAWB0bhdDiY5ZaffvTGl2bKFOf0d
         TjJNoTPzI+vKoSFIHGuhL1Mw68KwxeZfAJHSWhzoQCFnNPnFw5aY+EAULbDRGuwUaL
         ni6kSu1Iya11DkZWT+8jB6X9uA5LePwu119j2RqVLzGmHmROK/Rw6koufiguOwLcQD
         8Jb9bnYi1EgzhB0o+LDLos60uGICDCcH3rCNpT8q9xTGvtFpiy3cjZ/xPua4cSbJyH
         d0aLKh1Kb/PaQ==
Date:   Tue, 20 Aug 2019 17:09:55 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 20
Message-ID: <20190820170955.3ca79270@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rmWtZmTsJz_+0=dD3xECl/A";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rmWtZmTsJz_+0=dD3xECl/A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20190819:

The drm-misc tree gained a conflict against the drm-intel tree.

The security tree lost its build failure.

Non-merge commits (relative to Linus' tree): 6824
 7412 files changed, 368368 insertions(+), 221059 deletions(-)

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

I am currently merging 309 trees (counting Linus' and 77 trees of bug
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
Merging origin/master (06821504fd47 Merge git://git.kernel.org/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fixes/master (609488bc979f Linux 5.3-rc2)
Merging kbuild-current/fixes (451577f3e3a9 Merge tag 'kbuild-fixes-v5.3-3' =
of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild)
Merging arc-current/for-curr (e86d94fdda8e ARC: unwind: Mark expected switc=
h fall-throughs)
Merging arm-current/fixes (c5d0e49e8d8f ARM: 8867/1: vdso: pass --be8 to li=
nker if necessary)
Merging arm-soc-fixes/arm/fixes (305cd70ec311 Merge tag 'amlogic-fixes' of =
git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic into ar=
m/fixes)
Merging arm64-fixes/for-next/fixes (b6143d10d23e arm64: ftrace: Ensure modu=
le ftrace trampoline is coherent with I-side)
Merging m68k-current/for-linus (f28a1f16135c m68k: Don't select ARCH_HAS_DM=
A_PREP_COHERENT for nommu or coldfire)
Merging powerpc-fixes/fixes (b9ee5e04fd77 powerpc/64e: Drop stale call to s=
mp_processor_id() which hangs SMP startup)
Merging s390-fixes/fixes (d45331b00ddb Linux 5.3-rc4)
Merging sparc/master (038029c03e21 sparc: remove unneeded uapi/asm/statfs.h)
Merging fscrypt-current/for-stable (ae64f9bd1d36 Linux 4.15-rc2)
Merging net/master (e15dbcdeb9f6 Merge git://git.kernel.org/pub/scm/linux/k=
ernel/git/pablo/nf)
Merging bpf/master (d34b044038bf tools: bpftool: close prog FD before exit =
on showing a single program)
Merging ipsec/master (22d6552f827e xfrm interface: fix management of phydev)
Merging netfilter/master (38a429c898dd netfilter: add include guard to nf_c=
onntrack_h323_types.h)
Merging ipvs/master (58e8b37069ff Merge branch 'net-phy-dp83867-add-some-fi=
xes')
Merging wireless-drivers/master (1f6607250331 iwlwifi: dbg_ini: fix compile=
 time assert build errors)
Merging mac80211/master (d8a1de3d5bb8 isdn: hfcsusb: Fix mISDN driver crash=
 caused by transfer buffer on the stack)
Merging rdma-fixes/for-rc (2c8ccb37b08f RDMA/siw: Change CQ flags from 64->=
32 bits)
Merging sound-current/for-linus (f9ef724d4896 ALSA: hda - Fixes inverted Co=
nexant GPIO mic mute led)
Merging sound-asoc-fixes/for-linus (9dd959fb934e Merge branch 'asoc-5.3' in=
to asoc-linus)
Merging regmap-fixes/for-linus (0161b8716465 Merge branch 'regmap-5.3' into=
 regmap-linus)
Merging regulator-fixes/for-linus (c8c4e33fb85d Merge branch 'regulator-5.3=
' into regulator-linus)
Merging spi-fixes/for-linus (ec010644e3b7 Merge branch 'spi-5.3' into spi-l=
inus)
Merging pci-current/for-linus (7bafda88de20 Documentation PCI: Fix pciebus-=
howto.rst filename typo)
Merging driver-core.current/driver-core-linus (d45331b00ddb Linux 5.3-rc4)
Merging tty.current/tty-linus (d45331b00ddb Linux 5.3-rc4)
Merging usb.current/usb-linus (d1abaeb3be7b Linux 5.3-rc5)
Merging usb-gadget-fixes/fixes (4a56a478a525 usb: gadget: mass_storage: Fix=
 races between fsg_disable and fsg_set_alt)
Merging usb-serial-fixes/usb-linus (d1abaeb3be7b Linux 5.3-rc5)
Merging usb-chipidea-fixes/ci-for-usb-stable (16009db47c51 usb: chipidea: u=
dc: workaround for endpoint conflict issue)
Merging phy/fixes (609488bc979f Linux 5.3-rc2)
Merging staging.current/staging-linus (d1abaeb3be7b Linux 5.3-rc5)
Merging char-misc.current/char-misc-linus (d1abaeb3be7b Linux 5.3-rc5)
Merging soundwire-fixes/fixes (8676b3ca4673 soundwire: fix regmap dependenc=
ies and align with other serial links)
Merging thunderbolt-fixes/fixes (d1abaeb3be7b Linux 5.3-rc5)
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
Merging slave-dma-fixes/fixes (d555c34338ca omap-dma/omap_vout_vrfb: fix of=
f-by-one fi value)
Merging backlight-fixes/for-backlight-fixes (e93c9c99a629 Linux 5.1)
Merging mtd-fixes/mtd/fixes (834de5c1aa76 mtd: spi-nor: Fix the disabling o=
f write protection at init)
Merging mfd-fixes/for-mfd-fixes (63b2de12b7ee mfd: stmfx: Fix an endian bug=
 in stmfx_irq_handler())
Merging v4l-dvb-fixes/fixes (92f5b0313e37 media: vivid: fix missing cec ada=
pter name)
Merging reset-fixes/reset/fixes (a71dcd3757e2 reset: remove redundant null =
check on pointer dev)
Merging mips-fixes/mips-fixes (74034a09267c MIPS: BCM63XX: Mark expected sw=
itch fall-through)
Merging at91-fixes/at91-fixes (5f9e832c1370 Linus 5.3-rc1)
Merging omap-fixes/fixes (4a65bbb9109e soc: ti: pm33xx: Make two symbols st=
atic)
Merging kvm-fixes/master (a738b5e75b4c Merge tag 'kvmarm-fixes-for-5.3-2' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvms390-fixes/master (a86cb413f4bf KVM: s390: Do not report unusabl=
ed IDs via KVM_CAP_MAX_VCPU_ID)
Merging hwmon-fixes/hwmon (4207f85eb0f6 hwmon: (lm75) Fix write operations =
for negative temperatures)
Merging nvdimm-fixes/libnvdimm-fixes (06282373ff57 mm/memremap: Fix reuse o=
f pgmap instances with internal references)
Merging btrfs-fixes/next-fixes (efa6b617e067 Merge branch 'misc-5.3' into n=
ext-fixes)
Merging vfs-fixes/fixes (e272d4fb74d6 configfs: fix a deadlock in configfs_=
symlink())
Merging dma-mapping-fixes/for-linus (33dcb37cef74 dma-mapping: fix page att=
ributes for dma_mmap_*)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (d45331b00ddb Linux 5.3-rc4)
Merging samsung-krzk-fixes/fixes (5f9e832c1370 Linus 5.3-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (5f9e832c1370 Linus 5.3-rc1)
Merging devicetree-fixes/dt/linus (83f82d7a4258 of: irq: fix a trivial typo=
 in a doc comment)
Merging scsi-fixes/fixes (7c7cfdcf7f17 scsi: ufs: Fix NULL pointer derefere=
nce in ufshcd_config_vreg_hpm())
Merging drm-fixes/drm-fixes (d1abaeb3be7b Linux 5.3-rc5)
Merging amdgpu-fixes/drm-fixes (e1b4ce25dbc9 drm/scheduler: use job count i=
nstead of peek)
Merging drm-intel-fixes/for-linux-next-fixes (d1abaeb3be7b Linux 5.3-rc5)
Merging mmc-fixes/fixes (b803974a8603 mmc: cavium: Add the missing dma unma=
p when the dma has finished.)
Merging rtc-fixes/rtc-fixes (5f9e832c1370 Linus 5.3-rc1)
Merging gnss-fixes/gnss-linus (f2c7c76c5d0a Linux 5.2-rc3)
Merging hyperv-fixes/hyperv-fixes (bafe1e79e05d MAINTAINERS: Fix Hyperv vIO=
MMU driver file name)
Merging soc-fsl-fixes/fix (5674a92ca4b7 soc/fsl/qe: Fix an error code in qe=
_pin_request())
Merging risc-v-fixes/fixes (69703eb9a8ae riscv: Make __fstate_clean() work =
correctly.)
Merging pidfd-fixes/fixes (d45331b00ddb Linux 5.3-rc4)
Merging fpga-fixes/fixes (dec43da46f63 fpga: altera-ps-spi: Fix getting of =
optional confd gpio)
Merging spdx/spdx-linus (d1abaeb3be7b Linux 5.3-rc5)
Merging gpio-intel-fixes/fixes (5f9e832c1370 Linus 5.3-rc1)
Merging pinctrl-intel-fixes/fixes (5f9e832c1370 Linus 5.3-rc1)
Merging drm-misc-fixes/for-linux-next-fixes (63daf4e16654 drm/omap: ensure =
we have a valid dma_mask)
Merging kspp-gustavo/for-next/kspp (af905189716f dmaengine: fsldma: Mark ex=
pected switch fall-through)
Merging kbuild/for-next (b0907316fd2b kbuild: split final module linking ou=
t into Makefile.modfinal)
Merging compiler-attributes/compiler-attributes (6c4d6bc54864 auxdisplay: F=
ix a typo in cfag12864b-example.c)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (ad3c7b18c5b3 arm: use swiotlb for bounce buff=
ering on LPAE configs)
Merging asm-generic/master (7f3a8dff1219 asm-generic: remove ptrace.h)
Merging arc/for-next (6fbc7275c7a9 Linux 5.2-rc7)
Merging arm/for-next (b7a735f3a606 Merge branch 'for-arm-soc' into for-next)
Merging arm64/for-next/core (436ce61aeb33 Merge branches 'for-next/error-in=
jection', 'for-next/tbi', 'for-next/psci-cpuidle', 'for-next/cpu-topology' =
and 'for-next/52-bit-kva' into for-next/core)
Merging arm-perf/for-next/perf (228f855fb57a perf: Remove dev_err() usage a=
fter platform_get_irq())
Merging arm-soc/for-next (50e5bf56ba2f arm-soc: document merges)
Merging actions/for-next (fb9c1c1deb5e Merge branch 'v4.20/drivers+s900-sps=
' into next)
Merging amlogic/for-next (f2e66ae69e8b Merge branch 'v5.4/drivers' into tmp=
/aml-rebuild)
Merging aspeed/for-next (821569c33633 Merge branch 'dt-for-v5.4' into for-n=
ext)
Merging at91/at91-next (90fbe456b5f0 Merge branch 'at91-dt' into at91-next)
Merging bcm2835/for-next (c165c01bb6f7 Merge branch 'bcm2835-dt-next' into =
for-next)
Merging imx-mxs/for-next (da9e97dce800 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (78145dbeaea1 Merge branch 'for_5.3/driver-soc' into =
next)
Merging mediatek/for-next (73ade6a62931 Merge branch 'v5.1-next/soc' into f=
or-next)
Merging mvebu/for-next (e1b0b32a5ad6 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (29baae1e8b9d Merge branch 'omap-for-v5.4/dt' into fo=
r-next)
Merging qcom/for-next (3a653663d568 Merge branches 'arm64-for-5.4' and 'dri=
vers-for-5.3' into for-next)
Merging renesas/next (45f5d5a9e34d arm64: dts: renesas: r8a77995: draak: Fi=
x backlight regulator name)
Merging renesas-geert/next (926d9def0a14 Merge branches 'renesas-arm-dt-for=
-v5.4', 'renesas-arm64-dt-for-v5.4' and 'renesas-drivers-for-v5.4' into ren=
esas-next)
Merging reset/reset/next (ea651ffd4f7f reset: Add DesignWare IP support to =
simple reset)
Merging rockchip/for-next (6350a4960285 Merge branch 'v5.4-armsoc/dts64' in=
to for-next)
Merging samsung-krzk/for-next (1bccc7798f03 Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (d1abaeb3be7b Linux 5.3-rc5)
Merging sunxi/sunxi/for-next (3f049a94ffce Merge branch 'sunxi/dt-for-5.4' =
into sunxi/for-next)
Merging tegra/for-next (6290ae1fb7e2 Merge branch for-5.4/firmware into for=
-next)
Merging clk/clk-next (92c90f38b17c Merge branch 'clk-unused' into clk-next)
Merging clk-samsung/for-next (a188339ca5a3 Linux 5.2-rc1)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (ada384a7fd2d csky: Optimize arch_sync_dma_for_cpu/=
device with dma_inv_range)
Merging h8300/h8300-next (a5de8865cb3e h8300: move definition of __kernel_s=
ize_t etc. to posix_types.h)
Merging ia64/next (0d3d343560ba genirq: remove the is_affinity_mask_valid h=
ook)
Merging m68k/for-next (49ff824a028a m68k: defconfig: Update defconfigs for =
v5.3-rc2)
Merging m68knommu/for-next (d1abaeb3be7b Linux 5.3-rc5)
Merging microblaze/next (226a893bbb1f microblaze: no need to check return v=
alue of debugfs_create functions)
Merging mips/mips-next (8084499bd7d4 irqchip/irq-ingenic-tcu: Fix COMPILE_T=
EST building)
CONFLICT (content): Merge conflict in arch/mips/include/asm/vdso/vdso.h
CONFLICT (content): Merge conflict in Documentation/index.rst
Merging nds32/next (932296120543 nds32: add new emulations for floating poi=
nt instruction)
Merging nios2/for-next (f017da5c7077 nios2: configs: Remove useless UEVENT_=
HELPER_PATH)
Merging openrisc/for-next (57ce8ba0fd3a openrisc: Fix broken paths to arch/=
or32)
Merging parisc-hd/for-next (a5ff2130a4d9 parisc: speed up flush_tlb_all_loc=
al with qemu)
Merging powerpc/next (2b87a2553aa0 powerpc/64s: Make boot look nice(r))
Merging fsl/next (63d86876f324 Revert "powerpc/fsl_pci: simplify fsl_pci_dm=
a_set_mask")
Merging soc-fsl/next (eadf0b17b43d bus: fsl-mc: remove explicit device_link=
_del)
Merging risc-v/for-next (f51edcec5288 MAINTAINERS: Add an entry for generic=
 architecture topology)
Merging sifive/for-next (467e050e9760 Merge branch 'i2c/for-current' of git=
://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging s390/features (e79333569918 s390/startup: purge obsolete .gitignore=
 patterns)
Merging sh/sh-next (baf58858e8b6 sh: prefer __section from compiler_attribu=
tes.h)
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
Merging xtensa/xtensa-for-next (fa4b55813b1e Merge branch 'xtensa-5.3' into=
 xtensa-for-next)
Merging fscrypt/master (ba13f2c8d7a0 fscrypt: document the new ioctls and p=
olicy version)
Merging afs/afs-next (ac8ca2d9ce2f afs: Support RCU pathwalk)
Merging btrfs/next (29dcea88779c Linux 4.17)
Merging btrfs-kdave/for-next (a668d8d6543c Merge branch 'cleanup/sysfs-refa=
ctoring' into for-next-20190805)
CONFLICT (content): Merge conflict in fs/btrfs/extent-tree.c
CONFLICT (content): Merge conflict in fs/btrfs/ctree.h
Applying: btrfs: merge fix up for "Btrfs: fix sysfs warning and missing rai=
d sysfs directories"
Merging ceph/master (d31d07b97a5e ceph: fix end offset in truncate_inode_pa=
ges_range call)
Merging cifs/for-next (af816b1fac41 cifs: remove redundant assignment to va=
riable rc)
Merging configfs/for-next (f6122ed2a4f9 configfs: Fix use-after-free when a=
ccessing sd->s_dentry)
Merging ecryptfs/next (7451c54abc91 ecryptfs: Change return type of ecryptf=
s_process_flags)
Merging ext3/for_next (56db1991690f udf: prevent allocation beyond UDF part=
ition)
Merging ext4/dev (7a14826ede1d ext4: set error return correctly when ext4_h=
tree_store_dirent fails)
CONFLICT (content): Merge conflict in fs/ext4/ioctl.c
Merging f2fs/dev (3f27158cb511 f2fs: support FS_IOC_{GET,SET}FSLABEL)
Merging fsverity/fsverity (95ae251fe828 f2fs: add fs-verity support)
CONFLICT (content): Merge conflict in fs/f2fs/inode.c
CONFLICT (content): Merge conflict in fs/f2fs/file.c
CONFLICT (content): Merge conflict in fs/ext4/ioctl.c
Merging fuse/for-next (e7d6cd694383 fuse: cleanup fuse_wait_on_page_writeba=
ck)
Merging jfs/jfs-next (a5fdd713d256 jfs: fix bogus variable self-initializat=
ion)
Merging nfs/linux-next (d1abaeb3be7b Linux 5.3-rc5)
Merging nfs-anna/linux-next (68f461593f76 NFS/flexfiles: Use the correct TC=
P timeout for flexfiles I/O)
Merging nfsd/nfsd-next (ed9927533a64 nfsd: Fix the documentation for svcxdr=
_tmpalloc())
Merging orangefs/for-next (e65682b55956 orangefs: eliminate needless variab=
le assignments)
Merging overlayfs/overlayfs-next (0be0bfd2de9d ovl: fix regression caused b=
y overlapping layers detection)
Merging ubifs/linux-next (8009ce956c3d ubifs: Don't leak orphans on memory =
during commit)
Merging v9fs/9p-next (80a316ff1627 9p/xen: Add cleanup path in p9_trans_xen=
_init)
Merging xfs/for-next (5d888b481e6a xfs: fix reflink source file racing with=
 directio writes)
Merging iomap/iomap-for-next (791ee52eb10b iomap: Fix trivial typo)
Merging djw-vfs/vfs-for-next (7e328e5930ad mm/fs: don't allow writes to imm=
utable files)
Merging file-locks/locks-next (df2474a22c42 locks: print a warning when mou=
nt fails due to lack of "mand" support)
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
Merging pci/next (882e5d3f6fe0 Merge branch 'pci/trivial')
Merging pstore/for-next/pstore (609488bc979f Linux 5.3-rc2)
Merging hid/for-next (f5a9f36f8be7 Merge branch 'for-5.3/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (cf254eed8bd5 Merge branch 'i2c/for-5.4' into i2c/=
for-next)
Merging i3c/i3c/next (7afe9a4e5665 i3c: master: fix a memory leak bug)
Merging dmi/master (57361846b52b Linux 4.19-rc2)
Merging hwmon-staging/hwmon-next (c69c9498b789 hwmon: (raspberrypi) update =
MODULE_AUTHOR() email address)
Merging jc_docs/docs-next (4514fe8cd96f Documentation/arm/samsung-s3c24xx: =
Remove stray U+FEFF character to fix title)
CONFLICT (add/add): Merge conflict in Documentation/mips/index.rst
CONFLICT (content): Merge conflict in Documentation/admin-guide/cifs/todo.r=
st
Merging v4l-dvb/master (d4e0f82ac840 media: pixfmt-compressed.rst: improve =
H264/HEVC/MPEG1+2/VP8+9 documentation)
Merging v4l-dvb-next/master (5f9e832c1370 Linus 5.3-rc1)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (82be27a260ab Merge branches 'acpi-apei', 'acpi-proce=
ssor' and 'acpi-tables' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (c7b48823a13f Merge branch 'cpuf=
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
Merging rdma/for-next (77905379e9b2 RDMA/hns: Remove unuseful member)
Merging net-next/master (44b3769b3857 Merge branch 'RTL8125-EEE')
CONFLICT (content): Merge conflict in scripts/link-vmlinux.sh
Merging bpf-next/master (1f7267232711 Merge branch 'bpf-af-xdp-xskmap-impro=
vements')
Merging ipsec-next/master (c7b37c769d2a xfrm: remove get_mtu indirection fr=
om xfrm_type)
Merging mlx5-next/mlx5-next (b1635ee6120c net/mlx5: Add XRQ legacy commands=
 opcodes)
Merging netfilter-next/master (20e79a0a2cfd net: hns: add phy_attached_info=
() to the hns driver)
Merging nfc-next/master (1f008cfec5d5 NFC: fdp: Fix unused variable warning=
s)
CONFLICT (content): Merge conflict in drivers/nfc/st21nfca/se.c
Merging ipvs-next/master (1b0b807dd746 Merge branch 'r8169-fw')
Merging wireless-drivers-next/master (6004cf298a41 b43legacy: Remove pointl=
ess cond_resched() wrapper)
Merging bluetooth/master (cf80618a8402 Bluetooth: hci_qca: Use kfree_skb() =
instead of kfree())
Merging mac80211-next/master (6a7ce95d752e staging/octeon: Fix build error =
without CONFIG_NETDEVICES)
Merging gfs2/for-next (1e5227a3a98b gfs2: Fix possible fs name overflows)
Merging mtd/mtd/next (5f9e832c1370 Linus 5.3-rc1)
Merging nand/nand/next (80107e764846 mtd: rawnand: remove redundant assignm=
ent to variable ret)
Merging spi-nor/spi-nor/next (5fbdac150d48 mtd: spi-nor: fix description fo=
r int (*flash_is_locked)())
Merging crypto/master (198429631a85 crypto: arm64/aegis128 - implement plai=
n NEON version)
Merging drm/drm-next (8120ed5ebd2a Merge branch 'vmwgfx-next' of git://peop=
le.freedesktop.org/~thomash/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_vcn=
.h
Merging amdgpu/drm-next (283791cbb202 drm/amdkfd: Remove GPU ID in GWS queu=
e creation)
CONFLICT (content): Merge conflict in include/uapi/linux/kfd_ioctl.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdkfd/kfd_charde=
v.c
Merging drm-intel/for-linux-next (cc3375607d79 drm/i915: Use 0 for the unor=
dered context)
Merging drm-tegra/drm/tegra/for-next (2a6fc3cb5cb6 drm/tegra: Fix gpiod_get=
_from_of_node() regression)
Merging drm-misc/for-linux-next (96158346b59b drm/i915: Select DMABUF_SELFT=
ESTS for the default i915.ko debug build)
CONFLICT (content): Merge conflict in drivers/gpu/drm/vmwgfx/vmwgfx_resourc=
e.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_vma.c
CONFLICT (modify/delete): drivers/gpu/drm/i915/i915_gem_batch_pool.c delete=
d in HEAD and modified in drm-misc/for-linux-next. Version drm-misc/for-lin=
ux-next of drivers/gpu/drm/i915/i915_gem_batch_pool.c left in tree.
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_exe=
cbuffer.c
$ git rm -f drivers/gpu/drm/i915/i915_gem_batch_pool.c
Applying: drm: fix up fallout from "dma-buf: rename reservation_object to d=
ma_resv"
Merging drm-msm/msm-next (ddc73f32ba95 drm/msm: drop use of drmP.h)
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/msm_atomic.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/disp/dpu1/dpu_pla=
ne.c
Merging hdlcd/for-upstream/hdlcd (d664b851eb2b drm/arm/hdlcd: Reject atomic=
 commits that disable only the plane)
Merging mali-dp/for-upstream/mali-dp (4cf643a39221 Merge tag 'drm-next-5.3-=
2019-06-27' of git://people.freedesktop.org/~agd5f/linux into drm-next)
Merging imx-drm/imx-drm/next (a59957172b0c gpu: ipu-v3: enable remaining 32=
-bit RGB V4L2 pixel formats)
Merging etnaviv/etnaviv/next (088880ddc0b2 drm/etnaviv: implement softpin)
CONFLICT (content): Merge conflict in drivers/gpu/drm/etnaviv/etnaviv_gem_s=
ubmit.c
Merging regmap/for-next (1bd4584626a9 Merge branch 'regmap-5.4' into regmap=
-next)
Merging sound/for-next (7c0a69394c26 ALSA: hda - Define a fallback_pin_fixu=
p_tbl for alc269 family)
Merging sound-asoc/for-next (1eac0c5c55b3 Merge branch 'asoc-5.4' into asoc=
-next)
Merging modules/modules-next (38f054d549a8 modules: always page-align modul=
e section allocations)
Merging input/next (62c3801619e1 Input: cros_ec_keyb - add back missing mas=
k for event_type)
Merging block/for-next (a51c4acca236 Merge branch 'for-5.4/block' into for-=
next)
Merging device-mapper/for-next (bf2a804b36b8 dm dust: use dust block size f=
or badblocklist index)
Merging pcmcia/pcmcia-next (95691e3eddc4 pcmcia: Implement CLKRUN protocol =
disabling for Ricoh bridges)
Merging mmc/next (9637eb6749b9 Merge branch 'fixes' into next)
Merging kgdb/kgdb-next (3bd67b37e350 kdb: print real address of pointers in=
stead of hashed addresses)
CONFLICT (content): Merge conflict in kernel/debug/kdb/kdb_bt.c
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (5cd690a308e8 mfd: asic3: Include the right header)
Merging backlight/for-backlight-next (73fbfc499448 backlight: pwm_bl: Fix h=
euristic to determine number of brightness levels)
Merging battery/for-next (5f9e832c1370 Linus 5.3-rc1)
Merging regulator/for-next (9170108af492 Merge branch 'regulator-5.4' into =
regulator-next)
Merging security/next-testing (0ecfebd2b524 Linux 5.2)
Merging apparmor/apparmor-next (136db994852a apparmor: increase left match =
history buffer size)
Merging integrity/next-integrity (70433f67ec3a MODSIGN: make new include fi=
le self contained)
Merging keys/keys-next (8cf8684e0d24 Merge branch 'keys-acl' into keys-next)
CONFLICT (content): Merge conflict in include/linux/key.h
CONFLICT (modify/delete): fs/crypto/keyinfo.c deleted in HEAD and modified =
in keys/keys-next. Version keys/keys-next of fs/crypto/keyinfo.c left in tr=
ee.
CONFLICT (content): Merge conflict in fs/afs/security.c
$ git rm -f fs/crypto/keyinfo.c
Applying: fsverity: merge fix for keyring_alloc API change
Applying: fscrypt: merge resolution for "keys: Replace uid/gid/perm permiss=
ions checking with an ACL"
Applying: dm verity: merge fix for "keys: Replace uid/gid/perm permissions =
checking with an ACL"
Merging selinux/next (ac5656d8a4cd fanotify, inotify, dnotify, security: ad=
d security hook for fs notifications)
Merging tpmdd/next (d1abaeb3be7b Linux 5.3-rc5)
Merging watchdog/master (194108705c9e watchdog: remove w90x900 driver)
Merging iommu/next (6cd27422a626 Merge branches 'arm/omap', 'arm/exynos', '=
x86/amd' and 'core' into next)
Merging vfio/next (1e4d09d2212d mdev: Send uevents around parent device reg=
istration)
Merging audit/next (5f9e832c1370 Linus 5.3-rc1)
Merging devicetree/for-next (7aa8dd91da63 devicetree: Expose dtbs_check and=
 dt_binding_check some more)
CONFLICT (add/add): Merge conflict in Documentation/devicetree/writing-sche=
ma.rst
Merging mailbox/mailbox-for-next (25777e5784a7 mailbox: handle failed named=
 mailbox channel request)
Merging spi/for-next (f27df9226672 Merge branch 'spi-5.4' into spi-next)
Merging tip/auto-latest (2230b8443ae0 Merge branch 'efi/core')
CONFLICT (content): Merge conflict in arch/ia64/include/asm/sn/sn_sal.h
Merging clockevents/clockevents/next (012bb0283514 clocksource/drivers/rene=
sas-ostm: Use DIV_ROUND_CLOSEST() helper)
Merging edac/edac-for-next (718d58514ebc EDAC/mc: Cleanup _edac_mc_free() c=
ode)
Merging irqchip/irq/irqchip-next (3dae67ce600c irqchip/gic-pm: Remove PM_CL=
K dependency)
Merging ftrace/for-next (6d54ceb539aa tracing: Fix user stack trace "??" ou=
tput)
Merging rcu/rcu/next (07f038a408fb Merge LKMM and RCU commits)
Merging kvm/linux-next (a738b5e75b4c Merge tag 'kvmarm-fixes-for-5.3-2' of =
git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvm-arm/next (07ab0f8d9a12 KVM: Call kvm_arch_vcpu_blocking early i=
nto the blocking sequence)
Merging kvm-ppc/kvm-ppc-next (3bda7f0ae0f7 KVM: PPC: Book3S PR: Fix softwar=
e breakpoints)
Merging kvms390/next (a049a377164c KVM: selftests: Enable dirty_log_test on=
 s390x)
Merging xen-tip/linux-next (b877ac9815a8 xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging percpu/for-next (03ed70fb0e5e Merge branch 'for-5.3' into for-next)
Merging workqueues/for-next (be69d00d9769 workqueue: Remove GPF argument fr=
om alloc_workqueue_attrs())
Merging drivers-x86/for-next (109e8adfbc66 platform/x86: asus-wmi: Remove u=
nnecessary blank lines)
Merging chrome-platform/for-next (5f9e832c1370 Linus 5.3-rc1)
Merging hsi/for-next (c1030cd45619 HSI: Remove dev_err() usage after platfo=
rm_get_irq())
Merging leds/for-next (3881a72f8d06 leds: pca953x: Include the right header)
Merging ipmi/for-next (2033f6858970 ipmi: Free receive messages when in an =
oops)
Merging driver-core/driver-core-next (2a77eec0d3ca devcoredump: fix typo in=
 comment)
CONFLICT (content): Merge conflict in drivers/base/power/runtime.c
Merging usb/usb-next (7ffc95e90e30 Merge 5.3-rc5 into usb-next)
CONFLICT (content): Merge conflict in drivers/staging/Makefile
CONFLICT (content): Merge conflict in drivers/staging/Kconfig
Merging usb-gadget/next (b2357839c56a usb: renesas_usbhs: add a workaround =
for a race condition of workqueue)
Merging usb-serial/usb-next (e21a712a9685 Linux 5.3-rc3)
Merging usb-chipidea-next/ci-for-usb-next (034252e37b31 usb: chipidea: msm:=
 Use devm_platform_ioremap_resource())
Merging phy-next/next (609488bc979f Linux 5.3-rc2)
Merging tty/tty-next (591f935db448 serial: mxs-auart: Don't check for mctrl=
_gpio_to_gpiod() returning error)
Merging char-misc/char-misc-next (e70c971d7d8a Merge 5.3-rc5 into char-misc=
-next)
Merging extcon/extcon-next (a3fc57233977 extcon: adc-jack: Remove dev_err()=
 usage after platform_get_irq())
Merging soundwire/next (15ed3ea2280e soundwire: bus: split handling of Devi=
ce0 events)
Merging thunderbolt/next (04f7745300ed thunderbolt: Show key using %*pE not=
 %*pEp)
Merging staging/staging-next (c6d6832ce398 Merge 5.3-rc5 into staging-next)
Merging mux/for-next (05fb8284a417 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (dcc31687b8b9 interconnect: qcom: remove COMPILE_TEST =
from CONFIG_INTERCONNECT_QCOM_QCS404)
Merging slave-dma/next (7607a121f461 dmaengine: fsldma: Mark expected switc=
h fall-through)
Merging cgroup/for-next (653a23ca7e1e Use kvmalloc in cgroups-v1)
Merging scsi/for-next (182747f87687 Merge branch 'misc' into for-next)
CONFLICT (content): Merge conflict in drivers/scsi/qla2xxx/qla_os.c
Merging scsi-mkp/for-next (c54591a3c8b8 Merge branch '5.4/scsi-queue' into =
5.4/scsi-next)
Merging vhost/linux-next (73f628ec9e6b vhost: disable metadata prefetch opt=
imization)
Merging rpmsg/for-next (7f1345e9efcc Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (984078b26420 Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (f2ee73147a3f gpio: lpc32xx: allow building=
 on non-lpc32xx targets)
CONFLICT (content): Merge conflict in include/linux/gpio/driver.h
Merging gpio-intel/for-next (a7db285664dd gpio: pch: Use dev_get_drvdata)
Merging pinctrl/for-next (dcd12a00f45f Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (6cb0880f0822 pinctrl: intel: remap the pin =
number to gpio offset for irq enabled pin)
Merging pinctrl-samsung/for-next (10971e2ab6eb pinctrl: samsung: Fix device=
 node refcount leaks in init code)
Merging pwm/for-next (6cf9481b440d pwm: Fallback to the static lookup-list =
when acpi_pwm_get fails)
Merging userns/for-next (318759b4737c signal/x86: Move tsk inside of CONFIG=
_MEMORY_FAILURE in do_sigbus)
Merging ktest/for-next (aecea57f84b0 ktest: Fix some typos in config-bisect=
.pl)
Merging random/dev (58be0106c530 random: fix soft lockup when trying to rea=
d from an uninitialized blocking pool)
Merging kselftest/next (0ac33e4e9b5e selftests: use "$(MAKE)" instead of "m=
ake")
Merging y2038/y2038 (a2318b6a16a8 riscv: Use latest system call ABI)
CONFLICT (content): Merge conflict in arch/riscv/include/uapi/asm/unistd.h
Merging livepatching/for-next (1cfe141e1715 Merge branch 'for-5.4-core' int=
o for-next)
Merging coresight/next (a7a03a695648 coresight: tmc-etr: Fix updating buffe=
r in not-snapshot mode.)
Merging rtc/rtc-next (b0a3fa44659c rtc: mxc: use spin_lock_irqsave instead =
of spin_lock_irq in IRQ context)
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
Merging nvmem/for-next (8555b95dbd8b nvmem: imx: add i.MX8QM platform suppo=
rt)
Merging xarray/xarray (91abab83839a XArray: Fix xas_next() with a single en=
try at 0)
Merging hyperv/hyperv-next (221f6df008ab hv_balloon: Reorganize the probe f=
unction)
Merging auxdisplay/auxdisplay (30f48c108abe auxdisplay: ht16k33: Make ht16k=
33_fb_fix and ht16k33_fb_var constant)
Merging kgdb-dt/kgdb/for-next (ca976bfb3154 kdb: Fix bound check compiler w=
arning)
Merging pidfd/for-next (590ef0128b42 waitid: Add support for waiting for th=
e current process group)
Merging devfreq/for-next (26f9b841c455 PM / devfreq: tegra20: add COMMON_CL=
K dependency)
Merging hmm/hmm (3dc05ddf9aaa mm/mmu_notifiers: check if mmu notifier callb=
acks are allowed to fail)
Merging fpga/for-next (7d62460b4060 MAINTAINERS: Move linux-fpga tree to ne=
w location)
Merging akpm-current/current (e25aee40a9ef ipc/msg.c: consolidate all xxxct=
l_down() functions)
CONFLICT (content): Merge conflict in arch/arm64/include/asm/processor.h
$ git checkout -b akpm remotes/origin/akpm/master
Applying: pinctrl: fix pxa2xx.c build warnings
Applying: lib: untag user pointers in strn*_user
Applying: mm: untag user pointers passed to memory syscalls
Applying: mm: untag user pointers in mm/gup.c
Applying: mm: untag user pointers in get_vaddr_frames
Applying: fs/namespace: untag user pointers in copy_mount_options
Applying: userfaultfd: untag user pointers
Applying: drm/amdgpu: untag user pointers
Applying: drm/radeon: untag user pointers in radeon_gem_userptr_ioctl
Applying: media/v4l2-core: untag user pointers in videobuf_dma_contig_user_=
get
Applying: tee/shm: untag user pointers in tee_shm_register
Applying: vfio/type1: untag user pointers in vaddr_get_pfn
Applying: mm: treewide: clarify pgtable_page_{ctor,dtor}() naming
Applying: drivers/tty/serial/sh-sci.c: suppress warning
Applying: drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer ove=
rflow
Merging akpm/master (c0092990167e drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/rmWtZmTsJz_+0=dD3xECl/A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1bnMMACgkQAVBC80lX
0GyxvggAmeS77NP/UIFwN+D3yGVaM8nMRTVIsZLfzf4rxsQbR2N8FzY1IqGUEYN8
tWHIfzGFeshQHTxhF4nvY5INif+08vV1/y9rcnRvLa6GFbr3t46ZaW2Zi0n+ffV3
ogY9yy+95sTncgbfoUQfHAANqYce9GsphxzDAj5liP/iQ/rrN+uCAkjJ+S0CYpsw
rIzFskf3bbd4k3N8fSLQTKTTU/jHiuyWS8K6O7GFM1ECpfo1EvA2k8HdCNcBCOev
pfakEvVQkI9vd75Zw9TCeQdmYyGAw4O3RPbXtSNBznbk4gfS9nwaYPa/c+N0MqN5
DlH7d2HXHugot6iw3aCVxmWm8TEwVQ==
=GMFy
-----END PGP SIGNATURE-----

--Sig_/rmWtZmTsJz_+0=dD3xECl/A--
