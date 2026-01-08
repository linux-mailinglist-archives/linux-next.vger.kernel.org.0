Return-Path: <linux-next+bounces-9589-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B0DD00C22
	for <lists+linux-next@lfdr.de>; Thu, 08 Jan 2026 04:02:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E929C300CCEC
	for <lists+linux-next@lfdr.de>; Thu,  8 Jan 2026 03:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285821FF5E3;
	Thu,  8 Jan 2026 03:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rID21wsj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8465A3A0B24;
	Thu,  8 Jan 2026 03:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767841369; cv=none; b=JcSk/OalCQS93uwyjcX+yzonRx5viv+C61//Plji8U3GeUja7Iewa0nfvm/KYCThkFIkirzoPzkghroLUMKOtT9RTIFEIUIQyHQBjY1QyRj8Znw6h32fCQq5UFtjwuR5K80uYfIw5mQwpfd3tUrf5Irplh3fwwqbI1YYYAwi1Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767841369; c=relaxed/simple;
	bh=xG2UMGqjZfEkDdLE5O1p62An4d4XlNCBP/4W2vo2VYM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UpLKRTzEsjEI7tIudrDbHXYSCQcyhJV2a21ifMp1boV1FQURQLvGEXx7h8f3roOdiT5BM4rqrR1V5jWE5CZSpDW5IaPRAh/nsnrzUmYN5KhVA5K3RSTM7gQlApodAcCEoJhj5ixKQt4YF1CdCzUZAGFGAxftikFd472aj90eqOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rID21wsj; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767841354;
	bh=y7LQ37FbPudI1Ad4keOeoGsKbH8RXz+cVbwDn/hdVP0=;
	h=Date:From:To:Cc:Subject:From;
	b=rID21wsjsNnDyDj4ySqG+nehf8MXq862v7uAtg2OYVQLY2QR4CB/cHQrnuLbFCVKf
	 DTbpmS4xPocDYsg5SDxbjR5wUNEXvuSx2YEtbz1dQ98TuDcR7KrpdLDOsM/ChP0ffS
	 LbqOBbrPTBOZw2Eo2UDwOdTf0DO1aqyEWdgfAMUK8Bv4W1Y6oMWA3pgxOiJqZk/MJ5
	 WoviaDcCV72dLJy2h3ktkkWLl/63kV8bU/3VEJ9xEH02/XHNZZRAK25kCYTX6jhNXA
	 dSNDzq7dLVc978SwMwiSGyV5aIf2oF5x/A1hr92bAtrNjXjAFW0pV3Xy76zDe1vvDP
	 W5r/s1xVrxz6Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dmqT60cySz4wCG;
	Thu, 08 Jan 2026 14:02:34 +1100 (AEDT)
Date: Thu, 8 Jan 2026 14:02:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jan 8
Message-ID: <20260108140232.5a8b00c1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lghkens/.B_._NZb1HORREh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/lghkens/.B_._NZb1HORREh
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20260107:

The mm-unstable tree still had its build failure for which I applied a patc=
h.

The tip tree stil had its build failure due to other linux-next changes
for which I reverted a commit.

