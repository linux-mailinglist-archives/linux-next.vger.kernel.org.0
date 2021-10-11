Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D4714287BF
	for <lists+linux-next@lfdr.de>; Mon, 11 Oct 2021 09:37:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234502AbhJKHjd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Oct 2021 03:39:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234192AbhJKHjc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Oct 2021 03:39:32 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AD3AC061570;
        Mon, 11 Oct 2021 00:37:33 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HSVxl514Jz4xR9;
        Mon, 11 Oct 2021 18:37:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633937851;
        bh=1Ssrcn95oqoFXGiXBOL4ldO5uYR3kCj/ZilcZt+/jOY=;
        h=Date:From:To:Cc:Subject:From;
        b=jYxDNsPhytBA9UUcpS/y5gcpRwZAAKffSIlIpNIdk7BsvHYO1qwlH7Mre2y0+Npmw
         uOQ3/CzOvgcFDrq0IjPYtwsRmFaHlx603wOdV0qGtTTTk97izNdrdrBNIZULmFHsdV
         pWP2jrQYpwRJwYjaSvs3RzzY5sJxhDsd4Slw4El6pkqDcsATZO8qXKsHxHDlKs1NqR
         y0Fa3Yj7LZTozbBo5r8AaU3WyBytNEPvEUI+Cix5Du5Wv63s944E4K31q+w5+ig/MA
         wiyN4s//2rxW9AAkl/pDzx5jnHpLxyBE6Y77V3G52n+5tvWAeihwp1bl73rekTGGKv
         8PdbC2h5IU3Lw==
Date:   Mon, 11 Oct 2021 18:37:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 11
Message-ID: <20211011183731.25d3633c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.VW6c=HhLm9Yl=YJuD2eODv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.VW6c=HhLm9Yl=YJuD2eODv
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20211008:

Tree removed: swiotlb (at the request of the old maintainer)

The pci tree gained a build failure so I used the version from
next-20211008.

The net-next tree gained a build failure for which I applied a patch.

The drm tree gained a conflict against Linus' tree.

The amdgpu tree lost its build failure.

The tip tree gained a conflict against Linus' tree.

The userns tree lost its build failure.

The akpm-current tree gained a conflict against the userns tree.

