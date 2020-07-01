Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D84521035F
	for <lists+linux-next@lfdr.de>; Wed,  1 Jul 2020 07:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgGAFpv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Jul 2020 01:45:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725272AbgGAFpt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Jul 2020 01:45:49 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71175C061755;
        Tue, 30 Jun 2020 22:45:49 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49xVZL40Yrz9sPF;
        Wed,  1 Jul 2020 15:45:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1593582346;
        bh=YIqG4mcyczj8HYArHXszHrc0KMlSqQ+wvmlUS4bAlC8=;
        h=Date:From:To:Cc:Subject:From;
        b=UCXr+GU0P6S1IW/s5tmxtspTZnUaj4NHEDMoPLHZJX74x0QF9I3tXgC+jzaI/GLpk
         tJQkb8XYbEwOcOX2kxSZdZwgX104I93yf8EyO683gaHvA0+1zA9HJsKQ7C0LX13bih
         weuKbfBLPlRx0VF7X2lJWWFyVUlOPyfm1rB2NzsuLH6Ong5YENj29CXuD9DcLGgbh7
         gemV+2b2AnjNKWSoeeY7906L7AxVB5G8zUqpwMJ35zSeSSA69fY4fUhpNdmmx1m3AF
         Lqhktq/LbYFWv2l/PThb6OV4fQHnJrKNb8VOEaKfABIUrtqmSZzdX/2wbXhYQ2JXLj
         EhhuYzlX1ZuQg==
Date:   Wed, 1 Jul 2020 15:45:44 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 1
Message-ID: <20200701154544.3d8c1cc8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YDeWeU_13TOoZGNj=hsRWY4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/YDeWeU_13TOoZGNj=hsRWY4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20200630:

My fixes tree contains:

  dbf24e30ce2e ("device_cgroup: Fix RCU list debugging warning")
  b236d81d9e4f ("powerpc/boot/dts: Fix dtc "pciex" warnings")

The tip tree still had one build failure for which I reverted a commit.

The rcu tree gained a conflict against the kbuild tree.

