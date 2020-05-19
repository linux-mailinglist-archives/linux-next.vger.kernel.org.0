Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EDFA1D9EBD
	for <lists+linux-next@lfdr.de>; Tue, 19 May 2020 20:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbgESSEB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 May 2020 14:04:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727045AbgESSEB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 May 2020 14:04:01 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE43DC08C5C0;
        Tue, 19 May 2020 11:04:00 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49RNzx4bgQz9sT6;
        Wed, 20 May 2020 04:03:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589911437;
        bh=inBC+Rv/zoim3N4twnzFUKjq/zXJPC2kuyLeRGx+40Q=;
        h=Date:From:To:Cc:Subject:From;
        b=a1LteTsqry8QDKrpcaKnLEbu1vJVfHI4B4k2bBKcsrIUkMs/1scx9N0kf4e3sd1CY
         CXLhGkSG/KsTYvWKRFQDcWldAbeIXDpg5qrPZdFc/HrNHvFANrEHMotdS706bALSmL
         i/AJQbXsP93HGqgvZ2r7iKpUvBR4RGMtSSvKUKZJlL7hZr9JehFQmTftvwEPmeeZ0X
         ejStHjLPfQmHotCw120jZitN1dNj1hjza9844SVDdN4ZUVdgSLrseSjlYDbY+itunA
         ubVO4H869lLnwm6G5a4pZP7JeJrYd4NCTJNAqplRUigWyKTxRSb5dT01Souia6OSkt
         rj7Oe0vUyRrIw==
Date:   Wed, 20 May 2020 04:03:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 19
Message-ID: <20200520040354.3e619918@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7UB6n4i.gygcVS.v_KtJXdd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7UB6n4i.gygcVS.v_KtJXdd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

News: there will be no linux-next release tomorrow.

Changes since 20200518:

My fixes tree contains:

  cd2b06ec45d6 ("device_cgroup: Fix RCU list debugging warning")

The mtd-fixes tree lost its build failure.

The qcom tree lost its build failure.

The ipsec-next tree gained a conflict against the net-next tree.

The drm-msm tree gained a build failure so I applied a patch.

The mmc tree lost its build failure.

The keys tree lost its build failure.

The tip tree gained a conflict against the drm-misc tree.

The rcu tree gained a conflict against the powerpc tree.

The kgdb tree gained a build failure so I used the version from
next-20200518.

The akpm-current tree gained conflicts against the tip and rcu trees.

