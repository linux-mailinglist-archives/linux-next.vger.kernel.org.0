Return-Path: <linux-next+bounces-4510-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEF79B41FA
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 06:54:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA7A92847B1
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 05:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE67F200BB5;
	Tue, 29 Oct 2024 05:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="G9+97aT/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E43A20100C;
	Tue, 29 Oct 2024 05:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730181273; cv=none; b=WnsqJktrG5tkMOdWy3P5zQx2/nmrkD1MWKccjf90c7gy2zPUo7N8fDGgqDlcK05hd+OTszZ/5TSoilNIjGzYkE2wfPRGPMmrlDY+KKsksVn2JhZfivBBCye69eEfawdwcfS4Bs8NrPI9IaRj0+MrPL8ubONRGqi2L43X7/dBAyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730181273; c=relaxed/simple;
	bh=mbQ1gMhowW2HucFZ20rwVHLw52PaTUMMD8rm8PsVH88=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=prPsONXcR85CD8Kk4gphjZzu4CfEMNWyYhUWCBWOhc9QA8y/I+zEgcsdt8M3vlh1szKG2P5LLC4uUyJOEybwEUsYHZpmf6C0xmRouZjA0Of1lFKRaac6/QzjcFFT1m5KQRJU1EzGeJX4+xzahhIHz91elY5PWgzGEu9DsgOEI20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=G9+97aT/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730181260;
	bh=MRDTkeTkQccRO5+rH7iNGCHssvDVEIDfXIV8OiaRZxY=;
	h=Date:From:To:Cc:Subject:From;
	b=G9+97aT/GBrU7pKVGSixCmxOzwr1oNWUkHkKBKzqG2rtCMfYJShtyhrIeFuVWxGza
	 uSvNSqcuu4O31iemIiZSbMV64yA6WYkERB/EUGbgLtwK6MnWDzpakaxcEmMdHqJsTh
	 cPfN6Nq13eAmRlMGHEFhd7qINTQDOAueJcMmWniUHmLKCMic8hVHoKk++hjwTyZZLK
	 yRb1yLL/gFNAeTW4I2hDWuXcBF+fdC25xXV+qnlVdxVXh286qm0QH+K02n/i/GfGWC
	 QgezLkO4ogsBWJJHjKQ/PxYfJHNzLsZtxB1Xn2aVFS+sgRLPmWQaub23SYHDx4P363
	 wxRNRfd7n3w0A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XczwX217hz4wb7;
	Tue, 29 Oct 2024 16:54:20 +1100 (AEDT)
Date: Tue, 29 Oct 2024 16:54:21 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 29
Message-ID: <20241029165421.4a397a7f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UsDpqJTRAQgppSbWVPqWdBg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/UsDpqJTRAQgppSbWVPqWdBg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20241028:

The btrfs tree still had a build failure so I used the version from
next-20241023.

The mm tree still had a build failure for which I reverted a commit.

The asm-generic tree gained a conflict against the mm tree.

The samaung-krzk tree lost its build failure.

The tip tree still had its build failure for which I applied a patch.

The memblock tree lost its boot failure.

