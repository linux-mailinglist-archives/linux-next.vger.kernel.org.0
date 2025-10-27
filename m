Return-Path: <linux-next+bounces-8713-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6E8C0BC4D
	for <lists+linux-next@lfdr.de>; Mon, 27 Oct 2025 04:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 375534E392D
	for <lists+linux-next@lfdr.de>; Mon, 27 Oct 2025 03:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 199E978F29;
	Mon, 27 Oct 2025 03:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EKO2EqHB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A16F8F40;
	Mon, 27 Oct 2025 03:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761536927; cv=none; b=kaHd/l9rGCr78TU5BhBxFpFnNvs8OYdpDW2eD6yNb7kmbWFO0ytt0nNxsu4GNeeTr0Xchv8p70H+UZJoqwocXh4S8kcXVB5QbGtsfVjyF56uZ4QA5qybY4tMx6DTT8gvPCdU28p+k+2YeidCGi9Padb1VPDfdQKF/LZ+xh9UwNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761536927; c=relaxed/simple;
	bh=zo3sj2ev7kWE9cTXa+tyFgg1CXjqv6BolaNEoQ69L50=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lMjmRIfhEm7izB5D9Hh7QdtqOUihY2vv+173j3luhoaVHH4rjcEUudGGNUV8zgFHwRSBLch66TGFDvruBKiRZCbLabbStULP/Qyvjg6oZ5nXUM8VGslTXQYa1AfrJTjagNKvbH+DLBgHEpewVd1viLHRslo7840YB2ZbQNT3Ax8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EKO2EqHB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761536918;
	bh=9+J6F55bnwHsJo9MQAyK4Pvsc8o4sHKVJRTHrzH3qfQ=;
	h=Date:From:To:Cc:Subject:From;
	b=EKO2EqHBt4cqsCa894jaGAl+DWlfC1ef+7ot1rcoWLZpAsKvBGd9RZX5AiQopPudB
	 qQOhIhG6eUfPlJvc4R8D0b963LBBzmazu9Kr9poJ4n2tEi1vcYi9gB+Ek9vZ3Ro2FB
	 RD3vkeRJ8q0P5LsoTRqjuNH8gqMC3G2znQXuXqGk+CsS4rpci+OLdMpMT6DuDbwOqp
	 8M4MhNdsOZfyhq36+IerHHHpQBe4j5CKyQuOshvs24Ka7mvXYo+9/jigSQ3EFtxjJn
	 OoTydk5gDO4lwcB4uCOzIcNVixtPDae2or+xR3QHJmUSYPJCDhD752798ddz/ByLz2
	 fqy7eIZEFf8Gg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cvzxy2QKkz4wBy;
	Mon, 27 Oct 2025 14:48:38 +1100 (AEDT)
Date: Mon, 27 Oct 2025 14:48:37 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 27
Message-ID: <20251027144837.6976013c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Y1ZRIQrSD/JxLdIbPVPcrU8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Y1ZRIQrSD/JxLdIbPVPcrU8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20251024:

The sound-asoc-fixes tree still had its build failure so I used the
version from next-20251022.

The pwm tree gained a build failure (presumably due to an interaction
with other Rust changes).  I have used the pwm tree from next-20251024
for today.

