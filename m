Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 106073C6BD8
	for <lists+linux-next@lfdr.de>; Tue, 13 Jul 2021 10:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234357AbhGMIGC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Jul 2021 04:06:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234157AbhGMIGB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Jul 2021 04:06:01 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2087C0613DD;
        Tue, 13 Jul 2021 01:03:11 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GPCmq63Lbz9sWk;
        Tue, 13 Jul 2021 18:03:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626163387;
        bh=Ae098WLaG7Xv6FOqt27QgzhAH5YKCcPff1BNdYURwlY=;
        h=Date:From:To:Cc:Subject:From;
        b=MoEF1aNtD1cLgkrHmKbntuMvNIM2DA4a9O8hgPKN22yYPS5WunvcvJK407iDIAmT3
         rdEvydOmDtCKzEVh4Ei+vgDWGw+wmxPog602FeAqAnfVRxaDn2QN260pdFKNbUAB96
         cvhh8WyGqsxcRT5/rKDnnQPaWe6PKBjwlywcwASm51wyzjM/QJpZzI0dpuTPB9o57y
         pateUAHRE6zD9bwv0sU/MRMCqAm2OgyzK3sRqvnT9HUp5Si7cR0JHWQfUfI6iUpgc0
         naWQbpdfGIRq8cpFL2DHyMqBk5zIQSO036gP5ENrTFjq1cHn/uvJbV9Z+3sYkezi4y
         bMU3tdUPTh5Ww==
Date:   Tue, 13 Jul 2021 18:03:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 13
Message-ID: <20210713180305.5ba41f10@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2OtxtYbmLGsZ/cr+k6tySgT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2OtxtYbmLGsZ/cr+k6tySgT
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210712:

New tree: ieee1394

