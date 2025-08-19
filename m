Return-Path: <linux-next+bounces-8008-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3C6B2B905
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 07:58:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1120F4E2DC7
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 05:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 413EB257459;
	Tue, 19 Aug 2025 05:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Pd2+Ctpo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6608F2264CA;
	Tue, 19 Aug 2025 05:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755583099; cv=none; b=dr+NfWvzW/AuO7wZz3GxVk6ZAoz6ScDW/Bs2Cqssv4kMmmpehBPQpYOmVAHUbK52rzHFt5TVA/zv8jSLsk1a6JFzQPCToyO5WUviVnyIQ4doDHlSVKzmSmW/T2DjPNLFjkWvkIYIUHAMWJzkAkG5417zke33Za16GlCKJSuNCLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755583099; c=relaxed/simple;
	bh=MXAcwG0z2Z9FbgQs4jC3FrZNmwx2Dliq/wEPvWMybKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WUllBHDtYey5ruGX34KK12EVj/xuiZdPWFYDkQLmBAvjADUSY2nsqjGUwa3cuceKVCoJ4ATO+TH428L2th8fPwDACDFUTziHfaeK+ETgluWkamy7yYfwTzsCddwY4lEOyb2wDSvRzPvtZenni+FujkHFPSnB78t8eM3TXtb2rQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Pd2+Ctpo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755583088;
	bh=AoSXN+bPZ5SscBu2XJN0cBC4aXWW70DA/ULCvFAAZ+k=;
	h=Date:From:To:Cc:Subject:From;
	b=Pd2+Ctpo9Tkg+59UWEke3PTh2tvRb/rILEGrHH6pm+RFzN6anApZcp6Dw4cFOGHYb
	 qX0LqS31R8SYwpmK/hrLevoHtTxInNCj5dx8tY5A4pgweEWwKx0rgpGFYVjdzlz+Vh
	 +PFmdy7jmDKolsmgEtqH20+MJdLG4lvsR5wyDbOx+JtnbRaPww/d1NoLJszn1is+zg
	 GbCpbifo9VFItPhBlwL+O2QCyQYgJoadGS4XHz0ntb8JW04n/X2WAbBpcTzoCnvApF
	 QUCjAQFZNStQOi4d9pzfcWZqVjZrUOM+ln1TySoKB+jBZ5Q/k9rKa2O1fepzy9FLcH
	 cYMUvALj+SV6Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c5f5D5fb8z4wbC;
	Tue, 19 Aug 2025 15:58:08 +1000 (AEST)
Date: Tue, 19 Aug 2025 15:58:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 19
Message-ID: <20250819155807.3c58836e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/59pF7H2dm6VAzOiNmHOZrFM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/59pF7H2dm6VAzOiNmHOZrFM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250818:

The bcachefs tree gained a conflict against the mm-unstable tree.

The vfs-brauner tree still had its build failure so I used the version
from next-20250815.

The kbuild tree lost its build failure.

The kunit-next tree still had its build failure so I used the version
from next-20250815.

The nvmem tree gained a build failure so I used the version from
next-20250818.

