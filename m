Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 168DD3E55E5
	for <lists+linux-next@lfdr.de>; Tue, 10 Aug 2021 10:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237770AbhHJIu3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Aug 2021 04:50:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236844AbhHJIu2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Aug 2021 04:50:28 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4DEAC0613D3;
        Tue, 10 Aug 2021 01:50:05 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GkRV21SM3z9sT6;
        Tue, 10 Aug 2021 18:50:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628585402;
        bh=I5WMA3od7bQWvrnSAJuJzrERNW0+3NjU26NdJFhsGt0=;
        h=Date:From:To:Cc:Subject:From;
        b=jBqx8dN9cK6IU2L5EDoR7a9S9tKNxCdhzCOiBc3yYDCL51K9fqyPvrDgHIwpyqYQF
         4bLxm9FoXaytYdctwx8uGJn3zDler+ytvETQRl6vYg6BCV1JriUUTa4S+EGQDr4cPF
         EaB8WbfMNQ7DDqZDKWZcNjVGKTq60WQUXcJ1E8Vw/h8rytpt2jj6ViZZdhGfbQMz2x
         NT8POR6XO7zRuN9I50c8CMkyyrb86jAlKW8FgtbR2sBjpSem7BEBvkz6ytS9xWGEqX
         vY2NU9Gk2RhezHCGNV20LqwLDWkbaf8dMY2Hc8ycmvbFS5kL1I311JQnJvCqQe+db8
         A2MFHVMEwhw5g==
Date:   Tue, 10 Aug 2021 18:50:00 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 10
Message-ID: <20210810185000.50edb447@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WgAv8KVaC0tV0_Kj=qQ9BbO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WgAv8KVaC0tV0_Kj=qQ9BbO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210809:

The net-next tree still had its build failure for which I applied a
patch.

The device-mapper tree gained a conflict against the block tree.

The rtc tree gained a build failure so I used the verion from
next-20210809.

The mhi tree lost its build failures.

