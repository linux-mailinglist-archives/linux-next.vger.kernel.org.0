Return-Path: <linux-next+bounces-9671-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E3CD226A1
	for <lists+linux-next@lfdr.de>; Thu, 15 Jan 2026 06:14:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 017BF3007C44
	for <lists+linux-next@lfdr.de>; Thu, 15 Jan 2026 05:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E372D73B4;
	Thu, 15 Jan 2026 05:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iDU4SpFN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD3526F288;
	Thu, 15 Jan 2026 05:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768454066; cv=none; b=OnJleTg3W0n5MewcOs/nHeFGgDJ+AMQraXC8jtT6HRsvsmUmDAYzj4DNMA13l/iHr3zuNHV6D1mGn3j3GA7oNgQBFgWHCSwwVkfkeihSEzSbLVcXKJtHu7CCahtDPIOL9RTcu897/AHl6SotcPCRNXWXgYxQxV5gop2EpjUzZPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768454066; c=relaxed/simple;
	bh=JmKf7AdBlg3uhLO7ud75wgCzeUQyXZTa6NqY8rCHdzA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FJnwmmqQphKGamauEaBzT4FM1i+aZQQ62qGnX5m2d5twDlc+YVKhKTiwCDyTZ81bECnJCCFSqeFZv7QuCikix4ZCg+t+sU+fbo54Ae+wLM6v8Wfp+VVbrEGr3srmiODXkHf0ZXTIu8tRuMgf8Qzd9tIsOgbY3s0TWVTBQqLgm8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iDU4SpFN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1768454058;
	bh=0hv3vIHge/fRVeViyWXsjW9aCaBRGShA78kQSnU0Crc=;
	h=Date:From:To:Cc:Subject:From;
	b=iDU4SpFNqDcNrVt16dJNKVTkk7IBhLZX4GoP8TXU6o9nRpwdyAJJJkeJKmA7W3Dg/
	 B8gUghy0QAkWGH/iE8I/BwgjRZRAx99FuwVF+mj3l1NwBkPFLQcxXCe1DEHAX9B8Qs
	 di6eEDKOXRQvEyt2gGdOb3rLv0A3Sd/gm/FJIsQBHKfjwWEbdYPRjBbfDl1omC3lNO
	 NVTUuCDO8SZPvhQEZ1N3XlQztegT8+eh7Z1LGEOQbD7hmmquuHyT0chvcXeVdV1M5d
	 6txvPlKIH4erXjiz7SebWY8WI7cQFk1LVF31Lb5Se4dOnqk14oIosSWap5hoAITOsi
	 zO/cTNja1pRNA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dsB3t3hGkz4wCJ;
	Thu, 15 Jan 2026 16:14:18 +1100 (AEDT)
Date: Thu, 15 Jan 2026 16:14:17 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Brown
 <broonie@kernel.org>
Subject: linux-next: Tree for Jan 15
Message-ID: <20260115161417.5a82a41c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1Y4jWAZ=1956rTiyjpt+xW2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1Y4jWAZ=1956rTiyjpt+xW2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

News: this is my last linux-next release.  Mark should start doing
these soon.

Changes since 20260114:

New tree:	rust-analyzer

The vfs tree gained a conflict against the vfs-brauner tree.

The net-next tree still had it build failure for which I applied a hack.

The leds-lj tree still had it build failure so I used the version from
next-20260108.

The kspp tree gained a build failure due to an interaction with the
drivers-x86 tree for which I applied a patch.

