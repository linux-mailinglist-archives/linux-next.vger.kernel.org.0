Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF2EE44FCCD
	for <lists+linux-next@lfdr.de>; Mon, 15 Nov 2021 02:47:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbhKOBuU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Nov 2021 20:50:20 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:38153 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbhKOBuS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 14 Nov 2021 20:50:18 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HssWW3k4Sz4xbs;
        Mon, 15 Nov 2021 12:47:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1636940839;
        bh=4pezVH3r6CAMU711Lb/Ph6pGhegN4VUgIfPZ5W3rVro=;
        h=Date:From:To:Cc:Subject:From;
        b=Z4QOb+CcWgd/RAn+dS5b6m4UcCXiZbG9tY2Tv3SusNfKukLdFT/gCHu/GrcV3Lsvk
         JIypHUKf+t7x1XN9JgZMi+R/YsM0nalOxcAOYby2sHPicVH5plQEkbcYUZzglxk0Fx
         6lTRLRjJ/e2Y6KvhuYw8Ccyi3yv4XMkYnxokaVRBwTjjhiZ2CRcxpR4HUK0NB9kRWs
         JqfYTrwLK5aT5mxW8123gUrgqkWr6b0Q/sGEyU91qM7lGgCg9wwEwVRwmQW7deV4H1
         p3eB+GA7jhEqAkjSUluiFqsymSqIjF/0X6gBWsdnzW8PhQRKhfzmI88XmgBNy9YQpG
         gvELmFk+kG6fg==
Date:   Mon, 15 Nov 2021 12:47:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 15
Message-ID: <20211115124718.317db60d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TT/qdpx1dmpBek3xe3n4CoT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/TT/qdpx1dmpBek3xe3n4CoT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20211112:

The pci-current tree gained a conflict against Linus' tree.

I have disabled the ntfs file system write capabaility for now as it
fails for builds with 64k pages.

