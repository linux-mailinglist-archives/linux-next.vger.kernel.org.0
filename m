Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 603F538036F
	for <lists+linux-next@lfdr.de>; Fri, 14 May 2021 07:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231264AbhENFlz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 14 May 2021 01:41:55 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:38497 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231191AbhENFlz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 14 May 2021 01:41:55 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FhHSB62D8z9sWP;
        Fri, 14 May 2021 15:40:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620970842;
        bh=M3AVLiaeZuqRgmGdZ67dkx5zPSoQrdQ/hFsNp0+xitE=;
        h=Date:From:To:Cc:Subject:From;
        b=X08dPt4mm4nqh39jfkpyPUvw3XBL7qC9Uw6hrL5/0OFmtWVbWO2iZCDy2td7y8b0s
         e5kJx+IxZ0rB6c6gA0ddMbo64f+OaKf4vrWvxGJIZddlFij8B6tDAE337nAZWF1dJW
         7vnmdMQpxAaa+8JX7vrgAmP40QYqQrcmS/UeqY1D3LbmQz+acGXGXH4bkkfkxeR4cT
         Qq0HTfOJdq+LpvChPoxLLLtrO/BJvixcXlafMI6N2kzPGImQzMaWUdPyLLKWLWvGiU
         NFQma7Ide4ga3jsRSLiHQGbzEZ6J8WTW1MwNMLQIqy9pDsYdey1atgFNoSRFAXGqKL
         kJmELag1ChDDw==
Date:   Fri, 14 May 2021 15:40:41 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 14
Message-ID: <20210514154041.7bd27647@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7TCLWPaM5/.Zgpr_rZKAKe0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7TCLWPaM5/.Zgpr_rZKAKe0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210513:

Removed trees:	(not updated in more than a year)
	fbdev, fsl, generic-ioremap, ieee1394, random, realtek,
	thermal-rzhang, thermal-soc, y2038, zx2c4

The net-next tree gained a build failure for which I reverted 2 commits.

The drm-misc tree lost its build failure.

The tip tree lost its build failure.

The akpm-current lost all its build failures.

