Return-Path: <linux-next+bounces-8077-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A5AB30E5E
	for <lists+linux-next@lfdr.de>; Fri, 22 Aug 2025 07:58:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 204367A9EEF
	for <lists+linux-next@lfdr.de>; Fri, 22 Aug 2025 05:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34EFC276025;
	Fri, 22 Aug 2025 05:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Li0kAdlI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F99621B9DE;
	Fri, 22 Aug 2025 05:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755842328; cv=none; b=B6uQ8dAosgzNB/KlB3xmFS5nh9tsCcuTfEuPQE9t80Si8Ni9JfHU/vtoRS+ajzvuKagaYSqgiu3lYov5TxE1sHftGJbI1NBSyNB6vWulj/rqiT1njXSjq//nYYY3d9PQ6iAoNVNtO1t2NEDMBtAaSMRWU9IG+IXNrvtXaDgZ3EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755842328; c=relaxed/simple;
	bh=UJk5/lkPHED/jtkKDZpNYkqo53AJXbSrMG3d2uo5AUY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tH3Lousa2y+Y+86DgaFzKEPW6KBmkjmNYSSj8msRrzJp2KJmwKf7h/ajlbUV2g0ELLlFW/6M+HBUCQxlFUBYMWj9A2/mgFHTF1hs0NZvLXjVEA9gU6Ad0DBa27h2ZJ7XkvzfwC4rjFAj5mCOsxEZBWlNtKkjuv8op04y9HQHzRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Li0kAdlI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755842316;
	bh=H0/djXzOnFhrMeibVFo6XwR0rgrcpkUuG7QWGEDdxgU=;
	h=Date:From:To:Cc:Subject:From;
	b=Li0kAdlIXgUy6Ql5kYa4vjvTwDSkfPN6AOTu+t3OqJDjSGSktadcAqCMdiptPU5zB
	 YaccoSrQJV2pvEM8S00YAVXAT7O4TAGL95v+5HmFZC0U/shmFN8dQiRf9djxztjXFO
	 A2tIP6TvvKvgIyXvx/zdz+RpX+2HuaKdoiIr6MUzU5UFtEDpd43k0csfrEtoQOQ9rO
	 C5a914p/M0UR9dMHEcb1HhMJ55z684/yXIl2dKedxVR0RzqiO6BLP3mFQEmDyEwqqn
	 M3z00HmYqopi0lt4OgU7g71AVnS+psH0ZVG731PeCJUztLN5oWy51Z+RRd63kACl1B
	 uR/iWMBbQlclw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c7TyN63ftz4w1v;
	Fri, 22 Aug 2025 15:58:36 +1000 (AEST)
Date: Fri, 22 Aug 2025 15:58:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 22
Message-ID: <20250822155836.04c89af0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/M9Q2BnNCeodlyNNi9clStaE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/M9Q2BnNCeodlyNNi9clStaE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250821:

The mm-hotfixes tree lost its build failure.

The vfs-brauner tree lost its build failure.

The drm-exynos tree still had its build failure so I used the version
from next-20250820.

The kunit-next tree still had its build failure so I used the version
from next-20250815.

