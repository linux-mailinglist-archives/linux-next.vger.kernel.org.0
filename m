Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C150414186
	for <lists+linux-next@lfdr.de>; Wed, 22 Sep 2021 08:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232367AbhIVGJF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Sep 2021 02:09:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232141AbhIVGJF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Sep 2021 02:09:05 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43FFEC061574;
        Tue, 21 Sep 2021 23:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632290852;
        bh=cNEZqGGT+kJgRWF3Y/8Mbiyn9Uu+D5jxSC0Vi8JzdAE=;
        h=Date:From:To:Cc:Subject:From;
        b=pNp2ngPgVvqcXCJN39WCZQ/u26fnuGqbVOTE546N2wiHd8DZNR0MSMv+kVQBv9jID
         GJb8zFXtHrj6cmCLsRPOJJqg37FPLWfeZTV5zF6HIn/AfM9nyYKGnRRRy2b9iarsSZ
         s7D4e/TW9pS14r4amIr4VQVhybP6/2p1xFWdDwLYf6tnXyYryBBR2lM0u31p6YWuls
         oJE6U6JLX4oUsU68fcSVnDI66qhUG+qkh7QY3ZnJKq4lqLaQyYW/Etz32u4V0yNf8O
         00fsCZNXB1PaSAQs3+8S8SAeB5z9d6AaqY40zXCtuIOlrAK/hhRMH6bQfZqpvTfVIA
         cR0YPLysErSmw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HDnrh1sMQz9sVq;
        Wed, 22 Sep 2021 16:07:32 +1000 (AEST)
Date:   Wed, 22 Sep 2021 16:07:31 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 22
Message-ID: <20210922160731.360c6001@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8SfpIJHcSHf0x3P7rtDU6rJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8SfpIJHcSHf0x3P7rtDU6rJ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210921:

The drm-misc tree still had its build failure for which I reverted
3 commits.

The amdgpu tree lost its build failure.

The drm-intel tree gained a semantic conflict against the amdgpu tree
for which I applied a supplied patch.

The staging tree gained a conflict against the staging.current tree.

The akpm tree lost a patch that turned up elsewhere.

