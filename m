Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0864B1655D5
	for <lists+linux-next@lfdr.de>; Thu, 20 Feb 2020 04:44:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727637AbgBTDoT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Feb 2020 22:44:19 -0500
Received: from ozlabs.org ([203.11.71.1]:57953 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727749AbgBTDoS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 19 Feb 2020 22:44:18 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48NL6z2FQNz9sRN;
        Thu, 20 Feb 2020 14:44:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1582170251;
        bh=DKm6d2coHAbW8G7hdLqULTr1xwwQyA270LkWwTCpczs=;
        h=Date:From:To:Cc:Subject:From;
        b=Fn91r0fAbZ5gs0IOQBZZ61Xezgl8hoDv7QPun/qviM99GFsYlqO0AcFIC6Z6CFSWH
         qXBDVqVjMfWe8dM0s3H7P1Xt/NnzDRveQqNUGM2e5qbzd3daxHui4AXctISdLO4lKo
         CWuzxzrSH1FEOkZ1iGnmmZz8lIlF3HxD6kaDtR2m9Zgf//DBbS+z5/Cr7JBzFIX2/J
         K7KnlPlyQ2ZfmDZfVw9m1wCW9DDWveLGnYenUrpWghW4PexKdWe1ESASUyO2yof+EV
         3Y8FnbBBryW4umRuGWN/Jcy78E/YEE7Qb1ma822GjkEr6l4Zr0uTp2st0YP9i5zUd6
         M94dircz1HC+A==
Date:   Thu, 20 Feb 2020 14:44:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 20
Message-ID: <20200220144408.359a7e02@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KaROle9uF.8MAE8VddEqV_P";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/KaROle9uF.8MAE8VddEqV_P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20200219:

The amlogic tree still had its build failure so I used a supplied patch.

The btrfs tree gained a semantic conflict against the btrfs-fixes tree.

The keys tree gained a conflict aginst Linus' tree.

The akpm-current tree still had its build failure for which I reverted
a series of commits.

Non-merge commits (relative to Linus' tree): 2743
 2580 files changed, 95620 insertions(+), 69609 deletions(-)

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
Merging origin/master (4b205766d8fc Merge tag 'iommu-fixes-v5.6-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu)
Merging fixes/master (ba954bf6cb38 evh_bytechan: fix out of bounds accesses)
Merging kbuild-current/fixes (743de36e106d kbuild: add comment for V=3D2 mo=
de)
Merging arc-current/for-curr (3b00b042eeaa ARC: Replace <linux/clk-provider=
.h> by <linux/of_clk.h>)
Merging arm-current/fixes (6849b5eba196 ARM: 8955/1: virt: Relax arch timer=
 version check during early boot)
Merging arm-soc-fixes/arm/fixes (3bf3c9744694 bus: moxtet: fix potential st=
ack buffer overflow)
Merging arm64-fixes/for-next/fixes (374fdad4b2d8 mm: Avoid creating virtual=
 address aliases in brk()/mmap()/mremap())
Merging m68k-current/for-linus (6aabc1facdb2 m68k: Implement copy_thread_tl=
s())
Merging powerpc-fixes/fixes (9eb425b2e04e powerpc/entry: Fix an #if which s=
hould be an #ifdef in entry_32.S)
Merging s390-fixes/fixes (2db01da8d25f s390/qdio: fill SBALEs with absolute=
 addresses)
Merging sparc/master (11648b8339f8 sparc64: fix adjtimex regression)
Merging fscrypt-current/for-stable (ae64f9bd1d36 Linux 4.15-rc2)
Merging net/master (33c4acbe2f4e bridge: br_stp: Use built-in RCU list chec=
king)
Merging bpf/master (113e6b7e15e2 libbpf: Sanitise internal map names so the=
y are not rejected by the kernel)
Merging ipsec/master (a1a7e3a36e01 xfrm: add the missing verify_sec_ctx_len=
 check in xfrm_add_acquire)
Merging netfilter/master (33c4acbe2f4e bridge: br_stp: Use built-in RCU lis=
t checking)
Merging ipvs/master (c24b75e0f923 ipvs: move old_secure_tcp into struct net=
ns_ipvs)
Merging wireless-drivers/master (a9149d243f25 iwlwifi: mvm: Do not require =
PHY_SKU NVM section for 3168 devices)
Merging mac80211/master (9a6a0dea1617 net: ethernet: dm9000: Handle -EPROBE=
_DEFER in dm9000_parse_dt())
Merging rdma-fixes/for-rc (11a48a5a18c6 Linux 5.6-rc2)
Merging sound-current/for-linus (c37c0ab02956 ALSA: hda/realtek - Fix a reg=
ression for mute led on Lenovo Carbon X1)
Merging sound-asoc-fixes/for-linus (b5d6aea6dbcb Merge branch 'asoc-5.6' in=
to asoc-linus)
Merging regmap-fixes/for-linus (bb6d3fb354c5 Linux 5.6-rc1)
Merging regulator-fixes/for-linus (507cca1fada1 Merge branch 'regulator-5.6=
' into regulator-linus)
Merging spi-fixes/for-linus (2bb416047aab Merge branch 'spi-5.6' into spi-l=
inus)
Merging pci-current/for-linus (bb6d3fb354c5 Linux 5.6-rc1)
Merging driver-core.current/driver-core-linus (ae91c9256549 debugfs: remove=
 return value of debugfs_create_regset32())
Merging tty.current/tty-linus (07e6124a1a46 vt: selection, close sel_buffer=
 race)
Merging usb.current/usb-linus (8b978be8d067 Merge tag 'thunderbolt-fix-for-=
v5.6-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderb=
olt into usb-linus)
Merging usb-gadget-fixes/fixes (42cd5ffe46c1 usb: dwc3: debug: fix string p=
osition formatting mixup with ret and len)
Merging usb-serial-fixes/usb-linus (7c3d02285ad5 USB: serial: ch341: fix re=
ceiver regression)
Merging usb-chipidea-fixes/ci-for-usb-stable (16009db47c51 usb: chipidea: u=
dc: workaround for endpoint conflict issue)
Merging phy/fixes (1d7cb11e1090 phy: core: Fix phy_get() to not return erro=
r on link creation failure)
Merging staging.current/staging-linus (9a4556bd8f23 staging: rtl8723bs: Rem=
ove unneeded goto statements)
Merging char-misc.current/char-misc-linus (74ba569a15a0 Merge tag 'misc-hab=
analabs-fixes-2020-02-11' of git://people.freedesktop.org/~gabbayo/linux in=
to char-misc-linus)
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
Merging kselftest-fixes/fixes (9a0584f05687 selftests: openat2: fix build e=
rror on newer glibc)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging slave-dma-fixes/fixes (8390318c04bb dmaengine: ti: k3-udma: Fix ter=
minated transfer handling)
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (def9d2780727 Linux 5.5-rc7)
Merging mfd-fixes/for-mfd-fixes (603d9299da32 mfd: mt6397: Fix probe after =
changing mt6397-core)
Merging v4l-dvb-fixes/fixes (1697d9812481 media: staging/intel-ipu3: remove=
 TODO item about acronyms)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (11479e8e3cd8 MIPS: ingenic: DTS: Fix watchdo=
g nodes)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (b0b039515445 ARM: dts: am43x-epos-evm: set data p=
in directions for spi0 and spi1)
Merging kvm-fixes/master (ead68df94d24 KVM: x86: enable -Werror)
Merging kvms390-fixes/master (fe33a928bfcd KVM: s390: ENOTSUPP -> EOPNOTSUP=
P fixups)
Merging hwmon-fixes/hwmon (0a923a76d615 Documentation/hwmon: fix xdpe12284 =
Sphinx warnings)
Merging nvdimm-fixes/libnvdimm-fixes (96222d53842d dax: pass NOWAIT flag to=
 iomap_apply)
Merging btrfs-fixes/next-fixes (3ea1e0dba035 Merge branch 'misc-5.6' into n=
ext-fixes)
Merging vfs-fixes/fixes (bf4498ad3f9a tmpfs: deny and force are not huge mo=
unt options)
Merging dma-mapping-fixes/for-linus (9c24eaf81cc4 iommu/vt-d: Return the co=
rrect dma mask when we are bypassing the IOMMU)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging samsung-krzk-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging devicetree-fixes/dt/linus (04dbd86539fd dt-bindings: Fix paths in s=
chema $id fields)
Merging scsi-fixes/fixes (807b9515b7d0 scsi: Revert "target: iscsi: Wait fo=
r all commands to finish before freeing a session")
Merging drm-fixes/drm-fixes (11a48a5a18c6 Linux 5.6-rc2)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (32bf7102751d HACK: Revert "AC=
PI: PM: s2idle: Avoid possible race related to the EC GPE")
Merging mmc-fixes/fixes (9051db381fab mmc: sdhci-msm: Mark sdhci_msm_cqe_di=
sable static)
Merging rtc-fixes/rtc-fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging gnss-fixes/gnss-linus (bb6d3fb354c5 Linux 5.6-rc1)
Merging hyperv-fixes/hyperv-fixes (af42d3466bdc Linux 5.4-rc8)
Merging soc-fsl-fixes/fix (5674a92ca4b7 soc/fsl/qe: Fix an error code in qe=
_pin_request())
Merging risc-v-fixes/fixes (6a1ce99dc4bd RISC-V: Don't enable all interrupt=
s in trap_init())
Merging pidfd-fixes/fixes (0bef168e8859 exit: Fix Sparse errors and warning=
s)
Merging fpga-fixes/fixes (dec43da46f63 fpga: altera-ps-spi: Fix getting of =
optional confd gpio)
Merging spdx/spdx-linus (bb6d3fb354c5 Linux 5.6-rc1)
Merging gpio-intel-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging pinctrl-intel-fixes/fixes (bb6d3fb354c5 Linux 5.6-rc1)
Merging erofs-fixes/fixes (d1eef1c61974 Linux 5.5-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (dde2bb2da01e drm/panfrost: per=
fcnt: Reserve/use the AS attached to the perfcnt MMU context)
Merging kspp-gustavo/for-next/kspp (bb6d3fb354c5 Linux 5.6-rc1)
Merging kbuild/for-next (0bf999f9c5e7 linux/pipe_fs_i.h: fix kernel-doc war=
nings after @wait was split)
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
Merging arm-soc/for-next (f07849b2ac77 ARM: Document merges)
Merging amlogic/for-next (7ef59ea6bce0 Merge branch 'v5.7/drivers' into tmp=
/aml-rebuild)
Applying: soc: amlogic: fix compile failure with MESON_SECURE_PM_DOMAINS & =
!MESON_SM
Merging aspeed/for-next (5a020d80bbef ARM: dts: aspeed: g4: add video engin=
e support)
Merging at91/at91-next (1c8bb10f82fb Merge branches 'at91-soc', 'at91-dt' a=
nd 'at91-defconfig' into at91-next)
Merging imx-mxs/for-next (605ee38a3bbe Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (a1766a49fc90 Merge tag 'drivers_soc_for_5.6' into ne=
xt)
Merging mediatek/for-next (faf3024a8ea2 Merge branch 'v5.6-next/soc' into f=
or-next)
Merging mvebu/for-next (c0d03b53ef47 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (f9f5267ec296 Merge branch 'omap-for-v5.6/dt' into fo=
r-next)
Merging qcom/for-next (bc50f20a31b1 Merge branches 'arm64-for-5.7', 'defcon=
fig-for-5.7', 'drivers-for-5.7' and 'dts-for-5.7' into for-next)
Merging raspberrypi/for-next (ec3d259408ce ARM: bcm2835_defconfig: add supp=
ort for Raspberry Pi4)
Merging realtek/for-next (45698e00d5a9 Merge branch 'v5.6/dt' into next)
Merging renesas/next (c3f5f82f4dfc Merge branches 'renesas-arm-soc-for-v5.7=
' and 'renesas-drivers-for-v5.7' into renesas-next)
Merging reset/reset/next (4e0b9bc98c4a dt-bindings: reset: meson: add gxl i=
nternal dac reset)
Merging rockchip/for-next (152f9a049efc Merge branch 'v5.6-clk/fixes' into =
for-next)
Merging samsung-krzk/for-next (d34a833fd230 Merge branch 'next/defconfig' i=
nto for-next)
Merging scmi/for-linux-next (11a48a5a18c6 Linux 5.6-rc2)
Merging sunxi/sunxi/for-next (8033917515c7 Merge branches 'sunxi/clk-for-5.=
7', 'sunxi/core-for-5.7' and 'sunxi/dt-for-5.7' into sunxi/for-next)
Merging tegra/for-next (56568eebf45e Merge branch for-5.7/arm64/dt into for=
-next)
Merging clk/clk-next (931cfff0458a Merge branch 'clk-socfpga' into clk-next)
Merging clk-samsung/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (85ea1329d674 csky: Replace <linux/clk-provider.h> =
by <linux/of_clk.h>)
Merging h8300/h8300-next (a5de8865cb3e h8300: move definition of __kernel_s=
ize_t etc. to posix_types.h)
Merging ia64/next (240b62d381fe ia64: remove stale paravirt leftovers)
Merging m68k/for-next (dff527e7a0a8 m68k: Switch to asm-generic/hardirq.h)
Merging m68knommu/for-next (11a48a5a18c6 Linux 5.6-rc2)
Merging microblaze/next (6aa71ef9bcf9 microblaze: Add ID for Microblaze v11)
Merging mips/mips-next (91f40e896444 mips/jazz: Update jazz_defconfig for M=
IPS Magnum)
Merging nds32/next (a7f96fce201c MAINTAINERS: add nds32 maintainer)
Merging nios2/for-next (051d75d3bb31 MAINTAINERS: Update Ley Foon Tan's ema=
il address)
Merging openrisc/for-next (fc74d7166005 openrisc: use mmgrab)
Merging parisc-hd/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging powerpc/next (71c3a888cbca Merge tag 'powerpc-5.6-1' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (6e62bd36e9ad soc: fsl: qe: remove set but not used va=
riable 'mm_gc')
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
Merging btrfs/for-next (455808a18dbf Merge branch 'for-next-next-v5.6-20200=
211' into for-next-20200211)
Applying: btrfs: fix for btrfs_pin_extent() API change
Merging ceph/master (3b20bc2fe4c0 ceph: noacl mount option is effectively i=
gnored)
Merging cifs/for-next (349ced52961c cifs: plumb smb2 POSIX dir enumeration)
Merging configfs/for-next (e2f238f7d5a1 configfs: calculate the depth of pa=
rent item)
Merging ecryptfs/next (2c2a7552dd64 ecryptfs: replace BUG_ON with error han=
dling code)
Merging erofs/dev (bb6d3fb354c5 Linux 5.6-rc1)
Merging ext3/for_next (daf1cd925487 Pull macro cleanup patches.)
Merging ext4/dev (c96dceeabf76 jbd2: do not clear the BH_Mapped flag when f=
orgetting a metadata buffer)
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
Merging pci/next (bb6d3fb354c5 Linux 5.6-rc1)
Merging pstore/for-next/pstore (e163fdb3f7f8 pstore/ram: Regularize prz lab=
el allocation lifetime)
Merging hid/for-next (530c6c3b37e2 Merge branch 'for-5.6/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging i3c/i3c/next (de8964995c79 i3c: master: no need to iterate master d=
evice twice)
Merging dmi/master (6eaaa9e89719 firmware/dmi: Report DMI Bios & EC firmwar=
e release)
Merging hwmon-staging/hwmon-next (a9a99b1b786b hwmon: (pmbus/tps53679) Add =
documentation)
Merging jc_docs/docs-next (e2c79ab7d75b tools/edid: Move EDID data sets fro=
m Documentation/)
Merging v4l-dvb/master (bb6d3fb354c5 Linux 5.6-rc1)
Merging v4l-dvb-next/master (d45331b00ddb Linux 5.3-rc4)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (00b838d60ec4 Merge branch 'pm-qos' into linux-next)
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
Merging net-next/master (7d51a01599d5 net: mvneta: align xdp stats naming s=
cheme to mlx5 driver)
Merging bpf-next/master (2f14b2d9dd80 Merge branch 'bpf-skmsg-simplify-rest=
ore')
Merging ipsec-next/master (92df9f8a745e Merge branch 'mvneta-xdp-ethtool-st=
ats')
Merging mlx5-next/mlx5-next (339ffae598ed net/mlx5e: Replace zero-length ar=
ray with flexible-array member)
Merging netfilter-next/master (7d51a01599d5 net: mvneta: align xdp stats na=
ming scheme to mlx5 driver)
Merging nfc-next/master (1f008cfec5d5 NFC: fdp: Fix unused variable warning=
s)
CONFLICT (content): Merge conflict in drivers/nfc/st21nfca/se.c
Merging ipvs-next/master (d54725cd11a5 netfilter: nf_tables: support for mu=
ltiple devices per netdev hook)
Merging wireless-drivers-next/master (932183aa35c6 mwifiex: change license =
text from MARVELL to NXP)
Merging bluetooth/master (a2a8b0b4adea Bluetooth: Fix crash when using new =
BT_PHY option)
Merging mac80211-next/master (92df9f8a745e Merge branch 'mvneta-xdp-ethtool=
-stats')
Merging gfs2/for-next (6e5e41e2dc4e gfs2: fix O_SYNC write handling)
Merging mtd/mtd/next (4575243c5c17 Merge tag 'nand/for-5.6' into mtd/next)
Merging nand/nand/next (d85339d9ea26 mtd: onenand: Rename omap2 driver to a=
void a build warning)
Merging spi-nor/spi-nor/next (df5c21002cf4 mtd: spi-nor: use spi-mem dirmap=
 API)
Merging crypto/master (7f19380b2cfd crypto: qce - handle AES-XTS cases that=
 qce fails)
Merging drm/drm-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging amdgpu/drm-next (4bbb6b045d8c drm/amdgpu: add sysfs interface to se=
t arbitrary sclk value for navi14)
Merging drm-intel/for-linux-next (c014e07616c5 drm/i915/gt: Do not attempt =
to reprogram IA/ring frequencies for dgfx)
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
Merging sound-asoc/for-next (4b8e7a15a0f5 Merge branch 'asoc-5.7' into asoc=
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
Merging mmc/next (51425149b872 mmc: mmci: Add support for sdmmc variant rev=
ision 2.0)
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (5312f321a67c mfd: syscon: Fix syscon_regmap_looku=
p_by_phandle_args() dummy)
Merging backlight/for-backlight-next (7af43a76695d backlight: qcom-wled: Fi=
x unsigned comparison to zero)
Merging battery/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging regulator/for-next (5932ad6367d1 Merge branch 'regulator-5.7' into =
regulator-next)
Merging security/next-testing (10c2d111c906 security: remove EARLY_LSM_COUN=
T which never used)
Merging apparmor/apparmor-next (01df52d726b5 apparmor: remove duplicate che=
ck of xattrs on profile attachment.)
Merging integrity/next-integrity (5780b9abd530 ima: add sm3 algorithm to ha=
sh algorithm configuration list)
Merging keys/keys-next (bda7978b1956 Merge branch 'keys-acl' into keys-next)
CONFLICT (content): Merge conflict in fs/pipe.c
Merging selinux/next (253050f57c7a selinux: factor out loop body from filen=
ame_trans_read())
CONFLICT (content): Merge conflict in security/selinux/ss/services.c
CONFLICT (content): Merge conflict in security/selinux/include/security.h
CONFLICT (content): Merge conflict in security/selinux/hooks.c
Merging smack/for-next (92604e825304 smack: use GFP_NOFS while holding inod=
e_smack::smk_lock)
Merging tomoyo/master (bb6d3fb354c5 Linux 5.6-rc1)
Merging tpmdd/next (dc10e4181c05 tpm: Initialize crypto_id of allocated_ban=
ks to HASH_ALGO__LAST)
Merging watchdog/master (44144c809e39 watchdog: da9062: Add dependency on I=
2C)
Merging iommu/next (e3b5ee0cfb65 Merge branches 'iommu/fixes', 'arm/smmu', =
'x86/amd', 'x86/vt-d' and 'core' into next)
Merging vfio/next (7b5372ba04ca vfio: platform: fix __iomem in vfio_platfor=
m_amdxgbe.c)
Merging audit/next (70b3eeed49e8 audit: CONFIG_CHANGE don't log internal bo=
okkeeping as an event)
Merging devicetree/for-next (90aeca875f8a dt-bindings: display: Convert etn=
aviv to json-schema)
CONFLICT (modify/delete): Documentation/devicetree/bindings/display/etnaviv=
/etnaviv-drm.txt deleted in devicetree/for-next and modified in HEAD. Versi=
on HEAD of Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.tx=
t left in tree.
$ git rm -f Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.t=
xt
Merging mailbox/mailbox-for-next (c6c6bc6ea9fc mailbox: imx: add support fo=
r imx v1 mu)
Merging spi/for-next (9ae4c9e758e6 Merge branch 'spi-5.7' into spi-next)
Merging tip/auto-latest (fc822da1328e Merge branch 'core/objtool')
Merging clockevents/timers/drivers/next (e4c3b4213b79 clocksource/hyperv: S=
et TSC clocksource as default w/ InvariantTSC)
Merging edac/edac-for-next (c7f7b1c8feca Merge branch 'edac-drivers' into e=
dac-for-next)
Merging irqchip/irq/irqchip-next (5186a6cc3ef5 irqchip/gic-v3-its: Rename V=
PENDBASER/VPROPBASER accessors)
Merging ftrace/for-next (7276531d4036 tracing: Consolidate trace() function=
s)
Merging rcu/rcu/next (0f5c914ad6d2 rcutorture: Mark data-race potential for=
 rcu_barrier() test statistics)
Merging kvm/linux-next (ead68df94d24 KVM: x86: enable -Werror)
Merging kvm-arm/next (b3f15ec3d809 kvm: arm/arm64: Fold VHE entry/exit work=
 into kvm_vcpu_run_vhe())
Merging kvm-ppc/kvm-ppc-next (fd24a8624eb2 KVM: PPC: Book3S PR: Fix -Werror=
=3Dreturn-type build failure)
Merging kvms390/next (b35e8878e1d3 KVM: s390/interrupt: do not pin adapter =
interrupt pages)
Merging xen-tip/linux-next (8557bbe5156e xen/blkback: Consistently insert o=
ne empty line between functions)
Merging percpu/for-next (9391e7a9a1e2 Merge branch 'for-5.6' into for-next)
Merging workqueues/for-next (1cd27003497a workqueue: don't use wq_select_un=
bound_cpu() for bound works)
Merging drivers-x86/for-next (7adb1e8aeeb5 platform/x86: intel_pmc_core: Ad=
d debugfs support to access live status registers)
Merging chrome-platform/for-next (42cd0ab476e2 platform/chrome: cros_ec: Qu=
ery EC protocol version if EC transitions between RO/RW)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (11a48a5a18c6 Linux 5.6-rc2)
Merging ipmi/for-next (7342db125413 drivers: char: ipmi: ipmi_msghandler: P=
ass lockdep expression to RCU lists)
Merging driver-core/driver-core-next (99c73ce158a4 drivers base/arch_topolo=
gy: Reformat topology_get_[cpu/freq]_scale() function name)
Merging usb/usb-next (57a5e5f936be usb: ucsi: ccg: disable runtime pm durin=
g fw flashing)
Merging usb-gadget/next (bb6d3fb354c5 Linux 5.6-rc1)
Merging usb-serial/usb-next (2c0bee081315 USB: serial: digi_acceleport: rem=
ove redundant assignment to pointer priv)
Merging usb-chipidea-next/ci-for-usb-next (220fd9c3bf5b usb: chipidea: udc:=
 using structure ci_hdrc device for runtime PM)
Merging phy-next/next (a5c86c557fe9 phy: mapphone-mdm6600: Fix write timeou=
ts with shorter GPIO toggle interval)
Merging tty/tty-next (143c02c88d6d serial: core: Switch to use DEVICE_ATTR_=
RO())
Merging char-misc/char-misc-next (06e33595e96f misc: Use kzalloc() instead =
of kmalloc() with flag GFP_ZERO.)
Merging extcon/extcon-next (87ccafd3bd64 extcon: palmas: Hide error message=
s if gpio returns -EPROBE_DEFER)
Merging soundwire/next (eff346f24ba9 soundwire: intel: free all resources o=
n hw_free())
Merging thunderbolt/next (3084ea9ea889 thunderbolt: icm: Replace zero-lengt=
h array with flexible-array member)
Merging staging/staging-next (55b9b8f67d93 staging: fsl-dpaa2: ethsw: ethsw=
.c: Fix line over 80 characters)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging mux/for-next (f356d58c3a04 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging slave-dma/next (8faa77332fe0 dmaengine: sun4i: set the linear_mode =
properly)
Merging cgroup/for-next (9bd5910d7f3d selftests/cgroup: add tests for cloni=
ng into cgroups)
Merging scsi/for-next (145e5a8a5cbd scsi: lpfc: Copyright updates for 12.6.=
0.4 patches)
Merging scsi-mkp/for-next (b417107a659e scsi: advansys: Replace zero-length=
 array with flexible-array member)
Merging vhost/linux-next (370e2c82a4a5 vhost: use batched version by defaul=
t)
Merging rpmsg/for-next (5a87e60312a9 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (53803ecac78b Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (cb548e981da5 gpiolib: Rename 'event' to 'g=
e' to be consistent with other use)
Merging gpio-intel/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging pinctrl/for-next (c93214689f0c MAINTAINERS: Sort entries in databas=
e for PIN CONTROLLER)
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
Merging gnss/gnss-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging fsi/next (2c01397b71c5 fsi: aspeed: Fix OPB0 byte order register va=
lues)
CONFLICT (content): Merge conflict in drivers/fsi/Kconfig
Merging slimbus/for-next (526eaf5d08a2 slimbus: Use the correct style for S=
PDX License Identifier)
Merging nvmem/for-next (0f6fea00e52f nvmem: add a newline for readability)
Merging xarray/xarray (3a00e7c47c38 ida: remove abandoned macros)
Merging hyperv/hyperv-next (54e19d34011f hv_utils: Add the support of hiber=
nation)
Merging auxdisplay/auxdisplay (54ecb8f7028c Linux 5.4-rc1)
Merging kgdb/kgdb/for-next (fcf2736c82ca Revert "kdb: Get rid of confusing =
diag msg from "rd" if current task has no regs")
Merging pidfd/for-next (8d19f1c8e193 prctl: PR_{G,S}ET_IO_FLUSHER to suppor=
t controlling memory reclaim)
Merging devfreq/devfreq-next (46dbfe265841 PM / devfreq: Fix a typo in a co=
mment)
Merging hmm/hmm (bb6d3fb354c5 Linux 5.6-rc1)
Merging fpga/for-next (28910cee898c fpga: xilinx-pr-decoupler: Remove clk_g=
et error message for probe defer)
Merging kunit/test (bb6d3fb354c5 Linux 5.6-rc1)
Merging cel/cel-next (a99d8080aaf3 Linux 5.4-rc6)
Merging kasan-bitops/topic/kasan-bitops (4f4afc2c9599 docs/core-api: Remove=
 possibly confusing sub-headings from Bit Operations)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging kunit-next/kunit (be886ba90cce kunit: run kunit_tool from any direc=
tory)
Merging akpm-current/current (5b957e5ca736 init/Kconfig: clean up ANON_INOD=
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
Applying: drivers/tty/serial/sh-sci.c: suppress warning
Applying: drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer ove=
rflow
Merging akpm/master (cc9208e01c3d drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/KaROle9uF.8MAE8VddEqV_P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5OAIgACgkQAVBC80lX
0GyhcggApdJtThTkQizcYnG/UeVarKzg8EmZ50eQl/xZgcaYRaOeJ5/MjyroOgln
44q230PCGCiGzLOHUL6fvvg0+FWmCtGrZkp7KTrKAm02QYx5JgFVmAmaY5HihpzL
OxX3gssZYIE2ZS676Q4T2jRNHPMkFcFO0r20i/ITPxJ+fl92PRx+9nvSyOBZrWFi
HzY4eslj9BOZVmbNafgCdz5KhV0xkyMiDNNVs9rzuFYHA1wyP0/t2JAXx/xGg7F+
ktVNN6KQPDhKvvEdcpqTNJBOQZ0VjyI/V97Pe4XpE1PYLCR4Y7UB7jabtZWHxoPv
Zwx9GxnoiGbTNZm/RzOKxnToYiEsiA==
=Vv6c
-----END PGP SIGNATURE-----

--Sig_/KaROle9uF.8MAE8VddEqV_P--
