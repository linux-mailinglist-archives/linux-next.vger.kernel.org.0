Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5777376157
	for <lists+linux-next@lfdr.de>; Fri,  7 May 2021 09:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235595AbhEGHoG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 7 May 2021 03:44:06 -0400
Received: from ozlabs.org ([203.11.71.1]:35679 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231165AbhEGHoG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 7 May 2021 03:44:06 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fc2Vd1pFSz9sj5;
        Fri,  7 May 2021 17:43:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620373385;
        bh=f3EUZn3YgBM3Mq9mvsIcYX+I1b5F7aH3vQOMDRtFAqM=;
        h=Date:From:To:Cc:Subject:From;
        b=V51O3IART3ltCl+3X+Vh8In0qKcrf1O3Vr6nGw/Ern8aiEG3Vht7w3f8yZOoZhs9W
         RyXn/fMfti3SIm7ujN/7QGNCGp0cvYk6/zYTM8bLj9YtoBhXhI2Gxwoi5CCqJRDFsz
         xyNYdSO0f4aHbljqX+oNJKIrbzwDjNY7mCELK2KDjPTMh9x5jecOtHj6qg8G++ickq
         Gq5Q2plLisO6bruRPcvUyKGhGzZWw5gpJDJT7s0bKxg6DGLPCg1Y91YscwFtGgClxM
         pSgeI5bt9Wh0vivqCavzuFEY8ERp+ZhZMTrCQgv/pmA07hAeWYzBxeHz4ikvzLEDid
         ccVXkW2O3272g==
Date:   Fri, 7 May 2021 17:43:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 7
Message-ID: <20210507174302.428e22a0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lBTLvf_WVYmKriX3Q.Higt1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/lBTLvf_WVYmKriX3Q.Higt1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Please do not add any v5.14 material to your linux-next included branches
until after v5.13-rc1 has been released.

Changes since 20210506:

The amdgpu tree still had its build failure so I used the version from
next-20210504.

The akpm tree gained a conflict against the risc-v tree.

Non-merge commits (relative to Linus' tree): 971
 1266 files changed, 67963 insertions(+), 8403 deletions(-)

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

I am currently merging 342 trees (counting Linus' and 89 trees of bug
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
Merging origin/master (e48661230cc3 Merge tag 's390-5.13-2' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/s390/linux)
Merging fixes/fixes (e71ba9452f0b Linux 5.11-rc2)
Merging kbuild-current/fixes (9f67672a817e Merge tag 'ext4_for_linus' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4)
Merging arc-current/for-curr (1582f08d83d7 ARC: entry: fix off-by-one error=
 in syscall number validation)
Merging arm-current/fixes (d2f7eca60b29 ARM: 9071/1: uprobes: Don't hook on=
 thumb instructions)
Merging arm64-fixes/for-next/fixes (22315a2296f4 arm64: alternatives: Move =
length validation in alternative_{insn, endif})
Merging arm-soc-fixes/arm/fixes (b5144a2bf401 dt-bindings: nvmem: mediatek:=
 remove duplicate mt8192 line)
Merging drivers-memory-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging m68k-current/for-linus (34e5269bf987 m68k: sun3x: Remove unneeded s=
emicolon)
Merging powerpc-fixes/fixes (791f9e36599d powerpc/vdso: Make sure vdso_wrap=
per.o is rebuilt everytime vdso.so is rebuilt)
Merging s390-fixes/fixes (6daa755f813e Merge tag 's390-5.13-1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/s390/linux)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (8621436671f3 smc: disallow TCP_ULP in smc_setsockopt())
Merging bpf/master (9683e5775c75 libbpf: Add NULL check to add_dummy_ksym_v=
ar)
Merging ipsec/master (b515d2637276 xfrm: xfrm_state_mtu should return at le=
ast 1280 for ipv6)
Merging netfilter/master (7072a355ba19 netfilter: nfnetlink: add a missing =
rcu_read_unlock())
Merging ipvs/master (bbd6f0a94813 bnxt_en: Fix RX consumer index logic in t=
he error path.)
Merging wireless-drivers/master (e7020bb068d8 iwlwifi: Fix softirq/hardirq =
disabling in iwl_pcie_gen2_enqueue_hcmd())
Merging mac80211/master (eefb45eef5c4 neighbour: Prevent Race condition in =
neighbour subsytem)
Merging rdma-fixes/for-rc (d434405aaab7 Linux 5.12-rc7)
Merging sound-current/for-linus (f48652bbe3ae ALSA: hda: generic: change th=
e DAC ctl name for LO+SPK or LO+HP)
Merging sound-asoc-fixes/for-linus (03f2880ae8a8 Merge remote-tracking bran=
ch 'asoc/for-5.13' into asoc-linus)
Merging regmap-fixes/for-linus (78d889705732 Merge remote-tracking branch '=
regmap/for-5.12' into regmap-linus)
Merging regulator-fixes/for-linus (0bbefa641a32 Merge remote-tracking branc=
h 'regulator/for-5.12' into regulator-linus)
Merging spi-fixes/for-linus (eb43e665d243 Merge remote-tracking branch 'spi=
/for-5.13' into spi-linus)
Merging pci-current/for-linus (cf673bd0cc97 PCI: switchtec: Fix Spectre v1 =
vulnerability)
Merging driver-core.current/driver-core-linus (8404c9fbc84b Merge branch 'a=
kpm' (patches from Andrew))
Merging tty.current/tty-linus (8404c9fbc84b Merge branch 'akpm' (patches fr=
om Andrew))
Merging usb.current/usb-linus (8404c9fbc84b Merge branch 'akpm' (patches fr=
om Andrew))
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (0d02ec6b3136 Linux 5.12-rc4)
Merging usb-chipidea-fixes/for-usb-fixes (c1d8a521dbd7 usb: cdnsp: Fix lack=
 of removing request from pending list.)
Merging phy/fixes (da848f9a0e13 phy: qcom-qmp: add hbr3_hbr2 voltage and pr=
emphasis swing table)
CONFLICT (content): Merge conflict in drivers/phy/qualcomm/phy-qcom-qmp.c
Merging staging.current/staging-linus (8404c9fbc84b Merge branch 'akpm' (pa=
tches from Andrew))
Merging iio-fixes/fixes-togreg (4d28b580e80a iio: core: fix ioctl handlers =
removal)
Merging char-misc.current/char-misc-linus (8404c9fbc84b Merge branch 'akpm'=
 (patches from Andrew))
Merging soundwire-fixes/fixes (fde5d7f27108 soundwire: bus: Fix device foun=
d flag correctly)
Merging thunderbolt-fixes/fixes (9f4ad9e425a1 Linux 5.12)
Merging input-current/for-linus (d0034a7a4ac7 Merge branch 'next' into for-=
linus)
Merging crypto-current/master (e3a606f2c544 fsverity: relax build time depe=
ndency on CRYPTO_SHA256)
Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer)
Merging vfio-fixes/for-linus (cc35518d29bc docs: vfio: fix typo)
Merging kselftest-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging dmaengine-fixes/fixes (ea9aadc06a9f dmaengine: idxd: fix wq cleanup=
 of WQCFG registers)
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
Merging kvm-fixes/master (9c1a07442c95 KVM: x86/xen: Take srcu lock when ac=
cessing kvm_memslots())
Merging kvms390-fixes/master (735931f9a51a MAINTAINERS: add uv.c also to KV=
M/s390)
Merging hwmon-fixes/hwmon (a38fd8748464 Linux 5.12-rc2)
Merging nvdimm-fixes/libnvdimm-fixes (99a81dcc717d Merge branch 'for-5.12/c=
xl' into libnvdimm-fixes)
Merging cxl-fixes/fixes (fae8817ae804 cxl/mem: Fix memory device capacity p=
robing)
Merging btrfs-fixes/next-fixes (2e4f4de38d26 Merge branch 'misc-5.13' into =
next-fixes)
Merging vfs-fixes/fixes (173e84953eaa fs: fix reporting supported extra fil=
e attributes for statx())
Merging dma-mapping-fixes/for-linus (18a3c5f7abfd Merge tag 'for_linus' of =
git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging i3c-fixes/i3c/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging drivers-x86-fixes/fixes (a3790a8a94fc platform/x86: intel-hid: Fix =
spurious wakeups caused by tablet-mode events during suspend)
Merging samsung-krzk-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging pinctrl-samsung-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging devicetree-fixes/dt/linus (6799e3f281e9 dt-bindings: net: renesas,e=
theravb: Fix optional second clock name)
Merging scsi-fixes/fixes (35ffbb60bdad scsi: fnic: Use scsi_host_busy_iter(=
) to traverse commands)
Merging drm-fixes/drm-fixes (aca38735ae62 Merge tag 'drm-intel-fixes-2021-0=
4-22' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (9f4ad9e425a1 Linux 5.12)
Merging mmc-fixes/fixes (7412dee9f1fd mmc: meson-gx: replace WARN_ONCE with=
 dev_warn_once about scatterlist size alignment in block mode)
Merging rtc-fixes/rtc-fixes (bd33335aa93d rtc: cmos: Disable irq around dir=
ect invocation of cmos_interrupt())
Merging gnss-fixes/gnss-linus (a38fd8748464 Linux 5.12-rc2)
Merging hyperv-fixes/hyperv-fixes (37df9f3fedb6 video: hyperv_fb: Fix a dou=
ble free in hvfb_probe)
Merging soc-fsl-fixes/fix (2663b3388551 soc: fsl: dpio: Get the cpumask thr=
ough cpumask_of(cpu))
Merging risc-v-fixes/fixes (18a3c5f7abfd Merge tag 'for_linus' of git://git=
.kernel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging pidfd-fixes/fixes (03ba0fe4d09f file: simplify logic in __close_ran=
ge())
Merging fpga-fixes/fixes (2e8496f31d0b firmware: stratix10-svc: reset COMMA=
ND_RECONFIG_FLAG_PARTIAL to 0)
Merging spdx/spdx-linus (9f4ad9e425a1 Linux 5.12)
Merging gpio-brgl-fixes/gpio/for-current (ddd8d94ca31e gpio: omap: Save and=
 restore sysconfig)
Merging gpio-intel-fixes/fixes (b41ba2ec54a7 gpiolib: Read "gpio-line-names=
" from a firmware node)
Merging pinctrl-intel-fixes/fixes (196d94175329 pinctrl: lewisburg: Update =
number of pins in community)
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
Merging cel-fixes/for-rc (9f4ad9e425a1 Linux 5.12)
Merging drm-misc-fixes/for-linux-next-fixes (ffe8768fb8f3 drm/vc4: remove u=
nused function)
CONFLICT (content): Merge conflict in drivers/gpu/drm/ttm/ttm_bo.c
Merging kspp-gustavo/for-next/kspp (36f9ff9e03de lib: Fix fall-through warn=
ings for Clang)
Merging kbuild/for-next (51eb95e2da41 kbuild: Don't remove link-vmlinux tem=
porary files on exit/signal)
Merging compiler-attributes/compiler-attributes (19c329f68089 Linux 5.11-rc=
4)
Merging dma-mapping/for-next (a7f3d3d3600c dma-mapping: add unlikely hint t=
o error path in dma_mapping_error)
Merging asm-generic/master (38489db09b10 Merge branch 'asm-generic-fixes' i=
nto asm-generic)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (d3506d256d94 Merge branch 'misc' into for-next)
Merging arm64/for-next/core (c76fba33467b arm64: kernel: Update the stale c=
omment)
CONFLICT (content): Merge conflict in arch/arm64/kernel/alternative.c
Merging arm-perf/for-next/perf (2c2e21e78a94 arm64: perf: Remove redundant =
initialization in perf_event.c)
Merging arm-soc/for-next (d42805807be7 Merge branch 'arm/drivers' into for-=
next)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/allwinner/sun50i-=
h6-beelink-gs1.dts
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (09dc799bceb5 Merge branch 'v5.13/fixes' into tmp/=
aml-rebuild)
Merging aspeed/for-next (61fbc42084f4 Merge branches 'wpcm450-for-v5.13', '=
dt-for-v5.13' and 'lpc-for-v5.13' into for-next)
Merging at91/at91-next (969bbb49f36c Merge branch 'at91-dt' into at91-next)
Merging drivers-memory/for-next (93567c59f9b0 Merge branch 'mem-ctrl-next' =
into for-next)
Merging imx-mxs/for-next (1f0f76f795d5 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (9d2e21ed98a2 Merge branch 'for_5.12/drivers-soc' int=
o next)
Merging mediatek/for-next (068acd3c4e4c Merge branch 'v5.12-next/dts64-2' i=
nto for-next)
Merging mvebu/for-next (79e93f9dc81a Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (44e97f6fb29b Merge branch 'fixes' into for-next)
Merging qcom/for-next (0109038cffef Merge branches 'arm64-defconfig-for-5.1=
3', 'arm64-for-5.13', 'defconfig-for-5.13', 'drivers-for-5.13' and 'dts-for=
-5.13' into for-next)
Merging raspberrypi/for-next (fbdcf1d20126 ARM: dts: bcm2711: Add the CEC i=
nterrupt controller)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/bcm2711.dtsi
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (0bacf4d3d276 Merge branch 'renesas-arm-dt-for-v5.13' =
into renesas-next)
Merging reset/reset/next (7941ad8d45e2 reset: RESET_INTEL_GW should depend =
on X86)
CONFLICT (content): Merge conflict in drivers/reset/core.c
Merging rockchip/for-next (f40c51456fe0 Merge branch 'v5.13-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (8a4d4cd15c39 Merge branch 'next/soc' into fo=
r-next)
Merging scmi/for-linux-next (04c552317e02 Merge tag 'scmi-fixes-5.13' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-lin=
ux-next)
Merging stm32/stm32-next (6ed9269265e1 ARM: dts: stm32: Add PTP clock to Et=
hernet controller)
Merging sunxi/sunxi/for-next (9fa021aa01fd Merge tags 'sunxi-dt-for-5.13-1'=
 and 'sunxi-fixes-for-5.12' into sunxi/for-next)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/allwinner/sun50i-=
h6-beelink-gs1.dts
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/allwinner/sun50i-=
a64-pine64-lts.dts
Merging tegra/for-next (93b9ea9ca307 Merge branch for-5.13/arm64/dt into fo=
r-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (112e5934ff3a arm64: dts: ti: k3-am64-main: Fi=
x ospi compatible)
Merging xilinx/for-next (fe07bfda2fb9 Linux 5.12-rc1)
Merging clk/clk-next (3ba2d41dca14 Merge branch 'clk-ralink' into clk-next)
Merging clk-imx/for-next (054ef44ea3ef clk: imx: Reference preceded by free)
Merging clk-renesas/renesas-clk (f2fb4fe62390 clk: renesas: Zero init clk_i=
nit_data)
Merging clk-samsung/for-next (a38fd8748464 Linux 5.12-rc2)
Merging csky/linux-next (11e7a691a977 csky: syscache: Fixup duplicate cache=
 flush)
Merging h8300/h8300-next (6e5e55227c95 Merge tag 'v5.11' into h8300-next)
Merging m68k/for-next (34e5269bf987 m68k: sun3x: Remove unneeded semicolon)
Merging m68knommu/for-next (6b3788e5fb80 m68k: coldfire: fix irq ranges)
Merging microblaze/next (47de4477a8e6 microblaze: add 'fallthrough' to memc=
py/memset/memmove)
Merging mips/mips-next (7e9be673cb1b MIPS: BCM63XX: Use BUG_ON instead of c=
ondition followed by BUG.)
Merging nds32/next (40e0dd851e7b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (1683f7de65db soc: litex: Remove duplicated heade=
r file inclusion)
Merging parisc-hd/for-next (9f4ad9e425a1 Linux 5.12)
Merging powerpc/next (c6b05f4e233c powerpc/kconfig: Restore alphabetic orde=
r of the selects under CONFIG_PPC)
CONFLICT (content): Merge conflict in arch/powerpc/Kconfig
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (242b0b398ccd soc: fsl: enable acpi support in RCPM dr=
iver)
Merging risc-v/for-next (beaf5ae15a13 riscv: remove unused handle_exception=
 symbol)
Merging s390/for-next (b208108638c4 s390: fix detection of vector enhanceme=
nts facility 1 vs. vector packed decimal facility)
Merging sh/for-next (2882b7626f49 sh: kernel: traps: remove unused variable)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (ed102bf2afed um: Fix W=3D1 missing-include-dirs war=
nings)
Merging xtensa/xtensa-for-next (6a8eb99e130f xtensa: ISS: add GDBIO impleme=
ntation to semihosting interface)
Merging pidfd/for-next (8fac44cbbaa2 Merge branch 'fs/idmapped_mounts/helpe=
rs' into for-next)
Merging fscrypt/master (a14d0b676491 fscrypt: allow deleting files with uns=
upported encryption policy)
Merging fscache/fscache-next (3003bbd0697b afs: Use the netfs_write_begin()=
 helper)
Merging afs/afs-next (7af08140979a Revert "gcov: clang: fix clang-11+ build=
")
Merging btrfs/for-next (8a03ef87ec7e Merge branch 'for-next-next-v5.13-2021=
0420' into for-next-20210420)
Merging ceph/master (0e1c1526416f Merge commit 'ed94f87c2b123241ae5644cf823=
27e2da653adb6')
Merging cifs/for-next (7c9e41e0ef7d Merge tag '5.13-rc-smb3-part2' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging cifsd/cifsd-for-next (c309fbcfa4c0 Merge pull request #43 from namj=
aejeon/cifsd-for-next)
Merging configfs/for-next (14fbbc829772 configfs: fix a use-after-free in _=
_configfs_open_file)
Merging ecryptfs/next (682a8e2b41ef Merge tag 'ecryptfs-5.13-rc1-updates' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs)
Merging erofs/dev (8e6c8fa9f2e9 erofs: enable big pcluster feature)
Merging exfat/dev (c6e2f52e3051 exfat: speed up iterate/lookup by fixing st=
art point of traversing cluster chain)
Merging ext3/for_next (bf7ea7068a02 Pull reiserfs cleanup.)
Merging ext4/dev (6c0912739699 ext4: wipe ext4_dir_entry2 upon file deletio=
n)
Merging f2fs/dev (d665ea6ea86c Merge tag 'for-linus-5.13-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/rw/uml)
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (3c9c14338c12 cuse: simplify refcount)
Merging jfs/jfs-next (b462cecfa323 fs: Fix typo issue)
Merging nfs/linux-next (9e895cd9649a xprtrdma: Fix a NULL dereference in fr=
wr_unmap_sync())
Merging nfs-anna/linux-next (4f8be1f53bf6 nfs: we don't support removing sy=
stem.nfs4_acl)
Merging nfsd/nfsd-next (c3213d260a23 SUNRPC: Fix oops in the rpc_xdr_buf ev=
ent class)
Merging cel/for-next (b9f83ffaa0c0 SUNRPC: Fix null pointer dereference in =
svc_rqst_free())
Merging orangefs/for-next (211f9f2e0503 orangefs: leave files in the page c=
ache for a few micro seconds at least)
Merging overlayfs/overlayfs-next (5e717c6fa41f ovl: add debug print to ovl_=
do_getxattr())
Merging ubifs/next (9a29f7f020e0 ubi: Remove unnecessary struct declaration)
Merging v9fs/9p-next (f8b139e2f241 fs: 9p: fix v9fs_file_open writeback fid=
 error check)
Merging xfs/for-next (8e9800f9f2b8 xfs: don't allow log writes if the data =
device is readonly)
Merging zonefs/for-next (6980d29ce4da zonefs: fix to update .i_wr_refcnt co=
rrectly in zonefs_open_zone())
Merging iomap/iomap-for-next (6e552494fb90 iomap: remove unused private fie=
ld from ioend)
Merging djw-vfs/vfs-for-next (9b8523423b23 vfs: move __sb_{start,end}_write=
* to fs.h)
Merging file-locks/locks-next (cbe6fc4e0142 fs/locks: remove useless assign=
ment in fcntl_getlk)
Merging vfs/for-next (e8727aec724e Merge branch 'work.misc' into for-next)
Merging printk/for-next (a386d19acc30 Merge branch 'for-5.13' into for-next)
Merging pci/next (882862aaacef Merge branch 'pci/tegra')
Merging pstore/for-next/pstore (9d843e8fafc7 pstore: Add mem_type property =
DT parsing support)
Merging hid/for-next (dce6a0d56a77 Merge branches 'for-5.14/core', 'for-5.1=
4/google' and 'for-5.14/logitech' into for-next)
Merging i2c/i2c/for-next (f9743e4d0a62 Merge branch 'i2c/for-5.13' into i2c=
/for-next)
Merging i3c/i3c/next (0d95f41ebde4 Revert "i3c master: fix missing destroy_=
workqueue() on error in i3c_master_register")
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (9049572fb145 hwmon: Remove amd_energy dri=
ver)
Merging jc_docs/docs-next (7fc4607899e8 Enlisted oprofile version line remo=
ved)
Merging v4l-dvb/master (0b276e470a4d media: coda: fix macroblocks count con=
trol usage)
Merging v4l-dvb-next/master (bf05bf16c76b Linux 5.12-rc8)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (1f348871f80e Merge branch 'acpi-pm' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (dbbd49bade05 cpufreq: armada-37=
xx: Fix module unloading)
Merging cpupower/cpupower (a38fd8748464 Linux 5.12-rc2)
Merging devfreq/devfreq-next (0a7dc8318c28 PM / devfreq: imx8m-ddrc: Remove=
 unneeded of_match_ptr())
Merging opp/opp/linux-next (a8bb0e872bfb memory: samsung: exynos5422-dmc: C=
onvert to use resource-managed OPP API)
Merging thermal/thermal/linux-next (c310e546164d thermal/drivers/mtk_therma=
l: Remove redundant initializations of several variables)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (2fd8db2dd05d fs: dlm: fix missing unlock on error in acce=
pt_from_sock())
Merging swiotlb/linux-next (dfc06b389a4f swiotlb: don't override user speci=
fied size in swiotlb_adjust_size)
Merging rdma/for-next (6da7bda36388 IB/qib: Remove redundant assignment to =
ret)
Merging net-next/master (9d31d2338950 Merge tag 'net-next-5.13' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging bpf-next/for-next (9d31d2338950 Merge tag 'net-next-5.13' of git://=
git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging ipsec-next/master (747b67088f8d xfrm: ipcomp: remove unnecessary ge=
t_cpu())
Merging mlx5-next/mlx5-next (63f9c44bca5e net/mlx5: Add MEMIC operations re=
lated bits)
Merging netfilter-next/master (9d31d2338950 Merge tag 'net-next-5.13' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging ipvs-next/master (99ba0ea616aa sfc: adjust efx->xdp_tx_queue_count =
with the real number of initialized queues)
Merging wireless-drivers-next/master (9382531ec63f Merge tag 'mt76-for-kval=
o-2021-04-21' of https://github.com/nbd168/wireless)
Merging bluetooth/master (c96a0ebb1514 Bluetooth: Fix the HCI to MGMT statu=
s conversion table)
Merging mac80211-next/master (9d31d2338950 Merge tag 'net-next-5.13' of git=
://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging gfs2/for-next (f2c80837e27e Merge tag 'gfs2-for-5.13' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2)
Merging mtd/mtd/next (a881537dfaf2 Revert "mtd: rawnand: bbt: Skip bad bloc=
ks when searching for the BBT in NAND")
Merging nand/nand/next (32cbc7cb70b0 mtd: rawnand: qcom: Use dma_mapping_er=
ror() for error check)
Merging spi-nor/spi-nor/next (46094049a49b Revert "mtd: spi-nor: macronix: =
Add support for mx25l51245g")
Merging crypto/master (e3a606f2c544 fsverity: relax build time dependency o=
n CRYPTO_SHA256)
Merging drm/drm-next (1cd6b4a04f03 Merge tag 'drm-intel-next-fixes-2021-04-=
27' of git://anongit.freedesktop.org/drm/drm-intel into drm-next)
Applying: merge fix for "drm: Switch to %p4cc format modifier"
Merging drm-misc/for-linux-next (b9d79e4ca4ff fbmem: Mark proc_fb_seq_ops a=
s __maybe_unused)
Merging amdgpu/drm-next (e42491343712 Revert "drm/radeon/si_dpm: Replace on=
e-element array with flexible-array in struct SISLANDS_SMC_SWSTATE")
$ git reset --hard HEAD^
Merging next-20210504 version of amdgpu
Merging drm-intel/for-linux-next (c7b397e9ca4d Merge tag 'gvt-next-fixes-20=
21-04-29' of https://github.com/intel/gvt-linux into drm-intel-next-fixes)
Merging drm-tegra/drm/tegra/for-next (c79184a9c029 drm/tegra: Fix shift ove=
rflow in tegra_shared_plane_atomic_update)
Merging drm-msm/msm-next (02ded1314a46 drm/msm: fix minor version to indica=
te MSM_PARAM_SUSPENDS support)
Merging imx-drm/imx-drm/next (74181df8c6db drm/imx: ipuv3-plane: Remove two=
 unnecessary export symbols)
CONFLICT (content): Merge conflict in drivers/gpu/drm/imx/ipuv3-plane.c
Merging etnaviv/etnaviv/next (4bfdd2aa67fb drm/etnaviv: rework linear windo=
w offset calculation)
Merging regmap/for-next (ccac12acc0c0 Merge remote-tracking branch 'regmap/=
for-5.13' into regmap-next)
Merging sound/for-next (f48652bbe3ae ALSA: hda: generic: change the DAC ctl=
 name for LO+SPK or LO+HP)
Merging sound-asoc/for-next (03f2880ae8a8 Merge remote-tracking branch 'aso=
c/for-5.13' into asoc-linus)
Merging modules/modules-next (33121347fb1c module: treat exit sections the =
same as init sections when !CONFIG_MODULE_UNLOAD)
Merging input/next (d12b64b9764e MAINTAINERS: repair reference in HYCON HY4=
6XX TOUCHSCREEN SUPPORT)
Merging block/for-next (3c2ed5a8158c Merge branch 'block-5.13' into for-nex=
t)
Merging device-mapper/for-next (ca4a4e9a55be dm raid: remove unnecessary di=
scard limits for raid0 and raid10)
Merging pcmcia/pcmcia-next (e9d503fef7da pcmcia: rsrc_nonstatic: Fix call-b=
ack function as reference formatting)
Merging mmc/next (97fce126e279 mmc: block: Issue a cache flush only when it=
's enabled)
Merging mfd/for-mfd-next (f9386c91574f mfd: intel-m10-bmc: Add support for =
MAX10 BMC Secure Updates)
Merging backlight/for-backlight-next (04758386757c backlight: journada720: =
Fix Wmisleading-indentation warning)
Merging battery/for-next (d0a43c12ee9f power: supply: cpcap-battery: fix in=
valid usage of list cursor)
Merging regulator/for-next (4dd1c9530698 Merge remote-tracking branch 'regu=
lator/for-5.13' into regulator-next)
Merging security/next-testing (047843bdb316 Merge branch 'landlock_lsm_v34'=
 into next-testing)
Merging apparmor/apparmor-next (d108370c644b apparmor: fix error check)
Merging integrity/next-integrity (781a57394899 ima: ensure IMA_APPRAISE_MOD=
SIG has necessary dependencies)
Merging keys/keys-next (e377c31f788f integrity: Load mokx variables into th=
e blacklist keyring)
CONFLICT (content): Merge conflict in certs/system_keyring.c
Merging safesetid/safesetid-next (1ca86ac1ec8d LSM: SafeSetID: Fix code spe=
cification by scripts/checkpatch.pl)
Merging selinux/next (e4c82eafb609 selinux: add proper NULL termination to =
the secclass_map permissions)
Merging smack/next (7ef4c19d245f smackfs: restrict bytes count in smackfs w=
rite functions)
Merging tomoyo/master (5dc33592e955 lockdep: Allow tuning tracing capacity =
constants.)
Merging tpmdd/next (9ccce092fc64 Merge tag 'for-linus-5.13-ofs-1' of git://=
git.kernel.org/pub/scm/linux/kernel/git/hubcap/linux)
Merging watchdog/master (bf05bf16c76b Linux 5.12-rc8)
Merging iommu/next (2d471b20c55e iommu: Streamline registration interface)
Merging audit/next (b75d8f38bcc9 audit: drop /proc/PID/loginuid documentati=
on Format field)
Merging devicetree/for-next (031cc263c037 powerpc: If kexec_build_elf_info(=
) fails return immediately from elf64_load())
Merging mailbox/mailbox-for-next (2335f556b3af dt-bindings: mailbox: qcom-i=
pcc: Add compatible for SC7280)
Merging spi/for-next (eb43e665d243 Merge remote-tracking branch 'spi/for-5.=
13' into spi-linus)
Merging tip/auto-latest (17ae69aba89d Merge tag 'landlock_v34' of git://git=
.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security)
Merging clockevents/timers/drivers/next (8120891105ba dt-bindings: timer: n=
uvoton,npcm7xx: Add wpcm450-timer)
Merging edac/edac-for-next (faf042d15093 Merge branch 'edac-amd64' into eda=
c-for-next)
Merging irqchip/irq/irqchip-next (33aa3698bac9 ARM: PXA: Fix cplds irqdesc =
allocation when using legacy mode)
Merging ftrace/for-next (8c9af478c06b ftrace: Handle commands when closing =
set_ftrace_filter file)
Merging rcu/rcu/next (35c0c1d51208 Merge branch 'clocksource.2021.05.02a' i=
nto HEAD)
Merging kvm/next (3bf0fcd75434 KVM: selftests: Speed up set_memory_region_t=
est)
Merging kvm-arm/next (9a8aae605b80 Merge branch 'kvm-arm64/kill_oprofile_de=
pendency' into kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (72476aaa4691 KVM: PPC: Book3S HV: Fix host ra=
dix SLB optimisation with hash guests)
Merging kvms390/next (44bada282190 KVM: s390: fix guarded storage control r=
egister handling)
Merging xen-tip/linux-next (f5079a9a2a31 xen/arm: introduce XENFEAT_direct_=
mapped and XENFEAT_not_direct_mapped)
Merging percpu/for-next (bd0d09ebd4f8 Merge branch 'for-5.12-fixes' into fo=
r-next)
Merging workqueues/for-next (89e28ce60cb6 workqueue/watchdog: Make unbound =
workqueues aware of touch_softlockup_watchdog() 84;0;0c84;0;0c There are tw=
o workqueue-specific watchdog timestamps:)
Merging drivers-x86/for-next (e7882cd7aebe platform/x86: gigabyte-wmi: add =
support for B550M AORUS PRO-P)
Merging chrome-platform/for-next (d61b3f9b91be platform/chrome: cros_ec_lpc=
: Use DEFINE_MUTEX() for mutex lock)
Merging hsi/for-next (5c08b0f75575 HSI: core: fix resource leaks in hsi_add=
_client_from_dt())
Merging leds/for-next (23a700455a1b leds: pca9532: Assign gpio base dynamic=
ally)
Merging ipmi/for-next (d72cd4ad4174 Merge tag 'scsi-misc' of git://git.kern=
el.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging driver-core/driver-core-next (8404c9fbc84b Merge branch 'akpm' (pat=
ches from Andrew))
Merging usb/usb-next (8404c9fbc84b Merge branch 'akpm' (patches from Andrew=
))
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (039b81d50a48 USB: cdc-acm: add more Maxlinear/=
Exar models to ignore list)
Merging usb-chipidea-next/for-usb-next (b85a512e023c usb: cdnsp: Useless co=
ndition has been removed)
Merging tty/tty-next (8404c9fbc84b Merge branch 'akpm' (patches from Andrew=
))
Merging char-misc/char-misc-next (8404c9fbc84b Merge branch 'akpm' (patches=
 from Andrew))
Merging extcon/extcon-next (7b1222b224af extcon: qcom-spmi: Add support for=
 VBUS detection)
Merging phy-next/next (8a6b85b14f08 phy: Revert "phy: ti: j721e-wiz: add mi=
ssing of_node_put")
Merging soundwire/next (14968dd36a50 soundwire: intel_init: test link->cdns)
Merging thunderbolt/next (6f3badead6a0 thunderbolt: Hide authorized attribu=
te if router does not support PCIe tunnels)
Merging vfio/next (adaeb718d46f vfio/gvt: fix DRM_I915_GVT dependency on VF=
IO_MDEV)
Merging staging/staging-next (8404c9fbc84b Merge branch 'akpm' (patches fro=
m Andrew))
Merging iio/togreg (6470a8206a10 Merge tag 'iio-for-5.13b-take2' of https:/=
/git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-next)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (c1de07884f2b Merge branch 'icc-sm8350' into icc-next)
Merging dmaengine/next (0bde4444ec44 dmaengine: idxd: Enable IDXD performan=
ce monitor support)
Merging cgroup/for-next (ffeee417d97f cgroup: use tsk->in_iowait instead of=
 delayacct_is_task_waiting_on_io())
Merging scsi/for-next (3c58f1e2d015 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (85367040511f scsi: blk-mq: Fix build warning whe=
n making htmldocs)
Merging vhost/linux-next (7ff6e99e021c virtio_net: disable cb aggressively)
Merging rpmsg/for-next (dc0e14fa833b Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (444952956f34 dt-bindings: gpio: add YAML d=
escription for rockchip,gpio-bank)
Merging gpio-intel/for-next (058459043e71 gpio: ich: Switch to be dependent=
 on LPC_ICH)
Merging pinctrl/for-next (835109266494 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (5b613df3f499 pinctrl: intel: No need to dis=
able IRQs in the handler)
Merging pinctrl-renesas/renesas-pinctrl (61232cd6efca pinctrl: renesas: r8a=
7791: Add bias pinconf support)
Merging pinctrl-samsung/for-next (a38fd8748464 Linux 5.12-rc2)
Merging pwm/for-next (a6efb35019d0 pwm: Reword docs about pwm_apply_state())
Merging userns/for-next (ef566ba2d7d9 signal: Remove the last few si_perf r=
eferences)
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (e75074781f17 selftests/resctrl: Change a few printe=
d messages)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (c150bbbb1731 Merge branch 'for-5.13/signal' =
into for-next)
Merging coresight/next (1efbcec2ef8c coresight: cti: Reduce scope for the v=
ariable =E2=80=9Ccs_fwnode=E2=80=9D in cti_plat_create_connection())
Merging rtc/rtc-next (4d0185e67806 rtc: sysfs: check features instead of op=
s)
Merging nvdimm/libnvdimm-for-next (30c10d32152d Merge branch 'for-5.12/cxl'=
 into libnvdimm-for-next)
Merging at24/at24/for-next (fe07bfda2fb9 Linux 5.12-rc1)
Merging ntb/ntb-next (5c8fe583cce5 Linux 5.11-rc1)
Merging seccomp/for-next/seccomp (a3fc712c5b37 seccomp: Fix "cacheable" typ=
o in comments)
Merging kspp/for-next/kspp (f4648c741299 Merge branch 'for-next/overflow' i=
nto for-next/kspp)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (994adcbd3714 gnss: drop stray semicolons)
Merging fsi/next (4a851d714ead fsi: aspeed: Support CFAM reset GPIO)
Merging slimbus/for-next (0320ed0a8236 drivers: slimbus: Fix word resposibl=
e -> responsible in slimbus.h)
CONFLICT (content): Merge conflict in drivers/nvmem/Makefile
CONFLICT (content): Merge conflict in drivers/nvmem/Kconfig
Merging nvmem/for-next (e8405ad55f4c nvmem: sprd: Add missing MODULE_DEVICE=
_TABLE)
Merging xarray/main (2c7e57a02708 idr test suite: Improve reporting from id=
r_find_test_1)
Merging hyperv/hyperv-next (20a40e4da6a6 hv_balloon: Remove redundant assig=
nment to region_start)
Merging auxdisplay/auxdisplay (701454bce906 auxdisplay: Remove in_interrupt=
() usage.)
Merging kgdb/kgdb/for-next (83fa2d13d628 kdb: Refactor env variables get/se=
t code)
Merging hmm/hmm (fe07bfda2fb9 Linux 5.12-rc1)
Merging fpga/for-next (a78a51a851ed fpga: dfl: pci: add DID for D5005 PAC c=
ards)
Merging kunit/test (a38fd8748464 Linux 5.12-rc2)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (f3907773d602 mtd: cfi_cmdset_0002: remove redundant a=
ssignment to variable timeo)
Merging kunit-next/kunit (de2fcb3e6201 Documentation: kunit: add tips for u=
sing current->kunit_test)
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (a503d1628c9c bus: mhi: fix typo in comments for struc=
t mhi_channel_config)
Merging memblock/for-next (097d43d85704 mm: memblock: remove return value o=
f memblock_free_all())
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (e71ba9452f0b Linux 5.11-rc2)
Merging iomem-mmap-vs-gup/topic/iomem-mmap-vs-gup (ac8b8400620a mm: unexpor=
t follow_pfn)
Merging rust/rust-next (fef0214731cc rust: allow printing in the kernel cra=
te)
CONFLICT (content): Merge conflict in kernel/printk/printk.c
CONFLICT (content): Merge conflict in include/uapi/linux/android/binder.h
CONFLICT (content): Merge conflict in Makefile
Merging cxl/next (e49d033bddf5 Linux 5.12-rc6)
Merging tpmdd-jejb/tpmdd-for-next (69977d1aeeca Merge branch 'tpmdd-fixes' =
into tpmdd-for-next)
Merging akpm-current/current (e38d8f2d10ba ipc/sem.c: mundane typo fixes)
CONFLICT (content): Merge conflict in include/linux/bitmap.h
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --a=
bort".
CONFLICT (content): Merge conflict in arch/riscv/include/asm/set_memory.h
Merging akpm/master (9212c0321c9d memfd_secret: use unsigned int rather tha=
n long as syscall flags type)

--Sig_/lBTLvf_WVYmKriX3Q.Higt1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCU74YACgkQAVBC80lX
0GxvSAf+PfY5+LETeOiQS4xhhCGKbS7V666HQA9nkYp15MymKL7gs96XIfI6jm7A
mPa/e0I9GUI/aLc4YGH4X0yLNEjGIG/S0omHCnRTmBbNRnqYjbwGLcfO1J4X9/9h
8JU+GZAWQcS0eqkFWsk/RUP7aDWg5MRe7sPi7X1+bCT45uxN1zvx+ryG6cD1KtaH
mVWpvImIbvZhfSqFHNb3zS+04Woe1hpuJtPctZPsE5REpamsN/Pq17fWnMz0AwQu
Gm839VAI8aMi+O4GHEUoZLD8v4AC/qHXVojzVCJDdF2zX23IxvI92Xb/+de596Kj
QwcfvI9hefb51YIOx65J1HHRELjmUQ==
=WEy7
-----END PGP SIGNATURE-----

--Sig_/lBTLvf_WVYmKriX3Q.Higt1--
