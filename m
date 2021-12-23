Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC28147DFEE
	for <lists+linux-next@lfdr.de>; Thu, 23 Dec 2021 08:51:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347381AbhLWHuZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Dec 2021 02:50:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347767AbhLWHtz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Dec 2021 02:49:55 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9988EC061401;
        Wed, 22 Dec 2021 23:49:54 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4JKMmF3Xcyz4xn4;
        Thu, 23 Dec 2021 18:49:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1640245789;
        bh=ct2qAA81nSEShd7vOnid4IUbNvD4ZG1mCAVZOVm4y08=;
        h=Date:From:To:Cc:Subject:From;
        b=m9wjh46FxUIH0F34DPfeNznpCGjbbtkUk55sribxUBUKnr1RIm5vxKoC6jtebxajb
         s4SaYNjAm9nADEcwuGGfq4ggwZT25Ih3lzJ6fYdhejmcJ0vrw98YjttH7P1CpkrkIN
         96ALaACP4oTBFTxjCOTe04B654IiysfqJjZTYp8tS4skyGoUiihCXJqf9hXABmdeFb
         J4nCNq6tO9RdvnXgGLLVPcgvds/rsC8De0o8A87iNXZu2YOjy77V6a6jTZySR5DvtJ
         Yz7NZIYhFdJpQJjMsuCD6eTKYMG0EVqjLxOrPrJc0Bu7sOWJdyT1rcCCuC/0gn8YHS
         EzNlkj1xE2vXg==
Date:   Thu, 23 Dec 2021 18:49:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Dec 23
Message-ID: <20211223184945.31bd4c70@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ft5oKNSA75PTMxXEU5GRO3l";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ft5oKNSA75PTMxXEU5GRO3l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

News: there will be no linux-next releases between Dec 25 and Jan 3
(inclusive).

Changes since 20211222:

The uml tree lost its build failure.

The nand tree gained a conflict against the drivers-memory tree.

The gpio-brgl tree lost its build failure.