Non-merge commits (relative to Linus' tree): 942
 958 files changed, 78539 insertions(+), 9866 deletions(-)

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
Merging origin/master (7fef2edf7cc7 sd: don't mess with SD_MINORS for CONFI=
G_DEBUG_BLOCK_EXT_DEVT)
Merging fixes/fixes (614124bea77e Linux 5.13-rc5)
Merging kbuild-current/fixes (c4681547bcce Linux 5.13-rc3)
Merging arc-current/for-curr (13311e74253f Linux 5.13-rc7)
Merging arm-current/fixes (dad7b9896a5d ARM: 9081/1: fix gcc-10 thumb2-kern=
el regression)
Merging arm64-fixes/for-next/fixes (c1132702c71f Revert "arm64: cache: Lowe=
r ARCH_DMA_MINALIGN to 64 (L1_CACHE_BYTES)")
Merging arm-soc-fixes/arm/fixes (048c958f12a2 Merge tag 'tee-reviewer-for-v=
5.13' of git://git.linaro.org:/people/jens.wiklander/linux-tee into arm/fix=
es)
Merging drivers-memory-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging m68k-current/for-linus (c1367ee016e3 m68k: atari: Fix ATARI_KBD_COR=
E kconfig unmet dependency warning)
Merging powerpc-fixes/fixes (2c669ef6979c powerpc/preempt: Don't touch the =
idle task's preempt_count during hotplug)
Merging s390-fixes/fixes (c30e5e9ff0c6 s390/defconfig: allow early device m=
apper disks)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (71ce9d92fc70 octeontx2-pf: Fix uninitialized boolean va=
riable pps)
Merging bpf/master (5e21bb4e8125 bpf, test: fix NULL pointer dereference on=
 invalid expected_attach_type)
Merging ipsec/master (2580d3f40022 xfrm: Fix RCU vs hash_resize_mutex lock =
inversion)
Merging netfilter/master (d7fba8ff3e50 Merge git://git.kernel.org/pub/scm/l=
inux/kernel/git/pablo/nf)
Merging ipvs/master (c23a9fd209bc netfilter: ctnetlink: suspicious RCU usag=
e in ctnetlink_dump_helpinfo)
Merging wireless-drivers/master (1f9482aa8d41 mwifiex: bring down link befo=
re deleting interface)
Merging mac80211/master (f4b29d2ee903 Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/pablo/nf)
Merging rdma-fixes/for-rc (e73f0f0ee754 Linux 5.14-rc1)
Merging sound-current/for-linus (2e2832562c87 ALSA: pcm: Call substream ack=
() method upon compat mmap commit)
Merging sound-asoc-fixes/for-linus (3bca1d1d77ad Merge remote-tracking bran=
ch 'asoc/for-5.14' into asoc-linus)
Merging regmap-fixes/for-linus (e73f0f0ee754 Linux 5.14-rc1)
Merging regulator-fixes/for-linus (af201f2ec49b Merge remote-tracking branc=
h 'regulator/for-5.14' into regulator-linus)
Merging spi-fixes/for-linus (144d3c5cc791 Merge remote-tracking branch 'spi=
/for-5.14' into spi-linus)
Merging pci-current/for-linus (e73f0f0ee754 Linux 5.14-rc1)
Merging driver-core.current/driver-core-linus (de5540965853 Merge tag 'rtc-=
5.14' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux)
Merging tty.current/tty-linus (de5540965853 Merge tag 'rtc-5.14' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/abelloni/linux)
Merging usb.current/usb-linus (b0863f192732 USB: core: Fix incorrect pipe c=
alculation in do_proc_control())
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (94b619a07655 USB: serial: option: add s=
upport for u-blox LARA-R6 family)
Merging usb-chipidea-fixes/for-usb-fixes (42c4417937be usb: cdnsp: Fix the =
IMAN_IE_SET and IMAN_IE_CLEAR macro.)
Merging phy/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging staging.current/staging-linus (de5540965853 Merge tag 'rtc-5.14' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux)
Merging iio-fixes/fixes-togreg (e9de1ecadeab staging: ralink-gdma: Remove i=
ncorrect author information)
Merging char-misc.current/char-misc-linus (e73f0f0ee754 Linux 5.14-rc1)
Merging soundwire-fixes/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging thunderbolt-fixes/fixes (13311e74253f Linux 5.13-rc7)
Merging input-current/for-linus (818b26588994 Merge branch 'next' into for-=
linus)
Merging crypto-current/master (66192b2e3fd8 crypto: hisilicon/sec - fix the=
 process of disabling sva prefetching)
Merging vfio-fixes/for-linus (dc51ff91cf2d vfio/platform: fix module_put ca=
ll in error flow)
Merging kselftest-fixes/fixes (0c0f6299ba71 selftests: memory-hotplug: avoi=
d spamming logs with dump_page(), ratio limit hot-remove error test)
Merging modules-fixes/modules-linus (055f23b74b20 module: check for exit se=
ctions in layout_sections() instead of module_init_section())
Merging dmaengine-fixes/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging backlight-fixes/for-backlight-fixes (a38fd8748464 Linux 5.12-rc2)
Merging mtd-fixes/mtd/fixes (562b4e91d3b2 mtd: parsers: ofpart: fix parsing=
 subpartitions)
Merging mfd-fixes/for-mfd-fixes (a61f4661fba4 mfd: intel_quark_i2c_gpio: Re=
vert "Constify static struct resources")
Merging v4l-dvb-fixes/fixes (61c6f04a988e media: s5p-mfc: Fix display delay=
 control creation)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging at91-fixes/at91-fixes (6efb943b8616 Linux 5.13-rc1)
Merging omap-fixes/fixes (3ff340e24c9d bus: ti-sysc: Fix gpt12 system timer=
 issue with reserved status)
Merging kvm-fixes/master (f8be156be163 KVM: do not allow mapping valid but =
non-reference-counted pages)
Merging kvms390-fixes/master (cd4220d23bf3 KVM: selftests: do not require 6=
4GB in set_memory_region_test)
Merging hwmon-fixes/hwmon (e73f0f0ee754 Linux 5.14-rc1)
Merging nvdimm-fixes/libnvdimm-fixes (b05d4c576b69 dax: Ensure errno is ret=
urned from dax_direct_access)
Merging cxl-fixes/fixes (fae8817ae804 cxl/mem: Fix memory device capacity p=
robing)
Merging btrfs-fixes/next-fixes (2376b98e2a50 Merge branch 'misc-5.14' into =
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
Merging mmc-fixes/fixes (900185fe29d3 mmc: core: Don't allocate IDA for OF =
aliases)
CONFLICT (content): Merge conflict in drivers/mmc/core/block.c
Merging rtc-fixes/rtc-fixes (bd33335aa93d rtc: cmos: Disable irq around dir=
ect invocation of cmos_interrupt())
Merging gnss-fixes/gnss-linus (e73f0f0ee754 Linux 5.14-rc1)
Merging hyperv-fixes/hyperv-fixes (6efb943b8616 Linux 5.13-rc1)
Merging soc-fsl-fixes/fix (2663b3388551 soc: fsl: dpio: Get the cpumask thr=
ough cpumask_of(cpu))
Merging risc-v-fixes/fixes (7ede12b01b59 riscv: dts: fu740: fix cache-contr=
oller interrupts)
Merging pidfd-fixes/fixes (03ba0fe4d09f file: simplify logic in __close_ran=
ge())
Merging fpga-fixes/fixes (2e8496f31d0b firmware: stratix10-svc: reset COMMA=
ND_RECONFIG_FLAG_PARTIAL to 0)
Merging spdx/spdx-linus (de5540965853 Merge tag 'rtc-5.14' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/abelloni/linux)
Merging gpio-brgl-fixes/gpio/for-current (c6414e1a2bd2 gpio: AMD8111 and TQ=
MX86 require HAS_IOPORT_MAP)
Merging gpio-intel-fixes/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging pinctrl-intel-fixes/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging erofs-fixes/fixes (0852b6ca941e erofs: fix 1 lcluster-sized pcluste=
r for big pcluster)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (df4b0807ca1a kunit: tool: Assert the versi=
on requirement)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (024591f9a6e0 arm: ioremap: don't abuse pfn_va=
lid() to check if pfn is in RAM)
Merging cel-fixes/for-rc (9f4ad9e425a1 Linux 5.12)
Merging irqchip-fixes/irq/irqchip-fixes (1fee9db9b42d irqchip/mips: Fix RCU=
 violation when using irqdomain lookup on interrupt entry)
Merging drm-misc-fixes/for-linux-next-fixes (ffe000217c50 dma-buf/sync_file=
: Don't leak fences on merge failure)
Merging kspp-gustavo/for-next/kspp (73ffc61f4a8b Makefile: Enable -Wimplici=
t-fallthrough for Clang)
Merging kbuild/for-next (27932b6a2088 scripts: add generic syscallnr.sh)
Merging compiler-attributes/compiler-attributes (ca0760e7d79e Compiler Attr=
ibutes: Add continue in comment)
Merging dma-mapping/for-next (2b4bbc6231d7 dma-debug: report -EEXIST errors=
 in add_dma_entry)
Merging asm-generic/master (14462376858e Merge branch 'asm-generic-unaligne=
d' into asm-generic)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (3bd1461d1691 Merge branches 'fixes' and 'misc' into f=
or-next)
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
Merging renesas/next (cd117793e1ac Merge branch 'renesas-arm-dt-for-v5.15' =
into renesas-next)
Merging reset/reset/next (48a74b1147f7 reset: Add compile-test stubs)
Merging rockchip/for-next (2deacb579c33 Merge branch 'v5.15-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (5ce16705e00d Merge branch 'next/defconfig' i=
nto for-next)
Merging scmi/for-linux-next (8f380c8547f3 Merge branch 'for-next/scmi' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging stm32/stm32-next (4bf4abe19089 ARM: dts: stm32: fix stpmic node for=
 stm32mp1 boards)
Merging sunxi/sunxi/for-next (3f1c53207cf0 Merge branches 'sunxi/dt-for-5.1=
4' and 'sunxi/fixes-for-5.13' into sunxi/for-next)
Merging tegra/for-next (a5f65ad078e9 Merge branch for-5.14/arm64/dt into fo=
r-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (d71abfcc6c05 arm64: dts: ti: k3-am642-evm/sk:=
 Add DDR carveout memory nodes for R5Fs)
Merging xilinx/for-next (d98fb9ab6255 Merge branch 'zynq/dt' into for-next)
Merging clk/clk-next (783d08bd02f5 Revert "clk: divider: Switch from .round=
_rate to .determine_rate by default")
Merging clk-imx/for-next (c586f53ae159 clk: imx8mq: remove SYS PLL 1/2 cloc=
k gates)
Merging clk-renesas/renesas-clk (2cd1e3883a57 clk: renesas: rzg2l: Fix off-=
by-one check in rzg2l_cpg_clk_src_twocell_get())
Merging clk-samsung/for-next (a38fd8748464 Linux 5.12-rc2)
Merging csky/linux-next (90dc8c0e664e csky: Kconfig: Remove unused selects)
Merging h8300/h8300-next (6e5e55227c95 Merge tag 'v5.11' into h8300-next)
Merging m68k/for-next (c1367ee016e3 m68k: atari: Fix ATARI_KBD_CORE kconfig=
 unmet dependency warning)
Merging m68knommu/for-next (1ede60632ece m68k/nommu: prevent setting ROMKER=
NEL when ROM is not set)
Merging microblaze/next (14a832498c23 arch: microblaze: Fix spelling mistak=
e "vesion" -> "version")
Merging mips/mips-next (e73f0f0ee754 Linux 5.14-rc1)
Merging nds32/next (40e0dd851e7b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (ad4e600cbf89 drivers/soc/litex: remove 8-bit sub=
register option)
Merging parisc-hd/for-next (ca2b19a4bdb6 parisc: Increase gcc stack frame c=
heck to 2048 for 32- and 64-bit)
Merging powerpc/next (019b3fd94ba7 Merge tag 'powerpc-5.14-1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging soc-fsl/next (242b0b398ccd soc: fsl: enable acpi support in RCPM dr=
iver)
Merging risc-v/for-next (7761e36bc722 riscv: Fix PTDUMP output now BPF regi=
on moved back to module region)
Merging s390/for-next (7e0946a6d995 Merge branch 'fixes' into for-next)
Merging sh/for-next (2882b7626f49 sh: kernel: traps: remove unused variable)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (1aee020155f3 um: remove unneeded semicolon in um_ar=
ch.c)
Merging xtensa/xtensa-for-next (ac637a0ada71 xtensa: add fairness to IRQ ha=
ndling)
Merging pidfd/for-next (5ddf9602d711 Merge branch 'fs.mount_setattr.nosymfo=
llow' into for-next)
Merging fscrypt/master (2fc2b430f559 fscrypt: fix derivation of SipHash key=
s on big endian CPUs)
Merging fscache/fscache-next (5193f26aef59 fscache: Use refcount_t for the =
cookie refcount instead of atomic_t)
Merging afs/afs-next (7af08140979a Revert "gcov: clang: fix clang-11+ build=
")
Merging btrfs/for-next (808c6838dfee Merge branch 'for-next-current-v5.12-2=
0210624' into for-next-20210624)
Merging ceph/master (4c18347238ab ceph: take reference to req->r_parent at =
point of assignment)
Merging cifs/for-next (8d2308b55a1e cifs: fix the out of range assignment t=
o bit fields in parse_server_interfaces)
Merging cifsd/cifsd-for-next (7c4ed5ded853 Merge pull request #59 from namj=
aejeon/cifsd-for-next)
Merging configfs/for-next (c886fa3cf6ff configfs: simplify configfs_release=
_bin_file)
Merging ecryptfs/next (682a8e2b41ef Merge tag 'ecryptfs-5.13-rc1-updates' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs)
Merging erofs/dev (8215d5b7f15f MAINTAINERS: erofs: update my email address)
Merging exfat/dev (50be9417e23a Merge tag 'io_uring-5.14-2021-07-09' of git=
://git.kernel.dk/linux-block)
Merging ext3/for_next (e73f0f0ee754 Linux 5.14-rc1)
Merging ext4/dev (0705e8d1e220 ext4: inline jbd2_journal_[un]register_shrin=
ker())
Merging f2fs/dev (9b76d71fa8be Merge tag 'riscv-for-linus-5.14-mw0' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (c4e0cd4e0c16 virtiofs: Fix spelling mistakes)
Merging gfs2/for-next (e6d1bd8d56de gfs2: Fix memory leak of object lsi on =
error return path)
Merging jfs/jfs-next (5d299f44d765 jfs: Avoid field-overflowing memcpy())
Merging nfs/linux-next (e73f0f0ee754 Linux 5.14-rc1)
Merging nfs-anna/linux-next (4f8be1f53bf6 nfs: we don't support removing sy=
stem.nfs4_acl)
Merging nfsd/nfsd-next (ab1016d39cc0 nfsd: fix NULL dereference in nfs3svc_=
encode_getaclres)
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
Merging zonefs/for-next (95b115332a83 zonefs: remove redundant null bio che=
ck)
Merging iomap/iomap-for-next (6e552494fb90 iomap: remove unused private fie=
ld from ioend)
Merging djw-vfs/vfs-for-next (9b8523423b23 vfs: move __sb_{start,end}_write=
* to fs.h)
Merging file-locks/locks-next (e1cc6e8c1969 fcntl: fix potential deadlock f=
or &fasync_struct.fa_lock)
Merging vfs/for-next (303392fd5c16 Merge tag 'leds-5.14-rc1' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/pavel/linux-leds)
Merging printk/for-next (70333dec4462 Merge branch 'rework/fixup-for-5.15' =
into for-next)
Merging pci/next (e73f0f0ee754 Linux 5.14-rc1)
Merging pstore/for-next/pstore (c5d4fb2539ca pstore/blk: Use "%lu" to forma=
t unsigned long)
Merging hid/for-next (f3fb2deb517f Merge branch 'for-5.13/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (5bac2a5bf0c6 Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i3c/i3c/next (3e5feb11a829 i3c: master: svc: fix doc warning in svc=
-i3c-master.c)
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (3352a33e7f9c hwmon: (w83627ehf) Remove w8=
3627ehf_remove())
Merging jc_docs/docs-next (863616f3be33 docs/zh_CN: add core api cpu_hotplu=
g translation)
Merging v4l-dvb/master (e73f0f0ee754 Linux 5.14-rc1)
Merging v4l-dvb-next/master (379e205dab9d media: usb: dvb-usb-v2: af9035: l=
et subdrv autoselect enable si2168 and si2157)
Merging pm/linux-next (e73f0f0ee754 Linux 5.14-rc1)
Merging cpufreq-arm/cpufreq/arm/linux-next (e73f0f0ee754 Linux 5.14-rc1)
Merging cpupower/cpupower (e73f0f0ee754 Linux 5.14-rc1)
Merging devfreq/devfreq-next (8c37d01e1a86 PM / devfreq: passive: Fix get_t=
arget_freq when not using required-opp)
Merging opp/opp/linux-next (e73f0f0ee754 Linux 5.14-rc1)
Merging thermal/thermal/linux-next (fe6a6de6692e thermal/drivers/int340x/pr=
ocessor_thermal: Fix tcc setting)
Merging ieee1394/for-next (54b3bd99f094 firewire: nosy: switch from 'pci_' =
to 'dma_' API)
Merging dlm/next (957adb68b3f7 fs: dlm: invalid buffer access in lookup err=
or)
Merging swiotlb/linux-next (7d31f1c65cc9 swiotlb: fix implicit debugfs decl=
arations)
Merging rdma/for-next (e73f0f0ee754 Linux 5.14-rc1)
Merging net-next/master (5e437416ff66 Merge branch 'dsa-mv88e6xxx-topaz-fix=
es')
Merging bpf-next/for-next (5e437416ff66 Merge branch 'dsa-mv88e6xxx-topaz-f=
ixes')
Merging ipsec-next/master (84fe73996c2e Merge branch 'do_once_lite')
Merging mlx5-next/mlx5-next (e73f0f0ee754 Linux 5.14-rc1)
Merging netfilter-next/master (84fe73996c2e Merge branch 'do_once_lite')
Merging ipvs-next/master (84fe73996c2e Merge branch 'do_once_lite')
Merging wireless-drivers-next/master (ff8744b5eb11 Merge branch '100GbE' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue)
Merging bluetooth/master (3c755b4545aa Bluetooth: hci_h5: Disable the hci_s=
uspend_notifier for btrtl devices)
Merging mac80211-next/master (5e437416ff66 Merge branch 'dsa-mv88e6xxx-topa=
z-fixes')
Merging mtd/mtd/next (0bcc3939c98d Merge tag 'spi-nor/for-5.14' into mtd/ne=
xt)
Merging nand/nand/next (c06dd49fd59a mtd: rawnand: omap: Add larger page NA=
ND chips support)
Merging spi-nor/spi-nor/next (c17e5c85b32f mtd: spi-nor: remove redundant c=
ontinue statement)
Merging crypto/master (66192b2e3fd8 crypto: hisilicon/sec - fix the process=
 of disabling sva prefetching)
Merging drm/drm-next (21c355b09711 Merge tag 'drm-misc-next-fixes-2021-07-0=
1' of git://anongit.freedesktop.org/drm/drm-misc into drm-next)
Merging drm-misc/for-linux-next (34bd46bcf3de drm/vmwgfx: Fix a bad merge i=
n otable batch takedown)
Merging amdgpu/drm-next (684f97e4e9e8 drm/ttm: Fix COW check)
Merging drm-intel/for-linux-next (21c355b09711 Merge tag 'drm-misc-next-fix=
es-2021-07-01' of git://anongit.freedesktop.org/drm/drm-misc into drm-next)
Merging drm-tegra/drm/tegra/for-next (a562c0783b5f drm/tegra: Don't call SE=
T_APPLICATION_ID in VIC boot)
Merging drm-msm/msm-next (e88bbc91849b Revert "drm/msm/mdp5: provide dynami=
c bandwidth management")
Merging imx-drm/imx-drm/next (fc1e985b67f9 drm/imx: ipuv3-plane: add color =
encoding and range properties)
Merging etnaviv/etnaviv/next (81fd23e2b3cc drm/etnaviv: Implement mmap as G=
EM object function)
Merging regmap/for-next (d63aa09f7c53 regmap: Prefer unsigned int to bare u=
se of unsigned)
Merging sound/for-next (27757876d173 ALSA: intel8x0: Skip ac97 clock measur=
ement on VM)
Merging sound-asoc/for-next (48b2d8fb74b4 Merge remote-tracking branch 'aso=
c/for-5.15' into asoc-next)
Merging modules/modules-next (2c0f0f363956 module: correctly exit module_ka=
llsyms_on_each_symbol when fn() !=3D 0)
Merging input/next (f8f84af5da9e Input: joydev - prevent use of not validat=
ed data in JSIOCSBTNMAP ioctl)
Merging block/for-next (50be9417e23a Merge tag 'io_uring-5.14-2021-07-09' o=
f git://git.kernel.dk/linux-block)
Merging device-mapper/for-next (5c0de3d72f8c dm writecache: make writeback =
pause configurable)
Merging pcmcia/pcmcia-next (e9d503fef7da pcmcia: rsrc_nonstatic: Fix call-b=
ack function as reference formatting)
Merging mmc/next (900185fe29d3 mmc: core: Don't allocate IDA for OF aliases)
Merging mfd/for-mfd-next (495fb48dbd9b mfd: wm831x: Use DEFINE_RES_IRQ_NAME=
D() and DEFINE_RES_IRQ() to simplify code)
Merging backlight/for-backlight-next (1181f2164135 backlight: lm3630a: Conv=
ert to atomic PWM API and check for errors)
Merging battery/for-next (f1c74a6c07e7 power: supply: ab8500: Fix an old bu=
g)
Merging regulator/for-next (feb9cd725da7 Merge remote-tracking branch 'regu=
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
Merging selinux/next (d99cf13f1420 selinux: kill 'flags' argument in avc_ha=
s_perm_flags() and avc_audit())
Merging smack/next (fe6bde732be8 Smack: fix doc warning)
Merging tomoyo/master (e73f0f0ee754 Linux 5.14-rc1)
Merging tpmdd/next (0178f9d0f60b tpm: Replace WARN_ONCE() with dev_err_once=
() in tpm_tis_status())
Merging watchdog/master (cf813c67d961 watchdog: iTCO_wdt: use dev_err() ins=
tead of pr_err())
Merging iommu/next (2b9d8e3e9a9b Merge branches 'iommu/fixes', 'arm/rockchi=
p', 'arm/smmu', 'x86/vt-d', 'x86/amd', 'virtio' and 'core' into next)
Merging audit/next (0ecc617858fc audit: remove unnecessary 'ret' initializa=
tion)
Merging devicetree/for-next (d8a2801108af dt-bindings: mxsfb: Add compatibl=
e for i.MX8MN)
Merging mailbox/mailbox-for-next (4f197188da66 MAINTAINERS: add entry for p=
olarfire soc mailbox)
Merging spi/for-next (1b88320bc371 Merge remote-tracking branch 'spi/for-5.=
15' into spi-next)
Merging tip/auto-latest (7bfa422eb6be Merge branch 'WIP/fixes')
Merging clockevents/timers/drivers/next (6f64c8159af9 clocksource/drivers/a=
rm_global_timer: Remove duplicated argument in arm_global_timer)
Merging edac/edac-for-next (0a9ece9ba154 EDAC/igen6: fix core dependency)
Merging irqchip/irq/irqchip-next (c51e96dace68 Merge branch irq/irqchip-dri=
ver-updates into irq/irqchip-next)
Merging ftrace/for-next (3ecda64475bc ftrace: Use list_move instead of list=
_del/list_add)
Merging rcu/rcu/next (2a2ed5618a0e rcu: Fix pr_info() formats and values in=
 show_rcu_gp_kthreads())
Merging kvm/next (a01b45e9d34d KVM: x86: rename apic_access_page_done to ap=
ic_access_memslot_enabled)
Merging kvm-arm/next (188982cda00e Merge branch kvm-arm64/mmu/mte into kvma=
rm-master/next)
Merging kvm-ppc/kvm-ppc-next (72476aaa4691 KVM: PPC: Book3S HV: Fix host ra=
dix SLB optimisation with hash guests)
Merging kvms390/next (1f703d2cf204 KVM: s390: allow facility 192 (vector-pa=
cked-decimal-enhancement facility 2))
Merging xen-tip/linux-next (629a5d87e26f xen: sync include/xen/interface/io=
/ring.h with Xen's newest version)
Merging percpu/for-next (a81a52b325ec Merge branch 'for-5.14-fixes' into fo=
r-next)
Merging workqueues/for-next (7f5ba4806d3c cgroup1: fix leaked context root =
causing sporadic NULL deref in LTP)
Merging drivers-x86/for-next (0e695c3f7f66 platform/x86: dell-wmi-sysman: C=
hange user experience when Admin/System Password is modified)
Merging chrome-platform/for-next (6efb943b8616 Linux 5.13-rc1)
Merging hsi/for-next (6efb943b8616 Linux 5.13-rc1)
Merging leds/for-next (e642197562cd leds: is31fl32xx: Fix missing error cod=
e in is31fl32xx_parse_dt())
Merging ipmi/for-next (5b32dd281ee0 ipmi: kcs_bmc_aspeed: Fix less than zer=
o comparison of a unsigned int)
Merging driver-core/driver-core-next (de5540965853 Merge tag 'rtc-5.14' of =
git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux)
Merging usb/usb-next (97db1b081e12 dt-bindings: usb: dwc3: Update dwc3 TX f=
ifo properties)
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (e73f0f0ee754 Linux 5.14-rc1)
Merging usb-chipidea-next/for-usb-next (956df1bb0ab8 usb: chipidea: host: f=
ix port index underflow and UBSAN complains)
Merging tty/tty-next (de5540965853 Merge tag 'rtc-5.14' of git://git.kernel=
.org/pub/scm/linux/kernel/git/abelloni/linux)
Merging char-misc/char-misc-next (e73f0f0ee754 Linux 5.14-rc1)
Merging extcon/extcon-next (d97c0ff5a124 extcon: sm5502: Add support for SM=
5504)
Merging phy-next/next (e73f0f0ee754 Linux 5.14-rc1)
Merging soundwire/next (e73f0f0ee754 Linux 5.14-rc1)
Merging thunderbolt/next (b18f901382fd thunderbolt: Fix DROM handling for U=
SB4 DROM)
Merging vfio/next (6a45ece4c9af vfio/pci: Handle concurrent vma faults)
Merging staging/staging-next (de5540965853 Merge tag 'rtc-5.14' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/abelloni/linux)
Merging iio/togreg (50be9417e23a Merge tag 'io_uring-5.14-2021-07-09' of gi=
t://git.kernel.dk/linux-block)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (46bdcac533cc interconnect: qcom: Add SC7280 interconn=
ect provider driver)
Merging dmaengine/next (e73f0f0ee754 Linux 5.14-rc1)
Merging cgroup/for-next (cfeaa699186e Merge branch 'for-5.13-fixes' into fo=
r-next)
Merging scsi/for-next (4e65a83cd0b9 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (5f638e5ac61e scsi: virtio_scsi: Add validation f=
or residual bytes from response)
Merging vhost/linux-next (db7b337709a1 virtio-mem: prioritize unplug from Z=
ONE_MOVABLE in Big Block Mode)
Merging rpmsg/for-next (7486f29e5e60 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (c34c1228fc1c docs: driver-api: gpio: using=
-gpio.rst: avoid using ReST :doc:`foo` markup)
Merging gpio-intel/for-next (e73f0f0ee754 Linux 5.14-rc1)
Merging pinctrl/for-next (bfa50166cd9d pinctrl: ralink: rt305x: add missing=
 include)
Merging pinctrl-intel/for-next (e73f0f0ee754 Linux 5.14-rc1)
Merging pinctrl-renesas/renesas-pinctrl (c3975a73ca94 pinctrl: renesas: r8a=
77980: Add bias pinconf support)
Merging pinctrl-samsung/for-next (6efb943b8616 Linux 5.13-rc1)
Merging pwm/for-next (f4a8e31ed84e pwm: ep93xx: Ensure configuring period a=
nd duty_cycle isn't wrongly skipped)
Merging userns/for-next (5e6b8a50a7ce cred: add missing return error code w=
hen set_cred_ucounts() failed)
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging kselftest/next (e73f0f0ee754 Linux 5.14-rc1)
Merging livepatching/for-next (c150bbbb1731 Merge branch 'for-5.13/signal' =
into for-next)
Merging coresight/next (1efbcec2ef8c coresight: cti: Reduce scope for the v=
ariable =E2=80=9Ccs_fwnode=E2=80=9D in cti_plat_create_connection())
Merging rtc/rtc-next (4aa90c036df6 rtc: pcf8523: rename register and bit de=
fines)
Merging nvdimm/libnvdimm-for-next (30c10d32152d Merge branch 'for-5.12/cxl'=
 into libnvdimm-for-next)
Merging at24/at24/for-next (6efb943b8616 Linux 5.13-rc1)
Merging ntb/ntb-next (28293b6c68cd ntb: ntb_pingpong: remove redundant init=
ialization of variables msg_data and spad_data)
Merging seccomp/for-next/seccomp (19d67694745c Documentation: seccomp: Fix =
typo in user notification)
Merging kspp/for-next/kspp (6a0544606ec7 pgo: rectify comment to proper ker=
nel-doc syntax)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (0f79ce970e79 gnss: drop stray semicolons)
Merging fsi/next (9ab1428dfe2c fsi/sbefifo: Fix reset timeout)
Merging slimbus/for-next (0320ed0a8236 drivers: slimbus: Fix word resposibl=
e -> responsible in slimbus.h)
CONFLICT (content): Merge conflict in drivers/nvmem/Makefile
CONFLICT (content): Merge conflict in drivers/nvmem/Kconfig
Merging nvmem/for-next (76a2b9a8ab44 nvmem: qfprom: Improve the comment abo=
ut regulator setting)
Merging xarray/main (2c7e57a02708 idr test suite: Improve reporting from id=
r_find_test_1)
Merging hyperv/hyperv-next (ba3f5839fbeb asm-generic/hyperv: Add missing #i=
nclude of nmi.h)
Merging auxdisplay/auxdisplay (c784e46c8445 auxdisplay: Add I2C gpio expand=
er example)
Merging kgdb/kgdb/for-next (c8daba4640ac kgdb: Fix fall-through warning for=
 Clang)
Merging hmm/hmm (fe07bfda2fb9 Linux 5.12-rc1)
Merging fpga/for-next (d97176f6040f fpga: dfl: pci: add device IDs for Sili=
com N501x PAC cards)
Merging kunit/test (e73f0f0ee754 Linux 5.14-rc1)
Merging cfi/cfi/next (6efb943b8616 Linux 5.13-rc1)
Merging kunit-next/kunit (e73f0f0ee754 Linux 5.14-rc1)
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mhi/mhi-next (3bd1d916c79b bus: mhi: core: Add range checks for BHI=
 and BHIe)
Merging memblock/for-next (a4d5613c4dc6 arm: extend pfn_valid to take into =
account freed memory map alignment)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (e71ba9452f0b Linux 5.11-rc2)
Merging rust/rust-next (5d3986cf8ed6 MAINTAINERS: Rust)
CONFLICT (content): Merge conflict in include/linux/kallsyms.h
Merging cxl/next (4ad6181e4b21 cxl/pci: Rename CXL REGLOC ID)
Merging akpm-current/current (4bae9e362a11 linux-next-pre)
CONFLICT (content): Merge conflict in arch/powerpc/kernel/smp.c
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (8cba1784e022 Merge branch 'akpm-current/current')

--Sig_/2OtxtYbmLGsZ/cr+k6tySgT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDtSLkACgkQAVBC80lX
0GwIDAf9HAzEdA8m33GYYssJEn8dzPNi2wSvToQi0BpClzNcqzafyRFUCmqVB1pE
TuXNOUAFqmmsqr0TwcYJSGX9JpRp6gAul9XZhTREQRVhZRQ9PqkI0w9UwWJKhJHN
HoOdVulaelLJJ8bDKvOjwdCns+kaEC8CMF5/FMEtA2t+5TIf2fDkUHTg/UKFPdQL
DtSt7kAoZYrwKM7I27meQgKfvtfAx/h+K6kKoMZW6snbs81OImnrNnxth4/VBsR2
jVzkBQuITge+e/rF+zVaqbTh/oss1T/GaJ7v+HPHiizT7Yr7FeSD8DHYkZw67pHO
LBtJ4WDmdyEslvCOZcOvnthk8lX6FQ==
=26i6
-----END PGP SIGNATURE-----

--Sig_/2OtxtYbmLGsZ/cr+k6tySgT--
