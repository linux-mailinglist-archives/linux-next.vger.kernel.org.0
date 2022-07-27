Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84620582620
	for <lists+linux-next@lfdr.de>; Wed, 27 Jul 2022 14:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232745AbiG0MJn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jul 2022 08:09:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232735AbiG0MJm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Jul 2022 08:09:42 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 945AB4B48A;
        Wed, 27 Jul 2022 05:09:38 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4LtCJK1WQbz4x1b;
        Wed, 27 Jul 2022 22:09:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1658923777;
        bh=1Zclc4pdmYzlI/AhxrUprU0lDLEuklBp2rZre3YmaVk=;
        h=Date:From:To:Cc:Subject:From;
        b=F0b4cyZYPCZJ3j5aM8qTPkXQuVrDY9kCPuBTvNwxFv8EUYZfRordMrA3dDlDbXojH
         ENfnKnQSgU0V74RckapzPUqfm3l+DWvnzany2AdpBPAthJIMzNv2d6hKqT3nxpdwV/
         Nau+kLSF9rgD3jyHB1KftBTgm/KD6KtElti6YfwqMqBeYrGXmo0KePjRRdVbJii9AL
         4wihHE+mWUgqlH9QB4G9uf7RkjJ6ta/ZORGqXer8ARUCM15gC3NQzCtZtkjnx5VF2v
         MU4STuZBm3FFiTb5ZSGYJi3YGe2+NmEO8SDwk1MYHPP4X5AM+YkA1h4bYQAPUN2evt
         z8fGqf6YRJ11A==
Date:   Wed, 27 Jul 2022 22:09:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 27
Message-ID: <20220727220936.674be420@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eA1wSX9VOZxGZIUeHGm.3Z/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,LOCALPART_IN_SUBJECT,SPF_HELO_PASS,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/eA1wSX9VOZxGZIUeHGm.3Z/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20220726:

The hid tree still had its build failure so I used the version from
next-20220722.

The amdgpu tree still had its build failure, so I reverted a commit.

The block tree gained a build failure so I used the version from
next-20220726.

The bitmap tree gained a build failure for which I applied a patch.

The mm tree lost its run time warning.

