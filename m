Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB1D39D950
	for <lists+linux-next@lfdr.de>; Mon,  7 Jun 2021 12:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbhFGKKx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Jun 2021 06:10:53 -0400
Received: from ozlabs.org ([203.11.71.1]:50633 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230194AbhFGKKw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 7 Jun 2021 06:10:52 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fz8Gh0Zv7z9sSn;
        Mon,  7 Jun 2021 20:09:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623060540;
        bh=ZHafmkqpx3KsmfujUlQAgRkM4aWKmboKpMIqppvl0zg=;
        h=Date:From:To:Cc:Subject:From;
        b=f9hPW3SUkUsBWK/Mt9SeE56hGcuh0aTbwiWKB+sro5rflVYut/T6skX4FhvmRnh+Y
         IN84amTklBpHMFBLgu4CBFj5BCWXsjPxoIJb+Ivjp54HnOvzZTvVvrfMPJ1N3ymksQ
         QULKhFrIeI3FFjKF22weCrKXsXzcfVCJdym/7XvskVSXR0g0P6siDy5wGBSItAVuPq
         mymYXDsS18yvCcI8dmzgn8xLBJbC4XY0jrytVmv+6xtCEVBWrvdbg75t9laUnYKLQL
         5Z3P+G7IuQEOoTccQ173MmOpvOr6wJTVQlbNn2lT0DPKGF105NQc+ufB7cGkBPYzNI
         wL68Od2ETGu9A==
Date:   Mon, 7 Jun 2021 20:08:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 7
Message-ID: <20210607200859.513ca93a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R6Dk3FoVgg4gTDVhT7=ftvu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/R6Dk3FoVgg4gTDVhT7=ftvu
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210604:

The ext4 tree gained a conflict against Linus' tree.

The drm-misc tree gained conflicts against the drms and, amdgpu trees
and a build failure so I used the version from next-20210604.

The akpm-current tree gained a conflict against the percpu tree.

I dropped 4 patches from the akpm tree that turned up in the arm64 tree.

Non-merge commits (relative to Linus' tree): 7040
 7020 files changed, 569493 insertions(+), 151975 deletions(-)

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
Merging origin/master (614124bea77e Linux 5.13-rc5)
Merging fixes/fixes (c06a2ba62fc4 Merge tag 'docs-5.13-3' of git://git.lwn.=
net/linux)
Merging kbuild-current/fixes (c4681547bcce Linux 5.13-rc3)
Merging arc-current/for-curr (d07f6ca923ea Linux 5.13-rc2)
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
Merging s390-fixes/fixes (8124c8a6b353 Linux 5.13-rc4)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (3822d0670c9d cxgb4: avoid link re-train during TC-MQPRI=
O configuration)
Merging bpf/master (1a8024239dac virtio-net: fix for skb_over_panic inside =
big mode)
Merging ipsec/master (eebd49a4ffb4 xfrm: remove the fragment check for ipv6=
 beet mode)
Merging netfilter/master (1a8024239dac virtio-net: fix for skb_over_panic i=
nside big mode)
Merging ipvs/master (56e4ee82e850 ipvs: ignore IP_VS_SVC_F_HASHED flag when=
 adding service)
Merging wireless-drivers/master (d4826d17b393 mt76: mt7921: remove leftover=
 80+80 HE capability)
Merging mac80211/master (bddc0c411a45 mac80211: Fix NULL ptr deref for inje=
cted rate info)
Merging rdma-fixes/for-rc (404e5a12691f RDMA/mlx4: Do not map the core_cloc=
k page to user space unless enabled)
Merging sound-current/for-linus (9981b20a5e36 ALSA: firewire-lib: fix the c=
ontext to call snd_pcm_stop_xrun())
Merging sound-asoc-fixes/for-linus (f2aff9d54ff6 Merge remote-tracking bran=
ch 'asoc/for-5.13' into asoc-linus)
Merging regmap-fixes/for-linus (8124c8a6b353 Linux 5.13-rc4)
Merging regulator-fixes/for-linus (2e0d6a3170bd Merge remote-tracking branc=
h 'regulator/for-5.13' into regulator-linus)
Merging spi-fixes/for-linus (bb4e7ad42ec0 Merge remote-tracking branch 'spi=
/for-5.13' into spi-linus)
Merging pci-current/for-linus (85aabbd7b315 PCI/MSI: Fix MSIs for generic h=
osts that use device-tree's "msi-map")
Merging driver-core.current/driver-core-linus (f501b6a2312e debugfs: Fix de=
bugfs_read_file_str())
Merging tty.current/tty-linus (8124c8a6b353 Linux 5.13-rc4)
Merging usb.current/usb-linus (6fc1db5e6211 usb: gadget: f_fs: Ensure io_co=
mpletion_wq is idle during unbind)
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (bc96c72df33e USB: serial: ftdi_sio: add=
 NovaTech OrionMX product ID)
Merging usb-chipidea-fixes/for-usb-fixes (a9aecef198fa usb: cdnsp: Fix dead=
lock issue in cdnsp_thread_irq_handler)
Merging phy/fixes (d1ce245fe409 phy: Sparx5 Eth SerDes: check return value =
after calling platform_get_resource())
Merging staging.current/staging-linus (8124c8a6b353 Linux 5.13-rc4)
Merging iio-fixes/fixes-togreg (87f36cbec4e1 iio: accel: bma180: Fix BMA25x=
 bandwidth register values)
Merging char-misc.current/char-misc-linus (757d2e606516 Merge tag 'phy-fixe=
s-5.13' of git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy into=
 char-misc-linus)
Merging soundwire-fixes/fixes (da096fbccd52 soundwire: qcom: fix handling o=
f qcom,ports-block-pack-mode)
Merging thunderbolt-fixes/fixes (8124c8a6b353 Linux 5.13-rc4)
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
Merging dmaengine-fixes/fixes (acbef0922c7d dmaengine: ipu: fix doc warning=
 in ipu_irq.c)
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
Merging kvm-fixes/master (000ac4295339 selftests: kvm: fix overlapping addr=
esses in memslot_perf_test)
Merging kvms390-fixes/master (735931f9a51a MAINTAINERS: add uv.c also to KV=
M/s390)
Merging hwmon-fixes/hwmon (bfa2778c4dea hwmon: (scpi-hwmon) shows the negat=
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
Merging devicetree-fixes/dt/linus (c17611592d96 dt-bindings: More removals =
of type references on common properties)
Merging scsi-fixes/fixes (e57f5cd99ca6 scsi: scsi_devinfo: Add blacklist en=
try for HPE OPEN-V)
Merging drm-fixes/drm-fixes (37e2f2e800dc Merge tag 'drm/tegra/for-5.13-rc5=
' of ssh://git.freedesktop.org/git/tegra/linux into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (b87482dfe800 Revert "i915: us=
e io_mapping_map_user")
Merging mmc-fixes/fixes (c4681547bcce Linux 5.13-rc3)
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
Merging drm-misc-fixes/for-linux-next-fixes (0b78f8bcf495 Revert "fb_defio:=
 Remove custom address_space_operations")
Merging kspp-gustavo/for-next/kspp (40e67c120093 rxrpc: Fix fall-through wa=
rnings for Clang)
Merging kbuild/for-next (c7c90e121e99 kconfig.h: explain IS_MODULE(), IS_EN=
ABLED())
Merging compiler-attributes/compiler-attributes (ca0760e7d79e Compiler Attr=
ibutes: Add continue in comment)
Merging dma-mapping/for-next (a7f3d3d3600c dma-mapping: add unlikely hint t=
o error path in dma_mapping_error)
Merging asm-generic/master (14462376858e Merge branch 'asm-generic-unaligne=
d' into asm-generic)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (1c74bc9c743a Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (219c53215f5e Merge branch 'for-next/sve' into =
for-next/core)
Merging arm-perf/for-next/perf (814be609baae drivers/perf: hisi: Fix data s=
ource control)
Merging arm-soc/for-next (af644ce486a8 ARM: Document merges)
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (b813db6e4b65 Merge branches 'v5.14/drivers' and '=
v5.14/dt64' into for-next)
Merging aspeed/for-next (61fbc42084f4 Merge branches 'wpcm450-for-v5.13', '=
dt-for-v5.13' and 'lpc-for-v5.13' into for-next)
Merging at91/at91-next (65e10c8760aa dt-bindings: watchdog: sama5d4-wdt: ad=
d compatible for sama7g5-wdt)
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
Merging raspberrypi/for-next (fbdcf1d20126 ARM: dts: bcm2711: Add the CEC i=
nterrupt controller)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/bcm2711.dtsi
Merging renesas/next (acad452912fc Merge branch 'renesas-arm-dt-for-v5.14' =
into renesas-next)
Merging reset/reset/next (e207457f9045 reset: brcmstb: Add missing MODULE_D=
EVICE_TABLE)
Merging rockchip/for-next (7bb4870abf84 Merge branch 'v5.14-armsoc/dts32' i=
nto for-next)
Merging samsung-krzk/for-next (fc14c3f36825 Merge branch 'next/defconfig' i=
nto for-next)
Merging scmi/for-linux-next (b83e30834a7a Merge branch 'for-next/scmi' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging stm32/stm32-next (3dab3e1862cf ARM: dts: stm32: fix ltdc pinctrl on=
 microdev2.0-of7)
Merging sunxi/sunxi/for-next (2b4f0bf55549 Merge branches 'sunxi/clk-fixes-=
for-5.13', 'sunxi/dt-for-5.14' and 'sunxi/fixes-for-5.13' into sunxi/for-ne=
xt)
Merging tegra/for-next (6e49cb4501f6 Merge branch for-5.14/arm64/dt into fo=
r-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (69db725cdb2b arm64: dts: ti: k3-am654x/j721e/=
j7200-common-proc-board: Fix MCU_RGMII1_TXC direction)
Merging xilinx/for-next (6efb943b8616 Linux 5.13-rc1)
Merging clk/clk-next (f439944a1d13 Merge branch 'clk-qcom' into clk-next)
Merging clk-imx/for-next (9cfb301be710 clk: imx: scu: add enet rgmii gpr cl=
ocks)
Merging clk-renesas/renesas-clk (790c06cc5df2 clk: renesas: r8a77995: Add Z=
A2 clock)
Merging clk-samsung/for-next (a38fd8748464 Linux 5.12-rc2)
Merging csky/linux-next (280af034a71d csky: Kconfig: Remove unused selects)
Merging h8300/h8300-next (6e5e55227c95 Merge tag 'v5.11' into h8300-next)
Merging m68k/for-next (b44bf9410a69 m68k: defconfig: Update defconfigs for =
v5.13-rc1)
Merging m68knommu/for-next (8124c8a6b353 Linux 5.13-rc4)
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
Merging s390/for-next (2417ce7ef477 Merge branch 'features' into for-next)
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
Merging cifs/for-next (8713902875e2 cifs: do not share tcp servers with dfs=
 mounts)
Merging cifsd/cifsd-for-next (ce95240b5d8c Merge pull request #53 from namj=
aejeon/cifsd-for-next)
Merging configfs/for-next (7fe1e79b59ba configfs: implement the .read_iter =
and .write_iter methods)
Merging ecryptfs/next (682a8e2b41ef Merge tag 'ecryptfs-5.13-rc1-updates' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs)
Merging erofs/dev (ac1c889d37da erofs: clean up file headers & footers)
Merging exfat/dev (b741596468b0 Merge tag 'riscv-for-linus-5.13-mw1' of git=
://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging ext3/for_next (a5882ee966b1 Pull disabling of quotactl_path syscall=
. Merge branch 'for_next_testing' into for_next)
Merging ext4/dev (a492dedb708d ext4: update journal documentation)
CONFLICT (content): Merge conflict in fs/ext4/ioctl.c
Merging f2fs/dev (0d1263207c71 f2fs: clean up /sys/fs/f2fs/<disk>/features)
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (3c9c14338c12 cuse: simplify refcount)
Merging jfs/jfs-next (492109333c29 fs/jfs: Fix missing error code in lmLogI=
nit())
Merging nfs/linux-next (d1b5c230e9cb NFS: FMODE_READ and friends are C macr=
os, not enum types)
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
Merging xfs/for-next (6a180b1d35a0 Merge tag 'inode-walk-cleanups-5.14_2021=
-06-03' of https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux=
 into xfs-5.14-merge)
Merging zonefs/for-next (6980d29ce4da zonefs: fix to update .i_wr_refcnt co=
rrectly in zonefs_open_zone())
Merging iomap/iomap-for-next (6e552494fb90 iomap: remove unused private fie=
ld from ioend)
Merging djw-vfs/vfs-for-next (9b8523423b23 vfs: move __sb_{start,end}_write=
* to fs.h)
Merging file-locks/locks-next (cbe6fc4e0142 fs/locks: remove useless assign=
ment in fcntl_getlk)
Merging vfs/for-next (e8727aec724e Merge branch 'work.misc' into for-next)
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
Merging i3c/i3c/next (0d95f41ebde4 Revert "i3c master: fix missing destroy_=
workqueue() on error in i3c_master_register")
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (8a5823454b86 docs: hwmon: adm1177.rst: av=
oid using ReSt :doc:`foo` markup)
Merging jc_docs/docs-next (acda97acb2e9 docs: convert dax.txt to rst)
Merging v4l-dvb/master (c11669f738f4 docs: userspace-api: media: dvb: repla=
ce some characters)
Merging v4l-dvb-next/master (5b448065febe media: pci: tw5864: avoid usage o=
f some characters)
Merging pm/linux-next (a25ea0c642c2 Merge branches 'pm-core' and 'pm-cpufre=
q' into linux-next)
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
Merging rdma/for-next (5bcf5a59c41e RDMA/rxe: Protext kernel index from use=
r space)
Merging net-next/master (1a42624aecba net: dsa: xrs700x: allow HSR/PRP supe=
rvision dupes for node_table)
CONFLICT (content): Merge conflict in net/core/devlink.c
CONFLICT (content): Merge conflict in drivers/net/virtio_net.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/stmicro/stmmac/s=
tmmac_main.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/intel/igc/igc_ma=
in.c
Merging bpf-next/for-next (cf68fa431d5d libbpf: Fix pr_warn type warnings o=
n 32bit)
Merging ipsec-next/master (a925316af80a net: Remove unnecessary variables)
Merging mlx5-next/mlx5-next (63f9c44bca5e net/mlx5: Add MEMIC operations re=
lated bits)
Merging netfilter-next/master (ebbf5fcb94a7 netdevsim: Fix unsigned being c=
ompared to less than zero)
Merging ipvs-next/master (5fe8e519e44f Merge git://git.kernel.org/pub/scm/l=
inux/kernel/git/pablo/nf-next)
Merging wireless-drivers-next/master (080f9c10c773 ipw2x00: Minor documenta=
tion update)
Merging bluetooth/master (4685d2bb22f6 Bluetooth: use inclusive language wh=
en filtering devices)
Merging mac80211-next/master (77091933e453 net: mdio: ipq8064: enlarge slee=
p after read/write operation)
Merging gfs2/for-next (574c26b5ca1c gfs2: Fix do_gfs2_set_flags description)
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
Merging drm-misc/for-linux-next (d3fae3b3daac dma-buf: drop the _rcu postfi=
x on function names v3)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ttm=
.c
$ git reset --hard HEAD^
Merging next-20210604 version of drm-misc
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ttm=
.c
[master 2e254f68641f] next-20210604/drm-misc
Merging amdgpu/drm-next (5b157c66a77b drm/radeon: Add HD-audio component no=
tifier support (v2))
Merging drm-intel/for-linux-next (07960a4cc44f drm/i915/display: replace IS=
_GEN() in commented code)
Merging drm-tegra/drm/tegra/for-next (ecc583e22d46 drm/tegra: hub: Implemen=
t basic scaling support)
Merging drm-msm/msm-next (b83fb4d242c0 drm/msm/disp: Move various debug log=
s to atomic bucket)
Merging imx-drm/imx-drm/next (fc1e985b67f9 drm/imx: ipuv3-plane: add color =
encoding and range properties)
Merging etnaviv/etnaviv/next (4bfdd2aa67fb drm/etnaviv: rework linear windo=
w offset calculation)
Merging regmap/for-next (5587eb7dbdc2 Merge remote-tracking branch 'regmap/=
for-5.14' into regmap-next)
Merging sound/for-next (64584f329352 ALSA: firewire-motu: add support for h=
ybrid model of MOTU Ultralite mk3)
Merging sound-asoc/for-next (9cb7f0a9a1ef Merge remote-tracking branch 'aso=
c/for-5.14' into asoc-next)
Merging modules/modules-next (2c0f0f363956 module: correctly exit module_ka=
llsyms_on_each_symbol when fn() !=3D 0)
Merging input/next (83b41248ed04 Input: cy8ctmg110_ts - switch to using gpi=
od API)
Merging block/for-next (808d854ca281 Merge branch 'for-5.14/block' into for=
-next)
Merging device-mapper/for-next (f34ee1dce642 dm crypt: Fix zoned block devi=
ce support)
Merging pcmcia/pcmcia-next (e9d503fef7da pcmcia: rsrc_nonstatic: Fix call-b=
ack function as reference formatting)
Merging mmc/next (deafef09e616 mmc: enable UHS voltage switch for SDSC if s=
upported)
Merging mfd/for-mfd-next (495fb48dbd9b mfd: wm831x: Use DEFINE_RES_IRQ_NAME=
D() and DEFINE_RES_IRQ() to simplify code)
Merging backlight/for-backlight-next (6fc632d3e3e0 video: backlight: qcom-w=
led: Add PMI8994 compatible)
Merging battery/for-next (eab4e6d953c1 power: supply: cpcap-charger: get th=
e battery inserted infomation from cpcap-battery)
Merging regulator/for-next (4eb201f97923 Merge remote-tracking branch 'regu=
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
Merging smack/next (0169d8f33ab7 Revert "Smack: Handle io_uring kernel thre=
ad privileges")
Merging tomoyo/master (6efb943b8616 Linux 5.13-rc1)
Merging tpmdd/next (8124c8a6b353 Linux 5.13-rc4)
Merging watchdog/master (c4681547bcce Linux 5.13-rc3)
Merging iommu/next (a2bf39204785 Merge branch 'iommu/fixes' into next)
Merging audit/next (254c8b96c4af audit: add blank line after variable decla=
rations)
Merging devicetree/for-next (67c54655b655 of: unittest: Use DEFINE_RES_MEM(=
) to simplify code)
Merging mailbox/mailbox-for-next (2335f556b3af dt-bindings: mailbox: qcom-i=
pcc: Add compatible for SC7280)
Merging spi/for-next (a8bc69b7fdfa Merge remote-tracking branch 'spi/for-5.=
14' into spi-next)
Merging tip/auto-latest (d2781acb34c7 Merge branch 'linus')
CONFLICT (content): Merge conflict in samples/kprobes/kprobe_example.c
Merging clockevents/timers/drivers/next (8120891105ba dt-bindings: timer: n=
uvoton,npcm7xx: Add wpcm450-timer)
Merging edac/edac-for-next (e8049c4aa5d8 MAINTAINERS: Make Yazen Ghannam ma=
intainer for EDAC-AMD64)
Merging irqchip/irq/irqchip-next (bf06bd2ae89e Merge branch irq/generic_han=
dle_domain_irq-core into irq/irqchip-next)
Merging ftrace/for-next (eb01f5353bda tracing: Handle %.*s in trace_check_v=
printf())
Merging rcu/rcu/next (5587a2080684 torture: Create KCSAN summaries for tort=
ure.sh runs)
Merging kvm/next (a4345a7cecfb Merge tag 'kvmarm-fixes-5.13-1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvm-arm/next (32ab5a5e97da Merge branch kvm-arm64/mmu/MMIO-block-ma=
pping into kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (72476aaa4691 KVM: PPC: Book3S HV: Fix host ra=
dix SLB optimisation with hash guests)
Merging kvms390/next (44bada282190 KVM: s390: fix guarded storage control r=
egister handling)
Merging xen-tip/linux-next (c81d3d246025 xen-pciback: reconfigure also from=
 backend watch handler)
Merging percpu/for-next (4bb1fa3576d5 Merge branch 'for-5.14' into for-next)
Merging workqueues/for-next (f2ccd0a922b3 workqueue: Add back __printf form=
at validation)
Merging drivers-x86/for-next (bc4f3b7f08a7 platform/mellanox: mlxreg-hotplu=
g: Revert "move to use request_irq by IRQF_NO_AUTOEN flag")
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
Merging staging/staging-next (33e82ff2a055 staging: vchiq_core: introduce h=
andle_poll)
Merging iio/togreg (1a919b3a9c69 Merge branch 'ib-iio-i2c-5.13rc1' into tog=
reg - Needed to fix a build issue in the fxls8963af driver)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (46bdcac533cc interconnect: qcom: Add SC7280 interconn=
ect provider driver)
Merging dmaengine/next (340ad031887b dmaengine: ti: omap-dma: Skip pointles=
s cpu_pm context restore on errors)
Merging cgroup/for-next (a29a7b5223a8 Merge branch 'for-5.14' into for-next)
Merging scsi/for-next (17f23af37bb0 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (1ff28f229bc7 Merge branch '5.14/scsi-result' int=
o 5.14/scsi-staging)
Merging vhost/linux-next (7ff6e99e021c virtio_net: disable cb aggressively)
Merging rpmsg/for-next (c86976deb21c Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (40e568f9c88d gpio: gpio-regmap: Use devm_a=
dd_action_or_reset())
Merging gpio-intel/for-next (2b71b66ac041 gpio: wcove: Split error handling=
 for CTRL and IRQ registers)
Merging pinctrl/for-next (025806cc1fa2 Merge branch 'devel' into for-next)
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
Merging kselftest/next (d07f6ca923ea Linux 5.13-rc2)
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
Merging kspp/for-next/kspp (bf02572fb113 Merge branch 'for-next/orphans' in=
to for-next/kspp)
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
Merging auxdisplay/auxdisplay (aecd79c09c2f auxdisplay: Add I2C gpio expand=
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
Merging cxl/next (6630d31c912e cxl/mem: Get rid of @cxlm.base)
Merging tpmdd-jejb/tpmdd-for-next (69977d1aeeca Merge branch 'tpmdd-fixes' =
into tpmdd-for-next)
Merging akpm-current/current (a29b73f3f2ee linux-next-pre)
CONFLICT (content): Merge conflict in mm/memcontrol.c
CONFLICT (content): Merge conflict in drivers/block/zram/zram_drv.h
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --a=
bort".
CONFLICT (content): Merge conflict in arch/arm64/include/asm/page.h
Merging akpm/master (1134591282e8 kdump: use vmlinux_build_id to simplify)

--Sig_/R6Dk3FoVgg4gTDVhT7=ftvu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC98DsACgkQAVBC80lX
0GwXBQgAiW630uiXsycTyPwy+cVECRcUAuNncydiK68Yh98rvmQz0v8oHHeFCNnz
dYC/bSME32g70TGhljt3TbE0GpyhyigAeprRt1ubxcaStYGWrTaeDeJM3aynXaRQ
G1mSSazG7mV+0OHFYUkrE5u3SSENQWfQ76ybffl7BbZ7ARps6QXHCdlice8bax75
ktb2XL2ZOg0d0A6eXuPt/ZyQzpisccJn9JFL9zMJoadNL+BtkzS9zs3+y5Gcz1vF
8LW7Ter6H/JWgXvJ8+PELB9qVfBBYgHWqf06ZBcy2nGKduisSm+w4CjU96Hvsj4T
Cr5ygciTiquUcovVOVnVEph+w3NfVw==
=Kfjw
-----END PGP SIGNATURE-----

--Sig_/R6Dk3FoVgg4gTDVhT7=ftvu--
