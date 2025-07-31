Return-Path: <linux-next+bounces-7788-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7912DB16AE8
	for <lists+linux-next@lfdr.de>; Thu, 31 Jul 2025 05:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 606BE18C57D1
	for <lists+linux-next@lfdr.de>; Thu, 31 Jul 2025 03:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02747148827;
	Thu, 31 Jul 2025 03:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sBjay2Vp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263022F41;
	Thu, 31 Jul 2025 03:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753932801; cv=none; b=RTX9xN6lQWSbEXHn6XqEzgvRwcsSF7a4Ukpoc/doak28m1RtL/ul3FeZP45XQnY204TKUwWa/egk1Ubypq5jZAq/zmK/5G+wshhlgXETnuKcpnLkBIMebZoUJ+EZcIvvRQ3jed+LOOr/wMePo7xfJrkrYVs6lqUaHVQPiEl3GRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753932801; c=relaxed/simple;
	bh=SVyOD8nrqStwrUlbZi5e/B/X6PaNzu+jwkvv6HhEKcU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Zznat7Q2vcxPV3JEMC6OaVZQPHlYVU3ujIbafNFDePknS3A/oSsbhqVDyYjxtUMbWzRUiAvrB14dS1HOu+vUmT7lg0vwyqFoHyf6le3aitBO/gTp3gEBx0itkRNEbHbLStNUp1+73NYJalshWCoavw/+bpnii0kiStuO7Pn2vRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sBjay2Vp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753932570;
	bh=CJEuzkecdQ4UQKVga4buxShd+N8V6VgbqlRqSySArIw=;
	h=Date:From:To:Cc:Subject:From;
	b=sBjay2VptaV8YYY21o2cTWGC1/yzFSRm86zmzmfUsvKAxQi6y4hs6/OQj5Ej+4qtH
	 FloeUZ+/TRrehO2vq8sKDvqJ7ZRxZt1qnzUei7jauhf/IR2pwhnk/cnxHH7OKzyYiG
	 NU4IVj6KsvpGRNlExQYGLEg5J4fVsUGYFiVr3fwsO6yo/IuUZhqdWEnkYdxGHeHkeI
	 Ne4l+uddhKi6A3tKTEUsWmVOb51KsRxWmzLwngUXbSpZH5qY6sGSqhcTzLixSTPMDg
	 pCd3oM5rL49NLYq/ykkmR8+HSGkRl/rhLjH/c3H8kJwabuYKbfvtfX1vS1vpSSHRQc
	 PMJq1kbFN2ZLw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bsvhV4N9Hz4x7H;
	Thu, 31 Jul 2025 13:29:30 +1000 (AEST)
Date: Thu, 31 Jul 2025 13:33:11 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 31
Message-ID: <20250731133311.1a3e3867@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Buv6W.fQn/XPdrnJPZ0v+BE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Buv6W.fQn/XPdrnJPZ0v+BE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Please do not add any v6.18 material to your linux-next included
branches until after v6.17-rc1 has been released.

Changes since 20250730:

The btrfs tree still had several merge conflicts (due to duplicated
commits), so I dropped it for today.

The kbuild tree still had a build failure for which I reverted 3 commits.

