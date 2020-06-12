Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1B461F727D
	for <lists+linux-next@lfdr.de>; Fri, 12 Jun 2020 05:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgFLDiw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Jun 2020 23:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbgFLDiw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 Jun 2020 23:38:52 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8077DC03E96F;
        Thu, 11 Jun 2020 20:38:51 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49jmfc2XhBz9sSJ;
        Fri, 12 Jun 2020 13:38:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591933128;
        bh=XDL0hkNuHdDGlKkEEGSWju1QA+/zOcc+SMADznl25WI=;
        h=Date:From:To:Cc:Subject:From;
        b=hipTjPjzfl4xAopu1ybCYvxBQulHzjJJwOcrZFDlinQssF4qP/itGhbao0pzTakFa
         pMIVYWAwSRJAmAUcaeM4/kErgcQOJ7oRd4jqVXf0walvPPsVVc0wqwIkvp3Aclt0QK
         f6/+QSalZgJyg8hXxgozv4+8nfAbDr14lf7kOqUS0V47zntIXsEqSQ3zWDpxDygrJm
         7ereXSe5Xo0ka+eHPrV0PL5x2HEvEB4pAMjtUzTjZnsdk/Y9MiXDtSLKaGhsze7/SH
         28v199jiI5NQOenFsm0DZbTneE4J0jWdqxIzOG4bY92j0WG7zYtSIshU10xmNaG6Ar
         TM9VJ2E9ru/9Q==
Date:   Fri, 12 Jun 2020 13:38:47 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 12
Message-ID: <20200612133847.423a9bf3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Y.JcNjBkkrSc3jXG/R_gGWm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Y.JcNjBkkrSc3jXG/R_gGWm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

News: The merge window has opened, so please do *not* add v5.9 material
to your linux-next included branches until after v5.8-rc1 has been
released.

Changes since 20200611:

My fixes tree contains:

  4cb4bfffe2c1 ("device_cgroup: Fix RCU list debugging warning")

The amdgpu tree gained a semantic conflict against Linus' tree.

