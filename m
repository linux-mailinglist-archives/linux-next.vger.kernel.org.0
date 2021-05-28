Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39D6D393EFC
	for <lists+linux-next@lfdr.de>; Fri, 28 May 2021 10:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235422AbhE1Iwo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 28 May 2021 04:52:44 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45709 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232832AbhE1Iwn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 28 May 2021 04:52:43 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Frz1R20Dsz9sCD;
        Fri, 28 May 2021 18:51:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622191867;
        bh=SDDpr6uyQQN1O6t+9Ckrtb17znBqP58/38Oc33rV89I=;
        h=Date:From:To:Cc:Subject:From;
        b=obnhmI9e91YKUrcpXEJu8rpuleOoyfFLmHl013M/Ic3nE2E6x+35SwPapbpvCUvch
         peybQ2G9JVhkbFxmOBMZBJ0rMzvNc6NJ7WAATCp8VxiB2u5cUDtR/XU73tjai/2tOO
         Tr2VSEB2XXjNhwkZKlsnaaDtRPycIBZt8ewiJTfseZ1Q4etMnsWr2hgBEa5LkGJkvs
         qBA8cToaUi3uXLE/gdZ385jhJu1g7FG79u+QPcKt5dQ7Pe/oCYo7Qpt7A66P9zhSWN
         bLJRl+LIq4+jZFZ80OOVmq/U7wxaAxn8u340/dhmSQK71eRLO33xKXs/3jpwd3nQIF
         TJeFLhPNsp+2g==
Date:   Fri, 28 May 2021 18:51:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 28
Message-ID: <20210528185104.57085f30@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AN1p+3G8Zklr1Bvfo/ZVIpM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/AN1p+3G8Zklr1Bvfo/ZVIpM
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210527:

The kvm-fixes tree lost its build failures.

The hid tree lost its build failure.

The net-next tree gained a conflict against the net tree.

The amdgpu tree gained lost its build failure.

The scsi-mkp tree still has its build failuer so I used the version
from next-20210526.

