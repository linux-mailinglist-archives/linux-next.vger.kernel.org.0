Return-Path: <linux-next+bounces-3535-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFE9968086
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 09:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D625D1F26846
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 07:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD4415688F;
	Mon,  2 Sep 2024 07:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DKNDTB93"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E069014E2D8;
	Mon,  2 Sep 2024 07:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725261941; cv=none; b=Kirk5VEg7JE+ohkL7bkk8iXi2P0oPcaUXdEqreVpm34n86h241QhZNZCh0Tk/edXUe0OJFgkPg2M+Nd5AnAxkCHQZP7j1mSksnR/4ql1y58ceKV2x+DaHQd+vgB9uMaJzanRFz58llrJYM9zsSvyzjhzdZQTjeFWiDVrsdXp7EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725261941; c=relaxed/simple;
	bh=63iv8QuEIics36ABLQv1SG9xGF94F123Qm8hjOl5iF8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZGtwmqvp2+uiysAADMJ1YKDus1BmSRZekZhI9l0It01aR4Gog/crM/z2PaouRB1nWyhJXgVVvRpRm4RYxvkxV5v58fWtYw7CVyxNa8M2iVcamOOtRXMr6/uLP+Zm54XB6Vwtb3ZRb5W1NujRIbIaqIyjOVlELUoUNCPXaRgoBVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DKNDTB93; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725261934;
	bh=Tpb228GAzdDQIMDBjC4kGrSLXGOM3GI19dIFO+RcKZ4=;
	h=Date:From:To:Cc:Subject:From;
	b=DKNDTB93uARCqnpgDQPuorQp6/uwFl7zQ85i1w3+9HJcgEqekGrxovOCcLM6pDv+c
	 JUuwgeSjt8EEBpReJ9qTL/eTX35hLr0QiX/gYDR6u74iCZNDLJ4joigC/kpni3Yv9f
	 Y1hLHrWRFJ6AdFWcqEME4I5tShs9jAjanQjqrPFIQm4BYNELt11pFhEhLHVsDhLTG8
	 /Ksa0M+t6ROZ015awQjHe4990KWEVwble8NmKH9yyaIV7NwCRnJDjm0tDPsQlOwro1
	 OUd0C0bLey69BaA6jAN39Hfwi65Is1pFDRdbsorNJ+ghxnrkr8wQaimoaMUWGw60S5
	 DdHy2Uz+wVzPg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wy0f63g55z4wd0;
	Mon,  2 Sep 2024 17:25:34 +1000 (AEST)
Date: Mon, 2 Sep 2024 17:25:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 2
Message-ID: <20240902172533.47913274@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GIf_NQsHp9tAqJp4_KJ8wfT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/GIf_NQsHp9tAqJp4_KJ8wfT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20240830:

The f2fs tree gained complex conflicts against the vfs-brauner tree for
which I used the version of the f2fs tree from next-20240830.

The vfs-brauner tree gained conflicts against the fuse and mm trees.

The pm tree gained a conflict against the risc-v tree.

The bluetooth tree lost its build failure.

The sound tree gained a build failure for which I applied a supplied
patch.

The tip tree lost its build failure.

The rust tree gained a conflict against the net-next tree.

