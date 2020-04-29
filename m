Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E847A1BD758
	for <lists+linux-next@lfdr.de>; Wed, 29 Apr 2020 10:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgD2Idl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Apr 2020 04:33:41 -0400
Received: from ozlabs.org ([203.11.71.1]:38791 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726345AbgD2Idk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Apr 2020 04:33:40 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49BsH216W6z9sSq;
        Wed, 29 Apr 2020 18:33:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588149214;
        bh=TVC3rLCfDW6AU3XjB9W1r8vvdiU//uBzUsB26VZzDOY=;
        h=Date:From:To:Cc:Subject:From;
        b=WtynuitnMymKqqVJJ96UC1AbDibHmIACXkWQiwcRxna6pR9rL+Qjiz4Wnm1AeDJ3b
         R85qcc4+oDROPS8VfR4G9J+en3C4yoPjJmb6VzClfZn/Gdb6L+z62uR/+Xe4vkzWGS
         iq3GJz9F5UbV8lFNpxYW3kHxk240Tbr864rtr/d6zq1jHXXejF72gIwSWSp2JDDcyV
         rOCslHsdMQZx4UcjIjZkqKYx7TI8ZE8/W4kvtR/r22qJz7vyCI81jtXiDpSaA+1uUL
         gkb4Cza7ffGtkyfoCiE9KfSl3XcnJYgNhYpwTXpeaDJSitmq+IFnZ6KIWexs5r3p84
         L3aT5H87ZZoAQ==
Date:   Wed, 29 Apr 2020 18:33:32 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 29
Message-ID: <20200429183332.69155dfd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iD8SxflLWy2mJKuYahKT0wT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/iD8SxflLWy2mJKuYahKT0wT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20200428:

The qcom tree still had its build failure for which I reverted a commit.

The hwmon-staging tree lost its build failure.

The jc_docs tree gained a conflict against the arm64 tree.

The mlx5-next tree gained a conflict against the kspp-gustavo tree.

The mac80211-next tree still has its build failure so I used the version
from next-20200424.

The drm-misc tree still had its build failure for which I disabled a
COMPILE_TEST setting.

The akpm-current tree gained conflicts against the arm64 and bpf-next
trees.

Non-merge commits (relative to Linus' tree): 4722
 5738 files changed, 159224 insertions(+), 68039 deletions(-)

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
Merging origin/master (96c9a7802af7 Merge branch 'fixes' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/viro/vfs)
Merging fixes/master (8f3d9f354286 Linux 5.7-rc1)
Merging kbuild-current/fixes (ab51cac00ef2 Merge git://git.kernel.org/pub/s=
cm/linux/kernel/git/netdev/net)
Merging arc-current/for-curr (799587d5731d ARC: [plat-eznps]: Restrict to C=
ONFIG_ISA_ARCOMPACT)
Merging arm-current/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging arm-soc-fixes/arm/fixes (f42ae4cd4cae Merge tag 'arm-soc/for-5.7/de=
vicetree-fixes' of https://github.com/Broadcom/stblinux into arm/fixes)
Merging arm64-fixes/for-next/fixes (59bff30ad6ce Documentation: arm64: fix =
amu.rst doc warnings)
Merging m68k-current/for-linus (86cded5fc525 m68k: defconfig: Update defcon=
figs for v5.6-rc4)
Merging powerpc-fixes/fixes (5990cdee689c lib/mpi: Fix building for powerpc=
 with clang)
Merging s390-fixes/fixes (6a8b55ed4056 Linux 5.7-rc3)
Merging sparc/master (63bef48fd6c9 Merge branch 'akpm' (patches from Andrew=
))
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (8999dc89497a net/x25: Fix null-ptr-deref in x25_disconn=
ect)
Merging bpf/master (18f02ad19e2c bpf: Fix sk_psock refcnt leak when receivi=
ng message)
Merging ipsec/master (c95c5f58b35e xfrm interface: fix oops when deleting a=
 x-netns interface)
Merging netfilter/master (ea64d8d6c675 netfilter: nat: never update the UDP=
 checksum when it's 0)
Merging ipvs/master (0141317611ab Merge branch 'hns3-fixes')
Merging wireless-drivers/master (10e41f34a019 MAINTAINERS: update mt76 revi=
ewers)
Merging mac80211/master (4a3de90b1184 mac80211: sta_info: Add lockdep condi=
tion for RCU list usage)
Merging rdma-fixes/for-rc (f0abc761bbb9 RDMA/core: Fix race between destroy=
 and release FD object)
Merging sound-current/for-linus (ca76282b6faf ALSA: hda/hdmi: fix race in m=
onitor detection during probe)
Merging sound-asoc-fixes/for-linus (e3cb262edb0e Merge remote-tracking bran=
ch 'asoc/for-5.7' into asoc-linus)
Merging regmap-fixes/for-linus (cef570d20922 Merge remote-tracking branch '=
regmap/for-5.7' into regmap-linus)
Merging regulator-fixes/for-linus (324fa65431d4 Merge remote-tracking branc=
h 'regulator/for-5.7' into regulator-linus)
Merging spi-fixes/for-linus (7dbbc19c69b2 Merge remote-tracking branch 'spi=
/for-5.7' into spi-linus)
Merging pci-current/for-linus (ef46738cc47a MAINTAINERS: Add Rob Herring an=
d remove Andy Murray as PCI reviewers)
Merging driver-core.current/driver-core-linus (35a672363ab3 driver core: En=
sure wait_for_device_probe() waits until the deferred_probe_timeout fires)
Merging tty.current/tty-linus (6a8b55ed4056 Linux 5.7-rc3)
Merging usb.current/usb-linus (c3bf9930921b thunderbolt: Check return value=
 of tb_sw_read() in usb4_switch_op())
Merging usb-gadget-fixes/fixes (a7b778357ca4 usb: raw-gadget: Fix copy_to/f=
rom_user() checks)
Merging usb-serial-fixes/usb-linus (e9b3c610a05c USB: serial: garmin_gps: a=
dd sanity checking for data length)
Merging usb-chipidea-fixes/ci-for-usb-stable (7cbf3dd3139a usb: chipidea: u=
dc: fix sleeping function called from invalid context)
Merging phy/fixes (711a01806cf3 phy: qualcomm: usb-hs-28nm: Prepare clocks =
in init)
Merging staging.current/staging-linus (6a8b55ed4056 Linux 5.7-rc3)
Merging char-misc.current/char-misc-linus (5e56bc06e18d most: core: use fun=
ction subsys_initcall())
Merging soundwire-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging thunderbolt-fixes/fixes (9d2214b14103 thunderbolt: Check return val=
ue of tb_sw_read() in usb4_switch_op())
Merging input-current/for-linus (d5a5e5b5fa7b Input: synaptics-rmi4 - reall=
y fix attn_data use-after-free)
Merging crypto-current/master (55b3209acbb0 crypto: caam - fix the address =
of the last entry of S/G)
Merging ide/master (63bef48fd6c9 Merge branch 'akpm' (patches from Andrew))
Merging vfio-fixes/for-linus (5cbf3264bc71 vfio/type1: Fix VA->PA translati=
on for PFNMAP VMAs in vaddr_get_pfn())
Merging kselftest-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging slave-dma-fixes/fixes (aa72f1d20ee9 dmaengine: dmatest: Fix process=
 hang when reading 'wait' parameter)
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
Merging btrfs-fixes/next-fixes (e661c25df0ca Merge branch 'misc-5.7' into n=
ext-fixes)
Merging vfs-fixes/fixes (b0d3869ce9ee propagate_one(): mnt_set_mountpoint()=
 needs mount_lock)
Merging dma-mapping-fixes/for-linus (9c24eaf81cc4 iommu/vt-d: Return the co=
rrect dma mask when we are bypassing the IOMMU)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (f585c9d5436a platform/x86/intel-uncore-fre=
q: make uncore_root_kobj static)
Merging samsung-krzk-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (8f3d9f354286 Linux 5.7-rc1)
Merging devicetree-fixes/dt/linus (4bc77b2d211e dt-bindings: phy: qcom-qusb=
2: Fix defaults)
Merging scsi-fixes/fixes (5b77d181bee1 scsi: ibmvscsi: Fix WARN_ON during e=
vent pool release)
Merging drm-fixes/drm-fixes (e32b2484b3e0 Merge tag 'drm-misc-fixes-2020-04=
-23' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (2abaad4eb59d drm/i915/gt: Che=
ck cacheline is valid before acquiring)
Merging mmc-fixes/fixes (1a8eb6b373c2 mmc: sdhci-pci: Fix eMMC driver stren=
gth for BYT-based controllers)
Merging rtc-fixes/rtc-fixes (8f3d9f354286 Linux 5.7-rc1)
Merging gnss-fixes/gnss-linus (ae83d0b416db Linux 5.7-rc2)
Merging hyperv-fixes/hyperv-fixes (f081bbb3fd03 hyper-v: Remove internal ty=
pes from UAPI header)
Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq h=
andlers after dpio create)
Merging risc-v-fixes/fixes (a5fe13c7b494 riscv: select ARCH_HAS_STRICT_KERN=
EL_RWX only if MMU)
Merging pidfd-fixes/fixes (a966dcfe153a clone3: add build-time CLONE_ARGS_S=
IZE_VER* validity checks)
Merging fpga-fixes/fixes (3c2760b78f90 fpga: dfl: pci: fix return value of =
cci_pci_sriov_configure)
Merging spdx/spdx-linus (6a8b55ed4056 Linux 5.7-rc3)
Merging gpio-intel-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging pinctrl-intel-fixes/fixes (69388e15f507 pinctrl: cherryview: Add mi=
ssing spinlock usage in chv_gpio_irq_handler)
Merging erofs-fixes/fixes (d1eef1c61974 Linux 5.5-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (a65aa9c3676f drm/qxl: qxl_rele=
ase leak in qxl_hw_surface_alloc())
Merging kspp-gustavo/for-next/kspp (c298f72a534d uapi: revert flexible-arra=
y conversions)
Merging kbuild/for-next (b032227c6293 Merge tag 'nios2-v5.7-rc1' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/lftan/nios2)
Merging compiler-attributes/compiler-attributes (98d54f81e36b Linux 5.6-rc4)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (298f3db6ee69 dma-contiguous: fix comment for =
dma_release_from_contiguous)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (365a6327cd64 ARM: 8968/1: decompressor: simplify libf=
dt builds)
Merging arm64/for-next/core (8a030a72e276 Merge branches 'for-next/cpufeatu=
re', 'for-next/docs', 'for-next/misc' and 'for-next/ptr-auth' into for-next=
/core)
Merging arm-perf/for-next/perf (8f3d9f354286 Linux 5.7-rc1)
Merging arm-soc/for-next (f42ae4cd4cae Merge tag 'arm-soc/for-5.7/devicetre=
e-fixes' of https://github.com/Broadcom/stblinux into arm/fixes)
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
Merging qcom/for-next (2346b073fc16 Merge branches 'arm64-defconfig-for-5.8=
', 'arm64-for-5.8', 'drivers-for-5.8' and 'dts-for-5.8' into for-next)
Applying: Revert "soc: qcom: rpmh: Allow RPMH driver to be loaded as a modu=
le"
Merging raspberrypi/for-next (f5e216e42689 ARM: dts: bcm283x: Use firmware =
PM driver for V3D)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (00f21412f244 Merge branches 'renesas-arm-soc-for-v5.8=
', 'renesas-drivers-for-v5.8' and 'renesas-dt-bindings-for-v5.8' into renes=
as-next)
Merging reset/reset/next (2ebf89fd4ecf reset: hi6220: Add support for AO re=
set controller)
Merging rockchip/for-next (68c391e9f66b Merge branch 'v5.7-clk/fixes' into =
for-next)
Merging samsung-krzk/for-next (fcd1f4184e18 Merge branch 'next/soc' into fo=
r-next)
Merging scmi/for-linux-next (a8e5f6d8ecfe Merge branch 'for-next/scmi' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging sunxi/sunxi/for-next (8c42b100c050 Merge branches 'sunxi/clk-for-5.=
8', 'sunxi/config-for-5.8' and 'sunxi/dt-for-5.8' into sunxi/for-next)
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
Merging m68k/for-next (366b8149fbff m68k: amiga: config: Replace zero-lengt=
h array with flexible-array member)
Merging m68knommu/for-next (012d1de88776 m68k/PCI: Fix a memory leak in an =
error handling path)
Merging microblaze/next (8f3d9f354286 Linux 5.7-rc1)
Merging mips/mips-next (8c88cc53ffa6 MIPS: Loongson: Get host bridge inform=
ation)
Merging nds32/next (d785c5a324cd nds32: configs: Cleanup CONFIG_CROSS_COMPI=
LE)
Merging nios2/for-next (0ec8a5054d7f MAINTAINERS: Remove nios2-dev@lists.ro=
cketboards.org)
Merging openrisc/for-next (9737e2c5f0bc openrisc: Remove obsolete show_trac=
e_task function)
Merging parisc-hd/for-next (7111951b8d49 Linux 5.6)
Merging powerpc/next (45591da76588 powerpc/vas: Include linux/types.h in ua=
pi/asm/vas-api.h)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (461c3ac0dc46 soc: fsl: qe: fix sparse warnings for uc=
c_slow.c)
Merging risc-v/for-next (521727bec495 riscv: Use text_mutex instead of patc=
h_lock)
Merging sifive/for-next (467e050e9760 Merge branch 'i2c/for-current' of git=
://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging s390/features (19d4c761c1d2 s390/qdio: remove always-true condition)
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
Merging btrfs/for-next (2a716ced1526 Merge branch 'for-next-current-v5.6-20=
200423' into for-next-20200423)
CONFLICT (content): Merge conflict in fs/btrfs/block-group.c
Merging ceph/master (2a575f138d00 ceph: fix potential bad pointer deref in =
async dirops cb's)
Merging cifs/for-next (6a8b55ed4056 Linux 5.7-rc3)
Merging configfs/for-next (8aebfffacfa3 configfs: fix config_item refcnt le=
ak in configfs_rmdir())
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (8f3d9f354286 Linux 5.7-rc1)
Merging exfat/dev (33cdfbe37703 exfat: replace 'time_ms' with 'time_cs')
Merging ext3/for_next (a32f0ecd79b4 Merge fanotify fix from Nathan Chancell=
or.)
Merging ext4/dev (907ea529fc4c ext4: convert BUG_ON's to WARN_ON's in mball=
oc.c)
Merging f2fs/dev (435cbab95e39 f2fs: fix quota_sync failure due to f2fs_loc=
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
Merging overlayfs/overlayfs-next (23f65779dcf8 ovl: whiteout inode sharing)
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
Merging pci/next (cb4b34e11454 Merge branch 'pci/pm')
Merging pstore/for-next/pstore (8f3d9f354286 Linux 5.7-rc1)
Merging hid/for-next (ce01b5b5386f Merge branch 'for-5.8/mcp2221' into for-=
next)
Merging i2c/i2c/for-next (d92067dace29 Merge branch 'i2c/for-current-fixed'=
 into i2c/for-next)
Merging i3c/i3c/next (b4203ce05563 i3c master: GETMRL's 3rd byte is optiona=
l even with BCR_IBI_PAYLOAD)
Merging dmi/master (8cf87c744696 firmware/dmi: Report DMI Bios & EC firmwar=
e release)
Merging hwmon-staging/hwmon-next (65b7e54c6adb hwmon: (lm70) Add support fo=
r ACPI)
Merging jc_docs/docs-next (ec43a27fffd0 scripts: sphinx-pre-install: change=
 the output order)
CONFLICT (content): Merge conflict in Documentation/arm64/booting.rst
CONFLICT (content): Merge conflict in Documentation/arm64/amu.rst
Merging v4l-dvb/master (4e5552b23f9f media: Kconfig: fix some dvb-usb-v2 de=
pendencies)
Merging v4l-dvb-next/master (54ecb8f7028c Linux 5.4-rc1)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (d38f9bc9261a Merge branch 'pm-acpi' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (7c2553f0db61 cpufreq: imx-cpufr=
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
Merging rdma/for-next (a97bf49f824e RDMA/hns: Simplify the status judgment =
code of hns_roce_v1_m_qp())
Merging net-next/master (790ab249b55d net: ethernet: fec: Prevent MII event=
 after MII_SPEED write)
Merging bpf-next/master (3271e8f3f63d Merge branch 'BTF-map-in-map')
Merging ipsec-next/master (e62905ae34ea xfrm interface: don't take extra re=
ference to netdev)
Merging mlx5-next/mlx5-next (2dc8b5246d2c net/mlx5: TX WQE Add trailer inse=
rtion field)
CONFLICT (content): Merge conflict in include/linux/mlx5/mlx5_ifc.h
Merging netfilter-next/master (74f99482eae0 netfilter: nf_conntrack: add IP=
S_HW_OFFLOAD status bit)
Merging ipvs-next/master (d54725cd11a5 netfilter: nf_tables: support for mu=
ltiple devices per netdev hook)
Merging wireless-drivers-next/master (86501437d885 ssb: scan: fix block com=
ments coding style issues)
Merging bluetooth/master (f794edc99901 Bluetooth: hci_h5: Add support for b=
inding RTL8723BS with device tree)
Merging mac80211-next/master (b6b5c42e3bab mac80211: fix two missing docume=
ntation entries)
$ git reset --hard HEAD^
Merging next-20200424 version of mac80211-next
Merging gfs2/for-next (197694d09af5 docs: filesystems: convert gfs2-glocks.=
txt to ReST)
Merging mtd/mtd/next (025a06c1104c mtd: Convert fallthrough comments into s=
tatements)
Merging nand/nand/next (fca88925d769 mtd: rawnand: toshiba: Support reading=
 the number of bitflips for BENAND (Built-in ECC NAND))
Merging spi-nor/spi-nor/next (9f09e37d1544 mtd: spi-nor: macronix: Add supp=
ort for mx25u51245g)
Merging crypto/master (9c3d6497fbfa crypto: bcm - Delete redundant variable=
 definition)
Merging drm/drm-next (1aa63ddf726e Merge tag 'drm-misc-next-2020-04-14' of =
git://anongit.freedesktop.org/drm/drm-misc into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/tidss/tidss_encoder.c
Merging amdgpu/drm-next (d2995eb57efa drm/amdgpu: re-enable runtime pm on v=
ega10)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/powerplay/renoir_=
ppt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ras=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_dev=
ice.c
Merging drm-intel/for-linux-next (f6a7c21c9910 drm/i915/execlists: Verify w=
e don't submit two identical CCIDs)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dd=
i.c
Merging drm-tegra/drm/tegra/for-next (757338371608 drm/tegra: Clean up GPIO=
 includes)
Merging drm-misc/for-linux-next (826fc86b5903 drm: pl111: Move VExpress set=
up into versatile init)
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
Merging regmap/for-next (6c9147d991fb Merge remote-tracking branch 'regmap/=
for-5.8' into regmap-next)
Merging sound/for-next (5b6cc38f3f3f ALSA: usb-audio: Fix racy list managem=
ent in output queue)
Merging sound-asoc/for-next (63dfe5f270fb Merge remote-tracking branch 'aso=
c/for-5.8' into asoc-next)
Merging modules/modules-next (5c3a7db0c7ec module: Harden STRICT_MODULE_RWX)
Merging input/next (9d17ad2369dc Input: atkbd - receive and use physcode->k=
eycode mapping from FW)
Merging block/for-next (a69e61051a50 Merge branch 'for-5.8/block' into for-=
next)
Merging device-mapper/for-next (24a1782a807c dm bufio: implement discard)
Merging pcmcia/pcmcia-next (a8c122f72d94 pcmcia: remove some unused space c=
haracters)
Merging mmc/next (fa6f23de36b7 mmc: sdhci-pci-o2micro: Make some symbols st=
atic)
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (d2923aa45356 mfd: intel-lpss: Fix Intel Elkhart L=
ake LPSS I2C input clock)
Merging backlight/for-backlight-next (ee0c8e494cc3 backlight: corgi: Conver=
t to use GPIO descriptors)
Merging battery/for-next (aa86e90794c8 power: supply: axp288_charger: Omit =
superfluous error message)
Merging regulator/for-next (79d6cf2fc937 Merge remote-tracking branch 'regu=
lator/for-5.8' into regulator-next)
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
Merging audit/next (a45d88530b25 netfilter: add audit table unregister acti=
ons)
Merging devicetree/for-next (7456427af9de of: property: Do not link to disa=
bled devices)
Merging mailbox/mailbox-for-next (0a67003b1985 mailbox: imx: add SCU MU sup=
port)
Merging spi/for-next (b1405ae67d9e Merge remote-tracking branch 'spi/for-5.=
8' into spi-next)
Merging tip/auto-latest (cf14a924b8f6 Merge branch 'core/core')
Merging clockevents/timers/drivers/next (c1ac28a4de6f Revert "clocksource: =
Avoid creating dead devices")
Merging edac/edac-for-next (dc63e28efa19 Merge branch 'edac-i10nm' into eda=
c-for-next)
Merging irqchip/irq/irqchip-next (4cea749d56be Revert "irqchip/xilinx: Enab=
le generic irq multi handler")
Merging ftrace/for-next (d013496f99c5 tracing: Convert local functions in t=
racing_map.c to static)
Merging rcu/rcu/next (75080313dccc torture:  Remove qemu dependency on EFI =
firmware)
Merging kvm/linux-next (7c67f54661fc KVM: SVM: do not allow VMRUN inside SM=
M)
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
Merging drivers-x86/for-next (14232c6e788c platform/x86: thinkpad_acpi: Add=
 support for dual fan control)
Merging chrome-platform/for-next (9d33ea331032 platform/chrome: cros_ec_typ=
ec: Register port partner)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (c85c7cdef3c9 leds: trigger: remove redundant assignm=
ent to variable ret)
Merging ipmi/for-next (900b217c7c8e ipmi: Replace guid_copy() with import_g=
uid() where it makes sense)
Merging driver-core/driver-core-next (96fa72ffb215 Merge 5.7-rc3 into drive=
r-core-next)
Merging usb/usb-next (1417cff96ef8 usb: typec: ucsi: Fix the stub for ucsi_=
register_port_psy())
Merging usb-gadget/next (4a5dbd900957 dt-bindings: usb: add documentation f=
or aspeed usb-vhub)
Merging usb-serial/usb-next (788a4ee607e8 USB: serial: Use the correct styl=
e for SPDX License Identifier)
Merging usb-chipidea-next/ci-for-usb-next (4ee2fc81a631 usb: chipidea: usb2=
: remove unneeded semicolon)
Merging phy-next/next (2f29298bc2d9 phy: qcom: qmp: Add SM8250 UFS PHY)
Merging tty/tty-next (e947861d0ccb Merge 5.7-rc3 into tty-next)
Merging char-misc/char-misc-next (48a4cc950348 Merge 5.7-rc3 into char-misc=
-next)
Merging extcon/extcon-next (108339e7a4fe extcon: remove redundant assignmen=
t to variable idx)
Merging soundwire/next (2978a43e7690 soundwire: intel: Make sdw_intel_init =
static)
Merging thunderbolt/next (57d8df68eb53 thunderbolt: Add support for Intel T=
iger Lake)
Merging staging/staging-next (e8014d83f604 Merge 5.7-rc3 into staging-next)
Merging mux/for-next (f356d58c3a04 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (8f3d9f354286 Linux 5.7-rc1)
Merging slave-dma/next (5332f8b1d9dd dmaengine: dmatest: Describe members o=
f struct dmatest_info)
Merging cgroup/for-next (eec8fd0277e3 device_cgroup: Cleanup cgroup eBPF de=
vice filter code)
Merging scsi/for-next (78fb6bd02578 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (ea941016abf7 scsi: core: doc: Change function co=
mments to kernel-doc style)
Merging vhost/linux-next (4ce332bb5eb3 vhost: revert "vhost: disable for OA=
BI")
Merging rpmsg/for-next (914a0df49382 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (9f676e5313c1 gpio: mlxbf2: remove unused including <=
linux/version.h>)
Merging gpio-brgl/gpio/for-next (9784c9963fec gpiolib: devprop: Warn if gpi=
o-line-names is too long)
Merging gpio-intel/for-next (7e73aa90a38c gpio: merrifield: Better show how=
 GPIO and IRQ bases are derived from hardware)
Merging pinctrl/for-next (987a527ed69d Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (6d649fca3491 pinctrl: intel: Move npins clo=
ser to pin_base in struct intel_community)
Merging pinctrl-samsung/for-next (f354157a7d18 pinctrl: samsung: Save/resto=
re eint_mask over suspend for EINT_TYPE GPIOs)
Merging pwm/for-next (6f0841a8197b pwm: Add support for Azoteq IQS620A PWM =
generator)
Merging userns/for-next (507122805edd proc: Ensure we see the exit of each =
process tid exactly)
Merging ktest/for-next (1091c8fce8aa ktest: Fix typos in ktest.pl)
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (f0c0d0cf590f selftests/ftrace: Check the first reco=
rd for kprobe_args_type.tc)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (d28b4c1b2b3d Merge branch 'for-5.6/selftests=
' into for-next)
Merging coresight/next (62eb0c79662c coresight: Initialize arg in sparse fr=
iendly way)
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
Merging nvmem/for-next (da50b72c0822 nvmem: ensure sysfs writes handle writ=
e-protect pin)
Merging xarray/xarray (27586ca786a7 XArray: Handle retry entries within xas=
_find_marked)
Merging hyperv/hyperv-next (df474842683c hyper-v: Switch to use UUID types =
directly)
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
Merging kunit-next/kunit (6cb181879881 kunit: Add missing newline in summar=
y message)
Merging trivial/for-next (fad7c9020948 err.h: remove deprecated PTR_RET for=
 good)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (8f3d9f354286 Linux 5.7-rc1)
Merging akpm-current/current (2b5030a63ffd ipc-convert-ipcs_idr-to-xarray-u=
pdate)
CONFLICT (content): Merge conflict in kernel/sysctl.c
CONFLICT (content): Merge conflict in include/linux/printk.h
CONFLICT (content): Merge conflict in arch/x86/Kconfig.debug
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
CONFLICT (content): Merge conflict in arch/arm64/include/asm/pgtable.h
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (948880d074e0 mm: fix s390 compat build error)

--Sig_/iD8SxflLWy2mJKuYahKT0wT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6pO9wACgkQAVBC80lX
0GwJIQf/aoI8pQvY7AyiYoTqSkTESAT4RDd0MceUpWXTY4taCmfgNcLRSQMnBOtH
0sR+o91mAmLgu4rl6NWCWlL3uNs2i8EgglBimMqP4pQ/yOKwm11/e3HBn7u4ckqA
ZmBhQNEAqsaxSVX1OqvIfXMqEJeDm3O7l391r+yQlZmNLVrtRedwpDk2odfo/3lJ
RAewveqr3DeCXQFPqu6F5hA9eQJrz8sFX4OsPz8H0zl1tph1aEiHe12yikrxy/Pb
96qCBXZugzVAWIs04v/4glObwssaeVWNyIlTvXkaBmohoFTys/uxNFT/jREtwJKP
UhbX4PFdp9+1Rau40HELz/UkspETNA==
=UKab
-----END PGP SIGNATURE-----

--Sig_/iD8SxflLWy2mJKuYahKT0wT--
