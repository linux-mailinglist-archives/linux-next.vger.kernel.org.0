Return-Path: <linux-next+bounces-7170-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F02ADE35C
	for <lists+linux-next@lfdr.de>; Wed, 18 Jun 2025 08:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7AFB1635C2
	for <lists+linux-next@lfdr.de>; Wed, 18 Jun 2025 06:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 115FB1E0B86;
	Wed, 18 Jun 2025 06:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZHM6IDAn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832221F4191;
	Wed, 18 Jun 2025 06:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750226645; cv=none; b=mjq9fBSbpEdbsyJYs3Wo3jshXUV9feSWSx7xDz1WUr45XLJkEm7f/Oa27p1uEUtVfXAFhw7KVteyaO2evJrCDPlMNPhrSQjsp0DNOpiuAbPgxOtv46yUwFCoW+W0jpnl38W9GhcUVepG9KcU6K3DaDq5WiA/OFPEdfU9cS/FONo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750226645; c=relaxed/simple;
	bh=1Xi0/0y3OvlkWOBGNOzM99XDhpBkKT/RPqoPGsX9Uqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZA17cQTjXqjmudgq1v+M4uE0Zoz4rm6J/JCAB8t6zs+eVlv5R4JvXXuU66a6o+dWxDXifE1oHEaByu03knkGtz3uFyo/fQgRIio52W2IfRqatv7RzgjAaSi3E5egb1iKnsVvhNQ3wnl0r44uVScfTDf6voCPFylPb5KTw1q8Bmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZHM6IDAn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750226636;
	bh=pr1D2wLTd3l7S9lhgmuf6FewC4vMYV/kCpywCH5JtQs=;
	h=Date:From:To:Cc:Subject:From;
	b=ZHM6IDAn2wMUYtHalLrb3kfwbOTSnV8SLiYUsIcbGG4cVdE3d6s0Im2qC28l5ANvj
	 cdJe4EhBlCojrkeN4dvOWnrCaCmwUZtoemE9+XvjZr9YZVdfJ7A9kUQdFQBhnVTR2u
	 2XR9mm+QJtmJSF0N2yb/uC/iYzk9BdPWaEJ5wjEj5emi4Oaxsg+gLFIM7Oa3QjWmyq
	 W+srm6x+Q2Ivo1FtgkctPzl/HB8Nhv3TFBHoOe8MAgaVs8qH8gtGmiKDs9zXsIDXIX
	 oe9obJX+Hy7zr3K5i6o0Z0WjC7iXOpdvbL0QsQ7B5Bn0kWDG8VPhdtBreQGCdSgTfF
	 vOq6ij2obvsrQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bMY8X29dsz4x5k;
	Wed, 18 Jun 2025 16:03:56 +1000 (AEST)
Date: Wed, 18 Jun 2025 16:03:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 18
Message-ID: <20250618160355.6f2b8c02@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9LzMMKmdLrvfsaYBlZR7v=Z";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9LzMMKmdLrvfsaYBlZR7v=Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250617:

The crc tree gained a conflict against the s390 tree.

