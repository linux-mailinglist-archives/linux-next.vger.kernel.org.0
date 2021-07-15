Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 364173C969E
	for <lists+linux-next@lfdr.de>; Thu, 15 Jul 2021 05:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234241AbhGODuh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Jul 2021 23:50:37 -0400
Received: from ozlabs.org ([203.11.71.1]:34537 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230121AbhGODug (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Jul 2021 23:50:36 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GQL1B2Ypjz9sWq;
        Thu, 15 Jul 2021 13:47:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626320862;
        bh=Jx4zba3+/bouafQpa6AYZHe0i17rUamKf2uV6/JRKFo=;
        h=Date:From:To:Cc:Subject:From;
        b=sRD1VHSqzO0AodTZ1+ydByiShXbFQgqZYJZZk0MqLl7+OAwC2CcrHmOOe5rJUP3is
         SDKuFurOpckoTT+yat7W2XZ59BjZwWEpnlATDo/jlvKim4Zi/n1EyBrpg/7Yxm1Ae5
         gsGmloRsD04kJVyArFcOttnJWhQknBTzgwEgfJFEkkM1LHqCSYbzI/2PcVn86XmdRn
         V2yrA1VOANUae5jc/B32/BBnVdxsiXRuQpbWGAi2aexYNrwnesasXTN/iQHcDwiqZg
         yePzN3womVf0bnfGxQwqgPhf1HGfNlc1ofc5ZhxLpkAymkItF1sEeY0cUrhaH/CiOt
         ivms5U3U3Hxfw==
Date:   Thu, 15 Jul 2021 13:47:41 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 15
Message-ID: <20210715134741.7b6848d4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IVMVBqdPtQPGKfNKSAzg4_d";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/IVMVBqdPtQPGKfNKSAzg4_d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210714:

New tree: renesas-fixes

The workqueues tree gained a conflict against Linus' tree.

The dmaengine tree gained a conflict against the dmaengine-fixes tree.

Non-merge commits (relative to Linus' tree): 1180
 1103 files changed, 86754 insertions(+), 12197 deletions(-)

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

I am currently merging 332 trees (counting Linus' and 90 trees of bug
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
Merging origin/master (8096acd7442e Merge tag 'net-5.14-rc2' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging fixes/fixes (614124bea77e Linux 5.13-rc5)
Merging kbuild-current/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging arc-current/for-curr (13311e74253f Linux 5.13-rc7)
Merging arm-current/fixes (dad7b9896a5d ARM: 9081/1: fix gcc-10 thumb2-kern=
el regression)
Merging arm64-fixes/for-next/fixes (8cdd23c23c3d arm64: Restrict ARM64_BTI_=
KERNEL to clang 12.0.0 and newer)
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
Merging net/master (3ffd3dad4b5d Merge branch 'r8152-pm-fixxes')
Merging bpf/master (5acc7d3e8d34 xdp, net: Fix use-after-free in bpf_xdp_li=
nk_release)
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
Merging sound-current/for-linus (64752a95b702 ALSA: usb-audio: Add missing =
proc text entry for BESPOKEN type)
Merging sound-asoc-fixes/for-linus (071f948e3e20 Merge remote-tracking bran=
ch 'asoc/for-5.14' into asoc-linus)
Merging regmap-fixes/for-linus (e73f0f0ee754 Linux 5.14-rc1)
Merging regulator-fixes/for-linus (2578cc100741 Merge remote-tracking branc=
h 'regulator/for-5.14' into regulator-linus)
Merging spi-fixes/for-linus (19c19a816fc9 Merge remote-tracking branch 'spi=
/for-5.14' into spi-linus)
Merging pci-current/for-linus (e73f0f0ee754 Linux 5.14-rc1)
Merging driver-core.current/driver-core-linus (e73f0f0ee754 Linux 5.14-rc1)
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
Merging staging.current/staging-linus (e73f0f0ee754 Linux 5.14-rc1)
Merging iio-fixes/fixes-togreg (4377d9ab1f16 iio: accel: fxls8962af: fix po=
tential use of uninitialized symbol)
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
Merging dmaengine-fixes/fixes (d5c10e0fc864 dmaengine: idxd: fix setup sequ=
ence for MSIXPERM table)
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
Merging kvm-fixes/master (1889228d80fe KVM: selftests: smm_test: Test SMM e=
nter from L2)
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
Merging drivers-x86-fixes/fixes (23e9592b06b4 platform/x86: wireless-hotkey=
: remove hardcoded "hp" from the error message)
Merging samsung-krzk-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging pinctrl-samsung-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging devicetree-fixes/dt/linus (8929ef8d4dfd media: dt-bindings: media: =
renesas,drif: Fix fck definition)
Merging scsi-fixes/fixes (053c16ac8905 scsi: ufs: core: Add missing host_lo=
ck in ufshcd_vops_setup_xfer_req())
Merging drm-fixes/drm-fixes (1e7b5812f489 Merge tag 'drm-misc-fixes-2021-07=
-13' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (0abb33bfca0f drm/i915/gtt: dr=
op the page table optimisation)
Merging mmc-fixes/fixes (10252bae863d mmc: core: Don't allocate IDA for OF =
aliases)
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
Merging renesas-fixes/fixes (432b52eea3dc ARM: shmobile: defconfig: Restore=
 graphical consoles)
Merging drm-misc-fixes/for-linux-next-fixes (9e5c77295440 drm/ttm: add a ch=
eck against null pointer dereference)
Merging kspp-gustavo/for-next/kspp (b7eb335e26a9 Makefile: Enable -Wimplici=
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
Merging imx-mxs/for-next (91eb4b818975 Merge branch 'imx/dt64' into for-nex=
t)
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
Merging renesas/next (51832d6b6211 Merge branches 'renesas-arm-defconfig-fo=
r-v5.15' and 'renesas-arm-dt-for-v5.15' into renesas-next)
Merging reset/reset/next (48a74b1147f7 reset: Add compile-test stubs)
Merging rockchip/for-next (2deacb579c33 Merge branch 'v5.15-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (5ce16705e00d Merge branch 'next/defconfig' i=
nto for-next)
Merging scmi/for-linux-next (6ce2ccff5621 Merge tag 'scmi-fixes-5.14' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-lin=
ux-next)
Merging stm32/stm32-next (4bf4abe19089 ARM: dts: stm32: fix stpmic node for=
 stm32mp1 boards)
Merging sunxi/sunxi/for-next (3f1c53207cf0 Merge branches 'sunxi/dt-for-5.1=
4' and 'sunxi/fixes-for-5.13' into sunxi/for-next)
Merging tegra/for-next (b34c0e9111d0 Merge branch for-5.15/arm64/dt into fo=
r-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (e73f0f0ee754 Linux 5.14-rc1)
Merging xilinx/for-next (d98fb9ab6255 Merge branch 'zynq/dt' into for-next)
Merging clk/clk-next (783d08bd02f5 Revert "clk: divider: Switch from .round=
_rate to .determine_rate by default")
Merging clk-imx/for-next (c586f53ae159 clk: imx8mq: remove SYS PLL 1/2 cloc=
k gates)
Merging clk-renesas/renesas-clk (55e35ffd52dc clk: renesas: r9a07g044: Add =
SSIF-2 clock and reset entries)
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
Merging cifs/for-next (07b1adb52d14 cifs: fix missing null session check in=
 mount)
Merging cifsd/cifsd-for-next (904729b61c37 Merge pull request #60 from namj=
aejeon/cifsd-for-next)
Merging configfs/for-next (420405ecde06 configfs: fix the read and write it=
erators)
Merging ecryptfs/next (682a8e2b41ef Merge tag 'ecryptfs-5.13-rc1-updates' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs)
Merging erofs/dev (8215d5b7f15f MAINTAINERS: erofs: update my email address)
Merging exfat/dev (50be9417e23a Merge tag 'io_uring-5.14-2021-07-09' of git=
://git.kernel.dk/linux-block)
Merging ext3/for_next (e73f0f0ee754 Linux 5.14-rc1)
Merging ext4/dev (0705e8d1e220 ext4: inline jbd2_journal_[un]register_shrin=
ker())
Merging f2fs/dev (5417c98c12f6 f2fs: avoid to create an empty string as the=
 extension_list)
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
Merging cel/for-next (14490d0ff202 NFSD: Batch release pages during splice =
read)
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
Merging devfreq/devfreq-next (e73f0f0ee754 Linux 5.14-rc1)
Merging opp/opp/linux-next (e73f0f0ee754 Linux 5.14-rc1)
Merging thermal/thermal/linux-next (fe6a6de6692e thermal/drivers/int340x/pr=
ocessor_thermal: Fix tcc setting)
Merging ieee1394/for-next (54b3bd99f094 firewire: nosy: switch from 'pci_' =
to 'dma_' API)
Merging dlm/next (957adb68b3f7 fs: dlm: invalid buffer access in lookup err=
or)
Merging swiotlb/linux-next (868c9ddc182b swiotlb: add overflow checks to sw=
iotlb_bounce)
Merging rdma/for-next (e73f0f0ee754 Linux 5.14-rc1)
Merging net-next/master (5e437416ff66 Merge branch 'dsa-mv88e6xxx-topaz-fix=
es')
Merging bpf-next/for-next (5e437416ff66 Merge branch 'dsa-mv88e6xxx-topaz-f=
ixes')
Merging ipsec-next/master (5e437416ff66 Merge branch 'dsa-mv88e6xxx-topaz-f=
ixes')
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
Merging drm/drm-next (e73f0f0ee754 Linux 5.14-rc1)
Merging drm-misc/for-linux-next (85fd4a8a8431 drm/ttm: Fix COW check)
Merging amdgpu/drm-next (47ba6aa65bed drm/amdgpu/display: add support for m=
ultiple backlights)
Merging drm-intel/for-linux-next (23bd991992f4 drm/i915/debugfs: DISPLAY_VE=
R 13 lpsp capability)
Merging drm-tegra/drm/tegra/for-next (b19502d1a683 drm/tegra: Bump driver v=
ersion)
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
Merging sound-asoc/for-next (f743d00ee66a Merge remote-tracking branch 'aso=
c/for-5.15' into asoc-next)
Merging modules/modules-next (2c0f0f363956 module: correctly exit module_ka=
llsyms_on_each_symbol when fn() !=3D 0)
Merging input/next (f8f84af5da9e Input: joydev - prevent use of not validat=
ed data in JSIOCSBTNMAP ioctl)
Merging block/for-next (60b8191c4777 Merge branch 'for-5.15/block' into for=
-next)
Merging device-mapper/for-next (5c0de3d72f8c dm writecache: make writeback =
pause configurable)
Merging pcmcia/pcmcia-next (e9d503fef7da pcmcia: rsrc_nonstatic: Fix call-b=
ack function as reference formatting)
Merging mmc/next (441b4dc421dc Merge branch 'fixes' into next)
Merging mfd/for-mfd-next (495fb48dbd9b mfd: wm831x: Use DEFINE_RES_IRQ_NAME=
D() and DEFINE_RES_IRQ() to simplify code)
Merging backlight/for-backlight-next (1181f2164135 backlight: lm3630a: Conv=
ert to atomic PWM API and check for errors)
Merging battery/for-next (e73f0f0ee754 Linux 5.14-rc1)
Merging regulator/for-next (cd108cb28754 Merge remote-tracking branch 'regu=
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
Merging selinux/next (893c47d1964f selinux: return early for possible NULL =
audit buffers)
Merging smack/next (fe6bde732be8 Smack: fix doc warning)
Merging tomoyo/master (4fb9c588398f Bluetooth: call lock_sock() outside of =
spinlock section)
Merging tpmdd/next (0178f9d0f60b tpm: Replace WARN_ONCE() with dev_err_once=
() in tpm_tis_status())
Merging watchdog/master (cf813c67d961 watchdog: iTCO_wdt: use dev_err() ins=
tead of pr_err())
Merging iommu/next (c987b65a574f iommu/rockchip: Fix physical address decod=
ing)
Merging audit/next (e73f0f0ee754 Linux 5.14-rc1)
Merging devicetree/for-next (fac4e24dcc56 dt-bindings: mxsfb: Add compatibl=
e for i.MX8MN)
Merging mailbox/mailbox-for-next (4f197188da66 MAINTAINERS: add entry for p=
olarfire soc mailbox)
Merging spi/for-next (890b475785ce Merge remote-tracking branch 'spi/for-5.=
15' into spi-next)
Merging tip/auto-latest (dd9ced4003dd Merge branch 'core/urgent')
Merging clockevents/timers/drivers/next (6f64c8159af9 clocksource/drivers/a=
rm_global_timer: Remove duplicated argument in arm_global_timer)
Merging edac/edac-for-next (d19faf0e49eb EDAC/amd64: Use DEVICE_ATTR helper=
 macros)
Merging irqchip/irq/irqchip-next (c51e96dace68 Merge branch irq/irqchip-dri=
ver-updates into irq/irqchip-next)
Merging ftrace/for-next (ac58f4f28369 tracing: Add trace_event helper macro=
s __string_len() and __assign_str_len())
Merging rcu/rcu/next (e107ca1a35b6 doc: Update stallwarn.rst with recent ch=
anges)
Merging kvm/next (1889228d80fe KVM: selftests: smm_test: Test SMM enter fro=
m L2)
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
CONFLICT (content): Merge conflict in include/linux/fs_context.h
Merging drivers-x86/for-next (23e9592b06b4 platform/x86: wireless-hotkey: r=
emove hardcoded "hp" from the error message)
Merging chrome-platform/for-next (6efb943b8616 Linux 5.13-rc1)
Merging hsi/for-next (e73f0f0ee754 Linux 5.14-rc1)
Merging leds/for-next (e642197562cd leds: is31fl32xx: Fix missing error cod=
e in is31fl32xx_parse_dt())
Merging ipmi/for-next (5b32dd281ee0 ipmi: kcs_bmc_aspeed: Fix less than zer=
o comparison of a unsigned int)
Merging driver-core/driver-core-next (e73f0f0ee754 Linux 5.14-rc1)
Merging usb/usb-next (97db1b081e12 dt-bindings: usb: dwc3: Update dwc3 TX f=
ifo properties)
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (e73f0f0ee754 Linux 5.14-rc1)
Merging usb-chipidea-next/for-usb-next (956df1bb0ab8 usb: chipidea: host: f=
ix port index underflow and UBSAN complains)
Merging tty/tty-next (de5540965853 Merge tag 'rtc-5.14' of git://git.kernel=
.org/pub/scm/linux/kernel/git/abelloni/linux)
Merging char-misc/char-misc-next (e73f0f0ee754 Linux 5.14-rc1)
Merging extcon/extcon-next (e73f0f0ee754 Linux 5.14-rc1)
Merging phy-next/next (e73f0f0ee754 Linux 5.14-rc1)
Merging soundwire/next (e73f0f0ee754 Linux 5.14-rc1)
Merging thunderbolt/next (b18f901382fd thunderbolt: Fix DROM handling for U=
SB4 DROM)
Merging vfio/next (6a45ece4c9af vfio/pci: Handle concurrent vma faults)
Merging staging/staging-next (e73f0f0ee754 Linux 5.14-rc1)
Merging iio/togreg (e73f0f0ee754 Linux 5.14-rc1)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (46bdcac533cc interconnect: qcom: Add SC7280 interconn=
ect provider driver)
Merging dmaengine/next (b2296eeac915 dmaengine: idxd: depends on !UML)
CONFLICT (content): Merge conflict in drivers/dma/idxd/submit.c
Merging cgroup/for-next (cfeaa699186e Merge branch 'for-5.13-fixes' into fo=
r-next)
Merging scsi/for-next (4e65a83cd0b9 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (e73f0f0ee754 Linux 5.14-rc1)
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
Merging pinctrl-renesas/renesas-pinctrl (e9d66bdbc5ab pinctrl: renesas: r8a=
77995: Add bias pinconf support)
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
Merging hyperv/hyperv-next (c445535c3efb x86/hyperv: fix for unwanted manip=
ulation of sched_clock when TSC marked unstable)
Merging auxdisplay/auxdisplay (c784e46c8445 auxdisplay: Add I2C gpio expand=
er example)
Merging kgdb/kgdb/for-next (c8daba4640ac kgdb: Fix fall-through warning for=
 Clang)
Merging hmm/hmm (fe07bfda2fb9 Linux 5.12-rc1)
Merging fpga/for-next (e4998f490675 Merge tag 'v5.14-rc1' into for-next)
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
Merging akpm/master (c7db1cdbf9d4 Merge branch 'akpm-current/current')

--Sig_/IVMVBqdPtQPGKfNKSAzg4_d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDvr90ACgkQAVBC80lX
0Gx4ewf+KsnWInqggao2K5biUdPXvkmMp7Tc8jJMJg94c6O/4i/CKxfYTbodbn9Y
5UJXKZD8KHNhFI8hEwcqO55Tfd6myKJyUsqORxuNlzSqpMbGjmBboo0NajlHvpCF
H4R0uouBwCR07kJHTnGXcPyc8YWsot3mUICePZI8oq3f/7Y+558gbOXHavNJTcZ/
jynXHyUb3pNorWSB5i+X7J4kpOOp7j1H+mvc+Pnlw8DTLpjrij6WqdSemn1kck7q
eF1QR2eFmkzqVzirnMIUvUyjsIXHvoVtIeIFUCTXQsLIagNqVZxIv35NYrM4s3f6
cpCSpr3xgd572yiA/lgsNmDy/MhBRw==
=UXr2
-----END PGP SIGNATURE-----

--Sig_/IVMVBqdPtQPGKfNKSAzg4_d--
