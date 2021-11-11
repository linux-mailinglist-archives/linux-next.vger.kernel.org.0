Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EBB944D0FE
	for <lists+linux-next@lfdr.de>; Thu, 11 Nov 2021 05:27:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbhKKEaZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Nov 2021 23:30:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbhKKEaZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Nov 2021 23:30:25 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B711C061766;
        Wed, 10 Nov 2021 20:27:36 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HqTGF6hXgz4xbs;
        Thu, 11 Nov 2021 15:27:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1636604854;
        bh=z9loINMfiKeNnsHdbKHV78YVsOKu7h06xa3QbuOL+mQ=;
        h=Date:From:To:Cc:Subject:From;
        b=rTSJhFNJm0Z0sXE59KX5VfamBLWZFl1w4SHgboPpqshslaO0jedIXOSHplPIMmoKd
         jpFNIaCWhEW4ncUZ36hS0QO71ntRxVEdkCxH/Wo8IM35wh19gF8xdWQYYk3zUfjF7Z
         TMo2JVFGUvqHr4NOvOgtFpdiuR/GbgBoAv1bHTF4yRVRjCXvOdw1eyEYm6YY8sUi+Z
         EGaVcvk4nsBOFxvO3vq2UiK3863tfwDmgGfteXUgX1qhH1SGrgGQlIssC3yE5IoOcR
         VKe+NLL1yX94lAUqrIvYWVHSjtxdhxD5y78vLOV6vgC0y29ubKS6v+Wq43t8vK+Wz4
         Ig0Nlf64RFozQ==
Date:   Thu, 11 Nov 2021 15:27:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 11
Message-ID: <20211111152731.2a81ffb0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rzToqkKwaBKBCgMPJ4.x3pg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rzToqkKwaBKBCgMPJ4.x3pg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Pleasd do not add v5.17 destined changes to your linux-next included
trees until after v5.16-rc1 has been released.

Changes since 20211110:

The sound-current tree lost its build failure.

The cifs tree gained a build failure so I used the version from
next-20211110.

I have disabled the ntfs file system write capabaility for now as it
fails for builds with 64k pages.