Non-merge commits (relative to Linus' tree): 5086
 4996 files changed, 232851 insertions(+), 78928 deletions(-)

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
Merging origin/master (97e5bf604b7a Merge branch 'for-5.13-fixes' of git://=
git.kernel.org/pub/scm/linux/kernel/git/dennis/percpu)
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
Merging s390-fixes/fixes (ffa99c436aa7 Merge tag 'vfio-ccw-20210520' of htt=
ps://git.kernel.org/pub/scm/linux/kernel/git/kvms390/vfio-ccw into fixes)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (fb91702b743d net/sched: act_ct: Fix ct template allocat=
ion for zone 0)
Merging bpf/master (ff2e6efda0d5 kbuild: Quote OBJCOPY var to avoid a pahol=
e call break the build)
Merging ipsec/master (b515d2637276 xfrm: xfrm_state_mtu should return at le=
ast 1280 for ipv6)
Merging netfilter/master (56e4ee82e850 ipvs: ignore IP_VS_SVC_F_HASHED flag=
 when adding service)
Merging ipvs/master (414ed7fe863a Merge git://git.kernel.org/pub/scm/linux/=
kernel/git/pablo/nf)
Merging wireless-drivers/master (2c2bdd2372af mt76: validate rx A-MSDU subf=
rames)
Merging mac80211/master (b81ac7841d51 net: cdc_eem: fix URL to CDC EEM 1.0 =
spec)
Merging rdma-fixes/for-rc (c4681547bcce Linux 5.13-rc3)
Merging sound-current/for-linus (50dbfae972cb ALSA: hda/realtek: fix mute/m=
icmute LEDs and speaker for HP Zbook Fury 17 G8)
Merging sound-asoc-fixes/for-linus (d131d9eeb1eb Merge remote-tracking bran=
ch 'asoc/for-5.13' into asoc-linus)
Merging regmap-fixes/for-linus (c4681547bcce Linux 5.13-rc3)
Merging regulator-fixes/for-linus (2776584b8d8b Merge remote-tracking branc=
h 'regulator/for-5.13' into regulator-linus)
Merging spi-fixes/for-linus (3efe28470745 Merge remote-tracking branch 'spi=
/for-5.13' into spi-linus)
Merging pci-current/for-linus (85aabbd7b315 PCI/MSI: Fix MSIs for generic h=
osts that use device-tree's "msi-map")
Merging driver-core.current/driver-core-linus (0c8713153fbf drivers: base: =
Reduce device link removal code duplication)
Merging tty.current/tty-linus (9808f9be31c6 serial: 8250_pci: handle FL_NOI=
RQ board flag)
Merging usb.current/usb-linus (a7f2e9272aff xhci: Fix 5.12 regression of mi=
ssing xHC cache clearing command after a Stall)
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (56df0c758aff USB: serial: omninet: upda=
te driver description)
Merging usb-chipidea-fixes/for-usb-fixes (a9aecef198fa usb: cdnsp: Fix dead=
lock issue in cdnsp_thread_irq_handler)
Merging phy/fixes (7c2fc79250ca phy: usb: Fix misuse of IS_ENABLED)
Merging staging.current/staging-linus (54732a5322ff Merge tag 'iio-fixes-5.=
13b-take2' of https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio int=
o staging-linus)
Merging iio-fixes/fixes-togreg (ad873b492222 iio: accel: bmc150: Don't make=
 the remove function of the second accelerometer unregister itself)
Merging char-misc.current/char-misc-linus (bbf0a94744ed mei: request autosu=
spend after sending rx flow control)
Merging soundwire-fixes/fixes (da096fbccd52 soundwire: qcom: fix handling o=
f qcom,ports-block-pack-mode)
Merging thunderbolt-fixes/fixes (22c7a18ed5f0 thunderbolt: usb4: Fix NVM re=
ad buffer bounds and offset issue)
Merging input-current/for-linus (0b1d6c8c0015 Input: xpad - map "Select" bu=
tton on Microsoft Xbox One controller)
Merging crypto-current/master (e3a606f2c544 fsverity: relax build time depe=
ndency on CRYPTO_SHA256)
Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer)
Merging vfio-fixes/for-linus (dc51ff91cf2d vfio/platform: fix module_put ca=
ll in error flow)
Merging kselftest-fixes/fixes (d07f6ca923ea Linux 5.13-rc2)
Merging modules-fixes/modules-linus (055f23b74b20 module: check for exit se=
ctions in layout_sections() instead of module_init_section())
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
Merging mips-fixes/mips-fixes (78cf0eb926cb MIPS: Fix kernel hang under FUN=
CTION_GRAPH_TRACER and PREEMPT_TRACER)
Merging at91-fixes/at91-fixes (2c69c8a1736e ARM: dts: at91: sam9x60: fix mu=
x-mask to match product's datasheet)
Merging omap-fixes/fixes (bae989c4bc53 ARM: OMAP1: ams-delta: remove unused=
 function ams_delta_camera_power)
Merging kvm-fixes/master (9805cf03fdb6 KVM: LAPIC: Narrow the timer latency=
 between wait_lapic_expire and world switch)
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
Merging scsi-fixes/fixes (2ef7665dfd88 scsi: target: qla2xxx: Wait for stop=
_phase1 at WWN removal)
Merging drm-fixes/drm-fixes (dd6ad0516ee3 Merge tag 'amd-drm-fixes-5.13-202=
1-05-19' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (e11851429fdc drm/i915: Reenab=
le LTTPR non-transparent LT mode for DPCD_REV<1.4)
Merging mmc-fixes/fixes (c4681547bcce Linux 5.13-rc3)
Merging rtc-fixes/rtc-fixes (bd33335aa93d rtc: cmos: Disable irq around dir=
ect invocation of cmos_interrupt())
Merging gnss-fixes/gnss-linus (a38fd8748464 Linux 5.12-rc2)
Merging hyperv-fixes/hyperv-fixes (292d788c64eb drivers: hv: Fix missing er=
ror code in vmbus_connect())
Merging soc-fsl-fixes/fix (2663b3388551 soc: fsl: dpio: Get the cpumask thr=
ough cpumask_of(cpu))
Merging risc-v-fixes/fixes (bab0d47c0ebb riscv: kexec: Fix W=3D1 build warn=
ings)
Merging pidfd-fixes/fixes (03ba0fe4d09f file: simplify logic in __close_ran=
ge())
Merging fpga-fixes/fixes (2e8496f31d0b firmware: stratix10-svc: reset COMMA=
ND_RECONFIG_FLAG_PARTIAL to 0)
Merging spdx/spdx-linus (6efb943b8616 Linux 5.13-rc1)
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
Merging drm-misc-fixes/for-linux-next-fixes (35f819d21803 drm/ttm: Skip swa=
pout if ttm object is not populated)
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
Merging arm64/for-next/core (f96ff4e07147 Merge branch 'for-next/sve' into =
for-next/core)
Merging arm-perf/for-next/perf (2c2e21e78a94 arm64: perf: Remove redundant =
initialization in perf_event.c)
Merging arm-soc/for-next (b433d090ac63 MAINTAINERS: ARM/Amlogic SoCs: add N=
eil as primary maintainer)
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (6efb943b8616 Linux 5.13-rc1)
Merging aspeed/for-next (61fbc42084f4 Merge branches 'wpcm450-for-v5.13', '=
dt-for-v5.13' and 'lpc-for-v5.13' into for-next)
Merging at91/at91-next (969bbb49f36c Merge branch 'at91-dt' into at91-next)
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
Merging qcom/for-next (a75b593cb73f Merge branch 'drivers-for-5.14' into fo=
r-next)
Merging raspberrypi/for-next (fbdcf1d20126 ARM: dts: bcm2711: Add the CEC i=
nterrupt controller)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/bcm2711.dtsi
Merging renesas/next (dcd770bc1114 Merge branch 'renesas-arm-dt-for-v5.14' =
into renesas-next)
Merging reset/reset/next (e207457f9045 reset: brcmstb: Add missing MODULE_D=
EVICE_TABLE)
Merging rockchip/for-next (dd1599446681 Merge branch 'v5.14-clk/next' into =
for-next)
Merging samsung-krzk/for-next (70dba4ef13c5 Merge branch 'next/soc' into fo=
r-next)
Merging scmi/for-linux-next (c8c75e04118e Merge branch 'for-next/ffa' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-lin=
ux-next)
Merging stm32/stm32-next (6ed9269265e1 ARM: dts: stm32: Add PTP clock to Et=
hernet controller)
Merging sunxi/sunxi/for-next (2b4f0bf55549 Merge branches 'sunxi/clk-fixes-=
for-5.13', 'sunxi/dt-for-5.14' and 'sunxi/fixes-for-5.13' into sunxi/for-ne=
xt)
Merging tegra/for-next (93b9ea9ca307 Merge branch for-5.13/arm64/dt into fo=
r-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (547be9a05dc8 arm64: dts: ti: k3-am65-iot2050-=
common: Disable mailbox nodes)
Merging xilinx/for-next (6efb943b8616 Linux 5.13-rc1)
Merging clk/clk-next (6efb943b8616 Linux 5.13-rc1)
Merging clk-imx/for-next (faa1847d03a2 clk: imx: scu: add enet rgmii gpr cl=
ocks)
Merging clk-renesas/renesas-clk (790c06cc5df2 clk: renesas: r8a77995: Add Z=
A2 clock)
Merging clk-samsung/for-next (a38fd8748464 Linux 5.12-rc2)
Merging csky/linux-next (280af034a71d csky: Kconfig: Remove unused selects)
Merging h8300/h8300-next (6e5e55227c95 Merge tag 'v5.11' into h8300-next)
Merging m68k/for-next (eeff86b6d18c m68k: dma: Remove unnecessary include o=
f asm/cacheflush.h)
Merging m68knommu/for-next (c4681547bcce Linux 5.13-rc3)
Merging microblaze/next (6efb943b8616 Linux 5.13-rc1)
Merging mips/mips-next (b35ef2dd1675 mips: dts: loongson: fix DTC unit name=
 warnings)
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
Merging risc-v/for-next (37a7a2a10ec5 riscv: Turn has_fpu into a static key=
 if FPU=3Dy)
Merging s390/for-next (0a915a2f7150 Merge branch 'features' into for-next)
Merging sh/for-next (2882b7626f49 sh: kernel: traps: remove unused variable)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (ed102bf2afed um: Fix W=3D1 missing-include-dirs war=
nings)
Merging xtensa/xtensa-for-next (21e0c3d5f633 xtensa: fix kconfig unmet depe=
ndency warning for HAVE_FUTEX_CMPXCHG)
Merging pidfd/for-next (2ca4dcc4909d fs/mount_setattr: tighten permission c=
hecks)
Merging fscrypt/master (a14d0b676491 fscrypt: allow deleting files with uns=
upported encryption policy)
Merging fscache/fscache-next (3003bbd0697b afs: Use the netfs_write_begin()=
 helper)
Merging afs/afs-next (7af08140979a Revert "gcov: clang: fix clang-11+ build=
")
Merging btrfs/for-next (2166641a8734 Merge branch 'for-next-next-v5.13-2021=
0527' into for-next-20210527)
Merging ceph/master (f8234d7b1fb3 libceph: kill ceph_none_authorizer::reply=
_buf)
Merging cifs/for-next (0f2fe00a66d8 cifs: change format of CIFS_FULL_KEY_DU=
MP ioctl)
Merging cifsd/cifsd-for-next (bfe6cb0ce5dd Merge pull request #50 from namj=
aejeon/cifsd-for-next)
Merging configfs/for-next (7fe1e79b59ba configfs: implement the .read_iter =
and .write_iter methods)
Merging ecryptfs/next (682a8e2b41ef Merge tag 'ecryptfs-5.13-rc1-updates' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs)
Merging erofs/dev (c439c3306fea erofs: remove the occupied parameter from z=
_erofs_pagevec_enqueue())
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
Merging jfs/jfs-next (cf1031ed4752 jfs: Remove trailing semicolon in macros)
Merging nfs/linux-next (a799b68a7c7a nfs: Remove trailing semicolon in macr=
os)
Merging nfs-anna/linux-next (4f8be1f53bf6 nfs: we don't support removing sy=
stem.nfs4_acl)
Merging nfsd/nfsd-next (1808d90e8458 NFSD add vfs_fsync after async copy is=
 done)
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
Merging i2c/i2c/for-next (0d422289f261 Merge branch 'i2c/for-5.14' into i2c=
/for-next)
Merging i3c/i3c/next (0d95f41ebde4 Revert "i3c master: fix missing destroy_=
workqueue() on error in i3c_master_register")
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (fc49fecb6518 hwmon: (max31790) Add suppor=
t for fanX_min attributes)
Merging jc_docs/docs-next (c8237760cc56 docs: zh_CN: update Chinese transla=
tions)
Merging v4l-dvb/master (71c689dc2e73 media: v4l2-ctrls: split up into four =
source files)
Merging v4l-dvb-next/master (71c689dc2e73 media: v4l2-ctrls: split up into =
four source files)
Merging pm/linux-next (b2864f8ca01d Merge branch 'pm-cpufreq' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (4814d9c5d3b9 cpufreq: dt: Renam=
e black/white-lists)
Merging cpupower/cpupower (d07f6ca923ea Linux 5.13-rc2)
Merging devfreq/devfreq-next (a15fc9aa5b38 PM / devfreq: imx8m-ddrc: Remove=
 DEVFREQ_GOV_SIMPLE_ONDEMAND dependency)
Merging opp/opp/linux-next (ac9fd3c80340 opp: use list_del_init instead of =
list_del/INIT_LIST_HEAD)
Merging thermal/thermal/linux-next (c310e546164d thermal/drivers/mtk_therma=
l: Remove redundant initializations of several variables)
Merging dlm/next (7d3848c03e09 fs: dlm: Fix spelling mistake "stucked" -> "=
stuck")
Merging swiotlb/linux-next (dfc06b389a4f swiotlb: don't override user speci=
fied size in swiotlb_adjust_size)
Merging rdma/for-next (331859d320f5 RDMA/hns: Remove unused CMDQ member)
Merging net-next/master (af9207adb6d9 Merge tag 'mlx5-updates-2021-05-26' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux)
CONFLICT (content): Merge conflict in net/core/devlink.c
Merging bpf-next/for-next (d6a6a55518c1 libbpf: Move BPF_SEQ_PRINTF and BPF=
_SNPRINTF to bpf_helpers.h)
Merging ipsec-next/master (a925316af80a net: Remove unnecessary variables)
Merging mlx5-next/mlx5-next (63f9c44bca5e net/mlx5: Add MEMIC operations re=
lated bits)
Merging netfilter-next/master (845064d752ce netfilter: Remove leading space=
s in Kconfig)
CONFLICT (content): Merge conflict in net/netfilter/nft_set_pipapo.c
Applying: fix up for merge involving nft_pipapo_lookup()
Merging ipvs-next/master (ea89c862f01e net: mana: Use struct_size() in kzal=
loc())
Merging wireless-drivers-next/master (5ada57a9a6b0 Merge git://git.kernel.o=
rg/pub/scm/linux/kernel/git/netdev/net)
Merging bluetooth/master (10847cf32d5c Bluetooth: hci_h5: Add RTL8822CS cap=
abilities)
Merging mac80211-next/master (77091933e453 net: mdio: ipq8064: enlarge slee=
p after read/write operation)
Merging gfs2/for-next (75069590915f gfs2: Fix do_gfs2_set_flags description)
Merging mtd/mtd/next (10f3b4d79958 mtd: parsers: qcom: Fix leaking of parti=
tion name)
Merging nand/nand/next (c374839f9b44 mtd: spinand: macronix: Add support fo=
r serial NAND flash)
Merging spi-nor/spi-nor/next (a6e2cd4dd28e mtd: spi-nor: otp: fix kerneldoc=
 typos)
Merging crypto/master (a6f8e68e238a crypto: ccp - Fix a resource leak in an=
 error handling path)
Merging drm/drm-next (5522e9f7b0fb Merge v5.13-rc3 into drm-next)
Merging drm-misc/for-linux-next (c4eaba3853ed drm/fourcc: Remove struct drm=
_format_buf_name)
Merging amdgpu/drm-next (fbbfc78d113b drm/radeon: Add HD-audio component no=
tifier support (v2))
Merging drm-intel/for-linux-next (40e40e63f7be drm/i915/display: relax 2big=
 checking around initial fb)
Merging drm-tegra/drm/tegra/for-next (c79184a9c029 drm/tegra: Fix shift ove=
rflow in tegra_shared_plane_atomic_update)
Merging drm-msm/msm-next (8dbde399044b drm/msm/dp: handle irq_hpd with sink=
_count =3D 0 correctly)
Merging imx-drm/imx-drm/next (fc1e985b67f9 drm/imx: ipuv3-plane: add color =
encoding and range properties)
Merging etnaviv/etnaviv/next (4bfdd2aa67fb drm/etnaviv: rework linear windo=
w offset calculation)
Merging regmap/for-next (4c82343a5c83 Merge remote-tracking branch 'regmap/=
for-5.14' into regmap-next)
Merging sound/for-next (d955782da290 ALSA: hda/ca0132: Make a const array s=
tatic, makes object smaller)
Merging sound-asoc/for-next (c48946560df6 Merge remote-tracking branch 'aso=
c/for-5.14' into asoc-next)
Merging modules/modules-next (2c0f0f363956 module: correctly exit module_ka=
llsyms_on_each_symbol when fn() !=3D 0)
Merging input/next (6cf3b3abbf0b Input: cyttsp - obtain regulators)
Merging block/for-next (3fc19ec34392 Merge branch 'for-5.14/libata' into fo=
r-next)
Merging device-mapper/for-next (631c05a547da dm table: Constify static stru=
ct blk_ksm_ll_ops)
Merging pcmcia/pcmcia-next (e9d503fef7da pcmcia: rsrc_nonstatic: Fix call-b=
ack function as reference formatting)
Merging mmc/next (47f4bdf989c0 mmc: sdhci-of-aspeed: Configure the SDHCIs a=
s specified by the devicetree.)
Merging mfd/for-mfd-next (d7bf6f0025db mfd: si476x-i2c: Fix incorrectly doc=
umented function names)
Merging backlight/for-backlight-next (6fc632d3e3e0 video: backlight: qcom-w=
led: Add PMI8994 compatible)
Merging battery/for-next (2aac79d14d76 power: supply: sc2731_charger: Add m=
issing MODULE_DEVICE_TABLE)
Merging regulator/for-next (0c4fad8c4522 Merge remote-tracking branch 'regu=
lator/for-5.14' into regulator-next)
Merging security/next-testing (047843bdb316 Merge branch 'landlock_lsm_v34'=
 into next-testing)
Merging apparmor/apparmor-next (d108370c644b apparmor: fix error check)
Merging integrity/next-integrity (49219d9b8785 evm: fix writing <securityfs=
>/evm overflow)
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
Merging tpmdd/next (8ac91e6c6033 Merge tag 'for-5.13-rc2-tag' of git://git.=
kernel.org/pub/scm/linux/kernel/git/kdave/linux)
Merging watchdog/master (c4681547bcce Linux 5.13-rc3)
Merging iommu/next (a2bf39204785 Merge branch 'iommu/fixes' into next)
Merging audit/next (254c8b96c4af audit: add blank line after variable decla=
rations)
Merging devicetree/for-next (70c1fc34f3c6 dt-bindings: rng: mediatek: add m=
t8365 to mtk rng binding)
Merging mailbox/mailbox-for-next (2335f556b3af dt-bindings: mailbox: qcom-i=
pcc: Add compatible for SC7280)
Merging spi/for-next (aa946f04d384 Merge remote-tracking branch 'spi/for-5.=
14' into spi-next)
Merging tip/auto-latest (19c0a3af4ad1 Merge branch 'efi/core')
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
Merging kvm-arm/next (9a8aae605b80 Merge branch 'kvm-arm64/kill_oprofile_de=
pendency' into kvmarm-master/next)
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
Merging leds/for-next (ee522bcf026e leds: tlc591xx: fix return value check =
in tlc591xx_probe())
Merging ipmi/for-next (2253042d86f5 ipmi/watchdog: Stop watchdog timer when=
 the current action is 'none')
Merging driver-core/driver-core-next (fd03c075e362 drivers/base/node.c: mak=
e CACHE_ATTR define static DEVICE_ATTR_RO)
Merging usb/usb-next (a0765597c986 usb: typec: tcpci: Make symbol 'tcpci_ap=
ply_rc' static)
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (17cd3a106e97 USB: serial: drop irq-flags initi=
alisations)
Merging usb-chipidea-next/for-usb-next (4ae08bc23e1b usb: cdnsp: Useless co=
ndition has been removed)
Merging tty/tty-next (2ac62268a2c0 tty: hvc_console: Remove the repeated wo=
rds 'no' and 'from')
Merging char-misc/char-misc-next (83aacfbcbd42 w1: fix build warning in w1_=
ds2438.rst)
Merging extcon/extcon-next (08a268ddb5e2 extcon: max8997: Add missing modal=
ias string)
Merging phy-next/next (490dbd2380c7 phy: phy-core-mipi-dphy.c: Correct refe=
rence version)
Merging soundwire/next (037219925e7a soundwire: dmi-quirks: remove duplicat=
e initialization)
Merging thunderbolt/next (c4681547bcce Linux 5.13-rc3)
Merging vfio/next (adaeb718d46f vfio/gvt: fix DRM_I915_GVT dependency on VF=
IO_MDEV)
Merging staging/staging-next (21e4614b2f69 staging: emxx_udc: fix alignment=
 issues)
Merging iio/togreg (301f7eba67df iio: adc: ti-adc161s626: Use devm managed =
functions for all of probe.)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (1fd86e280d8b interconnect: qcom: Add missing MODULE_D=
EVICE_TABLE)
Merging dmaengine/next (6f64aa5746d2 dt-bindings: dma: convert arm-pl08x to=
 yaml)
Merging cgroup/for-next (6962681ee8c6 Merge branch 'for-5.13-fixes' into fo=
r-next)
Merging scsi/for-next (31ff791600e3 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (46ded13dd382 scsi: ufs: Suppress false positive =
unhandled interrupt messages)
$ git reset --hard HEAD^
Merging next-20210526 version of scsi-mkp
Merging vhost/linux-next (7ff6e99e021c virtio_net: disable cb aggressively)
Merging rpmsg/for-next (dc0e14fa833b Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (bc3aca5393c4 dt-bindings: gpio: omap: Conv=
ert to json-schema)
Merging gpio-intel/for-next (2b71b66ac041 gpio: wcove: Split error handling=
 for CTRL and IRQ registers)
Merging pinctrl/for-next (9f96bd5ae866 Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in include/linux/pinctrl/pinconf-generic=
.h
Merging pinctrl-intel/for-next (258435a1c818 pinctrl: tigerlake: Add Alder =
Lake-M ACPI ID)
Merging pinctrl-renesas/renesas-pinctrl (904ec4bebc1d pinctrl: renesas: r8a=
779{51,6,65}: Reduce non-functional differences)
Merging pinctrl-samsung/for-next (6efb943b8616 Linux 5.13-rc1)
Merging pwm/for-next (98761ce4b91b pwm: spear: Implement .apply() callback)
Merging userns/for-next (f928ef685db5 ucounts: Silence warning in dec_rlimi=
t_ucounts)
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
Merging seccomp/for-next/seccomp (4aa71b5e713b selftests/seccomp: Flush ben=
chmark output)
Merging kspp/for-next/kspp (f4a35e00d248 Merge branch 'for-next/clang/featu=
res' into for-next/kspp)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (994adcbd3714 gnss: drop stray semicolons)
Merging fsi/next (4a851d714ead fsi: aspeed: Support CFAM reset GPIO)
Merging slimbus/for-next (0320ed0a8236 drivers: slimbus: Fix word resposibl=
e -> responsible in slimbus.h)
CONFLICT (content): Merge conflict in drivers/nvmem/Makefile
CONFLICT (content): Merge conflict in drivers/nvmem/Kconfig
Merging nvmem/for-next (d1a5f4ca656b nvmem: qfprom: minor nit fixes)
Merging xarray/main (2c7e57a02708 idr test suite: Improve reporting from id=
r_find_test_1)
Merging hyperv/hyperv-next (c6a8625fa4c6 hv_utils: Fix passing zero to 'PTR=
_ERR' warning)
Merging auxdisplay/auxdisplay (aecd79c09c2f auxdisplay: Add I2C gpio expand=
er example)
Merging kgdb/kgdb/for-next (83fa2d13d628 kdb: Refactor env variables get/se=
t code)
Merging hmm/hmm (fe07bfda2fb9 Linux 5.12-rc1)
Merging fpga/for-next (ded39fc4a5b4 docs: driver-api: fpga: avoid using UTF=
-8 chars)
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
Merging akpm-current/current (f39ecf44ce27 linux-next-pre)
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (925702468fbc kdump: use vmlinux_build_id to simplify)

--Sig_/AN1p+3G8Zklr1Bvfo/ZVIpM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCwrvgACgkQAVBC80lX
0Gw/7gf/a6aaJ+W5vkl0QQPI4aV4FqrXqqnPzoumLCa8M/W1hdiN2MIkTkkWp28Z
wQY0MX7DoHCh/dy4k5XpOzRbN8APFeKWwGLEom8BgQjPC/+nsiRghfpGWOiUyQfS
uI5pKOKUma1PeTRa4Zsm1Ej111ls4c4duKWwndlCwZdKA1FJg8hti8/x3ZjgeviK
IWHK+X5TBijL71w7nzGvSZqZTpKpnooXoAXCOwLDTvcu8EISDnXme5Jh8Aa7Vwrw
SmwpMorqv58PF2zbx2YdNbb3CZRqLXLI6wEypxX8Jmz0f2dHFRx6OwEZEoP7lEnT
pi+SFcQP5FlKRsaeSlyrxquksKWHsg==
=wuB5
-----END PGP SIGNATURE-----

--Sig_/AN1p+3G8Zklr1Bvfo/ZVIpM--
