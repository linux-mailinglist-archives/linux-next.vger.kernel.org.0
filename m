Return-Path: <linux-next+bounces-9329-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A8330CA293C
	for <lists+linux-next@lfdr.de>; Thu, 04 Dec 2025 07:54:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0782F301500D
	for <lists+linux-next@lfdr.de>; Thu,  4 Dec 2025 06:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7FF0307AF7;
	Thu,  4 Dec 2025 06:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KJplWQ5J"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1A6305953;
	Thu,  4 Dec 2025 06:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764831272; cv=none; b=cGZYzfckhRP1X3XykyxM/LXAPc5yPMlv1QVp86guQZlM/70ALWXx9FaGGiTB4kqUyFXLCs38hypXh6KjfAy2kbz6woU7dvsOrbZCxRY+Mh0Ld+JJlFcOVw6SZFUWLC7ajL5El0pdj6ZB1PvjJ+1YVLvvRQNI44m1wvqvo3BCCUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764831272; c=relaxed/simple;
	bh=OKVIOefrCKZpGTX5EVpszHKZD9Uvovip3IHQzqz9Yas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Jx82fdVtzz5CQBceiRfIDcQP1Q3shPAWOzChnfgcRkWBCxniiNf/DTnfdNSD5sMtMK8ODTxjfr8nuCxQs8LwdPhqNv6ojhR1geyRBYZgggSrMcJCgb6xJJE/TntKck3f0Ry2sJmcvexz2+xs4TF1F0bE87M4QQksBWjiTqApEt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KJplWQ5J; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764831263;
	bh=sCTgsbgNI9TYDcq1pHWW0NGBREAFxbIxEaDyfodFBNs=;
	h=Date:From:To:Cc:Subject:From;
	b=KJplWQ5JSiUI5aY7MIhRnsAFjWoLcwnnvyYeL0GvcOBgcaifV38cTX2LjFYicbMdo
	 3ItKuvi1nir/xL5mVfuIMWoZnFomp8o1rtnb7lEzC+9y45aEI4Sc2VVPhmv4asKxsa
	 r3OdM1XvzNln4bwx+xAVkskU7qj6MXXIX8+MsScrXrGq8WMGE7bn/cH4ca7FpmloiF
	 iyMCcpnhuXI7Wx/se3wawm/T162B2ahKrZvw/WEguYq5TsMiyHweJjCEZaOr1NPAMD
	 pIncehglVCBuXnksTaZbPW4m/QtfMuFTA5q5XHuLD5Fcza4XtCoqO7yO4E4paVEMwA
	 UekFwkLnTK3NA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dMQGk6wd7z4w2R;
	Thu, 04 Dec 2025 17:54:22 +1100 (AEDT)
Date: Thu, 4 Dec 2025 17:54:22 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Dec 4
Message-ID: <20251204175422.367b7da6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ujsw7Wmso1gjD6rRr0klPWQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Ujsw7Wmso1gjD6rRr0klPWQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The merge window is open, so please to not add any v6.20 (v7.0?) material
to your linux-next included branches until after the merge window closes.

Changes since 20251203:

The uml tree gained a conflict against the tip-fixes tree.

The drm tree gained a conflict against Linus' tree. And a build failure
due to a bad merge between duplicate patches for which I applied a merge
fix patch.

The pinctrl tree gained a conflict against Linus' tree.

