Return-Path: <linux-next+bounces-7267-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E93D8AEB1C3
	for <lists+linux-next@lfdr.de>; Fri, 27 Jun 2025 10:56:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6914218857D9
	for <lists+linux-next@lfdr.de>; Fri, 27 Jun 2025 08:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21CD2737F1;
	Fri, 27 Jun 2025 08:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kBwRiNEf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B23126B2A9;
	Fri, 27 Jun 2025 08:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751014574; cv=none; b=Lu8p7Vij5RAr+BjhFRnq07EFFb+fYqllFYdVI4zv1nHvxqAQiYggXLZ4aKpYBRolHTsvR6sfodVr1f/QnnSm6wu4lD28zkZ7cWLAZggKLq/GktuqpUCxQ2o/Jbhr9vEvfEbrdMUlkNEJ1SCnYzPIv5CDC830pW6BU+agpVTQPfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751014574; c=relaxed/simple;
	bh=zqdAfhHDV/cUMw6gGRs+7U7YadyQ83FR7z6k4SevJ6U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sE7M6K/RrjtP1abpMa4ZtWKq1Rs4ZWWeHxh29JdP02YZZAGyrtH14iWyDUg5Mk82GXwSAl5BdKyIftGOL3WvR7CmCm8wwyKhIq2hEGMVzIIbCy6Tdcxr5vNjsvV8bSzM7aIeLvGEzwo6uuJsYBOZ4evbXor7BluAajWuYtyOQSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kBwRiNEf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751014564;
	bh=x3RLM5GEhHidoW6PzU87DNfL0EHWcekKgOZshBedtzI=;
	h=Date:From:To:Cc:Subject:From;
	b=kBwRiNEfP1BdR9Q4aaB7To0JmYP06PJA0nZjd8qLLtkHfpM9ALybM2i3RQZfWrqS2
	 EFtPpJxt+Wo6nkOq5yG+Sak+/3lyabs7sjxTVgxKeceUZf7vTx/Zn0es0q9Ubs9owf
	 jO5mcclXlqu6fmBE/N2cxFW28pqLefBFMrVGWRWCkPeRjTYYHk2NRcWtETR6VonEcG
	 T5Ocz9FFlVoz5FSCPWOtBn6YZiQZs61AzhWF0Qp0gKSl+wMus60CARKqcqdoyJUbrJ
	 3bD/QQFpN0jH0mowDkfhoCNJiZJw5Q9l6h7ON8K/smUETLC+EQWr42JWaALLUHQUlR
	 ATvZ4HtV+NWkw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bT8Y037Nqz4wy6;
	Fri, 27 Jun 2025 18:56:04 +1000 (AEST)
Date: Fri, 27 Jun 2025 18:56:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 27
Message-ID: <20250627185604.706a7939@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uY9h.yIUQT_wUjpaC3VQlZC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/uY9h.yIUQT_wUjpaC3VQlZC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

News: there will probably be no linux-next release on Monday.

Changes since 20250626:

The bpf-next tree gained a conflict against the vfs-brauner tree.

The drm tree gained a conflict against the drm-fixes tree.

The crc tree gained a conflict against the loongarch tree.

