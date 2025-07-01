Return-Path: <linux-next+bounces-7292-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92621AEF2C7
	for <lists+linux-next@lfdr.de>; Tue,  1 Jul 2025 11:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B502C16C8A9
	for <lists+linux-next@lfdr.de>; Tue,  1 Jul 2025 09:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A442263F49;
	Tue,  1 Jul 2025 09:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="k407LTXS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E4872602;
	Tue,  1 Jul 2025 09:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751361048; cv=none; b=THKUHQw3UJzgc2Uuul3RLimhcFQOug9NyWTgFX84NC+ukabpnDYun14G7WAk2cVsjjJXpUF+GPH1idGV/btlslAYBa51GVmrIZyHI7TwpiL+vRVHZpEjEzlkJle4r4hMRhIj9Ge90MmnEsOmiqUpCWTDGDLqgwNEl+vIE9lwlzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751361048; c=relaxed/simple;
	bh=JUo40muCx28cJzurdDfG2ebjnF1TbT8FeHHMjugAH2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jsf+9ddtmIK5NX5FBWSN1LCAa+O0ryzna5KUlP6bWVncrF6vAsIvAXeEPeADNe1ai69c9W9T4KmW3NghsYDQ7mcN9embcSQvv4fin+W2aPzPo4QxWBP4DLAKZ/kOKgwrQLrx93FcNLc0SXVcIMraUJYe+iKfaco5Or95JMbrpKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=k407LTXS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751361030;
	bh=BkkCC5lhFEhSfDaYpmbFkbXRCJoMy6LWDsmmR2j2AC4=;
	h=Date:From:To:Cc:Subject:From;
	b=k407LTXSuCY4lJTJbdsDwvDu5hIgNkiYXPLhJkJ8ZH2xMalAZ9H+84fCsxu+2D+hb
	 cO22kosJMrrvDKzMSEwm4CMY7em+AsTE1WhQWsb2dnChFQ7PrlyHLmW/D5hk9EJVbs
	 Eu1gaYjmb446iIoGcLsYQH/1hyb5ocN1LqCpG+aeQXDqSSnFv66ikI8X9DIZqt/oyu
	 PjFzGoRT5CZt9KBEeNPNB59sh5tjgfTYOikieQpJvKTOqbmFi+LMnZ/PMZl1mnNpoa
	 i7iMcf5GvrupVAJJyNmoMsr04JaeV8JRjR10xtNOJTlk0ChqjDK4Z4HSQlY9486gZ8
	 +hJUdJGudbbow==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bWcgp0BDfz4wbn;
	Tue,  1 Jul 2025 19:10:29 +1000 (AEST)
Date: Tue, 1 Jul 2025 19:10:37 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 1
Message-ID: <20250701191037.119f9688@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_Eu4G/P8NrZhH33oXtHgHyP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_Eu4G/P8NrZhH33oXtHgHyP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250630:

The libcrypto tree gained a conflict against the libcrypto-fixes tree.

The amdgpu tree gained conficts against Linus' tree and the drm tree.

The driver-core tree gained a conflict against the drm-nova tree.

The rust tree gained conficts against the driver-core tree.

