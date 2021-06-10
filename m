Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 057223A28AC
	for <lists+linux-next@lfdr.de>; Thu, 10 Jun 2021 11:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbhFJJun (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Jun 2021 05:50:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbhFJJum (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Jun 2021 05:50:42 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5980C061574;
        Thu, 10 Jun 2021 02:48:41 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G0zgp5Zsxz9s5R;
        Thu, 10 Jun 2021 19:48:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623318518;
        bh=itBVttetDUT+XgBuQXCGK4oCmJUL//fzMgXfIPsGNNg=;
        h=Date:From:To:Cc:Subject:From;
        b=LqQvjjQIVXOVjyXfMLk765wbuGWxxSBKtADOLrUz/XVnkghEf/HPr/RSfwPJG4/Pm
         dnGAIgT8kuAO4JXaqlRt4AlHx9l3Ff9rG4ZldOpViA93iy90cfO3imoFS6pPT/zjdg
         gWFxl/qg0n/fMv7gnfPbM1Q4CjcdCUX5/GAe+vEKPXkrY+J6pHwolTUUvdLzMeAQrR
         rxfRNxcbO7ckih8SVDg/qu8l0OiSQbVvlWlF7/9UG0JxPZfFj5b/wx5rrJnaH9V1GO
         Q6431NbHmtJVVsZ/s6RbPvLowb8ZcictCM2F3mdDdmLTWwnJj4lywpzMC/G5TEU0GG
         aZHxpln+JSagA==
Date:   Thu, 10 Jun 2021 19:48:37 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 10
Message-ID: <20210610194837.2a93ab31@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/X4PFJt5w53a6h77ezdXw+5V";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/X4PFJt5w53a6h77ezdXw+5V
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210609:

The risc-v tree gained a conflict against the risc-v-fixes tree.

The cifs tree lost its build failure.

The gfs2 tree gained a conflict and a semantic conflict against the
vfs tree.

The ftrace tree gained a build failure for which I reverted a commit.

Non-merge commits (relative to Linus' tree): 7969
 7788 files changed, 596620 insertions(+), 165192 deletions(-)

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

I am currently merging 331 trees (counting Linus' and 89 trees of bug
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
Merging origin/master (a4c30b8691f2 Merge tag 'compiler-attributes-for-linu=
s-v5.13-rc6' of git://github.com/ojeda/linux)
Merging fixes/fixes (614124bea77e Linux 5.13-rc5)
Merging kbuild-current/fixes (c4681547bcce Linux 5.13-rc3)
Merging arc-current/for-curr (98ec2edf58c8 ARCv2: save ABI registers across=
 signal handling)
Merging arm-current/fixes (dad7b9896a5d ARM: 9081/1: fix gcc-10 thumb2-kern=
el regression)
Merging arm64-fixes/for-next/fixes (e69012400b0c arm64: mm: don't use CON a=
nd BLK mapping if KFENCE is enabled)
Merging arm-soc-fixes/arm/fixes (b9c112f2c223 Merge tag 'ti-k3-dt-fixes-for=
-v5.13' of git://git.kernel.org/pub/scm/linux/kernel/git/nmenon/linux into =
arm/fixes)
Merging drivers-memory-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging m68k-current/for-linus (34e5269bf987 m68k: sun3x: Remove unneeded s=
emicolon)
Merging powerpc-fixes/fixes (59cc84c802eb Revert "powerpc/kernel/iommu: Ali=
gn size for IOMMU_PAGE_SIZE() to save TCEs")
Merging s390-fixes/fixes (1874cb13d5d7 s390/mcck: fix invalid KVM guest con=
dition check)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (d2e381c49636 rtnetlink: Fix regression in bridge VLAN c=
onfiguration)
Merging bpf/master (11fc79fc9f2e libbpf: Fixes incorrect rx_ring_setup_done)
Merging ipsec/master (eebd49a4ffb4 xfrm: remove the fragment check for ipv6=
 beet mode)
Merging netfilter/master (12f36e9bf678 netfilter: nft_fib_ipv6: skip ipv6 p=
ackets from any to link-local)
Merging ipvs/master (1a8024239dac virtio-net: fix for skb_over_panic inside=
 big mode)
Merging wireless-drivers/master (d4826d17b393 mt76: mt7921: remove leftover=
 80+80 HE capability)
Merging mac80211/master (a9799541ca34 mac80211: drop multicast fragments)
Merging rdma-fixes/for-rc (404e5a12691f RDMA/mlx4: Do not map the core_cloc=
k page to user space unless enabled)
Merging sound-current/for-linus (a0309c344886 Merge tag 'asoc-fix-v5.13-rc4=
' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for=
-linus)
Merging sound-asoc-fixes/for-linus (dca9d1f8ecc7 Merge remote-tracking bran=
ch 'asoc/for-5.13' into asoc-linus)
Merging regmap-fixes/for-linus (614124bea77e Linux 5.13-rc5)
Merging regulator-fixes/for-linus (d4c5beb8e915 Merge remote-tracking branc=
h 'regulator/for-5.13' into regulator-linus)
Merging spi-fixes/for-linus (df6e35b07f48 Merge remote-tracking branch 'spi=
/for-5.13' into spi-linus)
Merging pci-current/for-linus (85aabbd7b315 PCI/MSI: Fix MSIs for generic h=
osts that use device-tree's "msi-map")
Merging driver-core.current/driver-core-linus (f501b6a2312e debugfs: Fix de=
bugfs_read_file_str())
Merging tty.current/tty-linus (7c3e8d9df265 serial: 8250_exar: Avoid NULL p=
ointer dereference at ->exit())
Merging usb.current/usb-linus (fbf649cd6d64 usb: misc: brcmstb-usb-pinmap: =
check return value after calling platform_get_resource())
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (bc96c72df33e USB: serial: ftdi_sio: add=
 NovaTech OrionMX product ID)
Merging usb-chipidea-fixes/for-usb-fixes (a9aecef198fa usb: cdnsp: Fix dead=
lock issue in cdnsp_thread_irq_handler)
Merging phy/fixes (d1ce245fe409 phy: Sparx5 Eth SerDes: check return value =
after calling platform_get_resource())
Merging staging.current/staging-linus (e9de1ecadeab staging: ralink-gdma: R=
emove incorrect author information)
Merging iio-fixes/fixes-togreg (ab0c072a6f6c iio: accel: bma180: Fix BMA25x=
 bandwidth register values)
Merging char-misc.current/char-misc-linus (3df4fce739e2 misc: rtsx: separat=
e aspm mode into MODE_REG and MODE_CFG)
Merging soundwire-fixes/fixes (da096fbccd52 soundwire: qcom: fix handling o=
f qcom,ports-block-pack-mode)
Merging thunderbolt-fixes/fixes (614124bea77e Linux 5.13-rc5)
Merging input-current/for-linus (45a4b68354ff Input: elants_i2c - switch to=
 probe_new)
Merging crypto-current/master (e3a606f2c544 fsverity: relax build time depe=
ndency on CRYPTO_SHA256)
Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer)
Merging vfio-fixes/for-linus (dc51ff91cf2d vfio/platform: fix module_put ca=
ll in error flow)
Merging kselftest-fixes/fixes (d07f6ca923ea Linux 5.13-rc2)
Merging modules-fixes/modules-linus (055f23b74b20 module: check for exit se=
ctions in layout_sections() instead of module_init_section())
Merging dmaengine-fixes/fixes (9041575348b2 dmaengine: mediatek: use GFP_NO=
WAIT instead of GFP_ATOMIC in prep_dma)
Merging backlight-fixes/for-backlight-fixes (a38fd8748464 Linux 5.12-rc2)
Merging mtd-fixes/mtd/fixes (562b4e91d3b2 mtd: parsers: ofpart: fix parsing=
 subpartitions)
Merging mfd-fixes/for-mfd-fixes (a61f4661fba4 mfd: intel_quark_i2c_gpio: Re=
vert "Constify static struct resources")
Merging v4l-dvb-fixes/fixes (1e67a81775cb media: s5p-mfc: Fix display delay=
 control creation)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (78cf0eb926cb MIPS: Fix kernel hang under FUN=
CTION_GRAPH_TRACER and PREEMPT_TRACER)
Merging at91-fixes/at91-fixes (6efb943b8616 Linux 5.13-rc1)
Merging omap-fixes/fixes (bae989c4bc53 ARM: OMAP1: ams-delta: remove unused=
 function ams_delta_camera_power)
Merging kvm-fixes/master (4422829e8053 kvm: fix previous commit for 32-bit =
builds)
Merging kvms390-fixes/master (735931f9a51a MAINTAINERS: add uv.c also to KV=
M/s390)
Merging hwmon-fixes/hwmon (78d135523462 hwmon: (scpi-hwmon) shows the negat=
ive temperature properly)
Merging nvdimm-fixes/libnvdimm-fixes (de80d5781136 Merge branch 'for-5.13/d=
ax' into libnvdimm-fixes)
Merging cxl-fixes/fixes (fae8817ae804 cxl/mem: Fix memory device capacity p=
robing)
Merging btrfs-fixes/next-fixes (60e210440155 Merge branch 'misc-5.13' into =
next-fixes)
Merging vfs-fixes/fixes (173e84953eaa fs: fix reporting supported extra fil=
e attributes for statx())
Merging dma-mapping-fixes/for-linus (18a3c5f7abfd Merge tag 'for_linus' of =
git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging i3c-fixes/i3c/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging drivers-x86-fixes/fixes (701b54bcb7d0 platform/mellanox: mlxreg-hot=
plug: Revert "move to use request_irq by IRQF_NO_AUTOEN flag")
Merging samsung-krzk-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging pinctrl-samsung-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging devicetree-fixes/dt/linus (8929ef8d4dfd media: dt-bindings: media: =
renesas,drif: Fix fck definition)
Merging scsi-fixes/fixes (1e0d4e622599 scsi: core: Only put parent device i=
f host state differs from SHOST_CREATED)
Merging drm-fixes/drm-fixes (614124bea77e Linux 5.13-rc5)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (614124bea77e Linux 5.13-rc5)
Merging mmc-fixes/fixes (6687cd72aa91 mmc: renesas_sdhi: Fix HS400 on R-Car=
 M3-W+)
Merging rtc-fixes/rtc-fixes (bd33335aa93d rtc: cmos: Disable irq around dir=
ect invocation of cmos_interrupt())
Merging gnss-fixes/gnss-linus (a38fd8748464 Linux 5.12-rc2)
Merging hyperv-fixes/hyperv-fixes (6efb943b8616 Linux 5.13-rc1)
Merging soc-fsl-fixes/fix (2663b3388551 soc: fsl: dpio: Get the cpumask thr=
ough cpumask_of(cpu))
Merging risc-v-fixes/fixes (160ce364167f Merge remote-tracking branch 'risc=
v/riscv-wx-mappings' into fixes)
Merging pidfd-fixes/fixes (03ba0fe4d09f file: simplify logic in __close_ran=
ge())
Merging fpga-fixes/fixes (2e8496f31d0b firmware: stratix10-svc: reset COMMA=
ND_RECONFIG_FLAG_PARTIAL to 0)
Merging spdx/spdx-linus (6799d4f2da49 Merge tag 'scsi-fixes' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging gpio-brgl-fixes/gpio/for-current (dbec64b11c65 gpio: wcd934x: Fix s=
hift-out-of-bounds error)
Merging gpio-intel-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging pinctrl-intel-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging erofs-fixes/fixes (0852b6ca941e erofs: fix 1 lcluster-sized pcluste=
r for big pcluster)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (d7eab3df8f39 Documentation: kunit: Update =
kunit_tool page)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (17cbe03872be mm/memblock: Fix typo in comment=
 of memblock_phys_alloc_try_nid())
Merging cel-fixes/for-rc (9f4ad9e425a1 Linux 5.12)
Merging drm-misc-fixes/for-linux-next-fixes (c8a570443943 drm/mcde: Fix off=
 by 10^3 in calculation)
Merging kspp-gustavo/for-next/kspp (a45cb78e6a90 Merge branch 'for-next/War=
ray-bounds' into for-next/kspp)
Merging kbuild/for-next (c7c90e121e99 kconfig.h: explain IS_MODULE(), IS_EN=
ABLED())
Merging compiler-attributes/compiler-attributes (ca0760e7d79e Compiler Attr=
ibutes: Add continue in comment)
Merging dma-mapping/for-next (a7f3d3d3600c dma-mapping: add unlikely hint t=
o error path in dma_mapping_error)
Merging asm-generic/master (14462376858e Merge branch 'asm-generic-unaligne=
d' into asm-generic)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (b285d0f98734 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (52fe80c09091 Merge branch 'for-next/sve' into =
for-next/core)
Merging arm-perf/for-next/perf (59d697a99daa perf/hisi: Constify static att=
ribute_group structs)
Merging arm-soc/for-next (af644ce486a8 ARM: Document merges)
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (b813db6e4b65 Merge branches 'v5.14/drivers' and '=
v5.14/dt64' into for-next)
Merging aspeed/for-next (61fbc42084f4 Merge branches 'wpcm450-for-v5.13', '=
dt-for-v5.13' and 'lpc-for-v5.13' into for-next)
Merging at91/at91-next (74815080302e Merge branch 'at91-defconfig' into at9=
1-next)
Merging drivers-memory/for-next (6713da4271fd Merge branch 'for-v5.14/tegra=
-mc' into for-next)
Merging imx-mxs/for-next (2f875c387c54 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (9d2e21ed98a2 Merge branch 'for_5.12/drivers-soc' int=
o next)
Merging mediatek/for-next (fd450fd2a4fb Merge branch 'v5.13-next/soc' into =
for-next)
Merging mvebu/for-next (79e93f9dc81a Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (3f89af8097bd Merge branch 'omap-for-v5.14/dt' into f=
or-next)
Merging qcom/for-next (55ac24b7e577 Merge branches 'arm64-defconfig-for-5.1=
4', 'arm64-for-5.14', 'drivers-for-5.14' and 'dts-for-5.14' into for-next)
Merging raspberrypi/for-next (21c6bf8304f0 arm64: dts: broadcom: Add refere=
nce to RPi 400)
Merging renesas/next (e1833059a1c5 Merge branch 'renesas-arm-dt-for-v5.14' =
into renesas-next)
Merging reset/reset/next (48a74b1147f7 reset: Add compile-test stubs)
Merging rockchip/for-next (7bb4870abf84 Merge branch 'v5.14-armsoc/dts32' i=
nto for-next)
Merging samsung-krzk/for-next (fc14c3f36825 Merge branch 'next/defconfig' i=
nto for-next)
Merging scmi/for-linux-next (3dfb5f9788d8 Merge branch 'for-next/juno' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging stm32/stm32-next (3dab3e1862cf ARM: dts: stm32: fix ltdc pinctrl on=
 microdev2.0-of7)
Merging sunxi/sunxi/for-next (2b4f0bf55549 Merge branches 'sunxi/clk-fixes-=
for-5.13', 'sunxi/dt-for-5.14' and 'sunxi/fixes-for-5.13' into sunxi/for-ne=
xt)
Merging tegra/for-next (68bc483ed413 Merge branch for-5.14/arm64/dt into fo=
r-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (c90ec93d94f2 arm64: dts: ti: k3-am642-sk: Dis=
able PCIe)
Merging xilinx/for-next (6efb943b8616 Linux 5.13-rc1)
Merging clk/clk-next (f09119823f43 Merge branch 'clk-vc5' into clk-next)
Merging clk-imx/for-next (9cfb301be710 clk: imx: scu: add enet rgmii gpr cl=
ocks)
Merging clk-renesas/renesas-clk (790c06cc5df2 clk: renesas: r8a77995: Add Z=
A2 clock)
Merging clk-samsung/for-next (a38fd8748464 Linux 5.12-rc2)
Merging csky/linux-next (280af034a71d csky: Kconfig: Remove unused selects)
Merging h8300/h8300-next (6e5e55227c95 Merge tag 'v5.11' into h8300-next)
Merging m68k/for-next (c1367ee016e3 m68k: atari: Fix ATARI_KBD_CORE kconfig=
 unmet dependency warning)
Merging m68knommu/for-next (614124bea77e Linux 5.13-rc5)
Merging microblaze/next (14a832498c23 arch: microblaze: Fix spelling mistak=
e "vesion" -> "version")
Merging mips/mips-next (0fe0fbc86711 MIPS: ingenic: rs90: Add dedicated VRA=
M memory region)
Merging nds32/next (40e0dd851e7b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (8b549c18ae81 openrisc: Define memory barrier mb)
Merging parisc-hd/for-next (9f4ad9e425a1 Linux 5.12)
Merging powerpc/next (027f55e87c30 tty: hvc: udbg_hvc: retry putc on -EAGAI=
N)
Merging soc-fsl/next (242b0b398ccd soc: fsl: enable acpi support in RCPM dr=
iver)
Merging risc-v/for-next (cba43c31f14b riscv: Use global mappings for kernel=
 pages)
Merging s390/for-next (3ba3a3f77e4f Merge branch 'features' into for-next)
Merging sh/for-next (2882b7626f49 sh: kernel: traps: remove unused variable)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (ed102bf2afed um: Fix W=3D1 missing-include-dirs war=
nings)
Merging xtensa/xtensa-for-next (21e0c3d5f633 xtensa: fix kconfig unmet depe=
ndency warning for HAVE_FUTEX_CMPXCHG)
Merging pidfd/for-next (5ddf9602d711 Merge branch 'fs.mount_setattr.nosymfo=
llow' into for-next)
Merging fscrypt/master (77f30bfcfcf4 fscrypt: don't ignore minor_hash when =
hash is 0)
Merging fscache/fscache-next (3003bbd0697b afs: Use the netfs_write_begin()=
 helper)
Merging afs/afs-next (7af08140979a Revert "gcov: clang: fix clang-11+ build=
")
Merging btrfs/for-next (e1bde17d1592 Merge branch 'for-next-next-v5.13-2021=
0601' into for-next-20210601)
CONFLICT (content): Merge conflict in fs/btrfs/tree-log.c
Merging ceph/master (f9f9eb473076 libceph: fix some spelling mistakes)
Merging cifs/for-next (7a6b6d5a5ffe cifs: enable extended stats by default)
Merging cifsd/cifsd-for-next (be8bcf8baaec Merge pull request #55 from namj=
aejeon/cifsd-for-next)
Merging configfs/for-next (7fe1e79b59ba configfs: implement the .read_iter =
and .write_iter methods)
Merging ecryptfs/next (682a8e2b41ef Merge tag 'ecryptfs-5.13-rc1-updates' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs)
Merging erofs/dev (c5fcb51111b8 erofs: clean up file headers & footers)
Merging exfat/dev (b741596468b0 Merge tag 'riscv-for-linus-5.13-mw1' of git=
://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging ext3/for_next (e7ca3b93d2bb Pull quotactl_fd() syscall from Jan Kar=
a.)
Merging ext4/dev (a492dedb708d ext4: update journal documentation)
CONFLICT (content): Merge conflict in fs/ext4/ioctl.c
Merging f2fs/dev (a529f200d4f9 f2fs: swap: support migrating swapfile in al=
igned write mode)
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (e4a9ccdd1c03 fuse: Fix infinite loop in sget_fc())
Merging jfs/jfs-next (492109333c29 fs/jfs: Fix missing error code in lmLogI=
nit())
Merging nfs/linux-next (c3aba897c6e6 NFSv4: Fix second deadlock in nfs4_evi=
ct_inode())
Merging nfs-anna/linux-next (4f8be1f53bf6 nfs: we don't support removing sy=
stem.nfs4_acl)
Merging nfsd/nfsd-next (220371535410 NFSD: Fix error return code in nfsd4_i=
nterssc_connect())
Merging cel/for-next (b9f83ffaa0c0 SUNRPC: Fix null pointer dereference in =
svc_rqst_free())
Merging orangefs/for-next (211f9f2e0503 orangefs: leave files in the page c=
ache for a few micro seconds at least)
Merging overlayfs/overlayfs-next (5e717c6fa41f ovl: add debug print to ovl_=
do_getxattr())
Merging ubifs/next (9a29f7f020e0 ubi: Remove unnecessary struct declaration)
Merging v9fs/9p-next (cba7dcd8878e 9p/trans_virtio: Remove sysfs file on pr=
obe failure)
Merging xfs/for-next (7e4311b04be4 Merge tag 'xfs-cil-scale-2-tag' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/dgc/linux-xfs into xfs-5.14-merge2=
-cil)
Merging zonefs/for-next (6980d29ce4da zonefs: fix to update .i_wr_refcnt co=
rrectly in zonefs_open_zone())
Merging iomap/iomap-for-next (6e552494fb90 iomap: remove unused private fie=
ld from ioend)
Merging djw-vfs/vfs-for-next (9b8523423b23 vfs: move __sb_{start,end}_write=
* to fs.h)
Merging file-locks/locks-next (cbe6fc4e0142 fs/locks: remove useless assign=
ment in fcntl_getlk)
Merging vfs/for-next (e8a8879c8e65 Merge branch 'work.iov_iter' into for-ne=
xt)
Merging printk/for-next (7e4e0a140346 Merge branch 'for-5.14-vsprintf-scanf=
' into for-next)
Merging pci/next (b3e91145f897 Merge branch 'remotes/lorenzo/pci/xgene')
Merging pstore/for-next/pstore (9d843e8fafc7 pstore: Add mem_type property =
DT parsing support)
Merging hid/for-next (84b5e4d4ad37 Merge branches 'for-5.13/upstream-fixes'=
, 'for-5.14/core', 'for-5.14/google', 'for-5.14/intel-ish' and 'for-5.14/lo=
gitech' into for-next)
Merging i2c/i2c/for-next (481d571969ab Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i3c/i3c/next (3e5feb11a829 i3c: master: svc: fix doc warning in svc=
-i3c-master.c)
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (c6684f398e1f MAINTAINERS: Add Delta DPS92=
0AB PSU driver)
Merging jc_docs/docs-next (acda97acb2e9 docs: convert dax.txt to rst)
Merging v4l-dvb/master (5b448065febe media: pci: tw5864: avoid usage of som=
e characters)
Merging v4l-dvb-next/master (45040f675041 media: hantro: IMX8M: add variant=
 for G2/HEVC codec)
Merging pm/linux-next (6d0b2a5677ed Merge branch 'acpi-bus' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (9821a195d4e2 dt-bindings: cpufr=
eq: update cpu type and clock name for MT8173 SoC)
Merging cpupower/cpupower (d07f6ca923ea Linux 5.13-rc2)
Merging devfreq/devfreq-next (64f4d903ce9d dt-bindings: devfreq: tegra30-ac=
tmon: Add cooling-cells)
Merging opp/opp/linux-next (ac9fd3c80340 opp: use list_del_init instead of =
list_del/INIT_LIST_HEAD)
Merging thermal/thermal/linux-next (c310e546164d thermal/drivers/mtk_therma=
l: Remove redundant initializations of several variables)
Merging dlm/next (d10a0b88751a fs: dlm: rename socket and app buffer define=
s)
Merging swiotlb/linux-next (dfc06b389a4f swiotlb: don't override user speci=
fied size in swiotlb_adjust_size)
Merging rdma/for-next (61c7d826b817 RDMA/irdma: Fix return error sign from =
irdma_modify_qp)
Merging net-next/master (0d155170d6ee Merge branch 'ipa-mem-1')
Merging bpf-next/for-next (380afe720896 selftests, bpf: Make docs tests fai=
l more reliably)
Merging ipsec-next/master (a925316af80a net: Remove unnecessary variables)
Merging mlx5-next/mlx5-next (63f9c44bca5e net/mlx5: Add MEMIC operations re=
lated bits)
Merging netfilter-next/master (c5c6accd7b7e netfilter: nf_tables: move base=
 hook annotation to init helper)
Merging ipvs-next/master (e2cf17d3774c netfilter: add new hook nfnl subsyst=
em)
Merging wireless-drivers-next/master (080f9c10c773 ipw2x00: Minor documenta=
tion update)
Merging bluetooth/master (a57681531e6e Bluetooth: HCI: Fix Set Extended (Sc=
an Response) Data)
Merging mac80211-next/master (77091933e453 net: mdio: ipq8064: enlarge slee=
p after read/write operation)
Merging gfs2/for-next (574c26b5ca1c gfs2: Fix do_gfs2_set_flags description)
CONFLICT (content): Merge conflict in lib/iov_iter.c
CONFLICT (content): Merge conflict in include/linux/uio.h
Applying: iov_iter: fix up for iov changes
Merging mtd/mtd/next (10f3b4d79958 mtd: parsers: qcom: Fix leaking of parti=
tion name)
Merging nand/nand/next (c374839f9b44 mtd: spinand: macronix: Add support fo=
r serial NAND flash)
Merging spi-nor/spi-nor/next (a6e2cd4dd28e mtd: spi-nor: otp: fix kerneldoc=
 typos)
Merging crypto/master (760fe22cf5e9 crypto: hisilicon/qm - update reset flo=
w)
Merging drm/drm-next (5745d647d556 Merge tag 'amd-drm-next-5.14-2021-06-02'=
 of https://gitlab.freedesktop.org/agd5f/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ctx=
.c
Merging drm-misc/for-linux-next (6eca310e8924 drm/nouveau/kms/nv50-: Add ba=
sic DPCD backlight support for nouveau)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ttm=
.c
Applying: hack fix up for needed amdgpu_preempt_mgr_new() fix up
Merging amdgpu/drm-next (936a4216a1a4 drm/radeon: Add HD-audio component no=
tifier support (v2))
Merging drm-intel/for-linux-next (0d6695b11276 drm/i915/adl_p: Same slices =
mask is not same Dbuf state)
Merging drm-tegra/drm/tegra/for-next (ecc583e22d46 drm/tegra: hub: Implemen=
t basic scaling support)
Merging drm-msm/msm-next (aabf679c9a4e drm/msm/disp/dpu1: avoid perf update=
 in frame done event)
Merging imx-drm/imx-drm/next (fc1e985b67f9 drm/imx: ipuv3-plane: add color =
encoding and range properties)
Merging etnaviv/etnaviv/next (4bfdd2aa67fb drm/etnaviv: rework linear windo=
w offset calculation)
Merging regmap/for-next (edbd2d29cc95 Merge remote-tracking branch 'regmap/=
for-5.14' into regmap-next)
Merging sound/for-next (d6f9afe9475f ALSA: usb-audio: scarlett2: Read mux a=
t init time)
Merging sound-asoc/for-next (bf28c803f2f4 Merge remote-tracking branch 'aso=
c/for-5.14' into asoc-next)
Merging modules/modules-next (2c0f0f363956 module: correctly exit module_ka=
llsyms_on_each_symbol when fn() !=3D 0)
Merging input/next (83b41248ed04 Input: cy8ctmg110_ts - switch to using gpi=
od API)
Merging block/for-next (d3f02e52f554 Merge branch 'for-5.14/drivers' into f=
or-next)
CONFLICT (content): Merge conflict in drivers/nvme/host/fabrics.c
Merging device-mapper/for-next (f34ee1dce642 dm crypt: Fix zoned block devi=
ce support)
Merging pcmcia/pcmcia-next (e9d503fef7da pcmcia: rsrc_nonstatic: Fix call-b=
ack function as reference formatting)
Merging mmc/next (9d574d3d5809 Merge branch 'fixes' into next)
Merging mfd/for-mfd-next (495fb48dbd9b mfd: wm831x: Use DEFINE_RES_IRQ_NAME=
D() and DEFINE_RES_IRQ() to simplify code)
Merging backlight/for-backlight-next (6fc632d3e3e0 video: backlight: qcom-w=
led: Add PMI8994 compatible)
Merging battery/for-next (eab4e6d953c1 power: supply: cpcap-charger: get th=
e battery inserted infomation from cpcap-battery)
Merging regulator/for-next (eff9c1cd5394 Merge remote-tracking branch 'regu=
lator/for-5.14' into regulator-next)
Merging security/next-testing (047843bdb316 Merge branch 'landlock_lsm_v34'=
 into next-testing)
Merging apparmor/apparmor-next (d108370c644b apparmor: fix error check)
Merging integrity/next-integrity (dc0983f2f9b6 Merge branch 'verify-evm-por=
table-sig-v2' into next-integrity)
Merging keys/keys-next (e377c31f788f integrity: Load mokx variables into th=
e blacklist keyring)
CONFLICT (content): Merge conflict in certs/system_keyring.c
Merging safesetid/safesetid-next (1ca86ac1ec8d LSM: SafeSetID: Fix code spe=
cification by scripts/checkpatch.pl)
Merging selinux/next (869cbeef18e5 lsm_audit,selinux: pass IB device name b=
y reference)
Merging smack/next (fe6bde732be8 Smack: fix doc warning)
Merging tomoyo/master (6efb943b8616 Linux 5.13-rc1)
Merging tpmdd/next (8124c8a6b353 Linux 5.13-rc4)
Merging watchdog/master (c4681547bcce Linux 5.13-rc3)
Merging iommu/next (86b3a6b501e8 Merge branches 'iommu/fixes', 'arm/rockchi=
p', 'x86/amd' and 'core' into next)
Merging audit/next (dd8b865cc408 audit: Use list_move instead of list_del/l=
ist_add)
Merging devicetree/for-next (000fe96707b4 dt-bindings: watchdog: Convert ar=
m,sbsa-gwdt to DT schema)
Merging mailbox/mailbox-for-next (2335f556b3af dt-bindings: mailbox: qcom-i=
pcc: Add compatible for SC7280)
Merging spi/for-next (0e66e9da0418 Merge remote-tracking branch 'spi/for-5.=
14' into spi-next)
Merging tip/auto-latest (d2781acb34c7 Merge branch 'linus')
CONFLICT (content): Merge conflict in samples/kprobes/kprobe_example.c
Merging clockevents/timers/drivers/next (8120891105ba dt-bindings: timer: n=
uvoton,npcm7xx: Add wpcm450-timer)
Merging edac/edac-for-next (e8049c4aa5d8 MAINTAINERS: Make Yazen Ghannam ma=
intainer for EDAC-AMD64)
Merging irqchip/irq/irqchip-next (bf06bd2ae89e Merge branch irq/generic_han=
dle_domain_irq-core into irq/irqchip-next)
Merging ftrace/for-next (7cc264a96c90 treewide: Add missing semicolons to _=
_assign_str uses)
Merging rcu/rcu/next (516e52e9f5ec scftorture: Avoid excess warnings)
Merging kvm/next (a4345a7cecfb Merge tag 'kvmarm-fixes-5.13-1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvm-arm/next (32ab5a5e97da Merge branch kvm-arm64/mmu/MMIO-block-ma=
pping into kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (72476aaa4691 KVM: PPC: Book3S HV: Fix host ra=
dix SLB optimisation with hash guests)
Merging kvms390/next (44bada282190 KVM: s390: fix guarded storage control r=
egister handling)
Merging xen-tip/linux-next (107866a8eb0b xen-netback: take a reference to t=
he RX task thread)
Merging percpu/for-next (4bb1fa3576d5 Merge branch 'for-5.14' into for-next)
Merging workqueues/for-next (f2ccd0a922b3 workqueue: Add back __printf form=
at validation)
Merging drivers-x86/for-next (501f1864e638 platform/x86: think-lmi: Avoid p=
otential read before start of the buffer)
CONFLICT (content): Merge conflict in drivers/platform/surface/surface_aggr=
egator_registry.c
Merging chrome-platform/for-next (6efb943b8616 Linux 5.13-rc1)
Merging hsi/for-next (6efb943b8616 Linux 5.13-rc1)
Merging leds/for-next (e90abb95bc71 leds: lm36274: Add missed property.h)
Merging ipmi/for-next (2253042d86f5 ipmi/watchdog: Stop watchdog timer when=
 the current action is 'none')
Merging driver-core/driver-core-next (5a576764e419 drivers/base: Constify s=
tatic attribute_group structs)
Merging usb/usb-next (87191ca9f902 USB: UDC: Implement udc_async_callbacks =
in net2272)
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (17cd3a106e97 USB: serial: drop irq-flags initi=
alisations)
Merging usb-chipidea-next/for-usb-next (3496993d06ff doc: dt-binding: cdns,=
usb3: Add interrupt-names property under required)
Merging tty/tty-next (2877389f59dc tty: vcc: use DEVICE_ATTR_*() macro)
Merging char-misc/char-misc-next (603e4922f1c8 remove the raw driver)
Merging extcon/extcon-next (b792cb11d39f extcon: sm5502: Add support for SM=
5504)
Merging phy-next/next (1ed9e566f3d7 MAINTAINERS: update marvell,armada-3700=
-utmi-phy.yaml reference)
Merging soundwire/next (1ec9d2e7936c soundwire: cadence: remove the repeate=
d declaration)
Merging thunderbolt/next (25335b30daf6 thunderbolt: Check for NVM authentic=
ation status after the operation started)
Merging vfio/next (adaeb718d46f vfio/gvt: fix DRM_I915_GVT dependency on VF=
IO_MDEV)
Merging staging/staging-next (6771fb0b940e Merge tag 'iio-for-5.14a' of htt=
ps://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-next)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging iio/togreg (6771fb0b940e Merge tag 'iio-for-5.14a' of https://git.k=
ernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-next)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (46bdcac533cc interconnect: qcom: Add SC7280 interconn=
ect provider driver)
Merging dmaengine/next (2e5c09d19e63 dmaengine: sun4i: Use list_move_tail i=
nstead of list_del/list_add_tail)
Merging cgroup/for-next (d42132d940a7 Merge branch 'for-5.14' into for-next)
Merging scsi/for-next (936c600e28f3 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (49d3e5996155 scsi: fc: FDMI enhancement)
Merging vhost/linux-next (7ff6e99e021c virtio_net: disable cb aggressively)
Merging rpmsg/for-next (c86976deb21c Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (354cb6465a9b MAINTAINERS: update ti,omap-g=
pio.yaml reference)
Merging gpio-intel/for-next (043d7f09bf61 gpiolib: acpi: Add acpi_gpio_get_=
io_resource())
Merging pinctrl/for-next (5320c72b23f9 Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in include/linux/pinctrl/pinconf-generic=
.h
Merging pinctrl-intel/for-next (258435a1c818 pinctrl: tigerlake: Add Alder =
Lake-M ACPI ID)
Merging pinctrl-renesas/renesas-pinctrl (85a242cdcd44 pinctrl: renesas: r8a=
77995: Add bias pinconf support)
Merging pinctrl-samsung/for-next (6efb943b8616 Linux 5.13-rc1)
Merging pwm/for-next (d233504af7db dt-bindings: pwm: pwm-tiehrpwm: Add comp=
atible string for AM64 SoC)
Merging userns/for-next (5e6b8a50a7ce cred: add missing return error code w=
hen set_cred_ucounts() failed)
CONFLICT (content): Merge conflict in kernel/ucount.c
CONFLICT (content): Merge conflict in kernel/signal.c
CONFLICT (content): Merge conflict in include/linux/user_namespace.h
CONFLICT (content): Merge conflict in include/linux/sched/user.h
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging kselftest/next (0d3e5a057992 selftests: timers: rtcpie: skip test i=
f default RTC device does not exist)
Merging livepatching/for-next (c150bbbb1731 Merge branch 'for-5.13/signal' =
into for-next)
Merging coresight/next (1efbcec2ef8c coresight: cti: Reduce scope for the v=
ariable =E2=80=9Ccs_fwnode=E2=80=9D in cti_plat_create_connection())
Merging rtc/rtc-next (bcae59d0d45b rtc: imxdi: add wakeup support)
Merging nvdimm/libnvdimm-for-next (30c10d32152d Merge branch 'for-5.12/cxl'=
 into libnvdimm-for-next)
Merging at24/at24/for-next (6efb943b8616 Linux 5.13-rc1)
Merging ntb/ntb-next (5c8fe583cce5 Linux 5.11-rc1)
Merging seccomp/for-next/seccomp (fe092fc9f14b selftests/seccomp: Flush ben=
chmark output)
CONFLICT (content): Merge conflict in kernel/seccomp.c
Merging kspp/for-next/kspp (9ac05ec979cf Merge branch 'for-next/clang/featu=
res' into for-next/kspp)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (994adcbd3714 gnss: drop stray semicolons)
Merging fsi/next (9ab1428dfe2c fsi/sbefifo: Fix reset timeout)
Merging slimbus/for-next (0320ed0a8236 drivers: slimbus: Fix word resposibl=
e -> responsible in slimbus.h)
CONFLICT (content): Merge conflict in drivers/nvmem/Makefile
CONFLICT (content): Merge conflict in drivers/nvmem/Kconfig
Merging nvmem/for-next (76a2b9a8ab44 nvmem: qfprom: Improve the comment abo=
ut regulator setting)
Merging xarray/main (2c7e57a02708 idr test suite: Improve reporting from id=
r_find_test_1)
Merging hyperv/hyperv-next (9de6655cc5a6 drivers: hv: Fix missing error cod=
e in vmbus_connect())
Merging auxdisplay/auxdisplay (c784e46c8445 auxdisplay: Add I2C gpio expand=
er example)
Merging kgdb/kgdb/for-next (83fa2d13d628 kdb: Refactor env variables get/se=
t code)
Merging hmm/hmm (fe07bfda2fb9 Linux 5.12-rc1)
Merging fpga/for-next (92c5ddbc93ab fpga: fpga-bridge: removed repeated wor=
d)
Merging kunit/test (d07f6ca923ea Linux 5.13-rc2)
Merging cfi/cfi/next (6efb943b8616 Linux 5.13-rc1)
Merging kunit-next/kunit (d07f6ca923ea Linux 5.13-rc2)
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mhi/mhi-next (a610f3c65d3b bus: mhi: Wait for M2 state during syste=
m resume)
Merging memblock/for-next (990e6d0e1de8 arm: extend pfn_valid to take into =
accound freed memory map alignment)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (e71ba9452f0b Linux 5.11-rc2)
Merging rust/rust-next (fef0214731cc rust: allow printing in the kernel cra=
te)
CONFLICT (content): Merge conflict in kernel/printk/printk.c
CONFLICT (content): Merge conflict in include/uapi/linux/android/binder.h
CONFLICT (content): Merge conflict in Makefile
Merging cxl/next (54ada34b4dfd Merge branch 'rafael/acpica/cfmws' into for-=
5.14/cxl)
Merging tpmdd-jejb/tpmdd-for-next (69977d1aeeca Merge branch 'tpmdd-fixes' =
into tpmdd-for-next)
Applying: Revert "recordmcount: Correct st_shndx handling"
Merging akpm-current/current (5cfbd260de41 linux-next-pre)
CONFLICT (content): Merge conflict in mm/memcontrol.c
CONFLICT (content): Merge conflict in drivers/block/zram/zram_drv.h
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (40bab418df9a kdump: use vmlinux_build_id to simplify)

--Sig_/X4PFJt5w53a6h77ezdXw+5V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDB3/UACgkQAVBC80lX
0Gy3iAf+LEBO18pGtBqnVTDIkdVa/zI+k6ZTjkKrcfBvudoowP29sTmjjAmZUQg9
GHgVy2I4OHK0zE7p3zfkgh+geqJF/CX3UGe0JihhWYhcE8oYFovEbwu4mdvbUi1l
QZYt4t9/wowWBoJIkYBXIZ5m2gEWFBN+m/EBKmAoDev7ZSjC8SG2mUJNggAvCEKF
IcXfEtCboje6CZGnqGZcu+sHV1X8/BFXwFUEXnafQCoWFo+StK2NtUeD2xn9/rAq
/fJPa+hc2nFO92K96tkob1wslemLWQ3QKtFkyT+p93KCusfZb8+xqr+1PlWEzCrf
BjHl0FmwSV1ED18rIbIoEXCPoMMwnA==
=fpfk
-----END PGP SIGNATURE-----

--Sig_/X4PFJt5w53a6h77ezdXw+5V--
