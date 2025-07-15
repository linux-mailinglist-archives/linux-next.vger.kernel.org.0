Return-Path: <linux-next+bounces-7556-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 179ADB0581C
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 12:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAA5A1C23058
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 10:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5663B2D660E;
	Tue, 15 Jul 2025 10:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="B2R7PE3G"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5566FC3;
	Tue, 15 Jul 2025 10:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752576314; cv=none; b=cK4FkL5gTFw4GARpzpRDJo0AHw1twI24JHIaU1/jqmbj53yIt2mOtirWI8jSB/DcUty3BJrS3cga/sgO21n4kHJQ1z5KMtGZinaL8hRASYt/2uIu7ZKrdq+YGLJRoyXHDkOtzFTxuyG8t0LKhTzonexarvpvfY/hpW0ZY3RQRcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752576314; c=relaxed/simple;
	bh=UoQcTfq3CUfD6mBsVzMltlCn2aO3AvOOWk8GnmToyv8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ito7O8LAJz0q7LSG2ibLhLNLYxW5ENLvwYKXn09miCqjX9ZRf810U2EHlWNl8lldgTnGV8PQ2f7Jv8YHG6YpCw0/Hc3cFqZUvzzoSe4UCQWPfljjJMWQvw/2dpZusYcw6AnbjHcF1gQ6UQQyYmHjd+dez8WTKYHe+xrrkBPurFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=B2R7PE3G; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752576196;
	bh=fRhS5qu6B3cM8O6W3o14/qgtbDcMrEr0FBlRYAC4tYE=;
	h=Date:From:To:Cc:Subject:From;
	b=B2R7PE3G9ne6Ru8UExuIq7Wqcl4Q3ZViCpUg+y3Kusck1mnrhbodHD3ldLMBHrtrj
	 Lye3xF2YG6SoMlWf9p6TTxbRD8nlSftWI7wxQ5yzZk/LoiothXwdIbxGwkWKvDzMlF
	 OEPnb1BnwwACBvJuuBjRF/fWfC4uSFgMdbYowCDAYA8YIB2LGSWpubaNO/lFqvZDTc
	 QAAJxi+Otw5PjP0pOCXCcd5rzdzTOi2/nDrj/i6BYRVfL1VsuFqdvtF87SUj26Vj3f
	 OZFKpt2yP47jGplodnvS/iwOjJtl4Q0e261a27meqcEDeuZke1t8h/QMF1HAKuXZHM
	 OUjAukAwyiMAQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bhG4N543fz4wbr;
	Tue, 15 Jul 2025 20:43:16 +1000 (AEST)
Date: Tue, 15 Jul 2025 20:45:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 15
Message-ID: <20250715204504.36f41a8e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/leoYmemqY4oaP9vqZRhfOOm";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/leoYmemqY4oaP9vqZRhfOOm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250714:

The ext4 tree gained a build failure, so I used the version from
next-20250714.

The bluetooth tree gained a build failure, so I used the version from
next-20250714.

The libcrypto tree gained a conflict against Linus' tree.

The drm-misc tree gained a build failure, so I used the version from
next-20250714.

The pinctrl tree lost its build failure.

The rust tree gained conflicts against the vfs-brauner, driver-core trees.

