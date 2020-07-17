Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60720223AA7
	for <lists+linux-next@lfdr.de>; Fri, 17 Jul 2020 13:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726079AbgGQLkk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Jul 2020 07:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgGQLkj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Jul 2020 07:40:39 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83F88C061755;
        Fri, 17 Jul 2020 04:40:39 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B7ThP3wfbz9sR4;
        Fri, 17 Jul 2020 21:40:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594986037;
        bh=brdfCrdly93mBou6HNJOL1QgvbU/3Jsg0vr8WnNo3W0=;
        h=Date:From:To:Cc:Subject:From;
        b=U+lhhW0sBsaX3c+vkZ0u/SKAwtSc2DVQXwFdRF+v3kQcjtQyGGivCm8h1B7kVFLHd
         ztR3SEdR0FKGK9lYPxUCQejdHAO5X0ITC5Nk33rgroIfCdA5y822VTSUWRmrBzp0sa
         iqOmhlHNPKHwOiYXq25wYMyMhNQ109EUckBj0USecwmXP2QuaL5hWerfa0ILcKchTu
         zVePmbw/gHEJQwh8JXBVb4CE/9ADA7dffLCauMnKZ+TMcOHR47KKFbmdBHeUx4CtHz
         Fk6X+wmgDenl48ecuHyf5l5dT2xV7uDJx/quzBfq95wJJsn2dEnF5FfVfzpxcrvVfu
         HWiyY8I8WaLdQ==
Date:   Fri, 17 Jul 2020 21:40:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 17
Message-ID: <20200717214036.67fa5379@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r0X=JsAL5aZ7sFpRQqC+qT_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/r0X=JsAL5aZ7sFpRQqC+qT_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20200716:

New tree: init
Changed tree: dmi (from quilt to git)

My fixes tree contains:

  dbf24e30ce2e ("device_cgroup: Fix RCU list debugging warning")

I revreted 3 commits from the powerpc tree due to reported run time
problems.

The sound tree gained a semantic conflict against the dma-mapping tree.

The security tree still had its build failure for which I applied a patch.

The tip tree still had one build failure for which I reverted a commit.
It also gained a conflict against the crypto tree

The kvm tree gained a conflict and a semantic conflict against the
tip tree.

The dmaengine tree gained conflicts against the wireless-drivers-next
and Linus' trees.

The pinctrl tree gained a build failure so I used the version from
next-20200716.

The set_fs tree gained a conflict against the powerpc tree.

The init tree gained a conflict against the block tre.

The akpm-current tree gained conflicts against the crypto and tip trees.
It also gained a build failure for which I applied a patch.

