Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C60D1AC1BA
	for <lists+linux-next@lfdr.de>; Thu, 16 Apr 2020 14:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894382AbgDPMrI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Apr 2020 08:47:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2636225AbgDPMrF (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Apr 2020 08:47:05 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7863FC061A0C
        for <linux-next@vger.kernel.org>; Thu, 16 Apr 2020 05:47:04 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id 20so12990926qkl.10
        for <linux-next@vger.kernel.org>; Thu, 16 Apr 2020 05:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=7br31eMxuFGg72qCvDIA20vUogRUgJo4HPrDb39vleU=;
        b=skgDLofG2t5lsdfHparyUzt3G4hmdQXNNq88POg6k13bVQFSFeasXzYLwKNzbnyGxI
         iNMv7xbSPwZzCHL8d06ojrjsiDOnBTjaWvvp7+vIDHM6f4CVA7Of9JPMhafs/gICZoTJ
         L+FvDAWzs7CLqTKKVW7b5OUhL5weOubCQnTkAOcS+b7z9m8zCASJp4hdG7IWOfyFtBs/
         wL0CCsa9xHEW0vFTE734FxLEFe+GiiWciZg3DC2PAv7ZUWZsA4C/sz/PeTqGccsqzPH0
         zkw/PuY6xnHi/1qOMyyYegQ4bJTkDj5mUDaEvgE0dUF4dKdoPg+3qwz7Z+pe23hXWOje
         1r/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=7br31eMxuFGg72qCvDIA20vUogRUgJo4HPrDb39vleU=;
        b=Dw6IKcAR3BdfBvVyUOGU35fg9wmGpXhiuXgQmlXR3hGGQ98skOvvTjfsjfBBC1VzTI
         xDRn3VXun2D2PeWiGKZbncJyyzqQjUxZAcQ6FzBD2tfzlutF4EdBqvNUytl/zz/rTb8Z
         ptHXa+7i+KEsSOIGwswBeJqK/UmErYr/zRO8I6nTD4P/2K5lWOL7tOHNQk6fomaN5xED
         XxFSzM9FLgZ/bSFuN6LU5HgNbsCZ9KjANDtBR3R83oHZ7GZdVguxxc6cX6zzhY+URxMN
         Byglq15h/w3MsQwOxqkFhmAEXTNo+/TLoxjYBXtHv0qyhhxzeNuOY3wvALQdZVVwJI8M
         Yu8w==
X-Gm-Message-State: AGi0PubnpTAST8+EF8m7uzVnxzaY2J79QXtd0dKsyzKcLjzRFP/j1lcI
        W2QZCEtBBtvtXaUc/vpfm3nwRZSvdMMshw==
X-Google-Smtp-Source: APiQypKSBlWAb4UfV/Nd4O7jVthBF5So4NmpaLeGlWZ1be52U+2QSpKPoMWECf5JeggAEkv6ZVno6Q==
X-Received: by 2002:a37:90b:: with SMTP id 11mr2575393qkj.205.1587041223278;
        Thu, 16 Apr 2020 05:47:03 -0700 (PDT)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id s18sm3970340qkg.53.2020.04.16.05.47.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Apr 2020 05:47:02 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: linux-next: Tree for Apr 16 (media)
From:   Qian Cai <cai@lca.pw>
In-Reply-To: <20200416145828.093ff698@canb.auug.org.au>
Date:   Thu, 16 Apr 2020 08:47:01 -0400
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Transfer-Encoding: quoted-printable
Message-Id: <568AA084-BCC7-4638-AE65-DA64E547BA77@lca.pw>
References: <20200416145828.093ff698@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Reverted those two commits fixed the s390 a build failure with this =
config,

https://raw.githubusercontent.com/cailca/linux-mm/master/s390.config

a81068181aad (=E2=80=9Cmedia: move CEC USB drivers to a separate =
directory=E2=80=9D)
4be5e8648b0c (=E2=80=9Cmedia: move CEC platform drivers to a separate =
directory")

drivers/pci/Kconfig:16:error: recursive dependency detected!
drivers/pci/Kconfig:16: symbol PCI is selected by CEC_SECO
drivers/media/cec/platform/Kconfig:100: symbol CEC_SECO depends on =
MEDIA_CEC_SUPPORT
drivers/media/cec/Kconfig:27:   symbol MEDIA_CEC_SUPPORT default is =
visible depending on MEDIA_SUPPORT_FILTER
drivers/media/Kconfig:25:       symbol MEDIA_SUPPORT_FILTER depends on =
MEDIA_SUPPORT
drivers/media/Kconfig:12:       symbol MEDIA_SUPPORT depends on =
HAS_IOMEM
arch/s390/Kconfig:722:  symbol HAS_IOMEM default value contains PCI
For a resolution refer to Documentation/kbuild/kconfig-language.rst
subsection "Kconfig recursive dependency limitations"

make[2]: *** [scripts/kconfig/Makefile:71: syncconfig] Error 1
make[1]: *** [Makefile:588: syncconfig] Error 2
make: *** [Makefile:699: include/config/auto.conf.cmd] Error 2


> On Apr 16, 2020, at 12:58 AM, Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Hi all,
>=20
> Changes since 20200415:
>=20
> New tree: exfat
>=20
> My fixes tree contains:
>=20
>  6b038bdcd3d1 sh: mm: Fix build error
>=20
> The qcom tree still had its build failure for which I reverted a =
commit.
>=20
> The drm-misc tree gained conflicts against Linus' tree.
>=20
> The sound-asoc tree still has its failures so I used the version from
> next-20200414.
>=20
> Non-merge commits (relative to Linus' tree): 2160
> 2866 files changed, 60468 insertions(+), 26561 deletions(-)
>=20
> =
--------------------------------------------------------------------------=
--
>=20
> I have created today's linux-next tree at
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> (patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
> are tracking the linux-next tree using git, you should not use "git =
pull"
> to do so as that will try to merge the new linux-next release with the
> old one.  You should use "git fetch" and checkout or reset to the new
> master.
>=20
> You can see which trees have been included by looking in the =
Next/Trees
> file in the source.  There are also quilt-import.log and merge.log
> files in the Next directory.  Between each merge, the tree was built
> with a ppc64_defconfig for powerpc, an allmodconfig for x86_64, a
> multi_v7_defconfig for arm and a native build of tools/perf. After
> the final fixups (if any), I do an x86_64 modules_install followed by
> builds for x86_64 allnoconfig, powerpc allnoconfig (32 and 64 bit),
> ppc44x_defconfig, allyesconfig and pseries_le_defconfig and i386, =
sparc
> and sparc64 defconfig and htmldocs. And finally, a simple boot test
> of the powerpc pseries_le_defconfig kernel in qemu (with and without
> kvm enabled).
>=20
> Below is a summary of the state of the merge.
>=20
> I am currently merging 318 trees (counting Linus' and 78 trees of bug
> fix patches pending for the current merge release).
>=20
> Stats about the size of the tree over time can be seen at
> http://neuling.org/linux-next-size.html .
>=20
> Status of my local build tests will be at
> http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
> advice about cross compilers/configs that work, we are always open to =
add
> more builds.
>=20
> Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
> Gortmaker for triage and bug fixes.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> $ git checkout master
> $ git reset --hard stable
> Merging origin/master (8632e9b5645b Merge tag 'hyperv-fixes-signed' of =
git://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux)
> Merging fixes/master (6b038bdcd3d1 sh: mm: Fix build error)
> Merging kbuild-current/fixes (d2f1606edabd scripts/config: allow =
colons in option strings for sed)
> Merging arc-current/for-curr (5185f4773e90 ARC: [plat-eznps]: Restrict =
to CONFIG_ISA_ARCOMPACT)
> Merging arm-current/fixes (89604523a76e ARM: 8961/2: Fix Kbuild issue =
caused by per-task stack protector GCC plugin)
> Merging arm-soc-fixes/arm/fixes (c8042d1e5cb3 soc: samsung: chipid: =
Fix return value on non-Exynos platforms)
> Merging arm64-fixes/for-next/fixes (c9a4ef664501 arm64: Delete the =
space separator in __emit_inst)
> Merging m68k-current/for-linus (86cded5fc525 m68k: defconfig: Update =
defconfigs for v5.6-rc4)
> Merging powerpc-fixes/fixes (1d0c32ec3b86 KVM: PPC: Fix kernel crash =
with PR KVM)
> Merging s390-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
> Merging sparc/master (63bef48fd6c9 Merge branch 'akpm' (patches from =
Andrew))
> Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict =
dirty inodes after removing key)
> Merging net/master (87b0f983f66f net: mscc: ocelot: fix untagged =
packet drops when enslaving to vlan aware bridge)
> Merging bpf/master (87b0f983f66f net: mscc: ocelot: fix untagged =
packet drops when enslaving to vlan aware bridge)
> Merging ipsec/master (91fac45cd006 Merge branch =
'Fix-88x3310-leaving-power-save-mode')
> Merging netfilter/master (bc8e71314e84 netfilter: flowtable: Free =
block_cb when being deleted)
> Merging ipvs/master (0141317611ab Merge branch 'hns3-fixes')
> Merging wireless-drivers/master (7dc7c41607d1 rtw88: avoid unused =
function warnings)
> Merging mac80211/master (93e2d04a1888 mac80211: fix channel switch =
trigger from unknown mesh peer)
> Merging rdma-fixes/for-rc (8f3d9f354286 Linux 5.7-rc1)
> Merging sound-current/for-linus (9a6418487b56 ALSA: hda: call =
runtime_allow() for all hda controllers)
> Merging sound-asoc-fixes/for-linus (f3fab6f03cda Merge branch =
'asoc-5.7' into asoc-linus)
> Merging regmap-fixes/for-linus (7a458ad5623d Merge branch 'regmap-5.7' =
into regmap-linus)
> Merging regulator-fixes/for-linus (3c0cb85c78a0 Merge branch =
'regulator-5.7' into regulator-linus)
> Merging spi-fixes/for-linus (4bbae1279dfe Merge branch 'spi-5.7' into =
spi-linus)
> Merging pci-current/for-linus (8f3d9f354286 Linux 5.7-rc1)
> Merging driver-core.current/driver-core-linus (8f3d9f354286 Linux =
5.7-rc1)
> Merging tty.current/tty-linus (8f3d9f354286 Linux 5.7-rc1)
> Merging usb.current/usb-linus (8f3d9f354286 Linux 5.7-rc1)
> Merging usb-gadget-fixes/fixes (42cd5ffe46c1 usb: dwc3: debug: fix =
string position formatting mixup with ret and len)
> Merging usb-serial-fixes/usb-linus (8f3d9f354286 Linux 5.7-rc1)
> Merging usb-chipidea-fixes/ci-for-usb-stable (7cbf3dd3139a usb: =
chipidea: udc: fix sleeping function called from invalid context)
> Merging phy/fixes (8f3d9f354286 Linux 5.7-rc1)
> Merging staging.current/staging-linus (ed87d33ddbcd staging: comedi: =
dt2815: fix writing hi byte of analog output)
> Merging char-misc.current/char-misc-linus (8f3d9f354286 Linux 5.7-rc1)
> Merging soundwire-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
> Merging thunderbolt-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
> Merging input-current/for-linus (3f8f770575d9 Input: mms114 - fix =
handling of mms345l)
> Merging crypto-current/master (755bddd1e4ea crypto: marvell/octeontx - =
fix double free of ptr)
> Merging ide/master (63bef48fd6c9 Merge branch 'akpm' (patches from =
Andrew))
> Merging vfio-fixes/for-linus (95f89e090618 vfio/type1: Initialize =
resv_msi_base)
> Merging kselftest-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
> Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make =
sure to pass all module source files to spatch)
> Merging slave-dma-fixes/fixes (aee45dba3ad9 dt-bindings: dma: =
uniphier-xdmac: switch to single reg region)
> Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
> Merging mtd-fixes/mtd/fixes (2098c564701c mtd: spi-nor: Compile files =
in controllers/ directory)
> Merging mfd-fixes/for-mfd-fixes (603d9299da32 mfd: mt6397: Fix probe =
after changing mt6397-core)
> Merging v4l-dvb-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
> Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add =
unspecified HAS_IOMEM dependency)
> Merging mips-fixes/mips-fixes (8f3d9f354286 Linux 5.7-rc1)
> Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
> Merging omap-fixes/fixes (07bdc492cff6 ARM: dts: OMAP3: disable RNG on =
N950/N9)
> Merging kvm-fixes/master (dbef2808af6c KVM: VMX: fix crash cleanup =
when KVM wasn't used)
> Merging kvms390-fixes/master (1493e0f944f3 KVM: s390: vsie: Fix =
possible race when shadowing region 3 tables)
> Merging hwmon-fixes/hwmon (0e786f328b38 hwmon: (k10temp) make some =
symbols static)
> Merging nvdimm-fixes/libnvdimm-fixes (f84afbdd3a9e libnvdimm: Out of =
bounds read in __nd_ioctl())
> Merging btrfs-fixes/next-fixes (9dba7a236504 Merge branch 'misc-5.7' =
into next-fixes)
> Merging vfs-fixes/fixes (5bd73286d50f fix a braino in =
legitimize_path())
> Merging dma-mapping-fixes/for-linus (9c24eaf81cc4 iommu/vt-d: Return =
the correct dma mask when we are bypassing the IOMMU)
> Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
> Merging drivers-x86-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
> Merging samsung-krzk-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
> Merging pinctrl-samsung-fixes/pinctrl-fixes (8f3d9f354286 Linux =
5.7-rc1)
> Merging devicetree-fixes/dt/linus (c3a2079828fa dt-bindings: pwm: Fix =
cros-ec-pwm example dtc 'reg' warning)
> Merging scsi-fixes/fixes (fa17a6dc84d1 scsi: Update referenced link to =
cdrtools)
> Merging drm-fixes/drm-fixes (8f3d9f354286 Linux 5.7-rc1)
> Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix =
si_enable_smc_cac() failed issue)
> Merging drm-intel-fixes/for-linux-next-fixes (5809e8f8ee42 Merge tag =
'gvt-fixes-2020-04-14' of https://github.com/intel/gvt-linux into =
drm-intel-fixes)
> Merging mmc-fixes/fixes (3d3e18fcd591 mmc: core: make =
mmc_interrupt_hpi() static)
> Merging rtc-fixes/rtc-fixes (bb6d3fb354c5 Linux 5.6-rc1)
> Merging gnss-fixes/gnss-linus (8f3d9f354286 Linux 5.7-rc1)
> Merging hyperv-fixes/hyperv-fixes (1a06d017fb3f Drivers: hv: vmbus: =
Fix Suspend-to-Idle for Generation-2 VM)
> Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio =
irq handlers after dpio create)
> Merging risc-v-fixes/fixes (2191b4f298fa RISC-V: Move all address =
space definition macros to one place)
> Merging pidfd-fixes/fixes (a966dcfe153a clone3: add build-time =
CLONE_ARGS_SIZE_VER* validity checks)
> Merging fpga-fixes/fixes (3c2760b78f90 fpga: dfl: pci: fix return =
value of cci_pci_sriov_configure)
> Merging spdx/spdx-linus (5b8b9d0c6d0e Merge branch 'akpm' (patches =
from Andrew))
> Merging gpio-intel-fixes/fixes (8f3d9f354286 Linux 5.7-rc1)
> Merging pinctrl-intel-fixes/fixes (ccd025eaddae pinctrl: baytrail: =
Enable pin configuration setting for GPIO chip)
> Merging erofs-fixes/fixes (d1eef1c61974 Linux 5.5-rc2)
> Merging drm-misc-fixes/for-linux-next-fixes (8623b5255ae7 =
drm/scheduler: fix drm_sched_get_cleanup_job)
> Merging kspp-gustavo/for-next/kspp (90e5d84c7b06 xattr.h: Replace =
zero-length array with flexible-array member)
> Merging kbuild/for-next (b032227c6293 Merge tag 'nios2-v5.7-rc1' of =
git://git.kernel.org/pub/scm/linux/kernel/git/lftan/nios2)
> Merging compiler-attributes/compiler-attributes (98d54f81e36b Linux =
5.6-rc4)
> Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
> Merging dma-mapping/for-next (9bb50ed74709 dma-debug: fix displaying =
of dma allocation type)
> Merging asm-generic/master (060dc911501f nds32: fix build failure =
caused by page table folding updates)
> Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
> Merging arm/for-next (52d3b2f98483 Merge branch 'devel-stable' into =
for-next)
> Merging arm64/for-next/core (fc2266011acc arm64: armv8_deprecated: Fix =
undef_hook mask for thumb setend)
> Merging arm-perf/for-next/perf (8f3d9f354286 Linux 5.7-rc1)
> Merging arm-soc/for-next (d9725e56e1d8 soc: document merges)
> Merging amlogic/for-next (b40f5228c5f6 Merge branch 'v5.7/drivers' =
into tmp/aml-rebuild)
> Merging aspeed/for-next (de285b938cf3 ARM: dts: aspeed: ast2600: Fix =
SCU IRQ controller nodes)
> Merging at91/at91-next (ec539e70d882 Merge branches 'at91-soc', =
'at91-dt' and 'at91-defconfig' into at91-next)
> Merging imx-mxs/for-next (46535d78fdfe Merge branch 'imx/dt64' into =
for-next)
> Merging keystone/next (560b4d4691b0 Merge branch =
'for_5.7/keystone-dts' into next)
> Merging mediatek/for-next (23a161322658 Merge branch 'v5.7-next/soc' =
into for-next)
> Merging mvebu/for-next (9d32706f8aa8 Merge branch 'mvebu/dt64' into =
mvebu/for-next)
> Merging omap/for-next (e90f16cc1a48 Merge branch 'fixes' into =
for-next)
> Merging qcom/for-next (217aeedd10d5 Merge branches =
'arm64-defconfig-for-5.8', 'arm64-for-5.8', 'drivers-for-5.8' and =
'dts-for-5.8' into for-next)
> Applying: Revert "soc: qcom: rpmh: Allow RPMH driver to be loaded as a =
module"
> Merging raspberrypi/for-next (e7b7daeb48e0 ARM: dts: bcm283x: Use =
firmware PM driver for V3D)
> CONFLICT (content): Merge conflict in =
arch/arm/configs/bcm2835_defconfig
> Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into =
next)
> Merging renesas/next (a710158e9fa2 Merge branch =
'renesas-arm-dt-for-v5.8' into renesas-next)
> Merging reset/reset/next (2ebf89fd4ecf reset: hi6220: Add support for =
AO reset controller)
> Merging rockchip/for-next (c018aff1a201 Merge branch =
'v5.7-armsoc/dts64' into for-next)
> Merging samsung-krzk/for-next (ff602fc2b39e Merge branch 'next/soc' =
into for-next)
> Merging scmi/for-linux-next (8f3d9f354286 Linux 5.7-rc1)
> Merging sunxi/sunxi/for-next (4f7a2d7e5f1e Merge branches =
'sunxi/clk-for-5.8', 'sunxi/config-for-5.8' and 'sunxi/dt-for-5.8' into =
sunxi/for-next)
> Merging tegra/for-next (df0a178cf2df Merge branch for-5.7/usb into =
for-next)
> Merging clk/clk-next (e7f552f727f5 Merge branch 'clk-fixes' into =
clk-next)
> Merging clk-samsung/for-next (54ecb8f7028c Linux 5.4-rc1)
> Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of =
git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
> Merging csky/linux-next (10cb08260605 csky: Fixup perf probe -x =
hungup)
> Merging h8300/h8300-next (849060d1f9da irq-renesas-h8s: Fix external =
interrupt control.)
> Merging ia64/next (172e7890406d tty/serial: cleanup after ioc*_serial =
driver removal)
> Merging m68k/for-next (86cded5fc525 m68k: defconfig: Update defconfigs =
for v5.6-rc4)
> Merging m68knommu/for-next (ba000760eb0f m68k: Replace setup_irq() by =
request_irq())
> Merging microblaze/next (8f3d9f354286 Linux 5.7-rc1)
> Merging mips/mips-next (8f3d9f354286 Linux 5.7-rc1)
> Merging nds32/next (d785c5a324cd nds32: configs: Cleanup =
CONFIG_CROSS_COMPILE)
> Merging nios2/for-next (0ec8a5054d7f MAINTAINERS: Remove =
nios2-dev@lists.rocketboards.org)
> Merging openrisc/for-next (9737e2c5f0bc openrisc: Remove obsolete =
show_trace_task function)
> Merging parisc-hd/for-next (7111951b8d49 Linux 5.6)
> Merging powerpc/next (6ba4a2d35910 selftests/powerpc: Always build the =
tm-poison test 64-bit)
> Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci =
bridges)
> Merging soc-fsl/next (461c3ac0dc46 soc: fsl: qe: fix sparse warnings =
for ucc_slow.c)
> Merging risc-v/for-next (37809df4b1c8 riscv: create a loader.bin boot =
image for Kendryte SoC)
> Merging sifive/for-next (467e050e9760 Merge branch 'i2c/for-current' =
of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
> Merging s390/features (8f3d9f354286 Linux 5.7-rc1)
> Merging sh/sh-next (a193018e5290 sh: add missing EXPORT_SYMBOL() for =
__delay)
> Merging sparc-next/master (b71acb0e3721 Merge branch 'linus' of =
git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
> Merging uml/linux-next (4a7c46247f9c um: Remove some unnecessary NULL =
checks in vector_user.c)
> Merging xtensa/xtensa-for-next (70cbddb97385 arch/xtensa: fix grammar =
in Kconfig help text)
> Merging fscrypt/master (861261f2a9cc ubifs: wire up =
FS_IOC_GET_ENCRYPTION_NONCE)
> Merging afs/afs-next (4fe171bb81b1 afs: Remove set but not used =
variable 'ret')
> Merging btrfs/for-next (5a7ef5cb05dc Merge branch =
'for-next-current-v5.6-20200331' into for-next-20200331)
> Merging ceph/master (2a575f138d00 ceph: fix potential bad pointer =
deref in async dirops cb's)
> Merging cifs/for-next (8f3dcdbb5f54 smb3: remove overly noisy debug =
line in signing errors)
> Merging configfs/for-next (e2f238f7d5a1 configfs: calculate the depth =
of parent item)
> Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of =
git://git.samba.org/sfrench/cifs-2.6)
> Merging erofs/dev (8f3d9f354286 Linux 5.7-rc1)
> Merging exfat/dev (df18a577ad99 exfat: Improve wording of =
EXFAT_DEFAULT_IOCHARSET config option)
> Merging ext3/for_next (a32f0ecd79b4 Merge fanotify fix from Nathan =
Chancellor.)
> Merging ext4/dev (12fb08d19005 ext4: reject mount options not =
supported when remounting in handle_mount_opt())
> Merging f2fs/dev (def8f0769967 f2fs: fix to handle error path of =
f2fs_ra_meta_pages())
> Merging fsverity/fsverity (98d54f81e36b Linux 5.6-rc4)
> Merging fuse/for-next (3e8cb8b2eaeb fuse: fix stack use after return)
> Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with =
flexible-array member)
> Merging nfs/linux-next (fbf4bcc9a837 NFS: Fix an ABBA spinlock issue =
in pnfs_update_layout())
> Merging nfs-anna/linux-next (55dee1bc0d72 nfs: add minor version to =
nfs_server_key for fscache)
> Merging nfsd/nfsd-next (2653de9f0398 fs: nfsd: fileache.c: Use =
built-in RCU list checking)
> CONFLICT (content): Merge conflict in net/sunrpc/cache.c
> Merging orangefs/for-next (aa317d3351de orangefs: clarify build steps =
for test server in orangefs.txt)
> Merging overlayfs/overlayfs-next (2eda9eaa6d7e ovl: document xino =
expected behavior)
> Merging ubifs/linux-next (3676f32a98cd ubi: ubi-media.h: Replace =
zero-length array with flexible-array member)
> Merging v9fs/9p-next (c6f141412d24 9p: document short read behaviour =
with O_NONBLOCK)
> Merging xfs/for-next (c142932c29e5 xfs: fix partially uninitialized =
structure in xfs_reflink_remap_extent)
> Merging zonefs/for-next (0dda2ddb7ded zonefs: select FS_IOMAP)
> Merging iomap/iomap-for-next (457df33e035a iomap: Handle memory =
allocation failure in readahead)
> Merging djw-vfs/vfs-for-next (56939e014a6c hibernate: Allow uswsusp to =
write to swap)
> Merging file-locks/locks-next (dbdaf6a3250b locks: reinstate =
locks_delete_block optimization)
> Merging vfs/for-next (ffca8b2a77f2 Merge branch 'work.exfat' into =
for-next)
> Merging printk/for-next (d34f14ae521f Merge branch =
'for-5.7-preferred-console' into for-next)
> Merging pci/next (8f3d9f354286 Linux 5.7-rc1)
> Merging pstore/for-next/pstore (8f3d9f354286 Linux 5.7-rc1)
> Merging hid/for-next (fc3cc4fb390d Merge branch =
'for-5.7/upstream-fixes' into for-next)
> Merging i2c/i2c/for-next (8859c2d37301 Merge branch 'i2c/for-current' =
into i2c/for-next)
> Merging i3c/i3c/next (c4b9de11d010 i3c: convert to use =
i2c_new_client_device())
> Merging dmi/master (8cf87c744696 firmware/dmi: Report DMI Bios & EC =
firmware release)
> Merging hwmon-staging/hwmon-next (635049d0e3a0 hwmon: (dell-smm) Use =
one DMI match for all XPS models)
> Merging jc_docs/docs-next (d98dbbe0d331 scripts: =
documentation-file-ref-check: Add line break before exit)
> Merging v4l-dvb/master (63735af86d64 media: docs: add cros-references =
to the other media guides)
> Merging v4l-dvb-next/master (54ecb8f7028c Linux 5.4-rc1)
> Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a =
typo in imxfb_probe())
> Merging pm/linux-next (1f58b05f6672 Merge branch 'pm-opp' into =
linux-next)
> Merging cpufreq-arm/cpufreq/arm/linux-next (8be6bbe59a69 cpufreq: =
omap: Build driver by default for ARCH_OMAP2PLUS)
> Merging cpupower/cpupower (8f3d9f354286 Linux 5.7-rc1)
> Merging opp/opp/linux-next (aca48b61f963 opp: Manage empty OPP tables =
with clk handle)
> Merging thermal/thermal/linux-next (79799562bf08 thermal: =
int3400_thermal: Statically initialize .get_mode()/.set_mode() ops)
> Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
> Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be =
a pure OF sensor)
> Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but =
not used variable 'guid')
> Merging dlm/next (a48f9721e6db dlm: no need to check return value of =
debugfs_create functions)
> Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having =
called xen_create_contiguous_region())
> Merging rdma/for-next (8f3d9f354286 Linux 5.7-rc1)
> Merging net-next/master (63bef48fd6c9 Merge branch 'akpm' (patches =
from Andrew))
> Merging bpf-next/master (1a323ea5356e x86: get rid of 'errret' =
argument to __get_user_xyz() macross)
> Merging ipsec-next/master (308491755f36 xfrm: add prep for esp beet =
mode offload)
> Merging mlx5-next/mlx5-next (826096d84f50 mlx5: Remove uninitialized =
use of key in mlx5_core_create_mkey)
> Merging netfilter-next/master (1a323ea5356e x86: get rid of 'errret' =
argument to __get_user_xyz() macross)
> Merging ipvs-next/master (d54725cd11a5 netfilter: nf_tables: support =
for multiple devices per netdev hook)
> Merging wireless-drivers-next/master (f0f383347ced brcmfmac: remove =
leading space)
> Merging bluetooth/master (2eb71a3a68c3 Bluetooth: Clear =
HCI_LL_RPA_RESOLUTION flag on reset)
> Merging mac80211-next/master (1e8f471425f4 mac80211_hwsim: notify =
wmediumd of used MAC addresses)
> Merging gfs2/for-next (197694d09af5 docs: filesystems: convert =
gfs2-glocks.txt to ReST)
> Merging mtd/mtd/next (025a06c1104c mtd: Convert fallthrough comments =
into statements)
> Merging nand/nand/next (fca88925d769 mtd: rawnand: toshiba: Support =
reading the number of bitflips for BENAND (Built-in ECC NAND))
> Merging spi-nor/spi-nor/next (8f3d9f354286 Linux 5.7-rc1)
> Merging crypto/master (fcb90d51c375 crypto: af_alg - bool type =
cosmetics)
> Merging drm/drm-next (8f3d9f354286 Linux 5.7-rc1)
> Merging amdgpu/drm-next (1fca2edfde08 PCI/P2PDMA: Add additional AMD =
ZEN root ports to the whitelist)
> CONFLICT (content): Merge conflict in =
drivers/gpu/drm/amd/powerplay/renoir_ppt.c
> Merging drm-intel/for-linux-next (a080bd994c40 drm/i915/gt: Update =
PMINTRMSK holding fw)
> CONFLICT (content): Merge conflict in =
drivers/gpu/drm/i915/gt/selftest_rc6.c
> CONFLICT (content): Merge conflict in =
drivers/gpu/drm/i915/display/intel_ddi.c
> Merging drm-tegra/drm/tegra/for-next (e32c8c2a5fbe drm/tegra: hdmi: =
Silence deferred-probe error)
> Merging drm-misc/for-linux-next (702a21425a6d dt-bindings: display: =
move DSI panels to panel-simple-dsi)
> CONFLICT (content): Merge conflict in =
drivers/gpu/drm/i915/display/intel_dp_mst.c
> CONFLICT (content): Merge conflict in MAINTAINERS
> Merging drm-msm/msm-next (a5fb8b918920 drm/msm/a6xx: Use the DMA API =
for GMU memory objects)
> Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: =
display: Add optional property node define for Mali DP500)
> Merging imx-drm/imx-drm/next (2c76b324c794 drm/imx: parallel-display: =
Adjust bus_flags handling)
> Merging etnaviv/etnaviv/next (f232d9ec029c drm/etnaviv: fix TS cache =
flushing on GPUs with BLT engine)
> Merging regmap/for-next (39165b8dd055 Merge branch 'regmap-5.8' into =
regmap-next)
> Merging sound/for-next (3e8f3bd04716 ALSA: usb-audio: RME Babyface Pro =
mixer patch)
> Merging sound-asoc/for-next (b36a2c84f183 Merge branch 'asoc-5.8' into =
asoc-next)
> $ git reset --hard HEAD^
> Merging next-20200414 version of sound-asoc
> Merging modules/modules-next (0f74226649fb kernel: module: Replace =
zero-length array with flexible-array member)
> Merging input/next (3a8579629665 Input: update SPDX tag for =
input-event-codes.h)
> Merging block/for-next (8f3d9f354286 Linux 5.7-rc1)
> Merging device-mapper/for-next (8267d8fb4819 dm integrity: fix logic =
bug in integrity tag testing)
> Merging pcmcia/pcmcia-next (a8c122f72d94 pcmcia: remove some unused =
space characters)
> Merging mmc/next (23ecdb29060f Merge branch 'fixes' into next)
> Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by =
barrier)
> Merging mfd/for-mfd-next (d2923aa45356 mfd: intel-lpss: Fix Intel =
Elkhart Lake LPSS I2C input clock)
> Merging backlight/for-backlight-next (ee0c8e494cc3 backlight: corgi: =
Convert to use GPIO descriptors)
> Merging battery/for-next (164eaf6b435c power: supply: =
88pm860x_battery: remove redundant dev_err message)
> Merging regulator/for-next (51f66fe6951c Merge branch 'regulator-5.8' =
into regulator-next)
> Merging security/next-testing (3e27a33932df security: remove =
duplicated include from security.h)
> Merging apparmor/apparmor-next (01df52d726b5 apparmor: remove =
duplicate check of xattrs on profile attachment.)
> Merging integrity/next-integrity (9e2b4be377f0 ima: add a new CONFIG =
for loading arch-specific policies)
> Merging keys/keys-next (43672cf93c6d Merge branch =
'notifications-pipe-core' into keys-next)
> CONFLICT (content): Merge conflict in include/linux/lsm_hooks.h
> CONFLICT (content): Merge conflict in fs/pipe.c
> Applying: io_uring: fix up for get_pipe_info() API change
> Applying: security: keys: fixup for "security: Refactor declaration of =
LSM hooks"
> Merging selinux/next (433e3aa37773 selinux: drop unnecessary =
smp_load_acquire() call)
> Merging smack/for-next (92604e825304 smack: use GFP_NOFS while holding =
inode_smack::smk_lock)
> Merging tomoyo/master (8f3d9f354286 Linux 5.7-rc1)
> Merging tpmdd/next (872b0971d74b tpm: ibmvtpm: retry on H_CLOSED in =
tpm_ibmvtpm_send())
> Merging watchdog/master (ea104a9e4d3e watchdog: sp805: fix restart =
handler)
> Merging iommu/next (ff68eb23308e Merge branches 'iommu/fixes', =
'arm/qcom', 'arm/omap', 'arm/smmu', 'x86/amd', 'x86/vt-d', 'virtio' and =
'core' into next)
> Merging vfio/next (f44efca0493d vfio: Ignore -ENODEV when getting MSI =
cookie)
> Merging audit/next (8f3d9f354286 Linux 5.7-rc1)
> Merging devicetree/for-next (befc8236a74f dt-bindings: memory: tegra: =
Add external memory controller binding for Tegra210)
> Merging mailbox/mailbox-for-next (0a67003b1985 mailbox: imx: add SCU =
MU support)
> Merging spi/for-next (5810dd79dec4 Merge branch 'spi-5.8' into =
spi-next)
> Merging tip/auto-latest (354a2fb98a37 Merge branch 'core/urgent')
> Merging clockevents/timers/drivers/next (c1ac28a4de6f Revert =
"clocksource: Avoid creating dead devices")
> Merging edac/edac-for-next (d9976bc155b1 MAINTAINERS: Remove =
sifive_l2_cache.c from EDAC-SIFIVE pattern)
> Merging irqchip/irq/irqchip-next (4cea749d56be Revert "irqchip/xilinx: =
Enable generic irq multi handler")
> Merging ftrace/for-next (8e99cf91b99b tracing: Do not allocate buffer =
in trace_find_next_entry() in atomic)
> Merging rcu/rcu/next (350957908464 Improve KCSAN documentation a bit)
> Merging kvm/linux-next (dbef2808af6c KVM: VMX: fix crash cleanup when =
KVM wasn't used)
> Merging kvm-arm/next (463050599742 Merge tag 'kvm-arm-removal' into =
kvmarm-master/next)
> Merging kvm-ppc/kvm-ppc-next (9a5788c615f5 KVM: PPC: Book3S HV: Add a =
capability for enabling secure guests)
> Merging kvms390/next (7a2653612bb6 s390/gmap: return proper error code =
on ksm unsharing)
> Merging xen-tip/linux-next (6b51fd3f65a2 xen/xenbus: ensure =
xenbus_map_ring_valloc() returns proper grant status)
> Merging percpu/for-next (dedac37ea96b Merge branch 'for-5.7' into =
for-next)
> Merging workqueues/for-next (4acf8a423cd3 Merge branch 'for-5.7' into =
for-next)
> Merging drivers-x86/for-next (8f3d9f354286 Linux 5.7-rc1)
> Merging chrome-platform/for-next (9d33ea331032 platform/chrome: =
cros_ec_typec: Register port partner)
> Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
> Merging leds/for-next (10a6cce3c1a1 Group LED functions according to =
functionality, and add some explaining comments.)
> CONFLICT (content): Merge conflict in drivers/leds/Makefile
> Merging ipmi/for-next (ab032f08dc45 ipmi:bt-bmc: Avoid unnecessary =
check)
> Merging driver-core/driver-core-next (8f3d9f354286 Linux 5.7-rc1)
> Merging usb/usb-next (8f3d9f354286 Linux 5.7-rc1)
> Merging usb-gadget/next (4a5dbd900957 dt-bindings: usb: add =
documentation for aspeed usb-vhub)
> Merging usb-serial/usb-next (8f3d9f354286 Linux 5.7-rc1)
> Merging usb-chipidea-next/ci-for-usb-next (95caa2ae70fd usb: chipidea: =
allow disabling glue drivers if EMBEDDED)
> Merging phy-next/next (8f3d9f354286 Linux 5.7-rc1)
> Merging tty/tty-next (8f3d9f354286 Linux 5.7-rc1)
> Merging char-misc/char-misc-next (8f3d9f354286 Linux 5.7-rc1)
> Merging extcon/extcon-next (8f3d9f354286 Linux 5.7-rc1)
> Merging soundwire/next (8f3d9f354286 Linux 5.7-rc1)
> Merging thunderbolt/next (8f3d9f354286 Linux 5.7-rc1)
> Merging staging/staging-next (ce920326663b staging: vt6656: formulate =
rspinf values into tables)
> Merging mux/for-next (f356d58c3a04 Merge branch 'i2c-mux/for-next' =
into for-next)
> Merging icc/icc-next (03c4e6186bbb interconnect: qcom: Add OSM L3 =
support on SC7180)
> Merging slave-dma/next (c2ce6bbcfc9f dmaengine: idxd: export hw =
version through sysfs)
> Merging cgroup/for-next (eec8fd0277e3 device_cgroup: Cleanup cgroup =
eBPF device filter code)
> Merging scsi/for-next (8d5e0fd1f288 Merge branch 'misc' into for-next)
> Merging scsi-mkp/for-next (1e4ffb8344c5 scsi: libsas: Add missing =
annotation for sas_ata_qc_issue())
> Merging vhost/linux-next (d4a85c2ace89 vdpa: fix comment of =
vdpa_register_device())
> Merging rpmsg/for-next (45c2824de341 Merge branches 'hwspinlock-next', =
'rpmsg-next' and 'rproc-next' into for-next)
> Merging gpio/for-next (8f3d9f354286 Linux 5.7-rc1)
> Merging gpio-brgl/gpio/for-next (ea06a482a47c gpiolib: of: improve =
gpiolib-of support of pull up/down on expanders)
> Merging gpio-intel/for-next (8f3d9f354286 Linux 5.7-rc1)
> Merging pinctrl/for-next (c42f69b4207e pinctrl: qcom: fix compilation =
error)
> Merging pinctrl-intel/for-next (db7102d67b32 pinctrl: lynxpoint: Use =
platform_get_irq_optional() explicitly)
> Merging pinctrl-samsung/for-next (b577a2799140 pinctrl: samsung: =
Correct setting of eint wakeup mask on s5pv210)
> Merging pwm/for-next (9cc5f232a4b6 pwm: pca9685: Fix PWM/GPIO =
inter-operation)
> Merging userns/for-next (560d9e6bc878 proc: Handle umounts cleanly)
> Merging ktest/for-next (1091c8fce8aa ktest: Fix typos in ktest.pl)
> Merging random/dev (ab9a7e27044b random: avoid warnings for =
!CONFIG_NUMA builds)
> Merging kselftest/next (b87080eab4c1 selftests/ipc: Fix test failure =
seen after initial test run)
> Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts =
with tv_nsec >=3D NSEC_PER_SEC")
> Merging livepatching/for-next (d28b4c1b2b3d Merge branch =
'for-5.6/selftests' into for-next)
> Merging coresight/next (50f3e61d96bd coresight: etb10: Make =
coresight_etb_groups static)
> Merging rtc/rtc-next (11ddbdfb68e4 rtc: rc5t619: Fix an ERR_PTR vs =
NULL check)
> Merging nvdimm/libnvdimm-for-next (f6d2b802f80d Merge branch =
'for-5.7/libnvdimm' into libnvdimm-for-next)
> Merging at24/at24/for-next (8f3d9f354286 Linux 5.7-rc1)
> Merging ntb/ntb-next (5cc3de3c7435 NTB: ntb_test: Fix bug when =
counting remote files)
> Merging kspp/for-next/kspp (c7527373fe28 gcc-common.h: Update for GCC =
10)
> Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
> Merging gnss/gnss-next (8f3d9f354286 Linux 5.7-rc1)
> Merging fsi/next (2c01397b71c5 fsi: aspeed: Fix OPB0 byte order =
register values)
> CONFLICT (content): Merge conflict in drivers/fsi/Kconfig
> Merging slimbus/for-next (8f3d9f354286 Linux 5.7-rc1)
> Merging nvmem/for-next (8f3d9f354286 Linux 5.7-rc1)
> Merging xarray/xarray (27586ca786a7 XArray: Handle retry entries =
within xas_find_marked)
> Merging hyperv/hyperv-next (e66b54d07be4 drivers: hv: remove redundant =
assignment to pointer primary_channel)
> Merging auxdisplay/auxdisplay (2f920c0f0e29 auxdisplay: charlcd: =
replace zero-length array with flexible-array member)
> Merging kgdb/kgdb/for-next (5ea771abd5a3 kdb: Censor attempts to set =
PROMPT without ENABLE_MEM_READ)
> Merging pidfd/for-next (6952a4f64644 selftests: add pid namespace =
ENOMEM regression test)
> Merging devfreq/devfreq-next (a35a2f2b3e6e PM / devfreq: tegra30: =
Delete an error message in tegra_devfreq_probe())
> Merging hmm/hmm (8f3d9f354286 Linux 5.7-rc1)
> Merging fpga/for-next (cef0ca6417de fpga: dfl: afu: support debug =
access to memory-mapped afu regions)
> Merging kunit/test (8f3d9f354286 Linux 5.7-rc1)
> Merging cel/cel-next (36b6e409294a svcrdma: Fix leak of =
svc_rdma_recv_ctxt objects)
> Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache =
and devm_ioremap_nocache)
> Merging cfi/cfi/next (b6fe8bc67d2d mtd: hyperbus: move direct mapping =
setup to AM654 HBMC driver)
> Merging kunit-next/kunit (8f3d9f354286 Linux 5.7-rc1)
> Merging trivial/for-next (fad7c9020948 err.h: remove deprecated =
PTR_RET for good)
> Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
> Merging mhi/mhi-next (8f3d9f354286 Linux 5.7-rc1)
> Merging akpm-current/current (547e35135ac5 usb: core: kcov: collect =
coverage from usb complete callback)
> $ git checkout -b akpm remotes/origin/akpm/master
> Applying: mm/kmemleak: silence KCSAN splats in checksum
> Applying: mm/frontswap: mark various intentional data races
> Applying: mm/page_io: mark various intentional data races
> Applying: mm-page_io-mark-various-intentional-data-races-v2
> Applying: mm/swap_state: mark various intentional data races
> Applying: mm/filemap.c: fix a data race in filemap_fault()
> Applying: mm/swapfile: fix and annotate various data races
> Applying: mm-swapfile-fix-and-annotate-various-data-races-v2
> Applying: mm/page_counter: fix various data races at memsw
> Applying: mm/memcontrol: fix a data race in scan count
> Applying: mm/list_lru: fix a data race in list_lru_count_one
> Applying: mm/mempool: fix a data race in mempool_free()
> Applying: mm/util.c: annotate an data race at vm_committed_as
> Applying: mm/rmap: annotate a data race at tlb_flush_batched
> Applying: mm: annotate a data race in page_zonenum()
> Applying: mm/swap.c: annotate data races for lru_rotate_pvecs
> Applying: net-zerocopy: use vm_insert_pages() for tcp rcv zerocopy
> Applying: net-zerocopy-use-vm_insert_pages-for-tcp-rcv-zerocopy-fix
> Applying: mm/debug: add tests validating architecture page table =
helpers
> Applying: mm/madvise: pass task and mm to do_madvise
> Applying: mm/madvise: introduce process_madvise() syscall: an external =
memory hinting API
> Applying: fix process_madvise build break for arm64
> Applying: mm/madvise: check fatal signal pending of target process
> Applying: pid: move pidfd_get_pid() to pid.c
> Applying: mm/madvise: support both pid and pidfd for process_madvise
> Applying: mm/madvise: employ mmget_still_valid() for write lock
> Applying: mm/madvise: allow KSM hints for remote API
> Applying: kexec: prevent removal of memory in use by a loaded kexec =
image
> Applying: mm/memory_hotplug: allow arch override of non boot memory =
resource names
> Applying: arm64: memory: give hotplug memory a different resource name
> Applying: drivers/media/platform/sti/delta/delta-ipc.c: fix read =
buffer overflow
> Merging akpm/master (572a70db833c =
drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer overflow)

