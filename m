Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94F281FE9D4
	for <lists+linux-next@lfdr.de>; Thu, 18 Jun 2020 06:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbgFREPi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Jun 2020 00:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbgFREPf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Jun 2020 00:15:35 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7992FC06174E;
        Wed, 17 Jun 2020 21:15:35 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49nTBC5TK5z9sSF;
        Thu, 18 Jun 2020 14:15:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592453731;
        bh=G4jvJXcMRz5nMAJumRlBpxUuscrX+sBizk+f14qfoWQ=;
        h=Date:From:To:Cc:Subject:From;
        b=Kq6iqQ6owp19piIbS2XqsfgXO5GtK61V7SQRF2uPbOIbfYSf+ILIr1b6YAxkbzjaU
         rVeevK2V+DVR99Htwa5egIzdZNpROEbykxVCDmH3hKKn39o3/hl90L8zyh7Yn825CU
         M2+Iytka0xj+IUFfuNQ0hxnzUu3+lNEMWC8728pO4/ws3zbNntPRBUa4cWpP14AxXx
         /6h31c/JkW06rPwu4zSIwNvTmgINM26vcZ9PVFvxAec/OL4oGEwsx1owjZtiN+pOGU
         TmrRv0MBWduFqWL+guxh+cdQE8XdGYLNNVuTC8m+Fe23JQGW9rAjvhqn0sGJLcLrHS
         cO46dV3qL5Xmg==
Date:   Thu, 18 Jun 2020 14:15:30 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 18
Message-ID: <20200618141530.0ca9897d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_ljcSOZ+PjN0tJF8BPaEY5p";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_ljcSOZ+PjN0tJF8BPaEY5p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

News: there will be no linux-next release tomorrow.

Changes since 20200617:

My fixes tree contains:

  4cb4bfffe2c1 ("device_cgroup: Fix RCU list debugging warning")

The ipsec tree gained conflicts against Linus' tree.

The amdgpu tree still had its build failure so I used the version from
next-20200616.

The pidfd tree gained a conflict against the powerpc-fixes tree.

