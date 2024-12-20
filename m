Return-Path: <linux-next+bounces-5012-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D36849F8BD9
	for <lists+linux-next@lfdr.de>; Fri, 20 Dec 2024 06:21:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F12A7A3356
	for <lists+linux-next@lfdr.de>; Fri, 20 Dec 2024 05:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F947770FE;
	Fri, 20 Dec 2024 05:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YsUOEpwr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31F0259487;
	Fri, 20 Dec 2024 05:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734672059; cv=none; b=qpJitwEpFfqWQHEiyZKqA/u3Vgji1GO5MmP8SP+nd8TsRUd9YXiQF5XvQw1mMMiS28l54DbI8zq7YKV5FgWyiayBRl1zN0QhYuPJwdTHhnLJRIxUqxRbkefv23KKIGWqgC/P8Zs2L6/ipnOT/v8NwBeehcieqSDfx6onnBRsR6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734672059; c=relaxed/simple;
	bh=nhJTA8ewIbcg/geDo6pE4ld7mT8cLF7tb+soVoR8VDs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EnSU0FjjNWKjnbbMNM5gjBjPCmGELCid1iAfJmr2EW0KgWct++nx+UqM3SKLK0ZDyggX+NcXnUXyNnZ2e7pIRnOhLeVawndutfL4I5g4fFPacqYG8hMfsCNoqeyZKRJiBkf5WeP+axO0a8GAArT+BVGf0WAbN6IO5YiP0UVc43E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YsUOEpwr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734672046;
	bh=uOKc2bNLXbVZQJMGXnoiO6daUZva4AalTM8qyec4P08=;
	h=Date:From:To:Cc:Subject:From;
	b=YsUOEpwrSLM12ExjNOqaYx4uJ1nVgxeW4syo+KLWJI1nUK3CRcvv94urCnicxC1Nx
	 jiAFkgD8xvgT9lxCogGi8nYahxvext+ZWUQ7NBMWH0kAaHm5Yw6xR2MFI46oZf+RNs
	 sYjAql2a51EMWE98zgHzIekyIwtmJ0Fhpqzy6tjQUzUMfNBhxuqZVanHdy3hsJxQOE
	 95DQjWAI+t9fH2Xy+aSx4Gbiv4xIQbVfG2kFuyxLqDIdb1rkfUxWDNi54kRpZsxrnm
	 w3Bvx7kHnUktjOTmJfHoBkyA8I5sHPHsoecHFXxJsyPGwIpXcxg02tHhI04HtBQwmn
	 wIBpUPpXWxs9g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YDwjp62Ctz4wcy;
	Fri, 20 Dec 2024 16:20:46 +1100 (AEDT)
Date: Fri, 20 Dec 2024 16:20:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Dec 20
Message-ID: <20241220162051.50a762e4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gIanu7dU2UfcOott_vU+1oj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gIanu7dU2UfcOott_vU+1oj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

News: there will be no linux-next releases after this week until
January 6.

Changes since 20241219:

The mm tree gained a build failure for which I applied a patch.

The block tree gained a build failure for which I applied a patch.

The rcu tree gained a conflict against the mm tree.

