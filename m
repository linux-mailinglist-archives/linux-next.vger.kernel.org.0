Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E68A399D7D
	for <lists+linux-next@lfdr.de>; Thu,  3 Jun 2021 11:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbhFCJQC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Jun 2021 05:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhFCJQC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Jun 2021 05:16:02 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F32DC06174A;
        Thu,  3 Jun 2021 02:14:17 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FwgFK6XM9z9sVb;
        Thu,  3 Jun 2021 19:14:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622711654;
        bh=hmU6CszlFvKXVsWFuDvWgWQ2nKV55+c8q80dMedz6mM=;
        h=Date:From:To:Cc:Subject:From;
        b=rc3OXHG3EeZlfmVmZH6pcKtE33a30v0qfzpo+eUyzVXWb27Fy7zKmntnD9ZCaav3D
         lus1J2qRbjGiM4qvYi01Ngj6lCc9wpOSIxk3e3KjMOoTdlHtNwTELW2WVOCUBnhDYx
         dMzmjhxLsYMptecQggled9rGqN1YKtqUQ8fnhgSga+yR08LdPUu/Whe4o29F8Ovx7k
         ozezOSSnOmBQqwE6rxVkCgtRU6R/YF2TF01OiW9fzpr3lC+onyKncKHFYG7YeHosJ3
         oHdkFV4qbQQMrnAFVHkXbvGADOIIYmtVLkwyZLOdW7QvidIu6FfonTfbtuxnqxBfXD
         A0E927QLjtyeg==
Date:   Thu, 3 Jun 2021 19:14:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 3
Message-ID: <20210603191412.5097dcd2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/t.vTyGDx8=WkFDAjpb=Thwh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/t.vTyGDx8=WkFDAjpb=Thwh
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210602:

The net-next tree gained a conflict against the net tree.

The amdgpu tree gained a conflict against the drm-misc tree.

The tip tree gained a conflict against the jc_docs tree.