Non-merge commits (relative to Linus' tree): 2740
 3463 files changed, 95967 insertions(+), 44276 deletions(-)

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
Merging origin/master (52da431bf03b Merge tag 'libnvdimm-fixes-6.16-rc3' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm)
Merging fixes/fixes (b3c623b9a94f Merge tag 'thermal-6.15-rc1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging ext4-fixes/fixes (4bbf9020becb Linux 6.13-rc4)
Merging vfs-brauner-fixes/vfs.fixes (dd2d6b7f6f51 fs: drop assert in file_s=
eek_cur_needs_f_lock)
Merging fscrypt-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging fsverity-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging btrfs-fixes/next-fixes (336f36773aec Merge branch 'misc-6.16' into =
next-fixes)
Merging vfs-fixes/fixes (12f147ddd6de do_change_type(): refuse to operate o=
n unmounted/not ours mounts)
Merging erofs-fixes/fixes (a2f118a18ce8 erofs: remove unused trace event er=
ofs_destroy_inode)
Merging nfsd-fixes/nfsd-fixes (3f55e4725b3b nfsd: use threads array as-is i=
n netlink interface)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (924577e4f6ca ovl: Fix nested backing fil=
e paths)
Merging bcachefs/for-next (f10bfc2f9f02 bcachefs: add an unlikely() to tran=
s_begin())
Merging fscrypt/for-next (f15a26b2ffbc fscrypt: don't use problematic non-i=
nline crypto accelerators)
Merging btrfs/for-next (e281e86fc99f Merge branch 'for-next-next-v6.16-2025=
0611' into for-next-20250611)
Merging ceph/master (b828b4bf29d1 ceph: fix variable dereferenced before ch=
eck in ceph_umount_begin())
Merging cifs/for-next (1303dcffb81d cifs: Add support for creating reparse =
points over SMB1)
Merging configfs/configfs-next (c6b190822459 MAINTAINERS: add configfs Rust=
 abstractions)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (6f8b4788266c dlm: drop SCTP Kconfig dependency)
Merging erofs/dev (b4a29efc5146 erofs: support DEFLATE decompression by usi=
ng Intel QAT)
Merging exfat/dev (46a557694b46 exfat: do not clear volume dirty flag durin=
g sync)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (a099b09a3342 ext2: Handle fiemap on empty files to p=
revent EINVAL)
Merging ext4/dev (7acd1b315cdc ext4: Add a WARN_ON_ONCE for querying LAST_I=
N_LEAF instead)
Merging f2fs/dev (19272b37aa4f Linux 6.16-rc1)
Merging fsverity/for-next (b59e04b8a1a0 fsverity: explicitly include <linux=
/export.h>)
Merging fuse/for-next (dabb90391028 fuse: increase readdir buffer size)
Merging gfs2/for-next (fe4281644c62 Merge tag 'gfs2-for-6.16-fix' of git://=
git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2)
Merging jfs/jfs-next (5dff41a86377 jfs: fix array-index-out-of-bounds read =
in add_missing_indices)
Merging ksmbd/ksmbd-for-next (4ea0bb8aaedf ksmbd: handle set/get info file =
for streamed file)
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
Merging vfs-brauner/vfs.all (60663782d7bc Merge branch 'vfs-6.17.async.dir'=
 into vfs.all)
Merging vfs/for-next (a509e7cf622b configfs: use DCACHE_DONTCACHE)
Merging mm-hotfixes/mm-hotfixes-unstable (9207523a6161 mm/hugetlb: remove u=
nnecessary holding of hugetlb_lock)
Merging fs-current (2248d7651ddd Merge branch 'nfsd-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/cel/linux)
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
Merging net/main (13c90202ddbb Merge branch 'bnxt_en-bug-fixes')
Merging bpf/master (a766cfbbeb3a bpf: Mark dentry->d_inode as trusted_or_nu=
ll)
Merging ipsec/master (c0f21029f123 xfrm: always initialize offload path)
Merging netfilter/main (fdd9ebccfc32 Merge tag 'for-net-2025-06-05' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth)
Merging ipvs/main (fdd9ebccfc32 Merge tag 'for-net-2025-06-05' of git://git=
.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth)
Merging wireless/for-next (27605c8c0f69 Merge tag 'net-6.16-rc2' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ath/for-current (27605c8c0f69 Merge tag 'net-6.16-rc2' of git://git=
.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging iwlwifi/fixes (f81aa834bfa9 wifi: iwlwifi: mld: Move regulatory dom=
ain initialization)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (19272b37aa4f Linux 6.16-rc1)
Merging sound-current/for-linus (60599e4f8a04 ALSA: hda/realtek: Add quirk =
for Asus GA605K)
Merging sound-asoc-fixes/for-linus (b081d8564e4a ASoC: SOF: imx8: add core =
shutdown operation for imx8/imx8x)
Merging regmap-fixes/for-linus (19272b37aa4f Linux 6.16-rc1)
Merging regulator-fixes/for-linus (8acfb165a492 regulator: fan53555: add en=
able_time support and soft-start times)
Merging spi-fixes/for-linus (d57e92dd6600 spi: tegra210-qspi: Remove cache =
operations)
Merging pci-current/for-linus (907a7a2e5bf4 PCI/PM: Set up runtime PM even =
for devices without PCI PM)
Merging driver-core.current/driver-core-linus (b8b8663ac82a mailmap: add en=
try for Danilo Krummrich)
CONFLICT (content): Merge conflict in rust/helpers/helpers.c
Merging tty.current/tty-linus (e04c78d86a96 Linux 6.16-rc2)
Merging usb.current/usb-linus (e04c78d86a96 Linux 6.16-rc2)
Merging usb-serial-fixes/usb-linus (e04c78d86a96 Linux 6.16-rc2)
Merging phy/fixes (cf0233491b3a phy: use per-PHY lockdep keys)
Merging staging.current/staging-linus (e04c78d86a96 Linux 6.16-rc2)
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
Merging crypto-current/master (ac90aad0e9bf crypto: testmgr - reinstate kco=
nfig control over full self-tests)
Merging libcrypto-fixes/libcrypto-fixes (9d4204a8106f lib/crypto/poly1305: =
Fix arm64's poly1305_blocks_arch())
Merging vfio-fixes/for-linus (c1d9dac0db16 vfio/pci: Align huge faults to o=
rder)
Merging kselftest-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging dmaengine-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (1c1fd374a2fe mtd: spinand: Fix build with gcc =
< 7.5)
Merging mfd-fixes/for-mfd-fixes (68f860426d50 mfd: axp20x: AXP717: Fix miss=
ing IRQ status registers range)
Merging v4l-dvb-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging reset-fixes/reset/fixes (38fec10eb60d Linux 6.14)
Merging mips-fixes/mips-fixes (c44572e0cc13 MIPS: Fix MAX_REG_OFFSET)
Merging at91-fixes/at91-fixes (19272b37aa4f Linux 6.16-rc1)
Merging omap-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging kvm-fixes/master (8046d29dde17 KVM: x86/mmu: Reject direct bits in =
gpa passed to KVM_PRE_FAULT_MEMORY)
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
Merging drivers-x86-fixes/fixes (e2468dc70074 Revert "platform/x86: alienwa=
re-wmi-wmax: Add G-Mode support to Alienware m16 R1")
Merging samsung-krzk-fixes/fixes (8d2c2fa2209e firmware: exynos-acpm: fix t=
imeouts on xfers handling)
Merging pinctrl-samsung-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging devicetree-fixes/dt/linus (f75794b6077e dt-bindings: serial: Conver=
t altr,uart-1.0 to DT schema)
Merging dt-krzk-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging scsi-fixes/fixes (9b71a94b0bc7 scsi: megaraid_sas: Fix invalid node=
 index)
Merging drm-fixes/drm-fixes (e04c78d86a96 Linux 6.16-rc2)
Merging drm-intel-fixes/for-linux-next-fixes (c464ce6af332 drm/i915/dsi: Fi=
x off by one in BXT_MIPI_TRANS_VTOTAL)
Merging mmc-fixes/fixes (539d80575b81 mtk-sd: Fix a pagefault in dma_unmap_=
sg() for not prepared data)
Merging rtc-fixes/rtc-fixes (19272b37aa4f Linux 6.16-rc1)
Merging gnss-fixes/gnss-linus (e04c78d86a96 Linux 6.16-rc2)
Merging hyperv-fixes/hyperv-fixes (14ae3003e73e Drivers: hv: Fix bad ref to=
 hv_synic_eventring_tail when CPU goes offline)
Merging risc-v-fixes/fixes (2aa5801ada29 RISC-V: uaccess: Wrap the get_user=
_8 uaccess macro)
Merging riscv-dt-fixes/riscv-dt-fixes (19272b37aa4f Linux 6.16-rc1)
Merging riscv-soc-fixes/riscv-soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging spdx/spdx-linus (19272b37aa4f Linux 6.16-rc1)
Merging gpio-brgl-fixes/gpio/for-current (0a1db19f66c0 gpio: pca953x: fix w=
rong error probe return value)
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
Merging efi-fixes/urgent (c33453d08a56 efi: Drop preprocessor directives fr=
om zboot.lds)
Merging battery-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging iommufd-fixes/for-rc (19272b37aa4f Linux 6.16-rc1)
Merging rust-fixes/rust-fixes (e04c78d86a96 Linux 6.16-rc2)
Merging w1-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging pmdomain-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging i2c-host-fixes/i2c/i2c-host-fixes (941af7ffcbf5 i2c: k1: check for =
transfer error)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (19272b37aa4f Linux 6.16-rc1)
Merging thead-clk-fixes/thead-clk-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging pwrseq-fixes/pwrseq/for-current (19272b37aa4f Linux 6.16-rc1)
Merging thead-dt-fixes/thead-dt-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging ftrace-fixes/ftrace/fixes (2fa6a01345b5 tracing: Fix memory leak wh=
en reading set_event file)
Merging ring-buffer-fixes/ring-buffer/fixes (e4d4b8670c44 ring-buffer: Use =
flush_kernel_vmap_range() over flush_dcache_folio())
Merging trace-fixes/trace/fixes (8a157d8a00e8 tracing: Do not free "head" o=
n error path of filter_free_subsystem_filters())
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging tip-fixes/tip/urgent (2de76b6612b2 Merge branch into tip/master: 'x=
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
Merging mm-unstable/mm-unstable (66ff9b2a9d55 mm: huge_memory: fix the chec=
k for allowed huge orders in shmem)
Merging mm-nonmm-unstable/mm-nonmm-unstable (9e4ad6649d9a checkpatch: use u=
tf-8 match for spell checking)
Merging kbuild/for-next (e04c78d86a96 Linux 6.16-rc2)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (ae0756933e87 perf thread: Ensure comm_lock he=
ld for comm_list)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (19272b37aa4f Linux 6.16-rc1)
Merging asm-generic/master (582847f97024 Makefile.kcov: apply needed compil=
er option unconditionally in CFLAGS_KCOV)
Merging alpha/alpha-next (1523226edda5 alpha: Use str_yes_no() helper in pc=
i_dac_dma_supported())
Merging arm/for-next (293bb049380e ARM: 9446/1: Disallow kernel mode NEON w=
hen IRQs are disabled)
Merging arm64/for-next/core (19272b37aa4f Linux 6.16-rc1)
Merging arm-perf/for-next/perf (8c138a189f6d perf/arm-cmn: Add CMN S3 ACPI =
binding)
Merging arm-soc/for-next (ffa1d4e41f30 Merge branch 'soc/dt' into for-next)
Merging amlogic/for-next (9eefedf65051 Merge branch 'v6.17/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (5048bc1b96fd Merge branch 'asahi-soc/=
fixes' into asahi-soc/for-next)
Merging aspeed/for-next (34c87a24e268 Merge branches 'aspeed/dt', 'aspeed/f=
ixes', 'aspeed/drivers', 'nuvoton/arm/dt' and 'nuvoton/arm64/dt' into for-n=
ext)
Merging at91/at91-next (05aeace8757f Merge branch 'at91-dt' into at91-next)
Merging broadcom/next (99c305403a13 Merge branch 'maintainers/next' into ne=
xt)
Merging davinci/davinci/for-next (19272b37aa4f Linux 6.16-rc1)
Merging drivers-memory/for-next (a0be20055d41 memory: omap-gpmx: Use dev_fw=
node())
Merging imx-mxs/for-next (1a2ad59da68d arm64: dts: imx8mp: Enable gpu passi=
ve throttling)
Merging mediatek/for-next (6df944d2cf58 Merge branch 'v6.15-next/dts64' int=
o for-next)
Merging mvebu/for-next (89373e7d4125 Merge branch 'mvebu/dt' into mvebu/for=
-next)
Merging omap/for-next (6d658392b3f0 Merge branch 'omap-for-v6.16/drivers' i=
nto tmp/omap-next-20250508.062442)
Merging qcom/for-next (3c5756a77758 Merge branches 'arm32-for-6.17', 'arm64=
-defconfig-fixes-for-6.16', 'arm64-defconfig-for-6.17', 'arm64-fixes-for-6.=
16', 'arm64-for-6.17', 'clk-for-6.17' and 'drivers-for-6.17' into for-next)
Merging renesas/next (09e64eca5666 Merge branches 'renesas-drivers-for-v6.1=
7', 'renesas-dts-for-v6.17' and 'renesas-r9a09g087-dt-binding-defs' into re=
nesas-next)
Merging reset/reset/next (1c64de886b88 dt-bindings: reset: sophgo: Add SG20=
44 bindings.)
Merging rockchip/for-next (44b0c3fa2f3a Merge branch 'v6.17-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (b0f11a0e05a8 Merge branches 'fixes', 'next/c=
lk', 'next/defconfig', 'next/drivers' and 'next/dt64' into for-next)
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
Merging clk/clk-next (19272b37aa4f Linux 6.16-rc1)
Merging clk-imx/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging clk-renesas/renesas-clk (715676d84180 clk: renesas: rzv2h: Fix miss=
ing CLK_SET_RATE_PARENT flag for ddiv clocks)
Merging thead-clk/thead-clk-for-next (50d4b157fa96 clk: thead: Add clock su=
pport for VO subsystem in T-HEAD TH1520 SoC)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (f78fb2576f22 platform/loongarch: laptop: =
Unregister generic_sub_drivers on exit)
Merging m68k/for-next (f440518f379d m68k: defconfig: Update defconfigs for =
v6.15-rc1)
Merging m68knommu/for-next (e04c78d86a96 Linux 6.16-rc2)
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
Merging fs-next (6c39018bfcd7 Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
CONFLICT (content): Merge conflict in include/linux/proc_fs.h
Merging printk/for-next (af056633f0f6 Merge branch 'rework/fixes' into for-=
next)
Merging pci/next (19272b37aa4f Linux 6.16-rc1)
Merging pstore/for-next/pstore (d679c2e1e8d9 pstore/zone: rewrite some comm=
ents for better understanding)
Merging hid/for-next (da04eb7791c4 Merge branch 'for-6.17/multitouch' into =
for-next)
Merging i2c/i2c/for-next (9a816ebeb573 Merge tag 'i2c-host-fixes-6.16-rc2' =
of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/=
for-current)
  903cc7096db2 ("dt-bindings: i2c: nvidia,tegra20-i2c: Specify the required=
 properties")
Merging i2c-host/i2c/i2c-host (e04c78d86a96 Linux 6.16-rc2)
Merging i3c/i3c/next (19272b37aa4f Linux 6.16-rc1)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (a41a9728941f hwmon: emc2305: Set initial =
PWM minimum value during probe based on thermal state)
Merging jc_docs/docs-next (d3f825032091 docs/sched: Make the sched-stats do=
cumentation consistent)
Merging v4l-dvb/next (c3021d6a80ff media: v4l2-jpeg: Remove unused v4l2_jpe=
g_parse_* wrappers)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (e04c78d86a96 Linux 6.16-rc2)
Merging cpufreq-arm/cpufreq/arm/linux-next (c7f005f70d22 rust: cpu: Add Cpu=
Id::current() to retrieve current CPU ID)
Merging cpupower/cpupower (e044b8a9545c cpupower: split unitdir from libdir=
 in Makefile)
Merging devfreq/devfreq-next (a579e91b6fd2 PM / devfreq: rockchip-dfi: doub=
le count on RK3588)
Merging pmdomain/next (19272b37aa4f Linux 6.16-rc1)
Merging opp/opp/linux-next (03eadcbd981b OPP: switch to use kmemdup_array())
Merging thermal/thermal/linux-next (e23cba0ab49a thermal/drivers/airoha: Fi=
x spelling mistake)
Merging rdma/for-next (c81fef22020c RDMA/rxe: Remove redundant page presenc=
e check)
Merging net-next/main (90b4e1cf6de0 net: bcmgenet: update PHY power down)
Merging bpf-next/for-next (cdfa60a1d713 Merge branch 'bpf-next/master' into=
 for-next)
Merging ipsec-next/master (0097c4195b1d net: airoha: Add PPPoE offload supp=
ort)
Merging mlx5-next/mlx5-next (f550694e88b7 net/mlx5: Add IFC bits for PPCNT =
recovery counters group)
Merging netfilter-next/main (3e52667a9c32 Merge branch 'lan78xx-phylink-pre=
p')
Merging ipvs-next/main (3e52667a9c32 Merge branch 'lan78xx-phylink-prep')
Merging bluetooth/master (dc3f099e8d70 Bluetooth: hci_core: Fix use-after-f=
ree in vhci_flush())
Merging wireless-next/for-next (535de528015b Merge git://git.kernel.org/pub=
/scm/linux/kernel/git/netdev/net)
Merging ath-next/for-next (ed73728fd14e Merge tag 'mt76-next-2025-05-21' of=
 https://github.com/nbd168/wireless)
Merging iwlwifi-next/next (445241ba367a wifi: iwlwifi: pcie: fix non-MSIX h=
andshake register)
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (aa702923258f Merge tag 'nand/for-6.16' into mtd/next)
Merging nand/nand/next (3bfb22cecfe6 mtd: rawnand: brcmnand: legacy exec_op=
 implementation)
Merging spi-nor/spi-nor/next (594c8df92b94 mtd: spi-nor: macronix: Add fixu=
ps for MX25L3255E)
Merging crypto/master (1029436218e5 Documentation: qat: update sysfs-driver=
-qat for GEN6 devices)
Merging libcrypto/libcrypto-next (08a1686ce8c1 lib/crypto: explicitly inclu=
de <linux/export.h>)
Merging drm/drm-next (e04c78d86a96 Linux 6.16-rc2)
Merging drm-exynos/for-linux-next (19272b37aa4f Linux 6.16-rc1)
Merging drm-misc/for-linux-next (a72002cb181f drm/amdgpu: Make use of drm_w=
edge_task_info)
CONFLICT (content): Merge conflict in drivers/gpu/drm/vc4/vc4_hdmi.c
Merging amdgpu/drm-next (78d7032b0838 drm/amd/display: Promote DAL to 3.2.3=
36)
Merging drm-intel/for-linux-next (b2f7e30d2e4a drm/i915/dsb: Disable the GO=
SUB interrupt)
Merging drm-msm/msm-next (ee11d953fd23 MAINTAINERS: .mailmap: update Rob Cl=
ark's email address)
Merging drm-msm-lumag/msm-next-lumag (0122be544c10 drm/msm/dpu: Fill in min=
_prefill_lines for SC8180X)
Merging drm-nova/nova-next (19272b37aa4f Linux 6.16-rc1)
Merging drm-xe/drm-xe-next (bcc287203ca7 drm/xe: Opportunistically skip TLB=
 invalidaion on unbind)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_lrc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_svm.c
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (59d1fc7b3e1a fbdev: pm3fb: fix potential divide by =
zero)
Merging regmap/for-next (c8c4694ede7e regmap: kunit: Constify regmap_range_=
cfg array)
Merging sound/for-next (b2904df0a347 ALSA: hda/tas2781: Add compatible for =
hardware id TIAS2781 and TXNW2781)
Merging ieee1394/for-next (aef6bcc0f278 firewire: ohci: use workqueue to ha=
ndle events of AT request/response contexts)
Merging sound-asoc/for-next (4deaf4e05bcb Merge remote-tracking branch 'aso=
c/for-6.17' into asoc-next)
Merging modules/modules-next (a0b018a495a3 module: Remove outdated comment =
about text_size)
Merging input/next (a95ef0199e80 Input: ims-pcu - check record size in ims_=
pcu_flash_firmware())
Merging block/for-next (98d0347fe8fb Merge branch 'for-6.17/io_uring' into =
for-next)
Merging device-mapper/for-next (9f2f6316d753 dm-stripe: small code cleanup)
Merging libata/for-next (a7b3b77fd111 ata: ahci: Disallow LPM for Asus B550=
-F motherboard)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (187715cfd129 mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (3d5341b17ca2 mfd: twl6030-irq: Remove unused twl6=
030_mmc_card_detect*)
Merging backlight/for-backlight-next (19272b37aa4f Linux 6.16-rc1)
Merging battery/for-next (b1d8766052eb power: supply: rt9471: Simplify defi=
nition of some struct linear_range)
Merging regulator/for-next (93bf44173cc3 Merge remote-tracking branch 'regu=
lator/for-6.17' into regulator-next)
Merging security/next (9fc86a85f36c lsm: trivial comment fix)
Merging apparmor/apparmor-next (1fdb22c54a5f apparmor: mitigate parser gene=
rating large xtables)
Merging integrity/next-integrity (aa9bb1b32594 ima: add a knob ima=3D to al=
low disabling IMA in kdump kernel)
Merging selinux/next (8c1898122c3b Automated merge of 'dev' into 'next')
Merging smack/next (4b59f4fd0a36 security/smack/smackfs: small kernel-doc f=
ixes)
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
Merging spi/for-next (cfcfda712276 Merge remote-tracking branch 'spi/for-6.=
17' into spi-next)
Merging tip/master (6895dbecf3db Merge branch into tip/master: 'x86/kconfig=
')
Merging clockevents/timers/drivers/next (d204e391a0d8 clocksource/drivers/r=
enesas-ostm: Unconditionally enable reprobe support)
Merging edac/edac-for-next (635ebe8e90ac Merge ras/edac-urgent into for-nex=
t)
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
Merging kvm-riscv/riscv_kvm_next (7917be170928 RISC-V: KVM: lock the correc=
t mp_state during reset)
Merging kvm-x86/next (19272b37aa4f Linux 6.16-rc1)
Merging xen-tip/linux-next (7f9bbc1140ff xen/arm: call uaccess_ttbr0_enable=
 for dm_op hypercall)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (7b80bd301fa2 Merge branch 'for-6.16-fixes' int=
o for-next)
Merging sched-ext/for-next (fa5f86605533 Merge branch 'for-6.17' into for-n=
ext)
Merging drivers-x86/for-next (73f0f2b52c5e platform/x86: wmi: Fix WMI devic=
e naming issue)
Merging chrome-platform/for-next (8866f4e557eb platform/chrome: cros_ec_typ=
ec: Defer probe on missing EC parent)
Merging chrome-platform-firmware/for-firmware-next (19272b37aa4f Linux 6.16=
-rc1)
Merging hsi/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging leds-lj/for-leds-next (3bc1740d3157 MAINTAINERS: Adjust file entry =
in TPS6131X FLASH LED DRIVER)
Merging ipmi/for-next (8ffcb7560b4a ipmi: Fix strcpy source and destination=
 the same)
Merging driver-core/driver-core-next (2a1ea59de83b samples: rust: platform:=
 Add property read examples)
Merging usb/usb-next (e04c78d86a96 Linux 6.16-rc2)
Merging thunderbolt/next (e04c78d86a96 Linux 6.16-rc2)
Merging usb-serial/usb-next (e04c78d86a96 Linux 6.16-rc2)
Merging tty/tty-next (e04c78d86a96 Linux 6.16-rc2)
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
Merging staging/staging-next (e04c78d86a96 Linux 6.16-rc2)
Merging counter-next/counter-next (19272b37aa4f Linux 6.16-rc1)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (de266931dd99 dmaengine: apple-admac: Drop default A=
RCH_APPLE in Kconfig)
Merging cgroup/for-next (45c506ba008c Merge branch 'for-6.17' into for-next)
Merging scsi/for-next (5c3ba81923e0 scsi: error: alua: I/O errors for ALUA =
state transitions)
Merging scsi-mkp/for-next (76549adb4260 scsi: Don't use %pK through printk(=
))
Merging vhost/linux-next (f248703d67a5 media: add virtio-media driver)
Merging rpmsg/for-next (d293da1e4dbe Merge branches 'rpmsg-next' and 'rproc=
-next' into for-next)
Merging gpio-brgl/gpio/for-next (f3763403a6bb gpio: palmas: use new GPIO li=
ne value setter callbacks)
Merging gpio-intel/for-next (9ab29ed50555 gpiolib: acpi: Add a quirk for Ac=
er Nitro V15)
Merging pinctrl/for-next (b26c4958439c Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (3b4408038da9 pinctrl: intel: fix build warn=
ings about export.h)
Merging pinctrl-renesas/renesas-pinctrl (d2fb02624020 pinctrl: renesas: rza=
2: Use new GPIO line value setter callbacks)
Merging pinctrl-samsung/for-next (19272b37aa4f Linux 6.16-rc1)
Merging pwm/pwm/for-next (4467d30d0d56 dt-bindings: pwm: convert lpc1850-sc=
t-pwm.txt to yaml format)
Merging ktest/for-next (19272b37aa4f Linux 6.16-rc1)
Merging kselftest/next (da9ba4132057 selftests: ipc: Replace fail print sta=
tements with ksft_test_result_fail)
Merging kunit/test (19272b37aa4f Linux 6.16-rc1)
Merging kunit-next/kunit (76ee96d3d7f1 Documentation: kunit: Correct MODULE=
_IMPORT_NS() syntax)
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
Merging slab/slab/for-next (5660ee54e798 mm, slab: use frozen pages for lar=
ge kmalloc)
Merging random/master (3778dcb2dcc1 random: use offstack cpumask when neces=
sary)
Merging landlock/next (8429d267825d landlock: Fix warning from KUnit tests)
Merging rust/rust-next (e04c78d86a96 Linux 6.16-rc2)
Merging rust-alloc/alloc-next (47d8101924b5 rust: vec: impl Default for Vec=
 with any allocator)
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
Merging bitmap/bitmap-for-next (11fcf368506d uapi: bitops: use UAPI-safe va=
riant of BITS_PER_LONG again)
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (c50b612bef51 ubsan: Fix incorrect hand-side use=
d in handle)
Merging nolibc/for-next (b2c765778a2e selftests/nolibc: make stackprotector=
 probing more robust)
Merging iommufd/for-next (19272b37aa4f Linux 6.16-rc1)
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
Merging crc/crc-next (ee925097a5a7 lib/crc: explicitly include <linux/expor=
t.h>)
CONFLICT (content): Merge conflict in lib/crc/s390/crc32.h
Merging fwctl/for-next (19272b37aa4f Linux 6.16-rc1)
Merging devsec-tsm/next (9d948b880409 Merge branch 'for-6.16/tsm-mr' into t=
sm-next)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)

--Sig_/9LzMMKmdLrvfsaYBlZR7v=Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhSVssACgkQAVBC80lX
0GxMsQgApAWihhRL8c6xWGL5cGEHMFZ7YbqrLAmJMPTnqfS51uAPqRLTPlaVjcBJ
UnZvQDq16zCU+e8fi8Zfb2/JAlgKyFVPHMf6qXFQLdwIDqrNe6EknGUrdOaZdaiE
eqKX6OIydF+JT86bidzefsGuCPpa7zwgPz1lX8gWVZhorMX67WVokrcAY4vP/5UT
Fm687K3btU6HdxQ/sCn5pM6RFTmYLG1SLm/MuaRiGAPug0VGROKgR7ucSYkkm5Na
E3+Im71wOQtJKkKbmpCkRKiYWe5PnUdTGTw0+rIjbhtRb6SS9aoDMm7VeJ/GgAk0
xqtCtAfeF12gTHBwUz5nZ2v+3n4xQA==
=D1dY
-----END PGP SIGNATURE-----

--Sig_/9LzMMKmdLrvfsaYBlZR7v=Z--

