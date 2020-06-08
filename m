Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39BFF1F16D5
	for <lists+linux-next@lfdr.de>; Mon,  8 Jun 2020 12:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729310AbgFHKlh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Jun 2020 06:41:37 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57867 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729280AbgFHKlb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 8 Jun 2020 06:41:31 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49gVD15W48z9sRR;
        Mon,  8 Jun 2020 20:41:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591612881;
        bh=aBhkl7iUaYdxRT6zUeZXRQcltMd65UXD6bsPYaGnCtI=;
        h=Date:From:To:Cc:Subject:From;
        b=iu6a6kcASEP5NqebHU9rMGpXHVsreYO42BTYK+EzSL4UlkBUFqnqNxwEKKpmjt70Y
         vyvu87Fgqb4SgJYLKEC2S0lPxn7E9I2IKmGa6dHqRs4gptjFTSfabQlQJMR8IQJIgB
         yxpw0oY2pxTs4hDtZD6CNsupsqE/7ABHb8aQ0G6l5PUkdqFa+M6mTpKihCVURkG9gq
         nRUboWPdk23VvczO7dFajiXaLVKyTndeeV/wSgIP6/alLflGUry042v085V2+Fot8T
         Y0FYdTsRjVxkeMtzdd55vEYpGIWbbypx0tsKtGYUrIbdNIiKrwiyo7zh5hddZAabLR
         BtoI7Pv4Cyadw==
Date:   Mon, 8 Jun 2020 20:41:20 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 8
Message-ID: <20200608204120.5d3c8c50@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FbETR7zeQr4I0u6Y4tYg_9a";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/FbETR7zeQr4I0u6Y4tYg_9a
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

There will be no linux-next release tomorrow.

News: The merge window has opened, so please do *not* add v5.9 material
to your linux-next included branches until after v5.8-rc1 has been
released.

Changes since 20200605:

My fixes tree contains:

  4cb4bfffe2c1 ("device_cgroup: Fix RCU list debugging warning")

The sound-current tree lost its build failure.