Non-merge commits (relative to Linus' tree): 2538
 2681 files changed, 106608 insertions(+), 27888 deletions(-)

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

I am currently merging 332 trees (counting Linus' and 89 trees of bug
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
Merging origin/master (315d99318179 Merge tag 'pm-5.13-rc2' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging fixes/fixes (c06a2ba62fc4 Merge tag 'docs-5.13-3' of git://git.lwn.=
net/linux)
Merging kbuild-current/fixes (b741596468b0 Merge tag 'riscv-for-linus-5.13-=
mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging arc-current/for-curr (1d5e4640e5df ARC: mm: Use max_high_pfn as a H=
IGHMEM zone border)
Merging arm-current/fixes (d2f7eca60b29 ARM: 9071/1: uprobes: Don't hook on=
 thumb instructions)
Merging arm64-fixes/for-next/fixes (af44068c581c arm64: tools: Add __ASM_CP=
UCAPS_H to the endif in cpucaps.h)
Merging arm-soc-fixes/arm/fixes (b5144a2bf401 dt-bindings: nvmem: mediatek:=
 remove duplicate mt8192 line)
Merging drivers-memory-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging m68k-current/for-linus (34e5269bf987 m68k: sun3x: Remove unneeded s=
emicolon)
Merging powerpc-fixes/fixes (da3bb206c9ce KVM: PPC: Book3S HV: Fix kvm_unma=
p_gfn_range_hv() for Hash MMU)
Merging s390-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (e4df1b0c2435 openvswitch: meter: fix race when getting =
now_ms.)
Merging bpf/master (c87db2405fe8 bpf: Fix BPF_JIT kconfig symbol dependency)
Merging ipsec/master (b515d2637276 xfrm: xfrm_state_mtu should return at le=
ast 1280 for ipv6)
Merging netfilter/master (440c3247cba3 net: ipa: memory region array is var=
iable size)
Merging ipvs/master (bbd6f0a94813 bnxt_en: Fix RX consumer index logic in t=
he error path.)
Merging wireless-drivers/master (6efb943b8616 Linux 5.13-rc1)
Merging mac80211/master (440c3247cba3 net: ipa: memory region array is vari=
able size)
Merging rdma-fixes/for-rc (54d87913f147 RDMA/core: Prevent divide-by-zero e=
rror triggered by the user)
Merging sound-current/for-linus (f2be77fee648 ALSA: hda/realtek: Add fixup =
for HP Spectre x360 15-df0xxx)
Merging sound-asoc-fixes/for-linus (f8d7222f9f6a Merge remote-tracking bran=
ch 'asoc/for-5.13' into asoc-linus)
Merging regmap-fixes/for-linus (6efb943b8616 Linux 5.13-rc1)
Merging regulator-fixes/for-linus (0617eecaa19d Merge remote-tracking branc=
h 'regulator/for-5.13' into regulator-linus)
Merging spi-fixes/for-linus (f0c7e97bd7ef Merge remote-tracking branch 'spi=
/for-5.13' into spi-linus)
Merging pci-current/for-linus (2ee4c8a26876 MAINTAINERS: Add Krzysztof as P=
CI host/endpoint controllers reviewer)
Merging driver-core.current/driver-core-linus (bb4031b8af80 clk: Skip clk p=
rovider registration when np is NULL)
Merging tty.current/tty-linus (3c35d2a960c0 serial: 8250_dw: Add device HID=
 for new AMD UART controller)
Merging usb.current/usb-linus (975f94c7d6c3 usb: core: hub: fix race condit=
ion about TRSMRCY of resume)
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (f8e8c1b2f782 USB: serial: pl2303: add d=
evice id for ADLINK ND-6530 GC)
Merging usb-chipidea-fixes/for-usb-fixes (3b414d1b0107 usb: cdnsp: Fix lack=
 of removing request from pending list.)
Merging phy/fixes (6efb943b8616 Linux 5.13-rc1)
Merging staging.current/staging-linus (ba9c25d94dea Merge tag 'iio-fixes-5.=
13a' of https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into stag=
ing-linus)
Merging iio-fixes/fixes-togreg (703190407039 iio: dac: ad5770r: Put fwnode =
in error case during ->probe())
Merging char-misc.current/char-misc-linus (27b57bb76a89 Revert "Revert "ALS=
A: usx2y: Fix potential NULL pointer dereference"")
Merging soundwire-fixes/fixes (da096fbccd52 soundwire: qcom: fix handling o=
f qcom,ports-block-pack-mode)
Merging thunderbolt-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging input-current/for-linus (05665cef4b74 Input: xpad - add support for=
 Amazon Game Controller)
Merging crypto-current/master (e3a606f2c544 fsverity: relax build time depe=
ndency on CRYPTO_SHA256)
Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer)
Merging vfio-fixes/for-linus (cc35518d29bc docs: vfio: fix typo)
Merging kselftest-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging dmaengine-fixes/fixes (538ea65a9fd1 dmaengine: xilinx: dpdma: initi=
alize registers before request_irq)
Merging backlight-fixes/for-backlight-fixes (a38fd8748464 Linux 5.12-rc2)
Merging mtd-fixes/mtd/fixes (562b4e91d3b2 mtd: parsers: ofpart: fix parsing=
 subpartitions)
Merging mfd-fixes/for-mfd-fixes (a61f4661fba4 mfd: intel_quark_i2c_gpio: Re=
vert "Constify static struct resources")
Merging v4l-dvb-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (6efb943b8616 Linux 5.13-rc1)
Merging at91-fixes/at91-fixes (2c69c8a1736e ARM: dts: at91: sam9x60: fix mu=
x-mask to match product's datasheet)
Merging omap-fixes/fixes (fc85dc42a384 ARM: OMAP2+: Fix uninitialized sr_in=
st)
Merging kvm-fixes/master (9c1a07442c95 KVM: x86/xen: Take srcu lock when ac=
cessing kvm_memslots())
Merging kvms390-fixes/master (735931f9a51a MAINTAINERS: add uv.c also to KV=
M/s390)
Merging hwmon-fixes/hwmon (95b798bdb199 hwmon: (dell-smm-hwmon) Fix index v=
alues)
Merging nvdimm-fixes/libnvdimm-fixes (de80d5781136 Merge branch 'for-5.13/d=
ax' into libnvdimm-fixes)
Merging cxl-fixes/fixes (fae8817ae804 cxl/mem: Fix memory device capacity p=
robing)
Merging btrfs-fixes/next-fixes (2e4f4de38d26 Merge branch 'misc-5.13' into =
next-fixes)
Merging vfs-fixes/fixes (173e84953eaa fs: fix reporting supported extra fil=
e attributes for statx())
Merging dma-mapping-fixes/for-linus (18a3c5f7abfd Merge tag 'for_linus' of =
git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging i3c-fixes/i3c/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging drivers-x86-fixes/fixes (a3790a8a94fc platform/x86: intel-hid: Fix =
spurious wakeups caused by tablet-mode events during suspend)
Merging samsung-krzk-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging pinctrl-samsung-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging devicetree-fixes/dt/linus (0bd50826a40e leds: Fix reference file na=
me of documentation)
Merging scsi-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging drm-fixes/drm-fixes (875d598db60a MAINTAINERS: Update address for E=
mma Anholt)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (e4527420ed08 drm/i915: Use co=
rrect downstream caps for check Src-Ctl mode for PCON)
Merging mmc-fixes/fixes (a1149a6c06ee mmc: sdhci-pci-gli: increase 1.8V reg=
ulator wait)
Merging rtc-fixes/rtc-fixes (bd33335aa93d rtc: cmos: Disable irq around dir=
ect invocation of cmos_interrupt())
Merging gnss-fixes/gnss-linus (a38fd8748464 Linux 5.12-rc2)
Merging hyperv-fixes/hyperv-fixes (37df9f3fedb6 video: hyperv_fb: Fix a dou=
ble free in hvfb_probe)
Merging soc-fsl-fixes/fix (2663b3388551 soc: fsl: dpio: Get the cpumask thr=
ough cpumask_of(cpu))
Merging risc-v-fixes/fixes (18a3c5f7abfd Merge tag 'for_linus' of git://git=
.kernel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging pidfd-fixes/fixes (03ba0fe4d09f file: simplify logic in __close_ran=
ge())
Merging fpga-fixes/fixes (2e8496f31d0b firmware: stratix10-svc: reset COMMA=
ND_RECONFIG_FLAG_PARTIAL to 0)
Merging spdx/spdx-linus (6efb943b8616 Linux 5.13-rc1)
Merging gpio-brgl-fixes/gpio/for-current (bdbe871ef0ca gpio: tegra186: Don'=
t set parent IRQ affinity)
Merging gpio-intel-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging pinctrl-intel-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging erofs-fixes/fixes (0852b6ca941e erofs: fix 1 lcluster-sized pcluste=
r for big pcluster)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (7fd53f41f771 kunit: tool: Disable PAGE_POI=
SONING under --alltests)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (17cbe03872be mm/memblock: Fix typo in comment=
 of memblock_phys_alloc_try_nid())
Merging cel-fixes/for-rc (9f4ad9e425a1 Linux 5.12)
Merging drm-misc-fixes/for-linux-next-fixes (c55b44c9386f Merge drm/drm-fix=
es into drm-misc-fixes)
Merging kspp-gustavo/for-next/kspp (36f9ff9e03de lib: Fix fall-through warn=
ings for Clang)
Merging kbuild/for-next (9324130f65f6 Makefile: extend 32B aligned debug op=
tion to 64B aligned)
Merging compiler-attributes/compiler-attributes (ca0760e7d79e Compiler Attr=
ibutes: Add continue in comment)
Merging dma-mapping/for-next (a7f3d3d3600c dma-mapping: add unlikely hint t=
o error path in dma_mapping_error)
Merging asm-generic/master (d74ebb76967f Merge branch 'asm-generic-unaligne=
d' into asm-generic)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (d3506d256d94 Merge branch 'misc' into for-next)
Merging arm64/for-next/core (c76fba33467b arm64: kernel: Update the stale c=
omment)
Merging arm-perf/for-next/perf (2c2e21e78a94 arm64: perf: Remove redundant =
initialization in perf_event.c)
Merging arm-soc/for-next (6efb943b8616 Linux 5.13-rc1)
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (09dc799bceb5 Merge branch 'v5.13/fixes' into tmp/=
aml-rebuild)
Merging aspeed/for-next (61fbc42084f4 Merge branches 'wpcm450-for-v5.13', '=
dt-for-v5.13' and 'lpc-for-v5.13' into for-next)
Merging at91/at91-next (969bbb49f36c Merge branch 'at91-dt' into at91-next)
Merging drivers-memory/for-next (907c5bbb514a memory: atmel-ebi: add missin=
g of_node_put for loop iteration)
Merging imx-mxs/for-next (b1d96e9c8a6e Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (9d2e21ed98a2 Merge branch 'for_5.12/drivers-soc' int=
o next)
Merging mediatek/for-next (fd450fd2a4fb Merge branch 'v5.13-next/soc' into =
for-next)
Merging mvebu/for-next (79e93f9dc81a Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (44e97f6fb29b Merge branch 'fixes' into for-next)
Merging qcom/for-next (0109038cffef Merge branches 'arm64-defconfig-for-5.1=
3', 'arm64-for-5.13', 'defconfig-for-5.13', 'drivers-for-5.13' and 'dts-for=
-5.13' into for-next)
Merging raspberrypi/for-next (fbdcf1d20126 ARM: dts: bcm2711: Add the CEC i=
nterrupt controller)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/bcm2711.dtsi
Merging renesas/next (81ca6c161d39 Merge branch 'renesas-arm-dt-for-v5.14' =
into renesas-next)
Merging reset/reset/next (e207457f9045 reset: brcmstb: Add missing MODULE_D=
EVICE_TABLE)
Merging rockchip/for-next (0ac75916f338 Merge branch 'v5.14-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (6fed39b8b597 Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (79053496a28d Merge tag 'scmi-fixes-5.13' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-lin=
ux-next)
Merging stm32/stm32-next (6ed9269265e1 ARM: dts: stm32: Add PTP clock to Et=
hernet controller)
Merging sunxi/sunxi/for-next (401c54f3951e Merge branches 'sunxi/core-for-5=
.14' and 'sunxi/dt-for-5.14' into sunxi/for-next)
Merging tegra/for-next (93b9ea9ca307 Merge branch for-5.13/arm64/dt into fo=
r-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (6efb943b8616 Linux 5.13-rc1)
Merging xilinx/for-next (6efb943b8616 Linux 5.13-rc1)
Merging clk/clk-next (6efb943b8616 Linux 5.13-rc1)
Merging clk-imx/for-next (737dd8f333f0 clk: imx: Remove the audio ipg clock=
 from imx8mp)
Merging clk-renesas/renesas-clk (6bd913f54f2f clk: renesas: r9a06g032: Swit=
ch to .determine_rate())
Merging clk-samsung/for-next (a38fd8748464 Linux 5.12-rc2)
Merging csky/linux-next (280af034a71d csky: Kconfig: Remove unused selects)
Merging h8300/h8300-next (6e5e55227c95 Merge tag 'v5.11' into h8300-next)
Merging m68k/for-next (eeff86b6d18c m68k: dma: Remove unnecessary include o=
f asm/cacheflush.h)
Merging m68knommu/for-next (6efb943b8616 Linux 5.13-rc1)
Merging microblaze/next (6efb943b8616 Linux 5.13-rc1)
Merging mips/mips-next (33ae8f801ad8 hugetlb: clear huge pte during flush f=
unction on mips platform)
Merging nds32/next (40e0dd851e7b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (1683f7de65db soc: litex: Remove duplicated heade=
r file inclusion)
Merging parisc-hd/for-next (9f4ad9e425a1 Linux 5.12)
Merging powerpc/next (f96271cefe6d Merge branch 'master' into next)
Merging soc-fsl/next (242b0b398ccd soc: fsl: enable acpi support in RCPM dr=
iver)
Merging risc-v/for-next (beaf5ae15a13 riscv: remove unused handle_exception=
 symbol)
Merging s390/for-next (6efb943b8616 Linux 5.13-rc1)
Merging sh/for-next (2882b7626f49 sh: kernel: traps: remove unused variable)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (ed102bf2afed um: Fix W=3D1 missing-include-dirs war=
nings)
Merging xtensa/xtensa-for-next (6a8eb99e130f xtensa: ISS: add GDBIO impleme=
ntation to semihosting interface)
Merging pidfd/for-next (8fac44cbbaa2 Merge branch 'fs/idmapped_mounts/helpe=
rs' into for-next)
Merging fscrypt/master (a14d0b676491 fscrypt: allow deleting files with uns=
upported encryption policy)
Merging fscache/fscache-next (3003bbd0697b afs: Use the netfs_write_begin()=
 helper)
Merging afs/afs-next (7af08140979a Revert "gcov: clang: fix clang-11+ build=
")
Merging btrfs/for-next (9e6dd507c69e Merge branch 'fixes-for-master' into f=
or-next-20210514)
CONFLICT (content): Merge conflict in fs/btrfs/zoned.c
Merging ceph/master (0e1c1526416f Merge commit 'ed94f87c2b123241ae5644cf823=
27e2da653adb6')
Merging cifs/for-next (e87dbd1cec70 Fix kernel oops when CONFIG_DEBUG_ATOMI=
C_SLEEP is enabled.)
Merging cifsd/cifsd-for-next (2018da7d40e5 Merge pull request #46 from namj=
aejeon/cifsd-for-next)
Merging configfs/for-next (14fbbc829772 configfs: fix a use-after-free in _=
_configfs_open_file)
Merging ecryptfs/next (682a8e2b41ef Merge tag 'ecryptfs-5.13-rc1-updates' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs)
Merging erofs/dev (8e6c8fa9f2e9 erofs: enable big pcluster feature)
Merging exfat/dev (b741596468b0 Merge tag 'riscv-for-linus-5.13-mw1' of git=
://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging ext3/for_next (2335e1b8ee3b Pull MAINTAINERS file update.)
Merging ext4/dev (6c0912739699 ext4: wipe ext4_dir_entry2 upon file deletio=
n)
Merging f2fs/dev (f395183f9544 f2fs: return EINVAL for hole cases in swap f=
ile)
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (3c9c14338c12 cuse: simplify refcount)
Merging jfs/jfs-next (b462cecfa323 fs: Fix typo issue)
Merging nfs/linux-next (9e895cd9649a xprtrdma: Fix a NULL dereference in fr=
wr_unmap_sync())
Merging nfs-anna/linux-next (4f8be1f53bf6 nfs: we don't support removing sy=
stem.nfs4_acl)
Merging nfsd/nfsd-next (c3213d260a23 SUNRPC: Fix oops in the rpc_xdr_buf ev=
ent class)
Merging cel/for-next (b9f83ffaa0c0 SUNRPC: Fix null pointer dereference in =
svc_rqst_free())
Merging orangefs/for-next (211f9f2e0503 orangefs: leave files in the page c=
ache for a few micro seconds at least)
Merging overlayfs/overlayfs-next (5e717c6fa41f ovl: add debug print to ovl_=
do_getxattr())
Merging ubifs/next (9a29f7f020e0 ubi: Remove unnecessary struct declaration)
Merging v9fs/9p-next (f8b139e2f241 fs: 9p: fix v9fs_file_open writeback fid=
 error check)
Merging xfs/for-next (8e9800f9f2b8 xfs: don't allow log writes if the data =
device is readonly)
Merging zonefs/for-next (6980d29ce4da zonefs: fix to update .i_wr_refcnt co=
rrectly in zonefs_open_zone())
Merging iomap/iomap-for-next (6e552494fb90 iomap: remove unused private fie=
ld from ioend)
Merging djw-vfs/vfs-for-next (9b8523423b23 vfs: move __sb_{start,end}_write=
* to fs.h)
Merging file-locks/locks-next (cbe6fc4e0142 fs/locks: remove useless assign=
ment in fcntl_getlk)
Merging vfs/for-next (e8727aec724e Merge branch 'work.misc' into for-next)
Merging printk/for-next (a386d19acc30 Merge branch 'for-5.13' into for-next)
Merging pci/next (6efb943b8616 Linux 5.13-rc1)
Merging pstore/for-next/pstore (9d843e8fafc7 pstore: Add mem_type property =
DT parsing support)
Merging hid/for-next (5b95bf4cc297 Merge branch 'for-5.13/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (f9743e4d0a62 Merge branch 'i2c/for-5.13' into i2c=
/for-next)
Merging i3c/i3c/next (0d95f41ebde4 Revert "i3c master: fix missing destroy_=
workqueue() on error in i3c_master_register")
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (80ceb2c97b78 hwmon: (adm1275) enable adm1=
272 temperature reporting)
Merging jc_docs/docs-next (2c5ff2caa4f8 docs: usb: function: Modify path na=
me)
Merging v4l-dvb/master (73edc4da4063 media: staging: media: atomisp: pci: F=
ormat comments according to coding-style in file atomisp_cmd.h)
Merging v4l-dvb-next/master (bf05bf16c76b Linux 5.12-rc8)
Merging pm/linux-next (cb7accda3e01 Merge branch 'devprop' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (dbbd49bade05 cpufreq: armada-37=
xx: Fix module unloading)
Merging cpupower/cpupower (a38fd8748464 Linux 5.12-rc2)
Merging devfreq/devfreq-next (0a7dc8318c28 PM / devfreq: imx8m-ddrc: Remove=
 unneeded of_match_ptr())
Merging opp/opp/linux-next (a8bb0e872bfb memory: samsung: exynos5422-dmc: C=
onvert to use resource-managed OPP API)
Merging thermal/thermal/linux-next (c310e546164d thermal/drivers/mtk_therma=
l: Remove redundant initializations of several variables)
Merging dlm/next (2fd8db2dd05d fs: dlm: fix missing unlock on error in acce=
pt_from_sock())
Merging swiotlb/linux-next (dfc06b389a4f swiotlb: don't override user speci=
fied size in swiotlb_adjust_size)
Merging rdma/for-next (6efb943b8616 Linux 5.13-rc1)
Merging net-next/master (ea89c862f01e net: mana: Use struct_size() in kzall=
oc())
Applying: usb: class: cdc-wdm: fix for kill_urbs() removal
Merging bpf-next/for-next (3f2870989f10 bpf, arm64: Replace STACK_ALIGN() w=
ith round_up() to align stack size)
Merging ipsec-next/master (747b67088f8d xfrm: ipcomp: remove unnecessary ge=
t_cpu())
Merging mlx5-next/mlx5-next (63f9c44bca5e net/mlx5: Add MEMIC operations re=
lated bits)
Merging netfilter-next/master (faa5f5da809b net/sched: taprio: Drop unneces=
sary NULL check after container_of)
Merging ipvs-next/master (99ba0ea616aa sfc: adjust efx->xdp_tx_queue_count =
with the real number of initialized queues)
Merging wireless-drivers-next/master (6efb943b8616 Linux 5.13-rc1)
Merging bluetooth/master (9159c7ac15ba Bluetooth: btbcm: Add entry for BCM4=
3430B0 UART Bluetooth)
Merging mac80211-next/master (faa5f5da809b net/sched: taprio: Drop unnecess=
ary NULL check after container_of)
Merging gfs2/for-next (a673e827f904 gfs2: Fix mmap + page fault deadlock)
Merging mtd/mtd/next (cc9d663a00a0 drivers: mtd: sm_ftl: Fix alignment of b=
lock comment)
Merging nand/nand/next (fd0d8d85f723 mtd: nand: bbt: Fix corner case in bad=
 block table handling)
Merging spi-nor/spi-nor/next (46094049a49b Revert "mtd: spi-nor: macronix: =
Add support for mx25l51245g")
Merging crypto/master (e3a606f2c544 fsverity: relax build time dependency o=
n CRYPTO_SHA256)
Merging drm/drm-next (6efb943b8616 Linux 5.13-rc1)
Applying: merge fix for "drm: Switch to %p4cc format modifier"
Merging drm-misc/for-linux-next (5c439c38f5fb drm/amdgpu: fix fence calcula=
tion (v2))
Merging amdgpu/drm-next (baa795d8b9aa drm/amdgpu/display: restore the backl=
ight on modeset (v2))
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_vra=
m_mgr.c
Merging drm-intel/for-linux-next (73c1bf0f3ed8 drm/i915/perf: Enable OA for=
mats for ADL_P)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_pm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/vlv_dsi.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_fb=
c.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_di=
splay.c
Merging drm-tegra/drm/tegra/for-next (c79184a9c029 drm/tegra: Fix shift ove=
rflow in tegra_shared_plane_atomic_update)
Merging drm-msm/msm-next (f2f46b878777 drm/msm/dp: initialize audio_comp wh=
en audio starts)
Merging imx-drm/imx-drm/next (fc1e985b67f9 drm/imx: ipuv3-plane: add color =
encoding and range properties)
Merging etnaviv/etnaviv/next (4bfdd2aa67fb drm/etnaviv: rework linear windo=
w offset calculation)
Merging regmap/for-next (6efb943b8616 Linux 5.13-rc1)
Merging sound/for-next (f2be77fee648 ALSA: hda/realtek: Add fixup for HP Sp=
ectre x360 15-df0xxx)
Merging sound-asoc/for-next (d73b92b54458 Merge remote-tracking branch 'aso=
c/for-5.14' into asoc-next)
Merging modules/modules-next (33121347fb1c module: treat exit sections the =
same as init sections when !CONFIG_MODULE_UNLOAD)
Merging input/next (d12b64b9764e MAINTAINERS: repair reference in HYCON HY4=
6XX TOUCHSCREEN SUPPORT)
Merging block/for-next (6abfea218e2e Merge branch 'for-5.14/block' into for=
-next)
Merging device-mapper/for-next (bc8f3d4647a9 dm integrity: fix sparse warni=
ngs)
Merging pcmcia/pcmcia-next (e9d503fef7da pcmcia: rsrc_nonstatic: Fix call-b=
ack function as reference formatting)
Merging mmc/next (3fb6180b0b97 mmc: core: Add support for cache ctrl for SD=
 cards)
Merging mfd/for-mfd-next (f9386c91574f mfd: intel-m10-bmc: Add support for =
MAX10 BMC Secure Updates)
Merging backlight/for-backlight-next (04758386757c backlight: journada720: =
Fix Wmisleading-indentation warning)
Merging battery/for-next (2aac79d14d76 power: supply: sc2731_charger: Add m=
issing MODULE_DEVICE_TABLE)
Merging regulator/for-next (1d8154780f58 Merge remote-tracking branch 'regu=
lator/for-5.14' into regulator-next)
Merging security/next-testing (047843bdb316 Merge branch 'landlock_lsm_v34'=
 into next-testing)
Merging apparmor/apparmor-next (d108370c644b apparmor: fix error check)
Merging integrity/next-integrity (781a57394899 ima: ensure IMA_APPRAISE_MOD=
SIG has necessary dependencies)
Merging keys/keys-next (e377c31f788f integrity: Load mokx variables into th=
e blacklist keyring)
CONFLICT (content): Merge conflict in certs/system_keyring.c
Merging safesetid/safesetid-next (1ca86ac1ec8d LSM: SafeSetID: Fix code spe=
cification by scripts/checkpatch.pl)
Merging selinux/next (fd781f459b60 selinux: Remove redundant assignment to =
rc)
Merging smack/next (49ec114a6e62 smackfs: restrict bytes count in smk_set_c=
ipso())
Merging tomoyo/master (6efb943b8616 Linux 5.13-rc1)
Merging tpmdd/next (1df83992d977 tpm: fix error return code in tpm2_get_cc_=
attrs_tbl())
Merging watchdog/master (bf05bf16c76b Linux 5.12-rc8)
Merging iommu/next (2d471b20c55e iommu: Streamline registration interface)
Merging audit/next (254c8b96c4af audit: add blank line after variable decla=
rations)
Merging devicetree/for-next (d1dd216738f5 dt-bindings: timer: renesas,tpu: =
Convert to json-schema)
Merging mailbox/mailbox-for-next (2335f556b3af dt-bindings: mailbox: qcom-i=
pcc: Add compatible for SC7280)
Merging spi/for-next (4089d045f670 Merge remote-tracking branch 'spi/for-5.=
14' into spi-next)
Merging tip/auto-latest (aa96d0d0b147 Merge branch 'core/urgent')
Merging clockevents/timers/drivers/next (8120891105ba dt-bindings: timer: n=
uvoton,npcm7xx: Add wpcm450-timer)
Merging edac/edac-for-next (89f5f8fb5bf4 EDAC/thunderx: Remove irrelevant v=
ariable from error messages)
Merging irqchip/irq/irqchip-next (5b44955dc198 irqchip/apple-aic: APPLE_AIC=
 should depend on ARCH_APPLE)
Merging ftrace/for-next (8c9af478c06b ftrace: Handle commands when closing =
set_ftrace_filter file)
Merging rcu/rcu/next (471bbaea5179 torture: Make torture.sh accept --do-all=
 and --donone)
Merging kvm/next (ce7ea0cfdc2e KVM: SVM: Move GHCB unmapping to fix RCU war=
ning)
Merging kvm-arm/next (9a8aae605b80 Merge branch 'kvm-arm64/kill_oprofile_de=
pendency' into kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (72476aaa4691 KVM: PPC: Book3S HV: Fix host ra=
dix SLB optimisation with hash guests)
Merging kvms390/next (44bada282190 KVM: s390: fix guarded storage control r=
egister handling)
Merging xen-tip/linux-next (dbc03e81586f xen/unpopulated-alloc: fix error r=
eturn code in fill_list())
Merging percpu/for-next (cd43fce65b39 Merge branch 'for-5.14' into for-next)
Merging workqueues/for-next (89e28ce60cb6 workqueue/watchdog: Make unbound =
workqueues aware of touch_softlockup_watchdog() 84;0;0c84;0;0c There are tw=
o workqueue-specific watchdog timestamps:)
Merging drivers-x86/for-next (e7882cd7aebe platform/x86: gigabyte-wmi: add =
support for B550M AORUS PRO-P)
Merging chrome-platform/for-next (6efb943b8616 Linux 5.13-rc1)
Merging hsi/for-next (6efb943b8616 Linux 5.13-rc1)
Merging leds/for-next (ee522bcf026e leds: tlc591xx: fix return value check =
in tlc591xx_probe())
Merging ipmi/for-next (2253042d86f5 ipmi/watchdog: Stop watchdog timer when=
 the current action is 'none')
Merging driver-core/driver-core-next (6efb943b8616 Linux 5.13-rc1)
Merging usb/usb-next (4676be28a46e usb: xhci-mtk: use first-fit for LS/FS)
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (6efb943b8616 Linux 5.13-rc1)
Merging usb-chipidea-next/for-usb-next (4ae08bc23e1b usb: cdnsp: Useless co=
ndition has been removed)
Merging tty/tty-next (6efb943b8616 Linux 5.13-rc1)
Merging char-misc/char-misc-next (6efb943b8616 Linux 5.13-rc1)
Merging extcon/extcon-next (7b1222b224af extcon: qcom-spmi: Add support for=
 VBUS detection)
Merging phy-next/next (6efb943b8616 Linux 5.13-rc1)
Merging soundwire/next (037219925e7a soundwire: dmi-quirks: remove duplicat=
e initialization)
Merging thunderbolt/next (6efb943b8616 Linux 5.13-rc1)
Merging vfio/next (adaeb718d46f vfio/gvt: fix DRM_I915_GVT dependency on VF=
IO_MDEV)
Merging staging/staging-next (f6d5d118462d staging: rtl8192e: Fix whitespac=
e around conditional statement)
Merging iio/togreg (454a2be5d0c1 iio: accel: fxls8962af: fix errata bug E3 =
- I2C burst reads)
CONFLICT (content): Merge conflict in drivers/iio/industrialio-core.c
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (1fd86e280d8b interconnect: qcom: Add missing MODULE_D=
EVICE_TABLE)
Merging dmaengine/next (6f64aa5746d2 dt-bindings: dma: convert arm-pl08x to=
 yaml)
Merging cgroup/for-next (f4f809f66b75 cgroup: inline cgroup_task_freeze())
Merging scsi/for-next (39107e8577ad scsi: aacraid: Replace one-element arra=
y with flexible-array member)
Merging scsi-mkp/for-next (39107e8577ad scsi: aacraid: Replace one-element =
array with flexible-array member)
Merging vhost/linux-next (7ff6e99e021c virtio_net: disable cb aggressively)
Merging rpmsg/for-next (dc0e14fa833b Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (6453b9532b5f gpio: xilinx: No need to disa=
ble IRQs in the handler)
Merging gpio-intel/for-next (6efb943b8616 Linux 5.13-rc1)
Merging pinctrl/for-next (835109266494 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (6efb943b8616 Linux 5.13-rc1)
Merging pinctrl-renesas/renesas-pinctrl (904ec4bebc1d pinctrl: renesas: r8a=
779{51,6,65}: Reduce non-functional differences)
Merging pinctrl-samsung/for-next (6efb943b8616 Linux 5.13-rc1)
Merging pwm/for-next (a6efb35019d0 pwm: Reword docs about pwm_apply_state())
Merging userns/for-next (ef566ba2d7d9 signal: Remove the last few si_perf r=
eferences)
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging kselftest/next (e75074781f17 selftests/resctrl: Change a few printe=
d messages)
Merging livepatching/for-next (c150bbbb1731 Merge branch 'for-5.13/signal' =
into for-next)
Merging coresight/next (1efbcec2ef8c coresight: cti: Reduce scope for the v=
ariable =E2=80=9Ccs_fwnode=E2=80=9D in cti_plat_create_connection())
Merging rtc/rtc-next (4d0185e67806 rtc: sysfs: check features instead of op=
s)
Merging nvdimm/libnvdimm-for-next (30c10d32152d Merge branch 'for-5.12/cxl'=
 into libnvdimm-for-next)
Merging at24/at24/for-next (6efb943b8616 Linux 5.13-rc1)
Merging ntb/ntb-next (5c8fe583cce5 Linux 5.11-rc1)
Merging seccomp/for-next/seccomp (a3fc712c5b37 seccomp: Fix "cacheable" typ=
o in comments)
Merging kspp/for-next/kspp (f4648c741299 Merge branch 'for-next/overflow' i=
nto for-next/kspp)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (994adcbd3714 gnss: drop stray semicolons)
Merging fsi/next (4a851d714ead fsi: aspeed: Support CFAM reset GPIO)
Merging slimbus/for-next (0320ed0a8236 drivers: slimbus: Fix word resposibl=
e -> responsible in slimbus.h)
CONFLICT (content): Merge conflict in drivers/nvmem/Makefile
CONFLICT (content): Merge conflict in drivers/nvmem/Kconfig
Merging nvmem/for-next (e8405ad55f4c nvmem: sprd: Add missing MODULE_DEVICE=
_TABLE)
Merging xarray/main (2c7e57a02708 idr test suite: Improve reporting from id=
r_find_test_1)
Merging hyperv/hyperv-next (8e74d1f319bf scsi: storvsc: Use blk_mq_unique_t=
ag() to generate requestIDs)
CONFLICT (content): Merge conflict in drivers/hv/ring_buffer.c
Merging auxdisplay/auxdisplay (aecd79c09c2f auxdisplay: Add I2C gpio expand=
er example)
Merging kgdb/kgdb/for-next (83fa2d13d628 kdb: Refactor env variables get/se=
t code)
Merging hmm/hmm (fe07bfda2fb9 Linux 5.12-rc1)
Merging fpga/for-next (ded39fc4a5b4 docs: driver-api: fpga: avoid using UTF=
-8 chars)
Merging kunit/test (a38fd8748464 Linux 5.12-rc2)
Merging cfi/cfi/next (f3907773d602 mtd: cfi_cmdset_0002: remove redundant a=
ssignment to variable timeo)
Merging kunit-next/kunit (de2fcb3e6201 Documentation: kunit: add tips for u=
sing current->kunit_test)
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mhi/mhi-next (a503d1628c9c bus: mhi: fix typo in comments for struc=
t mhi_channel_config)
Merging memblock/for-next (097d43d85704 mm: memblock: remove return value o=
f memblock_free_all())
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (e71ba9452f0b Linux 5.11-rc2)
Merging iomem-mmap-vs-gup/topic/iomem-mmap-vs-gup (ac8b8400620a mm: unexpor=
t follow_pfn)
Merging rust/rust-next (fef0214731cc rust: allow printing in the kernel cra=
te)
CONFLICT (content): Merge conflict in kernel/printk/printk.c
CONFLICT (content): Merge conflict in include/uapi/linux/android/binder.h
CONFLICT (content): Merge conflict in Makefile
Merging cxl/next (e49d033bddf5 Linux 5.12-rc6)
Merging tpmdd-jejb/tpmdd-for-next (69977d1aeeca Merge branch 'tpmdd-fixes' =
into tpmdd-for-next)
Applying: Revert "net: bridge: mcast: export multicast router presence adja=
cent to a port"
Applying: Revert "net: bridge: mcast: split multicast router state for IPv4=
 and IPv6"
Merging akpm-current/current (66df0308c4bf ipc: use kmalloc for msg_queue a=
nd shmid_kernel)
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (edfe7185ef73 kdump: use vmlinux_build_id to simplify)

--Sig_/7TCLWPaM5/.Zgpr_rZKAKe0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCeDVkACgkQAVBC80lX
0GyvvAf/WoqtC0WdIUJW5mU4BA3iPy/J/iQGRQZ86N0FrxEIO94L5P6YZiuiTsxh
w1TtQ9DiyfnboIWXHpK/veuKXNi6slFn3Cqtq8N2LPmn2ZmlkHk9PEYlWyNHdBa2
InupYgIGUt6oVGA5vMNNJZXO2edjTeRWgBQ8H8bfXzH/KlYkFHj7Sl7X4Y5MDscn
H9blWmKQf8zJEQPUi0M1JmD/bZ2AwsmLRD+SQygbYXXvLktB2brYn6n2yxTJgSCf
mraOl9PW6aW3hoqWsGZTxLZUrSjCrSTpIvW56AJ49277R7E3AHlTdVBPbwZ1PZRr
XNcymw7Hw8JCezPbVA3Rt/fAOyNh1w==
=L3In
-----END PGP SIGNATURE-----

--Sig_/7TCLWPaM5/.Zgpr_rZKAKe0--
