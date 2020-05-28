Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA9651E5D65
	for <lists+linux-next@lfdr.de>; Thu, 28 May 2020 12:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387924AbgE1KuS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 May 2020 06:50:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387937AbgE1KuG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 May 2020 06:50:06 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7F7EC05BD1E;
        Thu, 28 May 2020 03:50:03 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Xkx44gP4z9sRY;
        Thu, 28 May 2020 20:50:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590663000;
        bh=cF7x573Sy7jcooFNYXsiPHwS/xUdEvTfxNWSkO4XMgs=;
        h=Date:From:To:Cc:Subject:From;
        b=U0DRQIBPEGwVZ67qag0XZdlaP91hbxGsMoJeuzSXW5kGSMkYDszpGuNiK5oKimLPZ
         W20B8YBNl4Lauoni5cg/GVYIER5I8PV9AG/F6PwSLkzxxOzLAE3y47UJF+VtF5iZVW
         lZSENuYH6Z8KiQa8zxEASoRB8RCJmLtTSYZMNSyH0x5tTjRWZP6rDM5yRx997XUiQ0
         Mirs5sN60muudpymiApPhwu8pCI9Q5NQRHGJoLnJ2LBU3W85PoK8BFmCglRLUa3Cvz
         /6bC3HhVj/HPv4LfjKxQmhSTcCY3Yr1sE9zSFWRAsNJCInQ4nGF6mLA1m4/Qhm+v5M
         5XEYCfyImOWQg==
Date:   Thu, 28 May 2020 20:49:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 28
Message-ID: <20200528204959.220b1736@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.fvh9sY127.vtkmjdr1up+i";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.fvh9sY127.vtkmjdr1up+i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20200526:

My fixes tree contains:

  cd2b06ec45d6 ("device_cgroup: Fix RCU list debugging warning")

The arm tree gained a conflict against Linus' tree.

The drm-msm tree still had its build failure so I applied a patch.

The rcu tree gained a build failure for which I applied a patch.

The devicetree tree gained a conflict against the nand tree.

The usb tree gained a conflict against the devicetree tree.

The akpm-current tree gained conflicts against the mips and rsic-v trees.

The akpm tree gained a semantic conflict against the amdgpu tree.

