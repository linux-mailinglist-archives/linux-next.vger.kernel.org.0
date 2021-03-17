Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE1A033EBC0
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 09:43:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbhCQInN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 04:43:13 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42187 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229561AbhCQImr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 17 Mar 2021 04:42:47 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F0kDy3m3cz9sVb;
        Wed, 17 Mar 2021 19:42:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615970562;
        bh=19QPFrVmREz4hwKkpn9ZDqDaRKn4jnlhEAa5G2kInNU=;
        h=Date:From:To:Cc:Subject:From;
        b=Oy9EMl0cAenjfKnFb1V8nJWH6OU8BbZRsE+TgaBZfh3jCOhRDzhDKKOnxNZNFY7Ri
         1vTvaS6l2FvhEU7+7/zLy2ZTyoiK/FlQ8CgS3rveTBKLtOL4xrBDJfHltlDRxyRMrc
         DX1yWOcAMSR23/P4Slc4VyGE3oD11xcTDx04OaLzyK6Gi0Cu6zxU6i0PezupSxm76p
         gopFBcUJLy+vsCT4mPZWO/oZVH3CLfME+ixRUsEG5VYANHPMzbvq2DnWE/oWHKxDE0
         FUnCgemqLfxER9wzpFPEl2/R0g2MK/iqPyKh31Mrv7XxUHpq4tq/lX2L615yP12cW6
         6qaMPJUHEK9kg==
Date:   Wed, 17 Mar 2021 19:42:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 17
Message-ID: <20210317194241.1bf057bd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DloLgESZePtmr.OUmwIh4Nw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DloLgESZePtmr.OUmwIh4Nw
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

News: there will be no linux-next release on Friday this week.

Warning: Some of the branches in linux-next are still based on v5.12-rc1,
so please be careful if you are trying to bisect a bug.

News: if your -next included tree is based on Linus' tree tag
v5.12-rc1{,-dontuse} (or somewhere between v5.11 and that tag), please
consider rebasing it onto v5.12-rc2. Also, please check any branches
merged into your branch.

Changes since 20210316:

New tree: cifsd

The cifsd tree gained a build failure for which I applied a patch.

The drm-intel tree gained a conflict against the drm tree.

The tip tree gained a build failure so I used the version from
next-20210316.

The rcu tree gained a build failure so I used the version from
next-20210316.

