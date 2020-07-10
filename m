Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 153AC21B166
	for <lists+linux-next@lfdr.de>; Fri, 10 Jul 2020 10:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726933AbgGJIdW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jul 2020 04:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726768AbgGJIdW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Jul 2020 04:33:22 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B3C8C08C5CE;
        Fri, 10 Jul 2020 01:33:22 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B35sW6kC7z9sRK;
        Fri, 10 Jul 2020 18:33:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594370000;
        bh=5f0XnWzfdf9ftrgJ/ZufrFD2x0ZxAezOJ0JNrwsgofI=;
        h=Date:From:To:Cc:Subject:From;
        b=ALTO7L+rwS7S1rRkI5QGx8izkGhR0X15XJGD2NVVwK5u3jyx36eQBLp2lPfGWsIlh
         3SEcU8hrf32J7eVIBjYxteLCN0lCT//3vn59F7Jnh5dj5UdvPQ7A7U8wh1L0cpT6n9
         nTgeGYpqGkBi12aCwD/fyW14l3ZtTC8RL26J4aXE/llVHeJe02wTusXvB69hcTQYOC
         W7LqrQwyj2QUaFV/sE0q9dN0y1QBI+Zdl7kc7YzII9aOpL13O7lTHvzG0VEsxOu6e7
         38IQWIcrQbto1ko0lavMcwjWJsGACsuSzGK9TfL4+TaXSy7bfFAKj639B7itRqapb9
         +I005pHCebOyg==
Date:   Fri, 10 Jul 2020 18:33:18 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 10
Message-ID: <20200710183318.7b808092@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wuohWAyDsI26gfLncb/cSSI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wuohWAyDsI26gfLncb/cSSI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20200709:

My fixes tree contains:

  dbf24e30ce2e ("device_cgroup: Fix RCU list debugging warning")
  b236d81d9e4f ("powerpc/boot/dts: Fix dtc "pciex" warnings")

The kbuild tree still had its build failure for which I reverted a commit.

The scmi tree lost its build failure.

The drm tree gained a conflict against the drm-fixes tree.

The security tree still had its build failure for which I applied a patch.

The tip tree still had one build failure for which I reverted a commit
and gained a conflict against the spi tree.

The pidfd tree gained a conflict against the seccomp tree.

The akpm-current tree lost its build failure but gained a conflict
against the risc-v tree.