Non-merge commits (relative to Linus' tree): 5140
 6126 files changed, 174745 insertions(+), 125020 deletions(-)

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
Merging origin/master (f02769e7f272 Merge tag 'devicetree-fixes-for-6.16-1'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux)
Merging fixes/fixes (b3c623b9a94f Merge tag 'thermal-6.15-rc1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging ext4-fixes/fixes (4bbf9020becb Linux 6.13-rc4)
Merging vfs-brauner-fixes/vfs.fixes (dbee298cb7bb fuse: fix fuse_fill_write=
_pages() upper bound calculation)
Merging fscrypt-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging fsverity-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging btrfs-fixes/next-fixes (3390d3138849 Merge branch 'misc-6.16' into =
next-fixes)
Merging vfs-fixes/fixes (c5c2a8b497d6 Merge tag 'pull-fixes' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging erofs-fixes/fixes (86731a2a651e Linux 6.16-rc3)
Merging nfsd-fixes/nfsd-fixes (94d10a4dba0b sunrpc: handle SVC_GARBAGE duri=
ng svc auth processing as auth error)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (924577e4f6ca ovl: Fix nested backing fil=
e paths)
Merging bcachefs/for-next (6f1ea326c31d bcachefs: Shut up clang warning)
Merging fscrypt/for-next (01a0817f9ad9 fscrypt: Drop obsolete recommendatio=
n to enable optimized SHA-512)
Merging btrfs/for-next (3277dd63e9fa Merge branch 'for-next-next-v6.16-2025=
0625' into for-next-20250625)
Merging ceph/master (b828b4bf29d1 ceph: fix variable dereferenced before ch=
eck in ceph_umount_begin())
Merging cifs/for-next (263debecb4aa cifs: Fix reading into an ITER_FOLIOQ f=
rom the smbdirect code)
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
Merging f2fs/dev (39868685c2a9 f2fs: compress: fix UAF of f2fs_inode_info i=
n f2fs_free_dic)
Merging fsverity/for-next (9f92eeef95f5 fsverity: Explicitly include <linux=
/export.h>)
Merging fuse/for-next (dabb90391028 fuse: increase readdir buffer size)
Merging gfs2/for-next (fe4281644c62 Merge tag 'gfs2-for-6.16-fix' of git://=
git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2)
Merging jfs/jfs-next (5dff41a86377 jfs: fix array-index-out-of-bounds read =
in add_missing_indices)
Merging ksmbd/ksmbd-for-next (86731a2a651e Linux 6.16-rc3)
Merging nfs/linux-next (86731a2a651e Linux 6.16-rc3)
Merging nfs-anna/linux-next (c01776287414 NFSv4/pNFS: Fix a race to wake on=
 NFS_LAYOUT_DRAIN)
Merging nfsd/nfsd-next (2e7381adb959 NFSD: Remove the cap on number of oper=
ations per NFSv4 COMPOUND)
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
Merging xfs/for-next (db44d088a5ab xfs: actually use the xfs_growfs_check_r=
tgeom tracepoint)
Merging zonefs/for-next (6982100bb829 zonefs: use ZONEFS_SUPER_SIZE instead=
 of PAGE_SIZE)
Merging vfs-brauner/vfs.all (713f896d3a33 Merge branch 'vfs-6.17.rust' into=
 vfs.all)
Merging vfs/for-next (c84eaa2926b2 Merge branch 'headers.param' into for-ne=
xt)
Merging mm-hotfixes/mm-hotfixes-unstable (2cfe5968faf5 fix-do_pages_stat-to=
-use-compat_uptr_t-fix)
Merging fs-current (36d4f6b6e077 Merge branch 'next-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/kdave/linux.git)
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
Merging net/main (e34a79b96ab9 Merge tag 'net-6.16-rc4' of git://git.kernel=
.org/pub/scm/linux/kernel/git/netdev/net)
Merging bpf/master (e34a79b96ab9 Merge tag 'net-6.16-rc4' of git://git.kern=
el.org/pub/scm/linux/kernel/git/netdev/net)
Merging ipsec/master (c0f21029f123 xfrm: always initialize offload path)
Merging netfilter/main (d0fa59897e04 tcp: fix tcp_packet_delayed() for tcp_=
is_non_sack_preventing_reopen() behavior)
Merging ipvs/main (d0fa59897e04 tcp: fix tcp_packet_delayed() for tcp_is_no=
n_sack_preventing_reopen() behavior)
Merging wireless/for-next (e34a79b96ab9 Merge tag 'net-6.16-rc4' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ath/for-current (e34a79b96ab9 Merge tag 'net-6.16-rc4' of git://git=
.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging iwlwifi/fixes (93598167dcb6 wifi: iwlwifi: mvm: assume '1' as the d=
efault mac_config_cmd version)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (a9a9e68954f2 RDMA/mlx5: Fix vport loopback for M=
PV device)
Merging sound-current/for-linus (7ab6847a0322 ALSA: hda/realtek: Fix built-=
in mic on ASUS VivoBook X507UAR)
Merging sound-asoc-fixes/for-linus (6c038b58a2dc ASoC: SOF: Intel: hda: Use=
 devm_kstrdup() to avoid memleak.)
Merging regmap-fixes/for-linus (19272b37aa4f Linux 6.16-rc1)
Merging regulator-fixes/for-linus (86731a2a651e Linux 6.16-rc3)
Merging spi-fixes/for-linus (b07f349d1864 spi: spi-cadence-quadspi: Fix pm =
runtime unbalance)
Merging pci-current/for-linus (db2d2acb897d PCI: host-generic: Set driver_d=
ata before calling gen_pci_init())
Merging driver-core.current/driver-core-linus (86731a2a651e Linux 6.16-rc3)
Merging tty.current/tty-linus (09812134071b dt-bindings: serial: 8250: Make=
 clocks and clock-frequency exclusive)
Merging usb.current/usb-linus (a49e1e2e785f usb: hub: Fix flushing and sche=
duling of delayed work that tunes runtime pm)
Merging usb-serial-fixes/usb-linus (08f49cdb71f3 USB: serial: option: add F=
oxconn T99W640)
Merging phy/fixes (cf0233491b3a phy: use per-PHY lockdep keys)
Merging staging.current/staging-linus (a55bc4ffc06d staging: rtl8723bs: Avo=
id memset() in aes_cipher() and aes_decipher())
Merging iio-fixes/fixes-togreg (a3245ebdfac8 Merge tag 'iio-fixes-for-6.15b=
' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/jic23/iio into char=
-misc-next)
Merging counter-current/counter-current (19272b37aa4f Linux 6.16-rc1)
Merging char-misc.current/char-misc-linus (86731a2a651e Linux 6.16-rc3)
Merging soundwire-fixes/fixes (a628e69b6412 soundwire: amd: fix for clearin=
g command status register)
Merging thunderbolt-fixes/fixes (2cdde91c14ec thunderbolt: Fix bit masking =
in tb_dp_port_set_hops())
Merging input-current/for-linus (f4b048a6a34a Input: apple_z2 - drop defaul=
t ARCH_APPLE in Kconfig)
Merging crypto-current/master (ccafe2821cfa crypto: qat - Use crypto_shash_=
export_core)
Merging libcrypto-fixes/libcrypto-fixes (64f7548aad63 lib/crypto: sha256: M=
ark sha256_choose_blocks as __always_inline)
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
Merging reset-fixes/reset/fixes (38fec10eb60d Linux 6.14)
Merging mips-fixes/mips-fixes (86731a2a651e Linux 6.16-rc3)
Merging at91-fixes/at91-fixes (19272b37aa4f Linux 6.16-rc1)
Merging omap-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging kvm-fixes/master (28224ef02b56 KVM: TDX: Report supported optional =
TDVMCALLs in TDX capabilities)
Merging kvms390-fixes/master (d8dfda5af0be KVM: s390: pv: fix race when mak=
ing a page secure)
Merging hwmon-fixes/hwmon (c25892b7a174 hwmon: (ltc4282) avoid repeated reg=
ister write)
Merging nvdimm-fixes/libnvdimm-fixes (62a65b32bddb dt-bindings: pmem: Conve=
rt binding to YAML)
Merging cxl-fixes/fixes (0a46f60a9fe1 cxl/edac: Fix using wrong repair type=
 to check dram event record)
Merging dma-mapping-fixes/dma-mapping-fixes (aa807b9f22df dma-contiguous: h=
ornor the cma address limit setup by user)
Merging drivers-x86-fixes/fixes (173bbec6693f platform/mellanox: mlxbf-pmc:=
 Fix duplicate event ID for CACHE_DATA1)
Merging samsung-krzk-fixes/fixes (8d2c2fa2209e firmware: exynos-acpm: fix t=
imeouts on xfers handling)
Merging pinctrl-samsung-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging devicetree-fixes/dt/linus (f75794b6077e dt-bindings: serial: Conver=
t altr,uart-1.0 to DT schema)
Merging dt-krzk-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging scsi-fixes/fixes (021f243627ea scsi: ufs: core: Fix spelling of a s=
ysfs attribute name)
Merging drm-fixes/drm-fixes (6daaa479ac55 Merge tag 'drm-xe-fixes-2025-06-2=
6' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (d02b2103a08b drm/i915: fix bu=
ild error some more)
Merging mmc-fixes/fixes (ec54c0a20709 mtk-sd: reset host->mrq on prepare_da=
ta() error)
Merging rtc-fixes/rtc-fixes (00a39d8652ff rtc: cmos: use spin_lock_irqsave =
in cmos_interrupt)
Merging gnss-fixes/gnss-linus (86731a2a651e Linux 6.16-rc3)
Merging hyperv-fixes/hyperv-fixes (14ae3003e73e Drivers: hv: Fix bad ref to=
 hv_synic_eventring_tail when CPU goes offline)
Merging risc-v-fixes/fixes (c5136add3f9b riscv: export boot_cpu_hartid)
CONFLICT (content): Merge conflict in .mailmap
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
Merging perf-current/perf-tools (86731a2a651e Linux 6.16-rc3)
Merging efi-fixes/urgent (f8b53cc9174c efi: Fix .data section size calculat=
ions when .sbat is present)
Merging battery-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging iommufd-fixes/for-rc (9a96876e3c65 iommufd/selftest: Fix build warn=
ings due to uninitialized mfd)
Merging rust-fixes/rust-fixes (86731a2a651e Linux 6.16-rc3)
Merging w1-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging pmdomain-fixes/fixes (e04c78d86a96 Linux 6.16-rc2)
Merging i2c-host-fixes/i2c/i2c-host-fixes (666c23af755d i2c: omap: Fix an e=
rror handling path in omap_i2c_probe())
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
Merging tip-fixes/tip/urgent (7ed1f13ed278 Merge branch into tip/master: 'x=
86/urgent')
Merging slab-fixes/slab/for-next-fixes (be8250786ca9 mm, slab: clean up sla=
b->obj_exts always)
Merging drm-msm-fixes/msm-fixes (d3deabe4c619 drm/msm: Fix inverted WARN_ON=
() logic)
Merging uml-fixes/fixes (2dca89df0d11 Merge tag 'uml-for-6.16-rc4' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/uml/linux)
Merging fwctl-fixes/for-rc (19272b37aa4f Linux 6.16-rc1)
Merging devsec-tsm-fixes/fixes (fba4ceaa242d configfs-tsm-report: Fix NULL =
dereference of tsm_ops)
Merging drm-misc-fixes/for-linux-next-fixes (55e8ff842051 drm/bridge: ti-sn=
65dsi86: Add HPD for DisplayPort connector type)
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (78f4e737a53e Merge tag 'for-6.16/dm-fixes' of =
git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging mm-nonmm-stable/mm-nonmm-stable (78f4e737a53e Merge tag 'for-6.16/d=
m-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/lin=
ux-dm)
Merging mm-unstable/mm-unstable (21a8609be6d3 mm-unexport-globally-copy_to_=
kernel_nofault-v2)
Merging mm-nonmm-unstable/mm-nonmm-unstable (667d00675083 mailmap: update S=
achin Mokashi's email address)
Merging kbuild/for-next (f4363dfc900a kheaders: double-quote variables to s=
atisfy shellcheck)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (f6109fb6f5d7 perf trace: Split BPF skel code =
to util/bpf_trace_augment.c)
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
Merging at91/at91-next (58716b888afd Merge branch 'at91-dt' into at91-next)
Merging broadcom/next (ba7b0678bc0e Merge branch 'drivers/next' into next)
Merging davinci/davinci/for-next (19272b37aa4f Linux 6.16-rc1)
Merging drivers-memory/for-next (a0be20055d41 memory: omap-gpmx: Use dev_fw=
node())
Merging imx-mxs/for-next (d10fed8a5839 Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (96130fd85e17 Merge branch 'v6.16-next/soc' into =
for-next)
Merging mvebu/for-next (89373e7d4125 Merge branch 'mvebu/dt' into mvebu/for=
-next)
Merging omap/for-next (8eb22dcfe50e Revert "ARM: dts: Update pcie ranges fo=
r dra7")
Merging qcom/for-next (0672fe83ed07 Merge branches 'arm32-for-6.17', 'arm64=
-defconfig-fixes-for-6.16', 'arm64-defconfig-for-6.17', 'arm64-fixes-for-6.=
16', 'arm64-for-6.17', 'clk-for-6.17' and 'drivers-for-6.17' into for-next)
Merging renesas/next (ac22a6392868 Merge branch 'renesas-dts-for-v6.17' int=
o renesas-next)
Merging reset/reset/next (1c64de886b88 dt-bindings: reset: sophgo: Add SG20=
44 bindings.)
Merging rockchip/for-next (4263d5b89173 Merge branch 'v6.17-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (77afca2afb2e Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (d5c7554fd753 Merge branches 'for-next/scmi/fix=
es' and 'for-next/smccc/updates', tag 'ffa-fixes-6.16' of ssh://gitolite.ke=
rnel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-linux-next)
Merging sophgo/for-next (1793a187e202 arm64: defconfig: Enable rudimentary =
Sophgo SG2000 support)
Merging sophgo-soc/soc-for-next (c8754c7deab4 soc: sophgo: cv1800: rtcsys: =
New driver (handling RTC only))
Merging spacemit/for-next (37df56ac5002 riscv: dts: spacemit: enable eMMC f=
or K1 SoC)
Merging stm32/stm32-next (dc392342b7bb ARM: dts: stm32: Add nvmem-cells to =
ethernet nodes for constant mac-addresses)
Merging sunxi/sunxi/for-next (61c92fdb6036 Merge branch 'sunxi/clk-for-6.17=
' into sunxi/for-next)
Merging tee/next (c580875fc93a Merge branch 'optee_fix_for_6.16' into next)
Merging tegra/for-next (5e98350146c3 Merge branch for-6.16/arm64/dt into fo=
r-next)
Merging thead-dt/thead-dt-for-next (a4c95b924d51 riscv: dts: thead: Add dev=
ice tree VO clock controller)
Merging ti/ti-next (f984516d7ec6 Merge branch 'ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (487e52a21734 firmware: xilinx: Add debugfs support=
 for PM_GET_NODE_STATUS)
Merging clk/clk-next (b721267f02a1 Merge branch 'clk-fixes' into clk-next)
Merging clk-imx/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging clk-renesas/renesas-clk (b7c26cbd5b70 clk: renesas: rzv2h: Add miss=
ing include file)
Merging thead-clk/thead-clk-for-next (50d4b157fa96 clk: thead: Add clock su=
pport for VO subsystem in T-HEAD TH1520 SoC)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (ef59259df695 LoongArch: KVM: Disable upda=
ting of "num_cpu" and "feature")
Merging m68k/for-next (f440518f379d m68k: defconfig: Update defconfigs for =
v6.15-rc1)
Merging m68knommu/for-next (86731a2a651e Linux 6.16-rc3)
Merging microblaze/next (c0e7bb02f796 microblaze: Replace __ASSEMBLY__ with=
 __ASSEMBLER__ in non-uapi headers)
Merging mips/mips-next (86731a2a651e Linux 6.16-rc3)
Merging openrisc/for-next (f0eedcf22581 openrisc: Replace __ASSEMBLY__ with=
 __ASSEMBLER__ in non-uapi headers)
Merging parisc-hd/for-next (19272b37aa4f Linux 6.16-rc1)
Merging powerpc/next (86731a2a651e Linux 6.16-rc3)
Merging risc-v/for-next (fda589c28604 Merge patch series "Move duplicated i=
nstructions macros into asm/insn.h")
Merging riscv-dt/riscv-dt-for-next (19272b37aa4f Linux 6.16-rc1)
Merging riscv-soc/riscv-soc-for-next (9aec69887386 riscv: defconfig: enable=
 Andes SoC)
Merging s390/for-next (fbb26e1b6c21 Merge branch 'fixes' into for-next)
Merging sh/for-next (19272b37aa4f Linux 6.16-rc1)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (86731a2a651e Linux 6.16-rc3)
Merging xtensa/xtensa-for-next (44a4ef59d550 xtensa: Replace __ASSEMBLY__ w=
ith __ASSEMBLER__ in non-uapi headers)
Merging fs-next (8b4ce00c1ab7 Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
CONFLICT (content): Merge conflict in include/linux/proc_fs.h
Merging printk/for-next (3f5857e726d8 Merge branch 'rework/ringbuffer-kunit=
-test' into for-next)
Merging pci/next (078ffdc22b98 Merge branch 'pci/misc')
Merging pstore/for-next/pstore (d679c2e1e8d9 pstore/zone: rewrite some comm=
ents for better understanding)
Merging hid/for-next (6e519c3e85d4 Merge branch 'for-6.17/core' into for-ne=
xt)
Merging i2c/i2c/for-next (a6c23dac756b i2c: k1: check for transfer error)
Merging i2c-host/i2c/i2c-host (5c46351a1cee i2c: imx: use guard to take spi=
nlock)
Merging i3c/i3c/next (19272b37aa4f Linux 6.16-rc1)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (a41a9728941f hwmon: emc2305: Set initial =
PWM minimum value during probe based on thermal state)
Merging jc_docs/docs-next (bb39dd09fe68 doc: Remove misleading reference to=
 brd in dax.rst)
Merging v4l-dvb/next (c0b1da281d84 media: rc: ir-spi: avoid overflow in mul=
tiplication)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (3cd1e195f0cf Merge branch 'fixes' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (b1b41bc072ba cpufreq: armada-8k=
: make both cpu masks static)
Merging cpupower/cpupower (14a3318b4ac8 pm: cpupower: Fix printing of CORE,=
 CPU fields in cpupower-monitor)
Merging devfreq/devfreq-next (a579e91b6fd2 PM / devfreq: rockchip-dfi: doub=
le count on RK3588)
Merging pmdomain/next (da3d0b772f6f pmdomain: thead: Instantiate GPU power =
sequencer via auxiliary bus)
Merging opp/opp/linux-next (22679d807dea rust: opp: use c_* types via kerne=
l prelude)
Merging thermal/thermal/linux-next (e23cba0ab49a thermal/drivers/airoha: Fi=
x spelling mistake)
Merging rdma/for-next (19564a8576ac RDMA/rxe: Fix a couple IS_ERR() vs NULL=
 bugs)
Merging net-next/main (1ea2e106130a Merge branch 'ptp-belated-spring-cleani=
ng-of-the-chardev-driver')
CONFLICT (content): Merge conflict in net/core/net_namespace.c
Merging bpf-next/for-next (dc589f988844 Merge branch 'bpf-next/master' into=
 for-next)
CONFLICT (content): Merge conflict in kernel/bpf/helpers.c
Merging ipsec-next/master (b05d42eefac7 xfrm: hold device only for the asyn=
chronous decryption)
Merging mlx5-next/mlx5-next (1f6da56679d3 net/mlx5: Add IFC bits for PCIe C=
ongestion Event object)
Merging netfilter-next/main (27390db9592d testptp: add option to enable ext=
ernal timestamping edges)
Merging ipvs-next/main (27390db9592d testptp: add option to enable external=
 timestamping edges)
Merging bluetooth/master (8dcd9b294572 Bluetooth: MGMT: mesh_send: check in=
stances prior disabling advertising)
Merging wireless-next/for-next (28aa52b6189f Merge git://git.kernel.org/pub=
/scm/linux/kernel/git/netdev/net)
Merging ath-next/for-next (ed73728fd14e Merge tag 'mt76-next-2025-05-21' of=
 https://github.com/nbd168/wireless)
Merging iwlwifi-next/next (e3ad987e9dc7 wifi: iwlwifi: dvm: fix potential o=
verflow in rs_fill_link_cmd())
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
Merging crypto/master (a71d3e1beb7a crypto: testmgr - Enable phmac selftest)
Merging libcrypto/libcrypto-next (d74152ec2b51 lib/crypto: mips/chacha: Fix=
 clang build and remove unneeded byteswap)
Merging drm/drm-next (f41830c57bb8 Merge tag 'drm-misc-next-2025-06-26' of =
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/display/drm_dp_helper=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/display/xe_display=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_ggtt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_ct.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_hwmon.c
Merging drm-exynos/for-linux-next (19272b37aa4f Linux 6.16-rc1)
Merging drm-misc/for-linux-next (3529cb5ab16b drm/fourcc: Add 32b float for=
mats)
Merging amdgpu/drm-next (648d3f4d2097 drm/amd/display: Add sanity checks fo=
r drm_edid_raw())
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_fen=
ce.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_sdm=
a.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dc.h
Applying: fix up bad merge of the amdgpu tree
Merging drm-intel/for-linux-next (80e49db50175 drm/i915/power: convert {SKL=
, ICL}_PW_CTL_IDX_TO_PG() macros to a function)
Merging drm-msm/msm-next (ee11d953fd23 MAINTAINERS: .mailmap: update Rob Cl=
ark's email address)
Merging drm-msm-lumag/msm-next-lumag (ee1c98ae63d1 drm/msm/dp: add linux/io=
.h header to fix build errors)
Merging drm-nova/nova-next (4092e1b41202 gpu: nova-core: replace `Duration`=
 with `Delta`)
Merging drm-xe/drm-xe-next (c038bdba98c9 drm/xe: Fix out-of-bounds field wr=
ite in MI_STORE_DATA_IMM)
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (59d1fc7b3e1a fbdev: pm3fb: fix potential divide by =
zero)
Merging regmap/for-next (c8c4694ede7e regmap: kunit: Constify regmap_range_=
cfg array)
Merging sound/for-next (b1af6f027d92 Merge branch 'for-linus' into for-next)
Merging ieee1394/for-next (81456710391d firewire: core: minor code refactor=
ing to localize table of gap count)
Merging sound-asoc/for-next (2b53f08bc950 Merge remote-tracking branch 'aso=
c/for-6.17' into asoc-next)
Merging modules/modules-next (a0b018a495a3 module: Remove outdated comment =
about text_size)
Merging input/next (a95ef0199e80 Input: ims-pcu - check record size in ims_=
pcu_flash_firmware())
Merging block/for-next (09c57b513b2d Merge branch 'for-6.17/block' into for=
-next)
Merging device-mapper/for-next (9de4a3967caf dm raid: add support for resyn=
c w/o metadata devices)
Merging libata/for-next (3e0809b1664b ata: ahci: Use correct DMI identifier=
 for ASUSPRO-D840SA LPM quirk)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (15b8c45f982a mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (249abf9b1e25 mfd: axp20x: Set explicit ID for AXP=
313 regulator)
Merging backlight/for-backlight-next (19272b37aa4f Linux 6.16-rc1)
Merging battery/for-next (d375b70a0f47 MAINTAINERS: rectify file entry in Q=
UALCOMM SMB CHARGER DRIVER)
Merging regulator/for-next (53e1d4a8a20f regulator: dvfsrc: Add support for=
 MT8196 and)
Merging security/next (f3128dd6762d security: Remove unused declaration cap=
_mmap_file())
Merging apparmor/apparmor-next (1fdb22c54a5f apparmor: mitigate parser gene=
rating large xtables)
Merging integrity/next-integrity (aa9bb1b32594 ima: add a knob ima=3D to al=
low disabling IMA in kdump kernel)
Merging selinux/next (850dada4b3af Automated merge of 'dev' into 'next')
Merging smack/next (674e2b24791c smack: fix bug: setting task label silentl=
y ignores input garbage)
Merging tomoyo/master (f09079bd04a9 Merge tag 'powerpc-6.16-2' of git://git=
.kernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging tpmdd/next (7595b66ae9de Merge tag 'selinux-pr-20250624' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux)
Merging watchdog/master (86731a2a651e Linux 6.16-rc3)
Merging iommu/next (f9705d66fa71 iommu/tegra: Fix incorrect size calculatio=
n)
Merging audit/next (ae1ae11fb277 audit,module: restore audit logging in loa=
d failure case)
Merging devicetree/for-next (de13141516ad dt-bindings: interrupt-controller=
: Add arm,armv7m-nvic and fix #interrupt-cells)
Merging dt-krzk/for-next (6cd594ed969d ARM: dts: vt8500: Add L2 cache contr=
oller on WM8850/WM8950)
Merging mailbox/for-next (d0b497df02e9 mailbox: qcom-apcs-ipc: Assign OF no=
de to clock controller child device)
Merging spi/for-next (64da27e08fd1 Merge remote-tracking branch 'spi/for-6.=
17' into spi-next)
Merging tip/master (e51a38e71974 Merge x86/bugs into tip/master)
Merging clockevents/timers/drivers/next (d204e391a0d8 clocksource/drivers/r=
enesas-ostm: Unconditionally enable reprobe support)
Merging edac/edac-for-next (771eae56c7ac Merge ras/edac-drivers into for-ne=
xt)
Merging ftrace/for-next (9cca84d73fae Merge tools/for-next)
Merging rcu/next (e11b99cffe03 rcutorture: Make BUSTED scenario check and l=
og readers)
Merging paulmck/non-rcu/next (5c23ce0cb897 lib: Add stress test for ratelim=
it)
Merging kvm/next (8046d29dde17 KVM: x86/mmu: Reject direct bits in gpa pass=
ed to KVM_PRE_FAULT_MEMORY)
Merging kvm-arm/next (1b85d923ba8c Merge branch kvm-arm64/misc-6.16 into kv=
marm-master/next)
Merging kvms390/next (d6c8097803cb KVM: s390: Simplify and move pv code)
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (2e7be1629966 RISC-V: KVM: Don't treat SBI=
 HFENCE calls as NOPs)
Merging kvm-x86/next (6c7ecd725e50 Merge branches 'dirty_ring', 'fixes', 'g=
eneric', 'misc', 'mmu', 'no_assignment', 'selftests', 'svm' and 'vmx')
Merging xen-tip/linux-next (7f9bbc1140ff xen/arm: call uaccess_ttbr0_enable=
 for dm_op hypercall)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (dad7c0d4bc5f Merge branch 'for-6.17' into for-=
next)
Merging sched-ext/for-next (494389970390 Merge branch 'for-6.17' into for-n=
ext)
Merging drivers-x86/for-next (73f0f2b52c5e platform/x86: wmi: Fix WMI devic=
e naming issue)
Merging chrome-platform/for-next (981d7f91aeda platform/chrome: cros_ec_sen=
sorhub: Retries when a sensor is not ready)
Merging chrome-platform-firmware/for-firmware-next (19272b37aa4f Linux 6.16=
-rc1)
Merging hsi/for-next (19272b37aa4f Linux 6.16-rc1)
Merging leds-lj/for-leds-next (426e0c8e8eed leds: lp8860: Check return valu=
e of devm_mutex_init())
Merging ipmi/for-next (8ffcb7560b4a ipmi: Fix strcpy source and destination=
 the same)
Merging driver-core/driver-core-next (c79cbde9b7bc samples: rust: platform:=
 Add property child and reference args examples)
CONFLICT (modify/delete): drivers/infiniband/hw/qib/qib_sysfs.c deleted in =
HEAD and modified in driver-core/driver-core-next.  Version driver-core/dri=
ver-core-next of drivers/infiniband/hw/qib/qib_sysfs.c left in tree.
CONFLICT (content): Merge conflict in rust/helpers/helpers.c
$ git rm -f drivers/infiniband/hw/qib/qib_sysfs.c
Merging usb/usb-next (eb90d36bfa06 usb: typec: ucsi: yoga-c630: register DR=
M HPD bridge)
Merging thunderbolt/next (2d1beba54fda thunderbolt: Fix typos in documentat=
ion comments)
Merging usb-serial/usb-next (bdf2ab177e2f USB: serial: cp210x: use new GPIO=
 line value setter callbacks)
Merging tty/tty-next (6241b49540a6 tty: fix tty_port_tty_*hangup() kernel-d=
oc)
Merging char-misc/char-misc-next (421d3a860d3d binder: Remove unused binder=
 lock events)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (408c97c4a5e0 coresight: prevent deactivate active c=
onfig while enabling the config)
Merging fastrpc/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga/for-next (37e00703228a zynq_fpga: use sgtable-based scatterlis=
t wrappers)
Merging icc/icc-next (65fceba30d6f interconnect: avoid memory allocation wh=
en 'icc_bw_lock' is held)
Merging iio/togreg (7048348e330e iio: adc: ad7173: simplify clock enable/di=
sable)
Merging phy-next/next (304c102cff73 phy: qcom: qmp-combo: Add missing PLL (=
VCO) configuration on SM8750)
Merging soundwire/next (06f77ff9d852 soundwire: debugfs: move debug stateme=
nt outside of error handling)
Merging extcon/extcon-next (195609a5d811 extcon: fsa9480: Avoid buffer over=
flow in fsa9480_handle_change())
Merging gnss/gnss-next (e326371f3002 dt-bindings: gnss: u-blox: add u-blox,=
neo-9m compatible)
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
Merging dmaengine/next (671a654aecc7 dmaengine: idxd: Remove __packed from =
structures)
Merging cgroup/for-next (89bad5d60181 Merge branch 'for-6.16-fixes' into fo=
r-next)
Merging scsi/for-next (dc9f707da52e Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (26b971d58ab9 scsi: scsi_devinfo: Remove redundan=
t 'found')
Merging vhost/linux-next (f248703d67a5 media: add virtio-media driver)
Merging rpmsg/for-next (99ad6e3c0010 Merge branches 'rproc-next' and 'rpmsg=
-next' into for-next)
Merging gpio-brgl/gpio/for-next (3315e39e5639 gpio: rcar: Use new line valu=
e setter callbacks)
Merging gpio-intel/for-next (9ab29ed50555 gpiolib: acpi: Add a quirk for Ac=
er Nitro V15)
Merging pinctrl/for-next (aeaca01619b0 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (3b4408038da9 pinctrl: intel: fix build warn=
ings about export.h)
Merging pinctrl-renesas/renesas-pinctrl (52161035571c pinctrl: renesas: rzg=
2l: Validate pins before setting mux function)
Merging pinctrl-samsung/for-next (2642f55d44ce pinctrl: samsung: add suppor=
t for gs101 wakeup mask programming)
Merging pwm/pwm/for-next (63289206e26f pwm: pwm-mediatek: Add support for P=
WM IP V3.0.2 in MT6991/MT8196)
Merging ktest/for-next (19272b37aa4f Linux 6.16-rc1)
Merging kselftest/next (e72fe8cbd8a0 selftests/ptrace: Fix spelling mistake=
 "multible" -> "multiple")
Merging kunit/test (19272b37aa4f Linux 6.16-rc1)
Merging kunit-next/kunit (63d0a9123120 kunit: Adjust kunit_test timeout bas=
ed on test_{suite,case} speed)
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
Merging cxl/next (d9edb01a3d74 cxl/edac: Use correct format specifier for u=
32 val)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (46550e2b878d include: pe.h: Fix PE definitions)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (3cf3ee6a0be4 slab: Update MAINTAINERS entry)
Merging random/master (3778dcb2dcc1 random: use offstack cpumask when neces=
sary)
Merging landlock/next (3a843024e7f7 landlock: Fix warning from KUnit tests)
Merging rust/rust-next (0303584766b7 rust: io: avoid mentioning private fie=
lds in `IoMem`)
CONFLICT (content): Merge conflict in rust/kernel/sync/poll.rs
Merging rust-alloc/alloc-next (c7e03c5cf06a Merge tag 'topic/dma-features-2=
025-06-23' into alloc-next)
Merging rust-pin-init/pin-init-next (fc3870dc5cad rust: pin-init: examples,=
 tests: use `ignore` instead of conditionally compiling tests)
Merging rust-timekeeping/timekeeping-next (69f66cf45814 rust: time: Remove =
Ktime in hrtimer)
Applying: fix up for "rust: time: Make Instant generic over ClockSource"
Merging rust-xarray/xarray-next (fa616196fbea MAINTAINERS: add entry for Ru=
st XArray API)
Merging sysctl/sysctl-next (6fe7c1014978 locking/rtmutex fix 20250612175515=
.3251-1-spasswolf@web.de)
Merging execve/for-next/execve (11854fe263eb binfmt_elf: Move brk for stati=
c PIE even if ASLR disabled)
Merging bitmap/bitmap-for-next (92c2a364eea7 cpumask: Remove unnecessary cp=
umask_nth_andnot())
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (29bb79e9dbf1 stddef: Introduce TRAILING_OVERLAP=
() helper macro)
Merging nolibc/for-next (01e8a6d0c39c tools/nolibc: use arm64 name over aar=
ch64)
Merging iommufd/for-next (3e2a9811f6a9 iommufd: Apply the new iommufd_objec=
t_alloc_ucmd helper)
Merging turbostat/next (447c98c1ca4a tools/power turbostat: Add idle govern=
or statistics reporting)
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.8
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.c
Merging pwrseq/pwrseq/for-next (d4c2d9b5b7ce power: sequencing: Add T-HEAD =
TH1520 GPU power sequencer driver)
Merging capabilities-next/caps-next (337490f0007f exec: Correct the permiss=
ion check for unsafe exec)
Merging ipe/next (324692100cc9 ipe: use SHA-256 library API instead of cryp=
to_shash API)
Merging kcsan/next (9d89551994a4 Linux 6.13-rc6)
Merging crc/crc-next (d73638c555b0 lib/crc: crc64: Add include/linux/crc64.=
h to kernel-api.rst)
CONFLICT (content): Merge conflict in lib/crc/loongarch/crc32.h
CONFLICT (content): Merge conflict in lib/crc/s390/crc32.h
Merging fwctl/for-next (19272b37aa4f Linux 6.16-rc1)
Merging devsec-tsm/next (9d948b880409 Merge branch 'for-6.16/tsm-mr' into t=
sm-next)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)

--Sig_/uY9h.yIUQT_wUjpaC3VQlZC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmheXKQACgkQAVBC80lX
0GxHPgf3VF4P12/zt6DSkS/bqLXH1ABiHNYL0rpZBXH3ZbifGgIXaMatqONxyJAW
NQRizW7ucdw/wuI0gGm4p2s+0JVltIwbrjSIiU4vugqZh/dHHAd3WBFPkEf2AxdV
FucrwRhX/dUcj1FPbPqAMsedSBR81B4tmsqQ+CnW+zEgROBak9Ez4V+zefdExOYo
EroSw+DYLScoiDJ5IRH0jSpQyWXbW+ZMachy2Rs4EowuQCkz/WRzwmb1npenDJac
51GR24LR1C4imwB+j97adIjQHZyuHKtpwDn1HbT1i79A8k+BDayXXvgjkAYgM6Jg
Hh3gmfJiUczJYJMVan2DHqucJFdq
=Ti08
-----END PGP SIGNATURE-----

--Sig_/uY9h.yIUQT_wUjpaC3VQlZC--

