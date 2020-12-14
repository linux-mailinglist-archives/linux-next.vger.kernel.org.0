Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE2CB2D963E
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 11:24:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731455AbgLNKVJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 05:21:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbgLNKVF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2020 05:21:05 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D33C0613D6;
        Mon, 14 Dec 2020 02:20:24 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CvcpY6vVYz9sSC;
        Mon, 14 Dec 2020 21:20:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607941222;
        bh=1TYUA2N5fzMOs7lM+WRZzoialf7kiNnsadq6wXU46lk=;
        h=Date:From:To:Cc:Subject:From;
        b=YnbDFMDDgD+8fiL97PgmHW0A2Vb4Ih7oz39boGCtCF9M3J3a1q0xYSRWmXBmupNjN
         shz+STngKgL8tboEUiJoPPyO+5ItOHu99o7p3xTAXKPRo9q1VuXsSv2kdB2NULAWpz
         toJqsQqbNFizGsggF7lrXIj5rLhR5W8Zoxhw1DMEtzrAsizHKcfXUDxCfJqYN7mWG8
         +XLeNH6NHjaMzCUCL//zwiBqDZ4yd32WLehd67pbuzFluY1h3STmEXVaNFH7s/iCS7
         rCC9vm3kr2HH9x2tlk3B/etfv4fVgJgpaxDrLkUjP8PFEefQj5t+772u1q/Lpk2sHH
         UFnYIzpvSXEVQ==
Date:   Mon, 14 Dec 2020 21:20:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Dec 14
Message-ID: <20201214212016.42a0de43@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GuS4q2n8Oql.spd4t65Vr9f";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GuS4q2n8Oql.spd4t65Vr9f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20201211:

The keys tree gained a build failure for which I applied a patch.

The net-next tree gained a semantic conflict against the cifs tree.

The drm tree gained a conflict against the crypto tree.

The block tree gained a conflict and a semantic conflict against Linus'
tree.

The watchdog tree gained a build failure so I used the version from
next-20201211.

The rtc tree gained a conflict against the tip tree.

The akpm-current tree gained a conflict against the risc-v tree.

