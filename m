Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6C603553E8
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 14:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344008AbhDFMbb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Apr 2021 08:31:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344014AbhDFMbZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Apr 2021 08:31:25 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31D54C06174A;
        Tue,  6 Apr 2021 05:31:15 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FF6ML2xHYz9sRR;
        Tue,  6 Apr 2021 22:31:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617712270;
        bh=IG7ui9kIPYftAnnksdLXjrg7c4t5t1ET5epily3YTeo=;
        h=Date:From:To:Cc:Subject:From;
        b=SYvMSCFBfLN06q8s/DAdu4QwDmXofUa3PnxKc9zY/831EC4czFCGIgcE5PwfA7WbK
         SUXS1g7QCTEU3h68vv3X51Jvm2r+EP+KyuuOH9puUTk8sJv97e07kTOGc+B+TVy1hw
         3bsFIsUWHzKA707sxmfL4FQzeEXtzdCYYlleC1Nre2oEqZS01QxjzIb64nDUd9yng8
         IZTJfUbpSu+a2TKIiPD/t27vKB4BN0sjEMzz402TBtUllrDIaSum785K3k4ifbLHY0
         FpCEIOV/wADQdgpk9KrA5zrOsViM+9KYgUhJDWsFnvPvzMvaiIDr3S9tOyGc/GbQYw
         1nvmSomndL1Fg==
Date:   Tue, 6 Apr 2021 22:31:09 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 6
Message-ID: <20210406223109.50ebe35a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ng+v6vdAFW_pS4APIjpWGrv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ng+v6vdAFW_pS4APIjpWGrv
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210401:

The net-next tree gained a conflict against the net tree.

The imx-drm tree gained a conflict against the drm tree.

The driver-core tree gained a conflict against the devicetree tree.

The tty tree gained a conflict against the net-next tree.

The scsi-mkp tree gained a conflict against the scsi-fixes, scsi trees.

The akpm-current tree gained a conflict against Linus' tree.