Non-merge commits (relative to Linus' tree): 3166
 3216 files changed, 154003 insertions(+), 69535 deletions(-)

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
Merging origin/master (92477dd1faa6 Merge tag 's390-5.15-ebpf-jit-fixes' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux)
Merging fixes/fixes (3ca706c189db drm/ttm: fix type mismatch error on sparc=
64)
Merging kbuild-current/fixes (0664684e1ebd kbuild: Add -Werror=3Dignored-op=
timization-argument to CLANG_FLAGS)
Merging arc-current/for-curr (6880fa6c5660 Linux 5.15-rc1)
Merging arm-current/fixes (463dbba4d189 ARM: 9104/2: Fix Keystone 2 kernel =
mapping regression)
Merging arm64-fixes/for-next/fixes (0e3dbf765fe2 kselftest/arm64: signal: S=
kip tests if required features are missing)
Merging arm-soc-fixes/arm/fixes (3f1c260ffddb MAINTAINERS: Add myself as MS=
tar/Sigmastar Armv7 SoC maintainers)
Merging drivers-memory-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging m68k-current/for-linus (a7b68ed15d1f m68k: mvme: Remove overdue #wa=
rnings in RTC handling)
Merging powerpc-fixes/fixes (c006a06508db powerpc/xics: Set the IRQ chip da=
ta for the ICS native backend)
Merging s390-fixes/fixes (f5711f9df924 s390: remove WARN_DYNAMIC_STACK)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (27c106addfcc fs-verity: fix signed inte=
ger overflow with i_size near S64_MAX)
Merging net/master (b3f98404bd62 Merge branch 'dsa-devres')
Merging bpf/master (bc23f7244817 bpf/tests: Add tail call limit test with e=
xternal function call)
Merging ipsec/master (047a749d231e Merge branch 'xfrm: fix uapi for the def=
ault policy')
Merging netfilter/master (e9edc188fc76 netfilter: conntrack: serialize hash=
 resizes and cleanups)
Merging ipvs/master (e9edc188fc76 netfilter: conntrack: serialize hash resi=
zes and cleanups)
Merging wireless-drivers/master (91dab18f0df1 MAINTAINERS: Move Daniel Drak=
e to credits)
Merging mac80211/master (36747c96ed49 Merge branch 'hns3-fixes')
Merging rdma-fixes/for-rc (ca465e1f1f9b RDMA/cma: Fix listener leak in rdma=
_cma_listen_on_all() failure)
Merging sound-current/for-linus (cb1bcf5ed536 ALSA: firewire-motu: fix trun=
cated bytes in message tracepoints)
Merging sound-asoc-fixes/for-linus (e8e66cd16462 Merge remote-tracking bran=
ch 'asoc/for-5.15' into asoc-linus)
Merging regmap-fixes/for-linus (6880fa6c5660 Linux 5.15-rc1)
Merging regulator-fixes/for-linus (024a0383b3fa Merge remote-tracking branc=
h 'regulator/for-5.15' into regulator-linus)
Merging spi-fixes/for-linus (1bac59c285f3 Merge remote-tracking branch 'spi=
/fix/modalias' into spi-linus)
CONFLICT (content): Merge conflict in drivers/spi/spi-tegra20-slink.c
Merging pci-current/for-linus (e4e737bb5c17 Linux 5.15-rc2)
Merging driver-core.current/driver-core-linus (2de9d8e0d2fe driver core: fw=
_devlink: Improve handling of cyclic dependencies)
Merging tty.current/tty-linus (7049d853cfb9 tty: unexport tty_ldisc_release)
Merging usb.current/usb-linus (517c7bf99bad usb: musb: tusb6010: uninitiali=
zed data in tusb_fifo_write_unaligned())
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (1ca200a8c6f0 USB: serial: option: remov=
e duplicate USB device ID)
Merging usb-chipidea-fixes/for-usb-fixes (98a1373a2de9 usb: cdns3: fix race=
 condition before setting doorbell)
Merging phy/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging staging.current/staging-linus (aa3233ea7bdb staging: r8188eu: fix -=
Wrestrict warnings)
Merging iio-fixes/fixes-togreg (8167c9a375cc iio: ssp_sensors: add more ran=
ge checking in ssp_parse_dataframe())
Merging char-misc.current/char-misc-linus (bb509a6ffed2 comedi: Fix memory =
leak in compat_insnlist())
Merging soundwire-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging thunderbolt-fixes/fixes (e4e737bb5c17 Linux 5.15-rc2)
Merging input-current/for-linus (0c5483a5778f Input: analog - always use kt=
ime functions)
Merging crypto-current/master (6ae51ffe5e76 crypto: sha512 - remove imagina=
ry and mystifying clearing of variables)
Merging vfio-fixes/for-linus (dc51ff91cf2d vfio/platform: fix module_put ca=
ll in error flow)
Merging kselftest-fixes/fixes (f5013d412a43 selftests: kvm: fix get_run_del=
ay() ignoring fscanf() return warn)
Merging modules-fixes/modules-linus (055f23b74b20 module: check for exit se=
ctions in layout_sections() instead of module_init_section())
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
Merging kvm-fixes/master (e4e737bb5c17 Linux 5.15-rc2)
Merging kvms390-fixes/master (cd4220d23bf3 KVM: selftests: do not require 6=
4GB in set_memory_region_test)
Merging hwmon-fixes/hwmon (e6fab7af6ba1 hwmon: (mlxreg-fan) Return non-zero=
 value when fan current state is enforced from sysfs)
Merging nvdimm-fixes/libnvdimm-fixes (32b2397c1e56 libnvdimm/pmem: Fix cras=
h triggered when I/O in-flight during unbind)
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
Merging scsi-fixes/fixes (1a0db7744e45 scsi: bsg: Fix device unregistration)
Merging drm-fixes/drm-fixes (e4e737bb5c17 Linux 5.15-rc2)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (b875fb313a10 drm/i915: Free a=
ll DMC payloads)
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
Merging fpga-fixes/fixes (e9a9970bf520 fpga: dfl: Avoid reads to AFU CSRs d=
uring enumeration)
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
Merging cel-fixes/for-rc (7d2a07b76933 Linux 5.14)
Merging irqchip-fixes/irq/irqchip-fixes (0ddc5e55e6f1 Documentation: Fix ir=
q-domain.rst build warning)
Merging renesas-fixes/fixes (432b52eea3dc ARM: shmobile: defconfig: Restore=
 graphical consoles)
Merging perf-current/perf/urgent (219d720e6df7 perf bpf: Ignore deprecation=
 warning when using libbpf's btf__get_from_id())
Merging drm-misc-fixes/for-linux-next-fixes (5d7fa05c8f63 drm/nouveau/fifo/=
ga102: initialise chid on return from channel creation)
CONFLICT (content): Merge conflict in drivers/gpu/drm/vc4/vc4_hdmi.c
Merging kspp-gustavo/for-next/kspp (ad9ee403ca4d Merge branch 'for-next/cla=
ng-fallthrough' into for-next/kspp)
Merging kbuild/for-next (860091ee86e6 riscv: move the (z)install rules to a=
rch/riscv/Makefile)
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
Merging arm64/for-next/core (85f58eb18898 arm64: kdump: Skip kmemleak scan =
reserved memory for kdump)
Merging arm-perf/for-next/perf (fd264b310579 arm64/perf: Replace '0xf' inst=
ances with ID_AA64DFR0_PMUVER_IMP_DEF)
Merging arm-soc/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (83e38509109e Merge branch 'v5.16/dt64' into for-n=
ext)
Merging aspeed/for-next (0f32f00af344 Merge branches 'dt-for-v5.15', 'soc-f=
or-v5.15' and 'defconfig-for-v5.15' into for-next)
Merging at91/at91-next (8aff56d060f4 Merge branch 'at91-dt' into at91-next)
Merging drivers-memory/for-next (13324edbe926 memory: tegra186-emc: Handle =
errors in BPMP response)
Merging imx-mxs/for-next (2cb411d89676 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (cb293d3b430e Merge branch 'for_5.15/drivers-soc' int=
o next)
Merging mediatek/for-next (69862ae4e378 Merge branch 'v5.14-next/soc' into =
for-next)
Merging mvebu/for-next (930af8dda750 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (7911f95d1713 Merge branch 'fixes' into for-next)
Merging qcom/for-next (d47a2fb5730b Merge branches 'arm64-for-5.16', 'drive=
rs-for-5.16' and 'dts-for-5.16' into for-next)
Merging raspberrypi/for-next (9f5289ec6f1c ARM: dts: bcm2711-rpi-4-b: Fix u=
sb's unit address)
Merging renesas/next (41c50f42a51c Merge branches 'renesas-arm-dt-for-v5.16=
', 'renesas-drivers-for-v5.16' and 'renesas-dt-bindings-for-v5.16' into ren=
esas-next)
Merging reset/reset/next (09f3824342f6 reset: simple: remove ZTE details in=
 Kconfig help)
Merging rockchip/for-next (6092ed8fe34a Merge branch 'v5.16-clk/next' into =
for-next)
Merging samsung-krzk/for-next (1523dddcd195 Merge branch 'next/soc' into fo=
r-next)
Merging scmi/for-linux-next (34eae8520c88 Merge branch 'for-next/juno' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging stm32/stm32-next (350081007916 ARM: dts: stm32: set the DCMI pins o=
n stm32mp157c-odyssey)
Merging sunxi/sunxi/for-next (bb289f4c0b2b Merge branches 'sunxi/clk-for-5.=
16', 'sunxi/core-for-5.16', 'sunxi/drivers-for-5.16', 'sunxi/dt-for-5.16' a=
nd 'sunxi/fixes-for-5.15' into sunxi/for-next)
Merging tegra/for-next (cc701ccede61 Merge branch for-5.15/arm64/dt into fo=
r-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (6037c75b193a arm64: dts: ti: k3-am65: Relocat=
e thermal-zones to SoC specific location)
Merging xilinx/for-next (35a7430dad4d arm64: zynqmp: Wire psgtr for zc1751-=
xm013)
Merging clk/clk-next (1cbc04ffedcc Merge branch 'clk-mtk' into clk-next)
Merging clk-imx/for-next (1f4b035e603b clk: imx: Fix the build break when c=
lk-imx8ulp build as module)
Merging clk-renesas/renesas-clk (8ac4aedcf7b3 clk: renesas: r8a779a0: Add T=
PU clock)
Merging clk-samsung/for-next (1d26eaeec37a clk: samsung: s5pv210-audss: Mak=
e use of devm_platform_ioremap_resource())
Merging csky/linux-next (90dc8c0e664e csky: Kconfig: Remove unused selects)
Merging h8300/h8300-next (1ec10274d436 h8300: don't implement set_fs)
Merging m68k/for-next (a7b68ed15d1f m68k: mvme: Remove overdue #warnings in=
 RTC handling)
Merging m68knommu/for-next (6880fa6c5660 Linux 5.15-rc1)
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
Merging s390/for-next (9ec953c0a7e1 Merge branch 'fixes' into for-next)
Merging sh/for-next (12285ff8667b sh: kdump: add some attribute to function)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (234640275675 um: rename set_signals() to um_set_sig=
nals())
Merging xtensa/xtensa-for-next (7b7cec477fc3 xtensa: move core-y in arch/xt=
ensa/Makefile to arch/xtensa/Kbuild)
Merging pidfd/for-next (f4dd02cd8631 Merge branch 'kernel.sys' into for-nex=
t)
Merging fscrypt/master (a2993db1807b fscrypt: allow 256-bit master keys wit=
h AES-256-XTS)
Merging fscache/fscache-next (97b85f2079a9 Merge branch 'fscache-iter-3' in=
to fscache-next)
Merging afs/afs-next (7af08140979a Revert "gcov: clang: fix clang-11+ build=
")
Merging btrfs/for-next (e51480e6f4f8 Merge branch 'for-next-next-v5.15-2021=
0913' into for-next-20210913)
Merging ceph/master (708c87168b61 ceph: fix off by one bugs in unsafe_reque=
st_wait())
Merging cifs/for-next (fdf507845879 Merge tag '5.15-rc1-smb3' of git://git.=
samba.org/sfrench/cifs-2.6)
Merging cifsd/cifsd-for-next (f38ba3190bed ksmbd: remove follow symlinks su=
pport)
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
Merging f2fs/dev (6663b138ded1 f2fs: set SBI_NEED_FSCK flag when inconsiste=
nt node block found)
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (7a41554fdfb0 fuse: move fuse_invalidate_attr() into =
fuse_update_ctime())
Merging gfs2/for-next (11603f0011d0 gfs2: Allow append and immutable bits t=
o coexist)
Merging jfs/jfs-next (5d299f44d765 jfs: Avoid field-overflowing memcpy())
Merging nfs/linux-next (e4e737bb5c17 Linux 5.15-rc2)
Merging nfs-anna/linux-next (8cfb9015280d NFS: Always provide aligned buffe=
rs to the RPC read layers)
Merging nfsd/nfsd-next (e22ce8eb631b Linux 5.14-rc7)
Merging cel/for-next (02579b2ff8b0 nfsd: back channel stuck in SEQ4_STATUS_=
CB_PATH_DOWN)
Merging ntfs3/master (6354467245ff fs/ntfs3: Add sync flag to ntfs_sb_write=
_run and al_update)
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
Merging pci/next (ef4bce990eab Merge branch 'pci/virtualization')
Merging pstore/for-next/pstore (c5d4fb2539ca pstore/blk: Use "%lu" to forma=
t unsigned long)
Merging hid/for-next (8ca10560f402 Merge branch 'for-5.15/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (294b29f15469 i2c: xiic: Fix RX IRQ busy check)
Merging i3c/i3c/next (41a0430dd5ca i3c/master/mipi-i3c-hci: Prefer kcalloc =
over open coded arithmetic)
Merging dmi/dmi-for-next (f97a2103f1a7 firmware: dmi: Move product_sku info=
 to the end of the modalias)
Merging hwmon-staging/hwmon-next (cd0b8e410937 hwmon: (nct6775) Support acc=
ess via Asus WMI)
Merging jc_docs/docs-next (242f4c77b1c8 docs: zh_TW/index: Move arm64/index=
 to arch-specific section)
Merging v4l-dvb/master (e4e737bb5c17 Linux 5.15-rc2)
Merging v4l-dvb-next/master (952aab37b121 Merge tag 'v5.15-rc2' into media_=
stage)
Applying: fix for "media: ir_toy: allow tx carrier to be set"
Merging pm/linux-next (163807478ffd Merge branch 'devprop' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (4855e26bcf4d cpufreq: mediatek-=
hw: Add support for CPUFREQ HW)
Merging cpupower/cpupower (79a0dc5530a9 tools: cpupower: fix typo in cpupow=
er-idle-set(1) manpage)
Merging devfreq/devfreq-next (6880fa6c5660 Linux 5.15-rc1)
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
Merging rdma/for-next (ad17bbef3dd5 RDMA/rxe: remove the unnecessary variab=
le)
Merging net-next/master (07b855628c22 net/ipv4/sysctl_net_ipv4.c: remove su=
perfluous header files from sysctl_net_ipv4.c)
Merging bpf-next/for-next (cf8980a36235 samples: bpf: Convert ARP table net=
work order fields into readable format)
Merging ipsec-next/master (9e9fb7655ed5 Merge tag 'net-next-5.15' of git://=
git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mlx5-next/mlx5-next (6880fa6c5660 Linux 5.15-rc1)
Merging netfilter-next/master (13bb8429ca98 net: wwan: iosm: firmware flash=
ing and coredump collection)
Merging ipvs-next/master (13bb8429ca98 net: wwan: iosm: firmware flashing a=
nd coredump collection)
Merging wireless-drivers-next/master (60fe1f8dcd3c rt2x00: remove duplicate=
 USB device ID)
Merging bluetooth/master (24ff62ae383f Bluetooth: btusb: Add gpio reset way=
 for qca btsoc in cmd_timeout)
Merging mac80211-next/master (14e94f9445a9 octeontx2-af: verify CQ context =
updates)
Merging mtd/mtd/next (b72841e4dcd5 mtd: mtdswap: Remove redundant assignmen=
t of pointer eb)
Merging nand/nand/next (46a0dc10fb32 mtd: rawnand: intel: Fix potential buf=
fer overflow in probe)
Merging spi-nor/spi-nor/next (2734d6c1b1a0 Linux 5.14-rc2)
Merging crypto/master (a2d3cbc80d25 crypto: aesni - check walk.nbytes inste=
ad of err)
Merging drm/drm-next (6880fa6c5660 Linux 5.15-rc1)
Merging drm-misc/for-linux-next (56cd47b4705d MAINTAINERS: fix typo in DRM =
DRIVER FOR SAMSUNG S6D27A1 PANELS)
Applying: Revert "drm/vc4: dsi: Switch to devm_drm_of_get_bridge"
Applying: Revert "drm/vc4: dpi: Switch to devm_drm_of_get_bridge"
Applying: Revert "drm/bridge: Add a function to abstract away panels"
Merging amdgpu/drm-next (e2a5ed914342 drm/amd/display: Fix wrong format spe=
cifier in amdgpu_dm.c)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/core/d=
c_link_dp.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_rin=
g.c
Merging drm-intel/for-linux-next (e01163e82b70 drm/i915/dg2: configure TRAN=
S_DP2_VFREQ{HIGH,LOW} for 128b/132b)
Applying: fix for drm/dp: add LTTPR DP 2.0 DPCD addresses
Merging drm-tegra/drm/tegra/for-next (c3dbfb9c49ee gpu: host1x: Plug potent=
ial memory leak)
Merging drm-msm/msm-next (cb0927ab80d2 drm/msi/mdp4: populate priv->kms in =
mdp4_kms_init)
Merging imx-drm/imx-drm/next (20fbfc81e390 drm/imx: imx-tve: Make use of th=
e helper function devm_platform_ioremap_resource())
Merging etnaviv/etnaviv/next (81fd23e2b3cc drm/etnaviv: Implement mmap as G=
EM object function)
Merging regmap/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging sound/for-next (f02f2f1bf9d1 ALSA: usx2y: Prefer struct_size over o=
pen coded arithmetic)
Merging sound-asoc/for-next (13e316ede5c2 Merge remote-tracking branch 'aso=
c/for-5.16' into asoc-next)
Merging modules/modules-next (ced75a2f5da7 MAINTAINERS: Add Luis Chamberlai=
n as modules maintainer)
Merging input/next (09182ed20c04 Input: goodix - add support for controller=
s without flash)
Merging block/for-next (32ac44a96a8e Merge branch 'for-5.16/drivers' into f=
or-next)
Merging device-mapper/for-next (d3703ef33129 dm crypt: use in_hardirq() ins=
tead of deprecated in_irq())
Merging libata/for-next (0e96dc47b95a ahci: remove duplicated PCI device ID=
s)
Merging pcmcia/pcmcia-next (e39cdacf2f66 pcmcia: i82092: fix a null pointer=
 dereference bug)
Merging mmc/next (4ed8431c42ba Merge branch 'fixes' into next)
Merging mfd/for-mfd-next (cdff1eda6932 mfd: lpc_sch: Rename GPIOBASE to pre=
vent build error)
Merging backlight/for-backlight-next (79fad92f2e59 backlight: pwm_bl: Impro=
ve bootloader/kernel device handover)
Merging battery/for-next (c9398455b046 power: supply: core: Fix parsing of =
battery chemistry/technology)
Merging regulator/for-next (09aef6aff450 Merge remote-tracking branch 'regu=
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
Merging selinux/next (d9d8c93938c4 Smack: Brutalist io_uring support)
CONFLICT (content): Merge conflict in fs/io-wq.c
Merging smack/next (0817534ff9ea smackfs: Fix use-after-free in netlbl_catm=
ap_walk())
Merging tomoyo/master (7d2a07b76933 Linux 5.14)
Merging tpmdd/next (f985911b7bc7 crypto: public_key: fix overflow during im=
plicit conversion)
Merging watchdog/master (41e73feb1024 dt-bindings: watchdog: Add compatible=
 for Mediatek MT7986)
Merging iommu/next (b58886bf14da Merge branch 'iommu/fixes' into next)
Merging audit/next (8e71168e2cc7 lsm_audit: avoid overloading the "key" aud=
it field)
Merging devicetree/for-next (9ae54ce551e9 kbuild: Enable dtc 'unit_address_=
format' warning by default)
Merging mailbox/mailbox-for-next (85dfdbfc13ea mailbox: cmdq: add multi-gce=
 clocks support for mt8195)
Merging spi/for-next (647282d9f864 Merge remote-tracking branch 'spi/for-5.=
16' into spi-next)
Merging tip/auto-latest (9bc19c975c7e Merge branch 'tip-master' into tip-au=
to-latest)
Merging clockevents/timers/drivers/next (f196ae282070 dt-bindings: timer: A=
dd ABIs for new Ingenic SoCs)
Merging edac/edac-for-next (4646da896a44 Merge branch 'edac-urgent' into ed=
ac-for-next)
Merging irqchip/irq/irqchip-next (6e3b473ee064 Merge branch irq/qcom-pdc-no=
wake-cleanup into irq/irqchip-next)
Merging ftrace/for-next (5dfe50b05588 bootconfig: Rename xbc_node_find_chil=
d() to xbc_node_find_subkey())
Merging rcu/rcu/next (9c2eed2c4c24 rcu: Replace ________p1 and _________p1 =
with __UNIQUE_ID(rcu))
Merging kvm/next (109bbba5066b KVM: Drop unused kvm_dirty_gfn_invalid())
Merging kvm-arm/next (419025b3b419 Merge branch kvm-arm64/misc-5.15 into kv=
marm-master/next)
Merging kvm-ppc/kvm-ppc-next (72476aaa4691 KVM: PPC: Book3S HV: Fix host ra=
dix SLB optimisation with hash guests)
Merging kvms390/next (a3e03bc1368c KVM: s390: index kvm->arch.idle_mask by =
vcpu_idx)
Merging xen-tip/linux-next (0594c58161b6 xen/x86: fix PV trap handling on s=
econdary processors)
Merging percpu/for-next (a81a52b325ec Merge branch 'for-5.14-fixes' into fo=
r-next)
Merging workqueues/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging drivers-x86/for-next (f6045de1f532 platform/x86: amd-pmc: Export Id=
lemask values based on the APU)
Merging chrome-platform/for-next (5135b2139212 MAINTAINERS: Add Prashant's =
maintainership of cros_ec drivers)
Merging hsi/for-next (e73f0f0ee754 Linux 5.14-rc1)
Merging leds/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging ipmi/for-next (35f4caec9d51 ipmi: Disable some operations during a =
panic)
Merging driver-core/driver-core-next (820879ee1865 sysfs: simplify sysfs_kf=
_seq_show)
Merging usb/usb-next (577ee98932fb Revert "arm64: qcom: ipq6018: add usb3 D=
T description")
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (6400b9749104 USB: serial: allow hung up ports =
to be suspended)
Merging usb-chipidea-next/for-usb-next (78665f57c3fa usb: chipidea: udc: ma=
ke controller hardware endpoint primed)
Merging tty/tty-next (b55c8aa6b1ab tty: moxa: merge moxa.h into moxa.c)
Merging char-misc/char-misc-next (d06246ebd773 scripts/tags.sh: Fix obsolet=
e parameter for ctags)
Merging extcon/extcon-next (1a4bedc5305b extcon: extcon-axp288: Use P-Unit =
semaphore lock for register accesses)
Merging phy-next/next (6880fa6c5660 Linux 5.15-rc1)
Merging soundwire/next (6880fa6c5660 Linux 5.15-rc1)
Merging thunderbolt/next (e4e737bb5c17 Linux 5.15-rc2)
Merging vfio/next (ea870730d83f Merge branches 'v5.15/vfio/spdx-license-cle=
anups', 'v5.15/vfio/dma-valid-waited-v3', 'v5.15/vfio/vfio-pci-core-v5' and=
 'v5.15/vfio/vfio-ap' into v5.15/vfio/next)
Merging staging/staging-next (7bdedfef085b staging: r8188eu: Remove mp, a.k=
.a. manufacturing process, code)
CONFLICT (content): Merge conflict in drivers/staging/r8188eu/os_dep/ioctl_=
linux.c
Merging iio/togreg (55c45baaaf78 iio: adc: rockchip_saradc: Make use of the=
 helper function devm_platform_ioremap_resource())
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (13404ac8882f interconnect: qcom: sdm660: Add missing =
a2noc qos clocks)
Merging dmaengine/next (6880fa6c5660 Linux 5.15-rc1)
Merging cgroup/for-next (7ee285395b21 cgroup: Make rebind_subsystems() disa=
ble v2 controllers all at once)
Merging scsi/for-next (1a0db7744e45 scsi: bsg: Fix device unregistration)
Merging scsi-mkp/for-next (7e642ca0375b scsi: target: Remove unused functio=
n arguments)
Merging vhost/linux-next (be9c6bad9b46 vdpa: potential uninitialized return=
 in vhost_vdpa_va_map())
Merging rpmsg/for-next (99fdaca991f7 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (3ea046564039 dt-bindings: gpio: add gpio-l=
ine-names to rockchip,gpio-bank.yaml)
Merging gpio-intel/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging pinctrl/for-next (788ac97efa94 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging pinctrl-renesas/renesas-pinctrl (075667cc6c29 pinctrl: renesas: No =
need to initialise global statics)
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
Merging kspp/for-next/kspp (0c91d23b6783 treewide: Replace 0-element memcpy=
() destinations with flexible arrays)
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
Merging folio/for-next (1a90e9dae32c mm/writeback: Add folio_write_one)
CONFLICT (content): Merge conflict in mm/util.c
CONFLICT (content): Merge conflict in mm/rmap.c
CONFLICT (content): Merge conflict in mm/page-writeback.c
CONFLICT (content): Merge conflict in mm/memcontrol.c
CONFLICT (content): Merge conflict in mm/filemap.c
CONFLICT (content): Merge conflict in include/linux/memcontrol.h
CONFLICT (modify/delete): fs/cachefiles/rdwr.c deleted in HEAD and modified=
 in folio/for-next. Version folio/for-next of fs/cachefiles/rdwr.c left in =
tree.
$ git rm -f fs/cachefiles/rdwr.c
Applying: fix up for "9p: (untested) Convert to using the netfs helper lib =
to do reads and caching"
Merging akpm-current/current (84dda76fe9a8 ipc/ipc_sysctl.c: remove fallbac=
k for !CONFIG_PROC_SYSCTL)
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
dropping fcd0bb3538e9b2686c5c8f5a0fee49393fb039d9 assoc_array: avoid open c=
oded arithmetic in allocator arguments -- patch contents already upstream
Merging akpm/master (ba7e7ae62883 mm: unexport {,un}lock_page_memcg)

--Sig_/8SfpIJHcSHf0x3P7rtDU6rJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFKyCMACgkQAVBC80lX
0GxG+Qf/XLXnGTfQVa6kA1KS3PJ4OI5Bi6HNB7o0TY2KIRG3TonKZGcnQspYcgkv
cH8p11L0LGS25sejIenAHTqQuYFb2g9kmVZ+7ABSQ6I7mANrDvncjMJsUCZQ9JZX
d2ZmU2XoQPMVuOpfLg8duwlz1rDAD28dBqF2a4Tl+l0dmxISD6jD78Bdu2Gq52f5
RpO3ghirtDW5GOx3LuGXdEzntVJRYfRgMyIcFTfBZU8OKz1Ogti5gHZIpcKU8IMd
RbD2pFYrQ8gFvvUQ/g6TbnZYAnq3F+MrRKWEIzKvvhAkVVuisfVEZYbupqo7Sm9O
ywXn3J73MjJRs333XDS98rQ0Ex1tlw==
=ARPG
-----END PGP SIGNATURE-----

--Sig_/8SfpIJHcSHf0x3P7rtDU6rJ--
