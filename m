Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F257B189A46
	for <lists+linux-next@lfdr.de>; Wed, 18 Mar 2020 12:09:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727733AbgCRLJ1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Mar 2020 07:09:27 -0400
Received: from ozlabs.org ([203.11.71.1]:55719 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726486AbgCRLJ0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Mar 2020 07:09:26 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48j6k96YgKz9sP7;
        Wed, 18 Mar 2020 22:09:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584529762;
        bh=L0oj8qGC8Qph6kXdQEY+wEOBfFEDZAer7UNH0NqbUrg=;
        h=Date:From:To:Cc:Subject:From;
        b=C61ahJ8Z1ySx7wOkOuaogA+74KPSJgBWZgz5apyCILnDtkeHGXsb7PFkxlJIaQkbB
         YiGhd/QuXIt0rlIXMYmJTyVKn6XUm5g8N/MyzkPBEgxc8ZTGcJPWJenCZrCkFeMU3e
         o1rf6wRVhwp3q1m5hCseZ0qCqThAdLMBccGxcO/6Q7Y8JLsqTFp54LCvR6unqV4ttZ
         toSsqWgKRAC1GN6OkRb7iyXCV+M9pnWq51QOkUOhKL+Fa5u4A1eeP+NcRFbZCHGhpD
         TA9olPog6yiXYrhkq2QdWXXJvknAE3f7ht/VHC6SUeqgdtM4AQBIlcPjyV9OT7accI
         xRJxypyXnMx6g==
Date:   Wed, 18 Mar 2020 22:09:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 18
Message-ID: <20200318220920.48df2e76@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AyY42yYw.0WUPuNGxeJTM6C";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/AyY42yYw.0WUPuNGxeJTM6C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20200317:

New tree: trivial

The pm tree lost its build failure.

The jc_docs tree gained a conflict against the arm64 tree.

The drm tree gained a conflict against the omap tree.

The tip tree gained a conflict against the arm64 tree.

Non-merge commits (relative to Linus' tree): 8743
 7575 files changed, 341247 insertions(+), 167292 deletions(-)

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
Merging origin/master (ac309e7744be Merge branch 'for-linus' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/hid/hid)
Merging fixes/master (fb33c6510d55 Linux 5.6-rc6)
Merging kbuild-current/fixes (785d74ec3bbf initramfs: restore default compr=
ession behavior)
Merging arc-current/for-curr (f09d3174f002 ARC: allow userspace DSP applica=
tions to use AGU extensions)
Merging arm-current/fixes (89604523a76e ARM: 8961/2: Fix Kbuild issue cause=
d by per-task stack protector GCC plugin)
Merging arm-soc-fixes/arm/fixes (d4d89e25fc7b Merge tag 'socfpga_defconfig_=
fix_for_v5.6' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/lin=
ux into arm/fixes)
Merging arm64-fixes/for-next/fixes (9abd515a6e4a arm64: context: Fix ASID l=
imit in boot messages)
Merging m68k-current/for-linus (6aabc1facdb2 m68k: Implement copy_thread_tl=
s())
Merging powerpc-fixes/fixes (af3d0a68698c powerpc/kasan: Fix shadow memory =
protection with CONFIG_KASAN_VMALLOC)
Merging s390-fixes/fixes (9218b36d767a s390/diag: fix display of diagnose c=
all statistics)
Merging sparc/master (11648b8339f8 sparc64: fix adjtimex regression)
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (32ca98feab8c net: ip_gre: Accept IFLA_INFO_DATA-less co=
nfiguration)
Merging bpf/master (8e7ae2518f52 bpf: Sanitize the bpf_struct_ops tcp-cc na=
me)
Merging ipsec/master (d1d17a359ce6 esp: remove the skb from the chain when =
it's enqueued in cryptd_wq)
Merging netfilter/master (b723bd933980 net: stmmac: dwmac1000: Disable ACS =
if enhanced descs are not used)
Merging ipvs/master (c24b75e0f923 ipvs: move old_secure_tcp into struct net=
ns_ipvs)
Merging wireless-drivers/master (e2e57291097b wlcore: remove stray plus sig=
n)
Merging mac80211/master (ef299cc3fa1a net_sched: cls_route: remove the righ=
t filter from hashtable)
Merging rdma-fixes/for-rc (941224e09483 IB/rdmavt: Free kernel completion q=
ueue when done)
Merging sound-current/for-linus (a124458a127c ALSA: hda/realtek - Enable th=
e headset of Acer N50-600 with ALC662)
Merging sound-asoc-fixes/for-linus (bd7867364deb Merge branch 'asoc-5.6' in=
to asoc-linus)
Merging regmap-fixes/for-linus (87fc8230f7aa Merge branch 'regmap-5.6' into=
 regmap-linus)
Merging regulator-fixes/for-linus (2c523b344dfa Linux 5.6-rc5)
Merging spi-fixes/for-linus (2c523b344dfa Linux 5.6-rc5)
Merging pci-current/for-linus (5901b51f3e5d MAINTAINERS: Correct Cadence PC=
I driver path)
Merging driver-core.current/driver-core-linus (2c523b344dfa Linux 5.6-rc5)
Merging tty.current/tty-linus (2c523b344dfa Linux 5.6-rc5)
Merging usb.current/usb-linus (b401f8c4f492 USB: cdc-acm: fix rounding erro=
r in TIOCSSERIAL)
Merging usb-gadget-fixes/fixes (42cd5ffe46c1 usb: dwc3: debug: fix string p=
osition formatting mixup with ret and len)
Merging usb-serial-fixes/usb-linus (cecc113c1af0 USB: serial: pl2303: add d=
evice-id for HP LD381)
Merging usb-chipidea-fixes/ci-for-usb-stable (7cbf3dd3139a usb: chipidea: u=
dc: fix sleeping function called from invalid context)
Merging phy/fixes (be4e3c737eeb phy: mapphone-mdm6600: Fix timeouts by addi=
ng wake-up handling)
Merging staging.current/staging-linus (bb5786b9286c staging: rtl8188eu: Add=
 device id for MERCUSYS MW150US v2)
Merging char-misc.current/char-misc-linus (f17f06a0c779 slimbus: ngd: add v=
2.1.0 compatible)
Merging soundwire-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging thunderbolt-fixes/fixes (e9d0e7511fda thunderbolt: Fix error code i=
n tb_port_is_width_supported())
Merging input-current/for-linus (da3289044833 Input: tm2-touchkey - add sup=
port for Coreriver TC360 variant)
Merging crypto-current/master (1579f1bc3b75 crypto: x86/curve25519 - suppor=
t assemblers with no adx support)
Merging ide/master (94f2630b1897 Merge tag '5.6-rc-small-smb3-fix-for-stabl=
e' of git://git.samba.org/sfrench/cifs-2.6)
Merging vfio-fixes/for-linus (95f89e090618 vfio/type1: Initialize resv_msi_=
base)
Merging kselftest-fixes/fixes (f3a60268f5ce selftest/lkdtm: Use local .giti=
gnore)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging slave-dma-fixes/fixes (195967c088aa MAINTAINERS: rectify the INTEL =
IADX DRIVER entry)
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (def9d2780727 Linux 5.5-rc7)
Merging mfd-fixes/for-mfd-fixes (603d9299da32 mfd: mt6397: Fix probe after =
changing mt6397-core)
Merging v4l-dvb-fixes/fixes (8077f8157271 media: Fix build failure due to m=
issing select REGMAP_I2C)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (f7d5f5655ef7 MAINTAINERS: Correct MIPS patch=
work URL)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (dfa7ea303f56 ARM: dts: omap5: Add bus_dma_limit f=
or L3 bus)
Merging kvm-fixes/master (018cabb694e3 Merge branch 'kvm-null-pointer-fix' =
into kvm-master)
Merging kvms390-fixes/master (e93fc7b4544a KVM: s390: Also reset registers =
in sync regs for initial cpu reset)
Merging hwmon-fixes/hwmon (2c523b344dfa Linux 5.6-rc5)
Merging nvdimm-fixes/libnvdimm-fixes (96222d53842d dax: pass NOWAIT flag to=
 iomap_apply)
Merging btrfs-fixes/next-fixes (0b3e06526e63 Merge branch 'misc-5.6' into n=
ext-fixes)
Merging vfs-fixes/fixes (d9a9f4849fe0 cifs_atomic_open(): fix double-put on=
 late allocation failure)
Merging dma-mapping-fixes/for-linus (9c24eaf81cc4 iommu/vt-d: Return the co=
rrect dma mask when we are bypassing the IOMMU)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (f8788d86ab28 Linux 5.6-rc3)
Merging samsung-krzk-fixes/fixes (0d935f0bf77d ARM: dts: exynos: Fix regula=
tor node aliasing on Midas-based boards)
Merging pinctrl-samsung-fixes/pinctrl-fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging devicetree-fixes/dt/linus (35595372d95c Remove redundant YYLOC glob=
al declaration)
Merging scsi-fixes/fixes (394b61711f3c scsi: ipr: Fix softlockup when resca=
nning devices in petitboot)
Merging drm-fixes/drm-fixes (16b78f052d01 Merge tag 'topic/mst-bw-check-fix=
es-for-airlied-2020-03-12-2' of git://anongit.freedesktop.org/drm/drm-misc =
into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (fe8b7085cac3 drm/i915: Handle=
 all MCR ranges)
Merging mmc-fixes/fixes (a3313d222164 mmc: rtsx_pci: Fix support for speed-=
modes that relies on tuning)
Merging rtc-fixes/rtc-fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging gnss-fixes/gnss-linus (f8788d86ab28 Linux 5.6-rc3)
Merging hyperv-fixes/hyperv-fixes (c1088d6c08fd HID: hyperv: NULL check bef=
ore some freeing functions is not needed.)
Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq h=
andlers after dpio create)
Merging risc-v-fixes/fixes (af33d2433b03 riscv: fix seccomp reject syscall =
code path)
Merging pidfd-fixes/fixes (10dab84caf40 pid: make ENOMEM return value more =
obvious)
Merging fpga-fixes/fixes (dec43da46f63 fpga: altera-ps-spi: Fix getting of =
optional confd gpio)
Merging spdx/spdx-linus (bb6d3fb354c5 Linux 5.6-rc1)
Merging gpio-intel-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging pinctrl-intel-fixes/fixes (2c523b344dfa Linux 5.6-rc5)
Merging erofs-fixes/fixes (d1eef1c61974 Linux 5.5-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (8c34cd1a7f08 drm/bochs: downgr=
ade pci_request_region failure from error to warning)
Merging kspp-gustavo/for-next/kspp (d5180902be1c firmware: google: vpd: Rep=
lace zero-length array with flexible-array member)
Merging kbuild/for-next (3a9dd3ecb207 kconfig: make 'imply' obey the direct=
 dependency)
Merging compiler-attributes/compiler-attributes (98d54f81e36b Linux 5.6-rc4)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (053c3b10f6d1 Merge branch 'arm-dma-bus-limit'=
 into dma-mapping-for-next)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (143e522dec96 Merge branch 'devel-stable' into for-nex=
t)
Merging arm64/for-next/core (28c11197bf8d Merge branch 'for-next/bti' into =
for-next/core)
Merging arm-perf/for-next/perf (29cc4ceeac12 arm64: perf: Support new DT co=
mpatibles)
Merging arm-soc/for-next (09e7f9a4c8e2 Merge branch 'arm/fixes' into for-ne=
xt)
Merging amlogic/for-next (6e6ede5f454d Merge branch 'v5.7/drivers' into tmp=
/aml-rebuild)
Merging aspeed/for-next (de285b938cf3 ARM: dts: aspeed: ast2600: Fix SCU IR=
Q controller nodes)
Merging at91/at91-next (7448f052c816 Merge branches 'at91-soc', 'at91-dt' a=
nd 'at91-defconfig' into at91-next)
Merging imx-mxs/for-next (e506dba69a5e Merge branch 'imx/defconfig' into fo=
r-next)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging keystone/next (560b4d4691b0 Merge branch 'for_5.7/keystone-dts' int=
o next)
Merging mediatek/for-next (28f0b8961045 Merge branch 'v5.6-next/soc' into f=
or-next)
Merging mvebu/for-next (912e10bb5888 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (babf67165e40 Merge branch 'fixes' into for-next)
Merging qcom/for-next (92ea12372ed6 Merge branches 'arm64-for-5.7', 'arm64-=
defconfig-for-5.7', 'defconfig-for-5.7', 'drivers-for-5.7' and 'dts-for-5.7=
' into for-next)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging raspberrypi/for-next (d886ff4d2a6a ARM: dts: bcm2711: Move emmc2 in=
to its own bus)
Merging realtek/for-next (45698e00d5a9 Merge branch 'v5.6/dt' into next)
Merging renesas/next (bf4540d5148c Merge branch 'renesas-arm64-dt-for-v5.7'=
 into renesas-next)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging reset/reset/next (2ebf89fd4ecf reset: hi6220: Add support for AO re=
set controller)
Merging rockchip/for-next (c018aff1a201 Merge branch 'v5.7-armsoc/dts64' in=
to for-next)
Merging samsung-krzk/for-next (ec793c394501 Merge branch 'next/dt' into for=
-next)
Merging scmi/for-linux-next (b48c74f4e139 Merge tag 'scmi-updates-5.7' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging sunxi/sunxi/for-next (8afff9da61ea Merge branch 'sunxi/dt-for-5.7' =
into sunxi/for-next)
Merging tegra/for-next (43d84418d537 Merge branch for-5.7/arm64/dt into for=
-next)
Merging clk/clk-next (0e394a6c55de Merge branch 'clk-qcom' into clk-next)
Merging clk-samsung/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (0ef5b782a807 csky: Enable the gcov function in csk=
y achitecture)
Merging h8300/h8300-next (a5de8865cb3e h8300: move definition of __kernel_s=
ize_t etc. to posix_types.h)
Merging ia64/next (172e7890406d tty/serial: cleanup after ioc*_serial drive=
r removal)
Merging m68k/for-next (86cded5fc525 m68k: defconfig: Update defconfigs for =
v5.6-rc4)
Merging m68knommu/for-next (edff6aba9400 m68k: Replace setup_irq() by reque=
st_irq())
Merging microblaze/next (9fd1a1c9b3f2 microblaze: Replace setup_irq() by re=
quest_irq())
Merging mips/mips-next (be2807643302 MIPS: c-r4k: Invalidate BMIPS5000 ZSCM=
 prefetch lines)
Merging nds32/next (d785c5a324cd nds32: configs: Cleanup CONFIG_CROSS_COMPI=
LE)
Merging nios2/for-next (051d75d3bb31 MAINTAINERS: Update Ley Foon Tan's ema=
il address)
Merging openrisc/for-next (d95b56c77efd openrisc: Cleanup copy_thread_tls d=
ocs and comments)
Merging parisc-hd/for-next (8a29e21d8cb0 parisc: Replace setup_irq() by req=
uest_irq())
Merging powerpc/next (59ed2adf3931 powerpc/lib: Fix emulate_step() std test)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (6a7f10c79574 soc: fsl: dpio: fix dereference of point=
er p before null check)
Merging risc-v/for-next (9f40b6e77d2f RISC-V: Move all address space defini=
tion macros to one place)
Merging sifive/for-next (467e050e9760 Merge branch 'i2c/for-current' of git=
://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging s390/features (bb533ec8bacd s390/config: do not select VIRTIO_CONSO=
LE via Kconfig)
Merging sh/sh-next (a193018e5290 sh: add missing EXPORT_SYMBOL() for __dela=
y)
Merging sparc-next/master (b71acb0e3721 Merge branch 'linus' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging uml/linux-next (d65197ad5249 um: Fix time-travel=3Dinf-cpu with xor=
/raid6)
Merging xtensa/xtensa-for-next (2ef7e1268525 Merge branch 'xtensa-5.6-fixes=
' into xtensa-for-next)
Merging fscrypt/master (98d54f81e36b Linux 5.6-rc4)
Merging afs/afs-next (4fe171bb81b1 afs: Remove set but not used variable 'r=
et')
Merging btrfs/for-next (cbcef89c499e Merge branch 'for-next-next-v5.6-20200=
313' into for-next-20200313)
Merging ceph/master (3b20bc2fe4c0 ceph: noacl mount option is effectively i=
gnored)
Merging cifs/for-next (e2e79d847b4d SMB3: Minor cleanup of protocol definit=
ions)
Merging configfs/for-next (e2f238f7d5a1 configfs: calculate the depth of pa=
rent item)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (aa99a76b40d6 erofs: handle corrupted images whose decomp=
ressed size less than it'd be)
Merging ext3/for_next (32302085a8d9 ext2: fix debug reference to ext2_xattr=
_cache)
Merging ext4/dev (dce8e237100f ext4: fix a data race at inode->i_disksize)
Merging f2fs/dev (2536ac6872e5 f2fs: allow to clear F2FS_COMPR_FL flag)
Merging fsverity/fsverity (98d54f81e36b Linux 5.6-rc4)
Merging fuse/for-next (3e8cb8b2eaeb fuse: fix stack use after return)
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (3cab1854b0c0 nfs: Fix up documentation in nfs_follo=
w_referral() and nfs_do_submount())
Merging nfs-anna/linux-next (55dee1bc0d72 nfs: add minor version to nfs_ser=
ver_key for fscache)
Merging nfsd/nfsd-next (2653de9f0398 fs: nfsd: fileache.c: Use built-in RCU=
 list checking)
Merging orangefs/for-next (9f198a2ac543 help_next should increase position =
index)
Merging overlayfs/overlayfs-next (a5a84682ecb6 ovl: fix a typo in comment)
Merging ubifs/linux-next (fe357dbae113 ubi: Fix an error pointer dereferenc=
e in error handling code)
Merging v9fs/9p-next (79fb9216b7be 9p: Remove unneeded semicolon)
Merging xfs/for-next (faf8ee8476c1 xfs: xfs_dabuf_map should return ENOMEM =
when map allocation fails)
Merging zonefs/for-next (0dda2ddb7ded zonefs: select FS_IOMAP)
Merging iomap/iomap-for-next (1ac994525b9d iomap: Remove pgoff from tracepo=
ints)
Merging djw-vfs/vfs-for-next (3253d9d09337 splice: only read in as much inf=
ormation as there is pipe buffer space)
Merging file-locks/locks-next (f40e865842ae locks: reinstate locks_delete_b=
lock optimization)
Merging vfs/for-next (7440cd5bdd9b Merge branches 'work.do_last' and 'work.=
exfat' into for-next)
Merging printk/for-next (d34f14ae521f Merge branch 'for-5.7-preferred-conso=
le' into for-next)
Merging pci/next (74f52f957efc Merge branch 'remotes/lorenzo/pci/vmd')
Merging pstore/for-next/pstore (8128d3aac0ee pstore/ram: Replace zero-lengt=
h array with flexible-array member)
Merging hid/for-next (d3934f252be4 Merge branch 'for-5.6/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (ab0dbccad5fd Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i3c/i3c/next (cd851485ef29 i3c: master: Replace zero-length array w=
ith flexible-array member)
Merging dmi/master (6eaaa9e89719 firmware/dmi: Report DMI Bios & EC firmwar=
e release)
Merging hwmon-staging/hwmon-next (b1fbe673b89e hwmon: (pmbus/ibm-cffps) Add=
 another PSU CCIN to version detection)
Merging jc_docs/docs-next (7d3d3254adaa docs: fix pointers to io-mapping.rs=
t and io_ordering.rst files)
CONFLICT (content): Merge conflict in Documentation/kbuild/index.rst
CONFLICT (content): Merge conflict in Documentation/filesystems/zonefs.rst
CONFLICT (content): Merge conflict in Documentation/filesystems/proc.rst
Merging v4l-dvb/master (6fafbbe8d414 device property: Export fwnode_get_nam=
e())
Merging v4l-dvb-next/master (54ecb8f7028c Linux 5.4-rc1)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (4a13723c325c Merge branch 'pnp' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (74a189ef0790 cpufreq: imx6q-cpu=
freq: Improve the logic of -EPROBE_DEFER handling)
Merging cpupower/cpupower (2de7fb60a474 cpupower: avoid multiple definition=
 with gcc -fno-common)
Merging opp/opp/linux-next (03758d60265c opp: Replace list_kref with a loca=
l counter)
Merging thermal/thermal/linux-next (0bf3a650ab8d thermal: qoriq: Fix a comp=
iling issue)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (a48f9721e6db dlm: no need to check return value of debugf=
s_create functions)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (9e57a9aa694c RDMA/hns: Fix wrong judgments of udata-=
>outlen)
Merging net-next/master (86e85bf6981c sfc: fix XDP-redirect in this driver)
CONFLICT (content): Merge conflict in fs/sysfs/group.c
Merging bpf-next/master (483d7a30f538 bpf, libbpf: Fix ___bpf_kretprobe_arg=
s1(x) macro definition)
Merging ipsec-next/master (dda520c4d462 ESP: Export esp_output_fill_trailer=
 function)
Merging mlx5-next/mlx5-next (826096d84f50 mlx5: Remove uninitialized use of=
 key in mlx5_core_create_mkey)
Merging netfilter-next/master (8537f78647c0 netfilter: Introduce egress hoo=
k)
Merging ipvs-next/master (d54725cd11a5 netfilter: nf_tables: support for mu=
ltiple devices per netdev hook)
Merging wireless-drivers-next/master (377c0a94ad1c Merge ath-next from git:=
//git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git)
Merging bluetooth/master (905d7b13112d Bluetooth: btusb: print Intel fw bui=
ld version in power-on boot)
Merging mac80211-next/master (2786ad5fb234 cfg80211: fix documentation form=
at)
Merging gfs2/for-next (490031281d5a gfs2: Additional information when gfs2_=
ail1_flush withdraws)
Merging mtd/mtd/next (4da0ea71ea93 mtd: lpddr: Fix a double free in probe())
Merging nand/nand/next (9f9ae0c253c1 mtd: spinand: micron: Add new Micron S=
PI NAND devices with multiple dies)
Merging spi-nor/spi-nor/next (829ec6408dc5 mtd: spi-nor: Trim what is expos=
ed in spi-nor.h)
Merging crypto/master (0eae14a067c5 crypto: ccree - refactor AEAD IV in AAD=
 handling)
Merging drm/drm-next (69ddce0970d9 Merge tag 'amd-drm-next-5.7-2020-03-10' =
of git://people.freedesktop.org/~agd5f/linux into drm-next)
CONFLICT (content): Merge conflict in arch/arm/configs/omap2plus_defconfig
Merging amdgpu/drm-next (3d3d3e267c3b drm/amdgpu/display: fix logic inversi=
on in program_timing_sync())
Merging drm-intel/for-linux-next (a639b0c15065 drm/i915/perf: Invalidate OA=
 TLB on when closing perf stream)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_request.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_perf.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gvt/vgpu.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gvt/display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_workaro=
unds.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_lrc.c
Merging drm-tegra/drm/tegra/for-next (e32c8c2a5fbe drm/tegra: hdmi: Silence=
 deferred-probe error)
Merging drm-misc/for-linux-next (e1cf35b94c5f drm/edid: fix building error)
Merging drm-msm/msm-next (5f9935f514d6 drm/msm: Fix error about comments wi=
thin a comment block)
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (2c76b324c794 drm/imx: parallel-display: Adjus=
t bus_flags handling)
Merging etnaviv/etnaviv/next (1442d81fef99 drm/etnaviv: Replace zero-length=
 array with flexible-array member)
Merging regmap/for-next (2060986f04ad Merge branch 'regmap-5.7' into regmap=
-next)
Merging sound/for-next (55f7326170d9 ALSA: usb-audio: Create a registration=
 quirk for Kingston HyperX Amp (0951:16d8))
Merging sound-asoc/for-next (3326e6767e69 Merge branch 'asoc-5.7' into asoc=
-next)
Merging modules/modules-next (0f74226649fb kernel: module: Replace zero-len=
gth array with flexible-array member)
Merging input/next (061706716384 Input: elants_i2c - report resolution info=
rmation for touch major)
Merging block/for-next (7c076f2412a5 Merge branch 'for-5.7/drivers' into fo=
r-next)
Merging device-mapper/for-next (636be4241bdd dm: bump version of core and v=
arious targets)
Merging pcmcia/pcmcia-next (6d3fbe919b83 pcmcia: Use scnprintf() for avoidi=
ng potential buffer overflow)
Merging mmc/next (09f8f082dcda Merge branch 'fixes' into next)
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (1129d6145ed5 mfd: Add support for Azoteq IQS620A/=
621/622/624/625)
Merging backlight/for-backlight-next (7af43a76695d backlight: qcom-wled: Fi=
x unsigned comparison to zero)
Merging battery/for-next (f78c55e3b480 power: reset: sc27xx: Allow the SC27=
XX poweroff driver building into a module)
Merging regulator/for-next (d45eed15a915 Merge branch 'regulator-5.7' into =
regulator-next)
Merging security/next-testing (3e27a33932df security: remove duplicated inc=
lude from security.h)
Merging apparmor/apparmor-next (01df52d726b5 apparmor: remove duplicate che=
ck of xattrs on profile attachment.)
Merging integrity/next-integrity (9e2b4be377f0 ima: add a new CONFIG for lo=
ading arch-specific policies)
Merging keys/keys-next (43672cf93c6d Merge branch 'notifications-pipe-core'=
 into keys-next)
CONFLICT (content): Merge conflict in fs/pipe.c
Applying: io_uring: fix up for get_pipe_info() API change
Merging selinux/next (28d4d0e16f09 When using NFSv4.2, the security label f=
or the root inode should be set via a call to nfs_setsecurity() during the =
mount process, otherwise the inode will appear as unlabeled for up to acdir=
min seconds.  Currently the label for the root inode is allocated, retrieve=
d, and freed entirely witin nfs4_proc_get_root().)
CONFLICT (content): Merge conflict in security/selinux/hooks.c
Merging smack/for-next (92604e825304 smack: use GFP_NOFS while holding inod=
e_smack::smk_lock)
Merging tomoyo/master (bb6d3fb354c5 Linux 5.6-rc1)
Merging tpmdd/next (2e356101e72a KEYS: reaching the keys quotas correctly)
Merging watchdog/master (fb33c6510d55 Linux 5.6-rc6)
Merging iommu/next (f59e82a0c583 Merge branches 'iommu/fixes', 'arm/qcom', =
'arm/omap', 'x86/amd', 'virtio' and 'core' into next)
Merging vfio/next (7b5372ba04ca vfio: platform: fix __iomem in vfio_platfor=
m_amdxgbe.c)
Merging audit/next (1320a4052ea1 audit: trigger accompanying records when n=
o rules present)
Merging devicetree/for-next (d047cd8a2760 scripts/dtc: Update to upstream v=
ersion v1.6.0-2-g87a656ae5ff9)
Merging mailbox/mailbox-for-next (c6c6bc6ea9fc mailbox: imx: add support fo=
r imx v1 mu)
Merging spi/for-next (c201211a59a2 Merge branch 'spi-5.7' into spi-next)
Merging tip/auto-latest (3168392536d3 Merge branch 'irq/core')
CONFLICT (content): Merge conflict in include/linux/arch_topology.h
CONFLICT (content): Merge conflict in arch/x86/Kconfig
CONFLICT (content): Merge conflict in arch/arm64/Kconfig
Merging clockevents/timers/drivers/next (4f41fe386a94 clocksource/drivers/t=
imer-probe: Avoid creating dead devices)
Merging edac/edac-for-next (ad49d9a8228e Merge branch 'edac-misc' into edac=
-for-next)
Merging irqchip/irq/irqchip-next (4c39aa685ef5 Merge branch 'irq/gic-v4.1' =
into irq/irqchip-next)
Merging ftrace/for-next (bbd9d05618a6 gpu/trace: add a gpu total memory usa=
ge tracepoint)
Merging rcu/rcu/next (8e97ee7a3a2a rcu-tasks: Add a grace-period start time=
 for throttling and debug)
Merging kvm/linux-next (1c482452d5db Merge tag 'kvm-s390-next-5.7-1' of git=
://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging kvm-arm/next (8c89fd18102a Merge branch 'kvm-arm64/gic-v4.1' of git=
://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms into kvmarm-ma=
ster/next)
Merging kvm-ppc/kvm-ppc-next (fd24a8624eb2 KVM: PPC: Book3S PR: Fix -Werror=
=3Dreturn-type build failure)
Merging kvms390/next (67be63628222 KVM: s390: mark sie block as 512 byte al=
igned)
Merging xen-tip/linux-next (e63de44d28ca xen/xenbus: remove unused xenbus_m=
ap_ring())
Merging percpu/for-next (cfe2a689f755 Merge branch 'for-5.7' into for-next)
Merging workqueues/for-next (4acf8a423cd3 Merge branch 'for-5.7' into for-n=
ext)
Merging drivers-x86/for-next (8d92e160dd8f platform/x86: Kconfig: Fix a typ=
o)
Merging chrome-platform/for-next (a88214089d67 platform/chrome: cros_usbpd_=
notify: Pull PD_HOST_EVENT status)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (dd47a83453e4 leds: pwm: convert to atomic PWM API)
Merging ipmi/for-next (26455d00ee58 drivers: char: ipmi: ipmi_msghandler: P=
ass lockdep expression to RCU lists)
Merging driver-core/driver-core-next (4a33691c4cea cpu-topology: Fix the po=
tential data corruption)
Merging usb/usb-next (b80e3e813b3a Merge tag 'usb-ci-v5.7-rc1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb into usb-next)
CONFLICT (content): Merge conflict in drivers/usb/host/xhci-tegra.c
CONFLICT (content): Merge conflict in drivers/usb/gadget/udc/tegra-xudc.c
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/usb=
/generic.txt
Applying: phy: tegra: fix up for set_role API change
Merging usb-gadget/next (4a5dbd900957 dt-bindings: usb: add documentation f=
or aspeed usb-vhub)
Merging usb-serial/usb-next (615e58ccfbc0 USB: serial: fix tty cleanup-op k=
ernel-doc)
Merging usb-chipidea-next/ci-for-usb-next (d9958306d4be USB: chipidea: Use =
the correct style for SPDX License Identifier)
Merging phy-next/next (6c21053e2a30 phy: ti: gmii-sel: add support for am65=
4x/j721e soc)
Merging tty/tty-next (c3a834e87c2c vt: indent switch-case in setterm_comman=
d properly)
Merging char-misc/char-misc-next (2cca608ad9eb tty: reorganize tty & serial=
 menus)
Merging extcon/extcon-next (87ccafd3bd64 extcon: palmas: Hide error message=
s if gpio returns -EPROBE_DEFER)
Merging soundwire/next (0b43fef979b4 soundwire: stream: use sdw_write inste=
ad of update)
Merging thunderbolt/next (3010518964dc thunderbolt: Use scnprintf() for avo=
iding potential buffer overflow)
Merging staging/staging-next (c15e7f072288 staging: rtl8712: Fixes for simp=
le typos in C comments)
CONFLICT (modify/delete): drivers/staging/exfat/Kconfig deleted in staging/=
staging-next and modified in HEAD. Version HEAD of drivers/staging/exfat/Kc=
onfig left in tree.
CONFLICT (content): Merge conflict in MAINTAINERS
$ git rm -f drivers/staging/exfat/Kconfig
Merging mux/for-next (f356d58c3a04 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (03c4e6186bbb interconnect: qcom: Add OSM L3 support o=
n SC7180)
Merging slave-dma/next (3a5a8a27545d dmaengine: ppc4xx: Use scnprintf() for=
 avoiding potential buffer overflow)
CONFLICT (content): Merge conflict in drivers/dma/ti/k3-udma.c
Merging cgroup/for-next (6fc331767f41 Merge branch 'for-5.7' into for-next)
Merging scsi/for-next (93615c72d129 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (9b88984658fb scsi: pm80xx: Introduce read and wr=
ite length for IOCTL payload structure)
Merging vhost/linux-next (d40662d5f12b virtio-net: Introduce hash report fe=
ature)
Merging rpmsg/for-next (2bbad2db0749 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (9cd0c5e02ee4 Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (e26805ab7637 tools: gpio-hammer: Apply scr=
ipts/Lindent and retain good changes)
Merging gpio-intel/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging pinctrl/for-next (ab5644db943f Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (2c523b344dfa Linux 5.6-rc5)
Merging pinctrl-samsung/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging pwm/for-next (9871abffc810 pwm: Remove set but not set variable 'pw=
m')
Merging userns/for-next (a0d4a141750d Proc mount option handling is broken,=
 and it has been since I accidentally broke it in the middle 2016.)
CONFLICT (content): Merge conflict in kernel/pid.c
Merging ktest/for-next (1091c8fce8aa ktest: Fix typos in ktest.pl)
Merging random/dev (e00d996a4317 random: fix data races at timer_rand_state)
Merging kselftest/next (fb0bb3952401 selftests: android: Fix custom install=
 from skipping test progs)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (d28b4c1b2b3d Merge branch 'for-5.6/selftests=
' into for-next)
Merging coresight/next (6e5a7668aec0 coresight: docs: Add information about=
 the topology representations)
Merging rtc/rtc-next (30a790653d8a rtc: mt2712: fix build without PM_SLEEP)
Merging nvdimm/libnvdimm-for-next (7b27a8622f80 libnvdimm/e820: Retrieve an=
d populate correct 'target_node' info)
Merging at24/at24/for-next (4837621cd61e eeprom: at24: add TPF0001 ACPI ID =
for 24c1024 device)
Merging ntb/ntb-next (b350f0a3eb26 NTB: add pci shutdown handler for AMD NT=
B)
Merging kspp/for-next/kspp (c79f46a28239 Linux 5.5-rc5)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (f8788d86ab28 Linux 5.6-rc3)
Merging fsi/next (2c01397b71c5 fsi: aspeed: Fix OPB0 byte order register va=
lues)
CONFLICT (content): Merge conflict in drivers/fsi/Kconfig
Merging slimbus/for-next (ba1589ff458e slimbus: ngd: add v2.1.0 compatible)
Merging nvmem/for-next (c609408c27be nvmem: jz4780-efuse: fix build warning=
s on ARCH=3Dx86_64 or riscv)
Merging xarray/xarray (7e934cf5ace1 xarray: Fix early termination of xas_fo=
r_each_marked)
Merging hyperv/hyperv-next (40d1d2d6e89e HID: hyperv: NULL check before som=
e freeing functions is not needed.)
Merging auxdisplay/auxdisplay (2f920c0f0e29 auxdisplay: charlcd: replace ze=
ro-length array with flexible-array member)
Merging kgdb/kgdb/for-next (5ea771abd5a3 kdb: Censor attempts to set PROMPT=
 without ENABLE_MEM_READ)
Merging pidfd/for-next (8d19f1c8e193 prctl: PR_{G,S}ET_IO_FLUSHER to suppor=
t controlling memory reclaim)
Merging devfreq/devfreq-next (d8923c0e8822 PM / devfreq: Fix handling dev_p=
m_qos_remove_request result)
Merging hmm/hmm (f574fc138a4d mm/hmm: merge hmm_vma_do_fault into into hmm_=
vma_fault())
Merging fpga/for-next (2fb2e7cdfbb0 arm64: dts: agilex: correct service lay=
er driver's compatible value)
Merging kunit/test (bb6d3fb354c5 Linux 5.6-rc1)
Merging cel/cel-next (7dd61c6e0272 nfsd: remove read permission bit for ctl=
 sysctl)
CONFLICT (content): Merge conflict in net/sunrpc/cache.c
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (b6fe8bc67d2d mtd: hyperbus: move direct mapping setup=
 to AM654 HBMC driver)
Merging kunit-next/kunit (2c523b344dfa Linux 5.6-rc5)
Merging trivial/for-next (7901b6e4e6ec blk-mq: Fix typo in comment)
Merging akpm-current/current (ab50bf16698e ipc/mqueue.c: fix a brace coding=
 style issue)
CONFLICT (content): Merge conflict in arch/x86/Kconfig
CONFLICT (content): Merge conflict in arch/microblaze/include/asm/Kbuild
CONFLICT (content): Merge conflict in arch/m68k/include/asm/Kbuild
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/dma/tegra20-apb-dma.c: fix platform_get_irq.cocci warnings
Applying: mm/frontswap: mark various intentional data races
Applying: mm/page_io: mark various intentional data races
Applying: mm-page_io-mark-various-intentional-data-races-v2
Applying: mm/swap_state: mark various intentional data races
Applying: mm/filemap.c: fix a data race in filemap_fault()
Applying: mm/swapfile: fix and annotate various data races
Applying: mm-swapfile-fix-and-annotate-various-data-races-v2
Applying: mm/page_counter: fix various data races at memsw
Applying: mm/memcontrol: fix a data race in scan count
Applying: mm/list_lru: fix a data race in list_lru_count_one
Applying: mm/mempool: fix a data race in mempool_free()
Applying: mm/util.c: annotate an data race at vm_committed_as
Applying: mm/rmap: annotate a data race at tlb_flush_batched
Applying: mm: annotate a data race in page_zonenum()
Applying: mm/swap.c: annotate data races for lru_rotate_pvecs
Applying: mm/memory.c: refactor insert_page to prepare for batched-lock ins=
ert
Applying: mm: bring sparc pte_index() semantics inline with other platforms
Applying: mm: define pte_index as macro for x86
Applying: mm/memory.c: add vm_insert_pages()
Applying: mm-add-vm_insert_pages-fix
Applying: add missing page_count() check to vm_insert_pages().
Applying: mm: vm_insert_pages() checks if pte_index defined.
Applying: net-zerocopy: use vm_insert_pages() for tcp rcv zerocopy
Applying: net-zerocopy-use-vm_insert_pages-for-tcp-rcv-zerocopy-fix
Applying: mm/vma: define a default value for VM_DATA_DEFAULT_FLAGS
Applying: mm/vma: introduce VM_ACCESS_FLAGS
Applying: mm/memory_hotplug: drop the flags field from struct mhp_restricti=
ons
Applying: mm/memory_hotplug: rename mhp_restrictions to mhp_params
Applying: x86/mm: thread pgprot_t through init_memory_mapping()
Applying: x86/mm: introduce __set_memory_prot()
Applying: powerpc/mm: thread pgprot_t through create_section_mapping()
Applying: mm/memory_hotplug: add pgprot_t to mhp_params
Applying: mm/memremap: set caching mode for PCI P2PDMA memory to WC
Applying: mm/special: create generic fallbacks for pte_special() and pte_mk=
special()
Applying: mm-special-create-generic-fallbacks-for-pte_special-and-pte_mkspe=
cial-v3
Applying: mm/debug: add tests validating architecture page table helpers
Applying: kmod: make request_module() return an error when autoloading is d=
isabled
Applying: fs/filesystems.c: downgrade user-reachable WARN_ONCE() to pr_warn=
_once()
Applying: docs: admin-guide: document the kernel.modprobe sysctl
Applying: selftests: kmod: test disabling module autoloading
Applying: fs/seq_file.c: seq_read(): add info message about buggy .next fun=
ctions
Applying: seq_read-info-message-about-buggy-next-functions-fix
Applying: kernel/gcov/fs.c: gcov_seq_next() should increase position index
Applying: ipc/util.c: sysvipc_find_ipc() should increase position index
Applying: drivers/tty/serial/sh-sci.c: suppress warning
Applying: drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer ove=
rflow
Merging akpm/master (69b7f9ca371e drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/AyY42yYw.0WUPuNGxeJTM6C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5yAWAACgkQAVBC80lX
0GwBpwf8CLXSJ3E1tL3xepjckzdO3OcC6YcX8Ndpx0fZTxoANzNJRs48zbksdToj
K+zemMF55hl3ZBvaKfB+rONBBOWUriofx7ZYf0x+A2qYvcsGhq2O6YpfMxH3LiPF
Puxjh/abxYwTipIfPde6epj78jdZOmTIc1ZgEusDbyeE8QdO0R/1I+wuP3U7GOf+
BfL3vOCyhWfMWwmZMbUhYOWhqGi0+Nvzq1l3TFMrjSbyG6Kj4mzy3aMPF7RQ9Rkh
BSvgpdGRrm2eKteTQfahaOcOTAkblYFUvIkLXt+BJr3FtYVNxz/bpBwU1cmsZSf6
anTSyiciboGbDaGJPw4tvuM6wqDVXQ==
=Fqyz
-----END PGP SIGNATURE-----

--Sig_/AyY42yYw.0WUPuNGxeJTM6C--