Non-merge commits (relative to Linus' tree): 1363
 1903 files changed, 254063 insertions(+), 23715 deletions(-)

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
Merging origin/master (623f6dc593ea Merge branch 'akpm' (patches from Andre=
w))
Merging fixes/master (df8cb0ea9423 device_cgroup: Fix RCU list debugging wa=
rning)
Merging kbuild-current/fixes (e4a42c82e943 kbuild: fix broken builds becaus=
e of GZIP,BZIP2,LZOP variables)
Merging arc-current/for-curr (9d9368e839c2 ARC: [arcompact] fix bitrot with=
 2 levels of interrupt)
Merging arm-current/fixes (3866f217aaa8 ARM: 8977/1: ptrace: Fix mask for t=
humb breakpoint hook)
Merging arm-soc-fixes/arm/fixes (99706d62fb50 Merge tag 'omap-for-v5.7/cpsw=
-fixes-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linu=
x-omap into arm/fixes)
Merging uniphier-fixes/fixes (0e698dfa2822 Linux 5.7-rc4)
Merging arm64-fixes/for-next/fixes (ba051f097fc3 arm64/kernel: Fix return v=
alue when cpu_online() fails in __cpu_up())
Merging m68k-current/for-linus (3381df095419 m68k: tools: Replace zero-leng=
th array with flexible-array member)
Merging powerpc-fixes/fixes (2f26ed1764b4 powerpc/64s: Disable sanitisers f=
or C syscall/interrupt entry/exit code)
Merging s390-fixes/fixes (3d77e6a8804a Linux 5.7)
Merging sparc/master (af7b4801030c Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (9798278260e8 tipc: fix NULL pointer dereference in tipc=
_disc_rcv())
CONFLICT (content): Merge conflict in net/ipv4/tcp.c
Merging bpf/master (2c4779eff837 tools, bpftool: Exit on error in function =
codegen)
Merging ipsec/master (a4902d914e50 xfrm: merge fixup for "remove output_fin=
ish indirection from xfrm_state_afinfo")
Merging netfilter/master (c3829285b2e6 netfilter: nft_set_pipapo: Disable p=
reemption before getting per-CPU pointer)
Merging ipvs/master (bdc48fa11e46 checkpatch/coding-style: deprecate 80-col=
umn warning)
Merging wireless-drivers/master (f92f26f2ed2c iwlwifi: pcie: handle QuZ con=
figs with killer NICs as well)
Merging mac80211/master (59d4bfc1e2c0 net: fix wiki website url mac80211 an=
d wireless files)
Merging rdma-fixes/for-rc (3d77e6a8804a Linux 5.7)
Merging sound-current/for-linus (adb36a820383 ALSA: hda: Add NVIDIA codec I=
Ds 9a & 9d through a0 to patch table)
Merging sound-asoc-fixes/for-linus (9f045ed020a5 Merge remote-tracking bran=
ch 'asoc/for-5.8' into asoc-linus)
Merging regmap-fixes/for-linus (7e295e6576af Merge remote-tracking branch '=
regmap/for-5.8' into regmap-linus)
Merging regulator-fixes/for-linus (5fb565b69dab Merge remote-tracking branc=
h 'regulator/for-5.8' into regulator-linus)
Merging spi-fixes/for-linus (a86cc4cfcd0b Merge remote-tracking branch 'spi=
/for-5.8' into spi-linus)
Merging pci-current/for-linus (42612e776331 Merge tag 'f2fs-for-5.8' of git=
://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs)
Merging driver-core.current/driver-core-linus (abfbb29297c2 Merge tag 'rpro=
c-v5.8' of git://git.kernel.org/pub/scm/linux/kernel/git/andersson/remotepr=
oc)
Merging tty.current/tty-linus (af7b4801030c Merge git://git.kernel.org/pub/=
scm/linux/kernel/git/netdev/net)
Merging usb.current/usb-linus (af7b4801030c Merge git://git.kernel.org/pub/=
scm/linux/kernel/git/netdev/net)
Merging usb-gadget-fixes/fixes (172b14b48ca1 usb: cdns3: gadget: make a bun=
ch of functions static)
Merging usb-serial-fixes/usb-linus (399ad9477c52 USB: serial: option: add T=
elit LE910C1-EUX compositions)
Merging usb-chipidea-fixes/ci-for-usb-stable (b3f3736ac305 usb: chipidea: m=
sm: Ensure proper controller reset using role switch API)
Merging phy/fixes (820eeb9de62f phy: qualcomm: usb-hs-28nm: Prepare clocks =
in init)
Merging staging.current/staging-linus (af7b4801030c Merge git://git.kernel.=
org/pub/scm/linux/kernel/git/netdev/net)
Merging char-misc.current/char-misc-linus (6f630784cc0d Merge tag 'clk-for-=
linus' of git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux)
Merging soundwire-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging thunderbolt-fixes/fixes (3d77e6a8804a Linux 5.7)
Merging input-current/for-linus (751ad34fbad7 Input: adi - work around modu=
le name confict)
Merging crypto-current/master (320bdbd81615 crypto: cavium/nitrox - Fix 'ni=
trox_get_first_device()' when ndevlist is fully iterated)
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
Merging omap-fixes/fixes (e4a8fc054340 Revert "bus: ti-sysc: Increase max s=
oftreset wait")
Merging kvm-fixes/master (49b3deaad345 Merge tag 'kvmarm-fixes-5.8-1' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvms390-fixes/master (5615e74f48dc KVM: s390: Remove false WARN_ON_=
ONCE for the PQAP instruction)
Merging hwmon-fixes/hwmon (0f4ad4030eaf hwmon: (bt1-pvt) Mark is_visible fu=
nctions static)
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
Merging devicetree-fixes/dt/linus (f8d8b46cd20e scripts/dtc: use pkg-config=
 to include <yaml.h> in non-standard path)
Merging scsi-fixes/fixes (f2e6b75f6ee8 scsi: target: Put lun_ref at end of =
tmr processing)
Merging drm-fixes/drm-fixes (3d77e6a8804a Linux 5.7)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (822d6bd1890d drm/i915: work a=
round false-positive maybe-uninitialized warning)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_lrc.c
Merging mmc-fixes/fixes (202500d21654 mmc: block: Fix use-after-free issue =
for rpmb)
Merging rtc-fixes/rtc-fixes (8f3d9f354286 Linux 5.7-rc1)
Merging gnss-fixes/gnss-linus (2ef96a5bb12b Linux 5.7-rc5)
Merging hyperv-fixes/hyperv-fixes (38dce4195f0d x86/hyperv: Properly suspen=
d/resume reenlightenment notifications)
Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq h=
andlers after dpio create)
Merging risc-v-fixes/fixes (cd16ed33c3c6 Merge tag 'riscv-for-linus-5.8-mw1=
' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging pidfd-fixes/fixes (3f2c788a1314 fork: prevent accidental access to =
clone3 features)
Merging fpga-fixes/fixes (6a47d6efc693 fpga: zynqmp: fix modular build)
Merging spdx/spdx-linus (3d77e6a8804a Linux 5.7)
Merging gpio-intel-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging pinctrl-intel-fixes/fixes (69388e15f507 pinctrl: cherryview: Add mi=
ssing spinlock usage in chv_gpio_irq_handler)
Merging erofs-fixes/fixes (d1eef1c61974 Linux 5.5-rc2)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging drm-misc-fixes/for-linux-next-fixes (abf56fadf0e2 gpu/drm: Ingenic:=
 Fix opaque pointer casted to wrong type)
Merging kspp-gustavo/for-next/kspp (6650a563e917 w1: Replace zero-length ar=
ray with flexible-array)
Merging kbuild/for-next (b170290c2836 Merge tag 'kconfig-v5.8' of git://git=
.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild)
Merging compiler-attributes/compiler-attributes (98d54f81e36b Linux 5.6-rc4)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (3ee06a6d532f dma-pool: fix too large DMA pool=
s on medium memory size systems)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (03c7f5f0b844 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (dd4bc6076587 arm64: warn on incorrect placemen=
t of the kernel by the bootloader)
Merging arm-perf/for-next/perf (10f6cd2af21b pmu/smmuv3: Clear IRQ affinity=
 hint on device removal)
Merging arm-soc/for-next (28107944fb70 soc: document merges)
Merging amlogic/for-next (9233c526bc0e Merge branch 'v5.8/defconfig' into t=
mp/aml-rebuild)
Merging aspeed/for-next (fa4c8ec6feaa ARM: dts: aspeed: Change KCS nodes to=
 v2 binding)
Merging at91/at91-next (ec539e70d882 Merge branches 'at91-soc', 'at91-dt' a=
nd 'at91-defconfig' into at91-next)
Merging imx-mxs/for-next (0414897ac89f Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (a158c2b7ec23 Merge branch 'for_5.8/driver-soc' into =
next)
Merging mediatek/for-next (64ee939736e7 Merge branch 'v5.7-next/soc' into f=
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
Merging samsung-krzk/for-next (0f6a82638f62 Merge branch 'next/dt-late' int=
o for-next)
Merging scmi/for-linux-next (2f6ecd2028c6 Merge tag 'juno-fix-5.8' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-linux-=
next)
Merging sunxi/sunxi/for-next (243cd8fba48d Merge branch 'sunxi/dt-for-5.8' =
into sunxi/for-next)
Merging tegra/for-next (cd049d898ab8 Merge branch for-5.8/arm64/dt into for=
-next)
Merging ti-k3/ti-k3-next (cae809434da1 arm64: dts: ti: k3-j721e-main: Add m=
ain domain watchdog entries)
Merging uniphier/for-next (0e698dfa2822 Linux 5.7-rc4)
Merging clk/clk-next (9ac1eafa885a clk: mediatek: Remove ifr{0,1}_cfg_regs =
structures)
Merging clk-samsung/for-next (3d77e6a8804a Linux 5.7)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (f36e0aab6f1f csky: Fixup CONFIG_DEBUG_RSEQ)
Merging h8300/h8300-next (beab3d5cb0e1 irq-renesas-h8s: Fix external interr=
upt control.)
Merging ia64/next (172e7890406d tty/serial: cleanup after ioc*_serial drive=
r removal)
Merging m68k/for-next (3381df095419 m68k: tools: Replace zero-length array =
with flexible-array member)
Merging m68knommu/for-next (9e2b6ed41f8f m68k,nommu: fix implicit cast from=
 __user in __{get,put}_user_asm())
Merging microblaze/next (8f3d9f354286 Linux 5.7-rc1)
Merging mips/mips-next (9bd0bd264578 MIPS: ralink: drop ralink_clk_init for=
 mt7621)
Merging nds32/next (d785c5a324cd nds32: configs: Cleanup CONFIG_CROSS_COMPI=
LE)
Merging nios2/for-next (0ec8a5054d7f MAINTAINERS: Remove nios2-dev@lists.ro=
cketboards.org)
Merging openrisc/for-next (6bd140e14d9a openrisc: Fix issue with argument c=
lobbering for clone/fork)
Merging parisc-hd/for-next (3d77e6a8804a Linux 5.7)
Merging powerpc/next (1395375c5927 Merge branch 'topic/ppc-kvm' into next)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (e9e4ef9116b1 soc: fsl: dpio: Remove unused inline fun=
ction qbman_write_eqcr_am_rt_register)
Merging risc-v/for-next (01f76386b0ac riscv: set the permission of vdso_dat=
a to read-only)
Merging sifive/for-next (467e050e9760 Merge branch 'i2c/for-current' of git=
://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging s390/features (bfa50e1427e4 vfio-ccw: make vfio_ccw_regops variable=
s declarations static)
Merging sh/for-next (37744feebc08 sh: remove sh5 support)
Merging sparc-next/master (af7b4801030c Merge git://git.kernel.org/pub/scm/=
linux/kernel/git/netdev/net)
Merging uml/linux-next (f6e8c474390b um: virtio: Replace zero-length array =
with flexible-array)
Merging xtensa/xtensa-for-next (3ead2f97bd44 xtensa: Fix spelling/grammar i=
n comment)
Merging fscrypt/master (e3b1078bedd3 fscrypt: add support for IV_INO_LBLK_3=
2 policies)
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (8113246479a5 Merge branch 'for-next-next-v5.7-20200=
528' into for-next-20200528)
Merging ceph/master (dc1dad8e1a61 rbd: compression_hint option)
Merging cifs/for-next (7866c177a03b smb3: fix typo in mount options display=
ed in /proc/mounts)
Merging configfs/for-next (8aebfffacfa3 configfs: fix config_item refcnt le=
ak in configfs_rmdir())
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (34f853b849eb erofs: suppress false positive last_block w=
arning)
Merging exfat/dev (510851acab39 exfat: add missing brelse() calls on error =
paths)
Merging ext3/for_next (ee374a9aeced ext2: fix missing percpu_counter_inc)
Merging ext4/dev (6b8ed62008a4 ext4: avoid unnecessary transaction starts d=
uring writeback)
Merging f2fs/dev (b29482fde649 Merge branch 'work.epoll' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/viro/vfs)
Merging fsverity/fsverity (9cd6b593cfc9 fs-verity: remove unnecessary exter=
n keywords)
Merging fuse/for-next (9b46418c40fe fuse: copy_file_range should truncate c=
ache)
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (3d77e6a8804a Linux 5.7)
Merging nfs-anna/linux-next (ba838a75e73f NFS: Fix direct WRITE throughput =
regression)
Merging nfsd/nfsd-next (1eb2f96d0bff sunrpc: use kmemdup_nul() in gssp_stri=
ngify())
Merging orangefs/for-next (0df556457748 orangefs: convert get_user_pages() =
--> pin_user_pages())
Merging overlayfs/overlayfs-next (2068cf7dfbc6 ovl: remove unnecessary lock=
 check)
Merging ubifs/linux-next (4b68bf9a69d2 ubi: Select fastmap anchor PEBs cons=
idering wear level rules)
Merging v9fs/9p-next (36f9967531da 9p/xen: increase XEN_9PFS_RING_ORDER)
Merging xfs/for-next (8cc007246972 xfs: Add the missed xfs_perag_put() for =
xfs_ifree_cluster())
Merging zonefs/for-next (568776f992c4 zonefs: Replace uuid_copy() with impo=
rt_uuid())
Merging iomap/iomap-for-next (d4ff3b2ef901 iomap: Fix unsharing of an exten=
t >2GB on a 32-bit machine)
Merging djw-vfs/vfs-for-next (e4f9ba20d3b8 fs/xfs: Update xfs_ioctl_setattr=
_dax_invalidate())
Merging file-locks/locks-next (5ef159681309 locks: add locks_move_blocks in=
 posix_lock_inode)
Merging vfs/for-next (b29482fde649 Merge branch 'work.epoll' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging printk/for-next (d6c8bb00c126 Merge remote-tracking branch 'origin/=
for-5.8-kdb-nmi' into for-next)
Merging pci/next (42612e776331 Merge tag 'f2fs-for-5.8' of git://git.kernel=
.org/pub/scm/linux/kernel/git/jaegeuk/f2fs)
Merging pstore/for-next/pstore (78c08247b9d3 mtd: Support kmsg dumper based=
 on pstore/blk)
Merging hid/for-next (5d7d489e9129 Merge branch 'for-5.8/multitouch' into f=
or-next)
Merging i2c/i2c/for-next (797210b16a71 Merge branch 'i2c/for-5.8' into i2c/=
for-next)
Merging i3c/i3c/next (b4203ce05563 i3c master: GETMRL's 3rd byte is optiona=
l even with BCR_IBI_PAYLOAD)
Merging dmi/master (d9d8efd3241b firmware/dmi: Report DMI Bios & EC firmwar=
e release)
Merging hwmon-staging/hwmon-next (82bd3acaeaa4 hwmon: (bt1-pvt) Mark is_vis=
ible functions static)
Merging jc_docs/docs-next (146f5cdeda15 docs/memory-barriers.txt/kokr: smp_=
mb__{before,after}_atomic(): update Documentation)
Merging v4l-dvb/master (2630e1bb0948 media: rkvdec: Fix H264 scaling list o=
rder)
Merging v4l-dvb-next/master (2630e1bb0948 media: rkvdec: Fix H264 scaling l=
ist order)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (30bbd465a449 Merge branches 'pm-acpi', 'pm-sleep' an=
d 'pm-cpufreq' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (6cc3d0e9a097 cpufreq: tegra186:=
 add CPUFREQ_NEED_INITIAL_FREQ_CHECK flag)
Merging cpupower/cpupower (7b0bf99b9ee4 cpupower: Remove unneeded semicolon)
Merging opp/opp/linux-next (45679f9b508f opp: Don't parse icc paths unneces=
sarily)
Merging thermal/thermal/linux-next (64488908b523 thermal/int340x_thermal: D=
on't require IDSP to exist)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (fe204591cc94 dlm: remove BUG() before panic())
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (fba97dc7fc76 RDMA/cm: Spurious WARNING triggered in =
cm_destroy_id())
Merging net-next/master (af7b4801030c Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/netdev/net)
Merging bpf-next/master (af7b4801030c Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/netdev/net)
Merging ipsec-next/master (9a25c1df24a6 Merge git://git.kernel.org/pub/scm/=
linux/kernel/git/bpf/bpf-next)
Merging mlx5-next/mlx5-next (6b646a7e4af6 net/mlx5: Add ability to read and=
 write ECE options)
Merging netfilter-next/master (cb8e59cc8720 Merge git://git.kernel.org/pub/=
scm/linux/kernel/git/netdev/net-next)
Merging ipvs-next/master (9a25c1df24a6 Merge git://git.kernel.org/pub/scm/l=
inux/kernel/git/bpf/bpf-next)
Merging wireless-drivers-next/master (1806c13dc253 Merge git://git.kernel.o=
rg/pub/scm/linux/kernel/git/netdev/net)
Merging bluetooth/master (c453b10c2b28 Bluetooth: btusb: Configure Intel de=
bug feature based on available support)
Merging mac80211-next/master (cb8e59cc8720 Merge git://git.kernel.org/pub/s=
cm/linux/kernel/git/netdev/net-next)
Merging gfs2/for-next (9d05a7c0c539 gfs2: Don't sleep during glock hash wal=
k)
Merging mtd/mtd/next (5788ccf3c84f mtd: clear cache_state to avoid writing =
to bad blocks repeatedly)
Merging nand/nand/next (86f2b225adf4 mtd: rawnand: Add an invalid ECC mode =
to discriminate with valid ones)
Merging spi-nor/spi-nor/next (e8aec15dd584 mtd: spi-nor: winbond: Fix 4-byt=
e opcode support for w25q256)
Merging crypto/master (58ca0060ec4e crypto: hisilicon - fix driver compatib=
ility issue with different versions of devices)
Merging drm/drm-next (66057dd1d1cf Merge tag 'drm-misc-next-fixes-2020-06-1=
1' of git://anongit.freedesktop.org/drm/drm-misc into drm-next)
Merging amdgpu/drm-next (624a498a539a drm/amdgpu: add another raven1 gfxoff=
 quirk)
Applying: drm/amdkfd: fix up for {un}use_mm() rename
Merging drm-intel/for-linux-next (3680c2e9f425 drm/i915/display: Only query=
 DP state of a DDI encoder)
Merging drm-tegra/drm/tegra/for-next (d1c746f8b59d drm/tegra: hub: Do not e=
nable orphaned window group)
Merging drm-misc/for-linux-next (291ddeb621e4 drm/ast: fix missing break in=
 switch statement for format->cpp[0] case 4)
Merging drm-msm/msm-next (1cb2c4a2c89b Revert "drm/msm/dpu: add support for=
 clk and bw scaling for display")
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (2c76b324c794 drm/imx: parallel-display: Adjus=
t bus_flags handling)
Merging etnaviv/etnaviv/next (f232d9ec029c drm/etnaviv: fix TS cache flushi=
ng on GPUs with BLT engine)
Merging regmap/for-next (7e295e6576af Merge remote-tracking branch 'regmap/=
for-5.8' into regmap-linus)
Merging sound/for-next (adb36a820383 ALSA: hda: Add NVIDIA codec IDs 9a & 9=
d through a0 to patch table)
Merging sound-asoc/for-next (9f045ed020a5 Merge remote-tracking branch 'aso=
c/for-5.8' into asoc-linus)
Merging modules/modules-next (5c3a7db0c7ec module: Harden STRICT_MODULE_RWX)
Merging input/next (d0ac7079d5fc Input: iqs269a - add missing I2C dependenc=
y)
Merging block/for-next (5b53c3e1a873 Merge branch 'block-5.8' into for-next)
Applying: fix up for merge conflict with rdma tree
Merging device-mapper/for-next (64611a15ca9d dm crypt: avoid truncating the=
 logical block size)
Merging pcmcia/pcmcia-next (46d079790663 pcmcia: make pccard_loop_tuple() s=
tatic)
Merging mmc/next (ae5c0585dfc2 dt-bindings: mmc: Convert sdhci-pxa to json-=
schema)
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (098c4adf249c mfd: mt6360: Remove duplicate REGMAP=
_IRQ_REG_LINE() entry)
Merging backlight/for-backlight-next (479da1f538a2 backlight: Add backlight=
_device_get_by_name())
Merging battery/for-next (152204dbdcee power: supply: cw2015: Attach OF ID =
table to the driver)
Merging regulator/for-next (5fb565b69dab Merge remote-tracking branch 'regu=
lator/for-5.8' into regulator-linus)
Merging security/next-testing (56f2e3b7d819 capabilities: add description f=
or CAP_SETFCAP)
Merging apparmor/apparmor-next (e37986097ba6 apparmor: Use true and false f=
or bool variable)
Merging integrity/next-integrity (d3d88a04a8b3 ima: fix mprotect checking)
Merging keys/keys-next (b6f61c314649 keys: Implement update for the big_key=
 type)
Merging selinux/next (fe5a90b8c149 selinux: netlabel: Remove unused inline =
function)
Merging smack/next (ef26650a201f Smack: Remove unused inline function smk_a=
d_setfield_u_fs_path_mnt)
Merging tomoyo/master (039aeb9deb92 Merge tag 'for-linus' of git://git.kern=
el.org/pub/scm/virt/kvm/kvm)
Merging tpmdd/next (32a767afb0d8 tpm: Fix TIS locality timeout problems)
Merging watchdog/master (072cb8b628d3 watchdog: m54xx: Add missing include)
Merging iommu/next (672cf6df9b8a iommu/vt-d: Move Intel IOMMU driver into s=
ubdirectory)
Merging vfio/next (4f085ca2f5a8 Merge branch 'v5.8/vfio/kirti-migration-fix=
es' into v5.8/vfio/next)
Merging audit/next (9d44a121c5a7 audit: add subj creds to NETFILTER_CFG rec=
ord to)
Merging devicetree/for-next (8211d1e83ade dt-bindings: clock: Add documenta=
tion for X1830 bindings.)
Merging mailbox/mailbox-for-next (e9f901dc05c0 mailbox: qcom: Add ipq6018 a=
pcs compatible)
Merging spi/for-next (a86cc4cfcd0b Merge remote-tracking branch 'spi/for-5.=
8' into spi-linus)
Merging tip/auto-latest (8a7fd399f1a0 Merge branch 'ras/core' into auto-lat=
est)
Merging clockevents/timers/drivers/next (809eb4e9bf9d dt-bindings: timer: A=
dd renesas,em-sti bindings)
Merging edac/edac-for-next (daeb3bc9a92f Merge branch 'edac-misc' into edac=
-for-next)
Merging irqchip/irq/irqchip-next (a87d4e00eacb irqchip/gic-v4.1: Use readx_=
poll_timeout_atomic() to fix sleep in atomic)
CONFLICT (content): Merge conflict in drivers/irqchip/Kconfig
Merging ftrace/for-next (388d8bdb87e0 tracing: Remove obsolete PREEMPTIRQ_E=
VENTS kconfig option)
Merging rcu/rcu/next (8747b07d1944 Merge branch 'kcsan-dev.2020.04.13c' int=
o HEAD)
Merging kvm/linux-next (49b3deaad345 Merge tag 'kvmarm-fixes-5.8-1' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvm-arm/next (15c99816ed93 Merge branch 'kvm-arm64/ptrauth-fixes' i=
nto kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (11362b1befea KVM: PPC: Book3S HV: Close race =
with page faults around memslot flushes)
Merging kvms390/next (0b545fd17f84 KVM: s390: remove unneeded semicolon in =
gisa_vcpu_kicker())
Merging xen-tip/linux-next (a952f64d14e5 MAINTAINERS: Update PARAVIRT_OPS_I=
NTERFACE and VMWARE_HYPERVISOR_INTERFACE)
Merging percpu/for-next (dedac37ea96b Merge branch 'for-5.7' into for-next)
Merging workqueues/for-next (10cdb1575954 workqueue: use BUILD_BUG_ON() for=
 compile time test instead of WARN_ON())
Merging drivers-x86/for-next (47a94c551a74 platform/x86: dcdbas: Check SMBI=
OS for protected buffer address)
Merging chrome-platform/for-next (bbb7ad49b835 platform/chrome: cros_usbpd_=
logger: Add __printf annotation to append_str())
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (59ea3c9faf32 leds: add aw2013 driver)
Merging ipmi/for-next (2a556ce779e3 ipmi:ssif: Remove dynamic platform devi=
ce handing)
Merging driver-core/driver-core-next (abfbb29297c2 Merge tag 'rproc-v5.8' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc)
Merging usb/usb-next (af7b4801030c Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/netdev/net)
Merging usb-gadget/next (1c11e74e9079 usb: dwc3: keystone: Turn on USB3 PHY=
 before controller)
Merging usb-serial/usb-next (c432df155919 USB: serial: ch341: fix lockup of=
 devices with limited prescaler)
Merging usb-chipidea-next/ci-for-usb-next (c4100ef2dd42 Documentation: ABI:=
 usb: chipidea: Update Li Jun's e-mail)
Merging phy-next/next (ac0a95a3ea78 phy: intel: Add driver support for Comb=
oPhy)
Merging tty/tty-next (af7b4801030c Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/netdev/net)
Merging char-misc/char-misc-next (6f630784cc0d Merge tag 'clk-for-linus' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux)
Merging extcon/extcon-next (b2e5575a8d04 extcon: arizona: Fix runtime PM im=
balance on error)
Merging soundwire/next (fcbcf1f7b568 soundwire: intel: use a single module)
Merging thunderbolt/next (4caf2511ec49 thunderbolt: Add trivial .shutdown)
Merging staging/staging-next (af7b4801030c Merge git://git.kernel.org/pub/s=
cm/linux/kernel/git/netdev/net)
Merging mux/for-next (05f19f7f8944 mux: adgs1408: Add mod_devicetable.h and=
 remove of_match_ptr)
Merging icc/icc-next (b35da2e86f25 Merge branch 'icc-get-by-index' into icc=
-next)
Merging slave-dma/next (be4cf718cd99 dmaengine: imx-sdma: initialize all sc=
ript addresses)
Merging cgroup/for-next (936f2a70f207 cgroup: add cpu.stat file to root cgr=
oup)
Merging scsi/for-next (42c76c9848e1 scsi: acornscsi: Fix an error handling =
path in acornscsi_probe())
CONFLICT (content): Merge conflict in drivers/scsi/sr.c
Merging scsi-mkp/for-next (42c76c9848e1 scsi: acornscsi: Fix an error handl=
ing path in acornscsi_probe())
Merging vhost/linux-next (a20daaa6c4d6 tools/virtio: Use tools/include/list=
.h instead of stubs)
Merging rpmsg/for-next (71f56fef13d4 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (cdf59728a3cd gpio: arizona: put pm_runtime in case o=
f failure)
Merging gpio-brgl/gpio/for-next (e33a58a29c6a gpio: pca935x: Allow IRQ supp=
ort for driver built as a module)
Merging gpio-intel/for-next (7e73aa90a38c gpio: merrifield: Better show how=
 GPIO and IRQ bases are derived from hardware)
Merging pinctrl/for-next (02e1254d7740 pinctrl: qcom: ipq6018 Add missing p=
ins in qpic pin group)
Merging pinctrl-intel/for-next (6d649fca3491 pinctrl: intel: Move npins clo=
ser to pin_base in struct intel_community)
Merging pinctrl-samsung/for-next (f354157a7d18 pinctrl: samsung: Save/resto=
re eint_mask over suspend for EINT_TYPE GPIOs)
Merging pwm/for-next (f5641d053d46 pwm: Add missing "CONFIG_" prefix)
Merging userns/for-next (d35bec8a5788 Merge proc-next and exec-next for tes=
ting in linux-next)
Merging ktest/for-next (1091c8fce8aa ktest: Fix typos in ktest.pl)
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (8c9469aae3c6 tools: testing: ftrace: trigger: fix s=
pelling mistake)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (e1aef3a1dfdd Merge branch 'for-5.9/selftests=
-cleanup' into for-next)
Merging coresight/next (c9d7e3da1f3c fpga: dfl: afu: Corrected error handli=
ng levels)
Merging rtc/rtc-next (4601e24a6fb8 rtc: pcf2127: watchdog: handle nowayout =
feature)
Merging nvdimm/libnvdimm-for-next (6ec26b8b2d70 nvdimm/pmem: stop using ->q=
ueuedata)
Merging at24/at24/for-next (8f3d9f354286 Linux 5.7-rc1)
Merging ntb/ntb-next (2130c0ba69d6 NTB: ntb_test: Fix bug when counting rem=
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
Merging auxdisplay/auxdisplay (3f03b6498172 auxdisplay: charlcd: Reuse hex_=
to_bin() instead of custom code)
Merging kgdb/kgdb/for-next (c893de12e1ef kdb: Remove the misfeature 'KDBFLA=
GS')
Merging pidfd/for-next (2b40c5db73e2 selftests/pidfd: add pidfd setns tests)
Merging devfreq/devfreq-next (8fc0e48e0fae PM / devfreq: Use lockdep assert=
s instead of manual checks for locked mutex)
Merging hmm/hmm (f07e2f6be37a MAINTAINERS: add HMM selftests)
Merging fpga/for-next (2d80c057efda fpga: dfl: afu: convert get_user_pages(=
) --> pin_user_pages())
Merging kunit/test (0e698dfa2822 Linux 5.7-rc4)
Merging cel/cel-next (0a8e7b7d0846 SUNRPC: Revert 241b1f419f0e ("SUNRPC: Re=
move xdr_buf_trim()"))
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (11399346ac39 mtd: Replace zero-length array with flex=
ible-array)
Merging kunit-next/kunit (5c70ab7c2945 kunit: add support for named resourc=
es)
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
Merging akpm-current/current (7ec4da1428d2 ipc-convert-ipcs_idr-to-xarray-u=
pdate-fix)
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
dropping 316e48dd5cfe3ade8d6e68313815c5512c563589 stacktrace: cleanup incon=
sistent variable type -- patch contents already upstream
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --a=
bort".
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_amd=
kfd.h
$ git rebase --continue
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --a=
bort".
CONFLICT (content): Merge conflict in kernel/kthread.c
CONFLICT (content): Merge conflict in include/linux/kthread.h
$ git rebase --skip
dropping 0360167308cc467c4453d7cab0d9e42d0cf7e074 kernel: move use_mm/unuse=
_mm to kthread.c -- patch contents already upstream
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --a=
bort".
CONFLICT (content): Merge conflict in kernel/kthread.c
CONFLICT (content): Merge conflict in fs/io-wq.c
CONFLICT (content): Merge conflict in drivers/vhost/vhost.c
CONFLICT (content): Merge conflict in drivers/usb/gadget/function/f_fs.c
$ git rebase --skip
dropping bd76f5173eb4bc7909a121441be9ae0a7cfaf096 kernel-better-document-th=
e-use_mm-unuse_mm-api-contract-v2 -- patch contents already upstream
dropping d91d9cab7161a9d81ab06ad1b7a94e4994c64713 powerpc/vas: fix up for {=
un}use_mm() rename -- patch contents already upstream
dropping 030d52ff81e0acd40780e43cb1cefe382bc0dd3f drm/amdkfd: fix up for {u=
n}use_mm() rename -- patch contents already upstream
dropping 3887be980781d72d390cdadfa2e9e16210e87633 kernel: set USER_DS in kt=
hread_use_mm -- patch contents already upstream
Merging akpm/master (559db69e8bfc sh: add missing EXPORT_SYMBOL() for __del=
ay)

--Sig_/Y.JcNjBkkrSc3jXG/R_gGWm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7i+McACgkQAVBC80lX
0GxJtwf/T3vDsK+OLwBYJ5WXaku3FBwOhsx3MlzpisSwbNksH4qxRBAvduqqHQBs
6yQe2GRTR6MYlcuA3+ns2OQxi+KtstjKsRXWz8TtG03gcbqWxBZY2NI40I3xnIJl
MhjlqWcHtBO6zOokkeGJW9RqqH7SnOhD0IzzvZwWqbeHQXsp48c+Pmxux8W+aC7G
RsRrqxWcNLPWV3BJPbPw2QoCjO1XqG8BBOpd+KnGMGHkqqcrjKe+ZXoLbE5lxSoe
q4tFEp7FLLAWsT8L3tIcTsKom/OjQJ7lHCRP+RYtqQxB3vilJm6lPFWj001xkQa0
RpeHJjJwufNDO90DPB+N3/d+fGL4nw==
=4mBu
-----END PGP SIGNATURE-----

--Sig_/Y.JcNjBkkrSc3jXG/R_gGWm--
