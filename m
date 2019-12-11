Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA9A711A18E
	for <lists+linux-next@lfdr.de>; Wed, 11 Dec 2019 03:42:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727254AbfLKCms (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Dec 2019 21:42:48 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:58987 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726619AbfLKCmr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Dec 2019 21:42:47 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47Xh6n74YVz9sPc;
        Wed, 11 Dec 2019 13:42:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576032162;
        bh=VpM66EfgAvCnv+xvHgOL6N/FeVicsSzK770MAxSUwjc=;
        h=Date:From:To:Cc:Subject:From;
        b=Eou5ODMU/OXW9HavQTNInjQiNydzLYPFr9039u3bkTRuhVXwz6eiFL5b7HUrPrW+Q
         qsbvpZeMy/WcL/88zH4jQFq72B7IxlV2AloSq3MFJAFHlkJcWbcSJV3tQFNFQECacR
         PtGnXK3MtwJpuqKV1OefBPfBJ9Wy+DHM+Smeqg62MEIDfEvV8851RbQnAEkWn52dMr
         CBiGyYGeY+20T3+q2gMRP/0EiTDqNPDwIjod57x4sreMXElAn4Itw+wt334jb1cYOw
         Dk6vvDCuOIjJTs7FGnOdJ3xztRC8ho3l+nxIagiNgs4UMx7qAuDxDwBOdUH2x9Fj6G
         D0VjNy+RhZLpQ==
Date:   Wed, 11 Dec 2019 13:42:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Dec 11
Message-ID: <20191211134241.14cf41bf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1jE1pFDr4RuGQ/sq8G3KVhE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1jE1pFDr4RuGQ/sq8G3KVhE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20191210:

The selinux tree lost its build failure.

Non-merge commits (relative to Linus' tree): 1903
 2129 files changed, 111948 insertions(+), 23898 deletions(-)

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

I am currently merging 313 trees (counting Linus' and 78 trees of bug
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
Merging origin/master (6794862a16ef Merge tag 'for-5.5-rc1-kconfig-tag' of =
git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux)
Merging fixes/master (31f4f5b495a6 Linux 5.4-rc7)
Merging kbuild-current/fixes (cf6b58ab2d55 kbuild: fix 'No such file or dir=
ectory' warning when cleaning)
Merging arc-current/for-curr (cd4c2493fa58 ARC: mm: drop stale define of __=
ARCH_USE_5LEVEL_HACK)
Merging arm-current/fixes (39f4d4410484 Merge branch 'misc' into fixes)
Merging arm-soc-fixes/arm/fixes (df4a6ff19224 Merge tag 'vexpress-fixes-5.5=
' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into =
arm/fixes)
Merging arm64-fixes/for-next/fixes (e50be648aaa3 arm64: uaccess: Remove uac=
cess_*_not_uao asm macros)
Merging m68k-current/for-linus (5ed0794cde59 m68k/atari: Convert Falcon IDE=
 drivers to platform drivers)
Merging powerpc-fixes/fixes (249fad734a25 powerpc/perf: Disable trace_imc p=
mu)
Merging s390-fixes/fixes (219d54332a09 Linux 5.4)
Merging sparc/master (038029c03e21 sparc: remove unneeded uapi/asm/statfs.h)
Merging fscrypt-current/for-stable (ae64f9bd1d36 Linux 4.15-rc2)
Merging net/master (868afbaca1e2 NFC: nxp-nci: Fix probing without ACPI)
Merging bpf/master (e42617b825f8 Linux 5.5-rc1)
Merging ipsec/master (e42617b825f8 Linux 5.5-rc1)
Merging netfilter/master (868afbaca1e2 NFC: nxp-nci: Fix probing without AC=
PI)
Merging ipvs/master (c24b75e0f923 ipvs: move old_secure_tcp into struct net=
ns_ipvs)
Merging wireless-drivers/master (0df36b90c47d iwlwifi: pcie: move power gat=
ing workaround earlier in the flow)
Merging mac80211/master (e58c19124189 slip: Fix use-after-free Read in slip=
_open)
Merging rdma-fixes/for-rc (e42617b825f8 Linux 5.5-rc1)
Merging sound-current/for-linus (6e8aeda224c8 ALSA: hda/hdmi - Fix duplicat=
e unref of pci_dev)
Merging sound-asoc-fixes/for-linus (53c1a7863d74 Merge branch 'asoc-5.5' in=
to asoc-linus)
Merging regmap-fixes/for-linus (e42617b825f8 Linux 5.5-rc1)
Merging regulator-fixes/for-linus (d3d039851f84 Merge branch 'regulator-5.5=
' into regulator-linus)
Merging spi-fixes/for-linus (6f2e2fffd91f Merge branch 'spi-5.5' into spi-l=
inus)
Merging pci-current/for-linus (e42617b825f8 Linux 5.5-rc1)
Merging driver-core.current/driver-core-linus (eecd37e105f0 drivers: Fix bo=
ot problem on SuperH)
Merging tty.current/tty-linus (e42617b825f8 Linux 5.5-rc1)
Merging usb.current/usb-linus (09068c1ad53f USB: atm: ueagle-atm: add missi=
ng endpoint check)
Merging usb-gadget-fixes/fixes (e5b5da96da50 usb: gadget: fix wrong endpoin=
t desc)
Merging usb-serial-fixes/usb-linus (e42617b825f8 Linux 5.5-rc1)
Merging usb-chipidea-fixes/ci-for-usb-stable (16009db47c51 usb: chipidea: u=
dc: workaround for endpoint conflict issue)
Merging phy/fixes (54ecb8f7028c Linux 5.4-rc1)
Merging staging.current/staging-linus (4bcd9eae7310 fbtft: Fix the initiali=
zation from property algorithm)
Merging char-misc.current/char-misc-linus (702600eef730 lib: raid6: fix awk=
 build warnings)
Merging soundwire-fixes/fixes (e42617b825f8 Linux 5.5-rc1)
Merging thunderbolt-fixes/fixes (e42617b825f8 Linux 5.5-rc1)
Merging input-current/for-linus (afbd65f5e71a Merge branch 'next' into for-=
linus)
Merging crypto-current/master (8a6b8f4d7a89 crypto: hisilicon - fix a NULL =
vs IS_ERR() bug in sec_create_qp_ctx())
Merging ide/master (baf6722aa0cb ide: Use dev_get_drvdata where possible)
Merging vfio-fixes/for-linus (95f89e090618 vfio/type1: Initialize resv_msi_=
base)
Merging kselftest-fixes/fixes (99e51aa8f701 Documentation: kunit: add docum=
entation for kunit_tool)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging slave-dma-fixes/fixes (e42617b825f8 Linux 5.5-rc1)
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (df8fed831cbc mtd: rawnand: au1550nd: Fix au_re=
ad_buf16() prototype)
Merging mfd-fixes/for-mfd-fixes (603d9299da32 mfd: mt6397: Fix probe after =
changing mt6397-core)
Merging v4l-dvb-fixes/fixes (e42617b825f8 Linux 5.5-rc1)
Merging reset-fixes/reset/fixes (db23808615e2 reset: Do not register resour=
ce data for missing resets)
Merging mips-fixes/mips-fixes (3f0a2abff9aa MIPS: Prevent link failure with=
 kcov instrumentation)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (e00b59d30506 ARM: omap2plus_defconfig: Add back D=
EBUG_FS)
Merging kvm-fixes/master (2f13437b8917 Merge tag 'trace-v5.5-2' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging kvms390-fixes/master (fe33a928bfcd KVM: s390: ENOTSUPP -> EOPNOTSUP=
P fixups)
Merging hwmon-fixes/hwmon (20358214d96b hwmon: (adt7475) Make volt2reg retu=
rn same reg as reg2volt input)
Merging nvdimm-fixes/libnvdimm-fixes (6370740e5f8e fs/dax: Fix pmd vs pte c=
onflict detection)
Merging btrfs-fixes/next-fixes (bfbbf8cb43a7 Merge branch 'misc-5.4' into n=
ext-fixes)
Merging vfs-fixes/fixes (7fcd59b64a7b fs/namei.c: fix missing barriers when=
 checking positivity)
Merging dma-mapping-fixes/for-linus (9c24eaf81cc4 iommu/vt-d: Return the co=
rrect dma mask when we are bypassing the IOMMU)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (e42617b825f8 Linux 5.5-rc1)
Merging samsung-krzk-fixes/fixes (a2315d3aea59 ARM: exynos_defconfig: Resto=
re debugfs support)
Merging pinctrl-samsung-fixes/pinctrl-fixes (e42617b825f8 Linux 5.5-rc1)
Merging devicetree-fixes/dt/linus (5dba51754b04 of: reserved_mem: add missi=
ng of_node_put() for proper ref-counting)
Merging scsi-fixes/fixes (bba340c79bfe scsi: iscsi: Avoid potential deadloc=
k in iscsi_if_rx func)
Merging drm-fixes/drm-fixes (781d5eb4b4a6 Merge tag 'drm-misc-fixes-2019-11=
-25' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (f26a9e959a7b drm/i915/gt: Det=
ect if we miss WaIdleLiteRestore)
Merging mmc-fixes/fixes (63fe5e7356b8 mmc: sdhci: Update the tuning failed =
messages to pr_debug level)
Merging rtc-fixes/rtc-fixes (111bf02b8f54 rtc: sun6i: Add support for RTC c=
locks on R40)
Merging gnss-fixes/gnss-linus (e42617b825f8 Linux 5.5-rc1)
Merging hyperv-fixes/hyperv-fixes (af42d3466bdc Linux 5.4-rc8)
Merging soc-fsl-fixes/fix (5674a92ca4b7 soc/fsl/qe: Fix an error code in qe=
_pin_request())
Merging risc-v-fixes/fixes (bc3e8f5d42d5 riscv: only select serial sifive i=
f TTY is enabled)
Merging pidfd-fixes/fixes (0b8d616fb5a8 taskstats: fix data-race)
Merging fpga-fixes/fixes (dec43da46f63 fpga: altera-ps-spi: Fix getting of =
optional confd gpio)
Merging spdx/spdx-linus (2f13437b8917 Merge tag 'trace-v5.5-2' of git://git=
.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging gpio-intel-fixes/fixes (e42617b825f8 Linux 5.5-rc1)
Merging pinctrl-intel-fixes/fixes (b9a19bdbc843 pinctrl: cherryview: Pass i=
rqchip when adding gpiochip)
Merging erofs-fixes/fixes (ffafde478309 erofs: update documentation)
Merging drm-misc-fixes/for-linux-next-fixes (78baee8d3b97 MAINTAINERS: Matc=
h on dma_buf|fence|resv anywhere)
Merging kspp-gustavo/for-next/kspp (da0c9ea146cb Linux 5.4-rc2)
Merging kbuild/for-next (e42617b825f8 Linux 5.5-rc1)
Merging compiler-attributes/compiler-attributes (54ecb8f7028c Linux 5.4-rc1)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (a7ba70f1787f dma-mapping: treat dev->bus_dma_=
mask as a DMA limit)
Merging asm-generic/master (9b87647c665d asm-generic: add unlikely to defau=
lt BUG_ON(x))
Merging arc/for-next (9fbea0b7e842 ARC: add kmemleak support)
Merging arm/for-next (04bb96427d4e ARM: 8947/1: Fix __arch_get_hw_counter()=
 access to CNTVCT)
Merging arm64/for-next/core (de858040ee80 arm64: entry: refine comment of s=
tack overflow check)
Merging arm-perf/for-next/perf (8703317ae576 drivers/perf: hisi: update the=
 sccl_id/ccl_id for certain HiSilicon platform)
Merging arm-soc/for-next (8c2b0bc0f0f8 ARM: Document merges)
Merging amlogic/for-next (6289c6a6f363 Merge branch 'v5.6/dt64' into tmp/am=
l-rebuild)
Merging aspeed/for-next (2aee80727dca Merge branch 'defconfig-for-v5.5' int=
o for-next)
CONFLICT (content): Merge conflict in arch/arm/configs/multi_v7_defconfig
Merging at91/at91-next (57785a9d364f Merge branches 'at91-soc' and 'at91-dt=
' into at91-next)
Merging bcm2835/for-next (f14234184671 Merge branch 'bcm2835-maintainers-ne=
xt' into for-next)
Merging imx-mxs/for-next (349adf06d30b Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (2af8e1f26c65 Merge branch 'for_5.5/driver-soc' into =
next)
Merging mediatek/for-next (4ae1ce88e9a0 Merge branch 'v5.3-next/soc' into f=
or-next)
Merging mvebu/for-next (cd592187f9de arm64: dts: uDPU: SFP cages support 3W=
 modules)
Merging omap/for-next (793fc144bac3 Merge branch 'fixes' into for-next)
Merging qcom/for-next (36256992d59e Merge branches 'arm64-for-5.5-fixes', '=
drivers-for-5.5-fixes', 'arm64-defconfig-for-5.6', 'arm64-for-5.6', 'defcon=
fig-for-5.6' and 'dts-for-5.6' into for-next)
Merging realtek/for-next (6a41c7019bca Merge branch 'v5.5/dt64' into next)
Merging renesas/next (7b9952bb2d12 Merge branches 'renesas-arm-defconfig-fo=
r-v5.6', 'renesas-arm-dt-for-v5.6' and 'renesas-dt-bindings-for-v5.6' into =
renesas-next)
Merging reset/reset/next (00040854fa42 reset: uniphier: Add SCSSI reset con=
trol for each channel)
Merging rockchip/for-next (f0d0e0810786 Merge branch 'v5.5-armsoc/dts64' in=
to for-next)
Merging samsung-krzk/for-next (a2315d3aea59 ARM: exynos_defconfig: Restore =
debugfs support)
Merging scmi/for-linux-next (e42617b825f8 Linux 5.5-rc1)
Merging sunxi/sunxi/for-next (fb72d216a2f6 Merge branches 'sunxi/clk-fixes-=
for-5.5', 'sunxi/clk-for-5.6', 'sunxi/dt-for-5.6' and 'sunxi/fixes-for-5.5'=
 into sunxi/for-next)
Merging tegra/for-next (e0fd54137bf5 Merge branch for-5.5/cpufreq into for-=
next)
Merging clk/clk-next (ec16ffe36d80 Merge branches 'clk-ingenic', 'clk-init-=
leak', 'clk-ux500' and 'clk-bitmain' into clk-next)
Merging clk-samsung/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (044cf5e15357 csky: Initial stack protector support)
Merging h8300/h8300-next (a5de8865cb3e h8300: move definition of __kernel_s=
ize_t etc. to posix_types.h)
Merging ia64/next (240b62d381fe ia64: remove stale paravirt leftovers)
Merging m68k/for-next (5ed0794cde59 m68k/atari: Convert Falcon IDE drivers =
to platform drivers)
Merging m68knommu/for-next (e42617b825f8 Linux 5.5-rc1)
Merging microblaze/next (22648c989cb8 microblaze: Increase max dtb size to =
64K from 32K)
Merging mips/mips-next (a8d0f11ee50d MIPS: SGI-IP27: Enable ethernet phy on=
 second Origin 200 module)
Merging nds32/next (a7f96fce201c MAINTAINERS: add nds32 maintainer)
Merging nios2/for-next (91d99a724e9c nios2: force the string buffer NULL-te=
rminated)
Merging openrisc/for-next (0ecdcaa6d5e7 openrisc: Fix Kconfig indentation)
Merging parisc-hd/for-next (219d54332a09 Linux 5.4)
Merging powerpc/next (7794b1d4185e Merge tag 'powerpc-5.5-1' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (5a35435ef4e6 soc: fsl: qe: remove PPC32 dependency fr=
om CONFIG_QUICC_ENGINE)
Merging risc-v/for-next (070389ef0f4b Merge branch 'next/add-nonstable-guid=
ance' into for-next)
Merging sifive/for-next (467e050e9760 Merge branch 'i2c/for-current' of git=
://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging s390/features (2115fbf7210b s390: remove compat vdso code)
Merging sh/sh-next (baf58858e8b6 sh: prefer __section from compiler_attribu=
tes.h)
CONFLICT (modify/delete): arch/sh/include/uapi/asm/types.h deleted in sh/sh=
-next and modified in HEAD. Version HEAD of arch/sh/include/uapi/asm/types.=
h left in tree.
CONFLICT (modify/delete): arch/sh/include/uapi/asm/setup.h deleted in sh/sh=
-next and modified in HEAD. Version HEAD of arch/sh/include/uapi/asm/setup.=
h left in tree.
$ git rm -f arch/sh/include/uapi/asm/setup.h arch/sh/include/uapi/asm/types=
.h
Merging sparc-next/master (b71acb0e3721 Merge branch 'linus' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging uml/linux-next (9807019a62dc um: Loadable BPF "Firmware" for vector=
 drivers)
Merging xtensa/xtensa-for-next (bd6d7558140c Merge branch 'xtensa-5.5' into=
 xtensa-for-next)
Merging fscrypt/master (0eee17e33226 f2fs: add support for IV_INO_LBLK_64 e=
ncryption policies)
Merging afs/afs-next (4fe171bb81b1 afs: Remove set but not used variable 'r=
et')
Merging btrfs/for-next (897636c94003 Merge branch 'misc-5.5' into for-next-=
20191119)
Merging ceph/master (da08e1e1d7c3 ceph: add more debug info when decoding m=
dsmap)
Merging cifs/for-next (d94a88c365cb SMB3: Fix crash in SMB2_open_init due t=
o uninitialized field in compounding path)
Merging configfs/for-next (e2f238f7d5a1 configfs: calculate the depth of pa=
rent item)
Merging ecryptfs/next (b4a81b87a4cf ecryptfs: fix a memory leak bug in ecry=
ptfs_init_messaging())
Merging erofs/dev (e42617b825f8 Linux 5.5-rc1)
Merging ext3/for_next (c78185c55450 Pull ext2 error number fix.)
Merging ext4/dev (dfdeeb41fb08 Merge branch 'tt/misc' into dev)
Merging f2fs/dev (b9ec7746bcc3 f2fs: don't keep META_MAPPING pages used for=
 moving verity file blocks)
Merging fsverity/fsverity (73f0ec02d670 docs: fs-verity: mention statx() su=
pport)
Merging fuse/for-next (8d66fcb74884 fuse: fix Kconfig indentation)
Merging jfs/jfs-next (a5fdd713d256 jfs: fix bogus variable self-initializat=
ion)
Merging nfs/linux-next (e42617b825f8 Linux 5.5-rc1)
Merging nfs-anna/linux-next (79cc55422ce9 NFS: Fix an RCU lock leak in nfs4=
_refresh_delegation_stateid())
Merging nfsd/nfsd-next (38a2204f5298 nfsd: depend on CRYPTO_MD5 for legacy =
client tracking)
Merging orangefs/for-next (f9bbb68233aa orangefs: posix open permission che=
cking...)
Merging overlayfs/overlayfs-next (6c7bed084507 ovl: improving copy-up effic=
iency for big sparse file)
Merging ubifs/linux-next (6e78c01fde90 Revert "jffs2: Fix possible null-poi=
nter dereferences in jffs2_add_frag_to_fragtree()")
Merging v9fs/9p-next (aafee43b7286 9p/vfs_super.c: Remove unused parameter =
data in v9fs_fill_super)
Merging xfs/for-next (798a9cada469 xfs: fix mount failure crash on invalid =
iclog memory access)
Merging iomap/iomap-for-next (c275779ff2dd iomap: stop using ioend after it=
's been freed in iomap_finish_ioend())
Merging djw-vfs/vfs-for-next (3253d9d09337 splice: only read in as much inf=
ormation as there is pipe buffer space)
Merging file-locks/locks-next (b41dae061bbd Merge tag 'xfs-5.4-merge-7' of =
git://git.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging vfs/for-next (acf0bd9f7b7d Merge branches 'work.openat2', 'work.rec=
ursive_removal' and 'imm.timestamp' into for-next)
Merging printk/for-next (20aaa2d8e1f3 Merge branch 'for-5.5-pr-warning-remo=
val' into for-next)
Merging pci/next (e42617b825f8 Linux 5.5-rc1)
Merging pstore/for-next/pstore (8d82cee2f8aa pstore: Make pstore_choose_com=
pression() static)
Merging hid/for-next (c8b50de60c9b Merge branch 'for-5.5/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (3ac61258599b i2c: fix header file kernel-doc warn=
ing)
Merging i3c/i3c/next (608b68b67a30 MAINTAINERS: fix style in CADENCE I3C MA=
STER IP entry)
Merging dmi/master (2429c99fa13a firmware: dmi: Add dmi_memdev_handle)
Merging hwmon-staging/hwmon-next (544f8d857a05 hwmon: Driver for MAX31730)
Merging jc_docs/docs-next (36bb9778fd11 docs: remove a bunch of stray CRs)
Merging v4l-dvb/master (2099ef02c6c0 media: dt-bindings: media: cal: conver=
t binding to yaml)
Merging v4l-dvb-next/master (d45331b00ddb Linux 5.3-rc4)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (88d91da9d0ec Merge branch 'devprop' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (c23734487fb4 cpufreq: sun50i: F=
ix CPU speed bin detection)
Merging cpupower/cpupower (e42617b825f8 Linux 5.5-rc1)
Merging opp/opp/linux-next (03758d60265c opp: Replace list_kref with a loca=
l counter)
Merging thermal/thermal/linux-next (1e4b6ac230b9 MAINTAINERS: thermal: Chan=
ge the git tree location)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (7807759e4ad8 firewire: core: code cleanup after =
vm_map_pages_zero introduction)
Merging dlm/next (a48f9721e6db dlm: no need to check return value of debugf=
s_create functions)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (e42617b825f8 Linux 5.5-rc1)
Merging net-next/master (08cbc75f9602 ppp: Adjust indentation into ppp_asyn=
c_input)
Merging bpf-next/master (e7096c131e51 net: WireGuard secure network tunnel)
Merging ipsec-next/master (e7096c131e51 net: WireGuard secure network tunne=
l)
Merging mlx5-next/mlx5-next (e42617b825f8 Linux 5.5-rc1)
Merging netfilter-next/master (08cbc75f9602 ppp: Adjust indentation into pp=
p_async_input)
Merging nfc-next/master (1f008cfec5d5 NFC: fdp: Fix unused variable warning=
s)
CONFLICT (content): Merge conflict in drivers/nfc/st21nfca/se.c
Merging ipvs-next/master (d54725cd11a5 netfilter: nf_tables: support for mu=
ltiple devices per netdev hook)
Merging wireless-drivers-next/master (57725b5bc589 Merge ath-next from git:=
//git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git)
Merging bluetooth/master (4a63ef710cc3 Merge branch 'for-upstream' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next)
Merging mac80211-next/master (7a89233ac504 mac80211: Use Airtime-based Queu=
e Limits (AQL) on packet dequeue)
Merging gfs2/for-next (1ee366c67176 gfs2: Another gfs2_find_jhead fix)
Merging mtd/mtd/next (589e1b6c47ce Merge tag 'nand/for-5.5' into mtd/next)
Merging nand/nand/next (777260a5c992 mtd: rawnand: remove unecessary checki=
ng if dmac is NULL)
Merging spi-nor/spi-nor/next (e42617b825f8 Linux 5.5-rc1)
Merging crypto/master (4ee812f6143d crypto: vmx - Avoid weird build failure=
s)
Merging drm/drm-next (e42617b825f8 Linux 5.5-rc1)
Merging amdgpu/drm-next (7162c2f43914 drm/amdgpu/display: add fallthrough c=
omment)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/powerplay/renoir_=
ppt.c
Merging drm-intel/for-linux-next (3fa01d642fa7 drm/i915/tgl: Program BW_BUD=
DY registers during display init)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_reg.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_pmu.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gpu_error.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_active.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_timelin=
e.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_lrc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_gt_requ=
ests.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_engine_=
pm.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_context=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_fb=
c.c
Applying: lockdep: fix up for lock_release API change
Merging drm-tegra/drm/tegra/for-next (d66dfcf80d0f drm/tegra: Run hub clean=
up on ->remove())
Merging drm-misc/for-linux-next (0a5239985a3b drm/panfrost: Open/close the =
perfcnt BO)
Merging drm-msm/msm-next (e20c9284c8f2 drm/msm/adreno: Add support for Adre=
no 510 GPU)
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (4d24376370fb gpu: ipu-v3: image-convert: only=
 sample into the next tile if necessary)
Merging etnaviv/etnaviv/next (22567d017c2c dt-bindings: etnaviv: Add #cooli=
ng-cells)
Merging regmap/for-next (e42617b825f8 Linux 5.5-rc1)
Merging sound/for-next (88452da92ba2 ALSA: hda: Use standard waitqueue for =
RIRB wakeup)
Merging sound-asoc/for-next (df804ae32724 Merge branch 'asoc-5.6' into asoc=
-next)
Merging modules/modules-next (b6d0531ec7e2 moduleparam: fix kerneldoc)
Merging input/next (a284e11c371e Input: synaptics-rmi4 - don't increment rm=
iaddr for SMBus transfers)
Merging block/for-next (4c1d55417382 Merge branch 'for-linus' into for-next)
Merging device-mapper/for-next (7fc979f8204f docs: dm-integrity: remove ref=
erence to ARC4)
Merging pcmcia/pcmcia-next (bd9d6e0371d1 pcmcia: remove unused dprintk defi=
nition)
Merging mmc/next (cf2a5c41578a Merge branch 'fixes' into next)
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (edfaeaf742b4 Revert "mfd: syscon: Set name of reg=
map_config")
Merging backlight/for-backlight-next (102a1b382177 backlight: qcom-wled: Fi=
x spelling mistake "trigged" -> "triggered")
Merging battery/for-next (9480029fe5c2 power: supply: bd70528: Add MODULE_A=
LIAS to allow module auto loading)
Merging regulator/for-next (9c8b5f761f4e Merge branch 'regulator-5.6' into =
regulator-next)
Merging security/next-testing (45893a0abee6 kexec: Fix file verification on=
 S390)
Merging apparmor/apparmor-next (341c1fda5e17 apparmor: make it so work buff=
ers can be allocated from atomic context)
Merging integrity/next-integrity (2a7f0e53daf2 ima: ima_api: Use struct_siz=
e() in kzalloc())
Merging keys/keys-next (48274e1e5d24 Merge branch 'notifications-core' into=
 keys-next)
CONFLICT (content): Merge conflict in samples/Makefile
CONFLICT (content): Merge conflict in samples/Kconfig
CONFLICT (content): Merge conflict in include/uapi/asm-generic/unistd.h
CONFLICT (content): Merge conflict in include/linux/security.h
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
Merging selinux/next (d8db60cb23e4 selinux: ensure we cleanup the internal =
AVC counters on error in avc_insert())
CONFLICT (content): Merge conflict in include/linux/lsm_audit.h
Merging smack/for-next (92604e825304 smack: use GFP_NOFS while holding inod=
e_smack::smk_lock)
Merging tomoyo/master (c39593ab0500 tomoyo: Don't use nifty names on socket=
s.)
Merging tpmdd/next (0b40dbcbba92 KEYS: trusted: Remove set but not used var=
iable 'keyhndl')
Merging watchdog/master (33c26ab4d6be watchdog: jz4740: Drop dependency on =
MACH_JZ47xx)
Merging iommu/next (9b3a713feef8 Merge branches 'iommu/fixes', 'arm/qcom', =
'arm/renesas', 'arm/rockchip', 'arm/mediatek', 'arm/tegra', 'arm/smmu', 'x8=
6/amd', 'x86/vt-d', 'virtio' and 'core' into next)
Merging vfio/next (9917b54aded1 Merge branch 'v5.5/vfio/jiang-yi-irq-bypass=
-unregister-v1' into v5.5/vfio/next)
Merging audit/next (cb5172d96d16 audit: Add __rcu annotation to RCU pointer)
Merging devicetree/for-next (a8de1304b7df libfdt: define INT32_MAX and UINT=
32_MAX in libfdt_env.h)
Merging mailbox/mailbox-for-next (c6c6bc6ea9fc mailbox: imx: add support fo=
r imx v1 mu)
Merging spi/for-next (d661a226ebf2 Merge branch 'spi-5.6' into spi-next)
Merging tip/auto-latest (70a53448efd1 Merge branch 'WIP.core/headers')
Merging clockevents/timers/drivers/next (6e001f6a4cc7 clocksource/drivers/a=
sm9260: Add a check for of_clk_get)
Merging edac/edac-for-next (854bb48018d5 EDAC: skx_common: downgrade messag=
e importance on missing PCI device)
Merging irqchip/irq/irqchip-next (c6d732c8cc67 irqchip/aspeed-i2c-ic: Fix i=
rq domain name memory leak)
Merging ftrace/for-next (16c0f03f629a tracing: Enable syscall optimization =
for MIPS)
Merging rcu/rcu/next (e100e2f047de Merge commit '8dcdfb7096a304130ab36fbb0f=
2961deaf863e5a' into for-mingo)
Merging kvm/linux-next (7d73710d9ca2 kvm: vmx: Stop wasting a page for gues=
t_msrs)
Merging kvm-arm/next (97418e968b01 KVM: arm/arm64: Remove excessive permiss=
ion check in kvm_arch_prepare_memory_region)
Merging kvm-ppc/kvm-ppc-next (30486e72093e KVM: PPC: Book3S HV: XIVE: Fix p=
otential page leak on error path)
Merging kvms390/next (c7b7de631246 KVM: s390: Do not yield when target is a=
lready running)
Merging xen-tip/linux-next (14855954f636 xen-blkback: allow module to be cl=
eanly unloaded)
Merging percpu/for-next (50e76d59d426 Merge branch 'for-5.6' into for-next)
Merging workqueues/for-next (49e9d1a9faf2 workqueue: Add RCU annotation for=
 pwq list walk)
Merging drivers-x86/for-next (e42617b825f8 Linux 5.5-rc1)
Merging chrome-platform/for-next (a69b4eebe513 platform/chrome: cros_ec_lpc=
: Use platform_get_irq_optional() for optional IRQs)
Merging hsi/for-next (c1030cd45619 HSI: Remove dev_err() usage after platfo=
rm_get_irq())
Merging leds/for-next (5f820ed52371 leds: trigger: netdev: fix handling on =
interface rename)
Merging ipmi/for-next (8e6a5c833333 ipmi: fix ipmb_poll()'s return type)
Merging driver-core/driver-core-next (e42617b825f8 Linux 5.5-rc1)
Merging usb/usb-next (cad0a5c74e7a usb: host: xhci-tegra: Implement basic E=
LPG support)
Merging usb-gadget/next (726b4fba94be usb: dwc3: of-simple: add a shutdown)
Merging usb-serial/usb-next (e42617b825f8 Linux 5.5-rc1)
Merging usb-chipidea-next/ci-for-usb-next (4d6141288c33 usb: chipidea: imx:=
 pinctrl for HSIC is optional)
Merging phy-next/next (4569e64ab6a5 phy: phy-rockchip-inno-usb2: add phy de=
scription for px30)
Merging tty/tty-next (e42617b825f8 Linux 5.5-rc1)
Merging char-misc/char-misc-next (9455d25f4e3b Merge tag 'ntb-5.5' of git:/=
/github.com/jonmason/ntb)
Merging extcon/extcon-next (4b28b25c3062 extcon: arizona: Factor out microp=
hone and button detection)
Merging soundwire/next (e42617b825f8 Linux 5.5-rc1)
Merging thunderbolt/next (e42617b825f8 Linux 5.5-rc1)
Merging staging/staging-next (0988161a9828 staging: most: fix improper SPDX=
-License comment style)
Merging mux/for-next (05fb8284a417 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (1758204886c3 interconnect: Add interconnect_graph fil=
e to debugfs)
Merging slave-dma/next (dda510890498 dmaengine: Remove spaces before TABs)
Merging cgroup/for-next (899969b46c28 Merge branch 'for-5.5' into for-next)
Merging scsi/for-next (bef091d1f68b Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (6a8c827f854a Merge branch '5.5/scsi-fixes' into =
5.6/scsi-next)
Merging vhost/linux-next (08623fbe1136 vhost: last descriptor must have NEX=
T clear)
CONFLICT (content): Merge conflict in drivers/net/ethernet/ti/cpsw.c
Applying: netdev: fix up for "pass the stuck queue to the timeout handler"
Merging rpmsg/for-next (723710fe4bab Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (41c4616bb81f gpio: Add TODO item for regmap helper)
Merging gpio-brgl/gpio/for-next (e42617b825f8 Linux 5.5-rc1)
Merging gpio-intel/for-next (e42617b825f8 Linux 5.5-rc1)
Merging pinctrl/for-next (6d29032c2cef pinctrl: Fix warning by adding missi=
ng MODULE_LICENSE)
Merging pinctrl-intel/for-next (ab68b220e81f pinctrl: baytrail: Group GPIO =
IRQ chip initialization)
Merging pinctrl-samsung/for-next (e42617b825f8 Linux 5.5-rc1)
Merging pwm/for-next (bd88d319abe9 pwm: imx27: Unconditionally write state =
to hardware)
Merging userns/for-next (61a47c1ad3a4 sysctl: Remove the sysctl system call)
Merging ktest/for-next (9b5f852ae20d ktest: Make default build option oldco=
nfig not randconfig)
Merging random/dev (58be0106c530 random: fix soft lockup when trying to rea=
d from an uninitialized blocking pool)
Merging kselftest/next (e42617b825f8 Linux 5.5-rc1)
Merging y2038/y2038 (6d75353320b4 Merge tag 'y2038-cleanups-5.5' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/arnd/playground into y2038)
Merging livepatching/for-next (7f436b3066e3 Merge branch 'for-5.5/core' int=
o for-next)
Merging coresight/next (e42617b825f8 Linux 5.5-rc1)
Merging rtc/rtc-next (3b52093dc917 rtc: ds1343: Do not hardcode SPI mode fl=
ags)
Merging nvdimm/libnvdimm-for-next (0dfbb932bb67 MAINTAINERS: Remove Keith f=
rom NVDIMM maintainers)
Merging at24/at24/for-next (e42617b825f8 Linux 5.5-rc1)
Merging ntb/ntb-next (1ef512b16bc8 NTB: Fix an error in get link status)
Merging kspp/for-next/kspp (c593642c8be0 treewide: Use sizeof_field() macro)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (e42617b825f8 Linux 5.5-rc1)
Merging fsi/next (2c01397b71c5 fsi: aspeed: Fix OPB0 byte order register va=
lues)
Merging slimbus/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging nvmem/for-next (6bd17868c992 nvmem: add Rockchip OTP driver)
Merging xarray/xarray (6b81141deb73 XArray: Improve documentation of search=
 marks)
Merging hyperv/hyperv-next (7a1323b5dfe4 Drivers: hv: vmbus: Fix crash hand=
ler reset of Hyper-V synic)
Merging auxdisplay/auxdisplay (54ecb8f7028c Linux 5.4-rc1)
Merging kgdb/kgdb/for-next (c58ff643763c kdb: Tweak escape handling for vi =
users)
Merging pidfd/for-next (04882c321b26 Merge branch 'pidfd' into for-next)
Merging devfreq/devfreq-next (4290915b7f2d PM / devfreq: exynos-bus: Extrac=
t exynos_bus_profile_init_passive())
Merging hmm/hmm (e42617b825f8 Linux 5.5-rc1)
Merging fpga/for-next (fddc9fcbe69a fpga: dfl: fme: add power management su=
pport)
Merging kunit/test (e42617b825f8 Linux 5.5-rc1)
Merging cel/cel-next (a99d8080aaf3 Linux 5.4-rc6)
Merging kasan-bitops/topic/kasan-bitops (4f4afc2c9599 docs/core-api: Remove=
 possibly confusing sub-headings from Bit Operations)
Merging generic-ioremap/for-next (eafee5944062 nds32: use generic ioremap)
Merging akpm-current/current (14ada2d248f7 ipc/msg.c: consolidate all xxxct=
l_down() functions)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/block/null_blk_main.c: fix layout
Applying: drivers/block/null_blk_main.c: fix uninitialized var warnings
Applying: pinctrl: fix pxa2xx.c build warnings
Applying: drivers/tty/serial/sh-sci.c: suppress warning
Applying: drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer ove=
rflow
Merging akpm/master (0f2ba11dea7c drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/1jE1pFDr4RuGQ/sq8G3KVhE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3wV6EACgkQAVBC80lX
0GzAAwf/dKLS/xE7h4CB4CBbjzK6nsm3qfgnhL4p+l//cSx5CpGddvymHbDIEVXE
SxOVvgGwLtj4yK7ccOiwF4KTn+BPi/XN/Sczn6WqlXVVZX6gjluqsrPZXN4YNVwU
zO+ACzNXwYB0ZHI+KQmqTTJdnqd6bThaW5ZbXZMERao7yl+3Pj3UHAUfPqlfKVRg
dKbEQg23YP2jRa2AHFvnc/CXiagiTpMtXht06XrPUGfO+Ywn2GVBvVNUSHIZ0Y2z
x9fkRm1LeyCm5mLQCURXLBmYCKCnfCQxkZnGGuXKIX8YABV0zCvNNF7spC2G5cwW
DxIX7dKyJFIvijP+BCDb32ggLr6KyA==
=io0k
-----END PGP SIGNATURE-----

--Sig_/1jE1pFDr4RuGQ/sq8G3KVhE--
