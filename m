Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6930061E9D1
	for <lists+linux-next@lfdr.de>; Mon,  7 Nov 2022 04:44:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbiKGDoR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 6 Nov 2022 22:44:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231144AbiKGDoM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 6 Nov 2022 22:44:12 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C02395B9;
        Sun,  6 Nov 2022 19:44:08 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4N5HCV6tBBz4xGT;
        Mon,  7 Nov 2022 14:44:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1667792647;
        bh=FBZIT+/g/6nAwC9iLZmpfNFSlsPU3R/74hzTiW3LDE4=;
        h=Date:From:To:Cc:Subject:From;
        b=nCxlz6OTThx0ZR9agLouqnP1V7HQfbHctapb7i8COcPy7rKMOPlh/50ekRnK8ExGq
         urcE2IzMreqQwXEQGRamWNjOCF5y0wHTEuwHigUuU1TxuGl5cApPnZA4LbktEWpOpC
         WlmpfxEzZt3EXG0ydbehZ8y2EmyuZriL4L9S7qG3JXDES57XYnVi1B0LUMvQKO3gye
         SGmU61V40XHXPZIUgHsFATvExgqtB7ZcGpsY8P2/OuXurpsVG/NoOxJ7JslKImMaZS
         JBE3u7VYeQUEOnOMzFIUn0xq84VhtYpjdVDMqAg5qDTjMo5qGN6AB+KLJ36foQsEmF
         iyKwnXKS6pJ9g==
Date:   Mon, 7 Nov 2022 14:44:05 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 7
Message-ID: <20221107144405.68f0b579@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bsZvFKk/avq6Yt+j7PtD.Bg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,LOCALPART_IN_SUBJECT,SPF_HELO_PASS,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bsZvFKk/avq6Yt+j7PtD.Bg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20221104:

The tip tree gained a conflict against the bpf tree.

The ipmi tree lost its build failure.

The mm tree lost its build failure and gained a conflict against Linus'
tree.

