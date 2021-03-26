Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF1634A332
	for <lists+linux-next@lfdr.de>; Fri, 26 Mar 2021 09:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbhCZIfO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Mar 2021 04:35:14 -0400
Received: from ozlabs.org ([203.11.71.1]:50853 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229551AbhCZIfA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 26 Mar 2021 04:35:00 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F6Fdt2pnGz9sS8;
        Fri, 26 Mar 2021 19:34:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616747698;
        bh=ajD6u7ps1iRG+YrSGo2gmBG9jHR438aD7jWezMAoE5Q=;
        h=Date:From:To:Cc:Subject:From;
        b=CP2SwoXzOG9gXzLlIMDW87yMt683KSzfdWW+J6xg7mVecOnB0ASxB2ZUc081PUcM2
         pzQmgOM1PomookfmRJPo90WKmatXkzzljIW8UOc8RSP3pngGIYCry8S2vKshpCAgqK
         JxWdsVTpp3ReJacC6WQDrVhW8V4XV3nEnA+KYRxzzOhEKBNeBZmY/prN1l9BxWiafZ
         dYuespAK5FtIBHLKgHOjDlwjiyxaDmUKyI6H++fEfkU+9KGPMLJi2FfSBNu2qAlEwC
         pyYWWc80pcybAg8gWXcg6OQ0GeRFmrmlWLyGGhDDFjTLsb6L/Bz4vqpi43++SAFe2Q
         POlB60+Oe3kzg==
Date:   Fri, 26 Mar 2021 19:34:57 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 26
Message-ID: <20210326193457.7887e09e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ty8vn=6TFUONc0J+bu7XZM6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ty8vn=6TFUONc0J+bu7XZM6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210325:

The vfs tree gained a conflict against the cifs tree.

The akpm-current tree still had its its build failure but I applied a
supplied patch.

Non-merge commits (relative to Linus' tree): 6585
 6374 files changed, 408180 insertions(+), 136625 deletions(-)

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
Merging origin/master (002322402daf Merge branch 'akpm' (patches from Andre=
w))
Merging fixes/fixes (e71ba9452f0b Linux 5.11-rc2)
Merging kbuild-current/fixes (bcbcf50f5218 kbuild: fix ld-version.sh to not=
 be affected by locale)
Merging arc-current/for-curr (83520d62cc5a ARC: treewide: avoid the pointer=
 addition with NULL pointer)
Merging arm-current/fixes (30e3b4f256b4 ARM: footbridge: fix PCI interrupt =
mapping)
Merging arm64-fixes/for-next/fixes (20109a859a9b arm64: kernel: disable CNP=
 on Carmel)
Merging arm-soc-fixes/arm/fixes (67335b8d28cd Merge tag 'imx-fixes-5.12' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fixe=
s)
Merging drivers-memory-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging m68k-current/for-linus (a65a802aadba m68k: Fix virt_addr_valid() W=
=3D1 compiler warnings)
Merging powerpc-fixes/fixes (274cb1ca2e7c powerpc/pseries/mobility: handle =
premature return from H_JOIN)
Merging s390-fixes/fixes (5b43bd184530 s390/vdso: fix initializing and upda=
ting of vdso_data)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (002322402daf Merge branch 'akpm' (patches from Andrew))
Merging bpf/master (002322402daf Merge branch 'akpm' (patches from Andrew))
Merging ipsec/master (b1e3a5607034 xfrm: Fix NULL pointer dereference on po=
licy lookup)
CONFLICT (content): Merge conflict in net/ipv6/ip6_vti.c
CONFLICT (content): Merge conflict in net/ipv4/ip_vti.c
Merging netfilter/master (6ab4c3117aec net: bridge: don't notify switchdev =
for local FDB addresses)
Merging ipvs/master (b58f33d49e42 netfilter: ctnetlink: fix dump of the exp=
ect mask attribute)
Merging wireless-drivers/master (bd83a2fc05ed brcmfmac: p2p: Fix recently i=
ntroduced deadlock issue)
Merging mac80211/master (6f235a69e594 ch_ktls: fix enum-conversion warning)
Merging rdma-fixes/for-rc (3408be145a5d RDMA/cxgb4: Fix adapter LE hash err=
ors while destroying ipv6 listening server)
Merging sound-current/for-linus (e54f30befa79 ALSA: hda/realtek: call alc_u=
pdate_headset_mode() in hp_automute_hook)
Merging sound-asoc-fixes/for-linus (983b899a1f62 Merge remote-tracking bran=
ch 'asoc/for-5.12' into asoc-linus)
Merging regmap-fixes/for-linus (f29fd6d5a08d Merge remote-tracking branch '=
regmap/for-5.12' into regmap-linus)
Merging regulator-fixes/for-linus (1676953644ed Merge remote-tracking branc=
h 'regulator/for-5.12' into regulator-linus)
Merging spi-fixes/for-linus (b4ee593e2331 Merge remote-tracking branch 'spi=
/for-5.12' into spi-linus)
Merging pci-current/for-linus (cf673bd0cc97 PCI: switchtec: Fix Spectre v1 =
vulnerability)
Merging driver-core.current/driver-core-linus (f0acf637d60f driver core: cl=
ear deferred probe reason on probe retry)
Merging tty.current/tty-linus (1e28eed17697 Linux 5.12-rc3)
Merging usb.current/usb-linus (0bd860493f81 USB: quirks: ignore remote wake=
-up on Fibocom L850-GL LTE modem)
Merging usb-gadget-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging usb-serial-fixes/usb-linus (1e28eed17697 Linux 5.12-rc3)
Merging usb-chipidea-fixes/for-usb-fixes (67a788c7c3e7 usb: cdnsp: Fixes is=
sue with dequeuing requests after disabling endpoint)
Merging phy/fixes (da848f9a0e13 phy: qcom-qmp: add hbr3_hbr2 voltage and pr=
emphasis swing table)
Merging staging.current/staging-linus (e78836ae76d2 staging: rtl8192e: Chan=
ge state information from u16 to u8)
Merging char-misc.current/char-misc-linus (01faae5193d6 drivers: video: fbc=
on: fix NULL dereference in fbcon_cursor())
Merging soundwire-fixes/fixes (fde5d7f27108 soundwire: bus: Fix device foun=
d flag correctly)
Merging thunderbolt-fixes/fixes (0d02ec6b3136 Linux 5.12-rc4)
Merging input-current/for-linus (69d5ff3e9e51 Input: nspire-keypad - enable=
 interrupts only when opened)
Merging crypto-current/master (0de9dc80625b hwrng: timeriomem - Use device-=
managed registration API)
Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer)
Merging vfio-fixes/for-linus (60c988bc1541 vfio/type1: Empty batch for pfnm=
ap pages)
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
Merging mips-fixes/mips-fixes (3f6c515d7234 MIPS: vmlinux.lds.S: Fix append=
ed dtb not properly aligned)
Merging at91-fixes/at91-fixes (2c69c8a1736e ARM: dts: at91: sam9x60: fix mu=
x-mask to match product's datasheet)
Merging omap-fixes/fixes (a3efe3f6d0eb ARM: OMAP2+: Fix warning for omap_in=
it_time_of())
Merging kvm-fixes/master (9ce3746d6413 documentation/kvm: additional explan=
ations on KVM_SET_BOOT_CPU_ID)
Merging kvms390-fixes/master (735931f9a51a MAINTAINERS: add uv.c also to KV=
M/s390)
Merging hwmon-fixes/hwmon (a38fd8748464 Linux 5.12-rc2)
Merging nvdimm-fixes/libnvdimm-fixes (7018c897c2f2 libnvdimm/dimm: Avoid ra=
ce between probe and available_slots_show())
Merging btrfs-fixes/next-fixes (3b7ec4d1b5cb Merge branch 'misc-5.12' into =
next-fixes)
Merging vfs-fixes/fixes (595a48eb7b48 hostfs: fix memory handling in follow=
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
Merging scsi-fixes/fixes (36fa766faa0c scsi: target: pscsi: Clean up after =
failure in pscsi_map_sg())
Merging drm-fixes/drm-fixes (d27ce83fa4ba Merge tag 'du-fixes-20210316' of =
git://linuxtv.org/pinchartl/media into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (8840e3bd981f drm/i915: Fix th=
e GT fence revocation runtime PM logic)
Merging mmc-fixes/fixes (f06391c45e83 mmc: cqhci: Fix random crash when rem=
ove mmc module/card)
Merging rtc-fixes/rtc-fixes (bd33335aa93d rtc: cmos: Disable irq around dir=
ect invocation of cmos_interrupt())
Merging gnss-fixes/gnss-linus (a38fd8748464 Linux 5.12-rc2)
Merging hyperv-fixes/hyperv-fixes (37df9f3fedb6 video: hyperv_fb: Fix a dou=
ble free in hvfb_probe)
Merging soc-fsl-fixes/fix (2663b3388551 soc: fsl: dpio: Get the cpumask thr=
ough cpumask_of(cpu))
Merging risc-v-fixes/fixes (a5406a7ff56e riscv: Correct SPARSEMEM configura=
tion)
Merging pidfd-fixes/fixes (1e28eed17697 Linux 5.12-rc3)
Merging fpga-fixes/fixes (2e8496f31d0b firmware: stratix10-svc: reset COMMA=
ND_RECONFIG_FLAG_PARTIAL to 0)
Merging spdx/spdx-linus (88fe49249c99 Merge tag 'char-misc-5.12-rc3' of git=
://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc)
Merging gpio-brgl-fixes/gpio/for-current (6cb59afe9e5b gpiolib: Assign fwno=
de to parent's if no primary one provided)
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
Merging cel-fixes/for-rc (0d02ec6b3136 Linux 5.12-rc4)
Merging drm-misc-fixes/for-linux-next-fixes (50891bead80b drm/etnaviv: User=
 FOLL_LONGTERM in userptr)
Merging kspp-gustavo/for-next/kspp (36f9ff9e03de lib: Fix fall-through warn=
ings for Clang)
Merging kbuild/for-next (884a7fa1b090 kbuild: replace sed with $(subst ) or=
 $(patsubst ))
Merging compiler-attributes/compiler-attributes (19c329f68089 Linux 5.11-rc=
4)
Merging dma-mapping/for-next (84fcfbdadbfd dma-mapping: remove a pointless =
empty line in dma_alloc_coherent)
Merging asm-generic/master (38489db09b10 Merge branch 'asm-generic-fixes' i=
nto asm-generic)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (0ae6d1f52670 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (c2202f76bb64 Merge branches 'for-next/misc', '=
for-next/kselftest', 'for-next/xntable', 'for-next/vdso' and 'for-next/fiq'=
 into for-next/core)
Merging arm-perf/for-next/perf (9b86b1b41e0f docs: perf: Add new descriptio=
n on HiSilicon uncore PMU v2)
Merging arm-soc/for-next (a57e29abb79d soc: document merges)
Merging actions/for-next (006828d706fd Merge branch 'v5.12/defconfig' into =
for-next)
Merging amlogic/for-next (cf4b8849e4c2 Merge branch 'v5.13/dt64' into tmp/a=
ml-rebuild)
Merging aspeed/for-next (697dabd5d370 Merge branches 'soc-for-v5.12' and 'd=
t-for-v5.12' into for-next)
Merging at91/at91-next (b95bbae19954 Merge branch 'at91-fixes' into at91-ne=
xt)
Merging drivers-memory/for-next (1ca59ca0afde memory: tegra20: Add debug st=
atistics)
Merging imx-mxs/for-next (58b195fac435 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (9d2e21ed98a2 Merge branch 'for_5.12/drivers-soc' int=
o next)
Merging mediatek/for-next (e6468af3b590 Merge branch 'v5.11-next/soc' into =
for-next)
Merging mvebu/for-next (8e03d45cb7de Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (159a17f5b3a9 Merge branch 'omap-for-v5.13/dt-v2' int=
o for-next)
Merging qcom/for-next (c465fc2707c6 Merge branches 'arm64-defconfig-for-5.1=
3', 'arm64-for-5.13' and 'drivers-for-5.13' into for-next)
Merging raspberrypi/for-next (fbdcf1d20126 ARM: dts: bcm2711: Add the CEC i=
nterrupt controller)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (32b5d4bd9e51 Merge branch 'renesas-arm-dt-for-v5.13' =
into renesas-next)
Merging reset/reset/next (d4e4dffec50b reset: oxnas: replace file name with=
 short description)
Merging rockchip/for-next (3b6c3c12b77c Merge branch 'v5.13-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (151d4e8e6ccf Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (17d69bed53b4 Merge branch 'for-next/scmi' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging stm32/stm32-next (adc0496104b6 ARM: dts: stm32: Add Engicam i.Core =
STM32MP1 EDIMM2.2 Starter Kit)
Merging sunxi/sunxi/for-next (582cfdb9d206 Merge branch 'sunxi/clk-for-5.13=
' into sunxi/for-next)
Merging tegra/for-next (9e2409c6eacd Merge branch for-5.13/arm64/dt into fo=
r-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (7dd847523ed5 arm64: dts: ti: k3-am642-evm/sk:=
 Add IPC sub-mailbox nodes)
Merging clk/clk-next (9575aeae2cd1 Merge branch 'clk-cleanup' into clk-next)
Merging clk-imx/for-next (d60fe8fa6c01 clk: imx: Fix reparenting of UARTs n=
ot associated with stdout)
Merging clk-renesas/renesas-clk (dbb397ccc6bb clk: renesas: Couple of spell=
ing fixes)
Merging clk-samsung/for-next (44a9e78f9242 clk: samsung: Prevent potential =
endless loop in the PLL ops)
Merging csky/linux-next (74cdb2664477 csky: Fixup typos)
Merging h8300/h8300-next (6e5e55227c95 Merge tag 'v5.11' into h8300-next)
Merging m68k/for-next (f2e7e4bf38fd m68k: syscalls: switch to generic sysca=
llhdr.sh)
Merging m68knommu/for-next (06c5fa9b2168 m68k: fix flatmem memory model set=
up)
Merging microblaze/next (bbcee72c2f7a microblaze: Fix a typo)
Merging mips/mips-next (509d36a941a3 MIPS: loongson64: fix bug when PAGE_SI=
ZE > 16KB)
Merging nds32/next (40e0dd851e7b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (8f722f67452f openrisc: Use devicetree to determi=
ne present cpus)
Merging parisc-hd/for-next (711d090f0e02 parisc: syscalls: switch to generi=
c syscallhdr.sh)
Merging powerpc/next (fbda79043024 Merge tag 'powerpc-5.12-2' of git://git.=
kernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (e95f287deed2 soc: fsl: handle RCPM errata A-008646 on=
 SoC LS1021A)
Merging risc-v/for-next (06c7c914de26 RISC-V: enable XIP)
Merging s390/for-next (dc3b3e044f0a Merge branch 'features' into for-next)
Merging sh/for-next (2882b7626f49 sh: kernel: traps: remove unused variable)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (ddad5187fc2a um: irq.h: include <asm-generic/irq.h>)
Merging xtensa/xtensa-for-next (d0deab8fca0e xtensa: syscalls: switch to ge=
neric syscallhdr.sh)
Merging pidfd/for-next (8fac44cbbaa2 Merge branch 'fs/idmapped_mounts/helpe=
rs' into for-next)
Merging fscrypt/master (a14d0b676491 fscrypt: allow deleting files with uns=
upported encryption policy)
Merging fscache/fscache-next (42587ccf2ed5 afs: Use the fscache_write_begin=
() helper)
CONFLICT (content): Merge conflict in fs/afs/write.c
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (c7f98650557a Merge branch 'for-next-next-v5.12-2021=
0322' into for-next-20210322)
Merging ceph/master (558b4510f622 ceph: defer flushing the capsnap if the F=
b is used)
Merging cifs/for-next (4c7b707d72f5 cifs: revalidate mapping when we open f=
iles for SMB1 POSIX)
Merging cifsd/cifsd-for-next (91208e87d526 Merge pull request #34 from namj=
aejeon/cifsd-for-next)
Merging configfs/for-next (14fbbc829772 configfs: fix a use-after-free in _=
_configfs_open_file)
Merging ecryptfs/next (902af369942f ecryptfs: use DEFINE_MUTEX() for mutex =
lock)
Merging erofs/dev (f3382f3159d7 erofs: complete a missing case for inplace =
I/O)
Merging exfat/dev (f9b23f1f6ca0 exfat: speed up iterate/lookup by fixing st=
art point of traversing cluster chain)
Merging ext3/for_next (4a140c918e21 Pull fanotify cleanup from Christian)
Merging ext4/dev (64395d950bc4 ext4: initialize ret to suppress smatch warn=
ing)
Merging f2fs/dev (ca269bfadb10 f2fs: fix to avoid touching checkpointed dat=
a in get_victim())
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (0d02ec6b3136 Linux 5.12-rc4)
Merging jfs/jfs-next (b462cecfa323 fs: Fix typo issue)
Merging nfs/linux-next (0d02ec6b3136 Linux 5.12-rc4)
Merging nfs-anna/linux-next (4f8be1f53bf6 nfs: we don't support removing sy=
stem.nfs4_acl)
Merging nfsd/nfsd-next (c3213d260a23 SUNRPC: Fix oops in the rpc_xdr_buf ev=
ent class)
Merging cel/for-next (29a4e914914a svcrdma: Clean up dto_q critical section=
 in svc_rdma_recvfrom())
Merging orangefs/for-next (c1048828c3db orangefs: add splice file operation=
s)
Merging overlayfs/overlayfs-next (d46b7cd68336 ovl: plumb through flush met=
hod)
Merging ubifs/next (42119dbe571e ubifs: Fix error return code in alloc_wbuf=
s())
Merging v9fs/9p-next (324a158fe535 fs: 9p: add generic splice_write file op=
eration)
Merging xfs/for-next (8723d5ba8bda xfs: also reject BULKSTAT_SINGLE in a mo=
unt user namespace)
Merging zonefs/for-next (6980d29ce4da zonefs: fix to update .i_wr_refcnt co=
rrectly in zonefs_open_zone())
Merging iomap/iomap-for-next (5808fecc5723 iomap: Fix negative assignment t=
o unsigned sis->pages in iomap_swapfile_activate)
Merging djw-vfs/vfs-for-next (9b8523423b23 vfs: move __sb_{start,end}_write=
* to fs.h)
Merging file-locks/locks-next (b8da9b10e26c fs/locks: print full locks info=
rmation)
Merging vfs/for-next (f85ebc25fa88 Merge branch 'work.misc' into for-next)
CONFLICT (content): Merge conflict in fs/cifs/file.c
Merging printk/for-next (de9a2d6a2625 Merge branch 'for-5.13-vsprintf-pgp' =
into for-next)
Merging pci/next (55bddc9ae5fb Merge branch 'remotes/lorenzo/pci/misc')
Merging pstore/for-next/pstore (7db688e99c0f pstore/ram: Rate-limit "uncorr=
ectable error in header" message)
Merging hid/for-next (30541b02f591 Merge branch 'for-5.13/thrustmaster' int=
o for-next)
Merging i2c/i2c/for-next (2acaad748aa8 Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i3c/i3c/next (e43d5c7c3c34 dt-bindings: i3c: Fix silvaco,i3c-master=
-v1 compatible string)
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (644b9af5c605 hwmon: replace snprintf in s=
how functions with sysfs_emit)
Merging jc_docs/docs-next (8d295fbad687 kernel-doc: better handle '::' sequ=
ences)
Merging v4l-dvb/master (97b34809ec24 media: staging: atomisp: reduce kernel=
 stack usage)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging v4l-dvb-next/master (1e28eed17697 Linux 5.12-rc3)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (972d86381b18 Merge branch 'pm-em' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (c3135d28a1e0 cpufreq: dt: dev_p=
m_opp_of_cpumask_add_table() may return -EPROBE_DEFER)
Merging cpupower/cpupower (a38fd8748464 Linux 5.12-rc2)
Merging devfreq/devfreq-next (cc0a62bc9731 PM / devfreq: imx8m-ddrc: Remove=
 imx8m_ddrc_get_dev_status)
Merging opp/opp/linux-next (a8bb0e872bfb memory: samsung: exynos5422-dmc: C=
onvert to use resource-managed OPP API)
Merging thermal/thermal/linux-next (6e3e14c9385c thermal/core/power_allocat=
or: Using round the division when re-divvying up power)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (9d232469bcd7 fs: dlm: add shutdown hook)
Merging swiotlb/linux-next (2cbc2776efe4 swiotlb: remove swiotlb_nr_tbl)
Merging rdma/for-next (783cf673b05e RDMA/hns: Fix memory corruption when al=
locating XRCDN)
Merging net-next/master (6c996e19949b net: change netdev_unregister_timeout=
_secs min value to 1)
Applying: docs: nf_flowtable: fix compilation and warnings
Merging bpf-next/for-next (a46410d5e497 libbpf: Constify few bpf_program ge=
tters)
Merging ipsec-next/master (f076835a8bf2 esp6: remove a duplicative conditio=
n)
Merging mlx5-next/mlx5-next (26bf30902c10 net/mlx5: Use order-0 allocations=
 for EQs)
Merging netfilter-next/master (0ce7cf4127f1 netfilter: nftables: update tab=
le flags from the commit phase)
Merging ipvs-next/master (d4a96be65423 netfilter: conntrack: Remove unused =
variable declaration)
Merging wireless-drivers-next/master (13ce240a932f rtw88: 8822c: support FW=
 crash dump when FW crash)
Merging bluetooth/master (0f90d320b4f1 Bluetooth: Remove trailing semicolon=
 in macros)
Merging mac80211-next/master (4b837ad53be2 Merge branch 'netfilter-flowtabl=
e')
Merging gfs2/for-next (b67e76f22acf gfs2: don't create empty buffers for NO=
_CREATE)
Merging mtd/mtd/next (3ba6d1ff041f mtd: rawnand: stm32_fmc2: Fix fall-throu=
gh warnings for Clang)
Merging nand/nand/next (55fbb9ba4f06 mtd: rawnand: qcom: Return actual erro=
r code instead of -ENODEV)
Merging spi-nor/spi-nor/next (79321e752aff mtd: spi-nor: core: Update comme=
nt about the default flash parameters)
Merging crypto/master (befb1ddaece1 hwrng: cctrng - delete redundant printi=
ng of return value)
Merging drm/drm-next (06debd6e1b28 Merge tag 'drm-intel-next-2021-03-16' of=
 git://anongit.freedesktop.org/drm/drm-intel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/omapdrm/dss/dsi.c
Applying: merge fix for "drm: Switch to %p4cc format modifier"
Merging drm-misc/for-linux-next (ce517f18944e drm: bridge: Add Chipone ICN6=
211 MIPI-DSI to RGB bridge)
Merging amdgpu/drm-next (d41c3b15e910 drm/amdgpu/pm: mark pcie link/speed a=
rrays as const)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/smu11/va=
ngogh_ppt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/smu11/sm=
u_v11_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/powerplay/hwmg=
r/vega20_hwmgr.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/powerplay/hwmg=
r/vega12_hwmgr.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/powerplay/hwmg=
r/vega10_hwmgr.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/irq/dc=
n21/irq_service_dcn21.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dcn301=
/dcn301_resource.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_dev=
ice.c
Merging drm-intel/for-linux-next (93fe86281259 drm/i915: Fix transposed arg=
uments to skl_plane_wm_level())
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dp=
_link_training.c
Merging drm-tegra/drm/tegra/for-next (09f5220aa699 drm/tegra: dc: Don't set=
 PLL clock to 0Hz)
Merging drm-msm/msm-next (627dc55c273d drm/msm/disp/dpu1: icc path needs to=
 be set before dpu runtime resume)
Merging imx-drm/imx-drm/next (82581fcf070b drm/modes: add non-OF stub for o=
f_get_drm_display_mode)
Merging etnaviv/etnaviv/next (7d614ab2f205 drm/etnaviv: fix NULL check befo=
re some freeing functions is not needed)
Merging regmap/for-next (5af7bd5b148a Merge remote-tracking branch 'regmap/=
for-5.13' into regmap-next)
Merging sound/for-next (e839fbed26e8 ALSA: hda/hdmi: fix max DP-MST dev_num=
 for Intel TGL+ platforms)
Merging sound-asoc/for-next (3cac585bcd41 Merge remote-tracking branch 'aso=
c/for-5.13' into asoc-next)
Merging modules/modules-next (1e80d9cb579e module: potential uninitialized =
return in module_kallsyms_on_each_symbol())
Merging input/next (bfcf3d48dd02 Input: elan_i2c - fix a typo in parameter =
name)
Merging block/for-next (e69563db16fc Merge branch 'for-5.13/drivers' into f=
or-next)
Merging device-mapper/for-next (625e61dbd65d dm integrity: add the "reset_r=
ecalculate" feature flag)
Merging pcmcia/pcmcia-next (e9d503fef7da pcmcia: rsrc_nonstatic: Fix call-b=
ack function as reference formatting)
Merging mmc/next (b7b2feb44c61 mmc: sdhci: replace mmc->parent with mmc_dev=
() for consistency)
Merging mfd/for-mfd-next (105cbb01200c mfd: intel_quark_i2c_gpio: Reuse BAR=
 definitions for MFD cell indexing)
Merging backlight/for-backlight-next (225be60f3853 dt-bindings: backlight: =
qcom-wled: Add PMI8994 compatible)
Merging battery/for-next (3aeaf5093809 power: reset: replace curly brackets=
 in Makefile)
Merging regulator/for-next (1baf2b66e886 Merge remote-tracking branch 'regu=
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
Merging tomoyo/master (fe07bfda2fb9 Linux 5.12-rc1)
Merging tpmdd/next (8b12a62a4e3e Merge tag 'drm-fixes-2021-03-19' of git://=
anongit.freedesktop.org/drm/drm)
Merging watchdog/master (1e28eed17697 Linux 5.12-rc3)
Merging iommu/next (7851dfc68810 Merge branches 'iommu/fixes', 'unisoc', 'x=
86/vt-d' and 'core' into next)
Merging audit/next (d4ceb1d6e732 audit: avoid -Wempty-body warning)
Merging devicetree/for-next (592485bcb567 devicetree: bindings: clock: Mino=
r typo fix in the file armada3700-tbg-clock.txt)
Merging mailbox/mailbox-for-next (6b50df2b8c20 mailbox: arm_mhuv2: Skip cal=
ling kfree() with invalid pointer)
Merging spi/for-next (811ba6ea42f6 Merge remote-tracking branch 'spi/for-5.=
13' into spi-next)
Merging tip/auto-latest (4f469efcd03f Merge branch 'core/entry')
Applying: x86: fix up for "bpf: Use NOP_ATOMIC5 instead of emit_nops(&prog,=
 5) for BPF_TRAMP_F_CALL_ORIG"
Merging clockevents/timers/drivers/next (323397ef4d00 clocksource/drivers/d=
w_apb_timer_of: Add handling for potential memory leak)
Merging edac/edac-for-next (faf042d15093 Merge branch 'edac-amd64' into eda=
c-for-next)
Merging irqchip/irq/irqchip-next (5fbecd2389f4 irqchip/ingenic: Add support=
 for the JZ4760)
Merging ftrace/for-next (9a6944fee68e tracing: Add a verifier to check stri=
ng pointers for trace events)
CONFLICT (content): Merge conflict in arch/x86/kernel/kprobes/ftrace.c
Merging rcu/rcu/next (1a0dfc099c1e rcu-tasks: Make ksoftirqd provide RCU Ta=
sks quiescent states)
Merging kvm/next (4a98623d5d90 KVM: x86/mmu: Mark the PAE roots as decrypte=
d for shadow paging)
Merging kvm-arm/next (40acb795bffd Merge branch 'kvm-arm64/host-stage2' int=
o kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (72476aaa4691 KVM: PPC: Book3S HV: Fix host ra=
dix SLB optimisation with hash guests)
Merging kvms390/next (c3171e94cc1c KVM: s390: VSIE: fix MVPG handling for p=
refixing and MSO)
Merging xen-tip/linux-next (af44a387e743 Revert "xen: fix p2m size in dom0 =
for disabled memory hotplug case")
Merging percpu/for-next (df1c002198a8 Merge branch 'for-5.12' into for-next)
Merging workqueues/for-next (a7347aa8e061 workqueue: Move the position of d=
ebug_work_activate() in __queue_work())
Merging drivers-x86/for-next (36974daf5388 platform/x86: intel_pmc_core: Ig=
nore GBE LTR on Tiger Lake platforms)
CONFLICT (content): Merge conflict in drivers/platform/x86/thinkpad_acpi.c
Merging chrome-platform/for-next (a38fd8748464 Linux 5.12-rc2)
Merging hsi/for-next (aa57e77b3d28 HSI: Fix PM usage counter unbalance in s=
si_hw_init)
Merging leds/for-next (34a6ae672645 leds: Kconfig: LEDS_CLASS is usually se=
lected.)
Merging ipmi/for-next (c053c4eb5a0f ipmi: Handle device properties with sof=
tware node API)
Merging driver-core/driver-core-next (a7d30f3f41cf watchdog: retu_wdt: Clea=
n-up by using managed work init)
Merging usb/usb-next (049d3db625a6 usb: gadget: pch_udc: Provide a GPIO lin=
e used on Intel Minnowboard (v1))
Merging usb-gadget/next (a38fd8748464 Linux 5.12-rc2)
Merging usb-serial/usb-next (764de1059b97 USB: serial: pl2303: TA & TB alte=
rnate divider with non-standard baud rates)
Merging usb-chipidea-next/for-usb-next (c8ad0f64b7e0 usb: chipidea: tegra: =
Silence deferred probe error)
CONFLICT (content): Merge conflict in drivers/usb/typec/tipd/core.c
Merging tty/tty-next (22fce66c19ca tty: vt: Mundane typo fix in the file vt=
.c)
Merging char-misc/char-misc-next (95e04eb04c68 char: lp: remove redundant s=
pace around (inside) parenthesized expressions)
Merging extcon/extcon-next (cf947ad92675 extcon: qcom-spmi: Add support for=
 VBUS detection)
Merging phy-next/next (0d811cda22ab phy: qualcomm: remove duplicate argumen=
t)
Merging soundwire/next (e6cb15b50065 soundwire: qcom: add missing \n in dev=
_err())
Merging thunderbolt/next (2e7a5b3e2236 thunderbolt: Unlock on error path in=
 tb_domain_add())
Merging vfio/next (4d83de6da265 vfio/type1: Batch page pinning)
Merging staging/staging-next (d010995736cb staging: rtl8723bs: remove blank=
 line os_dep/os_intfs.c)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (57bfc3abd8e5 Merge branch 'icc-fixes' into icc-next)
Merging dmaengine/next (84b0aa2e0d91 dmaengine: dw-edma: Add pcim_iomap_tab=
le return check)
Merging cgroup/for-next (00bfa16052cd Merge branch 'for-5.11-fixes' into fo=
r-next)
Merging scsi/for-next (213ce3262eda Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (c2255ece2be2 scsi: pm8001: Avoid -Wrestrict warn=
ing)
Merging vhost/linux-next (723c7003c1ab vdpa: introduce virtio pci driver)
Merging rpmsg/for-next (2c2564b9d64d Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (deecc4d162c8 gpio: mockup: Adjust document=
ation to the code)
Merging gpio-intel/for-next (12484a4ecc92 gpio: sch: Hook into ACPI GPE han=
dler to catch GPIO edge events)
Merging pinctrl/for-next (b9fd814e2c5d Merge branch 'devel' into for-next)
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
Merging kselftest/next (a38fd8748464 Linux 5.12-rc2)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (81840f21d416 Merge branch 'for-5.12/doc' int=
o for-next)
Merging coresight/next (1efbcec2ef8c coresight: cti: Reduce scope for the v=
ariable =E2=80=9Ccs_fwnode=E2=80=9D in cti_plat_create_connection())
Merging rtc/rtc-next (8d69f62fddf6 rtc: rx6110: add ACPI bindings to I2C)
Merging nvdimm/libnvdimm-for-next (30c10d32152d Merge branch 'for-5.12/cxl'=
 into libnvdimm-for-next)
Merging at24/at24/for-next (fe07bfda2fb9 Linux 5.12-rc1)
Merging ntb/ntb-next (5c8fe583cce5 Linux 5.11-rc1)
Merging seccomp/for-next/seccomp (15a2fd51384a seccomp: fix the cond to rep=
ort loaded filters)
Merging kspp/for-next/kspp (414eece95b98 Merge tag 'clang-lto-v5.12-rc1-par=
t2' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging gnss/gnss-next (994adcbd3714 gnss: drop stray semicolons)
Merging fsi/next (4a851d714ead fsi: aspeed: Support CFAM reset GPIO)
Merging slimbus/for-next (0320ed0a8236 drivers: slimbus: Fix word resposibl=
e -> responsible in slimbus.h)
CONFLICT (content): Merge conflict in drivers/nvmem/Kconfig
Merging nvmem/for-next (5350a8500263 nvmem: rmem: fix undefined reference t=
o memremap)
Merging xarray/main (80c1dbebf308 XArray: Fix splitting to non-zero orders)
Merging hyperv/hyperv-next (6dc2a774cb4f x86/Hyper-V: Support for free page=
 reporting)
CONFLICT (content): Merge conflict in arch/x86/include/asm/mshyperv.h
Applying: fix up for "x86/paravirt: Switch time pvops functions to use stat=
ic_call()"
Merging auxdisplay/auxdisplay (701454bce906 auxdisplay: Remove in_interrupt=
() usage.)
Merging kgdb/kgdb/for-next (2bbd9b0f2b4e kernel: debug: Ordinary typo fixes=
 in the file gdbstub.c)
Merging hmm/hmm (fe07bfda2fb9 Linux 5.12-rc1)
Merging fpga/for-next (9a8d3cda8daf fpga: dfl: afu: harden port enable logi=
c)
Merging kunit/test (a38fd8748464 Linux 5.12-rc2)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (a38fd8748464 Linux 5.12-rc2)
Merging kunit-next/kunit (2f9f21cdcd71 kunit: Match parenthesis alignment t=
o improve code readability)
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (9e40641f62cd bus: mhi: core: Check state before proce=
ssing power_down)
Merging memblock/for-next (097d43d85704 mm: memblock: remove return value o=
f memblock_free_all())
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (e71ba9452f0b Linux 5.11-rc2)
Merging iomem-mmap-vs-gup/topic/iomem-mmap-vs-gup (4c23541929b7 mm: unexpor=
t follow_pfn)
Merging rust/rust-next (98898dfbdf72 Rust support)
CONFLICT (content): Merge conflict in Makefile
Merging akpm-current/current (f466a65c17d8 mm, page_alloc: avoid page_to_pf=
n() in move_freepages())
CONFLICT (content): Merge conflict in arch/x86/mm/init_64.c
CONFLICT (content): Merge conflict in Documentation/admin-guide/kernel-para=
meters.txt
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (70a8df67d31f secretmem: test: add basic selftest for m=
emfd_secret(2))
Applying: Revert "kernel-doc: better handle '::' sequences"

--Sig_/Ty8vn=6TFUONc0J+bu7XZM6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBdnLEACgkQAVBC80lX
0GzT3wf6A0gdUP77rvxkWqzR8Z0WxlMvEkptwH2+FhjPvhH7GjSuFxOBe/PJZJWT
vxJl7Xn3h/q0d37TeoKXGTjILclp3yWYSmclwUDo9kHham0jrHUwiFbtqD1r24xy
E54EjxRnUXecDimSV1AkUC9WnXOALawOm/r6djzmuZitzpNFjJaGNb2/rpI/dlB1
VF5kV1139d7zSpBYnsKj29Fk/8DOZujiLxHK7yVMLsiVKLnAWe8DHtu+lTrzduTb
uhP0IfGOYZVe0drHf7PFuBLEyQ2IQcoQkOGnyXdyMz+r8ugyz8bP+SpiWMhYOFgQ
7CHt72heocDH/NphdkJS6sn4nIKuRw==
=rYan
-----END PGP SIGNATURE-----

--Sig_/Ty8vn=6TFUONc0J+bu7XZM6--