Non-merge commits (relative to Linus' tree): 12037
 10890 files changed, 793991 insertions(+), 209781 deletions(-)

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
Merging origin/master (ec6f5e0e5ca0 Merge tag 'x86-urgent-2020-12-13' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging fixes/fixes (9223e74f9960 Merge tag 'io_uring-5.10-2020-11-27' of g=
it://git.kernel.dk/linux-block)
Merging kbuild-current/fixes (7d32358be8ac kbuild: avoid split lines in .mo=
d files)
Merging arc-current/for-curr (3a71e423133a ARC: build: use $(READELF) inste=
ad of hard-coded readelf)
Merging arm-current/fixes (e64ab473ddda ARM: 9034/1: __div64_32(): straight=
en up inline asm constraints)
Merging arm64-fixes/for-next/fixes (929c1f3384d7 arm64: mte: fix prctl(PR_G=
ET_TAGGED_ADDR_CTRL) if TCF0=3DNONE)
Merging arm-soc-fixes/arm/fixes (43ffe817bfe3 arm64: dts: bitmain: Use gene=
ric "ngpios" rather than "snps,nr-gpios")
Merging drivers-memory-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging m68k-current/for-linus (50c5feeea0af ide/macide: Convert Mac IDE dr=
iver to platform driver)
Merging powerpc-fixes/fixes (5eedf9fe8db2 powerpc/mm: Fix KUAP warning by p=
roviding copy_from_kernel_nofault_allowed())
Merging s390-fixes/fixes (b1cae1f84a0f s390: fix irq state tracing)
Merging sparc/master (0a95a6d1a4cd sparc: use for_each_child_of_node() macr=
o)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (7f376f1917d7 Merge tag 'mtd/fixes-for-5.10-rc8' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/mtd/linux)
Merging bpf/master (d9838b1d3928 Merge git://git.kernel.org/pub/scm/linux/k=
ernel/git/bpf/bpf)
Merging ipsec/master (48f486e13ffd net: xfrm: fix memory leak in xfrm_user_=
policy())
Merging netfilter/master (177745beebe3 MAINTAINERS: Add entry for Marvell P=
restera Ethernet Switch driver)
Merging ipvs/master (177745beebe3 MAINTAINERS: Add entry for Marvell Preste=
ra Ethernet Switch driver)
Merging wireless-drivers/master (74a8c816fa8f rtw88: debug: Fix uninitializ=
ed memory in debugfs code)
Merging mac80211/master (7f376f1917d7 Merge tag 'mtd/fixes-for-5.10-rc8' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux)
Merging rdma-fixes/for-rc (340b940ea0ed RDMA/cm: Fix an attempt to use non-=
valid pointer when cleaning timewait)
Merging sound-current/for-linus (c6dde8ffd071 ALSA: usb-audio: Fix control =
'access overflow' errors from chmap)
Merging sound-asoc-fixes/for-linus (031616c434db Merge remote-tracking bran=
ch 'asoc/for-5.10' into asoc-linus)
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
Merging input-current/for-linus (cffdd6d90482 Input: goodix - add upside-do=
wn quirk for Teclast X98 Pro tablet)
Merging crypto-current/master (c3a98c3ad5c0 crypto: x86/poly1305 - add back=
 a needed assignment)
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
Merging drm-fixes/drm-fixes (b1f195fc4981 drm/i915/display: Go softly softl=
y on initial modeset failure)
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
Merging spdx/spdx-linus (0477e9288185 Linux 5.10-rc7)
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
Merging dma-mapping/for-next (7679325702c9 selftests/dma: add test applicat=
ion for DMA_MAP_BENCHMARK)
Merging asm-generic/master (8eb42bcea5ae Merge branch 'asm-generic-fixes' i=
nto asm-generic)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (54ef31c76628 Merge branch 'devel-stable' into for-nex=
t)
Merging arm64/for-next/core (95d1718c961e Merge remote-tracking branch 'arm=
64/for-next/iommu/core' into for-next/core)
Merging arm-perf/for-next/perf (881b0520504a perf/imx_ddr: Add system PMU i=
dentifier for userspace)
Merging arm-soc/for-next (95c708fe26d2 Merge branch 'arm/fixes' into for-ne=
xt)
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
CONFLICT (content): Merge conflict in arch/microblaze/include/asm/mmu_conte=
xt.h
Merging mips/mips-next (991838f90e93 MIPS: DTS: img: Fix schema warnings fo=
r pwm-leds)
Merging nds32/next (54bde873682b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (6b57fa4d374b nios2: signal: Mark expected switch fa=
ll-through)
Merging openrisc/for-next (d8398bf840f8 openrisc: add local64.h to fix blk-=
iocost build)
Merging parisc-hd/for-next (19621e5fd02b parisc: Switch to clockevent based=
 timers)
CONFLICT (content): Merge conflict in arch/parisc/kernel/time.c
Applying: revert the rest of "parisc: use legacy_timer_tick"
Merging powerpc/next (dddc4ef92d1c KVM: PPC: Book3S HV: XIVE: Add a comment=
 regarding VP numbering)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (e95f287deed2 soc: fsl: handle RCPM errata A-008646 on=
 SoC LS1021A)
Merging risc-v/for-next (7d95a88f9254 Add and use a generic version of devm=
em_is_allowed())
Merging s390/for-next (2b134f6b2ed4 Merge branch 'features' into for-next)
CONFLICT (content): Merge conflict in arch/s390/include/asm/mmu_context.h
Merging sh/for-next (b0cfc315ff38 sh: fix syscall tracing)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (11385539c024 um: time-travel: Correct time event IR=
Q delivery)
Merging xtensa/xtensa-for-next (dc293f210690 xtensa: uaccess: Add missing _=
_user to strncpy_from_user() prototype)
Merging fscrypt/master (a14d0b676491 fscrypt: allow deleting files with uns=
upported encryption policy)
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (97847e06525b Merge branch 'for-next-next-v5.10-2020=
1211' into for-next-20201211)
Merging ceph/master (62575e270f66 ceph: check session state after bumping s=
ession->s_seq)
Merging cifs/for-next (de1ecd1edc1c cifs: remove actimeo from cifs_sb)
Merging configfs/for-next (65cdb4a214c0 configfs: fix kernel-doc markup iss=
ue)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (d8b3df8b1048 erofs: avoid using generic_block_bmap)
Merging exfat/dev (c6f928f56fe3 exfat: Avoid allocating upcase table using =
kcalloc())
Merging ext3/for_next (db561792f6c7 Pull dquot_resume() fix)
Merging ext4/dev (696c1c70a14f ext4: check for invalid block size early whe=
n trying to mount a fs)
Merging f2fs/dev (ef7b32a4386b f2fs: compress: fix compression chksum)
Merging fsverity/fsverity (bde493349025 fs-verity: move structs needed for =
file signing to UAPI header)
Merging fuse/for-next (5d069dbe8aaf fuse: fix bad inode)
Merging jfs/jfs-next (c61b3e483900 jfs: Fix array index bounds check in dbA=
djTree)
Merging nfs/linux-next (bf701b765eaa NFS: switch nfsiod to be an UNBOUND wo=
rkqueue.)
Merging nfs-anna/linux-next (11392155f2bd NFS: Disable READ_PLUS by default)
Merging nfsd/nfsd-next (c3213d260a23 SUNRPC: Fix oops in the rpc_xdr_buf ev=
ent class)
Merging cel/cel-next (716a8bc7f706 nfsd: Record NFSv4 pre/post-op attribute=
s as non-atomic)
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
Merging pci/next (86e4522bcf26 Merge branch 'remotes/lorenzo/pci/misc')
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
Merging jc_docs/docs-next (13fef8ef9fb8 docs: Note that sphinx 1.7 will be =
required soon)
Merging v4l-dvb/master (7ea4d2329330 media: ccs: Add support for obtaining =
C-PHY configuration from firmware)
CONFLICT (content): Merge conflict in drivers/staging/media/sunxi/cedrus/ce=
drus.c
CONFLICT (content): Merge conflict in MAINTAINERS
Merging v4l-dvb-next/master (d0a9fffedca1 docs: fs: api-summary.rst: get ri=
d of kernel-doc include)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (97756044ce06 Merge branch 'pm-devfreq' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (c8bb45205438 Merge branch 'cpuf=
req/scmi' into cpufreq/arm/linux-next)
Merging cpupower/cpupower (748f0d70087c cpupower: Provide online and offlin=
e CPU information)
Merging devfreq/devfreq-next (6a575e84f11e PM / devfreq: tegra30: Separate =
configurations per-SoC generation)
Merging opp/opp/linux-next (2c07b0fd9bf6 Merge branch 'opp/empty' into opp/=
linux-next)
Merging thermal/thermal/linux-next (8639ff4194c9 thermal: intel: pch: use m=
acro for temperature calculation)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (4f19d071f9be fs: dlm: check on existing node address)
Merging swiotlb/linux-next (e998879d4fb7 x86,swiotlb: Adjust SWIOTLB bounce=
 buffer size for SEV guests)
Merging rdma/for-next (d21a1240f516 RDMA/rxe: Use acquire/release for memor=
y ordering)
CONFLICT (content): Merge conflict in include/linux/dma-mapping.h
Merging net-next/master (13458ffe0a95 net: x25: Remove unimplemented X.25-o=
ver-LLC code stubs)
Applying: fixup for "treewide: rename nla_strlcpy to nla_strscpy."
Merging bpf-next/for-next (b4fe9fec51ef selftests/bpf: Silence ima_setup.sh=
 when not running in verbose mode.)
Merging ipsec-next/master (c7a5899eb26e xfrm: redact SA secret with lockdow=
n confidentiality)
Merging mlx5-next/mlx5-next (04b222f95773 RDMA/mlx5: Remove IB representors=
 dead code)
Merging netfilter-next/master (48b0ae046ee9 netfilter: nftables: netlink su=
pport for several set element expressions)
Merging ipvs-next/master (04295878beac netfilter: use actual socket sk for =
REJECT action)
Merging wireless-drivers-next/master (13458ffe0a95 net: x25: Remove unimple=
mented X.25-over-LLC code stubs)
Merging bluetooth/master (afae3cc2da10 net: atheros: simplify the return ex=
pression of atl2_phy_setup_autoneg_adv())
Merging mac80211-next/master (e5795aacd71b Merge tag 'wireless-drivers-next=
-2020-12-12' of git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireles=
s-drivers-next)
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
Merging drm/drm-next (b10733527bfd Merge tag 'amd-drm-next-5.11-2020-12-09'=
 of git://people.freedesktop.org/~agd5f/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/vga/vga_switcheroo.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/nouveau/nouveau_bo.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gvt/gvt.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_di=
splay.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/ast/ast_mode.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/clk_mg=
r/dcn21/rn_clk_mgr.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
CONFLICT (content): Merge conflict in MAINTAINERS
Applying: fixup for "drm/i915/gt: Declare gen9 has 64 mocs entries!"
Merging amdgpu/drm-next (ff60ecff9a8b drm/amdgpu: print what method we are =
using for runtime pm)
CONFLICT (content): Merge conflict in drivers/pci/pcie/err.c
Merging drm-intel/for-linux-next (7cb917b2b7bb drm/i915/display/tc: Only WA=
RN once for bogus tc port flag)
Merging drm-tegra/drm/tegra/for-next (bf3a3cdcad40 drm/tegra: sor: Disable =
clocks on error in tegra_sor_init())
Merging drm-misc/for-linux-next (05faf1559de5 drm/imx/dcss: allow using nea=
rest neighbor interpolation scaling)
Merging drm-msm/msm-next (e319a1b956f7 drm/msm: add IOMMU_SUPPORT dependenc=
y)
Merging imx-drm/imx-drm/next (b658e2a1443c gpu: drm: imx: convert comma to =
semicolon)
Merging etnaviv/etnaviv/next (4612bad5701e drm/etnaviv: Add lockdep annotat=
ions for context lock)
Merging regmap/for-next (4616c509d187 Merge remote-tracking branch 'regmap/=
for-5.11' into regmap-next)
Merging sound/for-next (d84489e374f5 ALSA: hda/ca0132 - Add ZxR surround DA=
C setup.)
Merging sound-asoc/for-next (460aa020f56c Merge remote-tracking branch 'aso=
c/for-5.11' into asoc-next)
Merging modules/modules-next (38dc717e9715 module: delay kobject uevent unt=
il after module init call)
Merging input/next (3993a1a951fe Input: sc27xx - add support for sc2730 and=
 sc2721)
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
Merging keys/keys-next (1b91ea77dfeb certs: Replace K{U,G}IDT_INIT() with G=
LOBAL_ROOT_{U,G}ID)
Applying: fixup for "certs: Fix blacklist flag type confusion"
Merging safesetid/safesetid-next (03ca0ec13892 LSM: SafeSetID: Fix warnings=
 reported by test bot)
Merging selinux/next (3df98d79215a lsm,selinux: pass flowi_common instead o=
f flowi to the LSM hooks)
Merging smack/next (9b0072e2b2b5 security/smack: remove unused varible 'rc')
Merging tomoyo/master (15269fb19310 tomoyo: Fix typo in comments.)
Merging tpmdd/next (bec020d3b6fd tpm: Fix fall-through warnings for Clang)
Merging watchdog/master (53f3cd81c4f0 dt-binding: watchdog: add Rockchip co=
mpatibles to snps,dw-wdt.yaml)
$ git reset --hard HEAD^
Merging next-20201211 version of watchdog
Merging iommu/next (4dd6ce478003 iommu: Fix a check in iommu_check_bind_dat=
a())
Merging audit/next (6b3211842a11 audit: replace atomic_add_return())
Merging devicetree/for-next (04e9ab752674 dt-bindings: mtd: convert "fixed-=
partitions" to the json-schema)
Merging mailbox/mailbox-for-next (5a6338cce9f4 mailbox: arm_mhuv2: Add driv=
er)
Merging spi/for-next (3e98a021cc85 Merge remote-tracking branch 'spi/for-5.=
11' into spi-next)
Merging tip/auto-latest (dc780fed5a1b Merge branch 'core/entry')
CONFLICT (content): Merge conflict in tools/power/cpupower/utils/helpers/mi=
sc.c
CONFLICT (content): Merge conflict in arch/microblaze/mm/Makefile
CONFLICT (content): Merge conflict in arch/microblaze/Kconfig
CONFLICT (content): Merge conflict in Documentation/x86/index.rst
Merging clockevents/timers/drivers/next (8ae954caf49a clocksource/drivers/s=
h_cmt: Fix potential deadlock when calling runtime PM)
Merging edac/edac-for-next (f4161dcc4e2c Merge branch 'edac-drivers' into e=
dac-for-next)
Merging irqchip/irq/irqchip-next (2f5fbc4305d0 irqchip/qcom-pdc: Fix phanto=
m irq when changing between rising/falling)
Merging ftrace/for-next (5b7be9c709e1 ring-buffer: Add test to validate the=
 time stamp deltas)
CONFLICT (content): Merge conflict in kernel/trace/ring_buffer.c
Merging rcu/rcu/next (50df51d12c31 Merge branch 'lkmm.2020.11.06a' into HEA=
D)
Merging kvm/linux-next (e792415c5d3e KVM: MIPS/VZ: Fix build error caused b=
y 'kvm_run' cleanup)
Merging kvm-arm/next (3a514592b698 Merge remote-tracking branch 'origin/kvm=
-arm64/psci-relay' into kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (dc924b062488 KVM: SVM: check CR4 changes agai=
nst vcpu->arch)
Merging kvms390/next (50a05be484cb KVM: s390: track synchronous pfault even=
ts in kvm_stat)
Merging xen-tip/linux-next (ee32f32335e8 xen: don't use page->lru for ZONE_=
DEVICE memory)
Merging percpu/for-next (eb4c8d15efda Merge branch 'for-5.11' into for-next)
Merging workqueues/for-next (ac87f8ff6cf1 workqueue: Kick a worker based on=
 the actual activation of delayed works)
Merging drivers-x86/for-next (0cd3f561efa9 platform/x86: ISST: Mark mmio_ra=
nge_devid_0 and mmio_range_devid_1 with static keyword)
CONFLICT (content): Merge conflict in drivers/platform/x86/intel-vbtn.c
Merging chrome-platform/for-next (de0f49487db3 platform/chrome: cros_ec_typ=
ec: Register partner altmodes)
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
Merging usb-chipidea-next/for-usb-next (df1b6960d363 usb: cdnsp: Removes so=
me not useful function arguments)
CONFLICT (content): Merge conflict in drivers/usb/cdns3/host.c
CONFLICT (content): Merge conflict in drivers/usb/cdns3/host-export.h
CONFLICT (content): Merge conflict in drivers/usb/cdns3/gadget-export.h
CONFLICT (content): Merge conflict in drivers/usb/cdns3/core.h
CONFLICT (content): Merge conflict in drivers/usb/cdns3/core.c
CONFLICT (content): Merge conflict in drivers/usb/cdns3/cdns3-gadget.c
Merging phy-next/next (b097efba9580 drm/mediatek: avoid dereferencing a nul=
l hdmi_phy on an error message)
CONFLICT (content): Merge conflict in drivers/phy/samsung/phy-exynos-pcie.c
CONFLICT (content): Merge conflict in MAINTAINERS
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
CONFLICT (content): Merge conflict in drivers/staging/Makefile
CONFLICT (content): Merge conflict in drivers/staging/Kconfig
CONFLICT (modify/delete): Documentation/devicetree/bindings/iio/adc/mt6577_=
auxadc.txt deleted in staging/staging-next and modified in HEAD. Version HE=
AD of Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt left in t=
ree.
$ git rm -f Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt
Applying: fixup for "irq_work: Cleanup"
Merging mux/for-next (05f19f7f8944 mux: adgs1408: Add mod_devicetable.h and=
 remove of_match_ptr)
Merging icc/icc-next (abb888d86f62 Merge branch 'icc-5.11' into HEAD)
Merging dmaengine/next (1d3dd68749b9 dmaengine: stm32-mdma: rework interrup=
t handler)
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
Merging gpio/for-next (b8fbfef1595c Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging gpio-brgl/gpio/for-next (b5252196d08a gpio: put virtual gpio device=
 into their own submenu)
Merging gpio-intel/for-next (e709a7b5a066 gpiolib: acpi: Make Intel GPIO tr=
ee official for GPIO ACPI work)
Merging pinctrl/for-next (274380f9eb09 Merge branch 'devel' into for-next)
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
Merging rtc/rtc-next (ce9af8939202 rtc: s3c: Remove dead code related to pe=
riodic tick handling)
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
Merging pidfd/for-next (4e62d55d77bb selftests: openat2: add RESOLVE_ confl=
ict test)
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
CONFLICT (content): Merge conflict in mm/memcontrol.c
CONFLICT (content): Merge conflict in mm/highmem.c
CONFLICT (content): Merge conflict in mm/gup.c
CONFLICT (content): Merge conflict in lib/Makefile
CONFLICT (content): Merge conflict in include/linux/sched.h
CONFLICT (content): Merge conflict in include/linux/mm.h
CONFLICT (content): Merge conflict in include/linux/memcontrol.h
CONFLICT (content): Merge conflict in include/linux/kernel.h
CONFLICT (content): Merge conflict in drivers/misc/lkdtm/lkdtm.h
CONFLICT (content): Merge conflict in drivers/misc/lkdtm/Makefile
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
CONFLICT (content): Merge conflict in arch/arc/Kconfig
Applying: fixup for "mm: move lruvec stats update functions to vmstat.h"
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (a6483bfdbbca secretmem: test: add basic selftest for m=
emfd_secret(2))
Applying: fixup for "kasan: rename get_alloc/free_info"

--Sig_/GuS4q2n8Oql.spd4t65Vr9f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/XPGAACgkQAVBC80lX
0Gwbswf9FXrZ5O5y7kFnPuf3U37s7WA1JP5gcBjQ7beeZuY24V838tckJs3ErmpI
2JVGqEY8CHwvLH3970qVYkE9hMJYHrCtjEHjuA1mnLQNpod0PvIqEnWToYZl+RLJ
QtP0uJDz5riFyu70zofGmBs4Vuk01owKTOIcrfFeSJRjZsROp57I+rh07bgM9RKL
Juw9WuKrxQrMB7hEJl/4LzibcQsj4ASXTRv8MgcPJJsD1S2hV2fY3fuVNylTMg+K
tPnFi2kJK/XiCsxMHbNrVbhnkCiWRj7dHLynqkggJ6q+cexSkxQ0CvkSD8t6C4//
4yR8NVohQb0emm/78qVLJv5uvZQsqg==
=6J7G
-----END PGP SIGNATURE-----

--Sig_/GuS4q2n8Oql.spd4t65Vr9f--