Non-merge commits (relative to Linus' tree): 3486
 3691 files changed, 121775 insertions(+), 52984 deletions(-)

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
Merging origin/master (3957a5720157 Merge tag 'cgroup-for-6.17-rc2-fixes' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup)
Merging fixes/fixes (89be9a83ccf1 Linux 6.16-rc7)
Merging ext4-fixes/fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging vfs-brauner-fixes/vfs.fixes (be1e0283021e coredump: don't pointless=
ly check and spew warnings)
Merging fscrypt-current/for-current (8f5ae30d69d7 Linux 6.17-rc1)
Merging fsverity-current/for-current (8f5ae30d69d7 Linux 6.17-rc1)
Merging btrfs-fixes/next-fixes (5bde317fa7b9 Merge branch 'misc-6.17' into =
next-fixes)
Merging vfs-fixes/fixes (fb924b7b8669 change_mnt_propagation(): calculate p=
ropagation source only if we'll need it)
Merging erofs-fixes/fixes (c17b750b3ad9 Linux 6.17-rc2)
Merging nfsd-fixes/nfsd-fixes (bee47cb026e7 sunrpc: fix handling of server =
side tls alerts)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (e8bd877fb76b ovl: fix possible double un=
link)
Merging bcachefs/for-next (efc5e0fd59ee bcachefs: fix journal_entry_radix_i=
dx())
Merging fscrypt/for-next (0e6608d4938e fscrypt: Remove redundant __GFP_NOWA=
RN)
Merging btrfs/for-next (38786ff97914 Merge branch 'for-next-next-v6.17-2025=
0822' into for-next-20250822)
Merging ceph/master (c6d08336aadd ceph: fix potential race condition on ope=
rations with CEPH_I_ODIRECT flag)
Merging cifs/for-next (01b360f5fc35 smb: client: make use of smbdirect_sock=
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
Merging f2fs/dev (4978f0a5ee23 f2fs: clean up w/ get_left_section_blocks())
Merging fsverity/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging fuse/for-next (29314269244c fuse: zero initialize inode private dat=
a)
CONFLICT (content): Merge conflict in fs/fuse/inode.c
Merging gfs2/for-next (702dc4b956f8 gfs2: Fix unlikely race in gdlm_put_loc=
k)
Merging jfs/jfs-next (856db3759202 jfs: fix metapage reference count leak i=
n dbAllocCtl)
Merging ksmbd/ksmbd-for-next (eb4a0992ddae Merge tag '6.17-rc2-ksmbd-server=
-fixes' of git://git.samba.org/ksmbd)
Merging nfs/linux-next (76d2e3890fb1 NFS: Fix a race when updating an exist=
ing write)
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
Merging xfs/for-next (8e5a2441e186 xfs: reject swapon for inodes on a zoned=
 file system earlier)
Merging zonefs/for-next (a42938e80357 zonefs: correct some spelling mistake=
s)
Merging vfs-brauner/vfs.all (f86ade9ec2f5 Merge branch 'vfs-6.18.rust' into=
 vfs.all)
Merging vfs/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging mm-hotfixes/mm-hotfixes-unstable (170260576fa0 mm/memory_hotplug: f=
ix hwpoisoned large folio handling in do_migrate_range)
Merging fs-current (c595ed83782e Merge branch 'next-fixes' of https://git.k=
ernel.org/pub/scm/linux/kernel/git/kdave/linux.git)
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
Merging s390-fixes/fixes (3868f910440c s390/hypfs: Enable limited access du=
ring lockdown)
Merging net/main (01b9128c5db1 net: macb: fix unregister_netdev call order =
in macb_remove())
Merging bpf/master (27861fc720be bpf: Drop rqspinlock usage in ringbuf)
Merging ipsec/master (52565a935213 net: kcm: Fix race condition in kcm_unat=
tach())
Merging netfilter/main (6439a0e64c35 Merge tag 'net-6.17-rc3' of git://git.=
kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ipvs/main (d942fe13f72b net: ti: icssg-prueth: Fix skb handling for=
 XDP_PASS)
Merging wireless/for-next (6832a9317eee Merge tag 'net-6.16-rc7' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ath/for-current (d9104cec3e8f Merge tag 'bpf-next-6.17' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next)
Merging iwlwifi/fixes (d9104cec3e8f Merge tag 'bpf-next-6.17' of git://git.=
kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (fa2e2d31ee3b RDMA/hns: Fix dip entries leak on d=
evices newer than hip09)
Merging sound-current/for-linus (8410fe81093f ALSA: usb-audio: Use correct =
sub-type for UAC3 feature unit validation)
Merging sound-asoc-fixes/for-linus (7c15e4cabfa9 ASoC: cs35l56: Fixes for C=
S35L63 for production)
Merging regmap-fixes/for-linus (8f5ae30d69d7 Linux 6.17-rc1)
Merging regulator-fixes/for-linus (11cd7a5c21db regulator: tps65219: regula=
tor: tps65219: Fix error codes in probe())
Merging spi-fixes/for-linus (00f92a39973f Merge remote-tracking branch 'spi=
/for-6.16' into spi-linus)
Merging pci-current/for-linus (8f5ae30d69d7 Linux 6.17-rc1)
Merging driver-core.current/driver-core-linus (3a68841d1d9b Documentation: =
smooth the text flow in the security bug reporting process)
Merging tty.current/tty-linus (cfd956dcb101 tty: hvc_console: Call hvc_kick=
 in hvc_write unconditionally)
Merging usb.current/usb-linus (ff9a09b3e09c usb: xhci: fix host not respond=
ing after suspend and resume)
Merging usb-serial-fixes/usb-linus (ad1244e1ce18 USB: serial: option: add F=
oxconn T99W709)
Merging phy/fixes (aac1256a41cf dt-bindings: phy: qcom,sc8280xp-qmp-pcie-ph=
y: Update pcie phy bindings)
Merging staging.current/staging-linus (52ff2b840bc7 staging: axis-fifo: fix=
 maximum TX packet length check)
Merging iio-fixes/fixes-togreg (43c0f6456f80 iio: pressure: bmp280: Use IS_=
ERR() in bmp280_common_probe())
Merging counter-current/counter-current (19272b37aa4f Linux 6.16-rc1)
Merging char-misc.current/char-misc-linus (fe85261d7d55 Merge tag 'iio-fixe=
s-for-6.17a' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/jic23/ii=
o into char-misc-linus)
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
Merging dmaengine-fixes/fixes (39aaa337449e dmaengine: idxd: Fix double fre=
e in idxd_setup_wqs())
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
Merging devicetree-fixes/dt/linus (ac29e4487aa2 dt-bindings: vendor-prefixe=
s: add eswin)
Merging dt-krzk-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging scsi-fixes/fixes (6300d5c54387 scsi: ufs: ufs-qcom: Fix ESI null po=
inter dereference)
Merging drm-fixes/drm-fixes (dbb2c3adc4a6 Merge tag 'amd-drm-fixes-6.17-202=
5-08-20' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (8236820fd767 drm/i915/gt: Rel=
ocate compression repacking WA for JSL/EHL)
Merging mmc-fixes/fixes (d2d7a96b29ea mmc: sdhci_am654: Disable HS400 for A=
M62P SR1.0 and SR1.1)
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
Merging memblock-fixes/fixes (4647c4deadcc mm: numa,memblock: Use SZ_1M mac=
ro to denote bytes to MB conversion)
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
Merging pmdomain-fixes/fixes (d8f3ae7b38fe pmdomain: renesas: rcar-sysc: Ma=
ke rcar_sysc_onecell_np __initdata)
Merging i2c-host-fixes/i2c/i2c-host-fixes (82b350dd8185 i2c: rtl9300: Add m=
issing count byte for SMBus Block Ops)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging thead-clk-fixes/thead-clk-fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging pwrseq-fixes/pwrseq/for-current (8f5ae30d69d7 Linux 6.17-rc1)
Merging thead-dt-fixes/thead-dt-fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging ftrace-fixes/ftrace/fixes (327e28664307 fgraph: Do not enable funct=
ion_graph tracer when setting funcgraph-args)
Merging ring-buffer-fixes/ring-buffer/fixes (e4d4b8670c44 ring-buffer: Use =
flush_kernel_vmap_range() over flush_dcache_folio())
Merging trace-fixes/trace/fixes (7f5fe9460481 fgraph: Copy args in intermed=
iate storage with entry)
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging tip-fixes/tip/urgent (c6c3ead900d2 Merge branch into tip/master: 'x=
86/urgent')
Merging slab-fixes/slab/for-next-fixes (be8250786ca9 mm, slab: clean up sla=
b->obj_exts always)
Merging drm-msm-fixes/msm-fixes (0b6974bb4134 soc: qcom: ubwc: Add missing =
UBWC config for SM7225)
Merging uml-fixes/fixes (2dca89df0d11 Merge tag 'uml-for-6.16-rc4' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/uml/linux)
Merging fwctl-fixes/for-rc (7f059e473267 fwctl/mlx5: Fix memory alloc/free =
in mlx5ctl_fw_rpc())
Merging devsec-tsm-fixes/fixes (fba4ceaa242d configfs-tsm-report: Fix NULL =
dereference of tsm_ops)
Merging drm-misc-fixes/for-linux-next-fixes (1a2cf179e297 Merge drm/drm-fix=
es into drm-misc-fixes)
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (c17b750b3ad9 Linux 6.17-rc2)
Merging mm-nonmm-stable/mm-nonmm-stable (c17b750b3ad9 Linux 6.17-rc2)
Merging mm-unstable/mm-unstable (c359d094f90d mm-filemap-align-last_index-t=
o-folio-size-fix)
CONFLICT (content): Merge conflict in rust/kernel/alloc/allocator.rs
Merging mm-nonmm-unstable/mm-nonmm-unstable (9c543ad254aa ocfs2: remove unn=
ecessary NULL check in ocfs2_grab_folios())
Merging kbuild/kbuild-next (6da752f55bc4 initramfs_test: add filename paddi=
ng test case)
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
Merging renesas/next (2267d9509084 Merge branches 'renesas-arm-defconfig-fo=
r-v6.18', 'renesas-arm-soc-for-v6.18', 'renesas-drivers-for-v6.18' and 'ren=
esas-dts-for-v6.18' into renesas-next)
Merging reset/reset/next (1527cd3b89f0 reset: remove unneeded 'fast_io' par=
ameter in regmap_config)
Merging rockchip/for-next (7f0817eee7ba Merge branch 'v6.18-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (e886e1abbd08 Merge branch 'next/clk' into fo=
r-next)
Merging scmi/for-linux-next (9512db4ff7ad Merge branch 'for-next/scmi/updat=
es' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linu=
x into for-linux-next)
Merging sophgo/for-next (349ae53a949c Merge branch 'dt/riscv' into for-next)
Merging sophgo-soc/soc-for-next (c8754c7deab4 soc: sophgo: cv1800: rtcsys: =
New driver (handling RTC only))
Merging spacemit/for-next (bab8dea25910 riscv: dts: spacemit: Add OrangePi =
RV2 board device tree)
Merging stm32/stm32-next (1a32f7427eb3 arm64: dts: st: remove empty line in=
 stm32mp251.dtsi)
Merging sunxi/sunxi/for-next (0239b6f7bfc4 Merge branches 'sunxi/fixes-for-=
6.17' and 'sunxi/dt-for-6.18' into sunxi/for-next)
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
Merging clk-renesas/renesas-clk (07e7ccd804dc clk: renesas: r9a09g077: Add =
module clocks for SCI1-SCI5)
Merging thead-clk/thead-clk-for-next (c567bc5fc68c clk: thead: th1520-ap: s=
et all AXI clocks to CLK_IS_CRITICAL)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (538c06e3964a LoongArch: KVM: Add address =
alignment check in pch_pic register access)
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
Merging riscv-dt/riscv-dt-for-next (481ee0fcbb9a riscv: dts: starfive: jh71=
10-common: drop no-sdio property from mmc1)
Merging riscv-soc/riscv-soc-for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging s390/for-next (4f4a48bd35a3 Merge branch 'fixes' into for-next)
Merging sh/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (fc9ed2f6589d um: Replace __ASSEMBLY__ with __ASSEMBLER__ =
in the usermode headers)
Merging xtensa/xtensa-for-next (44a4ef59d550 xtensa: Replace __ASSEMBLY__ w=
ith __ASSEMBLER__ in non-uapi headers)
Merging fs-next (4bb3ad23019e Merge branch 'vfs.all' of https://git.kernel.=
org/pub/scm/linux/kernel/git/vfs/vfs.git)
  8e9bd2a6953e ("bcachefs: stop using write_cache_pages")
CONFLICT (content): Merge conflict in fs/bcachefs/darray.c
Merging printk/for-next (8990f1983843 Merge branch 'rework/ringbuffer-kunit=
-test' into for-next)
Merging pci/next (c56bdfacbb5a Merge branch 'pci/misc')
Merging pstore/for-next/pstore (d679c2e1e8d9 pstore/zone: rewrite some comm=
ents for better understanding)
Merging hid/for-next (3ebd7fd9f2eb Merge branch 'for-6.17/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (94c296776403 i2c: muxes: pca954x: Reset if (de)se=
lect fails)
Merging i2c-host/i2c/i2c-host (5b4488c9ec00 i2c: rtl9300: Implement I2C blo=
ck read and write)
Merging i3c/i3c/next (3b661ca549b9 i3c: add missing include to internal hea=
der)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (9703c672af8d MAINTAINERS: Mark coretemp d=
river as orphaned)
Merging jc_docs/docs-next (ee9a66919354 Merge branch 'mauro-pdf' into docs-=
mw)
Merging v4l-dvb/next (a75b8d198c55 media: imon: Remove unused defines)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (f0f47deb2a09 Merge branch 'thermal-intel' into linux=
-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (b5af45302ebc cpufreq: ti: Add s=
upport for AM62D2)
Merging cpupower/cpupower (357d1fc38aad cpupower: Allow control of boost fe=
ature on non-x86 based systems with boost support.)
Merging devfreq/devfreq-next (7da2fdaaa1e6 PM / devfreq: Add HiSilicon unco=
re frequency scaling driver)
Merging pmdomain/next (ffeebf7587f5 pmdomain: mediatek: Convert all SoCs to=
 new style regmap retrieval)
Merging opp/opp/linux-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging thermal/thermal/linux-next (1d264d3a1988 dt-bindings: thermal: tegr=
a: Document Tegra210B01)
Merging rdma/for-next (211dc59b7bb5 IB/hfi1: Use for_each_online_cpu() inst=
ead of for_each_cpu())
Merging net-next/main (a7bd72158063 Octeontx2-af: Broadcast XON on all chan=
nels)
Merging bpf-next/for-next (5b6d6fe1ca7b Merge branch 'bpf-next/net' into fo=
r-next)
Merging ipsec-next/master (9f4f591cd5a4 xfrm: xfrm_user: use strscpy() for =
alg_name)
Merging mlx5-next/mlx5-next (40653f280b26 {rdma,net}/mlx5: export mlx5_vpor=
t_get_vhca_id)
Merging netfilter-next/main (a9af709fda7e Merge git://git.kernel.org/pub/sc=
m/linux/kernel/git/netdev/net)
Merging ipvs-next/main (d9104cec3e8f Merge tag 'bpf-next-6.17' of git://git=
.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next)
Merging bluetooth/master (832f2b9e58e2 Bluetooth: MGMT: Fix not exposing de=
bug UUID on MGMT_OP_READ_EXP_FEATURES_INFO)
Merging wireless-next/for-next (126d85fb0405 Merge tag 'wireless-next-2025-=
07-24' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless=
-next)
Merging ath-next/for-next (d9104cec3e8f Merge tag 'bpf-next-6.17' of git://=
git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next)
Merging iwlwifi-next/next (d9104cec3e8f Merge tag 'bpf-next-6.17' of git://=
git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next)
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
Merging libcrypto/libcrypto-next (07e1551bc8eb lib/crypto: Drop inline from=
 all *_mod_init_arch() functions)
Merging drm/drm-next (dd489c01c397 Merge tag 'drm-misc-next-2025-08-14' of =
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/nova/file.rs
Merging drm-exynos/for-linux-next (d07e4c00696f drm/exynos: dsi: add suppor=
t for exynos7870)
$ git reset --hard HEAD^
Merging next-20250820 version of drm-exynos
Merging drm-misc/for-linux-next (3f13bcc886fc Documentation: accel: amdxdna=
: Update compiler information)
Merging amdgpu/drm-next (645cc7863da5 drm/amd/display: Fix DP audio DTO1 cl=
ock source on DCE 6.)
  027e7acc7e17 ("drm/amd/display: Fix fractional fb divider in set_pixel_cl=
ock_v3")
  1ae45b5d4f37 ("drm/amd/display: Adjust DCE 8-10 clock, don't overclock by=
 15%")
  1e5e8d672fec ("drm/amd/display: Avoid a NULL pointer dereference")
  249d4bc5f193 ("drm/amd/display: Don't print errors for nonexistent connec=
tors")
  33e0227ee96e ("drm/amd/display: Don't warn when missing DCE encoder caps")
  34d66bc7ff10 ("drm/amd/display: Fix Xorg desktop unresponsive on Replay p=
anel")
  427980c1cbd2 ("drm/amd/display: Don't overclock DCE 6 by 15%")
  4ab09785f8d5 ("drm/amd/display: Find first CRTC and its line time in dce1=
10_fill_display_configs")
  54f7f3ca982a ("drm/amdgpu/swm14: Update power limit logic")
  5e43eb3cd731 ("drm/amd/display: Add null pointer check in mod_hdcp_hdcp1_=
create_session()")
  645cc7863da5 ("drm/amd/display: Fix DP audio DTO1 clock source on DCE 6.")
  8107432dff37 ("drm/amd/display: Fill display clock and vblank time in dce=
110_fill_display_configs")
  92f68f6a1b29 ("drm/amd/display: Revert Add HPO encoder support to Replay")
Merging drm-intel/for-linux-next (7c8c76272e17 drm/i915/psr: Check pause co=
unter before continuing to PSR activation)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_tc=
.c
Merging drm-msm/msm-next (8290d37ad2b0 drm/msm: Small function param doc fi=
x)
Merging drm-msm-lumag/msm-next-lumag (75717bce00d1 drm/msm: Don't use %pK t=
hrough printk)
Merging drm-nova/nova-next (99e7f8e83a9c gpu: nova-core: falcon: align DMA =
transfers to 256 bytes)
Merging drm-xe/drm-xe-next (bc2b2062682a drm/xe/kunit: Extend platform gene=
rator with PTL)
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (b87662f1dcc7 fbdev: s3fb: Implement powersave for S=
3 FB)
Merging regmap/for-next (5c36b86d2bf6 regmap: Remove superfluous check for =
!config in __regmap_init())
Merging sound/for-next (2aec0b6a6b53 ALSA: usb-audio: Add validation of UAC=
2/UAC3 effect units)
Merging ieee1394/for-next (8748368c3d92 firewire: ohci: remove obsolete mod=
ule-level debug parameter)
Merging sound-asoc/for-next (c5ba056a7306 Merge remote-tracking branch 'aso=
c/for-6.18' into asoc-next)
Merging modules/modules-next (5eb4b9a4cdbb params: Replace deprecated strcp=
y() with strscpy() and memcpy())
Merging input/next (80025149db06 Input: include export.h in modules using E=
XPORT_SYMBOL*())
Applying: input: remove second addition of <linux/stdarg.h>
Merging block/for-next (50e88988c911 Merge branch 'for-6.18/io_uring' into =
for-next)
Merging device-mapper/for-next (fd5cc4922bef dm-pcache: add persistent cach=
e target in device-mapper)
Merging libata/for-next (8985d90d4bbd dt-bindings: ata: highbank: Minor whi=
tespace cleanup in example)
Merging pcmcia/pcmcia-next (4a81f78caa53 pcmcia: Add error handling for add=
_interval() in do_validate_mem())
Merging mmc/next (e7d1ce96f149 mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (c0eb742dd61c dt-bindings: mfd: qnap,ts433-mcu: Al=
low nvmem-layout child node)
Merging backlight/for-backlight-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging battery/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging regulator/for-next (121e399e125d Merge remote-tracking branch 'regu=
lator/for-6.18' into regulator-next)
Merging security/next (046c56178a73 rust,cred: update AlwaysRefCounted impo=
rt to sync::aref)
Merging apparmor/apparmor-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging integrity/next-integrity (a4cc916bf572 lib/digsig: Use SHA-1 librar=
y instead of crypto_shash)
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
Merging devicetree/for-next (6c779409b9d9 docs: dt: writing-bindings: Docum=
ent node name ABI and simple-mfd)
Merging dt-krzk/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging mailbox/for-next (5378bdf6a611 mailbox/pcc: support mailbox managem=
ent of the shared buffer)
Merging spi/for-next (6a97e12e6a06 Merge remote-tracking branch 'spi/for-6.=
18' into spi-next)
Merging tip/master (14eb6608b216 Merge branch into tip/master: 'x86/misc')
Merging clockevents/timers/drivers/next (461f124656e6 clocksource/drivers/a=
rm_arch_timer_mmio: Add MMIO clocksource)
Merging edac/edac-for-next (6d3763dce2c6 Merge ras/edac-drivers into for-ne=
xt)
Merging ftrace/for-next (b0e6cd7d1c90 Merge probes/for-next)
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
Merging kvm-x86/next (ecbcc2461839 Merge branches 'fixes', 'generic', 'misc=
', 'mmu', 'selftests', 'svm' and 'vmx')
Merging xen-tip/linux-next (efdaa61d73a1 drivers/xen/xenbus: remove quirk f=
or Xen 3.x)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (324cee0c272c Merge branch 'for-6.17' into for-=
next)
Merging sched-ext/for-next (4b3570b49067 Merge branch 'for-6.17-fixes' into=
 for-next)
Merging drivers-x86/for-next (30359c239ba8 platform/x86: int3472: Increase =
ov08x40 handshake GPIO delay to 45 ms)
Merging chrome-platform/for-next (f7439a723e5a platform/chrome: wilco_ec: R=
emove redundant semicolons)
Merging chrome-platform-firmware/for-firmware-next (8f5ae30d69d7 Linux 6.17=
-rc1)
Merging hsi/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging leds-lj/for-leds-next (7d5c3cac1f39 leds: flash: leds-qcom-flash: A=
dd a separate register map for PMI8998)
Merging ipmi/for-next (44c942f84d3b ipmi:si: Gracefully handle if the BMC i=
s non-functional)
Merging driver-core/driver-core-next (44d454fcffa8 sysfs: remove attribute_=
group::bin_attrs_new)
Merging usb/usb-next (956606bafb5f usb: gadget: f_ncm: Fix MAC assignment N=
CM ethernet)
Merging thunderbolt/next (5d03847175e8 thunderbolt: Use is_pciehp instead o=
f is_hotplug_bridge)
Merging usb-serial/usb-next (bdf2ab177e2f USB: serial: cp210x: use new GPIO=
 line value setter callbacks)
Merging tty/tty-next (7cd9f5d6c5a3 s390/char/con3270: use tty_port_tty guar=
d())
Merging char-misc/char-misc-next (8a61a53b07f2 binder: add tracepoint for n=
etlink reports)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (a80198ba650f coresight: fix indentation error in cs=
cfg_remove_owned_csdev_configs())
Merging fastrpc/for-next (b52ebc078bb6 misc: fastrpc: add support for gdsp =
remoteproc)
Merging fpga/for-next (4f156ee58bb8 fpga: zynq_fpga: Fix the wrong usage of=
 dma_map_sgtable())
Merging icc/icc-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging iio/togreg (788c57f4766b docs: iio: ad3552r: Fix malformed code-blo=
ck directive)
Merging phy-next/next (38404274bbee phy: ingenic: use core driver model hel=
per to handle probe errors)
Merging soundwire/next (8b63fee9f623 soundwire: debugfs: add SCP_SDCA_IntSt=
atX and SCP_SDCA_IntMaskX registers)
Merging extcon/extcon-next (5f09caafc652 extcon: fsa9480: Avoid buffer over=
flow in fsa9480_handle_change())
Merging gnss/gnss-next (e326371f3002 dt-bindings: gnss: u-blox: add u-blox,=
neo-9m compatible)
Merging vfio/next (b1779e4f209c vfio/type1: conditional rescheduling while =
pinning)
Merging w1/for-next (411053cb6657 dt-bindings: w1: imx: Add an entry for th=
e interrupts property)
Merging spmi/spmi-next (0ff41df1cb26 Linux 6.15)
Merging staging/staging-next (5141ae32d4b8 staging: rtl8723bs: fix coding s=
tyle issues in core/rtw_mlme.c)
Merging counter-next/counter-next (19272b37aa4f Linux 6.16-rc1)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (1daede86fef9 dmaengine: ppc4xx: Remove space before=
 newline)
Merging cgroup/for-next (ac412e77dc29 Merge branch 'for-6.18' into for-next)
Merging scsi/for-next (8d7ec03a6727 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (edb35b1ffc68 scsi: myrs: Fix dma_alloc_coherent(=
) error check)
Merging vhost/linux-next (9b26fdd93310 virtio_net: adjust the execution ord=
er of function `virtnet_close` during freeze)
Merging rpmsg/for-next (2e83f7fb51f5 Merge branch 'rproc-next' into for-nex=
t)
Merging gpio-brgl/gpio/for-next (5893165a27e7 gpio: remove unneeded 'fast_i=
o' parameter in regmap_config)
Merging gpio-intel/for-next (16c07342b542 gpiolib: acpi: Program debounce w=
hen finding GPIO)
Merging pinctrl/for-next (0ae621d78880 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging pinctrl-renesas/renesas-pinctrl (d1d31e2739ff pinctrl: renesas: rzt=
2h: Add support for RZ/N2H)
Applying: fix up for "pinctrl: renesas: Add support for RZ/T2H"
Merging pinctrl-samsung/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging pwm/pwm/for-next (e4eb829ddefc pwm: pca9586: Convert to waveform AP=
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
Merging nvmem/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (15b07d3e2be2 mshv: Add support for a new parent=
 partition configuration)
Merging auxdisplay/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging kgdb/kgdb/for-next (afdbe49276ac kdb: Remove optional size argument=
s from strscpy() calls)
Merging hmm/hmm (19272b37aa4f Linux 6.16-rc1)
Merging cfi/cfi/next (19272b37aa4f Linux 6.16-rc1)
Merging mhi/mhi-next (00559ba3ae74 bus: mhi: host: pci_generic: Add Telit F=
N990B40 modem support)
Merging memblock/for-next (66e537433fac memblock: drop for_each_free_mem_pf=
n_range_in_zone_from())
Merging cxl/next (561c4e30bff9 Documentation/driver-api: Fix typo error in =
cxl)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (02eb7a8eee20 efi: add API doc entry for ovmf_debug_log)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (8185696483dc MAINTAINERS: add missing files to =
slab section)
Merging random/master (3778dcb2dcc1 random: use offstack cpumask when neces=
sary)
Merging landlock/next (6dde339a3df8 landlock: Minor comments improvements)
Merging rust/rust-next (c17b750b3ad9 Linux 6.17-rc2)
Merging rust-alloc/alloc-next (ac9eea3d08c2 rust: alloc: implement Box::pin=
_slice())
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
Merging crc/crc-next (136d029662cd Documentation/staging: Fix typo and inco=
rrect citation in crc32.rst)
Merging fwctl/for-next (19272b37aa4f Linux 6.16-rc1)
Merging devsec-tsm/next (9d948b880409 Merge branch 'for-6.16/tsm-mr' into t=
sm-next)
Merging hisilicon/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)

--Sig_/M9Q2BnNCeodlyNNi9clStaE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmioBwwACgkQAVBC80lX
0GwxaQf9GfhNOowRMoCTNu1/n2Tdg2WaCmmDyvNrGhj8EYfN3B7bdggKXCCKhrCz
w6+U9n7DrpFDGVY4TtVNnt4HrPtUFsK/CpX7/nG1hgdcNWskBWT00M3VGG8+vAgH
WS/mD+Jw1fb+tHcgcl6nuobm1t6psaTS4/zpfmIcBatEJFTgCT6fzSpz+x+n7OIh
L81OIdLdKhfbR6VlbnRv9277/fOp/Jst7+j8LM4L7ubtEptxjtr9X/KBvJ+jKjVq
jGD6C8W4St1Mk+KfLJFYkP4qDF9fNgn114c271cKjFeJlwMh/yRYQSg854Mxd8xI
Z829TlUWYyw1o7eQEz8LqwIO4M0BYA==
=BIO3
-----END PGP SIGNATURE-----

--Sig_/M9Q2BnNCeodlyNNi9clStaE--