Non-merge commits (relative to Linus' tree): 3919
 4475 files changed, 304606 insertions(+), 81540 deletions(-)

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

I am currently merging 322 trees (counting Linus' and 83 trees of bug
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
Merging origin/master (7c30b859a947 Merge tag 'spi-fix-v5.8-rc3' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging fixes/master (b236d81d9e4f powerpc/boot/dts: Fix dtc "pciex" warnin=
gs)
Merging kbuild-current/fixes (758abb5a6024 docs: kbuild: fix ReST formattin=
g)
Merging arc-current/for-curr (10011f7d95de ARCv2: support loop buffer (LPB)=
 disabling)
Merging arm-current/fixes (3866f217aaa8 ARM: 8977/1: ptrace: Fix mask for t=
humb breakpoint hook)
Merging arm-soc-fixes/arm/fixes (42d3f7e8da1b Merge tag 'imx-fixes-5.8' of =
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fixes)
Merging uniphier-fixes/fixes (0e698dfa2822 Linux 5.7-rc4)
Merging arm64-fixes/for-next/fixes (108447fd0d1a arm64: Add KRYO{3,4}XX sil=
ver CPU cores to SSB safelist)
Merging m68k-current/for-linus (3381df095419 m68k: tools: Replace zero-leng=
th array with flexible-array member)
Merging powerpc-fixes/fixes (19ab500edb5d powerpc/mm/pkeys: Make pkey acces=
s check work on execute_only_key)
Merging s390-fixes/fixes (95e61b1b5d63 s390/setup: init jump labels before =
command line parsing)
Merging sparc/master (5124b31c1e90 sparc: piggyback: handle invalid image)
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (0433c93dff14 Merge branch 'net-ipa-three-bug-fixes')
Merging bpf/master (d923021c2ce1 bpf: Add tests for PTR_TO_BTF_ID vs. null =
comparison)
Merging ipsec/master (4f47e8ab6ab7 xfrm: policy: match with both mark and m=
ask on user interfaces)
Merging netfilter/master (4a21185cda0f Merge git://git.kernel.org/pub/scm/l=
inux/kernel/git/netdev/net)
Merging ipvs/master (a41de0c215ff netfilter: ipset: fix unaligned atomic ac=
cess)
Merging wireless-drivers/master (dc7bd30b97aa mt76: mt7615: fix EEPROM buff=
er size)
Merging mac80211/master (60a0121f8fa6 nl80211: fix memory leak when parsing=
 NL80211_ATTR_HE_BSS_COLOR)
Merging rdma-fixes/for-rc (9ebcfadb0610 Linux 5.8-rc3)
Merging sound-current/for-linus (d02b10590953 Merge tag 'asoc-fix-v5.8-rc3'=
 of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-=
linus)
Merging sound-asoc-fixes/for-linus (bb22b4545b6c Merge remote-tracking bran=
ch 'asoc/for-5.8' into asoc-linus)
Merging regmap-fixes/for-linus (82228364de4a Merge remote-tracking branch '=
regmap/for-5.8' into regmap-linus)
Merging regulator-fixes/for-linus (8edefa0e7f72 Merge remote-tracking branc=
h 'regulator/for-5.8' into regulator-linus)
Merging spi-fixes/for-linus (f4cbc0282ae1 Merge remote-tracking branch 'spi=
/for-5.8' into spi-linus)
Merging pci-current/for-linus (b3a9e3b9622a Linux 5.8-rc1)
Merging driver-core.current/driver-core-linus (9ebcfadb0610 Linux 5.8-rc3)
Merging tty.current/tty-linus (76ed2e105796 Revert "tty: xilinx_uartps: Fix=
 missing id assignment to the console")
Merging usb.current/usb-linus (9ebcfadb0610 Linux 5.8-rc3)
Merging usb-gadget-fixes/fixes (cd37c6976f6a Revert "usb: dwc3: exynos: Add=
 support for Exynos5422 suspend clk")
Merging usb-serial-fixes/usb-linus (5d0136f8e79f USB: serial: ch341: add ne=
w Product ID for CH340)
Merging usb-chipidea-fixes/ci-for-usb-stable (b3f3736ac305 usb: chipidea: m=
sm: Ensure proper controller reset using role switch API)
Merging phy/fixes (38b1927e5bf9 phy: sun4i-usb: fix dereference of pointer =
phy0 before it is null checked)
Merging staging.current/staging-linus (9ebcfadb0610 Linux 5.8-rc3)
Merging char-misc.current/char-misc-linus (e852c2c251ed mei: bus: don't cle=
an driver pointer)
Merging soundwire-fixes/fixes (bf6d6e68d202 soundwire: intel: fix memory le=
ak with devm_kasprintf)
Merging thunderbolt-fixes/fixes (8b94a4b92327 thunderbolt: Fix path indices=
 used in USB3 tunnel discovery)
Merging input-current/for-linus (ed3e98e919aa ARM: dts: n900: remove mmc1 c=
ard detect gpio)
Merging crypto-current/master (e04ec0de61c1 padata: upgrade smp_mb__after_a=
tomic to smp_mb in padata_do_serial)
Merging ide/master (b3a9e3b9622a Linux 5.8-rc1)
Merging vfio-fixes/for-linus (ebfa440ce38b vfio/pci: Fix SR-IOV VF handling=
 with MMIO blocking)
Merging kselftest-fixes/fixes (377ff83083c9 selftests: tpm: Use /bin/sh ins=
tead of /bin/bash)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging dmaengine-fixes/fixes (5b78fac4b1ba dmaengine: tegra210-adma: Fix r=
untime PM imbalance on error)
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (630e8d5507d9 mtd: set master partition panic w=
rite flag)
Merging mfd-fixes/for-mfd-fixes (603d9299da32 mfd: mt6397: Fix probe after =
changing mt6397-core)
Merging v4l-dvb-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (9fbbb7ddd96e MIPS: ingenic: gcw0: Fix HP det=
ection GPIO.)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (a352fe371053 Merge branch 'omap-for-v5.8/fixes-rc=
1' into fixes)
Merging kvm-fixes/master (0a1ef9c81e91 Merge tag 'kvm-s390-master-5.8-3' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into kvm-maste=
r)
Merging kvms390-fixes/master (774911290c58 KVM: s390: reduce number of IO p=
ins to 1)
Merging hwmon-fixes/hwmon (8b97f9922211 hwmon: (acpi_power_meter) Fix poten=
tial memory leak in acpi_power_meter_add())
Merging nvdimm-fixes/libnvdimm-fixes (543094e19c82 nvdimm/region: always sh=
ow the 'align' attribute)
Merging btrfs-fixes/next-fixes (4db55d1c287f Merge branch 'misc-5.8' into n=
ext-fixes)
Merging vfs-fixes/fixes (9e4636545933 copy_xstate_to_kernel(): don't leave =
parts of destination uninitialized)
Merging dma-mapping-fixes/for-linus (9c24eaf81cc4 iommu/vt-d: Return the co=
rrect dma mask when we are bypassing the IOMMU)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging samsung-krzk-fixes/fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging devicetree-fixes/dt/linus (341404415e76 dt-bindings: thermal: k3: F=
ix the reg property)
Merging scsi-fixes/fixes (5aee52c44d91 scsi: scsi_transport_spi: Fix functi=
on pointer check)
Merging drm-fixes/drm-fixes (687a0ed33736 Merge tag 'drm-misc-fixes-2020-06=
-25' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (55fd7e0222ea drm/i915: Includ=
e asm sources for {ivb, hsw}_clear_kernel.c)
Merging mmc-fixes/fixes (27a5e7d36d38 mmc: meson-gx: limit segments to 1 wh=
en dram-access-quirk is needed)
Merging rtc-fixes/rtc-fixes (8f3d9f354286 Linux 5.7-rc1)
Merging gnss-fixes/gnss-linus (48778464bb7d Linux 5.8-rc2)
Merging hyperv-fixes/hyperv-fixes (77b48bea2fee Drivers: hv: Change flag to=
 write log level in panic msg to false)
Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq h=
andlers after dpio create)
Merging risc-v-fixes/fixes (9ebcfadb0610 Linux 5.8-rc3)
Merging pidfd-fixes/fixes (c17d1a3a8ee4 fork: annotate data race in copy_pr=
ocess())
Merging fpga-fixes/fixes (6a47d6efc693 fpga: zynqmp: fix modular build)
Merging spdx/spdx-linus (3d77e6a8804a Linux 5.7)
Merging gpio-intel-fixes/fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging pinctrl-intel-fixes/fixes (45c11a927606 pinctrl: baytrail: Fix pin =
being driven low for a while on gpiod_get(..., GPIOD_OUT_HIGH))
Merging erofs-fixes/fixes (9ebcfadb0610 Linux 5.8-rc3)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (c63d2dd7e134 Documentation: kunit: Add som=
e troubleshooting tips to the FAQ)
Merging drm-misc-fixes/for-linux-next-fixes (bda8eaa6dee7 drm: sun4i: hdmi:=
 Remove extra HPD polling)
Merging kspp-gustavo/for-next/kspp (48778464bb7d Linux 5.8-rc2)
Merging kbuild/for-next (6092acaeef36 Merge branch 'kbuild' into for-next)
Merging compiler-attributes/compiler-attributes (98d54f81e36b Linux 5.6-rc4)
Merging dma-mapping/for-next (8e36baf97b25 dma-remap: align the size in dma=
_common_*_remap())
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (03c7f5f0b844 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (dd4bc6076587 arm64: warn on incorrect placemen=
t of the kernel by the bootloader)
Merging arm-perf/for-next/perf (10f6cd2af21b pmu/smmuv3: Clear IRQ affinity=
 hint on device removal)
Merging arm-soc/for-next (b2b0cf9297cb Merge branches 'arm/fixes' and 'arm/=
omap-fixes' into for-next)
Merging amlogic/for-next (9233c526bc0e Merge branch 'v5.8/defconfig' into t=
mp/aml-rebuild)
Merging aspeed/for-next (33f466eef906 ARM: dts: aspeed: mihawk: Add 8 tmp40=
1 thermal sensors)
Merging at91/at91-next (ec539e70d882 Merge branches 'at91-soc', 'at91-dt' a=
nd 'at91-defconfig' into at91-next)
Merging imx-mxs/for-next (123651ea2330 Merge branch 'imx/dt64' into for-nex=
t)
Merging keystone/next (a158c2b7ec23 Merge branch 'for_5.8/driver-soc' into =
next)
Merging mediatek/for-next (64ee939736e7 Merge branch 'v5.7-next/soc' into f=
or-next)
Merging mvebu/for-next (869da228bd45 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (025ae6d13120 Merge branch 'omap-for-v5.9/ti-sysc-dro=
p-pdata' into for-next)
Merging qcom/for-next (2408a915a05c Merge branches 'arm64-defconfig-for-5.9=
', 'arm64-for-5.9', 'drivers-for-5.9' and 'dts-for-5.9' into for-next)
Merging raspberrypi/for-next (63e58f2bb9d8 ARM: dts: bcm2711: Add firmware =
clocks node)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (93580ed92e86 Merge branches 'renesas-arm-defconfig-fo=
r-v5.9' and 'renesas-arm-dt-for-v5.9' into renesas-next)
Merging reset/reset/next (3b9164c0f173 dt-bindings: reset: Convert i.MX7 re=
set to json-schema)
Merging rockchip/for-next (99bcf38dd05b Merge branch 'v5.9-clk/next' into f=
or-next)
Merging samsung-krzk/for-next (dd82dfec8a33 Merge branch 'next/soc' into fo=
r-next)
Merging scmi/for-linux-next (7bba7782264e Merge branch 'for-next/scmi' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging sunxi/sunxi/for-next (b3a9e3b9622a Linux 5.8-rc1)
Merging tegra/for-next (83a7f685290a Merge branch for-5.9/arm64/dt into for=
-next)
Merging ti-k3/ti-k3-next (eac99d38f861 arm64: dts: ti: k3-am654-main: Updat=
e otap-del-sel values)
Merging uniphier/for-next (0e698dfa2822 Linux 5.7-rc4)
Merging clk/clk-next (79127846d947 Merge branch 'clk-bcm' into clk-next)
Merging clk-samsung/for-next (3d77e6a8804a Linux 5.7)
Merging csky/linux-next (f4dd2edafba0 csky: add support for SECCOMP and SEC=
COMP_FILTER)
Merging h8300/h8300-next (9d48776fc609 Merge remote-tracking branch 'origin=
/master' into h8300-next)
Merging ia64/next (172e7890406d tty/serial: cleanup after ioc*_serial drive=
r removal)
Merging m68k/for-next (3381df095419 m68k: tools: Replace zero-length array =
with flexible-array member)
Merging m68knommu/for-next (5e621fc1f71c m68k: mm: fix node memblock init)
Merging microblaze/next (b3a9e3b9622a Linux 5.8-rc1)
Merging mips/mips-next (ff711d67b178 MIPS: checksum: fix sparse flooding on=
 asm/checksum.h)
Merging nds32/next (548cbab5e7bc nds32: configs: Cleanup CONFIG_CROSS_COMPI=
LE)
Merging nios2/for-next (6b57fa4d374b nios2: signal: Mark expected switch fa=
ll-through)
Merging openrisc/for-next (6bd140e14d9a openrisc: Fix issue with argument c=
lobbering for clone/fork)
Merging parisc-hd/for-next (fb775a8805ed parisc: Whitespace cleanups in ato=
mic.h)
Merging powerpc/next (105fb38124a4 powerpc/8xx: Modify ptep_get())
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (e9e4ef9116b1 soc: fsl: dpio: Remove unused inline fun=
ction qbman_write_eqcr_am_rt_register)
Merging risc-v/for-next (a2693fe254e7 RISC-V: Use a local variable instead =
of smp_processor_id())
Merging s390/features (28ccce5f50af s390/appldata: use struct_size() helper)
Merging sh/for-next (37744feebc08 sh: remove sh5 support)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (f6e8c474390b um: virtio: Replace zero-length array =
with flexible-array)
Merging xtensa/xtensa-for-next (f04758d5aea9 xtensa: fix __sync_fetch_and_{=
and,or}_4 declarations)
Merging fscrypt/master (e3b1078bedd3 fscrypt: add support for IV_INO_LBLK_3=
2 policies)
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (8113246479a5 Merge branch 'for-next-next-v5.7-20200=
528' into for-next-20200528)
Merging ceph/master (7ed286f3e061 libceph: don't omit used_replica in targe=
t_copy())
Merging cifs/for-next (302e3c72b661 cifs: Fix the target file was deleted w=
hen rename failed.)
Merging configfs/for-next (8aebfffacfa3 configfs: fix config_item refcnt le=
ak in configfs_rmdir())
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (b3a9e3b9622a Linux 5.8-rc1)
Merging exfat/dev (5bd8b28067ce exfat: add error check when updating dir-en=
tries)
Merging ext3/for_next (a68f93d90fbb Pull writeback fixes from me.)
Merging ext4/dev (7b97d868b7ab ext4, jbd2: ensure panic by fix a race betwe=
en jbd2 abort and ext4 error handlers)
Merging f2fs/dev (0e26000ed7de f2fs: avoid readahead race condition)
Merging fsverity/fsverity (9cd6b593cfc9 fs-verity: remove unnecessary exter=
n keywords)
Merging fuse/for-next (9b46418c40fe fuse: copy_file_range should truncate c=
ache)
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (9ebcfadb0610 Linux 5.8-rc3)
Merging nfs-anna/linux-next (89a3c9f5b9f0 SUNRPC: Properly set the @subbuf =
parameter of xdr_buf_subsegment())
Merging nfsd/nfsd-next (c428aa8ef0cc SUNRPC: Add missing definition of ARCH=
_IMPLEMENTS_FLUSH_DCACHE_PAGE)
Merging orangefs/for-next (0df556457748 orangefs: convert get_user_pages() =
--> pin_user_pages())
Merging overlayfs/overlayfs-next (2068cf7dfbc6 ovl: remove unnecessary lock=
 check)
Merging ubifs/linux-next (4b68bf9a69d2 ubi: Select fastmap anchor PEBs cons=
idering wear level rules)
Merging v9fs/9p-next (36f9967531da 9p/xen: increase XEN_9PFS_RING_ORDER)
Merging xfs/for-next (c7f87f3984cf xfs: fix use-after-free on CIL context o=
n shutdown)
Merging zonefs/for-next (568776f992c4 zonefs: Replace uuid_copy() with impo=
rt_uuid())
Merging iomap/iomap-for-next (d4ff3b2ef901 iomap: Fix unsharing of an exten=
t >2GB on a 32-bit machine)
Merging djw-vfs/vfs-for-next (e4f9ba20d3b8 fs/xfs: Update xfs_ioctl_setattr=
_dax_invalidate())
Merging file-locks/locks-next (5ef159681309 locks: add locks_move_blocks in=
 posix_lock_inode)
Merging vfs/for-next (7999096fa9cf iov_iter: Move unnecessary inclusion of =
crypto/hash.h)
Merging printk/for-next (1411ed3d694c Merge branch 'for-5.9-console-return-=
codes' into for-next)
Merging pci/next (485afde1a05f Merge branch 'pci/misc')
Merging pstore/for-next/pstore (48778464bb7d Linux 5.8-rc2)
Merging hid/for-next (852b992f0c32 Merge branch 'for-5.8/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (40e05200593a i2c: core: check returned size of em=
ulated smbus block read)
Merging i3c/i3c/next (b4203ce05563 i3c master: GETMRL's 3rd byte is optiona=
l even with BCR_IBI_PAYLOAD)
Merging dmi/master (d9d8efd3241b firmware/dmi: Report DMI Bios & EC firmwar=
e release)
Merging hwmon-staging/hwmon-next (7514cedc325a hwmon: (pmbus/core) Use s64 =
instead of long for calculations)
Merging jc_docs/docs-next (435a77434653 Merge branch 'mauro' into docs-next)
CONFLICT (content): Merge conflict in Documentation/filesystems/f2fs.rst
Merging v4l-dvb/master (e30cc79cc80f media: media-request: Fix crash if mem=
ory allocation fails)
Merging v4l-dvb-next/master (2630e1bb0948 media: rkvdec: Fix H264 scaling l=
ist order)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (0169dcbef89a Merge branch 'pm-cpuidle' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (c318ea261749 cpufreq: ap806: fi=
x cpufreq driver needs ap cpu clk)
Merging cpupower/cpupower (b3a9e3b9622a Linux 5.8-rc1)
Merging opp/opp/linux-next (e7bf9997c605 opp: core: Add missing export for =
dev_pm_opp_adjust_voltage)
Merging thermal/thermal/linux-next (64488908b523 thermal/int340x_thermal: D=
on't require IDSP to exist)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (7ccfc939caa4 dlm: Fix kobject memleak)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (14c2b89634a2 RDMA/core: Delete not-used create RWQ t=
able function)
Merging net-next/master (e0cdac65ba26 cxgb4vf: configure ports accessible b=
y the VF)
Merging bpf-next/master (ca4db6389d61 selftests/bpf: Allow substituting cus=
tom vmlinux.h for selftests build)
CONFLICT (content): Merge conflict in tools/testing/selftests/bpf/progs/bpf=
_iter_netlink.c
Merging ipsec-next/master (428d2459cceb xfrm: introduce oseq-may-wrap flag)
Merging mlx5-next/mlx5-next (2d1b69ed65ee net/mlx5: kTLS, Improve TLS param=
s layout structures)
Merging netfilter-next/master (857ca89711de ipvs: register hooks only with =
services)
Merging ipvs-next/master (29a720c1042f Merge branch 'Marvell-mvpp2-improvem=
ents')
Merging wireless-drivers-next/master (a15a20acc980 Merge tag 'iwlwifi-next-=
for-kalle-2020-06-11' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlw=
ifi/iwlwifi-next)
Merging bluetooth/master (ecce5bde1117 Bluetooth: btusb: USB alternate sett=
ing 1 for WBS)
Merging mac80211-next/master (29a720c1042f Merge branch 'Marvell-mvpp2-impr=
ovements')
Merging gfs2/for-next (6551c345fa87 gfs2: Add some flags missing from glock=
 output)
Merging mtd/mtd/next (5788ccf3c84f mtd: clear cache_state to avoid writing =
to bad blocks repeatedly)
Merging nand/nand/next (8c8cee0fea9d mtd: parsers: bcm63xx: simplify CFE de=
tection)
Merging spi-nor/spi-nor/next (a0eec1567322 mtd: spi-nor: intel-spi: Add sup=
port for Intel Tiger Lake-H SPI serial flash)
Merging crypto/master (a05b1c150f5b crypto: octeontx - Fix sparse warnings)
Merging drm/drm-next (f75020fcb97a Merge tag 'drm-misc-next-2020-06-26' of =
git://anongit.freedesktop.org/drm/drm-misc into drm-next)
Merging amdgpu/drm-next (b8619073b252 drm/amdgpu/atomfirmware: update vram =
info handling for renoir)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dsc/rc=
_calc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
Applying: drm/amdkfd: fix up for {un}use_mm() rename
Merging drm-intel/for-linux-next (040e123c0b73 drm/i915/gem: Avoid kmalloc =
under i915->mm_lock)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gvt/handlers.c
Merging drm-tegra/drm/tegra/for-next (513776e0c3fb drm/tegra: sor: Use corr=
ect power supply names for HDMI)
Merging drm-misc/for-linux-next (1185c406f11a drm: panel: simple: Warn in c=
ase of incorrect bus format for LVDS panels)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_vm_=
sdma.c
Merging drm-msm/msm-next (30480e6ed508 drm/msm: Fix up the rest of the mess=
ed up address sizes)
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (2c76b324c794 drm/imx: parallel-display: Adjus=
t bus_flags handling)
Merging etnaviv/etnaviv/next (6a5ef3b224c6 drm/etnaviv: Simplify clock enab=
le/disable)
Merging regmap/for-next (e6ad256a03ef Merge remote-tracking branch 'regmap/=
for-5.9' into regmap-next)
Merging sound/for-next (5ff40e6d0f8a ALSA: usb-audio: Fix some typos)
Merging sound-asoc/for-next (224185a6e51a Merge branch 'for-5.9' of https:/=
/git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into asoc-next)
Merging modules/modules-next (b3a9e3b9622a Linux 5.8-rc1)
Merging input/next (d0ac7079d5fc Input: iqs269a - add missing I2C dependenc=
y)
Merging block/for-next (8f30bf081d86 Merge branch 'for-5.9/block' into for-=
next)
Merging device-mapper/for-next (4e670f43081c dm rq: don't call blk_mq_queue=
_stopped() in dm_stop_queue())
Merging pcmcia/pcmcia-next (46d079790663 pcmcia: make pccard_loop_tuple() s=
tatic)
Merging mmc/next (49377432943d Merge branch 'fixes' into next)
Merging mfd/for-mfd-next (156b49024ab1 mfd: intel-lpss: Add Intel Tiger Lak=
e PCH-H PCI IDs)
Merging backlight/for-backlight-next (479da1f538a2 backlight: Add backlight=
_device_get_by_name())
Merging battery/for-next (5d809cb28056 power: supply: max8998_charger: Corr=
ect ONLINE and add STATUS props)
Merging regulator/for-next (2d84f80f922c Merge remote-tracking branch 'regu=
lator/for-5.9' into regulator-next)
Merging security/next-testing (56f2e3b7d819 capabilities: add description f=
or CAP_SETFCAP)
Merging apparmor/apparmor-next (e37986097ba6 apparmor: Use true and false f=
or bool variable)
Merging integrity/next-integrity (20c59ce010f8 ima: extend boot_aggregate w=
ith kernel measurements)
Merging keys/keys-next (b6f61c314649 keys: Implement update for the big_key=
 type)
Merging safesetid/safesetid-next (4d63f7c2e382 security: Add LSM hooks to s=
et*gid syscalls)
Merging selinux/next (65d96351b135 selinux: fixed a checkpatch warning with=
 the sizeof macro)
Merging smack/next (ef26650a201f Smack: Remove unused inline function smk_a=
d_setfield_u_fs_path_mnt)
Merging tomoyo/master (b3a9e3b9622a Linux 5.8-rc1)
Merging tpmdd/next (8270cafb505e tpm/st33zp24: fix spelling mistake "drescr=
iption" -> "description")
Merging watchdog/master (719fdd32921f afs: Fix storage of cell names)
Merging iommu/next (e5640f21b63d Merge branches 'iommu/fixes', 'arm/renesas=
', 'arm/qcom', 'ppc/pamu', 'x86/amd' and 'core' into next)
Merging vfio/next (4f085ca2f5a8 Merge branch 'v5.8/vfio/kirti-migration-fix=
es' into v5.8/vfio/next)
Merging audit/next (142240398e50 audit: add gfp parameter to audit_log_nfcf=
g)
Merging devicetree/for-next (bcb142f30394 dt-bindings: mmc: Convert imx esd=
hc to json-schema)
Merging mailbox/mailbox-for-next (e9f901dc05c0 mailbox: qcom: Add ipq6018 a=
pcs compatible)
Merging spi/for-next (193ae678f5db Merge remote-tracking branch 'spi/for-5.=
9' into spi-next)
Merging tip/auto-latest (46fa597fe899 Merge branch 'core/urgent')
Applying: Revert "sched: Remove sched_setscheduler*() EXPORTs"
Merging clockevents/timers/drivers/next (809eb4e9bf9d dt-bindings: timer: A=
dd renesas,em-sti bindings)
Merging edac/edac-for-next (399cd3b33cef Merge branch 'edac-urgent' into ed=
ac-for-next)
Merging irqchip/irq/irqchip-next (005c34ae4b44 irqchip/gic: Atomically upda=
te affinity)
Merging ftrace/for-next (20dc3847cc2f tracing/boottime: Fix kprobe multiple=
 events)
Merging rcu/rcu/next (07a4b46c7e42 tick-sched: Clarify "NOHZ: local_softirq=
_pending" warning)
CONFLICT (content): Merge conflict in kernel/kcsan/Makefile
Merging kvm/linux-next (bf09fb6cba4f KVM: VMX: Stop context switching MSR_I=
A32_UMWAIT_CONTROL)
Merging kvm-arm/next (a3f574cd6548 KVM: arm64: vgic-v4: Plug race between n=
on-residency and v4.1 doorbell)
Merging kvm-ppc/kvm-ppc-next (11362b1befea KVM: PPC: Book3S HV: Close race =
with page faults around memslot flushes)
Merging kvms390/next (23a60f834406 s390/kvm: diagnose 0x318 sync and reset)
Merging xen-tip/linux-next (caef73cf2070 arm/xen: remove the unused macro G=
RANT_TABLE_PHYSADDR)
Merging percpu/for-next (dedac37ea96b Merge branch 'for-5.7' into for-next)
Merging workqueues/for-next (10cdb1575954 workqueue: use BUILD_BUG_ON() for=
 compile time test instead of WARN_ON())
Merging drivers-x86/for-next (b3a9e3b9622a Linux 5.8-rc1)
Merging chrome-platform/for-next (5b30bd35aab4 platform/chrome: cros_ec_typ=
ec: Add TBT compat support)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (e190f57df3c7 leds-bcm6328: support second hw blinkin=
g interval)
Merging ipmi/for-next (29a54910152a ipmi: ssif: Remove finished TODO commen=
t about SMBus alert)
Merging driver-core/driver-core-next (9ebcfadb0610 Linux 5.8-rc3)
Merging usb/usb-next (9cf6ffae3800 Merge 5.8-rc3 into usb-next)
Merging usb-gadget/next (1c11e74e9079 usb: dwc3: keystone: Turn on USB3 PHY=
 before controller)
Merging usb-serial/usb-next (86f6da2951db USB: serial: ch341: add min and m=
ax line-speed macros)
Merging usb-chipidea-next/ci-for-usb-next (c71d13f9a868 Documentation: ABI:=
 usb: chipidea: Update Li Jun's e-mail)
Merging phy-next/next (4a33bea00314 phy: zynqmp: Add PHY driver for the Xil=
inx ZynqMP Gigabit Transceiver)
Merging tty/tty-next (890814504eeb tty: fix spelling mistake)
Merging char-misc/char-misc-next (9ebcfadb0610 Linux 5.8-rc3)
Merging extcon/extcon-next (b3a9e3b9622a Linux 5.8-rc1)
Merging soundwire/next (51fe3881a29b soundwire: qcom: Constify static struc=
ts)
Merging thunderbolt/next (dacb12877d92 thunderbolt: Add support for on-boar=
d retimers)
Applying: thunderbolt: merge fix for kunix_resource changes
Merging staging/staging-next (347fa58ff555 Merge 5.8-rc3 into staging-next)
Merging mux/for-next (05f19f7f8944 mux: adgs1408: Add mod_devicetable.h and=
 remove of_match_ptr)
Merging icc/icc-next (65461e26b1fe interconnect: Allow inter-provider pairs=
 to be configured)
Merging dmaengine/next (d12ea5591edd dmaengine: pl330: Make sure the debug =
is idle before doing DMAGO)
Merging cgroup/for-next (936f2a70f207 cgroup: add cpu.stat file to root cgr=
oup)
Merging scsi/for-next (b7606aed06bd Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (5a0c256d96f0 scsi: target: tcmu: Fix crash on AR=
M during cmd completion)
Merging vhost/linux-next (cb91909e48a4 tools/virtio: Use tools/include/list=
.h instead of stubs)
Merging rpmsg/for-next (71f56fef13d4 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (65884065616f Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (ae66eca000cf gpiolib: Deduplicate find_fir=
st_zero_bit() call)
Merging gpio-intel/for-next (5bae1f08e285 pinctrl: at91: Make use of for_ea=
ch_requested_gpio())
Merging pinctrl/for-next (5c227753ba68 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (653d96455e1e pinctrl: tigerlake: Add suppor=
t for Tiger Lake-H)
CONFLICT (content): Merge conflict in drivers/pinctrl/intel/pinctrl-baytrai=
l.c
Merging pinctrl-samsung/for-next (7efece8a057f pinctrl: samsung: Use bank n=
ame as irqchip name)
Merging pwm/for-next (b8fb642afa02 pwm: iqs620a: Use lowercase hexadecimal =
literals for consistency)
Merging userns/for-next (d35bec8a5788 Merge proc-next and exec-next for tes=
ting in linux-next)
Merging ktest/for-next (1091c8fce8aa ktest: Fix typos in ktest.pl)
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (9ebcfadb0610 Linux 5.8-rc3)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (b950460b2486 Merge branch 'for-5.9/selftests=
-cleanup' into for-next)
Merging coresight/next (8b54932fad3b coresight: etm: perf: Add default sink=
 selection to etm perf)
Merging rtc/rtc-next (4601e24a6fb8 rtc: pcf2127: watchdog: handle nowayout =
feature)
Merging nvdimm/libnvdimm-for-next (b86153077d5c Merge branch 'for-5.8/papr_=
scm' into libnvdimm-for-next)
Merging at24/at24/for-next (8f3d9f354286 Linux 5.7-rc1)
Merging ntb/ntb-next (b3a9e3b9622a Linux 5.8-rc1)
Merging seccomp/for-next/seccomp (c2e79bbed08d selftests/seccomp: Test SECC=
OMP_IOCTL_NOTIF_ADDFD)
Merging kspp/for-next/kspp (619e8c5cbd81 Merge branch 'for-next/gcc-plugins=
' into for-next/kspp)
CONFLICT (content): Merge conflict in kernel/debug/kdb/kdb_io.c
Merging gnss/gnss-next (48778464bb7d Linux 5.8-rc2)
Merging fsi/next (2c01397b71c5 fsi: aspeed: Fix OPB0 byte order register va=
lues)
CONFLICT (content): Merge conflict in drivers/fsi/Kconfig
Merging slimbus/for-next (b3a9e3b9622a Linux 5.8-rc1)
Merging nvmem/for-next (79e491b6b406 nvmem: qfprom: use NVMEM_DEVID_AUTO fo=
r multiple instances)
Merging xarray/xarray (27586ca786a7 XArray: Handle retry entries within xas=
_find_marked)
Merging hyperv/hyperv-next (775f43facfe8 Drivers: hv: vmbus: Remove the loc=
k field from the vmbus_channel struct)
Merging auxdisplay/auxdisplay (3f03b6498172 auxdisplay: charlcd: Reuse hex_=
to_bin() instead of custom code)
Merging kgdb/kgdb/for-next (c893de12e1ef kdb: Remove the misfeature 'KDBFLA=
GS')
Merging pidfd/for-next (a5161eeef97c tests: add CLOSE_RANGE_UNSHARE tests)
CONFLICT (content): Merge conflict in fs/file.c
Merging devfreq/devfreq-next (32e4315be495 PM / devfreq: rk3399_dmc: Fix ke=
rnel oops when rockchip,pmu is absent)
Merging hmm/hmm (b3a9e3b9622a Linux 5.8-rc1)
Merging fpga/for-next (322b598be4d9 fpga: dfl: introduce interrupt trigger =
setting API)
Merging kunit/test (48778464bb7d Linux 5.8-rc2)
Merging cel/cel-next (0a8e7b7d0846 SUNRPC: Revert 241b1f419f0e ("SUNRPC: Re=
move xdr_buf_trim()"))
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (11399346ac39 mtd: Replace zero-length array with flex=
ible-array)
Merging kunit-next/kunit (725aca958595 kunit: add support for named resourc=
es)
Merging trivial/for-next (c1a371cf80fb printk: fix global comment)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (b3a9e3b9622a Linux 5.8-rc1)
Merging notifications/notifications-pipe-core (54e552c96d30 watch_queue: Ad=
d superblock notifications)
Merging fsinfo/fsinfo-core (dbc87e74d022 vfs, fsinfo: Add an RCU safe per-n=
s mount list)
Applying: extra syscall updates
Applying: Revert "vfs, fsinfo: Add an RCU safe per-ns mount list"
Merging akpm-current/current (85d6fb3242c7 mm,hwpoison: Refactor soft_offli=
ne_huge_page and __soft_offline_page)
Applying: slab: Fix misplaced __free_one()
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (0022bebdab73 sh: add missing EXPORT_SYMBOL() for __del=
ay)

--Sig_/YDeWeU_13TOoZGNj=hsRWY4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl78IwgACgkQAVBC80lX
0GyW+wf/YzWySwAgPEw/MvoEMIxl8XiwriIuJNK6Ra8d0VDCy6G8VKJLAUIIuJic
8J6teSnqc0dSjsNuxRSREUaKcljJeMQ6W56h4leQXRrCOJYnKgC1EqAA9t1Qdd51
r0nLIdjKnMy8Ls8uuGopsuPldc+BqYYQ68MUeCIX9hNeHL+yHTtdUIMNfy74EsEm
ZsBGqmnBGadaS3KKji50U0V/b+Dgck7ZIvNNtTAqkRL2CvIlGWcs9yHMk8/UEAW5
tIZBwJG0gxNzqKhDPyLneq5DhOk3Y1kqqVJW6FJU17LakEJFb7/LWsFtFz7aZIho
wcNd4Jc344beFYN3hWCKMeiEq+NE7A==
=XZD9
-----END PGP SIGNATURE-----

--Sig_/YDeWeU_13TOoZGNj=hsRWY4--
