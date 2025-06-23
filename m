Return-Path: <linux-next+bounces-7202-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7A0AE364E
	for <lists+linux-next@lfdr.de>; Mon, 23 Jun 2025 08:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEED43A2220
	for <lists+linux-next@lfdr.de>; Mon, 23 Jun 2025 06:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683181EC018;
	Mon, 23 Jun 2025 06:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="crfyXs3T"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119C31D63C5;
	Mon, 23 Jun 2025 06:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750661560; cv=none; b=DopepMAMToTVIxeuKtJbKaP5Uj+/dfLvz+4YfVlsZfoO2d/DxZebgThN33I0NlbBHafvYuBqVdc1D9nOsm3ajf8Aynue1C1NzRns7h58ZLpn8EOmamiGbf0hiFNJB0Yh4068rYn0c+sxE7BlcQckd8x52UKGnqxKApKMjqtgKps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750661560; c=relaxed/simple;
	bh=iEDzcv8v6J6cN4AbPQCgqYqoTctU3mqmlSqhzs8eg5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DWrfVUZQ7QC0L0QbUlloXdt5bO3DrRxyKO3NAC7s3wKPeZuwhCvdmo/kd1QO46kTzAWHFtI/NdknEzYffZP/hF8ygd39tGgzQNkNEot/cnAPGSMK4ybqmP/2bzGLYqdOhsyVejmvi8dChFZfaM2r+gsZjbKyuPPHhXYWydoJDpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=crfyXs3T; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750661552;
	bh=g/AXYJC3msuC6sU00KK0qbGVlOFy3fDle+MXTvVWosM=;
	h=Date:From:To:Cc:Subject:From;
	b=crfyXs3TZHEK5F8GZEhNN9CsrmA/d1K4kd9odzLakehRVFdLs1HPXCndOH2sWKwwX
	 0NQ+uis9IJQSzY0K9ASr+E/flCOw0h0qtPqeiS8NCwBpYgK7YPzWne9VBv3qbh/AN9
	 uIH/YOqz0pZWLYgGVq4e5pVnyDxLfB6CVy0xQpw7G7mcG3WryJYOZ55OiftqqiiG6b
	 PzH0gL9ZG/sW+vrmDKhuKqUr/EqT0lFGhwjQhvMzaXobhIjTPYzpKpzRJRvoEvMmYf
	 LVBkHzvXrKI1LWivw1l2qrVHZrnr0qTAUSI+0yYzZCePi/SL3k7Kj4n473iEnmzA74
	 43Bt/rzk7Mm1A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bQf0H72Wcz4wxh;
	Mon, 23 Jun 2025 16:52:31 +1000 (AEST)
Date: Mon, 23 Jun 2025 16:52:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 23
Message-ID: <20250623165231.25e7e945@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bYFyCkj.YL/xPddNCZ7CMId";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bYFyCkj.YL/xPddNCZ7CMId
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250620:

The vfs tree gained a conflict against the vfs-fixes tree.

The mm-unstable tree gained a conflict against the risc-v-fixes tree.

The tty tree still had its build failure so I used the version from
next-20250618.

