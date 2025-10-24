Return-Path: <linux-next+bounces-8702-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B916CC044D2
	for <lists+linux-next@lfdr.de>; Fri, 24 Oct 2025 06:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EDDBA4E64C5
	for <lists+linux-next@lfdr.de>; Fri, 24 Oct 2025 04:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E5E2690D5;
	Fri, 24 Oct 2025 04:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="J9kIT1In"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C80277CA5;
	Fri, 24 Oct 2025 04:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761278583; cv=none; b=FMJfUE1lE+9PnqASogHzzRSr6an9K9+sornbktVKJPwGc5m54TNYnVUCkRIVYzZY4F9ewGM5/kQPC66TQ70pRMPhEpr/pM89bPcthLbEmAd6CMkiCIIhdvD7EfwoBrXL+sgUKa6YxXbKHUV/ojNFik5ltzJ/nXwxG0v/jUYSWDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761278583; c=relaxed/simple;
	bh=xiaS/sv9xCGWhCx3k58+Cwn1hsh8ctNFoYCB/8gI84I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dtIKCsZB0mHoLWgQbfrZt8oW03WJbpGnyM+2wnU5rDr6k3bqfIxXNzYqyIu9q8aAwCbMg71aelNCut3ywoRs/TzmahjHgW0AOftzh3QZ6b8u+t6wBCr9h/48Z6ePLt/slf8hWGr3vmyJHlAoUX/dj4eLQfdbdqH7cyq2TSp6R8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=J9kIT1In; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761278572;
	bh=R0tBvQgI5LXQnBDyIjWRfGVpQ4p0+5mRcbn6JNvDHb0=;
	h=Date:From:To:Cc:Subject:From;
	b=J9kIT1In9HLZ1UYO+M0416YJD+3saCUEopJJSpQ+PTjf3GE3XLlMPKtNxrSZdsebK
	 1WyRPfnKv/TgezQLD2lLWEWqNHZwZqpXiuL3VJx/ArKZr+ZNIWNyzAgGoU0Pht2y+C
	 UxB21E/8+BRiS0u4fWr3CWk1DiP0idyD50W/FjLoCIbT2KIQ1/wQZwcGN3+R9n5gfU
	 83wmYoyP2TMZ15ieHcc3tAlm5/6iFCB/cdBVTbJtV0TQ4Y8bfm9CTfY1iAwHMBvB05
	 txVf0ULxr/i106TyqU3yXrg2fFB/1+5JtK4e2FPMajPqstQnZBAh797OAAf7xeacgX
	 y366no5cV3afQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ct8Pm4qxHz4wML;
	Fri, 24 Oct 2025 15:02:52 +1100 (AEDT)
Date: Fri, 24 Oct 2025 15:02:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 24
Message-ID: <20251024150251.6827fda4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KxUk.VoGV7NOXcnZicrl._R";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KxUk.VoGV7NOXcnZicrl._R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20251023:

The sound-asoc-fixes tree gained a build failure so I used the version
from next-20251022.

The pmdomain tree lost its build failure.

The tip tree lost its build failure.

The char-misc tree gained a conflict against the char-misc.current tree.

