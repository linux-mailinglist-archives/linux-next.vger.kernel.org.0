Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77C443B8E0E
	for <lists+linux-next@lfdr.de>; Thu,  1 Jul 2021 09:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234713AbhGAHN3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Jul 2021 03:13:29 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:32905 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234529AbhGAHN3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 1 Jul 2021 03:13:29 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GFqB947QFz9sX5;
        Thu,  1 Jul 2021 17:10:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1625123457;
        bh=dCjjaCvl4fUsl35OV8HLFtDoM/X+RUIcGf8l5QlgpEY=;
        h=Date:From:To:Cc:Subject:From;
        b=YOLYRke5bwsReOiEhMGX6uGqfAkKKjtgMZ3JHZdi7IzbYoSdGnO425fp/KxYrpWn8
         dQShSqXDu2EWmD8Y8rn/y2t7Px+yziMbsVQI0zgyZOgKZz0HSG0BZqBXE4WGmkMc3m
         +ggWZrHfkmT9l6f46rrebPExlykGD6ZMbt0dRurUG1mciQKQMztx1i9ETj9cjUu7sA
         VhI/CYgvXoDRh0FhLsf3Le/i3LKKBLhTNWxlt/+Un9My1FZTXkm6YdkeWUxXJoQyhU
         r7WHbF4EhyUpXO9/pjdpwvnv3CNAeyICF8Uj8eXFJFR2yq9nGA6up2cpDONEFi0u1t
         VgewvGvS+ii5g==
Date:   Thu, 1 Jul 2021 17:10:55 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 1
Message-ID: <20210701171055.12cc7eca@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/k_JPTexSsNcDwJjD8F6_sdo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/k_JPTexSsNcDwJjD8F6_sdo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

There will be no linux-next releases tomorrow (Friday) or Monday.

Please do not add any v5.15 related material to your linux-next included
branches until after v5.14-rc1 has been released.

Changes since 20210630:

The drm tree gained a conflict against Linus' tree.