Non-merge commits (relative to Linus' tree): 6231
 7061 files changed, 371498 insertions(+), 144830 deletions(-)

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

I am currently merging 324 trees (counting Linus' and 83 trees of bug
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
Merging origin/master (2a89b99f5803 Merge tag 'for-5.8/dm-fixes-2' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging fixes/master (b236d81d9e4f powerpc/boot/dts: Fix dtc "pciex" warnin=
gs)
Merging kbuild-current/fixes (736bb11898ef modpost: remove use of non-stand=
ard strsep() in HOSTCC code)
Merging arc-current/for-curr (10011f7d95de ARCv2: support loop buffer (LPB)=
 disabling)
Merging arm-current/fixes (3866f217aaa8 ARM: 8977/1: ptrace: Fix mask for t=
humb breakpoint hook)
Merging arm-soc-fixes/arm/fixes (42d3f7e8da1b Merge tag 'imx-fixes-5.8' of =
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fixes)
Merging uniphier-fixes/fixes (48778464bb7d Linux 5.8-rc2)
Merging arm64-fixes/for-next/fixes (5679b2814219 arm64/alternatives: don't =
patch up internal branches)
Merging m68k-current/for-linus (3381df095419 m68k: tools: Replace zero-leng=
th array with flexible-array member)
Merging powerpc-fixes/fixes (4557ac6b344b powerpc/64s/exception: Fix 0x1500=
 interrupt handler crash)
Merging s390-fixes/fixes (68f50f61ea91 MAINTAINERS: update email address fo=
r Heiko Carstens)
Merging sparc/master (5124b31c1e90 sparc: piggyback: handle invalid image)
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (365f9ae4ee36 ethtool: fix genlmsg_put() failure handlin=
g in ethnl_default_dumpit())
Merging bpf/master (f43cb0d672aa selftests: bpf: Fix detach from sockmap te=
sts)
Merging ipsec/master (17175d1a27c6 xfrm: esp6: fix encapsulation header off=
set computation)
Merging netfilter/master (eadede5f9362 Merge branch 'hns3-fixes')
Merging ipvs/master (eadede5f9362 Merge branch 'hns3-fixes')
Merging wireless-drivers/master (dc7bd30b97aa mt76: mt7615: fix EEPROM buff=
er size)
Merging mac80211/master (8ff41cc21714 net: qrtr: Fix an out of bounds read =
qrtr_endpoint_post())
Merging rdma-fixes/for-rc (04340645f69a RDMA/siw: Fix reporting vendor_part=
_id)
Merging sound-current/for-linus (f79a732a8325 ALSA: compress: fix partial_d=
rain completion state)
Merging sound-asoc-fixes/for-linus (42214828c3e4 Merge remote-tracking bran=
ch 'asoc/for-5.8' into asoc-linus)
Merging regmap-fixes/for-linus (500f7d8d2cfb Merge remote-tracking branch '=
regmap/for-5.8' into regmap-linus)
Merging regulator-fixes/for-linus (98ed55a926a9 Merge remote-tracking branc=
h 'regulator/for-5.8' into regulator-linus)
Merging spi-fixes/for-linus (ae241ebabb8a Merge remote-tracking branch 'spi=
/for-5.8' into spi-linus)
Merging pci-current/for-linus (5396956cc7c6 PCI: Make pcie_find_root_port()=
 work for Root Ports)
Merging driver-core.current/driver-core-linus (9ebcfadb0610 Linux 5.8-rc3)
Merging tty.current/tty-linus (f38278e9b810 serial: sh-sci: Initialize spin=
lock for uart console)
Merging usb.current/usb-linus (af3cf0ac6805 Merge tag 'usb-serial-5.8-rc5' =
of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into us=
b-linus)
Merging usb-gadget-fixes/fixes (8778eb0927dd usb: gadget: function: fix mis=
sing spinlock in f_uac1_legacy)
Merging usb-serial-fixes/usb-linus (da6902e5b6db USB: serial: option: add Q=
uectel EG95 LTE modem)
Merging usb-chipidea-fixes/ci-for-usb-stable (2d79b3360dcc usb: chipidea: c=
ore: add wakeup support for extcon)
Merging phy/fixes (38b1927e5bf9 phy: sun4i-usb: fix dereference of pointer =
phy0 before it is null checked)
Merging staging.current/staging-linus (617894cd848f Merge tag 'iio-fixes-fo=
r-5.8a' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into sta=
ging-linus)
Merging char-misc.current/char-misc-linus (bcf003be750a Merge tag 'phy-fixe=
s-5.8' of git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy into =
char-misc-next)
Merging soundwire-fixes/fixes (bf6d6e68d202 soundwire: intel: fix memory le=
ak with devm_kasprintf)
Merging thunderbolt-fixes/fixes (8b94a4b92327 thunderbolt: Fix path indices=
 used in USB3 tunnel discovery)
Merging input-current/for-linus (a50ca29523b1 Input: elan_i2c - add more ha=
rdware ID for Lenovo laptops)
Merging crypto-current/master (e04ec0de61c1 padata: upgrade smp_mb__after_a=
tomic to smp_mb in padata_do_serial)
Merging ide/master (b3a9e3b9622a Linux 5.8-rc1)
Merging vfio-fixes/for-linus (ebfa440ce38b vfio/pci: Fix SR-IOV VF handling=
 with MMIO blocking)
Merging kselftest-fixes/fixes (3c01655ac82e kselftest: ksft_test_num return=
 type should be unsigned)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging dmaengine-fixes/fixes (87730ccbddcb dmaengine: ioat setting ioat ti=
meout as module parameter)
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (880bc529bae2 mtd: rawnand: xway: Fix build iss=
ue)
Merging mfd-fixes/for-mfd-fixes (603d9299da32 mfd: mt6397: Fix probe after =
changing mt6397-core)
Merging v4l-dvb-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (5868347a192a MIPS: Do not use smp_processor_=
id() in preemptible code)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (a352fe371053 Merge branch 'omap-for-v5.8/fixes-rc=
1' into fixes)
Merging kvm-fixes/master (ef330736f1ce KVM: nVMX: fixes for preemption time=
r migration)
Merging kvms390-fixes/master (774911290c58 KVM: s390: reduce number of IO p=
ins to 1)
Merging hwmon-fixes/hwmon (6d1d41c075a1 hwmon: (adm1275) Make sure we are r=
eading enough data for different chips)
Merging nvdimm-fixes/libnvdimm-fixes (543094e19c82 nvdimm/region: always sh=
ow the 'align' attribute)
Merging btrfs-fixes/next-fixes (23e44faaf8e2 Merge branch 'misc-5.8' into n=
ext-fixes)
Merging vfs-fixes/fixes (d4d80e69927a Call sysctl_head_finish on error)
Merging dma-mapping-fixes/for-linus (bfe91da29bfa Merge tag 'for-linus' of =
git://git.kernel.org/pub/scm/virt/kvm/kvm)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging samsung-krzk-fixes/fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging devicetree-fixes/dt/linus (0115e6c98c22 dt-bindings: clock: imx: Fi=
x e-mail address)
Merging scsi-fixes/fixes (e094fd346021 scsi: dh: Add Fujitsu device to devi=
nfo and dh lists)
Merging drm-fixes/drm-fixes (38794a5465b7 Merge tag 'amd-drm-fixes-5.8-2020=
-07-09' of git://people.freedesktop.org/~agd5f/linux into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (5a383d443b29 drm/i915/gt: Pin=
 the rings before marking active)
Merging mmc-fixes/fixes (3ec2d5113ea5 mmc: sdhci-msm: Override DLL_CONFIG o=
nly if the valid value is supplied)
Merging rtc-fixes/rtc-fixes (b3a9e3b9622a Linux 5.8-rc1)
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
Merging drm-misc-fixes/for-linux-next-fixes (2249357459c0 drm/aspeed: Call =
drm_fbdev_generic_setup after drm_dev_register)
Merging kspp-gustavo/for-next/kspp (48778464bb7d Linux 5.8-rc2)
Merging kbuild/for-next (99588e19ed5e Merge branch 'kconfig' into for-next)
Applying: Revert "kbuild: always create directories of targets"
Merging compiler-attributes/compiler-attributes (98d54f81e36b Linux 5.6-rc4)
Merging dma-mapping/for-next (68d237056e00 scatterlist: protect parameters =
of the sg_table related macros)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (03c7f5f0b844 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (dc6ba66658d0 Merge branch 'for-next/mte' into =
for-next/core)
Merging arm-perf/for-next/perf (10f6cd2af21b pmu/smmuv3: Clear IRQ affinity=
 hint on device removal)
Merging arm-soc/for-next (938e4801580a soc: document merges)
Merging amlogic/for-next (6a67f2ec541d Merge branch 'v5.8/fixes' into tmp/a=
ml-rebuild)
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
Merging qcom/for-next (62d755043967 Merge branches 'arm64-defconfig-for-5.9=
', 'arm64-for-5.9', 'drivers-for-5.9' and 'dts-for-5.9' into for-next)
Merging raspberrypi/for-next (25c6f3960764 ARM: dts: bcm2711: Add HDMI DVP)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (a98d016e408a Merge branch 'renesas-arm-defconfig-for-=
v5.9' into renesas-next)
Merging reset/reset/next (3b9164c0f173 dt-bindings: reset: Convert i.MX7 re=
set to json-schema)
Merging rockchip/for-next (64d933dc4cb6 Merge branch 'v5.9-clk/next' into f=
or-next)
Merging samsung-krzk/for-next (30f16ea45902 Merge branch 'next/soc' into fo=
r-next)
Merging scmi/for-linux-next (f8c83e0509ac Merge branch 'for-next/scmi' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging sunxi/sunxi/for-next (c3af8223782c Merge branch 'sunxi/config-for-5=
.9' into sunxi/for-next)
Merging tegra/for-next (83a7f685290a Merge branch for-5.9/arm64/dt into for=
-next)
Merging ti-k3/ti-k3-next (eac99d38f861 arm64: dts: ti: k3-am654-main: Updat=
e otap-del-sel values)
Merging uniphier/for-next (da05407bd853 Merge branch 'dt64' into for-next)
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
Merging m68knommu/for-next (3b554410a617 m68k: stmark2: enable edma support=
 for dspi)
Merging microblaze/next (b3a9e3b9622a Linux 5.8-rc1)
Merging mips/mips-next (520010668a26 MIPS: Loongson64: Make acpi_registers_=
setup() static)
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
Merging risc-v/for-next (5597bda48f0e riscv: Enable LOCKDEP_SUPPORT & fixup=
 TRACE_IRQFLAGS_SUPPORT)
Merging s390/features (a303e88743f6 s390/zcrypt: provide cex4 cca sysfs att=
ributes for cex3)
Merging sh/for-next (79eec5f23d34 sh: Implement __get_user_u64() required f=
or 64-bit get_user())
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (f6e8c474390b um: virtio: Replace zero-length array =
with flexible-array)
Merging xtensa/xtensa-for-next (ee769ebbe9e5 xtensa: simplify xtensa_pmu_ir=
q_handler)
Merging fscrypt/master (4f74d15fe408 ext4: add inline encryption support)
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (b624bc241da5 Merge branch 'for-next-next-v5.8-20200=
709' into for-next-20200709)
Merging ceph/master (7ed286f3e061 libceph: don't omit used_replica in targe=
t_copy())
Merging cifs/for-next (a8dab63ea623 cifs: update internal module version nu=
mber)
Merging configfs/for-next (8aebfffacfa3 configfs: fix config_item refcnt le=
ak in configfs_rmdir())
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (b3a9e3b9622a Linux 5.8-rc1)
Merging exfat/dev (b0d26c2a20af exfat: fix wrong hint_stat initialization i=
n exfat_find_dir_entry())
Merging ext3/for_next (75be15e3691f Pull writeback fixes from me.)
Merging ext4/dev (7b97d868b7ab ext4, jbd2: ensure panic by fix a race betwe=
en jbd2 abort and ext4 error handlers)
Merging f2fs/dev (16871738b342 f2fs: add symbolic link to kobject in sysfs)
CONFLICT (content): Merge conflict in Documentation/filesystems/f2fs.rst
Merging fsverity/fsverity (9cd6b593cfc9 fs-verity: remove unnecessary exter=
n keywords)
Merging fuse/for-next (9b46418c40fe fuse: copy_file_range should truncate c=
ache)
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (dcb7fd82c75e Linux 5.8-rc4)
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
Merging xfs/for-next (c3f2375b90d0 xfs: Fix false positive lockdep warning =
with sb_internal & fs_reclaim)
Merging zonefs/for-next (568776f992c4 zonefs: Replace uuid_copy() with impo=
rt_uuid())
Merging iomap/iomap-for-next (d1b4f507d71d iomap: Make sure iomap_end is ca=
lled after iomap_begin)
Merging djw-vfs/vfs-for-next (e4f9ba20d3b8 fs/xfs: Update xfs_ioctl_setattr=
_dax_invalidate())
Merging file-locks/locks-next (5ef159681309 locks: add locks_move_blocks in=
 posix_lock_inode)
Merging vfs/for-next (7999096fa9cf iov_iter: Move unnecessary inclusion of =
crypto/hash.h)
Merging printk/for-next (06ee73831b38 Merge branch 'for-5.9' into for-next)
Merging pci/next (8a445afd710b Merge branch 'remotes/lorenzo/pci/vmd')
Merging pstore/for-next/pstore (fd49e03280e5 pstore: Fix linking when crypt=
o API disabled)
Merging hid/for-next (31a3942a36f4 Merge branch 'for-5.9/lenovo' into for-n=
ext)
Merging i2c/i2c/for-next (52399f62196e Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i3c/i3c/next (b4203ce05563 i3c master: GETMRL's 3rd byte is optiona=
l even with BCR_IBI_PAYLOAD)
Merging dmi/master (d9d8efd3241b firmware/dmi: Report DMI Bios & EC firmwar=
e release)
Merging hwmon-staging/hwmon-next (7117b8140b4b hwmon: (corsair-cpro) add fa=
n_target)
Merging jc_docs/docs-next (4d010d1447a8 Security: Documentation: Replace de=
precated :c:func: Usage)
CONFLICT (content): Merge conflict in Documentation/filesystems/f2fs.rst
CONFLICT (content): Merge conflict in Documentation/arm64/index.rst
Merging v4l-dvb/master (6f01dfb760c0 media: cros-ec-cec: do not bail on dev=
ice_init_wakeup failure)
Merging v4l-dvb-next/master (2630e1bb0948 media: rkvdec: Fix H264 scaling l=
ist order)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (1a53b7a4bff2 Merge branch 'powercap' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (0363635faa1d cpufreq: CPPC: Reu=
se caps variable in few routines)
Merging cpupower/cpupower (cbf252709337 cpupower: Fix NULL but dereferenced=
 coccicheck errors)
Merging opp/opp/linux-next (e7bf9997c605 opp: core: Add missing export for =
dev_pm_opp_adjust_voltage)
Merging thermal/thermal/linux-next (b78f18a34607 thermal: netlink: Fix comp=
ilation error when CONFIG_NET=3Dn)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (b9f24a697ce0 fs: dlm: set skb mark per peer socket)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (1e2b5a90ded2 RDMA/mlx5: Delete one-time used functio=
ns)
Merging net-next/master (8fb49c0109f4 Merge branch 'Expose-port-split-attri=
butes')
CONFLICT (content): Merge conflict in tools/testing/selftests/bpf/progs/bpf=
_iter_netlink.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/sfc/efx.c
Applying: fix up for "enum pci_channel_state" to "pci_channel_state_t" chan=
ge
Merging bpf-next/master (2977282b63c3 Merge branch 'bpf-libbpf-old-kernel')
Merging ipsec-next/master (428d2459cceb xfrm: introduce oseq-may-wrap flag)
Merging mlx5-next/mlx5-next (4dca650991e4 net/mlx5: Enable QP number reques=
t when creating IPoIB underlay QP)
Merging netfilter-next/master (66846b7d058b Merge branch 'bnxt_en-Driver-up=
date-for-net-next')
Merging ipvs-next/master (66846b7d058b Merge branch 'bnxt_en-Driver-update-=
for-net-next')
Merging wireless-drivers-next/master (f555abfe2923 Merge branch 'wilc1000-m=
ove-out-of-staging')
Merging bluetooth/master (51b64c476a5d Bluetooth: Use whitelist for scan po=
licy when suspending)
Merging mac80211-next/master (29a720c1042f Merge branch 'Marvell-mvpp2-impr=
ovements')
Merging gfs2/for-next (0d7853ebbba3 gfs2: Pass glock holder to gfs2_file_di=
rect_{read,write})
Merging mtd/mtd/next (fbd9b5437b66 mtd: rawnand: stm32_fmc2: get resources =
from parent node)
Merging nand/nand/next (da151e3458c8 dt-bindings: mtd: fsl-upm-nand: Deprec=
ate chip-delay and fsl, upm-wait-flags)
Merging spi-nor/spi-nor/next (0ee2872f105b mtd: spi-nor: winbond: Add suppo=
rt for w25q64jvm)
Merging crypto/master (3d2df84548ed crypto: arm/ghash - use variably sized =
key struct)
Merging drm/drm-next (1cc4af412f40 Merge tag 'drm-intel-next-2020-07-02' of=
 git://anongit.freedesktop.org/drm/drm-intel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_vma.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gvt/handlers.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_fb=
c.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_psp=
.c
Merging amdgpu/drm-next (71920389dc51 drm/amdgpu: add some additional DCE6 =
registers (v6))
Applying: Revert "drm/amdgpu/atomfirmware: fix vram_info fetching for renoi=
r"
Merging drm-intel/for-linux-next (b297bde16c0f drm/i915/gt: Optimise aliasi=
ng-ppgtt allocations)
Merging drm-tegra/drm/tegra/for-next (513776e0c3fb drm/tegra: sor: Use corr=
ect power supply names for HDMI)
Merging drm-misc/for-linux-next (392f9fcb159b drm/edid: Clean up some curly=
 braces)
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
Merging regmap/for-next (4eb22c76d2ca Merge remote-tracking branch 'regmap/=
for-5.9' into regmap-next)
Merging sound/for-next (e2d413f93461 ALSA: Replace with fallthrough pseudo =
keyword in the remaining places)
Merging sound-asoc/for-next (eb873fbde2ed Merge remote-tracking branch 'aso=
c/for-5.9' into asoc-next)
Merging modules/modules-next (b3a9e3b9622a Linux 5.8-rc1)
Merging input/next (6f49c4f5b95b Input: Use fallthrough pseudo-keyword)
Merging block/for-next (ca993f404295 Merge branch 'for-5.9/io_uring' into f=
or-next)
CONFLICT (content): Merge conflict in mm/filemap.c
CONFLICT (content): Merge conflict in include/linux/fs.h
CONFLICT (content): Merge conflict in fs/buffer.c
CONFLICT (content): Merge conflict in fs/btrfs/disk-io.c
Merging device-mapper/for-next (291f7994dfef Merge remote-tracking branch '=
jens/block-5.8' into for-next)
CONFLICT (content): Merge conflict in drivers/md/dm-crypt.c
Merging pcmcia/pcmcia-next (46d079790663 pcmcia: make pccard_loop_tuple() s=
tatic)
Merging mmc/next (1c28f95467f3 mmc: sdhci-msm: Set IO pins in low power sta=
te during suspend)
Merging mfd/for-mfd-next (21b2998d4aae mfd: axp20x-i2c: Do not define 'stru=
ct acpi_device_id' when !CONFIG_ACPI)
Merging backlight/for-backlight-next (c847e429db9d video: backlight: sky814=
52-backlight: Fix some kerneldoc issues)
Merging battery/for-next (5d809cb28056 power: supply: max8998_charger: Corr=
ect ONLINE and add STATUS props)
Merging regulator/for-next (5285ad535313 Merge remote-tracking branch 'regu=
lator/for-5.9' into regulator-next)
Merging security/next-testing (8ca4a830cefa Merge branch 'next-general' int=
o next-testing)
Applying: fix up for "Add a new LSM-supporting anonymous inode interface"
Merging apparmor/apparmor-next (e37986097ba6 apparmor: Use true and false f=
or bool variable)
Merging integrity/next-integrity (20c59ce010f8 ima: extend boot_aggregate w=
ith kernel measurements)
Merging keys/keys-next (b6f61c314649 keys: Implement update for the big_key=
 type)
Merging safesetid/safesetid-next (4d63f7c2e382 security: Add LSM hooks to s=
et*gid syscalls)
Merging selinux/next (54b27f9287a7 selinux: complete the inlining of hashta=
b functions)
Merging smack/next (ef26650a201f Smack: Remove unused inline function smk_a=
d_setfield_u_fs_path_mnt)
Merging tomoyo/master (b3a9e3b9622a Linux 5.8-rc1)
Merging tpmdd/next (786a2aa281f4 Revert commit e918e570415c ("tpm_tis: Remo=
ve the HID IFX0102"))
Merging watchdog/master (dcb7fd82c75e Linux 5.8-rc4)
Merging iommu/next (e5640f21b63d Merge branches 'iommu/fixes', 'arm/renesas=
', 'arm/qcom', 'ppc/pamu', 'x86/amd' and 'core' into next)
Merging vfio/next (4f085ca2f5a8 Merge branch 'v5.8/vfio/kirti-migration-fix=
es' into v5.8/vfio/next)
Merging audit/next (d7481b24b816 audit: issue CWD record to accompany LSM_A=
UDIT_DATA_* records)
Merging devicetree/for-next (046f3f7f7878 MAINTAINERS: Add ADV7180 bindings=
 documentation)
Merging mailbox/mailbox-for-next (e9f901dc05c0 mailbox: qcom: Add ipq6018 a=
pcs compatible)
Merging spi/for-next (00e5759f7d41 Merge remote-tracking branch 'spi/for-5.=
9' into spi-next)
CONFLICT (content): Merge conflict in drivers/memory/Makefile
CONFLICT (content): Merge conflict in drivers/memory/Kconfig
Merging tip/auto-latest (1c14587141a0 Merge branch 'core/urgent')
CONFLICT (content): Merge conflict in drivers/spi/spi.c
Applying: Revert "sched: Remove sched_setscheduler*() EXPORTs"
Merging clockevents/timers/drivers/next (809eb4e9bf9d dt-bindings: timer: A=
dd renesas,em-sti bindings)
Merging edac/edac-for-next (399cd3b33cef Merge branch 'edac-urgent' into ed=
ac-for-next)
Merging irqchip/irq/irqchip-next (005c34ae4b44 irqchip/gic: Atomically upda=
te affinity)
Merging ftrace/for-next (29ce24519c06 ring-buffer: Do not trigger a WARN if=
 clock going backwards is detected)
Merging rcu/rcu/next (3bb1d1bb0740 rcu: Fix kerneldoc comments in rcuupdate=
.h)
Merging kvm/linux-next (bf09fb6cba4f KVM: VMX: Stop context switching MSR_I=
A32_UMWAIT_CONTROL)
Merging kvm-arm/next (00dc864fea01 Merge branch 'kvm-arm64/el2-obj-v4.1' in=
to kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (11362b1befea KVM: PPC: Book3S HV: Close race =
with page faults around memslot flushes)
Merging kvms390/next (23a60f834406 s390/kvm: diagnose 0x318 sync and reset)
Merging xen-tip/linux-next (578c1bb90562 xen/xenbus: let xenbus_map_ring_va=
lloc() return errno values only)
Merging percpu/for-next (dedac37ea96b Merge branch 'for-5.7' into for-next)
Merging workqueues/for-next (10cdb1575954 workqueue: use BUILD_BUG_ON() for=
 compile time test instead of WARN_ON())
Merging drivers-x86/for-next (b3a9e3b9622a Linux 5.8-rc1)
Merging chrome-platform/for-next (e48bc01ed5ad platform/chrome: cros_ec_sen=
sorhub: Fix EC timestamp overflow)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (e190f57df3c7 leds-bcm6328: support second hw blinkin=
g interval)
Merging ipmi/for-next (29a54910152a ipmi: ssif: Remove finished TODO commen=
t about SMBus alert)
Merging driver-core/driver-core-next (e5711945c641 driver core: platform: n=
eed consistent spacing around '-')
CONFLICT (content): Merge conflict in include/linux/device.h
Merging usb/usb-next (acf916c2aae8 usb: ehci-omap: Drop surplus include)
Merging usb-gadget/next (1c11e74e9079 usb: dwc3: keystone: Turn on USB3 PHY=
 before controller)
Merging usb-serial/usb-next (eb0c68ea4246 USB: serial: drop redundant trans=
fer-buffer casts)
Merging usb-chipidea-next/ci-for-usb-next (c71d13f9a868 Documentation: ABI:=
 usb: chipidea: Update Li Jun's e-mail)
Merging phy-next/next (82c8d3869900 phy: allwinner: phy-sun6i-mipi-dphy: Co=
nstify structs)
Merging tty/tty-next (ea1be1e59b19 serial: Remove duplicated macro definiti=
on of port type)
Merging char-misc/char-misc-next (415abcdfd4b8 uio: disable lazy irq disabl=
e to avoid double fire)
Merging extcon/extcon-next (b3a9e3b9622a Linux 5.8-rc1)
Merging soundwire/next (51fe3881a29b soundwire: qcom: Constify static struc=
ts)
Merging thunderbolt/next (ef7e12078ab8 thunderbolt: Fix old style declarati=
on warning)
Applying: thunderbolt: merge fix for kunix_resource changes
Merging staging/staging-next (14442181d204 staging: wfx: always enable Fast=
Ps in combo with new firmwares)
Merging mux/for-next (05f19f7f8944 mux: adgs1408: Add mod_devicetable.h and=
 remove of_match_ptr)
Merging icc/icc-next (65461e26b1fe interconnect: Allow inter-provider pairs=
 to be configured)
Merging dmaengine/next (730bf7a24fd5 dmaengine: fix incorrect return value =
for dma_request_chan())
Merging cgroup/for-next (936f2a70f207 cgroup: add cpu.stat file to root cgr=
oup)
Merging scsi/for-next (275e79f95566 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (b53293fa662e scsi: target: cxgbit: Remove tx flo=
w control code)
Merging vhost/linux-next (cb91909e48a4 tools/virtio: Use tools/include/list=
.h instead of stubs)
Merging rpmsg/for-next (9fa3df4e68ba Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (4672a4a9fbfe Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (b90a732daa15 tools: gpio: fix spurious clo=
se warning in gpio-event-mon)
Merging gpio-intel/for-next (532e762d51d0 gpio: pch: Move IRQ status messag=
e to verbose debug level)
Merging pinctrl/for-next (b58a4d02c577 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (653d96455e1e pinctrl: tigerlake: Add suppor=
t for Tiger Lake-H)
CONFLICT (content): Merge conflict in drivers/pinctrl/intel/pinctrl-baytrai=
l.c
Merging pinctrl-samsung/for-next (7efece8a057f pinctrl: samsung: Use bank n=
ame as irqchip name)
Merging pwm/for-next (b8fb642afa02 pwm: iqs620a: Use lowercase hexadecimal =
literals for consistency)
Merging userns/for-next (f06b71fe4d4c Make the user mode driver code a bett=
er citizen)
Merging ktest/for-next (3ff6685579ae ktest.pl: Add MAIL_MAX_SIZE to limit t=
he amount of log emailed)
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (541f5643d3ed Replace HTTP links with HTTPS ones: KM=
OD KERNEL MODULE LOADER - USERMODE HELPER)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (b950460b2486 Merge branch 'for-5.9/selftests=
-cleanup' into for-next)
Merging coresight/next (2b0949812420 coresight: etm4x: Fix save/restore dur=
ing cpu idle)
Merging rtc/rtc-next (05513a706b4f rtc: imxdi: fix trivial typos)
Merging nvdimm/libnvdimm-for-next (b86153077d5c Merge branch 'for-5.8/papr_=
scm' into libnvdimm-for-next)
Merging at24/at24/for-next (8f3d9f354286 Linux 5.7-rc1)
Merging ntb/ntb-next (b3a9e3b9622a Linux 5.8-rc1)
Merging seccomp/for-next/seccomp (de32bc6e0aef selftests/seccomp: Test SECC=
OMP_IOCTL_NOTIF_ADDFD)
CONFLICT (content): Merge conflict in tools/testing/selftests/seccomp/secco=
mp_bpf.c
Merging kspp/for-next/kspp (26b1a643bdf6 Merge branch 'fix/modules/exposure=
/bin' into for-next/kspp)
CONFLICT (content): Merge conflict in kernel/debug/kdb/kdb_io.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_edid.c
Merging gnss/gnss-next (48778464bb7d Linux 5.8-rc2)
Merging fsi/next (2c01397b71c5 fsi: aspeed: Fix OPB0 byte order register va=
lues)
CONFLICT (content): Merge conflict in drivers/fsi/Kconfig
Merging slimbus/for-next (b3a9e3b9622a Linux 5.8-rc1)
Merging nvmem/for-next (79e491b6b406 nvmem: qfprom: use NVMEM_DEVID_AUTO fo=
r multiple instances)
Merging xarray/xarray (27586ca786a7 XArray: Handle retry entries within xas=
_find_marked)
Merging hyperv/hyperv-next (11478f56f20e hv_netvsc: Use vmbus_requestor to =
generate transaction IDs for VMBus hardening)
Merging auxdisplay/auxdisplay (3f03b6498172 auxdisplay: charlcd: Reuse hex_=
to_bin() instead of custom code)
Merging kgdb/kgdb/for-next (c893de12e1ef kdb: Remove the misfeature 'KDBFLA=
GS')
Merging pidfd/for-next (78f167efbd6c Merge branch 'pidfd' into for-next)
CONFLICT (content): Merge conflict in fs/file.c
CONFLICT (content): Merge conflict in arch/csky/kernel/process.c
CONFLICT (content): Merge conflict in arch/csky/Kconfig
Merging devfreq/devfreq-next (761ce740376b dt-bindings: devfreq: rk3399_dmc=
: Add rockchip,pmu phandle)
Merging hmm/hmm (b3a9e3b9622a Linux 5.8-rc1)
Merging fpga/for-next (8adfb7c694d9 Documentation: fpga: dfl: add descripti=
ons for interrupt related interfaces.)
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
Merging memblock/for-next (3346dd99fb4c MAINTAINERS: remove "PKUNITY SOC DR=
IVERS" entry)
CONFLICT (modify/delete): arch/unicore32/kernel/process.c deleted in memblo=
ck/for-next and modified in HEAD. Version HEAD of arch/unicore32/kernel/pro=
cess.c left in tree.
$ git rm -f arch/unicore32/kernel/process.c
Merging set_fs/set_fs-rw (30ba44edef92 fs: don't allow splice read/write wi=
thout explicit ops)
CONFLICT (content): Merge conflict in fs/btrfs/file.c
CONFLICT (content): Merge conflict in drivers/acpi/battery.c
Merging akpm-current/current (4f5aba5b4fc2 kcov: make some symbols static)
CONFLICT (content): Merge conflict in lib/Makefile
CONFLICT (content): Merge conflict in kernel/rcu/tree.c
CONFLICT (content): Merge conflict in fs/crypto/keysetup_v1.c
CONFLICT (content): Merge conflict in drivers/s390/crypto/ap_bus.h
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (9831eded10da sh: add missing EXPORT_SYMBOL() for __del=
ay)

--Sig_/wuohWAyDsI26gfLncb/cSSI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8IJ84ACgkQAVBC80lX
0GyO4gf/R/FJXe++5qlK2UuoZjZWE8hXD6vt3bIjMbMT7xx9Xbv0x2cNF+KbrRhl
BizRBTKaTapXrndZal8HMUSV1vOXYiD2kixNYJmluVrZwCXvKQQ0VOJQHpC4RL2/
+DN1JtlMYCn9UodXst4+I/DB4eQFEQiVbFlUFtGSWxR04ulmZVqYffsZIIi+KCSK
RoBScAzN5ieMa3m1pNYhZRTQ7oK3DQrVLcvncYbFxy6P7cUBbO5+FyatJNl4uZ2A
0LVqZj5olCGEwNPtbx0dWOPF81B/qmIFK1RyMQGujLm4DuaPgVaM8bKpNrYvmVEq
o5by5vJ/ESHd2TIERK8pxXHIMA3yJQ==
=+7CT
-----END PGP SIGNATURE-----

--Sig_/wuohWAyDsI26gfLncb/cSSI--