Non-merge commits (relative to Linus' tree): 1549
 1605 files changed, 252975 insertions(+), 21474 deletions(-)

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

I am currently merging 320 trees (counting Linus' and 82 trees of bug
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
Merging origin/master (1b5044021070 Merge tag 'dma-mapping-5.8-3' of git://=
git.infradead.org/users/hch/dma-mapping)
Merging fixes/master (df8cb0ea9423 device_cgroup: Fix RCU list debugging wa=
rning)
Merging kbuild-current/fixes (0f50d21ade11 scripts: Fix typo in headers_ins=
tall.sh)
Merging arc-current/for-curr (040ece2a3c15 ARC: build: remove deprecated to=
ggle for arc700 builds)
Merging arm-current/fixes (3866f217aaa8 ARM: 8977/1: ptrace: Fix mask for t=
humb breakpoint hook)
Merging arm-soc-fixes/arm/fixes (99706d62fb50 Merge tag 'omap-for-v5.7/cpsw=
-fixes-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linu=
x-omap into arm/fixes)
Merging uniphier-fixes/fixes (0e698dfa2822 Linux 5.7-rc4)
Merging arm64-fixes/for-next/fixes (b9249cba25a5 arm64: bti: Require clang =
>=3D 10.0.1 for in-kernel BTI support)
Merging m68k-current/for-linus (3381df095419 m68k: tools: Replace zero-leng=
th array with flexible-array member)
Merging powerpc-fixes/fixes (b55129f97aee powerpc/8xx: Provide ptep_get() w=
ith 16k pages)
Merging s390-fixes/fixes (b3583fca5fb6 s390: fix syscall_get_error for comp=
at processes)
Merging sparc/master (b3a9e3b9622a Linux 5.8-rc1)
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (ef7232da6bcd ionic: export features for vlans to use)
Merging bpf/master (8030e250d882 bpf: Document optval > PAGE_SIZE behavior =
for sockopt hooks)
Merging ipsec/master (be01369859b8 esp, ah: modernize the crypto algorithm =
selections)
CONFLICT (content): Merge conflict in net/ipv6/Kconfig
CONFLICT (content): Merge conflict in net/ipv4/Kconfig
Merging netfilter/master (c92cbaea3cc0 net: dsa: sja1105: fix PTP timestamp=
ing with large tc-taprio cycles)
Merging ipvs/master (bdc48fa11e46 checkpatch/coding-style: deprecate 80-col=
umn warning)
Merging wireless-drivers/master (b3a9e3b9622a Linux 5.8-rc1)
Merging mac80211/master (59d4bfc1e2c0 net: fix wiki website url mac80211 an=
d wireless files)
Merging rdma-fixes/for-rc (b3a9e3b9622a Linux 5.8-rc1)
Merging sound-current/for-linus (b2c22910fe5a ALSA: hda/realtek: Add mute L=
ED and micmute LED support for HP systems)
Merging sound-asoc-fixes/for-linus (a884e26fea98 Merge remote-tracking bran=
ch 'asoc/for-5.8' into asoc-linus)
Merging regmap-fixes/for-linus (82228364de4a Merge remote-tracking branch '=
regmap/for-5.8' into regmap-linus)
Merging regulator-fixes/for-linus (1b3bcca20858 regulator: mt6358: Remove B=
ROKEN dependency)
Merging spi-fixes/for-linus (1c8794921564 Merge remote-tracking branch 'spi=
/for-5.8' into spi-linus)
Merging pci-current/for-linus (b3a9e3b9622a Linux 5.8-rc1)
Merging driver-core.current/driver-core-linus (b3a9e3b9622a Linux 5.8-rc1)
Merging tty.current/tty-linus (b3a9e3b9622a Linux 5.8-rc1)
Merging usb.current/usb-linus (b3a9e3b9622a Linux 5.8-rc1)
Merging usb-gadget-fixes/fixes (172b14b48ca1 usb: cdns3: gadget: make a bun=
ch of functions static)
Merging usb-serial-fixes/usb-linus (399ad9477c52 USB: serial: option: add T=
elit LE910C1-EUX compositions)
Merging usb-chipidea-fixes/ci-for-usb-stable (b3f3736ac305 usb: chipidea: m=
sm: Ensure proper controller reset using role switch API)
Merging phy/fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging staging.current/staging-linus (b65a2d8c8614 Staging: rtl8723bs: pre=
vent buffer overflow in update_sta_support_rate())
Merging char-misc.current/char-misc-linus (b3a9e3b9622a Linux 5.8-rc1)
Merging soundwire-fixes/fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging thunderbolt-fixes/fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging input-current/for-linus (751ad34fbad7 Input: adi - work around modu=
le name confict)
Merging crypto-current/master (819966c06b75 crypto: drbg - always try to fr=
ee Jitter RNG instance)
Merging ide/master (b3a9e3b9622a Linux 5.8-rc1)
Merging vfio-fixes/for-linus (5c5866c593bb vfio/pci: Clear error and reques=
t eventfd ctx after releasing)
Merging kselftest-fixes/fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging slave-dma-fixes/fixes (b5b0180c2f76 dmaengine: ti: k3-udma: Fix the=
 running channel handling in alloc_chan_resources)
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (630e8d5507d9 mtd: set master partition panic w=
rite flag)
Merging mfd-fixes/for-mfd-fixes (603d9299da32 mfd: mt6397: Fix probe after =
changing mt6397-core)
Merging v4l-dvb-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (03e62fd67d3a MIPS: lantiq: xway: sysctrl: fi=
x the GPHY clock alias names)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (a352fe371053 Merge branch 'omap-for-v5.8/fixes-rc=
1' into fixes)
Merging kvm-fixes/master (49b3deaad345 Merge tag 'kvmarm-fixes-5.8-1' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvms390-fixes/master (5615e74f48dc KVM: s390: Remove false WARN_ON_=
ONCE for the PQAP instruction)
Merging hwmon-fixes/hwmon (09aa62c08b99 hwmon: (bt1-pvt) Mark is_visible fu=
nctions static)
Merging nvdimm-fixes/libnvdimm-fixes (f84afbdd3a9e libnvdimm: Out of bounds=
 read in __nd_ioctl())
Merging btrfs-fixes/next-fixes (4f28062adf92 Merge branch 'misc-5.7' into n=
ext-fixes)
Merging vfs-fixes/fixes (9e4636545933 copy_xstate_to_kernel(): don't leave =
parts of destination uninitialized)
Merging dma-mapping-fixes/for-linus (9c24eaf81cc4 iommu/vt-d: Return the co=
rrect dma mask when we are bypassing the IOMMU)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging samsung-krzk-fixes/fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging devicetree-fixes/dt/linus (8440d4a75d90 Merge branch 'dt/schema-cle=
anups' into dt/linus)
Merging scsi-fixes/fixes (b8f1d1e05817 scsi: Wire up ata_scsi_dma_need_drai=
n for SAS HBA drivers)
Merging drm-fixes/drm-fixes (3d77e6a8804a Linux 5.7)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (8e68c6340d58 drm/i915/display=
: Fix the encoder type check)
Merging mmc-fixes/fixes (27a5e7d36d38 mmc: meson-gx: limit segments to 1 wh=
en dram-access-quirk is needed)
Merging rtc-fixes/rtc-fixes (8f3d9f354286 Linux 5.7-rc1)
Merging gnss-fixes/gnss-linus (2ef96a5bb12b Linux 5.7-rc5)
Merging hyperv-fixes/hyperv-fixes (38dce4195f0d x86/hyperv: Properly suspen=
d/resume reenlightenment notifications)
Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq h=
andlers after dpio create)
Merging risc-v-fixes/fixes (6c58f25e6938 riscv/atomic: Fix sign extension f=
or RV64I)
Merging pidfd-fixes/fixes (86f56395feb2 tests: test for setns() EINVAL regr=
ession)
Merging fpga-fixes/fixes (6a47d6efc693 fpga: zynqmp: fix modular build)
Merging spdx/spdx-linus (3d77e6a8804a Linux 5.7)
Merging gpio-intel-fixes/fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging pinctrl-intel-fixes/fixes (b3a9e3b9622a Linux 5.8-rc1)
Merging erofs-fixes/fixes (d1eef1c61974 Linux 5.5-rc2)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging drm-misc-fixes/for-linux-next-fixes (b48fd568ac64 drm: mcde: Fix fo=
rgotten user of drm->dev_private)
Merging kspp-gustavo/for-next/kspp (76fafbfffb44 w1: Replace zero-length ar=
ray with flexible-array)
Merging kbuild/for-next (b170290c2836 Merge tag 'kconfig-v5.8' of git://git=
.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild)
Merging compiler-attributes/compiler-attributes (98d54f81e36b Linux 5.6-rc4)
Merging dma-mapping/for-next (56fccf21d196 dma-direct: check return value w=
hen encrypting or decrypting memory)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (03c7f5f0b844 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (dd4bc6076587 arm64: warn on incorrect placemen=
t of the kernel by the bootloader)
Merging arm-perf/for-next/perf (10f6cd2af21b pmu/smmuv3: Clear IRQ affinity=
 hint on device removal)
Merging arm-soc/for-next (28107944fb70 soc: document merges)
Merging amlogic/for-next (9233c526bc0e Merge branch 'v5.8/defconfig' into t=
mp/aml-rebuild)
Merging aspeed/for-next (33f466eef906 ARM: dts: aspeed: mihawk: Add 8 tmp40=
1 thermal sensors)
Merging at91/at91-next (ec539e70d882 Merge branches 'at91-soc', 'at91-dt' a=
nd 'at91-defconfig' into at91-next)
Merging imx-mxs/for-next (0414897ac89f Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (a158c2b7ec23 Merge branch 'for_5.8/driver-soc' into =
next)
Merging mediatek/for-next (64ee939736e7 Merge branch 'v5.7-next/soc' into f=
or-next)
Merging mvebu/for-next (869da228bd45 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (712c602893d7 Merge branch 'fixes' into for-next)
Merging qcom/for-next (98cfcf1a9c54 Merge branches 'arm64-defconfig-for-5.8=
', 'arm64-for-5.8', 'drivers-for-5.8' and 'dts-for-5.8' into for-next)
Merging raspberrypi/for-next (b3a9e3b9622a Linux 5.8-rc1)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (a3fa35e19650 Merge branch 'renesas-arm-dt-for-v5.9' i=
nto renesas-next)
Merging reset/reset/next (3b9164c0f173 dt-bindings: reset: Convert i.MX7 re=
set to json-schema)
Merging rockchip/for-next (99bcf38dd05b Merge branch 'v5.9-clk/next' into f=
or-next)
Merging samsung-krzk/for-next (b0953d8b7cdb Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (24077bf8f9e6 Merge tag 'juno-fix-5.8' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-linux-=
next)
Merging sunxi/sunxi/for-next (b3a9e3b9622a Linux 5.8-rc1)
Merging tegra/for-next (fc87d5985a7c Merge branch for-5.9/memory into for-n=
ext)
Merging ti-k3/ti-k3-next (cae809434da1 arm64: dts: ti: k3-j721e-main: Add m=
ain domain watchdog entries)
Merging uniphier/for-next (0e698dfa2822 Linux 5.7-rc4)
Merging clk/clk-next (b3a9e3b9622a Linux 5.8-rc1)
Merging clk-samsung/for-next (3d77e6a8804a Linux 5.7)
Merging csky/linux-next (f36e0aab6f1f csky: Fixup CONFIG_DEBUG_RSEQ)
Merging h8300/h8300-next (9d48776fc609 Merge remote-tracking branch 'origin=
/master' into h8300-next)
Merging ia64/next (172e7890406d tty/serial: cleanup after ioc*_serial drive=
r removal)
Merging m68k/for-next (3381df095419 m68k: tools: Replace zero-length array =
with flexible-array member)
Merging m68knommu/for-next (2d5b17908217 m68knommu: fix use of cpu_to_le() =
on IO access)
Merging microblaze/next (8f3d9f354286 Linux 5.7-rc1)
Merging mips/mips-next (c425423a0757 MIPS: BCM63xx: add endif comments)
Merging nds32/next (3d77e6a8804a Linux 5.7)
Merging nios2/for-next (6b57fa4d374b nios2: signal: Mark expected switch fa=
ll-through)
Merging openrisc/for-next (6bd140e14d9a openrisc: Fix issue with argument c=
lobbering for clone/fork)
Merging parisc-hd/for-next (fb775a8805ed parisc: Whitespace cleanups in ato=
mic.h)
Merging powerpc/next (5b14671be58d Merge tag 'fuse-update-5.8' of git://git=
.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (e9e4ef9116b1 soc: fsl: dpio: Remove unused inline fun=
ction qbman_write_eqcr_am_rt_register)
Merging risc-v/for-next (01f76386b0ac riscv: set the permission of vdso_dat=
a to read-only)
Merging s390/features (b3a9e3b9622a Linux 5.8-rc1)
Merging sh/for-next (37744feebc08 sh: remove sh5 support)
Merging sparc-next/master (b3a9e3b9622a Linux 5.8-rc1)
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
Merging cifs/for-next (a0892b413f6b cifs: misc: Use array_size() in if-stat=
ement controlling expression)
Merging configfs/for-next (8aebfffacfa3 configfs: fix config_item refcnt le=
ak in configfs_rmdir())
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (b3a9e3b9622a Linux 5.8-rc1)
Merging exfat/dev (83cf239fa6d5 exfat: move setting VOL_DIRTY over exfat_re=
move_entries())
Merging ext3/for_next (a68f93d90fbb Pull writeback fixes from me.)
Merging ext4/dev (7b97d868b7ab ext4, jbd2: ensure panic by fix a race betwe=
en jbd2 abort and ext4 error handlers)
Merging f2fs/dev (b29482fde649 Merge branch 'work.epoll' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/viro/vfs)
Merging fsverity/fsverity (9cd6b593cfc9 fs-verity: remove unnecessary exter=
n keywords)
Merging fuse/for-next (9b46418c40fe fuse: copy_file_range should truncate c=
ache)
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (b3a9e3b9622a Linux 5.8-rc1)
Merging nfs-anna/linux-next (ba838a75e73f NFS: Fix direct WRITE throughput =
regression)
Merging nfsd/nfsd-next (b3a9e3b9622a Linux 5.8-rc1)
Merging orangefs/for-next (0df556457748 orangefs: convert get_user_pages() =
--> pin_user_pages())
Merging overlayfs/overlayfs-next (2068cf7dfbc6 ovl: remove unnecessary lock=
 check)
Merging ubifs/linux-next (4b68bf9a69d2 ubi: Select fastmap anchor PEBs cons=
idering wear level rules)
Merging v9fs/9p-next (36f9967531da 9p/xen: increase XEN_9PFS_RING_ORDER)
Merging xfs/for-next (8cc007246972 xfs: Add the missed xfs_perag_put() for =
xfs_ifree_cluster())
Merging zonefs/for-next (568776f992c4 zonefs: Replace uuid_copy() with impo=
rt_uuid())
Merging iomap/iomap-for-next (d4ff3b2ef901 iomap: Fix unsharing of an exten=
t >2GB on a 32-bit machine)
Merging djw-vfs/vfs-for-next (e4f9ba20d3b8 fs/xfs: Update xfs_ioctl_setattr=
_dax_invalidate())
Merging file-locks/locks-next (5ef159681309 locks: add locks_move_blocks in=
 posix_lock_inode)
Merging vfs/for-next (159acfa8df28 iov_iter: Move unnecessary inclusion of =
crypto/hash.h)
Applying: further fixes for "iov_iter: Move unnecessary inclusion of crypto=
/hash.h"
Merging printk/for-next (d6c8bb00c126 Merge remote-tracking branch 'origin/=
for-5.8-kdb-nmi' into for-next)
Merging pci/next (b3a9e3b9622a Linux 5.8-rc1)
Merging pstore/for-next/pstore (b3a9e3b9622a Linux 5.8-rc1)
Merging hid/for-next (64528f9b9e5a Merge branch 'for-5.8/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (b3a9e3b9622a Linux 5.8-rc1)
Merging i3c/i3c/next (b4203ce05563 i3c master: GETMRL's 3rd byte is optiona=
l even with BCR_IBI_PAYLOAD)
Merging dmi/master (d9d8efd3241b firmware/dmi: Report DMI Bios & EC firmwar=
e release)
Merging hwmon-staging/hwmon-next (5093411241c5 hwmon: (nct6683) Replace con=
tainer_of() with  kobj_to_dev())
Merging jc_docs/docs-next (146f5cdeda15 docs/memory-barriers.txt/kokr: smp_=
mb__{before,after}_atomic(): update Documentation)
Merging v4l-dvb/master (b3a9e3b9622a Linux 5.8-rc1)
Merging v4l-dvb-next/master (2630e1bb0948 media: rkvdec: Fix H264 scaling l=
ist order)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (30bbd465a449 Merge branches 'pm-acpi', 'pm-sleep' an=
d 'pm-cpufreq' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (fa647413b761 cpufreq: brcmstb-a=
vs-cpufreq: send S2_ENTER / S2_EXIT commands to AVS)
Merging cpupower/cpupower (b3a9e3b9622a Linux 5.8-rc1)
Merging opp/opp/linux-next (b466542f331e OPP: Add and export helper to set =
bandwidth)
Merging thermal/thermal/linux-next (64488908b523 thermal/int340x_thermal: D=
on't require IDSP to exist)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (fe204591cc94 dlm: remove BUG() before panic())
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (b3a9e3b9622a Linux 5.8-rc1)
Merging net-next/master (69119673bd50 Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/netdev/net)
Merging bpf-next/master (7bd3a33ae6d2 libbpf: Bump version to 0.1.0)
Merging ipsec-next/master (69119673bd50 Merge git://git.kernel.org/pub/scm/=
linux/kernel/git/netdev/net)
Merging mlx5-next/mlx5-next (6b646a7e4af6 net/mlx5: Add ability to read and=
 write ECE options)
Merging netfilter-next/master (69119673bd50 Merge git://git.kernel.org/pub/=
scm/linux/kernel/git/netdev/net)
Merging ipvs-next/master (9a25c1df24a6 Merge git://git.kernel.org/pub/scm/l=
inux/kernel/git/bpf/bpf-next)
Merging wireless-drivers-next/master (a15a20acc980 Merge tag 'iwlwifi-next-=
for-kalle-2020-06-11' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlw=
ifi/iwlwifi-next)
Merging bluetooth/master (17896406ff35 Bluetooth: implement read/set defaul=
t system parameters mgmt)
Merging mac80211-next/master (cb8e59cc8720 Merge git://git.kernel.org/pub/s=
cm/linux/kernel/git/netdev/net-next)
Merging gfs2/for-next (8a9e58a9bb7a gfs2: Add some flags missing from glock=
 output)
Merging mtd/mtd/next (5788ccf3c84f mtd: clear cache_state to avoid writing =
to bad blocks repeatedly)
Merging nand/nand/next (91a01436b86c mtd: parsers: bcm63xx: simplify CFE de=
tection)
Merging spi-nor/spi-nor/next (b3a9e3b9622a Linux 5.8-rc1)
Merging crypto/master (58ca0060ec4e crypto: hisilicon - fix driver compatib=
ility issue with different versions of devices)
Merging drm/drm-next (66057dd1d1cf Merge tag 'drm-misc-next-fixes-2020-06-1=
1' of git://anongit.freedesktop.org/drm/drm-misc into drm-next)
Merging amdgpu/drm-next (f59073f6df9b drm/amdgpu: add another raven1 gfxoff=
 quirk)
Applying: drm/amdkfd: fix up for {un}use_mm() rename
$ git reset --hard HEAD^
Merging next-20200616 version of amdgpu
Applying: drm/amdkfd: fix up for {un}use_mm() rename
[master b91d047b9cb0] next-20200616/amdgpu
Merging drm-intel/for-linux-next (dfdfbd382348 drm/i915/selftests: Check pr=
eemption rollback of different ring queue depths)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_request.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_params.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/selftest_lrc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dd=
i.c
Merging drm-tegra/drm/tegra/for-next (fce3a51d9b31 drm/tegra: Add zpos prop=
erty for cursor planes)
Merging drm-misc/for-linux-next (2aae8ed1f390 drm/rockchip: Add per-pixel a=
lpha support for the PX30 VOP)
CONFLICT (content): Merge conflict in drivers/gpu/drm/nouveau/nouveau_displ=
ay.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_vblank.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_dp_mst_topology.c
Applying: drm/amdgpu: remove stray drm_gem_object_put_unlocked
Merging drm-msm/msm-next (bc8bd54ffd85 drm/msm: Fix 0xfffflub in "Refactor =
address space initialization")
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (2c76b324c794 drm/imx: parallel-display: Adjus=
t bus_flags handling)
Merging etnaviv/etnaviv/next (f232d9ec029c drm/etnaviv: fix TS cache flushi=
ng on GPUs with BLT engine)
Merging regmap/for-next (e6ad256a03ef Merge remote-tracking branch 'regmap/=
for-5.9' into regmap-next)
Merging sound/for-next (c32a5fbc1802 Merge branch 'topic/dma-fix2' into for=
-next)
Merging sound-asoc/for-next (aac93dfa6d15 Merge remote-tracking branch 'aso=
c/for-5.9' into asoc-next)
Merging modules/modules-next (5c3a7db0c7ec module: Harden STRICT_MODULE_RWX)
Merging input/next (d0ac7079d5fc Input: iqs269a - add missing I2C dependenc=
y)
Merging block/for-next (0f41b72f9633 Merge branch 'async-buffered.7' into f=
or-next)
Merging device-mapper/for-next (62a11e1ac620 dm mpath: use double checked l=
ocking in fast path)
Merging pcmcia/pcmcia-next (46d079790663 pcmcia: make pccard_loop_tuple() s=
tatic)
Merging mmc/next (49377432943d Merge branch 'fixes' into next)
Merging mfd/for-mfd-next (098c4adf249c mfd: mt6360: Remove duplicate REGMAP=
_IRQ_REG_LINE() entry)
Merging backlight/for-backlight-next (479da1f538a2 backlight: Add backlight=
_device_get_by_name())
Merging battery/for-next (152204dbdcee power: supply: cw2015: Attach OF ID =
table to the driver)
Merging regulator/for-next (599f1f658cd6 Merge remote-tracking branch 'regu=
lator/for-5.9' into regulator-next)
Merging security/next-testing (56f2e3b7d819 capabilities: add description f=
or CAP_SETFCAP)
Merging apparmor/apparmor-next (e37986097ba6 apparmor: Use true and false f=
or bool variable)
Merging integrity/next-integrity (4235b1a4efe1 ima: fix mprotect checking)
Merging keys/keys-next (b6f61c314649 keys: Implement update for the big_key=
 type)
Merging safesetid/safesetid-next (4d63f7c2e382 security: Add LSM hooks to s=
et*gid syscalls)
Merging selinux/next (b3a9e3b9622a Linux 5.8-rc1)
Merging smack/next (ef26650a201f Smack: Remove unused inline function smk_a=
d_setfield_u_fs_path_mnt)
Merging tomoyo/master (b3a9e3b9622a Linux 5.8-rc1)
Merging tpmdd/next (8270cafb505e tpm/st33zp24: fix spelling mistake "drescr=
iption" -> "description")
Merging watchdog/master (072cb8b628d3 watchdog: m54xx: Add missing include)
Merging iommu/next (672cf6df9b8a iommu/vt-d: Move Intel IOMMU driver into s=
ubdirectory)
Merging vfio/next (4f085ca2f5a8 Merge branch 'v5.8/vfio/kirti-migration-fix=
es' into v5.8/vfio/next)
Merging audit/next (bbccc11bc884 audit: Use struct_size() helper in alloc_c=
hunk)
Merging devicetree/for-next (418370ff2231 of: reserved_mem: Fix typo in the=
 too-many-regions message)
Merging mailbox/mailbox-for-next (e9f901dc05c0 mailbox: qcom: Add ipq6018 a=
pcs compatible)
Merging spi/for-next (1f548607d7d5 Merge remote-tracking branch 'spi/for-5.=
9' into spi-next)
Merging tip/auto-latest (83cdaef93988 Merge branch 'WIP.core/headers')
Merging clockevents/timers/drivers/next (809eb4e9bf9d dt-bindings: timer: A=
dd renesas,em-sti bindings)
Merging edac/edac-for-next (17ed808ad243 EDAC: Fix reference count leaks)
Merging irqchip/irq/irqchip-next (a87d4e00eacb irqchip/gic-v4.1: Use readx_=
poll_timeout_atomic() to fix sleep in atomic)
CONFLICT (content): Merge conflict in drivers/irqchip/Kconfig
Merging ftrace/for-next (388d8bdb87e0 tracing: Remove obsolete PREEMPTIRQ_E=
VENTS kconfig option)
Merging rcu/rcu/next (8747b07d1944 Merge branch 'kcsan-dev.2020.04.13c' int=
o HEAD)
Merging kvm/linux-next (49b3deaad345 Merge tag 'kvmarm-fixes-5.8-1' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvm-arm/next (15c99816ed93 Merge branch 'kvm-arm64/ptrauth-fixes' i=
nto kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (11362b1befea KVM: PPC: Book3S HV: Close race =
with page faults around memslot flushes)
Merging kvms390/next (0b545fd17f84 KVM: s390: remove unneeded semicolon in =
gisa_vcpu_kicker())
Merging xen-tip/linux-next (a952f64d14e5 MAINTAINERS: Update PARAVIRT_OPS_I=
NTERFACE and VMWARE_HYPERVISOR_INTERFACE)
Merging percpu/for-next (dedac37ea96b Merge branch 'for-5.7' into for-next)
Merging workqueues/for-next (10cdb1575954 workqueue: use BUILD_BUG_ON() for=
 compile time test instead of WARN_ON())
Merging drivers-x86/for-next (b3a9e3b9622a Linux 5.8-rc1)
Merging chrome-platform/for-next (b3a9e3b9622a Linux 5.8-rc1)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (59ea3c9faf32 leds: add aw2013 driver)
Merging ipmi/for-next (a5dc8300df75 scripts/decode_stacktrace: warn when mo=
dpath is needed but is unset)
Merging driver-core/driver-core-next (b3a9e3b9622a Linux 5.8-rc1)
Merging usb/usb-next (b3a9e3b9622a Linux 5.8-rc1)
Merging usb-gadget/next (1c11e74e9079 usb: dwc3: keystone: Turn on USB3 PHY=
 before controller)
Merging usb-serial/usb-next (c432df155919 USB: serial: ch341: fix lockup of=
 devices with limited prescaler)
Merging usb-chipidea-next/ci-for-usb-next (c71d13f9a868 Documentation: ABI:=
 usb: chipidea: Update Li Jun's e-mail)
Merging phy-next/next (b3a9e3b9622a Linux 5.8-rc1)
Merging tty/tty-next (b3a9e3b9622a Linux 5.8-rc1)
Merging char-misc/char-misc-next (b3a9e3b9622a Linux 5.8-rc1)
Merging extcon/extcon-next (b2e5575a8d04 extcon: arizona: Fix runtime PM im=
balance on error)
Merging soundwire/next (b3a9e3b9622a Linux 5.8-rc1)
Merging thunderbolt/next (b7c408a5e5e6 thunderbolt: Improve USB4 config sym=
bol help text)
Merging staging/staging-next (98fe05e21a6e staging: rtl8712: Remove unneces=
ary else after return statement.)
Merging mux/for-next (05f19f7f8944 mux: adgs1408: Add mod_devicetable.h and=
 remove of_match_ptr)
Merging icc/icc-next (b3a9e3b9622a Linux 5.8-rc1)
Merging slave-dma/next (c09a7ce668a6 dmaengine: mmp_tdma: share the IRQ lin=
e)
Merging cgroup/for-next (936f2a70f207 cgroup: add cpu.stat file to root cgr=
oup)
Merging scsi/for-next (112ceff79e89 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (b1bf66d1d5a8 scsi: ufs: Fix imprecise load calcu=
lation in devfreq window)
Merging vhost/linux-next (a20daaa6c4d6 tools/virtio: Use tools/include/list=
.h instead of stubs)
Merging rpmsg/for-next (71f56fef13d4 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (861254d82649 gpio: arizona: put pm_runtime in case o=
f failure)
Merging gpio-brgl/gpio/for-next (3ba3ff5c0966 gpio: pca953x: Add support fo=
r the PCAL9535)
Merging gpio-intel/for-next (b3a9e3b9622a Linux 5.8-rc1)
Merging pinctrl/for-next (de98b5f154a2 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (b3a9e3b9622a Linux 5.8-rc1)
Merging pinctrl-samsung/for-next (7efece8a057f pinctrl: samsung: Use bank n=
ame as irqchip name)
Merging pwm/for-next (b8fb642afa02 pwm: iqs620a: Use lowercase hexadecimal =
literals for consistency)
Merging userns/for-next (d35bec8a5788 Merge proc-next and exec-next for tes=
ting in linux-next)
Merging ktest/for-next (1091c8fce8aa ktest: Fix typos in ktest.pl)
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (1b8eec510ba6 selftests/ftrace: Support ":README" su=
ffix for requires)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (e1aef3a1dfdd Merge branch 'for-5.9/selftests=
-cleanup' into for-next)
Merging coresight/next (6e5446ac46dd coresight: Fix comment in main header =
file)
Merging rtc/rtc-next (4601e24a6fb8 rtc: pcf2127: watchdog: handle nowayout =
feature)
Merging nvdimm/libnvdimm-for-next (b86153077d5c Merge branch 'for-5.8/papr_=
scm' into libnvdimm-for-next)
Merging at24/at24/for-next (8f3d9f354286 Linux 5.7-rc1)
Merging ntb/ntb-next (b3a9e3b9622a Linux 5.8-rc1)
Merging kspp/for-next/kspp (c3e42ab50f8e Merge branch 'kspp/overflow/helper=
s' into for-next/kspp)
Merging gnss/gnss-next (9b5816b56af6 gnss: replace zero-length array with f=
lexible-array)
Merging fsi/next (2c01397b71c5 fsi: aspeed: Fix OPB0 byte order register va=
lues)
CONFLICT (content): Merge conflict in drivers/fsi/Kconfig
Merging slimbus/for-next (b3a9e3b9622a Linux 5.8-rc1)
Merging nvmem/for-next (b1f9f1162c5c nvmem: sc27xx: add sc2730 efuse suppor=
t)
Merging xarray/xarray (27586ca786a7 XArray: Handle retry entries within xas=
_find_marked)
Merging hyperv/hyperv-next (afaa33da08ab Drivers: hv: vmbus: Resolve more r=
aces involving init_vp_index())
Merging auxdisplay/auxdisplay (3f03b6498172 auxdisplay: charlcd: Reuse hex_=
to_bin() instead of custom code)
Merging kgdb/kgdb/for-next (c893de12e1ef kdb: Remove the misfeature 'KDBFLA=
GS')
Merging pidfd/for-next (a5161eeef97c tests: add CLOSE_RANGE_UNSHARE tests)
CONFLICT (content): Merge conflict in arch/powerpc/kernel/syscalls/syscall.=
tbl
Merging devfreq/devfreq-next (8fc0e48e0fae PM / devfreq: Use lockdep assert=
s instead of manual checks for locked mutex)
Merging hmm/hmm (b3a9e3b9622a Linux 5.8-rc1)
Merging fpga/for-next (2d80c057efda fpga: dfl: afu: convert get_user_pages(=
) --> pin_user_pages())
Merging kunit/test (b3a9e3b9622a Linux 5.8-rc1)
Merging cel/cel-next (0a8e7b7d0846 SUNRPC: Revert 241b1f419f0e ("SUNRPC: Re=
move xdr_buf_trim()"))
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (11399346ac39 mtd: Replace zero-length array with flex=
ible-array)
Merging kunit-next/kunit (7bf200b3a4ac kunit: add support for named resourc=
es)
Merging trivial/for-next (c1a371cf80fb printk: fix global comment)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (3781a7a11294 bus: mhi: core: Handle syserr during pow=
er_up)
CONFLICT (content): Merge conflict in drivers/bus/mhi/core/pm.c
Merging notifications/notifications-pipe-core (87a10a4bdb88 watch_queue: sa=
mple: Display superblock notifications)
CONFLICT (content): Merge conflict in include/uapi/asm-generic/unistd.h
CONFLICT (content): Merge conflict in fs/mount.h
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
Merging fsinfo/fsinfo-core (93737ccf05ec fsinfo: Add an attribute that list=
s all the visible mounts in a namespace)
CONFLICT (content): Merge conflict in samples/vfs/Makefile
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
CONFLICT (content): Merge conflict in arch/arm/tools/syscall.tbl
CONFLICT (content): Merge conflict in arch/alpha/kernel/syscalls/syscall.tbl
Applying: extra syscall updates
Merging akpm-current/current (8021e3499c32 ipc-convert-ipcs_idr-to-xarray-u=
pdate-fix)
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (16095754fac3 sh: add missing EXPORT_SYMBOL() for __del=
ay)

--Sig_/_ljcSOZ+PjN0tJF8BPaEY5p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7q6mMACgkQAVBC80lX
0GzgLgf9ExmaLDyunghQ2KOhE7NVsC4h3KQbyTna6YAI99W3M5L1pOMaEpduCxoJ
tunWOt92uK6XOuC1V5wPQSdn0lUtCV0oNWQ4KxtwTB60whGze+DQs6dlhg73o3UH
3H/HKyx8bthrsADbhZSmoy0hTLPzDWH0bBEb9bvQftyK5pSCrbMsqjajTvrA2Kah
Q0rksxvJJELoZs7xZuO7ZdOB6NNCybXR59to8j169nO+hwXtz9oEDozCoH7P3kGf
gTWkUcqF6lI4SkjgPLY5HZCaN3u2EGYoCN8Frq+5f8NougdIExicqctkd8LYEmn1
jN3h86rHgamYsHGgjFxgHDPbLXREjQ==
=Ka7Q
-----END PGP SIGNATURE-----

--Sig_/_ljcSOZ+PjN0tJF8BPaEY5p--
