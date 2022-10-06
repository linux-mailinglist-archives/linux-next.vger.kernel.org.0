Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 392AF5F61C6
	for <lists+linux-next@lfdr.de>; Thu,  6 Oct 2022 09:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbiJFHjB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 Oct 2022 03:39:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230244AbiJFHjA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 Oct 2022 03:39:00 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E70818E987;
        Thu,  6 Oct 2022 00:38:55 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mjjx93rfGz4xFv;
        Thu,  6 Oct 2022 18:38:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1665041933;
        bh=pIiW/UxnOZ9c4OS6Zb0M8BaNJpMm9mFsBw0Eo48F+ao=;
        h=Date:From:To:Cc:Subject:From;
        b=O44+GKcM71BqWPKHCTzG8H40mBDsl5/QBEFELOG/Ft8biI1ECzsVWO0iEPr5Fhecf
         5no5kNDYEhJFFBjPJYd1bnBzHDT1IpBumQBZFyalUnjyFzc72JyXQ7do1Vktk6jdsb
         nJy/MEX6DvlNYG3YSIaDtOFqmi9SWkBmiYYVBmBAN4QfuKwhVKmq0XbvgR5J5wrQkN
         udSb+rRR0DStSJax2S8M1m3lkHS+/ID+uVUI5xoq02K1AEw7IDjTzKUZJCdF/Rltk9
         iXG50NCMF5g1ST4WVRdb16ZKrMCjzEhAHWkDhwO5P9JZIhzuXrxSr0YH2/lTKkYemM
         JmJdumz9o+UVQ==
Date:   Thu, 6 Oct 2022 18:38:50 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 6
Message-ID: <20221006183850.75d0147f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jOmZMJ/0Abt7A0xXbuQ7.Jf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,LOCALPART_IN_SUBJECT,SPF_HELO_PASS,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jOmZMJ/0Abt7A0xXbuQ7.Jf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Please do not add any v6.2 material to your linux-next included branches
until after v6.1-rc1 has been released.

Changes since 20221005:

Linus' tree inherited the drm tree build failure for which I applied
a patch.

The vfs tree gained a conflict against the ksmbd tree.