Non-merge commits (relative to Linus' tree): 3554
 4254 files changed, 148173 insertions(+), 49594 deletions(-)

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
Merging origin/master (4bb1f7e19c4a Merge tag 'char-misc-6.18-rc3' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc)
Merging fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging ext4-fixes/fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging vfs-brauner-fixes/vfs.fixes (7933a585d70e ovl: remove redundant IOC=
B_DIO_CALLER_COMP clearing)
Merging fscrypt-current/for-current (211ddde0823f Linux 6.18-rc2)
Merging fsverity-current/for-current (211ddde0823f Linux 6.18-rc2)
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
Merging fscrypt/for-next (211ddde0823f Linux 6.18-rc2)
Merging btrfs/for-next (7a879b89f3b9 Merge branch 'for-next-next-v6.18-2025=
1022' into for-next-20251022)
Merging ceph/master (d74d6c0e9895 ceph: add bug tracking system info to MAI=
NTAINERS)
Merging cifs/for-next (a33b9b805f7a smb: move SMB1_PROTO_NUMBER to common/c=
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
Merging f2fs/dev (e4384545e220 f2fs: use folio_nr_pages() instead of shift =
operation)
Merging fsverity/for-next (211ddde0823f Linux 6.18-rc2)
Merging fuse/for-next (cb403594701c fuse: move CREATE_TRACE_POINTS to a sep=
arate file)
Merging gfs2/for-next (0e10ddf67e6e gfs2: Withdraw immediately in gfs2_tran=
s_add_meta)
Merging jfs/jfs-next (cafc6679824a jfs: replace hardcoded magic number with=
 DTPAGEMAXSLOT constant)
Merging ksmbd/ksmbd-for-next (34646f177cf0 smb: server: let smb_direct_cm_h=
andler() call ib_drain_qp() after smb_direct_disconnect_rdma_work())
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
Merging v9fs/9p-next (a7ebee82ce9c fs/9p: delete unnnecessary condition)
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
Merging mm-hotfixes/mm-hotfixes-unstable (7d1bfc164fa2 fs/proc: fix uaf in =
proc_readdir_de())
Merging fs-current (23e895b60e8e Merge branch 'nfsd-fixes' of https://git.k=
ernel.org/pub/scm/linux/kernel/git/cel/linux)
Merging kbuild-current/kbuild-fixes (a708c34ffda1 KMSAN: Restore dynamic ch=
eck for '-fsanitize=3Dkernel-memory')
Merging arc-current/for-curr (d7b8f8e20813 Linux 6.16-rc5)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (b98c94eed4a9 arm64: mte: Do not warn if=
 the page is already tagged in copy_highpage())
Merging arm-soc-fixes/arm/fixes (b2a578f3127a soc: officially expand mainta=
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
Merging s390-fixes/fixes (b45873c3f091 s390/pci: Restore IRQ unconditionall=
y for the zPCI device)
Merging net/main (84a905290cb4 net: phy: dp83867: Disable EEE support as no=
t implemented)
Merging bpf/master (8ce93aabbf75 bpf: Conditionally include dynptr copy kfu=
ncs)
Merging ipsec/master (f2bc8231fd43 xfrm: check all hash buckets for leftove=
r states during netns deletion)
Merging netfilter/main (d63f0391d6c7 net: hibmcge: select FIXED_PHY)
Merging ipvs/main (e6cc7ac0d420 Merge branch 'eth-fbnic-fix-xdp_tx-and-xdp-=
vs-qstats')
Merging wireless/for-next (a83155cc4ec5 Merge tag 'wireless-2025-10-23' of =
https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless)
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
Merging regmap-fixes/for-linus (434f7349a1f0 regmap: slimbus: fix bus_conte=
xt pointer in regmap init calls)
Merging regulator-fixes/for-linus (211ddde0823f Linux 6.18-rc2)
Merging spi-fixes/for-linus (1b824134261d spi: dt-bindings: spi-rockchip: A=
dd RK3506 compatible)
Merging pci-current/for-linus (df5192d9bb0e PCI/ASPM: Enable only L0s and L=
1 for devicetree platforms)
Merging driver-core.current/driver-core-linus (2eead1933451 arch_topology: =
Fix incorrect error check in topology_parse_cpu_capacity())
Merging tty.current/tty-linus (d518314a1fa4 serial: 8250_mtk: Enable baud c=
lock and manage in runtime PM)
Merging usb.current/usb-linus (a1b866f20187 Merge tag 'usb-serial-6.18-rc3'=
 of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial int=
o usb-linus)
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
Merging mfd-fixes/for-mfd-fixes (91a3e1f5453a mfd: ls2kbmc: Check for devm_=
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
Merging devicetree-fixes/dt/linus (7209ff310083 of/irq: Export of_msi_xlate=
() for module usage)
Merging dt-krzk-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging scsi-fixes/fixes (c0e37ac6a5d4 scsi: ufs: core: Reduce link startup=
 failure logging)
Merging drm-fixes/drm-fixes (18b1ce0b29c4 Merge tag 'drm-xe-fixes-2025-10-2=
3' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes)
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
Merging tip-fixes/tip/urgent (f4d34a10015c Merge branch into tip/master: 'x=
86/urgent')
Merging slab-fixes/slab/for-next-fixes (7f434e1d9a17 slab: Fix obj_ext mist=
akenly considered NULL due to race condition)
Merging drm-msm-fixes/msm-fixes (00d5f09719aa drm/msm: Ensure vm is created=
 in VM_BIND ioctl)
Merging uml-fixes/fixes (df447a3b4a4b um: Fix FD copy size in os_rcv_fd_msg=
())
Merging fwctl-fixes/for-rc (211ddde0823f Linux 6.18-rc2)
Merging devsec-tsm-fixes/fixes (fba4ceaa242d configfs-tsm-report: Fix NULL =
dereference of tsm_ops)
Merging drm-rust-fixes/drm-rust-fixes (211ddde0823f Linux 6.18-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (14e02ed3876f drm/sysfb: Do not=
 dereference NULL pointer in plane reset)
Merging mm-stable/mm-stable (3a8660878839 Linux 6.18-rc1)
Merging mm-nonmm-stable/mm-nonmm-stable (3a8660878839 Linux 6.18-rc1)
Merging mm-unstable/mm-unstable (a05ea03d28e8 mm, swap: remove redundant ar=
gument for isolating a cluster)
Merging mm-nonmm-unstable/mm-nonmm-unstable (f98fff6f18d8 memblock: Unprese=
rve memory in case of error)
Merging kbuild/kbuild-next (9b38933a351d jfs: Rename _inline to avoid confl=
ict with clang's '-fms-extensions')
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (3e98f0203e10 perf cs-etm: Mute enumeration va=
lue warning)
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
Merging arm-soc/for-next (b8e5a95fb5f5 Merge branch 'arm/fixes' into for-ne=
xt)
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
Merging spacemit/for-next (981339507835 riscv: dts: spacemit: add Ethernet =
and PDMA to OrangePi RV2)
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
Merging s390/for-next (34c88acd802c Merge branch 'features' into for-next)
Merging sh/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging sparc/for-next (fe0126702a40 sparc: Replace deprecated strcpy() wit=
h strscpy() in handle_nextprop_quirks())
Merging uml/next (211ddde0823f Linux 6.18-rc2)
Merging xtensa/xtensa-for-next (4c8bad3ed035 xtensa: use HZ_PER_MHZ in plat=
form_calibrate_ccount)
Merging fs-next (0a41e91b6936 Merge branch 'for-next' of https://git.kernel=
.org/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (06b074dc4d55 Merge branch 'rework/nbcon-in-kdb' in=
to for-next)
Merging pci/next (0ab6604c6a93 Merge branch 'pci/controller/xilinx-dma')
Merging pstore/for-next/pstore (b69255357368 pstore/ram: Update module para=
meters from platform data)
Merging hid/for-next (2450890c60f0 Merge branch 'for-6.19/intel-ish-v2' int=
o for-next)
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
Merging pm/linux-next (0ed8ae1ead02 Merge branch 'fixes-next' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (85976d3774be cpufreq: tegra186:=
 add OPP support and set bandwidth)
Merging cpupower/cpupower (3a8660878839 Linux 6.18-rc1)
Merging devfreq/devfreq-next (eddb5ba91b28 PM / devfreq: rockchip-dfi: add =
support for LPDDR5)
Merging pmdomain/next (1ff1f0db6aec pmdomain: mediatek: Add support for MFl=
exGraphics)
Merging opp/opp/linux-next (33ffb0aa8ce8 rust: opp: simplify callers of `to=
_c_str_array`)
Merging thermal/thermal/linux-next (dc67521c20b7 thermal/drivers/renesas/rz=
g3e: Fix add thermal driver for the Renesas RZ/G3E SoC)
Merging rdma/for-next (1511efaca032 RDMA/rxe: Remove redundant assignment t=
o variable page_offset)
Merging net-next/main (bfe62db5422b Merge branch 'dwmac-support-for-rockchi=
p-rk3506')
Merging bpf-next/for-next (65ada09f577a Merge branch 'bpf-next/net' into fo=
r-next)
Merging ipsec-next/master (18a7e218cfcd Merge tag 'net-6.18-rc1' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging mlx5-next/mlx5-next (eea31f21dce1 {rdma,net}/mlx5: Query vports mac=
 address from device)
Merging netfilter-next/main (18a7e218cfcd Merge tag 'net-6.18-rc1' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ipvs-next/main (18a7e218cfcd Merge tag 'net-6.18-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging bluetooth/master (f63037a3f252 dt-bindings: net: Convert Marvell 88=
97/8997 bindings to DT schema)
Merging wireless-next/for-next (55db64ddd6a1 Merge git://git.kernel.org/pub=
/scm/linux/kernel/git/netdev/net)
Merging ath-next/for-next (197498315de7 wifi: ath12k: Assert base_lock is h=
eld before allocating REO update element)
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
Merging libcrypto/libcrypto-next (e3068492d001 crypto: blake2b - Reimplemen=
t using library API)
Merging drm/drm-next (098456f3141b Merge tag 'drm-misc-next-2025-10-21' of =
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next)
Merging drm-exynos/for-linux-next (3a8660878839 Linux 6.18-rc1)
Merging drm-misc/for-linux-next (9837f9fcb7eb drm/gem-atomic: Reset plane s=
tate to NULL if allocation failed)
Merging amdgpu/drm-next (883687c30736 drm/amdgpu: Remove unused members in =
amdgpu_mman)
Merging drm-intel/for-linux-next (4b274b0b61ab drm/i915/vrr: Check HAS_VRR(=
) first in intel_vrr_is_capable())
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
Merging drm-xe/drm-xe-next (fab36494f26c drm/xe/configfs: Drop MAX_GT_TYPE_=
CHARS constant)
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (3a8660878839 Linux 6.18-rc1)
Merging regmap/for-next (434f7349a1f0 regmap: slimbus: fix bus_context poin=
ter in regmap init calls)
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
Merging block/for-next (47824e8aaa12 Merge branch 'io_uring-6.18' into for-=
next)
Merging device-mapper/for-next (c35cf4fe4b85 dm-bufio: align write boundary=
 on bdev_logical_block_size)
Merging libata/for-next (095d495cb897 dt-bindings: ata: snps,dwc-ahci: Allo=
w 'iommus' property)
Merging pcmcia/pcmcia-next (4a81f78caa53 pcmcia: Add error handling for add=
_interval() in do_validate_mem())
Merging mmc/next (c2afdd73e5ba mmc: core: Skip to set the default 200mA SD =
current limit)
Merging mfd/for-mfd-next (f17f1b16e905 dt-bindings: mfd: dlg,da9063: Allow =
wakeup-source property)
Merging backlight/for-backlight-next (243ce64b2b37 backlight: Do not includ=
e <linux/fb.h> in header file)
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
Merging tomoyo/master (3ede38b649e7 net/can/j1939: add j1939_priv debugging)
Merging tpmdd/next (dbfdaeb381a4 tpm_crb: Add idle support for the Arm FF-A=
 start method)
Merging watchdog/master (c64c2a50cdd4 watchdog/hpwdt New maintianer)
Merging iommu/next (5f4b8c03f417 Merge branches 'apple/dart', 'ti/omap', 'r=
iscv', 'intel/vt-d' and 'amd/amd-vi' into next)
Merging audit/next (4f7b54e17edd audit: fix comment misindentation in audit=
.h)
Merging devicetree/for-next (af0e4e1c3151 docs: dt-bindings: Extend the ord=
ering list with a blank newline before status)
Merging dt-krzk/for-next (7ee0f223cabe arm64: dts: toshiba: tmpv7708: Add d=
efault GIC address cells)
Merging mailbox/for-next (3f39f5652037 mailbox: mtk-cmdq: Remove pm_runtime=
 APIs from cmdq_mbox_send_data())
Merging spi/for-next (3e788adfa0e6 Merge remote-tracking branch 'spi/for-6.=
19' into spi-next)
Merging tip/master (8d309ae354d6 Merge branch into tip/master: 'x86/sgx')
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
Merging kvm-riscv/riscv_kvm_next (8c5fa3764fac RISC-V: KVM: Remove automati=
c I/O mapping for VM_PFNMAP)
Merging kvm-x86/next (4cc167c50eb1 Merge branches 'generic', 'gmem', 'mmu',=
 'selftests', 'svm' and 'vmx')
CONFLICT (content): Merge conflict in arch/x86/include/asm/cpufeatures.h
Merging xen-tip/linux-next (9d52b0b41be5 xen: take system_transition_mutex =
on suspend)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (8b8cfc05ada8 Merge branch 'for-6.18' into for-=
next)
Merging sched-ext/for-next (c569cd62691c Merge branch 'for-6.19' into for-n=
ext)
Merging drivers-x86/for-next (1c72d9c3e0c6 platform/x86:intel/pmc: Remove r=
edundant has_die_c6 variable)
Merging chrome-platform/for-next (e4ee0bb077cd platform/chrome: cros_usbpd_=
notify: defer probe when parent EC driver isn't ready)
Merging chrome-platform-firmware/for-firmware-next (3a8660878839 Linux 6.18=
-rc1)
Merging hsi/for-next (3a8660878839 Linux 6.18-rc1)
Merging leds-lj/for-leds-next (c06a01743911 leds: upboard: Fix module alias)
Merging ipmi/for-next (35bcedc1a793 MAINTAINERS: Add entry on Loongson-2K I=
PMI driver)
Merging driver-core/driver-core-next (26c1a20bf7ce rust: pci: normalise spe=
lling of PCI BAR)
Merging usb/usb-next (be83d83664e9 Merge patch series "usb: typec: ucsi_gli=
nk: Add support UCSI v2")
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
Merging scsi-mkp/for-next (e9ff858c9adf scsi: qla4xxx: Use correct variable=
 in memset for clarity)
Merging vhost/linux-next (c6f3b304eb54 virtio_vdpa: fix misleading return i=
n void function)
Merging rpmsg/for-next (3d4561f1a3ea Merge branches 'rpmsg-next' and 'rproc=
-next' into for-next)
Merging gpio-brgl/gpio/for-next (897396b418d1 gpio: regmap: Bypass cache fo=
r aliased inputs)
Merging gpio-intel/for-next (3a8660878839 Linux 6.18-rc1)
Merging pinctrl/for-next (60f7e5916824 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (3a8660878839 Linux 6.18-rc1)
Merging pinctrl-renesas/renesas-pinctrl (aa09d5a14770 pinctrl: renesas: rza=
1: Make mux_conf const in rza1_pin_mux_single())
Merging pinctrl-samsung/for-next (3cfc60e09bdc pinctrl: samsung: Add ARTPEC=
-9 SoC specific configuration)
Merging pwm/pwm/for-next (04a698c800c2 dt-bindings: pwm: thead: Add T-HEAD =
TH1520 PWM controller)
$ git reset --hard HEAD^
Merging next-20251024 version of pwm
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
Merging sysctl/sysctl-next (18c4e0288470 watchdog: move nmi_watchdog sysctl=
 into .rodata)
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

--Sig_/Y1ZRIQrSD/JxLdIbPVPcrU8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj+65UACgkQAVBC80lX
0Gwq5Qf/XpmqvqPZx5FI8zInrvOBE69jIyZ6Crcxv6/Cs3Hgs9r2gVa7pn0AVp5b
zSAPoeqCYOgP44cMCnj960f5Lhws3Pxs01wlgg2qFnn46sQ5lPbkGOxfT2aXClEG
3lTEW9pxd/7N5wxhqO63oiXwpTZpzFlpPsNJmSP0CzINsvqqMNrNp9g3a1VwyKvA
jwNbhkVq/8THpXmjy5XKdHFfQO1JRLAYZB2StcBoiXTAXRX6Ai/qQZALT4+TQfyM
X8PaOLPeMK75moSptmxc+bc/3E4/xh7uiWjVt8Hpdh1C2tC4swcf2tf0U0WHhz27
QzW0ESSQJWodysxIRGSHyeNtuWc+0A==
=ap6p
-----END PGP SIGNATURE-----

--Sig_/Y1ZRIQrSD/JxLdIbPVPcrU8--

