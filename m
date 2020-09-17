Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36AF326D8E0
	for <lists+linux-next@lfdr.de>; Thu, 17 Sep 2020 12:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbgIQKXX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Sep 2020 06:23:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726579AbgIQKXS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Sep 2020 06:23:18 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BD03C06174A;
        Thu, 17 Sep 2020 03:23:18 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BsY2T62LPz9sS8;
        Thu, 17 Sep 2020 20:23:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600338193;
        bh=SdvsAslm575mR4TcXPbI99R2SXLoKYJbQIpVN1eM0b8=;
        h=Date:From:To:Cc:Subject:From;
        b=jCuEsqpQ3zpK4RjJAASbLN8bn1I41xzJ1Z76ZpJFXUWdXW49MdNECgDmt4J62LppO
         GS7Uii4qYpA29dkQ8bbId50lKZBetFMBgBAOoujZUQZ5C8ZZHZoHC2wBTmQSAiJz5C
         Dd0xT9glOCmFq533GSW9KnW1HHYx7butQs/dHnKs+a3ZwmKxQcgevjcgPMwJKex9x7
         1r0ebi5v9+L91b8synpMtXLycDQWxGxV5WdhrTLt7Ros5iL4Dlihv8bzehfAEEZR1I
         jI9TwWg1zT+qH4I2GUtWTUl1kfjMRGyAiXj+cXbOqfOf1pjzAGjysiEK9bwMO851yH
         hGNJaef8BHURw==
Date:   Thu, 17 Sep 2020 20:23:13 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 17
Message-ID: <20200917202313.143f66f3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eF52xl6HW+dF.6_yyRlsKCw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/eF52xl6HW+dF.6_yyRlsKCw
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20200916:

Removed tree: s390-setfs (consoldiated into the s390 tree)

The jc_docs tree gained a conflict against the spdx tree.

The net-next tree gained a conflict against the net tree.

I added a supplied fix to the tip tree.

The rcu tree gained a build failure so I used the version from
next-20200916.

The tty tree gained a conflict against the tty.current tree.

The akpm-current tree gained a conflict against the powerpc tree.

