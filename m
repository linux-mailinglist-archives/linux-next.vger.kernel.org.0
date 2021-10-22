Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF9B043748F
	for <lists+linux-next@lfdr.de>; Fri, 22 Oct 2021 11:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232180AbhJVJR6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Oct 2021 05:17:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232345AbhJVJR5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 Oct 2021 05:17:57 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8910C061764;
        Fri, 22 Oct 2021 02:15:39 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HbJbp0B77z4xbR;
        Fri, 22 Oct 2021 20:15:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634894134;
        bh=JnMIxLJ8OND8HUKmG9Q4yb4+vaPBVK7+/2gra+hZm2c=;
        h=Date:From:To:Cc:Subject:From;
        b=hmuL5ywN0sSyZpvuNEdmHwSpgaDx00coUPKEXQ6PGOo+vVCD9RajlEAxxDCDzh7Pc
         zNrh47FrOT6wURWMTjUO9awaquRAvDMeIqTmJ5qZWM2HyHfWLuWTWN6v5lynMwsoNq
         TtRl02WhKlwq7w/AV/nWl5pRsUAQg5nes0SS4jrslwvvy6pIfuCBTOQGnkU3gh5xq0
         bcA2lvBNUr9CH5oNyhtzSHw/4ndqF5yJUJW70zINvMSJ20KkD5YU2WU2atKPNo5M1m
         O/bNch7Ze+lxQPoJ96uIoD8B5w+GxKkx+KczAekl/T9ZZ45d5kTJIv4XnqS+5DmvEd
         +al5lRNW9E1xA==
Date:   Fri, 22 Oct 2021 20:15:33 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 22
Message-ID: <20211022201533.6085b17f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7CS5wlShp/KscOo8zLBxR2M";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7CS5wlShp/KscOo8zLBxR2M
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20211021:

The at91 tree gained a conflict against Linus' tree.

The net-next tree gained a conflict and a semantic conflict against the
net tree.

The drm tree gained a conflict against the drm-misc-fixes tree.

The regulator tree gained a build failure so I used the version from
next-20211021.

The tip tree still had its build failure for which I reverted 2 commits.

The kspp-gustavo tree still had its build failures for which I applied
a patch and reverted a commit.

The bitmap tree gained a conflict against the parisc-hd tree.

The akpm-current tree gained a conflict against the memblock-fixes tree
and a semantic conflict against the fsi tree.

