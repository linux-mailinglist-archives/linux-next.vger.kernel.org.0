Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 909102DBDC6
	for <lists+linux-next@lfdr.de>; Wed, 16 Dec 2020 10:41:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbgLPJlK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Dec 2020 04:41:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbgLPJlK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Dec 2020 04:41:10 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6A7AC0613D6;
        Wed, 16 Dec 2020 01:40:28 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CwqqW4y76z9sRR;
        Wed, 16 Dec 2020 20:40:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608111623;
        bh=ie9Yc0hneC3u+FMmopsDNesWaS50FFdYzGS4LoyMjJo=;
        h=Date:From:To:Cc:Subject:From;
        b=YLpSomccCMZYhKC33OKVYSk3YdUohjfsYE4HI+9OJ9a/XkZ/JPFAavV9VkcHw5pOg
         UFxoxRYJ8L2BCq1fPU5KgilKTMwPUAxFd3pErdac5NsZBN4yMzOwpcgS9dkswdBqUn
         Hxrr+R7rwLz6RqXPqZjndz8mfMGzSpHBC0BNL+XY83LD2SJnIzJnIXDlx5D/r1Nh1J
         6DXJe+Z++QH6aKqi/jqyUKUtaQ0swXVPHt61NhvBZVUtEhcp7UGfA6LwproP3csTvl
         SOQXorJyn0mmFoz8hDiiDfngMFg1fywUJwltVHDKzdA7VFB5xxvoLBqF1f6qYFezBe
         7M2JBjiaT2dJw==
Date:   Wed, 16 Dec 2020 20:40:21 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Dec 16
Message-ID: <20201216204021.7b226a6d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kZIGchenUl.vVZwa80a4G10";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/kZIGchenUl.vVZwa80a4G10
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Please do not add any v5.12 destined code to your linux-next included
branches until after v5.11-rc1 has been released.

Changes since 20201215:

The thermal tree lost its build failure.

The keys tree lost its build failure.

The watchdog tree still had its build failure so I used the version from
next-20201211.