Non-merge commits (relative to Linus' tree): 2736
 3751 files changed, 309974 insertions(+), 44639 deletions(-)

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
Merging origin/master (9aa900c8094d Merge tag 'char-misc-5.8-rc1' of git://=
git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc)
Merging fixes/master (df8cb0ea9423 device_cgroup: Fix RCU list debugging wa=
rning)
Merging kbuild-current/fixes (b170290c2836 Merge tag 'kconfig-v5.8' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild)
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
Merging sparc/master (fcdf818d239e Merge branch 'sparc-scnprintf')
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (4e2905adac9f net: dp83869: Reset return variable if PHY=
 strap is read)
Merging bpf/master (e7ed83d6fa1a bpf: Fix an error code in check_btf_func())
Merging ipsec/master (a4902d914e50 xfrm: merge fixup for "remove output_fin=
ish indirection from xfrm_state_afinfo")
Merging netfilter/master (bdc48fa11e46 checkpatch/coding-style: deprecate 8=
0-column warning)
Merging ipvs/master (bdc48fa11e46 checkpatch/coding-style: deprecate 80-col=
umn warning)
Merging wireless-drivers/master (f92f26f2ed2c iwlwifi: pcie: handle QuZ con=
figs with killer NICs as well)
Merging mac80211/master (523f3ec030aa mac80211: initialize return flags in =
HE 6 GHz operation parsing)
Merging rdma-fixes/for-rc (3d77e6a8804a Linux 5.7)
Merging sound-current/for-linus (91231e525bb6 ALSA: emu10k1: delete an unne=
cessary condition)
Merging sound-asoc-fixes/for-linus (1dd9cd775ef5 Merge remote-tracking bran=
ch 'asoc/for-5.8' into asoc-linus)
Merging regmap-fixes/for-linus (323ca2daef47 Merge remote-tracking branch '=
regmap/for-5.8' into regmap-linus)
Merging regulator-fixes/for-linus (5fb565b69dab Merge remote-tracking branc=
h 'regulator/for-5.8' into regulator-linus)
Merging spi-fixes/for-linus (7ce6dc9ef58d Merge remote-tracking branch 'spi=
/for-5.8' into spi-linus)
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
Merging thunderbolt-fixes/fixes (3d77e6a8804a Linux 5.7)
Merging input-current/for-linus (8dd06ef34b6e Merge branch 'next' into for-=
linus)
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
Merging omap-fixes/fixes (636338d7968e bus: ti-sysc: Increase max softreset=
 wait)
Merging kvm-fixes/master (6929f71e46bd atomisp: avoid warning about unused =
function)
Merging kvms390-fixes/master (5615e74f48dc KVM: s390: Remove false WARN_ON_=
ONCE for the PQAP instruction)
Merging hwmon-fixes/hwmon (ac11b65c0d26 hwmon: (bt1-pvt) Define Temp- and V=
olt-to-N poly as maybe-unused)
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
Merging risc-v-fixes/fixes (8356c379cfba RISC-V: gp_in_global needs registe=
r keyword)
Merging pidfd-fixes/fixes (3f2c788a1314 fork: prevent accidental access to =
clone3 features)
Merging fpga-fixes/fixes (9edd5112d963 fpga: zynqmp: fix modular build)
Merging spdx/spdx-linus (3d77e6a8804a Linux 5.7)
Merging gpio-intel-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging pinctrl-intel-fixes/fixes (69388e15f507 pinctrl: cherryview: Add mi=
ssing spinlock usage in chv_gpio_irq_handler)
Merging erofs-fixes/fixes (d1eef1c61974 Linux 5.5-rc2)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging drm-misc-fixes/for-linux-next-fixes (abf56fadf0e2 gpu/drm: Ingenic:=
 Fix opaque pointer casted to wrong type)
Merging kspp-gustavo/for-next/kspp (fb24bed5c035 w1: Replace zero-length ar=
ray with flexible-array)
Merging kbuild/for-next (b170290c2836 Merge tag 'kconfig-v5.8' of git://git=
.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild)
Merging compiler-attributes/compiler-attributes (98d54f81e36b Linux 5.6-rc4)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (94d1aed9f477 Merge branch 'dma-sg_table-helpe=
r' into dma-mapping-for-next)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (03c7f5f0b844 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (5311ebfb612f arm64: debug: mark a function as =
__init to save some memory)
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
Merging scmi/for-linux-next (cfb3fa6421f6 Merge branch 'for-next/juno' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging sunxi/sunxi/for-next (243cd8fba48d Merge branch 'sunxi/dt-for-5.8' =
into sunxi/for-next)
Merging tegra/for-next (cd049d898ab8 Merge branch for-5.8/arm64/dt into for=
-next)
Merging ti-k3/ti-k3-next (cae809434da1 arm64: dts: ti: k3-j721e-main: Add m=
ain domain watchdog entries)
Merging uniphier/for-next (0e698dfa2822 Linux 5.7-rc4)
Merging clk/clk-next (166e4b484197 Merge branches 'clk-vc5', 'clk-hsdk', 'c=
lk-mediatek' and 'clk-baikal' into clk-next)
CONFLICT (content): Merge conflict in arch/mips/loongson2ef/Kconfig
CONFLICT (modify/delete): Documentation/devicetree/bindings/arm/mediatek/me=
diatek,pericfg.txt deleted in HEAD and modified in clk/clk-next. Version cl=
k/clk-next of Documentation/devicetree/bindings/arm/mediatek/mediatek,peric=
fg.txt left in tree.
$ git rm -f Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg=
.txt
Applying: dt-bindings: fix up for "dt-bindings: clock: mediatek: document c=
lk bindings for Mediatek MT6765 SoC"
Merging clk-samsung/for-next (25bdae0f1c66 clk: samsung: exynos5433: Add IG=
NORE_UNUSED flag to sclk_i2s1)
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
Merging risc-v/for-next (e4bdb161fbb9 riscv: fix build warning of missing p=
rototypes)
Merging sifive/for-next (467e050e9760 Merge branch 'i2c/for-current' of git=
://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging s390/features (bfa50e1427e4 vfio-ccw: make vfio_ccw_regops variable=
s declarations static)
CONFLICT (content): Merge conflict in arch/s390/kvm/vsie.c
CONFLICT (content): Merge conflict in arch/s390/kernel/smp.c
Merging sh/for-next (37744feebc08 sh: remove sh5 support)
Merging sparc-next/master (824c874abc1d Merge branch 'for-davem' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
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
Merging cifs/for-next (5865985416eb smb3: extend fscache mount volume coher=
ency check)
Merging configfs/for-next (8aebfffacfa3 configfs: fix config_item refcnt le=
ak in configfs_rmdir())
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (34f853b849eb erofs: suppress false positive last_block w=
arning)
Merging exfat/dev (dd6e2b38b867 exfat: fix range validation error in alloc =
and free cluster)
Merging ext3/for_next (16ec8bfe257b Pull ext2 xattr cleanups.)
Merging ext4/dev (6b8ed62008a4 ext4: avoid unnecessary transaction starts d=
uring writeback)
Merging f2fs/dev (adf3d3a53cf1 f2fs: don't return vmalloc() memory from f2f=
s_kmalloc())
CONFLICT (content): Merge conflict in fs/f2fs/f2fs.h
Merging fsverity/fsverity (9cd6b593cfc9 fs-verity: remove unnecessary exter=
n keywords)
Merging fuse/for-next (9b46418c40fe fuse: copy_file_range should truncate c=
ache)
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (3d77e6a8804a Linux 5.7)
Merging nfs-anna/linux-next (07e620d607d9 NFS: Fix direct WRITE throughput =
regression)
Merging nfsd/nfsd-next (037e910b52b0 SUNRPC: Remove unreachable error condi=
tion in rpcb_getport_async())
CONFLICT (content): Merge conflict in net/sunrpc/svcsock.c
CONFLICT (content): Merge conflict in net/sunrpc/svc_xprt.c
CONFLICT (content): Merge conflict in include/trace/events/sunrpc.h
Merging orangefs/for-next (0df556457748 orangefs: convert get_user_pages() =
--> pin_user_pages())
Merging overlayfs/overlayfs-next (81e69c8b9e02 ovl: add nosync mount option)
Merging ubifs/linux-next (4b68bf9a69d2 ubi: Select fastmap anchor PEBs cons=
idering wear level rules)
Merging v9fs/9p-next (36f9967531da 9p/xen: increase XEN_9PFS_RING_ORDER)
Merging xfs/for-next (6dcde60efd94 xfs: more lockdep whackamole with kmem_a=
lloc*)
Merging zonefs/for-next (568776f992c4 zonefs: Replace uuid_copy() with impo=
rt_uuid())
Merging iomap/iomap-for-next (b75dfde12129 fibmap: Warn and return an error=
 in case of block > INT_MAX)
Merging djw-vfs/vfs-for-next (e4f9ba20d3b8 fs/xfs: Update xfs_ioctl_setattr=
_dax_invalidate())
Merging file-locks/locks-next (5ef159681309 locks: add locks_move_blocks in=
 posix_lock_inode)
Merging vfs/for-next (b09e728da62f Merge branches 'work.misc', 'work.epoll'=
, 'uaccess.misc', 'uaccess.hpsa' and 'uaccess.i915' into for-next)
Merging printk/for-next (e35456906bd4 Merge branch 'for-5.8' into for-next)
Merging pci/next (2bd81cd04a3f Merge branch 'remotes/lorenzo/pci/vmd')
Merging pstore/for-next/pstore (78c08247b9d3 mtd: Support kmsg dumper based=
 on pstore/blk)
Merging hid/for-next (5d7d489e9129 Merge branch 'for-5.8/multitouch' into f=
or-next)
Merging i2c/i2c/for-next (726b03203e45 Merge branch 'i2c/for-5.8' into i2c/=
for-next)
Merging i3c/i3c/next (b4203ce05563 i3c master: GETMRL's 3rd byte is optiona=
l even with BCR_IBI_PAYLOAD)
Merging dmi/master (d9d8efd3241b firmware/dmi: Report DMI Bios & EC firmwar=
e release)
Merging hwmon-staging/hwmon-next (ac11b65c0d26 hwmon: (bt1-pvt) Define Temp=
- and Volt-to-N poly as maybe-unused)
Merging jc_docs/docs-next (e35b5a4c494a Documentation: fixes to the maintai=
ner-entry-profile template)
Merging v4l-dvb/master (938b29db3aa9 media: Documentation: media: Refer to =
mbus format documentation from CSI-2 docs)
Merging v4l-dvb-next/master (be4b9e888184 media: atomisp: get rid of a stri=
ng_support.h abstraction layer)
CONFLICT (content): Merge conflict in drivers/staging/media/atomisp/pci/ato=
misp_v4l2.c
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (5947e801f2e1 Merge branches 'pm-opp' and 'pm-cpufreq=
' into linux-next)
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
Merging net-next/master (cb8e59cc8720 Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/netdev/net-next)
Merging bpf-next/master (cb8e59cc8720 Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/netdev/net-next)
Merging ipsec-next/master (9a25c1df24a6 Merge git://git.kernel.org/pub/scm/=
linux/kernel/git/bpf/bpf-next)
Merging mlx5-next/mlx5-next (6b646a7e4af6 net/mlx5: Add ability to read and=
 write ECE options)
Merging netfilter-next/master (9a25c1df24a6 Merge git://git.kernel.org/pub/=
scm/linux/kernel/git/bpf/bpf-next)
Merging ipvs-next/master (9a25c1df24a6 Merge git://git.kernel.org/pub/scm/l=
inux/kernel/git/bpf/bpf-next)
Merging wireless-drivers-next/master (1806c13dc253 Merge git://git.kernel.o=
rg/pub/scm/linux/kernel/git/netdev/net)
Merging bluetooth/master (4c07a5d7aeb3 Bluetooth: hci_qca: Fix an error poi=
nter dereference)
Merging mac80211-next/master (cb8e59cc8720 Merge git://git.kernel.org/pub/s=
cm/linux/kernel/git/netdev/net-next)
Merging gfs2/for-next (300e549b6e53 Merge branch 'gfs2-iopen' into for-next)
Merging mtd/mtd/next (5788ccf3c84f mtd: clear cache_state to avoid writing =
to bad blocks repeatedly)
Merging nand/nand/next (86f2b225adf4 mtd: rawnand: Add an invalid ECC mode =
to discriminate with valid ones)
Merging spi-nor/spi-nor/next (e8aec15dd584 mtd: spi-nor: winbond: Fix 4-byt=
e opcode support for w25q256)
Merging crypto/master (58ca0060ec4e crypto: hisilicon - fix driver compatib=
ility issue with different versions of devices)
Merging drm/drm-next (9ca1f474cea0 Merge tag 'amd-drm-next-5.8-2020-05-27' =
of git://people.freedesktop.org/~agd5f/linux into drm-next)
Merging amdgpu/drm-next (624a498a539a drm/amdgpu: add another raven1 gfxoff=
 quirk)
Merging drm-intel/for-linux-next (f8665d797b1c Merge tag 'gvt-next-fixes-20=
20-05-28' of https://github.com/intel/gvt-linux into drm-intel-next-fixes)
Merging drm-tegra/drm/tegra/for-next (d1c746f8b59d drm/tegra: hub: Do not e=
nable orphaned window group)
Merging drm-misc/for-linux-next (968d81a64a88 drm/connector: notify userspa=
ce on hotplug after register complete)
Merging drm-msm/msm-next (1cb2c4a2c89b Revert "drm/msm/dpu: add support for=
 clk and bw scaling for display")
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (2c76b324c794 drm/imx: parallel-display: Adjus=
t bus_flags handling)
Merging etnaviv/etnaviv/next (f232d9ec029c drm/etnaviv: fix TS cache flushi=
ng on GPUs with BLT engine)
Merging regmap/for-next (323ca2daef47 Merge remote-tracking branch 'regmap/=
for-5.8' into regmap-linus)
Merging sound/for-next (91231e525bb6 ALSA: emu10k1: delete an unnecessary c=
ondition)
Merging sound-asoc/for-next (1dd9cd775ef5 Merge remote-tracking branch 'aso=
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
Merging integrity/next-integrity (42413b49804b ima: Directly free *entry in=
 ima_alloc_init_template() if digests is NULL)
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
Merging iommu/next (431275afdc71 iommu: Check for deferred attach in iommu_=
group_do_dma_attach())
CONFLICT (content): Merge conflict in drivers/iommu/s390-iommu.c
Merging vfio/next (4f085ca2f5a8 Merge branch 'v5.8/vfio/kirti-migration-fix=
es' into v5.8/vfio/next)
Merging audit/next (9d44a121c5a7 audit: add subj creds to NETFILTER_CFG rec=
ord to)
Merging devicetree/for-next (8211d1e83ade dt-bindings: clock: Add documenta=
tion for X1830 bindings.)
Merging mailbox/mailbox-for-next (b7b2796b9b31 mailbox: imx: ONLY IPC MU ne=
eds IRQF_NO_SUSPEND flag)
Merging spi/for-next (7ce6dc9ef58d Merge remote-tracking branch 'spi/for-5.=
8' into spi-linus)
Merging tip/auto-latest (22a1c800c96c Merge branch 'WIP.core/headers')
CONFLICT (content): Merge conflict in arch/sparc/mm/srmmu.c
Applying: KVM: SVM: fix up for do_machine_check() API change
Merging clockevents/timers/drivers/next (809eb4e9bf9d dt-bindings: timer: A=
dd renesas,em-sti bindings)
Merging edac/edac-for-next (daeb3bc9a92f Merge branch 'edac-misc' into edac=
-for-next)
Merging irqchip/irq/irqchip-next (5a7f796d4f20 irqchip/loongson-pci-msi: Fi=
x a typo in Kconfig)
CONFLICT (content): Merge conflict in drivers/irqchip/Kconfig
Merging ftrace/for-next (daceabf1b494 tracing/doc: Fix ascii-art in histogr=
am-design.rst)
Merging rcu/rcu/next (8747b07d1944 Merge branch 'kcsan-dev.2020.04.13c' int=
o HEAD)
Merging kvm/linux-next (6929f71e46bd atomisp: avoid warning about unused fu=
nction)
Merging kvm-arm/next (7ae2f3db6167 KVM: arm64: Flush the instruction cache =
if not unmapping the VM on reboot)
Merging kvm-ppc/kvm-ppc-next (11362b1befea KVM: PPC: Book3S HV: Close race =
with page faults around memslot flushes)
Merging kvms390/next (0b545fd17f84 KVM: s390: remove unneeded semicolon in =
gisa_vcpu_kicker())
Merging xen-tip/linux-next (3add7f304269 xen/arm: call dma_to_phys on the d=
ma_addr_t parameter of dma_cache_maint)
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
Merging driver-core/driver-core-next (8c3e315d4296 driver core: Update devi=
ce link status correctly for SYNC_STATE_ONLY links)
Merging usb/usb-next (347052e3bf1b usb: dwc3: meson-g12a: fix USB2 PHY init=
ialization on G12A and A1 SoCs)
Merging usb-gadget/next (1c11e74e9079 usb: dwc3: keystone: Turn on USB3 PHY=
 before controller)
Merging usb-serial/usb-next (c432df155919 USB: serial: ch341: fix lockup of=
 devices with limited prescaler)
Merging usb-chipidea-next/ci-for-usb-next (c4100ef2dd42 Documentation: ABI:=
 usb: chipidea: Update Li Jun's e-mail)
Merging phy-next/next (ac0a95a3ea78 phy: intel: Add driver support for Comb=
oPhy)
Merging tty/tty-next (a1b44ea340b2 tty: serial: qcom_geni_serial: Add 51.2M=
Hz frequency support)
Merging char-misc/char-misc-next (05c8a4fc44a9 habanalabs: correctly cast u=
64 to void*)
Merging extcon/extcon-next (b2e5575a8d04 extcon: arizona: Fix runtime PM im=
balance on error)
Merging soundwire/next (fcbcf1f7b568 soundwire: intel: use a single module)
Merging thunderbolt/next (4caf2511ec49 thunderbolt: Add trivial .shutdown)
Merging staging/staging-next (77f55d1305c1 staging: rtl8723bs: Use common p=
acket header constants)
Merging mux/for-next (05f19f7f8944 mux: adgs1408: Add mod_devicetable.h and=
 remove of_match_ptr)
Merging icc/icc-next (b35da2e86f25 Merge branch 'icc-get-by-index' into icc=
-next)
Merging slave-dma/next (be4cf718cd99 dmaengine: imx-sdma: initialize all sc=
ript addresses)
Merging cgroup/for-next (936f2a70f207 cgroup: add cpu.stat file to root cgr=
oup)
Merging scsi/for-next (01e5493c08b9 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (06b43f968db5 scsi: hpsa: hpsa_ioctl(): Tidy up a=
 bit)
Merging vhost/linux-next (bdea059ef682 vhost: drop head based APIs)
Merging rpmsg/for-next (71f56fef13d4 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (74910e15ab25 gpio: pca953x: Drop unneeded ACPI_PTR())
Merging gpio-brgl/gpio/for-next (e33a58a29c6a gpio: pca935x: Allow IRQ supp=
ort for driver built as a module)
Merging gpio-intel/for-next (7e73aa90a38c gpio: merrifield: Better show how=
 GPIO and IRQ bases are derived from hardware)
Merging pinctrl/for-next (94873f6b46f8 pinctrl: sprd: Fix the incorrect pul=
l-up definition)
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
Merging kselftest/next (382561a0f11c selftests/sysctl: Make sysctl test dri=
ver as a module)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (8631420cac7d Merge branch 'for-5.8/klp-modul=
e-fixups' into for-next)
Merging coresight/next (c9d7e3da1f3c fpga: dfl: afu: Corrected error handli=
ng levels)
Merging rtc/rtc-next (4601e24a6fb8 rtc: pcf2127: watchdog: handle nowayout =
feature)
Merging nvdimm/libnvdimm-for-next (f6d2b802f80d Merge branch 'for-5.7/libnv=
dimm' into libnvdimm-for-next)
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
Merging kunit-next/kunit (6d6861d45e38 security: apparmor: default KUNIT_* =
fragments to KUNIT_ALL_TESTS)
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
Merging akpm-current/current (d3a8688496cd linux-next-pre)
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --a=
bort".
CONFLICT (content): Merge conflict in arch/sh/mm/fault.c
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --a=
bort".
CONFLICT (content): Merge conflict in mm/util.c
dropping 97ec4b1a3a4abf406bc06c2b595bca599d290504 h8300: remove usage of __=
ARCH_USE_5LEVEL_HACK -- patch contents already upstream
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --a=
bort".
CONFLICT (content): Merge conflict in arch/arm/mm/init.c
dropping e87d76cf51e1f00a8e258589060b9015ec93393d arm-add-support-for-folde=
d-p4d-page-tables-fix -- patch contents already upstream
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --a=
bort".
CONFLICT (content): Merge conflict in arch/arm64/kvm/mmu.c
dropping 47f5a844c89562a7c4c65c6142a128dedf84735c arm64: kvm: fix gcc-10 sh=
ift warning -- patch contents already upstream
dropping 1468951aa6ca4834b68a986e53e9c3b1c95feaac hexagon: remove __ARCH_US=
E_5LEVEL_HACK -- patch contents already upstream
dropping 7767fd03e792714a10834a9be6da40f48cdf4bdd ia64: add support for fol=
ded p4d page tables -- patch contents already upstream
dropping f4ff3fd3cd65bcda476f052e3c2881c7bf2abc22 nios2: add support for fo=
lded p4d page tables -- patch contents already upstream
dropping 1cc815fde7d5ab3b4d533fce8b12dc9e636e94ca openrisc: add support for=
 folded p4d page tables -- patch contents already upstream
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --a=
bort".
CONFLICT (content): Merge conflict in arch/powerpc/xmon/xmon.c
CONFLICT (content): Merge conflict in arch/powerpc/mm/ptdump/ptdump.c
dropping 97239d9bbe9e55175a5a6bd7afae5dbf4f5447de fixup for powerpc ptdump.=
c -- patch contents already upstream
dropping 5319f65de9e4db65559a8f188cd60bff06f0e601 powerpc/xmon: drop unused=
 pgdir varialble in show_pte() function -- patch contents already upstream
dropping 0bf77d759b73b7319e81d4c578b26d390041369e sh: fault: Modernize prin=
ting of kernel messages -- patch contents already upstream
dropping 27d4bfa01b33fcc3946ccd44a951f4cb2ae42c16 sh: drop __pXd_offset() m=
acros that duplicate pXd_index() ones -- patch contents already upstream
dropping 277c3d7a2da3574fa5582b24251676ba14a2104b sh: add support for folde=
d p4d page tables -- patch contents already upstream
dropping f8e871025f83eff062faebdc1eb2542b3a395ef3 unicore32: remove __ARCH_=
USE_5LEVEL_HACK -- patch contents already upstream
dropping 7c96cf58837b78af3bd96c209cdce05cc3aa3739 asm-generic: remove pgtab=
le-nop4d-hack.h -- patch contents already upstream
dropping e9a866156497d55cc0bb0b4227672855ca90a538 mm: remove __ARCH_HAS_5LE=
VEL_HACK and include/asm-generic/5level-fixup.h -- patch contents already u=
pstream
Merging akpm/master (1b37e2b4b943 sh: add missing EXPORT_SYMBOL() for __del=
ay)

--Sig_/FbETR7zeQr4I0u6Y4tYg_9a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7eFdAACgkQAVBC80lX
0GwLfgf/fVCoZUln+t9tKNy5f0ZmNGRixWVag2BGLJ7zKDplNKJPl6aKa2RcguH7
i7JZBXFWwf0eVFnlkRycXE6rbUOc1aZvPPyBJtwiCisyvS/A50rvBIhoLJl3gWLR
X83mcIoX+ClfifeYMUnj0BlUP0KQFLdsa+2gaQlPlTAqbB6Qn9jg6rOORLWDP/M6
oNrjnHGxuyn3qLx1A8Y3MZjd8UnMdh2Vy8Ewq2AO2TctVcN/IxoBNwAb4N6JL32N
AX4IRs7jOnEfqF9aoxPVVQyZURBSBHyo6UEIqsySy9rR9g/nCorjOHam8pBPsK8f
WL+kWC0O8MtBsDsdjeb6sksS/dm1Ng==
=5lcz
-----END PGP SIGNATURE-----

--Sig_/FbETR7zeQr4I0u6Y4tYg_9a--
