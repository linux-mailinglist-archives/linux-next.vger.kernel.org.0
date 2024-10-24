Return-Path: <linux-next+bounces-4411-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C359ADBAD
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 07:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A012DB2214B
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 05:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B5D172BDF;
	Thu, 24 Oct 2024 05:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LDolVXJr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E3B1714CA;
	Thu, 24 Oct 2024 05:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729749137; cv=none; b=QGVSe3vmNynOgGuqJNQ/drmpEVuJSarkRkaMI7x1SUEsm/3/4yi4Wchybva4mODhXjsZl+zGhOT5fsEH8Kpuytmpoh2xbH6oL2rYI/0pUBKyanceV61i3loP4RDSt3qeJDWqHu/UvF9xxN4kcF7FQ4zpqMKKYpAEDk7IhxQga1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729749137; c=relaxed/simple;
	bh=UvoidnXWjcqUK/ab8qQewg7vwDL161jF3zLDtxK64ao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qkq6oJ2YXaLfZMkeijcgAXV9Qyht8ih5zIwY+GqvA4YcID7geBUG+DD0lTPLbvcMjKUKz33kko57wqWgpQ84V9tbXvGm3Ms1MpagD1aNRBSusrPF+ptEySFjPmij2ZO19RzG9J/edT03F9IiK0omgYJ4cMAc2fqbwrAwUPQAy6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LDolVXJr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729749126;
	bh=lCrFPHENLgwj0DTWJnu++pxdC3NM5jLznkgseUwcWng=;
	h=Date:From:To:Cc:Subject:From;
	b=LDolVXJr8DxkH4BaztHbTrKdfustferUz1KiSQtROXEDEvhLv2s7ZAtzeLDIjvxeb
	 wuLMMhUgz5BgJR32azYXpZ0wKyNq77ripoqNddjt7e/JAxY4B1W2jF7wWLUykM845R
	 aGUkFQjfAamHClIr4fr+iD0A9fzZqVcKC3QVaiO7PSwxDv+Xs4Wr5cxypX+SXn7vBc
	 QfarvKRQZ42K+Lncgy1/dpb4u/6ukLAzwQAqeB2w2yJCAl8bBFg0TXRDUyx6IBvw2G
	 I/0BtHMWNtQtNonXkxqGE16WpCqK94KgdKKxh8ZDk2Ng5UJhCj74B6ZFHrO5peCkZp
	 HqpXXAKZOnbVw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XYw6G1pt3z4w2L;
	Thu, 24 Oct 2024 16:52:06 +1100 (AEDT)
Date: Thu, 24 Oct 2024 16:52:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 24
Message-ID: <20241024165206.797d265b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0GoZ+iuG.GaCYRdW6lqjy_9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0GoZ+iuG.GaCYRdW6lqjy_9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20241023:

The btrfs tree gained a build failure so I used the version from
next-20241023.

The vfs-brauner tree gained a conflict against the nfsd tree.  Also,
I reverted a commit this was identified as causing runtime problems.

The arm64 tree gained a conflict against the mm tree.

The pci tree gained a conflict against the pci-current tree.

The wireless-next tree gained a conflict against the wireless tree.

The memblock tree lost its boot failure.

