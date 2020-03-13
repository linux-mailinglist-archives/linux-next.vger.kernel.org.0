Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 901EE18456F
	for <lists+linux-next@lfdr.de>; Fri, 13 Mar 2020 12:03:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbgCMLDT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Mar 2020 07:03:19 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:46471 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726387AbgCMLDT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 13 Mar 2020 07:03:19 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48f2qN284sz9sQx;
        Fri, 13 Mar 2020 22:03:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584097392;
        bh=ENvhsTxNqpEL5TQWpeAyTbnkCp2Bgk76UcCGYIdN3Q4=;
        h=Date:From:To:Cc:Subject:From;
        b=txXLrDdAMHgvvhqzs+ZRrGIEXv6yGg4T7TZc8YQ5QJXbHk8Bm55ZZWH2FvNThrvLg
         3S01J5paj+xSkJYdHslMXbIINGlVBqhM1kf//XCinr6hihE8cnjzMUHZyVKThUinv8
         34F0UK6UISuZPXAhcXa3dNFD1nVJx+2bokIc9Z83xOdvQf/spQwxwclV37TnG+roVK
         YFsqo6BHevChbq16pF9qI/PV6ZxF78Tm5eEloa2tSsUzLFLEFj3Jf7zxb3oimeh/kN
         BV3cm5JD0kzb6S//jFlZQQT5J+8H9jImBUHx/eB4+zw2g0elj+q0PVrmRvenw62ypt
         Ug4s097wODjHA==
Date:   Fri, 13 Mar 2020 22:03:10 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 13
Message-ID: <20200313220310.0a49ac5f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ki/pxCg6NcReRuZ.ssw0K4F";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ki/pxCg6NcReRuZ.ssw0K4F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20200312:

New tree: cfi

The kbuild tree still had its build failure for which I applied a
supplied patch.

The renesas tree gained a conflict against the qcom tree.

The pci tree gained a build failure so I used the version from
next-20200312.

The v4l-dvb tree gained a build failure so I used the version from
next-20200312.

The bpf-next tree gained a conflict against the jc_docs tree.

The netfilter-next tree gained a conflict against the net-next tree.

The block tree lost its build failure.

The tip tree gained a conflict against the integrity tree.

The akpm-current tree gained a conflict against the integrity tree.