Non-merge commits (relative to Linus' tree): 4404
 4125 files changed, 288074 insertions(+), 79674 deletions(-)

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

I am currently merging 334 trees (counting Linus' and 87 trees of bug
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
Merging origin/master (1df27313f50a Merge tag 'fuse-fixes-5.12-rc4' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse)
Merging fixes/fixes (e71ba9452f0b Linux 5.11-rc2)
Merging kbuild-current/fixes (bcbcf50f5218 kbuild: fix ld-version.sh to not=
 be affected by locale)
Merging arc-current/for-curr (7c53f6b671f4 Linux 5.11-rc3)
Merging arm-current/fixes (a38fd8748464 Linux 5.12-rc2)
Merging arm64-fixes/for-next/fixes (0710442a88d1 arm64: csum: cast to the p=
roper type)
Merging arm-soc-fixes/arm/fixes (090e502e4e63 Merge tag 'socfpga_dts_fix_fo=
r_v5.12' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux in=
to arm/fixes)
Merging drivers-memory-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging m68k-current/for-linus (a65a802aadba m68k: Fix virt_addr_valid() W=
=3D1 compiler warnings)
Merging powerpc-fixes/fixes (eed5fae00593 powerpc: Force inlining of cpu_ha=
s_feature() to avoid build failure)
Merging s390-fixes/fixes (0b13525c20fe s390/pci: fix leak of PCI device str=
ucture)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (fc649670ba50 MAINTAINERS: Update Spidernet network driv=
er)
Merging bpf/master (31254dc95662 selftests/bpf: Set gopt opt_class to 0 if =
get tunnel opt failed)
Merging ipsec/master (9ab1265d5231 xfrm: Use actual socket sk instead of sk=
b socket for xfrm_output_resume)
CONFLICT (content): Merge conflict in net/ipv6/ip6_vti.c
CONFLICT (content): Merge conflict in net/ipv4/ip_vti.c
Merging netfilter/master (b58f33d49e42 netfilter: ctnetlink: fix dump of th=
e expect mask attribute)
Merging ipvs/master (a25f82228542 flow_dissector: fix byteorder of dissecte=
d ICMP ID)
Merging wireless-drivers/master (05a59d79793d Merge git://git.kernel.org:/p=
ub/scm/linux/kernel/git/netdev/net)
Merging mac80211/master (239729a21e52 wireless/nl80211: fix wdev_id may be =
used uninitialized)
Merging rdma-fixes/for-rc (22053df0a364 RDMA/mlx5: Fix typo in destroy_mkey=
 inbox)
Merging sound-current/for-linus (53b861bec737 ALSA: hda/realtek: fix mute/m=
icmute LEDs for HP 850 G8)
Merging sound-asoc-fixes/for-linus (8d077da870e7 Merge remote-tracking bran=
ch 'asoc/for-5.12' into asoc-linus)
Merging regmap-fixes/for-linus (e41a962f82e7 regmap: set debugfs_name to NU=
LL after it is freed)
Merging regulator-fixes/for-linus (595bd434897b Merge remote-tracking branc=
h 'regulator/for-5.12' into regulator-linus)
Merging spi-fixes/for-linus (55fe2317357c Merge remote-tracking branch 'spi=
/for-5.12' into spi-linus)
Merging pci-current/for-linus (6af60eb39df3 MAINTAINERS: Update PCI patchwo=
rk to kernel.org instance)
Merging driver-core.current/driver-core-linus (1e28eed17697 Linux 5.12-rc3)
Merging tty.current/tty-linus (1e28eed17697 Linux 5.12-rc3)
Merging usb.current/usb-linus (eb9238e53717 Merge tag 'usb-v5.12-rc4' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb into usb-linus)
Merging usb-gadget-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging usb-serial-fixes/usb-linus (1e28eed17697 Linux 5.12-rc3)
Merging usb-chipidea-fixes/for-usb-fixes (d0dcd90b7f47 usb: cdnsp: Fixes in=
correct value in ISOC TRB)
Merging phy/fixes (07789dc33f6f phy: ingenic: Fix a typo in ingenic_usb_phy=
_probe())
Merging staging.current/staging-linus (d2d106fe3bad staging: comedi: cb_pci=
das64: fix request_irq() warn)
Merging char-misc.current/char-misc-linus (e01b7d04a61c Merge tag 'extcon-f=
ixes-for-5.12-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo=
/extcon into char-misc-next)
Merging soundwire-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging thunderbolt-fixes/fixes (c94732bda079 thunderbolt: Increase runtime=
 PM reference count on DP tunnel discovery)
Merging input-current/for-linus (2d8aaa1720c6 Input: n64joy - fix return va=
lue check in n64joy_probe())
Merging crypto-current/master (0de9dc80625b hwrng: timeriomem - Use device-=
managed registration API)
Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer)
Merging vfio-fixes/for-linus (4ab4fcfce5b5 vfio/type1: fix vaddr_get_pfns()=
 return in vfio_pin_page_external())
Merging kselftest-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging dmaengine-fixes/fixes (868833fbffbe dmaengine: xilinx: dpdma: Fix r=
ace condition in done IRQ)
Merging backlight-fixes/for-backlight-fixes (a38fd8748464 Linux 5.12-rc2)
Merging mtd-fixes/mtd/fixes (2fb164f0ce95 mtd: rawnand: mtk: Fix WAITRDY br=
eak condition and timeout)
Merging mfd-fixes/for-mfd-fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging v4l-dvb-fixes/fixes (2025a48cfd92 media: rkisp1: params: fix wrong =
bits settings)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (3f6c515d7234 MIPS: vmlinux.lds.S: Fix append=
ed dtb not properly aligned)
Merging at91-fixes/at91-fixes (2c69c8a1736e ARM: dts: at91: sam9x60: fix mu=
x-mask to match product's datasheet)
Merging omap-fixes/fixes (4c9f4865f460 Merge branch 'fixes-rc2' into fixes)
Merging kvm-fixes/master (1e28eed17697 Linux 5.12-rc3)
Merging kvms390-fixes/master (735931f9a51a MAINTAINERS: add uv.c also to KV=
M/s390)
Merging hwmon-fixes/hwmon (a38fd8748464 Linux 5.12-rc2)
Merging nvdimm-fixes/libnvdimm-fixes (7018c897c2f2 libnvdimm/dimm: Avoid ra=
ce between probe and available_slots_show())
Merging btrfs-fixes/next-fixes (3b7ec4d1b5cb Merge branch 'misc-5.12' into =
next-fixes)
Merging vfs-fixes/fixes (d36a1dd9f77a dump_common_audit_data(): fix racy ac=
cesses to ->d_name)
Merging dma-mapping-fixes/for-linus (d17405d52bac dma-mapping: benchmark: f=
ix kernel crash when dma_map_single fails)
Merging i3c-fixes/i3c/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging drivers-x86-fixes/fixes (56678a5f44ef platform/x86: intel-hid: Supp=
ort Lenovo ThinkPad X1 Tablet Gen 2)
Merging samsung-krzk-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging pinctrl-samsung-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging devicetree-fixes/dt/linus (8242ff9ea9f0 dt-bindings: display: media=
tek,dpi: Convert to use graph schema)
Merging scsi-fixes/fixes (19f1bc7edf0f scsi: lpfc: Fix some error codes in =
debugfs)
Merging drm-fixes/drm-fixes (1e28eed17697 Linux 5.12-rc3)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (c3d2c6770b4b drm/i915: Wedge =
the GPU if command parser setup fails)
Merging mmc-fixes/fixes (f06391c45e83 mmc: cqhci: Fix random crash when rem=
ove mmc module/card)
Merging rtc-fixes/rtc-fixes (bd33335aa93d rtc: cmos: Disable irq around dir=
ect invocation of cmos_interrupt())
Merging gnss-fixes/gnss-linus (a38fd8748464 Linux 5.12-rc2)
Merging hyperv-fixes/hyperv-fixes (a22662138477 Drivers: hv: vmbus: Drop er=
ror message when 'No request id available')
Merging soc-fsl-fixes/fix (2663b3388551 soc: fsl: dpio: Get the cpumask thr=
ough cpumask_of(cpu))
Merging risc-v-fixes/fixes (0d7588ab9ef9 riscv: process: Fix no prototype f=
or arch_dup_task_struct)
Merging pidfd-fixes/fixes (1e28eed17697 Linux 5.12-rc3)
Merging fpga-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging spdx/spdx-linus (88fe49249c99 Merge tag 'char-misc-5.12-rc3' of git=
://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc)
Merging gpio-brgl-fixes/gpio/for-current (6cb59afe9e5b gpiolib: Assign fwno=
de to parent's if no primary one provided)
Merging gpio-intel-fixes/fixes (b41ba2ec54a7 gpiolib: Read "gpio-line-names=
" from a firmware node)
Merging pinctrl-intel-fixes/fixes (77e141266c8e pinctrl: intel: Show the GP=
IO base calculation explicitly)
Merging erofs-fixes/fixes (9f377622a484 erofs: fix bio->bi_max_vecs behavio=
r change)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (d3baf3a6e313 kunit: Match parenthesis alig=
nment to improve code readability)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (17cbe03872be mm/memblock: Fix typo in comment=
 of memblock_phys_alloc_try_nid())
Merging cel-fixes/for-rc (bade4be69a6e svcrdma: Revert "svcrdma: Reduce Rec=
eive doorbell rate")
Merging drm-misc-fixes/for-linux-next-fixes (6c5403173a13 drm/ttm: make ttm=
_bo_unpin more defensive)
Merging kspp-gustavo/for-next/kspp (36f9ff9e03de lib: Fix fall-through warn=
ings for Clang)
Merging kbuild/for-next (45caa853b483 docs: kbuild: Fix a typo in the file =
Kconfig.recursion-issue-02)
Merging compiler-attributes/compiler-attributes (19c329f68089 Linux 5.11-rc=
4)
Merging dma-mapping/for-next (66d84557d4ae dma-mapping: remove a pointless =
empty line in dma_alloc_coherent)
Merging asm-generic/master (38489db09b10 Merge branch 'asm-generic-fixes' i=
nto asm-generic)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (08cbcb970256 ARM: 9060/1: kexec: Remove unused kexec_=
reinit callback)
Merging arm64/for-next/core (98c5ec77c7c5 ARM64: enable GENERIC_FIND_FIRST_=
BIT)
Merging arm-perf/for-next/perf (f0c140481d1b perf: Constify static struct a=
ttribute_group)
Merging arm-soc/for-next (e6c44b8c57c9 soc: document merges)
Merging actions/for-next (006828d706fd Merge branch 'v5.12/defconfig' into =
for-next)
Merging amlogic/for-next (1c459c4d568d Merge branch 'v5.13/dt64' into tmp/a=
ml-rebuild)
Merging aspeed/for-next (697dabd5d370 Merge branches 'soc-for-v5.12' and 'd=
t-for-v5.12' into for-next)
Merging at91/at91-next (b95bbae19954 Merge branch 'at91-fixes' into at91-ne=
xt)
Merging drivers-memory/for-next (7db9ddae1371 memory: tegra: replace DEFINE=
_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE)
Merging imx-mxs/for-next (8b5531915cf2 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (9d2e21ed98a2 Merge branch 'for_5.12/drivers-soc' int=
o next)
Merging mediatek/for-next (e6468af3b590 Merge branch 'v5.11-next/soc' into =
for-next)
Merging mvebu/for-next (8e03d45cb7de Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (4c9f4865f460 Merge branch 'fixes-rc2' into fixes)
Merging qcom/for-next (c4ec09c0c114 Merge branches 'arm64-defconfig-for-5.1=
3', 'arm64-for-5.13' and 'drivers-for-5.13' into for-next)
Merging raspberrypi/for-next (fbdcf1d20126 ARM: dts: bcm2711: Add the CEC i=
nterrupt controller)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (ca7b445e2e7b Merge branch 'renesas-arm-dt-for-v5.13' =
into renesas-next)
Merging reset/reset/next (d4e4dffec50b reset: oxnas: replace file name with=
 short description)
Merging rockchip/for-next (38051549ac38 Merge branch 'v5.12-clk/next' into =
for-next)
Merging samsung-krzk/for-next (e52a6d1c770f Merge branch 'next/soc' into fo=
r-next)
Merging scmi/for-linux-next (e35458f4e094 Merge branch 'for-next/scmi' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging stm32/stm32-next (adc0496104b6 ARM: dts: stm32: Add Engicam i.Core =
STM32MP1 EDIMM2.2 Starter Kit)
Merging sunxi/sunxi/for-next (582cfdb9d206 Merge branch 'sunxi/clk-for-5.13=
' into sunxi/for-next)
Merging tegra/for-next (b62f4a3fbb22 Merge branch for-5.12/arm64/defconfig =
into for-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (e180f76d0641 arm64: dts: ti: Add support for =
Siemens IOT2050 boards)
Merging clk/clk-next (9575aeae2cd1 Merge branch 'clk-cleanup' into clk-next)
Merging clk-renesas/renesas-clk (0eedab655ec1 clk: renesas: r8a779a0: Add C=
MT clocks)
Merging clk-samsung/for-next (44a9e78f9242 clk: samsung: Prevent potential =
endless loop in the PLL ops)
Merging csky/linux-next (74cdb2664477 csky: Fixup typos)
Merging h8300/h8300-next (6e5e55227c95 Merge tag 'v5.11' into h8300-next)
Merging m68k/for-next (f2e7e4bf38fd m68k: syscalls: switch to generic sysca=
llhdr.sh)
Merging m68knommu/for-next (25edc7bb6fd6 m68k: fix flatmem memory model set=
up)
Merging microblaze/next (9dc12e4ccd97 microblaze: tag highmem_setup() with =
__meminit)
Merging mips/mips-next (63d6c9816891 mips: kernel: use DEFINE_DEBUGFS_ATTRI=
BUTE with debugfs_create_file_unsafe())
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
Merging risc-v/for-next (9530141455c9 riscv: Add ARCH_HAS_FORTIFY_SOURCE)
Merging s390/for-next (ead47b5ba4e2 Merge branch 'fixes' into for-next)
Merging sh/for-next (2882b7626f49 sh: kernel: traps: remove unused variable)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (ddad5187fc2a um: irq.h: include <asm-generic/irq.h>)
Merging xtensa/xtensa-for-next (d0deab8fca0e xtensa: syscalls: switch to ge=
neric syscallhdr.sh)
Merging pidfd/for-next (f69e8091c4a2 xfs: remove the possibly unused mp var=
iable in xfs_file_compat_ioctl)
Merging fscrypt/master (a14d0b676491 fscrypt: allow deleting files with uns=
upported encryption policy)
Merging fscache/fscache-next (42587ccf2ed5 afs: Use the fscache_write_begin=
() helper)
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (5b04043e7938 Merge branch 'for-next-next-v5.12-2021=
0316' into for-next-20210316)
CONFLICT (content): Merge conflict in fs/btrfs/extent-tree.c
CONFLICT (content): Merge conflict in fs/btrfs/ctree.c
Merging ceph/master (558b4510f622 ceph: defer flushing the capsnap if the F=
b is used)
Merging cifs/for-next (05946d4b7a73 cifs: Fix preauth hash corruption)
Merging cifsd/cifsd-for-next (47fba6d39be5 cifsd: fix warning: variable 'pr=
oto' set but not used)
Merging configfs/for-next (14fbbc829772 configfs: fix a use-after-free in _=
_configfs_open_file)
Merging ecryptfs/next (902af369942f ecryptfs: use DEFINE_MUTEX() for mutex =
lock)
Merging erofs/dev (f8e769f77403 erofs: avoid memory allocation failure duri=
ng rolling decompression)
Merging exfat/dev (a403e793cb41 exfat: add support ioctl and FITRIM functio=
n)
Merging ext3/for_next (4c8e583da146 Pull quotactl_path(2) support from Sash=
a.)
Merging ext4/dev (73648622c60a ext4: fix bh ref count on error paths)
Merging f2fs/dev (50fe0f646eb2 f2fs: fix to use per-inode maxbytes in f2fs_=
fiemap)
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (f8425c939663 fuse: 32-bit user space ioctl compat fo=
r fuse device)
Merging jfs/jfs-next (c03c21ba6f4e Merge tag 'keys-misc-20210126' of git://=
git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs)
Merging nfs/linux-next (1e28eed17697 Linux 5.12-rc3)
Merging nfs-anna/linux-next (4f8be1f53bf6 nfs: we don't support removing sy=
stem.nfs4_acl)
Merging nfsd/nfsd-next (c3213d260a23 SUNRPC: Fix oops in the rpc_xdr_buf ev=
ent class)
Merging cel/for-next (210b6f5edec3 svcrdma: Clean up dto_q critical section=
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
Merging zonefs/for-next (55d6da21d08f zonefs: Fix O_APPEND async write hand=
ling)
Merging iomap/iomap-for-next (5808fecc5723 iomap: Fix negative assignment t=
o unsigned sis->pages in iomap_swapfile_activate)
Merging djw-vfs/vfs-for-next (9b8523423b23 vfs: move __sb_{start,end}_write=
* to fs.h)
Merging file-locks/locks-next (b8da9b10e26c fs/locks: print full locks info=
rmation)
Merging vfs/for-next (1f081146def4 Merge branches 'work.recursive_removal' =
and 'work.coredump' into for-next)
Merging printk/for-next (4e16cd8fae2f Merge branch 'printk-rework' into for=
-next)
Merging pci/next (9c70dfb47633 Merge branch 'pci/misc')
Merging pstore/for-next/pstore (7db688e99c0f pstore/ram: Rate-limit "uncorr=
ectable error in header" message)
Merging hid/for-next (bd09e71c5905 Merge branch 'for-5.12/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (fe07bfda2fb9 Linux 5.12-rc1)
Merging i3c/i3c/next (436cb709f8a9 i3c: master: svc: remove redundant assig=
nment to cmd->read_len)
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (d8a085852592 hwmon: (pmbus/stpddc60) Add =
ST STPDDC60 pmbus driver)
Merging jc_docs/docs-next (a8f2a68e42d1 Documentation: sysrq: update descri=
ption about sysrq crash)
Merging v4l-dvb/master (1cb3ff130f4d media: imx: imx7_mipi_csis: Print shad=
ow registers in mipi_csis_dump_regs())
Merging v4l-dvb-next/master (d0a9fffedca1 docs: fs: api-summary.rst: get ri=
d of kernel-doc include)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_dp_helper.c
CONFLICT (content): Merge conflict in MAINTAINERS
CONFLICT (content): Merge conflict in Documentation/dev-tools/kasan.rst
CONFLICT (content): Merge conflict in Documentation/conf.py
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (1a7a93e88ae2 Merge branch 'acpi-drivers' into linux-=
next)
Merging cpufreq-arm/cpufreq/arm/linux-next (5f50ed6e60a8 cpufreq: cppc: sim=
plify default delay_us setting)
Merging cpupower/cpupower (a38fd8748464 Linux 5.12-rc2)
Merging devfreq/devfreq-next (5983f89cfcc3 PM / devfreq: Check get_dev_stat=
us in devfreq_update_stats)
Merging opp/opp/linux-next (834c0dfcec64 memory: samsung: exynos5422-dmc: C=
onvert to use resource-managed OPP API)
Merging thermal/thermal/linux-next (6e3e14c9385c thermal/core/power_allocat=
or: Using round the division when re-divvying up power)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (9d232469bcd7 fs: dlm: add shutdown hook)
Merging swiotlb/linux-next (a38fd8748464 Linux 5.12-rc2)
Merging rdma/for-next (7610ab57de56 RDMA/mlx5: Allow larger pages in DevX u=
mem)
Merging net-next/master (ebfbc46b35cb openvswitch: Warn over-mtu packets on=
ly if iface is UP.)
Merging bpf-next/for-next (56901d483bf1 selftests/bpf: Use nanosleep() sysc=
all instead of sleep() in get_cgroup_id)
Merging ipsec-next/master (f076835a8bf2 esp6: remove a duplicative conditio=
n)
Merging mlx5-next/mlx5-next (26bf30902c10 net/mlx5: Use order-0 allocations=
 for EQs)
Merging netfilter-next/master (0f13b5e6bf28 net: ipa: make ipa_table_hash_s=
upport() inline)
Merging ipvs-next/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/=
linux/kernel/git/netdev/net)
Merging wireless-drivers-next/master (13ce240a932f rtw88: 8822c: support FW=
 crash dump when FW crash)
Merging bluetooth/master (17486960d79b Bluetooth: avoid deadlock between hc=
i_dev->lock and socket lock)
Merging mac80211-next/master (5ab6f96a12f4 Merge branch 'sh_eth-reg-defs')
Merging gfs2/for-next (62dd0f98a0e5 gfs2: Flag a withdraw if init_threads()=
 fails)
Merging mtd/mtd/next (3ba6d1ff041f mtd: rawnand: stm32_fmc2: Fix fall-throu=
gh warnings for Clang)
Merging nand/nand/next (55fbb9ba4f06 mtd: rawnand: qcom: Return actual erro=
r code instead of -ENODEV)
Merging spi-nor/spi-nor/next (47f25032c0e3 MAINTAINERS: Add Michael and Pra=
tyush as designated reviewers for SPI NOR)
Merging crypto/master (aa31e559f7f9 crypto: sun4i-ss - simplify optional re=
set handling)
Merging drm/drm-next (51c3b916a4d7 Merge tag 'drm-misc-next-2021-03-03' of =
git://anongit.freedesktop.org/drm/drm-misc into drm-next)
Merging drm-misc/for-linux-next (5fd3de7a5185 drm/compat: Clear bounce stru=
ctures)
Merging amdgpu/drm-next (a162e50faeea drm/amdgpu/psp: return early for s0ix=
 suspend)
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
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_dev=
ice.c
Merging drm-intel/for-linux-next (2b25fb31a38d Merge tag 'gvt-next-2021-03-=
16' of https://github.com/intel/gvt-linux into drm-intel-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_sp=
rite.c
Applying: merge fix for "drm: Switch to %p4cc format modifier"
Merging drm-tegra/drm/tegra/for-next (dcdfe2712b68 drm/tegra: Fix reference=
 leak when pm_runtime_get_sync() fails)
Merging drm-msm/msm-next (7bf168c8fe8c drm/msm: Fix speed-bin support not t=
o access outside valid memory)
Merging imx-drm/imx-drm/next (82581fcf070b drm/modes: add non-OF stub for o=
f_get_drm_display_mode)
Merging etnaviv/etnaviv/next (7d614ab2f205 drm/etnaviv: fix NULL check befo=
re some freeing functions is not needed)
Merging regmap/for-next (e41a962f82e7 regmap: set debugfs_name to NULL afte=
r it is freed)
Merging sound/for-next (7a114444af81 ALSA: hda/cirrus: Make CS8409 driver m=
ore generic by using fixups.)
Merging sound-asoc/for-next (e7fc24859af3 Merge remote-tracking branch 'aso=
c/for-5.13' into asoc-next)
Merging modules/modules-next (1e80d9cb579e module: potential uninitialized =
return in module_kallsyms_on_each_symbol())
Merging input/next (e512a9e9f44d Input: tsc2007 - make use of device proper=
ties)
Merging block/for-next (6a1dde1c2792 Merge branch 'io_uring-5.12' into for-=
next)
Merging device-mapper/for-next (88cc16b9b3ac dm: remove useless loop in __s=
plit_and_process_bio)
Merging pcmcia/pcmcia-next (e9d503fef7da pcmcia: rsrc_nonstatic: Fix call-b=
ack function as reference formatting)
Merging mmc/next (4cb034984f81 mmc: sdio: fix a typo in the comment of SDIO=
_SD_REV_3_00)
Merging mfd/for-mfd-next (fea19b6e80a1 mfd: lm3533: Switch to using the new=
 API kobj_to_dev())
Merging backlight/for-backlight-next (225be60f3853 dt-bindings: backlight: =
qcom-wled: Add PMI8994 compatible)
Merging battery/for-next (c3a6d6a1dfc8 power: supply: bq27xxx: make status =
more robust)
Merging regulator/for-next (5afe322aaf98 Merge remote-tracking branch 'regu=
lator/for-5.13' into regulator-next)
Merging security/next-testing (9dcd47fc1f7d Merge branch 'fixes-v5.10' into=
 next-testing)
Merging apparmor/apparmor-next (d108370c644b apparmor: fix error check)
Merging integrity/next-integrity (f6692213b504 integrity: Make function int=
egrity_add_key() static)
Merging keys/keys-next (e377c31f788f integrity: Load mokx variables into th=
e blacklist keyring)
Merging safesetid/safesetid-next (03ca0ec13892 LSM: SafeSetID: Fix warnings=
 reported by test bot)
Merging selinux/next (431c3be16bd0 selinux: fix misspellings using codespel=
l tool)
Merging smack/next (7ef4c19d245f smackfs: restrict bytes count in smackfs w=
rite functions)
Merging tomoyo/master (fe07bfda2fb9 Linux 5.12-rc1)
Merging tpmdd/next (a8bba9247eb3 tpm: vtpm_proxy: Avoid reading host log wh=
en using a virtual device)
Merging watchdog/master (1e28eed17697 Linux 5.12-rc3)
Merging iommu/next (be575abcf799 Merge branch 'iommu/fixes' into next)
Merging audit/next (5504a69a4219 audit: further cleanup of AUDIT_FILTER_ENT=
RY deprecation)
Merging devicetree/for-next (8f83f69aa7fb of: unittest: Statically apply ov=
erlays using fdtoverlay)
Merging mailbox/mailbox-for-next (6b50df2b8c20 mailbox: arm_mhuv2: Skip cal=
ling kfree() with invalid pointer)
Merging spi/for-next (a0fe0f2a128f Merge remote-tracking branch 'spi/for-5.=
13' into spi-next)
Merging tip/auto-latest (de66c932c41f Merge branch 'irq/core')
$ git reset --hard HEAD^
Merging next-20210316 version of tip
Merging clockevents/timers/drivers/next (e85c1d21b16b clocksource/drivers/t=
imer-microchip-pit64b: Add clocksource suspend/resume)
Merging edac/edac-for-next (faf042d15093 Merge branch 'edac-amd64' into eda=
c-for-next)
Merging irqchip/irq/irqchip-next (5fbecd2389f4 irqchip/ingenic: Add support=
 for the JZ4760)
Merging ftrace/for-next (f9f344479d8b tracing: Fix comment about the trace_=
event_call flags)
Merging rcu/rcu/next (9035ae87fcb3 torture: Fix grace-period rate output)
$ git reset --hard HEAD^
Merging next-20210316 version of rcu
Merging kvm/next (1e28eed17697 Linux 5.12-rc3)
Merging kvm-arm/next (58c71cd7cac6 Merge branch 'kvmarm-master/fixes' into =
kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (72476aaa4691 KVM: PPC: Book3S HV: Fix host ra=
dix SLB optimisation with hash guests)
Merging kvms390/next (20eff2c93a2d KVM: s390: VSIE: correctly handle MVPG w=
hen in VSIE)
Merging xen-tip/linux-next (f1d20d8643e5 Xen/gntdev: don't needlessly use k=
vcalloc())
Merging percpu/for-next (df1c002198a8 Merge branch 'for-5.12' into for-next)
Merging workqueues/for-next (a7347aa8e061 workqueue: Move the position of d=
ebug_work_activate() in __queue_work())
Merging drivers-x86/for-next (87eaede45385 platform/x86: touchscreen_dmi: H=
andle device properties with software node API)
Merging chrome-platform/for-next (a38fd8748464 Linux 5.12-rc2)
Merging hsi/for-next (aa57e77b3d28 HSI: Fix PM usage counter unbalance in s=
si_hw_init)
Merging leds/for-next (34731ed13e8a leds: lgm: fix gpiolib dependency)
Merging ipmi/for-next (c053c4eb5a0f ipmi: Handle device properties with sof=
tware node API)
Merging driver-core/driver-core-next (1e28eed17697 Linux 5.12-rc3)
Merging usb/usb-next (aa403f257e99 Merge 5.12-rc3 into usb-next)
Merging usb-gadget/next (a38fd8748464 Linux 5.12-rc2)
Merging usb-serial/usb-next (8747fb3b14dd USB: serial: io_edgeport: drop un=
needed forward declarations)
Merging usb-chipidea-next/for-usb-next (c8ad0f64b7e0 usb: chipidea: tegra: =
Silence deferred probe error)
CONFLICT (content): Merge conflict in drivers/usb/typec/tipd/core.c
Merging tty/tty-next (280def1e1c17 Merge 5.12-rc3 into tty-next)
Merging char-misc/char-misc-next (83be46e944f6 Merge v5.12-rc3 into char-mi=
sc-next)
Merging extcon/extcon-next (cf947ad92675 extcon: qcom-spmi: Add support for=
 VBUS detection)
Merging phy-next/next (d9de0cbd5b1f dt-bindings: phy: brcm,brcmstb-usb-phy:=
 add power-domains)
Merging soundwire/next (a38fd8748464 Linux 5.12-rc2)
Merging thunderbolt/next (3382665a5c5d thunderbolt: debugfs: Show all acces=
sible dwords)
Merging vfio/next (4d83de6da265 vfio/type1: Batch page pinning)
Merging staging/staging-next (918ce05bbe52 staging: gasket: remove it from =
the kernel)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (ddeba12a178d Merge branch 'icc-fixes' into icc-next)
Merging dmaengine/next (84b0aa2e0d91 dmaengine: dw-edma: Add pcim_iomap_tab=
le return check)
Merging cgroup/for-next (00bfa16052cd Merge branch 'for-5.11-fixes' into fo=
r-next)
Merging scsi/for-next (f88dfeea18aa Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (52ee471a5c12 scsi: 53c700: Fix spelling of condi=
tions)
Merging vhost/linux-next (723c7003c1ab vdpa: introduce virtio pci driver)
Merging rpmsg/for-next (6da9742ca68b Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (deecc4d162c8 gpio: mockup: Adjust document=
ation to the code)
Merging gpio-intel/for-next (488d05fe25a6 gpiolib: Fold conditionals into a=
 simple ternary operator)
CONFLICT (content): Merge conflict in drivers/gpio/gpiolib.c
Merging pinctrl/for-next (a5d5c33246eb Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (9d8c5b0d2e09 pinctrl: intel: Show the GPIO =
base calculation explicitly)
Merging pinctrl-renesas/renesas-pinctrl (f7adcca27edf pinctrl: renesas: r8a=
77965: Add vin4_g8 and vin5_high8 pins)
Merging pinctrl-samsung/for-next (a38fd8748464 Linux 5.12-rc2)
Merging pwm/for-next (9a9dd7e47351 pwm: lpc18xx-sct: remove unneeded semico=
lon)
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
Merging rtc/rtc-next (9346ff0bc6ff rtc: mxc: Remove unneeded of_match_ptr())
Merging nvdimm/libnvdimm-for-next (30c10d32152d Merge branch 'for-5.12/cxl'=
 into libnvdimm-for-next)
Merging at24/at24/for-next (fe07bfda2fb9 Linux 5.12-rc1)
Merging ntb/ntb-next (5c8fe583cce5 Linux 5.11-rc1)
Merging seccomp/for-next/seccomp (a381b70a1cf8 seccomp: Improve performace =
by optimizing rmb())
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
Merging hyperv/hyperv-next (a620bbaa3510 asm-generic/hyperv: Add missing fu=
nction prototypes per -W1 warnings)
CONFLICT (content): Merge conflict in arch/x86/include/asm/mshyperv.h
Applying: fix up for "x86/paravirt: Switch time pvops functions to use stat=
ic_call()"
Merging auxdisplay/auxdisplay (701454bce906 auxdisplay: Remove in_interrupt=
() usage.)
Merging kgdb/kgdb/for-next (f11e2bc682cc kgdb: Remove kgdb_schedule_breakpo=
int())
Merging hmm/hmm (fe07bfda2fb9 Linux 5.12-rc1)
Merging fpga/for-next (6f1e376cfc68 fpga: Add support for Xilinx DFX AXI Sh=
utdown manager)
Merging kunit/test (a38fd8748464 Linux 5.12-rc2)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (a38fd8748464 Linux 5.12-rc2)
Merging kunit-next/kunit (a38fd8748464 Linux 5.12-rc2)
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
Merging iomem-mmap-vs-gup/topic/iomem-mmap-vs-gup (fe07bfda2fb9 Linux 5.12-=
rc1)
Merging rust/rust-next (1e28eed17697 Linux 5.12-rc3)
Applying: cifsd: uniquify extract_sharename()
Merging akpm-current/current (c5e561269620 modules: add CONFIG_MODPROBE_PAT=
H)
CONFLICT (content): Merge conflict in Documentation/admin-guide/kernel-para=
meters.txt
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (11e387eeaf64 Merge branch 'akpm-current/current')

--Sig_/DloLgESZePtmr.OUmwIh4Nw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBRwQEACgkQAVBC80lX
0Gya2Af/coL1LLISZGWk9YT6WE1Jg9j6cJcW/X2HUNT8qdagotTQUtjO6PjVCpSk
39ARSXWmNpx2A6kS3CpdIdxJiuS7H/3lVc2cq31j7qJU8X+rbH51F/+5TvdZwS5u
TruvJ68faNLgGHz/GIJpKB/B0KfxKdX3C1nYw0OPTLF2v9Nbm9YjlJnMVUIrEJWw
nP2tS7PUhiXDjifzgc2T/eFaoK5hA3J0MA7DcAP9fPZT1tCO3SaZ1eIfytzj9Qo7
g7Y1fFj/XgOlfXcOlRwRybnYdEH5qLQ2wgYooNbBadeHff7gzUJ97tY68Dp7rJwR
tDp4vRMj4J3GE4tyHJooZWUaiVLNjw==
=H415
-----END PGP SIGNATURE-----

--Sig_/DloLgESZePtmr.OUmwIh4Nw--