Non-merge commits (relative to Linus' tree): 7575
 7804 files changed, 303767 insertions(+), 149060 deletions(-)

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

I am currently merging 375 trees (counting Linus' and 140 trees of bug
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
Merging origin/master (c9f016e72b5c Merge tag 'x86-urgent-2024-09-01' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging vfs-brauner-fixes/vfs.fixes (139591dc610d fscache: delete fscache_c=
ookie_lru_timer when fscache exits to avoid UAF)
Merging fscrypt-current/for-current (256abd8e550c Linux 6.10-rc7)
Merging fsverity-current/for-current (256abd8e550c Linux 6.10-rc7)
Merging btrfs-fixes/next-fixes (fe82e85a25f0 Merge branch 'misc-6.11' into =
next-fixes)
Merging vfs-fixes/fixes (8c86f1a45749 close_range(): fix the logics in desc=
riptor table trimming)
Merging erofs-fixes/fixes (5be63fc19fca Linux 6.11-rc5)
Merging nfsd-fixes/nfsd-fixes (40927f3d0972 nfsd: fix nfsd4_deleg_getattr_c=
onflict in presence of third party lease)
Merging v9fs-fixes/fixes/next (0c3836482481 Linux 6.10)
Merging overlayfs-fixes/ovl-fixes (77a28aa47687 ovl: relax WARN_ON in ovl_v=
erify_area())
Merging bcachefs/for-next (eda6a19570e7 bcachefs: Add pinned to btree cache=
 not freed counters)
Merging fscrypt/for-next (256abd8e550c Linux 6.10-rc7)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (9215f7004816 Merge branch 'for-next-next-v6.11-2024=
0827' into for-next-20240827)
Merging ceph/master (ede0b1d30b82 libceph: use min() to simplify code in ce=
ph_dns_resolve_name())
Merging cifs/for-next (b7a8b72c9318 netfs, cifs: Improve some debugging bit=
s)
Merging configfs/for-next (4425c1d9b44d configfs: improve item creation per=
formance)
Merging dlm/next (652b0ae675fe dlm: add missing -ENOMEM if alloc_workqueue(=
) fails)
Merging erofs/dev (b4f122f3634d erofs: Prevent entering an infinite loop wh=
en i is 0)
Merging exfat/dev (98ad7b9012b5 exfat: Implement sops->shutdown and ioctl)
Merging exportfs/exportfs-next (0c3836482481 Linux 6.10)
Merging ext3/for_next (85f22bb5d2c2 Merge UDF consistency fixes.)
Merging ext4/dev (dda898d7ffe8 ext4: dax: fix overflowing extents beyond in=
ode size when partially writing)
Merging f2fs/dev (c6f1758f7a68 f2fs: get rid of page->index)
$ git reset --hard HEAD^
Merging next-20240830 version of f2fs
Merging fsverity/for-next (256abd8e550c Linux 6.10-rc7)
Merging fuse/for-next (5fb9c98e9d8d fuse: add support for no forget request=
s)
Merging gfs2/for-next (6cb9df81a2c4 gfs2: fix double destroy_workqueue erro=
r)
Merging jfs/jfs-next (d64ff0d23067 jfs: check if leafidx greater than num l=
eaves per dmap tree)
Merging ksmbd/ksmbd-for-next (844436e045ac ksmbd: Unlock on in ksmbd_tcp_se=
t_interfaces())
Merging nfs/linux-next (47ac09b91bef Linux 6.11-rc4)
Merging nfs-anna/linux-next (f92214e4c312 NFS: Avoid unnecessary rescanning=
 of the per-server delegation list)
Merging nfsd/nfsd-next (617fa6a6bf6b NFSD: Add initial generated XDR defini=
tions and functions for NFSv4)
Merging ntfs3/master (7529036a025a fs/ntfs3: Rename ntfs3_setattr into ntfs=
_setattr)
Merging orangefs/for-next (53e4efa470d5 orangefs: fix out-of-bounds fsid ac=
cess)
Merging overlayfs/overlayfs-next (7d6899fb69d2 ovl: fsync after metadata co=
py-up)
Merging ubifs/next (92a286e90203 ubi: Fix ubi_init() ubiblock_exit() sectio=
n mismatch)
Merging v9fs/9p-next (2211561723a6 9p: Enable multipage folios)
Merging v9fs-ericvh/ericvh/for-next (0c3836482481 Linux 6.10)
Merging xfs/for-next (a24cae8fc1f1 xfs: reset rootdir extent size hint afte=
r growfsrt)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging file-locks/locks-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6-=
mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging iversion/iversion-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6=
-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging vfs-brauner/vfs.all (d38e08d37ef9 Merge branch 'vfs.procfs' into vf=
s.all Signed-off-by: Christian Brauner <brauner@kernel.org>)
CONFLICT (content): Merge conflict in fs/exfat/inode.c
CONFLICT (content): Merge conflict in fs/fuse/inode.c
CONFLICT (content): Merge conflict in include/uapi/linux/fuse.h
Applying: fixup for "fs: Convert aops->write_end to take a folio"
Merging vfs/for-next (a38297e3fb01 Linux 6.9)
Merging fixes/fixes (2dde18cd1d8f Linux 6.5)
Merging mm-hotfixes/mm-hotfixes-unstable (eb2cebfe36f0 alloc_tag: fix alloc=
ation tag reporting when CONFIG_MODULES=3Dn)
Merging fs-current (e15838b43148 Merge branch 'fixes' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging kbuild-current/fixes (d2bafcf224f3 Merge tag 'cgroup-for-6.11-rc4-f=
ixes' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup)
Merging arc-current/for-curr (e67572cd2204 Linux 6.9-rc6)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (75c8f387dd16 Merge tag 'kvmarm-fixes-6.=
11-2' of git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into f=
or-next/fixes)
Merging arm-soc-fixes/arm/fixes (9cc7b1705141 Merge tag 'at91-fixes-6.11' o=
f https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/fixes)
Merging davinci-current/davinci/for-current (6613476e225e Linux 6.8-rc1)
Merging drivers-memory-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging sophgo-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging m68k-current/for-linus (21b9e722ad28 m68k: cmpxchg: Fix return valu=
e for default case in __arch_xchg())
Merging powerpc-fixes/fixes (734ad0af3609 powerpc/qspinlock: Fix deadlock i=
n MCS queue)
Merging s390-fixes/fixes (1642285e511c s390/boot: Fix KASLR base offset off=
 by __START_KERNEL bytes)
Merging net/main (9b0874286768 Merge branch 'mctp-serial-tx-escapes')
Merging bpf/master (b408473ea01b bpf: Fix a crash when btf_parse_base() ret=
urns an error pointer)
Merging ipsec/master (89a2aefe4b08 xfrm: call xfrm_dev_policy_delete when k=
ill policy)
Merging netfilter/main (febccb39255f nfc: pn533: Add poll mod list filling =
check)
Merging ipvs/main (febccb39255f nfc: pn533: Add poll mod list filling check)
Merging wireless/for-next (094513f8a2fb wifi: iwlwifi: clear trans->state e=
arlier upon error)
Merging ath/for-current (9abf199943a6 wifi: ath11k: fix NULL pointer derefe=
rence in ath11k_mac_get_eirp_power())
Merging wpan/master (3682c302e72d ieee802154: Correct spelling in nl802154.=
h)
Merging rdma-fixes/for-rc (8400291e289e Linux 6.11-rc1)
Merging sound-current/for-linus (e9481d9b83f8 ALSA: hda: add HDMI codec ID =
for Intel PTL)
Merging sound-asoc-fixes/for-linus (77212f300bfd ASoC: codecs: lpass-va-mac=
ro: set the default codec version for sm8250)
Merging regmap-fixes/for-linus (60f90cdf816c Merge remote-tracking branch '=
regmap/for-6.10' into regmap-linus)
Merging regulator-fixes/for-linus (1a5caec7f80c regulator: core: Stub devm_=
regulator_bulk_get_const() if !CONFIG_REGULATOR)
Merging spi-fixes/for-linus (2920294686ec spi: intel: Add check devm_kaspri=
ntf() returned value)
Merging pci-current/for-linus (150b572a7c1d MAINTAINERS: PCI: Add NXP PCI c=
ontroller mailing list imx@lists.linux.dev)
Merging driver-core.current/driver-core-linus (47ac09b91bef Linux 6.11-rc4)
Merging tty.current/tty-linus (47ac09b91bef Linux 6.11-rc4)
Merging usb.current/usb-linus (58c2fa54257d Merge tag 'usb-serial-6.11-rc6'=
 of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial int=
o usb-linus)
Merging usb-serial-fixes/usb-linus (9a471de516c3 USB: serial: option: add M=
eiG Smart SRM825L)
Merging phy/fixes (5af9b304bc60 phy: xilinx: phy-zynqmp: Fix SGMII linkup f=
ailure on resume)
Merging staging.current/staging-linus (8400291e289e Linux 6.11-rc1)
Merging iio-fixes/fixes-togreg (0a3b517c8089 iio: imu: inv_mpu6050: fix int=
errupt status read for old buggy chips)
Merging counter-current/counter-current (8400291e289e Linux 6.11-rc1)
Merging char-misc.current/char-misc-linus (47ac09b91bef Linux 6.11-rc4)
Merging soundwire-fixes/fixes (ab8d66d132bc soundwire: stream: fix programm=
ing slave ports for non-continous port maps)
Merging thunderbolt-fixes/fixes (5be63fc19fca Linux 6.11-rc5)
Merging input-current/for-linus (c472d33bcbf7 Input: cypress_ps2 - fix wait=
ing for command response)
Merging crypto-current/master (df1e9791998a hwrng: core - remove (un)regist=
er_miscdev())
Merging vfio-fixes/for-linus (5a88a3f67e37 vfio/pci: Init the count variabl=
e in collecting hot-reset devices)
Merging kselftest-fixes/fixes (170c966cbe27 selftests: ksft: Fix finished()=
 helper exit code on skipped tests)
Merging dmaengine-fixes/fixes (9f646ff25c09 dmaengine: dw-edma: Do not enab=
le watermark interrupts for HDMA)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (bd92c1e07beb mtd: hyperbus: rpc-if: Add missin=
g MODULE_DEVICE_TABLE)
Merging mfd-fixes/for-mfd-fixes (68f860426d50 mfd: axp20x: AXP717: Fix miss=
ing IRQ status registers range)
Merging v4l-dvb-fixes/fixes (63de936b513f media: atomisp: Fix streaming no =
longer working on BYT / ISP2400 devices)
Merging reset-fixes/reset/fixes (ab35896730a5 reset: hisilicon: hi6220: add=
 missing MODULE_DESCRIPTION() macro)
Merging mips-fixes/mips-fixes (5be63fc19fca Linux 6.11-rc5)
Merging at91-fixes/at91-fixes (e9408fa234fb MAINTAINERS: Update DTS path fo=
r ARM/Microchip (AT91) SoC)
Merging omap-fixes/fixes (5062d9c0cbbc ARM: dts: omap3-n900: correct the ac=
celerometer orientation)
Merging kvm-fixes/master (1c0e5881691a KVM: SEV: uapi: fix typo in SEV_RET_=
INVALID_CONFIG)
Merging kvms390-fixes/master (cff59d8631e1 s390/uv: Panic for set and remov=
e shared access UVC errors)
Merging hwmon-fixes/hwmon (6a422a96bc84 hwmon: ltc2991: fix register bits d=
efines)
Merging nvdimm-fixes/libnvdimm-fixes (d5240fa65db0 nvdimm/pmem: Set dax fla=
g for all 'PFN_MAP' cases)
Merging cxl-fixes/fixes (2c402bd2e85b cxl/test: Skip cxl_setup_parent_dport=
() for emulated dports)
Merging dma-mapping-fixes/for-linus (75961ffb5cb3 swiotlb: initialise restr=
icted pool list_head when SWIOTLB_DYNAMIC=3Dy)
Merging drivers-x86-fixes/fixes (a3379eca24a7 platform/x86: x86-android-tab=
lets: Make Lenovo Yoga Tab 3 X90F DMI match less strict)
Merging samsung-krzk-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging pinctrl-samsung-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging devicetree-fixes/dt/linus (b739dffa5d57 of/irq: Prevent device addr=
ess out-of-bounds read in interrupt map walk)
Merging dt-krzk-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging scsi-fixes/fixes (0f9592ae26ff scsi: ufs: ufs-mediatek: Add UFSHCD_=
QUIRK_BROKEN_LSDBS_CAP)
Merging drm-fixes/drm-fixes (27f5b729cb56 Merge tag 'drm-misc-fixes-2024-08=
-29' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (a2ccc33b88e2 drm/i915/dp_mst:=
 Fix MST state after a sink reset)
Merging mmc-fixes/fixes (8396c793ffdf mmc: dw_mmc: Fix IDMAC operation with=
 pages bigger than 4K)
Merging rtc-fixes/rtc-fixes (8400291e289e Linux 6.11-rc1)
Merging gnss-fixes/gnss-linus (8400291e289e Linux 6.11-rc1)
Merging hyperv-fixes/hyperv-fixes (4430556935db Drivers: hv: vmbus: Fix the=
 misplaced function description)
Merging risc-v-fixes/fixes (32d5f7add080 Merge patch series "RISC-V: hwprob=
e: Misaligned scalar perf fix and rename")
Merging riscv-dt-fixes/riscv-dt-fixes (7d9d88890f04 MAINTAINERS: invert Mis=
c RISC-V SoC Support's pattern)
Merging riscv-soc-fixes/riscv-soc-fixes (591940e22e28 firmware: microchip: =
fix incorrect error report of programming:timeout on success)
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (47ac09b91bef Linux 6.11-rc4)
Merging gpio-brgl-fixes/gpio/for-current (47ac09b91bef Linux 6.11-rc4)
Merging gpio-intel-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging pinctrl-intel-fixes/fixes (a366e46da10d pinctrl: meteorlake: Add Ar=
row Lake-H/U ACPI ID)
Merging auxdisplay-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging kunit-fixes/kunit-fixes (f2c6dbd22017 kunit: Device wrappers should=
 also manage driver name)
Merging memblock-fixes/fixes (8043832e2a12 memblock: use numa_valid_node() =
helper to check for invalid node ID)
Merging renesas-fixes/fixes (8c987693dc2d ARM: dts: renesas: rcar-gen2: Add=
 missing #interrupt-cells to DA9063 nodes)
Merging perf-current/perf-tools (478e3c7ebbe7 perf daemon: Fix the build on=
 more 32-bit architectures)
Merging efi-fixes/urgent (ae835a96d72c x86/efistub: Revert to heap allocate=
d boot_params for PE entrypoint)
Merging zstd-fixes/zstd-linus (77618db34645 zstd: Fix array-index-out-of-bo=
unds UBSAN warning)
Merging battery-fixes/fixes (7c626ce4bae1 Linux 6.11-rc3)
Merging iommufd-fixes/for-rc (cf1e515c9a40 iommufd/selftest: Make dirty_ops=
 static)
Merging rust-fixes/rust-fixes (8e95e53ca379 rust: allow `stable_features` l=
int)
Merging w1-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging pmdomain-fixes/fixes (9ec87c5957ea OPP: Fix support for required OP=
Ps for multiple PM domains)
Merging i2c-host-fixes/i2c/i2c-host-fixes (5be63fc19fca Linux 6.11-rc5)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (538d5477b252 clk: starfive: jh7110-sys: Add no=
tifier for PLL0 clock)
Merging pwrseq-fixes/pwrseq/for-current (d8b762070c3f power: sequencing: qc=
om-wcn: set the wlan-enable GPIO to output)
Merging thead-dt-fixes/thead-dt-fixes (8400291e289e Linux 6.11-rc1)
Merging drm-misc-fixes/for-linux-next-fixes (f33b9ab0495b nouveau: fix the =
fwsec sb verification register.)
Merging mm-stable/mm-stable (47ac09b91bef Linux 6.11-rc4)
Merging mm-nonmm-stable/mm-nonmm-stable (47ac09b91bef Linux 6.11-rc4)
Merging mm/mm-everything (d09c2981aaf6 foo)
Merging kbuild/for-next (9f18baf3dd65 kbuild: remove recent dependency on "=
truncate" program)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (39c243411bdb perf sched timehist: Fixed times=
tamp error when unable to confirm event sched_in time)
  2518e13275ab ("perf python: Fix the build on 32-bit arm by including miss=
ing "util/sample.h"")
  37e2a19c98bf ("perf test pmu: Set uninitialized PMU alias to null")
  6236ebe07131 ("perf daemon: Fix the build on more 32-bit architectures")
  74fd69a35cae ("perf lock contention: Fix spinlock and rwlock accounting")
CONFLICT (content): Merge conflict in tools/perf/tests/pmu.c
Merging compiler-attributes/compiler-attributes (8400291e289e Linux 6.11-rc=
1)
Merging dma-mapping/for-next (b5c58b2fdc42 dma-mapping: direct calls for dm=
a-iommu)
Merging asm-generic/master (b82c1d235a30 syscalls: add back legacy __NR_nfs=
servctl macro)
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (3cbbf97c8ea7 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (aac4a336806e Merge branches 'for-next/acpi', '=
for-next/errata', 'for-next/misc', 'for-next/perf', 'for-next/pkvm-guest', =
'for-next/selftests' and 'for-next/timers' into for-next/core)
Merging arm-perf/for-next/perf (7c626ce4bae1 Linux 6.11-rc3)
Merging arm-soc/for-next (3536c01d6577 Merge tag 'riscv-soc-fixes-for-v6.11=
-rc6' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into a=
rm/fixes)
Merging amlogic/for-next (1565ad6d5afc Merge branch 'v6.12/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (ffc253263a13 Linux 6.6)
Merging aspeed/for-next (b4c322c2783a ARM: dts: aspeed: catalina: Update io=
 expander line names)
Merging at91/at91-next (3421b2dc37d0 Merge branch 'at91-dt' into at91-next)
Merging broadcom/next (7eff0651abbb Merge branch 'soc/next' into next)
Merging davinci/davinci/for-next (973d248c43f2 ARM: davinci: remove unused =
cpuidle code)
Merging drivers-memory/for-next (32960b4f25c2 memory: pl353-smc: simplify w=
ith scoped for each OF child loop)
Merging imx-mxs/for-next (be5d181a34f8 Merge branch 'imx/dt64' into for-nex=
t)
Merging mediatek/for-next (9dd04bf6bf1c Merge branch 'v6.11-next/dts64' int=
o for-next)
Merging mvebu/for-next (ffd0d7df6bdb Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (6cb1ac2b11b2 Merge branch 'omap-for-v6.12/drivers' i=
nto omap-reset)
Merging qcom/for-next (dd5d5a60ac5c Merge branches 'arm32-for-6.12', 'arm64=
-defconfig-fixes-for-6.11', 'arm64-defconfig-for-6.12', 'arm64-fixes-for-6.=
11', 'arm64-for-6.12', 'clk-fixes-for-6.11', 'clk-for-6.12', 'drivers-fixes=
-for-6.11' and 'drivers-for-6.12' into for-next)
Merging renesas/next (1b0a85ab5483 Merge branch 'renesas-dts-for-v6.12' int=
o renesas-next)
Merging reset/reset/next (c1267e1afae6 arm64: dts: renesas: rz-smarc: Repla=
ce fixed regulator for USB VBUS)
Merging rockchip/for-next (9826a0944cd8 Merge branch 'v6.12-clk/next' into =
for-next)
Merging samsung-krzk/for-next (6a8afff2166f Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (b6f3ed55036b Merge tags 'juno-update-6.12', 'f=
fa-updates-6.12' and 'scmi-updates-6.12' of ssh://gitolite.kernel.org/pub/s=
cm/linux/kernel/git/sudeep.holla/linux into for-linux-next)
Merging sophgo/for-next (47e5a8daf0b9 dt-bindings: riscv: Add Sipeed Lichee=
RV Nano board compatibles)
Merging stm32/stm32-next (a15ad86d4b65 ARM: dts: stm32: Add MECIO1 and MECT=
1S board variants)
Merging sunxi/sunxi/for-next (2873085a8cd5 arm64: dts: allwinner: h700: Add=
 Anbernic RG35XX-SP)
Merging tee/next (cd88a296582c Merge branch 'optee_notif_wait_timeout_for_v=
6.11' into next)
Merging tegra/for-next (6726d2c6a157 Merge branch for-6.12/arm64/defconfig =
into for-next)
Merging thead-dt/thead-dt-for-next (2d98fea7491a riscv: dts: thead: change =
TH1520 SPI node to use clock controller)
Merging ti/ti-next (1061256b2f77 Merge branch 'ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (0c559f8a91de drivers: soc: xilinx: add the missing=
 kfree in xlnx_add_cb_for_suspend())
Merging clk/clk-next (b96e7e14da1d Merge branch 'clk-amlogic' into clk-next)
Merging clk-imx/for-next (42dc425fa8b5 clk: imx95: enable the clock of NETC=
MIX block control)
Merging clk-renesas/renesas-clk (0dec2d0c8a7e dt-bindings: clock: renesas,c=
pg-clocks: Add top-level constraints)
Merging csky/linux-next (2c40c1c6adab Merge tag 'usb-6.7-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging loongarch/loongarch-next (4956e07f05e2 LoongArch: KVM: Invalidate g=
uest steal time address on vCPU reset)
Merging m68k/for-next (b90fae5df917 m68k: defconfig: Update defconfigs for =
v6.11-rc1)
Merging m68knommu/for-next (5be63fc19fca Linux 6.11-rc5)
Merging microblaze/next (d829e7ee6354 microblaze: Export xmb_manager functi=
ons)
Merging mips/mips-next (439667fb943c mips: Remove posix_types.h include fro=
m sigcontext.h)
Merging openrisc/for-next (4dc70e1aadfa openrisc: Move FPU state out of pt_=
regs)
Merging parisc-hd/for-next (554e0b0c17e3 parisc: Delay write-protection unt=
il mark_rodata_ro() call)
Merging powerpc/next (65948b0e716a powerpc/vdso: Inconditionally use CFUNC =
macro)
Merging risc-v/for-next (0e3f3649d44b riscv: Enable generic CPU vulnerabili=
tes support)
Merging riscv-dt/riscv-dt-for-next (8400291e289e Linux 6.11-rc1)
Merging riscv-soc/riscv-soc-for-next (8400291e289e Linux 6.11-rc1)
Merging s390/for-next (7471c8b3ae05 Merge branch 'features' into for-next)
Applying: fixup for "s390/mm/ptdump: Generate address marker array dynamica=
lly"
Merging sh/for-next (8fe76a1c2264 sh: push-switch: Add missing MODULE_DESCR=
IPTION() macro)
Merging sparc/for-next (a3da15389112 sparc64: Fix prototype warnings in hib=
ernate.c)
Merging uml/next (98ff534ec2cd um: vector: always reset vp->opened)
Merging xtensa/xtensa-for-next (b7cf2a1d9881 xtensa: remove redundant flush=
_dcache_page and ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE macros)
Merging fs-next (baa54202d95b Merge branch 'vfs.all' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/vfs/vfs.git)
CONFLICT (content): Merge conflict in include/linux/huge_mm.h
Merging printk/for-next (59cd94ef8009 lockdep: Mark emergency sections in l=
ockdep splats)
Merging pci/next (ac716a2a3d2f Merge branch 'pci/misc')
Merging pstore/for-next/pstore (1bf8012fc699 pstore: replace spinlock_t by =
raw_spinlock_t)
Merging hid/for-next (2cbeb4dc83e5 Merge branch 'for-6.12/goodix-spi' into =
for-next)
Merging i2c/i2c/for-next (22bf7be77dea Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i2c-host/i2c/i2c-host (0bcd5edc7ef6 dt-bindings: i2c: aspeed: drop =
redundant multi-master)
Merging i3c/i3c/next (8400291e289e Linux 6.11-rc1)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (63fb21afc1f5 hwmon: (ina2xx) Use shunt vo=
ltage to calculate current)
Merging jc_docs/docs-next (f92a24ae7c95 Documentation/fs/9p: Expand goo.gl =
link)
CONFLICT (content): Merge conflict in Documentation/admin-guide/device-mapp=
er/dm-crypt.rst
Merging v4l-dvb/master (31aaa7d95e09 media: cec: cec-adap.c: improve CEC_MS=
G_FL_REPLY_VENDOR_ID check)
Merging v4l-dvb-next/master (a043ea54bbb9 Merge tag 'next-media-rkisp1-2024=
0814' of git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git)
Merging pm/linux-next (d1178b87248a Merge branch 'acpi-riscv' into linux-ne=
xt)
CONFLICT (content): Merge conflict in arch/riscv/include/asm/irq.h
Merging cpufreq-arm/cpufreq/arm/linux-next (ea24b529e345 cpufreq: Add SM732=
5 to cpufreq-dt-platdev blocklist)
Merging cpupower/cpupower (76fb981ad677 tools/cpupower: display residency v=
alue in idle-info)
Merging devfreq/devfreq-next (1d143dde7679 PM / devfreq: exynos: Use Use de=
vm_clk_get_enabled() helpers)
Merging pmdomain/next (208e0280f776 OPP: Drop redundant _opp_attach|detach_=
genpd())
Merging opp/opp/linux-next (8400291e289e Linux 6.11-rc1)
Merging thermal/thermal/linux-next (7eeb114a635a dt-bindings: thermal: conv=
ert hisilicon-thermal.txt to dt-schema)
Merging rdma/for-next (2d10b05bcef6 RDMA/cxgb4: Remove unused declarations)
Merging net-next/main (221f9cce949a Merge branch 'octeontx2-af-cpt-update')
CONFLICT (content): Merge conflict in drivers/net/ethernet/mellanox/mlxsw/c=
ore_thermal.c
Merging bpf-next/for-next (6076defdb296 Merge branch 'bpf-next/master' into=
 for-next)
Merging ipsec-next/master (17163f23678c xfrm: minor update to sdb and xfrm_=
policy comments)
Merging mlx5-next/mlx5-next (c772a2c69018 net/mlx5: Add IFC related stuff f=
or data direct)
Merging netfilter-next/main (d2ab3bb890f6 net: ag71xx: move clk_eth out of =
struct)
Merging ipvs-next/main (d2ab3bb890f6 net: ag71xx: move clk_eth out of struc=
t)
Merging bluetooth/master (e278dcc0a237 Bluetooth: btrtl: Set msft ext addre=
ss filter quirk for RTL8852B)
Merging wireless-next/for-next (203617128803 wifi: cfg80211: Set correct ch=
andef when starting CAC)
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/hw.c
Merging ath-next/for-next (94745807f3eb wifi: ath9k_htc: Use __skb_set_leng=
th() for resetting urb before resubmit)
Merging wpan-next/master (9187210eee7d Merge tag 'net-next-6.9' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging wpan-staging/staging (9187210eee7d Merge tag 'net-next-6.9' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mtd/mtd/next (175086cf4acd mtd: concat: Use kmemdup_array instead o=
f kmemdup for multiple allocation)
Merging nand/nand/next (ccce71013406 mtd: rawnand: davinci: make platform_d=
ata private)
Merging spi-nor/spi-nor/next (b6491eb021e4 mtd: spi-nor: winbond: add Zetta=
 ZD25Q128C support)
Merging crypto/master (be9c33685205 crypto: hisilicon/zip - Optimize perfor=
mance by replacing rw_lock with spinlock)
Merging drm/drm-next (6d0ebb390485 Merge tag 'drm-intel-next-2024-08-29' of=
 https://gitlab.freedesktop.org/drm/i915/kernel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dp=
_mst.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dp=
_mst.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/tegra/gr3d.c
CONFLICT (content): Merge conflict in fs/pstore/platform.c
Merging drm-exynos/for-linux-next (627a24f5f25d Merge tag 'amd-drm-fixes-6.=
11-2024-07-18' of https://gitlab.freedesktop.org/agd5f/linux into drm-next)
Merging drm-misc/for-linux-next (c7d84a45f426 drm/nouveau: Use for_each_chi=
ld_of_node_scoped())
CONFLICT (content): Merge conflict in drivers/gpu/drm/tegra/gr3d.c
Merging amdgpu/drm-next (6c0a7c3c693a drm/amdgpu: always allocate cleared V=
RAM for GEM allocations)
Merging drm-intel/for-linux-next (2bb3fc536d69 Merge drm/drm-next into drm-=
intel-next)
Merging drm-msm/msm-next (a14b929ba9b2 drm/msm/adreno: Add A306A support)
Merging drm-msm-lumag/msm-next-lumag (15302579373e drm/msm/dpu: enable writ=
eback on SM6350)
Merging drm-xe/drm-xe-next (bf758226c7e6 drm/xe: Invalidate media_gt TLBs i=
n PT code)
Merging etnaviv/etnaviv/next (704d3d60fec4 drm/etnaviv: don't block schedul=
er when GPU is still active)
Merging fbdev/for-next (bd97615a3316 fbdev: efifb: Use driver-private scree=
n_info for sysfs)
Merging regmap/for-next (f4985b5500d2 Merge remote-tracking branch 'regmap/=
for-6.12' into regmap-next)
Merging sound/for-next (43b42ed438bf ALSA: pcm: Fix the previous conversion=
 to kstrtoul())
Merging ieee1394/for-next (e4262d321961 firewire: core: update fw_device ou=
tside of device_find_child())
Merging sound-asoc/for-next (635a057f7a7d Merge remote-tracking branch 'aso=
c/for-6.12' into asoc-next)
Merging modules/modules-next (907fa79d787f MAINTAINERS: scale modules with =
more reviewers)
Merging input/next (dac973838b0a Input: zinitix - varying icon status regis=
ters)
CONFLICT (modify/delete): drivers/input/touchscreen/cyttsp4_core.c deleted =
in input/next and modified in HEAD.  Version HEAD of drivers/input/touchscr=
een/cyttsp4_core.c left in tree.
$ git rm -f drivers/input/touchscreen/cyttsp4_core.c
Merging block/for-next (4da1b0ec4dd2 Merge branch 'for-6.12/block' into for=
-next)
Merging device-mapper/for-next (02c0207ecdcc dm bufio: Remove NULL check of=
 list_entry())
Merging libata/for-next (0f3e1eaaf7f9 ata: sata_gemini: Enable module autol=
oading)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (eea2b5d9bc41 mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (ae3239408c5b mfd: intel-lpss: Add Intel Panther L=
ake LPSS PCI IDs)
Merging backlight/for-backlight-next (fea88a13a5d1 backlight: l4f00242t03: =
Add check for spi_setup)
Merging battery/for-next (9dad0127ad73 power: supply: core: constify psy_tz=
d_ops)
Merging regulator/for-next (3e92797283a1 Merge remote-tracking branch 'regu=
lator/for-6.12' into regulator-next)
Merging security/next (cb8724948452 Automated merge of 'dev' into 'next')
Merging apparmor/apparmor-next (8400291e289e Linux 6.11-rc1)
Merging integrity/next-integrity (fa8a4ce432e8 ima: fix buffer overrun in i=
ma_eventdigest_init_common)
Merging selinux/next (dc1927111923 Automated merge of 'dev' into 'next')
Merging smack/next (eabc10e60dac security: smack: Fix indentation in smack_=
netfilter.c)
Merging tomoyo/master (dc1c8034e31b minmax: simplify min()/max()/clamp() im=
plementation)
Merging tpmdd/next (86987d84b968 Merge tag 'v6.11-rc5-client-fixes' of git:=
//git.samba.org/sfrench/cifs-2.6)
Merging watchdog/master (7c626ce4bae1 Linux 6.11-rc3)
Merging iommu/next (1f10fec7cdf1 Merge branches 'fixes', 'amd/amd-vi' and '=
core' into next)
Merging audit/next (61c60977926e audit: use task_tgid_nr() instead of task_=
pid_nr())
Merging devicetree/for-next (6abe0e4c3a14 dt-bindings: input: qcom,pm8xxx-v=
ib: Document PM6150 compatible)
Merging dt-krzk/for-next (08fd3b6e0df4 Merge branch 'next/dt64' into for-ne=
xt)
Merging mailbox/for-next (a8bd68e4329f mailbox: mtk-cmdq: Move devm_mbox_co=
ntroller_register() after devm_pm_runtime_enable())
Merging spi/for-next (c7c83b46b0b5 Merge remote-tracking branch 'spi/for-6.=
12' into spi-next)
Merging tip/master (5566819aeba0 Merge branch into tip/master: 'x86/timers')
Merging clockevents/timers/drivers/next (b7625d67eb1a Merge tag 'timers-v6.=
11-rc1' of https://git.linaro.org/people/daniel.lezcano/linux into timers/c=
ore)
Merging edac/edac-for-next (090786479325 Merge ras/edac-misc into for-next)
Merging ftrace/for-next (2a07e30c19f3 Merge ring-buffer/for-next)
Merging rcu/next (8ec15757954f srcu: Replace WARN_ON_ONCE() with BUILD_BUG_=
ON() if possible)
Merging paulmck/non-rcu/next (f01f18f2ed7d Merge branches 'cmpxchg.2024.08.=
06a', 'lkmm.2024.08.02a', 'kcsan.2024.08.01a' and 'misc.2024.08.02a' into H=
EAD)
Merging kvm/next (15e1c3d65975 KVM: x86: Use this_cpu_ptr() instead of per_=
cpu_ptr(smp_processor_id()))
Merging kvm-arm/next (6ed84689cbda Merge branch kvm-arm64/nv-at-pan into kv=
marm-master/next)
Merging kvms390/next (7816e58967d0 kvm: s390: Reject memory region operatio=
ns for ucontrol VMs)
Merging kvm-ppc/topic/ppc-kvm (46765aaec4d7 KVM: PPC: Book3S HV: remove unu=
sed varible)
Merging kvm-riscv/riscv_kvm_next (dd4a799bcc13 KVM: riscv: selftests: Fix c=
ompile error)
Merging kvm-x86/next (642613182efa Merge branches 'fixes', 'generic', 'misc=
', 'mmu', 'pat_vmx_msrs', 'selftests', 'svm' and 'vmx')
Merging xen-tip/linux-next (4c006734898a x86/xen: fix memblock_reserve() us=
age on PVH)
Merging percpu/for-next (2d9ad81ef935 Merge branch 'for-6.8-fixes' into for=
-next)
Merging workqueues/for-next (82e29ca33e36 Merge branch 'for-6.12' into for-=
next)
Merging sched-ext/for-next (62607d033bb8 sched_ext: Use sched_clock_cpu() i=
nstead of rq_clock_task() in touch_core_sched())
Merging drivers-x86/for-next (1e701372d7ac platform/x86/intel/ifs: Fix SBAF=
 title underline length)
CONFLICT (content): Merge conflict in drivers/platform/surface/surface_aggr=
egator_registry.c
Merging chrome-platform/for-next (d1b35e6d34e9 platform/chrome: chromeos_la=
ptop: Use kmemdup_array)
Merging chrome-platform-firmware/for-firmware-next (8400291e289e Linux 6.11=
-rc1)
Merging hsi/for-next (c3eddf5e8c30 HSI: omap-ssi: Remove unnecessary debugf=
s_create_dir() error check)
Merging leds-lj/for-leds-next (64c38866500b leds: turris-omnia: Fix module =
autoloading with MODULE_DEVICE_TABLE())
Merging ipmi/for-next (64dce81f8c37 ipmi: docs: don't advertise deprecated =
sysfs entries)
Merging driver-core/driver-core-next (888f67e621dd driver core: Use 2-argum=
ent strscpy())
Merging usb/usb-next (fc88bb116179 usb: roles: add lockdep class key to str=
uct usb_role_switch)
Merging thunderbolt/next (10904df3f20c thunderbolt: Improve software receiv=
er lane margining)
Merging usb-serial/usb-next (4c0d9477ba69 USB: serial: kobil_sct: restore i=
nitial terminal settings)
Merging tty/tty-next (ebbe30f4bba1 Merge 6.11-rc4 into tty-next)
Merging char-misc/char-misc-next (10c8d1bd7865 Merge 6.11-rc4 into char-mis=
c-next)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (988d40a4d4e7 coresight: Make trace ID map spinlock =
local to the map)
Merging fastrpc/for-next (590c42d9e278 misc: fastrpc: Add support for cdsp1=
 remoteproc)
Merging fpga/for-next (8de36789bd03 fpga: zynq-fpga: Rename 'timeout' varia=
ble as 'time_left')
Merging icc/icc-next (a5733950fe35 Merge branch 'icc-sm8350' into icc-next)
Merging iio/togreg (c4b43d8336e5 drivers:iio:Fix the NULL vs IS_ERR() bug f=
or debugfs_create_dir())
Merging phy-next/next (3c2ea12a625d phy: renesas: rcar-gen3-usb2: Add suppo=
rt for the RZ/G3S SoC)
Merging soundwire/next (5aedb8d8336b soundwire: intel_bus_common: enable in=
terrupts before exiting reset)
Merging extcon/extcon-next (8daf1c28478d dt-bindings: extcon: convert extco=
n-usb-gpio.txt to yaml format)
Merging gnss/gnss-next (8400291e289e Linux 6.11-rc1)
Merging vfio/next (0756bec2e45b vfio-mdev: add missing MODULE_DESCRIPTION()=
 macros)
Merging w1/for-next (e940ff286ec4 w1: ds2482: Drop explicit initialization =
of struct i2c_device_id::driver_data to 0)
Merging spmi/spmi-next (7c626ce4bae1 Linux 6.11-rc3)
Merging staging/staging-next (b7059df44f12 staging: rtl8712: Calculate size=
 from pointer)
Merging counter-next/counter-next (8400291e289e Linux 6.11-rc1)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (5be63fc19fca Linux 6.11-rc5)
Merging dmaengine/next (5d318b595982 dmaengine: Add dma router for pl08x in=
 LPC32XX SoC)
Merging cgroup/for-next (19cc803135fe Merge branch 'for-6.12' into for-next)
Merging scsi/for-next (8a1f405ed3bd Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (cff06a799dbe Merge patch series "smartpqi update=
s")
Merging vhost/linux-next (d820e8fcea38 net: virtio: unify code to init stat=
s)
Merging rpmsg/for-next (057e5c17e29f Merge branches 'rproc-next', 'rpmsg-ne=
xt' and 'hwspinlock-next' into for-next)
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (b41a9bf2c64e gpio: pca953x: Print the erro=
r code on read/write failures)
Merging gpio-intel/for-next (8400291e289e Linux 6.11-rc1)
Merging pinctrl/for-next (5213518d5ab7 pinctrl: sophgo: cv18xx: fix missed =
__iomem type identifier)
Merging pinctrl-intel/for-next (74367ad80cca pinctrl: intel: Introduce for_=
each_intel_gpio_group() helper et al.)
Merging pinctrl-renesas/renesas-pinctrl (5e633f572bba pinctrl: renesas: Swi=
tch to use kmemdup_array())
Merging pinctrl-samsung/for-next (39dbbd4e6778 pinctrl: samsung: Use kmemdu=
p_array instead of kmemdup for multiple allocation)
Merging pwm/pwm/for-next (adef9a535479 pwm: lp3943: Fix an incorrect type i=
n lp3943_pwm_parse_dt())
Merging ktest/for-next (07283c1873a4 ktest: force $buildonly =3D 1 for 'mak=
e_warnings_file' test type)
Merging kselftest/next (611fbeb44a77 selftests:core: test coverage for dup_=
fd() failure handling in unshare_fd())
Merging kunit/test (8400291e289e Linux 6.11-rc1)
Merging kunit-next/kunit (1757cc292ad4 Documentation: KUnit: Update filenam=
e best practices)
Merging livepatching/for-next (57b421369dd7 Merge branch 'for-6.11/selftest=
s-fixup' into for-next)
Merging rtc/rtc-next (04dcadb87da6 rtc: stm32: add alarm A out feature)
Merging nvdimm/libnvdimm-for-next (b0d478e34dbf testing: nvdimm: Add MODULE=
_DESCRIPTION() macros)
Merging at24/at24/for-next (36e071d2a152 dt-bindings: eeprom: at24: Add com=
patible for Giantec GT24C04A)
Merging ntb/ntb-next (92aee2f6d156 NTB: ntb_transport: fix all kernel-doc w=
arnings)
Merging seccomp/for-next/seccomp (de9c2c66ad8e Linux 6.11-rc2)
Merging fsi/next (c5eeb63edac9 fsi: Fix panic on scom file read)
Merging slimbus/for-next (9b6e704955fa slimbus: generate MODULE_ALIAS() fro=
m MODULE_DEVICE_TABLE())
Merging nvmem/for-next (a94699fa406d MAINTAINERS: Update path for U-Boot en=
vironment variables YAML)
Merging xarray/main (2a15de80dd0f idr: fix param name in idr_alloc_cyclic()=
 doc)
Merging hyperv/hyperv-next (0b5530861eec x86/hyperv: use helpers to read co=
ntrol registers in hv_snp_boot_ap())
Merging auxdisplay/for-next (8400291e289e Linux 6.11-rc1)
Merging kgdb/kgdb/for-next (9bccbe7b2087 kdb: Get rid of redundant kdb_curr=
_task())
Merging hmm/hmm (6613476e225e Linux 6.8-rc1)
Merging cfi/cfi/next (8400291e289e Linux 6.11-rc1)
Merging mhi/mhi-next (30a7e9df309f bus: mhi: host: pci_generic: Enable EDL =
trigger for Foxconn modems)
Merging memblock/for-next (cb088e38aab4 s390/mm: get estimated free pages b=
y memblock api)
CONFLICT (rename/delete): tools/testing/radix-tree/linux/init.h renamed to =
tools/testing/shared/linux/init.h in HEAD, but deleted in memblock/for-next.
$ git rm -f tools/testing/shared/linux/init.h
Merging cxl/next (a0328b397f33 cxl/core/pci: Move reading of control regist=
er to immediately before usage)
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (d7171eb49435 efi/cper: Print correctable AER information)
Merging unicode/for-next (68318904a775 unicode: add MODULE_DESCRIPTION() ma=
cros)
Merging slab/slab/for-next (0bd09512714b Merge branch 'slab/for-6.12/rcu_ba=
rriers' into slab/for-next)
CONFLICT (content): Merge conflict in kernel/rcu/tree.c
Merging random/master (963233ff0133 selftests: vDSO: also test counter in v=
dso_test_chacha)
CONFLICT (content): Merge conflict in tools/include/linux/linkage.h
Merging landlock/next (ad1b27fc9877 Landlock: Document LANDLOCK_SCOPED_ABST=
RACT_UNIX_SOCKET and ABI versioning)
Merging rust/rust-next (a335e9591404 rust: rbtree: add `RBTree::entry`)
CONFLICT (content): Merge conflict in rust/kernel/lib.rs
Merging sysctl/sysctl-next (ed674ae9a6e6 sysctl: avoid spurious permanent e=
mpty tables)
Merging execve/for-next/execve (6da1cdef7907 Merge branch 'for-linus/execve=
' into for-next/execve)
CONFLICT (content): Merge conflict in fs/binfmt_elf.c
Merging bitmap/bitmap-for-next (f7f33633ebe9 cpumask: Implement cpumask_{fi=
rst,next}_{nor,andnot})
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (7c26646068f5 Merge branches 'for-linus/hardenin=
g' and 'for-next/hardening' into for-next/kspp)
CONFLICT (content): Merge conflict in include/linux/string_choices.h
Merging kspp-gustavo/for-next/kspp (6613476e225e Linux 6.8-rc1)
Merging nolibc/nolibc (248f6b935bbd Merge tag 'nolibc-20240824-for-6.12-1' =
of https://git.kernel.org/pub/scm/linux/kernel/git/nolibc/linux-nolibc into=
 nolibc)
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (76889bbaabf5 Merge branch 'nesting_reserved_regio=
ns' into iommufd.git for-next)
CONFLICT (content): Merge conflict in drivers/iommu/iommufd/selftest.c
Merging turbostat/next (1dd10efc87e8 tools/power turbostat: Fix trailing '
Merging pwrseq/pwrseq/for-next (8b7e0a6c443e Documentation: add a driver AP=
I doc for the power sequencing subsystem)
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)

--Sig_/GIf_NQsHp9tAqJp4_KJ8wfT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbVaG4ACgkQAVBC80lX
0Gwl9Af7BgA+EZBhgY2eF5cCbBsp6KyhkWOmD0MDUa+xrNjzZS2eAORkezEZay4Z
uS7ergWpVmiUxhq86ujelJ/tLXGEkZkCxLIGWwFKPWipomTUSsUsPY6MefwKWkoi
Um7CBwXFFl+gRjd7/a/tV7Wtmq6OfxkvTxw+m2RJJvosFCwP/Y7J274XuE0sJ8W0
08x4sgfI0d+MAaf3MJf2V6qVEByKveDJEVWQr8ouQiwVHnVONZZrDRdtMVrRl1YV
VcsMatrqGZCrMM+dT78pmokLrsGv+uB9ZaHrUUTMzhW/VHcAcDMZqZYpLBaxqtah
i4IKj66Y+Ptgd1aS9cUMiN8UiT2P/g==
=itX7
-----END PGP SIGNATURE-----

--Sig_/GIf_NQsHp9tAqJp4_KJ8wfT--