Non-merge commits (relative to Linus' tree): 8001
 8717 files changed, 441636 insertions(+), 169176 deletions(-)

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

I am currently merging 325 trees (counting Linus' and 83 trees of bug
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
Merging origin/master (07a56bb875af Merge tag 'pm-5.8-rc6' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/rafael/linux-pm into master)
Merging fixes/master (dbf24e30ce2e device_cgroup: Fix RCU list debugging wa=
rning)
Merging kbuild-current/fixes (20b1be595282 kbuild: fix single target builds=
 for external modules)
Merging arc-current/for-curr (11ba468877bb Linux 5.8-rc5)
Merging arm-current/fixes (3866f217aaa8 ARM: 8977/1: ptrace: Fix mask for t=
humb breakpoint hook)
Merging arm-soc-fixes/arm/fixes (6d88f162a20a Merge tag 'socfpga_fixes_for_=
v5.8' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into =
arm/fixes)
Merging uniphier-fixes/fixes (48778464bb7d Linux 5.8-rc2)
Merging arm64-fixes/for-next/fixes (5afc78551bf5 arm64: Use test_tsk_thread=
_flag() for checking TIF_SINGLESTEP)
Merging m68k-current/for-linus (3381df095419 m68k: tools: Replace zero-leng=
th array with flexible-array member)
Merging powerpc-fixes/fixes (f0479c4bcbd9 selftests/powerpc: Use proper err=
or code to check fault address)
Merging s390-fixes/fixes (dd9ce2d6eeae MAINTAINERS: update email address fo=
r Gerald Schaefer)
Merging sparc/master (37719576046b arch/sparc: Replace HTTP links with HTTP=
S ones)
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (473309fb8372 net: dp83640: fix SIOCSHWTSTAMP to update =
the struct with actual configuration)
Merging bpf/master (5b801dfb7feb bpf: Fix NULL pointer dereference in __btf=
_resolve_helper_id())
Merging ipsec/master (17175d1a27c6 xfrm: esp6: fix encapsulation header off=
set computation)
Merging netfilter/master (1e9451cbda45 netfilter: nf_tables: fix nat hook t=
able deletion)
Merging ipvs/master (eadede5f9362 Merge branch 'hns3-fixes')
Merging wireless-drivers/master (dc7bd30b97aa mt76: mt7615: fix EEPROM buff=
er size)
Merging mac80211/master (8ff41cc21714 net: qrtr: Fix an out of bounds read =
qrtr_endpoint_post())
Merging rdma-fixes/for-rc (11ba468877bb Linux 5.8-rc5)
Merging sound-current/for-linus (5734e509d5d5 ALSA: hda/realtek - fixup for=
 yet another Intel reference board)
Merging sound-asoc-fixes/for-linus (6cec6c677162 Merge remote-tracking bran=
ch 'asoc/for-5.8' into asoc-linus)
Merging regmap-fixes/for-linus (d56929cfd0b6 Merge remote-tracking branch '=
regmap/for-5.8' into regmap-linus)
Merging regulator-fixes/for-linus (5a8a6124b209 Merge remote-tracking branc=
h 'regulator/for-5.8' into regulator-linus)
Merging spi-fixes/for-linus (420a94bd692a Merge remote-tracking branch 'spi=
/for-5.8' into spi-linus)
Merging pci-current/for-linus (5396956cc7c6 PCI: Make pcie_find_root_port()=
 work for Root Ports)
Merging driver-core.current/driver-core-linus (2451e746478a driver core: Av=
oid deferred probe due to fw_devlink_pause/resume())
Merging tty.current/tty-linus (f743061a85f5 serial: core: Initialise spin l=
ock before use in uart_configure_port())
Merging usb.current/usb-linus (c7300cdf8f68 Merge tag 'usb-serial-5.8-rc6' =
of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into us=
b-linus)
Merging usb-gadget-fixes/fixes (8778eb0927dd usb: gadget: function: fix mis=
sing spinlock in f_uac1_legacy)
Merging usb-serial-fixes/usb-linus (e7b931bee739 USB: serial: iuu_phoenix: =
fix memory corruption)
Merging usb-chipidea-fixes/ci-for-usb-stable (2d79b3360dcc usb: chipidea: c=
ore: add wakeup support for extcon)
Merging phy/fixes (38b1927e5bf9 phy: sun4i-usb: fix dereference of pointer =
phy0 before it is null checked)
Merging staging.current/staging-linus (ef75e14a6c93 staging: comedi: verify=
 array index is correct before using it)
Merging char-misc.current/char-misc-linus (897c44f0bae5 virtio: virtio_cons=
ole: add missing MODULE_DEVICE_TABLE() for rproc serial)
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
Merging omap-fixes/fixes (2a4117df9b43 ARM: dts: Fix dcan driver probe fail=
ed on am437x platform)
Merging kvm-fixes/master (3d9fdc252b52 KVM: MIPS: Fix build errors for 32bi=
t kernel)
Merging kvms390-fixes/master (774911290c58 KVM: s390: reduce number of IO p=
ins to 1)
Merging hwmon-fixes/hwmon (3ce17cd2b949 hwmon: (scmi) Fix potential buffer =
overflow in scmi_hwmon_probe())
Merging nvdimm-fixes/libnvdimm-fixes (543094e19c82 nvdimm/region: always sh=
ow the 'align' attribute)
Merging btrfs-fixes/next-fixes (23e44faaf8e2 Merge branch 'misc-5.8' into n=
ext-fixes)
Merging vfs-fixes/fixes (d4d80e69927a Call sysctl_head_finish on error)
Merging dma-mapping-fixes/for-linus (d9765e41d8e9 dma-pool: do not allocate=
 pool memory from CMA)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (f8456690ba8e Merge tag 'clk-fixes-for-linu=
s' of git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux into master)
Merging samsung-krzk-fixes/fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging devicetree-fixes/dt/linus (0115e6c98c22 dt-bindings: clock: imx: Fi=
x e-mail address)
Merging scsi-fixes/fixes (07d3f0455002 scsi: megaraid_sas: Remove undefined=
 ENABLE_IRQ_POLL macro)
Merging drm-fixes/drm-fixes (524d4f71e755 Merge tag 'drm-intel-fixes-2020-0=
7-15' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (92e0575b9983 drm/i915: Recalc=
ulate FBC w/a stride when needed)
Merging mmc-fixes/fixes (ebd4050c6144 mmc: sdhci-of-aspeed: Fix clock divid=
er calculation)
Merging rtc-fixes/rtc-fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging gnss-fixes/gnss-linus (48778464bb7d Linux 5.8-rc2)
Merging hyperv-fixes/hyperv-fixes (77b48bea2fee Drivers: hv: Change flag to=
 write log level in panic msg to false)
Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq h=
andlers after dpio create)
Merging risc-v-fixes/fixes (0cac21b02ba5 riscv: use 16KB kernel stack on 64=
-bit)
Merging pidfd-fixes/fixes (c17d1a3a8ee4 fork: annotate data race in copy_pr=
ocess())
Merging fpga-fixes/fixes (8614afd689df fpga: dfl: fix bug in port reset han=
dshake)
Merging spdx/spdx-linus (3d77e6a8804a Linux 5.7)
Merging gpio-intel-fixes/fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging pinctrl-intel-fixes/fixes (45c11a927606 pinctrl: baytrail: Fix pin =
being driven low for a while on gpiod_get(..., GPIOD_OUT_HIGH))
Merging erofs-fixes/fixes (9ebcfadb0610 Linux 5.8-rc3)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (c63d2dd7e134 Documentation: kunit: Add som=
e troubleshooting tips to the FAQ)
Merging drm-misc-fixes/for-linux-next-fixes (6348dd291e36 dmabuf: use spinl=
ock to access dmabuf->name)
Merging kspp-gustavo/for-next/kspp (48778464bb7d Linux 5.8-rc2)
Merging kbuild/for-next (0816600a3111 Merge branch 'kconfig' into for-next)
Merging compiler-attributes/compiler-attributes (98d54f81e36b Linux 5.6-rc4)
Merging dma-mapping/for-next (8088d8737bb8 powerpc: use the generic dma_ops=
_bypass mode)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (03c7f5f0b844 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (5fef5dc17f09 Merge branch 'for-next/mte' into =
for-next/core)
Merging arm-perf/for-next/perf (f011856ce7b6 perf/smmuv3: To simplify code =
for ioremap page in pmcg)
Merging arm-soc/for-next (eec3b7c0c0f8 soc: document merges)
Merging amlogic/for-next (921856df453b Merge branch 'v5.9/dt64' into tmp/am=
l-rebuild)
Merging aspeed/for-next (33f466eef906 ARM: dts: aspeed: mihawk: Add 8 tmp40=
1 thermal sensors)
Merging at91/at91-next (ec539e70d882 Merge branches 'at91-soc', 'at91-dt' a=
nd 'at91-defconfig' into at91-next)
Merging imx-mxs/for-next (3c6ec3e310c0 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (a158c2b7ec23 Merge branch 'for_5.8/driver-soc' into =
next)
Merging mediatek/for-next (647a84d1e4dc Merge branch 'v5.8-next/soc' into f=
or-next)
Merging mvebu/for-next (869da228bd45 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (a5b4d0a1b174 Merge branch 'omap-for-v5.9/ti-sysc-dro=
p-pdata-take2' into for-next)
Merging qcom/for-next (0a64d9befd91 Merge branches 'arm64-defconfig-for-5.9=
', 'arm64-for-5.9', 'drivers-for-5.9' and 'dts-for-5.9' into for-next)
Merging raspberrypi/for-next (25c6f3960764 ARM: dts: bcm2711: Add HDMI DVP)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (8e5a980249d6 Merge branch 'renesas-arm-dt-for-v5.9' i=
nto renesas-next)
Merging reset/reset/next (3b9164c0f173 dt-bindings: reset: Convert i.MX7 re=
set to json-schema)
Merging rockchip/for-next (64d933dc4cb6 Merge branch 'v5.9-clk/next' into f=
or-next)
Merging samsung-krzk/for-next (30f16ea45902 Merge branch 'next/soc' into fo=
r-next)
Merging scmi/for-linux-next (0f37c611c1f8 Merge tag 'scmi-updates-5.9' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging sunxi/sunxi/for-next (193762b7740b Merge branches 'sunxi/config-for=
-5.9' and 'sunxi/fixes-for-5.8' into sunxi/for-next)
Merging tegra/for-next (04872020ab98 Merge branch for-5.9/arm64/dt into for=
-next)
Merging ti-k3/ti-k3-next (eac99d38f861 arm64: dts: ti: k3-am654-main: Updat=
e otap-del-sel values)
Merging uniphier/for-next (4f8fb65af529 Merge branch 'dt64' into for-next)
Merging clk/clk-next (5c09ea8bf3a0 Merge branch 'clk-fixes' into clk-next)
Merging clk-samsung/for-next (3d77e6a8804a Linux 5.7)
Merging csky/linux-next (f4dd2edafba0 csky: add support for SECCOMP and SEC=
COMP_FILTER)
Merging h8300/h8300-next (9d48776fc609 Merge remote-tracking branch 'origin=
/master' into h8300-next)
Merging ia64/next (172e7890406d tty/serial: cleanup after ioc*_serial drive=
r removal)
Merging m68k/for-next (382f429bb559 m68k: defconfig: Update defconfigs for =
v5.8-rc3)
Merging m68knommu/for-next (3b554410a617 m68k: stmark2: enable edma support=
 for dspi)
Merging microblaze/next (b3a9e3b9622a Linux 5.8-rc1)
Merging mips/mips-next (67d0662ce911 MIPS: Prevent READ_IMPLIES_EXEC propag=
ation)
Merging nds32/next (548cbab5e7bc nds32: configs: Cleanup CONFIG_CROSS_COMPI=
LE)
Merging nios2/for-next (6b57fa4d374b nios2: signal: Mark expected switch fa=
ll-through)
Merging openrisc/for-next (6bd140e14d9a openrisc: Fix issue with argument c=
lobbering for clone/fork)
Merging parisc-hd/for-next (fb775a8805ed parisc: Whitespace cleanups in ato=
mic.h)
Merging powerpc/next (61f879d97ce4 powerpc/pseries: Detect secure and trust=
ed boot state of the system.)
Applying: Revert "powerpc/mm/book3s64/radix: Off-load TLB invalidations to =
host when !GTSE"
Applying: Revert "powerpc/pseries: H_REGISTER_PROC_TBL should ask for GTSE =
only if enabled"
Applying: Revert "powerpc/mm: Enable radix GTSE only if supported."
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (e9e4ef9116b1 soc: fsl: dpio: Remove unused inline fun=
ction qbman_write_eqcr_am_rt_register)
Merging risc-v/for-next (375e2bad2f8c riscv: Add STACKPROTECTOR supported)
Merging s390/features (6589c93f9989 s390: add trace events for idle enter/e=
xit)
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
Merging btrfs/for-next (c0e7348a211d Merge branch 'for-next-next-v5.8-20200=
715' into for-next-20200715)
Merging ceph/master (7ed286f3e061 libceph: don't omit used_replica in targe=
t_copy())
Merging cifs/for-next (e9225f19dfd0 cifs: Remove the superfluous break)
Merging configfs/for-next (8aebfffacfa3 configfs: fix config_item refcnt le=
ak in configfs_rmdir())
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (b3a9e3b9622a Linux 5.8-rc1)
Merging exfat/dev (3d30fdf76680 exfat: fix name_hash computation on big end=
ian systems)
Merging ext3/for_next (0abc0d5654d4 Pull fsnotify and fanotify cleanups fro=
m Amir)
Merging ext4/dev (7b97d868b7ab ext4, jbd2: ensure panic by fix a race betwe=
en jbd2 abort and ext4 error handlers)
Merging f2fs/dev (fa95c1f6f9c8 f2fs: use generic names for generic ioctls)
CONFLICT (content): Merge conflict in Documentation/filesystems/f2fs.rst
Merging fsverity/fsverity (9cd6b593cfc9 fs-verity: remove unnecessary exter=
n keywords)
Merging fuse/for-next (31070f6ccec0 fuse: Fix parameter for FS_IOC_{GET,SET=
}FLAGS)
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (11ba468877bb Linux 5.8-rc5)
Merging nfs-anna/linux-next (913fadc5b105 NFS: Fix interrupted slots by sen=
ding a solo SEQUENCE operation)
Merging nfsd/nfsd-next (c428aa8ef0cc SUNRPC: Add missing definition of ARCH=
_IMPLEMENTS_FLUSH_DCACHE_PAGE)
Merging orangefs/for-next (0df556457748 orangefs: convert get_user_pages() =
--> pin_user_pages())
Merging overlayfs/overlayfs-next (4518dfcf761e ovl: fix lookup of indexed h=
ardlinks with metacopy)
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
Merging printk/for-next (d0557f794473 Merge branch 'printk-rework' into for=
-next)
Merging pci/next (8a445afd710b Merge branch 'remotes/lorenzo/pci/vmd')
Merging pstore/for-next/pstore (fd49e03280e5 pstore: Fix linking when crypt=
o API disabled)
Merging hid/for-next (4324aef0ec65 Merge branch 'for-5.9/core-v2' into for-=
next)
Merging i2c/i2c/for-next (52399f62196e Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i3c/i3c/next (b4203ce05563 i3c master: GETMRL's 3rd byte is optiona=
l even with BCR_IBI_PAYLOAD)
Merging dmi/dmi-for-next (a3d13a0a23ea Replace HTTP links with HTTPS ones: =
DMI/SMBIOS SUPPORT)
Merging hwmon-staging/hwmon-next (1be223e3c7b1 hwmon: add Corsair Commander=
 Pro driver)
Merging jc_docs/docs-next (f33d4075e512 docs: openrisc: Replace HTTP links =
with HTTPS ones)
CONFLICT (content): Merge conflict in Documentation/filesystems/f2fs.rst
CONFLICT (content): Merge conflict in Documentation/arm64/index.rst
Merging v4l-dvb/master (6f01dfb760c0 media: cros-ec-cec: do not bail on dev=
ice_init_wakeup failure)
Merging v4l-dvb-next/master (2630e1bb0948 media: rkvdec: Fix H264 scaling l=
ist order)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (e1f8d84fc3fe Merge branch 'pm-cpufreq' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (5063a8eae0c7 cpufreq: imx: Sele=
ct NVMEM_IMX_OCOTP)
Merging cpupower/cpupower (cbf252709337 cpupower: Fix NULL but dereferenced=
 coccicheck errors)
Merging opp/opp/linux-next (52d82df42eef opp: ti-opp-supply: Replace HTTP l=
inks with HTTPS ones)
Merging thermal/thermal/linux-next (43cfd32deab5 thermal: core: remove redu=
ndant initialization of variable ret)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (b9f24a697ce0 fs: dlm: set skb mark per peer socket)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (cbeb7d896c0f RDMA/counter: Allow manually bind QPs w=
ith different pids to same counter)
Merging net-next/master (4291dc1a5608 Merge branch 'net-sched-do-not-drop-r=
oot-lock-in-tcf_qevent_handle')
CONFLICT (content): Merge conflict in kernel/bpf/btf.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/sfc/efx.c
Applying: fix up for "enum pci_channel_state" to "pci_channel_state_t" chan=
ge
Merging bpf-next/master (bfdfa51702de bpf: Drop duplicated words in uapi he=
lper comments)
Merging ipsec-next/master (0a82f3f08361 Merge remote-tracking branch 'origi=
n/testing')
Merging mlx5-next/mlx5-next (4c2573e1f6c7 net/mlx5: Enable count action for=
 rules with allow action)
Merging netfilter-next/master (3354c2769965 netfilter: Use fallthrough pseu=
do-keyword)
Merging ipvs-next/master (66846b7d058b Merge branch 'bnxt_en-Driver-update-=
for-net-next')
Merging wireless-drivers-next/master (0e20c3e10333 wireless: Fix trivial sp=
elling)
Merging bluetooth/master (339ddaa62699 Bluetooth: Fix update of connection =
state in `hci_encrypt_cfm`)
Merging mac80211-next/master (29a720c1042f Merge branch 'Marvell-mvpp2-impr=
ovements')
Merging gfs2/for-next (0d7853ebbba3 gfs2: Pass glock holder to gfs2_file_di=
rect_{read,write})
Merging mtd/mtd/next (fbd9b5437b66 mtd: rawnand: stm32_fmc2: get resources =
from parent node)
Merging nand/nand/next (da151e3458c8 dt-bindings: mtd: fsl-upm-nand: Deprec=
ate chip-delay and fsl, upm-wait-flags)
Merging spi-nor/spi-nor/next (fb249e1007e0 Merge tag 'spi-mem-dtr' into spi=
-nor/next)
Merging crypto/master (1b3eeb8761f0 crypto: chelsio - Fix some pr_xxx messa=
ges)
Merging drm/drm-next (1cc4af412f40 Merge tag 'drm-intel-next-2020-07-02' of=
 git://anongit.freedesktop.org/drm/drm-intel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_vma.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gvt/handlers.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_fb=
c.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_psp=
.c
Merging amdgpu/drm-next (d7373aaf7383 drm/amdgpu: add some additional DCE6 =
registers (v7))
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_psp=
.c
Applying: Revert "drm/amdgpu/atomfirmware: fix vram_info fetching for renoi=
r"
Merging drm-intel/for-linux-next (fb6a6ea94f98 drm/i915: Soften the tasklet=
 flush frequency before waits)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_probe_helper.c
Merging drm-tegra/drm/tegra/for-next (99963eaf28fe gpu: host1x: mipi: Split=
 tegra_mipi_calibrate() and tegra_mipi_wait())
Merging drm-misc/for-linux-next (a786e8cab152 drm/ingenic: Bump driver to v=
ersion 1.1)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_vm_=
sdma.c
Merging drm-msm/msm-next (bead89dec68a drm/msm: dsi: Use OPP API to set clk=
/perf state)
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (2c76b324c794 drm/imx: parallel-display: Adjus=
t bus_flags handling)
Merging etnaviv/etnaviv/next (6a5ef3b224c6 drm/etnaviv: Simplify clock enab=
le/disable)
Merging regmap/for-next (c9fadf212afd Merge remote-tracking branch 'regmap/=
for-5.9' into regmap-next)
Merging sound/for-next (52bedfbd45eb ALSA: usb-audio: Replace blacklist wor=
d)
Applying: merge fix for dma_is_direct() removal
Merging sound-asoc/for-next (35f677cdcf31 Merge remote-tracking branch 'aso=
c/for-5.9' into asoc-next)
Merging modules/modules-next (b3a9e3b9622a Linux 5.8-rc1)
Merging input/next (606e70220784 Input: mt - cleanup open-coded __set_bit())
Merging block/for-next (ed8b7b4d1002 Merge branch 'for-5.9/drivers' into fo=
r-next)
CONFLICT (content): Merge conflict in fs/buffer.c
CONFLICT (content): Merge conflict in fs/btrfs/disk-io.c
Merging device-mapper/for-next (02622abba2da dm crypt: Enable zoned block d=
evice support)
CONFLICT (content): Merge conflict in drivers/md/dm-crypt.c
Merging pcmcia/pcmcia-next (46d079790663 pcmcia: make pccard_loop_tuple() s=
tatic)
Merging mmc/next (c624b49a40ae Merge branch 'fixes' into next)
Merging mfd/for-mfd-next (ae387961ae94 mfd: core: Add OF_MFD_CELL_REG() hel=
per)
Applying: fix up for struct mfd_cell change
Merging backlight/for-backlight-next (c847e429db9d video: backlight: sky814=
52-backlight: Fix some kerneldoc issues)
Merging battery/for-next (5d809cb28056 power: supply: max8998_charger: Corr=
ect ONLINE and add STATUS props)
Merging regulator/for-next (f8369b5d78de Merge remote-tracking branch 'regu=
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
Merging iommu/next (8da45cf05a9f Merge branches 'iommu/fixes', 'arm/renesas=
', 'arm/qcom', 'arm/mediatek', 'arm/omap', 'ppc/pamu', 'x86/amd' and 'core'=
 into next)
Merging vfio/next (4f085ca2f5a8 Merge branch 'v5.8/vfio/kirti-migration-fix=
es' into v5.8/vfio/next)
Merging audit/next (d7481b24b816 audit: issue CWD record to accompany LSM_A=
UDIT_DATA_* records)
Merging devicetree/for-next (c46ed28dbe95 dt-bindings: pwm: samsung: Do not=
 require interrupts on Exynos SoCs)
Merging mailbox/mailbox-for-next (e9f901dc05c0 mailbox: qcom: Add ipq6018 a=
pcs compatible)
Merging spi/for-next (e3c1bb248f15 Merge remote-tracking branch 'spi/for-5.=
9' into spi-next)
CONFLICT (content): Merge conflict in drivers/memory/Makefile
CONFLICT (content): Merge conflict in drivers/memory/Kconfig
Merging tip/auto-latest (8b68f1cda59d Merge branch 'irq/urgent')
CONFLICT (content): Merge conflict in drivers/spi/spi.c
CONFLICT (modify/delete): arch/x86/include/asm/inst.h deleted in HEAD and m=
odified in tip/auto-latest. Version tip/auto-latest of arch/x86/include/asm=
/inst.h left in tree.
Applying: Revert "sched: Remove sched_setscheduler*() EXPORTs"
Merging clockevents/timers/drivers/next (809eb4e9bf9d dt-bindings: timer: A=
dd renesas,em-sti bindings)
Merging edac/edac-for-next (399cd3b33cef Merge branch 'edac-urgent' into ed=
ac-for-next)
Merging irqchip/irq/irqchip-next (005c34ae4b44 irqchip/gic: Atomically upda=
te affinity)
Merging ftrace/for-next (29ce24519c06 ring-buffer: Do not trigger a WARN if=
 clock going backwards is detected)
Merging rcu/rcu/next (5707b0d01724 rcutorture: Add CONFIG_PROVE_RCU_LIST to=
 TREE05)
Merging kvm/linux-next (c34b26b98cac KVM: MIPS: clean up redundant 'kvm_run=
' parameters)
CONFLICT (content): Merge conflict in arch/x86/kernel/kvm.c
Applying: fix up for idtentry_{enter,exit}_cond_rcu() renaming
Merging kvm-arm/next (b72eb1f68137 Merge branch 'kvm-arm64/pre-nv-5.9' into=
 kvmarm-master/next)
CONFLICT (content): Merge conflict in arch/arm64/kvm/mmu.c
CONFLICT (content): Merge conflict in arch/arm64/kvm/handle_exit.c
CONFLICT (content): Merge conflict in arch/arm64/include/asm/kvm_coproc.h
Merging kvm-ppc/kvm-ppc-next (11362b1befea KVM: PPC: Book3S HV: Close race =
with page faults around memslot flushes)
Merging kvms390/next (23a60f834406 s390/kvm: diagnose 0x318 sync and reset)
CONFLICT (content): Merge conflict in include/uapi/linux/kvm.h
Merging xen-tip/linux-next (ba8c42348897 xen/xenbus: Fix a double free in x=
enbus_map_ring_pv())
Merging percpu/for-next (dedac37ea96b Merge branch 'for-5.7' into for-next)
Merging workqueues/for-next (10cdb1575954 workqueue: use BUILD_BUG_ON() for=
 compile time test instead of WARN_ON())
Merging drivers-x86/for-next (69ce97f2329f Merge branch 'for-next')
Merging chrome-platform/for-next (e48bc01ed5ad platform/chrome: cros_ec_sen=
sorhub: Fix EC timestamp overflow)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (10d3e0d81587 leds: Add multicolor ID to the color ID=
 list)
Merging ipmi/for-next (29a54910152a ipmi: ssif: Remove finished TODO commen=
t about SMBus alert)
Merging driver-core/driver-core-next (da6d647598a6 driver core: Add waiting=
_for_supplier sysfs file for devices)
CONFLICT (content): Merge conflict in include/linux/device.h
Merging usb/usb-next (313da01ad524 usb: misc: sisusbvga: Move static const =
tables out to different include file)
Merging usb-gadget/next (1c11e74e9079 usb: dwc3: keystone: Turn on USB3 PHY=
 before controller)
Merging usb-serial/usb-next (e0439cd97573 USB: serial: sierra: clean up spe=
cial-interface handling)
Merging usb-chipidea-next/ci-for-usb-next (c71d13f9a868 Documentation: ABI:=
 usb: chipidea: Update Li Jun's e-mail)
Merging phy-next/next (0ff35966d171 phy: stm32: use NULL instead of zero)
Merging tty/tty-next (ea1be1e59b19 serial: Remove duplicated macro definiti=
on of port type)
CONFLICT (content): Merge conflict in drivers/video/fbdev/core/fbcon.c
CONFLICT (content): Merge conflict in drivers/tty/serial/qcom_geni_serial.c
Merging char-misc/char-misc-next (fadbfc38dde2 hpilo: Replace one-element a=
rray with flexible-array member)
Merging extcon/extcon-next (b3a9e3b9622a Linux 5.8-rc1)
Merging soundwire/next (3b71c69024a7 soundwire: fix the kernel-doc comment)
Merging thunderbolt/next (ef7e12078ab8 thunderbolt: Fix old style declarati=
on warning)
Applying: thunderbolt: merge fix for kunix_resource changes
Merging staging/staging-next (419317021ccc staging: rtl8188eu: core: fix co=
ding style issues)
Merging mux/for-next (05f19f7f8944 mux: adgs1408: Add mod_devicetable.h and=
 remove of_match_ptr)
Merging icc/icc-next (0d64189c3617 interconnect: msm8916: Fix buswidth of p=
cnoc_s nodes)
Merging dmaengine/next (3bcc3add853e Merge branch 'for-linus' into next)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging cgroup/for-next (936f2a70f207 cgroup: add cpu.stat file to root cgr=
oup)
Merging scsi/for-next (bca2c579a5e9 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (42b840bcfc16 scsi: aic7xxx: Fix 'amount_xferred'=
 set but not used issue)
Merging vhost/linux-next (cb91909e48a4 tools/virtio: Use tools/include/list=
.h instead of stubs)
Merging rpmsg/for-next (d162e4c5d8b8 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (eb211a587e18 Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (df51f402e3b1 tools: gpio: fix spurious clo=
se warning in gpio-event-mon)
Merging gpio-intel/for-next (532e762d51d0 gpio: pch: Move IRQ status messag=
e to verbose debug level)
Merging pinctrl/for-next (38342ae684af Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in drivers/pinctrl/pinctrl-single.c
$ git reset --hard HEAD^
Merging next-20200716 version of pinctrl
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
Merging livepatching/for-next (bf14b015bf51 Merge branch 'for-5.9/selftests=
-cleanup' into for-next)
Merging coresight/next (2b0949812420 coresight: etm4x: Fix save/restore dur=
ing cpu idle)
Merging rtc/rtc-next (a5e6f964bb2c rtc: cleanup obsolete comment about stru=
ct rtc_class_ops)
Merging nvdimm/libnvdimm-for-next (b86153077d5c Merge branch 'for-5.8/papr_=
scm' into libnvdimm-for-next)
Merging at24/at24/for-next (8f3d9f354286 Linux 5.7-rc1)
Merging ntb/ntb-next (b3a9e3b9622a Linux 5.8-rc1)
Merging seccomp/for-next/seccomp (c97aedc52dce selftests/seccomp: Test SECC=
OMP_IOCTL_NOTIF_ADDFD)
Merging kspp/for-next/kspp (36f78758dca5 Merge branch 'kspp/tasklets/new-ap=
i/v1' into for-next/kspp)
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
Merging kgdb/kgdb/for-next (2c308ef41351 kgdb: Make "kgdbcon" work properly=
 with "kgdb_earlycon")
Merging pidfd/for-next (b2763dd39a78 Merge branch 'pidfd' into for-next)
CONFLICT (content): Merge conflict in fs/file.c
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
CONFLICT (content): Merge conflict in arch/csky/kernel/process.c
CONFLICT (content): Merge conflict in arch/csky/Kconfig
Merging devfreq/devfreq-next (3aa66b690fdc memory: samsung: exynos5422-dmc:=
 Use delayed timer as default)
Merging hmm/hmm (b223555dc4ed nouveau/hmm: support mapping large sysmem pag=
es)
Merging fpga/for-next (eacfbf589c90 fpga: dfl: pci: add device id for Intel=
 FPGA PAC N3000)
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
Merging mhi/mhi-next (8613fc59031e mhi: fix doubled words and struct image_=
info kernel-doc)
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
Merging set_fs/set_fs-rw (2750e3608b79 fs: don't allow splice read/write wi=
thout explicit ops)
CONFLICT (content): Merge conflict in fs/btrfs/file.c
CONFLICT (content): Merge conflict in drivers/acpi/battery.c
CONFLICT (content): Merge conflict in arch/powerpc/mm/numa.c
Merging init/init-user-pointers (d12bd437760b initramfs: use vfs_utimes in =
do_copy)
CONFLICT (content): Merge conflict in drivers/md/md.c
Merging akpm-current/current (40346f79983c ipc/shm.c: Remove the superfluou=
s break)
CONFLICT (content): Merge conflict in mm/cma.h
CONFLICT (content): Merge conflict in lib/cpumask.c
CONFLICT (content): Merge conflict in lib/Makefile
CONFLICT (content): Merge conflict in kernel/rcu/tree.c
CONFLICT (content): Merge conflict in fs/crypto/keysetup_v1.c
CONFLICT (content): Merge conflict in drivers/s390/crypto/ap_bus.h
CONFLICT (content): Merge conflict in drivers/crypto/mediatek/mtk-aes.c
CONFLICT (content): Merge conflict in arch/arm64/mm/init.c
CONFLICT (content): Merge conflict in Documentation/filesystems/proc.rst
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (39eea6d7709c sh: add missing EXPORT_SYMBOL() for __del=
ay)
Applying: fix up for hugetlb.c code movement

--Sig_/r0X=JsAL5aZ7sFpRQqC+qT_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8RjjQACgkQAVBC80lX
0Gye/Qf/aHU2WjDZCaVzJOaBTAUBLGnEe2sdytY1oJu2cMw6W2urGg71jNnbE0Cl
BOt4b4tf1mxGC87OXoYPvePwrAcaP5zT2yNswxgHEs0DqjYEGy8UKON9ud0emr8n
OAIoUXX2nIocpvNFHU7iAU0XK1tJd8fIxgefBtWrbgDyJVDUZWvoiyEkORhGpS0M
vxjcFrOrG1Igu0opihoJFoT6YUdymONWFyOQ5bjKjuXyainDkNpOAJdpnT0lWYbj
wUbPXWzdOJrrl4lBSSdjUjmLyLPdyQQJM/PusVbkx8CUUhVrflq8E0MZ6BcZTTsS
5/V+nQk4MOP5jsu5Jxw4JFuRvhg2BQ==
=v8hL
-----END PGP SIGNATURE-----

--Sig_/r0X=JsAL5aZ7sFpRQqC+qT_--