Non-merge commits (relative to Linus' tree): 7055
 9010 files changed, 312004 insertions(+), 238213 deletions(-)

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

I am currently merging 382 trees (counting Linus' and 144 trees of bug
fix patches pending for the current merge release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--=20
Cheers,
Stephen Rothwell

$ git checkout master
$ git reset --hard stable
Merging origin/master (819837584309 Linux 6.12-rc5)
Merging fixes/fixes (87d6aab2389e Merge tag 'for_linus' of git://git.kernel=
.org/pub/scm/linux/kernel/git/mst/vhost)
Merging vfs-brauner-fixes/vfs.fixes (e65a0dc1cabe iov_iter: Fix iov_iter_ge=
t_pages*() for folio_queue)
Merging fscrypt-current/for-current (8e929cb546ee Linux 6.12-rc3)
Merging fsverity-current/for-current (8e929cb546ee Linux 6.12-rc3)
Merging btrfs-fixes/next-fixes (8aa5effdc951 Merge branch 'misc-6.12' into =
next-fixes)
Merging vfs-fixes/fixes (678379e1d4f7 close_range(): fix the logics in desc=
riptor table trimming)
Merging erofs-fixes/fixes (ae54567eaa87 erofs: get rid of kaddr in `struct =
z_erofs_maprecorder`)
Merging nfsd-fixes/nfsd-fixes (10bd5b848b03 NFSD: Initialize struct nfsd4_c=
opy earlier)
Merging v9fs-fixes/fixes/next (684a64bf32b6 Merge tag 'nfs-for-6.12-1' of g=
it://git.linux-nfs.org/projects/anna/linux-nfs)
Merging overlayfs-fixes/ovl-fixes (77a28aa47687 ovl: relax WARN_ON in ovl_v=
erify_area())
Merging bcachefs/for-next (b78da43137b1 bcachefs: bch2_write_inode() now ch=
ecks for changing rebalance options)
Merging fscrypt/for-next (8e929cb546ee Linux 6.12-rc3)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (34e6ef874ee4 Merge branch 'for-next-next-v6.12-2024=
1026' into for-next-20241026)
$ git reset --hard HEAD^
Merging next-20241023 version of btrfs
Merging ceph/master (4a459012431a ceph: Remove fs/ceph deadcode)
Merging cifs/for-next (819837584309 Linux 6.12-rc5)
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
Merging f2fs/dev (f2bbbe277c22 f2fs: check curseg->inited before write_sum_=
page in change_curseg)
Merging fsverity/for-next (8e929cb546ee Linux 6.12-rc3)
Merging fuse/for-next (8807f117be9d fuse: convert fuse_notify_store to use =
folios)
Merging gfs2/for-next (8dcf0d453811 gfs2: Flush glock work queue on inode l=
ookup / create)
Merging jfs/jfs-next (67373ca8404f jfs: Fix sanity check in dbMount)
Merging ksmbd/ksmbd-for-next (819837584309 Linux 6.12-rc5)
Merging nfs/linux-next (42f7652d3eb5 Linux 6.12-rc4)
Merging nfs-anna/linux-next (7ef60108069b NFS: remove revoked delegation fr=
om server's delegation list)
Merging nfsd/nfsd-next (9c9cb4242c49 nfsd: remove nfsd4_session->se_bchanne=
l)
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
Merging xfs/for-next (4a201dcfa1ff xfs: update the pag for the last AG at r=
ecovery time)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging file-locks/locks-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6-=
mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging iversion/iversion-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6=
-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging vfs-brauner/vfs.all (58766281fb3c Merge branch 'vfs.usercopy' into =
vfs.all Signed-off-by: Christian Brauner <brauner@kernel.org>)
CONFLICT (content): Merge conflict in fs/btrfs/file.c
CONFLICT (content): Merge conflict in include/linux/exportfs.h
Merging vfs/for-next (8f602276d390 Merge tag 'bcachefs-2024-10-05' of git:/=
/evilpiepirate.org/bcachefs)
Merging mm-hotfixes/mm-hotfixes-unstable (677e4acf834b mm, mmap: limit THP =
alignment of anonymous mappings to PMD-aligned sizes)
Merging fs-current (db05f7b3e9d8 Merge branch 'nfsd-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/cel/linux)
Merging kbuild-current/fixes (cb18ed074bcc kbuild: deb-pkg: add pkg.linux-u=
pstream.nokerneldbg build profile)
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
Merging sophgo-fixes/fixes (d99913e1b80b riscv: dts: Replace deprecated snp=
s,nr-gpios property for snps,dw-apb-gpio-port devices)
Merging m68k-current/for-linus (b90fae5df917 m68k: defconfig: Update defcon=
figs for v6.11-rc1)
Merging powerpc-fixes/fixes (cf8989d20d64 powerpc/powernv: Free name on err=
or in opal_event_init())
Merging s390-fixes/fixes (b4fa00fd428b s390: Update defconfigs)
Merging net/main (e31a8219fbfc Merge tag 'wireless-2024-10-21' of git://git=
.kernel.org/pub/scm/linux/kernel/git/wireless/wireless)
Merging bpf/master (ae90f6a6170d Merge tag 'bpf-fixes' of git://git.kernel.=
org/pub/scm/linux/kernel/git/bpf/bpf)
Merging ipsec/master (6889cd2a93e1 xfrm: fix one more kernel-infoleak in al=
go dumping)
Merging netfilter/main (306ed1728e84 netfilter: xtables: fix typo causing s=
ome targets not to load on IPv6)
Merging ipvs/main (306ed1728e84 netfilter: xtables: fix typo causing some t=
argets not to load on IPv6)
Merging wireless/for-next (cf44e745048d wifi: mac80211: ieee80211_i: Fix me=
mory corruption bug in struct ieee80211_chanctx)
Merging ath/for-current (befd716ed429 wifi: ath11k: Fix invalid ring usage =
in full monitor mode)
Merging wpan/master (09573b1cc76e net: ieee802154: mcr20a: Use IRQF_NO_AUTO=
EN flag in request_irq())
Merging rdma-fixes/for-rc (76d3ddff7153 RDMA/bnxt_re: synchronize the qp-ha=
ndle table array)
Merging sound-current/for-linus (78e7be018784 ALSA: hda/realtek: Limit inte=
rnal Mic boost on Dell platform)
Merging sound-asoc-fixes/for-linus (c1895ba181e5 ASoC: Intel: sst: Fix used=
 of uninitialized ctx to log an error)
Merging regmap-fixes/for-linus (8cf0b93919e1 Linux 6.12-rc2)
Merging regulator-fixes/for-linus (2feb02311084 regulator: rtq2208: Fix uni=
nitialized use of regulator_config)
Merging spi-fixes/for-linus (25f00a13dccf spi: spi-fsl-dspi: Fix crash when=
 not using GPIO chip select)
Merging pci-current/for-linus (ad783b9f8e78 PCI/pwrctl: Abandon QCom WCN pr=
obe on pre-pwrseq device-trees)
Merging driver-core.current/driver-core-linus (8e929cb546ee Linux 6.12-rc3)
Merging tty.current/tty-linus (42f7652d3eb5 Linux 6.12-rc4)
Merging usb.current/usb-linus (42f7652d3eb5 Linux 6.12-rc4)
Merging usb-serial-fixes/usb-linus (42f7652d3eb5 Linux 6.12-rc4)
Merging phy/fixes (e70d2677ef40 phy: tegra: xusb: Add error pointer check i=
n xusb.c)
Merging staging.current/staging-linus (807babf69027 staging: vchiq_arm: Use=
 devm_kzalloc() for drv_mgmt allocation)
Merging iio-fixes/fixes-togreg (7382bd7467fb iio: backend: fix wrong pointe=
r passed to IS_ERR())
Merging counter-current/counter-current (9852d85ec9d4 Linux 6.12-rc1)
Merging char-misc.current/char-misc-linus (42f7652d3eb5 Linux 6.12-rc4)
Merging soundwire-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging thunderbolt-fixes/fixes (3cea8af2d1a9 thunderbolt: Honor TMU requir=
ements in the domain when setting TMU mode)
Merging input-current/for-linus (2860586c588a Input: adp5588-keys - do not =
try to disable interrupt 0)
Merging crypto-current/master (dd41b283ef2f crypto: mips/crc32 - fix the CR=
C32C implementation)
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
Merging v4l-dvb-fixes/fixes (96d856956391 media: vivid: fix buffer overwrit=
e when using > 32 buffers)
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
Merging drm-fixes/drm-fixes (4d95a12beba1 Merge tag 'drm-xe-fixes-2024-10-2=
4-1' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes)
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
Merging gpio-brgl-fixes/gpio/for-current (7e336a6c15ec MAINTAINERS: add a k=
eyword entry for the GPIO subsystem)
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
Merging rust-fixes/rust-fixes (c38a04ecb6ac kbuild: rust: avoid errors with=
 old `rustc`s without LLVM patch version)
Merging w1-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging pmdomain-fixes/fixes (7738568885f2 PM: domains: Fix alloc/free in d=
ev_pm_domain_attach|detach_list())
Merging i2c-host-fixes/i2c/i2c-host-fixes (42f7652d3eb5 Linux 6.12-rc4)
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
Merging drm-misc-fixes/for-linux-next-fixes (746ae46c1113 drm/sched: Mark s=
cheduler work queues with WQ_MEM_RECLAIM)
Merging mm-stable/mm-stable (42f7652d3eb5 Linux 6.12-rc4)
Merging mm-nonmm-stable/mm-nonmm-stable (42f7652d3eb5 Linux 6.12-rc4)
Merging mm/mm-everything (48f5ccaabb94 foo)
Applying: Revert "memcg: workingset: remove folio_memcg_rcu usage"
Merging kbuild/for-next (7e04fcfc6195 kconfig: qconf: simplify character re=
placement)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (150dab31d560 perf disasm: Fix not cleaning up=
 disasm_line in symbol__disassemble_raw())
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/for-next (bfc4a245a794 dma-mapping: fix DMA API tracing=
 for chained scatterlists)
Merging asm-generic/master (a8cb1e92d290 hexagon: simplify asm/io.h for !HA=
S_IOPORT)
CONFLICT (content): Merge conflict in lib/Makefile
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (9016915e3c5f Merge branches 'amba', 'fixes' and 'misc=
' into for-next)
Merging arm64/for-next/core (47c8cf3c9853 Merge branches 'for-next/misc' an=
d 'for-next/kselftest' into for-next/core)
CONFLICT (content): Merge conflict in arch/arm64/mm/pageattr.c
CONFLICT (content): Merge conflict in include/linux/mm.h
Merging arm-perf/for-next/perf (e1dce56443a4 perf/marvell: Marvell PEM perf=
ormance monitor support)
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
Merging omap/for-next (f45840d172a0 Merge branch 'omap-for-v6.13/drivers' i=
nto tmp/omap-next-20241004.145243)
Merging qcom/for-next (dd73c2085647 Merge branches 'arm32-for-6.13', 'arm64=
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
Merging stm32/stm32-next (b14c9f6bd0ba ARM: dts: stm32: Use SAI to generate=
 bit and frame clock on STM32MP15xx DHCOM PDK2)
Merging sunxi/sunxi/for-next (16177eb39971 Merge branches 'sunxi/clk-for-6.=
13' and 'sunxi/dt-for-6.13' into sunxi/for-next)
Merging tee/next (9852d85ec9d4 Linux 6.12-rc1)
Merging tegra/for-next (2a4425682b6f Merge branch for-6.13/arm64/dt into fo=
r-next)
Merging thead-dt/thead-dt-for-next (2a3bf75a9408 riscv: dts: thead: remove =
enabled property for spi0)
Merging ti/ti-next (094d3da526f0 Merge remote-tracking branch 'k3-next/ti-k=
3-dts-next' into ti-next)
Merging xilinx/for-next (0e355cb69e19 Merge branch 'zynq/soc' into for-next)
Merging clk/clk-next (1c9321b6f3c6 Merge branch 'clk-kunit' into clk-next)
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
Merging mips/mips-next (9852d85ec9d4 Linux 6.12-rc1)
Merging openrisc/for-next (4dc70e1aadfa openrisc: Move FPU state out of pt_=
regs)
Merging parisc-hd/for-next (98f7e32f20d2 Linux 6.11)
Merging powerpc/next (0882db7f928c Merge branch 'topic/vdso' into next)
Merging risc-v/for-next (075fde581896 Merge patch series "riscv: Userspace =
pointer masking and tagged address ABI")
Merging riscv-dt/riscv-dt-for-next (7cf3e9bfc63d dt-bindings: vendor-prefix=
es: add spacemit)
Merging riscv-soc/riscv-soc-for-next (8400291e289e Linux 6.11-rc1)
Merging s390/for-next (d9641cb8a451 Merge branch 'features' into for-next)
CONFLICT (content): Merge conflict in arch/s390/include/asm/set_memory.h
CONFLICT (content): Merge conflict in arch/s390/mm/pageattr.c
Merging sh/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging sparc/for-next (d21dffe51baa arch/sparc: remove unused varible padd=
rbase in function leon_swprobe())
Merging uml/next (d3b08e5f3f28 um: fix stub exe build with CONFIG_GCOV)
Merging xtensa/xtensa-for-next (b7cf2a1d9881 xtensa: remove redundant flush=
_dcache_page and ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE macros)
Merging fs-next (cfad32207f3e Merge branch 'vfs.all' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/vfs/vfs.git)
Merging printk/for-next (16475a8fd500 Merge branch 'for-6.13' into for-next)
Merging pci/next (759a3ceba34a Merge branch 'pci/misc')
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
Merging hwmon-staging/hwmon-next (893acae4cdaf MAINTAINERS: Remove Aleksand=
r Mezin as NZXT-SMART2 driver maintainer)
Merging jc_docs/docs-next (062d98be0e3f docs/zh_CN: update the translation =
of process/programming-language.rst)
Merging v4l-dvb/next (d020ca11a816 media: samples: v4l2-pci-skeleton.c: dro=
p vb2_ops_wait_prepare/finish)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (764dc1b95fe3 Merge branch 'thermal-core' into linux-=
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
Merging net-next/main (c7cf3e928e63 Merge branch 'bonding-returns-detailed-=
error-about-xdp-failures')
Merging bpf-next/for-next (34419b2def88 Merge branch 'bpf-next/master' into=
 for-next)
Merging ipsec-next/master (83c289e81e88 net/sched: act_api: unexport tcf_ac=
tion_dump_1())
Merging mlx5-next/mlx5-next (8cf0b93919e1 Linux 6.12-rc2)
Merging netfilter-next/main (08e52cccae11 netfilter: nf_tables: prefer nft_=
trans_elem_alloc helper)
Merging ipvs-next/main (08e52cccae11 netfilter: nf_tables: prefer nft_trans=
_elem_alloc helper)
Merging bluetooth/master (2422d0e13858 Bluetooth: btmtk: adjust the positio=
n to init iso data anchor)
Merging wireless-next/for-next (eaed5fc0c322 mac80211: Remove NOP call to i=
eee80211_hw_config)
CONFLICT (content): Merge conflict in Documentation/networking/net_cachelin=
es/net_device.rst
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/mv=
m/mld-mac80211.c
CONFLICT (content): Merge conflict in net/mac80211/cfg.c
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
Merging spi-nor/spi-nor/next (afe1ea1344bb mtd: spi-nor: add support for Ma=
cronix Octal flash)
Merging crypto/master (d186faa30764 crypto: starfive - remove unneeded cryp=
to_engine_stop() call)
Merging drm/drm-next (c9ff14d0339a Merge tag 'drm-intel-gt-next-2024-10-23'=
 of https://gitlab.freedesktop.org/drm/i915/kernel into drm-next)
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
Merging drm-misc/for-linux-next (b59d1d9d9ab2 drm/bridge: tc358767: Fix use=
 of unadjusted mode in the driver)
Merging amdgpu/drm-next (ecfe9b237687 drm/amdgpu/smu13: fix profile reporti=
ng)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dc_typ=
es.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/amdgpu_s=
mu.c
Merging drm-intel/for-linux-next (a0e45f70d44e drm/i915: Use string enable/=
disable choice helpers)
Merging drm-msm/msm-next (d6d1ad32d007 drm/msm/a6xx: Fix excessive stack us=
age)
Merging drm-msm-lumag/msm-next-lumag (74c374648ed0 drm/msm: Simplify NULL c=
hecking in msm_disp_state_dump_regs())
Merging drm-xe/drm-xe-next (55858fa7eb2f drm/xe/xe_guc_ads: save/restore OA=
 registers and allowlist regs)
Merging etnaviv/etnaviv/next (2c7ac7dd1b6c drm/etnaviv: etnaviv_cmdbuf.c: D=
rop the unneeded include of drm_mm.h)
Merging fbdev/for-next (42f7652d3eb5 Linux 6.12-rc4)
Merging regmap/for-next (c2288599691c regmap: Merge up v6.12-rc2)
Merging sound/for-next (7153501351f0 Merge branch 'topic/compress-accel' in=
to for-next)
Merging ieee1394/for-next (8f04019d71cb firewire: Correct some typos)
Merging sound-asoc/for-next (60423aa24e1e Merge remote-tracking branch 'aso=
c/for-6.13' into asoc-next)
Merging modules/modules-next (af0847537031 selftests: kallsyms: add MODULE_=
DESCRIPTION)
Merging input/next (b4badee88cd3 Input: imagis - fix warning regarding 'ima=
gis_3038_data' being unused)
Merging block/for-next (8225fed519c0 Merge branch 'for-6.13/io_uring' into =
for-next)
Merging device-mapper/for-next (82e4a81d8da2 dm cache: fix potential out-of=
-bounds access on the first resume)
Merging libata/for-next (5251ae224d8d ata: libata-scsi: Return residual for=
 emulated SCSI commands)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (e6dc7d2eecd0 mmc: bcm2835: Introduce proper clock handlin=
g)
Merging mfd/for-mfd-next (f2be0c3a9584 mfd: twl-core: Add a clock subdevice=
 for the TWL6030)
Merging backlight/for-backlight-next (0eda30af5880 dt-bindings: backlight: =
Convert zii,rave-sp-backlight.txt to yaml)
Merging battery/for-next (83bce34420ea power: Switch back to struct platfor=
m_driver::remove())
Merging regulator/for-next (3eb0ac2454b8 Merge remote-tracking branch 'regu=
lator/for-6.13' into regulator-next)
Merging security/next (847404ac4bf5 Automated merge of 'dev' into 'next')
CONFLICT (content): Merge conflict in kernel/auditsc.c
Merging apparmor/apparmor-next (8400291e289e Linux 6.11-rc1)
Merging integrity/next-integrity (08ae3e5f5fc8 integrity: Use static_assert=
() to check struct sizes)
Merging selinux/next (d7b6918e22c7 selinux: Deprecate /sys/fs/selinux/user)
Merging smack/next (2749749afa07 smackfs: Use rcu_assign_pointer() to ensur=
e safe assignment in smk_set_cipso)
Merging tomoyo/master (ada1986d0797 tomoyo: fallback to realpath if symlink=
's pathname does not exist)
Merging tpmdd/next (df745e25098d tpm: Lazily flush the auth session)
Merging watchdog/master (9852d85ec9d4 Linux 6.12-rc1)
Merging iommu/next (acbec6fa25b5 Merge branches 'fixes', 's390', 'amd/amd-v=
i' and 'core' into next)
Merging audit/next (89282beaf75d audit: Use str_yes_no() helper function)
Merging devicetree/for-next (b213f06da235 dt-bindings: watchdog: convert zi=
i,rave-sp-wdt.txt to yaml format)
Merging dt-krzk/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging mailbox/for-next (54595f2807d2 mailbox, remoteproc: omap2+: fix com=
pile testing)
Merging spi/for-next (aa1ab4f8bf08 Merge remote-tracking branch 'spi/for-6.=
13' into spi-next)
Merging tip/master (da99b80a7f5f Merge branch into tip/master: 'x86/sev')
  9c70b2a33cd2 ("sched/numa: Fix the potential null pointer dereference in =
task_numa_work()")
CONFLICT (content): Merge conflict in kernel/time/timekeeping.c
Applying: fix up for "cleanup: Adjust scoped_guard() macros to avoid potent=
ial warning"
Merging clockevents/timers/drivers/next (57cbfd333c9d clocksource/drivers/r=
alink: Add Ralink System Tick Counter driver)
Merging edac/edac-for-next (a3f2618cb2b0 Merge branch 'edac-drivers' into e=
dac-for-next)
Merging ftrace/for-next (2b849181ca84 Merge tools/for-next)
Merging rcu/next (596810675feb Merge branches 'rcu/fixes', 'rcu/nocb', 'rcu=
/torture', 'rcu/stall' and 'rcu/srcu' into rcu/dev)
Merging paulmck/non-rcu/next (644cbf77cbcc Merge branches 'csd-lock.2024.10=
.11a' and 'lkmm.2024.10.11a' into HEAD)
Merging kvm/next (5cb1659f4120 Merge branch 'kvm-no-struct-page' into HEAD)
CONFLICT (content): Merge conflict in arch/arm64/kvm/guest.c
Merging kvm-arm/next (7fc56db1a3fb Merge branch kvm-arm64/mmio-sea into kvm=
arm/next)
Merging kvms390/next (f9b56b2c31e5 s390: Enable KVM_S390_UCONTROL config in=
 debug_defconfig)
Merging kvm-ppc/topic/ppc-kvm (8cf0b93919e1 Linux 6.12-rc2)
Merging kvm-riscv/riscv_kvm_next (5bdecd891e50 RISC-V: KVM: Use NACL HFENCE=
s for KVM request based HFENCEs)
Merging kvm-x86/next (8cf0b93919e1 Linux 6.12-rc2)
Merging xen-tip/linux-next (0fd2a743301b xen: Remove dependency between pci=
back and privcmd)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (581434654e01 workqueue: Adjust WQ_MAX_ACTIVE f=
rom 512 to 2048)
Merging sched-ext/for-next (9089691695f5 Merge branch 'for-6.12-fixes' into=
 for-next)
Merging drivers-x86/for-next (a7d30cb75b0b platform/x86: eeepc-laptop: use =
sysfs_emit() instead of sprintf())
Merging chrome-platform/for-next (ea45f3f46734 platform/chrome: Switch back=
 to struct platform_driver::remove())
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
Merging thunderbolt/next (819837584309 Linux 6.12-rc5)
Merging usb-serial/usb-next (42f7652d3eb5 Linux 6.12-rc4)
Merging tty/tty-next (44059790a5cb kfifo: don't include dma-mapping.h in kf=
ifo.h)
Merging char-misc/char-misc-next (bd5ee6bcc51b rust: miscdevice: add missin=
g safety comments)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (42f7652d3eb5 Linux 6.12-rc4)
Merging fastrpc/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging fpga/for-next (8de36789bd03 fpga: zynq-fpga: Rename 'timeout' varia=
ble as 'time_left')
Merging icc/icc-next (be9ce6cce0a6 Merge branch 'icc-sar2130p' into icc-nex=
t)
Merging iio/togreg (9b4071ab8cbe iio: chemical: bme680: generalize read_*()=
 functions)
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
Merging rpmsg/for-next (be3e6529a8b9 remoteproc: k3-r5: Add compile testing=
 support)
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (1f4a640e9ac7 gpiolib: fix a NULL-pointer d=
ereference when setting direction)
Merging gpio-intel/for-next (12b0e305f509 gpio: acpi: switch to device_for_=
each_child_node_scoped())
Merging pinctrl/for-next (6bb3021d8773 Merge fixup)
Merging pinctrl-intel/for-next (ffe624c4130f pinctrl: elkhartlake: Add supp=
ort for DSW community)
Merging pinctrl-renesas/renesas-pinctrl (f407af78c8d3 pinctrl: renesas: rzg=
2l: Use gpiochip_populate_parent_fwspec_twocell helper)
Merging pinctrl-samsung/for-next (6d2dbd4cec89 pinctrl: samsung: Add Exynos=
9810 SoC specific data)
Merging pwm/pwm/for-next (fdb62922ae89 pwm: core: use device_match_name() i=
nstead of strcmp(dev_name(...)
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
Merging slab/slab/for-next (5edbb8174f1d Merge branch 'slab/for-6.13/featur=
es' into slab/for-next)
Merging random/master (d18c13697b4d prandom: Include <linux/percpu.h> in <l=
inux/prandom.h>)
Applying: fix up for "random: Do not include <linux/prandom.h> in <linux/ra=
ndom.h>"
Merging landlock/next (156d775cb9e6 landlock: Optimize scope enforcement)
Merging rust/rust-next (718c4069896c rust: types: extend `Opaque` documenta=
tion)
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
Merging iommufd/for-next (0bcceb1f51c7 iommufd: Selftest coverage for IOMMU=
_IOAS_MAP_FILE)
Merging turbostat/next (a119348cb685 tools/power turbostat: Honor --show CP=
U, even when even when num_cpus=3D1)
Merging pwrseq/pwrseq/for-next (bd4c8bafcf50 power: sequencing: qcom-wcn: i=
mprove support for wcn6855)
Merging capabilities-next/caps-next (de2433c608c2 capabilities: remove cap_=
mmap_file())
Merging ipe/next (42f7652d3eb5 Linux 6.12-rc4)
Merging kcsan/next (b86f7c9fad06 kcsan: Remove redundant call of kallsyms_l=
ookup_name())
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)

--Sig_/UsDpqJTRAQgppSbWVPqWdBg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcgeI0ACgkQAVBC80lX
0Gy87Qf/f5/DJhu+fRWFEuHktfDIrouLpbaxkIH1bVs26XYZZzBfaaWuTM6cMTed
7cLHi83KoGA/FqizSNqFbCh8sduAPREWeHMxsZMg7fAJgHybrqIdEVeOqsmOvacT
GEhTqxGNTIU5fMxHFJRPJ7VBwPbobwRGfakmnabNl0FfuDmbQ/DTeXkGtpvnARVJ
De7Ad4vHBm40vb3IDeTbxwVdz3okwRCBiSP6OLW8q6oAbkrV3agdwxQQncn/JffS
Wpi/10tNON5UPXoEDFykFSOQYQ2Xp2fooKC2+qiBzWwSzCDqyS+/vA50dL76UcQ3
yYba8MuZN1H3FmOnwsxavkSiEf469A==
=u+W7
-----END PGP SIGNATURE-----

--Sig_/UsDpqJTRAQgppSbWVPqWdBg--

