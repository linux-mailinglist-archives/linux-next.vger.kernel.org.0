Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BAC01C4ED9
	for <lists+linux-next@lfdr.de>; Tue,  5 May 2020 09:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbgEEHQA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 May 2020 03:16:00 -0400
Received: from ozlabs.org ([203.11.71.1]:46043 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725320AbgEEHP7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 5 May 2020 03:15:59 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49GWGb20p1z9sSk;
        Tue,  5 May 2020 17:15:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588662951;
        bh=pWPP6GbIrQXAasTXmFlutjFbhK4qJQ7nDUApB9gc6LY=;
        h=Date:From:To:Cc:Subject:From;
        b=mDotFvyHtx3Op32IAj6FzbFhL07UkEBtzl3BEkAgAJi+mW+DUqyss9fFJXFAHU0m0
         vqdSBcrn4mpTgKAk8w4fP+HhVTco/JGo9r0ItLthg6yJUWVY4YwKeBEWGXsRTmJXHy
         FxMJ00+dOhxrg3/Gl/+OS4IdKaFacFMBObBn9ln9Nb5O+kc9P58tJSjDI2XBRm//Sf
         CxTdclSXzYCjhAWaD34UkhZQFjUOOHt6ZDUQmcUr4VC/C4fUR4PjWxRffVLa/hO6SC
         5rt2guQxLQLTCvtmShfb+ccHGtQ0bR2iJrXFUL3uB9g9uoqgoTnBeeXsvVqiP94Exo
         WSmO2wUXnpYTA==
Date:   Tue, 5 May 2020 17:15:48 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 5
Message-ID: <20200505171548.6e1388f4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nDmmn5fT6V9+7Gmkj65d60F";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/nDmmn5fT6V9+7Gmkj65d60F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20200504:

New tree: ti-k3

My fixes tree contains:

  bbefc924d0ff ("ubsan: disable UBSAN_ALIGNMENT under COMPILE_TEST")
  7cb1d38f52b1 ("drm/msm: Fix undefined "rd_full" link error")

The qcom tree still had its build failure for which I reverted a commit.

Non-merge commits (relative to Linus' tree): 5888
 6922 files changed, 233385 insertions(+), 91859 deletions(-)

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

I am currently merging 318 trees (counting Linus' and 78 trees of bug
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
Merging origin/master (9851a0dee7c2 Merge tag 'gcc-plugins-v5.7-rc5' of git=
://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging fixes/master (bbefc924d0ff ubsan: disable UBSAN_ALIGNMENT under COM=
PILE_TEST)
Merging kbuild-current/fixes (6a8b55ed4056 Linux 5.7-rc3)
Merging arc-current/for-curr (40db9367ec1e ARC: guard dsp early init agains=
t non ARCv2)
Merging arm-current/fixes (2c962369d72f ARM: 8970/1: decompressor: increase=
 tag size)
Merging arm-soc-fixes/arm/fixes (f42ae4cd4cae Merge tag 'arm-soc/for-5.7/de=
vicetree-fixes' of https://github.com/Broadcom/stblinux into arm/fixes)
Merging arm64-fixes/for-next/fixes (1578e5d03112 arm64: vdso: Add -fasynchr=
onous-unwind-tables to cflags)
Merging m68k-current/for-linus (86cded5fc525 m68k: defconfig: Update defcon=
figs for v5.6-rc4)
Merging powerpc-fixes/fixes (5990cdee689c lib/mpi: Fix building for powerpc=
 with clang)
Merging s390-fixes/fixes (6a8b55ed4056 Linux 5.7-rc3)
Merging sparc/master (63bef48fd6c9 Merge branch 'akpm' (patches from Andrew=
))
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (bd4af432cc71 nfp: abm: fix a memory leak bug)
Merging bpf/master (7f645462ca01 bpf: Fix error return code in map_lookup_a=
nd_delete_elem())
Merging ipsec/master (c95c5f58b35e xfrm interface: fix oops when deleting a=
 x-netns interface)
Merging netfilter/master (b959c77dac09 net: macb: fix an issue about leak r=
elated system resources)
Merging ipvs/master (0141317611ab Merge branch 'hns3-fixes')
Merging wireless-drivers/master (10e41f34a019 MAINTAINERS: update mt76 revi=
ewers)
Merging mac80211/master (4a3de90b1184 mac80211: sta_info: Add lockdep condi=
tion for RCU list usage)
Merging rdma-fixes/for-rc (f0abc761bbb9 RDMA/core: Fix race between destroy=
 and release FD object)
Merging sound-current/for-linus (da7a8f1a8fc3 ALSA: usb-audio: add mapping =
for ASRock TRX40 Creator)
Merging sound-asoc-fixes/for-linus (5d4d064e7671 Merge remote-tracking bran=
ch 'asoc/for-5.7' into asoc-linus)
Merging regmap-fixes/for-linus (cef570d20922 Merge remote-tracking branch '=
regmap/for-5.7' into regmap-linus)
Merging regulator-fixes/for-linus (324fa65431d4 Merge remote-tracking branc=
h 'regulator/for-5.7' into regulator-linus)
Merging spi-fixes/for-linus (c459b311d82b Merge remote-tracking branch 'spi=
/for-5.7' into spi-linus)
Merging pci-current/for-linus (ef46738cc47a MAINTAINERS: Add Rob Herring an=
d remove Andy Murray as PCI reviewers)
Merging driver-core.current/driver-core-linus (2a15483b401c regulator: Reve=
rt "Use driver_deferred_probe_timeout for regulator_init_complete_work")
Merging tty.current/tty-linus (2ae11c46d5fd tty: xilinx_uartps: Fix missing=
 id assignment to the console)
Merging usb.current/usb-linus (9f04db234af6 USB: uas: add quirk for LaCie 2=
Big Quadra)
Merging usb-gadget-fixes/fixes (a7b778357ca4 usb: raw-gadget: Fix copy_to/f=
rom_user() checks)
Merging usb-serial-fixes/usb-linus (78d6de3cfbd3 USB: serial: qcserial: Add=
 DW5816e support)
Merging usb-chipidea-fixes/ci-for-usb-stable (7cbf3dd3139a usb: chipidea: u=
dc: fix sleeping function called from invalid context)
Merging phy/fixes (820eeb9de62f phy: qualcomm: usb-hs-28nm: Prepare clocks =
in init)
Merging staging.current/staging-linus (0c1d3f2c9a0d MAINTAINERS: remove ent=
ry after hp100 driver removal)
Merging char-misc.current/char-misc-linus (73faaa623fc9 Merge tag 'phy-for-=
5.7-rc' of git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy into=
 char-misc-linus)
Merging soundwire-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging thunderbolt-fixes/fixes (9d2214b14103 thunderbolt: Check return val=
ue of tb_sw_read() in usb4_switch_op())
Merging input-current/for-linus (5caab2da6320 Input: synaptics-rmi4 - fix e=
rror return code in rmi_driver_probe())
Merging crypto-current/master (a9a8ba90fa58 crypto: arch/nhpoly1305 - proce=
ss in explicit 4k chunks)
Merging ide/master (63bef48fd6c9 Merge branch 'akpm' (patches from Andrew))
Merging vfio-fixes/for-linus (5cbf3264bc71 vfio/type1: Fix VA->PA translati=
on for PFNMAP VMAs in vaddr_get_pfn())
Merging kselftest-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging slave-dma-fixes/fixes (4f302642b70c dmaengine: idxd: fix interrupt =
completion after unmasking)
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (2098c564701c mtd: spi-nor: Compile files in co=
ntrollers/ directory)
Merging mfd-fixes/for-mfd-fixes (603d9299da32 mfd: mt6397: Fix probe after =
changing mt6397-core)
Merging v4l-dvb-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (8f3d9f354286 Linux 5.7-rc1)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (175ae3ad59ab Merge branch 'fixes-v5.7' into fixes)
Merging kvm-fixes/master (7134fa0709d5 Merge tag 'kvmarm-fixes-5.7-2' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into kvm-master)
Merging kvms390-fixes/master (2a173ec993ba MAINTAINERS: add a reviewer for =
KVM/s390)
Merging hwmon-fixes/hwmon (ae83d0b416db Linux 5.7-rc2)
Merging nvdimm-fixes/libnvdimm-fixes (f84afbdd3a9e libnvdimm: Out of bounds=
 read in __nd_ioctl())
Merging btrfs-fixes/next-fixes (4f28062adf92 Merge branch 'misc-5.7' into n=
ext-fixes)
Merging vfs-fixes/fixes (b0d3869ce9ee propagate_one(): mnt_set_mountpoint()=
 needs mount_lock)
Merging dma-mapping-fixes/for-linus (9c24eaf81cc4 iommu/vt-d: Return the co=
rrect dma mask when we are bypassing the IOMMU)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (f585c9d5436a platform/x86/intel-uncore-fre=
q: make uncore_root_kobj static)
Merging samsung-krzk-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (8f3d9f354286 Linux 5.7-rc1)
Merging devicetree-fixes/dt/linus (4bc77b2d211e dt-bindings: phy: qcom-qusb=
2: Fix defaults)
Merging scsi-fixes/fixes (b36522150e5b scsi: ibmvscsi: Fix WARN_ON during e=
vent pool release)
Merging drm-fixes/drm-fixes (e3dcd86b3b4c Merge tag 'amd-drm-fixes-5.7-2020=
-04-29' of git://people.freedesktop.org/~agd5f/linux into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (8598eb781cf6 drm/i915: Use pr=
oper fault mask in interrupt postinstall too)
Merging mmc-fixes/fixes (1a8eb6b373c2 mmc: sdhci-pci: Fix eMMC driver stren=
gth for BYT-based controllers)
Merging rtc-fixes/rtc-fixes (8f3d9f354286 Linux 5.7-rc1)
Merging gnss-fixes/gnss-linus (ae83d0b416db Linux 5.7-rc2)
Merging hyperv-fixes/hyperv-fixes (f081bbb3fd03 hyper-v: Remove internal ty=
pes from UAPI header)
Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq h=
andlers after dpio create)
Merging risc-v-fixes/fixes (d6d5161280b3 riscv: force __cpu_up_ variables t=
o put in data section)
Merging pidfd-fixes/fixes (a966dcfe153a clone3: add build-time CLONE_ARGS_S=
IZE_VER* validity checks)
Merging fpga-fixes/fixes (3c2760b78f90 fpga: dfl: pci: fix return value of =
cci_pci_sriov_configure)
Merging spdx/spdx-linus (6a8b55ed4056 Linux 5.7-rc3)
Merging gpio-intel-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging pinctrl-intel-fixes/fixes (69388e15f507 pinctrl: cherryview: Add mi=
ssing spinlock usage in chv_gpio_irq_handler)
Merging erofs-fixes/fixes (d1eef1c61974 Linux 5.5-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (3a3a71f97c30 sun6i: dsi: fix g=
cc-4.8)
Merging kspp-gustavo/for-next/kspp (d88516748642 media: s5k5baf: avoid gcc-=
10 zero-length-bounds warning)
Merging kbuild/for-next (306232df1742 Merge branch 'kconfig' into for-next)
Merging compiler-attributes/compiler-attributes (98d54f81e36b Linux 5.6-rc4)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (298f3db6ee69 dma-contiguous: fix comment for =
dma_release_from_contiguous)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (626468fb0f3e Merge branch 'uaccess' into for-next)
Merging arm64/for-next/core (5fa4028e1ba2 Merge branch 'for-next/bti-user' =
into for-next/core)
Merging arm-perf/for-next/perf (8f3d9f354286 Linux 5.7-rc1)
Merging arm-soc/for-next (f42ae4cd4cae Merge tag 'arm-soc/for-5.7/devicetre=
e-fixes' of https://github.com/Broadcom/stblinux into arm/fixes)
Merging amlogic/for-next (001181951477 Merge branch 'v5.8/defconfig' into t=
mp/aml-rebuild)
Merging aspeed/for-next (de285b938cf3 ARM: dts: aspeed: ast2600: Fix SCU IR=
Q controller nodes)
Merging at91/at91-next (ec539e70d882 Merge branches 'at91-soc', 'at91-dt' a=
nd 'at91-defconfig' into at91-next)
Merging imx-mxs/for-next (36a816eea186 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (560b4d4691b0 Merge branch 'for_5.7/keystone-dts' int=
o next)
Merging mediatek/for-next (23a161322658 Merge branch 'v5.7-next/soc' into f=
or-next)
Merging mvebu/for-next (9d32706f8aa8 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (1f4c797b748c Merge branch 'omap-for-v5.8/dt' into fo=
r-next)
Merging qcom/for-next (8a5f35bd5d90 Merge branches 'arm64-defconfig-for-5.8=
', 'arm64-for-5.8', 'drivers-for-5.8' and 'dts-for-5.8' into for-next)
Applying: Revert "soc: qcom: rpmh: Allow RPMH driver to be loaded as a modu=
le"
Merging raspberrypi/for-next (f5e216e42689 ARM: dts: bcm283x: Use firmware =
PM driver for V3D)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (a928bef2e50f Merge branch 'renesas-drivers-for-v5.8' =
into renesas-next)
Merging reset/reset/next (2ebf89fd4ecf reset: hi6220: Add support for AO re=
set controller)
Merging rockchip/for-next (50b95b609e2d Merge branch 'v5.8-armsoc/dts64' in=
to for-next)
Merging samsung-krzk/for-next (5b99f3aca083 Merge branch 'next/dt' into for=
-next)
Merging scmi/for-linux-next (be740ffbf96a Merge branch 'for-next/scmi' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging sunxi/sunxi/for-next (77f3e28120d1 Merge branches 'sunxi/clk-for-5.=
8', 'sunxi/config-for-5.8', 'sunxi/dt-for-5.8' and 'sunxi/fixes-for-5.7' in=
to sunxi/for-next)
Merging tegra/for-next (a61a12cde424 Merge branch for-5.8/arm64/dt into for=
-next)
Merging ti-k3/ti-k3-next (57dfcb5dce99 arm64: dts: ti: k3-am65-main: Add eh=
rpwm nodes)
Merging clk/clk-next (e7f552f727f5 Merge branch 'clk-fixes' into clk-next)
Merging clk-samsung/for-next (8f3d9f354286 Linux 5.7-rc1)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (10cb08260605 csky: Fixup perf probe -x hungup)
Merging h8300/h8300-next (beab3d5cb0e1 irq-renesas-h8s: Fix external interr=
upt control.)
Merging ia64/next (172e7890406d tty/serial: cleanup after ioc*_serial drive=
r removal)
Merging m68k/for-next (366b8149fbff m68k: amiga: config: Replace zero-lengt=
h array with flexible-array member)
Merging m68knommu/for-next (012d1de88776 m68k/PCI: Fix a memory leak in an =
error handling path)
Merging microblaze/next (8f3d9f354286 Linux 5.7-rc1)
Merging mips/mips-next (7cc8f2d5aca1 MIPS: perf: Remove unnecessary "fallth=
rough" pseudo keywords)
Merging nds32/next (d785c5a324cd nds32: configs: Cleanup CONFIG_CROSS_COMPI=
LE)
Merging nios2/for-next (0ec8a5054d7f MAINTAINERS: Remove nios2-dev@lists.ro=
cketboards.org)
Merging openrisc/for-next (9737e2c5f0bc openrisc: Remove obsolete show_trac=
e_task function)
Merging parisc-hd/for-next (7111951b8d49 Linux 5.6)
Merging powerpc/next (140777a3d8df powerpc/fadump: consider reserved ranges=
 while reserving memory)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (461c3ac0dc46 soc: fsl: qe: fix sparse warnings for uc=
c_slow.c)
Merging risc-v/for-next (44ab661dd29d riscv: Use text_mutex instead of patc=
h_lock)
Merging sifive/for-next (467e050e9760 Merge branch 'i2c/for-current' of git=
://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging s390/features (19d4c761c1d2 s390/qdio: remove always-true condition)
Merging sh/sh-next (a193018e5290 sh: add missing EXPORT_SYMBOL() for __dela=
y)
Merging sparc-next/master (b71acb0e3721 Merge branch 'linus' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging uml/linux-next (2e27d33d22af um: Fix typo in vector driver transpor=
t option definition)
Merging xtensa/xtensa-for-next (70cbddb97385 arch/xtensa: fix grammar in Kc=
onfig help text)
Merging fscrypt/master (6a8b55ed4056 Linux 5.7-rc3)
Merging afs/afs-next (4fe171bb81b1 afs: Remove set but not used variable 'r=
et')
Merging btrfs/for-next (5211fe9f0d35 Merge branch 'for-next-current-v5.6-20=
200503' into for-next-20200503)
Merging ceph/master (3a5ccecd9af7 MAINTAINERS: remove myself as ceph co-mai=
ntainer)
Merging cifs/for-next (2d82ec2eff07 cifs: multichannel: try to rebind when =
reconnecting a channel)
Merging configfs/for-next (8aebfffacfa3 configfs: fix config_item refcnt le=
ak in configfs_rmdir())
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (8f3d9f354286 Linux 5.7-rc1)
Merging exfat/dev (3e9beb6e62b4 exfat: use iter_file_splice_write)
Merging ext3/for_next (a32f0ecd79b4 Merge fanotify fix from Nathan Chancell=
or.)
Merging ext4/dev (907ea529fc4c ext4: convert BUG_ON's to WARN_ON's in mball=
oc.c)
Merging f2fs/dev (58a1c829bd7b f2fs: use strcmp() in parse_options())
Merging fsverity/fsverity (6a8b55ed4056 Linux 5.7-rc3)
Merging fuse/for-next (75d892588e95 fuse: Update stale comment in queue_int=
errupt())
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (0e698dfa2822 Linux 5.7-rc4)
Merging nfs-anna/linux-next (55dee1bc0d72 nfs: add minor version to nfs_ser=
ver_key for fscache)
Merging nfsd/nfsd-next (2653de9f0398 fs: nfsd: fileache.c: Use built-in RCU=
 list checking)
CONFLICT (content): Merge conflict in net/sunrpc/cache.c
Merging orangefs/for-next (aa317d3351de orangefs: clarify build steps for t=
est server in orangefs.txt)
Merging overlayfs/overlayfs-next (c2778a3a955f ovl: sync dirty data when re=
mounting to ro mode)
Merging ubifs/linux-next (3676f32a98cd ubi: ubi-media.h: Replace zero-lengt=
h array with flexible-array member)
Merging v9fs/9p-next (c6f141412d24 9p: document short read behaviour with O=
_NONBLOCK)
Merging xfs/for-next (f0f7a674d4df xfs: move inode flush to the sync workqu=
eue)
Merging zonefs/for-next (0dda2ddb7ded zonefs: select FS_IOMAP)
Merging iomap/iomap-for-next (b75dfde12129 fibmap: Warn and return an error=
 in case of block > INT_MAX)
Merging djw-vfs/vfs-for-next (83d9088659e8 Documentation/dax: Update Usage =
section)
Merging file-locks/locks-next (dbdaf6a3250b locks: reinstate locks_delete_b=
lock optimization)
Merging vfs/for-next (9ccaf35a76cd Merge branch 'work.misc' into for-next)
Merging printk/for-next (d34f14ae521f Merge branch 'for-5.7-preferred-conso=
le' into for-next)
Merging pci/next (cb4b34e11454 Merge branch 'pci/pm')
Merging pstore/for-next/pstore (8f3d9f354286 Linux 5.7-rc1)
Merging hid/for-next (555cbc753ca9 Merge branch 'for-5.7/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (38d357bdc5c6 Merge branch 'i2c/for-current-fixed'=
 into i2c/for-next)
Merging i3c/i3c/next (b4203ce05563 i3c master: GETMRL's 3rd byte is optiona=
l even with BCR_IBI_PAYLOAD)
Merging dmi/master (8cf87c744696 firmware/dmi: Report DMI Bios & EC firmwar=
e release)
Merging hwmon-staging/hwmon-next (65b7e54c6adb hwmon: (lm70) Add support fo=
r ACPI)
Merging jc_docs/docs-next (ec43a27fffd0 scripts: sphinx-pre-install: change=
 the output order)
CONFLICT (content): Merge conflict in Documentation/arm64/booting.rst
CONFLICT (content): Merge conflict in Documentation/arm64/amu.rst
Merging v4l-dvb/master (e51759f56d31 media: v4l2-ctrls.h: clarify the p_def=
 argument of v4l2_ctrl_new_std_compound)
Merging v4l-dvb-next/master (54ecb8f7028c Linux 5.4-rc1)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (1985b45de014 Merge branch 'pm-cpuidle' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (2dea651680ce cpufreq: qcom: fix=
 wrong compatible binding)
Merging cpupower/cpupower (8f3d9f354286 Linux 5.7-rc1)
Merging opp/opp/linux-next (aca48b61f963 opp: Manage empty OPP tables with =
clk handle)
Merging thermal/thermal/linux-next (79799562bf08 thermal: int3400_thermal: =
Statically initialize .get_mode()/.set_mode() ops)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (a48f9721e6db dlm: no need to check return value of debugf=
s_create functions)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (a97bf49f824e RDMA/hns: Simplify the status judgment =
code of hns_roce_v1_m_qp())
Merging net-next/master (354d86141796 Merge branch 'net-reduce-dynamic-lock=
dep-keys')
CONFLICT (content): Merge conflict in include/net/mptcp.h
CONFLICT (content): Merge conflict in drivers/net/ethernet/mellanox/mlx5/co=
re/steering/dr_send.c
Merging bpf-next/master (07bf2d97d1f3 xsk: Remove unnecessary member in xdp=
_umem)
Merging ipsec-next/master (26333c37fc28 xfrm: add IPv6 support for espintcp)
Merging mlx5-next/mlx5-next (c6bc6041b10f net/mlx5: Add support to get lag =
physical port)
Merging netfilter-next/master (60bcbc41ffb3 Merge branch 'net-smc-add-and-d=
elete-link-processing')
Merging ipvs-next/master (d54725cd11a5 netfilter: nf_tables: support for mu=
ltiple devices per netdev hook)
Merging wireless-drivers-next/master (ea1b3bc6d5ad brcmfmac: no need to che=
ck return value of debugfs_create functions)
Merging bluetooth/master (46347b4c2dcb Bluetooth: Fix advertising handle is=
 set to 0)
Merging mac80211-next/master (60689de46c7f mac80211: fix memory overlap due=
 to variable length param)
Merging gfs2/for-next (197694d09af5 docs: filesystems: convert gfs2-glocks.=
txt to ReST)
Merging mtd/mtd/next (025a06c1104c mtd: Convert fallthrough comments into s=
tatements)
Merging nand/nand/next (fca88925d769 mtd: rawnand: toshiba: Support reading=
 the number of bitflips for BENAND (Built-in ECC NAND))
Merging spi-nor/spi-nor/next (b84691596328 mtd: spi-nor: Fix description of=
 the sr_ready() return value)
Merging crypto/master (12b3cf909354 crypto: bcm - Fix unused assignment)
Merging drm/drm-next (937eea297e26 Merge tag 'amd-drm-next-5.8-2020-04-24' =
of git://people.freedesktop.org/~agd5f/linux into drm-next)
CONFLICT (content): Merge conflict in include/linux/dma-buf.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/tidss/tidss_encoder.c
Merging amdgpu/drm-next (d09d5126d09b drm/amdgpu: re-enable runtime pm on v=
ega10)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dcn21/=
dcn21_resource.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_drv=
.c
Merging drm-intel/for-linux-next (8757797ff9c9 drm/i915/selftests: Repeat t=
he rps clock frequency measurement)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dd=
i.c
Merging drm-tegra/drm/tegra/for-next (757338371608 drm/tegra: Clean up GPIO=
 includes)
Merging drm-misc/for-linux-next (42470eec8552 drm/panel: boe-tv101wum-n16: =
fine tune clock)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging drm-msm/msm-next (a5fb8b918920 drm/msm/a6xx: Use the DMA API for GM=
U memory objects)
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (2c76b324c794 drm/imx: parallel-display: Adjus=
t bus_flags handling)
Merging etnaviv/etnaviv/next (f232d9ec029c drm/etnaviv: fix TS cache flushi=
ng on GPUs with BLT engine)
Merging regmap/for-next (6c9147d991fb Merge remote-tracking branch 'regmap/=
for-5.8' into regmap-next)
Merging sound/for-next (60019d8c650d ALSA: hda/tegra: workaround playback f=
ailure on Tegra194)
Merging sound-asoc/for-next (b2e2e0474e77 Merge remote-tracking branch 'aso=
c/for-5.8' into asoc-next)
Merging modules/modules-next (5c3a7db0c7ec module: Harden STRICT_MODULE_RWX)
Merging input/next (9d17ad2369dc Input: atkbd - receive and use physcode->k=
eycode mapping from FW)
Merging block/for-next (9af3dda70ec3 Merge branch 'for-5.8/block' into for-=
next)
Merging device-mapper/for-next (c421cafab065 dm ebs: pass discards down to =
underlying device)
Merging pcmcia/pcmcia-next (a8c122f72d94 pcmcia: remove some unused space c=
haracters)
Merging mmc/next (fa6f23de36b7 mmc: sdhci-pci-o2micro: Make some symbols st=
atic)
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (d2923aa45356 mfd: intel-lpss: Fix Intel Elkhart L=
ake LPSS I2C input clock)
Merging backlight/for-backlight-next (ee0c8e494cc3 backlight: corgi: Conver=
t to use GPIO descriptors)
Merging battery/for-next (72d9cd9cdc18 power: bq25890: protect view of the =
chip's state)
Merging regulator/for-next (79d6cf2fc937 Merge remote-tracking branch 'regu=
lator/for-5.8' into regulator-next)
Merging security/next-testing (3e27a33932df security: remove duplicated inc=
lude from security.h)
Merging apparmor/apparmor-next (01df52d726b5 apparmor: remove duplicate che=
ck of xattrs on profile attachment.)
Merging integrity/next-integrity (2592677c0486 ima: Use ima_hash_algo for c=
ollision detection in the measurement list)
Merging keys/keys-next (43672cf93c6d Merge branch 'notifications-pipe-core'=
 into keys-next)
CONFLICT (content): Merge conflict in samples/Makefile
CONFLICT (content): Merge conflict in samples/Kconfig
CONFLICT (content): Merge conflict in include/linux/lsm_hooks.h
CONFLICT (content): Merge conflict in fs/pipe.c
Applying: security: keys: fixup for "security: Refactor declaration of LSM =
hooks"
Merging selinux/next (03414a49ad5f selinux: do not allocate hashtabs dynami=
cally)
Merging tomoyo/master (8f3d9f354286 Linux 5.7-rc1)
Merging tpmdd/next (40686e855d3c tpm/tpm_ftpm_tee: Use UUID API for exporti=
ng the UUID)
Merging watchdog/master (ae83d0b416db Linux 5.7-rc2)
Merging iommu/next (b52649aee624 iommu/qcom: Fix local_base status check)
Merging vfio/next (f44efca0493d vfio: Ignore -ENODEV when getting MSI cooki=
e)
Merging audit/next (db9ff6ecf6ef audit: make symbol 'audit_nfcfgs' static)
Merging devicetree/for-next (e7728fcf7dd7 docs: dt: convert writing-binding=
s.txt to ReST)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/dis=
play/panel/panel-common.yaml
Merging mailbox/mailbox-for-next (0a67003b1985 mailbox: imx: add SCU MU sup=
port)
Merging spi/for-next (33ab6297723a Merge remote-tracking branch 'spi/for-5.=
8' into spi-next)
Merging tip/auto-latest (9a31ac1743a0 Merge branch 'linus')
Merging clockevents/timers/drivers/next (c1ac28a4de6f Revert "clocksource: =
Avoid creating dead devices")
Merging edac/edac-for-next (dc63e28efa19 Merge branch 'edac-i10nm' into eda=
c-for-next)
Merging irqchip/irq/irqchip-next (4cea749d56be Revert "irqchip/xilinx: Enab=
le generic irq multi handler")
Merging ftrace/for-next (d013496f99c5 tracing: Convert local functions in t=
racing_map.c to static)
Merging rcu/rcu/next (8bdf39e77175 trace: events: rcu: Change description o=
f rcu_dyntick trace event)
Merging kvm/linux-next (7c67f54661fc KVM: SVM: do not allow VMRUN inside SM=
M)
CONFLICT (content): Merge conflict in arch/x86/kvm/svm/svm.c
Merging kvm-arm/next (463050599742 Merge tag 'kvm-arm-removal' into kvmarm-=
master/next)
Merging kvm-ppc/kvm-ppc-next (9a5788c615f5 KVM: PPC: Book3S HV: Add a capab=
ility for enabling secure guests)
Merging kvms390/next (0b545fd17f84 KVM: s390: remove unneeded semicolon in =
gisa_vcpu_kicker())
Merging xen-tip/linux-next (74f4c438f22c arm/xen: make _xen_start_info stat=
ic)
Merging percpu/for-next (dedac37ea96b Merge branch 'for-5.7' into for-next)
Merging workqueues/for-next (4acf8a423cd3 Merge branch 'for-5.7' into for-n=
ext)
Merging drivers-x86/for-next (14232c6e788c platform/x86: thinkpad_acpi: Add=
 support for dual fan control)
Merging chrome-platform/for-next (94b8e516839f Merge remote-tracking branch=
 'origin/chrome-platform-5.7-fixes' into for-kernelci)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (c85c7cdef3c9 leds: trigger: remove redundant assignm=
ent to variable ret)
Merging ipmi/for-next (900b217c7c8e ipmi: Replace guid_copy() with import_g=
uid() where it makes sense)
Merging driver-core/driver-core-next (48ebea5026d6 firmware_loader: move fw=
_fallback_config to a private kernel symbol namespace)
CONFLICT (content): Merge conflict in drivers/base/dd.c
Merging usb/usb-next (b9cf2cb52433 usb: core: hub: use true,false for bool =
variable)
Merging usb-gadget/next (4a5dbd900957 dt-bindings: usb: add documentation f=
or aspeed usb-vhub)
Merging usb-serial/usb-next (788a4ee607e8 USB: serial: Use the correct styl=
e for SPDX License Identifier)
Merging usb-chipidea-next/ci-for-usb-next (4ee2fc81a631 usb: chipidea: usb2=
: remove unneeded semicolon)
Merging phy-next/next (4f8dad0aaca4 dt-bindings: phy-qcom-ipq4019-usb: add =
binding document)
Merging tty/tty-next (e2bd1dcbe1aa tty: hvc: Fix data abort due to race in =
hvc_open)
Merging char-misc/char-misc-next (56a9a8068637 firmware: xilinx: Export zyn=
qmp_pm_fpga_{get_status,load})
Merging extcon/extcon-next (108339e7a4fe extcon: remove redundant assignmen=
t to variable idx)
Merging soundwire/next (f48f4fd9fefb soundwire: bus: reduce verbosity on en=
umeration)
Merging thunderbolt/next (57d8df68eb53 thunderbolt: Add support for Intel T=
iger Lake)
Merging staging/staging-next (d97a9d7aea04 staging/speakup: Add inflection =
synth parameter)
Merging mux/for-next (f356d58c3a04 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (8f3d9f354286 Linux 5.7-rc1)
Merging slave-dma/next (bd96f1b2f43a dmaengine: dw-edma: support local dma =
device transfer semantics)
Merging cgroup/for-next (eec8fd0277e3 device_cgroup: Cleanup cgroup eBPF de=
vice filter code)
Merging scsi/for-next (bd4a4179ed42 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (6f41f08c88c5 scsi: dpt_i2o: Remove always false =
'chan < 0' statement)
Merging vhost/linux-next (bf8e15270b72 virtio_net: CTRL_GUEST_OFFLOADS depe=
nds on CTRL_VQ)
Merging rpmsg/for-next (a830779bcd3b Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (9e581cd14663 Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (6fdeb6cbe1ef gpio: pca953x: drop unused pa=
rameters of pca953x_recalc_addr())
Merging gpio-intel/for-next (7e73aa90a38c gpio: merrifield: Better show how=
 GPIO and IRQ bases are derived from hardware)
Merging pinctrl/for-next (9e692aa8d3f8 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (6d649fca3491 pinctrl: intel: Move npins clo=
ser to pin_base in struct intel_community)
Merging pinctrl-samsung/for-next (f354157a7d18 pinctrl: samsung: Save/resto=
re eint_mask over suspend for EINT_TYPE GPIOs)
Merging pwm/for-next (6f0841a8197b pwm: Add support for Azoteq IQS620A PWM =
generator)
Merging userns/for-next (1dd694a1b72f remove the no longer needed pid_alive=
() check in __task_pid_nr_ns())
Merging ktest/for-next (1091c8fce8aa ktest: Fix typos in ktest.pl)
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (66d69e081b52 selftests: fix kvm relocatable native/=
cross builds and installs)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (d28b4c1b2b3d Merge branch 'for-5.6/selftests=
' into for-next)
Merging coresight/next (657830eb842f coresight: Avoid casting void pointers)
Merging rtc/rtc-next (11ddbdfb68e4 rtc: rc5t619: Fix an ERR_PTR vs NULL che=
ck)
Merging nvdimm/libnvdimm-for-next (f6d2b802f80d Merge branch 'for-5.7/libnv=
dimm' into libnvdimm-for-next)
Merging at24/at24/for-next (8f3d9f354286 Linux 5.7-rc1)
Merging ntb/ntb-next (1b3fb49ac27b NTB: ntb_test: Fix bug when counting rem=
ote files)
Merging kspp/for-next/kspp (c7527373fe28 gcc-common.h: Update for GCC 10)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (ae83d0b416db Linux 5.7-rc2)
Merging fsi/next (2c01397b71c5 fsi: aspeed: Fix OPB0 byte order register va=
lues)
CONFLICT (content): Merge conflict in drivers/fsi/Kconfig
Merging slimbus/for-next (b23f2e2df6c9 slimbus: ngd: remove redundant assig=
nment)
Merging nvmem/for-next (da50b72c0822 nvmem: ensure sysfs writes handle writ=
e-protect pin)
Merging xarray/xarray (27586ca786a7 XArray: Handle retry entries within xas=
_find_marked)
Merging hyperv/hyperv-next (df474842683c hyper-v: Switch to use UUID types =
directly)
Merging auxdisplay/auxdisplay (2f920c0f0e29 auxdisplay: charlcd: replace ze=
ro-length array with flexible-array member)
Merging kgdb/kgdb/for-next (5ea771abd5a3 kdb: Censor attempts to set PROMPT=
 without ENABLE_MEM_READ)
Merging pidfd/for-next (6952a4f64644 selftests: add pid namespace ENOMEM re=
gression test)
Merging devfreq/devfreq-next (a35a2f2b3e6e PM / devfreq: tegra30: Delete an=
 error message in tegra_devfreq_probe())
Merging hmm/hmm (8f3d9f354286 Linux 5.7-rc1)
Merging fpga/for-next (a2b9d4eadb77 fpga: dfl: afu: support debug access to=
 memory-mapped afu regions)
Merging kunit/test (8f3d9f354286 Linux 5.7-rc1)
Merging cel/cel-next (0a8e7b7d0846 SUNRPC: Revert 241b1f419f0e ("SUNRPC: Re=
move xdr_buf_trim()"))
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (b359ed5184ae mtd: cfi_cmdset_0001: Support the absenc=
e of protection registers)
Merging kunit-next/kunit (02eb1e34ef24 kunit: kunit_tool: Separate out conf=
ig/build/exec/parse)
Merging trivial/for-next (fad7c9020948 err.h: remove deprecated PTR_RET for=
 good)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (18dc393d5e14 bus: mhi: core: Fix channel device name =
conflict)
Merging akpm-current/current (eaefe8ea3bc2 ipc-convert-ipcs_idr-to-xarray-u=
pdate)
CONFLICT (content): Merge conflict in include/linux/printk.h
CONFLICT (content): Merge conflict in arch/x86/Kconfig.debug
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
CONFLICT (content): Merge conflict in arch/arm64/include/asm/pgtable.h
CONFLICT (content): Merge conflict in arch/arm64/Kconfig
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (2417f5f86ad2 drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/nDmmn5fT6V9+7Gmkj65d60F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6xEqQACgkQAVBC80lX
0GxViAf/ROXOWNqGgejB4lNIyVZykJTkLojwQ31voU/i4s/yA0IUEI2tPIvdqbZd
NWRD60rKGB9KGPEgn+E/CYeGeZ1iEzNfrDTUQUuEWTWP0lXXWbCK1HfVPNtsWePl
hFb/ctq59NuRDvC6TK/RzwV9A09Era3RebEaTsRdGU0pVTucnUCtseAR6s6vAbWF
JXJ6GREpMNhtIlB5wd8EZ3Y+753AP8dNeJsneouztnW5kzQNAodVaXqT0WPPLo19
jL/TrqKjdYEfEhuou3hceWFjNOCf7iwbzdh2hfZ241kPW8mIS0Z6xOYptrFiZOY/
qJcn4NcYl7GWW5YQW8kbDhAaUTJNoA==
=87Wm
-----END PGP SIGNATURE-----

--Sig_/nDmmn5fT6V9+7Gmkj65d60F--
