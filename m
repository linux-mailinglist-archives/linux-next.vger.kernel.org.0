Return-Path: <linux-next+bounces-4573-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 085F89B8B2D
	for <lists+linux-next@lfdr.de>; Fri,  1 Nov 2024 07:22:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F764B21BEB
	for <lists+linux-next@lfdr.de>; Fri,  1 Nov 2024 06:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8765914A092;
	Fri,  1 Nov 2024 06:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sJHgtGDN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797E7147C98;
	Fri,  1 Nov 2024 06:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730442134; cv=none; b=NPFAhznAk0+zeLkFZTc6jlVHPkEY+rSqug7abdribX5+lfDyvXpUMW7mMsPdGL0UCAGY5tAdPrDRWjeusx7LTzf2d8u3fdD6lUgEN2jwU6XG+wzyC0+w6tgdTzAtl2HjcK/0FPvwYsImDIiLxUffnCSn7ZJ+t0wVkZ6Dg88ZDso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730442134; c=relaxed/simple;
	bh=laH1epmEm9vmdNaNc5uiX4d0+yeUKPexKXdgg01Fm1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=urAe7jqhKWyss9pg/M0/3gpB3Z/xOG/YuGfaT7mEehQ1wdDoePp7Mpz8o1J2uFVgGTAw8ABM2SNLR3gr7ssLJVkKu98MPYtSyHw0v2/IZO4mHMvTXjkcxKZ6vK4pEnstRWqsCWTb6USpkCRgrTq4Qxl3cWyn8YLmKVNhMqOB4lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sJHgtGDN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730442122;
	bh=3FsIW4e+9Vt7T2xEpBUpYvbCWS0k59XpNOWlE+8frp8=;
	h=Date:From:To:Cc:Subject:From;
	b=sJHgtGDN3kxWl2opAfvd4cvaWHxHmWFVxUl5WWgG2IVsk4klhItungQHwi+W5EAMA
	 HxcJMnmcwkKkF/Hdvrb1yiR5A/0MUbrm3s1VhDgqEjS7vZ5FzGYaq4fRkAo+8lM89T
	 QmGeqPKyZ2Bfwg/BT20nB2OQ8mgNRonLpLvub3gGCp/99RTpiOhMNFiHBSmt8Sg1gx
	 36mCG8mNxgK7I4pHhGzKUgRwp6MTmbp64i83IBghuJqI3s81FJJ5TgvyremSCeOywH
	 zihPpiZwILiUR4UkgnlPaThn+QI70jfju3dRzpzKiQBWrRpPfglIMKOsghmo1S5BVN
	 9lZgyfqFpe9og==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XfrP60WRkz4xM5;
	Fri,  1 Nov 2024 17:22:02 +1100 (AEDT)
Date: Fri, 1 Nov 2024 17:22:03 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 1
Message-ID: <20241101172203.16b4fae0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H7GEZAAhAuRjSn6Ek5lxuov";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/H7GEZAAhAuRjSn6Ek5lxuov
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20241031:

New tree: ext4-fixes

The vfs-brauner tree gained a conflict against the btrfs tree.

The perf tree gained a conflict against Linus' tree.

The net-next tree gained a conflict against the reset tree.

The tip tree still had its build failure for which I applied a patch.

The usb tree gained a conflict against the usb.current tree.