Non-merge commits (relative to Linus' tree): 10251
 9196 files changed, 690930 insertions(+), 246346 deletions(-)

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

I am currently merging 330 trees (counting Linus' and 88 trees of bug
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
Merging origin/master (440462198d9c Merge tag 'for-5.14/drivers-2021-06-29'=
 of git://git.kernel.dk/linux-block)
Merging fixes/fixes (614124bea77e Linux 5.13-rc5)
Merging kbuild-current/fixes (c4681547bcce Linux 5.13-rc3)
Merging arc-current/for-curr (13311e74253f Linux 5.13-rc7)
Merging arm-current/fixes (dad7b9896a5d ARM: 9081/1: fix gcc-10 thumb2-kern=
el regression)
Merging arm64-fixes/for-next/fixes (e69012400b0c arm64: mm: don't use CON a=
nd BLK mapping if KFENCE is enabled)
Merging arm-soc-fixes/arm/fixes (048c958f12a2 Merge tag 'tee-reviewer-for-v=
5.13' of git://git.linaro.org:/people/jens.wiklander/linux-tee into arm/fix=
es)
Merging drivers-memory-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging m68k-current/for-linus (c1367ee016e3 m68k: atari: Fix ATARI_KBD_COR=
E kconfig unmet dependency warning)
Merging powerpc-fixes/fixes (60b7ed54a41b powerpc/perf: Fix crash in perf_i=
nstruction_pointer() when ppmu is not set)
Merging s390-fixes/fixes (62fb9874f5da Linux 5.13)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (a118ff661889 selftests: net: devlink_port_split: check =
devlink returned an element before dereferencing it)
Merging bpf/master (d6765985a42a Revert "be2net: disable bh with spin_lock =
in be_process_mcc")
Merging ipsec/master (7c1a80e80cde net: xfrm: fix memory leak in xfrm_user_=
rcv_msg)
Merging netfilter/master (a118ff661889 selftests: net: devlink_port_split: =
check devlink returned an element before dereferencing it)
Merging ipvs/master (f4cdcae03f9c Merge branch 'cxgb4-fixes')
Merging wireless-drivers/master (1f9482aa8d41 mwifiex: bring down link befo=
re deleting interface)
Merging mac80211/master (f4b29d2ee903 Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/pablo/nf)
Merging rdma-fixes/for-rc (13311e74253f Linux 5.13-rc7)
Merging sound-current/for-linus (5c6d4f97267f MAINTAINERS: remove Timur Tab=
i from Freescale SOC sound drivers)
Merging sound-asoc-fixes/for-linus (fd9a20e816a6 Merge remote-tracking bran=
ch 'asoc/for-5.14' into asoc-linus)
Merging regmap-fixes/for-linus (614124bea77e Linux 5.13-rc5)
Merging regulator-fixes/for-linus (42db01d6430c Merge remote-tracking branc=
h 'regulator/for-5.14' into regulator-linus)
Merging spi-fixes/for-linus (dae778069a22 Merge remote-tracking branch 'spi=
/for-5.14' into spi-linus)
Merging pci-current/for-linus (6efb943b8616 Linux 5.13-rc1)
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
Merging crypto-current/master (66192b2e3fd8 crypto: hisilicon/sec - fix the=
 process of disabling sva prefetching)
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
Merging v4l-dvb-fixes/fixes (61c6f04a988e media: s5p-mfc: Fix display delay=
 control creation)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (78cf0eb926cb MIPS: Fix kernel hang under FUN=
CTION_GRAPH_TRACER and PREEMPT_TRACER)
Merging at91-fixes/at91-fixes (6efb943b8616 Linux 5.13-rc1)
Merging omap-fixes/fixes (3ff340e24c9d bus: ti-sysc: Fix gpt12 system timer=
 issue with reserved status)
Merging kvm-fixes/master (f8be156be163 KVM: do not allow mapping valid but =
non-reference-counted pages)
Merging kvms390-fixes/master (735931f9a51a MAINTAINERS: add uv.c also to KV=
M/s390)
Merging hwmon-fixes/hwmon (1b1cf8fe9983 Merge tag 'x86-splitlock-2021-06-28=
' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
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
Merging scsi-fixes/fixes (d1b7f92035c6 scsi: sd: Call sd_revalidate_disk() =
for ioctl(BLKRRPART))
Merging drm-fixes/drm-fixes (62fb9874f5da Linux 5.13)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (62fb9874f5da Linux 5.13)
Merging mmc-fixes/fixes (2fee14ac97dc dt-bindings: mmc: change compatiable =
string for MT8195 mmc host IP)
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
Merging gpio-brgl-fixes/gpio/for-current (c6414e1a2bd2 gpio: AMD8111 and TQ=
MX86 require HAS_IOPORT_MAP)
Merging gpio-intel-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging pinctrl-intel-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging erofs-fixes/fixes (0852b6ca941e erofs: fix 1 lcluster-sized pcluste=
r for big pcluster)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (1d71307a6f94 kunit: add unit test for filt=
ering suites by names)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (17cbe03872be mm/memblock: Fix typo in comment=
 of memblock_phys_alloc_try_nid())
Merging cel-fixes/for-rc (9f4ad9e425a1 Linux 5.12)
Merging drm-misc-fixes/for-linux-next-fixes (1988e0d84161 drm/panel: nt3551=
0: Do not fail if DSI read fails)
Merging kspp-gustavo/for-next/kspp (d07f6ca923ea Linux 5.13-rc2)
Merging kbuild/for-next (c7c90e121e99 kconfig.h: explain IS_MODULE(), IS_EN=
ABLED())
Merging compiler-attributes/compiler-attributes (ca0760e7d79e Compiler Attr=
ibutes: Add continue in comment)
Merging dma-mapping/for-next (2b4bbc6231d7 dma-debug: report -EEXIST errors=
 in add_dma_entry)
Merging asm-generic/master (14462376858e Merge branch 'asm-generic-unaligne=
d' into asm-generic)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (2ac9912d2041 Merge branches 'fixes' and 'misc' into f=
or-next)
CONFLICT (content): Merge conflict in arch/arm64/kernel/process.c
Merging arm64/for-next/core (3d1bf78c7b13 Merge branch 'for-next/sve' into =
for-next/core)
Merging arm-perf/for-next/perf (d96b1b8c9f79 drivers/perf: fix the missed i=
da_simple_remove() in ddr_perf_probe())
Merging arm-soc/for-next (2ded36511b58 ARM: Document merges)
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (b03485fe99f2 Merge tags 'amlogic-arm64-dt-for-v5.=
14-v2' and 'amlogic-arm-dt-for-v5.14' into for-next)
Merging aspeed/for-next (cd946cfe2e7e Merge branches 'defconfig-for-v5.14' =
and 'dt-for-v5.14' into for-next)
Merging at91/at91-next (80cbaa6d3450 Merge branches 'at91-dt' and 'at91-def=
config' into at91-next)
Merging drivers-memory/for-next (316ce128fbbe Merge branch 'for-v5.14/tegra=
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
Merging rockchip/for-next (764f25388c38 Merge branch 'v5.14-clk/next' into =
for-next)
Merging samsung-krzk/for-next (5ce16705e00d Merge branch 'next/defconfig' i=
nto for-next)
Merging scmi/for-linux-next (0a169e13c00d Merge tag 'arm-ffa-5.14-2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-linu=
x-next)
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
Merging clk/clk-next (498cc50b3fa9 clk: hisilicon: hi3559a: Drop __init mar=
kings everywhere)
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
Merging mips/mips-next (cf02ce742f09 MIPS: Fix PKMAP with 32-bit MIPS huge =
page support)
Merging nds32/next (40e0dd851e7b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (ad4e600cbf89 drivers/soc/litex: remove 8-bit sub=
register option)
Merging parisc-hd/for-next (9f4ad9e425a1 Linux 5.12)
Merging powerpc/next (91fc46eced0f powerpc/64s: move ret_from_fork etc abov=
e __end_soft_masked)
Merging soc-fsl/next (242b0b398ccd soc: fsl: enable acpi support in RCPM dr=
iver)
Merging risc-v/for-next (01d13185f183 riscv: add ASID-based tlbflushing met=
hods)
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
Merging s390/for-next (aff7f230c07a Merge branch 'features' into for-next)
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
Merging btrfs/for-next (808c6838dfee Merge branch 'for-next-current-v5.12-2=
0210624' into for-next-20210624)
Merging ceph/master (4c18347238ab ceph: take reference to req->r_parent at =
point of assignment)
Merging cifs/for-next (bbd91626f71c Merge tag '5.14-rc-smb3-fixes-part1' of=
 git://git.samba.org/sfrench/cifs-2.6)
Merging cifsd/cifsd-for-next (be8bcf8baaec Merge pull request #55 from namj=
aejeon/cifsd-for-next)
Merging configfs/for-next (c886fa3cf6ff configfs: simplify configfs_release=
_bin_file)
Merging ecryptfs/next (682a8e2b41ef Merge tag 'ecryptfs-5.13-rc1-updates' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs)
Merging erofs/dev (8215d5b7f15f MAINTAINERS: erofs: update my email address)
Merging exfat/dev (498c0e7a656c exfat: handle wrong stream entry size in ex=
fat_readdir())
Merging ext3/for_next (5fd541e3a933 Pull writeback memcg fix from Munchun S=
ong)
CONFLICT (content): Merge conflict in include/uapi/asm-generic/unistd.h
Merging ext4/dev (16aa4c9a1fbe jbd2: export jbd2_journal_[un]register_shrin=
ker())
Merging f2fs/dev (bf1c5bc21b87 MAINTAINERS: f2fs: update my email address)
Applying: fix up for "f2fs: Convert to using invalidate_lock"
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (c4e0cd4e0c16 virtiofs: Fix spelling mistakes)
Merging gfs2/for-next (8418dabd97ce Merge tag 'gfs2-v5.13-fixes' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2)
Merging jfs/jfs-next (5d299f44d765 jfs: Avoid field-overflowing memcpy())
Merging nfs/linux-next (28b455ffdef5 NFS: Fix fscache read from NFS after c=
ache error)
Merging nfs-anna/linux-next (4f8be1f53bf6 nfs: we don't support removing sy=
stem.nfs4_acl)
Merging nfsd/nfsd-next (353e1e2a7f22 NFSD: Prevent a possible oops in the n=
fs_dirent() tracepoint)
Merging cel/for-next (b9f83ffaa0c0 SUNRPC: Fix null pointer dereference in =
svc_rqst_free())
Merging orangefs/for-next (0fdec1b3c9fb orangefs: fix orangefs df output.)
Merging overlayfs/overlayfs-next (5e717c6fa41f ovl: add debug print to ovl_=
do_getxattr())
Merging ubifs/next (a801fcfeef96 ubifs: Set/Clear I_LINKABLE under i_lock f=
or whiteout inode)
Merging v9fs/9p-next (cba7dcd8878e 9p/trans_virtio: Remove sysfs file on pr=
obe failure)
Merging xfs/for-next (1effb72a8179 xfs: don't wait on future iclogs when pu=
shing the CIL)
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
Merging printk/for-next (48e72544d6f0 Merge branch 'printk-rework' into for=
-next)
Merging pci/next (6a69c06e0e25 Merge branch 'remotes/lorenzo/pci/xgene')
Merging pstore/for-next/pstore (c5d4fb2539ca pstore/blk: Use "%lu" to forma=
t unsigned long)
Merging hid/for-next (f3fb2deb517f Merge branch 'for-5.13/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (31bc56c0138c Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i3c/i3c/next (3e5feb11a829 i3c: master: svc: fix doc warning in svc=
-i3c-master.c)
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (1b1cf8fe9983 Merge tag 'x86-splitlock-202=
1-06-28' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging jc_docs/docs-next (98cf4951842a Merge branch 'path-lookup' into doc=
s-next)
Merging v4l-dvb/master (50e7a31d30e8 media: Fix Media Controller API config=
 checks)
Merging v4l-dvb-next/master (50e7a31d30e8 media: Fix Media Controller API c=
onfig checks)
Merging pm/linux-next (349a2d52ffe5 Merge tag 'devprop-5.14-rc1' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging cpufreq-arm/cpufreq/arm/linux-next (45bd27f5afd5 Merge branch 'cpuf=
req/cppc' into cpufreq/arm/linux-next)
Merging cpupower/cpupower (d07f6ca923ea Linux 5.13-rc2)
Merging devfreq/devfreq-next (8c37d01e1a86 PM / devfreq: passive: Fix get_t=
arget_freq when not using required-opp)
Merging opp/opp/linux-next (4fa82a87ba55 opp: Allow required-opps to be use=
d for non genpd use cases)
Merging thermal/thermal/linux-next (1264017b3ab6 thermal/drivers/int340x/pr=
ocessor_thermal: Fix tcc setting)
Merging dlm/next (957adb68b3f7 fs: dlm: invalid buffer access in lookup err=
or)
Merging swiotlb/linux-next (b655006619b7 of: Add plumbing for restricted DM=
A pool)
Merging rdma/for-next (3d8287544223 RDMA/core: Always release restrack obje=
ct)
Merging net-next/master (b6df00789e28 Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/netdev/net)
CONFLICT (content): Merge conflict in net/sctp/input.c
CONFLICT (content): Merge conflict in Documentation/networking/devlink/devl=
ink-trap.rst
Merging bpf-next/for-next (84fe73996c2e Merge branch 'do_once_lite')
Merging ipsec-next/master (84fe73996c2e Merge branch 'do_once_lite')
Merging mlx5-next/mlx5-next (9a1ac95a59d0 RDMA/mlx5: Refactor get_ts_format=
 functions to simplify code)
Merging netfilter-next/master (84fe73996c2e Merge branch 'do_once_lite')
Merging ipvs-next/master (a212d9f33ed0 Merge branch 'iosm-driver')
Merging wireless-drivers-next/master (ff8744b5eb11 Merge branch '100GbE' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue)
Merging bluetooth/master (76314345b8bf Bluetooth: hci_h5: Disable the hci_s=
uspend_notifier for btrtl devices)
Merging mac80211-next/master (2433647bc8d9 mac80211: Switch to a virtual ti=
me-based airtime scheduler)
Merging mtd/mtd/next (0bcc3939c98d Merge tag 'spi-nor/for-5.14' into mtd/ne=
xt)
Merging nand/nand/next (c06dd49fd59a mtd: rawnand: omap: Add larger page NA=
ND chips support)
Merging spi-nor/spi-nor/next (c17e5c85b32f mtd: spi-nor: remove redundant c=
ontinue statement)
Merging crypto/master (66192b2e3fd8 crypto: hisilicon/sec - fix the process=
 of disabling sva prefetching)
Merging drm/drm-next (8a02ea42bc1d Merge tag 'drm-intel-next-fixes-2021-06-=
29' of git://anongit.freedesktop.org/drm/drm-intel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/vc4/vc4_hdmi.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ttm=
.c
Merging drm-misc/for-linux-next (f18f58012ee8 drm/radeon: Fix NULL derefere=
nce when updating memory stats)
Merging amdgpu/drm-next (07f2df969cc6 PCI: quirks: Quirk PCI d3hot delay fo=
r AMD xhci)
Merging drm-intel/for-linux-next (c90c4c6574f3 drm/i915: Reinstate the mmap=
 ioctl for some platforms)
Merging drm-tegra/drm/tegra/for-next (a562c0783b5f drm/tegra: Don't call SE=
T_APPLICATION_ID in VIC boot)
Merging drm-msm/msm-next (e88bbc91849b Revert "drm/msm/mdp5: provide dynami=
c bandwidth management")
Merging imx-drm/imx-drm/next (fc1e985b67f9 drm/imx: ipuv3-plane: add color =
encoding and range properties)
Merging etnaviv/etnaviv/next (989c9dad6131 drm/etnaviv: add HWDB entry for =
GC7000 rev 6204)
Merging regmap/for-next (d17032f2befa Merge remote-tracking branch 'regmap/=
for-5.14' into regmap-next)
Merging sound/for-next (0cbbeaf37022 ALSA: firewire-lib: Fix 'amdtp_domain_=
start()' when no AMDTP_OUT_STREAM stream is found)
Merging sound-asoc/for-next (fd9a20e816a6 Merge remote-tracking branch 'aso=
c/for-5.14' into asoc-linus)
Merging modules/modules-next (2c0f0f363956 module: correctly exit module_ka=
llsyms_on_each_symbol when fn() !=3D 0)
Merging input/next (cac7100d4c51 Input: hideep - fix the uninitialized use =
in hideep_nvm_unlock())
Merging block/for-next (600adbd4d239 Merge branch 'for-5.14/drivers-late' i=
nto for-next)
Merging device-mapper/for-next (5c0de3d72f8c dm writecache: make writeback =
pause configurable)
Merging pcmcia/pcmcia-next (e9d503fef7da pcmcia: rsrc_nonstatic: Fix call-b=
ack function as reference formatting)
Merging mmc/next (2fee14ac97dc dt-bindings: mmc: change compatiable string =
for MT8195 mmc host IP)
Merging mfd/for-mfd-next (495fb48dbd9b mfd: wm831x: Use DEFINE_RES_IRQ_NAME=
D() and DEFINE_RES_IRQ() to simplify code)
Merging backlight/for-backlight-next (6fc632d3e3e0 video: backlight: qcom-w=
led: Add PMI8994 compatible)
Merging battery/for-next (f1c74a6c07e7 power: supply: ab8500: Fix an old bu=
g)
Merging regulator/for-next (42db01d6430c Merge remote-tracking branch 'regu=
lator/for-5.14' into regulator-linus)
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
Merging selinux/next (d99cf13f1420 selinux: kill 'flags' argument in avc_ha=
s_perm_flags() and avc_audit())
Merging smack/next (fe6bde732be8 Smack: fix doc warning)
Merging tomoyo/master (122fa8c58831 Merge tag 'for-5.14-tag' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/kdave/linux)
Merging tpmdd/next (0178f9d0f60b tpm: Replace WARN_ONCE() with dev_err_once=
() in tpm_tis_status())
Merging watchdog/master (cf813c67d961 watchdog: iTCO_wdt: use dev_err() ins=
tead of pr_err())
Merging iommu/next (2b9d8e3e9a9b Merge branches 'iommu/fixes', 'arm/rockchi=
p', 'arm/smmu', 'x86/vt-d', 'x86/amd', 'virtio' and 'core' into next)
Merging audit/next (0ecc617858fc audit: remove unnecessary 'ret' initializa=
tion)
Merging devicetree/for-next (180208cedfec dt-bindings: crypto: ccree: Conve=
rt to json-schema)
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
Merging mailbox/mailbox-for-next (4f197188da66 MAINTAINERS: add entry for p=
olarfire soc mailbox)
Merging spi/for-next (dae778069a22 Merge remote-tracking branch 'spi/for-5.=
14' into spi-linus)
Merging tip/auto-latest (60ab3ed18cf1 Merge branch 'core/rcu')
CONFLICT (content): Merge conflict in include/linux/rcupdate.h
Merging clockevents/timers/drivers/next (6f64c8159af9 clocksource/drivers/a=
rm_global_timer: Remove duplicated argument in arm_global_timer)
Merging edac/edac-for-next (0a9ece9ba154 EDAC/igen6: fix core dependency)
Merging irqchip/irq/irqchip-next (c51e96dace68 Merge branch irq/irqchip-dri=
ver-updates into irq/irqchip-next)
Merging ftrace/for-next (78c14b385c19 treewide: Add missing semicolons to _=
_assign_str uses)
Merging rcu/rcu/next (2bf6b8f26ff4 Merge branch 'clocksource.2021.06.04a' i=
nto HEAD)
CONFLICT (content): Merge conflict in kernel/time/clocksource.c
CONFLICT (content): Merge conflict in kernel/time/Makefile
Merging kvm/next (a01b45e9d34d KVM: x86: rename apic_access_page_done to ap=
ic_access_memslot_enabled)
Merging kvm-arm/next (188982cda00e Merge branch kvm-arm64/mmu/mte into kvma=
rm-master/next)
Merging kvm-ppc/kvm-ppc-next (72476aaa4691 KVM: PPC: Book3S HV: Fix host ra=
dix SLB optimisation with hash guests)
Merging kvms390/next (1f703d2cf204 KVM: s390: allow facility 192 (vector-pa=
cked-decimal-enhancement facility 2))
Merging xen-tip/linux-next (3de218ff39b9 xen/events: reset active flag for =
lateeoi events later)
Merging percpu/for-next (5c28d6836dc7 Merge branch 'for-5.14' into for-next)
CONFLICT (content): Merge conflict in mm/memcontrol.c
Merging workqueues/for-next (f2ccd0a922b3 workqueue: Add back __printf form=
at validation)
Merging drivers-x86/for-next (0e695c3f7f66 platform/x86: dell-wmi-sysman: C=
hange user experience when Admin/System Password is modified)
Merging chrome-platform/for-next (6efb943b8616 Linux 5.13-rc1)
Merging hsi/for-next (6efb943b8616 Linux 5.13-rc1)
Merging leds/for-next (7b97174cc93f leds: lgm: Fix up includes)
Merging ipmi/for-next (5b32dd281ee0 ipmi: kcs_bmc_aspeed: Fix less than zer=
o comparison of a unsigned int)
Merging driver-core/driver-core-next (3b1f941536af docs: ABI: testing: sysf=
s-firmware-memmap: add some memmap types.)
Merging usb/usb-next (7756f1d6369e phy: qcom-qusb2: Add configuration for S=
M4250 and SM6115)
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (8051334e901f USB: serial: cp210x: add support =
for GPIOs on CP2108)
Merging usb-chipidea-next/for-usb-next (956df1bb0ab8 usb: chipidea: host: f=
ix port index underflow and UBSAN complains)
Merging tty/tty-next (15279ebe99d7 serial: mvebu-uart: remove unused member=
 nb from struct mvebu_uart)
Merging char-misc/char-misc-next (6f746d485fb9 mcb: Use DEFINE_RES_MEM() he=
lper macro and fix the end address)
CONFLICT (content): Merge conflict in include/linux/soundwire/sdw.h
Merging extcon/extcon-next (d97c0ff5a124 extcon: sm5502: Add support for SM=
5504)
Merging phy-next/next (15692a80d949 phy: Revert "phy: ralink: Kconfig: conv=
ert mt7621-pci-phy into 'bool'")
Merging soundwire/next (3d3e88e33633 soundwire: stream: Fix test for DP pre=
pare complete)
Merging thunderbolt/next (b18f901382fd thunderbolt: Fix DROM handling for U=
SB4 DROM)
Merging vfio/next (6a45ece4c9af vfio/pci: Handle concurrent vma faults)
Merging staging/staging-next (77ad1f0e99bd staging: hi6421-spmi-pmic: clean=
up some macros)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging iio/togreg (6cbb3aa0f9d5 staging: rtl8723bs: rtw_efuse: Fix coding =
style)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (46bdcac533cc interconnect: qcom: Add SC7280 interconn=
ect provider driver)
Merging dmaengine/next (8d11cfb0c375 dmaengine: imx-sdma: Remove platform d=
ata header)
Merging cgroup/for-next (cfeaa699186e Merge branch 'for-5.13-fixes' into fo=
r-next)
Merging scsi/for-next (5c1d996e5af6 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (5f638e5ac61e scsi: virtio_scsi: Add validation f=
or residual bytes from response)
Merging vhost/linux-next (7ff6e99e021c virtio_net: disable cb aggressively)
Merging rpmsg/for-next (7486f29e5e60 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (c34c1228fc1c docs: driver-api: gpio: using=
-gpio.rst: avoid using ReST :doc:`foo` markup)
CONFLICT (modify/delete): Documentation/devicetree/bindings/gpio/gpio-davin=
ci.txt deleted in gpio-brgl/gpio/for-next and modified in HEAD. Version HEA=
D of Documentation/devicetree/bindings/gpio/gpio-davinci.txt left in tree.
$ git rm -f Documentation/devicetree/bindings/gpio/gpio-davinci.txt
Merging gpio-intel/for-next (043d7f09bf61 gpiolib: acpi: Add acpi_gpio_get_=
io_resource())
Merging pinctrl/for-next (bfa50166cd9d pinctrl: ralink: rt305x: add missing=
 include)
CONFLICT (content): Merge conflict in include/linux/pinctrl/pinconf-generic=
.h
Merging pinctrl-intel/for-next (258435a1c818 pinctrl: tigerlake: Add Alder =
Lake-M ACPI ID)
Merging pinctrl-renesas/renesas-pinctrl (c3975a73ca94 pinctrl: renesas: r8a=
77980: Add bias pinconf support)
Merging pinctrl-samsung/for-next (6efb943b8616 Linux 5.13-rc1)
Merging pwm/for-next (96e45e520237 pwm: ep93xx: Fix read of uninitialized v=
ariable ret)
Merging userns/for-next (5e6b8a50a7ce cred: add missing return error code w=
hen set_cred_ucounts() failed)
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging kselftest/next (4896df9d53ae selftests/sgx: remove checks for file =
execute permissions)
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
Merging seccomp/for-next/seccomp (9a03abc16c77 selftests/seccomp: Avoid usi=
ng "sysctl" for report)
Merging kspp/for-next/kspp (6a0544606ec7 pgo: rectify comment to proper ker=
nel-doc syntax)
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
Merging auxdisplay/auxdisplay (c784e46c8445 auxdisplay: Add I2C gpio expand=
er example)
Merging kgdb/kgdb/for-next (c8daba4640ac kgdb: Fix fall-through warning for=
 Clang)
Merging hmm/hmm (fe07bfda2fb9 Linux 5.12-rc1)
Merging fpga/for-next (d97176f6040f fpga: dfl: pci: add device IDs for Sili=
com N501x PAC cards)
Merging kunit/test (d07f6ca923ea Linux 5.13-rc2)
Merging cfi/cfi/next (6efb943b8616 Linux 5.13-rc1)
Merging kunit-next/kunit (d07f6ca923ea Linux 5.13-rc2)
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mhi/mhi-next (3bd1d916c79b bus: mhi: core: Add range checks for BHI=
 and BHIe)
Merging memblock/for-next (a4d5613c4dc6 arm: extend pfn_valid to take into =
account freed memory map alignment)
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
Merging akpm-current/current (1446f64f402a linux-next-pre)
CONFLICT (content): Merge conflict in include/linux/compiler_types.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ttm=
.c
CONFLICT (content): Merge conflict in drivers/block/zram/zram_drv.h
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
CONFLICT (content): Merge conflict in arch/powerpc/kernel/smp.c
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (6e9cf0952eb8 powerpc/mm: enable HAVE_MOVE_PMD support)

--Sig_/k_JPTexSsNcDwJjD8F6_sdo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDdan8ACgkQAVBC80lX
0GzywQgAkbgulSYd5h2J3Ncq1KbNc2HYDMP9yZrKBJ+4dQkxXTD/iv+CH9mcqiSq
tlgCpld4UKnM1n3rHVdAaRXFekbmVla33D4wG4/kdrXfagnU9rV+Cs7REEThRnKm
XIN7A6R2T5O/fFNQx+K99raz4NsU1uiG9nHqU8miFrbFJNSt2zjbvuFc6wXrrhpf
KbEoUVrD00c6cg64wxzL1MIi9wh83XVzoR1PTeARPgRoy4v8KWNkZbO8/j3mq0hQ
FOK0aCjXjTiuU/phqFEKiNGq3jBGt/ikx4a0gAMWAuVAIhQWrKY3hwOHoZw7VSBY
6c9HStcpySIPJaW+kGB0a+U2uEUEHg==
=nPfl
-----END PGP SIGNATURE-----

--Sig_/k_JPTexSsNcDwJjD8F6_sdo--
