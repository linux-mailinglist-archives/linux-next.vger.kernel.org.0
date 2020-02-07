Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33BB2154FE0
	for <lists+linux-next@lfdr.de>; Fri,  7 Feb 2020 01:59:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbgBGA75 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 Feb 2020 19:59:57 -0500
Received: from ozlabs.org ([203.11.71.1]:44747 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726778AbgBGA75 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 6 Feb 2020 19:59:57 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48DH5L0Z0yz9sRK;
        Fri,  7 Feb 2020 11:59:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1581037190;
        bh=8kclhhls+VyIH4UGEFRBCEWeY9VbkJBYRnmrhYFTPFw=;
        h=Date:From:To:Cc:Subject:From;
        b=te5d/sMR3cuy/jwkolXkzvSqU/+x4Lr/+kIk7l/YRXV7YQ3gOKdT2yUKnOYr/lNw6
         fJV9svVdWNSd9KJu/hvXewBLMi0bRUaGre8g7YqZMUObOc+wFCYd4C8kNfkIbaRjg6
         5aCHkES97LtfPSc8z0o3wkpeBSEsZrMaFEOOLuXqA6btaPC+QrtThhxx6IM+jwlElj
         eUY4SsS6WEqeWJ3POHm/dFnPYdwVrDQXOI+8/BFwMVVG+bZOFMYAF8M6NE+cnY6CK5
         w/jqTWUJncImjQdGYNZeSZBqRFVYhV+OL7MMsjavrwVem8q6kRiB7DNsiXjggGE+4y
         i7BsemM4JNbzg==
Date:   Fri, 7 Feb 2020 11:59:49 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 7
Message-ID: <20200207115949.7bd62ec3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/f2sPwDNq1TQH.YLGLW=v3HS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/f2sPwDNq1TQH.YLGLW=v3HS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Please do not add any v5.7 material to your linux-next included
branches until after v5.6-rc1 has been released.

Changes since 20200206:

The fuse tree gained a conflict against Linus' tree.

The vfs tree gained a conflict against the fuse tree.

Non-merge commits (relative to Linus' tree): 1982
 1765 files changed, 72555 insertions(+), 31470 deletions(-)

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
Merging origin/master (90568ecf5615 Merge tag 'kvm-5.6-2' of git://git.kern=
el.org/pub/scm/virt/kvm/kvm)
Merging fixes/master (ba954bf6cb38 evh_bytechan: fix out of bounds accesses)
Merging kbuild-current/fixes (754beeec1d90 Merge tag 'char-misc-5.6-rc1-2' =
of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc)
Merging arc-current/for-curr (f45ba2bd6da0 ARCv2: fpu: preserve userspace f=
pu state)
Merging arm-current/fixes (6849b5eba196 ARM: 8955/1: virt: Relax arch timer=
 version check during early boot)
Merging arm-soc-fixes/arm/fixes (6716cb162deb Merge tag 'omap-for-fixes-whe=
never-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux=
-omap into arm/fixes)
Merging arm64-fixes/for-next/fixes (aa638cfe3e73 arm64: cpu_errata: Add His=
ilicon TSV110 to spectre-v2 safe list)
Merging m68k-current/for-linus (6aabc1facdb2 m68k: Implement copy_thread_tl=
s())
Merging powerpc-fixes/fixes (5d2e5dd5849b powerpc/mm/hash: Fix sharing cont=
ext ids between kernel & userspace)
Merging s390-fixes/fixes (def9d2780727 Linux 5.5-rc7)
Merging sparc/master (11648b8339f8 sparc64: fix adjtimex regression)
Merging fscrypt-current/for-stable (ae64f9bd1d36 Linux 4.15-rc2)
Merging net/master (263a425a482f net: systemport: Avoid RBUF stuck in Wake-=
on-LAN mode)
Merging bpf/master (b9e427248885 Merge branch 'bpf-xsk-fixes')
Merging ipsec/master (a444ad1432c5 Merge branch 'netdevsim-fix-several-bugs=
-in-netdevsim-module')
Merging netfilter/master (83d0585f91da Merge branch 'Fix-reconnection-laten=
cy-caused-by-FIN-ACK-handling-race')
Merging ipvs/master (c24b75e0f923 ipvs: move old_secure_tcp into struct net=
ns_ipvs)
Merging wireless-drivers/master (ebe8e6116ac4 rtw88: Fix return value of rt=
w_wow_check_fw_status)
Merging mac80211/master (8b792f84c637 Merge branch 'mlxsw-Various-fixes')
Merging rdma-fixes/for-rc (9554de394b7e i40iw: Remove setting of VMA privat=
e data and use rdma_user_mmap_io)
Merging sound-current/for-linus (6954b323a183 Merge tag 'asoc-v5.6-3' of ht=
tps://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-linus)
Merging sound-asoc-fixes/for-linus (4492e51e32fb Merge branch 'asoc-5.6' in=
to asoc-linus)
Merging regmap-fixes/for-linus (def9d2780727 Linux 5.5-rc7)
Merging regulator-fixes/for-linus (d670b40cfde8 Merge branch 'regulator-5.6=
' into regulator-linus)
Merging spi-fixes/for-linus (7b206f064457 Merge branch 'spi-5.6' into spi-l=
inus)
Merging pci-current/for-linus (2e34673be0bd PCI/ATS: Use PF PASID for VFs)
Merging driver-core.current/driver-core-linus (6992ca0dd017 Merge branch 'p=
arisc-5.6-1' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc=
-linux)
Merging tty.current/tty-linus (6992ca0dd017 Merge branch 'parisc-5.6-1' of =
git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux)
Merging usb.current/usb-linus (6992ca0dd017 Merge branch 'parisc-5.6-1' of =
git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux)
Merging usb-gadget-fixes/fixes (e5b5da96da50 usb: gadget: fix wrong endpoin=
t desc)
Merging usb-serial-fixes/usb-linus (def9d2780727 Linux 5.5-rc7)
Merging usb-chipidea-fixes/ci-for-usb-stable (16009db47c51 usb: chipidea: u=
dc: workaround for endpoint conflict issue)
Merging phy/fixes (4f510aa10468 phy/rockchip: inno-hdmi: round clock rate d=
own to closest 1000 Hz)
Merging staging.current/staging-linus (9e6c535c64ad Merge tag 'pci-v5.6-fix=
es-1' of git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci)
Merging char-misc.current/char-misc-linus (9e6c535c64ad Merge tag 'pci-v5.6=
-fixes-1' of git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci)
Merging soundwire-fixes/fixes (e42617b825f8 Linux 5.5-rc1)
Merging thunderbolt-fixes/fixes (d5226fa6dbae Linux 5.5)
Merging input-current/for-linus (b19efcabb587 Merge branch 'next' into for-=
linus)
Merging crypto-current/master (2343d1529aff crypto: Kconfig - allow tests t=
o be disabled when manager is disabled)
Merging ide/master (94f2630b1897 Merge tag '5.6-rc-small-smb3-fix-for-stabl=
e' of git://git.samba.org/sfrench/cifs-2.6)
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
Merging omap-fixes/fixes (b0b039515445 ARM: dts: am43x-epos-evm: set data p=
in directions for spi0 and spi1)
Merging kvm-fixes/master (6992ca0dd017 Merge branch 'parisc-5.6-1' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux)
Merging kvms390-fixes/master (fe33a928bfcd KVM: s390: ENOTSUPP -> EOPNOTSUP=
P fixups)
Merging hwmon-fixes/hwmon (7fee59f20781 hwmon: (pmbus/ltc2978) Fix PMBus po=
lling of MFR_COMMON definitions.)
Merging nvdimm-fixes/libnvdimm-fixes (c14685547762 tools/testing/nvdimm: Fi=
x mock support for ioremap)
Merging btrfs-fixes/next-fixes (5715b7fa8d8d Merge branch 'misc-5.5' into n=
ext-fixes)
Merging vfs-fixes/fixes (d0cb50185ae9 do_last(): fetch directory ->i_mode a=
nd ->i_uid before it's too late)
Merging dma-mapping-fixes/for-linus (9c24eaf81cc4 iommu/vt-d: Return the co=
rrect dma mask when we are bypassing the IOMMU)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (6992ca0dd017 Merge branch 'parisc-5.6-1' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux)
Merging samsung-krzk-fixes/fixes (a2315d3aea59 ARM: exynos_defconfig: Resto=
re debugfs support)
Merging pinctrl-samsung-fixes/pinctrl-fixes (e42617b825f8 Linux 5.5-rc1)
Merging devicetree-fixes/dt/linus (04dbd86539fd dt-bindings: Fix paths in s=
chema $id fields)
Merging scsi-fixes/fixes (e0a514259378 scsi: ufs: fix spelling mistake "ini=
tilized" -> "initialized")
Merging drm-fixes/drm-fixes (d5226fa6dbae Linux 5.5)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (d5226fa6dbae Linux 5.5)
Merging mmc-fixes/fixes (2a187d033520 mmc: sdhci: fix minimum clock rate fo=
r v3 controller)
Merging rtc-fixes/rtc-fixes (f01f4ffdfb70 rtc: cmos: Revert "rtc: Fix the A=
ltCentury value on AMD/Hygon platform")
Merging gnss-fixes/gnss-linus (d1eef1c61974 Linux 5.5-rc2)
Merging hyperv-fixes/hyperv-fixes (af42d3466bdc Linux 5.4-rc8)
Merging soc-fsl-fixes/fix (5674a92ca4b7 soc/fsl/qe: Fix an error code in qe=
_pin_request())
Merging risc-v-fixes/fixes (def9d2780727 Linux 5.5-rc7)
Merging pidfd-fixes/fixes (0bef168e8859 exit: Fix Sparse errors and warning=
s)
Merging fpga-fixes/fixes (dec43da46f63 fpga: altera-ps-spi: Fix getting of =
optional confd gpio)
Merging spdx/spdx-linus (b3a608222336 Merge branch 'for-v5.6' of git://git.=
kernel.org:/pub/scm/linux/kernel/git/jmorris/linux-security)
Merging gpio-intel-fixes/fixes (d5226fa6dbae Linux 5.5)
Merging pinctrl-intel-fixes/fixes (d5226fa6dbae Linux 5.5)
Merging erofs-fixes/fixes (d1eef1c61974 Linux 5.5-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (7e0cf7e9936c drm/panfrost: Mak=
e sure the shrinker does not reclaim referenced BOs)
Merging kspp-gustavo/for-next/kspp (3d519d6d388b sh: kgdb: Mark expected sw=
itch fall-throughs)
Merging kbuild/for-next (f566e1fbadb6 kbuild: make multiple directory targe=
ts work)
Merging compiler-attributes/compiler-attributes (54ecb8f7028c Linux 5.4-rc1)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (75467ee48a5e dma-direct: improve DMA mask ove=
rflow reporting)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (29cd07a400ae Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (e533dbe9dcb1 arm64: acpi: fix DAIF manipulatio=
n with pNMI)
Merging arm-perf/for-next/perf (8703317ae576 drivers/perf: hisi: update the=
 sccl_id/ccl_id for certain HiSilicon platform)
Merging arm-soc/for-next (18ee80c0533a ARM: Document merges)
CONFLICT (content): Merge conflict in drivers/soc/tegra/fuse/tegra-apbmisc.c
Merging amlogic/for-next (1b01733a0400 Merge branch 'v5.6/defconfig' into t=
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
Merging omap/for-next (f9f5267ec296 Merge branch 'omap-for-v5.6/dt' into fo=
r-next)
Merging qcom/for-next (8b0d3352e4e9 Merge branches 'arm64-defconfig-for-5.6=
', 'arm64-for-5.6', 'defconfig-for-5.6', 'drivers-for-5.6' and 'dts-for-5.6=
' into for-next)
Merging realtek/for-next (45698e00d5a9 Merge branch 'v5.6/dt' into next)
Merging renesas/next (9e4188a77f5e Merge branch 'renesas-drivers-for-v5.6' =
into renesas-next)
Merging reset/reset/next (5ec504fa67af reset: intel: add unspecified HAS_IO=
MEM dependency)
Merging rockchip/for-next (d9279b5b52ef Merge branch 'v5.6-armsoc/dts64' in=
to for-next)
Merging samsung-krzk/for-next (ce232ab5d7c8 Merge branch 'next/soc' into fo=
r-next)
Merging scmi/for-linux-next (f45e09d6e80b Merge remote-tracking branch 'kor=
g_sudeep/fixes/juno' into for-linux-next)
Merging sunxi/sunxi/for-next (7493e675c584 Merge remote-tracking branches '=
sunxi-korg/sunxi/clk-fixes-for-5.5', 'sunxi-korg/sunxi/fixes-for-5.5', 'sun=
xi-korg/sunxi/config-for-5.6', 'sunxi-korg/sunxi/config64-for-5.6', 'sunxi-=
korg/sunxi/clk-for-5.6' and 'sunxi-korg/sunxi/dt-for-5.6' into sunxi/for-ne=
xt)
Merging tegra/for-next (108f7e5e9478 Merge branch for-5.6/clk into for-next)
Merging clk/clk-next (5df867145f8a of: clk: Make <linux/of_clk.h> self-cont=
ained)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/clo=
ck/qcom,sdm845-videocc.yaml
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/clo=
ck/qcom,msm8998-gpucc.yaml
CONFLICT (modify/delete): Documentation/devicetree/bindings/clock/qcom,gpuc=
c.yaml deleted in clk/clk-next and modified in HEAD. Version HEAD of Docume=
ntation/devicetree/bindings/clock/qcom,gpucc.yaml left in tree.
$ git rm -f Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
Merging clk-samsung/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (a019f12a764d csky: Minimize defconfig to support b=
uildroot config.fragment)
Merging h8300/h8300-next (a5de8865cb3e h8300: move definition of __kernel_s=
ize_t etc. to posix_types.h)
Merging ia64/next (240b62d381fe ia64: remove stale paravirt leftovers)
Merging m68k/for-next (6aabc1facdb2 m68k: Implement copy_thread_tls())
Merging m68knommu/for-next (8044aad70a1f m68knommu: fix memcpy() out of bou=
nds warning in get_user())
Merging microblaze/next (6aa71ef9bcf9 microblaze: Add ID for Microblaze v11)
Merging mips/mips-next (2c4288719806 MIPS: PCI: Add detection of IOC3 on IO=
7, IO8, IO9 and Fuel)
Merging nds32/next (a7f96fce201c MAINTAINERS: add nds32 maintainer)
Merging nios2/for-next (051d75d3bb31 MAINTAINERS: Update Ley Foon Tan's ema=
il address)
Merging openrisc/for-next (0ecdcaa6d5e7 openrisc: Fix Kconfig indentation)
Merging parisc-hd/for-next (84669923e1ed parisc: Regenerate parisc defconfi=
gs)
Merging powerpc/next (4c25df5640ae Merge branch 'topic/user-access-begin' i=
nto next)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (6e62bd36e9ad soc: fsl: qe: remove set but not used va=
riable 'mm_gc')
Merging risc-v/for-next (b2389902f6fd riscv: Use flush_icache_mm for flush_=
icache_user_range)
Merging sifive/for-next (467e050e9760 Merge branch 'i2c/for-current' of git=
://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging s390/features (55d0a513a0e2 s390/pkey/zcrypt: Support EP11 AES secu=
re keys)
Merging sh/sh-next (a193018e5290 sh: add missing EXPORT_SYMBOL() for __dela=
y)
Merging sparc-next/master (b71acb0e3721 Merge branch 'linus' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging uml/linux-next (d65197ad5249 um: Fix time-travel=3Dinf-cpu with xor=
/raid6)
Merging xtensa/xtensa-for-next (362961f4063f Merge branch 'xtensa-5.6-fixes=
' into xtensa-for-next)
Merging fscrypt/master (edc440e3d27f fscrypt: improve format of no-key name=
s)
Merging afs/afs-next (4fe171bb81b1 afs: Remove set but not used variable 'r=
et')
Merging btrfs/for-next (1f1b5766df75 Merge branch 'for-next-current-v5.5-20=
200202' into for-next-20200202)
Merging ceph/master (3325322f773b rbd: set the 'device' link in sysfs)
Merging cifs/for-next (4b675bae891f smb3: Add defines for new information l=
evel, FileIdInformation)
Merging configfs/for-next (e2f238f7d5a1 configfs: calculate the depth of pa=
rent item)
Merging ecryptfs/next (b4a81b87a4cf ecryptfs: fix a memory leak bug in ecry=
ptfs_init_messaging())
Merging erofs/dev (1e4a29556794 erofs: clean up z_erofs_submit_queue())
Merging ext3/for_next (daf1cd925487 Pull macro cleanup patches.)
Merging ext4/dev (7f6225e446cc jbd2: clean __jbd2_journal_abort_hard() and =
__journal_abort_soft())
Merging f2fs/dev (ccaaaf6fe5a5 Merge tag 'mpx-for-linus' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/daveh/x86-mpx)
Merging fsverity/fsverity (da3a3da4e6c6 fs-verity: use u64_to_user_ptr())
Merging fuse/for-next (cabdb4fa2f66 fuse: use true,false for bool variable)
CONFLICT (content): Merge conflict in Documentation/filesystems/index.rst
Merging jfs/jfs-next (802a5017ffb2 jfs: remove unused MAXL2PAGES)
Merging nfs/linux-next (d5226fa6dbae Linux 5.5)
Merging nfs-anna/linux-next (7dc2993a9e51 NFSv4.0: nfs4_do_fsinfo() should =
not do implicit lease renewals)
Merging nfsd/nfsd-next (06b3fc37dfd6 nfsd4: fix double free in nfsd4_do_asy=
nc_copy())
Applying: Revert "sunrpc: expiry_time should be seconds not timeval"
Merging orangefs/for-next (9f198a2ac543 help_next should increase position =
index)
Merging overlayfs/overlayfs-next (a4ac9d45c0cd ovl: fix lseek overflow on 3=
2bit)
Merging ubifs/linux-next (fe357dbae113 ubi: Fix an error pointer dereferenc=
e in error handling code)
Merging v9fs/9p-next (79fb9216b7be 9p: Remove unneeded semicolon)
Merging xfs/for-next (cdbcf82b86ea xfs: fix xfs_buf_ioerror_alert location =
reporting)
Merging zonefs/for-next (c9dcfd4ccc1e zonefs: Add documentation)
Merging iomap/iomap-for-next (243145bc4336 fs: Fix page_mkwrite off-by-one =
errors)
Merging djw-vfs/vfs-for-next (3253d9d09337 splice: only read in as much inf=
ormation as there is pipe buffer space)
Merging file-locks/locks-next (98ca480a8f22 locks: print unsigned ino in /p=
roc/locks)
Merging vfs/for-next (2b15195481e0 Merge branch 'merge.nfs-fs_parse' into f=
or-next)
CONFLICT (content): Merge conflict in fs/jbd2/journal.c
CONFLICT (content): Merge conflict in fs/fuse/inode.c
CONFLICT (content): Merge conflict in fs/Makefile
Merging printk/for-next (e616b43fb3a3 Merge branch 'for-5.6' into for-next)
Merging pci/next (d4e9056daedc initramfs: do not show compression mode choi=
ce if INITRAMFS_SOURCE is empty)
Merging pstore/for-next/pstore (e163fdb3f7f8 pstore/ram: Regularize prz lab=
el allocation lifetime)
Merging hid/for-next (d036ff0e56a7 Merge branch 'for-5.6/logitech' into for=
-next)
Merging i2c/i2c/for-next (ccf7f7a51619 Revert "i2c: stm32f7: allow controll=
er to be wakeup-source")
Merging i3c/i3c/next (3952cf8ff2f7 i3c: master: dw: reattach device on firs=
t available location of address table)
Merging dmi/master (2429c99fa13a firmware: dmi: Add dmi_memdev_handle)
Merging hwmon-staging/hwmon-next (fd8bdb23b918 hwmon: (k10temp) Display up =
to eight sets of CCD temperatures)
Merging jc_docs/docs-next (d1c9038ab5c1 Allow git builds of Sphinx)
Merging v4l-dvb/master (1697d9812481 media: staging/intel-ipu3: remove TODO=
 item about acronyms)
Merging v4l-dvb-next/master (d45331b00ddb Linux 5.3-rc4)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (3c8785ec4b98 Merge branch 'pm-cpuidle' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (a48ac1c9f294 cpufreq: brcmstb-a=
vs: fix imbalance of cpufreq policy refcount)
Merging cpupower/cpupower (8c30fa7666ff Correction to manpage of cpupower)
Merging opp/opp/linux-next (03758d60265c opp: Replace list_kref with a loca=
l counter)
Merging thermal/thermal/linux-next (eefb85077bfe ARM: configs: Build BCM271=
1 thermal as module)
CONFLICT (add/add): Merge conflict in Documentation/driver-api/thermal/cpu-=
idle-cooling.rst
CONFLICT (add/add): Merge conflict in Documentation/devicetree/bindings/the=
rmal/brcm,avs-ro-thermal.yaml
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (a48f9721e6db dlm: no need to check return value of debugf=
s_create functions)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (8889f6fa3588 RDMA/core: Make the entire API tree sta=
tic)
Merging net-next/master (33b40134e5cf Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/netdev/net)
Merging bpf-next/master (b3a608222336 Merge branch 'for-v5.6' of git://git.=
kernel.org:/pub/scm/linux/kernel/git/jmorris/linux-security)
Merging ipsec-next/master (9f68e3655aae Merge tag 'drm-next-2020-01-30' of =
git://anongit.freedesktop.org/drm/drm)
Merging mlx5-next/mlx5-next (9b695a64279e net/mlx5: Add bit to indicate sup=
port for encap/decap in sw-steering managed tables)
Merging netfilter-next/master (9f68e3655aae Merge tag 'drm-next-2020-01-30'=
 of git://anongit.freedesktop.org/drm/drm)
Merging nfc-next/master (1f008cfec5d5 NFC: fdp: Fix unused variable warning=
s)
CONFLICT (content): Merge conflict in drivers/nfc/st21nfca/se.c
Merging ipvs-next/master (d54725cd11a5 netfilter: nf_tables: support for mu=
ltiple devices per netdev hook)
Merging wireless-drivers-next/master (2a13513f99e7 Merge ath-next from git:=
//git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git)
Merging bluetooth/master (f3d63f50c17a Bluetooth: hci_qca: Optimized code w=
hile enabling clocks for BT SOC)
Merging mac80211-next/master (30b2f0be23fb mac80211: add ieee80211_is_any_n=
ullfunc())
Merging gfs2/for-next (a31b4ec539e9 Revert "gfs2: eliminate tr_num_revoke_r=
m")
Merging mtd/mtd/next (4575243c5c17 Merge tag 'nand/for-5.6' into mtd/next)
Merging nand/nand/next (d85339d9ea26 mtd: onenand: Rename omap2 driver to a=
void a build warning)
Merging spi-nor/spi-nor/next (ccfb9299a0b6 mtd: spi-nor: Add support for at=
25sl321)
Merging crypto/master (0bc81767c5bd crypto: arm/chacha - fix build failured=
 when kernel mode NEON is disabled)
Merging drm/drm-next (b45f1b3b585e Merge branch 'ttm-prot-fix' of git://peo=
ple.freedesktop.org/~thomash/linux into drm-next)
Merging amdgpu/drm-next (a3292dbb40a4 drm/amdgpu/display: fix logic inversi=
on in program_timing_sync())
Merging drm-intel/for-linux-next (3df29a3537ec Fix root mounting with no mo=
unt options)
Merging drm-tegra/drm/tegra/for-next (98ae41adb252 gpu: host1x: Set DMA dir=
ection only for DMA-mapped buffer objects)
Merging drm-misc/for-linux-next (e1cf35b94c5f drm/edid: fix building error)
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
Merging sound/for-next (6954b323a183 Merge tag 'asoc-v5.6-3' of https://git=
.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-linus)
Merging sound-asoc/for-next (4492e51e32fb Merge branch 'asoc-5.6' into asoc=
-linus)
Merging modules/modules-next (6080d608eeff module.h: Annotate mod_kallsyms =
with __rcu)
Merging input/next (c5ccf2ad3d33 Input: synaptics-rmi4 - switch to reduced =
reporting mode)
Merging block/for-next (6c63cd46c0f7 Merge branch 'io_uring-5.6' into for-n=
ext)
Merging device-mapper/for-next (47ace7e012b9 dm: fix potential for q->make_=
request_fn NULL pointer)
Merging pcmcia/pcmcia-next (71705c611263 PCMCIA/i82092: remove #if 0 block)
Merging mmc/next (533a6cfe08f9 mmc: core: Default to generic_cmd6_time as t=
imeout in __mmc_switch())
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (5312f321a67c mfd: syscon: Fix syscon_regmap_looku=
p_by_phandle_args() dummy)
Merging backlight/for-backlight-next (7af43a76695d backlight: qcom-wled: Fi=
x unsigned comparison to zero)
Merging battery/for-next (3d32a8437c05 power: supply: ipaq_micro_battery: r=
emove unneeded semicolon)
Merging regulator/for-next (29bf153e5fbc Merge remote-tracking branch 'regu=
lator/topic/equal' into regulator-next)
Merging security/next-testing (10c2d111c906 security: remove EARLY_LSM_COUN=
T which never used)
Merging apparmor/apparmor-next (01df52d726b5 apparmor: remove duplicate che=
ck of xattrs on profile attachment.)
Merging integrity/next-integrity (d54e17b40666 Merge branch 'next-integrity=
.defer-measuring-keys' into next-integrity)
Merging keys/keys-next (24f779af0476 Merge branch 'keys-acl' into keys-next)
CONFLICT (content): Merge conflict in include/linux/lsm_audit.h
Merging selinux/next (98aa00345de5 selinux: fix regression introduced by mo=
ve_mount(2) syscall)
Merging smack/for-next (92604e825304 smack: use GFP_NOFS while holding inod=
e_smack::smk_lock)
Merging tomoyo/master (b3a608222336 Merge branch 'for-v5.6' of git://git.ke=
rnel.org:/pub/scm/linux/kernel/git/jmorris/linux-security)
Merging tpmdd/next (7084eddf6be9 tpm: Add tpm_version_major sysfs file)
Merging watchdog/master (057b52b4b3d5 watchdog: da9062: make restart handle=
r atomic safe)
Merging iommu/next (e3b5ee0cfb65 Merge branches 'iommu/fixes', 'arm/smmu', =
'x86/amd', 'x86/vt-d' and 'core' into next)
Merging vfio/next (7b5372ba04ca vfio: platform: fix __iomem in vfio_platfor=
m_amdxgbe.c)
Merging audit/next (cb5172d96d16 audit: Add __rcu annotation to RCU pointer)
Merging devicetree/for-next (e9a3bfe38e39 scripts/dtc: Revert "yamltree: En=
sure consistent bracketing of properties with phandles")
Merging mailbox/mailbox-for-next (c6c6bc6ea9fc mailbox: imx: add support fo=
r imx v1 mu)
Merging spi/for-next (7b206f064457 Merge branch 'spi-5.6' into spi-linus)
Merging tip/auto-latest (178915ad4ab3 Merge branch 'core/urgent')
Merging clockevents/timers/drivers/next (e4c3b4213b79 clocksource/hyperv: S=
et TSC clocksource as default w/ InvariantTSC)
Merging edac/edac-for-next (7e5d6cf35329 EDAC/amd64: Do not warn when remov=
ing instances)
Merging irqchip/irq/irqchip-next (107945227ac5 irqchip/gic-v3-its: Referenc=
e to its_invall_cmd descriptor when building INVALL)
Merging ftrace/for-next (4a39b7764575 ftrace: Add comment to why rcu_derefe=
rence_sched() is open coded)
CONFLICT (content): Merge conflict in kernel/trace/trace.h
Merging rcu/rcu/next (59d8cc6b2e37 rcu: Forgive slow expedited grace period=
s at boot time)
Merging kvm/linux-next (a8be1ad01b79 KVM: vmx: delete meaningless vmx_decac=
he_cr0_guest_bits() declaration)
Merging kvm-arm/next (51b2569402a3 KVM: arm/arm64: Fix up includes for trac=
e.h)
Merging kvm-ppc/kvm-ppc-next (fd24a8624eb2 KVM: PPC: Book3S PR: Fix -Werror=
=3Dreturn-type build failure)
Merging kvms390/next (b2ff728bae9b selftests: KVM: testing the local IRQs r=
esets)
Merging xen-tip/linux-next (8557bbe5156e xen/blkback: Consistently insert o=
ne empty line between functions)
Merging percpu/for-next (9391e7a9a1e2 Merge branch 'for-5.6' into for-next)
Merging workqueues/for-next (e8ab20d9bcb3 workqueue: remove workqueue_work =
event class)
Merging drivers-x86/for-next (6992ca0dd017 Merge branch 'parisc-5.6-1' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux)
Merging chrome-platform/for-next (034dbec179e5 platform/chrome: cros_ec: Ma=
tch implementation with headers)
Merging hsi/for-next (c1030cd45619 HSI: Remove dev_err() usage after platfo=
rm_get_irq())
Merging leds/for-next (260718b3a35d leds: lm3692x: Disable chip on brightne=
ss 0)
Merging ipmi/for-next (e0354d147e58 drivers: ipmi: fix off-by-one bounds ch=
eck that leads to a out-of-bounds write)
Merging driver-core/driver-core-next (90568ecf5615 Merge tag 'kvm-5.6-2' of=
 git://git.kernel.org/pub/scm/virt/kvm/kvm)
Merging usb/usb-next (90568ecf5615 Merge tag 'kvm-5.6-2' of git://git.kerne=
l.org/pub/scm/virt/kvm/kvm)
Merging usb-gadget/next (4baa550ecc86 usb: musb: remove dummy driver musb_a=
m335x.c)
Merging usb-serial/usb-next (19c64e7354e5 USB: serial: cyberjack: fix spell=
ing mistake "To" -> "Too")
Merging usb-chipidea-next/ci-for-usb-next (4d6141288c33 usb: chipidea: imx:=
 pinctrl for HSIC is optional)
Merging phy-next/next (a5c86c557fe9 phy: mapphone-mdm6600: Fix write timeou=
ts with shorter GPIO toggle interval)
Merging tty/tty-next (90568ecf5615 Merge tag 'kvm-5.6-2' of git://git.kerne=
l.org/pub/scm/virt/kvm/kvm)
Merging char-misc/char-misc-next (90568ecf5615 Merge tag 'kvm-5.6-2' of git=
://git.kernel.org/pub/scm/virt/kvm/kvm)
Merging extcon/extcon-next (b7365587f513 extcon: Remove unneeded extern key=
word from extcon.h)
Merging soundwire/next (5098cae1f79c dt-bindings: soundwire: fix example)
Merging thunderbolt/next (d5226fa6dbae Linux 5.5)
Merging staging/staging-next (90568ecf5615 Merge tag 'kvm-5.6-2' of git://g=
it.kernel.org/pub/scm/virt/kvm/kvm)
Merging mux/for-next (f356d58c3a04 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (30c8fa3ec61a interconnect: qcom: Add MSM8916 intercon=
nect provider driver)
Merging slave-dma/next (bad83565eafe dmaengine: Cleanups for the slave <-> =
channel symlink support)
Merging cgroup/for-next (0cd9d33ace33 cgroup: init_tasks shouldn't be linke=
d to the root cgroup)
Merging scsi/for-next (bf2f620ec1c8 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (e0a514259378 scsi: ufs: fix spelling mistake "in=
itilized" -> "initialized")
Merging vhost/linux-next (3ba579b619db tools/virtio: option to build an out=
 of tree module)
CONFLICT (content): Merge conflict in drivers/block/virtio_blk.c
Merging rpmsg/for-next (5a87e60312a9 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (0282c72d30d3 Merge tag 'gpio-updates-for-v5.6-part2'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into devel)
Merging gpio-brgl/gpio/for-next (7c01e6998ba3 gpio: wcd934x: Fix logic of w=
cd_gpio_get)
Merging gpio-intel/for-next (d5226fa6dbae Linux 5.5)
Merging pinctrl/for-next (122ce22cb37b pinctrl: madera: Remove extra blank =
line)
Merging pinctrl-intel/for-next (cd0a32371db7 pinctrl: tigerlake: Tiger Lake=
 uses _HID enumeration)
Merging pinctrl-samsung/for-next (225a2ec19aac pinctrl: samsung: Fix missin=
g OF and GPIOLIB dependency on S3C24xx and S3C64xx)
Merging pwm/for-next (9871abffc810 pwm: Remove set but not set variable 'pw=
m')
Merging userns/for-next (61a47c1ad3a4 sysctl: Remove the sysctl system call)
Merging ktest/for-next (9b5f852ae20d ktest: Make default build option oldco=
nfig not randconfig)
Merging random/dev (4cb760b02419 s390x: Mark archrandom.h functions __must_=
check)
Merging kselftest/next (af4ddd607dff selftests/ftrace: fix glob selftest)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (d28b4c1b2b3d Merge branch 'for-5.6/selftests=
' into for-next)
Merging coresight/next (ad9882f15884 coresight: etm4x: Fix unused function =
warning)
Merging rtc/rtc-next (f45719240700 dt-bindings: rtc: at91rm9200: document c=
locks property)
Merging nvdimm/libnvdimm-for-next (46cf053efec6 Linux 5.5-rc3)
Merging at24/at24/for-next (cd5676db0574 misc: eeprom: at24: support pm_run=
time control)
Merging ntb/ntb-next (1ef512b16bc8 NTB: Fix an error in get link status)
Merging kspp/for-next/kspp (c79f46a28239 Linux 5.5-rc5)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (d1eef1c61974 Linux 5.5-rc2)
Merging fsi/next (2c01397b71c5 fsi: aspeed: Fix OPB0 byte order register va=
lues)
Merging slimbus/for-next (526eaf5d08a2 slimbus: Use the correct style for S=
PDX License Identifier)
Merging nvmem/for-next (4a81ae0c43bc nvmem: add QTI SDAM driver)
Merging xarray/xarray (3a00e7c47c38 ida: remove abandoned macros)
Merging hyperv/hyperv-next (54e19d34011f hv_utils: Add the support of hiber=
nation)
Merging auxdisplay/auxdisplay (54ecb8f7028c Linux 5.4-rc1)
Merging kgdb/kgdb/for-next (fcf2736c82ca Revert "kdb: Get rid of confusing =
diag msg from "rd" if current task has no regs")
Merging pidfd/for-next (8d19f1c8e193 prctl: PR_{G,S}ET_IO_FLUSHER to suppor=
t controlling memory reclaim)
Merging devfreq/devfreq-next (054fef0337fe PM / devfreq: Change to DEVFREQ_=
GOV_UPDATE_INTERVAL event name)
Merging hmm/hmm (5292e24a6acf mm/mmu_notifiers: Use 'interval_sub' as the v=
ariable for mmu_interval_notifier)
Merging fpga/for-next (28910cee898c fpga: xilinx-pr-decoupler: Remove clk_g=
et error message for probe defer)
Merging kunit/test (e42617b825f8 Linux 5.5-rc1)
Merging cel/cel-next (a99d8080aaf3 Linux 5.4-rc6)
Merging kasan-bitops/topic/kasan-bitops (4f4afc2c9599 docs/core-api: Remove=
 possibly confusing sub-headings from Bit Operations)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging kunit-next/kunit (35c57fc3f8ea kunit: building kunit as a module br=
eaks allmodconfig)
Merging akpm-current/current (ec7c11f69882 aio: simplify read_events())
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/tty/serial/sh-sci.c: suppress warning
Applying: drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer ove=
rflow
Merging akpm/master (a9a724ff8f80 drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/f2sPwDNq1TQH.YLGLW=v3HS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl48toUACgkQAVBC80lX
0GxZMggAiHistIRC/mGKQXOAIRb36NKXlP7SIHm7kS6bBcpGEdKj4KZj1IIZ4kkm
lUZLwKDwUI7RXqPUz90nGay5LPq2RD9iE5zjbG3SCDa75DYuM3LSHrNr64mqDco7
d6Yuu2u6SSRfUX+l2Ulg1tR+cW9bG04e/k5ci4JE2mrWdARKXB7Rpfcy1+M9ZQbs
OcLLaDdyq6GI3/laxbC8zOp8Q2GwbVhtaJ+lYRNU4BfG96D6hBp3JbklQtSOsDIm
K+KFUdO+pj2nt5PYtSCIovAOneZUqpURVoKfxy1q+Fhk3KG2nmZtLzHe/YdKFMZB
Avs+U0sjcii+5G2zL/SW7Yj58an4Kg==
=/rLv
-----END PGP SIGNATURE-----

--Sig_/f2sPwDNq1TQH.YLGLW=v3HS--
