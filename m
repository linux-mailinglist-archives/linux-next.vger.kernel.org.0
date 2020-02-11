Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD6E158812
	for <lists+linux-next@lfdr.de>; Tue, 11 Feb 2020 03:01:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727530AbgBKCBC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 10 Feb 2020 21:01:02 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:45779 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727398AbgBKCBC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 10 Feb 2020 21:01:02 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48GmG02d3nz9sP7;
        Tue, 11 Feb 2020 13:00:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1581386456;
        bh=bOkgRDKPoLZnGYsxObll93JXizBdlDEJDe4nT4lotZE=;
        h=Date:From:To:Cc:Subject:From;
        b=IL87V0IknT5/fNEcfJyQvqQPhsFufhv2eZJefa3G76cnDt3NGkdKOvfjuCwcvwGmq
         x3H8DRpEJAe+st2eGpfUQr1XLhwlaUix8A37dSHW4L5OzcS1xYrj9bnvny3KLqWIfW
         HRdss8+62qwn880Dg9DdhYHsuc1KqvkiLNhxH4eTWsp5cgxw1MIAPqvCcYo0Zd0McK
         nrDrQLUJmP3e9BY59Ns6H/ySkAzyPgqpdHkL1IW85+Dv3aq00agtJo3NgN3erYlc6J
         tQJxD0eTjxni4gcvhYpfuryWiK5k0L+3OgmhMxMqS9bF5Tvi1YjlPBek2eXdh6K6+b
         qp/bMzt72M1lw==
Date:   Tue, 11 Feb 2020 13:00:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 11
Message-ID: <20200211130054.001bfce9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=4u2sZkHfngcl1c7YgCz0rE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=4u2sZkHfngcl1c7YgCz0rE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20200210:

Linus' tree lost its build failure.

The aspeed tree gained a build failure so I used the version from
next-20200210.

The keys tree still had its build failure due to a semantic conflict
with Linus' tree for which I dropped the keys tree for today.