Non-merge commits (relative to Linus' tree): 6324
 6267 files changed, 297133 insertions(+), 101305 deletions(-)

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

I am currently merging 331 trees (counting Linus' and 89 trees of bug
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
Merging origin/master (324c92e5e0ee Merge tag 'efi-urgent-2021-06-02' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging fixes/fixes (c06a2ba62fc4 Merge tag 'docs-5.13-3' of git://git.lwn.=
net/linux)
Merging kbuild-current/fixes (c4681547bcce Linux 5.13-rc3)
Merging arc-current/for-curr (d07f6ca923ea Linux 5.13-rc2)
Merging arm-current/fixes (d2f7eca60b29 ARM: 9071/1: uprobes: Don't hook on=
 thumb instructions)
Merging arm64-fixes/for-next/fixes (e69012400b0c arm64: mm: don't use CON a=
nd BLK mapping if KFENCE is enabled)
Merging arm-soc-fixes/arm/fixes (d37316b72e8b ARM: npcm: wpcm450: select in=
terrupt controller driver)
Merging drivers-memory-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging m68k-current/for-linus (34e5269bf987 m68k: sun3x: Remove unneeded s=
emicolon)
Merging powerpc-fixes/fixes (d72500f99284 powerpc/64s/syscall: Fix ptrace s=
yscall info with scv syscalls)
Merging s390-fixes/fixes (8124c8a6b353 Linux 5.13-rc4)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (ab00f3e051e8 net: stmmac: fix issue where clk is being =
unprepared twice)
Merging bpf/master (ff40e51043af bpf, lockdown, audit: Fix buggy SELinux lo=
ckdown permission checks)
Merging ipsec/master (b515d2637276 xfrm: xfrm_state_mtu should return at le=
ast 1280 for ipv6)
Merging netfilter/master (8971ee8b0877 netfilter: nfnetlink_cthelper: hit E=
BUSY on updates if size mismatches)
Merging ipvs/master (56e4ee82e850 ipvs: ignore IP_VS_SVC_F_HASHED flag when=
 adding service)
Merging wireless-drivers/master (d4826d17b393 mt76: mt7921: remove leftover=
 80+80 HE capability)
Merging mac80211/master (bddc0c411a45 mac80211: Fix NULL ptr deref for inje=
cted rate info)
Merging rdma-fixes/for-rc (8124c8a6b353 Linux 5.13-rc4)
Merging sound-current/for-linus (ae352822321d ALSA: timer: Fix master timer=
 notification)
Merging sound-asoc-fixes/for-linus (810e72a0e620 Merge remote-tracking bran=
ch 'asoc/for-5.13' into asoc-linus)
Merging regmap-fixes/for-linus (8124c8a6b353 Linux 5.13-rc4)
Merging regulator-fixes/for-linus (8df4fb4ae8f4 Merge remote-tracking branc=
h 'regulator/for-5.13' into regulator-linus)
Merging spi-fixes/for-linus (7ddc37efc148 Merge remote-tracking branch 'spi=
/for-5.13' into spi-linus)
Merging pci-current/for-linus (85aabbd7b315 PCI/MSI: Fix MSIs for generic h=
osts that use device-tree's "msi-map")
Merging driver-core.current/driver-core-linus (8124c8a6b353 Linux 5.13-rc4)
Merging tty.current/tty-linus (8124c8a6b353 Linux 5.13-rc4)
Merging usb.current/usb-linus (6490fa565534 usb: pd: Set PD_T_SINK_WAIT_CAP=
 to 310ms)
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (56df0c758aff USB: serial: omninet: upda=
te driver description)
Merging usb-chipidea-fixes/for-usb-fixes (a9aecef198fa usb: cdnsp: Fix dead=
lock issue in cdnsp_thread_irq_handler)
Merging phy/fixes (b8203ec7f58a phy: ti: Fix an error code in wiz_probe())
Merging staging.current/staging-linus (8124c8a6b353 Linux 5.13-rc4)
Merging iio-fixes/fixes-togreg (ad873b492222 iio: accel: bmc150: Don't make=
 the remove function of the second accelerometer unregister itself)
Merging char-misc.current/char-misc-linus (8124c8a6b353 Linux 5.13-rc4)
Merging soundwire-fixes/fixes (da096fbccd52 soundwire: qcom: fix handling o=
f qcom,ports-block-pack-mode)
Merging thunderbolt-fixes/fixes (8124c8a6b353 Linux 5.13-rc4)
Merging input-current/for-linus (45a4b68354ff Input: elants_i2c - switch to=
 probe_new)
Merging crypto-current/master (e3a606f2c544 fsverity: relax build time depe=
ndency on CRYPTO_SHA256)
Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer)
Merging vfio-fixes/for-linus (dc51ff91cf2d vfio/platform: fix module_put ca=
ll in error flow)
Merging kselftest-fixes/fixes (d07f6ca923ea Linux 5.13-rc2)
Merging modules-fixes/modules-linus (055f23b74b20 module: check for exit se=
ctions in layout_sections() instead of module_init_section())
Merging dmaengine-fixes/fixes (fffdaba402ce dmaengine: stedma40: add missin=
g iounmap() on error in d40_probe())
Merging backlight-fixes/for-backlight-fixes (a38fd8748464 Linux 5.12-rc2)
Merging mtd-fixes/mtd/fixes (562b4e91d3b2 mtd: parsers: ofpart: fix parsing=
 subpartitions)
Merging mfd-fixes/for-mfd-fixes (a61f4661fba4 mfd: intel_quark_i2c_gpio: Re=
vert "Constify static struct resources")
Merging v4l-dvb-fixes/fixes (1e67a81775cb media: s5p-mfc: Fix display delay=
 control creation)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (78cf0eb926cb MIPS: Fix kernel hang under FUN=
CTION_GRAPH_TRACER and PREEMPT_TRACER)
Merging at91-fixes/at91-fixes (6efb943b8616 Linux 5.13-rc1)
Merging omap-fixes/fixes (bae989c4bc53 ARM: OMAP1: ams-delta: remove unused=
 function ams_delta_camera_power)
Merging kvm-fixes/master (000ac4295339 selftests: kvm: fix overlapping addr=
esses in memslot_perf_test)
Merging kvms390-fixes/master (735931f9a51a MAINTAINERS: add uv.c also to KV=
M/s390)
Merging hwmon-fixes/hwmon (f0fb26c456a3 hwmon/pmbus: (q54sj108a2) The PMBUS=
_MFR_ID is actually 6 chars instead of 5)
Merging nvdimm-fixes/libnvdimm-fixes (de80d5781136 Merge branch 'for-5.13/d=
ax' into libnvdimm-fixes)
Merging cxl-fixes/fixes (fae8817ae804 cxl/mem: Fix memory device capacity p=
robing)
Merging btrfs-fixes/next-fixes (4ef0676a1677 Merge branch 'misc-5.13' into =
next-fixes)
Merging vfs-fixes/fixes (173e84953eaa fs: fix reporting supported extra fil=
e attributes for statx())
Merging dma-mapping-fixes/for-linus (18a3c5f7abfd Merge tag 'for_linus' of =
git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging i3c-fixes/i3c/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging drivers-x86-fixes/fixes (c0e0436cb4f6 platform/x86: thinkpad_acpi: =
Add X1 Carbon Gen 9 second fan support)
Merging samsung-krzk-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging pinctrl-samsung-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging devicetree-fixes/dt/linus (c17611592d96 dt-bindings: More removals =
of type references on common properties)
Merging scsi-fixes/fixes (e57f5cd99ca6 scsi: scsi_devinfo: Add blacklist en=
try for HPE OPEN-V)
Merging drm-fixes/drm-fixes (8124c8a6b353 Linux 5.13-rc4)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (b87482dfe800 Revert "i915: us=
e io_mapping_map_user")
Merging mmc-fixes/fixes (c4681547bcce Linux 5.13-rc3)
Merging rtc-fixes/rtc-fixes (bd33335aa93d rtc: cmos: Disable irq around dir=
ect invocation of cmos_interrupt())
Merging gnss-fixes/gnss-linus (a38fd8748464 Linux 5.12-rc2)
Merging hyperv-fixes/hyperv-fixes (6efb943b8616 Linux 5.13-rc1)
Merging soc-fsl-fixes/fix (2663b3388551 soc: fsl: dpio: Get the cpumask thr=
ough cpumask_of(cpu))
Merging risc-v-fixes/fixes (160ce364167f Merge remote-tracking branch 'risc=
v/riscv-wx-mappings' into fixes)
Merging pidfd-fixes/fixes (03ba0fe4d09f file: simplify logic in __close_ran=
ge())
Merging fpga-fixes/fixes (2e8496f31d0b firmware: stratix10-svc: reset COMMA=
ND_RECONFIG_FLAG_PARTIAL to 0)
Merging spdx/spdx-linus (6799d4f2da49 Merge tag 'scsi-fixes' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging gpio-brgl-fixes/gpio/for-current (dbec64b11c65 gpio: wcd934x: Fix s=
hift-out-of-bounds error)
Merging gpio-intel-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging pinctrl-intel-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging erofs-fixes/fixes (0852b6ca941e erofs: fix 1 lcluster-sized pcluste=
r for big pcluster)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (d7eab3df8f39 Documentation: kunit: Update =
kunit_tool page)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (17cbe03872be mm/memblock: Fix typo in comment=
 of memblock_phys_alloc_try_nid())
Merging cel-fixes/for-rc (9f4ad9e425a1 Linux 5.12)
Merging drm-misc-fixes/for-linux-next-fixes (0b78f8bcf495 Revert "fb_defio:=
 Remove custom address_space_operations")
Merging kspp-gustavo/for-next/kspp (53004ee78d62 xfs: Fix fall-through warn=
ings for Clang)
Merging kbuild/for-next (c39013ee64b5 kbuild: clean up ${quiet} checks in s=
hell scripts)
Merging compiler-attributes/compiler-attributes (ca0760e7d79e Compiler Attr=
ibutes: Add continue in comment)
Merging dma-mapping/for-next (a7f3d3d3600c dma-mapping: add unlikely hint t=
o error path in dma_mapping_error)
Merging asm-generic/master (14462376858e Merge branch 'asm-generic-unaligne=
d' into asm-generic)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (d3506d256d94 Merge branch 'misc' into for-next)
Merging arm64/for-next/core (f80ccaffe0b8 Merge branch 'for-next/sve' into =
for-next/core)
Merging arm-perf/for-next/perf (0d0f144a8f5f perf: qcom_l2_pmu: move to use=
 request_irq by IRQF_NO_AUTOEN flag)
Merging arm-soc/for-next (b433d090ac63 MAINTAINERS: ARM/Amlogic SoCs: add N=
eil as primary maintainer)
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (b813db6e4b65 Merge branches 'v5.14/drivers' and '=
v5.14/dt64' into for-next)
Merging aspeed/for-next (61fbc42084f4 Merge branches 'wpcm450-for-v5.13', '=
dt-for-v5.13' and 'lpc-for-v5.13' into for-next)
Merging at91/at91-next (253adffb0e98 ARM: dts: at91: sama5d4: fix pinctrl m=
uxing)
Merging drivers-memory/for-next (76e5624f3f93 memory: pl353: Fix error retu=
rn code in pl353_smc_probe())
Merging imx-mxs/for-next (2f875c387c54 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (9d2e21ed98a2 Merge branch 'for_5.12/drivers-soc' int=
o next)
Merging mediatek/for-next (fd450fd2a4fb Merge branch 'v5.13-next/soc' into =
for-next)
Merging mvebu/for-next (79e93f9dc81a Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (3f89af8097bd Merge branch 'omap-for-v5.14/dt' into f=
or-next)
Merging qcom/for-next (55ac24b7e577 Merge branches 'arm64-defconfig-for-5.1=
4', 'arm64-for-5.14', 'drivers-for-5.14' and 'dts-for-5.14' into for-next)
Merging raspberrypi/for-next (fbdcf1d20126 ARM: dts: bcm2711: Add the CEC i=
nterrupt controller)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/bcm2711.dtsi
Merging renesas/next (acad452912fc Merge branch 'renesas-arm-dt-for-v5.14' =
into renesas-next)
Merging reset/reset/next (e207457f9045 reset: brcmstb: Add missing MODULE_D=
EVICE_TABLE)
Merging rockchip/for-next (8c149afdaa9a Merge branch 'v5.14-armsoc/drivers'=
 into for-next)
Merging samsung-krzk/for-next (fc14c3f36825 Merge branch 'next/defconfig' i=
nto for-next)
Merging scmi/for-linux-next (81bc41a2c168 Merge branch 'for-next/scmi' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging stm32/stm32-next (3dab3e1862cf ARM: dts: stm32: fix ltdc pinctrl on=
 microdev2.0-of7)
Merging sunxi/sunxi/for-next (2b4f0bf55549 Merge branches 'sunxi/clk-fixes-=
for-5.13', 'sunxi/dt-for-5.14' and 'sunxi/fixes-for-5.13' into sunxi/for-ne=
xt)
Merging tegra/for-next (d34628844904 Merge branch for-5.14/arm64/dt into fo=
r-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (69db725cdb2b arm64: dts: ti: k3-am654x/j721e/=
j7200-common-proc-board: Fix MCU_RGMII1_TXC direction)
Merging xilinx/for-next (6efb943b8616 Linux 5.13-rc1)
Merging clk/clk-next (6efb943b8616 Linux 5.13-rc1)
Merging clk-imx/for-next (faa1847d03a2 clk: imx: scu: add enet rgmii gpr cl=
ocks)
Merging clk-renesas/renesas-clk (790c06cc5df2 clk: renesas: r8a77995: Add Z=
A2 clock)
Merging clk-samsung/for-next (a38fd8748464 Linux 5.12-rc2)
Merging csky/linux-next (280af034a71d csky: Kconfig: Remove unused selects)
Merging h8300/h8300-next (6e5e55227c95 Merge tag 'v5.11' into h8300-next)
Merging m68k/for-next (b44bf9410a69 m68k: defconfig: Update defconfigs for =
v5.13-rc1)
Merging m68knommu/for-next (8124c8a6b353 Linux 5.13-rc4)
Merging microblaze/next (14a832498c23 arch: microblaze: Fix spelling mistak=
e "vesion" -> "version")
Merging mips/mips-next (0fe0fbc86711 MIPS: ingenic: rs90: Add dedicated VRA=
M memory region)
Merging nds32/next (40e0dd851e7b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (8b549c18ae81 openrisc: Define memory barrier mb)
Merging parisc-hd/for-next (9f4ad9e425a1 Linux 5.12)
Merging powerpc/next (b73c8cccd72a powerpc/kprobes: Replace ppc_optinsn by =
common optinsn)
Merging soc-fsl/next (242b0b398ccd soc: fsl: enable acpi support in RCPM dr=
iver)
Merging risc-v/for-next (cba43c31f14b riscv: Use global mappings for kernel=
 pages)
Merging s390/for-next (2417ce7ef477 Merge branch 'features' into for-next)
Merging sh/for-next (2882b7626f49 sh: kernel: traps: remove unused variable)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (ed102bf2afed um: Fix W=3D1 missing-include-dirs war=
nings)
Merging xtensa/xtensa-for-next (21e0c3d5f633 xtensa: fix kconfig unmet depe=
ndency warning for HAVE_FUTEX_CMPXCHG)
Merging pidfd/for-next (15845cbcd12a test: add openat2() test for invalid u=
pper 32 bit flag value)
Merging fscrypt/master (a14d0b676491 fscrypt: allow deleting files with uns=
upported encryption policy)
Merging fscache/fscache-next (3003bbd0697b afs: Use the netfs_write_begin()=
 helper)
Merging afs/afs-next (7af08140979a Revert "gcov: clang: fix clang-11+ build=
")
Merging btrfs/for-next (e1bde17d1592 Merge branch 'for-next-next-v5.13-2021=
0601' into for-next-20210601)
Merging ceph/master (f9f9eb473076 libceph: fix some spelling mistakes)
Merging cifs/for-next (00ebb243da7f cifs: fix ipv6 formating in cifs_ses_ad=
d_channel)
Merging cifsd/cifsd-for-next (ce95240b5d8c Merge pull request #53 from namj=
aejeon/cifsd-for-next)
Merging configfs/for-next (7fe1e79b59ba configfs: implement the .read_iter =
and .write_iter methods)
Merging ecryptfs/next (682a8e2b41ef Merge tag 'ecryptfs-5.13-rc1-updates' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs)
Merging erofs/dev (ac1c889d37da erofs: clean up file headers & footers)
Merging exfat/dev (b741596468b0 Merge tag 'riscv-for-linus-5.13-mw1' of git=
://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging ext3/for_next (a5882ee966b1 Pull disabling of quotactl_path syscall=
. Merge branch 'for_next_testing' into for_next)
Merging ext4/dev (6c0912739699 ext4: wipe ext4_dir_entry2 upon file deletio=
n)
Merging f2fs/dev (fe40db607855 f2fs: support RO feature)
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (3c9c14338c12 cuse: simplify refcount)
Merging jfs/jfs-next (492109333c29 fs/jfs: Fix missing error code in lmLogI=
nit())
Merging nfs/linux-next (8124c8a6b353 Linux 5.13-rc4)
Merging nfs-anna/linux-next (4f8be1f53bf6 nfs: we don't support removing sy=
stem.nfs4_acl)
Merging nfsd/nfsd-next (da6f88115e50 nfsd4: Expose the callback address and=
 state of each NFS4 client)
Merging cel/for-next (b9f83ffaa0c0 SUNRPC: Fix null pointer dereference in =
svc_rqst_free())
Merging orangefs/for-next (211f9f2e0503 orangefs: leave files in the page c=
ache for a few micro seconds at least)
Merging overlayfs/overlayfs-next (5e717c6fa41f ovl: add debug print to ovl_=
do_getxattr())
Merging ubifs/next (9a29f7f020e0 ubi: Remove unnecessary struct declaration)
Merging v9fs/9p-next (cba7dcd8878e 9p/trans_virtio: Remove sysfs file on pr=
obe failure)
Merging xfs/for-next (0fe0bbe00a6f xfs: bunmapi has unnecessary AG lock ord=
ering issues)
Merging zonefs/for-next (6980d29ce4da zonefs: fix to update .i_wr_refcnt co=
rrectly in zonefs_open_zone())
Merging iomap/iomap-for-next (6e552494fb90 iomap: remove unused private fie=
ld from ioend)
Merging djw-vfs/vfs-for-next (9b8523423b23 vfs: move __sb_{start,end}_write=
* to fs.h)
Merging file-locks/locks-next (cbe6fc4e0142 fs/locks: remove useless assign=
ment in fcntl_getlk)
Merging vfs/for-next (e8727aec724e Merge branch 'work.misc' into for-next)
Merging printk/for-next (7e4e0a140346 Merge branch 'for-5.14-vsprintf-scanf=
' into for-next)
Merging pci/next (6efb943b8616 Linux 5.13-rc1)
Merging pstore/for-next/pstore (9d843e8fafc7 pstore: Add mem_type property =
DT parsing support)
Merging hid/for-next (84b5e4d4ad37 Merge branches 'for-5.13/upstream-fixes'=
, 'for-5.14/core', 'for-5.14/google', 'for-5.14/intel-ish' and 'for-5.14/lo=
gitech' into for-next)
Merging i2c/i2c/for-next (f879917af25f Merge branch 'i2c/for-5.14' into i2c=
/for-next)
Applying: drm/i915/selftests: Avoid name clash with pm_ global functions
Merging i3c/i3c/next (0d95f41ebde4 Revert "i3c master: fix missing destroy_=
workqueue() on error in i3c_master_register")
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (fc49fecb6518 hwmon: (max31790) Add suppor=
t for fanX_min attributes)
Merging jc_docs/docs-next (6ad1800071e8 docs: Fix typos in Documentation/tr=
ace/ftrace.rst)
Merging v4l-dvb/master (80c1c54a2aa3 Merge tag 'v5.13-rc4' into media_tree)
Merging v4l-dvb-next/master (c11669f738f4 docs: userspace-api: media: dvb: =
replace some characters)
Merging pm/linux-next (a25ea0c642c2 Merge branches 'pm-core' and 'pm-cpufre=
q' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (4814d9c5d3b9 cpufreq: dt: Renam=
e black/white-lists)
Merging cpupower/cpupower (d07f6ca923ea Linux 5.13-rc2)
Merging devfreq/devfreq-next (64f4d903ce9d dt-bindings: devfreq: tegra30-ac=
tmon: Add cooling-cells)
Merging opp/opp/linux-next (ac9fd3c80340 opp: use list_del_init instead of =
list_del/INIT_LIST_HEAD)
Merging thermal/thermal/linux-next (c310e546164d thermal/drivers/mtk_therma=
l: Remove redundant initializations of several variables)
Merging dlm/next (d10a0b88751a fs: dlm: rename socket and app buffer define=
s)
Merging swiotlb/linux-next (dfc06b389a4f swiotlb: don't override user speci=
fied size in swiotlb_adjust_size)
Merging rdma/for-next (0e8558476faf RDMA/rtrs: Avoid Wtautological-constant=
-out-of-range-compare)
Merging net-next/master (270d47dc1fc4 Merge branch 'devlink-rate-objects')
CONFLICT (content): Merge conflict in net/core/devlink.c
CONFLICT (content): Merge conflict in drivers/net/virtio_net.c
Merging bpf-next/for-next (05924717ac70 bpf, tnums: Provably sound, faster,=
 and more precise algorithm for tnum_mul)
Merging ipsec-next/master (a925316af80a net: Remove unnecessary variables)
Merging mlx5-next/mlx5-next (63f9c44bca5e net/mlx5: Add MEMIC operations re=
lated bits)
Merging netfilter-next/master (5fe8e519e44f Merge git://git.kernel.org/pub/=
scm/linux/kernel/git/pablo/nf-next)
Merging ipvs-next/master (5fe8e519e44f Merge git://git.kernel.org/pub/scm/l=
inux/kernel/git/pablo/nf-next)
Merging wireless-drivers-next/master (1e36f828c423 Merge ath-next from git:=
//git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git)
Merging bluetooth/master (35eb10b55b83 Bluetooth: Fix spelling mistakes)
Merging mac80211-next/master (77091933e453 net: mdio: ipq8064: enlarge slee=
p after read/write operation)
Merging gfs2/for-next (574c26b5ca1c gfs2: Fix do_gfs2_set_flags description)
Merging mtd/mtd/next (10f3b4d79958 mtd: parsers: qcom: Fix leaking of parti=
tion name)
Merging nand/nand/next (c374839f9b44 mtd: spinand: macronix: Add support fo=
r serial NAND flash)
Merging spi-nor/spi-nor/next (a6e2cd4dd28e mtd: spi-nor: otp: fix kerneldoc=
 typos)
Merging crypto/master (a5c164b195a8 crypto: hisilicon/qm - support address =
prefetching)
Merging drm/drm-next (ccd1950c2f7e Merge tag 'drm-intel-gt-next-2021-05-28'=
 of git://anongit.freedesktop.org/drm/drm-intel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/selftests/i915_g=
em.c
Merging drm-misc/for-linux-next (d3116756a710 drm/ttm: rename bo->mem and m=
ake it a pointer)
Merging amdgpu/drm-next (6c4a0e31f499 drm/radeon: Add HD-audio component no=
tifier support (v2))
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ttm=
.c
Merging drm-intel/for-linux-next (0b86952d15ce drm/i915/adl_p: Implement Wa=
_22012358565)
Merging drm-tegra/drm/tegra/for-next (ecc583e22d46 drm/tegra: hub: Implemen=
t basic scaling support)
Merging drm-msm/msm-next (0532108c6512 drm/msm/dp: Handle aux timeouts, nac=
ks, defers)
Merging imx-drm/imx-drm/next (fc1e985b67f9 drm/imx: ipuv3-plane: add color =
encoding and range properties)
Merging etnaviv/etnaviv/next (4bfdd2aa67fb drm/etnaviv: rework linear windo=
w offset calculation)
Merging regmap/for-next (5587eb7dbdc2 Merge remote-tracking branch 'regmap/=
for-5.14' into regmap-next)
Merging sound/for-next (9ce650a75a3b ALSA: usb-audio: Reduce latency at pla=
yback start)
Merging sound-asoc/for-next (385247d1d50e Merge remote-tracking branch 'aso=
c/for-5.14' into asoc-next)
Merging modules/modules-next (2c0f0f363956 module: correctly exit module_ka=
llsyms_on_each_symbol when fn() !=3D 0)
Merging input/next (2fcbda9a822d Input: pm8941-pwrkey - add support for PMK=
8350 PON_HLOS PMIC peripheral)
Merging block/for-next (314e07c78aef Merge branch 'for-5.14/block' into for=
-next)
Merging device-mapper/for-next (2c243153d1d4 dm: Forbid requeue of writes t=
o zones)
Merging pcmcia/pcmcia-next (e9d503fef7da pcmcia: rsrc_nonstatic: Fix call-b=
ack function as reference formatting)
Merging mmc/next (92df2ba88355 mmc: mmc_spi: Imply container_of() to be no-=
op)
Merging mfd/for-mfd-next (495fb48dbd9b mfd: wm831x: Use DEFINE_RES_IRQ_NAME=
D() and DEFINE_RES_IRQ() to simplify code)
Merging backlight/for-backlight-next (6fc632d3e3e0 video: backlight: qcom-w=
led: Add PMI8994 compatible)
Merging battery/for-next (2aac79d14d76 power: supply: sc2731_charger: Add m=
issing MODULE_DEVICE_TABLE)
Merging regulator/for-next (88a0f637b67b Merge remote-tracking branch 'regu=
lator/for-5.14' into regulator-next)
Merging security/next-testing (047843bdb316 Merge branch 'landlock_lsm_v34'=
 into next-testing)
Merging apparmor/apparmor-next (d108370c644b apparmor: fix error check)
Merging integrity/next-integrity (5a25d8ceb861 Merge branch 'misc-evm-v7' i=
nto next-integrity)
Merging keys/keys-next (e377c31f788f integrity: Load mokx variables into th=
e blacklist keyring)
CONFLICT (content): Merge conflict in certs/system_keyring.c
Merging safesetid/safesetid-next (1ca86ac1ec8d LSM: SafeSetID: Fix code spe=
cification by scripts/checkpatch.pl)
Merging selinux/next (869cbeef18e5 lsm_audit,selinux: pass IB device name b=
y reference)
Merging smack/next (0169d8f33ab7 Revert "Smack: Handle io_uring kernel thre=
ad privileges")
Merging tomoyo/master (6efb943b8616 Linux 5.13-rc1)
Merging tpmdd/next (8124c8a6b353 Linux 5.13-rc4)
Merging watchdog/master (c4681547bcce Linux 5.13-rc3)
Merging iommu/next (a2bf39204785 Merge branch 'iommu/fixes' into next)
Merging audit/next (254c8b96c4af audit: add blank line after variable decla=
rations)
Merging devicetree/for-next (67a315645385 of: Merge of_address_to_resource(=
) and of_pci_address_to_resource() implementations)
Merging mailbox/mailbox-for-next (2335f556b3af dt-bindings: mailbox: qcom-i=
pcc: Add compatible for SC7280)
Merging spi/for-next (e1cb4e6408f5 Merge remote-tracking branch 'spi/for-5.=
14' into spi-next)
Merging tip/auto-latest (81910a634d57 Merge branch 'efi/core')
CONFLICT (content): Merge conflict in samples/kprobes/kprobe_example.c
Merging clockevents/timers/drivers/next (8120891105ba dt-bindings: timer: n=
uvoton,npcm7xx: Add wpcm450-timer)
Merging edac/edac-for-next (e8049c4aa5d8 MAINTAINERS: Make Yazen Ghannam ma=
intainer for EDAC-AMD64)
Merging irqchip/irq/irqchip-next (fbb80d5ad400 irqchip: Remove redundant er=
ror printing)
Merging ftrace/for-next (eb01f5353bda tracing: Handle %.*s in trace_check_v=
printf())
Merging rcu/rcu/next (c44a4c385913 docs: Fix a typo in Documentation/RCU/st=
allwarn.rst)
Merging kvm/next (a4345a7cecfb Merge tag 'kvmarm-fixes-5.13-1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvm-arm/next (4fda98afcac9 Merge branch kvm-arm64/mmu/MMIO-block-ma=
pping into kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (72476aaa4691 KVM: PPC: Book3S HV: Fix host ra=
dix SLB optimisation with hash guests)
Merging kvms390/next (44bada282190 KVM: s390: fix guarded storage control r=
egister handling)
Merging xen-tip/linux-next (c81d3d246025 xen-pciback: reconfigure also from=
 backend watch handler)
Merging percpu/for-next (7b92d0f97d9b Merge branch 'for-5.14' into for-next)
Merging workqueues/for-next (940d71c6462e wq: handle VM suspension in stall=
 detection)
Merging drivers-x86/for-next (4ed39d31efbd platform/x86: dell-privacy: Add =
support for Dell hardware privacy)
CONFLICT (content): Merge conflict in drivers/platform/surface/surface_aggr=
egator_registry.c
Merging chrome-platform/for-next (6efb943b8616 Linux 5.13-rc1)
Merging hsi/for-next (6efb943b8616 Linux 5.13-rc1)
Merging leds/for-next (e90abb95bc71 leds: lm36274: Add missed property.h)
Merging ipmi/for-next (2253042d86f5 ipmi/watchdog: Stop watchdog timer when=
 the current action is 'none')
Merging driver-core/driver-core-next (92722bac5fe4 Merge 5.13-rc4 into driv=
er-core-next)
Merging usb/usb-next (aa10fab0f859 Merge 5.13-rc4 into usb-next)
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (17cd3a106e97 USB: serial: drop irq-flags initi=
alisations)
Merging usb-chipidea-next/for-usb-next (3496993d06ff doc: dt-binding: cdns,=
usb3: Add interrupt-names property under required)
Merging tty/tty-next (910cc9537302 Merge 5.13-rc4 into tty-next)
Merging char-misc/char-misc-next (2d06954e2337 Merge 5.13-rc4 into char-mis=
c-next)
Merging extcon/extcon-next (82d7c97beb5e dt-bindings: extcon: sm5502: Conve=
rt to DT schema)
Merging phy-next/next (f0afa235685e phy: phy-twl4030-usb: use DEVICE_ATTR_R=
O macro)
Merging soundwire/next (1ec9d2e7936c soundwire: cadence: remove the repeate=
d declaration)
Merging thunderbolt/next (25335b30daf6 thunderbolt: Check for NVM authentic=
ation status after the operation started)
Merging vfio/next (adaeb718d46f vfio/gvt: fix DRM_I915_GVT dependency on VF=
IO_MDEV)
Merging staging/staging-next (cb37defbd17a Merge 5.13-rc4 into staging-next)
Merging iio/togreg (301f7eba67df iio: adc: ti-adc161s626: Use devm managed =
functions for all of probe.)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (46bdcac533cc interconnect: qcom: Add SC7280 interconn=
ect provider driver)
Merging dmaengine/next (340ad031887b dmaengine: ti: omap-dma: Skip pointles=
s cpu_pm context restore on errors)
Merging cgroup/for-next (6962681ee8c6 Merge branch 'for-5.13-fixes' into fo=
r-next)
Merging scsi/for-next (17f23af37bb0 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (1ff28f229bc7 Merge branch '5.14/scsi-result' int=
o 5.14/scsi-staging)
Merging vhost/linux-next (7ff6e99e021c virtio_net: disable cb aggressively)
Merging rpmsg/for-next (c86976deb21c Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (bd56b051c96b gpio: dwapb: Switch to use fw=
node_irq_get())
Merging gpio-intel/for-next (2b71b66ac041 gpio: wcove: Split error handling=
 for CTRL and IRQ registers)
Merging pinctrl/for-next (2aefadc09b35 Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in include/linux/pinctrl/pinconf-generic=
.h
Merging pinctrl-intel/for-next (258435a1c818 pinctrl: tigerlake: Add Alder =
Lake-M ACPI ID)
Merging pinctrl-renesas/renesas-pinctrl (85a242cdcd44 pinctrl: renesas: r8a=
77995: Add bias pinconf support)
Merging pinctrl-samsung/for-next (6efb943b8616 Linux 5.13-rc1)
Merging pwm/for-next (98761ce4b91b pwm: spear: Implement .apply() callback)
Merging userns/for-next (5e6b8a50a7ce cred: add missing return error code w=
hen set_cred_ucounts() failed)
CONFLICT (content): Merge conflict in kernel/ucount.c
CONFLICT (content): Merge conflict in kernel/signal.c
CONFLICT (content): Merge conflict in include/linux/user_namespace.h
CONFLICT (content): Merge conflict in include/linux/sched/user.h
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging kselftest/next (d07f6ca923ea Linux 5.13-rc2)
Merging livepatching/for-next (c150bbbb1731 Merge branch 'for-5.13/signal' =
into for-next)
Merging coresight/next (1efbcec2ef8c coresight: cti: Reduce scope for the v=
ariable =E2=80=9Ccs_fwnode=E2=80=9D in cti_plat_create_connection())
Merging rtc/rtc-next (bcae59d0d45b rtc: imxdi: add wakeup support)
Merging nvdimm/libnvdimm-for-next (30c10d32152d Merge branch 'for-5.12/cxl'=
 into libnvdimm-for-next)
Merging at24/at24/for-next (6efb943b8616 Linux 5.13-rc1)
Merging ntb/ntb-next (5c8fe583cce5 Linux 5.11-rc1)
Merging seccomp/for-next/seccomp (fe092fc9f14b selftests/seccomp: Flush ben=
chmark output)
CONFLICT (content): Merge conflict in kernel/seccomp.c
Merging kspp/for-next/kspp (bf02572fb113 Merge branch 'for-next/orphans' in=
to for-next/kspp)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (994adcbd3714 gnss: drop stray semicolons)
Merging fsi/next (4a851d714ead fsi: aspeed: Support CFAM reset GPIO)
Merging slimbus/for-next (0320ed0a8236 drivers: slimbus: Fix word resposibl=
e -> responsible in slimbus.h)
CONFLICT (content): Merge conflict in drivers/nvmem/Makefile
CONFLICT (content): Merge conflict in drivers/nvmem/Kconfig
Merging nvmem/for-next (76a2b9a8ab44 nvmem: qfprom: Improve the comment abo=
ut regulator setting)
Merging xarray/main (2c7e57a02708 idr test suite: Improve reporting from id=
r_find_test_1)
Merging hyperv/hyperv-next (9de6655cc5a6 drivers: hv: Fix missing error cod=
e in vmbus_connect())
Merging auxdisplay/auxdisplay (aecd79c09c2f auxdisplay: Add I2C gpio expand=
er example)
Merging kgdb/kgdb/for-next (83fa2d13d628 kdb: Refactor env variables get/se=
t code)
Merging hmm/hmm (fe07bfda2fb9 Linux 5.12-rc1)
Merging fpga/for-next (92c5ddbc93ab fpga: fpga-bridge: removed repeated wor=
d)
Merging kunit/test (d07f6ca923ea Linux 5.13-rc2)
Merging cfi/cfi/next (6efb943b8616 Linux 5.13-rc1)
Merging kunit-next/kunit (d07f6ca923ea Linux 5.13-rc2)
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mhi/mhi-next (a610f3c65d3b bus: mhi: Wait for M2 state during syste=
m resume)
Merging memblock/for-next (990e6d0e1de8 arm: extend pfn_valid to take into =
accound freed memory map alignment)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (e71ba9452f0b Linux 5.11-rc2)
Merging rust/rust-next (fef0214731cc rust: allow printing in the kernel cra=
te)
CONFLICT (content): Merge conflict in kernel/printk/printk.c
CONFLICT (content): Merge conflict in include/uapi/linux/android/binder.h
CONFLICT (content): Merge conflict in Makefile
Merging cxl/next (6630d31c912e cxl/mem: Get rid of @cxlm.base)
Merging tpmdd-jejb/tpmdd-for-next (69977d1aeeca Merge branch 'tpmdd-fixes' =
into tpmdd-for-next)
Merging akpm-current/current (a0cb322813c8 linux-next-pre)
CONFLICT (content): Merge conflict in drivers/block/zram/zram_drv.h
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (0278f9c5b615 kdump: use vmlinux_build_id to simplify)

--Sig_/t.vTyGDx8=WkFDAjpb=Thwh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC4nWQACgkQAVBC80lX
0GxwXwf/Sd/mT9mPIviI6ayoy9A9JOSaFS3TOdum/OVByVTQlP9O1g37FR2IaL13
JuhsMHdVPJ+61uSZW8osH+bJv1ShOigEDCBDJ5tGMDm7OfO5YC8af/7JC2QhyH/M
JmdqRwAVsky3y+HZ5KR0HertKW7QlEq5D8gpqet+5AK9sEHro6frEcxlnyUpEtfN
DVkTI0Iez7rBEy/DwR7PZh0ntqMMaCk/O7YFgWo51KRYMgAeorHH2rrW9B9QbXsH
I0XR0xyHb4WShNZItsrrPAjkkIISK41smSGf3oeKyfhXumOyYn4Q9tPciWqcF7Au
I3A+ftgmCvD0dZ4kaQqZy/7bm21BKA==
=t2sz
-----END PGP SIGNATURE-----

--Sig_/t.vTyGDx8=WkFDAjpb=Thwh--