Non-merge commits (relative to Linus' tree): 9178
 8704 files changed, 495004 insertions(+), 221362 deletions(-)

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

I am currently merging 335 trees (counting Linus' and 87 trees of bug
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
Merging origin/master (0a50438c8436 Merge branch 'for-5.12-fixes' of git://=
git.kernel.org/pub/scm/linux/kernel/git/tj/wq)
Merging fixes/fixes (e71ba9452f0b Linux 5.11-rc2)
Merging kbuild-current/fixes (bcbcf50f5218 kbuild: fix ld-version.sh to not=
 be affected by locale)
Merging arc-current/for-curr (83520d62cc5a ARC: treewide: avoid the pointer=
 addition with NULL pointer)
Merging arm-current/fixes (30e3b4f256b4 ARM: footbridge: fix PCI interrupt =
mapping)
Merging arm64-fixes/for-next/fixes (185f2e5f51c2 arm64: fix inline asm in l=
oad_unaligned_zeropad())
Merging arm-soc-fixes/arm/fixes (6bf18bbe1999 Merge tag 'mvebu-fixes-5.12-1=
' of git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into arm/=
fixes)
Merging drivers-memory-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging m68k-current/for-linus (a65a802aadba m68k: Fix virt_addr_valid() W=
=3D1 compiler warnings)
Merging powerpc-fixes/fixes (791f9e36599d powerpc/vdso: Make sure vdso_wrap=
per.o is rebuilt everytime vdso.so is rebuilt)
Merging s390-fixes/fixes (85012e764d3a s390/irq: fix reading of ext_params2=
 field from lowcore)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (08c27f3322fe batman-adv: initialize "struct batadv_tvlv=
_tt_vlan_data"->reserved field)
Merging bpf/master (a14d273ba159 net: macb: restore cmp registers on resume=
 path)
Merging ipsec/master (ef19e111337f xfrm/compat: Cleanup WARN()s that can be=
 user-triggered)
Merging netfilter/master (fbea31808ca1 netfilter: conntrack: do not print i=
cmpv6 as unknown via /proc)
Merging ipvs/master (fbea31808ca1 netfilter: conntrack: do not print icmpv6=
 as unknown via /proc)
Merging wireless-drivers/master (bd83a2fc05ed brcmfmac: p2p: Fix recently i=
ntroduced deadlock issue)
Merging mac80211/master (6f235a69e594 ch_ktls: fix enum-conversion warning)
Merging rdma-fixes/for-rc (7582207b1059 RDMA/rtrs-clt: Close rtrs client co=
nn before destroying rtrs clt session files)
Merging sound-current/for-linus (417eadfdd9e2 ALSA: hda/realtek: fix mute/m=
icmute LEDs for HP 640 G8)
Merging sound-asoc-fixes/for-linus (faea5b4c7c4f Merge remote-tracking bran=
ch 'asoc/for-5.12' into asoc-linus)
Merging regmap-fixes/for-linus (f5148babb3cd Merge remote-tracking branch '=
regmap/for-5.12' into regmap-linus)
Merging regulator-fixes/for-linus (6068cc31dedd Merge remote-tracking branc=
h 'regulator/for-5.12' into regulator-linus)
Merging spi-fixes/for-linus (aee1cf9f09fa Merge remote-tracking branch 'spi=
/for-5.12' into spi-linus)
Merging pci-current/for-linus (cf673bd0cc97 PCI: switchtec: Fix Spectre v1 =
vulnerability)
Merging driver-core.current/driver-core-linus (eed6e41813de driver core: Fi=
x locking bug in deferred_probe_timeout_work_func())
Merging tty.current/tty-linus (e49d033bddf5 Linux 5.12-rc6)
Merging usb.current/usb-linus (363eaa3a450a usbip: synchronize event handle=
r with sysfs code paths)
Merging usb-gadget-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging usb-serial-fixes/usb-linus (0d02ec6b3136 Linux 5.12-rc4)
Merging usb-chipidea-fixes/for-usb-fixes (cf97d7af2468 usb: cdnsp: Fixes is=
sue with dequeuing requests after disabling endpoint)
Merging phy/fixes (da848f9a0e13 phy: qcom-qmp: add hbr3_hbr2 voltage and pr=
emphasis swing table)
Merging staging.current/staging-linus (e49d033bddf5 Linux 5.12-rc6)
Merging char-misc.current/char-misc-linus (e49d033bddf5 Linux 5.12-rc6)
Merging soundwire-fixes/fixes (fde5d7f27108 soundwire: bus: Fix device foun=
d flag correctly)
Merging thunderbolt-fixes/fixes (08fe7ae18570 thunderbolt: Fix off by one i=
n tb_port_find_retimer())
Merging input-current/for-linus (56cfe6f820a6 Input: elants_i2c - drop zero=
-checking of ABS_MT_TOUCH_MAJOR resolution)
Merging crypto-current/master (0de9dc80625b hwrng: timeriomem - Use device-=
managed registration API)
Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer)
Merging vfio-fixes/for-linus (e0146a108ce4 vfio/nvlink: Add missing SPAPR_T=
CE_IOMMU depends)
Merging kselftest-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging dmaengine-fixes/fixes (868833fbffbe dmaengine: xilinx: dpdma: Fix r=
ace condition in done IRQ)
Merging backlight-fixes/for-backlight-fixes (a38fd8748464 Linux 5.12-rc2)
Merging mtd-fixes/mtd/fixes (2fb164f0ce95 mtd: rawnand: mtk: Fix WAITRDY br=
eak condition and timeout)
Merging mfd-fixes/for-mfd-fixes (a61f4661fba4 mfd: intel_quark_i2c_gpio: Re=
vert "Constify static struct resources")
Merging v4l-dvb-fixes/fixes (0e37b4fa67f5 media: coda: fix macroblocks coun=
t control usage)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (9ae31e2ab293 MIPS: kernel: setup.c: fix comp=
ilation error)
Merging at91-fixes/at91-fixes (2c69c8a1736e ARM: dts: at91: sam9x60: fix mu=
x-mask to match product's datasheet)
Merging omap-fixes/fixes (fc85dc42a384 ARM: OMAP2+: Fix uninitialized sr_in=
st)
Merging kvm-fixes/master (55626ca9c690 selftests: kvm: Check that TSC page =
value is small after KVM_SET_CLOCK(0))
Merging kvms390-fixes/master (735931f9a51a MAINTAINERS: add uv.c also to KV=
M/s390)
Merging hwmon-fixes/hwmon (a38fd8748464 Linux 5.12-rc2)
Merging nvdimm-fixes/libnvdimm-fixes (7018c897c2f2 libnvdimm/dimm: Avoid ra=
ce between probe and available_slots_show())
Merging btrfs-fixes/next-fixes (3b7ec4d1b5cb Merge branch 'misc-5.12' into =
next-fixes)
Merging vfs-fixes/fixes (7f6c411c9b50 hostfs: fix memory handling in follow=
_link())
Merging dma-mapping-fixes/for-linus (d17405d52bac dma-mapping: benchmark: f=
ix kernel crash when dma_map_single fails)
Merging i3c-fixes/i3c/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging drivers-x86-fixes/fixes (d1635448f110 platform/x86: intel_pmc_core:=
 Ignore GBE LTR on Tiger Lake platforms)
Merging samsung-krzk-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging pinctrl-samsung-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging devicetree-fixes/dt/linus (8242ff9ea9f0 dt-bindings: display: media=
tek,dpi: Convert to use graph schema)
Merging scsi-fixes/fixes (4b42d557a8ad scsi: ufs: core: Fix wrong Task Tag =
used in task management request UPIUs)
Merging drm-fixes/drm-fixes (6fdb8e5aba6a Merge tag 'imx-drm-fixes-2021-04-=
01' of git://git.pengutronix.de/git/pza/linux into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (e49d033bddf5 Linux 5.12-rc6)
Merging mmc-fixes/fixes (a5e13c6df0e4 Linux 5.12-rc5)
Merging rtc-fixes/rtc-fixes (bd33335aa93d rtc: cmos: Disable irq around dir=
ect invocation of cmos_interrupt())
Merging gnss-fixes/gnss-linus (a38fd8748464 Linux 5.12-rc2)
Merging hyperv-fixes/hyperv-fixes (37df9f3fedb6 video: hyperv_fb: Fix a dou=
ble free in hvfb_probe)
Merging soc-fsl-fixes/fix (2663b3388551 soc: fsl: dpio: Get the cpumask thr=
ough cpumask_of(cpu))
Merging risc-v-fixes/fixes (1adbc2941eee riscv: Make NUMA depend on MMU)
Merging pidfd-fixes/fixes (03ba0fe4d09f file: simplify logic in __close_ran=
ge())
Merging fpga-fixes/fixes (2e8496f31d0b firmware: stratix10-svc: reset COMMA=
ND_RECONFIG_FLAG_PARTIAL to 0)
Merging spdx/spdx-linus (e49d033bddf5 Linux 5.12-rc6)
Merging gpio-brgl-fixes/gpio/for-current (23cf00ddd2e1 gpio: sysfs: Obey va=
lid_mask)
Merging gpio-intel-fixes/fixes (b41ba2ec54a7 gpiolib: Read "gpio-line-names=
" from a firmware node)
Merging pinctrl-intel-fixes/fixes (39c1f1bd8adf pinctrl: intel: check REVID=
 register value for device presence)
Merging erofs-fixes/fixes (9f377622a484 erofs: fix bio->bi_max_vecs behavio=
r change)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (7fd53f41f771 kunit: tool: Disable PAGE_POI=
SONING under --alltests)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (17cbe03872be mm/memblock: Fix typo in comment=
 of memblock_phys_alloc_try_nid())
Merging cel-fixes/for-rc (e49d033bddf5 Linux 5.12-rc6)
Merging drm-misc-fixes/for-linux-next-fixes (014305d00198 drivers: gpu: drm=
: xen_drm_front_drm_info is declared twice)
Merging kspp-gustavo/for-next/kspp (36f9ff9e03de lib: Fix fall-through warn=
ings for Clang)
Merging kbuild/for-next (3dcf76cc8745 Merge remote-tracking branch 'origin/=
kconfig' into for-next)
Merging compiler-attributes/compiler-attributes (19c329f68089 Linux 5.11-rc=
4)
Merging dma-mapping/for-next (a7f3d3d3600c dma-mapping: add unlikely hint t=
o error path in dma_mapping_error)
Merging asm-generic/master (38489db09b10 Merge branch 'asm-generic-fixes' i=
nto asm-generic)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (0ae6d1f52670 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (a4fa7f234576 Merge branches 'for-next/misc', '=
for-next/kselftest', 'for-next/xntable', 'for-next/vdso', 'for-next/fiq', '=
for-next/epan' and 'for-next/kasan-vmalloc' into for-next/core)
CONFLICT (content): Merge conflict in arch/arm64/include/asm/cpucaps.h
Merging arm-perf/for-next/perf (2c2e21e78a94 arm64: perf: Remove redundant =
initialization in perf_event.c)
Merging arm-soc/for-next (4ddda2b8d5bb soc: document merges)
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (31d53685392b Merge branch 'v5.13/dt64' into tmp/a=
ml-rebuild)
Merging aspeed/for-next (697dabd5d370 Merge branches 'soc-for-v5.12' and 'd=
t-for-v5.12' into for-next)
Merging at91/at91-next (77a0060811e7 Merge branch 'at91-dt' into at91-next)
Merging drivers-memory/for-next (8568dec31b2e Merge branch 'mem-ctrl-next' =
into for-next)
Merging imx-mxs/for-next (1f0f76f795d5 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (9d2e21ed98a2 Merge branch 'for_5.12/drivers-soc' int=
o next)
Merging mediatek/for-next (5d6bc14b2d2b Merge branch 'v5.12-next/soc' into =
for-next)
Merging mvebu/for-next (2b7e67d36d10 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (44e97f6fb29b Merge branch 'fixes' into for-next)
Merging qcom/for-next (076a89539124 Merge branches 'arm64-defconfig-for-5.1=
3', 'arm64-for-5.13', 'drivers-for-5.13' and 'dts-for-5.13' into for-next)
Merging raspberrypi/for-next (fbdcf1d20126 ARM: dts: bcm2711: Add the CEC i=
nterrupt controller)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/bcm2711.dtsi
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (e9903a1559e0 Merge branch 'renesas-arm-dt-for-v5.13' =
into renesas-next)
Merging reset/reset/next (d4e4dffec50b reset: oxnas: replace file name with=
 short description)
Merging rockchip/for-next (3b6c3c12b77c Merge branch 'v5.13-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (d3971413327e Merge branch 'next/soc' into fo=
r-next)
Merging scmi/for-linux-next (4c2443962313 Merge tag 'scmi-updates-5.13' of =
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-l=
inux-next)
Merging stm32/stm32-next (6ed9269265e1 ARM: dts: stm32: Add PTP clock to Et=
hernet controller)
Merging sunxi/sunxi/for-next (9fa021aa01fd Merge tags 'sunxi-dt-for-5.13-1'=
 and 'sunxi-fixes-for-5.12' into sunxi/for-next)
Merging tegra/for-next (93b9ea9ca307 Merge branch for-5.13/arm64/dt into fo=
r-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (112e5934ff3a arm64: dts: ti: k3-am64-main: Fi=
x ospi compatible)
Merging clk/clk-next (4b5c93f31107 Merge branch 'clk-allwinner' into clk-ne=
xt)
Merging clk-imx/for-next (054ef44ea3ef clk: imx: Reference preceded by free)
Merging clk-renesas/renesas-clk (f2fb4fe62390 clk: renesas: Zero init clk_i=
nit_data)
Merging clk-samsung/for-next (44a9e78f9242 clk: samsung: Prevent potential =
endless loop in the PLL ops)
Merging csky/linux-next (74cdb2664477 csky: Fixup typos)
Merging h8300/h8300-next (6e5e55227c95 Merge tag 'v5.11' into h8300-next)
Merging m68k/for-next (152ec0d0d0e1 m68k: defconfig: Update defconfigs for =
v5.12-rc1)
Merging m68knommu/for-next (9116e156f714 m68k: fix flatmem memory model set=
up)
Merging microblaze/next (bbcee72c2f7a microblaze: Fix a typo)
Merging mips/mips-next (f681c11bae9a mips/sgi-ip27: Delete obsolete TODO fi=
le)
Merging nds32/next (40e0dd851e7b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (1683f7de65db soc: litex: Remove duplicated heade=
r file inclusion)
Merging parisc-hd/for-next (13eaf4762c9f parisc: Remove duplicate struct ta=
sk_struct declaration)
Merging powerpc/next (69931cc387cc powerpc/powernv: Remove unneeded variabl=
e: "rc")
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (e95f287deed2 soc: fsl: handle RCPM errata A-008646 on=
 SoC LS1021A)
Merging risc-v/for-next (7d0bc44bd0ea kbuild: buildtar: add riscv support)
CONFLICT (content): Merge conflict in arch/riscv/mm/kasan_init.c
Merging s390/for-next (f9e179f38466 Merge branch 'features' into for-next)
Merging sh/for-next (2882b7626f49 sh: kernel: traps: remove unused variable)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (ddad5187fc2a um: irq.h: include <asm-generic/irq.h>)
Merging xtensa/xtensa-for-next (6a8eb99e130f xtensa: ISS: add GDBIO impleme=
ntation to semihosting interface)
Merging pidfd/for-next (8fac44cbbaa2 Merge branch 'fs/idmapped_mounts/helpe=
rs' into for-next)
Merging fscrypt/master (a14d0b676491 fscrypt: allow deleting files with uns=
upported encryption policy)
Merging fscache/fscache-next (d2ebca8ed45e afs: Use the fscache_write_begin=
() helper)
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (0b03de74583e Merge branch 'for-next-next-v5.12-2021=
0329' into for-next-20210329)
Merging ceph/master (558b4510f622 ceph: defer flushing the capsnap if the F=
b is used)
Merging cifs/for-next (305f2e0d3486 fs: cifs: Remove unnecessary struct dec=
laration)
Merging cifsd/cifsd-for-next (bc7f2fa87b28 Merge pull request #36 from namj=
aejeon/cifsd-for-next)
Merging configfs/for-next (14fbbc829772 configfs: fix a use-after-free in _=
_configfs_open_file)
Merging ecryptfs/next (902af369942f ecryptfs: use DEFINE_MUTEX() for mutex =
lock)
Merging erofs/dev (b0b677fd35ce erofs: enable big pcluster feature)
Merging exfat/dev (f9b23f1f6ca0 exfat: speed up iterate/lookup by fixing st=
art point of traversing cluster chain)
Merging ext3/for_next (652a066ee959 Pull kmap_local ext2 conversion from Ir=
a Weiny.)
Merging ext4/dev (64395d950bc4 ext4: initialize ret to suppress smatch warn=
ing)
Merging f2fs/dev (41c7659c2e0c f2fs: fix to avoid GC/mmap race with f2fs_tr=
uncate())
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (0d02ec6b3136 Linux 5.12-rc4)
Merging jfs/jfs-next (b462cecfa323 fs: Fix typo issue)
Merging nfs/linux-next (e49d033bddf5 Linux 5.12-rc6)
Merging nfs-anna/linux-next (4f8be1f53bf6 nfs: we don't support removing sy=
stem.nfs4_acl)
Merging nfsd/nfsd-next (c3213d260a23 SUNRPC: Fix oops in the rpc_xdr_buf ev=
ent class)
Merging cel/for-next (e739b12042b6 NFSv4.2: fix copy stateid copying for th=
e async copy)
Merging orangefs/for-next (c1048828c3db orangefs: add splice file operation=
s)
Merging overlayfs/overlayfs-next (d46b7cd68336 ovl: plumb through flush met=
hod)
Merging ubifs/next (42119dbe571e ubifs: Fix error return code in alloc_wbuf=
s())
Merging v9fs/9p-next (f8b139e2f241 fs: 9p: fix v9fs_file_open writeback fid=
 error check)
Merging xfs/for-next (25dfa65f8149 xfs: fix xfs_trans slab cache name)
Merging zonefs/for-next (6980d29ce4da zonefs: fix to update .i_wr_refcnt co=
rrectly in zonefs_open_zone())
Merging iomap/iomap-for-next (ad89b66cbad1 iomap: improve the warnings from=
 iomap_swapfile_activate)
Merging djw-vfs/vfs-for-next (9b8523423b23 vfs: move __sb_{start,end}_write=
* to fs.h)
Merging file-locks/locks-next (b8da9b10e26c fs/locks: print full locks info=
rmation)
Merging vfs/for-next (f85ebc25fa88 Merge branch 'work.misc' into for-next)
CONFLICT (content): Merge conflict in fs/cifs/file.c
Merging printk/for-next (e19c1133f306 Merge branch 'printk-rework' into for=
-next)
Merging pci/next (3a376659a7c1 Merge branch 'remotes/lorenzo/pci/misc')
Merging pstore/for-next/pstore (9d843e8fafc7 pstore: Add mem_type property =
DT parsing support)
Merging hid/for-next (16546ac007c3 Merge branch 'for-5.13/surface-system-ag=
gregator-intergration' into for-next)
Merging i2c/i2c/for-next (d98ce468bd98 Merge branch 'i2c/for-5.13' into i2c=
/for-next)
Merging i3c/i3c/next (e43d5c7c3c34 dt-bindings: i3c: Fix silvaco,i3c-master=
-v1 compatible string)
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (02bb6badc9fb hwmon: (mlxreg-fan) Add supp=
ort for fan drawers capability and present registers)
Merging jc_docs/docs-next (a4f413348f26 Documentation: filesystesm api-summ=
ary: add namespace.c)
Merging v4l-dvb/master (97b34809ec24 media: staging: atomisp: reduce kernel=
 stack usage)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging v4l-dvb-next/master (1e28eed17697 Linux 5.12-rc3)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (85f34ae66398 Merge branches 'acpi-scan' and 'acpi-pr=
ocessor-fixes' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (c3135d28a1e0 cpufreq: dt: dev_p=
m_opp_of_cpumask_add_table() may return -EPROBE_DEFER)
Merging cpupower/cpupower (a38fd8748464 Linux 5.12-rc2)
Merging devfreq/devfreq-next (3dee37a4b6ae PM / devfreq: imx8m-ddrc: Remove=
 unneeded of_match_ptr())
Merging opp/opp/linux-next (a8bb0e872bfb memory: samsung: exynos5422-dmc: C=
onvert to use resource-managed OPP API)
Merging thermal/thermal/linux-next (76e524fa8791 dt-bindings: thermal: tsen=
s: Document ipq8064 bindings)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (2fd8db2dd05d fs: dlm: fix missing unlock on error in acce=
pt_from_sock())
Merging swiotlb/linux-next (fcf044891c84 ARM: Qualify enabling of swiotlb_i=
nit())
Merging rdma/for-next (704d68f5f2df RDMA/hns: Reorganize doorbell update in=
terfaces for all queues)
Merging net-next/master (cc0626c2aaed net: smsc911x: skip acpi_device_id ta=
ble when !CONFIG_ACPI)
CONFLICT (content): Merge conflict in include/linux/bpf.h
CONFLICT (content): Merge conflict in drivers/net/ethernet/mellanox/mlx5/co=
re/en_main.c
CONFLICT (content): Merge conflict in MAINTAINERS
Merging bpf-next/for-next (1e1032b0c4af libbpf: Fix KERNEL_VERSION macro)
Merging ipsec-next/master (6ad2dd6c14d3 ipv6: fix clang Wformat warning)
Merging mlx5-next/mlx5-next (e71b75f73763 net/mlx5: Implement sriov_get_vf_=
total_msix/count() callbacks)
Merging netfilter-next/master (db3685b4046f net: remove obsolete members fr=
om struct net)
Merging ipvs-next/master (19c28b1374fb netfilter: add helper function to se=
t up the nfnetlink header and use it)
Merging wireless-drivers-next/master (13ce240a932f rtw88: 8822c: support FW=
 crash dump when FW crash)
Merging bluetooth/master (27e554a4fcd8 Bluetooth: btusb: Enable quirk boole=
an flag for Mediatek Chip.)
Merging mac80211-next/master (4b837ad53be2 Merge branch 'netfilter-flowtabl=
e')
Merging gfs2/for-next (bea906ee1624 gfs2: Silence possible null pointer der=
eference warning)
Merging mtd/mtd/next (28f0be44b263 include: linux: mtd: Remove duplicate in=
clude of nand.h)
Merging nand/nand/next (bd9c9fe2ad04 mtd: rawnand: bbt: Skip bad blocks whe=
n searching for the BBT in NAND)
Merging spi-nor/spi-nor/next (b206b82d1726 mtd: spi-nor: winbond: add OTP s=
upport to w25q32fw/jw)
Merging crypto/master (059c5342812c crypto: hisilicon/sec - Fixes AES algor=
ithm mode parameter problem)
Merging drm/drm-next (fb457e02f0ec Merge tag 'exynos-drm-next-for-v5.13' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into drm-=
next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/omapdrm/dss/dsi.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/powerplay/hwmg=
r/smu7_hwmgr.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_dev=
ice.c
Applying: merge fix for "drm: Switch to %p4cc format modifier"
Merging drm-misc/for-linux-next (167b40021712 drm/vblank: Do not store a ne=
w vblank timestamp in drm_vblank_restore())
Merging amdgpu/drm-next (3c7245ee576a drm/ttm: switch back to static alloca=
tion limits for now)
CONFLICT (content): Merge conflict in drivers/gpu/drm/ttm/ttm_tt.c
Merging drm-intel/for-linux-next (2d667442dbe7 drm/i915/display/psr: Disabl=
e DC3CO when the PSR2 is used)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_runtime_pm=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dp=
_link_training.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_di=
splay.c
Merging drm-tegra/drm/tegra/for-next (7b6f846785f4 drm/tegra: Support secto=
r layout on Tegra194)
Merging drm-msm/msm-next (5ee223c630d0 drm/msm: Improved debugfs gem stats)
Merging imx-drm/imx-drm/next (74181df8c6db drm/imx: ipuv3-plane: Remove two=
 unnecessary export symbols)
CONFLICT (content): Merge conflict in drivers/gpu/drm/imx/ipuv3-plane.c
Merging etnaviv/etnaviv/next (7d614ab2f205 drm/etnaviv: fix NULL check befo=
re some freeing functions is not needed)
Merging regmap/for-next (2d2070490a13 Merge remote-tracking branch 'regmap/=
for-5.13' into regmap-next)
Merging sound/for-next (1678320e74d3 Merge branch 'topic/mute-led' into for=
-next)
Merging sound-asoc/for-next (af4315b894b9 Merge remote-tracking branch 'aso=
c/for-5.13' into asoc-next)
Merging modules/modules-next (33121347fb1c module: treat exit sections the =
same as init sections when !CONFIG_MODULE_UNLOAD)
Merging input/next (73e7f1732e80 Input: imx_keypad - convert to a DT-only d=
river)
Merging block/for-next (6f63bc69677b Merge branch 'for-5.13/io_uring' into =
for-next)
Merging device-mapper/for-next (db7b93e38106 dm integrity: add the "reset_r=
ecalculate" feature flag)
Merging pcmcia/pcmcia-next (e9d503fef7da pcmcia: rsrc_nonstatic: Fix call-b=
ack function as reference formatting)
Merging mmc/next (2970134b9278 mmc: sdhci-pci: Fix initialization of some S=
D cards for Intel BYT-based controllers)
Merging mfd/for-mfd-next (43e72121b5f6 mfd: intel_quark_i2c_gpio: Don't pla=
y dirty trick with const)
Merging backlight/for-backlight-next (225be60f3853 dt-bindings: backlight: =
qcom-wled: Add PMI8994 compatible)
Merging battery/for-next (04722cec1436 power: supply: bq25980: Move props f=
rom battery node)
Merging regulator/for-next (dc6c17ce1886 Merge remote-tracking branch 'regu=
lator/for-5.13' into regulator-next)
Merging security/next-testing (215042ece980 Merge branch 'landlock_lsm' int=
o next-testing)
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
CONFLICT (content): Merge conflict in arch/arm64/include/asm/unistd.h
CONFLICT (content): Merge conflict in arch/arm/tools/syscall.tbl
CONFLICT (content): Merge conflict in arch/alpha/kernel/syscalls/syscall.tbl
Merging apparmor/apparmor-next (d108370c644b apparmor: fix error check)
Merging integrity/next-integrity (92063f3ca73a integrity: double check iint=
_cache was initialized)
Merging keys/keys-next (e377c31f788f integrity: Load mokx variables into th=
e blacklist keyring)
Merging safesetid/safesetid-next (03ca0ec13892 LSM: SafeSetID: Fix warnings=
 reported by test bot)
Merging selinux/next (1fb057dcde11 smack: differentiate between subjective =
and objective task credentials)
Merging smack/next (7ef4c19d245f smackfs: restrict bytes count in smackfs w=
rite functions)
Merging tomoyo/master (5dc33592e955 lockdep: Allow tuning tracing capacity =
constants.)
Merging tpmdd/next (8b12a62a4e3e Merge tag 'drm-fixes-2021-03-19' of git://=
anongit.freedesktop.org/drm/drm)
Merging watchdog/master (1e28eed17697 Linux 5.12-rc3)
Merging iommu/next (7851dfc68810 Merge branches 'iommu/fixes', 'unisoc', 'x=
86/vt-d' and 'core' into next)
Merging audit/next (b75d8f38bcc9 audit: drop /proc/PID/loginuid documentati=
on Format field)
Merging devicetree/for-next (8d3a1cb32124 dt-bindings: media: venus: Add sm=
8250 dt schema)
Merging mailbox/mailbox-for-next (6b50df2b8c20 mailbox: arm_mhuv2: Skip cal=
ling kfree() with invalid pointer)
Merging spi/for-next (4438fb942495 Merge remote-tracking branch 'spi/for-5.=
13' into spi-next)
Merging tip/auto-latest (e571028ea527 Merge branch 'core/entry')
Applying: x86: fix up for "bpf: Use NOP_ATOMIC5 instead of emit_nops(&prog,=
 5) for BPF_TRAMP_F_CALL_ORIG"
Merging clockevents/timers/drivers/next (323397ef4d00 clocksource/drivers/d=
w_apb_timer_of: Add handling for potential memory leak)
Merging edac/edac-for-next (faf042d15093 Merge branch 'edac-amd64' into eda=
c-for-next)
Merging irqchip/irq/irqchip-next (5fbecd2389f4 irqchip/ingenic: Add support=
 for the JZ4760)
Merging ftrace/for-next (ceaaa12904df ftrace: Simplify the calculation of p=
age number for ftrace_page->records some more)
CONFLICT (content): Merge conflict in arch/x86/kernel/kprobes/ftrace.c
Merging rcu/rcu/next (69f68579fdce rcu: Improve tree.c comments and add cod=
e cleanups)
Merging kvm/next (657f1d86a38e Merge branch 'kvm-tdp-fix-rcu' into HEAD)
CONFLICT (content): Merge conflict in arch/x86/kvm/svm/nested.c
Merging kvm-arm/next (b317586b5d9e Merge branch 'kvm-arm64/nvhe-panic-info'=
 into kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (72476aaa4691 KVM: PPC: Book3S HV: Fix host ra=
dix SLB optimisation with hash guests)
Merging kvms390/next (c3171e94cc1c KVM: s390: VSIE: fix MVPG handling for p=
refixing and MSO)
Merging xen-tip/linux-next (a846738f8c37 xen-blkback: don't leak persistent=
 grants from xen_blkbk_map())
Merging percpu/for-next (df1c002198a8 Merge branch 'for-5.12' into for-next)
Merging workqueues/for-next (89e28ce60cb6 workqueue/watchdog: Make unbound =
workqueues aware of touch_softlockup_watchdog() 84;0;0c84;0;0c There are tw=
o workqueue-specific watchdog timestamps:)
Merging drivers-x86/for-next (36974daf5388 platform/x86: intel_pmc_core: Ig=
nore GBE LTR on Tiger Lake platforms)
CONFLICT (content): Merge conflict in drivers/platform/x86/thinkpad_acpi.c
Merging chrome-platform/for-next (c6e939c63c80 platform/chrome: cros_ec_typ=
ec: fix clang -Wformat warning)
Merging hsi/for-next (aa57e77b3d28 HSI: Fix PM usage counter unbalance in s=
si_hw_init)
Merging leds/for-next (d9dfac5419d0 leds: rt4505: Add support for Richtek R=
T4505 flash LED controller)
Merging ipmi/for-next (07cbd87b0416 ipmi_si: Join string literals back)
Merging driver-core/driver-core-next (6e11b376fd74 media: ipu3-cio2: Switch=
 to use SOFTWARE_NODE_REFERENCE())
CONFLICT (content): Merge conflict in drivers/of/property.c
Merging usb/usb-next (f70d436f0001 usb: typec: Declare the typec_class stat=
ic)
Merging usb-gadget/next (a38fd8748464 Linux 5.12-rc2)
Merging usb-serial/usb-next (5fec21e74bfc USB: serial: xr: claim both inter=
faces)
Merging usb-chipidea-next/for-usb-next (df4aed23d67d usb: cdnsp: remove red=
undant initialization of variable ret)
CONFLICT (content): Merge conflict in drivers/usb/typec/tipd/core.c
CONFLICT (content): Merge conflict in drivers/usb/dwc3/gadget.c
Merging tty/tty-next (158e800e0fde sc16is7xx: Defer probe if device read fa=
ils)
CONFLICT (content): Merge conflict in net/nfc/nci/uart.c
Merging char-misc/char-misc-next (177260a705a9 docs: ABI: Add sysfs documen=
tation interface of dw-xdata-pcie driver)
Merging extcon/extcon-next (cf947ad92675 extcon: qcom-spmi: Add support for=
 VBUS detection)
Merging phy-next/next (cbc336c09b6d phy: fix resource_size.cocci warnings)
CONFLICT (content): Merge conflict in drivers/phy/qualcomm/phy-qcom-qmp.c
Merging soundwire/next (14968dd36a50 soundwire: intel_init: test link->cdns)
Merging thunderbolt/next (2e7a5b3e2236 thunderbolt: Unlock on error path in=
 tb_domain_add())
Merging vfio/next (4d83de6da265 vfio/type1: Batch page pinning)
Merging staging/staging-next (001c6bb6b626 staging: bcm2835-pcm: Allow up t=
o 8 channels and 192kHz data rate)
CONFLICT (content): Merge conflict in drivers/iio/common/scmi_sensors/scmi_=
iio.c
Applying: iio: adc: merge fix for "spi: core: remove 'delay_usecs' field fr=
om spi_transfer"
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (27d19a8b4abb Merge branch 'icc-fixes' into icc-next)
Merging dmaengine/next (84b0aa2e0d91 dmaengine: dw-edma: Add pcim_iomap_tab=
le return check)
Merging cgroup/for-next (dd3f4e4972f1 cgroup: misc: mark dummy misc_cg_res_=
total_usage() static inline)
Merging scsi/for-next (bce99128eaf7 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (857a80bbd732 scsi: libsas: Clean up whitespace)
CONFLICT (content): Merge conflict in drivers/scsi/ufs/ufshcd.c
Merging vhost/linux-next (723c7003c1ab vdpa: introduce virtio pci driver)
Merging rpmsg/for-next (2c2564b9d64d Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (e1b7033ecdac Merge tag 'intel-gpio-v5.13-1=
' of gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel int=
o gpio/for-next)
Merging gpio-intel/for-next (058459043e71 gpio: ich: Switch to be dependent=
 on LPC_ICH)
Merging pinctrl/for-next (e331c184d3f1 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (5b613df3f499 pinctrl: intel: No need to dis=
able IRQs in the handler)
Merging pinctrl-renesas/renesas-pinctrl (61232cd6efca pinctrl: renesas: r8a=
7791: Add bias pinconf support)
Merging pinctrl-samsung/for-next (a38fd8748464 Linux 5.12-rc2)
Merging pwm/for-next (9666cec380d6 pwm: Drop function pwmchip_add_with_pola=
rity())
Merging userns/for-next (95ebabde382c capabilities: Don't allow writing amb=
iguous v3 file capabilities)
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (87f1c20e2eff Documentation: kselftest: fix path to =
test module files)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (c150bbbb1731 Merge branch 'for-5.13/signal' =
into for-next)
Merging coresight/next (1efbcec2ef8c coresight: cti: Reduce scope for the v=
ariable =E2=80=9Ccs_fwnode=E2=80=9D in cti_plat_create_connection())
Merging rtc/rtc-next (8d69f62fddf6 rtc: rx6110: add ACPI bindings to I2C)
Merging nvdimm/libnvdimm-for-next (30c10d32152d Merge branch 'for-5.12/cxl'=
 into libnvdimm-for-next)
Merging at24/at24/for-next (fe07bfda2fb9 Linux 5.12-rc1)
Merging ntb/ntb-next (5c8fe583cce5 Linux 5.11-rc1)
Merging seccomp/for-next/seccomp (a3fc712c5b37 seccomp: Fix "cacheable" typ=
o in comments)
Merging kspp/for-next/kspp (414eece95b98 Merge tag 'clang-lto-v5.12-rc1-par=
t2' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging gnss/gnss-next (994adcbd3714 gnss: drop stray semicolons)
Merging fsi/next (4a851d714ead fsi: aspeed: Support CFAM reset GPIO)
Merging slimbus/for-next (0320ed0a8236 drivers: slimbus: Fix word resposibl=
e -> responsible in slimbus.h)
CONFLICT (content): Merge conflict in drivers/nvmem/Makefile
CONFLICT (content): Merge conflict in drivers/nvmem/Kconfig
Merging nvmem/for-next (9e1a5761c274 nvmem: qfprom: Add support for fuse bl=
owing on sc7280)
Merging xarray/main (2c7e57a02708 idr test suite: Improve reporting from id=
r_find_test_1)
Merging hyperv/hyperv-next (0975694befc0 Drivers: hv: vmbus: Remove unused =
linux/version.h header)
CONFLICT (content): Merge conflict in arch/x86/include/asm/mshyperv.h
Applying: fix up for "x86/paravirt: Switch time pvops functions to use stat=
ic_call()"
Merging auxdisplay/auxdisplay (701454bce906 auxdisplay: Remove in_interrupt=
() usage.)
Merging kgdb/kgdb/for-next (2bbd9b0f2b4e kernel: debug: Ordinary typo fixes=
 in the file gdbstub.c)
Merging hmm/hmm (fe07bfda2fb9 Linux 5.12-rc1)
Merging fpga/for-next (a78a51a851ed fpga: dfl: pci: add DID for D5005 PAC c=
ards)
Merging kunit/test (a38fd8748464 Linux 5.12-rc2)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (a38fd8748464 Linux 5.12-rc2)
Merging kunit-next/kunit (359a376081d4 kunit: support failure from dynamic =
analysis tools)
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (79d056976485 bus: mhi: core: Move to polling method t=
o wait for MHI ready)
Merging memblock/for-next (097d43d85704 mm: memblock: remove return value o=
f memblock_free_all())
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (e71ba9452f0b Linux 5.11-rc2)
Merging iomem-mmap-vs-gup/topic/iomem-mmap-vs-gup (5f962ee843e6 mm: unexpor=
t follow_pfn)
Merging rust/rust-next (add74f8473c5 Rust support)
CONFLICT (content): Merge conflict in Makefile
Merging akpm-current/current (f47d46143d3f mm-vmalloc-remove-unmap_kernel_r=
ange-fix-fix)
CONFLICT (content): Merge conflict in mm/slub.c
CONFLICT (content): Merge conflict in kernel/watchdog.c
CONFLICT (content): Merge conflict in include/linux/bitmap.h
CONFLICT (content): Merge conflict in arch/x86/mm/init_64.c
CONFLICT (content): Merge conflict in Documentation/admin-guide/kernel-para=
meters.txt
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (f2df56a27ec3 memfd_secret: use unsigned int rather tha=
n long as syscall flags type)

--Sig_/Ng+v6vdAFW_pS4APIjpWGrv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBsVI0ACgkQAVBC80lX
0GyCGAf/VTWacd9m/EDxSSuI5iqI6vL6i+iguLKK6+7mn5t1fuwSqZVUAEutMi8V
knkcZZ7uTjupf3d4dWJagr2ZEii9O/BHcsneLxtQ0Xi/4re5Uj6YiNkqVb4IKwBk
IK6llujeThj4MGGLidWVAg0offE5JOLYvztuWXp8rlSDeP3uwSmcj3WwMvsUdfPU
869cvbY96GaCt6or+1hhIsb1SZIZyjp9xKzgNQn3iQjmrOij1R1pjjlq59HUsuCM
d0kR1K8yUn6/IRWnCAIo2tvrmFLKP94UGnXWDV66pj762hrt0Q1YJMlXyx49EVKX
JhEA515fEMepvzJbWfrCvPJvV8ZZkg==
=Er9h
-----END PGP SIGNATURE-----

--Sig_/Ng+v6vdAFW_pS4APIjpWGrv--
