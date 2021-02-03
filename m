Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B90230D771
	for <lists+linux-next@lfdr.de>; Wed,  3 Feb 2021 11:27:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233845AbhBCK0m (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Feb 2021 05:26:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233640AbhBCK00 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Feb 2021 05:26:26 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A55CC061573;
        Wed,  3 Feb 2021 02:25:46 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DVyWC1gsTz9tkv;
        Wed,  3 Feb 2021 21:25:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612347943;
        bh=rJYtgydhFdygbz16LM8Hkf3p8FnTy4b46KXlf2lr0uQ=;
        h=Date:From:To:Cc:Subject:From;
        b=FyHLV6/eZ0jBWfdfw4Uofxca2ptwyNMUj9H5NTkMPsGI7codjzR1pw63MYQywgCpf
         kO6kQaURuaBnN/SFJtZ5k8XIk/dLOfPTMgvb0mIWDdXgCTFyzbT/XgVt6E7RT3nGtq
         EaxvOL27fHYu2dTveQmV5TA7hpC5Zoi/TwUMgl/rKCDKoHhuCRPBmGD+JKl2Mo7JEo
         0SIKKaw3oXKxNd0+KUOl31EExJHWA13HjoBRwhxCvJ79LMRW0pB3xSSkLUDcI0SDAS
         yvaYGPERXOvdRanQFYPxjpExJ3R0p7/+ld8ultPlKeL3OAZXtTV8C5TPpQJZTeY85J
         DxXUmLpPaYxrA==
Date:   Wed, 3 Feb 2021 21:25:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 3
Message-ID: <20210203212540.5601c17c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wa23hP+aG/4Izqz_esE9GS5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wa23hP+aG/4Izqz_esE9GS5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210202:

The drm-misc tree lost ts build failure.

The tip tree still had its boot failure so I reverted a commit.

Non-merge commits (relative to Linus' tree): 7462
 7837 files changed, 290817 insertions(+), 222309 deletions(-)

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

I am currently merging 333 trees (counting Linus' and 87 trees of bug
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
Merging origin/master (3aaf0a27ffc2 Merge tag 'clang-format-for-linux-v5.11=
-rc7' of git://github.com/ojeda/linux)
Merging fixes/fixes (e71ba9452f0b Linux 5.11-rc2)
Merging kbuild-current/fixes (245a7d47066a scripts: switch some more script=
s explicitly to Python 3)
Merging arc-current/for-curr (7c53f6b671f4 Linux 5.11-rc3)
Merging arm-current/fixes (199a427c3a3d ARM: ensure the signal page contain=
s defined contents)
Merging arm64-fixes/for-next/fixes (22cd5edb2d9c arm64: Use simpler arithme=
tics for the linear map macros)
Merging arm-soc-fixes/arm/fixes (62c31574cdb7 Merge tag 'imx-fixes-5.11-3' =
of git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fi=
xes)
Merging drivers-memory-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging m68k-current/for-linus (2ae92e8b9b7e MAINTAINERS: Update m68k Mac e=
ntry)
Merging powerpc-fixes/fixes (24321ac668e4 powerpc/64/signal: Fix regression=
 in __kernel_sigtramp_rt64() semantics)
Merging s390-fixes/fixes (e82080e1f456 s390: uv: Fix sysfs max number of VC=
PUs reporting)
Merging sparc/master (0a95a6d1a4cd sparc: use for_each_child_of_node() macr=
o)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (6c9f18f294c4 net: hsr: align sup_multicast_addr in stru=
ct hsr_priv to u16 boundary)
Merging bpf/master (06cc6e5dc659 Merge https://git.kernel.org/pub/scm/linux=
/kernel/git/bpf/bpf)
Merging ipsec/master (da64ae2d35d3 xfrm: Fix wraparound in xfrm_policy_addr=
_delta())
Merging netfilter/master (44a674d6f798 Merge tag 'mlx5-fixes-2021-01-26' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux)
Merging ipvs/master (44a674d6f798 Merge tag 'mlx5-fixes-2021-01-26' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/saeed/linux)
Merging wireless-drivers/master (93a1d4791c10 mt76: dma: fix a possible mem=
ory leak in mt76_add_fragment())
Merging mac80211/master (50af06d43eab staging: rtl8723bs: Move wiphy setup =
to after reading the regulatory settings from the chip)
Merging rdma-fixes/for-rc (1048ba83fb1c Linux 5.11-rc6)
Merging sound-current/for-linus (4841b8e6318a ALSA: hda/realtek: modify EAP=
D in the ALC886)
Merging sound-asoc-fixes/for-linus (e3966313d33b Merge remote-tracking bran=
ch 'asoc/for-5.11' into asoc-linus)
Merging regmap-fixes/for-linus (19c329f68089 Linux 5.11-rc4)
Merging regulator-fixes/for-linus (3462f030756a Merge remote-tracking branc=
h 'regulator/for-5.11' into regulator-linus)
Merging spi-fixes/for-linus (a22ed035b618 Merge remote-tracking branch 'spi=
/for-5.11' into spi-linus)
Merging pci-current/for-linus (7e69d07d7c3c Revert "PCI/ASPM: Save/restore =
L1SS Capability for suspend/resume")
Merging driver-core.current/driver-core-linus (6ee1d745b7c9 Linux 5.11-rc5)
Merging tty.current/tty-linus (6ee1d745b7c9 Linux 5.11-rc5)
Merging usb.current/usb-linus (a50ea34d6dd0 usb: xhci-mtk: break loop when =
find the endpoint to drop)
Merging usb-gadget-fixes/fixes (129aa9734559 usb: raw-gadget: fix memory le=
ak in gadget_setup)
Merging usb-serial-fixes/usb-linus (e478d6029dca USB: serial: option: Addin=
g support for Cinterion MV31)
Merging usb-chipidea-fixes/for-usb-fixes (491b1bea0004 MAINTAINERS: update =
Peter Chen's email address)
Merging phy/fixes (36acd5e24e30 phy: lantiq: rcu-usb2: wait after clock ena=
ble)
Merging staging.current/staging-linus (6ee1d745b7c9 Linux 5.11-rc5)
Merging char-misc.current/char-misc-linus (6ee1d745b7c9 Linux 5.11-rc5)
Merging soundwire-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging thunderbolt-fixes/fixes (4d395c5e7439 thunderbolt: Fix possible NUL=
L pointer dereference in tb_acpi_add_link())
Merging input-current/for-linus (9bbd77d5bbc9 Input: xpad - sync supported =
devices with fork on GitHub)
Merging crypto-current/master (4f6543f28bb0 crypto: marvel/cesa - Fix tdma =
descriptor on 64-bit)
Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer)
Merging vfio-fixes/for-linus (e4eccb853664 vfio/pci: Bypass IGD init in cas=
e of -ENODEV)
Merging kselftest-fixes/fixes (7a6eb7c34a78 selftests: Skip BPF seftests by=
 default)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging dmaengine-fixes/fixes (fed1b6a00a19 dmaengine: ti: k3-udma: Fix a r=
esource leak in an error handling path)
Merging backlight-fixes/for-backlight-fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging mtd-fixes/mtd/fixes (b135b3358d73 mtd: rawnand: omap: Use BCH priva=
te fields in the specific OOB layout)
Merging mfd-fixes/for-mfd-fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging v4l-dvb-fixes/fixes (ef357e02b6c4 media: rockchip: rkisp1: extend u=
api array sizes)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (7b490a8ab0f2 MIPS: OCTEON: fix unreachable c=
ode in octeon_irq_init_ciu)
Merging at91-fixes/at91-fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging omap-fixes/fixes (177d8f1f7f47 ARM: dts: omap4-droid4: Fix lost key=
pad slide interrupts for droid4)
Merging kvm-fixes/master (074489b77a37 Merge tag 'kvmarm-fixes-5.11-3' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvms390-fixes/master (735931f9a51a MAINTAINERS: add uv.c also to KV=
M/s390)
Merging hwmon-fixes/hwmon (4008bc7d3953 hwmon: (dell-smm) Add XPS 15 L502X =
to fan control blacklist)
Merging nvdimm-fixes/libnvdimm-fixes (50f558a5fe16 ndtest: Add papr health =
related flags)
Merging btrfs-fixes/next-fixes (8655ef25f7e5 Merge branch 'misc-5.11' into =
next-fixes)
Merging vfs-fixes/fixes (d36a1dd9f77a dump_common_audit_data(): fix racy ac=
cesses to ->d_name)
Merging dma-mapping-fixes/for-linus (d17405d52bac dma-mapping: benchmark: f=
ix kernel crash when dma_map_single fails)
Merging i3c-fixes/i3c/fixes (291b5c9870fc i3c/master/mipi-i3c-hci: Fix posi=
tion of __maybe_unused in i3c_hci_of_match)
Merging drivers-x86-fixes/fixes (215164bfb714 platform/x86: dell-wmi-sysman=
: fix a NULL pointer dereference)
Merging samsung-krzk-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging pinctrl-samsung-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging devicetree-fixes/dt/linus (32ada6b0980d dt-bindings: Cleanup standa=
rd unit properties)
Merging scsi-fixes/fixes (8c65830ae162 scsi: lpfc: Fix EEH encountering oop=
s with NVMe traffic)
Merging drm-fixes/drm-fixes (e0ecafede87e Merge tag 'amd-drm-fixes-5.11-202=
1-01-28' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (44c5bd08518c *** HAX FOR CI *=
** Revert "rtc: mc146818: Detect and handle broken RTCs")
Merging mmc-fixes/fixes (d7fb9c242095 mmc: sdhci-pltfm: Fix linking err for=
 sdhci-brcmstb)
Merging rtc-fixes/rtc-fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging gnss-fixes/gnss-linus (7c53f6b671f4 Linux 5.11-rc3)
Merging hyperv-fixes/hyperv-fixes (fff7b5e6ee63 x86/hyperv: Initialize cloc=
kevents after LAPIC is initialized)
Merging soc-fsl-fixes/fix (2663b3388551 soc: fsl: dpio: Get the cpumask thr=
ough cpumask_of(cpu))
Merging risc-v-fixes/fixes (336e8eb2a3cf riscv: Fixup pfn_valid error with =
wrong max_mapnr)
Merging pidfd-fixes/fixes (a409ed156a90 Merge tag 'gpio-v5.11-1' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio)
Merging fpga-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging spdx/spdx-linus (6ee1d745b7c9 Linux 5.11-rc5)
Merging gpio-brgl-fixes/gpio/for-current (c07ea8d0b170 gpio: gpiolib: remov=
e shadowed variable)
Merging gpio-intel-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging pinctrl-intel-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging erofs-fixes/fixes (a30573b3cdc7 erofs: fix setting up pcluster for =
temporary pages)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (2b8fdbbf1c61 kunit: tool: move kunitconfig=
 parsing into __init__, make it optional)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (17cbe03872be mm/memblock: Fix typo in comment=
 of memblock_phys_alloc_try_nid())
Merging cel-fixes/for-rc (bad4c6eb5eaa SUNRPC: Fix NFS READs that start at =
non-page-aligned offsets)
Merging drm-misc-fixes/for-linux-next-fixes (facd93f4285c drm/vc4: hvs: Fix=
 buffer overflow with the dlist handling)
Merging kspp-gustavo/for-next/kspp (36f9ff9e03de lib: Fix fall-through warn=
ings for Clang)
Merging kbuild/for-next (f405db04ba7f Kbuild: Make composite object searchi=
ng more generic)
Merging compiler-attributes/compiler-attributes (19c329f68089 Linux 5.11-rc=
4)
Merging dma-mapping/for-next (f726c72d6c05 dma-mapping: benchmark: check th=
e validity of dma mask bits)
Merging asm-generic/master (38489db09b10 Merge branch 'asm-generic-fixes' i=
nto asm-generic)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (d6bae7564ab1 Merge branch 'devel-stable' into for-nex=
t)
Merging arm64/for-next/core (fab0e5d091a7 Merge branches 'for-next/from-tip=
/irq/urgent', 'for-next/faultaround', 'for-next/kexec', 'for-next/misc', 'f=
or-next/perf', 'for-next/random', 'for-next/rng', 'for-next/selftests', 'fo=
r-next/stacktrace', 'for-next/topology' and 'for-next/vdso' into for-next/c=
ore)
Merging arm-perf/for-next/perf (f0c140481d1b perf: Constify static struct a=
ttribute_group)
Merging arm-soc/for-next (240bbedb75e7 soc: document merges)
CONFLICT (content): Merge conflict in arch/arm/Kconfig.debug
Merging actions/for-next (006828d706fd Merge branch 'v5.12/defconfig' into =
for-next)
Merging amlogic/for-next (35fe4b2c91ae Merge branch 'v5.12/soc' into tmp/am=
l-rebuild)
Merging aspeed/for-next (41707a524026 Merge branches 'soc-for-v5.11' and 'd=
efconfig-for-v5.11' into for-next)
Merging at91/at91-next (bcd7e8ebb203 Merge branch 'at91-soc' into at91-next)
Merging drivers-memory/for-next (50af93f1fe88 Merge branch 'for-v5.12/tegra=
-mc' into for-next)
Merging imx-mxs/for-next (7535d59c5f11 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (9d2e21ed98a2 Merge branch 'for_5.12/drivers-soc' int=
o next)
Merging mediatek/for-next (e6468af3b590 Merge branch 'v5.11-next/soc' into =
for-next)
Merging mvebu/for-next (8e03d45cb7de Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (1a2ddab3ec7a Merge branch 'omap-for-v5.12/defconfig'=
 into for-next)
Merging qcom/for-next (3e6a8ce09475 Merge branches 'arm64-defconfig-for-5.1=
2', 'arm64-for-5.12', 'defconfig-for-5.12', 'drivers-for-5.12' and 'dts-for=
-5.12' into for-next)
Merging raspberrypi/for-next (fbdcf1d20126 ARM: dts: bcm2711: Add the CEC i=
nterrupt controller)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (fc6f32116126 Merge branches 'renesas-arm-dt-for-v5.12=
' and 'renesas-drivers-for-v5.12' into renesas-next)
Merging reset/reset/next (d17655759b3f reset: Add devm_reset_control_get_op=
tional_exclusive_released())
Merging rockchip/for-next (3b7586d44766 Merge branch 'v5.11-armsoc/dtsfixes=
' into for-next)
Merging samsung-krzk/for-next (f9e152f18310 Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (6ee1d745b7c9 Linux 5.11-rc5)
Merging stm32/stm32-next (a9c92a9671d7 ARM: dts: stm32: add #clock-cells pr=
operty to usbphyc node on stm32mp151)
Merging sunxi/sunxi/for-next (a352e9e72aa3 Merge branch 'sunxi/dt-for-5.12-=
late' into sunxi/for-next)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun8i-reference-des=
ign-tablet.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun8i-r16-parrot.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun8i-r16-bananapi-=
m2m.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun8i-a33-sinlinx-s=
ina33.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun8i-a33-olinuxino=
.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun6i-reference-des=
ign-tablet.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun6i-a31s-yones-to=
ptech-bs1078-v2.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun6i-a31s-sinovoip=
-bpi-m2.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun6i-a31s-sina31s-=
core.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun6i-a31s-primo81.=
dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun6i-a31-mele-a100=
0g-quad.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun6i-a31-m9.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun6i-a31-hummingbi=
rd.dts
Merging tegra/for-next (b62f4a3fbb22 Merge branch for-5.12/arm64/defconfig =
into for-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (e37eac10bb5d Merge branch 'ti-k3-dts-next' in=
to ti-k3-next)
Merging clk/clk-next (6370ad6c0e83 Merge branch 'clk-fixes' into clk-next)
Merging clk-renesas/renesas-clk (24ece96554a9 clk: renesas: cpg-mssr: Fix f=
ormatting issues for 'smstpcr_saved's documentation)
Merging clk-samsung/for-next (44a9e78f9242 clk: samsung: Prevent potential =
endless loop in the PLL ops)
Merging csky/linux-next (9d986b01feb9 csky: use free_initmem_default() in f=
ree_initmem())
Merging h8300/h8300-next (8808515be0ed h8300: Replace <linux/clk-provider.h=
> by <linux/of_clk.h>)
Merging m68k/for-next (c396dd2ec5bb macintosh/adb-iop: Use big-endian autop=
oll mask)
Merging m68knommu/for-next (9b4b540089d0 m68k: let clk_enable() return imme=
diately if clk is NULL)
Merging microblaze/next (57ddf08642f0 microblaze: do not select TRACING_SUP=
PORT directly)
Merging mips/mips-next (198688edbf77 MIPS: Fix inline asm input/output type=
 mismatch in checksum.h used with Clang)
Merging nds32/next (54bde873682b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (6b57fa4d374b nios2: signal: Mark expected switch fa=
ll-through)
Merging openrisc/for-next (2261352157a9 Merge remote-tracking branch 'openr=
isc/or1k-5.11-fixes' into or1k-5.12-updates)
Merging parisc-hd/for-next (4add5f175b1e parisc: Optimize per-pagetable spi=
nlocks)
Merging powerpc/next (6895c5ba7bdc powerpc/xmon: Select CONSOLE_POLL for th=
e 8xx)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (e95f287deed2 soc: fsl: handle RCPM errata A-008646 on=
 SoC LS1021A)
Merging risc-v/for-next (36c3d86ac4e7 arch_numa: fix common code printing o=
f phys_addr_t)
CONFLICT (content): Merge conflict in drivers/soc/Makefile
CONFLICT (content): Merge conflict in drivers/soc/Kconfig
CONFLICT (content): Merge conflict in arch/arm64/mm/Makefile
Merging s390/for-next (58ccd7e11822 Merge branch 'features' into for-next)
Merging sh/for-next (b89bc060b53e sh/intc: Restore devm_ioremap() alignment)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (7f3414226b58 um: time: fix initialization in time-t=
ravel mode)
Merging xtensa/xtensa-for-next (7b79eba1d0d1 xtensa: fix spelling mistake i=
n Kconfig "wont" -> "won't")
Merging pidfd/for-next (f736d93d76d3 xfs: support idmapped mounts)
CONFLICT (content): Merge conflict in fs/ecryptfs/inode.c
Merging fscrypt/master (a14d0b676491 fscrypt: allow deleting files with uns=
upported encryption policy)
Merging fscache/fscache-next (12a86789cc2c afs: Fix error handling in afs_r=
eq_issue_op())
CONFLICT (content): Merge conflict in include/linux/fs.h
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (8b995f3511b7 Merge branch 'for-next-next-v5.11-2021=
0201' into for-next-20210201)
Merging ceph/master (9d5ae6f3c50a libceph: fix "Boolean result is used in b=
itwise operation" warning)
Merging cifs/for-next (e590c559e1eb smb3: negotiate current dialect (SMB3.1=
.1) when version 3 or greater requested)
Merging configfs/for-next (65cdb4a214c0 configfs: fix kernel-doc markup iss=
ue)
Merging ecryptfs/next (902af369942f ecryptfs: use DEFINE_MUTEX() for mutex =
lock)
Merging erofs/dev (d8b3df8b1048 erofs: avoid using generic_block_bmap)
Merging exfat/dev (61dd9f0b09e0 exfat: improve performance of exfat_free_cl=
uster when using dirsync mount option)
Merging ext3/for_next (8e8f048a6941 Merge udf truncate fix.)
Merging ext4/dev (e9f53353e166 ext4: remove expensive flush on fast commit)
Merging f2fs/dev (c8e43d55b1aa f2fs: relocate inline conversion from mmap()=
 to mkwrite())
CONFLICT (content): Merge conflict in fs/f2fs/file.c
CONFLICT (content): Merge conflict in fs/f2fs/acl.c
Merging fsverity/fsverity (db3b41f29c4f fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (5d069dbe8aaf fuse: fix bad inode)
Merging jfs/jfs-next (3bef198f1b17 JFS: more checks for invalid superblock)
Merging nfs/linux-next (1048ba83fb1c Linux 5.11-rc6)
Merging nfs-anna/linux-next (a37fdbfadcbf NFS: Allow internal use of read s=
tructs and functions)
Merging nfsd/nfsd-next (c3213d260a23 SUNRPC: Fix oops in the rpc_xdr_buf ev=
ent class)
Merging cel/for-next (428a23d2bf0c nfsd: skip some unnecessary stats in the=
 v4 case)
Merging orangefs/for-next (c1048828c3db orangefs: add splice file operation=
s)
Merging overlayfs/overlayfs-next (d46b7cd68336 ovl: plumb through flush met=
hod)
CONFLICT (content): Merge conflict in fs/overlayfs/inode.c
CONFLICT (content): Merge conflict in fs/overlayfs/copy_up.c
Merging ubifs/next (b80a974b8c58 ubifs: ubifs_dump_node: Dump all branches =
of the index node)
Merging v9fs/9p-next (324a158fe535 fs: 9p: add generic splice_write file op=
eration)
Merging xfs/for-next (ae29e4220fd3 xfs: reduce ilock acquisitions in xfs_fi=
le_fsync)
CONFLICT (content): Merge conflict in fs/xfs/xfs_inode.c
Merging zonefs/for-next (6716b125b339 zonefs: add tracepoints for file oper=
ations)
Merging iomap/iomap-for-next (ed1128c2d0c8 xfs: reduce exclusive locking on=
 unaligned dio)
Merging djw-vfs/vfs-for-next (9b8523423b23 vfs: move __sb_{start,end}_write=
* to fs.h)
Merging file-locks/locks-next (8d1ddb5e7937 fcntl: Fix potential deadlock i=
n send_sig{io, urg}())
Merging vfs/for-next (f012556f37ff Merge branch 'work.sendfile' into for-ne=
xt)
CONFLICT (content): Merge conflict in fs/namei.c
CONFLICT (content): Merge conflict in fs/coredump.c
CONFLICT (content): Merge conflict in arch/Kconfig
Merging printk/for-next (fdaae9394da4 Merge branch 'printk-rework' into for=
-next)
Merging pci/next (92036125120b Merge branch 'remotes/lorenzo/pci/misc')
Merging pstore/for-next/pstore (26fecbf7602d pstore: Move kmsg_bytes defaul=
t into Kconfig)
Merging hid/for-next (e71b0cd67ed7 Merge branch 'for-5.12/google' into for-=
next)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging i2c/i2c/for-next (eb77831e2a89 Merge branch 'i2c/for-5.12' into i2c=
/for-next)
Merging i3c/i3c/next (dd9267034c0e i3c: Make remove callback return void)
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (996dc09c8e77 hwmon: (pmbus/max31785) Supp=
ort revision "B")
Merging jc_docs/docs-next (20ccc8dd38a3 Documentation: input: define ABS_PR=
ESSURE/ABS_MT_PRESSURE resolution as grams)
Merging v4l-dvb/master (0b9112a58836 Merge tag 'v5.11-rc6' into patchwork)
Merging v4l-dvb-next/master (d0a9fffedca1 docs: fs: api-summary.rst: get ri=
d of kernel-doc include)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_dp_helper.c
CONFLICT (content): Merge conflict in Documentation/dev-tools/kasan.rst
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (c42187278fc1 Merge branch 'pm-domains' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (7114ebffd330 cpufreq: remove ta=
ngo driver)
Merging cpupower/cpupower (3a3ecfdb605c cpupower: Add cpuid cap flag for MS=
R_AMD_HWCR support)
Merging devfreq/devfreq-next (fc1745c0e40c PM / devfreq: rk3399_dmc: Remove=
 unneeded semicolon)
Merging opp/opp/linux-next (1d614920318b opp: Replace ENOTSUPP with EOPNOTS=
UPP)
Merging thermal/thermal/linux-next (7a583405f24b thermal: power allocator: =
fail binding for non-power actor devices)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (4f19d071f9be fs: dlm: check on existing node address)
Merging swiotlb/linux-next (e998879d4fb7 x86,swiotlb: Adjust SWIOTLB bounce=
 buffer size for SEV guests)
Merging rdma/for-next (4629c5d4db91 RDMA/efa: Remove unused syndrome enum v=
alues)
Merging net-next/master (d1e1355aefcc Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/netdev/net)
Merging bpf-next/for-next (058107abafc7 samples/bpf: Add include dir for MI=
PS Loongson64 to fix build errors)
CONFLICT (content): Merge conflict in net/ipv4/tcp.c
Merging ipsec-next/master (0c87b1ac6045 net: Simplify the calculation of va=
riables)
Merging mlx5-next/mlx5-next (ab0da5a57188 net/mlx5: Expose ifc bits for que=
ry modify header)
Merging netfilter-next/master (08a01c11a5bb netfilter: nftables: statify nf=
t_parse_register())
Merging ipvs-next/master (a61e4b60761f Merge branch 'net-dsa-hellcreek-add-=
taprio-offloading')
Merging wireless-drivers-next/master (4832bb371c41 iwl4965: do not process =
non-QOS frames on txq->sched_retry path)
Merging bluetooth/master (e8bd76ede155 Bluetooth: Fix null pointer derefere=
nce in amp_read_loc_assoc_final_data)
Merging mac80211-next/master (40c575d1ec71 cfg80211: fix netdev registratio=
n deadlock)
Merging gfs2/for-next (82218943058d gfs2: keep bios separate for each journ=
al)
Merging mtd/mtd/next (106a3ec368fd mtd: st_spi_fsm: convert comma to semico=
lon)
Merging nand/nand/next (073abfa7ea9a mtd: rawnand: intel: Fix an error hand=
ling path in 'ebu_dma_start()')
Merging spi-nor/spi-nor/next (fe6653460ee7 mtd: spi-nor: hisi-sfc: Put chil=
d node np on error path)
Merging crypto/master (663f63ee6d9c crypto: salsa20 - remove Salsa20 stream=
 cipher algorithm)
Merging drm/drm-next (af2922fa158e Merge branch 'linux-5.12' of git://githu=
b.com/skeggsb/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_breadcr=
umbs.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/gen7_rendercl=
ear.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dp=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_di=
splay.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dd=
i.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/inc/amdgpu_smu=
.h
Merging amdgpu/drm-next (dd30496ed1f9 drm/amdgpu: enable DPM_FLAG_MAY_SKIP_=
RESUME and DPM_FLAG_SMART_SUSPEND flags)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/smu11/si=
enna_cichlid_ppt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/smu11/na=
vi10_ppt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/smu11/ar=
cturus_ppt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/amdgpu_s=
mu.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/inc/smu_v11_0.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/mmhub_v2_3=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
Applying: amdgpu: merge fix for amdgpu_smu.h
Merging drm-intel/for-linux-next (eaf9a3465d9b Merge tag 'topic/drm-device-=
pdev-2021-02-02' of git://anongit.freedesktop.org/drm/drm-intel into drm-in=
tel-next)
Merging drm-tegra/drm/tegra/for-next (dcdfe2712b68 drm/tegra: Fix reference=
 leak when pm_runtime_get_sync() fails)
Merging drm-misc/for-linux-next (75ec69c79ebc drm/vmwgfx: Fix some memory l=
eaks on errors)
CONFLICT (content): Merge conflict in drivers/gpu/drm/ttm/ttm_pool.c
Merging drm-msm/msm-next (c703d5789590 drm/msm/dp: trigger unplug event in =
msm_dp_display_disable)
Merging imx-drm/imx-drm/next (82581fcf070b drm/modes: add non-OF stub for o=
f_get_drm_display_mode)
Merging etnaviv/etnaviv/next (7d614ab2f205 drm/etnaviv: fix NULL check befo=
re some freeing functions is not needed)
Merging regmap/for-next (aa3233086b48 Merge remote-tracking branch 'regmap/=
for-5.12' into regmap-next)
Merging sound/for-next (3c4ab49ec59b ALSA: core: Fix the debugfs removal at=
 snd_card_free())
Merging sound-asoc/for-next (def2b6cba551 Merge remote-tracking branch 'aso=
c/for-5.12' into asoc-next)
Merging modules/modules-next (ec2a29593c83 module: harden ELF info handling)
Merging input/next (7a6a53b2b1a3 Input: iqs5xx - initialize an uninitialize=
d variable)
Merging block/for-next (1eea73eaca15 Merge branch 'for-5.12/block' into for=
-next)
CONFLICT (content): Merge conflict in lib/iov_iter.c
CONFLICT (content): Merge conflict in fs/iomap/direct-io.c
CONFLICT (content): Merge conflict in Documentation/filesystems/porting.rst
Applying: block: bio: fix up for bi_disk removal
Applying: block: btrfs: another fix up for bi_disk removal
Merging device-mapper/for-next (266917bd4a21 dm writecache: fix unnecessary=
 NULL check warnings)
Merging pcmcia/pcmcia-next (4ce6b242b78d pcmcia: Switch to using the new AP=
I kobj_to_dev())
Merging mmc/next (fdb7ef5b7d36 Merge branch 'fixes' into next)
Merging mfd/for-mfd-next (d0e648f2186a mfd: intel-lpss: Add Intel Alder Lak=
e PCH-P PCI IDs)
Merging backlight/for-backlight-next (4a98e5ef88f8 backlight: sky81452-back=
light: Convert comma to semicolon)
Merging battery/for-next (a72acc56f3e9 power-supply: use kobj_to_dev())
Merging regulator/for-next (52cdb12b5ce5 Merge remote-tracking branch 'regu=
lator/for-5.12' into regulator-next)
Merging security/next-testing (9dcd47fc1f7d Merge branch 'fixes-v5.10' into=
 next-testing)
Merging apparmor/apparmor-next (e37986097ba6 apparmor: Use true and false f=
or bool variable)
Merging integrity/next-integrity (b3f82afc1041 IMA: Measure kernel version =
in early boot)
CONFLICT (content): Merge conflict in security/integrity/ima/ima_policy.c
CONFLICT (content): Merge conflict in security/integrity/ima/ima_main.c
CONFLICT (content): Merge conflict in security/integrity/ima/ima_api.c
Merging keys/keys-next (f7b0fd0b96b1 Merge branch 'keys-misc' into keys-nex=
t)
Merging safesetid/safesetid-next (03ca0ec13892 LSM: SafeSetID: Fix warnings=
 reported by test bot)
Merging selinux/next (365982aba1f2 fs: anon_inodes: rephrase to appropriate=
 kernel-doc)
Merging smack/next (7ef4c19d245f smackfs: restrict bytes count in smackfs w=
rite functions)
Merging tomoyo/master (f1bdf414e7dd usb: usbip: vhci_hcd: add printk() for =
debug)
Merging tpmdd/next (5cb9c551cb13 tpm_tis: Clean up locality release)
Merging watchdog/master (7c53f6b671f4 Linux 5.11-rc3)
Merging iommu/next (a35097282d90 Merge branches 'iommu/fixes', 'arm/renesas=
', 'arm/smmu', 'x86/amd', 'x86/vt-d' and 'core' into next)
Merging audit/next (127c8c5f0589 audit: Make audit_filter_syscall() return =
void)
Merging devicetree/for-next (cb18a7979a35 dt-bindings: gpu: Convert v3d to =
json-schema)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/net=
/ti,k3-am654-cpsw-nuss.yaml
Merging mailbox/mailbox-for-next (5a6338cce9f4 mailbox: arm_mhuv2: Add driv=
er)
Merging spi/for-next (af5b87d5beca Merge remote-tracking branch 'spi/for-5.=
12' into spi-next)
Merging tip/auto-latest (a7e0bdf1b07e Merge branch 'irq/urgent')
Applying: Revert "sched/topology: Make sched_init_numa() use a set for the =
deduplicating sort"
Merging clockevents/timers/drivers/next (8ae954caf49a clocksource/drivers/s=
h_cmt: Fix potential deadlock when calling runtime PM)
Merging edac/edac-for-next (faf042d15093 Merge branch 'edac-amd64' into eda=
c-for-next)
Merging irqchip/irq/irqchip-next (c60767421e10 irqchip/ls-extirq: add IRQCH=
IP_SKIP_SET_WAKE to the irqchip flags)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/int=
errupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
Merging ftrace/for-next (f6a694665f13 tracing: Offload eval map updates to =
a work queue)
Merging rcu/rcu/next (8e6a68bd0202 torture: Allow 1G of memory for torture.=
sh kvfree testing)
Merging kvm/next (9a78e15802a8 KVM: x86: allow KVM_REQ_GET_NESTED_STATE_PAG=
ES outside guest mode for VMX)
Merging kvm-arm/next (1d13d04f0919 Merge branch 'kvm-arm64/hyp-reloc' into =
kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (dc924b062488 KVM: SVM: check CR4 changes agai=
nst vcpu->arch)
Merging kvms390/next (50a05be484cb KVM: s390: track synchronous pfault even=
ts in kvm_stat)
Merging xen-tip/linux-next (2e92493637a0 x86/xen: avoid warning in Xen pv g=
uest with CONFIG_AMD_MEM_ENCRYPT enabled)
Merging percpu/for-next (7dd3050a0194 Merge branch 'for-5.12' into for-next)
Merging workqueues/for-next (e9ad2eb3d9ae workqueue: Use %s instead of func=
tion name)
Merging drivers-x86/for-next (fa707a580e77 Platform: OLPC: Specify the enab=
le time)
Merging chrome-platform/for-next (4daeb395f175 platform/chrome: cros_ec: Ca=
ll interrupt bottom half at probe time)
Merging hsi/for-next (aa57e77b3d28 HSI: Fix PM usage counter unbalance in s=
si_hw_init)
Merging leds/for-next (9a5ad5c5b2d2 leds: trigger: fix potential deadlock w=
ith libata)
Merging ipmi/for-next (fc26067c7417 ipmi: remove open coded version of SMBu=
s block write)
Merging driver-core/driver-core-next (4731210c09f5 gpiolib: Bind gpio_devic=
e to a driver to enable fw_devlink=3Don by default)
Merging usb/usb-next (17aa02beecbc Merge tag 'tag-ib-usb-typec-chrome-platf=
orm-cros-ec-typec-changes-for-5.12' of git://git.kernel.org/pub/scm/linux/k=
ernel/git/chrome-platform/linux into usb-next)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/usb=
/qcom,dwc3.yaml
Merging usb-gadget/next (b2c586eb07ef usb: dwc2: Fix INTR OUT transfers in =
DDMA mode.)
Merging usb-serial/usb-next (1ef268039b79 USB: serial: ftdi_sio: restore di=
visor-encoding comments)
Merging usb-chipidea-next/for-usb-next (4f30b9d2315f usb: cdns3: Add suppor=
t for TI's AM64 SoC)
Merging phy-next/next (71edb0b4fa0e dt-bindings: phy: qcom-qusb2: Document =
SDM660 compatible)
Merging tty/tty-next (81004f0bf7f0 dt-bindings: serial: imx: Switch to my p=
ersonal address)
CONFLICT (content): Merge conflict in include/linux/tty.h
Merging char-misc/char-misc-next (930c922a987a mei: me: add adler lake poin=
t LP DID)
CONFLICT (content): Merge conflict in scripts/mod/file2alias.c
CONFLICT (content): Merge conflict in scripts/mod/devicetable-offsets.c
CONFLICT (content): Merge conflict in include/linux/mod_devicetable.h
CONFLICT (modify/delete): drivers/tty/n_tracesink.c deleted in char-misc/ch=
ar-misc-next and modified in HEAD. Version HEAD of drivers/tty/n_tracesink.=
c left in tree.
CONFLICT (modify/delete): drivers/tty/n_tracerouter.c deleted in char-misc/=
char-misc-next and modified in HEAD. Version HEAD of drivers/tty/n_tracerou=
ter.c left in tree.
$ git rm -f drivers/tty/n_tracerouter.c drivers/tty/n_tracesink.c
Merging extcon/extcon-next (226d336c1c75 extcon: max8997: Add CHGINS and CH=
GRM interrupt handling)
Merging soundwire/next (18de2f72b74a soundwire: return earlier if no slave =
is attached)
Merging thunderbolt/next (2c2a2327bdb5 thunderbolt: switch: Fix function na=
me in the header)
Merging vfio/next (76adb20f924f Merge branch 'v5.12/vfio/next-vaddr' into v=
5.12/vfio/next)
Merging staging/staging-next (06b0c0dce88e staging: rtl8192u/ieee80211: fix=
 switch case indentation)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (6715ea06ced4 Merge branch 'icc-sdx55' into icc-next)
Merging dmaengine/next (ba61c3692034 dmaengine: xilinx_dma: Alloc tx descri=
ptors GFP_NOWAIT)
Merging cgroup/for-next (00bfa16052cd Merge branch 'for-5.11-fixes' into fo=
r-next)
Merging scsi/for-next (61629796ed22 Merge branch 'misc' into for-next)
CONFLICT (modify/delete): drivers/scsi/gdth.c deleted in scsi/for-next and =
modified in HEAD. Version HEAD of drivers/scsi/gdth.c left in tree.
$ git rm -f drivers/scsi/gdth.c
Merging scsi-mkp/for-next (d2aacd36a8e0 scsi: MAINTAINERS: Adjust to reflec=
t gdth scsi driver removal)
Merging vhost/linux-next (79991caf5202 vdpa_sim_net: Add support for user s=
upported devices)
Merging rpmsg/for-next (7cb4f293777e Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (03e432f1c84d dt-bindings: ap806: document =
gpio marvell,pwm-offset property)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/toshiba/tmpv7708-=
rm-mbrc.dts
Merging gpio-intel/for-next (f9f1591ab487 gpio: wcove: Split out to_ireg() =
helper and deduplicate the code)
Merging pinctrl/for-next (d3e0c0572caf Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (0e793a4e2834 pinctrl: tigerlake: Add Alder =
Lake-P ACPI ID)
Merging pinctrl-renesas/renesas-pinctrl (a5cda861ed57 pinctrl: renesas: r8a=
779a0: Add TPU pins, groups and functions)
Merging pinctrl-samsung/for-next (5c8fe583cce5 Linux 5.11-rc1)
Merging pwm/for-next (a2bc9b21fd3f pwm: Remove ZTE ZX driver)
Merging userns/for-next (95ebabde382c capabilities: Don't allow writing amb=
iguous v3 file capabilities)
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (df00d0298902 selftests/vDSO: fix -Wformat warning i=
n vdso_test_correctness)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (81840f21d416 Merge branch 'for-5.12/doc' int=
o for-next)
Merging coresight/next (1efbcec2ef8c coresight: cti: Reduce scope for the v=
ariable =E2=80=9Ccs_fwnode=E2=80=9D in cti_plat_create_connection())
Merging rtc/rtc-next (ddd0521549a9 rtc: zynqmp: depend on HAS_IOMEM)
Merging nvdimm/libnvdimm-for-next (127c3d2e7e8a Merge branch 'for-5.11/dax'=
 into for-5.11/libnvdimm)
Merging at24/at24/for-next (5c8fe583cce5 Linux 5.11-rc1)
Merging ntb/ntb-next (5c8fe583cce5 Linux 5.11-rc1)
Merging seccomp/for-next/seccomp (2c07343abd89 selftests/seccomp: Update ke=
rnel config)
Merging kspp/for-next/kspp (112b6a8e038d arm64: allow LTO to be selected)
CONFLICT (content): Merge conflict in include/asm-generic/vmlinux.lds.h
Merging gnss/gnss-next (45d5996e034c gnss: drop stray semicolons)
Merging fsi/next (4a851d714ead fsi: aspeed: Support CFAM reset GPIO)
Merging slimbus/for-next (0320ed0a8236 drivers: slimbus: Fix word resposibl=
e -> responsible in slimbus.h)
Merging nvmem/for-next (2c36185526ad nvmem: core: skip child nodes not matc=
hing binding)
Merging xarray/main (80c1dbebf308 XArray: Fix splitting to non-zero orders)
Merging hyperv/hyperv-next (4a79ae7046e7 hv: hyperv.h: Replace one-element =
array with flexible-array in struct icmsg_negotiate)
Merging auxdisplay/auxdisplay (b45616445a6e auxdisplay: Fix duplicate CHARL=
CD config symbol)
Merging kgdb/kgdb/for-next (d081a6e35316 kdb: Fix pager search for multi-li=
ne strings)
Merging hmm/hmm (3650b228f83a Linux 5.10-rc1)
Merging fpga/for-next (e41d4c011706 fpga: dfl: fme: Constify static attribu=
te_group structs)
Merging kunit/test (e71ba9452f0b Linux 5.11-rc2)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (5de15b610f78 mtd: hyperbus: add Renesas RPC-IF driver)
Merging kunit-next/kunit (e71ba9452f0b Linux 5.11-rc2)
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (77f2cb28ae52 Merge branch 'mhi-net-immutable' into mh=
i-next)
Merging memblock/for-next (097d43d85704 mm: memblock: remove return value o=
f memblock_free_all())
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (e71ba9452f0b Linux 5.11-rc2)
Merging iomem-mmap-vs-gup/topic/iomem-mmap-vs-gup (74b30195395c sysfs: Supp=
ort zapping of binary attr mmaps)
Merging oprofile-removal/oprofile/removal (be65de6b03aa fs: Remove dcookies=
 support)
Merging akpm-current/current (6937030ee4bb initramfs-panic-with-memory-info=
rmation-fix)
CONFLICT (content): Merge conflict in include/linux/pagemap.h
CONFLICT (content): Merge conflict in fs/hugetlbfs/inode.c
CONFLICT (content): Merge conflict in fs/btrfs/file.c
CONFLICT (content): Merge conflict in .mailmap
Applying: fs/ramfs/inode.c: update inode_operations.tmpfile
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (0bc40b75b3df secretmem: test: add basic selftest for m=
emfd_secret(2))

--Sig_/wa23hP+aG/4Izqz_esE9GS5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAaeiQACgkQAVBC80lX
0GxrHQgApAxX6mExiM3Jx03t27E4VGeoNkmrkh+d+sHE9gNNc4Nm015SbL5BCkLh
wr2B/urvchUFdMbQmlbicYbeQGG8unEEudxqQF61RAh4YtDWZO/vBswPyNohuLK+
qNjPmjwgxZlTzlEQ6w45BHNzH8K9L4Up0ZLuGW5kbyP13xr2FlW4NyMLB9XH8aKv
0X3x96vR5fD3PEZAmBq/kV4eIFdLZCuhcG/WXREw7UpqBHZkWiVric7ChsPfhrgu
vbFtWsJQzi15ArVQFgaRbYKWwJ/DkaW0q2R+hf9WuYn+spQ+N+pNFGPNxTSwurxz
XbREzxtaBrPIcCGUGM7MDLkgRUK2rg==
=8/W3
-----END PGP SIGNATURE-----

--Sig_/wa23hP+aG/4Izqz_esE9GS5--