Non-merge commits (relative to Linus' tree): 3485
 3994 files changed, 138491 insertions(+), 47794 deletions(-)

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

I am currently merging 406 trees (counting Linus' and 405 trees of bug
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
Merging origin/master (266ee584e55e Merge tag 'arm64-fixes' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/arm64/linux)
Merging fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging ext4-fixes/fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging vfs-brauner-fixes/vfs.fixes (7933a585d70e ovl: remove redundant IOC=
B_DIO_CALLER_COMP clearing)
Merging fscrypt-current/for-current (8f5ae30d69d7 Linux 6.17-rc1)
Merging fsverity-current/for-current (8f5ae30d69d7 Linux 6.17-rc1)
Merging btrfs-fixes/next-fixes (188727c65084 Merge branch 'misc-6.18' into =
next-fixes)
Merging vfs-fixes/fixes (00e782110428 nfs4_setup_readdir(): insufficient lo=
cking for ->d_parent->d_inode dereferencing)
Merging erofs-fixes/fixes (2a13fc417f49 erofs: consolidate z_erofs_extent_l=
ookback())
Merging nfsd-fixes/nfsd-fixes (3e7f011c2555 Revert "NFSD: Remove the cap on=
 number of operations per NFSv4 COMPOUND")
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (e8bd877fb76b ovl: fix possible double un=
link)
Merging fscrypt/for-next (19591f7e781f fscrypt: use HMAC-SHA512 library for=
 HKDF)
Merging btrfs/for-next (7a879b89f3b9 Merge branch 'for-next-next-v6.18-2025=
1022' into for-next-20251022)
Merging ceph/master (d74d6c0e9895 ceph: add bug tracking system info to MAI=
NTAINERS)
Merging cifs/for-next (61f1cbb7ee27 smb: move SMB1_PROTO_NUMBER to common/c=
ifsglob.h)
Merging configfs/configfs-next (462272dd734b configfs: use PTR_ERR_OR_ZERO(=
) to simplify code)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (8e4021078863 dlm: check for undefined release_option valu=
es)
Merging erofs/dev (e2d3af0d64e5 erofs: drop redundant sanity check for ztai=
lpacking inline)
Merging exfat/dev (bdf013eb8c84 exfat: fix refcount leak in exfat_find)
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
Merging gfs2/for-next (a7f1196a2e37 gfs2: Get rid of had_lock in gfs2_dreva=
lidate)
Merging jfs/jfs-next (cafc6679824a jfs: replace hardcoded magic number with=
 DTPAGEMAXSLOT constant)
Merging ksmbd/ksmbd-for-next (123111ea6226 smb: client: make use of smbdire=
ct_socket.send_io.lcredits.*)
Merging nfs/linux-next (211ddde0823f Linux 6.18-rc2)
Merging nfs-anna/linux-next (9bb3baa9d160 NFS4: Fix state renewals missing =
after boot)
Merging nfsd/nfsd-next (90ea3f4fbb0f nfsd: delete unreachable confusing cod=
e in nfs4_open_delegation())
Merging ntfs3/master (3a8660878839 Linux 6.18-rc1)
Merging orangefs/for-next (11f6bce77e27 fs/orangefs: Replace kzalloc + copy=
_from_user with memdup_user_nul)
Merging overlayfs/overlayfs-next (ad1423922781 ovl: make sure that ovl_crea=
te_real() returns a hashed dentry)
Merging ubifs/next (99dbb2a1bd66 ubifs: stop using write_cache_pages)
Merging v9fs/9p-next (528f218b31aa 9p: sysfs_init: don't hardcode error to =
ENOMEM)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (f477af0cfa04 xfs: fix locking in xchk_nlinks_collect_=
dir)
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
Merging mm-hotfixes/mm-hotfixes-unstable (75dd4ef333cf mm/kmsan: fix kmsan =
kmalloc hook when no stack depots are allocated yet)
Merging fs-current (0427ed6b19e4 Merge branch 'nfsd-fixes' of https://git.k=
ernel.org/pub/scm/linux/kernel/git/cel/linux)
Merging kbuild-current/kbuild-fixes (3a8660878839 Linux 6.18-rc1)
Merging arc-current/for-curr (d7b8f8e20813 Linux 6.16-rc5)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (b98c94eed4a9 arm64: mte: Do not warn if=
 the page is already tagged in copy_highpage())
Merging arm-soc-fixes/arm/fixes (b0cd17fd31a8 soc: officially expand mainta=
inership team)
Merging davinci-current/davinci/for-current (3a8660878839 Linux 6.18-rc1)
Merging drivers-memory-fixes/fixes (6f37469a9330 memory: tegra210: Fix inco=
rrect client ids)
Merging sophgo-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging sophgo-soc-fixes/soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging m68k-current/for-linus (695f2c0c25f3 m68k: defconfig: Update defcon=
figs for v6.17-rc1)
Merging powerpc-fixes/fixes (0843ba458439 powerpc/fadump: skip parameter ar=
ea allocation when fadump is disabled)
Merging s390-fixes/fixes (0fd20f65df6a s390/pci: Avoid deadlock between PCI=
 error recovery and mlx5 crdump)
Merging net/main (ab431bc39741 Merge tag 'net-6.18-rc3' of git://git.kernel=
.org/pub/scm/linux/kernel/git/netdev/net)
Merging bpf/master (7221b9caf84b libbpf: Fix powerpc's stack register defin=
ition in bpf_tracing.h)
Merging ipsec/master (f2bc8231fd43 xfrm: check all hash buckets for leftove=
r states during netns deletion)
Merging netfilter/main (d63f0391d6c7 net: hibmcge: select FIXED_PHY)
Merging ipvs/main (e6cc7ac0d420 Merge branch 'eth-fbnic-fix-xdp_tx-and-xdp-=
vs-qstats')
Merging wireless/for-next (69e4b75a5b90 Merge tag 'iwlwifi-fixes-2025-10-19=
' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next)
Merging ath/for-current (69e4b75a5b90 Merge tag 'iwlwifi-fixes-2025-10-19' =
of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next)
Merging iwlwifi/fixes (3802f25a6b5d wifi: iwlwifi: fix aux ROC time event i=
terator usage)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (d8713158faad RDMA/uverbs: Fix umem release in UV=
ERBS_METHOD_CQ_CREATE)
Merging sound-current/for-linus (7963891f7c9c ALSA: usb-audio: fix control =
pipe direction)
Merging sound-asoc-fixes/for-linus (61eb4112a8fb ASoC: soc_sdw_utils: add c=
s35l57 support)
$ git reset --hard HEAD^
Merging next-20251022 version of sound-asoc-fixes
Merging regmap-fixes/for-linus (6dc21d19fe9b Merge remote-tracking branch '=
regmap/for-6.17' into regmap-linus)
Merging regulator-fixes/for-linus (211ddde0823f Linux 6.18-rc2)
Merging spi-fixes/for-linus (1b824134261d spi: dt-bindings: spi-rockchip: A=
dd RK3506 compatible)
Merging pci-current/for-linus (8911046cc9c6 PCI/ASPM: Enable only L0s and L=
1 for devicetree platforms)
Merging driver-core.current/driver-core-linus (2eead1933451 arch_topology: =
Fix incorrect error check in topology_parse_cpu_capacity())
Merging tty.current/tty-linus (d518314a1fa4 serial: 8250_mtk: Enable baud c=
lock and manage in runtime PM)
Merging usb.current/usb-linus (2d8713f807a4 tcpm: switch check for role_sw =
device with fw_node)
Merging usb-serial-fixes/usb-linus (622865c73ae3 USB: serial: option: add T=
elit FN920C04 ECM compositions)
Merging phy/fixes (3a8660878839 Linux 6.18-rc1)
Merging staging.current/staging-linus (b1aabb8ef09b staging: gpib: Fix devi=
ce reference leak in fmh_gpib driver)
Merging iio-fixes/fixes-togreg (d26a0fa57e36 iio: humditiy: hdc3020: fix un=
its for thresholds and hysteresis)
Merging counter-current/counter-current (3a8660878839 Linux 6.18-rc1)
Merging char-misc.current/char-misc-linus (a8cc9e5fcb0e most: usb: hdm_prob=
e: Fix calling put_device() before device initialization)
Merging soundwire-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging thunderbolt-fixes/fixes (3575254546a2 thunderbolt: Add support for =
Intel Wildcat Lake)
Merging input-current/for-linus (69aeb5073123 Input: pegasus-notetaker - fi=
x potential out-of-bounds access)
Merging crypto-current/master (3c9bf72cc1ce crypto: aspeed - fix double fre=
e caused by devm)
Merging libcrypto-fixes/libcrypto-fixes (1af424b15401 lib/crypto: poly1305:=
 Restore dependency of arch code on !KMSAN)
Merging vfio-fixes/for-linus (b2c37c1168f5 MAINTAINERS: Update Alex William=
son's email address)
Merging kselftest-fixes/fixes (920aa3a7705a selftests: cachestat: Fix warni=
ng on declaration under label)
Merging dmaengine-fixes/fixes (81935b90b6fc dmaengine: xilinx: xdma: Fix re=
gmap max_register)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (5c56bf214af8 mtd: rawnand: cadence: fix DMA de=
vice NULL pointer dereference)
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
Merging hwmon-fixes/hwmon (8dcc66ad379e hwmon: (sht3x) Fix error handling)
Merging nvdimm-fixes/libnvdimm-fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging cxl-fixes/fixes (7c3643f204ed acpi,srat: Fix incorrect device handl=
e check for Generic Initiator)
Merging dma-mapping-fixes/dma-mapping-fixes (3a8660878839 Linux 6.18-rc1)
Merging drivers-x86-fixes/fixes (34cbd6e07fdd platform/x86: alienware-wmi-w=
max: Add AWCC support to Dell G15 5530)
Merging samsung-krzk-fixes/fixes (0dac0b74c32a MAINTAINERS: Update Krzyszto=
f Kozlowski's email)
Merging pinctrl-samsung-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging devicetree-fixes/dt/linus (c71af4d6d566 of/irq: Fix OF node refcoun=
t in of_msi_get_domain())
Merging dt-krzk-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging scsi-fixes/fixes (d54c676d4fe0 scsi: core: Fix the unit attention c=
ounter implementation)
Merging drm-fixes/drm-fixes (211ddde0823f Linux 6.18-rc2)
Merging drm-intel-fixes/for-linux-next-fixes (789e46fbfca1 drm/i915/panic: =
fix panic structure allocation memory leak)
Merging mmc-fixes/fixes (a28352cf2d2f mmc: sdhci-of-dwcmshc: Change DLL_STR=
BIN_TAPNUM_DEFAULT to 0x4)
Merging rtc-fixes/rtc-fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging gnss-fixes/gnss-linus (3a8660878839 Linux 6.18-rc1)
Merging hyperv-fixes/hyperv-fixes (852bfe55e211 mshv: Fix deposit memory in=
 MSHV_ROOT_HVCALL)
Merging risc-v-fixes/fixes (b7776a802f2f riscv: hwprobe: avoid uninitialize=
d variable use in hwprobe_arch_id())
Merging riscv-dt-fixes/riscv-dt-fixes (5ef13c363640 riscv: dts: microchip: =
remove BeagleV Fire fabric.dtsi)
Merging riscv-soc-fixes/riscv-soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging spdx/spdx-linus (89373f5695dc LICENSES: Add modern form of the LGPL=
-2.1 tags to the usage guide section)
Merging gpio-brgl-fixes/gpio/for-current (4c4e6ea4a120 gpio: ljca: Fix dupl=
icated IRQ mapping)
Merging gpio-intel-fixes/fixes (b1055678a016 gpiolib: acpi: Use %pe when pa=
ssing an error pointer to dev_err())
Merging pinctrl-intel-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging auxdisplay-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging kunit-fixes/kunit-fixes (2551a1eedc09 kunit: test_dev_action: Corre=
ctly cast 'priv' pointer to long*)
Merging memblock-fixes/fixes (b3dcc9d1d806 memblock: fix kernel-doc for MEM=
BLOCK_RSRV_NOINIT)
Merging renesas-fixes/fixes (379c590113ce ARM: shmobile: smp: Enforce shmob=
ile_smp_* alignment)
Merging perf-current/perf-tools (ec714e371f22 Merge tag 'perf-tools-for-v6.=
18-1-2025-10-08' of git://git.kernel.org/pub/scm/linux/kernel/git/perf/perf=
-tools)
Merging efi-fixes/urgent (e5f0a698b34e Linux 6.17)
Merging battery-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging iommufd-fixes/for-rc (b09ed52db1e6 iommufd/selftest: Fix ioctl retu=
rn value in _test_cmd_trigger_vevents())
Merging rust-fixes/rust-fixes (211ddde0823f Linux 6.18-rc2)
Merging w1-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging pmdomain-fixes/fixes (7458f72cc28f pmdomain: arm: scmi: Fix genpd l=
eak on provider registration failure)
Merging i2c-host-fixes/i2c/i2c-host-fixes (c6162da3b21e i2c: fix reference =
leak in MP2 PCI device)
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
Merging tip-fixes/tip/urgent (596b40e5e421 Merge branch into tip/master: 'x=
86/urgent')
Merging slab-fixes/slab/for-next-fixes (7e4b8d4b350a slab: Fix obj_ext is m=
istakenly considered NULL due to race condition)
Merging drm-msm-fixes/msm-fixes (7f9335f2d998 drm/ci: disable broken MR che=
ck in sanity job)
Merging uml-fixes/fixes (df447a3b4a4b um: Fix FD copy size in os_rcv_fd_msg=
())
Merging fwctl-fixes/for-rc (211ddde0823f Linux 6.18-rc2)
Merging devsec-tsm-fixes/fixes (fba4ceaa242d configfs-tsm-report: Fix NULL =
dereference of tsm_ops)
Merging drm-rust-fixes/drm-rust-fixes (211ddde0823f Linux 6.18-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (23437509a694 drm/panic: Fix 24=
bit pixel crossing page boundaries)
Merging mm-stable/mm-stable (3a8660878839 Linux 6.18-rc1)
Merging mm-nonmm-stable/mm-nonmm-stable (3a8660878839 Linux 6.18-rc1)
Merging mm-unstable/mm-unstable (5b5c3e53c939 memcg: manually uninline __me=
mcg_memory_event)
Merging mm-nonmm-unstable/mm-nonmm-unstable (b0165d26ed76 ipc: create_ipc_n=
s: drop mqueue mount on sysctl setup failure)
Merging kbuild/kbuild-next (9b38933a351d jfs: Rename _inline to avoid confl=
ict with clang's '-fms-extensions')
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (a1d8548c2307 perf annotate: Invalidate regist=
er states for untracked instructions)
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
Merging amlogic/for-next (cb718411c4c0 Merge branch 'v6.19/arm64-dt' into f=
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
Merging drivers-memory/for-next (28762988b221 Merge branch 'mem-ctrl-next' =
into for-next)
Merging fsl/soc_fsl (5498f07842cb soc/fsl/qbman: Use for_each_online_cpu() =
instead of for_each_cpu())
Merging imx-mxs/for-next (74536a7d437f Merge branch 'imx/dt64' into for-nex=
t)
Merging mediatek/for-next (de8df7a4c881 Merge branch 'v6.18-next/dts32' int=
o for-next)
Merging mvebu/for-next (86a99e9f5394 Merge branch 'mvebu/fixes' into mvebu/=
for-next)
Merging omap/for-next (462bfcbe8834 Merge branch 'omap-for-v6.18/soc' into =
tmp/omap-next-20250915.162436)
Merging qcom/for-next (68fde90d39c3 Merge branches 'arm64-fixes-for-6.18', =
'arm64-for-6.19', 'clk-for-6.19' and 'drivers-for-6.19' into for-next)
Merging renesas/next (ab7504170dcc Merge branches 'renesas-arm-defconfig-fo=
r-v6.19', 'renesas-drivers-for-v6.19' and 'renesas-dts-for-v6.19' into rene=
sas-next)
Merging reset/reset/next (3a8660878839 Linux 6.18-rc1)
Merging rockchip/for-next (efa76398e1df Merge branch 'v6.19-armsoc/drivers'=
 into for-next)
Merging samsung-krzk/for-next (73f7017e6636 Merge branch 'fixes' into for-n=
ext)
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
Merging sunxi/sunxi/for-next (ea010aa4376b Merge branch 'sunxi/clk-fixes-fo=
r-6.18' into sunxi/for-next)
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
Merging clk-renesas/renesas-clk (7a03ef9f8223 clk: renesas: r9a09g057: Add =
clock and reset entries for RTC)
Merging thead-clk/thead-clk-for-next (3a8660878839 Linux 6.18-rc1)
Merging csky/linux-next (817d21578d51 csky: Remove compile warning for CONF=
IG_SMP)
Merging loongarch/loongarch-next (032676ff8217 LoongArch: Update Loongson-3=
 default config file)
Merging m68k/for-next (695f2c0c25f3 m68k: defconfig: Update defconfigs for =
v6.17-rc1)
Merging m68knommu/for-next (211ddde0823f Linux 6.18-rc2)
Merging microblaze/next (7f7072574127 Merge tag 'kbuild-6.18-1' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/kbuild/linux)
Merging mips/mips-next (3a8660878839 Linux 6.18-rc1)
Merging openrisc/for-next (8c30b0018f9d openrisc: Add jump label support)
Merging parisc-hd/for-next (5fb1d3ce3e74 parisc: entry: set W bit for !comp=
at tasks in syscall_restore_rfi())
Merging powerpc/next (ef104054a312 powerpc/pseries: Define __u{8,32} types =
in papr_hvpipe_hdr struct)
Merging risc-v/for-next (3a8660878839 Linux 6.18-rc1)
Merging riscv-dt/riscv-dt-for-next (fa939a287224 dts: starfive: jh7110-comm=
on: split out mmc0 reset pins from common into boards)
Merging riscv-soc/riscv-soc-for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging s390/for-next (df988862b91d Merge branch 'features' into for-next)
Merging sh/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging sparc/for-next (fe0126702a40 sparc: Replace deprecated strcpy() wit=
h strscpy() in handle_nextprop_quirks())
Merging uml/next (211ddde0823f Linux 6.18-rc2)
Merging xtensa/xtensa-for-next (4c8bad3ed035 xtensa: use HZ_PER_MHZ in plat=
form_calibrate_ccount)
Merging fs-next (55ca7f90c489 Merge branch 'for-next' of https://git.kernel=
.org/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (34578b8589e4 Merge branch 'rework/preempt-legacy-k=
thread' into for-next)
Merging pci/next (0ab6604c6a93 Merge branch 'pci/controller/xilinx-dma')
Merging pstore/for-next/pstore (b69255357368 pstore/ram: Update module para=
meters from platform data)
Merging hid/for-next (828aeac92901 Merge branches 'for-6.18/upstream-fixes'=
, 'for-6.19/intel-ish-v2', 'for-6.19/logitech', 'for-6.19/uclogic' and 'for=
-6.19/winwing' into for-next)
Merging i2c/i2c/for-next (211ddde0823f Linux 6.18-rc2)
Merging i2c-host/i2c/i2c-host (874a45eb7825 i2c: designware: Disable SMBus =
interrupts to prevent storms from mis-configured firmware)
Merging i3c/i3c/next (d6ddd9beb1a5 i3c: fix big-endian FIFO transfers)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (65bc97a5e49e Update maxim-ic.com links to=
 analog.com)
Merging jc_docs/docs-next (0aa760051f4e docs: checkpatch: Drop networking c=
omment style)
Merging v4l-dvb/next (ea299a216426 media: renesas: fdp1: Use %pe format spe=
cifier)
Merging v4l-dvb-next/master (adc218676eef Linux 6.12)
Merging pm/linux-next (ba1f6c4f63c1 Merge branch 'fixes-next' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (85976d3774be cpufreq: tegra186:=
 add OPP support and set bandwidth)
Merging cpupower/cpupower (3a8660878839 Linux 6.18-rc1)
Merging devfreq/devfreq-next (eddb5ba91b28 PM / devfreq: rockchip-dfi: add =
support for LPDDR5)
Merging pmdomain/next (fda2253ceb14 pmdomain: mediatek: Fix build-errors)
Merging opp/opp/linux-next (33ffb0aa8ce8 rust: opp: simplify callers of `to=
_c_str_array`)
Merging thermal/thermal/linux-next (dc67521c20b7 thermal/drivers/renesas/rz=
g3e: Fix add thermal driver for the Renesas RZ/G3E SoC)
Merging rdma/for-next (1511efaca032 RDMA/rxe: Remove redundant assignment t=
o variable page_offset)
Merging net-next/main (2b7553db91f8 Merge git://git.kernel.org/pub/scm/linu=
x/kernel/git/netdev/net)
Merging bpf-next/for-next (65ada09f577a Merge branch 'bpf-next/net' into fo=
r-next)
Merging ipsec-next/master (18a7e218cfcd Merge tag 'net-6.18-rc1' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging mlx5-next/mlx5-next (3a8660878839 Linux 6.18-rc1)
Merging netfilter-next/main (18a7e218cfcd Merge tag 'net-6.18-rc1' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ipvs-next/main (18a7e218cfcd Merge tag 'net-6.18-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging bluetooth/master (8d2c47aeb078 Bluetooth: rfcomm: fix modem control=
 handling)
Merging wireless-next/for-next (55db64ddd6a1 Merge git://git.kernel.org/pub=
/scm/linux/kernel/git/netdev/net)
Merging ath-next/for-next (50cb7ccab817 wifi: ath11k: Correctly use "ab" ma=
cro parameter)
Merging iwlwifi-next/next (a4985dd902c2 wifi: iwlwifi: mld: add null check =
for kzalloc() in iwl_mld_send_proto_offload())
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/fw=
/runtime.h
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (3a8660878839 Linux 6.18-rc1)
Merging nand/nand/next (4e7a83ed8312 dt-bindings: mtd: physmap: add 'clocks=
' and 'power-domains')
Merging spi-nor/spi-nor/next (17926cd770ec mtd: spi-nor: core: avoid odd le=
ngth/address writes in 8D-8D-8D mode)
Merging crypto/master (275a9a3f9b6a KEYS: trusted: Pass argument by pointer=
 in dump_options)
Merging libcrypto/libcrypto-next (123fa1574bcc lib/crypto: Add FIPS self-te=
sts for SHA-1 and SHA-2)
Merging drm/drm-next (6200442de089 Merge tag 'drm-misc-next-2025-10-02' of =
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next)
Merging drm-exynos/for-linux-next (3a8660878839 Linux 6.18-rc1)
Merging drm-misc/for-linux-next (b36ca9759211 drm/sysfb: Use new CRTC state=
 in begin_fb_access)
CONFLICT (content): Merge conflict in drivers/gpu/drm/rockchip/rockchip_drm=
_vop2.c
Merging amdgpu/drm-next (883687c30736 drm/amdgpu: Remove unused members in =
amdgpu_mman)
Merging drm-intel/for-linux-next (68aeace1b15a drm/xe/compat: drop include =
xe_device.h from i915_drv.h)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_fb=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_pci.c
Merging drm-msm/msm-next (b5bad77e1e3c drm/msm/registers: Sync GPU register=
s from mesa)
Merging drm-msm-lumag/msm-next-lumag (a643abb67379 drm/msm/mdp4: remove the=
 use of dev_err_probe())
Merging drm-rust/drm-rust-next (d3917368ebc5 rust: drm/gem: Remove Object.d=
ev)
Merging drm-nova/nova-next (93296e9d9528 gpu: nova-core: vbios: store refer=
ence to Device where relevant)
Merging drm-xe/drm-xe-next (6d5511e56b2d drm/xe/xe3p_xpc: Add MCR steering =
for NODE and L3BANK ranges)
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (3a8660878839 Linux 6.18-rc1)
Merging regmap/for-next (d00c269736b6 Merge branch 'regmap-linus' into regm=
ap-next)
Merging sound/for-next (28bcb2169693 ALSA: dice: add support for TASCAM IF-=
FW/DM MkII)
Merging ieee1394/for-next (b330f98ff238 firewire: core: use cleanup functio=
n to release cached configuration ROM)
Merging sound-asoc/for-next (af07fe2a421a Merge remote-tracking branch 'aso=
c/for-6.19' into asoc-next)
Merging modules/modules-next (5eb4b9a4cdbb params: Replace deprecated strcp=
y() with strscpy() and memcpy())
Merging input/next (e8ec34ed4616 dt-bindings: input: ti,twl4030-keypad: con=
vert to DT schema)
Merging block/for-next (ea6e633aa6ba Merge branch 'io_uring-6.18' into for-=
next)
Merging device-mapper/for-next (c35cf4fe4b85 dm-bufio: align write boundary=
 on bdev_logical_block_size)
Merging libata/for-next (095d495cb897 dt-bindings: ata: snps,dwc-ahci: Allo=
w 'iommus' property)
Merging pcmcia/pcmcia-next (4a81f78caa53 pcmcia: Add error handling for add=
_interval() in do_validate_mem())
Merging mmc/next (c2afdd73e5ba mmc: core: Skip to set the default 200mA SD =
current limit)
Merging mfd/for-mfd-next (5ef9f92003c2 mfd: wl1273-core: Remove the header)
Merging backlight/for-backlight-next (3a8660878839 Linux 6.18-rc1)
Merging battery/for-next (3a8660878839 Linux 6.18-rc1)
Merging regulator/for-next (fdf37c8b588a Merge remote-tracking branch 'regu=
lator/for-6.19' into regulator-next)
Merging security/next (dfa024bc3f67 lsm: add a LSM_STARTED_ALL notification=
 event)
Merging apparmor/apparmor-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging integrity/next-integrity (43369273518f ima: add fs_subtype conditio=
n for distinguishing FUSE instances)
Merging selinux/next (20d387d7ceab selinux: improve bucket distribution uni=
formity of avc_hash())
Merging smack/next (6ddd169d0288 smack: fix kernel-doc warnings for smk_imp=
ort_valid_label())
Merging tomoyo/master (645c9b0cb27e net: update dev_put()/dev_hold() debugg=
ing)
Merging tpmdd/next (dbfdaeb381a4 tpm_crb: Add idle support for the Arm FF-A=
 start method)
Merging watchdog/master (c64c2a50cdd4 watchdog/hpwdt New maintianer)
Merging iommu/next (5f4b8c03f417 Merge branches 'apple/dart', 'ti/omap', 'r=
iscv', 'intel/vt-d' and 'amd/amd-vi' into next)
Merging audit/next (4f7b54e17edd audit: fix comment misindentation in audit=
.h)
Merging devicetree/for-next (b766598b9beb dt-bindings: arm: Add missing LGE=
 SoC platforms)
Merging dt-krzk/for-next (7ee0f223cabe arm64: dts: toshiba: tmpv7708: Add d=
efault GIC address cells)
Merging mailbox/for-next (3f39f5652037 mailbox: mtk-cmdq: Remove pm_runtime=
 APIs from cmdq_mbox_send_data())
Merging spi/for-next (90772418ffb9 Merge remote-tracking branch 'spi/for-6.=
19' into spi-next)
Merging tip/master (db4bce9b769c Merge branch into tip/master: 'x86/sgx')
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
Merging kvms390/next (182a258b5ec4 Documentation: kvm: Fix ordering)
Merging kvm-ppc/topic/ppc-kvm (c17b750b3ad9 Linux 6.17-rc2)
Merging kvm-riscv/riscv_kvm_next (dbdadd943a27 RISC-V: KVM: Upgrade the sup=
ported SBI version to 3.0)
Merging kvm-x86/next (4cc167c50eb1 Merge branches 'generic', 'gmem', 'mmu',=
 'selftests', 'svm' and 'vmx')
CONFLICT (content): Merge conflict in arch/x86/include/asm/cpufeatures.h
Merging xen-tip/linux-next (9d52b0b41be5 xen: take system_transition_mutex =
on suspend)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (8b8cfc05ada8 Merge branch 'for-6.18' into for-=
next)
Merging sched-ext/for-next (e283ac4e0257 Merge branch 'for-6.19' into for-n=
ext)
Merging drivers-x86/for-next (1c72d9c3e0c6 platform/x86:intel/pmc: Remove r=
edundant has_die_c6 variable)
Merging chrome-platform/for-next (e4ee0bb077cd platform/chrome: cros_usbpd_=
notify: defer probe when parent EC driver isn't ready)
Merging chrome-platform-firmware/for-firmware-next (3a8660878839 Linux 6.18=
-rc1)
Merging hsi/for-next (3a8660878839 Linux 6.18-rc1)
Merging leds-lj/for-leds-next (7afd5335d6ff leds: lp55xx_common: Enable use=
 without FW_LOADER_USER_HELPER)
Merging ipmi/for-next (35bcedc1a793 MAINTAINERS: Add entry on Loongson-2K I=
PMI driver)
Merging driver-core/driver-core-next (cebd22dd3a0a platform: Use IOMEM_ERR_=
PTR for ioremap error returns)
Merging usb/usb-next (93741bd104ce usb: uhci: Work around bogus clang shift=
 overflow warning from DMA_BIT_MASK(64))
Merging thunderbolt/next (56bcf64b6131 thunderbolt: Fix typo in tb_eeprom_c=
tl_read documentation)
Merging usb-serial/usb-next (3a8660878839 Linux 6.18-rc1)
Merging tty/tty-next (7553f5173ec3 selftests/tty: add TIOCSTI test suite)
Merging char-misc/char-misc-next (d48fb15e6ad1 uio: uio_fsl_elbc_gpcm:: Add=
 null pointer check to uio_fsl_elbc_gpcm_probe)
CONFLICT (content): Merge conflict in drivers/misc/amd-sbi/Kconfig
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (01f96b812526 coresight: Add label sysfs node suppor=
t)
Merging fastrpc/for-next (3a8660878839 Linux 6.18-rc1)
Merging fpga/for-next (e0650a9b38b8 MAINTAINERS: change maintainer for Inte=
l MAX10 BMC secure updates)
Merging icc/icc-next (bcdf7a064c3c Merge branch 'icc-glymur' into icc-next)
Merging iio/togreg (89cba586b8b4 iio: imu: smi330: Add driver)
Merging phy-next/next (3a8660878839 Linux 6.18-rc1)
Merging soundwire/next (3a8660878839 Linux 6.18-rc1)
Merging extcon/extcon-next (94d885eb8ffe dt-bindings: extcon: linux,extcon-=
usb-gpio: GPIO must be provided)
Merging gnss/gnss-next (3a8660878839 Linux 6.18-rc1)
Merging vfio/next (451bb9632898 vfio: Dump migration features under debugfs)
Merging w1/for-next (f3c6353d801a w1: ds28e17: Replace deprecated strcpy + =
strcat in w1_f19_add_slave)
Merging spmi/spmi-next (0ff41df1cb26 Linux 6.15)
Merging staging/staging-next (ea629075eb59 staging: nvec: remove NVEC_PS2_D=
EBUG and dead debug macro)
Merging counter-next/counter-next (b462fcd08dd5 MAINTAINERS: Update Intel Q=
uadrature Encoder Peripheral maintainer)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (398035178503 i2c: i2c-qcom-geni: Add Block event in=
terrupt support)
Merging cgroup/for-next (adbe49dc7eb3 Merge branch 'for-6.19' into for-next)
Merging scsi/for-next (ffbf9a2eee90 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (5d8afd46c5a2 Merge patch series "Eight small UFS=
 patches")
Merging vhost/linux-next (c6f3b304eb54 virtio_vdpa: fix misleading return i=
n void function)
Merging rpmsg/for-next (255b3cc2801e Merge branches 'rproc-next' and 'rpmsg=
-next' into for-next)
Merging gpio-brgl/gpio/for-next (897396b418d1 gpio: regmap: Bypass cache fo=
r aliased inputs)
Merging gpio-intel/for-next (3a8660878839 Linux 6.18-rc1)
Merging pinctrl/for-next (ca575f89d70b Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (3a8660878839 Linux 6.18-rc1)
Merging pinctrl-renesas/renesas-pinctrl (aa09d5a14770 pinctrl: renesas: rza=
1: Make mux_conf const in rza1_pin_mux_single())
Merging pinctrl-samsung/for-next (3cfc60e09bdc pinctrl: samsung: Add ARTPEC=
-9 SoC specific configuration)
Merging pwm/pwm/for-next (5b5231fafeab pwm: max7360: Clean MAX7360 code)
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
Merging hyperv/hyperv-next (11831782653e x86/hyperv: Enable build of hyperv=
isor crashdump collection files)
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
Merging cxl/next (211ddde0823f Linux 6.18-rc2)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (99da5bf3dd6a efi/x86: Memory protection on EfiGcdMemoryTy=
peMoreReliable)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (ca74b8cadaad Merge series "slab: Re-entrant kma=
lloc_nolock()")
Merging random/master (3778dcb2dcc1 random: use offstack cpumask when neces=
sary)
Merging landlock/next (6dde339a3df8 landlock: Minor comments improvements)
Merging rust/rust-next (3b83f5d5e78a rust: replace `CStr` with `core::ffi::=
CStr`)
CONFLICT (content): Merge conflict in rust/kernel/opp.rs
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
Merging iommufd/for-next (211ddde0823f Linux 6.18-rc2)
Merging turbostat/next (447c98c1ca4a tools/power turbostat: Add idle govern=
or statistics reporting)
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.8
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.c
Merging pwrseq/pwrseq/for-next (3a8660878839 Linux 6.18-rc1)
Merging capabilities-next/caps-next (211ddde0823f Linux 6.18-rc2)
Merging ipe/next (c88788fe31a5 ipe: Drop a duplicated CONFIG_ prefix in the=
 ifdeffery)
Merging kcsan/next (800348aa34b2 kcsan: test: Replace deprecated strcpy() w=
ith strscpy())
Merging crc/crc-next (136d029662cd Documentation/staging: Fix typo and inco=
rrect citation in crc32.rst)
Merging fwctl/for-next (211ddde0823f Linux 6.18-rc2)
Merging devsec-tsm/next (9d948b880409 Merge branch 'for-6.16/tsm-mr' into t=
sm-next)
Merging hisilicon/for-next (6c177775dcc5 Merge branch 'next/drivers' into f=
or-next)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)

--Sig_/KxUk.VoGV7NOXcnZicrl._R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj6+msACgkQAVBC80lX
0GweNQgAgul4AVLxEcpoqHF6yc5UT5BY6eq3BvKeusLyj8dG9MrfW7ANU4NaHOLV
leHjhAxV3jjQo2styQHNuJPRsJRwHMdIq7mTFB2k8iYoNwuTXRT6cSstzZfmxI36
TFj7fc/gHR89JMGLGLRsAnsezP5nXzuRWyltao5AyG/w7FErb6ZGRcjoQGsImgPg
mtAF6acJGcYVW6qpKxGkNRXCASwlORyvGPmY9IIhtGFH6VUyJ/tka9a/UqLOaxV4
uc4xycLor/tPHc+IDObcq/EgK5u8mvEYU0UrCJe2CMRDi8S+3ShDgLjKE96YK176
ibt4bY1NPdZ4T5ZVzERBlbHp3yJlMw==
=egsk
-----END PGP SIGNATURE-----

--Sig_/KxUk.VoGV7NOXcnZicrl._R--