Non-merge commits (relative to Linus' tree): 9441
 8351 files changed, 357053 insertions(+), 165708 deletions(-)

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

I am currently merging 327 trees (counting Linus' and 85 trees of bug
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
Merging origin/master (148842c98a24 Merge tag 'x86-apic-2020-12-14' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging fixes/fixes (9223e74f9960 Merge tag 'io_uring-5.10-2020-11-27' of g=
it://git.kernel.dk/linux-block)
Merging kbuild-current/fixes (7d32358be8ac kbuild: avoid split lines in .mo=
d files)
Merging arc-current/for-curr (3a71e423133a ARC: build: use $(READELF) inste=
ad of hard-coded readelf)
Merging arm-current/fixes (e64ab473ddda ARM: 9034/1: __div64_32(): straight=
en up inline asm constraints)
Merging arm64-fixes/for-next/fixes (31f80a4e9603 arm64: Warn the user when =
a small VA_BITS value wastes memory)
Merging arm-soc-fixes/arm/fixes (43ffe817bfe3 arm64: dts: bitmain: Use gene=
ric "ngpios" rather than "snps,nr-gpios")
Merging drivers-memory-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging m68k-current/for-linus (2ae92e8b9b7e MAINTAINERS: Update m68k Mac e=
ntry)
Merging powerpc-fixes/fixes (5eedf9fe8db2 powerpc/mm: Fix KUAP warning by p=
roviding copy_from_kernel_nofault_allowed())
Merging s390-fixes/fixes (b1cae1f84a0f s390: fix irq state tracing)
Merging sparc/master (0a95a6d1a4cd sparc: use for_each_child_of_node() macr=
o)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (7f376f1917d7 Merge tag 'mtd/fixes-for-5.10-rc8' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/mtd/linux)
Merging bpf/master (7f376f1917d7 Merge tag 'mtd/fixes-for-5.10-rc8' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/mtd/linux)
Merging ipsec/master (7f376f1917d7 Merge tag 'mtd/fixes-for-5.10-rc8' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux)
Merging netfilter/master (7f376f1917d7 Merge tag 'mtd/fixes-for-5.10-rc8' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux)
Merging ipvs/master (177745beebe3 MAINTAINERS: Add entry for Marvell Preste=
ra Ethernet Switch driver)
Merging wireless-drivers/master (74a8c816fa8f rtw88: debug: Fix uninitializ=
ed memory in debugfs code)
Merging mac80211/master (2c85ebc57b3e Linux 5.10)
Merging rdma-fixes/for-rc (340b940ea0ed RDMA/cm: Fix an attempt to use non-=
valid pointer when cleaning timewait)
Merging sound-current/for-linus (598100be3053 Merge tag 'asoc-v5.11' of htt=
ps://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-linus)
Merging sound-asoc-fixes/for-linus (a1c0ffc5b481 Merge remote-tracking bran=
ch 'asoc/for-5.11' into asoc-linus)
Merging regmap-fixes/for-linus (e6e9354b5830 regmap: Remove duplicate `type=
` field from regmap `regcache_sync` trace event)
Merging regulator-fixes/for-linus (291de1d102fa regulator: axp20x: Fix DLDO=
2 voltage control register mask for AXP22x)
Merging spi-fixes/for-linus (58f7553fa424 Merge remote-tracking branch 'spi=
/for-5.10' into spi-linus)
Merging pci-current/for-linus (cce14622a703 PCI: Add function 1 DMA alias q=
uirk for Marvell 9215 SATA controller)
Merging driver-core.current/driver-core-linus (f8394f232b1e Linux 5.10-rc3)
Merging tty.current/tty-linus (0477e9288185 Linux 5.10-rc7)
Merging usb.current/usb-linus (0477e9288185 Linux 5.10-rc7)
Merging usb-gadget-fixes/fixes (129aa9734559 usb: raw-gadget: fix memory le=
ak in gadget_setup)
Merging usb-serial-fixes/usb-linus (0477e9288185 Linux 5.10-rc7)
Merging usb-chipidea-fixes/for-usb-fixes (e6c11a2dcaec usb: chipidea: ci_hd=
rc_imx: Pass DISABLE_DEVICE_STREAMING flag to imx6ul)
Merging phy/fixes (fb89b2544b64 phy: mediatek: fix spelling mistake in Kcon=
fig "veriosn" -> "version")
Merging staging.current/staging-linus (418baf2c28f3 Linux 5.10-rc5)
Merging char-misc.current/char-misc-linus (0477e9288185 Linux 5.10-rc7)
Merging soundwire-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging thunderbolt-fixes/fixes (0477e9288185 Linux 5.10-rc7)
Merging input-current/for-linus (4b4193256c8d Merge branch 'next' into for-=
linus)
Merging crypto-current/master (93cebeb1c21a crypto: qat - add capability de=
tection logic in qat_4xxx)
Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer)
Merging vfio-fixes/for-linus (e4eccb853664 vfio/pci: Bypass IGD init in cas=
e of -ENODEV)
Merging kselftest-fixes/fixes (88f4ede44c58 selftests/clone3: Fix build err=
or)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging dmaengine-fixes/fixes (418baf2c28f3 Linux 5.10-rc5)
Merging backlight-fixes/for-backlight-fixes (bbf5c979011a Linux 5.9)
Merging mtd-fixes/mtd/fixes (33d974e76e21 mtd: rawnand: xway: Do not force =
a particular software ECC engine)
Merging mfd-fixes/for-mfd-fixes (bbf5c979011a Linux 5.9)
Merging v4l-dvb-fixes/fixes (3d1387b3b8f6 media: vidtv: fix some warnings)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (ac3b57adf87a MIPS: Alchemy: Fix memleak in a=
lchemy_clk_setup_cpu)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (c0bc969c176b ARM: omap2: pmic-cpcap: fix maximum =
voltage to be consistent with defaults on xt875)
Merging kvm-fixes/master (111d0bda8eeb tools/kvm_stat: Exempt time-based co=
unters)
Merging kvms390-fixes/master (735931f9a51a MAINTAINERS: add uv.c also to KV=
M/s390)
Merging hwmon-fixes/hwmon (bce776f10069 hwmon: (ina3221) Fix PM usage count=
er unbalance in ina3221_write_enable)
Merging nvdimm-fixes/libnvdimm-fixes (88b67edd7247 dax: Fix compilation for=
 CONFIG_DAX && !CONFIG_FS_DAX)
Merging btrfs-fixes/next-fixes (462b8e885b92 Merge branch 'misc-5.10' into =
next-fixes)
Merging vfs-fixes/fixes (6220e48d9640 [regression fix] really dumb fuckup i=
n sparc64 __csum_partial_copy() changes)
Merging dma-mapping-fixes/for-linus (892fc9f6835e dma-pool: Fix an uninitia=
lized variable bug in atomic_pool_expand())
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (c9aa128080cb platform/x86: touchscreen_dmi=
: Add info for the Irbis TW118 tablet)
Merging samsung-krzk-fixes/fixes (cd12e4f14f7c CREDITS: remove trailing whi=
te spaces)
Merging pinctrl-samsung-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging devicetree-fixes/dt/linus (bdac39a3bd28 dt-bindings: clock: imx5: f=
ix example)
Merging scsi-fixes/fixes (4da3a54f5a02 Revert "scsi: storvsc: Validate leng=
th of incoming packet in storvsc_on_channel_callback()")
Merging drm-fixes/drm-fixes (2c85ebc57b3e Linux 5.10)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (7c5c15dffe1e drm/i915/gt: Dec=
lare gen9 has 64 mocs entries!)
Merging mmc-fixes/fixes (c0d638a03bc5 mmc: mediatek: mark PM functions as _=
_maybe_unused)
Merging rtc-fixes/rtc-fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging gnss-fixes/gnss-linus (48778464bb7d Linux 5.8-rc2)
Merging hyperv-fixes/hyperv-fixes (5f1251a48c17 video: hyperv_fb: Fix the c=
ache type when mapping the VRAM)
Merging soc-fsl-fixes/fix (2663b3388551 soc: fsl: dpio: Get the cpumask thr=
ough cpumask_of(cpu))
Merging risc-v-fixes/fixes (ccbbfd1cbf36 RISC-V: Define get_cycles64() rega=
rdless of M-mode)
Merging pidfd-fixes/fixes (aabe19b82793 nsproxy: use put_nsproxy() in switc=
h_task_namespaces())
Merging fpga-fixes/fixes (8614afd689df fpga: dfl: fix bug in port reset han=
dshake)
Merging spdx/spdx-linus (148842c98a24 Merge tag 'x86-apic-2020-12-14' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging gpio-intel-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging pinctrl-intel-fixes/fixes (5f714771d01e pinctrl: baytrail: Avoid cl=
earing debounce value when turning it off)
Merging erofs-fixes/fixes (a30573b3cdc7 erofs: fix setting up pcluster for =
temporary pages)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (3084db0e0d50 kunit: fix display of failed =
expectations for strings)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (b9bc36704cca ARM, xtensa: highmem: avoid clob=
bering non-page aligned memory reservations)
Merging drm-misc-fixes/for-linux-next-fixes (fd4e788e971c drm/omap: sdi: fi=
x bridge enable/disable)
Merging kspp-gustavo/for-next/kspp (36f9ff9e03de lib: Fix fall-through warn=
ings for Clang)
Merging kbuild/for-next (6c02f6f4124b Merge branch 'kconfig' into for-next)
Merging compiler-attributes/compiler-attributes (196793946264 Compiler Attr=
ibutes: remove CONFIG_ENABLE_MUST_CHECK)
Merging dma-mapping/for-next (f726c72d6c05 dma-mapping: benchmark: check th=
e validity of dma mask bits)
Merging asm-generic/master (8eb42bcea5ae Merge branch 'asm-generic-fixes' i=
nto asm-generic)
CONFLICT (content): Merge conflict in arch/s390/include/asm/mmu_context.h
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (54ef31c76628 Merge branch 'devel-stable' into for-nex=
t)
Merging arm64/for-next/core (95d1718c961e Merge remote-tracking branch 'arm=
64/for-next/iommu/core' into for-next/core)
Merging arm-perf/for-next/perf (881b0520504a perf/imx_ddr: Add system PMU i=
dentifier for userspace)
Merging arm-soc/for-next (95c708fe26d2 Merge branch 'arm/fixes' into for-ne=
xt)
CONFLICT (content): Merge conflict in drivers/staging/media/sunxi/cedrus/ce=
drus.c
CONFLICT (content): Merge conflict in MAINTAINERS
Merging amlogic/for-next (517c49f849d7 Merge branch 'v5.11/soc' into tmp/am=
l-rebuild)
Merging aspeed/for-next (41707a524026 Merge branches 'soc-for-v5.11' and 'd=
efconfig-for-v5.11' into for-next)
Merging at91/at91-next (e77be1651978 Merge branches 'at91-drivers', 'at91-d=
t' and 'at91-defconfig' into at91-next)
Merging drivers-memory/for-next (1133e15678af Merge branch 'mem-ctrl-next' =
into for-next)
Merging imx-mxs/for-next (09690c0e0d1c Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (b2a8f6ce4bdc Merge branch 'for_5.11/drivers-soc' int=
o next)
Merging mediatek/for-next (727bfb2c55b0 Merge branch 'v5.10-next/soc' into =
for-next)
Merging mvebu/for-next (dc14300bb67b Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (792952314166 Merge branch 'omap-for-v5.11/dt' into f=
or-next)
Merging qcom/for-next (d7288346e0a4 Merge branches 'arm64-for-5.11', 'arm64=
-defconfig-for-5.11', 'drivers-for-5.11' and 'dts-for-5.11' into for-next)
Merging raspberrypi/for-next (278407a53c3b ARM: dts: bcm283x: increase dwc2=
's RX FIFO size)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (c51a6c86347a Merge branch 'renesas-drivers-for-v5.11'=
 into renesas-next)
Merging reset/reset/next (69e392526dc2 dt-bindings: reset: convert Hisilico=
n reset controller bindings to json-schema)
Merging rockchip/for-next (e15c5c9836dc Merge branch 'v5.11-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (72f4b57a4d4b Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (0477e9288185 Linux 5.10-rc7)
Merging stm32/stm32-next (814fddb955f8 ARM: multi_v7_defconfig: enable STM3=
2 dfsdm audio support)
Merging sunxi/sunxi/for-next (9e3b3fad3579 Merge branch 'sunxi/fixes-for-5.=
10' into sunxi/for-next)
Merging tegra/for-next (b11a0dfbd316 Merge branch for-5.11/arm64/defconfig =
into for-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (de7caab0974f Merge branch 'ti-k3-dts-next' in=
to ti-k3-next)
Merging clk/clk-next (123c2aa33283 Merge branch 'clk-renesas' into clk-next)
Merging clk-samsung/for-next (44a9e78f9242 clk: samsung: Prevent potential =
endless loop in the PLL ops)
Merging csky/linux-next (ba3b26607f55 csky: Optimize atomic operations with=
 correct barrier usage)
Merging h8300/h8300-next (8808515be0ed h8300: Replace <linux/clk-provider.h=
> by <linux/of_clk.h>)
Merging ia64/next (c331649e6371 ia64: Use libata instead of the legacy ide =
driver in defconfigs)
Merging m68k/for-next (2ae92e8b9b7e MAINTAINERS: Update m68k Mac entry)
Merging m68knommu/for-next (8b22820efb35 m68k: m68328: remove duplicate cod=
e)
Merging microblaze/next (05cdf457477d microblaze: Remove noMMU code)
CONFLICT (content): Merge conflict in arch/microblaze/mm/Makefile
CONFLICT (content): Merge conflict in arch/microblaze/include/asm/mmu_conte=
xt.h
CONFLICT (content): Merge conflict in arch/microblaze/Kconfig
Merging mips/mips-next (ad4fddef5f23 mips: fix Section mismatch in referenc=
e)
Merging nds32/next (54bde873682b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (6b57fa4d374b nios2: signal: Mark expected switch fa=
ll-through)
Merging openrisc/for-next (d8398bf840f8 openrisc: add local64.h to fix blk-=
iocost build)
Merging parisc-hd/for-next (39b1e779b6e2 parisc: pci-dma: fix warning unuse=
d-function)
Merging powerpc/next (c15d1f9d03a0 powerpc: Add config fragment for disabli=
ng -Werror)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (e95f287deed2 soc: fsl: handle RCPM errata A-008646 on=
 SoC LS1021A)
Merging risc-v/for-next (7d95a88f9254 Add and use a generic version of devm=
em_is_allowed())
Merging s390/for-next (2b134f6b2ed4 Merge branch 'features' into for-next)
Merging sh/for-next (b0cfc315ff38 sh: fix syscall tracing)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (1fb1abc83636 um: Fix build w/o CONFIG_PM_SLEEP)
Merging xtensa/xtensa-for-next (dc293f210690 xtensa: uaccess: Add missing _=
_user to strncpy_from_user() prototype)
Merging fscrypt/master (a14d0b676491 fscrypt: allow deleting files with uns=
upported encryption policy)
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (97847e06525b Merge branch 'for-next-next-v5.10-2020=
1211' into for-next-20201211)
Merging ceph/master (2f0df6cfa325 libceph: drop ceph_auth_{create,update}_a=
uthorizer())
Applying: fixup for "crypto: sha - split sha.h into sha1.h and sha2.h"
Merging cifs/for-next (c7ae2fe6ff71 cifs: update internal module version nu=
mber)
Merging configfs/for-next (65cdb4a214c0 configfs: fix kernel-doc markup iss=
ue)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (d8b3df8b1048 erofs: avoid using generic_block_bmap)
Merging exfat/dev (bad62714b7e0 exfat: Avoid allocating upcase table using =
kcalloc())
Merging ext3/for_next (db561792f6c7 Pull dquot_resume() fix)
Merging ext4/dev (696c1c70a14f ext4: check for invalid block size early whe=
n trying to mount a fs)
Merging f2fs/dev (75e91c888989 f2fs: compress: fix compression chksum)
Merging fsverity/fsverity (bde493349025 fs-verity: move structs needed for =
file signing to UAPI header)
Merging fuse/for-next (5d069dbe8aaf fuse: fix bad inode)
Merging jfs/jfs-next (c61b3e483900 jfs: Fix array index bounds check in dbA=
djTree)
Merging nfs/linux-next (dee5f5f145b0 nfsd: Don't set eof on a truncated REA=
D_PLUS)
CONFLICT (content): Merge conflict in fs/nfs/nfs4proc.c
CONFLICT (content): Merge conflict in fs/nfs/nfs42xdr.c
Merging nfs-anna/linux-next (11392155f2bd NFS: Disable READ_PLUS by default)
CONFLICT (content): Merge conflict in fs/nfs/nfs4proc.c
Merging nfsd/nfsd-next (c3213d260a23 SUNRPC: Fix oops in the rpc_xdr_buf ev=
ent class)
Merging cel/cel-next (716a8bc7f706 nfsd: Record NFSv4 pre/post-op attribute=
s as non-atomic)
CONFLICT (content): Merge conflict in include/linux/sunrpc/xdr.h
Merging orangefs/for-next (e848643b524b orangefs: remove unnecessary assign=
ment to variable ret)
Merging overlayfs/overlayfs-next (04e100dce6ec Merge branch 'ovl-unpriv-v3'=
 into overlayfs-next)
Merging ubifs/next (b80a974b8c58 ubifs: ubifs_dump_node: Dump all branches =
of the index node)
Merging v9fs/9p-next (324a158fe535 fs: 9p: add generic splice_write file op=
eration)
Merging xfs/for-next (1189686e5440 fs/xfs: convert comma to semicolon)
Merging zonefs/for-next (6bea0225a4bf zonefs: fix page reference and BIO le=
ak)
Merging iomap/iomap-for-next (1a31182edd00 iomap: Call inode_dio_end() befo=
re generic_write_sync())
Merging djw-vfs/vfs-for-next (9b8523423b23 vfs: move __sb_{start,end}_write=
* to fs.h)
Merging file-locks/locks-next (8d1ddb5e7937 fcntl: Fix potential deadlock i=
n send_sig{io, urg}())
Merging vfs/for-next (61c207915a76 Merge branches 'work.sparc', 'work.epoll=
', 'work.sparc32' and 'regset.followup' into for-next)
Merging printk/for-next (2e9dda43cb06 Merge branch 'printk-rework' into for=
-next)
Merging pci/next (255b2d524884 Merge branch 'remotes/lorenzo/pci/misc')
CONFLICT (content): Merge conflict in drivers/gpu/vga/vga_switcheroo.c
Merging pstore/for-next/pstore (26fecbf7602d pstore: Move kmsg_bytes defaul=
t into Kconfig)
Merging hid/for-next (cdaa1e42b483 Merge branch 'for-5.10/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (d6da298d1b8b Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i3c/i3c/next (015cbe1f0506 i3c: Resign from my maintainer role)
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (1a033769a4fe dt-bindings: (hwmon/sbtsi_te=
mp) Add SB-TSI hwmon driver bindings)
Merging jc_docs/docs-next (47e44ed01434 docs: fix broken cross reference in=
 translations/zh_CN)
Merging v4l-dvb/master (fab0fca1da5c Merge tag 'media/v5.11-1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media)
Merging v4l-dvb-next/master (d0a9fffedca1 docs: fs: api-summary.rst: get ri=
d of kernel-doc include)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_dp_helper.c
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (08e85a810cae Merge branch 'pm-cpufreq' into linux-ne=
xt)
CONFLICT (content): Merge conflict in tools/power/cpupower/utils/helpers/mi=
sc.c
Merging cpufreq-arm/cpufreq/arm/linux-next (c8bb45205438 Merge branch 'cpuf=
req/scmi' into cpufreq/arm/linux-next)
Merging cpupower/cpupower (748f0d70087c cpupower: Provide online and offlin=
e CPU information)
Merging devfreq/devfreq-next (6a575e84f11e PM / devfreq: tegra30: Separate =
configurations per-SoC generation)
Merging opp/opp/linux-next (2c07b0fd9bf6 Merge branch 'opp/empty' into opp/=
linux-next)
Merging thermal/thermal/linux-next (4401117bf7fc thermal/drivers/devfreq_co=
oling: Fix the build when !ENERGY_MODEL)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (4f19d071f9be fs: dlm: check on existing node address)
Merging swiotlb/linux-next (e998879d4fb7 x86,swiotlb: Adjust SWIOTLB bounce=
 buffer size for SEV guests)
Merging rdma/for-next (e246b7c035d7 RDMA/cma: Don't overwrite sgid_attr aft=
er device is released)
CONFLICT (content): Merge conflict in include/linux/dma-mapping.h
Merging net-next/master (3db1a3fa9880 Merge tag 'staging-5.11-rc1' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging)
CONFLICT (content): Merge conflict in drivers/phy/samsung/phy-exynos-pcie.c
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
CONFLICT (modify/delete): Documentation/devicetree/bindings/iio/adc/mt6577_=
auxadc.txt deleted in net-next/master and modified in HEAD. Version HEAD of=
 Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt left in tree.
$ git rm -f Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt
Applying: fixup for "treewide: rename nla_strlcpy to nla_strscpy."
Merging bpf-next/for-next (3db1a3fa9880 Merge tag 'staging-5.11-rc1' of git=
://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging)
Merging ipsec-next/master (c7a5899eb26e xfrm: redact SA secret with lockdow=
n confidentiality)
Merging mlx5-next/mlx5-next (04b222f95773 RDMA/mlx5: Remove IB representors=
 dead code)
Merging netfilter-next/master (efd5a1584537 net: hns3: fix expression that =
is currently always true)
Merging ipvs-next/master (48b0ae046ee9 netfilter: nftables: netlink support=
 for several set element expressions)
Merging wireless-drivers-next/master (13458ffe0a95 net: x25: Remove unimple=
mented X.25-over-LLC code stubs)
Merging bluetooth/master (afae3cc2da10 net: atheros: simplify the return ex=
pression of atl2_phy_setup_autoneg_adv())
Merging mac80211-next/master (13458ffe0a95 net: x25: Remove unimplemented X=
.25-over-LLC code stubs)
Merging gfs2/for-next (6e5c4ea37a99 gfs2: in signal_our_withdraw wait for u=
nfreeze of _this_ fs only)
Merging mtd/mtd/next (ffad560394de mtd: phram: Allow the user to set the er=
ase page size.)
Merging nand/nand/next (ee4e0eafa43c mtd: spinand: macronix: Add support fo=
r MX35LFxG24AD)
Merging spi-nor/spi-nor/next (31ad3eff093c mtd: spi-nor: keep lock bits if =
they are non-volatile)
Merging crypto/master (93cebeb1c21a crypto: qat - add capability detection =
logic in qat_4xxx)
Merging drm/drm-next (02e66dd56422 Merge tag 'drm-misc-next-fixes-2020-12-1=
5' of git://anongit.freedesktop.org/drm/drm-misc into drm-next)
Merging amdgpu/drm-next (2386d820766e drm/amdgpu/disply: fix documentation =
warnings in display manager)
Merging drm-intel/for-linux-next (4294fa5f5032 drm/i915: Reduce duplicated =
switch cases in hpd code)
Merging drm-tegra/drm/tegra/for-next (bf3a3cdcad40 drm/tegra: sor: Disable =
clocks on error in tegra_sor_init())
Merging drm-misc/for-linux-next (ee46d16d2e40 drm: mxsfb: Silence -EPROBE_D=
EFER while waiting for bridge)
Merging drm-msm/msm-next (57f04815fd95 drm/msm: Fix WARN_ON() splat in _fre=
e_object())
Merging imx-drm/imx-drm/next (b658e2a1443c gpu: drm: imx: convert comma to =
semicolon)
Merging etnaviv/etnaviv/next (4612bad5701e drm/etnaviv: Add lockdep annotat=
ions for context lock)
Merging regmap/for-next (4616c509d187 Merge remote-tracking branch 'regmap/=
for-5.11' into regmap-next)
Merging sound/for-next (598100be3053 Merge tag 'asoc-v5.11' of https://git.=
kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-linus)
Merging sound-asoc/for-next (a1c0ffc5b481 Merge remote-tracking branch 'aso=
c/for-5.11' into asoc-linus)
Merging modules/modules-next (38dc717e9715 module: delay kobject uevent unt=
il after module init call)
Merging input/next (fafd320ae51b Input: raydium_ts_i2c - do not send zero l=
ength)
Merging block/for-next (f4d252468e9f Merge branch 'for-5.11/drivers' into f=
or-next)
CONFLICT (content): Merge conflict in fs/f2fs/super.c
CONFLICT (content): Merge conflict in fs/f2fs/f2fs.h
CONFLICT (content): Merge conflict in fs/f2fs/checkpoint.c
CONFLICT (content): Merge conflict in drivers/md/raid10.c
CONFLICT (content): Merge conflict in drivers/md/md.c
CONFLICT (content): Merge conflict in arch/arm64/include/asm/thread_info.h
Applying: fixup for "block: merge struct block_device and struct hd_struct"
Applying: fixup for "net: Remove the err argument from sock_from_file"
Applying: fixup for "block: remove the request_queue argument to the block_=
bio_remap tracepoint"
Merging device-mapper/for-next (a2b8b2d97567 dm crypt: export sysfs of kcry=
ptd workqueue)
Merging pcmcia/pcmcia-next (70d3a462fc24 pcmcia: omap: Fix error return cod=
e in omap_cf_probe())
Merging mmc/next (72b248cfbf3f dt-bindings: mmc: eliminate yamllint warning=
s)
Merging mfd/for-mfd-next (0cd3aa995740 mfd: kempld-core: Add support for ad=
ditional devices)
Merging backlight/for-backlight-next (789eb04b6c56 backlight: pwm_bl: Fix i=
nterpolation)
Merging battery/for-next (c2362519a04a power: supply: Fix a typo in warning=
 message)
Merging regulator/for-next (5e999f10a16b Merge remote-tracking branch 'regu=
lator/for-5.11' into regulator-next)
Merging security/next-testing (9dcd47fc1f7d Merge branch 'fixes-v5.10' into=
 next-testing)
Merging apparmor/apparmor-next (e37986097ba6 apparmor: Use true and false f=
or bool variable)
Merging integrity/next-integrity (207cdd565dfc ima: Don't modify file descr=
iptor mode on the fly)
Merging keys/keys-next (6b8945603d05 certs: Replace K{U,G}IDT_INIT() with G=
LOBAL_ROOT_{U,G}ID)
Merging safesetid/safesetid-next (03ca0ec13892 LSM: SafeSetID: Fix warnings=
 reported by test bot)
Merging selinux/next (3df98d79215a lsm,selinux: pass flowi_common instead o=
f flowi to the LSM hooks)
Merging smack/next (9b0072e2b2b5 security/smack: remove unused varible 'rc')
Merging tomoyo/master (ff6135959a91 Merge tag 'docs-5.11' of git://git.lwn.=
net/linux)
Merging tpmdd/next (148842c98a24 Merge tag 'x86-apic-2020-12-14' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging watchdog/master (53f3cd81c4f0 dt-binding: watchdog: add Rockchip co=
mpatibles to snps,dw-wdt.yaml)
$ git reset --hard HEAD^
Merging next-20201211 version of watchdog
Merging iommu/next (4dd6ce478003 iommu: Fix a check in iommu_check_bind_dat=
a())
Merging audit/next (6b3211842a11 audit: replace atomic_add_return())
Merging devicetree/for-next (e33dc2f36367 dt-bindings: mali-bifrost: Add dy=
namic-power-coefficient)
Merging mailbox/mailbox-for-next (5a6338cce9f4 mailbox: arm_mhuv2: Add driv=
er)
Merging spi/for-next (3e98a021cc85 Merge remote-tracking branch 'spi/for-5.=
11' into spi-next)
Merging tip/auto-latest (d1c29f5debd4 Merge branch 'efi/core')
Merging clockevents/timers/drivers/next (8ae954caf49a clocksource/drivers/s=
h_cmt: Fix potential deadlock when calling runtime PM)
Merging edac/edac-for-next (f4161dcc4e2c Merge branch 'edac-drivers' into e=
dac-for-next)
Merging irqchip/irq/irqchip-next (2f5fbc4305d0 irqchip/qcom-pdc: Fix phanto=
m irq when changing between rising/falling)
Merging ftrace/for-next (5b7be9c709e1 ring-buffer: Add test to validate the=
 time stamp deltas)
CONFLICT (content): Merge conflict in kernel/trace/ring_buffer.c
Merging rcu/rcu/next (ae5633d5117d Merge branch 'rcu/urgent' into HEAD)
Merging kvm/linux-next (e792415c5d3e KVM: MIPS/VZ: Fix build error caused b=
y 'kvm_run' cleanup)
Merging kvm-arm/next (3a514592b698 Merge remote-tracking branch 'origin/kvm=
-arm64/psci-relay' into kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (dc924b062488 KVM: SVM: check CR4 changes agai=
nst vcpu->arch)
Merging kvms390/next (50a05be484cb KVM: s390: track synchronous pfault even=
ts in kvm_stat)
Merging xen-tip/linux-next (1c728719a4da xen-blkback: set ring->xenblkd to =
NULL after kthread_stop())
Merging percpu/for-next (eb4c8d15efda Merge branch 'for-5.11' into for-next)
Merging workqueues/for-next (ac87f8ff6cf1 workqueue: Kick a worker based on=
 the actual activation of delayed works)
Merging drivers-x86/for-next (0cd3f561efa9 platform/x86: ISST: Mark mmio_ra=
nge_devid_0 and mmio_range_devid_1 with static keyword)
CONFLICT (content): Merge conflict in drivers/platform/x86/intel-vbtn.c
Merging chrome-platform/for-next (6ae9b5ffcaeb platform/chrome: cros_ec_typ=
ec: Tolerate unrecognized mux flags)
Merging hsi/for-next (8a77ed6d1fdd HSI: core: fix a kernel-doc markup)
Merging leds/for-next (98650b087417 leds: turris-omnia: check for LED_COLOR=
_ID_RGB instead LED_COLOR_ID_MULTI)
Merging ipmi/for-next (368ffd9adc7a ipmi: msghandler: Suppress suspicious R=
CU usage warning)
Merging driver-core/driver-core-next (46e85af0cc53 driver core: platform: d=
on't oops in platform_shutdown() on unbound devices)
Merging usb/usb-next (a256e24021bf usb: phy: convert comma to semicolon)
Merging usb-gadget/next (b2c586eb07ef usb: dwc2: Fix INTR OUT transfers in =
DDMA mode.)
Merging usb-serial/usb-next (fddd408ad448 USB: serial: ftdi_sio: log the CB=
US GPIO validity)
Merging usb-chipidea-next/for-usb-next (fe3defba436f usb: cdnsp: Fix for un=
defined reference to `usb_hcd_is_primary_hcd')
Merging phy-next/next (b097efba9580 drm/mediatek: avoid dereferencing a nul=
l hdmi_phy on an error message)
Merging tty/tty-next (c3ae3dc896fa serial: 8250_pci: Drop bogus __refdata a=
nnotation)
Merging char-misc/char-misc-next (93f998879cd9 Merge tag 'extcon-next-for-5=
.11' of git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon into c=
har-misc-next)
Merging extcon/extcon-next (e1efdb604f5c extcon: max77693: Fix modalias str=
ing)
Merging soundwire/next (17e0da0b8979 soundwire: intel: fix another unused-f=
unction warning)
Merging thunderbolt/next (db0746e3399e thunderbolt: Add support for Intel M=
aple Ridge)
Merging vfio/next (bdfae1c9a913 vfio/type1: Add vfio_group_iommu_domain())
Merging staging/staging-next (4996b4610767 staging: olpc_dcon: Do not call =
platform_device_unregister() in dcon_probe())
Merging mux/for-next (05f19f7f8944 mux: adgs1408: Add mod_devicetable.h and=
 remove of_match_ptr)
Merging icc/icc-next (abb888d86f62 Merge branch 'icc-5.11' into HEAD)
Merging dmaengine/next (115ff12aecfd soc: ti: k3-ringacc: Use correct error=
 casting in k3_ringacc_dmarings_init)
CONFLICT (content): Merge conflict in drivers/dma/idxd/submit.c
CONFLICT (content): Merge conflict in drivers/dma/idxd/registers.h
CONFLICT (content): Merge conflict in drivers/dma/idxd/idxd.h
CONFLICT (content): Merge conflict in drivers/dma/idxd/device.c
Merging cgroup/for-next (5a7b5f32c5aa cgroup/cgroup.c: replace 'of->kn->pri=
v' with of_cft())
Merging scsi/for-next (aa86f5b4a90b Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (cb5253198f10 scsi: cxgb4i: Fix TLS dependency)
Merging vhost/linux-next (fb202878ae6b vdpa: ifcvf: Use dma_set_mask_and_co=
herent to simplify code)
Merging rpmsg/for-next (4c0943255805 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (3048c5493cd2 gpio: Skip over NULL and (empty string)=
 line names)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging gpio-brgl/gpio/for-next (b5252196d08a gpio: put virtual gpio device=
 into their own submenu)
Merging gpio-intel/for-next (e709a7b5a066 gpiolib: acpi: Make Intel GPIO tr=
ee official for GPIO ACPI work)
Merging pinctrl/for-next (3df09cb8c92e pinctrl/spear: simplify the return e=
xpression of spear300_pinctrl_probe())
Merging pinctrl-intel/for-next (0b74e40a4e41 pinctrl: baytrail: Avoid clear=
ing debounce value when turning it off)
Merging pinctrl-samsung/for-next (c5564a50d990 pinctrl: samsung: s3c24xx: r=
emove unneeded break)
Merging pwm/for-next (fb3fffcc8d1a pwm: Remove unused function pwmchip_add_=
inversed())
Merging userns/for-next (498a1acd9ccf Merge of signal-for-v5.11, exec-for-v=
5.11, and exec-update-lock-for-v5.11 for testing in linux-next)
CONFLICT (content): Merge conflict in kernel/events/core.c
CONFLICT (content): Merge conflict in kernel/bpf/task_iter.c
Merging ktest/for-next (271e0c9dce1b ktest.pl: Fix incorrect reboot for gru=
b2bls)
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (c2e46f6b3e35 selftests/cgroup: Fix build on older d=
istros)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (59fc1e476962 Merge branch 'for-5.10/flive-pa=
tching' into for-next)
Merging coresight/next (1efbcec2ef8c coresight: cti: Reduce scope for the v=
ariable =E2=80=9Ccs_fwnode=E2=80=9D in cti_plat_create_connection())
Merging rtc/rtc-next (f70cc33029fc rtc: fix RTC removal)
CONFLICT (content): Merge conflict in include/linux/rtc.h
Merging nvdimm/libnvdimm-for-next (a1b8638ba132 Linux 5.9-rc7)
Merging at24/at24/for-next (3650b228f83a Linux 5.10-rc1)
Merging ntb/ntb-next (75b6f6487ced ntb: intel: add Intel NTB LTR vendor sup=
port for gen4 NTB)
Merging seccomp/for-next/seccomp (2c07343abd89 selftests/seccomp: Update ke=
rnel config)
CONFLICT (content): Merge conflict in arch/csky/include/asm/Kbuild
Merging kspp/for-next/kspp (09162bc32c88 Linux 5.10-rc4)
Merging gnss/gnss-next (48778464bb7d Linux 5.8-rc2)
Merging fsi/next (4a851d714ead fsi: aspeed: Support CFAM reset GPIO)
Merging slimbus/for-next (6790dc4a58f3 slimbus: qcom-ngd-ctrl: fix SSR depe=
ndencies)
Merging nvmem/for-next (292b72c982a6 nvmem: imx-ocotp: add support for the =
unaliged word count)
Merging xarray/main (80c1dbebf308 XArray: Fix splitting to non-zero orders)
Merging hyperv/hyperv-next (d1df458cbfdb hv_balloon: do adjust_managed_page=
_count() when ballooning/un-ballooning)
Merging auxdisplay/auxdisplay (351dcacc6d77 auxdisplay: panel: Remove redun=
dant charlcd_ops structures)
Merging kgdb/kgdb/for-next (d081a6e35316 kdb: Fix pager search for multi-li=
ne strings)
Merging pidfd/for-next (7abe0224623f Merge tag 'time-namespace-v5.11' of gi=
tolite.kernel.org:pub/scm/linux/kernel/git/brauner/linux into for-next)
Merging hmm/hmm (3650b228f83a Linux 5.10-rc1)
Merging fpga/for-next (aaf8fe39c952 Revert "fpga: dfl: fix the definitions =
of type & feature_id for dfl devices")
Merging kunit/test (3650b228f83a Linux 5.10-rc1)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (5de15b610f78 mtd: hyperbus: add Renesas RPC-IF driver)
Merging kunit-next/kunit (5f6b99d0287d fs: ext4: Modify inode-test.c to use=
 KUnit parameterized testing feature)
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (4ea6fa2cb921 mhi: pci_generic: Fix implicit conversio=
n warning)
Merging notifications/notifications-pipe-core (841a0dfa5113 watch_queue: sa=
mple: Display mount tree change notifications)
CONFLICT (content): Merge conflict in include/uapi/asm-generic/unistd.h
CONFLICT (content): Merge conflict in arch/xtensa/kernel/syscalls/syscall.t=
bl
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_64.tbl
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_32.tbl
CONFLICT (content): Merge conflict in arch/sparc/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/sh/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/s390/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/powerpc/kernel/syscalls/syscall.=
tbl
CONFLICT (content): Merge conflict in arch/parisc/kernel/syscalls/syscall.t=
bl
CONFLICT (content): Merge conflict in arch/mips/kernel/syscalls/syscall_o32=
.tbl
CONFLICT (content): Merge conflict in arch/mips/kernel/syscalls/syscall_n64=
.tbl
CONFLICT (content): Merge conflict in arch/mips/kernel/syscalls/syscall_n32=
.tbl
CONFLICT (content): Merge conflict in arch/microblaze/kernel/syscalls/sysca=
ll.tbl
CONFLICT (content): Merge conflict in arch/m68k/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/ia64/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/arm64/include/asm/unistd32.h
CONFLICT (content): Merge conflict in arch/arm/tools/syscall.tbl
CONFLICT (content): Merge conflict in arch/alpha/kernel/syscalls/syscall.tbl
Applying: rest of merge fix up for syscall conflict
Merging memblock/for-next (5bdba520c1b3 mm: memblock: drop __init from memb=
lock functions to make it inline)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (3650b228f83a Linux 5.10-rc1)
Merging akpm-current/current (d82a97956789 lib/lzo/lzo1x_compress.c: make l=
zogeneric1x_1_compress() static)
CONFLICT (content): Merge conflict in tools/testing/selftests/lkdtm/tests.t=
xt
CONFLICT (content): Merge conflict in mm/vmscan.c
CONFLICT (content): Merge conflict in mm/slab.c
CONFLICT (content): Merge conflict in mm/memcontrol.c
CONFLICT (content): Merge conflict in mm/highmem.c
CONFLICT (content): Merge conflict in mm/gup.c
CONFLICT (content): Merge conflict in lib/Makefile
CONFLICT (content): Merge conflict in init/main.c
CONFLICT (content): Merge conflict in include/linux/sched.h
CONFLICT (content): Merge conflict in include/linux/mm.h
CONFLICT (content): Merge conflict in include/linux/memcontrol.h
CONFLICT (content): Merge conflict in include/linux/kernel.h
CONFLICT (content): Merge conflict in drivers/misc/lkdtm/lkdtm.h
CONFLICT (content): Merge conflict in drivers/misc/lkdtm/Makefile
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
CONFLICT (content): Merge conflict in arch/arm64/mm/init.c
CONFLICT (content): Merge conflict in arch/arc/Kconfig
CONFLICT (content): Merge conflict in Documentation/vm/page_owner.rst
CONFLICT (content): Merge conflict in Documentation/admin-guide/cgroup-v1/m=
emory.rst
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (e336550f6bf3 secretmem-test-add-basic-selftest-for-mem=
fd_secret2-fix)
Applying: fixup for "kasan: rename get_alloc/free_info"

--Sig_/kZIGchenUl.vVZwa80a4G10
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/Z1gUACgkQAVBC80lX
0GyB8gf+KiytYfyobpr4jnF9e8JXwMIyJPwAzwGIvAXC7XzBsA2YpIB1QYG3RMcr
h6qacmB55XD2P0H42pzp18XMPRCREIzMlV93Zw2HfyV/P0M/yTcfjJdxF9xBanuD
usVLqZ8+vdXqs0UXx1hkscBZgdcDNhxgI8JA8//d5ZlzsLKUCCIIcwD2+PxJ6oQS
Fd0TBuATvQTmXRDcO1hP1q20ab/WrSniS93fjSWEEtniaDOEfAr5mFRXRYfg2CzP
AoWaQiQ8+JmpLxWZrSRY4WEmhoaEy+FM4j6PbkpqzyGbGF8SrZXtXo2Okkpd0byi
5hWCb8ikBcpNXlvMZxSznaVVvP7+7Q==
=JAXT
-----END PGP SIGNATURE-----

--Sig_/kZIGchenUl.vVZwa80a4G10--