Non-merge commits (relative to Linus' tree): 483
 686 files changed, 42942 insertions(+), 7588 deletions(-)

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
ppc44x_defconfig, allyesconfig and pseries_le_defconfig and i386,
arm64, sparc and sparc64 defconfig and htmldocs. And finally, a simple
boot test of the powerpc pseries_le_defconfig kernel in qemu (with and
without kvm enabled).

Below is a summary of the state of the merge.

I am currently merging 342 trees (counting Linus' and 92 trees of bug
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
Merging origin/master (ce49bfc8d037 Merge tag 'xfs-5.16-merge-5' of git://g=
it.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging fixes/fixes (3ca706c189db drm/ttm: fix type mismatch error on sparc=
64)
Merging kbuild-current/fixes (e851dfae4371 Merge tag 'kgdb-5.16-rc1' of git=
://git.kernel.org/pub/scm/linux/kernel/git/danielt/linux)
Merging arc-current/for-curr (b9cac915c541 ARC: thread_info.h: correct two =
typos in a comment)
Merging arm-current/fixes (418ace9992a7 ARM: 9156/1: drop cc-option fallbac=
ks for architecture selection)
Merging arm64-fixes/for-next/fixes (596143e3aec3 acpi/arm64: fix next_platf=
orm_timer() section mismatch error)
Merging arm-soc-fixes/arm/fixes (76f79231666a Merge tag 'soc-fsl-fix-v5.15-=
2' of git://git.kernel.org/pub/scm/linux/kernel/git/leo/linux into arm/fixe=
s)
Merging drivers-memory-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging m68k-current/for-linus (8a3c0a74ae87 m68k: defconfig: Update defcon=
figs for v5.15-rc1)
Merging powerpc-fixes/fixes (8bb7eca972ad Linux 5.15)
Merging s390-fixes/fixes (8bb7eca972ad Linux 5.15)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (80f6e3080bfc fs-verity: fix signed inte=
ger overflow with i_size near S64_MAX)
Merging net/master (1aa3b2207e88 net,lsm,selinux: revert the security_sctp_=
assoc_established() hook)
Merging bpf/master (14554595dadd Merge branch 'Forbid bpf_ktime_get_coarse_=
ns and bpf_timer_* in tracing progs')
Merging ipsec/master (93ec1320b017 xfrm: fix rcu lock in xfrm_notify_userpo=
licy())
Merging netfilter/master (39f6eed4cb20 netfilter: flowtable: fix IPv6 tunne=
l addr match)
Merging ipvs/master (c45231a7668d litex_liteeth: Fix a double free in the r=
emove function)
Merging wireless-drivers/master (603a1621caa0 mwifiex: avoid null-pointer-s=
ubtraction warning)
Merging mac80211/master (c45231a7668d litex_liteeth: Fix a double free in t=
he remove function)
Merging rdma-fixes/for-rc (4f960393a0ee RDMA/qedr: Fix NULL deref for query=
_qp on the GSI QP)
Merging sound-current/for-linus (bd5e2c22a9cf ALSA: cmipci: Drop stale vari=
able assignment)
Merging sound-asoc-fixes/for-linus (80057cf04208 Merge remote-tracking bran=
ch 'asoc/for-5.16' into asoc-linus)
Merging regmap-fixes/for-linus (38a4b4fb7c73 Merge remote-tracking branch '=
regmap/for-5.15' into regmap-linus)
Merging regulator-fixes/for-linus (519d81956ee2 Linux 5.15-rc6)
Merging spi-fixes/for-linus (cf45d01e6321 Merge remote-tracking branch 'spi=
/for-5.16' into spi-linus)
Merging pci-current/for-linus (eca2719173b5 Revert "of/irq: Allow matching =
of an interrupt-map local to an interrupt controller")
CONFLICT (content): Merge conflict in drivers/of/irq.c
Merging driver-core.current/driver-core-linus (c8c109546a19 Merge tag 'zstd=
-for-linus-v5.16' of git://github.com/terrelln/linux)
Merging tty.current/tty-linus (c8c109546a19 Merge tag 'zstd-for-linus-v5.16=
' of git://github.com/terrelln/linux)
Merging usb.current/usb-linus (c8c109546a19 Merge tag 'zstd-for-linus-v5.16=
' of git://github.com/terrelln/linux)
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (519d81956ee2 Linux 5.15-rc6)
Merging usb-chipidea-fixes/for-usb-fixes (f130d08a8d79 usb: chipidea: ci_hd=
rc_imx: Also search for 'phys' phandle)
Merging phy/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging staging.current/staging-linus (c8c109546a19 Merge tag 'zstd-for-lin=
us-v5.16' of git://github.com/terrelln/linux)
Merging iio-fixes/fixes-togreg (8db63222155d iio: ad7768-1: Call iio_trigge=
r_notify_done() on error)
Merging char-misc.current/char-misc-linus (c8c109546a19 Merge tag 'zstd-for=
-linus-v5.16' of git://github.com/terrelln/linux)
Merging soundwire-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging thunderbolt-fixes/fixes (8bb7eca972ad Linux 5.15)
Merging input-current/for-linus (efe6f16c6faf Merge branch 'next' into for-=
linus)
Merging crypto-current/master (beaaaa37c664 crypto: api - Fix boot-up crash=
 when crypto manager is disabled)
Merging vfio-fixes/for-linus (42de956ca7e5 vfio/ap_ops: Add missed vfio_uni=
nit_group_dev())
Merging kselftest-fixes/fixes (519d81956ee2 Linux 5.15-rc6)
Merging modules-fixes/modules-linus (0d67e332e6df module: fix clang CFI wit=
h MODULE_UNLOAD=3Dn)
Merging dmaengine-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging backlight-fixes/for-backlight-fixes (a38fd8748464 Linux 5.12-rc2)
Merging mtd-fixes/mtd/fixes (f60f5741002b mtd: rawnand: qcom: Update code w=
ord value for raw read)
Merging mfd-fixes/for-mfd-fixes (a61f4661fba4 mfd: intel_quark_i2c_gpio: Re=
vert "Constify static struct resources")
Merging v4l-dvb-fixes/fixes (13cbaa4c2b7b media: cec: copy sequence field f=
or the reply)
Merging reset-fixes/reset/fixes (3ad60b4b3570 reset: socfpga: add empty dri=
ver allowing consumers to probe)
Merging mips-fixes/mips-fixes (740da9d7ca4e MIPS: Revert "add support for b=
uggy MT7621S core detection")
Merging at91-fixes/at91-fixes (dbe68bc9e82b ARM: dts: at91: sama7g5ek: to n=
ot touch slew-rate for SDMMC pins)
Merging omap-fixes/fixes (80d680fdccba ARM: dts: omap3430-sdp: Fix NAND dev=
ice node)
Merging kvm-fixes/master (84886c262ebc Merge tag 'kvmarm-fixes-5.16-1' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into kvm-master)
Merging kvms390-fixes/master (0e9ff65f455d KVM: s390: preserve deliverable_=
mask in __airqs_kick_single_vcpu)
Merging hwmon-fixes/hwmon (a15579ed693a hwmon: (nct6775) mask out bank numb=
er in nct6775_wmi_read_value())
Merging nvdimm-fixes/libnvdimm-fixes (3dd60fb9d95d nvdimm/pmem: stop using =
q_usage_count as external pgmap refcount)
Merging cxl-fixes/fixes (fae8817ae804 cxl/mem: Fix memory device capacity p=
robing)
Merging btrfs-fixes/next-fixes (ba9bc05f3655 Merge tag 'v5.15' into next-fi=
xes)
Merging vfs-fixes/fixes (25f54d08f12f autofs: fix wait name hash calculatio=
n in autofs_wait())
Merging dma-mapping-fixes/for-linus (18a3c5f7abfd Merge tag 'for_linus' of =
git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging i3c-fixes/i3c/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging drivers-x86-fixes/fixes (7df227847ab5 platform/x86: int1092: Fix no=
n sequential device mode handling)
Merging samsung-krzk-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging pinctrl-samsung-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging devicetree-fixes/dt/linus (913d3a3f8408 dt-bindings: watchdog: sunx=
i: fix error in schema)
Merging scsi-fixes/fixes (09d9e4d04187 scsi: ufs: ufshpb: Remove HPB2.0 flo=
ws)
Merging drm-fixes/drm-fixes (8bb7eca972ad Linux 5.15)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (8bb7eca972ad Linux 5.15)
Merging mmc-fixes/fixes (90935eb303e0 mmc: tmio: reenable card irqs after t=
he reset callback)
Merging rtc-fixes/rtc-fixes (bd33335aa93d rtc: cmos: Disable irq around dir=
ect invocation of cmos_interrupt())
Merging gnss-fixes/gnss-linus (e73f0f0ee754 Linux 5.14-rc1)
Merging hyperv-fixes/hyperv-fixes (c1ea031dc8a8 Drivers: hv: balloon: Use V=
MBUS_RING_SIZE() wrapper for dm_ring_size)
Merging soc-fsl-fixes/fix (7e5e744183bb soc: fsl: dpio: fix qbman alignment=
 error in the virtualization context)
Merging risc-v-fixes/fixes (54c5639d8f50 riscv: Fix asan-stack clang build)
Merging pidfd-fixes/fixes (03ba0fe4d09f file: simplify logic in __close_ran=
ge())
Merging fpga-fixes/fixes (8bb7eca972ad Linux 5.15)
Merging spdx/spdx-linus (debe436e77c7 Merge tag 'ext4_for_linus' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/tytso/ext4)
Merging gpio-brgl-fixes/gpio/for-current (c0eee6fbfa2b gpio: mlxbf2.c: Add =
check for bgpio_init failure)
Merging gpio-intel-fixes/fixes (8bb7eca972ad Linux 5.15)
Merging pinctrl-intel-fixes/fixes (8bb7eca972ad Linux 5.15)
Merging erofs-fixes/fixes (4c7e42552b3a erofs: remove useless cache strateg=
y of DELAYEDALLOC)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (519d81956ee2 Linux 5.15-rc6)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (b5013d084e03 Merge tag '5.16-rc-part1-smb3-cl=
ient-fixes' of git://git.samba.org/sfrench/cifs-2.6)
Merging cel-fixes/for-rc (8bb7eca972ad Linux 5.15)
Merging irqchip-fixes/irq/irqchip-fixes (10a20b34d735 of/irq: Don't ignore =
interrupt-controller when interrupt-map failed)
Merging renesas-fixes/fixes (432b52eea3dc ARM: shmobile: defconfig: Restore=
 graphical consoles)
Merging perf-current/perf/urgent (8bb7eca972ad Linux 5.15)
Merging efi-fixes/urgent (38fa3206bf44 efi: Change down_interruptible() in =
virt_efi_reset_system() to down_trylock())
Merging drm-misc-fixes/for-linux-next-fixes (3cc1ae1fa70a drm/nouveau: hdmi=
gv100.c: fix corrupted HDMI Vendor InfoFrame)
Merging kbuild/for-next (7528edbafeef [for -next only] kconfig: generate in=
clude/generated/rustc_cfg)
Merging perf/perf/core (ac96f463cc9a perf tests: Remove bash constructs fro=
m stat_all_pmu.sh)
Merging compiler-attributes/compiler-attributes (7c00621dcaee compiler_type=
s: mark __compiletime_assert failure as __noreturn)
Merging dma-mapping/for-next (9fbd8dc19aa5 dma-mapping: use 'bitmap_zalloc(=
)' when applicable)
Merging asm-generic/master (7efbbe6e1414 qcom_scm: hide Kconfig symbol)
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
Merging arc/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging arm/for-next (0ce29cae5ba4 Merge branches 'devel-stable', 'misc' an=
d 'fixes' into for-next)
Merging arm64/for-next/core (c7c386fbc202 arm64: pgtable: make __pte_to_phy=
s/__phys_to_pte_val inline functions)
Merging arm-perf/for-next/perf (e656972b6986 drivers/perf: Improve build te=
st coverage)
Merging arm-soc/for-next (76f79231666a Merge tag 'soc-fsl-fix-v5.15-2' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/leo/linux into arm/fixes)
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (83e38509109e Merge branch 'v5.16/dt64' into for-n=
ext)
Merging aspeed/for-next (9d4a146c082c Merge branches 'dt-for-v5.16' and 'de=
fconfig-for-v5.16' into for-next)
Merging at91/at91-next (f3c0366411d6 ARM: dts: at91: sama7g5-ek: use blocks=
 0 and 1 of TCB0 as cs and ce)
Merging drivers-memory/for-next (0fcbc3b7bcea Merge branch 'mem-ctrl-next' =
into for-next)
Merging imx-mxs/for-next (8bd7cd1cc7f0 Merge branch 'imx/maintainers' into =
for-next)
Merging keystone/next (cb293d3b430e Merge branch 'for_5.15/drivers-soc' int=
o next)
Merging mediatek/for-next (0efac36e9559 Merge branch 'v5.16-tmp/dts64' into=
 for-next)
Merging mvebu/for-next (04e78a787b74 arm/arm64: dts: Enable 2.5G Ethernet p=
ort on CN9130-CRB)
Merging omap/for-next (92d190433bd8 Merge branch 'omap-for-v5.16/gpmc' into=
 for-next)
Merging qcom/for-next (bbe9515ab088 Merge branches 'arm64-defconfig-for-5.1=
6', 'arm64-for-5.16', 'drivers-for-5.16' and 'dts-for-5.16' into for-next)
Merging raspberrypi/for-next (a036b0a5d7d6 ARM: dts: bcm2711-rpi-4-b: Fix u=
sb's unit address)
Merging renesas/next (525a6b4bd53f Merge branch 'renesas-arm-dt-for-v5.16' =
into renesas-next)
Merging reset/reset/next (8c81620ac1ac reset: mchp: sparx5: Extend support =
for lan966x)
Merging rockchip/for-next (cc3bcb015bb1 Merge branch 'v5.16-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (0d5808cf190b Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (9c8df6432a73 Merge branch 'for-next/ffa' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-lin=
ux-next)
Merging stm32/stm32-next (d4b3aaf0f90b ARM: dts: stm32: use usbphyc ck_usbo=
_48m as USBH OHCI clock on stm32mp151)
Merging sunxi/sunxi/for-next (7fb77af71236 Merge branch 'sunxi/dt-for-5.16'=
 into sunxi/for-next)
Merging tegra/for-next (bbd827b4de7e Merge branch for-5.16/arm64/defconfig =
into for-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (f46d16cf5b43 arm64: dts: ti: k3-j721e-sk: Add=
 DDR carveout memory nodes)
Merging xilinx/for-next (326b5e9db528 Merge branch 'zynqmp/soc' into for-ne=
xt)
Merging clk/clk-next (05cf3ec00d46 clk: qcom: gcc-msm8996: Drop (again) gcc=
_aggre1_pnoc_ahb_clk)
Merging clk-imx/for-next (e8271eff5d8c clk: imx: Make CLK_IMX8ULP select MX=
C_CLK)
Merging clk-renesas/renesas-clk (2bd9feed2316 clk: renesas: r8a779[56]x: Ad=
d MLP clocks)
Merging clk-samsung/for-next (651521d396a8 clk: samsung: remove __clk_looku=
p() usage)
Merging csky/linux-next (e21e52ad1e01 csky: Make HAVE_TCM depend on !COMPIL=
E_TEST)
Merging h8300/h8300-next (1ec10274d436 h8300: don't implement set_fs)
Merging m68k/for-next (8a3c0a74ae87 m68k: defconfig: Update defconfigs for =
v5.15-rc1)
Merging m68knommu/for-next (6dbe88e93c35 m68knommu: Remove MCPU32 config sy=
mbol)
Merging microblaze/next (43bdcbd50043 microblaze: timer: Remove unused prop=
erties)
Merging mips/mips-next (f78b25ee922e mips: decompressor: do not copy source=
 files while building)
Merging nds32/next (07cd7745c6f2 nds32/setup: remove unused memblock_region=
 variable in setup_memory())
CONFLICT (content): Merge conflict in arch/nds32/Kconfig
CONFLICT (content): Merge conflict in arch/nds32/Kbuild
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (27dff9a9c247 openrisc: fix SMP tlb flush NULL po=
inter dereference)
Merging parisc-hd/for-next (bb9eb39af0a7 parisc/sticon: fix reverse colors)
Merging powerpc/next (c12ab8dbc492 powerpc/8xx: Fix Oops with STRICT_KERNEL=
_RWX without DEBUG_RODATA_TEST)
Merging soc-fsl/next (54c8b5b6f8a8 soc: fsl: dpio: rename the enqueue descr=
iptor variable)
Merging risc-v/for-next (ffa7a9141bb7 riscv: defconfig: enable DRM_NOUVEAU)
Merging s390/for-next (a4751f157c19 s390/cio: check the subchannel validity=
 for dev_busid)
Merging sh/for-next (8518e694203d sh: pgtable-3level: Fix cast to pointer f=
rom integer of different size)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (ab6ff1fda1e8 uml: x86: add FORCE to user_constants.=
h)
Merging xtensa/xtensa-for-next (bd47cdb78997 xtensa: move section symbols t=
o asm/sections.h)
Merging pidfd/for-next (61bc346ce64a uapi/linux/prctl: provide macro defini=
tions for the PR_SCHED_CORE type argument)
Merging fscrypt/master (b7e072f9b77f fscrypt: improve a few comments)
Merging fscache/fscache-next (8bb7eca972ad Linux 5.15)
Merging afs/afs-next (52af7105eceb afs: Set mtime from the client for yfs c=
reate operations)
Merging btrfs/for-next (ec522ac87632 Merge branch 'for-next-resolved' into =
for-next-20211102)
Merging ceph/master (c02cb7bdc450 ceph: add a new metric to keep track of r=
emote object copies)
Merging cifs/for-next (c8103c2718eb Merge tag '5.16-rc-part2-smb3-client-fi=
xes' of git://git.samba.org/sfrench/cifs-2.6)
Merging configfs/for-next (c42dd069be8d configfs: fix a race in configfs_lo=
okup())
Merging ecryptfs/next (682a8e2b41ef Merge tag 'ecryptfs-5.13-rc1-updates' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs)
Merging erofs/dev (a0961f351d82 erofs: don't trigger WARN() when decompress=
ion fails)
Merging exfat/dev (0df2d764b979 exfat: reuse exfat_inode_info variable inst=
ead of calling EXFAT_I())
Merging ext3/for_next (a48fc69fe658 udf: Fix crash after seekdir)
Merging ext4/dev (124e7c61deb2 ext4: fix error code saved on super block du=
ring file system abort)
Merging f2fs/dev (c8c109546a19 Merge tag 'zstd-for-linus-v5.16' of git://gi=
thub.com/terrelln/linux)
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (712a951025c0 fuse: fix page stealing)
Merging gfs2/for-next (ef9e7727d062 iomap: Fix inline extent handling in io=
map_readpage)
Merging jfs/jfs-next (c48a14dca2cb JFS: fix memleak in jfs_mount)
Merging ksmbd/ksmbd-for-next (26a2787d45c5 ksmbd: Use the SMB3_Create defin=
itions from the shared)
Merging nfs/linux-next (f96f8cc4a63d NFSv4: Sanity check the parameters in =
nfs41_update_target_slotid())
Merging nfs-anna/linux-next (8cfb9015280d NFS: Always provide aligned buffe=
rs to the RPC read layers)
Merging nfsd/nfsd-next (054f8dbbc60d NFSD: Fix exposure in nfsd4_decode_bit=
map())
Merging cel/for-next (c20106944eb6 NFSD: Keep existing listeners on portlis=
t error)
Merging ntfs3/master (8bb7eca972ad Linux 5.15)
Merging orangefs/for-next (ac2c63757f4f orangefs: Fix sb refcount leak when=
 allocate sb info failed.)
Merging overlayfs/overlayfs-next (5b0a414d06c3 ovl: fix filattr copy-up fai=
lure)
Merging ubifs/next (9aaa6cc099f6 ubifs: Document sysfs nodes)
Merging v9fs/9p-next (6e195b0f7c8e 9p: fix a bunch of checkpatch warnings)
Merging xfs/for-next (4a6b35b3b3f2 xfs: sync xfs_btree_split macros with us=
erspace libxfs)
Merging zonefs/for-next (95b115332a83 zonefs: remove redundant null bio che=
ck)
Merging iomap/iomap-for-next (03b8df8d43ec iomap: standardize tracepoint fo=
rmatting and storage)
Merging djw-vfs/vfs-for-next (d03ef4daf33a fs: forbid invalid project ID)
Merging file-locks/locks-next (482e00075d66 fs: remove leftover comments fr=
om mandatory locking removal)
Merging vfs/for-next (8f40da9494cf Merge branch 'misc.namei' into for-next)
Merging printk/for-next (4b4e6c24e679 Merge branch 'rework/printk_safe-remo=
val' into for-next)
Merging pci/next (dda4b381f05d Merge branch 'remotes/lorenzo/pci/xgene')
Merging pstore/for-next/pstore (c5d4fb2539ca pstore/blk: Use "%lu" to forma=
t unsigned long)
Merging hid/for-next (5554d0b808c2 Merge branch 'for-5.16/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (26950bc4bad3 Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i3c/i3c/next (a3587e2c0578 i3c: fix incorrect address slot lookup o=
n 64-bit)
Merging dmi/dmi-for-next (f97a2103f1a7 firmware: dmi: Move product_sku info=
 to the end of the modalias)
Merging hwmon-staging/hwmon-next (10f0d2ab9aa6 hwmon: (nct7802) Add of_node=
_put() before return)
Merging jc_docs/docs-next (603bdf5d6c09 kernel-doc: support DECLARE_PHY_INT=
ERFACE_MASK())
Merging v4l-dvb/master (57c3b9f55ba8 media: venus: core: Add sdm660 DT comp=
atible and resource struct)
Merging v4l-dvb-next/master (320510b91925 media: atomisp: get rid of two un=
used functions)
Merging pm/linux-next (881007522c8f Merge tag 'thermal-5.16-rc1-2' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging cpufreq-arm/cpufreq/arm/linux-next (4a08e3271c55 cpufreq: Fix param=
eter in parse_perf_domain())
Merging cpupower/cpupower (79a0dc5530a9 tools: cpupower: fix typo in cpupow=
er-idle-set(1) manpage)
Merging devfreq/devfreq-next (5cf79c293821 PM / devfreq: Strengthen check f=
or freq_table)
Merging opp/opp/linux-next (7ca81b690e59 dt-bindings: opp: Allow multi-word=
ed OPP entry name)
Merging thermal/thermal/linux-next (a67a46af4ad6 thermal/core: Deprecate ch=
anging cooling device state from userspace)
Merging ieee1394/for-next (54b3bd99f094 firewire: nosy: switch from 'pci_' =
to 'dma_' API)
Merging dlm/next (c5d32eac8f52 fs: dlm: replace use of socket sk_callback_l=
ock with sock_lock)
Merging rdma/for-next (f1a090f09f42 RDMA/core: Require the driver to set th=
e IOVA correctly during rereg_mr)
Merging net-next/master (1274a4eb318d ipv6: Remove duplicate statements)
Merging bpf-next/for-next (cc0356d6a02e Merge tag 'x86_core_for_v5.16_rc1' =
of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging ipsec-next/master (ad57dae8a64d xfrm: Remove redundant fields and r=
elated parentheses)
Merging mlx5-next/mlx5-next (60dd57c74794 Merge brank 'mlx5_mkey' into rdma=
.git for-next)
Merging netfilter-next/master (cc0356d6a02e Merge tag 'x86_core_for_v5.16_r=
c1' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging ipvs-next/master (cc0356d6a02e Merge tag 'x86_core_for_v5.16_rc1' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging wireless-drivers-next/master (2619f904b25c Merge tag 'iwlwifi-next-=
for-kalle-2021-10-28' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlw=
ifi/iwlwifi-next)
Merging bluetooth/master (258f56d11bbb Bluetooth: aosp: Support AOSP Blueto=
oth Quality Report)
Merging mac80211-next/master (5833291ab6de Merge tag 'pci-v5.16-fixes-1' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci)
Merging mtd/mtd/next (e269d7caf9e0 Merge tag 'spi-nor/for-5.16' into mtd/ne=
xt)
Merging nand/nand/next (fc9e18f9e987 mtd: rawnand: arasan: Prevent an unsup=
ported configuration)
Merging spi-nor/spi-nor/next (df872ab1ffe4 mtd: spi-nor: nxp-spifi: Make us=
e of the helper function devm_platform_ioremap_resource_byname())
Merging crypto/master (beaaaa37c664 crypto: api - Fix boot-up crash when cr=
ypto manager is disabled)
Merging drm/drm-next (b6c24725249a Merge tag 'drm-misc-fixes-2021-11-11' of=
 git://anongit.freedesktop.org/drm/drm-misc into drm-next)
Merging drm-misc/for-linux-next (bcae3af286f4 drm/locking: fix __stack_depo=
t_* name conflict)
Merging amdgpu/drm-next (5c7bcf498a6a drm/amdgpu/display: set vblank_disabl=
e_immediate for DC)
Merging drm-intel/for-linux-next (ade4a1fc5741 drm/i915/adlp/fb: Prevent th=
e mapping of redundant trailing padding NULL pages)
Merging drm-intel-gt/for-linux-next-gt (ade4a1fc5741 drm/i915/adlp/fb: Prev=
ent the mapping of redundant trailing padding NULL pages)
Merging drm-tegra/drm/tegra/for-next (cef3fb370da3 drm/tegra: Mark nvdec PM=
 functions as __maybe_unused)
CONFLICT (content): Merge conflict in drivers/gpu/drm/tegra/gem.c
Merging drm-msm/msm-next (02d44fde976a drm/msm/dp: fix missing #include)
Merging imx-drm/imx-drm/next (20fbfc81e390 drm/imx: imx-tve: Make use of th=
e helper function devm_platform_ioremap_resource())
Merging etnaviv/etnaviv/next (81fd23e2b3cc drm/etnaviv: Implement mmap as G=
EM object function)
Merging regmap/for-next (a8d880671c13 Merge remote-tracking branch 'regmap/=
for-5.16' into regmap-next)
Merging sound/for-next (bd5e2c22a9cf ALSA: cmipci: Drop stale variable assi=
gnment)
Merging sound-asoc/for-next (80057cf04208 Merge remote-tracking branch 'aso=
c/for-5.16' into asoc-linus)
Merging modules/modules-next (ced75a2f5da7 MAINTAINERS: Add Luis Chamberlai=
n as modules maintainer)
Merging input/next (744d0090a5f6 Input: iforce - fix control-message timeou=
t)
Merging block/for-next (cb690f5238d7 Merge tag 'for-5.16/drivers-2021-11-09=
' of git://git.kernel.dk/linux-block)
Merging device-mapper/for-next (7552750d0494 dm table: log table creation e=
rror code)
Merging libata/for-next (8e973315564f libata: libahci: declare ahci_shost_a=
ttr_group as static)
Merging pcmcia/pcmcia-next (e39cdacf2f66 pcmcia: i82092: fix a null pointer=
 dereference bug)
Merging mmc/next (348ecd61770f Merge branch 'fixes' into next)
Merging mfd/for-mfd-next (5dc6dafe6209 mfd: simple-mfd-i2c: Select MFD_CORE=
 to fix build error)
Merging backlight/for-backlight-next (3976e974df1f video: backlight: ili932=
0: Make ili9320_remove() return void)
Merging battery/for-next (22ad4f99f63f power: supply: bq25890: Fix initial =
setting of the F_CONV_RATE field)
Merging regulator/for-next (7492b724df4d Merge series "Remove TPS80031 driv=
er" from Dmitry Osipenko <digetx@gmail.com>:)
Merging security/next-testing (047843bdb316 Merge branch 'landlock_lsm_v34'=
 into next-testing)
Merging apparmor/apparmor-next (582122f1d73a apparmor: remove duplicated 'R=
eturns:' comments)
Merging integrity/next-integrity (32ba540f3c2a evm: mark evm_fixmode as __r=
o_after_init)
Merging keys/keys-next (e377c31f788f integrity: Load mokx variables into th=
e blacklist keyring)
CONFLICT (content): Merge conflict in certs/system_keyring.c
Merging safesetid/safesetid-next (1b8b71922919 LSM: SafeSetID: Mark safeset=
id_initialized as __initdata)
Merging selinux/next (15bf32398ad4 security: Return xattr name from securit=
y_dentry_init_security())
Merging smack/next (0934ad42bb2c smackfs: use netlbl_cfg_cipsov4_del() for =
deleting cipso_v4_doi)
Merging tomoyo/master (7d2a07b76933 Linux 5.14)
Merging tpmdd/next (7eba41fe8c7b tpm_tis_spi: Add missing SPI ID)
Merging watchdog/master (c738888032ff watchdog: db8500_wdt: Rename symbols)
Merging iommu/next (52d96919d6a8 Merge branches 'apple/dart', 'arm/mediatek=
', 'arm/renesas', 'arm/smmu', 'arm/tegra', 'iommu/fixes', 'x86/amd', 'x86/v=
t-d' and 'core' into next)
Merging audit/next (d9516f346e8b audit: return early if the filter rule has=
 a lower priority)
Merging devicetree/for-next (4c7a7d5086cd dt-bindings: net: ti,bluetooth: D=
ocument default max-speed)
Merging mailbox/mailbox-for-next (97961f78e8bc mailbox: imx: support i.MX8U=
LP S4 MU)
Merging spi/for-next (cf45d01e6321 Merge remote-tracking branch 'spi/for-5.=
16' into spi-linus)
Merging tip/auto-latest (e341763ac2aa Merge branch 'irq/urgent')
Merging clockevents/timers/drivers/next (eda9a4f7af6e clocksource/drivers/t=
imer-ti-dm: Select TIMER_OF)
Merging edac/edac-for-next (f889e52436d6 Merge branch 'edac-urgent' into ed=
ac-for-next)
Merging irqchip/irq/irqchip-next (11e45471abea Merge branch irq/misc-5.16 i=
nto irq/irqchip-next)
Merging ftrace/for-next (1cab6bce42e6 tracing/histogram: Fix check for miss=
ing operands in an expression)
Merging rcu/rcu/next (587a7d1703f3 Merge branch 'kcsan.2021.09.13b' into HE=
AD)
Merging kvm/next (9c6eb531e760 Merge tag 'kvm-s390-next-5.16-1' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging kvm-arm/next (5a2acbbb0179 Merge branch kvm/selftests/memslot into =
kvmarm-master/next)
Merging kvms390/next (3fd8417f2c72 KVM: s390: add debug statement for diag =
318 CPNC data)
Merging xen-tip/linux-next (501586ea5974 xen/balloon: fix unused-variable w=
arning)
Merging percpu/for-next (a81a52b325ec Merge branch 'for-5.14-fixes' into fo=
r-next)
Merging workqueues/for-next (f9eaaa82b474 workqueue: doc: Call out the non-=
reentrance conditions)
Merging drivers-x86/for-next (97ae45953ea9 platform/x86: system76_acpi: Fix=
 input device error handling)
Merging chrome-platform/for-next (297d34e73d49 platform/chrome: cros_ec_pro=
to: Use ec_command for check_features)
Merging hsi/for-next (4ef69e17eb56 HSI: cmt_speech: unmark comments as kern=
el-doc)
Merging leds/for-next (97b31c1f8eb8 leds: trigger: Disable CPU trigger on P=
REEMPT_RT)
Merging ipmi/for-next (5833291ab6de Merge tag 'pci-v5.16-fixes-1' of git://=
git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci)
Merging driver-core/driver-core-next (c8c109546a19 Merge tag 'zstd-for-linu=
s-v5.16' of git://github.com/terrelln/linux)
Merging usb/usb-next (c8c109546a19 Merge tag 'zstd-for-linus-v5.16' of git:=
//github.com/terrelln/linux)
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (910c996335c3 USB: serial: keyspan: fix memleak=
 on probe errors)
Merging usb-chipidea-next/for-usb-next (78665f57c3fa usb: chipidea: udc: ma=
ke controller hardware endpoint primed)
Merging tty/tty-next (c8c109546a19 Merge tag 'zstd-for-linus-v5.16' of git:=
//github.com/terrelln/linux)
Merging char-misc/char-misc-next (c8c109546a19 Merge tag 'zstd-for-linus-v5=
.16' of git://github.com/terrelln/linux)
Merging extcon/extcon-next (9e6ef3a25e5e dt-bindings: extcon: usbc-tusb320:=
 Add TUSB320L compatible string)
Merging phy-next/next (b4dc97ab0a62 phy: Sparx5 Eth SerDes: Fix return valu=
e check in sparx5_serdes_probe())
Merging soundwire/next (abd9a6049bb5 soundwire: qcom: add debugfs entry for=
 soundwire register dump)
Merging thunderbolt/next (0a0624a26f9c thunderbolt: Fix -Wrestrict warning)
Merging vfio/next (3bf1311f351e vfio/ccw: Convert to use vfio_register_emul=
ated_iommu_dev())
Merging staging/staging-next (c8c109546a19 Merge tag 'zstd-for-linus-v5.16'=
 of git://github.com/terrelln/linux)
Merging iio/togreg (12b6d77431f5 iio: adc: ina2xx: Avoid double reference c=
ounting from get_task_struct/put_task_struct())
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (dfe14674bf7b Merge branch 'icc-rpm' into icc-next)
Merging dmaengine/next (eb91224e47ec dmaengine: ti: k3-udma: Set r/tchan or=
 rflow to NULL if request fail)
Merging cgroup/for-next (588e5d876648 cgroup: bpf: Move wrapper for __cgrou=
p_bpf_*() to kernel/bpf/cgroup.c)
Merging scsi/for-next (588702bfaf15 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (375622ecf36e scsi: qla2xxx: Fix mailbox directio=
n flags in qla2xxx_get_adapter_id())
Merging vhost/linux-next (47ed04961471 virtio_gpio: drop packed attribute)
Merging rpmsg/for-next (6ee5808de074 Merge branches 'rpmsg-next' and 'rproc=
-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (7d0003da6297 virtio_gpio: drop packed attr=
ibute)
Merging gpio-intel/for-next (8bb7eca972ad Linux 5.15)
Merging gpio-sim/gpio/gpio-sim (5065e08e4ef3 gpio: sim: fix missing unlock =
on error in gpio_sim_config_commit_item())
Merging pinctrl/for-next (a0f160ffcb83 pinctrl: add pinctrl/GPIO driver for=
 Apple SoCs)
Merging pinctrl-intel/for-next (176412f8674b pinctrl: intel: Kconfig: Add c=
onfiguration menu to Intel pin control)
Merging pinctrl-renesas/renesas-pinctrl (f4e260bffcf3 pinctrl: renesas: che=
cker: Prefix common checker output)
Merging pinctrl-samsung/for-next (f9d8de699ac4 pinctrl: samsung: support Ex=
ynosAutov9 SoC pinctrl)
Merging pwm/for-next (e9d866d5a629 pwm: vt8500: Rename pwm_busy_wait() to m=
ake it obviously driver-specific)
Merging userns/for-next (716040e0ae01 Merge of per_signal_struct_coredumps-=
for-v5.16, ucount-fixes-for-v5.16, and exit-cleanups-for-v5.16 for testing =
in linux-next)
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging kselftest/next (f35dcaa0a8a2 selftests/core: fix conflicting types =
compile error for close_range())
Merging livepatching/for-next (cd2d68f2d6b2 Merge branch 'for-5.15/cpu-hotp=
lug' into for-next)
Merging coresight/next (20b02fe36530 arm64: cpufeature: Export this_cpu_has=
_cap helper)
Merging rtc/rtc-next (b476266f063e rtc: rx8025: use .set_offset/.read_offse=
t)
Merging nvdimm/libnvdimm-for-next (e765f13ed126 nvdimm/pmem: move dax_attri=
bute_group from dax to pmem)
Merging at24/at24/for-next (762925405482 dt-bindings: at24: add ON Semi CAT=
24C04 and CAT24C05)
Merging ntb/ntb-next (f96cb827ce49 ntb: ntb_pingpong: remove redundant init=
ialization of variables msg_data and spad_data)
Merging seccomp/for-next/seccomp (1e6d69c7b9cd selftests/seccomp: Report ev=
ent mismatches more clearly)
Merging kspp/for-next/kspp (879f756fa9bf Merge branches 'for-next/hardening=
', 'for-next/overflow' and 'for-next/thread_info/cpu' into for-next/kspp)
Merging kspp-gustavo/for-next/kspp (704f6142a903 firmware/psci: fix applica=
tion of sizeof to pointer)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (0f79ce970e79 gnss: drop stray semicolons)
Merging fsi/next (7cc2f34e1f4d fsi: sbefifo: Use interruptible mutex lockin=
g)
Merging slimbus/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging nvmem/for-next (413333fd6a88 nvmem: imx-ocotp: add support for post=
 processing)
Merging xarray/main (2c7e57a02708 idr test suite: Improve reporting from id=
r_find_test_1)
Merging hyperv/hyperv-next (285f68afa8b2 x86/hyperv: Protect set_hv_tscchan=
ge_cb() against getting preempted)
Merging auxdisplay/auxdisplay (97fbb29fc1eb MAINTAINERS: Add DT Bindings fo=
r Auxiliary Display Drivers)
Merging kgdb/kgdb/for-next (b77dbc86d604 kdb: Adopt scheduler's task classi=
fication)
Merging hmm/hmm (6880fa6c5660 Linux 5.15-rc1)
Merging fpga/for-next (8bb7eca972ad Linux 5.15)
Merging kunit/test (6880fa6c5660 Linux 5.15-rc1)
Merging cfi/cfi/next (ff1176468d36 Linux 5.14-rc3)
Merging kunit-next/kunit (52a5d80a2225 kunit: tool: fix typecheck errors ab=
out loading qemu configs)
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mhi/mhi-next (8c61951b372d Merge tag 'soundwire-5.15-rc1' of git://=
git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire into char-misc-next)
Merging memblock/for-next (e888fa7bb882 memblock: Check memory add/cap orde=
ring)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (e71ba9452f0b Linux 5.11-rc2)
Merging rust/rust-next (988f45dfe7ea MAINTAINERS: Rust)
CONFLICT (content): Merge conflict in scripts/kconfig/confdata.c
CONFLICT (content): Merge conflict in scripts/Makefile.modfinal
CONFLICT (content): Merge conflict in Makefile
Applying: Kbuild: fix for "kbuild: split DEBUG_CFLAGS out to scripts/Makefi=
le.debug"
Merging cxl/next (c6d7e1341cc9 ocxl: Use pci core's DVSEC functionality)
Merging folio/for-next (d2f0559fc2d1 csky,sparc: Declare flush_dcache_folio=
())
Merging bitmap/bitmap-master-5.15 (785cb064e2f8 vsprintf: rework bitmap_lis=
t_string)
CONFLICT (content): Merge conflict in arch/parisc/include/asm/bitops.h
Merging zstd/zstd-1.4.10 (8e211b894b58 lib: zstd: Add cast to silence clang=
's -Wbitwise-instead-of-logical)
Merging efi/next (720dff78de36 efi: Allow efi=3Druntime)
Merging unicode/for-next (e2a58d2d3416 unicode: only export internal symbol=
s for the selftests)
CONFLICT (content): Merge conflict in fs/f2fs/sysfs.c
Applying: Mark NTFS_RW as BROKEN
Merging akpm-current/current (0c56210ef22c shm: extend forced shm destroy t=
o support objects from several IPC nses)
CONFLICT (content): Merge conflict in kernel/sched/core.c
CONFLICT (content): Merge conflict in kernel/exit.c
CONFLICT (content): Merge conflict in include/linux/sched/mm.h
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
dropping e2df326a68b8d1ee61d43d927cfb351c87efa95f mm: allow only SLUB on PR=
EEMPT_RT -- patch contents already upstream
dropping b2727d1d1b630cfb7d13021b92f359218a6380cc mm: migrate: simplify the=
 file-backed pages validation when migrating its mapping -- patch contents =
already upstream
dropping 75f67647203df556da52576fd7085b98f6095aa0 mm/migrate.c: remove MIGR=
ATE_PFN_LOCKED -- patch contents already upstream
dropping bfec61f87bc5b74dece045c61239d7e8f0133c9d mm: unexport folio_memcg_=
{,un}lock -- patch contents already upstream
dropping cf7c0570a7bf743b185030b8e138aebd69d85319 mm: unexport {,un}lock_pa=
ge_memcg -- patch contents already upstream
dropping fa7242536739774e70e904ee8e0a14faebdc90ef kasan: add kasan mode mes=
sages when kasan init -- patch contents already upstream
Merging akpm/master (14ce8069f48b lib/stackdepot: allow optional init and s=
tack_table allocation by kvmalloc() - fixup3)

--Sig_/TT/qdpx1dmpBek3xe3n4CoT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGRvCYACgkQAVBC80lX
0GzQqAf/RZ15mdcC8YYyzt4LGkmvX4Cy1a68+8vITGV3m7lNOP5Kggux8y5mNaVG
qW6ohCKcditbOgK8m69G8VT9xys4yr5X2osRx+kduvya3qVUDgJP5iNdsr8MCiyD
K+uQnn/wawWTZaSi1a9LuErN0ON15OyXeY7gewmYjH3ATaoVlyyKxkhqv4VxzjQG
U4T/kSO3c1wo7ykA9m0Gsw5yV1HcAKJg+Yj2Y/L1R2M/KR7bXwIi485L2swNg2Xq
XjV03XPuWmaKnHCHmre/hPL0a6uLdOovXs0N6MKRyrnen9wkqmInCaT+ZEupZkMC
YezTQvP1FTNYVJruBnssqpnxUZDffA==
=pX/k
-----END PGP SIGNATURE-----

--Sig_/TT/qdpx1dmpBek3xe3n4CoT--