Non-merge commits (relative to Linus' tree): 5869
 6115 files changed, 355704 insertions(+), 138794 deletions(-)

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

I am currently merging 333 trees (counting Linus' and 90 trees of bug
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
Merging origin/master (36a21d51725a Linux 5.14-rc5)
Merging fixes/fixes (614124bea77e Linux 5.13-rc5)
Merging kbuild-current/fixes (14ccc638b02f kbuild: cancel sub_make_done for=
 the install target to fix DKMS)
Merging arc-current/for-curr (669d94219d91 MAINTAINERS: update Vineet's ema=
il address)
Merging arm-current/fixes (dad7b9896a5d ARM: 9081/1: fix gcc-10 thumb2-kern=
el regression)
Merging arm64-fixes/for-next/fixes (0c32706dac1b arm64: stacktrace: avoid t=
racing arch_stack_walk())
Merging arm-soc-fixes/arm/fixes (19c1eb3605a1 Merge tag 'omap-for-v5.14/fix=
es-rc5-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linu=
x-omap into arm/fixes)
Merging drivers-memory-fixes/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging m68k-current/for-linus (21ed49265986 m68k: MAC should select HAVE_P=
ATA_PLATFORM)
Merging powerpc-fixes/fixes (a88603f4b92e powerpc/vdso: Don't use r30 to av=
oid breaking Go lang)
Merging s390-fixes/fixes (ecd92e2167c3 s390: update defconfigs)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (d09c548dbf3b net: sched: act_mirred: Reset ct info when=
 mirror/redirect skb)
Merging bpf/master (d09c548dbf3b net: sched: act_mirred: Reset ct info when=
 mirror/redirect skb)
Merging ipsec/master (480e93e12aa0 net: xfrm: Fix end of loop tests for lis=
t_for_each_entry)
Merging netfilter/master (d09c548dbf3b net: sched: act_mirred: Reset ct inf=
o when mirror/redirect skb)
Merging ipvs/master (269fc69533de netfilter: nfnetlink_hook: translate inet=
 ingress to netdev)
Merging wireless-drivers/master (abf3d98dee7c mt76: fix enum type mismatch)
Merging mac80211/master (d09c548dbf3b net: sched: act_mirred: Reset ct info=
 when mirror/redirect skb)
Merging rdma-fixes/for-rc (2638a32348bb RDMA/iw_cxgb4: Fix refcount underfl=
ow while destroying cqs.)
Merging sound-current/for-linus (dc0dc8a73e8e ALSA: pcm: Fix mmap breakage =
without explicit buffer setup)
Merging sound-asoc-fixes/for-linus (5446b51c8cef Merge remote-tracking bran=
ch 'asoc/for-5.14' into asoc-linus)
Merging regmap-fixes/for-linus (ff1176468d36 Linux 5.14-rc3)
Merging regulator-fixes/for-linus (25b549d69e17 Merge remote-tracking branc=
h 'regulator/for-5.14' into regulator-linus)
Merging spi-fixes/for-linus (36a21d51725a Linux 5.14-rc5)
Merging pci-current/for-linus (d5450c42cbc3 PCI: Increase D3 delay for AMD =
Renoir/Cezanne XHCI)
Merging driver-core.current/driver-core-linus (36a21d51725a Linux 5.14-rc5)
Merging tty.current/tty-linus (36a21d51725a Linux 5.14-rc5)
Merging usb.current/usb-linus (36a21d51725a Linux 5.14-rc5)
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (8da0e55c7988 USB: serial: ftdi_sio: add=
 device ID for Auto-M3 OP-COM v2)
Merging usb-chipidea-fixes/for-usb-fixes (5df09c15bab9 usb: cdnsp: Fix the =
IMAN_IE_SET and IMAN_IE_CLEAR macro)
Merging phy/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging staging.current/staging-linus (36a21d51725a Linux 5.14-rc5)
Merging iio-fixes/fixes-togreg (5afc1540f138 iio: adc: Fix incorrect exit o=
f for-loop)
Merging char-misc.current/char-misc-linus (36a21d51725a Linux 5.14-rc5)
Merging soundwire-fixes/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging thunderbolt-fixes/fixes (36a21d51725a Linux 5.14-rc5)
Merging input-current/for-linus (818b26588994 Merge branch 'next' into for-=
linus)
Merging crypto-current/master (66192b2e3fd8 crypto: hisilicon/sec - fix the=
 process of disabling sva prefetching)
Merging vfio-fixes/for-linus (dc51ff91cf2d vfio/platform: fix module_put ca=
ll in error flow)
Merging kselftest-fixes/fixes (567c39047dbe selftests/sgx: Fix Q1 and Q2 ca=
lculation in sigstruct.c)
Merging modules-fixes/modules-linus (055f23b74b20 module: check for exit se=
ctions in layout_sections() instead of module_init_section())
Merging dmaengine-fixes/fixes (7199ddede9f0 dmaengine: imx-dma: configure t=
he generic DMA type to make it work)
Merging backlight-fixes/for-backlight-fixes (a38fd8748464 Linux 5.12-rc2)
Merging mtd-fixes/mtd/fixes (b48027083a78 mtd: rawnand: Fix probe failure d=
ue to of_get_nand_secure_regions())
Merging mfd-fixes/for-mfd-fixes (a61f4661fba4 mfd: intel_quark_i2c_gpio: Re=
vert "Constify static struct resources")
Merging v4l-dvb-fixes/fixes (f1de1c780359 media: atmel: fix build when ISC=
=3Dm and XISC=3Dy)
Merging reset-fixes/reset/fixes (1435f82689e1 reset: RESET_MCHP_SPARX5 shou=
ld depend on ARCH_SPARX5)
Merging mips-fixes/mips-fixes (6aa32467299e MIPS: check return value of pgt=
able_pmd_page_ctor)
Merging at91-fixes/at91-fixes (6efb943b8616 Linux 5.13-rc1)
Merging omap-fixes/fixes (353b7a55dcaf Merge branch 'fixes-v5.14' into fixe=
s)
Merging kvm-fixes/master (d5aaad6f8342 KVM: x86/mmu: Fix per-cpu counter co=
rruption on 32-bit builds)
Merging kvms390-fixes/master (cd4220d23bf3 KVM: selftests: do not require 6=
4GB in set_memory_region_test)
Merging hwmon-fixes/hwmon (03726fd90f4b hwmon: sht4x: update Documentation =
for Malformed table)
Merging nvdimm-fixes/libnvdimm-fixes (b05d4c576b69 dax: Ensure errno is ret=
urned from dax_direct_access)
Merging cxl-fixes/fixes (fae8817ae804 cxl/mem: Fix memory device capacity p=
robing)
Merging btrfs-fixes/next-fixes (ff4502c88fea Merge branch 'misc-5.14' into =
next-fixes)
Merging vfs-fixes/fixes (173e84953eaa fs: fix reporting supported extra fil=
e attributes for statx())
Merging dma-mapping-fixes/for-linus (18a3c5f7abfd Merge tag 'for_linus' of =
git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging i3c-fixes/i3c/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging drivers-x86-fixes/fixes (9d7b132e62e4 platform/x86: pcengines-apuv2=
: Add missing terminating entries to gpio-lookup tables)
Merging samsung-krzk-fixes/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging pinctrl-samsung-fixes/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging devicetree-fixes/dt/linus (50d8d7e19c43 dt-bindings: display: renes=
as,du: Make resets optional on R-Car H1)
Merging scsi-fixes/fixes (f0f82e2476f6 scsi: core: Fix capacity set to zero=
 after offlinining device)
Merging drm-fixes/drm-fixes (36a21d51725a Linux 5.14-rc5)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (36a21d51725a Linux 5.14-rc5)
Merging mmc-fixes/fixes (67b13f3e221e mmc: sdhci-msm: Update the software t=
imeout value for sdhc)
Merging rtc-fixes/rtc-fixes (bd33335aa93d rtc: cmos: Disable irq around dir=
ect invocation of cmos_interrupt())
Merging gnss-fixes/gnss-linus (e73f0f0ee754 Linux 5.14-rc1)
Merging hyperv-fixes/hyperv-fixes (f5a11c69b699 Revert "x86/hyperv: fix log=
ical processor creation")
Merging soc-fsl-fixes/fix (be7ecbd240b2 soc: fsl: qe: convert QE interrupt =
controller to platform_device)
Merging risc-v-fixes/fixes (867432bec1c6 Revert "riscv: Remove CONFIG_PHYS_=
RAM_BASE_FIXED")
Merging pidfd-fixes/fixes (03ba0fe4d09f file: simplify logic in __close_ran=
ge())
Merging fpga-fixes/fixes (ec6446d5304b fpga: dfl: fme: Fix cpu hotplug issu=
e in performance reporting)
Merging spdx/spdx-linus (36a21d51725a Linux 5.14-rc5)
Merging gpio-brgl-fixes/gpio/for-current (9b87f43537ac gpio: tqmx86: really=
 make IRQ optional)
Merging gpio-intel-fixes/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging pinctrl-intel-fixes/fixes (2f658f7a3953 pinctrl: tigerlake: Fix GPI=
O mapping for newer version of software)
Merging erofs-fixes/fixes (0852b6ca941e erofs: fix 1 lcluster-sized pcluste=
r for big pcluster)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (2734d6c1b1a0 Linux 5.14-rc2)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (024591f9a6e0 arm: ioremap: don't abuse pfn_va=
lid() to check if pfn is in RAM)
Merging cel-fixes/for-rc (9f4ad9e425a1 Linux 5.12)
Merging irqchip-fixes/irq/irqchip-fixes (1fee9db9b42d irqchip/mips: Fix RCU=
 violation when using irqdomain lookup on interrupt entry)
Merging renesas-fixes/fixes (432b52eea3dc ARM: shmobile: defconfig: Restore=
 graphical consoles)
Merging drm-misc-fixes/for-linux-next-fixes (e89afb51f97a drm/vmwgfx: Fix a=
 64bit regression on svga3)
Merging kspp-gustavo/for-next/kspp (cb163627e6d3 scsi: fas216: Fix fall-thr=
ough warning for Clang)
Merging kbuild/for-next (d7a86429dbc6 scripts: checkversion: modernize linu=
x/version.h search strings)
Merging compiler-attributes/compiler-attributes (7ed012969bbc Compiler Attr=
ibutes: fix __has_attribute(__no_sanitize_coverage__) for GCC 4)
CONFLICT (content): Merge conflict in include/linux/compiler_attributes.h
Merging dma-mapping/for-next (d03c54419274 dma-mapping: disallow .map_sg op=
erations from returning zero on error)
Merging asm-generic/master (14462376858e Merge branch 'asm-generic-unaligne=
d' into asm-generic)
Merging arc/for-next (9799f1cac840 ARC: retire MMUv1 and MMUv2 support)
Merging arm/for-next (3bd1461d1691 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (92b5529ab76e Merge branch 'for-next/entry' int=
o for-next/core)
Merging arm-perf/for-next/perf (d96b1b8c9f79 drivers/perf: fix the missed i=
da_simple_remove() in ddr_perf_probe())
Merging arm-soc/for-next (b37e897eb18e soc: document merges)
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (6285af2a2821 Merge tags 'amlogic-arm-configs-for-=
v5.15', 'amlogic-arm64-dt-for-v5.15' and 'amlogic-arm-dt-for-v5.15' into fo=
r-next)
Merging aspeed/for-next (dbc97765328a ARM: dts: aspeed-g5: Remove ngpios fr=
om sgpio node.)
Merging at91/at91-next (b102356e5bc1 Merge branch 'at91-dt' into at91-next)
Merging drivers-memory/for-next (c28b584deb1b Merge branch 'for-v5.15/omap-=
gpmc' into for-next)
Merging imx-mxs/for-next (503d1ac62829 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (a7a6278a5674 Merge branch 'for_5.14/drivers-soc' int=
o next)
Merging mediatek/for-next (69862ae4e378 Merge branch 'v5.14-next/soc' into =
for-next)
Merging mvebu/for-next (69a91ff5e46c Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (5f3b7875d4f9 Merge branch 'omap-for-v5.15/ti-sysc' i=
nto for-next)
Merging qcom/for-next (57249830120b Merge remote-tracking branch 'refs/remo=
tes/origin/for-next' into for-next)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/qcom/msm8996.dtsi
Merging raspberrypi/for-next (b1f2fcb28228 ARM: dts: bcm283x: Fix VEC addre=
ss for BCM2711)
Merging renesas/next (57ec7ff3f83a Merge branch 'renesas-arm-dt-for-v5.15' =
into renesas-next)
Merging reset/reset/next (bee08559701f reset: renesas: Add RZ/G2L usbphy co=
ntrol driver)
Merging rockchip/for-next (7c5b22cf2d8e Merge branch 'v5.15-clk/next' into =
for-next)
Merging samsung-krzk/for-next (2bcc4ecbc5df Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (3c94441995dd Merge branch 'for-next/scmi' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging stm32/stm32-next (1e6bc5987a52 ARM: dts: stm32: Update AV96 adv7513=
 node per dtbs_check)
Merging sunxi/sunxi/for-next (3f1c53207cf0 Merge branches 'sunxi/dt-for-5.1=
4' and 'sunxi/fixes-for-5.13' into sunxi/for-next)
Merging tegra/for-next (5a1ab00454cc Merge branch for-5.15/soc into for-nex=
t)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (c1fa5ac6c2f4 arm64: dts: ti: k3-am642-sk: Add=
 pwm nodes)
Merging xilinx/for-next (4cddd9be7ef6 Merge branch 'zynq/soc' of https://gi=
thub.com/Xilinx/linux-xlnx into for-next)
Merging clk/clk-next (765f4fa0e9f1 Merge branch 'clk-qcom' into clk-next)
Merging clk-imx/for-next (fb3f4bca19b3 clk: imx: clk-divider-gate: Switch t=
o clk_divider.determine_rate)
Merging clk-renesas/renesas-clk (d28b1e03dc8d clk: renesas: r9a07g044: Add =
entry for fixed clock P0_DIV2)
Merging clk-samsung/for-next (a38fd8748464 Linux 5.12-rc2)
Merging csky/linux-next (90dc8c0e664e csky: Kconfig: Remove unused selects)
Merging h8300/h8300-next (6e5e55227c95 Merge tag 'v5.11' into h8300-next)
Merging m68k/for-next (2189e928b62e m68k: Fix invalid RMW_INSNS on CPUs tha=
t lack CAS)
Merging m68knommu/for-next (236716124cf8 m68knommu: only set CONFIG_ISA_DMA=
_API for ColdFire sub-arch)
Merging microblaze/next (14a832498c23 arch: microblaze: Fix spelling mistak=
e "vesion" -> "version")
Merging mips/mips-next (cb95ea79b3fc MIPS: locking/atomic: Fix atomic{_64,}=
_sub_if_positive)
Merging nds32/next (40e0dd851e7b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (745a773b94ea openrisc: Fix compiler warnings in =
setup)
Merging parisc-hd/for-next (ca2b19a4bdb6 parisc: Increase gcc stack frame c=
heck to 2048 for 32- and 64-bit)
Merging powerpc/next (a6cae77f1bc8 powerpc/stacktrace: Include linux/delay.=
h)
Merging soc-fsl/next (242b0b398ccd soc: fsl: enable acpi support in RCPM dr=
iver)
Merging risc-v/for-next (9f2a5aebb03c dt-bindings: riscv: add starfive jh71=
00 bindings)
Merging s390/for-next (e6e9bca186a0 Merge branch 'features' into for-next)
Merging sh/for-next (2882b7626f49 sh: kernel: traps: remove unused variable)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (1aee020155f3 um: remove unneeded semicolon in um_ar=
ch.c)
Merging xtensa/xtensa-for-next (ac637a0ada71 xtensa: add fairness to IRQ ha=
ndling)
Merging pidfd/for-next (af6a8469fd2a Merge branch 'fs.idmapped' into for-ne=
xt)
Merging fscrypt/master (38ef66b05cfa fscrypt: document struct fscrypt_opera=
tions)
Merging fscache/fscache-next (5193f26aef59 fscache: Use refcount_t for the =
cookie refcount instead of atomic_t)
Merging afs/afs-next (7af08140979a Revert "gcov: clang: fix clang-11+ build=
")
Merging btrfs/for-next (878d950ee038 Merge branch 'for-next-next-v5.14-2021=
0729' into for-next-20210729)
Merging ceph/master (8434ffe71c87 ceph: take snap_empty_lock atomically wit=
h snaprealm refcount change)
Merging cifs/for-next (6c9ced4cc7d3 cifs: Call close synchronously during u=
nlink/rename/lease break.)
Merging cifsd/cifsd-for-next (456af438ad49 Merge pull request #64 from namj=
aejeon/cifsd-for-next)
Merging configfs/for-next (769f52676756 configfs: restore the kernel v5.13 =
text attribute write behavior)
Merging ecryptfs/next (682a8e2b41ef Merge tag 'ecryptfs-5.13-rc1-updates' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs)
Merging erofs/dev (771c994ea51f erofs: convert all uncompressed cases to io=
map)
Merging exfat/dev (50be9417e23a Merge tag 'io_uring-5.14-2021-07-09' of git=
://git.kernel.dk/linux-block)
Merging ext3/for_next (9048da101932 Merge doc fixup from Randy for the hole=
 punch series.)
Merging ext4/dev (877ba3f729fd ext4: fix potential htree corruption when gr=
owing large_dir directories)
Merging f2fs/dev (94afd6d6e525 f2fs: extent cache: support unaligned extent)
Applying: fxup for "f2fs: Convert to using invalidate_lock"
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (5d5b74aa9c76 fuse: allow sharing existing sb)
Merging gfs2/for-next (477448413342 gfs2: Remove redundant check from gfs2_=
glock_dq)
Merging jfs/jfs-next (5d299f44d765 jfs: Avoid field-overflowing memcpy())
Merging nfs/linux-next (2734d6c1b1a0 Linux 5.14-rc2)
Merging nfs-anna/linux-next (69f2cd6df3ee SUNRPC: Add dst_port to the sysfs=
 xprt info file)
Merging nfsd/nfsd-next (ab1016d39cc0 nfsd: fix NULL dereference in nfs3svc_=
encode_getaclres)
Merging cel/for-next (2cbe0ebc2457 lockd: change the proc_handler for nsm_u=
se_hostnames)
Merging orangefs/for-next (0fdec1b3c9fb orangefs: fix orangefs df output.)
Merging overlayfs/overlayfs-next (b7c065dbc40d ovl: use kvalloc in xattr co=
py-up)
Merging ubifs/next (a801fcfeef96 ubifs: Set/Clear I_LINKABLE under i_lock f=
or whiteout inode)
Merging v9fs/9p-next (732b33d0dbf1 9p/xen: Fix end of loop tests for list_f=
or_each_entry)
Merging xfs/for-next (81a448d7b066 xfs: prevent spoofing of rtbitmap blocks=
 when recovering buffers)
Merging zonefs/for-next (95b115332a83 zonefs: remove redundant null bio che=
ck)
Merging iomap/iomap-for-next (ae44f9c286da iomap: Add another assertion to =
inline data handling)
Merging djw-vfs/vfs-for-next (d03ef4daf33a fs: forbid invalid project ID)
Merging file-locks/locks-next (e1cc6e8c1969 fcntl: fix potential deadlock f=
or &fasync_struct.fa_lock)
Merging vfs/for-next (303392fd5c16 Merge tag 'leds-5.14-rc1' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/pavel/linux-leds)
Merging printk/for-next (23d8adcf8022 Merge branch 'rework/printk_safe-remo=
val' into for-next)
Merging pci/next (89ba70faa33c Merge branch 'remotes/lorenzo/pci/misc')
Merging pstore/for-next/pstore (c5d4fb2539ca pstore/blk: Use "%lu" to forma=
t unsigned long)
Merging hid/for-next (e2e4893180f3 Merge branch 'for-5.14/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (a6b8bb6a813a i2c: i801: Fix handling SMBHSTCNT_PE=
C_EN)
Merging i3c/i3c/next (3e5feb11a829 i3c: master: svc: fix doc warning in svc=
-i3c-master.c)
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (ae832e297be7 hwmon: (w83781d) Match on de=
vice tree compatibles)
Merging jc_docs/docs-next (0c3b533cfdd5 MAINTAINERS: add entry for traditio=
nal Chinese documentation)
Merging v4l-dvb/master (9c3a0f285248 Merge tag 'v5.14-rc4' into media_tree)
Merging v4l-dvb-next/master (6daa9f32282a media: Clean V4L2_PIX_FMT_NV12MT =
documentation)
Merging pm/linux-next (9ac32de19606 Merge branches 'pm-pci', 'powercap', 'p=
m-cpufreq' and 'pm-sleep' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (484f2b7c61b9 cpufreq: armada-37=
xx: forbid cpufreq for 1.2 GHz variant)
Merging cpupower/cpupower (5499f2b80b56 tools: cpupower: fix typo in cpupow=
er-idle-set(1) manpage)
Merging devfreq/devfreq-next (e73f0f0ee754 Linux 5.14-rc1)
Merging opp/opp/linux-next (4e3391c52983 dt-bindings: opp: Convert to DT sc=
hema)
Merging thermal/thermal/linux-next (fe6a6de6692e thermal/drivers/int340x/pr=
ocessor_thermal: Fix tcc setting)
Merging ieee1394/for-next (54b3bd99f094 firewire: nosy: switch from 'pci_' =
to 'dma_' API)
Merging dlm/next (62699b3f0a62 fs: dlm: move receive loop into receive hand=
ler)
Merging swiotlb/linux-next (a449ffaf9181 powerpc/svm: Don't issue ultracall=
s if !mem_encrypt_active())
Merging rdma/for-next (d2b10794fc13 RDMA/core: Create clean QP creations in=
terface for uverbs)
Merging net-next/master (2a2b6e3640c4 devlink: Fix port_type_set function p=
ointer check)
CONFLICT (content): Merge conflict in drivers/net/ethernet/broadcom/bnxt/bn=
xt_ptp.h
Applying: NET_VENDOR_CIRRUS is not ready for COMPILE_TEST
Merging bpf-next/for-next (6aab1c81b98a selftests/bpf: Add tests for XDP bo=
nding)
Merging ipsec-next/master (5d8dbb7fb82b net: xfrm: fix shift-out-of-bounce)
Merging mlx5-next/mlx5-next (598fe77df855 net/mlx5: Lag, Create shared FDB =
when in switchdev mode)
Merging netfilter-next/master (9344988d2979 netfilter: ctnetlink: allow to =
filter dump by status bits)
Merging ipvs-next/master (9344988d2979 netfilter: ctnetlink: allow to filte=
r dump by status bits)
Merging wireless-drivers-next/master (d249ff28b1d8 intersil: remove obsolet=
e prism54 wireless driver)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging bluetooth/master (146af2264902 Bluetooth: btusb: Fix fall-through w=
arnings)
CONFLICT (content): Merge conflict in net/bluetooth/hci_sysfs.c
CONFLICT (content): Merge conflict in net/bluetooth/hci_core.c
CONFLICT (content): Merge conflict in include/net/bluetooth/hci_core.h
Merging mac80211-next/master (2a2b6e3640c4 devlink: Fix port_type_set funct=
ion pointer check)
Merging mtd/mtd/next (b4675c64f932 mtdblock: Warn if the added for a NAND d=
evice)
Merging nand/nand/next (74a021a632b0 mtd: rawnand: remove never changed ret=
 variable)
Merging spi-nor/spi-nor/next (2734d6c1b1a0 Linux 5.14-rc2)
Merging crypto/master (0888d04b47a1 hwrng: Add Arm SMCCC TRNG based driver)
Merging drm/drm-next (49f7844b0884 Merge tag 'drm-misc-next-2021-08-05' of =
git://anongit.freedesktop.org/drm/drm-misc into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_drv=
.c
CONFLICT (content): Merge conflict in drivers/firmware/Makefile
Merging drm-misc/for-linux-next (873601687598 drm/vmwgfx: Fix a 64bit regre=
ssion on svga3)
CONFLICT (content): Merge conflict in drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
Merging amdgpu/drm-next (234a296b97ec drm/amdgpu: handle VCN instances when=
 harvesting)
Merging drm-intel/for-linux-next (3bfa7d40ce73 drm/i915/dg2: Add support fo=
r new DG2-G11 revid 0x5)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_device_inf=
o.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_di=
splay.c
Merging drm-tegra/drm/tegra/for-next (2c5b2d964d19 gpu: host1x: Remove unus=
ed functions)
Merging drm-msm/msm-next (061a9aeab07f dt-bindings: display: msm: dsi-contr=
oller-main: restore assigned-clocks)
Merging imx-drm/imx-drm/next (59e4e762a17d gpu: ipu-v3: Fix i.MX IPU-v3 off=
set calculations for (semi)planar U/V formats)
Merging etnaviv/etnaviv/next (81fd23e2b3cc drm/etnaviv: Implement mmap as G=
EM object function)
Merging regmap/for-next (cc15156265f0 Merge remote-tracking branch 'regmap/=
for-5.15' into regmap-next)
Merging sound/for-next (ca4c5b334f10 ALSA: msnd: Use proper mmap method)
Merging sound-asoc/for-next (b6ba7f5d4e8a Merge remote-tracking branch 'aso=
c/for-5.15' into asoc-next)
Merging modules/modules-next (ced75a2f5da7 MAINTAINERS: Add Luis Chamberlai=
n as modules maintainer)
Merging input/next (76ba1900cb67 dt-bindings: power: reset: qcom-pon: Conve=
rt qcom PON binding to yaml)
Merging block/for-next (a967b8ae22aa Merge branch 'for-5.15/block' into for=
-next)
Merging device-mapper/for-next (3eadac651d1d dm: add documentation for IMA =
measurement support)
CONFLICT (content): Merge conflict in drivers/md/dm.c
Merging pcmcia/pcmcia-next (e39cdacf2f66 pcmcia: i82092: fix a null pointer=
 dereference bug)
Merging mmc/next (e004b8de7bf6 mmc: sdio: Print contents of unknown CIS tup=
les)
Merging mfd/for-mfd-next (9050ad816f52 mfd: db8500-prcmu: Handle missing FW=
 variant)
Merging backlight/for-backlight-next (1181f2164135 backlight: lm3630a: Conv=
ert to atomic PWM API and check for errors)
Merging battery/for-next (6ea0126631b0 power: supply: sbs-battery: add supp=
ort for time_to_empty_now attribute)
Merging regulator/for-next (4addb9a0c520 Merge remote-tracking branch 'regu=
lator/for-5.15' into regulator-next)
Merging security/next-testing (047843bdb316 Merge branch 'landlock_lsm_v34'=
 into next-testing)
Merging apparmor/apparmor-next (d108370c644b apparmor: fix error check)
Merging integrity/next-integrity (907a399de7b0 evm: Check xattr size discre=
pancy between kernel and user)
Merging keys/keys-next (e377c31f788f integrity: Load mokx variables into th=
e blacklist keyring)
CONFLICT (content): Merge conflict in certs/system_keyring.c
Merging safesetid/safesetid-next (1b8b71922919 LSM: SafeSetID: Mark safeset=
id_initialized as __initdata)
Merging selinux/next (893c47d1964f selinux: return early for possible NULL =
audit buffers)
Merging smack/next (bfc3cac0c761 smack: mark 'smack_enabled' global variabl=
e as __initdata)
Merging tomoyo/master (ff1176468d36 Linux 5.14-rc3)
Merging tpmdd/next (b0e77c4a957e certs: Add support for using elliptic curv=
e keys for signing modules)
Merging watchdog/master (cf813c67d961 watchdog: iTCO_wdt: use dev_err() ins=
tead of pr_err())
Merging iommu/next (a9cb792c185a Merge branches 'iommu/fixes', 'apple/dart'=
, 'x86/amd' and 'core' into next)
Merging audit/next (d97e99386ad0 audit: add header protection to kernel/aud=
it.h)
Merging devicetree/for-next (4409273b818c of: fdt: do not update local vari=
able after use)
CONFLICT (modify/delete): Documentation/devicetree/bindings/arm/mediatek/me=
diatek,mmsys.txt deleted in devicetree/for-next and modified in HEAD. Versi=
on HEAD of Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.tx=
t left in tree.
$ git rm -f Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.t=
xt
Applying: dt-bindings: arm: mediatek: mmsys: fixup for conversion to yaml
Merging mailbox/mailbox-for-next (4f197188da66 MAINTAINERS: add entry for p=
olarfire soc mailbox)
Merging spi/for-next (59f7687f4066 Merge remote-tracking branch 'spi/for-5.=
15' into spi-next)
Merging tip/auto-latest (f6a71a5ebe23 Merge branch 'locking/core')
Merging clockevents/timers/drivers/next (6f64c8159af9 clocksource/drivers/a=
rm_global_timer: Remove duplicated argument in arm_global_timer)
Merging edac/edac-for-next (767f4b620eda EDAC/mce_amd: Do not load edac_mce=
_amd module on guests)
Merging irqchip/irq/irqchip-next (00a2b7c75895 Merge branch irq/bitmap_zall=
oc into irq/irqchip-next)
Merging ftrace/for-next (51397dc6f283 tracing: Quiet smp_processor_id() use=
 in preemptable warning in hwlat)
Merging rcu/rcu/next (195671c13d06 rcutorture: Don't cpuhp_remove_state() i=
f cpuhp_setup_state() failed)
Merging kvm/next (32bdc0198841 KVM: selftests: Move vcpu_args_set into perf=
_test_util)
Merging kvm-arm/next (fe7490bd12d4 Merge branch kvm-arm64/mmu/kmemleak-pkvm=
 into kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (72476aaa4691 KVM: PPC: Book3S HV: Fix host ra=
dix SLB optimisation with hash guests)
Merging kvms390/next (1f703d2cf204 KVM: s390: allow facility 192 (vector-pa=
cked-decimal-enhancement facility 2))
Merging xen-tip/linux-next (83f877a09516 xen/events: remove redundant initi=
alization of variable irq)
Merging percpu/for-next (a81a52b325ec Merge branch 'for-5.14-fixes' into fo=
r-next)
Merging workqueues/for-next (ffd8bea81fbb workqueue: Replace deprecated CPU=
-hotplug functions.)
Merging drivers-x86/for-next (153cca9caa81 platform/x86: Add and use a dual=
_accel_detect() helper)
Merging chrome-platform/for-next (e73f0f0ee754 Linux 5.14-rc1)
Merging hsi/for-next (e73f0f0ee754 Linux 5.14-rc1)
Merging leds/for-next (9cbc86109537 leds: lgm-sso: Propagate error codes fr=
om callee to caller)
Merging ipmi/for-next (f9714eb04364 ipmi: ssif_bmc: Return -EFAULT if copy_=
from_user() fails)
Merging driver-core/driver-core-next (bd935a7b2134 Merge 5.14-rc5 into driv=
er-core-next)
Applying: fix for "drm: Introduce the DP AUX bus"
Merging usb/usb-next (73e19de7b79a Merge 5.14-rc5 into usb-next)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/qcom/sc7280.dtsi
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/qcom/sc7280-idp.d=
ts
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (4e9340bb551a USB: serial: cp210x: determine fw=
 version for CP2105 and CP2108)
Merging usb-chipidea-next/for-usb-next (956df1bb0ab8 usb: chipidea: host: f=
ix port index underflow and UBSAN complains)
Merging tty/tty-next (15e580283f26 Merge 5.14-rc5 into tty-next)
Merging char-misc/char-misc-next (813272ed5238 Merge 5.14-rc5 into char-mis=
c-next)
Merging extcon/extcon-next (07de34f5ce1e extcon: max3355: Drop unused inclu=
de)
Merging phy-next/next (23fd679249df phy: qcom-qmp: add USB3 PHY support for=
 IPQ6018)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/phy=
/qcom,qmp-usb3-dp-phy.yaml
Merging soundwire/next (dd81e7c3f0bb soundwire: cadence: override PDI confi=
gurations to create loopback)
Merging thunderbolt/next (42716425ad7e thunderbolt: Fix port linking by che=
cking all adapters)
Merging vfio/next (3fb1712d8596 vfio/mdev: don't warn if ->request is not s=
et)
Merging staging/staging-next (96020566a575 Merge 5.14-rc5 into staging-next)
CONFLICT (modify/delete): drivers/staging/rtl8188eu/os_dep/os_intfs.c delet=
ed in staging/staging-next and modified in HEAD. Version HEAD of drivers/st=
aging/rtl8188eu/os_dep/os_intfs.c left in tree.
CONFLICT (modify/delete): drivers/staging/rtl8188eu/os_dep/ioctl_linux.c de=
leted in staging/staging-next and modified in HEAD. Version HEAD of drivers=
/staging/rtl8188eu/os_dep/ioctl_linux.c left in tree.
CONFLICT (modify/delete): drivers/staging/rtl8188eu/include/osdep_intf.h de=
leted in staging/staging-next and modified in HEAD. Version HEAD of drivers=
/staging/rtl8188eu/include/osdep_intf.h left in tree.
CONFLICT (content): Merge conflict in drivers/staging/r8188eu/os_dep/rtw_an=
droid.c
CONFLICT (content): Merge conflict in drivers/staging/r8188eu/include/rtw_a=
ndroid.h
CONFLICT (content): Merge conflict in drivers/misc/Kconfig
$ git rm -f drivers/staging/rtl8188eu/include/osdep_intf.h drivers/staging/=
rtl8188eu/os_dep/ioctl_linux.c drivers/staging/rtl8188eu/os_dep/os_intfs.c
Applying: fixup for "staging: rtlwifi: use siocdevprivate"
Merging iio/togreg (6a25893cb0e2 iio: dac: max5821: convert device register=
 to device managed function)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (8bf5d31c4f06 interconnect: qcom: osm-l3: Use driver-s=
pecific naming)
Merging dmaengine/next (9760383b22ed Merge tag 'v5.14-rc5' into next)
Merging cgroup/for-next (047298a083a0 Merge branch 'for-5.15' into for-next)
Merging scsi/for-next (b697c84780d3 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (f5efd4fe78de scsi: ufs: core: Add lu_enable sysf=
s node)
Merging vhost/linux-next (db7b337709a1 virtio-mem: prioritize unplug from Z=
ONE_MOVABLE in Big Block Mode)
Merging rpmsg/for-next (c93ca5f21d93 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (e9a13babd69f MAINTAINERS: update gpio-zynq=
.yaml reference)
Merging gpio-intel/for-next (40bb0e3e270a gpio: ml-ioh: Convert to dev_pm_o=
ps)
Merging pinctrl/for-next (dc715ae993c5 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (2f658f7a3953 pinctrl: tigerlake: Fix GPIO m=
apping for newer version of software)
Merging pinctrl-renesas/renesas-pinctrl (91d1be9fb7d6 pinctrl: renesas: Fix=
 pin control matching on R-Car H3e-2G)
Merging pinctrl-samsung/for-next (70115558ab02 pinctrl: samsung: Fix pinctr=
l bank pin count)
Merging pwm/for-next (f4a8e31ed84e pwm: ep93xx: Ensure configuring period a=
nd duty_cycle isn't wrongly skipped)
Merging userns/for-next (534471c614f8 Merge of ucount-fixes-for-5.14, and s=
iginfo-si_trapno-for-v5.15 for testing in linux-next)
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging kselftest/next (2734d6c1b1a0 Linux 5.14-rc2)
Merging livepatching/for-next (c150bbbb1731 Merge branch 'for-5.13/signal' =
into for-next)
Merging coresight/next (1efbcec2ef8c coresight: cti: Reduce scope for the v=
ariable =E2=80=9Ccs_fwnode=E2=80=9D in cti_plat_create_connection())
Merging rtc/rtc-next (1d1bb12a8b18 rtc: Improve performance of rtc_time64_t=
o_tm(). Add tests.)
$ git reset --hard HEAD^
Merging next-20210809 version of rtc
Merging nvdimm/libnvdimm-for-next (30c10d32152d Merge branch 'for-5.12/cxl'=
 into libnvdimm-for-next)
Merging at24/at24/for-next (658ae44345c1 dt-bindings: at24: add ON Semi CAT=
24C04 and CAT24C05)
Merging ntb/ntb-next (28293b6c68cd ntb: ntb_pingpong: remove redundant init=
ialization of variables msg_data and spad_data)
Merging seccomp/for-next/seccomp (19d67694745c Documentation: seccomp: Fix =
typo in user notification)
Merging kspp/for-next/kspp (b88972649fa0 lib/test_stackinit: Add assigned i=
nitializers)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (0f79ce970e79 gnss: drop stray semicolons)
Merging fsi/next (9ab1428dfe2c fsi/sbefifo: Fix reset timeout)
Merging slimbus/for-next (e5c578adcdd9 slimbus: ngd: reset dma setup during=
 runtime pm)
Merging nvmem/for-next (d99b1ea3d191 nvmem: qfprom: sc7280: Handle the addi=
tional power-domains vote)
Merging xarray/main (2c7e57a02708 idr test suite: Improve reporting from id=
r_find_test_1)
Merging hyperv/hyperv-next (7aff79e297ee Drivers: hv: Enable Hyper-V code t=
o be built on ARM64)
Merging auxdisplay/auxdisplay (24ebc044c72e auxdisplay: Replace symbolic pe=
rmissions with octal permissions)
Merging kgdb/kgdb/for-next (e868f0a3c4b9 kdb: Rename members of struct kdbt=
ab_t)
Merging hmm/hmm (fe07bfda2fb9 Linux 5.12-rc1)
Merging fpga/for-next (4f45f3404960 spi: spi-altera-dfl: support n5010 feat=
ure revision)
Merging kunit/test (e73f0f0ee754 Linux 5.14-rc1)
Merging cfi/cfi/next (ff1176468d36 Linux 5.14-rc3)
Merging kunit-next/kunit (2734d6c1b1a0 Linux 5.14-rc2)
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mhi/mhi-next (813272ed5238 Merge 5.14-rc5 into char-misc-next)
Merging memblock/for-next (a4d5613c4dc6 arm: extend pfn_valid to take into =
account freed memory map alignment)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (e71ba9452f0b Linux 5.11-rc2)
Merging rust/rust-next (5d3986cf8ed6 MAINTAINERS: Rust)
CONFLICT (content): Merge conflict in include/linux/kallsyms.h
CONFLICT (content): Merge conflict in Makefile
Merging cxl/next (5b68705d1e63 cxl/pci: Simplify register setup)
Merging folio/for-next (5abf14e471d1 mm/filemap: Add FGP_STABLE)
CONFLICT (content): Merge conflict in mm/rmap.c
CONFLICT (content): Merge conflict in mm/filemap.c
Merging akpm-current/current (688897753315 selftests/memfd: remove unused v=
ariable)
CONFLICT (content): Merge conflict in mm/page-writeback.c
CONFLICT (content): Merge conflict in mm/memcontrol.c
CONFLICT (content): Merge conflict in include/linux/sched.h
CONFLICT (content): Merge conflict in include/linux/memcontrol.h
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (52275cd68d7e arch: remove compat_alloc_user_space)

--Sig_/WgAv8KVaC0tV0_Kj=qQ9BbO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmESPbgACgkQAVBC80lX
0Gx45Af7BjSaCrLpNgdicMifxQ3+ooxHJm7AwgmkyKsnEaPBInyCuyXWvbN0i549
NqrakhrzQoRJUWbbP0hgxh2cgofVMm1VYXeOpfS0hoMs1qG/uVF+YdZrAgZeu+o1
V3THxa+zFNc5MwRXrKrYJss5lyhuODj6bOmevuZjFJBUKuvGweRu/KRrg3ZPHbvX
9ef0W8d+hd04b5F97s63vbMxn7KQm8pTBjY19bw1fpGgJ5EnKIoac/7C5JfX1BM3
or62Ra2IXYIm2vOLj6nKdT5MqfUzJ+Y5zs1JGmc6M5ZlCVvA9SgP8gpIgH6rJ61i
uxgIbw/uPcYDg/FxCI3IY2TyWFIMpA==
=PJRe
-----END PGP SIGNATURE-----

--Sig_/WgAv8KVaC0tV0_Kj=qQ9BbO--