Non-merge commits (relative to Linus' tree): 7777
 6894 files changed, 298939 insertions(+), 150163 deletions(-)

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
Merging origin/master (3cc6e2c599cd Merge tag 'for-linus-5.6-2' of git://gi=
thub.com/cminyard/linux-ipmi)
Merging fixes/master (eb239a5f369f evh_bytechan: fix out of bounds accesses)
Merging kbuild-current/fixes (98d54f81e36b Linux 5.6-rc4)
Merging arc-current/for-curr (8d92e992a785 ARC: define __ALIGN_STR and __AL=
IGN symbols for ARC)
Merging arm-current/fixes (89604523a76e ARM: 8961/2: Fix Kbuild issue cause=
d by per-task stack protector GCC plugin)
Merging arm-soc-fixes/arm/fixes (d4d89e25fc7b Merge tag 'socfpga_defconfig_=
fix_for_v5.6' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/lin=
ux into arm/fixes)
Merging arm64-fixes/for-next/fixes (9abd515a6e4a arm64: context: Fix ASID l=
imit in boot messages)
Merging m68k-current/for-linus (6aabc1facdb2 m68k: Implement copy_thread_tl=
s())
Merging powerpc-fixes/fixes (59bee45b9712 powerpc/mm: Fix missing KUAP disa=
ble in flush_coherent_icache())
Merging s390-fixes/fixes (9218b36d767a s390/diag: fix display of diagnose c=
all statistics)
Merging sparc/master (11648b8339f8 sparc64: fix adjtimex regression)
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (b09fe70ef520 taprio: Fix sending packets without dequeu=
eing them)
Merging bpf/master (90db6d772f74 bpf, sockmap: Remove bucket->lock from soc=
k_{hash|map}_free)
Merging ipsec/master (d1d17a359ce6 esp: remove the skb from the chain when =
it's enqueued in cryptd_wq)
Merging netfilter/master (b723bd933980 net: stmmac: dwmac1000: Disable ACS =
if enhanced descs are not used)
Merging ipvs/master (c24b75e0f923 ipvs: move old_secure_tcp into struct net=
ns_ipvs)
Merging wireless-drivers/master (e2e57291097b wlcore: remove stray plus sig=
n)
Merging mac80211/master (ba32679cac50 mac80211: Do not send mesh HWMP PREQ =
if HWMP is disabled)
Merging rdma-fixes/for-rc (2c523b344dfa Linux 5.6-rc5)
Merging sound-current/for-linus (5461e0530c22 ALSA: pcm: oss: Remove WARNIN=
G from snd_pcm_plug_alloc() checks)
Merging sound-asoc-fixes/for-linus (20370e3ada38 Merge branch 'asoc-5.6' in=
to asoc-linus)
Merging regmap-fixes/for-linus (d29456d34def Merge branch 'regmap-5.6' into=
 regmap-linus)
Merging regulator-fixes/for-linus (2339289c9c69 Merge branch 'regulator-5.6=
' into regulator-linus)
Merging spi-fixes/for-linus (2c523b344dfa Linux 5.6-rc5)
Merging pci-current/for-linus (5901b51f3e5d MAINTAINERS: Correct Cadence PC=
I driver path)
Merging driver-core.current/driver-core-linus (2c523b344dfa Linux 5.6-rc5)
Merging tty.current/tty-linus (2c523b344dfa Linux 5.6-rc5)
Merging usb.current/usb-linus (b433e340e756 usb: host: xhci-plat: add a shu=
tdown)
Merging usb-gadget-fixes/fixes (42cd5ffe46c1 usb: dwc3: debug: fix string p=
osition formatting mixup with ret and len)
Merging usb-serial-fixes/usb-linus (cecc113c1af0 USB: serial: pl2303: add d=
evice-id for HP LD381)
Merging usb-chipidea-fixes/ci-for-usb-stable (7cbf3dd3139a usb: chipidea: u=
dc: fix sleeping function called from invalid context)
Merging phy/fixes (be4e3c737eeb phy: mapphone-mdm6600: Fix timeouts by addi=
ng wake-up handling)
Merging staging.current/staging-linus (ac42c12dd752 staging: wfx: fix RCU u=
sage between hif_join() and ieee80211_bss_get_ie())
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
Merging v4l-dvb-fixes/fixes (ec14a914b844 media: venus: firmware: Ignore se=
cure call error on first resume)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (f7d5f5655ef7 MAINTAINERS: Correct MIPS patch=
work URL)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (1756bfe89857 Merge branch 'fix-lcdc-quirk' into f=
ixes)
Merging kvm-fixes/master (d718fdc3e752 KVM: x86: remove stale comment from =
struct x86_emulate_ctxt)
Merging kvms390-fixes/master (e93fc7b4544a KVM: s390: Also reset registers =
in sync regs for initial cpu reset)
Merging hwmon-fixes/hwmon (2c523b344dfa Linux 5.6-rc5)
Merging nvdimm-fixes/libnvdimm-fixes (96222d53842d dax: pass NOWAIT flag to=
 iomap_apply)
Merging btrfs-fixes/next-fixes (eab248b5a21d Merge branch 'misc-5.6' into n=
ext-fixes)
Merging vfs-fixes/fixes (bf4498ad3f9a tmpfs: deny and force are not huge mo=
unt options)
Merging dma-mapping-fixes/for-linus (9c24eaf81cc4 iommu/vt-d: Return the co=
rrect dma mask when we are bypassing the IOMMU)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (f8788d86ab28 Linux 5.6-rc3)
Merging samsung-krzk-fixes/fixes (0d935f0bf77d ARM: dts: exynos: Fix regula=
tor node aliasing on Midas-based boards)
Merging pinctrl-samsung-fixes/pinctrl-fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging devicetree-fixes/dt/linus (d2334a91a3b0 dt-bindings: arm: Fixup the=
 DT bindings for hierarchical PSCI states)
Merging scsi-fixes/fixes (394b61711f3c scsi: ipr: Fix softlockup when resca=
nning devices in petitboot)
Merging drm-fixes/drm-fixes (e3c3b6e66da1 Merge tag 'exynos-drm-fixes-for-v=
5.6-rc5-v2' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-ex=
ynos into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (14a0d527a479 drm/i915: Defer =
semaphore priority bumping to a workqueue)
Merging mmc-fixes/fixes (18d200460cd7 mmc: core: Respect MMC_CAP_NEED_RSP_B=
USY for eMMC sleep command)
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
Merging drm-misc-fixes/for-linux-next-fixes (9803aac7b550 drm/komeda: mark =
PM functions as __maybe_unused)
Merging kspp-gustavo/for-next/kspp (d5180902be1c firmware: google: vpd: Rep=
lace zero-length array with flexible-array member)
Merging kbuild/for-next (da64dbe8ecee modpost: return error if module is mi=
ssing ns imports and MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS=3Dn)
Applying: net: drop_monitor: use IS_REACHABLE() to guard net_dm_hw_report()
Merging compiler-attributes/compiler-attributes (98d54f81e36b Linux 5.6-rc4)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (89bb6e2ac940 ARM/dma-mapping: merge __dma_sup=
ported into arm_dma_supported)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (d46a35a9ad25 Merge branch 'devel-stable' into for-nex=
t)
Merging arm64/for-next/core (1424835a7c53 Merge branch 'for-next/asm-annota=
tions' into for-next/core)
Merging arm-perf/for-next/perf (29cc4ceeac12 arm64: perf: Support new DT co=
mpatibles)
Merging arm-soc/for-next (09e7f9a4c8e2 Merge branch 'arm/fixes' into for-ne=
xt)
Merging amlogic/for-next (340b12db7cc9 Merge branch 'v5.7/drivers' into tmp=
/aml-rebuild)
Merging aspeed/for-next (de285b938cf3 ARM: dts: aspeed: ast2600: Fix SCU IR=
Q controller nodes)
Merging at91/at91-next (7448f052c816 Merge branches 'at91-soc', 'at91-dt' a=
nd 'at91-defconfig' into at91-next)
Merging imx-mxs/for-next (4559a11e48d5 Merge branch 'imx/defconfig' into fo=
r-next)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging keystone/next (560b4d4691b0 Merge branch 'for_5.7/keystone-dts' int=
o next)
Merging mediatek/for-next (28f0b8961045 Merge branch 'v5.6-next/soc' into f=
or-next)
Merging mvebu/for-next (c0d03b53ef47 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (b6bb79e88514 Merge branch 'fixes' into for-next)
Merging qcom/for-next (2611bc0b358f Merge branches 'arm64-for-5.7', 'arm64-=
defconfig-for-5.7', 'defconfig-for-5.7', 'drivers-for-5.7' and 'dts-for-5.7=
' into for-next)
Merging raspberrypi/for-next (d886ff4d2a6a ARM: dts: bcm2711: Move emmc2 in=
to its own bus)
Merging realtek/for-next (45698e00d5a9 Merge branch 'v5.6/dt' into next)
Merging renesas/next (bf4540d5148c Merge branch 'renesas-arm64-dt-for-v5.7'=
 into renesas-next)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging reset/reset/next (2ebf89fd4ecf reset: hi6220: Add support for AO re=
set controller)
Merging rockchip/for-next (6795e06559b8 Merge branch 'v5.7-armsoc/dts64' in=
to for-next)
Merging samsung-krzk/for-next (ec793c394501 Merge branch 'next/dt' into for=
-next)
Merging scmi/for-linux-next (b48c74f4e139 Merge tag 'scmi-updates-5.7' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging sunxi/sunxi/for-next (8afff9da61ea Merge branch 'sunxi/dt-for-5.7' =
into sunxi/for-next)
Merging tegra/for-next (90060ae83820 Merge branch for-5.7/arm64/dt into for=
-next)
Merging clk/clk-next (5b36638c88df Merge branch 'clk-amlogic' into clk-next)
Merging clk-samsung/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (f8f35a5806f3 csky: Fixup init_fpu compile warning =
with __init)
Merging h8300/h8300-next (a5de8865cb3e h8300: move definition of __kernel_s=
ize_t etc. to posix_types.h)
Merging ia64/next (240b62d381fe ia64: remove stale paravirt leftovers)
Merging m68k/for-next (86cded5fc525 m68k: defconfig: Update defconfigs for =
v5.6-rc4)
Merging m68knommu/for-next (4e9c3950ce09 m68k: Replace setup_irq() by reque=
st_irq())
Merging microblaze/next (9fd1a1c9b3f2 microblaze: Replace setup_irq() by re=
quest_irq())
Merging mips/mips-next (ac8fd122e070 MIPS: Replace setup_irq() by request_i=
rq())
Merging nds32/next (d785c5a324cd nds32: configs: Cleanup CONFIG_CROSS_COMPI=
LE)
Merging nios2/for-next (051d75d3bb31 MAINTAINERS: Update Ley Foon Tan's ema=
il address)
Merging openrisc/for-next (d95b56c77efd openrisc: Cleanup copy_thread_tls d=
ocs and comments)
Merging parisc-hd/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging powerpc/next (247257b03b04 powerpc/numa: Remove late request for ho=
me node associativity)
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
Merging btrfs/for-next (a3b6a332e1ad Merge branch 'for-next-next-v5.6-20200=
311' into for-next-20200311)
Merging ceph/master (3b20bc2fe4c0 ceph: noacl mount option is effectively i=
gnored)
Merging cifs/for-next (6f5a333ac1d3 CIFS: Increment num_remote_opens stats =
counter even in case of smb2_query_dir_first)
Merging configfs/for-next (e2f238f7d5a1 configfs: calculate the depth of pa=
rent item)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (aa99a76b40d6 erofs: handle corrupted images whose decomp=
ressed size less than it'd be)
Merging ext3/for_next (bc36dfffd5f3 ext2: Silence lockdep warning about rec=
laim under xattr_sem)
Merging ext4/dev (dce8e237100f ext4: fix a data race at inode->i_disksize)
Merging f2fs/dev (2536ac6872e5 f2fs: allow to clear F2FS_COMPR_FL flag)
Merging fsverity/fsverity (98d54f81e36b Linux 5.6-rc4)
Merging fuse/for-next (3e8cb8b2eaeb fuse: fix stack use after return)
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (2c523b344dfa Linux 5.6-rc5)
Merging nfs-anna/linux-next (55dee1bc0d72 nfs: add minor version to nfs_ser=
ver_key for fscache)
Merging nfsd/nfsd-next (2653de9f0398 fs: nfsd: fileache.c: Use built-in RCU=
 list checking)
Merging orangefs/for-next (9f198a2ac543 help_next should increase position =
index)
Merging overlayfs/overlayfs-next (c2e87fd93396 ovl: allow remote upper)
Merging ubifs/linux-next (fe357dbae113 ubi: Fix an error pointer dereferenc=
e in error handling code)
Merging v9fs/9p-next (79fb9216b7be 9p: Remove unneeded semicolon)
Merging xfs/for-next (17bb60b74124 xfs: Use scnprintf() for avoiding potent=
ial buffer overflow)
Merging zonefs/for-next (0dda2ddb7ded zonefs: select FS_IOMAP)
Merging iomap/iomap-for-next (1ac994525b9d iomap: Remove pgoff from tracepo=
ints)
Merging djw-vfs/vfs-for-next (3253d9d09337 splice: only read in as much inf=
ormation as there is pipe buffer space)
Merging file-locks/locks-next (e2de130a568c locks: reintroduce locks_delete=
_lock shortcut)
Merging vfs/for-next (7440cd5bdd9b Merge branches 'work.do_last' and 'work.=
exfat' into for-next)
Merging printk/for-next (d34f14ae521f Merge branch 'for-5.7-preferred-conso=
le' into for-next)
Merging pci/next (a536a320bfa2 Merge branch 'remotes/lorenzo/pci/vmd')
$ git reset --hard HEAD^
Merging next-20200312 version of pci
Merging pstore/for-next/pstore (8128d3aac0ee pstore/ram: Replace zero-lengt=
h array with flexible-array member)
Merging hid/for-next (2739dca88ca7 Merge branch 'for-5.6/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (866a8a691e5d Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i3c/i3c/next (cd851485ef29 i3c: master: Replace zero-length array w=
ith flexible-array member)
Merging dmi/master (6eaaa9e89719 firmware/dmi: Report DMI Bios & EC firmwar=
e release)
Merging hwmon-staging/hwmon-next (6a096871b2be hwmon: (ibmpowernv) Use scnp=
rintf() for avoiding potential buffer overflow)
Merging jc_docs/docs-next (7d3d3254adaa docs: fix pointers to io-mapping.rs=
t and io_ordering.rst files)
CONFLICT (content): Merge conflict in Documentation/kbuild/index.rst
CONFLICT (content): Merge conflict in Documentation/filesystems/zonefs.rst
Merging v4l-dvb/master (2a9c226da9aa media: imx: imx7-media-csi: Support cl=
amping Y10 and Y12 to Y8)
$ git reset --hard HEAD^
Merging next-20200312 version of v4l-dvb
Merging v4l-dvb-next/master (54ecb8f7028c Linux 5.4-rc1)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (b5028d145af7 Merge branch 'pm-tools' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (0c868627e617 cpufreq: dt: Allow=
 platform specific intermediate callbacks)
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
Merging rdma/for-next (0aeb3622ea6f RDMA/hns: fix spelling mistake "attatch=
" -> "attach")
Merging net-next/master (a8eceea84a3a inet: Use fallthrough;)
CONFLICT (content): Merge conflict in net/ipv4/inet_diag.c
CONFLICT (content): Merge conflict in fs/sysfs/group.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/mscc/ocelot.c
Merging bpf-next/master (fb6a088e834e Merge branch 'generalize-bpf-ksym')
CONFLICT (content): Merge conflict in Documentation/admin-guide/sysctl/kern=
el.rst
Merging ipsec-next/master (dda520c4d462 ESP: Export esp_output_fill_trailer=
 function)
Merging mlx5-next/mlx5-next (e0ebd8eb36ed net/mlx5: HW bit for goto chain o=
ffload support)
Merging netfilter-next/master (bd63666189e7 netfilter: xt_IDLETIMER: clean =
up some indenting)
CONFLICT (content): Merge conflict in net/netfilter/nf_flow_table_offload.c
Merging ipvs-next/master (d54725cd11a5 netfilter: nf_tables: support for mu=
ltiple devices per netdev hook)
Merging wireless-drivers-next/master (ca44e47a2b86 ssb: Use scnprintf() for=
 avoiding potential buffer overflow)
Merging bluetooth/master (b354e6c10eaf Bluetooth: L2CAP: Fix a condition in=
 l2cap_sock_recvmsg())
Merging mac80211-next/master (a862889b18ba cfg80211: fix documentation form=
at)
Merging gfs2/for-next (cc44457f1629 gfs2: leaf_dealloc needs to allocate on=
e more revoke)
Merging mtd/mtd/next (4da0ea71ea93 mtd: lpddr: Fix a double free in probe())
Merging nand/nand/next (9f9ae0c253c1 mtd: spinand: micron: Add new Micron S=
PI NAND devices with multiple dies)
Merging spi-nor/spi-nor/next (2dcbfe365b13 mtd: spi-nor: Refactor spi_nor_r=
ead_id())
Merging crypto/master (0eae14a067c5 crypto: ccree - refactor AEAD IV in AAD=
 handling)
Merging drm/drm-next (69ddce0970d9 Merge tag 'amd-drm-next-5.7-2020-03-10' =
of git://people.freedesktop.org/~agd5f/linux into drm-next)
Merging amdgpu/drm-next (c448ed62de73 drm/amdgpu/display: fix logic inversi=
on in program_timing_sync())
Merging drm-intel/for-linux-next (175c4d9b3b9a Revert "drm/i915/tgl: Add ex=
tra hdc flush workaround")
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_request.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gvt/vgpu.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gvt/display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_workaro=
unds.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_lrc.c
Merging drm-tegra/drm/tegra/for-next (d87b2fea990c drm/tegra: dc: Silence R=
GB output deferred-probe error)
Merging drm-misc/for-linux-next (e1cf35b94c5f drm/edid: fix building error)
Merging drm-msm/msm-next (5f9935f514d6 drm/msm: Fix error about comments wi=
thin a comment block)
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (2c76b324c794 drm/imx: parallel-display: Adjus=
t bus_flags handling)
Merging etnaviv/etnaviv/next (1442d81fef99 drm/etnaviv: Replace zero-length=
 array with flexible-array member)
Merging regmap/for-next (d29456d34def Merge branch 'regmap-5.6' into regmap=
-linus)
Merging sound/for-next (3db1b00f2122 ALSA: firewire-tascam: Add missing ann=
otation for tscm_hwdep_read_locked())
Merging sound-asoc/for-next (c2807dc7c00b Merge branch 'asoc-5.7' into asoc=
-next)
Merging modules/modules-next (0f74226649fb kernel: module: Replace zero-len=
gth array with flexible-array member)
Merging input/next (061706716384 Input: elants_i2c - report resolution info=
rmation for touch major)
Merging block/for-next (a227f192663c Merge branch 'for-5.7/drivers' into fo=
r-next)
Merging device-mapper/for-next (636be4241bdd dm: bump version of core and v=
arious targets)
Merging pcmcia/pcmcia-next (71705c611263 PCMCIA/i82092: remove #if 0 block)
Merging mmc/next (d997c18ab48e mmc: sdhci: iproc: Add custom set_power() ca=
llback for bcm2711)
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (1129d6145ed5 mfd: Add support for Azoteq IQS620A/=
621/622/624/625)
Merging backlight/for-backlight-next (7af43a76695d backlight: qcom-wled: Fi=
x unsigned comparison to zero)
Merging battery/for-next (f78c55e3b480 power: reset: sc27xx: Allow the SC27=
XX poweroff driver building into a module)
Merging regulator/for-next (385377acc5a1 Merge branch 'regulator-5.7' into =
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
Merging tpmdd/next (6390677444b0 MAINTAINERS: adjust to trusted keys subsys=
tem creation)
Merging watchdog/master (44144c809e39 watchdog: da9062: Add dependency on I=
2C)
Merging iommu/next (a4909b4d377c Merge branches 'iommu/fixes', 'arm/qcom', =
'arm/omap', 'x86/amd', 'virtio' and 'core' into next)
Merging vfio/next (7b5372ba04ca vfio: platform: fix __iomem in vfio_platfor=
m_amdxgbe.c)
Merging audit/next (1320a4052ea1 audit: trigger accompanying records when n=
o rules present)
Merging devicetree/for-next (905fc6b1bfb4 dt-bindings: rcar-vin: Convert bi=
ndings to json-schema)
Merging mailbox/mailbox-for-next (c6c6bc6ea9fc mailbox: imx: add support fo=
r imx v1 mu)
Merging spi/for-next (5abd978a85f0 Merge branch 'spi-5.7' into spi-next)
Merging tip/auto-latest (12481c767130 Merge branch 'core/objtool')
CONFLICT (content): Merge conflict in include/linux/arch_topology.h
CONFLICT (content): Merge conflict in arch/x86/Kconfig
Merging clockevents/timers/drivers/next (cc2550b421aa clocksource: Replace =
setup_irq() by request_irq())
Merging edac/edac-for-next (ffa9a9758be2 Merge branch 'edac-urgent' into ed=
ac-for-next)
Merging irqchip/irq/irqchip-next (850fc6a2ae5b irqchip/sifive-plic: Add sup=
port for multiple PLICs)
Merging ftrace/for-next (2910b5aa6f54 bootconfig: Fix CONFIG_BOOTTIME_TRACI=
NG dependency issue)
Merging rcu/rcu/next (a5ba56ed4232 rcu-tasks: Add stall warnings for RCU Ta=
sks Trace)
Merging kvm/linux-next (a93236fcbe1d KVM: s390: rstify new ioctls in api.rs=
t)
Merging kvm-arm/next (e43f1331e2ef arm64: Ask the compiler to __always_inli=
ne functions used by KVM at HYP)
Merging kvm-ppc/kvm-ppc-next (fd24a8624eb2 KVM: PPC: Book3S PR: Fix -Werror=
=3Dreturn-type build failure)
Merging kvms390/next (e0d5710dc73f KVM: s390: mark sie block as 512 byte al=
igned)
Merging xen-tip/linux-next (e63de44d28ca xen/xenbus: remove unused xenbus_m=
ap_ring())
Merging percpu/for-next (cfe2a689f755 Merge branch 'for-5.7' into for-next)
Merging workqueues/for-next (4acf8a423cd3 Merge branch 'for-5.7' into for-n=
ext)
Merging drivers-x86/for-next (8d92e160dd8f platform/x86: Kconfig: Fix a typ=
o)
Merging chrome-platform/for-next (7e11f4c0c5cc platform/chrome: Kconfig: Re=
move CONFIG_ prefix from MFD_CROS_EC section)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (dd47a83453e4 leds: pwm: convert to atomic PWM API)
Merging ipmi/for-next (26455d00ee58 drivers: char: ipmi: ipmi_msghandler: P=
ass lockdep expression to RCU lists)
Merging driver-core/driver-core-next (9a2dd570591e Merge 5.6-rc5 into drive=
r-core-next)
Merging usb/usb-next (8e567ed9e244 Merge 5.6-rc5 into usb-next)
Merging usb-gadget/next (bb6d3fb354c5 Linux 5.6-rc1)
Merging usb-serial/usb-next (615e58ccfbc0 USB: serial: fix tty cleanup-op k=
ernel-doc)
Merging usb-chipidea-next/ci-for-usb-next (cbdfbda4a166 usb: chipidea: otg:=
 handling vbus disconnect event occurred during system suspend)
Merging phy-next/next (33f12efe336f phy: phy-mtk-tphy: add a new reference =
clock)
Merging tty/tty-next (cb05c6c82fb0 Merge 5.6-rc5 into tty-next)
Merging char-misc/char-misc-next (bb3a151dd427 Merge 5.6-rc5 into char-misc=
-next)
Merging extcon/extcon-next (87ccafd3bd64 extcon: palmas: Hide error message=
s if gpio returns -EPROBE_DEFER)
Merging soundwire/next (5de79ba865d7 soundwire: bus: provide correct return=
 value on error)
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
Merging cgroup/for-next (ef2289f941de Merge branch 'for-5.7' into for-next)
Merging scsi/for-next (93615c72d129 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (efa75c21c487 scsi: core: Allow non-root users to=
 perform ZBC commands)
Merging vhost/linux-next (d40662d5f12b virtio-net: Introduce hash report fe=
ature)
Merging rpmsg/for-next (2bbad2db0749 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (9cd0c5e02ee4 Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (8c97246c39b5 gpio: mxs: add COMPILE_TEST s=
upport for GPIO_MXS)
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
Merging kselftest/next (3032e3a7c7e3 selftests/resctrl: Add the test in MAI=
NTAINERS)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (d28b4c1b2b3d Merge branch 'for-5.6/selftests=
' into for-next)
Merging coresight/next (749c4ad29ea7 coresight: cti: Remove unnecessary NUL=
L check in cti_sig_type_name)
Merging rtc/rtc-next (ebc8fddc50ff rtc: ab8500: switch to rtc_time64_to_tm/=
rtc_tm_to_time64)
Merging nvdimm/libnvdimm-for-next (7b27a8622f80 libnvdimm/e820: Retrieve an=
d populate correct 'target_node' info)
Merging at24/at24/for-next (4837621cd61e eeprom: at24: add TPF0001 ACPI ID =
for 24c1024 device)
Merging ntb/ntb-next (fd8cab9aee2c NTB: add pci shutdown handler for AMD NT=
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
Merging devfreq/devfreq-next (d4aaf8643cff PM / devfreq: Fix a typo in a co=
mment)
Merging hmm/hmm (fdf8822d38ed mm/mmu_notifier: prevent unpaired invalidate_=
start and invalidate_end)
Merging fpga/for-next (2fb2e7cdfbb0 arm64: dts: agilex: correct service lay=
er driver's compatible value)
Merging kunit/test (bb6d3fb354c5 Linux 5.6-rc1)
Merging cel/cel-next (a99d8080aaf3 Linux 5.4-rc6)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (b6fe8bc67d2d mtd: hyperbus: move direct mapping setup=
 to AM654 HBMC driver)
Merging kunit-next/kunit (be886ba90cce kunit: run kunit_tool from any direc=
tory)
Merging akpm-current/current (05e265818063 ipc/mqueue.c: fix a brace coding=
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
Merging akpm/master (893619530eeb drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/ki/pxCg6NcReRuZ.ssw0K4F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5raG4ACgkQAVBC80lX
0GwE8Qf+KFktebNwl17kjlzibXaJ1m2hLAFgtY6gv8xKXW8OdmSFuOaCFlpSobwU
jkFM1BxYtrNz4hirFPGCj5oh8wwulUJT1rvfolHFVm4uSTvtqyFTf8DxS7D0dhFs
olc/ed0VYN+eim1JLevFSTWaEPV5QHfaGrIJUzyl9Zr68sgFwmxRyzyf9BVbVDfc
CvFCW294BnW8seCUgn7IEbFJ4/HKp2aEwZN1mwXqU0C3RRSwsP4haOEPD/zLYH4W
annnH9r/W6j22T4a9y3ch9M3zDnR+tm/8/6hiWRgP7HXIGdNoLLlhYFjW5a/9Alo
xhrW3Wa/yvbOG7s5xjmqd0SKixq3Vg==
=d1Re
-----END PGP SIGNATURE-----

--Sig_/ki/pxCg6NcReRuZ.ssw0K4F--
