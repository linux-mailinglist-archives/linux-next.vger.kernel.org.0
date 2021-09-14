Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC8640A6BF
	for <lists+linux-next@lfdr.de>; Tue, 14 Sep 2021 08:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240076AbhINGjW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Sep 2021 02:39:22 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:51293 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232880AbhINGjW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Sep 2021 02:39:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1631601483;
        bh=eedTfOgug3MtvvyeqPBhjJaqJT54ldmqgt+LIg9FPQ4=;
        h=Date:From:To:Cc:Subject:From;
        b=mqYvuD1ApXucyF3scYd6r2z27VbOfGjKiMBGrFrnkUy9Z9OQ2JHFPsxDZoxT/OIUN
         kSSNWqhV4Sg/nbSZZG7yaSy8EcXmSj2hmI19CYfuAkiZQfLri1SASeOlDQuMee6p/Z
         NY+KskJ1/iuyTtqbJ8N63Ui0MUPZ8ORtM/FYXYwN6eJWik5ox2nHYiU1NZg4maAfgm
         A6RQx2Pbkhzq/uBowY5dCC3mYi/ACysyT2D4dQ7SoIp5pTzsmOYF7cCboi3kwoJb2t
         z2FAJy88e0IaIizjcFF+xqDhd/sGQKCKJhm/3t0WJcy916utlFGQFkWdpX9XK27uMM
         AEdNWQWL5+qbg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H7tvb4b06z9sW4;
        Tue, 14 Sep 2021 16:38:03 +1000 (AEST)
Date:   Tue, 14 Sep 2021 16:38:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 14
Message-ID: <20210914163802.3ad90ce0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gApKeKDURAvX_DrO_rjS/bK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gApKeKDURAvX_DrO_rjS/bK
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210913:

New tree: libata

Linus' tree gained a build failure for which I reverted a commit.

The net-next tree gained a build failure for which I reverted a patch.

The bpf-next tree gained a build failure so I used the version from
next-20210913.

The kspp tree gained a conflict against Linus' tree.

