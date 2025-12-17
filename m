Return-Path: <linux-next+bounces-9436-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F877CC5E17
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 04:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3CA93017645
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 03:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DABF21E0AD;
	Wed, 17 Dec 2025 03:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TvmUdF7Q"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AC1256D;
	Wed, 17 Dec 2025 03:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765941413; cv=none; b=oT8jrKrbmaXlKMgEMkcPYx4eD/L3tCVtn3qE/rHOPbFH/8BRNr+KzPHDs1DaW6kcREeeMcjGPdHFcXMmVcQSvFhPts18Lh0/urjaJsSTg0JC9wk8tPMIqK7pgZFnL9VHbwQ2ry7q0Ufg0uRgNXVGzdKib72Bv7FMbLZyKSeEAvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765941413; c=relaxed/simple;
	bh=THy0bq0fIlg2DK1LLaQI+TE8noSu7tuwp+tmmkw9Nyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WD+L0Oaa18Y9/X5ShDj3iIUcvoz0wsCbkZ1lJLkCyeftOh1O9I1exx+7yCKCcG0eHdT/c/rIgA0unofNM5a/sgRDpaoVne5ncd4VikQkV5ipKrk3AHc0UvCKnAUa0pYRIz/Olo2iZPd0XR0ePi99QEwIN6teHtZj0/BwrxwZCJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TvmUdF7Q; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1765941398;
	bh=pV5HjuH2ZG6pZ8z0yPJZZutB1RBhktl05pKd8phuw3U=;
	h=Date:From:To:Cc:Subject:From;
	b=TvmUdF7Q4twddGdA8LLeRzV22soC0BCZ/Q6m2A/gtt3I0/N2rPkLVC2WHdZwZG38i
	 4/Pc/sl/fSgLe9AixfuFmDgoyQ/vpn5Tthtl2ZYwOOgzem/LA3bHkWdpwu5RrD+A1f
	 iNfOHvlhLG/zdV6Fc0FQD11XsTF5+1UqAQvwnjuy/VlICYpPEbbmnDgfj75VidLi1Z
	 IwBJqICtev/KFbxkkADkQcAcQ/RDT0pTzTsKs0953as6lXxa3DA0LkWzFiXGOGSf8r
	 T/AH8y/dtnVAX8VyBgek2hZK09DDWK5HGNkyHgXIOEoyLzOGmu7YtQBnHmNn1B/veA
	 Br9Rg7PhV1cNg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dWJqV0WzTz4w0H;
	Wed, 17 Dec 2025 14:16:38 +1100 (AEDT)
Date: Wed, 17 Dec 2025 14:16:36 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Dec 17
Message-ID: <20251217141636.308ab7f9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+qQJTHklHiNePhwf+94=0cB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+qQJTHklHiNePhwf+94=0cB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20251216:

Removed tree:	soix	it has not bee updated in a long time

