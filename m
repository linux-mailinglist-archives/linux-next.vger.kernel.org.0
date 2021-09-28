Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 062B341A9A0
	for <lists+linux-next@lfdr.de>; Tue, 28 Sep 2021 09:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239064AbhI1HZH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Sep 2021 03:25:07 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:58647 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236713AbhI1HZG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Sep 2021 03:25:06 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HJWFV39Dhz4xVP;
        Tue, 28 Sep 2021 17:23:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632813806;
        bh=O4ZXHrQjGlV/g/ikPCJ5R45IDbkNqgVc1ic1IfIdu1c=;
        h=Date:From:To:Cc:Subject:From;
        b=umbMetzk70mJV7kloZ6JyJh7E3AVvH2RFlY9c1eohl9qXfGTrtfdomQrLxnVVIuH7
         ef/ktk70C8DZg7k8+t4ecIp2KX9SEKYEdvrXa4uEvqQB1Pb/z2prIxY6PwBf7+ytyd
         5crFHwUZoADR4xq7tnVW8bmcf2G+cw+qjkEowWVgRg8ajF2H6k27nqwbTokbX/vtNf
         v33E57Brag2WhOMUSNs/YDyKwd5/uSdDoWD7KKO6j6YiF+dLZ4EckT31jlv6pmgDCl
         X1UN2ZwIPRu3OVn8FNqH3V489cdlaqI2yWsdDRx+GrCA5D9iAk1tDxLjEsw63h0Mlj
         6lX9u2MU0LfQw==
Date:   Tue, 28 Sep 2021 17:23:25 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 28
Message-ID: <20210928172325.6666e86a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/w=J3SuMkimVE2sa8zvlKqkk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/w=J3SuMkimVE2sa8zvlKqkk
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210927:

The bluetooth tree still had its build failure so I used the version
from next-20210924.

The crypto tree still had its build failure for which I applied a
supplied patch.

The sound-asoc tree gained a build failure for which I reverted a commit.

The rtc tree lost its build failure.

The rust tree gained a semantic conflict against the kbuild tree for
which I reverted a couple of commits from the kbuild tree.

