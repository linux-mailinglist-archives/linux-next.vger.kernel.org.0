Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF7404C70C4
	for <lists+linux-next@lfdr.de>; Mon, 28 Feb 2022 16:35:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237574AbiB1Pfp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Feb 2022 10:35:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237579AbiB1Pfn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Feb 2022 10:35:43 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 348A483019;
        Mon, 28 Feb 2022 07:34:56 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4K6kvz2Z2vz4xcS;
        Tue,  1 Mar 2022 02:34:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1646062495;
        bh=BgmHXpZlulMta1QZVM+tvporXE38vfCm5kBULNHRZzI=;
        h=Date:From:To:Cc:Subject:From;
        b=TF8wKsf8zFtfmULcunSrvgkbnECEgyrKMdFhyDxGgGWhdHKpNFrSYl5wpVSMJ4uxX
         Z8HaozlzITiaKPwCwqcmh93yxhAJbGmP1w9Qi+9g7tlmZHWbvZMsIiEpbb3kRxUsCs
         l217hI7SS3bCtmalWROqWII5Lvfo+Pb3CVEuF+lAxlfBJafhqKxD9d6HbsF7FQd4Sw
         klHNar8Vlxixa+32nUjYKWyGc98XftsxeGzho9Mui4nT1rS356hLn2ZQip4YvTmR1K
         nlQ1ifzU9tZFnwGnJIT6VhOPc8Q05Ti3ROcGwBr/pixw8HKxCtqNLPpxBDI7qUSJmF
         /P4w1i4MBiWSQ==
Date:   Tue, 1 Mar 2022 02:34:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 28
Message-ID: <20220301023454.642da83b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TpSm6oYRTRPW0SUMMVdQHfI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,LOCALPART_IN_SUBJECT,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/TpSm6oYRTRPW0SUMMVdQHfI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20220225:

New tree: execve

The arm-soc tree gained a conflict against the arm tree.

The at91 tree lost its build failure.

The h8300 tree gained a conflict against the asm-generic tree.

The parisc-hd tree gained a conflict against the asm-generic tree.

The drm tree gained a conflict against Linus' tree.  It also still had
its build failure, so I used the version from next-20220224 again.

The modules tree still had its build failure so I used the version from
next-20220217 again.

The tty tree gained a conflict against the spi tree.

The char-misc tree gained conflicts against the mfd, spi and tty trees.
It still had its build failure, so I used the version from next-20220224
again.

The folio tree gained a build failure due to interactions with the
maple tree.  I have dropped the maple tree for today.

The akpm-current tree gained a build failure due to an interaction with
the folio tree, for which I reverted a commit.

