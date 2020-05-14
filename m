Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D26EA1D2DD7
	for <lists+linux-next@lfdr.de>; Thu, 14 May 2020 13:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbgENLH2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 May 2020 07:07:28 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37519 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725925AbgENLHZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 May 2020 07:07:25 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49N7zV1lrLz9sTC;
        Thu, 14 May 2020 21:07:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589454438;
        bh=YPNp7x7WmkC4PxjwU2mdGeJNA86jYtXfNhUg2HHhEIA=;
        h=Date:From:To:Cc:Subject:From;
        b=oJxOCbS+pCsku6hq9RmT42VFOVCfYMjWsPWvkN+sugE7cAURqfqmEIprULCeD66zU
         8P6WRnNQkiIkTEhy9HWnB5Ps6gS9Z4xgDuKpDwhLZdTxh2H0m/W3uwpSduKG86UN0E
         7jOdxrvreChBaa+6qHPPsxEAaOYie99qFPH3Gv2+1Y8bwAhakeO6AjwxKL9/Kkx8qI
         Tx/vPcn8/hSTnoMeXUu92N10HgcJXH3pxylrm4rtXq2D4Z94xjftl1MoQr687iUsDC
         ayd/cB4emyarls60iy+XSxzensAjZaBfjfZBuOVeuGKiFWag01dLM3O9YQYl1XMH6L
         CxS/P9M2vRwHw==
Date:   Thu, 14 May 2020 21:07:16 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 14
Message-ID: <20200514210716.30b416ee@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wWm0pHT/VZQOxLHBxr0F+cJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wWm0pHT/VZQOxLHBxr0F+cJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20200512:

My fixes tree contains:

  f84d61341e1d ("Fix suspicious RCU usage warning")
  1f70931a8300 ("device_cgroup: Fix RCU list debugging warning")
  ab7e2a44a1b4 ("ipmr: Add lockdep expression to ipmr_for_each_table macro")
  7eb5e5d8e122 ("ipmr: Fix RCU list debugging warning")
  2dd3b216ed45 ("drm/msm: Fix undefined "rd_full" link error")

The qcom tree still had its build failure for which I reverted a commit.

The tegra tree lost its build failure.

The clk tree lost its build failure.

The pci tree gained a conflict against Linus' tree.

The opp tree gained a build failure so I used the version from
next-20200512.

The mlx5-next tree gained a conflict against the rdma tree.

The nand tree lost its build failure.

The keys tree gained a build failure so I used the version from
next-20200512.

The block tree gained a build failure for which I applied a patch.

The pidfd tree lost its build failure.

The fsinfo tree lost its build failure.

The akpm-current tree gained a conflict against the kvm-arm tree.