Non-merge commits (relative to Linus' tree): 8924
 9537 files changed, 357421 insertions(+), 198638 deletions(-)

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

I am currently merging 403 trees (counting Linus' and 153 trees of bug
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
Merging origin/master (347e9f5043c8 Linux 6.16-rc6)
Merging fixes/fixes (b3c623b9a94f Merge tag 'thermal-6.15-rc1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging ext4-fixes/fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging vfs-brauner-fixes/vfs.fixes (86ab0c10090b Merge patch series "netfs=
: Fix use of fscache with ceph")
Merging fscrypt-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging fsverity-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging btrfs-fixes/next-fixes (296391a79b55 Merge branch 'misc-6.16' into =
next-fixes)
Merging vfs-fixes/fixes (b969f9614885 fix proc_sys_compare() handling of in=
-lookup dentries)
Merging erofs-fixes/fixes (347e9f5043c8 Linux 6.16-rc6)
Merging nfsd-fixes/nfsd-fixes (94d10a4dba0b sunrpc: handle SVC_GARBAGE duri=
ng svc auth processing as auth error)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (924577e4f6ca ovl: Fix nested backing fil=
e paths)
Merging bcachefs/for-next (4821c4ec3970 bcachefs: convert compress.c to gua=
rds)
Merging fscrypt/for-next (fa65058063cb ceph: Remove gfp_t argument from cep=
h_fscrypt_encrypt_*())
Merging btrfs/for-next (62d94c9298ad Merge branch 'for-next-next-v6.16-2025=
0711' into for-next-20250711)
CONFLICT (content): Merge conflict in fs/btrfs/qgroup.c
Merging ceph/master (b828b4bf29d1 ceph: fix variable dereferenced before ch=
eck in ceph_umount_begin())
Merging cifs/for-next (ed8cab63b9f1 smb: change return type of cached_dir_l=
ease_break() to bool)
Merging configfs/configfs-next (c6b190822459 MAINTAINERS: add configfs Rust=
 abstractions)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (6f8b4788266c dlm: drop SCTP Kconfig dependency)
Merging erofs/dev (26654adaadfa erofs: do sanity check on m->type in z_erof=
s_load_compact_lcluster())
Merging exfat/dev (1edbfabb7967 exfat: add cluster chain loop check for dir)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (8f975e4b413a Merge UDF partition map count fix.)
Merging ext4/dev (e14bef2a00b5 ext4: limit the maximum folio order)
$ git reset --hard HEAD^
Merging next-20250714 version of ext4
Merging f2fs/dev (443ab50caa57 f2fs: switch to the new mount api)
Merging fsverity/for-next (d0b3b7b22dfa Linux 6.16-rc4)
Merging fuse/for-next (f0e84022479b virtio_fs: Remove redundant spinlock in=
 virtio_fs_request_complete())
Merging gfs2/for-next (06234af9e3a1 gfs2: Remove GIF_ALLOC_FAILED flag)
Merging jfs/jfs-next (b89798e79cf7 jfs: stop using write_cache_pages)
Merging ksmbd/ksmbd-for-next (347e9f5043c8 Linux 6.16-rc6)
Merging nfs/linux-next (12d0bee90f13 pNFS/flexfiles: don't attempt pnfs on =
fatal DS errors)
Merging nfs-anna/linux-next (38074de35b01 NFSv4/flexfiles: Fix handling of =
NFS level errors in I/O)
Merging nfsd/nfsd-next (067b594beb16 nfsd: Implement large extent array sup=
port in pNFS)
Merging ntfs3/master (d99208b91933 fs/ntfs3: cancle set bad inode after rem=
oving name fails)
Merging orangefs/for-next (4dc784e92d4f orangefs: Convert to use the new mo=
unt API)
Merging overlayfs/overlayfs-next (6f9ccdad0fea ovl: Annotate struct ovl_ent=
ry with __counted_by())
Merging ubifs/next (2b6d96503255 jffs2: check jffs2_prealloc_raw_node_refs(=
) result in few other places)
Merging v9fs/9p-next (4210030d8bc4 docs: fs/9p: Add missing "not" in cache =
documentation)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (1928a4228b2f Merge branch 'xfs-6.17-merge' into for-n=
ext)
Merging zonefs/for-next (6982100bb829 zonefs: use ZONEFS_SUPER_SIZE instead=
 of PAGE_SIZE)
Merging vfs-brauner/vfs.all (0d21e5ab2c20 Merge branch 'vfs-6.17.super' int=
o vfs.all)
CONFLICT (content): Merge conflict in fs/f2fs/super.c
Merging vfs/for-next (0cfe2786775a Merge branch 'work.misc' into for-next)
Merging mm-hotfixes/mm-hotfixes-unstable (cfaad61e7f53 mm: update MAINTAINE=
RS entry for HMM)
Merging fs-current (ee48bffd151f Merge branch 'next-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/kdave/linux.git)
Merging kbuild-current/fixes (e04c78d86a96 Linux 6.16-rc2)
Merging arc-current/for-curr (d7b8f8e20813 Linux 6.16-rc5)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (9dd175749341 arm64/mm: Drop wrong write=
s into TCR2_EL1)
Merging arm-soc-fixes/arm/fixes (8f0837fdc5d8 Merge tag 'qcom-arm64-defconf=
ig-fixes-for-6.16' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/=
linux into arm/fixes)
Merging davinci-current/davinci/for-current (19272b37aa4f Linux 6.16-rc1)
Merging drivers-memory-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging sophgo-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging sophgo-soc-fixes/soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging m68k-current/for-linus (f440518f379d m68k: defconfig: Update defcon=
figs for v6.15-rc1)
Merging powerpc-fixes/fixes (ab107276607a powerpc: Fix struct termio relate=
d ioctl macros)
Merging s390-fixes/fixes (62355f1f87b8 s390/pci: Allow automatic recovery w=
ith minimal driver support)
Merging net/main (b640daa2822a rpl: Fix use-after-free in rpl_do_srh_inline=
().)
Merging bpf/master (bf4807c89d8f selftests/bpf: Add negative test cases for=
 snprintf)
Merging ipsec/master (28712d6ed320 Merge branch 'ipsec: fix splat due to ip=
comp fallback tunnel')
Merging netfilter/main (7727ec1523d7 net: emaclite: Fix missing pointer inc=
rement in aligned_read())
Merging ipvs/main (d0fa59897e04 tcp: fix tcp_packet_delayed() for tcp_is_no=
n_sack_preventing_reopen() behavior)
Merging wireless/for-next (c7979c3917fa Merge tag 'net-6.16-rc6-2' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ath/for-current (afcefc58fdfd wifi: ath12k: Fix packets received in=
 WBM error ring with REO LUT enabled)
Merging iwlwifi/fixes (e5d110fec068 wifi: iwlwifi: pcie: fix locking on inv=
alid TOP reset)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (a9a9e68954f2 RDMA/mlx5: Fix vport loopback for M=
PV device)
Merging sound-current/for-linus (40b1c2f9b299 ALSA: hda/cs35l56: Workaround=
 bad dev-index on Lenovo Yoga Book 9i GenX)
Merging sound-asoc-fixes/for-linus (e837b59f8b41 ASoC: Intel: fix SND_SOC_S=
OF dependencies)
Merging regmap-fixes/for-linus (c871c199accb regmap: fix potential memory l=
eak of regmap_bus)
Merging regulator-fixes/for-linus (d7b8f8e20813 Linux 6.16-rc5)
Merging spi-fixes/for-linus (710505212e32 spi: Add check for 8-bit transfer=
 with 8 IO mode support)
Merging pci-current/for-linus (19272b37aa4f Linux 6.16-rc1)
Merging driver-core.current/driver-core-linus (86731a2a651e Linux 6.16-rc3)
Merging tty.current/tty-linus (6c0e9f05c9d7 pch_uart: Fix dma_sync_sg_for_d=
evice() nents value)
Merging usb.current/usb-linus (5724ff190b22 usb: dwc2: gadget: Fix enter to=
 hibernation for UTMI+ PHY)
Merging usb-serial-fixes/usb-linus (252f4ac08cd2 USB: serial: option: add T=
elit Cinterion FE910C04 (ECM) composition)
Merging phy/fixes (cf0233491b3a phy: use per-PHY lockdep keys)
Merging staging.current/staging-linus (d0b3b7b22dfa Linux 6.16-rc4)
Merging iio-fixes/fixes-togreg (3cf33cb66762 iio: adc: ad7173: fix calibrat=
ion channel)
Merging counter-current/counter-current (19272b37aa4f Linux 6.16-rc1)
Merging char-misc.current/char-misc-linus (2aa4ad626ee7 nvmem: imx-ocotp: f=
ix MAC address byte length)
Merging soundwire-fixes/fixes (a628e69b6412 soundwire: amd: fix for clearin=
g command status register)
Merging thunderbolt-fixes/fixes (2cdde91c14ec thunderbolt: Fix bit masking =
in tb_dp_port_set_hops())
Merging input-current/for-linus (4cf65845fdd0 Input: cs40l50-vibra - fix po=
tential NULL dereference in cs40l50_upload_owt())
Merging crypto-current/master (ccafe2821cfa crypto: qat - Use crypto_shash_=
export_core)
Merging libcrypto-fixes/libcrypto-fixes (68279380266a crypto: s390/sha - Fi=
x uninitialized variable in SHA-1 and SHA-2)
Merging vfio-fixes/for-linus (c1d9dac0db16 vfio/pci: Align huge faults to o=
rder)
Merging kselftest-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging dmaengine-fixes/fixes (8eba2187391e dmaengine: mediatek: Fix a flag=
 reuse error in mtk_cqdma_tx_status())
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (6463cbe08b0c mtd: spinand: fix memory leak of =
ECC engine conf)
Merging mfd-fixes/for-mfd-fixes (d9d79e4f7dc9 mfd: Fix building without CON=
FIG_OF)
Merging v4l-dvb-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging reset-fixes/reset/fixes (19272b37aa4f Linux 6.16-rc1)
Merging mips-fixes/mips-fixes (86731a2a651e Linux 6.16-rc3)
Merging at91-fixes/at91-fixes (19272b37aa4f Linux 6.16-rc1)
Merging omap-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging kvm-fixes/master (4578a747f3c7 KVM: x86: avoid underflow when scali=
ng TSC frequency)
Merging kvms390-fixes/master (d8dfda5af0be KVM: s390: pv: fix race when mak=
ing a page secure)
Merging hwmon-fixes/hwmon (c25892b7a174 hwmon: (ltc4282) avoid repeated reg=
ister write)
Merging nvdimm-fixes/libnvdimm-fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging cxl-fixes/fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging dma-mapping-fixes/dma-mapping-fixes (aa807b9f22df dma-contiguous: h=
ornor the cma address limit setup by user)
Merging drivers-x86-fixes/fixes (aef9da333823 platform/x86: dell-lis3lv02d:=
 Add Precision 3551)
Merging samsung-krzk-fixes/fixes (8d2c2fa2209e firmware: exynos-acpm: fix t=
imeouts on xfers handling)
Merging pinctrl-samsung-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging devicetree-fixes/dt/linus (f75794b6077e dt-bindings: serial: Conver=
t altr,uart-1.0 to DT schema)
Merging dt-krzk-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging scsi-fixes/fixes (021f243627ea scsi: ufs: core: Fix spelling of a s=
ysfs attribute name)
Merging drm-fixes/drm-fixes (347e9f5043c8 Linux 6.16-rc6)
Merging drm-intel-fixes/for-linux-next-fixes (347e9f5043c8 Linux 6.16-rc6)
Merging mmc-fixes/fixes (ff09b71bf9da mmc: bcm2835: Fix dma_unmap_sg() nent=
s value)
Merging rtc-fixes/rtc-fixes (08d82d0cad51 rtc: pcf2127: add missing semicol=
on after statement)
Merging gnss-fixes/gnss-linus (86731a2a651e Linux 6.16-rc3)
Merging hyperv-fixes/hyperv-fixes (faab52b59b09 x86/hyperv: Clean up hv_map=
/unmap_interrupt() return values)
Merging risc-v-fixes/fixes (5903a7452e64 Merge tag 'riscv-fixes-6.16-rc4' o=
f ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into f=
ixes)
Merging riscv-dt-fixes/riscv-dt-fixes (19272b37aa4f Linux 6.16-rc1)
Merging riscv-soc-fixes/riscv-soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga-fixes/fixes (1c6a132cb309 MAINTAINERS: Update FPGA MANAGER mai=
ntainer)
Merging spdx/spdx-linus (19272b37aa4f Linux 6.16-rc1)
Merging gpio-brgl-fixes/gpio/for-current (347e9f5043c8 Linux 6.16-rc6)
Merging gpio-intel-fixes/fixes (9ab29ed50555 gpiolib: acpi: Add a quirk for=
 Acer Nitro V15)
Merging pinctrl-intel-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging auxdisplay-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging kunit-fixes/kunit-fixes (19272b37aa4f Linux 6.16-rc1)
Merging memblock-fixes/fixes (da8bf5daa5e5 memblock: Accept allocated memor=
y before use in memblock_double_array())
Merging renesas-fixes/fixes (379c590113ce ARM: shmobile: smp: Enforce shmob=
ile_smp_* alignment)
Merging perf-current/perf-tools (86731a2a651e Linux 6.16-rc3)
Merging efi-fixes/urgent (f8b53cc9174c efi: Fix .data section size calculat=
ions when .sbat is present)
Merging battery-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging iommufd-fixes/for-rc (9a96876e3c65 iommufd/selftest: Fix build warn=
ings due to uninitialized mfd)
Merging rust-fixes/rust-fixes (749815922677 rust: use `#[used(compiler)]` t=
o fix build and `modpost` with Rust >=3D 1.89.0)
Merging w1-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging pmdomain-fixes/fixes (621a88dbfe90 cpuidle: psci: Fix cpuhotplug ro=
utine with PREEMPT_RT=3Dy)
Merging i2c-host-fixes/i2c/i2c-host-fixes (048a89a4cb7d i2c: virtio: Avoid =
hang by using interruptible completion wait)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (a42b4dcc4f9f dt-bindings: clock: mediatek: Add=
 #reset-cells property for MT8188)
Merging thead-clk-fixes/thead-clk-fixes (19272b37aa4f Linux 6.16-rc1)
Merging pwrseq-fixes/pwrseq/for-current (19272b37aa4f Linux 6.16-rc1)
Merging thead-dt-fixes/thead-dt-fixes (19272b37aa4f Linux 6.16-rc1)
Merging ftrace-fixes/ftrace/fixes (327e28664307 fgraph: Do not enable funct=
ion_graph tracer when setting funcgraph-args)
Merging ring-buffer-fixes/ring-buffer/fixes (e4d4b8670c44 ring-buffer: Use =
flush_kernel_vmap_range() over flush_dcache_folio())
Merging trace-fixes/trace/fixes (6921d1e07cb5 tracing: Fix filter logic err=
or)
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging tip-fixes/tip/urgent (3b686b841c22 Merge branch into tip/master: 'l=
ocking/urgent')
Merging slab-fixes/slab/for-next-fixes (be8250786ca9 mm, slab: clean up sla=
b->obj_exts always)
Merging drm-msm-fixes/msm-fixes (d3deabe4c619 drm/msm: Fix inverted WARN_ON=
() logic)
Merging uml-fixes/fixes (2dca89df0d11 Merge tag 'uml-for-6.16-rc4' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/uml/linux)
Merging fwctl-fixes/for-rc (19272b37aa4f Linux 6.16-rc1)
Merging devsec-tsm-fixes/fixes (fba4ceaa242d configfs-tsm-report: Fix NULL =
dereference of tsm_ops)
Merging drm-misc-fixes/for-linux-next-fixes (cb345f954eac drm/panfrost: Fix=
 scheduler workqueue bug)
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (fed48693bdfe mm/damon/reclaim: use parameter c=
ontext correctly)
Merging mm-nonmm-stable/mm-nonmm-stable (22c2ed6996ac checkpatch: check for=
 missing sentinels in ID arrays)
Merging mm-unstable/mm-unstable (fbe9075bd2ec mm/page_owner: convert set_pa=
ge_owner_migrate_reason() to folios)
Merging mm-nonmm-unstable/mm-nonmm-unstable (aea8d57eea81 fs/Kconfig: enabl=
e HUGETLBFS only if ARCH_SUPPORTS_HUGETLBFS)
Merging kbuild/for-next (46ac18b54da4 gendwarfksyms: order -T symtypes outp=
ut by name)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (b4aff7ed7a4c perf python: Set index error for=
 invalid thread/cpu map items)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (fbf5e2234169 dma-mapping: properl=
y calculate offset in the page)
Merging asm-generic/master (582847f97024 Makefile.kcov: apply needed compil=
er option unconditionally in CFLAGS_KCOV)
Merging alpha/alpha-next (1523226edda5 alpha: Use str_yes_no() helper in pc=
i_dac_dma_supported())
Merging arm/for-next (293bb049380e ARM: 9446/1: Disallow kernel mode NEON w=
hen IRQs are disabled)
Merging arm64/for-next/core (16b0485f601c Merge branches 'for-next/acpi', '=
for-next/debug-entry', 'for-next/feat_mte_store_only', 'for-next/kselftest'=
, 'for-next/livepatch', 'for-next/mdscr-cleanup', 'for-next/misc', 'for-nex=
t/user-contig-bbml2' and 'for-next/vmap-stack' into for-next/core)
Merging arm-perf/for-next/perf (e480898e767c drivers/perf: hisi: Support PM=
Us with no interrupt)
Merging arm-soc/for-next (bda58e97c081 Merge branch 'soc/newsoc' into for-n=
ext)
Merging amlogic/for-next (58abdca0eb65 Merge branch 'v6.17/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (2132bbd7aa16 Merge branch 'asahi-soc/=
drivers-6.17' into asahi-soc/for-next)
Merging at91/at91-next (04edf560c4af Merge branch 'at91-dt' into at91-next)
Merging bmc/for-next (6566ab474302 Merge branches 'aspeed/drivers', 'aspeed=
/dt' and 'nuvoton/arm64/dt' into for-next)
Merging broadcom/next (89abb622d518 Merge branch 'drivers/next' into next)
Merging davinci/davinci/for-next (19272b37aa4f Linux 6.16-rc1)
Merging drivers-memory/for-next (93a7aedc4cc4 dt-bindings: memory: renesas,=
rzg3e-xspi: Document RZ/V2H(P) and RZ/V2N support)
Merging imx-mxs/for-next (cdc22fb12eff Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (2c11ea2c78f0 Merge branches 'v6.16-next/soc', 'v=
6.16-next/arm32' and 'v6.16-next/dts32' into for-next)
Merging mvebu/for-next (88084e0358ff Merge branch 'mvebu/dt' into mvebu/for=
-next)
Merging omap/for-next (db91121f001a Merge branch 'omap-for-v6.17/soc' into =
tmp/omap-next-20250707.142928)
Merging qcom/for-next (0672fe83ed07 Merge branches 'arm32-for-6.17', 'arm64=
-defconfig-fixes-for-6.16', 'arm64-defconfig-for-6.17', 'arm64-fixes-for-6.=
16', 'arm64-for-6.17', 'clk-for-6.17' and 'drivers-for-6.17' into for-next)
Merging renesas/next (7a323accaf6b Merge branches 'renesas-arm-defconfig-fo=
r-v6.17', 'renesas-drivers-for-v6.17', 'renesas-dt-bindings-for-v6.17' and =
'renesas-dts-for-v6.17' into renesas-next)
Merging reset/reset/next (196dbace0824 dt-bindings: reset: Convert snps,dw-=
reset to DT schema)
Merging rockchip/for-next (bc42a2ea4af4 Merge branch 'v6.17-armsoc/arm32' i=
nto for-next)
Merging samsung-krzk/for-next (5e55762f952a Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (08602c5ae0e8 Merge tags 'scmi-updates-6.17' an=
d 'smccc-updates-6.17' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/gi=
t/sudeep.holla/linux into for-linux-next)
Merging sophgo/for-next (a3ec6cda33ea riscv: dts: sophgo: sophgo-srd3-10: r=
eserve uart0 device)
Merging sophgo-soc/soc-for-next (c8754c7deab4 soc: sophgo: cv1800: rtcsys: =
New driver (handling RTC only))
Merging spacemit/for-next (6be7a5a768aa Merge branch 'spacemit-clk-for-6.17=
' into spacemit-for-next)
Merging stm32/stm32-next (1a32f7427eb3 arm64: dts: st: remove empty line in=
 stm32mp251.dtsi)
Merging sunxi/sunxi/for-next (79ed31fc578a Merge branch 'sunxi/clk-for-6.17=
' into sunxi/for-next)
Merging tee/next (c580875fc93a Merge branch 'optee_fix_for_6.16' into next)
Merging tegra/for-next (cf61b4a773f8 Merge branch for-6.17/arm64/defconfig =
into for-next)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging thead-dt/thead-dt-for-next (c31f2899eab0 riscv: dts: thead: Add PVT=
 node)
Merging ti/ti-next (65f6e3eb6351 Merge branch 'ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (487e52a21734 firmware: xilinx: Add debugfs support=
 for PM_GET_NODE_STATUS)
Merging clk/clk-next (4b77a02e57d9 Merge branch 'clk-spacemit' into clk-nex=
t)
Merging clk-imx/for-next (19272b37aa4f Linux 6.16-rc1)
Merging clk-renesas/renesas-clk (0ab2d84f94da clk: renesas: r9a08g045: Add =
MSTOP for coupled clocks as well)
Merging thead-clk/thead-clk-for-next (d274c77ffa20 clk: thead: th1520-ap: C=
orrectly refer the parent of osc_12m)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (955853cf8365 LoongArch: KVM: Disable upda=
ting of "num_cpu" and "feature")
Merging m68k/for-next (c8995932db2b m68k: mac: Improve clocksource driver c=
ommentary)
Merging m68knommu/for-next (347e9f5043c8 Linux 6.16-rc6)
Merging microblaze/next (c0e7bb02f796 microblaze: Replace __ASSEMBLY__ with=
 __ASSEMBLER__ in non-uapi headers)
Merging mips/mips-next (b5a1f9870f98 mips: boot: use 'targets' instead of e=
xtra-y in Makefile)
Merging openrisc/for-next (f0eedcf22581 openrisc: Replace __ASSEMBLY__ with=
 __ASSEMBLER__ in non-uapi headers)
Merging parisc-hd/for-next (19272b37aa4f Linux 6.16-rc1)
Merging powerpc/next (cf183c1730f2 powerpc: floppy: Add missing checks afte=
r DMA map)
Merging risc-v/for-next (fda589c28604 Merge patch series "Move duplicated i=
nstructions macros into asm/insn.h")
Merging riscv-dt/riscv-dt-for-next (19272b37aa4f Linux 6.16-rc1)
Merging riscv-soc/riscv-soc-for-next (bd4d5d3faadc riscv: defconfig: spacem=
it: enable sdhci driver for K1 SoC)
Merging s390/for-next (13424c5cad97 Merge branch 'features' into for-next)
Merging sh/for-next (19272b37aa4f Linux 6.16-rc1)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (f7e9077a1649 um: Stop tracking stub's PID via userspace_p=
id[])
Merging xtensa/xtensa-for-next (44a4ef59d550 xtensa: Replace __ASSEMBLY__ w=
ith __ASSEMBLER__ in non-uapi headers)
Merging fs-next (af3985455820 Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
CONFLICT (content): Merge conflict in include/linux/proc_fs.h
Merging printk/for-next (dcc3191a3dde Merge branch 'rework/ringbuffer-kunit=
-test' into for-next)
Merging pci/next (38be2ac97d2d Merge branch 'pci/misc')
Merging pstore/for-next/pstore (d679c2e1e8d9 pstore/zone: rewrite some comm=
ents for better understanding)
Merging hid/for-next (567c158c442d Merge branch 'for-6.16/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (466c7203e5f9 Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
  60c016afccac ("i2c: omap: Fix an error handling path in omap_i2c_probe()")
  6aae87fe7f18 ("i2c: stm32f7: unmap DMA mapped buffer")
  a9503a2ecd95 ("i2c: omap: Handle omap_i2c_init() errors in omap_i2c_probe=
()")
  c870cbbd71fc ("i2c: stm32: fix the device used for the DMA map")
Merging i2c-host/i2c/i2c-host (db988b8a73f1 i2c: busses: Use min() to impro=
ve code)
Merging i3c/i3c/next (12aa3e0cb0c6 i3c: prefix hexadecimal entries in sysfs)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (a41a9728941f hwmon: emc2305: Set initial =
PWM minimum value during probe based on thermal state)
Merging jc_docs/docs-next (f55b3ca3cf1d tracing: doc: fix "for a while" typ=
o)
Merging v4l-dvb/next (d968e50b5c26 media: rkvdec: Unstage the driver)
CONFLICT (content): Merge conflict in .mailmap
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (0bd6e7f505a3 Merge branches 'pm-misc' and 'pm-tools'=
 into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (0ae93389b6c8 cpufreq: tegra124:=
 Allow building as a module)
Merging cpupower/cpupower (b74710eaff31 cpupower: Improve Python binding's =
Makefile)
Merging devfreq/devfreq-next (7da2fdaaa1e6 PM / devfreq: Add HiSilicon unco=
re frequency scaling driver)
Merging pmdomain/next (d87547e08b09 pmdomain: Merge branch fixes into next)
Merging opp/opp/linux-next (22679d807dea rust: opp: use c_* types via kerne=
l prelude)
Merging thermal/thermal/linux-next (e23cba0ab49a thermal/drivers/airoha: Fi=
x spelling mistake)
Merging rdma/for-next (98269398c02a RDMA/uverbs: Add empty rdma_uattrs_has_=
raw_cap() declaration)
Merging net-next/main (06baf9bfa6ca Merge branch 'tcp-receiver-changes')
CONFLICT (content): Merge conflict in drivers/net/ethernet/microsoft/mana/g=
dma_main.c
CONFLICT (content): Merge conflict in net/core/net_namespace.c
Merging bpf-next/for-next (872a38db5933 Merge branch 'bpf-next/master' into=
 for-next)
CONFLICT (modify/delete): arch/s390/net/bpf_jit.h deleted in bpf-next/for-n=
ext and modified in HEAD.  Version HEAD of arch/s390/net/bpf_jit.h left in =
tree.
CONFLICT (content): Merge conflict in kernel/bpf/helpers.c
CONFLICT (add/add): Merge conflict in tools/testing/selftests/bpf/prog_test=
s/cgroup_xattr.c
CONFLICT (add/add): Merge conflict in tools/testing/selftests/bpf/progs/rea=
d_cgroupfs_xattr.c
$ git rm -f arch/s390/net/bpf_jit.h
Merging ipsec-next/master (95cfe23285a6 xfrm: Skip redundant statistics upd=
ate for crypto offload)
Merging mlx5-next/mlx5-next (cd1746cb6555 net/mlx5: IFC updates for disable=
d host PF)
Merging netfilter-next/main (a52f9f0d77f2 Merge tag 'batadv-next-pullreques=
t-20250710' of git://git.open-mesh.org/linux-merge)
Merging ipvs-next/main (27390db9592d testptp: add option to enable external=
 timestamping edges)
Merging bluetooth/master (be736f5f89d5 Bluetooth: hci_dev: replace 'quirks'=
 integer by 'quirk_flags' bitmap)
CONFLICT (content): Merge conflict in include/net/bluetooth/hci_core.h
$ git reset --hard HEAD^
Merging next-20250714 version of bluetooth
CONFLICT (content): Merge conflict in include/net/bluetooth/hci_core.h
[master a76f662f77b0] next-20250714/bluetooth
Merging wireless-next/for-next (0cad34fb7c5d Merge git://git.kernel.org/pub=
/scm/linux/kernel/git/netdev/net)
Merging ath-next/for-next (9d2abd4162fc wifi: ath12k: Add support to enqueu=
e management frame at MLD level)
Merging iwlwifi-next/next (ea045a0de3b9 wifi: iwlwifi: add support for acce=
pting raw DSM tables by firmware)
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (9358bdb9f9f5 mtd: fix possible integer overflow in er=
ase_xfer())
Merging nand/nand/next (4b5532d4581d mtd: nand: brcmnand: replace manual st=
ring choices with standard helpers)
Merging spi-nor/spi-nor/next (2e3a7476ec39 mtd: spi-nor: Fix spi_nor_try_un=
lock_all())
Merging crypto/master (25f4e1d7193d crypto: zstd - replace zero-length arra=
y with flexible array member)
Merging libcrypto/libcrypto-next (78792545ad68 Merge branches 'libcrypto-co=
nversions' and 'libcrypto-tests' into libcrypto-next)
CONFLICT (modify/delete): arch/s390/crypto/sha1_s390.c deleted in libcrypto=
/libcrypto-next and modified in HEAD.  Version HEAD of arch/s390/crypto/sha=
1_s390.c left in tree.
CONFLICT (modify/delete): arch/s390/crypto/sha512_s390.c deleted in libcryp=
to/libcrypto-next and modified in HEAD.  Version HEAD of arch/s390/crypto/s=
ha512_s390.c left in tree.
CONFLICT (modify/delete): arch/s390/lib/crypto/sha256.c deleted in libcrypt=
o/libcrypto-next and modified in HEAD.  Version HEAD of arch/s390/lib/crypt=
o/sha256.c left in tree.
$ git rm -f arch/s390/crypto/sha512_s390.c arch/s390/lib/crypto/sha256.c
$ git rm -f arch/s390/crypto/sha1_s390.c
Merging drm/drm-next (7e11e01d1f1d Merge tag 'amd-drm-next-6.17-2025-07-11'=
 of https://gitlab.freedesktop.org/agd5f/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_dev=
ice.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_fen=
ce.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_sdm=
a.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_uco=
de.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/sdma_v4_4_=
2.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dc.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/display/drm_dp_helper=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/display/xe_display=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_ggtt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_ct.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_ct.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_hwmon.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_lmtt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_lrc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_module.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_uc_fw.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_wa_oob.rules
Applying: fix up bad merge of the amdgpu tree
Merging drm-exynos/for-linux-next (19272b37aa4f Linux 6.16-rc1)
Merging drm-misc/for-linux-next (1a304a2f8f7d drm/panel-edp: Add BOE NE14QD=
M panel for Dell Latitude 7455)
$ git reset --hard HEAD^
Merging next-20250714 version of drm-misc
Merging amdgpu/drm-next (a886d26f2c8f drm/amdgpu: fix use-after-free in amd=
gpu_userq_suspend+0x51a/0x5a0)
Merging drm-intel/for-linux-next (bba9aa416540 drm/dp: Change AUX DPCD prob=
e address from LANE0_1_STATUS to TRAINING_PATTERN_SET)
Merging drm-msm/msm-next (8290d37ad2b0 drm/msm: Small function param doc fi=
x)
Merging drm-msm-lumag/msm-next-lumag (cd86e80b77b2 drm/msm/dp: add linux/io=
.h header to fix build errors)
Merging drm-nova/nova-next (215a3f917133 Documentation: gpu: nova-core: Doc=
ument basics of the Falcon)
Merging drm-xe/drm-xe-next (f4d51b6ce51d drm/xe/lrc: Add table with LRC lay=
out)
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (59d1fc7b3e1a fbdev: pm3fb: fix potential divide by =
zero)
Merging regmap/for-next (5c3a02bdb0a8 Merge remote-tracking branch 'regmap/=
for-6.17' into regmap-next)
Merging sound/for-next (891667cefd16 Merge branch 'for-linus' into for-next)
Merging ieee1394/for-next (95a042a0c8ec firewire: ohci: reduce the size of =
common context structure by extracting members into AT structure)
Merging sound-asoc/for-next (6bd62e3ffe86 Merge remote-tracking branch 'aso=
c/for-6.17' into asoc-next)
CONFLICT (content): Merge conflict in sound/soc/codecs/hdac_hdmi.c
Merging modules/modules-next (699657e8e50a kunit: test: Drop CONFIG_MODULE =
ifdeffery)
Merging input/next (bc25e6bf032e Input: mtk-pmic-keys - add support for MT6=
359 PMIC keys)
Merging block/for-next (8192f418ee2f Merge branch 'for-6.17/io_uring' into =
for-next)
Merging device-mapper/for-next (7c14619c47e3 vdo: omit need_resched() befor=
e cond_resched())
Merging libata/for-next (148fbaf57169 ata: pata_rdc: Use registered definit=
ion for the RDC vendor)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (25a36912dc44 mmc: loongson2: prevent integer overflow in =
ret variable)
Merging mfd/for-mfd-next (8f3ef4da96dd mfd: mt6370: Fix the interrupt namin=
g typo)
CONFLICT (modify/delete): drivers/input/keyboard/adp5589-keys.c deleted in =
mfd/for-mfd-next and modified in HEAD.  Version HEAD of drivers/input/keybo=
ard/adp5589-keys.c left in tree.
$ git rm -f drivers/input/keyboard/adp5589-keys.c
Merging backlight/for-backlight-next (19272b37aa4f Linux 6.16-rc1)
Merging battery/for-next (7b41a2341fa6 power: supply: core: fix static chec=
ker warning)
Merging regulator/for-next (43728a6434f9 regulator: tps6286x-regulator: Fix=
 a copy & paste error)
Merging security/next (5d8b97c94677 MAINTAINERS: Add Xiu and myself as Lock=
down maintainers)
Merging apparmor/apparmor-next (2016a299b547 apparmor: update kernel doc co=
mments for xxx_label_crit_section)
Merging integrity/next-integrity (aa9bb1b32594 ima: add a knob ima=3D to al=
low disabling IMA in kdump kernel)
Merging selinux/next (850dada4b3af Automated merge of 'dev' into 'next')
Merging smack/next (6ddd169d0288 smack: fix kernel-doc warnings for smk_imp=
ort_valid_label())
Merging tomoyo/master (d7b8f8e20813 Linux 6.16-rc5)
Merging tpmdd/next (c56b74efe01e tpm: Replace scnprintf() with sysfs_emit()=
 and sysfs_emit_at() in sysfs show functions)
Merging watchdog/master (d7b8f8e20813 Linux 6.16-rc5)
Merging iommu/next (dfcc014b3e5d Merge branches 'intel/vt-d', 'amd/amd-vi',=
 'mediatek', 'ti/omap', 'apple/dart', 'arm/smmu/bindings' and 'arm/smmu/upd=
ates' into next)
Merging audit/next (ae1ae11fb277 audit,module: restore audit logging in loa=
d failure case)
Merging devicetree/for-next (3f66b5b401b5 dt-bindings: interrupt-controller=
: Convert apm,xgene1-msi to DT schema)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/tri=
vial-devices.yaml
Merging dt-krzk/for-next (6cd594ed969d ARM: dts: vt8500: Add L2 cache contr=
oller on WM8850/WM8950)
Merging mailbox/for-next (d0b497df02e9 mailbox: qcom-apcs-ipc: Assign OF no=
de to clock controller child device)
Merging spi/for-next (9a47e278967c Merge remote-tracking branch 'spi/for-6.=
17' into spi-next)
Merging tip/master (738641151f91 Merge x86/cleanups into tip/master)
Merging clockevents/timers/drivers/next (d204e391a0d8 clocksource/drivers/r=
enesas-ostm: Unconditionally enable reprobe support)
Merging edac/edac-for-next (6beda760db7e Merge ras/edac-drivers into for-ne=
xt)
Merging ftrace/for-next (76604f9ce795 Merge tools/for-next)
Merging rcu/next (9417e78cb8f0 Merge branches 'rcu-exp.08.07.2025', 'rcu.11=
.07.2025', 'torture-scripts.07.07.2025', 'srcu.07.07.2025', 'rcu.nocb.08.07=
.2025' and 'refscale.07.07.2025' into rcu.merge.11.07.2025)
Merging paulmck/non-rcu/next (125b9ae97219 Merge branches 'lkmm.2025.07.09a=
' and 'ratelimit.2025.06.24a' into HEAD)
Merging kvm/next (8046d29dde17 KVM: x86/mmu: Reject direct bits in gpa pass=
ed to KVM_PRE_FAULT_MEMORY)
Merging kvm-arm/next (15724a984643 Merge branch 'kvm-arm64/doublefault2' in=
to kvmarm/next)
Merging kvms390/next (d6c8097803cb KVM: s390: Simplify and move pv code)
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (4cec89db80ba RISC-V: KVM: Move HGEI[E|P] =
CSR access to IMSIC virtualization)
Merging kvm-x86/next (2a046f6a4ecc Merge branches 'apic', 'dirty_ring', 'fi=
xes', 'generic', 'irqs', 'misc', 'mmu', 'no_assignment', 'selftests', 'sev'=
, 'svm' and 'vmx')
CONFLICT (content): Merge conflict in arch/x86/kvm/vmx/vmx.c
Merging xen-tip/linux-next (70045cf6593c xen/gntdev: remove struct gntdev_c=
opy_batch from stack)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (dad7c0d4bc5f Merge branch 'for-6.17' into for-=
next)
Merging sched-ext/for-next (fea07f9a211e Merge branch 'for-6.16-fixes' into=
 for-next)
Merging drivers-x86/for-next (6e38b9fcbfa3 platform/x86: lenovo: gamezone n=
eeds "other mode")
CONFLICT (content): Merge conflict in drivers/platform/x86/Makefile
Merging chrome-platform/for-next (ab229c2b72c3 platform/chrome: cros_ec_typ=
ec: Add role swap ops)
Merging chrome-platform-firmware/for-firmware-next (19272b37aa4f Linux 6.16=
-rc1)
Merging hsi/for-next (19272b37aa4f Linux 6.16-rc1)
Merging leds-lj/for-leds-next (239afba8b9f3 leds: pca955x: Avoid potential =
overflow when filling default_label (take 2))
Merging ipmi/for-next (f6f9760320a9 char: ipmi: remove redundant variable '=
type' and check)
Merging driver-core/driver-core-next (3964d07dd821 lpfc: don't use file->f_=
path.dentry for comparisons)
CONFLICT (content): Merge conflict in drivers/gpu/nova-core/driver.rs
CONFLICT (modify/delete): drivers/infiniband/hw/qib/qib_sysfs.c deleted in =
HEAD and modified in driver-core/driver-core-next.  Version driver-core/dri=
ver-core-next of drivers/infiniband/hw/qib/qib_sysfs.c left in tree.
CONFLICT (content): Merge conflict in rust/helpers/helpers.c
$ git rm -f drivers/infiniband/hw/qib/qib_sysfs.c
Merging usb/usb-next (b4b4dbfa96de media: stk1160: use usb_alloc_noncoheren=
t/usb_free_noncoherent())
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/freescale/s32g2.d=
tsi
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/freescale/s32g3.d=
tsi
Merging thunderbolt/next (2d1beba54fda thunderbolt: Fix typos in documentat=
ion comments)
Merging usb-serial/usb-next (bdf2ab177e2f USB: serial: cp210x: use new GPIO=
 line value setter callbacks)
Merging tty/tty-next (0666e3fe95ab serial: sh-sci: Add support for RZ/T2H S=
CI)
Merging char-misc/char-misc-next (db15ec7abd33 rust: miscdevice: remove unn=
ecessary import)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (26e20622a8ae coresight: add coresight Trace Network=
 On Chip driver)
Merging fastrpc/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga/for-next (37e00703228a zynq_fpga: use sgtable-based scatterlis=
t wrappers)
Merging icc/icc-next (c5b60592886f interconnect: avoid memory allocation wh=
en 'icc_bw_lock' is held)
Merging iio/togreg (e3d455def515 iio: Add driver for Nicera D3-323-AA PIR s=
ensor)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging phy-next/next (304c102cff73 phy: qcom: qmp-combo: Add missing PLL (=
VCO) configuration on SM8750)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging soundwire/next (06f77ff9d852 soundwire: debugfs: move debug stateme=
nt outside of error handling)
Merging extcon/extcon-next (48b4c9388d6c extcon: fsa9480: Avoid buffer over=
flow in fsa9480_handle_change())
Merging gnss/gnss-next (e326371f3002 dt-bindings: gnss: u-blox: add u-blox,=
neo-9m compatible)
Merging vfio/next (e908f58b6beb vfio/pci: Separate SR-IOV VF dev_set)
Merging w1/for-next (19272b37aa4f Linux 6.16-rc1)
Merging spmi/spmi-next (0ff41df1cb26 Linux 6.15)
Merging staging/staging-next (1b0ee85ee796 staging: gpib: Fix error handlin=
g paths in cb_gpib_probe())
Merging counter-next/counter-next (19272b37aa4f Linux 6.16-rc1)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (0044c5fcae3d dmaengine: idxd: Remove __packed from =
structures)
Merging cgroup/for-next (5ca8e48d88a0 Merge branch 'for-6.17' into for-next)
Merging scsi/for-next (dc9f707da52e Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (add4c4850363 scsi: bfa: Double-free fix)
Merging vhost/linux-next (8fc65f847b89 virtio: support device disconnect)
Merging rpmsg/for-next (76970c009cef Merge branches 'rproc-next' and 'rpmsg=
-next' into for-next)
Merging gpio-brgl/gpio/for-next (e502df58b5e3 gpio: virtio: use new GPIO li=
ne value setter callbacks)
Merging gpio-intel/for-next (9ab29ed50555 gpiolib: acpi: Add a quirk for Ac=
er Nitro V15)
Merging pinctrl/for-next (a1459bbb75f9 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (3b4408038da9 pinctrl: intel: fix build warn=
ings about export.h)
Merging pinctrl-renesas/renesas-pinctrl (7000167796a0 pinctrl: renesas: Sim=
plify PINCTRL_RZV2M logic)
Merging pinctrl-samsung/for-next (683d532dfc96 pinctrl: samsung: Fix gs101 =
irq chip)
Merging pwm/pwm/for-next (a582469541a3 pwm: img: Remove redundant pm_runtim=
e_mark_last_busy() calls)
Merging ktest/for-next (19272b37aa4f Linux 6.16-rc1)
Merging kselftest/next (07b7c2b4eca3 selftests: breakpoints: use suspend_st=
ats to reliably check suspend success)
Merging kunit/test (19272b37aa4f Linux 6.16-rc1)
Merging kunit-next/kunit (34db4fba8191 kunit: fix longest symbol length tes=
t)
Merging livepatching/for-next (a8e905a819fd Merge branch 'for-6.15/ftrace-t=
est' into for-next)
Merging rtc/rtc-next (0bafe291cb42 dt-bindings: rtc: nxp,lpc1788-rtc: add c=
ompatible string nxp,lpc1850-rtc)
Merging nvdimm/libnvdimm-for-next (9f97e61bde6a cxl: Include range.h in cxl=
.h)
Merging at24/at24/for-next (19272b37aa4f Linux 6.16-rc1)
Merging ntb/ntb-next (0cadf92e93d4 NTB/msi: Remove unused functions)
Merging seccomp/for-next/seccomp (a9b33aae79ce selftests: seccomp: Fix "per=
formace" to "performance")
Merging slimbus/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging nvmem/for-next (e01ab90a7ada Merge branches 'nvmem-fixes' and 'nvme=
m-for-6.17' into nvmem-for-next)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (d9016a249be5 hv/hv_kvp_daemon: Prevent similar =
logs in kvp_key_add_or_modify())
Merging auxdisplay/for-next (19272b37aa4f Linux 6.16-rc1)
Merging kgdb/kgdb/for-next (afdbe49276ac kdb: Remove optional size argument=
s from strscpy() calls)
Merging hmm/hmm (19272b37aa4f Linux 6.16-rc1)
Merging cfi/cfi/next (19272b37aa4f Linux 6.16-rc1)
Merging mhi/mhi-next (7a793ba2cc4a bus: mhi: host: pci_generic: Add Foxconn=
 T99W696 modem)
Merging memblock/for-next (3b394dff15e1 memblock tests: add test for memblo=
ck_set_node)
Merging cxl/next (8d41af0d378d cxl: Remove core/acpi.c and cxl core depende=
ncy on ACPI)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (02eb7a8eee20 efi: add API doc entry for ovmf_debug_log)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (3cf3ee6a0be4 slab: Update MAINTAINERS entry)
Merging random/master (3778dcb2dcc1 random: use offstack cpumask when neces=
sary)
Merging landlock/next (5b74b2eff1ee selftests/landlock: Add disconnected le=
afs and branch test suites)
Merging rust/rust-next (a68a6bef0e75 rust: types: require `ForeignOwnable::=
into_foreign` return non-null)
CONFLICT (content): Merge conflict in rust/helpers/helpers.c
CONFLICT (content): Merge conflict in rust/kernel/devres.rs
CONFLICT (content): Merge conflict in rust/kernel/pci.rs
CONFLICT (content): Merge conflict in rust/kernel/platform.rs
CONFLICT (content): Merge conflict in rust/kernel/sync/poll.rs
Merging rust-alloc/alloc-next (d49ac7744f57 MAINTAINERS: add mm folks as re=
viewers to rust alloc)
Merging rust-io/io-next (86731a2a651e Linux 6.16-rc3)
Merging rust-pin-init/pin-init-next (fc3870dc5cad rust: pin-init: examples,=
 tests: use `ignore` instead of conditionally compiling tests)
Merging rust-timekeeping/timekeeping-next (d4b29ddf82a4 rust: time: Add wra=
pper for fsleep() function)
Applying: fix up for "rust: time: Make Instant generic over ClockSource"
Merging rust-xarray/xarray-next (fa616196fbea MAINTAINERS: add entry for Ru=
st XArray API)
Merging sysctl/sysctl-next (060a1b0567f7 docs: Downgrade arm64 & riscv from=
 titles to comment)
CONFLICT (content): Merge conflict in include/linux/module.h
CONFLICT (content): Merge conflict in kernel/panic.c
Merging execve/for-next/execve (a55128d392e8 binfmt_elf: Warn on missing or=
 suspicious regset note names)
Merging bitmap/bitmap-for-next (f66f9c3d09c1 bitfield: Ensure the return va=
lues of helper functions are checked)
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (10299c07c94a kunit/fortify: Add back "volatile"=
 for sizeof() constants)
Merging nolibc/for-next (b9e50363178a selftests/nolibc: add x32 test config=
uration)
Merging iommufd/for-next (601b1d0d9395 iommu/tegra241-cmdqv: import IOMMUFD=
 module namespace)
CONFLICT (content): Merge conflict in include/linux/iommu.h
Merging turbostat/next (447c98c1ca4a tools/power turbostat: Add idle govern=
or statistics reporting)
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.8
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.c
Merging pwrseq/pwrseq/for-next (07d59dec6795 power: sequencing: qcom-wcn: f=
ix bluetooth-wifi copypasta for WCN6855)
Merging capabilities-next/caps-next (cdd73b166607 uapi: fix broken link in =
linux/capability.h)
Merging ipe/next (324692100cc9 ipe: use SHA-256 library API instead of cryp=
to_shash API)
Merging kcsan/next (9d89551994a4 Linux 6.13-rc6)
Merging crc/crc-next (9b0236f4efb8 lib/crc: crc64: Add include/linux/crc64.=
h to kernel-api.rst)
CONFLICT (content): Merge conflict in lib/crc/s390/crc32.h
Merging fwctl/for-next (19272b37aa4f Linux 6.16-rc1)
Merging devsec-tsm/next (9d948b880409 Merge branch 'for-6.16/tsm-mr' into t=
sm-next)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)

--Sig_/leoYmemqY4oaP9vqZRhfOOm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh2MTAACgkQAVBC80lX
0GwS0wf+Oh6xj3Whx8p/pXE/tfmySNDxYQnH7tMtf0+13A0nva3lo3HDdx3C0eaC
bCrezFBs5Gh3l14sIHj8cHD4hVYB6MvNTNrM9mcZbrzjTPctjvp3WItOXf0CInrx
ck76aW3vcvwZOsUsah64yYN8aqGRBK0TGkWHYbBTNwwJ11UOsgCqhef4xo35US/b
SzMvZ6UrtyS26b0fBeGrOrket1auoY5rB0KS4d+jbeJsoj3nGnbcFwE3k3EGvK6F
haWsCVBTbPBvzn1Q1q5dvsc47iMhDX5w0y8CH4m3Ag73rFpDbp8tmIe9Z/9QwUBH
26i2uUuSB/slE5d8dwqWrKjfEMhplw==
=jDLx
-----END PGP SIGNATURE-----

--Sig_/leoYmemqY4oaP9vqZRhfOOm--

