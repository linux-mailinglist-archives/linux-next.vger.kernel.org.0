Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0CD3B02AE
	for <lists+linux-next@lfdr.de>; Tue, 22 Jun 2021 13:23:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbhFVLZ0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Jun 2021 07:25:26 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:49651 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229567AbhFVLZP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Jun 2021 07:25:15 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G8PC53J72z9sWX;
        Tue, 22 Jun 2021 21:22:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624360977;
        bh=dj7B6IR7iIKQwVTE8vAg+VGgcGqlUcjwZWoOA0Z5y54=;
        h=Date:From:To:Cc:Subject:From;
        b=QwHV/r5CX/fDocmNwDjPGNaQS4G1aW5Yq9Tc6VD7vcnk3M2RH+Bu6e/xAvO8DnD4h
         oqIVJQjIQ4sMCwG7VrGoflR4yTygV8LIl+KmOFplEtbDH3II6XYjeqGSoQm+/vF8zQ
         Jtk+GzLF/GSlo4R+kOkeuktVJpfsx93miQlqIKZO9jo9chs0WlyZQQK3gRffZKSKTx
         /mcDP2joVJ4+CF0lVeqTiumOD4iBX6/w6rH/E73kn5Arci1SS3t/6tisiebf5szhMs
         V2xQ/+3jn3beHhSiHKmTvnw589pLTmQHdRhl8ndfA/CFBmXqDyvH+5cCfeSy2R+dGR
         KukR9U7S8nHkA==
Date:   Tue, 22 Jun 2021 21:22:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 22
Message-ID: <20210622212254.0c9ccf63@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/F/T6l9B/GE9UR6sZMgUtiW.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/F/T6l9B/GE9UR6sZMgUtiW.
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210621:

The net-next tree gained conflicts against the bpf tree.

The drm-msm tree still had its build failure so I used the version from
next-20210617.

The watchdog tree lost its build failure.

The devicetree tree gained conflicts against Linus' and the drm,
arm-soc trees.

The irqchip tree gained a semantic conflict against the powerpc tree
for which I applied a merge fix patch.

The rcu tree gained conflicts against the tip tree.

The kvm tree gained a conflict against the powerpc tree.

The kvm-arm tree gained a conflict against the kvm tree.

The soundwire tree gained a conflict against the sound-asoc-fixes tree.

The gpio-brgl tree gained a conflict against the devicetree tree.

The akpm tree still had its build failures.