Non-merge commits (relative to Linus' tree): 3774
 4765 files changed, 135429 insertions(+), 108199 deletions(-)

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

I am currently merging 402 trees (counting Linus' and 153 trees of bug
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
Merging origin/master (86731a2a651e Linux 6.16-rc3)
Merging fixes/fixes (b3c623b9a94f Merge tag 'thermal-6.15-rc1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging ext4-fixes/fixes (4bbf9020becb Linux 6.13-rc4)
Merging vfs-brauner-fixes/vfs.fixes (c696307648ea fs: export anon_inode_mak=
e_secure_inode() and fix secretmem LSM bypass)
Merging fscrypt-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging fsverity-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging btrfs-fixes/next-fixes (3390d3138849 Merge branch 'misc-6.16' into =
next-fixes)
Merging vfs-fixes/fixes (a1ec827b5c62 attach_recursive_mnt(): do not lock t=
he covering tree when sliding something under it)
Merging erofs-fixes/fixes (417b8af2e30d erofs: remove a superfluous check f=
or encoded extents)
Merging nfsd-fixes/nfsd-fixes (94d10a4dba0b sunrpc: handle SVC_GARBAGE duri=
ng svc auth processing as auth error)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (924577e4f6ca ovl: Fix nested backing fil=
e paths)
Merging bcachefs/for-next (cbc67c161728 bcachefs: bch2_trans_has_updates())
Merging fscrypt/for-next (01a0817f9ad9 fscrypt: Drop obsolete recommendatio=
n to enable optimized SHA-512)
Merging btrfs/for-next (74de5e3d5a52 Merge branch 'for-next-next-v6.16-2025=
0619' into for-next-20250619)
Merging ceph/master (b828b4bf29d1 ceph: fix variable dereferenced before ch=
eck in ceph_umount_begin())
Merging cifs/for-next (86731a2a651e Linux 6.16-rc3)
Merging configfs/configfs-next (c6b190822459 MAINTAINERS: add configfs Rust=
 abstractions)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (6f8b4788266c dlm: drop SCTP Kconfig dependency)
Merging erofs/dev (b4a29efc5146 erofs: support DEFLATE decompression by usi=
ng Intel QAT)
Merging exfat/dev (309914e6602c exfat: fdatasync flag should be same like g=
eneric_write_sync())
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (a099b09a3342 ext2: Handle fiemap on empty files to p=
revent EINVAL)
Merging ext4/dev (7acd1b315cdc ext4: Add a WARN_ON_ONCE for querying LAST_I=
N_LEAF instead)
Merging f2fs/dev (ba8dac350faf f2fs: fix to zero post-eof page)
Merging fsverity/for-next (9f92eeef95f5 fsverity: Explicitly include <linux=
/export.h>)
Merging fuse/for-next (dabb90391028 fuse: increase readdir buffer size)
Merging gfs2/for-next (fe4281644c62 Merge tag 'gfs2-for-6.16-fix' of git://=
git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2)
Merging jfs/jfs-next (5dff41a86377 jfs: fix array-index-out-of-bounds read =
in add_missing_indices)
Merging ksmbd/ksmbd-for-next (86731a2a651e Linux 6.16-rc3)
Merging nfs/linux-next (e04c78d86a96 Linux 6.16-rc2)
Merging nfs-anna/linux-next (f95925cc1ba9 sunrpc: fix loop in gss seqno cac=
he)
Merging nfsd/nfsd-next (45afe5b47dac nfsd: Change the type of ek_fsidtype f=
rom int to u8 and use kstrtou8)
Merging ntfs3/master (7fe02e107612 fs/ntfs3: Add sanity check for file name)
Merging orangefs/for-next (4dc784e92d4f orangefs: Convert to use the new mo=
unt API)
Merging overlayfs/overlayfs-next (6f9ccdad0fea ovl: Annotate struct ovl_ent=
ry with __counted_by())
Merging ubifs/next (2b6d96503255 jffs2: check jffs2_prealloc_raw_node_refs(=
) result in few other places)
Merging v9fs/9p-next (4210030d8bc4 docs: fs/9p: Add missing "not" in cache =
documentation)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (db44d088a5ab xfs: actually use the xfs_growfs_check_r=
tgeom tracepoint)
Merging zonefs/for-next (6982100bb829 zonefs: use ZONEFS_SUPER_SIZE instead=
 of PAGE_SIZE)
Merging vfs-brauner/vfs.all (b71957b5e35d Merge branch 'vfs-6.17.pidfs' int=
o vfs.all)
Merging vfs/for-next (c9a724094f44 Merge branch 'work.ceph-d_name-fixes' in=
to for-next)
CONFLICT (content): Merge conflict in Documentation/filesystems/porting.rst
Merging mm-hotfixes/mm-hotfixes-unstable (5beb84432010 lib/alloc_tag: do no=
t acquire nonexistent lock when mem profiling is disabled)
Merging fs-current (2970c84a1fea Merge branch 'fixes' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging kbuild-current/fixes (e04c78d86a96 Linux 6.16-rc2)
Merging arc-current/for-curr (179e949719fe ARC: Replace __ASSEMBLY__ with _=
_ASSEMBLER__ in the non-uapi headers)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (39dfc971e42d arm64/ptrace: Fix stack-ou=
t-of-bounds read in regs_get_kernel_stack_nth())
Merging arm-soc-fixes/arm/fixes (070d04f002dd Merge tag 'mvebu-fixes-6.15-1=
' of https://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into ar=
m/fixes)
Merging davinci-current/davinci/for-current (19272b37aa4f Linux 6.16-rc1)
Merging drivers-memory-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging sophgo-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging sophgo-soc-fixes/soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging m68k-current/for-linus (f440518f379d m68k: defconfig: Update defcon=
figs for v6.15-rc1)
Merging powerpc-fixes/fixes (ab107276607a powerpc: Fix struct termio relate=
d ioctl macros)
Merging s390-fixes/fixes (7f8073cfb04a s390/ptrace: Fix pointer dereferenci=
ng in regs_get_kernel_stack_nth())
Merging net/main (b993ea46b3b6 atm: clip: prevent NULL deref in clip_push())
Merging bpf/master (d4adf1c9ee77 bpf: Adjust free target to avoid global st=
arvation of LRU map)
Merging ipsec/master (c0f21029f123 xfrm: always initialize offload path)
Merging netfilter/main (d0fa59897e04 tcp: fix tcp_packet_delayed() for tcp_=
is_non_sack_preventing_reopen() behavior)
Merging ipvs/main (d0fa59897e04 tcp: fix tcp_packet_delayed() for tcp_is_no=
n_sack_preventing_reopen() behavior)
Merging wireless/for-next (5c8013ae2e86 Merge tag 'net-6.16-rc3' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ath/for-current (68dd8eeb7208 Merge tag 'iwlwifi-fixes-2025-06-18' =
of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next)
Merging iwlwifi/fixes (83f3ac2848b4 wifi: iwlwifi: Fix incorrect logic on c=
md_ver range checking)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (8edab8a72d67 RDMA/mlx5: Initialize obj_event->ob=
j_sub_list before xa_insert)
Merging sound-current/for-linus (68cc9d3c8e44 ALSA: hda/realtek - Enable mu=
te LED on HP Pavilion Laptop 15-eg100)
Merging sound-asoc-fixes/for-linus (16ea4666bbb7 ASoC: Intel: sof-function-=
topology-lib: Print out the unsupported dmic count)
Merging regmap-fixes/for-linus (19272b37aa4f Linux 6.16-rc1)
Merging regulator-fixes/for-linus (8acfb165a492 regulator: fan53555: add en=
able_time support and soft-start times)
Merging spi-fixes/for-linus (d57e92dd6600 spi: tegra210-qspi: Remove cache =
operations)
Merging pci-current/for-linus (bbf10cd68683 PCI: pciehp: Ignore belated Pre=
sence Detect Changed caused by DPC)
Merging driver-core.current/driver-core-linus (eab9dcb76b9f Documentation: =
embargoed-hardware-issues.rst: Add myself for Power)
Merging tty.current/tty-linus (d36f0e9a0002 serial: core: restore of_node i=
nformation in sysfs)
Merging usb.current/usb-linus (7aed15379db9 Revert "usb: xhci: Implement xh=
ci_handshake_check_state() helper")
Merging usb-serial-fixes/usb-linus (e04c78d86a96 Linux 6.16-rc2)
Merging phy/fixes (cf0233491b3a phy: use per-PHY lockdep keys)
Merging staging.current/staging-linus (a55bc4ffc06d staging: rtl8723bs: Avo=
id memset() in aes_cipher() and aes_decipher())
Merging iio-fixes/fixes-togreg (a3245ebdfac8 Merge tag 'iio-fixes-for-6.15b=
' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/jic23/iio into char=
-misc-next)
Merging counter-current/counter-current (19272b37aa4f Linux 6.16-rc1)
Merging char-misc.current/char-misc-linus (19272b37aa4f Linux 6.16-rc1)
Merging soundwire-fixes/fixes (86a4371b7697 soundwire: amd: fix for handlin=
g slave alerts after link is down)
Merging thunderbolt-fixes/fixes (e04c78d86a96 Linux 6.16-rc2)
Merging input-current/for-linus (f4b048a6a34a Input: apple_z2 - drop defaul=
t ARCH_APPLE in Kconfig)
Merging crypto-current/master (df29f60369cc crypto: ahash - Fix infinite re=
cursion in ahash_def_finup)
Merging libcrypto-fixes/libcrypto-fixes (64f7548aad63 lib/crypto: sha256: M=
ark sha256_choose_blocks as __always_inline)
Merging vfio-fixes/for-linus (c1d9dac0db16 vfio/pci: Align huge faults to o=
rder)
Merging kselftest-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging dmaengine-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (6463cbe08b0c mtd: spinand: fix memory leak of =
ECC engine conf)
Merging mfd-fixes/for-mfd-fixes (d9d79e4f7dc9 mfd: Fix building without CON=
FIG_OF)
Merging v4l-dvb-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging reset-fixes/reset/fixes (38fec10eb60d Linux 6.14)
Merging mips-fixes/mips-fixes (c44572e0cc13 MIPS: Fix MAX_REG_OFFSET)
Merging at91-fixes/at91-fixes (19272b37aa4f Linux 6.16-rc1)
Merging omap-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging kvm-fixes/master (28224ef02b56 KVM: TDX: Report supported optional =
TDVMCALLs in TDX capabilities)
Merging kvms390-fixes/master (d8dfda5af0be KVM: s390: pv: fix race when mak=
ing a page secure)
Merging hwmon-fixes/hwmon (c25892b7a174 hwmon: (ltc4282) avoid repeated reg=
ister write)
Merging nvdimm-fixes/libnvdimm-fixes (62a65b32bddb dt-bindings: pmem: Conve=
rt binding to YAML)
Merging cxl-fixes/fixes (3c70ec71abda cxl/ras: Fix CPER handler device conf=
usion)
Merging dma-mapping-fixes/dma-mapping-fixes (aa807b9f22df dma-contiguous: h=
ornor the cma address limit setup by user)
Merging drivers-x86-fixes/fixes (109f4d29dade platform/mellanox: mlxbf-tmfi=
fo: fix vring_desc.len assignment)
Merging samsung-krzk-fixes/fixes (8d2c2fa2209e firmware: exynos-acpm: fix t=
imeouts on xfers handling)
Merging pinctrl-samsung-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging devicetree-fixes/dt/linus (f75794b6077e dt-bindings: serial: Conver=
t altr,uart-1.0 to DT schema)
Merging dt-krzk-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging scsi-fixes/fixes (85d6fbc47c30 scsi: fnic: Fix missing DMA mapping =
error in fnic_send_frame())
Merging drm-fixes/drm-fixes (b8de9b21e849 Merge tag 'drm-xe-fixes-2025-06-1=
9' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (c464ce6af332 drm/i915/dsi: Fi=
x off by one in BXT_MIPI_TRANS_VTOTAL)
Merging mmc-fixes/fixes (f5de469990f1 mtk-sd: Prevent memory corruption fro=
m DMA map failure)
Merging rtc-fixes/rtc-fixes (19272b37aa4f Linux 6.16-rc1)
Merging gnss-fixes/gnss-linus (e04c78d86a96 Linux 6.16-rc2)
Merging hyperv-fixes/hyperv-fixes (14ae3003e73e Drivers: hv: Fix bad ref to=
 hv_synic_eventring_tail when CPU goes offline)
Merging risc-v-fixes/fixes (850f0e2433cd MAINTAINERS: Update Drew Fustini's=
 email address)
Merging riscv-dt-fixes/riscv-dt-fixes (19272b37aa4f Linux 6.16-rc1)
Merging riscv-soc-fixes/riscv-soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging spdx/spdx-linus (19272b37aa4f Linux 6.16-rc1)
Merging gpio-brgl-fixes/gpio/for-current (10af0273a35a gpio: mlxbf3: only g=
et IRQ for device instance 0)
Merging gpio-intel-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging pinctrl-intel-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging auxdisplay-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging kunit-fixes/kunit-fixes (19272b37aa4f Linux 6.16-rc1)
Merging memblock-fixes/fixes (da8bf5daa5e5 memblock: Accept allocated memor=
y before use in memblock_double_array())
Merging renesas-fixes/fixes (379c590113ce ARM: shmobile: smp: Enforce shmob=
ile_smp_* alignment)
Merging perf-current/perf-tools (d222b6e6fb31 tools headers x86 cpufeatures=
: Sync with the kernel sources)
Merging efi-fixes/urgent (f8b53cc9174c efi: Fix .data section size calculat=
ions when .sbat is present)
Merging battery-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging iommufd-fixes/for-rc (19272b37aa4f Linux 6.16-rc1)
Merging rust-fixes/rust-fixes (86731a2a651e Linux 6.16-rc3)
Merging w1-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging pmdomain-fixes/fixes (e04c78d86a96 Linux 6.16-rc2)
Merging i2c-host-fixes/i2c/i2c-host-fixes (941af7ffcbf5 i2c: k1: check for =
transfer error)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (a42b4dcc4f9f dt-bindings: clock: mediatek: Add=
 #reset-cells property for MT8188)
Merging thead-clk-fixes/thead-clk-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging pwrseq-fixes/pwrseq/for-current (19272b37aa4f Linux 6.16-rc1)
Merging thead-dt-fixes/thead-dt-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging ftrace-fixes/ftrace/fixes (327e28664307 fgraph: Do not enable funct=
ion_graph tracer when setting funcgraph-args)
Merging ring-buffer-fixes/ring-buffer/fixes (e4d4b8670c44 ring-buffer: Use =
flush_kernel_vmap_range() over flush_dcache_folio())
Merging trace-fixes/trace/fixes (8a157d8a00e8 tracing: Do not free "head" o=
n error path of filter_free_subsystem_filters())
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging tip-fixes/tip/urgent (234a269a51c9 Merge branch into tip/master: 'x=
86/urgent')
Merging slab-fixes/slab/for-next-fixes (be8250786ca9 mm, slab: clean up sla=
b->obj_exts always)
Merging drm-msm-fixes/msm-fixes (d3deabe4c619 drm/msm: Fix inverted WARN_ON=
() logic)
Merging uml-fixes/fixes (01f95500a162 Merge tag 'uml-for-linux-6.15-rc6' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux)
Merging fwctl-fixes/for-rc (19272b37aa4f Linux 6.16-rc1)
Merging devsec-tsm-fixes/fixes (fba4ceaa242d configfs-tsm-report: Fix NULL =
dereference of tsm_ops)
Merging drm-misc-fixes/for-linux-next-fixes (61ee19dedb8d drm/etnaviv: Prot=
ect the scheduler's pending list with its lock)
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (e04c78d86a96 Linux 6.16-rc2)
Merging mm-nonmm-stable/mm-nonmm-stable (e04c78d86a96 Linux 6.16-rc2)
Merging mm-unstable/mm-unstable (6baf594901f4 codetag: avoid unused alloc_t=
ags sections/symbols)
  0793914f4da7 ("lib-group_cpus-fix-null-pointer-dereference-from-group_cpu=
s_evenly-fix")
  134a760bde6f ("mm-add-oom-killer-maintainer-structure-fix")
  2f9c833e166d ("lib/group_cpus: fix NULL pointer dereference from group_cp=
us_evenly()")
  47b7f9928089 ("scripts/gdb: fix dentry_name() lookup")
  5019b754246e ("mm: add OOM killer maintainer structure")
  5c528a5fe189 ("mm-add-oom-killer-maintainer-structure-fix-checkpatch-fixe=
s")
  70908371ef1f ("MAINTAINERS: add missing files to mm page alloc section")
  831792c8f5c9 ("mm/hugetlb: don't crash when allocating a folio if there a=
re no resv")
  98660316fbaf ("mm/hugetlb: remove unnecessary holding of hugetlb_lock")
  a5dd240f375b ("MAINTAINERS: add tree entry to mm init block")
  b3ec13128023 ("mm/alloc_tag: fix the kmemleak false positive issue in the=
 allocation of the percpu variable tag->counters")
  e92676020a4c ("mm/damon/sysfs-schemes: free old damon_sysfs_scheme_filter=
->memcg_path on write")
  f5e1f0f2f071 ("fs/proc/task_mmu: fix PAGE_IS_PFNZERO detection for the hu=
ge zero folio")
CONFLICT (content): Merge conflict in .mailmap
CONFLICT (content): Merge conflict in include/linux/kmemleak.h
CONFLICT (content): Merge conflict in lib/alloc_tag.c
CONFLICT (content): Merge conflict in mm/kmemleak.c
Merging mm-nonmm-unstable/mm-nonmm-unstable (236a8970ed21 tools/accounting/=
delaytop: add delaytop to record top-n task delay)
Merging kbuild/for-next (0a1eab129fed kconfig: use memcmp instead of deprec=
ated bcmp)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (edf2cadf01e8 perf test: add test for BPF meta=
data collection)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (19272b37aa4f Linux 6.16-rc1)
Merging asm-generic/master (582847f97024 Makefile.kcov: apply needed compil=
er option unconditionally in CFLAGS_KCOV)
Merging alpha/alpha-next (1523226edda5 alpha: Use str_yes_no() helper in pc=
i_dac_dma_supported())
Merging arm/for-next (293bb049380e ARM: 9446/1: Disallow kernel mode NEON w=
hen IRQs are disabled)
Merging arm64/for-next/core (805f13e403cd arm64: stacktrace: Implement arch=
_stack_walk_reliable())
Merging arm-perf/for-next/perf (8c138a189f6d perf/arm-cmn: Add CMN S3 ACPI =
binding)
Merging arm-soc/for-next (ffa1d4e41f30 Merge branch 'soc/dt' into for-next)
Merging amlogic/for-next (9eefedf65051 Merge branch 'v6.17/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (2132bbd7aa16 Merge branch 'asahi-soc/=
drivers-6.17' into asahi-soc/for-next)
Merging aspeed/for-next (34c87a24e268 Merge branches 'aspeed/dt', 'aspeed/f=
ixes', 'aspeed/drivers', 'nuvoton/arm/dt' and 'nuvoton/arm64/dt' into for-n=
ext)
Merging at91/at91-next (19272b37aa4f Linux 6.16-rc1)
Merging broadcom/next (99c305403a13 Merge branch 'maintainers/next' into ne=
xt)
Merging davinci/davinci/for-next (19272b37aa4f Linux 6.16-rc1)
Merging drivers-memory/for-next (a0be20055d41 memory: omap-gpmx: Use dev_fw=
node())
Merging imx-mxs/for-next (d10fed8a5839 Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (f7ef352d45b7 arm64: dts: mediatek: mt8186: Add S=
quirtle Chromebooks)
Merging mvebu/for-next (89373e7d4125 Merge branch 'mvebu/dt' into mvebu/for=
-next)
Merging omap/for-next (6d658392b3f0 Merge branch 'omap-for-v6.16/drivers' i=
nto tmp/omap-next-20250508.062442)
Merging qcom/for-next (0672fe83ed07 Merge branches 'arm32-for-6.17', 'arm64=
-defconfig-fixes-for-6.16', 'arm64-defconfig-for-6.17', 'arm64-fixes-for-6.=
16', 'arm64-for-6.17', 'clk-for-6.17' and 'drivers-for-6.17' into for-next)
Merging renesas/next (37989b3bac6e Merge branches 'renesas-arm-defconfig-fo=
r-v6.17', 'renesas-drivers-for-v6.17', 'renesas-dt-bindings-for-v6.17' and =
'renesas-dts-for-v6.17' into renesas-next)
Merging reset/reset/next (1c64de886b88 dt-bindings: reset: sophgo: Add SG20=
44 bindings.)
Merging rockchip/for-next (4263d5b89173 Merge branch 'v6.17-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (a15edf91668b Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (719a2bed3aab Merge branch 'for-next/smccc/upda=
tes' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/lin=
ux into for-linux-next)
Merging sophgo/for-next (b8518378ffd3 riscv: dts: sophgo: sg2044: Add missi=
ng riscv,cbop-block-size property)
Merging sophgo-soc/soc-for-next (c8754c7deab4 soc: sophgo: cv1800: rtcsys: =
New driver (handling RTC only))
Merging spacemit/for-next (37df56ac5002 riscv: dts: spacemit: enable eMMC f=
or K1 SoC)
Merging stm32/stm32-next (dc392342b7bb ARM: dts: stm32: Add nvmem-cells to =
ethernet nodes for constant mac-addresses)
Merging sunxi/sunxi/for-next (713d48878e8a clk: sunxi-ng: a523: Mark MBUS c=
lock as critical)
Merging tee/next (c580875fc93a Merge branch 'optee_fix_for_6.16' into next)
Merging tegra/for-next (5e98350146c3 Merge branch for-6.16/arm64/dt into fo=
r-next)
Merging thead-dt/thead-dt-for-next (a4c95b924d51 riscv: dts: thead: Add dev=
ice tree VO clock controller)
Merging ti/ti-next (19272b37aa4f Linux 6.16-rc1)
Merging xilinx/for-next (487e52a21734 firmware: xilinx: Add debugfs support=
 for PM_GET_NODE_STATUS)
Merging clk/clk-next (b721267f02a1 Merge branch 'clk-fixes' into clk-next)
Merging clk-imx/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging clk-renesas/renesas-clk (8b8ca279752e clk: renesas: Add CPG/MSSR su=
pport to RZ/N2H SoC)
Merging thead-clk/thead-clk-for-next (50d4b157fa96 clk: thead: Add clock su=
pport for VO subsystem in T-HEAD TH1520 SoC)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (f78fb2576f22 platform/loongarch: laptop: =
Unregister generic_sub_drivers on exit)
Merging m68k/for-next (f440518f379d m68k: defconfig: Update defconfigs for =
v6.15-rc1)
Merging m68knommu/for-next (86731a2a651e Linux 6.16-rc3)
Merging microblaze/next (c0e7bb02f796 microblaze: Replace __ASSEMBLY__ with=
 __ASSEMBLER__ in non-uapi headers)
Merging mips/mips-next (5a0c749125c0 MIPS: loongson2ef: lemote-2f: add miss=
ing function prototypes)
Merging openrisc/for-next (f0eedcf22581 openrisc: Replace __ASSEMBLY__ with=
 __ASSEMBLER__ in non-uapi headers)
Merging parisc-hd/for-next (19272b37aa4f Linux 6.16-rc1)
Merging powerpc/next (8682a5749a3d MAINTAINERS: powerpc: Remove myself as a=
 reviewer)
Merging risc-v/for-next (306e57988197 Merge patch "riscv: defconfig: run sa=
vedefconfig to reorder it")
Merging riscv-dt/riscv-dt-for-next (19272b37aa4f Linux 6.16-rc1)
Merging riscv-soc/riscv-soc-for-next (9aec69887386 riscv: defconfig: enable=
 Andes SoC)
Merging s390/for-next (8dbba011a90a Merge branch 'fixes' into for-next)
Merging sh/for-next (19272b37aa4f Linux 6.16-rc1)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (cfc4ca8986bb Merge tag 'uml-for-linux-6.16-rc1' of git://=
git.kernel.org/pub/scm/linux/kernel/git/uml/linux)
Merging xtensa/xtensa-for-next (44a4ef59d550 xtensa: Replace __ASSEMBLY__ w=
ith __ASSEMBLER__ in non-uapi headers)
Merging fs-next (c8e10f0caf30 Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
CONFLICT (content): Merge conflict in include/linux/proc_fs.h
Merging printk/for-next (3f5857e726d8 Merge branch 'rework/ringbuffer-kunit=
-test' into for-next)
Merging pci/next (c10ba24fb5c9 Merge branch 'pci/misc')
Merging pstore/for-next/pstore (d679c2e1e8d9 pstore/zone: rewrite some comm=
ents for better understanding)
Merging hid/for-next (6e519c3e85d4 Merge branch 'for-6.17/core' into for-ne=
xt)
Merging i2c/i2c/for-next (a6c23dac756b i2c: k1: check for transfer error)
Merging i2c-host/i2c/i2c-host (e04c78d86a96 Linux 6.16-rc2)
Merging i3c/i3c/next (19272b37aa4f Linux 6.16-rc1)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (a41a9728941f hwmon: emc2305: Set initial =
PWM minimum value during probe based on thermal state)
Merging jc_docs/docs-next (5194439d70ba Documentation: treewide: Replace re=
maining spinics links with lore)
Merging v4l-dvb/next (803b9eabc649 media: v4l2-ctrls: Fix H264 SEPARATE_COL=
OUR_PLANE check)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (7ff27ee0fb1b Merge branch 'fixes' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (37bd81e08ed8 rust: cpufreq: use=
 c_ types from kernel prelude)
Merging cpupower/cpupower (14a3318b4ac8 pm: cpupower: Fix printing of CORE,=
 CPU fields in cpupower-monitor)
Merging devfreq/devfreq-next (a579e91b6fd2 PM / devfreq: rockchip-dfi: doub=
le count on RK3588)
Merging pmdomain/next (152d59f1ae40 pmdomain: arm: scmi_pm_domain: remove c=
ode clutter)
Merging opp/opp/linux-next (19272b37aa4f Linux 6.16-rc1)
Merging thermal/thermal/linux-next (e23cba0ab49a thermal/drivers/airoha: Fi=
x spelling mistake)
Merging rdma/for-next (c036993721a3 Maintainers: Remove QIB)
Merging net-next/main (5e95c0a3a55a netdevsim: fix UaF when counting Tx sta=
ts)
CONFLICT (content): Merge conflict in net/core/net_namespace.c
Merging bpf-next/for-next (41af159dfe0e Merge branch 'bpf-next/master' into=
 for-next)
Merging ipsec-next/master (4f4040ea5d3e net: ti: icssg-prueth: Add prp offl=
oad support to ICSSG driver)
Merging mlx5-next/mlx5-next (f550694e88b7 net/mlx5: Add IFC bits for PPCNT =
recovery counters group)
Merging netfilter-next/main (fc4842cd0f11 Merge branch 'netconsole-msgid' i=
nto main)
Merging ipvs-next/main (fc4842cd0f11 Merge branch 'netconsole-msgid' into m=
ain)
Merging bluetooth/master (dc3f099e8d70 Bluetooth: hci_core: Fix use-after-f=
ree in vhci_flush())
Merging wireless-next/for-next (757259db79fc ssb: use new GPIO line value s=
etter callbacks)
Merging ath-next/for-next (ed73728fd14e Merge tag 'mt76-next-2025-05-21' of=
 https://github.com/nbd168/wireless)
Merging iwlwifi-next/next (445241ba367a wifi: iwlwifi: pcie: fix non-MSIX h=
andshake register)
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (9358bdb9f9f5 mtd: fix possible integer overflow in er=
ase_xfer())
Merging nand/nand/next (4b5532d4581d mtd: nand: brcmnand: replace manual st=
ring choices with standard helpers)
Merging spi-nor/spi-nor/next (594c8df92b94 mtd: spi-nor: macronix: Add fixu=
ps for MX25L3255E)
Merging crypto/master (82a0302e7167 padata: Remove comment for reorder_work)
Merging libcrypto/libcrypto-next (9078a1078302 lib/crypto: x86/sha512: Remo=
ve unnecessary checks for nblocks=3D=3D0)
Merging drm/drm-next (9356b50af547 Merge tag 'drm-misc-next-2025-06-19' of =
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_ct.h
Merging drm-exynos/for-linux-next (19272b37aa4f Linux 6.16-rc1)
Merging drm-misc/for-linux-next (3828a643e808 arm64: dts: mediatek: mt8370:=
 Enable gpu support)
Merging amdgpu/drm-next (ea685ff30a51 drm/amdgpu/sdma5.2: init engine reset=
 mutex)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_sdm=
a.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dc.h
Applying: fix up bad merge of the amdgpu tree
Merging drm-intel/for-linux-next (4f9c81d64f03 drm/i915/snps_hdmi_pll: Use =
clamp() instead of max(min()))
Merging drm-msm/msm-next (ee11d953fd23 MAINTAINERS: .mailmap: update Rob Cl=
ark's email address)
Merging drm-msm-lumag/msm-next-lumag (ee1c98ae63d1 drm/msm/dp: add linux/io=
.h header to fix build errors)
Merging drm-nova/nova-next (19272b37aa4f Linux 6.16-rc1)
Merging drm-xe/drm-xe-next (3972872e459d drm/xe/ptl: Apply Wa_16026007364)
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (59d1fc7b3e1a fbdev: pm3fb: fix potential divide by =
zero)
Merging regmap/for-next (c8c4694ede7e regmap: kunit: Constify regmap_range_=
cfg array)
Merging sound/for-next (87aafc8580ac ALSA: intel8x0: Fix incorrect codec in=
dex usage in mixer for ICH4)
Merging ieee1394/for-next (81456710391d firewire: core: minor code refactor=
ing to localize table of gap count)
Merging sound-asoc/for-next (7b61068aeeff Merge remote-tracking branch 'aso=
c/for-6.17' into asoc-next)
Merging modules/modules-next (a0b018a495a3 module: Remove outdated comment =
about text_size)
Merging input/next (a95ef0199e80 Input: ims-pcu - check record size in ims_=
pcu_flash_firmware())
Merging block/for-next (2589cd050082 Merge branch 'io_uring-6.16' into for-=
next)
Merging device-mapper/for-next (9f2f6316d753 dm-stripe: small code cleanup)
Merging libata/for-next (a7b3b77fd111 ata: ahci: Disallow LPM for Asus B550=
-F motherboard)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (f5c755ef8100 mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (3d77b3cc7cc8 mfd: twl4030-irq: Remove redundant '=
node' variable)
CONFLICT (content): Merge conflict in drivers/mfd/twl4030-irq.c
Merging backlight/for-backlight-next (19272b37aa4f Linux 6.16-rc1)
Merging battery/for-next (58ae036172b5 power: supply: max1720x correct capa=
city computation)
Merging regulator/for-next (93bf44173cc3 Merge remote-tracking branch 'regu=
lator/for-6.17' into regulator-next)
Merging security/next (9fc86a85f36c lsm: trivial comment fix)
Merging apparmor/apparmor-next (1fdb22c54a5f apparmor: mitigate parser gene=
rating large xtables)
Merging integrity/next-integrity (aa9bb1b32594 ima: add a knob ima=3D to al=
low disabling IMA in kdump kernel)
Merging selinux/next (d821fdb20c97 Automated merge of 'dev' into 'next')
Merging smack/next (78fc6a94be25 smack: fix bug: invalid label of unix sock=
et file)
Merging tomoyo/master (f09079bd04a9 Merge tag 'powerpc-6.16-2' of git://git=
.kernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging tpmdd/next (e271ed52b344 Merge tag 'pm-6.16-rc1-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging watchdog/master (158f9f2f7152 watchdog: iTCO_wdt: Update the heartb=
eat value after clamping timeout)
Merging iommu/next (f9705d66fa71 iommu/tegra: Fix incorrect size calculatio=
n)
Merging audit/next (ae1ae11fb277 audit,module: restore audit logging in loa=
d failure case)
Merging devicetree/for-next (d205b07e7e85 dt-bindings: display: convert him=
ax,hx8357d.txt to yaml format)
Merging dt-krzk/for-next (6cd594ed969d ARM: dts: vt8500: Add L2 cache contr=
oller on WM8850/WM8950)
Merging mailbox/for-next (d0b497df02e9 mailbox: qcom-apcs-ipc: Assign OF no=
de to clock controller child device)
Merging spi/for-next (4f326fa62367 Merge remote-tracking branch 'spi/for-6.=
17' into spi-next)
Merging tip/master (99a9396fdc2e Merge branch into tip/master: 'x86/sev')
Merging clockevents/timers/drivers/next (d204e391a0d8 clocksource/drivers/r=
enesas-ostm: Unconditionally enable reprobe support)
Merging edac/edac-for-next (a3bf9ba771be Merge branch 'edac-urgent' into ed=
ac-for-next)
Merging ftrace/for-next (9cca84d73fae Merge tools/for-next)
Merging rcu/next (96d02a89721a rcutorture: Make BUSTED scenario check and l=
og readers)
Merging paulmck/non-rcu/next (e55dc2e5b2e3 Merge branches 'lkmm.2025.04.22a=
' and 'ratelimit.2025.05.08a' into HEAD)
Merging kvm/next (8046d29dde17 KVM: x86/mmu: Reject direct bits in gpa pass=
ed to KVM_PRE_FAULT_MEMORY)
Merging kvm-arm/next (1b85d923ba8c Merge branch kvm-arm64/misc-6.16 into kv=
marm-master/next)
Merging kvms390/next (d6c8097803cb KVM: s390: Simplify and move pv code)
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (2e7be1629966 RISC-V: KVM: Don't treat SBI=
 HFENCE calls as NOPs)
Merging kvm-x86/next (19272b37aa4f Linux 6.16-rc1)
Merging xen-tip/linux-next (7f9bbc1140ff xen/arm: call uaccess_ttbr0_enable=
 for dm_op hypercall)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (7b80bd301fa2 Merge branch 'for-6.16-fixes' int=
o for-next)
Merging sched-ext/for-next (8a010e248614 Merge branch 'for-6.17' into for-n=
ext)
Merging drivers-x86/for-next (73f0f2b52c5e platform/x86: wmi: Fix WMI devic=
e naming issue)
Merging chrome-platform/for-next (545daf90910e platform/chrome: chromeos_ps=
tore: Add ecc_size module parameter)
Merging chrome-platform-firmware/for-firmware-next (19272b37aa4f Linux 6.16=
-rc1)
Merging hsi/for-next (19272b37aa4f Linux 6.16-rc1)
Merging leds-lj/for-leds-next (426e0c8e8eed leds: lp8860: Check return valu=
e of devm_mutex_init())
Merging ipmi/for-next (8ffcb7560b4a ipmi: Fix strcpy source and destination=
 the same)
Merging driver-core/driver-core-next (b29929b819f3 driver core: Add device_=
link_test() for testing device link flags)
CONFLICT (modify/delete): drivers/infiniband/hw/qib/qib_sysfs.c deleted in =
HEAD and modified in driver-core/driver-core-next.  Version driver-core/dri=
ver-core-next of drivers/infiniband/hw/qib/qib_sysfs.c left in tree.
$ git rm -f drivers/infiniband/hw/qib/qib_sysfs.c
Merging usb/usb-next (9962d0433a86 usb: core: modify comments xhci_hc_drive=
r has HCD_MEMORY just like ehci ohci)
Merging thunderbolt/next (e04c78d86a96 Linux 6.16-rc2)
Merging usb-serial/usb-next (e04c78d86a96 Linux 6.16-rc2)
Merging tty/tty-next (7dfd023dc7a9 dt-bindings: serial: renesas,rsci: Docum=
ent RZ/N2H support)
$ git reset --hard HEAD^
Merging next-20250618 version of tty
Merging char-misc/char-misc-next (19272b37aa4f Linux 6.16-rc1)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (408c97c4a5e0 coresight: prevent deactivate active c=
onfig while enabling the config)
Merging fastrpc/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga/for-next (37e00703228a zynq_fpga: use sgtable-based scatterlis=
t wrappers)
Merging icc/icc-next (5fed7fe33c2c Merge branch 'icc-sa8775p' into icc-next)
Merging iio/togreg (0a2857e77859 iio: adc: ad7405: add ad7405 driver)
Merging phy-next/next (f0185cd59425 phy: qcom: add linux/bitfield.h header =
to fix a build error)
Merging soundwire/next (393350c1691f soundwire: update Intel BPT message le=
ngth limitation)
Merging extcon/extcon-next (195609a5d811 extcon: fsa9480: Avoid buffer over=
flow in fsa9480_handle_change())
Merging gnss/gnss-next (e04c78d86a96 Linux 6.16-rc2)
Merging vfio/next (4518e5a60c7f vfio/type1: Fix error unwind in migration d=
irty bitmap allocation)
Merging w1/for-next (19272b37aa4f Linux 6.16-rc1)
Merging spmi/spmi-next (0ff41df1cb26 Linux 6.15)
Merging staging/staging-next (9adc643d4383 staging: gpib: hp_82341: Replace=
 manual comparison with min/max macro)
Merging counter-next/counter-next (19272b37aa4f Linux 6.16-rc1)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (de266931dd99 dmaengine: apple-admac: Drop default A=
RCH_APPLE in Kconfig)
Merging cgroup/for-next (89bad5d60181 Merge branch 'for-6.16-fixes' into fo=
r-next)
Merging scsi/for-next (e10a66d035b9 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (15592a11d5a5 scsi: mpt3sas: Correctly handle ATA=
 device errors)
Merging vhost/linux-next (f248703d67a5 media: add virtio-media driver)
Merging rpmsg/for-next (d293da1e4dbe Merge branches 'rpmsg-next' and 'rproc=
-next' into for-next)
Merging gpio-brgl/gpio/for-next (fd19792851db gpio: sysfs: remove the mockd=
ev pointer from struct gpio_device)
Merging gpio-intel/for-next (9ab29ed50555 gpiolib: acpi: Add a quirk for Ac=
er Nitro V15)
Merging pinctrl/for-next (cc42860b8789 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (3b4408038da9 pinctrl: intel: fix build warn=
ings about export.h)
Merging pinctrl-renesas/renesas-pinctrl (52161035571c pinctrl: renesas: rzg=
2l: Validate pins before setting mux function)
Merging pinctrl-samsung/for-next (19272b37aa4f Linux 6.16-rc1)
Merging pwm/pwm/for-next (4467d30d0d56 dt-bindings: pwm: convert lpc1850-sc=
t-pwm.txt to yaml format)
Merging ktest/for-next (19272b37aa4f Linux 6.16-rc1)
Merging kselftest/next (e72fe8cbd8a0 selftests/ptrace: Fix spelling mistake=
 "multible" -> "multiple")
Merging kunit/test (19272b37aa4f Linux 6.16-rc1)
Merging kunit-next/kunit (e42ad39318df kunit: Add test for static stub)
Merging livepatching/for-next (a8e905a819fd Merge branch 'for-6.15/ftrace-t=
est' into for-next)
Merging rtc/rtc-next (19272b37aa4f Linux 6.16-rc1)
Merging nvdimm/libnvdimm-for-next (ef1d3455bbc1 libnvdimm/labels: Fix divid=
e error in nd_label_data_init())
Merging at24/at24/for-next (19272b37aa4f Linux 6.16-rc1)
Merging ntb/ntb-next (0cadf92e93d4 NTB/msi: Remove unused functions)
Merging seccomp/for-next/seccomp (a9b33aae79ce selftests: seccomp: Fix "per=
formace" to "performance")
Merging slimbus/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging nvmem/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (96959283a58d Drivers: hv: Always select CONFIG_=
SYSFB for Hyper-V guests)
Merging auxdisplay/for-next (19272b37aa4f Linux 6.16-rc1)
Merging kgdb/kgdb/for-next (afdbe49276ac kdb: Remove optional size argument=
s from strscpy() calls)
Merging hmm/hmm (19272b37aa4f Linux 6.16-rc1)
Merging cfi/cfi/next (19272b37aa4f Linux 6.16-rc1)
Merging mhi/mhi-next (3010503f3e06 bus: mhi: host: Fix endianness of BHI ve=
ctor table)
Merging memblock/for-next (3b394dff15e1 memblock tests: add test for memblo=
ck_set_node)
Merging cxl/next (a021802c18c4 cxl: docs/devices Fix typos and clarify word=
ing in device-types.rst)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (46550e2b878d include: pe.h: Fix PE definitions)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (3cf3ee6a0be4 slab: Update MAINTAINERS entry)
Merging random/master (3778dcb2dcc1 random: use offstack cpumask when neces=
sary)
Merging landlock/next (3f8d032afbf4 landlock: Fix warning from KUnit tests)
Merging rust/rust-next (dc35ddcf97e9 rust: enable `clippy::ref_as_ptr` lint)
Merging rust-alloc/alloc-next (f86c0036c7de rust: alloc: implement `Borrow`=
 and `BorrowMut` for `KBox`)
Merging rust-pin-init/pin-init-next (fc3870dc5cad rust: pin-init: examples,=
 tests: use `ignore` instead of conditionally compiling tests)
Merging rust-timekeeping/timekeeping-next (994393295c89 rust: time: Remove =
Ktime in hrtimer)
Merging rust-xarray/xarray-next (fa616196fbea MAINTAINERS: add entry for Ru=
st XArray API)
Merging sysctl/sysctl-next (f8dd46ea3a2b sysctl: Remove superfluous include=
s from kernel/sysctl.c)
Merging execve/for-next/execve (11854fe263eb binfmt_elf: Move brk for stati=
c PIE even if ASLR disabled)
Merging bitmap/bitmap-for-next (f271f089a6c3 watchdog: fix opencoded cpumas=
k_next_wrap() in watchdog_next_cpu())
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (29bb79e9dbf1 stddef: Introduce TRAILING_OVERLAP=
() helper macro)
Merging nolibc/for-next (cc6dc5fbecfd tools/nolibc: merge i386 and x86_64 i=
nto a single x86 arch)
Merging iommufd/for-next (3e2a9811f6a9 iommufd: Apply the new iommufd_objec=
t_alloc_ucmd helper)
Merging turbostat/next (447c98c1ca4a tools/power turbostat: Add idle govern=
or statistics reporting)
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.8
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.c
Merging pwrseq/pwrseq/for-next (19272b37aa4f Linux 6.16-rc1)
Merging capabilities-next/caps-next (4ae89b1fe7c2 capability: Remove unused=
 has_capability)
Merging ipe/next (324692100cc9 ipe: use SHA-256 library API instead of cryp=
to_shash API)
Merging kcsan/next (9d89551994a4 Linux 6.13-rc6)
Merging crc/crc-next (d73638c555b0 lib/crc: crc64: Add include/linux/crc64.=
h to kernel-api.rst)
CONFLICT (content): Merge conflict in lib/crc/s390/crc32.h
Merging fwctl/for-next (19272b37aa4f Linux 6.16-rc1)
Merging devsec-tsm/next (9d948b880409 Merge branch 'for-6.16/tsm-mr' into t=
sm-next)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)

--Sig_/bYFyCkj.YL/xPddNCZ7CMId
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhY+a8ACgkQAVBC80lX
0GzSSQgAh/OtmXZcNW0j3RYRJ69RKF7ch8mvRbrgCrpY7skGI2zGEcOcq7d10Fx/
QZLu6o5Ki/M6HhIOV64pQ21+PneuhC+1fO64D/lkWwjxmUq6Aqt/CgJzxBxjCByn
+sS6SHybBBV9oFdlN3M/mR8+quqvU5SPc6ocYi45hbqhXNp9XCOGyyYZ+RAXrMTq
BVNYmzzdNRyMt5aG+0AtHtlEIP+9w7/xmGt06fhNNY4j/41dPLqlciGRE8ZTNiMZ
wybLUb48dTj8QrWzkDxoHZjccrv61ORdPB/Cqq/VRxbmAUTpYJzcwGRHUf8jd7yw
AMDETZVxFPAqfkd+ArWIb807WRxYrA==
=iXT0
-----END PGP SIGNATURE-----

--Sig_/bYFyCkj.YL/xPddNCZ7CMId--