Non-merge commits (relative to Linus' tree): 1190
 1551 files changed, 83830 insertions(+), 30427 deletions(-)

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

I am currently merging 343 trees (counting Linus' and 92 trees of bug
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
Merging origin/master (881007522c8f Merge tag 'thermal-5.16-rc1-2' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging fixes/fixes (3ca706c189db drm/ttm: fix type mismatch error on sparc=
64)
Merging kbuild-current/fixes (e851dfae4371 Merge tag 'kgdb-5.16-rc1' of git=
://git.kernel.org/pub/scm/linux/kernel/git/danielt/linux)
Merging arc-current/for-curr (b9cac915c541 ARC: thread_info.h: correct two =
typos in a comment)
Merging arm-current/fixes (00568b8a6364 ARM: 9148/1: handle CONFIG_CPU_ENDI=
AN_BE32 in arch/arm/kernel/head.S)
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
Merging net/master (e5d5aadcf3cd net/smc: fix sk_refcnt underflow on linkdo=
wn and fallback)
Merging bpf/master (fceb07950a7a Merge https://git.kernel.org/pub/scm/linux=
/kernel/git/bpf/bpf)
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
Merging sound-current/for-linus (39173303c838 ALSA: hda: Free card instance=
 properly at probe errors)
Merging sound-asoc-fixes/for-linus (13b1ef781f41 Merge remote-tracking bran=
ch 'asoc/for-5.16' into asoc-linus)
Merging regmap-fixes/for-linus (38a4b4fb7c73 Merge remote-tracking branch '=
regmap/for-5.15' into regmap-linus)
Merging regulator-fixes/for-linus (519d81956ee2 Linux 5.15-rc6)
Merging spi-fixes/for-linus (d81d0e41ed5f spi: spl022: fix Microwire full d=
uplex mode)
Merging pci-current/for-linus (19a0746df36a Revert "of/irq: Allow matching =
of an interrupt-map local to an interrupt controller")
Merging driver-core.current/driver-core-linus (cb690f5238d7 Merge tag 'for-=
5.16/drivers-2021-11-09' of git://git.kernel.dk/linux-block)
Merging tty.current/tty-linus (cb690f5238d7 Merge tag 'for-5.16/drivers-202=
1-11-09' of git://git.kernel.dk/linux-block)
Merging usb.current/usb-linus (e1959faf085b xhci: Fix USB 3.1 enumeration i=
ssues by increasing roothub power-on-good delay)
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (519d81956ee2 Linux 5.15-rc6)
Merging usb-chipidea-fixes/for-usb-fixes (f130d08a8d79 usb: chipidea: ci_hd=
rc_imx: Also search for 'phys' phandle)
Merging phy/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging staging.current/staging-linus (cb690f5238d7 Merge tag 'for-5.16/dri=
vers-2021-11-09' of git://git.kernel.dk/linux-block)
Merging iio-fixes/fixes-togreg (b762f932ef0e iio: dln2: Check return value =
of devm_iio_trigger_register())
Merging char-misc.current/char-misc-linus (a4119be4370e Merge tag 'coresigh=
t-fixes-v5.16' of gitolite.kernel.org:pub/scm/linux/kernel/git/coresight/li=
nux into char-misc-linus)
Merging soundwire-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging thunderbolt-fixes/fixes (8bb7eca972ad Linux 5.15)
Merging input-current/for-linus (a02dcde595f7 Input: touchscreen - avoid bi=
twise vs logical OR warning)
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
Merging kvm-fixes/master (ca5e83eddc8b Merge tag 'for-linus' of git://git.k=
ernel.org/pub/scm/virt/kvm/kvm)
Merging kvms390-fixes/master (0e9ff65f455d KVM: s390: preserve deliverable_=
mask in __airqs_kick_single_vcpu)
Merging hwmon-fixes/hwmon (ada61aa0b118 hwmon: Fix possible memleak in __hw=
mon_device_register())
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
Merging devicetree-fixes/dt/linus (cbf0e0d466fc dt-bindings: treewide: Upda=
te @st.com email address to @foss.st.com)
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
Merging spdx/spdx-linus (d4439a1189f9 Merge tag 'hsi-for-5.16' of git://git=
.kernel.org/pub/scm/linux/kernel/git/sre/linux-hsi)
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
Merging irqchip-fixes/irq/irqchip-fixes (4d7a0f5ebd8d irqchip/sifive-plic: =
Fixup EOI failed when masked)
Merging renesas-fixes/fixes (432b52eea3dc ARM: shmobile: defconfig: Restore=
 graphical consoles)
Merging perf-current/perf/urgent (8bb7eca972ad Linux 5.15)
Merging efi-fixes/urgent (38fa3206bf44 efi: Change down_interruptible() in =
virt_efi_reset_system() to down_trylock())
Merging drm-misc-fixes/for-linux-next-fixes (f55aaf63bde0 drm/nouveau: clea=
n up all clients on device removal)
Merging kbuild/for-next (7528edbafeef [for -next only] kconfig: generate in=
clude/generated/rustc_cfg)
Merging perf/perf/core (6b491a86b77c perf build: Install libbpf headers loc=
ally when building)
Merging compiler-attributes/compiler-attributes (7c00621dcaee compiler_type=
s: mark __compiletime_assert failure as __noreturn)
Merging dma-mapping/for-next (9fbd8dc19aa5 dma-mapping: use 'bitmap_zalloc(=
)' when applicable)
Merging asm-generic/master (7efbbe6e1414 qcom_scm: hide Kconfig symbol)
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
Merging arc/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging arm/for-next (2aa8f79c7509 Merge branch 'devel-stable' into for-nex=
t)
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
Merging parisc-hd/for-next (7e79112bebc7 parisc: Avoid using hardware singl=
e-step in kprobes)
Merging powerpc/next (c12ab8dbc492 powerpc/8xx: Fix Oops with STRICT_KERNEL=
_RWX without DEBUG_RODATA_TEST)
Merging soc-fsl/next (54c8b5b6f8a8 soc: fsl: dpio: rename the enqueue descr=
iptor variable)
Merging risc-v/for-next (ffa7a9141bb7 riscv: defconfig: enable DRM_NOUVEAU)
CONFLICT (content): Merge conflict in arch/riscv/Makefile
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
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
Merging cifs/for-next (fe9e9644c508 smb3: do not setup the fscache_super_co=
okie until fsinfo initialized)
$ git reset --hard HEAD^
Merging next-20211110 version of cifs
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
Merging f2fs/dev (5429c9dbc902 f2fs: fix UAF in f2fs_available_free_memory)
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (712a951025c0 fuse: fix page stealing)
Merging gfs2/for-next (80492bf70081 iomap: Fix inline extent handling in io=
map_readpage)
Merging jfs/jfs-next (c48a14dca2cb JFS: fix memleak in jfs_mount)
Merging ksmbd/ksmbd-for-next (79364beea4d1 ksmbd: Use the SMB3_Create defin=
itions from the shared)
Merging nfs/linux-next (f96f8cc4a63d NFSv4: Sanity check the parameters in =
nfs41_update_target_slotid())
Merging nfs-anna/linux-next (8cfb9015280d NFS: Always provide aligned buffe=
rs to the RPC read layers)
Merging nfsd/nfsd-next (80479eb86210 nfsd4: remove obselete comment)
CONFLICT (content): Merge conflict in include/trace/events/sunrpc.h
Merging cel/for-next (c20106944eb6 NFSD: Keep existing listeners on portlis=
t error)
Merging ntfs3/master (8bb7eca972ad Linux 5.15)
Merging orangefs/for-next (ac2c63757f4f orangefs: Fix sb refcount leak when=
 allocate sb info failed.)
Merging overlayfs/overlayfs-next (5b0a414d06c3 ovl: fix filattr copy-up fai=
lure)
Merging ubifs/next (9aaa6cc099f6 ubifs: Document sysfs nodes)
Merging v9fs/9p-next (6e195b0f7c8e 9p: fix a bunch of checkpatch warnings)
Merging xfs/for-next (2a09b575074f xfs: use swap() to make code cleaner)
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
Merging hid/for-next (f3cd7c04e252 Merge branch 'for-5.16/upstream-fixes' i=
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
Merging dlm/next (b87b1883efe3 fs: dlm: remove double list_first_entry call)
Merging rdma/for-next (f1a090f09f42 RDMA/core: Require the driver to set th=
e IOVA correctly during rereg_mr)
Merging net-next/master (cc0356d6a02e Merge tag 'x86_core_for_v5.16_rc1' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
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
Merging mac80211-next/master (62bf703f4423 cfg80211: move offchan_cac_event=
 to a dedicated work)
Merging mtd/mtd/next (e269d7caf9e0 Merge tag 'spi-nor/for-5.16' into mtd/ne=
xt)
Merging nand/nand/next (fc9e18f9e987 mtd: rawnand: arasan: Prevent an unsup=
ported configuration)
Merging spi-nor/spi-nor/next (df872ab1ffe4 mtd: spi-nor: nxp-spifi: Make us=
e of the helper function devm_platform_ioremap_resource_byname())
Merging crypto/master (beaaaa37c664 crypto: api - Fix boot-up crash when cr=
ypto manager is disabled)
Merging drm/drm-next (917a6f0bdbc5 Merge tag 'drm-intel-next-fixes-2021-11-=
09' of git://anongit.freedesktop.org/drm/drm-intel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_dma=
buf.c
Merging drm-misc/for-linux-next (bcae3af286f4 drm/locking: fix __stack_depo=
t_* name conflict)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_gem=
.c
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
Merging sound/for-next (e81478bbe7a1 ALSA: hda: fix general protection faul=
t in azx_runtime_idle)
Merging sound-asoc/for-next (13b1ef781f41 Merge remote-tracking branch 'aso=
c/for-5.16' into asoc-linus)
Merging modules/modules-next (ced75a2f5da7 MAINTAINERS: Add Luis Chamberlai=
n as modules maintainer)
Merging input/next (744d0090a5f6 Input: iforce - fix control-message timeou=
t)
CONFLICT (modify/delete): Documentation/devicetree/bindings/input/cap11xx.t=
xt deleted in HEAD and modified in input/next. Version input/next of Docume=
ntation/devicetree/bindings/input/cap11xx.txt left in tree.
$ git rm -f Documentation/devicetree/bindings/input/cap11xx.txt
Applying: Input: cap11xx: fix for "dt-bindings: input: microchip,cap11xx: C=
onvert txt bindings to yaml"
Merging block/for-next (cb690f5238d7 Merge tag 'for-5.16/drivers-2021-11-09=
' of git://git.kernel.dk/linux-block)
Merging device-mapper/for-next (7552750d0494 dm table: log table creation e=
rror code)
Merging libata/for-next (8cc90c00d3b5 libata: add horkage for missing Ident=
ify Device log)
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
Merging spi/for-next (e6f98315aba2 Merge remote-tracking branch 'spi/for-5.=
16' into spi-next)
Merging tip/auto-latest (ea79c24a30aa Merge branch 'timers/urgent')
Merging clockevents/timers/drivers/next (eda9a4f7af6e clocksource/drivers/t=
imer-ti-dm: Select TIMER_OF)
Merging edac/edac-for-next (f889e52436d6 Merge branch 'edac-urgent' into ed=
ac-for-next)
Merging irqchip/irq/irqchip-next (11e45471abea Merge branch irq/misc-5.16 i=
nto irq/irqchip-next)
Merging ftrace/for-next (67d4f6e3bf5d ftrace/samples: Add missing prototype=
 for my_direct_func)
Merging rcu/rcu/next (587a7d1703f3 Merge branch 'kcsan.2021.09.13b' into HE=
AD)
Merging kvm/next (9c6eb531e760 Merge tag 'kvm-s390-next-5.16-1' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging kvm-arm/next (5a2acbbb0179 Merge branch kvm/selftests/memslot into =
kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (72476aaa4691 KVM: PPC: Book3S HV: Fix host ra=
dix SLB optimisation with hash guests)
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
Merging ipmi/for-next (56d33754481f Merge tag 'drm-next-2021-11-03' of git:=
//anongit.freedesktop.org/drm/drm)
Merging driver-core/driver-core-next (cb690f5238d7 Merge tag 'for-5.16/driv=
ers-2021-11-09' of git://git.kernel.dk/linux-block)
Merging usb/usb-next (048ff8629e11 Merge tag 'usb-5.16-rc1' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (910c996335c3 USB: serial: keyspan: fix memleak=
 on probe errors)
Merging usb-chipidea-next/for-usb-next (78665f57c3fa usb: chipidea: udc: ma=
ke controller hardware endpoint primed)
Merging tty/tty-next (cb690f5238d7 Merge tag 'for-5.16/drivers-2021-11-09' =
of git://git.kernel.dk/linux-block)
Merging char-misc/char-misc-next (b5013d084e03 Merge tag '5.16-rc-part1-smb=
3-client-fixes' of git://git.samba.org/sfrench/cifs-2.6)
Merging extcon/extcon-next (9e6ef3a25e5e dt-bindings: extcon: usbc-tusb320:=
 Add TUSB320L compatible string)
Merging phy-next/next (b4dc97ab0a62 phy: Sparx5 Eth SerDes: Fix return valu=
e check in sparx5_serdes_probe())
Merging soundwire/next (abd9a6049bb5 soundwire: qcom: add debugfs entry for=
 soundwire register dump)
Merging thunderbolt/next (0a0624a26f9c thunderbolt: Fix -Wrestrict warning)
Merging vfio/next (3bf1311f351e vfio/ccw: Convert to use vfio_register_emul=
ated_iommu_dev())
Merging staging/staging-next (cb690f5238d7 Merge tag 'for-5.16/drivers-2021=
-11-09' of git://git.kernel.dk/linux-block)
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
CONFLICT (modify/delete): drivers/staging/r8188eu/core/rtw_mp.c deleted in =
HEAD and modified in userns/for-next. Version userns/for-next of drivers/st=
aging/r8188eu/core/rtw_mp.c left in tree.
$ git rm -f drivers/staging/r8188eu/core/rtw_mp.c
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
Merging akpm/master (d43fb1d6a832 kasan: add kasan mode messages when kasan=
 init)

--Sig_/rzToqkKwaBKBCgMPJ4.x3pg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGMm7MACgkQAVBC80lX
0Gw9Ugf/VfL1+sSmcSEAeqSEK0nXEWVDjYqAamAMODmlXj5WzJZGECcTcMrwrO9M
/B9WNTOfIUpgRPqCXN3rSjKEDmr9sYwJUwsfALIqesT//1zmJlfcWAHzmInoPlLz
Zna1v91mCuNyZ4kfdVlPDMT6KobVo76SZNfp9lvNNUG8zCqW1hORVkcaeb6xuNqQ
Dibj2yyErt47nF75xj1FcBmrR553+N7K6ENWSHAcDde3qEu14LKpzX5bLeI/E6n+
K4sIwZ/Rbt1zdFHacOpY9CV8HPCujF1BGSYNw5OPGU7O6Go6zc0iyPIsBCB/C2QM
hc8UNaZCDScjnyOv4tcvar7Xz48U6g==
=yLQk
-----END PGP SIGNATURE-----

--Sig_/rzToqkKwaBKBCgMPJ4.x3pg--