Non-merge commits (relative to Linus' tree): 5600
 6466 files changed, 186856 insertions(+), 131499 deletions(-)

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
Merging origin/master (d0b3b7b22dfa Linux 6.16-rc4)
Merging fixes/fixes (b3c623b9a94f Merge tag 'thermal-6.15-rc1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging ext4-fixes/fixes (4bbf9020becb Linux 6.13-rc4)
Merging vfs-brauner-fixes/vfs.fixes (dbee298cb7bb fuse: fix fuse_fill_write=
_pages() upper bound calculation)
Merging fscrypt-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging fsverity-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging btrfs-fixes/next-fixes (43277b6e516f Merge branch 'misc-6.16' into =
next-fixes)
Merging vfs-fixes/fixes (f1d673b38cb8 fix proc_sys_compare() handling of in=
-lookup dentries)
Merging erofs-fixes/fixes (86731a2a651e Linux 6.16-rc3)
Merging nfsd-fixes/nfsd-fixes (94d10a4dba0b sunrpc: handle SVC_GARBAGE duri=
ng svc auth processing as auth error)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (924577e4f6ca ovl: Fix nested backing fil=
e paths)
Merging bcachefs/for-next (747049b0437a bcachefs: Improve inode_create beha=
viour on old filesystems)
Merging fscrypt/for-next (01a0817f9ad9 fscrypt: Drop obsolete recommendatio=
n to enable optimized SHA-512)
Merging btrfs/for-next (b3b56f756193 Merge branch 'for-next-next-v6.16-2025=
0627' into for-next-20250627)
CONFLICT (content): Merge conflict in fs/btrfs/free-space-tree.c
CONFLICT (content): Merge conflict in fs/btrfs/inode.c
CONFLICT (content): Merge conflict in fs/btrfs/tree-log.c
Merging ceph/master (b828b4bf29d1 ceph: fix variable dereferenced before ch=
eck in ceph_umount_begin())
Merging cifs/for-next (89fa862ca44a smb: change return type of cached_dir_l=
ease_break() to bool)
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
Merging ext3/for_next (9acb79ac61d9 Pull fixes from Amir and Brahmajit.)
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
Merging nfsd/nfsd-next (84a25d9ff40d NFSD: Clean up kdoc for nfsd_open_loca=
l_fh())
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
Merging xfs/for-next (481e99aa7221 Merge branch 'xfs-6.16-fixes' into for-n=
ext)
Merging zonefs/for-next (6982100bb829 zonefs: use ZONEFS_SUPER_SIZE instead=
 of PAGE_SIZE)
Merging vfs-brauner/vfs.all (713f896d3a33 Merge branch 'vfs-6.17.rust' into=
 vfs.all)
Merging vfs/for-next (7bddf0b4a9da Merge branch 'work.simple_recursive_remo=
val' into for-next)
Merging mm-hotfixes/mm-hotfixes-unstable (97bd0bd814ff mm/damon/core: handl=
e damon_call_control as normal under kdmond deactivation)
Merging fs-current (7f5940d47ea6 Merge branch 'fixes' of git://git.kernel.o=
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
Merging s390-fixes/fixes (62355f1f87b8 s390/pci: Allow automatic recovery w=
ith minimal driver support)
Merging net/main (60f7f4afaf6d MAINTAINERS: Add myself as mlx5 core and mlx=
5e co-maintainer)
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
Merging iwlwifi/fixes (e5d110fec068 wifi: iwlwifi: pcie: fix locking on inv=
alid TOP reset)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (a9a9e68954f2 RDMA/mlx5: Fix vport loopback for M=
PV device)
Merging sound-current/for-linus (05f254a6369a ALSA: usb-audio: Improve filt=
ering of sample rates on Focusrite devices)
Merging sound-asoc-fixes/for-linus (a7528e9beadb ASoC: Intel: soc-acpi: arl=
: Correct order of cs42l43 matches)
Merging regmap-fixes/for-linus (c871c199accb regmap: fix potential memory l=
eak of regmap_bus)
Merging regulator-fixes/for-linus (eeca209124bb regulator: tps65219: Fix de=
vm_kmalloc size allocation)
Merging spi-fixes/for-linus (4ec24e9601d5 spi: spi-qpic-snand: avoid memory=
 corruption)
Merging pci-current/for-linus (ba74278c638d Revert "PCI: ecam: Allow cfg->p=
riv to be pre-populated from the root port device")
Merging driver-core.current/driver-core-linus (86731a2a651e Linux 6.16-rc3)
Merging tty.current/tty-linus (d0b3b7b22dfa Linux 6.16-rc4)
Merging usb.current/usb-linus (9bd9c8026341 usb: hub: Fix flushing of delay=
ed work used for post resume purposes)
Merging usb-serial-fixes/usb-linus (08f49cdb71f3 USB: serial: option: add F=
oxconn T99W640)
Merging phy/fixes (cf0233491b3a phy: use per-PHY lockdep keys)
Merging staging.current/staging-linus (d0b3b7b22dfa Linux 6.16-rc4)
Merging iio-fixes/fixes-togreg (a3245ebdfac8 Merge tag 'iio-fixes-for-6.15b=
' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/jic23/iio into char=
-misc-next)
Merging counter-current/counter-current (19272b37aa4f Linux 6.16-rc1)
Merging char-misc.current/char-misc-linus (86731a2a651e Linux 6.16-rc3)
Merging soundwire-fixes/fixes (a628e69b6412 soundwire: amd: fix for clearin=
g command status register)
Merging thunderbolt-fixes/fixes (2cdde91c14ec thunderbolt: Fix bit masking =
in tb_dp_port_set_hops())
Merging input-current/for-linus (a106b6a888ca Input: alps - use scnprintf()=
 to suppress truncation warning)
Merging crypto-current/master (ccafe2821cfa crypto: qat - Use crypto_shash_=
export_core)
Merging libcrypto-fixes/libcrypto-fixes (400bd45ba798 crypto: s390/sha - Fi=
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
Merging nvdimm-fixes/libnvdimm-fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging cxl-fixes/fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging dma-mapping-fixes/dma-mapping-fixes (aa807b9f22df dma-contiguous: h=
ornor the cma address limit setup by user)
Merging drivers-x86-fixes/fixes (50b6914fc53c platform/x86: wmi: Update doc=
umentation of WCxx/WExx ACPI methods)
Merging samsung-krzk-fixes/fixes (8d2c2fa2209e firmware: exynos-acpm: fix t=
imeouts on xfers handling)
Merging pinctrl-samsung-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging devicetree-fixes/dt/linus (f75794b6077e dt-bindings: serial: Conver=
t altr,uart-1.0 to DT schema)
Merging dt-krzk-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging scsi-fixes/fixes (021f243627ea scsi: ufs: core: Fix spelling of a s=
ysfs attribute name)
Merging drm-fixes/drm-fixes (9fbceb37c959 Merge tag 'drm-misc-fixes-2025-06=
-26' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (7da6c155a67d drm/i915/dsi: Fi=
x NULL pointer deref in vlv_dphy_param_init())
Merging mmc-fixes/fixes (ec54c0a20709 mtk-sd: reset host->mrq on prepare_da=
ta() error)
Merging rtc-fixes/rtc-fixes (08d82d0cad51 rtc: pcf2127: add missing semicol=
on after statement)
Merging gnss-fixes/gnss-linus (86731a2a651e Linux 6.16-rc3)
Merging hyperv-fixes/hyperv-fixes (14ae3003e73e Drivers: hv: Fix bad ref to=
 hv_synic_eventring_tail when CPU goes offline)
Merging risc-v-fixes/fixes (c5136add3f9b riscv: export boot_cpu_hartid)
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
Merging rust-fixes/rust-fixes (fe49aae0fcb3 rust: init: Fix generics in *_i=
nit! macros)
Merging w1-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging pmdomain-fixes/fixes (e04c78d86a96 Linux 6.16-rc2)
Merging i2c-host-fixes/i2c/i2c-host-fixes (3d30048958e0 i2c/designware: Fix=
 an initialization issue)
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
Merging tip-fixes/tip/urgent (cac4d9f5342e Merge branch into tip/master: 'x=
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
Merging drm-misc-fixes/for-linux-next-fixes (e8537cad8240 drm/bridge: aux-h=
pd-bridge: fix assignment of the of_node)
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (d0b3b7b22dfa Linux 6.16-rc4)
Merging mm-nonmm-stable/mm-nonmm-stable (d0b3b7b22dfa Linux 6.16-rc4)
Merging mm-unstable/mm-unstable (3b20fd3b79d4 kasan: replace kasan_arch_is_=
ready with kasan_enabled)
Merging mm-nonmm-unstable/mm-nonmm-unstable (c06a57b443e4 scripts: headers_=
install: fix a false positive)
Merging kbuild/for-next (f4363dfc900a kheaders: double-quote variables to s=
atisfy shellcheck)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (aa497357c125 perf stat: Fix uncore aggregatio=
n number)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (19272b37aa4f Linux 6.16-rc1)
Merging asm-generic/master (582847f97024 Makefile.kcov: apply needed compil=
er option unconditionally in CFLAGS_KCOV)
Merging alpha/alpha-next (1523226edda5 alpha: Use str_yes_no() helper in pc=
i_dac_dma_supported())
Merging arm/for-next (293bb049380e ARM: 9446/1: Disallow kernel mode NEON w=
hen IRQs are disabled)
Merging arm64/for-next/core (261082ee465b Merge branch 'for-next/user-conti=
g-bbml2' into for-next/core)
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
Merging drivers-memory/for-next (0e3dd41a94b2 memory: brcmstb_memc: Simplif=
y compatible matching)
Merging imx-mxs/for-next (4f283a1f98d0 Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (96130fd85e17 Merge branch 'v6.16-next/soc' into =
for-next)
Merging mvebu/for-next (89373e7d4125 Merge branch 'mvebu/dt' into mvebu/for=
-next)
Merging omap/for-next (3602b12e11d2 Merge branch 'omap-for-v6.17/soc' into =
tmp/omap-next-20250630.110437)
Merging qcom/for-next (0672fe83ed07 Merge branches 'arm32-for-6.17', 'arm64=
-defconfig-fixes-for-6.16', 'arm64-defconfig-for-6.17', 'arm64-fixes-for-6.=
16', 'arm64-for-6.17', 'clk-for-6.17' and 'drivers-for-6.17' into for-next)
Merging renesas/next (ac22a6392868 Merge branch 'renesas-dts-for-v6.17' int=
o renesas-next)
Merging reset/reset/next (811fe8ad1db9 reset: simple: add support for Sophg=
o CV1800B)
Merging rockchip/for-next (e05818ef75be Merge branch 'v6.17-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (6a37b3c73a59 Merge branch 'next/defconfig' i=
nto for-next)
Merging scmi/for-linux-next (d5c7554fd753 Merge branches 'for-next/scmi/fix=
es' and 'for-next/smccc/updates', tag 'ffa-fixes-6.16' of ssh://gitolite.ke=
rnel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-linux-next)
Merging sophgo/for-next (880f18ee6772 riscv: dts: sophgo: add reset configu=
ration for Sophgo CV1800 series SoC)
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
Merging thead-dt/thead-dt-for-next (c31f2899eab0 riscv: dts: thead: Add PVT=
 node)
Merging ti/ti-next (f984516d7ec6 Merge branch 'ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (487e52a21734 firmware: xilinx: Add debugfs support=
 for PM_GET_NODE_STATUS)
Merging clk/clk-next (b721267f02a1 Merge branch 'clk-fixes' into clk-next)
Merging clk-imx/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging clk-renesas/renesas-clk (b7c26cbd5b70 clk: renesas: rzv2h: Add miss=
ing include file)
Merging thead-clk/thead-clk-for-next (0370395d45ca clk: thead: Mark essenti=
al bus clocks as CLK_IGNORE_UNUSED)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (955853cf8365 LoongArch: KVM: Disable upda=
ting of "num_cpu" and "feature")
Merging m68k/for-next (8135422ae047 m68k: mm: Convert pointer table macros =
to use ptdescs)
Merging m68knommu/for-next (86731a2a651e Linux 6.16-rc3)
Merging microblaze/next (c0e7bb02f796 microblaze: Replace __ASSEMBLY__ with=
 __ASSEMBLER__ in non-uapi headers)
Merging mips/mips-next (86731a2a651e Linux 6.16-rc3)
Merging openrisc/for-next (f0eedcf22581 openrisc: Replace __ASSEMBLY__ with=
 __ASSEMBLER__ in non-uapi headers)
Merging parisc-hd/for-next (19272b37aa4f Linux 6.16-rc1)
Merging powerpc/next (cf183c1730f2 powerpc: floppy: Add missing checks afte=
r DMA map)
Merging risc-v/for-next (fda589c28604 Merge patch series "Move duplicated i=
nstructions macros into asm/insn.h")
Merging riscv-dt/riscv-dt-for-next (19272b37aa4f Linux 6.16-rc1)
Merging riscv-soc/riscv-soc-for-next (9aec69887386 riscv: defconfig: enable=
 Andes SoC)
Merging s390/for-next (9eb8364d688d Merge branch 'fixes' into for-next)
Merging sh/for-next (19272b37aa4f Linux 6.16-rc1)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (86731a2a651e Linux 6.16-rc3)
Merging xtensa/xtensa-for-next (44a4ef59d550 xtensa: Replace __ASSEMBLY__ w=
ith __ASSEMBLER__ in non-uapi headers)
Merging fs-next (d99142e57314 Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
CONFLICT (content): Merge conflict in include/linux/proc_fs.h
Merging printk/for-next (3f5857e726d8 Merge branch 'rework/ringbuffer-kunit=
-test' into for-next)
Merging pci/next (4e86d9d89f33 Merge branch 'pci/misc')
Merging pstore/for-next/pstore (d679c2e1e8d9 pstore/zone: rewrite some comm=
ents for better understanding)
Merging hid/for-next (6e519c3e85d4 Merge branch 'for-6.17/core' into for-ne=
xt)
Merging i2c/i2c/for-next (01f27b38e0b7 Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i2c-host/i2c/i2c-host (ca2f83d122fd i2c: imx: use guard to take spi=
nlock)
Merging i3c/i3c/next (19272b37aa4f Linux 6.16-rc1)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (a41a9728941f hwmon: emc2305: Set initial =
PWM minimum value during probe based on thermal state)
Merging jc_docs/docs-next (bb39dd09fe68 doc: Remove misleading reference to=
 brd in dax.rst)
Merging v4l-dvb/next (35392e855abf media: i2c: max96714: Drop check on numb=
er of active routes)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (6ab002e67804 Merge branch 'pm-runtime' into linux-ne=
xt)
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
Merging net-next/main (7878e21e40d4 Merge branch 'net-enetc-change-some-sta=
tistics-to-64-bit')
CONFLICT (content): Merge conflict in net/core/net_namespace.c
Merging bpf-next/for-next (188ce6ad1091 Merge branch 'bpf-next/master' into=
 for-next)
Merging ipsec-next/master (b05d42eefac7 xfrm: hold device only for the asyn=
chronous decryption)
Merging mlx5-next/mlx5-next (1f6da56679d3 net/mlx5: Add IFC bits for PCIe C=
ongestion Event object)
Merging netfilter-next/main (27390db9592d testptp: add option to enable ext=
ernal timestamping edges)
Merging ipvs-next/main (27390db9592d testptp: add option to enable external=
 timestamping edges)
Merging bluetooth/master (2a0ae2f6cd36 Bluetooth: hci_sync: Fix not disabli=
ng advertising instance)
CONFLICT (content): Merge conflict in net/bluetooth/hci_sync.c
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
Merging libcrypto/libcrypto-next (22375adaa0d9 lib/crypto: mips/chacha: Fix=
 clang build and remove unneeded byteswap)
CONFLICT (modify/delete): arch/s390/crypto/sha512_s390.c deleted in libcryp=
to/libcrypto-next and modified in HEAD.  Version HEAD of arch/s390/crypto/s=
ha512_s390.c left in tree.
$ git rm -f arch/s390/crypto/sha512_s390.c
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
Merging drm-misc/for-linux-next (576fca060f16 drm/panthor: Wait for _READY =
register when powering on)
Merging amdgpu/drm-next (2ecdb61f76eb drm/amdgpu/sdma6: add more ucode vers=
ion checks for userq support)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_dev=
ice.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_fen=
ce.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_job=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_sdm=
a.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_uco=
de.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/sdma_v4_4_=
2.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dc.h
Applying: fix up bad merge of the amdgpu tree
Merging drm-intel/for-linux-next (d5bafb1c294c drm/i915/display: Fix macro =
HAS_ULTRAJOINER)
  0dc6bfb50a5d ("drm/i915/dsi: Fix NULL pointer deref in vlv_dphy_param_ini=
t()")
  778fa8ad5f0f ("drm/i915/selftests: Change mock_request() to return error =
pointers")
Merging drm-msm/msm-next (316b31dd39bf drm/ci: i915: cml: Fix the runner ta=
g)
Merging drm-msm-lumag/msm-next-lumag (ee1c98ae63d1 drm/msm/dp: add linux/io=
.h header to fix build errors)
Merging drm-nova/nova-next (4092e1b41202 gpu: nova-core: replace `Duration`=
 with `Delta`)
Merging drm-xe/drm-xe-next (a559434880b3 drm/xe: Allow dropping kunit depen=
dency as built-in)
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (59d1fc7b3e1a fbdev: pm3fb: fix potential divide by =
zero)
Merging regmap/for-next (56e1767637ef Merge remote-tracking branch 'regmap/=
for-6.17' into regmap-next)
Merging sound/for-next (66b338d006d7 ALSA: dummy: Replace deprecated strcpy=
() with strscpy())
Merging ieee1394/for-next (81456710391d firewire: core: minor code refactor=
ing to localize table of gap count)
Merging sound-asoc/for-next (86a5028a849b Merge remote-tracking branch 'aso=
c/for-6.17' into asoc-next)
Merging modules/modules-next (f4e47f3ac798 module: Avoid unnecessary return=
 value initialization in move_module())
Merging input/next (54e626d097b0 Input: max8997_haptic - optimize PWM confi=
guration)
Merging block/for-next (aa37deef2ece Merge branch 'for-6.17/block' into for=
-next)
Merging device-mapper/for-next (6e11952a6abc dm-mpath: don't print the "loa=
ded" message if registering fails)
Merging libata/for-next (0013ddc4cf20 ata: libata-eh: Move and rename ata_e=
h_set_lpm())
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (15b8c45f982a mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (ea003d059846 mfd: tps65219: Remove another unused=
 field from 'struct tps65219')
Merging backlight/for-backlight-next (19272b37aa4f Linux 6.16-rc1)
Merging battery/for-next (d375b70a0f47 MAINTAINERS: rectify file entry in Q=
UALCOMM SMB CHARGER DRIVER)
Merging regulator/for-next (412524117f60 Merge remote-tracking branch 'regu=
lator/for-6.17' into regulator-next)
Merging security/next (f3128dd6762d security: Remove unused declaration cap=
_mmap_file())
Merging apparmor/apparmor-next (1fdb22c54a5f apparmor: mitigate parser gene=
rating large xtables)
Merging integrity/next-integrity (aa9bb1b32594 ima: add a knob ima=3D to al=
low disabling IMA in kdump kernel)
Merging selinux/next (850dada4b3af Automated merge of 'dev' into 'next')
Merging smack/next (6ddd169d0288 smack: fix kernel-doc warnings for smk_imp=
ort_valid_label())
Merging tomoyo/master (f09079bd04a9 Merge tag 'powerpc-6.16-2' of git://git=
.kernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging tpmdd/next (7595b66ae9de Merge tag 'selinux-pr-20250624' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux)
Merging watchdog/master (86731a2a651e Linux 6.16-rc3)
Merging iommu/next (8dd5a4bebc5f Merge branches 'fixes', 'apple/dart', 'ti/=
omap', 'amd/amd-vi' and 'core' into next)
Merging audit/next (ae1ae11fb277 audit,module: restore audit logging in loa=
d failure case)
Merging devicetree/for-next (98f79c729d8c dt-bindings: interrupt-controller=
: Convert fsl,mpic-msi to YAML)
Merging dt-krzk/for-next (6cd594ed969d ARM: dts: vt8500: Add L2 cache contr=
oller on WM8850/WM8950)
Merging mailbox/for-next (d0b497df02e9 mailbox: qcom-apcs-ipc: Assign OF no=
de to clock controller child device)
Merging spi/for-next (3b6f71d397eb Merge remote-tracking branch 'spi/for-6.=
17' into spi-next)
Merging tip/master (49ec9aaf45c8 Merge branch into tip/master: 'x86/sev')
Merging clockevents/timers/drivers/next (d204e391a0d8 clocksource/drivers/r=
enesas-ostm: Unconditionally enable reprobe support)
Merging edac/edac-for-next (0395820285ad Merge ras/edac-urgent into for-nex=
t)
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
Merging leds-lj/for-leds-next (1d7a74dfba58 dt-bindings: leds: lp50xx: Docu=
ment child reg, fix example)
Merging ipmi/for-next (8ffcb7560b4a ipmi: Fix strcpy source and destination=
 the same)
Merging driver-core/driver-core-next (f5d3ef25d238 rust: devres: get rid of=
 Devres' inner Arc)
CONFLICT (content): Merge conflict in drivers/gpu/nova-core/driver.rs
CONFLICT (modify/delete): drivers/infiniband/hw/qib/qib_sysfs.c deleted in =
HEAD and modified in driver-core/driver-core-next.  Version driver-core/dri=
ver-core-next of drivers/infiniband/hw/qib/qib_sysfs.c left in tree.
CONFLICT (content): Merge conflict in rust/helpers/helpers.c
$ git rm -f drivers/infiniband/hw/qib/qib_sysfs.c
Merging usb/usb-next (e35a5d814525 usb: gadget: u_serial: remove some dead =
code)
Merging thunderbolt/next (2d1beba54fda thunderbolt: Fix typos in documentat=
ion comments)
Merging usb-serial/usb-next (bdf2ab177e2f USB: serial: cp210x: use new GPIO=
 line value setter callbacks)
Merging tty/tty-next (815ac6791914 Merge 6.16-rc4 into tty-next)
Merging char-misc/char-misc-next (421d3a860d3d binder: Remove unused binder=
 lock events)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (408c97c4a5e0 coresight: prevent deactivate active c=
onfig while enabling the config)
Merging fastrpc/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga/for-next (37e00703228a zynq_fpga: use sgtable-based scatterlis=
t wrappers)
Merging icc/icc-next (c5b60592886f interconnect: avoid memory allocation wh=
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
Merging staging/staging-next (b4d72f15c098 Merge 6.16-rc4 into staging-next)
Merging counter-next/counter-next (19272b37aa4f Linux 6.16-rc1)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (0044c5fcae3d dmaengine: idxd: Remove __packed from =
structures)
Merging cgroup/for-next (89bad5d60181 Merge branch 'for-6.16-fixes' into fo=
r-next)
Merging scsi/for-next (dc9f707da52e Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (26b971d58ab9 scsi: scsi_devinfo: Remove redundan=
t 'found')
Merging vhost/linux-next (f248703d67a5 media: add virtio-media driver)
Merging rpmsg/for-next (99ad6e3c0010 Merge branches 'rproc-next' and 'rpmsg=
-next' into for-next)
Merging gpio-brgl/gpio/for-next (26981e8906bb gpio: make gpiod_is_equal() a=
rguments stricter)
Merging gpio-intel/for-next (9ab29ed50555 gpiolib: acpi: Add a quirk for Ac=
er Nitro V15)
Merging pinctrl/for-next (aeaca01619b0 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (3b4408038da9 pinctrl: intel: fix build warn=
ings about export.h)
Merging pinctrl-renesas/renesas-pinctrl (52161035571c pinctrl: renesas: rzg=
2l: Validate pins before setting mux function)
Merging pinctrl-samsung/for-next (2642f55d44ce pinctrl: samsung: add suppor=
t for gs101 wakeup mask programming)
Merging pwm/pwm/for-next (465b9a23124f pwm: argon-fan-hat: Add Argon40 Fan =
HAT support)
Merging ktest/for-next (19272b37aa4f Linux 6.16-rc1)
Merging kselftest/next (e72fe8cbd8a0 selftests/ptrace: Fix spelling mistake=
 "multible" -> "multiple")
Merging kunit/test (19272b37aa4f Linux 6.16-rc1)
Merging kunit-next/kunit (5ac244b9cc8f kunit: Make default kunit_test timeo=
ut configurable via both a module parameter and a Kconfig option)
Merging livepatching/for-next (a8e905a819fd Merge branch 'for-6.15/ftrace-t=
est' into for-next)
Merging rtc/rtc-next (19272b37aa4f Linux 6.16-rc1)
Merging nvdimm/libnvdimm-for-next (aefeb286b960 libnvdimm: Don't use "proxy=
" headers)
Merging at24/at24/for-next (19272b37aa4f Linux 6.16-rc1)
Merging ntb/ntb-next (0cadf92e93d4 NTB/msi: Remove unused functions)
Merging seccomp/for-next/seccomp (a9b33aae79ce selftests: seccomp: Fix "per=
formace" to "performance")
Merging slimbus/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging nvmem/for-next (1cd2162f9055 Merge branches 'nvmem-fixes' and 'nvme=
m-for-6.17' into nvmem-for-next)
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
Merging cxl/next (d7b9056c3a6c cxl/edac: Use correct format specifier for u=
32 val)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (46550e2b878d include: pe.h: Fix PE definitions)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (3cf3ee6a0be4 slab: Update MAINTAINERS entry)
Merging random/master (3778dcb2dcc1 random: use offstack cpumask when neces=
sary)
Merging landlock/next (e81d33b74c7a selftests/landlock: Add tests for acces=
s through disconnected paths)
Merging rust/rust-next (769e324b66b0 rust: alloc: implement `Borrow` and `B=
orrowMut` for `KBox`)
CONFLICT (content): Merge conflict in rust/kernel/devres.rs
CONFLICT (content): Merge conflict in rust/kernel/sync/poll.rs
Merging rust-alloc/alloc-next (c7e03c5cf06a Merge tag 'topic/dma-features-2=
025-06-23' into alloc-next)
Merging rust-io/io-next (86731a2a651e Linux 6.16-rc3)
Merging rust-pin-init/pin-init-next (fc3870dc5cad rust: pin-init: examples,=
 tests: use `ignore` instead of conditionally compiling tests)
Merging rust-timekeeping/timekeeping-next (d4b29ddf82a4 rust: time: Add wra=
pper for fsleep() function)
Applying: fix up for "rust: time: Make Instant generic over ClockSource"
Merging rust-xarray/xarray-next (fa616196fbea MAINTAINERS: add entry for Ru=
st XArray API)
Merging sysctl/sysctl-next (5789a65fc96c locking/rtmutex: Remove debug line=
 from sysctl registration)
Merging execve/for-next/execve (11854fe263eb binfmt_elf: Move brk for stati=
c PIE even if ASLR disabled)
Merging bitmap/bitmap-for-next (92c2a364eea7 cpumask: Remove unnecessary cp=
umask_nth_andnot())
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (5e54510a9389 acpi: nfit: intel: avoid multiple =
-Wflex-array-member-not-at-end warnings)
Merging nolibc/for-next (a6a2a8a42972 tools/nolibc: MIPS: add support for N=
64 and N32 ABIs)
Merging iommufd/for-next (3e2a9811f6a9 iommufd: Apply the new iommufd_objec=
t_alloc_ucmd helper)
CONFLICT (content): Merge conflict in include/linux/iommu.h
Merging turbostat/next (447c98c1ca4a tools/power turbostat: Add idle govern=
or statistics reporting)
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.8
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.c
Merging pwrseq/pwrseq/for-next (07d59dec6795 power: sequencing: qcom-wcn: f=
ix bluetooth-wifi copypasta for WCN6855)
Merging capabilities-next/caps-next (337490f0007f exec: Correct the permiss=
ion check for unsafe exec)
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

--Sig_/_Eu4G/P8NrZhH33oXtHgHyP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhjpg0ACgkQAVBC80lX
0GyZlgf/Qm5TPEexbDDaYlfPvFv820klDvn6Ng1CP3fQ5SqyqWx7Hzc+EqZzqotl
OCEbVZJIOsQxMO5hyVCUSA43fffvnQuiVe78/0Z7I+Sj3acbDdlN5DFE8EyhYw4Y
5IAc1KeHJ7DkUuSEnzOCU+q92pn4DN/kCWB3bQnCfr4EecGj6Q71+8vl3NJqy0sp
sT9fA2hmrRze1kbBUBPyULcHev2/1lUQQ3ZR5f006mKdk9uDGZUUKUMSf0YrU1bP
0rUiUmOMY2By6I/ehXWr3poaoqLqHMqZxqZOL0ibZ0TxCgpu2vHgDqMCO0b1XCZ1
H2p0Acvt5Lk4ubRVm8nHjLJXzHU2Wg==
=Btbh
-----END PGP SIGNATURE-----

--Sig_/_Eu4G/P8NrZhH33oXtHgHyP--