Non-merge commits (relative to Linus' tree): 8467
 8589 files changed, 830403 insertions(+), 195511 deletions(-)

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
ppc44x_defconfig, allyesconfig and pseries_le_defconfig and i386,
arm64, sparc and sparc64 defconfig and htmldocs. And finally, a simple
boot test of the powerpc pseries_le_defconfig kernel in qemu (with and
without kvm enabled).

Below is a summary of the state of the merge.

I am currently merging 347 trees (counting Linus' and 93 trees of bug
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
Merging origin/master (7e57714cd0ad Linux 5.17-rc6)
Merging fixes/fixes (d06c942efea4 Merge tag 'for_linus' of git://git.kernel=
.org/pub/scm/linux/kernel/git/mst/vhost)
Merging kbuild-current/fixes (754e0b0e3560 Linux 5.17-rc4)
Merging arc-current/for-curr (e783362eb54c Linux 5.17-rc1)
Merging arm-current/fixes (11c57c3ba94d ARM: 9178/1: fix unmet dependency o=
n BITREVERSE for HAVE_ARCH_BITREVERSE)
Merging arm64-fixes/for-next/fixes (4f6de676d94e arm64: Correct wrong label=
 in macro __init_el2_gicv3)
Merging arm-soc-fixes/arm/fixes (c253bf70c657 Merge tag 'soc-fsl-fix-v5.17'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/leo/linux into arm/fixes)
Merging drivers-memory-fixes/fixes (e783362eb54c Linux 5.17-rc1)
Merging tee-fixes/fixes (7e3c6eb44c91 Merge tags 'optee-fixes-for-v5.17' an=
d 'optee-fix-for-v5.17' into fixes)
Merging m68k-current/for-linus (1a0ae068bf6b m68k: defconfig: Update defcon=
figs for v5.16-rc1)
Merging powerpc-fixes/fixes (fe663df78258 powerpc/lib/sstep: fix 'ptesync' =
build error)
Merging s390-fixes/fixes (dd9cb842fa9d s390/cio: verify the driver availabi=
lity for path_event call)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (80f6e3080bfc fs-verity: fix signed inte=
ger overflow with i_size near S64_MAX)
Merging net/master (519ca6fa9605 Merge branch '40GbE' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/tnguy/net-queue)
Merging bpf/master (8940e6b669ca net: dsa: avoid call to __dev_set_promiscu=
ity() while rtnl_mutex isn't held)
Merging ipsec/master (7c76ecd9c99b xfrm: enforce validity of offload input =
flags)
Merging netfilter/master (277f2bb14361 ibmvnic: schedule failover only if v=
ioctl fails)
Merging ipvs/master (277f2bb14361 ibmvnic: schedule failover only if vioctl=
 fails)
Merging wireless/main (859ae7018316 mac80211: fix forwarded mesh frames AC =
& queue selection)
Merging rdma-fixes/for-rc (22e9f71072fa RDMA/cma: Do not change route.addr.=
src_addr outside state checks)
Merging sound-current/for-linus (ce345f1e4845 Merge tag 'asoc-fix-v5.17-rc5=
' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for=
-linus)
Merging sound-asoc-fixes/for-linus (b7fb0ae09009 ASoC: SOF: Intel: Fix NULL=
 ptr dereference when ENOMEM)
Merging regmap-fixes/for-linus (d04ad245d67a regmap-irq: Update interrupt c=
lear register for proper reset)
Merging regulator-fixes/for-linus (9ea28fe70274 Merge remote-tracking branc=
h 'regulator/for-5.16' into regulator-linus)
Merging spi-fixes/for-linus (9b8ab2adeea7 Merge remote-tracking branch 'spi=
/for-5.16' into spi-linus)
Merging pci-current/for-linus (3f1271b54edc PCI: Mark all AMD Navi10 and Na=
vi14 GPU ATS as broken)
Merging driver-core.current/driver-core-linus (d8f7a5484f21 driver core: Fr=
ee DMA range map when device is released)
Merging tty.current/tty-linus (eebb0f4e894f sc16is7xx: Fix for incorrect da=
ta being transmitted)
Merging usb.current/usb-linus (19eae24b76c2 Merge tag 'usb-serial-5.17-rc6'=
 of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into u=
sb-linus)
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (cfc4442c642d USB: serial: option: add T=
elit LE910R1 compositions)
Merging usb-chipidea-fixes/for-usb-fixes (f130d08a8d79 usb: chipidea: ci_hd=
rc_imx: Also search for 'phys' phandle)
CONFLICT (content): Merge conflict in drivers/usb/chipidea/ci_hdrc_imx.c
Merging phy/fixes (9a8406ba1a9a phy: dphy: Correct clk_pre parameter)
Merging staging.current/staging-linus (b6821b0d9b56 staging: fbtft: fb_st77=
89v: reset display before initialization)
Merging iio-fixes/fixes-togreg (bf0938059ada iio: accel: mma8452: use the c=
orrect logic to get mma8452_data)
Merging char-misc.current/char-misc-linus (6c7621890995 mtd: core: Fix a co=
nflict between MTD and NVMEM on wp-gpios property)
Merging soundwire-fixes/fixes (e783362eb54c Linux 5.17-rc1)
Merging thunderbolt-fixes/fixes (cfb92440ee71 Linux 5.17-rc5)
Merging input-current/for-linus (7b1f781f2d24 Input: psmouse - set up depen=
dency between PS/2 and SMBus companions)
Merging crypto-current/master (c6ce9c5831ca crypto: api - Move cryptomgr so=
ft dependency into algapi)
Merging vfio-fixes/for-linus (8704e8934908 vfio/pci: Fix OpRegion read)
Merging kselftest-fixes/fixes (6fec1ab67f8d selftests/ftrace: Do not trace =
do_softirq because of PREEMPT_RT)
Merging modules-fixes/modules-linus (a8e8f851e829 module: fix building with=
 sysfs disabled)
Merging dmaengine-fixes/fixes (cfb92440ee71 Linux 5.17-rc5)
Merging backlight-fixes/for-backlight-fixes (a38fd8748464 Linux 5.12-rc2)
Merging mtd-fixes/mtd/fixes (7cf1de957a98 mtd: rawnand: omap2: Actually pre=
vent invalid configuration and build error)
Merging mfd-fixes/for-mfd-fixes (a61f4661fba4 mfd: intel_quark_i2c_gpio: Re=
vert "Constify static struct resources")
Merging v4l-dvb-fixes/fixes (d40f0b133b44 media: meson-ir-tx: remove incorr=
ect doc comment)
Merging reset-fixes/reset/fixes (92c959bae2e5 reset: renesas: Fix Runtime P=
M usage)
Merging mips-fixes/mips-fixes (1e6ae0e46e32 mips: setup: fix setnocoherenti=
o() boolean setting)
Merging at91-fixes/at91-fixes (26077968f838 dt-bindings: ARM: at91: update =
maintainers entry)
Merging omap-fixes/fixes (8840f5460a23 ARM: dts: Use 32KiHz oscillator on d=
evkit8000)
Merging kvm-fixes/master (9ee83635d872 KVM: x86: Yield to IPI target vCPU o=
nly if it is busy)
Merging kvms390-fixes/master (0e9ff65f455d KVM: s390: preserve deliverable_=
mask in __airqs_kick_single_vcpu)
Merging hwmon-fixes/hwmon (c84a2b7b4032 hwmon: (pmbus) Add mutex to regulat=
or ops)
Merging nvdimm-fixes/libnvdimm-fixes (3dd60fb9d95d nvdimm/pmem: stop using =
q_usage_count as external pgmap refcount)
Merging cxl-fixes/fixes (fae8817ae804 cxl/mem: Fix memory device capacity p=
robing)
Merging btrfs-fixes/next-fixes (6e60f6a7ae95 Merge branch 'misc-5.17' into =
next-fixes)
Merging vfs-fixes/fixes (9d2231c5d74e lib/iov_iter: initialize "flags" in n=
ew pipe_buffer)
Merging dma-mapping-fixes/for-linus (18a3c5f7abfd Merge tag 'for_linus' of =
git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging i3c-fixes/i3c/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging drivers-x86-fixes/fixes (21d90aaee8d5 surface: surface3_power: Fix =
battery readings on batteries without a serial number)
Merging samsung-krzk-fixes/fixes (442b0c08db7e soc: samsung: Fix typo in CO=
NFIG_EXYNOS_USI description)
Merging pinctrl-samsung-fixes/fixes (e783362eb54c Linux 5.17-rc1)
Merging devicetree-fixes/dt/linus (0c0822bcb73f dt-bindings: update Roger Q=
uadros email)
Merging scsi-fixes/fixes (10af11564617 scsi: ufs: core: Fix divide by zero =
in ufshcd_map_queues())
Merging drm-fixes/drm-fixes (ecf8a99f4807 Merge tag 'drm-intel-fixes-2022-0=
2-24' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (28adef861233 drm/i915/dg2: Pr=
int PHY name properly on calibration error)
Merging mmc-fixes/fixes (54309fde1a35 mmc: block: fix read single on recove=
ry logic)
Merging rtc-fixes/rtc-fixes (bd33335aa93d rtc: cmos: Disable irq around dir=
ect invocation of cmos_interrupt())
Merging gnss-fixes/gnss-linus (e783362eb54c Linux 5.17-rc1)
Merging hyperv-fixes/hyperv-fixes (ffc58bc4af93 Drivers: hv: utils: Make us=
e of the helper macro LIST_HEAD())
Merging soc-fsl-fixes/fix (a222fd854139 soc: fsl: qe: Check of ioremap retu=
rn value)
Merging risc-v-fixes/fixes (22e2100b1b07 riscv: fix oops caused by irqsoff =
latency tracer)
Merging pidfd-fixes/fixes (03ba0fe4d09f file: simplify logic in __close_ran=
ge())
Merging fpga-fixes/fixes (8bb7eca972ad Linux 5.15)
Merging spdx/spdx-linus (d8152cfe2f21 Merge tag 'pci-v5.17-fixes-5' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci)
Merging gpio-brgl-fixes/gpio/for-current (ae42f9288846 gpio: Return EPROBE_=
DEFER if gc->to_irq is NULL)
Merging gpio-intel-fixes/fixes (e783362eb54c Linux 5.17-rc1)
Merging pinctrl-intel-fixes/fixes (6f66db29e241 pinctrl: tigerlake: Revert =
"Add Alder Lake-M ACPI ID")
Merging erofs-fixes/fixes (24331050a3e6 erofs: fix small compressed files i=
nlining)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (92a68053c346 Documentation: KUnit: Fix usa=
ge bug)
Merging ubifs-fixes/fixes (c3c07fc25f37 ubi: fastmap: Return error code if =
memory allocation fails in add_aeb())
Merging memblock-fixes/fixes (c94afc46cae7 memblock: use kfree() to release=
 kmalloced memblock regions)
Merging cel-fixes/for-rc (c306d737691e NFSD: Deprecate NFS_OFFSET_MAX)
Merging irqchip-fixes/irq/irqchip-fixes (1d4df649cbb4 irqchip/sifive-plic: =
Add missing thead,c900-plic match string)
Merging renesas-fixes/fixes (432b52eea3dc ARM: shmobile: defconfig: Restore=
 graphical consoles)
Merging perf-current/perf/urgent (13e741b83453 perf script: Fix error when =
printing 'weight' field)
Merging efi-fixes/urgent (0ea9e1c3dbd4 efivars: Respect "block" flag in efi=
var_entry_set_safe())
Merging zstd-fixes/zstd-linus (88a309465b3f lib: zstd: clean up double word=
 in comment.)
Merging drm-misc-fixes/for-linux-next-fixes (ecbd4912a693 drm/edid: Always =
set RGB444)
Merging kspp/for-next/kspp (e1558b5e29c6 Merge branch 'for-next/pending-fix=
es' into for-next/kspp)
Merging kspp-gustavo/for-next/kspp (91adfbb14c00 Merge branch 'for-next/ksp=
p-fam0' into for-next/kspp)
Merging kbuild/for-next (d4c858643263 kallsyms: ignore all local labels pre=
fixed by '.L')
Merging perf/perf/core (56dce868198c libperf: Add API for allocating new th=
read map array)
Merging compiler-attributes/compiler-attributes (7c00621dcaee compiler_type=
s: mark __compiletime_assert failure as __noreturn)
Merging dma-mapping/for-next (fba09099c6e5 media: v4l2-pci-skeleton: Remove=
 usage of the deprecated "pci-dma-compat.h" API)
Merging asm-generic/master (dd865f090f03 Merge branch 'set_fs-4' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic into asm-generic)
Merging arc/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging arm/for-next (0fda72bcacec Merge branch 'devel-stable' into for-nex=
t)
CONFLICT (content): Merge conflict in arch/arm/Kconfig
Merging arm64/for-next/core (fe500628a097 Merge branch 'for-next/fpsimd' in=
to for-next/core)
Merging arm-perf/for-next/perf (602c873eb52e perf: Replace acpi_bus_get_dev=
ice())
Merging arm-soc/for-next (68d7d1c1368d Merge branch 'arm/defconfig' into fo=
r-next)
CONFLICT (content): Merge conflict in arch/arm/Kconfig
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (39369380e729 Merge branch 'v5.18/dt64' into for-n=
ext)
Merging aspeed/for-next (b9edd69951ab Merge branches 'nuvoton-dt-for-v5.18'=
 and 'dt-for-v5.18' into for-next)
Merging at91/at91-next (f4de6d853a03 Merge branch 'at91-soc' into at91-next)
Merging drivers-memory/for-next (c27983bbc75b Merge branch 'mem-ctrl-next' =
into for-next)
Merging imx-mxs/for-next (45550ada88f0 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (cb293d3b430e Merge branch 'for_5.15/drivers-soc' int=
o next)
Merging mediatek/for-next (896f47a2c39c Merge branch 'v5.17-next/dts64' int=
o for-next)
Merging mvebu/for-next (fecc54c7ccfe Merge branch 'mvebu/arm' into mvebu/fo=
r-next)
Merging omap/for-next (f9ecc209330a Merge branch 'omap-for-v5.18/dt' into f=
or-next)
Merging qcom/for-next (22139a9091fd Merge branches 'arm64-defconfig-for-5.1=
8', 'arm64-for-5.18', 'clk-for-5.18', 'defconfig-for-5.18', 'drivers-for-5.=
18', 'dts-for-5.18', 'arm64-fixes-for-5.17' and 'dts-fixes-for-5.17' into f=
or-next)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging raspberrypi/for-next (c5915b53d4c2 dt-bindings: soc: bcm: Convert b=
rcm,bcm2835-vchiq to json-schema)
Merging renesas/next (dff7b84b4d2a Merge branch 'renesas-arm-dt-for-v5.18' =
into renesas-next)
Merging reset/reset/next (89e7a6698fdd reset: uniphier-glue: Use devm_add_a=
ction_or_reset())
Merging rockchip/for-next (f03511c4f2b5 Merge branch 'v5.18-armsoc/dts64' i=
nto for-next)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/rockchip/rk356x.d=
tsi
Merging samsung-krzk/for-next (acda0aab9ed2 Merge branch 'for-v5.18/tesla-f=
sd' into for-next)
Merging scmi/for-linux-next (210b966b7e2f Merge tag 'scmi-updates-5.18' of =
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-l=
inux-next)
Merging stm32/stm32-next (74fa56279651 ARM: dts: stm32: Switch DWMAC RMII c=
lock to MCO2 on DHCOM)
Merging sunxi/sunxi/for-next (f25c47c67629 Merge branch 'sunxi/dt-for-5.18'=
 into sunxi/for-next)
Merging tee/next (ff8187c5dd8f Merge branch 'tee_shm_for_v5.18' into next)
Merging tegra/for-next (6d746e1eb2f6 Merge branch for-5.18/arm64/defconfig =
into for-next)
Merging ti/ti-next (7e3580d1f38a Merge branch 'ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (3a14f0e61408 arm64: zynqmp: Rename dma to dma-cont=
roller)
Merging clk/clk-next (7da5e77a1b5f Merge branch 'clk-fixes' into clk-next)
Merging clk-imx/for-next (e501cf5e56c6 clk: imx: Remove audio_mclk_root_clk)
Merging clk-renesas/renesas-clk (73421f2a48e6 clk: renesas: r8a779f0: Add P=
FC clock)
Merging clk-samsung/for-next (45bd8166a1d8 clk: samsung: Add initial Exynos=
7885 clock driver)
Merging csky/linux-next (a0793fdad9a1 csky: fix typo of fpu config macro)
Merging h8300/h8300-next (1ec10274d436 h8300: don't implement set_fs)
CONFLICT (modify/delete): arch/h8300/mm/memory.c deleted in h8300/h8300-nex=
t and modified in HEAD.  Version HEAD of arch/h8300/mm/memory.c left in tre=
e.
$ git rm -f arch/h8300/mm/memory.c
Merging m68k/for-next (8213c6137687 m68k: defconfig: Update defconfigs for =
v5.17-rc3)
Merging m68knommu/for-next (244e6c2d4e4d m68k: m5441x: remove erroneous clo=
ck disable)
Merging microblaze/next (fcc619621df5 microblaze/PCI: Remove pci_phys_mem_a=
ccess_prot() dead code)
Merging mips/mips-next (fbb1d4b381b0 MIPS: Modernize READ_IMPLIES_EXEC)
Merging nds32/next (07cd7745c6f2 nds32/setup: remove unused memblock_region=
 variable in setup_memory())
CONFLICT (content): Merge conflict in arch/nds32/Kbuild
CONFLICT (content): Merge conflict in arch/nds32/Kconfig
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (862cf8d5fd98 openrisc/boot: Remove unnecessary i=
nitialisation in memcpy().)
Merging parisc-hd/for-next (d21d3f34cf6e parisc/unaligned: Enhance user-spa=
ce visible output)
CONFLICT (content): Merge conflict in arch/parisc/lib/memcpy.c
Merging powerpc/next (5a72345e6a78 powerpc: Fix STACKTRACE=3Dn build)
Merging soc-fsl/next (1ce93cb102e7 soc: fsl: qe: Check of ioremap return va=
lue)
Merging risc-v/for-next (d56201d9440d riscv: defconfig: enable hugetlbfs op=
tion)
Merging s390/for-next (00abcf534675 Merge branch 'features' into for-next)
Merging sh/for-next (8518e694203d sh: pgtable-3level: Fix cast to pointer f=
rom integer of different size)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (db0dd9cee822 um: virtio_uml: Allow probing from dev=
icetree)
Merging xtensa/xtensa-for-next (8a900dc390da xtensa: Remove unused early_re=
ad_config_byte() et al declarations)
Merging pidfd/for-next (d52c14f5f9b3 Merge branch 'pidfd.fd_install' into f=
or-next)
Merging fscrypt/master (cdaa1b1941f6 fscrypt: update documentation for dire=
ct I/O support)
Merging fscache/fscache-next (dd81e1c7d5fb Merge tag 'powerpc-5.17-2' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging afs/afs-next (26291c54e111 Linux 5.17-rc2)
Merging btrfs/for-next (07f12a9ee29d Merge branch 'for-next-next-v5.17-2022=
0224' into for-next-20220224)
Merging ceph/master (038b8d1d1ab1 libceph: optionally use bounce buffer on =
recv path in crc mode)
Merging cifs/for-next (e5e5d45ed9c8 cifs: truncate the inode and mapping wh=
en we simulate fcollapse)
Merging configfs/for-next (84ec758fb2da configfs: fix a race in configfs_{,=
un}register_subsystem())
Merging ecryptfs/next (682a8e2b41ef Merge tag 'ecryptfs-5.13-rc1-updates' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs)
Merging erofs/dev (c678fc27e5ae erofs: fix ztailpacking on > 4GiB filesyste=
ms)
Merging exfat/dev (dd81e1c7d5fb Merge tag 'powerpc-5.17-2' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging ext3/for_next (6b421a98d1e4 Merge Zhang's ext2 cleanup.)
Merging ext4/dev (8c91c57907d3 ext4: add extra check in ext4_mb_mark_bb() t=
o prevent against possible corruption)
Merging f2fs/dev (680af5b824a5 f2fs: quota: fix loop condition at f2fs_quot=
a_sync())
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (c086df490257 fuse: move FUSE_SUPER_MAGIC definition =
to magic.h)
Merging gfs2/for-next (a4e8145edcfd gfs2: Initialize gh_error in gfs2_glock=
_nq)
Merging jfs/jfs-next (c48a14dca2cb JFS: fix memleak in jfs_mount)
Merging ksmbd/ksmbd-for-next (1a927cda94ac Documentation: ksmbd: update Fea=
ture Status table)
Merging nfs/linux-next (6c984083ec24 NFS: Use of mapping_set_error() result=
s in spurious errors)
Merging nfs-anna/linux-next (d19e0183a883 NFS: Do not report writeback erro=
rs in nfs_getattr())
Merging nfsd/for-next (3d4441e0c202 fs/lock: only call lm_breaker_owns_leas=
e if there is conflict.)
Merging ntfs3/master (52e00ea6b26e fs/ntfs3: Update valid size if -EIOCBQUE=
UED)
Merging orangefs/for-next (40a74870b2d1 orangefs: Fix the size of a memory =
allocation in orangefs_bufmap_alloc())
Merging overlayfs/overlayfs-next (94fd19752b28 ovl: don't fail copy up if n=
o fileattr support on upper)
Merging ubifs/next (aa39cc675799 jffs2: GC deadlock reading a page that is =
used in jffs2_write_begin())
Merging v9fs/9p-next (22e424feb665 Revert "fs/9p: search open fids first")
Merging xfs/for-next (b97cca3ba909 xfs: only bother with sync_filesystem du=
ring readonly remount)
Merging zonefs/for-next (95b115332a83 zonefs: remove redundant null bio che=
ck)
Merging iomap/iomap-for-next (ebb7fb1557b1 xfs, iomap: limit individual ioe=
nd chain lengths in writeback)
Merging djw-vfs/vfs-for-next (2d86293c7075 xfs: return errors in xfs_fs_syn=
c_fs)
Merging file-locks/locks-next (80d8e4d3f313 fs/locks: fix fcntl_getlk64/fcn=
tl_setlk64 stub prototypes)
Merging vfs/for-next (124f75f864f3 clean overflow checks in count_mounts() =
a bit)
CONFLICT (content): Merge conflict in arch/x86/um/Kconfig
Merging printk/for-next (e8134595e3f1 Merge branch 'for-5.18' into for-next)
Merging pci/next (9622b4f2fa4b Merge branch 'remotes/lorenzo/pci/uniphier')
Merging pstore/for-next/pstore (a5d05b07961a pstore/ftrace: Allow immediate=
 recording)
Merging hid/for-next (c0774561bd46 Merge branch 'for-5.17/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (23c6aefe6d0a Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i3c/i3c/next (13462ba1815d i3c: master: dw: check return of dw_i3c_=
master_get_free_pos())
Merging dmi/dmi-for-next (f97a2103f1a7 firmware: dmi: Move product_sku info=
 to the end of the modalias)
Merging hwmon-staging/hwmon-next (2fd3eec19c6e hwmon: (aquacomputer_d5next)=
 Add support for Aquacomputer Farbwerk 360)
Merging jc_docs/docs-next (247097e2bbff docs: reporting-issues.rst: link ne=
w document about regressions)
Merging v4l-dvb/master (2b891d3980f6 media: xilinx: csi2rxss: Use mipi-csi2=
.h)
Merging v4l-dvb-next/master (2881ca629984 media: Makefiles: sort entries wh=
ere it fits)
Merging pm/linux-next (9e2511cc3be9 Merge branch 'thermal-int340x-fixes' in=
to linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (72951a77c00f cpufreq: blocklist=
 Qualcomm sc8280xp and sa8540p in cpufreq-dt-platdev)
Merging cpupower/cpupower (8382dce5e483 cpupower: Add "perf" option to prin=
t AMD P-State information)
Merging devfreq/devfreq-next (26291c54e111 Linux 5.17-rc2)
Merging opp/opp/linux-next (8acf5cb92d9d dt-bindings: power: avs: qcom,cpr:=
 Convert to DT schema)
Merging thermal/thermal/linux-next (8ee1c0f6526c thermal/drivers/rz2gl: Add=
 error check for reset_control_deassert())
Merging ieee1394/for-next (54b3bd99f094 firewire: nosy: switch from 'pci_' =
to 'dma_' API)
Merging dlm/next (feae43f8aa88 fs: dlm: print cluster addr if non-cluster n=
ode connects)
Merging rdma/for-next (884194ef264e RDMA/irdma: Move union irdma_sockaddr t=
o header file)
Merging net-next/master (b42a738e409b Merge branch 'dsa-fdb-isolation')
Merging bpf-next/for-next (80bebebdac93 bpf: Fix issue with bpf preload mod=
ule taking over stdout/stdin of kernel.)
Merging ipsec-next/master (2ecda181682e xfrm: delete duplicated functions t=
hat calls same xfrm_api_check())
Merging mlx5-next/mlx5-next (45fee8edb4b3 net/mlx5: Add clarification on sy=
nc reset failure)
Merging netfilter-next/master (c828414ac935 netfilter: nft_compat: suppress=
 comment match)
Merging ipvs-next/master (c828414ac935 netfilter: nft_compat: suppress comm=
ent match)
Merging bluetooth/master (e8e41e2b99cc Bluetooth: mediatek: fix the conflic=
t between mtk and msft vendor event)
Merging wireless-next/main (e715f10f3d05 rtw89: get channel parameters of 1=
60MHz bandwidth)
CONFLICT (content): Merge conflict in net/mac80211/mlme.c
Merging mtd/mtd/next (2365f91c861c mtd: parsers: trx: allow to use on Media=
Tek MIPS SoCs)
Merging nand/nand/next (ffb16c1c4267 mtd: rawnand: stm32_fmc2: Add NAND Wri=
te Protect support)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/mtd=
/nand-controller.yaml
Merging spi-nor/spi-nor/next (3c552889e431 mtd: spi-nor: renumber flags)
Merging crypto/master (0a2a464f8631 crypto: hisilicon/sec - fix the aead so=
ftware fallback for engine)
Merging drm/drm-next (54f43c17d681 Merge tag 'drm-misc-next-2022-02-23' of =
git://anongit.freedesktop.org/drm/drm-misc into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_dis=
play.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/core/d=
c_resource.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/dp/drm_dp.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_bw=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_sn=
ps_phy.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/tegra/Kconfig
CONFLICT (content): Merge conflict in drivers/gpu/drm/tegra/dpaux.c
$ git reset --hard HEAD^
Merging next-20220224 version of drm
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/core/d=
c_resource.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_sn=
ps_phy.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/tegra/Kconfig
CONFLICT (content): Merge conflict in drivers/gpu/drm/tegra/dpaux.c
[master cfc58a789bdc] next-20220224/drm
Merging drm-misc/for-linux-next (07f380da3ebd drm/panel: simple: Fix Innolu=
x G070Y2-L01 BPP settings)
Merging amdgpu/drm-next (c364eb77e7a9 drm/radeon: Add HD-audio component no=
tifier support (v2))
Merging drm-intel/for-linux-next (2d0539575abb drm/i915: Fix MSO vs. bigjoi=
ner timings confusion)
CONFLICT (content): Merge conflict in drivers/gpu/drm/dp/drm_dp.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_bw=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_sn=
ps_phy.c
CONFLICT (modify/delete): include/linux/dma-buf-map.h deleted in Temporary =
merge branch 2 and modified in Temporary merge branch 1.  Version Temporary=
 merge branch 1 of include/linux/dma-buf-map.h left in tree.
Merging drm-tegra/drm/tegra/for-next (b53c24f69199 drm/tegra: Support YVYU,=
 VYUY and YU24 formats)
Merging drm-msm/msm-next (afab9d91d872 drm/msm/adreno: Expose speedbin to u=
serspace)
Merging imx-drm/imx-drm/next (20fbfc81e390 drm/imx: imx-tve: Make use of th=
e helper function devm_platform_ioremap_resource())
Merging etnaviv/etnaviv/next (cdd156955f94 drm/etnaviv: consider completed =
fence seqno in hang check)
Merging fbdev/for-next (bd771cf5c425 video: fbdev: sm712fb: Fix crash in sm=
tcfb_read())
Merging regmap/for-next (2d2329787ba2 regmap: irq: cleanup comments)
Merging sound/for-next (d23c49562a88 dt-bindings: Document Tegra234 HDA sup=
port)
Merging sound-asoc/for-next (75bbf0a182cf Merge remote-tracking branch 'aso=
c/for-5.18' into asoc-next)
Merging modules/modules-next (c55dc78176e6 module: Move procfs support into=
 a separate file)
$ git reset --hard HEAD^
Merging next-20220217 version of modules
Merging input/next (986c6f7c3fc8 Merge tag 'v5.17-rc4' into next)
Merging block/for-next (1f225bbebd02 Merge branch 'for-5.18/block' into for=
-next)
CONFLICT (content): Merge conflict in fs/iomap/direct-io.c
Merging device-mapper/for-next (f5b4aee10c02 dm: remove unnecessary local v=
ariables in __bind)
Merging libata/for-next (9256766fe2df ata: pata_hpt37x: merge transfer mode=
 setting methods)
Merging pcmcia/pcmcia-next (3928cf08334e pcmcia: db1xxx_ss: restrict to MIP=
S_DB1XXX boards)
Merging mmc/next (4a85422750e8 mmc: mtk-sd: use div64_u64() instead of do_d=
iv())
Merging mfd/for-mfd-next (557bf686f1c6 dt-bindings: mfd: Add compatible for=
 the MediaTek MT6366 PMIC)
$ git reset --hard HEAD^
Merging next-20220222 version of mfd
Merging backlight/for-backlight-next (ec961cf32411 backlight: qcom-wled: Re=
spect enabled-strings in set_brightness)
Merging battery/for-next (d69fc86aca7e power: supply: bq24190_charger: Dela=
y applying charge_type changes when OTG 5V Vbus boost is on)
Merging regulator/for-next (a94e5cd8457f regulator: tps62864: Fix bindings =
for SW property)
Merging security/next-testing (047843bdb316 Merge branch 'landlock_lsm_v34'=
 into next-testing)
Merging apparmor/apparmor-next (13db6c2acdcd apparmor: fix aa_label_asxprin=
t return check)
Merging integrity/next-integrity (cd3bc044af48 KEYS: encrypted: Instantiate=
 key with user-provided decrypted data)
Merging keys/keys-next (2d743660786e Merge branch 'fixes' of git://git.kern=
el.org/pub/scm/linux/kernel/git/viro/vfs)
Merging safesetid/safesetid-next (1b8b71922919 LSM: SafeSetID: Mark safeset=
id_initialized as __initdata)
Merging selinux/next (65881e1db4e9 selinux: allow FIOCLEX and FIONCLEX with=
 policy capability)
Merging smack/next (e783362eb54c Linux 5.17-rc1)
Merging tomoyo/master (39844b7e3084 TOMOYO: fix __setup handlers return val=
ues)
Merging tpmdd/next (c9e54f38976a integrity: Only use machine keyring when u=
efi_check_trust_mok_keys is true)
Merging watchdog/master (cfb92440ee71 Linux 5.17-rc5)
Merging iommu/next (a9b491f6d6de Merge branches 'arm/msm', 'arm/renesas', '=
arm/rockchip', 'iommu/fixes', 'x86/vt-d' and 'core' into next)
Merging audit/next (272ceeaea355 audit: log AUDIT_TIME_* records only from =
rules)
Merging devicetree/for-next (10d7e312497f dt-bindings: reserved-memory: Add=
 restricted-dma-pool constraints)
Merging mailbox/mailbox-for-next (869b6ca39c08 dt-bindings: mailbox: Add mo=
re protocol and client ID)
Merging spi/for-next (3237c6c988bb Merge remote-tracking branch 'spi/for-5.=
18' into spi-next)
CONFLICT (content): Merge conflict in drivers/hwmon/adt7310.c
Applying: fix up for "spi: make remove callback a void function"
Merging tip/auto-latest (abe87fe230d7 Merge branch into tip/master: 'core/c=
ore')
Merging clockevents/timers/drivers/next (e547ffe9e6f4 clocksource/drivers/i=
mx-tpm: Update name of clkevt)
Merging edac/edac-for-next (9e32472d8b3f Merge branch 'edac-urgent' into ed=
ac-for-next)
Merging irqchip/irq/irqchip-next (141e6a976c05 Merge branch irq/misc-5.18 i=
nto irq/irqchip-next)
CONFLICT (content): Merge conflict in drivers/pinctrl/pinctrl-starfive.c
Merging ftrace/for-next (864ea0e10cc9 user_events: Add documentation file)
Merging rcu/rcu/next (9f0daba62e95 torture: Make thread detection more robu=
st by using lspcu)
CONFLICT (content): Merge conflict in kernel/rcu/tree_plugin.h
Merging kvm/next (4dfc4ec2b7f5 Merge branch 'kvm-ppc-cap-210' into kvm-next=
-5.18)
CONFLICT (content): Merge conflict in arch/x86/kvm/x86.c
Merging kvm-arm/next (1a48ce92641d Merge branch kvm-arm64/psci-1.1 into kvm=
arm-master/next)
Merging kvms390/next (ee6a569d3bf6 KVM: s390: pv: make use of ultravisor AI=
V support)
Merging xen-tip/linux-next (f66edf684edc xen/pci: Make use of the helper ma=
cro LIST_HEAD())
Merging percpu/for-next (4e1f82dce05b Merge branch 'for-5.16-fixes' into fo=
r-next)
Merging workqueues/for-next (bc35f7ef9628 workqueue: Convert the type of po=
ol->nr_running to int)
Merging drivers-x86/for-next (2546c6000430 platform/x86: Add Intel Software=
 Defined Silicon driver)
Merging chrome-platform/for-next (b579f139e470 platform/chrome: cros_ec_typ=
ec: Update mux flags during partner removal)
Merging hsi/for-next (e783362eb54c Linux 5.17-rc1)
Merging leds/for-next (8b43ef06ff89 leds: simatic-ipc-leds: Don't directly =
deref ioremap_resource() returned ptr)
Merging ipmi/for-next (00d93611f002 ipmi:ipmb: Add the ability to have a se=
parate slave and master device)
Merging driver-core/driver-core-next (4a248f85b3dd Merge 5.17-rc6 into driv=
er-core-next)
CONFLICT (content): Merge conflict in drivers/power/supply/ab8500_chargalg.c
Merging usb/usb-next (f6a9a2d64dd1 USB: core: Update kerneldoc for usb_get_=
dev() and usb_get_intf())
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/qcom/ipq6018.dtsi
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/xilinx/zynqmp.dtsi
CONFLICT (content): Merge conflict in drivers/usb/dwc3/dwc3-pci.c
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (26291c54e111 Linux 5.17-rc2)
Merging usb-chipidea-next/for-usb-next (78665f57c3fa usb: chipidea: udc: ma=
ke controller hardware endpoint primed)
Merging tty/tty-next (c2faf737abfb tty: Reserve ldisc 29 for development pu=
rposes)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging char-misc/char-misc-next (085686fb8491 Merge 5.17-rc6 into char-mis=
c-next)
CONFLICT (content): Merge conflict in MAINTAINERS
CONFLICT (content): Merge conflict in drivers/mfd/simple-mfd-i2c.c
$ git reset --hard HEAD^
Merging next-20220224 version of char-misc
Merging extcon/extcon-next (b26c5f03a645 extcon: Fix some kernel-doc commen=
ts)
CONFLICT (content): Merge conflict in drivers/power/supply/max8997_charger.c
Merging gnss/gnss-next (26291c54e111 Linux 5.17-rc2)
Merging phy-next/next (9a4556dad7bd Revert "PCI: aardvark: Fix initializati=
on with old Marvell's Arm Trusted Firmware")
CONFLICT (modify/delete): Documentation/devicetree/bindings/phy/qcom,usb-hs=
-phy.txt deleted in phy-next/next and modified in HEAD.  Version HEAD of Do=
cumentation/devicetree/bindings/phy/qcom,usb-hs-phy.txt left in tree.
$ git rm -f Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.txt
Applying: merge fix for "dt-bindings: phy: qcom,usb-hs-phy: add MSM8226 com=
patible"
Merging soundwire/next (63fadaa2c719 soundwire: stream: make enable/disable=
/deprepare idempotent)
Merging thunderbolt/next (7f7b571becf3 thunderbolt: Replace acpi_bus_get_de=
vice())
Merging vfio/next (2bed2ced40c9 vfio/iommu_type1: replace kfree with kvfree)
Merging staging/staging-next (dbbe23c31922 Merge 5.17-rc6 into staging-next)
CONFLICT (content): Merge conflict in drivers/staging/fbtft/fbtft.h
Merging iio/togreg (185897d03ca3 iio: accel: adxl367: Fix handled initializ=
ation in adxl367_irq_handler())
CONFLICT (content): Merge conflict in .mailmap
CONFLICT (content): Merge conflict in drivers/iio/accel/fxls8962af-core.c
Merging mux/for-next (0fcfb00b28c0 Linux 5.16-rc4)
Merging icc/icc-next (2ccd1d8a2f5d Merge branch 'icc-msm8939' into icc-next)
Merging dmaengine/next (ea7c8f598c32 dmaengine: idxd: restore traffic class=
 defaults after wq reset)
Merging cgroup/for-next (88ea791b5665 Merge branch 'for-5.17-fixes' into fo=
r-next)
Merging scsi/for-next (95cd16ea1a66 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (740ec00969c3 scsi: core: Remove <scsi/scsi_reque=
st.h>)
CONFLICT (content): Merge conflict in block/blk-lib.c
CONFLICT (content): Merge conflict in drivers/block/rnbd/rnbd-clt.c
Merging vhost/linux-next (fae0bd40fab0 virtio_console: break out of buf pol=
l on remove)
Merging rpmsg/for-next (dbba77c2f01b Merge branch 'rproc-next' into for-nex=
t)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (667630edb5ba gpiolib: sysfs: Simplify edge=
 handling in the code)
Merging gpio-intel/for-next (a1ce76e89907 gpio: tps68470: Allow building as=
 module)
Merging gpio-sim/gpio/gpio-sim (0fcfb00b28c0 Linux 5.16-rc4)
Merging pinctrl/for-next (929229098efb Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (d25478e1d8f9 pinctrl: icelake: Add Ice Lake=
-N PCH pin controller support)
Merging pinctrl-renesas/renesas-pinctrl (babe298e9caa pinctrl: renesas: r8a=
779f0: Add Ethernet pins, groups, and functions)
Merging pinctrl-samsung/for-next (3652dc070bad pinctrl: samsung: improve wa=
ke irq info on console)
Merging pwm/for-next (ed14d36498c8 pwm: rcar: Simplify multiplication/shift=
 logic)
Merging userns/for-next (0ac983f51203 ucounts: Fix systemd LimitNPROC with =
private users regression)
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging kselftest/next (2aaa36e95ea5 selftests/rtc: continuously read RTC i=
n a loop for 30s)
Merging livepatching/for-next (b44a7f076ce1 Merge branch 'for-5.18/selftest=
s-fixes' into for-next)
Merging coresight/next (2013b615a7a7 coresight: etm3x: Don't trace PID for =
non-root PID namespace)
Merging rtc/rtc-next (73ce05302007 rtc: pcf2127: fix bug when reading alarm=
 registers)
Merging nvdimm/libnvdimm-for-next (2166a9974902 dax: make sure inodes are f=
lushed before destroy cache)
Merging at24/at24/for-next (e783362eb54c Linux 5.17-rc1)
Merging ntb/ntb-next (afe1c85b354c IDT: Fix Build warnings on some 32bit ar=
chitectures.)
Merging seccomp/for-next/seccomp (eed09ad26182 samples/seccomp: Adjust samp=
le to also provide kill option)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging fsi/next (f2af60bb7ce2 fsi: Add trace events in initialization path)
Merging slimbus/for-next (e783362eb54c Linux 5.17-rc1)
Merging nvmem/for-next (bdf79b27260b dt-bindings: nvmem: brcm,nvram: add ba=
sic NVMEM cells)
CONFLICT (content): Merge conflict in MAINTAINERS
CONFLICT (content): Merge conflict in drivers/nvmem/Kconfig
CONFLICT (content): Merge conflict in drivers/nvmem/Makefile
Merging xarray/main (22f56b8e890d XArray: Include bitmap.h from xarray.h)
Merging hyperv/hyperv-next (d57d6fe5bf34 drivers: hv: log when enabling cra=
sh_kexec_post_notifiers)
Merging auxdisplay/auxdisplay (4daa9ff89ef2 auxdisplay: charlcd: checking f=
or pointer reference before dereferencing)
Merging kgdb/kgdb/for-next (b77dbc86d604 kdb: Adopt scheduler's task classi=
fication)
Merging hmm/hmm (6880fa6c5660 Linux 5.15-rc1)
Merging fpga/for-next (21f0a239ecab fpga: dfl: pci: Remove usage of the dep=
recated "pci-dma-compat.h" API)
Merging kunit/test (e783362eb54c Linux 5.17-rc1)
Merging cfi/cfi/next (baaf965f9430 mtd: hyperbus: rpc-if: fix bug in rpcif_=
hb_remove)
Merging kunit-next/kunit (5debe5bfa02c list: test: Add a test for list_entr=
y_is_head())
Merging trivial/for-next (081c8919b02b Documentation: remove trivial tree)
Merging mhi/mhi-next (7ba21a082d3e bus: mhi: pci_generic: Add mru_default f=
or Quectel EM1xx series)
Merging memblock/for-next (f30b002ccfee memblock: __next_mem_pfn_range_in_z=
one: remove unneeded local variable nid)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (e71ba9452f0b Linux 5.11-rc2)
Merging cxl/next (e6e17cc6ed75 cxl/core: Fix cxl_device_lock() class detect=
ion)
Merging folio-iomap/folio-iomap (4d7bd0eb72e5 iomap: Inline __iomap_zero_it=
er into its caller)
Merging zstd/zstd-next (88a309465b3f lib: zstd: clean up double word in com=
ment.)
Merging efi/next (0ea9e1c3dbd4 efivars: Respect "block" flag in efivar_entr=
y_set_safe())
Merging unicode/for-next (5298d4bfe80f unicode: clean up the Kconfig symbol=
 confusion)
Merging slab/for-next (d3d59937afdf Merge branch 'for-5.18/trivial' into fo=
r-next)
Merging random/master (e7dbe86544fa random: unify cycles_t and jiffies usag=
e and types)
Merging landlock/next (a691b9858300 Merge Landlock fixes into next)
Merging rust/rust-next (847245fe812e init/Kconfig: Specify the interpreter =
for rust-is-available.sh)
Merging sysctl/sysctl-next (fc12aa67daba kernel/do_mount_initrd: move real_=
root_dev sysctls to its own file)
CONFLICT (content): Merge conflict in include/linux/sched/sysctl.h
CONFLICT (content): Merge conflict in kernel/sysctl.c
Merging maple/maple/mainline (3dea5db7fbb5 mm/mmap.c: Pass in mapping to __=
vma_link_file())
CONFLICT (content): Merge conflict in arch/parisc/kernel/cache.c
CONFLICT (content): Merge conflict in mm/mmap.c
CONFLICT (content): Merge conflict in tools/include/linux/slab.h
CONFLICT (content): Merge conflict in tools/testing/radix-tree/Makefile
CONFLICT (content): Merge conflict in tools/testing/radix-tree/linux.c
$ git reset --hard HEAD^
Merging folio/for-next (9cfb5d9ede85 selftests/vm/transhuge-stress: Support=
 file-backed PMD folios)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_cache.c
Merging execve/for-next/execve (585dbbf304e6 binfmt_elf: Introduce KUnit te=
st)
Merging akpm-current/current (dc7f71f1a2da ipc/mqueue: use get_tree_nodev()=
 in mqueue_get_tree())
CONFLICT (content): Merge conflict in Documentation/admin-guide/sysctl/kern=
el.rst
CONFLICT (content): Merge conflict in include/linux/sched/sysctl.h
CONFLICT (content): Merge conflict in lib/Kconfig.debug
CONFLICT (content): Merge conflict in mm/huge_memory.c
CONFLICT (content): Merge conflict in mm/internal.h
CONFLICT (content): Merge conflict in mm/memcontrol.c
CONFLICT (content): Merge conflict in mm/memory-failure.c
CONFLICT (content): Merge conflict in mm/memory.c
CONFLICT (content): Merge conflict in mm/memremap.c
CONFLICT (content): Merge conflict in mm/rmap.c
CONFLICT (content): Merge conflict in mm/vmscan.c
CONFLICT (modify/delete): tools/testing/radix-tree/linux/gfp.h deleted in H=
EAD and modified in akpm-current/current.  Version akpm-current/current of =
tools/testing/radix-tree/linux/gfp.h left in tree.
$ git rm -f tools/testing/radix-tree/linux/gfp.h
Applying: fix up for "tools: Move gfp.h and slab.h from radix-tree to lib"
Applying: Revert "mm/migration: add trace events for base page and HugeTLB =
migrations"
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
CONFLICT (content): Merge conflict in mm/rmap.c
Merging akpm/master (43b55c532c25 selftests: kselftest framework: provide "=
finished" helper)

--Sig_/TpSm6oYRTRPW0SUMMVdQHfI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmIc654ACgkQAVBC80lX
0GznUAf/aVCHI34yiCKhG541AKeryQvxEfvkzHuBN8quHxFWfwhMSrrk/8Siqbcp
MTWiiAQwdJIM844+k1ly3cZgNB2wVkFz9PCNYYUheFFoOzEIw5Bx1l7bsFQhcuwJ
49OE28HZK2phmWio5FZRf2puw1yO90wCy0g97gvK/CBuAS+e53kt08puFp3Z6qrj
/XqzizVfCPeXmvaKh14TrtzHaCtOA5IZvIUYj7J2fGmz2AD1O4V1Ebp4O7XAmJHO
toI4uaxmp3EhEnnHyd32eqvzLhShvsH7ixnvMY7n0gPQDUjmF7PE4y5MYsV5KnGp
Yfp3dDIWXmbNgaKXXm82WX7s4dwR4Q==
=mLn+
-----END PGP SIGNATURE-----

--Sig_/TpSm6oYRTRPW0SUMMVdQHfI--
