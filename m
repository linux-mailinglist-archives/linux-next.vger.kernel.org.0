Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7081716B80A
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2020 04:24:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbgBYDY6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 Feb 2020 22:24:58 -0500
Received: from ozlabs.org ([203.11.71.1]:58643 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728011AbgBYDY6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 24 Feb 2020 22:24:58 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48RPSN5J2Zz9sPK;
        Tue, 25 Feb 2020 14:24:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1582601092;
        bh=prg2+cdaqaRtYfzj4k64kY9+WbQxp5qcRVoZDYb3/wM=;
        h=Date:From:To:Cc:Subject:From;
        b=sJiri2jDVbe9200jN9TuNh5PeInqYjtNGkZ8JKhBafar9sbnoJQLSp4JznXqz19Xi
         /CKLWTRe64ozucHRcjabafLuLaKgQkDnLwljUkKnWHXZBSoG9DkYlYLV8LHErajJAr
         mTEC50e7yZYjpNw2PJX494GeIKx+DOa/Il9Z+RwiZWyXcCXmBTUTPfMFvl+q8CAkr2
         9PmffUwdTnHii4ttQFxvYXpJs47T6W9Wt8KIt0WPpHwrewdLqGcMnhvpSdLNj4+BG9
         VMXe5uhedUbfhRU576Fku+CapnxDlTWSPEoHzlNG01jGhBeX4/KYSNXnDuJ0y8aYO9
         a/iiexfg7YEcw==
Date:   Tue, 25 Feb 2020 14:24:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 25
Message-ID: <20200225142452.14d4e169@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/riMEoWmewrku.C2u1ypQF4N";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/riMEoWmewrku.C2u1ypQF4N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20200224:

The amlogic tree still had its build failure so I used a supplied patch.

The pinctrl tree gained a build failure so I used the version from
next-20200224.

The akpm-current tree still had its build failure for which I reverted
a series of commits.

Non-merge commits (relative to Linus' tree): 3507
 3431 files changed, 130443 insertions(+), 77501 deletions(-)

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
Merging origin/master (63623fd44972 Merge tag 'for-linus' of git://git.kern=
el.org/pub/scm/virt/kvm/kvm)
Merging fixes/master (ba954bf6cb38 evh_bytechan: fix out of bounds accesses)
Merging kbuild-current/fixes (743de36e106d kbuild: add comment for V=3D2 mo=
de)
Merging arc-current/for-curr (3b00b042eeaa ARC: Replace <linux/clk-provider=
.h> by <linux/of_clk.h>)
Merging arm-current/fixes (89604523a76e ARM: 8961/2: Fix Kbuild issue cause=
d by per-task stack protector GCC plugin)
Merging arm-soc-fixes/arm/fixes (f1e4920fe330 Merge tag 'imx-fixes-5.6' of =
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fixes)
Merging arm64-fixes/for-next/fixes (dcde237319e6 mm: Avoid creating virtual=
 address aliases in brk()/mmap()/mremap())
Merging m68k-current/for-linus (6aabc1facdb2 m68k: Implement copy_thread_tl=
s())
Merging powerpc-fixes/fixes (9eb425b2e04e powerpc/entry: Fix an #if which s=
hould be an #ifdef in entry_32.S)
Merging s390-fixes/fixes (f8788d86ab28 Linux 5.6-rc3)
Merging sparc/master (11648b8339f8 sparc64: fix adjtimex regression)
Merging fscrypt-current/for-stable (ae64f9bd1d36 Linux 4.15-rc2)
Merging net/master (823d81b0fa2c net: bridge: fix stale eth hdr pointer in =
br_dev_xmit)
Merging bpf/master (41f57cfde186 Merge git://git.kernel.org/pub/scm/linux/k=
ernel/git/bpf/bpf)
Merging ipsec/master (a1a7e3a36e01 xfrm: add the missing verify_sec_ctx_len=
 check in xfrm_add_acquire)
Merging netfilter/master (39f3b41aa7ca net: genetlink: return the error cod=
e when attribute parsing fails.)
Merging ipvs/master (c24b75e0f923 ipvs: move old_secure_tcp into struct net=
ns_ipvs)
Merging wireless-drivers/master (a9149d243f25 iwlwifi: mvm: Do not require =
PHY_SKU NVM section for 3168 devices)
Merging mac80211/master (253216ffb2a0 mac80211: rx: avoid RCU list traversa=
l under mutex)
Merging rdma-fixes/for-rc (6affca140cbe RDMA/rw: Fix error flow during RDMA=
 context initialization)
Merging sound-current/for-linus (c37c0ab02956 ALSA: hda/realtek - Fix a reg=
ression for mute led on Lenovo Carbon X1)
Merging sound-asoc-fixes/for-linus (ecdb80c9a1ca Merge branch 'asoc-5.6' in=
to asoc-linus)
Merging regmap-fixes/for-linus (d29456d34def Merge branch 'regmap-5.6' into=
 regmap-linus)
Merging regulator-fixes/for-linus (507cca1fada1 Merge branch 'regulator-5.6=
' into regulator-linus)
Merging spi-fixes/for-linus (dae99f7b7251 Merge branch 'spi-5.6' into spi-l=
inus)
Merging pci-current/for-linus (bb6d3fb354c5 Linux 5.6-rc1)
Merging driver-core.current/driver-core-linus (ae91c9256549 debugfs: remove=
 return value of debugfs_create_regset32())
Merging tty.current/tty-linus (f8788d86ab28 Linux 5.6-rc3)
Merging usb.current/usb-linus (f8788d86ab28 Linux 5.6-rc3)
Merging usb-gadget-fixes/fixes (42cd5ffe46c1 usb: dwc3: debug: fix string p=
osition formatting mixup with ret and len)
Merging usb-serial-fixes/usb-linus (f8788d86ab28 Linux 5.6-rc3)
Merging usb-chipidea-fixes/ci-for-usb-stable (16009db47c51 usb: chipidea: u=
dc: workaround for endpoint conflict issue)
Merging phy/fixes (0ed41b33882c phy: brcm-sata: Correct MDIO operations for=
 40nm platforms)
Merging staging.current/staging-linus (f8788d86ab28 Linux 5.6-rc3)
Merging char-misc.current/char-misc-linus (f8788d86ab28 Linux 5.6-rc3)
Merging soundwire-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging thunderbolt-fixes/fixes (da0f3e0201b8 MAINTAINERS: Sort entries in =
database for THUNDERBOLT)
Merging input-current/for-linus (3dbae1553897 Input: cyapa - replace zero-l=
ength array with flexible-array member)
Merging crypto-current/master (c9cc0517bba9 crypto: chacha20poly1305 - prev=
ent integer overflow on large input)
Merging ide/master (94f2630b1897 Merge tag '5.6-rc-small-smb3-fix-for-stabl=
e' of git://git.samba.org/sfrench/cifs-2.6)
Merging vfio-fixes/for-linus (95f89e090618 vfio/type1: Initialize resv_msi_=
base)
Merging kselftest-fixes/fixes (ef89d0545132 selftests/rseq: Fix out-of-tree=
 compilation)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging slave-dma-fixes/fixes (d288bddd8374 dmaengine: imx-sdma: fix contex=
t cache)
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (def9d2780727 Linux 5.5-rc7)
Merging mfd-fixes/for-mfd-fixes (603d9299da32 mfd: mt6397: Fix probe after =
changing mt6397-core)
Merging v4l-dvb-fixes/fixes (d171c45da874 media: hantro: Fix broken media c=
ontroller links)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (11479e8e3cd8 MIPS: ingenic: DTS: Fix watchdo=
g nodes)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (e500ba0e71f0 Merge branch 'omap-for-v5.6/fixes-rc=
2' into fixes)
Merging kvm-fixes/master (a93236fcbe1d KVM: s390: rstify new ioctls in api.=
rst)
Merging kvms390-fixes/master (5ef8acbdd687 KVM: nVMX: Emulate MTF when perf=
orming instruction emulation)
Merging hwmon-fixes/hwmon (c77ec025346f docs: adm1177: fix a broken referen=
ce)
Merging nvdimm-fixes/libnvdimm-fixes (96222d53842d dax: pass NOWAIT flag to=
 iomap_apply)
Merging btrfs-fixes/next-fixes (5db834fa2a2b Merge branch 'misc-5.6' into n=
ext-fixes)
Merging vfs-fixes/fixes (bf4498ad3f9a tmpfs: deny and force are not huge mo=
unt options)
Merging dma-mapping-fixes/for-linus (9c24eaf81cc4 iommu/vt-d: Return the co=
rrect dma mask when we are bypassing the IOMMU)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging samsung-krzk-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging devicetree-fixes/dt/linus (854bdbae9058 dt-bindings: media: csi: Fi=
x clocks description)
Merging scsi-fixes/fixes (807b9515b7d0 scsi: Revert "target: iscsi: Wait fo=
r all commands to finish before freeing a session")
Merging drm-fixes/drm-fixes (97d9a4e9619a Merge tag 'drm-intel-fixes-2020-0=
2-20' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (f8788d86ab28 Linux 5.6-rc3)
Merging mmc-fixes/fixes (9051db381fab mmc: sdhci-msm: Mark sdhci_msm_cqe_di=
sable static)
Merging rtc-fixes/rtc-fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging gnss-fixes/gnss-linus (f8788d86ab28 Linux 5.6-rc3)
Merging hyperv-fixes/hyperv-fixes (af42d3466bdc Linux 5.4-rc8)
Merging soc-fsl-fixes/fix (5674a92ca4b7 soc/fsl/qe: Fix an error code in qe=
_pin_request())
Merging risc-v-fixes/fixes (e7167043ee50 riscv: Fix gitignore)
Merging pidfd-fixes/fixes (0bef168e8859 exit: Fix Sparse errors and warning=
s)
Merging fpga-fixes/fixes (dec43da46f63 fpga: altera-ps-spi: Fix getting of =
optional confd gpio)
Merging spdx/spdx-linus (bb6d3fb354c5 Linux 5.6-rc1)
Merging gpio-intel-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging pinctrl-intel-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging erofs-fixes/fixes (d1eef1c61974 Linux 5.5-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (fbb30168c739 drm/virtio: fix r=
esource id creation race)
Merging kspp-gustavo/for-next/kspp (d5180902be1c firmware: google: vpd: Rep=
lace zero-length array with flexible-array member)
Merging kbuild/for-next (5693febe8be8 kbuild: remove wrong documentation ab=
out mandatory-y)
Merging compiler-attributes/compiler-attributes (54ecb8f7028c Linux 5.4-rc1)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (75467ee48a5e dma-direct: improve DMA mask ove=
rflow reporting)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (c0cf33e910fe Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (e533dbe9dcb1 arm64: acpi: fix DAIF manipulatio=
n with pNMI)
Merging arm-perf/for-next/perf (8703317ae576 drivers/perf: hisi: update the=
 sccl_id/ccl_id for certain HiSilicon platform)
Merging arm-soc/for-next (f6063ec6ce3c ARM: Document merges)
Merging amlogic/for-next (7ef59ea6bce0 Merge branch 'v5.7/drivers' into tmp=
/aml-rebuild)
Applying: soc: amlogic: fix compile failure with MESON_SECURE_PM_DOMAINS & =
!MESON_SM
Merging aspeed/for-next (5a020d80bbef ARM: dts: aspeed: g4: add video engin=
e support)
Merging at91/at91-next (1c8bb10f82fb Merge branches 'at91-soc', 'at91-dt' a=
nd 'at91-defconfig' into at91-next)
Merging imx-mxs/for-next (48b4bfe7105f Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (a1766a49fc90 Merge tag 'drivers_soc_for_5.6' into ne=
xt)
Merging mediatek/for-next (faf3024a8ea2 Merge branch 'v5.6-next/soc' into f=
or-next)
Merging mvebu/for-next (c0d03b53ef47 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (e500ba0e71f0 Merge branch 'omap-for-v5.6/fixes-rc2' =
into fixes)
Merging qcom/for-next (bc50f20a31b1 Merge branches 'arm64-for-5.7', 'defcon=
fig-for-5.7', 'drivers-for-5.7' and 'dts-for-5.7' into for-next)
Merging raspberrypi/for-next (ec3d259408ce ARM: bcm2835_defconfig: add supp=
ort for Raspberry Pi4)
Merging realtek/for-next (45698e00d5a9 Merge branch 'v5.6/dt' into next)
Merging renesas/next (ddd8444ef822 Merge branch 'renesas-arm-dt-for-v5.7' i=
nto renesas-next)
Merging reset/reset/next (4e0b9bc98c4a dt-bindings: reset: meson: add gxl i=
nternal dac reset)
Merging rockchip/for-next (152f9a049efc Merge branch 'v5.6-clk/fixes' into =
for-next)
Merging samsung-krzk/for-next (0c09ac8e27a0 Merge branch 'next/dt' into for=
-next)
Merging scmi/for-linux-next (f8788d86ab28 Linux 5.6-rc3)
Merging sunxi/sunxi/for-next (ac970cb5c6d4 Merge branches 'sunxi/dt-for-5.7=
' and 'sunxi/fixes-for-5.6' into sunxi/for-next)
Merging tegra/for-next (56568eebf45e Merge branch for-5.7/arm64/dt into for=
-next)
Merging clk/clk-next (931cfff0458a Merge branch 'clk-socfpga' into clk-next)
Merging clk-samsung/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (f8788d86ab28 Linux 5.6-rc3)
Merging h8300/h8300-next (a5de8865cb3e h8300: move definition of __kernel_s=
ize_t etc. to posix_types.h)
Merging ia64/next (240b62d381fe ia64: remove stale paravirt leftovers)
Merging m68k/for-next (dff527e7a0a8 m68k: Switch to asm-generic/hardirq.h)
Merging m68knommu/for-next (f8788d86ab28 Linux 5.6-rc3)
Merging microblaze/next (dcf639fe6f80 microblaze: Kernel parameters should =
be parsed earlier)
Merging mips/mips-next (91f40e896444 mips/jazz: Update jazz_defconfig for M=
IPS Magnum)
Merging nds32/next (d785c5a324cd nds32: configs: Cleanup CONFIG_CROSS_COMPI=
LE)
Merging nios2/for-next (051d75d3bb31 MAINTAINERS: Update Ley Foon Tan's ema=
il address)
Merging openrisc/for-next (fc74d7166005 openrisc: use mmgrab)
Merging parisc-hd/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging powerpc/next (71c3a888cbca Merge tag 'powerpc-5.6-1' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (6a7f10c79574 soc: fsl: dpio: fix dereference of point=
er p before null check)
Merging risc-v/for-next (704dd3cad2e6 RISC-V: Stop putting .sbss in .sdata)
Merging sifive/for-next (467e050e9760 Merge branch 'i2c/for-current' of git=
://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging s390/features (b059a39cfa27 s390/arch: install kernels with their p=
roper version ID)
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
Merging btrfs/for-next (4948f16553e6 Merge branch 'for-next-next-v5.6-20200=
224' into for-next-20200224)
Merging ceph/master (3b20bc2fe4c0 ceph: noacl mount option is effectively i=
gnored)
Merging cifs/for-next (98c6a32fe022 cifs: make use of cap_unix(ses) in cifs=
_reconnect_tcon())
Merging configfs/for-next (e2f238f7d5a1 configfs: calculate the depth of pa=
rent item)
Merging ecryptfs/next (2c2a7552dd64 ecryptfs: replace BUG_ON with error han=
dling code)
Merging erofs/dev (bb6d3fb354c5 Linux 5.6-rc1)
Merging ext3/for_next (daf1cd925487 Pull macro cleanup patches.)
Merging ext4/dev (9db176bceb5c ext4: fix mount failure with quota configure=
d as module)
Merging f2fs/dev (b19e8c684703 Merge tag 'arm64-fixes' of git://git.kernel.=
org/pub/scm/linux/kernel/git/arm64/linux)
Merging fsverity/fsverity (da3a3da4e6c6 fs-verity: use u64_to_user_ptr())
Merging fuse/for-next (3e8cb8b2eaeb fuse: fix stack use after return)
Merging jfs/jfs-next (802a5017ffb2 jfs: remove unused MAXL2PAGES)
Merging nfs/linux-next (11a48a5a18c6 Linux 5.6-rc2)
Merging nfs-anna/linux-next (5d63944f8206 NFSv4: Ensure the delegation cred=
 is pinned when we call delegreturn)
Merging nfsd/nfsd-next (3d96208c30f8 sunrpc: expiry_time should be seconds =
not timeval)
Merging orangefs/for-next (9f198a2ac543 help_next should increase position =
index)
Merging overlayfs/overlayfs-next (c2e87fd93396 ovl: allow remote upper)
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
Merging printk/for-next (d34f14ae521f Merge branch 'for-5.7-preferred-conso=
le' into for-next)
Merging pci/next (daf98fffe4dc Merge branch 'pci/misc')
Merging pstore/for-next/pstore (e163fdb3f7f8 pstore/ram: Regularize prz lab=
el allocation lifetime)
Merging hid/for-next (530c6c3b37e2 Merge branch 'for-5.6/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging i3c/i3c/next (de8964995c79 i3c: master: no need to iterate master d=
evice twice)
Merging dmi/master (6eaaa9e89719 firmware/dmi: Report DMI Bios & EC firmwar=
e release)
Merging hwmon-staging/hwmon-next (b85e1cd57c2c hwmon: (lm73) Add support fo=
r of_match_table)
Merging jc_docs/docs-next (e2c79ab7d75b tools/edid: Move EDID data sets fro=
m Documentation/)
Merging v4l-dvb/master (ef0ed05dcef8 media: staging/imx: Missing assignment=
 in imx_media_capture_device_register())
Merging v4l-dvb-next/master (d45331b00ddb Linux 5.3-rc4)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (49d2c63e171c Merge branch 'pm-qos' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (a30f8a91f3c2 cpufreq: imx-cpufr=
eq-dt: Add "cpu-supply" property check)
Merging cpupower/cpupower (bb6d3fb354c5 Linux 5.6-rc1)
Merging opp/opp/linux-next (03758d60265c opp: Replace list_kref with a loca=
l counter)
Merging thermal/thermal/linux-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (a48f9721e6db dlm: no need to check return value of debugf=
s_create functions)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (f03d9fadfe13 RDMA/core: Add weak ordering dma attr t=
o dma mapping)
Merging net-next/master (8bf2464c47f0 Merge branch 'Bare-UDP-L3-Encapsulati=
on-Module')
Merging bpf-next/master (8eece07c011f Merge tag 'sched-for-bpf-2020-02-20' =
of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip into bpf-next)
Merging ipsec-next/master (dda520c4d462 ESP: Export esp_output_fill_trailer=
 function)
Merging mlx5-next/mlx5-next (339ffae598ed net/mlx5e: Replace zero-length ar=
ray with flexible-array member)
Merging netfilter-next/master (d5110b5d84d3 netfilter: cleanup unused macro)
Merging nfc-next/master (1f008cfec5d5 NFC: fdp: Fix unused variable warning=
s)
CONFLICT (content): Merge conflict in drivers/nfc/st21nfca/se.c
Merging ipvs-next/master (d54725cd11a5 netfilter: nf_tables: support for mu=
ltiple devices per netdev hook)
Merging wireless-drivers-next/master (932183aa35c6 mwifiex: change license =
text from MARVELL to NXP)
Merging bluetooth/master (eed467b517e8 Bluetooth: fix passkey uninitialized=
 when used)
Merging mac80211-next/master (370f51d5edac mac80211: Add api to support con=
figuring TID specific configuration)
Merging gfs2/for-next (9357fd4b0167 gfs2: leaf_dealloc needs to allocate on=
e more revoke)
Merging mtd/mtd/next (4575243c5c17 Merge tag 'nand/for-5.6' into mtd/next)
Merging nand/nand/next (d85339d9ea26 mtd: onenand: Rename omap2 driver to a=
void a build warning)
Merging spi-nor/spi-nor/next (df5c21002cf4 mtd: spi-nor: use spi-mem dirmap=
 API)
Merging crypto/master (ff462ddfd95b crypto: chelsio - Endianess bug in crea=
te_authenc_wr)
Merging drm/drm-next (1b245ec5b685 Merge tag 'drm-misc-next-2020-02-10' of =
git://anongit.freedesktop.org/drm/drm-misc into drm-next)
Merging amdgpu/drm-next (67ceb5261709 drm/amdgpu: add sysfs interface to se=
t arbitrary sclk value for navi14)
CONFLICT (content): Merge conflict in drivers/gpu/drm/ttm/ttm_bo.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ttm=
.c
Merging drm-intel/for-linux-next (4fbe112a5695 drm/i915/gtt: Downgrade gen7=
 (ivb, byt, hsw) back to aliasing-ppgtt)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_scheduler.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_request.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/selftest_lrc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/mock_engine.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_lrc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_context=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_di=
splay.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dd=
i.c
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
Merging regmap/for-next (d29456d34def Merge branch 'regmap-5.6' into regmap=
-linus)
Merging sound/for-next (2948f4a4e583 Merge branch 'topic/usb-uac2-effect-un=
it' into for-next)
Merging sound-asoc/for-next (64a6efcd14e8 Merge branch 'asoc-5.7' into asoc=
-next)
Merging modules/modules-next (0f74226649fb kernel: module: Replace zero-len=
gth array with flexible-array member)
Merging input/next (c5ccf2ad3d33 Input: synaptics-rmi4 - switch to reduced =
reporting mode)
Merging block/for-next (6b6eb301e976 Merge branch 'io_uring-5.6' into for-n=
ext)
Merging device-mapper/for-next (47ace7e012b9 dm: fix potential for q->make_=
request_fn NULL pointer)
Merging pcmcia/pcmcia-next (71705c611263 PCMCIA/i82092: remove #if 0 block)
Merging mmc/next (b6559a9563d6 mmc: host: hsq: Add missing MODULE_LICENSE()=
 and MODULE_DESCRIPTION())
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (1129d6145ed5 mfd: Add support for Azoteq IQS620A/=
621/622/624/625)
Merging backlight/for-backlight-next (7af43a76695d backlight: qcom-wled: Fi=
x unsigned comparison to zero)
Merging battery/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging regulator/for-next (33f2ecda2464 Merge branch 'regulator-5.7' into =
regulator-next)
Merging security/next-testing (3e27a33932df security: remove duplicated inc=
lude from security.h)
Merging apparmor/apparmor-next (01df52d726b5 apparmor: remove duplicate che=
ck of xattrs on profile attachment.)
Merging integrity/next-integrity (5780b9abd530 ima: add sm3 algorithm to ha=
sh algorithm configuration list)
Merging keys/keys-next (bda7978b1956 Merge branch 'keys-acl' into keys-next)
CONFLICT (content): Merge conflict in fs/pipe.c
Merging selinux/next (e4cfa05e9bfe selinux: Add xfs quota command types)
CONFLICT (content): Merge conflict in security/selinux/ss/services.c
CONFLICT (content): Merge conflict in security/selinux/include/security.h
CONFLICT (content): Merge conflict in security/selinux/hooks.c
Merging smack/for-next (92604e825304 smack: use GFP_NOFS while holding inod=
e_smack::smk_lock)
Merging tomoyo/master (bb6d3fb354c5 Linux 5.6-rc1)
Merging tpmdd/next (c706e6eb615b tpm: Don't make log failures fatal)
Merging watchdog/master (44144c809e39 watchdog: da9062: Add dependency on I=
2C)
Merging iommu/next (e3b5ee0cfb65 Merge branches 'iommu/fixes', 'arm/smmu', =
'x86/amd', 'x86/vt-d' and 'core' into next)
Merging vfio/next (7b5372ba04ca vfio: platform: fix __iomem in vfio_platfor=
m_amdxgbe.c)
Merging audit/next (70b3eeed49e8 audit: CONFIG_CHANGE don't log internal bo=
okkeeping as an event)
Merging devicetree/for-next (4aedf242622f kbuild: Build DT binding examples=
 with dtc warnings enabled)
CONFLICT (modify/delete): Documentation/devicetree/bindings/display/etnaviv=
/etnaviv-drm.txt deleted in devicetree/for-next and modified in HEAD. Versi=
on HEAD of Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.tx=
t left in tree.
$ git rm -f Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.t=
xt
Merging mailbox/mailbox-for-next (c6c6bc6ea9fc mailbox: imx: add support fo=
r imx v1 mu)
Merging spi/for-next (5c0fd1c4c909 Merge branch 'spi-5.7' into spi-next)
Merging tip/auto-latest (f4a4fb5f1572 Merge branch 'core/objtool')
Merging clockevents/timers/drivers/next (e4c3b4213b79 clocksource/hyperv: S=
et TSC clocksource as default w/ InvariantTSC)
CONFLICT (content): Merge conflict in drivers/clocksource/hyperv_timer.c
Merging edac/edac-for-next (c7f7b1c8feca Merge branch 'edac-drivers' into e=
dac-for-next)
Merging irqchip/irq/irqchip-next (5186a6cc3ef5 irqchip/gic-v3-its: Rename V=
PENDBASER/VPROPBASER accessors)
Merging ftrace/for-next (5f811c57c992 bootconfig: Add append value operator=
 support)
Merging rcu/rcu/next (8aa63de65a79 kcsan: Add option for verbose reporting)
Merging kvm/linux-next (a93236fcbe1d KVM: s390: rstify new ioctls in api.rs=
t)
Merging kvm-arm/next (e43f1331e2ef arm64: Ask the compiler to __always_inli=
ne functions used by KVM at HYP)
Merging kvm-ppc/kvm-ppc-next (fd24a8624eb2 KVM: PPC: Book3S PR: Fix -Werror=
=3Dreturn-type build failure)
Merging kvms390/next (b35e8878e1d3 KVM: s390/interrupt: do not pin adapter =
interrupt pages)
Merging xen-tip/linux-next (8645e56a4ad6 xen: Enable interrupts when callin=
g _cond_resched())
Merging percpu/for-next (9391e7a9a1e2 Merge branch 'for-5.6' into for-next)
Merging workqueues/for-next (1cd27003497a workqueue: don't use wq_select_un=
bound_cpu() for bound works)
Merging drivers-x86/for-next (7adb1e8aeeb5 platform/x86: intel_pmc_core: Ad=
d debugfs support to access live status registers)
Merging chrome-platform/for-next (42cd0ab476e2 platform/chrome: cros_ec: Qu=
ery EC protocol version if EC transitions between RO/RW)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (11a48a5a18c6 Linux 5.6-rc2)
Merging ipmi/for-next (ef0129a4d06a drivers: char: ipmi: ipmi_msghandler: P=
ass lockdep expression to RCU lists)
Merging driver-core/driver-core-next (99c73ce158a4 drivers base/arch_topolo=
gy: Reformat topology_get_[cpu/freq]_scale() function name)
Merging usb/usb-next (24e6aea4801b Merge 5.6-rc3 into usb-next)
Merging usb-gadget/next (bb6d3fb354c5 Linux 5.6-rc1)
Merging usb-serial/usb-next (2c0bee081315 USB: serial: digi_acceleport: rem=
ove redundant assignment to pointer priv)
Merging usb-chipidea-next/ci-for-usb-next (220fd9c3bf5b usb: chipidea: udc:=
 using structure ci_hdrc device for runtime PM)
Merging phy-next/next (a5c86c557fe9 phy: mapphone-mdm6600: Fix write timeou=
ts with shorter GPIO toggle interval)
Merging tty/tty-next (ba08cf452f34 Merge 5.6-rc3 into tty-next)
Merging char-misc/char-misc-next (1f836f5b10f2 Merge 5.6-rc3 into char-misc=
-next)
Merging extcon/extcon-next (87ccafd3bd64 extcon: palmas: Hide error message=
s if gpio returns -EPROBE_DEFER)
Merging soundwire/next (eff346f24ba9 soundwire: intel: free all resources o=
n hw_free())
Merging thunderbolt/next (3084ea9ea889 thunderbolt: icm: Replace zero-lengt=
h array with flexible-array member)
Merging staging/staging-next (c85f15519d45 Merge 5.6-rc3 into staging-next)
Merging mux/for-next (f356d58c3a04 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging slave-dma/next (2575cb81a966 dmaengine: xilinx_dma: Reset DMA chann=
el in dma_terminate_all)
Merging cgroup/for-next (9bd5910d7f3d selftests/cgroup: add tests for cloni=
ng into cgroups)
Merging scsi/for-next (0a65b349c7fa Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (b417107a659e scsi: advansys: Replace zero-length=
 array with flexible-array member)
Merging vhost/linux-next (370e2c82a4a5 vhost: use batched version by defaul=
t)
Merging rpmsg/for-next (5a87e60312a9 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (ee82ebf16ccb Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (b8419b067390 gpiolib: fix unwatch ioctl())
Merging gpio-intel/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging pinctrl/for-next (a8e488370561 Merge branch 'devel' into for-next)
$ git reset --hard HEAD^
Merging next-20200224 version of pinctrl
Merging pinctrl-intel/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging pinctrl-samsung/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging pwm/for-next (9871abffc810 pwm: Remove set but not set variable 'pw=
m')
Merging userns/for-next (61a47c1ad3a4 sysctl: Remove the sysctl system call)
Merging ktest/for-next (9b5f852ae20d ktest: Make default build option oldco=
nfig not randconfig)
Merging random/dev (4cb760b02419 s390x: Mark archrandom.h functions __must_=
check)
Merging kselftest/next (3032e3a7c7e3 selftests/resctrl: Add the test in MAI=
NTAINERS)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (d28b4c1b2b3d Merge branch 'for-5.6/selftests=
' into for-next)
Merging coresight/next (bb6d3fb354c5 Linux 5.6-rc1)
Merging rtc/rtc-next (4594d082dbe6 rtc: zynqmp: Clear alarm interrupt statu=
s before interrupt enable)
Merging nvdimm/libnvdimm-for-next (7b27a8622f80 libnvdimm/e820: Retrieve an=
d populate correct 'target_node' info)
Merging at24/at24/for-next (4837621cd61e eeprom: at24: add TPF0001 ACPI ID =
for 24c1024 device)
Merging ntb/ntb-next (1ef512b16bc8 NTB: Fix an error in get link status)
Merging kspp/for-next/kspp (c79f46a28239 Linux 5.5-rc5)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (f8788d86ab28 Linux 5.6-rc3)
Merging fsi/next (2c01397b71c5 fsi: aspeed: Fix OPB0 byte order register va=
lues)
CONFLICT (content): Merge conflict in drivers/fsi/Kconfig
Merging slimbus/for-next (526eaf5d08a2 slimbus: Use the correct style for S=
PDX License Identifier)
Merging nvmem/for-next (8daa31303194 nvmem: release the write-protect pin)
Merging xarray/xarray (3a00e7c47c38 ida: remove abandoned macros)
Merging hyperv/hyperv-next (54e19d34011f hv_utils: Add the support of hiber=
nation)
Merging auxdisplay/auxdisplay (54ecb8f7028c Linux 5.4-rc1)
Merging kgdb/kgdb/for-next (5ea771abd5a3 kdb: Censor attempts to set PROMPT=
 without ENABLE_MEM_READ)
Merging pidfd/for-next (8d19f1c8e193 prctl: PR_{G,S}ET_IO_FLUSHER to suppor=
t controlling memory reclaim)
Merging devfreq/devfreq-next (46dbfe265841 PM / devfreq: Fix a typo in a co=
mment)
Merging hmm/hmm (bb6d3fb354c5 Linux 5.6-rc1)
Merging fpga/for-next (309db92e29b1 fpga: zynq: Remove clk_get error messag=
e for probe defer)
Merging kunit/test (bb6d3fb354c5 Linux 5.6-rc1)
Merging cel/cel-next (a99d8080aaf3 Linux 5.4-rc6)
Merging kasan-bitops/topic/kasan-bitops (4f4afc2c9599 docs/core-api: Remove=
 possibly confusing sub-headings from Bit Operations)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging kunit-next/kunit (be886ba90cce kunit: run kunit_tool from any direc=
tory)
Merging akpm-current/current (f8740ac91f9f init/Kconfig: clean up ANON_INOD=
ES and old IO schedulers options)
CONFLICT (content): Merge conflict in arch/m68k/include/asm/Kbuild
CONFLICT (content): Merge conflict in arch/csky/include/asm/Kbuild
Applying: Revert "net-zerocopy-use-vm_insert_pages-for-tcp-rcv-zerocopy-fix"
Applying: Revert "net-zerocopy: use vm_insert_pages() for tcp rcv zerocopy"
Applying: Revert "add missing page_count() check to vm_insert_pages()."
Applying: Revert "mm-add-vm_insert_pages-fix"
Applying: Revert "mm/memory.c: add vm_insert_pages()"
$ git checkout -b akpm remotes/origin/akpm/master
Applying: mm/frontswap: mark various intentional data races
Applying: mm/page_io: mark various intentional data races
Applying: mm-page_io-mark-various-intentional-data-races-v2
Applying: mm/swap_state: mark various intentional data races
Applying: mm/kmemleak: annotate various data races obj->ptr
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
Applying: drivers/tty/serial/sh-sci.c: suppress warning
Applying: drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer ove=
rflow
Merging akpm/master (ab52fd7460d1 drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/riMEoWmewrku.C2u1ypQF4N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5Uk4QACgkQAVBC80lX
0GxtUAf+JAC1QdQCJdzmhsq9gxzNBBtXdxD3/3qEmgFYqjQ5q3yUzMvA+9YhIHLy
Np+zY2PJQxrz1xroeBHf8T6uXHa3SZIjVMi4sbmPuay1rju34Pc+eCnVf4qTIcPD
IRv0aYsFWlaZIIsbpHp4dazGFPytpQRuqB7SkrgYDyTfxv6Apmjz01caTCpbcCbV
IRHIIsGhSZKoP0i2PYQXjy8lU/cYQaHvCsOOi7WLRN5xpbQFzYBjImTjTLNvln58
lbvS48piI7jGEzvnEtu1ASCwzYesV+d6CGvIXovfu/8tyggytvkyPzBJO3NyHaKa
8oMff7RzAlJO2p+LCugEFtDbMqvfjg==
=gOWy
-----END PGP SIGNATURE-----

--Sig_/riMEoWmewrku.C2u1ypQF4N--
