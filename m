Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 011F73EA0BB
	for <lists+linux-next@lfdr.de>; Thu, 12 Aug 2021 10:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235330AbhHLIj6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Aug 2021 04:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234826AbhHLIjs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Aug 2021 04:39:48 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60344C0613D3;
        Thu, 12 Aug 2021 01:39:22 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Glg8k6wB3z9sX5;
        Thu, 12 Aug 2021 18:39:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628757559;
        bh=653Z5erRwESverq58LC8CxIxbzN4IFz8l+mw2YZl1ng=;
        h=Date:From:To:Cc:Subject:From;
        b=b9p9c4xhdC/9MILh8Ts/vH47LnZ/bNahj2F+t9YxmEPH2G6YzvWq3CycAA1RUfl0Y
         ZUDdyC7ZTLRGekA/NpB7jeWn38va1sHLwIDDAqmRaN5NYTr6tHuoLGtlBep7eIl9Cc
         JgGiopt9806a7vtszxTsQ2hWMeXy5gcf6ACJvbYzyCCm8Ma9qvYKgD8ur6+5vWXRIz
         wDronKfh3q2abTwUi9ukYh/17434t5xMyvZOOTLPSABljwcufpKtBXHbaK+MEI0ptf
         9AaIL0OCS9dXE/ZO5Ycowwdb4nVxZ8SMgRsqF91yjICQ/EttQZ55GlL7yGN4TPdRCa
         eAn5wvbR1lVlg==
Date:   Thu, 12 Aug 2021 18:39:17 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 12
Message-ID: <20210812183917.0428a844@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qYMlM23RxenjLfhepV0oJ9d";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qYMlM23RxenjLfhepV0oJ9d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210811:

The net-next still had its build failure for which I applied a patch.

The drm tree gained a conflict against Linus' tree.

The drm-intel tree gained a conflict against the drm tree.

The drm-msm tree gained a conflict against Linus' tree.

The kvm-arm tree gained a conflict against the arm64 tree.

