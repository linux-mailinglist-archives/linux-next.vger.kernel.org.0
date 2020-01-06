Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D861130D88
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2020 07:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbgAFG1Z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jan 2020 01:27:25 -0500
Received: from ozlabs.org ([203.11.71.1]:54853 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726338AbgAFG1Z (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Jan 2020 01:27:25 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47rlsz5NfDz9sNH;
        Mon,  6 Jan 2020 17:27:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578292039;
        bh=mrrhauWBIHNWM2U/zrfRcyf4DkysUcuokAgkDFkPt30=;
        h=Date:From:To:Cc:Subject:From;
        b=AexOXP+x4CCwJqYusdp/ngmUFXIEEjjGr8hK42w49S9fmIsd09jdvYQ0UAph4iFUI
         lDwJIdCS0LM23ytjXuVpjeT2tP1A7d9nZuQ83ftQGyAr4Fjf6sFw7oXvqyyHsW+6SK
         PUr4bKFVHsbFx2YnwIA7Y1PonG0uP3h8KbMtSK6lcAb9CHu1P6xsZVQtGiL0TLi5PY
         p1aGKvVUbdjTCUMtZWfRgznqnXyPLjNrHapfbDK2ptNE+CLf3s6SXBPNU8seLFrhbO
         Wp3ZdEgZCUofNnEljrCFe+ME80MaKOWXItI0QLEd2cr8ngQG+gUh6P7pHxexwA3a2p
         KR/wAVUcKz4/Q==
Date:   Mon, 6 Jan 2020 17:27:19 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jan 6
Message-ID: <20200106172719.4751318f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e6lUUUodEwTvVbPh9/vPko1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/e6lUUUodEwTvVbPh9/vPko1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20191220:

The csky tree gained a conflict against Linus' tree.

The risc-v tree gained a conflict against Linus' tree.

The thermal tree lost its build failure.

The keys tree still had build failures so I used the version from
next-20191211.

The tip tree gained a conflict against Linus' tree.

The leds tree gained a build failure so I used the version from
next-20191220.

The y2038 tree gained a conflict against the vhost tree.

The kspp tree gained a conflict against Linus' tree.

The akpm-current tree gained a build failure for which I applied a patch.

Non-merge commits (relative to Linus' tree): 5559
 5958 files changed, 254378 insertions(+), 128951 deletions(-)

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
Merging origin/master (768fc661d125 Merge tag 'riscv/for-v5.5-rc5' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging fixes/master (31f4f5b495a6 Linux 5.4-rc7)
Merging kbuild-current/fixes (3a562aee727a Merge tag 'for-5.5-rc4-tag' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux)
Merging arc-current/for-curr (7ecc6c1d5c8d ARC: pt_regs: remove hardcoded r=
egisters offset)
Merging arm-current/fixes (39f4d4410484 Merge branch 'misc' into fixes)
Merging arm-soc-fixes/arm/fixes (43522b78b590 Merge tag 'socfpga_dts_fix_fo=
r_v5.5' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux int=
o arm/fixes)
Merging arm64-fixes/for-next/fixes (aa638cfe3e73 arm64: cpu_errata: Add His=
ilicon TSV110 to spectre-v2 safe list)
Merging m68k-current/for-linus (5ed0794cde59 m68k/atari: Convert Falcon IDE=
 drivers to platform drivers)
Merging powerpc-fixes/fixes (6da3eced8c5f powerpc/spinlocks: Include correc=
t header for static key)
Merging s390-fixes/fixes (b4adfe55915d s390/ftrace: save traced function ca=
ller)
Merging sparc/master (038029c03e21 sparc: remove unneeded uapi/asm/statfs.h)
Merging fscrypt-current/for-stable (ae64f9bd1d36 Linux 4.15-rc2)
Merging net/master (b54ef37b1ce8 net: Google gve: Remove dma_wmb() before r=
inging doorbell)
Merging bpf/master (3c2f450e553c Merge git://git.kernel.org/pub/scm/linux/k=
ernel/git/bpf/bpf)
Merging ipsec/master (738d2902773e Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/netdev/net)
Merging netfilter/master (5acab91458ce netfilter: nf_tables: unbind callbac=
ks from flowtable destroy path)
Merging ipvs/master (c24b75e0f923 ipvs: move old_secure_tcp into struct net=
ns_ipvs)
Merging wireless-drivers/master (33328bfab892 MAINTAINERS: change Gruszka's=
 email address)
Merging mac80211/master (02a614499600 mac80211: mesh: restrict airtime metr=
ic to peered established plinks)
Merging rdma-fixes/for-rc (fd6988496e79 Linux 5.5-rc4)
Merging sound-current/for-linus (51d4efab7865 ALSA: usb-audio: Apply the sa=
mple rate quirk for Bose Companion 5)
Merging sound-asoc-fixes/for-linus (29de6a7cb495 Merge branch 'asoc-5.5' in=
to asoc-linus)
Merging regmap-fixes/for-linus (46cf053efec6 Linux 5.5-rc3)
Merging regulator-fixes/for-linus (3350c339f608 Merge branch 'regulator-5.5=
' into regulator-linus)
Merging spi-fixes/for-linus (0804be7bdfd3 Merge branch 'spi-5.5' into spi-l=
inus)
Merging pci-current/for-linus (ca01e7987463 PCI: rockchip: Fix IO outbound =
ATU register number)
Merging driver-core.current/driver-core-linus (d1eef1c61974 Linux 5.5-rc2)
Merging tty.current/tty-linus (273f632912f1 tty: always relink the port)
Merging usb.current/usb-linus (c215e48e97d2 USB-PD tcpm: bad warning+size, =
PPS adapters)
Merging usb-gadget-fixes/fixes (e5b5da96da50 usb: gadget: fix wrong endpoin=
t desc)
Merging usb-serial-fixes/usb-linus (2438c3a19dec USB: serial: option: add Z=
LP support for 0x1bc7/0x9010)
Merging usb-chipidea-fixes/ci-for-usb-stable (16009db47c51 usb: chipidea: u=
dc: workaround for endpoint conflict issue)
Merging phy/fixes (4f510aa10468 phy/rockchip: inno-hdmi: round clock rate d=
own to closest 1000 Hz)
Merging staging.current/staging-linus (58dcc5bf4030 staging: rtl8188eu: Add=
 device code for TP-Link TL-WN727N v5.21)
Merging char-misc.current/char-misc-linus (fd6988496e79 Linux 5.5-rc4)
Merging soundwire-fixes/fixes (e42617b825f8 Linux 5.5-rc1)
Merging thunderbolt-fixes/fixes (fd6988496e79 Linux 5.5-rc4)
Merging input-current/for-linus (1021dcf19db1 Input: imx_sc_key - only take=
 the valid data from SCU firmware as key state)
Merging crypto-current/master (84faa307249b crypto: arm/curve25519 - add ar=
ch-specific key generation function)
Merging ide/master (baf6722aa0cb ide: Use dev_get_drvdata where possible)
Merging vfio-fixes/for-linus (95f89e090618 vfio/type1: Initialize resv_msi_=
base)
Merging kselftest-fixes/fixes (2a1f40adfb54 rseq/selftests: Clarify rseq_pr=
epare_unload() helper requirements)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging slave-dma-fixes/fixes (b0b5ce1010ff ioat: ioat_alloc_ring() failure=
 handling.)
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (df8fed831cbc mtd: rawnand: au1550nd: Fix au_re=
ad_buf16() prototype)
Merging mfd-fixes/for-mfd-fixes (603d9299da32 mfd: mt6397: Fix probe after =
changing mt6397-core)
Merging v4l-dvb-fixes/fixes (ce644cf3fa06 media: intel-ipu3: Align struct i=
pu3_uapi_awb_fr_config_s to 32 bytes)
Merging reset-fixes/reset/fixes (db23808615e2 reset: Do not register resour=
ce data for missing resets)
Merging mips-fixes/mips-fixes (bbcc5672b006 MIPS: Avoid VDSO ABI breakage d=
ue to global register variable)
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
Merging btrfs-fixes/next-fixes (c797239e8a3e Merge branch 'misc-5.5' into n=
ext-fixes)
Merging vfs-fixes/fixes (7b3083ba718b mountpoint_last(): fix the treatment =
of LAST_BIND)
Merging dma-mapping-fixes/for-linus (9c24eaf81cc4 iommu/vt-d: Return the co=
rrect dma mask when we are bypassing the IOMMU)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (46cf053efec6 Linux 5.5-rc3)
Merging samsung-krzk-fixes/fixes (a2315d3aea59 ARM: exynos_defconfig: Resto=
re debugfs support)
Merging pinctrl-samsung-fixes/pinctrl-fixes (e42617b825f8 Linux 5.5-rc1)
Merging devicetree-fixes/dt/linus (dbce0b65046d dt-bindings: Add missing 'p=
roperties' keyword enclosing 'snps,tso')
Merging scsi-fixes/fixes (e4dc9a4c31fe scsi: target/iblock: Fix protection =
error with blocks greater than 512B)
Merging drm-fixes/drm-fixes (a6204fc7b83c agp: remove unused variable arqsz=
 in agp_3_5_enable())
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (fd6988496e79 Linux 5.5-rc4)
Merging mmc-fixes/fixes (f667216c5c7c mmc: sdhci-of-esdhc: re-implement err=
atum A-009204 workaround)
Merging rtc-fixes/rtc-fixes (653997eeecef rtc: mt6397: fix alarm register o=
verwrite)
Merging gnss-fixes/gnss-linus (d1eef1c61974 Linux 5.5-rc2)
Merging hyperv-fixes/hyperv-fixes (af42d3466bdc Linux 5.4-rc8)
Merging soc-fsl-fixes/fix (5674a92ca4b7 soc/fsl/qe: Fix an error code in qe=
_pin_request())
Merging risc-v-fixes/fixes (0e194d9da198 Documentation: riscv: add patch ac=
ceptance guidelines)
Merging pidfd-fixes/fixes (43cf75d96409 exit: panic before exit_mm() on glo=
bal init exit)
Merging fpga-fixes/fixes (dec43da46f63 fpga: altera-ps-spi: Fix getting of =
optional confd gpio)
Merging spdx/spdx-linus (2f13437b8917 Merge tag 'trace-v5.5-2' of git://git=
.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging gpio-intel-fixes/fixes (e42617b825f8 Linux 5.5-rc1)
Merging pinctrl-intel-fixes/fixes (b9a19bdbc843 pinctrl: cherryview: Pass i=
rqchip when adding gpiochip)
Merging erofs-fixes/fixes (d1eef1c61974 Linux 5.5-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (c4e4fccc5d52 drm/dp_mst: corre=
ct the shifting in DP_REMOTE_I2C_READ)
Merging kspp-gustavo/for-next/kspp (3d519d6d388b sh: kgdb: Mark expected sw=
itch fall-throughs)
Merging kbuild/for-next (4032ba3d69ce Merge branch 'kbuild' into for-next)
Merging compiler-attributes/compiler-attributes (54ecb8f7028c Linux 5.4-rc1)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (a7ba70f1787f dma-mapping: treat dev->bus_dma_=
mask as a DMA limit)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
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
Merging aspeed/for-next (e4aab38ed5d1 ARM: dts: aspeed: Add SD card for Ves=
nin)
Merging at91/at91-next (0e2a6c95b2b9 Merge branches 'at91-soc' and 'at91-dt=
' into at91-next)
Merging bcm2835/for-next (f14234184671 Merge branch 'bcm2835-maintainers-ne=
xt' into for-next)
Merging imx-mxs/for-next (3a0811a3b9c6 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (2af8e1f26c65 Merge branch 'for_5.5/driver-soc' into =
next)
Merging mediatek/for-next (ca01a6367d0f Merge branch 'v5.5-next/soc' into f=
or-next)
Merging mvebu/for-next (cd592187f9de arm64: dts: uDPU: SFP cages support 3W=
 modules)
Merging omap/for-next (cf9ea4b7c370 Merge branch 'omap-for-v5.6/ti-sysc-dro=
p-pdata' into for-next)
Merging qcom/for-next (2152ffb58fc8 Merge branches 'arm64-for-5.5-fixes', '=
drivers-for-5.5-fixes', 'arm64-defconfig-for-5.6', 'arm64-for-5.6', 'defcon=
fig-for-5.6', 'drivers-for-5.6' and 'dts-for-5.6' into for-next)
Merging realtek/for-next (44242a468f3a Merge branch 'v5.6/dt' into next)
Merging renesas/next (9604d3647916 Merge branches 'renesas-arm-dt-for-v5.6'=
, 'renesas-arm64-dt-for-v5.6' and 'renesas-soc-for-v5.6' into renesas-next)
Merging reset/reset/next (c9aef213e38c reset: intel: Add system reset contr=
oller driver)
Merging rockchip/for-next (3ce659c9cf8f Merge branch 'v5.6-armsoc/dts64' in=
to for-next)
Merging samsung-krzk/for-next (72475dbe8f40 Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (6225c441d10e Merge tag 'scmi-updates-5.6' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging sunxi/sunxi/for-next (dddab4c4ad4a Merge branches 'sunxi/clk-for-5.=
6' and 'sunxi/dt-for-5.6' into sunxi/for-next)
Merging tegra/for-next (e0fd54137bf5 Merge branch for-5.5/cpufreq into for-=
next)
Merging clk/clk-next (67d81d7a2ef3 Merge branch 'clk-fixes' into clk-next)
Merging clk-samsung/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (1ca52289c089 csky: kprobes/kretprobes support)
CONFLICT (content): Merge conflict in arch/csky/kernel/vmlinux.lds.S
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
Merging parisc-hd/for-next (22b4b7c41c2a parisc: Use proper printk format f=
or resource_size_t)
Merging powerpc/next (7794b1d4185e Merge tag 'powerpc-5.5-1' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (5a35435ef4e6 soc: fsl: qe: remove PPC32 dependency fr=
om CONFIG_QUICC_ENGINE)
Merging risc-v/for-next (070389ef0f4b Merge branch 'next/add-nonstable-guid=
ance' into for-next)
CONFLICT (add/add): Merge conflict in Documentation/riscv/patch-acceptance.=
rst
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
Merging fscrypt/master (f4a0b08b39ae fscrypt: remove redundant bi_status ch=
eck)
Merging afs/afs-next (4fe171bb81b1 afs: Remove set but not used variable 'r=
et')
Merging btrfs/for-next (451942d4ded8 Merge branch 'for-next-next-v5.5-20191=
216' into for-next-20191216)
Merging ceph/master (da08e1e1d7c3 ceph: add more debug info when decoding m=
dsmap)
Merging cifs/for-next (30b1b3802b20 fs/cifs/cifssmb.c: use true,false for b=
ool variable)
Merging configfs/for-next (e2f238f7d5a1 configfs: calculate the depth of pa=
rent item)
Merging ecryptfs/next (b4a81b87a4cf ecryptfs: fix a memory leak bug in ecry=
ptfs_init_messaging())
Merging erofs/dev (2dd06edbd7ae erofs: remove void tagging/untagging of wor=
kgroup pointers)
Merging ext3/for_next (4d5c1adaf893 reiserfs: Fix spurious unlock in reiser=
fs_fill_super() error handling)
Merging ext4/dev (40eaaeb11758 memcg: fix a crash in wb_workfn when a devic=
e disappears)
Merging f2fs/dev (19642074f862 f2fs: show the CP_PAUSE reason in checkpoint=
 traces)
Merging fsverity/fsverity (8086c974ecb9 fs-verity: implement readahead for =
FS_IOC_ENABLE_VERITY)
Merging fuse/for-next (8d66fcb74884 fuse: fix Kconfig indentation)
Merging jfs/jfs-next (a5fdd713d256 jfs: fix bogus variable self-initializat=
ion)
Merging nfs/linux-next (fd6988496e79 Linux 5.5-rc4)
Merging nfs-anna/linux-next (ffb855611b05 NFS: Attach supplementary error i=
nformation to fs_context.)
Merging nfsd/nfsd-next (e44b4bf2648e nfsd: use true,false for bool variable=
 in nfssvc.c)
Merging orangefs/for-next (f9bbb68233aa orangefs: posix open permission che=
cking...)
Merging overlayfs/overlayfs-next (6c7bed084507 ovl: improving copy-up effic=
iency for big sparse file)
Merging ubifs/linux-next (6e78c01fde90 Revert "jffs2: Fix possible null-poi=
nter dereferences in jffs2_add_frag_to_fragtree()")
Merging v9fs/9p-next (79fb9216b7be 9p: Remove unneeded semicolon)
Merging xfs/for-next (5084bf6b2006 xfs: Make the symbol 'xfs_rtalloc_log_co=
unt' static)
Merging iomap/iomap-for-next (c275779ff2dd iomap: stop using ioend after it=
's been freed in iomap_finish_ioend())
Merging djw-vfs/vfs-for-next (3253d9d09337 splice: only read in as much inf=
ormation as there is pipe buffer space)
Merging file-locks/locks-next (98ca480a8f22 locks: print unsigned ino in /p=
roc/locks)
Merging vfs/for-next (912dfe068c43 Merge branches 'work.openat2', 'work.rec=
ursive_removal' and 'imm.timestamp' into for-next)
Merging printk/for-next (e616b43fb3a3 Merge branch 'for-5.6' into for-next)
Merging pci/next (cb224132f23e Merge branch 'remotes/lorenzo/pci/dwc')
Merging pstore/for-next/pstore (9e5f1c19800b pstore/ram: Write new dumps to=
 start of recycled zones)
Merging hid/for-next (71bceec41644 Merge branch 'for-5.5/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (15c0677162b7 dt-bindings: i2c: sh_mobile: Documen=
t r8a77961 support)
Merging i3c/i3c/next (608b68b67a30 MAINTAINERS: fix style in CADENCE I3C MA=
STER IP entry)
Merging dmi/master (2429c99fa13a firmware: dmi: Add dmi_memdev_handle)
Merging hwmon-staging/hwmon-next (00b379b51ea6 hwmon: (pmbus/ibm-cffps) Fix=
 the LED behavior when turned off)
Merging jc_docs/docs-next (3697aa15563f docs/zh_CN: translate kernel enforc=
ement statement)
Merging v4l-dvb/master (51e40a0dbe53 media: sun4i-csi: Add support for A10 =
CSI1 camera sensor interface)
CONFLICT (content): Merge conflict in drivers/media/usb/pulse8-cec/pulse8-c=
ec.c
Merging v4l-dvb-next/master (d45331b00ddb Linux 5.3-rc4)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (205a31f03a11 Merge branches 'pm-cpufreq' and 'pm-avs=
' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (d4a386f59527 cpufreq: tegra186:=
 convert to devm_platform_ioremap_resource)
Merging cpupower/cpupower (e42617b825f8 Linux 5.5-rc1)
Merging opp/opp/linux-next (03758d60265c opp: Replace list_kref with a loca=
l counter)
Merging thermal/thermal/linux-next (09a1f1817b04 dt-bindings: thermal: Add =
YAML schema for sun8i-thermal driver bindings)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (a48f9721e6db dlm: no need to check return value of debugf=
s_create functions)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (fd6988496e79 Linux 5.5-rc4)
Merging net-next/master (de1b23b9b4c1 Merge branch 'dsa-deferred-xmit')
Merging bpf-next/master (2bbc078f812d Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/bpf/bpf-next)
Merging ipsec-next/master (e27cca96cd68 xfrm: add espintcp (RFC 8229))
CONFLICT (content): Merge conflict in net/unix/af_unix.c
Merging mlx5-next/mlx5-next (e42617b825f8 Linux 5.5-rc1)
Merging netfilter-next/master (4460985fac06 Merge branch '100GbE' of git://=
git.kernel.org/pub/scm/linux/kernel/git/jkirsher/next-queue)
Merging nfc-next/master (1f008cfec5d5 NFC: fdp: Fix unused variable warning=
s)
CONFLICT (content): Merge conflict in drivers/nfc/st21nfca/se.c
Merging ipvs-next/master (d54725cd11a5 netfilter: nf_tables: support for mu=
ltiple devices per netdev hook)
Merging wireless-drivers-next/master (ae0a723c4cfd Merge ath-next from git:=
//git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git)
Merging bluetooth/master (4b6e228e297b Bluetooth: Auto tune if input MTU is=
 set to 0)
Merging mac80211-next/master (1ee7826ab68f mac80211: Remove redundant asser=
tion)
Merging gfs2/for-next (b5ce5b99343c gfs2: eliminate ssize parameter from gf=
s2_struct2blk)
Merging mtd/mtd/next (589e1b6c47ce Merge tag 'nand/for-5.5' into mtd/next)
Merging nand/nand/next (777260a5c992 mtd: rawnand: remove unecessary checki=
ng if dmac is NULL)
Merging spi-nor/spi-nor/next (707745e8d4e7 mtd: spi-nor: Add support for mx=
25r3235f)
Merging crypto/master (79bfa4e737f5 Documentation: tee: add AMD-TEE driver =
details)
Merging drm/drm-next (f5c547efa16c Merge tag 'drm-misc-next-2020-01-02' of =
git://anongit.freedesktop.org/drm/drm-misc into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_gt_pm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_obj=
ect.c
Merging amdgpu/drm-next (0408dddce3d8 drm/amdgpu/smu: make the set_performa=
nce_level logic easier to follow)
Merging drm-intel/for-linux-next (05e8a5f51eb5 drm/i915: Create dumb buffer=
 from LMEM)
Merging drm-tegra/drm/tegra/for-next (d66dfcf80d0f drm/tegra: Run hub clean=
up on ->remove())
Merging drm-misc/for-linux-next (3d0dad869aeb drm/rockchip: lvds: move hard=
ware-specific functions together)
Merging drm-msm/msm-next (6b16f05aa39f drm/msm/dsi: split clk rate setting =
and enable)
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (4d24376370fb gpu: ipu-v3: image-convert: only=
 sample into the next tile if necessary)
Merging etnaviv/etnaviv/next (22567d017c2c dt-bindings: etnaviv: Add #cooli=
ng-cells)
Merging regmap/for-next (46cf053efec6 Linux 5.5-rc3)
Merging sound/for-next (8be03a7177c3 ALSA: usb-audio: Use lower hex numbers=
 for IDs)
Merging sound-asoc/for-next (6a00fc414068 Merge branch 'asoc-5.6' into asoc=
-next)
Merging modules/modules-next (ce2b617ce8cb export.h: reduce __ksymtab_strin=
gs string duplication by using "MS" section flags)
Merging input/next (fd7bba685e7d Input: apbps2 - add __iomem to register st=
ruct)
Merging block/for-next (af1a37012a26 Merge branch 'for-5.6/io_uring' into f=
or-next)
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
Merging regulator/for-next (6a7a756c596b Merge branch 'regulator-5.6' into =
regulator-next)
Merging security/next-testing (45893a0abee6 kexec: Fix file verification on=
 S390)
Merging apparmor/apparmor-next (341c1fda5e17 apparmor: make it so work buff=
ers can be allocated from atomic context)
Merging integrity/next-integrity (f47825c69485 Merge branch 'next-integrity=
.measure-keys' into next-integrity)
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
[master c92a5e24e61f] next-20191211/keys
Merging selinux/next (f1268534027a selinux: remove set but not used variabl=
e 'sidtab')
CONFLICT (content): Merge conflict in include/linux/lsm_audit.h
Merging smack/for-next (92604e825304 smack: use GFP_NOFS while holding inod=
e_smack::smk_lock)
Merging tomoyo/master (a8772fad0172 tomoyo: Use atomic_t for statistics cou=
nter)
Merging tpmdd/next (1760eb689ed6 tpm/tpm_ftpm_tee: add shutdown call back)
Merging watchdog/master (dcbce5fbcc69 watchdog: orion: fix platform_get_irq=
() complaints)
Merging iommu/next (cdd1a5d53fd5 Merge branches 'arm/smmu', 'x86/amd' and '=
core' into next)
Merging vfio/next (9917b54aded1 Merge branch 'v5.5/vfio/jiang-yi-irq-bypass=
-unregister-v1' into v5.5/vfio/next)
Merging audit/next (cb5172d96d16 audit: Add __rcu annotation to RCU pointer)
Merging devicetree/for-next (0cec114e3660 scripts/dtc: Update to upstream v=
ersion v1.5.1-22-gc40aeb60b47a)
Merging mailbox/mailbox-for-next (c6c6bc6ea9fc mailbox: imx: add support fo=
r imx v1 mu)
Merging spi/for-next (60141c615fad Merge branch 'spi-5.6' into spi-next)
Merging tip/auto-latest (acfe9d882f58 Merge branch 'WIP.core/headers')
CONFLICT (content): Merge conflict in init/main.c
Merging clockevents/timers/drivers/next (8c82723414d5 clocksource/drivers/t=
imer-ti-dm: Switch to platform_get_irq)
Merging edac/edac-for-next (a651c6c64431 EDAC/aspeed: Remove unneeded semic=
olon)
Merging irqchip/irq/irqchip-next (c6d732c8cc67 irqchip/aspeed-i2c-ic: Fix i=
rq domain name memory leak)
Merging ftrace/for-next (fe6e096a5bbf tracing: Fix endianness bug in histog=
ram trigger)
Merging rcu/rcu/next (de73daec335f rcutorture: Make kvm-find-errors.sh abor=
t on bad directory)
CONFLICT (content): Merge conflict in lib/Kconfig.debug
CONFLICT (content): Merge conflict in kernel/kcsan/encoding.h
CONFLICT (content): Merge conflict in kernel/kcsan/core.c
Applying: rcu: fix up for "Remove rcu_swap_protected()"
Merging kvm/linux-next (7d73710d9ca2 kvm: vmx: Stop wasting a page for gues=
t_msrs)
Merging kvm-arm/next (c74555894492 KVM: arm/arm64: vgic: Handle GICR_PENDBA=
SER.PTZ filed as RAZ)
Merging kvm-ppc/kvm-ppc-next (30486e72093e KVM: PPC: Book3S HV: XIVE: Fix p=
otential page leak on error path)
Merging kvms390/next (c7b7de631246 KVM: s390: Do not yield when target is a=
lready running)
Merging xen-tip/linux-next (d6bd6cf9feb8 xen/grant-table: remove multiple B=
UG_ON on gnttab_interface)
Merging percpu/for-next (06557cf18eae Merge branch 'for-5.6' into for-next)
Merging workqueues/for-next (49e9d1a9faf2 workqueue: Add RCU annotation for=
 pwq list walk)
Merging drivers-x86/for-next (554f269f0f38 platform/x86: intel_pmc_core: Ad=
d Intel Elkhart Lake support)
Merging chrome-platform/for-next (737d6777b231 cros_ec: treewide: Remove 'i=
nclude/linux/mfd/cros_ec.h')
Merging hsi/for-next (c1030cd45619 HSI: Remove dev_err() usage after platfo=
rm_get_irq())
Merging leds/for-next (a1b13557cf7f leds: lm3692x: Split out lm3692x_leds_d=
isable)
$ git reset --hard HEAD^
Merging next-20191220 version of leds
Merging ipmi/for-next (6b8526d3abc0 ipmi:ssif: Handle a possible NULL point=
er reference)
Merging driver-core/driver-core-next (4c002c978b7f device.h: move 'struct d=
river' stuff out to device/driver.h)
CONFLICT (content): Merge conflict in include/linux/device.h
Merging usb/usb-next (4e52af1ccaa2 usb: host: Do not compile test deprecate=
d USB_OCTEON_EHCI)
Merging usb-gadget/next (726b4fba94be usb: dwc3: of-simple: add a shutdown)
Merging usb-serial/usb-next (d1eef1c61974 Linux 5.5-rc2)
Merging usb-chipidea-next/ci-for-usb-next (4d6141288c33 usb: chipidea: imx:=
 pinctrl for HSIC is optional)
Merging phy-next/next (f17cb451270c phy: qcom-qmp: Add SW reset register)
Merging tty/tty-next (749e4121d6ee Merge 5.5-rc3 into tty-next)
Merging char-misc/char-misc-next (fd6988496e79 Linux 5.5-rc4)
Merging extcon/extcon-next (2ddf50a75dab extcon: sm5502: Remove unneeded se=
micolon)
Merging soundwire/next (09f6a72d0143 soundwire: intel: add clock stop quirk=
s)
Merging thunderbolt/next (fd6988496e79 Linux 5.5-rc4)
Merging staging/staging-next (0469fc6a1a87 staging: wfx: check for memory a=
llocation failures from wfx_alloc_hif)
Merging mux/for-next (f356d58c3a04 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (1a0013c62b33 interconnect: Add interconnect_graph fil=
e to debugfs)
Merging slave-dma/next (02939cd16709 dmaengine: imx-sdma: Fix memory leak)
Merging cgroup/for-next (899969b46c28 Merge branch 'for-5.5' into for-next)
Merging scsi/for-next (202f93b5d605 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (1d83f0df7076 Merge branch '5.6/scsi-queue' into =
5.6/scsi-next)
Merging vhost/linux-next (d1281e3a562e virtio-blk: remove VIRTIO_BLK_F_SCSI=
 support)
Merging rpmsg/for-next (447e58a8d18a Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (331d7ae3fa15 Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (9ccaf106c2cf gpio: tegra: Use NOIRQ phase =
for suspend/resume)
Merging gpio-intel/for-next (e42617b825f8 Linux 5.5-rc1)
Merging pinctrl/for-next (3cb71c4cf0b6 Merge branch 'devel' into for-next)
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
Merging y2038/y2038 (b8c709bf963a Merge tags 'block-ioctl-cleanup-5.6' and =
'y2038-drivers-for-v5.6-signed' of git://git.kernel.org:/pub/scm/linux/kern=
el/git/arnd/playground into HEAD)
CONFLICT (content): Merge conflict in drivers/block/virtio_blk.c
CONFLICT (content): Merge conflict in Documentation/core-api/index.rst
Merging livepatching/for-next (7f436b3066e3 Merge branch 'for-5.5/core' int=
o for-next)
Merging coresight/next (ad9882f15884 coresight: etm4x: Fix unused function =
warning)
Merging rtc/rtc-next (d53f9b68b359 rtc: pcf8563: Use BIT)
Merging nvdimm/libnvdimm-for-next (0dfbb932bb67 MAINTAINERS: Remove Keith f=
rom NVDIMM maintainers)
Merging at24/at24/for-next (69afc4b62308 eeprom: at24: sort headers alphabe=
tically)
Merging ntb/ntb-next (1ef512b16bc8 NTB: Fix an error in get link status)
Merging kspp/for-next/kspp (f39ca02d2ac4 Merge branch 'for-linus/field_size=
of' into for-next/kspp)
CONFLICT (content): Merge conflict in tools/testing/selftests/seccomp/secco=
mp_bpf.c
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
Merging devfreq/devfreq-next (91d7f3f8f134 PM / devfreq: exynos: Rename Exy=
nos to lowercase)
Merging hmm/hmm (fd6988496e79 Linux 5.5-rc4)
Merging fpga/for-next (1d39387ce859 fpga: remove redundant dev_err message)
Merging kunit/test (e42617b825f8 Linux 5.5-rc1)
Merging cel/cel-next (a99d8080aaf3 Linux 5.4-rc6)
Merging kasan-bitops/topic/kasan-bitops (4f4afc2c9599 docs/core-api: Remove=
 possibly confusing sub-headings from Bit Operations)
Merging generic-ioremap/for-next (1188dd7d3fbd remove ioremap_nocache and d=
evm_ioremap_nocache)
CONFLICT (content): Merge conflict in tools/testing/nvdimm/Kbuild
CONFLICT (content): Merge conflict in arch/hexagon/include/asm/io.h
Applying: generic_ioremap: merge fix for "tools/testing/nvdimm: Fix mock su=
pport for ioremap"
Merging kunit-next/kunit (d1eef1c61974 Linux 5.5-rc2)
Merging akpm-current/current (3d23629963c7 ipc/msg.c: Adjust indentation in=
 ksys_msgctl)
Applying: mm, debug_pagealloc: need to export _debug_pagealloc_enabled_early
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
Applying: proc: decouple proc from VFS with "struct proc_ops"
Applying: proc: convert everything to "struct proc_ops"
Applying: proc-convert-everything-to-struct-proc_ops-fix
Applying: lib/string: add strnchrnul()
Applying: bitops: more BITS_TO_* macros
Applying: bitops-more-bits_to_-macros-fix
Applying: bitops-more-bits_to_-macros-fix-fix
Applying: lib: add test for bitmap_parse()
Applying: fix rebase issue
Applying: lib: make bitmap_parse_user a wrapper on bitmap_parse
Applying: lib: rework bitmap_parse()
Applying: lib: new testcases for bitmap_parse{_user}
Applying: include/linux/cpumask.h: don't calculate length of the input stri=
ng
Applying: drivers/tty/serial/sh-sci.c: suppress warning
Applying: drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer ove=
rflow
Merging akpm/master (33f79c898690 drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/e6lUUUodEwTvVbPh9/vPko1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4S00cACgkQAVBC80lX
0GyCvwf/T3DP8qCiBaW/6sQR/NV+kkZz1afup/WvHLiP/lWXk+6Z2PxVYLerTw/r
PAgGyiKvMCdkJX12j1PYSe6Hyw/nYf9lL4o2uxdFhLqDPJyFz+bLcEB/1EnNh6gm
sCFhepYmDA/UQ+9MEmi2+5rOKCVtUwYY30iwcVskP8IXlrkopJuI7OASGw+hEyAt
3M7Yhu6uHXTMgN/gGzq3YSkycXdNSUXveayPN+vvFCNELNZdvbZM7sW3/tBSDwT5
k+QD9eOdrX1dxwDdEKAR3RsED7G42dXbOz+Gmxzj9vW2q6bszArK+kkBxCmK35Cx
9uDu0CxHvEoWK3VwQRNuZKr4JheSRw==
=cf4k
-----END PGP SIGNATURE-----

--Sig_/e6lUUUodEwTvVbPh9/vPko1--
