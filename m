Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C32AD3F9868
	for <lists+linux-next@lfdr.de>; Fri, 27 Aug 2021 13:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233411AbhH0LZK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Aug 2021 07:25:10 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42801 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233296AbhH0LZI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 27 Aug 2021 07:25:08 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gwy692Ymmz9sPf;
        Fri, 27 Aug 2021 21:24:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630063457;
        bh=Ib9DvYCaboeh8+ZjvGGpufauXeHn3O6DekW08oweEig=;
        h=Date:From:To:Cc:Subject:From;
        b=PsFc810xAtDPX3RgA8p5amREkrH7ORoCj3Fk4JDplHYkx/1LrcPQbUEQMgppcHW4b
         iufhDcM4sVcQiHQKDUw+veoIeZVLlrQK+8qWCQ/Ba0BFagsc4rFIzeRlEpn5pqdYw9
         cupe6cqOvcM+Zvd/59eKk6KTqATrdaMqvXl4HBtcXpS/RUkqRGci876irf54D+fqkg
         nSRQGXOIXdlsP1QMspUBaPW7GUKw5uT3FUPcG6FBk5GFOMA72hqrpmPiXCr28GPISW
         y+TiK5rF87UiQ9ZfoUCq2uP4I19gD/bXSHVO5GdxPtQMZDKqE7zRcNu+J6Abxci0de
         GmN6oVYvCwYqw==
Date:   Fri, 27 Aug 2021 21:24:15 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 27
Message-ID: <20210827212415.48ac8b64@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DkGlbnjgU=PXp/Yw3bQYlMY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DkGlbnjgU=PXp/Yw3bQYlMY
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210826:

The kbuild tree still had its build failure for which I reverted a commit.

The uml tree gained a conflict against the asm-generic tree.

The net-next tree still had its build failure for which I applied a
patch and it also gained a semantic conflict against Linus' tree.

The bpf-next tree lost its build failure.

The tip tree gained conflicts against the arm64 tree.

The ftrace tree gained a conflict against the uml tree.

The vfio tree gained conflicts against the drm tree.

The kspp tree still had its build failure so I used the version from
next-20210825.