Non-merge commits (relative to Linus' tree): 3848
 3864 files changed, 180795 insertions(+), 80794 deletions(-)

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
Merging origin/master (0513e464f900 Merge tag 'perf-tools-fixes-for-v5.15-2=
021-09-27' of git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux)
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
Merging net/master (3b1b6e82fb5e net: phy: enhance GPY115 loopback disable =
function)
Merging bpf/master (2248c2fca9c2 bpf, test, cgroup: Use sk_{alloc,free} for=
 test cases)
Merging ipsec/master (93ec1320b017 xfrm: fix rcu lock in xfrm_notify_userpo=
licy())
Merging netfilter/master (7fe7f3182a0d Merge git://git.kernel.org/pub/scm/l=
inux/kernel/git/pablo/nf)
Merging ipvs/master (e9edc188fc76 netfilter: conntrack: serialize hash resi=
zes and cleanups)
Merging wireless-drivers/master (fb8c3a3c5240 ath5k: fix building with LEDS=
=3Dm)
Merging mac80211/master (33092aca857b mac80211: Fix Ptk0 rekey documentatio=
n)
Merging rdma-fixes/for-rc (a86cd017a40a RDMA/usnic: Lock VF with mutex inst=
ead of spinlock)
Merging sound-current/for-linus (09d23174402d ALSA: rawmidi: introduce SNDR=
V_RAWMIDI_IOCTL_USER_PVERSION)
Merging sound-asoc-fixes/for-linus (a28b8ad108cb Merge remote-tracking bran=
ch 'asoc/for-5.15' into asoc-linus)
Merging regmap-fixes/for-linus (6880fa6c5660 Linux 5.15-rc1)
Merging regulator-fixes/for-linus (5816b3e6577e Linux 5.15-rc3)
Merging spi-fixes/for-linus (59c4e190b10c Merge tag 'v5.15-rc3' into spi-5.=
15)
Merging pci-current/for-linus (e4e737bb5c17 Linux 5.15-rc2)
Merging driver-core.current/driver-core-linus (04f41c68f188 net: mdiobus: S=
et FWNODE_FLAG_NEEDS_CHILD_BOUND_ON_ADD for mdiobus parents)
Merging tty.current/tty-linus (5816b3e6577e Linux 5.15-rc3)
Merging usb.current/usb-linus (5816b3e6577e Linux 5.15-rc3)
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (5816b3e6577e Linux 5.15-rc3)
Merging usb-chipidea-fixes/for-usb-fixes (98a1373a2de9 usb: cdns3: fix race=
 condition before setting doorbell)
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
Merging kvm-fixes/master (5c49d1850ddd KVM: VMX: Fix a TSX_CTRL_CPUID_CLEAR=
 field mask issue)
Merging kvms390-fixes/master (cd4220d23bf3 KVM: selftests: do not require 6=
4GB in set_memory_region_test)
Merging hwmon-fixes/hwmon (6f7d70467121 hwmon: (ltc2947) Properly handle er=
rors when looking for the external clock)
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
Merging scsi-fixes/fixes (fbdac19e6428 scsi: ses: Retry failed Send/Receive=
 Diagnostic commands)
Merging drm-fixes/drm-fixes (ef88d7a8a5c9 Merge tag 'drm-intel-fixes-2021-0=
9-23' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes)
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
Merging gpio-brgl-fixes/gpio/for-current (b22a4705e2e6 gpio/rockchip: fix g=
et_direction value handling)
Merging gpio-intel-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
Merging pinctrl-intel-fixes/fixes (6880fa6c5660 Linux 5.15-rc1)
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
Merging perf-current/perf/urgent (4da8b121884d perf iostat: Fix Segmentatio=
n fault from NULL 'struct perf_counts_values *')
Merging drm-misc-fixes/for-linux-next-fixes (19bd6cdb9ce0 drm/panel: abt-y0=
30xx067a: yellow tint fix)
CONFLICT (content): Merge conflict in drivers/gpu/drm/vc4/vc4_hdmi.c
Merging kspp-gustavo/for-next/kspp (6409e7102a9b Merge branch 'for-next/ksp=
p-fixes' into for-next/kspp)
Merging kbuild/for-next (16f361016821 kconfig: remove 'const' from the retu=
rn type of sym_escape_string())
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
Merging aspeed/for-next (e986277a56da Merge branches 'defconfig-for-v5.16' =
and 'dt-for-v5.16' into for-next)
Merging at91/at91-next (8aff56d060f4 Merge branch 'at91-dt' into at91-next)
Merging drivers-memory/for-next (a01b1a54770b Merge branch 'for-v5.16/renes=
as-rpc' into for-next)
Merging imx-mxs/for-next (0dd3273df8c2 Merge branch 'imx/dt64' into for-nex=
t)
Merging keystone/next (cb293d3b430e Merge branch 'for_5.15/drivers-soc' int=
o next)
Merging mediatek/for-next (69862ae4e378 Merge branch 'v5.14-next/soc' into =
for-next)
Merging mvebu/for-next (930af8dda750 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (7911f95d1713 Merge branch 'fixes' into for-next)
Merging qcom/for-next (12056fc2916f Merge branches 'arm64-for-5.16', 'drive=
rs-for-5.16' and 'dts-for-5.16' into for-next)
Merging raspberrypi/for-next (9f5289ec6f1c ARM: dts: bcm2711-rpi-4-b: Fix u=
sb's unit address)
Merging renesas/next (3b298ae53579 Merge branches 'renesas-arm-defconfig-fo=
r-v5.16' and 'renesas-arm-dt-for-v5.16' into renesas-next)
Merging reset/reset/next (09f3824342f6 reset: simple: remove ZTE details in=
 Kconfig help)
Merging rockchip/for-next (9a6218fd50c1 Merge branch 'v5.16-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (1523dddcd195 Merge branch 'next/soc' into fo=
r-next)
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
Merging xilinx/for-next (35a7430dad4d arm64: zynqmp: Wire psgtr for zc1751-=
xm013)
Merging clk/clk-next (1cbc04ffedcc Merge branch 'clk-mtk' into clk-next)
Merging clk-imx/for-next (1f4b035e603b clk: imx: Fix the build break when c=
lk-imx8ulp build as module)
Merging clk-renesas/renesas-clk (c11d7f5126b7 clk: renesas: r9a07g044: Add =
GbEthernet clock/reset)
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
Merging pidfd/for-next (f4dd02cd8631 Merge branch 'kernel.sys' into for-nex=
t)
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
Merging cifsd/cifsd-for-next (d72a9c158893 ksmbd: fix invalid request buffe=
r access in compound)
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
Merging overlayfs/overlayfs-next (b95ce53b72d1 ovl: fix IOCB_DIRECT if unde=
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
Merging i2c/i2c/for-next (294b29f15469 i2c: xiic: Fix RX IRQ busy check)
Merging i3c/i3c/next (a3587e2c0578 i3c: fix incorrect address slot lookup o=
n 64-bit)
Merging dmi/dmi-for-next (f97a2103f1a7 firmware: dmi: Move product_sku info=
 to the end of the modalias)
Merging hwmon-staging/hwmon-next (7b2ff48129ca dt-bindings: hwmon: jedec,jc=
42: convert to dtschema)
Merging jc_docs/docs-next (250a0a5ba9d2 docs: checkpatch: add multiline, do=
/while, and multiple-assignment messages)
Merging v4l-dvb/master (e4e737bb5c17 Linux 5.15-rc2)
Merging v4l-dvb-next/master (952aab37b121 Merge tag 'v5.15-rc2' into media_=
stage)
Applying: fix for "media: ir_toy: allow tx carrier to be set"
Merging pm/linux-next (7c86bb8dfc1b Merge branch 'pm-cpuidle' into linux-ne=
xt)
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
Merging rdma/for-next (450f4f6aa1a3 RDMA/rxe: Only allow invalidate for app=
ropriate MRs)
Merging net-next/master (a17aafa3a416 Merge branch 'bcmgenet-flow-control')
Merging bpf-next/for-next (4c9f09372046 Merge branch 'bpf-xsk-rx-batch')
Merging ipsec-next/master (83688aec17bf net/ipv4/xfrm4_tunnel.c: remove sup=
erfluous header files from xfrm4_tunnel.c)
Merging mlx5-next/mlx5-next (6880fa6c5660 Linux 5.15-rc1)
Merging netfilter-next/master (acde891c243c rxrpc: Fix _usecs_to_jiffies() =
by using usecs_to_jiffies())
Merging ipvs-next/master (13bb8429ca98 net: wwan: iosm: firmware flashing a=
nd coredump collection)
Merging wireless-drivers-next/master (5db4943a9d6f rtw88: 8821c: correct 2.=
4G tx power for type 2/4 NIC)
Merging bluetooth/master (bad8833aaa87 Bluetooth: Fix wrong opcode when LL =
privacy enabled)
$ git reset --hard HEAD^
Merging next-20210924 version of bluetooth
Merging mac80211-next/master (cd8793f97f5f mac80211_hwsim: enable 6GHz chan=
nels)
Merging mtd/mtd/next (b72841e4dcd5 mtd: mtdswap: Remove redundant assignmen=
t of pointer eb)
Merging nand/nand/next (46a0dc10fb32 mtd: rawnand: intel: Fix potential buf=
fer overflow in probe)
Merging spi-nor/spi-nor/next (2734d6c1b1a0 Linux 5.14-rc2)
Merging crypto/master (adad556efcdd crypto: api - Fix built-in testing depe=
ndency failures)
Applying: Revert "crypto: api - Fix built-in testing dependency failures"
Merging drm/drm-next (f602a96e0252 Merge tag 'drm-misc-next-2021-09-23' of =
git://anongit.freedesktop.org/drm/drm-misc into drm-next)
Merging drm-misc/for-linux-next (116e5947d7bf drm/edid: Fix drm_edid_encode=
_panel_id() kerneldoc warning)
Merging amdgpu/drm-next (2485e2753ec8 drm/amdgpu: make soc15_common_ip_func=
s static)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/core/d=
c_link_dp.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_rin=
g.c
CONFLICT (content): Merge conflict in MAINTAINERS
Merging drm-intel/for-linux-next (c6b40ee330fe drm/i915/audio: Use BIOS pro=
vided value for RKL HDA link)
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
Merging sound-asoc/for-next (1e545674a282 Merge remote-tracking branch 'aso=
c/for-5.16' into asoc-next)
Merging modules/modules-next (ced75a2f5da7 MAINTAINERS: Add Luis Chamberlai=
n as modules maintainer)
Merging input/next (d5af8a8f7c4c Input: mpr121 - make use of the helper fun=
ction devm_add_action_or_reset())
Merging block/for-next (0d05bd9785aa Merge branch 'for-5.16/drivers' into f=
or-next)
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
Merging selinux/next (d9d8c93938c4 Smack: Brutalist io_uring support)
CONFLICT (content): Merge conflict in fs/io-wq.c
Merging smack/next (222a96b31c24 smack: Guard smack_ipv6_lock definition wi=
thin a SMACK_IPV6_PORT_LABELING block)
Merging tomoyo/master (7d2a07b76933 Linux 5.14)
Merging tpmdd/next (f985911b7bc7 crypto: public_key: fix overflow during im=
plicit conversion)
Merging watchdog/master (5816b3e6577e Linux 5.15-rc3)
Merging iommu/next (b58886bf14da Merge branch 'iommu/fixes' into next)
Merging audit/next (8e71168e2cc7 lsm_audit: avoid overloading the "key" aud=
it field)
Merging devicetree/for-next (3148ffd89292 dt-bindings: rng: convert OMAP an=
d Inside-Secure HWRNG to yaml schema)
Merging mailbox/mailbox-for-next (85dfdbfc13ea mailbox: cmdq: add multi-gce=
 clocks support for mt8195)
Merging spi/for-next (67ebf32ffba7 Merge remote-tracking branch 'spi/for-5.=
16' into spi-next)
Merging tip/auto-latest (d478ddf4e3cf Merge remote-tracking branch 'tip/irq=
/urgent' into tip-master)
Merging clockevents/timers/drivers/next (f196ae282070 dt-bindings: timer: A=
dd ABIs for new Ingenic SoCs)
Merging edac/edac-for-next (4646da896a44 Merge branch 'edac-urgent' into ed=
ac-for-next)
Merging irqchip/irq/irqchip-next (6e3b473ee064 Merge branch irq/qcom-pdc-no=
wake-cleanup into irq/irqchip-next)
Merging ftrace/for-next (5dfe50b05588 bootconfig: Rename xbc_node_find_chil=
d() to xbc_node_find_subkey())
Merging rcu/rcu/next (7193f47219a6 rcutorture: Suppress pi-lock-across read=
-unlock testing for Tiny SRCU)
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
Merging chrome-platform/for-next (f11c35e18150 platform/chrome: cros_ec_sen=
sorhub: simplify getting .driver_data)
Merging hsi/for-next (e73f0f0ee754 Linux 5.14-rc1)
Merging leds/for-next (2a5a8fa8b231 leds: trigger: use RCU to protect the l=
ed_cdevs list)
Merging ipmi/for-next (35f4caec9d51 ipmi: Disable some operations during a =
panic)
Merging driver-core/driver-core-next (d4771993f2cf scripts: get_abi.pl: ens=
ure that "others" regex will be parsed)
Merging usb/usb-next (ae9a6149884e Merge 5.15-rc3 into usb-next)
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (c8345c0500de USB: serial: kl5kusb105: drop lin=
e-status helper)
Merging usb-chipidea-next/for-usb-next (78665f57c3fa usb: chipidea: udc: ma=
ke controller hardware endpoint primed)
Merging tty/tty-next (5ecb11dd892f Merge 5.15-rc3 into tty-next)
Merging char-misc/char-misc-next (20ac422c8ef7 Merge 5.15-rc3 into char-mis=
c next)
Merging extcon/extcon-next (eb29ba5688de extcon: extcon-axp288: Use P-Unit =
semaphore lock for register accesses)
Merging phy-next/next (6880fa6c5660 Linux 5.15-rc1)
Merging soundwire/next (6880fa6c5660 Linux 5.15-rc1)
Merging thunderbolt/next (641cdbea7635 thunderbolt: Enable retry logic for =
intra-domain control packets)
Merging vfio/next (ea870730d83f Merge branches 'v5.15/vfio/spdx-license-cle=
anups', 'v5.15/vfio/dma-valid-waited-v3', 'v5.15/vfio/vfio-pci-core-v5' and=
 'v5.15/vfio/vfio-ap' into v5.15/vfio/next)
Merging staging/staging-next (9b40e16ee51a Merge branch 5.15-rc3 into stagi=
ng-next)
Merging iio/togreg (55c45baaaf78 iio: adc: rockchip_saradc: Make use of the=
 helper function devm_platform_ioremap_resource())
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (13404ac8882f interconnect: qcom: sdm660: Add missing =
a2noc qos clocks)
Merging dmaengine/next (6880fa6c5660 Linux 5.15-rc1)
Merging cgroup/for-next (7ee285395b21 cgroup: Make rebind_subsystems() disa=
ble v2 controllers all at once)
Merging scsi/for-next (41d7acab7706 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (efe1dc571a5b scsi: lpfc: Fix mailbox command fai=
lure during driver initialization)
Merging vhost/linux-next (dd7dc7e82b14 vhost_vdpa: unset vq irq before free=
ing irq)
Merging rpmsg/for-next (45500e830ed5 Merge branches 'rpmsg-next' and 'rproc=
-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (7687a5b0ee93 gpio: modepin: Add driver sup=
port for modepin GPIO controller)
Merging gpio-intel/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging pinctrl/for-next (3b63bcc2a41d Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (6880fa6c5660 Linux 5.15-rc1)
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
Merging nvdimm/libnvdimm-for-next (bdd3c50d83bf dax: remove bdev_dax_suppor=
ted)
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
Applying: fixup for "kconfig: Refactor sym_escape_string_value"
Merging cxl/next (ed97afb53365 cxl/pci: Disambiguate cxl_pci further from c=
xl_mem)
Merging folio/for-next (27b231798da1 mm/writeback: Add folio_write_one)
CONFLICT (modify/delete): fs/cachefiles/rdwr.c deleted in HEAD and modified=
 in folio/for-next. Version folio/for-next of fs/cachefiles/rdwr.c left in =
tree.
$ git rm -f fs/cachefiles/rdwr.c
Applying: fix up for "9p: Convert to using the netfs helper lib to do reads=
 and caching"
Applying: Revert "firmware: cs_dsp: add driver to support firmware loading =
on Cirrus Logic DSPs"
Applying: crypto: api - Export crypto_boot_test_finished
Applying: Revert "kconfig: remove 'const' from the return type of sym_escap=
e_string()"
Applying: Revert "kconfig: Refactor sym_escape_string_value"
Merging akpm-current/current (48d0092bb55b ipc/ipc_sysctl.c: remove fallbac=
k for !CONFIG_PROC_SYSCTL)
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (66b60fc7390e mm: unexport {,un}lock_page_memcg)

--Sig_/w=J3SuMkimVE2sa8zvlKqkk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFSwu0ACgkQAVBC80lX
0GxfZgf/Syc6PJFI5ZszKFG844x7yjEV4laxyNdek5pY1TvfBT/6iw3pag6mfnJt
Sq41CmeJr8DeuUjwU5ryiKe8RZkJJa/wl0ZFVOX8VjcekhAN9gCt/HafSTQ1lv7q
9Cmqt4Z43Q239Od0to1bGqdc22ZAT5ZPsBmqwFFvk2fbPZKEsBxS8pszGG/CrHiu
vQpOTueqLd3iSgPMfOr2HYTfQ8HN1RgcgkIN3t61x+kMJETBJXb/KWpZKwTfE6hD
Xc3rXyEeiIX9OV1fFrwk3bRr5Mbs0bU59OxIB7vmPT7p7rxpIobcXdLhKojHM8Iz
38JhfuJNyer/jG0Bv7eZ/WjDTOhSuQ==
=iuAC
-----END PGP SIGNATURE-----

--Sig_/w=J3SuMkimVE2sa8zvlKqkk--
