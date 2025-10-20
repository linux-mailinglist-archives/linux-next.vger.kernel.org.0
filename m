Return-Path: <linux-next+bounces-8653-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C50BEF38F
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 06:12:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 70957348E2E
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 04:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D661F286891;
	Mon, 20 Oct 2025 04:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QhbZvD5i"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD43242A9D;
	Mon, 20 Oct 2025 04:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760933524; cv=none; b=QzOz5wfUeojYbz79msPu2lF0YfNXlBiCt80M00oTiQ/ibHPlyNiabiErAFwlrTDwnnI1ipQWhkAMcMmq1mUWR6y2Bv625W4guDxhZN+hXL96PDhOZ+ZaPJSvfwbQsI6YLzWUQMPKs+Slid73hrEUxJv2461StunTVg6ADGlPffc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760933524; c=relaxed/simple;
	bh=BVZ8mO+xlZNG+pWFdGtE9LPNuUAvUyRHoW+wJJDlW6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uAK+KpjG7JFS31Xx6TTtb93+HRR8L7lN6sB2E9ObPjybyvOpglnZqZiM3wfuOU5wPK5kheWHgg3LSCRARFD9by4WDcmwwcrcv16Q61y/hxyx4FFrask8eG57ppCSzhWyPSW6xoaKtAQ1OdganqzCQp3jt/BUfmcgE4cLo1rpM1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QhbZvD5i; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1760933516;
	bh=Use7yPiZBF3iBykrjWsYX60s/8IO1jIAf2wEHgTcdwI=;
	h=Date:From:To:Cc:Subject:From;
	b=QhbZvD5ixtbS++8tPgd8m4aRmtcECbn3nRHEwqo7vDIc3y6vyJirP1b6ZVYa7IPNM
	 Mb+r6U5HV8MtlhbCUoSLOsJja3sGb/id4XVs2J6wIP/nxcfcQrvvQpebhPtQbojAQ+
	 WtORvbHfGv6Ra/FScJMeRYkYdP4c56jcuXxHyhgI90MOchf6VpdQoFEAnR16T8aMZg
	 Af2FyBxePv1LAeqJ3HqQ/KBSuY7N+jJpfS2Ce0RZdryug0fs1hoG17SvV9U5iKlwLd
	 oz4NF/G8sFgLd1+nwXht9+OsP/JRBz6yr3SOc3lxbUwi2sXnazO226JxKbCjQT1PyB
	 hcY5sRUC8xNjQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cqhp446wbz4w1v;
	Mon, 20 Oct 2025 15:11:56 +1100 (AEDT)
Date: Mon, 20 Oct 2025 15:11:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 20
Message-ID: <20251020151155.36cbec51@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hIwXp83IFD85Kdzy2.gfknc";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hIwXp83IFD85Kdzy2.gfknc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20251017:

The iwlwifi-next tree gained a build failure for which I reverted
a commit.

The drm-xe tree gained a conflict against the drm-intel tree.

The kvm-x86 tree gained a conflict against the tip tree.

The gpio-brgl tree gained a build failure so I used the version from
next-20251016.

The hyperv tree gained a build failure so I used the version from
next-20251017.