Non-merge commits (relative to Linus' tree): 6100
 6098 files changed, 329768 insertions(+), 155214 deletions(-)

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

I am currently merging 405 trees (counting Linus' and 122 trees of bug
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
Merging origin/master (944aacb68baf Merge tag 'scsi-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging ext4-fixes/fixes (483ee5b953c8 ext4: fix iloc.bh leak in ext4_xattr=
_inode_update_ref)
Merging vfs-brauner-fixes/vfs.fixes (e16688084df7 Merge patch series "Fix v=
m.dirtytime_expire_seconds=3D0 causing 100% CPU")
Merging fscrypt-current/for-current (1e39da974ce6 fscrypt: fix left shift u=
nderflow when inode->i_blkbits > PAGE_SHIFT)
Merging fsverity-current/for-current (211ddde0823f Linux 6.18-rc2)
Merging btrfs-fixes/next-fixes (c83f697f89a7 Merge branch 'misc-6.19' into =
next-fixes)
Merging vfs-fixes/fixes (e1b4c6a58304 shmem: fix recovery on rename failure=
s)
Merging erofs-fixes/fixes (7893cc12251f erofs: fix file-backed mounts no lo=
nger working on EROFS partitions)
Merging nfsd-fixes/nfsd-fixes (0b88bfa42e54 NFSD: net ref data still needs =
to be freed even if net hasn't startup)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (e8bd877fb76b ovl: fix possible double un=
link)
Merging fscrypt/for-next (211ddde0823f Linux 6.18-rc2)
Merging btrfs/for-next (c1e83b45e3bd Merge branch 'for-next-next-v6.19-2026=
0114' into for-next-20260114)
  0735a4556440 ("btrfs: remove zoned statistics from sysfs")
CONFLICT (content): Merge conflict in fs/btrfs/sysfs.c
Merging ceph/master (c0fe2994f9a9 libceph: make calc_target() set t->paused=
, not just clear it)
Merging cifs/for-next (0f61b1860cc3 Linux 6.19-rc5)
Merging configfs/configfs-next (f7f78098690d configfs: Constify ct_item_ops=
 in struct config_item_type)
Merging ecryptfs/next (2a9cb23307db ecryptfs: Annotate struct ecryptfs_mess=
age with __counted_by)
Merging dlm/next (8e4021078863 dlm: check for undefined release_option valu=
es)
Merging erofs/dev (faf2e75062d6 erofs: tidy up synchronous decompression)
Merging exfat/dev (5a3975b40a02 exfat: reduce unnecessary writes during mma=
p write)
Merging ext3/for_next (6f7c877cc397 fs: send fsnotify_xattr()/IN_ATTRIB fro=
m vfs_fileattr_set()/chattr(1))
Merging ext4/dev (234bb49265ff ext4: drop the TODO comment in ext4_es_inser=
t_extent())
Merging f2fs/dev (0eda086de85e f2fs: fix to check sysfs filename w/ gc_pin_=
file_thresh correctly)
Merging fsverity/for-next (211ddde0823f Linux 6.18-rc2)
Merging fuse/for-next (8da059f2a497 fuse: Uninitialized variable in fuse_ep=
och_work())
Merging gfs2/for-next (e3256c7f132f gfs2: Fix slab-use-after-free in qd_put)
Merging jfs/jfs-next (eb0cfcf26571 jfs: Add missing set_freezable() for fre=
ezable kthread)
Merging ksmbd/ksmbd-for-next (0f61b1860cc3 Linux 6.19-rc5)
Merging nfs/linux-next (1846c21f548c NFSv4.2: Fix size read races in trunca=
te, fallocate and copy offload)
Merging nfs-anna/linux-next (b623390045a8 NFS: Fix LTP test failures when t=
imestamps are delegated)
Merging nfsd/nfsd-next (65cabf8ed0f2 xdrgen: Initialize data pointer for ze=
ro-length items)
Merging ntfs3/master (099ef9ab9203 fs/ntfs3: implement iomap-based file ope=
rations)
Merging orangefs/for-next (11f6bce77e27 fs/orangefs: Replace kzalloc + copy=
_from_user with memdup_user_nul)
Merging overlayfs/overlayfs-next (ad1423922781 ovl: make sure that ovl_crea=
te_real() returns a hashed dentry)
Merging ubifs/next (0695aef23d67 ubifs: vmalloc(array_size()) -> vmalloc_ar=
ray())
Merging v9fs/9p-next (3e281113f871 9p: fix new mount API cache option handl=
ing)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (51aba4ca399b Merge branch 'xfs-7.0-merge' into for-ne=
xt)
Merging zonefs/for-next (a42938e80357 zonefs: correct some spelling mistake=
s)
Merging vfs-brauner/vfs.all (55ffc973331b Merge branch 'vfs-7.0.nullfs' int=
o vfs.all)
CONFLICT (content): Merge conflict in fs/ntfs3/file.c
Merging vfs/for-next (8311223d18bb sysfs(2): fs_index() argument is _not_ a=
 pathname)
CONFLICT (content): Merge conflict in Documentation/filesystems/porting.rst
CONFLICT (content): Merge conflict in fs/ntfs3/dir.c
Merging mm-hotfixes/mm-hotfixes-unstable (63b0807181e6 mm/memory-failure: t=
each kill_accessing_process to accept hugetlb tail page pfn)
Merging fs-current (2be42efa7633 Merge branch 'next-fixes' of https://git.k=
ernel.org/pub/scm/linux/kernel/git/kdave/linux.git)
Merging kbuild-current/kbuild-fixes-for-next (baaecfcac559 kconfig: fix sta=
tic linking of nconf)
Merging arc-current/for-curr (d7b8f8e20813 Linux 6.16-rc5)
Merging arm-current/fixes (fd2dee1c6e22 ARM: fix branch predictor hardening)
Merging arm64-fixes/for-next/fixes (bdf3f4176092 arm64: Fix cleared E0POE b=
it after cpu_suspend()/resume())
Merging arm-soc-fixes/arm/fixes (bf104037ebd5 arm64: dts: hisilicon: hikey9=
60: Drop "snps,gctl-reset-quirk" and "snps,tx_de_emphasis*" properties)
Merging davinci-current/davinci/for-current (8f0b4cce4481 Linux 6.19-rc1)
Merging drivers-memory-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging sophgo-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging sophgo-soc-fixes/soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging m68k-current/for-linus (aaf4e92341b0 m68k: defconfig: Update defcon=
figs for v6.18-rc1)
Merging powerpc-fixes/fixes (9ace4753a520 Linux 6.19-rc4)
Merging s390-fixes/fixes (9448598b22c5 Linux 6.19-rc2)
Merging net/main (3879cffd9d07 net/sched: sch_qfq: do not free existing cla=
ss in qfq_change_class())
Merging bpf/master (c537e12daeec Merge tag 'bpf-fixes' of git://git.kernel.=
org/pub/scm/linux/kernel/git/bpf/bpf)
Merging ipsec/master (c196def07bbc xfrm: set ipv4 no_pmtu_disc flag only on=
 output sa when direction is set)
Merging netfilter/main (653267321f05 Merge branch 'net-netdevsim-fix-incons=
istent-carrier-state-after-link-unlink')
Merging ipvs/main (de0337d641bf net: ionic: map SKB after pseudo-header che=
cksum prep)
Merging wireless/for-next (e7df8567878f Merge tag 'ath-current-20260113' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath into wireless)
Merging ath/for-current (31707572108d wifi: ath12k: Fix wrong P2P device li=
nk id issue)
Merging iwlwifi/fixes (8f7aa3d3c732 Merge tag 'net-next-6.19' of git://git.=
kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (3609fa95fb0f Merge tag 'devicetree-fixes-for-6.1=
9-2' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux)
Merging sound-current/for-linus (ef5749ef8b30 ALSA: usb-audio: Prevent exce=
ssive number of frames)
Merging sound-asoc-fixes/for-linus (1a75f24a7f8c ASoC: Fix sdw_utils callin=
g wrong codec init callbacks)
Merging regmap-fixes/for-linus (4b58aac989c1 regmap: Fix race condition in =
hwspinlock irqsave routine)
Merging regulator-fixes/for-linus (9ace4753a520 Linux 6.19-rc4)
Merging spi-fixes/for-linus (b062a899c997 spi: hisi-kunpeng: Fixed the wron=
g debugfs node name in hisi_spi debugfs initialization)
Merging pci-current/for-linus (05f66cf5e7a5 PCI: Provide pci_free_irq_vecto=
rs() stub)
Merging driver-core.current/driver-core-linus (5d9c4c272ba0 rust: irq: alwa=
ys inline functions using build_assert with arguments)
Merging tty.current/tty-linus (f8f9c1f4d0c7 Linux 6.19-rc3)
Merging usb.current/usb-linus (9bcb4c4c330c usb: gadget: uvc: retry vb2_req=
bufs() with vb_vmalloc_memops if use_sg fail)
Merging usb-serial-fixes/usb-linus (cd644b805da8 USB: serial: f81232: fix i=
ncomplete serial port generation)
Merging phy/fixes (f2ec4723defb phy: freescale: imx8m-pcie: assert phy rese=
t during power on)
Merging staging.current/staging-linus (8f0b4cce4481 Linux 6.19-rc1)
Merging iio-fixes/fixes-togreg (978d28136c53 iio: dac: ad3552r-hs: fix out-=
of-bound write in ad3552r_hs_write_data_source)
Merging counter-current/counter-current (9448598b22c5 Linux 6.19-rc2)
Merging char-misc.current/char-misc-linus (36a70608a314 Merge tag 'iio-fixe=
s-for-6.19a' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/jic23/ii=
o into char-misc-linus)
Merging soundwire-fixes/fixes (12d4fd9a6571 soundwire: bus: fix off-by-one =
when allocating slave IDs)
Merging thunderbolt-fixes/fixes (0f61b1860cc3 Linux 6.19-rc5)
Merging input-current/for-linus (248d3a73a016 Input: ti_am335x_tsc - fix of=
f-by-one error in wire_order validation)
Merging crypto-current/master (961ac9d97be7 crypto: qat - fix duplicate res=
tarting msg during AER error)
Merging libcrypto-fixes/libcrypto-fixes (74d74bb78aec lib/crypto: aes: Fix =
missing MMU protection for AES S-box)
Merging vfio-fixes/for-linus (acf44a2361b8 vfio/xe: Fix use-after-free in x=
e_vfio_pci_alloc_file())
Merging kselftest-fixes/fixes (6e39903c73df selftests/tracing: Fix test_mul=
tiple_writes stall)
Merging dmaengine-fixes/fixes (76cba1e60b69 dmaengine: apple-admac: Add "ap=
ple,t8103-admac" compatible)
Merging backlight-fixes/for-backlight-fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging mtd-fixes/mtd/fixes (2f6d2c8d9ac0 Revert "mtd: spinand: esmt: fix i=
d code for F50D1G41LB")
Merging mfd-fixes/for-mfd-fixes (aa6e63373d91 mfd: ls2kbmc: Use PCI API ins=
tead of direct accesses)
Merging v4l-dvb-fixes/fixes (69d6c6fc79eb media: ov02c10: Remove unnecessar=
y hflip and vflip pointers)
Merging reset-fixes/reset/fixes (997c06330fd5 reset: imx8mp-audiomix: Fix b=
ad mask values)
Merging mips-fixes/mips-fixes (680ad315caaa MIPS: Fix a reference leak bug =
in ip22_check_gio())
Merging at91-fixes/at91-fixes (94ad504e67cd ARM: dts: microchip: sama7d65: =
fix size-cells property for i2c3)
Merging omap-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging kvm-fixes/master (3611ca7c12b7 selftests: kvm: Verify TILELOADD act=
ually #NM faults when XFD[18]=3D1)
Merging kvms390-fixes/master (5f9df945d4e8 KVM: s390: Fix FOLL_*/FAULT_FLAG=
_* confusion)
Merging hwmon-fixes/hwmon (b3db91c3bfea hwmon: (ltc4282): Fix reset_history=
 file permissions)
Merging nvdimm-fixes/libnvdimm-fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging cxl-fixes/fixes (8441c7d3bd6c cxl: Check for invalid addresses retu=
rned from translation functions on errors)
Merging dma-mapping-fixes/dma-mapping-fixes (c6ccd0988074 dma/pool: Avoid a=
llocating redundant pools)
Merging drivers-x86-fixes/fixes (c92724b40c2f docs: fix PPR for AMD EPYC br=
oken link)
Merging samsung-krzk-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging pinctrl-samsung-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging devicetree-fixes/dt/linus (235a1eb8d2dc of: unittest: Fix memory le=
ak in unittest_data_add())
Merging dt-krzk-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging scsi-fixes/fixes (901a5f309dab scsi: xen: scsiback: Fix potential m=
emory leak in scsiback_remove())
Merging drm-fixes/drm-fixes (0f61b1860cc3 Linux 6.19-rc5)
Merging drm-intel-fixes/for-linux-next-fixes (81d0223832f9 drm/i915/guc: ma=
ke 'guc_hw_reg_state' static as it isn't exported)
Merging mmc-fixes/fixes (3009738a855c mmc: sdhci-of-dwcmshc: Prevent illega=
l clock reduction in HS200/HS400 mode)
Merging rtc-fixes/rtc-fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging gnss-fixes/gnss-linus (0f61b1860cc3 Linux 6.19-rc5)
Merging hyperv-fixes/hyperv-fixes (173d6f64f955 mshv: release mutex on regi=
on invalidation failure)
Merging risc-v-fixes/fixes (b0d7f5f0c9f0 riscv: trace: fix snapshot deadloc=
k with sbi ecall)
Merging riscv-dt-fixes/riscv-dt-fixes (004c371d0bd1 riscv: dts: microchip: =
remove BeagleV Fire fabric.dtsi)
Merging riscv-soc-fixes/riscv-soc-fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging fpga-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging spdx/spdx-linus (d358e5254674 Merge tag 'for-6.19/dm-changes' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging gpio-brgl-fixes/gpio/for-current (471e998c0e31 gpiolib: remove redu=
ndant callback check)
Merging gpio-intel-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging pinctrl-intel-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging auxdisplay-fixes/fixes (9ace4753a520 Linux 6.19-rc4)
Merging kunit-fixes/kunit-fixes (c33b68801fbe kunit: make FAULT_TEST defaul=
t to n when PANIC_ON_OOPS)
Merging memblock-fixes/fixes (be05f5714644 memblock test: include <linux/si=
zes.h> from tools mm.h stub)
Merging renesas-fixes/fixes (379c590113ce ARM: shmobile: smp: Enforce shmob=
ile_smp_* alignment)
Merging perf-current/perf-tools (1eb217ab2e73 perf parse-events: Fix evsel =
allocation failure)
Merging efi-fixes/urgent (d7f1b4bdc710 efi/cper: Fix cper_bits_to_str buffe=
r handling and return value)
Merging battery-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging iommufd-fixes/for-rc (f8f9c1f4d0c7 Linux 6.19-rc3)
Merging rust-fixes/rust-fixes (74e15ac34b09 scripts: generate_rust_analyzer=
: Add pin_init_internal deps)
Merging w1-fixes/fixes (cc8f92e41eb7 w1: fix redundant counter decrement in=
 w1_attach_slave_device())
Merging pmdomain-fixes/fixes (3de499664996 pmdomain: imx8m-blk-ctrl: Remove=
 separate rst and clk mask for 8mq vpu)
Merging i2c-host-fixes/i2c/i2c-host-fixes (ccd1cdca5cd4 Merge tag 'nfsd-6.1=
9-1' of git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux)
Merging sparc-fixes/for-linus (8f0b4cce4481 Linux 6.19-rc1)
Merging clk-fixes/clk-fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging thead-clk-fixes/thead-clk-fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging pwrseq-fixes/pwrseq/for-current (8f0b4cce4481 Linux 6.19-rc1)
Merging thead-dt-fixes/thead-dt-fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging ftrace-fixes/ftrace/fixes (1650a1b6cb1a fgraph: Check ftrace_pids_e=
nabled on registration for early filtering)
Merging ring-buffer-fixes/ring-buffer/fixes (b042fdf18e89 tracing: Fix WARN=
_ON in tracing_buffers_mmap_close for split VMAs)
Merging trace-fixes/trace/fixes (1e2ed4bfd50a trace: ftrace_dump_on_oops[] =
is not exported, make it static)
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (8f0b4cce4481 Linux 6.19-rc1)
Merging tip-fixes/tip/urgent (b8ab0dfa08f1 Merge branch into tip/master: 'x=
86/urgent')
Merging slab-fixes/slab/for-next-fixes (fe8f3dae3c35 slab: fix kmalloc_nolo=
ck() context check for PREEMPT_RT)
Merging drm-msm-fixes/msm-fixes (66691e272e40 drm/msm: Replace unsafe snpri=
ntf usage with scnprintf)
Merging uml-fixes/fixes (df447a3b4a4b um: Fix FD copy size in os_rcv_fd_msg=
())
Merging fwctl-fixes/for-rc (f8f9c1f4d0c7 Linux 6.19-rc3)
Merging devsec-tsm-fixes/fixes (fba4ceaa242d configfs-tsm-report: Fix NULL =
dereference of tsm_ops)
Merging drm-rust-fixes/drm-rust-fixes (97872fa28b33 MAINTAINERS: exclude th=
e tyr driver from DRM MISC)
Merging tenstorrent-dt-fixes/tenstorrent-dt-fixes (3a8660878839 Linux 6.18-=
rc1)
Merging drm-misc-fixes/for-linux-next-fixes (b91a565ed14f drm/sysfb: Remove=
 duplicate declarations)
Merging rust/rust-next (9ace4753a520 Linux 6.19-rc4)
Merging rust-alloc/alloc-next (f8f9c1f4d0c7 Linux 6.19-rc3)
Merging rust-io/io-next (86731a2a651e Linux 6.16-rc3)
Merging rust-pin-init/pin-init-next (42415d163e5d rust: pin-init: add refer=
ences to previously initialized fields)
Merging rust-timekeeping/timekeeping-next (4521438fb076 rust: time: Impleme=
nt basic arithmetic operations for Delta)
Merging rust-xarray/xarray-next (fa616196fbea MAINTAINERS: add entry for Ru=
st XArray API)
Merging rust-analyzer/rust-analyzer-next (0f61b1860cc3 Linux 6.19-rc5)
Merging mm-stable/mm-stable (0f61b1860cc3 Linux 6.19-rc5)
Merging mm-nonmm-stable/mm-nonmm-stable (0f61b1860cc3 Linux 6.19-rc5)
Merging mm-unstable/mm-unstable (890e5a03df17 mm: convert vmemmap_p?d_popul=
ate() to static functions)
Merging mm-nonmm-unstable/mm-nonmm-unstable (869d417602a4 kernel: add SPDX-=
License-Identifier lines)
Merging kbuild/kbuild-for-next (66d2c4245fa1 Merge branch 'kbuild-next' int=
o kbuild-for-next)
Merging clang-format/clang-format (8f0b4cce4481 Linux 6.19-rc1)
Merging perf/perf-tools-next (54a23bff7709 perf test: Test addr2line unwind=
ing works with inline functions)
Merging compiler-attributes/compiler-attributes (8f0b4cce4481 Linux 6.19-rc=
1)
Merging dma-mapping/dma-mapping-for-next (8a840ab0567f dma-mapping: Remove =
dma_mark_clean (again))
Merging asm-generic/master (edcc8a38b5ac once: fix race by moving DO_ONCE t=
o separate section)
Merging alpha/alpha-next (d58041d2c63e MAINTAINERS: Add Magnus Lindholm as =
maintainer for alpha port)
Merging arm/for-next (dd9143371a86 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (053603efd048 Merge branches 'for-next/acpi', '=
for-next/cpufeature', 'for-next/cpufreq', 'for-next/entry', 'for-next/misc'=
, 'for-next/perf' and 'for-next/selftests' into for-next/core)
Merging arm-perf/for-next/perf (79448fa1f495 perf/arm_dsu: Allow standard c=
ycles events)
Merging arm-soc/for-next (3fb76066f882 soc: document merges)
Merging amlogic/for-next (cb3cfadb6d00 Merge branch 'v6.20/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (ed4d76c7786d Merge branch 'apple-soc/=
defconfig-6.20' into asahi-soc/for-next)
Merging at91/at91-next (bcd7f6786d6e Merge branch 'clk-microchip' into at91=
-next)
Merging bmc/for-next (26705fad17bd Merge branches 'aspeed/arm/dt', 'nuvoton=
/arm/fixes' and 'nuvoton/arm64/dt' into for-next)
Merging broadcom/next (8b7e6f128aa6 Merge branch 'devicetree-arm64/next' in=
to next)
Merging cix/for-next (4d24b32aa342 Merge remote-tracking branch 'cix/dt-bin=
dings' into for-next)
Merging davinci/davinci/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging drivers-memory/for-next (9805f2cfc883 dt-bindings: memory: SDRAM ch=
annel: standardise node name)
Merging fsl/soc_fsl (0d069bb38183 dt-bindings: soc: fsl: qe: Add an interru=
pt controller for QUICC Engine Ports)
Merging imx-mxs/for-next (f74941f893ae Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (d78a0e19f7a2 Merge branch 'v6.19-next/dts64' int=
o for-next)
Merging mvebu/for-next (5e7879bc7563 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (de6cd5720a75 Merge branch 'omap-for-v6.20/drivers' i=
nto tmp/omap-next-20260114.143701)
Merging qcom/for-next (b4d2b128cf85 Merge branches 'arm32-fixes-for-6.19', =
'arm32-for-6.20', 'arm64-defconfig-for-6.20', 'arm64-fixes-for-6.19', 'arm6=
4-for-6.20', 'clk-fixes-for-6.19', 'clk-for-6.20' and 'drivers-for-6.20' in=
to for-next)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging renesas/next (12292e06c9a3 Merge branch 'renesas-dts-for-v6.20' int=
o renesas-next)
Merging reset/reset/next (b3d8508351af reset: gpio: add the "compatible" pr=
operty)
Merging rockchip/for-next (3cfe6e154081 Merge branch 'v6.20-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (8766b06daad8 Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (02b744bc8a71 Merge tags 'juno-updates-7.0', 'f=
fa-updates-7.0' and 'scmi-updates-7.0' of ssh://gitolite.kernel.org/pub/scm=
/linux/kernel/git/sudeep.holla/linux into for-linux-next)
Merging sophgo/for-next (b1fa0deeb860 Merge branch 'dt/riscv' into for-next)
Merging sophgo-soc/soc-for-next (c8754c7deab4 soc: sophgo: cv1800: rtcsys: =
New driver (handling RTC only))
Merging spacemit/for-next (0de664eb7b45 Merge branch 'spacemit-clk-for-6.20=
' into spacemit-for-next)
Merging stm32/stm32-next (b8e2e3442637 arm64: STM32: drop an undefined Kcon=
fig symbol)
Merging sunxi/sunxi/for-next (f8ad8bbb8827 riscv: dts: allwinner: d1: Add R=
GB LEDs to boards)
Merging tee/next (57976732b042 Merge branch 'tee_bus_callback_for_6.20' int=
o next)
Merging tegra/for-next (e016a50e00e6 Merge branch for-6.19/arm64/defconfig =
into for-next)
Merging tenstorrent-dt/tenstorrent-dt-for-next (a71e6e8eea8a riscv: defconf=
ig: Enable Tenstorrent SoCs)
Merging thead-dt/thead-dt-for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging ti/ti-next (98edb47b6c44 Merge branches 'ti-drivers-soc-next' and '=
ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (50d1a926f463 Merge remote-tracking branch 'git/zyn=
qmp/soc' into for-next)
Merging clk/clk-next (8f0b4cce4481 Linux 6.19-rc1)
Merging clk-imx/for-next (fdc1dc7dd53b clk: imx: add driver for imx8ulp's s=
im lpav)
Merging clk-renesas/renesas-clk (879e9fc8f689 clk: renesas: rzv2h: Deassert=
 reset on assert timeout)
Merging thead-clk/thead-clk-for-next (30441a56b1d1 clk: thead: th1520-ap: S=
upport CPU frequency scaling)
Merging csky/linux-next (817d21578d51 csky: Remove compile warning for CONF=
IG_SMP)
Merging loongarch/loongarch-next (bb85d206be20 samples/ftrace: Adjust Loong=
Arch register restore order in direct calls)
Merging m68k/for-next (aaf4e92341b0 m68k: defconfig: Update defconfigs for =
v6.18-rc1)
Merging m68knommu/for-next (adc342591f78 m68k: defconfig: Clean up referenc=
es to non-existing configs)
Merging microblaze/next (8f0b4cce4481 Linux 6.19-rc1)
Merging mips/mips-next (8f0b4cce4481 Linux 6.19-rc1)
Merging openrisc/for-next (8c30b0018f9d openrisc: Add jump label support)
Merging parisc-hd/for-next (53d97e51861a parisc: Print hardware IDs as 4 di=
git hex strings)
Merging powerpc/next (815a8d2feb56 powerpc/eeh: fix recursive pci_lock_resc=
an_remove locking in EEH event handling)
Merging risc-v/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging riscv-dt/riscv-dt-for-next (a36b2aaae742 dt-bindings: riscv: extens=
ions: Drop unnecessary select schema)
Merging riscv-soc/riscv-soc-for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging s390/for-next (12ea976f955c s390/ap: Fix typo in function name refe=
rence)
Merging sh/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging sparc/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging uml/next (68e25613ed4d arch/um: remove unused varible err in remove=
_files_and_dir())
Merging xtensa/xtensa-for-next (0d4b3ca115b5 xtensa: align: validate access=
 in fast_load_store)
Merging fs-next (ce3f4e85a805 Merge branch 'for-next' of https://git.kernel=
.org/pub/scm/linux/kernel/git/viro/vfs.git)
CONFLICT (content): Merge conflict in fs/fat/dir.c
Merging printk/for-next (34793812e592 Merge branch 'rework/atomic-flush-sof=
tlockup' into for-next)
Merging pci/next (c265090b385a Merge branch 'pci/misc')
CONFLICT (content): Merge conflict in drivers/pci/controller/dwc/pcie-qcom.c
Merging pstore/for-next/pstore (b69255357368 pstore/ram: Update module para=
meters from platform data)
Merging hid/for-next (95813c9d23a4 Merge branch 'for-6.20/sony' into for-ne=
xt)
Merging i2c/i2c/for-next (8690df4a6d9b Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i2c-host/i2c/i2c-host (7b5073f9897f i2c: spacemit: drop useless spa=
ces)
Merging i3c/i3c/next (95cb1935168a i3c: mipi-i3c-hci-pci: Add Runtime PM su=
pport)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (01d8d7107bf8 hwmon: (gpd-fan) add support=
 for Micro PC 2)
Merging jc_docs/docs-next (68328f4a929f Merge branch 'jobserver' into docs-=
next)
Merging v4l-dvb/next (2759816f1682 media: qcom: camss: add support for SM61=
50 camss)
CONFLICT (content): Merge conflict in drivers/media/mc/mc-request.c
Merging v4l-dvb-next/master (adc218676eef Linux 6.12)
Merging pm/linux-next (71b997b95260 Merge branch 'fixes' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (9e33fdf5a2b5 rust: cpumask: ren=
ame methods of Cpumask for clarity and consistency)
Merging cpupower/cpupower (ff72619e1134 tools/power cpupower: Show C0 in id=
le-info dump)
Merging devfreq/devfreq-next (d9600d57668c PM / devfreq: Fix typo in DFSO_D=
OWNDIFFERENTIAL macro name)
Merging pmdomain/next (c20f7b37c6bb pmdomain: Merge branch fixes into next)
Merging opp/opp/linux-next (549a1be5cebb OPP: of: Simplify with scoped for =
each OF child loop)
Merging thermal/thermal/linux-next (c411d8bf0699 thermal/drivers/imx91: Add=
 support for i.MX91 thermal monitoring unit)
Merging rdma/for-next (325e3b5431dd RDMA/ocrdma: Remove unused OCRDMA_UVERB=
S definition)
Merging net-next/main (3b194343c250 net: mana: Implement ndo_tx_timeout and=
 serialize queue resets per port.)
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/mac.c
Applying: fix up for "bnxt_en: Add PTP .getcrosststamp() interface to get d=
evice/host times"
Applying: fix up for "wifi: ath12k: Move ieee80211_ops callback to the arch=
 specific module"
Merging bpf-next/for-next (e3d0dbb3b5e8 Merge git://git.kernel.org/pub/scm/=
linux/kernel/git/bpf/bpf after rc5)
Merging ipsec-next/master (8e7148b56023 atm: idt77252: Use sb_pool_remove())
Merging mlx5-next/mlx5-next (49e41f3ea3f7 net/mlx5: Add IFC bits for extend=
ed ETS rate limit bandwidth value)
Merging netfilter-next/main (59ba823e689f Merge git://git.kernel.org/pub/sc=
m/linux/kernel/git/netdev/net)
Merging ipvs-next/main (c9dfb92de073 Merge branch 'mlx5-next' of git://git.=
kernel.org/pub/scm/linux/kernel/git/mellanox/linux)
Merging bluetooth/master (2e5da9653691 Bluetooth: btusb: Reject autosuspend=
 if discovery is active)
Merging wireless-next/for-next (24a57985670e wifi: cfg80211: don't apply HT=
 flags to S1G channels)
Merging ath-next/for-next (24a57985670e wifi: cfg80211: don't apply HT flag=
s to S1G channels)
Merging iwlwifi-next/next (85d002b2ac56 wifi: iwlwifi: mld: remove unused v=
ariable in d3.c)
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (8f0b4cce4481 Linux 6.19-rc1)
Merging nand/nand/next (a75a1dec037f mtd: spinand: add support for Dosilico=
n DS35Q1GA/DS35M1GA)
Merging spi-nor/spi-nor/next (ed26bd40df11 mailmap: update Pratyush Yadav's=
 email address)
Merging crypto/master (c904e459cf73 crypto: drbg - make drbg_get_random_byt=
es() return *void*)
Merging libcrypto/libcrypto-next (959a634ebcda lib/crypto: mldsa: Add FIPS =
cryptographic algorithm self-test)
Merging drm/drm-next (a87fef0880c4 Merge tag 'drm-misc-next-2026-01-08' of =
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_gem_shmem_helper.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_pagemap.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/pl111/pl111_drv.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_svm.c
CONFLICT (content): Merge conflict in include/drm/drm_pagemap.h
Merging drm-exynos/for-linux-next (3a8660878839 Linux 6.18-rc1)
Merging drm-misc/for-linux-next (b36178488d47 accel/amdxdna: Fix notifier_w=
q flushing warning)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_gem.c
Merging amdgpu/drm-next (6a681cd90345 drm/amd/display: Add an hdmi_hpd_debo=
unce_delay_ms module)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdkfd/cwsr_trap_=
handler_gfx12.asm
Merging drm-intel/for-linux-next (d30f75d2dba9 drm/i915/dp: Simplify comput=
ing the DSC compressed BPP for DP-MST)
Merging drm-msm/msm-next (66691e272e40 drm/msm: Replace unsafe snprintf usa=
ge with scnprintf)
Merging drm-msm-lumag/msm-next-lumag (1d232f793d4d drm/msm/dsi_phy_14nm: co=
nvert from divider_round_rate() to divider_determine_rate())
Merging drm-rust/drm-rust-next (654826aa4a8f gpu: nova-core: add missing ne=
wlines to several print strings)
Merging drm-nova/nova-next (93296e9d9528 gpu: nova-core: vbios: store refer=
ence to Device where relevant)
Merging drm-xe/drm-xe-next (def675cf3f10 drm/xe/mert: Improve handling of M=
ERT CAT errors)
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (b76ecfdb08c8 video/logo: don't select LOGO_LINUX_MO=
NO and LOGO_LINUX_VGA16 by default)
CONFLICT (content): Merge conflict in drivers/gpu/drm/Kconfig
Applying: fix up for "drm/hyperv: Remove reference to hyperv_fb driver"
Merging regmap/for-next (4b58aac989c1 regmap: Fix race condition in hwspinl=
ock irqsave routine)
Merging sound/for-next (78e35b0156c3 ALSA: usb-audio: clean up presonus s18=
10 consts)
Merging ieee1394/for-next (993ab48006b3 firewire: ohci: stop using page pri=
vate to store DMA mapping address)
Merging sound-asoc/for-next (607253994227 Merge remote-tracking branch 'aso=
c/for-6.20' into asoc-next)
Merging modules/modules-next (b68758e6f430 modules: moduleparam.h: fix kern=
el-doc comments)
Merging input/next (f8a6e5eac701 Input: adp5589 - remove a leftover header =
file)
Merging block/for-next (3c301314dd2b Merge branch 'block-6.19' into for-nex=
t)
Merging device-mapper/for-next (fb8a6c18fb9a dm: clear cloned request bio p=
ointer when last clone bio completes)
Merging libata/for-next (7cd55343d776 ata: libata-scsi: avoid Non-NCQ comma=
nd starvation)
Merging pcmcia/pcmcia-next (4a81f78caa53 pcmcia: Add error handling for add=
_interval() in do_validate_mem())
Merging mmc/next (a57107c0fc1a mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (b5678d2dcbf0 dt-bindings: mfd: syscon: Allow sysc=
on compatible for mediatek,mt7981-topmisc)
Merging backlight/for-backlight-next (b516456e9f91 backlight: Add Congatec =
Board Controller (CGBC) backlight support)
Merging battery/for-next (432b119ab8d8 docs: power: update documentation ab=
out removed function)
Merging regulator/for-next (62b04225e99a regulator: dt-bindings: rpi-panel:=
 Mark 7" Raspberry Pi as GPIO controller)
Merging security/next (472711068fa9 lsm: make keys for static branch static)
Merging apparmor/apparmor-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging integrity/next-integrity (377cae9851e8 ima: Fix stack-out-of-bounds=
 in is_bprm_creds_for_exec())
Merging selinux/next (5473a722f782 selinux: add support for BPF token acces=
s control)
Merging smack/next (33d589ed60ae smack: /smack/doi: accept previously used =
values)
Merging tomoyo/master (d157757de210 RDMA/core: add device registration debu=
gging)
Merging tpmdd/next (416f99c3b16f Merge tag 'driver-core-6.19-rc1' of git://=
git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core)
Merging watchdog/master (0f61b1860cc3 Linux 6.19-rc5)
Merging iommu/next (2efcec539655 Merge branches 'fixes', 'arm/smmu/updates'=
, 'amd/amd-vi' and 'core' into next)
Merging audit/next (76489955c6d4 audit: move the compat_xxx_class[] extern =
declarations to audit_arch.h)
Merging devicetree/for-next (0a9d69fb0b5e kbuild: Fix unnecessary rebuildin=
g DT base+overlay targets)
Merging dt-krzk/for-next (cde5448c1296 Merge branch 'next/dt64' into for-ne=
xt)
Merging mailbox/for-next (7f98ab9da046 Merge tag 'for-6.19-rc4-tag' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/kdave/linux)
Merging spi/for-next (5d6f14459f83 Merge remote-tracking branch 'spi/for-6.=
20' into spi-next)
Merging tip/master (c671ba862b59 Merge timers/vdso into tip/master)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/renesas/r9a09g077=
.dtsi
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/renesas/r9a09g087=
.dtsi
CONFLICT (content): Merge conflict in crypto/drbg.c
CONFLICT (content): Merge conflict in lib/Kconfig.debug
Merging clockevents/timers/drivers/next (d1780dce9575 clocksource/drivers: =
Add Realtek system timer driver)
Merging edac/edac-for-next (87636dde12e4 Merge ras/edac-urgent into for-nex=
t)
Merging ftrace/for-next (78a419b44e89 Merge tools/for-next)
Merging rcu/next (fe1d4828846f Merge branch 'rcu-misc.20260111a')
Merging paulmck/non-rcu/next (7f8fcc6f09fb memory-barriers.txt: Sort wait_e=
vent* and wait_on_bit* list alphabetically)
Merging kvm/next (0499add8efd7 Merge tag 'kvm-x86-fixes-6.19-rc1' of https:=
//github.com/kvm-x86/linux into HEAD)
Merging kvm-arm/next (4df10a649f61 Merge branch kvm-arm64/misc-6.20 into kv=
marm-master/next)
Merging kvms390/next (2bd1337a1295 KVM: s390: Use generic VIRT_XFER_TO_GUES=
T_WORK functions)
Merging kvm-ppc/topic/ppc-kvm (9448598b22c5 Linux 6.19-rc2)
Merging kvm-riscv/riscv_kvm_next (3239c52fd212 RISC-V: KVM: Flush VS-stage =
TLB after VCPU migration for Andes cores)
Merging kvm-x86/next (acdc54461359 Merge branch 'vmx')
Merging xen-tip/linux-next (763baca7bf8b xen: introduce xen_console_io opti=
on)
Merging percpu/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging workqueues/for-next (51cd2d2decf3 workqueue: Process extra works in=
 rescuer on memory pressure)
Merging sched-ext/for-next (4e705d310176 Merge branch 'for-6.20' into for-n=
ext)
Merging drivers-x86/for-next (520448bb6f09 platform/x86: thinkpad_acpi: Add=
 sysfs to display details of damaged device.)
Merging chrome-platform/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging chrome-platform-firmware/for-firmware-next (8f0b4cce4481 Linux 6.19=
-rc1)
Merging hsi/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging leds-lj/for-leds-next (33e822f6f4eb leds: qcom-lpg: Check the retur=
n value of regmap_bulk_write())
$ git reset --hard HEAD^
Merging next-20260108 version of leds-lj
Merging ipmi/for-next (49034915bfe2 ipmi: ipmb: initialise event handler re=
ad bytes)
Merging driver-core/driver-core-next (303db924fe0b MAINTAINERS: update auxi=
liary bus entry)
Merging usb/usb-next (56a512a9b410 usb: gadget: f_ncm: align net_device lif=
ecycle with bind/unbind)
Applying: fix up for "usb: gadget: u_ether: add gether_opts for config cach=
ing"
Merging thunderbolt/next (062191adfde0 thunderbolt: Log path activation fai=
lures without WARN backtraces)
Merging usb-serial/usb-next (f8f9c1f4d0c7 Linux 6.19-rc3)
Merging tty/tty-next (322fc12949d2 Merge 6.19-rc3 into tty-next)
Merging char-misc/char-misc-next (e48407ba576c Merge tag 'counter-updates-f=
or-6.20' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/wbg/counter =
into char-misc-next)
Merging coresight/next (98baf887b1e9 coresight: tpda: Fix intendation for s=
ysfs interface documentation)
Merging fastrpc/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging fpga/for-next (267f53140c9d fpga: dfl: use subsys_initcall to allow=
 built-in drivers to be added)
Merging icc/icc-next (472239d4f395 Merge branch 'icc-fixes' into icc-next)
Merging iio/togreg (f9e057916428 staging: iio: adt7316: replace sprintf() w=
ith sysfs_emit())
Merging phy-next/next (cbce66669c82 phy: Add Google Tensor SoC USB PHY driv=
er)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/phy=
/qcom,sc8280xp-qmp-pcie-phy.yaml
Merging soundwire/next (dc3a6a942e9e soundwire: intel_ace2x: add SND_HDA_CO=
RE dependency)
CONFLICT (content): Merge conflict in sound/soc/codecs/wcd939x-sdw.c
Merging extcon/extcon-next (b4338338aa3d extcon: usbc-tusb320: Make typec-p=
ower-opmode optional)
Merging gnss/gnss-next (0f61b1860cc3 Linux 6.19-rc5)
Merging vfio/next (d721f52e3155 vfio: selftests: Add vfio_pci_device_init_p=
erf_test)
Merging w1/for-next (cc8f92e41eb7 w1: fix redundant counter decrement in w1=
_attach_slave_device())
Merging spmi/spmi-next (8f0b4cce4481 Linux 6.19-rc1)
Merging staging/staging-next (efcffd9a6ad8 staging: greybus: lights: avoid =
NULL deref)
Merging counter-next/counter-next (ad415677b7e3 MAINTAINERS: Update Intel Q=
uadrature Encoder Peripheral maintainer)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (3c8a86ed002a dmaengine: xilinx: xdma: use sg_nents_=
for_dma() helper)
Merging cgroup/for-next (53552add1a7c Merge branch 'for-6.20' into for-next)
Merging scsi/for-next (98bcf5e5ddfd Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (ee8112a2e0f9 Merge patch series "Call scsi_host_=
busy() after the SCSI host has been added")
Merging vhost/linux-next (da8d0a0b4b75 checkpatch: special-case cacheline g=
roup macros)
Merging rpmsg/for-next (4c0249b715e3 Merge branches 'rpmsg-next' and 'rproc=
-next' into for-next)
Merging gpio-brgl/gpio/for-next (4aa573002ba6 gpio: pca9570: use lock guard=
s)
Merging gpio-intel/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging pinctrl/for-next (4400dfd2acee Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (bfec8ce11af0 pinctrl: lynxpoint: Convert to=
 use intel_gpio_add_pin_ranges())
Merging pinctrl-renesas/renesas-pinctrl (829dde3369a9 pinctrl: renesas: rzt=
2h: Add GPIO IRQ chip to handle interrupts)
Merging pinctrl-samsung/for-next (8c483209a6fc pinctrl: samsung: Add Exynos=
9610 pinctrl configuration)
Merging pwm/pwm/for-next (a2c02b50d945 pwm: max7360: populate missing .size=
of_wfhw in max7360_pwm_ops)
Merging ktest/for-next (d3042cbe84a0 ktest.pl: Fix uninitialized var in con=
fig-bisect.pl)
Merging kselftest/next (86063a2568b8 selftests/resctrl: Fix non-contiguous =
CBM check for Hygon)
Merging kunit/test (8f0b4cce4481 Linux 6.19-rc1)
Merging kunit-next/kunit (f126d688193b kunit: tool: test: Don't rely on imp=
licit working directory change)
Merging livepatching/for-next (51ab33fc0a8b Merge tag 'livepatching-for-6.1=
9' of git://git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepatchi=
ng)
Merging rtc/rtc-next (8f0b4cce4481 Linux 6.19-rc1)
Merging nvdimm/libnvdimm-for-next (30065e73d7c0 nvdimm: Prevent integer ove=
rflow in ramdax_get_config_data())
Merging at24/at24/for-next (7a29af24b288 eeprom: at24: use dev_err_probe() =
consistently)
Merging ntb/ntb-next (68113d260674 NTB/msi: Remove unused functions)
Merging seccomp/for-next/seccomp (7d0a66e4bb90 Linux 6.18)
Merging slimbus/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging nvmem/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging xarray/main (863810caeb3c XArray: Add CONFIG_DEBUG_XARRAY)
Merging hyperv/hyperv-next (8f0b4cce4481 Linux 6.19-rc1)
Merging auxdisplay/for-next (693142d4d761 auxdisplay: max6959: Replace slab=
.h with device/devres.h)
Merging kgdb/kgdb/for-next (fdbdd0ccb30a kdb: remove redundant check for sc=
ancode 0xe0)
Merging hmm/hmm (19272b37aa4f Linux 6.16-rc1)
Merging cfi/cfi/next (3a8660878839 Linux 6.18-rc1)
Merging mhi/mhi-next (91a0b0dce350 bus: mhi: ep: Use bus callbacks for .pro=
be() and .remove())
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/mhi.c
Applying: fix up for "net: qrtr: Drop the MHI auto_queue feature for IPCR D=
L channels"
Merging memblock/for-next (f56ccc32468e mm/memtest: add underflow detection=
 for size calculation)
Merging cxl/next (0db2344eb8a8 cxl/hdm: Fix newline character in dev_err() =
messages)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (c5a8f13f1e47 efi: Support EDID information)
Merging unicode/for-next (bcfee135d584 utf8: Remove unused utf8_normalize)
Merging slab/slab/for-next (f9ba528eda51 Merge branch 'slab/for-7.0/obj_met=
adata' into slab/for-next)
Merging random/master (bb9ff576fdff virt: vmgenid: remap memory as decrypte=
d)
Merging landlock/next (6abbb8703aee landlock: Clarify documentation for the=
 IOCTL access right)
Merging sysctl/sysctl-next (d174174c6776 sysctl: replace SYSCTL_INT_CONV_CU=
STOM macro with functions)
Merging execve/for-next/execve (7d0a66e4bb90 Linux 6.18)
Merging bitmap/bitmap-for-next (c39f47e6c439 lib/tests: add KUnit test for =
bitops)
Merging hte/for-next (8f0b4cce4481 Linux 6.19-rc1)
Merging kspp/for-next/kspp (3cb0bb8fe823 Merge branch 'for-next/hardening' =
into for-next/kspp)
  cc34c669abe0 ("ecryptfs: Annotate struct ecryptfs_message with __counted_=
by")
Applying: fix up for "Fortify: Use C arithmetic not FIELD_xxx() in FORTIFY_=
REASON defines"
Merging nolibc/for-next (a5f00be9b3b0 tools/nolibc: Add a simple test for w=
riting to a FILE and reading it back)
Merging iommufd/for-next (f8f9c1f4d0c7 Linux 6.19-rc3)
Merging turbostat/next (83a899f345d4 tools/power turbostat.8: Document the =
"--force" option)
Merging pwrseq/pwrseq/for-next (0eb85f468ef5 power: sequencing: qcom-wcn: a=
dd support for WCN39xx)
Merging capabilities-next/caps-next (24e9b431b583 security: Add KUnit tests=
 for kuid_root_in_ns and vfsuid_root_in_currentns)
Merging ipe/next (7d0a66e4bb90 Linux 6.18)
Merging kcsan/next (dcb6fa37fd7b Linux 6.18-rc3)
Merging crc/crc-next (dcb6fa37fd7b Linux 6.18-rc3)
Merging fwctl/for-next (f8f9c1f4d0c7 Linux 6.19-rc3)
Merging devsec-tsm/next (7dfbe9a67519 crypto/ccp: Fix CONFIG_PCI=3Dn build)
Merging hisilicon/for-next (6c177775dcc5 Merge branch 'next/drivers' into f=
or-next)
Merging kthread/for-next (e31f3c967c66 doc: Add housekeeping documentation)

--Sig_/1Y4jWAZ=1956rTiyjpt+xW2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlod6kACgkQAVBC80lX
0GzQqgf/Xe9NPoruraRCNWseRWDdsvmiCl6wnH8ZxN1tTrzbZ3xjo0RGpWJ82JqE
C4ENNjaPJep2vwfXwlLSfDzVdUm/IodTE5pI3jnC8CmwEkOgxJtA5UjdpjrhrWFB
YMVLvIueFtgUndoyzaZ9EPRDvfqRmZbHH5G6R3y35n6ufG9jEGfsztGIcw58MBKz
wGxpp5JP8rF32eaSIDt9UGFVtvx/oGXLO+YJy8gLDi39+wvOdqJcNoL2PyIBFAOM
t76BPwWkPdWuHppcInIbYEh/Da9x+88RPALUS6mNhtDNbakJNOzcWVmttXfKMNwa
AYSORip6sm3iWPg/KFNaIM7T6P9QRA==
=zD68
-----END PGP SIGNATURE-----

--Sig_/1Y4jWAZ=1956rTiyjpt+xW2--