Non-merge commits (relative to Linus' tree): 8352
 8831 files changed, 326119 insertions(+), 141083 deletions(-)

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

I am currently merging 322 trees (counting Linus' and 81 trees of bug
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
Merging origin/master (24085f70a6e1 Merge tag 'trace-v5.7-rc4' of git://git=
.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging fixes/master (f84d61341e1d Fix suspicious RCU usage warning)
Merging kbuild-current/fixes (6a8b55ed4056 Linux 5.7-rc3)
Merging arc-current/for-curr (40db9367ec1e ARC: guard dsp early init agains=
t non ARCv2)
Merging arm-current/fixes (513149cba8f2 Merge branch 'uaccess' into fixes)
Merging arm-soc-fixes/arm/fixes (f42ae4cd4cae Merge tag 'arm-soc/for-5.7/de=
vicetree-fixes' of https://github.com/Broadcom/stblinux into arm/fixes)
Merging arm64-fixes/for-next/fixes (d51c214541c5 arm64: fix the flush_icach=
e_range arguments in machine_kexec)
Merging m68k-current/for-linus (86cded5fc525 m68k: defconfig: Update defcon=
figs for v5.6-rc4)
Merging powerpc-fixes/fixes (249c9b0cd193 powerpc/40x: Make more space for =
system call exception)
Merging s390-fixes/fixes (6a8b55ed4056 Linux 5.7-rc3)
Merging sparc/master (60da7d0bc748 sparc64: Replace zero-length array with =
flexible-array)
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (99addbe31f55 net: broadcom: Select BROADCOM_PHY for BCM=
GENET)
Merging bpf/master (e8a1b0efd632 hinic: fix a bug of ndo_stop)
Merging ipsec/master (c95c5f58b35e xfrm interface: fix oops when deleting a=
 x-netns interface)
Merging netfilter/master (340eaff65116 netfilter: nft_set_rbtree: Add missi=
ng expired checks)
Merging ipvs/master (0141317611ab Merge branch 'hns3-fixes')
Merging wireless-drivers/master (f92f26f2ed2c iwlwifi: pcie: handle QuZ con=
figs with killer NICs as well)
Merging mac80211/master (4a3de90b1184 mac80211: sta_info: Add lockdep condi=
tion for RCU list usage)
Merging rdma-fixes/for-rc (c8b1f340e541 RDMA/iw_cxgb4: Fix incorrect functi=
on parameters)
Merging sound-current/for-linus (1b94e59d30af ALSA: hda/realtek - Add COEF =
workaround for ASUS ZenBook UX431DA)
Merging sound-asoc-fixes/for-linus (d351f0c85d26 Merge remote-tracking bran=
ch 'asoc/for-5.7' into asoc-linus)
Merging regmap-fixes/for-linus (cef570d20922 Merge remote-tracking branch '=
regmap/for-5.7' into regmap-linus)
Merging regulator-fixes/for-linus (c88cdf1b0f5b Merge remote-tracking branc=
h 'regulator/for-5.7' into regulator-linus)
Merging spi-fixes/for-linus (c59ced1b898e Merge remote-tracking branch 'spi=
/for-5.7' into spi-linus)
Merging pci-current/for-linus (ef46738cc47a MAINTAINERS: Add Rob Herring an=
d remove Andy Murray as PCI reviewers)
Merging driver-core.current/driver-core-linus (2ef96a5bb12b Linux 5.7-rc5)
Merging tty.current/tty-linus (2ef96a5bb12b Linux 5.7-rc5)
Merging usb.current/usb-linus (5c4edcdbcd97 usb: typec: mux: intel: Fix DP_=
HPD_LVL bit field)
Merging usb-gadget-fixes/fixes (6e507644209b usb: raw-gadget: fix return va=
lue of ep read ioctls)
Merging usb-serial-fixes/usb-linus (78d6de3cfbd3 USB: serial: qcserial: Add=
 DW5816e support)
Merging usb-chipidea-fixes/ci-for-usb-stable (b3f3736ac305 usb: chipidea: m=
sm: Ensure proper controller reset using role switch API)
Merging phy/fixes (820eeb9de62f phy: qualcomm: usb-hs-28nm: Prepare clocks =
in init)
Merging staging.current/staging-linus (f0b9d875faa4 staging: wfx: unlock on=
 error path)
Merging char-misc.current/char-misc-linus (2ef96a5bb12b Linux 5.7-rc5)
Merging soundwire-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging thunderbolt-fixes/fixes (2ef96a5bb12b Linux 5.7-rc5)
Merging input-current/for-linus (d34fced41e17 Input: applespi - replace zer=
o-length array with flexible-array)
Merging crypto-current/master (a9a8ba90fa58 crypto: arch/nhpoly1305 - proce=
ss in explicit 4k chunks)
Merging ide/master (63bef48fd6c9 Merge branch 'akpm' (patches from Andrew))
Merging vfio-fixes/for-linus (5cbf3264bc71 vfio/type1: Fix VA->PA translati=
on for PFNMAP VMAs in vaddr_get_pfn())
Merging kselftest-fixes/fixes (851c4df54dc1 selftests/lkdtm: Use grep -E in=
stead of egrep)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging slave-dma-fixes/fixes (6b41030fdc79 dmaengine: dmatest: Restore def=
ault for channel)
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
Merging omap-fixes/fixes (fb6823a6f980 ARM: dts: Fix wrong mdio clock for d=
m814x)
Merging kvm-fixes/master (2673cb684972 Merge tag 'kvm-s390-master-5.7-3' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging kvms390-fixes/master (5615e74f48dc KVM: s390: Remove false WARN_ON_=
ONCE for the PQAP instruction)
Merging hwmon-fixes/hwmon (333e22db228f hwmon: (da9052) Synchronize access =
with mfd)
Merging nvdimm-fixes/libnvdimm-fixes (f84afbdd3a9e libnvdimm: Out of bounds=
 read in __nd_ioctl())
Merging btrfs-fixes/next-fixes (4f28062adf92 Merge branch 'misc-5.7' into n=
ext-fixes)
Merging vfs-fixes/fixes (b0d3869ce9ee propagate_one(): mnt_set_mountpoint()=
 needs mount_lock)
Merging dma-mapping-fixes/for-linus (9c24eaf81cc4 iommu/vt-d: Return the co=
rrect dma mask when we are bypassing the IOMMU)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (2ef96a5bb12b Linux 5.7-rc5)
Merging samsung-krzk-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (8f3d9f354286 Linux 5.7-rc1)
Merging devicetree-fixes/dt/linus (4bc77b2d211e dt-bindings: phy: qcom-qusb=
2: Fix defaults)
Merging scsi-fixes/fixes (05d18ae1cc8a scsi: pm: Balance pm_only counter of=
 request queue during system resume)
Merging drm-fixes/drm-fixes (a9fe6f18cde0 Merge tag 'drm-misc-fixes-2020-05=
-07' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (1bc6a60143a4 drm/i915/execlis=
ts: Track inflight CCID)
Merging mmc-fixes/fixes (45a3fe3bf93b mmc: sdhci-acpi: Add SDHCI_QUIRK2_BRO=
KEN_64_BIT_DMA for AMDI0040)
Merging rtc-fixes/rtc-fixes (8f3d9f354286 Linux 5.7-rc1)
Merging gnss-fixes/gnss-linus (ae83d0b416db Linux 5.7-rc2)
Merging hyperv-fixes/hyperv-fixes (38dce4195f0d x86/hyperv: Properly suspen=
d/resume reenlightenment notifications)
Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq h=
andlers after dpio create)
Merging risc-v-fixes/fixes (029a8d5ac090 riscv: mmiowb: Fix implicit declar=
ation of function 'smp_processor_id')
Merging pidfd-fixes/fixes (3f2c788a1314 fork: prevent accidental access to =
clone3 features)
Merging fpga-fixes/fixes (9edd5112d963 fpga: zynqmp: fix modular build)
Merging spdx/spdx-linus (6a8b55ed4056 Linux 5.7-rc3)
Merging gpio-intel-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging pinctrl-intel-fixes/fixes (69388e15f507 pinctrl: cherryview: Add mi=
ssing spinlock usage in chv_gpio_irq_handler)
Merging erofs-fixes/fixes (d1eef1c61974 Linux 5.5-rc2)
Merging integrity-fixes/fixes (770f60586d2a evm: Fix RCU list related warni=
ngs)
Merging drm-misc-fixes/for-linux-next-fixes (c54a8f1f3291 drm/meson: pm res=
ume add return errno branch)
Merging kspp-gustavo/for-next/kspp (8b579b17886f media: s5k5baf: avoid gcc-=
10 zero-length-bounds warning)
Merging kbuild/for-next (310b1c9b217e Merge branch 'kconfig' into for-next)
Merging compiler-attributes/compiler-attributes (98d54f81e36b Linux 5.6-rc4)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (94d1aed9f477 Merge branch 'dma-sg_table-helpe=
r' into dma-mapping-for-next)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (ddc69f025fdc Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (f4c88c103d15 Merge branch 'for-next/kvm/errata=
' into for-next/core)
Merging arm-perf/for-next/perf (8f3d9f354286 Linux 5.7-rc1)
Merging arm-soc/for-next (39572dd33b78 arm64: defconfig: add MEDIA_PLATFORM=
_SUPPORT)
Merging amlogic/for-next (036596b100a1 Merge branch 'v5.8/defconfig' into t=
mp/aml-rebuild)
Merging aspeed/for-next (fa4c8ec6feaa ARM: dts: aspeed: Change KCS nodes to=
 v2 binding)
Merging at91/at91-next (ec539e70d882 Merge branches 'at91-soc', 'at91-dt' a=
nd 'at91-defconfig' into at91-next)
Merging imx-mxs/for-next (36a816eea186 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (560b4d4691b0 Merge branch 'for_5.7/keystone-dts' int=
o next)
Merging mediatek/for-next (23a161322658 Merge branch 'v5.7-next/soc' into f=
or-next)
Merging mvebu/for-next (9d32706f8aa8 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (e2cfa48ea595 Merge branch 'fixes' into for-next)
Merging qcom/for-next (6b9b3614866f Merge branches 'arm64-defconfig-for-5.8=
', 'arm64-for-5.8', 'drivers-for-5.8' and 'dts-for-5.8' into for-next)
Applying: Revert "soc: qcom: rpmh: Allow RPMH driver to be loaded as a modu=
le"
Merging raspberrypi/for-next (f5e216e42689 ARM: dts: bcm283x: Use firmware =
PM driver for V3D)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (c3f36fc27ef6 Merge branch 'renesas-arm-dt-for-v5.8' i=
nto renesas-next)
Merging reset/reset/next (697fa27dc5fb reset: hi6220: Add support for AO re=
set controller)
Merging rockchip/for-next (b73fd7e93512 Merge branch 'v5.7-clk/fixes' into =
for-next)
Merging samsung-krzk/for-next (4f9340b8148f Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (6cfbc765e952 Merge branch 'for-next/scmi' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging sunxi/sunxi/for-next (f8bc85c035f4 Merge branch 'sunxi/dt-for-5.8' =
into sunxi/for-next)
Merging tegra/for-next (1e216b46e13d Merge branch for-5.8/arm64/dt into for=
-next)
Merging ti-k3/ti-k3-next (cae809434da1 arm64: dts: ti: k3-j721e-main: Add m=
ain domain watchdog entries)
Merging clk/clk-next (67c40e861ee2 Merge branch 'clk-fixes' into clk-next)
Merging clk-samsung/for-next (ae9aa4119e55 ARM/SAMSUNG EXYNOS ARM ARCHITECT=
URES: Use fallthrough;)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (9e2ca15322ac csky: Fixup remove unnecessary save/r=
estore PSR code)
Merging h8300/h8300-next (beab3d5cb0e1 irq-renesas-h8s: Fix external interr=
upt control.)
Merging ia64/next (172e7890406d tty/serial: cleanup after ioc*_serial drive=
r removal)
Merging m68k/for-next (b5c08eb306ab m68k: defconfig: Update defconfigs for =
v5.7-rc1)
Merging m68knommu/for-next (5850da95da03 m68k: Drop CONFIG_MTD_M25P80 in st=
mark2_defconfig)
Merging microblaze/next (8f3d9f354286 Linux 5.7-rc1)
Merging mips/mips-next (b6b6c318006b KVM: MIPS/Emulate: Remove unneeded sem=
icolon)
CONFLICT (content): Merge conflict in arch/mips/loongson2ef/Kconfig
Merging nds32/next (d785c5a324cd nds32: configs: Cleanup CONFIG_CROSS_COMPI=
LE)
Merging nios2/for-next (0ec8a5054d7f MAINTAINERS: Remove nios2-dev@lists.ro=
cketboards.org)
Merging openrisc/for-next (9737e2c5f0bc openrisc: Remove obsolete show_trac=
e_task function)
Merging parisc-hd/for-next (b6522fa409cf parisc: add sysctl file interface =
panic_on_stackoverflow)
Merging powerpc/next (1f12096aca21 Merge the lockless page table walk rewor=
k into next)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (461c3ac0dc46 soc: fsl: qe: fix sparse warnings for uc=
c_slow.c)
Merging risc-v/for-next (44ab661dd29d riscv: Use text_mutex instead of patc=
h_lock)
Merging sifive/for-next (467e050e9760 Merge branch 'i2c/for-current' of git=
://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging s390/features (23a457b8d57d s390: nvme reipl)
Merging sh/sh-next (a193018e5290 sh: add missing EXPORT_SYMBOL() for __dela=
y)
Merging sparc-next/master (a012c1e866a6 Merge branch 'Rework-sparc32-page-t=
able-layout')
Merging uml/linux-next (2e27d33d22af um: Fix typo in vector driver transpor=
t option definition)
Merging xtensa/xtensa-for-next (70cbddb97385 arch/xtensa: fix grammar in Kc=
onfig help text)
Merging fscrypt/master (0e698dfa2822 Linux 5.7-rc4)
Merging afs/afs-next (4fe171bb81b1 afs: Remove set but not used variable 'r=
et')
Merging btrfs/for-next (d628d057e5d5 Merge branch 'for-next-next-v5.7-20200=
511' into for-next-20200511)
Merging ceph/master (12ae44a40a1b ceph: demote quotarealm lookup warning to=
 a debug message)
Merging cifs/for-next (ad1ebd31dcb7 cifs: Fix null pointer check in cifs_re=
ad)
Merging configfs/for-next (8aebfffacfa3 configfs: fix config_item refcnt le=
ak in configfs_rmdir())
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (8f3d9f354286 Linux 5.7-rc1)
Merging exfat/dev (e9d1a9d72e55 exfat: fix possible memory leak in exfat_fi=
nd())
Merging ext3/for_next (a32f0ecd79b4 Merge fanotify fix from Nathan Chancell=
or.)
Merging ext4/dev (907ea529fc4c ext4: convert BUG_ON's to WARN_ON's in mball=
oc.c)
Merging f2fs/dev (1454c978efbb f2fs: compress: fix zstd data corruption)
Merging fsverity/fsverity (0e698dfa2822 Linux 5.7-rc4)
Merging fuse/for-next (75d892588e95 fuse: Update stale comment in queue_int=
errupt())
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (f304a809a9f1 NFS: Don't use RPC_TASK_CRED_NOREF wit=
h delegreturn)
Merging nfs-anna/linux-next (55dee1bc0d72 nfs: add minor version to nfs_ser=
ver_key for fscache)
Merging nfsd/nfsd-next (746c6237ece6 sunrpc: add missing newline when print=
ing parameter 'pool_mode' by sysfs)
Merging orangefs/for-next (aa317d3351de orangefs: clarify build steps for t=
est server in orangefs.txt)
Merging overlayfs/overlayfs-next (144da23beab8 ovl: return required buffer =
size for file handles)
Merging ubifs/linux-next (3676f32a98cd ubi: ubi-media.h: Replace zero-lengt=
h array with flexible-array member)
Merging v9fs/9p-next (c6f141412d24 9p: document short read behaviour with O=
_NONBLOCK)
Merging xfs/for-next (3d60548b216b xfs: remove duplicate headers)
Merging zonefs/for-next (0dda2ddb7ded zonefs: select FS_IOMAP)
Merging iomap/iomap-for-next (b75dfde12129 fibmap: Warn and return an error=
 in case of block > INT_MAX)
Merging djw-vfs/vfs-for-next (2c567af418e3 fs: Introduce DCACHE_DONTCACHE)
Merging file-locks/locks-next (dbdaf6a3250b locks: reinstate locks_delete_b=
lock optimization)
Merging vfs/for-next (6470fc558f46 Merge branches 'work.misc', 'work.sysctl=
', 'work.epoll', 'uaccess.base', 'uaccess.csum' and 'work.set_fs-exec' into=
 for-next)
CONFLICT (content): Merge conflict in kernel/sysctl.c
CONFLICT (modify/delete): arch/mips/lasat/sysctl.c deleted in HEAD and modi=
fied in vfs/for-next. Version vfs/for-next of arch/mips/lasat/sysctl.c left=
 in tree.
$ git rm -f arch/mips/lasat/sysctl.c
Merging printk/for-next (d34f14ae521f Merge branch 'for-5.7-preferred-conso=
le' into for-next)
Merging pci/next (30370da5c805 Merge branch 'remotes/lorenzo/pci/v3-semi')
CONFLICT (content): Merge conflict in drivers/pci/quirks.c
Merging pstore/for-next/pstore (77921842febf mtd: Support kmsg dumper based=
 on pstore/blk)
Merging hid/for-next (e81a2d6bd788 Merge branch 'for-5.8/asus' into for-nex=
t)
Merging i2c/i2c/for-next (bc8faf89ea19 Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i3c/i3c/next (b4203ce05563 i3c master: GETMRL's 3rd byte is optiona=
l even with BCR_IBI_PAYLOAD)
Merging dmi/master (8cf87c744696 firmware/dmi: Report DMI Bios & EC firmwar=
e release)
Merging hwmon-staging/hwmon-next (6f408febbcbc hwmon : (nct6775) Use kobj_t=
o_dev() API)
Merging jc_docs/docs-next (56b62540782b doc: thermal: add cpu-idle-cooling =
to index tree)
CONFLICT (content): Merge conflict in Documentation/arm64/booting.rst
CONFLICT (content): Merge conflict in Documentation/arm64/amu.rst
Merging v4l-dvb/master (43c4dc3f59e7 media: dvb-frontends: remove redundant=
 initialization of variable status)
Merging v4l-dvb-next/master (54ecb8f7028c Linux 5.4-rc1)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (fbe093dd16f4 Merge branch 'pm-cpufreq' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (1f1755af4f06 cpufreq: qoriq: Ad=
d platform dependencies)
Merging cpupower/cpupower (7b0bf99b9ee4 cpupower: Remove unneeded semicolon)
Merging opp/opp/linux-next (c22a734841b1 OPP: Add support for setting inter=
connect-tags)
$ git reset --hard HEAD^
Merging next-20200512 version of opp
Merging thermal/thermal/linux-next (79799562bf08 thermal: int3400_thermal: =
Statically initialize .get_mode()/.set_mode() ops)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (fe204591cc94 dlm: remove BUG() before panic())
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (52c81f47f0d2 RDMA/mlx5: Remove duplicated assignment=
 to variable rcqe_sz)
CONFLICT (content): Merge conflict in drivers/net/ethernet/mellanox/mlx5/co=
re/steering/dr_send.c
Merging net-next/master (6545be82807c sfc: fix dereference of table before =
it is null checked)
CONFLICT (content): Merge conflict in drivers/net/ethernet/huawei/hinic/hin=
ic_main.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/huawei/hinic/hin=
ic_hw_mgmt.c
Merging bpf-next/master (8f4605ac3e64 Merge branch 'bpf_iter-fixes')
Merging ipsec-next/master (7d4343d501f9 xfrm: fix unused variable warning i=
f CONFIG_NETFILTER=3Dn)
CONFLICT (content): Merge conflict in net/ipv6/xfrm6_output.c
CONFLICT (content): Merge conflict in net/ipv4/xfrm4_output.c
Applying: xfrm: merge fixup for "remove output_finish indirection from xfrm=
_state_afinfo"
Merging mlx5-next/mlx5-next (9254f8ed15b6 net/mlx5: Add support in forward =
to namespace)
CONFLICT (content): Merge conflict in drivers/infiniband/hw/mlx5/main.c
Merging netfilter-next/master (7a36e4918e30 octeontx2-pf: Use the napi_allo=
c_frag() to alloc the pool buffers)
Merging ipvs-next/master (d54725cd11a5 netfilter: nf_tables: support for mu=
ltiple devices per netdev hook)
Merging wireless-drivers-next/master (c73fb4d33e1d Merge tag 'iwlwifi-next-=
for-kalle-2020-05-08' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlw=
ifi/iwlwifi-next)
Merging bluetooth/master (ea13d71887bd net: phy: tja11xx: add cable-test su=
pport)
Merging mac80211-next/master (60689de46c7f mac80211: fix memory overlap due=
 to variable length param)
Merging gfs2/for-next (771d0b71043f gfs2: Allow lock_nolock mount to specif=
y jid=3DX)
Merging mtd/mtd/next (025a06c1104c mtd: Convert fallthrough comments into s=
tatements)
Merging nand/nand/next (0185d50c5220 mtd: rawnand: stm32_fmc2: use FMC2_TIM=
EOUT_MS for timeouts)
Merging spi-nor/spi-nor/next (b84691596328 mtd: spi-nor: Fix description of=
 the sr_ready() return value)
Merging crypto/master (228c4f265c6e crypto: lib/sha1 - fold linux/cryptohas=
h.h into crypto/sha.h)
CONFLICT (content): Merge conflict in crypto/xts.c
CONFLICT (content): Merge conflict in crypto/lrw.c
Merging drm/drm-next (a1fb54896239 Merge tag 'drm-intel-next-2020-04-30' of=
 git://anongit.freedesktop.org/drm/drm-intel into drm-next)
CONFLICT (content): Merge conflict in include/linux/dma-buf.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/tidss/tidss_encoder.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_vma.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_irq.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_rps.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_lrc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_dom=
ain.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_fb=
c.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_di=
splay_power.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dd=
i.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/core/d=
c_link_dp.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.c
Merging amdgpu/drm-next (033a28ee0755 drm/amdgpu: simplify ATIF backlight h=
andling)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_kms=
.c
Merging drm-intel/for-linux-next (701f02652198 drm/i915: Drop I915_RESET_TI=
MEOUT and friends)
Merging drm-tegra/drm/tegra/for-next (f923db184ca3 gpu: host1x: Clean up de=
bugfs in error handling path)
Merging drm-misc/for-linux-next (1c530d431c69 dma-buf: Use atomic_fetch_add=
() for the context id)
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
Merging sound/for-next (07f77dd47a2c ALSA: firewire-motu: fulfill missing e=
ntries in Kconfig)
Merging sound-asoc/for-next (a4f6fc98cd2f Merge remote-tracking branch 'aso=
c/for-5.8' into asoc-next)
CONFLICT (content): Merge conflict in sound/soc/codecs/cros_ec_codec.c
Merging modules/modules-next (5c3a7db0c7ec module: Harden STRICT_MODULE_RWX)
Merging input/next (cf520c643012 Input: elants_i2c - provide an attribute t=
o show calibration count)
Merging block/for-next (c78c9b8a4cfe Merge branch 'for-5.8/drivers' into fo=
r-next)
Merging device-mapper/for-next (44eaf01834bc dm: replace zero-length array =
with flexible-array)
Merging pcmcia/pcmcia-next (a8c122f72d94 pcmcia: remove some unused space c=
haracters)
Merging mmc/next (ab7897b3315d mmc: host: Drop redundant MMC_CAP_ERASE)
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (6130fbfa94be mfd: intel-lpss: Update LPSS UART #2=
 PCI ID for Jasper Lake)
Merging backlight/for-backlight-next (479da1f538a2 backlight: Add backlight=
_device_get_by_name())
Merging battery/for-next (454b9c1ffd42 power: supply: bq24190_charger: conv=
ert to use i2c_new_client_device())
Merging regulator/for-next (0553af564bde Merge remote-tracking branch 'regu=
lator/topic/linear-range' into regulator-next)
Merging security/next-testing (3e27a33932df security: remove duplicated inc=
lude from security.h)
Merging apparmor/apparmor-next (01df52d726b5 apparmor: remove duplicate che=
ck of xattrs on profile attachment.)
Merging integrity/next-integrity (0c4395fb2aa7 evm: Fix possible memory lea=
k in evm_calc_hmac_or_hash())
Merging keys/keys-next (8d1b93869607 keys: Implement update for the big_key=
 type)
$ git reset --hard HEAD^
Merging next-20200512 version of keys
Merging selinux/next (fe5a90b8c149 selinux: netlabel: Remove unused inline =
function)
Merging smack/next (ef26650a201f Smack: Remove unused inline function smk_a=
d_setfield_u_fs_path_mnt)
Merging tomoyo/master (27acbf41be39 tomoyo: use true for bool variable)
Merging tpmdd/next (47c18d91f4ad tpm: eventlog: Replace zero-length array w=
ith flexible-array member)
Merging watchdog/master (152036d1379f Merge tag 'nfsd-5.7-rc-2' of git://gi=
t.linux-nfs.org/projects/cel/cel-2.6)
Merging iommu/next (1799045b9ec2 Merge branches 'iommu/fixes', 'arm/msm', '=
x86/vt-d' and 'x86/amd' into next)
CONFLICT (content): Merge conflict in drivers/iommu/s390-iommu.c
Merging vfio/next (f44efca0493d vfio: Ignore -ENODEV when getting MSI cooki=
e)
Merging audit/next (0090c1edebf4 audit: Replace zero-length array with flex=
ible-array)
Merging devicetree/for-next (7f0f855e6cf3 dt-bindings: vendor-prefixes: Add=
 U-Boot bootloader prefix)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/dis=
play/panel/panel-common.yaml
Merging mailbox/mailbox-for-next (0a67003b1985 mailbox: imx: add SCU MU sup=
port)
Merging spi/for-next (fe9fce6b2cf3 Merge remote-tracking branch 'spi/for-5.=
8' into spi-next)
Merging tip/auto-latest (506c28aae936 Merge branch 'core/core')
Merging clockevents/timers/drivers/next (c1ac28a4de6f Revert "clocksource: =
Avoid creating dead devices")
Merging edac/edac-for-next (dc63e28efa19 Merge branch 'edac-i10nm' into eda=
c-for-next)
Merging irqchip/irq/irqchip-next (4cea749d56be Revert "irqchip/xilinx: Enab=
le generic irq multi handler")
Merging ftrace/for-next (d013496f99c5 tracing: Convert local functions in t=
racing_map.c to static)
Merging rcu/rcu/next (ec06fa2b1488 doc: Tasks RCU must protect instructions=
 before trampoline)
Merging kvm/linux-next (7c67f54661fc KVM: SVM: do not allow VMRUN inside SM=
M)
CONFLICT (content): Merge conflict in arch/x86/kvm/svm/svm.c
Merging kvm-arm/next (963d8acfd5d9 KVM: arm64: Make KVM_CAP_MAX_VCPUS compa=
tible with the selected GIC version)
Merging kvm-ppc/kvm-ppc-next (9a5788c615f5 KVM: PPC: Book3S HV: Add a capab=
ility for enabling secure guests)
Merging kvms390/next (0b545fd17f84 KVM: s390: remove unneeded semicolon in =
gisa_vcpu_kicker())
Merging xen-tip/linux-next (74f4c438f22c arm/xen: make _xen_start_info stat=
ic)
Merging percpu/for-next (dedac37ea96b Merge branch 'for-5.7' into for-next)
Merging workqueues/for-next (b92b36eadf4d workqueue: Fix an use after free =
in init_rescuer())
Merging drivers-x86/for-next (65829fe4f6df platform/x86: thinkpad_acpi: Rep=
lace custom approach by kstrtoint())
Merging chrome-platform/for-next (94b8e516839f Merge remote-tracking branch=
 'origin/chrome-platform-5.7-fixes' into for-kernelci)
CONFLICT (content): Merge conflict in drivers/platform/chrome/chromeos_psto=
re.c
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (c85c7cdef3c9 leds: trigger: remove redundant assignm=
ent to variable ret)
Merging ipmi/for-next (f8ef5af3dd1e Try to load acpi_ipmi when an SSIF ACPI=
 IPMI interface is added)
Merging driver-core/driver-core-next (c8be6af9ef16 Merge v5.7-rc5 into driv=
er-core-next)
Merging usb/usb-next (2ca23ae59e99 Merge 5.7-rc5 into usb-next)
Merging usb-gadget/next (4a5dbd900957 dt-bindings: usb: add documentation f=
or aspeed usb-vhub)
Merging usb-serial/usb-next (788a4ee607e8 USB: serial: Use the correct styl=
e for SPDX License Identifier)
Merging usb-chipidea-next/ci-for-usb-next (6dbbbccdba61 usb: chipidea: Enab=
le user-space triggered role-switching)
Merging phy-next/next (4127cbcd989f phy: intel-lgm-emmc: Add architecture d=
ependency)
Merging tty/tty-next (cf9c94456eba Revert "tty: hvc: Fix data abort due to =
race in hvc_open")
Merging char-misc/char-misc-next (dd92b0133a78 Merge 5.7-rc5 into char-misc=
-next)
Merging extcon/extcon-next (6581cc1b6221 extcon: adc-jack: Fix an error han=
dling path in 'adc_jack_probe()')
Merging soundwire/next (6f7219fecf35 soundwire: intel: (cosmetic) remove mu=
ltiple superfluous "else" statements)
Merging thunderbolt/next (eb4a6de4962e thunderbolt: Update Kconfig to allow=
 building on other architectures.)
Merging staging/staging-next (ae73e7784871 Merge 5.7-rc5 into staging-next)
Merging mux/for-next (f356d58c3a04 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (0472d2042439 Merge branch 'icc-get-by-index' into icc=
-next)
Merging slave-dma/next (d9fd428a304f dmaengine: at_xdmac: Replace zero-leng=
th array with flexible-array)
Merging cgroup/for-next (eec8fd0277e3 device_cgroup: Cleanup cgroup eBPF de=
vice filter code)
Merging scsi/for-next (8833ab64899e Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (47742bde281b scsi: scsi_debug: Fix an error hand=
ling bug in sdeb_zbc_model_str())
Merging vhost/linux-next (e26e8b694ea7 virtio_net: CTRL_GUEST_OFFLOADS depe=
nds on CTRL_VQ)
Merging rpmsg/for-next (714d20b5bcd2 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (ccec57d2a1fb Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (3831c051dfbf tools: gpio: add bias flags t=
o lsgpio)
Merging gpio-intel/for-next (7e73aa90a38c gpio: merrifield: Better show how=
 GPIO and IRQ bases are derived from hardware)
Merging pinctrl/for-next (45d0618e021a Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (6d649fca3491 pinctrl: intel: Move npins clo=
ser to pin_base in struct intel_community)
Merging pinctrl-samsung/for-next (f354157a7d18 pinctrl: samsung: Save/resto=
re eint_mask over suspend for EINT_TYPE GPIOs)
Merging pwm/for-next (6f0841a8197b pwm: Add support for Azoteq IQS620A PWM =
generator)
Merging userns/for-next (8d243345fa85 Merge proc-next and exec-next for tes=
ting in linux-next)
Merging ktest/for-next (1091c8fce8aa ktest: Fix typos in ktest.pl)
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (2ef96a5bb12b Linux 5.7-rc5)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (f644e7bbd7c1 Merge branch 'for-5.8/klp-modul=
e-fixups' into for-next)
CONFLICT (content): Merge conflict in kernel/module.c
Merging coresight/next (fad87aae6a84 coresight: etm4x: Fix use-after-free o=
f per-cpu etm drvdata)
Merging rtc/rtc-next (378252b6e24f rtc: ingenic: Reset regulator register i=
n probe)
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
Merging slimbus/for-next (f9a478d658a2 slimbus: core: Fix mismatch in of_no=
de_get/put)
Merging nvmem/for-next (780a19892c90 nvmem: jz4780-efuse: Use PTR_ERR_OR_ZE=
RO() to simplify code)
Merging xarray/xarray (27586ca786a7 XArray: Handle retry entries within xas=
_find_marked)
Merging hyperv/hyperv-next (f69bc337f7bd vmbus: Replace zero-length array w=
ith flexible-array)
Merging auxdisplay/auxdisplay (2f920c0f0e29 auxdisplay: charlcd: replace ze=
ro-length array with flexible-array member)
Merging kgdb/kgdb/for-next (1137a96f9b5a kgdb: Return true in kgdb_nmi_poll=
_knock())
Merging pidfd/for-next (2b40c5db73e2 selftests/pidfd: add pidfd setns tests)
Merging devfreq/devfreq-next (869cad3992bf PM / devfreq: Use lockdep assert=
s instead of manual checks for locked mutex)
Merging hmm/hmm (f76c1477c6ed MAINTAINERS: add HMM selftests)
Merging fpga/for-next (a2b9d4eadb77 fpga: dfl: afu: support debug access to=
 memory-mapped afu regions)
Merging kunit/test (0e698dfa2822 Linux 5.7-rc4)
Merging cel/cel-next (0a8e7b7d0846 SUNRPC: Revert 241b1f419f0e ("SUNRPC: Re=
move xdr_buf_trim()"))
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (b359ed5184ae mtd: cfi_cmdset_0001: Support the absenc=
e of protection registers)
Merging kunit-next/kunit (45ba7a893ad8 kunit: kunit_tool: Separate out conf=
ig/build/exec/parse)
Merging trivial/for-next (fad7c9020948 err.h: remove deprecated PTR_RET for=
 good)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (3781a7a11294 bus: mhi: core: Handle syserr during pow=
er_up)
Merging notifications/notifications-pipe-core (3a0f96286e31 watch_queue: sa=
mple: Display superblock notifications)
CONFLICT (content): Merge conflict in samples/Makefile
CONFLICT (content): Merge conflict in samples/Kconfig
CONFLICT (content): Merge conflict in fs/splice.c
CONFLICT (content): Merge conflict in fs/io_uring.c
Merging fsinfo/fsinfo-core (f2494de388bd fsinfo: Add an attribute that list=
s all the visible mounts in a namespace)
CONFLICT (content): Merge conflict in samples/vfs/Makefile
Applying: fix for "block: add blk_io_schedule() for avoiding task hung in s=
ync dio"
Merging akpm-current/current (e0830fe63375 ipc-convert-ipcs_idr-to-xarray-u=
pdate-fix)
CONFLICT (content): Merge conflict in tools/testing/selftests/vm/Makefile
CONFLICT (content): Merge conflict in include/linux/printk.h
CONFLICT (content): Merge conflict in include/linux/binfmts.h
CONFLICT (content): Merge conflict in arch/x86/Kconfig.debug
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
CONFLICT (content): Merge conflict in arch/arm64/kvm/mmu.c
CONFLICT (content): Merge conflict in arch/arm64/include/asm/pgtable.h
CONFLICT (content): Merge conflict in arch/arm64/Kconfig
CONFLICT (content): Merge conflict in Makefile
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --a=
bort".
CONFLICT (modify/delete): arch/csky/kernel/dumpstack.c deleted in HEAD and =
modified in 58086d3bcea9... csky: add show_stack_loglvl(). Version 58086d3b=
cea9... csky: add show_stack_loglvl() of arch/csky/kernel/dumpstack.c left =
in tree.
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --a=
bort".
CONFLICT (modify/delete): arch/csky/kernel/dumpstack.c deleted in HEAD and =
modified in 95444b7f3364... kernel: rename show_stack_loglvl() =3D> show_st=
ack(). Version 95444b7f3364... kernel: rename show_stack_loglvl() =3D> show=
_stack() of arch/csky/kernel/dumpstack.c left in tree.
Merging akpm/master (ad9332ab7b66 drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/wWm0pHT/VZQOxLHBxr0F+cJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl69JmQACgkQAVBC80lX
0Gz47wgAnxDsGTIPh/3cDBV0rDRg86GEM2i65sNwM344RgXqOwRGnVnyrRFzl1Yq
oy6lsuVfTjE3/eCG3s1EHLNAn86KfoxIgXkSXUdaoxxmI4QxTMdrngM6SRrlFT3g
7kzFfVAFinpwSCMaYuNrliAVqBop8mTdDAy9TOy2k4o23VQ1zm1KDhLDKgZXc880
htb9SduXPXtHuIm8iivA1mAKM9aWzyrYR3JKoltQ6WGUfBASJ/XT+Q7O2wTY+TqO
cYxVyYMoYhhpO6xjobXEF9Jv10W5UbodxleG/j/tvmK8s7Xjgb0i8JH1CzKUXeCv
9krPC5fg9AKYdg+9/zObgl5i+NHWaw==
=kCd3
-----END PGP SIGNATURE-----

--Sig_/wWm0pHT/VZQOxLHBxr0F+cJ--