Non-merge commits (relative to Linus' tree): 1632
 1930 files changed, 129189 insertions(+), 23195 deletions(-)

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

I am currently merging 404 trees (counting Linus' and 121 trees of bug
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
Merging origin/master (40fbbd64bba6 Merge tag 'pull-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging ext4-fixes/fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging vfs-brauner-fixes/vfs.fixes (24835a96f21e Merge patch series "filel=
ock: fix conflict detection with userland file delegations")
Merging fscrypt-current/for-current (1e39da974ce6 fscrypt: fix left shift u=
nderflow when inode->i_blkbits > PAGE_SHIFT)
Merging fsverity-current/for-current (211ddde0823f Linux 6.18-rc2)
Merging btrfs-fixes/next-fixes (7022153234af Merge branch 'misc-6.19' into =
next-fixes)
Merging vfs-fixes/fixes (e1b4c6a58304 shmem: fix recovery on rename failure=
s)
Merging erofs-fixes/fixes (f2a12cc3b97f erofs: avoid infinite loop due to i=
ncomplete zstd-compressed data)
Merging nfsd-fixes/nfsd-fixes (ebae102897e7 nfsd: Mark variable __maybe_unu=
sed to avoid W=3D1 build break)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (e8bd877fb76b ovl: fix possible double un=
link)
Merging fscrypt/for-next (211ddde0823f Linux 6.18-rc2)
Merging btrfs/for-next (bb356a85add8 Merge branch 'for-next-next-v6.19-2025=
1216' into for-next-20251216)
Merging ceph/master (375068b6c206 libceph: prevent potential out-of-bounds =
reads in handle_auth_done())
Merging cifs/for-next (0f58d4a23d6b cifs: update internal module version nu=
mber)
Merging configfs/configfs-next (f7f78098690d configfs: Constify ct_item_ops=
 in struct config_item_type)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (8e4021078863 dlm: check for undefined release_option valu=
es)
Merging erofs/dev (e68e6eb58221 erofs: make z_erofs_crypto[] static)
Merging exfat/dev (f5a5c9b40490 fs: exfat: improve error code handling in e=
xfat_find_empty_entry())
Merging ext3/for_next (6f7c877cc397 fs: send fsnotify_xattr()/IN_ATTRIB fro=
m vfs_fileattr_set()/chattr(1))
Merging ext4/dev (6fb67ac89690 ext4: drop the TODO comment in ext4_es_inser=
t_extent())
Merging f2fs/dev (4a210a5be279 f2fs: improve check for enough free sections)
Merging fsverity/for-next (211ddde0823f Linux 6.18-rc2)
Merging fuse/for-next (8da059f2a497 fuse: Uninitialized variable in fuse_ep=
och_work())
Merging gfs2/for-next (02e96fafcb36 gfs2: Fix slab-use-after-free in qd_put)
Merging jfs/jfs-next (eb0cfcf26571 jfs: Add missing set_freezable() for fre=
ezable kthread)
Merging ksmbd/ksmbd-for-next (53ec4a79ff4b Merge tag 'v6.19-rc1-ksmbd-serve=
r-fixes' of git://git.samba.org/ksmbd)
Merging nfs/linux-next (bd3b04b46c7a NFSv4: Handle NFS4ERR_NOTSUPP errors f=
or directory delegations)
Merging nfs-anna/linux-next (b623390045a8 NFS: Fix LTP test failures when t=
imestamps are delegated)
Merging nfsd/nfsd-next (8f0b4cce4481 Linux 6.19-rc1)
Merging ntfs3/master (8f0b4cce4481 Linux 6.19-rc1)
Merging orangefs/for-next (11f6bce77e27 fs/orangefs: Replace kzalloc + copy=
_from_user with memdup_user_nul)
Merging overlayfs/overlayfs-next (ad1423922781 ovl: make sure that ovl_crea=
te_real() returns a hashed dentry)
Merging ubifs/next (0695aef23d67 ubifs: vmalloc(array_size()) -> vmalloc_ar=
ray())
Merging v9fs/9p-next (3e281113f871 9p: fix new mount API cache option handl=
ing)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging zonefs/for-next (a42938e80357 zonefs: correct some spelling mistake=
s)
Merging vfs-brauner/vfs.all (981be27a72d1 Merge branch 'vfs-7.0.atomic_open=
' into vfs.all)
Merging vfs/for-next (eb028c33451a d_make_discardable(): warn if given a no=
n-persistent dentry)
Merging mm-hotfixes/mm-hotfixes-unstable (59cdd320b56a tools/mm/page_owner_=
sort: fix timestamp comparison for stable sorting)
Merging fs-current (200fb2d1e161 Merge branch 'nfsd-fixes' of https://git.k=
ernel.org/pub/scm/linux/kernel/git/cel/linux)
Merging kbuild-current/kbuild-fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging arc-current/for-curr (d7b8f8e20813 Linux 6.16-rc5)
Merging arm-current/fixes (fd2dee1c6e22 ARM: fix branch predictor hardening)
Merging arm64-fixes/for-next/fixes (98a97bf41528 arm64/gcs: Flush the GCS l=
ocking state on exec)
Merging arm-soc-fixes/arm/fixes (ececfba255bf ARM: dts: ixp4xx: Fix up Acti=
ontec MI424WR DTS files)
Merging davinci-current/davinci/for-current (8f0b4cce4481 Linux 6.19-rc1)
Merging drivers-memory-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging sophgo-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging sophgo-soc-fixes/soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging m68k-current/for-linus (aaf4e92341b0 m68k: defconfig: Update defcon=
figs for v6.18-rc1)
Merging powerpc-fixes/fixes (0843ba458439 powerpc/fadump: skip parameter ar=
ea allocation when fadump is disabled)
Merging s390-fixes/fixes (489e96651dfe s390/stacktrace: Do not fallback to =
RA register)
Merging net/main (885bebac9909 nfc: pn533: Fix error code in pn533_acr122_p=
oweron_rdr())
Merging bpf/master (1d528e794f3d Merge branch 'bpf-fix-bpf_d_path-helper-pr=
ototype')
Merging ipsec/master (3d5221af9c77 xfrm: Fix inner mode lookup in tunnel mo=
de GSO segmentation)
Merging netfilter/main (885bebac9909 nfc: pn533: Fix error code in pn533_ac=
r122_poweron_rdr())
Merging ipvs/main (de0337d641bf net: ionic: map SKB after pseudo-header che=
cksum prep)
Merging wireless/for-next (81d90d93d22c wifi: iwlwifi: Implement settime64 =
as stub for MVM/MLD PTP)
Merging ath/for-current (d0309c054362 Merge tag 'net-6.18-rc6' of git://git=
.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging iwlwifi/fixes (8943c0146834 wifi: iwlwifi: Implement settime64 as s=
tub for MVM/MLD PTP)
  8943c0146834 ("wifi: iwlwifi: Implement settime64 as stub for MVM/MLD PTP=
")
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (8f0b4cce4481 Linux 6.19-rc1)
Merging sound-current/for-linus (5032347c04ba ALSA: pcmcia: Fix resource le=
ak in snd_pdacf_probe error path)
Merging sound-asoc-fixes/for-linus (e3b88652b66b ASoC: Intel: common / SOF:=
 Use function topologies for)
Merging regmap-fixes/for-linus (5eb484d5b2ac Merge remote-tracking branch '=
regmap/for-6.18' into regmap-linus)
Merging regulator-fixes/for-linus (8f0b4cce4481 Linux 6.19-rc1)
Merging spi-fixes/for-linus (1417927df804 spi: fsl-cpm: Check length parity=
 before switching to 16 bit mode)
Merging pci-current/for-linus (94bf74830a97 PCI: rzg3s-host: Initialize MSI=
 status bitmap before use)
Merging driver-core.current/driver-core-linus (d8932355f8c5 rust: dma: add =
helpers for architectures without CONFIG_HAS_DMA)
Merging tty.current/tty-linus (d358e5254674 Merge tag 'for-6.19/dm-changes'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging usb.current/usb-linus (d358e5254674 Merge tag 'for-6.19/dm-changes'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging usb-serial-fixes/usb-linus (8f0b4cce4481 Linux 6.19-rc1)
Merging phy/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging staging.current/staging-linus (d358e5254674 Merge tag 'for-6.19/dm-=
changes' of git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/lin=
ux-dm)
Merging iio-fixes/fixes-togreg (74f97a468356 iio: adc: at91-sama5d2_adc: Fi=
x potential use-after-free in sama5d2_adc driver)
Merging counter-current/counter-current (109ff654934a counter: microchip-tc=
b-capture: Allow shared IRQ for multi-channel TCBs)
Merging char-misc.current/char-misc-linus (d358e5254674 Merge tag 'for-6.19=
/dm-changes' of git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper=
/linux-dm)
Merging soundwire-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging thunderbolt-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging input-current/for-linus (aed3716db7ff Input: i8042 - add TUXEDO Inf=
inityBook Max Gen10 AMD to i8042 quirk table)
Merging crypto-current/master (48bc9da3c97c crypto: zstd - fix double-free =
in per-CPU stream cleanup)
Merging libcrypto-fixes/libcrypto-fixes (5a0b18825068 lib/crypto: riscv: Ad=
d poly1305-core.S to .gitignore)
Merging vfio-fixes/for-linus (d323ad739666 vfio: selftests: replace iova=3D=
vaddr with allocated iovas)
Merging kselftest-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging dmaengine-fixes/fixes (747213b08a1a dmaengine: sh: rz-dmac: Fix rz_=
dmac_terminate_all())
Merging backlight-fixes/for-backlight-fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging mtd-fixes/mtd/fixes (2f6d2c8d9ac0 Revert "mtd: spinand: esmt: fix i=
d code for F50D1G41LB")
Merging mfd-fixes/for-mfd-fixes (aa6e63373d91 mfd: ls2kbmc: Use PCI API ins=
tead of direct accesses)
Merging v4l-dvb-fixes/fixes (27afd6e066cf media: videobuf2: forbid remove_b=
ufs when legacy fileio is active)
Merging reset-fixes/reset/fixes (997c06330fd5 reset: imx8mp-audiomix: Fix b=
ad mask values)
Merging mips-fixes/mips-fixes (680ad315caaa MIPS: Fix a reference leak bug =
in ip22_check_gio())
Merging at91-fixes/at91-fixes (3a8660878839 Linux 6.18-rc1)
Merging omap-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging kvm-fixes/master (32bd348be3fa KVM: Fix last_boosted_vcpu index ass=
ignment bug)
Merging kvms390-fixes/master (5f9df945d4e8 KVM: s390: Fix FOLL_*/FAULT_FLAG=
_* confusion)
Merging hwmon-fixes/hwmon (82f2aab35a1a hwmon: (tmp401) fix overflow caused=
 by default conversion rate value)
Merging nvdimm-fixes/libnvdimm-fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging cxl-fixes/fixes (214291cbaace acpi/hmat: Fix lockdep warning for hm=
em_register_resource())
Merging dma-mapping-fixes/dma-mapping-fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging drivers-x86-fixes/fixes (4dcb6e4af15b platform/x86/uniwill: Add TUX=
EDO Book BA15 Gen10)
Merging samsung-krzk-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging pinctrl-samsung-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging devicetree-fixes/dt/linus (54de247a0efa dt-bindings: Updates Linus =
Walleij's mail address)
Merging dt-krzk-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging scsi-fixes/fixes (90449f2d1e1f scsi: sg: Do not sleep in atomic con=
text)
Merging drm-fixes/drm-fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging drm-intel-fixes/for-linux-next-fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging mmc-fixes/fixes (ed724ea1b82a dt-bindings: mmc: sdhci-of-aspeed: Sw=
itch ref to sdhci-common.yaml)
Merging rtc-fixes/rtc-fixes (162f24cbb0f6 rtc: rx8025: fix incorrect regist=
er reference)
Merging gnss-fixes/gnss-linus (8f0b4cce4481 Linux 6.19-rc1)
Merging hyperv-fixes/hyperv-fixes (8f9cee9fb521 mshv: Move function prototy=
pes to the generic header)
Merging risc-v-fixes/fixes (e2285bd4a467 riscv: fix KUnit test_kprobes cras=
h when building with Clang)
Merging riscv-dt-fixes/riscv-dt-fixes (5ef13c363640 riscv: dts: microchip: =
remove BeagleV Fire fabric.dtsi)
Merging riscv-soc-fixes/riscv-soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging spdx/spdx-linus (d358e5254674 Merge tag 'for-6.19/dm-changes' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging gpio-brgl-fixes/gpio/for-current (8f0b4cce4481 Linux 6.19-rc1)
Merging gpio-intel-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging pinctrl-intel-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging auxdisplay-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging kunit-fixes/kunit-fixes (c33b68801fbe kunit: make FAULT_TEST defaul=
t to n when PANIC_ON_OOPS)
Merging memblock-fixes/fixes (c42af83c59b6 memblock: fix memblock_estimated=
_nr_free_pages() for soft-reserved memory)
Merging renesas-fixes/fixes (379c590113ce ARM: shmobile: smp: Enforce shmob=
ile_smp_* alignment)
Merging perf-current/perf-tools (8f97be2fc63e perf tools: Disable BPF skele=
ton if no libopenssl found)
Merging efi-fixes/urgent (e5f0a698b34e Linux 6.17)
Merging battery-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging iommufd-fixes/for-rc (b07bf253ef8e iommufd/iommufd_private.h: Avoid=
 -Wflex-array-member-not-at-end warning)
Merging rust-fixes/rust-fixes (559e608c4655 Merge tag 'ntfs3_for_6.19' of h=
ttps://github.com/Paragon-Software-Group/linux-ntfs3)
Merging w1-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging pmdomain-fixes/fixes (c98c99d5dbdf pmdomain: tegra: Add GENPD_FLAG_=
NO_STAY_ON flag)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (3c493b524ffd Merge tag 'sunxi-clk-fixes-for-6.=
18' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into clk=
-fixes)
Merging thead-clk-fixes/thead-clk-fixes (3a8660878839 Linux 6.18-rc1)
Merging pwrseq-fixes/pwrseq/for-current (8f0b4cce4481 Linux 6.19-rc1)
Merging thead-dt-fixes/thead-dt-fixes (3a8660878839 Linux 6.18-rc1)
Merging ftrace-fixes/ftrace/fixes (1650a1b6cb1a fgraph: Check ftrace_pids_e=
nabled on registration for early filtering)
Merging ring-buffer-fixes/ring-buffer/fixes (b042fdf18e89 tracing: Fix WARN=
_ON in tracing_buffers_mmap_close for split VMAs)
Merging trace-fixes/trace/fixes (2c22361ab628 MAINTAINERS: Add tracepoint-u=
pdate.c to TRACING section)
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging tip-fixes/tip/urgent (3f7ffffcde59 Merge branch into tip/master: 'x=
86/urgent')
Merging slab-fixes/slab/for-next-fixes (53ca00a19d34 mm/slub: reset KASAN t=
ag in defer_free() before accessing freed memory)
Merging drm-msm-fixes/msm-fixes (f5d079564c44 drm/msm/dpu: Fix adjusted mod=
e clock check for 3d merge)
Merging uml-fixes/fixes (df447a3b4a4b um: Fix FD copy size in os_rcv_fd_msg=
())
Merging fwctl-fixes/for-rc (211ddde0823f Linux 6.18-rc2)
Merging devsec-tsm-fixes/fixes (fba4ceaa242d configfs-tsm-report: Fix NULL =
dereference of tsm_ops)
Merging drm-rust-fixes/drm-rust-fixes (b58c87b0fde0 gpu: nova-core: gsp: re=
place firmware version with "bindings" alias)
Merging tenstorrent-dt-fixes/tenstorrent-dt-fixes (3a8660878839 Linux 6.18-=
rc1)
Merging drm-misc-fixes/for-linux-next-fixes (2bfca4fe1f36 drm/panel: vision=
ox-rm69299: Depend on BACKLIGHT_CLASS_DEVICE)
Merging rust/rust-next (559e608c4655 Merge tag 'ntfs3_for_6.19' of https://=
github.com/Paragon-Software-Group/linux-ntfs3)
Merging rust-alloc/alloc-next (8f0b4cce4481 Linux 6.19-rc1)
Merging rust-io/io-next (86731a2a651e Linux 6.16-rc3)
Merging rust-pin-init/pin-init-next (42415d163e5d rust: pin-init: add refer=
ences to previously initialized fields)
Merging rust-timekeeping/timekeeping-next (4521438fb076 rust: time: Impleme=
nt basic arithmetic operations for Delta)
Merging rust-xarray/xarray-next (fa616196fbea MAINTAINERS: add entry for Ru=
st XArray API)
Merging mm-stable/mm-stable (8f0b4cce4481 Linux 6.19-rc1)
Merging mm-nonmm-stable/mm-nonmm-stable (8f0b4cce4481 Linux 6.19-rc1)
Merging mm-unstable/mm-unstable (57248cf62cf4 mm/damon/core: fix memory lea=
k of repeat mode damon_call_control objects)
Merging mm-nonmm-unstable/mm-nonmm-unstable (4c74f3f64094 hung_task: enable=
 runtime reset of hung_task_detect_count)
Merging kbuild/kbuild-next (a4df2071f1a2 modpost: drop '*_probe' from secti=
on check whitelist)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (cb015814f8b6 Merge tag 'f2fs-for-6.19-rc1' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging asm-generic/master (edcc8a38b5ac once: fix race by moving DO_ONCE t=
o separate section)
Merging alpha/alpha-next (d58041d2c63e MAINTAINERS: Add Magnus Lindholm as =
maintainer for alpha port)
Merging arm/for-next (dd9143371a86 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (edde060637b9 Merge branch 'for-next/set_memory=
' into for-next/core)
Merging arm-perf/for-next/perf (e6a27290d800 perf: arm_spe: Add support for=
 filtering on data source)
Merging arm-soc/for-next (e5b2299997d3 soc: document merges)
Merging amlogic/for-next (3b2ecf0c3cc3 Merge branch 'v6.19/drivers' into fo=
r-next)
Merging asahi-soc/asahi-soc/for-next (074986379c03 Merge branch 'apple-soc/=
dt-6.20' into asahi-soc/for-next)
Merging at91/at91-next (fde90d654751 Merge branch 'at91-dt' into at91-next)
Merging bmc/for-next (e0808393bf81 ARM: dts: aspeed: g6: Drop clocks proper=
ty from arm,armv7-timer)
Merging broadcom/next (37c3a91e9730 arm64: dts: broadcom: bcm2712: Add watc=
hdog DT node)
Merging cix/for-next (4889f68b824d Merge remote-tracking branch 'cix/dt' in=
to for-next)
Merging davinci/davinci/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging drivers-memory/for-next (78da7027e2a9 memory: mtk-smi: clean up dev=
ice link creation)
Merging fsl/soc_fsl (c8dff80a3108 bus: fsl-mc: Convert to bus callbacks)
Merging imx-mxs/for-next (89d95dbad2a3 Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (67ed5843a67b Merge branch 'v6.18-next/dts64' int=
o for-next)
Merging mvebu/for-next (f0e6bc0c3ef4 clk: mvebu: cp110 add CLK_IGNORE_UNUSE=
D to pcie_x10, pcie_x11 & pcie_x4)
Merging omap/for-next (2c85858e7c68 Merge branch 'omap-for-v6.19/drivers' i=
nto tmp/omap-next-20251117.085514)
Merging qcom/for-next (82ed018b3df9 Merge branches 'arm32-fixes-for-6.19', =
'arm64-defconfig-for-6.19', 'arm64-fixes-for-6.19', 'clk-for-6.19' and 'dri=
vers-for-6.19' into for-next)
Merging renesas/next (fec0b9c25cfb Merge branches 'renesas-arm-defconfig-fo=
r-v6.20' and 'renesas-dts-for-v6.20' into renesas-next)
Merging reset/reset/next (a0d57f7504b6 reset: gpio: add the "compatible" pr=
operty)
Merging rockchip/for-next (4a4070c80fe6 Merge branch 'v6.20-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (cb4cfbcf2764 Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (b324cdbf7f34 Merge branches 'for-next/juno/upd=
ates', 'for-next/ffa/updates' and 'for-next/scmi/updates' of ssh://gitolite=
.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-linux-next)
Merging sophgo/for-next (c7f013d4c8c0 Merge branch 'dt/riscv' into for-next)
Merging sophgo-soc/soc-for-next (c8754c7deab4 soc: sophgo: cv1800: rtcsys: =
New driver (handling RTC only))
Merging spacemit/for-next (5a97a38c2279 riscv: dts: spacemit: define all mi=
ssing I2C controller nodes)
Merging stm32/stm32-next (a6961e2ced51 arm64: dts: st: set RIFSC as an acce=
ss controller on stm32mp21x platforms)
Merging sunxi/sunxi/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging tee/next (eb4bb32c8117 Merge branch 'qcomtee_fixes_for_6.18' into n=
ext)
Merging tegra/for-next (e016a50e00e6 Merge branch for-6.19/arm64/defconfig =
into for-next)
Merging tenstorrent-dt/tenstorrent-dt-for-next (a71e6e8eea8a riscv: defconf=
ig: Enable Tenstorrent SoCs)
Merging thead-dt/thead-dt-for-next (d8a174babf64 riscv: dts: thead: Add res=
et controllers of more subsystems for TH1520)
Merging ti/ti-next (109d58039d30 Merge branch 'ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (43da9849395e Merge remote-tracking branch 'git/zyn=
qmp/dt' into for-next)
Merging clk/clk-next (6f172175b6f3 Merge branches 'clk-visconti', 'clk-imx'=
, 'clk-microchip', 'clk-rockchip' and 'clk-qcom' into clk-next)
Merging clk-imx/for-next (fdc1dc7dd53b clk: imx: add driver for imx8ulp's s=
im lpav)
Merging clk-renesas/renesas-clk (d8921e42a198 clk: renesas: r9a09g056: Add =
entries for the RSPIs)
Merging thead-clk/thead-clk-for-next (3a8660878839 Linux 6.18-rc1)
Merging csky/linux-next (817d21578d51 csky: Remove compile warning for CONF=
IG_SMP)
Merging loongarch/loongarch-next (be77cf43d2fd LoongArch: Adjust default co=
nfig files for 32BIT/64BIT)
Merging m68k/for-next (aaf4e92341b0 m68k: defconfig: Update defconfigs for =
v6.18-rc1)
Merging m68knommu/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging microblaze/next (8f0b4cce4481 Linux 6.19-rc1)
Merging mips/mips-next (8f0b4cce4481 Linux 6.19-rc1)
Merging openrisc/for-next (8c30b0018f9d openrisc: Add jump label support)
Merging parisc-hd/for-next (7d0a66e4bb90 Linux 6.18)
Merging powerpc/next (9b36c7fc5aa5 macintosh/via-pmu-backlight: Include <li=
nux/fb.h> and <linux/of.h>)
Merging risc-v/for-next (7e40c6791cc8 kselftest/riscv: add kselftest for us=
er mode cfi)
CONFLICT (content): Merge conflict in arch/riscv/include/asm/hwcap.h
CONFLICT (content): Merge conflict in include/linux/mm.h
Merging riscv-dt/riscv-dt-for-next (a4aad736716d riscv: dts: microchip: con=
vert clock and reset to use syscon)
Merging riscv-soc/riscv-soc-for-next (719362b8a972 Merge branch 'riscv-cach=
e-for-next' into riscv-soc-for-next)
Merging s390/for-next (46034da07381 Merge branch 'fixes' into for-next)
Merging sh/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging sparc/for-next (fe0126702a40 sparc: Replace deprecated strcpy() wit=
h strscpy() in handle_nextprop_quirks())
Merging uml/next (a3209bb94b36 um: Disable KASAN_INLINE when STATIC_LINK is=
 selected)
Merging xtensa/xtensa-for-next (0d4b3ca115b5 xtensa: align: validate access=
 in fast_load_store)
Merging fs-next (27d4c363b4c5 Merge branch 'vfs.all' of https://git.kernel.=
org/pub/scm/linux/kernel/git/vfs/vfs.git)
Merging printk/for-next (34793812e592 Merge branch 'rework/atomic-flush-sof=
tlockup' into for-next)
Merging pci/next (43dfc13ca972 Merge tag 'pci-v6.19-changes' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/pci/pci)
Merging pstore/for-next/pstore (b69255357368 pstore/ram: Update module para=
meters from platform data)
Merging hid/for-next (1c772200c9dc Merge branch 'for-6.18/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (d202341d9b0c i2c: qcom-cci: Add msm8953 compatibl=
e)
Merging i2c-host/i2c/i2c-host (6a2817432628 i2c: designware: Add dedicated =
algorithm for AMD NAVI)
Merging i3c/i3c/next (136209e6bd98 i3c: adi: Fix confusing cleanup.h syntax)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (c6bb982894b5 hwmon: (sht3x) add support f=
or SHT85)
Merging jc_docs/docs-next (464257baf992 docs: makefile: move rustdoc check =
to the build wrapper)
Merging v4l-dvb/next (8f0b4cce4481 Linux 6.19-rc1)
Merging v4l-dvb-next/master (adc218676eef Linux 6.12)
Merging pm/linux-next (b8362c590109 Merge branch 'acpi-bus' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (f98c414030d2 dt-bindings: cpufr=
eq: qcom-hw: document Milos CPUFREQ Hardware)
Merging cpupower/cpupower (ff72619e1134 tools/power cpupower: Show C0 in id=
le-info dump)
Merging devfreq/devfreq-next (d9600d57668c PM / devfreq: Fix typo in DFSO_D=
OWNDIFFERENTIAL macro name)
Merging pmdomain/next (1f67707fafa5 pmdomain: Merge branch fixes into next)
Merging opp/opp/linux-next (33ffb0aa8ce8 rust: opp: simplify callers of `to=
_c_str_array`)
Merging thermal/thermal/linux-next (c411d8bf0699 thermal/drivers/imx91: Add=
 support for i.MX91 thermal monitoring unit)
Merging rdma/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging net-next/main (8f7aa3d3c732 Merge tag 'net-next-6.19' of git://git.=
kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging bpf-next/for-next (835a50753579 selftests/bpf: Add -fms-extensions =
to bpf build flags)
Merging ipsec-next/master (8f7aa3d3c732 Merge tag 'net-next-6.19' of git://=
git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mlx5-next/mlx5-next (5422318e27d7 net/mlx5: Expose definition for 1=
600Gbps link mode)
Merging netfilter-next/main (8f7aa3d3c732 Merge tag 'net-next-6.19' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging ipvs-next/main (c9dfb92de073 Merge branch 'mlx5-next' of git://git.=
kernel.org/pub/scm/linux/kernel/git/mellanox/linux)
Merging bluetooth/master (3a7cf69ce3cf Bluetooth: btusb: revert use of devm=
_kzalloc in btusb)
Merging wireless-next/for-next (8f7aa3d3c732 Merge tag 'net-next-6.19' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging ath-next/for-next (c99ebb613259 Merge git://git.kernel.org/pub/scm/=
linux/kernel/git/netdev/net)
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
Merging crypto/master (48bc9da3c97c crypto: zstd - fix double-free in per-C=
PU stream cleanup)
Merging libcrypto/libcrypto-next (3f9f0252130e Merge tag 'random-6.19-rc1-f=
or-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/crng/random)
Merging drm/drm-next (8f0b4cce4481 Linux 6.19-rc1)
Merging drm-exynos/for-linux-next (3a8660878839 Linux 6.18-rc1)
Merging drm-misc/for-linux-next (af586cc6df0b drm/panel: simple: Add HannSt=
ar HSD156JUW2)
Merging amdgpu/drm-next (0a54edc19158 drm/radeon: Convert legacy DRM loggin=
g in evergreen.c to drm_* helpers)
Merging drm-intel/for-linux-next (d400dad620ab drm/i915/display: Allow asyn=
c flip when Selective Fetch is enabled)
Merging drm-msm/msm-next (7bc29d5fb6fa dt-bindings: display/msm/gmu: Add Ad=
reno X2-85 GMU)
Merging drm-msm-lumag/msm-next-lumag (e2f085ab8636 dt-bindings: display: ms=
m: sm6150-mdss: Fix example indentation and OPP values)
Merging drm-rust/drm-rust-next (60c7398bded2 rust: drm: add __rust_helper t=
o helpers)
Merging drm-nova/nova-next (93296e9d9528 gpu: nova-core: vbios: store refer=
ence to Device where relevant)
Merging drm-xe/drm-xe-next (2b277b506138 drm/xe: Add more GT stats around p=
agefault mode switch flows)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/tests/xe_mocs.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_ct.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_submit.c
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (7d0a66e4bb90 Linux 6.18)
Merging regmap/for-next (82845bc8d13c Merge branch 'regmap-linus' into regm=
ap-next)
Merging sound/for-next (ae0a0c45200c Merge branch 'for-linus' into for-next)
Merging ieee1394/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging sound-asoc/for-next (1dd886006507 Merge remote-tracking branch 'aso=
c/for-6.20' into asoc-next)
Merging modules/modules-next (1ddac5cd7f27 MAINTAINERS: Add myself as revie=
wer for module support)
Merging input/next (d79f302f2f98 dt-bindings: input: touchscreen: sitronix,=
st1232: Add Sitronix ST1624)
Merging block/for-next (48038aad40bf Merge branch 'block-6.19' into for-nex=
t)
Merging device-mapper/for-next (13ea55ea2017 dm pcache: fix segment info in=
dexing)
Merging libata/for-next (f474c70065e1 ata: libata: Allow more quirks)
Merging pcmcia/pcmcia-next (4a81f78caa53 pcmcia: Add error handling for add=
_interval() in do_validate_mem())
Merging mmc/next (0461da87d338 mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (44c603f35cad mfd: sec: Drop a stray semicolon)
Merging backlight/for-backlight-next (d3cc7cd7bc46 backlight: aw99706: Fix =
unused function warnings from suspend/resume ops)
Merging battery/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging regulator/for-next (2bb202416d33 Add support for MAX77675 device)
Merging security/next (1c0860d4415d lsm: fix kernel-doc struct member names)
Merging apparmor/apparmor-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging integrity/next-integrity (738c9738e690 ima: Handle error code retur=
ned by ima_filter_rule_match())
Merging selinux/next (8f0b4cce4481 Linux 6.19-rc1)
Merging smack/next (29c701f90b93 Smack: function parameter 'gfp' not descri=
bed)
Merging tomoyo/master (1a27fa6af955 RDMA/core: flush gid_cache_wq WQ from d=
isable_device())
Merging tpmdd/next (416f99c3b16f Merge tag 'driver-core-6.19-rc1' of git://=
git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core)
Merging watchdog/master (5bcc5786a0cf watchdog: starfive: Fix resource leak=
 in probe error path)
Merging iommu/next (0d081b16946e Merge branches 'arm/smmu/updates', 'arm/sm=
mu/bindings', 'mediatek', 'nvidia/tegra', 'intel/vt-d', 'amd/amd-vi' and 'c=
ore' into next)
Merging audit/next (15b0c43aa621 audit: include source and destination port=
s to NETFILTER_PKT)
Merging devicetree/for-next (da5497687d30 dt-bindings: firmware: xilinx: Ad=
d conditional pinctrl schema)
Merging dt-krzk/for-next (af8dbb881887 arm64: dts: toshiba: tmpv7708: Align=
 node names with DT bindings)
Merging mailbox/for-next (1ec6e0e8c0dd mailbox: mtk-cmdq: Add driver data t=
o support for MT8196)
Merging spi/for-next (5a6a1c7fa186 Merge remote-tracking branch 'spi/for-6.=
20' into spi-next)
Merging tip/master (eff801f5c2b8 Merge branch into tip/master: 'x86/cpu')
Merging clockevents/timers/drivers/next (d1780dce9575 clocksource/drivers: =
Add Realtek system timer driver)
Merging edac/edac-for-next (814b332921b6 Merge ras/edac-amd-atl into for-ne=
xt)
Merging ftrace/for-next (5a63f3faf656 Merge unused-tracepoints/for-next)
Merging rcu/next (9a08942f1701 Merge branch 'rcu/misc' into next)
Merging paulmck/non-rcu/next (7f8fcc6f09fb memory-barriers.txt: Sort wait_e=
vent* and wait_on_bit* list alphabetically)
Merging kvm/next (e0c26d47def7 Merge tag 'kvm-s390-next-6.19-1' of https://=
git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging kvm-arm/next (3eef0c83c3f3 Merge branch 'kvm-arm64/nv-xnx-haf' into=
 kvmarm/next)
Merging kvms390/next (2bd1337a1295 KVM: s390: Use generic VIRT_XFER_TO_GUES=
T_WORK functions)
Merging kvm-ppc/topic/ppc-kvm (c17b750b3ad9 Linux 6.17-rc2)
Merging kvm-riscv/riscv_kvm_next (3239c52fd212 RISC-V: KVM: Flush VS-stage =
TLB after VCPU migration for Andes cores)
Merging kvm-x86/next (58e10b63777d Merge branch 'fixes')
Merging xen-tip/linux-next (e5aff444e3a7 x86/xen: Fix sparse warning in enl=
ighten_pv.c)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (51cd2d2decf3 workqueue: Process extra works in=
 rescuer on memory pressure)
Merging sched-ext/for-next (b0101ccb5b46 sched_ext: fix uninitialized ret o=
n alloc_percpu() failure)
Merging drivers-x86/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging chrome-platform/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging chrome-platform-firmware/for-firmware-next (8f0b4cce4481 Linux 6.19=
-rc1)
Merging hsi/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging leds-lj/for-leds-next (072cd5f458d7 leds: rgb: leds-qcom-lpg: Don't=
 enable TRILED when configuring PWM)
Merging ipmi/for-next (35bcedc1a793 MAINTAINERS: Add entry on Loongson-2K I=
PMI driver)
Merging driver-core/driver-core-next (8f0b4cce4481 Linux 6.19-rc1)
Merging usb/usb-next (d358e5254674 Merge tag 'for-6.19/dm-changes' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging thunderbolt/next (8f0b4cce4481 Linux 6.19-rc1)
Merging usb-serial/usb-next (8f0b4cce4481 Linux 6.19-rc1)
Merging tty/tty-next (d358e5254674 Merge tag 'for-6.19/dm-changes' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging char-misc/char-misc-next (d358e5254674 Merge tag 'for-6.19/dm-chang=
es' of git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
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
Merging phy-next/next (8f0b4cce4481 Linux 6.19-rc1)
Merging soundwire/next (59946373755d soundwire: dmi-quirks: add mapping for=
 Avell B.ON (OEM rebranded of NUC15))
Merging extcon/extcon-next (b4338338aa3d extcon: usbc-tusb320: Make typec-p=
ower-opmode optional)
Merging gnss/gnss-next (8f0b4cce4481 Linux 6.19-rc1)
Merging vfio/next (d721f52e3155 vfio: selftests: Add vfio_pci_device_init_p=
erf_test)
Merging w1/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging spmi/spmi-next (0ff41df1cb26 Linux 6.15)
Merging staging/staging-next (d358e5254674 Merge tag 'for-6.19/dm-changes' =
of git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging counter-next/counter-next (b462fcd08dd5 MAINTAINERS: Update Intel Q=
uadrature Encoder Peripheral maintainer)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (de4761fb57f6 dmaengine: shdma: correct most kernel-=
doc issues in shdma-base.h)
Merging cgroup/for-next (6ee43047e8ad cpuset: Remove unnecessary checks in =
rebuild_sched_domains_locked)
Merging scsi/for-next (98bcf5e5ddfd Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (946574434aa9 scsi: ufs: qcom: Fix confusing clea=
nup.h syntax)
Merging vhost/linux-next (1bac705c2ce7 vhost/vsock: improve RCU read sectio=
ns around vhost_vsock_get())
Merging rpmsg/for-next (8cde495c954b Merge branches 'rpmsg-next' and 'rproc=
-next' into for-next)
Merging gpio-brgl/gpio/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging gpio-intel/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging pinctrl/for-next (666065caa31a pinctrl: add CONFIG_OF dependencies =
for microchip drivers)
Merging pinctrl-intel/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging pinctrl-renesas/renesas-pinctrl (3b0cf6ab3590 pinctrl: renesas: rzg=
2l: Refactor OEN register PWPR handling)
Merging pinctrl-samsung/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging pwm/pwm/for-next (9580ecfbc57d rust: pwm: Add UnregisteredChip wrap=
per around Chip)
Merging ktest/for-next (d3042cbe84a0 ktest.pl: Fix uninitialized var in con=
fig-bisect.pl)
Merging kselftest/next (8f0b4cce4481 Linux 6.19-rc1)
Merging kunit/test (8f0b4cce4481 Linux 6.19-rc1)
Merging kunit-next/kunit (2115b53400fb rust: kunit: add __rust_helper to he=
lpers)
Merging livepatching/for-next (51ab33fc0a8b Merge tag 'livepatching-for-6.1=
9' of git://git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepatchi=
ng)
Merging rtc/rtc-next (16bd954c9336 rtc: spacemit: MFD_SPACEMIT_P1 as depend=
encies)
Merging nvdimm/libnvdimm-for-next (30065e73d7c0 nvdimm: Prevent integer ove=
rflow in ramdax_get_config_data())
Merging at24/at24/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging ntb/ntb-next (68113d260674 NTB/msi: Remove unused functions)
Merging seccomp/for-next/seccomp (7d0a66e4bb90 Linux 6.18)
Merging slimbus/for-next (3a8660878839 Linux 6.18-rc1)
Merging nvmem/for-next (3a8660878839 Linux 6.18-rc1)
Merging xarray/main (863810caeb3c XArray: Add CONFIG_DEBUG_XARRAY)
Merging hyperv/hyperv-next (8f0b4cce4481 Linux 6.19-rc1)
Merging auxdisplay/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging kgdb/kgdb/for-next (fdbdd0ccb30a kdb: remove redundant check for sc=
ancode 0xe0)
Merging hmm/hmm (19272b37aa4f Linux 6.16-rc1)
Merging cfi/cfi/next (3a8660878839 Linux 6.18-rc1)
Merging mhi/mhi-next (ac35e04f8000 bus: mhi: host: pci_generic: Add Foxconn=
 T99W760 modem)
Merging memblock/for-next (83c8f7b5e194 mm/mm_init: Introduce a boot parame=
ter for check_pages)
Merging cxl/next (ea5514e30056 Merge branch 'for-6.19/cxl-misc' into cxl-fo=
r-next)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (c5a8f13f1e47 efi: Support EDID information)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (58d6fcb6ee94 slub: keep empty main sheaf as spa=
re in __pcs_replace_empty_main())
Merging random/master (3f9f0252130e Merge tag 'random-6.19-rc1-for-linus' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/crng/random)
Merging landlock/next (1a3cedbdc156 landlock: Fix wrong type usage)
Merging sysctl/sysctl-next (564195c1a33c sysctl: Wrap do_proc_douintvec wit=
h the public function proc_douintvec_conv)
Merging execve/for-next/execve (7d0a66e4bb90 Linux 6.18)
Merging bitmap/bitmap-for-next (43368eecb56a rust: bitmap: add __rust_helpe=
r to helpers)
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (7454048db27d kbuild: Enable GCC diagnostic cont=
ext for value-tracking warnings)
Merging nolibc/for-next (5203a78a7c60 tools/nolibc: always use 64-bit mode =
for s390 header checks)
Merging iommufd/for-next (8967efc5922e iommufd: Check for overflow in IOMMU=
_TEST_OP_ADD_RESERVED)
Merging turbostat/next (b65a8280c766 tools/power turbostat.8: Document the =
"--force" option)
Merging pwrseq/pwrseq/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging capabilities-next/caps-next (9891d2f79a9f Clarify the rootid_owns_c=
urrentns)
Merging ipe/next (7d0a66e4bb90 Linux 6.18)
Merging kcsan/next (dcb6fa37fd7b Linux 6.18-rc3)
Merging crc/crc-next (dcb6fa37fd7b Linux 6.18-rc3)
Merging fwctl/for-next (211ddde0823f Linux 6.18-rc2)
Merging devsec-tsm/next (7dfbe9a67519 crypto/ccp: Fix CONFIG_PCI=3Dn build)
Merging hisilicon/for-next (6c177775dcc5 Merge branch 'next/drivers' into f=
or-next)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)

--Sig_/+qQJTHklHiNePhwf+94=0cB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlCIJQACgkQAVBC80lX
0GwQOwgAgrlZTt1R7ZF6cxBAL9bNn8wBYwURaM045hlP/R1DlrhAlMF0gQki1AEf
A/Ht+Oq5Qt2pY4o+jih5nYf7Np7dA1ZMScUSBJwLHT25wpyGOeKvgy6pKvtqQ5wS
0LPFkFUuZGC+ij8fusmWqdt2w2PXlKXUxib80Mlet7SVnTylAuxpvGDHRXnir67Z
0Pf51nntH5ZpWn+izHTJ1lBbeTyH/+OpsmAEehzJwCsQQI4iz/4eQ9O45Ij+JlmM
7NcckgCK4VFyY/hXdGT7Sb3d0Bq5bw/V/kREOQ0IfNbZEhxKMbjhU2eP+hM3/kqY
2ZJUFtxGLiJkdgr8Hpul1y05yjwn2A==
=zhi9
-----END PGP SIGNATURE-----

--Sig_/+qQJTHklHiNePhwf+94=0cB--