Non-merge commits (relative to Linus' tree): 6805
 6737 files changed, 392726 insertions(+), 154960 deletions(-)

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

I am currently merging 333 trees (counting Linus' and 90 trees of bug
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
Merging origin/master (761c6d7ec820 Merge tag 'arc-5.14-rc6' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/vgupta/arc)
Merging fixes/fixes (614124bea77e Linux 5.13-rc5)
Merging kbuild-current/fixes (36a21d51725a Linux 5.14-rc5)
Merging arc-current/for-curr (669d94219d91 MAINTAINERS: update Vineet's ema=
il address)
Merging arm-current/fixes (463dbba4d189 ARM: 9104/2: Fix Keystone 2 kernel =
mapping regression)
Merging arm64-fixes/for-next/fixes (017f5fb9ce79 arm64: clean vdso & vdso32=
 files)
Merging arm-soc-fixes/arm/fixes (19c1eb3605a1 Merge tag 'omap-for-v5.14/fix=
es-rc5-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linu=
x-omap into arm/fixes)
Merging drivers-memory-fixes/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging m68k-current/for-linus (21ed49265986 m68k: MAC should select HAVE_P=
ATA_PLATFORM)
Merging powerpc-fixes/fixes (43e8f7600659 powerpc/kprobes: Fix kprobe Oops =
happens in booke)
Merging s390-fixes/fixes (ecd92e2167c3 s390: update defconfigs)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (0271824d9ebe MAINTAINERS: switch to my OMP email for Re=
nesas Ethernet drivers)
Merging bpf/master (2d3a1e3615c5 bpf: Add rcu_read_lock in bpf_get_current_=
[ancestor_]cgroup_id() helpers)
Merging ipsec/master (480e93e12aa0 net: xfrm: Fix end of loop tests for lis=
t_for_each_entry)
Merging netfilter/master (e3245a7b7b34 netfilter: nft_ct: protect nft_ct_pc=
pu_template_refcnt with mutex)
Merging ipvs/master (269fc69533de netfilter: nfnetlink_hook: translate inet=
 ingress to netdev)
Merging wireless-drivers/master (abf3d98dee7c mt76: fix enum type mismatch)
Merging mac80211/master (d09c548dbf3b net: sched: act_mirred: Reset ct info=
 when mirror/redirect skb)
Merging rdma-fixes/for-rc (2638a32348bb RDMA/iw_cxgb4: Fix refcount underfl=
ow while destroying cqs.)
Merging sound-current/for-linus (d07149aba2ef ALSA: hda/realtek: fix mute/m=
icmute LEDs for HP ProBook 650 G8 Notebook PC)
Merging sound-asoc-fixes/for-linus (f114f4be00e1 Merge remote-tracking bran=
ch 'asoc/for-5.14' into asoc-linus)
Merging regmap-fixes/for-linus (ff1176468d36 Linux 5.14-rc3)
Merging regulator-fixes/for-linus (25b549d69e17 Merge remote-tracking branc=
h 'regulator/for-5.14' into regulator-linus)
Merging spi-fixes/for-linus (36a21d51725a Linux 5.14-rc5)
Merging pci-current/for-linus (d5450c42cbc3 PCI: Increase D3 delay for AMD =
Renoir/Cezanne XHCI)
Merging driver-core.current/driver-core-linus (36a21d51725a Linux 5.14-rc5)
Merging tty.current/tty-linus (36a21d51725a Linux 5.14-rc5)
Merging usb.current/usb-linus (664cc971fb25 Revert "usb: dwc3: gadget: Use =
list_replace_init() before traversing lists")
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (8da0e55c7988 USB: serial: ftdi_sio: add=
 device ID for Auto-M3 OP-COM v2)
Merging usb-chipidea-fixes/for-usb-fixes (5df09c15bab9 usb: cdnsp: Fix the =
IMAN_IE_SET and IMAN_IE_CLEAR macro)
Merging phy/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging staging.current/staging-linus (a5056c0bc24f Merge tag 'iio-fixes-5.=
14a' of https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into stag=
ing-linus)
Merging iio-fixes/fixes-togreg (5afc1540f138 iio: adc: Fix incorrect exit o=
f for-loop)
Merging char-misc.current/char-misc-linus (36a21d51725a Linux 5.14-rc5)
Merging soundwire-fixes/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging thunderbolt-fixes/fixes (36a21d51725a Linux 5.14-rc5)
Merging input-current/for-linus (818b26588994 Merge branch 'next' into for-=
linus)
Merging crypto-current/master (66192b2e3fd8 crypto: hisilicon/sec - fix the=
 process of disabling sva prefetching)
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
Merging reset-fixes/reset/fixes (1435f82689e1 reset: RESET_MCHP_SPARX5 shou=
ld depend on ARCH_SPARX5)
Merging mips-fixes/mips-fixes (6aa32467299e MIPS: check return value of pgt=
able_pmd_page_ctor)
Merging at91-fixes/at91-fixes (6efb943b8616 Linux 5.13-rc1)
Merging omap-fixes/fixes (353b7a55dcaf Merge branch 'fixes-v5.14' into fixe=
s)
Merging kvm-fixes/master (d5aaad6f8342 KVM: x86/mmu: Fix per-cpu counter co=
rruption on 32-bit builds)
Merging kvms390-fixes/master (cd4220d23bf3 KVM: selftests: do not require 6=
4GB in set_memory_region_test)
Merging hwmon-fixes/hwmon (03726fd90f4b hwmon: sht4x: update Documentation =
for Malformed table)
Merging nvdimm-fixes/libnvdimm-fixes (96dcb97d0a40 Merge branch 'for-5.14/d=
ax' into libnvdimm-fixes)
Merging cxl-fixes/fixes (fae8817ae804 cxl/mem: Fix memory device capacity p=
robing)
Merging btrfs-fixes/next-fixes (f55767667ce4 Merge branch 'misc-5.14' into =
next-fixes)
Merging vfs-fixes/fixes (173e84953eaa fs: fix reporting supported extra fil=
e attributes for statx())
Merging dma-mapping-fixes/for-linus (18a3c5f7abfd Merge tag 'for_linus' of =
git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging i3c-fixes/i3c/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging drivers-x86-fixes/fixes (9d7b132e62e4 platform/x86: pcengines-apuv2=
: Add missing terminating entries to gpio-lookup tables)
Merging samsung-krzk-fixes/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging pinctrl-samsung-fixes/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging devicetree-fixes/dt/linus (50d8d7e19c43 dt-bindings: display: renes=
as,du: Make resets optional on R-Car H1)
Merging scsi-fixes/fixes (40d32727931c scsi: mpt3sas: Fix incorrectly assig=
ned error return and check)
Merging drm-fixes/drm-fixes (1648740b2e35 Merge tag 'mediatek-drm-fixes-5.1=
4' of https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux in=
to drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (d927ae73e1bd Merge tag 'gvt-f=
ixes-2021-08-10' of https://github.com/intel/gvt-linux into drm-intel-fixes)
Merging mmc-fixes/fixes (67b13f3e221e mmc: sdhci-msm: Update the software t=
imeout value for sdhc)
Merging rtc-fixes/rtc-fixes (bd33335aa93d rtc: cmos: Disable irq around dir=
ect invocation of cmos_interrupt())
Merging gnss-fixes/gnss-linus (e73f0f0ee754 Linux 5.14-rc1)
Merging hyperv-fixes/hyperv-fixes (f5a11c69b699 Revert "x86/hyperv: fix log=
ical processor creation")
Merging soc-fsl-fixes/fix (be7ecbd240b2 soc: fsl: qe: convert QE interrupt =
controller to platform_device)
Merging risc-v-fixes/fixes (867432bec1c6 Revert "riscv: Remove CONFIG_PHYS_=
RAM_BASE_FIXED")
Merging pidfd-fixes/fixes (03ba0fe4d09f file: simplify logic in __close_ran=
ge())
Merging fpga-fixes/fixes (277c0dd93bf7 fpga: machxo2-spi: Return an error o=
n failure)
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
Merging drm-misc-fixes/for-linux-next-fixes (bf33677a3c39 drm/meson: fix co=
lour distortion from HDR set during vendor u-boot)
Merging kspp-gustavo/for-next/kspp (cb163627e6d3 scsi: fas216: Fix fall-thr=
ough warning for Clang)
Merging kbuild/for-next (f12b034afeb3 scripts/Makefile.clang: default to LL=
VM_IAS=3D1)
Merging compiler-attributes/compiler-attributes (7ed012969bbc Compiler Attr=
ibutes: fix __has_attribute(__no_sanitize_coverage__) for GCC 4)
CONFLICT (content): Merge conflict in include/linux/compiler_attributes.h
Merging dma-mapping/for-next (d03c54419274 dma-mapping: disallow .map_sg op=
erations from returning zero on error)
Merging asm-generic/master (14462376858e Merge branch 'asm-generic-unaligne=
d' into asm-generic)
Merging arc/for-next (9799f1cac840 ARC: retire MMUv1 and MMUv2 support)
Merging arm/for-next (3e9a47a71364 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (92b5529ab76e Merge branch 'for-next/entry' int=
o for-next/core)
Merging arm-perf/for-next/perf (fd264b310579 arm64/perf: Replace '0xf' inst=
ances with ID_AA64DFR0_PMUVER_IMP_DEF)
Merging arm-soc/for-next (b37e897eb18e soc: document merges)
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (6285af2a2821 Merge tags 'amlogic-arm-configs-for-=
v5.15', 'amlogic-arm64-dt-for-v5.15' and 'amlogic-arm-dt-for-v5.15' into fo=
r-next)
Merging aspeed/for-next (dbc97765328a ARM: dts: aspeed-g5: Remove ngpios fr=
om sgpio node.)
Merging at91/at91-next (b102356e5bc1 Merge branch 'at91-dt' into at91-next)
Merging drivers-memory/for-next (c28b584deb1b Merge branch 'for-v5.15/omap-=
gpmc' into for-next)
Merging imx-mxs/for-next (503d1ac62829 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (cb293d3b430e Merge branch 'for_5.15/drivers-soc' int=
o next)
Merging mediatek/for-next (69862ae4e378 Merge branch 'v5.14-next/soc' into =
for-next)
Merging mvebu/for-next (69a91ff5e46c Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (8e921ff030ff Merge branch 'omap-for-v5.15/dt' into f=
or-next)
Merging qcom/for-next (57249830120b Merge remote-tracking branch 'refs/remo=
tes/origin/for-next' into for-next)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/qcom/msm8996.dtsi
Merging raspberrypi/for-next (b1f2fcb28228 ARM: dts: bcm283x: Fix VEC addre=
ss for BCM2711)
Merging renesas/next (3d3aec53bf89 Merge branch 'renesas-arm-dt-for-v5.15' =
into renesas-next)
Merging reset/reset/next (bee08559701f reset: renesas: Add RZ/G2L usbphy co=
ntrol driver)
Merging rockchip/for-next (7c5b22cf2d8e Merge branch 'v5.15-clk/next' into =
for-next)
Merging samsung-krzk/for-next (90861bf54255 Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (3c94441995dd Merge branch 'for-next/scmi' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging stm32/stm32-next (1e6bc5987a52 ARM: dts: stm32: Update AV96 adv7513=
 node per dtbs_check)
Merging sunxi/sunxi/for-next (3f1c53207cf0 Merge branches 'sunxi/dt-for-5.1=
4' and 'sunxi/fixes-for-5.13' into sunxi/for-next)
Merging tegra/for-next (5a1ab00454cc Merge branch for-5.15/soc into for-nex=
t)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (c1fa5ac6c2f4 arm64: dts: ti: k3-am642-sk: Add=
 pwm nodes)
Merging xilinx/for-next (4cddd9be7ef6 Merge branch 'zynq/soc' of https://gi=
thub.com/Xilinx/linux-xlnx into for-next)
Merging clk/clk-next (765f4fa0e9f1 Merge branch 'clk-qcom' into clk-next)
Merging clk-imx/for-next (fb3f4bca19b3 clk: imx: clk-divider-gate: Switch t=
o clk_divider.determine_rate)
Merging clk-renesas/renesas-clk (0dd74702c4bb clk: renesas: rzg2l: Add supp=
ort to handle MUX clocks)
Merging clk-samsung/for-next (a38fd8748464 Linux 5.12-rc2)
Merging csky/linux-next (90dc8c0e664e csky: Kconfig: Remove unused selects)
Merging h8300/h8300-next (6e5e55227c95 Merge tag 'v5.11' into h8300-next)
Merging m68k/for-next (2189e928b62e m68k: Fix invalid RMW_INSNS on CPUs tha=
t lack CAS)
Merging m68knommu/for-next (236716124cf8 m68knommu: only set CONFIG_ISA_DMA=
_API for ColdFire sub-arch)
Merging microblaze/next (14a832498c23 arch: microblaze: Fix spelling mistak=
e "vesion" -> "version")
Merging mips/mips-next (cb95ea79b3fc MIPS: locking/atomic: Fix atomic{_64,}=
_sub_if_positive)
Merging nds32/next (40e0dd851e7b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (94effcedaa54 openrisc: Fix compiler warnings in =
setup)
Merging parisc-hd/for-next (ca2b19a4bdb6 parisc: Increase gcc stack frame c=
heck to 2048 for 32- and 64-bit)
Merging powerpc/next (a6cae77f1bc8 powerpc/stacktrace: Include linux/delay.=
h)
Merging soc-fsl/next (242b0b398ccd soc: fsl: enable acpi support in RCPM dr=
iver)
Merging risc-v/for-next (9f2a5aebb03c dt-bindings: riscv: add starfive jh71=
00 bindings)
Merging s390/for-next (e6e9bca186a0 Merge branch 'features' into for-next)
Merging sh/for-next (2882b7626f49 sh: kernel: traps: remove unused variable)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (1aee020155f3 um: remove unneeded semicolon in um_ar=
ch.c)
Merging xtensa/xtensa-for-next (b843f03d0569 xtensa: ISS: don't use string =
pointer before NULL check)
Merging pidfd/for-next (c90b9d37d3ac Merge branch 'fs.idmapped' into for-ne=
xt)
Merging fscrypt/master (38ef66b05cfa fscrypt: document struct fscrypt_opera=
tions)
Merging fscache/fscache-next (5193f26aef59 fscache: Use refcount_t for the =
cookie refcount instead of atomic_t)
Merging afs/afs-next (7af08140979a Revert "gcov: clang: fix clang-11+ build=
")
Merging btrfs/for-next (06ad2ba8e658 Merge branch 'for-next-next-v5.14-2021=
0811' into for-next-20210811)
Merging ceph/master (8434ffe71c87 ceph: take snap_empty_lock atomically wit=
h snaprealm refcount change)
Merging cifs/for-next (0e632de32459 cifs: Call close synchronously during u=
nlink/rename/lease break.)
Merging cifsd/cifsd-for-next (456af438ad49 Merge pull request #64 from namj=
aejeon/cifsd-for-next)
Merging configfs/for-next (769f52676756 configfs: restore the kernel v5.13 =
text attribute write behavior)
Merging ecryptfs/next (682a8e2b41ef Merge tag 'ecryptfs-5.13-rc1-updates' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs)
Merging erofs/dev (771c994ea51f erofs: convert all uncompressed cases to io=
map)
Merging exfat/dev (50be9417e23a Merge tag 'io_uring-5.14-2021-07-09' of git=
://git.kernel.dk/linux-block)
Merging ext3/for_next (ca6e04e8f8d1 Pull udf cleanups and LVID check fix.)
Merging ext4/dev (877ba3f729fd ext4: fix potential htree corruption when gr=
owing large_dir directories)
Merging f2fs/dev (94afd6d6e525 f2fs: extent cache: support unaligned extent)
Applying: fxup for "f2fs: Convert to using invalidate_lock"
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (5d5b74aa9c76 fuse: allow sharing existing sb)
Merging gfs2/for-next (477448413342 gfs2: Remove redundant check from gfs2_=
glock_dq)
Merging jfs/jfs-next (5d299f44d765 jfs: Avoid field-overflowing memcpy())
Merging nfs/linux-next (2734d6c1b1a0 Linux 5.14-rc2)
Merging nfs-anna/linux-next (ca7d1d1a0b97 NFSv4.2: remove restriction of co=
py size for inter-server copy.)
Merging nfsd/nfsd-next (ab1016d39cc0 nfsd: fix NULL dereference in nfs3svc_=
encode_getaclres)
Merging cel/for-next (5312c4903d3f lockd: change the proc_handler for nsm_u=
se_hostnames)
Merging orangefs/for-next (0fdec1b3c9fb orangefs: fix orangefs df output.)
Merging overlayfs/overlayfs-next (1be620376fbb ovl: use kvalloc in xattr co=
py-up)
Merging ubifs/next (a801fcfeef96 ubifs: Set/Clear I_LINKABLE under i_lock f=
or whiteout inode)
Merging v9fs/9p-next (732b33d0dbf1 9p/xen: Fix end of loop tests for list_f=
or_each_entry)
Merging xfs/for-next (edf27485eb56 xfs: cleanup __FUNCTION__ usage)
Merging zonefs/for-next (95b115332a83 zonefs: remove redundant null bio che=
ck)
Merging iomap/iomap-for-next (ae44f9c286da iomap: Add another assertion to =
inline data handling)
Merging djw-vfs/vfs-for-next (d03ef4daf33a fs: forbid invalid project ID)
Merging file-locks/locks-next (e1cc6e8c1969 fcntl: fix potential deadlock f=
or &fasync_struct.fa_lock)
Merging vfs/for-next (303392fd5c16 Merge tag 'leds-5.14-rc1' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/pavel/linux-leds)
Merging printk/for-next (23d8adcf8022 Merge branch 'rework/printk_safe-remo=
val' into for-next)
Merging pci/next (bdb29f8679f1 Merge branch 'remotes/lorenzo/pci/tools')
Merging pstore/for-next/pstore (c5d4fb2539ca pstore/blk: Use "%lu" to forma=
t unsigned long)
Merging hid/for-next (e2e4893180f3 Merge branch 'for-5.14/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (32e8e4aeb37d Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i3c/i3c/next (3e5feb11a829 i3c: master: svc: fix doc warning in svc=
-i3c-master.c)
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (ae832e297be7 hwmon: (w83781d) Match on de=
vice tree compatibles)
Merging jc_docs/docs-next (0c3b533cfdd5 MAINTAINERS: add entry for traditio=
nal Chinese documentation)
Merging v4l-dvb/master (9c3a0f285248 Merge tag 'v5.14-rc4' into media_tree)
Merging v4l-dvb-next/master (5cc88747f90f media: tuners: mxl5007t: Removed =
unnecessary 'return')
Merging pm/linux-next (9ac32de19606 Merge branches 'pm-pci', 'powercap', 'p=
m-cpufreq' and 'pm-sleep' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (484f2b7c61b9 cpufreq: armada-37=
xx: forbid cpufreq for 1.2 GHz variant)
Merging cpupower/cpupower (5499f2b80b56 tools: cpupower: fix typo in cpupow=
er-idle-set(1) manpage)
Merging devfreq/devfreq-next (e73f0f0ee754 Linux 5.14-rc1)
Merging opp/opp/linux-next (4e3391c52983 dt-bindings: opp: Convert to DT sc=
hema)
Merging thermal/thermal/linux-next (fe6a6de6692e thermal/drivers/int340x/pr=
ocessor_thermal: Fix tcc setting)
Merging ieee1394/for-next (54b3bd99f094 firewire: nosy: switch from 'pci_' =
to 'dma_' API)
Merging dlm/next (62699b3f0a62 fs: dlm: move receive loop into receive hand=
ler)
Merging swiotlb/linux-next (a449ffaf9181 powerpc/svm: Don't issue ultracall=
s if !mem_encrypt_active())
Merging rdma/for-next (d2b10794fc13 RDMA/core: Create clean QP creations in=
terface for uverbs)
Merging net-next/master (6c4110d9f499 net: bridge: vlan: fix global vlan op=
tion range dumping)
CONFLICT (content): Merge conflict in kernel/bpf/helpers.c
CONFLICT (content): Merge conflict in include/linux/bpf-cgroup.h
CONFLICT (content): Merge conflict in drivers/net/ethernet/broadcom/bnxt/bn=
xt_ptp.h
CONFLICT (content): Merge conflict in MAINTAINERS
Applying: NET_VENDOR_CIRRUS is not ready for COMPILE_TEST
Merging bpf-next/for-next (25dc3895baaa selftests/bpf: Fix running of XDP b=
onding tests)
Merging ipsec-next/master (5d8dbb7fb82b net: xfrm: fix shift-out-of-bounce)
Merging mlx5-next/mlx5-next (598fe77df855 net/mlx5: Lag, Create shared FDB =
when in switchdev mode)
Merging netfilter-next/master (6f45933dfed0 Merge git://git.kernel.org/pub/=
scm/linux/kernel/git/pablo/nf-next)
Merging ipvs-next/master (9344988d2979 netfilter: ctnetlink: allow to filte=
r dump by status bits)
Merging wireless-drivers-next/master (d249ff28b1d8 intersil: remove obsolet=
e prism54 wireless driver)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging bluetooth/master (55981d354181 Bluetooth: btusb: check conditions b=
efore enabling USB ALT 3 for WBS)
CONFLICT (content): Merge conflict in net/bluetooth/hci_sysfs.c
CONFLICT (content): Merge conflict in net/bluetooth/hci_core.c
CONFLICT (content): Merge conflict in include/net/bluetooth/hci_core.h
Merging mac80211-next/master (2a2b6e3640c4 devlink: Fix port_type_set funct=
ion pointer check)
Merging mtd/mtd/next (b4675c64f932 mtdblock: Warn if the added for a NAND d=
evice)
Merging nand/nand/next (74a021a632b0 mtd: rawnand: remove never changed ret=
 variable)
Merging spi-nor/spi-nor/next (2734d6c1b1a0 Linux 5.14-rc2)
Merging crypto/master (0888d04b47a1 hwrng: Add Arm SMCCC TRNG based driver)
Merging drm/drm-next (cb22f12f3025 Merge tag 'drm-xilinx-dpsub-20210809' of=
 git://linuxtv.org/pinchartl/media into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_pci.c
CONFLICT (modify/delete): drivers/gpu/drm/i915/i915_globals.c deleted in dr=
m/drm-next and modified in HEAD. Version HEAD of drivers/gpu/drm/i915/i915_=
globals.c left in tree.
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_drv=
.c
CONFLICT (content): Merge conflict in drivers/firmware/Makefile
$ git rm -f drivers/gpu/drm/i915/i915_globals.c
Merging drm-misc/for-linux-next (873601687598 drm/vmwgfx: Fix a 64bit regre=
ssion on svga3)
CONFLICT (content): Merge conflict in drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
Merging amdgpu/drm-next (bdeed369ffe9 drm/radeon: Add HD-audio component no=
tifier support (v2))
Merging drm-intel/for-linux-next (c5589bb5dccb drm/i915: Only access SFC_DO=
NE when media domain is not fused off)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_device_inf=
o.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_device_inf=
o.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_drv.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_di=
splay.c
Merging drm-tegra/drm/tegra/for-next (ef531d01663a drm/tegra: Bump driver v=
ersion)
Merging drm-msm/msm-next (858c595a3f5d drm/msm/dsi: add continuous clock su=
pport for 7nm PHY)
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/dp/dp_display.c
Merging imx-drm/imx-drm/next (59e4e762a17d gpu: ipu-v3: Fix i.MX IPU-v3 off=
set calculations for (semi)planar U/V formats)
Merging etnaviv/etnaviv/next (81fd23e2b3cc drm/etnaviv: Implement mmap as G=
EM object function)
Merging regmap/for-next (cc15156265f0 Merge remote-tracking branch 'regmap/=
for-5.15' into regmap-next)
Merging sound/for-next (ca4c5b334f10 ALSA: msnd: Use proper mmap method)
Merging sound-asoc/for-next (6b4b0c47bdfe Merge remote-tracking branch 'aso=
c/for-5.15' into asoc-next)
Merging modules/modules-next (ced75a2f5da7 MAINTAINERS: Add Luis Chamberlai=
n as modules maintainer)
Merging input/next (76ba1900cb67 dt-bindings: power: reset: qcom-pon: Conve=
rt qcom PON binding to yaml)
Merging block/for-next (e3762b624f00 Merge branch 'io_uring-bio-cache.4' in=
to for-next)
Merging device-mapper/for-next (5a2a33884f0b dm crypt: Avoid percpu_counter=
 spinlock contention in crypt_page_alloc())
Merging pcmcia/pcmcia-next (e39cdacf2f66 pcmcia: i82092: fix a null pointer=
 dereference bug)
Merging mmc/next (e004b8de7bf6 mmc: sdio: Print contents of unknown CIS tup=
les)
Merging mfd/for-mfd-next (9050ad816f52 mfd: db8500-prcmu: Handle missing FW=
 variant)
Merging backlight/for-backlight-next (1181f2164135 backlight: lm3630a: Conv=
ert to atomic PWM API and check for errors)
Merging battery/for-next (6ea0126631b0 power: supply: sbs-battery: add supp=
ort for time_to_empty_now attribute)
Merging regulator/for-next (4addb9a0c520 Merge remote-tracking branch 'regu=
lator/for-5.15' into regulator-next)
Merging security/next-testing (047843bdb316 Merge branch 'landlock_lsm_v34'=
 into next-testing)
Merging apparmor/apparmor-next (d108370c644b apparmor: fix error check)
Merging integrity/next-integrity (907a399de7b0 evm: Check xattr size discre=
pancy between kernel and user)
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
Merging tpmdd/next (b0e77c4a957e certs: Add support for using elliptic curv=
e keys for signing modules)
Merging watchdog/master (cf813c67d961 watchdog: iTCO_wdt: use dev_err() ins=
tead of pr_err())
Merging iommu/next (a9cb792c185a Merge branches 'iommu/fixes', 'apple/dart'=
, 'x86/amd' and 'core' into next)
Merging audit/next (d97e99386ad0 audit: add header protection to kernel/aud=
it.h)
Merging devicetree/for-next (4409273b818c of: fdt: do not update local vari=
able after use)
CONFLICT (modify/delete): Documentation/devicetree/bindings/arm/mediatek/me=
diatek,mmsys.txt deleted in devicetree/for-next and modified in HEAD. Versi=
on HEAD of Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.tx=
t left in tree.
$ git rm -f Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.t=
xt
Applying: dt-bindings: arm: mediatek: mmsys: fixup for conversion to yaml
Merging mailbox/mailbox-for-next (4f197188da66 MAINTAINERS: add entry for p=
olarfire soc mailbox)
Merging spi/for-next (e59fe7525a66 Merge remote-tracking branch 'spi/for-5.=
15' into spi-next)
Merging tip/auto-latest (1fd628c2ee3d Merge branch 'x86/irq')
Merging clockevents/timers/drivers/next (6f64c8159af9 clocksource/drivers/a=
rm_global_timer: Remove duplicated argument in arm_global_timer)
Merging edac/edac-for-next (767f4b620eda EDAC/mce_amd: Do not load edac_mce=
_amd module on guests)
Merging irqchip/irq/irqchip-next (00a2b7c75895 Merge branch irq/bitmap_zall=
oc into irq/irqchip-next)
Merging ftrace/for-next (7b40066c97ec tracepoint: Use rcu get state and con=
d sync for static call updates)
Merging rcu/rcu/next (7f331fc57eaf rcutorture: Don't cpuhp_remove_state() i=
f cpuhp_setup_state() failed)
Merging kvm/next (32bdc0198841 KVM: selftests: Move vcpu_args_set into perf=
_test_util)
Merging kvm-arm/next (ae280335cdb5 Merge branch kvm-arm64/mmu/el2-tracking =
into kvmarm-master/next)
CONFLICT (content): Merge conflict in arch/arm64/include/asm/sysreg.h
Merging kvm-ppc/kvm-ppc-next (72476aaa4691 KVM: PPC: Book3S HV: Fix host ra=
dix SLB optimisation with hash guests)
Merging kvms390/next (1f703d2cf204 KVM: s390: allow facility 192 (vector-pa=
cked-decimal-enhancement facility 2))
Merging xen-tip/linux-next (83f877a09516 xen/events: remove redundant initi=
alization of variable irq)
Merging percpu/for-next (a81a52b325ec Merge branch 'for-5.14-fixes' into fo=
r-next)
Merging workqueues/for-next (ffd8bea81fbb workqueue: Replace deprecated CPU=
-hotplug functions.)
Merging drivers-x86/for-next (0aa25a371f44 platform/x86/intel: int3472: Use=
 y instead of objs in Makefile)
Merging chrome-platform/for-next (e73f0f0ee754 Linux 5.14-rc1)
Merging hsi/for-next (e73f0f0ee754 Linux 5.14-rc1)
Merging leds/for-next (9cbc86109537 leds: lgm-sso: Propagate error codes fr=
om callee to caller)
Merging ipmi/for-next (f9714eb04364 ipmi: ssif_bmc: Return -EFAULT if copy_=
from_user() fails)
Merging driver-core/driver-core-next (bd935a7b2134 Merge 5.14-rc5 into driv=
er-core-next)
Applying: fix for "drm: Introduce the DP AUX bus"
Merging usb/usb-next (73e19de7b79a Merge 5.14-rc5 into usb-next)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/qcom/sc7280.dtsi
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/qcom/sc7280-idp.d=
ts
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (4e9340bb551a USB: serial: cp210x: determine fw=
 version for CP2105 and CP2108)
Merging usb-chipidea-next/for-usb-next (956df1bb0ab8 usb: chipidea: host: f=
ix port index underflow and UBSAN complains)
Merging tty/tty-next (15e580283f26 Merge 5.14-rc5 into tty-next)
Merging char-misc/char-misc-next (813272ed5238 Merge 5.14-rc5 into char-mis=
c-next)
Merging extcon/extcon-next (07de34f5ce1e extcon: max3355: Drop unused inclu=
de)
Merging phy-next/next (23fd679249df phy: qcom-qmp: add USB3 PHY support for=
 IPQ6018)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/phy=
/qcom,qmp-usb3-dp-phy.yaml
Merging soundwire/next (dd81e7c3f0bb soundwire: cadence: override PDI confi=
gurations to create loopback)
Merging thunderbolt/next (42716425ad7e thunderbolt: Fix port linking by che=
cking all adapters)
Merging vfio/next (eb24c1007e68 vfio: Remove struct vfio_device_ops open/re=
lease)
Merging staging/staging-next (25ee7e89d45d staging: rtl8192e: rtl_core: Fix=
 possible null-pointer dereference in _rtl92e_pci_disconnect())
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
Merging iio/togreg (6a25893cb0e2 iio: dac: max5821: convert device register=
 to device managed function)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (8bf5d31c4f06 interconnect: qcom: osm-l3: Use driver-s=
pecific naming)
Merging dmaengine/next (9760383b22ed Merge tag 'v5.14-rc5' into next)
Merging cgroup/for-next (047298a083a0 Merge branch 'for-5.15' into for-next)
Merging scsi/for-next (394a5f529e59 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (bd19573e05f6 scsi: qla2xxx: Update version to 10=
.02.06.100-k)
Merging vhost/linux-next (879753c816db vdpa/mlx5: Fix queue type selection =
logic)
Merging rpmsg/for-next (c93ca5f21d93 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (e9a13babd69f MAINTAINERS: update gpio-zynq=
.yaml reference)
Merging gpio-intel/for-next (b390752191a6 gpiolib: Deduplicate forward decl=
aration in the consumer.h header)
Merging pinctrl/for-next (062206a7f611 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (2f658f7a3953 pinctrl: tigerlake: Fix GPIO m=
apping for newer version of software)
Merging pinctrl-renesas/renesas-pinctrl (824c2faeb88f pinctrl: renesas: Add=
 RZ/G2L pin and gpio controller driver)
Merging pinctrl-samsung/for-next (70115558ab02 pinctrl: samsung: Fix pinctr=
l bank pin count)
Merging pwm/for-next (f4a8e31ed84e pwm: ep93xx: Ensure configuring period a=
nd duty_cycle isn't wrongly skipped)
Merging userns/for-next (534471c614f8 Merge of ucount-fixes-for-5.14, and s=
iginfo-si_trapno-for-v5.15 for testing in linux-next)
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging kselftest/next (2734d6c1b1a0 Linux 5.14-rc2)
Merging livepatching/for-next (c150bbbb1731 Merge branch 'for-5.13/signal' =
into for-next)
Merging coresight/next (1efbcec2ef8c coresight: cti: Reduce scope for the v=
ariable =E2=80=9Ccs_fwnode=E2=80=9D in cti_plat_create_connection())
Merging rtc/rtc-next (b02c96464f44 rtc: move RTC_LIB_KUNIT_TEST to proper l=
ocation)
Merging nvdimm/libnvdimm-for-next (30c10d32152d Merge branch 'for-5.12/cxl'=
 into libnvdimm-for-next)
Merging at24/at24/for-next (658ae44345c1 dt-bindings: at24: add ON Semi CAT=
24C04 and CAT24C05)
Merging ntb/ntb-next (28293b6c68cd ntb: ntb_pingpong: remove redundant init=
ialization of variables msg_data and spad_data)
Merging seccomp/for-next/seccomp (b4d8a58f8dcf seccomp: Fix setting loaded =
filter count during TSYNC)
Merging kspp/for-next/kspp (b88972649fa0 lib/test_stackinit: Add assigned i=
nitializers)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (0f79ce970e79 gnss: drop stray semicolons)
Merging fsi/next (9ab1428dfe2c fsi/sbefifo: Fix reset timeout)
Merging slimbus/for-next (e5c578adcdd9 slimbus: ngd: reset dma setup during=
 runtime pm)
Merging nvmem/for-next (80c3356bea4e nvmem: nintendo-otp: Add new driver fo=
r the Wii and Wii U OTP)
Merging xarray/main (2c7e57a02708 idr test suite: Improve reporting from id=
r_find_test_1)
Merging hyperv/hyperv-next (7aff79e297ee Drivers: hv: Enable Hyper-V code t=
o be built on ARM64)
Merging auxdisplay/auxdisplay (24ebc044c72e auxdisplay: Replace symbolic pe=
rmissions with octal permissions)
Merging kgdb/kgdb/for-next (e868f0a3c4b9 kdb: Rename members of struct kdbt=
ab_t)
Merging hmm/hmm (fe07bfda2fb9 Linux 5.12-rc1)
Merging fpga/for-next (4f45f3404960 spi: spi-altera-dfl: support n5010 feat=
ure revision)
Merging kunit/test (e73f0f0ee754 Linux 5.14-rc1)
Merging cfi/cfi/next (ff1176468d36 Linux 5.14-rc3)
Merging kunit-next/kunit (2734d6c1b1a0 Linux 5.14-rc2)
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
Merging cxl/next (5b68705d1e63 cxl/pci: Simplify register setup)
Merging folio/for-next (5abf14e471d1 mm/filemap: Add FGP_STABLE)
CONFLICT (content): Merge conflict in mm/util.c
CONFLICT (content): Merge conflict in mm/rmap.c
CONFLICT (content): Merge conflict in mm/filemap.c
Merging akpm-current/current (688897753315 selftests/memfd: remove unused v=
ariable)
CONFLICT (content): Merge conflict in mm/page-writeback.c
CONFLICT (content): Merge conflict in mm/memcontrol.c
CONFLICT (content): Merge conflict in include/linux/sched.h
CONFLICT (content): Merge conflict in include/linux/mm.h
CONFLICT (content): Merge conflict in include/linux/memcontrol.h
Applying: move kvrealloc to slab.h as well
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (e8d60682cd38 arch: remove compat_alloc_user_space)

--Sig_/qYMlM23RxenjLfhepV0oJ9d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEU3jUACgkQAVBC80lX
0GwBwgf/WDjiR8SW9P2csaBi3rY6A1TzFQEAqxl4g3Z4RF5PaBKxR6yn27cszScg
GeqSwvOaTDxyaW3xpCj+08FGDYKZWsjZd/XO8Mjb6lOLaVg2xemhAaIRIhypY+Ux
tiwuPLjd5hpOABzUHJT8oBUBIYT+ytVBULnCkOOdPww9J2Tojwile7POb5MPAQOG
4U3aquXzIwfCWgLwxQL+OWn14CMMHTXTOeDythcqgU4fhrARYoTxhjJB2S8f9xlU
ZqxLwTS3ri5U2y/xkhU9BuXYRDNISIB9k4IuSsCV7blTgeQfVzCsRXadB6JlgSYV
GYLRp5G5JrvMAL06Q3OAxgh7flQEng==
=6aLf
-----END PGP SIGNATURE-----

--Sig_/qYMlM23RxenjLfhepV0oJ9d--