Non-merge commits (relative to Linus' tree): 9648
 10311 files changed, 399315 insertions(+), 160611 deletions(-)

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
Merging origin/master (642b151f45dd Merge branch 'fixes' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/zohar/linux-integrity)
Merging fixes/master (cd2b06ec45d6 device_cgroup: Fix RCU list debugging wa=
rning)
Merging kbuild-current/fixes (6a8b55ed4056 Linux 5.7-rc3)
Merging arc-current/for-curr (7915502377c5 ARC: show_regs: avoid extra line=
 of output)
Merging arm-current/fixes (513149cba8f2 Merge branch 'uaccess' into fixes)
Merging arm-soc-fixes/arm/fixes (d5fef88ccbd3 Merge tag 'renesas-fixes-for-=
v5.7-tag2' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel into arm/fixes)
Merging arm64-fixes/for-next/fixes (d51c214541c5 arm64: fix the flush_icach=
e_range arguments in machine_kexec)
Merging m68k-current/for-linus (86cded5fc525 m68k: defconfig: Update defcon=
figs for v5.6-rc4)
Merging powerpc-fixes/fixes (249c9b0cd193 powerpc/40x: Make more space for =
system call exception)
Merging s390-fixes/fixes (70b690547d5e s390/kexec_file: fix initrd location=
 for kdump kernel)
Merging sparc/master (fcdf818d239e Merge branch 'sparc-scnprintf')
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (e3f2d5579c0b net: phy: propagate an error back to the c=
allers of phy_sfp_probe)
Merging bpf/master (f85c1598ddfe Merge git://git.kernel.org/pub/scm/linux/k=
ernel/git/netdev/net)
Merging ipsec/master (56b1b7c667fb esp6: calculate transport_header correct=
ly when sel.family !=3D AF_INET6)
Merging netfilter/master (e3f2d5579c0b net: phy: propagate an error back to=
 the callers of phy_sfp_probe)
Merging ipvs/master (0141317611ab Merge branch 'hns3-fixes')
Merging wireless-drivers/master (f92f26f2ed2c iwlwifi: pcie: handle QuZ con=
figs with killer NICs as well)
Merging mac80211/master (4a3de90b1184 mac80211: sta_info: Add lockdep condi=
tion for RCU list usage)
Merging rdma-fixes/for-rc (ccfdbaa5cf46 RDMA/uverbs: Move IB_EVENT_DEVICE_F=
ATAL to destroy_uobj)
Merging sound-current/for-linus (b0cb099062b0 ALSA: iec1712: Initialize STD=
SP24 properly when using the model=3Dstaudio option)
Merging sound-asoc-fixes/for-linus (c6bc5f5c6304 Merge remote-tracking bran=
ch 'asoc/for-5.7' into asoc-linus)
Merging regmap-fixes/for-linus (cef570d20922 Merge remote-tracking branch '=
regmap/for-5.7' into regmap-linus)
Merging regulator-fixes/for-linus (276b2684ec26 Merge remote-tracking branc=
h 'regulator/for-5.7' into regulator-linus)
Merging spi-fixes/for-linus (5b201ddd7775 Merge remote-tracking branch 'spi=
/for-5.7' into spi-linus)
Merging pci-current/for-linus (ef46738cc47a MAINTAINERS: Add Rob Herring an=
d remove Andy Murray as PCI reviewers)
Merging driver-core.current/driver-core-linus (2ef96a5bb12b Linux 5.7-rc5)
Merging tty.current/tty-linus (17b4efdf4e48 tty: serial: add missing spin_l=
ock_init for SiFive serial console)
Merging usb.current/usb-linus (b9bbe6ed63b2 Linux 5.7-rc6)
Merging usb-gadget-fixes/fixes (172b14b48ca1 usb: cdns3: gadget: make a bun=
ch of functions static)
Merging usb-serial-fixes/usb-linus (78d6de3cfbd3 USB: serial: qcserial: Add=
 DW5816e support)
Merging usb-chipidea-fixes/ci-for-usb-stable (b3f3736ac305 usb: chipidea: m=
sm: Ensure proper controller reset using role switch API)
Merging phy/fixes (820eeb9de62f phy: qualcomm: usb-hs-28nm: Prepare clocks =
in init)
Merging staging.current/staging-linus (bcb392871813 Merge tag 'iio-fixes-fo=
r-5.7b' of https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into s=
taging-linus)
Merging char-misc.current/char-misc-linus (1ea34b298855 bus: mhi: core: Fix=
 some error return code)
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
Merging slave-dma-fixes/fixes (be4054b8b667 dmaengine: ti: k3-udma: Fix TR =
mode flags for slave_sg and memcpy)
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (7b01b7239d0d mtd: Fix mtd not registered due t=
o nvmem name collision)
Merging mfd-fixes/for-mfd-fixes (603d9299da32 mfd: mt6397: Fix probe after =
changing mt6397-core)
Merging v4l-dvb-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (8f3d9f354286 Linux 5.7-rc1)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (fb6823a6f980 ARM: dts: Fix wrong mdio clock for d=
m814x)
Merging kvm-fixes/master (c4e0e4ab4cf3 KVM: x86: Fix off-by-one error in kv=
m_vcpu_ioctl_x86_setup_mce)
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
Merging scsi-fixes/fixes (f2e6b75f6ee8 scsi: target: Put lun_ref at end of =
tmr processing)
Merging drm-fixes/drm-fixes (1d2a1eb13610 Merge tag 'drm-misc-fixes-2020-05=
-14' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (955da9d77435 drm/i915: Handle=
 idling during i915_gem_evict_something busy loops)
Merging mmc-fixes/fixes (2b17b8d7cc65 mmc: sdhci: Fix SDHCI_QUIRK_BROKEN_CQ=
E)
Merging rtc-fixes/rtc-fixes (8f3d9f354286 Linux 5.7-rc1)
Merging gnss-fixes/gnss-linus (2ef96a5bb12b Linux 5.7-rc5)
Merging hyperv-fixes/hyperv-fixes (38dce4195f0d x86/hyperv: Properly suspen=
d/resume reenlightenment notifications)
Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq h=
andlers after dpio create)
Merging risc-v-fixes/fixes (ed1ed4c0da54 riscv: mmiowb: Fix implicit declar=
ation of function 'smp_processor_id')
Merging pidfd-fixes/fixes (3f2c788a1314 fork: prevent accidental access to =
clone3 features)
Merging fpga-fixes/fixes (9edd5112d963 fpga: zynqmp: fix modular build)
Merging spdx/spdx-linus (6a8b55ed4056 Linux 5.7-rc3)
Merging gpio-intel-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging pinctrl-intel-fixes/fixes (69388e15f507 pinctrl: cherryview: Add mi=
ssing spinlock usage in chv_gpio_irq_handler)
Merging erofs-fixes/fixes (d1eef1c61974 Linux 5.5-rc2)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging drm-misc-fixes/for-linux-next-fixes (abf56fadf0e2 gpu/drm: Ingenic:=
 Fix opaque pointer casted to wrong type)
Merging kspp-gustavo/for-next/kspp (8b579b17886f media: s5k5baf: avoid gcc-=
10 zero-length-bounds warning)
Merging kbuild/for-next (2c2d2528e3f0 Merge branch 'kconfig' into for-next)
Merging compiler-attributes/compiler-attributes (98d54f81e36b Linux 5.6-rc4)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (94d1aed9f477 Merge branch 'dma-sg_table-helpe=
r' into dma-mapping-for-next)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (ddc69f025fdc Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (7508b88c922b Merge branch 'for-next/kvm/errata=
' into for-next/core)
Merging arm-perf/for-next/perf (10f6cd2af21b pmu/smmuv3: Clear IRQ affinity=
 hint on device removal)
Merging arm-soc/for-next (fc4c1091c327 soc: document merges)
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
Merging mediatek/for-next (931dde8affeb Merge branch 'v5.7-next/soc' into f=
or-next)
Merging mvebu/for-next (869da228bd45 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (e2cfa48ea595 Merge branch 'fixes' into for-next)
Merging qcom/for-next (54142d225360 Merge branches 'arm64-defconfig-for-5.8=
', 'arm64-for-5.8', 'drivers-for-5.8' and 'dts-for-5.8' into for-next)
Merging raspberrypi/for-next (f5e216e42689 ARM: dts: bcm283x: Use firmware =
PM driver for V3D)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (1bd79704bee2 Merge branch 'renesas-dt-bindings-for-v5=
.8' into renesas-next)
Merging reset/reset/next (697fa27dc5fb reset: hi6220: Add support for AO re=
set controller)
Merging rockchip/for-next (504ba3b074ff Merge tag 'v5.7-rc6' into for-next)
Merging samsung-krzk/for-next (4f9340b8148f Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (c24026b31056 Merge branch 'for-next/juno' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging sunxi/sunxi/for-next (243cd8fba48d Merge branch 'sunxi/dt-for-5.8' =
into sunxi/for-next)
Merging tegra/for-next (62c5be8e5433 Merge branch for-5.8/arm64/dt into for=
-next)
Merging ti-k3/ti-k3-next (cae809434da1 arm64: dts: ti: k3-j721e-main: Add m=
ain domain watchdog entries)
Merging clk/clk-next (267701f9e720 Merge branch 'clk-qcom' into clk-next)
Merging clk-samsung/for-next (ae9aa4119e55 ARM/SAMSUNG EXYNOS ARM ARCHITECT=
URES: Use fallthrough;)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (51bb38cb7836 csky: Fixup raw_copy_from_user())
Merging h8300/h8300-next (beab3d5cb0e1 irq-renesas-h8s: Fix external interr=
upt control.)
Merging ia64/next (172e7890406d tty/serial: cleanup after ioc*_serial drive=
r removal)
Merging m68k/for-next (b5c08eb306ab m68k: defconfig: Update defconfigs for =
v5.7-rc1)
Merging m68knommu/for-next (5b50f06e33a3 m68k: Drop CONFIG_MTD_M25P80 in st=
mark2_defconfig)
Merging microblaze/next (8f3d9f354286 Linux 5.7-rc1)
Merging mips/mips-next (8be26bab0ea2 MIPS: SGI-IP30: Remove R5432_CP0_INTER=
RUPT_WAR from war.h)
CONFLICT (content): Merge conflict in arch/mips/loongson2ef/Kconfig
Merging nds32/next (d785c5a324cd nds32: configs: Cleanup CONFIG_CROSS_COMPI=
LE)
Merging nios2/for-next (0ec8a5054d7f MAINTAINERS: Remove nios2-dev@lists.ro=
cketboards.org)
Merging openrisc/for-next (9737e2c5f0bc openrisc: Remove obsolete show_trac=
e_task function)
Merging parisc-hd/for-next (b6522fa409cf parisc: add sysctl file interface =
panic_on_stackoverflow)
Merging powerpc/next (30df74d67d48 powerpc/watchpoint/xmon: Support 2nd DAW=
R)
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
Merging sparc-next/master (0a2576dae032 oradax: convert get_user_pages() --=
> pin_user_pages())
Merging uml/linux-next (2e27d33d22af um: Fix typo in vector driver transpor=
t option definition)
Merging xtensa/xtensa-for-next (70cbddb97385 arch/xtensa: fix grammar in Kc=
onfig help text)
Merging fscrypt/master (0e698dfa2822 Linux 5.7-rc4)
Merging afs/afs-next (4fe171bb81b1 afs: Remove set but not used variable 'r=
et')
Merging btrfs/for-next (3ade84b69d56 Merge branch 'for-next-next-v5.7-20200=
515' into for-next-20200515)
Merging ceph/master (12ae44a40a1b ceph: demote quotarealm lookup warning to=
 a debug message)
Merging cifs/for-next (ed5bfc1f82a2 cifs: handle "nolease" option for vers=
=3D1.0)
Merging configfs/for-next (8aebfffacfa3 configfs: fix config_item refcnt le=
ak in configfs_rmdir())
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (8f3d9f354286 Linux 5.7-rc1)
Merging exfat/dev (69eca64b2fc2 exfat: replace 'time_ms' with 'time_cs')
Merging ext3/for_next (a32f0ecd79b4 Merge fanotify fix from Nathan Chancell=
or.)
Merging ext4/dev (907ea529fc4c ext4: convert BUG_ON's to WARN_ON's in mball=
oc.c)
Merging f2fs/dev (9c30df7c5a30 f2fs: flush dirty meta pages when flushing t=
hem)
Merging fsverity/fsverity (0e698dfa2822 Linux 5.7-rc4)
Merging fuse/for-next (75d892588e95 fuse: Update stale comment in queue_int=
errupt())
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (8eed292bc8cb NFSv3: fix rpc receive buffer size for=
 MOUNT call)
Merging nfs-anna/linux-next (55dee1bc0d72 nfs: add minor version to nfs_ser=
ver_key for fscache)
Merging nfsd/nfsd-next (746c6237ece6 sunrpc: add missing newline when print=
ing parameter 'pool_mode' by sysfs)
Merging orangefs/for-next (aa317d3351de orangefs: clarify build steps for t=
est server in orangefs.txt)
Merging overlayfs/overlayfs-next (144da23beab8 ovl: return required buffer =
size for file handles)
Merging ubifs/linux-next (0e7572cffe44 ubi: Fix seq_file usage in detailed_=
erase_block_info debugfs file)
Merging v9fs/9p-next (c6f141412d24 9p: document short read behaviour with O=
_NONBLOCK)
Merging xfs/for-next (508578f2f560 xfs: Use the correct style for SPDX Lice=
nse Identifier)
Merging zonefs/for-next (568776f992c4 zonefs: Replace uuid_copy() with impo=
rt_uuid())
Merging iomap/iomap-for-next (b75dfde12129 fibmap: Warn and return an error=
 in case of block > INT_MAX)
Merging djw-vfs/vfs-for-next (2c567af418e3 fs: Introduce DCACHE_DONTCACHE)
Merging file-locks/locks-next (dbdaf6a3250b locks: reinstate locks_delete_b=
lock optimization)
Merging vfs/for-next (d6de0fcfaa99 Merge branch 'from-miklos' into for-next)
CONFLICT (content): Merge conflict in kernel/sysctl.c
CONFLICT (modify/delete): arch/mips/lasat/sysctl.c deleted in HEAD and modi=
fied in vfs/for-next. Version vfs/for-next of arch/mips/lasat/sysctl.c left=
 in tree.
$ git rm -f arch/mips/lasat/sysctl.c
Merging printk/for-next (d34f14ae521f Merge branch 'for-5.7-preferred-conso=
le' into for-next)
Merging pci/next (30370da5c805 Merge branch 'remotes/lorenzo/pci/v3-semi')
CONFLICT (content): Merge conflict in drivers/pci/quirks.c
Merging pstore/for-next/pstore (dcaa1e76b774 mtd: Support kmsg dumper based=
 on pstore/blk)
Merging hid/for-next (6ab875d19f3b Merge branch 'for-5.7/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (41895bfee70e Merge branch 'i2c/for-current-fixed'=
 into i2c/for-next)
Merging i3c/i3c/next (b4203ce05563 i3c master: GETMRL's 3rd byte is optiona=
l even with BCR_IBI_PAYLOAD)
Merging dmi/master (8cf87c744696 firmware/dmi: Report DMI Bios & EC firmwar=
e release)
Merging hwmon-staging/hwmon-next (9b7f228e84ed hwmon: (lm90) Add max6654 su=
pport to lm90 driver)
Merging jc_docs/docs-next (fdb1b5e08929 Revert "docs: sysctl/kernel: docume=
nt ngroups_max")
CONFLICT (content): Merge conflict in Documentation/arm64/booting.rst
CONFLICT (content): Merge conflict in Documentation/arm64/amu.rst
Merging v4l-dvb/master (ad3a44cbd1b2 media: i2c: imx219: Parse and register=
 properties)
Merging v4l-dvb-next/master (54ecb8f7028c Linux 5.4-rc1)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (478d8912f6a3 Merge branches 'powercap' and 'pnp' int=
o linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (6cc3d0e9a097 cpufreq: tegra186:=
 add CPUFREQ_NEED_INITIAL_FREQ_CHECK flag)
Merging cpupower/cpupower (7b0bf99b9ee4 cpupower: Remove unneeded semicolon)
Merging opp/opp/linux-next (ce72229606a5 opp: core: add regulators enable a=
nd disable)
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
Merging rdma/for-next (f11e0ec55f0c MAINTAINERS: Add maintainers for RNBD/R=
TRS modules)
CONFLICT (content): Merge conflict in drivers/net/ethernet/mellanox/mlx5/co=
re/steering/dr_send.c
Merging net-next/master (5cdfe8306631 r8169: work around an irq coalescing =
related tx timeout)
Merging bpf-next/master (96586dd9268d bpf: Selftests, add ktls tests to tes=
t_sockmap)
Merging ipsec-next/master (7d4343d501f9 xfrm: fix unused variable warning i=
f CONFIG_NETFILTER=3Dn)
CONFLICT (content): Merge conflict in net/ipv6/xfrm6_output.c
CONFLICT (content): Merge conflict in net/ipv6/af_inet6.c
CONFLICT (content): Merge conflict in net/ipv4/xfrm4_output.c
Applying: xfrm: merge fixup for "remove output_finish indirection from xfrm=
_state_afinfo"
Merging mlx5-next/mlx5-next (ecf814e0e19b net/mlx5: Add support for RDMA TX=
 FT headers modifying)
Merging netfilter-next/master (dbfe7d74376e rds: convert get_user_pages() -=
-> pin_user_pages())
Merging ipvs-next/master (d54725cd11a5 netfilter: nf_tables: support for mu=
ltiple devices per netdev hook)
Merging wireless-drivers-next/master (b0a4bb7693be rtlwifi: rtl8192ee: remo=
ve redundant for-loop)
Merging bluetooth/master (a228f7a41029 Bluetooth: hci_qca: Enable WBS suppo=
rt for wcn3991)
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
Merging crypto/master (2c959a33f863 crypto: hisilicon/zip - Use temporary s=
qe when doing work)
CONFLICT (content): Merge conflict in crypto/xts.c
CONFLICT (content): Merge conflict in crypto/lrw.c
Merging drm/drm-next (1493bddcca4d Merge tag 'drm-misc-next-2020-05-14' of =
git://anongit.freedesktop.org/drm/drm-misc into drm-next)
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
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dcn21/=
dcn21_resource.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/core/d=
c_link_dp.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_kms=
.c
Merging amdgpu/drm-next (78046a887686 drm/amdgpu: add apu flags)
Merging drm-intel/for-linux-next (cba597ac4517 drm/i915/display: Return err=
or from dbuf allocation failure)
Merging drm-tegra/drm/tegra/for-next (f923db184ca3 gpu: host1x: Clean up de=
bugfs in error handling path)
Merging drm-misc/for-linux-next (5bebaeadb30e drm/bridge: ti-sn65dsi86: Imp=
lement lane reordering + polarity)
Merging drm-msm/msm-next (d3b68ddf1d38 drm/msm/a4xx: add a405_registers for=
 a405 device)
Applying: drm/msm/dpu: fix up u64/u32 division for 32 bit architectures
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (2c76b324c794 drm/imx: parallel-display: Adjus=
t bus_flags handling)
Merging etnaviv/etnaviv/next (f232d9ec029c drm/etnaviv: fix TS cache flushi=
ng on GPUs with BLT engine)
Merging regmap/for-next (6c9147d991fb Merge remote-tracking branch 'regmap/=
for-5.8' into regmap-next)
Merging sound/for-next (b9f2d35f0530 ALSA: hda: Unexport some local helper =
functions)
Merging sound-asoc/for-next (0c111965c32c Merge remote-tracking branch 'aso=
c/for-5.8' into asoc-next)
Merging modules/modules-next (5c3a7db0c7ec module: Harden STRICT_MODULE_RWX)
Merging input/next (918e2844d940 Input: elants - refactor elants_i2c_execut=
e_command())
Merging block/for-next (a3abcba6e2c2 Merge branch 'for-5.8/io_uring' into f=
or-next)
Merging device-mapper/for-next (81a3a1453ec4 dm zoned: Avoid 64-bit divisio=
n error in dmz_fixup_devices)
Merging pcmcia/pcmcia-next (46d079790663 pcmcia: make pccard_loop_tuple() s=
tatic)
Merging mmc/next (50e41371f66e Merge branch 'fixes' into next)
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (6130fbfa94be mfd: intel-lpss: Update LPSS UART #2=
 PCI ID for Jasper Lake)
Merging backlight/for-backlight-next (479da1f538a2 backlight: Add backlight=
_device_get_by_name())
Merging battery/for-next (eda8ffcc5edf dt-bindings: power: Convert bq27xxx =
dt to yaml)
Merging regulator/for-next (33fdc0fcaafa Merge remote-tracking branch 'regu=
lator/for-5.8' into regulator-next)
Merging security/next-testing (60cf7c5ed5f7 lockdown: Allow unprivileged us=
ers to see lockdown status)
Merging apparmor/apparmor-next (e37986097ba6 apparmor: Use true and false f=
or bool variable)
Merging integrity/next-integrity (0c4395fb2aa7 evm: Fix possible memory lea=
k in evm_calc_hmac_or_hash())
Merging keys/keys-next (85e2de360ac2 KEYS: Replace zero-length array with f=
lexible-array)
Merging selinux/next (fe5a90b8c149 selinux: netlabel: Remove unused inline =
function)
Merging smack/next (ef26650a201f Smack: Remove unused inline function smk_a=
d_setfield_u_fs_path_mnt)
Merging tomoyo/master (27acbf41be39 tomoyo: use true for bool variable)
Merging tpmdd/next (47c18d91f4ad tpm: eventlog: Replace zero-length array w=
ith flexible-array member)
Merging watchdog/master (152036d1379f Merge tag 'nfsd-5.7-rc-2' of git://gi=
t.linux-nfs.org/projects/cel/cel-2.6)
Merging iommu/next (26d2ceb4ab6b Merge branches 'iommu/fixes', 'arm/msm', '=
arm/allwinner', 'x86/vt-d' and 'x86/amd' into next)
CONFLICT (content): Merge conflict in drivers/iommu/s390-iommu.c
Merging vfio/next (f44efca0493d vfio: Ignore -ENODEV when getting MSI cooki=
e)
Merging audit/next (0090c1edebf4 audit: Replace zero-length array with flex=
ible-array)
Merging devicetree/for-next (59ffe4ed0725 dt-bindings: ehci/ohci: Allow iom=
mus property)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/net=
/qcom,ipa.yaml
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/dis=
play/panel/panel-common.yaml
Merging mailbox/mailbox-for-next (0a67003b1985 mailbox: imx: add SCU MU sup=
port)
Merging spi/for-next (81919bfd45ed Merge remote-tracking branch 'spi/for-5.=
8' into spi-next)
Merging tip/auto-latest (bba413deb106 Merge branch 'core/core')
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_dp_mst_topology.c
Merging clockevents/timers/drivers/next (4c2fe4d88a8d Merge branch 'timers/=
drivers/timer-ti' into timers/drivers/next)
Merging edac/edac-for-next (dc63e28efa19 Merge branch 'edac-i10nm' into eda=
c-for-next)
Merging irqchip/irq/irqchip-next (f068a62c548c irqchip/gic-v3-its: Balance =
initial LPI affinity across CPUs)
Merging ftrace/for-next (d013496f99c5 tracing: Convert local functions in t=
racing_map.c to static)
Merging rcu/rcu/next (68cd9f4e7238 tick/nohz: Narrow down noise while setti=
ng current task's tick dependency)
CONFLICT (content): Merge conflict in arch/powerpc/kernel/traps.c
Merging kvm/linux-next (cb953129bfe5 kvm: add halt-polling cpu usage stats)
CONFLICT (content): Merge conflict in arch/x86/kvm/svm/svm.c
Merging kvm-arm/next (5107000faa6e KVM: arm64: Make KVM_CAP_MAX_VCPUS compa=
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
Merging drivers-x86/for-next (f441d66a6ee9 platform/x86: dell-wmi: Ignore k=
eyboard attached / detached events)
Merging chrome-platform/for-next (bbb7ad49b835 platform/chrome: cros_usbpd_=
logger: Add __printf annotation to append_str())
CONFLICT (content): Merge conflict in drivers/platform/chrome/chromeos_psto=
re.c
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (c85c7cdef3c9 leds: trigger: remove redundant assignm=
ent to variable ret)
Merging ipmi/for-next (e641abd3c726 Try to load acpi_ipmi when an SSIF ACPI=
 IPMI interface is added)
Merging driver-core/driver-core-next (93d2e4322aa7 of: platform: Batch fwno=
de parsing when adding all top level devices)
Merging usb/usb-next (16bdc04cc98a usb/ehci-platform: Set PM runtime as act=
ive on resume)
Merging usb-gadget/next (4a5dbd900957 dt-bindings: usb: add documentation f=
or aspeed usb-vhub)
Merging usb-serial/usb-next (986c1748c84d USB: serial: usb_wwan: do not res=
ubmit rx urb on fatal errors)
Merging usb-chipidea-next/ci-for-usb-next (6dbbbccdba61 usb: chipidea: Enab=
le user-space triggered role-switching)
Merging phy-next/next (d30b16a556b6 phy: qcom-qmp: Add QMP V3 USB3 PHY supp=
ort for SC7180)
Merging tty/tty-next (b14109f302d0 tty: serial: fsl_lpuart: Use __maybe_unu=
sed instead of #if CONFIG_PM_SLEEP)
Merging char-misc/char-misc-next (57c76221d5af w1_therm: adding bulk read s=
upport to trigger multiple conversion on bus)
Merging extcon/extcon-next (6581cc1b6221 extcon: adc-jack: Fix an error han=
dling path in 'adc_jack_probe()')
Merging soundwire/next (26d970225d87 soundwire: master: add runtime pm supp=
ort)
Merging thunderbolt/next (eb4a6de4962e thunderbolt: Update Kconfig to allow=
 building on other architectures.)
Merging staging/staging-next (cef077e6aa4c Merge tag 'iio-for-5.8b' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-next)
Merging mux/for-next (f356d58c3a04 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (b35da2e86f25 Merge branch 'icc-get-by-index' into icc=
-next)
Merging slave-dma/next (be4cf718cd99 dmaengine: imx-sdma: initialize all sc=
ript addresses)
Merging cgroup/for-next (eec8fd0277e3 device_cgroup: Cleanup cgroup eBPF de=
vice filter code)
Merging scsi/for-next (8833ab64899e Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (f48b285ae658 scsi: ufs-mediatek: Customize Write=
Booster flush policy)
Merging vhost/linux-next (bf338dcc28f3 virtio_net: CTRL_GUEST_OFFLOADS depe=
nds on CTRL_VQ)
Merging rpmsg/for-next (4b53f1435f9d Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (a3bc02eb6fe3 Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (3831c051dfbf tools: gpio: add bias flags t=
o lsgpio)
Merging gpio-intel/for-next (7e73aa90a38c gpio: merrifield: Better show how=
 GPIO and IRQ bases are derived from hardware)
Merging pinctrl/for-next (c22ea274178f Merge branch 'devel' into for-next)
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
Merging livepatching/for-next (8631420cac7d Merge branch 'for-5.8/klp-modul=
e-fixups' into for-next)
CONFLICT (content): Merge conflict in kernel/module.c
Merging coresight/next (35cfcf2c7a46 coresight: cti: Add CPU idle pm notife=
r to CTI devices)
Merging rtc/rtc-next (378252b6e24f rtc: ingenic: Reset regulator register i=
n probe)
Merging nvdimm/libnvdimm-for-next (f6d2b802f80d Merge branch 'for-5.7/libnv=
dimm' into libnvdimm-for-next)
Merging at24/at24/for-next (8f3d9f354286 Linux 5.7-rc1)
Merging ntb/ntb-next (1b3fb49ac27b NTB: ntb_test: Fix bug when counting rem=
ote files)
Merging kspp/for-next/kspp (c7527373fe28 gcc-common.h: Update for GCC 10)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (9b5816b56af6 gnss: replace zero-length array with f=
lexible-array)
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
Merging kgdb/kgdb/for-next (3dc6a1ac3f70 serial: amba-pl011: Support kgdboc=
_earlycon)
$ git reset --hard HEAD^
Merging next-20200518 version of kgdb
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
Merging trivial/for-next (c1a371cf80fb printk: fix global comment)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (3781a7a11294 bus: mhi: core: Handle syserr during pow=
er_up)
Merging notifications/notifications-pipe-core (0c5c93119aa0 watch_queue: sa=
mple: Display superblock notifications)
CONFLICT (content): Merge conflict in samples/Makefile
CONFLICT (content): Merge conflict in samples/Kconfig
CONFLICT (content): Merge conflict in include/uapi/asm-generic/unistd.h
CONFLICT (content): Merge conflict in fs/splice.c
CONFLICT (content): Merge conflict in fs/mount.h
CONFLICT (content): Merge conflict in fs/io_uring.c
CONFLICT (content): Merge conflict in arch/xtensa/kernel/syscalls/syscall.t=
bl
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_64.tbl
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_32.tbl
CONFLICT (content): Merge conflict in arch/sparc/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/sh/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/s390/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/powerpc/kernel/syscalls/syscall.=
tbl
CONFLICT (content): Merge conflict in arch/parisc/kernel/syscalls/syscall.t=
bl
CONFLICT (content): Merge conflict in arch/mips/kernel/syscalls/syscall_o32=
.tbl
CONFLICT (content): Merge conflict in arch/mips/kernel/syscalls/syscall_n64=
.tbl
CONFLICT (content): Merge conflict in arch/mips/kernel/syscalls/syscall_n32=
.tbl
CONFLICT (content): Merge conflict in arch/microblaze/kernel/syscalls/sysca=
ll.tbl
CONFLICT (content): Merge conflict in arch/m68k/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/ia64/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/arm64/include/asm/unistd32.h
CONFLICT (content): Merge conflict in arch/arm64/include/asm/unistd.h
CONFLICT (content): Merge conflict in arch/arm/tools/syscall.tbl
CONFLICT (content): Merge conflict in arch/alpha/kernel/syscalls/syscall.tbl
Merging fsinfo/fsinfo-core (702c6a07c77e fsinfo: Add an attribute that list=
s all the visible mounts in a namespace)
CONFLICT (content): Merge conflict in samples/vfs/Makefile
CONFLICT (content): Merge conflict in arch/xtensa/kernel/syscalls/syscall.t=
bl
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_64.tbl
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_32.tbl
CONFLICT (content): Merge conflict in arch/sparc/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/sh/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/s390/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/powerpc/kernel/syscalls/syscall.=
tbl
CONFLICT (content): Merge conflict in arch/parisc/kernel/syscalls/syscall.t=
bl
CONFLICT (content): Merge conflict in arch/mips/kernel/syscalls/syscall_o32=
.tbl
CONFLICT (content): Merge conflict in arch/mips/kernel/syscalls/syscall_n64=
.tbl
CONFLICT (content): Merge conflict in arch/mips/kernel/syscalls/syscall_n32=
.tbl
CONFLICT (content): Merge conflict in arch/microblaze/kernel/syscalls/sysca=
ll.tbl
CONFLICT (content): Merge conflict in arch/m68k/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/ia64/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/arm/tools/syscall.tbl
CONFLICT (content): Merge conflict in arch/alpha/kernel/syscalls/syscall.tbl
Applying: extra syscall updates
Merging akpm-current/current (e051d3cd65e7 ipc-convert-ipcs_idr-to-xarray-u=
pdate-fix)
CONFLICT (content): Merge conflict in tools/testing/selftests/vm/Makefile
CONFLICT (content): Merge conflict in kernel/kprobes.c
CONFLICT (content): Merge conflict in include/linux/sched.h
CONFLICT (content): Merge conflict in include/linux/printk.h
CONFLICT (content): Merge conflict in include/linux/binfmts.h
CONFLICT (content): Merge conflict in arch/x86/Kconfig.debug
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
CONFLICT (content): Merge conflict in arch/arm64/Kconfig
CONFLICT (content): Merge conflict in Makefile
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (5a3b590e2e7b drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/7UB6n4i.gygcVS.v_KtJXdd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7EH4oACgkQAVBC80lX
0Gx01Qf/T9K65lNF/WWkyCTcbxuLRXnKEzvMW+CvVtrCvI0E2ebMGImayCbkGKwi
SMGX6G9RAVBtlTJhLUoyTTJeoCrhYh0sKheDyeFmGYHea+e3dyjYV2//c5JC3RG1
vHr3EV/FSNdjhoZJfD54b6bsNY0zi6GlArxtwuIS/V71FQHvc5cEDWtQJqaFRMQZ
AuzUt3SW8bweOBRDl+Bdt0aIuzQXbVMvI/NetogC8K/72Z9vGsrz5uv5aUHjiqiA
nTnkdxW9129DaRFt2hydUDRVEflf+nNKbPQc+2HE2pXNoP/bikgo+1PYszV0x+3T
LEtm2mHKza3s7iP/Dh7XnzdM8nSZgA==
=SAHk
-----END PGP SIGNATURE-----

--Sig_/7UB6n4i.gygcVS.v_KtJXdd--