Non-merge commits (relative to Linus' tree): 822
 724 files changed, 15568 insertions(+), 8871 deletions(-)

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
Merging origin/master (bb6d3fb354c5 Linux 5.6-rc1)
Merging fixes/master (ba954bf6cb38 evh_bytechan: fix out of bounds accesses)
Merging kbuild-current/fixes (e4fa21066cef scripts/kallsyms: fix memory cor=
ruption caused by write over-run)
Merging arc-current/for-curr (0acdf63d2296 ARC: fpu: fix randconfig build e=
rror reported by 0-day test service)
Merging arm-current/fixes (6849b5eba196 ARM: 8955/1: virt: Relax arch timer=
 version check during early boot)
Merging arm-soc-fixes/arm/fixes (3508aae9b561 ARM: configs: Cleanup old Kco=
nfig options)
Merging arm64-fixes/for-next/fixes (345d52c184dc arm64/spinlock: fix a -Wun=
used-function warning)
Merging m68k-current/for-linus (6aabc1facdb2 m68k: Implement copy_thread_tl=
s())
Merging powerpc-fixes/fixes (d4bf905307a1 powerpc: Fix CONFIG_TRACE_IRQFLAG=
S with CONFIG_VMAP_STACK)
Merging s390-fixes/fixes (2ae14b57fa3e Merge tag 'vfio-ccw-20200206' of htt=
ps://git.kernel.org/pub/scm/linux/kernel/git/kvms390/vfio-ccw into fixes)
Merging sparc/master (11648b8339f8 sparc64: fix adjtimex regression)
Merging fscrypt-current/for-stable (ae64f9bd1d36 Linux 4.15-rc2)
Merging net/master (00516d13d4cf qmi_wwan: unconditionally reject 2 ep inte=
rfaces)
Merging bpf/master (5391a87751a1 tipc: fix successful connect() but timed o=
ut)
Merging ipsec/master (f1ed10264ed6 vti[6]: fix packet tx through bpf_redire=
ct() in XinY cases)
Merging netfilter/master (a7da92c2c8a1 netfilter: flowtable: skip offload s=
etup if disabled)
Merging ipvs/master (c24b75e0f923 ipvs: move old_secure_tcp into struct net=
ns_ipvs)
Merging wireless-drivers/master (bb6d3fb354c5 Linux 5.6-rc1)
Merging mac80211/master (bfb7bac3a8f4 cfg80211: check wiphy driver existenc=
e for drvinfo report)
Merging rdma-fixes/for-rc (bb6d3fb354c5 Linux 5.6-rc1)
Merging sound-current/for-linus (bb6d3fb354c5 Linux 5.6-rc1)
Merging sound-asoc-fixes/for-linus (42fdb6ead020 Merge branch 'asoc-5.6' in=
to asoc-linus)
Merging regmap-fixes/for-linus (def9d2780727 Linux 5.5-rc7)
Merging regulator-fixes/for-linus (babdd5a84400 Merge branch 'regulator-5.6=
' into regulator-linus)
Merging spi-fixes/for-linus (781102fa411e Merge branch 'spi-5.6' into spi-l=
inus)
Merging pci-current/for-linus (bb6d3fb354c5 Linux 5.6-rc1)
Merging driver-core.current/driver-core-linus (bb6d3fb354c5 Linux 5.6-rc1)
Merging tty.current/tty-linus (1f69a1273b3f tty: serial: tegra: Handle RX t=
ransfer in PIO mode if DMA wasn't started)
Merging usb.current/usb-linus (7f1b92a6a7f2 USB: core: clean up endpoint-de=
scriptor parsing)
Merging usb-gadget-fixes/fixes (e5b5da96da50 usb: gadget: fix wrong endpoin=
t desc)
Merging usb-serial-fixes/usb-linus (7c3d02285ad5 USB: serial: ch341: fix re=
ceiver regression)
Merging usb-chipidea-fixes/ci-for-usb-stable (16009db47c51 usb: chipidea: u=
dc: workaround for endpoint conflict issue)
Merging phy/fixes (4f510aa10468 phy/rockchip: inno-hdmi: round clock rate d=
own to closest 1000 Hz)
Merging staging.current/staging-linus (9a4556bd8f23 staging: rtl8723bs: Rem=
ove unneeded goto statements)
Merging char-misc.current/char-misc-linus (bb6d3fb354c5 Linux 5.6-rc1)
Merging soundwire-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging thunderbolt-fixes/fixes (d5226fa6dbae Linux 5.5)
Merging input-current/for-linus (b19efcabb587 Merge branch 'next' into for-=
linus)
Merging crypto-current/master (2343d1529aff crypto: Kconfig - allow tests t=
o be disabled when manager is disabled)
Merging ide/master (94f2630b1897 Merge tag '5.6-rc-small-smb3-fix-for-stabl=
e' of git://git.samba.org/sfrench/cifs-2.6)
Merging vfio-fixes/for-linus (95f89e090618 vfio/type1: Initialize resv_msi_=
base)
Merging kselftest-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging slave-dma-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (def9d2780727 Linux 5.5-rc7)
Merging mfd-fixes/for-mfd-fixes (603d9299da32 mfd: mt6397: Fix probe after =
changing mt6397-core)
Merging v4l-dvb-fixes/fixes (8821e92879a3 Merge tag 'v5.5-rc5' into patchwo=
rk)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (bbcc5672b006 MIPS: Avoid VDSO ABI breakage d=
ue to global register variable)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (b0b039515445 ARM: dts: am43x-epos-evm: set data p=
in directions for spi0 and spi1)
Merging kvm-fixes/master (6992ca0dd017 Merge branch 'parisc-5.6-1' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux)
Merging kvms390-fixes/master (fe33a928bfcd KVM: s390: ENOTSUPP -> EOPNOTSUP=
P fixups)
Merging hwmon-fixes/hwmon (cf2b012c90e7 hwmon: (pmbus/ltc2978) Fix PMBus po=
lling of MFR_COMMON definitions.)
Merging nvdimm-fixes/libnvdimm-fixes (96222d53842d dax: pass NOWAIT flag to=
 iomap_apply)
Merging btrfs-fixes/next-fixes (5715b7fa8d8d Merge branch 'misc-5.5' into n=
ext-fixes)
Merging vfs-fixes/fixes (d0cb50185ae9 do_last(): fetch directory ->i_mode a=
nd ->i_uid before it's too late)
Merging dma-mapping-fixes/for-linus (9c24eaf81cc4 iommu/vt-d: Return the co=
rrect dma mask when we are bypassing the IOMMU)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging samsung-krzk-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging devicetree-fixes/dt/linus (04dbd86539fd dt-bindings: Fix paths in s=
chema $id fields)
Merging scsi-fixes/fixes (e0a514259378 scsi: ufs: fix spelling mistake "ini=
tilized" -> "initialized")
Merging drm-fixes/drm-fixes (d5226fa6dbae Linux 5.5)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (d5226fa6dbae Linux 5.5)
Merging mmc-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging rtc-fixes/rtc-fixes (f01f4ffdfb70 rtc: cmos: Revert "rtc: Fix the A=
ltCentury value on AMD/Hygon platform")
Merging gnss-fixes/gnss-linus (bb6d3fb354c5 Linux 5.6-rc1)
Merging hyperv-fixes/hyperv-fixes (af42d3466bdc Linux 5.4-rc8)
Merging soc-fsl-fixes/fix (5674a92ca4b7 soc/fsl/qe: Fix an error code in qe=
_pin_request())
Merging risc-v-fixes/fixes (def9d2780727 Linux 5.5-rc7)
Merging pidfd-fixes/fixes (0bef168e8859 exit: Fix Sparse errors and warning=
s)
Merging fpga-fixes/fixes (dec43da46f63 fpga: altera-ps-spi: Fix getting of =
optional confd gpio)
Merging spdx/spdx-linus (bb6d3fb354c5 Linux 5.6-rc1)
Merging gpio-intel-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging pinctrl-intel-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging erofs-fixes/fixes (d1eef1c61974 Linux 5.5-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (48bc281e4bf0 drm/bridge: ti-tf=
p410: Update drm_connector_init_with_ddc() error message)
Merging kspp-gustavo/for-next/kspp (3d519d6d388b sh: kgdb: Mark expected sw=
itch fall-throughs)
Merging kbuild/for-next (bb6d3fb354c5 Linux 5.6-rc1)
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
Merging arm-soc/for-next (1f6cae792ac2 ARM: Document merges)
Merging amlogic/for-next (1b01733a0400 Merge branch 'v5.6/defconfig' into t=
mp/aml-rebuild)
Merging aspeed/for-next (4c4c4b0fa6a8 ARM: dts: aspeed: g4: add video engin=
e support)
$ git reset --hard HEAD^
Merging next-20200210 version of aspeed
Merging at91/at91-next (79e9932ce8b5 Merge branches 'at91-soc' and 'at91-dt=
' into at91-next)
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
Merging renesas/next (c8b8fcddf94a Merge branches 'renesas-arm-dt-for-v5.7'=
, 'renesas-arm-soc-for-v5.7' and 'renesas-arm64-dt-for-v5.7' into renesas-n=
ext)
Merging reset/reset/next (4e0b9bc98c4a dt-bindings: reset: meson: add gxl i=
nternal dac reset)
Merging rockchip/for-next (d9279b5b52ef Merge branch 'v5.6-armsoc/dts64' in=
to for-next)
Merging samsung-krzk/for-next (735478fc8a89 Merge branch 'next/dt' into for=
-next)
Merging scmi/for-linux-next (dfccaaa43bba Merge tag 'juno-fix-5.6' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-linux-=
next)
Merging sunxi/sunxi/for-next (cf284af155ad Merge branches 'sunxi/dt-for-5.7=
' and 'sunxi/fixes-for-5.6' into sunxi/for-next)
Merging tegra/for-next (108f7e5e9478 Merge branch for-5.6/clk into for-next)
Merging clk/clk-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging clk-samsung/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (a019f12a764d csky: Minimize defconfig to support b=
uildroot config.fragment)
Merging h8300/h8300-next (a5de8865cb3e h8300: move definition of __kernel_s=
ize_t etc. to posix_types.h)
Merging ia64/next (240b62d381fe ia64: remove stale paravirt leftovers)
Merging m68k/for-next (dff527e7a0a8 m68k: Switch to asm-generic/hardirq.h)
Merging m68knommu/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging microblaze/next (6aa71ef9bcf9 microblaze: Add ID for Microblaze v11)
Merging mips/mips-next (2c4288719806 MIPS: PCI: Add detection of IOC3 on IO=
7, IO8, IO9 and Fuel)
Merging nds32/next (a7f96fce201c MAINTAINERS: add nds32 maintainer)
Merging nios2/for-next (051d75d3bb31 MAINTAINERS: Update Ley Foon Tan's ema=
il address)
Merging openrisc/for-next (0ecdcaa6d5e7 openrisc: Fix Kconfig indentation)
Merging parisc-hd/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging powerpc/next (71c3a888cbca Merge tag 'powerpc-5.6-1' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/powerpc/linux)
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
Merging cifs/for-next (b5f81e78a938 cifs: plumb smb2 POSIX dir enumeration)
Merging configfs/for-next (e2f238f7d5a1 configfs: calculate the depth of pa=
rent item)
Merging ecryptfs/next (b4a81b87a4cf ecryptfs: fix a memory leak bug in ecry=
ptfs_init_messaging())
Merging erofs/dev (bb6d3fb354c5 Linux 5.6-rc1)
Merging ext3/for_next (daf1cd925487 Pull macro cleanup patches.)
Merging ext4/dev (7f6225e446cc jbd2: clean __jbd2_journal_abort_hard() and =
__journal_abort_soft())
Merging f2fs/dev (ccaaaf6fe5a5 Merge tag 'mpx-for-linus' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/daveh/x86-mpx)
Merging fsverity/fsverity (da3a3da4e6c6 fs-verity: use u64_to_user_ptr())
Merging fuse/for-next (cabdb4fa2f66 fuse: use true,false for bool variable)
Merging jfs/jfs-next (802a5017ffb2 jfs: remove unused MAXL2PAGES)
Merging nfs/linux-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging nfs-anna/linux-next (7dc2993a9e51 NFSv4.0: nfs4_do_fsinfo() should =
not do implicit lease renewals)
Merging nfsd/nfsd-next (3d96208c30f8 sunrpc: expiry_time should be seconds =
not timeval)
Merging orangefs/for-next (9f198a2ac543 help_next should increase position =
index)
Merging overlayfs/overlayfs-next (a4ac9d45c0cd ovl: fix lseek overflow on 3=
2bit)
Merging ubifs/linux-next (fe357dbae113 ubi: Fix an error pointer dereferenc=
e in error handling code)
Merging v9fs/9p-next (79fb9216b7be 9p: Remove unneeded semicolon)
Merging xfs/for-next (cdbcf82b86ea xfs: fix xfs_buf_ioerror_alert location =
reporting)
Merging zonefs/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging iomap/iomap-for-next (243145bc4336 fs: Fix page_mkwrite off-by-one =
errors)
Merging djw-vfs/vfs-for-next (3253d9d09337 splice: only read in as much inf=
ormation as there is pipe buffer space)
Merging file-locks/locks-next (98ca480a8f22 locks: print unsigned ino in /p=
roc/locks)
Merging vfs/for-next (0fd169576648 fs: Add VirtualBox guest shared folder (=
vboxsf) support)
Merging printk/for-next (e616b43fb3a3 Merge branch 'for-5.6' into for-next)
Merging pci/next (bb6d3fb354c5 Linux 5.6-rc1)
Merging pstore/for-next/pstore (e163fdb3f7f8 pstore/ram: Regularize prz lab=
el allocation lifetime)
Merging hid/for-next (ada131c2f224 Merge branch 'for-5.6/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging i3c/i3c/next (3952cf8ff2f7 i3c: master: dw: reattach device on firs=
t available location of address table)
Merging dmi/master (2429c99fa13a firmware: dmi: Add dmi_memdev_handle)
Merging hwmon-staging/hwmon-next (2cef560d05dd bindings: (hwmon/ltc2978.txt=
) add support for more parts (bindings))
Merging jc_docs/docs-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging v4l-dvb/master (1697d9812481 media: staging/intel-ipu3: remove TODO=
 item about acronyms)
Merging v4l-dvb-next/master (d45331b00ddb Linux 5.3-rc4)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (f3b4b0d58486 Merge branches 'acpi-watchdog' and 'acp=
i-ec' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (a48ac1c9f294 cpufreq: brcmstb-a=
vs: fix imbalance of cpufreq policy refcount)
Merging cpupower/cpupower (bb6d3fb354c5 Linux 5.6-rc1)
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
Merging rdma/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging net-next/master (fdfa3a6778b1 Merge tag 'scsi-misc' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging bpf-next/master (fdfa3a6778b1 Merge tag 'scsi-misc' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging ipsec-next/master (9f68e3655aae Merge tag 'drm-next-2020-01-30' of =
git://anongit.freedesktop.org/drm/drm)
Merging mlx5-next/mlx5-next (a4ad6db8a2de net/mlx5: Add bit to indicate sup=
port for encap/decap in sw-steering managed tables)
Merging netfilter-next/master (fdfa3a6778b1 Merge tag 'scsi-misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging nfc-next/master (1f008cfec5d5 NFC: fdp: Fix unused variable warning=
s)
CONFLICT (content): Merge conflict in drivers/nfc/st21nfca/se.c
Merging ipvs-next/master (d54725cd11a5 netfilter: nf_tables: support for mu=
ltiple devices per netdev hook)
Merging wireless-drivers-next/master (bb6d3fb354c5 Linux 5.6-rc1)
Merging bluetooth/master (eb3939e386ec Bluetooth: btusb: Add support for 13=
d3:3548 Realtek 8822CE device)
Merging mac80211-next/master (ed27b5786a6c mac80211: Fix setting txpower to=
 zero)
Merging gfs2/for-next (6e5e41e2dc4e gfs2: fix O_SYNC write handling)
Merging mtd/mtd/next (4575243c5c17 Merge tag 'nand/for-5.6' into mtd/next)
Merging nand/nand/next (d85339d9ea26 mtd: onenand: Rename omap2 driver to a=
void a build warning)
Merging spi-nor/spi-nor/next (ccfb9299a0b6 mtd: spi-nor: Add support for at=
25sl321)
Merging crypto/master (0bc81767c5bd crypto: arm/chacha - fix build failured=
 when kernel mode NEON is disabled)
Merging drm/drm-next (9f880327160f Merge tag 'amd-drm-next-5.6-2020-02-05' =
of git://people.freedesktop.org/~agd5f/linux into drm-next)
Merging amdgpu/drm-next (492399e45855 drm/amdgpu: drop legacy drm load and =
unload callbacks)
Merging drm-intel/for-linux-next (1b5af5378165 drm/i915/gt: Use the BIT whe=
n checking the flags, not the index)
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
Merging sound/for-next (0e023687ca55 ALSA: info: remove redundant assignmen=
t to variable c)
Merging sound-asoc/for-next (42fdb6ead020 Merge branch 'asoc-5.6' into asoc=
-linus)
Merging modules/modules-next (6080d608eeff module.h: Annotate mod_kallsyms =
with __rcu)
Merging input/next (c5ccf2ad3d33 Input: synaptics-rmi4 - switch to reduced =
reporting mode)
Merging block/for-next (b6402e352de5 Merge branch 'io_uring-5.6-poll' into =
for-next)
Merging device-mapper/for-next (47ace7e012b9 dm: fix potential for q->make_=
request_fn NULL pointer)
Merging pcmcia/pcmcia-next (71705c611263 PCMCIA/i82092: remove #if 0 block)
Merging mmc/next (bb6d3fb354c5 Linux 5.6-rc1)
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (5312f321a67c mfd: syscon: Fix syscon_regmap_looku=
p_by_phandle_args() dummy)
Merging backlight/for-backlight-next (7af43a76695d backlight: qcom-wled: Fi=
x unsigned comparison to zero)
Merging battery/for-next (3d32a8437c05 power: supply: ipaq_micro_battery: r=
emove unneeded semicolon)
Merging regulator/for-next (babdd5a84400 Merge branch 'regulator-5.6' into =
regulator-linus)
Merging security/next-testing (10c2d111c906 security: remove EARLY_LSM_COUN=
T which never used)
Merging apparmor/apparmor-next (01df52d726b5 apparmor: remove duplicate che=
ck of xattrs on profile attachment.)
Merging integrity/next-integrity (d54e17b40666 Merge branch 'next-integrity=
.defer-measuring-keys' into next-integrity)
Merging keys/keys-next (24f779af0476 Merge branch 'keys-acl' into keys-next)
CONFLICT (content): Merge conflict in include/linux/lsm_audit.h
CONFLICT (content): Merge conflict in fs/pipe.c
$ git reset --hard HEAD^
Merging selinux/next (8d269a8e2a8f selinux: sel_avc_get_stat_idx should inc=
rease position index)
Merging smack/for-next (92604e825304 smack: use GFP_NOFS while holding inod=
e_smack::smk_lock)
Merging tomoyo/master (bb6d3fb354c5 Linux 5.6-rc1)
Merging tpmdd/next (7307384af28c tpm: Revert tpm_tis_spi_mod.ko to tpm_tis_=
spi.ko.)
Merging watchdog/master (057b52b4b3d5 watchdog: da9062: make restart handle=
r atomic safe)
Merging iommu/next (e3b5ee0cfb65 Merge branches 'iommu/fixes', 'arm/smmu', =
'x86/amd', 'x86/vt-d' and 'core' into next)
Merging vfio/next (7b5372ba04ca vfio: platform: fix __iomem in vfio_platfor=
m_amdxgbe.c)
Merging audit/next (70b3eeed49e8 audit: CONFIG_CHANGE don't log internal bo=
okkeeping as an event)
Merging devicetree/for-next (e9a3bfe38e39 scripts/dtc: Revert "yamltree: En=
sure consistent bracketing of properties with phandles")
Merging mailbox/mailbox-for-next (c6c6bc6ea9fc mailbox: imx: add support fo=
r imx v1 mu)
Merging spi/for-next (781102fa411e Merge branch 'spi-5.6' into spi-linus)
Merging tip/auto-latest (178915ad4ab3 Merge branch 'core/urgent')
Merging clockevents/timers/drivers/next (e4c3b4213b79 clocksource/hyperv: S=
et TSC clocksource as default w/ InvariantTSC)
Merging edac/edac-for-next (7e5d6cf35329 EDAC/amd64: Do not warn when remov=
ing instances)
Merging irqchip/irq/irqchip-next (5186a6cc3ef5 irqchip/gic-v3-its: Rename V=
PENDBASER/VPROPBASER accessors)
Merging ftrace/for-next (f61872bb58a1 bootconfig: Use parse_args() to find =
bootconfig and '--')
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
Merging drivers-x86/for-next (2cc70da2f097 platform/x86: intel_pmc_core: Ad=
d debugfs support to access live status registers)
Merging chrome-platform/for-next (034dbec179e5 platform/chrome: cros_ec: Ma=
tch implementation with headers)
Merging hsi/for-next (c1030cd45619 HSI: Remove dev_err() usage after platfo=
rm_get_irq())
Merging leds/for-next (260718b3a35d leds: lm3692x: Disable chip on brightne=
ss 0)
Merging ipmi/for-next (e0354d147e58 drivers: ipmi: fix off-by-one bounds ch=
eck that leads to a out-of-bounds write)
Merging driver-core/driver-core-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging usb/usb-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging usb-gadget/next (4baa550ecc86 usb: musb: remove dummy driver musb_a=
m335x.c)
Merging usb-serial/usb-next (2c0bee081315 USB: serial: digi_acceleport: rem=
ove redundant assignment to pointer priv)
Merging usb-chipidea-next/ci-for-usb-next (4d6141288c33 usb: chipidea: imx:=
 pinctrl for HSIC is optional)
Merging phy-next/next (a5c86c557fe9 phy: mapphone-mdm6600: Fix write timeou=
ts with shorter GPIO toggle interval)
Merging tty/tty-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging char-misc/char-misc-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging extcon/extcon-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging soundwire/next (bb6d3fb354c5 Linux 5.6-rc1)
Merging thunderbolt/next (d5226fa6dbae Linux 5.5)
Merging staging/staging-next (0e3ee7f10af9 staging: qlge: remove spaces at =
the start of a line)
Merging mux/for-next (f356d58c3a04 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging slave-dma/next (bb6d3fb354c5 Linux 5.6-rc1)
Merging cgroup/for-next (0cd9d33ace33 cgroup: init_tasks shouldn't be linke=
d to the root cgroup)
Merging scsi/for-next (bf2f620ec1c8 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (e0a514259378 scsi: ufs: fix spelling mistake "in=
itilized" -> "initialized")
Merging vhost/linux-next (370e2c82a4a5 vhost: use batched version by defaul=
t)
Merging rpmsg/for-next (5a87e60312a9 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (612e35e76ec8 Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (47203198ed3d gpio: wcd934x: Fix logic of w=
cd_gpio_get)
Merging gpio-intel/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging pinctrl/for-next (122ce22cb37b pinctrl: madera: Remove extra blank =
line)
Merging pinctrl-intel/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging pinctrl-samsung/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging pwm/for-next (9871abffc810 pwm: Remove set but not set variable 'pw=
m')
Merging userns/for-next (61a47c1ad3a4 sysctl: Remove the sysctl system call)
Merging ktest/for-next (9b5f852ae20d ktest: Make default build option oldco=
nfig not randconfig)
Merging random/dev (4cb760b02419 s390x: Mark archrandom.h functions __must_=
check)
Merging kselftest/next (bb6d3fb354c5 Linux 5.6-rc1)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (d28b4c1b2b3d Merge branch 'for-5.6/selftests=
' into for-next)
Merging coresight/next (bb6d3fb354c5 Linux 5.6-rc1)
Merging rtc/rtc-next (f45719240700 dt-bindings: rtc: at91rm9200: document c=
locks property)
Merging nvdimm/libnvdimm-for-next (46cf053efec6 Linux 5.5-rc3)
Merging at24/at24/for-next (4837621cd61e eeprom: at24: add TPF0001 ACPI ID =
for 24c1024 device)
Merging ntb/ntb-next (1ef512b16bc8 NTB: Fix an error in get link status)
Merging kspp/for-next/kspp (c79f46a28239 Linux 5.5-rc5)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (bb6d3fb354c5 Linux 5.6-rc1)
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
Merging devfreq/devfreq-next (a454401a57ed PM / devfreq: Change to DEVFREQ_=
GOV_UPDATE_INTERVAL event name)
Merging hmm/hmm (bb6d3fb354c5 Linux 5.6-rc1)
Merging fpga/for-next (28910cee898c fpga: xilinx-pr-decoupler: Remove clk_g=
et error message for probe defer)
Merging kunit/test (bb6d3fb354c5 Linux 5.6-rc1)
Merging cel/cel-next (a99d8080aaf3 Linux 5.4-rc6)
Merging kasan-bitops/topic/kasan-bitops (4f4afc2c9599 docs/core-api: Remove=
 possibly confusing sub-headings from Bit Operations)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging kunit-next/kunit (bb6d3fb354c5 Linux 5.6-rc1)
Merging akpm-current/current (ec7c11f69882 aio: simplify read_events())
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/tty/serial/sh-sci.c: suppress warning
Applying: drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer ove=
rflow
Merging akpm/master (a36f6618bf6c drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/=4u2sZkHfngcl1c7YgCz0rE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5CCtYACgkQAVBC80lX
0GwrDwf+Lompz8EThoRFw5Kj7dqSk9oI4jeXm6QHmtH84y0ufhGpDr5qIeAcRYo7
nZdg1YTSE0qWqet865w6+6DJA8LMJgh5xVdptgdRalshi9e1BmFr3JO+vi4UKfA+
9sRTofb6fknEcWPJOCWsfiPhg52FltLkNy4Ozki0AdagNEGbBJSaz6s/aXFWI04h
y7eknpEdSY1cnwuvQPzjIXbxMbifNRXz32gxgc8J/jbRS1e3J0zjK1wDLSL+Iw+X
PFOQnC9nAqAdqtJNtyCT0XMo8syXenEgJ7f8r3umZLKxHJN9KbsEmtEfGg3o7wJK
QvZU+dWfMJaYd+9XmENxRhEO65R8cg==
=PNt0
-----END PGP SIGNATURE-----

--Sig_/=4u2sZkHfngcl1c7YgCz0rE--