Non-merge commits (relative to Linus' tree): 11282
 10639 files changed, 698378 insertions(+), 319588 deletions(-)

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
Merging origin/master (a96bfed64c89 Merge tag 'for-linus' of git://git.arml=
inux.org.uk/~rmk/linux-arm)
Merging fixes/fixes (614124bea77e Linux 5.13-rc5)
Merging kbuild-current/fixes (c4681547bcce Linux 5.13-rc3)
Merging arc-current/for-curr (110febc0148f ARC: fix CONFIG_HARDENED_USERCOP=
Y)
Merging arm-current/fixes (dad7b9896a5d ARM: 9081/1: fix gcc-10 thumb2-kern=
el regression)
Merging arm64-fixes/for-next/fixes (e69012400b0c arm64: mm: don't use CON a=
nd BLK mapping if KFENCE is enabled)
Merging arm-soc-fixes/arm/fixes (f2a4ba9ec23b Merge tag 'qcom-dts-fixes-for=
-5.13' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into a=
rm/fixes)
Merging drivers-memory-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging m68k-current/for-linus (34e5269bf987 m68k: sun3x: Remove unneeded s=
emicolon)
Merging powerpc-fixes/fixes (60b7ed54a41b powerpc/perf: Fix crash in perf_i=
nstruction_pointer() when ppmu is not set)
Merging s390-fixes/fixes (67147e96a332 s390/stack: fix possible register co=
rruption with stack switch helper)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (0cd58e5c53ba pkt_sched: sch_qfq: fix qfq_change_class()=
 error path)
Merging bpf/master (781dd0431eb5 skmsg: Increase sk->sk_drops when dropping=
 packets)
Merging ipsec/master (6fd06963fa74 xfrm: Fix error reporting in xfrm_state_=
construct.)
Merging netfilter/master (a4f0377db125 Merge git://git.kernel.org/pub/scm/l=
inux/kernel/git/bpf/bpf)
Merging ipvs/master (f4cdcae03f9c Merge branch 'cxgb4-fixes')
Merging wireless-drivers/master (1f9482aa8d41 mwifiex: bring down link befo=
re deleting interface)
Merging mac80211/master (dda2626b86c2 Merge branch 'ezchip-fixes')
Merging rdma-fixes/for-rc (13311e74253f Linux 5.13-rc7)
Merging sound-current/for-linus (83e197a8414c ALSA: seq: Fix race of snd_se=
q_timer_open())
Merging sound-asoc-fixes/for-linus (ad3550f3df1a Merge remote-tracking bran=
ch 'asoc/for-5.13' into asoc-linus)
Merging regmap-fixes/for-linus (614124bea77e Linux 5.13-rc5)
Merging regulator-fixes/for-linus (97bc55f383dc Merge remote-tracking branc=
h 'regulator/for-5.13' into regulator-linus)
Merging spi-fixes/for-linus (55bec15b552a Merge remote-tracking branch 'spi=
/for-5.13' into spi-linus)
Merging pci-current/for-linus (f18139966d07 PCI: aardvark: Fix kernel panic=
 during PIO transfer)
Merging driver-core.current/driver-core-linus (009c9aa5be65 Linux 5.13-rc6)
Merging tty.current/tty-linus (009c9aa5be65 Linux 5.13-rc6)
Merging usb.current/usb-linus (13311e74253f Linux 5.13-rc7)
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (009c9aa5be65 Linux 5.13-rc6)
Merging usb-chipidea-fixes/for-usb-fixes (c6d580d96f14 usb: chipidea: imx: =
Fix Battery Charger 1.2 CDP detection)
Merging phy/fixes (d1ce245fe409 phy: Sparx5 Eth SerDes: check return value =
after calling platform_get_resource())
Merging staging.current/staging-linus (009c9aa5be65 Linux 5.13-rc6)
Merging iio-fixes/fixes-togreg (e9de1ecadeab staging: ralink-gdma: Remove i=
ncorrect author information)
Merging char-misc.current/char-misc-linus (009c9aa5be65 Linux 5.13-rc6)
Merging soundwire-fixes/fixes (da096fbccd52 soundwire: qcom: fix handling o=
f qcom,ports-block-pack-mode)
Merging thunderbolt-fixes/fixes (13311e74253f Linux 5.13-rc7)
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
Merging omap-fixes/fixes (3ff340e24c9d bus: ti-sysc: Fix gpt12 system timer=
 issue with reserved status)
Merging kvm-fixes/master (d8ac05ea13d7 KVM: selftests: Fix kvm_check_cap() =
assertion)
Merging kvms390-fixes/master (735931f9a51a MAINTAINERS: add uv.c also to KV=
M/s390)
Merging hwmon-fixes/hwmon (6e9ef8ca687e hwmon: (pmbus/bpa-rs600) Handle Vin=
 readings >=3D 256V)
Merging nvdimm-fixes/libnvdimm-fixes (de80d5781136 Merge branch 'for-5.13/d=
ax' into libnvdimm-fixes)
Merging cxl-fixes/fixes (fae8817ae804 cxl/mem: Fix memory device capacity p=
robing)
Merging btrfs-fixes/next-fixes (9d7848127f97 Merge branch 'misc-5.13' into =
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
Merging scsi-fixes/fixes (7dd753ca59d6 scsi: sr: Return appropriate error c=
ode when disk is ejected)
Merging drm-fixes/drm-fixes (13311e74253f Linux 5.13-rc7)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (13311e74253f Linux 5.13-rc7)
Merging mmc-fixes/fixes (103a5348c22c mmc: meson-gx: use memcpy_to/fromio f=
or dram-access-quirk)
Merging rtc-fixes/rtc-fixes (bd33335aa93d rtc: cmos: Disable irq around dir=
ect invocation of cmos_interrupt())
Merging gnss-fixes/gnss-linus (a38fd8748464 Linux 5.12-rc2)
Merging hyperv-fixes/hyperv-fixes (6efb943b8616 Linux 5.13-rc1)
Merging soc-fsl-fixes/fix (2663b3388551 soc: fsl: dpio: Get the cpumask thr=
ough cpumask_of(cpu))
Merging risc-v-fixes/fixes (7ede12b01b59 riscv: dts: fu740: fix cache-contr=
oller interrupts)
Merging pidfd-fixes/fixes (03ba0fe4d09f file: simplify logic in __close_ran=
ge())
Merging fpga-fixes/fixes (2e8496f31d0b firmware: stratix10-svc: reset COMMA=
ND_RECONFIG_FLAG_PARTIAL to 0)
Merging spdx/spdx-linus (009c9aa5be65 Linux 5.13-rc6)
Merging gpio-brgl-fixes/gpio/for-current (3093e6cca3ba gpio: mxc: Fix disab=
led interrupt wake-up support)
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
Merging drm-misc-fixes/for-linux-next-fixes (1815d9c86e30 drm: add a locked=
 version of drm_is_current_master)
Merging kspp-gustavo/for-next/kspp (305b46ebb0ea media: siano: Fix out-of-b=
ounds warnings in smscore_load_firmware_family2())
Merging kbuild/for-next (c7c90e121e99 kconfig.h: explain IS_MODULE(), IS_EN=
ABLED())
Merging compiler-attributes/compiler-attributes (ca0760e7d79e Compiler Attr=
ibutes: Add continue in comment)
Merging dma-mapping/for-next (a7f3d3d3600c dma-mapping: add unlikely hint t=
o error path in dma_mapping_error)
Merging asm-generic/master (14462376858e Merge branch 'asm-generic-unaligne=
d' into asm-generic)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (2ac9912d2041 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (70b6365b5826 Merge branch 'for-next/mm' into f=
or-next/core)
CONFLICT (content): Merge conflict in arch/arm64/kernel/process.c
Merging arm-perf/for-next/perf (d96b1b8c9f79 drivers/perf: fix the missed i=
da_simple_remove() in ddr_perf_probe())
Merging arm-soc/for-next (e12b6e5b0ac3 ARM: Document merges)
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (b03485fe99f2 Merge tags 'amlogic-arm64-dt-for-v5.=
14-v2' and 'amlogic-arm-dt-for-v5.14' into for-next)
Merging aspeed/for-next (cd946cfe2e7e Merge branches 'defconfig-for-v5.14' =
and 'dt-for-v5.14' into for-next)
Merging at91/at91-next (80cbaa6d3450 Merge branches 'at91-dt' and 'at91-def=
config' into at91-next)
Merging drivers-memory/for-next (3abc7467ba9d Merge branch 'for-v5.14/tegra=
-mc-late-or-fixes' into for-next)
Merging imx-mxs/for-next (5004b2d18827 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (9d2e21ed98a2 Merge branch 'for_5.12/drivers-soc' int=
o next)
Merging mediatek/for-next (a1c8c49de3d7 Merge branch 'v5.13-next/soc' into =
for-next)
Merging mvebu/for-next (72a0a49b7c77 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (91ee322340fb Merge branch 'omap-for-v5.14/dt' into f=
or-next)
Merging qcom/for-next (c275bbc84be9 Merge branches 'arm64-defconfig-for-5.1=
4', 'arm64-for-5.14', 'drivers-for-5.14' and 'dts-for-5.14' into for-next)
Merging raspberrypi/for-next (21c6bf8304f0 arm64: dts: broadcom: Add refere=
nce to RPi 400)
Merging renesas/next (23df6d1f0971 Merge branches 'renesas-arm-defconfig-fo=
r-v5.14', 'renesas-arm-dt-for-v5.14', 'renesas-drivers-for-v5.14' and 'rene=
sas-dt-bindings-for-v5.14' into renesas-next)
Merging reset/reset/next (48a74b1147f7 reset: Add compile-test stubs)
Merging rockchip/for-next (d80279684fbe Merge branch 'v5.14-armsoc/dts32' i=
nto for-next)
Merging samsung-krzk/for-next (5ce16705e00d Merge branch 'next/defconfig' i=
nto for-next)
Merging scmi/for-linux-next (009c9aa5be65 Linux 5.13-rc6)
Merging stm32/stm32-next (4bf4abe19089 ARM: dts: stm32: fix stpmic node for=
 stm32mp1 boards)
Merging sunxi/sunxi/for-next (3f1c53207cf0 Merge branches 'sunxi/dt-for-5.1=
4' and 'sunxi/fixes-for-5.13' into sunxi/for-next)
Merging tegra/for-next (eac9ab885bb5 Merge branch for-5.14/arm64/dt into fo=
r-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (d71abfcc6c05 arm64: dts: ti: k3-am642-evm/sk:=
 Add DDR carveout memory nodes for R5Fs)
Merging xilinx/for-next (d98fb9ab6255 Merge branch 'zynq/dt' into for-next)
Merging clk/clk-next (f09119823f43 Merge branch 'clk-vc5' into clk-next)
Merging clk-imx/for-next (c586f53ae159 clk: imx8mq: remove SYS PLL 1/2 cloc=
k gates)
Merging clk-renesas/renesas-clk (2cd1e3883a57 clk: renesas: rzg2l: Fix off-=
by-one check in rzg2l_cpg_clk_src_twocell_get())
Merging clk-samsung/for-next (a38fd8748464 Linux 5.12-rc2)
Merging csky/linux-next (280af034a71d csky: Kconfig: Remove unused selects)
Merging h8300/h8300-next (6e5e55227c95 Merge tag 'v5.11' into h8300-next)
Merging m68k/for-next (c1367ee016e3 m68k: atari: Fix ATARI_KBD_CORE kconfig=
 unmet dependency warning)
Merging m68knommu/for-next (3f605ee17f8e m68knommu: fix missing LCD splash =
screen data initializer)
Merging microblaze/next (14a832498c23 arch: microblaze: Fix spelling mistak=
e "vesion" -> "version")
Merging mips/mips-next (a2cdc24e2057 mips/kvm: Use BUG_ON instead of if con=
dition followed by BUG)
Merging nds32/next (40e0dd851e7b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (ad4e600cbf89 drivers/soc/litex: remove 8-bit sub=
register option)
Merging parisc-hd/for-next (9f4ad9e425a1 Linux 5.12)
Merging powerpc/next (9a0b020d6168 Merge branch 'topic/ppc-kvm' into next)
Merging soc-fsl/next (242b0b398ccd soc: fsl: enable acpi support in RCPM dr=
iver)
Merging risc-v/for-next (01d13185f183 riscv: add ASID-based tlbflushing met=
hods)
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
Merging s390/for-next (6de0091b9278 Merge branch 'features' into for-next)
Merging sh/for-next (2882b7626f49 sh: kernel: traps: remove unused variable)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (1aee020155f3 um: remove unneeded semicolon in um_ar=
ch.c)
Merging xtensa/xtensa-for-next (21e0c3d5f633 xtensa: fix kconfig unmet depe=
ndency warning for HAVE_FUTEX_CMPXCHG)
Merging pidfd/for-next (5ddf9602d711 Merge branch 'fs.mount_setattr.nosymfo=
llow' into for-next)
Merging fscrypt/master (2fc2b430f559 fscrypt: fix derivation of SipHash key=
s on big endian CPUs)
Merging fscache/fscache-next (18d5803bc50e fscache: Use refcount_t for the =
cookie refcount instead of atomic_t)
Merging afs/afs-next (7af08140979a Revert "gcov: clang: fix clang-11+ build=
")
Merging btrfs/for-next (5980d0eb3f93 Merge branch 'for-next-next-v5.13-2021=
0621' into for-next-20210621)
Merging ceph/master (1b269bcade7c libceph: fix doc warnings in cls_lock_cli=
ent.c)
Merging cifs/for-next (e0ae8a9aaeed smb311: remove dead code for non compou=
nded posix query info)
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
CONFLICT (content): Merge conflict in include/uapi/asm-generic/unistd.h
Merging ext4/dev (a492dedb708d ext4: update journal documentation)
CONFLICT (content): Merge conflict in fs/ext4/ioctl.c
Merging f2fs/dev (41a0f4c40780 f2fs: enable extent cache for compression fi=
les in read-only)
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (b89ecd60d38e fuse: ignore PG_workingset after steali=
ng)
Merging jfs/jfs-next (492109333c29 fs/jfs: Fix missing error code in lmLogI=
nit())
Merging nfs/linux-next (009c9aa5be65 Linux 5.13-rc6)
Merging nfs-anna/linux-next (4f8be1f53bf6 nfs: we don't support removing sy=
stem.nfs4_acl)
Merging nfsd/nfsd-next (8f83fd6fbab8 lockd: Update the NLMv4 SHARE results =
encoder to use struct xdr_stream)
Merging cel/for-next (b9f83ffaa0c0 SUNRPC: Fix null pointer dereference in =
svc_rqst_free())
Merging orangefs/for-next (211f9f2e0503 orangefs: leave files in the page c=
ache for a few micro seconds at least)
Merging overlayfs/overlayfs-next (5e717c6fa41f ovl: add debug print to ovl_=
do_getxattr())
Merging ubifs/next (bb87ef616e7b ubifs: Set/Clear I_LINKABLE under i_lock f=
or whiteout inode)
Merging v9fs/9p-next (cba7dcd8878e 9p/trans_virtio: Remove sysfs file on pr=
obe failure)
Merging xfs/for-next (2909e02fec6c xfs: force the log offline when log inte=
nt item recovery fails)
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
Merging printk/for-next (3d6ddc7716c3 Merge branch 'for-5.14' into for-next)
Merging pci/next (f25d926127a2 Merge branch 'remotes/lorenzo/pci/xgene')
Merging pstore/for-next/pstore (1d1f6cc5818c pstore/blk: Include zone in ps=
tore_device_info)
Merging hid/for-next (88bcf9de46df Merge branch 'for-5.13/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (078de1e62c83 Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i3c/i3c/next (3e5feb11a829 i3c: master: svc: fix doc warning in svc=
-i3c-master.c)
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (4c7f85a321a1 hwmon: (lm90) Disable interr=
upt on suspend)
Merging jc_docs/docs-next (98cf4951842a Merge branch 'path-lookup' into doc=
s-next)
Merging v4l-dvb/master (198bb646e855 media: i2c: rdacm20: Re-work ov10635 r=
eset)
Merging v4l-dvb-next/master (52fb74b6891b media: gspca: Drop default m)
Merging pm/linux-next (1b02478a82ab Merge branch 'pm-domains' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (9821a195d4e2 dt-bindings: cpufr=
eq: update cpu type and clock name for MT8173 SoC)
Merging cpupower/cpupower (d07f6ca923ea Linux 5.13-rc2)
Merging devfreq/devfreq-next (6b61f55ecbe6 dt-bindings: devfreq: tegra30-ac=
tmon: Add cooling-cells)
Merging opp/opp/linux-next (4fa82a87ba55 opp: Allow required-opps to be use=
d for non genpd use cases)
Merging thermal/thermal/linux-next (c5c9dfdcaea2 dt-bindings: rockchip-ther=
mal: Support the RK3568 SoC compatible)
Merging dlm/next (957adb68b3f7 fs: dlm: invalid buffer access in lookup err=
or)
Merging swiotlb/linux-next (5f89468e2f06 swiotlb: manipulate orig_addr when=
 tlb_addr has offset)
Merging rdma/for-next (7e78dd816e45 RDMA/hns: Clear extended doorbell info =
before using)
CONFLICT (content): Merge conflict in drivers/infiniband/sw/rxe/rxe_comp.c
Merging net-next/master (ef2c3ddaa4ed ibmvnic: Use strscpy() instead of str=
ncpy())
CONFLICT (content): Merge conflict in net/ipv4/udp_bpf.c
CONFLICT (content): Merge conflict in net/ipv4/tcp_bpf.c
CONFLICT (content): Merge conflict in net/core/skmsg.c
CONFLICT (content): Merge conflict in include/linux/skmsg.h
CONFLICT (content): Merge conflict in Documentation/networking/devlink/devl=
ink-trap.rst
Merging bpf-next/for-next (5c10a3dbe922 libbpf: Add extra BPF_PROG_TYPE che=
ck to bpf_object__probe_loading)
Merging ipsec-next/master (30ad6a84f60b xfrm: avoid compiler warning when i=
pv6 is disabled)
Merging mlx5-next/mlx5-next (63f9c44bca5e net/mlx5: Add MEMIC operations re=
lated bits)
Merging netfilter-next/master (24610ed80df6 netfilter: nfnetlink_hook: fix =
check for snprintf() overflow)
Merging ipvs-next/master (a212d9f33ed0 Merge branch 'iosm-driver')
Merging wireless-drivers-next/master (adf6a0f8c0a6 rtl8xxxu: avoid parsing =
short RX packet)
Merging bluetooth/master (cbeca1470546 Bluetooth: btmrvl: remove redundant =
continue statement)
Merging mac80211-next/master (77091933e453 net: mdio: ipq8064: enlarge slee=
p after read/write operation)
Merging gfs2/for-next (f742f09c6485 gfs2: Fix underflow in gfs2_page_mkwrit=
e)
CONFLICT (content): Merge conflict in lib/iov_iter.c
CONFLICT (content): Merge conflict in include/linux/uio.h
CONFLICT (content): Merge conflict in Documentation/filesystems/porting.rst
Merging mtd/mtd/next (6aa12138cd9a mtd: Convert list_for_each to entry vari=
ant)
Merging nand/nand/next (c06dd49fd59a mtd: rawnand: omap: Add larger page NA=
ND chips support)
Merging spi-nor/spi-nor/next (c17e5c85b32f mtd: spi-nor: remove redundant c=
ontinue statement)
Merging crypto/master (38a9eb8182a2 crypto: hisilicon/zip - adds the max sh=
aper type rate)
CONFLICT (content): Merge conflict in drivers/crypto/cavium/nitrox/nitrox_m=
ain.c
Merging drm/drm-next (d472b36efbf8 Merge tag 'amd-drm-next-5.14-2021-06-16'=
 of https://gitlab.freedesktop.org/agd5f/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/vc4/vc4_hdmi.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_obj=
ect.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ctx=
.c
Merging drm-misc/for-linux-next (eed75ce7c826 drm/amdgpu: fix amdgpu_preemp=
t_mgr_new())
Merging amdgpu/drm-next (2631b42588c1 drm/amdgpu/display: fold DRM_AMD_DC_D=
CN3_1 into DRM_AMD_DC_DCN)
Merging drm-intel/for-linux-next (1bd8a7dc28c1 Merge tag 'exynos-drm-next-f=
or-v5.14' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exyn=
os into drm-next)
Merging drm-tegra/drm/tegra/for-next (a562c0783b5f drm/tegra: Don't call SE=
T_APPLICATION_ID in VIC boot)
Merging drm-msm/msm-next (7e0230fd096c drm/msm/mdp5: provide dynamic bandwi=
dth management)
$ git reset --hard HEAD^
Merging next-20210617 version of drm-msm
Merging imx-drm/imx-drm/next (fc1e985b67f9 drm/imx: ipuv3-plane: add color =
encoding and range properties)
Merging etnaviv/etnaviv/next (989c9dad6131 drm/etnaviv: add HWDB entry for =
GC7000 rev 6204)
Merging regmap/for-next (d17032f2befa Merge remote-tracking branch 'regmap/=
for-5.14' into regmap-next)
Merging sound/for-next (6c0a2078134a ALSA: usb-audio: scarlett2: Remove har=
d-coded USB #defines)
Merging sound-asoc/for-next (ee28214adc69 Merge remote-tracking branch 'aso=
c/for-5.14' into asoc-next)
Merging modules/modules-next (2c0f0f363956 module: correctly exit module_ka=
llsyms_on_each_symbol when fn() !=3D 0)
Merging input/next (cac7100d4c51 Input: hideep - fix the uninitialized use =
in hideep_nvm_unlock())
Merging block/for-next (7dd1c3f9234b Merge branch 'for-5.14/drivers-late' i=
nto for-next)
CONFLICT (modify/delete): include/linux/ide.h deleted in block/for-next and=
 modified in HEAD. Version HEAD of include/linux/ide.h left in tree.
CONFLICT (modify/delete): drivers/ide/via82cxxx.c deleted in block/for-next=
 and modified in HEAD. Version HEAD of drivers/ide/via82cxxx.c left in tree.
CONFLICT (modify/delete): drivers/ide/triflex.c deleted in block/for-next a=
nd modified in HEAD. Version HEAD of drivers/ide/triflex.c left in tree.
CONFLICT (modify/delete): drivers/ide/slc90e66.c deleted in block/for-next =
and modified in HEAD. Version HEAD of drivers/ide/slc90e66.c left in tree.
CONFLICT (modify/delete): drivers/ide/sl82c105.c deleted in block/for-next =
and modified in HEAD. Version HEAD of drivers/ide/sl82c105.c left in tree.
CONFLICT (modify/delete): drivers/ide/sis5513.c deleted in block/for-next a=
nd modified in HEAD. Version HEAD of drivers/ide/sis5513.c left in tree.
CONFLICT (modify/delete): drivers/ide/siimage.c deleted in block/for-next a=
nd modified in HEAD. Version HEAD of drivers/ide/siimage.c left in tree.
CONFLICT (modify/delete): drivers/ide/setup-pci.c deleted in block/for-next=
 and modified in HEAD. Version HEAD of drivers/ide/setup-pci.c left in tree.
CONFLICT (modify/delete): drivers/ide/serverworks.c deleted in block/for-ne=
xt and modified in HEAD. Version HEAD of drivers/ide/serverworks.c left in =
tree.
CONFLICT (modify/delete): drivers/ide/sc1200.c deleted in block/for-next an=
d modified in HEAD. Version HEAD of drivers/ide/sc1200.c left in tree.
CONFLICT (modify/delete): drivers/ide/piix.c deleted in block/for-next and =
modified in HEAD. Version HEAD of drivers/ide/piix.c left in tree.
CONFLICT (modify/delete): drivers/ide/pdc202xx_old.c deleted in block/for-n=
ext and modified in HEAD. Version HEAD of drivers/ide/pdc202xx_old.c left i=
n tree.
CONFLICT (modify/delete): drivers/ide/pdc202xx_new.c deleted in block/for-n=
ext and modified in HEAD. Version HEAD of drivers/ide/pdc202xx_new.c left i=
n tree.
CONFLICT (modify/delete): drivers/ide/opti621.c deleted in block/for-next a=
nd modified in HEAD. Version HEAD of drivers/ide/opti621.c left in tree.
CONFLICT (modify/delete): drivers/ide/ns87415.c deleted in block/for-next a=
nd modified in HEAD. Version HEAD of drivers/ide/ns87415.c left in tree.
CONFLICT (modify/delete): drivers/ide/jmicron.c deleted in block/for-next a=
nd modified in HEAD. Version HEAD of drivers/ide/jmicron.c left in tree.
CONFLICT (modify/delete): drivers/ide/it821x.c deleted in block/for-next an=
d modified in HEAD. Version HEAD of drivers/ide/it821x.c left in tree.
CONFLICT (modify/delete): drivers/ide/it8213.c deleted in block/for-next an=
d modified in HEAD. Version HEAD of drivers/ide/it8213.c left in tree.
CONFLICT (modify/delete): drivers/ide/it8172.c deleted in block/for-next an=
d modified in HEAD. Version HEAD of drivers/ide/it8172.c left in tree.
CONFLICT (modify/delete): drivers/ide/ide-pci-generic.c deleted in block/fo=
r-next and modified in HEAD. Version HEAD of drivers/ide/ide-pci-generic.c =
left in tree.
CONFLICT (modify/delete): drivers/ide/ide-acpi.c deleted in block/for-next =
and modified in HEAD. Version HEAD of drivers/ide/ide-acpi.c left in tree.
CONFLICT (modify/delete): drivers/ide/hpt366.c deleted in block/for-next an=
d modified in HEAD. Version HEAD of drivers/ide/hpt366.c left in tree.
CONFLICT (modify/delete): drivers/ide/delkin_cb.c deleted in block/for-next=
 and modified in HEAD. Version HEAD of drivers/ide/delkin_cb.c left in tree.
CONFLICT (modify/delete): drivers/ide/cy82c693.c deleted in block/for-next =
and modified in HEAD. Version HEAD of drivers/ide/cy82c693.c left in tree.
CONFLICT (modify/delete): drivers/ide/cs5536.c deleted in block/for-next an=
d modified in HEAD. Version HEAD of drivers/ide/cs5536.c left in tree.
CONFLICT (modify/delete): drivers/ide/cs5535.c deleted in block/for-next an=
d modified in HEAD. Version HEAD of drivers/ide/cs5535.c left in tree.
CONFLICT (modify/delete): drivers/ide/cs5530.c deleted in block/for-next an=
d modified in HEAD. Version HEAD of drivers/ide/cs5530.c left in tree.
CONFLICT (modify/delete): drivers/ide/cs5520.c deleted in block/for-next an=
d modified in HEAD. Version HEAD of drivers/ide/cs5520.c left in tree.
CONFLICT (modify/delete): drivers/ide/cmd64x.c deleted in block/for-next an=
d modified in HEAD. Version HEAD of drivers/ide/cmd64x.c left in tree.
CONFLICT (modify/delete): drivers/ide/atiixp.c deleted in block/for-next an=
d modified in HEAD. Version HEAD of drivers/ide/atiixp.c left in tree.
CONFLICT (modify/delete): drivers/ide/amd74xx.c deleted in block/for-next a=
nd modified in HEAD. Version HEAD of drivers/ide/amd74xx.c left in tree.
CONFLICT (modify/delete): drivers/ide/alim15x3.c deleted in block/for-next =
and modified in HEAD. Version HEAD of drivers/ide/alim15x3.c left in tree.
CONFLICT (modify/delete): drivers/ide/aec62xx.c deleted in block/for-next a=
nd modified in HEAD. Version HEAD of drivers/ide/aec62xx.c left in tree.
CONFLICT (modify/delete): drivers/ide/Kconfig deleted in block/for-next and=
 modified in HEAD. Version HEAD of drivers/ide/Kconfig left in tree.
$ git rm -f drivers/ide/Kconfig drivers/ide/aec62xx.c drivers/ide/alim15x3.=
c drivers/ide/amd74xx.c drivers/ide/atiixp.c drivers/ide/cmd64x.c drivers/i=
de/cs5520.c drivers/ide/cs5530.c drivers/ide/cs5535.c drivers/ide/cs5536.c =
drivers/ide/cy82c693.c drivers/ide/delkin_cb.c drivers/ide/hpt366.c drivers=
/ide/ide-acpi.c drivers/ide/ide-pci-generic.c drivers/ide/it8172.c drivers/=
ide/it8213.c drivers/ide/it821x.c drivers/ide/jmicron.c drivers/ide/ns87415=
.c drivers/ide/opti621.c drivers/ide/pdc202xx_new.c drivers/ide/pdc202xx_ol=
d.c drivers/ide/piix.c drivers/ide/sc1200.c drivers/ide/serverworks.c drive=
rs/ide/setup-pci.c drivers/ide/siimage.c drivers/ide/sis5513.c drivers/ide/=
sl82c105.c drivers/ide/slc90e66.c drivers/ide/triflex.c drivers/ide/via82cx=
xx.c include/linux/ide.h
Merging device-mapper/for-next (b8e0c7f90e6f dm btree remove: assign new_ro=
ot only when removal succeeds)
Merging pcmcia/pcmcia-next (e9d503fef7da pcmcia: rsrc_nonstatic: Fix call-b=
ack function as reference formatting)
Merging mmc/next (98b5ce4c08ca mmc: sdhci-iproc: Add support for the legacy=
 sdhci controller on the BCM7211)
Merging mfd/for-mfd-next (495fb48dbd9b mfd: wm831x: Use DEFINE_RES_IRQ_NAME=
D() and DEFINE_RES_IRQ() to simplify code)
Merging backlight/for-backlight-next (6fc632d3e3e0 video: backlight: qcom-w=
led: Add PMI8994 compatible)
Merging battery/for-next (eab4e6d953c1 power: supply: cpcap-charger: get th=
e battery inserted infomation from cpcap-battery)
Merging regulator/for-next (4acb86349a3b Merge remote-tracking branch 'regu=
lator/for-5.14' into regulator-next)
Merging security/next-testing (047843bdb316 Merge branch 'landlock_lsm_v34'=
 into next-testing)
Merging apparmor/apparmor-next (d108370c644b apparmor: fix error check)
Merging integrity/next-integrity (52c208397c24 IMA: support for duplicate m=
easurement records)
Merging keys/keys-next (e377c31f788f integrity: Load mokx variables into th=
e blacklist keyring)
CONFLICT (content): Merge conflict in certs/system_keyring.c
Merging safesetid/safesetid-next (1b8b71922919 LSM: SafeSetID: Mark safeset=
id_initialized as __initdata)
Merging selinux/next (d99cf13f1420 selinux: kill 'flags' argument in avc_ha=
s_perm_flags() and avc_audit())
Merging smack/next (fe6bde732be8 Smack: fix doc warning)
Merging tomoyo/master (98eaa63e9627 tomoyo: fix doc warnings)
Merging tpmdd/next (8124c8a6b353 Linux 5.13-rc4)
Merging watchdog/master (cf813c67d961 watchdog: iTCO_wdt: use dev_err() ins=
tead of pr_err())
Merging iommu/next (23f66fc785b5 Merge branches 'iommu/fixes', 'arm/rockchi=
p', 'arm/smmu', 'x86/vt-d', 'x86/amd' and 'core' into next)
Merging audit/next (0ecc617858fc audit: remove unnecessary 'ret' initializa=
tion)
Merging devicetree/for-next (972d6a7dcec3 dt-bindings: Drop redundant minIt=
ems/maxItems)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/net=
/stm32-dwmac.yaml
CONFLICT (modify/delete): Documentation/devicetree/bindings/mtd/ti,am654-hb=
mc.txt deleted in HEAD and modified in devicetree/for-next. Version devicet=
ree/for-next of Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt lef=
t in tree.
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/med=
ia/renesas,drif.yaml
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/dis=
play/bridge/cdns,mhdp8546.yaml
$ git rm -f Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
Merging mailbox/mailbox-for-next (6393989e2a31 mailbox: bcm-flexrm-mailbox:=
 Remove redundant dev_err call in flexrm_mbox_probe())
Merging spi/for-next (b8f9dce0f4eb Merge remote-tracking branch 'spi/for-5.=
14' into spi-next)
Merging tip/auto-latest (f10bd30916ba Merge branch 'efi/core')
CONFLICT (content): Merge conflict in samples/kprobes/kprobe_example.c
Merging clockevents/timers/drivers/next (6f64c8159af9 clocksource/drivers/a=
rm_global_timer: Remove duplicated argument in arm_global_timer)
Merging edac/edac-for-next (0a9ece9ba154 EDAC/igen6: fix core dependency)
Merging irqchip/irq/irqchip-next (c51e96dace68 Merge branch irq/irqchip-dri=
ver-updates into irq/irqchip-next)
Applying: powerpc: fix up for "Drop dependency between asm/irq.h and linux/=
irqdomain.h"
Merging ftrace/for-next (3105497b8ae7 Merge branch 'trace/ftrace/urgent' in=
to trace/for-next)
Merging rcu/rcu/next (8bd5745dc8fa torture: Protect kvm-remote.sh directory=
 trees from /tmp reaping)
CONFLICT (content): Merge conflict in kernel/rcu/tree_stall.h
CONFLICT (content): Merge conflict in kernel/rcu/tree_plugin.h
Applying: fix for code movement to kernel/rcu/tree_nocb.h
Merging kvm/next (0485cf8dbe96 KVM: x86/mmu: Remove redundant root_hpa chec=
ks)
CONFLICT (content): Merge conflict in include/uapi/linux/kvm.h
Merging kvm-arm/next (85c653fcc635 Merge branch arm64/for-next/caches into =
kvmarm-master/next)
CONFLICT (content): Merge conflict in tools/testing/selftests/kvm/Makefile
Merging kvm-ppc/kvm-ppc-next (72476aaa4691 KVM: PPC: Book3S HV: Fix host ra=
dix SLB optimisation with hash guests)
Merging kvms390/next (44bada282190 KVM: s390: fix guarded storage control r=
egister handling)
Merging xen-tip/linux-next (107866a8eb0b xen-netback: take a reference to t=
he RX task thread)
Merging percpu/for-next (5c28d6836dc7 Merge branch 'for-5.14' into for-next)
Merging workqueues/for-next (f2ccd0a922b3 workqueue: Add back __printf form=
at validation)
Merging drivers-x86/for-next (94f31542f176 Merge tag 'devm-helpers-v5.14-1'=
 into review-hans)
CONFLICT (content): Merge conflict in drivers/platform/surface/surface_aggr=
egator_registry.c
Merging chrome-platform/for-next (6efb943b8616 Linux 5.13-rc1)
Merging hsi/for-next (6efb943b8616 Linux 5.13-rc1)
Merging leds/for-next (e90abb95bc71 leds: lm36274: Add missed property.h)
Merging ipmi/for-next (5b32dd281ee0 ipmi: kcs_bmc_aspeed: Fix less than zer=
o comparison of a unsigned int)
Merging driver-core/driver-core-next (09705dcb63d2 devres: Enable trace eve=
nts)
Merging usb/usb-next (f2dca339fa7d Merge tag 'usb-v5.14-rc1' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/peter.chen/usb into usb-next)
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (8051334e901f USB: serial: cp210x: add support =
for GPIOs on CP2108)
CONFLICT (content): Merge conflict in drivers/usb/serial/cp210x.c
Merging usb-chipidea-next/for-usb-next (956df1bb0ab8 usb: chipidea: host: f=
ix port index underflow and UBSAN complains)
Merging tty/tty-next (b61c8bf4694b tty: serial: Add UART driver for Cortina=
-Access platform)
Merging char-misc/char-misc-next (91812dd0937c bus: fsl-mc: mc-io: Correct =
misdocumentation of 'dpmcp_dev' param)
Merging extcon/extcon-next (d97c0ff5a124 extcon: sm5502: Add support for SM=
5504)
Merging phy-next/next (f7eedcb8539d phy: ti: dm816x: Fix the error handling=
 path in 'dm816x_usb_phy_probe())
Merging soundwire/next (3d3e88e33633 soundwire: stream: Fix test for DP pre=
pare complete)
CONFLICT (content): Merge conflict in include/linux/soundwire/sdw.h
Merging thunderbolt/next (b18f901382fd thunderbolt: Fix DROM handling for U=
SB4 DROM)
Merging vfio/next (c7396f2eac2b vfio/iommu_type1: rename vfio_group struck =
to vfio_iommu_group)
Merging staging/staging-next (6cbb3aa0f9d5 staging: rtl8723bs: rtw_efuse: F=
ix coding style)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging iio/togreg (6cbb3aa0f9d5 staging: rtl8723bs: rtw_efuse: Fix coding =
style)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (46bdcac533cc interconnect: qcom: Add SC7280 interconn=
ect provider driver)
Merging dmaengine/next (656758425f98 dmaengine: altera-msgdma: add OF suppo=
rt)
Merging cgroup/for-next (cfeaa699186e Merge branch 'for-5.13-fixes' into fo=
r-next)
Merging scsi/for-next (7c932e30ee03 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (041761f4a4db scsi: aha1740: Avoid over-read of s=
ense buffer)
Merging vhost/linux-next (7ff6e99e021c virtio_net: disable cb aggressively)
Merging rpmsg/for-next (ab3a29a6b253 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (45ca16072b70 dt-bindings: gpio: zynq: conv=
ert bindings to YAML)
CONFLICT (modify/delete): Documentation/devicetree/bindings/gpio/gpio-davin=
ci.txt deleted in gpio-brgl/gpio/for-next and modified in HEAD. Version HEA=
D of Documentation/devicetree/bindings/gpio/gpio-davinci.txt left in tree.
$ git rm -f Documentation/devicetree/bindings/gpio/gpio-davinci.txt
Merging gpio-intel/for-next (043d7f09bf61 gpiolib: acpi: Add acpi_gpio_get_=
io_resource())
Merging pinctrl/for-next (18a332087fa9 Merge branch 'devel' into for-next)
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
Merging kselftest/next (22118ce17eb8 selftests/sgx: Refine the test enclave=
 to have storage)
Merging livepatching/for-next (c150bbbb1731 Merge branch 'for-5.13/signal' =
into for-next)
Merging coresight/next (1efbcec2ef8c coresight: cti: Reduce scope for the v=
ariable =E2=80=9Ccs_fwnode=E2=80=9D in cti_plat_create_connection())
Merging rtc/rtc-next (94af1e732abe rtc: pcf8563: Fix the datasheet URL)
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
Merging hyperv/hyperv-next (7d815f4afa87 PCI: hv: Add check for hyperv_init=
ialized in init_hv_pci_drv())
CONFLICT (content): Merge conflict in arch/x86/hyperv/hv_init.c
Applying: x86: move of part of "Fix leftover comment typos"
Merging auxdisplay/auxdisplay (c784e46c8445 auxdisplay: Add I2C gpio expand=
er example)
Merging kgdb/kgdb/for-next (c8daba4640ac kgdb: Fix fall-through warning for=
 Clang)
Merging hmm/hmm (fe07bfda2fb9 Linux 5.12-rc1)
Merging fpga/for-next (92c5ddbc93ab fpga: fpga-bridge: removed repeated wor=
d)
Merging kunit/test (d07f6ca923ea Linux 5.13-rc2)
Merging cfi/cfi/next (6efb943b8616 Linux 5.13-rc1)
Merging kunit-next/kunit (d07f6ca923ea Linux 5.13-rc2)
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mhi/mhi-next (c0da39de3274 bus: mhi: pci_generic: Add Cinterion MV3=
1-W PCIe to MHI)
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
Merging cxl/next (21083f51521f cxl/pmem: Register 'pmem' / cxl_nvdimm devic=
es)
Merging tpmdd-jejb/tpmdd-for-next (69977d1aeeca Merge branch 'tpmdd-fixes' =
into tpmdd-for-next)
Merging akpm-current/current (26707fddff39 linux-next-pre)
CONFLICT (content): Merge conflict in mm/memcontrol.c
CONFLICT (content): Merge conflict in drivers/block/zram/zram_drv.h
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
CONFLICT (content): Merge conflict in arch/powerpc/kernel/smp.c
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (07833396a3a5 afs: fix tracepoint string placement with=
 built-in AFS)
Applying: mm: rename pud_page_vaddr to pud_pgtable and make it return pmd_t=
 * fix
Applying: Revert "kernel/cgroup/cgroup.c: don't export cgroup_get_e_css twi=
ce"

--Sig_/F/T6l9B/GE9UR6sZMgUtiW.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDRyA4ACgkQAVBC80lX
0GyW/Qf8Dz75JoUtlBSCULK9/qBDx27/Jm+mMdY8HhaBoT3iqY8S9/jz7YM6s0ZD
Fw4PLwRXB9jMmfNqh/6aTCxTAHHJsB61YJfb30qwbte7Koj4DPnn5xIZD2OPNF0N
bw7e+dfGi5cVXVdyyViseF0NhzzKx5+bdDtaOk6JsfOtHgm7NXHgG+2N2PZhHqh0
7ASTySUh5fJKcBeUFNaS1otsaHqkH/zyFjQKswXx3rLU3P4U7tY+r3iKYCv3PLOi
EFjY6vy5PQEACui1/LubMKlK14GpV7LHPIu+BQRJCSRIiTJR91WnU9HhVK9Mua0h
7VpI42aEMwLct6A3IeSAwrerX6nGsQ==
=xGI7
-----END PGP SIGNATURE-----

--Sig_/F/T6l9B/GE9UR6sZMgUtiW.--
