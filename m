Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D85801461F3
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2020 07:21:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbgAWGVI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Jan 2020 01:21:08 -0500
Received: from ozlabs.org ([203.11.71.1]:40779 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725535AbgAWGVH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 23 Jan 2020 01:21:07 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 483Bwt0gJMz9sR1;
        Thu, 23 Jan 2020 17:21:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579760462;
        bh=vW+KIEJaEQFewOTTY3bHV1qhI7lnlKcZoUioxkcGi9Y=;
        h=Date:From:To:Cc:Subject:From;
        b=H5xmguKseCk8iA4Za4xZP4CMSynzTN49Lwd89LpvBnmkXpc90HC76m8L1RhMYiAcL
         29d8nby2iq14QjnJtldERWFugUQYEqKxV5beky7DBVFL9CBwbhdkv9HVwrfQ27cArK
         yrYfTqs+WYVfxZathVVetN0FgKt4CyHeweYAYx2cllATWg2/ZD1xR34OZSfoxH9dqv
         fDuRS4grn44IG+7RrLXXTaun0FjbjG+f1sLYqr3BW/jWIe7BcGjAHG9NSAaa59ggi6
         nhpaezjAxaW8emHsisUUsgE2yi2K15Kz5DYG8d87TRONv+lWQ+XXi8dgMB7v3yeaos
         H/rWaP/kpYOQA==
Date:   Thu, 23 Jan 2020 17:21:01 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jan 23
Message-ID: <20200123172101.2f31947c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/v.duQltC7NqQ+Zq8XojPo+1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/v.duQltC7NqQ+Zq8XojPo+1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20200122:

The net-next tree still had its build failure for which I reverted a commit.

The scsi-mkp tree lost its build failure.

The akpm tree gained a conflict against the arm64 tree.

Non-merge commits (relative to Linus' tree): 9592
 9674 files changed, 454649 insertions(+), 198799 deletions(-)

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
and sparc64 defconfig. And finally, a simple boot test of the powerpc
pseries_le_defconfig kernel in qemu (with and without kvm enabled).

Below is a summary of the state of the merge.

I am currently merging 315 trees (counting Linus' and 78 trees of bug
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
Merging origin/master (dbab40bdb42c Merge tag 'io_uring-5.5-2020-01-22' of =
git://git.kernel.dk/linux-block)
Merging fixes/master (d21718ad2f81 evh_bytechan: fix out of bounds accesses)
Merging kbuild-current/fixes (3a562aee727a Merge tag 'for-5.5-rc4-tag' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux)
Merging arc-current/for-curr (f45ba2bd6da0 ARCv2: fpu: preserve userspace f=
pu state)
Merging arm-current/fixes (6849b5eba196 ARM: 8955/1: virt: Relax arch timer=
 version check during early boot)
Merging arm-soc-fixes/arm/fixes (70db729fe1b3 MAINTAINERS: Add myself as th=
e co-maintainer for Actions Semi platforms)
Merging arm64-fixes/for-next/fixes (aa638cfe3e73 arm64: cpu_errata: Add His=
ilicon TSV110 to spectre-v2 safe list)
Merging m68k-current/for-linus (5ed0794cde59 m68k/atari: Convert Falcon IDE=
 drivers to platform drivers)
Merging powerpc-fixes/fixes (6da3eced8c5f powerpc/spinlocks: Include correc=
t header for static key)
Merging s390-fixes/fixes (def9d2780727 Linux 5.5-rc7)
Merging sparc/master (9167bd963464 sparc/console: kill off obsolete declara=
tions)
Merging fscrypt-current/for-stable (ae64f9bd1d36 Linux 4.15-rc2)
Merging net/master (5311a69aaca3 net, ip6_tunnel: fix namespaces move)
Merging bpf/master (08dc225d8868 Merge branch 'bpf-flow-dissector-fix-port-=
ranges')
Merging ipsec/master (4e4362d2bf2a xfrm: support output_mark for offload ES=
P packets)
Merging netfilter/master (32c72165dbd0 netfilter: ipset: use bitmap infrast=
ructure completely)
Merging ipvs/master (c24b75e0f923 ipvs: move old_secure_tcp into struct net=
ns_ipvs)
Merging wireless-drivers/master (d829229e35f3 iwlwifi: mvm: don't send the =
IWL_MVM_RXQ_NSSN_SYNC notif to Rx queues)
Merging mac80211/master (8b792f84c637 Merge branch 'mlxsw-Various-fixes')
Merging rdma-fixes/for-rc (9554de394b7e i40iw: Remove setting of VMA privat=
e data and use rdma_user_mmap_io)
Merging sound-current/for-linus (ef7d84caa592 ALSA: hda - Add docking stati=
on support for Lenovo Thinkpad T420s)
Merging sound-asoc-fixes/for-linus (e3831bb2ead9 Merge branch 'asoc-5.5' in=
to asoc-linus)
Merging regmap-fixes/for-linus (def9d2780727 Linux 5.5-rc7)
Merging regulator-fixes/for-linus (ab5531e77442 Merge branch 'regulator-5.5=
' into regulator-linus)
Merging spi-fixes/for-linus (08aa8b61ab9a Merge branch 'spi-5.5' into spi-l=
inus)
Merging pci-current/for-linus (5e89cd303e3a PCI: Mark AMD Navi14 GPU rev 0x=
c5 ATS as broken)
Merging driver-core.current/driver-core-linus (d1eef1c61974 Linux 5.5-rc2)
Merging tty.current/tty-linus (b3a987b0264d Linux 5.5-rc6)
Merging usb.current/usb-linus (def9d2780727 Linux 5.5-rc7)
Merging usb-gadget-fixes/fixes (e5b5da96da50 usb: gadget: fix wrong endpoin=
t desc)
Merging usb-serial-fixes/usb-linus (def9d2780727 Linux 5.5-rc7)
Merging usb-chipidea-fixes/ci-for-usb-stable (16009db47c51 usb: chipidea: u=
dc: workaround for endpoint conflict issue)
Merging phy/fixes (4f510aa10468 phy/rockchip: inno-hdmi: round clock rate d=
own to closest 1000 Hz)
Merging staging.current/staging-linus (def9d2780727 Linux 5.5-rc7)
Merging char-misc.current/char-misc-linus (def9d2780727 Linux 5.5-rc7)
Merging soundwire-fixes/fixes (e42617b825f8 Linux 5.5-rc1)
Merging thunderbolt-fixes/fixes (def9d2780727 Linux 5.5-rc7)
Merging input-current/for-linus (996d5d5f89a5 Input: pm8xxx-vib - fix handl=
ing of separate enable register)
Merging crypto-current/master (cb1eeb75cf3d crypto: hisilicon/sec2 - Use at=
omics instead of __sync)
Merging ide/master (ce1f31b4c0b9 ide: serverworks: potential overflow in sv=
wks_set_pio_mode())
Merging vfio-fixes/for-linus (95f89e090618 vfio/type1: Initialize resv_msi_=
base)
Merging kselftest-fixes/fixes (c79f46a28239 Linux 5.5-rc5)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging slave-dma-fixes/fixes (c79f46a28239 Linux 5.5-rc5)
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (def9d2780727 Linux 5.5-rc7)
Merging mfd-fixes/for-mfd-fixes (603d9299da32 mfd: mt6397: Fix probe after =
changing mt6397-core)
Merging v4l-dvb-fixes/fixes (8821e92879a3 Merge tag 'v5.5-rc5' into patchwo=
rk)
Merging reset-fixes/reset/fixes (089531445262 MAINTAINERS: fix style in RES=
ET CONTROLLER FRAMEWORK)
Merging mips-fixes/mips-fixes (bbcc5672b006 MIPS: Avoid VDSO ABI breakage d=
ue to global register variable)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (03729cfa0d54 soc: ti: wkup_m3_ipc: Fix race condi=
tion with rproc_boot)
Merging kvm-fixes/master (ae6088216ce4 Merge tag 'trace-v5.5-rc5' of git://=
git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging kvms390-fixes/master (fe33a928bfcd KVM: s390: ENOTSUPP -> EOPNOTSUP=
P fixups)
Merging hwmon-fixes/hwmon (3bf8bdcf3bad hwmon: (core) Do not use device man=
aged functions for memory allocations)
Merging nvdimm-fixes/libnvdimm-fixes (c14685547762 tools/testing/nvdimm: Fi=
x mock support for ioremap)
Merging btrfs-fixes/next-fixes (5715b7fa8d8d Merge branch 'misc-5.5' into n=
ext-fixes)
Merging vfs-fixes/fixes (508c8772760d fix autofs regression caused by follo=
w_managed() changes)
Merging dma-mapping-fixes/for-linus (9c24eaf81cc4 iommu/vt-d: Return the co=
rrect dma mask when we are bypassing the IOMMU)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (f3efc406d67e Documentation/ABI: Add missed=
 attribute for mlxreg-io sysfs interfaces)
Merging samsung-krzk-fixes/fixes (a2315d3aea59 ARM: exynos_defconfig: Resto=
re debugfs support)
Merging pinctrl-samsung-fixes/pinctrl-fixes (e42617b825f8 Linux 5.5-rc1)
Merging devicetree-fixes/dt/linus (dbce0b65046d dt-bindings: Add missing 'p=
roperties' keyword enclosing 'snps,tso')
Merging scsi-fixes/fixes (04060db41178 scsi: RDMA/isert: Fix a recently int=
roduced regression related to logout)
Merging drm-fixes/drm-fixes (def9d2780727 Linux 5.5-rc7)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (5eec71829ad7 drm/i915: Align =
engine->uabi_class/instance with i915_drm.h)
Merging mmc-fixes/fixes (2a187d033520 mmc: sdhci: fix minimum clock rate fo=
r v3 controller)
Merging rtc-fixes/rtc-fixes (f01f4ffdfb70 rtc: cmos: Revert "rtc: Fix the A=
ltCentury value on AMD/Hygon platform")
Merging gnss-fixes/gnss-linus (d1eef1c61974 Linux 5.5-rc2)
Merging hyperv-fixes/hyperv-fixes (af42d3466bdc Linux 5.4-rc8)
Merging soc-fsl-fixes/fix (5674a92ca4b7 soc/fsl/qe: Fix an error code in qe=
_pin_request())
Merging risc-v-fixes/fixes (def9d2780727 Linux 5.5-rc7)
Merging pidfd-fixes/fixes (6b3ad6649a4c ptrace: reintroduce usage of subjec=
tive credentials in ptrace_has_cap())
Merging fpga-fixes/fixes (dec43da46f63 fpga: altera-ps-spi: Fix getting of =
optional confd gpio)
Merging spdx/spdx-linus (2f13437b8917 Merge tag 'trace-v5.5-2' of git://git=
.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging gpio-intel-fixes/fixes (e42617b825f8 Linux 5.5-rc1)
Merging pinctrl-intel-fixes/fixes (9608ea6c6613 pinctrl: sunrisepoint: Add =
missing Interrupt Status register offset)
Merging erofs-fixes/fixes (d1eef1c61974 Linux 5.5-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (bdefca2d8dc0 drm/panfrost: Add=
 the panfrost_gem_mapping concept)
Merging kspp-gustavo/for-next/kspp (3d519d6d388b sh: kgdb: Mark expected sw=
itch fall-throughs)
Merging kbuild/for-next (6d5a8286859d Merge branch 'kconfig' into for-next)
Merging compiler-attributes/compiler-attributes (54ecb8f7028c Linux 5.4-rc1)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (a7ba70f1787f dma-mapping: treat dev->bus_dma_=
mask as a DMA limit)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (eac795cca1c0 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (e533dbe9dcb1 arm64: acpi: fix DAIF manipulatio=
n with pNMI)
Merging arm-perf/for-next/perf (8703317ae576 drivers/perf: hisi: update the=
 sccl_id/ccl_id for certain HiSilicon platform)
Merging arm-soc/for-next (d57d85ff5883 ARM: Document merges)
Merging amlogic/for-next (655696c43164 Merge branch 'v5.6/defconfig' into t=
mp/aml-rebuild)
Merging aspeed/for-next (767774e5f8b3 ARM: dts: aspeed: tiogapass: Add gpio=
 line names)
Merging at91/at91-next (4ba105339864 Merge branches 'at91-soc', 'at91-dt' a=
nd 'at91-defconfig' into at91-next)
Merging bcm2835/for-next (f14234184671 Merge branch 'bcm2835-maintainers-ne=
xt' into for-next)
Merging imx-mxs/for-next (c65228f2fe91 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (a1766a49fc90 Merge tag 'drivers_soc_for_5.6' into ne=
xt)
Merging mediatek/for-next (fdef5207b966 Merge branch 'v5.5-next/soc' into f=
or-next)
Merging mvebu/for-next (c0d03b53ef47 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (59300c714ba8 Merge branch 'omap-for-v5.6/dt' into fo=
r-next)
Merging qcom/for-next (4c26b123c1dd Merge branches 'arm64-defconfig-for-5.6=
', 'arm64-for-5.6', 'defconfig-for-5.6', 'drivers-for-5.6' and 'dts-for-5.6=
' into for-next)
Merging realtek/for-next (45698e00d5a9 Merge branch 'v5.6/dt' into next)
Merging renesas/next (9e4188a77f5e Merge branch 'renesas-drivers-for-v5.6' =
into renesas-next)
Merging reset/reset/next (08d7c09952e2 dt-bindings: reset: intel,rcu-gw: Fi=
x intel,global-reset schema)
Merging rockchip/for-next (d9279b5b52ef Merge branch 'v5.6-armsoc/dts64' in=
to for-next)
Merging samsung-krzk/for-next (ce232ab5d7c8 Merge branch 'next/soc' into fo=
r-next)
Merging scmi/for-linux-next (def9d2780727 Linux 5.5-rc7)
Merging sunxi/sunxi/for-next (7493e675c584 Merge remote-tracking branches '=
sunxi-korg/sunxi/clk-fixes-for-5.5', 'sunxi-korg/sunxi/fixes-for-5.5', 'sun=
xi-korg/sunxi/config-for-5.6', 'sunxi-korg/sunxi/config64-for-5.6', 'sunxi-=
korg/sunxi/clk-for-5.6' and 'sunxi-korg/sunxi/dt-for-5.6' into sunxi/for-ne=
xt)
Merging tegra/for-next (9a55272ef4d5 Merge branch for-5.6/clk into for-next)
Merging clk/clk-next (85842de7b67e Merge branch 'clk-ti' into clk-next)
Merging clk-samsung/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (89366173a8d0 csky/Kconfig: Add Kconfig.platforms t=
o support some drivers)
Merging h8300/h8300-next (a5de8865cb3e h8300: move definition of __kernel_s=
ize_t etc. to posix_types.h)
Merging ia64/next (240b62d381fe ia64: remove stale paravirt leftovers)
Merging m68k/for-next (6aabc1facdb2 m68k: Implement copy_thread_tls())
Merging m68knommu/for-next (def9d2780727 Linux 5.5-rc7)
Merging microblaze/next (22648c989cb8 microblaze: Increase max dtb size to =
64K from 32K)
Merging mips/mips-next (4f29ad200f7b MIPS: syscalls: fix indentation of the=
 'SYSNR' message)
Merging nds32/next (a7f96fce201c MAINTAINERS: add nds32 maintainer)
Merging nios2/for-next (051d75d3bb31 MAINTAINERS: Update Ley Foon Tan's ema=
il address)
Merging openrisc/for-next (0ecdcaa6d5e7 openrisc: Fix Kconfig indentation)
Merging parisc-hd/for-next (b3a987b0264d Linux 5.5-rc6)
Merging powerpc/next (3a9d970f17e0 powerpc/85xx: Get twr_p102x to compile a=
gain)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (6e62bd36e9ad soc: fsl: qe: remove set but not used va=
riable 'mm_gc')
Merging risc-v/for-next (71ebdcc73663 riscv: mm: add support for CONFIG_DEB=
UG_VIRTUAL)
Merging sifive/for-next (467e050e9760 Merge branch 'i2c/for-current' of git=
://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging s390/features (17248ea03674 s390: fix __EMIT_BUG() macro)
Merging sh/sh-next (a193018e5290 sh: add missing EXPORT_SYMBOL() for __dela=
y)
Merging sparc-next/master (b71acb0e3721 Merge branch 'linus' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging uml/linux-next (d65197ad5249 um: Fix time-travel=3Dinf-cpu with xor=
/raid6)
Merging xtensa/xtensa-for-next (bd6d7558140c Merge branch 'xtensa-5.5' into=
 xtensa-for-next)
Merging fscrypt/master (50d9fad73a45 ubifs: use IS_ENCRYPTED() instead of u=
bifs_crypt_is_encrypted())
Merging afs/afs-next (4fe171bb81b1 afs: Remove set but not used variable 'r=
et')
Merging btrfs/for-next (38fe4639e9b4 Merge branch 'for-next-next-v5.5-20200=
121' into for-next-20200121)
Merging ceph/master (94ff8c60a4c7 ceph: print name of xattr in __ceph_{get,=
set}xattr() douts)
Merging cifs/for-next (9c8e772822a3 cifs: use PTR_ERR_OR_ZERO() to simplify=
 code)
Merging configfs/for-next (e2f238f7d5a1 configfs: calculate the depth of pa=
rent item)
Merging ecryptfs/next (b4a81b87a4cf ecryptfs: fix a memory leak bug in ecry=
ptfs_init_messaging())
Merging erofs/dev (4d2024370d87 erofs: fix out-of-bound read for shifted un=
compressed block)
Merging ext3/for_next (26a00610ef63 Pull UDF fixes.)
Merging ext4/dev (a09decff5c32 jbd2: clear JBD2_ABORT flag before journal_r=
eset to update log tail info when load journal)
Merging f2fs/dev (fb24fea75ca5 f2fs: change to use rwsem for gc_mutex)
Merging fsverity/fsverity (da3a3da4e6c6 fs-verity: use u64_to_user_ptr())
Merging fuse/for-next (7df1e988c723 fuse: fix fuse_send_readpages() in the =
syncronous read case)
Merging jfs/jfs-next (802a5017ffb2 jfs: remove unused MAXL2PAGES)
Merging nfs/linux-next (def9d2780727 Linux 5.5-rc7)
Merging nfs-anna/linux-next (e9bf5ffb104a NFS: remove unused macros)
Merging nfsd/nfsd-next (e44b4bf2648e nfsd: use true,false for bool variable=
 in nfssvc.c)
Merging orangefs/for-next (f9bbb68233aa orangefs: posix open permission che=
cking...)
Merging overlayfs/overlayfs-next (6c7bed084507 ovl: improving copy-up effic=
iency for big sparse file)
Merging ubifs/linux-next (fe357dbae113 ubi: Fix an error pointer dereferenc=
e in error handling code)
Merging v9fs/9p-next (79fb9216b7be 9p: Remove unneeded semicolon)
Merging xfs/for-next (aa124436f329 xfs: change return value of xfs_inode_ne=
ed_cow to int)
Merging zonefs/for-next (03a1785d07aa zonefs: Add documentation)
Merging iomap/iomap-for-next (62e298db3fc3 fs: Fix page_mkwrite off-by-one =
errors)
Merging djw-vfs/vfs-for-next (3253d9d09337 splice: only read in as much inf=
ormation as there is pipe buffer space)
Merging file-locks/locks-next (98ca480a8f22 locks: print unsigned ino in /p=
roc/locks)
Merging vfs/for-next (08f3f0300c87 Merge branch 'work.adfs' into for-next)
CONFLICT (content): Merge conflict in fs/Makefile
CONFLICT (content): Merge conflict in arch/m68k/kernel/syscalls/syscall.tbl
Applying: fs: fix up for !CONFIG_BLOCK and bmap
Merging printk/for-next (e616b43fb3a3 Merge branch 'for-5.6' into for-next)
Merging pci/next (2919da90bf22 Merge branch 'remotes/lorenzo/pci/uniphier')
Merging pstore/for-next/pstore (e163fdb3f7f8 pstore/ram: Regularize prz lab=
el allocation lifetime)
Merging hid/for-next (d036ff0e56a7 Merge branch 'for-5.6/logitech' into for=
-next)
Merging i2c/i2c/for-next (e18370a2a9dd Merge branch 'i2c/for-5.6' into i2c/=
for-next)
Merging i3c/i3c/next (3952cf8ff2f7 i3c: master: dw: reattach device on firs=
t available location of address table)
Merging dmi/master (2429c99fa13a firmware: dmi: Add dmi_memdev_handle)
Merging hwmon-staging/hwmon-next (46215c08d2d4 hwmon: (k10temp) Add debugfs=
 support)
Merging jc_docs/docs-next (6535a39ffa88 Documentation: Call out example SYM=
_FUNC_* usage as x86-specific)
Merging v4l-dvb/master (2a0a0bc7020e media: MAINTAINERS: add entry for Rock=
chip ISP1 driver)
Merging v4l-dvb-next/master (d45331b00ddb Linux 5.3-rc4)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (fdf356f51cf0 Merge branch 'pm-devfreq' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (a48ac1c9f294 cpufreq: brcmstb-a=
vs: fix imbalance of cpufreq policy refcount)
Merging cpupower/cpupower (41ddb7e1f796 cpupower: Revert library ABI change=
s from commit ae2917093fb60bdc1ed3e)
Merging opp/opp/linux-next (03758d60265c opp: Replace list_kref with a loca=
l counter)
Merging thermal/thermal/linux-next (eefb85077bfe ARM: configs: Build BCM271=
1 thermal as module)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (a48f9721e6db dlm: no need to check return value of debugf=
s_create functions)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (eaad647e5cc2 IB/mlx4: Fix memory leak in add_gid err=
or flow)
Merging net-next/master (c5d19a6ecfce net: convert additional drivers to us=
e phy_do_ioctl)
Applying: Revert "pktgen: Allow configuration of IPv6 source address range"
Merging bpf-next/master (1b2fd38de9fc Merge branch 'bpf-dynamic-relinking')
Merging ipsec-next/master (e27cca96cd68 xfrm: add espintcp (RFC 8229))
Merging mlx5-next/mlx5-next (a880a6dd8537 net/mlx5: Expose relaxed ordering=
 bits)
Merging netfilter-next/master (c5d19a6ecfce net: convert additional drivers=
 to use phy_do_ioctl)
Merging nfc-next/master (1f008cfec5d5 NFC: fdp: Fix unused variable warning=
s)
CONFLICT (content): Merge conflict in drivers/nfc/st21nfca/se.c
Merging ipvs-next/master (d54725cd11a5 netfilter: nf_tables: support for mu=
ltiple devices per netdev hook)
Merging wireless-drivers-next/master (e07c5f2e4e91 net: amd: a2065: Use pri=
nt_hex_dump_debug() helper)
Merging bluetooth/master (6613babaf662 Bluetooth: fix appearance typo in mg=
mt.c)
Merging mac80211-next/master (30b2f0be23fb mac80211: add ieee80211_is_any_n=
ullfunc())
Merging gfs2/for-next (18e748a5f66c Revert "gfs2: eliminate tr_num_revoke_r=
m")
Merging mtd/mtd/next (589e1b6c47ce Merge tag 'nand/for-5.5' into mtd/next)
Merging nand/nand/next (d85339d9ea26 mtd: onenand: Rename omap2 driver to a=
void a build warning)
Merging spi-nor/spi-nor/next (ccfb9299a0b6 mtd: spi-nor: Add support for at=
25sl321)
Merging crypto/master (0bc81767c5bd crypto: arm/chacha - fix build failured=
 when kernel mode NEON is disabled)
Merging drm/drm-next (d7ca2d19c751 Merge tag 'drm-msm-next-2020-01-14' of h=
ttps://gitlab.freedesktop.org/drm/msm into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem_gtt.c
Applying: fix up for "drm/i915/userptr: fix size calculation"
Merging amdgpu/drm-next (6bb1efc55e4c drm/amdgpu: original raven doesn't su=
pport full asic reset)
Merging drm-intel/for-linux-next (6fef8510a7a5 drm/i915: Cleanup properly i=
f the implicit fence setup fails)
Merging drm-tegra/drm/tegra/for-next (033ccdb7f6b1 gpu: host1x: Remove dev_=
err() on platform_get_irq() failure)
Merging drm-misc/for-linux-next (db735fc4036b drm/msm: Set dma maximum segm=
ent size for mdss)
Merging drm-msm/msm-next (5f9935f514d6 drm/msm: Fix error about comments wi=
thin a comment block)
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (4d24376370fb gpu: ipu-v3: image-convert: only=
 sample into the next tile if necessary)
Merging etnaviv/etnaviv/next (22567d017c2c dt-bindings: etnaviv: Add #cooli=
ng-cells)
Merging regmap/for-next (ea87683909bc Merge branch 'regmap-5.6' into regmap=
-next)
Merging sound/for-next (2928fa0a97eb ALSA: hda/hdmi - add retry logic to pa=
rse_intel_hdmi())
Merging sound-asoc/for-next (db9170f617c7 Merge branch 'asoc-5.6' into asoc=
-next)
Merging modules/modules-next (708e0ada1916 module: avoid setting info->name=
 early in case we can fall back to info->mod->name)
Merging input/next (273db8f03509 Input: add IOC3 serio driver)
Merging block/for-next (b0bd3b8e41f4 Merge branch 'for-5.6/io_uring-vfs' in=
to for-next)
Merging device-mapper/for-next (dcd195071f22 dm writecache: improve perform=
ance of large linear writes on SSDs)
Merging pcmcia/pcmcia-next (71705c611263 PCMCIA/i82092: remove #if 0 block)
Merging mmc/next (f594e2ec7e0d mmc: sdhci-msm: Add CQHCI support for sdhci-=
msm)
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (e3c11a32867c mfd: cros_ec: Add cros-usbpd-notify =
subdevice)
Merging backlight/for-backlight-next (ab654859c4bb backlight: qcom-wled: Fi=
x unsigned comparison to zero)
Merging battery/for-next (3d32a8437c05 power: supply: ipaq_micro_battery: r=
emove unneeded semicolon)
Merging regulator/for-next (88481ae77cd6 Merge remote-tracking branch 'regu=
lator/topic/equal' into regulator-next)
Merging security/next-testing (45893a0abee6 kexec: Fix file verification on=
 S390)
Merging apparmor/apparmor-next (01df52d726b5 apparmor: remove duplicate che=
ck of xattrs on profile attachment.)
Merging integrity/next-integrity (5a08b32f3eba IMA: pre-allocate buffer to =
hold keyrings string)
Merging keys/keys-next (a862a7995374 Merge branch 'keys-acl' into keys-next)
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
Merging selinux/next (98aa00345de5 selinux: fix regression introduced by mo=
ve_mount(2) syscall)
CONFLICT (content): Merge conflict in include/linux/lsm_audit.h
Merging smack/for-next (92604e825304 smack: use GFP_NOFS while holding inod=
e_smack::smk_lock)
Merging tomoyo/master (a8772fad0172 tomoyo: Use atomic_t for statistics cou=
nter)
Merging tpmdd/next (7084eddf6be9 tpm: Add tpm_version_major sysfs file)
Merging watchdog/master (b3a987b0264d Linux 5.5-rc6)
Merging iommu/next (b369caee1f11 Merge branches 'arm/smmu', 'x86/amd', 'x86=
/vt-d' and 'core' into next)
Merging vfio/next (7b5372ba04ca vfio: platform: fix __iomem in vfio_platfor=
m_amdxgbe.c)
Merging audit/next (cb5172d96d16 audit: Add __rcu annotation to RCU pointer)
Merging devicetree/for-next (a6c4f77cb3b1 dt-bindings: iio: adc: ad7606: Fi=
x wrong maxItems value)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/mmc=
/fsl-imx-esdhc.txt
Merging mailbox/mailbox-for-next (c6c6bc6ea9fc mailbox: imx: add support fo=
r imx v1 mu)
Merging spi/for-next (342cbd76979e Merge branch 'spi-5.6' into spi-next)
Merging tip/auto-latest (1e53251a964b Merge branch 'x86/cache')
Merging clockevents/timers/drivers/next (e4c3b4213b79 clocksource/hyperv: S=
et TSC clocksource as default w/ InvariantTSC)
Merging edac/edac-for-next (7e5d6cf35329 EDAC/amd64: Do not warn when remov=
ing instances)
Merging irqchip/irq/irqchip-next (f4a81f5a853e irqchip/gic-v4.1: Allow dire=
ct invalidation of VLPIs)
Merging ftrace/for-next (3b42a4c83a31 tracing: trigger: Replace unneeded RC=
U-list traversals)
Merging rcu/rcu/next (bead35304881 rcu: Add *_ONCE() to rcu_node ->boost_kt=
hread_status)
CONFLICT (content): Merge conflict in lib/Kconfig.debug
Merging kvm/linux-next (6948199a9af9 KVM: x86/mmu: WARN if root_hpa is inva=
lid when handling a page fault)
CONFLICT (content): Merge conflict in arch/x86/include/asm/vmx.h
Merging kvm-arm/next (da19df87b1ee KVM: arm: Make inject_abt32() inject an =
external abort instead)
Merging kvm-ppc/kvm-ppc-next (3a43970d55e9 KVM: PPC: Book3S HV: Implement H=
_SVM_INIT_ABORT hcall)
Merging kvms390/next (c7b7de631246 KVM: s390: Do not yield when target is a=
lready running)
Merging xen-tip/linux-next (eda4eabf86fd xen/balloon: Support xend-based to=
olstack take two)
Merging percpu/for-next (06557cf18eae Merge branch 'for-5.6' into for-next)
Merging workqueues/for-next (e8ab20d9bcb3 workqueue: remove workqueue_work =
event class)
Merging drivers-x86/for-next (a3e2b51ca31f platform/x86: asus-nb-wmi: Suppo=
rt left round button on N56VB)
CONFLICT (content): Merge conflict in Documentation/ABI/stable/sysfs-driver=
-mlxreg-io
Merging chrome-platform/for-next (3b0bfd33ffb2 Merge branch 'chrome-platfor=
m-5.5-fixes' into for-kernelci)
Merging hsi/for-next (c1030cd45619 HSI: Remove dev_err() usage after platfo=
rm_get_irq())
Merging leds/for-next (260718b3a35d leds: lm3692x: Disable chip on brightne=
ss 0)
Merging ipmi/for-next (6b8526d3abc0 ipmi:ssif: Handle a possible NULL point=
er reference)
Merging driver-core/driver-core-next (f3c19481820c cpu-topology: Don't erro=
r on more than CONFIG_NR_CPUS CPUs in device tree)
CONFLICT (content): Merge conflict in include/linux/device.h
Merging usb/usb-next (9d69cd82fe02 usb: chipidea: add inline for ci_hdrc_ho=
st_driver_init if host is not defined)
Merging usb-gadget/next (4baa550ecc86 usb: musb: remove dummy driver musb_a=
m335x.c)
Merging usb-serial/usb-next (50c3c5e1c1b0 USB: serial: garmin_gps: Use flex=
ible-array member)
Merging usb-chipidea-next/ci-for-usb-next (4d6141288c33 usb: chipidea: imx:=
 pinctrl for HSIC is optional)
Merging phy-next/next (8a79db5e83a5 dt-bindings: phy: Add PHY_TYPE_DP defin=
ition)
Merging tty/tty-next (7788f549ed8c serial_core: Remove unused member in uar=
t_port)
Merging char-misc/char-misc-next (fd2d11cc8af4 Merge 5.5-rc7 into char-misc=
-next)
Merging extcon/extcon-next (b7365587f513 extcon: Remove unneeded extern key=
word from extcon.h)
Merging soundwire/next (5098cae1f79c dt-bindings: soundwire: fix example)
Merging thunderbolt/next (def9d2780727 Linux 5.5-rc7)
Merging staging/staging-next (c318f074d9fd Merge 5.5-rc7 into staging-next)
Merging mux/for-next (f356d58c3a04 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (30c8fa3ec61a interconnect: qcom: Add MSM8916 intercon=
nect provider driver)
Merging slave-dma/next (c3c431de99c0 dmaengine: Move dma_get_{,any_}slave_c=
hannel() to private dmaengine.h)
Merging cgroup/for-next (c00ec3075b3a Merge branch 'for-5.6' into for-next)
Merging scsi/for-next (76dd8578c8c6 Merge branch 'misc' into for-next)
CONFLICT (content): Merge conflict in Documentation/core-api/index.rst
Merging scsi-mkp/for-next (ce565b8c57c4 Merge branch '5.5/scsi-fixes' into =
5.6/scsi-next)
Merging vhost/linux-next (d1281e3a562e virtio-blk: remove VIRTIO_BLK_F_SCSI=
 support)
CONFLICT (content): Merge conflict in drivers/block/virtio_blk.c
Merging rpmsg/for-next (34a9acb223e3 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (d18fddff061d gpiolib: Remove duplicated function gpi=
o_do_set_config())
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/ven=
dor-prefixes.yaml
Merging gpio-brgl/gpio/for-next (1e4d149e9017 gpio: altera: change to platf=
orm_get_irq_optional to avoid false-positive error)
Merging gpio-intel/for-next (e42617b825f8 Linux 5.5-rc1)
Merging pinctrl/for-next (1c6fa93ac56f Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (cd0a32371db7 pinctrl: tigerlake: Tiger Lake=
 uses _HID enumeration)
Merging pinctrl-samsung/for-next (225a2ec19aac pinctrl: samsung: Fix missin=
g OF and GPIOLIB dependency on S3C24xx and S3C64xx)
Merging pwm/for-next (9871abffc810 pwm: Remove set but not set variable 'pw=
m')
Merging userns/for-next (61a47c1ad3a4 sysctl: Remove the sysctl system call)
Merging ktest/for-next (9b5f852ae20d ktest: Make default build option oldco=
nfig not randconfig)
Merging random/dev (09a6d00a42ce random: remove some dead code of poolinfo)
Merging kselftest/next (6b64a650f0b2 kselftest: Minimise dependency of get_=
size on C library interfaces)
Merging y2038/y2038 (b8c709bf963a Merge tags 'block-ioctl-cleanup-5.6' and =
'y2038-drivers-for-v5.6-signed' of git://git.kernel.org:/pub/scm/linux/kern=
el/git/arnd/playground into HEAD)
Merging livepatching/for-next (d28b4c1b2b3d Merge branch 'for-5.6/selftests=
' into for-next)
Merging coresight/next (ad9882f15884 coresight: etm4x: Fix unused function =
warning)
Merging rtc/rtc-next (d53f9b68b359 rtc: pcf8563: Use BIT)
Merging nvdimm/libnvdimm-for-next (46cf053efec6 Linux 5.5-rc3)
Merging at24/at24/for-next (821e2c705fb9 dt-bindings: at25: add reference f=
or the wp-gpios property)
Merging ntb/ntb-next (1ef512b16bc8 NTB: Fix an error in get link status)
Merging kspp/for-next/kspp (c79f46a28239 Linux 5.5-rc5)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (d1eef1c61974 Linux 5.5-rc2)
Merging fsi/next (2c01397b71c5 fsi: aspeed: Fix OPB0 byte order register va=
lues)
Merging slimbus/for-next (526eaf5d08a2 slimbus: Use the correct style for S=
PDX License Identifier)
Merging nvmem/for-next (4a81ae0c43bc nvmem: add QTI SDAM driver)
Merging xarray/xarray (00ed452c210a XArray: Add xa_for_each_range)
Merging hyperv/hyperv-next (7a1323b5dfe4 Drivers: hv: vmbus: Fix crash hand=
ler reset of Hyper-V synic)
Merging auxdisplay/auxdisplay (54ecb8f7028c Linux 5.4-rc1)
Merging kgdb/kgdb/for-next (c58ff643763c kdb: Tweak escape handling for vi =
users)
Merging pidfd/for-next (873dfd7881d1 test: Add test for pidfd getfd)
CONFLICT (content): Merge conflict in include/uapi/asm-generic/unistd.h
CONFLICT (content): Merge conflict in include/linux/syscalls.h
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
Merging devfreq/devfreq-next (490a421bc575 PM / devfreq: Add debugfs suppor=
t with devfreq_summary file)
Merging hmm/hmm (fd6988496e79 Linux 5.5-rc4)
Merging fpga/for-next (28910cee898c fpga: xilinx-pr-decoupler: Remove clk_g=
et error message for probe defer)
Merging kunit/test (e42617b825f8 Linux 5.5-rc1)
Merging cel/cel-next (a99d8080aaf3 Linux 5.4-rc6)
Merging kasan-bitops/topic/kasan-bitops (4f4afc2c9599 docs/core-api: Remove=
 possibly confusing sub-headings from Bit Operations)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
CONFLICT (content): Merge conflict in drivers/soc/tegra/fuse/tegra-apbmisc.c
CONFLICT (content): Merge conflict in drivers/platform/x86/intel_telemetry_=
pltdrv.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/sfc/efx.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem_gtt.c
Applying: fix up for "drm/i915/gtt: split up i915_gem_gtt"
Applying: fix up for "sfc: move struct init and fini code"
Merging kunit-next/kunit (35c57fc3f8ea kunit: building kunit as a module br=
eaks allmodconfig)
Merging akpm-current/current (11d0f91eb7a3 ipc/msg.c: Adjust indentation in=
 ksys_msgctl)
CONFLICT (content): Merge conflict in init/main.c
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/block/null_blk_main.c: fix layout
Applying: drivers/block/null_blk_main.c: fix uninitialized var warnings
Applying: pinctrl: fix pxa2xx.c build warnings
Applying: mm: remove __krealloc
Applying: mm: add generic p?d_leaf() macros
Applying: arc: mm: add p?d_leaf() definitions
Applying: arm: mm: add p?d_leaf() definitions
Applying: arm64: mm: add p?d_leaf() definitions
Applying: mips: mm: add p?d_leaf() definitions
Applying: powerpc: mm: add p?d_leaf() definitions
Applying: riscv: mm: add p?d_leaf() definitions
Applying: s390: mm: add p?d_leaf() definitions
Applying: sparc: mm: add p?d_leaf() definitions
Applying: x86: mm: add p?d_leaf() definitions
Applying: mm: pagewalk: add p4d_entry() and pgd_entry()
Applying: mm: pagewalk: fix unused variable warning
Applying: mm: pagewalk: allow walking without vma
Applying: mm: pagewalk: don't lock PTEs for walk_page_range_novma()
Applying: mm: pagewalk: fix termination condition in walk_pte_range()
Applying: mm: pagewalk: add 'depth' parameter to pte_hole
Applying: x86: mm: point to struct seq_file from struct pg_state
Applying: x86: mm+efi: convert ptdump_walk_pgd_level() to take a mm_struct
Applying: x86: mm: convert ptdump_walk_pgd_level_debugfs() to take an mm_st=
ruct
Applying: mm: add generic ptdump
Applying: x86: mm: convert dump_pagetables to use walk_page_range
Applying: arm64: mm: convert mm/dump.c to use walk_page_range()
Applying: arm64: mm: display non-present entries in ptdump
Applying: mm: ptdump: reduce level numbers by 1 in note_page()
Applying: x86: mm: avoid allocating struct mm_struct on the stack
Applying: x86-mm-avoid-allocating-struct-mm_struct-on-the-stack-fix
Applying: powerpc/mmu_gather: enable RCU_TABLE_FREE even for !SMP case
Applying: mm/mmu_gather: invalidate TLB correctly on batch allocation failu=
re and flush
Applying: asm-generic/tlb: avoid potential double flush
Applying: asm-gemeric/tlb: remove stray function declarations
Applying: asm-generic/tlb: add missing CONFIG symbol
Applying: asm-generic/tlb: rename HAVE_RCU_TABLE_FREE
CONFLICT (content): Merge conflict in arch/arm64/Kconfig
Applying: asm-generic/tlb: rename HAVE_MMU_GATHER_PAGE_SIZE
Applying: asm-generic/tlb: Rename HAVE_MMU_GATHER_NO_GATHER
Applying: asm-generic/tlb: Provide MMU_GATHER_TABLE_FREE
Applying: proc: decouple proc from VFS with "struct proc_ops"
Applying: proc: convert everything to "struct proc_ops"
Applying: proc-convert-everything-to-struct-proc_ops-fix
Applying: proc-convert-everything-to-struct-proc_ops-fix-2
Applying: lib/string: add strnchrnul()
Applying: bitops: more BITS_TO_* macros
Applying: lib: add test for bitmap_parse()
Applying: fix rebase issue
Applying: lib/test_bitmap: fix address space when test user buffer
Applying: lib: make bitmap_parse_user a wrapper on bitmap_parse
Applying: lib: rework bitmap_parse()
Applying: lib: new testcases for bitmap_parse{_user}
Applying: include/linux/cpumask.h: don't calculate length of the input stri=
ng
Applying: treewide: remove redundant IS_ERR() before error code check
Applying: ARM: dma-api: fix max_pfn off-by-one error in __dma_supported()
Applying: drivers/tty/serial/sh-sci.c: suppress warning
Applying: drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer ove=
rflow
Merging akpm/master (d317c434733e drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/v.duQltC7NqQ+Zq8XojPo+1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4pO00ACgkQAVBC80lX
0Gz1MAf/VJ/vHPGwuPvsSh++qiApWdmjwvubmMtTmtWDnPHZKGPXJy8di8plS4j3
N2ks88p4DMMUwPiYevgbIkEPtLUtK7Tu4Fh9qiiR8q7CKsO+0t9KV9Wqtbn2hbHu
pghysP5F+8BfJ+uO5SOj1cwe6o1RDT7CHkFhknd4CX3AqXrRDV8jV4ybmBD25qBB
CvXI469FNtn5nr4QERsJOOf1gl3kr1GL2gYU9iQugm7dYd9BkgBAwQtu5TncJL5c
ijldRR45JfmHUUuQaNvtcnjdT6RAccK7AFRjQIkPoLXZW5mU5psPXJTrIYEfl7I6
96uuD7KgzGqI5zNCyoC4By52BGW9IQ==
=hjsk
-----END PGP SIGNATURE-----

--Sig_/v.duQltC7NqQ+Zq8XojPo+1--