Non-merge commits (relative to Linus' tree): 8001
 9636 files changed, 342976 insertions(+), 249855 deletions(-)

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

I am currently merging 385 trees (counting Linus' and 146 trees of bug
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
Merging origin/master (0fc810ae3ae1 x86/uaccess: Avoid barrier_nospec() in =
64-bit copy_from_user())
Merging fixes/fixes (87d6aab2389e Merge tag 'for_linus' of git://git.kernel=
.org/pub/scm/linux/kernel/git/mst/vhost)
Merging ext4-fixes/fixes (b2ef7a39bcaf ext4: fix FS_IOC_GETFSMAP handling)
Merging vfs-brauner-fixes/vfs.fixes (c749d9b7ebbc iov_iter: fix copy_page_f=
rom_iter_atomic() if KMAP_LOCAL_FORCE_MAP)
Merging fscrypt-current/for-current (8e929cb546ee Linux 6.12-rc3)
Merging fsverity-current/for-current (8e929cb546ee Linux 6.12-rc3)
Merging btrfs-fixes/next-fixes (bcca41d50618 Merge branch 'misc-6.12' into =
next-fixes)
Merging vfs-fixes/fixes (678379e1d4f7 close_range(): fix the logics in desc=
riptor table trimming)
Merging erofs-fixes/fixes (ae54567eaa87 erofs: get rid of kaddr in `struct =
z_erofs_maprecorder`)
Merging nfsd-fixes/nfsd-fixes (63a81588cd20 rpcrdma: Always release the rpc=
rdma_device's xa_array)
Merging v9fs-fixes/fixes/next (684a64bf32b6 Merge tag 'nfs-for-6.12-1' of g=
it://git.linux-nfs.org/projects/anna/linux-nfs)
Merging overlayfs-fixes/ovl-fixes (77a28aa47687 ovl: relax WARN_ON in ovl_v=
erify_area())
Merging bcachefs/for-next (b78da43137b1 bcachefs: bch2_write_inode() now ch=
ecks for changing rebalance options)
Merging fscrypt/for-next (8e929cb546ee Linux 6.12-rc3)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (8ae6062e6097 Merge branch 'for-next-next-v6.12-2024=
1031' into for-next-20241031)
  0490aee1d4f6 ("btrfs: fix defrag not merging contiguous extents due to me=
rged extent maps")
  c84084eedf71 ("btrfs: fix extent map merging not happening for adjacent e=
xtents")
Merging ceph/master (515f493a1ce5 MAINTAINERS: exclude net/ceph from networ=
king)
Merging cifs/for-next (819837584309 Linux 6.12-rc5)
Merging configfs/for-next (4425c1d9b44d configfs: improve item creation per=
formance)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (dfe5a6cc4204 dlm: make add_to_waiters() that it can't fai=
l)
Merging erofs/dev (2f831c82ddc2 erofs: sunset `struct erofs_workgroup`)
Merging exfat/dev (a1d37a0236e9 exfat: fix file being changed by unaligned =
direct write)
Merging exportfs/exportfs-next (98f7e32f20d2 Linux 6.11)
Merging ext3/for_next (6cb3f5ca9e44 Merge dropping of reiserfs)
Merging ext4/dev (b2ef7a39bcaf ext4: fix FS_IOC_GETFSMAP handling)
Merging f2fs/dev (f2bbbe277c22 f2fs: check curseg->inited before write_sum_=
page in change_curseg)
Merging fsverity/for-next (8e929cb546ee Linux 6.12-rc3)
Merging fuse/for-next (8807f117be9d fuse: convert fuse_notify_store to use =
folios)
Merging gfs2/for-next (56475f577e91 gfs2: Simplify DLM_LKF_QUECVT use)
Merging jfs/jfs-next (a174706ba4da jfs: add a check to prevent array-index-=
out-of-bounds in dbAdjTree)
Merging ksmbd/ksmbd-for-next (819837584309 Linux 6.12-rc5)
Merging nfs/linux-next (42f7652d3eb5 Linux 6.12-rc4)
Merging nfs-anna/linux-next (7ef60108069b NFS: remove revoked delegation fr=
om server's delegation list)
Merging nfsd/nfsd-next (db8b2eb56803 nfsd: allow for up to 32 callback sess=
ion slots)
Merging ntfs3/master (8e929cb546ee Linux 6.12-rc3)
Merging orangefs/for-next (96319dacaf15 orangefs: Constify struct kobj_type)
Merging overlayfs/overlayfs-next (67057d4a59c2 ovl: convert ovl_real_fdget(=
) callers to ovl_real_file())
Merging ubifs/next (92a286e90203 ubi: Fix ubi_init() ubiblock_exit() sectio=
n mismatch)
Merging v9fs/9p-next (be2ca3825372 Revert "fs/9p: simplify iget to remove u=
nnecessary paths")
Merging v9fs-ericvh/ericvh/for-next (684a64bf32b6 Merge tag 'nfs-for-6.12-1=
' of git://git.linux-nfs.org/projects/anna/linux-nfs)
Merging xfs/for-next (81a1e1c32ef4 xfs: streamline xfs_filestream_pick_ag)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging file-locks/locks-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6-=
mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging iversion/iversion-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6=
-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging vfs-brauner/vfs.all (d89df1342423 Merge branch 'vfs.tmpfs' into vfs=
.all)
CONFLICT (content): Merge conflict in fs/btrfs/file.c
CONFLICT (content): Merge conflict in fs/btrfs/inode.c
Merging vfs/for-next (8f602276d390 Merge tag 'bcachefs-2024-10-05' of git:/=
/evilpiepirate.org/bcachefs)
Merging mm-hotfixes/mm-hotfixes-unstable (cffcc47b4394 mm/mlock: set the co=
rrect prev on failure)
Merging fs-current (451fff7dde09 Merge branch 'nfsd-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/cel/linux)
Merging kbuild-current/fixes (d01661e1f422 kconfig: show sub-menu entries e=
ven if the prompt is hidden)
Merging arc-current/for-curr (9a1a5caeaa6d ARC: build: Use __force to suppr=
ess per-CPU cmpxchg warnings)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (2e8a1acea859 arm64: signal: Improve POR=
_EL0 handling to avoid uaccess failures)
Merging arm-soc-fixes/arm/fixes (1b59d6c19c2c Merge tag 'scmi-fixes-6.12' o=
f https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into a=
rm/fixes)
Merging davinci-current/davinci/for-current (9852d85ec9d4 Linux 6.12-rc1)
Merging drivers-memory-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging sophgo-fixes/fixes (d99913e1b80b riscv: dts: Replace deprecated snp=
s,nr-gpios property for snps,dw-apb-gpio-port devices)
Merging m68k-current/for-linus (b90fae5df917 m68k: defconfig: Update defcon=
figs for v6.11-rc1)
Merging powerpc-fixes/fixes (cf8989d20d64 powerpc/powernv: Free name on err=
or in opal_event_init())
Merging s390-fixes/fixes (b4fa00fd428b s390: Update defconfigs)
Merging net/main (50ae879de107 Merge tag 'nf-24-10-31' of git://git.kernel.=
org/pub/scm/linux/kernel/git/netfilter/nf)
Merging bpf/master (c40dd8c47325 bpf, test_run: Fix LIVE_FRAME frame update=
 after a page has been recycled)
Merging ipsec/master (94c11e852955 usb: add support for new USB device ID 0=
x17EF:0x3098 for the r8152 driver)
Merging netfilter/main (50ae879de107 Merge tag 'nf-24-10-31' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/netfilter/nf)
Merging ipvs/main (306ed1728e84 netfilter: xtables: fix typo causing some t=
argets not to load on IPv6)
Merging wireless/for-next (c05c62850a8f Merge tag 'wireless-2024-10-29' of =
https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless)
Merging ath/for-current (befd716ed429 wifi: ath11k: Fix invalid ring usage =
in full monitor mode)
Merging wpan/master (09573b1cc76e net: ieee802154: mcr20a: Use IRQF_NO_AUTO=
EN flag in request_irq())
Merging rdma-fixes/for-rc (76d3ddff7153 RDMA/bnxt_re: synchronize the qp-ha=
ndle table array)
Merging sound-current/for-linus (c9363bbb0f68 Revert "ALSA: hda/conexant: M=
ute speakers at suspend / shutdown")
Merging sound-asoc-fixes/for-linus (2db63e92186d wcd937x codec fixes)
Merging regmap-fixes/for-linus (8cf0b93919e1 Linux 6.12-rc2)
Merging regulator-fixes/for-linus (2feb02311084 regulator: rtq2208: Fix uni=
nitialized use of regulator_config)
Merging spi-fixes/for-linus (25f00a13dccf spi: spi-fsl-dspi: Fix crash when=
 not using GPIO chip select)
Merging pci-current/for-linus (f3c3ccc4fe49 PCI: Fix pci_enable_acs() suppo=
rt for the ACS quirks)
Merging driver-core.current/driver-core-linus (9a71892cbcdb Revert "driver =
core: Fix uevent_show() vs driver detach race")
Merging tty.current/tty-linus (42f7652d3eb5 Linux 6.12-rc4)
Merging usb.current/usb-linus (afb92ad8733e usb: typec: tcpm: restrict SNK_=
WAIT_CAPABILITIES_TIMEOUT transitions to non self-powered devices)
Merging usb-serial-fixes/usb-linus (37bb56283792 USB: serial: io_edgeport: =
fix use after free in debug printk)
Merging phy/fixes (e70d2677ef40 phy: tegra: xusb: Add error pointer check i=
n xusb.c)
Merging staging.current/staging-linus (807babf69027 staging: vchiq_arm: Use=
 devm_kzalloc() for drv_mgmt allocation)
Merging iio-fixes/fixes-togreg (b7d2bc99b3bd iio: accel: kx022a: Fix raw re=
ad format)
Merging counter-current/counter-current (9852d85ec9d4 Linux 6.12-rc1)
Merging char-misc.current/char-misc-linus (d0bc3b92fb9b Merge tag 'iio-fixe=
s-for-6.12b' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/jic23/ii=
o into char-misc-next)
Merging soundwire-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging thunderbolt-fixes/fixes (bf791751162a thunderbolt: Add only on-boar=
d retimers when !CONFIG_USB4_DEBUGFS_MARGINING)
Merging input-current/for-linus (2860586c588a Input: adp5588-keys - do not =
try to disable interrupt 0)
Merging crypto-current/master (dd41b283ef2f crypto: mips/crc32 - fix the CR=
C32C implementation)
Merging vfio-fixes/for-linus (5a88a3f67e37 vfio/pci: Init the count variabl=
e in collecting hot-reset devices)
Merging kselftest-fixes/fixes (dc1308bee1ed selftests/watchdog-test: Fix sy=
stem accidentally reset after watchdog-test)
Merging dmaengine-fixes/fixes (83158a3a712a dmaengine: ti: edma: Check retu=
rn value of of_dma_controller_register)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging mfd-fixes/for-mfd-fixes (68f860426d50 mfd: axp20x: AXP717: Fix miss=
ing IRQ status registers range)
Merging v4l-dvb-fixes/fixes (96d856956391 media: vivid: fix buffer overwrit=
e when using > 32 buffers)
Merging reset-fixes/reset/fixes (2cf596636607 reset: starfive: jh71x0: Fix =
accessing the empty member on JH7110 SoC)
Merging mips-fixes/mips-fixes (819837584309 Linux 6.12-rc5)
Merging at91-fixes/at91-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging omap-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging kvm-fixes/master (e9001a382fa2 Merge tag 'kvmarm-fixes-6.12-3' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvms390-fixes/master (cff59d8631e1 s390/uv: Panic for set and remov=
e shared access UVC errors)
Merging hwmon-fixes/hwmon (eabb03810194 [PATCH} hwmon: (jc42) Properly dete=
ct TSE2004-compliant devices again)
Merging nvdimm-fixes/libnvdimm-fixes (d5240fa65db0 nvdimm/pmem: Set dax fla=
g for all 'PFN_MAP' cases)
Merging cxl-fixes/fixes (3a2b97b3210b cxl/test: Improve init-order fidelity=
 relative to real-world systems)
Merging dma-mapping-fixes/for-linus (78b2770c935f dma-mapping: fix tracing =
dma_alloc/free with vmalloc'd memory)
Merging drivers-x86-fixes/fixes (b012170fed28 platform/x86: asus-wmi: Fix t=
hermal profile initialization)
Merging samsung-krzk-fixes/fixes (a03c246d4ec8 clk: samsung: Fix out-of-bou=
nd access of of_match_node())
Merging pinctrl-samsung-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging devicetree-fixes/dt/linus (6e0391e48cf9 of: Skip kunit tests when a=
rm64+ACPI doesn't populate root node)
Merging dt-krzk-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging scsi-fixes/fixes (cb7e509c4e01 scsi: ufs: core: Fix another deadloc=
k during RTC update)
Merging drm-fixes/drm-fixes (8594a2d8d72d Merge tag 'amd-drm-fixes-6.12-202=
4-10-31' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (819837584309 Linux 6.12-rc5)
Merging mmc-fixes/fixes (c4dedaaeb3f7 mmc: sdhci-pci-gli: GL9767: Fix low p=
ower mode in the SD Express process)
Merging rtc-fixes/rtc-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging gnss-fixes/gnss-linus (8e929cb546ee Linux 6.12-rc3)
Merging hyperv-fixes/hyperv-fixes (895384881ec9 hv: vmbus: Constify struct =
kobj_type and struct attribute_group)
Merging risc-v-fixes/fixes (5f153a692bac Merge commit 'bf40167d54d5' into f=
ixes)
Merging riscv-dt-fixes/riscv-dt-fixes (8e929cb546ee Linux 6.12-rc3)
Merging riscv-soc-fixes/riscv-soc-fixes (384f2024e1a1 MAINTAINERS: invert M=
isc RISC-V SoC Support's pattern)
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (47ac09b91bef Linux 6.11-rc4)
Merging gpio-brgl-fixes/gpio/for-current (604888f8c3d0 gpiolib: fix debugfs=
 dangling chip separator)
Merging gpio-intel-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging pinctrl-intel-fixes/fixes (819837584309 Linux 6.12-rc5)
Merging auxdisplay-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging kunit-fixes/kunit-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging memblock-fixes/fixes (8043832e2a12 memblock: use numa_valid_node() =
helper to check for invalid node ID)
Merging renesas-fixes/fixes (8c987693dc2d ARM: dts: renesas: rcar-gen2: Add=
 missing #interrupt-cells to DA9063 nodes)
Merging perf-current/perf-tools (a5384c426744 perf cap: Add __NR_capget to =
arch/x86 unistd)
Merging efi-fixes/urgent (ae835a96d72c x86/efistub: Revert to heap allocate=
d boot_params for PE entrypoint)
Merging zstd-fixes/zstd-linus (77618db34645 zstd: Fix array-index-out-of-bo=
unds UBSAN warning)
Merging battery-fixes/fixes (7c626ce4bae1 Linux 6.11-rc3)
Merging iommufd-fixes/for-rc (9852d85ec9d4 Linux 6.12-rc1)
Merging rust-fixes/rust-fixes (2313ab74c300 cfi: tweak llvm version for HAV=
E_CFI_ICALL_NORMALIZE_INTEGERS)
Merging w1-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging pmdomain-fixes/fixes (0bf020344204 pmdomain: arm: Use FLAG_DEV_NAME=
_FW to ensure unique names)
Merging i2c-host-fixes/i2c/i2c-host-fixes (c4c4172fb9c2 i2c: muxes: Fix ret=
urn value check in mule_i2c_mux_probe())
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (6b5cca7868fd clk: test: Fix some memory leaks)
Merging pwrseq-fixes/pwrseq/for-current (9852d85ec9d4 Linux 6.12-rc1)
Merging thead-dt-fixes/thead-dt-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging ftrace-fixes/ftrace/fixes (fae4078c289a fgraph: Allocate ret_stack_=
list with proper size)
Merging ring-buffer-fixes/ring-buffer/fixes (09661f75e75c ring-buffer: Fix =
reader locking when changing the sub buffer order)
Merging trace-fixes/trace/fixes (2a13ca2e8abb tracing/hwlat: Fix a race dur=
ing cpuhp processing)
Merging spacemit-fixes/fixes (819837584309 Linux 6.12-rc5)
Merging drm-misc-fixes/for-linux-next-fixes (add4163aca0d drm/tests: hdmi: =
Fix memory leaks in drm_display_mode_from_cea_vic())
Merging mm-stable/mm-stable (819837584309 Linux 6.12-rc5)
Merging mm-nonmm-stable/mm-nonmm-stable (819837584309 Linux 6.12-rc5)
Merging mm/mm-everything (39b889960ecc foo)
Merging kbuild/for-next (7e04fcfc6195 kconfig: qconf: simplify character re=
placement)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (ba993e5ada1d perf arm-spe: Use old behavior w=
hen opening old SPE files)
CONFLICT (content): Merge conflict in tools/perf/util/syscalltbl.c
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/for-next (be164349e173 dma-mapping: drop unneeded inclu=
des from dma-mapping.h)
Merging asm-generic/master (c0dc92144ba1 tty: serial: export serial_8250_wa=
rn_need_ioport)
CONFLICT (content): Merge conflict in lib/Makefile
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (9016915e3c5f Merge branches 'amba', 'fixes' and 'misc=
' into for-next)
Merging arm64/for-next/core (47c8cf3c9853 Merge branches 'for-next/misc' an=
d 'for-next/kselftest' into for-next/core)
CONFLICT (content): Merge conflict in arch/arm64/include/asm/mman.h
CONFLICT (content): Merge conflict in arch/arm64/kernel/signal.c
CONFLICT (content): Merge conflict in arch/arm64/mm/pageattr.c
CONFLICT (content): Merge conflict in include/linux/mm.h
Merging arm-perf/for-next/perf (9643aaa19473 perf: arm_pmuv3: Add support f=
or Samsung Mongoose PMU)
Merging arm-soc/for-next (1b59d6c19c2c Merge tag 'scmi-fixes-6.12' of https=
://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into arm/fixe=
s)
Merging amlogic/for-next (171aa289a6fe Merge branch 'v6.13/arm-dt' into for=
-next)
Merging asahi-soc/asahi-soc/for-next (ffc253263a13 Linux 6.6)
Merging aspeed/for-next (faabe02697d7 ARM: dts: aspeed: yosemite4: Add i2c-=
mux for ADC monitor on Spider Board)
Merging at91/at91-next (9415b23aa236 Merge branch 'at91-defconfig' into at9=
1-next)
Merging broadcom/next (f8078d7ae62b Merge branch 'soc/next' into next)
Merging davinci/davinci/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging drivers-memory/for-next (1f1d847a6575 arm64: defconfig: Update defc=
onfig with now user-visible CONFIG_FSL_IFC)
Merging imx-mxs/for-next (587a0bfc4962 Merge branch 'imx/dt64' into for-nex=
t)
Merging mediatek/for-next (4964e195e64f Merge branch 'v6.12-next/dts64' int=
o for-next)
Merging mvebu/for-next (841dd5b122b4 arm64: dts: marvell: cn9130-sr-som: fi=
x cp0 mdio pin numbers)
Merging omap/for-next (be2a54908595 Merge branch 'omap-for-v6.13/drivers' i=
nto tmp/omap-next-20241029.165953)
Merging qcom/for-next (497e81332523 Merge branches 'arm32-for-6.13', 'arm64=
-defconfig-for-6.13', 'arm64-fixes-for-6.12', 'arm64-for-6.13', 'clk-fixes-=
for-6.12', 'clk-for-6.13', 'drivers-fixes-for-6.12' and 'drivers-for-6.13' =
into for-next)
Merging renesas/next (839b15a022b0 Merge branch 'renesas-dts-for-v6.13' int=
o renesas-next)
Merging reset/reset/next (68152eff5240 misc: Silence warning when building =
the LAN966x device tree overlay)
Merging rockchip/for-next (9220a541da2b Merge branch 'v6.13-armsoc/drivers'=
 into for-next)
Merging samsung-krzk/for-next (59a22cf03f67 Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (e8f36daa92b1 Merge branch 'for-next/scmi/updat=
es' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linu=
x into for-linux-next)
Merging sophgo/for-next (128bded4bc52 riscv: sophgo: dts: add power key for=
 pioneer box)
Merging spacemit/for-next (819837584309 Linux 6.12-rc5)
Merging stm32/stm32-next (b0191a5cbc22 arm64: dts: st: add DMA support on S=
PI instances of stm32mp25)
Merging sunxi/sunxi/for-next (16177eb39971 Merge branches 'sunxi/clk-for-6.=
13' and 'sunxi/dt-for-6.13' into sunxi/for-next)
Merging tee/next (9852d85ec9d4 Linux 6.12-rc1)
Merging tegra/for-next (2a4425682b6f Merge branch for-6.13/arm64/dt into fo=
r-next)
Merging thead-dt/thead-dt-for-next (2a3bf75a9408 riscv: dts: thead: remove =
enabled property for spi0)
Merging ti/ti-next (c8fb668e1ea4 Merge branch 'ti-drivers-soc-next' into ti=
-next)
Merging xilinx/for-next (0e355cb69e19 Merge branch 'zynq/soc' into for-next)
Merging clk/clk-next (11713909beb7 Merge branch 'clk-cleanup' into clk-next)
Merging clk-imx/for-next (cf295252f0d8 clk: imx95-blk-ctl: Add one clock ga=
te for HSIO block)
Merging clk-renesas/renesas-clk (e200b06d8eca clk: renesas: r9a08g045: Add =
power domain for RTC)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (73adbd92f322 LoongArch: KVM: Mark hrtimer=
 to expire in hard interrupt context)
Merging m68k/for-next (b90fae5df917 m68k: defconfig: Update defconfigs for =
v6.11-rc1)
Merging m68knommu/for-next (c4e0176b152a m68k: mcfgpio: Fix incorrect regis=
ter offset for CONFIG_M5441x)
Merging microblaze/next (01a9664e0d9f microblaze: Remove empty #ifndef __AS=
SEMBLY__ statement)
Merging mips/mips-next (1aa675538788 MIPS: mobileye: eyeq6h-epm6: Use eyeq6=
h in the board device tree)
Merging openrisc/for-next (4dc70e1aadfa openrisc: Move FPU state out of pt_=
regs)
Merging parisc-hd/for-next (98f7e32f20d2 Linux 6.11)
Merging powerpc/next (bee08a9e6ab0 powerpc: Adjust adding stack protector f=
lags to KBUILD_CLAGS for clang)
Merging risc-v/for-next (075fde581896 Merge patch series "riscv: Userspace =
pointer masking and tagged address ABI")
Merging riscv-dt/riscv-dt-for-next (c8b72c301dbe riscv: dts: starfive: add =
DeepComputing FML13V01 board device tree)
Merging riscv-soc/riscv-soc-for-next (8400291e289e Linux 6.11-rc1)
Merging s390/for-next (ad4c3c461a58 Merge branch 'features' into for-next)
CONFLICT (content): Merge conflict in arch/s390/include/asm/set_memory.h
CONFLICT (content): Merge conflict in arch/s390/mm/pageattr.c
Merging sh/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging sparc/for-next (d21dffe51baa arch/sparc: remove unused varible padd=
rbase in function leon_swprobe())
Merging uml/next (d3b08e5f3f28 um: fix stub exe build with CONFIG_GCOV)
Merging xtensa/xtensa-for-next (b7cf2a1d9881 xtensa: remove redundant flush=
_dcache_page and ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE macros)
Merging fs-next (8c4f6fa04f3d Merge branch 'vfs.all' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/vfs/vfs.git)
Merging printk/for-next (16475a8fd500 Merge branch 'for-6.13' into for-next)
Merging pci/next (87f9a42bd6c1 Merge branch 'pci/misc')
Merging pstore/for-next/pstore (1bf8012fc699 pstore: replace spinlock_t by =
raw_spinlock_t)
Merging hid/for-next (eee425746638 Merge branch 'for-6.13/multitouch' into =
for-next)
Merging i2c/i2c/for-next (3b2af08fadc4 i2c: core: Remove extra space in Mak=
efile)
Merging i2c-host/i2c/i2c-host (cbe0f70d06dd i2c: qcom-cci: Remove the unuse=
d variable cci_clk_rate)
Merging i3c/i3c/next (18599e93e4e8 i3c: master: svc: Fix pm_runtime_set_sus=
pended() with runtime pm enabled)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (893acae4cdaf MAINTAINERS: Remove Aleksand=
r Mezin as NZXT-SMART2 driver maintainer)
Merging jc_docs/docs-next (062d98be0e3f docs/zh_CN: update the translation =
of process/programming-language.rst)
Merging v4l-dvb/next (d020ca11a816 media: samples: v4l2-pci-skeleton.c: dro=
p vb2_ops_wait_prepare/finish)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (e81e2742abb6 Merge branch 'pm-cpufreq' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (1a1374bb8c59 cpufreq: CPPC: Fix=
 possible null-ptr-deref for cppc_get_cpu_cost())
Merging cpupower/cpupower (47d7650b9cb1 cpupower: add checks for xgettext a=
nd msgfmt)
Merging devfreq/devfreq-next (d47552124bb0 PM / devfreq: imx-bus: Use of_pr=
operty_present())
Merging pmdomain/next (da3d242cf169 pmdomain: imx: gpcv2: replace dev_err()=
 with dev_err_probe())
Merging opp/opp/linux-next (53205a790366 dt-bindings: opp: operating-points=
-v2-ti-cpu: Describe opp-supported-hw)
Merging thermal/thermal/linux-next (7d8abc5f3b5c thermal/drivers/imx_sc_the=
rmal: Use dev_err_probe)
Merging rdma/for-next (1103579d6e32 RDMA/efa: Report link speed according t=
o device attributes)
Merging net-next/main (9e114ec80840 net: phy: dp83822: Configure RMII mode =
on DP83825 devices)
CONFLICT (content): Merge conflict in MAINTAINERS
CONFLICT (content): Merge conflict in drivers/net/ethernet/intel/ice/ice_pt=
p_hw.h
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/mv=
m/mld-mac80211.c
CONFLICT (content): Merge conflict in net/mac80211/cfg.c
Merging bpf-next/for-next (fc570de110e2 Merge branch 'bpf-next/net' into fo=
r-next)
Merging ipsec-next/master (ab101c553bc1 neighbour: use kvzalloc()/kvfree())
Merging mlx5-next/mlx5-next (8cf0b93919e1 Linux 6.12-rc2)
Merging netfilter-next/main (08e52cccae11 netfilter: nf_tables: prefer nft_=
trans_elem_alloc helper)
Merging ipvs-next/main (08e52cccae11 netfilter: nf_tables: prefer nft_trans=
_elem_alloc helper)
Merging bluetooth/master (dff8a64238a3 Bluetooth: btrtl: Decrease HCI_OP_RE=
SET timeout from 10 s to 2 s)
  af524ed29eee ("Bluetooth: hci: fix null-ptr-deref in hci_read_supported_c=
odecs")
Merging wireless-next/for-next (2b94751626a6 wifi: cw1200: Fix potential NU=
LL dereference)
Merging ath-next/for-next (cdad73716057 wifi: ath12k: convert tasklet to BH=
 workqueue for CE interrupts)
Merging wpan-next/master (aad4b41a3419 Documentation: ieee802154: fix gramm=
ar)
Merging wpan-staging/staging (aad4b41a3419 Documentation: ieee802154: fix g=
rammar)
Merging mtd/mtd/next (f8470006c4d6 mtd: Switch back to struct platform_driv=
er::remove())
Merging nand/nand/next (af264e598905 mtd: spinand: Constify struct nand_ecc=
_engine_ops)
Merging spi-nor/spi-nor/next (b61c35e34045 mtd: spi-nor: spansion: Use nor-=
>addr_nbytes in octal DTR mode in RD_ANY_REG_OP)
Merging crypto/master (d186faa30764 crypto: starfive - remove unneeded cryp=
to_engine_stop() call)
Merging drm/drm-next (e7103f878550 Merge tag 'amd-drm-next-6.13-2024-10-25'=
 of https://gitlab.freedesktop.org/agd5f/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/amdgpu_s=
mu.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/gma500/Kconfig
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dp=
_mst.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/qxl/Kconfig
CONFLICT (content): Merge conflict in drivers/gpu/drm/tegra/gr3d.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/tiny/bochs.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/regs/xe_gt_regs.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_device.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_ct.c
Merging drm-exynos/for-linux-next (9053b370bfad drm/exynos: remove unused p=
rototype for crtc)
Merging drm-misc/for-linux-next (623b1e4d2eac MAINTAINERS: Remove myself as=
 a VKMS maintainer)
Merging amdgpu/drm-next (ecfe9b237687 drm/amdgpu/smu13: fix profile reporti=
ng)
  0880f58f9609 ("drm/amd/pm: Vangogh: Fix kernel memory out of bounds write=
")
  68bf95317ebf ("Revert "drm/amd/display: update DML2 policy EnhancedPrefet=
chScheduleAccelerationFinal DCN35"")
  ecfe9b237687 ("drm/amdgpu/smu13: fix profile reporting")
Merging drm-intel/for-linux-next (98d2f2530fcc drm/i915: Implement Dbuf ove=
rlap detection feature starting from LNL)
Merging drm-msm/msm-next (4a6fd06643af Merge remote-tracking branch 'drm-mi=
sc/drm-misc-next' into msm-next)
Merging drm-msm-lumag/msm-next-lumag (26d841fd1c15 drm/msm: drop MAX_BRIDGE=
S define)
Merging drm-xe/drm-xe-next (2aff81e039de drm/xe/guc: Fix dereference before=
 NULL check)
Merging etnaviv/etnaviv/next (2c7ac7dd1b6c drm/etnaviv: etnaviv_cmdbuf.c: D=
rop the unneeded include of drm_mm.h)
Merging fbdev/for-next (819837584309 Linux 6.12-rc5)
Merging regmap/for-next (96a54082424d regmap: kunit: Fix repeated test para=
m)
Merging sound/for-next (e3fc2fd77c63 sound: Switch back to struct platform_=
driver::remove())
Merging ieee1394/for-next (b7688fcde3cf firewire: ohci: Replace deprecated =
PCI functions)
Merging sound-asoc/for-next (0d5841310a51 Merge remote-tracking branch 'aso=
c/for-6.13' into asoc-next)
Merging modules/modules-next (6f5eb7b7e202 scripts: Remove export_report.pl)
Merging input/next (b4badee88cd3 Input: imagis - fix warning regarding 'ima=
gis_3038_data' being unused)
Merging block/for-next (74ce5d8d2622 Merge branch 'for-6.13/block' into for=
-next)
Merging device-mapper/for-next (ee07e8f0b3a6 dm: Fix typo in error message)
Merging libata/for-next (5251ae224d8d ata: libata-scsi: Return residual for=
 emulated SCSI commands)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (c61bc45cf10d mmc: sdhci-uhs2: Remove unnecessary variable=
s)
Merging mfd/for-mfd-next (6e31bb8d3a63 mfd: mt6397: Add initial support for=
 MT6328)
Merging backlight/for-backlight-next (0eda30af5880 dt-bindings: backlight: =
Convert zii,rave-sp-backlight.txt to yaml)
Merging battery/for-next (83bce34420ea power: Switch back to struct platfor=
m_driver::remove())
Merging regulator/for-next (3eb0ac2454b8 Merge remote-tracking branch 'regu=
lator/for-6.13' into regulator-next)
Merging security/next (1008010aafe7 Automated merge of 'dev' into 'next')
CONFLICT (content): Merge conflict in kernel/auditsc.c
Merging apparmor/apparmor-next (8400291e289e Linux 6.11-rc1)
Merging integrity/next-integrity (08ae3e5f5fc8 integrity: Use static_assert=
() to check struct sizes)
Merging selinux/next (d7b6918e22c7 selinux: Deprecate /sys/fs/selinux/user)
Merging smack/next (2749749afa07 smackfs: Use rcu_assign_pointer() to ensur=
e safe assignment in smk_set_cipso)
Merging tomoyo/master (ada1986d0797 tomoyo: fallback to realpath if symlink=
's pathname does not exist)
Merging tpmdd/next (0fc810ae3ae1 x86/uaccess: Avoid barrier_nospec() in 64-=
bit copy_from_user())
Merging watchdog/master (9852d85ec9d4 Linux 6.12-rc1)
Merging iommu/next (fd299585bd98 Merge branches 'mediatek', 's390', 'ti/oma=
p', 'riscv' and 'amd/amd-vi' into next)
Merging audit/next (89282beaf75d audit: Use str_yes_no() helper function)
Merging devicetree/for-next (f9759e2b5704 dt-bindings: cache: qcom,llcc: Fi=
x X1E80100 reg entries)
Merging dt-krzk/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging mailbox/for-next (54595f2807d2 mailbox, remoteproc: omap2+: fix com=
pile testing)
Merging spi/for-next (b69ef01da0f2 Merge remote-tracking branch 'spi/for-6.=
13' into spi-next)
Merging tip/master (620a1a078b71 Merge branch into tip/master: 'x86/sev')
CONFLICT (content): Merge conflict in kernel/time/timekeeping.c
Applying: fix up for "cleanup: Adjust scoped_guard() macros to avoid potent=
ial warning"
Merging clockevents/timers/drivers/next (57cbfd333c9d clocksource/drivers/r=
alink: Add Ralink System Tick Counter driver)
Merging edac/edac-for-next (ca07d87bd22c Merge ras/edac-misc into for-next)
Merging ftrace/for-next (e2d4155c95b2 Merge tools/for-next)
Merging rcu/next (596810675feb Merge branches 'rcu/fixes', 'rcu/nocb', 'rcu=
/torture', 'rcu/stall' and 'rcu/srcu' into rcu/dev)
Merging paulmck/non-rcu/next (644cbf77cbcc Merge branches 'csd-lock.2024.10=
.11a' and 'lkmm.2024.10.11a' into HEAD)
Merging kvm/next (5cb1659f4120 Merge branch 'kvm-no-struct-page' into HEAD)
CONFLICT (content): Merge conflict in arch/arm64/kvm/guest.c
Merging kvm-arm/next (25a8556b5400 Merge branch kvm-arm64/misc into kvmarm/=
next)
CONFLICT (content): Merge conflict in arch/arm64/tools/sysreg
Merging kvms390/next (75ec613efa25 KVM: s390: selftests: Add regression tes=
ts for PLO subfunctions)
Merging kvm-ppc/topic/ppc-kvm (8cf0b93919e1 Linux 6.12-rc2)
Merging kvm-riscv/riscv_kvm_next (5bdecd891e50 RISC-V: KVM: Use NACL HFENCE=
s for KVM request based HFENCEs)
Merging kvm-x86/next (e466901b947d Merge branches 'fixes', 'generic', 'misc=
', 'mmu', 'selftests' and 'vmx')
Merging xen-tip/linux-next (5c6808d1a9dd x86/pvh: Avoid absolute symbol ref=
erences in .head.text)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (581434654e01 workqueue: Adjust WQ_MAX_ACTIVE f=
rom 512 to 2048)
Merging sched-ext/for-next (e7733c664232 Merge branch 'for-6.13' into for-n=
ext)
Merging drivers-x86/for-next (f164dd0bf4c6 alienware-wmi: WMAX interface do=
cumentation)
Merging chrome-platform/for-next (ea45f3f46734 platform/chrome: Switch back=
 to struct platform_driver::remove())
Merging chrome-platform-firmware/for-firmware-next (32b0901e141f firmware: =
google: Unregister driver_info on failure)
Merging hsi/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging leds-lj/for-leds-next (99d36eed05e7 leds: bcm6328: Replace divide c=
ondition with comparison for shift value)
Merging ipmi/for-next (2378bd0b264a ipmi: ipmb: Add check devm_kasprintf() =
returned value)
Merging driver-core/driver-core-next (9bd133f05b1d lib: devres: Simplify AP=
I devm_ioport_unmap() implementation)
Merging usb/usb-next (c67e9601e29a usb: core: use sysfs_emit() instead of s=
printf())
CONFLICT (content): Merge conflict in drivers/usb/typec/tcpm/tcpm.c
Merging thunderbolt/next (819837584309 Linux 6.12-rc5)
Merging usb-serial/usb-next (42f7652d3eb5 Linux 6.12-rc4)
Merging tty/tty-next (44059790a5cb kfifo: don't include dma-mapping.h in kf=
ifo.h)
Merging char-misc/char-misc-next (77e835504659 Merge tag 'peci-next-6.13-rc=
1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/iwi/linux into cha=
r-misc-next)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (42f7652d3eb5 Linux 6.12-rc4)
Merging fastrpc/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging fpga/for-next (8de36789bd03 fpga: zynq-fpga: Rename 'timeout' varia=
ble as 'time_left')
Merging icc/icc-next (be9ce6cce0a6 Merge branch 'icc-sar2130p' into icc-nex=
t)
Merging iio/togreg (e2687d072325 iio: imu: bmi270: Add support for BMI260)
Merging phy-next/next (32f4a76b8e7c phy: qcom: qmp: Fix lecacy-legacy typo)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/phy=
/qcom,sc8280xp-qmp-pcie-phy.yaml
Merging soundwire/next (830f1aa53c02 soundwire: cadence: clear MCP BLOCK_WA=
KEUP in init)
Merging extcon/extcon-next (9852d85ec9d4 Linux 6.12-rc1)
Merging gnss/gnss-next (8e929cb546ee Linux 6.12-rc3)
Merging vfio/next (aab439ffa1ca vfio/pci: clean up a type in vfio_pci_ioctl=
_pci_hot_reset_groups())
Merging w1/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging spmi/spmi-next (a5438c7ec212 dt-bindings: spmi: qcom,x1e80100-spmi-=
pmic-arb: Add SAR2130P compatible)
Merging staging/staging-next (0ef2fbdf7d4f staging: vchiq_dev: Drop userdat=
a local pointer)
CONFLICT (modify/delete): drivers/staging/media/omap4iss/iss.c deleted in H=
EAD and modified in staging/staging-next.  Version staging/staging-next of =
drivers/staging/media/omap4iss/iss.c left in tree.
$ git rm -f drivers/staging/media/omap4iss/iss.c
Merging counter-next/counter-next (a3911e087d62 counter: ftm-quaddec: Enabl=
e module autoloading)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (5be63fc19fca Linux 6.11-rc5)
Merging dmaengine/next (8974f34de2ef dmaengine: loongson2-apb: Rename the p=
refix ls2x to loongson2)
Merging cgroup/for-next (0d28736c3193 Merge branch 'for-6.13' into for-next)
Merging scsi/for-next (e5432f520915 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (b92e5937e352 scsi: ufs: core: Move code out of a=
n if-statement)
CONFLICT (content): Merge conflict in drivers/ufs/core/ufs-mcq.c
Merging vhost/linux-next (9d0596c68f32 virtio_net: fix integer overflow in =
stats)
Merging rpmsg/for-next (ad64a7c4a49d remoteproc: Switch back to struct plat=
form_driver::remove())
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (5e3eedf55f13 gpio: mpsse: Check for error =
code from devm_mutex_init() call)
Merging gpio-intel/for-next (12b0e305f509 gpio: acpi: switch to device_for_=
each_child_node_scoped())
Merging pinctrl/for-next (fad9c4ca8e28 Merge fixup)
Merging pinctrl-intel/for-next (ffe624c4130f pinctrl: elkhartlake: Add supp=
ort for DSW community)
Merging pinctrl-renesas/renesas-pinctrl (f407af78c8d3 pinctrl: renesas: rzg=
2l: Use gpiochip_populate_parent_fwspec_twocell helper)
Merging pinctrl-samsung/for-next (6d2dbd4cec89 pinctrl: samsung: Add Exynos=
9810 SoC specific data)
Merging pwm/pwm/for-next (8d51fb0025cf pwm: core: export pwm_get_state_hw())
Merging ktest/for-next (2351e8c65404 ktest.pl: Avoid false positives with g=
rub2 skip regex)
Merging kselftest/next (cecc795329fc selftests: Add a test mangling with uc=
_sigmask)
Merging kunit/test (9852d85ec9d4 Linux 6.12-rc1)
Merging kunit-next/kunit (9852d85ec9d4 Linux 6.12-rc1)
Merging livepatching/for-next (9c66f50477e2 Merge branch 'for-6.13/selftest=
s-kprobe' into for-next)
Merging rtc/rtc-next (0a6efab33eab rtc: cmos: avoid taking rtc_lock for ext=
ended period of time)
Merging nvdimm/libnvdimm-for-next (447b167bb60d nvdimm: Remove dead code fo=
r ENODEV checking in scan_labels())
Merging at24/at24/for-next (339cb28b9ee6 eeprom: at24: add ST M24256E Addit=
ional Write lockable page support)
Merging ntb/ntb-next (c620f56c70eb MAINTAINERS: Update AMD NTB maintainers)
Merging seccomp/for-next/seccomp (8cf8dfceebda seccomp: Stub for !HAVE_ARCH=
_SECCOMP_FILTER)
Merging fsi/next (c5eeb63edac9 fsi: Fix panic on scom file read)
Merging slimbus/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging nvmem/for-next (d0a9fa28b9d7 Merge branch 'nvmem-for-6.13' into nvm=
em-for-next)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (94e86b174d10 tools/hv: Add memory allocation ch=
eck in hv_fcopy_start)
Merging auxdisplay/for-next (0b028ff7e70e auxdisplay: Remove unused functio=
ns)
Merging kgdb/kgdb/for-next (9bccbe7b2087 kdb: Get rid of redundant kdb_curr=
_task())
Merging hmm/hmm (8cf0b93919e1 Linux 6.12-rc2)
Merging cfi/cfi/next (9852d85ec9d4 Linux 6.12-rc1)
Merging mhi/mhi-next (6d61859bbe76 bus: mhi: host: pci_generic: Use pcim_io=
map_region() to request and map MHI BAR)
Merging memblock/for-next (98b7beba1ee6 memblock: uniformly initialize all =
reserved pages to MIGRATE_MOVABLE)
Merging cxl/next (86bcd81d66d6 Merge branch 'cxl/for-6.12/printf' into cxl-=
for-next)
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (63971b0f51fa libstub,tpm: do not ignore failure case when=
 reading final event log)
Merging unicode/for-next (66715f005bde unicode: change the reference of dat=
abase file)
Merging slab/slab/for-next (7534a026aa9d Merge branch 'slab/for-6.13/featur=
es' into slab/for-next)
Merging random/master (d18c13697b4d prandom: Include <linux/percpu.h> in <l=
inux/prandom.h>)
Applying: fix up for "random: Do not include <linux/prandom.h> in <linux/ra=
ndom.h>"
Merging landlock/next (156d775cb9e6 landlock: Optimize scope enforcement)
Merging rust/rust-next (718c4069896c rust: types: extend `Opaque` documenta=
tion)
CONFLICT (content): Merge conflict in rust/kernel/types.rs
Merging sysctl/sysctl-next (9c738dae9534 sysctl: Reduce dput(child) calls i=
n proc_sys_fill_cache())
Merging execve/for-next/execve (bd104872311a selftests/exec: add a test for=
 execveat()'s comm)
Merging bitmap/bitmap-for-next (d7bcc37436c7 lib/test_bits.c: Add tests for=
 GENMASK_U128())
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (0838c9ca0d76 MAINTAINERS: Add kernel hardening =
keywords __counted_by{_le|_be})
Merging kspp-gustavo/for-next/kspp (6613476e225e Linux 6.8-rc1)
Merging nolibc/nolibc (9852d85ec9d4 Linux 6.12-rc1)
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (0bcceb1f51c7 iommufd: Selftest coverage for IOMMU=
_IOAS_MAP_FILE)
Merging turbostat/next (a119348cb685 tools/power turbostat: Honor --show CP=
U, even when even when num_cpus=3D1)
Merging pwrseq/pwrseq/for-next (bd4c8bafcf50 power: sequencing: qcom-wcn: i=
mprove support for wcn6855)
Merging capabilities-next/caps-next (de2433c608c2 capabilities: remove cap_=
mmap_file())
Merging ipe/next (d881f0eb6f23 scripts: ipe: polgen: remove redundant close=
 and error exit path)
Merging kcsan/next (b86f7c9fad06 kcsan: Remove redundant call of kallsyms_l=
ookup_name())
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)

--Sig_/H7GEZAAhAuRjSn6Ek5lxuov
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmckc4sACgkQAVBC80lX
0GyqqggAiQvuoBWpqB5ZW8t0T+PjVs/mYucObWUswojOWatmd7bl64qgd7iLyezN
pA8kmxBgE8BgCiDG7iSUU9Z+PZQ56Btuy7UiNk5u3XgR9AtmHGuuJrAzz38X0jBz
y+modReNELefPA83IlyrUY0La+EFijRzKBNNFzlvuElZwu/4FR8P7uFq173S+hSV
tgO2MAaZ1yiIMGIn5IeBOFkne93LBX1wqhi37b73TNP6IIO76ZnvO5CUbXdusUxm
+CGZ5mSv+8oom4WnmK6wrvCBS0pkAbag82lrVM7NWMIPajtzs0LLcHGhpJquO4hC
SbCO7WTkfufb2ft0MDEZjGB+fNW5wQ==
=8dX/
-----END PGP SIGNATURE-----

--Sig_/H7GEZAAhAuRjSn6Ek5lxuov--

