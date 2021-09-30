Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6162D41D450
	for <lists+linux-next@lfdr.de>; Thu, 30 Sep 2021 09:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348529AbhI3HR5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Sep 2021 03:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348519AbhI3HR4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Sep 2021 03:17:56 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7429C06161C;
        Thu, 30 Sep 2021 00:16:13 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HKl0C3HHKz4xbR;
        Thu, 30 Sep 2021 17:16:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632986171;
        bh=TFYqrjFv5GHSNbRcqutSVn1mPP0ICxla9NFPoGBk+sY=;
        h=Date:From:To:Cc:Subject:From;
        b=HwJHFMjILfMlbiNj4+sdXsJXAik6UuhH4RXt4KD1sWIiHcQEfb1fQFCNBvO65mu/A
         CLTfH6eBYZlw9NilMfWkPDvvzPCqsPZDLcK3NKu1pA06LvXcvjNPIK4fgGdsnrI+lP
         91yqFtj6uFfxv7fMUCOhZSJJm+2w6EpwEwduBPuJ26UKnKLBf/tcduNEhFYmtko+TS
         fFOwcVfmrt4F3Er2FDiA+zLyia8Q72+GUqiRFDksM5mdj9NoUR1QGI38H+4V6KF8/A
         UYwH5i4NNnXZQajiaF9PFiugfaNHAbIPI0fHEwNW/AFefTlSM71fP3yQn3sdo0yCid
         DNDX01R1dRoAQ==
Date:   Thu, 30 Sep 2021 17:16:09 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 30
Message-ID: <20210930171609.3e5d1cbd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MeI+_CZ/bhQ7zr+35Zt30eX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/MeI+_CZ/bhQ7zr+35Zt30eX
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210929:

renamed trees: cifsd to ksmbd

The kspp-gustavo tree gained a build failure for which I reverted a commit.

The rdma tree gained a conflict against the rdma-fixes tree.

The net-next tree gained a conflict against the net tree.

The crypto tree still had its build failure for which I applied a
supplied patch.

The amdgpu tree lost its build failure.

The sound-asoc tree still had its build failure for which I reverted a comm=
it.

