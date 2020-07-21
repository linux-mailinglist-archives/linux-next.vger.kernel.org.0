Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E072227E13
	for <lists+linux-next@lfdr.de>; Tue, 21 Jul 2020 13:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbgGULFE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Jul 2020 07:05:04 -0400
Received: from ozlabs.org ([203.11.71.1]:58113 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729349AbgGULFC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 21 Jul 2020 07:05:02 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B9wjN2SsQz9sR4;
        Tue, 21 Jul 2020 21:04:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595329496;
        bh=OYOjy8+DwhyiBYryiOnrtY9LV5Xth+wrCTZCB3L1B3E=;
        h=Date:From:To:Cc:Subject:From;
        b=rqbNGceS0NzZtmkY9BFRqE2vvBZigZEF1BromIOBqku+sccPn1H0CcytX+xpTyVnJ
         N4C1lUbYiq8Zfo1iTQUZSSucyLDJjkdWS99bYWog85AIQhGuAEX9V0veXPICK/E33I
         NFNUDZZpvXsFfU5jbnnr/9wIA9HBqHOwmQkrGYjI3q69cB+zerA/pW5HChRuLmTlDk
         SrKlkrtROMG7JlukF26k/lvEMNTUw5zbPbr8XyzG1e7c992HxOvn58ny9fncA+Eg7F
         jY729IiSjxDWteAhOi2ovSSfln/+E5t2qKHiubmL23xrgagHmAI/xSwN5LR0upIK+K
         /U6e1NVD2MJHQ==
Date:   Tue, 21 Jul 2020 21:04:55 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 21
Message-ID: <20200721210455.28cbd1bc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/p7_lhoQLkAi=dR8FWs7qriY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/p7_lhoQLkAi=dR8FWs7qriY
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20200720:

My fixes tree contains:

  dbf24e30ce2e ("device_cgroup: Fix RCU list debugging warning")

The net-next tree gained a conflict against the net tree.

The bpf-next tree gained conflicts against the net-next tree.

The security tree still had its build failure for which I applied a patch.

The tip tree still had one build failure for which I reverted a
commit. Also its conflict against the crypto tree changed.

The dmaengine tree gained a conflict against the phy-next tree.

The scsi-mkp tree gained a build failure so I marked a CONFIG option
as broken.

The akpm-current tree lost its build failure, but gained another for
which I applied a patch.  It also gained a conflict against the net-next
tree.

Non-merge commits (relative to Linus' tree): 8926
 9798 files changed, 485913 insertions(+), 185627 deletions(-)

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
Merging origin/master (4fa640dc5230 Merge tag 'vfio-v5.8-rc7' of git://gith=
ub.com/awilliam/linux-vfio into master)
Merging fixes/master (dbf24e30ce2e device_cgroup: Fix RCU list debugging wa=
rning)
Merging kbuild-current/fixes (20b1be595282 kbuild: fix single target builds=
 for external modules)
Merging arc-current/for-curr (11ba468877bb Linux 5.8-rc5)
Merging arm-current/fixes (f1a3868bcdb3 ARM: 8988/1: mmu: fix crash in EFI =
calls due to p4d typo in create_mapping_late())
Merging arm-soc-fixes/arm/fixes (2648298a06ba Merge tag 'socfpga_fixes_for_=
v5.8_v2' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux in=
to arm/fixes)
Merging uniphier-fixes/fixes (48778464bb7d Linux 5.8-rc2)
Merging arm64-fixes/for-next/fixes (f32ed8eb0e3f drivers/perf: Prevent forc=
ed unbinding of PMU drivers)
Merging m68k-current/for-linus (3381df095419 m68k: tools: Replace zero-leng=
th array with flexible-array member)
Merging powerpc-fixes/fixes (f0479c4bcbd9 selftests/powerpc: Use proper err=
or code to check fault address)
Merging s390-fixes/fixes (ba47d845d715 Linux 5.8-rc6)
Merging sparc/master (37719576046b arch/sparc: Replace HTTP links with HTTP=
S ones)
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (544f287b8495 bonding: check error value of register_net=
device() immediately)
Merging bpf/master (5b801dfb7feb bpf: Fix NULL pointer dereference in __btf=
_resolve_helper_id())
Merging ipsec/master (17175d1a27c6 xfrm: esp6: fix encapsulation header off=
set computation)
Merging netfilter/master (1e9451cbda45 netfilter: nf_tables: fix nat hook t=
able deletion)
Merging ipvs/master (eadede5f9362 Merge branch 'hns3-fixes')
Merging wireless-drivers/master (1cfd3426ef98 ath10k: Fix NULL pointer dere=
ference in AHB device probe)
Merging mac80211/master (8ff41cc21714 net: qrtr: Fix an out of bounds read =
qrtr_endpoint_post())
Merging rdma-fixes/for-rc (87c4c774cbef RDMA/cm: Protect access to remote_s=
idr_table)
Merging sound-current/for-linus (568e4e82128a ALSA: hda/realtek: Fixed ALC2=
98 sound bug by adding quirk for Samsung Notebook Pen S)
Merging sound-asoc-fixes/for-linus (427bc230980a Merge remote-tracking bran=
ch 'asoc/for-5.8' into asoc-linus)
Merging regmap-fixes/for-linus (2b0f61e27f75 Merge remote-tracking branch '=
regmap/for-5.8' into regmap-linus)
Merging regulator-fixes/for-linus (cb4a3eacd2f7 Merge remote-tracking branc=
h 'regulator/for-5.8' into regulator-linus)
Merging spi-fixes/for-linus (1da18e35fd89 Merge remote-tracking branch 'spi=
/for-5.8' into spi-linus)
Merging pci-current/for-linus (915930414828 Revert "PCI/PM: Assume ports wi=
thout DLL Link Active train links in 100 ms")
Merging driver-core.current/driver-core-linus (ba47d845d715 Linux 5.8-rc6)
Merging tty.current/tty-linus (ba47d845d715 Linux 5.8-rc6)
Merging usb.current/usb-linus (ba47d845d715 Linux 5.8-rc6)
Merging usb-gadget-fixes/fixes (8778eb0927dd usb: gadget: function: fix mis=
sing spinlock in f_uac1_legacy)
Merging usb-serial-fixes/usb-linus (ba47d845d715 Linux 5.8-rc6)
Merging usb-chipidea-fixes/ci-for-usb-stable (2d79b3360dcc usb: chipidea: c=
ore: add wakeup support for extcon)
Merging phy/fixes (38b1927e5bf9 phy: sun4i-usb: fix dereference of pointer =
phy0 before it is null checked)
Merging staging.current/staging-linus (926234f1b843 staging: comedi: addi_a=
pci_1564: check INSN_CONFIG_DIGITAL_TRIG shift)
Merging char-misc.current/char-misc-linus (b62e185184e9 Merge tag 'misc-hab=
analabs-fixes-2020-07-19' of git://people.freedesktop.org/~gabbayo/linux in=
to char-misc-linus)
Merging soundwire-fixes/fixes (bf6d6e68d202 soundwire: intel: fix memory le=
ak with devm_kasprintf)
Merging thunderbolt-fixes/fixes (8b94a4b92327 thunderbolt: Fix path indices=
 used in USB3 tunnel discovery)
Merging input-current/for-linus (a50ca29523b1 Input: elan_i2c - add more ha=
rdware ID for Lenovo laptops)
Merging crypto-current/master (e04ec0de61c1 padata: upgrade smp_mb__after_a=
tomic to smp_mb in padata_do_serial)
Merging ide/master (b3a9e3b9622a Linux 5.8-rc1)
Merging vfio-fixes/for-linus (b872d0640840 vfio/pci: fix racy on error and =
request eventfd ctx)
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
Merging hwmon-fixes/hwmon (ba47d845d715 Linux 5.8-rc6)
Merging nvdimm-fixes/libnvdimm-fixes (543094e19c82 nvdimm/region: always sh=
ow the 'align' attribute)
Merging btrfs-fixes/next-fixes (23e44faaf8e2 Merge branch 'misc-5.8' into n=
ext-fixes)
Merging vfs-fixes/fixes (8d95867c8610 copy_xstate_to_kernel: Fix typo which=
 caused GDB regression)
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
Merging drm-fixes/drm-fixes (adbe8a3cae94 Merge tag 'amd-drm-fixes-5.8-2020=
-07-15' of git://people.freedesktop.org/~agd5f/linux into drm-fixes)
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
Merging risc-v-fixes/fixes (38b7c2a3ffb1 RISC-V: Upgrade smp_mb__after_spin=
lock() to iorw,iorw)
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
Merging drm-misc-fixes/for-linux-next-fixes (f3f90c6db188 drm/lima: fix wai=
t pp reset timeout)
Merging kspp-gustavo/for-next/kspp (48778464bb7d Linux 5.8-rc2)
Merging kbuild/for-next (0816600a3111 Merge branch 'kconfig' into for-next)
Merging compiler-attributes/compiler-attributes (98d54f81e36b Linux 5.6-rc4)
Merging dma-mapping/for-next (23efed6fa751 dma-debug: use named initializer=
s for dir2name)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (e5b8b1b4fcbe Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (5fef5dc17f09 Merge branch 'for-next/mte' into =
for-next/core)
Merging arm-perf/for-next/perf (5271d915a99c tools headers UAPI: Update too=
ls's copy of linux/perf_event.h)
Merging arm-soc/for-next (fe6031092b43 soc: document merges)
Merging amlogic/for-next (921856df453b Merge branch 'v5.9/dt64' into tmp/am=
l-rebuild)
Merging aspeed/for-next (33f466eef906 ARM: dts: aspeed: mihawk: Add 8 tmp40=
1 thermal sensors)
Merging at91/at91-next (ec539e70d882 Merge branches 'at91-soc', 'at91-dt' a=
nd 'at91-defconfig' into at91-next)
Merging imx-mxs/for-next (3c1a41dab7b8 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (a158c2b7ec23 Merge branch 'for_5.8/driver-soc' into =
next)
Merging mediatek/for-next (647a84d1e4dc Merge branch 'v5.8-next/soc' into f=
or-next)
Merging mvebu/for-next (869da228bd45 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (a5b4d0a1b174 Merge branch 'omap-for-v5.9/ti-sysc-dro=
p-pdata-take2' into for-next)
Merging qcom/for-next (a2a7403b35dc Merge branches 'arm64-defconfig-for-5.9=
', 'arm64-for-5.9', 'drivers-for-5.9' and 'dts-for-5.9' into for-next)
Merging raspberrypi/for-next (25c6f3960764 ARM: dts: bcm2711: Add HDMI DVP)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (344cb4f80fba Merge branch 'renesas-arm-dt-for-v5.9' i=
nto renesas-next)
Merging reset/reset/next (ffebbecaaa86 reset: Replace HTTP links with HTTPS=
 ones)
Merging rockchip/for-next (e4a879a43fee Merge branch 'v5.9-armsoc/dts32' in=
to for-next)
Merging samsung-krzk/for-next (15de1f9da34a Merge branch 'next/dt' into for=
-next)
Merging scmi/for-linux-next (5714ee50bb43 copy_xstate_to_kernel: Fix typo w=
hich caused GDB regression)
Merging sunxi/sunxi/for-next (9afd08499961 Merge branch 'sunxi/dt-for-5.9' =
into sunxi/for-next)
Merging tegra/for-next (2ffcb962f693 Merge branch for-5.9/arm64/dt into for=
-next)
CONFLICT (content): Merge conflict in arch/arm/configs/tegra_defconfig
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
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
Merging powerpc/next (9a77c4a0a125 powerpc/prom: Enable Radix GTSE in cpu p=
a-features)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (e9e4ef9116b1 soc: fsl: dpio: Remove unused inline fun=
ction qbman_write_eqcr_am_rt_register)
Merging risc-v/for-next (375e2bad2f8c riscv: Add STACKPROTECTOR supported)
Merging s390/features (3f161e0ae863 s390/bpf: implement BPF_PROBE_MEM)
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
Merging btrfs/for-next (d1b71a34af52 Merge branch 'for-next-next-v5.8-20200=
720' into for-next-20200720)
Merging ceph/master (7ed286f3e061 libceph: don't omit used_replica in targe=
t_copy())
Merging cifs/for-next (898247695f73 cifs: delete duplicated words in header=
 files)
Merging configfs/for-next (059ccbfff8a8 configfs: use flush file op to comm=
it writes to a binary file)
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
Merging nfs-anna/linux-next (65caafd0d214 SUNRPC reverting d03727b248d0 ("N=
FSv4 fix CLOSE not waiting for direct IO compeletion"))
Merging nfsd/nfsd-next (c428aa8ef0cc SUNRPC: Add missing definition of ARCH=
_IMPLEMENTS_FLUSH_DCACHE_PAGE)
Merging orangefs/for-next (0df556457748 orangefs: convert get_user_pages() =
--> pin_user_pages())
Merging overlayfs/overlayfs-next (4518dfcf761e ovl: fix lookup of indexed h=
ardlinks with metacopy)
Merging ubifs/linux-next (4b68bf9a69d2 ubi: Select fastmap anchor PEBs cons=
idering wear level rules)
Merging v9fs/9p-next (aab6c873cf9b 9p: remove unused code in 9p)
Merging xfs/for-next (c3f2375b90d0 xfs: Fix false positive lockdep warning =
with sb_internal & fs_reclaim)
Merging zonefs/for-next (89ee72376be2 zonefs: count pages after truncating =
the iterator)
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
Merging hid/for-next (2d132b5affef Merge branch 'for-5.8/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (52399f62196e Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i3c/i3c/next (b4203ce05563 i3c master: GETMRL's 3rd byte is optiona=
l even with BCR_IBI_PAYLOAD)
Merging dmi/dmi-for-next (a3d13a0a23ea Replace HTTP links with HTTPS ones: =
DMI/SMBIOS SUPPORT)
Merging hwmon-staging/hwmon-next (c2cb4b5777e1 hwmon: sparx5: Add Sparx5 So=
C temperature driver)
Merging jc_docs/docs-next (f33d4075e512 docs: openrisc: Replace HTTP links =
with HTTPS ones)
CONFLICT (content): Merge conflict in Documentation/filesystems/f2fs.rst
CONFLICT (content): Merge conflict in Documentation/arm64/index.rst
Merging v4l-dvb/master (8f2a4a9d5ff5 media: dvbdev.h: keep * together with =
the type)
Merging v4l-dvb-next/master (0d6db85131e0 Revert "media: atomisp: keep the =
ISP powered on when setting it")
CONFLICT (content): Merge conflict in drivers/staging/media/atomisp/pci/ato=
misp_v4l2.c
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (e1f8d84fc3fe Merge branch 'pm-cpufreq' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (887d5fc82cb4 cpufreq: Add Tegra=
194 cpufreq driver)
Merging cpupower/cpupower (fa0866a1d1be cpupower: Replace HTTP links with H=
TTPS ones)
Merging opp/opp/linux-next (ce162c23fa29 opp: Allow disabled OPPs in dev_pm=
_opp_get_freq())
Merging thermal/thermal/linux-next (5808de986cb4 thermal: core: Move initia=
lization after core initcall)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (b9f24a697ce0 fs: dlm: set skb mark per peer socket)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (5f0b2a6093a4 RDMA/rxe: Prevent access to wr->next pt=
r afrer wr is posted to send queue)
Merging net-next/master (71d4364abdc5 net: dsa: use the ETH_MIN_MTU and ETH=
_DATA_LEN default values)
CONFLICT (content): Merge conflict in kernel/bpf/btf.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/sfc/efx.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/aquantia/atlanti=
c/aq_hw.h
Applying: fix up for "enum pci_channel_state" to "pci_channel_state_t" chan=
ge
Merging bpf-next/master (e57892f50a07 Merge branch 'bpf-socket-lookup')
CONFLICT (content): Merge conflict in include/net/xdp.h
CONFLICT (content): Merge conflict in include/linux/filter.h
Merging ipsec-next/master (0a82f3f08361 Merge remote-tracking branch 'origi=
n/testing')
Merging mlx5-next/mlx5-next (4c2573e1f6c7 net/mlx5: Enable count action for=
 rules with allow action)
Merging netfilter-next/master (73eb67515545 ipvs: ensure RCU read unlock wh=
en connection flushing and ipvs is disabled)
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
Applying: crypto: x86 - Put back integer parts of include/asm/inst.h
Merging drm/drm-next (3ffff3c6855b Merge tag 'drm-misc-next-2020-07-16' of =
git://anongit.freedesktop.org/drm/drm-misc into drm-next)
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
Merging drm-intel/for-linux-next (111822b21be9 drm/i915/rkl: Add Wa_1401122=
4835 for PHY B initialization)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_probe_helper.c
Merging drm-tegra/drm/tegra/for-next (4fba6d22ca9a drm/tegra: plane: Suppor=
t 180=C2=B0 rotation)
Merging drm-misc/for-linux-next (7c7b2a35a97c video: fbdev: Replace HTTP li=
nks with HTTPS ones)
Merging drm-msm/msm-next (6e9c6874fb50 drm: msm: a6xx: fix gpu failure afte=
r system resume)
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (408a85e31e3e drm/imx: imx-tve: Delete an erro=
r message in imx_tve_bind())
Merging etnaviv/etnaviv/next (c5d5a32ead1e drm/etnaviv: fix ref count leak =
via pm_runtime_get_sync)
Merging regmap/for-next (c9fadf212afd Merge remote-tracking branch 'regmap/=
for-5.9' into regmap-next)
Merging sound/for-next (9ab0cb309e79 ALSA: Replace the word "slave" in vmas=
ter API)
Merging sound-asoc/for-next (c516bf58b375 Merge remote-tracking branch 'aso=
c/for-5.9' into asoc-next)
Merging modules/modules-next (c6a8b84da4c2 modules: linux/moduleparam.h: dr=
op duplicated word in a comment)
Merging input/next (606e70220784 Input: mt - cleanup open-coded __set_bit())
Merging block/for-next (d9ad7006330c Merge branch 'for-5.9/block-merge' int=
o for-next)
CONFLICT (content): Merge conflict in fs/buffer.c
CONFLICT (content): Merge conflict in fs/btrfs/disk-io.c
Merging device-mapper/for-next (8e225f04d2dd dm crypt: Enable zoned block d=
evice support)
CONFLICT (content): Merge conflict in drivers/md/dm-crypt.c
Merging pcmcia/pcmcia-next (46d079790663 pcmcia: make pccard_loop_tuple() s=
tatic)
Merging mmc/next (c624b49a40ae Merge branch 'fixes' into next)
Merging mfd/for-mfd-next (c61f4d58eefc mfd: kempld-core: Fix 'assignment of=
 read-only location' error)
Merging backlight/for-backlight-next (b6539a11e807 backlight: backlight: Ma=
ke of_find_backlight static)
Merging battery/for-next (5d809cb28056 power: supply: max8998_charger: Corr=
ect ONLINE and add STATUS props)
Merging regulator/for-next (f8369b5d78de Merge remote-tracking branch 'regu=
lator/for-5.9' into regulator-next)
Merging security/next-testing (8ca4a830cefa Merge branch 'next-general' int=
o next-testing)
Applying: fix up for "Add a new LSM-supporting anonymous inode interface"
Applying: Revert "Wire UFFD up to SELinux"
Merging apparmor/apparmor-next (e37986097ba6 apparmor: Use true and false f=
or bool variable)
Merging integrity/next-integrity (311aa6aafea4 ima: move APPRAISE_BOOTPARAM=
 dependency on ARCH_POLICY to runtime)
Merging keys/keys-next (b6f61c314649 keys: Implement update for the big_key=
 type)
Merging safesetid/safesetid-next (4d63f7c2e382 security: Add LSM hooks to s=
et*gid syscalls)
Merging selinux/next (54b27f9287a7 selinux: complete the inlining of hashta=
b functions)
Merging smack/next (ef26650a201f Smack: Remove unused inline function smk_a=
d_setfield_u_fs_path_mnt)
Merging tomoyo/master (ba47d845d715 Linux 5.8-rc6)
Merging tpmdd/next (786a2aa281f4 Revert commit e918e570415c ("tpm_tis: Remo=
ve the HID IFX0102"))
Merging watchdog/master (5714ee50bb43 copy_xstate_to_kernel: Fix typo which=
 caused GDB regression)
Merging iommu/next (8da45cf05a9f Merge branches 'iommu/fixes', 'arm/renesas=
', 'arm/qcom', 'arm/mediatek', 'arm/omap', 'ppc/pamu', 'x86/amd' and 'core'=
 into next)
Merging vfio/next (4f085ca2f5a8 Merge branch 'v5.8/vfio/kirti-migration-fix=
es' into v5.8/vfio/next)
Merging audit/next (d7481b24b816 audit: issue CWD record to accompany LSM_A=
UDIT_DATA_* records)
Merging devicetree/for-next (8359b4c16e1b dt-bindings: fpga: Replace HTTP l=
inks with HTTPS ones)
Merging mailbox/mailbox-for-next (e9f901dc05c0 mailbox: qcom: Add ipq6018 a=
pcs compatible)
Merging spi/for-next (0b7bfc15db18 Merge remote-tracking branch 'spi/for-5.=
9' into spi-next)
CONFLICT (content): Merge conflict in drivers/memory/Makefile
CONFLICT (content): Merge conflict in drivers/memory/Kconfig
Merging tip/auto-latest (8b68f1cda59d Merge branch 'irq/urgent')
CONFLICT (content): Merge conflict in drivers/spi/spi.c
CONFLICT (content): Merge conflict in arch/x86/include/asm/inst.h
Applying: Revert "sched: Remove sched_setscheduler*() EXPORTs"
Merging clockevents/timers/drivers/next (809eb4e9bf9d dt-bindings: timer: A=
dd renesas,em-sti bindings)
Merging edac/edac-for-next (399cd3b33cef Merge branch 'edac-urgent' into ed=
ac-for-next)
Merging irqchip/irq/irqchip-next (005c34ae4b44 irqchip/gic: Atomically upda=
te affinity)
Merging ftrace/for-next (29ce24519c06 ring-buffer: Do not trigger a WARN if=
 clock going backwards is detected)
Merging rcu/rcu/next (83d0111cc01c refperf: Avoid null pointer dereference =
when buf fails to allocate)
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
Merging leds/for-next (59bb31e8549e leds: multicolor: Introduce a multicolo=
r class definition)
Merging ipmi/for-next (29a54910152a ipmi: ssif: Remove finished TODO commen=
t about SMBus alert)
Merging driver-core/driver-core-next (6bdb486c5a62 Merge 5.8-rc6 into drive=
r-core-next)
CONFLICT (content): Merge conflict in include/linux/device.h
Merging usb/usb-next (eed3c957dd8c Merge 5.8-rc6 into usb-next)
Merging usb-gadget/next (1c11e74e9079 usb: dwc3: keystone: Turn on USB3 PHY=
 before controller)
Merging usb-serial/usb-next (e0439cd97573 USB: serial: sierra: clean up spe=
cial-interface handling)
Merging usb-chipidea-next/ci-for-usb-next (c71d13f9a868 Documentation: ABI:=
 usb: chipidea: Update Li Jun's e-mail)
Merging phy-next/next (f13b89900d36 dt-bindings: phy: renesas,usb3-phy: Add=
 r8a774e1 support)
Merging tty/tty-next (6f2c6599ba70 Merge 5.8-rc6 into tty-next)
CONFLICT (content): Merge conflict in drivers/video/fbdev/core/fbcon.c
CONFLICT (content): Merge conflict in drivers/tty/serial/qcom_geni_serial.c
Merging char-misc/char-misc-next (c4d41d005527 Merge v5.8-rc6 into char-mis=
c-next)
Merging extcon/extcon-next (b3a9e3b9622a Linux 5.8-rc1)
Merging soundwire/next (3b71c69024a7 soundwire: fix the kernel-doc comment)
Merging thunderbolt/next (ef7e12078ab8 thunderbolt: Fix old style declarati=
on warning)
Applying: thunderbolt: merge fix for kunix_resource changes
Merging staging/staging-next (263771dbc85b Merge 5.8-rc6 into staging-next)
Merging mux/for-next (05f19f7f8944 mux: adgs1408: Add mod_devicetable.h and=
 remove of_match_ptr)
Merging icc/icc-next (0d64189c3617 interconnect: msm8916: Fix buswidth of p=
cnoc_s nodes)
Merging dmaengine/next (c7676e7c6dab Merge branch 'topic/xilinx' into next)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging cgroup/for-next (936f2a70f207 cgroup: add cpu.stat file to root cgr=
oup)
Merging scsi/for-next (bca2c579a5e9 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (afea24189508 scsi: hpsa: Bump version)
Applying: scsi: ufs: exynos: mark debugging as broken
Merging vhost/linux-next (cb91909e48a4 tools/virtio: Use tools/include/list=
.h instead of stubs)
Merging rpmsg/for-next (bb949a8b3fe6 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (ac7642b67d10 Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (df51f402e3b1 tools: gpio: fix spurious clo=
se warning in gpio-event-mon)
Merging gpio-intel/for-next (532e762d51d0 gpio: pch: Move IRQ status messag=
e to verbose debug level)
Merging pinctrl/for-next (7c578fbe574e Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in drivers/pinctrl/pinctrl-single.c
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
Merging kselftest/next (850d0cc64c8e selftests/harness: Limit step counter =
reporting)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (bf14b015bf51 Merge branch 'for-5.9/selftests=
-cleanup' into for-next)
Merging coresight/next (2b0949812420 coresight: etm4x: Fix save/restore dur=
ing cpu idle)
Merging rtc/rtc-next (bb820d6daf1f rtc: ds1374: remove unused define)
Merging nvdimm/libnvdimm-for-next (b86153077d5c Merge branch 'for-5.8/papr_=
scm' into libnvdimm-for-next)
Merging at24/at24/for-next (8f3d9f354286 Linux 5.7-rc1)
Merging ntb/ntb-next (b3a9e3b9622a Linux 5.8-rc1)
Merging seccomp/for-next/seccomp (c97aedc52dce selftests/seccomp: Test SECC=
OMP_IOCTL_NOTIF_ADDFD)
CONFLICT (content): Merge conflict in tools/testing/selftests/seccomp/secco=
mp_bpf.c
Merging kspp/for-next/kspp (36f78758dca5 Merge branch 'kspp/tasklets/new-ap=
i/v1' into for-next/kspp)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_edid.c
Merging gnss/gnss-next (48778464bb7d Linux 5.8-rc2)
Merging fsi/next (2c01397b71c5 fsi: aspeed: Fix OPB0 byte order register va=
lues)
CONFLICT (content): Merge conflict in drivers/fsi/Kconfig
Merging slimbus/for-next (b3a9e3b9622a Linux 5.8-rc1)
Merging nvmem/for-next (696fa0a47f97 dt-bindings: nvmem: SID: add binding f=
or A100's SID controller)
Merging xarray/xarray (27586ca786a7 XArray: Handle retry entries within xas=
_find_marked)
Merging hyperv/hyperv-next (56fed9ab510e hyperv: hyperv.h: drop a duplicate=
d word)
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
Merging kunit-next/kunit (d43c7fb05765 kunit: tool: fix improper treatment =
of file location)
Merging trivial/for-next (c1a371cf80fb printk: fix global comment)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (8613fc59031e mhi: fix doubled words and struct image_=
info kernel-doc)
Merging notifications/notifications-pipe-core (30eb2979dde8 watch_queue: Ad=
d superblock notifications)
Merging fsinfo/fsinfo-core (fe968a8210b4 samples: add error state informati=
on to test-fsinfo.c)
Applying: extra syscall update
Merging memblock/for-next (3346dd99fb4c MAINTAINERS: remove "PKUNITY SOC DR=
IVERS" entry)
CONFLICT (modify/delete): arch/unicore32/kernel/process.c deleted in memblo=
ck/for-next and modified in HEAD. Version HEAD of arch/unicore32/kernel/pro=
cess.c left in tree.
$ git rm -f arch/unicore32/kernel/process.c
Merging set_fs/set_fs-rw (2750e3608b79 fs: don't allow splice read/write wi=
thout explicit ops)
CONFLICT (content): Merge conflict in drivers/acpi/battery.c
CONFLICT (content): Merge conflict in arch/powerpc/mm/numa.c
Merging init/init-user-pointers (d12bd437760b initramfs: use vfs_utimes in =
do_copy)
CONFLICT (content): Merge conflict in drivers/md/md.c
Merging akpm-current/current (cbd0eba76e21 ipc/shm.c: Remove the superfluou=
s break)
CONFLICT (content): Merge conflict in net/sctp/socket.c
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
Merging akpm/master (ee0e4f15dfd4 sh: add missing EXPORT_SYMBOL() for __del=
ay)
Applying: mm/hugetlb: better checks before using hugetlb_cma

--Sig_/p7_lhoQLkAi=dR8FWs7qriY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8Wy9cACgkQAVBC80lX
0Gy8/Qf/cpR6FPyCsQVqJwKBWrByVOQk2Em+/S5bk4yH32wbeMPKMBEcB9FG9ahG
6mPVTuEN8hIUBZ+4zkIxGoimzl2SPRIDSe+F5kKVSfL/QjRGuxrIrv4M26SwTslL
Mmz35OizFnNtlvfRiDL8pRsIGLkNDfP+idXUsj+pNqaBHnoZF5I9UMlsWfWUYfel
ae2+0Kmha8xmgR8Q3SRhxIVwQPHJz3q36rXxB7ZiyJPL/Fte9hJth1mwEpvWMhM3
ZIzLbpSCW9aL0xo3NinovJ6Uf1gJNOsQ5BJJt+Q5b9lFW43zfKzS8X4OrC7eqcqe
upQeq+rGBOOVQV1cAHhx/jpTZXP4Xg==
=CDTK
-----END PGP SIGNATURE-----

--Sig_/p7_lhoQLkAi=dR8FWs7qriY--