Non-merge commits (relative to Linus' tree): 4525
 4995 files changed, 208274 insertions(+), 75903 deletions(-)

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

I am currently merging 391 trees (counting Linus' and 150 trees of bug
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
Merging origin/master (8faabc041a00 Merge tag 'net-6.13-rc4' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging fixes/fixes (fac04efc5c79 Linux 6.13-rc2)
Merging ext4-fixes/fixes (4a622e4d477b ext4: fix FS_IOC_GETFSMAP handling)
Merging vfs-brauner-fixes/vfs.fixes (2b2fc0be98a8 fs: fix missing declarati=
on of init_files)
Merging fscrypt-current/for-current (8e929cb546ee Linux 6.12-rc3)
Merging fsverity-current/for-current (8e929cb546ee Linux 6.12-rc3)
Merging btrfs-fixes/next-fixes (1c4c399d5213 Merge branch 'misc-6.13' into =
next-fixes)
Merging vfs-fixes/fixes (678379e1d4f7 close_range(): fix the logics in desc=
riptor table trimming)
Merging erofs-fixes/fixes (6422cde1b0d5 erofs: use buffered I/O for file-ba=
cked mounts by default)
Merging nfsd-fixes/nfsd-fixes (9048cf05a17a NFSD: fix management of pending=
 async copies)
Merging v9fs-fixes/fixes/next (684a64bf32b6 Merge tag 'nfs-for-6.12-1' of g=
it://git.linux-nfs.org/projects/anna/linux-nfs)
Merging overlayfs-fixes/ovl-fixes (228a1157fb9f Merge tag '6.13-rc-part1-SM=
B3-client-fixes' of git://git.samba.org/sfrench/cifs-2.6)
Merging bcachefs/for-next (ca2e7a3de895 bcachefs: Fix assert for online fsc=
k)
Merging fscrypt/for-next (8e929cb546ee Linux 6.12-rc3)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (0b76cc2fbe45 Merge branch 'for-next-next-v6.13-2024=
1218' into for-next-20241218)
Merging ceph/master (18d44c5d062b ceph: allocate sparse_ext map only for sp=
arse reads)
Merging cifs/for-next (02ef599bb247 smb: enable reuse of deferred file hand=
les for write operations)
Merging configfs/for-next (84147f4e84c4 configfs: improve item creation per=
formance)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (6784ed98fde5 dlm: return -ENOENT if no comm was found)
Merging erofs/dev (0bc8061ffc73 erofs: handle NONHEAD !delta[1] lclusters g=
racefully)
Merging exfat/dev (d141e72aeffc exfat: fix the new buffer was not zeroed be=
fore writing)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (71358f64c41b Merge inotify strcpy hardening.)
Merging ext4/dev (3e7c69cdb053 jbd2: Fix comment describing journal_init_co=
mmon())
Merging f2fs/dev (76f01376df39 f2fs: ensure that node info flags are always=
 initialized)
Merging fsverity/for-next (8e929cb546ee Linux 6.12-rc3)
Merging fuse/for-next (78f2560fc9fa fuse: Set *nbytesp=3D0 in fuse_get_user=
_pages on allocation failure)
Merging gfs2/for-next (ead64b20f16e gfs2: reorder capability check last)
Merging jfs/jfs-next (a174706ba4da jfs: add a check to prevent array-index-=
out-of-bounds in dbAdjTree)
Merging ksmbd/ksmbd-for-next (466b2d40f60c Merge tag 'v6.13-rc3-ksmbd-serve=
r-fixes' of git://git.samba.org/ksmbd)
Merging nfs/linux-next (bedb4e6088a8 fs/nfs: fix missing declaration of nfs=
_idmap_cache_timeout)
Merging nfs-anna/linux-next (867da60d463b nfs: avoid i_lock contention in n=
fs_clear_invalid_mapping)
Merging nfsd/nfsd-next (78d4f34e2115 Linux 6.13-rc3)
Merging ntfs3/master (1f2bf7049f6e ntfs3: Remove an access to page->index)
Merging orangefs/for-next (96319dacaf15 orangefs: Constify struct kobj_type)
Merging overlayfs/overlayfs-next (c8b359dddb41 ovl: Filter invalid inodes w=
ith missing lookup function)
Merging ubifs/next (b29bf7119d6b jffs2: Fix rtime decompressor)
Merging v9fs/9p-next (e0260d530b73 net/9p/usbg: allow building as standalon=
e module)
Merging v9fs-ericvh/ericvh/for-next (684a64bf32b6 Merge tag 'nfs-for-6.12-1=
' of git://git.linux-nfs.org/projects/anna/linux-nfs)
Merging xfs/for-next (bf354410af83 Merge tag 'xfs-6.13-fixes_2024-12-12' of=
 https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux into next=
-rc)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging file-locks/locks-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6-=
mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging iversion/iversion-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6=
-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging vfs-brauner/vfs.all (ef5bbd2a2868 Merge branch 'vfs-6.14.mount' int=
o vfs.all)
Merging vfs/for-next (5cc68af412a9 fs/overlayfs/namei.c: get rid of include=
 ../internal.h)
Merging mm-hotfixes/mm-hotfixes-unstable (1aefbedee74b ocfs2: fix slab-use-=
after-free due to dangling pointer dqi_priv)
Merging fs-current (17261b76798a Merge branch 'nfsd-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/cel/linux)
Merging kbuild-current/fixes (fac04efc5c79 Linux 6.13-rc2)
Merging arc-current/for-curr (78d4f34e2115 Linux 6.13-rc3)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (ce03573a1917 kselftest/arm64: abi: fix =
SVCR detection)
Merging arm-soc-fixes/arm/fixes (f578281000c5 Merge tag 'ffa-fix-6.13' of h=
ttps://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into arm/=
fixes)
Merging davinci-current/davinci/for-current (9852d85ec9d4 Linux 6.12-rc1)
Merging drivers-memory-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging sophgo-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging m68k-current/for-linus (647619b6bd27 m68k: defconfig: Update defcon=
figs for v6.12-rc1)
Merging powerpc-fixes/fixes (fac04efc5c79 Linux 6.13-rc2)
Merging s390-fixes/fixes (282da38b4653 s390/mm: Consider KMSAN modules meta=
data for paging levels)
Merging net/main (8faabc041a00 Merge tag 'net-6.13-rc4' of git://git.kernel=
.org/pub/scm/linux/kernel/git/netdev/net)
Merging bpf/master (716f2bca1ce9 selftests/bpf: Fix compilation error in ge=
t_uprobe_offset())
Merging ipsec/master (e952837f3ddb xfrm: state: fix out-of-bounds read duri=
ng lookup)
Merging netfilter/main (31f1b55d5d7e net :mana :Request a V2 response versi=
on for MANA_QUERY_GF_STAT)
Merging ipvs/main (31f1b55d5d7e net :mana :Request a V2 response version fo=
r MANA_QUERY_GF_STAT)
Merging wireless/for-next (146b6057e1fd wifi: cw1200: Fix potential NULL de=
reference)
Merging ath/for-current (f1d3334d604c wifi: cfg80211: sme: init n_channels =
before channels[] access)
Merging wpan/master (eb09fbeb4870 mac802154: check local interfaces before =
deleting sdata list)
Merging rdma-fixes/for-rc (7179fe0074a3 RDMA/bnxt_re: Fix reporting hw_ver =
in query_device)
Merging sound-current/for-linus (7b26bc6582b1 Merge tag 'asoc-fix-v6.12-rc2=
' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for=
-linus)
Merging sound-asoc-fixes/for-linus (32c9c06adb5b ASoC: mediatek: disable bu=
ffer pre-allocation)
Merging regmap-fixes/for-linus (fac04efc5c79 Linux 6.13-rc2)
Merging regulator-fixes/for-linus (13221496065f regulator: rename regulator=
-uv-survival-time-ms according to DT binding)
Merging spi-fixes/for-linus (7f9a1eed1ad8 spi: rockchip-sfc: Fix error in r=
emove progress)
Merging pci-current/for-linus (774c71c52aa4 PCI/bwctrl: Enable only if more=
 than one speed is supported)
Merging driver-core.current/driver-core-linus (78d4f34e2115 Linux 6.13-rc3)
Merging tty.current/tty-linus (78d4f34e2115 Linux 6.13-rc3)
Merging usb.current/usb-linus (1b62f3cb74d2 Merge tag 'thunderbolt-for-v6.1=
3-rc4' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunde=
rbolt into usb-linus)
Merging usb-serial-fixes/usb-linus (8366e64a4454 USB: serial: option: add T=
elit FE910C04 rmnet compositions)
Merging phy/fixes (9d23e4865462 phy: rockchip: samsung-hdptx: Set drvdata b=
efore enabling runtime PM)
Merging staging.current/staging-linus (78d4f34e2115 Linux 6.13-rc3)
Merging iio-fixes/fixes-togreg (f248a1066cf0 iio: light: as73211: fix chann=
el handling in only-color triggered buffer)
Merging counter-current/counter-current (fac04efc5c79 Linux 6.13-rc2)
Merging char-misc.current/char-misc-linus (e16ebd9d839d Merge tag 'mhi-fixe=
s-for-v6.13' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/mani/mhi=
 into char-misc-linus)
Merging soundwire-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging thunderbolt-fixes/fixes (24740385cb0d thunderbolt: Improve redrive =
mode handling)
Merging input-current/for-linus (1863f213d3e8 Input: mma8450 - add chip ID =
check in probe)
Merging crypto-current/master (cd26cd654767 crypto: hisilicon/debugfs - fix=
 the struct pointer incorrectly offset problem)
Merging vfio-fixes/for-linus (9c7c5430bca3 vfio/mlx5: Align the page tracki=
ng max message size with the device capability)
Merging kselftest-fixes/fixes (777f290ab328 selftests/ftrace: adjust offset=
 for kprobe syntax error test)
Merging dmaengine-fixes/fixes (dcbef0798eb8 dmaengine: amd: qdma: Remove us=
ing the private get and set dma_ops APIs)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (140054a25f85 mtd: rawnand: omap2: Fix build wa=
rnings with W=3D1)
Merging mfd-fixes/for-mfd-fixes (68f860426d50 mfd: axp20x: AXP717: Fix miss=
ing IRQ status registers range)
Merging v4l-dvb-fixes/fixes (8b55f8818900 media: mediatek: vcodec: mark vde=
c_vp9_slice_map_counts_eob_coef noinline)
Merging reset-fixes/reset/fixes (1f8af9712413 reset: rzg2l-usbphy-ctrl: Ass=
ign proper of node to the allocated device)
Merging mips-fixes/mips-fixes (40384c840ea1 Linux 6.13-rc1)
Merging at91-fixes/at91-fixes (40384c840ea1 Linux 6.13-rc1)
Merging omap-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging kvm-fixes/master (7d4050728c83 Merge tag 'vfs-6.13-rc1.fixes' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs)
Merging kvms390-fixes/master (cff59d8631e1 s390/uv: Panic for set and remov=
e shared access UVC errors)
Merging hwmon-fixes/hwmon (dd471e25770e hwmon: (tmp513) Fix interpretation =
of values of Temperature Result and Limit Registers)
Merging nvdimm-fixes/libnvdimm-fixes (265e98f72bac acpi: nfit: vmalloc-out-=
of-bounds Read in acpi_nfit_ctl)
Merging cxl-fixes/fixes (76467a94810c cxl/region: Fix region creation for g=
reater than x2 switches)
Merging dma-mapping-fixes/for-linus (78b2770c935f dma-mapping: fix tracing =
dma_alloc/free with vmalloc'd memory)
Merging drivers-x86-fixes/fixes (185e1b1d91e4 platform/x86: mlx-platform: c=
all pci_dev_put() to balance the refcount)
Merging samsung-krzk-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging pinctrl-samsung-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging devicetree-fixes/dt/linus (0f7ca6f69354 of/irq: Fix using uninitial=
ized variable @addr_len in API of_irq_parse_one())
Merging dt-krzk-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging scsi-fixes/fixes (f103396ae318 scsi: ufs: core: Update compl_time_s=
tamp_local_clock after completing a cqe)
Merging drm-fixes/drm-fixes (87fd88332567 Merge tag 'drm-misc-fixes-2024-12=
-19' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (1622ed27d26a i915/guc: Accumu=
late active runtime on gt reset)
Merging mmc-fixes/fixes (8d90a86ed053 mmc: sdhci-msm: fix crypto key evicti=
on)
Merging rtc-fixes/rtc-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging gnss-fixes/gnss-linus (40384c840ea1 Linux 6.13-rc1)
Merging hyperv-fixes/hyperv-fixes (175c71c2acee tools/hv: reduce resource u=
sage in hv_kvp_daemon)
Merging risc-v-fixes/fixes (21f1b85c8912 riscv: mm: Do not call pmd dtor on=
 vmemmap page table teardown)
Merging riscv-dt-fixes/riscv-dt-fixes (8d19d5a76bf6 riscv: dts: starfive: F=
ix a typo in StarFive JH7110 pin function definitions)
Merging riscv-soc-fixes/riscv-soc-fixes (48808b55b07c firmware: microchip: =
fix UL_IAP lock check in mpfs_auto_update_state())
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (e70140ba0d2b Get rid of 'remove_new' relic from pl=
atform driver struct)
Merging gpio-brgl-fixes/gpio/for-current (78d4f34e2115 Linux 6.13-rc3)
Merging gpio-intel-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging pinctrl-intel-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging auxdisplay-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging kunit-fixes/kunit-fixes (40384c840ea1 Linux 6.13-rc1)
Merging memblock-fixes/fixes (180bbad69864 arch_numa: Restore nid checks be=
fore registering a memblock with a node)
Merging renesas-fixes/fixes (124f4f1a1869 MAINTAINERS: Re-add cancelled Ren=
esas driver sections)
Merging perf-current/perf-tools (434fffa926b1 perf probe: Fix uninitialized=
 variable)
Merging efi-fixes/urgent (145ac100b637 efi/esrt: remove esre_attribute::sto=
re())
Merging zstd-fixes/zstd-linus (77618db34645 zstd: Fix array-index-out-of-bo=
unds UBSAN warning)
Merging battery-fixes/fixes (b3ded6072c56 power: supply: bq24190: Fix BQ242=
96 Vbus regulator support)
Merging iommufd-fixes/for-rc (2ca704f55e22 iommu/arm-smmu-v3: Improve uAPI =
comment for IOMMU_HW_INFO_TYPE_ARM_SMMUV3)
Merging rust-fixes/rust-fixes (78d4f34e2115 Linux 6.13-rc3)
Merging w1-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging pmdomain-fixes/fixes (f64f610ec6ab pmdomain: core: add dummy releas=
e function to genpd device)
Merging i2c-host-fixes/i2c/i2c-host-fixes (06b911b17b64 i2c: imx: add imx7d=
 compatible string for applying erratum ERR007805)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (f4bf0b909a6b clk: thead: Fix TH1520 emmc and s=
hdci clock rate)
Merging pwrseq-fixes/pwrseq/for-current (40384c840ea1 Linux 6.13-rc1)
Merging thead-dt-fixes/thead-dt-fixes (40384c840ea1 Linux 6.13-rc1)
Merging ftrace-fixes/ftrace/fixes (166438a432d7 ftrace: Do not find "true_p=
arent" if HAVE_DYNAMIC_FTRACE_WITH_ARGS is not set)
Merging ring-buffer-fixes/ring-buffer/fixes (8cd63406d081 trace/ring-buffer=
: Do not use TP_printk() formatting for boot mapped buffers)
Merging trace-fixes/trace/fixes (afd2627f727b tracing: Check "%s" dereferen=
ce via the field and not the TP_printk format)
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (819837584309 Linux 6.12-rc5)
Merging tip-fixes/tip/urgent (4022ad48f0b0 Merge branch into tip/master: 'x=
86/urgent')
Merging slab-fixes/slab/for-next-fixes (b7ffecbe198e memcg: slub: fix SUnre=
claim for post charged objects)
Merging drm-msm-fixes/msm-fixes (789384eb1437 drm/msm/dpu: check dpu_plane_=
atomic_print_state() for valid sspp)
Merging drm-misc-fixes/for-linux-next-fixes (1b684ca15f9d drm/sched: Fix dr=
m_sched_fini() docu generation)
Merging mm-stable/mm-stable (78d4f34e2115 Linux 6.13-rc3)
Merging mm-nonmm-stable/mm-nonmm-stable (78d4f34e2115 Linux 6.13-rc3)
Merging mm/mm-everything (45f41efd96f2 foo)
Applying: fix up for "mm: replace free hugepage folios after migration"
Merging kbuild/for-next (8f2db654f79c kbuild: suppress stdout from merge_co=
nfig for silent builds)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (233157785a34 perf python: Correctly throw Ind=
exError)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/for-next (aef7ee7649e0 dma-debug: fix physical address =
calculation for struct dma_debug_entry)
Merging asm-generic/master (0af8e32343f8 empty include/asm-generic/vga.h)
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (6139f7913689 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (d6ab634f1b32 Merge branches 'for-next/cpufeatu=
re', 'for-next/docs', 'for-next/misc' and 'for-next/mm' into for-next/core)
Merging arm-perf/for-next/perf (f3edf03a4c59 perf: imx9_perf: Introduce AXI=
 filter version to refactor the driver and better extension)
Merging arm-soc/for-next (6c2bb9f225bc Merge branch 'soc/defconfig' into fo=
r-next)
Merging amlogic/for-next (4de5110762b9 Merge branch 'v6.14/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (ffc253263a13 Linux 6.6)
Merging aspeed/for-next (2eff056a229e ARM: dts: aspeed: Blueridge and Fuji:=
 Fix LED node names)
Merging at91/at91-next (cf3011dfad42 Merge branch 'at91-dt' into at91-next)
Merging broadcom/next (ed54a84051c6 Merge branch 'devicetree/next' into dev=
icetree-arm64/next)
Merging davinci/davinci/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging drivers-memory/for-next (ef683ac22848 Merge branch 'mem-ctrl-next' =
into for-next)
Merging imx-mxs/for-next (4b534cfc654f Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (3d7fdd8e38aa arm64: dts: mediatek: mt8195: Remov=
e suspend-breaking reset from pcie1)
Merging mvebu/for-next (5f55ff35bfaa Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (2179717e0b0c Merge branch 'omap-for-v6.14/drivers' i=
nto tmp/omap-next-20241213.091057)
Merging qcom/for-next (e43857dccff0 Merge branches 'arm64-defconfig-for-6.1=
4', 'arm64-fixes-for-6.13', 'arm64-for-6.14', 'clk-for-6.14', 'drivers-fixe=
s-for-6.13' and 'drivers-for-6.14' into for-next)
Merging renesas/next (9f197ec80b0a Merge branch 'renesas-dts-for-v6.14' int=
o renesas-next)
Merging reset/reset/next (3d99f9231bed reset: amlogic: add support for A1 S=
oC in auxiliary reset driver)
Merging rockchip/for-next (67ab119bd113 Merge branch 'v6.14-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (51a4b945a726 Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (6647416db021 Merge branch 'for-next/scmi/updat=
es' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linu=
x into for-linux-next)
Merging sophgo/for-next (40384c840ea1 Linux 6.13-rc1)
Merging spacemit/for-next (f187e72262c3 MAINTAINERS: setup support for Spac=
emiT SoC tree)
Merging stm32/stm32-next (b7ebfb84a09d arm64: dts: st: enable imx335/csi/dc=
mipp pipeline on stm32mp257f-ev1)
Merging sunxi/sunxi/for-next (20296f8baa25 ARM: dts: suniv: f1c100s: Activa=
te Audio Codec for Lichee Pi Nano)
Merging tee/next (a7562ff02879 Merge branch 'optee_for_v6.14' into next)
Merging tegra/for-next (ca398b41b0a3 Merge branch for-6.14/arm/dt into for-=
next)
Merging thead-dt/thead-dt-for-next (c95c1362e5bc riscv: dts: thead: Add mai=
lbox node)
Merging ti/ti-next (40384c840ea1 Linux 6.13-rc1)
Merging xilinx/for-next (18b1e1ae30c7 arm64: zynqmp: add clock-output-names=
 property in clock nodes)
Merging clk/clk-next (2ca8b22801f8 Merge branch 'clk-fixes' into clk-next)
Merging clk-imx/for-next (81a206d736c1 clk: imx: imx8-acm: Fix return value=
 check in clk_imx_acm_attach_pm_domains())
Merging clk-renesas/renesas-clk (0399362e523d clk: renesas: r9a09g047: Add =
I2C clocks/resets)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (7f71507851fc LoongArch: KVM: Protect kvm_=
io_bus_{read,write}() with SRCU)
Merging m68k/for-next (e419ddeabe7e m68k: Use kernel's generic muldi3 libgc=
c function)
Merging m68knommu/for-next (f70638ebe076 m68k: coldfire: Use proper clock r=
ate for timers)
Merging microblaze/next (40384c840ea1 Linux 6.13-rc1)
Merging mips/mips-next (40384c840ea1 Linux 6.13-rc1)
Merging openrisc/for-next (c8f8d4344d50 openrisc: Fix misalignments in head=
.S)
Merging parisc-hd/for-next (df195d931a33 parisc: Remove memcpy_toio and mem=
set_io)
Merging powerpc/next (3a7a53c8d481 selftests/powerpc: Fix typo in test-vphn=
.c)
Merging risc-v/for-next (fac04efc5c79 Linux 6.13-rc2)
Merging riscv-dt/riscv-dt-for-next (708d55db3edb riscv: dts: starfive: jh71=
10-milkv-mars: enable usb0 host function)
Merging riscv-soc/riscv-soc-for-next (a5362510bafc Merge branch 'riscv-conf=
ig-for-next' into riscv-soc-for-next)
Merging s390/for-next (5c06b9849b20 Merge branch 'features' into for-next)
Merging sh/for-next (63e72e551942 sh: intc: Fix use-after-free bug in regis=
ter_intc_controller())
Merging sparc/for-next (b6370b338e71 sparc/vdso: Add helper function for 64=
-bit right shift on 32-bit target)
Merging uml/next (bed2cc482600 hostfs: Fix the NULL vs IS_ERR() bug for __f=
ilemap_get_folio())
Merging xtensa/xtensa-for-next (d14b9a713b34 xtensa/simdisk: Use str_write_=
read() helper in simdisk_transfer())
Merging fs-next (798a556a8e89 Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (9022df7f5e05 Merge branch 'for-6.14-cpu_sync-fixup=
' into for-next)
Merging pci/next (9e1b45d7a5bc Merge branch 'controller/xilinx-cpm')
Merging pstore/for-next/pstore (9852d85ec9d4 Linux 6.12-rc1)
Merging hid/for-next (2f18ba6583d1 Merge branch 'for-6.13/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (78d4f34e2115 Linux 6.13-rc3)
Merging i2c-host/i2c/i2c-host (ee5da79b4f2a i2c: imx: make controller avail=
able until system suspend_noirq() and from resume_noirq())
Merging i3c/i3c/next (6cf7b65f7029 i3c: Use i3cdev->desc->info instead of c=
alling i3c_device_get_info() to avoid deadlock)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (de076198d1e4 hwmon: (pmbus/crps) Add Inte=
l CRPS185 power supply)
Merging jc_docs/docs-next (a3828074b04a Merge branch 'docs-mw' into docs-ne=
xt)
Merging v4l-dvb/next (40ed9e9b2808 media: uvcvideo: Announce the user our d=
eprecation intentions)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (432f1f00f78e Merge branches 'pm-em', 'pm-sleep' and =
'pm-cpufreq' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (a28276cac1f0 dt-bindings: cpufr=
eq: Document support for Airoha EN7581 CPUFreq)
Merging cpupower/cpupower (9d6c0e58514f cpupower: fix TSC MHz calculation)
Merging devfreq/devfreq-next (1f8ac4b95fee PM / devfreq: Switch back to str=
uct platform_driver::remove())
CONFLICT (content): Merge conflict in drivers/devfreq/event/exynos-nocp.c
CONFLICT (content): Merge conflict in drivers/devfreq/event/exynos-ppmu.c
CONFLICT (content): Merge conflict in drivers/devfreq/mtk-cci-devfreq.c
CONFLICT (content): Merge conflict in drivers/devfreq/rk3399_dmc.c
CONFLICT (content): Merge conflict in drivers/devfreq/sun8i-a33-mbus.c
Merging pmdomain/next (094041b17654 pmdomain: Merge branch fixes into next)
Merging opp/opp/linux-next (e0460b08c67a OPP: fix dev_pm_opp_find_bw_*() wh=
en bandwidth table not initialized)
Merging thermal/thermal/linux-next (7d8abc5f3b5c thermal/drivers/imx_sc_the=
rmal: Use dev_err_probe)
Merging rdma/for-next (1950af31dc66 RDMA/bnxt_re: Remove unnecessary header=
 file inclusion)
Merging net-next/main (07e5c4eb94e6 Merge git://git.kernel.org/pub/scm/linu=
x/kernel/git/netdev/net)
Merging bpf-next/for-next (c2ce3bb13ae7 Merge branch 'bpf-next/net' into fo=
r-next)
Merging ipsec-next/master (59af653a6998 Merge branch 'Add IP-TFS mode to xf=
rm')
Merging mlx5-next/mlx5-next (aeb3ec990269 net/mlx5: Add device cap abs_nati=
ve_port_num)
Merging netfilter-next/main (4b252f2dab2e Merge branch 'selftests-net-packe=
tdrill-import-multiple-tests')
Merging ipvs-next/main (f3674384709b Merge branch 'net-smc-two-features-for=
-smc-r')
Merging bluetooth/master (514e14b1a7c3 Bluetooth: MGMT: Mark LL Privacy as =
stable)
Merging wireless-next/for-next (8ab3bf476413 wifi: wlcore: sysfs: constify =
'struct bin_attribute')
Merging ath-next/for-next (578f6fc55c2c wifi: ath12k: Fix spelling mistake =
"requestted" -> "requested")
Merging wpan-next/master (aad4b41a3419 Documentation: ieee802154: fix gramm=
ar)
Merging wpan-staging/staging (aad4b41a3419 Documentation: ieee802154: fix g=
rammar)
Merging mtd/mtd/next (02ba194feacb mtd: mchp48l640: add support for Fujitsu=
 MB85RS128TY FRAM)
Merging nand/nand/next (1a50e3612de9 mtd: spinand: Add support for SkyHigh =
S35ML-3 family)
Merging spi-nor/spi-nor/next (93e00ccab5f7 mtd: spi-nor: macronix: remove m=
x25u25635f from parts list to enable SFDP)
Merging crypto/master (f916e44487f5 crypto: keywrap - remove assignment of =
0 to cra_alignmask)
Merging drm/drm-next (301e2772295e Merge tag 'drm-intel-gt-next-2024-12-18'=
 of https://gitlab.freedesktop.org/drm/i915/kernel into drm-next)
Merging drm-exynos/for-linux-next (a46b48810254 drm/exynos: Remove unnecess=
ary checking)
Merging drm-misc/for-linux-next (74ef9527bd87 drm/amdgpu: track bo memory s=
tats at runtime)
  314d44bc8eaa ("drm/sched: Fix drm_sched_fini() docu generation")
Merging amdgpu/drm-next (a317017f47f6 drm/amd/display: Reapply fdedd77b0eb3)
Merging drm-intel/for-linux-next (96bd1d50bfd3 drm/i915/display: drop unnec=
essary i915_drv.h includes)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dp=
_mst.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_ds=
b.c
Merging drm-msm/msm-next (86313a9cd152 drm/msm/dpu: rework documentation co=
mments)
Merging drm-msm-lumag/msm-next-lumag (d82c9281189d drm/msm/dpu: include SSP=
P allocation state into the dumped state)
Merging drm-xe/drm-xe-next (a8d0aa0e7fcd drm/xe/pf: Use correct function to=
 check LMEM provisioning)
Applying: fix up for "drm/xe/ptl: Add another PTL PCI ID"
Merging etnaviv/etnaviv/next (6bef484c5e9a drm/etnaviv: Add fdinfo support =
for memory stats)
Merging fbdev/for-next (40384c840ea1 Linux 6.13-rc1)
Merging regmap/for-next (eb708cd631a8 regmap: regmap_multi_reg_read(): make=
 register list const)
Merging sound/for-next (42d28736a5a4 ALSA: sonicvibes: Use str_on_off() hel=
per in snd_sonicvibes_proc_read())
Merging ieee1394/for-next (ce4339d021c4 firewire: ohci: use generic power m=
anagement)
Merging sound-asoc/for-next (45f61115972c Merge remote-tracking branch 'aso=
c/for-6.14' into asoc-next)
Merging modules/modules-next (f3fda0dfea98 module: Put known GPL offenders =
in an array)
Merging input/next (e36def244b93 Input: use guard notation in input core)
Merging block/for-next (3af068412d79 Merge branch 'for-6.14/block' into for=
-next)
Applying: fixup for "block: remove BLK_MQ_F_SHOULD_MERGE"
Merging device-mapper/for-next (0bb1968da273 dm array: fix cursor index whe=
n skipping across block boundaries)
Merging libata/for-next (7b64859fde26 ata: sata_gemini: Remove remaining re=
set glue)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (741521fa273f mmc: sdhci-msm: convert to use custom crypto=
 profile)
Merging mfd/for-mfd-next (1061081cbe93 dt-bindings: mfd: Add MDIO interface=
 to rtl9301-switch)
CONFLICT (content): Merge conflict in drivers/mfd/cs42l43.c
Merging backlight/for-backlight-next (40384c840ea1 Linux 6.13-rc1)
Merging battery/for-next (de68987480cb power: supply: gpio-charger: add sup=
port for default charge current limit)
Merging regulator/for-next (8100d74e2ea1 Merge remote-tracking branch 'regu=
lator/for-6.14' into regulator-next)
Merging security/next (7a9b65ab0abd selftests: refactor the lsm `flags_over=
set_lsm_set_self_attr` test)
Merging apparmor/apparmor-next (40384c840ea1 Linux 6.13-rc1)
Merging integrity/next-integrity (08ae3e5f5fc8 integrity: Use static_assert=
() to check struct sizes)
Merging selinux/next (f453a5d339ea Automated merge of 'dev' into 'next')
Merging smack/next (6f71ad02aae8 smack: deduplicate access to string conver=
sion)
Merging tomoyo/master (0476fd4ff452 tomoyo: use realpath if symlink's pathn=
ame refers to procfs)
Merging tpmdd/next (2ba9f676d0a2 Merge tag 'drm-next-2024-11-29' of https:/=
/gitlab.freedesktop.org/drm/kernel)
Merging watchdog/master (78d4f34e2115 Linux 6.13-rc3)
Merging iommu/next (1a28a96a0d6d Merge branches 'riscv', 'core' and 'amd/am=
d-vi' into next)
Merging audit/next (8bea8f86f7a1 Automated merge of 'dev' into 'next')
Merging devicetree/for-next (4c2a458eb5c0 dt-bindings: interrupt-controller=
: arm,gic: Correct VGIC interrupt description)
Merging dt-krzk/for-next (5aab15cd4794 Merge branch 'next/dt64' into for-ne=
xt)
Merging mailbox/for-next (7f9e19f207be mailbox: pcc: Check before sending M=
CTP PCC response ACK)
Merging spi/for-next (36e011f3e1b0 Merge remote-tracking branch 'spi/for-6.=
14' into spi-next)
Merging tip/master (1c875bc67cc9 Merge branch into tip/master: 'x86/tdx')
Merging clockevents/timers/drivers/next (08b97fbd13de clocksource/drivers/a=
rm_arch_timer: Use of_property_present() for non-boolean properties)
Merging edac/edac-for-next (e3e7a5a35d6e Merge edac-misc into for-next)
CONFLICT (content): Merge conflict in drivers/edac/i10nm_base.c
Merging ftrace/for-next (7dbc10961c8a tracing/dynevent: Adopt guard() and s=
coped_guard())
Merging rcu/next (4b5c2205526c Merge branches 'fixes.2024.12.14a', 'rcutort=
ure.2024.12.14a', 'srcu.2024.12.14a' and 'torture-test.2024.12.14a' into rc=
u-merge.2024.12.14a)
CONFLICT (content): Merge conflict in kernel/rcu/tree.c
Merging paulmck/non-rcu/next (b6f62437f431 Merge branches 'csd-lock.2024.10=
.11a', 'lkmm.2024.11.09a' and 'scftorture.2024.11.09a', tag 'nolibc.2024.11=
.01a' into HEAD)
Merging kvm/next (a066bad89c6c Merge tag 'kvm-selftests-treewide-6.14' of h=
ttps://github.com/kvm-x86/linux into HEAD)
Merging kvm-arm/next (60ad25e14ab5 KVM: arm64: Pass on SVE mapping failures)
Merging kvms390/next (7a1f3143377a KVM: s390: selftests: Add regression tes=
ts for PFCR subfunctions)
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (ea6398a5af81 RISC-V: KVM: Fix csr_write -=
> csr_set for HVIEN PMU overflow bit)
Merging kvm-x86/next (13e98294d7ce Merge branches 'fixes', 'misc', 'mmu', '=
svm', 'vcpu_array' and 'vmx')
Merging xen-tip/linux-next (fac04efc5c79 Linux 6.13-rc2)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (de35994ecd2d workqueue: Do not warn when cance=
lling WQ_MEM_RECLAIM work from !WQ_MEM_RECLAIM worker)
Merging sched-ext/for-next (471069f5ae88 Merge branch 'for-6.14' into for-n=
ext)
Merging drivers-x86/for-next (9e0894d07072 platform/x86/amd/pmf: Enable Cus=
tom BIOS Inputs for PMF-TA)
Merging chrome-platform/for-next (a0355d4d55f3 platform/chrome: cros_ec_vbc=
: Constify 'struct bin_attribute')
Merging chrome-platform-firmware/for-firmware-next (7543d5702c2c firmware: =
google: vpd: Use const 'struct bin_attribute' callback)
Merging hsi/for-next (40384c840ea1 Linux 6.13-rc1)
Merging leds-lj/for-leds-next (29df7025cff0 leds: pwm-multicolor: Disable P=
WM when going to suspend)
Merging ipmi/for-next (7868b3a94045 char:ipmi: Fix the wrong format specifi=
er)
Merging driver-core/driver-core-next (5bcc8bfe841b rust: miscdevice: add fo=
ps->show_fdinfo() hook)
Merging usb/usb-next (362a7993ed01 Merge 6.13-rc3 into usb-next)
Merging thunderbolt/next (b5d175beb4d3 thunderbolt: debugfs: Add write capa=
bility to path config space)
Merging usb-serial/usb-next (78d4f34e2115 Linux 6.13-rc3)
Merging tty/tty-next (30691a59c85c Merge 6.13-rc3 into tty-next)
Merging char-misc/char-misc-next (78d4f34e2115 Linux 6.13-rc3)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (56e14a21cee4 coresight-tpda: Optimize the function =
of reading element size)
Merging fastrpc/for-next (9f86299512e0 misc: fastrpc: Rename tgid and pid t=
o client_id)
Merging fpga/for-next (46b155acbf4e fpga: dfl: destroy/recreate feature pla=
tform device on port release/assign)
Merging icc/icc-next (e20f7bfcd21e Merge branch 'icc-fixes' into icc-next)
Merging iio/togreg (4d112ebd02d1 iio: adc: ad-sigma-delta: Document ABI for=
 sigma delta adc)
Merging phy-next/next (b6096751a652 phy: sun4i-usb: Remove unused of_gpio.h)
Merging soundwire/next (40384c840ea1 Linux 6.13-rc1)
Merging extcon/extcon-next (7041ed0dde83 extcon: Drop explicit initializati=
on of struct i2c_device_id::driver_data to 0)
Merging gnss/gnss-next (40384c840ea1 Linux 6.13-rc1)
Merging vfio/next (fe4bf8d0b671 vfio/pci: Properly hide first-in-list PCIe =
extended capability)
Merging w1/for-next (0f28374e99a4 w1: ds28e04: Constify 'struct bin_attribu=
te')
Merging spmi/spmi-next (a45e4aa263d6 spmi: Set fwnode for spmi devices)
Merging staging/staging-next (f9e7f3f9620b Merge 6.13-rc3 into staging-next)
Merging counter-next/counter-next (fac04efc5c79 Linux 6.13-rc2)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (49a9b01803e4 mux: constify mux class)
Merging dmaengine/next (9d880452fb3e dmaengine: amd: qdma: make read-only a=
rrays h2c_types and c2h_types static const)
Merging cgroup/for-next (9b496a8bbed9 cgroup/cpuset: Prevent leakage of iso=
lated CPUs into sched domains)
Merging scsi/for-next (1fb3855b8a12 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (c9a71ca13f71 scsi: Constify struct pci_device_id)
Merging vhost/linux-next (6a39bb15b3d1 virtio_vdpa: remove redundant check =
on desc)
Merging rpmsg/for-next (dbb9c372555c remoteproc: mtk_scp: Only populate dev=
ices for SCP cores)
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (83a9752729c4 dt-bindings: gpio: brcmstb: p=
ermit gpio-line-names property)
Merging gpio-intel/for-next (12b0e305f509 gpio: acpi: switch to device_for_=
each_child_node_scoped())
Merging pinctrl/for-next (38867d5de5f1 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (40384c840ea1 Linux 6.13-rc1)
Merging pinctrl-renesas/renesas-pinctrl (53967d9c146d pinctrl: renesas: rzg=
2l: Add audio clock pins)
Merging pinctrl-samsung/for-next (0ebb1e9e1b12 pinctrl: samsung: update chi=
ld reference drop comment)
Merging pwm/pwm/for-next (cce16e7f6216 pwm: stm32-lp: Add check for clk_ena=
ble())
Merging ktest/for-next (2351e8c65404 ktest.pl: Avoid false positives with g=
rub2 skip regex)
Merging kselftest/next (bd812d285853 selftests: acct: Add ksft_exit_skip if=
 not running as root)
Merging kunit/test (40384c840ea1 Linux 6.13-rc1)
Merging kunit-next/kunit (40384c840ea1 Linux 6.13-rc1)
Merging livepatching/for-next (7e17e80c3a7e Merge branch 'for-6.14/stack-or=
der' into for-next)
Merging rtc/rtc-next (e0779a0dcf41 rtc: ab-eoz9: don't fail temperature rea=
ds on undervoltage notification)
Merging nvdimm/libnvdimm-for-next (f3dd9ae7f03a dax: Remove an unused field=
 in struct dax_operations)
Merging at24/at24/for-next (40384c840ea1 Linux 6.13-rc1)
Merging ntb/ntb-next (c620f56c70eb MAINTAINERS: Update AMD NTB maintainers)
Merging seccomp/for-next/seccomp (8cf8dfceebda seccomp: Stub for !HAVE_ARCH=
_SECCOMP_FILTER)
Merging fsi/next (c5eeb63edac9 fsi: Fix panic on scom file read)
Merging slimbus/for-next (40384c840ea1 Linux 6.13-rc1)
Merging nvmem/for-next (ea4ef69b81f0 nvmem: imx-ocotp-ele: set word length =
to 1)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (13546de23445 iommu/hyper-v: Don't assume cpu_po=
ssible_mask is dense)
Merging auxdisplay/for-next (93b216cb312d auxdisplay: img-ascii-lcd: Consti=
fy struct img_ascii_lcd_config)
Merging kgdb/kgdb/for-next (24b2455fe8fc kdb: fix ctrl+e/a/f/b/d/p/n broken=
 in keyboard mode)
Merging hmm/hmm (40384c840ea1 Linux 6.13-rc1)
Merging cfi/cfi/next (40384c840ea1 Linux 6.13-rc1)
Merging mhi/mhi-next (33c792a22879 Merge branch 'mhi-fixes' into mhi-next)
Merging memblock/for-next (98b7beba1ee6 memblock: uniformly initialize all =
reserved pages to MIGRATE_MOVABLE)
Merging cxl/next (e2b952ffafce ACPI/HMAT: Move HMAT messages to pr_debug())
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (ec4696925da6 efi/libstub: Bump up EFI_MMAP_NR_SLACK_SLOTS=
 to 32)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (c44d336ad5ba mm/slab: Move kvfree_rcu() into SL=
AB)
CONFLICT (content): Merge conflict in kernel/rcu/tree.c
Applying: fix up for "mm/slab: Move kvfree_rcu() into SLAB"
Merging random/master (d18c13697b4d prandom: Include <linux/percpu.h> in <l=
inux/prandom.h>)
Merging landlock/next (78d4f34e2115 Linux 6.13-rc3)
Merging rust/rust-next (0c5928deada1 rust: block: fix formatting in GenDisk=
 doc)
CONFLICT (content): Merge conflict in rust/kernel/miscdevice.rs
CONFLICT (content): Merge conflict in rust/kernel/security.rs
Merging sysctl/sysctl-next (9c738dae9534 sysctl: Reduce dput(child) calls i=
n proc_sys_fill_cache())
Merging execve/for-next/execve (c7c1167fcbbd Merge branch 'for-next/topic/e=
xecve/core' into for-next/execve)
Merging bitmap/bitmap-for-next (af206905fa22 riscv: Always inline bitops)
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (7a059073b08a Merge branch 'for-next/hardening' =
into for-next/kspp)
Merging kspp-gustavo/for-next/kspp (6613476e225e Linux 6.8-rc1)
Merging nolibc/nolibc (40384c840ea1 Linux 6.13-rc1)
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (11534b4de2a1 iommufd: Deal with IOMMU_HWPT_FAULT_=
ID_VALID in iommufd core)
Merging turbostat/next (75de0ab82fb4 tools/power turbostat: Add an NMI colu=
mn)
Merging pwrseq/pwrseq/for-next (93e3c990fcd9 power: sequencing: qcom-wcn: a=
dd support for the WCN6750 PMU)
Merging capabilities-next/caps-next (d48da4d5ed7b security: add trace event=
 for cap_capable)
Merging ipe/next (d881f0eb6f23 scripts: ipe: polgen: remove redundant close=
 and error exit path)
Merging kcsan/next (b86f7c9fad06 kcsan: Remove redundant call of kallsyms_l=
ookup_name())
Merging crc/crc-next (72914faebaab MAINTAINERS: add entry for CRC library)
Merging kthread/for-next (fc7d29fc8771 rcu: Use kthread preferred affinity =
for RCU exp kworkers)
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)

--Sig_/gIanu7dU2UfcOott_vU+1oj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdk/rMACgkQAVBC80lX
0GyNkgf+Jpm7vVfyQeV7vEzN/dwkST/MDWIfksZffgjIXHzdtMKy9gf2r/upt/aV
FpBMpiICvWtyKCYSXGnCZMuFmQcLNAjLdWo6GX6QoXXv8i5YmwYJcRDYRyQ/T+Gy
3o4Vfkd2ZLr0OB9MaPgO7Y5dS1Knm0RrUOsthxTkVjYlnE+kqzrnnFjwHiTgGw0S
wGepeea3DQALGybEn7tPEWnOUL41DqO3kup2l9dBQf9s4sPGNH6sTLSS7+nnljWK
kYrzkrFKFMiuWNvVAIFXCeS8Ov55sORQubaHgwQ7cppCazZ54wq0UwUbtsuxTnGJ
i286OCZ9pevqoSGVReBQkAOyFtjOYg==
=4Lm7
-----END PGP SIGNATURE-----

--Sig_/gIanu7dU2UfcOott_vU+1oj--