Non-merge commits (relative to Linus' tree): 8546
 8825 files changed, 404519 insertions(+), 175410 deletions(-)

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

I am currently merging 348 trees (counting Linus' and 94 trees of bug
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
Merging origin/master (3f066e882bf1 Merge tag 'for-5.16/parisc-7' of git://=
git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux)
Merging fixes/fixes (d06c942efea4 Merge tag 'for_linus' of git://git.kernel=
.org/pub/scm/linux/kernel/git/mst/vhost)
Merging kbuild-current/fixes (e851dfae4371 Merge tag 'kgdb-5.16-rc1' of git=
://git.kernel.org/pub/scm/linux/kernel/git/danielt/linux)
Merging arc-current/for-curr (b9cac915c541 ARC: thread_info.h: correct two =
typos in a comment)
Merging arm-current/fixes (8536a5ef8860 ARM: 9169/1: entry: fix Thumb2 bug =
in iWMMXt exception handling)
Merging arm64-fixes/for-next/fixes (9c5d89bc1055 arm64: kexec: Fix missing =
error code 'ret' warning in load_other_segments())
Merging arm-soc-fixes/arm/fixes (7ad8b2fcb850 Merge tag 'imx-fixes-5.16-3' =
of git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fi=
xes)
Merging drivers-memory-fixes/fixes (8c5ba21c16bd memory: mtk-smi: Fix a nul=
l dereference for the ostd)
Merging tee-fixes/fixes (d58071a8a76d Linux 5.16-rc3)
Merging m68k-current/for-linus (8a3c0a74ae87 m68k: defconfig: Update defcon=
figs for v5.15-rc1)
Merging powerpc-fixes/fixes (8734b41b3efe powerpc/module_64: Fix livepatchi=
ng for RO modules)
Merging s390-fixes/fixes (85bf17b28f97 recordmcount.pl: look for jgnop inst=
ruction as well as bcrl on s390)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (80f6e3080bfc fs-verity: fix signed inte=
ger overflow with i_size near S64_MAX)
Merging net/master (99d7fbb5cedf net: ks8851: Check for error irq)
Merging bpf/master (819d11507f66 bpf, selftests: Fix spelling mistake "tain=
ed" -> "tainted")
Merging ipsec/master (68ac0f3810e7 xfrm: state and policy should fail if XF=
RMA_IF_ID 0)
Merging netfilter/master (8ca4090fec02 Merge git://git.kernel.org/pub/scm/l=
inux/kernel/git/pablo/nf)
Merging ipvs/master (a50e659b2a1b net: mvpp2: fix XDP rx queues registering)
Merging wireless-drivers/master (f7d55d2e439f mt76: mt7921: fix build regre=
ssion)
Merging mac80211/master (60ec7fcfe768 qlcnic: potential dereference null po=
inter of rx_queue->page_ring)
Merging rdma-fixes/for-rc (12d3bbdd6bd2 RDMA/hns: Replace kfree() with kvfr=
ee())
Merging sound-current/for-linus (edca7cc4b0ac ALSA: hda/realtek: Fix quirk =
for Clevo NJ51CU)
Merging sound-asoc-fixes/for-linus (605aae16c5e2 Merge remote-tracking bran=
ch 'asoc/for-5.15' into asoc-linus)
Merging regmap-fixes/for-linus (459e1cd0d5ec Merge remote-tracking branch '=
regmap/for-5.15' into regmap-linus)
Merging regulator-fixes/for-linus (85223d609c99 regulator: dt-bindings: sam=
sung,s5m8767: add missing op_mode to bucks)
Merging spi-fixes/for-linus (2de2ef08a53d Merge remote-tracking branch 'spi=
/for-5.15' into spi-linus)
Merging pci-current/for-linus (87620512681a PCI: apple: Fix PERST# polarity)
Merging driver-core.current/driver-core-linus (136057256686 Linux 5.16-rc2)
Merging tty.current/tty-linus (a7904a538933 Linux 5.16-rc6)
Merging usb.current/usb-linus (3f345e907a8e usb: typec: ucsi: Only check th=
e contract if there is a connection)
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (a7904a538933 Linux 5.16-rc6)
Merging usb-chipidea-fixes/for-usb-fixes (f130d08a8d79 usb: chipidea: ci_hd=
rc_imx: Also search for 'phys' phandle)
CONFLICT (content): Merge conflict in drivers/usb/chipidea/ci_hdrc_imx.c
Merging phy/fixes (f0ae8685b285 phy: HiSilicon: Fix copy and paste bug in e=
rror handling)
Merging staging.current/staging-linus (d58071a8a76d Linux 5.16-rc3)
Merging iio-fixes/fixes-togreg (8f80931a3a4d iio: adc: ti-adc081c: Partial =
revert of removal of ACPI IDs)
Merging char-misc.current/char-misc-linus (3a0152b21952 nitro_enclaves: Use=
 get_user_pages_unlocked() call to handle mmap assert)
Merging soundwire-fixes/fixes (fa55b7dcdc43 Linux 5.16-rc1)
Merging thunderbolt-fixes/fixes (a7904a538933 Linux 5.16-rc6)
Merging input-current/for-linus (4ebfee2bbc1a Input: elants_i2c - do not ch=
eck Remark ID on eKTH3900/eKTH5312)
Merging crypto-current/master (27750a315aba crypto: qat - do not handle PFV=
F sources for qat_4xxx)
Merging vfio-fixes/for-linus (8704e8934908 vfio/pci: Fix OpRegion read)
Merging kselftest-fixes/fixes (fa55b7dcdc43 Linux 5.16-rc1)
Merging modules-fixes/modules-linus (2a987e65025e Merge tag 'perf-tools-fix=
es-for-v5.16-2021-12-07' of git://git.kernel.org/pub/scm/linux/kernel/git/a=
cme/linux)
Merging dmaengine-fixes/fixes (822c9f2b833c dmaengine: st_fdma: fix MODULE_=
ALIAS)
Merging backlight-fixes/for-backlight-fixes (a38fd8748464 Linux 5.12-rc2)
Merging mtd-fixes/mtd/fixes (27a030e87292 mtd: dataflash: Add device-tree S=
PI IDs)
Merging mfd-fixes/for-mfd-fixes (a61f4661fba4 mfd: intel_quark_i2c_gpio: Re=
vert "Constify static struct resources")
Merging v4l-dvb-fixes/fixes (d40f0b133b44 media: meson-ir-tx: remove incorr=
ect doc comment)
Merging reset-fixes/reset/fixes (92c959bae2e5 reset: renesas: Fix Runtime P=
M usage)
Merging mips-fixes/mips-fixes (09d97da660ff MIPS: Only define pci_remap_ios=
pace() for Ralink)
Merging at91-fixes/at91-fixes (fa55b7dcdc43 Linux 5.16-rc1)
Merging omap-fixes/fixes (80d680fdccba ARM: dts: omap3430-sdp: Fix NAND dev=
ice node)
Merging kvm-fixes/master (fdba608f15e2 KVM: VMX: Wake vCPU when delivering =
posted IRQ even if vCPU =3D=3D this vCPU)
Merging kvms390-fixes/master (0e9ff65f455d KVM: s390: preserve deliverable_=
mask in __airqs_kick_single_vcpu)
Merging hwmon-fixes/hwmon (cdc5287acad9 hwmon: (lm90) Do not report 'busy' =
status bit as alarm)
Merging nvdimm-fixes/libnvdimm-fixes (3dd60fb9d95d nvdimm/pmem: stop using =
q_usage_count as external pgmap refcount)
Merging cxl-fixes/fixes (fae8817ae804 cxl/mem: Fix memory device capacity p=
robing)
Merging btrfs-fixes/next-fixes (c748b846dab6 Merge branch 'misc-5.16' into =
next-fixes)
Merging vfs-fixes/fixes (25f54d08f12f autofs: fix wait name hash calculatio=
n in autofs_wait())
Merging dma-mapping-fixes/for-linus (18a3c5f7abfd Merge tag 'for_linus' of =
git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging i3c-fixes/i3c/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging drivers-x86-fixes/fixes (eb66fb03a727 platform/x86: apple-gmux: use=
 resource_size() with res)
Merging samsung-krzk-fixes/fixes (4f5d06d381ba arm64: dts: exynos: drop sam=
sung,ufs-shareability-reg-offset in ExynosAutov9)
Merging pinctrl-samsung-fixes/fixes (fa55b7dcdc43 Linux 5.16-rc1)
Merging devicetree-fixes/dt/linus (b398123bff3b efi: apply memblock cap aft=
er memblock_add())
Merging scsi-fixes/fixes (9020be114a47 scsi: lpfc: Terminate string in lpfc=
_debugfs_nvmeio_trc_write())
Merging drm-fixes/drm-fixes (a2fbfd517117 Merge tag 'amd-drm-fixes-5.16-202=
1-12-15' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (7807bf28fe02 drm/i915/guc: On=
ly assign guc_id.id when stealing guc_id)
Merging mmc-fixes/fixes (ff31ee0a0f47 mmc: mmci: stm32: clear DLYB_CR after=
 sending tuning command)
Merging rtc-fixes/rtc-fixes (bd33335aa93d rtc: cmos: Disable irq around dir=
ect invocation of cmos_interrupt())
Merging gnss-fixes/gnss-linus (136057256686 Linux 5.16-rc2)
Merging hyperv-fixes/hyperv-fixes (1dc2f2b81a6a hv: utils: add PTP_1588_CLO=
CK to Kconfig to fix build)
Merging soc-fsl-fixes/fix (7e5e744183bb soc: fsl: dpio: fix qbman alignment=
 error in the virtualization context)
Merging risc-v-fixes/fixes (f6f7fbb89bf8 riscv: dts: sifive unmatched: Link=
 the tmp451 with its power supply)
Merging pidfd-fixes/fixes (03ba0fe4d09f file: simplify logic in __close_ran=
ge())
Merging fpga-fixes/fixes (8bb7eca972ad Linux 5.15)
Merging spdx/spdx-linus (bc128349588d LICENSES/LGPL-2.1: Add LGPL-2.1-or-la=
ter as valid identifiers)
Merging gpio-brgl-fixes/gpio/for-current (3e4d9a485029 gpio: virtio: remove=
 timeout)
Merging gpio-intel-fixes/fixes (fa55b7dcdc43 Linux 5.16-rc1)
Merging pinctrl-intel-fixes/fixes (fa55b7dcdc43 Linux 5.16-rc1)
Merging erofs-fixes/fixes (57bbeacdbee7 erofs: fix deadlock when shrink ero=
fs slab)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (fa55b7dcdc43 Linux 5.16-rc1)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (d7f55471db27 memblock: fix memblock_phys_allo=
c() section mismatch error)
Merging cel-fixes/for-rc (53b1119a6e50 NFSD: Fix READDIR buffer overflow)
Merging irqchip-fixes/irq/irqchip-fixes (c3fbab7767c5 irqchip/irq-bcm7120-l=
2: Add put_device() after of_find_device_by_node())
Merging renesas-fixes/fixes (432b52eea3dc ARM: shmobile: defconfig: Restore=
 graphical consoles)
Merging perf-current/perf/urgent (c271a55b0c60 perf inject: Fix segfault du=
e to perf_data__fd() without open)
Merging efi-fixes/urgent (4bc5e64e6cf3 efi: Move efifb_setup_from_dmi() pro=
totype from arch headers)
Merging zstd-fixes/zstd-linus (d58071a8a76d Linux 5.16-rc3)
Merging drm-misc-fixes/for-linux-next-fixes (67f74302f45d drm/nouveau: wait=
 for the exclusive fence after the shared ones v2)
Merging kbuild/for-next (4dc0759c563a init/Kconfig: Drop linker version che=
ck for LD_ORPHAN_WARN)
Merging perf/perf/core (b9f6fbb3b2c2 perf arm64: Inject missing frames when=
 using 'perf record --call-graph=3Dfp')
Merging compiler-attributes/compiler-attributes (7c00621dcaee compiler_type=
s: mark __compiletime_assert failure as __noreturn)
Merging dma-mapping/for-next (f857acfc457e lib/scatterlist: cleanup macros =
into static inline functions)
Merging asm-generic/master (733e417518a6 asm-generic/error-injection.h: fix=
 a spelling mistake, and a coding style issue)
Merging arc/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging arm/for-next (e00dd02c0e0f Merge branch 'devel-stable' into for-nex=
t)
Merging arm64/for-next/core (52d3ff9d3658 Merge branches 'for-next/misc', '=
for-next/cache-ops-dzp', 'for-next/stacktrace', 'for-next/xor-neon', 'for-n=
ext/kasan', 'for-next/armv8_7-fp', 'for-next/atomics', 'for-next/bti', 'for=
-next/sve', 'for-next/kselftest' and 'for-next/kcsan', remote-tracking bran=
ch 'arm64/for-next/perf' into for-next/core)
Merging arm-perf/for-next/perf (1609c22a8a09 Merge branch 'for-next/perf-cp=
u' into for-next/perf)
Merging arm-soc/for-next (134a2de4a6ff soc: document merges)
CONFLICT (content): Merge conflict in arch/arm/Kconfig
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (996b0777eaca Merge branch 'v5.17/dt64' into for-n=
ext)
Merging aspeed/for-next (a7e02e92755c Merge branches 'dt-for-v5.17', 'defco=
nfig-for-v5.17' and 'soc-for-v5.17' into for-next)
Merging at91/at91-next (9be3df0e718c Merge branch 'at91-defconfig' into at9=
1-next)
Merging drivers-memory/for-next (ff086e15d838 Merge branch 'for-v5.17/omap-=
gpmc' into for-next)
Merging imx-mxs/for-next (b95a3922f285 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (cb293d3b430e Merge branch 'for_5.15/drivers-soc' int=
o next)
Merging mediatek/for-next (ccf7b63aac3e Merge branch 'v5.16-next/dts64' int=
o for-next)
Merging mvebu/for-next (d835946fc3d8 Merge branch 'mvebu/dt' into mvebu/for=
-next)
Merging omap/for-next (61b6b9cfada4 Merge branch 'omap-for-v5.17/fixes-not-=
urgent' into for-next)
Merging qcom/for-next (e7f041d3df8b Merge branches 'arm64-defconfig-for-5.1=
7', 'arm64-for-5.17', 'clk-for-5.17', 'defconfig-for-5.17', 'drivers-for-5.=
17' and 'dts-for-5.17' into for-next)
CONFLICT (content): Merge conflict in arch/arm/configs/multi_v7_defconfig
Merging raspberrypi/for-next (c5915b53d4c2 dt-bindings: soc: bcm: Convert b=
rcm,bcm2835-vchiq to json-schema)
Merging renesas/next (743002730737 Merge branch 'renesas-arm-dt-for-v5.17' =
into renesas-next)
Merging reset/reset/next (89e7a6698fdd reset: uniphier-glue: Use devm_add_a=
ction_or_reset())
Merging rockchip/for-next (f3e71d41b8bf Merge branch 'v5.17-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (b1cbda0fc343 Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (a0708ab07633 Merge branch 'for-next/scmi' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging stm32/stm32-next (3ff0810ffc47 ARM: dts: stm32: Add Engicam i.Core =
STM32MP1 C.TOUCH 2.0 10.1" OF)
Merging sunxi/sunxi/for-next (1d21ba6546a5 Merge branch 'sunxi/dt-for-5.17'=
 into sunxi/for-next)
Merging tee/next (ce352be35ba0 Merge branch 'async_notif' into next)
Merging tegra/for-next (707b88674206 Merge branch for-5.17/arm/defconfig in=
to for-next)
Merging ti/ti-next (1c440bbc87ef Merge branch 'ti-k3-dts-next' into ti-next)
CONFLICT (add/add): Merge conflict in arch/arm64/boot/dts/ti/k3-j721s2.dtsi
CONFLICT (add/add): Merge conflict in arch/arm64/boot/dts/ti/k3-j721s2-som-=
p0.dtsi
CONFLICT (add/add): Merge conflict in arch/arm64/boot/dts/ti/k3-j721s2-comm=
on-proc-board.dts
Merging xilinx/for-next (2eb48e610ef7 Merge remote-tracking branch 'zynqmp/=
dt' into for-next)
Merging clk/clk-next (79ace752c9ea Merge branch 'clk-cleanup' into clk-next)
Merging clk-imx/for-next (9dd81021084f clk: imx8mp: Fix the parent clk of t=
he audio_root_clk)
Merging clk-renesas/renesas-clk (f0b62b0bbedc clk: renesas: r9a07g044: Add =
GPU clock and reset entries)
Merging clk-samsung/for-next (45bd8166a1d8 clk: samsung: Add initial Exynos=
7885 clock driver)
Merging csky/linux-next (a0793fdad9a1 csky: fix typo of fpu config macro)
Merging h8300/h8300-next (1ec10274d436 h8300: don't implement set_fs)
Merging m68k/for-next (376e3fdecb0d m68k: Enable memtest functionality)
Merging m68knommu/for-next (a7904a538933 Linux 5.16-rc6)
Merging microblaze/next (7b94b7f0ae24 microblaze: add const to of_device_id)
Merging mips/mips-next (18c7e03400ae MIPS: generic: enable SMP on SMVP syst=
ems)
Merging nds32/next (07cd7745c6f2 nds32/setup: remove unused memblock_region=
 variable in setup_memory())
CONFLICT (content): Merge conflict in arch/nds32/Kconfig
CONFLICT (content): Merge conflict in arch/nds32/Kbuild
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (433fe39f674d openrisc: Add clone3 ABI wrapper)
Merging parisc-hd/for-next (516dfb23398a parisc: Avoid calling faulthandler=
_disabled() twice)
Merging powerpc/next (18678591846d selftests/powerpc: skip tests for unavai=
lable mitigations.)
Merging soc-fsl/next (67a4fa80561f soc: fsl: Correct MAINTAINERS database (=
SOC))
Merging risc-v/for-next (dacef016c088 riscv: dts: enable more DA9063 functi=
ons for the SiFive HiFive Unmatched)
CONFLICT (content): Merge conflict in arch/riscv/boot/dts/sifive/hifive-unm=
atched-a00.dts
Merging s390/for-next (280267e26c02 Merge branch 'features' into for-next)
Merging sh/for-next (8518e694203d sh: pgtable-3level: Fix cast to pointer f=
rom integer of different size)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (db0dd9cee822 um: virtio_uml: Allow probing from dev=
icetree)
Merging xtensa/xtensa-for-next (bd47cdb78997 xtensa: move section symbols t=
o asm/sections.h)
Merging pidfd/for-next (317465bcc6f4 Merge branch 'fs.idmapped' into for-ne=
xt)
Merging fscrypt/master (b7e072f9b77f fscrypt: improve a few comments)
Merging fscache/fscache-next (b3dd4b499e6c fscache: Rewrite documentation)
CONFLICT (content): Merge conflict in fs/cifs/inode.c
CONFLICT (modify/delete): fs/cachefiles/bind.c deleted in fscache/fscache-n=
ext and modified in HEAD. Version HEAD of fs/cachefiles/bind.c left in tree.
$ git rm -f fs/cachefiles/bind.c
Applying: fix up for "fs: add is_idmapped_mnt() helper"
Merging afs/afs-next (52af7105eceb afs: Set mtime from the client for yfs c=
reate operations)
Merging btrfs/for-next (279373dee83e Fixup merge-to-merge conflict in lzo_c=
ompress_pages)
Merging ceph/master (fd84bfdddd16 ceph: fix up non-directory creation in SG=
ID directories)
Merging cifs/for-next (a7904a538933 Linux 5.16-rc6)
Merging configfs/for-next (c42dd069be8d configfs: fix a race in configfs_lo=
okup())
Merging ecryptfs/next (682a8e2b41ef Merge tag 'ecryptfs-5.13-rc1-updates' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs)
Merging erofs/dev (469407a3b5ed erofs: clean up erofs_map_blocks tracepoint=
s)
Merging exfat/dev (4b095fcf2d43 exfat: fix missing REQ_SYNC in exfat_update=
_bhs())
Merging ext3/for_next (5f0a61886e30 Pull Amir's FAN_RENAME and FAN_REPORT_T=
ARGET_FID support for fanotify.)
Merging ext4/dev (ba2e524d918a ext4: Remove unused match_table_t tokens)
Merging f2fs/dev (79516e4f8f45 f2fs: Simplify bool conversion)
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (073c3ab6ae01 Documentation/filesystem/dax: DAX on vi=
rtiofs)
Merging gfs2/for-next (9fc8bbcbb697 gfs2: dump inode object for iopen glock=
s)
Merging jfs/jfs-next (c48a14dca2cb JFS: fix memleak in jfs_mount)
Merging ksmbd/ksmbd-for-next (83912d6d55be ksmbd: disable SMB2_GLOBAL_CAP_E=
NCRYPTION for SMB 3.1.1)
Merging nfs/linux-next (064a91771f7a SUNRPC: use different lock keys for IN=
ET6 and LOCAL)
Merging nfs-anna/linux-next (9ee4f22580f0 nfs: nfs4clinet: check the return=
 value of kstrdup())
Merging nfsd/nfsd-next (2e3f00c5f29f nfsd: improve stateid access bitmask d=
ocumentation)
Merging cel/for-next (abd599feaf66 nfsd: Replace use of rwsem with errseq_t)
CONFLICT (content): Merge conflict in fs/nfsd/nfs4state.c
Merging ntfs3/master (52e00ea6b26e fs/ntfs3: Update valid size if -EIOCBQUE=
UED)
Merging orangefs/for-next (ac2c63757f4f orangefs: Fix sb refcount leak when=
 allocate sb info failed.)
Merging overlayfs/overlayfs-next (5b0a414d06c3 ovl: fix filattr copy-up fai=
lure)
Merging ubifs/next (9aaa6cc099f6 ubifs: Document sysfs nodes)
Merging v9fs/9p-next (a403e2bd0026 9p: only copy valid iattrs in 9P2000.L s=
etattr implementation)
Merging xfs/for-next (6ed6356b0771 xfs: prevent a WARN_ONCE() in xfs_ioc_at=
tr_list())
Merging zonefs/for-next (95b115332a83 zonefs: remove redundant null bio che=
ck)
Merging iomap/iomap-for-next (5ad448ce2976 iomap: iomap_read_inline_data cl=
eanup)
Merging djw-vfs/vfs-for-next (d03ef4daf33a fs: forbid invalid project ID)
Merging file-locks/locks-next (80d8e4d3f313 fs/locks: fix fcntl_getlk64/fcn=
tl_setlk64 stub prototypes)
Merging vfs/for-next (8f40da9494cf Merge branch 'misc.namei' into for-next)
Merging printk/for-next (09b7bafa9876 Merge branch 'for-5.17' into for-next)
Merging pci/next (770851f91de8 Merge branch 'pci/errors')
Merging pstore/for-next/pstore (a5d05b07961a pstore/ftrace: Allow immediate=
 recording)
Merging hid/for-next (b92c6c23f16d Merge branch 'for-5.16/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (da6c84e2ef39 Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i3c/i3c/next (3f43926f2712 i3c/master/mipi-i3c-hci: Fix a potential=
ly infinite loop in 'hci_dat_v1_get_index()')
Merging dmi/dmi-for-next (f97a2103f1a7 firmware: dmi: Move product_sku info=
 to the end of the modalias)
Merging hwmon-staging/hwmon-next (01b619f3c639 hwmon: (dell-smm) Pack the w=
hole smm_regs struct)
Merging jc_docs/docs-next (ddffdcce9caa docs/zh_CN: Add sched-design-CFS Ch=
inese translation)
Merging v4l-dvb/master (68b9bcc8a534 media: ipu3-cio2: Add support for inst=
antiating i2c-clients for VCMs)
Merging v4l-dvb-next/master (68b9bcc8a534 media: ipu3-cio2: Add support for=
 instantiating i2c-clients for VCMs)
Merging pm/linux-next (bd982f30deb7 Merge branches 'thermal-tools' and 'the=
rmal-int340x' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (8f5783ad9eb8 cpufreq: qcom-hw: =
Use optional irq API)
Merging cpupower/cpupower (79a0dc5530a9 tools: cpupower: fix typo in cpupow=
er-idle-set(1) manpage)
Merging devfreq/devfreq-next (4667431419e9 PM / devfreq: Reduce log severit=
y for informative message)
Merging opp/opp/linux-next (7ca81b690e59 dt-bindings: opp: Allow multi-word=
ed OPP entry name)
Merging thermal/thermal/linux-next (8ee1c0f6526c thermal/drivers/rz2gl: Add=
 error check for reset_control_deassert())
Merging ieee1394/for-next (54b3bd99f094 firewire: nosy: switch from 'pci_' =
to 'dma_' API)
Merging dlm/next (e4dc81ed5a80 fs: dlm: memory cache for lowcomms hotpath)
Merging rdma/for-next (c8f476da84ad Merge branch 'mlx5-next' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/mellanox/linux)
Merging net-next/master (62a3106697f3 net: broadcom: bcm4908enet: remove re=
dundant variable bytes)
CONFLICT (content): Merge conflict in include/net/sock.h
Merging bpf-next/for-next (1a1a0b0364ad bpftool: Enable line buffering for =
stdout)
Merging ipsec-next/master (ac1077e92825 net: xfrm: drop check of pols[0] fo=
r the second time)
Merging mlx5-next/mlx5-next (685b1afd7911 net/mlx5: Introduce log_max_curre=
nt_uc_list_wr_supported bit)
Merging netfilter-next/master (604ba230902d net: prestera: flower template =
support)
Merging ipvs-next/master (632cb151ca53 netfilter: ctnetlink: remove useless=
 type conversion to bool)
Merging wireless-drivers-next/master (d430dffbe9dd mt76: mt7921: fix a poss=
ible race enabling/disabling runtime-pm)
Merging bluetooth/master (cfb4c313be67 Bluetooth: vhci: Set HCI_QUIRK_VALID=
_LE_STATES)
Merging mac80211-next/master (294e70c952b4 Merge tag 'mac80211-next-for-net=
-next-2021-12-21' of git://git.kernel.org/pub/scm/linux/kernel/git/jberg/ma=
c80211-next)
Merging mtd/mtd/next (6420ac0af95d mtdchar: prevent unbounded allocation in=
 MEMWRITE ioctl)
Merging nand/nand/next (ecb78b290bb5 mtd: rawnand: gpmi: Use platform_get_i=
rq_byname() to get the interrupt)
CONFLICT (content): Merge conflict in drivers/mtd/nand/raw/omap2.c
Applying: fixup for "memory: omap-gpmc: Use a compatible match table when c=
hecking for NAND controller"
Merging spi-nor/spi-nor/next (22bfe94528d7 mtd: spi-nor: issi: is25lp256: I=
nit flash based on SFDP)
Merging crypto/master (696645d25baf crypto: hisilicon/qm - disable queue wh=
en 'CQ' error)
CONFLICT (content): Merge conflict in drivers/crypto/qat/qat_4xxx/adf_4xxx_=
hw_data.c
Merging drm/drm-next (1c405ca11bf5 Merge tag 'mediatek-drm-next-5.17' of ht=
tps://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux into drm-n=
ext)
CONFLICT (content): Merge conflict in drivers/gpu/drm/nouveau/nouveau_fence=
.c
Merging drm-misc/for-linux-next (5da8b49de472 dt-bindings: display: bridge:=
 lvds-codec: Fix duplicate key)
Merging amdgpu/drm-next (c8f56d6d0eaa drm/amdgpu: bump driver version for n=
ew CTX OP to set/get stable pstates)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dc.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/nv.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_vcn=
.c
Applying: fix up for "drm/amdgpu: cancel the correct hrtimer on exit"
Merging drm-intel/for-linux-next (1c405ca11bf5 Merge tag 'mediatek-drm-next=
-5.17' of https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linu=
x into drm-next)
Merging drm-intel-gt/for-linux-next-gt (1c405ca11bf5 Merge tag 'mediatek-dr=
m-next-5.17' of https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.h=
u/linux into drm-next)
Merging drm-tegra/drm/tegra/for-next (d210919dbdc8 drm/tegra: Add back arm_=
iommu_detach_device())
Merging drm-msm/msm-next (f61550b3864b drm/msm/dp: dp_link_parse_sink_count=
() return immediately if aux read failed)
Merging imx-drm/imx-drm/next (20fbfc81e390 drm/imx: imx-tve: Make use of th=
e helper function devm_platform_ioremap_resource())
Merging etnaviv/etnaviv/next (6dfa2fab8ddd drm/etnaviv: limit submit sizes)
Merging regmap/for-next (02d6fdecb9c3 regmap: allow to define reg_update_bi=
ts for no bus configuration)
Merging sound/for-next (dec242b6a838 ALSA: gus: Fix memory leaks at memory =
allocator error paths)
Merging sound-asoc/for-next (37daf8d9e0bd ASoC: codecs: ak4375: Change inve=
rt controls to a stereo switch)
Merging modules/modules-next (d457f9e1ae29 MAINTAINERS: Remove myself as mo=
dules maintainer)
Merging input/next (652c0441de58 Input: byd - fix typo in a comment)
Merging block/for-next (c2b5446aa8b4 Merge branch 'for-5.17/io_uring-getden=
ts64' into for-next)
Merging device-mapper/for-next (1cef171abd39 dm integrity: fix data corrupt=
ion due to improper use of bvec_kmap_local)
Merging libata/for-next (4b03d96711ba libata: use min() to make code cleane=
r)
Merging pcmcia/pcmcia-next (e39cdacf2f66 pcmcia: i82092: fix a null pointer=
 dereference bug)
Merging mmc/next (585cba9d424e MAINTAINERS: Add i.MX sdhci maintainer)
Merging mfd/for-mfd-next (8ae4069acdee dt-bindings: mfd: Add Freecom system=
 controller)
Merging backlight/for-backlight-next (ec961cf32411 backlight: qcom-wled: Re=
spect enabled-strings in set_brightness)
Merging battery/for-next (9652c02428f3 power: bq25890: add POWER_SUPPLY_PRO=
P_TEMP)
Merging regulator/for-next (5d55cbc720cc regulator: dt-bindings: samsung,s5=
m8767: Move fixed string BUCK9 to 'properties')
Merging security/next-testing (047843bdb316 Merge branch 'landlock_lsm_v34'=
 into next-testing)
Merging apparmor/apparmor-next (fa55b7dcdc43 Linux 5.16-rc1)
Merging integrity/next-integrity (32ba540f3c2a evm: mark evm_fixmode as __r=
o_after_init)
Merging keys/keys-next (e377c31f788f integrity: Load mokx variables into th=
e blacklist keyring)
CONFLICT (content): Merge conflict in certs/system_keyring.c
Merging safesetid/safesetid-next (1b8b71922919 LSM: SafeSetID: Mark safeset=
id_initialized as __initdata)
Merging selinux/next (2e08df3c7c4e selinux: fix potential memleak in selinu=
x_add_opt())
Merging smack/next (0934ad42bb2c smackfs: use netlbl_cfg_cipsov4_del() for =
deleting cipso_v4_doi)
Merging tomoyo/master (f702e1107601 tomoyo: use hwight16() in tomoyo_domain=
_quota_is_ok())
Merging tpmdd/next (255c5267d5be tpm: Add Upgrade/Reduced mode support for =
TPM2 modules)
Merging watchdog/master (0fcfb00b28c0 Linux 5.16-rc4)
Merging iommu/next (e77bd369ce46 Merge branches 'arm/smmu', 'virtio', 'x86/=
amd', 'x86/vt-d' and 'core' into next)
Merging audit/next (ed98ea2128b6 audit: replace zero-length array with flex=
ible-array member)
Merging devicetree/for-next (07979f09a01e dt-bindings: arm,cci-400: Drop th=
e PL330 from example)
CONFLICT (content): Merge conflict in include/linux/of_fdt.h
Merging mailbox/mailbox-for-next (97961f78e8bc mailbox: imx: support i.MX8U=
LP S4 MU)
Merging spi/for-next (c70282457c38 spi: ar934x: fix transfer and word delay=
s)
Merging tip/auto-latest (ab57c081e4ce Merge branch into tip/master: 'core/e=
ntry')
CONFLICT (content): Merge conflict in arch/arm64/kernel/perf_callchain.c
Merging clockevents/timers/drivers/next (7647204c2e81 dt-bindings: timer: A=
dd Mstar MSC313e timer devicetree bindings documentation)
Merging edac/edac-for-next (b31351eada05 Merge branch 'edac-misc' into edac=
-for-next)
Merging irqchip/irq/irqchip-next (cd448b24c621 Merge branch irq/misc-5.17 i=
nto irq/irqchip-next)
Merging ftrace/for-next (a6ed2aee5464 tracing: Switch to kvfree_rcu() API)
Merging rcu/rcu/next (53c80bfc1eb1 rcutorture: Increase visibility of forwa=
rd-progress hangs)
Merging kvm/next (5e4e84f1124a Merge tag 'kvm-s390-next-5.17-1' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
CONFLICT (content): Merge conflict in arch/arm64/kvm/Makefile
CONFLICT (content): Merge conflict in arch/arm64/kvm/Kconfig
Merging kvm-arm/next (8a44f9f57770 Merge branch kvm-arm64/misc-5.17 into kv=
marm-master/next)
CONFLICT (content): Merge conflict in arch/arm64/kvm/arm.c
Merging kvms390/next (812de04661c4 KVM: s390: Clarify SIGP orders versus ST=
OP/RESTART)
Merging xen-tip/linux-next (bc3bfd76d55f xen/gntdev: fix unmap notification=
 order)
Merging percpu/for-next (4e1f82dce05b Merge branch 'for-5.16-fixes' into fo=
r-next)
Merging workqueues/for-next (7f224759dbdf Merge branch 'for-5.17' into for-=
next)
Merging drivers-x86/for-next (692562abcc6e platform/x86: hp_accel: Use SIMP=
LE_DEV_PM_OPS() for PM ops)
Merging chrome-platform/for-next (297d34e73d49 platform/chrome: cros_ec_pro=
to: Use ec_command for check_features)
Merging hsi/for-next (a1ee1c08fcd5 HSI: core: Fix return freed object in hs=
i_new_client)
Merging leds/for-next (d949edb503b1 leds: lp55xx: initialise output directi=
on from dts)
Merging ipmi/for-next (42e941eae9c0 ipmi: ssif: replace strlcpy with strscp=
y)
Merging driver-core/driver-core-next (79f1c7304295 kernfs: Replace kernel.h=
 with the necessary inclusions)
Merging usb/usb-next (ce1d37cb7697 usb: musb: dsps: Use platform_get_irq_by=
name() to get the interrupt)
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (2585cf9dfaad Linux 5.16-rc5)
Merging usb-chipidea-next/for-usb-next (78665f57c3fa usb: chipidea: udc: ma=
ke controller hardware endpoint primed)
Merging tty/tty-next (712fe4c84982 serial: sh-sci: Remove BREAK/FRAME/PARIT=
Y/OVERRUN printouts)
Merging char-misc/char-misc-next (1bb866dcb8cf Merge tag 'iio-for-5.17a' of=
 https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into char-misc-n=
ext)
Merging extcon/extcon-next (a7eb8e38bcd8 extcon: Deduplicate code in extcon=
_set_state_sync())
Merging phy-next/next (107ba9bf49c2 phy: qcom-qmp: Add SM8450 PCIe0 PHY sup=
port)
Merging soundwire/next (bb349fd2d580 soundwire: qcom: remove redundant vers=
ion number read)
Merging thunderbolt/next (e27830fbaf6a thunderbolt: Add module parameter fo=
r CLx disabling)
Merging vfio/next (2bed2ced40c9 vfio/iommu_type1: replace kfree with kvfree)
Merging staging/staging-next (144779edf598 staging: greybus: fix stack size=
 warning with UBSAN)
Merging iio/togreg (c9791a94384a iio: adc: ti-adc081c: Partial revert of re=
moval of ACPI IDs)
Merging mux/for-next (949354d5d49a mux: Fix struct mux_state kernel-doc com=
ment)
Merging icc/icc-next (01f8938ad036 Merge branch 'icc-qcm2290' into icc-next)
Merging dmaengine/next (2577394f4b01 Merge tag 'dmaengine_topic_slave_id_re=
moval_5.17' into next)
CONFLICT (content): Merge conflict in drivers/dma/idxd/submit.c
Merging cgroup/for-next (1815775e7454 cgroup: return early if it is already=
 on preloaded list)
Merging scsi/for-next (112e1f9af852 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (4be6181fea1d scsi: libsas: Decode SAM status and=
 host byte codes)
Merging vhost/linux-next (e2f504111891 vdpa: Mark vdpa_config_ops.get_vq_no=
tification as optional)
CONFLICT (content): Merge conflict in include/uapi/linux/virtio_iommu.h
CONFLICT (content): Merge conflict in drivers/iommu/virtio-iommu.c
Merging rpmsg/for-next (3cfae448f91e Merge branches 'rproc-next', 'rpmsg-ne=
xt' and 'hwspinlock-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (9804456e6067 gpio: Remove unused local OF =
node pointers)
CONFLICT (content): Merge conflict in tools/testing/selftests/gpio/Makefile
Merging gpio-intel/for-next (9d5f0f6644b1 gpio: sch: fix typo in a comment)
Merging gpio-sim/gpio/gpio-sim (0fcfb00b28c0 Linux 5.16-rc4)
Merging pinctrl/for-next (195acd15792a Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in drivers/pinctrl/Makefile
CONFLICT (content): Merge conflict in drivers/pinctrl/Kconfig
Merging pinctrl-intel/for-next (db1b2a8caf5b pinctrl: cherryview: Use tempo=
rary variable for struct device)
Merging pinctrl-renesas/renesas-pinctrl (ea7e26ebe6a9 pinctrl: renesas: r8a=
779a0: Align comments)
Merging pinctrl-samsung/for-next (16dd3bb5c190 pinctrl: samsung: Make symbo=
l 'exynos7885_pin_ctrl' static)
Merging pwm/for-next (3f0565451cc0 dt-bindings: pwm: Avoid selecting schema=
 on node name match)
Merging userns/for-next (3b17319c09f1 Merge of signal-for-v5.17, and ucount=
-rlimit-fixes-for-v5.16 for testing in linux-next)
CONFLICT (content): Merge conflict in fs/nfsd/nfssvc.c
Applying: fix up for "lockd: use svc_set_num_threads() for thread start and=
 stop"
Applying: fix up for "vhost: use user_worker to check RLIMITs"
Applying: fix 2 for "vhost: use user_worker to check RLIMITs"
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging kselftest/next (e89908201e25 selftests/vm: remove ARRAY_SIZE define=
 from individual tests)
Merging livepatching/for-next (cd2d68f2d6b2 Merge branch 'for-5.15/cpu-hotp=
lug' into for-next)
Merging coresight/next (efa56eddf5d5 coresight: core: Fix typo in a comment)
Merging rtc/rtc-next (cd17420ebea5 rtc: cmos: avoid UIP when writing alarm =
time)
Merging nvdimm/libnvdimm-for-next (7ac5360cd4d0 dax: remove the copy_from_i=
ter and copy_to_iter methods)
CONFLICT (content): Merge conflict in fs/ext4/super.c
Merging at24/at24/for-next (d08aea21c89d eeprom: at24: Add support for 24c1=
025 EEPROM)
Merging ntb/ntb-next (f96cb827ce49 ntb: ntb_pingpong: remove redundant init=
ialization of variables msg_data and spad_data)
Merging seccomp/for-next/seccomp (1e6d69c7b9cd selftests/seccomp: Report ev=
ent mismatches more clearly)
Merging kspp/for-next/kspp (136057256686 Linux 5.16-rc2)
Merging kspp-gustavo/for-next/kspp (64bc5a949ae1 Merge branch 'for-linus/ks=
pp' into for-next/kspp)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (547d2167c5c3 gnss: usb: add support for Sierra Wire=
less XM1210)
Merging fsi/next (7cc2f34e1f4d fsi: sbefifo: Use interruptible mutex lockin=
g)
Merging slimbus/for-next (fa55b7dcdc43 Linux 5.16-rc1)
Merging nvmem/for-next (779809c07324 dt-bindings: nvmem: Add missing 'reg' =
property)
Merging xarray/main (1c9f4b00b3cf XArray: Document the locking requirement =
for the xa_state)
Merging hyperv/hyperv-next (846da38de0e8 net: netvsc: Add Isolation VM supp=
ort for netvsc driver)
CONFLICT (content): Merge conflict in drivers/net/hyperv/netvsc.c
Merging auxdisplay/auxdisplay (4daa9ff89ef2 auxdisplay: charlcd: checking f=
or pointer reference before dereferencing)
Merging kgdb/kgdb/for-next (b77dbc86d604 kdb: Adopt scheduler's task classi=
fication)
Merging hmm/hmm (6880fa6c5660 Linux 5.15-rc1)
Merging fpga/for-next (98ceca2f2932 fpga: region: fix kernel-doc)
Merging kunit/test (fa55b7dcdc43 Linux 5.16-rc1)
Merging cfi/cfi/next (baaf965f9430 mtd: hyperbus: rpc-if: fix bug in rpcif_=
hb_remove)
Merging kunit-next/kunit (ad659ccb5412 kunit: tool: Default --jobs to numbe=
r of CPUs)
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mhi/mhi-next (00776ac534cc bus: mhi: pci_generic: Introduce Sierra =
EM919X support)
Merging memblock/for-next (e888fa7bb882 memblock: Check memory add/cap orde=
ring)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (e71ba9452f0b Linux 5.11-rc2)
Merging rust/rust-next (075c05e2eb5d [RFC] drivers: android: Binder IPC in =
Rust)
CONFLICT (modify/delete): tools/include/linux/lockdep.h deleted in HEAD and=
 modified in rust/rust-next. Version rust/rust-next of tools/include/linux/=
lockdep.h left in tree.
CONFLICT (content): Merge conflict in samples/Makefile
CONFLICT (content): Merge conflict in samples/Kconfig
CONFLICT (content): Merge conflict in Documentation/process/changes.rst
$ git rm -f tools/include/linux/lockdep.h
Merging cxl/next (53989fad1286 cxl/pmem: Fix module reload vs workqueue sta=
te)
Merging folio/for-next (3103f9a51dd0 mm: Use multi-index entries in the pag=
e cache)
CONFLICT (content): Merge conflict in mm/filemap.c
Merging folio-iomap/folio-iomap (4d7bd0eb72e5 iomap: Inline __iomap_zero_it=
er into its caller)
CONFLICT (content): Merge conflict in fs/iomap/buffered-io.c
Merging bitmap/bitmap-master-5.15 (785cb064e2f8 vsprintf: rework bitmap_lis=
t_string)
CONFLICT (content): Merge conflict in drivers/dma/ti/edma.c
CONFLICT (content): Merge conflict in arch/s390/kvm/kvm-s390.c
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/cputhreads.h
CONFLICT (content): Merge conflict in arch/parisc/include/asm/bitops.h
Merging zstd/zstd-next (fa55b7dcdc43 Linux 5.16-rc1)
Merging efi/next (21e42b00f779 efi/libstub: measure loaded initrd info into=
 the TPM)
Merging unicode/for-next (e2a58d2d3416 unicode: only export internal symbol=
s for the selftests)
CONFLICT (content): Merge conflict in fs/f2fs/sysfs.c
Merging slab/slab-next (07fda4f11e35 mm/slob: Remove unnecessary page_mapco=
unt_reset() function call)
Merging random/master (7273fd1f9af8 random: fix data race on crng init time)
Merging landlock/next (2585cf9dfaad Linux 5.16-rc5)
Merging akpm-current/current (2b8f69eda097 ubsan: remove CONFIG_UBSAN_OBJEC=
T_SIZE)
CONFLICT (content): Merge conflict in mm/zsmalloc.c
CONFLICT (content): Merge conflict in mm/memremap.c
CONFLICT (content): Merge conflict in kernel/kthread.c
CONFLICT (content): Merge conflict in include/linux/kthread.h
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (66e19854ac48 lib/stackdepot: always do filter_irq_stac=
ks() in stack_depot_save())

--Sig_/Ft5oKNSA75PTMxXEU5GRO3l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmHEKhkACgkQAVBC80lX
0GztUQgAje+OPvdJl+4lX1MA3CIdgs7oTnwkY71wBFp1PWiiGwFPNlFGIqjfKt9A
+GtOHI/K/JdKO+CBUyMXZgPQLoIOj2o8jxCxEWcNtTD7OR7DIoaam12DQ+08MD/p
Kg23PZFwJivzvKp+FEmaGKnLRxFRXVX1AXtm9RrA3n11OP9Ww8Gok4REzPDMhjnp
9r9h+yt2ZvOTeumBN479ExsisaurRrEUpPkidzElxaKVrpzm+GK6W7OBz01zBbSy
4BfcCQCIEKwww0LFKGcM13htg3BIuptneb6kejx+0NPoUKpHAP/fcD6hE4gU/81I
M/ZQilvk24R6b1c6wirW35hw0ZhfVQ==
=iJ1X
-----END PGP SIGNATURE-----

--Sig_/Ft5oKNSA75PTMxXEU5GRO3l--