Non-merge commits (relative to Linus' tree): 2252
 2695 files changed, 76920 insertions(+), 35520 deletions(-)

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

I am currently merging 407 trees (counting Linus' and 406 trees of bug
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
Merging origin/master (d9043c79ba68 Merge tag 'sched_urgent_for_v6.18_rc2' =
of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging ext4-fixes/fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging vfs-brauner-fixes/vfs.fixes (a779e27f24ae coredump: fix core_patter=
n input validation)
Merging fscrypt-current/for-current (8f5ae30d69d7 Linux 6.17-rc1)
Merging fsverity-current/for-current (8f5ae30d69d7 Linux 6.17-rc1)
Merging btrfs-fixes/next-fixes (fc9cb2b5eefc Merge branch 'misc-6.18' into =
next-fixes)
Merging vfs-fixes/fixes (00e782110428 nfs4_setup_readdir(): insufficient lo=
cking for ->d_parent->d_inode dereferencing)
Merging erofs-fixes/fixes (b63599c5ce9e erofs: consolidate z_erofs_extent_l=
ookback())
Merging nfsd-fixes/nfsd-fixes (4b47a8601b71 NFSD: Define a proc_layoutcommi=
t for the FlexFiles layout type)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (e8bd877fb76b ovl: fix possible double un=
link)
Merging fscrypt/for-next (19591f7e781f fscrypt: use HMAC-SHA512 library for=
 HKDF)
Merging btrfs/for-next (d759638757ae Merge branch 'for-next-next-v6.18-2025=
1017' into for-next-20251017)
Merging ceph/master (d74d6c0e9895 ceph: add bug tracking system info to MAI=
NTAINERS)
Merging cifs/for-next (30d48f160050 smb: move SMB1_PROTO_NUMBER to common/c=
ifsglob.h)
Merging configfs/configfs-next (462272dd734b configfs: use PTR_ERR_OR_ZERO(=
) to simplify code)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (8e4021078863 dlm: check for undefined release_option valu=
es)
Merging erofs/dev (e2d3af0d64e5 erofs: drop redundant sanity check for ztai=
lpacking inline)
Merging exfat/dev (2d8636119b92 exfat: fix out-of-bounds in exfat_nls_to_uc=
s2())
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (25554ea0b42b Pull udf extent block verification.)
Merging ext4/dev (c065b6046b34 Use CONFIG_EXT4_FS instead of CONFIG_EXT3_FS=
 in all of the defconfigs)
Merging f2fs/dev (c9cd50d5aaf8 f2fs: use folio_nr_pages() instead of shift =
operation)
Merging fsverity/for-next (a1f692fd69cc fsverity: Use 2-way interleaved SHA=
-256 hashing when supported)
Merging fuse/for-next (cb403594701c fuse: move CREATE_TRACE_POINTS to a sep=
arate file)
Merging gfs2/for-next (1d281e3481d2 gfs2: Use GL_NOBLOCK flag for non-block=
ing lookups)
Merging jfs/jfs-next (cafc6679824a jfs: replace hardcoded magic number with=
 DTPAGEMAXSLOT constant)
Merging ksmbd/ksmbd-for-next (4ccb3a800028 Merge tag '6.18-rc1-smb-client-f=
ixes' of git://git.samba.org/sfrench/cifs-2.6)
Merging nfs/linux-next (3a8660878839 Linux 6.18-rc1)
Merging nfs-anna/linux-next (9bb3baa9d160 NFS4: Fix state renewals missing =
after boot)
Merging nfsd/nfsd-next (e460f42e4b18 NFSD: Add array bounds-checking in nfs=
d_iter_read())
Merging ntfs3/master (3a8660878839 Linux 6.18-rc1)
Merging orangefs/for-next (11f6bce77e27 fs/orangefs: Replace kzalloc + copy=
_from_user with memdup_user_nul)
Merging overlayfs/overlayfs-next (ad1423922781 ovl: make sure that ovl_crea=
te_real() returns a hashed dentry)
Merging ubifs/next (99dbb2a1bd66 ubifs: stop using write_cache_pages)
Merging v9fs/9p-next (528f218b31aa 9p: sysfs_init: don't hardcode error to =
ENOMEM)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (3a8660878839 Linux 6.18-rc1)
Merging zonefs/for-next (a42938e80357 zonefs: correct some spelling mistake=
s)
Merging vfs-brauner/vfs.all (267652e9d474 Merge branch 'vfs-6.18.async' int=
o vfs.all)
CONFLICT (modify/delete): fs/bcachefs/btree_write_buffer.c deleted in HEAD =
and modified in vfs-brauner/vfs.all.  Version vfs-brauner/vfs.all of fs/bca=
chefs/btree_write_buffer.c left in tree.
CONFLICT (modify/delete): fs/bcachefs/io_read.c deleted in HEAD and modifie=
d in vfs-brauner/vfs.all.  Version vfs-brauner/vfs.all of fs/bcachefs/io_re=
ad.c left in tree.
CONFLICT (modify/delete): fs/bcachefs/journal_io.c deleted in HEAD and modi=
fied in vfs-brauner/vfs.all.  Version vfs-brauner/vfs.all of fs/bcachefs/jo=
urnal_io.c left in tree.
CONFLICT (modify/delete): fs/bcachefs/super.c deleted in HEAD and modified =
in vfs-brauner/vfs.all.  Version vfs-brauner/vfs.all of fs/bcachefs/super.c=
 left in tree.
CONFLICT (content): Merge conflict in fs/quota/dquot.c
CONFLICT (content): Merge conflict in include/linux/ipc_namespace.h
$ git rm -f fs/bcachefs/btree_write_buffer.c fs/bcachefs/io_read.c fs/bcach=
efs/journal_io.c fs/bcachefs/super.c
Merging vfs/for-next (15f5e46385aa Merge branches 'work.fs_context', 'work.=
f_path', 'work.qstr', 'work.misc', 'work.nfsctl' and 'work.finish_no_open' =
into for-next)
Merging mm-hotfixes/mm-hotfixes-unstable (ba57ae0d1ec0 mm/huge_memory: do n=
ot change split_huge_page*() target order silently.)
Merging fs-current (534533e0e4ee Merge branch 'fixes' of https://git.kernel=
.org/pub/scm/linux/kernel/git/xiang/erofs.git)
Merging kbuild-current/kbuild-fixes (3a8660878839 Linux 6.18-rc1)
Merging arc-current/for-curr (d7b8f8e20813 Linux 6.16-rc5)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (ea0d55ae4b32 arm64: debug: always unmas=
k interrupts in el0_softstp())
Merging arm-soc-fixes/arm/fixes (3573844359bb soc: officially expand mainta=
inership team)
Merging davinci-current/davinci/for-current (3a8660878839 Linux 6.18-rc1)
Merging drivers-memory-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging sophgo-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging sophgo-soc-fixes/soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging m68k-current/for-linus (695f2c0c25f3 m68k: defconfig: Update defcon=
figs for v6.17-rc1)
Merging powerpc-fixes/fixes (0843ba458439 powerpc/fadump: skip parameter ar=
ea allocation when fadump is disabled)
Merging s390-fixes/fixes (ce971233242b s390/cpum_cf: Deny all sampling even=
ts by counter PMU)
Merging net/main (ffff5c8fc2af net: phy: realtek: fix rtl8221b-vm-cg name)
Merging bpf/master (1c64efcb083c Merge tag 'rust-rustfmt' of git://git.kern=
el.org/pub/scm/linux/kernel/git/ojeda/linux)
Merging ipsec/master (2c67301584f2 net: phy: realtek: Avoid PHYCR2 access i=
f PHYCR2 not present)
Merging netfilter/main (e6cc7ac0d420 Merge branch 'eth-fbnic-fix-xdp_tx-and=
-xdp-vs-qstats')
Merging ipvs/main (e6cc7ac0d420 Merge branch 'eth-fbnic-fix-xdp_tx-and-xdp-=
vs-qstats')
Merging wireless/for-next (cbf658dd0941 Merge tag 'net-6.17-rc7' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ath/for-current (9c78e747dd4f wifi: ath11k: avoid bit operation on =
key flags)
Merging iwlwifi/fixes (77e67d5daaf1 wifi: iwlwifi: fix potential use after =
free in iwl_mld_remove_link())
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (3a8660878839 Linux 6.18-rc1)
Merging sound-current/for-linus (7963891f7c9c ALSA: usb-audio: fix control =
pipe direction)
Merging sound-asoc-fixes/for-linus (f1a450f9e17d ASoC: nau8821: Fix IRQ han=
dling and improve jack)
Merging regmap-fixes/for-linus (6dc21d19fe9b Merge remote-tracking branch '=
regmap/for-6.17' into regmap-linus)
Merging regulator-fixes/for-linus (3a8660878839 Linux 6.18-rc1)
Merging spi-fixes/for-linus (0b7d9b25e4bc spi: airoha: fix reading/writing =
of flashes with more than one plane per lun)
Merging pci-current/for-linus (5b18c9a6e454 MIPS: Malta: Use pcibios_align_=
resource() to block io range)
Merging driver-core.current/driver-core-linus (cfec502b3d09 rust: device: f=
ix device context of Device::parent())
Merging tty.current/tty-linus (3a8660878839 Linux 6.18-rc1)
Merging usb.current/usb-linus (2bbd38fcd296 xhci: dbc: enable back DbC in r=
esume if it was enabled before suspend)
Merging usb-serial-fixes/usb-linus (3a8660878839 Linux 6.18-rc1)
Merging phy/fixes (3a8660878839 Linux 6.18-rc1)
Merging staging.current/staging-linus (b1aabb8ef09b staging: gpib: Fix devi=
ce reference leak in fmh_gpib driver)
Merging iio-fixes/fixes-togreg (d26a0fa57e36 iio: humditiy: hdc3020: fix un=
its for thresholds and hysteresis)
Merging counter-current/counter-current (3a8660878839 Linux 6.18-rc1)
Merging char-misc.current/char-misc-linus (7557f1899425 binder: Fix missing=
 kernel-doc entries in binder.c)
Merging soundwire-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging thunderbolt-fixes/fixes (e5f0a698b34e Linux 6.17)
Merging input-current/for-linus (69aeb5073123 Input: pegasus-notetaker - fi=
x potential out-of-bounds access)
Merging crypto-current/master (6bb73db6948c crypto: essiv - Check ssize for=
 decryption and in-place encryption)
Merging libcrypto-fixes/libcrypto-fixes (cdb03b6d1896 crypto: sha512 - Impl=
ement export_core() and import_core())
Merging vfio-fixes/for-linus (c1d9dac0db16 vfio/pci: Align huge faults to o=
rder)
Merging kselftest-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging dmaengine-fixes/fixes (81935b90b6fc dmaengine: xilinx: xdma: Fix re=
gmap max_register)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (4550d33e1811 mtd: spinand: winbond: Fix oob_la=
yout for W25N01JW)
Merging mfd-fixes/for-mfd-fixes (615c1e348ec8 mfd: ls2kbmc: Check for devm_=
mfd_add_devices() failure)
Merging v4l-dvb-fixes/fixes (c90fad3e4157 media: ivtv: Fix invalid access t=
o file *)
Merging reset-fixes/reset/fixes (9a52827a9bbb reset: eyeq: fix OF node leak)
Merging mips-fixes/mips-fixes (3a8660878839 Linux 6.18-rc1)
Merging at91-fixes/at91-fixes (217efb440933 ARM: dts: microchip: sama7d65: =
Force SDMMC Legacy mode)
Merging omap-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging kvm-fixes/master (4361f5aa8bfc Merge tag 'kvm-x86-fixes-6.18-rc2' o=
f https://github.com/kvm-x86/linux into HEAD)
Merging kvms390-fixes/master (5f9df945d4e8 KVM: s390: Fix FOLL_*/FAULT_FLAG=
_* confusion)
Merging hwmon-fixes/hwmon (3ea4daea7d92 hwmon: (sht3x) Fix error handling)
Merging nvdimm-fixes/libnvdimm-fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging cxl-fixes/fixes (a4bbb493a324 cxl/trace: Subtract to find an hpa_al=
ias0 in cxl_poison events)
Merging dma-mapping-fixes/dma-mapping-fixes (3a8660878839 Linux 6.18-rc1)
Merging drivers-x86-fixes/fixes (34cbd6e07fdd platform/x86: alienware-wmi-w=
max: Add AWCC support to Dell G15 5530)
Merging samsung-krzk-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging pinctrl-samsung-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging devicetree-fixes/dt/linus (ce740955b238 dt-bindings: bus: renesas-b=
sc: allow additional properties)
Merging dt-krzk-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging scsi-fixes/fixes (482779066035 Merge branch '6.18/scsi-queue' into =
6.18/scsi-fixes)
Merging drm-fixes/drm-fixes (62cab426d0e3 Merge tag 'drm-xe-fixes-2025-10-1=
6' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (95355766e587 drm/i915/psr: De=
activate PSR only on LNL and when selective fetch enabled)
Merging mmc-fixes/fixes (2b2e8c36795c mmc: wmt-sdmmc: fix compile test defa=
ult)
Merging rtc-fixes/rtc-fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging gnss-fixes/gnss-linus (3a8660878839 Linux 6.18-rc1)
Merging hyperv-fixes/hyperv-fixes (852bfe55e211 mshv: Fix deposit memory in=
 MSHV_ROOT_HVCALL)
Merging risc-v-fixes/fixes (b7776a802f2f riscv: hwprobe: avoid uninitialize=
d variable use in hwprobe_arch_id())
Merging riscv-dt-fixes/riscv-dt-fixes (19272b37aa4f Linux 6.16-rc1)
Merging riscv-soc-fixes/riscv-soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging spdx/spdx-linus (3a8660878839 Linux 6.18-rc1)
Merging gpio-brgl-fixes/gpio/for-current (3a8660878839 Linux 6.18-rc1)
Merging gpio-intel-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging pinctrl-intel-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging auxdisplay-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging kunit-fixes/kunit-fixes (3a8660878839 Linux 6.18-rc1)
Merging memblock-fixes/fixes (b3dcc9d1d806 memblock: fix kernel-doc for MEM=
BLOCK_RSRV_NOINIT)
Merging renesas-fixes/fixes (379c590113ce ARM: shmobile: smp: Enforce shmob=
ile_smp_* alignment)
Merging perf-current/perf-tools (ec714e371f22 Merge tag 'perf-tools-for-v6.=
18-1-2025-10-08' of git://git.kernel.org/pub/scm/linux/kernel/git/perf/perf=
-tools)
Merging efi-fixes/urgent (e5f0a698b34e Linux 6.17)
Merging battery-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging iommufd-fixes/for-rc (43f6bee02196 iommufd/selftest: Update the fai=
l_nth limit)
Merging rust-fixes/rust-fixes (d9043c79ba68 Merge tag 'sched_urgent_for_v6.=
18_rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging w1-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging pmdomain-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging i2c-host-fixes/i2c/i2c-host-fixes (3a8660878839 Linux 6.18-rc1)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (3a8660878839 Linux 6.18-rc1)
Merging thead-clk-fixes/thead-clk-fixes (3a8660878839 Linux 6.18-rc1)
Merging pwrseq-fixes/pwrseq/for-current (3a8660878839 Linux 6.18-rc1)
Merging thead-dt-fixes/thead-dt-fixes (3a8660878839 Linux 6.18-rc1)
Merging ftrace-fixes/ftrace/fixes (327e28664307 fgraph: Do not enable funct=
ion_graph tracer when setting funcgraph-args)
Merging ring-buffer-fixes/ring-buffer/fixes (e4d4b8670c44 ring-buffer: Use =
flush_kernel_vmap_range() over flush_dcache_folio())
Merging trace-fixes/trace/fixes (54b91e54b113 tracing: Stop fortify-string =
from warning in tracing_mark_raw_write())
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging tip-fixes/tip/urgent (799798fb9fc0 Merge branch into tip/master: 'x=
86/urgent')
Merging slab-fixes/slab/for-next-fixes (86f54f9b6c17 slab: reset slab->obj_=
ext when freeing and it is OBJEXTS_ALLOC_FAIL)
Merging drm-msm-fixes/msm-fixes (7f9335f2d998 drm/ci: disable broken MR che=
ck in sanity job)
Merging uml-fixes/fixes (df447a3b4a4b um: Fix FD copy size in os_rcv_fd_msg=
())
Merging fwctl-fixes/for-rc (f12343013022 pds_fwctl: Remove the use of dev_e=
rr_probe())
Merging devsec-tsm-fixes/fixes (fba4ceaa242d configfs-tsm-report: Fix NULL =
dereference of tsm_ops)
Merging drm-rust-fixes/drm-rust-fixes (3a8660878839 Linux 6.18-rc1)
Merging drm-misc-fixes/for-linux-next-fixes (4eabd0d8791e drm/panthor: Fix =
kernel panic on partial unmap of a GPU VA region)
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (3a8660878839 Linux 6.18-rc1)
Merging mm-nonmm-stable/mm-nonmm-stable (3a8660878839 Linux 6.18-rc1)
Merging mm-unstable/mm-unstable (593609b026ef memcg: net: track network thr=
ottling due to memcg memory pressure)
Merging mm-nonmm-unstable/mm-nonmm-unstable (fe794ae5f227 ocfs2: introduce =
chain list sanity check with ocfs2_check_chain_list())
Merging kbuild/kbuild-next (3a8660878839 Linux 6.18-rc1)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (b4a63b0e7370 perf test parse-events: Add evse=
l test helper)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (3a8660878839 Linux 6.18-rc1)
Merging asm-generic/master (edcc8a38b5ac once: fix race by moving DO_ONCE t=
o separate section)
Merging alpha/alpha-next (1523226edda5 alpha: Use str_yes_no() helper in pc=
i_dac_dma_supported())
Merging arm/for-next (eca2ec8c85ae Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (f620d66af316 arm64: mte: Do not flag the zero =
page as PG_mte_tagged)
Merging arm-perf/for-next/perf (2084660ad288 perf/dwc_pcie: Fix use of unin=
itialized variable)
Merging arm-soc/for-next (30954acd3919 Merge branch 'soc/drivers' into for-=
next)
Merging amlogic/for-next (a0c59ce817bc Merge branch 'v6.18/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (5d21b7ca05c8 Merge branch 'apple-soc/=
drivers-6.19' into asahi-soc/for-next)
Merging at91/at91-next (5a410e87e09e Merge branch 'at91-dt' into at91-next)
Merging bmc/for-next (39f0ed9219df Merge branches 'aspeed/arm/dt' and 'aspe=
ed/fixes' into for-next)
Merging broadcom/next (a72033e3bdc8 Merge branch 'devicetree-arm64/next' in=
to next)
Merging cix/for-next (de1ab02c6e14 arm64: dts: cix: add DT nodes for SPI)
Merging davinci/davinci/for-next (3a8660878839 Linux 6.18-rc1)
Merging drivers-memory/for-next (50c833c5cd94 memory: tegra30-emc: Add the =
SoC model prefix to functions)
Merging fsl/soc_fsl (5498f07842cb soc/fsl/qbman: Use for_each_online_cpu() =
instead of for_each_cpu())
Merging imx-mxs/for-next (ea21fa34164c Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (de8df7a4c881 Merge branch 'v6.18-next/dts32' int=
o for-next)
Merging mvebu/for-next (86a99e9f5394 Merge branch 'mvebu/fixes' into mvebu/=
for-next)
Merging omap/for-next (462bfcbe8834 Merge branch 'omap-for-v6.18/soc' into =
tmp/omap-next-20250915.162436)
Merging qcom/for-next (30bf3ec8cb6b Merge branches 'arm32-defconfig-for-v6.=
18', 'arm32-for-6.18', 'arm64-defconfig-for-6.18', 'arm64-for-6.18', 'clk-f=
or-6.18', 'drivers-fixes-for-6.17' and 'drivers-for-6.18' into for-next)
Merging renesas/next (6194bbf43aeb Merge branches 'renesas-arm-defconfig-fo=
r-v6.19' and 'renesas-dts-for-v6.19' into renesas-next)
Merging reset/reset/next (3a8660878839 Linux 6.18-rc1)
Merging rockchip/for-next (9893549e592a Merge branch 'v6.19-armsoc/defconfi=
g64' into for-next)
Merging samsung-krzk/for-next (d5d9b5655f35 Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (e5db90f4c044 Merge branch 'for-next/ffa/update=
s' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux=
 into for-linux-next)
Merging sophgo/for-next (0251a1deaec7 Merge branch 'dt/riscv' into for-next)
Merging sophgo-soc/soc-for-next (c8754c7deab4 soc: sophgo: cv1800: rtcsys: =
New driver (handling RTC only))
Merging spacemit/for-next (859ce3828f0b riscv: dts: spacemit: add i2c alias=
es on BPI-F3)
Merging stm32/stm32-next (53c18dc078bb arm64: dts: st: fix memory region si=
ze on stm32mp235f-dk)
Merging sunxi/sunxi/for-next (5b7f133cdcf7 Merge branch 'sunxi/dt-for-6.19'=
 into sunxi/for-next)
Merging tee/next (e2c2e95934ea Merge branch 'tee_qcomtee_fixes_for_v6.18' i=
nto next)
Merging tegra/for-next (1166fb2f657a Merge branch for-6.19/arm64/dt into fo=
r-next)
Merging thead-dt/thead-dt-for-next (fac4be7b3d49 riscv: dts: thead: add zfh=
 for th1520)
Merging ti/ti-next (3a8660878839 Linux 6.18-rc1)
Merging xilinx/for-next (a35dc981c5d8 Merge branch 'zynqmp/defconfig' into =
for-next)
Merging clk/clk-next (3a8660878839 Linux 6.18-rc1)
Merging clk-imx/for-next (14be8b7b6cbc clk: imx95-blk-ctl: Save/restore reg=
isters when RPM routines are called)
Merging clk-renesas/renesas-clk (0f537c41831a clk: renesas: r9a09g057: Add =
clock and reset entries for ISP)
Merging thead-clk/thead-clk-for-next (3a8660878839 Linux 6.18-rc1)
Merging csky/linux-next (16464af83128 csky: Replace __ASSEMBLY__ with __ASS=
EMBLER__ in uapi header)
Merging loongarch/loongarch-next (032676ff8217 LoongArch: Update Loongson-3=
 default config file)
Merging m68k/for-next (695f2c0c25f3 m68k: defconfig: Update defconfigs for =
v6.17-rc1)
Merging m68knommu/for-next (3a8660878839 Linux 6.18-rc1)
Merging microblaze/next (7f7072574127 Merge tag 'kbuild-6.18-1' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/kbuild/linux)
Merging mips/mips-next (3a8660878839 Linux 6.18-rc1)
Merging openrisc/for-next (8c30b0018f9d openrisc: Add jump label support)
Merging parisc-hd/for-next (5fb1d3ce3e74 parisc: entry: set W bit for !comp=
at tasks in syscall_restore_rfi())
Merging powerpc/next (ef104054a312 powerpc/pseries: Define __u{8,32} types =
in papr_hvpipe_hdr struct)
Merging risc-v/for-next (3a8660878839 Linux 6.18-rc1)
Merging riscv-dt/riscv-dt-for-next (4cce8b2503ab riscv: dts: starfive: add =
Milk-V Mars CM Lite system-on-module)
Merging riscv-soc/riscv-soc-for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging s390/for-next (300709fbefd1 mm/memory_hotplug: Remove MEM_PREPARE_O=
NLINE/MEM_FINISH_OFFLINE notifiers)
Merging sh/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging sparc/for-next (fe0126702a40 sparc: Replace deprecated strcpy() wit=
h strscpy() in handle_nextprop_quirks())
Merging uml/next (fc282d1731ec Merge tag 'uml-for-linux-6.18-rc1' of git://=
git.kernel.org/pub/scm/linux/kernel/git/uml/linux)
Merging xtensa/xtensa-for-next (4c8bad3ed035 xtensa: use HZ_PER_MHZ in plat=
form_calibrate_ccount)
Merging fs-next (8f8ab89b3b28 Merge branch 'for-next' of https://git.kernel=
.org/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (3cb5302e8c68 Merge branch 'for-6.18' into for-next)
Merging pci/next (3a8660878839 Linux 6.18-rc1)
Merging pstore/for-next/pstore (d679c2e1e8d9 pstore/zone: rewrite some comm=
ents for better understanding)
Merging hid/for-next (828aeac92901 Merge branches 'for-6.18/upstream-fixes'=
, 'for-6.19/intel-ish-v2', 'for-6.19/logitech', 'for-6.19/uclogic' and 'for=
-6.19/winwing' into for-next)
Merging i2c/i2c/for-next (867537094124 dt-bindings: i2c: Convert apm,xgene-=
slimpro-i2c to DT schema)
Merging i2c-host/i2c/i2c-host (a1414272219c i2c: pcf8584: Fix do not use as=
signment inside if conditional)
Merging i3c/i3c/next (d6ddd9beb1a5 i3c: fix big-endian FIFO transfers)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (65bc97a5e49e Update maxim-ic.com links to=
 analog.com)
Merging jc_docs/docs-next (96b546c241b1 Documentation/rtla: rename common_x=
xx.rst files to common_xxx.txt)
Merging v4l-dvb/next (8652359fc004 Merge branch 'media-uapi' of git://git.l=
wn.net/linux into media-next)
Merging v4l-dvb-next/master (adc218676eef Linux 6.12)
Merging pm/linux-next (277a48fa37d7 Merge branch 'pm-core' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (72d66ab1afeb cpufreq: dt-platde=
v: Add JH7110S SOC to the allowlist)
Merging cpupower/cpupower (3a8660878839 Linux 6.18-rc1)
Merging devfreq/devfreq-next (eddb5ba91b28 PM / devfreq: rockchip-dfi: add =
support for LPDDR5)
Merging pmdomain/next (8bed31a59f72 usb: dwc3: imx8mp: Set out of band wake=
up for i.MX95)
Merging opp/opp/linux-next (3a8660878839 Linux 6.18-rc1)
Merging thermal/thermal/linux-next (dc67521c20b7 thermal/drivers/renesas/rz=
g3e: Fix add thermal driver for the Renesas RZ/G3E SoC)
Merging rdma/for-next (3a8660878839 Linux 6.18-rc1)
Merging net-next/main (88224095b4e5 Merge branch 'net-dsa-lantiq_gswip-clea=
n-up-and-improve-vlan-handling')
Merging bpf-next/for-next (7361c864852f selftests/bpf: Fix list_del() in ar=
ena list)
Merging ipsec-next/master (18a7e218cfcd Merge tag 'net-6.18-rc1' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging mlx5-next/mlx5-next (3a8660878839 Linux 6.18-rc1)
Merging netfilter-next/main (18a7e218cfcd Merge tag 'net-6.18-rc1' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ipvs-next/main (18a7e218cfcd Merge tag 'net-6.18-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging bluetooth/master (19c922bc098a Bluetooth: ISO: Fix another instance=
 of dst_type handling)
Merging wireless-next/for-next (94aced6ed9e2 Merge tag 'wireless-next-2025-=
09-25' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless=
-next)
Merging ath-next/for-next (1e06a137513d wifi: libertas: WQ_PERCPU added to =
alloc_workqueue users)
Merging iwlwifi-next/next (06e43d6edf6a wifi: iwlwifi: mld: add null check =
for kzalloc() in iwl_mld_send_proto_offload())
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/fw=
/runtime.h
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (362f84c89e13 mtd: rawnand: sunxi: drop unused module =
alias)
Merging nand/nand/next (1001cc117124 mtd: nand: raw: gpmi: fix clocks when =
CONFIG_PM=3DN)
Merging spi-nor/spi-nor/next (17926cd770ec mtd: spi-nor: core: avoid odd le=
ngth/address writes in 8D-8D-8D mode)
Merging crypto/master (2964cf361235 rhashtable: use likely for rhashtable l=
ookup)
Merging libcrypto/libcrypto-next (123fa1574bcc lib/crypto: Add FIPS self-te=
sts for SHA-1 and SHA-2)
  08080b1ea549 ("crypto: x86/aes-gcm - reorder AVX512 precompute and aad_up=
date functions")
  3bb8775a518f ("crypto: x86/aes-gcm - optimize long AAD processing with AV=
X512")
  42d929de14fb ("crypto: x86/aes-gcm - clean up AVX512 code to assume 512-b=
it vectors")
  5a530ed1e321 ("crypto: x86/aes-gcm - optimize AVX512 precomputation of H^=
2 from H^1")
  9bc4bcca89e4 ("crypto: x86/aes-gcm - rename avx10 and avx10_512 to avx512=
")
  d03a8a0dc347 ("crypto: x86/aes-gcm - remove VAES+AVX10/256 optimized code=
")
  e274d2ebb428 ("crypto: x86/aes-gcm - revise some comments in AVX512 code")
CONFLICT (add/add): Merge conflict in arch/x86/crypto/aes-gcm-vaes-avx2.S
Merging drm/drm-next (3a8660878839 Linux 6.18-rc1)
Merging drm-exynos/for-linux-next (3a8660878839 Linux 6.18-rc1)
Merging drm-misc/for-linux-next (4f5f8baf7341 dma-buf: heaps: cma: Create C=
MA heap for each CMA reserved region)
Merging amdgpu/drm-next (079ae5118e1f drm/amdkfd: fix suspend/resume all ca=
lls in mes based eviction path)
Merging drm-intel/for-linux-next (4ba596539e98 drm/i915/vrr: Use optimized =
guardband whenever VRR TG is active)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_fb=
.c
Merging drm-msm/msm-next (b5bad77e1e3c drm/msm/registers: Sync GPU register=
s from mesa)
Merging drm-msm-lumag/msm-next-lumag (a643abb67379 drm/msm/mdp4: remove the=
 use of dev_err_probe())
Merging drm-rust/drm-rust-next (1d5cffebd930 gpu: nova-core: vbios: Rework =
BiosImage to be simpler)
Merging drm-nova/nova-next (93296e9d9528 gpu: nova-core: vbios: store refer=
ence to Device where relevant)
Merging drm-xe/drm-xe-next (d104d7ea864c drm/xe/xe3p: Add xe3p EU stall dat=
a format)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_pci.c
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (3a8660878839 Linux 6.18-rc1)
Merging regmap/for-next (d00c269736b6 Merge branch 'regmap-linus' into regm=
ap-next)
Merging sound/for-next (28bcb2169693 ALSA: dice: add support for TASCAM IF-=
FW/DM MkII)
Merging ieee1394/for-next (15f9610fc96a firewire: core: handle device quirk=
 of MOTU Audio Express)
Merging sound-asoc/for-next (3b5506f50f07 Merge remote-tracking branch 'aso=
c/for-6.19' into asoc-next)
Merging modules/modules-next (5eb4b9a4cdbb params: Replace deprecated strcp=
y() with strscpy() and memcpy())
Merging input/next (e8ec34ed4616 dt-bindings: input: ti,twl4030-keypad: con=
vert to DT schema)
Merging block/for-next (c206fa7ada0d Merge branch 'block-6.18' into for-nex=
t)
Merging device-mapper/for-next (d2d8de047f74 dm-crypt: Use MD5 library inst=
ead of crypto_shash)
Merging libata/for-next (c9d869fb29d3 dt-bindings: ata: eswin: Document for=
 EIC7700 SoC ahci)
Merging pcmcia/pcmcia-next (4a81f78caa53 pcmcia: Add error handling for add=
_interval() in do_validate_mem())
Merging mmc/next (8ed4a4814535 mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (b9d6cfe2ae69 mfd: simple-mfd-i2c: Add compatible =
string for LX2160ARDB)
Merging backlight/for-backlight-next (ba3b29a639fe backlight: rt4831: Inclu=
de <linux/mod_devicetable.h>)
Merging battery/for-next (3a8660878839 Linux 6.18-rc1)
Merging regulator/for-next (5263cd81578f rpmh-regulators: Update rpmh-regul=
ator driver and)
Merging security/next (3a8660878839 Linux 6.18-rc1)
Merging apparmor/apparmor-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging integrity/next-integrity (43369273518f ima: add fs_subtype conditio=
n for distinguishing FUSE instances)
Merging selinux/next (c6f0a830ef4b memfd,selinux: call security_inode_init_=
security_anon())
Merging smack/next (6ddd169d0288 smack: fix kernel-doc warnings for smk_imp=
ort_valid_label())
Merging tomoyo/master (645c9b0cb27e net: update dev_put()/dev_hold() debugg=
ing)
Merging tpmdd/next (dbfdaeb381a4 tpm_crb: Add idle support for the Arm FF-A=
 start method)
Merging watchdog/master (c64c2a50cdd4 watchdog/hpwdt New maintianer)
Merging iommu/next (5f4b8c03f417 Merge branches 'apple/dart', 'ti/omap', 'r=
iscv', 'intel/vt-d' and 'amd/amd-vi' into next)
Merging audit/next (3a8660878839 Linux 6.18-rc1)
Merging devicetree/for-next (2235e76485f5 dt-bindings: arm: Convert Marvell=
 AP80x System Controller to DT schema)
Merging dt-krzk/for-next (7ee0f223cabe arm64: dts: toshiba: tmpv7708: Add d=
efault GIC address cells)
Merging mailbox/for-next (3f39f5652037 mailbox: mtk-cmdq: Remove pm_runtime=
 APIs from cmdq_mbox_send_data())
Merging spi/for-next (0cdb2b1b7eda spi: airoha: driver fixes & improvements)
Merging tip/master (15b7ab079fc8 Merge branch into tip/master: 'x86/sgx')
Merging clockevents/timers/drivers/next (45d78cd0bf2c dt-bindings: timer: e=
xynos4210-mct: Add compatible for ARTPEC-9 SoC)
Merging edac/edac-for-next (ea574fadd9fd Merge ras/edac-amd-atl into for-ne=
xt)
Merging ftrace/for-next (57cf3db954ef Merge tools/for-next)
Merging rcu/next (1d289fc5691c Merge branch 'torture.2025.08.14a' into HEAD)
Merging paulmck/non-rcu/next (b706eec9304f Merge branches 'lkmm.2025.07.09a=
', 'ratelimit.2025.06.24a' and 'stop-machine.2025.07.17a' into HEAD)
Merging kvm/next (6b36119b94d0 KVM: x86: Export KVM-internal symbols for su=
b-modules only)
Merging kvm-arm/next (10fd0285305d Merge branch kvm-arm64/selftests-6.18 in=
to kvmarm-master/next)
Merging kvms390/next (5deafa27d9ae KVM: s390: Fix to clear PTE when discard=
ing a swapped page)
Merging kvm-ppc/topic/ppc-kvm (c17b750b3ad9 Linux 6.17-rc2)
Merging kvm-riscv/riscv_kvm_next (dbdadd943a27 RISC-V: KVM: Upgrade the sup=
ported SBI version to 3.0)
Merging kvm-x86/next (a6385761762e Merge branches 'generic', 'gmem', 'mmu',=
 'selftests', 'svm' and 'vmx')
CONFLICT (content): Merge conflict in arch/x86/include/asm/cpufeatures.h
Merging xen-tip/linux-next (9d52b0b41be5 xen: take system_transition_mutex =
on suspend)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (8b8cfc05ada8 Merge branch 'for-6.18' into for-=
next)
Merging sched-ext/for-next (14228a0f2896 Merge branch 'for-6.19' into for-n=
ext)
Merging drivers-x86/for-next (1c72d9c3e0c6 platform/x86:intel/pmc: Remove r=
edundant has_die_c6 variable)
Merging chrome-platform/for-next (e4ee0bb077cd platform/chrome: cros_usbpd_=
notify: defer probe when parent EC driver isn't ready)
Merging chrome-platform-firmware/for-firmware-next (3a8660878839 Linux 6.18=
-rc1)
Merging hsi/for-next (3a8660878839 Linux 6.18-rc1)
Merging leds-lj/for-leds-next (64826db1e2e1 dt-bindings: leds: as3645: Conv=
ert to DT schema)
Merging ipmi/for-next (35bcedc1a793 MAINTAINERS: Add entry on Loongson-2K I=
PMI driver)
Merging driver-core/driver-core-next (340ccc973544 rust: pci: Allocate and =
manage PCI interrupt vectors)
Merging usb/usb-next (877c80dfbf78 usb: ljca: Improve ACPI hardware ID docu=
mentation)
Merging thunderbolt/next (67600ccfc4f3 thunderbolt: Fix use-after-free in t=
b_dp_dprx_work)
Merging usb-serial/usb-next (3a8660878839 Linux 6.18-rc1)
Merging tty/tty-next (3a8660878839 Linux 6.18-rc1)
Merging char-misc/char-misc-next (3a8660878839 Linux 6.18-rc1)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (01f96b812526 coresight: Add label sysfs node suppor=
t)
Merging fastrpc/for-next (3a8660878839 Linux 6.18-rc1)
Merging fpga/for-next (e0650a9b38b8 MAINTAINERS: change maintainer for Inte=
l MAX10 BMC secure updates)
Merging icc/icc-next (bcdf7a064c3c Merge branch 'icc-glymur' into icc-next)
Merging iio/togreg (561285d04805 MAINTAINERS: Support ROHM BD79112 ADC)
Merging phy-next/next (3a8660878839 Linux 6.18-rc1)
Merging soundwire/next (3a8660878839 Linux 6.18-rc1)
Merging extcon/extcon-next (94d885eb8ffe dt-bindings: extcon: linux,extcon-=
usb-gpio: GPIO must be provided)
Merging gnss/gnss-next (3a8660878839 Linux 6.18-rc1)
Merging vfio/next (451bb9632898 vfio: Dump migration features under debugfs)
Merging w1/for-next (f3c6353d801a w1: ds28e17: Replace deprecated strcpy + =
strcat in w1_f19_add_slave)
Merging spmi/spmi-next (0ff41df1cb26 Linux 6.15)
Merging staging/staging-next (b8b4b51be76e staging: rtl8723bs: Rename camel=
 case functions.)
Merging counter-next/counter-next (b462fcd08dd5 MAINTAINERS: Update Intel Q=
uadrature Encoder Peripheral maintainer)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (398035178503 i2c: i2c-qcom-geni: Add Block event in=
terrupt support)
Merging cgroup/for-next (0fbbcab7f908 cgroup/misc: fix misc_res_type kernel=
-doc warning)
Merging scsi/for-next (bec744347dd6 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (3a8660878839 Linux 6.18-rc1)
Merging vhost/linux-next (c6f3b304eb54 virtio_vdpa: fix misleading return i=
n void function)
Merging rpmsg/for-next (d959d55e84c3 Merge branches 'rproc-next' and 'rpmsg=
-next' into for-next)
Merging gpio-brgl/gpio/for-next (eba11116f395 gpiolib: of: Get rid of <linu=
x/gpio/legacy-of-mm-gpiochip.h>)
$ git reset --hard HEAD^
Merging next-20251017 version of gpio-brgl
Merging gpio-intel/for-next (3a8660878839 Linux 6.18-rc1)
Merging pinctrl/for-next (4906c17150cc Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (3a8660878839 Linux 6.18-rc1)
Merging pinctrl-renesas/renesas-pinctrl (bf48f99d95df pinctrl: renesas: Rem=
ove unneeded semicolons)
Merging pinctrl-samsung/for-next (3cfc60e09bdc pinctrl: samsung: Add ARTPEC=
-9 SoC specific configuration)
Merging pwm/pwm/for-next (c447363d018e pwm: Use %u to printf unsigned int p=
wm_chip::npwm and pwm_chip::id)
Merging ktest/for-next (a5e71638ddd7 ktest.pl: Add new PATCHCHECK_SKIP opti=
on to skip testing individual commits)
Merging kselftest/next (3a8660878839 Linux 6.18-rc1)
Merging kunit/test (3a8660878839 Linux 6.18-rc1)
Merging kunit-next/kunit (3a8660878839 Linux 6.18-rc1)
Merging livepatching/for-next (5cb5575308bc selftests: livepatch: use canon=
ical ftrace path)
Merging rtc/rtc-next (9db26d5855d0 rtc: interface: Ensure alarm irq is enab=
led when UIE is enabled)
Merging nvdimm/libnvdimm-for-next (5c34f2b6f89a nvdimm: Remove duplicate li=
nux/slab.h header)
Merging at24/at24/for-next (3a8660878839 Linux 6.18-rc1)
Merging ntb/ntb-next (68113d260674 NTB/msi: Remove unused functions)
Merging seccomp/for-next/seccomp (b0c9bfbab925 selftests/seccomp: Add a tes=
t for the WAIT_KILLABLE_RECV fast reply race)
Merging slimbus/for-next (4bb909aa44ed dt-bindings: slimbus: fix warning fr=
om example)
Merging nvmem/for-next (3a8660878839 Linux 6.18-rc1)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (60116744be53 x86/hyperv: Enable build of hyperv=
isor crashdump collection files)
$ git reset --hard HEAD^
Merging next-20251017 version of hyperv
Merging auxdisplay/for-next (00de283c53c9 Merge patch series "auxdisplay: l=
inedisp: support attribute attachment to auxdisplay devices")
Merging kgdb/kgdb/for-next (fdbdd0ccb30a kdb: remove redundant check for sc=
ancode 0xe0)
Merging hmm/hmm (19272b37aa4f Linux 6.16-rc1)
Merging cfi/cfi/next (3a8660878839 Linux 6.18-rc1)
Merging mhi/mhi-next (6eaee77923dd bus: mhi: host: pci_generic: Add Telit F=
E990B40 modem support)
Merging memblock/for-next (e68f150bc11d memblock: drop for_each_free_mem_pf=
n_range_in_zone_from())
Merging cxl/next (46037455cbb7 Merge branch 'for-6.18/cxl-delay-dport' into=
 cxl-for-next)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (99da5bf3dd6a efi/x86: Memory protection on EfiGcdMemoryTy=
peMoreReliable)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (ca74b8cadaad Merge series "slab: Re-entrant kma=
lloc_nolock()")
Merging random/master (3778dcb2dcc1 random: use offstack cpumask when neces=
sary)
Merging landlock/next (6dde339a3df8 landlock: Minor comments improvements)
Merging rust/rust-next (a1ec674cd709 rust: replace `CStr` with `core::ffi::=
CStr`)
Merging rust-alloc/alloc-next (3a8660878839 Linux 6.18-rc1)
Merging rust-io/io-next (86731a2a651e Linux 6.16-rc3)
Merging rust-pin-init/pin-init-next (42415d163e5d rust: pin-init: add refer=
ences to previously initialized fields)
Merging rust-timekeeping/timekeeping-next (4521438fb076 rust: time: Impleme=
nt basic arithmetic operations for Delta)
Merging rust-xarray/xarray-next (fa616196fbea MAINTAINERS: add entry for Ru=
st XArray API)
Merging sysctl/sysctl-next (19272b37aa4f Linux 6.16-rc1)
Merging execve/for-next/execve (8c94db0ae97c binfmt_elf: preserve original =
ELF e_flags for core dumps)
Merging bitmap/bitmap-for-next (7e85ac9da1ac PM / devfreq: rockchip-dfi: sw=
itch to FIELD_PREP_WM16 macro)
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (b157dd228cf0 tools headers: kcfi: rename missed=
 CONFIG_CFI_CLANG)
Merging nolibc/for-next (812f223fe9be tools/nolibc: handle NULL wstatus arg=
ument to waitpid())
Merging iommufd/for-next (2a918911ed3d iommufd: Register iommufd mock devic=
es with fwspec)
Merging turbostat/next (447c98c1ca4a tools/power turbostat: Add idle govern=
or statistics reporting)
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.8
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.c
Merging pwrseq/pwrseq/for-next (3a8660878839 Linux 6.18-rc1)
Merging capabilities-next/caps-next (d87d3c530e0c pid: use ns_capable_noaud=
it() when determining net sysctl permissions)
Merging ipe/next (c88788fe31a5 ipe: Drop a duplicated CONFIG_ prefix in the=
 ifdeffery)
Merging kcsan/next (800348aa34b2 kcsan: test: Replace deprecated strcpy() w=
ith strscpy())
Merging crc/crc-next (136d029662cd Documentation/staging: Fix typo and inco=
rrect citation in crc32.rst)
Merging fwctl/for-next (479bec4cb39a pds_fwctl: Replace kzalloc + copy_from=
_user with memdup_user in pdsfc_fw_rpc)
Merging devsec-tsm/next (9d948b880409 Merge branch 'for-6.16/tsm-mr' into t=
sm-next)
Merging hisilicon/for-next (6c177775dcc5 Merge branch 'next/drivers' into f=
or-next)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)
Applying: Revert "wifi: iwlwifi: be more chatty when we fail to find a wifi=
7 device"

--Sig_/hIwXp83IFD85Kdzy2.gfknc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj1towACgkQAVBC80lX
0GzTAAgAg71fBy6vnoZR3ZpHMo2qJx7HPu4PLdN67a2PCTBaMsw2kdJjj5gNRKNQ
QZHUX3Qmb4FfOQqTppBm0sHTvHQ6psDSJr26OY/Vmn8dGb67qwzQPgtYcPTyXoA3
fbiXoMBgqYmv+3jZCbIPC4xqYZsGYsbB0FE6HA/5GVHwOeAE2bx8DUI2ddfgI7Ed
Qk35+Z+bLcv0felIjNSpZeDTw4eJuggd1eUC7e+NdlrXtaNNIhj+ecIXZW87vLDl
s9UiScVoASuTujOHWDJuRSNUyoawyc+GxJok2UjaP1dDa1wbZSTe0JnqqPLhumTL
Ewv9sdwUtvOFZ3EE2w15qBkiuTJK0g==
=ELWJ
-----END PGP SIGNATURE-----

--Sig_/hIwXp83IFD85Kdzy2.gfknc--

