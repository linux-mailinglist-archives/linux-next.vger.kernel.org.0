Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 499DE4017C3
	for <lists+linux-next@lfdr.de>; Mon,  6 Sep 2021 10:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240513AbhIFIXq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Sep 2021 04:23:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240260AbhIFIXp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Sep 2021 04:23:45 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D737C061575;
        Mon,  6 Sep 2021 01:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630916557;
        bh=OgQm09r0pvSP4cB8N0u+HvavlihHH8ctmSTt2/iz/10=;
        h=Date:From:To:Cc:Subject:From;
        b=Fp7xoicCQLCGc1H/m6lxLpkctfjkPUrgMNRF4yxsRnqFGNT7otBDsPOQY6m+pUBuV
         NsHh/TSvfqO1y3UuJZkuLt5PtBWpaijLXJ8nDV1y952N8YsdkxjxPkARe0CD3D2mEX
         OxljoquYXq5WtOzkKyW8DkGqvZQGk7ZJvctDnNG+a2nQBQflmPT1j0kooJFXizdI91
         B5m3rqwkmn7hoFl8mhsSCanK+407JpfGS+/br1VSbWU8IKPbui1l8/khnqX5ouaTz9
         9lzxD14yjSUJNAm+6Y6d/0kIpKjYxJVY2UrQ1kHpj+fvskX1naSEZh8r7RjIwuUjHB
         tyElVtkm5hK4w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H31bx64sBz9sRf;
        Mon,  6 Sep 2021 18:22:37 +1000 (AEST)
Date:   Mon, 6 Sep 2021 18:22:34 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 6
Message-ID: <20210906182234.382844a8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b9n_Mc4Xl0Vt33Yl_pzvWSI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/b9n_Mc4Xl0Vt33Yl_pzvWSI
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Please do not add any v5.16 related code to your linux-next included
branches until after v5.15-rc1 has been released.

Changes since 20210903:

The vhost tree gained a conflict against Linus' tree.

The cxl tree gained a build failure for which I applied a patch.