Non-merge commits (relative to Linus' tree): 12276
 12802 files changed, 724705 insertions(+), 206422 deletions(-)

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

I am currently merging 324 trees (counting Linus' and 82 trees of bug
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
Merging origin/master (b0c3ba31be3e Merge tag 'fsnotify_for_v5.7-rc8' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs)
Merging fixes/master (cd2b06ec45d6 device_cgroup: Fix RCU list debugging wa=
rning)
Merging kbuild-current/fixes (6a8b55ed4056 Linux 5.7-rc3)
Merging arc-current/for-curr (9d9368e839c2 ARC: [arcompact] fix bitrot with=
 2 levels of interrupt)
Merging arm-current/fixes (3866f217aaa8 ARM: 8977/1: ptrace: Fix mask for t=
humb breakpoint hook)
Merging arm-soc-fixes/arm/fixes (99706d62fb50 Merge tag 'omap-for-v5.7/cpsw=
-fixes-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linu=
x-omap into arm/fixes)
Merging uniphier-fixes/fixes (0e698dfa2822 Linux 5.7-rc4)
Merging arm64-fixes/for-next/fixes (8cfb347ad0cf arm64: Add get_user() type=
 annotation on the !access_ok() path)
Merging m68k-current/for-linus (86cded5fc525 m68k: defconfig: Update defcon=
figs for v5.6-rc4)
Merging powerpc-fixes/fixes (595d153dd102 powerpc/64s: Fix restore of NV GP=
Rs after facility unavailable exception)
Merging s390-fixes/fixes (4c1cbcbd6c56 s390/kaslr: add support for R_390_JM=
P_SLOT relocation type)
Merging sparc/master (fcdf818d239e Merge branch 'sparc-scnprintf')
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (183be6f967fe net: dsa: felix: send VLANs on CPU port as=
 egress-tagged)
Merging bpf/master (b16a87d0aef7 xsk: Add overflow check for u64 division, =
stored into u32)
Merging ipsec/master (3ffb93ba326f esp4: improve xfrm4_beet_gso_segment() t=
o be more readable)
Merging netfilter/master (4946ea5c1237 netfilter: nf_conntrack_pptp: fix co=
mpilation warning with W=3D1 build)
Merging ipvs/master (0141317611ab Merge branch 'hns3-fixes')
Merging wireless-drivers/master (f92f26f2ed2c iwlwifi: pcie: handle QuZ con=
figs with killer NICs as well)
Merging mac80211/master (a4976a3ef844 crypto: chelsio/chtls: properly set t=
p->lsndtime)
Merging rdma-fixes/for-rc (c85f4abe66be RDMA/core: Fix double destruction o=
f uobject)
Merging sound-current/for-linus (630e36126e42 ALSA: hda/realtek - Add new c=
odec supported for ALC287)
Merging sound-asoc-fixes/for-linus (df96c4beb7c4 Merge remote-tracking bran=
ch 'asoc/for-5.7' into asoc-linus)
Merging regmap-fixes/for-linus (cef570d20922 Merge remote-tracking branch '=
regmap/for-5.7' into regmap-linus)
Merging regulator-fixes/for-linus (a8526ae95e09 Merge remote-tracking branc=
h 'regulator/for-5.7' into regulator-linus)
Merging spi-fixes/for-linus (e5f74f67da3d Merge remote-tracking branch 'spi=
/for-5.7' into spi-linus)
Merging pci-current/for-linus (ef46738cc47a MAINTAINERS: Add Rob Herring an=
d remove Andy Murray as PCI reviewers)
Merging driver-core.current/driver-core-linus (9cb1fd0efd19 Linux 5.7-rc7)
Merging tty.current/tty-linus (9cb1fd0efd19 Linux 5.7-rc7)
Merging usb.current/usb-linus (b9bbe6ed63b2 Linux 5.7-rc6)
Merging usb-gadget-fixes/fixes (172b14b48ca1 usb: cdns3: gadget: make a bun=
ch of functions static)
Merging usb-serial-fixes/usb-linus (399ad9477c52 USB: serial: option: add T=
elit LE910C1-EUX compositions)
Merging usb-chipidea-fixes/ci-for-usb-stable (b3f3736ac305 usb: chipidea: m=
sm: Ensure proper controller reset using role switch API)
Merging phy/fixes (820eeb9de62f phy: qualcomm: usb-hs-28nm: Prepare clocks =
in init)
Merging staging.current/staging-linus (9cb1fd0efd19 Linux 5.7-rc7)
Merging char-misc.current/char-misc-linus (9cb1fd0efd19 Linux 5.7-rc7)
Merging soundwire-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging thunderbolt-fixes/fixes (9cb1fd0efd19 Linux 5.7-rc7)
Merging input-current/for-linus (642aa86eaf8f Input: synaptics - add a seco=
nd working PNP_ID for Lenovo T470s)
Merging crypto-current/master (a9a8ba90fa58 crypto: arch/nhpoly1305 - proce=
ss in explicit 4k chunks)
Merging ide/master (63bef48fd6c9 Merge branch 'akpm' (patches from Andrew))
Merging vfio-fixes/for-linus (5cbf3264bc71 vfio/type1: Fix VA->PA translati=
on for PFNMAP VMAs in vaddr_get_pfn())
Merging kselftest-fixes/fixes (851c4df54dc1 selftests/lkdtm: Use grep -E in=
stead of egrep)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging slave-dma-fixes/fixes (3a5fd0dbd878 dmaengine: tegra210-adma: Fix a=
n error handling path in 'tegra_adma_probe()')
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (f3a6a6c5e0f5 mtd:rawnand: brcmnand: Fix PM res=
ume crash)
Merging mfd-fixes/for-mfd-fixes (603d9299da32 mfd: mt6397: Fix probe after =
changing mt6397-core)
Merging v4l-dvb-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (8f3d9f354286 Linux 5.7-rc1)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (98ece19f2471 soc: ti: omap-prm: use atomic iopoll=
 instead of sleeping one)
Merging kvm-fixes/master (e7581caca4c1 KVM: x86: simplify is_mmio_spte)
Merging kvms390-fixes/master (5615e74f48dc KVM: s390: Remove false WARN_ON_=
ONCE for the PQAP instruction)
Merging hwmon-fixes/hwmon (b9bbe6ed63b2 Linux 5.7-rc6)
Merging nvdimm-fixes/libnvdimm-fixes (f84afbdd3a9e libnvdimm: Out of bounds=
 read in __nd_ioctl())
Merging btrfs-fixes/next-fixes (4f28062adf92 Merge branch 'misc-5.7' into n=
ext-fixes)
Merging vfs-fixes/fixes (9e4636545933 copy_xstate_to_kernel(): don't leave =
parts of destination uninitialized)
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
Merging drm-fixes/drm-fixes (9cb1fd0efd19 Linux 5.7-rc7)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (00febf644648 drm/i915/gt: Inc=
orporate the virtual engine into timeslicing)
Merging mmc-fixes/fixes (202500d21654 mmc: block: Fix use-after-free issue =
for rpmb)
Merging rtc-fixes/rtc-fixes (8f3d9f354286 Linux 5.7-rc1)
Merging gnss-fixes/gnss-linus (2ef96a5bb12b Linux 5.7-rc5)
Merging hyperv-fixes/hyperv-fixes (38dce4195f0d x86/hyperv: Properly suspen=
d/resume reenlightenment notifications)
Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq h=
andlers after dpio create)
Merging risc-v-fixes/fixes (8356c379cfba RISC-V: gp_in_global needs registe=
r keyword)
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
Merging kspp-gustavo/for-next/kspp (c27cd1c3b919 treewide: Replace zero-len=
gth array with flexible-array)
Merging kbuild/for-next (18fed02fb59c Merge branch 'kconfig' into for-next)
Merging compiler-attributes/compiler-attributes (98d54f81e36b Linux 5.6-rc4)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (94d1aed9f477 Merge branch 'dma-sg_table-helpe=
r' into dma-mapping-for-next)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (03c7f5f0b844 Merge branches 'fixes' and 'misc' into f=
or-next)
CONFLICT (content): Merge conflict in arch/arm/boot/compressed/head.S
Merging arm64/for-next/core (f58a309873ab Merge branch 'for-next/scs' into =
for-next/core)
Merging arm-perf/for-next/perf (10f6cd2af21b pmu/smmuv3: Clear IRQ affinity=
 hint on device removal)
Merging arm-soc/for-next (8c8811c87de7 soc: document merges)
Merging amlogic/for-next (9233c526bc0e Merge branch 'v5.8/defconfig' into t=
mp/aml-rebuild)
Merging aspeed/for-next (fa4c8ec6feaa ARM: dts: aspeed: Change KCS nodes to=
 v2 binding)
Merging at91/at91-next (ec539e70d882 Merge branches 'at91-soc', 'at91-dt' a=
nd 'at91-defconfig' into at91-next)
Merging imx-mxs/for-next (0414897ac89f Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (560b4d4691b0 Merge branch 'for_5.7/keystone-dts' int=
o next)
Merging mediatek/for-next (93fb92576566 Merge branch 'v5.7-next/soc' into f=
or-next)
Merging mvebu/for-next (869da228bd45 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (712c602893d7 Merge branch 'fixes' into for-next)
Merging qcom/for-next (98cfcf1a9c54 Merge branches 'arm64-defconfig-for-5.8=
', 'arm64-for-5.8', 'drivers-for-5.8' and 'dts-for-5.8' into for-next)
Merging raspberrypi/for-next (f5e216e42689 ARM: dts: bcm283x: Use firmware =
PM driver for V3D)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (1bd79704bee2 Merge branch 'renesas-dt-bindings-for-v5=
.8' into renesas-next)
Merging reset/reset/next (a6138255cc91 dt-bindings: reset: Convert i.MX7 re=
set to json-schema)
Merging rockchip/for-next (8a66d46f4035 Merge branch 'v5.8-armsoc/dts64' in=
to for-next)
Merging samsung-krzk/for-next (4f9340b8148f Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (9cb1fd0efd19 Linux 5.7-rc7)
Merging sunxi/sunxi/for-next (243cd8fba48d Merge branch 'sunxi/dt-for-5.8' =
into sunxi/for-next)
Merging tegra/for-next (cd049d898ab8 Merge branch for-5.8/arm64/dt into for=
-next)
Merging ti-k3/ti-k3-next (cae809434da1 arm64: dts: ti: k3-j721e-main: Add m=
ain domain watchdog entries)
Merging uniphier/for-next (0e698dfa2822 Linux 5.7-rc4)
Merging clk/clk-next (633ec72caf36 Merge branch 'clk-ast2600' into clk-next)
Merging clk-samsung/for-next (25bdae0f1c66 clk: samsung: exynos5433: Add IG=
NORE_UNUSED flag to sclk_i2s1)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (56defdeb0cdb csky: Fixup CONFIG_DEBUG_RSEQ)
Merging h8300/h8300-next (beab3d5cb0e1 irq-renesas-h8s: Fix external interr=
upt control.)
Merging ia64/next (172e7890406d tty/serial: cleanup after ioc*_serial drive=
r removal)
Merging m68k/for-next (3381df095419 m68k: tools: Replace zero-length array =
with flexible-array member)
Merging m68knommu/for-next (bf4ae088cc90 m68k: Drop CONFIG_MTD_M25P80 in st=
mark2_defconfig)
Merging microblaze/next (8f3d9f354286 Linux 5.7-rc1)
Merging mips/mips-next (7d6d28377783 MIPS: Loongson64: select NO_EXCEPT_FIL=
L)
CONFLICT (content): Merge conflict in arch/mips/loongson2ef/Kconfig
CONFLICT (content): Merge conflict in arch/mips/include/asm/module.h
Applying: mips: vermagic updates
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
Merging soc-fsl/next (e9e4ef9116b1 soc: fsl: dpio: Remove unused inline fun=
ction qbman_write_eqcr_am_rt_register)
Merging risc-v/for-next (b151fefd23b7 riscv: sort select statements alphanu=
merically)
Merging sifive/for-next (467e050e9760 Merge branch 'i2c/for-current' of git=
://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging s390/features (a999eb96fdd4 s390/pci: ioremap() align with generic =
code)
Merging sh/sh-next (a193018e5290 sh: add missing EXPORT_SYMBOL() for __dela=
y)
Merging sparc-next/master (0a2576dae032 oradax: convert get_user_pages() --=
> pin_user_pages())
Merging uml/linux-next (2e27d33d22af um: Fix typo in vector driver transpor=
t option definition)
Merging xtensa/xtensa-for-next (3ead2f97bd44 xtensa: Fix spelling/grammar i=
n comment)
Merging fscrypt/master (e3b1078bedd3 fscrypt: add support for IV_INO_LBLK_3=
2 policies)
Merging afs/afs-next (4fe171bb81b1 afs: Remove set but not used variable 'r=
et')
Merging btrfs/for-next (fae04e8dfe63 Merge branch 'for-next-next-v5.7-20200=
527' into for-next-20200527)
Merging ceph/master (fb33c114d3ed ceph: flush release queue when handling c=
aps for unknown inode)
Merging cifs/for-next (d67f4b0fe182 cifs: remove redundant initialization o=
f variable rc)
Merging configfs/for-next (8aebfffacfa3 configfs: fix config_item refcnt le=
ak in configfs_rmdir())
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (8f3d9f354286 Linux 5.7-rc1)
Merging exfat/dev (4c4dbb6ad8e8 exfat: replace 'time_ms' with 'time_cs')
Merging ext3/for_next (16ec8bfe257b Pull ext2 xattr cleanups.)
Merging ext4/dev (875145e32887 Merge branch 'fiemap-fixes' into dev)
CONFLICT (content): Merge conflict in fs/ext4/super.c
Merging f2fs/dev (b96890ea2cde f2fs: remove unneeded return value of __inse=
rt_discard_tree())
CONFLICT (content): Merge conflict in fs/f2fs/f2fs.h
Merging fsverity/fsverity (9cd6b593cfc9 fs-verity: remove unnecessary exter=
n keywords)
Merging fuse/for-next (9b46418c40fe fuse: copy_file_range should truncate c=
ache)
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (9cb1fd0efd19 Linux 5.7-rc7)
Merging nfs-anna/linux-next (7c777935018d SUNRPC: rpc_xprt lifetime events =
should record xprt->state)
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
Merging xfs/for-next (6dcde60efd94 xfs: more lockdep whackamole with kmem_a=
lloc*)
Merging zonefs/for-next (568776f992c4 zonefs: Replace uuid_copy() with impo=
rt_uuid())
Merging iomap/iomap-for-next (b75dfde12129 fibmap: Warn and return an error=
 in case of block > INT_MAX)
Merging djw-vfs/vfs-for-next (2c567af418e3 fs: Introduce DCACHE_DONTCACHE)
Merging file-locks/locks-next (dbdaf6a3250b locks: reinstate locks_delete_b=
lock optimization)
Merging vfs/for-next (98bc42f00935 Merge branches 'fixes' and 'work.splice'=
 into for-next)
CONFLICT (content): Merge conflict in kernel/sysctl.c
CONFLICT (modify/delete): arch/mips/lasat/sysctl.c deleted in HEAD and modi=
fied in vfs/for-next. Version vfs/for-next of arch/mips/lasat/sysctl.c left=
 in tree.
$ git rm -f arch/mips/lasat/sysctl.c
Merging printk/for-next (e35456906bd4 Merge branch 'for-5.8' into for-next)
Merging pci/next (48e3ddc3de52 Merge branch 'remotes/lorenzo/pci/v3-semi')
CONFLICT (content): Merge conflict in drivers/pci/quirks.c
Merging pstore/for-next/pstore (68d3b0eaa81f mtd: Support kmsg dumper based=
 on pstore/blk)
Merging hid/for-next (5d7d489e9129 Merge branch 'for-5.8/multitouch' into f=
or-next)
Merging i2c/i2c/for-next (2a41d0f91443 Merge branch 'i2c/for-5.8' into i2c/=
for-next)
Merging i3c/i3c/next (b4203ce05563 i3c master: GETMRL's 3rd byte is optiona=
l even with BCR_IBI_PAYLOAD)
Merging dmi/master (8cf87c744696 firmware/dmi: Report DMI Bios & EC firmwar=
e release)
Merging hwmon-staging/hwmon-next (fff2d0f701e6 hwmon: (applesmc) avoid over=
long udelay())
Merging jc_docs/docs-next (b8170fad6e5f tracing: Fix events.rst section num=
bering)
CONFLICT (content): Merge conflict in Documentation/filesystems/fiemap.rst
CONFLICT (content): Merge conflict in Documentation/arm64/booting.rst
CONFLICT (content): Merge conflict in Documentation/arm64/amu.rst
Merging v4l-dvb/master (938b29db3aa9 media: Documentation: media: Refer to =
mbus format documentation from CSI-2 docs)
Merging v4l-dvb-next/master (54ecb8f7028c Linux 5.4-rc1)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (36f08eed2728 Merge branches 'pm-core' and 'pm-cpuidl=
e' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (6cc3d0e9a097 cpufreq: tegra186:=
 add CPUFREQ_NEED_INITIAL_FREQ_CHECK flag)
Merging cpupower/cpupower (7b0bf99b9ee4 cpupower: Remove unneeded semicolon)
Merging opp/opp/linux-next (c57afacc9270 opp: Remove bandwidth votes when t=
arget_freq is zero)
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
Merging rdma/for-next (ebd6e96b33a2 RDMA/ipoib: Remove can_sleep parameter =
from iboib_mcast_alloc)
Merging net-next/master (50ce4c099beb sctp: fix typo sctp_ulpevent_nofity_p=
eer_addr_change)
CONFLICT (content): Merge conflict in net/xdp/xdp_umem.c
Merging bpf-next/master (c41f9b7371d0 bpf, selftests: Test probe_* helpers =
from SCHED_CLS)
Merging ipsec-next/master (7d4343d501f9 xfrm: fix unused variable warning i=
f CONFIG_NETFILTER=3Dn)
CONFLICT (content): Merge conflict in net/ipv6/xfrm6_output.c
CONFLICT (content): Merge conflict in net/ipv6/af_inet6.c
CONFLICT (content): Merge conflict in net/ipv4/xfrm4_output.c
Applying: xfrm: merge fixup for "remove output_finish indirection from xfrm=
_state_afinfo"
Merging mlx5-next/mlx5-next (6b646a7e4af6 net/mlx5: Add ability to read and=
 write ECE options)
Merging netfilter-next/master (5b6743fb2c2a netfilter: nf_tables: skip flow=
table hooknum and priority on device updates)
Merging ipvs-next/master (d54725cd11a5 netfilter: nf_tables: support for mu=
ltiple devices per netdev hook)
Merging wireless-drivers-next/master (dc0f3ed1973f net: phy: at803x: add ca=
ble diagnostics support for ATH9331 and ATH8032)
Merging bluetooth/master (85e90d9391f5 Bluetooth: hci_qca: Fix uninitialize=
d access to hdev)
Merging mac80211-next/master (119aadf816f5 mac80211_hwsim: report the WIPHY=
_FLAG_SUPPORTS_5_10_MHZ capability)
Merging gfs2/for-next (771d0b71043f gfs2: Allow lock_nolock mount to specif=
y jid=3DX)
Merging mtd/mtd/next (025a06c1104c mtd: Convert fallthrough comments into s=
tatements)
Merging nand/nand/next (086624b9b8c4 mtd: rawnand: Add an invalid ECC mode =
to discriminate with valid ones)
Merging spi-nor/spi-nor/next (b84691596328 mtd: spi-nor: Fix description of=
 the sr_ready() return value)
Merging crypto/master (988453fb2f18 crypto: hisilicon/qm - change debugfs f=
ile name from qm_regs to regs)
CONFLICT (content): Merge conflict in crypto/xts.c
CONFLICT (content): Merge conflict in crypto/lrw.c
Merging drm/drm-next (7dbbdd37f2ae drm/nouveau: use correct conflicting fra=
mebuffer API)
CONFLICT (content): Merge conflict in include/linux/dma-buf.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/tidss/tidss_encoder.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_vma.c
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
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dcn21/=
dcn21_init.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dcn20/=
dcn20_init.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dcn10/=
dcn10_init.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dcn10/=
dcn10_hw_sequencer.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/core/d=
c_link_dp.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_kms=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_drv=
.c
Merging amdgpu/drm-next (31fba61da070 drm/amdgpu/pm: don't bail for in_susp=
end)
CONFLICT (rename/rename): Rename "drivers/gpu/drm/amd/display/dc/dml/dml_co=
mmon_defs.h"->"drivers/gpu/drm/nouveau/nvkm/engine/disp/hdagv100.c" in bran=
ch "HEAD" rename "drivers/gpu/drm/amd/display/dc/dml/dml_common_defs.h"->"d=
rivers/gpu/drm/amd/amdkfd/kfd_smi_events.h" in "amdgpu/drm-next"
CONFLICT (rename/delete): drivers/gpu/drm/amd/display/dc/dml/dml_common_def=
s.c deleted in amdgpu/drm-next and renamed to drivers/gpu/drm/nouveau/nvkm/=
engine/disp/capsgv100.c in HEAD. Version HEAD of drivers/gpu/drm/nouveau/nv=
km/engine/disp/capsgv100.c left in tree.
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dml/dm=
l_inline_defs.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dcn20/=
dcn20_init.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dcn10/=
dcn10_init.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dcn10/=
dcn10_hw_sequencer.c
$ git rm -f drivers/gpu/drm/amd/display/dc/dml/dml_common_defs.h
Merging drm-intel/for-linux-next (757a9395f33c drm/i915/gem: Avoid iteratin=
g an empty list)
Merging drm-tegra/drm/tegra/for-next (f923db184ca3 gpu: host1x: Clean up de=
bugfs in error handling path)
Merging drm-misc/for-linux-next (6f27e4c287d7 drm/vblank: Fix -Wformat comp=
ile warnings on some arches)
Merging drm-msm/msm-next (721a35ad71d9 drm/msm/dpu: avoid open-coded 64-bit=
 division)
Applying: drm/msm/dpu: fix up u64/u32 division for 32 bit architectures
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (2c76b324c794 drm/imx: parallel-display: Adjus=
t bus_flags handling)
Merging etnaviv/etnaviv/next (f232d9ec029c drm/etnaviv: fix TS cache flushi=
ng on GPUs with BLT engine)
Merging regmap/for-next (6c9147d991fb Merge remote-tracking branch 'regmap/=
for-5.8' into regmap-next)
Merging sound/for-next (e0b2db351bc7 ALSA: firewire-motu: add support for M=
OTU UltraLite-mk3 (FireWire only model))
Merging sound-asoc/for-next (18d98525aaac Merge remote-tracking branch 'aso=
c/for-5.8' into asoc-next)
Merging modules/modules-next (5c3a7db0c7ec module: Harden STRICT_MODULE_RWX)
Merging input/next (d0ac7079d5fc Input: iqs269a - add missing I2C dependenc=
y)
Merging block/for-next (9ba46c968c30 Merge branch 'for-5.8/block' into for-=
next)
CONFLICT (content): Merge conflict in drivers/block/loop.c
Merging device-mapper/for-next (b4756d43a1dd dm zoned: remove leftover hunk=
 for switching to sequential zones)
CONFLICT (content): Merge conflict in drivers/md/dm-zoned-metadata.c
Merging pcmcia/pcmcia-next (46d079790663 pcmcia: make pccard_loop_tuple() s=
tatic)
Merging mmc/next (c21bab91c205 m68k: coldfire/clk.c: move m5441x specific c=
ode)
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (7edd363421da mfd: Add support for PMIC MT6360)
Merging backlight/for-backlight-next (479da1f538a2 backlight: Add backlight=
_device_get_by_name())
Merging battery/for-next (eda8ffcc5edf dt-bindings: power: Convert bq27xxx =
dt to yaml)
Merging regulator/for-next (e78e8e2474d1 Merge remote-tracking branch 'regu=
lator/for-5.8' into regulator-next)
Merging security/next-testing (60cf7c5ed5f7 lockdown: Allow unprivileged us=
ers to see lockdown status)
Merging apparmor/apparmor-next (e37986097ba6 apparmor: Use true and false f=
or bool variable)
Merging integrity/next-integrity (8eb613c0b8f1 ima: verify mprotect change =
is consistent with mmap policy)
Merging keys/keys-next (4fd499e01199 keys: Implement update for the big_key=
 type)
Merging selinux/next (fe5a90b8c149 selinux: netlabel: Remove unused inline =
function)
Merging smack/next (ef26650a201f Smack: Remove unused inline function smk_a=
d_setfield_u_fs_path_mnt)
Merging tomoyo/master (27acbf41be39 tomoyo: use true for bool variable)
Merging tpmdd/next (ab91c2a89f86 tpm: eventlog: Replace zero-length array w=
ith flexible-array member)
Merging watchdog/master (072cb8b628d3 watchdog: m54xx: Add missing include)
Merging iommu/next (93240d8e8fec Merge branches 'iommu/fixes', 'arm/msm', '=
arm/allwinner', 'arm/smmu', 'x86/vt-d', 'x86/amd', 'hyper-v' and 'core' int=
o next)
CONFLICT (content): Merge conflict in drivers/iommu/s390-iommu.c
Merging vfio/next (cd34b82e6ef0 Merge branches 'v5.8/vfio/alex-block-mmio-v=
3', 'v5.8/vfio/alex-zero-cap-v2' and 'v5.8/vfio/qian-leak-fixes' into v5.8/=
vfio/next)
Merging audit/next (9d44a121c5a7 audit: add subj creds to NETFILTER_CFG rec=
ord to)
Merging devicetree/for-next (2cb80529811b mfd: madera: Move binding over to=
 dtschema)
CONFLICT (modify/delete): Documentation/devicetree/bindings/watchdog/renesa=
s,wdt.txt deleted in devicetree/for-next and modified in HEAD. Version HEAD=
 of Documentation/devicetree/bindings/watchdog/renesas,wdt.txt left in tree.
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/pci=
/cdns-pcie.yaml
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/net=
/qcom,ipa.yaml
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/mtd=
/nand-controller.yaml
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/dis=
play/panel/panel-common.yaml
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/arm=
/socionext/uniphier.yaml
$ git rm -f Documentation/devicetree/bindings/watchdog/renesas,wdt.txt
Merging mailbox/mailbox-for-next (0a67003b1985 mailbox: imx: add SCU MU sup=
port)
Merging spi/for-next (228f95c14949 Merge remote-tracking branch 'spi/for-5.=
8' into spi-next)
Merging tip/auto-latest (1089ae4cbd9c Merge branch 'x86/entry')
CONFLICT (content): Merge conflict in kernel/Makefile
CONFLICT (content): Merge conflict in arch/powerpc/kernel/traps.c
Merging clockevents/timers/drivers/next (809eb4e9bf9d dt-bindings: timer: A=
dd renesas,em-sti bindings)
Merging edac/edac-for-next (8cacb5ff9e00 Merge branch 'edac-misc' into edac=
-for-next)
Merging irqchip/irq/irqchip-next (0e375f51017b irqchip/sifive-plic: Improve=
 boot prints for multiple PLIC instances)
Merging ftrace/for-next (d013496f99c5 tracing: Convert local functions in t=
racing_map.c to static)
Merging rcu/rcu/next (d87e0fb190cf refperf: Make functions static)
Merging kvm/linux-next (7529e767c2a9 Merge branch 'kvm-master' into HEAD)
CONFLICT (content): Merge conflict in arch/x86/kvm/svm/svm.c
Applying: KVM: SVM: fix up for do_machine_check() API change
Merging kvm-arm/next (0a78791c0d12 KVM: arm64: Remove obsolete kvm_virt_to_=
phys abstraction)
Merging kvm-ppc/kvm-ppc-next (e3326ae3d59e KVM: PPC: Book3S HV: Relax check=
 on H_SVM_INIT_ABORT)
Merging kvms390/next (0b545fd17f84 KVM: s390: remove unneeded semicolon in =
gisa_vcpu_kicker())
Merging xen-tip/linux-next (2abb65a39bcc xen: enable BALLOON_MEMORY_HOTPLUG=
 by default)
Merging percpu/for-next (dedac37ea96b Merge branch 'for-5.7' into for-next)
Merging workqueues/for-next (342ed2400b78 workqueue: Remove unnecessary kfr=
ee() call in rcu_free_wq())
Merging drivers-x86/for-next (f441d66a6ee9 platform/x86: dell-wmi: Ignore k=
eyboard attached / detached events)
Merging chrome-platform/for-next (bbb7ad49b835 platform/chrome: cros_usbpd_=
logger: Add __printf annotation to append_str())
CONFLICT (content): Merge conflict in drivers/platform/chrome/chromeos_psto=
re.c
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (59ea3c9faf32 leds: add aw2013 driver)
Merging ipmi/for-next (2a556ce779e3 ipmi:ssif: Remove dynamic platform devi=
ce handing)
Merging driver-core/driver-core-next (46d26819a505 software node: implement=
 software_node_unregister())
Merging usb/usb-next (d19c64b3d097 Merge tag 'thunderbolt-for-v5.8' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-next)
CONFLICT (add/add): Merge conflict in Documentation/devicetree/bindings/usb=
/qcom,dwc3.yaml
Merging usb-gadget/next (1c11e74e9079 usb: dwc3: keystone: Turn on USB3 PHY=
 before controller)
Merging usb-serial/usb-next (c432df155919 USB: serial: ch341: fix lockup of=
 devices with limited prescaler)
Merging usb-chipidea-next/ci-for-usb-next (6dbbbccdba61 usb: chipidea: Enab=
le user-space triggered role-switching)
Merging phy-next/next (ac0a95a3ea78 phy: intel: Add driver support for Comb=
oPhy)
Merging tty/tty-next (344235f55707 Merge 5.7-rc7 into tty-next)
Merging char-misc/char-misc-next (18cbc336ec1a Merge tag 'misc-habanalabs-n=
ext-2020-05-25' of git://people.freedesktop.org/~gabbayo/linux into char-mi=
sc-next)
Merging extcon/extcon-next (90b15e7c88bf extcon: arizona: Fix runtime PM im=
balance on error)
Merging soundwire/next (fcbcf1f7b568 soundwire: intel: use a single module)
Merging thunderbolt/next (4caf2511ec49 thunderbolt: Add trivial .shutdown)
Merging staging/staging-next (c2312ff575fc Merge 5.7-rc7 into staging-next)
Merging mux/for-next (05f19f7f8944 mux: adgs1408: Add mod_devicetable.h and=
 remove of_match_ptr)
Merging icc/icc-next (b35da2e86f25 Merge branch 'icc-get-by-index' into icc=
-next)
Merging slave-dma/next (be4cf718cd99 dmaengine: imx-sdma: initialize all sc=
ript addresses)
Merging cgroup/for-next (eec8fd0277e3 device_cgroup: Cleanup cgroup eBPF de=
vice filter code)
Merging scsi/for-next (a7a4293b22df Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (22617e216331 scsi: ufs: ti-j721e-ufs: Fix unwind=
ing of pm_runtime changes)
Merging vhost/linux-next (bf338dcc28f3 virtio_net: CTRL_GUEST_OFFLOADS depe=
nds on CTRL_VQ)
Merging rpmsg/for-next (71f56fef13d4 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (e47b16ebc068 Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (e33a58a29c6a gpio: pca935x: Allow IRQ supp=
ort for driver built as a module)
Merging gpio-intel/for-next (7e73aa90a38c gpio: merrifield: Better show how=
 GPIO and IRQ bases are derived from hardware)
Merging pinctrl/for-next (c22ea274178f Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (6d649fca3491 pinctrl: intel: Move npins clo=
ser to pin_base in struct intel_community)
Merging pinctrl-samsung/for-next (f354157a7d18 pinctrl: samsung: Save/resto=
re eint_mask over suspend for EINT_TYPE GPIOs)
Merging pwm/for-next (6f0841a8197b pwm: Add support for Azoteq IQS620A PWM =
generator)
Merging userns/for-next (90711122bae2 Merge proc-next and exec-next for tes=
ting in linux-next)
Merging ktest/for-next (1091c8fce8aa ktest: Fix typos in ktest.pl)
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (558ae0355a91 selftests/timens: handle a case when a=
larm clocks are not supported)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (8631420cac7d Merge branch 'for-5.8/klp-modul=
e-fixups' into for-next)
CONFLICT (content): Merge conflict in kernel/module.c
Merging coresight/next (90314f009d5e coresight: Use devm_kcalloc() in cores=
ight_alloc_conns())
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
Merging nvmem/for-next (be00147a195b MAINTAINERS: Add git tree for NVMEM FR=
AMEWORK)
Merging xarray/xarray (27586ca786a7 XArray: Handle retry entries within xas=
_find_marked)
Merging hyperv/hyperv-next (afaa33da08ab Drivers: hv: vmbus: Resolve more r=
aces involving init_vp_index())
Merging auxdisplay/auxdisplay (2f920c0f0e29 auxdisplay: charlcd: replace ze=
ro-length array with flexible-array member)
Merging kgdb/kgdb/for-next (6d033afea5a8 kgdboc: Disable all the early code=
 when kgdboc is a module)
Merging pidfd/for-next (2b40c5db73e2 selftests/pidfd: add pidfd setns tests)
Merging devfreq/devfreq-next (869cad3992bf PM / devfreq: Use lockdep assert=
s instead of manual checks for locked mutex)
Merging hmm/hmm (f07e2f6be37a MAINTAINERS: add HMM selftests)
Merging fpga/for-next (a2b9d4eadb77 fpga: dfl: afu: support debug access to=
 memory-mapped afu regions)
Merging kunit/test (0e698dfa2822 Linux 5.7-rc4)
Merging cel/cel-next (0a8e7b7d0846 SUNRPC: Revert 241b1f419f0e ("SUNRPC: Re=
move xdr_buf_trim()"))
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (11399346ac39 mtd: Replace zero-length array with flex=
ible-array)
Merging kunit-next/kunit (9bdf64b35117 kunit: use KUnit defconfig by defaul=
t)
Merging trivial/for-next (c1a371cf80fb printk: fix global comment)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (3781a7a11294 bus: mhi: core: Handle syserr during pow=
er_up)
CONFLICT (content): Merge conflict in drivers/bus/mhi/core/pm.c
Merging notifications/notifications-pipe-core (87a10a4bdb88 watch_queue: sa=
mple: Display superblock notifications)
CONFLICT (content): Merge conflict in samples/Makefile
CONFLICT (content): Merge conflict in samples/Kconfig
CONFLICT (content): Merge conflict in include/uapi/asm-generic/unistd.h
CONFLICT (content): Merge conflict in include/linux/pipe_fs_i.h
CONFLICT (content): Merge conflict in fs/mount.h
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
Applying: pipe: update for pipe_buf_operations changes
Merging fsinfo/fsinfo-core (93737ccf05ec fsinfo: Add an attribute that list=
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
Applying: rcuperf: uniqify name
Applying: refperf: uniqify name
Merging akpm-current/current (ae329a355bc5 linux-next-pre)
CONFLICT (content): Merge conflict in tools/testing/selftests/vm/Makefile
CONFLICT (content): Merge conflict in mm/memory.c
CONFLICT (content): Merge conflict in kernel/kprobes.c
CONFLICT (content): Merge conflict in include/linux/sched.h
CONFLICT (content): Merge conflict in include/linux/printk.h
CONFLICT (content): Merge conflict in include/linux/binfmts.h
CONFLICT (content): Merge conflict in fs/btrfs/inode.c
CONFLICT (content): Merge conflict in fs/binfmt_script.c
CONFLICT (content): Merge conflict in arch/x86/mm/tlb.c
CONFLICT (content): Merge conflict in arch/x86/Kconfig.debug
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
CONFLICT (content): Merge conflict in arch/arm64/Kconfig
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (3f18d6450824 drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)
Applying: drm/amdkfd: fix up for {un}use_mm() rename

--Sig_/.fvh9sY127.vtkmjdr1up+i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Pl1cACgkQAVBC80lX
0Gz/iwf/Vc1Zn98fEF6OjZp/P9Ye9lRMPxVWX01zHyWG7ZF32P315sbBT/5GaYfx
6B4pyXCs6bm73tqC65x7CdyxD8Ox8y2peseGhjCUMLrwi3Ie9ekc7yUbv68fiR4r
SziCe2DwTrdHIqVyGIj0kXy3zMuALvklrx0e7R1DWBjyNhyawc3B0a2U0aK0iLCF
5o1KU4WJdmolk2tUlwvaabEloLn/ccxm/IViejAbO+jW9rFODHI4LVta1Ley+Kej
sg/XMWfG7aCHribCrA4N6hHiZaJMd98MWb3R7Jp3DfArKrZU7Ikd2IVUs/J/XUey
1T0aD7FoNRVb1imnoqRIQwcfe+Xdnw==
=7T5G
-----END PGP SIGNATURE-----

--Sig_/.fvh9sY127.vtkmjdr1up+i--