Non-merge commits (relative to Linus' tree): 4474
 4357 files changed, 230172 insertions(+), 91301 deletions(-)

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

I am currently merging 337 trees (counting Linus' and 91 trees of bug
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
Merging origin/master (02d5e016800d Merge tag 'sound-5.15-rc4' of git://git=
.kernel.org/pub/scm/linux/kernel/git/tiwai/sound)
Merging fixes/fixes (3ca706c189db drm/ttm: fix type mismatch error on sparc=
64)
Merging kbuild-current/fixes (0664684e1ebd kbuild: Add -Werror=3Dignored-op=
timization-argument to CLANG_FLAGS)
Merging arc-current/for-curr (6880fa6c5660 Linux 5.15-rc1)
Merging arm-current/fixes (463dbba4d189 ARM: 9104/2: Fix Keystone 2 kernel =
mapping regression)
Merging arm64-fixes/for-next/fixes (22b70e6f2da0 arm64: Restore forced disa=
bling of KPTI on ThunderX)
Merging arm-soc-fixes/arm/fixes (3f1c260ffddb MAINTAINERS: Add myself as MS=
tar/Sigmastar Armv7 SoC maintainers)
Merging drivers-memory-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging m68k-current/for-linus (9fde03486402 m68k: Remove set_fs())
Merging powerpc-fixes/fixes (c006a06508db powerpc/xics: Set the IRQ chip da=
ta for the ICS native backend)
Merging s390-fixes/fixes (172da89ed0ea s390/cio: avoid excessive path-verif=
ication requests)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (80f6e3080bfc fs-verity: fix signed inte=
ger overflow with i_size near S64_MAX)
Merging net/master (d88fd1b546ff net: phy: bcm7xxx: Fixed indirect MMD oper=
ations)
Merging bpf/master (79e3445b38e0 bpf, arm: Fix register clobbering in div/m=
od implementation)
Merging ipsec/master (93ec1320b017 xfrm: fix rcu lock in xfrm_notify_userpo=
licy())
Merging netfilter/master (3d3b30175a51 netfilter: nf_tables: honor NLM_F_CR=
EATE and NLM_F_EXCL in event notification)
Merging ipvs/master (7fe7f3182a0d Merge git://git.kernel.org/pub/scm/linux/=
kernel/git/pablo/nf)
Merging wireless-drivers/master (603a1621caa0 mwifiex: avoid null-pointer-s=
ubtraction warning)
Merging mac80211/master (f936bb42aeb9 net: bridge: mcast: Associate the seq=
count with its protecting lock.)
Merging rdma-fixes/for-rc (e671f0ecfece RDMA/hns: Add the check of the CQE =
size of the user space)
Merging sound-current/for-linus (f2ff7147c683 ALSA: pcsp: Make hrtimer forw=
arding more robust)
Merging sound-asoc-fixes/for-linus (2a2f026ab6cc Merge remote-tracking bran=
ch 'asoc/for-5.15' into asoc-linus)
Merging regmap-fixes/for-linus (6880fa6c5660 Linux 5.15-rc1)
Merging regulator-fixes/for-linus (5816b3e6577e Linux 5.15-rc3)
Merging spi-fixes/for-linus (59c4e190b10c Merge tag 'v5.15-rc3' into spi-5.=
15)
Merging pci-current/for-linus (e4e737bb5c17 Linux 5.15-rc2)
Merging driver-core.current/driver-core-linus (df38d852c681 kernfs: also ca=
ll kernfs_set_rev() for positive dentry)
Merging tty.current/tty-linus (5816b3e6577e Linux 5.15-rc3)
Merging usb.current/usb-linus (5816b3e6577e Linux 5.15-rc3)
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (5816b3e6577e Linux 5.15-rc3)
Merging usb-chipidea-fixes/for-usb-fixes (d2b4701cd12d usb: chipidea: ci_hd=
rc_imx: Also search for 'phys' phandle)
Merging phy/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging staging.current/staging-linus (5816b3e6577e Linux 5.15-rc3)
Merging iio-fixes/fixes-togreg (9da1b86865ab iio: adis16475: fix deadlock o=
n frequency set)
Merging char-misc.current/char-misc-linus (bb8a4fcb2136 ipack: ipoctal: fix=
 module reference leak)
Merging soundwire-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging thunderbolt-fixes/fixes (5816b3e6577e Linux 5.15-rc3)
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
Merging v4l-dvb-fixes/fixes (f0c15b360fb6 media: ir_toy: prevent device fro=
m hanging during transmit)
Merging reset-fixes/reset/fixes (ed104ca4bd9c reset: reset-zynqmp: Fixed th=
e argument data type)
Merging mips-fixes/mips-fixes (6880fa6c5660 Linux 5.15-rc1)
Merging at91-fixes/at91-fixes (4348cc10da63 ARM: dts: at91: sama5d2_som1_ek=
: disable ISC node by default)
Merging omap-fixes/fixes (e879f855e590 bus: ti-sysc: Add break in switch st=
atement in sysc_init_soc())
Merging kvm-fixes/master (5c49d1850ddd KVM: VMX: Fix a TSX_CTRL_CPUID_CLEAR=
 field mask issue)
Merging kvms390-fixes/master (25b5476a294c KVM: s390: Function documentatio=
n fixes)
Merging hwmon-fixes/hwmon (6f7d70467121 hwmon: (ltc2947) Properly handle er=
rors when looking for the external clock)
Merging nvdimm-fixes/libnvdimm-fixes (d55174cccac2 nvdimm/pmem: fix creatin=
g the dax group)
Merging cxl-fixes/fixes (fae8817ae804 cxl/mem: Fix memory device capacity p=
robing)
Merging btrfs-fixes/next-fixes (45940091a3c1 Merge branch 'misc-5.15' into =
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
Merging devicetree-fixes/dt/linus (55c21d57eafb dt-bindings: arm: Fix Torad=
ex compatible typo)
Merging scsi-fixes/fixes (79a7482249a7 scsi: csiostor: Add module softdep o=
n cxgb4)
Merging drm-fixes/drm-fixes (05812b971c6d Merge tag 'drm/tegra/for-5.15-rc3=
' of ssh://git.freedesktop.org/git/tegra/linux into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (4b8bcaf8a6d6 drm/i915: Remove=
 warning from the rps worker)
Merging mmc-fixes/fixes (3b9b0887fff8 mmc: sdhci-of-at91: replace while loo=
p with read_poll_timeout)
Merging rtc-fixes/rtc-fixes (bd33335aa93d rtc: cmos: Disable irq around dir=
ect invocation of cmos_interrupt())
Merging gnss-fixes/gnss-linus (e73f0f0ee754 Linux 5.14-rc1)
Merging hyperv-fixes/hyperv-fixes (41608b64b10b PCI: hv: Fix sleep while in=
 non-sleep context when removing child devices from the bus)
Merging soc-fsl-fixes/fix (c1e64c0aec8c soc: fsl: qe: fix static checker wa=
rning)
Merging risc-v-fixes/fixes (7d2a07b76933 Linux 5.14)
Merging pidfd-fixes/fixes (03ba0fe4d09f file: simplify logic in __close_ran=
ge())
Merging fpga-fixes/fixes (2a2a79577dda fpga: ice40-spi: Add SPI device ID t=
able)
Merging spdx/spdx-linus (6880fa6c5660 Linux 5.15-rc1)
Merging gpio-brgl-fixes/gpio/for-current (040d985e27dc MAINTAINERS: Update =
Mun Yew Tham as Altera Pio Driver maintainer)
Merging gpio-intel-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging pinctrl-intel-fixes/fixes (5816b3e6577e Linux 5.15-rc3)
Merging erofs-fixes/fixes (c40dd3ca2a45 erofs: clear compacted_2b if compac=
ted_4b_initial > totalidx)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (6880fa6c5660 Linux 5.15-rc1)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (024591f9a6e0 arm: ioremap: don't abuse pfn_va=
lid() to check if pfn is in RAM)
Merging cel-fixes/for-rc (7d2a07b76933 Linux 5.14)
Merging irqchip-fixes/irq/irqchip-fixes (b78f26926b17 irqchip/gic: Work aro=
und broken Renesas integration)
Merging renesas-fixes/fixes (432b52eea3dc ARM: shmobile: defconfig: Restore=
 graphical consoles)
Merging perf-current/perf/urgent (0513e464f900 Merge tag 'perf-tools-fixes-=
for-v5.15-2021-09-27' of git://git.kernel.org/pub/scm/linux/kernel/git/acme=
/linux)
Merging drm-misc-fixes/for-linux-next-fixes (fd09961dbb9c fbdev: simplefb: =
fix Kconfig dependencies)
CONFLICT (content): Merge conflict in drivers/gpu/drm/vc4/vc4_hdmi.c
Merging kspp-gustavo/for-next/kspp (087fb9be4e53 Merge branch 'for-next/cas=
t-function' into for-next/kspp)
Applying: Revert "Makefile: Enable -Wcast-function-type"
Merging kbuild/for-next (6988f70cf105 kconfig: rename a variable in the lex=
er to a clearer name)
Merging perf/perf/core (8228e9361e2a perf parse-events: Avoid enum forward =
declaration.)
Merging compiler-attributes/compiler-attributes (b83a908498d6 compiler_attr=
ibutes.h: move __compiletime_{error|warning})
Merging dma-mapping/for-next (59583f747664 sparc32: page align size in arch=
_dma_alloc)
Merging asm-generic/master (7962c2eddbfe arch: remove unused function sysca=
ll_set_arguments())
Merging arc/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging arm/for-next (4603664c0fe9 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (92f80c5addef Merge branches 'for-next/kselftes=
t', 'for-next/misc', 'for-next/mm' and 'for-next/mte' into for-next/core)
Merging arm-perf/for-next/perf (fd264b310579 arm64/perf: Replace '0xf' inst=
ances with ID_AA64DFR0_PMUVER_IMP_DEF)
Merging arm-soc/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (83e38509109e Merge branch 'v5.16/dt64' into for-n=
ext)
Merging aspeed/for-next (e986277a56da Merge branches 'defconfig-for-v5.16' =
and 'dt-for-v5.16' into for-next)
Merging at91/at91-next (8aff56d060f4 Merge branch 'at91-dt' into at91-next)
Merging drivers-memory/for-next (a144fbf35b84 Merge branch 'mem-ctrl-next' =
into for-next)
Merging imx-mxs/for-next (0dd3273df8c2 Merge branch 'imx/dt64' into for-nex=
t)
Merging keystone/next (cb293d3b430e Merge branch 'for_5.15/drivers-soc' int=
o next)
Merging mediatek/for-next (69862ae4e378 Merge branch 'v5.14-next/soc' into =
for-next)
Merging mvebu/for-next (930af8dda750 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (7911f95d1713 Merge branch 'fixes' into for-next)
Merging qcom/for-next (37f6317b1882 Merge branches 'arm64-for-5.16', 'drive=
rs-for-5.16' and 'dts-for-5.16' into for-next)
Merging raspberrypi/for-next (9f5289ec6f1c ARM: dts: bcm2711-rpi-4-b: Fix u=
sb's unit address)
Merging renesas/next (a462ac13da67 Merge branches 'renesas-arm-defconfig-fo=
r-v5.16' and 'renesas-arm-dt-for-v5.16' into renesas-next)
Merging reset/reset/next (09f3824342f6 reset: simple: remove ZTE details in=
 Kconfig help)
Merging rockchip/for-next (9a6218fd50c1 Merge branch 'v5.16-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (5a48ff48b76f Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (cb5da0da3602 Merge branch 'for-next/scmi' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging stm32/stm32-next (350081007916 ARM: dts: stm32: set the DCMI pins o=
n stm32mp157c-odyssey)
Merging sunxi/sunxi/for-next (bb289f4c0b2b Merge branches 'sunxi/clk-for-5.=
16', 'sunxi/core-for-5.16', 'sunxi/drivers-for-5.16', 'sunxi/dt-for-5.16' a=
nd 'sunxi/fixes-for-5.15' into sunxi/for-next)
Merging tegra/for-next (6f8b0fca12e4 Merge branch for-5.16/arm64/dt into fo=
r-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (6037c75b193a arm64: dts: ti: k3-am65: Relocat=
e thermal-zones to SoC specific location)
Merging xilinx/for-next (7a4c31ee877a arm64: zynqmp: Add support for Xilinx=
 Kria SOM board)
Merging clk/clk-next (1a10ca10a675 Merge branch 'clk-rockchip' into clk-nex=
t)
Merging clk-imx/for-next (60da99b07059 clk: imx: imx6ul: Fix csi clk gate r=
egister)
Merging clk-renesas/renesas-clk (cc3e8f97bbd3 clk: renesas: r8a779a0: Add Z=
0 and Z1 clock support)
Merging clk-samsung/for-next (1d26eaeec37a clk: samsung: s5pv210-audss: Mak=
e use of devm_platform_ioremap_resource())
Merging csky/linux-next (40e080ed8218 csky: Make HAVE_TCM depend on !COMPIL=
E_TEST)
Merging h8300/h8300-next (1ec10274d436 h8300: don't implement set_fs)
Merging m68k/for-next (6621cb4a2d0a m68k: muldi3: Use semicolon instead of =
comma)
Merging m68knommu/for-next (5816b3e6577e Linux 5.15-rc3)
Merging microblaze/next (6880fa6c5660 Linux 5.15-rc1)
Merging mips/mips-next (6880fa6c5660 Linux 5.15-rc1)
Merging nds32/next (07cd7745c6f2 nds32/setup: remove unused memblock_region=
 variable in setup_memory())
CONFLICT (content): Merge conflict in arch/nds32/Kconfig
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (1955d843efc3 openrisc/litex: Update defconfig)
Merging parisc-hd/for-next (e4e737bb5c17 Linux 5.15-rc2)
Merging powerpc/next (6880fa6c5660 Linux 5.15-rc1)
Merging soc-fsl/next (242b0b398ccd soc: fsl: enable acpi support in RCPM dr=
iver)
Merging risc-v/for-next (6f55ab36bef5 riscv: Move EXCEPTION_TABLE to RO_DAT=
A segment)
Merging s390/for-next (23955660ff81 Merge branch 'fixes' into for-next)
Merging sh/for-next (12285ff8667b sh: kdump: add some attribute to function)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (234640275675 um: rename set_signals() to um_set_sig=
nals())
Merging xtensa/xtensa-for-next (6489f8d0e1d9 xtensa: call irqchip_init only=
 when CONFIG_USE_OF is selected)
Merging pidfd/for-next (61bc346ce64a uapi/linux/prctl: provide macro defini=
tions for the PR_SCHED_CORE type argument)
Merging fscrypt/master (7f595d6a6cdc fscrypt: allow 256-bit master keys wit=
h AES-256-XTS)
Merging fscache/fscache-next (97b85f2079a9 Merge branch 'fscache-iter-3' in=
to fscache-next)
Merging afs/afs-next (7af08140979a Revert "gcov: clang: fix clang-11+ build=
")
Merging btrfs/for-next (e51480e6f4f8 Merge branch 'for-next-next-v5.15-2021=
0913' into for-next-20210913)
Merging ceph/master (b96728705f91 ceph: convert to noop_direct_IO)
Merging cifs/for-next (5816b3e6577e Linux 5.15-rc3)
Merging configfs/for-next (c42dd069be8d configfs: fix a race in configfs_lo=
okup())
Merging ecryptfs/next (682a8e2b41ef Merge tag 'ecryptfs-5.13-rc1-updates' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs)
Merging erofs/dev (1266b4a7ecb6 erofs: fix double free of 'copied')
Merging exfat/dev (50be9417e23a Merge tag 'io_uring-5.14-2021-07-09' of git=
://git.kernel.dk/linux-block)
Merging ext3/for_next (372d1f3e1bfe ext2: fix sleeping in atomic bugs on er=
ror)
Merging ext4/dev (948ca5f30e1d ext4: enforce buffer head state assertion in=
 ext4_da_map_blocks)
Merging f2fs/dev (6663b138ded1 f2fs: set SBI_NEED_FSCK flag when inconsiste=
nt node block found)
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (7a41554fdfb0 fuse: move fuse_invalidate_attr() into =
fuse_update_ctime())
Merging gfs2/for-next (11603f0011d0 gfs2: Allow append and immutable bits t=
o coexist)
Merging jfs/jfs-next (c48a14dca2cb JFS: fix memleak in jfs_mount)
Merging ksmbd/ksmbd-for-next (ce812992f239 ksmbd: remove NTLMv1 authenticat=
ion)
Merging nfs/linux-next (5816b3e6577e Linux 5.15-rc3)
Merging nfs-anna/linux-next (8cfb9015280d NFS: Always provide aligned buffe=
rs to the RPC read layers)
Merging nfsd/nfsd-next (c36836d5a1af NFSD: Initialize pointer ni with NULL =
and not plain integer 0)
Merging cel/for-next (02579b2ff8b0 nfsd: back channel stuck in SEQ4_STATUS_=
CB_PATH_DOWN)
Merging ntfs3/master (66019837a556 fs/ntfs3: Refactoring lock in ntfs_init_=
acl)
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
Merging file-locks/locks-next (90f7d7a0d0d6 locks: remove LOCK_MAND flock l=
ock support)
Merging vfs/for-next (8f40da9494cf Merge branch 'misc.namei' into for-next)
Merging printk/for-next (9980c4251f8d printk: use kvmalloc instead of kmall=
oc for devkmsg_user)
Merging pci/next (ef4bce990eab Merge branch 'pci/virtualization')
Merging pstore/for-next/pstore (c5d4fb2539ca pstore/blk: Use "%lu" to forma=
t unsigned long)
Merging hid/for-next (dd0f17ef2ea8 Merge branches 'for-5.15/upstream-fixes'=
 and 'for-5.16/amd-sfh' into for-next)
Merging i2c/i2c/for-next (b9447584213e Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i3c/i3c/next (a3587e2c0578 i3c: fix incorrect address slot lookup o=
n 64-bit)
Merging dmi/dmi-for-next (f97a2103f1a7 firmware: dmi: Move product_sku info=
 to the end of the modalias)
Merging hwmon-staging/hwmon-next (7b2ff48129ca dt-bindings: hwmon: jedec,jc=
42: convert to dtschema)
Merging jc_docs/docs-next (250a0a5ba9d2 docs: checkpatch: add multiline, do=
/while, and multiple-assignment messages)
Merging v4l-dvb/master (e4e737bb5c17 Linux 5.15-rc2)
Merging v4l-dvb-next/master (ff79e5dea291 Merge commit 'e6609f2c07de03b948f=
d6c37c5eb4ade3a6d785c' into media_stage)
Applying: fix for "media: ir_toy: allow tx carrier to be set"
Merging pm/linux-next (d91db9b878c3 Merge branch 'pm-pci' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (4855e26bcf4d cpufreq: mediatek-=
hw: Add support for CPUFREQ HW)
Merging cpupower/cpupower (79a0dc5530a9 tools: cpupower: fix typo in cpupow=
er-idle-set(1) manpage)
Merging devfreq/devfreq-next (7f6490afc97f devfreq: exynos-ppmu: simplify p=
arsing event-type from DT)
Merging opp/opp/linux-next (94274f20f6bf dt-bindings: opp: Convert to DT sc=
hema)
Merging thermal/thermal/linux-next (fc26023f8816 thermal/drivers/int340x: F=
ix tcc offset on resume)
CONFLICT (content): Merge conflict in drivers/thermal/intel/int340x_thermal=
/processor_thermal_device.c
Merging ieee1394/for-next (54b3bd99f094 firewire: nosy: switch from 'pci_' =
to 'dma_' API)
Merging dlm/next (ecd95673142e fs: dlm: avoid comms shutdown delay in relea=
se_lockspace)
Merging swiotlb/linux-next (f3c4b1341e83 swiotlb: use depends on for DMA_RE=
STRICTED_POOL)
Merging rdma/for-next (d30ef6d5c013 Merge branch 'mlx5-next' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/mellanox/linux)
CONFLICT (content): Merge conflict in drivers/infiniband/hw/hfi1/ipoib_tx.c
Merging net-next/master (ef91abfb20c7 devlink: Add missed notifications ite=
rators)
CONFLICT (content): Merge conflict in drivers/net/phy/bcm7xxx.c
Merging bpf-next/for-next (161ecd537948 libbpf: Properly ignore STT_SECTION=
 symbols in legacy map definitions)
Merging ipsec-next/master (83688aec17bf net/ipv4/xfrm4_tunnel.c: remove sup=
erfluous header files from xfrm4_tunnel.c)
Merging mlx5-next/mlx5-next (d2c8a1554c10 IB/mlx5: Enable UAR to have DevX =
UID)
Merging netfilter-next/master (acde891c243c rxrpc: Fix _usecs_to_jiffies() =
by using usecs_to_jiffies())
Merging ipvs-next/master (acde891c243c rxrpc: Fix _usecs_to_jiffies() by us=
ing usecs_to_jiffies())
Merging wireless-drivers-next/master (a8e5387f8362 ipw2200: Fix a function =
name in print messages)
Merging bluetooth/master (60edfad4fd0b Bluetooth: hci_vhci: Add force_preve=
nt_wake entry)
Merging mac80211-next/master (171964252189 mac80211: MBSSID support in inte=
rface handling)
Merging mtd/mtd/next (b72841e4dcd5 mtd: mtdswap: Remove redundant assignmen=
t of pointer eb)
Merging nand/nand/next (c2606ddcf5ad mtd: onenand: samsung: drop Exynos4 an=
d describe driver in KConfig)
Merging spi-nor/spi-nor/next (2734d6c1b1a0 Linux 5.14-rc2)
Merging crypto/master (adad556efcdd crypto: api - Fix built-in testing depe=
ndency failures)
Applying: crypto: api - Export crypto_boot_test_finished
Merging drm/drm-next (1e3944578b74 Merge tag 'amd-drm-next-5.16-2021-09-27'=
 of https://gitlab.freedesktop.org/agd5f/linux into drm-next)
Merging drm-misc/for-linux-next (49e7f76fc514 drm/ttm: add TTM_TT_FLAG_EXTE=
RNAL_MAPPABLE)
Merging amdgpu/drm-next (b47b99e30cca drm/amdgpu: consolidate case statemen=
ts)
Merging drm-intel/for-linux-next (b58a88682093 drm/i915/tc: Fix system hang=
 on ADL-P during TypeC PHY disconnect)
Merging drm-tegra/drm/tegra/for-next (c3dbfb9c49ee gpu: host1x: Plug potent=
ial memory leak)
Merging drm-msm/msm-next (cb0927ab80d2 drm/msi/mdp4: populate priv->kms in =
mdp4_kms_init)
Merging imx-drm/imx-drm/next (20fbfc81e390 drm/imx: imx-tve: Make use of th=
e helper function devm_platform_ioremap_resource())
Merging etnaviv/etnaviv/next (81fd23e2b3cc drm/etnaviv: Implement mmap as G=
EM object function)
Merging regmap/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging sound/for-next (a20f3b10de61 ASoC: SOF: Intel: hda-dai: fix potenti=
al locking issue)
Merging sound-asoc/for-next (f12521aa0c13 Merge remote-tracking branch 'aso=
c/for-5.16' into asoc-next)
Applying: Revert "firmware: cs_dsp: add driver to support firmware loading =
on Cirrus Logic DSPs"
Merging modules/modules-next (ced75a2f5da7 MAINTAINERS: Add Luis Chamberlai=
n as modules maintainer)
Merging input/next (d5af8a8f7c4c Input: mpr121 - make use of the helper fun=
ction devm_add_action_or_reset())
Merging block/for-next (655d78c1328c Merge branch 'for-5.16/block' into for=
-next)
Merging device-mapper/for-next (d3703ef33129 dm crypt: use in_hardirq() ins=
tead of deprecated in_irq())
Merging libata/for-next (0e96dc47b95a ahci: remove duplicated PCI device ID=
s)
Merging pcmcia/pcmcia-next (e39cdacf2f66 pcmcia: i82092: fix a null pointer=
 dereference bug)
Merging mmc/next (f3e25dac04e1 dt-bindings: mmc: cdns: document Microchip M=
PFS MMC/SDHCI controller)
Merging mfd/for-mfd-next (cdff1eda6932 mfd: lpc_sch: Rename GPIOBASE to pre=
vent build error)
Merging backlight/for-backlight-next (79fad92f2e59 backlight: pwm_bl: Impro=
ve bootloader/kernel device handover)
Merging battery/for-next (9ba533eb99bb power: supply: core: Add psy_has_pro=
perty())
Merging regulator/for-next (3938209d5e91 Merge remote-tracking branch 'regu=
lator/for-5.16' into regulator-next)
Merging security/next-testing (047843bdb316 Merge branch 'landlock_lsm_v34'=
 into next-testing)
Merging apparmor/apparmor-next (d108370c644b apparmor: fix error check)
Merging integrity/next-integrity (836f7b6ca082 ima: fix deadlock when trave=
rsing "ima_default_rules".)
Merging keys/keys-next (e377c31f788f integrity: Load mokx variables into th=
e blacklist keyring)
CONFLICT (content): Merge conflict in certs/system_keyring.c
Merging safesetid/safesetid-next (1b8b71922919 LSM: SafeSetID: Mark safeset=
id_initialized as __initdata)
Merging selinux/next (8a764ef1bd43 selinux: enable genfscon labeling for se=
curityfs)
CONFLICT (content): Merge conflict in fs/io-wq.c
Merging smack/next (387ef964460f Smack:- Use overlay inode label in smack_i=
node_copy_up())
Merging tomoyo/master (7d2a07b76933 Linux 5.14)
Merging tpmdd/next (f985911b7bc7 crypto: public_key: fix overflow during im=
plicit conversion)
Merging watchdog/master (5816b3e6577e Linux 5.15-rc3)
Merging iommu/next (0b29edc21567 Merge branches 'arm/mediatek', 'arm/renesa=
s', 'iommu/fixes', 'x86/amd' and 'core' into next)
Merging audit/next (8e71168e2cc7 lsm_audit: avoid overloading the "key" aud=
it field)
Merging devicetree/for-next (9ae9c51b092b dt-bindings: rng: convert OMAP an=
d Inside-Secure HWRNG to yaml schema)
Merging mailbox/mailbox-for-next (85dfdbfc13ea mailbox: cmdq: add multi-gce=
 clocks support for mt8195)
Merging spi/for-next (91b3b62061d0 Merge remote-tracking branch 'spi/for-5.=
16' into spi-next)
Merging tip/auto-latest (d4bfebd9ef49 Merge remote-tracking branch 'tip/x86=
/cpu' into tip-master)
Merging clockevents/timers/drivers/next (f196ae282070 dt-bindings: timer: A=
dd ABIs for new Ingenic SoCs)
Merging edac/edac-for-next (1c60e6f24b67 Merge branch 'edac-misc' into edac=
-for-next)
Merging irqchip/irq/irqchip-next (6e3b473ee064 Merge branch irq/qcom-pdc-no=
wake-cleanup into irq/irqchip-next)
Merging ftrace/for-next (5dfe50b05588 bootconfig: Rename xbc_node_find_chil=
d() to xbc_node_find_subkey())
Merging rcu/rcu/next (718ecc280a84 rcu: Make idle entry report expedited qu=
iescent states)
Merging kvm/next (109bbba5066b KVM: Drop unused kvm_dirty_gfn_invalid())
Merging kvm-arm/next (419025b3b419 Merge branch kvm-arm64/misc-5.15 into kv=
marm-master/next)
Merging kvm-ppc/kvm-ppc-next (72476aaa4691 KVM: PPC: Book3S HV: Fix host ra=
dix SLB optimisation with hash guests)
Merging kvms390/next (d5d7bdc80baf s390/mm: optimize reset_guest_reference_=
bit())
Merging xen-tip/linux-next (0594c58161b6 xen/x86: fix PV trap handling on s=
econdary processors)
Merging percpu/for-next (a81a52b325ec Merge branch 'for-5.14-fixes' into fo=
r-next)
Merging workqueues/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging drivers-x86/for-next (c99ca78d67a6 platform/x86: thinkpad_acpi: Swi=
tch to common use of attributes)
Merging chrome-platform/for-next (f11c35e18150 platform/chrome: cros_ec_sen=
sorhub: simplify getting .driver_data)
Merging hsi/for-next (e73f0f0ee754 Linux 5.14-rc1)
Merging leds/for-next (2a5a8fa8b231 leds: trigger: use RCU to protect the l=
ed_cdevs list)
Merging ipmi/for-next (35f4caec9d51 ipmi: Disable some operations during a =
panic)
Merging driver-core/driver-core-next (e5c044c8a9b6 scripts: get_abi.pl: mak=
e undefined search more deterministic)
Merging usb/usb-next (ae9a6149884e Merge 5.15-rc3 into usb-next)
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (c8345c0500de USB: serial: kl5kusb105: drop lin=
e-status helper)
Merging usb-chipidea-next/for-usb-next (78665f57c3fa usb: chipidea: udc: ma=
ke controller hardware endpoint primed)
Merging tty/tty-next (5ecb11dd892f Merge 5.15-rc3 into tty-next)
Merging char-misc/char-misc-next (20ac422c8ef7 Merge 5.15-rc3 into char-mis=
c next)
Merging extcon/extcon-next (f83d7033d4ec dt-bindings: extcon: usbc-tusb320:=
 Add TUSB320L compatible string)
Merging phy-next/next (6880fa6c5660 Linux 5.15-rc1)
Merging soundwire/next (6880fa6c5660 Linux 5.15-rc1)
Merging thunderbolt/next (0a0624a26f9c thunderbolt: Fix -Wrestrict warning)
Merging vfio/next (ea870730d83f Merge branches 'v5.15/vfio/spdx-license-cle=
anups', 'v5.15/vfio/dma-valid-waited-v3', 'v5.15/vfio/vfio-pci-core-v5' and=
 'v5.15/vfio/vfio-ap' into v5.15/vfio/next)
Merging staging/staging-next (42ce32b1ae54 staging: r8188eu: Remove unused =
macros and defines from odm.h)
Merging iio/togreg (55c45baaaf78 iio: adc: rockchip_saradc: Make use of the=
 helper function devm_platform_ioremap_resource())
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (13404ac8882f interconnect: qcom: sdm660: Add missing =
a2noc qos clocks)
Merging dmaengine/next (6880fa6c5660 Linux 5.15-rc1)
Merging cgroup/for-next (7ee285395b21 cgroup: Make rebind_subsystems() disa=
ble v2 controllers all at once)
Merging scsi/for-next (b198c36ab605 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (c749301ebee8 scsi: sd: Fix sd_do_mode_sense() bu=
ffer length handling)
Merging vhost/linux-next (dd7dc7e82b14 vhost_vdpa: unset vq irq before free=
ing irq)
Merging rpmsg/for-next (45500e830ed5 Merge branches 'rpmsg-next' and 'rproc=
-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (7687a5b0ee93 gpio: modepin: Add driver sup=
port for modepin GPIO controller)
Merging gpio-intel/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging pinctrl/for-next (e4978fd02375 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (5816b3e6577e Linux 5.15-rc3)
Merging pinctrl-renesas/renesas-pinctrl (fcfb63148c24 pinctrl: renesas: rzg=
2l: Fix missing port register 21h)
Merging pinctrl-samsung/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging pwm/for-next (3f2b16734914 pwm: mtk-disp: Implement atomic API .get=
_state())
Merging userns/for-next (a3be01837fc9 Merge of ucount-fixes-for-5.14, sigin=
fo-si_trapno-for-v5.15, and exit-cleanups-for-v5.15 for testing in linux-ne=
xt)
CONFLICT (content): Merge conflict in include/linux/sched/signal.h
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging kselftest/next (6880fa6c5660 Linux 5.15-rc1)
Merging livepatching/for-next (cd2d68f2d6b2 Merge branch 'for-5.15/cpu-hotp=
lug' into for-next)
Merging coresight/next (1efbcec2ef8c coresight: cti: Reduce scope for the v=
ariable =E2=80=9Ccs_fwnode=E2=80=9D in cti_plat_create_connection())
Merging rtc/rtc-next (27ff63eb076c rtc: msc313: fix missing include)
Merging nvdimm/libnvdimm-for-next (e765f13ed126 nvdimm/pmem: move dax_attri=
bute_group from dax to pmem)
Merging at24/at24/for-next (762925405482 dt-bindings: at24: add ON Semi CAT=
24C04 and CAT24C05)
Merging ntb/ntb-next (f96cb827ce49 ntb: ntb_pingpong: remove redundant init=
ialization of variables msg_data and spad_data)
Merging seccomp/for-next/seccomp (b4d8a58f8dcf seccomp: Fix setting loaded =
filter count during TSYNC)
Merging kspp/for-next/kspp (744679de4be9 Merge branch 'for-next/gcc-plugins=
' into for-next/kspp)
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
Merging fpga/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging kunit/test (6880fa6c5660 Linux 5.15-rc1)
Merging cfi/cfi/next (ff1176468d36 Linux 5.14-rc3)
Merging kunit-next/kunit (3b29021ddd10 kunit: tool: allow filtering test ca=
ses via glob)
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mhi/mhi-next (813272ed5238 Merge 5.14-rc5 into char-misc-next)
Merging memblock/for-next (e888fa7bb882 memblock: Check memory add/cap orde=
ring)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (e71ba9452f0b Linux 5.11-rc2)
Merging rust/rust-next (5d3986cf8ed6 MAINTAINERS: Rust)
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
Merging akpm-current/current (c7f6f067c98b ipc/ipc_sysctl.c: remove fallbac=
k for !CONFIG_PROC_SYSCTL)
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (4fd56af9bc3f mm: unexport {,un}lock_page_memcg)

--Sig_/MeI+_CZ/bhQ7zr+35Zt30eX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFVZDkACgkQAVBC80lX
0GwqvggApII3Ahh1BQS3UDlDXutbpNhoNsFnIjx/5pjpYbKFNRWYLssuU/XpvgCD
XcYjJ0BOfooZ7CSwessMbsSru2vV0RJU1Z5qMPDGxKFJ/SNGpz606+7K+zw/DUM7
1t6FM+BOI8jcLUfOqIqdLP5YfsJalbm9d5cmJCbTA5I1Gq1binqvNWS6rCV1eH7a
sh/d4N84aII+OiUWz7RAV2LfWHaw/L9ueXSgRfsvAd9QYsaTED4e7Xa1LpGrO21H
P/cqHUGQV5OtfpjDETQgNWco1KdBqYTYGzCqIoiPxAYs6U+qzSoVsRo282u5m+mJ
LkQrktZVFv3JvhYAq0k4lccPlz0b2w==
=AdL8
-----END PGP SIGNATURE-----

--Sig_/MeI+_CZ/bhQ7zr+35Zt30eX--