Non-merge commits (relative to Linus' tree): 12166
 12071 files changed, 1142938 insertions(+), 314334 deletions(-)

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

I am currently merging 357 trees (counting Linus' and 98 trees of bug
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
Merging origin/master (5de64d44968e Merge tag 's390-5.19-7' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/s390/linux)
Merging fixes/fixes (4a57a8400075 vf/remap: return the amount of bytes actu=
ally deduplicated)
Merging mm-hotfixes/mm-hotfixes-unstable (c32e1841a02a mm/hmm: fault non-ow=
ner device private entries)
Merging kbuild-current/fixes (32346491ddf2 Linux 5.19-rc6)
Merging arc-current/for-curr (952deecb065e arc: dts: Harmonize EHCI/OHCI DT=
 nodes name)
Merging arm-current/fixes (29589ca09a74 ARM: 9208/1: entry: add .ltorg dire=
ctive to keep literals in range)
Merging arm64-fixes/for-next/fixes (410982303772 arm64: hugetlb: Restore TL=
B invalidation for BBM on contiguous ptes)
Merging arm-soc-fixes/arm/fixes (c5cdb9286913 ARM: pxa2xx: Fix GPIO descrip=
tor tables)
Merging drivers-memory-fixes/fixes (1332661e0930 memory: samsung: exynos542=
2-dmc: Fix refcount leak in of_get_dram_timings)
Merging tee-fixes/fixes (98268f2a2a9f Merge branch 'optee_ffa_probe_fix_for=
_v5.18' into fixes)
Merging m68k-current/for-linus (30b5e6ef4a32 m68k: atari: Make Atari ROM po=
rt I/O write macros return void)
Merging powerpc-fixes/fixes (c653c591789b drm/amdgpu: Re-enable DCN for 64-=
bit powerpc)
Merging s390-fixes/fixes (918e75f77af7 s390/archrandom: prevent CPACF trng =
invocations in interrupt context)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (80f6e3080bfc fs-verity: fix signed inte=
ger overflow with i_size near S64_MAX)
Merging net/master (aa40d5a43526 wifi: mac80211: do not abuse fq.lock in ie=
ee80211_do_stop())
Merging bpf/master (f946964a9f79 net: marvell: prestera: fix missed deinit =
sequence)
Merging ipsec/master (9b134b1694ec bridge: Do not send empty IFLA_AF_SPEC a=
ttribute)
Merging netfilter/master (7fb0269720d7 Merge tag 'for-net-2022-05-23' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth)
Merging ipvs/master (677fb7525331 Merge git://git.kernel.org/pub/scm/linux/=
kernel/git/netdev/net)
Merging wireless/for-next (11052589cf5c tcp/udp: Make early_demux back name=
spacified.)
Merging rdma-fixes/for-rc (cc0315564d6e RDMA/irdma: Fix sleep from invalid =
context BUG)
Merging sound-current/for-linus (cf33ce6f0c22 Merge tag 'asoc-fix-v5.19-rc4=
-2' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into f=
or-linus)
Merging sound-asoc-fixes/for-linus (13e78c6df851 Merge remote-tracking bran=
ch 'asoc/for-5.18' into asoc-linus)
Merging regmap-fixes/for-linus (3f05010f243b regmap-irq: Fix offset/index m=
ismatch in read_sub_irq_data())
Merging regulator-fixes/for-linus (122e951eb804 regulator: qcom_smd: correc=
t MP5496 ranges)
Merging spi-fixes/for-linus (b620aa3a7be3 spi: spi-rspi: Fix PIO fallback o=
n RZ platforms)
Merging pci-current/for-linus (a2b36ffbf5b6 x86/PCI: Revert "x86/PCI: Clip =
only host bridge windows for E820 regions")
Merging driver-core.current/driver-core-linus (f2906aa86338 Linux 5.19-rc1)
Merging tty.current/tty-linus (ff6992735ade Linux 5.19-rc7)
Merging usb.current/usb-linus (ff6992735ade Linux 5.19-rc7)
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (ff6992735ade Linux 5.19-rc7)
Merging phy/fixes (f2906aa86338 Linux 5.19-rc1)
Merging staging.current/staging-linus (32346491ddf2 Linux 5.19-rc6)
Merging iio-fixes/fixes-togreg (315f7e15c261 Merge tag 'iio-fixes-for-5.19a=
' of https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into char-mi=
sc-next)
Merging counter-fixes/fixes-togreg (f2906aa86338 Linux 5.19-rc1)
Merging char-misc.current/char-misc-linus (32346491ddf2 Linux 5.19-rc6)
Merging soundwire-fixes/fixes (f2906aa86338 Linux 5.19-rc1)
Merging thunderbolt-fixes/fixes (03c765b0e3b4 Linux 5.19-rc4)
Merging input-current/for-linus (2a96271fb66c Input: document the units for=
 resolution of size axes)
Merging crypto-current/master (87d044096ea6 crypto: ccp - Fix device IRQ co=
unting by using platform_irq_count())
Merging vfio-fixes/for-linus (afe4e376ac5d vfio: Move IOMMU_CAP_CACHE_COHER=
ENCY test to after we know we have a group)
Merging kselftest-fixes/fixes (9b4d5c01eb23 selftests: make use of GUP_TEST=
_FILE macro)
Merging modules-fixes/modules-linus (e69a66147d49 module: kallsyms: Ensure =
preemption in add_kallsyms() with PREEMPT_RT)
Merging dmaengine-fixes/fixes (607a48c78e6b dt-bindings: dma: allwinner,sun=
50i-a64-dma: Fix min/max typo)
Merging backlight-fixes/for-backlight-fixes (a38fd8748464 Linux 5.12-rc2)
Merging mtd-fixes/mtd/fixes (0fddf9ad06fd mtd: rawnand: gpmi: Set WAIT_FOR_=
READY timeout based on program/erase times)
Merging mfd-fixes/for-mfd-fixes (a61f4661fba4 mfd: intel_quark_i2c_gpio: Re=
vert "Constify static struct resources")
Merging v4l-dvb-fixes/fixes (3bcc2c1eade4 media: rkvdec: Disable H.264 erro=
r detection)
Merging reset-fixes/reset/fixes (a57f68ddc886 reset: Fix devm bulk optional=
 exclusive control getter)
Merging mips-fixes/mips-fixes (88084a3df167 Linux 5.19-rc5)
Merging at91-fixes/at91-fixes (ef0324b6415d ARM: dts: lan966x: fix sys_clk =
frequency)
Merging omap-fixes/fixes (2eb502f496f7 ARM: dts: am33xx: Fix MMCHS0 dma pro=
perties)
Merging kvm-fixes/master (cf5029d5dd7c KVM: x86: Protect the unused bits in=
 MSR exiting flags)
Merging kvms390-fixes/master (242c04f01377 KVM: s390: selftests: Use TAP in=
terface in the reset test)
Merging hwmon-fixes/hwmon (88084a3df167 Linux 5.19-rc5)
Merging nvdimm-fixes/libnvdimm-fixes (17d9c15c9b9e fsdax: Fix infinite loop=
 in dax_iomap_rw())
Merging cxl-fixes/fixes (e35f5718903b cxl/mbox: Fix missing variable payloa=
d checks in cmd size validation)
Merging btrfs-fixes/next-fixes (af39011ec0c7 Merge branch 'misc-5.19' into =
next-fixes)
Merging vfs-fixes/fixes (c3497fd009ef fix short copy handling in copy_mc_pi=
pe_to_iter())
Merging dma-mapping-fixes/for-linus (3be4562584bb dma-direct: use the corre=
ct size for dma_set_encrypted())
Merging i3c-fixes/i3c/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging drivers-x86-fixes/fixes (5ad26161a371 ACPI: video: Fix acpi_video_h=
andles_brightness_key_presses())
Merging samsung-krzk-fixes/fixes (c4c79525042a ARM: exynos: Fix refcount le=
ak in exynos_map_pmu)
Merging pinctrl-samsung-fixes/fixes (f2906aa86338 Linux 5.19-rc1)
Merging devicetree-fixes/dt/linus (0b9431c8221c dt-bindings: display: arm,m=
alidp: remove bogus RQOS property)
Merging dt-krzk-fixes/fixes (f2906aa86338 Linux 5.19-rc1)
Merging scsi-fixes/fixes (355bf2e036c9 scsi: pm80xx: Set stopped phy's link=
rate to Disabled)
Merging drm-fixes/drm-fixes (e0dccc3b76fb Linux 5.19-rc8)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (a7a47a5dfa9a drm/i915/reset: =
Add additional steps for Wa_22011802037 for execlist backend)
Merging mmc-fixes/fixes (51189eb9ddc8 mmc: sdhci-omap: Fix a lockdep warnin=
g for PM runtime init)
Merging rtc-fixes/rtc-fixes (bd33335aa93d rtc: cmos: Disable irq around dir=
ect invocation of cmos_interrupt())
Merging gnss-fixes/gnss-linus (a111daf0c53a Linux 5.19-rc3)
Merging hyperv-fixes/hyperv-fixes (49d6a3c062a1 x86/Hyper-V: Add SEV negoti=
ate protocol support in Isolation VM)
Merging soc-fsl-fixes/fix (4b0986a3613c Linux 5.18)
Merging risc-v-fixes/fixes (88bd24d73d5b riscv: compat: vdso: Fix vdso_inst=
all target)
Merging risc-v-mc-fixes/dt-fixes (efa310ba0071 riscv: dts: microchip: hook =
up the mpfs' l2cache)
Merging pidfd-fixes/fixes (03ba0fe4d09f file: simplify logic in __close_ran=
ge())
Merging fpga-fixes/fixes (f2906aa86338 Linux 5.19-rc1)
Merging spdx/spdx-linus (58301e1c15db Documentation: samsung-s3c24xx: Add b=
lank line after SPDX directive)
Merging gpio-brgl-fixes/gpio/for-current (e0dccc3b76fb Linux 5.19-rc8)
Merging gpio-intel-fixes/fixes (b93a8b2c5161 gpio: dln2: make irq_chip immu=
table)
Merging pinctrl-intel-fixes/fixes (ba79c5e45eec MAINTAINERS: Update Intel p=
in control to Supported)
Merging erofs-fixes/fixes (8b1ac84dcf2c Documentation/ABI: sysfs-fs-erofs: =
Fix Sphinx errors)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (f2906aa86338 Linux 5.19-rc1)
Merging ubifs-fixes/fixes (c3c07fc25f37 ubi: fastmap: Return error code if =
memory allocation fails in add_aeb())
Merging memblock-fixes/fixes (c94afc46cae7 memblock: use kfree() to release=
 kmalloced memblock regions)
Merging cel-fixes/for-rc (1197eb5906a5 lockd: fix nlm_close_files)
Merging irqchip-fixes/irq/irqchip-fixes (1357d2a65601 irqchip/apple-aic: Ma=
ke symbol 'use_fast_ipi' static)
Merging renesas-fixes/fixes (432b52eea3dc ARM: shmobile: defconfig: Restore=
 graphical consoles)
Merging broadcom-fixes/fixes (a26f045984e7 Merge branch 'devicetree/fixes' =
into fixes)
Merging perf-current/perf/urgent (4b335e1e0d6f perf trace: Fix SIGSEGV when=
 processing syscall args)
Merging efi-fixes/urgent (ca0d181c9ce5 efi/x86-mixed: leave RET unmitigated=
 but move it into .rodata)
Merging zstd-fixes/zstd-linus (88a309465b3f lib: zstd: clean up double word=
 in comment.)
Merging battery-fixes/fixes (093d27bb6f2d power: supply: core: Fix boundary=
 conditions in interpolation)
Merging drm-misc-fixes/for-linux-next-fixes (0c09bc33aa8e drm/simpledrm: Fi=
x return type of simpledrm_simple_display_pipe_mode_valid())
Merging kbuild/for-next (46a6e351fe60 kconfig: Qt5: tell the user which pac=
kages are required)
Merging clang-format/clang-format (781121a7f6d1 clang-format: Fix space aft=
er for_each macros)
Merging perf/perf/core (a061a8ad3f90 perf test: Avoid sysfs state affecting=
 fake events)
Merging compiler-attributes/compiler-attributes (7c00621dcaee compiler_type=
s: mark __compiletime_assert failure as __noreturn)
Merging dma-mapping/for-next (0d06132fc84b PCI/P2PDMA: Remove pci_p2pdma_[u=
n]map_sg())
Merging asm-generic/master (750e571acf3d Merge branch 'asm-generic-fixes' i=
nto asm-generic)
Merging arc/for-next (f2906aa86338 Linux 5.19-rc1)
Merging arm/for-next (e035a96f2536 Merge branches 'misc' and 'fixes' into f=
or-next)
Merging arm64/for-next/core (892f7237b3ff arm64: Delay initialisation of cp=
uinfo_arm64::reg_{zcr,smcr})
Merging arm-perf/for-next/perf (aaaee7b55c9e docs: perf: Include hns3-pmu.r=
st in toctree to fix 'htmldocs' WARNING)
Merging arm-soc/for-next (172822ac95dd soc: document merges)
CONFLICT (modify/delete): arch/arm/mach-bcm/bcm63xx.c deleted in arm-soc/fo=
r-next and modified in HEAD.  Version HEAD of arch/arm/mach-bcm/bcm63xx.c l=
eft in tree.
CONFLICT (modify/delete): arch/arm/mach-davinci/board-dm644x-evm.c deleted =
in arm-soc/for-next and modified in HEAD.  Version HEAD of arch/arm/mach-da=
vinci/board-dm644x-evm.c left in tree.
CONFLICT (modify/delete): arch/arm/mach-davinci/board-dm646x-evm.c deleted =
in arm-soc/for-next and modified in HEAD.  Version HEAD of arch/arm/mach-da=
vinci/board-dm646x-evm.c left in tree.
CONFLICT (modify/delete): arch/arm/mach-davinci/board-neuros-osd2.c deleted=
 in arm-soc/for-next and modified in HEAD.  Version HEAD of arch/arm/mach-d=
avinci/board-neuros-osd2.c left in tree.
CONFLICT (modify/delete): arch/arm/mach-davinci/dm644x.c deleted in arm-soc=
/for-next and modified in HEAD.  Version HEAD of arch/arm/mach-davinci/dm64=
4x.c left in tree.
CONFLICT (modify/delete): arch/arm/mach-davinci/dm646x.c deleted in arm-soc=
/for-next and modified in HEAD.  Version HEAD of arch/arm/mach-davinci/dm64=
6x.c left in tree.
$ git rm -f arch/arm/mach-bcm/bcm63xx.c arch/arm/mach-davinci/board-dm644x-=
evm.c arch/arm/mach-davinci/board-dm646x-evm.c arch/arm/mach-davinci/board-=
neuros-osd2.c arch/arm/mach-davinci/dm644x.c arch/arm/mach-davinci/dm646x.c
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (147c83586707 Merge branch 'v5.20/drivers' into fo=
r-next)
Merging aspeed/for-next (bfcbea2c93e5 ARM: dts: aspeed: nuvia: rename vendo=
r nuvia to qcom)
Merging at91/at91-next (38b729bf1ee6 Merge branch 'at91-dt' into at91-next)
Merging broadcom/next (ade0d6ecf54a Merge branch 'drivers/next' into next)
Merging drivers-memory/for-next (1b33eb4acdc8 Merge branch 'for-v5.20/mem-c=
trl-next-late' into for-next)
Merging imx-mxs/for-next (37960df982d0 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (cb293d3b430e Merge branch 'for_5.15/drivers-soc' int=
o next)
Merging mediatek/for-next (5281655db0e1 Merge branch 'v5.19-next/soc' into =
for-next)
Merging mvebu/for-next (bc50bfd4f018 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (ad2fe4582c48 Merge branches 'omap-for-v5.20/omap1', =
'omap-for-v5.20/ti-sysc' and 'omap-for-v5.20/soc' into for-next)
Merging qcom/for-next (58b9ca29ff61 Merge branches 'arm64-for-5.20', 'arm64=
-defconfig-for-5.20', 'clk-for-5.20', 'dts-for-5.20', 'dts-fixes-for-5.19' =
and 'drivers-for-5.20' into for-next)
Merging raspberrypi/for-next (c5915b53d4c2 dt-bindings: soc: bcm: Convert b=
rcm,bcm2835-vchiq to json-schema)
Merging renesas/next (b5468cb7909f Merge branches 'renesas-arm-dt-for-v5.20=
' and 'renesas-dt-bindings-for-v5.20' into renesas-next)
Merging reset/reset/next (9c68d4e621eb dt-bindings: reset: renesas,rzg2l-us=
bphy-ctrl: Document RZ/G2UL USBPHY Control bindings)
Merging rockchip/for-next (2e1170c71ec0 Merge branch 'v5.20-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (5642cb8ce0f1 Merge branch 'next/dt' into for=
-next)
Merging scmi/for-linux-next (e0dccc3b76fb Linux 5.19-rc8)
Merging stm32/stm32-next (4b43ff02d2a4 ARM: dts: stm32: Add ST MIPID02 bind=
ings to AV96)
Merging sunxi/sunxi/for-next (3a83b092dd59 Merge branch 'sunxi/dt-for-5.20'=
 into sunxi/for-next)
Merging tee/next (db30e53bf897 Merge branch 'tee_cleanup_for_v5.19' into ne=
xt)
Merging tegra/for-next (393c6c3a6152 Merge branch for-5.20/arm64/defconfig =
into for-next)
Merging ti/ti-next (62b9e4033c13 Merge branches 'ti-drivers-soc-next' and '=
ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (516de80d448f Merge branch 'zynqmp/soc' into for-ne=
xt)
Merging clk/clk-next (b293bc9286ee Merge branch 'clk-fixes' into clk-next)
Merging clk-imx/for-next (c196175acdd3 clk: imx: clk-fracn-gppll: Add more =
freq config for video pll)
Merging clk-renesas/renesas-clk (0e704f6c42dc clk: renesas: rcar-gen4: Fix =
initconst confusion for cpg_pll_config)
Merging clk-samsung/for-next (b35f27fe73d8 clk: samsung: exynosautov9: add =
cmu_peric1 clock support)
Merging csky/linux-next (01ab4649ef5a csky: Move HEAD_TEXT_SECTION out of _=
_init_begin-end)
Merging loongarch/loongarch-next (a111daf0c53a Linux 5.19-rc3)
Merging m68k/for-next (b508128bb0d1 m68k: defconfig: Update defconfigs for =
v5.19-rc1)
Merging m68knommu/for-next (472e68df4a5e m68k: Fix syntax errors in comment=
s)
Merging microblaze/next (78b5f52ab6f6 microblaze: fix typos in comments)
Merging mips/mips-next (466ab2ea239b MIPS: BMIPS: Utilize cfe_die() for inv=
alid DTB)
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (7f313801e4ff MAINTAINERS: Update Richard Henders=
on's address)
Merging parisc-hd/for-next (871487f56490 parisc: Drop zero variable initial=
isations in mm/init.c)
Merging powerpc/next (da4ef6d652fc powerpc/64e: Fix build failure with GCC =
12 (unrecognized opcode: `wrteei'))
Merging soc-fsl/next (4b0986a3613c Linux 5.18)
Merging risc-v/for-next (ba6cfef057e1 riscv: enable Docker requirements in =
defconfig)
CONFLICT (content): Merge conflict in arch/riscv/include/asm/errata_list.h
CONFLICT (content): Merge conflict in arch/riscv/include/asm/pci.h
Merging risc-v-mc/dt-for-next (88d319c6abae riscv: dts: microchip: Add mpfs=
' topology information)
Merging s390/for-next (a4c6658a01c9 Merge branch 'features' into for-next)
Merging sh/for-next (8518e694203d sh: pgtable-3level: Fix cast to pointer f=
rom integer of different size)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (af3e16101cee um: include sys/types.h for size_t)
Merging xtensa/xtensa-for-next (0847d167d0f9 xtensa: enable ARCH_HAS_GCOV_P=
ROFILE_ALL)
Merging pidfd/for-next (deea718a1c42 Merge branch 'fs.setgid' into for-next)
Merging fscrypt/master (218d921b581e fscrypt: add new helper functions for =
test_dummy_encryption)
Merging fscache/fscache-next (0885eacdc81f Merge tag 'nfsd-5.19-1' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/cel/linux)
Merging afs/afs-next (26291c54e111 Linux 5.17-rc2)
Merging btrfs/for-next (7cd10df47696 Merge branch 'for-next-next-v5.19-2022=
0726' into for-next-20220726)
Merging ceph/master (91c08da8e7fc fscrypt: add fscrypt_context_for_new_inod=
e)
Merging cifs/for-next (7b1650e8c59a cifs: remove remaining build warnings)
Merging configfs/for-next (84ec758fb2da configfs: fix a race in configfs_{,=
un}register_subsystem())
Merging ecryptfs/next (682a8e2b41ef Merge tag 'ecryptfs-5.13-rc1-updates' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs)
Merging erofs/dev (cc2a171372c6 erofs: get rid of the leftover PAGE_SIZE in=
 dir.c)
Merging exfat/dev (2f0bdba62933 exfat: remove duplicate write inode for ext=
ending dir/file)
Merging ext3/for_next (5b02b6900c8d Pull fsnotify typo fix.)
Merging ext4/dev (f8dc286e4d94 jbd2: fix outstanding credits assert in jbd2=
_journal_commit_transaction())
Merging f2fs/dev (0b1f0a1678c9 f2fs: don't bother wait_ms by foreground gc)
Merging fsverity/fsverity (8da572c52a9b fs-verity: mention btrfs support)
Merging fuse/for-next (73fb2c8b6178 virtio_fs: Modify format for virtio_fs_=
direct_access)
Merging gfs2/for-next (44dab005fd42 gfs2: Minor gfs2_glock_nq_m cleanup)
Merging jfs/jfs-next (e471e5942c00 fs/jfs: Remove dead code)
Merging ksmbd/ksmbd-for-next (f02247eddbe3 ksmbd: fix racy issue while dest=
roying session on multichannel)
Merging nfs/linux-next (29946fbcb2c3 SUNRPC: Remove xdr_align_data() and xd=
r_expand_hole())
Merging nfs-anna/linux-next (4f40a5b55446 NFSv4: Add an fattr allocation to=
 _nfs4_discover_trunking())
Merging nfsd/for-next (bbeefc0ad610 SUNRPC: Fix xdr_encode_bool())
Merging ntfs3/master (604a9d272dc3 fs/ntfs3: Remove unnecessary 'NULL' valu=
es from pointers)
Merging orangefs/for-next (40a74870b2d1 orangefs: Fix the size of a memory =
allocation in orangefs_bufmap_alloc())
Merging overlayfs/overlayfs-next (4a47c6385bb4 ovl: turn of SB_POSIXACL wit=
h idmapped layers temporarily)
Merging ubifs/next (8c03a1c21d72 ubi: ubi_create_volume: Fix use-after-free=
 when volume creation failed)
Merging v9fs/9p-next (aa7aeee16948 net/9p: Initialize the iounit field duri=
ng fid creation)
Merging xfs/for-next (4869b6e84a23 xfs: Fix typo 'the the' in comment)
Merging zonefs/for-next (6bac30bb8ff8 zonefs: Call page_address() on page a=
cquired with GFP_KERNEL flag)
Merging iomap/iomap-for-next (478af190cb6c iomap: remove iomap_writepage)
Merging djw-vfs/vfs-for-next (49df34221804 fs: fix an infinite loop in ioma=
p_fiemap)
Merging file-locks/locks-next (0064b3d9f96f fs/lock: Rearrange ops in flock=
 syscall.)
Merging vfs/for-next (3f57a53ae24a Merge branches 'work.misc', 'work.iov_it=
er', 'work.namei' and 'work.lseek-2' into for-next)
CONFLICT (content): Merge conflict in fs/btrfs/file.c
CONFLICT (content): Merge conflict in net/9p/client.c
Merging printk/for-next (337b15b02db7 Merge branch 'rework/kthreads' into f=
or-next)
Merging pci/next (17fc94dd0f52 Merge branch 'pci/header-cleanup-immutable')
Merging pstore/for-next/pstore (2c09d1443b9b pstore/zone: cleanup "rcnt" ty=
pe)
Merging hid/for-next (7af32d156ad7 Revert "HID: nintendo: Fix unused-const-=
variable compiler warning")
$ git reset --hard HEAD^
Merging next-20220722 version of hid
Merging i2c/i2c/for-next (0c42dacaa607 Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i3c/i3c/next (f2906aa86338 Linux 5.19-rc1)
Merging dmi/dmi-for-next (f97a2103f1a7 firmware: dmi: Move product_sku info=
 to the end of the modalias)
Merging hwmon-staging/hwmon-next (7d4edccc9bbf hwmon: (sht15) Fix wrong ass=
umptions in device remove callback)
Merging jc_docs/docs-next (5a491c9714d0 docs: Remove spurious tag from admi=
n-guide/mm/overcommit-accounting.rst)
Merging v4l-dvb/master (8bd1dbf8d580 media: rkisp1: debug: Add dump file in=
 debugfs for MI main path registers)
Merging v4l-dvb-next/master (8bd1dbf8d580 media: rkisp1: debug: Add dump fi=
le in debugfs for MI main path registers)
Merging pm/linux-next (8cfc5f8d77b2 Merge branches 'pm-cpuidle' and 'pm-cpu=
freq' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (33fe1cb20cf4 cpufreq: tegra194:=
 Staticize struct tegra_cpufreq_soc instances)
Merging cpupower/cpupower (f2906aa86338 Linux 5.19-rc1)
Merging devfreq/devfreq-next (53f853d55e31 PM / devfreq: tegra30: Add error=
 message for devm_devfreq_add_device())
Merging opp/opp/linux-next (3466ea2cd6b6 OPP: Don't drop opp->np reference =
while it is still in use)
Merging thermal/thermal/linux-next (17a217fcefe5 thermal/of: Initialize tri=
p points separately)
Merging ieee1394/for-next (54b3bd99f094 firewire: nosy: switch from 'pci_' =
to 'dma_' API)
Merging dlm/next (0f24debbb847 fs: dlm: move kref_put assert for lkb struct=
s)
Merging rdma/for-next (c2ea08ca5e4a RDMA/rxe: Replace __rxe_do_task by rxe_=
run_task)
Merging net-next/master (48c022d16272 Merge branch 'tls-rx-decrypt-from-the=
-tcp-queue')
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/marvell/armada-70=
40-mochabin.dts
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/marvell/armada-80=
40-mcbin.dtsi
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/marvell/armada-80=
40-puzzle-m801.dts
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/rockchip/rk3568-b=
pi-r2-pro.dts
Merging bpf-next/for-next (d295daf50575 selftests/bpf: Attach to socketcall=
() in test_probe_user)
Merging ipsec-next/master (5e25c25aa2c0 xfrm: improve wording of comment ab=
ove XFRM_OFFLOAD flags)
Merging mlx5-next/mlx5-next (b0bb369ee451 net/mlx5: fs, allow flow table cr=
eation with a UID)
Merging netfilter-next/master (677fb7525331 Merge git://git.kernel.org/pub/=
scm/linux/kernel/git/netdev/net)
Merging ipvs-next/master (677fb7525331 Merge git://git.kernel.org/pub/scm/l=
inux/kernel/git/netdev/net)
Merging bluetooth/master (14202eff214e Bluetooth: btusb: Detect if an ACL p=
acket is in fact an ISO packet)
Merging wireless-next/for-next (8e4372e61785 Merge branch 'add-mtu-change-w=
ith-stmmac-interface-running')
Merging mtd/mtd/next (ad9b10d1eaad mtd: core: introduce of support for dyna=
mic partitions)
Merging nand/nand/next (e16eceea863b mtd: rawnand: arasan: Fix clock rate i=
n NV-DDR)
Merging spi-nor/spi-nor/next (41e4f15f02af mtd: spi-nor: esmt: Use correct =
name of f25l32qa)
Merging crypto/master (9d2bb9a74b28 crypto: testmgr - some more fixes to RS=
A test vectors)
CONFLICT (content): Merge conflict in MAINTAINERS
Applying: Revert "Revert "drm/amdgpu: add drm buddy support to amdgpu""
Merging drm/drm-next (2bc7ea71a737 Merge tag 'topic/nouveau-misc-2022-07-27=
' of git://anongit.freedesktop.org/drm/drm into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/Kconfig
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_engine_=
cs.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/uc/intel_guc_=
submission.c
Merging drm-misc/for-linux-next (6f2c8d5f1659 drm/amdgpu: Fix for drm buddy=
 memory corruption)
Merging amdgpu/drm-next (1b54a0121dba drm/amd/display: Reduce stack size in=
 the mode support function)
Merging drm-intel/for-linux-next (891ce1c9623f Merge tag 'drm-misc-next-fix=
es-2022-07-14' of git://anongit.freedesktop.org/drm/drm-misc into drm-next)
Merging drm-tegra/for-next (135f4c551d51 drm/tegra: vic: Use devm_platform_=
ioremap_resource())
Merging drm-msm/msm-next (cb77085b1f0a drm/msm/dpu: Fix for non-visible pla=
nes)
Merging drm-msm-lumag/msm-next-lumag (1ff1da40d6fc Merge branches 'msm-next=
-lumag-core', 'msm-next-lumag-dpu', 'msm-next-lumag-dp', 'msm-next-lumag-ds=
i', 'msm-next-lumag-hdmi', 'msm-next-lumag-mdp5' and 'msm-next-lumag-mdp4' =
into msm-next-lumag)
Merging imx-drm/imx-drm/next (927d8fd465ad drm/imx: ipuv3-plane: Remove red=
undant color encoding and range initialisation)
Merging etnaviv/etnaviv/next (2829a9fcb738 drm/etnaviv: reap idle softpin m=
appings when necessary)
Merging fbdev/for-next (96eed011e241 video: fbdev: Make registered_fb[] pri=
vate to fbmem.c)
Merging regmap/for-next (739f872e48d4 regmap: permit to set reg_update_bits=
 with bulk implementation)
Merging sound/for-next (c578d5da10dc ALSA: hda/realtek: Enable speaker and =
mute LEDs for HP laptops)
Merging sound-asoc/for-next (465ece1c0f9a Merge remote-tracking branch 'aso=
c/for-5.20' into asoc-next)
Merging modules/modules-next (554694ba120b module: Replace kmap() with kmap=
_local_page())
Merging input/next (ebfa0043c96c Input: deactivate MT slots when inhibiting=
 or suspending devices)
Merging block/for-next (b8b914c06a6f Merge branch 'for-5.20/drivers-post' i=
nto for-next)
CONFLICT (content): Merge conflict in block/fops.c
CONFLICT (content): Merge conflict in fs/btrfs/extent_io.c
CONFLICT (content): Merge conflict in fs/btrfs/raid56.c
CONFLICT (modify/delete): fs/io_uring.c deleted in block/for-next and modif=
ied in HEAD.  Version HEAD of fs/io_uring.c left in tree.
$ git rm -f fs/io_uring.c
Applying: fixup for "keep iocb_flags() result cached in struct file"
$ git reset --hard HEAD^
Merging next-20220726 version of block
CONFLICT (content): Merge conflict in block/fops.c
CONFLICT (content): Merge conflict in fs/btrfs/extent_io.c
CONFLICT (content): Merge conflict in fs/btrfs/raid56.c
CONFLICT (modify/delete): fs/io_uring.c deleted in e277a38e4796160ac1281943=
8e87ea3fc85b7561 and modified in HEAD.  Version HEAD of fs/io_uring.c left =
in tree.
$ git rm -f fs/io_uring.c
[master df426afd30aa] next-20220726/block
Applying: fixup for "keep iocb_flags() result cached in struct file"
[master 570601aaac10] next-20220726/block
Merging device-mapper/for-next (4cc8c8e6a2b8 dm verity: conditionally enabl=
e branching for "try_verify_in_tasklet")
Merging libata/for-next (0184898dd14d ata: libata-scsi: fix result type of =
ata_ioc32())
Merging pcmcia/pcmcia-next (2ef4bb24ff39 pcmcia: Use platform_get_irq() to =
get the interrupt)
Merging mmc/next (527f36f5efa4 mmc: mediatek: add support for SDIO eint wak=
up IRQ)
Merging mfd/for-mfd-next (0a2de5bb0216 dt-bindings: mfd: syscon: Update Lee=
 Jones' email address)
Merging backlight/for-backlight-next (f2ac0a8f8a03 backlight: lp855x: Switc=
h to atomic PWM API)
Merging battery/for-next (c9d8468158ad power: supply: olpc_battery: Hold th=
e reference returned by of_find_compatible_node)
Merging regulator/for-next (4c7da3741804 regulator: Add missing type for 'r=
egulator-microvolt-offset')
Merging security/next (ed56f4b5173e MAINTAINERS: update the LSM maintainer =
info)
Merging apparmor/apparmor-next (79eb2711c919 apparmor: correct config refer=
ence to intended one)
Merging integrity/next-integrity (1d212f9037b0 Merge remote-tracking branch=
 'linux-integrity/kexec-keyrings' into next-integrity)
Merging keys/keys-next (2d743660786e Merge branch 'fixes' of git://git.kern=
el.org/pub/scm/linux/kernel/git/viro/vfs)
Merging safesetid/safesetid-next (cd5fc01e17e1 LSM: SafeSetID: fix bug duri=
ng GID policy check)
Merging selinux/next (ef54ccb61616 selinux: selinux_add_opt() callers free =
memory)
Merging smack/next (b50503990d88 smack: Remove the redundant lsm_inode_allo=
c)
Merging tomoyo/master (05fe531eb3f1 kernel/hung_task: show backtrace of tas=
ks with locks held)
Merging tpmdd/next (1679eb4a6194 tpm: eventlog: Fix section mismatch for DE=
BUG_SECTION_MISMATCH)
Merging watchdog/master (2d27e5284109 watchdog: armada_37xx_wdt: check the =
return value of devm_ioremap() in armada_37xx_wdt_probe())
CONFLICT (modify/delete): Documentation/devicetree/bindings/arm/freescale/f=
sl,scu.txt deleted in HEAD and modified in watchdog/master.  Version watchd=
og/master of Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt le=
ft in tree.
$ git rm -f Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
Merging iommu/next (fd9630ce2610 Merge branches 'arm/exynos', 'arm/mediatek=
', 'arm/msm', 'arm/smmu', 'virtio', 'x86/vt-d', 'x86/amd' and 'core' into n=
ext)
Merging audit/next (546093206ba1 audit: make is_audit_feature_set() static)
Merging devicetree/for-next (91118fa994a9 dt-bindings: panel: raydium,rm671=
91: Add missing type to 'video-mode')
Merging dt-krzk/for-next (12f158808510 dt-bindings: arm: aspeed: add Aspeed=
 Evaluation boards)
Merging mailbox/mailbox-for-next (79f9fbe30352 mailbox: qcom-ipcc: Fix -Wun=
used-function with CONFIG_PM_SLEEP=3Dn)
Merging spi/for-next (f37938de47b3 Merge remote-tracking branch 'spi/for-5.=
20' into spi-next)
Merging tip/master (776db515ca7e Merge branch into tip/master: 'x86/vmware')
CONFLICT (content): Merge conflict in arch/x86/kernel/kexec-bzimage64.c
Merging clockevents/timers/drivers/next (c19e18637d89 clocksource/drivers/s=
un4i: Remove unnecessary (void*) conversions)
Merging edac/edac-for-next (f3b921f8d9d6 EDAC/ghes: Set the DIMM label unco=
nditionally)
Merging irqchip/irq/irqchip-next (2bd1753e8c43 Merge branch irq/misc-5.20 i=
nto irq/irqchip-next)
Merging ftrace/for-next (41065bf81386 selftests/kprobe: Update test for no =
event name syntax error)
Merging rcu/rcu/next (57262d2c56b8 selftests/nolibc: Avoid generated files =
being committed)
CONFLICT (content): Merge conflict in arch/loongarch/Kconfig
Merging kvm/next (a4850b5590d0 Merge tag 'kvm-s390-next-5.20-1' of https://=
git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
CONFLICT (content): Merge conflict in arch/x86/kvm/vmx/capabilities.h
CONFLICT (content): Merge conflict in arch/x86/kvm/x86.c
CONFLICT (content): Merge conflict in tools/testing/selftests/kvm/lib/aarch=
64/ucall.c
CONFLICT (content): Merge conflict in tools/testing/selftests/kvm/s390x/mem=
op.c
CONFLICT (content): Merge conflict in tools/testing/selftests/kvm/s390x/res=
ets.c
CONFLICT (content): Merge conflict in tools/testing/selftests/kvm/s390x/syn=
c_regs_test.c
CONFLICT (content): Merge conflict in tools/testing/selftests/kvm/s390x/tpr=
ot.c
Merging kvm-arm/next (ae98a4a98993 Merge branch kvm-arm64/sysreg-cleanup-5.=
20 into kvmarm-master/next)
CONFLICT (content): Merge conflict in tools/testing/selftests/kvm/aarch64/v=
gic_init.c
Merging kvms390/next (f5ecfee94493 KVM: s390: resetting the Topology-Change=
-Report)
Merging xen-tip/linux-next (a47336535f0f xen: don't require virtio with gra=
nts for non-PV guests)
Merging percpu/for-next (a111daf0c53a Linux 5.19-rc3)
Merging workqueues/for-next (8bee9dd953b6 workqueue: Switch to new kerneldo=
c syntax for named variable macro argument)
Merging drivers-x86/for-next (7a4a04f4e90d platform/surface: tabletsw: Fix =
__le32 integer access)
Merging chrome-platform/for-next (afef1e1a0223 platform/chrome: cros_kunit_=
util: add default value for `msg->result`)
Merging hsi/for-next (43c14f8d18a7 HSI: omap_ssi: Fix refcount leak in ssi_=
probe)
Merging leds/for-next (92cfc71ee2dd leds: leds-bcm63138: get rid of LED_OFF)
Merging ipmi/for-next (79c87b8f8ba7 ipmi: Fix comment typo)
Merging driver-core/driver-core-next (3fcbf1c77d08 arch_topology: Fix cache=
 attributes detection in the CPU hotplug path)
Merging usb/usb-next (b6de1f901039 Merge tag 'usb-serial-5.20-rc1' of https=
://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging thunderbolt/next (34b9715b7cae thunderbolt: Fix typo in comment)
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (688ee1d1785c USB: serial: fix tty-port initial=
ized comments)
Merging tty/tty-next (af77c56aa353 tty: vt: initialize unicode screen buffe=
r)
Merging char-misc/char-misc-next (2af28b241eea spmi: trace: fix stack-out-o=
f-bound access in SPMI tracing functions)
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/dp/dp_parser.h
CONFLICT (content): Merge conflict in drivers/soundwire/intel.c
Merging coresight/next (4d45bc82df66 coresight: etm4x: avoid build failure =
with unrolled loops)
Merging fpga/for-next (ee794221a6f6 fpga: fpga-mgr: Fix spelling mistake "b=
itsream" -> "bitstream")
Merging icc/icc-next (009c963eefa0 Merge branch 'icc-rpm' into icc-next)
Merging iio/togreg (180c6cb6b9b7 dt-bindings: iio: adc: Add compatible for =
MT8188)
Merging phy-next/next (08680588d340 dt-bindings: phy: mediatek: tphy: add c=
ompatible for mt8188)
Merging soundwire/next (3f4a70268d54 soundwire: qcom: Enable software clock=
 gating requirement flag)
Merging extcon/extcon-next (3a06ed80265f extcon: Add EXTCON_DISP_CVBS and E=
XTCON_DISP_EDP)
Merging gnss/gnss-next (c0c725d7350e gnss: replace ida_simple API)
Merging vfio/next (34a255e67615 vfio: Replace phys_pfn with pages for vfio_=
pin_pages())
CONFLICT (content): Merge conflict in drivers/s390/crypto/vfio_ap_private.h
CONFLICT (content): Merge conflict in drivers/vfio/vfio.c
CONFLICT (content): Merge conflict in include/linux/vfio_pci_core.h
Merging staging/staging-next (8af028c2b22b staging: vt6655: Convert macro v=
t6655_mac_word_reg_bits_off to function)
Merging mux/for-next (0fcfb00b28c0 Linux 5.16-rc4)
Merging dmaengine/next (a1873f837f9e dmaengine: mediatek: mtk-hsdma: Fix ty=
po 'the the' in comment)
Merging cgroup/for-next (dfce5395b3a0 Merge branch 'for-5.20' into for-next)
Merging scsi/for-next (e7dfe3bc7687 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (8fcdc238ce1b scsi: target: Remove XDWRITEREAD em=
ulated support)
Merging vhost/linux-next (6a9720576cd0 virtio: VIRTIO_HARDEN_NOTIFICATION i=
s broken)
Merging rpmsg/for-next (54a2e6f66586 Merge branches 'rpmsg-next', 'rproc-ne=
xt' and 'hwspinlock-next' into for-next)
Merging gpio/for-next (e73f0f0ee754 Linux 5.14-rc1)
Merging gpio-brgl/gpio/for-next (f2a2f2c9aed2 gpio: xilinx: add missing bla=
nk line after declarations)
Merging gpio-intel/for-next (b65bb2c14891 gpio: pch: Change PCI device macr=
os)
Merging gpio-sim/gpio/gpio-sim (0fcfb00b28c0 Linux 5.16-rc4)
Merging pinctrl/for-next (1a24a177564a Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (25097de7b236 pinctrl: intel: Add Intel Mete=
or Lake pin controller support)
Merging pinctrl-renesas/renesas-pinctrl (36611d28f513 pinctrl: renesas: r8a=
779g0: Add missing MODSELx for AVBx)
Merging pinctrl-samsung/for-next (c98ebe065e07 pinctrl: samsung: do not use=
 bindings header with constants)
Merging pwm/for-next (394b517585da pwm: mediatek: Add MT8365 support)
Merging userns/for-next (a0b88362d2c7 Merge of ucount-rlimits-cleanups-for-=
v5.19, interrupting_kthread_stop-for-v5.20, signal-for-v5.20, and retire_mq=
_sysctls-for-v5.19 for testing in linux-next)
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging kselftest/next (4062eba9f3d0 Makefile: replace headers_install with=
 headers for kselftest)
Merging livepatching/for-next (df44b1ee72f4 Merge branch 'for-5.20/selftest=
s-fixes' into for-next)
Merging rtc/rtc-next (5adbaed16cc6 rtc: Add NCT3018Y real time clock driver)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging nvdimm/libnvdimm-for-next (53fc59511fc4 nvdimm/namespace: drop unne=
eded temporary variable in size_store())
Merging at24/at24/for-next (312310928417 Linux 5.18-rc1)
Merging ntb/ntb-next (e8c04e435db5 NTB: EPF: Mark pci_read and pci_write as=
 static)
Merging seccomp/for-next/seccomp (73a8dbafd31a selftests/seccomp: Fix compi=
le warning when CC=3Dclang)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging fsi/next (04823dd2af87 fsi: master-ast-cf: Fix missing of_node_put =
in fsi_master_acf_probe)
Merging slimbus/for-next (4ad3deabeea2 slimbus: messaging: fix typos in com=
ments)
Merging nvmem/for-next (432ee5a3cfcf nvmem: mtk-efuse: Simplify with devm_p=
latform_get_and_ioremap_resource())
Merging xarray/main (69cb69ea5542 ida: Remove assertions that an ID was all=
ocated)
Merging hyperv/hyperv-next (d180e0a1be6c Drivers: hv: Create debugfs file w=
ith hyper-v balloon usage information)
Merging auxdisplay/auxdisplay (13de23494f38 auxdisplay: lcd2s: Use array si=
ze explicitly in lcd2s_gotoxy())
Merging kgdb/kgdb/for-next (c1cb81429df4 kdb: Fix the putarea helper functi=
on)
Merging hmm/hmm (bea86a8116f6 RDMA/erdma: Add driver to kernel build enviro=
nment)
Merging kunit/test (f2906aa86338 Linux 5.19-rc1)
Merging cfi/cfi/next (312310928417 Linux 5.18-rc1)
Merging kunit-next/kunit (957063874c76 Documentation: kunit: Add CLI args f=
or kunit_tool)
Merging trivial/for-next (081c8919b02b Documentation: remove trivial tree)
Merging mhi/mhi-next (9df125af0822 bus: mhi: ep: Check dev_set_name() retur=
n value)
Merging memblock/for-next (06c8580aa23d memblock tests: change build option=
s to run-time options)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (e71ba9452f0b Linux 5.11-rc2)
Merging cxl/next (b060edfd8cdd cxl/pmem: Delete unused nvdimm attribute)
Merging folio-iomap/folio-iomap (4d7bd0eb72e5 iomap: Inline __iomap_zero_it=
er into its caller)
Merging zstd/zstd-next (88a309465b3f lib: zstd: clean up double word in com=
ment.)
Merging efi/next (df3c9072ef90 Merge branch 'efivars-cleanup' into efi/next)
CONFLICT (content): Merge conflict in arch/arm/configs/milbeaut_m10v_defcon=
fig
Merging unicode/for-next (b500d6d7243d unicode: Handle memory allocation fa=
ilures in mkutf8data)
Merging slab/for-next (3041808b5220 mm/slab_common: move generic bulk alloc=
/free functions to SLOB)
Merging random/master (d349ab99eec7 random: handle archrandom with multiple=
 longs)
CONFLICT (content): Merge conflict in arch/arm64/kernel/kaslr.c
CONFLICT (content): Merge conflict in arch/powerpc/Kconfig
CONFLICT (content): Merge conflict in arch/s390/include/asm/archrandom.h
Merging landlock/next (b13baccc3850 Linux 5.19-rc2)
Merging rust/rust-next (9a5fe747d99e init/Kconfig: Specify the interpreter =
for rust-is-available.sh)
CONFLICT (content): Merge conflict in Makefile
CONFLICT (content): Merge conflict in arch/x86/Makefile
CONFLICT (content): Merge conflict in include/uapi/linux/android/binder.h
Merging sysctl/sysctl-next (acdc07ace871 kernel/sysctl.c: Clean up indentat=
ion, replace spaces with tab.)
Merging folio/for-next (03b33c09ea22 fs: remove the NULL get_block case in =
mpage_writepages)
CONFLICT (content): Merge conflict in fs/buffer.c
Merging execve/for-next/execve (5036793d7dbd exec: Fix a spelling mistake)
Merging bitmap/bitmap-for-next (9f0b715d0011 lib/nodemask: inline next_node=
_in() and node_random())
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/archrandom.h
CONFLICT (content): Merge conflict in include/linux/gfp.h
Applying: fix up for "mm: kasan: Skip unpoisoning of user pages"
Applying: fix up for bitmap_weight return value changing
Applying: fix up for "powerpc: drop dependency on <asm/machdep.h> in archra=
ndom.h"
Applying: fixup for "powerpc: drop dependency on <asm/machdep.h> in archran=
dom.h"
Merging hte/hte/for-next (85ff37e302ef gpiolib: cdev: Fix kernel doc for st=
ruct line)
Merging kspp/for-next/kspp (e1d337335207 cfi: Fix __cfi_slowpath_diag RCU u=
sage with cpuidle)
CONFLICT (content): Merge conflict in kernel/cfi.c
Merging kspp-gustavo/for-next/kspp (94dfc73e7cf4 treewide: uapi: Replace ze=
ro-length arrays with flexible-array members)
Merging mm-stable/mm-stable (187e7c41445a selftests/vm: fix va_128TBswitch.=
sh permissions)
CONFLICT (content): Merge conflict in Documentation/translations/zh_CN/mm/f=
ree_page_reporting.rst
CONFLICT (content): Merge conflict in Documentation/translations/zh_CN/mm/f=
rontswap.rst
CONFLICT (content): Merge conflict in Documentation/translations/zh_CN/mm/p=
age_frags.rst
CONFLICT (file location): Documentation/translations/zh_CN/vm/page_migratio=
n.rst added in HEAD inside a directory that was renamed in mm-stable/mm-sta=
ble, suggesting it should perhaps be moved to Documentation/translations/zh=
_CN/mm/page_migration.rst.
CONFLICT (file location): Documentation/translations/zh_CN/vm/vmalloced-ker=
nel-stacks.rst added in HEAD inside a directory that was renamed in mm-stab=
le/mm-stable, suggesting it should perhaps be moved to Documentation/transl=
ations/zh_CN/mm/vmalloced-kernel-stacks.rst.
CONFLICT (content): Merge conflict in Documentation/translations/zh_CN/mm/z=
smalloc.rst
CONFLICT (content): Merge conflict in include/linux/pagevec.h
Merging mm-nonmm-stable/mm-nonmm-stable (233eb8d6894e fs/ocfs2: Fix spellin=
g typo in comment)
CONFLICT (content): Merge conflict in include/linux/cpumask.h
CONFLICT (content): Merge conflict in lib/Makefile
Merging mm/mm-everything (4724a9771b17 Merge branch 'mm-nonmm-unstable' int=
o mm-everything)
CONFLICT (content): Merge conflict in include/linux/gfp.h
CONFLICT (content): Merge conflict in mm/internal.h
Applying: fix up for "xfs: pass perag to xfs_alloc_read_agf()"
Applying: fix up for "headers/deps: mm: Split <linux/gfp_types.h> out of <l=
inux/gfp.h>"
Applying: Revert "drm/amdgpu: Re-enable DCN for 64-bit powerpc"

--Sig_/eA1wSX9VOZxGZIUeHGm.3Z/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmLhKwAACgkQAVBC80lX
0GwOyAf+IAZa90yePaFoGnOc59mK8cCDDC0nV6jPKLP+7GOA2yFnpg6lNiPc/9+w
725AH8kQX//ykZzyPtSQYo2tOcF4nfcGw294UxBjmLUSaHqaE6WpqFCSYsPundDY
ZNcHfVfA9mRARPqbcpPwb1B60VvxnWVjXQZ0VcS60oQxlTxHxoU+pbRMleVwr1IA
7wXua8cpLgs7lEwSfFp5zSL3wJidDGfG/W3QBvoXQydi8mPN/5pWhRPeIIcFNI53
r0c/UBzbhp1Y0rGjQFeuvGxyXAaXSshF2lOdx5e4wJXxSgkSwYdUhhu4zh8OvGga
q50kZj1QguidAr2WDQHw/wXN/0wNDA==
=UTon
-----END PGP SIGNATURE-----

--Sig_/eA1wSX9VOZxGZIUeHGm.3Z/--
