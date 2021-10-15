Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F60442EE67
	for <lists+linux-next@lfdr.de>; Fri, 15 Oct 2021 12:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237614AbhJOKI7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Oct 2021 06:08:59 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:39531 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237573AbhJOKIx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Oct 2021 06:08:53 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HW24631rTz4xb7;
        Fri, 15 Oct 2021 21:06:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634292406;
        bh=Do1isiMjIpzWiQdZI0nldseBq+0vxAbCasEQDUn4ppE=;
        h=Date:From:To:Cc:Subject:From;
        b=nZOqv1PjlTUQ3ve441H9luvtCmLL/lqZ4X0ccUtvj1PTZJGUDq45e5JGGFgz8c6zs
         5NkDIFPKW2HuVK6UTjztqy4d+rfBK5xCqgKrHqqlEDZuVdycRatJll3PzNGFT0YAqT
         04F6+Y7IHNTPIyxVwL4vx+ugV973YqVumb/DlYJYNmlXOuCrWYgpJrQigYKX4uNK5c
         3JzEey0qkbr3YtkwOJg98tAMJBhGbbIZjL3rgjllcILGlGuGirNjDXe1VJp9IawPDr
         O9lmu3Vlh8LOpqwSyXuKA54p+f13QvAh7313HpdOEo4/JohQtQtGFrfLooibrx97BK
         90p+Nfk0bVeCg==
Date:   Fri, 15 Oct 2021 21:06:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 15
Message-ID: <20211015210645.3e848ac8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NTTfqzZ.Ke=F=hLvvmofKLw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NTTfqzZ.Ke=F=hLvvmofKLw
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20211013:

The kspp-gustavo tree gained a build failure so I used the version from
next-20211013.

The netfilter-next tree gained a conflict against the netfilter tree.

The drm-misc tree gained a build failure for which I applied a patch.

The selinux tree gained a conflict against the device-mapper tree.

The audit tree gained a conflict against the device-mapper, selinux trees.

The tip tree gained a conflict against the gfs2 tree.

The pinctrl tree gained a conflict against the mfd tree.

The akpm-current tree gained a build failure for which I applied a patch.

