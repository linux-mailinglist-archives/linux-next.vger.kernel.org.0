Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A33C13A7A7D
	for <lists+linux-next@lfdr.de>; Tue, 15 Jun 2021 11:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbhFOJab (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Jun 2021 05:30:31 -0400
Received: from ozlabs.org ([203.11.71.1]:51435 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230242AbhFOJab (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Jun 2021 05:30:31 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G430865HMz9sT6;
        Tue, 15 Jun 2021 19:28:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623749304;
        bh=U9Prmmi5dhiMMsGNbWxSArmuT1uNAC7zIUVOmWzF4I0=;
        h=Date:From:To:Cc:Subject:From;
        b=JzougBDlgLMcWSkmwJ6q7dJnQhqL2aMXnoMWk9ZKqTRAuk+O+FVNWJY3nHD/rjRGX
         RMcAfHSUNVIrjCif9kWuQWwHr07L1wPXggeWBZ6hlboscZO3Sr0svfLJ3OavxinNKP
         f1D5k9S6vprPIVuoHn8dgy1GlyPKM/BFRRAKbR02fwcy0jSxUb0iV4e0ZiTVL2AW1D
         obobE7DKgGpY0kDNpwn3PccDC7yXY89mV1aPC8fYhrswxyy78e/nDNbC3ay83xEOss
         +Oft3XF6jkgRRkElBs8ubgTOgNnHVqQ4ufEuLxSxQEPpKYR90U9CoEed6W8q42awKk
         twpzve4WHeE8A==
Date:   Tue, 15 Jun 2021 19:28:24 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 15
Message-ID: <20210615192824.2ef6d411@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Pp5SZ8W6PZnapVYDp9pPLmS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Pp5SZ8W6PZnapVYDp9pPLmS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210611:

The usb.current tree lost its build failure.

The arm64 tree gained a conflict against the arm tree.

The risc-v tree gained conflicts against Linus' tree.

The crypto tree gained a conflict against Linus' tree.

The sound-asoc tree gained a build failure for which I reverted a commit.

The devicetree tree gained a conflict against the mtd tree.

Non-merge commits (relative to Linus' tree): 9177
 8878 files changed, 654505 insertions(+), 186882 deletions(-)

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
Merging origin/master (009c9aa5be65 Linux 5.13-rc6)
Merging fixes/fixes (614124bea77e Linux 5.13-rc5)
Merging kbuild-current/fixes (c4681547bcce Linux 5.13-rc3)
Merging arc-current/for-curr (110febc0148f ARC: fix CONFIG_HARDENED_USERCOP=
Y)
Merging arm-current/fixes (dad7b9896a5d ARM: 9081/1: fix gcc-10 thumb2-kern=
el regression)
Merging arm64-fixes/for-next/fixes (e69012400b0c arm64: mm: don't use CON a=
nd BLK mapping if KFENCE is enabled)
Merging arm-soc-fixes/arm/fixes (e60cb06cde7e Merge tag 'v5.13-rockchip-dts=
fixes1' of git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockch=
ip into arm/fixes)
Merging drivers-memory-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging m68k-current/for-linus (34e5269bf987 m68k: sun3x: Remove unneeded s=
emicolon)
Merging powerpc-fixes/fixes (e41d6c3f4f9b powerpc/signal64: Copy siginfo be=
fore changing regs->nip)
Merging s390-fixes/fixes (1874cb13d5d7 s390/mcck: fix invalid KVM guest con=
dition check)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (2214fb53006e net: mhi_net: Update the transmit handler =
prototype)
Merging bpf/master (11fc79fc9f2e libbpf: Fixes incorrect rx_ring_setup_done)
Merging ipsec/master (eebd49a4ffb4 xfrm: remove the fragment check for ipv6=
 beet mode)
Merging netfilter/master (f4cdcae03f9c Merge branch 'cxgb4-fixes')
Merging ipvs/master (1a8024239dac virtio-net: fix for skb_over_panic inside=
 big mode)
Merging wireless-drivers/master (1f9482aa8d41 mwifiex: bring down link befo=
re deleting interface)
Merging mac80211/master (f4cdcae03f9c Merge branch 'cxgb4-fixes')
Merging rdma-fixes/for-rc (2ba0aa2feebd IB/mlx5: Fix initializing CQ fragme=
nts buffer)
Merging sound-current/for-linus (83e197a8414c ALSA: seq: Fix race of snd_se=
q_timer_open())
Merging sound-asoc-fixes/for-linus (a29b6e1d84a3 Merge remote-tracking bran=
ch 'asoc/for-5.13' into asoc-linus)
Merging regmap-fixes/for-linus (614124bea77e Linux 5.13-rc5)
Merging regulator-fixes/for-linus (9843417fd177 Merge remote-tracking branc=
h 'regulator/for-5.13' into regulator-linus)
Merging spi-fixes/for-linus (475e2f1a8b47 Merge remote-tracking branch 'spi=
/for-5.13' into spi-linus)
Merging pci-current/for-linus (7bf3c2ae58ac PCI: Add ACS quirk for Broadcom=
 BCM57414 NIC)
Merging driver-core.current/driver-core-linus (009c9aa5be65 Linux 5.13-rc6)
Merging tty.current/tty-linus (009c9aa5be65 Linux 5.13-rc6)
Merging usb.current/usb-linus (009c9aa5be65 Linux 5.13-rc6)
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (63a8eef70ccb USB: serial: cp210x: fix C=
P2102N-A01 modem control)
Merging usb-chipidea-fixes/for-usb-fixes (a9aecef198fa usb: cdnsp: Fix dead=
lock issue in cdnsp_thread_irq_handler)
Merging phy/fixes (d1ce245fe409 phy: Sparx5 Eth SerDes: check return value =
after calling platform_get_resource())
Merging staging.current/staging-linus (009c9aa5be65 Linux 5.13-rc6)
Merging iio-fixes/fixes-togreg (e9de1ecadeab staging: ralink-gdma: Remove i=
ncorrect author information)
Merging char-misc.current/char-misc-linus (009c9aa5be65 Linux 5.13-rc6)
Merging soundwire-fixes/fixes (da096fbccd52 soundwire: qcom: fix handling o=
f qcom,ports-block-pack-mode)
Merging thunderbolt-fixes/fixes (009c9aa5be65 Linux 5.13-rc6)
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
Merging omap-fixes/fixes (78b4b165280d ARM: dts: dra7: Fix duplicate USB4 t=
arget module node)
Merging kvm-fixes/master (654430efde27 KVM: x86/mmu: Calculate and check "f=
ull" mmu_role for nested MMU)
Merging kvms390-fixes/master (735931f9a51a MAINTAINERS: add uv.c also to KV=
M/s390)
Merging hwmon-fixes/hwmon (009c9aa5be65 Linux 5.13-rc6)
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
Merging drm-fixes/drm-fixes (7de5c0d70c77 Merge tag 'amd-drm-fixes-5.13-202=
1-06-09' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (009c9aa5be65 Linux 5.13-rc6)
Merging mmc-fixes/fixes (103a5348c22c mmc: meson-gx: use memcpy_to/fromio f=
or dram-access-quirk)
Merging rtc-fixes/rtc-fixes (bd33335aa93d rtc: cmos: Disable irq around dir=
ect invocation of cmos_interrupt())
Merging gnss-fixes/gnss-linus (a38fd8748464 Linux 5.12-rc2)
Merging hyperv-fixes/hyperv-fixes (6efb943b8616 Linux 5.13-rc1)
Merging soc-fsl-fixes/fix (2663b3388551 soc: fsl: dpio: Get the cpumask thr=
ough cpumask_of(cpu))
Merging risc-v-fixes/fixes (01f5315dd732 riscv: sifive: fix Kconfig errata =
warning)
Merging pidfd-fixes/fixes (03ba0fe4d09f file: simplify logic in __close_ran=
ge())
Merging fpga-fixes/fixes (2e8496f31d0b firmware: stratix10-svc: reset COMMA=
ND_RECONFIG_FLAG_PARTIAL to 0)
Merging spdx/spdx-linus (009c9aa5be65 Linux 5.13-rc6)
Merging gpio-brgl-fixes/gpio/for-current (dbec64b11c65 gpio: wcd934x: Fix s=
hift-out-of-bounds error)
Merging gpio-intel-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging pinctrl-intel-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging erofs-fixes/fixes (0852b6ca941e erofs: fix 1 lcluster-sized pcluste=
r for big pcluster)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (87c9c1631788 kunit: tool: add support for =
QEMU)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (17cbe03872be mm/memblock: Fix typo in comment=
 of memblock_phys_alloc_try_nid())
Merging cel-fixes/for-rc (9f4ad9e425a1 Linux 5.12)
Merging drm-misc-fixes/for-linux-next-fixes (c336a5ee9847 drm: Lock pointer=
 access in drm_master_release())
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
Merging arm/for-next (c1f2512f7318 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (52fe80c09091 Merge branch 'for-next/sve' into =
for-next/core)
CONFLICT (content): Merge conflict in arch/arm64/kernel/process.c
Merging arm-perf/for-next/perf (64432f09068a arm64: perf: Simplify EVENT AT=
TR macro in perf_event.c)
Merging arm-soc/for-next (ccd71bdbd838 ARM: Document merges)
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (b03485fe99f2 Merge tags 'amlogic-arm64-dt-for-v5.=
14-v2' and 'amlogic-arm-dt-for-v5.14' into for-next)
Merging aspeed/for-next (cd946cfe2e7e Merge branches 'defconfig-for-v5.14' =
and 'dt-for-v5.14' into for-next)
Merging at91/at91-next (80cbaa6d3450 Merge branches 'at91-dt' and 'at91-def=
config' into at91-next)
Merging drivers-memory/for-next (ee5d678b1fac Merge branch 'for-v5.14/tegra=
-mc' into for-next)
Merging imx-mxs/for-next (5004b2d18827 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (9d2e21ed98a2 Merge branch 'for_5.12/drivers-soc' int=
o next)
Merging mediatek/for-next (a1c8c49de3d7 Merge branch 'v5.13-next/soc' into =
for-next)
Merging mvebu/for-next (79e93f9dc81a Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (91ee322340fb Merge branch 'omap-for-v5.14/dt' into f=
or-next)
Merging qcom/for-next (902ff426e4bb Merge branches 'arm64-defconfig-for-5.1=
4', 'arm64-for-5.14', 'drivers-for-5.14' and 'dts-for-5.14' into for-next)
Merging raspberrypi/for-next (21c6bf8304f0 arm64: dts: broadcom: Add refere=
nce to RPi 400)
Merging renesas/next (23df6d1f0971 Merge branches 'renesas-arm-defconfig-fo=
r-v5.14', 'renesas-arm-dt-for-v5.14', 'renesas-drivers-for-v5.14' and 'rene=
sas-dt-bindings-for-v5.14' into renesas-next)
Merging reset/reset/next (48a74b1147f7 reset: Add compile-test stubs)
Merging rockchip/for-next (e4d55a2e7660 Merge branch 'v5.14-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (5ce16705e00d Merge branch 'next/defconfig' i=
nto for-next)
Merging scmi/for-linux-next (b4364f5d874e Merge tag 'juno-fix-5.14' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-linux=
-next)
Merging stm32/stm32-next (4bf4abe19089 ARM: dts: stm32: fix stpmic node for=
 stm32mp1 boards)
Merging sunxi/sunxi/for-next (3f1c53207cf0 Merge branches 'sunxi/dt-for-5.1=
4' and 'sunxi/fixes-for-5.13' into sunxi/for-next)
Merging tegra/for-next (eac9ab885bb5 Merge branch for-5.14/arm64/dt into fo=
r-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (d65f069e50a3 arm64: dts: ti: Drop reg-io-widt=
h/reg-shift from UART nodes)
Merging xilinx/for-next (6efb943b8616 Linux 5.13-rc1)
Merging clk/clk-next (f09119823f43 Merge branch 'clk-vc5' into clk-next)
Merging clk-imx/for-next (c586f53ae159 clk: imx8mq: remove SYS PLL 1/2 cloc=
k gates)
Merging clk-renesas/renesas-clk (17f0ff3d49ff clk: renesas: Add support for=
 R9A07G044 SoC)
Merging clk-samsung/for-next (a38fd8748464 Linux 5.12-rc2)
Merging csky/linux-next (280af034a71d csky: Kconfig: Remove unused selects)
Merging h8300/h8300-next (6e5e55227c95 Merge tag 'v5.11' into h8300-next)
Merging m68k/for-next (c1367ee016e3 m68k: atari: Fix ATARI_KBD_CORE kconfig=
 unmet dependency warning)
Merging m68knommu/for-next (2b5b8db1d0c2 m68knommu: fix missing LCD splash =
screen data initializer)
Merging microblaze/next (14a832498c23 arch: microblaze: Fix spelling mistak=
e "vesion" -> "version")
Merging mips/mips-next (0fe0fbc86711 MIPS: ingenic: rs90: Add dedicated VRA=
M memory region)
Merging nds32/next (40e0dd851e7b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (ad4e600cbf89 drivers/soc/litex: remove 8-bit sub=
register option)
Merging parisc-hd/for-next (9f4ad9e425a1 Linux 5.12)
Merging powerpc/next (027f55e87c30 tty: hvc: udbg_hvc: retry putc on -EAGAI=
N)
Merging soc-fsl/next (242b0b398ccd soc: fsl: enable acpi support in RCPM dr=
iver)
Merging risc-v/for-next (0918a3c9b00b riscv: add ASID-based tlbflushing met=
hods)
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
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
Merging fscrypt/master (2fc2b430f559 fscrypt: fix derivation of SipHash key=
s on big endian CPUs)
Merging fscache/fscache-next (3003bbd0697b afs: Use the netfs_write_begin()=
 helper)
Merging afs/afs-next (7af08140979a Revert "gcov: clang: fix clang-11+ build=
")
Merging btrfs/for-next (e1bde17d1592 Merge branch 'for-next-next-v5.13-2021=
0601' into for-next-20210601)
CONFLICT (content): Merge conflict in fs/btrfs/tree-log.c
Merging ceph/master (1b269bcade7c libceph: fix doc warnings in cls_lock_cli=
ent.c)
Merging cifs/for-next (93223fc8b35a cifs: decoding negTokenInit with generi=
c ASN1 decoder)
Merging cifsd/cifsd-for-next (be8bcf8baaec Merge pull request #55 from namj=
aejeon/cifsd-for-next)
Merging configfs/for-next (7fe1e79b59ba configfs: implement the .read_iter =
and .write_iter methods)
Merging ecryptfs/next (682a8e2b41ef Merge tag 'ecryptfs-5.13-rc1-updates' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs)
Merging erofs/dev (c5fcb51111b8 erofs: clean up file headers & footers)
Merging exfat/dev (5264f724cf1f exfat: handle wrong stream entry size in ex=
fat_readdir())
Merging ext3/for_next (d9e26b2de216 Pull fanotify fd leak fix.)
Merging ext4/dev (a492dedb708d ext4: update journal documentation)
CONFLICT (content): Merge conflict in fs/ext4/ioctl.c
Merging f2fs/dev (a529f200d4f9 f2fs: swap: support migrating swapfile in al=
igned write mode)
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (e4a9ccdd1c03 fuse: Fix infinite loop in sget_fc())
Merging jfs/jfs-next (492109333c29 fs/jfs: Fix missing error code in lmLogI=
nit())
Merging nfs/linux-next (009c9aa5be65 Linux 5.13-rc6)
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
Merging xfs/for-next (e0d2d97b5477 xfs: remove redundant initialization of =
variable error)
Merging zonefs/for-next (6980d29ce4da zonefs: fix to update .i_wr_refcnt co=
rrectly in zonefs_open_zone())
Merging iomap/iomap-for-next (6e552494fb90 iomap: remove unused private fie=
ld from ioend)
Merging djw-vfs/vfs-for-next (9b8523423b23 vfs: move __sb_{start,end}_write=
* to fs.h)
Merging file-locks/locks-next (cbe6fc4e0142 fs/locks: remove useless assign=
ment in fcntl_getlk)
Merging vfs/for-next (1130294f1440 Merge branch 'work.iov_iter' into for-ne=
xt)
Merging printk/for-next (7e4e0a140346 Merge branch 'for-5.14-vsprintf-scanf=
' into for-next)
Merging pci/next (246262582772 Merge branch 'remotes/lorenzo/pci/xgene')
Merging pstore/for-next/pstore (38c18fec13fb pstore/blk: Use the normal blo=
ck device I/O path)
Merging hid/for-next (93949ffbee0e Merge branch 'for-5.14/intel-ish' into f=
or-next)
Merging i2c/i2c/for-next (481d571969ab Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i3c/i3c/next (3e5feb11a829 i3c: master: svc: fix doc warning in svc=
-i3c-master.c)
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (8e6f6d9d0e9e hwmon: (ntc_thermistor) Drop=
 unused headers.)
Merging jc_docs/docs-next (05a463ec1bd4 docs: cputopology: move the sysfs A=
BI description to right place)
Merging v4l-dvb/master (45040f675041 media: hantro: IMX8M: add variant for =
G2/HEVC codec)
Merging v4l-dvb-next/master (4c6e0976295a media: uvcvideo: Fix pixel format=
 change for Elgato Cam Link 4K)
Merging pm/linux-next (a206065a8406 Merge branch 'pm-cpufreq-fixes' into li=
nux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (9821a195d4e2 dt-bindings: cpufr=
eq: update cpu type and clock name for MT8173 SoC)
Merging cpupower/cpupower (d07f6ca923ea Linux 5.13-rc2)
Merging devfreq/devfreq-next (64f4d903ce9d dt-bindings: devfreq: tegra30-ac=
tmon: Add cooling-cells)
Merging opp/opp/linux-next (ac9fd3c80340 opp: use list_del_init instead of =
list_del/INIT_LIST_HEAD)
Merging thermal/thermal/linux-next (c310e546164d thermal/drivers/mtk_therma=
l: Remove redundant initializations of several variables)
Merging dlm/next (957adb68b3f7 fs: dlm: invalid buffer access in lookup err=
or)
Merging swiotlb/linux-next (dfc06b389a4f swiotlb: don't override user speci=
fied size in swiotlb_adjust_size)
Merging rdma/for-next (2db7b2eac7ad RDMA/irdma: Store PBL info address a po=
inter type)
Merging net-next/master (89212e160b81 net: wwan: Fix WWAN config symbols)
Merging bpf-next/for-next (ca16b429f39b tools/bpftool: Fix error return cod=
e in do_batch())
Merging ipsec-next/master (3ca5ca83e206 xfrm: merge dstopt and routing hdro=
ff functions)
Merging mlx5-next/mlx5-next (63f9c44bca5e net/mlx5: Add MEMIC operations re=
lated bits)
Merging netfilter-next/master (a212d9f33ed0 Merge branch 'iosm-driver')
Merging ipvs-next/master (e2cf17d3774c netfilter: add new hook nfnl subsyst=
em)
Merging wireless-drivers-next/master (01de6fe49ca4 wlcore: fix read pointer=
 update)
Merging bluetooth/master (1bedbe4aa1e5 Bluetooth: Fix Set Extended (Scan Re=
sponse) Data)
Merging mac80211-next/master (77091933e453 net: mdio: ipq8064: enlarge slee=
p after read/write operation)
Merging gfs2/for-next (8b38a9ace341 gfs2: Fix mmap + page fault deadlocks (=
part 2))
CONFLICT (content): Merge conflict in lib/iov_iter.c
CONFLICT (content): Merge conflict in include/linux/uio.h
CONFLICT (content): Merge conflict in Documentation/filesystems/porting.rst
Merging mtd/mtd/next (6aa12138cd9a mtd: Convert list_for_each to entry vari=
ant)
Merging nand/nand/next (c9723c7da546 mtd: rawnand: omap: Add larger page NA=
ND chips support)
Merging spi-nor/spi-nor/next (c6ec3e1e3a85 mtd: spi-nor: otp: implement era=
se for Winbond and similar flashes)
Merging crypto/master (0dc64297c8ac crypto: cavium/nitrox - Fix an error rh=
andling path in 'nitrox_probe()')
CONFLICT (content): Merge conflict in drivers/crypto/cavium/nitrox/nitrox_m=
ain.c
Merging drm/drm-next (1bd8a7dc28c1 Merge tag 'exynos-drm-next-for-v5.14' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into drm-=
next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ctx=
.c
Merging drm-misc/for-linux-next (1bd8a7dc28c1 Merge tag 'exynos-drm-next-fo=
r-v5.14' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exyno=
s into drm-next)
Merging amdgpu/drm-next (6eb6d9cb35ed drm/radeon: Add HD-audio component no=
tifier support (v2))
Merging drm-intel/for-linux-next (1bd8a7dc28c1 Merge tag 'exynos-drm-next-f=
or-v5.14' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exyn=
os into drm-next)
Merging drm-tegra/drm/tegra/for-next (a562c0783b5f drm/tegra: Don't call SE=
T_APPLICATION_ID in VIC boot)
Merging drm-msm/msm-next (aabf679c9a4e drm/msm/disp/dpu1: avoid perf update=
 in frame done event)
Merging imx-drm/imx-drm/next (fc1e985b67f9 drm/imx: ipuv3-plane: add color =
encoding and range properties)
Merging etnaviv/etnaviv/next (989c9dad6131 drm/etnaviv: add HWDB entry for =
GC7000 rev 6204)
Merging regmap/for-next (d17032f2befa Merge remote-tracking branch 'regmap/=
for-5.14' into regmap-next)
Merging sound/for-next (e381a14c3e3a ALSA: control_led - fix initialization=
 in the mode show callback)
Merging sound-asoc/for-next (023353ef3d41 Merge remote-tracking branch 'aso=
c/for-5.14' into asoc-next)
Merging modules/modules-next (2c0f0f363956 module: correctly exit module_ka=
llsyms_on_each_symbol when fn() !=3D 0)
Merging input/next (83b41248ed04 Input: cy8ctmg110_ts - switch to using gpi=
od API)
Merging block/for-next (195c460f80c9 Merge branch 'for-5.14/drivers' into f=
or-next)
Merging device-mapper/for-next (8c77f1cb8458 dm writecache: use list_move i=
nstead of list_del/list_add in writecache_writeback())
Merging pcmcia/pcmcia-next (e9d503fef7da pcmcia: rsrc_nonstatic: Fix call-b=
ack function as reference formatting)
Merging mmc/next (a986f00936b9 Merge branch 'fixes' into next)
Merging mfd/for-mfd-next (495fb48dbd9b mfd: wm831x: Use DEFINE_RES_IRQ_NAME=
D() and DEFINE_RES_IRQ() to simplify code)
Merging backlight/for-backlight-next (6fc632d3e3e0 video: backlight: qcom-w=
led: Add PMI8994 compatible)
Merging battery/for-next (eab4e6d953c1 power: supply: cpcap-charger: get th=
e battery inserted infomation from cpcap-battery)
Merging regulator/for-next (aa99cd8cd54e Merge remote-tracking branch 'regu=
lator/for-5.14' into regulator-next)
Merging security/next-testing (047843bdb316 Merge branch 'landlock_lsm_v34'=
 into next-testing)
Merging apparmor/apparmor-next (d108370c644b apparmor: fix error check)
Merging integrity/next-integrity (c67913492fec ima: Fix warning: no previou=
s prototype for function 'ima_add_kexec_buffer')
Merging keys/keys-next (e377c31f788f integrity: Load mokx variables into th=
e blacklist keyring)
CONFLICT (content): Merge conflict in certs/system_keyring.c
Merging safesetid/safesetid-next (1b8b71922919 LSM: SafeSetID: Mark safeset=
id_initialized as __initdata)
Merging selinux/next (d99cf13f1420 selinux: kill 'flags' argument in avc_ha=
s_perm_flags() and avc_audit())
Merging smack/next (fe6bde732be8 Smack: fix doc warning)
Merging tomoyo/master (6efb943b8616 Linux 5.13-rc1)
Merging tpmdd/next (8124c8a6b353 Linux 5.13-rc4)
Merging watchdog/master (c4681547bcce Linux 5.13-rc3)
Merging iommu/next (ed3995c9d0a2 Merge branches 'iommu/fixes', 'arm/rockchi=
p', 'x86/vt-d', 'x86/amd' and 'core' into next)
Merging audit/next (0ecc617858fc audit: remove unnecessary 'ret' initializa=
tion)
Merging devicetree/for-next (810e4441946c dt-bindings: aspeed-i2c: Convert =
txt to yaml format)
CONFLICT (modify/delete): Documentation/devicetree/bindings/mtd/ti,am654-hb=
mc.txt deleted in HEAD and modified in devicetree/for-next. Version devicet=
ree/for-next of Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt lef=
t in tree.
$ git rm -f Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
Merging mailbox/mailbox-for-next (2335f556b3af dt-bindings: mailbox: qcom-i=
pcc: Add compatible for SC7280)
Merging spi/for-next (900fae4f8a16 Merge remote-tracking branch 'spi/for-5.=
14' into spi-next)
Merging tip/auto-latest (65ff382d8732 Merge branch 'efi/core')
CONFLICT (content): Merge conflict in samples/kprobes/kprobe_example.c
Merging clockevents/timers/drivers/next (a6d0e682c6ba arm: zynq: don't disa=
ble CONFIG_ARM_GLOBAL_TIMER due to CONFIG_CPU_FREQ anymore)
Merging edac/edac-for-next (e8049c4aa5d8 MAINTAINERS: Make Yazen Ghannam ma=
intainer for EDAC-AMD64)
Merging irqchip/irq/irqchip-next (c51e96dace68 Merge branch irq/irqchip-dri=
ver-updates into irq/irqchip-next)
Merging ftrace/for-next (ee0a07017ae3 Documentation: tracing: Add per-group=
/all events enablement desciption)
Merging rcu/rcu/next (4e11cf2732e3 rcu/doc: Add a quick quiz to explain fur=
ther why we need smp_mb__after_unlock_lock())
Merging kvm/next (a4345a7cecfb Merge tag 'kvmarm-fixes-5.13-1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvm-arm/next (fbba7e69b061 Merge branch kvm-arm64/selftest/debug in=
to kvmarm-master/next)
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
Merging driver-core/driver-core-next (68afbd8459e9 Merge tag 'v5.13-rc6' in=
to driver-core-next)
Merging usb/usb-next (37fdb7c90f8c Merge tag 'v5.13-rc6' into usb-next)
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (17cd3a106e97 USB: serial: drop irq-flags initi=
alisations)
Merging usb-chipidea-next/for-usb-next (33e99b65a134 usb: cdns3: cdns3-gadg=
et: Use list_move_tail instead of list_del/list_add_tail)
Merging tty/tty-next (99289bf1a76c Merge tag 'v5.13-rc6' into tty-next)
Merging char-misc/char-misc-next (db4e54aefdfe Merge tag 'v5.13-rc6' into c=
har-misc-next)
Merging extcon/extcon-next (b792cb11d39f extcon: sm5502: Add support for SM=
5504)
Merging phy-next/next (1ed9e566f3d7 MAINTAINERS: update marvell,armada-3700=
-utmi-phy.yaml reference)
Merging soundwire/next (29a269c6f548 soundwire: intel: move to auxiliary bu=
s)
Merging thunderbolt/next (135794868ad8 thunderbolt: Add support for Intel A=
lder Lake)
Merging vfio/next (adaeb718d46f vfio/gvt: fix DRM_I915_GVT dependency on VF=
IO_MDEV)
Merging staging/staging-next (23f89b127532 Merge tag 'v5.13-rc6' into stagi=
ng-next)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging iio/togreg (b5af95a8e38a iio: prox: isl29501: Fix buffer alignment =
in iio_push_to_buffers_with_timestamp())
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (46bdcac533cc interconnect: qcom: Add SC7280 interconn=
ect provider driver)
Merging dmaengine/next (2e5c09d19e63 dmaengine: sun4i: Use list_move_tail i=
nstead of list_del/list_add_tail)
Merging cgroup/for-next (cfeaa699186e Merge branch 'for-5.13-fixes' into fo=
r-next)
Merging scsi/for-next (936c600e28f3 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (49d3e5996155 scsi: fc: FDMI enhancement)
Merging vhost/linux-next (7ff6e99e021c virtio_net: disable cb aggressively)
Merging rpmsg/for-next (ab3a29a6b253 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (be4dc321a55c gpio: gpio-xilinx: update on =
suspend and resume calls)
Merging gpio-intel/for-next (043d7f09bf61 gpiolib: acpi: Add acpi_gpio_get_=
io_resource())
Merging pinctrl/for-next (b10479c0dd52 Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in include/linux/pinctrl/pinconf-generic=
.h
Merging pinctrl-intel/for-next (258435a1c818 pinctrl: tigerlake: Add Alder =
Lake-M ACPI ID)
Merging pinctrl-renesas/renesas-pinctrl (c3975a73ca94 pinctrl: renesas: r8a=
77980: Add bias pinconf support)
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
Merging ntb/ntb-next (28293b6c68cd ntb: ntb_pingpong: remove redundant init=
ialization of variables msg_data and spad_data)
Merging seccomp/for-next/seccomp (fe092fc9f14b selftests/seccomp: Flush ben=
chmark output)
CONFLICT (content): Merge conflict in kernel/seccomp.c
Merging kspp/for-next/kspp (a0dc429c3e36 Merge branch 'for-next/clang/featu=
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
Merging mhi/mhi-next (f976d9d8c4cc bus: mhi: pci-generic: Add missing 'pci_=
disable_pcie_error_reporting()' calls)
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
Merging cxl/next (40ba17afdfab cxl/acpi: Introduce cxl_decoder objects)
Merging tpmdd-jejb/tpmdd-for-next (69977d1aeeca Merge branch 'tpmdd-fixes' =
into tpmdd-for-next)
Applying: Revert "ASoC: codecs: wcd938x: add audio routing and Kconfig"
Merging akpm-current/current (1308cebebae1 linux-next-pre)
CONFLICT (content): Merge conflict in mm/memcontrol.c
CONFLICT (content): Merge conflict in drivers/block/zram/zram_drv.h
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (e70986cc73e4 kdump: use vmlinux_build_id to simplify)

--Sig_/Pp5SZ8W6PZnapVYDp9pPLmS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDIcrgACgkQAVBC80lX
0Gx4XggAhOLF4LRupEvq9V31DtLIa+6HCmrBvTRK3i3c6WHlQMcUF+2rPwQpsW0+
UTqInqrXn/8vx96AzcOcIPib/eJvvkhKV4X9aKTq5JwHOJLMTcbdyp9N/yBOSy/O
h++DCNuZCj1+EmIeGUvu6pnfzj9BwJ8woKhNToqm67URQDbyWw4EMo33UOXEyE+n
7vxgWLZ9pNvGZFt9nbMxUPwRoGaIIXOizmz7ufW1ebvq1hpBkL0Rt6OpDWwNK869
7CqR4vZx0fpfjUoGugm0TbRz+C/QLnHb/CjGGM/NIXGyUCLRGtO79uZ7nAGECZCD
s1qbOXl40SjRImUshYstp/jOYXz3Aw==
=0c7f
-----END PGP SIGNATURE-----

--Sig_/Pp5SZ8W6PZnapVYDp9pPLmS--