Non-merge commits (relative to Linus' tree): 9867
 9528 files changed, 552507 insertions(+), 227054 deletions(-)

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

I am currently merging 334 trees (counting Linus' and 90 trees of bug
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
Merging origin/master (73367f05b25d Merge tag 'nfsd-5.14-1' of git://linux-=
nfs.org/~bfields/linux)
Merging fixes/fixes (614124bea77e Linux 5.13-rc5)
Merging kbuild-current/fixes (36a21d51725a Linux 5.14-rc5)
Merging arc-current/for-curr (7c60610d4767 Linux 5.14-rc6)
Merging arm-current/fixes (463dbba4d189 ARM: 9104/2: Fix Keystone 2 kernel =
mapping regression)
Merging arm64-fixes/for-next/fixes (3eb9cdffb397 Partially revert "arm64/mm=
: drop HAVE_ARCH_PFN_VALID")
Merging arm-soc-fixes/arm/fixes (6c35ca069741 Merge tag 'reset-fixes-for-v5=
.14' of git://git.pengutronix.de/pza/linux into arm/fixes)
Merging drivers-memory-fixes/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging m68k-current/for-linus (21ed49265986 m68k: MAC should select HAVE_P=
ATA_PLATFORM)
Merging powerpc-fixes/fixes (787c70f2f999 powerpc/64s: Fix scv implicit sof=
t-mask table for relocated kernels)
Merging s390-fixes/fixes (2a671f77ee49 s390/pci: fix use after free of zpci=
_dev)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (73367f05b25d Merge tag 'nfsd-5.14-1' of git://linux-nfs=
.org/~bfields/linux)
Merging bpf/master (5b029a32cfe4 bpf: Fix ringbuf helper function compatibi=
lity)
Merging ipsec/master (480e93e12aa0 net: xfrm: Fix end of loop tests for lis=
t_for_each_entry)
Merging netfilter/master (e3245a7b7b34 netfilter: nft_ct: protect nft_ct_pc=
pu_template_refcnt with mutex)
Merging ipvs/master (269fc69533de netfilter: nfnetlink_hook: translate inet=
 ingress to netdev)
Merging wireless-drivers/master (abf3d98dee7c mt76: fix enum type mismatch)
Merging mac80211/master (733c99ee8be9 net: fix NULL pointer reference in ci=
pso_v4_doi_free)
Merging rdma-fixes/for-rc (cc4f596cf85e RDMA/rxe: Zero out index member of =
struct rxe_queue)
Merging sound-current/for-linus (93ab3eafb0b3 ALSA: hda/realtek: Quirk for =
HP Spectre x360 14 amp setup)
Merging sound-asoc-fixes/for-linus (ab1d82c8b960 Merge remote-tracking bran=
ch 'asoc/for-5.14' into asoc-linus)
Merging regmap-fixes/for-linus (e22ce8eb631b Linux 5.14-rc7)
Merging regulator-fixes/for-linus (c1ff86006574 Merge remote-tracking branc=
h 'regulator/for-5.14' into regulator-linus)
Merging spi-fixes/for-linus (d5f78f50fff3 Merge remote-tracking branch 'spi=
/for-5.14' into spi-linus)
Merging pci-current/for-linus (045a9277b561 PCI/sysfs: Use correct variable=
 for the legacy_mem sysfs object)
Merging driver-core.current/driver-core-linus (36a21d51725a Linux 5.14-rc5)
Merging tty.current/tty-linus (36a21d51725a Linux 5.14-rc5)
Merging usb.current/usb-linus (ef52b4a9fcc2 usb: typec: tcpm: Raise vdm_sm_=
running flag only when VDM SM is running)
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (df7b16d1c00e Revert "USB: serial: ch341=
: fix character loss at high transfer rates")
Merging usb-chipidea-fixes/for-usb-fixes (5df09c15bab9 usb: cdnsp: Fix the =
IMAN_IE_SET and IMAN_IE_CLEAR macro)
Merging phy/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging staging.current/staging-linus (7c60610d4767 Linux 5.14-rc6)
Merging iio-fixes/fixes-togreg (a5056c0bc24f Merge tag 'iio-fixes-5.14a' of=
 https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-lin=
us)
Merging char-misc.current/char-misc-linus (e22ce8eb631b Linux 5.14-rc7)
Merging soundwire-fixes/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging thunderbolt-fixes/fixes (e22ce8eb631b Linux 5.14-rc7)
Merging input-current/for-linus (818b26588994 Merge branch 'next' into for-=
linus)
Merging crypto-current/master (5261cdf457ce crypto: drbg - select SHA512)
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
Merging reset-fixes/reset/fixes (ed104ca4bd9c reset: reset-zynqmp: Fixed th=
e argument data type)
Merging mips-fixes/mips-fixes (6aa32467299e MIPS: check return value of pgt=
able_pmd_page_ctor)
Merging at91-fixes/at91-fixes (6efb943b8616 Linux 5.13-rc1)
Merging omap-fixes/fixes (e879f855e590 bus: ti-sysc: Add break in switch st=
atement in sysc_init_soc())
Merging kvm-fixes/master (c7dfa4009965 KVM: nSVM: always intercept VMLOAD/V=
MSAVE when nested (CVE-2021-3656))
Merging kvms390-fixes/master (cd4220d23bf3 KVM: selftests: do not require 6=
4GB in set_memory_region_test)
Merging hwmon-fixes/hwmon (03726fd90f4b hwmon: sht4x: update Documentation =
for Malformed table)
Merging nvdimm-fixes/libnvdimm-fixes (32b2397c1e56 libnvdimm/pmem: Fix cras=
h triggered when I/O in-flight during unbind)
Merging cxl-fixes/fixes (fae8817ae804 cxl/mem: Fix memory device capacity p=
robing)
Merging btrfs-fixes/next-fixes (01e9fcf19c13 Merge branch 'misc-5.14' into =
next-fixes)
Merging vfs-fixes/fixes (173e84953eaa fs: fix reporting supported extra fil=
e attributes for statx())
Merging dma-mapping-fixes/for-linus (18a3c5f7abfd Merge tag 'for_linus' of =
git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging i3c-fixes/i3c/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging drivers-x86-fixes/fixes (1e35b8a7780a platform/x86: gigabyte-wmi: a=
dd support for B450M S2H V2)
Merging samsung-krzk-fixes/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging pinctrl-samsung-fixes/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging devicetree-fixes/dt/linus (50d8d7e19c43 dt-bindings: display: renes=
as,du: Make resets optional on R-Car H1)
Merging scsi-fixes/fixes (02c6dcd543f8 scsi: core: Fix hang of freezing que=
ue between blocking and running device)
Merging drm-fixes/drm-fixes (e22ce8eb631b Linux 5.14-rc7)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (c15fd1de4284 drm/i915/dp: Use=
 max params for panels < eDP 1.4)
Merging mmc-fixes/fixes (e22ce8eb631b Linux 5.14-rc7)
Merging rtc-fixes/rtc-fixes (bd33335aa93d rtc: cmos: Disable irq around dir=
ect invocation of cmos_interrupt())
Merging gnss-fixes/gnss-linus (e73f0f0ee754 Linux 5.14-rc1)
Merging hyperv-fixes/hyperv-fixes (f5a11c69b699 Revert "x86/hyperv: fix log=
ical processor creation")
Merging soc-fsl-fixes/fix (c1e64c0aec8c soc: fsl: qe: fix static checker wa=
rning)
Merging risc-v-fixes/fixes (417166ddec02 riscv: dts: microchip: Add etherne=
t0 to the aliases node)
Merging pidfd-fixes/fixes (03ba0fe4d09f file: simplify logic in __close_ran=
ge())
Merging fpga-fixes/fixes (1d345c3e5941 fpga: machxo2-spi: Fix missing error=
 code in machxo2_write_complete())
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
Merging drm-misc-fixes/for-linux-next-fixes (fa0b1ef5f7a6 drm: Copy drm_wai=
t_vblank to user before returning)
Merging kspp-gustavo/for-next/kspp (7bc04ce6b914 Makefile: Enable -Wimplici=
t-fallthrough for Clang)
Merging kbuild/for-next (7584c013e69f checkkconfigsymbols.py: Forbid passin=
g 'HEAD' to --commit)
Applying: Revert "kbuild: detect objtool changes correctly and remove .SECO=
NDEXPANSION"
Merging compiler-attributes/compiler-attributes (7ed012969bbc Compiler Attr=
ibutes: fix __has_attribute(__no_sanitize_coverage__) for GCC 4)
CONFLICT (content): Merge conflict in include/linux/compiler_attributes.h
Merging dma-mapping/for-next (c1dec343d7ab hexagon: use the generic global =
coherent pool)
Merging asm-generic/master (8f76f9c46952 bitops/non-atomic: make @nr unsign=
ed to avoid any DIV)
Merging arc/for-next (56809a28d45f ARC: mm: vmalloc sync from kernel to use=
r table to update PMD ...)
Merging arm/for-next (1c9b5911f53b Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (1a7f67e618d4 Merge branch 'for-next/entry' int=
o for-next/core)
Merging arm-perf/for-next/perf (fd264b310579 arm64/perf: Replace '0xf' inst=
ances with ID_AA64DFR0_PMUVER_IMP_DEF)
Merging arm-soc/for-next (6af351634451 Merge branch 'arm/dt' into for-next)
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (6285af2a2821 Merge tags 'amlogic-arm-configs-for-=
v5.15', 'amlogic-arm64-dt-for-v5.15' and 'amlogic-arm-dt-for-v5.15' into fo=
r-next)
Merging aspeed/for-next (0f32f00af344 Merge branches 'dt-for-v5.15', 'soc-f=
or-v5.15' and 'defconfig-for-v5.15' into for-next)
Merging at91/at91-next (b102356e5bc1 Merge branch 'at91-dt' into at91-next)
Merging drivers-memory/for-next (c28b584deb1b Merge branch 'for-v5.15/omap-=
gpmc' into for-next)
Merging imx-mxs/for-next (2cb411d89676 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (cb293d3b430e Merge branch 'for_5.15/drivers-soc' int=
o next)
Merging mediatek/for-next (69862ae4e378 Merge branch 'v5.14-next/soc' into =
for-next)
Merging mvebu/for-next (930af8dda750 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (7911f95d1713 Merge branch 'fixes' into for-next)
Merging qcom/for-next (57249830120b Merge remote-tracking branch 'refs/remo=
tes/origin/for-next' into for-next)
Merging raspberrypi/for-next (b1f2fcb28228 ARM: dts: bcm283x: Fix VEC addre=
ss for BCM2711)
Merging renesas/next (59d7f78144a8 Merge branches 'renesas-arm-dt-for-v5.15=
' and 'renesas-drivers-for-v5.15' into renesas-next)
Merging reset/reset/next (09f3824342f6 reset: simple: remove ZTE details in=
 Kconfig help)
Merging rockchip/for-next (d46148623f26 Merge branch 'v5.15-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (90861bf54255 Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (7c414a7d93c6 Merge branch 'for-next/scmi' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging stm32/stm32-next (1e6bc5987a52 ARM: dts: stm32: Update AV96 adv7513=
 node per dtbs_check)
Merging sunxi/sunxi/for-next (3f1c53207cf0 Merge branches 'sunxi/dt-for-5.1=
4' and 'sunxi/fixes-for-5.13' into sunxi/for-next)
Merging tegra/for-next (cc701ccede61 Merge branch for-5.15/arm64/dt into fo=
r-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (c1fa5ac6c2f4 arm64: dts: ti: k3-am642-sk: Add=
 pwm nodes)
Merging xilinx/for-next (4d7e3c8de98e Merge branch 'zynqmp/dt' of https://g=
ithub.com/Xilinx/linux-xlnx into for-next)
Merging clk/clk-next (e18001c2b21a Merge branch 'clk-rockchip' into clk-nex=
t)
Merging clk-imx/for-next (86842d255b45 clk: imx8mn: Add M7 core clock)
Merging clk-renesas/renesas-clk (e8425dd55abb clk: renesas: Make CLK_R9A06G=
032 invisible)
Merging clk-samsung/for-next (a38fd8748464 Linux 5.12-rc2)
Merging csky/linux-next (90dc8c0e664e csky: Kconfig: Remove unused selects)
Merging h8300/h8300-next (1ec10274d436 h8300: don't implement set_fs)
Merging m68k/for-next (87d93029fe83 m68k: Fix asm register constraints for =
atomic ops)
Merging m68knommu/for-next (db87db65c105 m68knommu: only set CONFIG_ISA_DMA=
_API for ColdFire sub-arch)
Merging microblaze/next (315511166469 microblaze: move core-y in arch/micro=
blaze/Makefile to arch/microblaze/Kbuild)
Merging mips/mips-next (eba54cbb92d2 MIPS: mscc: ocelot: mark the phy-mode =
for internal PHY ports)
Merging nds32/next (40e0dd851e7b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (94effcedaa54 openrisc: Fix compiler warnings in =
setup)
Merging parisc-hd/for-next (f5ca3d6901cb parisc: math-emu: Avoid "fmt" macr=
o collision)
Merging powerpc/next (f50da6edbf1e powerpc/doc: Fix htmldocs errors)
CONFLICT (content): Merge conflict in arch/powerpc/sysdev/xive/common.c
Merging soc-fsl/next (242b0b398ccd soc: fsl: enable acpi support in RCPM dr=
iver)
Merging risc-v/for-next (89b5310f101f riscv: add support for hugepage migra=
tion)
Merging s390/for-next (3f9c433c9f44 Merge branch 'features' into for-next)
Merging sh/for-next (2882b7626f49 sh: kernel: traps: remove unused variable)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (043f5d3ffaf6 um: Remove set_fs)
CONFLICT (content): Merge conflict in arch/um/kernel/skas/uaccess.c
Merging xtensa/xtensa-for-next (7b7cec477fc3 xtensa: move core-y in arch/xt=
ensa/Makefile to arch/xtensa/Kbuild)
Merging pidfd/for-next (f4dd02cd8631 Merge branch 'kernel.sys' into for-nex=
t)
Merging fscrypt/master (38ef66b05cfa fscrypt: document struct fscrypt_opera=
tions)
Merging fscache/fscache-next (7ddfd7955f4d fscache: Use refcount_t for the =
cookie refcount instead of atomic_t)
Merging afs/afs-next (7af08140979a Revert "gcov: clang: fix clang-11+ build=
")
Merging btrfs/for-next (8bba541556a3 Merge branch 'for-next-next-v5.14-2021=
0823' into for-next-20210823)
Merging ceph/master (a9e6ffbc5b73 ceph: fix possible null-pointer dereferen=
ce in ceph_mdsmap_decode())
Merging cifs/for-next (3998f0b8bc49 cifs: Do not leak EDEADLK to dgetents64=
 for STATUS_USER_SESSION_DELETED)
Merging cifsd/cifsd-for-next (32e19d12fc7c Merge pull request #69 from namj=
aejeon/cifsd-for-next)
CONFLICT (content): Merge conflict in fs/Kconfig
Merging configfs/for-next (c42dd069be8d configfs: fix a race in configfs_lo=
okup())
Merging ecryptfs/next (682a8e2b41ef Merge tag 'ecryptfs-5.13-rc1-updates' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs)
Merging erofs/dev (1266b4a7ecb6 erofs: fix double free of 'copied')
Merging exfat/dev (50be9417e23a Merge tag 'io_uring-5.14-2021-07-09' of git=
://git.kernel.dk/linux-block)
Merging ext3/for_next (ed518dd035fa Pull udf xattr sanity checks.)
Merging ext4/dev (9e445093e523 ext4: fix race writing to an inline_data fil=
e while its xattrs are changing)
Merging f2fs/dev (dd1004231ab5 f2fs: introduce fragment allocation mode mou=
nt option)
CONFLICT (content): Merge conflict in fs/f2fs/file.c
Applying: fxup for "f2fs: Convert to using invalidate_lock"
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (76224355db75 fuse: truncate pagecache on atomic_o_tr=
unc)
Merging gfs2/for-next (08d736667185 gfs2: Remove redundant check from gfs2_=
glock_dq)
Merging jfs/jfs-next (5d299f44d765 jfs: Avoid field-overflowing memcpy())
Merging nfs/linux-next (2734d6c1b1a0 Linux 5.14-rc2)
Merging nfs-anna/linux-next (8197de78f1ad NFSv3: Delete duplicate judgement=
 in nfs3_async_handle_jukebox)
Merging nfsd/nfsd-next (e22ce8eb631b Linux 5.14-rc7)
Merging cel/for-next (0bcc7ca40bd8 nfsd: fix crash on LOCKT on reexported N=
FSv3)
Merging ntfs3/master (11e4e66efd44 Merge branch 'torvalds:master' into mast=
er)
Merging orangefs/for-next (0fdec1b3c9fb orangefs: fix orangefs df output.)
Merging overlayfs/overlayfs-next (332f606b32b6 ovl: enable RCU'd ->get_acl(=
))
Applying: ntfs3: fix up for "vfs: add rcu argument to ->get_acl() callback"
Merging ubifs/next (a801fcfeef96 ubifs: Set/Clear I_LINKABLE under i_lock f=
or whiteout inode)
Merging v9fs/9p-next (732b33d0dbf1 9p/xen: Fix end of loop tests for list_f=
or_each_entry)
Merging xfs/for-next (f38a032b165d xfs: fix I_DONTCACHE)
Merging zonefs/for-next (95b115332a83 zonefs: remove redundant null bio che=
ck)
Merging iomap/iomap-for-next (03b8df8d43ec iomap: standardize tracepoint fo=
rmatting and storage)
Merging djw-vfs/vfs-for-next (d03ef4daf33a fs: forbid invalid project ID)
Merging file-locks/locks-next (2949e8427af3 fs: clean up after mandatory fi=
le locking support removal)
CONFLICT (content): Merge conflict in fs/nfs/file.c
Merging vfs/for-next (2cfbffc62045 Merge branch 'work.init' into for-next)
Merging printk/for-next (23d8adcf8022 Merge branch 'rework/printk_safe-remo=
val' into for-next)
Merging pci/next (ce3800c7f802 Merge branch 'remotes/lorenzo/pci/tools')
CONFLICT (content): Merge conflict in MAINTAINERS
Merging pstore/for-next/pstore (c5d4fb2539ca pstore/blk: Use "%lu" to forma=
t unsigned long)
Merging hid/for-next (0c4e5ab97d2d Merge branch 'for-5.14/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (cc1dbdeb17dd Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
CONFLICT (content): Merge conflict in include/uapi/linux/virtio_ids.h
Merging i3c/i3c/next (e73f0f0ee754 Linux 5.14-rc1)
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (b3a7ab2d4376 hwmon: remove amd_energy dri=
ver in Makefile)
Merging jc_docs/docs-next (630c8fa02f9a Documentation: Update details of Th=
e Linux Kernel Module Programming Guide)
Merging v4l-dvb/master (9c3a0f285248 Merge tag 'v5.14-rc4' into media_tree)
Merging v4l-dvb-next/master (d62cd4d277cc media: uvcvideo: Remove unused in=
cluding <linux/version.h>)
Merging pm/linux-next (2a7254aa7491 Merge branch 'acpi-bus' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (05bc63618a5b cpufreq: qcom-hw: =
Set dvfs_possible_from_any_cpu cpufreq driver flag)
Merging cpupower/cpupower (5499f2b80b56 tools: cpupower: fix typo in cpupow=
er-idle-set(1) manpage)
Merging devfreq/devfreq-next (e73f0f0ee754 Linux 5.14-rc1)
Merging opp/opp/linux-next (e122d7edf1a2 dt-bindings: opp: Convert to DT sc=
hema)
Merging thermal/thermal/linux-next (da6deb655a58 thermal/drivers/qcom/spmi-=
adc-tm5: Don't abort probing if a sensor is not used)
Merging ieee1394/for-next (54b3bd99f094 firewire: nosy: switch from 'pci_' =
to 'dma_' API)
Merging dlm/next (aee742c9928a fs: dlm: fix return -EINTR on recovery stopp=
ed)
Merging swiotlb/linux-next (f3cfd136aef0 of: restricted dma: Don't fail dev=
ice probe on rmem init failure)
CONFLICT (content): Merge conflict in kernel/dma/direct.c
Merging rdma/for-next (145eba1aaec9 RDMA/hfi1: Convert to SPDX identifier)
Merging net-next/master (deecae7d9684 Merge branch 'LiteETH-driver')
CONFLICT (content): Merge conflict in drivers/net/ethernet/broadcom/bnxt/bn=
xt.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/broadcom/bnx2.c
CONFLICT (content): Merge conflict in MAINTAINERS
Applying: NET_VENDOR_CIRRUS is not ready for COMPILE_TEST
Applying: fix for commit 9ebc2758d0bb "Revert "net: really fix the build...=
""
Merging bpf-next/for-next (48b2e71c2e53 samples: bpf: Fix uninitialized var=
iable in xdp_redirect_cpu)
Merging ipsec-next/master (5d8dbb7fb82b net: xfrm: fix shift-out-of-bounce)
Merging mlx5-next/mlx5-next (598fe77df855 net/mlx5: Lag, Create shared FDB =
when in switchdev mode)
Merging netfilter-next/master (7bc416f14716 netfilter: x_tables: handle xt_=
register_template() returning an error value)
Merging ipvs-next/master (9344988d2979 netfilter: ctnetlink: allow to filte=
r dump by status bits)
Merging wireless-drivers-next/master (e3f30ab28ac8 Merge branch 'pktgen-sam=
ples-next')
Merging bluetooth/master (2ac6ae88cdc8 bluetooth: mgmt: Disallow legacy MGM=
T_OP_READ_LOCAL_OOB_EXT_DATA)
Merging mac80211-next/master (deecae7d9684 Merge branch 'LiteETH-driver')
Merging mtd/mtd/next (ee28b42006c3 mtd_blkdevs: simplify the refcounting in=
 blktrans_{open, release})
Merging nand/nand/next (6b430c7595e4 mtd: rawnand: cafe: Fix a resource lea=
k in the error handling path of 'cafe_nand_probe()')
Merging spi-nor/spi-nor/next (2734d6c1b1a0 Linux 5.14-rc2)
Merging crypto/master (abfc7fad6394 crypto: skcipher - in_irq() cleanup)
Merging drm/drm-next (7d8eb202719b Merge tag 'exynos-drm-next-for-v5.15' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into drm-=
next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/dp/dp_display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/mediatek/mtk_drm_ddp_=
comp.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_device_inf=
o.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_pci.c
CONFLICT (modify/delete): drivers/gpu/drm/i915/i915_globals.c deleted in dr=
m/drm-next and modified in HEAD. Version HEAD of drivers/gpu/drm/i915/i915_=
globals.c left in tree.
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_di=
splay.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ras=
_eeprom.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_drv=
.c
CONFLICT (content): Merge conflict in drivers/firmware/Makefile
$ git rm -f drivers/gpu/drm/i915/i915_globals.c
Applying: drm/i915: use linux/stddef.h due to "isystem: trim/fixup stdarg.h=
 and other headers"
Applying: drm/mediatek: merge fix for "Add AAL output size configuration"
Merging drm-misc/for-linux-next (bd7ffbc3ca12 drm/panfrost: Clamp lock regi=
on to Bifrost minimum)
Merging amdgpu/drm-next (9c6a1849cac0 drm/radeon: Add HD-audio component no=
tifier support (v2))
Merging drm-intel/for-linux-next (fb43ebc83e06 drm/i915/selftest: Fix use o=
f err in igt_reset_{fail, nop}_engine())
Merging drm-tegra/drm/tegra/for-next (fed028939417 gpu: host1x: debug: Dump=
 DMASTART and DMAEND register)
Merging drm-msm/msm-next (cb0927ab80d2 drm/msi/mdp4: populate priv->kms in =
mdp4_kms_init)
Merging imx-drm/imx-drm/next (59e4e762a17d gpu: ipu-v3: Fix i.MX IPU-v3 off=
set calculations for (semi)planar U/V formats)
Merging etnaviv/etnaviv/next (81fd23e2b3cc drm/etnaviv: Implement mmap as G=
EM object function)
Merging regmap/for-next (ca5537c9be13 Merge remote-tracking branch 'regmap/=
for-5.15' into regmap-next)
Merging sound/for-next (2eaf1635f9d6 ALSA: hda: Disable runtime resume at s=
hutdown)
Merging sound-asoc/for-next (6d126c4d2ffa Merge remote-tracking branch 'aso=
c/for-5.15' into asoc-next)
Merging modules/modules-next (ced75a2f5da7 MAINTAINERS: Add Luis Chamberlai=
n as modules maintainer)
Merging input/next (76ba1900cb67 dt-bindings: power: reset: qcom-pon: Conve=
rt qcom PON binding to yaml)
Merging block/for-next (f75a126f84e7 Merge branch 'for-5.15/drivers' into f=
or-next)
Merging device-mapper/for-next (d3703ef33129 dm crypt: use in_hardirq() ins=
tead of deprecated in_irq())
Merging pcmcia/pcmcia-next (e39cdacf2f66 pcmcia: i82092: fix a null pointer=
 dereference bug)
Merging mmc/next (f80c8e6864eb mmc: queue: Remove unused parameters(request=
_queue))
Merging mfd/for-mfd-next (be722576fd63 dt-bindings: mfd: Add Broadcom CRU)
Merging backlight/for-backlight-next (79fad92f2e59 backlight: pwm_bl: Impro=
ve bootloader/kernel device handover)
Merging battery/for-next (c9398455b046 power: supply: core: Fix parsing of =
battery chemistry/technology)
Merging regulator/for-next (7aa6d700b089 Merge remote-tracking branch 'regu=
lator/for-5.15' into regulator-next)
Merging security/next-testing (047843bdb316 Merge branch 'landlock_lsm_v34'=
 into next-testing)
Merging apparmor/apparmor-next (d108370c644b apparmor: fix error check)
Merging integrity/next-integrity (cb181da16196 IMA: reject unknown hash alg=
orithms in ima_get_hash_algo)
Applying: dm ima: fix for "ima: Add digest and digest_len params to the fun=
ctions to measure a buffer"
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
Merging tpmdd/next (f985911b7bc7 crypto: public_key: fix overflow during im=
plicit conversion)
Merging watchdog/master (41e73feb1024 dt-bindings: watchdog: Add compatible=
 for Mediatek MT7986)
Merging iommu/next (d8768d7eb9c2 Merge branches 'apple/dart', 'arm/smmu', '=
iommu/fixes', 'x86/amd', 'x86/vt-d' and 'core' into next)
Merging audit/next (67d69e9d1a6c audit: move put_tree() to avoid trim_trees=
 refcount underflow and UAF)
Merging devicetree/for-next (13b11b316f52 dt-bindings: Add vendor prefix fo=
r Topic Embedded Systems)
CONFLICT (modify/delete): Documentation/devicetree/bindings/arm/mediatek/me=
diatek,mmsys.txt deleted in devicetree/for-next and modified in HEAD. Versi=
on HEAD of Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.tx=
t left in tree.
$ git rm -f Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.t=
xt
Applying: dt-bindings: arm: mediatek: mmsys: fixup for conversion to yaml
Merging mailbox/mailbox-for-next (4f197188da66 MAINTAINERS: add entry for p=
olarfire soc mailbox)
Merging spi/for-next (6e9c846aa0c5 Merge remote-tracking branch 'spi/for-5.=
15' into spi-next)
Merging tip/auto-latest (2e98d9bede66 Merge branch 'sched/core')
CONFLICT (content): Merge conflict in include/asm-generic/bitops/non-atomic=
.h
CONFLICT (content): Merge conflict in arch/arm64/kernel/signal.c
CONFLICT (content): Merge conflict in arch/arm64/kernel/process.c
Merging clockevents/timers/drivers/next (f196ae282070 dt-bindings: timer: A=
dd ABIs for new Ingenic SoCs)
Merging edac/edac-for-next (cf4e6d52f583 EDAC/i10nm: Retrieve and print ret=
ry_rd_err_log registers)
Merging irqchip/irq/irqchip-next (6e3b473ee064 Merge branch irq/qcom-pdc-no=
wake-cleanup into irq/irqchip-next)
Merging ftrace/for-next (297e1dcdca3d selftests/ftrace: Add selftest for te=
sting duplicate eprobes and kprobes)
CONFLICT (content): Merge conflict in arch/um/Kconfig
CONFLICT (content): Merge conflict in MAINTAINERS
Merging rcu/rcu/next (38babc43f45e rcutorture: Avoid problematic critical s=
ection nesting on PREEMPT_RT)
CONFLICT (content): Merge conflict in kernel/time/tick-internal.h
Merging kvm/next (43e540cc9f2c KVM: SVM: Add 5-level page table support for=
 SVM)
Merging kvm-arm/next (419025b3b419 Merge branch kvm-arm64/misc-5.15 into kv=
marm-master/next)
Merging kvm-ppc/kvm-ppc-next (72476aaa4691 KVM: PPC: Book3S HV: Fix host ra=
dix SLB optimisation with hash guests)
Merging kvms390/next (1f703d2cf204 KVM: s390: allow facility 192 (vector-pa=
cked-decimal-enhancement facility 2))
Merging xen-tip/linux-next (88ca2521bd5b xen/events: Fix race in set_evtchn=
_to_irq)
Merging percpu/for-next (a81a52b325ec Merge branch 'for-5.14-fixes' into fo=
r-next)
Merging workqueues/for-next (bdb0a6548d22 workqueue: Remove unused WORK_NO_=
COLOR)
Merging drivers-x86/for-next (0487d4fc42d7 platform/x86: dell-smbios-wmi: A=
dd missing kfree in error-exit from run_smbios_call)
Merging chrome-platform/for-next (a8db7a3f8ac6 platform/chrome: cros_ec_typ=
ec: Use existing feature check)
Merging hsi/for-next (e73f0f0ee754 Linux 5.14-rc1)
Merging leds/for-next (239f32b4f161 leds: pca955x: Switch to i2c probe_new)
Merging ipmi/for-next (bf064c7bec3b char: ipmi: use DEVICE_ATTR helper macr=
o)
Merging driver-core/driver-core-next (bd1e336aa853 driver core: platform: R=
emove platform_device_add_properties())
CONFLICT (content): Merge conflict in drivers/pci/pci-sysfs.c
Merging usb/usb-next (d7428bc26fc7 usb: gadget: f_hid: optional SETUP/SET_R=
EPORT mode)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/qcom/sc7280.dtsi
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/qcom/sc7280-idp.d=
ts
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (a65ab973c166 USB: serial: replace symbolic per=
missions by octal permissions)
Merging usb-chipidea-next/for-usb-next (e5d6a7c6cfae usb: chipidea: host: f=
ix port index underflow and UBSAN complains)
Merging tty/tty-next (88c1d2478ec8 tty: serial: fsl_lpuart: check dma_tx_in=
_progress in tx dma callback)
Merging char-misc/char-misc-next (8c61951b372d Merge tag 'soundwire-5.15-rc=
1' of git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire into ch=
ar-misc-next)
CONFLICT (content): Merge conflict in net/qrtr/mhi.c
CONFLICT (content): Merge conflict in drivers/bus/mhi/core/main.c
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/phy=
/qcom,qmp-usb3-dp-phy.yaml
Merging extcon/extcon-next (07de34f5ce1e extcon: max3355: Drop unused inclu=
de)
Merging phy-next/next (152a810eae03 phy: qcom-qmp: Add support for SM6115 U=
FS phy)
Merging soundwire/next (2564a2d4418b soundwire: cadence: do not extend rese=
t delay)
Merging thunderbolt/next (42716425ad7e thunderbolt: Fix port linking by che=
cking all adapters)
Merging vfio/next (ea870730d83f Merge branches 'v5.15/vfio/spdx-license-cle=
anups', 'v5.15/vfio/dma-valid-waited-v3', 'v5.15/vfio/vfio-pci-core-v5' and=
 'v5.15/vfio/vfio-ap' into v5.15/vfio/next)
CONFLICT (content): Merge conflict in drivers/vfio/pci/vfio_pci.c
Applying: fixup for "vfio/pci: Rename vfio_pci.c to vfio_pci_core.c"
Merging staging/staging-next (093991aaadf0 staging: r8188eu: Remove empty r=
tw_mfree_xmit_priv_lock())
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
Merging iio/togreg (d484c21bacfa iio: adc: Add driver for Renesas RZ/G2L A/=
D converter)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (8bf5d31c4f06 interconnect: qcom: osm-l3: Use driver-s=
pecific naming)
Merging dmaengine/next (91604f11f3a0 dmaengine: ptdma: Add debugfs entries =
for PTDMA)
Merging cgroup/for-next (a057486e0fc1 Merge branch 'for-5.15' into for-next)
Merging scsi/for-next (fad336c06aff Merge branch 'misc' into for-next)
CONFLICT (content): Merge conflict in drivers/scsi/st.c
Merging scsi-mkp/for-next (9b5ac8ab4e8b scsi: ufs: Fix ufshcd_request_sense=
_async() for Samsung KLUFG8RHDA-B2D1)
Merging vhost/linux-next (98640afa163e vdpa_sim: Use iova_shift() for the s=
ize passed to alloc_iova())
Merging rpmsg/for-next (c93ca5f21d93 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (37cba6432d88 Merge branch 'ib-rockchip' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl into gp=
io/for-next)
Merging gpio-intel/for-next (5111c2b6b019 gpio: dwapb: Get rid of legacy pl=
atform data)
Merging pinctrl/for-next (04853352952b Merge tag 'samsung-pinctrl-5.15' of =
https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung into devel)
Merging pinctrl-intel/for-next (2f658f7a3953 pinctrl: tigerlake: Fix GPIO m=
apping for newer version of software)
Merging pinctrl-renesas/renesas-pinctrl (c4c4637eb57f pinctrl: renesas: Add=
 RZ/G2L pin and gpio controller driver)
Merging pinctrl-samsung/for-next (cdd3d945dcec pinctrl: samsung: Add Exynos=
850 SoC specific data)
Merging pwm/for-next (7954f76161ea pwm: ab8500: Fix register offset calcula=
tion to not depend on probe order)
Merging userns/for-next (a3be01837fc9 Merge of ucount-fixes-for-5.14, sigin=
fo-si_trapno-for-v5.15, and exit-cleanups-for-v5.15 for testing in linux-ne=
xt)
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging kselftest/next (7ce05074b93c selftests: safesetid: Fix spelling mis=
take "cant" -> "can't")
Merging livepatching/for-next (cd2d68f2d6b2 Merge branch 'for-5.15/cpu-hotp=
lug' into for-next)
Merging coresight/next (1efbcec2ef8c coresight: cti: Reduce scope for the v=
ariable =E2=80=9Ccs_fwnode=E2=80=9D in cti_plat_create_connection())
Merging rtc/rtc-next (8158da6a33f2 dt-bindings: rtc: add Epson RX-8025 and =
RX-8035)
Merging nvdimm/libnvdimm-for-next (30c10d32152d Merge branch 'for-5.12/cxl'=
 into libnvdimm-for-next)
Merging at24/at24/for-next (658ae44345c1 dt-bindings: at24: add ON Semi CAT=
24C04 and CAT24C05)
Merging ntb/ntb-next (28293b6c68cd ntb: ntb_pingpong: remove redundant init=
ialization of variables msg_data and spad_data)
Merging seccomp/for-next/seccomp (b4d8a58f8dcf seccomp: Fix setting loaded =
filter count during TSYNC)
Merging kspp/for-next/kspp (d56163f65a20 Merge branch 'for-next/overflow' i=
nto for-next/kspp)
CONFLICT (content): Merge conflict in Makefile
$ git reset --hard HEAD^
Merging next-20210825 version of kspp
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (0f79ce970e79 gnss: drop stray semicolons)
Merging fsi/next (9ab1428dfe2c fsi/sbefifo: Fix reset timeout)
Merging slimbus/for-next (e5c578adcdd9 slimbus: ngd: reset dma setup during=
 runtime pm)
Merging nvmem/for-next (80c3356bea4e nvmem: nintendo-otp: Add new driver fo=
r the Wii and Wii U OTP)
Merging xarray/main (2c7e57a02708 idr test suite: Improve reporting from id=
r_find_test_1)
Merging hyperv/hyperv-next (9d68cd9120e4 hv_utils: Set the maximum packet s=
ize for VSS driver to the length of the receive buffer)
Merging auxdisplay/auxdisplay (24ebc044c72e auxdisplay: Replace symbolic pe=
rmissions with octal permissions)
Merging kgdb/kgdb/for-next (e868f0a3c4b9 kdb: Rename members of struct kdbt=
ab_t)
Merging hmm/hmm (79fbd3e1241c RDMA: Use the sg_table directly and remove th=
e opencoded version from umem)
Applying: drm/i915/ttm: fix up for "lib/scatterlist: Provide a dedicated fu=
nction to support tableappend"
Merging fpga/for-next (4f45f3404960 spi: spi-altera-dfl: support n5010 feat=
ure revision)
Merging kunit/test (e73f0f0ee754 Linux 5.14-rc1)
Merging cfi/cfi/next (ff1176468d36 Linux 5.14-rc3)
Merging kunit-next/kunit (acd8e8407b8f kunit: Print test statistics on fail=
ure)
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
Merging cxl/next (036a16a39e2f cxl/pci: Fix debug message in cxl_probe_regs=
())
Merging folio/for-next (1a90e9dae32c mm/writeback: Add folio_write_one)
CONFLICT (content): Merge conflict in mm/util.c
CONFLICT (content): Merge conflict in mm/rmap.c
CONFLICT (content): Merge conflict in mm/filemap.c
Merging akpm-current/current (6326eb4a3915 ipc: replace costly bailout chec=
k in sysvipc_find_ipc())
CONFLICT (content): Merge conflict in mm/page-writeback.c
CONFLICT (content): Merge conflict in mm/memcontrol.c
CONFLICT (content): Merge conflict in ipc/sem.c
CONFLICT (content): Merge conflict in include/linux/units.h
CONFLICT (content): Merge conflict in include/linux/sched.h
CONFLICT (content): Merge conflict in include/linux/memcontrol.h
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (e55b3c724ee7 arch: remove compat_alloc_user_space)

--Sig_/DkGlbnjgU=PXp/Yw3bQYlMY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEoy18ACgkQAVBC80lX
0GwuKgf/XM/i2PBrN1/WsZpQ+am7dc4cvbZpwzpLYRMjV4fdA5k74jKgkLMC1Eb4
kShME8O2k9JapKtU+k2VZyETCWq5fUZDFh5Etq/6UEW+ZK/LwBcYgnInW7jlpksq
HRNevLce+xFaDpEi7Vhi8Q39Vasecl6H7w4+wH6UNdUxeIoYxYa+Zwyd9CJooeb5
NNmoP0LYXH/lZOCAoMdUimMmUl2UGvZsOxuwzsRkflGr1y3+XfeWYsJD/7zR2S5T
nZDumqT8oCZK86VqHx4VfyDstn6JRBRIiykMao3YPqjVZFIxWyNuR22GWx+cqBRx
fI2ESHvc9Rh79B1M2o+bd2CaYvk8Eg==
=T4NC
-----END PGP SIGNATURE-----

--Sig_/DkGlbnjgU=PXp/Yw3bQYlMY--