Non-merge commits (relative to Linus' tree): 7528
 7427 files changed, 504844 insertions(+), 170687 deletions(-)

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

I am currently merging 338 trees (counting Linus' and 91 trees of bug
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
Merging origin/master (ec681c53f8d2 Merge tag 'net-5.15-rc6' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging fixes/fixes (3ca706c189db drm/ttm: fix type mismatch error on sparc=
64)
Merging kbuild-current/fixes (0664684e1ebd kbuild: Add -Werror=3Dignored-op=
timization-argument to CLANG_FLAGS)
Merging arc-current/for-curr (6880fa6c5660 Linux 5.15-rc1)
Merging arm-current/fixes (463dbba4d189 ARM: 9104/2: Fix Keystone 2 kernel =
mapping regression)
Merging arm64-fixes/for-next/fixes (596143e3aec3 acpi/arm64: fix next_platf=
orm_timer() section mismatch error)
Merging arm-soc-fixes/arm/fixes (0f0f80d9d5db iommu/arm: fix ARM_SMMU_QCOM =
compilation)
Merging drivers-memory-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging m68k-current/for-linus (9fde03486402 m68k: Remove set_fs())
Merging powerpc-fixes/fixes (eb8257a12192 pseries/eeh: Fix the kdump kernel=
 crash during eeh_pseries_init)
Merging s390-fixes/fixes (8b7216439e2e s390: add Alexander Gordeev as revie=
wer)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (80f6e3080bfc fs-verity: fix signed inte=
ger overflow with i_size near S64_MAX)
Merging net/master (ec681c53f8d2 Merge tag 'net-5.15-rc6' of git://git.kern=
el.org/pub/scm/linux/kernel/git/netdev/net)
Merging bpf/master (732b74d64704 virtio-net: fix for skb_over_panic inside =
big mode)
Merging ipsec/master (93ec1320b017 xfrm: fix rcu lock in xfrm_notify_userpo=
licy())
Merging netfilter/master (3e6ed7703dae selftests: netfilter: remove stray b=
ash debug line)
Merging ipvs/master (465f15a6d1a8 selftests: nft_nat: add udp hole punch te=
st case)
Merging wireless-drivers/master (603a1621caa0 mwifiex: avoid null-pointer-s=
ubtraction warning)
Merging mac80211/master (a2083eeb119f cfg80211: scan: fix RCU in cfg80211_a=
dd_nontrans_list())
Merging rdma-fixes/for-rc (1ab52ac1e9bc RDMA/mlx5: Set user priority for DC=
T)
Merging sound-current/for-linus (aef454b40288 ALSA: hda/realtek: Add quirk =
for Clevo PC50HS)
Merging sound-asoc-fixes/for-linus (cd348b080d16 Merge remote-tracking bran=
ch 'asoc/for-5.15' into asoc-linus)
Merging regmap-fixes/for-linus (ec872b2b6554 Merge remote-tracking branch '=
regmap/for-5.15' into regmap-linus)
Merging regulator-fixes/for-linus (81f2982909cd Merge remote-tracking branc=
h 'regulator/for-5.15' into regulator-linus)
Merging spi-fixes/for-linus (fcf3dbf10818 Merge remote-tracking branch 'spi=
/for-5.15' into spi-linus)
Merging pci-current/for-linus (2b94b6b79b7c PCI/MSI: Handle msi_populate_sy=
sfs() errors correctly)
Merging driver-core.current/driver-core-linus (81967efb5f39 drivers: bus: D=
elete CONFIG_SIMPLE_PM_BUS)
Merging tty.current/tty-linus (cb2282213e84 serial: 8250: allow disabling o=
f Freescale 16550 compile test)
Merging usb.current/usb-linus (c2115b2b1642 usb: musb: dsps: Fix the probe =
error path)
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (11c52d250b34 USB: serial: qcserial: add=
 EM9191 QDL support)
Merging usb-chipidea-fixes/for-usb-fixes (f130d08a8d79 usb: chipidea: ci_hd=
rc_imx: Also search for 'phys' phandle)
Merging phy/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging staging.current/staging-linus (37f12202c5d2 staging: r8188eu: preve=
nt array underflow in rtw_hal_update_ra_mask())
Merging iio-fixes/fixes-togreg (8fc4f038fa83 Documentation:devicetree:bindi=
ngs:iio:dac: Fix val)
Merging char-misc.current/char-misc-linus (5d388fa01fa6 nvmem: Fix shift-ou=
t-of-bound (UBSAN) with byte size cells)
Merging soundwire-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging thunderbolt-fixes/fixes (64570fbc14f8 Linux 5.15-rc5)
Merging input-current/for-linus (0c5483a5778f Input: analog - always use kt=
ime functions)
Merging crypto-current/master (0e14ef38669c crypto: x86/sm4 - Fix frame poi=
nter stack corruption)
Merging vfio-fixes/for-linus (42de956ca7e5 vfio/ap_ops: Add missed vfio_uni=
nit_group_dev())
Merging kselftest-fixes/fixes (2f9602870886 selftests: drivers/dma-buf: Fix=
 implicit declaration warns)
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
Merging kvm-fixes/master (2353e593a13b Merge tag 'kvm-s390-master-5.15-1' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into kvm-mast=
er)
Merging kvms390-fixes/master (25b5476a294c KVM: s390: Function documentatio=
n fixes)
Merging hwmon-fixes/hwmon (ada61aa0b118 hwmon: Fix possible memleak in __hw=
mon_device_register())
Merging nvdimm-fixes/libnvdimm-fixes (d55174cccac2 nvdimm/pmem: fix creatin=
g the dax group)
Merging cxl-fixes/fixes (fae8817ae804 cxl/mem: Fix memory device capacity p=
robing)
Merging btrfs-fixes/next-fixes (d7395f03c79c Merge branch 'misc-5.15' into =
next-fixes)
Merging vfs-fixes/fixes (173e84953eaa fs: fix reporting supported extra fil=
e attributes for statx())
Merging dma-mapping-fixes/for-linus (18a3c5f7abfd Merge tag 'for_linus' of =
git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging i3c-fixes/i3c/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging drivers-x86-fixes/fixes (7df227847ab5 platform/x86: int1092: Fix no=
n sequential device mode handling)
Merging samsung-krzk-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging pinctrl-samsung-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging devicetree-fixes/dt/linus (b2d70c0dbf27 dt-bindings: drm/bridge: ti=
-sn65dsi86: Fix reg value)
Merging scsi-fixes/fixes (f2b85040acec scsi: core: Put LLD module refcnt af=
ter SCSI device is released)
Merging drm-fixes/drm-fixes (0dee6f70fd40 drm: rcar-du: Don't create encode=
r for unconnected LVDS outputs)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (82a59c7f456d drm/i915: Free t=
he returned object of acpi_evaluate_dsm())
Merging mmc-fixes/fixes (6ab4e2eb5e95 mmc: sdhci-pci: Read card detect from=
 ACPI for Intel Merrifield)
Merging rtc-fixes/rtc-fixes (bd33335aa93d rtc: cmos: Disable irq around dir=
ect invocation of cmos_interrupt())
Merging gnss-fixes/gnss-linus (e73f0f0ee754 Linux 5.14-rc1)
Merging hyperv-fixes/hyperv-fixes (f5c20e4a5f18 x86/hyperv: Avoid erroneous=
ly sending IPI to 'self')
Merging soc-fsl-fixes/fix (c1e64c0aec8c soc: fsl: qe: fix static checker wa=
rning)
Merging risc-v-fixes/fixes (3ef6ca4f354c checksyscalls: Unconditionally ign=
ore fstat{,at}64)
Merging pidfd-fixes/fixes (03ba0fe4d09f file: simplify logic in __close_ran=
ge())
Merging fpga-fixes/fixes (2a2a79577dda fpga: ice40-spi: Add SPI device ID t=
able)
Merging spdx/spdx-linus (6880fa6c5660 Linux 5.15-rc1)
Merging gpio-brgl-fixes/gpio/for-current (6fda593f3082 gpio: mockup: Conver=
t to use software nodes)
Merging gpio-intel-fixes/fixes (1649b8376694 gpio: pca953x: Improve bias se=
tting)
Merging pinctrl-intel-fixes/fixes (64570fbc14f8 Linux 5.15-rc5)
Merging erofs-fixes/fixes (c40dd3ca2a45 erofs: clear compacted_2b if compac=
ted_4b_initial > totalidx)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (361b57df62de kunit: fix kernel-doc warning=
s due to mismatched arg names)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (6e44bd6d34d6 memblock: exclude NOMAP regions =
from kmemleak)
Merging cel-fixes/for-rc (7d2a07b76933 Linux 5.14)
Merging irqchip-fixes/irq/irqchip-fixes (b78f26926b17 irqchip/gic: Work aro=
und broken Renesas integration)
Merging renesas-fixes/fixes (432b52eea3dc ARM: shmobile: defconfig: Restore=
 graphical consoles)
Merging perf-current/perf/urgent (1da38549dd64 Merge tag 'nfsd-5.15-3' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/cel/linux)
Merging drm-misc-fixes/for-linux-next-fixes (6de148d82d9e drm/vc4: crtc: Ma=
ke sure the HDMI controller is powered when disabling)
Merging kspp-gustavo/for-next/kspp (3915822ab3a5 Merge branch 'for-next/cas=
t-function' into for-next/kspp)
$ git reset --hard HEAD^
Merging next-20211013 version of kspp-gustavo
Merging kbuild/for-next (a8ea7ec588ac [for -next only] kconfig: generate in=
clude/generated/rustc_cfg)
Merging perf/perf/core (be8ecc57f180 perf srcline: Use long-running addr2li=
ne per DSO)
Merging compiler-attributes/compiler-attributes (b83a908498d6 compiler_attr=
ibutes.h: move __compiletime_{error|warning})
Merging dma-mapping/for-next (293d92cbbd24 dma-debug: fix sg checks in debu=
g_dma_map_sg())
Merging asm-generic/master (7efbbe6e1414 qcom_scm: hide Kconfig symbol)
Merging arc/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging arm/for-next (4603664c0fe9 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (f90f4ae11855 Merge branch 'for-next/fixes' int=
o for-next/core)
Merging arm-perf/for-next/perf (e656972b6986 drivers/perf: Improve build te=
st coverage)
Merging arm-soc/for-next (6737810be216 soc: document merges)
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (83e38509109e Merge branch 'v5.16/dt64' into for-n=
ext)
Merging aspeed/for-next (69890d2c55f3 Merge branches 'defconfig-for-v5.16' =
and 'dt-for-v5.16' into for-next)
Merging at91/at91-next (6880fa6c5660 Linux 5.15-rc1)
Merging drivers-memory/for-next (8f086fe5f3c9 Merge branch 'mem-ctrl-next' =
into for-next)
Merging imx-mxs/for-next (0dfc2dd723c8 Merge branch 'imx/maintainers' into =
for-next)
Merging keystone/next (cb293d3b430e Merge branch 'for_5.15/drivers-soc' int=
o next)
Merging mediatek/for-next (8c62103627a8 Merge branch 'v5.15-next/soc' into =
for-next)
Merging mvebu/for-next (04e78a787b74 arm/arm64: dts: Enable 2.5G Ethernet p=
ort on CN9130-CRB)
Merging omap/for-next (92d190433bd8 Merge branch 'omap-for-v5.16/gpmc' into=
 for-next)
Merging qcom/for-next (37f6317b1882 Merge branches 'arm64-for-5.16', 'drive=
rs-for-5.16' and 'dts-for-5.16' into for-next)
Merging raspberrypi/for-next (a036b0a5d7d6 ARM: dts: bcm2711-rpi-4-b: Fix u=
sb's unit address)
Merging renesas/next (f9d9ae67a71d Merge branch 'renesas-arm-dt-for-v5.16' =
into renesas-next)
Merging reset/reset/next (3440b8fa067d reset: uniphier: Add NX1 reset suppo=
rt)
Merging rockchip/for-next (9a6218fd50c1 Merge branch 'v5.16-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (10846bb6b928 Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (b92b4019a797 Merge branch 'for-next/ffa' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-lin=
ux-next)
Merging stm32/stm32-next (350081007916 ARM: dts: stm32: set the DCMI pins o=
n stm32mp157c-odyssey)
Merging sunxi/sunxi/for-next (7fb77af71236 Merge branch 'sunxi/dt-for-5.16'=
 into sunxi/for-next)
Merging tegra/for-next (c45dd143ff1a Merge branch for-5.16/arm64/defconfig =
into for-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (f46d16cf5b43 arm64: dts: ti: k3-j721e-sk: Add=
 DDR carveout memory nodes)
Merging xilinx/for-next (7a4c31ee877a arm64: zynqmp: Add support for Xilinx=
 Kria SOM board)
Merging clk/clk-next (006a3c3b5f4f Merge branch 'clk-qcom' into clk-next)
Merging clk-imx/for-next (e8271eff5d8c clk: imx: Make CLK_IMX8ULP select MX=
C_CLK)
Merging clk-renesas/renesas-clk (373bd6f48756 clk: renesas: r9a07g044: Add =
SDHI clock and reset entries)
Merging clk-samsung/for-next (2ae5c2c3f8d5 dt-bindings: clock: Add bindings=
 definitions for Exynos850 CMU)
Merging csky/linux-next (40e080ed8218 csky: Make HAVE_TCM depend on !COMPIL=
E_TEST)
Merging h8300/h8300-next (1ec10274d436 h8300: don't implement set_fs)
Merging m68k/for-next (8a3c0a74ae87 m68k: defconfig: Update defconfigs for =
v5.15-rc1)
Merging m68knommu/for-next (e6d94fd07947 m68knommu: Remove MCPU32 config sy=
mbol)
Merging microblaze/next (6880fa6c5660 Linux 5.15-rc1)
Merging mips/mips-next (67512a8cf5a7 MIPS: Avoid macro redefinitions)
Merging nds32/next (07cd7745c6f2 nds32/setup: remove unused memblock_region=
 variable in setup_memory())
CONFLICT (content): Merge conflict in arch/nds32/Kconfig
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (72698a878926 openrisc: time: don't mark comment =
as kernel-doc)
Merging parisc-hd/for-next (144857444edb parisc/unwind: use copy_from_kerne=
l_nofault())
Merging powerpc/next (8f6aca0e0f26 powerpc/perf: Fix cycles/instructions as=
 PM_CYC/PM_INST_CMPL in power10)
Merging soc-fsl/next (242b0b398ccd soc: fsl: enable acpi support in RCPM dr=
iver)
Merging risc-v/for-next (9406369ae627 riscv: dts: microchip: use vendor com=
patible for Cadence SD4HC)
Merging s390/for-next (6e3b5a75960e Merge branch 'features' into for-next)
Merging sh/for-next (12285ff8667b sh: kdump: add some attribute to function)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (ab6ff1fda1e8 uml: x86: add FORCE to user_constants.=
h)
Merging xtensa/xtensa-for-next (012e974501a2 xtensa: xtfpga: Try software r=
estart before simulating CPU reset)
Merging pidfd/for-next (61bc346ce64a uapi/linux/prctl: provide macro defini=
tions for the PR_SCHED_CORE type argument)
Merging fscrypt/master (7f595d6a6cdc fscrypt: allow 256-bit master keys wit=
h AES-256-XTS)
Merging fscache/fscache-next (2bc879c792fa Merge branch 'fscache-remove-old=
-io' into fscache-next)
Merging afs/afs-next (7af08140979a Revert "gcov: clang: fix clang-11+ build=
")
Merging btrfs/for-next (00c9626f46be Merge branch 'for-next-next-v5.15-2021=
1014' into for-next-20211014)
Merging ceph/master (037ab4ddc273 libceph: drop ->monmap and err initializa=
tion)
Merging cifs/for-next (08e9f52e2dce cifs: for compound requests, use open h=
andle if possible)
Merging configfs/for-next (c42dd069be8d configfs: fix a race in configfs_lo=
okup())
Merging ecryptfs/next (682a8e2b41ef Merge tag 'ecryptfs-5.13-rc1-updates' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs)
Merging erofs/dev (24ac96062001 erofs: lzma compression support)
Merging exfat/dev (50be9417e23a Merge tag 'io_uring-5.14-2021-07-09' of git=
://git.kernel.dk/linux-block)
Merging ext3/for_next (372d1f3e1bfe ext2: fix sleeping in atomic bugs on er=
ror)
Merging ext4/dev (916ff8d5ea0e ext4: prevent partial update of the extent b=
locks)
Merging f2fs/dev (cd6d697a6e20 f2fs: fix wrong condition to trigger backgro=
und checkpoint correctly)
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (e15a9a5fca6c fuse: take cache_mask into account in g=
etattr)
Merging gfs2/for-next (b03f89157526 gfs2: Fix unused value warning in do_gf=
s2_set_flags())
Merging jfs/jfs-next (c48a14dca2cb JFS: fix memleak in jfs_mount)
Merging ksmbd/ksmbd-for-next (a6021825a8e1 ksmbd: validate credit charge af=
ter validating SMB2 PDU body size)
Merging nfs/linux-next (9e1ff307c779 Linux 5.15-rc4)
Merging nfs-anna/linux-next (8cfb9015280d NFS: Always provide aligned buffe=
rs to the RPC read layers)
Merging nfsd/nfsd-next (130e2054d4a6 SUNRPC: Change return value type of .p=
c_encode)
Merging cel/for-next (c20106944eb6 NFSD: Keep existing listeners on portlis=
t error)
Merging ntfs3/master (8607954cf255 fs/ntfs3: Check for NULL pointers in ni_=
try_remove_attr_list)
CONFLICT (content): Merge conflict in fs/ntfs3/xattr.c
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
Merging file-locks/locks-next (ec60f38a9178 Documentation: remove reference=
 to now removed mandatory-locking doc)
Merging vfs/for-next (8f40da9494cf Merge branch 'misc.namei' into for-next)
Merging printk/for-next (c15b5fc054c3 ia64: don't do IA64_CMPXCHG_DEBUG wit=
hout CONFIG_PRINTK)
Merging pci/next (d53c18bef952 Merge branch 'remotes/lorenzo/pci/xgene')
Merging pstore/for-next/pstore (c5d4fb2539ca pstore/blk: Use "%lu" to forma=
t unsigned long)
Merging hid/for-next (93d455d582b0 Merge branch 'for-5.15/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (26701d49482a Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i3c/i3c/next (a3587e2c0578 i3c: fix incorrect address slot lookup o=
n 64-bit)
Merging dmi/dmi-for-next (f97a2103f1a7 firmware: dmi: Move product_sku info=
 to the end of the modalias)
Merging hwmon-staging/hwmon-next (be68c4dcc659 hwmon: (dell-smm) Add suppor=
t for fanX_min, fanX_max and fanX_target)
Merging jc_docs/docs-next (a40a8a110305 scripts: kernel-doc: Ignore __alloc=
_size() attribute)
Merging v4l-dvb/master (64cdf7e5a3aa media: mtk-vcodec: MT8173 h264/vp8 enc=
oder min/max bitrate settings)
Merging v4l-dvb-next/master (fd2eda71a47b media: remove myself from dvb med=
ia maintainers)
Merging pm/linux-next (1b3dc77d7595 Merge branch 'acpi-tools' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (b3c08d1ad2bb cpufreq: Fix param=
eter in parse_perf_domain())
Merging cpupower/cpupower (79a0dc5530a9 tools: cpupower: fix typo in cpupow=
er-idle-set(1) manpage)
Merging devfreq/devfreq-next (6b28c7d0781e PM / devfreq: Strengthen check f=
or freq_table)
Merging opp/opp/linux-next (27ff8187f13e opp: Fix return in _opp_add_static=
_v2())
Merging thermal/thermal/linux-next (fc656fa14da7 thermal/drivers/netlink: A=
dd the temperature when crossing a trip point)
Merging ieee1394/for-next (54b3bd99f094 firewire: nosy: switch from 'pci_' =
to 'dma_' API)
Merging dlm/next (ecd95673142e fs: dlm: avoid comms shutdown delay in relea=
se_lockspace)
Merging rdma/for-next (ac0fffa0859b RDMA/core: Set sgtable nents when using=
 ib_dma_virt_map_sg())
Merging net-next/master (e15f5972b803 Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/netdev/net)
Merging bpf-next/for-next (431bfb9ee3e2 bpf, mips: Fix comment on tail call=
 count limiting)
Merging ipsec-next/master (83688aec17bf net/ipv4/xfrm4_tunnel.c: remove sup=
erfluous header files from xfrm4_tunnel.c)
Merging mlx5-next/mlx5-next (b8dfed636fc6 net/mlx5: Add priorities for coun=
ters in RDMA namespaces)
Merging netfilter-next/master (c650c35a2506 netfilter: ipvs: merge ipv4 + i=
pv6 icmp reply handlers)
CONFLICT (content): Merge conflict in net/netfilter/ipvs/ip_vs_ctl.c
Merging ipvs-next/master (7b1394892de8 netfilter: nft_dynset: relax superfl=
uous check on set updates)
Merging wireless-drivers-next/master (ff1cc2fa3055 wireless: Remove redunda=
nt 'flush_workqueue()' calls)
Merging bluetooth/master (b8f5482c9638 Bluetooth: vhci: Add support for set=
ting msft_opcode and aosp_capable)
Merging mac80211-next/master (171964252189 mac80211: MBSSID support in inte=
rface handling)
Merging mtd/mtd/next (b72841e4dcd5 mtd: mtdswap: Remove redundant assignmen=
t of pointer eb)
Merging nand/nand/next (c2606ddcf5ad mtd: onenand: samsung: drop Exynos4 an=
d describe driver in KConfig)
Merging spi-nor/spi-nor/next (3f491d11d8cb MAINTAINERS: Add spi-nor device =
tree binding under SPI NOR maintainers)
Merging crypto/master (b6f5f0c8f72d hwrng: mtk - Force runtime pm ops for s=
leep ops)
Merging drm/drm-next (1176d15f0f6e Merge tag 'drm-intel-gt-next-2021-10-08'=
 of git://anongit.freedesktop.org/drm/drm-intel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/msm_gem_submit.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_context=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_ttm=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdkfd/kfd_migrat=
e.c
Merging drm-misc/for-linux-next (566b651cc531 drm/panel: y030xx067a: Make u=
se of the helper function dev_err_probe())
Merging amdgpu/drm-next (624f1fd4925b drm/amdgpu/gfx10: fix typo in gfx_v10=
_0_update_gfx_clock_gating())
Merging drm-intel/for-linux-next (ea673f17ab76 drm/i915/uapi: Add comment c=
larifying purpose of I915_TILING_* values)
Merging drm-tegra/drm/tegra/for-next (5dccbc9de8f0 drm/tegra: dc: rgb: Allo=
w changing PLLD rate on Tegra30+)
Merging drm-msm/msm-next (c6921fbc88e1 drm/msm/dsi: fix off by one in dsi_b=
us_clk_enable error handling)
Merging imx-drm/imx-drm/next (20fbfc81e390 drm/imx: imx-tve: Make use of th=
e helper function devm_platform_ioremap_resource())
Merging etnaviv/etnaviv/next (81fd23e2b3cc drm/etnaviv: Implement mmap as G=
EM object function)
Merging regmap/for-next (ec872b2b6554 Merge remote-tracking branch 'regmap/=
for-5.15' into regmap-linus)
Merging sound/for-next (c18c4966033e ALSA: pcm: Unify snd_pcm_delay() and s=
nd_pcm_hwsync())
Merging sound-asoc/for-next (0ab0f9005b18 Merge remote-tracking branch 'aso=
c/for-5.16' into asoc-next)
Merging modules/modules-next (ced75a2f5da7 MAINTAINERS: Add Luis Chamberlai=
n as modules maintainer)
Merging input/next (a41392e0877a MAINTAINERS: rectify entry for CHIPONE ICN=
8318 I2C TOUCHSCREEN DRIVER)
Merging block/for-next (135cd4c67863 Merge branch 'for-5.16/io_uring' into =
for-next)
Merging device-mapper/for-next (dffca4d565b3 dm: Remove redundant flush_wor=
kqueue() calls)
Merging libata/for-next (1af5f7af2484 pata_radisys: fix checking of DMA sta=
te)
Merging pcmcia/pcmcia-next (e39cdacf2f66 pcmcia: i82092: fix a null pointer=
 dereference bug)
Merging mmc/next (0eab756f8821 mmc: moxart: Fix null pointer dereference on=
 pointer host)
Merging mfd/for-mfd-next (f38d3e404326 dt-bindings: mfd: Convert X-Powers A=
XP binding to a schema)
Merging backlight/for-backlight-next (563edf85ce18 backlight: Propagate err=
ors from get_brightness())
Merging battery/for-next (1a6784359540 power: supply: ab8500_bmdata: Use st=
andard phandle)
Merging regulator/for-next (d8b0c9f07417 Merge remote-tracking branch 'regu=
lator/for-5.16' into regulator-next)
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
Merging selinux/next (4d5b5539742d binder: use cred instead of task for get=
secid)
CONFLICT (content): Merge conflict in include/uapi/linux/audit.h
CONFLICT (content): Merge conflict in fs/io_uring.c
CONFLICT (content): Merge conflict in fs/io-wq.c
Applying: fixup for "io_uring: init opcode in io_init_req()"
Merging smack/next (b57d02091b8f Smack: fix W=3D1 build warnings)
Merging tomoyo/master (7d2a07b76933 Linux 5.14)
Merging tpmdd/next (f985911b7bc7 crypto: public_key: fix overflow during im=
plicit conversion)
Merging watchdog/master (5816b3e6577e Linux 5.15-rc3)
Merging iommu/next (0b29edc21567 Merge branches 'arm/mediatek', 'arm/renesa=
s', 'iommu/fixes', 'x86/amd' and 'core' into next)
Applying: fix for "iommu/dart: Exclude MSI doorbell from PCIe device IOVA r=
ange"
Merging audit/next (571e5c0efcb2 audit: add OPENAT2 record to list "how" in=
fo)
CONFLICT (content): Merge conflict in include/uapi/linux/audit.h
Merging devicetree/for-next (37f86649cdf7 dt-bindings: leds: register-bit-l=
ed: Use 'reg' instead of 'offset')
Merging mailbox/mailbox-for-next (85dfdbfc13ea mailbox: cmdq: add multi-gce=
 clocks support for mt8195)
Merging spi/for-next (2c8bdf517530 Merge remote-tracking branch 'spi/for-5.=
16' into spi-next)
Merging tip/auto-latest (880e2b8e3151 Merge branch 'tip-x86-sgx' into tip-m=
aster)
CONFLICT (content): Merge conflict in arch/x86/kernel/fpu/signal.c
Merging clockevents/timers/drivers/next (f196ae282070 dt-bindings: timer: A=
dd ABIs for new Ingenic SoCs)
Merging edac/edac-for-next (f889e52436d6 Merge branch 'edac-urgent' into ed=
ac-for-next)
Merging irqchip/irq/irqchip-next (6e3b473ee064 Merge branch irq/qcom-pdc-no=
wake-cleanup into irq/irqchip-next)
Merging ftrace/for-next (8d6e90983ade tracing: Create a sparse bitmask for =
pid filtering)
CONFLICT (content): Merge conflict in kernel/kprobes.c
Merging rcu/rcu/next (4b246eab4750 rcu/nocb: Make local rcu_nocb_lock_irqsa=
ve() safe against concurrent deoffloading)
CONFLICT (content): Merge conflict in kernel/rcu/tasks.h
Merging kvm/next (542a2640a2f4 Merge tag 'kvm-riscv-5.16-1' of git://github=
.com/kvm-riscv/linux into HEAD)
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
Merging kvm-arm/next (2a6bf5139e28 Merge branch kvm-arm64/misc-5.16 into kv=
marm-master/next)
Merging kvm-ppc/kvm-ppc-next (72476aaa4691 KVM: PPC: Book3S HV: Fix host ra=
dix SLB optimisation with hash guests)
Merging kvms390/next (2ef7843375dc KVM: s390: Add a routine for setting use=
rspace CPU state)
Merging xen-tip/linux-next (319933a80fd4 xen/balloon: fix cancelled balloon=
 action)
Merging percpu/for-next (a81a52b325ec Merge branch 'for-5.14-fixes' into fo=
r-next)
Merging workqueues/for-next (57116ce17b04 workqueue: fix state-dump console=
 deadlock)
Merging drivers-x86/for-next (85303db36b6e platform/x86: int1092: Fix non s=
equential device mode handling)
Merging chrome-platform/for-next (eb057514ccca platform/chrome: cros_ec: Fi=
x spelling mistake "responsed" -> "response")
Merging hsi/for-next (4ef69e17eb56 HSI: cmt_speech: unmark comments as kern=
el-doc)
Merging leds/for-next (97b31c1f8eb8 leds: trigger: Disable CPU trigger on P=
REEMPT_RT)
Merging ipmi/for-next (ed83855f1efc ipmi: ipmb: fix dependencies to elimina=
te build error)
Merging driver-core/driver-core-next (d7c5bf94475b fs/sysfs/dir.c: replace =
S_IRWXU|S_IRUGO|S_IXUGO with 0755 sysfs_create_dir_ns())
Merging usb/usb-next (e27bea459d5e usb: gadget: avoid unusual inline assemb=
ly)
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (c8345c0500de USB: serial: kl5kusb105: drop lin=
e-status helper)
Merging usb-chipidea-next/for-usb-next (78665f57c3fa usb: chipidea: udc: ma=
ke controller hardware endpoint primed)
Merging tty/tty-next (5f0ac3a1dae1 dt-bindings: serial: uartlite: drop $ref=
 for -bits property)
Merging char-misc/char-misc-next (d0221a780cbc nvmem: imx-ocotp: add suppor=
t for post processing)
Merging extcon/extcon-next (f83d7033d4ec dt-bindings: extcon: usbc-tusb320:=
 Add TUSB320L compatible string)
Merging phy-next/next (759f9ec3f376 phy: qcom-qmp: Add QCM2290 USB3 PHY sup=
port)
Merging soundwire/next (ccfdcb325f2a ABI: sysfs-bus-soundwire-slave: use wi=
ldcards on What definitions)
Merging thunderbolt/next (0a0624a26f9c thunderbolt: Fix -Wrestrict warning)
Merging vfio/next (48f06ca420c3 Merge branch 'v5.16/vfio/colin_xu_igd_opreg=
ion_2.0_v8' into v5.16/vfio/next)
Merging staging/staging-next (6ac113f741a7 staging: vt6655: fix camelcase i=
n byRate)
Merging iio/togreg (c4f0d57a964a drivers:iio:dac:ad5766.c: Add trigger buff=
er)
CONFLICT (content): Merge conflict in drivers/iio/adc/aspeed_adc.c
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (dfe14674bf7b Merge branch 'icc-rpm' into icc-next)
Merging dmaengine/next (6880fa6c5660 Linux 5.15-rc1)
Merging cgroup/for-next (0061270307f2 cgroup: cgroup-v1: do not exclude cgr=
p_dfl_root)
Merging scsi/for-next (887ebfc09f79 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (a4bcbf71914b scsi: Documentation: Fix typo in sy=
sfs-driver-ufs)
CONFLICT (content): Merge conflict in drivers/scsi/ufs/ufshcd.c
Merging vhost/linux-next (d3d74a13e565 virtio_net: clarify tailroom logic)
CONFLICT (content): Merge conflict in drivers/net/virtio_net.c
Merging rpmsg/for-next (a875e5bee1d0 Merge branches 'rproc-next' and 'rpmsg=
-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (f4a20dfac88c gpio: mc33880: Drop if with a=
n always false condition)
Merging gpio-intel/for-next (1649b8376694 gpio: pca953x: Improve bias setti=
ng)
Merging pinctrl/for-next (e1d9756efa42 Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/mfd=
/brcm,cru.yaml
Merging pinctrl-intel/for-next (176412f8674b pinctrl: intel: Kconfig: Add c=
onfiguration menu to Intel pin control)
Merging pinctrl-renesas/renesas-pinctrl (a84a409204fb pinctrl: renesas: che=
cker: Prefix common checker output)
Merging pinctrl-samsung/for-next (f9d8de699ac4 pinctrl: samsung: support Ex=
ynosAutov9 SoC pinctrl)
Merging pwm/for-next (3f2b16734914 pwm: mtk-disp: Implement atomic API .get=
_state())
Merging userns/for-next (3f66f86bfed3 per signal_struct coredumps)
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging kselftest/next (6880fa6c5660 Linux 5.15-rc1)
Merging livepatching/for-next (cd2d68f2d6b2 Merge branch 'for-5.15/cpu-hotp=
lug' into for-next)
Merging coresight/next (1efbcec2ef8c coresight: cti: Reduce scope for the v=
ariable =E2=80=9Ccs_fwnode=E2=80=9D in cti_plat_create_connection())
Merging rtc/rtc-next (7caadcfa8a7c rtc: m41t80: return NULL rather than a p=
lain 0 integer)
Merging nvdimm/libnvdimm-for-next (e765f13ed126 nvdimm/pmem: move dax_attri=
bute_group from dax to pmem)
Merging at24/at24/for-next (762925405482 dt-bindings: at24: add ON Semi CAT=
24C04 and CAT24C05)
Merging ntb/ntb-next (f96cb827ce49 ntb: ntb_pingpong: remove redundant init=
ialization of variables msg_data and spad_data)
Merging seccomp/for-next/seccomp (d9bbdbf324cd x86: deduplicate the spectre=
_v2_user documentation)
Merging kspp/for-next/kspp (7abe699d7951 Merge branch 'for-next/thread_info=
/cpu' into for-next/kspp)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (0f79ce970e79 gnss: drop stray semicolons)
Merging fsi/next (0cd413b5e756 fsi: occ: Add dynamic debug to dump command =
and response)
Merging slimbus/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging nvmem/for-next (413333fd6a88 nvmem: imx-ocotp: add support for post=
 processing)
Merging xarray/main (2c7e57a02708 idr test suite: Improve reporting from id=
r_find_test_1)
Merging hyperv/hyperv-next (9d68cd9120e4 hv_utils: Set the maximum packet s=
ize for VSS driver to the length of the receive buffer)
Merging auxdisplay/auxdisplay (24ebc044c72e auxdisplay: Replace symbolic pe=
rmissions with octal permissions)
Merging kgdb/kgdb/for-next (f8416aa29185 kernel: debug: Convert to SPDX ide=
ntifier)
Merging hmm/hmm (6880fa6c5660 Linux 5.15-rc1)
Merging fpga/for-next (57b44817a8d6 MAINTAINERS: Drop outdated FPGA Manager=
 website)
Merging kunit/test (6880fa6c5660 Linux 5.15-rc1)
Merging cfi/cfi/next (ff1176468d36 Linux 5.14-rc3)
Merging kunit-next/kunit (e7198adb84dc kunit: tool: yield output from run_k=
ernel in real time)
CONFLICT (content): Merge conflict in tools/testing/kunit/kunit.py
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mhi/mhi-next (813272ed5238 Merge 5.14-rc5 into char-misc-next)
Merging memblock/for-next (e888fa7bb882 memblock: Check memory add/cap orde=
ring)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (e71ba9452f0b Linux 5.11-rc2)
Merging rust/rust-next (5d3986cf8ed6 MAINTAINERS: Rust)
CONFLICT (content): Merge conflict in scripts/kconfig/confdata.c
CONFLICT (content): Merge conflict in include/linux/kallsyms.h
CONFLICT (content): Merge conflict in Makefile
Applying: fixup for rust integration with Makefile.clang creation
Applying: Kbuild: fix for "kbuild: split DEBUG_CFLAGS out to scripts/Makefi=
le.debug"
Merging cxl/next (ed97afb53365 cxl/pci: Disambiguate cxl_pci further from c=
xl_mem)
Merging folio/for-next (27b231798da1 mm/writeback: Add folio_write_one)
CONFLICT (modify/delete): fs/cachefiles/rdwr.c deleted in HEAD and modified=
 in folio/for-next. Version folio/for-next of fs/cachefiles/rdwr.c left in =
tree.
$ git rm -f fs/cachefiles/rdwr.c
Applying: fix up for "9p: Convert to using the netfs helper lib to do reads=
 and caching"
Merging bitmap/bitmap-master-5.15 (785cb064e2f8 vsprintf: rework bitmap_lis=
t_string)
Merging zstd/zstd-1.4.10 (464413496acb MAINTAINERS: Add maintainer entry fo=
r zstd)
Merging akpm-current/current (6384238cc908 ipc/ipc_sysctl.c: remove fallbac=
k for !CONFIG_PROC_SYSCTL)
CONFLICT (content): Merge conflict in kernel/sched/core.c
CONFLICT (content): Merge conflict in kernel/exit.c
CONFLICT (content): Merge conflict in include/linux/sched/mm.h
Applying: bottom_half.h needs kernel.h
Applying: drm/locking: fix for name conflict
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (376e7cf32f8f mm: unexport {,un}lock_page_memcg)

--Sig_/NTTfqzZ.Ke=F=hLvvmofKLw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFpUrUACgkQAVBC80lX
0GwH9AgAgFr0PYwbO9I22lNnyCTiKL3UiqOjxaHchilY3kkOWvoSOHgdqIpiypKD
i4IBgM04LFA6zPy3z8zgQYFH1t4S++3mRD7LhbgQIRvpzNbzYQzPM8HtN2/YLqqu
9xcirR2kO2bYiwy+M12I/vYnqQNGOvverVPq3SUkqoCJwts8runSK3pB/UFlOYH8
Nhu7A7EJZ1MFszj4VWPw2uF/CsYnq04iNO5aWdQuUazNJnwiZIG6p+qm8h9wCU3Y
ZkdGV4synFRs0ijXLkRRXTLk7f9kyvhu1qWdld+EpTn57cHC+Nw2uY7oeRtt4plU
X6c8wuH/I2qalV8+7vvnRTyacGECdg==
=lMQ1
-----END PGP SIGNATURE-----

--Sig_/NTTfqzZ.Ke=F=hLvvmofKLw--