Non-merge commits (relative to Linus' tree): 5555
 5525 files changed, 219013 insertions(+), 140781 deletions(-)

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

I am currently merging 405 trees (counting Linus' and 153 trees of bug
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
Merging origin/master (e8d780dcd957 Merge tag 'slab-for-6.17' of git://git.=
kernel.org/pub/scm/linux/kernel/git/vbabka/slab)
Merging fixes/fixes (89be9a83ccf1 Linux 6.16-rc7)
Merging ext4-fixes/fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging vfs-brauner-fixes/vfs.fixes (8b3c655fa240 afs: Set vllist to NULL i=
f addr parsing fails)
Merging fscrypt-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging fsverity-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging btrfs-fixes/next-fixes (296391a79b55 Merge branch 'misc-6.16' into =
next-fixes)
CONFLICT (content): Merge conflict in fs/btrfs/qgroup.c
[fs-current 5a8b5c98367c] Merge branch 'next-fixes' of git://git.kernel.org=
/pub/scm/linux/kernel/git/kdave/linux.git
Merging vfs-fixes/fixes (33927f3d0ecd habanalabs: fix UAF in export_dmabuf(=
))
Merging erofs-fixes/fixes (347e9f5043c8 Linux 6.16-rc6)
Merging nfsd-fixes/nfsd-fixes (94d10a4dba0b sunrpc: handle SVC_GARBAGE duri=
ng svc auth processing as auth error)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (924577e4f6ca ovl: Fix nested backing fil=
e paths)
Merging bcachefs/for-next (c0d938c16b67 bcachefs: Add missing error_throw t=
o bch2_set_version_incompat())
Merging fscrypt/for-next (fa65058063cb ceph: Remove gfp_t argument from cep=
h_fscrypt_encrypt_*())
Merging btrfs/for-next (841778d9fd80 Merge branch 'for-next-next-v6.16-2025=
0721' into for-next-20250721)
CONFLICT (content): Merge conflict in fs/btrfs/btrfs_inode.h
CONFLICT (content): Merge conflict in fs/btrfs/extent_io.c
CONFLICT (content): Merge conflict in fs/btrfs/subpage.h
CONFLICT (content): Merge conflict in fs/btrfs/tree-log.c
$ git merge --abort
Merging ceph/master (b828b4bf29d1 ceph: fix variable dereferenced before ch=
eck in ceph_umount_begin())
Merging cifs/for-next (78d2024c9676 smb3 client: add way to show directory =
leases for improved debugging)
Merging configfs/configfs-next (c6b190822459 MAINTAINERS: add configfs Rust=
 abstractions)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (6f8b4788266c dlm: drop SCTP Kconfig dependency)
Merging erofs/dev (df0ce6cefa45 erofs: support to readahead dirent blocks i=
n erofs_readdir())
Merging exfat/dev (1edbfabb7967 exfat: add cluster chain loop check for dir)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (17e58687367a Merge fsnotify changes with fixed up au=
thorship.)
Merging ext4/dev (099b847ccc6c ext4: do not BUG when INLINE_DATA_FL lacks s=
ystem.data xattr)
Merging f2fs/dev (078cad8212ce f2fs: drop inode from the donation list when=
 the last file is closed)
Merging fsverity/for-next (d0b3b7b22dfa Linux 6.16-rc4)
Merging fuse/for-next (f0e84022479b virtio_fs: Remove redundant spinlock in=
 virtio_fs_request_complete())
Merging gfs2/for-next (a90f1b6ad664 Merge tag 'gfs2-for-6.17' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2)
Merging jfs/jfs-next (856db3759202 jfs: fix metapage reference count leak i=
n dbAllocCtl)
Merging ksmbd/ksmbd-for-next (e5cf61fa6e2f Merge tag 'v6.17-rc-smb3-server-=
fixes' of git://git.samba.org/ksmbd)
Merging nfs/linux-next (99765233ab42 NFS: Fixup allocation flags for nfsiod=
's __GFP_NORETRY)
Merging nfs-anna/linux-next (38074de35b01 NFSv4/flexfiles: Fix handling of =
NFS level errors in I/O)
Merging nfsd/nfsd-next (e339967eecf1 nfsd: Drop dprintk in blocklayout xdr =
functions)
Merging ntfs3/master (a49f0abd8959 Revert "fs/ntfs3: Replace inode_trylock =
with inode_lock")
Merging orangefs/for-next (2138e89cb066 fs/orangefs: Allow 2 more character=
s in do_c_string())
Merging overlayfs/overlayfs-next (6f9ccdad0fea ovl: Annotate struct ovl_ent=
ry with __counted_by())
Merging ubifs/next (99dbb2a1bd66 ubifs: stop using write_cache_pages)
Merging v9fs/9p-next (4210030d8bc4 docs: fs/9p: Add missing "not" in cache =
documentation)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (ded74fddcaf6 xfs: don't use a xfs_log_iovec for ri_bu=
f in log recovery)
Merging zonefs/for-next (6982100bb829 zonefs: use ZONEFS_SUPER_SIZE instead=
 of PAGE_SIZE)
Merging vfs-brauner/vfs.all (66639db85811 Merge branch 'vfs-6.17.iomap' int=
o vfs.all)
CONFLICT (content): Merge conflict in Documentation/filesystems/porting.rst
CONFLICT (content): Merge conflict in fs/coredump.c
CONFLICT (content): Merge conflict in tools/testing/selftests/coredump/stac=
kdump_test.c
Merging vfs/for-next (dd589648208a Merge branch 'work.mount' into for-next)
CONFLICT (content): Merge conflict in Documentation/filesystems/porting.rst
Merging mm-hotfixes/mm-hotfixes-unstable (f01a22f845d8 mm: shmem: fix the s=
hmem large folio allocation for the i915 driver)
Merging fs-current (9cd762a970a8 Merge branch 'fixes' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging kbuild-current/fixes (e04c78d86a96 Linux 6.16-rc2)
Merging arc-current/for-curr (d7b8f8e20813 Linux 6.16-rc5)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (d42e6c20de61 arm64/entry: Mask DAIF in =
cpu_switch_to(), call_on_irq_stack())
Merging arm-soc-fixes/arm/fixes (9f9d41d64322 Merge tag 'arm-soc/for-6.17/d=
rivers-part2' of https://github.com/Broadcom/stblinux into arm/fixes)
Merging davinci-current/davinci/for-current (19272b37aa4f Linux 6.16-rc1)
Merging drivers-memory-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging sophgo-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging sophgo-soc-fixes/soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging m68k-current/for-linus (c8995932db2b m68k: mac: Improve clocksource=
 driver commentary)
Merging powerpc-fixes/fixes (ab107276607a powerpc: Fix struct termio relate=
d ioctl macros)
Merging s390-fixes/fixes (62355f1f87b8 s390/pci: Allow automatic recovery w=
ith minimal driver support)
Merging net/main (d9104cec3e8f Merge tag 'bpf-next-6.17' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/bpf/bpf-next)
Merging bpf/master (e8d780dcd957 Merge tag 'slab-for-6.17' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/vbabka/slab)
Merging ipsec/master (28712d6ed320 Merge branch 'ipsec: fix splat due to ip=
comp fallback tunnel')
Merging netfilter/main (eccf7a3480a0 Merge tag 'linux-can-fixes-for-6.16-20=
250725' of git://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can)
Merging ipvs/main (eccf7a3480a0 Merge tag 'linux-can-fixes-for-6.16-2025072=
5' of git://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can)
Merging wireless/for-next (6832a9317eee Merge tag 'net-6.16-rc7' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ath/for-current (6832a9317eee Merge tag 'net-6.16-rc7' of git://git=
.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging iwlwifi/fixes (6832a9317eee Merge tag 'net-6.16-rc7' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (a9a9e68954f2 RDMA/mlx5: Fix vport loopback for M=
PV device)
Merging sound-current/for-linus (a9dec0963187 ALSA: hda/realtek - Fix mute =
LED for HP Victus 16-d1xxx (MB 8A26))
Merging sound-asoc-fixes/for-linus (77695ab76c0d Merge remote-tracking bran=
ch 'asoc/for-6.16' into asoc-linus)
Merging regmap-fixes/for-linus (c871c199accb regmap: fix potential memory l=
eak of regmap_bus)
Merging regulator-fixes/for-linus (10dfd36f0784 regulator: core: correct co=
nvergence check in regulator_set_voltage())
Merging spi-fixes/for-linus (618393ea7752 Merge remote-tracking branch 'spi=
/for-6.16' into spi-linus)
Merging pci-current/for-linus (19272b37aa4f Linux 6.16-rc1)
Merging driver-core.current/driver-core-linus (beb6c8326eb4 Merge tag 'uml-=
for-linux-6.17-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/uml/li=
nux)
Merging tty.current/tty-linus (beb6c8326eb4 Merge tag 'uml-for-linux-6.17-r=
c1' of git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux)
Merging usb.current/usb-linus (beb6c8326eb4 Merge tag 'uml-for-linux-6.17-r=
c1' of git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux)
Merging usb-serial-fixes/usb-linus (ad1244e1ce18 USB: serial: option: add F=
oxconn T99W709)
Merging phy/fixes (89be9a83ccf1 Linux 6.16-rc7)
Merging staging.current/staging-linus (beb6c8326eb4 Merge tag 'uml-for-linu=
x-6.17-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux)
Merging iio-fixes/fixes-togreg (ae68ad3d7a93 MAINTAINERS: add miscdevice Ru=
st abstractions)
Merging counter-current/counter-current (19272b37aa4f Linux 6.16-rc1)
Merging char-misc.current/char-misc-linus (4b290aae788e Merge tag 'sysctl-6=
.17-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl)
Merging soundwire-fixes/fixes (89be9a83ccf1 Linux 6.16-rc7)
Merging thunderbolt-fixes/fixes (038d61fd6422 Linux 6.16)
Merging input-current/for-linus (bcce05041b21 Input: xpad - set correct con=
troller type for Acer NGR200)
Merging crypto-current/master (bf24d6426854 crypto: keembay - Use min() to =
simplify ocs_create_linked_list_from_sg())
Merging libcrypto-fixes/libcrypto-fixes (68279380266a crypto: s390/sha - Fi=
x uninitialized variable in SHA-1 and SHA-2)
Merging vfio-fixes/for-linus (c1d9dac0db16 vfio/pci: Align huge faults to o=
rder)
Merging kselftest-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging dmaengine-fixes/fixes (89be9a83ccf1 Linux 6.16-rc7)
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
Merging kvm-fixes/master (038d61fd6422 Linux 6.16)
Merging kvms390-fixes/master (d8dfda5af0be KVM: s390: pv: fix race when mak=
ing a page secure)
Merging hwmon-fixes/hwmon (9c62e2282900 hwmon: (gsc-hwmon) fix fan pwm setp=
oint show functions)
Merging nvdimm-fixes/libnvdimm-fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging cxl-fixes/fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging dma-mapping-fixes/dma-mapping-fixes (aa807b9f22df dma-contiguous: h=
ornor the cma address limit setup by user)
Merging drivers-x86-fixes/fixes (e2967b50b709 MAINTAINERS: Update entries f=
or IFS and SBL drivers)
Merging samsung-krzk-fixes/fixes (8d2c2fa2209e firmware: exynos-acpm: fix t=
imeouts on xfers handling)
Merging pinctrl-samsung-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging devicetree-fixes/dt/linus (79aef1a3705b of: Clarify OF device conte=
xt in of_match_device() comment)
Merging dt-krzk-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging scsi-fixes/fixes (021f243627ea scsi: ufs: core: Fix spelling of a s=
ysfs attribute name)
Merging drm-fixes/drm-fixes (038d61fd6422 Linux 6.16)
Merging drm-intel-fixes/for-linux-next-fixes (038d61fd6422 Linux 6.16)
Merging mmc-fixes/fixes (4b290aae788e Merge tag 'sysctl-6.17-rc1' of git://=
git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl)
Merging rtc-fixes/rtc-fixes (08d82d0cad51 rtc: pcf2127: add missing semicol=
on after statement)
Merging gnss-fixes/gnss-linus (86731a2a651e Linux 6.16-rc3)
Merging hyperv-fixes/hyperv-fixes (a4131a50d072 tools/hv: fcopy: Fix irregu=
larities with size of ring buffer)
Merging risc-v-fixes/fixes (b65ca21835ed riscv: uaccess: Fix -Wuninitialize=
d and -Wshadow in __put_user_nocheck)
Merging riscv-dt-fixes/riscv-dt-fixes (19272b37aa4f Linux 6.16-rc1)
Merging riscv-soc-fixes/riscv-soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging spdx/spdx-linus (beb6c8326eb4 Merge tag 'uml-for-linux-6.17-rc1' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux)
Merging gpio-brgl-fixes/gpio/for-current (89be9a83ccf1 Linux 6.16-rc7)
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
Merging efi-fixes/urgent (64e135f1eaba efivarfs: Fix memory leak of efivarf=
s_fs_info in fs_context error paths)
Merging battery-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging iommufd-fixes/for-rc (9a96876e3c65 iommufd/selftest: Fix build warn=
ings due to uninitialized mfd)
Merging rust-fixes/rust-fixes (038d61fd6422 Linux 6.16)
Merging w1-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging pmdomain-fixes/fixes (621a88dbfe90 cpuidle: psci: Fix cpuhotplug ro=
utine with PREEMPT_RT=3Dy)
Merging i2c-host-fixes/i2c/i2c-host-fixes (0ae982df6776 Merge tag 'i2c-for-=
6.17-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (e4b2a0c2b9be Merge tag 'sunxi-clk-fixes-for-6.=
16' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into clk=
-fixes)
Merging thead-clk-fixes/thead-clk-fixes (19272b37aa4f Linux 6.16-rc1)
Merging pwrseq-fixes/pwrseq/for-current (19272b37aa4f Linux 6.16-rc1)
Merging thead-dt-fixes/thead-dt-fixes (19272b37aa4f Linux 6.16-rc1)
Merging ftrace-fixes/ftrace/fixes (327e28664307 fgraph: Do not enable funct=
ion_graph tracer when setting funcgraph-args)
Merging ring-buffer-fixes/ring-buffer/fixes (e4d4b8670c44 ring-buffer: Use =
flush_kernel_vmap_range() over flush_dcache_folio())
Merging trace-fixes/trace/fixes (b5e8acc14dcb tracing: Add down_write(trace=
_event_sem) when adding trace event)
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging tip-fixes/tip/urgent (98e8f2c0e093 Merge tag 'x86-platform-2025-07-=
29' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging slab-fixes/slab/for-next-fixes (be8250786ca9 mm, slab: clean up sla=
b->obj_exts always)
Merging drm-msm-fixes/msm-fixes (d3deabe4c619 drm/msm: Fix inverted WARN_ON=
() logic)
Merging uml-fixes/fixes (2dca89df0d11 Merge tag 'uml-for-6.16-rc4' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/uml/linux)
Merging fwctl-fixes/for-rc (19272b37aa4f Linux 6.16-rc1)
Merging devsec-tsm-fixes/fixes (fba4ceaa242d configfs-tsm-report: Fix NULL =
dereference of tsm_ops)
Merging drm-misc-fixes/for-linux-next-fixes (038d61fd6422 Linux 6.16)
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (af915c3c13b6 MAINTAINERS: add missing headers =
to mempory policy & migration section)
CONFLICT (content): Merge conflict in include/linux/proc_fs.h
Merging mm-nonmm-stable/mm-nonmm-stable (a9ed4422adac lib/raid6: update rec=
ov_rvv.c zero page usage)
CONFLICT (content): Merge conflict in kernel/panic.c
Merging mm-unstable/mm-unstable (01da54f10fdd mm: fixup very disguised vmal=
loc flags parameter)
Merging mm-nonmm-unstable/mm-nonmm-unstable (43f5de099338 kho-add-test-for-=
kexec-handover-fix)
CONFLICT (content): Merge conflict in lib/Kconfig.debug
Merging kbuild/for-next (dae742fa564b kheaders: make it possible to overrid=
e TAR)
Applying: Revert "kbuild: vmlinux.unstripped should always depend on .vmlin=
ux.export.o"
Applying: Revert "modpost: Create modalias for builtin modules"
Applying: Revert "modpost: Add modname to mod_device_table alias"
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (b91a9abbf473 perf list: Skip ABI PMUs when pr=
inting pmu values)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (fbf5e2234169 dma-mapping: properl=
y calculate offset in the page)
Merging asm-generic/master (582847f97024 Makefile.kcov: apply needed compil=
er option unconditionally in CFLAGS_KCOV)
Merging alpha/alpha-next (1523226edda5 alpha: Use str_yes_no() helper in pc=
i_dac_dma_supported())
Merging arm/for-next (8dd85887ad83 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (5b1ae9de7133 Merge branch 'for-next/feat_mte_s=
tore_only' into for-next/core)
Merging arm-perf/for-next/perf (e480898e767c drivers/perf: hisi: Support PM=
Us with no interrupt)
Merging arm-soc/for-next (9f9d41d64322 Merge tag 'arm-soc/for-6.17/drivers-=
part2' of https://github.com/Broadcom/stblinux into arm/fixes)
Merging amlogic/for-next (58abdca0eb65 Merge branch 'v6.17/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (19272b37aa4f Linux 6.16-rc1)
Merging at91/at91-next (e99113d11171 Merge branch 'clk-microchip' into at91=
-next)
Merging bmc/for-next (0741a5ca8643 Merge branches 'aspeed/drivers', 'aspeed=
/dt', 'nuvoton/arm/dt' and 'nuvoton/arm64/dt' into for-next)
Merging broadcom/next (89abb622d518 Merge branch 'drivers/next' into next)
  36e97205b507 ("dt-bindings: clock: rp1: Add missing MIPI DSI defines")
  abb787a63fb9 ("clk: rp1: Implement remaining clock tree")
Merging davinci/davinci/for-next (19272b37aa4f Linux 6.16-rc1)
Merging drivers-memory/for-next (93a7aedc4cc4 dt-bindings: memory: renesas,=
rzg3e-xspi: Document RZ/V2H(P) and RZ/V2N support)
Merging fsl/soc_fsl (8b3da0519ae6 soc: fsl: qe: convert set_multiple() to r=
eturning an integer)
Merging imx-mxs/for-next (cdc22fb12eff Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (6cbb623586d5 Merge branches 'v6.16-next/arm32', =
'v6.16-next/dts32', 'v6.16-next/dts64' and 'v6.16-next/soc' into for-next)
Merging mvebu/for-next (88084e0358ff Merge branch 'mvebu/dt' into mvebu/for=
-next)
Merging omap/for-next (db91121f001a Merge branch 'omap-for-v6.17/soc' into =
tmp/omap-next-20250707.142928)
Merging qcom/for-next (ba94ec807b07 Merge branches 'arm32-for-6.17', 'arm64=
-defconfig-fixes-for-6.16', 'arm64-defconfig-for-6.17', 'arm64-fixes-for-6.=
16', 'arm64-for-6.17', 'clk-for-6.17' and 'drivers-for-6.17' into for-next)
Merging renesas/next (7a323accaf6b Merge branches 'renesas-arm-defconfig-fo=
r-v6.17', 'renesas-drivers-for-v6.17', 'renesas-dt-bindings-for-v6.17' and =
'renesas-dts-for-v6.17' into renesas-next)
Merging reset/reset/next (196dbace0824 dt-bindings: reset: Convert snps,dw-=
reset to DT schema)
Merging rockchip/for-next (1f0c7abd8235 Merge branch 'v6.16-armsoc/dtsfixes=
' into for-next)
Merging samsung-krzk/for-next (94f19ac4670d Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (038d61fd6422 Linux 6.16)
Merging sophgo/for-next (349ae53a949c Merge branch 'dt/riscv' into for-next)
Merging sophgo-soc/soc-for-next (c8754c7deab4 soc: sophgo: cv1800: rtcsys: =
New driver (handling RTC only))
Merging spacemit/for-next (6be7a5a768aa Merge branch 'spacemit-clk-for-6.17=
' into spacemit-for-next)
Merging stm32/stm32-next (1a32f7427eb3 arm64: dts: st: remove empty line in=
 stm32mp251.dtsi)
Merging sunxi/sunxi/for-next (cbe908fc8ebb Merge branch 'sunxi/dt-for-6.17'=
 into sunxi/for-next)
Merging tee/next (c580875fc93a Merge branch 'optee_fix_for_6.16' into next)
Merging tegra/for-next (19272b37aa4f Linux 6.16-rc1)
Merging thead-dt/thead-dt-for-next (c31f2899eab0 riscv: dts: thead: Add PVT=
 node)
Merging ti/ti-next (65f6e3eb6351 Merge branch 'ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (7f9c1c0a006e Merge branch 'zynqmp/soc' into for-ne=
xt2)
Merging clk/clk-next (3cf186ecc164 Merge branch 'clk-pm' into clk-next)
CONFLICT (content): Merge conflict in drivers/clk/imx/clk-imx95-blk-ctl.c
Merging clk-imx/for-next (c78865241ecf MAINTAINERS: Update i.MX Clock Entry)
Merging clk-renesas/renesas-clk (0ab2d84f94da clk: renesas: r9a08g045: Add =
MSTOP for coupled clocks as well)
Merging thead-clk/thead-clk-for-next (54edba916e29 clk: thead: th1520-ap: D=
escribe mux clocks with clk_mux)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (36d09b96d3e7 LoongArch: KVM: Add tracepoi=
nts for CPUCFG and CSR emulation exits)
Merging m68k/for-next (c8995932db2b m68k: mac: Improve clocksource driver c=
ommentary)
Merging m68knommu/for-next (89be9a83ccf1 Linux 6.16-rc7)
Merging microblaze/next (c0e7bb02f796 microblaze: Replace __ASSEMBLY__ with=
 __ASSEMBLER__ in non-uapi headers)
Merging mips/mips-next (3ebcbf079c26 MIPS: Don't use %pK through printk)
Merging openrisc/for-next (f0eedcf22581 openrisc: Replace __ASSEMBLY__ with=
 __ASSEMBLER__ in non-uapi headers)
Merging parisc-hd/for-next (89f686a0fb6e parisc: Revise __get_user() to pro=
be user read access)
Merging powerpc/next (cf2a6de32cab powerpc64/bpf: Add jit support for load_=
acquire and store_release)
Merging risc-v/for-next (fda589c28604 Merge patch series "Move duplicated i=
nstructions macros into asm/insn.h")
Merging riscv-dt/riscv-dt-for-next (28fa0dcb571a dt-bindings: riscv: cpus: =
Add AMD MicroBlaze V 64bit compatible)
Merging riscv-soc/riscv-soc-for-next (bd4d5d3faadc riscv: defconfig: spacem=
it: enable sdhci driver for K1 SoC)
Merging s390/for-next (54743383452e Merge branch 'features' into for-next)
Merging sh/for-next (c32969d0362a sh: Do not use hyphen in exported variabl=
e name)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (fc9ed2f6589d um: Replace __ASSEMBLY__ with __ASSEMBLER__ =
in the usermode headers)
Merging xtensa/xtensa-for-next (44a4ef59d550 xtensa: Replace __ASSEMBLY__ w=
ith __ASSEMBLER__ in non-uapi headers)
Merging fs-next (b8491eed1930 Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (dcc3191a3dde Merge branch 'rework/ringbuffer-kunit=
-test' into for-next)
Merging pci/next (e046b1731006 Merge branch 'pci/misc')
CONFLICT (content): Merge conflict in drivers/pci/pci.c
Merging pstore/for-next/pstore (d679c2e1e8d9 pstore/zone: rewrite some comm=
ents for better understanding)
Merging hid/for-next (1330eb33bddc Merge branch 'for-6.17/core' into for-ne=
xt)
Merging i2c/i2c/for-next (0a5c73a0b158 Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i2c-host/i2c/i2c-host (85c34532849d i2c: qcom-geni: fix I2C frequen=
cy table to achieve accurate bus rates)
Merging i3c/i3c/next (99008720736a i3c: add missing include to internal hea=
der)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (de1fffd88600 dt-bindings: hwmon: Replace =
bouncing Alexandru Tachici emails)
Merging jc_docs/docs-next (35293ebbb65e scripts: add origin commit identifi=
cation based on specific patterns)
CONFLICT (content): Merge conflict in Documentation/userspace-api/ioctl/ioc=
tl-number.rst
CONFLICT (content): Merge conflict in MAINTAINERS
Merging v4l-dvb/next (d968e50b5c26 media: rkvdec: Unstage the driver)
CONFLICT (content): Merge conflict in .mailmap
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (77d832285656 Merge branch 'pm-cpufreq' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (bbd67be5546d cpufreq: mediatek-=
hw: Add support for MT8196)
Merging cpupower/cpupower (e6c3f96141eb cpupower: Allow control of boost fe=
ature on non-x86 based systems with boost support.)
Merging devfreq/devfreq-next (7da2fdaaa1e6 PM / devfreq: Add HiSilicon unco=
re frequency scaling driver)
Merging pmdomain/next (05e35bd07d56 pmdomain: qcom: rpmhpd: Add Glymur RPMh=
 Power Domains)
Merging opp/opp/linux-next (22679d807dea rust: opp: use c_* types via kerne=
l prelude)
Merging thermal/thermal/linux-next (1d264d3a1988 dt-bindings: thermal: tegr=
a: Document Tegra210B01)
Merging rdma/for-next (ee235923d205 RDMA/siw: Change maintainer email addre=
ss)
CONFLICT (modify/delete): drivers/infiniband/hw/qib/qib_sysfs.c deleted in =
rdma/for-next and modified in HEAD.  Version HEAD of drivers/infiniband/hw/=
qib/qib_sysfs.c left in tree.
$ git rm -f drivers/infiniband/hw/qib/qib_sysfs.c
Merging net-next/main (d9104cec3e8f Merge tag 'bpf-next-6.17' of git://git.=
kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next)
Merging bpf-next/for-next (e8d780dcd957 Merge tag 'slab-for-6.17' of git://=
git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab)
Merging ipsec-next/master (95cfe23285a6 xfrm: Skip redundant statistics upd=
ate for crypto offload)
Merging mlx5-next/mlx5-next (888a7776f4fb net/mlx5: Add support for device =
steering tag)
Merging netfilter-next/main (e3f96b3556e4 Merge branch 'net-dsa-microchip-a=
dd-ksz8463-switch-support')
Merging ipvs-next/main (e3f96b3556e4 Merge branch 'net-dsa-microchip-add-ks=
z8463-switch-support')
Merging bluetooth/master (9c533991fe15 Bluetooth: hci_conn: Fix not cleanin=
g up Broadcaster/Broadcast Source)
Merging wireless-next/for-next (126d85fb0405 Merge tag 'wireless-next-2025-=
07-24' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless=
-next)
Merging ath-next/for-next (708243c62efd wifi: mac80211: fix unassigned vari=
able access)
Merging iwlwifi-next/next (d2af710d6d50 wifi: iwlwifi: mvm/fw: Avoid -Wflex=
-array-member-not-at-end warnings)
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (56eb7c13b97c mtd: map: Don't use "proxy" headers)
Merging nand/nand/next (fb2fae70e7e9 mtd: spinand: winbond: Add comment abo=
ut the maximum frequency)
Merging spi-nor/spi-nor/next (2e3a7476ec39 mtd: spi-nor: Fix spi_nor_try_un=
lock_all())
Merging crypto/master (bf24d6426854 crypto: keembay - Use min() to simplify=
 ocs_create_linked_list_from_sg())
Merging libcrypto/libcrypto-next (2a1a127aecf6 Merge branches 'libcrypto-co=
nversions' and 'libcrypto-tests' into libcrypto-next)
Merging drm/drm-next (711fa2667d8b Merge tag 'drm-misc-next-fixes-2025-07-2=
4' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_dev=
ice.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_fen=
ce.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_rin=
g.h
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
CONFLICT (content): Merge conflict in drivers/gpu/drm/etnaviv/etnaviv_sched=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/virtio/virtgpu_prime.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/display/xe_display=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_ggtt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_gt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_gt_sriov_pf_con=
fig.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_ct.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_ct.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_hwmon.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_lmtt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_lrc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_module.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_uc_fw.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_wa_oob.rules
CONFLICT (content): Merge conflict in drivers/gpu/nova-core/driver.rs
Applying: fix up bad merge of the amdgpu tree
Merging drm-exynos/for-linux-next (19272b37aa4f Linux 6.16-rc1)
Merging drm-misc/for-linux-next (b213eb34f857 drm/tidss: oldi: convert to d=
evm_drm_bridge_alloc() API)
Merging amdgpu/drm-next (9f1f7cd46735 drm/amdgpu: fix module parameter desc=
ription)
Merging drm-intel/for-linux-next (5a569ef4d4ab drm/i915/display: Set C10_VD=
R_CTRL_MSGBUS_ACCESS before phy reg read)
Merging drm-msm/msm-next (8290d37ad2b0 drm/msm: Small function param doc fi=
x)
Merging drm-msm-lumag/msm-next-lumag (cd86e80b77b2 drm/msm/dp: add linux/io=
.h header to fix build errors)
Merging drm-nova/nova-next (14ae91a81ec8 gpu: nova-core: fix bounds check i=
n PmuLookupTableEntry::new)
Merging drm-xe/drm-xe-next (552dbba1caaf drm/xe/vf: Disable CSC support on =
VF)
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (81b96e4aef95 fbcon: Use 'bool' where appopriate)
Merging regmap/for-next (58e6b2cce564 Merge remote-tracking branch 'regmap/=
for-6.17' into regmap-next)
Merging sound/for-next (a9dec0963187 ALSA: hda/realtek - Fix mute LED for H=
P Victus 16-d1xxx (MB 8A26))
Merging ieee1394/for-next (95a042a0c8ec firewire: ohci: reduce the size of =
common context structure by extracting members into AT structure)
Merging sound-asoc/for-next (77695ab76c0d Merge remote-tracking branch 'aso=
c/for-6.16' into asoc-linus)
Merging modules/modules-next (699657e8e50a kunit: test: Drop CONFIG_MODULE =
ifdeffery)
CONFLICT (content): Merge conflict in include/linux/module.h
Merging input/next (1c44b818b81b Input: st1232 - add touch-overlay handling)
CONFLICT (modify/delete): drivers/input/keyboard/adp5589-keys.c deleted in =
HEAD and modified in input/next.  Version input/next of drivers/input/keybo=
ard/adp5589-keys.c left in tree.
$ git rm -f drivers/input/keyboard/adp5589-keys.c
Merging block/for-next (46438473667e Merge branch 'io_uring-6.17' into for-=
next)
Merging device-mapper/for-next (035663ceb5da dm-raid: do not include dm-cor=
e.h)
CONFLICT (content): Merge conflict in drivers/md/dm-stripe.c
Merging libata/for-next (546527b92d7e Documentation: driver-api: Update lib=
ata error handler information)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (4b290aae788e Merge tag 'sysctl-6.17-rc1' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/sysctl/sysctl)
Merging mfd/for-mfd-next (b6bf74c82178 mfd: dt-bindings: Convert TPS65910 t=
o DT schema)
Merging backlight/for-backlight-next (19272b37aa4f Linux 6.16-rc1)
Merging battery/for-next (7b41a2341fa6 power: supply: core: fix static chec=
ker warning)
Merging regulator/for-next (10dfd36f0784 regulator: core: correct convergen=
ce check in regulator_set_voltage())
Merging security/next (5d8b97c94677 MAINTAINERS: Add Xiu and myself as Lock=
down maintainers)
Merging apparmor/apparmor-next (43584e993293 apparmor: fix Regression on li=
nux-next (next-20250721))
Merging integrity/next-integrity (aa9bb1b32594 ima: add a knob ima=3D to al=
low disabling IMA in kdump kernel)
Merging selinux/next (850dada4b3af Automated merge of 'dev' into 'next')
Merging smack/next (6ddd169d0288 smack: fix kernel-doc warnings for smk_imp=
ort_valid_label())
Merging tomoyo/master (038d61fd6422 Linux 6.16)
Merging tpmdd/next (7f0c6675b319 tpm_crb_ffa: handle tpm busy return code)
Merging watchdog/master (48defdf6b083 watchdog: sbsa: Adjust keepalive time=
out to avoid MediaTek WS0 race condition)
Merging iommu/next (b9e6e8ae0a5f Merge branch 'arm/smmu/updates' into next)
Merging audit/next (ae1ae11fb277 audit,module: restore audit logging in loa=
d failure case)
Merging devicetree/for-next (0121898ec05f dt-bindings: Correct indentation =
and style in DTS example)
Merging dt-krzk/for-next (6cd594ed969d ARM: dts: vt8500: Add L2 cache contr=
oller on WM8850/WM8950)
Merging mailbox/for-next (872798f61d8b dt-bindings: mailbox: qcom-ipcc: doc=
ument the SM7635 Inter-Processor Communication Controller)
CONFLICT (content): Merge conflict in drivers/mailbox/Kconfig
CONFLICT (content): Merge conflict in drivers/mailbox/Makefile
Merging spi/for-next (618393ea7752 Merge remote-tracking branch 'spi/for-6.=
16' into spi-linus)
Merging tip/master (6cdd7ae1b73b Merge branch into tip/master: 'timers/cloc=
ksource')
Merging clockevents/timers/drivers/next (d7b8f8e20813 Linux 6.16-rc5)
Merging edac/edac-for-next (1fb0ddddf5d1 Merge branch 'edac-drivers' into e=
dac-for-next)
CONFLICT (content): Merge conflict in drivers/edac/mem_repair.c
Merging ftrace/for-next (5c14d2e72613 Merge unwind/for-next)
CONFLICT (content): Merge conflict in include/linux/entry-common.h
Applying: fix up for "unwind_user/deferred: Add unwind cache"
Merging rcu/next (cc1d1365f0f4 Merge branches 'rcu-exp.23.07.2025', 'rcu.22=
.07.2025', 'torture-scripts.16.07.2025', 'srcu.19.07.2025', 'rcu.nocb.18.07=
.2025' and 'refscale.07.07.2025' into rcu.merge.23.07.2025)
Merging paulmck/non-rcu/next (b706eec9304f Merge branches 'lkmm.2025.07.09a=
', 'ratelimit.2025.06.24a' and 'stop-machine.2025.07.17a' into HEAD)
Merging kvm/next (196d9e72c4b0 Merge tag 'kvm-s390-next-6.17-1' of https://=
git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
CONFLICT (content): Merge conflict in include/linux/entry-common.h
Merging kvm-arm/next (7b8346bd9fce KVM: arm64: Don't attempt vLPI mappings =
when vPE allocation is disabled)
Merging kvms390/next (57d88f02eb44 KVM: s390: Rework guest entry logic)
Applying: fix up for "entry: Add arch_in_rcu_eqs()"
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (07a289a03140 RISC-V: KVM: Avoid re-acquir=
ing memslot in kvm_riscv_gstage_map())
Merging kvm-x86/next (33f843444e28 Merge branch 'vmx')
Merging xen-tip/linux-next (114a2de6fa86 xen/netfront: Fix TX response spur=
ious interrupts)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (324cee0c272c Merge branch 'for-6.17' into for-=
next)
Merging sched-ext/for-next (9f0744a0e87e Merge branch 'for-6.17' into for-n=
ext)
Merging drivers-x86/for-next (1798561befd8 platform/x86: oxpec: Add support=
 for OneXPlayer X1 Mini Pro (Strix Point))
Merging chrome-platform/for-next (cc2d5b72b13b platform/chrome: Fix typo in=
 CROS_USBPD_NOTIFY help text)
Merging chrome-platform-firmware/for-firmware-next (19272b37aa4f Linux 6.16=
-rc1)
Merging hsi/for-next (19272b37aa4f Linux 6.16-rc1)
Merging leds-lj/for-leds-next (4903924ac7ef dt-bindings: leds: ncp5623: Add=
 0x39 as a valid I2C address)
Merging ipmi/for-next (f6f9760320a9 char: ipmi: remove redundant variable '=
type' and check)
Merging driver-core/driver-core-next (beb6c8326eb4 Merge tag 'uml-for-linux=
-6.17-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux)
Merging usb/usb-next (beb6c8326eb4 Merge tag 'uml-for-linux-6.17-rc1' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/uml/linux)
Merging thunderbolt/next (2d1beba54fda thunderbolt: Fix typos in documentat=
ion comments)
Merging usb-serial/usb-next (bdf2ab177e2f USB: serial: cp210x: use new GPIO=
 line value setter callbacks)
Merging tty/tty-next (beb6c8326eb4 Merge tag 'uml-for-linux-6.17-rc1' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/uml/linux)
Merging char-misc/char-misc-next (4b290aae788e Merge tag 'sysctl-6.17-rc1' =
of git://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (a80198ba650f coresight: fix indentation error in cs=
cfg_remove_owned_csdev_configs())
Merging fastrpc/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga/for-next (37e00703228a zynq_fpga: use sgtable-based scatterlis=
t wrappers)
Merging icc/icc-next (ca652cf0c261 Merge branch 'icc-milos' into icc-next)
Merging iio/togreg (0a686b9c4f84 iio: adc: ad_sigma_delta: Select IIO_BUFFE=
R_DMAENGINE and SPI_OFFLOAD)
Merging phy-next/next (4a3556b81b99 phy: qcom: phy-qcom-m31: Update IPQ5332=
 M31 USB phy initialization sequence)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging soundwire/next (34b1cb4ec286 soundwire: amd: Add support for acp7.2=
 platform)
Merging extcon/extcon-next (5f09caafc652 extcon: fsa9480: Avoid buffer over=
flow in fsa9480_handle_change())
Merging gnss/gnss-next (e326371f3002 dt-bindings: gnss: u-blox: add u-blox,=
neo-9m compatible)
Merging vfio/next (d2272d898186 vfio/type1: correct logic of vfio_find_vpfn=
())
Merging w1/for-next (19272b37aa4f Linux 6.16-rc1)
Merging spmi/spmi-next (0ff41df1cb26 Linux 6.15)
Merging staging/staging-next (beb6c8326eb4 Merge tag 'uml-for-linux-6.17-rc=
1' of git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux)
Merging counter-next/counter-next (19272b37aa4f Linux 6.16-rc1)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (e3a9ccd21897 dt-bindings: dma: fsl-mxs-dma: allow i=
nterrupt-names for fsl,imx23-dma-apbx)
Merging cgroup/for-next (d445d2ab8129 Merge branch 'for-6.17' into for-next)
Merging scsi/for-next (f4777ae2ee39 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (7038db703317 Merge patch series "libsas cleanups=
")
Merging vhost/linux-next (4ca22dcc0dee virtio_ring: add in order support)
CONFLICT (content): Merge conflict in drivers/vhost/net.c
CONFLICT (content): Merge conflict in include/uapi/linux/vhost.h
Merging rpmsg/for-next (01d7d9241256 Merge branches 'rproc-next' and 'rpmsg=
-next' into for-next)
Merging gpio-brgl/gpio/for-next (6b94bf976f9f MIPS: alchemy: gpio: use new =
GPIO line value setter callbacks for the remaining chips)
Merging gpio-intel/for-next (9ab29ed50555 gpiolib: acpi: Add a quirk for Ac=
er Nitro V15)
Merging pinctrl/for-next (a3fe1324c3c5 pinctrl: mediatek: Add pinctrl drive=
r for mt8189)
Merging pinctrl-intel/for-next (3b4408038da9 pinctrl: intel: fix build warn=
ings about export.h)
Merging pinctrl-renesas/renesas-pinctrl (7000167796a0 pinctrl: renesas: Sim=
plify PINCTRL_RZV2M logic)
Merging pinctrl-samsung/for-next (683d532dfc96 pinctrl: samsung: Fix gs101 =
irq chip)
Merging pwm/pwm/for-next (65c6f742ab14 pwm: imx-tpm: Reset counter if CMOD =
is 0)
Merging ktest/for-next (a5e71638ddd7 ktest.pl: Add new PATCHCHECK_SKIP opti=
on to skip testing individual commits)
Merging kselftest/next (30fb5e134f05 selftests/pidfd: Fix duplicate-symbol =
warnings for SCHED_ CPP symbols)
Merging kunit/test (19272b37aa4f Linux 6.16-rc1)
Merging kunit-next/kunit (34db4fba8191 kunit: fix longest symbol length tes=
t)
Merging livepatching/for-next (a8e905a819fd Merge branch 'for-6.15/ftrace-t=
est' into for-next)
Merging rtc/rtc-next (95f610e36adc rtc: pcf85063: scope pcf85063_config str=
uctures)
Merging nvdimm/libnvdimm-for-next (9f97e61bde6a cxl: Include range.h in cxl=
.h)
Merging at24/at24/for-next (19272b37aa4f Linux 6.16-rc1)
Merging ntb/ntb-next (0cadf92e93d4 NTB/msi: Remove unused functions)
Merging seccomp/for-next/seccomp (b0c9bfbab925 selftests/seccomp: Add a tes=
t for the WAIT_KILLABLE_RECV fast reply race)
Merging slimbus/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging nvmem/for-next (19272b37aa4f Linux 6.16-rc1)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (d9016a249be5 hv/hv_kvp_daemon: Prevent similar =
logs in kvp_key_add_or_modify())
Merging auxdisplay/for-next (19272b37aa4f Linux 6.16-rc1)
Merging kgdb/kgdb/for-next (afdbe49276ac kdb: Remove optional size argument=
s from strscpy() calls)
Merging hmm/hmm (19272b37aa4f Linux 6.16-rc1)
Merging cfi/cfi/next (19272b37aa4f Linux 6.16-rc1)
Merging mhi/mhi-next (00559ba3ae74 bus: mhi: host: pci_generic: Add Telit F=
N990B40 modem support)
Merging memblock/for-next (3b394dff15e1 memblock tests: add test for memblo=
ck_set_node)
Merging cxl/next (f11a5f89910a Documentation/ABI/testing/debugfs-cxl: Add '=
cxl' to clear_poison path)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (02eb7a8eee20 efi: add API doc entry for ovmf_debug_log)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (8185696483dc MAINTAINERS: add missing files to =
slab section)
Merging random/master (3778dcb2dcc1 random: use offstack cpumask when neces=
sary)
Merging landlock/next (6dde339a3df8 landlock: Minor comments improvements)
Merging rust/rust-next (dff64b072708 rust: Add warn_on macro)
CONFLICT (content): Merge conflict in arch/riscv/include/asm/bug.h
CONFLICT (content): Merge conflict in arch/x86/include/asm/bug.h
CONFLICT (content): Merge conflict in drivers/cpufreq/rcpufreq_dt.rs
CONFLICT (content): Merge conflict in rust/helpers/helpers.c
CONFLICT (content): Merge conflict in rust/kernel/device_id.rs
CONFLICT (content): Merge conflict in rust/kernel/devres.rs
CONFLICT (content): Merge conflict in rust/kernel/drm/gem/mod.rs
CONFLICT (content): Merge conflict in rust/kernel/pci.rs
CONFLICT (content): Merge conflict in rust/kernel/platform.rs
CONFLICT (content): Merge conflict in rust/kernel/sync/poll.rs
CONFLICT (content): Merge conflict in rust/kernel/types.rs
CONFLICT (content): Merge conflict in scripts/Makefile.build
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
Merging execve/for-next/execve (7f71195c15dc fork: reorder function qualifi=
ers for copy_clone_args_from_user)
Merging bitmap/bitmap-for-next (f66f9c3d09c1 bitfield: Ensure the return va=
lues of helper functions are checked)
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (f627b51aaa04 compiler_types: Provide __no_kstac=
k_erase to disable coverage only on Clang)
Merging nolibc/for-next (b9e50363178a selftests/nolibc: add x32 test config=
uration)
Merging iommufd/for-next (2c78e74493d3 iommu/arm-smmu-v3: Replace vsmmu_siz=
e/type with get_viommu_size)
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
Merging kcsan/next (9872916ad1a1 kcsan: test: Initialize dummy variable)
Merging crc/crc-next (118da22eb6fb lib/crc: x86/crc32c: Enable VPCLMULQDQ o=
ptimization where beneficial)
Merging fwctl/for-next (19272b37aa4f Linux 6.16-rc1)
Merging devsec-tsm/next (9d948b880409 Merge branch 'for-6.16/tsm-mr' into t=
sm-next)
Merging hisilicon/for-next (b1136432c972 soc: hisilicon: kunpeng_hccs: Fix =
incorrect log information)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)

--Sig_/Buv6W.fQn/XPdrnJPZ0v+BE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiK4/cACgkQAVBC80lX
0GxHKAf/UrACk6yXXZdktJW0cZDLbqCXAarRKWThdqNMx4V6/+XdG+b4oM6e/dPC
4hVtq6L0LTGQYaDpVRQxzthje+m6F6Z4IBbNG5OOr2ynA+PE5QO97Si3sv+W0uTc
6WwUFNYv3/l4BGmkxXzPEme1wB0Xd+UBHXAoKYYNRkzGG7yfETr0We28GTQlj9rU
FXKBhcmz35zMcdJPPauRXS7nk/LzVEpSObW9Cmq3YEdkrnlQbN/eB3p4g9Aqy4de
VjThlO3C3MwJDYgcaM7yqMK7H0crzvtj+DV7ce7QF5QsfB/pBBut8rqJeA3dJBFU
cUy4rFag4BVE1+/pJnohH77KiBT89A==
=w1Nd
-----END PGP SIGNATURE-----

--Sig_/Buv6W.fQn/XPdrnJPZ0v+BE--

