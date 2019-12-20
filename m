Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46CDC1274E2
	for <lists+linux-next@lfdr.de>; Fri, 20 Dec 2019 06:06:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbfLTFGr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Dec 2019 00:06:47 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:57531 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725267AbfLTFGr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 20 Dec 2019 00:06:47 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47fGtl5RXcz9s4Y;
        Fri, 20 Dec 2019 16:06:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576818399;
        bh=Ano1a/NoFDfag6e5bol3apaSs2rnckpNKJ6i1Rmq02A=;
        h=Date:From:To:Cc:Subject:From;
        b=DRyzkzN94nVSE4I7IHBdu+OMUGaK4apYSkNSXUyDoajXheKKs2i26y1XVWNl6ZX7J
         P9r0x+eYzuMOS5wDKbTYiWMjwiwS/tF9CEjQ0I8oBKnQc/scluicW9CSVA4T2vL6uB
         cKW8VffyyA98CwCofAF7WTcD1dzC8C6477N2I/C2D1shOmIDK0g1bzIRtgdQIcoF97
         RdRTDShAPj0YjOFg7zzeQv98eNnFUY5jSh5haQdtxfh7TLd6Gozzix7b1lMHc+6r4s
         2H4DZg/+n7F6QoqUEFTCDygSjB6i/66ddKIoeOP0pf/ZhmVzJywSQZfNU0u/6oFjoZ
         M3cp473niDMIg==
Date:   Fri, 20 Dec 2019 16:06:39 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Dec 20
Message-ID: <20191220160639.3406a5de@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hSLRJpkv0B/BBb+8OC++swZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hSLRJpkv0B/BBb+8OC++swZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

News: There will be no linux-next releases until January 6 (unless I
get very bored :-)).

Changes since 20191219:

The thermal tree still had its build failure so I added a patch.

The net-next tree lost its build failure.

The bpf-next tree gained a conflict against the net tree.

The block tree gained a conflict against the vfs tree.

The battery tree lost its build failure.

The keys tree still had build failures so I used the version from
next-20191211.

The tip tree gained a conflict against Linus' tree.

The driver-core tree gained a conflict against the keys tree.