Non-merge commits (relative to Linus' tree): 6079
 8132 files changed, 275077 insertions(+), 226136 deletions(-)

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

I am currently merging 379 trees (counting Linus' and 141 trees of bug
fix patches pending for the current merge release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Status of my local build tests will be at
http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
advice about cross compilers/configs that work, we are always open to add
more builds.

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--=20
Cheers,
Stephen Rothwell

$ git checkout master
$ git reset --hard stable
Merging origin/master (c2ee9f594da8 KVM: selftests: Fix build on on non-x86=
 architectures)
Merging fixes/fixes (87d6aab2389e Merge tag 'for_linus' of git://git.kernel=
.org/pub/scm/linux/kernel/git/mst/vhost)
Merging vfs-brauner-fixes/vfs.fixes (35100ae2dc33 Merge patch series "fs/su=
per.c: introduce get_tree_bdev_flags()")
Merging fscrypt-current/for-current (8e929cb546ee Linux 6.12-rc3)
Merging fsverity-current/for-current (8e929cb546ee Linux 6.12-rc3)
Merging btrfs-fixes/next-fixes (f4f3174095a9 Merge branch 'misc-6.12' into =
next-fixes)
Merging vfs-fixes/fixes (678379e1d4f7 close_range(): fix the logics in desc=
riptor table trimming)
Merging erofs-fixes/fixes (ae54567eaa87 erofs: get rid of kaddr in `struct =
z_erofs_maprecorder`)
Merging nfsd-fixes/nfsd-fixes (d5ff2fb2e716 nfsd: cancel nfsd_shrinker_work=
 using sync mode in nfs4_state_shutdown_net)
Merging v9fs-fixes/fixes/next (684a64bf32b6 Merge tag 'nfs-for-6.12-1' of g=
it://git.linux-nfs.org/projects/anna/linux-nfs)
Merging overlayfs-fixes/ovl-fixes (77a28aa47687 ovl: relax WARN_ON in ovl_v=
erify_area())
Merging bcachefs/for-next (18072677d4ae bcachefs: Fix warning about passing=
 flex array member by value)
Merging fscrypt/for-next (8e929cb546ee Linux 6.12-rc3)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (954cd9e5cec6 Merge branch 'for-next-next-v6.12-2024=
1023' into for-next-20241023)
$ git reset --hard HEAD^
Merging next-20241023 version of btrfs
Merging ceph/master (ccda9910d849 ceph: fix cap ref leak via netfs init_req=
uest)
Merging cifs/for-next (2ce1007f42b8 cifs: fix warning when destroy 'cifs_io=
_request_pool')
Merging configfs/for-next (4425c1d9b44d configfs: improve item creation per=
formance)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (dfe5a6cc4204 dlm: make add_to_waiters() that it can't fai=
l)
Merging erofs/dev (0632723b5978 erofs: add SEEK_{DATA,HOLE} support)
Merging exfat/dev (cb7d85014fb1 MAINTAINERS: exfat: add myself as reviewer)
Merging exportfs/exportfs-next (98f7e32f20d2 Linux 6.11)
Merging ext3/for_next (6cb3f5ca9e44 Merge dropping of reiserfs)
Merging ext4/dev (6121258c2b33 ext4: fix off by one issue in alloc_flex_gd(=
))
Merging f2fs/dev (eca631b8fe80 Merge tag 'f2fs-6.12-rc4' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/jaegeuk/f2fs)
Merging fsverity/for-next (8e929cb546ee Linux 6.12-rc3)
Merging fuse/for-next (0188fc384f3f fuse: convert fuse_notify_store to use =
folios)
Merging gfs2/for-next (8dcf0d453811 gfs2: Flush glock work queue on inode l=
ookup / create)
Merging jfs/jfs-next (67373ca8404f jfs: Fix sanity check in dbMount)
Merging ksmbd/ksmbd-for-next (9f635d44d766 Merge tag 'v6.12-rc3-ksmbd-fixes=
' of git://git.samba.org/ksmbd)
Merging nfs/linux-next (42f7652d3eb5 Linux 6.12-rc4)
Merging nfs-anna/linux-next (7ef60108069b NFS: remove revoked delegation fr=
om server's delegation list)
Merging nfsd/nfsd-next (6e99e4b4291e nfsd: disallow file locking and delega=
tions for NFSv4 reexport)
Merging ntfs3/master (8e929cb546ee Linux 6.12-rc3)
Merging orangefs/for-next (96319dacaf15 orangefs: Constify struct kobj_type)
Merging overlayfs/overlayfs-next (2d66a7cea561 ovl: convert ovl_real_fdget(=
) callers to ovl_real_file())
Merging ubifs/next (92a286e90203 ubi: Fix ubi_init() ubiblock_exit() sectio=
n mismatch)
Merging v9fs/9p-next (79efebae4afc 9p: Avoid creating multiple slab caches =
with the same name)
Merging v9fs-ericvh/ericvh/for-next (684a64bf32b6 Merge tag 'nfs-for-6.12-1=
' of git://git.linux-nfs.org/projects/anna/linux-nfs)
Merging xfs/for-next (4a201dcfa1ff xfs: update the pag for the last AG at r=
ecovery time)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging file-locks/locks-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6-=
mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging iversion/iversion-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6=
-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging vfs-brauner/vfs.all (faa0ca355ebd Merge branch 'vfs.usercopy' into =
vfs.all Signed-off-by: Christian Brauner <brauner@kernel.org>)
CONFLICT (content): Merge conflict in fs/btrfs/file.c
CONFLICT (content): Merge conflict in include/linux/exportfs.h
Applying: Revert "vfs: Fix implicit conversion problem when testing overflo=
w case"
Merging vfs/for-next (8f602276d390 Merge tag 'bcachefs-2024-10-05' of git:/=
/evilpiepirate.org/bcachefs)
Merging mm-hotfixes/mm-hotfixes-unstable (9228b1e93524 mm/gup: memfd: stop =
leaking pinned pages in low memory conditions)
CONFLICT (content): Merge conflict in mm/memory.c
Merging fs-current (589304813786 Merge branch 'nfsd-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/cel/linux)
Merging kbuild-current/fixes (4b60a5655528 sumversion: Fix a memory leak in=
 get_src_version())
Merging arc-current/for-curr (bb5d272ed94d ARC: build: Use __force to suppr=
ess per-CPU cmpxchg warnings)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (c83212d79be2 firmware: arm_sdei: Fix th=
e input parameter of cpuhp_remove_state())
Merging arm-soc-fixes/arm/fixes (1b59d6c19c2c Merge tag 'scmi-fixes-6.12' o=
f https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into a=
rm/fixes)
Merging davinci-current/davinci/for-current (9852d85ec9d4 Linux 6.12-rc1)
Merging drivers-memory-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging sophgo-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging m68k-current/for-linus (b90fae5df917 m68k: defconfig: Update defcon=
figs for v6.11-rc1)
Merging powerpc-fixes/fixes (cf8989d20d64 powerpc/powernv: Free name on err=
or in opal_event_init())
Merging s390-fixes/fixes (b4fa00fd428b s390: Update defconfigs)
Merging net/main (6e62807c7fbb posix-clock: posix-clock: Fix unbalanced loc=
king in pc_clock_settime())
Merging bpf/master (0ee288e69d03 bpf,perf: Fix perf_event_detach_bpf_prog e=
rror handling)
Merging ipsec/master (6889cd2a93e1 xfrm: fix one more kernel-infoleak in al=
go dumping)
Merging netfilter/main (306ed1728e84 netfilter: xtables: fix typo causing s=
ome targets not to load on IPv6)
Merging ipvs/main (1230fe7ad397 netfilter: bpf: must hold reference on net =
namespace)
Merging wireless/for-next (a940b3a1ad0f Merge tag 'ath-current-20241016' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath)
Merging ath/for-current (befd716ed429 wifi: ath11k: Fix invalid ring usage =
in full monitor mode)
Merging wpan/master (09573b1cc76e net: ieee802154: mcr20a: Use IRQF_NO_AUTO=
EN flag in request_irq())
Merging rdma-fixes/for-rc (76d3ddff7153 RDMA/bnxt_re: synchronize the qp-ha=
ndle table array)
Merging sound-current/for-linus (e3ea2757c312 ALSA: hda/realtek: Update def=
ault depop procedure)
Merging sound-asoc-fixes/for-linus (db7e59e6a39a ASoC: qcom: sc7280: Fix mi=
ssing Soundwire runtime stream alloc)
Merging regmap-fixes/for-linus (8cf0b93919e1 Linux 6.12-rc2)
Merging regulator-fixes/for-linus (8e929cb546ee Linux 6.12-rc3)
Merging spi-fixes/for-linus (d0ccf760a405 spi: geni-qcom: Fix boot warning =
related to pm_runtime and devres)
Merging pci-current/for-linus (ad783b9f8e78 PCI/pwrctl: Abandon QCom WCN pr=
obe on pre-pwrseq device-trees)
Merging driver-core.current/driver-core-linus (8e929cb546ee Linux 6.12-rc3)
Merging tty.current/tty-linus (42f7652d3eb5 Linux 6.12-rc4)
Merging usb.current/usb-linus (42f7652d3eb5 Linux 6.12-rc4)
Merging usb-serial-fixes/usb-linus (6d951576ee16 USB: serial: option: add T=
elit FN920C04 MBIM compositions)
Merging phy/fixes (e70d2677ef40 phy: tegra: xusb: Add error pointer check i=
n xusb.c)
Merging staging.current/staging-linus (807babf69027 staging: vchiq_arm: Use=
 devm_kzalloc() for drv_mgmt allocation)
Merging iio-fixes/fixes-togreg (8b713014fc90 iio: adc: ad7124: fix division=
 by zero in ad7124_set_channel_odr())
Merging counter-current/counter-current (9852d85ec9d4 Linux 6.12-rc1)
Merging char-misc.current/char-misc-linus (42f7652d3eb5 Linux 6.12-rc4)
Merging soundwire-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging thunderbolt-fixes/fixes (3cea8af2d1a9 thunderbolt: Honor TMU requir=
ements in the domain when setting TMU mode)
Merging input-current/for-linus (2de01e0e57f3 Input: zinitix - don't fail i=
f linux,keycodes prop is absent)
Merging crypto-current/master (cd843399d706 crypto: lib/mpi - Fix an "Unini=
tialized scalar variable" issue)
Merging vfio-fixes/for-linus (5a88a3f67e37 vfio/pci: Init the count variabl=
e in collecting hot-reset devices)
Merging kselftest-fixes/fixes (fe05c40ca9c1 selftest: hid: add the missing =
tests directory)
Merging dmaengine-fixes/fixes (83158a3a712a dmaengine: ti: edma: Check retu=
rn value of of_dma_controller_register)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging mfd-fixes/for-mfd-fixes (68f860426d50 mfd: axp20x: AXP717: Fix miss=
ing IRQ status registers range)
Merging v4l-dvb-fixes/fixes (ba9cf6b43043 media: pulse8-cec: fix data times=
tamp at pulse8_setup())
Merging reset-fixes/reset/fixes (2cf596636607 reset: starfive: jh71x0: Fix =
accessing the empty member on JH7110 SoC)
Merging mips-fixes/mips-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging at91-fixes/at91-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging omap-fixes/fixes (5062d9c0cbbc ARM: dts: omap3-n900: correct the ac=
celerometer orientation)
Merging kvm-fixes/master (e9001a382fa2 Merge tag 'kvmarm-fixes-6.12-3' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvms390-fixes/master (cff59d8631e1 s390/uv: Panic for set and remov=
e shared access UVC errors)
Merging hwmon-fixes/hwmon (eabb03810194 [PATCH} hwmon: (jc42) Properly dete=
ct TSE2004-compliant devices again)
Merging nvdimm-fixes/libnvdimm-fixes (d5240fa65db0 nvdimm/pmem: Set dax fla=
g for all 'PFN_MAP' cases)
Merging cxl-fixes/fixes (ee1e3c46ed19 EINJ, CXL: Fix CXL device SBDF calcul=
ation)
Merging dma-mapping-fixes/for-linus (78b2770c935f dma-mapping: fix tracing =
dma_alloc/free with vmalloc'd memory)
Merging drivers-x86-fixes/fixes (2fae3129c0c0 platform/x86: x86-android-tab=
lets: Fix use after free on platform_device_register() errors)
Merging samsung-krzk-fixes/fixes (a03c246d4ec8 clk: samsung: Fix out-of-bou=
nd access of of_match_node())
Merging pinctrl-samsung-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging devicetree-fixes/dt/linus (6e0391e48cf9 of: Skip kunit tests when a=
rm64+ACPI doesn't populate root node)
Merging dt-krzk-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging scsi-fixes/fixes (fca6caeb4a61 scsi: target: core: Fix null-ptr-der=
ef in target_alloc_device())
Merging drm-fixes/drm-fixes (42f7652d3eb5 Linux 6.12-rc4)
Merging drm-intel-fixes/for-linux-next-fixes (338b655a1178 i915: fix DRM_I9=
15_GVT_KVMGT dependencies)
Merging mmc-fixes/fixes (8e929cb546ee Linux 6.12-rc3)
Merging rtc-fixes/rtc-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging gnss-fixes/gnss-linus (8e929cb546ee Linux 6.12-rc3)
Merging hyperv-fixes/hyperv-fixes (895384881ec9 hv: vmbus: Constify struct =
kobj_type and struct attribute_group)
Merging risc-v-fixes/fixes (c05ad457ce8c riscv: Use '%u' to format the outp=
ut of 'cpu')
Merging riscv-dt-fixes/riscv-dt-fixes (7d9d88890f04 MAINTAINERS: invert Mis=
c RISC-V SoC Support's pattern)
Merging riscv-soc-fixes/riscv-soc-fixes (825bb69228c8 riscv: dts: starfive:=
 Update ethernet phy0 delay parameter values for Star64)
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (47ac09b91bef Linux 6.11-rc4)
Merging gpio-brgl-fixes/gpio/for-current (7e336a6c15ec MAINTAINERS: add a k=
eyword entry for the GPIO subsystem)
Merging gpio-intel-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging pinctrl-intel-fixes/fixes (42f7652d3eb5 Linux 6.12-rc4)
Merging auxdisplay-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging kunit-fixes/kunit-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging memblock-fixes/fixes (8043832e2a12 memblock: use numa_valid_node() =
helper to check for invalid node ID)
Merging renesas-fixes/fixes (8c987693dc2d ARM: dts: renesas: rcar-gen2: Add=
 missing #interrupt-cells to DA9063 nodes)
Merging perf-current/perf-tools (e934a35e3cc1 perf cs-etm: Fix the assert()=
 to handle captured and unprocessed cpu trace)
Merging efi-fixes/urgent (ae835a96d72c x86/efistub: Revert to heap allocate=
d boot_params for PE entrypoint)
Merging zstd-fixes/zstd-linus (77618db34645 zstd: Fix array-index-out-of-bo=
unds UBSAN warning)
Merging battery-fixes/fixes (7c626ce4bae1 Linux 6.11-rc3)
Merging iommufd-fixes/for-rc (9852d85ec9d4 Linux 6.12-rc1)
Merging rust-fixes/rust-fixes (42f7652d3eb5 Linux 6.12-rc4)
Merging w1-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging pmdomain-fixes/fixes (7738568885f2 PM: domains: Fix alloc/free in d=
ev_pm_domain_attach|detach_list())
Merging i2c-host-fixes/i2c/i2c-host-fixes (8e929cb546ee Linux 6.12-rc3)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (6b5cca7868fd clk: test: Fix some memory leaks)
Merging pwrseq-fixes/pwrseq/for-current (9852d85ec9d4 Linux 6.12-rc1)
Merging thead-dt-fixes/thead-dt-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging drm-misc-fixes/for-linux-next-fixes (5c2387825251 drm/bridge: tc358=
767: fix missing of_node_put() in for_each_endpoint_of_node())
Merging mm-stable/mm-stable (42f7652d3eb5 Linux 6.12-rc4)
Merging mm-nonmm-stable/mm-nonmm-stable (42f7652d3eb5 Linux 6.12-rc4)
Merging mm/mm-everything (a8883372ec25 foo)
Merging kbuild/for-next (7e04fcfc6195 kconfig: qconf: simplify character re=
placement)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (36fae9f93e5f perf test: Add precise_max subte=
st to the perf record shell test)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/for-next (bfc4a245a794 dma-mapping: fix DMA API tracing=
 for chained scatterlists)
Merging asm-generic/master (f822712a2c69 UAPI/ioctl: Improve parameter name=
 of ioctl request definition helpers)
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (9016915e3c5f Merge branches 'amba', 'fixes' and 'misc=
' into for-next)
Merging arm64/for-next/core (47c8cf3c9853 Merge branches 'for-next/misc' an=
d 'for-next/kselftest' into for-next/core)
CONFLICT (content): Merge conflict in arch/arm64/mm/pageattr.c
Merging arm-perf/for-next/perf (cc8476789983 drivers perf: remove unused fi=
eld pmu_node)
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
Merging mediatek/for-next (bca140199160 Merge branches 'v6.12-next/soc', 'v=
6.12-next/dts32' and 'v6.12-next/dts64' into for-next)
Merging mvebu/for-next (841dd5b122b4 arm64: dts: marvell: cn9130-sr-som: fi=
x cp0 mdio pin numbers)
Merging omap/for-next (f45840d172a0 Merge branch 'omap-for-v6.13/drivers' i=
nto tmp/omap-next-20241004.145243)
Merging qcom/for-next (7f5fccf1b4b9 Merge branches 'arm32-for-6.13', 'arm64=
-defconfig-for-6.13', 'arm64-fixes-for-6.12', 'arm64-for-6.13', 'clk-fixes-=
for-6.12', 'clk-for-6.13', 'drivers-fixes-for-6.12' and 'drivers-for-6.13' =
into for-next)
Merging renesas/next (9c520ac4bc1c Merge branch 'renesas-dts-for-v6.13' int=
o renesas-next)
Merging reset/reset/next (c0260e2b0ed8 reset: uniphier-glue: Use devm_reset=
_control_bulk_get_shared_deasserted())
Merging rockchip/for-next (fcd12287f772 Merge branch 'v6.12-armsoc/dtsfixes=
' into for-next)
Merging samsung-krzk/for-next (9bb31db10558 Merge branch 'next/clk' into fo=
r-next)
Merging scmi/for-linux-next (a7e883b61d8d Merge branch 'for-next/scmi/updat=
es' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linu=
x into for-linux-next)
Merging sophgo/for-next (128bded4bc52 riscv: sophgo: dts: add power key for=
 pioneer box)
Merging stm32/stm32-next (b14c9f6bd0ba ARM: dts: stm32: Use SAI to generate=
 bit and frame clock on STM32MP15xx DHCOM PDK2)
Merging sunxi/sunxi/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging tee/next (9852d85ec9d4 Linux 6.12-rc1)
Merging tegra/for-next (b281b04fd504 Merge branch for-6.13/arm64/dt into fo=
r-next)
Merging thead-dt/thead-dt-for-next (2a3bf75a9408 riscv: dts: thead: remove =
enabled property for spi0)
Merging ti/ti-next (30a9a1a26b95 arm64: dts: ti: k3-am64: Add ti,pa-stats p=
roperty)
Merging xilinx/for-next (0e355cb69e19 Merge branch 'zynq/soc' into for-next)
Merging clk/clk-next (1c9321b6f3c6 Merge branch 'clk-kunit' into clk-next)
Merging clk-imx/for-next (cf295252f0d8 clk: imx95-blk-ctl: Add one clock ga=
te for HSIO block)
Merging clk-renesas/renesas-clk (92850bed9d4d clk: renesas: r8a779h0: Drop =
CLK_PLL2_DIV2 to clarify ZCn clocks)
Merging csky/linux-next (2c40c1c6adab Merge tag 'usb-6.7-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging loongarch/loongarch-next (73adbd92f322 LoongArch: KVM: Mark hrtimer=
 to expire in hard interrupt context)
Merging m68k/for-next (b90fae5df917 m68k: defconfig: Update defconfigs for =
v6.11-rc1)
Merging m68knommu/for-next (ca4babb6e3ea m68k: mcfgpio: Fix incorrect regis=
ter offset for CONFIG_M5441x)
Merging microblaze/next (badf752b5e4b microblaze: Export xmb_manager functi=
ons)
Merging mips/mips-next (9852d85ec9d4 Linux 6.12-rc1)
Merging openrisc/for-next (4dc70e1aadfa openrisc: Move FPU state out of pt_=
regs)
Merging parisc-hd/for-next (98f7e32f20d2 Linux 6.11)
Merging powerpc/next (0882db7f928c Merge branch 'topic/vdso' into next)
Merging risc-v/for-next (77270206955d Merge patch series "cpuidle: riscv-sb=
i: Allow cpuidle pd used by other devices")
Merging riscv-dt/riscv-dt-for-next (7cf3e9bfc63d dt-bindings: vendor-prefix=
es: add spacemit)
Merging riscv-soc/riscv-soc-for-next (8400291e289e Linux 6.11-rc1)
Merging s390/for-next (cde6d9d63b06 Merge branch 'features' into for-next)
Merging sh/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging sparc/for-next (d21dffe51baa arch/sparc: remove unused varible padd=
rbase in function leon_swprobe())
Merging uml/next (3f17fed21491 um: switch to regset API and depend on XSTAT=
E)
Merging xtensa/xtensa-for-next (b7cf2a1d9881 xtensa: remove redundant flush=
_dcache_page and ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE macros)
Merging fs-next (a8958c4fafb5 Merge branch 'vfs.all' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/vfs/vfs.git)
Merging printk/for-next (16475a8fd500 Merge branch 'for-6.13' into for-next)
Merging pci/next (912bf26eced7 Merge branch 'pci/misc')
CONFLICT (content): Merge conflict in drivers/pci/pwrctl/pci-pwrctl-pwrseq.c
Merging pstore/for-next/pstore (1bf8012fc699 pstore: replace spinlock_t by =
raw_spinlock_t)
Merging hid/for-next (e9a6e717706b Merge branch 'for-6.13/bpf' into for-nex=
t)
Merging i2c/i2c/for-next (3b2af08fadc4 i2c: core: Remove extra space in Mak=
efile)
Merging i2c-host/i2c/i2c-host (d94f6dd6a28e i2c: Drop legacy muxing pseudo-=
drivers)
Merging i3c/i3c/next (9852d85ec9d4 Linux 6.12-rc1)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (516ddbfef736 hwmon: (nct6775) Add 665-ACE=
/600M-CL to ASUS WMI monitoring list)
Merging jc_docs/docs-next (56aaee3915b3 docs/zh_CN: Add a entry in Chinese =
glossary)
Merging v4l-dvb/next (698b6e3163ba media: atomisp: Replace ternary operator=
 with if)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (63784b1b1e73 Merge branch 'thermal-core' into linux-=
next)
Merging cpufreq-arm/cpufreq/arm/linux-next (5f856d71ccdf cpufreq: loongson2=
: Unregister platform_driver on failure)
Merging cpupower/cpupower (47d7650b9cb1 cpupower: add checks for xgettext a=
nd msgfmt)
Merging devfreq/devfreq-next (d47552124bb0 PM / devfreq: imx-bus: Use of_pr=
operty_present())
Merging pmdomain/next (5f3af784b402 pmdomain: ti-sci: set the GENPD_FLAG_AC=
TIVE_WAKEUP flag for all PM domains)
Merging opp/opp/linux-next (53205a790366 dt-bindings: opp: operating-points=
-v2-ti-cpu: Describe opp-supported-hw)
Merging thermal/thermal/linux-next (7d8abc5f3b5c thermal/drivers/imx_sc_the=
rmal: Use dev_err_probe)
Merging rdma/for-next (48931f65e9f7 RDMA/efa: Add option to set QP service =
level on create)
Merging net-next/main (d05596f24857 Merge branch 'net-pcs-xpcs-yet-more-cle=
anups')
Merging bpf-next/for-next (81a132b299d5 Merge branch 'bpf-next/master' into=
 for-next)
CONFLICT (content): Merge conflict in tools/testing/selftests/bpf/Makefile
Merging ipsec-next/master (83c289e81e88 net/sched: act_api: unexport tcf_ac=
tion_dump_1())
Merging mlx5-next/mlx5-next (8cf0b93919e1 Linux 6.12-rc2)
Merging netfilter-next/main (08e52cccae11 netfilter: nf_tables: prefer nft_=
trans_elem_alloc helper)
Merging ipvs-next/main (08e52cccae11 netfilter: nf_tables: prefer nft_trans=
_elem_alloc helper)
Merging bluetooth/master (fb4560832d4c Bluetooth: ISO: Fix UAF on iso_sock_=
timeout)
Merging wireless-next/for-next (eaed5fc0c322 mac80211: Remove NOP call to i=
eee80211_hw_config)
CONFLICT (content): Merge conflict in Documentation/networking/net_cachelin=
es/net_device.rst
CONFLICT (content): Merge conflict in net/mac80211/cfg.c
Merging ath-next/for-next (f7b982d13df7 wifi: ath12k: fix A-MSDU indication=
 in monitor mode)
Merging wpan-next/master (ac49b950bea9 dt-bindings: net: add Microchip's LA=
N865X 10BASE-T1S MACPHY)
Merging wpan-staging/staging (ac49b950bea9 dt-bindings: net: add Microchip'=
s LAN865X 10BASE-T1S MACPHY)
Merging mtd/mtd/next (f8470006c4d6 mtd: Switch back to struct platform_driv=
er::remove())
Merging nand/nand/next (af264e598905 mtd: spinand: Constify struct nand_ecc=
_engine_ops)
Merging spi-nor/spi-nor/next (afe1ea1344bb mtd: spi-nor: add support for Ma=
cronix Octal flash)
Merging crypto/master (0a53948477ca crypto: crypto4xx - use devm in probe)
Merging drm/drm-next (0a4d0b2d9d84 Merge tag 'drm-xe-next-2024-10-17' of ht=
tps://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dp=
_mst.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/tegra/gr3d.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/regs/xe_gt_regs.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_ct.c
Merging drm-exynos/for-linux-next (9053b370bfad drm/exynos: remove unused p=
rototype for crtc)
Merging drm-misc/for-linux-next (91e21479c81d drm/panel: s6e3ha8: add stati=
c modifier to supply list)
Merging amdgpu/drm-next (1cdd67510e54 drm/amdgpu: handle default profile on=
 on devices without fullscreen 3D)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dc_typ=
es.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/amdgpu_s=
mu.c
Merging drm-intel/for-linux-next (69cb729ec121 drm/i915/xe3lpd: Add conditi=
on for EDP to powerdown P2.PG)
Merging drm-msm/msm-next (1fac1fa4a675 Merge branch 'msm-fixes' into msm-ne=
xt)
Merging drm-msm-lumag/msm-next-lumag (2261751d5f22 drm/msm/dpu: sync mode_c=
onfig limits to the FB limits in dpu_plane.c)
Merging drm-xe/drm-xe-next (85d3f9e84e06 drm/xe/oa: Allow only certain prop=
erty changes from config)
Merging etnaviv/etnaviv/next (704d3d60fec4 drm/etnaviv: don't block schedul=
er when GPU is still active)
Merging fbdev/for-next (51521d2e2c35 fbdev: wm8505fb: select CONFIG_FB_IOME=
M_FOPS)
Merging regmap/for-next (c2288599691c regmap: Merge up v6.12-rc2)
Merging sound/for-next (52345d356220 ALSA: hda: Fix all stream interrupts d=
efinition)
Merging ieee1394/for-next (8f04019d71cb firewire: Correct some typos)
Merging sound-asoc/for-next (e25169fb5a8c Merge remote-tracking branch 'aso=
c/for-6.13' into asoc-next)
Merging modules/modules-next (2295cf87ed5a module: Reformat struct for code=
 style)
Merging input/next (92a22842ecd8 Input: userio - remove unneeded semicolon)
Merging block/for-next (071d6789e4ec Merge branch 'for-6.13/block' into for=
-next)
Merging device-mapper/for-next (29e11586b56a dm vdo: Remove unused uds_comp=
ute_index_size)
Merging libata/for-next (08b64eeee4d6 ata: libata-scsi: Refactor scsi_6_lba=
_len() with use of get_unaligned_be24())
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (328bda09cc91 mmc: mmc_spi: drop buggy snprintf())
Merging mfd/for-mfd-next (38d09a34b422 dt-bindings: mfd: Convert zii,rave-s=
p.txt to yaml format)
Merging backlight/for-backlight-next (0eda30af5880 dt-bindings: backlight: =
Convert zii,rave-sp-backlight.txt to yaml)
Merging battery/for-next (83bce34420ea power: Switch back to struct platfor=
m_driver::remove())
Merging regulator/for-next (d1bc2d5cca43 regulator: doc: remove documentati=
on comment for regulator_init)
Merging security/next (fff120470cb6 Automated merge of 'dev' into 'next')
CONFLICT (content): Merge conflict in kernel/auditsc.c
CONFLICT (content): Merge conflict in security/lsm_audit.c
Merging apparmor/apparmor-next (8400291e289e Linux 6.11-rc1)
Merging integrity/next-integrity (08ae3e5f5fc8 integrity: Use static_assert=
() to check struct sizes)
Merging selinux/next (d7b6918e22c7 selinux: Deprecate /sys/fs/selinux/user)
Merging smack/next (2749749afa07 smackfs: Use rcu_assign_pointer() to ensur=
e safe assignment in smk_set_cipso)
Merging tomoyo/master (ada1986d0797 tomoyo: fallback to realpath if symlink=
's pathname does not exist)
Merging tpmdd/next (2f87d0916ce0 Merge tag 'trace-ringbuffer-v6.12-rc3' of =
git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace)
Merging watchdog/master (9852d85ec9d4 Linux 6.12-rc1)
Merging iommu/next (acbec6fa25b5 Merge branches 'fixes', 's390', 'amd/amd-v=
i' and 'core' into next)
Merging audit/next (89282beaf75d audit: Use str_yes_no() helper function)
Merging devicetree/for-next (2e030910fa90 of: module: remove strlen() call =
in of_modalias())
Merging dt-krzk/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging mailbox/for-next (54595f2807d2 mailbox, remoteproc: omap2+: fix com=
pile testing)
Merging spi/for-next (949fe8b6e938 Merge remote-tracking branch 'spi/for-6.=
13' into spi-next)
Merging tip/master (94559bac4d40 Merge branch into tip/master: 'x86/sev')
Merging clockevents/timers/drivers/next (d7a87891e2f5 platform/x86:intel/pm=
c: fix build regression with pmtimer turned off)
CONFLICT (content): Merge conflict in include/linux/delay.h
CONFLICT (add/add): Merge conflict in kernel/time/sleep_timeout.c
Merging edac/edac-for-next (16a826c7c2ea Merge ras/edac-drivers into for-ne=
xt)
Merging ftrace/for-next (2b849181ca84 Merge tools/for-next)
Merging rcu/next (a451b3b93a21 Merge branches 'rcu/fixes', 'rcu/nocb', 'rcu=
/torture', 'rcu/stall' and 'rcu/srcu' into rcu/dev)
Merging paulmck/non-rcu/next (644cbf77cbcc Merge branches 'csd-lock.2024.10=
.11a' and 'lkmm.2024.10.11a' into HEAD)
Merging kvm/next (e9001a382fa2 Merge tag 'kvmarm-fixes-6.12-3' of git://git=
.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvm-arm/next (116224161be7 Merge tag 'kvmarm-fixes-6.12-3' into kvm=
arm-master/next)
Merging kvms390/next (f9b56b2c31e5 s390: Enable KVM_S390_UCONTROL config in=
 debug_defconfig)
Merging kvm-ppc/topic/ppc-kvm (8cf0b93919e1 Linux 6.12-rc2)
Merging kvm-riscv/riscv_kvm_next (5aa09297a3dc RISC-V: KVM: Fix to allow hp=
mcounter31 from the guest)
Merging kvm-x86/next (8cf0b93919e1 Linux 6.12-rc2)
Merging xen-tip/linux-next (0fd2a743301b xen: Remove dependency between pci=
back and privcmd)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (581434654e01 workqueue: Adjust WQ_MAX_ACTIVE f=
rom 512 to 2048)
Merging sched-ext/for-next (8814268f6f1f Merge branch 'for-6.13' into for-n=
ext)
Merging drivers-x86/for-next (79ac20df12f4 platform/x86/amd/hsmp: Make hsmp=
_pdev static instead of global)
Merging chrome-platform/for-next (9c41f371457b platform/chrome: cros_ec_typ=
ec: fix missing fwnode reference decrement)
Merging chrome-platform-firmware/for-firmware-next (32b0901e141f firmware: =
google: Unregister driver_info on failure)
Merging hsi/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging leds-lj/for-leds-next (681d5fa6440c leds: lp5562: Add multicolor br=
ightness control)
Merging ipmi/for-next (2378bd0b264a ipmi: ipmb: Add check devm_kasprintf() =
returned value)
Merging driver-core/driver-core-next (9bd133f05b1d lib: devres: Simplify AP=
I devm_ioport_unmap() implementation)
Merging usb/usb-next (c6d9e43954bf Merge 6.12-rc4 into usb-next)
Merging thunderbolt/next (42f7652d3eb5 Linux 6.12-rc4)
Merging usb-serial/usb-next (8e929cb546ee Linux 6.12-rc3)
Merging tty/tty-next (ec8c17e5ecb4 Merge 6.12-rc4 into tty-next)
Merging char-misc/char-misc-next (bd5ee6bcc51b rust: miscdevice: add missin=
g safety comments)
CONFLICT (content): Merge conflict in drivers/iio/light/veml6030.c
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (42f7652d3eb5 Linux 6.12-rc4)
Merging fastrpc/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging fpga/for-next (8de36789bd03 fpga: zynq-fpga: Rename 'timeout' varia=
ble as 'time_left')
Merging icc/icc-next (be9ce6cce0a6 Merge branch 'icc-sar2130p' into icc-nex=
t)
Merging iio/togreg (185a947e0ef9 iio: accel: replace s64 __aligned(8) with =
aligned_s64)
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
Merging scsi/for-next (c352c52452ab Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (a3517717c3c0 Merge patch series "scsi: hisi_sas:=
 Some fixes for hisi_sas")
Merging vhost/linux-next (9d0596c68f32 virtio_net: fix integer overflow in =
stats)
  9d0596c68f32 ("virtio_net: fix integer overflow in stats")
Merging rpmsg/for-next (be3e6529a8b9 remoteproc: k3-r5: Add compile testing=
 support)
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (101b259bce5c gpio: xgene-sb: don't use "pr=
oxy" headers)
Merging gpio-intel/for-next (12b0e305f509 gpio: acpi: switch to device_for_=
each_child_node_scoped())
Merging pinctrl/for-next (6bb3021d8773 Merge fixup)
Merging pinctrl-intel/for-next (37756257093b pinctrl: intel: platform: Add =
Panther Lake to the list of supported)
Merging pinctrl-renesas/renesas-pinctrl (5dcde519a067 pinctrl: renesas: Sel=
ect PINCTRL_RZG2L for RZ/V2H(P) SoC)
Merging pinctrl-samsung/for-next (2193074458de pinctrl: samsung: Add Exynos=
 990 SoC pinctrl configuration)
Merging pwm/pwm/for-next (c13bce43b32b pwm: imx27: Use clk_bulk_*() API to =
simplify clock handling)
Merging ktest/for-next (2351e8c65404 ktest.pl: Avoid false positives with g=
rub2 skip regex)
Merging kselftest/next (2a027d6bb660 selftest: rtc: Add to check rtc alarm =
status for alarm related test)
Merging kunit/test (9852d85ec9d4 Linux 6.12-rc1)
Merging kunit-next/kunit (9852d85ec9d4 Linux 6.12-rc1)
Merging livepatching/for-next (9c66f50477e2 Merge branch 'for-6.13/selftest=
s-kprobe' into for-next)
Merging rtc/rtc-next (f8560812be1d dt-bindings: rtc: mpfs-rtc: Properly nam=
e file)
Merging nvdimm/libnvdimm-for-next (447b167bb60d nvdimm: Remove dead code fo=
r ENODEV checking in scan_labels())
Merging at24/at24/for-next (339cb28b9ee6 eeprom: at24: add ST M24256E Addit=
ional Write lockable page support)
Merging ntb/ntb-next (c620f56c70eb MAINTAINERS: Update AMD NTB maintainers)
Merging seccomp/for-next/seccomp (8cf8dfceebda seccomp: Stub for !HAVE_ARCH=
_SECCOMP_FILTER)
Merging fsi/next (c5eeb63edac9 fsi: Fix panic on scom file read)
Merging slimbus/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging nvmem/for-next (3e93f43ae64b nvmem: Correct some typos in comments)
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
Merging memblock/for-next (4bb21dbb6728 mm: Use str_on_off() helper functio=
n in report_meminit())
Merging cxl/next (2c70677dabb5 cxl: Add documentation to explain the shared=
 link bandwidth calculation)
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (63971b0f51fa libstub,tpm: do not ignore failure case when=
 reading final event log)
Merging unicode/for-next (66715f005bde unicode: change the reference of dat=
abase file)
Merging slab/slab/for-next (86e5660bc119 Merge branch 'slab/for-6.13/featur=
es' into slab/for-next)
Merging random/master (d18c13697b4d prandom: Include <linux/percpu.h> in <l=
inux/prandom.h>)
Applying: fix up for "random: Do not include <linux/prandom.h> in <linux/ra=
ndom.h>"
Merging landlock/next (156d775cb9e6 landlock: Optimize scope enforcement)
Merging rust/rust-next (28e848386b92 rust: block: fix formatting of `kernel=
::block::mq::request` module)
CONFLICT (content): Merge conflict in rust/kernel/types.rs
Merging sysctl/sysctl-next (a883f2efa625 sysctl: Reorganize kerneldoc param=
eter names)
Merging execve/for-next/execve (44f65d900698 binfmt_elf: mseal address zero)
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
Merging iommufd/for-next (e2d8fe9148b7 Documentation: userspace-api: iommuf=
d: Update HWPT_PAGING and HWPT_NESTED)
Merging turbostat/next (a119348cb685 tools/power turbostat: Honor --show CP=
U, even when even when num_cpus=3D1)
Merging pwrseq/pwrseq/for-next (f82bf3c5796e power: sequencing: make the QC=
om PMU pwrseq driver depend on CONFIG_OF)
Merging capabilities-next/caps-next (de2433c608c2 capabilities: remove cap_=
mmap_file())
Merging ipe/next (42f7652d3eb5 Linux 6.12-rc4)
Merging kcsan/next (b86f7c9fad06 kcsan: Remove redundant call of kallsyms_l=
ookup_name())
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)

--Sig_/0GoZ+iuG.GaCYRdW6lqjy_9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcZ4IYACgkQAVBC80lX
0GziiQf/U1PvughjgkiAw8MqqeuhgKHAM8Rf2SVKuY3yzW5HGWbMDchkT5/MoZjv
09ZmkBO5MbfSIn4/LZ23vFsZpSlSkn7hnwHtx+SPfukiesRGdjF7gXDQPJ+pjmQg
6iE1GeTczB1DzoUlbsvTwR8XHpkdOOWkxq9Rn6HpdZhg6I02m0MKaP2H0FQu+AmW
J24YWT8ADZFOlyuzy39TAsVo7z1/bf6M7I4jliSb4IsYJcPb51sXlkl0uHA7X4MP
sYrXFQlC8cVqKa5xGQmGGBAUGfGzXlxzn3x5zYT5fLslzcJC/M1T8wdwQlg1GPmg
+/u9VWh7LkMhtF+gsFB79YHgGp4Fgw==
=ojS1
-----END PGP SIGNATURE-----

--Sig_/0GoZ+iuG.GaCYRdW6lqjy_9--