Non-merge commits (relative to Linus' tree): 1247
 1492 files changed, 76279 insertions(+), 16677 deletions(-)

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

I am currently merging 335 trees (counting Linus' and 90 trees of bug
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
Merging origin/master (316346243be6 Merge branch 'gcc-min-version-5.1' (mak=
e gcc-5.1 the minimum version))
Merging fixes/fixes (a9c9a6f741cd Merge tag 'scsi-misc' of git://git.kernel=
.org/pub/scm/linux/kernel/git/jejb/scsi)
Applying: Revert "compiler_attributes.h: drop __has_attribute() support for=
 gcc4"
Merging kbuild-current/fixes (926de8c4326c Merge tag 'acpi-5.15-rc1-3' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging arc-current/for-curr (6880fa6c5660 Linux 5.15-rc1)
Merging arm-current/fixes (463dbba4d189 ARM: 9104/2: Fix Keystone 2 kernel =
mapping regression)
Merging arm64-fixes/for-next/fixes (3eb9cdffb397 Partially revert "arm64/mm=
: drop HAVE_ARCH_PFN_VALID")
Merging arm-soc-fixes/arm/fixes (6c35ca069741 Merge tag 'reset-fixes-for-v5=
.14' of git://git.pengutronix.de/pza/linux into arm/fixes)
Merging drivers-memory-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging m68k-current/for-linus (a7b68ed15d1f m68k: mvme: Remove overdue #wa=
rnings in RTC handling)
Merging powerpc-fixes/fixes (787c70f2f999 powerpc/64s: Fix scv implicit sof=
t-mask table for relocated kernels)
Merging s390-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (111b64e35ea0 net: dsa: lantiq_gswip: Add 200ms assert d=
elay)
Merging bpf/master (0e6491b55970 bpf: Add oversize check before call kvcall=
oc())
Merging ipsec/master (3c10ffddc61f net: xfrm: fix shift-out-of-bounds in xf=
rm_get_default)
Merging netfilter/master (69e73dbfda14 ipvs: check that ip_vs_conn_tab_bits=
 is between 8 and 20)
Merging ipvs/master (276aae377206 net: stmmac: fix system hang caused by ee=
e_ctrl_timer during suspend/resume)
Merging wireless-drivers/master (e4457a45b41c iwlwifi: fix printk format wa=
rnings in uefi.c)
Merging mac80211/master (e011912651bd net: ni65: Avoid typecast of pointer =
to u32)
Merging rdma-fixes/for-rc (1b789bd4dbd4 IB/qib: Fix clang confusion of NULL=
 pointer comparison)
Merging sound-current/for-linus (7b9cf9036609 ALSA: usb-audio: Unify mixer =
resume and reset_resume procedure)
Merging sound-asoc-fixes/for-linus (49660818eb84 Merge remote-tracking bran=
ch 'asoc/for-5.15' into asoc-linus)
Merging regmap-fixes/for-linus (6880fa6c5660 Linux 5.15-rc1)
Merging regulator-fixes/for-linus (18844b7517c8 Merge remote-tracking branc=
h 'regulator/for-5.15' into regulator-linus)
Merging spi-fixes/for-linus (c6636bc07565 Merge remote-tracking branch 'spi=
/for-5.15' into spi-linus)
Merging pci-current/for-linus (6880fa6c5660 Linux 5.15-rc1)
Merging driver-core.current/driver-core-linus (6880fa6c5660 Linux 5.15-rc1)
Merging tty.current/tty-linus (6880fa6c5660 Linux 5.15-rc1)
Merging usb.current/usb-linus (6880fa6c5660 Linux 5.15-rc1)
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (7bb057134d60 USB: serial: option: add T=
elit LN920 compositions)
Merging usb-chipidea-fixes/for-usb-fixes (98a1373a2de9 usb: cdns3: fix race=
 condition before setting doorbell)
Merging phy/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging staging.current/staging-linus (6880fa6c5660 Linux 5.15-rc1)
Merging iio-fixes/fixes-togreg (fa31da54088b iio: adc: ad7793: Fix IRQ flag)
Merging char-misc.current/char-misc-linus (6880fa6c5660 Linux 5.15-rc1)
Merging soundwire-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging thunderbolt-fixes/fixes (7d2a07b76933 Linux 5.14)
Merging input-current/for-linus (0c5483a5778f Input: analog - always use kt=
ime functions)
Merging crypto-current/master (6ae51ffe5e76 crypto: sha512 - remove imagina=
ry and mystifying clearing of variables)
Merging vfio-fixes/for-linus (dc51ff91cf2d vfio/platform: fix module_put ca=
ll in error flow)
Merging kselftest-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging modules-fixes/modules-linus (055f23b74b20 module: check for exit se=
ctions in layout_sections() instead of module_init_section())
Merging dmaengine-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging backlight-fixes/for-backlight-fixes (a38fd8748464 Linux 5.12-rc2)
Merging mtd-fixes/mtd/fixes (b48027083a78 mtd: rawnand: Fix probe failure d=
ue to of_get_nand_secure_regions())
Merging mfd-fixes/for-mfd-fixes (a61f4661fba4 mfd: intel_quark_i2c_gpio: Re=
vert "Constify static struct resources")
Merging v4l-dvb-fixes/fixes (3ad02c27d89d media: s5p-jpeg: rename JPEG mark=
er constants to prevent build warnings)
Merging reset-fixes/reset/fixes (ed104ca4bd9c reset: reset-zynqmp: Fixed th=
e argument data type)
Merging mips-fixes/mips-fixes (6880fa6c5660 Linux 5.15-rc1)
Merging at91-fixes/at91-fixes (6efb943b8616 Linux 5.13-rc1)
Merging omap-fixes/fixes (e879f855e590 bus: ti-sysc: Add break in switch st=
atement in sysc_init_soc())
Merging kvm-fixes/master (7d2a07b76933 Linux 5.14)
Merging kvms390-fixes/master (cd4220d23bf3 KVM: selftests: do not require 6=
4GB in set_memory_region_test)
Merging hwmon-fixes/hwmon (23c69b90365c hwmon: (k10temp) Remove residues of=
 current and voltage)
Merging nvdimm-fixes/libnvdimm-fixes (32b2397c1e56 libnvdimm/pmem: Fix cras=
h triggered when I/O in-flight during unbind)
Merging cxl-fixes/fixes (fae8817ae804 cxl/mem: Fix memory device capacity p=
robing)
Merging btrfs-fixes/next-fixes (7f6fe94c91a4 Merge branch 'misc-5.15' into =
next-fixes)
Merging vfs-fixes/fixes (173e84953eaa fs: fix reporting supported extra fil=
e attributes for statx())
Merging dma-mapping-fixes/for-linus (18a3c5f7abfd Merge tag 'for_linus' of =
git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging i3c-fixes/i3c/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging drivers-x86-fixes/fixes (196159d278ae platform/x86: touchscreen_dmi=
: Update info for the Chuwi Hi10 Plus (CWI527) tablet)
Merging samsung-krzk-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging pinctrl-samsung-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging devicetree-fixes/dt/linus (094b147c7662 spi: dt-bindings: xilinx: D=
rop type reference on *-bits properties)
Merging scsi-fixes/fixes (02c6dcd543f8 scsi: core: Fix hang of freezing que=
ue between blocking and running device)
Merging drm-fixes/drm-fixes (7d2a07b76933 Linux 5.14)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (7d2a07b76933 Linux 5.14)
Merging mmc-fixes/fixes (b81bede4d138 mmc: renesas_sdhi: fix regression wit=
h hard reset on old SDHIs)
Merging rtc-fixes/rtc-fixes (bd33335aa93d rtc: cmos: Disable irq around dir=
ect invocation of cmos_interrupt())
Merging gnss-fixes/gnss-linus (e73f0f0ee754 Linux 5.14-rc1)
Merging hyperv-fixes/hyperv-fixes (dfb5c1e12c28 x86/hyperv: remove on-stack=
 cpumask from hv_send_ipi_mask_allbutself)
Merging soc-fsl-fixes/fix (c1e64c0aec8c soc: fsl: qe: fix static checker wa=
rning)
Merging risc-v-fixes/fixes (7d2a07b76933 Linux 5.14)
Merging pidfd-fixes/fixes (03ba0fe4d09f file: simplify logic in __close_ran=
ge())
Merging fpga-fixes/fixes (1d345c3e5941 fpga: machxo2-spi: Fix missing error=
 code in machxo2_write_complete())
Merging spdx/spdx-linus (6880fa6c5660 Linux 5.15-rc1)
Merging gpio-brgl-fixes/gpio/for-current (6880fa6c5660 Linux 5.15-rc1)
Merging gpio-intel-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging pinctrl-intel-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging erofs-fixes/fixes (0852b6ca941e erofs: fix 1 lcluster-sized pcluste=
r for big pcluster)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (6880fa6c5660 Linux 5.15-rc1)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (024591f9a6e0 arm: ioremap: don't abuse pfn_va=
lid() to check if pfn is in RAM)
Merging cel-fixes/for-rc (9f4ad9e425a1 Linux 5.12)
Merging irqchip-fixes/irq/irqchip-fixes (0ddc5e55e6f1 Documentation: Fix ir=
q-domain.rst build warning)
Merging renesas-fixes/fixes (432b52eea3dc ARM: shmobile: defconfig: Restore=
 graphical consoles)
Merging drm-misc-fixes/for-linux-next-fixes (c8704b7ec182 drm/kmb: Enable a=
lpha blended second plane)
Merging kspp-gustavo/for-next/kspp (27f8b47f2e25 Merge branch 'for-next/cla=
ng-fallthrough' into for-next/kspp)
Merging kbuild/for-next (860091ee86e6 riscv: move the (z)install rules to a=
rch/riscv/Makefile)
Merging compiler-attributes/compiler-attributes (b83a908498d6 compiler_attr=
ibutes.h: move __compiletime_{error|warning})
Merging dma-mapping/for-next (510e1a724ab1 dma-debug: prevent an error mess=
age from causing runtime problems)
Merging asm-generic/master (8f76f9c46952 bitops/non-atomic: make @nr unsign=
ed to avoid any DIV)
Merging arc/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging arm/for-next (1c9b5911f53b Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (85f58eb18898 arm64: kdump: Skip kmemleak scan =
reserved memory for kdump)
Merging arm-perf/for-next/perf (fd264b310579 arm64/perf: Replace '0xf' inst=
ances with ID_AA64DFR0_PMUVER_IMP_DEF)
Merging arm-soc/for-next (5e115b419d2b soc: document merges)
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (faae6a457101 Merge branches 'v5.16/dt64' and 'v5.=
16/drivers' into for-next)
Merging aspeed/for-next (0f32f00af344 Merge branches 'dt-for-v5.15', 'soc-f=
or-v5.15' and 'defconfig-for-v5.15' into for-next)
Merging at91/at91-next (b102356e5bc1 Merge branch 'at91-dt' into at91-next)
Merging drivers-memory/for-next (6880fa6c5660 Linux 5.15-rc1)
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
Merging renesas/next (cbbd8f16ae1c Merge branches 'renesas-arm-dt-for-v5.16=
', 'renesas-drivers-for-v5.16' and 'renesas-dt-bindings-for-v5.16' into ren=
esas-next)
Merging reset/reset/next (09f3824342f6 reset: simple: remove ZTE details in=
 Kconfig help)
Merging rockchip/for-next (d46148623f26 Merge branch 'v5.15-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging scmi/for-linux-next (b1d6695c249e Merge branch 'for-next/scmi' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging stm32/stm32-next (1e6bc5987a52 ARM: dts: stm32: Update AV96 adv7513=
 node per dtbs_check)
Merging sunxi/sunxi/for-next (bb289f4c0b2b Merge branches 'sunxi/clk-for-5.=
16', 'sunxi/core-for-5.16', 'sunxi/drivers-for-5.16', 'sunxi/dt-for-5.16' a=
nd 'sunxi/fixes-for-5.15' into sunxi/for-next)
Merging tegra/for-next (cc701ccede61 Merge branch for-5.15/arm64/dt into fo=
r-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (c1fa5ac6c2f4 arm64: dts: ti: k3-am642-sk: Add=
 pwm nodes)
Merging xilinx/for-next (4d7e3c8de98e Merge branch 'zynqmp/dt' of https://g=
ithub.com/Xilinx/linux-xlnx into for-next)
Merging clk/clk-next (6880fa6c5660 Linux 5.15-rc1)
Merging clk-imx/for-next (86842d255b45 clk: imx8mn: Add M7 core clock)
Merging clk-renesas/renesas-clk (e8425dd55abb clk: renesas: Make CLK_R9A06G=
032 invisible)
Merging clk-samsung/for-next (1d26eaeec37a clk: samsung: s5pv210-audss: Mak=
e use of devm_platform_ioremap_resource())
Merging csky/linux-next (90dc8c0e664e csky: Kconfig: Remove unused selects)
Merging h8300/h8300-next (1ec10274d436 h8300: don't implement set_fs)
Merging m68k/for-next (a7b68ed15d1f m68k: mvme: Remove overdue #warnings in=
 RTC handling)
Merging m68knommu/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging microblaze/next (315511166469 microblaze: move core-y in arch/micro=
blaze/Makefile to arch/microblaze/Kbuild)
Merging mips/mips-next (6880fa6c5660 Linux 5.15-rc1)
Merging nds32/next (07cd7745c6f2 nds32/setup: remove unused memblock_region=
 variable in setup_memory())
CONFLICT (content): Merge conflict in arch/nds32/Kconfig
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (1955d843efc3 openrisc/litex: Update defconfig)
Merging parisc-hd/for-next (1530bf2852cc Define and export PAGE0 in vmlinux=
.lds.S linker script)
Merging powerpc/next (a3314262eede Merge branch 'fixes' into next)
Merging soc-fsl/next (242b0b398ccd soc: fsl: enable acpi support in RCPM dr=
iver)
Merging risc-v/for-next (6f55ab36bef5 riscv: Move EXCEPTION_TABLE to RO_DAT=
A segment)
Merging s390/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging sh/for-next (2882b7626f49 sh: kernel: traps: remove unused variable)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (234640275675 um: rename set_signals() to um_set_sig=
nals())
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
Merging btrfs/for-next (e51480e6f4f8 Merge branch 'for-next-next-v5.15-2021=
0913' into for-next-20210913)
Merging ceph/master (4b0b8836ebba ceph: fix off by one bugs in unsafe_reque=
st_wait())
Merging cifs/for-next (4c51de1e8f92 cifs: fix incorrect kernel doc comments)
Merging cifsd/cifsd-for-next (bf9f243f23e6 Merge tag '5.15-rc-ksmbd-part2' =
of git://git.samba.org/ksmbd)
Merging configfs/for-next (c42dd069be8d configfs: fix a race in configfs_lo=
okup())
Merging ecryptfs/next (682a8e2b41ef Merge tag 'ecryptfs-5.13-rc1-updates' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs)
Merging erofs/dev (1266b4a7ecb6 erofs: fix double free of 'copied')
Merging exfat/dev (50be9417e23a Merge tag 'io_uring-5.14-2021-07-09' of git=
://git.kernel.dk/linux-block)
Merging ext3/for_next (ed518dd035fa Pull udf xattr sanity checks.)
Merging ext4/dev (948ca5f30e1d ext4: enforce buffer head state assertion in=
 ext4_da_map_blocks)
Merging f2fs/dev (1dbe7e386f50 Merge tag 'block-5.15-2021-09-05' of git://g=
it.kernel.dk/linux-block)
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (a9667ac88e2b fuse: remove unused arg in fuse_write_f=
ile_get())
Merging gfs2/for-next (08d736667185 gfs2: Remove redundant check from gfs2_=
glock_dq)
Merging jfs/jfs-next (5d299f44d765 jfs: Avoid field-overflowing memcpy())
Merging nfs/linux-next (6880fa6c5660 Linux 5.15-rc1)
Merging nfs-anna/linux-next (8cfb9015280d NFS: Always provide aligned buffe=
rs to the RPC read layers)
Merging nfsd/nfsd-next (e22ce8eb631b Linux 5.14-rc7)
Merging cel/for-next (0c217d5066c8 SUNRPC: improve error response to over-s=
ize gss credential)
Merging ntfs3/master (8e69212253d3 fs/ntfs3: Always use binary search with =
entry search)
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
Merging file-locks/locks-next (90f7d7a0d0d6 locks: remove LOCK_MAND flock l=
ock support)
Merging vfs/for-next (8f40da9494cf Merge branch 'misc.namei' into for-next)
Merging printk/for-next (9980c4251f8d printk: use kvmalloc instead of kmall=
oc for devkmsg_user)
Merging pci/next (6880fa6c5660 Linux 5.15-rc1)
Merging pstore/for-next/pstore (c5d4fb2539ca pstore/blk: Use "%lu" to forma=
t unsigned long)
Merging hid/for-next (4bc44ba4871f Merge branch 'for-5.15/core' into for-ne=
xt)
Merging i2c/i2c/for-next (cc1dbdeb17dd Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i3c/i3c/next (41a0430dd5ca i3c/master/mipi-i3c-hci: Prefer kcalloc =
over open coded arithmetic)
Merging dmi/dmi-for-next (f97a2103f1a7 firmware: dmi: Move product_sku info=
 to the end of the modalias)
Merging hwmon-staging/hwmon-next (f2a787937ec9 hwmon: (raspberrypi) Use gen=
eric notification mechanism)
Merging jc_docs/docs-next (7c5c18bdb656 docs: pdfdocs: Fix typo in CJK-lang=
uage specific font settings)
Merging v4l-dvb/master (9c3a0f285248 Merge tag 'v5.14-rc4' into media_tree)
Merging v4l-dvb-next/master (d62cd4d277cc media: uvcvideo: Remove unused in=
cluding <linux/version.h>)
Merging pm/linux-next (6880fa6c5660 Linux 5.15-rc1)
Merging cpufreq-arm/cpufreq/arm/linux-next (4855e26bcf4d cpufreq: mediatek-=
hw: Add support for CPUFREQ HW)
Merging cpupower/cpupower (79a0dc5530a9 tools: cpupower: fix typo in cpupow=
er-idle-set(1) manpage)
Merging devfreq/devfreq-next (e73f0f0ee754 Linux 5.14-rc1)
Merging opp/opp/linux-next (94274f20f6bf dt-bindings: opp: Convert to DT sc=
hema)
Merging thermal/thermal/linux-next (fc26023f8816 thermal/drivers/int340x: F=
ix tcc offset on resume)
Merging ieee1394/for-next (54b3bd99f094 firewire: nosy: switch from 'pci_' =
to 'dma_' API)
Merging dlm/next (ecd95673142e fs: dlm: avoid comms shutdown delay in relea=
se_lockspace)
Merging swiotlb/linux-next (f3c4b1341e83 swiotlb: use depends on for DMA_RE=
STRICTED_POOL)
Merging rdma/for-next (6a217437f9f5 Merge branch 'sg_nents' into rdma.git f=
or-next)
Merging net-next/master (13bb8429ca98 net: wwan: iosm: firmware flashing an=
d coredump collection)
Applying: Revert "isystem: delete global -isystem compile option"
Merging bpf-next/for-next (2f3830412786 libbpf: Make libbpf_version.h non-a=
uto-generated)
$ git reset --hard HEAD^
Merging next-20210913 version of bpf-next
Merging ipsec-next/master (9e9fb7655ed5 Merge tag 'net-next-5.15' of git://=
git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mlx5-next/mlx5-next (6880fa6c5660 Linux 5.15-rc1)
Merging netfilter-next/master (13bb8429ca98 net: wwan: iosm: firmware flash=
ing and coredump collection)
Merging ipvs-next/master (9e9fb7655ed5 Merge tag 'net-next-5.15' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging wireless-drivers-next/master (6880fa6c5660 Linux 5.15-rc1)
Merging bluetooth/master (81be03e026dc Bluetooth: RFCOMM: Replace use of me=
mcpy_from_msg with bt_skb_sendmmsg)
Merging mac80211-next/master (626bf91a292e Merge tag 'net-5.15-rc1' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging mtd/mtd/next (c1fe77e42440 Merge tag 'nand/for-5.15' into mtd/next)
Merging nand/nand/next (6b430c7595e4 mtd: rawnand: cafe: Fix a resource lea=
k in the error handling path of 'cafe_nand_probe()')
Merging spi-nor/spi-nor/next (2734d6c1b1a0 Linux 5.14-rc2)
Merging crypto/master (6ae51ffe5e76 crypto: sha512 - remove imaginary and m=
ystifying clearing of variables)
Merging drm/drm-next (6880fa6c5660 Linux 5.15-rc1)
Merging drm-misc/for-linux-next (70982eef4d7e drm/ttm: Fix a deadlock if th=
e target BO is not idle during swap)
Merging amdgpu/drm-next (1258fee6e4d3 drm/sched: fix the bug of time out ca=
lculation(v4))
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
Merging regmap/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging sound/for-next (7b9cf9036609 ALSA: usb-audio: Unify mixer resume an=
d reset_resume procedure)
Merging sound-asoc/for-next (8897c6ccc423 Merge remote-tracking branch 'aso=
c/for-5.16' into asoc-next)
Merging modules/modules-next (ced75a2f5da7 MAINTAINERS: Add Luis Chamberlai=
n as modules maintainer)
Merging input/next (e2afe95a87a2 dt-bindings: input: Add binding for cypres=
s-sf)
Merging block/for-next (291470332387 Merge branch 'iov_iter' into for-next)
Merging device-mapper/for-next (d3703ef33129 dm crypt: use in_hardirq() ins=
tead of deprecated in_irq())
Merging libata/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging pcmcia/pcmcia-next (e39cdacf2f66 pcmcia: i82092: fix a null pointer=
 dereference bug)
Merging mmc/next (b81bede4d138 mmc: renesas_sdhi: fix regression with hard =
reset on old SDHIs)
Merging mfd/for-mfd-next (cdff1eda6932 mfd: lpc_sch: Rename GPIOBASE to pre=
vent build error)
Merging backlight/for-backlight-next (79fad92f2e59 backlight: pwm_bl: Impro=
ve bootloader/kernel device handover)
Merging battery/for-next (c9398455b046 power: supply: core: Fix parsing of =
battery chemistry/technology)
Merging regulator/for-next (fa108e34d765 Merge remote-tracking branch 'regu=
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
Merging selinux/next (6880fa6c5660 Linux 5.15-rc1)
Merging smack/next (bfc3cac0c761 smack: mark 'smack_enabled' global variabl=
e as __initdata)
Merging tomoyo/master (7d2a07b76933 Linux 5.14)
Merging tpmdd/next (f985911b7bc7 crypto: public_key: fix overflow during im=
plicit conversion)
Merging watchdog/master (41e73feb1024 dt-bindings: watchdog: Add compatible=
 for Mediatek MT7986)
Merging iommu/next (b58886bf14da Merge branch 'iommu/fixes' into next)
Merging audit/next (57d4374be94a audit: rename struct node to struct audit_=
node to prevent future name collisions)
Merging devicetree/for-next (53182e81f47d kbuild: Enable DT schema checks f=
or %.dtb targets)
Merging mailbox/mailbox-for-next (85dfdbfc13ea mailbox: cmdq: add multi-gce=
 clocks support for mt8195)
Merging spi/for-next (69dde9e5a835 Merge remote-tracking branch 'spi/for-5.=
16' into spi-next)
Merging tip/auto-latest (5448a9e9f16a Merge branch 'x86/urgent')
Merging clockevents/timers/drivers/next (f196ae282070 dt-bindings: timer: A=
dd ABIs for new Ingenic SoCs)
Merging edac/edac-for-next (cf4e6d52f583 EDAC/i10nm: Retrieve and print ret=
ry_rd_err_log registers)
Merging irqchip/irq/irqchip-next (6e3b473ee064 Merge branch irq/qcom-pdc-no=
wake-cleanup into irq/irqchip-next)
Merging ftrace/for-next (5dfe50b05588 bootconfig: Rename xbc_node_find_chil=
d() to xbc_node_find_subkey())
Merging rcu/rcu/next (dd1b86279856 hrtimer: Don't apply offset to KTIME_MAX=
 values)
Merging kvm/next (109bbba5066b KVM: Drop unused kvm_dirty_gfn_invalid())
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
Merging workqueues/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging drivers-x86/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging chrome-platform/for-next (4665584888ad platform/chrome: cros_ec_tra=
ce: Fix format warnings)
Merging hsi/for-next (e73f0f0ee754 Linux 5.14-rc1)
Merging leds/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging ipmi/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging driver-core/driver-core-next (6880fa6c5660 Linux 5.15-rc1)
Merging usb/usb-next (6880fa6c5660 Linux 5.15-rc1)
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (6880fa6c5660 Linux 5.15-rc1)
Merging usb-chipidea-next/for-usb-next (e5d6a7c6cfae usb: chipidea: host: f=
ix port index underflow and UBSAN complains)
Merging tty/tty-next (6880fa6c5660 Linux 5.15-rc1)
Merging char-misc/char-misc-next (6880fa6c5660 Linux 5.15-rc1)
Merging extcon/extcon-next (07de34f5ce1e extcon: max3355: Drop unused inclu=
de)
Merging phy-next/next (6880fa6c5660 Linux 5.15-rc1)
Merging soundwire/next (6880fa6c5660 Linux 5.15-rc1)
Merging thunderbolt/next (42716425ad7e thunderbolt: Fix port linking by che=
cking all adapters)
Merging vfio/next (ea870730d83f Merge branches 'v5.15/vfio/spdx-license-cle=
anups', 'v5.15/vfio/dma-valid-waited-v3', 'v5.15/vfio/vfio-pci-core-v5' and=
 'v5.15/vfio/vfio-ap' into v5.15/vfio/next)
Merging staging/staging-next (0af8efc197d7 staging: r8188eu: remove rtl8188=
e_set_hal_ops())
Merging iio/togreg (d484c21bacfa iio: adc: Add driver for Renesas RZ/G2L A/=
D converter)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (8bf5d31c4f06 interconnect: qcom: osm-l3: Use driver-s=
pecific naming)
Merging dmaengine/next (6880fa6c5660 Linux 5.15-rc1)
Merging cgroup/for-next (c0002d11d799 cgroupv2, docs: fix misinformation in=
 "device controller" section)
Merging scsi/for-next (27f681116fdf Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (8bad75aca006 scsi: ufs: ufs-pci: Fix Intel LKF l=
ink stability)
Merging vhost/linux-next (91dd29f67ea7 vdpa: potential uninitialized return=
 in vhost_vdpa_va_map())
Merging rpmsg/for-next (c93ca5f21d93 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (3ea046564039 dt-bindings: gpio: add gpio-l=
ine-names to rockchip,gpio-bank.yaml)
Merging gpio-intel/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging pinctrl/for-next (04853352952b Merge tag 'samsung-pinctrl-5.15' of =
https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung into devel)
Merging pinctrl-intel/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging pinctrl-renesas/renesas-pinctrl (c4c4637eb57f pinctrl: renesas: Add=
 RZ/G2L pin and gpio controller driver)
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
Merging rtc/rtc-next (6880fa6c5660 Linux 5.15-rc1)
Merging nvdimm/libnvdimm-for-next (bdd3c50d83bf dax: remove bdev_dax_suppor=
ted)
Merging at24/at24/for-next (762925405482 dt-bindings: at24: add ON Semi CAT=
24C04 and CAT24C05)
Merging ntb/ntb-next (f96cb827ce49 ntb: ntb_pingpong: remove redundant init=
ialization of variables msg_data and spad_data)
Merging seccomp/for-next/seccomp (b4d8a58f8dcf seccomp: Fix setting loaded =
filter count during TSYNC)
Merging kspp/for-next/kspp (0c2406ffcdfe Merge branch 'for-next/overflow' i=
nto for-next/kspp)
CONFLICT (content): Merge conflict in include/linux/compiler_types.h
CONFLICT (content): Merge conflict in include/linux/compiler-gcc.h
CONFLICT (modify/delete): drivers/staging/rtl8188eu/include/ieee80211.h del=
eted in HEAD and modified in kspp/for-next/kspp. Version kspp/for-next/kspp=
 of drivers/staging/rtl8188eu/include/ieee80211.h left in tree.
$ git rm -f drivers/staging/rtl8188eu/include/ieee80211.h
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (0f79ce970e79 gnss: drop stray semicolons)
Merging fsi/next (9ab1428dfe2c fsi/sbefifo: Fix reset timeout)
Merging slimbus/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging nvmem/for-next (536267aafb8a nvmem: core: Add stubs for nvmem_cell_=
read_variable_le_u32/64 if !CONFIG_NVMEM)
Merging xarray/main (2c7e57a02708 idr test suite: Improve reporting from id=
r_find_test_1)
Merging hyperv/hyperv-next (9d68cd9120e4 hv_utils: Set the maximum packet s=
ize for VSS driver to the length of the receive buffer)
Merging auxdisplay/auxdisplay (24ebc044c72e auxdisplay: Replace symbolic pe=
rmissions with octal permissions)
Merging kgdb/kgdb/for-next (f8416aa29185 kernel: debug: Convert to SPDX ide=
ntifier)
Merging hmm/hmm (79fbd3e1241c RDMA: Use the sg_table directly and remove th=
e opencoded version from umem)
Merging fpga/for-next (4f45f3404960 spi: spi-altera-dfl: support n5010 feat=
ure revision)
Merging kunit/test (6880fa6c5660 Linux 5.15-rc1)
Merging cfi/cfi/next (ff1176468d36 Linux 5.14-rc3)
Merging kunit-next/kunit (6880fa6c5660 Linux 5.15-rc1)
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
Merging cxl/next (2b922a9d064f cxl/registers: Fix Documentation warning)
Merging folio/for-next (1a90e9dae32c mm/writeback: Add folio_write_one)
CONFLICT (content): Merge conflict in mm/util.c
CONFLICT (content): Merge conflict in mm/rmap.c
CONFLICT (content): Merge conflict in mm/page-writeback.c
CONFLICT (content): Merge conflict in mm/memcontrol.c
CONFLICT (content): Merge conflict in mm/filemap.c
CONFLICT (content): Merge conflict in include/linux/memcontrol.h
Merging akpm-current/current (1ee31a7d5844 hfsplus: fix out-of-bounds warni=
ngs in __hfsplus_setxattr)
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (ad8ac96dd1d6 mm/vmalloc: add __alloc_size attributes f=
or better bounds checking)

--Sig_/gApKeKDURAvX_DrO_rjS/bK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFAQ0oACgkQAVBC80lX
0GwaQwf/biUn3mxB4jDQh+5jY4rB8GZwS9QyswKxoOVqfiODjpf6bEcpJbMygl5m
hQPcWoZk0W5bjxXlgyoJfYEBwbhx+kjAXS4D6yZiydRBl8OO/LEcaNdGdMjlI7A4
kAfBwHduv8D2oSYDtbZ61M928SonIZvKqrsVuSKiWYoHkouClSfRFGIlG7FO4PDQ
/apr571vDjldELpd0OzFDuYvXxDbPcN1j2bdOggmOBIV3gpWAhFSEG5YCJeEmFN0
h3C9mWNq8PPmRq+neZTBMsnsNs+Ud712dD76FcB8mT7adZWBPsksNTVii/IOSfBk
7brSgKh7iRFKPcxDRB/h8IBnuT1vEQ==
=u8sx
-----END PGP SIGNATURE-----

--Sig_/gApKeKDURAvX_DrO_rjS/bK--