Non-merge commits (relative to Linus' tree): 4385
 4692 files changed, 183930 insertions(+), 100959 deletions(-)

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

I am currently merging 314 trees (counting Linus' and 78 trees of bug
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
Merging origin/master (7e0165b2f1a9 Merge branch 'akpm' (patches from Andre=
w))
Merging fixes/master (31f4f5b495a6 Linux 5.4-rc7)
Merging kbuild-current/fixes (8f268881d7d2 kconfig: remove ---help--- from =
documentation)
Merging arc-current/for-curr (833a20b8d492 ARC: asm-offsets: remove duplica=
te entry)
Merging arm-current/fixes (39f4d4410484 Merge branch 'misc' into fixes)
Merging arm-soc-fixes/arm/fixes (43522b78b590 Merge tag 'socfpga_dts_fix_fo=
r_v5.5' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux int=
o arm/fixes)
Merging arm64-fixes/for-next/fixes (e50be648aaa3 arm64: uaccess: Remove uac=
cess_*_not_uao asm macros)
Merging m68k-current/for-linus (5ed0794cde59 m68k/atari: Convert Falcon IDE=
 drivers to platform drivers)
Merging powerpc-fixes/fixes (228b607d8ea1 KVM: PPC: Book3S HV: Fix regressi=
on on big endian hosts)
Merging s390-fixes/fixes (b4adfe55915d s390/ftrace: save traced function ca=
ller)
Merging sparc/master (038029c03e21 sparc: remove unneeded uapi/asm/statfs.h)
Merging fscrypt-current/for-stable (ae64f9bd1d36 Linux 4.15-rc2)
Merging net/master (6fa9a115fe7c Merge branch 'stmmac-fixes')
Merging bpf/master (1148f9adbe71 net, sysctl: Fix compiler warning when onl=
y cBPF is present)
Merging ipsec/master (e42617b825f8 Linux 5.5-rc1)
Merging netfilter/master (ddd9b5e3e765 net-sysfs: Call dev_hold always in r=
x_queue_add_kobject)
Merging ipvs/master (c24b75e0f923 ipvs: move old_secure_tcp into struct net=
ns_ipvs)
Merging wireless-drivers/master (33328bfab892 MAINTAINERS: change Gruszka's=
 email address)
Merging mac80211/master (91f84e3ab1b5 mac80211: mesh: restrict airtime metr=
ic to peered established plinks)
Merging rdma-fixes/for-rc (dc2316eba73f IB/mlx5: Fix device memory flows)
Merging sound-current/for-linus (92adc96f8eec ALSA: usb-audio: set the inte=
rface format after resume on Dell WD19)
Merging sound-asoc-fixes/for-linus (38dd05a0cc23 Merge branch 'asoc-5.5' in=
to asoc-linus)
Merging regmap-fixes/for-linus (e42617b825f8 Linux 5.5-rc1)
Merging regulator-fixes/for-linus (6f25f67c4d23 Merge branch 'regulator-5.5=
' into regulator-linus)
Merging spi-fixes/for-linus (efa968a9b4fb Merge branch 'spi-5.5' into spi-l=
inus)
Merging pci-current/for-linus (ca01e7987463 PCI: rockchip: Fix IO outbound =
ATU register number)
Merging driver-core.current/driver-core-linus (d1eef1c61974 Linux 5.5-rc2)
Merging tty.current/tty-linus (cb47b9f8630a tty/serial: atmel: fix out of r=
ange clock divider handling)
Merging usb.current/usb-linus (6056a0f8ede2 usb: xhci: Fix build warning se=
en with CONFIG_PM=3Dn)
Merging usb-gadget-fixes/fixes (e5b5da96da50 usb: gadget: fix wrong endpoin=
t desc)
Merging usb-serial-fixes/usb-linus (0d3010fa4424 USB: serial: option: add T=
elit ME910G1 0x110a composition)
Merging usb-chipidea-fixes/ci-for-usb-stable (16009db47c51 usb: chipidea: u=
dc: workaround for endpoint conflict issue)
Merging phy/fixes (e42617b825f8 Linux 5.5-rc1)
Merging staging.current/staging-linus (c05c403b1d12 staging: wfx: fix wrong=
 error message)
Merging char-misc.current/char-misc-linus (4aa37c463764 random: don't forge=
t compat_ioctl on urandom)
Merging soundwire-fixes/fixes (e42617b825f8 Linux 5.5-rc1)
Merging thunderbolt-fixes/fixes (d1eef1c61974 Linux 5.5-rc2)
Merging input-current/for-linus (1021dcf19db1 Input: imx_sc_key - only take=
 the valid data from SCU firmware as key state)
Merging crypto-current/master (84faa307249b crypto: arm/curve25519 - add ar=
ch-specific key generation function)
Merging ide/master (baf6722aa0cb ide: Use dev_get_drvdata where possible)
Merging vfio-fixes/for-linus (95f89e090618 vfio/type1: Initialize resv_msi_=
base)
Merging kselftest-fixes/fixes (65c5ca4410bf selftests: livepatch: Fix it to=
 do root uid check and skip)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging slave-dma-fixes/fixes (a40c94be2336 dmaengine: dma-jz4780: Also bre=
ak descriptor chains on JZ4725B)
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (df8fed831cbc mtd: rawnand: au1550nd: Fix au_re=
ad_buf16() prototype)
Merging mfd-fixes/for-mfd-fixes (603d9299da32 mfd: mt6397: Fix probe after =
changing mt6397-core)
Merging v4l-dvb-fixes/fixes (e5a52a1d15c7 media: pulse8-cec: fix lost cec_t=
ransmit_attempt_done() call)
Merging reset-fixes/reset/fixes (db23808615e2 reset: Do not register resour=
ce data for missing resets)
Merging mips-fixes/mips-fixes (f596cf0d8062 MIPS: BPF: eBPF JIT: check for =
MIPS ISA compliance in Kconfig)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (03729cfa0d54 soc: ti: wkup_m3_ipc: Fix race condi=
tion with rproc_boot)
Merging kvm-fixes/master (2f13437b8917 Merge tag 'trace-v5.5-2' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging kvms390-fixes/master (fe33a928bfcd KVM: s390: ENOTSUPP -> EOPNOTSUP=
P fixups)
Merging hwmon-fixes/hwmon (20358214d96b hwmon: (adt7475) Make volt2reg retu=
rn same reg as reg2volt input)
Merging nvdimm-fixes/libnvdimm-fixes (c14685547762 tools/testing/nvdimm: Fi=
x mock support for ioremap)
Merging btrfs-fixes/next-fixes (bfbbf8cb43a7 Merge branch 'misc-5.4' into n=
ext-fixes)
Merging vfs-fixes/fixes (1edc8eb2e931 fs: call fsnotify_sb_delete after evi=
ct_inodes)
Merging dma-mapping-fixes/for-linus (9c24eaf81cc4 iommu/vt-d: Return the co=
rrect dma mask when we are bypassing the IOMMU)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (e42617b825f8 Linux 5.5-rc1)
Merging samsung-krzk-fixes/fixes (a2315d3aea59 ARM: exynos_defconfig: Resto=
re debugfs support)
Merging pinctrl-samsung-fixes/pinctrl-fixes (e42617b825f8 Linux 5.5-rc1)
Merging devicetree-fixes/dt/linus (dbce0b65046d dt-bindings: Add missing 'p=
roperties' keyword enclosing 'snps,tso')
Merging scsi-fixes/fixes (bba340c79bfe scsi: iscsi: Avoid potential deadloc=
k in iscsi_if_rx func)
Merging drm-fixes/drm-fixes (d1eef1c61974 Linux 5.5-rc2)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (78d75f5739c4 Merge tag 'gvt-f=
ixes-2019-12-18' of https://github.com/intel/gvt-linux into drm-intel-fixes)
Merging mmc-fixes/fixes (f667216c5c7c mmc: sdhci-of-esdhc: re-implement err=
atum A-009204 workaround)
Merging rtc-fixes/rtc-fixes (653997eeecef rtc: mt6397: fix alarm register o=
verwrite)
Merging gnss-fixes/gnss-linus (d1eef1c61974 Linux 5.5-rc2)
Merging hyperv-fixes/hyperv-fixes (af42d3466bdc Linux 5.4-rc8)
Merging soc-fsl-fixes/fix (5674a92ca4b7 soc/fsl/qe: Fix an error code in qe=
_pin_request())
Merging risc-v-fixes/fixes (13bb95ae2000 riscv: Fix use of undefined config=
 option CONFIG_CONFIG_MMU)
Merging pidfd-fixes/fixes (0b8d616fb5a8 taskstats: fix data-race)
Merging fpga-fixes/fixes (dec43da46f63 fpga: altera-ps-spi: Fix getting of =
optional confd gpio)
Merging spdx/spdx-linus (2f13437b8917 Merge tag 'trace-v5.5-2' of git://git=
.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging gpio-intel-fixes/fixes (e42617b825f8 Linux 5.5-rc1)
Merging pinctrl-intel-fixes/fixes (b9a19bdbc843 pinctrl: cherryview: Pass i=
rqchip when adding gpiochip)
Merging erofs-fixes/fixes (d1eef1c61974 Linux 5.5-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (57177d214ee0 drm/sun4i: hdmi: =
Remove duplicate cleanup calls)
Merging kspp-gustavo/for-next/kspp (3d519d6d388b sh: kgdb: Mark expected sw=
itch fall-throughs)
Merging kbuild/for-next (6bfce12999f5 kconfig: fix nesting of symbol help t=
ext)
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
Merging arm-soc/for-next (bf8e91955276 Merge branch 'arm/fixes' into for-ne=
xt)
Merging amlogic/for-next (714767cd9071 Merge branch 'v5.6/defconfig' into t=
mp/aml-rebuild)
Merging aspeed/for-next (2aee80727dca Merge branch 'defconfig-for-v5.5' int=
o for-next)
CONFLICT (content): Merge conflict in arch/arm/configs/multi_v7_defconfig
Merging at91/at91-next (a56d3a8ceac3 Merge branches 'at91-soc' and 'at91-dt=
' into at91-next)
Merging bcm2835/for-next (f14234184671 Merge branch 'bcm2835-maintainers-ne=
xt' into for-next)
Merging imx-mxs/for-next (459ee837b230 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (2af8e1f26c65 Merge branch 'for_5.5/driver-soc' into =
next)
Merging mediatek/for-next (ca01a6367d0f Merge branch 'v5.5-next/soc' into f=
or-next)
Merging mvebu/for-next (cd592187f9de arm64: dts: uDPU: SFP cages support 3W=
 modules)
Merging omap/for-next (63eb53c0826f Merge branch 'fixes' into for-next)
Merging qcom/for-next (cd6443eb2a27 Merge branches 'arm64-for-5.5-fixes', '=
drivers-for-5.5-fixes', 'arm64-defconfig-for-5.6', 'arm64-for-5.6', 'defcon=
fig-for-5.6', 'drivers-for-5.6' and 'dts-for-5.6' into for-next)
Merging realtek/for-next (6a41c7019bca Merge branch 'v5.5/dt64' into next)
Merging renesas/next (4730830f9c2e Merge branches 'renesas-arm-defconfig-fo=
r-v5.6', 'renesas-arm64-dt-for-v5.6' and 'renesas-drivers-for-v5.6' into re=
nesas-next)
Merging reset/reset/next (dc4491c457b9 reset: uniphier: Add SCSSI reset con=
trol for each channel)
Merging rockchip/for-next (3ce659c9cf8f Merge branch 'v5.6-armsoc/dts64' in=
to for-next)
Merging samsung-krzk/for-next (ed21b314fb85 Merge branch 'next/dt' into for=
-next)
Merging scmi/for-linux-next (d1eef1c61974 Linux 5.5-rc2)
Merging sunxi/sunxi/for-next (3ba34a3cb3ca Merge branch 'sunxi/clk-fixes-fo=
r-5.5' into sunxi/for-next)
Merging tegra/for-next (e0fd54137bf5 Merge branch for-5.5/cpufreq into for-=
next)
Merging clk/clk-next (f7f1ed4fd89a Merge branch 'clk-fixes' into clk-next)
Merging clk-samsung/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (044cf5e15357 csky: Initial stack protector support)
Merging h8300/h8300-next (a5de8865cb3e h8300: move definition of __kernel_s=
ize_t etc. to posix_types.h)
Merging ia64/next (240b62d381fe ia64: remove stale paravirt leftovers)
Merging m68k/for-next (5ed0794cde59 m68k/atari: Convert Falcon IDE drivers =
to platform drivers)
Merging m68knommu/for-next (d1eef1c61974 Linux 5.5-rc2)
Merging microblaze/next (22648c989cb8 microblaze: Increase max dtb size to =
64K from 32K)
Merging mips/mips-next (a8d0f11ee50d MIPS: SGI-IP27: Enable ethernet phy on=
 second Origin 200 module)
Merging nds32/next (a7f96fce201c MAINTAINERS: add nds32 maintainer)
Merging nios2/for-next (e32ea127d81c nios2: Fix ioremap)
Merging openrisc/for-next (0ecdcaa6d5e7 openrisc: Fix Kconfig indentation)
Merging parisc-hd/for-next (aeea5eae4fd5 parisc: add missing __init annotat=
ion)
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
Merging s390/features (d1eef1c61974 Linux 5.5-rc2)
Merging sh/sh-next (a193018e5290 sh: add missing EXPORT_SYMBOL() for __dela=
y)
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
Merging btrfs/for-next (451942d4ded8 Merge branch 'for-next-next-v5.5-20191=
216' into for-next-20191216)
Merging ceph/master (da08e1e1d7c3 ceph: add more debug info when decoding m=
dsmap)
Merging cifs/for-next (d1eef1c61974 Linux 5.5-rc2)
Merging configfs/for-next (e2f238f7d5a1 configfs: calculate the depth of pa=
rent item)
Merging ecryptfs/next (b4a81b87a4cf ecryptfs: fix a memory leak bug in ecry=
ptfs_init_messaging())
Merging erofs/dev (d1eef1c61974 Linux 5.5-rc2)
Merging ext3/for_next (4d5c1adaf893 reiserfs: Fix spurious unlock in reiser=
fs_fill_super() error handling)
Merging ext4/dev (d82d47d5d8a6 jbd2: fix kernel-doc notation warning)
Merging f2fs/dev (447c5bb5ce14 f2fs: cover f2fs_lock_op in expand_inode_dat=
a case)
Merging fsverity/fsverity (73f0ec02d670 docs: fs-verity: mention statx() su=
pport)
Merging fuse/for-next (8d66fcb74884 fuse: fix Kconfig indentation)
Merging jfs/jfs-next (a5fdd713d256 jfs: fix bogus variable self-initializat=
ion)
Merging nfs/linux-next (d1eef1c61974 Linux 5.5-rc2)
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
Merging v9fs/9p-next (79fb9216b7be 9p: Remove unneeded semicolon)
Merging xfs/for-next (13eaec4b2adf xfs: don't commit sunit/swidth updates t=
o disk if that would cause repair failures)
Merging iomap/iomap-for-next (c275779ff2dd iomap: stop using ioend after it=
's been freed in iomap_finish_ioend())
Merging djw-vfs/vfs-for-next (3253d9d09337 splice: only read in as much inf=
ormation as there is pipe buffer space)
Merging file-locks/locks-next (b41dae061bbd Merge tag 'xfs-5.4-merge-7' of =
git://git.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging vfs/for-next (912dfe068c43 Merge branches 'work.openat2', 'work.rec=
ursive_removal' and 'imm.timestamp' into for-next)
Merging printk/for-next (20aaa2d8e1f3 Merge branch 'for-5.5-pr-warning-remo=
val' into for-next)
Merging pci/next (cb224132f23e Merge branch 'remotes/lorenzo/pci/dwc')
Merging pstore/for-next/pstore (8d82cee2f8aa pstore: Make pstore_choose_com=
pression() static)
Merging hid/for-next (62216a51293d Merge branch 'for-5.5/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (15c0677162b7 dt-bindings: i2c: sh_mobile: Documen=
t r8a77961 support)
Merging i3c/i3c/next (608b68b67a30 MAINTAINERS: fix style in CADENCE I3C MA=
STER IP entry)
Merging dmi/master (2429c99fa13a firmware: dmi: Add dmi_memdev_handle)
Merging hwmon-staging/hwmon-next (848a25f01ee7 hwmon: (w83627ehf) make sens=
or_dev_attr_##_name variables static)
Merging jc_docs/docs-next (c1ccff45e54e docs/memory-barriers.txt.kokr: Mino=
r wordsmith)
Merging v4l-dvb/master (0885acd77eb4 media: vivid: support multiplanar touc=
h devices)
CONFLICT (content): Merge conflict in drivers/media/usb/pulse8-cec/pulse8-c=
ec.c
Merging v4l-dvb-next/master (d45331b00ddb Linux 5.3-rc4)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (5fb4c90b7da9 Merge branch 'powercap' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (d4a386f59527 cpufreq: tegra186:=
 convert to devm_platform_ioremap_resource)
Merging cpupower/cpupower (e42617b825f8 Linux 5.5-rc1)
Merging opp/opp/linux-next (03758d60265c opp: Replace list_kref with a loca=
l counter)
Merging thermal/thermal/linux-next (3d9613284a62 thermal: qoriq: Add hwmon =
support)
Applying: thermal: qoriq: using SZ_4K requires linux/sizes.h
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
Merging net-next/master (d8e419da048e Merge branch 'phylib-consolidation')
CONFLICT (content): Merge conflict in drivers/net/phy/phylink.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/amazon/ena/ena_n=
etdev.c
Merging bpf-next/master (5bf2fc1f9c88 bpf: Remove unnecessary assertion on =
fp_old)
CONFLICT (content): Merge conflict in net/bpf/test_run.c
CONFLICT (content): Merge conflict in arch/riscv/net/bpf_jit_comp.c
Merging ipsec-next/master (e27cca96cd68 xfrm: add espintcp (RFC 8229))
CONFLICT (content): Merge conflict in net/unix/af_unix.c
Merging mlx5-next/mlx5-next (e42617b825f8 Linux 5.5-rc1)
Merging netfilter-next/master (13d74c0a9708 netfilter: conntrack: remove tw=
o export symbols)
Merging nfc-next/master (1f008cfec5d5 NFC: fdp: Fix unused variable warning=
s)
CONFLICT (content): Merge conflict in drivers/nfc/st21nfca/se.c
Merging ipvs-next/master (d54725cd11a5 netfilter: nf_tables: support for mu=
ltiple devices per netdev hook)
Merging wireless-drivers-next/master (ae0a723c4cfd Merge ath-next from git:=
//git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git)
Merging bluetooth/master (d44f00b40c03 Bluetooth: hci_qca: Replace of_devic=
e_get_match_data with device_get_match_data)
Merging mac80211-next/master (1ee7826ab68f mac80211: Remove redundant asser=
tion)
Merging gfs2/for-next (76223fa75828 gfs2: Another gfs2_find_jhead fix)
Merging mtd/mtd/next (589e1b6c47ce Merge tag 'nand/for-5.5' into mtd/next)
Merging nand/nand/next (777260a5c992 mtd: rawnand: remove unecessary checki=
ng if dmac is NULL)
Merging spi-nor/spi-nor/next (d1eef1c61974 Linux 5.5-rc2)
Merging crypto/master (d9e1670b8005 crypto: hmac - Use init_tfm/exit_tfm in=
terface)
Merging drm/drm-next (5f773e551a3b drm/amdgpu/display: use msleep rather th=
an udelay for HDCP)
Merging amdgpu/drm-next (e1704989a1b9 drm/amdgpu/display: use msleep rather=
 than udelay for HDCP)
Merging drm-intel/for-linux-next (7d1ff0d9faf6 drm/i915/gt: Add breadcrumb =
retire to physical engine)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_lrc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_fb=
c.c
Merging drm-tegra/drm/tegra/for-next (d66dfcf80d0f drm/tegra: Run hub clean=
up on ->remove())
Merging drm-misc/for-linux-next (93ccfa9a4eca drm/todo: Updating logging to=
do)
Merging drm-msm/msm-next (e20c9284c8f2 drm/msm/adreno: Add support for Adre=
no 510 GPU)
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (4d24376370fb gpu: ipu-v3: image-convert: only=
 sample into the next tile if necessary)
Merging etnaviv/etnaviv/next (22567d017c2c dt-bindings: etnaviv: Add #cooli=
ng-cells)
Merging regmap/for-next (e42617b825f8 Linux 5.5-rc1)
Merging sound/for-next (a032ff0e8065 Merge branch 'for-linus' into for-next)
Merging sound-asoc/for-next (ed0c3910299d Merge branch 'asoc-5.6' into asoc=
-next)
Merging modules/modules-next (ce2b617ce8cb export.h: reduce __ksymtab_strin=
gs string duplication by using "MS" section flags)
Merging input/next (fd7bba685e7d Input: apbps2 - add __iomem to register st=
ruct)
Merging block/for-next (eb1cc93eb2c5 Merge branch 'for-5.6/block' into for-=
next)
CONFLICT (content): Merge conflict in fs/open.c
Applying: io_uring: fix up for "open: introduce openat2(2) syscall"
Merging device-mapper/for-next (7fc979f8204f docs: dm-integrity: remove ref=
erence to ARC4)
Merging pcmcia/pcmcia-next (71705c611263 PCMCIA/i82092: remove #if 0 block)
Merging mmc/next (9f606f11ea98 Merge branch 'fixes' into next)
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (ea9a89ca3b95 mfd: dln2: More sanity checking for =
endpoints)
Merging backlight/for-backlight-next (102a1b382177 backlight: qcom-wled: Fi=
x spelling mistake "trigged" -> "triggered")
Merging battery/for-next (921377c0b4e8 power: supply: abx500_chargalg: Remo=
ve unneeded semicolon)
Merging regulator/for-next (3917d361271f Merge branch 'regulator-5.6' into =
regulator-next)
Merging security/next-testing (45893a0abee6 kexec: Fix file verification on=
 S390)
Merging apparmor/apparmor-next (341c1fda5e17 apparmor: make it so work buff=
ers can be allocated from atomic context)
Merging integrity/next-integrity (2a7f0e53daf2 ima: ima_api: Use struct_siz=
e() in kzalloc())
Merging keys/keys-next (a2337251cb6b Merge branch 'keys-acl' into keys-next)
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
$ git reset --hard HEAD^
Merging next-20191211 version of keys
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
[master af708cff030b] next-20191211/keys
Merging selinux/next (5c108d4e18f8 selinux: randomize layout of key structu=
res)
CONFLICT (content): Merge conflict in include/linux/lsm_audit.h
Merging smack/for-next (92604e825304 smack: use GFP_NOFS while holding inod=
e_smack::smk_lock)
Merging tomoyo/master (6bd5ce6089b5 tomoyo: Suppress RCU warning at list_fo=
r_each_entry_rcu().)
Merging tpmdd/next (1760eb689ed6 tpm/tpm_ftpm_tee: add shutdown call back)
Merging watchdog/master (d1eef1c61974 Linux 5.5-rc2)
Merging iommu/next (cde9319e884e iommu/vt-d: Allocate reserved region for I=
SA with correct permission)
Merging vfio/next (9917b54aded1 Merge branch 'v5.5/vfio/jiang-yi-irq-bypass=
-unregister-v1' into v5.5/vfio/next)
Merging audit/next (cb5172d96d16 audit: Add __rcu annotation to RCU pointer)
Merging devicetree/for-next (fe96df93f86c dt-bindings: ata: Convert Allwinn=
er AHCI controller to a schema)
Merging mailbox/mailbox-for-next (c6c6bc6ea9fc mailbox: imx: add support fo=
r imx v1 mu)
Merging spi/for-next (20360817c6f0 Merge branch 'spi-5.6' into spi-next)
Merging tip/auto-latest (ec7b10f2d023 Merge branch 'x86/cleanups')
CONFLICT (content): Merge conflict in lib/Kconfig.debug
Merging clockevents/timers/drivers/next (6e001f6a4cc7 clocksource/drivers/a=
sm9260: Add a check for of_clk_get)
Merging edac/edac-for-next (a651c6c64431 EDAC/aspeed: Remove unneeded semic=
olon)
Merging irqchip/irq/irqchip-next (c6d732c8cc67 irqchip/aspeed-i2c-ic: Fix i=
rq domain name memory leak)
Merging ftrace/for-next (ff205766dbbe ftrace: Fix function_graph tracer int=
eraction with BPF trampoline)
Merging rcu/rcu/next (de73daec335f rcutorture: Make kvm-find-errors.sh abor=
t on bad directory)
CONFLICT (content): Merge conflict in lib/Kconfig.debug
CONFLICT (content): Merge conflict in kernel/kcsan/encoding.h
CONFLICT (content): Merge conflict in kernel/kcsan/core.c
Applying: rcu: fix up for "Remove rcu_swap_protected()"
Merging kvm/linux-next (7d73710d9ca2 kvm: vmx: Stop wasting a page for gues=
t_msrs)
Merging kvm-arm/next (96e1968f8206 KVM: arm/arm64: vgic-its: Fix restoratio=
n of unmapped collections)
Merging kvm-ppc/kvm-ppc-next (30486e72093e KVM: PPC: Book3S HV: XIVE: Fix p=
otential page leak on error path)
Merging kvms390/next (c7b7de631246 KVM: s390: Do not yield when target is a=
lready running)
Merging xen-tip/linux-next (c673ec61ade8 xen/balloon: fix ballooned page ac=
counting without hotplug enabled)
Merging percpu/for-next (06557cf18eae Merge branch 'for-5.6' into for-next)
Merging workqueues/for-next (49e9d1a9faf2 workqueue: Add RCU annotation for=
 pwq list walk)
Merging drivers-x86/for-next (e42617b825f8 Linux 5.5-rc1)
Merging chrome-platform/for-next (737d6777b231 cros_ec: treewide: Remove 'i=
nclude/linux/mfd/cros_ec.h')
Merging hsi/for-next (c1030cd45619 HSI: Remove dev_err() usage after platfo=
rm_get_irq())
Merging leds/for-next (5f820ed52371 leds: trigger: netdev: fix handling on =
interface rename)
Merging ipmi/for-next (380665becdee drivers: ipmi: Modify max length of IPM=
B packet)
Merging driver-core/driver-core-next (4c002c978b7f device.h: move 'struct d=
river' stuff out to device/driver.h)
CONFLICT (content): Merge conflict in include/linux/device.h
Merging usb/usb-next (ea81896dc98f thunderbolt: Update documentation with t=
he USB4 information)
Merging usb-gadget/next (726b4fba94be usb: dwc3: of-simple: add a shutdown)
Merging usb-serial/usb-next (d1eef1c61974 Linux 5.5-rc2)
Merging usb-chipidea-next/ci-for-usb-next (4d6141288c33 usb: chipidea: imx:=
 pinctrl for HSIC is optional)
Merging phy-next/next (e42617b825f8 Linux 5.5-rc1)
Merging tty/tty-next (293f89959483 tty: serial: 21285: stop using the unuse=
d[] variable from struct uart_port)
Merging char-misc/char-misc-next (d1eef1c61974 Linux 5.5-rc2)
Merging extcon/extcon-next (2ddf50a75dab extcon: sm5502: Remove unneeded se=
micolon)
Merging soundwire/next (09f6a72d0143 soundwire: intel: add clock stop quirk=
s)
Merging thunderbolt/next (d1eef1c61974 Linux 5.5-rc2)
Merging staging/staging-next (6db45b06611c staging: wfx: update TODO)
Merging mux/for-next (05fb8284a417 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (1a0013c62b33 interconnect: Add interconnect_graph fil=
e to debugfs)
Merging slave-dma/next (ed5a0ab41555 dmaengine: fsl-edma: Add eDMA support =
for QorIQ LS1028A platform)
Merging cgroup/for-next (899969b46c28 Merge branch 'for-5.5' into for-next)
Merging scsi/for-next (67a358329376 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (a657d39c16b3 Merge branch '5.5/scsi-fixes' into =
5.6/scsi-next)
Merging vhost/linux-next (70e269172e04 ptr_ring: linked list fallback)
Merging rpmsg/for-next (5c615938c840 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (06c4fc5eda6b Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (373894f83b52 gpio: remove unneeded MODULE_=
VERSION() usage)
Merging gpio-intel/for-next (e42617b825f8 Linux 5.5-rc1)
Merging pinctrl/for-next (de253bf8bf8f Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (3a67fe38e76a pinctrl: lynxpoint: Update sum=
mary in the driver)
Merging pinctrl-samsung/for-next (225a2ec19aac pinctrl: samsung: Fix missin=
g OF and GPIOLIB dependency on S3C24xx and S3C64xx)
Merging pwm/for-next (bd88d319abe9 pwm: imx27: Unconditionally write state =
to hardware)
Merging userns/for-next (61a47c1ad3a4 sysctl: Remove the sysctl system call)
Merging ktest/for-next (9b5f852ae20d ktest: Make default build option oldco=
nfig not randconfig)
Merging random/dev (58be0106c530 random: fix soft lockup when trying to rea=
d from an uninitialized blocking pool)
Merging kselftest/next (d1eef1c61974 Linux 5.5-rc2)
Merging y2038/y2038 (5ea0f410a68f Merge tags 'block-ioctl-cleanup-5.6' and =
'y2038-drivers-for-v5.6-signed' of git://git.kernel.org:/pub/scm/linux/kern=
el/git/arnd/playground into y2038-for-v5.6)
CONFLICT (content): Merge conflict in Documentation/core-api/index.rst
Merging livepatching/for-next (7f436b3066e3 Merge branch 'for-5.5/core' int=
o for-next)
Merging coresight/next (ad9882f15884 coresight: etm4x: Fix unused function =
warning)
Merging rtc/rtc-next (28b8958c0bf6 rtc: rv3029: drop deprecated compatbiles)
Merging nvdimm/libnvdimm-for-next (0dfbb932bb67 MAINTAINERS: Remove Keith f=
rom NVDIMM maintainers)
Merging at24/at24/for-next (e42617b825f8 Linux 5.5-rc1)
Merging ntb/ntb-next (1ef512b16bc8 NTB: Fix an error in get link status)
Merging kspp/for-next/kspp (c593642c8be0 treewide: Use sizeof_field() macro)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (d1eef1c61974 Linux 5.5-rc2)
Merging fsi/next (2c01397b71c5 fsi: aspeed: Fix OPB0 byte order register va=
lues)
Merging slimbus/for-next (8f35288566d7 slimbus: qcom-ngd-ctrl: Use dma_requ=
est_chan() instead dma_request_slave_channel())
Merging nvmem/for-next (808c8bcca225 nvmem: imx: scu: correct the fuse word=
 index)
Merging xarray/xarray (6b81141deb73 XArray: Improve documentation of search=
 marks)
Merging hyperv/hyperv-next (7a1323b5dfe4 Drivers: hv: vmbus: Fix crash hand=
ler reset of Hyper-V synic)
Merging auxdisplay/auxdisplay (54ecb8f7028c Linux 5.4-rc1)
Merging kgdb/kgdb/for-next (c58ff643763c kdb: Tweak escape handling for vi =
users)
Merging pidfd/for-next (04882c321b26 Merge branch 'pidfd' into for-next)
Merging devfreq/devfreq-next (8ab517d50a70 PM / devfreq: imx8m-ddrc: Remove=
 unused defines)
Merging hmm/hmm (e42617b825f8 Linux 5.5-rc1)
Merging fpga/for-next (fddc9fcbe69a fpga: dfl: fme: add power management su=
pport)
Merging kunit/test (e42617b825f8 Linux 5.5-rc1)
Merging cel/cel-next (a99d8080aaf3 Linux 5.4-rc6)
Merging kasan-bitops/topic/kasan-bitops (4f4afc2c9599 docs/core-api: Remove=
 possibly confusing sub-headings from Bit Operations)
Merging generic-ioremap/for-next (1188dd7d3fbd remove ioremap_nocache and d=
evm_ioremap_nocache)
CONFLICT (content): Merge conflict in tools/testing/nvdimm/Kbuild
Applying: generic_ioremap: merge fix for "tools/testing/nvdimm: Fix mock su=
pport for ioremap"
Merging kunit-next/kunit (d1eef1c61974 Linux 5.5-rc2)
Merging akpm-current/current (461e28fa2c11 ipc/msg.c: consolidate all xxxct=
l_down() functions)
CONFLICT (content): Merge conflict in arch/hexagon/include/asm/io.h
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/block/null_blk_main.c: fix layout
Applying: drivers/block/null_blk_main.c: fix uninitialized var warnings
Applying: pinctrl: fix pxa2xx.c build warnings
Applying: mm: remove __krealloc
Applying: drivers/tty/serial/sh-sci.c: suppress warning
Applying: drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer ove=
rflow
Merging akpm/master (46ce41faa111 drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/hSLRJpkv0B/BBb+8OC++swZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl38Vt8ACgkQAVBC80lX
0GzwDQf8DO6n9+uBwV0wOVygJW5+noms18W0nfF3yLYy0NNZCzu9BO+MBUUVVw84
zdlQRz/+DFZqt26ofYnz4PC52ayP7MorNdZVtixjCTkiGi2uEub1S+5yJq6NbxwS
NENCp/pnl7WNx9DiwTb3Rj8YbC0qwEhGAvWyhtpYxfL44P5C9cNaiZfJ4X/Ehc4h
UmMyIeyw9/xNm+7BNBV3/jKRypZEE/NZSLRNeFjD982e/PYxGyqvb7YMigakKqGW
uZfpO063A+GUvuHtu7EqxpncIr4JT6Jct1aa5ufEAI1slZmWtnKc/cc/SSJWoze5
S/czee7P6sVESIB8XniVn3I4O9afaw==
=BBXH
-----END PGP SIGNATURE-----

--Sig_/hSLRJpkv0B/BBb+8OC++swZ--