Non-merge commits (relative to Linus' tree): 6419
 6368 files changed, 366799 insertions(+), 149319 deletions(-)

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
Merging origin/master (efb52a7d9511 Merge tag 'powerpc-5.15-3' of git://git=
.kernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging fixes/fixes (3ca706c189db drm/ttm: fix type mismatch error on sparc=
64)
Merging kbuild-current/fixes (0664684e1ebd kbuild: Add -Werror=3Dignored-op=
timization-argument to CLANG_FLAGS)
Merging arc-current/for-curr (6880fa6c5660 Linux 5.15-rc1)
Merging arm-current/fixes (463dbba4d189 ARM: 9104/2: Fix Keystone 2 kernel =
mapping regression)
Merging arm64-fixes/for-next/fixes (0350419b14b9 arm64/hugetlb: fix CMA gig=
antic page order for non-4K PAGE_SIZE)
Merging arm-soc-fixes/arm/fixes (897c2e746cc7 Merge tag 'asahi-soc-fixes-5.=
15' of https://github.com/AsahiLinux/linux into arm/fixes)
Merging drivers-memory-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging m68k-current/for-linus (9fde03486402 m68k: Remove set_fs())
Merging powerpc-fixes/fixes (eb8257a12192 pseries/eeh: Fix the kdump kernel=
 crash during eeh_pseries_init)
Merging s390-fixes/fixes (a46044a92add s390/pci: fix zpci_zdev_put() on res=
erve)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (80f6e3080bfc fs-verity: fix signed inte=
ger overflow with i_size near S64_MAX)
Merging net/master (732b74d64704 virtio-net: fix for skb_over_panic inside =
big mode)
Merging bpf/master (8d6c414cd2fb net: prefer socket bound to interface when=
 not in VRF)
Merging ipsec/master (93ec1320b017 xfrm: fix rcu lock in xfrm_notify_userpo=
licy())
Merging netfilter/master (68a3765c659f netfilter: nf_tables: skip netdev ev=
ents generated on netns removal)
Merging ipvs/master (7cd8b1542a7b ptp_pch: Load module automatically if ID =
matches)
Merging wireless-drivers/master (603a1621caa0 mwifiex: avoid null-pointer-s=
ubtraction warning)
Merging mac80211/master (a2083eeb119f cfg80211: scan: fix RCU in cfg80211_a=
dd_nontrans_list())
Merging rdma-fixes/for-rc (1ab52ac1e9bc RDMA/mlx5: Set user priority for DC=
T)
Merging sound-current/for-linus (c0f1886de7e1 ALSA: hda: intel: Allow repea=
tedly probing on codec configuration errors)
Merging sound-asoc-fixes/for-linus (239e8fdee9dd Merge remote-tracking bran=
ch 'asoc/for-5.15' into asoc-linus)
Merging regmap-fixes/for-linus (9e1ff307c779 Linux 5.15-rc4)
Merging regulator-fixes/for-linus (393cc784d14d Merge remote-tracking branc=
h 'regulator/for-5.15' into regulator-linus)
Merging spi-fixes/for-linus (231dc15e1ddc Merge remote-tracking branch 'spi=
/for-5.15' into spi-linus)
Merging pci-current/for-linus (e4e737bb5c17 Linux 5.15-rc2)
Merging driver-core.current/driver-core-linus (81967efb5f39 drivers: bus: D=
elete CONFIG_SIMPLE_PM_BUS)
Merging tty.current/tty-linus (cb2282213e84 serial: 8250: allow disabling o=
f Freescale 16550 compile test)
Merging usb.current/usb-linus (7fd2bf83d59a Merge branch 'i2c/for-current-f=
ixed' of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
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
Merging char-misc.current/char-misc-linus (ff53c4f6a668 Merge tag 'fpga-mai=
ntainer-update' of git://git.kernel.org/pub/scm/linux/kernel/git/mdf/linux-=
fpga into char-misc-linus)
Merging soundwire-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging thunderbolt-fixes/fixes (9e1ff307c779 Linux 5.15-rc4)
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
Merging hwmon-fixes/hwmon (9e1ff307c779 Linux 5.15-rc4)
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
Merging drivers-x86-fixes/fixes (6f6aab1caf6c platform/x86: gigabyte-wmi: a=
dd support for B550I Aorus Pro AX)
Merging samsung-krzk-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging pinctrl-samsung-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging devicetree-fixes/dt/linus (b2d70c0dbf27 dt-bindings: drm/bridge: ti=
-sn65dsi86: Fix reg value)
Merging scsi-fixes/fixes (258aad75c621 scsi: iscsi: Fix iscsi_task use afte=
r free)
Merging drm-fixes/drm-fixes (bf79045e0ef5 Merge tag 'amd-drm-fixes-5.15-202=
1-10-06' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (b2d73debfdc1 drm/i915: Extend=
 the async flip VT-d w/a to skl/bxt)
Merging mmc-fixes/fixes (d371209acaa7 mmc: sdhci: Map more voltage level to=
 SDHCI_POWER_330)
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
Merging pinctrl-intel-fixes/fixes (9e1ff307c779 Linux 5.15-rc4)
Merging erofs-fixes/fixes (c40dd3ca2a45 erofs: clear compacted_2b if compac=
ted_4b_initial > totalidx)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (361b57df62de kunit: fix kernel-doc warning=
s due to mismatched arg names)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (024591f9a6e0 arm: ioremap: don't abuse pfn_va=
lid() to check if pfn is in RAM)
Merging cel-fixes/for-rc (7d2a07b76933 Linux 5.14)
Merging irqchip-fixes/irq/irqchip-fixes (b78f26926b17 irqchip/gic: Work aro=
und broken Renesas integration)
Merging renesas-fixes/fixes (432b52eea3dc ARM: shmobile: defconfig: Restore=
 graphical consoles)
Merging perf-current/perf/urgent (1da38549dd64 Merge tag 'nfsd-5.15-3' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/cel/linux)
Merging drm-misc-fixes/for-linux-next-fixes (f49b0d1ff6a0 drm/hyperv: Fix d=
ouble mouse pointers)
Merging kspp-gustavo/for-next/kspp (6409e7102a9b Merge branch 'for-next/ksp=
p-fixes' into for-next/kspp)
Merging kbuild/for-next (12aaf2147640 [for -next only] kconfig: generate in=
clude/generated/rustc_cfg)
Merging perf/perf/core (be8ecc57f180 perf srcline: Use long-running addr2li=
ne per DSO)
Merging compiler-attributes/compiler-attributes (b83a908498d6 compiler_attr=
ibutes.h: move __compiletime_{error|warning})
Merging dma-mapping/for-next (59583f747664 sparc32: page align size in arch=
_dma_alloc)
Merging asm-generic/master (7efbbe6e1414 qcom_scm: hide Kconfig symbol)
Merging arc/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging arm/for-next (4603664c0fe9 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (52331681d687 Merge branch 'for-next/fixes' int=
o for-next/core)
Merging arm-perf/for-next/perf (e656972b6986 drivers/perf: Improve build te=
st coverage)
Merging arm-soc/for-next (4b7dcedb8c28 soc: document merges)
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (83e38509109e Merge branch 'v5.16/dt64' into for-n=
ext)
Merging aspeed/for-next (69890d2c55f3 Merge branches 'defconfig-for-v5.16' =
and 'dt-for-v5.16' into for-next)
Merging at91/at91-next (b4af371d908f Merge branch 'at91-soc' into at91-next)
Merging drivers-memory/for-next (8f086fe5f3c9 Merge branch 'mem-ctrl-next' =
into for-next)
Merging imx-mxs/for-next (0dfc2dd723c8 Merge branch 'imx/maintainers' into =
for-next)
Merging keystone/next (cb293d3b430e Merge branch 'for_5.15/drivers-soc' int=
o next)
Merging mediatek/for-next (8c62103627a8 Merge branch 'v5.15-next/soc' into =
for-next)
Merging mvebu/for-next (930af8dda750 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (e2ea30ed9c33 Merge branch 'omap-for-v5.16/soc' into =
for-next)
Merging qcom/for-next (37f6317b1882 Merge branches 'arm64-for-5.16', 'drive=
rs-for-5.16' and 'dts-for-5.16' into for-next)
Merging raspberrypi/for-next (a036b0a5d7d6 ARM: dts: bcm2711-rpi-4-b: Fix u=
sb's unit address)
Merging renesas/next (4dad7e7e2891 Merge branch 'renesas-arm-dt-for-v5.16' =
into renesas-next)
Merging reset/reset/next (3440b8fa067d reset: uniphier: Add NX1 reset suppo=
rt)
Merging rockchip/for-next (9a6218fd50c1 Merge branch 'v5.16-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (1b112f33d0cf Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (b92b4019a797 Merge branch 'for-next/ffa' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-lin=
ux-next)
Merging stm32/stm32-next (350081007916 ARM: dts: stm32: set the DCMI pins o=
n stm32mp157c-odyssey)
Merging sunxi/sunxi/for-next (bb289f4c0b2b Merge branches 'sunxi/clk-for-5.=
16', 'sunxi/core-for-5.16', 'sunxi/drivers-for-5.16', 'sunxi/dt-for-5.16' a=
nd 'sunxi/fixes-for-5.15' into sunxi/for-next)
Merging tegra/for-next (c45dd143ff1a Merge branch for-5.16/arm64/defconfig =
into for-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (f46d16cf5b43 arm64: dts: ti: k3-j721e-sk: Add=
 DDR carveout memory nodes)
Merging xilinx/for-next (7a4c31ee877a arm64: zynqmp: Add support for Xilinx=
 Kria SOM board)
Merging clk/clk-next (1a10ca10a675 Merge branch 'clk-rockchip' into clk-nex=
t)
Merging clk-imx/for-next (e8271eff5d8c clk: imx: Make CLK_IMX8ULP select MX=
C_CLK)
Merging clk-renesas/renesas-clk (373bd6f48756 clk: renesas: r9a07g044: Add =
SDHI clock and reset entries)
Merging clk-samsung/for-next (2ae5c2c3f8d5 dt-bindings: clock: Add bindings=
 definitions for Exynos850 CMU)
Merging csky/linux-next (40e080ed8218 csky: Make HAVE_TCM depend on !COMPIL=
E_TEST)
Merging h8300/h8300-next (1ec10274d436 h8300: don't implement set_fs)
Merging m68k/for-next (6621cb4a2d0a m68k: muldi3: Use semicolon instead of =
comma)
Merging m68knommu/for-next (16352355b8f4 m68knommu: Remove MCPU32 config sy=
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
Merging powerpc/next (f9473a65719e powerpc/pseries/cpuhp: remove obsolete c=
omment from pseries_cpu_die)
Merging soc-fsl/next (242b0b398ccd soc: fsl: enable acpi support in RCPM dr=
iver)
Merging risc-v/for-next (9406369ae627 riscv: dts: microchip: use vendor com=
patible for Cadence SD4HC)
Merging s390/for-next (7e8601b12f46 Merge branch 'features' into for-next)
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
Merging btrfs/for-next (9c759df7e330 Merge branch 'for-next-next-v5.15-2021=
1008' into for-next-20211008)
Merging ceph/master (b96728705f91 ceph: convert to noop_direct_IO)
Merging cifs/for-next (7fd2bf83d59a Merge branch 'i2c/for-current-fixed' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging configfs/for-next (c42dd069be8d configfs: fix a race in configfs_lo=
okup())
Merging ecryptfs/next (682a8e2b41ef Merge tag 'ecryptfs-5.13-rc1-updates' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs)
Merging erofs/dev (71dbc5464c5c erofs: add multiple device support)
Merging exfat/dev (50be9417e23a Merge tag 'io_uring-5.14-2021-07-09' of git=
://git.kernel.dk/linux-block)
Merging ext3/for_next (372d1f3e1bfe ext2: fix sleeping in atomic bugs on er=
ror)
Merging ext4/dev (0288e6293e25 ext4: convert from atomic_t to refcount_t on=
 ext4_io_end->count)
Merging f2fs/dev (6663b138ded1 f2fs: set SBI_NEED_FSCK flag when inconsiste=
nt node block found)
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (7a41554fdfb0 fuse: move fuse_invalidate_attr() into =
fuse_update_ctime())
Merging gfs2/for-next (11603f0011d0 gfs2: Allow append and immutable bits t=
o coexist)
Merging jfs/jfs-next (c48a14dca2cb JFS: fix memleak in jfs_mount)
Merging ksmbd/ksmbd-for-next (c6e7d8295494 ksmbd: improve credits managemen=
t)
Merging nfs/linux-next (9e1ff307c779 Linux 5.15-rc4)
Merging nfs-anna/linux-next (8cfb9015280d NFS: Always provide aligned buffe=
rs to the RPC read layers)
Merging nfsd/nfsd-next (35940a58f9f1 SUNRPC: Capture value of xdr_buf::page=
_base)
Merging cel/for-next (c20106944eb6 NFSD: Keep existing listeners on portlis=
t error)
Merging ntfs3/master (95dd8b2c1ed0 fs/ntfs3: Remove unnecessary functions)
CONFLICT (content): Merge conflict in fs/ntfs3/xattr.c
Merging orangefs/for-next (0fdec1b3c9fb orangefs: fix orangefs df output.)
Merging overlayfs/overlayfs-next (1dc1eed46f9f ovl: fix IOCB_DIRECT if unde=
rlying fs doesn't support direct IO)
Merging ubifs/next (a801fcfeef96 ubifs: Set/Clear I_LINKABLE under i_lock f=
or whiteout inode)
Merging v9fs/9p-next (9c4d94dc9a64 net/9p: increase default msize to 128k)
Merging xfs/for-next (f38a032b165d xfs: fix I_DONTCACHE)
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
Merging pci/next (d9edad8ea62d Merge branch 'remotes/lorenzo/pci/xgene')
$ git reset --hard HEAD^
Merging next-20211008 version of pci
Merging pstore/for-next/pstore (c5d4fb2539ca pstore/blk: Use "%lu" to forma=
t unsigned long)
Merging hid/for-next (93d455d582b0 Merge branch 'for-5.15/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (90d8f9584220 Merge branch 'i2c/for-current-fixed'=
 into i2c/for-next)
Merging i3c/i3c/next (a3587e2c0578 i3c: fix incorrect address slot lookup o=
n 64-bit)
Merging dmi/dmi-for-next (f97a2103f1a7 firmware: dmi: Move product_sku info=
 to the end of the modalias)
Merging hwmon-staging/hwmon-next (39b483aa3899 hwmon: (dell-smm) Remove unn=
ecessary includes)
Merging jc_docs/docs-next (7275423c177e ext4: docs: Take out unneeded escap=
ing)
Merging v4l-dvb/master (64cdf7e5a3aa media: mtk-vcodec: MT8173 h264/vp8 enc=
oder min/max bitrate settings)
Merging v4l-dvb-next/master (fd2eda71a47b media: remove myself from dvb med=
ia maintainers)
Merging pm/linux-next (574167bf7ed8 Merge branches 'thermal-int340x' and 't=
hermal-powerclamp' into linux-next)
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
Merging rdma/for-next (2a152512a155 RDMA/efa: CQ notifications)
Merging net-next/master (0182d0788cd6 octeontx2-pf: Simplify the receive bu=
ffer size calculation)
Merging bpf-next/for-next (5319255b8df9 selftests/bpf: Skip verifier tests =
that fail to load with ENOTSUPP)
Merging ipsec-next/master (83688aec17bf net/ipv4/xfrm4_tunnel.c: remove sup=
erfluous header files from xfrm4_tunnel.c)
Merging mlx5-next/mlx5-next (b8dfed636fc6 net/mlx5: Add priorities for coun=
ters in RDMA namespaces)
Merging netfilter-next/master (7b1394892de8 netfilter: nft_dynset: relax su=
perfluous check on set updates)
Merging ipvs-next/master (acde891c243c rxrpc: Fix _usecs_to_jiffies() by us=
ing usecs_to_jiffies())
Merging wireless-drivers-next/master (7932d53162dc dt-bindings: net: dsa: d=
ocument felix family in dsa-tag-protocol)
Merging bluetooth/master (b15bfa4df635 Bluetooth: mgmt: Fix Experimental Fe=
ature Changed event)
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
Merging drm/drm-next (407baae3e6f3 Merge tag 'du-next-20211007' of git://li=
nuxtv.org/pinchartl/media into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/include/d=
al_asic_id.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dcn31/=
dcn31_dio_link_encoder.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dcn31/=
dcn31_dio_link_encoder.c
Merging drm-misc/for-linux-next (914b6f290beb drm/panel: Add support for Sh=
arp LS060T1SX01 panel)
Merging amdgpu/drm-next (40348baedfbc drm/amd/display: fix duplicated inclu=
sion)
Merging drm-intel/for-linux-next (a94a6d76c984 drm/i915/mst: abstract intel=
_dp_mst_source_support())
Merging drm-tegra/drm/tegra/for-next (5dccbc9de8f0 drm/tegra: dc: rgb: Allo=
w changing PLLD rate on Tegra30+)
Merging drm-msm/msm-next (c6921fbc88e1 drm/msm/dsi: fix off by one in dsi_b=
us_clk_enable error handling)
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/msm_gem_submit.c
Merging imx-drm/imx-drm/next (20fbfc81e390 drm/imx: imx-tve: Make use of th=
e helper function devm_platform_ioremap_resource())
Merging etnaviv/etnaviv/next (81fd23e2b3cc drm/etnaviv: Implement mmap as G=
EM object function)
Merging regmap/for-next (9e1ff307c779 Linux 5.15-rc4)
Merging sound/for-next (6d2778816036 ALSA: usb-audio: Add support for the P=
ioneer DJM 750MK2 Mixer/Soundcard)
Merging sound-asoc/for-next (b013c39823b0 Merge remote-tracking branch 'aso=
c/for-5.16' into asoc-next)
Merging modules/modules-next (ced75a2f5da7 MAINTAINERS: Add Luis Chamberlai=
n as modules maintainer)
Merging input/next (a41392e0877a MAINTAINERS: rectify entry for CHIPONE ICN=
8318 I2C TOUCHSCREEN DRIVER)
Merging block/for-next (2dda4c161c12 Merge branch 'for-5.16/block-io_uring'=
 into for-next)
Merging device-mapper/for-next (012a67c67932 dm: fix mempool NULL pointer r=
ace when completing IO)
Merging libata/for-next (0e96dc47b95a ahci: remove duplicated PCI device ID=
s)
Merging pcmcia/pcmcia-next (e39cdacf2f66 pcmcia: i82092: fix a null pointer=
 dereference bug)
Merging mmc/next (2318a18c3249 Merge branch 'fixes' into next)
Merging mfd/for-mfd-next (f38d3e404326 dt-bindings: mfd: Convert X-Powers A=
XP binding to a schema)
Merging backlight/for-backlight-next (563edf85ce18 backlight: Propagate err=
ors from get_brightness())
Merging battery/for-next (a3d5c47c328a dt-bindings: power: Bindings for Sam=
sung batteries)
Merging regulator/for-next (fabe706a7586 Merge remote-tracking branch 'regu=
lator/for-5.16' into regulator-next)
Merging security/next-testing (047843bdb316 Merge branch 'landlock_lsm_v34'=
 into next-testing)
Merging apparmor/apparmor-next (d108370c644b apparmor: fix error check)
Merging integrity/next-integrity (4079d72411f0 ima: fix deadlock when trave=
rsing "ima_default_rules".)
Merging keys/keys-next (e377c31f788f integrity: Load mokx variables into th=
e blacklist keyring)
CONFLICT (content): Merge conflict in certs/system_keyring.c
Merging safesetid/safesetid-next (1b8b71922919 LSM: SafeSetID: Mark safeset=
id_initialized as __initdata)
Merging selinux/next (f5d0e5e9d72d selinux: remove the SELinux lockdown imp=
lementation)
CONFLICT (content): Merge conflict in fs/io_uring.c
CONFLICT (content): Merge conflict in fs/io-wq.c
Applying: fixup for "io_uring: init opcode in io_init_req()"
Merging smack/next (387ef964460f Smack:- Use overlay inode label in smack_i=
node_copy_up())
Merging tomoyo/master (7d2a07b76933 Linux 5.14)
Merging tpmdd/next (f985911b7bc7 crypto: public_key: fix overflow during im=
plicit conversion)
Merging watchdog/master (5816b3e6577e Linux 5.15-rc3)
Merging iommu/next (0b29edc21567 Merge branches 'arm/mediatek', 'arm/renesa=
s', 'iommu/fixes', 'x86/amd' and 'core' into next)
Merging audit/next (571e5c0efcb2 audit: add OPENAT2 record to list "how" in=
fo)
CONFLICT (content): Merge conflict in include/uapi/linux/audit.h
Merging devicetree/for-next (387ee9fe4587 dt-binding: usb: xilinx: Add cloc=
king node)
Merging mailbox/mailbox-for-next (85dfdbfc13ea mailbox: cmdq: add multi-gce=
 clocks support for mt8195)
Merging spi/for-next (131cbfbd9262 Merge remote-tracking branch 'spi/for-5.=
16' into spi-next)
Merging tip/auto-latest (a6d06ef25c4e Merge branch 'irq/core')
CONFLICT (content): Merge conflict in arch/x86/kernel/fpu/signal.c
Merging clockevents/timers/drivers/next (f196ae282070 dt-bindings: timer: A=
dd ABIs for new Ingenic SoCs)
Merging edac/edac-for-next (d029439d8ab1 Merge branch 'edac-misc' into edac=
-for-next)
Merging irqchip/irq/irqchip-next (6e3b473ee064 Merge branch irq/qcom-pdc-no=
wake-cleanup into irq/irqchip-next)
Merging ftrace/for-next (8d6e90983ade tracing: Create a sparse bitmask for =
pid filtering)
CONFLICT (content): Merge conflict in kernel/kprobes.c
Merging rcu/rcu/next (d5e7be308018 rcu: Make idle entry report expedited qu=
iescent states)
Merging kvm/next (542a2640a2f4 Merge tag 'kvm-riscv-5.16-1' of git://github=
.com/kvm-riscv/linux into HEAD)
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
Merging kvm-arm/next (419025b3b419 Merge branch kvm-arm64/misc-5.15 into kv=
marm-master/next)
Merging kvm-ppc/kvm-ppc-next (72476aaa4691 KVM: PPC: Book3S HV: Fix host ra=
dix SLB optimisation with hash guests)
Merging kvms390/next (3094c9738e4b KVM: s390: pv: avoid stalls for kvm_s390=
_pv_init_vm)
Merging xen-tip/linux-next (319933a80fd4 xen/balloon: fix cancelled balloon=
 action)
Merging percpu/for-next (a81a52b325ec Merge branch 'for-5.14-fixes' into fo=
r-next)
Merging workqueues/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging drivers-x86/for-next (c99ca78d67a6 platform/x86: thinkpad_acpi: Swi=
tch to common use of attributes)
Merging chrome-platform/for-next (eb057514ccca platform/chrome: cros_ec: Fi=
x spelling mistake "responsed" -> "response")
Merging hsi/for-next (4ef69e17eb56 HSI: cmt_speech: unmark comments as kern=
el-doc)
Merging leds/for-next (2a5a8fa8b231 leds: trigger: use RCU to protect the l=
ed_cdevs list)
Merging ipmi/for-next (cd921b9f0c8d ipmi: bt: Add ast2600 compatible string)
Merging driver-core/driver-core-next (d7c5bf94475b fs/sysfs/dir.c: replace =
S_IRWXU|S_IRUGO|S_IXUGO with 0755 sysfs_create_dir_ns())
Merging usb/usb-next (2c52ad743fee Revert "usb: misc: ehset: Workaround for=
 "special" hubs")
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (c8345c0500de USB: serial: kl5kusb105: drop lin=
e-status helper)
Merging usb-chipidea-next/for-usb-next (78665f57c3fa usb: chipidea: udc: ma=
ke controller hardware endpoint primed)
Merging tty/tty-next (d02b006b29de Revert "serial: 8250: Fix reporting real=
 baudrate value in c_ospeed field")
Merging char-misc/char-misc-next (424f1ac2d832 virt: acrn: Introduce interf=
aces for virtual device creating/destroying)
Merging extcon/extcon-next (f83d7033d4ec dt-bindings: extcon: usbc-tusb320:=
 Add TUSB320L compatible string)
Merging phy-next/next (759f9ec3f376 phy: qcom-qmp: Add QCM2290 USB3 PHY sup=
port)
Merging soundwire/next (ccfdcb325f2a ABI: sysfs-bus-soundwire-slave: use wi=
ldcards on What definitions)
Merging thunderbolt/next (0a0624a26f9c thunderbolt: Fix -Wrestrict warning)
Merging vfio/next (d9a0cd510c33 Merge branch 'v5.16/vfio/hch-cleanup-vfio-i=
ommu_group-creation-v6' into v5.16/vfio/next)
Merging staging/staging-next (e538e8649892 MIPS: asm: pci: define arch-spec=
ific 'pci_remap_iospace()' dependent on 'CONFIG_PCI_DRIVERS_GENERIC')
Merging iio/togreg (4c2d124b3c9d iio: imu: adis16400: Fix buffer alignment =
requirements.)
CONFLICT (content): Merge conflict in drivers/iio/adc/aspeed_adc.c
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (dfe14674bf7b Merge branch 'icc-rpm' into icc-next)
Merging dmaengine/next (6880fa6c5660 Linux 5.15-rc1)
Merging cgroup/for-next (0061270307f2 cgroup: cgroup-v1: do not exclude cgr=
p_dfl_root)
Merging scsi/for-next (7e849b8f98a5 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (605ae389ea02 scsi: smartpqi: Update version to 2=
.1.12-055)
CONFLICT (content): Merge conflict in drivers/scsi/ufs/ufshcd.c
Merging vhost/linux-next (dd7dc7e82b14 vhost_vdpa: unset vq irq before free=
ing irq)
Merging rpmsg/for-next (0b52f666126e Merge branches 'rpmsg-next' and 'rproc=
-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (7687a5b0ee93 gpio: modepin: Add driver sup=
port for modepin GPIO controller)
Merging gpio-intel/for-next (1649b8376694 gpio: pca953x: Improve bias setti=
ng)
Merging pinctrl/for-next (5077a3240bb3 Merge tag 'renesas-pinctrl-for-v5.16=
-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drive=
rs into devel)
Merging pinctrl-intel/for-next (176412f8674b pinctrl: intel: Kconfig: Add c=
onfiguration menu to Intel pin control)
Merging pinctrl-renesas/renesas-pinctrl (106502e232ed pinctrl: renesas: r8a=
779[56]x: add MediaLB pins)
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
Merging fsi/next (9ab1428dfe2c fsi/sbefifo: Fix reset timeout)
Merging slimbus/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging nvmem/for-next (d162d84b27c8 nvmem: Fix shift-out-of-bound (UBSAN) =
with byte size cells)
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
Merging zstd/zstd-1.4.10 (a0ccd980d504 MAINTAINERS: Add maintainer entry fo=
r zstd)
Applying: ethernet: sun: fix for "remove direct netdev->dev_addr writes"
Merging akpm-current/current (9dfaa953e269 ipc/ipc_sysctl.c: remove fallbac=
k for !CONFIG_PROC_SYSCTL)
CONFLICT (content): Merge conflict in kernel/sched/core.c
CONFLICT (content): Merge conflict in kernel/exit.c
CONFLICT (content): Merge conflict in include/linux/sched/mm.h
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (17e9f73b8452 mm: unexport {,un}lock_page_memcg)

--Sig_/.VW6c=HhLm9Yl=YJuD2eODv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFj6bsACgkQAVBC80lX
0GyVrAf+NgCYv+CS27XO/cMTTDSJtaqCJXuz2o6qau9JyrWLycg6F4vMM5kvPAVu
CS8YmaK7WKXaE2hTl0RjEB1qFlr2Sb5bGqzhbe+jawIuK7m4lvSIJ3in4p6gJT5s
rovcftI0mNgpdrLxkxiXT8hl2dPxYfNRBz0tOzOkQ9N9yHMigR3pVD/1GyTJnuDo
WZVn/8rCRd6EznRw/ybzw6Zsgk0bxLNqqCH5gxdiiKJoSeMNarxU4afPPB3rovkA
pFdttqWPa4tOot38VVSAcAzADjPbPYV833g0OGtUU4H5W56EWtf0QtRaD5YG9mv3
D7BcnEzP3HTOk9ncQ1UXBDuf1eLlWg==
=xa1t
-----END PGP SIGNATURE-----

--Sig_/.VW6c=HhLm9Yl=YJuD2eODv--