Non-merge commits (relative to Linus' tree): 10699
 10836 files changed, 562111 insertions(+), 163349 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There is also the merge.log file in the Next
directory.  Between each merge, the tree was built with a ppc64_defconfig
for powerpc, an allmodconfig for x86_64, a multi_v7_defconfig for arm
and a native build of tools/perf. After the final fixups (if any), I do
an x86_64 modules_install followed by builds for x86_64 allnoconfig,
powerpc allnoconfig (32 and 64 bit), ppc44x_defconfig, allyesconfig
and pseries_le_defconfig and i386, arm64, s390, sparc and sparc64
defconfig and htmldocs. And finally, a simple boot test of the powerpc
pseries_le_defconfig kernel in qemu (with and without kvm enabled).

Below is a summary of the state of the merge.

I am currently merging 408 trees (counting Linus' and 122 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--=20
Cheers,
Stephen Rothwell

$ git checkout master
$ git reset --hard stable
Merging origin/master (a619fe35ab41 Merge tag 'v6.19-p1' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging ext4-fixes/fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging vfs-brauner-fixes/vfs.fixes (d27c71257825 afs: Fix delayed allocati=
on of a cell's anonymous key)
Merging fscrypt-current/for-current (1e39da974ce6 fscrypt: fix left shift u=
nderflow when inode->i_blkbits > PAGE_SHIFT)
Merging fsverity-current/for-current (211ddde0823f Linux 6.18-rc2)
Merging btrfs-fixes/next-fixes (62f1c85f62b3 Merge branch 'misc-6.18' into =
next-fixes)
Merging vfs-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging erofs-fixes/fixes (f2a12cc3b97f erofs: avoid infinite loop due to i=
ncomplete zstd-compressed data)
Merging nfsd-fixes/nfsd-fixes (324be6dcbf09 Revert "SUNRPC: Make RPCSEC_GSS=
_KRB5 select CRYPTO instead of depending on it")
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (e8bd877fb76b ovl: fix possible double un=
link)
Merging fscrypt/for-next (211ddde0823f Linux 6.18-rc2)
Merging btrfs/for-next (42ea4b8c679c Merge branch 'for-next-current-v6.17-2=
0251125' into for-next-20251125)
CONFLICT (content): Merge conflict in fs/btrfs/ctree.c
CONFLICT (content): Merge conflict in fs/btrfs/file.c
Merging ceph/master (7fce830ecd0a libceph: prevent potential out-of-bounds =
writes in handle_auth_session_key())
Merging cifs/for-next (7d0a66e4bb90 Linux 6.18)
Merging configfs/configfs-next (f7f78098690d configfs: Constify ct_item_ops=
 in struct config_item_type)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (8e4021078863 dlm: check for undefined release_option valu=
es)
Merging erofs/dev (0bdbf89a8bbe erofs: switch on-disk header `erofs_fs.h` t=
o MIT license)
Merging exfat/dev (51fc7b4ce10c exfat: fix remount failure in different pro=
cess environments)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (25554ea0b42b Pull udf extent block verification.)
Merging ext4/dev (6fb67ac89690 ext4: drop the TODO comment in ext4_es_inser=
t_extent())
Merging f2fs/dev (807e755c468a f2fs: ignore discard return value)
Merging fsverity/for-next (211ddde0823f Linux 6.18-rc2)
Merging fuse/for-next (8da059f2a497 fuse: Uninitialized variable in fuse_ep=
och_work())
Merging gfs2/for-next (8a157e0a0aa5 gfs2: Fix use of bio_chain)
Merging jfs/jfs-next (cafc6679824a jfs: replace hardcoded magic number with=
 DTPAGEMAXSLOT constant)
Merging ksmbd/ksmbd-for-next (664a0f98b3c4 smb: server: defer the initial r=
ecv completion logic to smb_direct_negotiate_recv_work())
Merging nfs/linux-next (b6d2a520f463 NFS: Add a module option to disable di=
rectory delegations)
Merging nfs-anna/linux-next (b623390045a8 NFS: Fix LTP test failures when t=
imestamps are delegated)
Merging nfsd/nfsd-next (df8c841dd92a NFSD: nfsd-io-modes: Separate lists)
CONFLICT (content): Merge conflict in fs/nfsd/nfs4recover.c
Merging ntfs3/master (1b2ae190ea43 fs/ntfs3: check for shutdown in fsync)
Merging orangefs/for-next (11f6bce77e27 fs/orangefs: Replace kzalloc + copy=
_from_user with memdup_user_nul)
Merging overlayfs/overlayfs-next (ad1423922781 ovl: make sure that ovl_crea=
te_real() returns a hashed dentry)
Merging ubifs/next (0695aef23d67 ubifs: vmalloc(array_size()) -> vmalloc_ar=
ray())
Merging v9fs/9p-next (f7deec3ebe2c 9p: fix new mount API cache option handl=
ing)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (79c47bc68efb Merge branch 'xfs-6.19-merge' into for-n=
ext)
Merging zonefs/for-next (a42938e80357 zonefs: correct some spelling mistake=
s)
Merging vfs-brauner/vfs.all (0071121b8635 Merge branch 'vfs.fixes' into vfs=
.all)
Merging vfs/for-next (eb028c33451a d_make_discardable(): warn if given a no=
n-persistent dentry)
CONFLICT (content): Merge conflict in Documentation/filesystems/porting.rst
CONFLICT (content): Merge conflict in fs/dcache.c
CONFLICT (content): Merge conflict in fs/debugfs/inode.c
CONFLICT (content): Merge conflict in security/apparmor/apparmorfs.c
Merging mm-hotfixes/mm-hotfixes-unstable (210f6c351217 mm/page_alloc: make =
percpu_pagelist_high_fraction reads lock-free)
Merging fs-current (2f0680ba626b Merge branch 'next-fixes' of https://git.k=
ernel.org/pub/scm/linux/kernel/git/kdave/linux.git)
Merging kbuild-current/kbuild-fixes (4ab2ee307983 kbuild: install-extmod-bu=
ild: Properly fix CC expansion when ccache is used)
Merging arc-current/for-curr (d7b8f8e20813 Linux 6.16-rc5)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (165eb13e485c arm64: proton-pack: Fix ha=
rd lockup when !MITIGATE_SPECTRE_BRANCH_HISTORY)
Merging arm-soc-fixes/arm/fixes (e9191383d28d Merge tag 'sunxi-fixes-for-6.=
18' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into arm=
/fixes)
Merging davinci-current/davinci/for-current (3a8660878839 Linux 6.18-rc1)
Merging drivers-memory-fixes/fixes (6f37469a9330 memory: tegra210: Fix inco=
rrect client ids)
Merging sophgo-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging sophgo-soc-fixes/soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging m68k-current/for-linus (aaf4e92341b0 m68k: defconfig: Update defcon=
figs for v6.18-rc1)
Merging powerpc-fixes/fixes (0843ba458439 powerpc/fadump: skip parameter ar=
ea allocation when fadump is disabled)
Merging s390-fixes/fixes (31475b88110c s390/mm: Fix __ptep_rdp() inline ass=
embly)
Merging net/main (108f9405ce81 selftests/tc-testing: Test CAKE scheduler wh=
en enqueue drops packets)
Merging bpf/master (30f09200cc4a Merge tag 'arm64-fixes' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/arm64/linux)
Merging ipsec/master (e5235eb6cfe0 net: netpoll: initialize work queue befo=
re error checks)
Merging netfilter/main (108f9405ce81 selftests/tc-testing: Test CAKE schedu=
ler when enqueue drops packets)
Merging ipvs/main (de0337d641bf net: ionic: map SKB after pseudo-header che=
cksum prep)
Merging wireless/for-next (0ff8eeafba5c Merge tag 'rtw-2025-11-20' of https=
://github.com/pkshih/rtw)
Merging ath/for-current (d0309c054362 Merge tag 'net-6.18-rc6' of git://git=
.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging iwlwifi/fixes (1a222625b468 wifi: iwlwifi: mld: always take beacon =
ies in link grading)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (ac3fd01e4c1e Linux 6.18-rc7)
Merging sound-current/for-linus (eaf526cfa4e5 ALSA: hda/realtek: Add PCI SS=
IDs to HP ProBook quirks)
Merging sound-asoc-fixes/for-linus (6efad7211987 Merge remote-tracking bran=
ch 'asoc/for-6.18' into asoc-linus)
Merging regmap-fixes/for-linus (6146a0f1dfae Linux 6.18-rc4)
Merging regulator-fixes/for-linus (47a5735ec707 Merge remote-tracking branc=
h 'regulator/for-6.18' into regulator-linus)
Merging spi-fixes/for-linus (cebdea5fc606 Merge remote-tracking branch 'spi=
/for-6.18' into spi-linus)
Merging pci-current/for-linus (3a8660878839 Linux 6.18-rc1)
Merging driver-core.current/driver-core-linus (dcb6fa37fd7b Linux 6.18-rc3)
Merging tty.current/tty-linus (7d0a66e4bb90 Linux 6.18)
Merging usb.current/usb-linus (7d0a66e4bb90 Linux 6.18)
Merging usb-serial-fixes/usb-linus (523bf0a59e67 USB: serial: option: add s=
upport for Rolling RW101R-GL)
Merging phy/fixes (3a8660878839 Linux 6.18-rc1)
Merging staging.current/staging-linus (dcb6fa37fd7b Linux 6.18-rc3)
Merging iio-fixes/fixes-togreg (74f97a468356 iio: adc: at91-sama5d2_adc: Fi=
x potential use-after-free in sama5d2_adc driver)
Merging counter-current/counter-current (109ff654934a counter: microchip-tc=
b-capture: Allow shared IRQ for multi-channel TCBs)
Merging char-misc.current/char-misc-linus (7d0a66e4bb90 Linux 6.18)
Merging soundwire-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging thunderbolt-fixes/fixes (7d0a66e4bb90 Linux 6.18)
Merging input-current/for-linus (ae8966b7b5bd Input: rename INPUT_PROP_HAPT=
IC_TOUCHPAD to INPUT_PROP_PRESSUREPAD)
Merging crypto-current/master (48bc9da3c97c crypto: zstd - fix double-free =
in per-CPU stream cleanup)
Merging libcrypto-fixes/libcrypto-fixes (3f9f0252130e Merge tag 'random-6.1=
9-rc1-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/crng/rand=
om)
Merging vfio-fixes/for-linus (d323ad739666 vfio: selftests: replace iova=3D=
vaddr with allocated iovas)
Merging kselftest-fixes/fixes (dd4adb986a86 selftests/tracing: Run sample e=
vents to clear page cache events)
Merging dmaengine-fixes/fixes (f52c6c5eb159 dmaengine: ti: k3-udma: fix dev=
ice leak on udma lookup)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (97315e7c901a mtd: onenand: Pass correct pointe=
r to IRQ handler)
Merging mfd-fixes/for-mfd-fixes (3a8660878839 Linux 6.18-rc1)
Merging v4l-dvb-fixes/fixes (27afd6e066cf media: videobuf2: forbid remove_b=
ufs when legacy fileio is active)
Merging reset-fixes/reset/fixes (997c06330fd5 reset: imx8mp-audiomix: Fix b=
ad mask values)
Merging mips-fixes/mips-fixes (7d0a66e4bb90 Linux 6.18)
Merging at91-fixes/at91-fixes (3a8660878839 Linux 6.18-rc1)
Merging omap-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging kvm-fixes/master (32bd348be3fa KVM: Fix last_boosted_vcpu index ass=
ignment bug)
Merging kvms390-fixes/master (5f9df945d4e8 KVM: s390: Fix FOLL_*/FAULT_FLAG=
_* confusion)
Merging hwmon-fixes/hwmon (6a23ae0a96a6 Linux 6.18-rc6)
Merging nvdimm-fixes/libnvdimm-fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging cxl-fixes/fixes (214291cbaace acpi/hmat: Fix lockdep warning for hm=
em_register_resource())
Merging dma-mapping-fixes/dma-mapping-fixes (d0d08f4bd7f6 dma-direct: Fix m=
issing sg_dma_len assignment in P2PDMA bus mappings)
Merging drivers-x86-fixes/fixes (9b9c0adbc3f8 platform/x86: intel: punit_ip=
c: fix memory corruption)
Merging samsung-krzk-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging pinctrl-samsung-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging devicetree-fixes/dt/linus (7209ff310083 of/irq: Export of_msi_xlate=
() for module usage)
Merging dt-krzk-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging scsi-fixes/fixes (90449f2d1e1f scsi: sg: Do not sleep in atomic con=
text)
Merging drm-fixes/drm-fixes (7d0a66e4bb90 Linux 6.18)
Merging drm-intel-fixes/for-linux-next-fixes (7d0a66e4bb90 Linux 6.18)
Merging mmc-fixes/fixes (747528729c9b mmc: sdhci-of-dwcmshc: Promote the th=
1520 reset handling to ip level)
Merging rtc-fixes/rtc-fixes (162f24cbb0f6 rtc: rx8025: fix incorrect regist=
er reference)
Merging gnss-fixes/gnss-linus (dcb6fa37fd7b Linux 6.18-rc3)
Merging hyperv-fixes/hyperv-fixes (3a8660878839 Linux 6.18-rc1)
Merging risc-v-fixes/fixes (e2285bd4a467 riscv: fix KUnit test_kprobes cras=
h when building with Clang)
Merging riscv-dt-fixes/riscv-dt-fixes (5ef13c363640 riscv: dts: microchip: =
remove BeagleV Fire fabric.dtsi)
Merging riscv-soc-fixes/riscv-soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging spdx/spdx-linus (89373f5695dc LICENSES: Add modern form of the LGPL=
-2.1 tags to the usage guide section)
Merging gpio-brgl-fixes/gpio/for-current (7d80e248e8fc gpio: mmio: fix bad =
guard conversion)
Merging gpio-intel-fixes/fixes (6a23ae0a96a6 Linux 6.18-rc6)
Merging pinctrl-intel-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging auxdisplay-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging kunit-fixes/kunit-fixes (f3903ec76ae6 MAINTAINERS: Update KUnit ema=
il address for Rae Moar)
Merging memblock-fixes/fixes (c42af83c59b6 memblock: fix memblock_estimated=
_nr_free_pages() for soft-reserved memory)
Merging renesas-fixes/fixes (379c590113ce ARM: shmobile: smp: Enforce shmob=
ile_smp_* alignment)
Merging perf-current/perf-tools (6cf62f0174de Merge tag 'char-misc-6.18-rc8=
' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc)
Merging efi-fixes/urgent (e5f0a698b34e Linux 6.17)
Merging battery-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging iommufd-fixes/for-rc (b07bf253ef8e iommufd/iommufd_private.h: Avoid=
 -Wflex-array-member-not-at-end warning)
Merging rust-fixes/rust-fixes (ac3fd01e4c1e Linux 6.18-rc7)
Merging w1-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging pmdomain-fixes/fixes (c98c99d5dbdf pmdomain: tegra: Add GENPD_FLAG_=
NO_STAY_ON flag)
Merging i2c-host-fixes/i2c/i2c-host-fixes (7d0a66e4bb90 Linux 6.18)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (3c493b524ffd Merge tag 'sunxi-clk-fixes-for-6.=
18' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into clk=
-fixes)
Merging thead-clk-fixes/thead-clk-fixes (3a8660878839 Linux 6.18-rc1)
Merging pwrseq-fixes/pwrseq/for-current (3a8660878839 Linux 6.18-rc1)
Merging thead-dt-fixes/thead-dt-fixes (3a8660878839 Linux 6.18-rc1)
Merging ftrace-fixes/ftrace/fixes (1650a1b6cb1a fgraph: Check ftrace_pids_e=
nabled on registration for early filtering)
Merging ring-buffer-fixes/ring-buffer/fixes (b042fdf18e89 tracing: Fix WARN=
_ON in tracing_buffers_mmap_close for split VMAs)
Merging trace-fixes/trace/fixes (53afec2c8fb2 tracing/tools: Fix incorrcet =
short option in usage text for --threads)
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging tip-fixes/tip/urgent (de7d04e56580 Merge branch into tip/master: 'x=
86/urgent')
Merging slab-fixes/slab/for-next-fixes (f9ff623bca1d mm/slab: introduce kvf=
ree_rcu_barrier_on_cache() for cache destruction)
Merging drm-msm-fixes/msm-fixes (f5d079564c44 drm/msm/dpu: Fix adjusted mod=
e clock check for 3d merge)
Merging uml-fixes/fixes (df447a3b4a4b um: Fix FD copy size in os_rcv_fd_msg=
())
Merging fwctl-fixes/for-rc (211ddde0823f Linux 6.18-rc2)
Merging devsec-tsm-fixes/fixes (fba4ceaa242d configfs-tsm-report: Fix NULL =
dereference of tsm_ops)
Merging drm-rust-fixes/drm-rust-fixes (211ddde0823f Linux 6.18-rc2)
Merging tenstorrent-dt-fixes/tenstorrent-dt-fixes (3a8660878839 Linux 6.18-=
rc1)
Merging drm-misc-fixes/for-linux-next-fixes (eb76d0f55535 drm, fbcon, vga_s=
witcheroo: Avoid race condition in fbcon setup)
Merging mm-stable/mm-stable (faf3c923523e mm: fix vma_start_write_killable(=
) signal handling)
CONFLICT (content): Merge conflict in arch/arm64/mm/mmu.c
CONFLICT (content): Merge conflict in include/linux/memory.h
CONFLICT (content): Merge conflict in mm/memory.c
CONFLICT (content): Merge conflict in mm/secretmem.c
Merging mm-nonmm-stable/mm-nonmm-stable (aa514a297a0c calibrate: update hea=
der inclusion)
Merging mm-unstable/mm-unstable (2a5568dd60c8 mm/hugetlb: fix incorrect err=
or return from hugetlb_reserve_pages())
Merging mm-nonmm-unstable/mm-nonmm-unstable (4ebf17371a33 liveupdate: luo_c=
ore: fix redundant bound check in luo_ioctl())
Merging kbuild/kbuild-next (2a9c8c0b59d3 kbuild: add target to build a cpio=
 containing modules)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (34e271ae5538 perf test: Add kallsyms split te=
st)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (131971f67e25 dma-mapping: remove =
unused map_page callback)
Merging asm-generic/master (edcc8a38b5ac once: fix race by moving DO_ONCE t=
o separate section)
Merging alpha/alpha-next (d58041d2c63e MAINTAINERS: Add Magnus Lindholm as =
maintainer for alpha port)
Merging arm/for-next (fedadc413723 ARM: 9461/1: Disable HIGHPTE on PREEMPT_=
RT kernels)
Merging arm64/for-next/core (edde060637b9 Merge branch 'for-next/set_memory=
' into for-next/core)
Merging arm-perf/for-next/perf (e6a27290d800 perf: arm_spe: Add support for=
 filtering on data source)
Merging arm-soc/for-next (e5b2299997d3 soc: document merges)
Merging amlogic/for-next (3b2ecf0c3cc3 Merge branch 'v6.19/drivers' into fo=
r-next)
Merging asahi-soc/asahi-soc/for-next (5d21b7ca05c8 Merge branch 'apple-soc/=
drivers-6.19' into asahi-soc/for-next)
Merging at91/at91-next (fde90d654751 Merge branch 'at91-dt' into at91-next)
Merging bmc/for-next (019a68ab5e29 Merge branch 'aspeed/arm/dt' into for-ne=
xt)
Merging broadcom/next (37c3a91e9730 arm64: dts: broadcom: bcm2712: Add watc=
hdog DT node)
Merging cix/for-next (4889f68b824d Merge remote-tracking branch 'cix/dt' in=
to for-next)
Merging davinci/davinci/for-next (3a8660878839 Linux 6.18-rc1)
Merging drivers-memory/for-next (84ac371ee4b3 Merge branch 'mem-ctrl-next' =
into for-next)
Merging fsl/soc_fsl (ef980bda574d bus: fsl-mc: Convert to bus callbacks)
Merging imx-mxs/for-next (89d95dbad2a3 Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (67ed5843a67b Merge branch 'v6.18-next/dts64' int=
o for-next)
Merging mvebu/for-next (f0e6bc0c3ef4 clk: mvebu: cp110 add CLK_IGNORE_UNUSE=
D to pcie_x10, pcie_x11 & pcie_x4)
Merging omap/for-next (2c85858e7c68 Merge branch 'omap-for-v6.19/drivers' i=
nto tmp/omap-next-20251117.085514)
Merging qcom/for-next (c17e270dfb34 Merge branches 'arm32-for-6.19', 'arm64=
-defconfig-for-6.19', 'arm64-for-6.19', 'clk-for-6.19' and 'drivers-for-6.1=
9' into for-next)
Merging renesas/next (fbec5d4783d5 Merge branches 'renesas-drivers-for-v6.1=
9' and 'renesas-dts-for-v6.19' into renesas-next)
Merging reset/reset/next (a0d57f7504b6 reset: gpio: add the "compatible" pr=
operty)
Merging rockchip/for-next (8e0b927d5848 Merge branch 'v6.19-clk/next' into =
for-next)
Merging samsung-krzk/for-next (bca42080637c Merge branch 'next/drivers-late=
' into for-next)
Merging scmi/for-linux-next (e5db90f4c044 Merge branch 'for-next/ffa/update=
s' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux=
 into for-linux-next)
Merging sophgo/for-next (c7f013d4c8c0 Merge branch 'dt/riscv' into for-next)
Merging sophgo-soc/soc-for-next (c8754c7deab4 soc: sophgo: cv1800: rtcsys: =
New driver (handling RTC only))
Merging spacemit/for-next (5a97a38c2279 riscv: dts: spacemit: define all mi=
ssing I2C controller nodes)
Merging stm32/stm32-next (a6961e2ced51 arm64: dts: st: set RIFSC as an acce=
ss controller on stm32mp21x platforms)
Merging sunxi/sunxi/for-next (ef541cc2e208 Merge branch 'sunxi/fixes-for-6.=
18' into sunxi/for-next)
Merging tee/next (eb4bb32c8117 Merge branch 'qcomtee_fixes_for_6.18' into n=
ext)
Merging tegra/for-next (e016a50e00e6 Merge branch for-6.19/arm64/defconfig =
into for-next)
Merging tenstorrent-dt/tenstorrent-dt-for-next (a71e6e8eea8a riscv: defconf=
ig: Enable Tenstorrent SoCs)
Merging thead-dt/thead-dt-for-next (d8a174babf64 riscv: dts: thead: Add res=
et controllers of more subsystems for TH1520)
Merging ti/ti-next (34729c8b27fd Merge branch 'ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (a35dc981c5d8 Merge branch 'zynqmp/defconfig' into =
for-next)
Merging clk/clk-next (6f172175b6f3 Merge branches 'clk-visconti', 'clk-imx'=
, 'clk-microchip', 'clk-rockchip' and 'clk-qcom' into clk-next)
Merging clk-imx/for-next (fdc1dc7dd53b clk: imx: add driver for imx8ulp's s=
im lpav)
Merging clk-renesas/renesas-clk (5fb2f67341bd clk: renesas: r9a09g077: Add =
SPI module clocks)
Merging thead-clk/thead-clk-for-next (3a8660878839 Linux 6.18-rc1)
Merging csky/linux-next (817d21578d51 csky: Remove compile warning for CONF=
IG_SMP)
Merging loongarch/loongarch-next (f3e098dde874 Merge branch 'loongarch-kvm'=
 into loongarch-next)
Merging m68k/for-next (aaf4e92341b0 m68k: defconfig: Update defconfigs for =
v6.18-rc1)
Merging m68knommu/for-next (ac3fd01e4c1e Linux 6.18-rc7)
Merging microblaze/next (7f7072574127 Merge tag 'kbuild-6.18-1' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/kbuild/linux)
Merging mips/mips-next (2b6d718c8dbe MIPS: Fix whitespace damage in r4k_wai=
t from VS timer fix)
Merging openrisc/for-next (8c30b0018f9d openrisc: Add jump label support)
Merging parisc-hd/for-next (dca7da244349 parisc: Do not reprogram affinitiy=
 on ASP chip)
Merging powerpc/next (9b36c7fc5aa5 macintosh/via-pmu-backlight: Include <li=
nux/fb.h> and <linux/of.h>)
Merging risc-v/for-next (0f226cf6026f kselftest/riscv: add kselftest for us=
er mode cfi)
CONFLICT (content): Merge conflict in arch/riscv/include/asm/hwcap.h
CONFLICT (content): Merge conflict in include/linux/mm.h
Merging riscv-dt/riscv-dt-for-next (a4aad736716d riscv: dts: microchip: con=
vert clock and reset to use syscon)
Merging riscv-soc/riscv-soc-for-next (719362b8a972 Merge branch 'riscv-cach=
e-for-next' into riscv-soc-for-next)
Merging s390/for-next (2f44a03a8d80 Merge branch 'features' into for-next)
Merging sh/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging sparc/for-next (fe0126702a40 sparc: Replace deprecated strcpy() wit=
h strscpy() in handle_nextprop_quirks())
Merging uml/next (a3209bb94b36 um: Disable KASAN_INLINE when STATIC_LINK is=
 selected)
CONFLICT (modify/delete): arch/um/include/shared/common-offsets.h deleted i=
n uml/next and modified in HEAD.  Version HEAD of arch/um/include/shared/co=
mmon-offsets.h left in tree.
CONFLICT (modify/delete): arch/x86/um/shared/sysdep/kernel-offsets.h delete=
d in uml/next and modified in HEAD.  Version HEAD of arch/x86/um/shared/sys=
dep/kernel-offsets.h left in tree.
$ git rm -f arch/um/include/shared/common-offsets.h arch/x86/um/shared/sysd=
ep/kernel-offsets.h
Applying: fix up for "um: move asm-offsets generation into a single file"
Merging xtensa/xtensa-for-next (4c8bad3ed035 xtensa: use HZ_PER_MHZ in plat=
form_calibrate_ccount)
Merging fs-next (d3869ddccd68 Merge branch 'for-next' of https://git.kernel=
.org/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (322530a9c2ab Merge branch 'rework/nbcon-in-kdb' in=
to for-next)
Merging pci/next (cd6b7c82b691 Merge branch 'pci/misc')
CONFLICT (content): Merge conflict in MAINTAINERS
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_vram.c
CONFLICT (content): Merge conflict in drivers/pci/controller/dwc/pcie-desig=
nware-host.c
Merging pstore/for-next/pstore (b69255357368 pstore/ram: Update module para=
meters from platform data)
Merging hid/for-next (1c772200c9dc Merge branch 'for-6.18/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (e9a6fb0bcdd7 Linux 6.18-rc5)
Merging i2c-host/i2c/i2c-host (362e391005a9 dt-bindings: i2c: qcom-cci: Doc=
ument SM8750 compatible)
Merging i3c/i3c/next (79c3ae7ada05 regmap: i3c: switch to use i3c_xfer from=
 i3c_priv_xfer)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (30ca0e049f50 hwmon: (dell-smm) Add Dell G=
5 5505 to fan control whitelist)
Merging jc_docs/docs-next (464257baf992 docs: makefile: move rustdoc check =
to the build wrapper)
Merging v4l-dvb/next (f7231cff1f3f media: uapi: c3-isp: Fix documentation w=
arning)
Merging v4l-dvb-next/master (adc218676eef Linux 6.12)
Merging pm/linux-next (619f4edc8d4f Merge tag 'thermal-6.19-rc1' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging cpufreq-arm/cpufreq/arm/linux-next (49505d17fe59 rust: cpufreq: add=
 __rust_helper to helpers)
Merging cpupower/cpupower (059835bbfa28 tools/power/cpupower: Support build=
ing libcpupower statically)
Merging devfreq/devfreq-next (d9600d57668c PM / devfreq: Fix typo in DFSO_D=
OWNDIFFERENTIAL macro name)
Merging pmdomain/next (1f67707fafa5 pmdomain: Merge branch fixes into next)
Merging opp/opp/linux-next (33ffb0aa8ce8 rust: opp: simplify callers of `to=
_c_str_array`)
Merging thermal/thermal/linux-next (c411d8bf0699 thermal/drivers/imx91: Add=
 support for i.MX91 thermal monitoring unit)
Merging rdma/for-next (80a85a771deb RDMA/rxe: reclassify sockets in order t=
o avoid false positives from lockdep)
Merging net-next/main (4de44542991e Merge git://git.kernel.org/pub/scm/linu=
x/kernel/git/netdev/net)
CONFLICT (content): Merge conflict in tools/testing/selftests/drivers/net/g=
ro.c
CONFLICT (content): Merge conflict in tools/testing/selftests/drivers/net/h=
w/toeplitz.c
Merging bpf-next/for-next (edc70c2b6b11 Merge branch 'bpf-next/master' into=
 for-next)
CONFLICT (content): Merge conflict in kernel/bpf/stackmap.c
Merging ipsec-next/master (0177f0f07886 Merge tag 'linux-can-next-for-6.19-=
20251129' of git://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-ne=
xt)
Merging mlx5-next/mlx5-next (5422318e27d7 net/mlx5: Expose definition for 1=
600Gbps link mode)
Merging netfilter-next/main (4de44542991e Merge git://git.kernel.org/pub/sc=
m/linux/kernel/git/netdev/net)
Merging ipvs-next/main (c9dfb92de073 Merge branch 'mlx5-next' of git://git.=
kernel.org/pub/scm/linux/kernel/git/mellanox/linux)
Merging bluetooth/master (4746e2cd0e18 Bluetooth: hci_qca: Fix SSR (SubSyst=
em Restart) fail when BT_EN is pulled up by hw)
Merging wireless-next/for-next (f9e788c5fd3a wifi: mac80211: allow sharing =
identical chanctx for S1G interfaces)
Merging ath-next/for-next (c99ebb613259 Merge git://git.kernel.org/pub/scm/=
linux/kernel/git/netdev/net)
Merging iwlwifi-next/next (85d002b2ac56 wifi: iwlwifi: mld: remove unused v=
ariable in d3.c)
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (801b0840b09d Merge tag 'nand/for-6.19' into mtd/next)
Merging nand/nand/next (f6dffe2a9ed1 mtd: spinand: add support for FudanMic=
ro FM25S01BI3)
Merging spi-nor/spi-nor/next (ed26bd40df11 mailmap: update Pratyush Yadav's=
 email address)
Merging crypto/master (48bc9da3c97c crypto: zstd - fix double-free in per-C=
PU stream cleanup)
Merging libcrypto/libcrypto-next (3f9f0252130e Merge tag 'random-6.19-rc1-f=
or-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/crng/random)
Merging drm/drm-next (0692602defb0 Merge tag 'amd-drm-next-6.19-2025-12-02'=
 of https://gitlab.freedesktop.org/agd5f/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_dev=
ice.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_fb_helper.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dm=
c.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_pci.c
Applying: fix up for dumpicate commit "drm/amd/display: Add an HPD filter f=
or HDMI"
Merging drm-exynos/for-linux-next (3a8660878839 Linux 6.18-rc1)
Merging drm-misc/for-linux-next (4cbae3748fc4 drm/gem-shmem: revert the 8-b=
yte alignment constraint)
Merging amdgpu/drm-next (3925683515e9 Revert "drm/amd: Skip power ungate du=
ring suspend for VPE")
Merging drm-intel/for-linux-next (611d4d160616 Merge tag 'mediatek-drm-next=
-20251120' of https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/=
linux into drm-next)
Merging drm-msm/msm-next (7bc29d5fb6fa dt-bindings: display/msm/gmu: Add Ad=
reno X2-85 GMU)
Merging drm-msm-lumag/msm-next-lumag (e2f085ab8636 dt-bindings: display: ms=
m: sm6150-mdss: Fix example indentation and OPP values)
Merging drm-rust/drm-rust-next (57dc2ea0b7bd rust: slice: fix broken intra-=
doc links)
Merging drm-nova/nova-next (93296e9d9528 gpu: nova-core: vbios: store refer=
ence to Device where relevant)
Merging drm-xe/drm-xe-next (54da99e5c3a7 drm/xe/xe3: Remove graphics IP 30.=
01 from Wa_18041344222 IP list)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/tests/xe_mocs.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_ct.c
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (93b22a4bf0b4 fbdev: i810: use appopriate log interf=
ace dev_info)
Merging regmap/for-next (d40e1d95246b Merge remote-tracking branch 'regmap/=
for-6.19' into regmap-next)
CONFLICT (content): Merge conflict in drivers/base/regmap/regmap-i3c.c
Merging sound/for-next (eaf526cfa4e5 ALSA: hda/realtek: Add PCI SSIDs to HP=
 ProBook quirks)
Merging ieee1394/for-next (036176d9dba7 firewire: core: abort pending trans=
actions at card removal)
Merging sound-asoc/for-next (6efad7211987 Merge remote-tracking branch 'aso=
c/for-6.18' into asoc-linus)
Merging modules/modules-next (1ddac5cd7f27 MAINTAINERS: Add myself as revie=
wer for module support)
Merging input/next (a311c777f298 dt-bindings: touchscreen: consolidate simp=
le touch controller to trivial-touch.yaml)
Merging block/for-next (9b3dc543e493 Merge branch 'for-6.19/block' into for=
-next)
Merging device-mapper/for-next (5ad837c6b9a5 dm raid: add documentation for=
 takeover/reshape raid1 -> raid5 table line examples)
Merging libata/for-next (2e9832713631 ata: libata-core: Quirk DELLBOSS VD m=
ax_sectors)
Merging pcmcia/pcmcia-next (4a81f78caa53 pcmcia: Add error handling for add=
_interval() in do_validate_mem())
Merging mmc/next (79cf71c0b177 mmc: sdhci-of-dwcmshc: reduce CIT for better=
 performance)
Merging mfd/for-mfd-next (44c603f35cad mfd: sec: Drop a stray semicolon)
Merging backlight/for-backlight-next (d3cc7cd7bc46 backlight: aw99706: Fix =
unused function warnings from suspend/resume ops)
Merging battery/for-next (8e8856396b54 Revert "power: supply: qcom_battmgr:=
 support disabling charge control")
CONFLICT (content): Merge conflict in drivers/power/supply/intel_dc_ti_batt=
ery.c
Merging regulator/for-next (47a5735ec707 Merge remote-tracking branch 'regu=
lator/for-6.18' into regulator-linus)
Merging security/next (9a948eefad59 lsm: use unrcu_pointer() for current->c=
red in security_init())
Merging apparmor/apparmor-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging integrity/next-integrity (738c9738e690 ima: Handle error code retur=
ned by ima_filter_rule_match())
Merging selinux/next (cdcf0b369d40 Automated merge of 'dev' into 'next')
Merging smack/next (29c701f90b93 Smack: function parameter 'gfp' not descri=
bed)
Merging tomoyo/master (cfe13736fb3c RDMA/core: add ib_gid_table_entry debug=
ging)
Merging tpmdd/next (09b71a58ee35 KEYS: trusted: Use tpm_ret_to_err() in tru=
sted_tpm2)
Merging watchdog/master (5bcc5786a0cf watchdog: starfive: Fix resource leak=
 in probe error path)
Merging iommu/next (0d081b16946e Merge branches 'arm/smmu/updates', 'arm/sm=
mu/bindings', 'mediatek', 'nvidia/tegra', 'intel/vt-d', 'amd/amd-vi' and 'c=
ore' into next)
Merging audit/next (c8a3dfe73159 audit: merge loops in __audit_inode_child(=
))
Merging devicetree/for-next (954c55c658e1 dt-bindings: kbuild: Skip validat=
ing empty examples)
Merging dt-krzk/for-next (3a8660878839 Linux 6.18-rc1)
Merging mailbox/for-next (3f39f5652037 mailbox: mtk-cmdq: Remove pm_runtime=
 APIs from cmdq_mbox_send_data())
Merging spi/for-next (cebdea5fc606 Merge remote-tracking branch 'spi/for-6.=
18' into spi-linus)
Merging tip/master (871b28902925 Merge branch into tip/master: 'x86/boot')
Merging clockevents/timers/drivers/next (d1780dce9575 clocksource/drivers: =
Add Realtek system timer driver)
Merging edac/edac-for-next (814b332921b6 Merge ras/edac-amd-atl into for-ne=
xt)
Merging ftrace/for-next (fe8f7bf0261d Merge unused-tracepoints/for-next)
CONFLICT (content): Merge conflict in Documentation/tools/rtla/common_optio=
ns.txt
CONFLICT (content): Merge conflict in kernel/trace/Kconfig
Merging rcu/next (9a08942f1701 Merge branch 'rcu/misc' into next)
Merging paulmck/non-rcu/next (7f8fcc6f09fb memory-barriers.txt: Sort wait_e=
vent* and wait_on_bit* list alphabetically)
Merging kvm/next (e0c26d47def7 Merge tag 'kvm-s390-next-6.19-1' of https://=
git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
CONFLICT (content): Merge conflict in arch/x86/include/asm/cpufeatures.h
CONFLICT (content): Merge conflict in arch/x86/kernel/cpu/bugs.c
Merging kvm-arm/next (3eef0c83c3f3 Merge branch 'kvm-arm64/nv-xnx-haf' into=
 kvmarm/next)
Merging kvms390/next (2bd1337a1295 KVM: s390: Use generic VIRT_XFER_TO_GUES=
T_WORK functions)
Merging kvm-ppc/topic/ppc-kvm (c17b750b3ad9 Linux 6.17-rc2)
Merging kvm-riscv/riscv_kvm_next (3239c52fd212 RISC-V: KVM: Flush VS-stage =
TLB after VCPU migration for Andes cores)
Merging kvm-x86/next (8ef01edf38b2 Merge branch 'vmx')
CONFLICT (content): Merge conflict in arch/x86/include/asm/cpufeatures.h
Merging xen-tip/linux-next (a73d4a055622 drivers/xen/xenbus: Replace deprec=
ated strcpy in xenbus_transaction_end)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (6d90215dc015 workqueue: Don't rely on wq->resc=
uer to stop rescuer)
Merging sched-ext/for-next (9c0a5e83ebe7 Merge branch 'for-6.19' into for-n=
ext)
CONFLICT (content): Merge conflict in kernel/sched/ext.c
Merging drivers-x86/for-next (c36f9d7b2869 fs/nls: Fix inconsistency betwee=
n utf8_to_utf32() and utf32_to_utf8())
Merging chrome-platform/for-next (52075d2c7595 platform/chrome: sensorhub: =
Support devices without FIFO_INT_ENABLE)
Merging chrome-platform-firmware/for-firmware-next (3a8660878839 Linux 6.18=
-rc1)
Merging hsi/for-next (3a8660878839 Linux 6.18-rc1)
Merging leds-lj/for-leds-next (072cd5f458d7 leds: rgb: leds-qcom-lpg: Don't=
 enable TRILED when configuring PWM)
Merging ipmi/for-next (35bcedc1a793 MAINTAINERS: Add entry on Loongson-2K I=
PMI driver)
Merging driver-core/driver-core-next (473b9f331718 rust: pci: fix build fai=
lure when CONFIG_PCI_MSI is disabled)
CONFLICT (content): Merge conflict in drivers/gpu/nova-core/driver.rs
CONFLICT (content): Merge conflict in rust/kernel/debugfs/traits.rs
CONFLICT (content): Merge conflict in samples/rust/rust_debugfs.rs
CONFLICT (content): Merge conflict in samples/rust/rust_debugfs_scoped.rs
Merging usb/usb-next (2585973c7f9e usb: gadget: tegra-xudc: Always reinitia=
lize data toggle when clear halt)
Merging thunderbolt/next (479d186fc946 thunderbolt: Fix typos in xdomain.c)
Merging usb-serial/usb-next (072f2c495725 USB: serial: option: move Telit 0=
x10c7 composition in the right place)
Merging tty/tty-next (75a9f4c54770 serial: sh-sci: Fix deadlock during RSCI=
 FIFO overrun error)
CONFLICT (content): Merge conflict in drivers/tty/serial/8250/8250_rsa.c
Merging char-misc/char-misc-next (82d12088c297 char: applicom: fix NULL poi=
nter dereference in ac_ioctl)
CONFLICT (content): Merge conflict in drivers/firmware/stratix10-svc.c
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (9e9182cab5eb coresight: etm4x: Remove the state_nee=
ds_restore flag)
Merging fastrpc/for-next (3a8660878839 Linux 6.18-rc1)
Merging fpga/for-next (c9243d6df0d6 fpga: altera-cvp: Use pci_find_vsec_cap=
ability() when probing FPGA device)
Merging icc/icc-next (60b52af082b1 Merge branch 'icc-sm6350' into icc-next)
Merging iio/togreg (f9e057916428 staging: iio: adt7316: replace sprintf() w=
ith sysfs_emit())
Merging phy-next/next (716311dad200 MAINTAINERS: phy: Add Neil Armstrong as=
 reviewers for phy subsystem)
Merging soundwire/next (96e539b24be5 soundwire: send multi sections in one =
BPT stream)
Merging extcon/extcon-next (b4338338aa3d extcon: usbc-tusb320: Make typec-p=
ower-opmode optional)
Merging gnss/gnss-next (f5ef3f722d76 dt-bindings: gnss: fix timepulse descr=
iption)
Merging vfio/next (d721f52e3155 vfio: selftests: Add vfio_pci_device_init_p=
erf_test)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gvt/kvmgt.c
CONFLICT (content): Merge conflict in kernel/dma/direct.c
CONFLICT (modify/delete): tools/testing/selftests/vfio/lib/include/vfio_uti=
l.h deleted in vfio/next and modified in HEAD.  Version HEAD of tools/testi=
ng/selftests/vfio/lib/include/vfio_util.h left in tree.
CONFLICT (content): Merge conflict in tools/testing/selftests/vfio/lib/vfio=
_pci_device.c
CONFLICT (content): Merge conflict in tools/testing/selftests/vfio/lib/vfio=
_pci_driver.c
CONFLICT (content): Merge conflict in tools/testing/selftests/vfio/vfio_iom=
mufd_setup_test.c
$ git rm -f tools/testing/selftests/vfio/lib/include/vfio_util.h
Applying: fix up for "vfio: selftests: Split libvfio.h into separate header=
 files"
Applying: fix up for "vfio/nvgrace-gpu: Add support for huge pfnmap"
Merging w1/for-next (a5d908e0ec05 w1: omap-hdq: Remove redundant pm_runtime=
_mark_last_busy() calls)
Merging spmi/spmi-next (0ff41df1cb26 Linux 6.15)
Merging staging/staging-next (502ddcc405b6 staging: rtl8723bs: fix out-of-b=
ounds read in OnBeacon ESR IE parsing)
CONFLICT (content): Merge conflict in drivers/platform/Kconfig
CONFLICT (content): Merge conflict in drivers/platform/Makefile
Merging counter-next/counter-next (b462fcd08dd5 MAINTAINERS: Update Intel Q=
uadrature Encoder Peripheral maintainer)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (2b11e7403a8e dt-bindings: dma: xilinx: Simplify dma=
-coherent property)
Merging cgroup/for-next (004d6fbaf4fc Merge branch 'for-6.19' into for-next)
CONFLICT (content): Merge conflict in kernel/cgroup/cpuset.c
Merging scsi/for-next (10578e62c742 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (278712d20bc8 scsi: Revert "scsi: libsas: Fix exp=
-attached device scan after probe failure scanned in again after probe fail=
ed")
Merging vhost/linux-next (9478916dad8b vhost: use "checked" versions of get=
_user() and put_user())
Merging rpmsg/for-next (f1f6eaa1e545 Merge branches 'rpmsg-next' and 'rproc=
-next' into for-next)
Merging gpio-brgl/gpio/for-next (dae9750105cf gpio: loongson: Switch 2K2000=
/3000 GPIO to BYTE_CTRL_MODE)
Merging gpio-intel/for-next (b2a186cced11 gpiolib: acpi: use min() instead =
of min_t())
Merging pinctrl/for-next (5b3a403eb576 Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging pinctrl-intel/for-next (8daf70e6aa41 Merge patch series "pinctrl: i=
ntel: Export intel_gpio_add_pin_ranges() and use it")
Merging pinctrl-renesas/renesas-pinctrl (3b0cf6ab3590 pinctrl: renesas: rzg=
2l: Refactor OEN register PWPR handling)
Merging pinctrl-samsung/for-next (3cfc60e09bdc pinctrl: samsung: Add ARTPEC=
-9 SoC specific configuration)
Merging pwm/pwm/for-next (fae00ea9f003 pwm: rzg2l-gpt: Allow checking perio=
d_tick cache value only if sibling channel is enabled)
CONFLICT (content): Merge conflict in rust/macros/module.rs
Applying: fix up for "pwm: Add Rust driver for T-HEAD TH1520 SoC"
Merging ktest/for-next (d3042cbe84a0 ktest.pl: Fix uninitialized var in con=
fig-bisect.pl)
Merging kselftest/next (a2f7990d3309 selftests: tracing: Update fprobe self=
test for ftrace based fprobe)
Merging kunit/test (3a8660878839 Linux 6.18-rc1)
Merging kunit-next/kunit (7bc16e72ddb9 kunit: Make filter parameters config=
urable via Kconfig)
Merging livepatching/for-next (5cb5575308bc selftests: livepatch: use canon=
ical ftrace path)
Merging rtc/rtc-next (9d6d6b06933c rtc: nvvrs: add NVIDIA VRS RTC device dr=
iver)
Merging nvdimm/libnvdimm-for-next (30065e73d7c0 nvdimm: Prevent integer ove=
rflow in ramdax_get_config_data())
Merging at24/at24/for-next (aef72ebe9c86 dt-bindings: eeprom: at24: Add com=
patible for Belling BL24S64)
Merging ntb/ntb-next (68113d260674 NTB/msi: Remove unused functions)
Merging seccomp/for-next/seccomp (7d0a66e4bb90 Linux 6.18)
Merging slimbus/for-next (3a8660878839 Linux 6.18-rc1)
Merging nvmem/for-next (3a8660878839 Linux 6.18-rc1)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (70bdebc8cb82 mshv: adjust interrupt control str=
ucture for ARM64)
CONFLICT (content): Merge conflict in drivers/hv/mshv_root_main.c
Merging auxdisplay/for-next (00de283c53c9 Merge patch series "auxdisplay: l=
inedisp: support attribute attachment to auxdisplay devices")
Merging kgdb/kgdb/for-next (fdbdd0ccb30a kdb: remove redundant check for sc=
ancode 0xe0)
Merging hmm/hmm (19272b37aa4f Linux 6.16-rc1)
Merging cfi/cfi/next (3a8660878839 Linux 6.18-rc1)
Merging mhi/mhi-next (ac35e04f8000 bus: mhi: host: pci_generic: Add Foxconn=
 T99W760 modem)
Merging memblock/for-next (6e2c87bd3333 mm/mm_init: Introduce a boot parame=
ter for check_pages)
CONFLICT (content): Merge conflict in kernel/Kconfig.kexec
Applying: fix for "memblock: remove CONFIG_MEMBLOCK_KHO_SCRATCH option"
Merging cxl/next (ea5514e30056 Merge branch 'for-6.19/cxl-misc' into cxl-fo=
r-next)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (7a2ff00c3b5e docs: efi: add CPER functions to driver-api)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (a8ec08bf3259 Merge branch 'slab/for-6.19/mempoo=
l_alloc_bulk' into slab/for-next)
Merging random/master (90fb9b98fcf5 random: complete sentence of comment)
Merging landlock/next (54f9baf537b0 selftests/landlock: Add disconnected le=
afs and branch test suites)
Merging rust/rust-next (54e3eae85562 Merge patch series "`syn` support")
CONFLICT (content): Merge conflict in rust/kernel/debugfs/file_ops.rs
CONFLICT (content): Merge conflict in rust/kernel/debugfs/traits.rs
CONFLICT (content): Merge conflict in rust/kernel/opp.rs
CONFLICT (content): Merge conflict in rust/kernel/pci/id.rs
CONFLICT (content): Merge conflict in rust/kernel/str.rs
Applying: fix up 3 for "rust: replace `CStr` with `core::ffi::CStr`"
Merging rust-alloc/alloc-next (3a8660878839 Linux 6.18-rc1)
Merging rust-io/io-next (86731a2a651e Linux 6.16-rc3)
Merging rust-pin-init/pin-init-next (42415d163e5d rust: pin-init: add refer=
ences to previously initialized fields)
Merging rust-timekeeping/timekeeping-next (4521438fb076 rust: time: Impleme=
nt basic arithmetic operations for Delta)
Merging rust-xarray/xarray-next (fa616196fbea MAINTAINERS: add entry for Ru=
st XArray API)
Merging sysctl/sysctl-next (564195c1a33c sysctl: Wrap do_proc_douintvec wit=
h the public function proc_douintvec_conv)
Merging execve/for-next/execve (7d0a66e4bb90 Linux 6.18)
Merging bitmap/bitmap-for-next (5ba71195a9cb rust_binder: use bitmap for al=
location of handles)
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (7454048db27d kbuild: Enable GCC diagnostic cont=
ext for value-tracking warnings)
Merging nolibc/for-next (1d573464749c selftests/nolibc: error out on linker=
 warnings)
Merging iommufd/for-next (5185c4d8a56b Merge branch 'iommufd_dmabuf' into k=
.o-iommufd/for-next)
CONFLICT (content): Merge conflict in include/linux/vfio_pci_core.h
Merging turbostat/next (abc0515104b6 tools/power turbostat: version 2025.12=
.02)
Merging pwrseq/pwrseq/for-next (3a8660878839 Linux 6.18-rc1)
Merging capabilities-next/caps-next (9891d2f79a9f Clarify the rootid_owns_c=
urrentns)
Merging ipe/next (7d0a66e4bb90 Linux 6.18)
Merging kcsan/next (dcb6fa37fd7b Linux 6.18-rc3)
Merging crc/crc-next (dcb6fa37fd7b Linux 6.18-rc3)
Merging fwctl/for-next (211ddde0823f Linux 6.18-rc2)
Merging devsec-tsm/next (4be423572da1 crypto/ccp: Implement SEV-TIO PCIe ID=
E (phase1))
CONFLICT (content): Merge conflict in include/linux/psp-sev.h
Merging hisilicon/for-next (6c177775dcc5 Merge branch 'next/drivers' into f=
or-next)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)

--Sig_/Ujsw7Wmso1gjD6rRr0klPWQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkxMB4ACgkQAVBC80lX
0GxtSAf9Gs0r5eZ16b/alGJCtslFS9ciEfzN6L9N6q3quEwPHmUTXwsWYsZALqUL
N6KSxwGHUctMIUXhDW4TGjwepVtg+BeUeXJz6TtIwSDyEipW8IBLwBbFbgINKMkc
vFzdMdtVJ1uKtYyYyXF2eW6rAbldEQMUgkGptHPHAYjHbvp4heZyWbSVcdAzwNv4
B0OwDIu154uxpwrpueuaoZts5nqnzyYzSAOPYbV5RtY7gSErGAL8X7UtktKQQpox
PT2Q/+2F5IS2iDBeKHG6msYtBazPCRhl8CpICjHrkQCCWAS/WyYSR5njA34RVfRd
gQ2DyR2wJpvTOC1T5VwpHauILgTNzw==
=mP0c
-----END PGP SIGNATURE-----

--Sig_/Ujsw7Wmso1gjD6rRr0klPWQ--