Non-merge commits (relative to Linus' tree): 2688
 2841 files changed, 90615 insertions(+), 42855 deletions(-)

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

I am currently merging 405 trees (counting Linus' and 404 trees of bug
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
Merging origin/master (be48bcf004f9 Merge tag 'for-6.17-rc2-tag' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/kdave/linux)
Merging fixes/fixes (89be9a83ccf1 Linux 6.16-rc7)
Merging ext4-fixes/fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging vfs-brauner-fixes/vfs.fixes (fb6d0f63f46d fs/buffer: fix use-after-=
free when call bh_read() helper)
Merging fscrypt-current/for-current (8f5ae30d69d7 Linux 6.17-rc1)
Merging fsverity-current/for-current (8f5ae30d69d7 Linux 6.17-rc1)
Merging btrfs-fixes/next-fixes (8299ec04baed Merge branch 'misc-6.17' into =
next-fixes)
Merging vfs-fixes/fixes (cda250b0fc83 change_mnt_propagation(): calculate p=
ropagation source only if we'll need it)
Merging erofs-fixes/fixes (c17b750b3ad9 Linux 6.17-rc2)
Merging nfsd-fixes/nfsd-fixes (bee47cb026e7 sunrpc: fix handling of server =
side tls alerts)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (e8bd877fb76b ovl: fix possible double un=
link)
Merging bcachefs/for-next (e4530982feb9 bcachefs: Add v2 ioctls that return=
 error strings)
Merging fscrypt/for-next (0e6608d4938e fscrypt: Remove redundant __GFP_NOWA=
RN)
Merging btrfs/for-next (d4114ae7e504 Merge branch 'for-next-next-v6.17-2025=
0818' into for-next-20250818)
Merging ceph/master (c6d08336aadd ceph: fix potential race condition on ope=
rations with CEPH_I_ODIRECT flag)
Merging cifs/for-next (a0165035120f smb: client: make use of smbdirect_sock=
et.status_wait)
Merging configfs/configfs-next (c6b190822459 MAINTAINERS: add configfs Rust=
 abstractions)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (8e4021078863 dlm: check for undefined release_option valu=
es)
Merging erofs/dev (df0ce6cefa45 erofs: support to readahead dirent blocks i=
n erofs_readdir())
Merging exfat/dev (cf5c57400c3f exfat: drop redundant conversion to bool)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (17e58687367a Merge fsnotify changes with fixed up au=
thorship.)
Merging ext4/dev (9d98cf463225 jbd2: prevent softlockup in jbd2_log_do_chec=
kpoint())
Merging f2fs/dev (3ea4ad0a1df0 f2fs: clean up w/ get_left_section_blocks())
Merging fsverity/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging fuse/for-next (f0e84022479b virtio_fs: Remove redundant spinlock in=
 virtio_fs_request_complete())
Merging gfs2/for-next (c98c793e4f6c gfs2: Add proper lockspace locking)
Merging jfs/jfs-next (856db3759202 jfs: fix metapage reference count leak i=
n dbAllocCtl)
Merging ksmbd/ksmbd-for-next (89bb430f6211 ksmbd: fix refcount leak causing=
 resource not released)
Merging nfs/linux-next (c17b750b3ad9 Linux 6.17-rc2)
Merging nfs-anna/linux-next (38074de35b01 NFSv4/flexfiles: Fix handling of =
NFS level errors in I/O)
Merging nfsd/nfsd-next (497bb5ee80fa NFSD: Fix last write offset handling i=
n layoutcommit)
Merging ntfs3/master (8f5ae30d69d7 Linux 6.17-rc1)
Merging orangefs/for-next (2138e89cb066 fs/orangefs: Allow 2 more character=
s in do_c_string())
Merging overlayfs/overlayfs-next (6f9ccdad0fea ovl: Annotate struct ovl_ent=
ry with __counted_by())
Merging ubifs/next (99dbb2a1bd66 ubifs: stop using write_cache_pages)
Merging v9fs/9p-next (afdaa9f9ea45 net/9p: fix double req put in p9_fd_canc=
elled)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (f76823e3b284 xfs: split xfs_zone_record_blocks)
Merging zonefs/for-next (a42938e80357 zonefs: correct some spelling mistake=
s)
Merging vfs-brauner/vfs.all (2b19e3349f2c Merge branch 'vfs-6.18.iomap' int=
o vfs.all)
$ git reset --hard HEAD^
Merging next-20250815 version of vfs-brauner
Merging vfs/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging mm-hotfixes/mm-hotfixes-unstable (3293fd7224b7 mm/userfaultfd: fix =
kmap_local LIFO ordering for CONFIG_HIGHPTE)
Merging fs-current (3c1a1f78bc55 Merge branch 'ovl-fixes' of https://git.ke=
rnel.org/pub/scm/linux/kernel/git/overlayfs/vfs.git)
Merging kbuild-current/kbuild-fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging arc-current/for-curr (d7b8f8e20813 Linux 6.16-rc5)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging arm-soc-fixes/arm/fixes (0c952efa0d7c Merge tag 'tegra-for-6.17-arm=
64-dt-v3' of https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux in=
to arm/fixes)
Merging davinci-current/davinci/for-current (8f5ae30d69d7 Linux 6.17-rc1)
Merging drivers-memory-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging sophgo-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging sophgo-soc-fixes/soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging m68k-current/for-linus (c8995932db2b m68k: mac: Improve clocksource=
 driver commentary)
Merging powerpc-fixes/fixes (c17b750b3ad9 Linux 6.17-rc2)
Merging s390-fixes/fixes (c17b750b3ad9 Linux 6.17-rc2)
Merging net/main (715c7a36d59f selftests: tls: make the new data_steal test=
 less flaky)
Merging bpf/master (e4414b01c1cd bpf: Check the helper function is valid in=
 get_helper_proto)
Merging ipsec/master (52565a935213 net: kcm: Fix race condition in kcm_unat=
tach())
Merging netfilter/main (065c31f2c691 rtase: Fix Rx descriptor CRC error bit=
 definition)
Merging ipvs/main (d942fe13f72b net: ti: icssg-prueth: Fix skb handling for=
 XDP_PASS)
Merging wireless/for-next (6832a9317eee Merge tag 'net-6.16-rc7' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ath/for-current (d9104cec3e8f Merge tag 'bpf-next-6.17' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next)
Merging iwlwifi/fixes (6832a9317eee Merge tag 'net-6.16-rc7' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (fa2e2d31ee3b RDMA/hns: Fix dip entries leak on d=
evices newer than hip09)
Merging sound-current/for-linus (89f0addeee3c ALSA: usb-audio: Fix size val=
idation in convert_chmap_v3())
Merging sound-asoc-fixes/for-linus (47ed64db8c17 ASoC: tas2781: Normalize t=
he volume kcontrol name)
Merging regmap-fixes/for-linus (8f5ae30d69d7 Linux 6.17-rc1)
Merging regulator-fixes/for-linus (4b0ad968717e regulator: dt-bindings: inf=
ineon,ir38060: Add Guenter as maintainer from IBM)
Merging spi-fixes/for-linus (a3a29462c013 Merge remote-tracking branch 'spi=
/for-6.16' into spi-linus)
Merging pci-current/for-linus (5149bbb56bdc PCI: vmd: Remove MSI-X check on=
 child devices)
Merging driver-core.current/driver-core-linus (3a68841d1d9b Documentation: =
smooth the text flow in the security bug reporting process)
Merging tty.current/tty-linus (cfd956dcb101 tty: hvc_console: Call hvc_kick=
 in hvc_write unconditionally)
Merging usb.current/usb-linus (a381c6d6f646 usb: typec: maxim_contaminant: =
re-enable cc toggle if cc is open and port is clean)
Merging usb-serial-fixes/usb-linus (ad1244e1ce18 USB: serial: option: add F=
oxconn T99W709)
Merging phy/fixes (aac1256a41cf dt-bindings: phy: qcom,sc8280xp-qmp-pcie-ph=
y: Update pcie phy bindings)
Merging staging.current/staging-linus (52ff2b840bc7 staging: axis-fifo: fix=
 maximum TX packet length check)
Merging iio-fixes/fixes-togreg (43c0f6456f80 iio: pressure: bmp280: Use IS_=
ERR() in bmp280_common_probe())
Merging counter-current/counter-current (19272b37aa4f Linux 6.16-rc1)
Merging char-misc.current/char-misc-linus (c17b750b3ad9 Linux 6.17-rc2)
Merging soundwire-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging thunderbolt-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging input-current/for-linus (ab93e0dd72c3 Merge branch 'next' into for-=
linus)
Merging crypto-current/master (9d9b193ed73a crypto: hash - Increase HASH_MA=
X_DESCSIZE for hmac(sha3-224-s390))
Merging libcrypto-fixes/libcrypto-fixes (fd7e5de4b2ed lib/crypto: ensure ge=
nerated *.S files are removed on make clean)
Merging vfio-fixes/for-linus (c1d9dac0db16 vfio/pci: Align huge faults to o=
rder)
Merging kselftest-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging dmaengine-fixes/fixes (5068b5254812 dmaengine: qcom: bam_dma: Fix D=
T error handling for num-channels/ees)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (6463cbe08b0c mtd: spinand: fix memory leak of =
ECC engine conf)
Merging mfd-fixes/for-mfd-fixes (d9d79e4f7dc9 mfd: Fix building without CON=
FIG_OF)
Merging v4l-dvb-fixes/fixes (6f6fbd9a0c5a media: Remove redundant pm_runtim=
e_mark_last_busy() calls)
Merging reset-fixes/reset/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging mips-fixes/mips-fixes (86731a2a651e Linux 6.16-rc3)
Merging at91-fixes/at91-fixes (19272b37aa4f Linux 6.16-rc1)
Merging omap-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging kvm-fixes/master (038d61fd6422 Linux 6.16)
Merging kvms390-fixes/master (d8dfda5af0be KVM: s390: pv: fix race when mak=
ing a page secure)
Merging hwmon-fixes/hwmon (6d24d3a1a5c6 hwmon: mlxreg-fan: Prevent fans fro=
m getting stuck at 0 RPM)
Merging nvdimm-fixes/libnvdimm-fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging cxl-fixes/fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging dma-mapping-fixes/dma-mapping-fixes (89a2d212bdb4 dma/pool: Ensure =
DMA_DIRECT_REMAP allocations are decrypted)
Merging drivers-x86-fixes/fixes (748f89751144 platform/x86: hp-wmi: mark Vi=
ctus 16-r1xxx for victus_s fan and thermal profile support)
Merging samsung-krzk-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging pinctrl-samsung-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging devicetree-fixes/dt/linus (79aef1a3705b of: Clarify OF device conte=
xt in of_match_device() comment)
Merging dt-krzk-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging scsi-fixes/fixes (9dcf111dd3e7 scsi: qla4xxx: Prevent a potential e=
rror pointer dereference)
Merging drm-fixes/drm-fixes (c17b750b3ad9 Linux 6.17-rc2)
Merging drm-intel-fixes/for-linux-next-fixes (d7fa5754e83c drm/i915/icl+/tc=
: Convert AUX powered WARN to a debug message)
Merging mmc-fixes/fixes (99d7ab8db9d8 memstick: Fix deadlock by moving remo=
ving flag earlier)
Merging rtc-fixes/rtc-fixes (08d82d0cad51 rtc: pcf2127: add missing semicol=
on after statement)
Merging gnss-fixes/gnss-linus (86731a2a651e Linux 6.16-rc3)
Merging hyperv-fixes/hyperv-fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging risc-v-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging riscv-dt-fixes/riscv-dt-fixes (19272b37aa4f Linux 6.16-rc1)
Merging riscv-soc-fixes/riscv-soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging spdx/spdx-linus (8f5ae30d69d7 Linux 6.17-rc1)
Merging gpio-brgl-fixes/gpio/for-current (810bd9066fb1 gpio: mlxbf3: use pl=
atform_get_irq_optional())
Merging gpio-intel-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging pinctrl-intel-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging auxdisplay-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging kunit-fixes/kunit-fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging memblock-fixes/fixes (d045c3154080 mm/numa_memblks: Use pr_debug in=
stead of printk(KERN_DEBUG))
Merging renesas-fixes/fixes (379c590113ce ARM: shmobile: smp: Enforce shmob=
ile_smp_* alignment)
Merging perf-current/perf-tools (6235ce77749f perf record: Cache build-ID o=
f hit DSOs only)
Merging efi-fixes/urgent (64e135f1eaba efivarfs: Fix memory leak of efivarf=
s_fs_info in fs_context error paths)
Merging battery-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging iommufd-fixes/for-rc (447c6141e8ea iommufd: Fix spelling errors in =
iommufd.rst)
Merging rust-fixes/rust-fixes (c17b750b3ad9 Linux 6.17-rc2)
Merging w1-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging pmdomain-fixes/fixes (c17b750b3ad9 Linux 6.17-rc2)
Merging i2c-host-fixes/i2c/i2c-host-fixes (c17b750b3ad9 Linux 6.17-rc2)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging thead-clk-fixes/thead-clk-fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging pwrseq-fixes/pwrseq/for-current (8f5ae30d69d7 Linux 6.17-rc1)
Merging thead-dt-fixes/thead-dt-fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging ftrace-fixes/ftrace/fixes (327e28664307 fgraph: Do not enable funct=
ion_graph tracer when setting funcgraph-args)
Merging ring-buffer-fixes/ring-buffer/fixes (e4d4b8670c44 ring-buffer: Use =
flush_kernel_vmap_range() over flush_dcache_folio())
Merging trace-fixes/trace/fixes (b5e8acc14dcb tracing: Add down_write(trace=
_event_sem) when adding trace event)
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging tip-fixes/tip/urgent (c17b750b3ad9 Linux 6.17-rc2)
Merging slab-fixes/slab/for-next-fixes (be8250786ca9 mm, slab: clean up sla=
b->obj_exts always)
Merging drm-msm-fixes/msm-fixes (0b6974bb4134 soc: qcom: ubwc: Add missing =
UBWC config for SM7225)
Merging uml-fixes/fixes (2dca89df0d11 Merge tag 'uml-for-6.16-rc4' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/uml/linux)
Merging fwctl-fixes/for-rc (19272b37aa4f Linux 6.16-rc1)
Merging devsec-tsm-fixes/fixes (fba4ceaa242d configfs-tsm-report: Fix NULL =
dereference of tsm_ops)
Merging drm-misc-fixes/for-linux-next-fixes (3271faf42d13 drm/hisilicon/hib=
mc: fix dp and vga cannot show together)
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (dfc0f6373094 Merge tag 'erofs-for-6.17-rc2-fix=
es' of git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs)
Merging mm-nonmm-stable/mm-nonmm-stable (dfc0f6373094 Merge tag 'erofs-for-=
6.17-rc2-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erof=
s)
Merging mm-unstable/mm-unstable (07c27ab74ba7 mm-filemap-align-last_index-t=
o-folio-size-fix)
CONFLICT (content): Merge conflict in rust/kernel/alloc/allocator.rs
Merging mm-nonmm-unstable/mm-nonmm-unstable (452049197f9f watchdog/softlock=
up:Fix incorrect CPU utilization output during softlockup)
Merging kbuild/kbuild-next (75a6b4595daa kconfig: qconf/xconfig: show the O=
ptionsMode radio button setting at startup)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (6235ce77749f perf record: Cache build-ID of h=
it DSOs only)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (110aa2c74dbd swiotlb: Remove redu=
ndant __GFP_NOWARN)
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
Merging asahi-soc/asahi-soc/for-next (a0d983779391 Merge branch 'apple-soc/=
drivers-6.18' into asahi-soc/for-next)
Merging at91/at91-next (e99113d11171 Merge branch 'clk-microchip' into at91=
-next)
Merging bmc/for-next (f070580abddc Merge branches 'aspeed/dt', 'aspeed/driv=
ers', 'nuvoton/arm/dt' and 'nuvoton/arm64/dt' into for-next)
Merging broadcom/next (89abb622d518 Merge branch 'drivers/next' into next)
Merging davinci/davinci/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging drivers-memory/for-next (1aba1eab0bd8 dt-bindings: memory: Update b=
rcmstb-memc-ddr binding with older chips)
Merging fsl/soc_fsl (8f5ae30d69d7 Linux 6.17-rc1)
Merging imx-mxs/for-next (cdc22fb12eff Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (6cbb623586d5 Merge branches 'v6.16-next/arm32', =
'v6.16-next/dts32', 'v6.16-next/dts64' and 'v6.16-next/soc' into for-next)
Merging mvebu/for-next (88084e0358ff Merge branch 'mvebu/dt' into mvebu/for=
-next)
Merging omap/for-next (db91121f001a Merge branch 'omap-for-v6.17/soc' into =
tmp/omap-next-20250707.142928)
Merging qcom/for-next (1aa50d938e88 Merge branches 'arm32-for-6.18', 'arm64=
-defconfig-for-6.18', 'arm64-for-6.18', 'clk-fixes-for-6.17', 'clk-for-6.18=
', 'drivers-fixes-for-6.17' and 'drivers-for-6.18' into for-next)
Merging renesas/next (eb33590872d1 Merge branch 'renesas-dts-for-v6.18' int=
o renesas-next)
Merging reset/reset/next (1527cd3b89f0 reset: remove unneeded 'fast_io' par=
ameter in regmap_config)
Merging rockchip/for-next (7f0817eee7ba Merge branch 'v6.18-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (e886e1abbd08 Merge branch 'next/clk' into fo=
r-next)
Merging scmi/for-linux-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging sophgo/for-next (349ae53a949c Merge branch 'dt/riscv' into for-next)
Merging sophgo-soc/soc-for-next (c8754c7deab4 soc: sophgo: cv1800: rtcsys: =
New driver (handling RTC only))
Merging spacemit/for-next (bab8dea25910 riscv: dts: spacemit: Add OrangePi =
RV2 board device tree)
Merging stm32/stm32-next (1a32f7427eb3 arm64: dts: st: remove empty line in=
 stm32mp251.dtsi)
Merging sunxi/sunxi/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging tee/next (0518f0b44b9a Merge branch 'optee_typo_fix_for_v6.17' into=
 next)
Merging tegra/for-next (499b75defe56 Merge branch for-6.17/arm64/defconfig =
into for-next)
Merging thead-dt/thead-dt-for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging ti/ti-next (0ad78b7cc779 Merge branch 'ti-keystone-dts-next' into t=
i-next)
Merging xilinx/for-next (3a0e3f82b8ee Merge branch 'zynqmp/dt' into for-nex=
t)
Merging clk/clk-next (54f5212c8f21 Merge branch 'clk-cleanup' into clk-next)
Merging clk-imx/for-next (c78865241ecf MAINTAINERS: Update i.MX Clock Entry)
Merging clk-renesas/renesas-clk (60d0d88552cb clk: renesas: r9a09g077: Add =
module clocks for SCI1-SCI5)
Merging thead-clk/thead-clk-for-next (c567bc5fc68c clk: thead: th1520-ap: s=
et all AXI clocks to CLK_IS_CRITICAL)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (d35ec48fa6c8 LoongArch: vDSO: Remove -nos=
tdlib complier flag)
Merging m68k/for-next (c8995932db2b m68k: mac: Improve clocksource driver c=
ommentary)
Merging m68knommu/for-next (c17b750b3ad9 Linux 6.17-rc2)
Merging microblaze/next (c0e7bb02f796 microblaze: Replace __ASSEMBLY__ with=
 __ASSEMBLER__ in non-uapi headers)
Merging mips/mips-next (3ebcbf079c26 MIPS: Don't use %pK through printk)
Merging openrisc/for-next (f0eedcf22581 openrisc: Replace __ASSEMBLY__ with=
 __ASSEMBLER__ in non-uapi headers)
Merging parisc-hd/for-next (89f686a0fb6e parisc: Revise __get_user() to pro=
be user read access)
Merging powerpc/next (c17b750b3ad9 Linux 6.17-rc2)
Merging risc-v/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging riscv-dt/riscv-dt-for-next (cb69daf085b5 dt-bindings: riscv: Add Si=
Five vendor extensions description)
Merging riscv-soc/riscv-soc-for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging s390/for-next (85f744617f1a Merge branch 'features' into for-next)
Merging sh/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (fc9ed2f6589d um: Replace __ASSEMBLY__ with __ASSEMBLER__ =
in the usermode headers)
Merging xtensa/xtensa-for-next (44a4ef59d550 xtensa: Replace __ASSEMBLY__ w=
ith __ASSEMBLER__ in non-uapi headers)
Merging fs-next (e04bdf8592ea next-20250815/vfs-brauner)
CONFLICT (content): Merge conflict in fs/bcachefs/darray.c
Merging printk/for-next (dcc3191a3dde Merge branch 'rework/ringbuffer-kunit=
-test' into for-next)
Merging pci/next (b98611d72db4 Merge branch 'pci/misc')
Merging pstore/for-next/pstore (d679c2e1e8d9 pstore/zone: rewrite some comm=
ents for better understanding)
Merging hid/for-next (3093b65bd04b Merge branch 'for-6.18/pidff' into for-n=
ext)
Merging i2c/i2c/for-next (94c296776403 i2c: muxes: pca954x: Reset if (de)se=
lect fails)
Merging i2c-host/i2c/i2c-host (c17b750b3ad9 Linux 6.17-rc2)
Merging i3c/i3c/next (3b661ca549b9 i3c: add missing include to internal hea=
der)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (9703c672af8d MAINTAINERS: Mark coretemp d=
river as orphaned)
Merging jc_docs/docs-next (37c52167b007 docs: Remove remainders of reiserfs)
Merging v4l-dvb/next (a75b8d198c55 media: imon: Remove unused defines)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (b52a57d2305d Merge branch 'fixes' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (23fca458f6ab rust: cpumask: Mar=
k CpumaskVar as transparent)
Merging cpupower/cpupower (357d1fc38aad cpupower: Allow control of boost fe=
ature on non-x86 based systems with boost support.)
Merging devfreq/devfreq-next (7da2fdaaa1e6 PM / devfreq: Add HiSilicon unco=
re frequency scaling driver)
Merging pmdomain/next (c17b750b3ad9 Linux 6.17-rc2)
Merging opp/opp/linux-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging thermal/thermal/linux-next (1d264d3a1988 dt-bindings: thermal: tegr=
a: Document Tegra210B01)
Merging rdma/for-next (211dc59b7bb5 IB/hfi1: Use for_each_online_cpu() inst=
ead of for_each_cpu())
Merging net-next/main (bab3ce404553 Merge branch '100GbE' of git://git.kern=
el.org/pub/scm/linux/kernel/git/tnguy/next-queue)
Merging bpf-next/for-next (4278672ca4e0 Merge branch 'bpf-next/net' into fo=
r-next)
Merging ipsec-next/master (9f4f591cd5a4 xfrm: xfrm_user: use strscpy() for =
alg_name)
Merging mlx5-next/mlx5-next (40653f280b26 {rdma,net}/mlx5: export mlx5_vpor=
t_get_vhca_id)
CONFLICT (content): Merge conflict in drivers/net/ethernet/mellanox/mlx5/co=
re/eswitch.h
Merging netfilter-next/main (88250d40ed59 Merge branch 'net-dsa-b53-mmap-ad=
d-bcm63268-gphy-power-control')
Merging ipvs-next/main (d9104cec3e8f Merge tag 'bpf-next-6.17' of git://git=
.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next)
Merging bluetooth/master (c921e5d14590 Bluetooth: hci_conn: Make unacked pa=
cket handling more robust)
Merging wireless-next/for-next (126d85fb0405 Merge tag 'wireless-next-2025-=
07-24' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless=
-next)
Merging ath-next/for-next (d9104cec3e8f Merge tag 'bpf-next-6.17' of git://=
git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next)
Merging iwlwifi-next/next (d2af710d6d50 wifi: iwlwifi: mvm/fw: Avoid -Wflex=
-array-member-not-at-end warnings)
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (9cf9db888f38 Merge tag 'nand/for-6.17' into mtd/next)
Merging nand/nand/next (fb2fae70e7e9 mtd: spinand: winbond: Add comment abo=
ut the maximum frequency)
Merging spi-nor/spi-nor/next (2e3a7476ec39 mtd: spi-nor: Fix spi_nor_try_un=
lock_all())
Merging crypto/master (34c065fe1d0d crypto: ccp - Remove redundant __GFP_ZE=
RO)
Merging libcrypto/libcrypto-next (56784a422086 lib/crypto: tests: Add KUnit=
 tests for MD5 and HMAC-MD5)
Merging drm/drm-next (c17b750b3ad9 Linux 6.17-rc2)
Merging drm-exynos/for-linux-next (19272b37aa4f Linux 6.16-rc1)
Merging drm-misc/for-linux-next (54d4f445517f drm/panfrost: Print RSS for t=
iler heap BO's in debugfs GEMS file)
Merging amdgpu/drm-next (645cc7863da5 drm/amd/display: Fix DP audio DTO1 cl=
ock source on DCE 6.)
Merging drm-intel/for-linux-next (63e0b17ae79a drm/i915/bo: remove unnecess=
ary include)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_tc=
.c
Merging drm-msm/msm-next (8290d37ad2b0 drm/msm: Small function param doc fi=
x)
Merging drm-msm-lumag/msm-next-lumag (75717bce00d1 drm/msm: Don't use %pK t=
hrough printk)
Merging drm-nova/nova-next (0988099646cf gpu: nova-core: register: add supp=
ort for relative array registers)
Merging drm-xe/drm-xe-next (b85bb2d67715 drm/xe: Make page size consistent =
in loop)
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (b87662f1dcc7 fbdev: s3fb: Implement powersave for S=
3 FB)
Merging regmap/for-next (5c36b86d2bf6 regmap: Remove superfluous check for =
!config in __regmap_init())
Merging sound/for-next (0ec417aa8546 ALSA: usb-audio: Add infrastructure fo=
r TASCAM US-144MKII)
Merging ieee1394/for-next (c17b750b3ad9 Linux 6.17-rc2)
Merging sound-asoc/for-next (14db48469c94 Merge remote-tracking branch 'aso=
c/for-6.18' into asoc-next)
Merging modules/modules-next (5eb4b9a4cdbb params: Replace deprecated strcp=
y() with strscpy() and memcpy())
Merging input/next (80025149db06 Input: include export.h in modules using E=
XPORT_SYMBOL*())
Merging block/for-next (627cae98250c Merge branch 'for-6.18/io_uring' into =
for-next)
Merging device-mapper/for-next (c8f1632ee754 dm error: mark as DM_TARGET_PA=
SSES_INTEGRITY)
Merging libata/for-next (6cb43739b93c ata: pata_pdc2027x: Remove space befo=
re newline and abbreviations)
Merging pcmcia/pcmcia-next (4a81f78caa53 pcmcia: Add error handling for add=
_interval() in do_validate_mem())
Merging mmc/next (93d21c3376a6 mmc: sdhci-cadence: implement multi-block re=
ad gap tuning)
Merging mfd/for-mfd-next (c0eb742dd61c dt-bindings: mfd: qnap,ts433-mcu: Al=
low nvmem-layout child node)
Merging backlight/for-backlight-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging battery/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging regulator/for-next (bbaac808236f Merge remote-tracking branch 'regu=
lator/for-6.18' into regulator-next)
Merging security/next (e73f759d2e98 security: use umax() to improve code)
Merging apparmor/apparmor-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging integrity/next-integrity (aa9bb1b32594 ima: add a knob ima=3D to al=
low disabling IMA in kdump kernel)
Merging selinux/next (f20e70a341dd selinux: Remove redundant __GFP_NOWARN)
Merging smack/next (6ddd169d0288 smack: fix kernel-doc warnings for smk_imp=
ort_valid_label())
Merging tomoyo/master (038d61fd6422 Linux 6.16)
Merging tpmdd/next (be48bcf004f9 Merge tag 'for-6.17-rc2-tag' of git://git.=
kernel.org/pub/scm/linux/kernel/git/kdave/linux)
Merging watchdog/master (48defdf6b083 watchdog: sbsa: Adjust keepalive time=
out to avoid MediaTek WS0 race condition)
Merging iommu/next (41f0200c718c iommu/tegra241-cmdqv: Fix missing cpu_to_l=
e64 at lvcmdq_err_map)
Merging audit/next (70d00858645c audit: add a missing tab)
Merging devicetree/for-next (326d25198112 dt-bindings: powerpc: Drop duplic=
ate fsl/mpic.txt)
Merging dt-krzk/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging mailbox/for-next (5378bdf6a611 mailbox/pcc: support mailbox managem=
ent of the shared buffer)
Merging spi/for-next (cd8cdbc25bec Merge remote-tracking branch 'spi/for-6.=
18' into spi-next)
Merging tip/master (7386dda69363 Merge branch into tip/master: 'x86/entry')
Merging clockevents/timers/drivers/next (461f124656e6 clocksource/drivers/a=
rm_arch_timer_mmio: Add MMIO clocksource)
Merging edac/edac-for-next (fd0bcdaa83e2 Merge edac-misc into for-next)
Merging ftrace/for-next (39f069d5a466 Merge unwind/for-next)
Merging rcu/next (61399e0c5410 rcu: Fix racy re-initialization of irq_work =
causing hangs)
Merging paulmck/non-rcu/next (b706eec9304f Merge branches 'lkmm.2025.07.09a=
', 'ratelimit.2025.06.24a' and 'stop-machine.2025.07.17a' into HEAD)
Merging kvm/next (196d9e72c4b0 Merge tag 'kvm-s390-next-6.17-1' of https://=
git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging kvm-arm/next (7b8346bd9fce KVM: arm64: Don't attempt vLPI mappings =
when vPE allocation is disabled)
Merging kvms390/next (efe54612bdb6 improve interrupt cpu)
Merging kvm-ppc/topic/ppc-kvm (c17b750b3ad9 Linux 6.17-rc2)
Merging kvm-riscv/riscv_kvm_next (07a289a03140 RISC-V: KVM: Avoid re-acquir=
ing memslot in kvm_riscv_gstage_map())
Merging kvm-x86/next (8f5ae30d69d7 Linux 6.17-rc1)
Merging xen-tip/linux-next (8ea815399c3f compiler: remove __ADDRESSABLE_ASM=
{_STR,}() again)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (324cee0c272c Merge branch 'for-6.17' into for-=
next)
Merging sched-ext/for-next (4b3570b49067 Merge branch 'for-6.17-fixes' into=
 for-next)
Merging drivers-x86/for-next (3bffbe0497f9 platform/x86: wmi-capdata01: Rem=
ove unneeded semicolon)
Merging chrome-platform/for-next (f7439a723e5a platform/chrome: wilco_ec: R=
emove redundant semicolons)
Merging chrome-platform-firmware/for-firmware-next (8f5ae30d69d7 Linux 6.17=
-rc1)
Merging hsi/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging leds-lj/for-leds-next (7d5c3cac1f39 leds: flash: leds-qcom-flash: A=
dd a separate register map for PMI8998)
Merging ipmi/for-next (2f03d93ae55f ipmi: Set a timer for maintenance mode)
Merging driver-core/driver-core-next (292cb391479d software node: Constify =
node_group in registration functions)
Merging usb/usb-next (956606bafb5f usb: gadget: f_ncm: Fix MAC assignment N=
CM ethernet)
Merging thunderbolt/next (5d03847175e8 thunderbolt: Use is_pciehp instead o=
f is_hotplug_bridge)
Merging usb-serial/usb-next (bdf2ab177e2f USB: serial: cp210x: use new GPIO=
 line value setter callbacks)
Merging tty/tty-next (7cd9f5d6c5a3 s390/char/con3270: use tty_port_tty guar=
d())
Merging char-misc/char-misc-next (c17b750b3ad9 Linux 6.17-rc2)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (a80198ba650f coresight: fix indentation error in cs=
cfg_remove_owned_csdev_configs())
Merging fastrpc/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging fpga/for-next (4f156ee58bb8 fpga: zynq_fpga: Fix the wrong usage of=
 dma_map_sgtable())
Merging icc/icc-next (500160770cb2 Merge branch 'icc-glymur' into icc-next)
Merging iio/togreg (35e3d0cd8e89 iio: imu: inv_icm42600: use min() to impro=
ve code)
Merging phy-next/next (8427a4ca85b3 phy: qualcomm: phy-qcom-eusb2-repeater:=
 Add support for PMIV0104)
Merging soundwire/next (8b63fee9f623 soundwire: debugfs: add SCP_SDCA_IntSt=
atX and SCP_SDCA_IntMaskX registers)
Merging extcon/extcon-next (5f09caafc652 extcon: fsa9480: Avoid buffer over=
flow in fsa9480_handle_change())
Merging gnss/gnss-next (e326371f3002 dt-bindings: gnss: u-blox: add u-blox,=
neo-9m compatible)
Merging vfio/next (b1779e4f209c vfio/type1: conditional rescheduling while =
pinning)
Merging w1/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging spmi/spmi-next (0ff41df1cb26 Linux 6.15)
Merging staging/staging-next (260221b2a053 staging: vc04_services/vchiq-mma=
l: fix typos in comments)
Merging counter-next/counter-next (19272b37aa4f Linux 6.16-rc1)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (8f5ae30d69d7 Linux 6.17-rc1)
Merging cgroup/for-next (ac412e77dc29 Merge branch 'for-6.18' into for-next)
Merging scsi/for-next (9dcf111dd3e7 scsi: qla4xxx: Prevent a potential erro=
r pointer dereference)
Merging scsi-mkp/for-next (da810279506c Merge patch series "ufs: host: medi=
atek: Provide features and fixes in MediaTek platforms")
Merging vhost/linux-next (cf3409c6a41a Revert "virtio: reject shm region if=
 length is zero")
Merging rpmsg/for-next (01d7d9241256 Merge branches 'rproc-next' and 'rpmsg=
-next' into for-next)
Merging gpio-brgl/gpio/for-next (5893165a27e7 gpio: remove unneeded 'fast_i=
o' parameter in regmap_config)
Merging gpio-intel/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging pinctrl/for-next (d34a3816543c Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging pinctrl-renesas/renesas-pinctrl (9eb40bb26ace pinctrl: renesas: rzt=
2h: Add support for RZ/N2H)
Merging pinctrl-samsung/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging pwm/pwm/for-next (f15f651def70 pwm: pca9586: Convert to waveform AP=
I)
Merging ktest/for-next (a5e71638ddd7 ktest.pl: Add new PATCHCHECK_SKIP opti=
on to skip testing individual commits)
Merging kselftest/next (8f5ae30d69d7 Linux 6.17-rc1)
Merging kunit/test (8f5ae30d69d7 Linux 6.17-rc1)
Merging kunit-next/kunit (e520219adc99 kunit: tool: Accept --raw_output=3Df=
ull as an alias of 'all')
$ git reset --hard HEAD^
Merging next-20250815 version of kunit-next
Merging livepatching/for-next (dcf9f31c62b3 Merge tag 'livepatching-for-6.1=
5' of git://git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepatchi=
ng)
Merging rtc/rtc-next (bb5b0b4317c9 rtc: ds1685: Update Joshua Kinard's emai=
l address.)
Merging nvdimm/libnvdimm-for-next (9f97e61bde6a cxl: Include range.h in cxl=
.h)
Merging at24/at24/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging ntb/ntb-next (0cadf92e93d4 NTB/msi: Remove unused functions)
Merging seccomp/for-next/seccomp (b0c9bfbab925 selftests/seccomp: Add a tes=
t for the WAIT_KILLABLE_RECV fast reply race)
Merging slimbus/for-next (e1aab955386f slimbus: qcom: remove unused qcom co=
ntroller driver)
Merging nvmem/for-next (117c3f3014a9 nvmem: add driver for the eeprom in qn=
ap-mcu controllers)
$ git reset --hard HEAD^
Merging next-20250818 version of nvmem
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (2f89f4a42b16 Drivers: hv: Introduce mshv_vtl dr=
iver)
Merging auxdisplay/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging kgdb/kgdb/for-next (afdbe49276ac kdb: Remove optional size argument=
s from strscpy() calls)
Merging hmm/hmm (19272b37aa4f Linux 6.16-rc1)
Merging cfi/cfi/next (19272b37aa4f Linux 6.16-rc1)
Merging mhi/mhi-next (00559ba3ae74 bus: mhi: host: pci_generic: Add Telit F=
N990B40 modem support)
Merging memblock/for-next (3b394dff15e1 memblock tests: add test for memblo=
ck_set_node)
Merging cxl/next (e6a9530b3ee7 cxl: Fix emit of type resource_size_t argume=
nt for validate_region_offset())
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (02eb7a8eee20 efi: add API doc entry for ovmf_debug_log)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (8185696483dc MAINTAINERS: add missing files to =
slab section)
Merging random/master (3778dcb2dcc1 random: use offstack cpumask when neces=
sary)
Merging landlock/next (6dde339a3df8 landlock: Minor comments improvements)
Merging rust/rust-next (c17b750b3ad9 Linux 6.17-rc2)
Merging rust-alloc/alloc-next (7e25d84f460c rust: dma: Update ARef and Alwa=
ysRefCounted imports from sync::aref)
CONFLICT (content): Merge conflict in rust/kernel/alloc.rs
Merging rust-io/io-next (86731a2a651e Linux 6.16-rc3)
Merging rust-pin-init/pin-init-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging rust-timekeeping/timekeeping-next (d4b29ddf82a4 rust: time: Add wra=
pper for fsleep() function)
Merging rust-xarray/xarray-next (fa616196fbea MAINTAINERS: add entry for Ru=
st XArray API)
Merging sysctl/sysctl-next (19272b37aa4f Linux 6.16-rc1)
Merging execve/for-next/execve (7f71195c15dc fork: reorder function qualifi=
ers for copy_clone_args_from_user)
Merging bitmap/bitmap-for-next (89748acdf226 Merge tag 'drm-next-2025-08-01=
' of https://gitlab.freedesktop.org/drm/kernel)
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (f627b51aaa04 compiler_types: Provide __no_kstac=
k_erase to disable coverage only on Clang)
Merging nolibc/for-next (850047b19741 selftests/nolibc: always compile the =
kernel with GCC)
Merging iommufd/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging turbostat/next (447c98c1ca4a tools/power turbostat: Add idle govern=
or statistics reporting)
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.8
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.c
Merging pwrseq/pwrseq/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging capabilities-next/caps-next (cdd73b166607 uapi: fix broken link in =
linux/capability.h)
Merging ipe/next (038d61fd6422 Linux 6.16)
Merging kcsan/next (9872916ad1a1 kcsan: test: Initialize dummy variable)
Merging crc/crc-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging fwctl/for-next (19272b37aa4f Linux 6.16-rc1)
Merging devsec-tsm/next (9d948b880409 Merge branch 'for-6.16/tsm-mr' into t=
sm-next)
Merging hisilicon/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)

--Sig_/59pF7H2dm6VAzOiNmHOZrFM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmikEm8ACgkQAVBC80lX
0GycXQf/RlhHlA98kynM2aliTPUJP4Gyi+KZLfbPniFMHin+u6gTFXjNPZDKokNI
tyXOlu9R0mNTQvtG8/CHbazOLBc1IMPE6cg+d5avbXQ4j5nNOJhS97oXmmESQBCJ
l3XG2S/JuGb5MPq9m0tIbUNwlwhMa+5EfdjJ1AoBQd9EYaxq1KH0fiZh/Iwn2bbH
2Pv3nD5ttQZjk4cxECwYCaaTVLiTLBzNu7sNsg+bkkOZwqF1EcAci/+169khgZBQ
X99FtYh7gXip/gnziTTXXaYgiu6Eqp5EfCkNMSEIYt0OSEyg/zZDIsZO4iMM3eXa
fqBGV08CACehCTCy5bBjsCe5rz895Q==
=hqsL
-----END PGP SIGNATURE-----

--Sig_/59pF7H2dm6VAzOiNmHOZrFM--