Non-merge commits (relative to Linus' tree): 5161
 5144 files changed, 257056 insertions(+), 133782 deletions(-)

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

I am currently merging 367 trees (counting Linus' and 102 trees of bug
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
Merging origin/master (727ea09e99b8 Merge tag 'perf_urgent_for_v6.1_rc4' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging fixes/fixes (9c9155a3509a Merge tag 'drm-next-2022-10-14' of git://=
anongit.freedesktop.org/drm/drm)
Merging mm-hotfixes/mm-hotfixes-unstable (d2a550d1b2b4 fs: fix leaked psi p=
ressure state)
Merging kbuild-current/fixes (7a263a040256 kconfig: fix segmentation fault =
in menuconfig search)
Merging arc-current/for-curr (30a0b95b1335 Linux 6.1-rc3)
Merging arm-current/fixes (14ca1a469075 ARM: 9247/1: mm: set readonly for M=
T_MEMORY_RO with ARM_LPAE)
Merging arm64-fixes/for-next/fixes (85f1506337f0 arm64: cpufeature: Fix the=
 visibility of compat hwcaps)
Merging arm-soc-fixes/arm/fixes (5449cabd95bb Merge tag 'juno-fix-6.1' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into arm/fi=
xes)
Merging davinci-current/davinci/for-current (9abf2313adc1 Linux 6.1-rc1)
Merging drivers-memory-fixes/fixes (9abf2313adc1 Linux 6.1-rc1)
Merging tee-fixes/fixes (98268f2a2a9f Merge branch 'optee_ffa_probe_fix_for=
_v5.18' into fixes)
Merging m68k-current/for-linus (dc63a086daee m68k: Rework BI_VIRT_RNG_SEED =
as BI_RNG_SEED)
Merging powerpc-fixes/fixes (02a771c9a68a powerpc/32: Select ARCH_SPLIT_ARG=
64)
Merging s390-fixes/fixes (bb8738876b24 s390: update defconfigs)
Merging sparc/master (2d2b17d08bfc sparc: Unbreak the build)
Merging fscrypt-current/for-stable (ccd30a476f8e fscrypt: fix keyring memor=
y leak on mount failure)
Merging net/master (b7cbc6740bd6 net: fman: Unregister ethernet device on r=
emoval)
Merging bpf/master (c86df29d11df bpf: Convert BPF_DISPATCHER to use static_=
call() (not ftrace))
Merging ipsec/master (7f57f8165cb6 af_key: Fix send_acquire race with pfkey=
_register)
Merging netfilter/master (7fb0269720d7 Merge tag 'for-net-2022-05-23' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth)
Merging ipvs/master (7fb0269720d7 Merge tag 'for-net-2022-05-23' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth)
Merging wireless/for-next (91018bbcc664 Merge tag 'wireless-2022-11-03' of =
git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless)
Merging rdma-fixes/for-rc (7a47e077e503 RDMA/qedr: clean up work queue on f=
ailure in qedr_alloc_resources())
Merging sound-current/for-linus (0c423e2ffa7e ALSA: hda/ca0132: add quirk f=
or EVGA Z390 DARK)
Merging sound-asoc-fixes/for-linus (a1dca8774faf ASoC: rt5677: fix legacy d=
ai naming)
Merging regmap-fixes/for-linus (157209ecce2b Merge remote-tracking branch '=
regmap/for-6.0' into regmap-linus)
Merging regulator-fixes/for-linus (6555bf0ad524 Merge remote-tracking branc=
h 'regulator/for-6.0' into regulator-linus)
Merging spi-fixes/for-linus (d1a0c45245aa Merge remote-tracking branch 'spi=
/for-6.0' into spi-linus)
Merging pci-current/for-linus (39a654f39efb MAINTAINERS: Add Manivannan Sad=
hasivam as Qcom PCIe RC maintainer)
Merging driver-core.current/driver-core-linus (54de93cd8740 kernel/utsname_=
sysctl.c: Add missing enum uts_proc value)
Merging tty.current/tty-linus (7b7dfe4833c7 tty: n_gsm: fix sleep-in-atomic=
-context bug in gsm_control_send)
Merging usb.current/usb-linus (30a0b95b1335 Linux 6.1-rc3)
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (df3414b0a245 USB: serial: option: add S=
ierra Wireless EM9191)
Merging phy/fixes (819b885cd886 phy: ralink: mt7621-pci: add sentinel to qu=
irks table)
Merging staging.current/staging-linus (937ec9f7d5f2 staging: rtl8192e: remo=
ve bogus ssid character sign test)
Merging iio-fixes/fixes-togreg (0aa60ff5d996 iio: light: apds9960: fix wron=
g register for gesture gain)
Merging counter-current/counter-current (30a0b95b1335 Linux 6.1-rc3)
Merging char-misc.current/char-misc-linus (38e9f21f648e Merge tag 'iio-fixe=
s-for-6.1b' of https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio in=
to char-misc-linus)
Merging soundwire-fixes/fixes (49a467310dc4 soundwire: qcom: check for outa=
nding writes before doing a read)
Merging thunderbolt-fixes/fixes (30a0b95b1335 Linux 6.1-rc3)
Merging input-current/for-linus (c7e37cc62407 Input: goodix - try resetting=
 the controller when no config is set)
Merging crypto-current/master (9f6035af06b5 crypto: x86/polyval - Fix crash=
es when keys are not 16-byte aligned)
Merging vfio-fixes/for-linus (873aefb376bb vfio/type1: Unpin zero pages)
Merging kselftest-fixes/fixes (89c1017aac67 selftests/pidfd_test: Remove th=
e erroneous ',')
Merging modules-fixes/modules-linus (77d6354bd422 module/decompress: genera=
te sysfs string at compile time)
Merging dmaengine-fixes/fixes (79029dc341c7 dmaengine: stm32-dma: fix poten=
tial race between pause and resume)
Merging backlight-fixes/for-backlight-fixes (a38fd8748464 Linux 5.12-rc2)
Merging mtd-fixes/mtd/fixes (05e258c6ec66 mtd: parsers: bcm47xxpart: Fix ha=
lfblock reads)
Merging mfd-fixes/for-mfd-fixes (a61f4661fba4 mfd: intel_quark_i2c_gpio: Re=
vert "Constify static struct resources")
Merging v4l-dvb-fixes/fixes (de547896aac6 media: vivid.rst: loop_video is s=
et on the capture devnode)
Merging reset-fixes/reset/fixes (ae358d71d462 reset: npcm: fix iprst2 and i=
prst4 setting)
Merging mips-fixes/mips-fixes (9abf2313adc1 Linux 6.1-rc1)
Merging at91-fixes/at91-fixes (cef8cdc0d0e7 ARM: at91: pm: avoid soft reset=
ting AC DLL)
Merging omap-fixes/fixes (2a906db2824b Merge branch 'am5748-fix' into fixes)
Merging kvm-fixes/master (f4298cac2bfc Merge tag 'kvmarm-fixes-6.1-3' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvms390-fixes/master (165dfb55facd KVM: s390: pv: don't allow users=
pace to set the clock under PV)
Merging hwmon-fixes/hwmon (1e699e177e33 Revert "hwmon: (pmbus) Add regulato=
r supply into macro")
Merging nvdimm-fixes/libnvdimm-fixes (b3bbcc5d1da1 Merge branch 'for-6.0/da=
x' into libnvdimm-fixes)
Merging cxl-fixes/fixes (8f401ec1c897 cxl/region: Recycle region ids)
Merging btrfs-fixes/next-fixes (738f7a2d84ed Merge branch 'misc-6.1' into n=
ext-fixes)
Merging vfs-fixes/fixes (7ee47dcfff18 fs: use acquire ordering in __fget_li=
ght())
Merging dma-mapping-fixes/for-linus (3be4562584bb dma-direct: use the corre=
ct size for dma_set_encrypted())
Merging i3c-fixes/i3c/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging drivers-x86-fixes/fixes (e9cf4d9b9a6f ACPI: video: Fix missing nati=
ve backlight on Chromebooks)
Merging samsung-krzk-fixes/fixes (9abf2313adc1 Linux 6.1-rc1)
Merging pinctrl-samsung-fixes/fixes (9abf2313adc1 Linux 6.1-rc1)
Merging devicetree-fixes/dt/linus (917c362b5f8a MAINTAINERS: of: collapse o=
verlay entry into main device tree entry)
Merging dt-krzk-fixes/fixes (9abf2313adc1 Linux 6.1-rc1)
Merging scsi-fixes/fixes (307539eed463 scsi: ufs: core: Fix typo in comment)
Merging drm-fixes/drm-fixes (6295f1d8b450 Merge tag 'drm-intel-fixes-2022-1=
1-03' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (12caf46cf4fc drm/i915/sdvo: G=
rab mode_config.mutex during LVDS init to avoid WARNs)
Merging mmc-fixes/fixes (30a0b95b1335 Linux 6.1-rc3)
Merging rtc-fixes/rtc-fixes (db4e955ae333 rtc: cmos: fix build on non-ACPI =
platforms)
Merging gnss-fixes/gnss-linus (247f34f7b803 Linux 6.1-rc2)
Merging hyperv-fixes/hyperv-fixes (e70af8d040d2 PCI: hv: Fix the definition=
 of vector in hv_compose_msi_msg())
Merging soc-fsl-fixes/fix (4b0986a3613c Linux 5.18)
Merging risc-v-fixes/fixes (8bc8824d3019 riscv: dts: sifive unleashed: Add =
PWM controlled LEDs)
Merging risc-v-mc-fixes/dt-fixes (0dec364ffeb6 riscv: dts: microchip: use a=
n mpfs specific l2 compatible)
Merging pidfd-fixes/fixes (03ba0fe4d09f file: simplify logic in __close_ran=
ge())
Merging fpga-fixes/fixes (9abf2313adc1 Linux 6.1-rc1)
Merging spdx/spdx-linus (30a0b95b1335 Linux 6.1-rc3)
Merging gpio-brgl-fixes/gpio/for-current (30a0b95b1335 Linux 6.1-rc3)
Merging gpio-intel-fixes/fixes (9abf2313adc1 Linux 6.1-rc1)
Merging pinctrl-intel-fixes/fixes (9abf2313adc1 Linux 6.1-rc1)
Merging erofs-fixes/fixes (ce4b81568657 erofs: protect s_inodes with s_inod=
e_list_lock for fscache)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (618887768bb7 kunit: update NULL vs IS_ERR(=
) tests)
Merging ubifs-fixes/fixes (c18a80c6861f jffs2: correct logic when creating =
a hole in jffs2_write_begin)
Merging memblock-fixes/fixes (c94afc46cae7 memblock: use kfree() to release=
 kmalloced memblock regions)
Merging cel-fixes/for-rc (bdd6b5624c62 nfsd: fix use-after-free in nfsd_fil=
e_do_acquire tracepoint)
Merging irqchip-fixes/irq/irqchip-fixes (6c9f7434159b irqchip: IMX_MU_MSI s=
hould depend on ARCH_MXC)
Merging renesas-fixes/fixes (ab2866f12ca1 arm64: dts: renesas: r8a779g0: Fi=
x HSCIF0 interrupt number)
Merging broadcom-fixes/fixes (9abf2313adc1 Linux 6.1-rc1)
Merging perf-current/perf/urgent (5aaef24b5c6d Merge tag 'for-6.1-rc3-tag' =
of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux)
Merging efi-fixes/urgent (23715a26c8d8 arm64: efi: Recover from synchronous=
 exceptions occurring in firmware)
Merging zstd-fixes/zstd-linus (88a309465b3f lib: zstd: clean up double word=
 in comment.)
Merging battery-fixes/fixes (767e684367e4 power: supply: ab8500: Defer ther=
mal zone probe)
Merging uml-fixes/fixes (bd71558d585a arch: um: Mark the stack non-executab=
le to fix a binutils warning)
Merging asahi-soc-fixes/asahi-soc/fixes (568035b01cfb Linux 6.0-rc1)
Merging iommufd-fixes/for-rc (30a0b95b1335 Linux 6.1-rc3)
Merging drm-misc-fixes/for-linux-next-fixes (3bc6a37f59f2 drm/vc4: hdmi: Fi=
x HSM clock too low on Pi4)
Merging kbuild/for-next (2df76606db9d Merge tag 'kbuild-fixes-v6.1' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild)
Merging clang-format/clang-format (781121a7f6d1 clang-format: Fix space aft=
er for_each macros)
Merging perf/perf/core (96e6d929a6c3 perf trace: Use sig_atomic_t to avoid =
undefined behaviour in a signal handler)
Merging compiler-attributes/compiler-attributes (6cf1ab89c9e7 Compiler Attr=
ibutes: Introduce __access_*() function attribute)
Merging dma-mapping/for-next (8d58aa484920 swiotlb: reduce the swiotlb buff=
er size on allocation failure)
Merging asm-generic/master (2e21c1575208 alpha: fix marvel_ioread8 build re=
gression)
Merging arc/for-next (f2906aa86338 Linux 5.19-rc1)
Merging arm/for-next (072132be9f91 Merge branches 'misc' and 'fixes' into f=
or-next)
Merging arm64/for-next/core (0e5d5ae837c8 arm64: Add AMPERE1 to the Spectre=
-BHB affected list)
Merging arm-perf/for-next/perf (aaaee7b55c9e docs: perf: Include hns3-pmu.r=
st in toctree to fix 'htmldocs' WARNING)
Merging arm-soc/for-next (76b4abc1ae4b Merge branch 'arm/drivers' into for-=
next)
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (f665c485b1d2 Merge branch 'v6.2/arm64-dt' into fo=
r-next)
Merging asahi-soc/asahi-soc/for-next (56fed763f6b2 arm64: dts: apple: Add A=
DMAC resets on t8103/t600x)
Merging aspeed/for-next (cb714bd0c599 ARM: dts: nuvoton: Remove bogus unit =
addresses from fixed-partition nodes)
Merging at91/at91-next (4fb3808be768 Merge branch 'at91-defconfig' into at9=
1-next)
Merging broadcom/next (9abf2313adc1 Linux 6.1-rc1)
Merging davinci/davinci/for-next (53ad523ac435 ARM: davinci: fix repeated w=
ords in comments)
Merging drivers-memory/for-next (1f1e46b83b7d dt-bindings: memory-controlle=
rs: ti,gpmc: add wait-pin polarity)
Merging imx-mxs/for-next (89ca3fade6cb Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (cb293d3b430e Merge branch 'for_5.15/drivers-soc' int=
o next)
Merging mediatek/for-next (cbb1618792e2 Merge branch 'v6.0-next/soc' into f=
or-next)
Merging mvebu/for-next (d5c48679d56c Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (8efe5dea6753 Merge branch 'omap-for-v6.1/dt' into fo=
r-next)
Merging qcom/for-next (0df6c177c8f1 Merge branches 'arm64-defconfig-for-6.2=
', 'arm64-for-6.2', 'clk-for-6.2', 'defconfig-for-6.2', 'drivers-for-6.2', =
'dts-for-6.2' and 'arm64-fixes-for-6.1' into for-next)
Merging raspberrypi/for-next (c5915b53d4c2 dt-bindings: soc: bcm: Convert b=
rcm,bcm2835-vchiq to json-schema)
Merging renesas/next (4bff929bc882 Merge branches 'renesas-arm-dt-for-v6.2'=
, 'renesas-arm-soc-for-v6.2' and 'renesas-dt-bindings-for-v6.2' into renesa=
s-next)
Merging reset/reset/next (d985db836226 reset: tps380x: Fix spelling mistake=
 "Voltags" -> "Voltage")
Merging rockchip/for-next (7771a384229f Merge branch 'v6.1-armsoc/dtsfixes'=
 into for-next)
Merging samsung-krzk/for-next (36fdb19fb9dd Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (e7c94176ab90 Merge branch 'for-next/scmi' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging stm32/stm32-next (7ad436adc788 ARM: multi_v7_defconfig: enable Type=
-C UCSI and STM32G0 as modules)
Merging sunxi/sunxi/for-next (8907a276fec2 ARM: dts: axp22x/axp809: Add GPI=
O controller nodes)
Merging tee/next (bd52407221b4 optee: Add __init/__exit annotations to modu=
le init/exit funcs)
Merging tegra/for-next (77bfb4481cf2 Merge branch for-6.2/arm64/defconfig i=
nto for-next)
Merging ti/ti-next (b7897ec0b3d2 Merge branches 'ti-drivers-soc-next', 'ti-=
k3-config-next' and 'ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (0413dd4d95da ARM: dts: zynq: add QSPI controller n=
ode)
Merging clk/clk-next (5eeec1fd8360 Merge branch 'clk-fixes' into clk-next)
Merging clk-imx/for-next (9abf2313adc1 Linux 6.1-rc1)
Merging clk-renesas/renesas-clk (02693e11611e clk: renesas: r9a06g032: Repa=
ir grave increment error)
Merging clk-samsung/for-next (b35f27fe73d8 clk: samsung: exynosautov9: add =
cmu_peric1 clock support)
Merging csky/linux-next (ce0ba954805e csky: Kconfig: Fix spelling mistake "=
Meory" -> "Memory")
Merging loongarch/loongarch-next (247f34f7b803 Linux 6.1-rc2)
Merging m68k/for-next (550a998f37b4 m68k: mac: Reword comment using double =
"in")
Merging m68knommu/for-next (30a0b95b1335 Linux 6.1-rc3)
Merging microblaze/next (493ffd6605b2 Merge tag 'ucount-rlimits-cleanups-fo=
r-v5.19' of git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-nam=
espace)
Merging mips/mips-next (9abf2313adc1 Linux 6.1-rc1)
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (34a0bac084e4 MAINTAINERS: git://github -> https:=
//github.com for openrisc)
Merging parisc-hd/for-next (247f34f7b803 Linux 6.1-rc2)
Merging powerpc/next (247f34f7b803 Linux 6.1-rc2)
Merging soc-fsl/next (4b0986a3613c Linux 5.18)
Merging risc-v/for-next (be79afc740b5 riscv: Enable HAVE_ARCH_HUGE_VMALLOC =
for 64BIT)
Merging risc-v-mc/dt-for-next (d6105a8b7c16 riscv: dts: microchip: fix memo=
ry node unit address for icicle)
Merging s390/for-next (f01567ae8be4 Merge branch 'features' into for-next)
Merging sh/for-next (8518e694203d sh: pgtable-3level: Fix cast to pointer f=
rom integer of different size)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/next (193cb8372424 uml: Remove the initialization of statics to=
 0)
Merging xtensa/xtensa-for-next (b8c4f4db2436 xtensa: update config files)
Merging pidfd/for-next (6a857ab5b57c Merge branch 'fs.idmapped.overlay.acl'=
 into for-next)
Merging vfs-idmapping/for-next (05ed524f81ad Merge branch 'fs.idmapped.squa=
shfs' into for-next)
Merging fscrypt/master (0e91fc1e0f5c fscrypt: work on block_devices instead=
 of request_queues)
Merging fscache/fscache-next (0885eacdc81f Merge tag 'nfsd-5.19-1' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/cel/linux)
Merging afs/afs-next (26291c54e111 Linux 5.17-rc2)
Merging btrfs/for-next (4eb8c0548db1 Merge branch 'for-next-next-v6.1-20221=
104' into for-next-20221104)
CONFLICT (content): Merge conflict in fs/btrfs/ctree.h
Applying: btrfs: fix up for "fs: pass dentry to set acl method"
Merging ceph/master (ffc4d66a34bb ceph: fix a NULL vs IS_ERR() check when c=
alling ceph_lookup_inode())
Merging cifs/for-next (727ea09e99b8 Merge tag 'perf_urgent_for_v6.1_rc4' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging configfs/for-next (84ec758fb2da configfs: fix a race in configfs_{,=
un}register_subsystem())
Merging ecryptfs/next (c1cc2db21607 ecryptfs: keystore: Fix typo 'the the' =
in comment)
Merging erofs/dev (312fe643ad11 erofs: clean up erofs_iget())
Merging exfat/dev (2e9ceb6728f1 exfat: fix overflow for large capacity part=
ition)
Merging ext3/for_next (ab7720a2b117 maintainers: Add ISOFS entry)
Merging ext4/dev (0d043351e5ba ext4: fix fortify warning in fs/ext4/fast_co=
mmit.c:1551)
Merging f2fs/dev (3b21b794b579 f2fs: replace ternary operator with max())
Merging fsverity/fsverity (8377e8a24bba fs-verity: use kmap_local_page() in=
stead of kmap())
Merging fuse/for-next (cbed990fb813 fuse: Rearrange fuse_allow_current_proc=
ess checks)
Merging gfs2/for-next (288fc8606762 Merge tag 'gfs2-nopid-for-v6.1' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2)
Merging jfs/jfs-next (25e70c6162f2 fs: jfs: fix shift-out-of-bounds in dbDi=
scardAG)
Merging ksmbd/ksmbd-for-next (f5ba1cdaf5eb ksmbd: validate share name from =
share config response)
Merging nfs/linux-next (8e5423e991e8 Merge tag 'parisc-for-6.1-2' of git://=
git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux)
Merging nfs-anna/linux-next (7e8436728e22 nfs4: Fix kmemleak when allocate =
slot failed)
Merging nfsd/for-next (875bb88b9ce2 NFSD: Re-arrange file_close_inode trace=
points)
Merging ntfs3/master (0d6d7c61ffee fs/ntfs3: Don't use uni1 uninitialized i=
n ntfs_d_compare())
CONFLICT (content): Merge conflict in fs/ntfs3/xattr.c
Merging orangefs/for-next (2ad4b6f5e117 Orangefs: change iterate to iterate=
_shared)
Merging overlayfs/overlayfs-next (b337e5ae0e42 ovl: Kconfig: Fix spelling m=
istake "undelying" -> "underlying")
Merging ubifs/next (669d204469c4 ubi: fastmap: Add fastmap control support =
for 'UBI_IOCATT' ioctl)
Merging v9fs/9p-next (a8e633c60447 net/9p: clarify trans_fd parse_opt failu=
re handling)
Merging xfs/for-next (4eb559dd1567 Merge tag 'refcount-cow-domain-6.1_2022-=
10-31' of git://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux in=
to xfs-6.1-fixesA)
Merging zonefs/for-next (6bac30bb8ff8 zonefs: Call page_address() on page a=
cquired with GFP_KERNEL flag)
Merging iomap/iomap-for-next (adc9c2e5a723 iomap: add a tracepoint for mapp=
ings returned by map_blocks)
Merging djw-vfs/vfs-for-next (49df34221804 fs: fix an infinite loop in ioma=
p_fiemap)
Merging file-locks/locks-next (072e51356cd5 Merge tag 'nfs-for-5.20-2' of g=
it://git.linux-nfs.org/projects/trondmy/linux-nfs)
Merging iversion/iversion-next (2b3319b35573 nfsd: remove fetch_iversion ex=
port operation)
Merging vfs/for-next (3aca47127a64 fs: drop useless condition from inode_ne=
eds_update_time)
Merging printk/for-next (950a9751c1d1 Merge branch 'for-6.2' into for-next)
Merging pci/next (652ce11a7604 Merge branch 'remotes/lorenzo/pci/tegra')
Merging pstore/for-next/pstore (38b91847c314 pstore: Alert on backend write=
 error)
Merging hid/for-next (29e97b78fbda Merge branch 'for-6.2/uclogic' into for-=
next)
Merging i2c/i2c/for-next (befeb20d3813 Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i3c/i3c/next (9abf2313adc1 Linux 6.1-rc1)
Merging dmi/dmi-for-next (13a0ac816d22 firmware: dmi: Fortify entry point l=
ength checks)
Merging hwmon-staging/hwmon-next (8c72b88e52c0 docs: hwmon: (smpro-hwmon) I=
mprove grammar and formatting)
Merging jc_docs/docs-next (07ab97fe7f8a Merge branch 'docs-mw' into docs-ne=
xt)
Merging v4l-dvb/master (247f34f7b803 Linux 6.1-rc2)
Merging v4l-dvb-next/master (de547896aac6 media: vivid.rst: loop_video is s=
et on the capture devnode)
Merging pm/linux-next (2796af610a6e Merge branch 'thermal-intel' into linux=
-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (4f7961706c63 cpufreq: qcom-hw: =
Move soc_data to struct qcom_cpufreq)
Merging cpupower/cpupower (9abf2313adc1 Linux 6.1-rc1)
Merging devfreq/devfreq-next (9abf2313adc1 Linux 6.1-rc1)
Merging opp/opp/linux-next (2eedf62e66c2 OPP: decouple dt properties in opp=
_parse_supplies())
Merging thermal/thermal/linux-next (9d2bc364f677 thermal/drivers/qcom/tsens=
: Simplify debugfs init function)
Merging ieee1394/for-next (54b3bd99f094 firewire: nosy: switch from 'pci_' =
to 'dma_' API)
Merging dlm/next (accd2b083a99 dlm: replace one-element array with fixed si=
ze array)
Merging rdma/for-next (692373d18620 RDMA/rxe: cleanup some error handling i=
n rxe_verbs.c)
Merging net-next/master (63d9e1291484 octeon_ep: support Octeon device CNF9=
5N)
Merging bpf-next/for-next (25906092edb4 Documentation: bpf: Escape undersco=
re in BPF type name prefix)
Merging ipsec-next/master (cc2bbbfd9a50 xfrm: Remove not-used total variabl=
e)
Merging mlx5-next/mlx5-next (9abf2313adc1 Linux 6.1-rc1)
Merging netfilter-next/master (677fb7525331 Merge git://git.kernel.org/pub/=
scm/linux/kernel/git/netdev/net)
Merging ipvs-next/master (677fb7525331 Merge git://git.kernel.org/pub/scm/l=
inux/kernel/git/netdev/net)
Merging bluetooth/master (ce52c2f04177 Bluetooth: hci_bcm: Add CYW4373A0 su=
pport)
Merging wireless-next/for-next (bd954a7e4aa0 wifi: rtl8xxxu: Use dev_* inst=
ead of pr_info)
Merging mtd/mtd/next (aec4d5f5ffd0 mtd: parsers: add TP-Link SafeLoader par=
titions table parser)
CONFLICT (content): Merge conflict in drivers/mtd/mtdcore.c
Merging nand/nand/next (7c3fc99819fd mtd: rawnand: cadence: support 64-bit =
slave dma interface)
Merging spi-nor/spi-nor/next (bb0e9c600ce2 mtd: spi-nor: core: Add an error=
 message when failing to exit the 4-byte address mode)
Merging crypto/master (329cfa42e528 crypto: doc - use correct function name)
Merging drm/drm-next (60ba8c5bd94e Merge tag 'drm-intel-gt-next-2022-11-03'=
 of git://anongit.freedesktop.org/drm/drm-intel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_vkm=
s.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dd=
i.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_di=
splay_power_well.c
CONFLICT (add/add): Merge conflict in drivers/gpu/drm/i915/display/intel_dk=
l_phy.c
CONFLICT (add/add): Merge conflict in drivers/gpu/drm/i915/display/intel_dk=
l_phy.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dp=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dp=
ll_mgr.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_lv=
ds.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_sd=
vo.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_reg.h
Merging drm-misc/for-linux-next (78a77c9f4948 drm/fb-helper: Clarify use of=
 last_close and output_poll_changed)
Merging amdgpu/drm-next (d8ba9f202cd4 drm/amdgpu: force read discovery file=
 if set discovery=3D2)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdkfd/kfd_crat.c
Merging drm-intel/for-linux-next (882ecff709b5 drm/i915: Use intel_crtc_nee=
ds_modeset() more)
Merging drm-tegra/for-next (778bed334508 gpu: host1x: Update host1x_memory_=
context_alloc() !IOMMU_API stub)
Merging drm-msm/msm-next (7f7a942c0a33 Merge tag 'drm-next-20221025' of git=
://linuxtv.org/pinchartl/media into drm-next)
Merging drm-msm-lumag/msm-next-lumag (ee417928fe0a Merge branches 'msm-next=
-lumag-core', 'msm-next-lumag-dpu', 'msm-next-lumag-dp', 'msm-next-lumag-ds=
i', 'msm-next-lumag-hdmi' and 'msm-next-lumag-mdp5' into msm-next-lumag)
Merging imx-drm/imx-drm/next (927d8fd465ad drm/imx: ipuv3-plane: Remove red=
undant color encoding and range initialisation)
Merging etnaviv/etnaviv/next (4bce24427251 drm/etnaviv: disable tx clock ga=
ting for GC7000 rev6203)
Merging fbdev/for-next (3fe7867dc9d0 omapfb: panel-sharp-ls037v7dw01: fix i=
ncluded headers)
Merging regmap/for-next (7c7aa42243cb Merge branch 'regmap-linus' into regm=
ap-next)
Merging sound/for-next (2b4e275b92b8 ALSA: asihpi: remove variable loops)
Merging sound-asoc/for-next (262a6906dbbf Merge remote-tracking branch 'aso=
c/for-6.2' into asoc-next)
Merging modules/modules-next (dd0338eef0d4 kernel/params.c: defer most of p=
aram_sysfs_init() to late_initcall time)
Merging input/next (153a197077d3 dt-bindings: input: sun4i-lradc-keys: Add =
F1C100s compatible)
Merging block/for-next (765d0e263fcc Merge branch 'for-6.2/io_uring' into f=
or-next)
Merging device-mapper/for-next (5434ee8d2857 dm clone: Fix typo in block_de=
vice format specifier)
Merging libata/for-next (de58fd3d80f8 ata: sata_dwc_460ex: remove variable =
num_processed)
Merging pcmcia/pcmcia-next (15e74c6c1ce2 pcmcia: remove AT91RM9200 Compact =
Flash driver)
Merging mmc/next (eddc1b7fc901 mmc: mediatek: add support for MT7986 SoC)
Merging mfd/for-mfd-next (6804c885b67a mfd: rk808: Permit having multiple P=
MIC instances)
Merging backlight/for-backlight-next (e7647de058cb video: backlight: mt6370=
: Add MediaTek MT6370 support)
Merging battery/for-next (09b327c991d2 dt-bindings: power: supply: bq25890:=
 use one fallback compatible)
Merging regulator/for-next (3c952a2a06a2 Merge remote-tracking branch 'regu=
lator/for-6.2' into regulator-next)
Merging security/next (b10b9c342f75 lsm: make security_socket_getpeersec_st=
ream() sockptr_t safe)
Merging apparmor/apparmor-next (4295c60bbe9e apparmor: Fix uninitialized sy=
mbol 'array_size' in policy_unpack_test.c)
Merging integrity/next-integrity (8c1d6a050a0f ima: Fix memory leak in __im=
a_inode_hash())
Merging keys/keys-next (2d743660786e Merge branch 'fixes' of git://git.kern=
el.org/pub/scm/linux/kernel/git/viro/vfs)
Merging safesetid/safesetid-next (64b634830c91 LSM: SafeSetID: add setgroup=
s() testing to selftest)
Merging selinux/next (e0d8259355cb selinux: increase the deprecation sleep =
for checkreqprot and runtime disable)
Merging smack/next (1a3065e92046 smack_lsm: remove unnecessary type casting)
Merging tomoyo/master (9abf2313adc1 Linux 6.1-rc1)
Merging tpmdd/next (2d869f0b4585 selftest: tpm2: Add Client.__del__() to cl=
ose /dev/tpm* handle)
Merging watchdog/master (82ebbe65d781 drivers: watchdog: exar_wdt.c fix use=
 after free)
Merging iommu/next (7e8eec906b5b Merge branches 'arm/allwinner', 'arm/rockc=
hip', 'ppc/pamu', 's390', 'x86/amd' and 'core' into next)
Merging audit/next (50979953c0c4 audit: unify audit_filter_{uring(), inode_=
name(), syscall()})
Merging devicetree/for-next (c2741cbe7f8a dt-bindings: media: st,stmipid02:=
 Convert the text bindings to YAML)
Merging dt-krzk/for-next (455087308947 Merge branch 'next/qcom-pinctrl' int=
o for-next)
Merging mailbox/mailbox-for-next (b8ae88e1e75e mailbox: qcom-ipcc: flag IRQ=
 NO_THREAD)
Merging spi/for-next (5e2212c83ada Merge remote-tracking branch 'spi/for-6.=
2' into spi-next)
Merging tip/master (01d2077d0e55 Merge branch into tip/master: 'x86/core')
CONFLICT (content): Merge conflict in arch/x86/net/bpf_jit_comp.c
CONFLICT (content): Merge conflict in include/linux/bpf.h
Merging clockevents/timers/drivers/next (af246cc6d0ed clocksource/drivers/a=
rm_arch_timer: Fix CNTPCT_LO and CNTVCT_LO value)
Merging edac/edac-for-next (b998a2babf4e Merge edac-misc into for-next)
Merging irqchip/irq/irqchip-next (732d69c80cb0 Merge branch irq/misc-6.1 in=
to irq/irqchip-next)
Merging ftrace/for-next (0934ae9977c2 tracing: Fix reading strings from syn=
thetic events)
Merging rcu/rcu/next (5242bc5b7213 rcu: Add RCU stall diagnosis information)
Merging kvm/next (7353633814f6 KVM: x86/xen: Fix eventfd error handling in =
kvm_xen_eventfd_assign())
Merging kvm-arm/next (b302ca52ba82 Merge branch kvm-arm64/misc-6.1 into kvm=
arm-master/next)
Merging kvms390/next (c8a0273ac80d KVM: s390: Pass initialized arg even if =
unused)
Merging xen-tip/linux-next (4bff677b3015 x86/xen: simplify sysenter and sys=
call setup)
Merging percpu/for-next (a111daf0c53a Linux 5.19-rc3)
Merging workqueues/for-next (c0feea594e05 workqueue: don't skip lockdep wor=
k dependency in cancel_work_sync())
Merging drivers-x86/for-next (225469d4acbc platform/x86: huawei-wmi: remove=
 unnecessary member)
Merging chrome-platform/for-next (015e4b05c377 platform/chrome: cros_ec_spi=
: Set PROBE_PREFER_ASYNCHRONOUS)
Merging hsi/for-next (9abf2313adc1 Linux 6.1-rc1)
Merging leds/for-next (5f52a8ba7e91 dt-bindings: leds: Add 'cpuX' to 'linux=
,default-trigger')
Merging ipmi/for-next (0eb1762f3c77 ipmi/watchdog: Include <linux/kstrtox.h=
> when appropriate)
Merging driver-core/driver-core-next (1662cea4623f kset: fix memory leak wh=
en kset_register() returns error)
Merging usb/usb-next (a8bc8cc193c6 usb: gadget: Use kstrtobool() instead of=
 strtobool())
Merging thunderbolt/next (2ae18cc2269f thunderbolt: ACPI: Use the helper fw=
node_find_reference())
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (247f34f7b803 Linux 6.1-rc2)
Merging tty/tty-next (15730dc45dc7 tty: Cleanup tty buffer align mask)
Merging char-misc/char-misc-next (30a0b95b1335 Linux 6.1-rc3)
Merging coresight/next (30a0b95b1335 Linux 6.1-rc3)
Merging fpga/for-next (ee31d5038c06 dt-bindings: fpga: document Lattice sys=
CONFIG FPGA manager)
Merging icc/icc-next (9abf2313adc1 Linux 6.1-rc1)
Merging iio/togreg (b8bee0f98634 MAINTAINERS: Add KX022A maintainer entry)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/iio=
/addac/adi,ad74413r.yaml
Merging phy-next/next (1f85e10c4b59 doc: phy: Document typical order of API=
 calls)
Merging soundwire/next (cf43cd33b67a soundwire: qcom: add support for v1.7 =
Soundwire Controller)
Merging extcon/extcon-next (9abf2313adc1 Linux 6.1-rc1)
Merging gnss/gnss-next (247f34f7b803 Linux 6.1-rc2)
Merging vfio/next (b1b8132a651c vfio: More vfio_file_is_group() use cases)
Merging staging/staging-next (a37068715956 staging: r8188eu: convert rtw_se=
tdatarate_cmd to correct error semantics)
Merging counter-next/counter-next (30a0b95b1335 Linux 6.1-rc3)
Merging mux/for-next (0fcfb00b28c0 Linux 5.16-rc4)
Merging dmaengine/next (739153a6ae68 Documentation: devres: add missing dev=
m_acpi_dma_controller_free() helper)
Merging cgroup/for-next (79a7f41f7f5a cgroup: cgroup refcnt functions shoul=
d be exported when CONFIG_DEBUG_CGROUP_REF)
Merging scsi/for-next (c8d0d0a1110f Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (e6629dcb00ad scsi: MAINTAINERS: Make Xiang Chen =
HiSilicon SAS controller driver maintainer)
Merging vhost/linux-next (be8ddea9e75e vdpa/ifcvf: add reviewer)
Merging rpmsg/for-next (1b09681fdc30 Merge branches 'rproc-next' and 'hwspi=
nlock-next' into for-next)
Merging gpio/for-next (e73f0f0ee754 Linux 5.14-rc1)
Merging gpio-brgl/gpio/for-next (b8b80348c57b gpiolib: of: add polarity qui=
rk for Freescale PCIe controller)
Merging gpio-intel/for-next (8d259847243d gpiolib: cdev: Fix typo in kernel=
 doc for struct line)
Merging gpio-sim/gpio/gpio-sim (0fcfb00b28c0 Linux 5.16-rc4)
Merging pinctrl/for-next (bfe66c8bb35c Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (3886bc3523db pinctrl: merrifield: Use tempo=
rary variable for struct device)
Merging pinctrl-renesas/renesas-pinctrl (96355be8f0a2 dt-bindings: pinctrl:=
 renesas: Document RZ/Five SoC)
Merging pinctrl-samsung/for-next (9abf2313adc1 Linux 6.1-rc1)
Merging pwm/for-next (cfcb68817fb3 pwm: tegra: Improve required rate calcul=
ation)
Merging userns/for-next (b5df013cd194 Merge of ucount-rlimits-cleanups-for-=
v5.19, interrupting_kthread_stop-for-v5.20, signal-for-v5.20, retire_mq_sys=
ctls-for-v5.19, and unpriv-ipc-sysctls-for-v6.2 for testing in linux-next)
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging kselftest/next (d942f231afc0 selftests/vDSO: Add riscv getcpu & get=
timeofday test)
Merging livepatching/for-next (cad81ab73997 Merge branch 'for-6.2/core' int=
o for-next)
Merging rtc/rtc-next (9abf2313adc1 Linux 6.1-rc1)
Merging nvdimm/libnvdimm-for-next (305a72efa791 Merge branch 'for-6.1/nvdim=
m' into libnvdimm-for-next)
Merging at24/at24/for-next (9abf2313adc1 Linux 6.1-rc1)
Merging ntb/ntb-next (4fe89d07dcc2 Linux 6.0)
Merging seccomp/for-next/seccomp (4e92863862d1 Merge branch 'for-linus/secc=
omp' into for-next/seccomp)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging fsi/next (35af9fb49bc5 fsi: core: Check error number after calling =
ida_simple_get)
Merging slimbus/for-next (c3174a51dc36 slimbus: qcom-ngd-ctrl: reinit the r=
econf completion flag)
Merging nvmem/for-next (8425f5159761 nvmem: stm32: fix spelling typo in com=
ment)
Merging xarray/main (69cb69ea5542 ida: Remove assertions that an ID was all=
ocated)
Merging hyperv/hyperv-next (c69840106483 hv_balloon: Add support for config=
urable order free page reporting)
Merging auxdisplay/auxdisplay (13de23494f38 auxdisplay: lcd2s: Use array si=
ze explicitly in lcd2s_gotoxy())
Merging kgdb/kgdb/for-next (c1cb81429df4 kdb: Fix the putarea helper functi=
on)
Merging hmm/hmm (9abf2313adc1 Linux 6.1-rc1)
Merging kunit/test (9abf2313adc1 Linux 6.1-rc1)
Merging cfi/cfi/next (312310928417 Linux 5.18-rc1)
Merging kunit-next/kunit (6fe1ad4a1560 kunit: tool: remove redundant file.c=
lose() call in unit test)
CONFLICT (content): Merge conflict in lib/kunit/string-stream.c
Merging trivial/for-next (081c8919b02b Documentation: remove trivial tree)
Merging mhi/mhi-next (1d96c542b291 MAINTAINERS: Remove Hemant from MHI bus)
Merging memblock/for-next (3f82c9c4ac37 memblock: don't run loop in membloc=
k_add_range() twice)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging cxl/next (9abf2313adc1 Linux 6.1-rc1)
Merging folio-iomap/folio-iomap (4d7bd0eb72e5 iomap: Inline __iomap_zero_it=
er into its caller)
Merging zstd/zstd-next (2aa14b1ab2c4 zstd: import usptream v1.5.2)
Merging efi/next (27e80a1f89b1 efi: libstub: Merge zboot decompressor with =
the ordinary stub)
Merging unicode/for-next (b500d6d7243d unicode: Handle memory allocation fa=
ilures in mkutf8data)
Merging slab/for-next (e2dfb9b5b87a Merge branch 'slab/for-6.2/cleanups' in=
to slab/for-next)
Merging random/master (4f73364441a8 random: modernize documentation comment=
 on get_random_bytes())
Merging landlock/next (4bc90a766ea5 Merge branch 'landlock-test-build-fix' =
into landlock-next)
Merging rust/rust-next (fd9517a1603f init/Kconfig: Specify the interpreter =
for rust_is_available.sh)
Merging sysctl/sysctl-next (c06a17fe056b kernel/sysctl-test: use SYSCTL_{ZE=
RO/ONE_HUNDRED} instead of i_{zero/one_hundred})
Merging folio/for-next (03b33c09ea22 fs: remove the NULL get_block case in =
mpage_writepages)
CONFLICT (content): Merge conflict in include/linux/migrate.h
CONFLICT (content): Merge conflict in mm/migrate.c
CONFLICT (content): Merge conflict in mm/migrate_device.c
Merging execve/for-next/execve (ef20c5139c31 binfmt_elf: simplify error han=
dling in load_elf_phdrs())
Merging bitmap/bitmap-for-next (27bc50fc9064 Merge tag 'mm-stable-2022-10-0=
8' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm)
Merging hte/for-next (9abf2313adc1 Linux 6.1-rc1)
Merging kspp/for-next/kspp (4b21d25bf519 overflow: Introduce overflows_type=
() and castable_to_type())
Merging kspp-gustavo/for-next/kspp (0811296c55b7 exportfs: Replace zero-len=
gth array with DECLARE_FLEX_ARRAY() helper)
Merging unsigned-char/unsigned-char (97f7ffb41169 lib: assume char is unsig=
ned)
Merging iommufd/for-next (89e0f4e1f9d7 iommufd: Allow iommufd to supply /de=
v/vfio/vfio)
CONFLICT (content): Merge conflict in drivers/iommu/iommu.c
CONFLICT (content): Merge conflict in include/linux/iommu.h
$ git merge --abort
Merging mm-stable/mm-stable (30a0b95b1335 Linux 6.1-rc3)
Merging mm-nonmm-stable/mm-nonmm-stable (30a0b95b1335 Linux 6.1-rc3)
Merging mm/mm-everything (5c0099560d6f Merge branch 'mm-nonmm-unstable' int=
o mm-everything)
CONFLICT (content): Merge conflict in kernel/trace/fprobe.c
CONFLICT (content): Merge conflict in tools/testing/radix-tree/maple.c

--Sig_/bsZvFKk/avq6Yt+j7PtD.Bg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmNofwUACgkQAVBC80lX
0Gz5IAf/TOtBvpo1tQYGVraVmB1Spqfg51KrLrn7zyFlitXqkdycy5MSoL9n884J
jBif78uHt3ngAMGNQCYIfJL5THZ3zNA5lD29+J42xpzTq47clowmR2X8NXV9qsnI
HOA+9jDt2ik98JQZaDEfI8WjUUD4KUdxr/vDMJhAVYiEH1smfFL+Bb/ep0BxH1Zq
0EroRUoXYGa11JmdVSI0oHBIt4VZ7wr96BAToQ9lYKOwi0rwYZ+n7p3xtvGyFjvp
cGWBUYO2atQQTQTJANgD5DNpR/gu10dBpEZzXITkNReu2JNlzgT8zfAGy7YgkCR6
HpzKkMdPCTyL7EROmku6JFU10DAF6g==
=iy0e
-----END PGP SIGNATURE-----

--Sig_/bsZvFKk/avq6Yt+j7PtD.Bg--