Non-merge commits (relative to Linus' tree): 4240
 4333 files changed, 257792 insertions(+), 124951 deletions(-)

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

I am currently merging 404 trees (counting Linus' and 122 trees of bug
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
Merging origin/master (f0b9d8eb98df Merge tag 'nfsd-6.19-3' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/cel/linux)
Merging ext4-fixes/fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging vfs-brauner-fixes/vfs.fixes (75ddaa4ddc86 pidfs: protect PIDFD_GET_=
* ioctls() via ifdef)
Merging fscrypt-current/for-current (1e39da974ce6 fscrypt: fix left shift u=
nderflow when inode->i_blkbits > PAGE_SHIFT)
Merging fsverity-current/for-current (211ddde0823f Linux 6.18-rc2)
Merging btrfs-fixes/next-fixes (14760d8224fe Merge branch 'misc-6.19' into =
next-fixes)
Merging vfs-fixes/fixes (e1b4c6a58304 shmem: fix recovery on rename failure=
s)
Merging erofs-fixes/fixes (5c036adea1a8 erofs: don't bother with s_stack_de=
pth increasing for now)
Merging nfsd-fixes/nfsd-fixes (0b88bfa42e54 NFSD: net ref data still needs =
to be freed even if net hasn't startup)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (e8bd877fb76b ovl: fix possible double un=
link)
Merging fscrypt/for-next (211ddde0823f Linux 6.18-rc2)
Merging btrfs/for-next (cab7d1370e75 Merge branch 'for-next-next-v6.19-2026=
0106' into for-next-20260106)
Merging ceph/master (c0fe2994f9a9 libceph: make calc_target() set t->paused=
, not just clear it)
Merging cifs/for-next (9ace4753a520 Linux 6.19-rc4)
Merging configfs/configfs-next (f7f78098690d configfs: Constify ct_item_ops=
 in struct config_item_type)
Merging ecryptfs/next (6ba673331340 ecryptfs: Drop redundant NUL terminatio=
ns after calling ecryptfs_to_hex)
Merging dlm/next (8e4021078863 dlm: check for undefined release_option valu=
es)
Merging erofs/dev (ab4b58a1bcba erofs: remove useless src in erofs_xattr_co=
py_to_buffer())
Merging exfat/dev (f5a5c9b40490 fs: exfat: improve error code handling in e=
xfat_find_empty_entry())
Merging ext3/for_next (6f7c877cc397 fs: send fsnotify_xattr()/IN_ATTRIB fro=
m vfs_fileattr_set()/chattr(1))
Merging ext4/dev (6fb67ac89690 ext4: drop the TODO comment in ext4_es_inser=
t_extent())
Merging f2fs/dev (0eda086de85e f2fs: fix to check sysfs filename w/ gc_pin_=
file_thresh correctly)
Merging fsverity/for-next (211ddde0823f Linux 6.18-rc2)
Merging fuse/for-next (8da059f2a497 fuse: Uninitialized variable in fuse_ep=
och_work())
Merging gfs2/for-next (c6c6b5f5a357 gfs2: Fix gfs2_find_jhead)
Merging jfs/jfs-next (eb0cfcf26571 jfs: Add missing set_freezable() for fre=
ezable kthread)
Merging ksmbd/ksmbd-for-next (9ace4753a520 Linux 6.19-rc4)
Merging nfs/linux-next (3609fa95fb0f Merge tag 'devicetree-fixes-for-6.19-2=
' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux)
Merging nfs-anna/linux-next (b623390045a8 NFS: Fix LTP test failures when t=
imestamps are delegated)
Merging nfsd/nfsd-next (ee35e4fb4d38 xdrgen: Emit the program number defini=
tion)
Merging ntfs3/master (099ef9ab9203 fs/ntfs3: implement iomap-based file ope=
rations)
Merging orangefs/for-next (11f6bce77e27 fs/orangefs: Replace kzalloc + copy=
_from_user with memdup_user_nul)
Merging overlayfs/overlayfs-next (ad1423922781 ovl: make sure that ovl_crea=
te_real() returns a hashed dentry)
Merging ubifs/next (0695aef23d67 ubifs: vmalloc(array_size()) -> vmalloc_ar=
ray())
Merging v9fs/9p-next (3e281113f871 9p: fix new mount API cache option handl=
ing)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (f401306d72f2 xfs: factor out a xlog_write_space_advan=
ce helper)
Merging zonefs/for-next (a42938e80357 zonefs: correct some spelling mistake=
s)
Merging vfs-brauner/vfs.all (50f21b83fba3 Merge branch 'vfs-7.0.nonblocking=
_timestamps' into vfs.all)
Merging vfs/for-next (eb028c33451a d_make_discardable(): warn if given a no=
n-persistent dentry)
Merging mm-hotfixes/mm-hotfixes-unstable (d7138516fb5c mm/vmscan: fix demot=
ion targets checks in reclaim/demotion)
Merging fs-current (068dea5ea2ed Merge branch 'fixes' of https://git.kernel=
.org/pub/scm/linux/kernel/git/xiang/erofs.git)
Merging kbuild-current/kbuild-fixes-for-next (a61ec945c3c9 Merge branch 'kb=
uild-fixes-unstable' into kbuild-fixes-for-next)
Merging arc-current/for-curr (d7b8f8e20813 Linux 6.16-rc5)
Merging arm-current/fixes (fd2dee1c6e22 ARM: fix branch predictor hardening)
Merging arm64-fixes/for-next/fixes (dd4d71f587f3 arm64/efi: Don't fail chec=
k current_in_efi() if preemptible)
Merging arm-soc-fixes/arm/fixes (bf104037ebd5 arm64: dts: hisilicon: hikey9=
60: Drop "snps,gctl-reset-quirk" and "snps,tx_de_emphasis*" properties)
Merging davinci-current/davinci/for-current (8f0b4cce4481 Linux 6.19-rc1)
Merging drivers-memory-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging sophgo-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging sophgo-soc-fixes/soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging m68k-current/for-linus (aaf4e92341b0 m68k: defconfig: Update defcon=
figs for v6.18-rc1)
Merging powerpc-fixes/fixes (9ace4753a520 Linux 6.19-rc4)
Merging s390-fixes/fixes (9448598b22c5 Linux 6.19-rc2)
Merging net/main (653267321f05 Merge branch 'net-netdevsim-fix-inconsistent=
-carrier-state-after-link-unlink')
Merging bpf/master (ab86d0bf01f6 selftests/bpf: Update xdp_context_test_run=
 test to check maximum metadata size)
Merging ipsec/master (c196def07bbc xfrm: set ipv4 no_pmtu_disc flag only on=
 output sa when direction is set)
Merging netfilter/main (653267321f05 Merge branch 'net-netdevsim-fix-incons=
istent-carrier-state-after-link-unlink')
Merging ipvs/main (de0337d641bf net: ionic: map SKB after pseudo-header che=
cksum prep)
Merging wireless/for-next (dbf8fe85a16a Merge tag 'net-6.19-rc4' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ath/for-current (dbf8fe85a16a Merge tag 'net-6.19-rc4' of git://git=
.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging iwlwifi/fixes (8f7aa3d3c732 Merge tag 'net-next-6.19' of git://git.=
kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (3609fa95fb0f Merge tag 'devicetree-fixes-for-6.1=
9-2' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux)
Merging sound-current/for-linus (9ed7a28225af ALSA: hda/realtek: add HP Lap=
top 15s-eq1xxx mute LED quirk)
Merging sound-asoc-fixes/for-linus (2fa0eaf78c4b ASoC: ops: fix pointer typ=
es to be big-endian)
Merging regmap-fixes/for-linus (f3f380ce6b3d regmap: maple: free entry on m=
as_store_gfp() failure)
Merging regulator-fixes/for-linus (60489936aced regulator: fp9931: fix regu=
lator node pointer)
Merging spi-fixes/for-linus (9ace4753a520 Linux 6.19-rc4)
Merging pci-current/for-linus (bdb32359eab9 sparc/PCI: Correct 64-bit non-p=
ref -> pref BAR resources)
Merging driver-core.current/driver-core-linus (8510ef5e3cfb rust: device: R=
emove explicit import of CStrExt)
Merging tty.current/tty-linus (f8f9c1f4d0c7 Linux 6.19-rc3)
Merging usb.current/usb-linus (2740ac33c87b usb: core: add USB_QUIRK_NO_BOS=
 for devices that hang on BOS descriptor)
Merging usb-serial-fixes/usb-linus (8f0b4cce4481 Linux 6.19-rc1)
Merging phy/fixes (fb21116099bb phy: broadcom: ns-usb3: Fix Wvoid-pointer-t=
o-enum-cast warning (again))
Merging staging.current/staging-linus (8f0b4cce4481 Linux 6.19-rc1)
Merging iio-fixes/fixes-togreg (9910159f0659 iio: core: add separate lockde=
p class for info_exist_lock)
Merging counter-current/counter-current (9448598b22c5 Linux 6.19-rc2)
Merging char-misc.current/char-misc-linus (361e0ff456a8 rust_binder: remove=
 spin_lock() in rust_shrink_free_page())
Merging soundwire-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging thunderbolt-fixes/fixes (9ace4753a520 Linux 6.19-rc4)
Merging input-current/for-linus (248d3a73a016 Input: ti_am335x_tsc - fix of=
f-by-one error in wire_order validation)
Merging crypto-current/master (961ac9d97be7 crypto: qat - fix duplicate res=
tarting msg during AER error)
Merging libcrypto-fixes/libcrypto-fixes (fdfa4339e805 lib/crypto: tests: po=
lyval_kunit: Increase iterations for preparekey in IRQs)
Merging vfio-fixes/for-linus (acf44a2361b8 vfio/xe: Fix use-after-free in x=
e_vfio_pci_alloc_file())
Merging kselftest-fixes/fixes (9ace4753a520 Linux 6.19-rc4)
Merging dmaengine-fixes/fixes (ad9a3567d02a dmaengine: apple-admac: Add "ap=
ple,t8103-admac" compatible)
Merging backlight-fixes/for-backlight-fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging mtd-fixes/mtd/fixes (2f6d2c8d9ac0 Revert "mtd: spinand: esmt: fix i=
d code for F50D1G41LB")
Merging mfd-fixes/for-mfd-fixes (aa6e63373d91 mfd: ls2kbmc: Use PCI API ins=
tead of direct accesses)
Merging v4l-dvb-fixes/fixes (69d6c6fc79eb media: ov02c10: Remove unnecessar=
y hflip and vflip pointers)
Merging reset-fixes/reset/fixes (997c06330fd5 reset: imx8mp-audiomix: Fix b=
ad mask values)
Merging mips-fixes/mips-fixes (680ad315caaa MIPS: Fix a reference leak bug =
in ip22_check_gio())
Merging at91-fixes/at91-fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging omap-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging kvm-fixes/master (0499add8efd7 Merge tag 'kvm-x86-fixes-6.19-rc1' o=
f https://github.com/kvm-x86/linux into HEAD)
Merging kvms390-fixes/master (5f9df945d4e8 KVM: s390: Fix FOLL_*/FAULT_FLAG=
_* confusion)
Merging hwmon-fixes/hwmon (b3db91c3bfea hwmon: (ltc4282): Fix reset_history=
 file permissions)
Merging nvdimm-fixes/libnvdimm-fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging cxl-fixes/fixes (88c72bab77aa cxl/region: fix format string for res=
ource_size_t)
Merging dma-mapping-fixes/dma-mapping-fixes (7f2e8e1d22f6 parisc: Set valid=
 bit in high byte of 64=E2=80=91bit physical address)
Merging drivers-x86-fixes/fixes (c6703f10c8cc platform/x86: asus-armoury: a=
dd support for G835LW)
Merging samsung-krzk-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging pinctrl-samsung-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging devicetree-fixes/dt/linus (235a1eb8d2dc of: unittest: Fix memory le=
ak in unittest_data_add())
Merging dt-krzk-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging scsi-fixes/fixes (309a29b5965a scsi: ufs: host: mediatek: Make read=
-only array scale_us static const)
Merging drm-fixes/drm-fixes (50cf611b0bfa Merge tag 'exynos-drm-fixes-v6.19=
-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos i=
nto drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (9ace4753a520 Linux 6.19-rc4)
Merging mmc-fixes/fixes (3009738a855c mmc: sdhci-of-dwcmshc: Prevent illega=
l clock reduction in HS200/HS400 mode)
Merging rtc-fixes/rtc-fixes (162f24cbb0f6 rtc: rx8025: fix incorrect regist=
er reference)
Merging gnss-fixes/gnss-linus (8f0b4cce4481 Linux 6.19-rc1)
Merging hyperv-fixes/hyperv-fixes (173d6f64f955 mshv: release mutex on regi=
on invalidation failure)
Merging risc-v-fixes/fixes (5e5be092ffad riscv: pgtable: Cleanup useless VA=
_USER_XXX definitions)
Merging riscv-dt-fixes/riscv-dt-fixes (6f5d8490ca03 dt-bindings: riscv: upd=
ate ratified version of h, svinval, svnapot, svpbmt)
Merging riscv-soc-fixes/riscv-soc-fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging fpga-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging spdx/spdx-linus (d358e5254674 Merge tag 'for-6.19/dm-changes' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging gpio-brgl-fixes/gpio/for-current (a80208072df8 gpio: shared: don't =
allocate the lookup table until we really need it)
Merging gpio-intel-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging pinctrl-intel-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging auxdisplay-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging kunit-fixes/kunit-fixes (c33b68801fbe kunit: make FAULT_TEST defaul=
t to n when PANIC_ON_OOPS)
Merging memblock-fixes/fixes (be05f5714644 memblock test: include <linux/si=
zes.h> from tools mm.h stub)
Merging renesas-fixes/fixes (379c590113ce ARM: shmobile: smp: Enforce shmob=
ile_smp_* alignment)
Merging perf-current/perf-tools (fe072f651083 tools build: Fix the common s=
et of features test wrt libopenssl)
Merging efi-fixes/urgent (cfe54f4591e6 kthread: Warn if mm_struct lacks use=
r_ns in kthread_use_mm())
Merging battery-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging iommufd-fixes/for-rc (f8f9c1f4d0c7 Linux 6.19-rc3)
Merging rust-fixes/rust-fixes (3a1ec424dd9c rust: num: bounded: mark __new =
as unsafe)
Merging w1-fixes/fixes (cc8f92e41eb7 w1: fix redundant counter decrement in=
 w1_attach_slave_device())
Merging pmdomain-fixes/fixes (3de499664996 pmdomain: imx8m-blk-ctrl: Remove=
 separate rst and clk mask for 8mq vpu)
Merging i2c-host-fixes/i2c/i2c-host-fixes (ccd1cdca5cd4 Merge tag 'nfsd-6.1=
9-1' of git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux)
Merging sparc-fixes/for-linus (8f0b4cce4481 Linux 6.19-rc1)
Merging clk-fixes/clk-fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging thead-clk-fixes/thead-clk-fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging pwrseq-fixes/pwrseq/for-current (8f0b4cce4481 Linux 6.19-rc1)
Merging thead-dt-fixes/thead-dt-fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging ftrace-fixes/ftrace/fixes (1650a1b6cb1a fgraph: Check ftrace_pids_e=
nabled on registration for early filtering)
Merging ring-buffer-fixes/ring-buffer/fixes (b042fdf18e89 tracing: Fix WARN=
_ON in tracing_buffers_mmap_close for split VMAs)
Merging trace-fixes/trace/fixes (39263f986da5 ftrace: Fix address for jmp m=
ode in t_show())
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging tip-fixes/tip/urgent (a3b1397cc023 Merge branch into tip/master: 'x=
86/urgent')
Merging slab-fixes/slab/for-next-fixes (53ca00a19d34 mm/slub: reset KASAN t=
ag in defer_free() before accessing freed memory)
Merging drm-msm-fixes/msm-fixes (66691e272e40 drm/msm: Replace unsafe snpri=
ntf usage with scnprintf)
Merging uml-fixes/fixes (df447a3b4a4b um: Fix FD copy size in os_rcv_fd_msg=
())
Merging fwctl-fixes/for-rc (f8f9c1f4d0c7 Linux 6.19-rc3)
Merging devsec-tsm-fixes/fixes (fba4ceaa242d configfs-tsm-report: Fix NULL =
dereference of tsm_ops)
Merging drm-rust-fixes/drm-rust-fixes (97872fa28b33 MAINTAINERS: exclude th=
e tyr driver from DRM MISC)
Merging tenstorrent-dt-fixes/tenstorrent-dt-fixes (3a8660878839 Linux 6.18-=
rc1)
Merging drm-misc-fixes/for-linux-next-fixes (3ea3b7891b21 drm/vmwgfx: Fix k=
ernel-doc warnings for vmwgfx_fence)
Merging rust/rust-next (9ace4753a520 Linux 6.19-rc4)
Merging rust-alloc/alloc-next (f8f9c1f4d0c7 Linux 6.19-rc3)
Merging rust-io/io-next (86731a2a651e Linux 6.16-rc3)
Merging rust-pin-init/pin-init-next (42415d163e5d rust: pin-init: add refer=
ences to previously initialized fields)
Merging rust-timekeeping/timekeeping-next (4521438fb076 rust: time: Impleme=
nt basic arithmetic operations for Delta)
Merging rust-xarray/xarray-next (fa616196fbea MAINTAINERS: add entry for Ru=
st XArray API)
Merging mm-stable/mm-stable (f8f9c1f4d0c7 Linux 6.19-rc3)
Merging mm-nonmm-stable/mm-nonmm-stable (f8f9c1f4d0c7 Linux 6.19-rc3)
Merging mm-unstable/mm-unstable (43fac2258fca mm: vmscan: add PIDs to vmsca=
n tracepoints)
Applying: fix up for "mm: vmscan: add cgroup IDs to vmscan tracepoints"
Merging mm-nonmm-unstable/mm-nonmm-unstable (91498abeb3a8 ocfs2: add check =
for free bits before allocation in ocfs2_move_extent())
Merging kbuild/kbuild-for-next (c5cece2a6cf8 Merge branch 'kbuild-next-unst=
able' into kbuild-for-next)
Merging clang-format/clang-format (8f0b4cce4481 Linux 6.19-rc1)
Merging perf/perf-tools-next (75326c67aa8c perf data: Fix coding style)
Merging compiler-attributes/compiler-attributes (8f0b4cce4481 Linux 6.19-rc=
1)
Merging dma-mapping/dma-mapping-for-next (8a840ab0567f dma-mapping: Remove =
dma_mark_clean (again))
Merging asm-generic/master (edcc8a38b5ac once: fix race by moving DO_ONCE t=
o separate section)
Merging alpha/alpha-next (d58041d2c63e MAINTAINERS: Add Magnus Lindholm as =
maintainer for alpha port)
Merging arm/for-next (dd9143371a86 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (d30f837bb894 Merge branches 'for-next/acpi', '=
for-next/cpufeature', 'for-next/cpufreq', 'for-next/entry', 'for-next/misc'=
, 'for-next/perf' and 'for-next/selftests' into for-next/core)
Merging arm-perf/for-next/perf (79448fa1f495 perf/arm_dsu: Allow standard c=
ycles events)
Merging arm-soc/for-next (3fb76066f882 soc: document merges)
Merging amlogic/for-next (223780846ace Merge branch 'v6.20/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (074986379c03 Merge branch 'apple-soc/=
dt-6.20' into asahi-soc/for-next)
Merging at91/at91-next (8f0b4cce4481 Linux 6.19-rc1)
Merging bmc/for-next (459a5aa171c0 ARM: dts: aspeed: bletchley: Fix ADC vre=
f property names)
Merging broadcom/next (37c3a91e9730 arm64: dts: broadcom: bcm2712: Add watc=
hdog DT node)
Merging cix/for-next (b34b20c168aa Merge remote-tracking branch 'cix/dt' in=
to for-next)
Merging davinci/davinci/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging drivers-memory/for-next (9805f2cfc883 dt-bindings: memory: SDRAM ch=
annel: standardise node name)
Merging fsl/soc_fsl (66a4ff38d7b2 soc: fsl: qe: Simplify with scoped for ea=
ch OF child loop)
Merging imx-mxs/for-next (f74941f893ae Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (56c499a18a90 Merge branch 'v6.19-next/dts64' int=
o for-next)
Merging mvebu/for-next (5e7879bc7563 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (df074cb76e93 Merge branch 'omap-for-v6.20/soc' into =
tmp/omap-next-20260105.121305)
Merging qcom/for-next (8312b698b184 Merge branches 'arm32-fixes-for-6.19', =
'arm32-for-6.20', 'arm64-defconfig-for-6.20', 'arm64-fixes-for-6.19', 'arm6=
4-for-6.20', 'clk-fixes-for-6.19', 'clk-for-6.20' and 'drivers-for-6.20' in=
to for-next)
Merging renesas/next (469eafbe3b54 Merge branches 'renesas-arm-defconfig-fo=
r-v6.20', 'renesas-drivers-for-v6.20' and 'renesas-dts-for-v6.20' into rene=
sas-next)
Merging reset/reset/next (a0d57f7504b6 reset: gpio: add the "compatible" pr=
operty)
Merging rockchip/for-next (471b2e33acbf Merge branch 'v6.20-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (fefc12a70eb1 Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (324acdd23e6e Merge branches 'for-next/juno/upd=
ates', 'for-next/ffa/updates' and 'for-next/scmi/updates' of ssh://gitolite=
.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-linux-next)
Merging sophgo/for-next (b1fa0deeb860 Merge branch 'dt/riscv' into for-next)
Merging sophgo-soc/soc-for-next (c8754c7deab4 soc: sophgo: cv1800: rtcsys: =
New driver (handling RTC only))
Merging spacemit/for-next (3e02c598dca3 Merge branch 'spacemit-clk-for-6.20=
' into spacemit-for-next)
Merging stm32/stm32-next (a6961e2ced51 arm64: dts: st: set RIFSC as an acce=
ss controller on stm32mp21x platforms)
Merging sunxi/sunxi/for-next (0b2761eb1287 ARM: dts: allwinner: sun5i-a13-u=
too-p66: delete "power-gpios" property)
Merging tee/next (5b8f790591d0 Merge branches 'tee_bus_callback_for_6.20', =
'qcomtee_fixes_for_6.20' and 'optee_update_for_6.20' into next)
Merging tegra/for-next (e016a50e00e6 Merge branch for-6.19/arm64/defconfig =
into for-next)
Merging tenstorrent-dt/tenstorrent-dt-for-next (a71e6e8eea8a riscv: defconf=
ig: Enable Tenstorrent SoCs)
Merging thead-dt/thead-dt-for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging ti/ti-next (9cc01d54b641 Merge branches 'ti-drivers-soc-next' and '=
ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (170e1e2d13a2 Merge remote-tracking branch 'git/zyn=
qmp/dt' into for-next)
Merging clk/clk-next (8f0b4cce4481 Linux 6.19-rc1)
Merging clk-imx/for-next (fdc1dc7dd53b clk: imx: add driver for imx8ulp's s=
im lpav)
Merging clk-renesas/renesas-clk (ebb3acf4d7c9 clk: renesas: r9a09g056: Add =
clock and reset entries for TSU)
Merging thead-clk/thead-clk-for-next (30441a56b1d1 clk: thead: th1520-ap: S=
upport CPU frequency scaling)
Merging csky/linux-next (817d21578d51 csky: Remove compile warning for CONF=
IG_SMP)
Merging loongarch/loongarch-next (bb85d206be20 samples/ftrace: Adjust Loong=
Arch register restore order in direct calls)
Merging m68k/for-next (aaf4e92341b0 m68k: defconfig: Update defconfigs for =
v6.18-rc1)
Merging m68knommu/for-next (adc342591f78 m68k: defconfig: Clean up referenc=
es to non-existing configs)
Merging microblaze/next (8f0b4cce4481 Linux 6.19-rc1)
Merging mips/mips-next (8f0b4cce4481 Linux 6.19-rc1)
Merging openrisc/for-next (8c30b0018f9d openrisc: Add jump label support)
Merging parisc-hd/for-next (7be0f2c219aa parisc: kernel: replace kfree() wi=
th put_device() in create_tree_node())
Merging powerpc/next (9ace4753a520 Linux 6.19-rc4)
Merging risc-v/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging riscv-dt/riscv-dt-for-next (4297ddbf1d14 riscv: dts: starfive: Appe=
nd JH-7110 SoC compatible to VisionFive 2 Lite eMMC board)
Merging riscv-soc/riscv-soc-for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging s390/for-next (12ea976f955c s390/ap: Fix typo in function name refe=
rence)
Merging sh/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging sparc/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging uml/next (a3209bb94b36 um: Disable KASAN_INLINE when STATIC_LINK is=
 selected)
Merging xtensa/xtensa-for-next (0d4b3ca115b5 xtensa: align: validate access=
 in fast_load_store)
Merging fs-next (72573e4d7dba Merge branch 'vfs.all' of https://git.kernel.=
org/pub/scm/linux/kernel/git/vfs/vfs.git)
Merging printk/for-next (34793812e592 Merge branch 'rework/atomic-flush-sof=
tlockup' into for-next)
Merging pci/next (29a77b4897f1 Merge branch 'pci/misc')
CONFLICT (content): Merge conflict in drivers/pci/controller/dwc/pcie-qcom.c
Merging pstore/for-next/pstore (b69255357368 pstore/ram: Update module para=
meters from platform data)
Merging hid/for-next (c7fe906e44c9 Merge branches 'for-6.19/upstream-fixes'=
, 'for-6.20/intel-ish' and 'for-6.20/intel-thc' into for-next)
Merging i2c/i2c/for-next (880977fdc7f6 dt-bindings: i2c: qcom-cci: Document=
 SM8750 compatible)
Merging i2c-host/i2c/i2c-host (e2370b8b2cf1 dt-bindings: i2c: atmel,at91sam=
: add microchip,lan9691-i2c)
Merging i3c/i3c/next (136209e6bd98 i3c: adi: Fix confusing cleanup.h syntax)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (c6c80820ac5d hwmon: (pmbus) Add mp5926 dr=
iver)
Merging jc_docs/docs-next (be5c6ec66030 Documentation/kernel-parameters: Ad=
d tsa under mitigations=3Doff)
Merging v4l-dvb/next (336367fab9b9 media: chips-media: wave5: Fix Potential=
 Probe Resource Leak)
CONFLICT (content): Merge conflict in drivers/media/mc/mc-request.c
Merging v4l-dvb-next/master (adc218676eef Linux 6.12)
Merging pm/linux-next (851f3af6701e Merge branch 'pm-tools' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (aefc3d0c7149 rust: cpufreq: rep=
lace `kernel::c_str!` with C-Strings)
Merging cpupower/cpupower (ff72619e1134 tools/power cpupower: Show C0 in id=
le-info dump)
Merging devfreq/devfreq-next (d9600d57668c PM / devfreq: Fix typo in DFSO_D=
OWNDIFFERENTIAL macro name)
Merging pmdomain/next (c20f7b37c6bb pmdomain: Merge branch fixes into next)
Merging opp/opp/linux-next (549a1be5cebb OPP: of: Simplify with scoped for =
each OF child loop)
Merging thermal/thermal/linux-next (c411d8bf0699 thermal/drivers/imx91: Add=
 support for i.MX91 thermal monitoring unit)
Merging rdma/for-next (325e3b5431dd RDMA/ocrdma: Remove unused OCRDMA_UVERB=
S definition)
Merging net-next/main (8e7148b56023 atm: idt77252: Use sb_pool_remove())
Merging bpf-next/for-next (2175ccfb93fd Merge branch 'bpf-selftests-fixes-f=
or-gcc-bpf-16')
Merging ipsec-next/master (8f7aa3d3c732 Merge tag 'net-next-6.19' of git://=
git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mlx5-next/mlx5-next (f0b2fde98065 net/mlx5: Add support for queryin=
g bond speed)
Merging netfilter-next/main (c303e8b86d9d dt-bindings: net: mscc-miim: add =
microchip,lan9691-miim)
Merging ipvs-next/main (c9dfb92de073 Merge branch 'mlx5-next' of git://git.=
kernel.org/pub/scm/linux/kernel/git/mellanox/linux)
Merging bluetooth/master (bdb9aba465a8 Bluetooth: Fix using PHYs bitfields =
as PHY value)
Merging wireless-next/for-next (dbf8fe85a16a Merge tag 'net-6.19-rc4' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ath-next/for-next (631ee338f04d Merge branch 'ath12k-ng' into ath-n=
ext)
Merging iwlwifi-next/next (85d002b2ac56 wifi: iwlwifi: mld: remove unused v=
ariable in d3.c)
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (8f0b4cce4481 Linux 6.19-rc1)
Merging nand/nand/next (a75a1dec037f mtd: spinand: add support for Dosilico=
n DS35Q1GA/DS35M1GA)
Merging spi-nor/spi-nor/next (ed26bd40df11 mailmap: update Pratyush Yadav's=
 email address)
Merging crypto/master (c904e459cf73 crypto: drbg - make drbg_get_random_byt=
es() return *void*)
Merging libcrypto/libcrypto-next (cb35268f1fcf lib/crypto: nh: Restore depe=
ndency of arch code on !KMSAN)
Merging drm/drm-next (59260fe5821a Merge tag 'drm-xe-next-2025-12-30' of ht=
tps://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_gem_shmem_helper.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_pagemap.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/pl111/pl111_drv.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_svm.c
CONFLICT (content): Merge conflict in include/drm/drm_pagemap.h
Merging drm-exynos/for-linux-next (3a8660878839 Linux 6.18-rc1)
Merging drm-misc/for-linux-next (6a0b99e9fb45 drm/etnaviv: Add module param=
eter to force PPU flop reset)
Merging amdgpu/drm-next (5e213a985d10 drm/amd/amdgpu: Port over some missin=
g registers and bits from GC 10.1 to 10.3 (v2))
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdkfd/cwsr_trap_=
handler_gfx12.asm
Merging drm-intel/for-linux-next (a5a9fd93d2c3 drm/i915/lt_phy_regs: Fix th=
e SPDX identifier comment)
Merging drm-msm/msm-next (66691e272e40 drm/msm: Replace unsafe snprintf usa=
ge with scnprintf)
Merging drm-msm-lumag/msm-next-lumag (1338e8ae4084 drm/msm/dp: Update msm_d=
p_controller IDs for sa8775p)
Merging drm-rust/drm-rust-next (2d7b4a44fb76 gpu: nova-core: use CStr::from=
_bytes_until_nul() in elf64_section())
Merging drm-nova/nova-next (93296e9d9528 gpu: nova-core: vbios: store refer=
ence to Device where relevant)
Merging drm-xe/drm-xe-next (3f0e3af4688d Merge drm/drm-next into drm-xe-nex=
t)
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (bd710b3da730 video/logo: move logo selection logic =
to Kconfig)
CONFLICT (content): Merge conflict in drivers/gpu/drm/Kconfig
Applying: fix up for "drm/hyperv: Remove reference to hyperv_fb driver"
Merging regmap/for-next (f3f380ce6b3d regmap: maple: free entry on mas_stor=
e_gfp() failure)
Merging sound/for-next (b47ce586300b ALSA: hda - fix function names & missi=
ng function parameter)
Merging ieee1394/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging sound-asoc/for-next (d52f8636a202 Merge remote-tracking branch 'aso=
c/for-6.20' into asoc-next)
Merging modules/modules-next (b68758e6f430 modules: moduleparam.h: fix kern=
el-doc comments)
Merging input/next (eeb2ea4b59df Input: ilitek_ts_i2c - switch mdelay() to =
fsleep())
Merging block/for-next (28fd54be4ae8 Merge branch 'block-6.19' into for-nex=
t)
Merging device-mapper/for-next (8fbb8fe75d4c dm-verity: allow REED_SOLOMON =
to be 'm' if DM_VERITY is 'm')
Merging libata/for-next (f474c70065e1 ata: libata: Allow more quirks)
Merging pcmcia/pcmcia-next (4a81f78caa53 pcmcia: Add error handling for add=
_interval() in do_validate_mem())
Merging mmc/next (a57107c0fc1a mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (3d845d25026c mfd: tps6105x: Fix kernel-doc warnin=
gs relating to the core struct and tps6105x_mode)
Merging backlight/for-backlight-next (8f0b4cce4481 Linux 6.19-rc1)
Merging battery/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging regulator/for-next (7be2621e4430 Merge remote-tracking branch 'regu=
lator/for-6.20' into regulator-next)
Merging security/next (472711068fa9 lsm: make keys for static branch static)
Merging apparmor/apparmor-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging integrity/next-integrity (377cae9851e8 ima: Fix stack-out-of-bounds=
 in is_bprm_creds_for_exec())
Merging selinux/next (8f0b4cce4481 Linux 6.19-rc1)
Merging smack/next (33d589ed60ae smack: /smack/doi: accept previously used =
values)
Merging tomoyo/master (25e99be0c76e RDMA/core: fix inconsistent indenting)
Merging tpmdd/next (416f99c3b16f Merge tag 'driver-core-6.19-rc1' of git://=
git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core)
Merging watchdog/master (7839932417dd Merge tag 'sched_ext-for-6.19-rc3-fix=
es' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext)
Merging iommu/next (c7fe9384c85d amd/iommu: Make protection domain ID funct=
ions non-static)
Merging audit/next (bcb90a2834c7 audit: add missing syscalls to read class)
Merging devicetree/for-next (8096d6049725 dt-bindings: trivial-devices: Add=
 some more undocumented devices)
Merging dt-krzk/for-next (cde5448c1296 Merge branch 'next/dt64' into for-ne=
xt)
Merging mailbox/for-next (7f98ab9da046 Merge tag 'for-6.19-rc4-tag' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/kdave/linux)
Merging spi/for-next (36227ab99a78 spi: st: use pm_ptr and remove __maybe_u=
nused)
Merging tip/master (a114eac90ff5 Merge branch into tip/master: 'x86/sev')
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/renesas/r9a09g077=
.dtsi
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/renesas/r9a09g087=
.dtsi
CONFLICT (content): Merge conflict in crypto/drbg.c
CONFLICT (content): Merge conflict in lib/Kconfig.debug
Applying: Revert "x86/sev: Carve out the SVSM code into a separate compilat=
ion unit"
Merging clockevents/timers/drivers/next (d1780dce9575 clocksource/drivers: =
Add Realtek system timer driver)
Merging edac/edac-for-next (87636dde12e4 Merge ras/edac-urgent into for-nex=
t)
Merging ftrace/for-next (fb8b8183208d rtla: Fix parse_cpu_set() return valu=
e documentation)
Merging rcu/next (8b9cafefb6aa Merge branch 'rcu-misc.20260107a')
Merging paulmck/non-rcu/next (7f8fcc6f09fb memory-barriers.txt: Sort wait_e=
vent* and wait_on_bit* list alphabetically)
Merging kvm/next (0499add8efd7 Merge tag 'kvm-x86-fixes-6.19-rc1' of https:=
//github.com/kvm-x86/linux into HEAD)
Merging kvm-arm/next (23ce6c072826 Merge branch kvm-arm64/misc-6.20 into kv=
marm-master/next)
Merging kvms390/next (2bd1337a1295 KVM: s390: Use generic VIRT_XFER_TO_GUES=
T_WORK functions)
Merging kvm-ppc/topic/ppc-kvm (9448598b22c5 Linux 6.19-rc2)
Merging kvm-riscv/riscv_kvm_next (3239c52fd212 RISC-V: KVM: Flush VS-stage =
TLB after VCPU migration for Andes cores)
Merging kvm-x86/next (9448598b22c5 Linux 6.19-rc2)
Merging xen-tip/linux-next (e5aff444e3a7 x86/xen: Fix sparse warning in enl=
ighten_pv.c)
Merging percpu/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging workqueues/for-next (51cd2d2decf3 workqueue: Process extra works in=
 rescuer on memory pressure)
Merging sched-ext/for-next (752c55515013 Merge branch 'for-6.19-fixes' into=
 for-next)
Merging drivers-x86/for-next (7b0a51955b0e platform/x86/intel/uncore-freq: =
Replace sprintf() with sysfs_emit())
Merging chrome-platform/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging chrome-platform-firmware/for-firmware-next (8f0b4cce4481 Linux 6.19=
-rc1)
Merging hsi/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging leds-lj/for-leds-next (8856d7fe1758 leds: as3668: Driver for the am=
s Osram 4-channel i2c LED driver)
Merging ipmi/for-next (35bcedc1a793 MAINTAINERS: Add entry on Loongson-2K I=
PMI driver)
Merging driver-core/driver-core-next (7bf97992afa4 Merge tag 'v6.19-rc3' in=
to driver-core-next)
CONFLICT (content): Merge conflict in rust/kernel/device.rs
Merging usb/usb-next (e46bcc4e856e Merge 6.19-rc3 into usb-next)
Merging thunderbolt/next (062191adfde0 thunderbolt: Log path activation fai=
lures without WARN backtraces)
Merging usb-serial/usb-next (8f0b4cce4481 Linux 6.19-rc1)
Merging tty/tty-next (322fc12949d2 Merge 6.19-rc3 into tty-next)
Merging char-misc/char-misc-next (8314d2c28d33 misc: fastrpc: Update dma_bi=
ts for CDSP support on Kaanapali SoC)
Merging coresight/next (98baf887b1e9 coresight: tpda: Fix intendation for s=
ysfs interface documentation)
Merging fastrpc/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging fpga/for-next (267f53140c9d fpga: dfl: use subsys_initcall to allow=
 built-in drivers to be added)
Merging icc/icc-next (a305df4125d1 MAINTAINERS: Add interconnect-clk.h to i=
nterconnect API entry)
Merging iio/togreg (f9e057916428 staging: iio: adt7316: replace sprintf() w=
ith sysfs_emit())
Merging phy-next/next (add66a6673bc phy: qcom: edp: Add Glymur platform sup=
port)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/phy=
/qcom,sc8280xp-qmp-pcie-phy.yaml
Merging soundwire/next (dc3a6a942e9e soundwire: intel_ace2x: add SND_HDA_CO=
RE dependency)
CONFLICT (content): Merge conflict in sound/soc/codecs/wcd939x-sdw.c
Merging extcon/extcon-next (b4338338aa3d extcon: usbc-tusb320: Make typec-p=
ower-opmode optional)
Merging gnss/gnss-next (8f0b4cce4481 Linux 6.19-rc1)
Merging vfio/next (d721f52e3155 vfio: selftests: Add vfio_pci_device_init_p=
erf_test)
Merging w1/for-next (cc8f92e41eb7 w1: fix redundant counter decrement in w1=
_attach_slave_device())
Merging spmi/spmi-next (8f0b4cce4481 Linux 6.19-rc1)
Merging staging/staging-next (5d2905f2c6ac staging: greybus: Remove complet=
ed PWM TODO item.)
Merging counter-next/counter-next (ad415677b7e3 MAINTAINERS: Update Intel Q=
uadrature Encoder Peripheral maintainer)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (8049f77fd820 dmaengine: pl08x: Fix comment stating =
the difference between PL080 and PL081)
Merging cgroup/for-next (60ba42e4d7c6 Merge branch 'for-6.20' into for-next)
Merging scsi/for-next (98bcf5e5ddfd Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (ae62d62b1c74 scsi: target: Constify struct confi=
gfs_item_operations and configfs_group_operations)
Merging vhost/linux-next (57ca0f8c1bb7 checkpatch: special-case cacheline g=
roup macros)
Merging rpmsg/for-next (1c1fd2eb1520 Merge branches 'rpmsg-next' and 'rproc=
-next' into for-next)
Merging gpio-brgl/gpio/for-next (da64eb51595b gpio: spacemit: Add GPIO supp=
ort for K3 SoC)
Merging gpio-intel/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging pinctrl/for-next (5ce864c2327b Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging pinctrl-renesas/renesas-pinctrl (3b0cf6ab3590 pinctrl: renesas: rzg=
2l: Refactor OEN register PWPR handling)
Merging pinctrl-samsung/for-next (9ce17ff1881f pinctrl: samsung: Add Exynos=
9610 pinctrl configuration)
Merging pwm/pwm/for-next (2d77a65c3657 pwm: Emit native configuration in /s=
ys/kernel/debug/pwm)
Merging ktest/for-next (d3042cbe84a0 ktest.pl: Fix uninitialized var in con=
fig-bisect.pl)
Merging kselftest/next (3e6ad272bb8b kselftest/kublk: include message in _S=
tatic_assert for C11 compatibility)
Merging kunit/test (8f0b4cce4481 Linux 6.19-rc1)
Merging kunit-next/kunit (f126d688193b kunit: tool: test: Don't rely on imp=
licit working directory change)
Merging livepatching/for-next (51ab33fc0a8b Merge tag 'livepatching-for-6.1=
9' of git://git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepatchi=
ng)
Merging rtc/rtc-next (16bd954c9336 rtc: spacemit: MFD_SPACEMIT_P1 as depend=
encies)
Merging nvdimm/libnvdimm-for-next (30065e73d7c0 nvdimm: Prevent integer ove=
rflow in ramdax_get_config_data())
Merging at24/at24/for-next (7a29af24b288 eeprom: at24: use dev_err_probe() =
consistently)
Merging ntb/ntb-next (68113d260674 NTB/msi: Remove unused functions)
Merging seccomp/for-next/seccomp (7d0a66e4bb90 Linux 6.18)
Merging slimbus/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging nvmem/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging xarray/main (863810caeb3c XArray: Add CONFIG_DEBUG_XARRAY)
Merging hyperv/hyperv-next (8f0b4cce4481 Linux 6.19-rc1)
Merging auxdisplay/for-next (b5c23a4d291d auxdisplay: arm-charlcd: fix rele=
ase_mem_region() size)
Merging kgdb/kgdb/for-next (fdbdd0ccb30a kdb: remove redundant check for sc=
ancode 0xe0)
Merging hmm/hmm (19272b37aa4f Linux 6.16-rc1)
Merging cfi/cfi/next (3a8660878839 Linux 6.18-rc1)
Merging mhi/mhi-next (91a0b0dce350 bus: mhi: ep: Use bus callbacks for .pro=
be() and .remove())
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/mhi.c
Applying: fix up for "net: qrtr: Drop the MHI auto_queue feature for IPCR D=
L channels"
Merging memblock/for-next (56b680254ce0 mm/memtest: add underflow detection=
 for size calculation)
Merging cxl/next (fa19611f96fd Documentation/driver-api/cxl: device hotplug=
 section)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (c5a8f13f1e47 efi: Support EDID information)
Merging unicode/for-next (bcfee135d584 utf8: Remove unused utf8_normalize)
Merging slab/slab/for-next (3061d1fe11e7 Merge remote-tracking branch 'korg=
slab/slab/for-7.0/obj_metadata' into slab/for-next)
Merging random/master (bb9ff576fdff virt: vmgenid: remap memory as decrypte=
d)
Merging landlock/next (ef4536f15224 landlock: Improve the comment for domai=
n_is_scoped)
Merging sysctl/sysctl-next (d174174c6776 sysctl: replace SYSCTL_INT_CONV_CU=
STOM macro with functions)
Merging execve/for-next/execve (7d0a66e4bb90 Linux 6.18)
Merging bitmap/bitmap-for-next (c24ea7e6efc8 rust: bitops: fix missing _fin=
d_* functions on 32-bit ARM)
Merging hte/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging kspp/for-next/kspp (7454048db27d kbuild: Enable GCC diagnostic cont=
ext for value-tracking warnings)
Merging nolibc/for-next (6b6dbf3e4ecf selftests/nolibc: always build sparc3=
2 tests with -mcpu=3Dv8)
Merging iommufd/for-next (f8f9c1f4d0c7 Linux 6.19-rc3)
Merging turbostat/next (83a899f345d4 tools/power turbostat.8: Document the =
"--force" option)
Merging pwrseq/pwrseq/for-next (0eb85f468ef5 power: sequencing: qcom-wcn: a=
dd support for WCN39xx)
Merging capabilities-next/caps-next (cf06f7167cbc security: Add KUnit tests=
 for kuid_root_in_ns and vfsuid_root_in_currentns)
Merging ipe/next (7d0a66e4bb90 Linux 6.18)
Merging kcsan/next (dcb6fa37fd7b Linux 6.18-rc3)
Merging crc/crc-next (dcb6fa37fd7b Linux 6.18-rc3)
Merging fwctl/for-next (f8f9c1f4d0c7 Linux 6.19-rc3)
Merging devsec-tsm/next (7dfbe9a67519 crypto/ccp: Fix CONFIG_PCI=3Dn build)
Merging hisilicon/for-next (6c177775dcc5 Merge branch 'next/drivers' into f=
or-next)
Merging kthread/for-next (811e87ca8a0a doc: Add housekeeping documentation)

--Sig_/lghkens/.B_._NZb1HORREh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlfHkgACgkQAVBC80lX
0GzYUAf/V0gS8uQqwiCSYTIqO9qj32gnrA0jDP4LwIkFmVK5VOw5jEah+3LNQXQF
a5/xv+cL3dqf88mRuSGYYufnSZWlRwnmT9hcjGhXK28mNAegjY+9vPS5Q5UP7GyS
Ud5jr24f4exsA5p2LkYE26z6KOdcGrAILSZaBfSrF2BZpXNVoa1I/RNLl8r6g+gg
C+gF9g1A7QZGX8jzSF9FUFGsdCJwHRw9v/7tWVymLBOy/OlRNRJtd4Ak9VZXvjMV
WxQHHPbzNf6o+oQzd45G8xgpQQJ3jXvjaPKZueH8Tv6kQJjUcXDeo6dCJAJK66tl
4I1Z1oyRigtyYtpv2l0J8Vk45FCWPw==
=+wqJ
-----END PGP SIGNATURE-----

--Sig_/lghkens/.B_._NZb1HORREh--