Non-merge commits (relative to Linus' tree): 6878
 6823 files changed, 301449 insertions(+), 97648 deletions(-)

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

I am currently merging 362 trees (counting Linus' and 100 trees of bug
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
Merging origin/master (833477fce7a1 Merge tag 'sound-6.1-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/tiwai/sound)
Merging fixes/fixes (1c23f9e627a7 Linux 6.0-rc2)
Applying: fix up for drivers/gpu/drm/amd/display/dc/core/dc_stream.c
Merging mm-hotfixes/mm-hotfixes-unstable (84b0230f1a32 nilfs2: fix NULL poi=
nter dereference at nilfs_bmap_lookup_at_level())
Merging kbuild-current/fixes (f76349cf4145 Linux 6.0-rc7)
Merging arc-current/for-curr (952deecb065e arc: dts: Harmonize EHCI/OHCI DT=
 nodes name)
Merging arm-current/fixes (14ca1a469075 ARM: 9247/1: mm: set readonly for M=
T_MEMORY_RO with ARM_LPAE)
Merging arm64-fixes/for-next/fixes (13b056696291 vmlinux.lds.h: CFI: Reduce=
 alignment of jump-table to function alignment)
Merging arm-soc-fixes/arm/fixes (7bea67a99430 ARM: dts: integrator: Fix DMA=
 ranges)
Merging drivers-memory-fixes/fixes (c941e6305958 dt-bindings: memory-contro=
llers: fsl,imx8m-ddrc: drop Leonard Crestez)
Merging tee-fixes/fixes (98268f2a2a9f Merge branch 'optee_ffa_probe_fix_for=
_v5.18' into fixes)
Merging m68k-current/for-linus (dc63a086daee m68k: Rework BI_VIRT_RNG_SEED =
as BI_RNG_SEED)
Merging powerpc-fixes/fixes (a66de5283e16 powerpc/pseries: Fix plpks crash =
on non-pseries)
Merging s390-fixes/fixes (1918f2b20c3d s390/vfio-ap: bypass unnecessary pro=
cessing of AP resources)
Merging sparc/master (2d2b17d08bfc sparc: Unbreak the build)
Merging fscrypt-current/for-stable (80f6e3080bfc fs-verity: fix signed inte=
ger overflow with i_size near S64_MAX)
Merging net/master (0326074ff465 Merge tag 'net-next-6.1' of git://git.kern=
el.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging bpf/master (0326074ff465 Merge tag 'net-next-6.1' of git://git.kern=
el.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging ipsec/master (4f4920669d21 xfrm: Reinject transport-mode packets th=
rough workqueue)
Merging netfilter/master (7fb0269720d7 Merge tag 'for-net-2022-05-23' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth)
Merging ipvs/master (7fb0269720d7 Merge tag 'for-net-2022-05-23' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth)
Merging wireless/for-next (0326074ff465 Merge tag 'net-next-6.1' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging rdma-fixes/for-rc (521a547ced64 Linux 6.0-rc6)
Merging sound-current/for-linus (417b9c51f597 ALSA: hda/realtek: remove ALC=
289_FIXUP_DUAL_SPK for Dell 5530)
Merging sound-asoc-fixes/for-linus (57f7497e24a5 Merge remote-tracking bran=
ch 'asoc/for-6.0' into asoc-linus)
Merging regmap-fixes/for-linus (80e78fcce86d Linux 6.0-rc5)
Merging regulator-fixes/for-linus (80e78fcce86d Linux 6.0-rc5)
Merging spi-fixes/for-linus (ff2391e8128f Merge remote-tracking branch 'spi=
/for-6.0' into spi-linus)
Merging pci-current/for-linus (0e1fa5155a36 MAINTAINERS: Add Mahesh J Salga=
onkar as EEH maintainer)
Merging driver-core.current/driver-core-linus (1707c39ae309 Merge tag 'driv=
er-core-6.0-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/dr=
iver-core)
Merging tty.current/tty-linus (7e2cd21e02b3 Merge tag 'tty-6.0-rc7' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty)
Merging usb.current/usb-linus (0fb9703a3ead uas: ignore UAS for Thinkplus c=
hips)
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (eee48781ea19 USB: serial: qcserial: add=
 new usb-id for Dell branded EM7455)
Merging phy/fixes (0a6fc70d76bd phy: marvell: phy-mvebu-a3700-comphy: Remov=
e broken reset support)
Merging staging.current/staging-linus (7e18e42e4b28 Linux 6.0-rc4)
Merging iio-fixes/fixes-togreg (f57f4fb09850 iio: light: tsl2583: Fix modul=
e unloading)
Merging counter-current/counter-current (8294b04153c3 counter: Realign coun=
ter_comp comment block to 80 characters)
Merging char-misc.current/char-misc-linus (2bc54aaa65d2 counter: 104-quad-8=
: Fix skipped IRQ lines during events configuration)
Merging soundwire-fixes/fixes (4ef3f2aff126 soundwire: qcom: fix device sta=
tus array range)
Merging thunderbolt-fixes/fixes (4fe89d07dcc2 Linux 6.0)
Merging input-current/for-linus (e62563db857f Input: snvs_pwrkey - fix SNVS=
_HPVIDR1 register address)
Merging crypto-current/master (b411b1a0c8bd crypto: aspeed - Remove redunda=
nt dev_err call)
Merging vfio-fixes/for-linus (873aefb376bb vfio/type1: Unpin zero pages)
Merging kselftest-fixes/fixes (bdbf0617bbc3 selftests/vm: fix inability to =
build any vm tests)
Merging modules-fixes/modules-linus (e69a66147d49 module: kallsyms: Ensure =
preemption in add_kallsyms() with PREEMPT_RT)
Merging dmaengine-fixes/fixes (ab4fff87f9db dmaengine: mxs: use platform_dr=
iver_register)
Merging backlight-fixes/for-backlight-fixes (a38fd8748464 Linux 5.12-rc2)
Merging mtd-fixes/mtd/fixes (568035b01cfb Linux 6.0-rc1)
Merging mfd-fixes/for-mfd-fixes (a61f4661fba4 mfd: intel_quark_i2c_gpio: Re=
vert "Constify static struct resources")
Merging v4l-dvb-fixes/fixes (3a99c4474112 media: rkvdec: Disable H.264 erro=
r detection)
Merging reset-fixes/reset/fixes (ae358d71d462 reset: npcm: fix iprst2 and i=
prst4 setting)
Merging mips-fixes/mips-fixes (e9f3f8f48800 MIPS: Loongson32: Fix PHY-mode =
being left unspecified)
Merging at91-fixes/at91-fixes (f5fc22cbbdcd ARM: dts: lan966x: Fix the inte=
rrupt number for internal PHYs)
Merging omap-fixes/fixes (2a906db2824b Merge branch 'am5748-fix' into fixes)
Merging kvm-fixes/master (458e98746fa8 KVM: selftests: Fix nx_huge_pages_te=
st on TDP-disabled hosts)
Merging kvms390-fixes/master (189e7d876e48 KVM: s390: pci: register pci hoo=
ks without interpretation)
Merging hwmon-fixes/hwmon (7f62cf781e65 hwmon: (gsc-hwmon) Call of_node_get=
() before of_find_xxx API)
Merging nvdimm-fixes/libnvdimm-fixes (b3bbcc5d1da1 Merge branch 'for-6.0/da=
x' into libnvdimm-fixes)
Merging cxl-fixes/fixes (e35f5718903b cxl/mbox: Fix missing variable payloa=
d checks in cmd size validation)
Merging btrfs-fixes/next-fixes (351ff18f7481 Merge branch 'misc-6.0' into n=
ext-fixes)
Merging vfs-fixes/fixes (4f526fef91b2 [brown paperbag] fix coredump breakag=
e)
Merging dma-mapping-fixes/for-linus (3be4562584bb dma-direct: use the corre=
ct size for dma_set_encrypted())
Merging i3c-fixes/i3c/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging drivers-x86-fixes/fixes (647e82dbf851 platform/x86: p2sb: Fix UAF w=
hen caller uses resource name)
Merging samsung-krzk-fixes/fixes (568035b01cfb Linux 6.0-rc1)
Merging pinctrl-samsung-fixes/fixes (568035b01cfb Linux 6.0-rc1)
Merging devicetree-fixes/dt/linus (de11663b75b0 dt-bindings: pinctrl: qcom:=
 drop non-working codeaurora.org emails)
Merging dt-krzk-fixes/fixes (568035b01cfb Linux 6.0-rc1)
Merging scsi-fixes/fixes (e0e0747de0ea scsi: mpt3sas: Fix return value chec=
k of dma_get_required_mask())
Merging drm-fixes/drm-fixes (414208e48963 Merge tag 'amd-drm-fixes-6.0-2022=
-09-30-1' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (7738be973fc4 drm/i915/gt: Per=
f_limit_reasons are only available for Gen11+)
Merging mmc-fixes/fixes (e7afa79a3b35 mmc: hsq: Fix data stomping during mm=
c recovery)
Merging rtc-fixes/rtc-fixes (568035b01cfb Linux 6.0-rc1)
Merging gnss-fixes/gnss-linus (a111daf0c53a Linux 5.19-rc3)
Merging hyperv-fixes/hyperv-fixes (f0880e2cb7e1 Drivers: hv: Never allocate=
 anything besides framebuffer from framebuffer memory region)
Merging soc-fsl-fixes/fix (4b0986a3613c Linux 5.18)
Merging risc-v-fixes/fixes (145f88818d44 riscv: Pass -mno-relax only on lld=
 < 15.0.0)
Merging risc-v-mc-fixes/dt-fixes (0dec364ffeb6 riscv: dts: microchip: use a=
n mpfs specific l2 compatible)
Merging pidfd-fixes/fixes (03ba0fe4d09f file: simplify logic in __close_ran=
ge())
Merging fpga-fixes/fixes (568035b01cfb Linux 6.0-rc1)
Merging spdx/spdx-linus (568035b01cfb Linux 6.0-rc1)
Merging gpio-brgl-fixes/gpio/for-current (4fe89d07dcc2 Linux 6.0)
Merging gpio-intel-fixes/fixes (568035b01cfb Linux 6.0-rc1)
Merging pinctrl-intel-fixes/fixes (568035b01cfb Linux 6.0-rc1)
Merging erofs-fixes/fixes (80e78fcce86d Linux 6.0-rc5)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (2a2dfc869d33 tools: Add new "test" taint t=
o kernel-chktaint)
Merging ubifs-fixes/fixes (c3c07fc25f37 ubi: fastmap: Return error code if =
memory allocation fails in add_aeb())
Merging memblock-fixes/fixes (c94afc46cae7 memblock: use kfree() to release=
 kmalloced memblock regions)
Merging cel-fixes/for-rc (4fe89d07dcc2 Linux 6.0)
Merging irqchip-fixes/irq/irqchip-fixes (e4a7e67a08ac irqchip/imx-mu-msi: F=
ix wrong register offset for 8ulp)
Merging renesas-fixes/fixes (ab2866f12ca1 arm64: dts: renesas: r8a779g0: Fi=
x HSCIF0 interrupt number)
Merging broadcom-fixes/fixes (b6fa04765857 Merge branch 'drivers/fixes' int=
o fixes)
Merging perf-current/perf/urgent (8e8bf60a6754 perf build: Fixup disabling =
of -Wdeprecated-declarations for the python scripting engine)
Merging efi-fixes/urgent (5f56a74cc0a6 efi: libstub: check Shim mode using =
MokSBStateRT)
Merging zstd-fixes/zstd-linus (88a309465b3f lib: zstd: clean up double word=
 in comment.)
Merging battery-fixes/fixes (9db5f08ca99d power: supply: ab8500: remove unu=
sed static local variable)
Merging uml-fixes/fixes (bd71558d585a arch: um: Mark the stack non-executab=
le to fix a binutils warning)
Merging asahi-soc-fixes/asahi-soc/fixes (568035b01cfb Linux 6.0-rc1)
Merging drm-misc-fixes/for-linux-next-fixes (cc62d98bd56d Revert "drm: brid=
ge: analogix/dp: add panel prepare/unprepare in suspend/resume time")
Merging kbuild/for-next (cff6fdf0b2d4 ia64: simplify esi object addition in=
 Makefile)
CONFLICT (content): Merge conflict in Makefile
Applying: rust: fix up for "kbuild: move core-y and drivers-y to ./Kbuild"
Merging clang-format/clang-format (781121a7f6d1 clang-format: Fix space aft=
er for_each macros)
Merging perf/perf/core (3b1913adb188 perf record: Save DSO build-ID for syn=
thesizing)
Merging compiler-attributes/compiler-attributes (7c00621dcaee compiler_type=
s: mark __compiletime_assert failure as __noreturn)
Merging dma-mapping/for-next (f7f04d198334 lib/sg_pool: change module_init(=
sg_pool_init) to subsys_initcall)
Merging asm-generic/master (52c747bd814f alpha: add full ioread64/iowrite64=
 implementation)
Merging arc/for-next (f2906aa86338 Linux 5.19-rc1)
Merging arm/for-next (072132be9f91 Merge branches 'misc' and 'fixes' into f=
or-next)
Merging arm64/for-next/core (d2995249a2f7 arm64: alternatives: Use vdso/bit=
s.h instead of linux/bits.h)
CONFLICT (content): Merge conflict in arch/arm64/kernel/alternative.c
Merging arm-perf/for-next/perf (aaaee7b55c9e docs: perf: Include hns3-pmu.r=
st in toctree to fix 'htmldocs' WARNING)
Merging arm-soc/for-next (781073d41901 Merge branch 'arm/dt' into for-next)
Applying: Revert "ARM: dts: BCM5301X: Add basic PCI controller properties"
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (727d51a3ed30 Merge branch 'v6.1/dt64' into for-ne=
xt)
Merging asahi-soc/asahi-soc/for-next (e9bd9228e762 arm64: dts: apple: Add A=
DMAC resets on t8103/t600x)
Merging aspeed/for-next (3617a24f4b97 ARM: dts: aspeed: ast2600-evb-a1: Add=
 compatible)
Merging at91/at91-next (a3e83ce7ece6 Merge branch 'at91-dt' into at91-next)
Merging broadcom/next (122de0c73256 Merge branch 'maintainers/next' into ne=
xt)
Merging drivers-memory/for-next (f3bf09c2b9c5 Merge branch 'mem-ctrl-next' =
into for-next)
Merging imx-mxs/for-next (26f60c42dc9d Merge branch 'imx/dt64' into for-nex=
t)
Merging keystone/next (cb293d3b430e Merge branch 'for_5.15/drivers-soc' int=
o next)
Merging mediatek/for-next (cbb1618792e2 Merge branch 'v6.0-next/soc' into f=
or-next)
Merging mvebu/for-next (d5c48679d56c Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (8efe5dea6753 Merge branch 'omap-for-v6.1/dt' into fo=
r-next)
Merging qcom/for-next (e89c75d437ca Merge branches 'arm64-defconfig-for-6.1=
', 'arm64-for-6.1', 'clk-for-6.1', 'defconfig-for-6.1', 'drivers-for-6.1', =
'dts-for-6.1' and 'arm64-fixes-for-6.0' into for-next)
Merging raspberrypi/for-next (c5915b53d4c2 dt-bindings: soc: bcm: Convert b=
rcm,bcm2835-vchiq to json-schema)
Merging renesas/next (a7ec6f47e9d3 Merge branches 'renesas-arm-dt-for-v6.1'=
 and 'renesas-arm-soc-for-v6.1' into renesas-next)
Merging reset/reset/next (d985db836226 reset: tps380x: Fix spelling mistake=
 "Voltags" -> "Voltage")
Merging rockchip/for-next (b98506387072 Merge branch 'v6.1-clock/next' into=
 for-next)
Merging samsung-krzk/for-next (139b4e651563 Merge branch 'for-v6.1/late-dts=
-fixes' into for-next)
Merging scmi/for-linux-next (4fe89d07dcc2 Linux 6.0)
Merging stm32/stm32-next (400a100c28fe ARM: dts: stm32: argon: remove spide=
v node)
Merging sunxi/sunxi/for-next (1cd67985e174 Merge branch 'sunxi/drivers-for-=
6.1' into sunxi/for-next)
Merging tee/next (db30e53bf897 Merge branch 'tee_cleanup_for_v5.19' into ne=
xt)
Merging tegra/for-next (ecbdf04a902e Merge branch for-6.1/arm64/defconfig i=
nto for-next)
Merging ti/ti-next (0d0a0b441346 arm64: dts: ti: k3-j7200: fix main pinmux =
range)
Merging xilinx/for-next (0413dd4d95da ARM: dts: zynq: add QSPI controller n=
ode)
Merging clk/clk-next (eb2b13270e0e Merge branch 'clk-rate-range' into clk-n=
ext)
Applying: clk: fix up for "i2c: Make remove callback return void"
Merging clk-imx/for-next (67e16ac1fec4 clk: imx93: add SAI IPG clk)
Merging clk-renesas/renesas-clk (e46a1a9943c0 clk: renesas: r8a779g0: Add E=
therAVB clocks)
Merging clk-samsung/for-next (b35f27fe73d8 clk: samsung: exynosautov9: add =
cmu_peric1 clock support)
Merging csky/linux-next (45fef4c4b9c9 csky: abiv1: Fixup compile error)
Merging loongarch/loongarch-next (8a2e4c8c56b9 LoongArch: Update Loongson-3=
 default config file)
Merging m68k/for-next (dc63a086daee m68k: Rework BI_VIRT_RNG_SEED as BI_RNG=
_SEED)
Merging m68knommu/for-next (404b7577cee2 m68k: update config files)
Merging microblaze/next (adc4cefae9cf microblaze: Add support for error inj=
ection)
Merging mips/mips-next (90c2d2eb7ab5 MIPS: pci: lantiq: switch to using gpi=
od API)
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (52e0ea900202 openrisc: io: Define iounmap argume=
nt as volatile)
Merging parisc-hd/for-next (2a3fc680bdb6 parisc: Reduce kernel size by pack=
ing the alternative tables)
Merging powerpc/next (b2e82e495a52 powerpc/64s/interrupt: Fix stack frame r=
egs marker)
CONFLICT (content): Merge conflict in arch/powerpc/Makefile
CONFLICT (content): Merge conflict in arch/powerpc/kernel/Makefile
Applying: powerpc: fix up for "kbuild: remove head-y syntax"
Merging soc-fsl/next (4b0986a3613c Linux 5.18)
Merging risc-v/for-next (e623715f3d67 RISC-V: Increase range and default va=
lue of NR_CPUS)
Merging risc-v-mc/dt-for-next (6c1193301791 riscv: dts: microchip: update m=
emory configuration for v2022.10)
CONFLICT (content): Merge conflict in arch/riscv/boot/dts/microchip/mpfs.dt=
si
Merging s390/for-next (c2eb8657875b Merge branch 'features' into for-next)
Merging sh/for-next (8518e694203d sh: pgtable-3level: Fix cast to pointer f=
rom integer of different size)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/next (193cb8372424 uml: Remove the initialization of statics to=
 0)
Merging xtensa/xtensa-for-next (e3ddb8bbe0f8 xtensa: add FDPIC and static P=
IE support for noMMU)
Merging pidfd/for-next (6a857ab5b57c Merge branch 'fs.idmapped.overlay.acl'=
 into for-next)
Merging vfs-idmapping/for-next (2b00707e9737 Merge branch 'fs.vfsuid.fat' i=
nto for-next)
Merging fscrypt/master (0e91fc1e0f5c fscrypt: work on block_devices instead=
 of request_queues)
Merging fscache/fscache-next (0885eacdc81f Merge tag 'nfsd-5.19-1' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/cel/linux)
Merging afs/afs-next (26291c54e111 Linux 5.17-rc2)
Merging btrfs/for-next (8eff8c8f8220 Merge branch 'for-next-next-v6.1-20221=
005' into for-next-20221005)
Merging ceph/master (71cf0c1c4f9f ceph: remove Sage's git tree from documen=
tation)
Merging cifs/for-next (e3962aecd9df smb3: fix oops in calculating shash_set=
key)
Merging configfs/for-next (84ec758fb2da configfs: fix a race in configfs_{,=
un}register_subsystem())
Merging ecryptfs/next (c1cc2db21607 ecryptfs: keystore: Fix typo 'the the' =
in comment)
Merging erofs/dev (312fe643ad11 erofs: clean up erofs_iget())
Merging exfat/dev (2e9ceb6728f1 exfat: fix overflow for large capacity part=
ition)
Merging ext3/for_next (7241677fb18d Merge quota sanity checking fixes.)
Merging ext4/dev (1b45cc5c7b92 ext4: fix potential out of bound read in ext=
4_fc_replay_scan())
Merging f2fs/dev (dc3aff47e2cb f2fs: change to use atomic_t type form sbi.a=
tomic_files)
CONFLICT (content): Merge conflict in fs/f2fs/f2fs.h
Applying: f2fs: fix up for "f2fs: allow direct read for zoned device"
Merging fsverity/fsverity (8377e8a24bba fs-verity: use kmap_local_page() in=
stead of kmap())
Merging fuse/for-next (247861c325c2 fuse: retire block-device-based superbl=
ock on force unmount)
Merging gfs2/for-next (74b1b10e29b1 gfs2: Register fs after creating workqu=
eues)
Merging jfs/jfs-next (e471e5942c00 fs/jfs: Remove dead code)
Merging ksmbd/ksmbd-for-next (f5ba1cdaf5eb ksmbd: validate share name from =
share config response)
Merging nfs/linux-next (4fe89d07dcc2 Linux 6.0)
Merging nfs-anna/linux-next (a3569716d183 xprtrdma: Fix uninitialized varia=
ble)
Merging nfsd/for-next (243a5263014a nfsd: rework hashtable handling in nfsd=
_do_file_acquire)
Merging ntfs3/master (d45da67caeda fs/ntfs3: Use strcmp to determine attrib=
ute type)
CONFLICT (content): Merge conflict in fs/ntfs3/xattr.c
Merging orangefs/for-next (2ad4b6f5e117 Orangefs: change iterate to iterate=
_shared)
Merging overlayfs/overlayfs-next (ccda6269d92b ovl: fix comment typos)
Merging ubifs/next (669d204469c4 ubi: fastmap: Add fastmap control support =
for 'UBI_IOCATT' ioctl)
Merging v9fs/9p-next (dc7ecde005d6 net/9p: clarify trans_fd parse_opt failu=
re handling)
Merging xfs/for-next (e033f40be262 xfs: on memory failure, only shut down f=
s after scanning all mappings)
Merging zonefs/for-next (6bac30bb8ff8 zonefs: Call page_address() on page a=
cquired with GFP_KERNEL flag)
Merging iomap/iomap-for-next (adc9c2e5a723 iomap: add a tracepoint for mapp=
ings returned by map_blocks)
Merging statx-dioalign/statx-dioalign (61a223df421f xfs: support STATX_DIOA=
LIGN)
Merging djw-vfs/vfs-for-next (49df34221804 fs: fix an infinite loop in ioma=
p_fiemap)
Merging file-locks/locks-next (072e51356cd5 Merge tag 'nfs-for-5.20-2' of g=
it://git.linux-nfs.org/projects/trondmy/linux-nfs)
Merging vfs/for-next (7162984dce3b Merge branch 'work.tmpfile' into for-nex=
t)
CONFLICT (content): Merge conflict in fs/ksmbd/vfs.c
CONFLICT (content): Merge conflict in fs/notify/fanotify/fanotify.h
Merging printk/for-next (d81878e80ede Merge branch 'rework/kthreads' into f=
or-next)
Merging pci/next (17fc2a3f41b3 Merge branch 'pci/misc')
Merging pstore/for-next/pstore (27001e611bb6 pstore/zone: Use GFP_ATOMIC to=
 allocate zone buffer)
Merging hid/for-next (3d0aebcb5ec1 Merge branch 'for-6.0/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (fd66bd74afe8 i2c: aspeed: Assert NAK when slave i=
s busy)
Merging i3c/i3c/next (568035b01cfb Linux 6.0-rc1)
Merging dmi/dmi-for-next (13a0ac816d22 firmware: dmi: Fortify entry point l=
ength checks)
Merging hwmon-staging/hwmon-next (0cf46a653bda hwmon: (corsair-psu) add USB=
 id of new revision of the HX1000i psu)
Merging jc_docs/docs-next (05fff6ba04ee Merge branch 'docs-mw' into docs-ne=
xt)
Merging v4l-dvb/master (fbb6c848dd89 media: destage Hantro VPU driver)
CONFLICT (content): Merge conflict in drivers/media/platform/mediatek/vcode=
c/mtk_vcodec_enc_drv.c
Merging v4l-dvb-next/master (d67614f276c1 Merge fixes into media_stage)
CONFLICT (content): Merge conflict in drivers/media/platform/mediatek/vcode=
c/mtk_vcodec_enc_drv.c
CONFLICT (content): Merge conflict in drivers/media/platform/mediatek/vcode=
c/mtk_vcodec_enc_drv.c
Merging pm/linux-next (8b55399d1155 Merge branch 'pm-tools' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (c4c0efb06f17 cpufreq: qcom-cpuf=
req-hw: Add cpufreq qos for LMh)
Merging cpupower/cpupower (568035b01cfb Linux 6.0-rc1)
Merging devfreq/devfreq-next (fb2ac84f8acc PM / devfreq: rockchip-dfi: Fix =
an error message)
Merging opp/opp/linux-next (c7e31e36d8a2 dt-bindings: opp: Add missing (une=
valuated|additional)Properties on child nodes)
Merging thermal/thermal/linux-next (1ff4810b1723 thermal/drivers/exynos: Fi=
x NULL pointer dereference when getting the critical temp)
CONFLICT (content): Merge conflict in drivers/thermal/rcar_thermal.c
CONFLICT (content): Merge conflict in drivers/thermal/thermal_of.c
CONFLICT (content): Merge conflict in drivers/thermal/thermal_sysfs.c
Merging ieee1394/for-next (54b3bd99f094 firewire: nosy: switch from 'pci_' =
to 'dma_' API)
Merging dlm/next (3b7610302a75 fs: dlm: fix possible use after free if trac=
ing)
Merging rdma/for-next (8ad891ed435b RDMA/rxe: Remove error/warning messages=
 from packet receiver path)
CONFLICT (content): Merge conflict in drivers/infiniband/hw/hns/hns_roce_hw=
_v2.c
CONFLICT (content): Merge conflict in drivers/infiniband/hw/hns/hns_roce_ma=
in.c
Merging net-next/master (0326074ff465 Merge tag 'net-next-6.1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging bpf-next/for-next (0326074ff465 Merge tag 'net-next-6.1' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging ipsec-next/master (c39596f6ad1b Merge branch 'xfrm: add netlink ext=
ack to all the ->init_stat')
Merging mlx5-next/mlx5-next (9175d8103780 net/mlx5: Remove from FPGA IFC fi=
le not-needed definitions)
Merging netfilter-next/master (677fb7525331 Merge git://git.kernel.org/pub/=
scm/linux/kernel/git/netdev/net)
Merging ipvs-next/master (677fb7525331 Merge git://git.kernel.org/pub/scm/l=
inux/kernel/git/netdev/net)
Merging bluetooth/master (89f9f3cb86b1 Bluetooth: L2CAP: Fix use-after-free=
 caused by l2cap_reassemble_sdu)
Merging wireless-next/for-next (915b96c52763 Merge tag 'wireless-next-2022-=
09-30' of git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-n=
ext)
Merging mtd/mtd/next (095bb6e44eb1 mtdchar: add MEMREAD ioctl)
Merging nand/nand/next (ba47a6ac4658 mtd: rawnand: meson: stop supporting l=
egacy clocks)
Merging spi-nor/spi-nor/next (f8cd9f632f44 mtd: spi-nor: fix spi_nor_spimem=
_setup_op() call in spi_nor_erase_{sector,chip}())
Merging crypto/master (b411b1a0c8bd crypto: aspeed - Remove redundant dev_e=
rr call)
Merging drm/drm-next (65898687cf73 Merge tag 'amd-drm-next-6.1-2022-09-30' =
of https://gitlab.freedesktop.org/agd5f/linux into drm-next)
Merging drm-misc/for-linux-next (fdd0640b6390 drm/ssd130x: Iterate over dam=
age clips instead of using a merged rect)
CONFLICT (content): Merge conflict in include/drm/drm_edid.h
Merging amdgpu/drm-next (b292cafe2dd0 drm/amdkfd: Fix UBSAN shift-out-of-bo=
unds warning)
Merging drm-intel/for-linux-next (cdf6428dd518 drm/i915: Reject excessive d=
otclocks early)
Merging drm-tegra/for-next (778bed334508 gpu: host1x: Update host1x_memory_=
context_alloc() !IOMMU_API stub)
Merging drm-msm/msm-next (e8b595f7b058 drm/msm/hdmi: make hdmi_phy_8996 OF =
clk provider)
Merging drm-msm-lumag/msm-next-lumag (e8b595f7b058 drm/msm/hdmi: make hdmi_=
phy_8996 OF clk provider)
Merging imx-drm/imx-drm/next (927d8fd465ad drm/imx: ipuv3-plane: Remove red=
undant color encoding and range initialisation)
Merging etnaviv/etnaviv/next (4bce24427251 drm/etnaviv: disable tx clock ga=
ting for GC7000 rev6203)
Merging fbdev/for-next (6a7bca685c93 fbdev: smscufx: Fix use-after-free in =
ufx_ops_open())
Merging regmap/for-next (83eb8f73e86b Merge remote-tracking branch 'regmap/=
for-6.1' into regmap-next)
Merging sound/for-next (417b9c51f597 ALSA: hda/realtek: remove ALC289_FIXUP=
_DUAL_SPK for Dell 5530)
Merging sound-asoc/for-next (57f7497e24a5 Merge remote-tracking branch 'aso=
c/for-6.0' into asoc-linus)
Merging modules/modules-next (77d6354bd422 module/decompress: generate sysf=
s string at compile time)
Merging input/next (27d8537f3a32 Input: i8042 - fix refount leak on sparc)
Merging block/for-next (f3116c8abfa8 Merge branch 'for-6.1/passthrough' int=
o for-next)
Merging device-mapper/for-next (a871fb26aba8 dm clone: Fix typo in block_de=
vice format specifier)
Merging libata/for-next (71d7b6e51ad3 ata: libata-eh: avoid needless hard r=
eset when revalidating link)
Merging pcmcia/pcmcia-next (15e74c6c1ce2 pcmcia: remove AT91RM9200 Compact =
Flash driver)
Merging mmc/next (178422c27bad mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (72a95859728a mfd: syscon: Remove repetition of th=
e regmap_get_val_endian())
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/mfd=
/qcom,tcsr.yaml
CONFLICT (modify/delete): drivers/mfd/intel_soc_pmic_core.c deleted in mfd/=
for-mfd-next and modified in HEAD.  Version HEAD of drivers/mfd/intel_soc_p=
mic_core.c left in tree.
$ git rm -f drivers/mfd/intel_soc_pmic_core.c
Applying: mfd: fix up for "i2c: Make remove callback return void"
Merging backlight/for-backlight-next (e7647de058cb video: backlight: mt6370=
: Add MediaTek MT6370 support)
Merging battery/for-next (189a2aaef9cb power: supply: ab8500: remove unused=
 static local variable)
CONFLICT (content): Merge conflict in drivers/power/supply/cw2015_battery.c
Merging regulator/for-next (e5dcd639f97e Merge remote-tracking branch 'regu=
lator/for-6.1' into regulator-next)
Merging security/next (1e7d8bcbe37d lockdown: ratelimit denial messages)
Merging apparmor/apparmor-next (5515a8e30eaa apparmor: store return value o=
f unpack_perms_table() to signed variable)
Merging integrity/next-integrity (bab715bdaa9e efi: Correct Macmini DMI mat=
ch in uefi cert quirk)
Merging keys/keys-next (2d743660786e Merge branch 'fixes' of git://git.kern=
el.org/pub/scm/linux/kernel/git/viro/vfs)
Merging safesetid/safesetid-next (64b634830c91 LSM: SafeSetID: add setgroup=
s() testing to selftest)
Merging selinux/next (2fe2fb4ce60b selinux: remove runtime disable message =
in the install_policy.sh script)
Merging smack/next (f393b3fd2a4b smack: cleanup obsolete mount option flags)
Merging tomoyo/master (4fe89d07dcc2 Linux 6.0)
Merging tpmdd/next (2d869f0b4585 selftest: tpm2: Add Client.__del__() to cl=
ose /dev/tpm* handle)
Merging watchdog/master (9023e05b7a58 dt-bindings: watchdog: migrate mt7621=
 text bindings to YAML)
Merging iommu/next (38713c6028a3 Merge branches 'apple/dart', 'arm/mediatek=
', 'arm/omap', 'arm/smmu', 'virtio', 'x86/vt-d', 'x86/amd' and 'core' into =
next)
Merging audit/next (934f70d9d498 audit: remove selinux_audit_rule_update() =
declaration)
Merging devicetree/for-next (7a7f58575483 of: base: Shift refcount decremen=
t in of_find_last_cache_level())
Merging dt-krzk/for-next (a70369e1b7f6 ARM: dts: sunplus: sp7021: drop inco=
rrect spi-max-frequency)
Merging mailbox/mailbox-for-next (68584e380ef5 mailbox: apple: Implement po=
ll_data() operation)
Merging spi/for-next (ff2391e8128f Merge remote-tracking branch 'spi/for-6.=
0' into spi-linus)
Merging tip/master (03c739a21613 Merge branch into tip/master: 'x86/timers')
CONFLICT (content): Merge conflict in lib/Kconfig.debug
Merging clockevents/timers/drivers/next (af246cc6d0ed clocksource/drivers/a=
rm_arch_timer: Fix CNTPCT_LO and CNTVCT_LO value)
Merging edac/edac-for-next (2918a251f847 Merge edac-misc into for-next)
Merging irqchip/irq/irqchip-next (732d69c80cb0 Merge branch irq/misc-6.1 in=
to irq/irqchip-next)
Merging ftrace/for-next (a541a9559bb0 tracing: Do not free snapshot if trac=
er is on cmdline)
Merging rcu/rcu/next (d3d8f70283ec Merge branch 'lkmm.2022.08.31b' into HEA=
D)
Merging kvm/next (e18d6152ff0f Merge tag 'kvm-riscv-6.1-1' of https://githu=
b.com/kvm-riscv/linux into HEAD)
Merging kvm-arm/next (b302ca52ba82 Merge branch kvm-arm64/misc-6.1 into kvm=
arm-master/next)
Merging kvms390/next (c8a0273ac80d KVM: s390: Pass initialized arg even if =
unused)
Merging xen-tip/linux-next (728c2edfcf14 xen-pcifront: Handle missed Connec=
ted state)
Merging percpu/for-next (a111daf0c53a Linux 5.19-rc3)
Merging workqueues/for-next (c0feea594e05 workqueue: don't skip lockdep wor=
k dependency in cancel_work_sync())
Merging drivers-x86/for-next (8d05fc039456 platform/x86: use PLATFORM_DEVID=
_NONE instead of -1)
Merging chrome-platform/for-next (8edd2752b0aa platform/chrome: cros_ec: No=
tify the PM of wake events during resume)
Merging hsi/for-next (811908159e7e HSI: nokia-modem: Replace of_gpio_count(=
) by gpiod_count())
Merging leds/for-next (4d1632151bde leds: pca963: fix misleading indentatio=
n)
Merging ipmi/for-next (05763c996f72 ipmi: Remove unused struct watcher_entr=
y)
CONFLICT (content): Merge conflict in drivers/char/ipmi/ipmi_ipmb.c
Merging driver-core/driver-core-next (fda8c908bc2d docs: filesystems: sysfs=
: Make text and code for ->show() consistent)
CONFLICT (content): Merge conflict in drivers/gpu/drm/Kconfig
Merging usb/usb-next (00988f70a076 Merge tag 'usb-serial-6.0-rc8' of https:=
//git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next)
Merging thunderbolt/next (5d2569cb4a65 thunderbolt: Explicitly enable lane =
adapter hotplug events at startup)
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (6b2fe3df7c0c USB: serial: ftdi_sio: clean up d=
river prefix)
Merging tty/tty-next (30963b2f75bf serial: cpm_uart: Don't request IRQ too =
early for console port)
CONFLICT (content): Merge conflict in Documentation/process/magic-number.rst
CONFLICT (content): Merge conflict in Documentation/translations/it_IT/proc=
ess/magic-number.rst
CONFLICT (content): Merge conflict in Documentation/translations/zh_CN/proc=
ess/magic-number.rst
CONFLICT (content): Merge conflict in Documentation/translations/zh_TW/proc=
ess/magic-number.rst
CONFLICT (content): Merge conflict in drivers/usb/serial/ftdi_sio.c
Merging char-misc/char-misc-next (7cd04013fbf3 w1: Split memcpy() of struct=
 cn_msg flexible array)
CONFLICT (content): Merge conflict in include/linux/counter.h
Merging coresight/next (5fc1531dd771 hwtracing: hisi_ptt: Fix up for "iommu=
/dma: Make header private")
Merging fpga/for-next (41d26c020cb2 fpga: m10bmc-sec: Fix possible memory l=
eak of flash_buf)
Merging icc/icc-next (7360d55ba199 Merge branch 'icc-ignore-return-val' int=
o icc-next)
Merging iio/togreg (6d965885f4ea iio: adc: mcp3911: add support for oversam=
pling ratio)
Merging phy-next/next (9aa0dade8f6b phy: phy-mtk-dp: make array driving_par=
ams static const)
Merging soundwire/next (503ae285944a soundwire: intel: add helper to stop b=
us)
CONFLICT (content): Merge conflict in drivers/soundwire/qcom.c
Merging extcon/extcon-next (08099ecd9216 extcon: usbc-tusb320: fix kernel-d=
oc warning)
Merging gnss/gnss-next (c0c725d7350e gnss: replace ida_simple API)
Merging vfio/next (c82e81ab2569 vfio: Change vfio_group->group_rwsem to a m=
utex)
Merging staging/staging-next (4256e500f619 staging: rtl8192e: Rename variab=
le Bandwidth to avoid CamelCase)
CONFLICT (content): Merge conflict in drivers/staging/Kconfig
CONFLICT (content): Merge conflict in drivers/staging/Makefile
CONFLICT (modify/delete): drivers/staging/fwserial/fwserial.c deleted in st=
aging/staging-next and modified in HEAD.  Version HEAD of drivers/staging/f=
wserial/fwserial.c left in tree.
$ git rm -f drivers/staging/fwserial/fwserial.c
Merging counter-next/counter-next (bb980cb69381 MAINTAINERS: add TI ECAP dr=
iver info)
Merging mux/for-next (0fcfb00b28c0 Linux 5.16-rc4)
Merging dmaengine/next (b957df984692 dmaengine: ioat: remove unused declara=
tions in dma.h)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/dma=
/apple,admac.yaml
Merging cgroup/for-next (6ed4424ea06a Merge branch 'for-6.1' into for-next)
CONFLICT (content): Merge conflict in kernel/cgroup/cgroup.c
Applying: sched/psi: fix up for "cgroup: Remove CFTYPE_PRESSURE"
Merging scsi/for-next (9f159807a610 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (67d0a917fb3f scsi: ufs: core: Remove unneeded ca=
sts from void *)
Merging vhost/linux-next (837be39fab26 Bluetooth: virtio_bt: fix device rem=
oval)
Merging rpmsg/for-next (abac55caaeaa Merge branches 'rproc-next', 'rpmsg-ne=
xt' and 'hwspinlock-next' into for-next)
Merging gpio/for-next (e73f0f0ee754 Linux 5.14-rc1)
Merging gpio-brgl/gpio/for-next (3c92506d8678 gpio: tc3589x: Make irqchip i=
mmutable)
Merging gpio-intel/for-next (0ea76c401f92 gpiolib: acpi: Add a quirk for As=
us UM325UAZ)
Merging gpio-sim/gpio/gpio-sim (0fcfb00b28c0 Linux 5.16-rc4)
Merging pinctrl/for-next (ba99b756da17 pinctrl: starfive: Rename "pinctrl-s=
tarfive" to "pinctrl-starfive-jh7100")
Merging pinctrl-intel/for-next (568035b01cfb Linux 6.0-rc1)
Merging pinctrl-renesas/renesas-pinctrl (96355be8f0a2 dt-bindings: pinctrl:=
 renesas: Document RZ/Five SoC)
Merging pinctrl-samsung/for-next (9d9292576810 dt-bindings: pinctrl: samsun=
g: deprecate header with register constants)
Merging pwm/for-next (4709f9ea338d pwm: sysfs: Replace sprintf() with sysfs=
_emit())
Merging userns/for-next (b5df013cd194 Merge of ucount-rlimits-cleanups-for-=
v5.19, interrupting_kthread_stop-for-v5.20, signal-for-v5.20, retire_mq_sys=
ctls-for-v5.19, and unpriv-ipc-sysctls-for-v6.2 for testing in linux-next)
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging kselftest/next (83e14a57d59f docs:kselftest: fix kselftest_module.h=
 path of example module)
CONFLICT (content): Merge conflict in drivers/cpufreq/amd-pstate.c
Merging livepatching/for-next (65d22130f2c4 Merge branch 'for-6.1/sysfs-pat=
ched-object' into for-next)
Merging rtc/rtc-next (509451ac03eb rtc: gamecube: Always reset HW_SRNPROT a=
fter read)
Merging nvdimm/libnvdimm-for-next (305a72efa791 Merge branch 'for-6.1/nvdim=
m' into libnvdimm-for-next)
Merging at24/at24/for-next (568035b01cfb Linux 6.0-rc1)
Merging ntb/ntb-next (568035b01cfb Linux 6.0-rc1)
Merging seccomp/for-next/seccomp (4e92863862d1 Merge branch 'for-linus/secc=
omp' into for-next/seccomp)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging fsi/next (35af9fb49bc5 fsi: core: Check error number after calling =
ida_simple_get)
Merging slimbus/for-next (3f9400e61107 slimbus: qcom-ngd: simplify error pa=
ths with dev_err_probe)
Merging nvmem/for-next (60bbaad38109 nvmem: u-boot-env: fix crc32 casting t=
ype)
Merging xarray/main (69cb69ea5542 ida: Remove assertions that an ID was all=
ocated)
Merging hyperv/hyperv-next (154fb14df7a3 x86/hyperv: Replace kmap() with km=
ap_local_page())
Merging auxdisplay/auxdisplay (13de23494f38 auxdisplay: lcd2s: Use array si=
ze explicitly in lcd2s_gotoxy())
Merging kgdb/kgdb/for-next (c1cb81429df4 kdb: Fix the putarea helper functi=
on)
Merging hmm/hmm (6dce3468a04c RDMA/mana_ib: Add a driver for Microsoft Azur=
e Network Adapter)
Merging kunit/test (568035b01cfb Linux 6.0-rc1)
Merging cfi/cfi/next (312310928417 Linux 5.18-rc1)
Merging kunit-next/kunit (4e37057387cc Documentation: Kunit: Use full path =
to .kunitconfig)
Merging trivial/for-next (081c8919b02b Documentation: remove trivial tree)
Merging mhi/mhi-next (e4e9631b2c88 bus: mhi: host: always print detected mo=
dem name)
Merging memblock/for-next (3e4519b7afc2 memblock tests: add generic NUMA te=
sts for memblock_alloc_try_nid*)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging cxl/next (1cd8a2537eb0 cxl/hdm: Fix skip allocations vs multiple pm=
em allocations)
Merging folio-iomap/folio-iomap (4d7bd0eb72e5 iomap: Inline __iomap_zero_it=
er into its caller)
Merging zstd/zstd-next (88a309465b3f lib: zstd: clean up double word in com=
ment.)
Merging efi/next (d3549a938b73 efi/arm64: libstub: avoid SetVirtualAddressM=
ap() when possible)
Merging unicode/for-next (b500d6d7243d unicode: Handle memory allocation fa=
ilures in mkutf8data)
Merging slab/for-next (d7b29a511137 Merge branch 'slab/for-6.1/fit_rcu_head=
' into slab/for-next)
Merging random/master (5cef5fd012bd prandom: remove unused functions)
Merging landlock/next (9f6e8014f86a Merge branch 'landlock-next-truncate-v8=
-fixed' into landlock-next)
Merging rust/rust-next (fd9517a1603f init/Kconfig: Specify the interpreter =
for rust_is_available.sh)
Merging sysctl/sysctl-next (c06a17fe056b kernel/sysctl-test: use SYSCTL_{ZE=
RO/ONE_HUNDRED} instead of i_{zero/one_hundred})
Merging folio/for-next (03b33c09ea22 fs: remove the NULL get_block case in =
mpage_writepages)
Merging execve/for-next/execve (9f4beead610c binfmt: remove taso from linux=
_binprm struct)
Merging bitmap/bitmap-for-next (78e5a3399421 cpumask: fix checking valid cp=
u range)
Merging hte/for-next (568035b01cfb Linux 6.0-rc1)
Merging kspp/for-next/kspp (7a8c84e1d528 Merge branch 'for-next/kcfi' into =
for-next/kspp)
Merging kspp-gustavo/for-next/kspp (0811296c55b7 exportfs: Replace zero-len=
gth array with DECLARE_FLEX_ARRAY() helper)
Merging mm-stable/mm-stable (e55b9f96860f mm: memcontrol: drop dead CONFIG_=
MEMCG_SWAP config symbol)
CONFLICT (content): Merge conflict in crypto/Kconfig
CONFLICT (content): Merge conflict in fs/exec.c
CONFLICT (content): Merge conflict in include/linux/fortify-string.h
CONFLICT (content): Merge conflict in include/linux/nodemask.h
CONFLICT (content): Merge conflict in mm/slub.c
Applying: mm/slab: fix up for "mm: kmsan: call KMSAN hooks from SLUB code"
Applying: crypto: x86: kmsan: disable accelerated configs in KMSAN builds
Merging mm-nonmm-stable/mm-nonmm-stable (374d6cda7946 init/main.c: remove u=
nnecessary (void*) conversions)
Merging mm/mm-everything (a9decf9324ad Merge branch 'mm-nonmm-unstable' int=
o mm-everything)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdkfd/kfd_migrat=
e.c

--Sig_/jOmZMJ/0Abt7A0xXbuQ7.Jf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmM+hgoACgkQAVBC80lX
0GzS1wgAmo8erLK26FumHxla1cUi+9GfFFEhKkO1/PrSTunekck8mE2IRsDxYZMo
Y50QQtYZGYrLu5uIZjym5Tstu3DyWRkv0qBzbxsPnhojFdOrM40ldaVJcHHw5qz2
J5U00YtC/YK8ihGyOVt6MBGzj2Etwoa4p0sy8a/+8RbMyFyBK39FRWCURVXjIRt0
LXLC71KjiMOshuOmVujuBe/Oc3KhrpiPo/JZMt/NZUBv0hoJ9SjUuVmaJgH3PdcE
oUBYMWli/GvGY2B60jgnL72OoP5tE0VLtmd4jcjKwMzmnpo120LjVSGChIbkaZPt
WFn5rQ4wjGSAjW/MRyTFtxUW4WZuew==
=RFJt
-----END PGP SIGNATURE-----

--Sig_/jOmZMJ/0Abt7A0xXbuQ7.Jf--