Non-merge commits (relative to Linus' tree): 1859
 1955 files changed, 96630 insertions(+), 21673 deletions(-)

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
Merging origin/master (27151f177827 Merge tag 'perf-tools-for-v5.15-2021-09=
-04' of git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux)
Merging fixes/fixes (a9c9a6f741cd Merge tag 'scsi-misc' of git://git.kernel=
.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging kbuild-current/fixes (36a21d51725a Linux 5.14-rc5)
Merging arc-current/for-curr (7c60610d4767 Linux 5.14-rc6)
Merging arm-current/fixes (463dbba4d189 ARM: 9104/2: Fix Keystone 2 kernel =
mapping regression)
Merging arm64-fixes/for-next/fixes (3eb9cdffb397 Partially revert "arm64/mm=
: drop HAVE_ARCH_PFN_VALID")
Merging arm-soc-fixes/arm/fixes (6c35ca069741 Merge tag 'reset-fixes-for-v5=
.14' of git://git.pengutronix.de/pza/linux into arm/fixes)
Merging drivers-memory-fixes/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging m68k-current/for-linus (87d93029fe83 m68k: Fix asm register constra=
ints for atomic ops)
Merging powerpc-fixes/fixes (787c70f2f999 powerpc/64s: Fix scv implicit sof=
t-mask table for relocated kernels)
Merging s390-fixes/fixes (c7a5238ef68b Merge tag 's390-5.15-1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/s390/linux)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (48eab831ae8b net: create netdev->dev_addr assignment he=
lpers)
Merging bpf/master (49ca6153208f bpf: Relicense disassembler as GPL-2.0-onl=
y OR BSD-2-Clause)
Merging ipsec/master (d12e1c464988 net: dsa: b53: Set correct number of por=
ts in the DSA struct)
Merging netfilter/master (ecbd690b52dc octeontx2-af: Fix some memory leaks =
in the error handling path of 'cgx_lmac_init()')
Merging ipvs/master (e3245a7b7b34 netfilter: nft_ct: protect nft_ct_pcpu_te=
mplate_refcnt with mutex)
Merging wireless-drivers/master (45010c080e6e iwlwifi: pnvm: Fix a memory l=
eak in 'iwl_pnvm_get_from_fs()')
Merging mac80211/master (57f780f1c433 atlantic: Fix driver resume flow.)
Merging rdma-fixes/for-rc (cc4f596cf85e RDMA/rxe: Zero out index member of =
struct rxe_queue)
Merging sound-current/for-linus (c8b177b6e3a0 ALSA: usb-audio: Add registra=
tion quirk for JBL Quantum 800)
Merging sound-asoc-fixes/for-linus (bf342ee5e443 Merge remote-tracking bran=
ch 'asoc/for-5.15' into asoc-linus)
Merging regmap-fixes/for-linus (e22ce8eb631b Linux 5.14-rc7)
Merging regulator-fixes/for-linus (7cb623f775d5 Merge remote-tracking branc=
h 'regulator/for-5.15' into regulator-linus)
Merging spi-fixes/for-linus (34014d01dd27 Merge remote-tracking branch 'spi=
/for-5.15' into spi-linus)
Merging pci-current/for-linus (045a9277b561 PCI/sysfs: Use correct variable=
 for the legacy_mem sysfs object)
Merging driver-core.current/driver-core-linus (49624efa65ac Merge tag 'deny=
write-for-5.15' of git://github.com/davidhildenbrand/linux)
Merging tty.current/tty-linus (49624efa65ac Merge tag 'denywrite-for-5.15' =
of git://github.com/davidhildenbrand/linux)
Merging usb.current/usb-linus (835d31d319d9 Merge tag 'media/v5.15-1' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media)
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (dcf097e7d21f USB: serial: pl2303: fix G=
L type detection)
Merging usb-chipidea-fixes/for-usb-fixes (5df09c15bab9 usb: cdnsp: Fix the =
IMAN_IE_SET and IMAN_IE_CLEAR macro)
Merging phy/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging staging.current/staging-linus (49624efa65ac Merge tag 'denywrite-fo=
r-5.15' of git://github.com/davidhildenbrand/linux)
Merging iio-fixes/fixes-togreg (ce9e3d5989e5 iio: adc128s052: Fix the error=
 handling path of 'adc128_probe()')
Merging char-misc.current/char-misc-linus (ba1dc7f273c7 Merge tag 'char-mis=
c-5.15-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-mi=
sc)
Merging soundwire-fixes/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging thunderbolt-fixes/fixes (7d2a07b76933 Linux 5.14)
Merging input-current/for-linus (818b26588994 Merge branch 'next' into for-=
linus)
Merging crypto-current/master (6ae51ffe5e76 crypto: sha512 - remove imagina=
ry and mystifying clearing of variables)
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
Merging v4l-dvb-fixes/fixes (835d31d319d9 Merge tag 'media/v5.15-1' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media)
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
Merging hwmon-fixes/hwmon (15d4ec3b12b5 hwmon: (k10temp) Remove residues of=
 current and voltage)
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
Merging drm-fixes/drm-fixes (7d2a07b76933 Linux 5.14)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (7d2a07b76933 Linux 5.14)
Merging mmc-fixes/fixes (885814a97f5a Revert "mmc: sdhci-iproc: Set SDHCI_Q=
UIRK_CAP_CLOCK_BASE_BROKEN on BCM2711")
Merging rtc-fixes/rtc-fixes (bd33335aa93d rtc: cmos: Disable irq around dir=
ect invocation of cmos_interrupt())
Merging gnss-fixes/gnss-linus (e73f0f0ee754 Linux 5.14-rc1)
Merging hyperv-fixes/hyperv-fixes (f1940d4e9cbe Drivers: hv: vmbus: Fix ker=
nel crash upon unbinding a device from uio_hv_generic driver)
Merging soc-fsl-fixes/fix (c1e64c0aec8c soc: fsl: qe: fix static checker wa=
rning)
Merging risc-v-fixes/fixes (7d2a07b76933 Linux 5.14)
Merging pidfd-fixes/fixes (03ba0fe4d09f file: simplify logic in __close_ran=
ge())
Merging fpga-fixes/fixes (1d345c3e5941 fpga: machxo2-spi: Fix missing error=
 code in machxo2_write_complete())
Merging spdx/spdx-linus (49624efa65ac Merge tag 'denywrite-for-5.15' of git=
://github.com/davidhildenbrand/linux)
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
Merging irqchip-fixes/irq/irqchip-fixes (0ddc5e55e6f1 Documentation: Fix ir=
q-domain.rst build warning)
Merging renesas-fixes/fixes (432b52eea3dc ARM: shmobile: defconfig: Restore=
 graphical consoles)
Merging drm-misc-fixes/for-linux-next-fixes (fa0b1ef5f7a6 drm: Copy drm_wai=
t_vblank to user before returning)
Merging kspp-gustavo/for-next/kspp (7bc04ce6b914 Makefile: Enable -Wimplici=
t-fallthrough for Clang)
Merging kbuild/for-next (5a1f175c9aca isystem: delete global -isystem compi=
le option)
Applying: drm/i915: use linux/stddef.h due to "isystem: trim/fixup stdarg.h=
 and other headers"
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
CONFLICT (content): Merge conflict in ipc/sem.c
Merging arm64/for-next/core (65266a7c6abf Merge remote-tracking branch 'tip=
/sched/arm64' into for-next/core)
Merging arm-perf/for-next/perf (fd264b310579 arm64/perf: Replace '0xf' inst=
ances with ID_AA64DFR0_PMUVER_IMP_DEF)
Merging arm-soc/for-next (5e115b419d2b soc: document merges)
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
Merging qcom/for-next (e0f999d1bfc1 Merge branches 'arm64-for-5.16', 'drive=
rs-for-5.16' and 'dts-for-5.16' into for-next)
Merging raspberrypi/for-next (9f5289ec6f1c ARM: dts: bcm2711-rpi-4-b: Fix u=
sb's unit address)
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
Merging clk/clk-next (47505bf3a821 Merge branches 'clk-kirkwood', 'clk-imx'=
, 'clk-doc', 'clk-zynq' and 'clk-ralink' into clk-next)
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
Merging mips/mips-next (bea6a94a279b MIPS: Malta: fix alignment of the devi=
cetree buffer)
Merging nds32/next (40e0dd851e7b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (1955d843efc3 openrisc/litex: Update defconfig)
Merging parisc-hd/for-next (613793d9c473 parisc: Check user signal stack tr=
ampoline is inside TASK_SIZE)
Merging powerpc/next (a3314262eede Merge branch 'fixes' into next)
Merging soc-fsl/next (242b0b398ccd soc: fsl: enable acpi support in RCPM dr=
iver)
Merging risc-v/for-next (c24a19674258 riscv: add support for hugepage migra=
tion)
Merging s390/for-next (e166f652ff5b s390/cpum_cf: move array from header to=
 C file)
Merging sh/for-next (2882b7626f49 sh: kernel: traps: remove unused variable)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (adf9ae0d159d um: fix stub location calculation)
Merging xtensa/xtensa-for-next (7b7cec477fc3 xtensa: move core-y in arch/xt=
ensa/Makefile to arch/xtensa/Kbuild)
Merging pidfd/for-next (f4dd02cd8631 Merge branch 'kernel.sys' into for-nex=
t)
Merging fscrypt/master (38ef66b05cfa fscrypt: document struct fscrypt_opera=
tions)
Merging fscache/fscache-next (20ec197bfa13 fscache: Use refcount_t for the =
cookie refcount instead of atomic_t)
Merging afs/afs-next (7af08140979a Revert "gcov: clang: fix clang-11+ build=
")
Merging btrfs/for-next (1efc6199e6b9 Merge branch 'for-next-current-v5.14-2=
0210830' into for-next-20210830)
Merging ceph/master (05a444d3f90a ceph: fix dereference of null pointer cf)
Merging cifs/for-next (9c849ce86e0f Merge tag '5.15-rc-smb3-fixes-part1' of=
 git://git.samba.org/sfrench/cifs-2.6)
Merging cifsd/cifsd-for-next (303fff2b8c77 ksmbd: add validation for ndr re=
ad/write functions)
Merging configfs/for-next (c42dd069be8d configfs: fix a race in configfs_lo=
okup())
Merging ecryptfs/next (682a8e2b41ef Merge tag 'ecryptfs-5.13-rc1-updates' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs)
Merging erofs/dev (1266b4a7ecb6 erofs: fix double free of 'copied')
Merging exfat/dev (50be9417e23a Merge tag 'io_uring-5.14-2021-07-09' of git=
://git.kernel.dk/linux-block)
Merging ext3/for_next (ed518dd035fa Pull udf xattr sanity checks.)
Merging ext4/dev (baaae979b112 ext4: make the updating inode data procedure=
 atomic)
Merging f2fs/dev (9605f75cf36e f2fs: should put a page beyond EOF when prep=
aring a write)
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (df1379ecc670 fuse: remove unused arg in fuse_write_f=
ile_get())
Merging gfs2/for-next (08d736667185 gfs2: Remove redundant check from gfs2_=
glock_dq)
Merging jfs/jfs-next (5d299f44d765 jfs: Avoid field-overflowing memcpy())
Merging nfs/linux-next (2734d6c1b1a0 Linux 5.14-rc2)
Merging nfs-anna/linux-next (8cfb9015280d NFS: Always provide aligned buffe=
rs to the RPC read layers)
Merging nfsd/nfsd-next (e22ce8eb631b Linux 5.14-rc7)
Merging cel/for-next (0c217d5066c8 SUNRPC: improve error response to over-s=
ize gss credential)
Merging ntfs3/master (2e3a51b59ea2 fs/ntfs3: Change how module init/info me=
ssages are displayed)
Merging orangefs/for-next (0fdec1b3c9fb orangefs: fix orangefs df output.)
Merging overlayfs/overlayfs-next (332f606b32b6 ovl: enable RCU'd ->get_acl(=
))
Merging ubifs/next (a801fcfeef96 ubifs: Set/Clear I_LINKABLE under i_lock f=
or whiteout inode)
Merging v9fs/9p-next (9c4d94dc9a64 net/9p: increase default msize to 128k)
Merging xfs/for-next (f38a032b165d xfs: fix I_DONTCACHE)
Merging zonefs/for-next (95b115332a83 zonefs: remove redundant null bio che=
ck)
Merging iomap/iomap-for-next (03b8df8d43ec iomap: standardize tracepoint fo=
rmatting and storage)
Merging djw-vfs/vfs-for-next (d03ef4daf33a fs: forbid invalid project ID)
Merging file-locks/locks-next (b91db6a0b52e Merge tag 'for-5.15/io_uring-vf=
s-2021-08-30' of git://git.kernel.dk/linux-block)
Merging vfs/for-next (8e222b83dec2 Merge branch 'work.iov_iter' into for-ne=
xt)
Merging printk/for-next (c57343431170 Merge branch 'for-5.15-printk-index' =
into for-next)
Merging pci/next (742a4c49a82a Merge branch 'remotes/lorenzo/pci/tools')
CONFLICT (content): Merge conflict in drivers/net/ethernet/broadcom/bnxt/bn=
xt.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/broadcom/bnx2.c
CONFLICT (content): Merge conflict in MAINTAINERS
Merging pstore/for-next/pstore (c5d4fb2539ca pstore/blk: Use "%lu" to forma=
t unsigned long)
Merging hid/for-next (4bc44ba4871f Merge branch 'for-5.15/core' into for-ne=
xt)
Merging i2c/i2c/for-next (cc1dbdeb17dd Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i3c/i3c/next (e73f0f0ee754 Linux 5.14-rc1)
Merging dmi/dmi-for-next (f97a2103f1a7 firmware: dmi: Move product_sku info=
 to the end of the modalias)
Merging hwmon-staging/hwmon-next (15d4ec3b12b5 hwmon: (k10temp) Remove resi=
dues of current and voltage)
Merging jc_docs/docs-next (abf36fe0be7d docs: kernel-hacking: Remove inappr=
opriate text)
Merging v4l-dvb/master (9c3a0f285248 Merge tag 'v5.14-rc4' into media_tree)
Merging v4l-dvb-next/master (d62cd4d277cc media: uvcvideo: Remove unused in=
cluding <linux/version.h>)
Merging pm/linux-next (6f65d2319f21 Merge branches 'acpi-pci', 'acpi-pm' an=
d 'acpi-docs' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (f0712ace7fe0 cpufreq: qcom-hw: =
Set dvfs_possible_from_any_cpu cpufreq driver flag)
Merging cpupower/cpupower (5499f2b80b56 tools: cpupower: fix typo in cpupow=
er-idle-set(1) manpage)
Merging devfreq/devfreq-next (e73f0f0ee754 Linux 5.14-rc1)
Merging opp/opp/linux-next (94274f20f6bf dt-bindings: opp: Convert to DT sc=
hema)
Merging thermal/thermal/linux-next (da6deb655a58 thermal/drivers/qcom/spmi-=
adc-tm5: Don't abort probing if a sensor is not used)
Merging ieee1394/for-next (54b3bd99f094 firewire: nosy: switch from 'pci_' =
to 'dma_' API)
Merging dlm/next (ecd95673142e fs: dlm: avoid comms shutdown delay in relea=
se_lockspace)
Merging swiotlb/linux-next (f3c4b1341e83 swiotlb: use depends on for DMA_RE=
STRICTED_POOL)
Merging rdma/for-next (6a217437f9f5 Merge branch 'sg_nents' into rdma.git f=
or-next)
Merging net-next/master (9e9fb7655ed5 Merge tag 'net-next-5.15' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging bpf-next/for-next (9e9fb7655ed5 Merge tag 'net-next-5.15' of git://=
git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging ipsec-next/master (a16ef91aa61a net: pasemi: Remove usage of the de=
precated "pci-dma-compat.h" API)
Merging mlx5-next/mlx5-next (598fe77df855 net/mlx5: Lag, Create shared FDB =
when in switchdev mode)
Merging netfilter-next/master (9e9fb7655ed5 Merge tag 'net-next-5.15' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging ipvs-next/master (7bc416f14716 netfilter: x_tables: handle xt_regis=
ter_template() returning an error value)
Merging wireless-drivers-next/master (eaf2aaec0be4 Merge tag 'wireless-driv=
ers-next-2021-08-29' of git://git.kernel.org/pub/scm/linux/kernel/git/kvalo=
/wireless-drivers-next)
Merging bluetooth/master (49d8a5606428 Bluetooth: fix init and cleanup of s=
co_conn.timeout_work)
Merging mac80211-next/master (464a57281f29 net/mlxbf_gige: Make use of devm=
_platform_ioremap_resourcexxx())
Merging mtd/mtd/next (c1fe77e42440 Merge tag 'nand/for-5.15' into mtd/next)
Merging nand/nand/next (6b430c7595e4 mtd: rawnand: cafe: Fix a resource lea=
k in the error handling path of 'cafe_nand_probe()')
Merging spi-nor/spi-nor/next (2734d6c1b1a0 Linux 5.14-rc2)
Merging crypto/master (6ae51ffe5e76 crypto: sha512 - remove imaginary and m=
ystifying clearing of variables)
Merging drm/drm-next (8f0284f190e6 Merge tag 'amd-drm-next-5.15-2021-08-27'=
 of https://gitlab.freedesktop.org/agd5f/linux into drm-next)
Merging drm-misc/for-linux-next (c4f3a3460a5d dma-buf: DMABUF_MOVE_NOTIFY s=
hould depend on DMA_SHARED_BUFFER)
Merging amdgpu/drm-next (968ee03d1d01 drm/sched: fix the bug of time out ca=
lculation(v4))
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ras=
_eeprom.c
Merging drm-intel/for-linux-next (fb43ebc83e06 drm/i915/selftest: Fix use o=
f err in igt_reset_{fail, nop}_engine())
Merging drm-tegra/drm/tegra/for-next (fed028939417 gpu: host1x: debug: Dump=
 DMASTART and DMAEND register)
Merging drm-msm/msm-next (cb0927ab80d2 drm/msi/mdp4: populate priv->kms in =
mdp4_kms_init)
Merging imx-drm/imx-drm/next (20fbfc81e390 drm/imx: imx-tve: Make use of th=
e helper function devm_platform_ioremap_resource())
Merging etnaviv/etnaviv/next (81fd23e2b3cc drm/etnaviv: Implement mmap as G=
EM object function)
Merging regmap/for-next (ca5537c9be13 Merge remote-tracking branch 'regmap/=
for-5.15' into regmap-next)
Merging sound/for-next (c8b177b6e3a0 ALSA: usb-audio: Add registration quir=
k for JBL Quantum 800)
Merging sound-asoc/for-next (bf342ee5e443 Merge remote-tracking branch 'aso=
c/for-5.15' into asoc-linus)
Merging modules/modules-next (ced75a2f5da7 MAINTAINERS: Add Luis Chamberlai=
n as modules maintainer)
Merging input/next (3e204d6b76b2 Input: adc-keys - drop bogus __refdata ann=
otation)
Merging block/for-next (db3d77ce1c49 Merge branch 'misc-5.15' into for-next)
Merging device-mapper/for-next (d3703ef33129 dm crypt: use in_hardirq() ins=
tead of deprecated in_irq())
Merging pcmcia/pcmcia-next (e39cdacf2f66 pcmcia: i82092: fix a null pointer=
 dereference bug)
Merging mmc/next (a75c95616297 Merge branch 'fixes' into next)
Merging mfd/for-mfd-next (be722576fd63 dt-bindings: mfd: Add Broadcom CRU)
Merging backlight/for-backlight-next (79fad92f2e59 backlight: pwm_bl: Impro=
ve bootloader/kernel device handover)
Merging battery/for-next (c9398455b046 power: supply: core: Fix parsing of =
battery chemistry/technology)
Merging regulator/for-next (7cb623f775d5 Merge remote-tracking branch 'regu=
lator/for-5.15' into regulator-linus)
Merging security/next-testing (047843bdb316 Merge branch 'landlock_lsm_v34'=
 into next-testing)
Merging apparmor/apparmor-next (d108370c644b apparmor: fix error check)
Merging integrity/next-integrity (cb181da16196 IMA: reject unknown hash alg=
orithms in ima_get_hash_algo)
Merging keys/keys-next (e377c31f788f integrity: Load mokx variables into th=
e blacklist keyring)
CONFLICT (content): Merge conflict in certs/system_keyring.c
Merging safesetid/safesetid-next (1b8b71922919 LSM: SafeSetID: Mark safeset=
id_initialized as __initdata)
Merging selinux/next (893c47d1964f selinux: return early for possible NULL =
audit buffers)
Merging smack/next (bfc3cac0c761 smack: mark 'smack_enabled' global variabl=
e as __initdata)
Merging tomoyo/master (7d2a07b76933 Linux 5.14)
Merging tpmdd/next (f985911b7bc7 crypto: public_key: fix overflow during im=
plicit conversion)
Merging watchdog/master (41e73feb1024 dt-bindings: watchdog: Add compatible=
 for Mediatek MT7986)
Merging iommu/next (d8768d7eb9c2 Merge branches 'apple/dart', 'arm/smmu', '=
iommu/fixes', 'x86/amd', 'x86/vt-d' and 'core' into next)
Merging audit/next (67d69e9d1a6c audit: move put_tree() to avoid trim_trees=
 refcount underflow and UAF)
Merging devicetree/for-next (b1e202503508 dt-bindings: display: remove zte,=
vou.txt binding doc)
Merging mailbox/mailbox-for-next (85dfdbfc13ea mailbox: cmdq: add multi-gce=
 clocks support for mt8195)
Merging spi/for-next (34014d01dd27 Merge remote-tracking branch 'spi/for-5.=
15' into spi-linus)
Merging tip/auto-latest (ee0f507188b8 Merge branch 'x86/urgent')
Merging clockevents/timers/drivers/next (f196ae282070 dt-bindings: timer: A=
dd ABIs for new Ingenic SoCs)
Merging edac/edac-for-next (cf4e6d52f583 EDAC/i10nm: Retrieve and print ret=
ry_rd_err_log registers)
Merging irqchip/irq/irqchip-next (6e3b473ee064 Merge branch irq/qcom-pdc-no=
wake-cleanup into irq/irqchip-next)
Merging ftrace/for-next (4420f5b1be7b tracing/doc: Fix table format in hist=
ogram code)
Merging rcu/rcu/next (38babc43f45e rcutorture: Avoid problematic critical s=
ection nesting on PREEMPT_RT)
CONFLICT (content): Merge conflict in kernel/time/tick-internal.h
Merging kvm/next (43e540cc9f2c KVM: SVM: Add 5-level page table support for=
 SVM)
Merging kvm-arm/next (419025b3b419 Merge branch kvm-arm64/misc-5.15 into kv=
marm-master/next)
Merging kvm-ppc/kvm-ppc-next (72476aaa4691 KVM: PPC: Book3S HV: Fix host ra=
dix SLB optimisation with hash guests)
Merging kvms390/next (a3e03bc1368c KVM: s390: index kvm->arch.idle_mask by =
vcpu_idx)
Merging xen-tip/linux-next (58e636039b51 xen: remove stray preempt_disable(=
) from PV AP startup code)
Merging percpu/for-next (a81a52b325ec Merge branch 'for-5.14-fixes' into fo=
r-next)
Merging workqueues/for-next (bdb0a6548d22 workqueue: Remove unused WORK_NO_=
COLOR)
Merging drivers-x86/for-next (0487d4fc42d7 platform/x86: dell-smbios-wmi: A=
dd missing kfree in error-exit from run_smbios_call)
Merging chrome-platform/for-next (4665584888ad platform/chrome: cros_ec_tra=
ce: Fix format warnings)
Merging hsi/for-next (e73f0f0ee754 Linux 5.14-rc1)
Merging leds/for-next (239f32b4f161 leds: pca955x: Switch to i2c probe_new)
Merging ipmi/for-next (bf064c7bec3b char: ipmi: use DEVICE_ATTR helper macr=
o)
Merging driver-core/driver-core-next (49624efa65ac Merge tag 'denywrite-for=
-5.15' of git://github.com/davidhildenbrand/linux)
Merging usb/usb-next (1b4f3dfb4792 Merge tag 'usb-serial-5.15-rc1' of https=
://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next)
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (a65ab973c166 USB: serial: replace symbolic per=
missions by octal permissions)
Merging usb-chipidea-next/for-usb-next (e5d6a7c6cfae usb: chipidea: host: f=
ix port index underflow and UBSAN complains)
Merging tty/tty-next (49624efa65ac Merge tag 'denywrite-for-5.15' of git://=
github.com/davidhildenbrand/linux)
Merging char-misc/char-misc-next (4cd67adc44a3 Merge tag 'misc-habanalabs-n=
ext-2021-09-01' of https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/=
linux into char-misc-next)
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
Merging staging/staging-next (49624efa65ac Merge tag 'denywrite-for-5.15' o=
f git://github.com/davidhildenbrand/linux)
Merging iio/togreg (d484c21bacfa iio: adc: Add driver for Renesas RZ/G2L A/=
D converter)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (8bf5d31c4f06 interconnect: qcom: osm-l3: Use driver-s=
pecific naming)
Merging dmaengine/next (11a427be2c47 dmaengine: sh: fix some NULL dereferen=
ces)
Merging cgroup/for-next (96aff80dde1b Merge branch 'for-5.15' into for-next)
Merging scsi/for-next (27f681116fdf Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (9b5ac8ab4e8b scsi: ufs: Fix ufshcd_request_sense=
_async() for Samsung KLUFG8RHDA-B2D1)
Merging vhost/linux-next (ebf3b42574b0 virtio-blk: remove unneeded "likely"=
 statements)
CONFLICT (content): Merge conflict in include/uapi/linux/virtio_ids.h
CONFLICT (content): Merge conflict in fs/eventfd.c
CONFLICT (content): Merge conflict in drivers/virtio/virtio.c
Applying: fix up for "eventfd: Make signal recursion protection a task bit"
Merging rpmsg/for-next (c93ca5f21d93 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (889a1b3f35db gpio: mpc8xxx: Use 'devm_gpio=
chip_add_data()' to simplify the code and avoid a leak)
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
Merging pwm/for-next (3f2b16734914 pwm: mtk-disp: Implement atomic API .get=
_state())
Merging userns/for-next (a3be01837fc9 Merge of ucount-fixes-for-5.14, sigin=
fo-si_trapno-for-v5.15, and exit-cleanups-for-v5.15 for testing in linux-ne=
xt)
CONFLICT (content): Merge conflict in include/linux/sched/signal.h
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging kselftest/next (67d6d80d90fb selftests/cpufreq: Rename DEBUG_PI_LIS=
T to DEBUG_PLIST)
Merging livepatching/for-next (cd2d68f2d6b2 Merge branch 'for-5.15/cpu-hotp=
lug' into for-next)
Merging coresight/next (1efbcec2ef8c coresight: cti: Reduce scope for the v=
ariable =E2=80=9Ccs_fwnode=E2=80=9D in cti_plat_create_connection())
Merging rtc/rtc-next (8158da6a33f2 dt-bindings: rtc: add Epson RX-8025 and =
RX-8035)
Merging nvdimm/libnvdimm-for-next (bdd3c50d83bf dax: remove bdev_dax_suppor=
ted)
Applying: fixup for "dax: remove bdev_dax_supported"
Merging at24/at24/for-next (658ae44345c1 dt-bindings: at24: add ON Semi CAT=
24C04 and CAT24C05)
Merging ntb/ntb-next (f96cb827ce49 ntb: ntb_pingpong: remove redundant init=
ialization of variables msg_data and spad_data)
Merging seccomp/for-next/seccomp (b4d8a58f8dcf seccomp: Fix setting loaded =
filter count during TSYNC)
Merging kspp/for-next/kspp (3103f67eb440 Merge branch 'for-next/overflow' i=
nto for-next/kspp)
CONFLICT (content): Merge conflict in Makefile
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (0f79ce970e79 gnss: drop stray semicolons)
Merging fsi/next (9ab1428dfe2c fsi/sbefifo: Fix reset timeout)
Merging slimbus/for-next (e5c578adcdd9 slimbus: ngd: reset dma setup during=
 runtime pm)
Merging nvmem/for-next (74f671aed9e7 nvmem: core: Add stubs for nvmem_cell_=
read_variable_le_u32/64 if !CONFIG_NVMEM)
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
Merging cxl/next (00ca683e6180 libnvdimm/labels: Introduce the concept of m=
ulti-range namespace labels)
Applying: cxl: mark unused function as such
Merging folio/for-next (1a90e9dae32c mm/writeback: Add folio_write_one)
CONFLICT (content): Merge conflict in mm/util.c
CONFLICT (content): Merge conflict in mm/rmap.c
CONFLICT (content): Merge conflict in mm/page-writeback.c
CONFLICT (content): Merge conflict in mm/memcontrol.c
CONFLICT (content): Merge conflict in mm/filemap.c
CONFLICT (content): Merge conflict in include/linux/memcontrol.h
Applying: Revert "Makefile: Enable -Warray-bounds"
Applying: don't make the syscall checking produced errors from warnings
Merging akpm-current/current (ec14ea3dfa14 ipc: replace costly bailout chec=
k in sysvipc_find_ipc())
CONFLICT (content): Merge conflict in include/linux/units.h
CONFLICT (content): Merge conflict in include/linux/sched.h
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (bca1885638ea arch: remove compat_alloc_user_space)

--Sig_/b9n_Mc4Xl0Vt33Yl_pzvWSI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmE1z8oACgkQAVBC80lX
0GyTCQf+N8YsTlub7i6ZeZMIB1hKMUwETO4eg/jyXi0l113RznjhVIaxBKhd4R3h
n65hP5BjDbPWidAFBaiSfHgvSB4twQDxu/ZLA4fEdNb0ZAxigNF526oh3jZyhl+y
YKlqpVG8jG1Pg3IO26YBXcj/SGjrIrDDJ5AsgYpxaUSdUyGxQd6/kbFx8+N8lOFU
p2uB5iF+lkBOeA8a2azaRS9xQv0SyqLa96e/r9Ymn+L3bnWN3QWpRNTlBm2T/TjT
zObrkJBiKaKQSstfOePo418YzMIDeFt2+rhz8tmZl9yr2+0tNnAhXgCzrVK+h6AB
bkVDUo6qD5JyFU1zPsKe+fXmxjkMSg==
=POBq
-----END PGP SIGNATURE-----

--Sig_/b9n_Mc4Xl0Vt33Yl_pzvWSI--