Non-merge commits (relative to Linus' tree): 7580
 8466 files changed, 265692 insertions(+), 150749 deletions(-)

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

I am currently merging 328 trees (counting Linus' and 86 trees of bug
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
Merging origin/master (5925fa68fe82 Merge tag 'perf-tools-fixes-for-v5.9-20=
20-09-16' of git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux)
Merging fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging kbuild-current/fixes (f4d51dffc6c0 Linux 5.9-rc4)
Merging arc-current/for-curr (f4d51dffc6c0 Linux 5.9-rc4)
Merging arm-current/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging arm64-fixes/for-next/fixes (ed888cb0d1eb arm64: Allow CPUs unffecte=
d by ARM erratum 1418040 to come in late)
Merging arm-soc-fixes/arm/fixes (a4da411e4189 Merge tag 'arm-soc/for-5.9/de=
vicetree-fixes' of https://github.com/Broadcom/stblinux into arm/fixes)
Merging uniphier-fixes/fixes (48778464bb7d Linux 5.8-rc2)
Merging drivers-memory-fixes/fixes (7ff3a2a626f7 memory: jz4780_nemc: Fix a=
n error pointer vs NULL check in probe())
Merging m68k-current/for-linus (382f429bb559 m68k: defconfig: Update defcon=
figs for v5.8-rc3)
Merging powerpc-fixes/fixes (0460534b532e powerpc/papr_scm: Limit the reada=
bility of 'perf_stats' sysfs attribute)
Merging s390-fixes/fixes (cd4d3d5f21dd s390: add 3f program exception handl=
er)
Merging sparc/master (0a95a6d1a4cd sparc: use for_each_child_of_node() macr=
o)
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (d5d325eae782 Merge git://git.kernel.org/pub/scm/linux/k=
ernel/git/bpf/bpf)
Merging bpf/master (642e450b6b59 xsk: Do not discard packet when NETDEV_TX_=
BUSY)
Merging ipsec/master (8366685b2883 xfrm: clone whole liftime_cur structure =
in xfrm_do_migrate)
Merging netfilter/master (d5d325eae782 Merge git://git.kernel.org/pub/scm/l=
inux/kernel/git/bpf/bpf)
Merging ipvs/master (7c7ab580db49 net: Convert to use the fallthrough macro)
Merging wireless-drivers/master (1264c1e0cfe5 Revert "wlcore: Adding suppop=
rt for IGTK key in wlcore driver")
Merging mac80211/master (c8146fe292a7 Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/bpf/bpf)
Merging rdma-fixes/for-rc (856deb866d16 Linux 5.9-rc5)
Merging sound-current/for-linus (8949b6660c3c Merge tag 'asoc-fix-v5.9-rc4'=
 of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-=
linus)
Merging sound-asoc-fixes/for-linus (e841ab6475e7 Merge remote-tracking bran=
ch 'asoc/for-5.9' into asoc-linus)
Merging regmap-fixes/for-linus (f75aef392f86 Linux 5.9-rc3)
Merging regulator-fixes/for-linus (856deb866d16 Linux 5.9-rc5)
Merging spi-fixes/for-linus (a67ea3c79f01 Merge remote-tracking branch 'spi=
/for-5.9' into spi-linus)
Merging pci-current/for-linus (e338eecf3fe7 PCI: rockchip: Fix bus checks i=
n rockchip_pcie_valid_device())
Merging driver-core.current/driver-core-linus (856deb866d16 Linux 5.9-rc5)
Merging tty.current/tty-linus (ec0972adecb3 fbcon: Fix user font detection =
test at fbcon_resize().)
Merging usb.current/usb-linus (d69030c91b37 usb: typec: intel_pmc_mux: Hand=
le SCU IPC error conditions)
Merging usb-gadget-fixes/fixes (51609fba0cca usb: dwc3: simple: add support=
 for Hikey 970)
Merging usb-serial-fixes/usb-linus (2bb70f0a4b23 USB: serial: option: suppo=
rt dynamic Quectel USB compositions)
Merging usb-chipidea-fixes/ci-for-usb-stable (2d79b3360dcc usb: chipidea: c=
ore: add wakeup support for extcon)
Merging phy/fixes (850280156f64 phy: ti: am654: Fix a leak in serdes_am654_=
probe())
Merging staging.current/staging-linus (856deb866d16 Linux 5.9-rc5)
Merging char-misc.current/char-misc-linus (856deb866d16 Linux 5.9-rc5)
Merging soundwire-fixes/fixes (3fbbf2148a40 soundwire: fix double free of d=
angling pointer)
Merging thunderbolt-fixes/fixes (f022ff7bf377 thunderbolt: Retry DROM read =
once if parsing fails)
Merging input-current/for-linus (6c77545af100 Input: trackpoint - add new t=
rackpoint variant IDs)
Merging crypto-current/master (1b0df11fde0f padata: fix possible padata_wor=
ks_lock deadlock)
Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer)
Merging vfio-fixes/for-linus (aae7a75a821a vfio/type1: Add proper error unw=
ind for vfio_iommu_replay())
Merging kselftest-fixes/fixes (5c1e4f7e9e49 selftests/timers: Turn off time=
out setting)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging dmaengine-fixes/fixes (f4d51dffc6c0 Linux 5.9-rc4)
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (f7e6b19bc764 mtd: properly check all write ioc=
tls for permissions)
Merging mfd-fixes/for-mfd-fixes (22380b65dc70 mfd: mfd-core: Ensure disable=
d devices are ignored without error)
Merging v4l-dvb-fixes/fixes (129134e5415d media: media/v4l2: remove V4L2_FL=
AG_MEMORY_NON_CONSISTENT flag)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (baf5cb30fbd1 MIPS: SNI: Fix SCSI interrupt)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (6542e2b613c2 ARM: dts: omap5: Fix DSI base addres=
s and clocks)
Merging kvm-fixes/master (37f66bbef092 KVM: emulator: more strict rsm check=
s.)
Merging kvms390-fixes/master (f20d4e924b44 docs: kvm: add documentation for=
 KVM_CAP_S390_DIAG318)
Merging hwmon-fixes/hwmon (d50e0d750004 hwmon: (sparx5) Fix initial reading=
 of temperature)
Merging nvdimm-fixes/libnvdimm-fixes (6180bb446ab6 dax: fix detection of da=
x support for non-persistent memory block devices)
Merging btrfs-fixes/next-fixes (db21884a207b Merge branch 'misc-5.9' into n=
ext-fixes)
Merging vfs-fixes/fixes (9d682ea6bcc7 vboxsf: Fix the check for the old bin=
ary mount-arguments struct)
Merging dma-mapping-fixes/for-linus (892fc9f6835e dma-pool: Fix an uninitia=
lized variable bug in atomic_pool_expand())
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging samsung-krzk-fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging devicetree-fixes/dt/linus (e5467b672bd9 dt-bindings: leds: cznic,tu=
rris-omnia-leds: fix error in binding)
Merging scsi-fixes/fixes (6c5dee18756b scsi: sd: sd_zbc: Fix ZBC disk initi=
alization)
Merging drm-fixes/drm-fixes (7f7a47952c0f Merge tag 'drm-misc-fixes-2020-09=
-09' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (20612303a0b4 drm/i915: Filter=
 wake_flags passed to default_wake_function)
Merging mmc-fixes/fixes (14801c624066 mmc: mmc_spi: Fix mmc_spi_dma_alloc()=
 return type for !HAS_DMA)
Merging rtc-fixes/rtc-fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging gnss-fixes/gnss-linus (48778464bb7d Linux 5.8-rc2)
Merging hyperv-fixes/hyperv-fixes (911e1987efc8 Drivers: hv: vmbus: Add tim=
eout to vmbus_wait_for_unload)
Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq h=
andlers after dpio create)
Merging risc-v-fixes/fixes (66d18dbda846 RISC-V: Take text_mutex in ftrace_=
init_nop())
Merging pidfd-fixes/fixes (bda4c60d02e9 sys: Convert to the new fallthrough=
 notation)
Merging fpga-fixes/fixes (8614afd689df fpga: dfl: fix bug in port reset han=
dshake)
Merging spdx/spdx-linus (5ec4f0ce4221 net/mlx5: IPsec: make spdxcheck.py ha=
ppy)
Merging gpio-intel-fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging pinctrl-intel-fixes/fixes (3488737093e7 pinctrl: cherryview: Preser=
ve CHV_PADCTRL1_INVRXTX_TXDATA flag on GPIOs)
Merging erofs-fixes/fixes (9ebcfadb0610 Linux 5.8-rc3)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (21a6d1780d5b kunit: tool: allow generating=
 test results in JSON)
Merging ubifs-fixes/fixes (f37e99aca03f Merge tag 's390-5.8-6' of git://git=
.kernel.org/pub/scm/linux/kernel/git/s390/linux into master)
Merging memblock-fixes/fixes (5f7b81c18366 ia64: fix min_low_pfn/max_low_pf=
n build errors)
Merging drm-misc-fixes/for-linux-next-fixes (74ea06164cda drm/sun4i: mixer:=
 Extend regmap max_register)
Merging kspp-gustavo/for-next/kspp (cb0938372de0 Merge branch 'for-next/cla=
ng' into for-next/kspp)
Merging kbuild/for-next (26bde0ed700d Merge branch 'kbuild' (early part) in=
to for-next)
Merging compiler-attributes/compiler-attributes (e5fc436f06ee sparse: use s=
tatic inline for __chk_{user,io}_ptr())
Merging dma-mapping/for-next (a92df4f62fda dma-mapping: move the dma_declar=
e_coherent_memory documentation)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (adc5f7029376 ARM: add malloc size to decompressor kex=
ec size structure)
Merging arm64/for-next/core (e35928ce20ba Merge branches 'for-next/acpi', '=
for-next/cpuinfo', 'for-next/misc', 'for-next/mm', 'for-next/perf', 'for-ne=
xt/topology', 'for-next/tpyos' and 'for-next/vdso' into for-next/core)
Merging arm-perf/for-next/perf (2b694fc92a34 perf: arm_dsu: Support DSU ACP=
I devices)
Merging arm-soc/for-next (97b66548a7cc ARM: Document merges)
Merging amlogic/for-next (c943b84fab78 Merge branch 'v5.10/dt64' into tmp/a=
ml-rebuild)
Merging aspeed/for-next (315d4a38c4b6 ARM: config: aspeed_g5: Enable IBM OP=
 Panel driver)
Merging at91/at91-next (d1f170f8447d Merge branches 'at91-soc' and 'at91-dt=
' into at91-next)
Merging drivers-memory/for-next (26cb1d2fffb7 memory: omap-gpmc: Fix compil=
e test on SPARC)
Merging imx-mxs/for-next (4f4ceed1a40f Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (36f3ea3c42ce Merge branch 'for_5.10/drivers-soc' int=
o next)
Merging mediatek/for-next (2fb345db29ad Merge branch 'v5.9-next/soc' into f=
or-next)
Merging mvebu/for-next (29bd9d8c2ac1 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (34766a7d60e9 Merge branch 'omap-for-v5.10/defconfig'=
 into for-next)
Merging qcom/for-next (0ddd80bb6b19 Merge branches 'arm64-for-5.10', 'arm64=
-defconfig-for-5.10' and 'drivers-for-5.10' into for-next)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging raspberrypi/for-next (4564363351e2 ARM: dts: bcm2711: Enable the di=
splay pipeline)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (af66a5f750a1 Merge branch 'renesas-arm-dt-for-v5.10' =
into renesas-next)
Merging reset/reset/next (2983e2385ff6 reset: imx7: add the cm4 reset for i=
.MX8MQ)
CONFLICT (content): Merge conflict in drivers/reset/reset-imx7.c
Merging rockchip/for-next (5b54a6a5703f Merge branch 'v5.10-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (7f4156bdf205 Merge branch 'next/soc' into fo=
r-next)
Merging scmi/for-linux-next (0d5e4b9b1bac Merge tag 'scmi-updates-5.10' of =
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-l=
inux-next)
Merging sunxi/sunxi/for-next (5bcae6ef32b0 Merge branch 'sunxi/dt-for-5.10'=
 into sunxi/for-next)
Merging tegra/for-next (05ccc6eebf8e Merge branch for-5.10/arm64/defconfig =
into for-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (c5e91b849c80 arm64: dts: ti: k3-j721e-common-=
proc-board: Configure the PCIe instances)
Merging uniphier/for-next (4f8fb65af529 Merge branch 'dt64' into for-next)
Merging clk/clk-next (2d0cc1cd35f2 Merge branch 'clk-fixes' into clk-next)
Merging clk-samsung/for-next (fec38565411f clk: samsung: Use cached clk_hws=
 instead of __clk_lookup() calls)
Merging csky/linux-next (bdcd93ef9afb csky: Add context tracking support)
Merging h8300/h8300-next (8808515be0ed h8300: Replace <linux/clk-provider.h=
> by <linux/of_clk.h>)
Merging ia64/next (c331649e6371 ia64: Use libata instead of the legacy ide =
driver in defconfigs)
Merging m68k/for-next (352e04291115 m68k: Replace HTTP links with HTTPS one=
s)
Merging m68knommu/for-next (858b810bf63f m68knommu: switch to using asm-gen=
eric/uaccess.h)
CONFLICT (content): Merge conflict in arch/m68k/Kconfig
Merging microblaze/next (4a17e8513376 microblaze: fix kbuild redundant file=
 warning)
Merging mips/mips-next (601637e42df0 MIPS: Remove mach-*/war.h)
Merging nds32/next (54bde873682b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (6b57fa4d374b nios2: signal: Mark expected switch fa=
ll-through)
Merging openrisc/for-next (55b2662ec665 openrisc: uaccess: Add user address=
 space check to access_ok)
Merging parisc-hd/for-next (c71fcd3c4fcf parisc: disable CONFIG_IDE in defc=
onfigs)
Merging powerpc/next (b5c8a2934eec Merge coregroup support into next)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (e9e4ef9116b1 soc: fsl: dpio: Remove unused inline fun=
ction qbman_write_eqcr_am_rt_register)
Merging risc-v/for-next (54701a0d12e2 RISC-V: Fix duplicate included thread=
_info.h)
Merging s390/for-next (9b1000ea2036 Merge branch 'set_fs' into for-next)
CONFLICT (content): Merge conflict in arch/m68k/Kconfig
Merging sh/for-next (b0cfc315ff38 sh: fix syscall tracing)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (f6e8c474390b um: virtio: Replace zero-length array =
with flexible-array)
Merging xtensa/xtensa-for-next (4ca4c562efb6 xtensa: uaccess: Add missing _=
_user to strncpy_from_user() prototype)
Merging fscrypt/master (5e895bd4d523 fscrypt: restrict IV_INO_LBLK_32 to in=
o_bits <=3D 32)
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (abecc38b009f Merge branch 'for-next-next-v5.9-20200=
910' into for-next-20200910)
Merging ceph/master (f44d04e696fe rbd: require global CAP_SYS_ADMIN for map=
ping and unmapping)
Merging cifs/for-next (856deb866d16 Linux 5.9-rc5)
Merging configfs/for-next (059ccbfff8a8 configfs: use flush file op to comm=
it writes to a binary file)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (cfcedfe21820 erofs: avoid duplicated permission check fo=
r "trusted." xattrs)
Merging exfat/dev (9764d7e25a9f exfat: eliminate dead code in exfat_find())
Merging ext3/for_next (8859bf2b1278 reiserfs: only call unlock_new_inode() =
if I_NEW)
Merging ext4/dev (27bc446e2def ext4: limit the length of per-inode prealloc=
 list)
Merging f2fs/dev (b8ee60871d5e f2fs: compress: introduce cic/dic slab cache)
Merging fsverity/fsverity (f3db0bed4583 fs-verity: use smp_load_acquire() f=
or ->i_verity_info)
Merging fuse/for-next (9a752d18c85a virtiofs: add logic to free up a memory=
 range)
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (856deb866d16 Linux 5.9-rc5)
Merging nfs-anna/linux-next (7705a4e65fc5 NFSv4.2: xattr cache: remove unus=
ed cache struct field)
Merging nfsd/nfsd-next (9123e3a74ec7 Linux 5.9-rc1)
Merging cel/cel-next (f75aef392f86 Linux 5.9-rc3)
Merging orangefs/for-next (e848643b524b orangefs: remove unnecessary assign=
ment to variable ret)
Merging overlayfs/overlayfs-next (8f6ee74c2786 ovl: rearrange ovl_can_list(=
))
Merging ubifs/next (798b7347e4f2 jffs2: fix UAF problem)
Merging v9fs/9p-next (2ed0b7578170 9p: Remove unneeded cast from memory all=
ocation)
Merging xfs/for-next (fe341eb151ec xfs: ensure that fpunch, fcollapse, and =
finsert operations are aligned to rt extent size)
Merging zonefs/for-next (48bfd5c6fac1 zonefs: document the explicit-open mo=
unt option)
Merging iomap/iomap-for-next (14284fedf59f iomap: Mark read blocks uptodate=
 in write_begin)
Merging djw-vfs/vfs-for-next (e4f9ba20d3b8 fs/xfs: Update xfs_ioctl_setattr=
_dax_invalidate())
Merging file-locks/locks-next (1ad5f100e3ba locks: Remove extra "0x" in tra=
cepoint format specifier)
Merging vfs/for-next (c5c8adc73309 Merge branches 'fixes', 'work.misc', 'wo=
rk.sparc', 'base.set_fs' and 'work.csum_and_copy', remote-tracking branch '=
vfs/work.epoll' into for-next)
CONFLICT (content): Merge conflict in arch/s390/include/asm/checksum.h
Merging printk/for-next (af8fbcb58191 Merge branch 'printk-rework' into for=
-next)
Merging pci/next (9a8b3f0c7abe Merge branch 'remotes/lorenzo/pci/xilinx')
CONFLICT (content): Merge conflict in drivers/pci/controller/dwc/pci-imx6.c
Merging pstore/for-next/pstore (137c6236aeec mailmap: Add WeiXiong Liao)
CONFLICT (content): Merge conflict in .mailmap
Merging hid/for-next (5bd34639e3da Merge branch 'for-5.10/core' into for-ne=
xt)
Merging i2c/i2c/for-next (ab17a48e18c4 Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i3c/i3c/next (cc3a392d69b6 i3c: master: fix for SETDASA and DAA pro=
cess)
Merging dmi/dmi-for-next (a3d13a0a23ea Replace HTTP links with HTTPS ones: =
DMI/SMBIOS SUPPORT)
Merging hwmon-staging/hwmon-next (2835d860d3fc hwmon: (k10temp) Add support=
 for Zen3 CPUs)
Merging jc_docs/docs-next (9f35cf8bd7e3 docs: rewrite admin-guide/sysctl/ab=
i.rst)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging v4l-dvb/master (741043b02c2e media: vidtv: don't initialize cnr2qua=
l var)
Merging v4l-dvb-next/master (0d6db85131e0 Revert "media: atomisp: keep the =
ISP powered on when setting it")
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (a65af31190c0 Merge branch 'pm-cpuidle' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (bc9b9c5ab9d8 cpufreq: qcom: Don=
't add frequencies without an OPP)
Merging cpupower/cpupower (527b7779e5ec cpupower: speed up generating git v=
ersion string)
Merging devfreq/devfreq-next (d283fdeb22aa PM / devfreq: event: Change prot=
otype of devfreq_event_get_edev_by_phandle function)
Merging opp/opp/linux-next (a5663c9b1e31 opp: Allow opp-level to be set to =
0)
Merging thermal/thermal/linux-next (6f55be9fd5ee Merge branch 'thermal/fixe=
s' into thermal/linux-next)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (7ae0451e2e6c fs: dlm: use free_con to free connection)
Merging swiotlb/linux-next (b51e627158cb swiotlb: Mark max_segment with sta=
tic keyword)
Merging rdma/for-next (9e054b13b2f7 RDMA/qedr: Fix function prototype param=
eters alignment)
Merging net-next/master (b948577b984a cxgb4vf: convert to use DEFINE_SEQ_AT=
TRIBUTE macro)
CONFLICT (content): Merge conflict in net/ipv4/route.c
CONFLICT (content): Merge conflict in drivers/net/dsa/microchip/ksz9477.c
Merging bpf-next/master (c64779e24e88 selftests/bpf: Merge most of test_btf=
 into test_progs)
Merging ipsec-next/master (02a20d4fef3d enic: switch from 'pci_' to 'dma_' =
API)
Merging mlx5-next/mlx5-next (9123e3a74ec7 Linux 5.9-rc1)
Merging netfilter-next/master (897dccb8db0d Merge branch 'nexthop-Small-cha=
nges')
Merging ipvs-next/master (bfdd5aaa54b0 Merge tag 'Smack-for-5.9' of git://g=
ithub.com/cschaufler/smack-next)
Merging wireless-drivers-next/master (f26506f06bf8 rtlwifi: rtl8723ae: fix =
comparison pointer to bool warning in phy.c)
Merging bluetooth/master (81ebea5352e5 Bluetooth: btintel: Functions to sen=
d firmware header / payload)
Merging mac80211-next/master (e059c6f340f6 tulip: switch from 'pci_' to 'dm=
a_' API)
Merging gfs2/for-next (0211c39f98df gfs2: convert to use DEFINE_SEQ_ATTRIBU=
TE macro)
Merging mtd/mtd/next (670c898cee31 mtd: spear_smi: use for_each_child_of_no=
de() macro)
Merging nand/nand/next (3d0489c87b9a mtd: rawnand: atmel: Check return valu=
es for nand_read_data_op)
Merging spi-nor/spi-nor/next (e93a977367b2 mtd: revert "spi-nor: intel: pro=
vide a range for poll_timout")
Merging crypto/master (8db1824f5a38 crypto: ux500 - Fix sparse endianness w=
arnings)
Merging drm/drm-next (818280d5adf1 Merge v5.9-rc5 into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_con=
text.c
Merging amdgpu/drm-next (d62c70e7f819 Revert "drm/radeon: handle PCIe root =
ports with addressing limitations")
Merging drm-intel/for-linux-next (9f9f4101fc98 drm/i915/selftests: Push the=
 fake iommu device from the stack to data)
Merging drm-tegra/drm/tegra/for-next (4fba6d22ca9a drm/tegra: plane: Suppor=
t 180=C2=B0 rotation)
Merging drm-misc/for-linux-next (05e63c6a7eb1 Merge branch 'virtio-shm' of =
git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse into drm-misc-n=
ext)
Merging drm-msm/msm-next (1ef7c99d145c drm/msm/dsi: add support for 7nm DSI=
 PHY/PLL)
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (efd5a93d2a89 drm/imx: drop explicit drm_mode_=
config_cleanup)
Merging etnaviv/etnaviv/next (c5d5a32ead1e drm/etnaviv: fix ref count leak =
via pm_runtime_get_sync)
Merging regmap/for-next (b89102f28d29 Merge remote-tracking branch 'regmap/=
for-5.10' into regmap-next)
Merging sound/for-next (2b3d2987d800 ALSA: firewire: Replace tasklet with w=
ork)
Merging sound-asoc/for-next (f11cecaf4673 Merge remote-tracking branch 'aso=
c/for-5.10' into asoc-next)
Merging modules/modules-next (14721add58ef module: Add more error message f=
or failed kernel module loading)
Merging input/next (cafb3abea613 Input: sun4i-ps2 - fix handling of platfor=
m_get_irq() error)
Merging block/for-next (99faa39ec56f Merge branch 'for-5.10/block' into for=
-next)
Merging device-mapper/for-next (3a653b205f29 dm thin metadata: Fix use-afte=
r-free in dm_bm_set_read_only)
Merging pcmcia/pcmcia-next (46d079790663 pcmcia: make pccard_loop_tuple() s=
tatic)
Merging mmc/next (878dbe426a56 mmc: core: clear 'doing_init_tune' also afte=
r failures)
CONFLICT (content): Merge conflict in drivers/mmc/host/Kconfig
Merging mfd/for-mfd-next (59306d7db654 mfd: sprd: Add wakeup capability for=
 PMIC IRQ)
Merging backlight/for-backlight-next (7eb99a39ef76 video: backlight: cr_bll=
cd: Remove unused variable 'intensity')
Merging battery/for-next (d8483f31487c dt-bindings: power: supply: Cleanup =
charger-manager bindings)
Merging regulator/for-next (4c66a0efe041 Merge remote-tracking branch 'regu=
lator/for-5.10' into regulator-next)
Merging security/next-testing (bc62d68e2a0a device_cgroup: Fix RCU list deb=
ugging warning)
Merging apparmor/apparmor-next (e37986097ba6 apparmor: Use true and false f=
or bool variable)
Merging integrity/next-integrity (48ce1ddce16b ima: Fail rule parsing when =
asymmetric key measurement isn't supportable)
Merging keys/keys-next (b6f61c314649 keys: Implement update for the big_key=
 type)
Merging safesetid/safesetid-next (0476c865ded6 LSM: SafeSetID: Fix warnings=
 reported by test bot)
Merging selinux/next (8861d0af642c selinux: Add helper functions to get and=
 set checkreqprot)
Merging smack/next (322dd63c7f98 Smack: Use the netlabel cache)
Merging tomoyo/master (5384d92e4e02 tomoyo: Loosen pathname/domainname vali=
dation.)
Merging tpmdd/next (a9922287b359 tpm: use %*ph to print small buffer)
Merging watchdog/master (18445bf405cb Merge tag 'spi-fix-v5.9-rc1' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging iommu/next (c59bc95e9144 Merge branches 'iommu/fixes', 'arm/allwinn=
er', 'arm/mediatek', 'arm/renesas', 'arm/tegra', 'arm/qcom', 'x86/amd', 'x8=
6/vt-d' and 'core' into next)
Merging vfio/next (ccd59dce1a21 vfio/type1: Refactor vfio_iommu_type1_ioctl=
())
Merging audit/next (c07203516439 audit: Remove redundant null check)
Merging devicetree/for-next (73f76a41c4ed dt-bindings: example: Extend base=
d on practice)
Merging mailbox/mailbox-for-next (884996986347 mailbox: mediatek: cmdq: cle=
ar task in channel before shutdown)
Merging spi/for-next (de0a4481dcf2 Merge remote-tracking branch 'spi/for-5.=
10' into spi-next)
Merging tip/auto-latest (e524f5c7cbd0 Merge branch 'core/build')
Applying: seqlock: Introduce PREEMPT_RT support
Merging clockevents/timers/drivers/next (9fba22584e54 clocksource: Ingenic:=
 Add support for the Ingenic X1000 OST.)
Merging edac/edac-for-next (0143ba97f785 Merge branch 'edac-misc' into edac=
-for-next)
Merging irqchip/irq/irqchip-next (20eb7e2df03d Merge branch 'irq/ipi-as-irq=
' into irq/irqchip-next)
Merging ftrace/for-next (38ce2a9e33db tracing: Add trace_array_init_printk(=
) to initialize instance trace_printk() buffers)
Merging rcu/rcu/next (7323bc24b9c5 rcu: Prevent RCU_LOCKDEP_WARN() from swa=
llowing the condition)
$ git reset --hard HEAD^
Merging next-20200916 version of rcu
Merging kvm/linux-next (e792415c5d3e KVM: MIPS/VZ: Fix build error caused b=
y 'kvm_run' cleanup)
Merging kvm-arm/next (81867b75dbfd Merge branch 'kvm-arm64/nvhe-hyp-context=
' into kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (35dfb43c243b KVM: PPC: Book3S HV: Set LPCR[HD=
ICE] before writing HDEC)
Merging kvms390/next (23a60f834406 s390/kvm: diagnose 0x318 sync and reset)
Merging xen-tip/linux-next (9e2369c06c8a xen: add helpers to allocate unpop=
ulated memory)
Merging percpu/for-next (fbb145bcfb5e Merge branch 'for-5.9-fixes' into for=
-next)
Merging workqueues/for-next (10cdb1575954 workqueue: use BUILD_BUG_ON() for=
 compile time test instead of WARN_ON())
Merging drivers-x86/for-next (9123e3a74ec7 Linux 5.9-rc1)
Merging chrome-platform/for-next (dd92f7dfe1ba platform/chrome: Kconfig: Re=
move the transitional MFD_CROS_EC config)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (03eb2ca44a95 leds: tlc591xx: Simplify with dev_err_p=
robe())
Merging ipmi/for-next (42d8a346c5c0 ipmi: add retry in try_get_dev_id())
Merging driver-core/driver-core-next (9ef8638bd8c7 Merge 5.9-rc5 into drive=
r-core-next)
Merging usb/usb-next (f5f875b5618e usb: phy: phy-ab8500-usb: fix spello of =
"function")
Merging usb-gadget/next (f5e46aa4a124 usb: dwc3: gadget: when the started l=
ist is empty stop the active xfer)
Merging usb-serial/usb-next (9123e3a74ec7 Linux 5.9-rc1)
Merging usb-chipidea-next/ci-for-usb-next (71ac680e6339 usb: chipidea: ci_h=
drc_imx: restore pinctrl)
Merging phy-next/next (885c4f4d6cf4 phy: intel: Add Keem Bay eMMC PHY suppo=
rt)
Merging tty/tty-next (71a174b39f10 pty: do tty_flip_buffer_push without por=
t->lock in pty_write)
CONFLICT (content): Merge conflict in drivers/tty/serial/8250/8250_pci.c
Merging char-misc/char-misc-next (78ec034966b5 misc: hisi_hikey_usb: fix re=
turn of uninitialized ret status variable)
Merging extcon/extcon-next (e12334b989bc extcon: axp288: Use module_platfor=
m_driver to simplify the code)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging soundwire/next (32d2a8935bf8 soundwire: cadence: add parity error i=
njection through debugfs)
Merging thunderbolt/next (810278da901c thunderbolt: Capitalize comment on t=
op of QUIRK_FORCE_POWER_LINK_CONTROLLER)
Merging staging/staging-next (4aca9e65c61d staging: rtl8723bs: remove 5 GHz=
 code)
Merging mux/for-next (05f19f7f8944 mux: adgs1408: Add mod_devicetable.h and=
 remove of_match_ptr)
Merging icc/icc-next (b1a367bb1cbb interconnect: qcom: osm-l3: Mark more st=
ructures const)
Merging dmaengine/next (e3a52158a682 dmaengine: Kconfig: Update description=
 for RCAR_DMAC config)
Merging cgroup/for-next (936f2a70f207 cgroup: add cpu.stat file to root cgr=
oup)
Merging scsi/for-next (9d9eaf460c1d Merge branch 'misc' into for-next)
CONFLICT (content): Merge conflict in drivers/scsi/aacraid/aachba.c
Merging scsi-mkp/for-next (ed5dd6a67d5e scsi: core: Only re-run queue in sc=
si_end_request() if device queue is busy)
Merging vhost/linux-next (8a7c3213db06 vdpa/mlx5: fix up endian-ness for mt=
u)
Merging rpmsg/for-next (62180d7eae2f Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (feeaefd378ca gpio: dwapb: Use resource managed GPIO-=
chip add data method)
Merging gpio-brgl/gpio/for-next (32fc5aa2df12 gpiolib: unexport devprop_gpi=
ochip_set_names())
Merging gpio-intel/for-next (9123e3a74ec7 Linux 5.9-rc1)
Merging pinctrl/for-next (ebc2599144b6 pinctrl: mcp23s08: Improve error mes=
saging in ->probe())
Merging pinctrl-intel/for-next (a0bf06dc51db pinctrl: cherryview: Preserve =
CHV_PADCTRL1_INVRXTX_TXDATA flag on GPIOs)
Merging pinctrl-samsung/for-next (9123e3a74ec7 Linux 5.9-rc1)
Merging pwm/for-next (6ced5ff0be8e pwm: bcm-iproc: handle clk_get_rate() re=
turn)
Merging userns/for-next (7fce69dff8db Implement kernel_execve)
Merging ktest/for-next (ff131efff141 ktest.pl: Fix spelling mistake "Cant" =
-> "Can't")
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (f69237e1e954 selftests: more general make nesting s=
upport)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (59fc1e476962 Merge branch 'for-5.10/flive-pa=
tching' into for-next)
Merging coresight/next (6028dafde949 coresight: etm4x: Fix number of resour=
ces check for ETM 4.3 and above)
Merging rtc/rtc-next (35425bafc772 rtc: pcf2127: fix a bug when not specify=
 interrupts property)
Merging nvdimm/libnvdimm-for-next (03b68d5d7d4b Merge branch 'for-5.9/copy_=
mc' into libnvdimm-for-next)
Merging at24/at24/for-next (99363d1c26c8 eeprom: at24: Tidy at24_read())
Merging ntb/ntb-next (b8e2c8bbdf77 NTB: Use struct_size() helper in devm_kz=
alloc())
Merging seccomp/for-next/seccomp (a23042882ff2 selftests/seccomp: Use bitwi=
se instead of arithmetic operator for flags)
Merging kspp/for-next/kspp (55dde35fdb7f overflow: Add __must_check attribu=
te to check_*() helpers)
Merging gnss/gnss-next (48778464bb7d Linux 5.8-rc2)
Merging fsi/next (4a851d714ead fsi: aspeed: Support CFAM reset GPIO)
Merging slimbus/for-next (9123e3a74ec7 Linux 5.9-rc1)
Merging nvmem/for-next (02200a863b9a nvmem: core: fix missing of_node_put()=
 in of_nvmem_device_get())
Merging xarray/xarray (27586ca786a7 XArray: Handle retry entries within xas=
_find_marked)
Merging hyperv/hyperv-next (49971e6bad2d drivers: hv: remove cast from hype=
rv_die_event)
Merging auxdisplay/auxdisplay (46d4a403a04c auxdisplay: Replace HTTP links =
with HTTPS ones)
Merging kgdb/kgdb/for-next (e16c33e29079 kernel/debug: Fix spelling mistake=
 in debug_core.c)
Merging pidfd/for-next (f2e9aec45e9e Merge tag 'kernel-clone-v5.9' into for=
-next)
Merging hmm/hmm (9123e3a74ec7 Linux 5.9-rc1)
Merging fpga/for-next (41b9b36fe986 fpga: dfl: n3000-nios: Make m10_n3000_i=
nfo static)
Merging kunit/test (9123e3a74ec7 Linux 5.9-rc1)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (11399346ac39 mtd: Replace zero-length array with flex=
ible-array)
Merging kunit-next/kunit (9123e3a74ec7 Linux 5.9-rc1)
Merging trivial/for-next (2a9b29b28983 xtensa: fix Kconfig typo)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (ebbc5eba7beb bus: mhi: Remove include of rwlock_types=
.h)
Merging notifications/notifications-pipe-core (841a0dfa5113 watch_queue: sa=
mple: Display mount tree change notifications)
Merging memblock/for-next (762d4d1a174c arch/ia64: Restore arch-specific pg=
d_offset_k implementation)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging akpm-current/current (c7b47e308648 x86: add failure injection to ge=
t/put/clear_user)
CONFLICT (content): Merge conflict in mm/filemap.c
CONFLICT (content): Merge conflict in arch/powerpc/platforms/pseries/hotplu=
g-memory.c
CONFLICT (content): Merge conflict in arch/powerpc/mm/kasan/kasan_init_32.c
Applying: merge fix up for "mm/memremap_pages: convert to 'struct range'"
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (13007eccd98f mm: secretmem: use PMD-size pages to amor=
tize direct map fragmentation)

--Sig_/eF52xl6HW+dF.6_yyRlsKCw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9jOREACgkQAVBC80lX
0GxUUAf6A4RVC81xQ+TGSnMKjauFTpvvNaTHIpGFBmfW5B21CYKdGznw4qQU6Irl
QzmtVkgvXCI8f7N3b9nDK2AlrlruUjEGTaBEgvJYHcGMVyIuVn7NHVxObQbTJR3N
VNm+LPm0Yjx9EZYfYcZcdo/EmUCfOYdb96SRkiRrq6/zV641tju53ozF+W8oIxcn
xbsda6DvOkv1yPwZjrHe1Ioe7QO8+mAdBWlEPGViIYMaFqA4Tv8qcyPyTIWsgCtk
DmBQxjpAPzHfnzzvcFCUivLpU0m56lHFc69LZi16pqu1aobwayE5h94Eb0g1UfzJ
cnJeVV+G0YrtbynaM5+RZQQ02nBJNQ==
=hjvB
-----END PGP SIGNATURE-----

--Sig_/eF52xl6HW+dF.6_yyRlsKCw--