Non-merge commits (relative to Linus' tree): 9738
 9089 files changed, 581455 insertions(+), 199970 deletions(-)

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

I am currently merging 340 trees (counting Linus' and 92 trees of bug
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
Merging origin/master (2f111a6fd5b5 Merge tag 'ceph-for-5.15-rc7' of git://=
github.com/ceph/ceph-client)
Merging fixes/fixes (3ca706c189db drm/ttm: fix type mismatch error on sparc=
64)
Merging kbuild-current/fixes (0664684e1ebd kbuild: Add -Werror=3Dignored-op=
timization-argument to CLANG_FLAGS)
Merging arc-current/for-curr (c3ca31ce0ea1 ARC: fix potential build snafu)
Merging arm-current/fixes (48ccc8edf5b9 ARM: 9141/1: only warn about XIP ad=
dress when not compile testing)
Merging arm64-fixes/for-next/fixes (596143e3aec3 acpi/arm64: fix next_platf=
orm_timer() section mismatch error)
Merging arm-soc-fixes/arm/fixes (36b6dcbc1245 Merge tag 'reset-fixes-for-v5=
.15' of git://git.pengutronix.de/pza/linux into arm/fixes)
Merging drivers-memory-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging m68k-current/for-linus (9fde03486402 m68k: Remove set_fs())
Merging powerpc-fixes/fixes (787252a10d94 powerpc/smp: do not decrement idl=
e task preempt count in CPU offline)
Merging s390-fixes/fixes (8b7216439e2e s390: add Alexander Gordeev as revie=
wer)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (80f6e3080bfc fs-verity: fix signed inte=
ger overflow with i_size near S64_MAX)
Merging net/master (397430b50a36 usbnet: sanity check for maxpacket)
Merging bpf/master (28fd0859284d Merge branch 'Fix up bpf_jit_limit some mo=
re')
Merging ipsec/master (93ec1320b017 xfrm: fix rcu lock in xfrm_notify_userpo=
licy())
Merging netfilter/master (bf6abf345dfa sfc: Don't use netif_info before net=
_device setup)
Merging ipvs/master (d9aaaf223297 netfilter: ebtables: allocate chainstack =
on CPU local nodes)
Merging wireless-drivers/master (603a1621caa0 mwifiex: avoid null-pointer-s=
ubtraction warning)
Merging mac80211/master (a2083eeb119f cfg80211: scan: fix RCU in cfg80211_a=
dd_nontrans_list())
Merging rdma-fixes/for-rc (2dace185caa5 RDMA/irdma: Do not hold qos mutex t=
wice on QP resume)
Merging sound-current/for-linus (5fc462c3aaad ALSA: hda/realtek: Fix mic mu=
te LED for the HP Spectre x360 14)
Merging sound-asoc-fixes/for-linus (33fb1cf1cc5d Merge remote-tracking bran=
ch 'asoc/for-5.15' into asoc-linus)
Merging regmap-fixes/for-linus (ec872b2b6554 Merge remote-tracking branch '=
regmap/for-5.15' into regmap-linus)
Merging regulator-fixes/for-linus (519d81956ee2 Linux 5.15-rc6)
Merging spi-fixes/for-linus (587122e86c1a Merge remote-tracking branch 'spi=
/for-5.15' into spi-linus)
Merging pci-current/for-linus (e4e737bb5c17 Linux 5.15-rc2)
Merging driver-core.current/driver-core-linus (519d81956ee2 Linux 5.15-rc6)
Merging tty.current/tty-linus (519d81956ee2 Linux 5.15-rc6)
Merging usb.current/usb-linus (519d81956ee2 Linux 5.15-rc6)
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (ec8de6b8cec2 USB: serial: keyspan: fix =
memleak on probe errors)
Merging usb-chipidea-fixes/for-usb-fixes (f130d08a8d79 usb: chipidea: ci_hd=
rc_imx: Also search for 'phys' phandle)
Merging phy/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging staging.current/staging-linus (519d81956ee2 Linux 5.15-rc6)
Merging iio-fixes/fixes-togreg (486a25084155 iio: buffer: Fix memory leak i=
n iio_buffers_alloc_sysfs_and_mask())
Merging char-misc.current/char-misc-linus (519d81956ee2 Linux 5.15-rc6)
Merging soundwire-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging thunderbolt-fixes/fixes (64570fbc14f8 Linux 5.15-rc5)
Merging input-current/for-linus (a02dcde595f7 Input: touchscreen - avoid bi=
twise vs logical OR warning)
Merging crypto-current/master (0e14ef38669c crypto: x86/sm4 - Fix frame poi=
nter stack corruption)
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
Merging v4l-dvb-fixes/fixes (206704a1fe0b media: atomisp: restore missing '=
return' statement)
Merging reset-fixes/reset/fixes (3ad60b4b3570 reset: socfpga: add empty dri=
ver allowing consumers to probe)
Merging mips-fixes/mips-fixes (740da9d7ca4e MIPS: Revert "add support for b=
uggy MT7621S core detection")
Merging at91-fixes/at91-fixes (dbe68bc9e82b ARM: dts: at91: sama7g5ek: to n=
ot touch slew-rate for SDMMC pins)
Merging omap-fixes/fixes (80d680fdccba ARM: dts: omap3430-sdp: Fix NAND dev=
ice node)
Merging kvm-fixes/master (9f1ee7b169af KVM: SEV-ES: reduce ghcb_sa_len to 3=
2 bits)
Merging kvms390-fixes/master (0e9ff65f455d KVM: s390: preserve deliverable_=
mask in __airqs_kick_single_vcpu)
Merging hwmon-fixes/hwmon (ada61aa0b118 hwmon: Fix possible memleak in __hw=
mon_device_register())
Merging nvdimm-fixes/libnvdimm-fixes (d55174cccac2 nvdimm/pmem: fix creatin=
g the dax group)
Merging cxl-fixes/fixes (fae8817ae804 cxl/mem: Fix memory device capacity p=
robing)
Merging btrfs-fixes/next-fixes (d7395f03c79c Merge branch 'misc-5.15' into =
next-fixes)
Merging vfs-fixes/fixes (25f54d08f12f autofs: fix wait name hash calculatio=
n in autofs_wait())
Merging dma-mapping-fixes/for-linus (18a3c5f7abfd Merge tag 'for_linus' of =
git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging i3c-fixes/i3c/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging drivers-x86-fixes/fixes (7df227847ab5 platform/x86: int1092: Fix no=
n sequential device mode handling)
Merging samsung-krzk-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging pinctrl-samsung-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging devicetree-fixes/dt/linus (b2d70c0dbf27 dt-bindings: drm/bridge: ti=
-sn65dsi86: Fix reg value)
Merging scsi-fixes/fixes (282da7cef078 scsi: ufs: ufs-exynos: Correct timeo=
ut value setting registers)
Merging drm-fixes/drm-fixes (595cb5e0b832 Revert "drm/ast: Add detect funct=
ion support")
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (59be177a909a drm/i915: Remove=
 memory frequency calculation)
Merging mmc-fixes/fixes (162079f2dccd mmc: winbond: don't build on M68K)
Merging rtc-fixes/rtc-fixes (bd33335aa93d rtc: cmos: Disable irq around dir=
ect invocation of cmos_interrupt())
Merging gnss-fixes/gnss-linus (e73f0f0ee754 Linux 5.14-rc1)
Merging hyperv-fixes/hyperv-fixes (b0674bc214ce hypverv/vmbus: include linu=
x/bitops.h)
Merging soc-fsl-fixes/fix (c1e64c0aec8c soc: fsl: qe: fix static checker wa=
rning)
Merging risc-v-fixes/fixes (3ef6ca4f354c checksyscalls: Unconditionally ign=
ore fstat{,at}64)
Merging pidfd-fixes/fixes (03ba0fe4d09f file: simplify logic in __close_ran=
ge())
Merging fpga-fixes/fixes (2a2a79577dda fpga: ice40-spi: Add SPI device ID t=
able)
Merging spdx/spdx-linus (519d81956ee2 Linux 5.15-rc6)
Merging gpio-brgl-fixes/gpio/for-current (6fda593f3082 gpio: mockup: Conver=
t to use software nodes)
Merging gpio-intel-fixes/fixes (1649b8376694 gpio: pca953x: Improve bias se=
tting)
Merging pinctrl-intel-fixes/fixes (64570fbc14f8 Linux 5.15-rc5)
Merging erofs-fixes/fixes (c40dd3ca2a45 erofs: clear compacted_2b if compac=
ted_4b_initial > totalidx)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (519d81956ee2 Linux 5.15-rc6)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (420175a11288 memblock: exclude MEMBLOCK_NOMAP=
 regions from kmemleak)
Merging cel-fixes/for-rc (7d2a07b76933 Linux 5.14)
Merging irqchip-fixes/irq/irqchip-fixes (b78f26926b17 irqchip/gic: Work aro=
und broken Renesas integration)
Merging renesas-fixes/fixes (432b52eea3dc ARM: shmobile: defconfig: Restore=
 graphical consoles)
Merging perf-current/perf/urgent (3ff6d64e68ab libperf tests: Fix test_stat=
_cpu)
Merging efi-fixes/urgent (38fa3206bf44 efi: Change down_interruptible() in =
virt_efi_reset_system() to down_trylock())
Merging drm-misc-fixes/for-linux-next-fixes (def0c3697287 drm: panel-orient=
ation-quirks: Add quirk for Aya Neo 2021)
Merging kbuild/for-next (a8ea7ec588ac [for -next only] kconfig: generate in=
clude/generated/rustc_cfg)
Merging perf/perf/core (be8ecc57f180 perf srcline: Use long-running addr2li=
ne per DSO)
Merging compiler-attributes/compiler-attributes (b83a908498d6 compiler_attr=
ibutes.h: move __compiletime_{error|warning})
Merging dma-mapping/for-next (7d6db80b7d26 sparc32: use DMA_DIRECT_REMAP)
Merging asm-generic/master (7efbbe6e1414 qcom_scm: hide Kconfig symbol)
Merging arc/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging arm/for-next (c03c06cd0ac5 Merge branch 'devel-stable' into for-nex=
t)
Merging arm64/for-next/core (6203cd38cfc5 Merge branch 'for-next/trbe-errat=
a' into for-next/core)
Merging arm-perf/for-next/perf (e656972b6986 drivers/perf: Improve build te=
st coverage)
Merging arm-soc/for-next (015fe822d29f soc: document merges)
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (83e38509109e Merge branch 'v5.16/dt64' into for-n=
ext)
Merging aspeed/for-next (509d3f2b755f Merge branches 'defconfig-for-v5.16' =
and 'dt-for-v5.16' into for-next)
Merging at91/at91-next (f3c0366411d6 ARM: dts: at91: sama7g5-ek: use blocks=
 0 and 1 of TCB0 as cs and ce)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sama7g5.dtsi
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
Merging qcom/for-next (35aab56bc55a Merge branches 'arm64-defconfig-for-5.1=
6', 'arm64-for-5.16', 'drivers-for-5.16' and 'dts-for-5.16' into for-next)
Merging raspberrypi/for-next (a036b0a5d7d6 ARM: dts: bcm2711-rpi-4-b: Fix u=
sb's unit address)
Merging renesas/next (525a6b4bd53f Merge branch 'renesas-arm-dt-for-v5.16' =
into renesas-next)
Merging reset/reset/next (8c81620ac1ac reset: mchp: sparx5: Extend support =
for lan966x)
Merging rockchip/for-next (cc3bcb015bb1 Merge branch 'v5.16-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (3ed6ae3305e0 Merge branch 'for-v5.16/dts-ris=
cv' into for-next)
Merging scmi/for-linux-next (b92b4019a797 Merge branch 'for-next/ffa' of gi=
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
Merging clk/clk-next (e88c20ffe7d5 Merge branch 'clk-composite-determine-fi=
x' into clk-next)
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
Merging m68knommu/for-next (b7c534f5015b m68knommu: Remove MCPU32 config sy=
mbol)
Merging microblaze/next (6880fa6c5660 Linux 5.15-rc1)
Merging mips/mips-next (169dd5f08a8c MIPS: Loongson64: Add of_node_put() be=
fore break)
Merging nds32/next (07cd7745c6f2 nds32/setup: remove unused memblock_region=
 variable in setup_memory())
CONFLICT (content): Merge conflict in arch/nds32/Kconfig
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (210893cad279 openrisc: signal: remove unused DEB=
UG_SIG macro)
Merging parisc-hd/for-next (a4eb28e2e5a0 parisc: Make use of the helper mac=
ro kthread_run())
Merging powerpc/next (8f6aca0e0f26 powerpc/perf: Fix cycles/instructions as=
 PM_CYC/PM_INST_CMPL in power10)
Merging soc-fsl/next (242b0b398ccd soc: fsl: enable acpi support in RCPM dr=
iver)
Merging risc-v/for-next (241527bb8467 Merge tag 'riscv-sifive-dt-5.16' of g=
it://gitolite.kernel.org/pub/scm/linux/kernel/git/krzk/linux into for-next)
Merging s390/for-next (2482e6b6e33c Merge branch 'features' into for-next)
Merging sh/for-next (12285ff8667b sh: kdump: add some attribute to function)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (ab6ff1fda1e8 uml: x86: add FORCE to user_constants.=
h)
Merging xtensa/xtensa-for-next (bd47cdb78997 xtensa: move section symbols t=
o asm/sections.h)
Merging pidfd/for-next (61bc346ce64a uapi/linux/prctl: provide macro defini=
tions for the PR_SCHED_CORE type argument)
Merging fscrypt/master (7f595d6a6cdc fscrypt: allow 256-bit master keys wit=
h AES-256-XTS)
Merging fscache/fscache-next (2bc879c792fa Merge branch 'fscache-remove-old=
-io' into fscache-next)
Merging afs/afs-next (7af08140979a Revert "gcov: clang: fix clang-11+ build=
")
Merging btrfs/for-next (b54d2cb4664c Merge branch 'for-next-next-v5.15-2021=
1021' into for-next-20211021)
Merging ceph/master (324bfaa1a6cc libceph: drop ->monmap and err initializa=
tion)
Merging cifs/for-next (08e9f52e2dce cifs: for compound requests, use open h=
andle if possible)
Merging configfs/for-next (c42dd069be8d configfs: fix a race in configfs_lo=
okup())
Merging ecryptfs/next (682a8e2b41ef Merge tag 'ecryptfs-5.13-rc1-updates' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs)
Merging erofs/dev (622ceaddb764 erofs: lzma compression support)
Merging exfat/dev (efc7bd8527d0 exfat: fix incorrect loading of i_blocks fo=
r large files)
Merging ext3/for_next (e96a1866b405 isofs: Fix out of bound access for corr=
upted isofs image)
Merging ext4/dev (916ff8d5ea0e ext4: prevent partial update of the extent b=
locks)
Merging f2fs/dev (e975f6df1945 f2fs: multidevice: support direct IO)
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (964d32e51267 fuse: clean up error exits in fuse_fill=
_super())
Merging gfs2/for-next (d000f3b901c3 gfs2: Fix unused value warning in do_gf=
s2_set_flags())
Merging jfs/jfs-next (c48a14dca2cb JFS: fix memleak in jfs_mount)
Merging ksmbd/ksmbd-for-next (0d994cd482ee ksmbd: add buffer validation in =
session setup)
Merging nfs/linux-next (9e1ff307c779 Linux 5.15-rc4)
Merging nfs-anna/linux-next (8cfb9015280d NFS: Always provide aligned buffe=
rs to the RPC read layers)
Merging nfsd/nfsd-next (291cd656da04 NFSD:fix boolreturn.cocci warning)
Merging cel/for-next (c20106944eb6 NFSD: Keep existing listeners on portlis=
t error)
Merging ntfs3/master (8607954cf255 fs/ntfs3: Check for NULL pointers in ni_=
try_remove_attr_list)
Merging orangefs/for-next (ac2c63757f4f orangefs: Fix sb refcount leak when=
 allocate sb info failed.)
Merging overlayfs/overlayfs-next (1dc1eed46f9f ovl: fix IOCB_DIRECT if unde=
rlying fs doesn't support direct IO)
Merging ubifs/next (a801fcfeef96 ubifs: Set/Clear I_LINKABLE under i_lock f=
or whiteout inode)
Merging v9fs/9p-next (9c4d94dc9a64 net/9p: increase default msize to 128k)
Merging xfs/for-next (11a83f4c3930 xfs: remove the xfs_dqblk_t typedef)
Merging zonefs/for-next (95b115332a83 zonefs: remove redundant null bio che=
ck)
Merging iomap/iomap-for-next (03b8df8d43ec iomap: standardize tracepoint fo=
rmatting and storage)
Merging djw-vfs/vfs-for-next (d03ef4daf33a fs: forbid invalid project ID)
Merging file-locks/locks-next (e9728cc72d91 locks: remove changelog comment=
s)
Merging vfs/for-next (8f40da9494cf Merge branch 'misc.namei' into for-next)
Merging printk/for-next (c15b5fc054c3 ia64: don't do IA64_CMPXCHG_DEBUG wit=
hout CONFIG_PRINTK)
Merging pci/next (1b6c2cdb635d Merge branch 'remotes/lorenzo/pci/xgene')
Merging pstore/for-next/pstore (c5d4fb2539ca pstore/blk: Use "%lu" to forma=
t unsigned long)
Merging hid/for-next (26922a6c2aaf Merge branches 'for-5.16/asus' and 'for-=
5.16/apple' into for-next)
Merging i2c/i2c/for-next (26701d49482a Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i3c/i3c/next (a3587e2c0578 i3c: fix incorrect address slot lookup o=
n 64-bit)
Merging dmi/dmi-for-next (f97a2103f1a7 firmware: dmi: Move product_sku info=
 to the end of the modalias)
Merging hwmon-staging/hwmon-next (66ae4d562b6a hwmon: (tmp421) Add of_node_=
put() before return)
Merging jc_docs/docs-next (2df9f7f57905 docs: translations: zh_CN: memory-h=
otplug.rst: fix a typo)
Merging v4l-dvb/master (fd2eda71a47b media: remove myself from dvb media ma=
intainers)
Merging v4l-dvb-next/master (57c3b9f55ba8 media: venus: core: Add sdm660 DT=
 compatible and resource struct)
Merging pm/linux-next (8b39e976f0f8 Merge branch 'pm-pci' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (b3c08d1ad2bb cpufreq: Fix param=
eter in parse_perf_domain())
Merging cpupower/cpupower (79a0dc5530a9 tools: cpupower: fix typo in cpupow=
er-idle-set(1) manpage)
Merging devfreq/devfreq-next (6b28c7d0781e PM / devfreq: Strengthen check f=
or freq_table)
Merging opp/opp/linux-next (27ff8187f13e opp: Fix return in _opp_add_static=
_v2())
Merging thermal/thermal/linux-next (a67a46af4ad6 thermal/core: Deprecate ch=
anging cooling device state from userspace)
Merging ieee1394/for-next (54b3bd99f094 firewire: nosy: switch from 'pci_' =
to 'dma_' API)
Merging dlm/next (ecd95673142e fs: dlm: avoid comms shutdown delay in relea=
se_lockspace)
Merging rdma/for-next (71ee1f127543 Merge brank 'mlx5_mkey' into rdma.git f=
or-next)
Merging net-next/master (8e8c1bfce302 Merge branch 'enetc-trivial-ptp-one-s=
tep-tx-timestamping-cleanups')
CONFLICT (content): Merge conflict in tools/testing/selftests/net/forwardin=
g/forwarding.config.sample
CONFLICT (content): Merge conflict in net/netfilter/ipvs/ip_vs_ctl.c
CONFLICT (content): Merge conflict in include/linux/mlx5/fs.h
CONFLICT (content): Merge conflict in drivers/net/ethernet/intel/ice/ice_de=
vlink.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/intel/ice/ice_de=
vids.h
Applying: fixup for "net/mlx5: Lag, move lag files into directory"
Merging bpf-next/for-next (29da17c48886 Merge branch 'libbpf: support custo=
m .rodata.*/.data.* sections')
Merging ipsec-next/master (83688aec17bf net/ipv4/xfrm4_tunnel.c: remove sup=
erfluous header files from xfrm4_tunnel.c)
Merging mlx5-next/mlx5-next (60dd57c74794 Merge brank 'mlx5_mkey' into rdma=
.git for-next)
Merging netfilter-next/master (05be94633783 net: ethernet: ixp4xx: Make use=
 of dma_pool_zalloc() instead of dma_pool_alloc/memset())
Merging ipvs-next/master (ffdd33dd9c12 netfilter: core: Fix clang warnings =
about unused static inlines)
Merging wireless-drivers-next/master (9bc0b1aa8b7e Merge tag 'mt76-for-kval=
o-2021-10-20' of https://github.com/nbd168/wireless)
Merging bluetooth/master (7a517ac9c00b Bluetooth: btsdio: Do not bind to no=
n-removable BCM4345 and BCM43455)
Merging mac80211-next/master (f9d366d420af cfg80211: fix kernel-doc for MBS=
SID EMA)
Merging mtd/mtd/next (c13de2386c78 mtd: core: don't remove debugfs director=
y if device is in use)
Merging nand/nand/next (fc9e18f9e987 mtd: rawnand: arasan: Prevent an unsup=
ported configuration)
Merging spi-nor/spi-nor/next (df872ab1ffe4 mtd: spi-nor: nxp-spifi: Make us=
e of the helper function devm_platform_ioremap_resource_byname())
Merging crypto/master (06f6e365e2ec crypto: octeontx2 - set assoclen in aea=
d_do_fallback())
Merging drm/drm-next (6f2f7c83303d Merge tag 'drm-intel-gt-next-2021-10-21'=
 of git://anongit.freedesktop.org/drm/drm-intel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/msm_gem_submit.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_context=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_ttm=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_panel_orientation=
_quirks.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdkfd/kfd_migrat=
e.c
Merging drm-misc/for-linux-next (f8b5307074f8 drm/rockchip: Implement mmap =
as GEM object function)
Merging amdgpu/drm-next (019906884a57 drm/amdgpu/vcn3.0: remove intermediat=
e variable)
Merging drm-intel/for-linux-next (81148c266f6a drm/i915/hdmi: Extract intel=
_hdmi_output_format())
Merging drm-tegra/drm/tegra/for-next (5dccbc9de8f0 drm/tegra: dc: rgb: Allo=
w changing PLLD rate on Tegra30+)
Merging drm-msm/msm-next (e60af4f8550f dt-bindings: msm/dp: Add SC8180x com=
patibles)
Merging imx-drm/imx-drm/next (20fbfc81e390 drm/imx: imx-tve: Make use of th=
e helper function devm_platform_ioremap_resource())
Merging etnaviv/etnaviv/next (81fd23e2b3cc drm/etnaviv: Implement mmap as G=
EM object function)
Merging regmap/for-next (ec872b2b6554 Merge remote-tracking branch 'regmap/=
for-5.15' into regmap-linus)
Merging sound/for-next (f917c04fac45 ALSA: memalloc: Fix a typo in snd_dma_=
buffer_sync() description)
Merging sound-asoc/for-next (fbdf6ab3d36e Merge remote-tracking branch 'aso=
c/for-5.16' into asoc-next)
Merging modules/modules-next (ced75a2f5da7 MAINTAINERS: Add Luis Chamberlai=
n as modules maintainer)
Merging input/next (c6ac8f0b4ca9 Input: ili210x - add ili251x firmware upda=
te support)
Merging block/for-next (8131e5e445ac Merge branch 'for-5.16/block' into for=
-next)
Merging device-mapper/for-next (dffca4d565b3 dm: Remove redundant flush_wor=
kqueue() calls)
Merging libata/for-next (1af5f7af2484 pata_radisys: fix checking of DMA sta=
te)
Merging pcmcia/pcmcia-next (e39cdacf2f66 pcmcia: i82092: fix a null pointer=
 dereference bug)
Merging mmc/next (61840edc8813 mmc: dw_mmc: Drop use of ->init_card() callb=
ack)
Merging mfd/for-mfd-next (813c24f4caf3 mfd: altera-sysmgr: Fix a mistake ca=
used by resource_size conversion)
Merging backlight/for-backlight-next (3976e974df1f video: backlight: ili932=
0: Make ili9320_remove() return void)
Merging battery/for-next (172d0ccea55c power: bq25890: add return values to=
 error messages)
Merging regulator/for-next (0627d75a18ea Merge series "regulator: Introduce=
 UniPhier NX1 SoC support" from Kunihiko Hayashi <hayashi.kunihiko@socionex=
t.com>:)
$ git reset --hard HEAD^
Merging next-20211021 version of regulator
Merging security/next-testing (047843bdb316 Merge branch 'landlock_lsm_v34'=
 into next-testing)
Merging apparmor/apparmor-next (d108370c644b apparmor: fix error check)
Merging integrity/next-integrity (cc4299ea0399 ima: Use strscpy instead of =
strlcpy)
Merging keys/keys-next (e377c31f788f integrity: Load mokx variables into th=
e blacklist keyring)
CONFLICT (content): Merge conflict in certs/system_keyring.c
Merging safesetid/safesetid-next (1b8b71922919 LSM: SafeSetID: Mark safeset=
id_initialized as __initdata)
Merging selinux/next (15bf32398ad4 security: Return xattr name from securit=
y_dentry_init_security())
CONFLICT (content): Merge conflict in include/uapi/linux/audit.h
CONFLICT (content): Merge conflict in fs/io_uring.c
CONFLICT (content): Merge conflict in fs/io-wq.c
Applying: fixup for "io_uring: init opcode in io_init_req()"
Merging smack/next (b57d02091b8f Smack: fix W=3D1 build warnings)
Merging tomoyo/master (7d2a07b76933 Linux 5.14)
Merging tpmdd/next (f985911b7bc7 crypto: public_key: fix overflow during im=
plicit conversion)
Merging watchdog/master (519d81956ee2 Linux 5.15-rc6)
Merging iommu/next (145cac8e9cfe Merge branches 'apple/dart', 'arm/mediatek=
', 'arm/renesas', 'arm/tegra', 'x86/amd', 'x86/vt-d' and 'core' into next)
Applying: fix for "iommu/dart: Exclude MSI doorbell from PCIe device IOVA r=
ange"
Merging audit/next (d9516f346e8b audit: return early if the filter rule has=
 a lower priority)
CONFLICT (content): Merge conflict in include/uapi/linux/audit.h
Merging devicetree/for-next (f925a97b32f4 of/unittest: Add of_node_put() be=
fore return)
Merging mailbox/mailbox-for-next (0a5ad4322927 mailbox: mtk-cmdq: Fix local=
 clock ID usage)
Merging spi/for-next (8605ad089701 Merge remote-tracking branch 'spi/for-5.=
16' into spi-next)
Merging tip/auto-latest (f7354d76523e Merge remote-tracking branch 'tip/x86=
/cpu' into tip-master)
CONFLICT (content): Merge conflict in arch/x86/kernel/fpu/signal.c
CONFLICT (content): Merge conflict in arch/x86/include/asm/fpu/api.h
Applying: Revert "sched: Add wrapper for get_wchan() to keep task blocked"
Applying: Revert "x86: Fix get_wchan() to support the ORC unwinder"
Merging clockevents/timers/drivers/next (8602a80bb85e clocksource/drivers/e=
xynosy: Depend on sub-architecture for Exynos MCT and Samsung PWM)
Merging edac/edac-for-next (f889e52436d6 Merge branch 'edac-urgent' into ed=
ac-for-next)
Merging irqchip/irq/irqchip-next (f880d3b0e2a4 Merge branch irq/modular-irq=
chips into irq/irqchip-next)
Merging ftrace/for-next (8d6e90983ade tracing: Create a sparse bitmask for =
pid filtering)
CONFLICT (content): Merge conflict in kernel/kprobes.c
Merging rcu/rcu/next (4b246eab4750 rcu/nocb: Make local rcu_nocb_lock_irqsa=
ve() safe against concurrent deoffloading)
CONFLICT (content): Merge conflict in kernel/rcu/tasks.h
Merging kvm/next (a25c78d04c1b Merge commit 'kvm-pagedata-alloc-fixes' into=
 HEAD)
CONFLICT (content): Merge conflict in arch/x86/kvm/x86.c
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
Merging kvm-arm/next (5a2acbbb0179 Merge branch kvm/selftests/memslot into =
kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (72476aaa4691 KVM: PPC: Book3S HV: Fix host ra=
dix SLB optimisation with hash guests)
Merging kvms390/next (2ef7843375dc KVM: s390: Add a routine for setting use=
rspace CPU state)
Merging xen-tip/linux-next (319933a80fd4 xen/balloon: fix cancelled balloon=
 action)
Merging percpu/for-next (a81a52b325ec Merge branch 'for-5.14-fixes' into fo=
r-next)
Merging workqueues/for-next (55df0933be74 workqueue: Introduce show_one_wor=
ker_pool and show_one_workqueue.)
Merging drivers-x86/for-next (5ecc1e947822 Input: axp20x-pek - Use new soc_=
intel_is_cht() helper)
Merging chrome-platform/for-next (3119c28634dd MAINTAINERS: Chrome: Drop En=
ric Balletbo i Serra)
Merging hsi/for-next (4ef69e17eb56 HSI: cmt_speech: unmark comments as kern=
el-doc)
Merging leds/for-next (97b31c1f8eb8 leds: trigger: Disable CPU trigger on P=
REEMPT_RT)
Merging ipmi/for-next (fc4e78481afa char: ipmi: replace snprintf in show fu=
nctions with sysfs_emit)
Merging driver-core/driver-core-next (adb5151fa82c gpiolib: acpi: Replace c=
ustom code with device_match_acpi_handle())
Merging usb/usb-next (b851f7c7b8fd usb: dwc3: gadget: Change to dev_dbg() w=
hen queuing to inactive gadget/ep)
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (c8345c0500de USB: serial: kl5kusb105: drop lin=
e-status helper)
Merging usb-chipidea-next/for-usb-next (78665f57c3fa usb: chipidea: udc: ma=
ke controller hardware endpoint primed)
Merging tty/tty-next (3968ddcf05fb tty: tty_buffer: Fix the softlockup issu=
e in flush_to_ldisc)
Merging char-misc/char-misc-next (8135cc5b270b MAINTAINERS: Update the entr=
y for MHI bus)
Merging extcon/extcon-next (f83d7033d4ec dt-bindings: extcon: usbc-tusb320:=
 Add TUSB320L compatible string)
Merging phy-next/next (fc2a3a3641af phy: cadence-torrent: Add support to ou=
tput received reference clock)
Merging soundwire/next (abd9a6049bb5 soundwire: qcom: add debugfs entry for=
 soundwire register dump)
Merging thunderbolt/next (0a0624a26f9c thunderbolt: Fix -Wrestrict warning)
Merging vfio/next (9cef73918e15 vfio: Use cdev_device_add() instead of devi=
ce_create())
Merging staging/staging-next (573c79e42d40 staging: vt6655: Rename `dwAL223=
0InitTable` array)
Merging iio/togreg (77af145dc7ea dt-bindings: iio: frequency: add adrf6780 =
doc)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (dfe14674bf7b Merge branch 'icc-rpm' into icc-next)
Merging dmaengine/next (635156d94b64 dmaengine: imx-sdma: remove space afte=
r sizeof)
Merging cgroup/for-next (0061270307f2 cgroup: cgroup-v1: do not exclude cgr=
p_dfl_root)
Merging scsi/for-next (edc5cb40999b Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (83c3a7beaef7 scsi: lpfc: Update lpfc version to =
14.0.0.3)
Merging vhost/linux-next (d3d74a13e565 virtio_net: clarify tailroom logic)
CONFLICT (content): Merge conflict in drivers/net/virtio_net.c
Merging rpmsg/for-next (6ee5808de074 Merge branches 'rpmsg-next' and 'rproc=
-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (f4a20dfac88c gpio: mc33880: Drop if with a=
n always false condition)
Merging gpio-intel/for-next (1649b8376694 gpio: pca953x: Improve bias setti=
ng)
Merging pinctrl/for-next (664bad61ccde Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/mfd=
/brcm,cru.yaml
Merging pinctrl-intel/for-next (176412f8674b pinctrl: intel: Kconfig: Add c=
onfiguration menu to Intel pin control)
Merging pinctrl-renesas/renesas-pinctrl (f4e260bffcf3 pinctrl: renesas: che=
cker: Prefix common checker output)
Merging pinctrl-samsung/for-next (f9d8de699ac4 pinctrl: samsung: support Ex=
ynosAutov9 SoC pinctrl)
Merging pwm/for-next (3f2b16734914 pwm: mtk-disp: Implement atomic API .get=
_state())
Merging userns/for-next (e9012e756d30 Merge of per_signal_struct_coredumps-=
for-v5.16, and ucount-fixes-for-v5.16 for testing in linux-next)
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging kselftest/next (c3867ab5924b selftests: kvm: fix mismatched fclose(=
) after popen())
Merging livepatching/for-next (cd2d68f2d6b2 Merge branch 'for-5.15/cpu-hotp=
lug' into for-next)
Merging coresight/next (1efbcec2ef8c coresight: cti: Reduce scope for the v=
ariable =E2=80=9Ccs_fwnode=E2=80=9D in cti_plat_create_connection())
Merging rtc/rtc-next (f8d4e4fa51ec rtc: pcf8523: add BSM support)
Merging nvdimm/libnvdimm-for-next (e765f13ed126 nvdimm/pmem: move dax_attri=
bute_group from dax to pmem)
Merging at24/at24/for-next (762925405482 dt-bindings: at24: add ON Semi CAT=
24C04 and CAT24C05)
Merging ntb/ntb-next (f96cb827ce49 ntb: ntb_pingpong: remove redundant init=
ialization of variables msg_data and spad_data)
Merging seccomp/for-next/seccomp (d9bbdbf324cd x86: deduplicate the spectre=
_v2_user documentation)
Merging kspp/for-next/kspp (a7790b4a4310 Merge branches 'for-next/thread_in=
fo/cpu', 'for-next/overflow' and 'for-next/hardening' into for-next/kspp)
Merging kspp-gustavo/for-next/kspp (3915822ab3a5 Merge branch 'for-next/cas=
t-function' into for-next/kspp)
Applying: fixup for "ftrace: Fix -Wmissing-prototypes errors"
Applying: Revert "Makefile: Enable -Wcast-function-type"
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (0f79ce970e79 gnss: drop stray semicolons)
Merging fsi/next (7cc2f34e1f4d fsi: sbefifo: Use interruptible mutex lockin=
g)
Merging slimbus/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging nvmem/for-next (413333fd6a88 nvmem: imx-ocotp: add support for post=
 processing)
Merging xarray/main (2c7e57a02708 idr test suite: Improve reporting from id=
r_find_test_1)
Merging hyperv/hyperv-next (9d68cd9120e4 hv_utils: Set the maximum packet s=
ize for VSS driver to the length of the receive buffer)
Merging auxdisplay/auxdisplay (97fbb29fc1eb MAINTAINERS: Add DT Bindings fo=
r Auxiliary Display Drivers)
Merging kgdb/kgdb/for-next (f8416aa29185 kernel: debug: Convert to SPDX ide=
ntifier)
Merging hmm/hmm (6880fa6c5660 Linux 5.15-rc1)
Merging fpga/for-next (57b44817a8d6 MAINTAINERS: Drop outdated FPGA Manager=
 website)
Merging kunit/test (6880fa6c5660 Linux 5.15-rc1)
Merging cfi/cfi/next (ff1176468d36 Linux 5.14-rc3)
Merging kunit-next/kunit (17ac23eb43f0 kunit: Reset suite count after runni=
ng tests)
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mhi/mhi-next (8c61951b372d Merge tag 'soundwire-5.15-rc1' of git://=
git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire into char-misc-next)
Merging memblock/for-next (e888fa7bb882 memblock: Check memory add/cap orde=
ring)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (e71ba9452f0b Linux 5.11-rc2)
Merging rust/rust-next (a5085d70a3ba MAINTAINERS: Rust)
CONFLICT (content): Merge conflict in scripts/kconfig/confdata.c
CONFLICT (content): Merge conflict in scripts/Makefile.modfinal
CONFLICT (content): Merge conflict in Makefile
Applying: Kbuild: fix for "kbuild: split DEBUG_CFLAGS out to scripts/Makefi=
le.debug"
Merging cxl/next (ed97afb53365 cxl/pci: Disambiguate cxl_pci further from c=
xl_mem)
Merging folio/for-next (121703c1c817 mm/writeback: Add folio_write_one)
CONFLICT (modify/delete): fs/cachefiles/rdwr.c deleted in HEAD and modified=
 in folio/for-next. Version folio/for-next of fs/cachefiles/rdwr.c left in =
tree.
$ git rm -f fs/cachefiles/rdwr.c
Applying: fix up for "9p: Convert to using the netfs helper lib to do reads=
 and caching"
Merging bitmap/bitmap-master-5.15 (785cb064e2f8 vsprintf: rework bitmap_lis=
t_string)
CONFLICT (content): Merge conflict in arch/parisc/include/asm/bitops.h
Merging zstd/zstd-1.4.10 (464413496acb MAINTAINERS: Add maintainer entry fo=
r zstd)
Merging efi/next (720dff78de36 efi: Allow efi=3Druntime)
Merging akpm-current/current (89e1e15c7bf0 ipc/ipc_sysctl.c: remove fallbac=
k for !CONFIG_PROC_SYSCTL)
CONFLICT (content): Merge conflict in mm/mempolicy.c
CONFLICT (content): Merge conflict in mm/internal.h
CONFLICT (content): Merge conflict in mm/filemap.c
CONFLICT (content): Merge conflict in kernel/sched/core.c
CONFLICT (content): Merge conflict in kernel/exit.c
CONFLICT (content): Merge conflict in include/linux/sched/mm.h
CONFLICT (content): Merge conflict in include/linux/migrate.h
CONFLICT (content): Merge conflict in drivers/of/of_reserved_mem.c
Applying: mm-filemap-check-if-thp-has-hwpoisoned-subpage-for-pmd-page-fault=
-vs-folios
Applying: kvmalloc etc moved to slab.h
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
dropping 82901b07aee889b38728b3946cf0b0673bd7a697 mm-filemap-check-if-thp-h=
as-hwpoisoned-subpage-for-pmd-page-fault-vs-folios -- patch contents alread=
y upstream
Merging akpm/master (5b3cbcec307a lib/stackdepot: allow optional init and s=
tack_table allocation by kvmalloc() - fixup3)

--Sig_/7CS5wlShp/KscOo8zLBxR2M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFygTUACgkQAVBC80lX
0GwHlgf+OyEy58UPZ2xCK0esNhF24ckdDGMtgMTJeYndWafdTIuZW1iWBW1gwZuw
ZFnurNlOnT1OXNi1ls9zsE4vPFtY19w6TIxF6ikg5KQCiXRr8yWvUZtmBjUeaWeg
sSTjDVhYuxcPVvlKwCFJJpQCtmgGFA+2jW67k6mXVOr2ZJvzGiwrYpFyKK53s5YS
0DOW09JuT66/nhgZDHJiUtz0dmL/9+ZzoFa19Vr9a6fQ1+3h4DkYBl+aY2B/6x/h
SxfSk4Ee7ZLvD+veRNGeHjDr4RQxYa/CAn7idRMCSkRffnqtTVauXANtWn2FgVMT
zYHnicpR0lKp5Ra6F/XwXg0B5t7RRA==
=/PTr
-----END PGP SIGNATURE-----

--Sig_/7CS5wlShp/KscOo8zLBxR2M--
