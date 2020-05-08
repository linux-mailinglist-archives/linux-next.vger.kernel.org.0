Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0D8A1CA95E
	for <lists+linux-next@lfdr.de>; Fri,  8 May 2020 13:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgEHLQF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 May 2020 07:16:05 -0400
Received: from ozlabs.org ([203.11.71.1]:40235 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726792AbgEHLQE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 8 May 2020 07:16:04 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49JSSH2qCbz9sSr;
        Fri,  8 May 2020 21:15:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588936559;
        bh=QI98Anz6HzRYtlNp/ypuxNJemG2crjSpj12v/mPKkaM=;
        h=Date:From:To:Cc:Subject:From;
        b=meQ1cceXLENVKOhHNMWFX+D7rCOLTNcoLnBDzDSTc2zOHSsCmDptYwLue1LYbh37v
         jtlvI42AwlyzbV6BP/RNrzYEuAstWwzbIhaW4FewwK3VJSEVpAZ6VEZmSydMzxzq9s
         dDvPOddyWa20M6hrxuSFI237U2046zn79Dtw3iVVSBqg2znAMHF9x0Fz0+kJqgLBtj
         5vzGevrsbzxq3ScAtj77SZClSHARRze4yl7sZy/5moPTg9VYT41vo3PuaObQjZpuiz
         CvNw32b0jlUyq6hkuLq8QEkEtj0zMyy54HmVR2FIRKIhkwXQy8P231aUsHAmUkSFQQ
         5Vw0CYks8tkvA==
Date:   Fri, 8 May 2020 21:15:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 8
Message-ID: <20200508211557.777e937e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/v8d3v=yZXZE2BkibMQrSJUF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/v8d3v=yZXZE2BkibMQrSJUF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20200507:

New tree: smack

My fixes tree contains:

  bbefc924d0ff ("ubsan: disable UBSAN_ALIGNMENT under COMPILE_TEST")
  7cb1d38f52b1 ("drm/msm: Fix undefined "rd_full" link error")
  41ef83a65305 ("device_cgroup: Fix RCU list debugging warning")
  d58ae1991898 ("ipmr: Add lockdep expression to ipmr_for_each_table macro")
  74ba3ef16042 ("ipmr: Fix RCU list debugging warning")

The qcom tree still had its build failure for which I reverted a commit.

The nfsd tree gained a build failure so I used teh version from
next-20200507.

The vfs tree lost its build failure.

The net-next tree gained conflicts against the rdma tree.

The drm tree gained a conflict and a semantic conflict against the
drm-intel-fixes tree.

The amdgpu tree gained a conflict against the pm tree.

The block tree gained a build failure for which I applied a patch.

The vhost tree lost its build failure.

The livepatching tree gained a conflict against the modules tree.

The akpm-current tree gained a conflict against the hmm tree.

Non-merge commits (relative to Linus' tree): 6848
 7639 files changed, 269698 insertions(+), 109923 deletions(-)

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

I am currently merging 319 trees (counting Linus' and 78 trees of bug
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
Merging origin/master (6e7f2eacf098 Merge tag 'arm64-fixes' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/arm64/linux)
Merging fixes/master (41ef83a65305 device_cgroup: Fix RCU list debugging wa=
rning)
Merging kbuild-current/fixes (6a8b55ed4056 Linux 5.7-rc3)
Merging arc-current/for-curr (40db9367ec1e ARC: guard dsp early init agains=
t non ARCv2)
Merging arm-current/fixes (513149cba8f2 Merge branch 'uaccess' into fixes)
Merging arm-soc-fixes/arm/fixes (f42ae4cd4cae Merge tag 'arm-soc/for-5.7/de=
vicetree-fixes' of https://github.com/Broadcom/stblinux into arm/fixes)
Merging arm64-fixes/for-next/fixes (027d0c7101f5 arm64: hugetlb: avoid pote=
ntial NULL dereference)
Merging m68k-current/for-linus (86cded5fc525 m68k: defconfig: Update defcon=
figs for v5.6-rc4)
Merging powerpc-fixes/fixes (5990cdee689c lib/mpi: Fix building for powerpc=
 with clang)
Merging s390-fixes/fixes (6a8b55ed4056 Linux 5.7-rc3)
Merging sparc/master (57829ea46875 sparc: mm: return true,false in kern_add=
r_valid())
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (8aef199481df net: hisilicon: Make CONFIG_HNS invisible)
Merging bpf/master (81aabbb9fb7b bpf, sockmap: bpf_tcp_ingress needs to sub=
tract bytes from sg.size)
Merging ipsec/master (c95c5f58b35e xfrm interface: fix oops when deleting a=
 x-netns interface)
Merging netfilter/master (a811c1fa0a02 Merge git://git.kernel.org/pub/scm/l=
inux/kernel/git/netdev/net)
Merging ipvs/master (0141317611ab Merge branch 'hns3-fixes')
Merging wireless-drivers/master (10e41f34a019 MAINTAINERS: update mt76 revi=
ewers)
Merging mac80211/master (4a3de90b1184 mac80211: sta_info: Add lockdep condi=
tion for RCU list usage)
Merging rdma-fixes/for-rc (56c91440ff00 IB/hfi1: Fix another case where pq =
is left on waitlist)
Merging sound-current/for-linus (c1f6e3c818dd ALSA: rawmidi: Fix racy buffe=
r resize under concurrent accesses)
Merging sound-asoc-fixes/for-linus (c95a1d4a128f Merge remote-tracking bran=
ch 'asoc/for-5.7' into asoc-linus)
Merging regmap-fixes/for-linus (cef570d20922 Merge remote-tracking branch '=
regmap/for-5.7' into regmap-linus)
Merging regulator-fixes/for-linus (2dd946661eb5 Merge remote-tracking branc=
h 'regulator/for-5.7' into regulator-linus)
Merging spi-fixes/for-linus (faf6d67cf1ab Merge remote-tracking branch 'spi=
/for-5.7' into spi-linus)
Merging pci-current/for-linus (ef46738cc47a MAINTAINERS: Add Rob Herring an=
d remove Andy Murray as PCI reviewers)
Merging driver-core.current/driver-core-linus (2a15483b401c regulator: Reve=
rt "Use driver_deferred_probe_timeout for regulator_init_complete_work")
Merging tty.current/tty-linus (2ae11c46d5fd tty: xilinx_uartps: Fix missing=
 id assignment to the console)
Merging usb.current/usb-linus (91edf63d5022 usb: chipidea: msm: Ensure prop=
er controller reset using role switch API)
Merging usb-gadget-fixes/fixes (3c1b14c147eb usb: gadget: legacy: fix redun=
dant initialization warnings)
Merging usb-serial-fixes/usb-linus (78d6de3cfbd3 USB: serial: qcserial: Add=
 DW5816e support)
Merging usb-chipidea-fixes/ci-for-usb-stable (b3f3736ac305 usb: chipidea: m=
sm: Ensure proper controller reset using role switch API)
Merging phy/fixes (820eeb9de62f phy: qualcomm: usb-hs-28nm: Prepare clocks =
in init)
Merging staging.current/staging-linus (769acc3656d9 staging: gasket: Check =
the return value of gasket_get_bar_index())
Merging char-misc.current/char-misc-linus (f0e1d3ac2d7c bus: mhi: core: Fix=
 channel device name conflict)
Merging soundwire-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging thunderbolt-fixes/fixes (9d2214b14103 thunderbolt: Check return val=
ue of tb_sw_read() in usb4_switch_op())
Merging input-current/for-linus (9747070c11d6 Input: axp20x-pek - always re=
gister interrupt handlers)
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
Merging omap-fixes/fixes (738b150ecefb ARM: dts: omap4-droid4: Fix occasion=
al lost wakeirq for uart1)
Merging kvm-fixes/master (2673cb684972 Merge tag 'kvm-s390-master-5.7-3' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging kvms390-fixes/master (5615e74f48dc KVM: s390: Remove false WARN_ON_=
ONCE for the PQAP instruction)
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
Merging drivers-x86-fixes/fixes (dc56c5acd850 Merge tag 'platform-drivers-x=
86-v5.7-2' of git://git.infradead.org/linux-platform-drivers-x86)
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
Merging drm-intel-fixes/for-linux-next-fixes (1bc6a60143a4 drm/i915/execlis=
ts: Track inflight CCID)
Merging mmc-fixes/fixes (b56ff195c317 mmc: sdhci-pci-gli: Fix can not acces=
s GL9750 after reboot from Windows 10)
Merging rtc-fixes/rtc-fixes (8f3d9f354286 Linux 5.7-rc1)
Merging gnss-fixes/gnss-linus (ae83d0b416db Linux 5.7-rc2)
Merging hyperv-fixes/hyperv-fixes (f081bbb3fd03 hyper-v: Remove internal ty=
pes from UAPI header)
Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq h=
andlers after dpio create)
Merging risc-v-fixes/fixes (73cb8e2a5863 RISC-V: Remove unused code from ST=
RICT_KERNEL_RWX)
Merging pidfd-fixes/fixes (a966dcfe153a clone3: add build-time CLONE_ARGS_S=
IZE_VER* validity checks)
Merging fpga-fixes/fixes (3c2760b78f90 fpga: dfl: pci: fix return value of =
cci_pci_sriov_configure)
Merging spdx/spdx-linus (6a8b55ed4056 Linux 5.7-rc3)
Merging gpio-intel-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
Merging pinctrl-intel-fixes/fixes (69388e15f507 pinctrl: cherryview: Add mi=
ssing spinlock usage in chv_gpio_irq_handler)
Merging erofs-fixes/fixes (d1eef1c61974 Linux 5.5-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (5fe89a6acd66 drm: Fix HDCP fai=
lures when SRM fw is missing)
Merging kspp-gustavo/for-next/kspp (83f566dd61fe media: s5k5baf: avoid gcc-=
10 zero-length-bounds warning)
Merging kbuild/for-next (306232df1742 Merge branch 'kconfig' into for-next)
Merging compiler-attributes/compiler-attributes (98d54f81e36b Linux 5.6-rc4)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (298f3db6ee69 dma-contiguous: fix comment for =
dma_release_from_contiguous)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (ddc69f025fdc Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (38c313723652 Merge branch 'for-next/kvm/errata=
' into for-next/core)
Merging arm-perf/for-next/perf (8f3d9f354286 Linux 5.7-rc1)
Merging arm-soc/for-next (f42ae4cd4cae Merge tag 'arm-soc/for-5.7/devicetre=
e-fixes' of https://github.com/Broadcom/stblinux into arm/fixes)
Merging amlogic/for-next (001181951477 Merge branch 'v5.8/defconfig' into t=
mp/aml-rebuild)
Merging aspeed/for-next (fa4c8ec6feaa ARM: dts: aspeed: Change KCS nodes to=
 v2 binding)
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
Merging omap/for-next (74c1803d75d8 Merge branch 'omap-for-v5.8/soc' into f=
or-next)
Merging qcom/for-next (503ee1ae82f7 Merge branches 'arm64-defconfig-for-5.8=
', 'arm64-for-5.8', 'drivers-for-5.8' and 'dts-for-5.8' into for-next)
Applying: Revert "soc: qcom: rpmh: Allow RPMH driver to be loaded as a modu=
le"
Merging raspberrypi/for-next (f5e216e42689 ARM: dts: bcm283x: Use firmware =
PM driver for V3D)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (1b835e2a83eb Merge branches 'renesas-arm-defconfig-fo=
r-v5.8', 'renesas-arm-dt-for-v5.8', 'renesas-arm-soc-for-v5.8', 'renesas-dr=
ivers-for-v5.8' and 'renesas-dt-bindings-for-v5.8' into renesas-next)
Merging reset/reset/next (697fa27dc5fb reset: hi6220: Add support for AO re=
set controller)
Merging rockchip/for-next (b73fd7e93512 Merge branch 'v5.7-clk/fixes' into =
for-next)
Merging samsung-krzk/for-next (5b99f3aca083 Merge branch 'next/dt' into for=
-next)
Merging scmi/for-linux-next (bb73bdaea142 Merge branch 'for-next/scmi' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging sunxi/sunxi/for-next (77f3e28120d1 Merge branches 'sunxi/clk-for-5.=
8', 'sunxi/config-for-5.8', 'sunxi/dt-for-5.8' and 'sunxi/fixes-for-5.7' in=
to sunxi/for-next)
Merging tegra/for-next (e8bf587b74d5 Merge branch for-5.8/arm64/dt into for=
-next)
Merging ti-k3/ti-k3-next (57dfcb5dce99 arm64: dts: ti: k3-am65-main: Add eh=
rpwm nodes)
Merging clk/clk-next (e7f552f727f5 Merge branch 'clk-fixes' into clk-next)
Merging clk-samsung/for-next (8f3d9f354286 Linux 5.7-rc1)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (4a4230d9ef5b csky: Fixup perf callchain unwind)
Merging h8300/h8300-next (beab3d5cb0e1 irq-renesas-h8s: Fix external interr=
upt control.)
Merging ia64/next (172e7890406d tty/serial: cleanup after ioc*_serial drive=
r removal)
Merging m68k/for-next (366b8149fbff m68k: amiga: config: Replace zero-lengt=
h array with flexible-array member)
Merging m68knommu/for-next (5850da95da03 m68k: Drop CONFIG_MTD_M25P80 in st=
mark2_defconfig)
Merging microblaze/next (8f3d9f354286 Linux 5.7-rc1)
Merging mips/mips-next (da706e5034c3 MIPS: asm: Rename some macros to avoid=
 build errors)
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
Merging s390/features (23a457b8d57d s390: nvme reipl)
Merging sh/sh-next (a193018e5290 sh: add missing EXPORT_SYMBOL() for __dela=
y)
Merging sparc-next/master (b71acb0e3721 Merge branch 'linus' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging uml/linux-next (2e27d33d22af um: Fix typo in vector driver transpor=
t option definition)
Merging xtensa/xtensa-for-next (70cbddb97385 arch/xtensa: fix grammar in Kc=
onfig help text)
Merging fscrypt/master (0e698dfa2822 Linux 5.7-rc4)
Merging afs/afs-next (4fe171bb81b1 afs: Remove set but not used variable 'r=
et')
Merging btrfs/for-next (5211fe9f0d35 Merge branch 'for-next-current-v5.6-20=
200503' into for-next-20200503)
Merging ceph/master (3d0a1ae98f00 ceph: demote quotarealm lookup warning to=
 a debug message)
Merging cifs/for-next (3dc58df0e243 CIFS: Spelling s/EACCESS/EACCES/)
Merging configfs/for-next (8aebfffacfa3 configfs: fix config_item refcnt le=
ak in configfs_rmdir())
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (8f3d9f354286 Linux 5.7-rc1)
Merging exfat/dev (e9d1a9d72e55 exfat: fix possible memory leak in exfat_fi=
nd())
Merging ext3/for_next (a32f0ecd79b4 Merge fanotify fix from Nathan Chancell=
or.)
Merging ext4/dev (907ea529fc4c ext4: convert BUG_ON's to WARN_ON's in mball=
oc.c)
Merging f2fs/dev (a4f426eb805e f2fs: correctly fix the parent inode number =
during fsync())
Merging fsverity/fsverity (0e698dfa2822 Linux 5.7-rc4)
Merging fuse/for-next (75d892588e95 fuse: Update stale comment in queue_int=
errupt())
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (0e698dfa2822 Linux 5.7-rc4)
Merging nfs-anna/linux-next (55dee1bc0d72 nfs: add minor version to nfs_ser=
ver_key for fscache)
Merging nfsd/nfsd-next (f3a4e2b34004 nfsd: clients don't need to break thei=
r own delegations)
$ git reset --hard HEAD^
Merging next-20200507 version of nfsd
CONFLICT (content): Merge conflict in net/sunrpc/cache.c
[master dd61a3f2f0fb] next-20200507/nfsd
Merging orangefs/for-next (aa317d3351de orangefs: clarify build steps for t=
est server in orangefs.txt)
Merging overlayfs/overlayfs-next (c2778a3a955f ovl: sync dirty data when re=
mounting to ro mode)
Merging ubifs/linux-next (3676f32a98cd ubi: ubi-media.h: Replace zero-lengt=
h array with flexible-array member)
Merging v9fs/9p-next (c6f141412d24 9p: document short read behaviour with O=
_NONBLOCK)
Merging xfs/for-next (c199507993ed xfs: remove unused iget_flags param from=
 xfs_imap_to_bp())
Merging zonefs/for-next (0dda2ddb7ded zonefs: select FS_IOMAP)
Merging iomap/iomap-for-next (b75dfde12129 fibmap: Warn and return an error=
 in case of block > INT_MAX)
Merging djw-vfs/vfs-for-next (83d9088659e8 Documentation/dax: Update Usage =
section)
Merging file-locks/locks-next (dbdaf6a3250b locks: reinstate locks_delete_b=
lock optimization)
Merging vfs/for-next (6470fc558f46 Merge branches 'work.misc', 'work.sysctl=
', 'work.epoll', 'uaccess.base', 'uaccess.csum' and 'work.set_fs-exec' into=
 for-next)
Merging printk/for-next (d34f14ae521f Merge branch 'for-5.7-preferred-conso=
le' into for-next)
Merging pci/next (e08cd4d4ebb2 Merge branch 'remotes/lorenzo/pci/v3-semi')
Merging pstore/for-next/pstore (772460fd9c08 pstore/ram: Adjust module para=
m permissions to reflect reality)
Merging hid/for-next (e81a2d6bd788 Merge branch 'for-5.8/asus' into for-nex=
t)
Merging i2c/i2c/for-next (f23da43a58d0 Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i3c/i3c/next (b4203ce05563 i3c master: GETMRL's 3rd byte is optiona=
l even with BCR_IBI_PAYLOAD)
Merging dmi/master (8cf87c744696 firmware/dmi: Report DMI Bios & EC firmwar=
e release)
Merging hwmon-staging/hwmon-next (40b62a1c4c33 hwmon: (lm75) Fix all coding=
-style warnings on lm75 driver)
Merging jc_docs/docs-next (56b62540782b doc: thermal: add cpu-idle-cooling =
to index tree)
CONFLICT (content): Merge conflict in Documentation/arm64/booting.rst
CONFLICT (content): Merge conflict in Documentation/arm64/amu.rst
Merging v4l-dvb/master (5b9f8e4ac947 media: ipu3.rst: fix a build warning)
Merging v4l-dvb-next/master (54ecb8f7028c Linux 5.4-rc1)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (5b45c277ddc3 Merge branch 'pm-cpuidle' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (cf1e0449ac47 clk: qoriq: add cp=
ufreq platform device)
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
Merging rdma/for-next (42caf9cb5937 RDMA/mlx5: Allow only raw Ethernet QPs =
when RoCE isn't enabled)
CONFLICT (content): Merge conflict in drivers/net/ethernet/mellanox/mlx5/co=
re/steering/dr_send.c
Merging net-next/master (790709f24972 net: relax SO_TXTIME CAP_NET_ADMIN ch=
eck)
CONFLICT (content): Merge conflict in drivers/net/bonding/bond_main.c
Merging bpf-next/master (2b6c6f071632 bpf, i386: Remove unneeded conversion=
 to bool)
Merging ipsec-next/master (26333c37fc28 xfrm: add IPv6 support for espintcp)
Merging mlx5-next/mlx5-next (c6bc6041b10f net/mlx5: Add support to get lag =
physical port)
Merging netfilter-next/master (354d86141796 Merge branch 'net-reduce-dynami=
c-lockdep-keys')
Merging ipvs-next/master (d54725cd11a5 netfilter: nf_tables: support for mu=
ltiple devices per netdev hook)
Merging wireless-drivers-next/master (790709f24972 net: relax SO_TXTIME CAP=
_NET_ADMIN check)
Merging bluetooth/master (9c3d75e256d9 Bluetooth: L2CAP: Fix errors during =
L2CAP_CREDIT_BASED_CONNECTION_REQ (0x17))
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
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_vma.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_lrc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_engine_=
types.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_dom=
ain.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_fb=
c.c
Applying: drm/i915/execlists: fix up for "Avoid reusing the same logical CC=
ID"
Merging amdgpu/drm-next (500bd19a7e5d drm/amdgpu: only set DPM_FLAG_NEVER_S=
KIP for legacy ATPX BOCO)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dcn21/=
dcn21_resource.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_kms=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_drv=
.c
Merging drm-intel/for-linux-next (972282c4cf24 drm/i915/gen12: Add aux tabl=
e invalidate for all engines)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_lrc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_fb=
c.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dd=
i.c
Merging drm-tegra/drm/tegra/for-next (757338371608 drm/tegra: Clean up GPIO=
 includes)
Merging drm-misc/for-linux-next (02ed76b6da07 drivers: drm: panel: Add ASUS=
 TM5P5 NT35596 panel driver)
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
Merging sound/for-next (9ad06ebb9ad6 ALSA: Replace zero-length array with f=
lexible-array)
Merging sound-asoc/for-next (f8729a41aa17 Merge remote-tracking branch 'aso=
c/for-5.8' into asoc-next)
Merging modules/modules-next (5c3a7db0c7ec module: Harden STRICT_MODULE_RWX)
Merging input/next (9d17ad2369dc Input: atkbd - receive and use physcode->k=
eycode mapping from FW)
Merging block/for-next (327855b79b7f Merge branch 'for-5.8/block' into for-=
next)
Applying: bdi: bdi_dev_name() needs backing-dev.h
Merging device-mapper/for-next (580d206a4321 dm mpath: add Historical Servi=
ce Time Path Selector)
Merging pcmcia/pcmcia-next (a8c122f72d94 pcmcia: remove some unused space c=
haracters)
Merging mmc/next (c0b0789785c4 Merge branch 'fixes' into next)
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (d2923aa45356 mfd: intel-lpss: Fix Intel Elkhart L=
ake LPSS I2C input clock)
Merging backlight/for-backlight-next (62a1d3f623ac backlight: qcom-wled: Ad=
d support for WLED5 peripheral that is present on PM8150L PMICs)
Merging battery/for-next (2ad3d74e3c69 power: supply: core: Add type proper=
ty to uevent env)
Merging regulator/for-next (a9a82730e1a0 Merge remote-tracking branch 'regu=
lator/for-5.8' into regulator-next)
Merging security/next-testing (3e27a33932df security: remove duplicated inc=
lude from security.h)
Merging apparmor/apparmor-next (01df52d726b5 apparmor: remove duplicate che=
ck of xattrs on profile attachment.)
Merging integrity/next-integrity (2592677c0486 ima: Use ima_hash_algo for c=
ollision detection in the measurement list)
Applying: integrity: evm: Fix RCU list related warnings.
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
Merging smack/next (4ca75287064b Smack:- Remove redundant inode_smack cache)
Merging tomoyo/master (8f3d9f354286 Linux 5.7-rc1)
Merging tpmdd/next (40686e855d3c tpm/tpm_ftpm_tee: Use UUID API for exporti=
ng the UUID)
Merging watchdog/master (ae83d0b416db Linux 5.7-rc2)
Merging iommu/next (2673183070d8 Merge branches 'iommu/fixes' and 'core' in=
to next)
CONFLICT (content): Merge conflict in drivers/iommu/s390-iommu.c
Merging vfio/next (f44efca0493d vfio: Ignore -ENODEV when getting MSI cooki=
e)
Merging audit/next (0090c1edebf4 audit: Replace zero-length array with flex=
ible-array)
Merging devicetree/for-next (e7728fcf7dd7 docs: dt: convert writing-binding=
s.txt to ReST)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/dis=
play/panel/panel-common.yaml
Merging mailbox/mailbox-for-next (0a67003b1985 mailbox: imx: add SCU MU sup=
port)
Merging spi/for-next (6f277a2114fd Merge remote-tracking branch 'spi/for-5.=
8' into spi-next)
Merging tip/auto-latest (5545b0d34f37 Merge branch 'linus')
Merging clockevents/timers/drivers/next (c1ac28a4de6f Revert "clocksource: =
Avoid creating dead devices")
Merging edac/edac-for-next (dc63e28efa19 Merge branch 'edac-i10nm' into eda=
c-for-next)
Merging irqchip/irq/irqchip-next (4cea749d56be Revert "irqchip/xilinx: Enab=
le generic irq multi handler")
Merging ftrace/for-next (d013496f99c5 tracing: Convert local functions in t=
racing_map.c to static)
Merging rcu/rcu/next (d13fee049fa8 Default enable RCU list lockdep debuggin=
g with PROVE_RCU)
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
Merging workqueues/for-next (f187b6974f6d workqueue: Use IS_ERR and PTR_ERR=
 instead of PTR_ERR_OR_ZERO.)
Merging drivers-x86/for-next (438d8cafe482 watchdog: iTCO: fix link error)
Merging chrome-platform/for-next (94b8e516839f Merge remote-tracking branch=
 'origin/chrome-platform-5.7-fixes' into for-kernelci)
CONFLICT (content): Merge conflict in drivers/platform/chrome/chromeos_psto=
re.c
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (c85c7cdef3c9 leds: trigger: remove redundant assignm=
ent to variable ret)
Merging ipmi/for-next (d2c05cdb6510 ipmi:bt-bmc: Fix error handling and sta=
tus check)
Merging driver-core/driver-core-next (c78c31b374a6 Revert "Revert "driver c=
ore: Set fw_devlink to "permissive" behavior by default"")
CONFLICT (content): Merge conflict in drivers/base/dd.c
Merging usb/usb-next (b9cf2cb52433 usb: core: hub: use true,false for bool =
variable)
Merging usb-gadget/next (4a5dbd900957 dt-bindings: usb: add documentation f=
or aspeed usb-vhub)
Merging usb-serial/usb-next (788a4ee607e8 USB: serial: Use the correct styl=
e for SPDX License Identifier)
Merging usb-chipidea-next/ci-for-usb-next (6dbbbccdba61 usb: chipidea: Enab=
le user-space triggered role-switching)
Merging phy-next/next (50d35aa8c15f phy: cadence: salvo: add salvo phy driv=
er)
Merging tty/tty-next (57253ccd5831 serial: samsung: 32-bit access for TX/RX=
 hold registers)
Merging char-misc/char-misc-next (378c1ee2227f crypto: xilinx - Remove set =
but not used variable 'drv_ctx')
Merging extcon/extcon-next (108339e7a4fe extcon: remove redundant assignmen=
t to variable idx)
Merging soundwire/next (f48f4fd9fefb soundwire: bus: reduce verbosity on en=
umeration)
Merging thunderbolt/next (57d8df68eb53 thunderbolt: Add support for Intel T=
iger Lake)
Merging staging/staging-next (2e11cc1ab790 staging: vt6656: Use const for r=
ead only data)
Merging mux/for-next (f356d58c3a04 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (4b54bf4763e3 interconnect: imx: Add platform driver f=
or imx8mn)
Merging slave-dma/next (bd96f1b2f43a dmaengine: dw-edma: support local dma =
device transfer semantics)
Merging cgroup/for-next (eec8fd0277e3 device_cgroup: Cleanup cgroup eBPF de=
vice filter code)
Merging scsi/for-next (bd4a4179ed42 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (29022b61307f scsi: lpfc: Update lpfc version to =
12.8.0.1)
Merging vhost/linux-next (e26e8b694ea7 virtio_net: CTRL_GUEST_OFFLOADS depe=
nds on CTRL_VQ)
Merging rpmsg/for-next (391ca8ba6781 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (9e581cd14663 Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (3831c051dfbf tools: gpio: add bias flags t=
o lsgpio)
Merging gpio-intel/for-next (7e73aa90a38c gpio: merrifield: Better show how=
 GPIO and IRQ bases are derived from hardware)
Merging pinctrl/for-next (9e692aa8d3f8 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (6d649fca3491 pinctrl: intel: Move npins clo=
ser to pin_base in struct intel_community)
Merging pinctrl-samsung/for-next (f354157a7d18 pinctrl: samsung: Save/resto=
re eint_mask over suspend for EINT_TYPE GPIOs)
Merging pwm/for-next (6f0841a8197b pwm: Add support for Azoteq IQS620A PWM =
generator)
Merging userns/for-next (2dd8083f6d8a posix-cpu-timers: Use pids not tasks =
in lookup)
Merging ktest/for-next (1091c8fce8aa ktest: Fix typos in ktest.pl)
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (66d69e081b52 selftests: fix kvm relocatable native/=
cross builds and installs)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (aa4673232ef6 Merge branch 'for-5.8/klp-modul=
e-fixups' into for-next)
CONFLICT (content): Merge conflict in kernel/module.c
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
Merging hyperv/hyperv-next (28ebc6e452a1 Driver: hv: vmbus: drop a no long =
applicable comment)
Merging auxdisplay/auxdisplay (2f920c0f0e29 auxdisplay: charlcd: replace ze=
ro-length array with flexible-array member)
Merging kgdb/kgdb/for-next (1137a96f9b5a kgdb: Return true in kgdb_nmi_poll=
_knock())
Merging pidfd/for-next (6952a4f64644 selftests: add pid namespace ENOMEM re=
gression test)
Merging devfreq/devfreq-next (8a432ccc96f2 PM / devfreq: imx-bus: Fix incon=
sistent IS_ERR and PTR_ERR)
Merging hmm/hmm (65afd0405ffa MAINTAINERS: add HMM selftests)
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
Merging akpm-current/current (aaef0cec6ae7 ipc-convert-ipcs_idr-to-xarray-u=
pdate)
CONFLICT (content): Merge conflict in tools/testing/selftests/vm/Makefile
CONFLICT (content): Merge conflict in include/linux/printk.h
CONFLICT (content): Merge conflict in arch/x86/Kconfig.debug
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
CONFLICT (content): Merge conflict in arch/arm64/include/asm/pgtable.h
CONFLICT (content): Merge conflict in arch/arm64/Kconfig
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (7fb396380f04 drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/v8d3v=yZXZE2BkibMQrSJUF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl61P20ACgkQAVBC80lX
0GyNwwgAk0JE5cPi+fowezFCzTau5sFsQh6SQR6qWi55/fa4VVJrj5Kiz+TzUH6l
4okgSF0BijVAzu+QHF1m29O/GhjRkF+9fEa36kSMBVf7PD/g6fKamDljogpXylD5
a60z6NvlNMVryorUDCIfpqHeNv7UfvlDUhBo87MopkuQ2JxoAuZPtDTD9N49FHuq
5TRPAoSK4prEmu/XUphKgUf3u2hlNfWcSlciXa1/LlgISLjYYz/UXGAN8rQlgrfy
LWUYqo2Uu6eLaPCIF6L5i4DIP31STwemrM0WMmze1YV0i4WYR6suRtn37Mt2HOJU
sVkTMBL3i8ahI38rbO50monf0AgP0Q==
=GiKR
-----END PGP SIGNATURE-----

--Sig_/v8d3v=yZXZE2BkibMQrSJUF--
