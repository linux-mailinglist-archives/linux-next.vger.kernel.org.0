Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F48913D697
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2020 10:19:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbgAPJRy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jan 2020 04:17:54 -0500
Received: from ozlabs.org ([203.11.71.1]:34851 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726684AbgAPJRw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Jan 2020 04:17:52 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47yzB006fcz9sPW;
        Thu, 16 Jan 2020 20:17:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579166264;
        bh=+02UdaaizX+NAJoxrWYe27kjHuvkvLZ4OmYI5vux33o=;
        h=Date:From:To:Cc:Subject:From;
        b=NtSRB7eCkjrmExft2pcisCEI9lMOVoAuX9O7N642NydgZBs69kLIquH7v3tF1N/6D
         +ARHth3RZTSVQ7P7TbgIgJ5MtRNjDkeYXBsmqysAPfGnnoR5Oc+0zEBshcHGAHKLni
         EJYjhn3evwd0RSQC7a9oUoPNs0AOCS7HZtf/EoOPMRbhmJ1l5sLltt2X3YI7S9NxWb
         ylZ8JdRAbzVD5QEEdw8bAQQpZ94pzYHiU6SgUvDOOClJakzumpA9DL4GWrfad+2P6Q
         Lfnkx9/OukPsG2ud1NdFLhfetzJCP0jyMxObtOxpvk+kUtnuEQRJ1/nlwZNHaUw+sA
         mWEf/6cQlYzNg==
Date:   Thu, 16 Jan 2020 20:17:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jan 16
Message-ID: <20200116201741.378b701a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=9FlcQIsFpWlZoUxTaVPzyv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=9FlcQIsFpWlZoUxTaVPzyv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20200115:

New tree: zonefs

The sound-asoc tree lost its build failure.

The net-next tree gained a build failure for which I reverted a commit.

The keys tree still had build failures so I used the version from
next-20191211.

The kvm tree gained a conflict against the tip tree.

The generic-ioremap tree gained a conflict against the drm-misc tree.

The kunit-next tree gained a build failure due to an interaction with
the pm tree for which I disabled a CONFIG option.

The akpm tree gained a conflict against the cifs tree.

Non-merge commits (relative to Linus' tree): 8365
 8699 files changed, 400817 insertions(+), 183961 deletions(-)

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
Merging origin/master (51d69817519f Merge tag 'platform-drivers-x86-v5.5-3'=
 of git://git.infradead.org/linux-platform-drivers-x86)
Merging fixes/master (d21718ad2f81 evh_bytechan: fix out of bounds accesses)
Merging kbuild-current/fixes (3a562aee727a Merge tag 'for-5.5-rc4-tag' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux)
Merging arc-current/for-curr (7980dff398f8 ARC: [plat-axs10x]: Add missing =
multicast filter number to GMAC node)
Merging arm-current/fixes (39f4d4410484 Merge branch 'misc' into fixes)
Merging arm-soc-fixes/arm/fixes (b47611c8c389 Merge tag 'v5.5-rockchip-dtsf=
ixes' of git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip=
 into arm/fixes)
Merging arm64-fixes/for-next/fixes (aa638cfe3e73 arm64: cpu_errata: Add His=
ilicon TSV110 to spectre-v2 safe list)
Merging m68k-current/for-linus (5ed0794cde59 m68k/atari: Convert Falcon IDE=
 drivers to platform drivers)
Merging powerpc-fixes/fixes (6da3eced8c5f powerpc/spinlocks: Include correc=
t header for static key)
Merging s390-fixes/fixes (40260b01d029 s390/setup: Fix secure ipl message)
Merging sparc/master (548f0b9a5f4c sparc: Add .exit.data section.)
Merging fscrypt-current/for-stable (ae64f9bd1d36 Linux 4.15-rc2)
Merging net/master (8b792f84c637 Merge branch 'mlxsw-Various-fixes')
Merging bpf/master (555089fdfc37 bpftool: Fix printing incorrect pointer in=
 btf_dump_ptr)
Merging ipsec/master (8aaea2b0428b xfrm: interface: do not confirm neighbor=
 when do pmtu update)
Merging netfilter/master (212e7f56605e netfilter: arp_tables: init netns po=
inter in xt_tgdtor_param struct)
Merging ipvs/master (c24b75e0f923 ipvs: move old_secure_tcp into struct net=
ns_ipvs)
Merging wireless-drivers/master (33328bfab892 MAINTAINERS: change Gruszka's=
 email address)
Merging mac80211/master (8b792f84c637 Merge branch 'mlxsw-Various-fixes')
Merging rdma-fixes/for-rc (9554de394b7e i40iw: Remove setting of VMA privat=
e data and use rdma_user_mmap_io)
Merging sound-current/for-linus (5d1b71226dc4 ALSA: usb-audio: fix sync-ep =
altsetting sanity check)
Merging sound-asoc-fixes/for-linus (10532933048a Merge branch 'asoc-5.5' in=
to asoc-linus)
Merging regmap-fixes/for-linus (b3a987b0264d Linux 5.5-rc6)
Merging regulator-fixes/for-linus (b3a987b0264d Linux 5.5-rc6)
Merging spi-fixes/for-linus (4e3f4e93b430 Merge branch 'spi-5.5' into spi-l=
inus)
Merging pci-current/for-linus (ca01e7987463 PCI: rockchip: Fix IO outbound =
ATU register number)
Merging driver-core.current/driver-core-linus (d1eef1c61974 Linux 5.5-rc2)
Merging tty.current/tty-linus (b3a987b0264d Linux 5.5-rc6)
Merging usb.current/usb-linus (9c06ac4c83df usb: core: hub: Improved device=
 recognition on remote wakeup)
Merging usb-gadget-fixes/fixes (e5b5da96da50 usb: gadget: fix wrong endpoin=
t desc)
Merging usb-serial-fixes/usb-linus (5e28055f3402 USB: serial: opticon: fix =
control-message timeouts)
Merging usb-chipidea-fixes/ci-for-usb-stable (16009db47c51 usb: chipidea: u=
dc: workaround for endpoint conflict issue)
Merging phy/fixes (4f510aa10468 phy/rockchip: inno-hdmi: round clock rate d=
own to closest 1000 Hz)
Merging staging.current/staging-linus (9fea3a40f6b0 staging: comedi: ni_rou=
tes: allow partial routing information)
Merging char-misc.current/char-misc-linus (fb85145c0444 Documentation/proce=
ss: Add Amazon contact for embargoed hardware issues)
Merging soundwire-fixes/fixes (e42617b825f8 Linux 5.5-rc1)
Merging thunderbolt-fixes/fixes (b3a987b0264d Linux 5.5-rc6)
Merging input-current/for-linus (6b32391ed675 Input: sur40 - fix interface =
sanity checks)
Merging crypto-current/master (cb1eeb75cf3d crypto: hisilicon/sec2 - Use at=
omics instead of __sync)
Merging ide/master (baf6722aa0cb ide: Use dev_get_drvdata where possible)
Merging vfio-fixes/for-linus (95f89e090618 vfio/type1: Initialize resv_msi_=
base)
Merging kselftest-fixes/fixes (c79f46a28239 Linux 5.5-rc5)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging slave-dma-fixes/fixes (c79f46a28239 Linux 5.5-rc5)
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (b3a987b0264d Linux 5.5-rc6)
Merging mfd-fixes/for-mfd-fixes (603d9299da32 mfd: mt6397: Fix probe after =
changing mt6397-core)
Merging v4l-dvb-fixes/fixes (8821e92879a3 Merge tag 'v5.5-rc5' into patchwo=
rk)
Merging reset-fixes/reset/fixes (db23808615e2 reset: Do not register resour=
ce data for missing resets)
Merging mips-fixes/mips-fixes (bbcc5672b006 MIPS: Avoid VDSO ABI breakage d=
ue to global register variable)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (03729cfa0d54 soc: ti: wkup_m3_ipc: Fix race condi=
tion with rproc_boot)
Merging kvm-fixes/master (ae6088216ce4 Merge tag 'trace-v5.5-rc5' of git://=
git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging kvms390-fixes/master (fe33a928bfcd KVM: s390: ENOTSUPP -> EOPNOTSUP=
P fixups)
Merging hwmon-fixes/hwmon (20358214d96b hwmon: (adt7475) Make volt2reg retu=
rn same reg as reg2volt input)
Merging nvdimm-fixes/libnvdimm-fixes (c14685547762 tools/testing/nvdimm: Fi=
x mock support for ioremap)
Merging btrfs-fixes/next-fixes (a5d2e199f98d Merge branch 'misc-5.5' into n=
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
Merging scsi-fixes/fixes (529244bd1afc scsi: enclosure: Fix stale device oo=
ps with hot replug)
Merging drm-fixes/drm-fixes (023b3b0e139f Merge tag 'drm-intel-fixes-2020-0=
1-09-1' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (88550e1c345c drm/i915/pmu: Do=
 not use colons or dashes in PMU names)
Merging mmc-fixes/fixes (f667216c5c7c mmc: sdhci-of-esdhc: re-implement err=
atum A-009204 workaround)
Merging rtc-fixes/rtc-fixes (f01f4ffdfb70 rtc: cmos: Revert "rtc: Fix the A=
ltCentury value on AMD/Hygon platform")
Merging gnss-fixes/gnss-linus (d1eef1c61974 Linux 5.5-rc2)
Merging hyperv-fixes/hyperv-fixes (af42d3466bdc Linux 5.4-rc8)
Merging soc-fsl-fixes/fix (5674a92ca4b7 soc/fsl/qe: Fix an error code in qe=
_pin_request())
Merging risc-v-fixes/fixes (dc6fcba72f04 riscv: Fixup obvious bug for fp-re=
gs reset)
Merging pidfd-fixes/fixes (f6ae196fb904 ptrace: reintroduce usage of subjec=
tive credentials in ptrace_has_cap())
Merging fpga-fixes/fixes (dec43da46f63 fpga: altera-ps-spi: Fix getting of =
optional confd gpio)
Merging spdx/spdx-linus (2f13437b8917 Merge tag 'trace-v5.5-2' of git://git=
.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging gpio-intel-fixes/fixes (e42617b825f8 Linux 5.5-rc1)
Merging pinctrl-intel-fixes/fixes (9608ea6c6613 pinctrl: sunrisepoint: Add =
missing Interrupt Status register offset)
Merging erofs-fixes/fixes (d1eef1c61974 Linux 5.5-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (7617e9621bf2 drm/dp_mst: clear=
 time slots for ports invalid)
Merging kspp-gustavo/for-next/kspp (3d519d6d388b sh: kgdb: Mark expected sw=
itch fall-throughs)
Merging kbuild/for-next (6d5a8286859d Merge branch 'kconfig' into for-next)
Merging compiler-attributes/compiler-attributes (54ecb8f7028c Linux 5.4-rc1)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (a7ba70f1787f dma-mapping: treat dev->bus_dma_=
mask as a DMA limit)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (9fbea0b7e842 ARC: add kmemleak support)
Merging arm/for-next (04bb96427d4e ARM: 8947/1: Fix __arch_get_hw_counter()=
 access to CNTVCT)
Merging arm64/for-next/core (734e048ba967 Merge branches 'for-next/asm-anno=
tations', 'for-next/cpufeatures', 'for-next/e0pd', 'for-next/kbuild', 'for-=
next/kexec/cleanup', 'for-next/kexec/file-kdump', 'for-next/misc', 'for-nex=
t/nofpsimd' and 'for-next/perf' into for-next/core)
Merging arm-perf/for-next/perf (8703317ae576 drivers/perf: hisi: update the=
 sccl_id/ccl_id for certain HiSilicon platform)
Merging arm-soc/for-next (1030a23b6799 ARM: Document merges)
Merging amlogic/for-next (592f9d4dd2d2 Merge branch 'v5.6/defconfig' into t=
mp/aml-rebuild)
Merging aspeed/for-next (e4aab38ed5d1 ARM: dts: aspeed: Add SD card for Ves=
nin)
Merging at91/at91-next (dae9ab4a6f5f Merge branches 'at91-soc', 'at91-dt' a=
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
Merging qcom/for-next (a571abc84338 Merge branches 'arm64-defconfig-for-5.6=
', 'arm64-for-5.6', 'defconfig-for-5.6', 'drivers-for-5.6' and 'dts-for-5.6=
' into for-next)
Merging realtek/for-next (45698e00d5a9 Merge branch 'v5.6/dt' into next)
Merging renesas/next (9e4188a77f5e Merge branch 'renesas-drivers-for-v5.6' =
into renesas-next)
Merging reset/reset/next (08d7c09952e2 dt-bindings: reset: intel,rcu-gw: Fi=
x intel,global-reset schema)
Merging rockchip/for-next (1b696048967b Merge branch 'v5.6-armsoc/dts64' in=
to for-next)
Merging samsung-krzk/for-next (aeffbe354c53 Merge branch 'next/dt' into for=
-next)
Merging scmi/for-linux-next (c79f46a28239 Linux 5.5-rc5)
Merging sunxi/sunxi/for-next (7493e675c584 Merge remote-tracking branches '=
sunxi-korg/sunxi/clk-fixes-for-5.5', 'sunxi-korg/sunxi/fixes-for-5.5', 'sun=
xi-korg/sunxi/config-for-5.6', 'sunxi-korg/sunxi/config64-for-5.6', 'sunxi-=
korg/sunxi/clk-for-5.6' and 'sunxi-korg/sunxi/dt-for-5.6' into sunxi/for-ne=
xt)
Merging tegra/for-next (9a55272ef4d5 Merge branch for-5.6/clk into for-next)
Merging clk/clk-next (ffae3d9155ac Merge branch 'clk-fixes' into clk-next)
Merging clk-samsung/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (89366173a8d0 csky/Kconfig: Add Kconfig.platforms t=
o support some drivers)
Merging h8300/h8300-next (a5de8865cb3e h8300: move definition of __kernel_s=
ize_t etc. to posix_types.h)
Merging ia64/next (240b62d381fe ia64: remove stale paravirt leftovers)
Merging m68k/for-next (6aabc1facdb2 m68k: Implement copy_thread_tls())
Merging m68knommu/for-next (b3a987b0264d Linux 5.5-rc6)
Merging microblaze/next (22648c989cb8 microblaze: Increase max dtb size to =
64K from 32K)
Merging mips/mips-next (1590b1eb9370 dt-bindings: Document loongson vendor-=
prefix)
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
Merging risc-v/for-next (9e9a1ad1ece4 riscv: keep 32-bit kernel to 32-bit p=
hys_addr_t)
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
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
Merging fscrypt/master (2d8f7f119b0b fscrypt: document gfp_flags for bounce=
 page allocation)
Merging afs/afs-next (4fe171bb81b1 afs: Remove set but not used variable 'r=
et')
Merging btrfs/for-next (1645e68458d6 Merge branch 'for-next-next-v5.5-20200=
115' into for-next-20200115)
Merging ceph/master (da08e1e1d7c3 ceph: add more debug info when decoding m=
dsmap)
Merging cifs/for-next (ea1b21c1d916 CIFS: Add support for setting owner inf=
o, dos attributes, and create time)
Merging configfs/for-next (e2f238f7d5a1 configfs: calculate the depth of pa=
rent item)
Merging ecryptfs/next (b4a81b87a4cf ecryptfs: fix a memory leak bug in ecry=
ptfs_init_messaging())
Merging erofs/dev (4d2024370d87 erofs: fix out-of-bound read for shifted un=
compressed block)
Merging ext3/for_next (a4a8b99ec819 udf: Fix free space reporting for metad=
ata and virtual partitions)
Merging ext4/dev (2c9dbf521b5a ext4: Add EXT4_IOC_FSGETXATTR/EXT4_IOC_FSSET=
XATTR to compat_ioctl)
Merging f2fs/dev (7d036894369c f2fs: change to use rwsem for gc_mutex)
Merging fsverity/fsverity (da3a3da4e6c6 fs-verity: use u64_to_user_ptr())
Merging fuse/for-next (8d66fcb74884 fuse: fix Kconfig indentation)
Merging jfs/jfs-next (a5fdd713d256 jfs: fix bogus variable self-initializat=
ion)
Merging nfs/linux-next (b3a987b0264d Linux 5.5-rc6)
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
Merging xfs/for-next (ca78eee7b4ac xfs: Add __packed to xfs_dir2_sf_entry_t=
 definition)
Merging iomap/iomap-for-next (62e298db3fc3 fs: Fix page_mkwrite off-by-one =
errors)
Merging djw-vfs/vfs-for-next (3253d9d09337 splice: only read in as much inf=
ormation as there is pipe buffer space)
Merging file-locks/locks-next (98ca480a8f22 locks: print unsigned ino in /p=
roc/locks)
Merging vfs/for-next (6c3530271c60 Merge branch 'work.misc' into for-next)
CONFLICT (content): Merge conflict in arch/m68k/kernel/syscalls/syscall.tbl
Applying: fs: fix up for !CONFIG_BLOCK and bmap
Merging printk/for-next (e616b43fb3a3 Merge branch 'for-5.6' into for-next)
Merging pci/next (fdfe7c23ebdc Merge branch 'remotes/lorenzo/pci/dwc')
Merging pstore/for-next/pstore (e163fdb3f7f8 pstore/ram: Regularize prz lab=
el allocation lifetime)
Merging hid/for-next (d036ff0e56a7 Merge branch 'for-5.6/logitech' into for=
-next)
Merging i2c/i2c/for-next (e18370a2a9dd Merge branch 'i2c/for-5.6' into i2c/=
for-next)
Merging i3c/i3c/next (3952cf8ff2f7 i3c: master: dw: reattach device on firs=
t available location of address table)
Merging dmi/master (2429c99fa13a firmware: dmi: Add dmi_memdev_handle)
Merging hwmon-staging/hwmon-next (1bbc9a9c2e94 MAINTAINERS: add entry for A=
DM1177 driver)
Merging jc_docs/docs-next (a1986433a9fd Documentation: filesystems: convert=
 vfat.txt to RST)
Merging v4l-dvb/master (2a0a0bc7020e media: MAINTAINERS: add entry for Rock=
chip ISP1 driver)
Merging v4l-dvb-next/master (d45331b00ddb Linux 5.3-rc4)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (a643e143acc2 Merge branch 'intel_idle+acpi' into lin=
ux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (8ead819f1bef cpufreq: s3c: fix =
unbalances of cpufreq policy refcount)
Merging cpupower/cpupower (e42617b825f8 Linux 5.5-rc1)
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
Merging rdma/for-next (5c55cfd6a553 RDMA/core: Use READ_ONCE for ib_ufile.a=
sync_file)
Merging net-next/master (1ccf6c13d9c7 devlink: fix typos in qed documentati=
on)
Merging bpf-next/master (990bca1fc8ad Merge branch 'bpf-batch-ops')
Merging ipsec-next/master (e27cca96cd68 xfrm: add espintcp (RFC 8229))
CONFLICT (content): Merge conflict in net/unix/af_unix.c
Merging mlx5-next/mlx5-next (ca1992c62cad net/mlx5: Expose vDPA emulation d=
evice capabilities)
Merging netfilter-next/master (428cd5232482 sfc/ethtool_common: Make some f=
unction to static)
Merging nfc-next/master (1f008cfec5d5 NFC: fdp: Fix unused variable warning=
s)
CONFLICT (content): Merge conflict in drivers/nfc/st21nfca/se.c
Merging ipvs-next/master (d54725cd11a5 netfilter: nf_tables: support for mu=
ltiple devices per netdev hook)
Merging wireless-drivers-next/master (e07c5f2e4e91 net: amd: a2065: Use pri=
nt_hex_dump_debug() helper)
Merging bluetooth/master (bb2500ab0270 Bluetooth: hci_qca: Retry btsoc init=
ialize when it fails)
Merging mac80211-next/master (30b2f0be23fb mac80211: add ieee80211_is_any_n=
ullfunc())
Merging gfs2/for-next (2b0fb353c029 gfs2: Avoid access time thrashing in gf=
s2_inode_lookup)
Merging mtd/mtd/next (589e1b6c47ce Merge tag 'nand/for-5.5' into mtd/next)
Merging nand/nand/next (61af58cf19a3 mtd: rawnand: gpmi: Restore nfc timing=
 setup after suspend/resume)
Merging spi-nor/spi-nor/next (707745e8d4e7 mtd: spi-nor: Add support for mx=
25r3235f)
Merging crypto/master (b279997f6c60 crypto: exynos-rng - Rename Exynos to l=
owercase)
Merging drm/drm-next (71e7274066c6 Merge tag 'drm-intel-next-2020-01-14' of=
 git://anongit.freedesktop.org/drm/drm-intel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/mediatek/mtk_drm_crtc=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem_gtt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_ring_su=
bmission.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_gt_pm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_obj=
ect.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_di=
splay.c
Merging amdgpu/drm-next (094839fd35d7 pci: add ATS quirk for navi14 board (=
v2))
Merging drm-intel/for-linux-next (f78d5da6e7bd drm/i915/tgl: Add Wa_1409825=
376 to tgl)
Merging drm-tegra/drm/tegra/for-next (033ccdb7f6b1 gpu: host1x: Remove dev_=
err() on platform_get_irq() failure)
Merging drm-misc/for-linux-next (e4eed858357a video: fbdev: nvidia: clean u=
p indentation issues and comment block)
Merging drm-msm/msm-next (5f9935f514d6 drm/msm: Fix error about comments wi=
thin a comment block)
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (4d24376370fb gpu: ipu-v3: image-convert: only=
 sample into the next tile if necessary)
Merging etnaviv/etnaviv/next (22567d017c2c dt-bindings: etnaviv: Add #cooli=
ng-cells)
Merging regmap/for-next (e15bc1e11b17 Merge branch 'regmap-5.6' into regmap=
-next)
Merging sound/for-next (a3afa29942b8 ALSA: usb-audio: unlock on error in pr=
obe)
Merging sound-asoc/for-next (a03494c987f8 Merge branch 'asoc-5.6' into asoc=
-next)
Merging modules/modules-next (f6d061d61712 kernel/module: Fix memleak in mo=
dule_add_modinfo_attrs())
Merging input/next (1bdd3e05a0a3 Merge tag 'v5.5-rc5' into next)
Merging block/for-next (126c20adbd98 Merge branch 'for-5.6/io_uring-vfs' in=
to for-next)
Merging device-mapper/for-next (be240ff5e402 dm mpath: Add timeout mechanis=
m for queue_if_no_path)
Merging pcmcia/pcmcia-next (71705c611263 PCMCIA/i82092: remove #if 0 block)
Merging mmc/next (9f606f11ea98 Merge branch 'fixes' into next)
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (ea9a89ca3b95 mfd: dln2: More sanity checking for =
endpoints)
Merging backlight/for-backlight-next (102a1b382177 backlight: qcom-wled: Fi=
x spelling mistake "trigged" -> "triggered")
Merging battery/for-next (bcfb7ae3f50b power: supply: axp20x_usb_power: Onl=
y poll while offline)
Merging regulator/for-next (50db69ae8567 Merge remote-tracking branch 'regu=
lator/topic/equal' into regulator-next)
Merging security/next-testing (45893a0abee6 kexec: Fix file verification on=
 S390)
Merging apparmor/apparmor-next (341c1fda5e17 apparmor: make it so work buff=
ers can be allocated from atomic context)
Merging integrity/next-integrity (ebaebd842e92 ima: Add a space after print=
ing LSM rules for readability)
Merging keys/keys-next (8c5864208538 Merge branch 'keys-acl' into keys-next)
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
[master e4f051a8c527] next-20191211/keys
Merging selinux/next (cfff75d8973a selinux: reorder hooks to make runtime d=
isable less broken)
CONFLICT (content): Merge conflict in include/linux/lsm_audit.h
Merging smack/for-next (92604e825304 smack: use GFP_NOFS while holding inod=
e_smack::smk_lock)
Merging tomoyo/master (a8772fad0172 tomoyo: Use atomic_t for statistics cou=
nter)
Merging tpmdd/next (b07f636fca1c Merge tag 'tpmdd-next-20200108' of git://g=
it.infradead.org/users/jjs/linux-tpmdd)
Merging watchdog/master (b3a987b0264d Linux 5.5-rc6)
Merging iommu/next (13ff7f0746fe Merge branches 'iommu/fixes', 'arm/smmu', =
'x86/amd', 'x86/vt-d' and 'core' into next)
Merging vfio/next (7b5372ba04ca vfio: platform: fix __iomem in vfio_platfor=
m_amdxgbe.c)
Merging audit/next (cb5172d96d16 audit: Add __rcu annotation to RCU pointer)
Merging devicetree/for-next (a6c4f77cb3b1 dt-bindings: iio: adc: ad7606: Fi=
x wrong maxItems value)
Merging mailbox/mailbox-for-next (c6c6bc6ea9fc mailbox: imx: add support fo=
r imx v1 mu)
Merging spi/for-next (5d622a9b1cbe Merge branch 'spi-5.6' into spi-next)
Merging tip/auto-latest (4364c15d0db3 Merge branch 'irq/urgent')
Merging clockevents/timers/drivers/next (e4c3b4213b79 clocksource/hyperv: S=
et TSC clocksource as default w/ InvariantTSC)
Merging edac/edac-for-next (a651c6c64431 EDAC/aspeed: Remove unneeded semic=
olon)
Merging irqchip/irq/irqchip-next (c6d732c8cc67 irqchip/aspeed-i2c-ic: Fix i=
rq domain name memory leak)
Merging ftrace/for-next (3b42a4c83a31 tracing: trigger: Replace unneeded RC=
U-list traversals)
Merging rcu/rcu/next (bead35304881 rcu: Add *_ONCE() to rcu_node ->boost_kt=
hread_status)
CONFLICT (content): Merge conflict in lib/Kconfig.debug
Applying: rcu: fix up for "Remove rcu_swap_protected()"
Merging kvm/linux-next (6948199a9af9 KVM: x86/mmu: WARN if root_hpa is inva=
lid when handling a page fault)
CONFLICT (content): Merge conflict in arch/x86/include/asm/vmx.h
Merging kvm-arm/next (c74555894492 KVM: arm/arm64: vgic: Handle GICR_PENDBA=
SER.PTZ filed as RAZ)
Merging kvm-ppc/kvm-ppc-next (30486e72093e KVM: PPC: Book3S HV: XIVE: Fix p=
otential page leak on error path)
Merging kvms390/next (c7b7de631246 KVM: s390: Do not yield when target is a=
lready running)
Merging xen-tip/linux-next (476878e4b2be xen-pciback: optionally allow inte=
rrupt enable flag writes)
Merging percpu/for-next (06557cf18eae Merge branch 'for-5.6' into for-next)
Merging workqueues/for-next (e8ab20d9bcb3 workqueue: remove workqueue_work =
event class)
Merging drivers-x86/for-next (26e66a0cf258 platform/x86: asus-wmi: Fix keyb=
oard brightness cannot be set to 0)
Merging chrome-platform/for-next (ffd7263e63fe platform/chrome: wilco_ec: F=
ix unregistration order)
Merging hsi/for-next (c1030cd45619 HSI: Remove dev_err() usage after platfo=
rm_get_irq())
Merging leds/for-next (260718b3a35d leds: lm3692x: Disable chip on brightne=
ss 0)
Merging ipmi/for-next (6b8526d3abc0 ipmi:ssif: Handle a possible NULL point=
er reference)
Merging driver-core/driver-core-next (a37f4958f7b6 debugfs: Return -EPERM w=
hen locked down)
CONFLICT (content): Merge conflict in include/linux/device.h
Merging usb/usb-next (d710562e01c4 usb: gadget: f_ecm: Use atomic_t to trac=
k in-flight request)
Merging usb-gadget/next (8d891e324f44 usb: gadget: f_ecm: Use atomic_t to t=
rack in-flight request)
Merging usb-serial/usb-next (b3a987b0264d Linux 5.5-rc6)
Merging usb-chipidea-next/ci-for-usb-next (4d6141288c33 usb: chipidea: imx:=
 pinctrl for HSIC is optional)
Merging phy-next/next (28a263814638 dt-bindings: phy: Add PHY_TYPE_DP defin=
ition)
CONFLICT (content): Merge conflict in drivers/phy/mediatek/Kconfig
Merging tty/tty-next (0095ab42056c vt: Correct comment documenting do_take_=
over_console())
Merging char-misc/char-misc-next (5a158981aafa siox: Use the correct style =
for SPDX License Identifier)
Merging extcon/extcon-next (b7365587f513 extcon: Remove unneeded extern key=
word from extcon.h)
Merging soundwire/next (a19efb5265c3 soundwire: intel: fix factor of two in=
 MCLK handling)
Merging thunderbolt/next (b3a987b0264d Linux 5.5-rc6)
Merging staging/staging-next (8297ca5e8c70 staging: android: ashmem: Replac=
e strcpy with strscpy)
Merging mux/for-next (f356d58c3a04 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (30c8fa3ec61a interconnect: qcom: Add MSM8916 intercon=
nect provider driver)
Merging slave-dma/next (4d3df16840a2 dmaengine: plx-dma: Implement descript=
or submission)
Merging cgroup/for-next (0c10e327ee03 Merge branch 'for-5.6' into for-next)
Merging scsi/for-next (7b34f400f5e7 Merge branch '5.5/scsi-fixes' into 5.6/=
scsi-next)
CONFLICT (content): Merge conflict in Documentation/core-api/index.rst
Merging scsi-mkp/for-next (7b34f400f5e7 Merge branch '5.5/scsi-fixes' into =
5.6/scsi-next)
Merging vhost/linux-next (d1281e3a562e virtio-blk: remove VIRTIO_BLK_F_SCSI=
 support)
CONFLICT (content): Merge conflict in drivers/block/virtio_blk.c
Merging rpmsg/for-next (447e58a8d18a Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (18c24c678282 Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/ven=
dor-prefixes.yaml
Merging gpio-brgl/gpio/for-next (1e4d149e9017 gpio: altera: change to platf=
orm_get_irq_optional to avoid false-positive error)
Merging gpio-intel/for-next (e42617b825f8 Linux 5.5-rc1)
Merging pinctrl/for-next (1c6fa93ac56f Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (af0c5330916a pinctrl: intel: Pass irqchip w=
hen adding gpiochip)
Merging pinctrl-samsung/for-next (225a2ec19aac pinctrl: samsung: Fix missin=
g OF and GPIOLIB dependency on S3C24xx and S3C64xx)
Merging pwm/for-next (f24e564129f3 pwm: Fix minor Kconfig whitespace issues)
Merging userns/for-next (61a47c1ad3a4 sysctl: Remove the sysctl system call)
Merging ktest/for-next (9b5f852ae20d ktest: Make default build option oldco=
nfig not randconfig)
Merging random/dev (09a6d00a42ce random: remove some dead code of poolinfo)
Merging kselftest/next (46d1a0f03d66 selftests/lkdtm: Add tests for LKDTM t=
argets)
Merging y2038/y2038 (b8c709bf963a Merge tags 'block-ioctl-cleanup-5.6' and =
'y2038-drivers-for-v5.6-signed' of git://git.kernel.org:/pub/scm/linux/kern=
el/git/arnd/playground into HEAD)
Merging livepatching/for-next (7f436b3066e3 Merge branch 'for-5.5/core' int=
o for-next)
Merging coresight/next (ad9882f15884 coresight: etm4x: Fix unused function =
warning)
Merging rtc/rtc-next (d53f9b68b359 rtc: pcf8563: Use BIT)
Merging nvdimm/libnvdimm-for-next (0dfbb932bb67 MAINTAINERS: Remove Keith f=
rom NVDIMM maintainers)
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
Merging nvmem/for-next (9d5e6165e358 nvmem: imx: ocotp: introduce ocotp_ctr=
l_reg)
Merging xarray/xarray (6b81141deb73 XArray: Improve documentation of search=
 marks)
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
Merging devfreq/devfreq-next (91d7f3f8f134 PM / devfreq: exynos: Rename Exy=
nos to lowercase)
Merging hmm/hmm (fd6988496e79 Linux 5.5-rc4)
Merging fpga/for-next (28910cee898c fpga: xilinx-pr-decoupler: Remove clk_g=
et error message for probe defer)
Merging kunit/test (e42617b825f8 Linux 5.5-rc1)
Merging cel/cel-next (a99d8080aaf3 Linux 5.4-rc6)
Merging kasan-bitops/topic/kasan-bitops (4f4afc2c9599 docs/core-api: Remove=
 possibly confusing sub-headings from Bit Operations)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
CONFLICT (content): Merge conflict in drivers/video/fbdev/s1d13xxxfb.c
CONFLICT (content): Merge conflict in drivers/soc/tegra/fuse/tegra-apbmisc.c
CONFLICT (content): Merge conflict in drivers/platform/x86/intel_telemetry_=
pltdrv.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/sfc/efx.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem_gtt.c
Applying: fix up for "drm/i915/gtt: split up i915_gem_gtt"
Applying: fix up for "sfc: move struct init and fini code"
Merging kunit-next/kunit (35c57fc3f8ea kunit: building kunit as a module br=
eaks allmodconfig)
Applying: disable CONFIG_KUNIT_DRIVER_PE_TEST for now
Merging zonefs/for-next (a83b9b8742cd zonefs: Add documentation)
Applying: Revert "pktgen: Allow configuration of IPv6 source address range"
Merging akpm-current/current (08cec080e27c ipc/msg.c: Adjust indentation in=
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
Applying: proc: decouple proc from VFS with "struct proc_ops"
Applying: proc: convert everything to "struct proc_ops"
CONFLICT (content): Merge conflict in fs/cifs/dfs_cache.c
Applying: proc-convert-everything-to-struct-proc_ops-fix
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
Merging akpm/master (9101c4453008 drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/=9FlcQIsFpWlZoUxTaVPzyv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4gKjUACgkQAVBC80lX
0Gxl7Af+Ir5fUy+C/iwV8SbeR9SgPtdKkiqvi7Fn/71yrh/6F/hM9hFddQJJT+cl
gZ5QQeY7MmQnqZ7fremPnRybSpt7Ux9vn/pzTCRb3XZh28YFCuY3t0BVt0FJhEDG
/EXMMseO8lOhwwiWIDiDyx+N9re2Tf4HH1XY3suGOjpw3hPcHu4DHrTNtWtTzzME
U4QpeAgs6XwRS3WdO0hx5e3Mc4WUTP8x9tcYZFaMgLRDO6rE3I+gfLieze4HCC5n
lXWB4+OKcBTyfW4dK2lR/xUK5rGXtLd0npHvx2soP8L05BbVwuQY709zdW2gqxoa
iHxUIPExbSsP+F5rQNYptwNz07mH2A==
=N+Cf
-----END PGP SIGNATURE-----

--Sig_/=9FlcQIsFpWlZoUxTaVPzyv--
