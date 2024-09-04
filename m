Return-Path: <linux-next+bounces-3585-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C87296B2A2
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 09:17:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66D6C1F27603
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 07:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA7FA12CDAE;
	Wed,  4 Sep 2024 07:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="G04JppY9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3C76BFA3;
	Wed,  4 Sep 2024 07:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725434220; cv=none; b=LTFrR1HeLbtmBpzk4+yWws2rOPFc7xLpYoSMu3RxXGTwIYhQe8uDAGvzU60Dw+Tzcvu4kgADu5HAnnoM9gBQHCzkIFulTeR3j1CAVhf6+piVOdFfToHTJ/FdMMfYRjzsNKiMzbSuUDNvP67GZgsjglD0Lehjyyzw70wo0Dp1isQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725434220; c=relaxed/simple;
	bh=DRrvW5oLaZ7/qaxziDRptwP5Qs06JP3psr3y195JsRw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=unGmP9pwUmdsn8WAoIa42fgR8WBvWxbwd/W8uhflECvP9L4OrQRzo6bL64gzD8cdVSDYFitQtJpZqJZY+WPPImXPkFudCz65qG5FbYawY49W4SJ17jIzRkfMCGqhvVjALrc3CUbL13958nJqWH1UXfMYilCHKyq6a7FNaR5VhBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=G04JppY9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725434209;
	bh=JbKVivhQa0cA5kueAtu1siQxzTiZ07xhHaCnUm2P6lU=;
	h=Date:From:To:Cc:Subject:From;
	b=G04JppY9R/R5ReF1WUXJiqAXCegIf0qPlMdS7wdvF0a4jYUhkHsf5+yvnFiOdKoCV
	 MTRSYoT+JaESWVpwuy8Q4jODUD4h+zCXvC0DXD22lmMubEWaGBGOORvPagBHsKHiY3
	 CgbqNbvQYhKafGr5bW1CA0QyUsLJFfAdnU8tCwi5nccpkbaF27RM0jobJG/KuAcEWK
	 v101JJ58YG+UDwgDNVgBGIo6f1qvwZmrCN/WvrPvTQk1vmBlNg0AC+X05b5rQj3qvi
	 roxT0pbH0QXk28FAQUQbnigdGYKxaQoYO0ZnuXnXGIsqY4rCx5/hGNL0AkpzEEdC6q
	 4H9dbNNsXusnw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WzDM53Dv5z4wp0;
	Wed,  4 Sep 2024 17:16:49 +1000 (AEST)
Date: Wed, 4 Sep 2024 17:16:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 4
Message-ID: <20240904171648.5154bbd9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JcL7.8u2jnNIaHEs1LXoemm";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JcL7.8u2jnNIaHEs1LXoemm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20240903:

The f2fs tree still had its complex conflicts against the vfs-brauner
tree for which I used the version of the f2fs tree from next-20240830.

The vfs-brauner tree gained a conflict against the ext4 tree.
The vfs-brauner tree still has its build failure so I used the version
from next-20240902.

The arm-soc tree gained a build failure so I used the version from
next-20240903.

The net-next tree gained a conflict against the net tree.

The bpf-next tree gained a conflict against the net-next tree.

The drm-misc tree gained a build failure so I used the version from
next-20240903.

The usb tree gained a conflict against the usb.current tree.

The extcon tree gained a semantic conflict against the battery tree.

Non-merge commits (relative to Linus' tree): 8374
 8615 files changed, 322174 insertions(+), 160570 deletions(-)

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
Merging origin/master (88fac17500f4 Merge tag 'fuse-fixes-6.11-rc7' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse)
Merging vfs-brauner-fixes/vfs.fixes (72a6e22c604c fscache: delete fscache_c=
ookie_lru_timer when fscache exits to avoid UAF)
Merging fscrypt-current/for-current (256abd8e550c Linux 6.10-rc7)
Merging fsverity-current/for-current (256abd8e550c Linux 6.10-rc7)
Merging btrfs-fixes/next-fixes (6c7a12862004 Merge branch 'misc-6.11' into =
next-fixes)
Merging vfs-fixes/fixes (8c86f1a45749 close_range(): fix the logics in desc=
riptor table trimming)
Merging erofs-fixes/fixes (5be63fc19fca Linux 6.11-rc5)
Merging nfsd-fixes/nfsd-fixes (40927f3d0972 nfsd: fix nfsd4_deleg_getattr_c=
onflict in presence of third party lease)
Merging v9fs-fixes/fixes/next (0c3836482481 Linux 6.10)
Merging overlayfs-fixes/ovl-fixes (77a28aa47687 ovl: relax WARN_ON in ovl_v=
erify_area())
Merging bcachefs/for-next (4e7795eda445 bcachefs: bch2_sb_member_alloc())
Merging fscrypt/for-next (256abd8e550c Linux 6.10-rc7)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (d74e6dc87cc3 Merge branch 'for-next-next-v6.11-2024=
0902' into for-next-20240902)
CONFLICT (content): Merge conflict in fs/btrfs/file.c
Merging ceph/master (ede0b1d30b82 libceph: use min() to simplify code in ce=
ph_dns_resolve_name())
Merging cifs/for-next (b0447d16c59f smb3: mark compression as CONFIG_EXPERI=
MENTAL and fix missing compression operation)
Merging configfs/for-next (4425c1d9b44d configfs: improve item creation per=
formance)
Merging dlm/next (652b0ae675fe dlm: add missing -ENOMEM if alloc_workqueue(=
) fails)
Merging erofs/dev (6271bfd5f5ba erofs: refactor read_inode calling conventi=
on)
Merging exfat/dev (98ad7b9012b5 exfat: Implement sops->shutdown and ioctl)
Merging exportfs/exportfs-next (0c3836482481 Linux 6.10)
Merging ext3/for_next (702e9da7376b Merge isofs __counted_by annotation.)
Merging ext4/dev (187c2a491193 ext4: convert EXT4_B2C(sbi->s_stripe) users =
to EXT4_NUM_B2C)
Merging f2fs/dev (c6f1758f7a68 f2fs: get rid of page->index)
$ git reset --hard HEAD^
Merging next-20240830 version of f2fs
Merging fsverity/for-next (256abd8e550c Linux 6.10-rc7)
Merging fuse/for-next (506b21c945b9 fuse: use correct name fuse_conn_list i=
n docstring)
Merging gfs2/for-next (6888c1e85f5d gfs2: Remove gfs2_aspace_writepage())
Merging jfs/jfs-next (d64ff0d23067 jfs: check if leafidx greater than num l=
eaves per dmap tree)
Merging ksmbd/ksmbd-for-next (844436e045ac ksmbd: Unlock on in ksmbd_tcp_se=
t_interfaces())
Merging nfs/linux-next (67784a74e258 Merge tag 'ata-6.11-rc7' of git://git.=
kernel.org/pub/scm/linux/kernel/git/libata/linux)
Merging nfs-anna/linux-next (f92214e4c312 NFS: Avoid unnecessary rescanning=
 of the per-server delegation list)
Merging nfsd/nfsd-next (42facfb244be NFSD: Add initial generated XDR defini=
tions and functions for NFSv4)
Merging ntfs3/master (689ecd06ef8d fs/ntfs3: Rename ntfs3_setattr into ntfs=
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
Merging vfs-brauner/vfs.all (ed141fd02d8b Merge branch 'vfs.procfs' into vf=
s.all Signed-off-by: Christian Brauner <brauner@kernel.org>)
CONFLICT (content): Merge conflict in fs/exfat/inode.c
CONFLICT (content): Merge conflict in fs/ext4/inline.c
CONFLICT (content): Merge conflict in fs/ext4/inode.c
Applying: fixup for "fs: Convert aops->write_end to take a folio"
$ git reset --hard HEAD^
Merging next-20240902 version of vfs-brauner
CONFLICT (content): Merge conflict in fs/exfat/inode.c
CONFLICT (content): Merge conflict in fs/ext4/inline.c
CONFLICT (content): Merge conflict in fs/ext4/inode.c
[fs-next 9b8e1a34b25f] next-20240902/vfs-brauner
Applying: fixup for "fs: Convert aops->write_end to take a folio"
[fs-next 2ebc11f72ea0] next-20240902/vfs-brauner
Merging vfs/for-next (a38297e3fb01 Linux 6.9)
Merging fixes/fixes (2dde18cd1d8f Linux 6.5)
Merging mm-hotfixes/mm-hotfixes-unstable (b4ce19fc0e39 mm/gup: fix memfd_pi=
n_folios alloc race panic)
Merging fs-current (f2d1392f1ff4 Merge branch 'fixes' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging kbuild-current/fixes (431c1646e1f8 Linux 6.11-rc6)
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
Merging net/main (33f339a1ba54 bpf, net: Fix a potential race in do_sock_ge=
tsockopt())
Merging bpf/master (b408473ea01b bpf: Fix a crash when btf_parse_base() ret=
urns an error pointer)
Merging ipsec/master (9b0874286768 Merge branch 'mctp-serial-tx-escapes')
Merging netfilter/main (febccb39255f nfc: pn533: Add poll mod list filling =
check)
Merging ipvs/main (febccb39255f nfc: pn533: Add poll mod list filling check)
Merging wireless/for-next (5872b47ce18e MAINTAINERS: wifi: cw1200: add net-=
cw1200.h)
Merging ath/for-current (2f833e8948d6 Revert "wifi: ath11k: support hiberna=
tion")
Merging wpan/master (3682c302e72d ieee802154: Correct spelling in nl802154.=
h)
Merging rdma-fixes/for-rc (8400291e289e Linux 6.11-rc1)
Merging sound-current/for-linus (562755501d44 ALSA: hda/realtek: extend qui=
rks for Clevo V5[46]0)
Merging sound-asoc-fixes/for-linus (77212f300bfd ASoC: codecs: lpass-va-mac=
ro: set the default codec version for sm8250)
Merging regmap-fixes/for-linus (10a650193899 Merge remote-tracking branch '=
regmap/for-6.10' into regmap-linus)
Merging regulator-fixes/for-linus (1a5caec7f80c regulator: core: Stub devm_=
regulator_bulk_get_const() if !CONFIG_REGULATOR)
Merging spi-fixes/for-linus (5478a4f7b944 spi: spidev: Add missing spi_devi=
ce_id for jg10309-01)
Merging pci-current/for-linus (8f62819aaace PCI/pwrctl: Rescan bus on a sep=
arate thread)
Merging driver-core.current/driver-core-linus (47ac09b91bef Linux 6.11-rc4)
Merging tty.current/tty-linus (47ac09b91bef Linux 6.11-rc4)
Merging usb.current/usb-linus (87eb3cb4ec61 usb: typec: ucsi: Fix cable reg=
istration)
Merging usb-serial-fixes/usb-linus (9a471de516c3 USB: serial: option: add M=
eiG Smart SRM825L)
Merging phy/fixes (431c1646e1f8 Linux 6.11-rc6)
Merging staging.current/staging-linus (8400291e289e Linux 6.11-rc1)
Merging iio-fixes/fixes-togreg (48b9a8dabcc3 VMCI: Fix use-after-free when =
removing resource in vmci_resource_remove())
Merging counter-current/counter-current (8400291e289e Linux 6.11-rc1)
Merging char-misc.current/char-misc-linus (48b9a8dabcc3 VMCI: Fix use-after=
-free when removing resource in vmci_resource_remove())
Merging soundwire-fixes/fixes (431c1646e1f8 Linux 6.11-rc6)
Merging thunderbolt-fixes/fixes (431c1646e1f8 Linux 6.11-rc6)
Merging input-current/for-linus (c472d33bcbf7 Input: cypress_ps2 - fix wait=
ing for command response)
Merging crypto-current/master (df1e9791998a hwrng: core - remove (un)regist=
er_miscdev())
Merging vfio-fixes/for-linus (5a88a3f67e37 vfio/pci: Init the count variabl=
e in collecting hot-reset devices)
Merging kselftest-fixes/fixes (170c966cbe27 selftests: ksft: Fix finished()=
 helper exit code on skipped tests)
Merging dmaengine-fixes/fixes (431c1646e1f8 Linux 6.11-rc6)
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
Merging hwmon-fixes/hwmon (a54da9df75cd hwmon: (hp-wmi-sensors) Check if WM=
I event data exists)
Merging nvdimm-fixes/libnvdimm-fixes (d5240fa65db0 nvdimm/pmem: Set dax fla=
g for all 'PFN_MAP' cases)
Merging cxl-fixes/fixes (5be63fc19fca Linux 6.11-rc5)
Merging dma-mapping-fixes/for-linus (75961ffb5cb3 swiotlb: initialise restr=
icted pool list_head when SWIOTLB_DYNAMIC=3Dy)
Merging drivers-x86-fixes/fixes (d34af755a533 platform/x86/amd: pmf: Make A=
SUS GA403 quirk generic)
Merging samsung-krzk-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging pinctrl-samsung-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging devicetree-fixes/dt/linus (b739dffa5d57 of/irq: Prevent device addr=
ess out-of-bounds read in interrupt map walk)
Merging dt-krzk-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging scsi-fixes/fixes (0f9592ae26ff scsi: ufs: ufs-mediatek: Add UFSHCD_=
QUIRK_BROKEN_LSDBS_CAP)
Merging drm-fixes/drm-fixes (431c1646e1f8 Linux 6.11-rc6)
Merging drm-intel-fixes/for-linux-next-fixes (a13494de5325 drm/i915/display=
: Increase Fast Wake Sync length as a quirk)
Merging mmc-fixes/fixes (aea62c744a9a mmc: cqhci: Fix checking of CQHCI_HAL=
T state)
Merging rtc-fixes/rtc-fixes (8400291e289e Linux 6.11-rc1)
Merging gnss-fixes/gnss-linus (8400291e289e Linux 6.11-rc1)
Merging hyperv-fixes/hyperv-fixes (4430556935db Drivers: hv: vmbus: Fix the=
 misplaced function description)
Merging risc-v-fixes/fixes (1ff95eb2bebd riscv: Fix RISCV_ALTERNATIVE_EARLY)
Merging riscv-dt-fixes/riscv-dt-fixes (7d9d88890f04 MAINTAINERS: invert Mis=
c RISC-V SoC Support's pattern)
Merging riscv-soc-fixes/riscv-soc-fixes (591940e22e28 firmware: microchip: =
fix incorrect error report of programming:timeout on success)
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (47ac09b91bef Linux 6.11-rc4)
Merging gpio-brgl-fixes/gpio/for-current (a5135526426d gpio: modepin: Enabl=
e module autoloading)
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
Merging perf-current/perf-tools (e162cb25c410 perf daemon: Fix the build on=
 more 32-bit architectures)
Merging efi-fixes/urgent (ae835a96d72c x86/efistub: Revert to heap allocate=
d boot_params for PE entrypoint)
Merging zstd-fixes/zstd-linus (77618db34645 zstd: Fix array-index-out-of-bo=
unds UBSAN warning)
Merging battery-fixes/fixes (7c626ce4bae1 Linux 6.11-rc3)
Merging iommufd-fixes/for-rc (cf1e515c9a40 iommufd/selftest: Make dirty_ops=
 static)
Merging rust-fixes/rust-fixes (cff56ff737e2 MAINTAINERS: update Andreas Hin=
dborg's email address)
Merging w1-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging pmdomain-fixes/fixes (9ec87c5957ea OPP: Fix support for required OP=
Ps for multiple PM domains)
Merging i2c-host-fixes/i2c/i2c-host-fixes (431c1646e1f8 Linux 6.11-rc6)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (538d5477b252 clk: starfive: jh7110-sys: Add no=
tifier for PLL0 clock)
Merging pwrseq-fixes/pwrseq/for-current (431c1646e1f8 Linux 6.11-rc6)
Merging thead-dt-fixes/thead-dt-fixes (8400291e289e Linux 6.11-rc1)
Merging drm-misc-fixes/for-linux-next-fixes (9a71cf8b6fa4 drm/bridge-connec=
tor: reset the HDMI connector state)
Merging mm-stable/mm-stable (340afb8027fa memcg: initiate deprecation of pr=
essure_level)
Merging mm-nonmm-stable/mm-nonmm-stable (74b0099340e0 nilfs2: refactor nilf=
s_segctor_thread())
Merging mm/mm-everything (39b982dbe0b5 foo)
Merging kbuild/for-next (9f18baf3dd65 kbuild: remove recent dependency on "=
truncate" program)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (39c243411bdb perf sched timehist: Fixed times=
tamp error when unable to confirm event sched_in time)
CONFLICT (content): Merge conflict in tools/perf/tests/pmu.c
Merging compiler-attributes/compiler-attributes (8400291e289e Linux 6.11-rc=
1)
Merging dma-mapping/for-next (ea0643527238 dma-direct: optimize page freein=
g when it is not addressable)
Merging asm-generic/master (b82c1d235a30 syscalls: add back legacy __NR_nfs=
servctl macro)
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (3cbbf97c8ea7 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (aac4a336806e Merge branches 'for-next/acpi', '=
for-next/errata', 'for-next/misc', 'for-next/perf', 'for-next/pkvm-guest', =
'for-next/selftests' and 'for-next/timers' into for-next/core)
Merging arm-perf/for-next/perf (7c626ce4bae1 Linux 6.11-rc3)
Merging arm-soc/for-next (a6006968439f soc: document merges)
$ git reset --hard HEAD^
Merging next-20240903 version of arm-soc
Merging amlogic/for-next (7bf8845324d1 Merge branch 'v6.12/arm64-dt' into f=
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
Merging imx-mxs/for-next (dc1c9170f7ad Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (9dd04bf6bf1c Merge branch 'v6.11-next/dts64' int=
o for-next)
Merging mvebu/for-next (dea56c781ed3 ARM: dove: Drop a write-only variable)
Merging omap/for-next (6cb1ac2b11b2 Merge branch 'omap-for-v6.12/drivers' i=
nto omap-reset)
Merging qcom/for-next (dd5d5a60ac5c Merge branches 'arm32-for-6.12', 'arm64=
-defconfig-fixes-for-6.11', 'arm64-defconfig-for-6.12', 'arm64-fixes-for-6.=
11', 'arm64-for-6.12', 'clk-fixes-for-6.11', 'clk-for-6.12', 'drivers-fixes=
-for-6.11' and 'drivers-for-6.12' into for-next)
Merging renesas/next (5379c9e0a6ad Merge branch 'renesas-dts-for-v6.12' int=
o renesas-next)
Merging reset/reset/next (487b1b32e317 reset: eyeq: add platform driver)
Merging rockchip/for-next (3b4c541c2fdc Merge branch 'v6.12-armsoc/drivers'=
 into for-next)
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
Merging ti/ti-next (657b48ad4c7a Merge branches 'ti-drivers-soc-next', 'ti-=
k3-config-next' and 'ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (bc810ecbb30a Merge branch 'zynq/soc' into for-next)
Merging clk/clk-next (8770b3d8eb83 Merge branch 'clk-renesas' into clk-next)
Merging clk-imx/for-next (42dc425fa8b5 clk: imx95: enable the clock of NETC=
MIX block control)
Merging clk-renesas/renesas-clk (3aeccbe08171 clk: renesas: r9a09g057: Add =
clock and reset entries for GTM/RIIC/SDHI/WDT)
Merging csky/linux-next (2c40c1c6adab Merge tag 'usb-6.7-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging loongarch/loongarch-next (4956e07f05e2 LoongArch: KVM: Invalidate g=
uest steal time address on vCPU reset)
Merging m68k/for-next (b90fae5df917 m68k: defconfig: Update defconfigs for =
v6.11-rc1)
Merging m68knommu/for-next (2e04cbed1278 m68k: remove trailing space after=
=20
Merging microblaze/next (d829e7ee6354 microblaze: Export xmb_manager functi=
ons)
Merging mips/mips-next (439667fb943c mips: Remove posix_types.h include fro=
m sigcontext.h)
Merging openrisc/for-next (4dc70e1aadfa openrisc: Move FPU state out of pt_=
regs)
Merging parisc-hd/for-next (213aa670153e parisc: Delay write-protection unt=
il mark_rodata_ro() call)
Merging powerpc/next (65948b0e716a powerpc/vdso: Inconditionally use CFUNC =
macro)
Merging risc-v/for-next (0e3f3649d44b riscv: Enable generic CPU vulnerabili=
tes support)
Merging riscv-dt/riscv-dt-for-next (8400291e289e Linux 6.11-rc1)
Merging riscv-soc/riscv-soc-for-next (8400291e289e Linux 6.11-rc1)
Merging s390/for-next (489753c1f7ae Merge branch 'features' into for-next)
Applying: fixup for "s390/mm/ptdump: Generate address marker array dynamica=
lly"
Merging sh/for-next (8fe76a1c2264 sh: push-switch: Add missing MODULE_DESCR=
IPTION() macro)
Merging sparc/for-next (a3da15389112 sparc64: Fix prototype warnings in hib=
ernate.c)
Merging uml/next (98ff534ec2cd um: vector: always reset vp->opened)
Merging xtensa/xtensa-for-next (b7cf2a1d9881 xtensa: remove redundant flush=
_dcache_page and ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE macros)
Merging fs-next (2ebc11f72ea0 next-20240902/vfs-brauner)
CONFLICT (content): Merge conflict in include/linux/huge_mm.h
Merging printk/for-next (59cd94ef8009 lockdep: Mark emergency sections in l=
ockdep splats)
Merging pci/next (2675ca35b4fe Merge branch 'pci/misc')
Merging pstore/for-next/pstore (1bf8012fc699 pstore: replace spinlock_t by =
raw_spinlock_t)
Merging hid/for-next (ad5d71dcc1f6 Merge branch 'for-6.11/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (642e257c3ec3 Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i2c-host/i2c/i2c-host (1eefdc3a9992 dt-bindings: i2c: i2c-rk3x: Add=
 rk3576 compatible)
Merging i3c/i3c/next (8400291e289e Linux 6.11-rc1)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (3cd1ef26b01e hwmon: pmbus: pli12096bc: Ad=
d write delay)
Merging jc_docs/docs-next (f92a24ae7c95 Documentation/fs/9p: Expand goo.gl =
link)
CONFLICT (content): Merge conflict in Documentation/admin-guide/device-mapp=
er/dm-crypt.rst
Merging v4l-dvb/master (31aaa7d95e09 media: cec: cec-adap.c: improve CEC_MS=
G_FL_REPLY_VENDOR_ID check)
Merging v4l-dvb-next/master (a043ea54bbb9 Merge tag 'next-media-rkisp1-2024=
0814' of git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git)
Merging pm/linux-next (a55831198887 Merge branch 'thermal-core' into linux-=
next)
CONFLICT (content): Merge conflict in arch/riscv/include/asm/irq.h
Merging cpufreq-arm/cpufreq/arm/linux-next (be8fecc06603 cpufreq: ti-cpufre=
q: Use socinfo to get revision in AM62 family)
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
Merging net-next/main (3d4d0fa4fc32 be2net: Remove unused declarations)
CONFLICT (content): Merge conflict in drivers/net/ethernet/mellanox/mlxsw/c=
ore_thermal.c
CONFLICT (content): Merge conflict in drivers/net/phy/phy_device.c
Merging bpf-next/for-next (1dcc512c5011 Merge branch 'bpf-next/net' into bp=
f-next/for-next)
CONFLICT (content): Merge conflict in drivers/net/netkit.c
Merging ipsec-next/master (17163f23678c xfrm: minor update to sdb and xfrm_=
policy comments)
Merging mlx5-next/mlx5-next (c772a2c69018 net/mlx5: Add IFC related stuff f=
or data direct)
Merging netfilter-next/main (c362646b6fc1 netfilter: nf_tables: Add missing=
 Kernel doc)
Merging ipvs-next/main (d2ab3bb890f6 net: ag71xx: move clk_eth out of struc=
t)
Merging bluetooth/master (e278dcc0a237 Bluetooth: btrtl: Set msft ext addre=
ss filter quirk for RTL8852B)
  4dd2c5007a2b ("Bluetooth: hci_sync: Introduce hci_cmd_sync_run/hci_cmd_sy=
nc_run_once")
  4e76e85acacd ("Revert "Bluetooth: MGMT/SMP: Fix address type when using S=
MP over BREDR/LE"")
  5785ffa39009 ("Bluetooth: MGMT: Fix not generating command complete for M=
GMT_OP_DISCONNECT")
  61bea6923172 ("Bluetooth: qca: If memdump doesn't work, re-enable IBS")
  80d2d2dbcce7 ("Bluetooth: MGMT: Ignore keys being loaded with invalid typ=
e")
Merging wireless-next/for-next (97b766f989bc wifi: mwifiex: Convert to use =
jiffies macro)
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
Merging spi-nor/spi-nor/next (2095e7da8049 mtd: spi-nor: spansion: Add supp=
ort for S28HS256T)
Merging crypto/master (b8fc70ab7b5f Revert "crypto: spacc - Add SPAcc Skcip=
her support")
Merging drm/drm-next (e066e9aa4d9c MAINATINERS: update drm maintainer conta=
cts)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dp=
_mst.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dp=
_mst.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/tegra/gr3d.c
CONFLICT (content): Merge conflict in fs/pstore/platform.c
Merging drm-exynos/for-linux-next (627a24f5f25d Merge tag 'amd-drm-fixes-6.=
11-2024-07-18' of https://gitlab.freedesktop.org/agd5f/linux into drm-next)
Merging drm-misc/for-linux-next (053d15784087 dt-bindings: gpu: Add rockchi=
p,rk3576-mali compatible)
CONFLICT (content): Merge conflict in drivers/gpu/drm/tegra/gr3d.c
$ git reset --hard HEAD^
Merging next-20240903 version of drm-misc
CONFLICT (content): Merge conflict in drivers/gpu/drm/tegra/gr3d.c
[master 861c87f9147f] next-20240903/drm-misc
Merging amdgpu/drm-next (ead60e9c4e29 drm/amdgpu/gfx10: use rlc safe mode f=
or soft recovery)
Merging drm-intel/for-linux-next (963ed4efe0c6 drm/i915/dp: hide dp_to_i915=
() inside intel_dp.c)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_qu=
irks.c
Merging drm-msm/msm-next (15302579373e drm/msm/dpu: enable writeback on SM6=
350)
Merging drm-msm-lumag/msm-next-lumag (15302579373e drm/msm/dpu: enable writ=
eback on SM6350)
Merging drm-xe/drm-xe-next (8da19441d0a0 drm/xe/display: Avoid encoder_susp=
end at runtime suspend)
Merging etnaviv/etnaviv/next (704d3d60fec4 drm/etnaviv: don't block schedul=
er when GPU is still active)
Merging fbdev/for-next (27f22f897095 fbdev: hyperv_fb: Convert comma to sem=
icolon)
Merging regmap/for-next (7da49f45bf04 Merge remote-tracking branch 'regmap/=
for-6.12' into regmap-next)
Merging sound/for-next (2994586e2c48 Merge branch 'for-linus' into for-next)
Merging ieee1394/for-next (e4262d321961 firewire: core: update fw_device ou=
tside of device_find_child())
Merging sound-asoc/for-next (c72a0a772078 Merge remote-tracking branch 'aso=
c/for-6.12' into asoc-next)
Merging modules/modules-next (907fa79d787f MAINTAINERS: scale modules with =
more reviewers)
Merging input/next (a790df272a20 Input: synaptics-rmi4 - fix crash when DPM=
 query is not supported)
CONFLICT (modify/delete): drivers/input/touchscreen/cyttsp4_core.c deleted =
in input/next and modified in HEAD.  Version HEAD of drivers/input/touchscr=
een/cyttsp4_core.c left in tree.
$ git rm -f drivers/input/touchscreen/cyttsp4_core.c
Merging block/for-next (64387266712a Merge branch 'for-6.12/block' into for=
-next)
Merging device-mapper/for-next (a8fa6483b409 dm integrity: fix gcc 5 warnin=
g)
Merging libata/for-next (0f3e1eaaf7f9 ata: sata_gemini: Enable module autol=
oading)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (edd3183c5c5f optee: add RPMB dependency)
Merging mfd/for-mfd-next (ae3239408c5b mfd: intel-lpss: Add Intel Panther L=
ake LPSS PCI IDs)
Merging backlight/for-backlight-next (fea88a13a5d1 backlight: l4f00242t03: =
Add check for spi_setup)
Merging battery/for-next (6625767049c2 power: supply: axp20x_battery: add s=
upport for AXP717)
Merging regulator/for-next (3e92797283a1 Merge remote-tracking branch 'regu=
lator/for-6.12' into regulator-next)
Merging security/next (cb8724948452 Automated merge of 'dev' into 'next')
Merging apparmor/apparmor-next (8400291e289e Linux 6.11-rc1)
Merging integrity/next-integrity (fa8a4ce432e8 ima: fix buffer overrun in i=
ma_eventdigest_init_common)
Merging selinux/next (dc1927111923 Automated merge of 'dev' into 'next')
Merging smack/next (2749749afa07 smackfs: Use rcu_assign_pointer() to ensur=
e safe assignment in smk_set_cipso)
Merging tomoyo/master (dc1c8034e31b minmax: simplify min()/max()/clamp() im=
plementation)
Merging tpmdd/next (1016abf3e697 selftests: tpm2: test_smoke: Run only when=
 TPM2 is avaialable.)
Merging watchdog/master (7c626ce4bae1 Linux 6.11-rc3)
Merging iommu/next (8b3100a624e9 Merge branches 'arm/smmu', 'intel/vt-d', '=
amd/amd-vi' and 'core' into next)
Merging audit/next (8c1867a2f0fd audit: Make use of str_enabled_disabled() =
helper)
Merging devicetree/for-next (c88baf8ef1bd dt-bindings: watchdog: nxp,lpc185=
0-wdt: Convert bindings to dtschema)
Merging dt-krzk/for-next (08fd3b6e0df4 Merge branch 'next/dt64' into for-ne=
xt)
Merging mailbox/for-next (a8bd68e4329f mailbox: mtk-cmdq: Move devm_mbox_co=
ntroller_register() after devm_pm_runtime_enable())
Merging spi/for-next (c5ec4dab8f3e Merge remote-tracking branch 'spi/for-6.=
12' into spi-next)
Merging tip/master (d81a5f99df92 Merge branch into tip/master: 'x86/timers')
Merging clockevents/timers/drivers/next (8f8b0349aa31 clocksource/drivers/j=
core: Use request_percpu_irq())
Merging edac/edac-for-next (3a6fe32d7113 Merge branch 'edac-drivers' into e=
dac-for-next)
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
Merging kvm-riscv/riscv_kvm_next (5aa09297a3dc RISC-V: KVM: Fix to allow hp=
mcounter31 from the guest)
Merging kvm-x86/next (642613182efa Merge branches 'fixes', 'generic', 'misc=
', 'mmu', 'pat_vmx_msrs', 'selftests', 'svm' and 'vmx')
Merging xen-tip/linux-next (4c006734898a x86/xen: fix memblock_reserve() us=
age on PVH)
Merging percpu/for-next (2d9ad81ef935 Merge branch 'for-6.8-fixes' into for=
-next)
Merging workqueues/for-next (82e29ca33e36 Merge branch 'for-6.12' into for-=
next)
Merging sched-ext/for-next (d7b01aef9dbd Merge branch 'tip/sched/core' into=
 for-6.12)
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
Merging usb/usb-next (35f4a629641b Merge 6.11-rc6 into usb-next)
CONFLICT (content): Merge conflict in drivers/usb/typec/ucsi/ucsi.c
Merging thunderbolt/next (10904df3f20c thunderbolt: Improve software receiv=
er lane margining)
Merging usb-serial/usb-next (4c0d9477ba69 USB: serial: kobil_sct: restore i=
nitial terminal settings)
Merging tty/tty-next (ebbe30f4bba1 Merge 6.11-rc4 into tty-next)
Merging char-misc/char-misc-next (aead27d77f3e Merge tag 'fpga-for-6.12-rc1=
' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/fpga/linux-fpga int=
o char-misc-next)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (988d40a4d4e7 coresight: Make trace ID map spinlock =
local to the map)
Merging fastrpc/for-next (590c42d9e278 misc: fastrpc: Add support for cdsp1=
 remoteproc)
  b056e4e23acb ("misc: fastrpc: Fix double free of 'buf' in error path")
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
Applying: fix up for "extcon: Add LC824206XA microUSB switch driver"
Merging gnss/gnss-next (8400291e289e Linux 6.11-rc1)
Merging vfio/next (7555c7d2cfc4 vfio: mdev: Remove unused function declarat=
ions)
Merging w1/for-next (e940ff286ec4 w1: ds2482: Drop explicit initialization =
of struct i2c_device_id::driver_data to 0)
Merging spmi/spmi-next (7c626ce4bae1 Linux 6.11-rc3)
Merging staging/staging-next (b7059df44f12 staging: rtl8712: Calculate size=
 from pointer)
Merging counter-next/counter-next (8400291e289e Linux 6.11-rc1)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (5be63fc19fca Linux 6.11-rc5)
Merging dmaengine/next (e0bee4bcdc32 dmaengine: loongson1-apb-dma: Fix the =
build warning caused by the size of pdev_irqname)
Merging cgroup/for-next (19cc803135fe Merge branch 'for-6.12' into for-next)
Merging scsi/for-next (8a1f405ed3bd Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (cff06a799dbe Merge patch series "smartpqi update=
s")
Merging vhost/linux-next (d820e8fcea38 net: virtio: unify code to init stat=
s)
Merging rpmsg/for-next (057e5c17e29f Merge branches 'rproc-next', 'rpmsg-ne=
xt' and 'hwspinlock-next' into for-next)
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (e1df5d0229c3 gpio: pch: kerneldoc fixes fo=
r excess members)
Merging gpio-intel/for-next (8400291e289e Linux 6.11-rc1)
Merging pinctrl/for-next (77923daebaf8 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (52c62a3da80b pinctrl: intel: Inline intel_g=
pio_community_irq_handler())
Merging pinctrl-renesas/renesas-pinctrl (1325820dd085 pinctrl: renesas: rzg=
2l: Move pinconf_to_config_argument() call outside of switch cases)
Merging pinctrl-samsung/for-next (39dbbd4e6778 pinctrl: samsung: Use kmemdu=
p_array instead of kmemdup for multiple allocation)
Merging pwm/pwm/for-next (ab10edfc477c pwm: adp5585: Set OSC_EN bit to 1 wh=
en PWM state is enabled)
Merging ktest/for-next (07283c1873a4 ktest: force $buildonly =3D 1 for 'mak=
e_warnings_file' test type)
Merging kselftest/next (b4bcdff7e839 selftests: filesystems: fix warn_unuse=
d_result build warnings)
Merging kunit/test (8400291e289e Linux 6.11-rc1)
Merging kunit-next/kunit (1757cc292ad4 Documentation: KUnit: Update filenam=
e best practices)
Merging livepatching/for-next (57b421369dd7 Merge branch 'for-6.11/selftest=
s-fixup' into for-next)
Merging rtc/rtc-next (04dcadb87da6 rtc: stm32: add alarm A out feature)
Merging nvdimm/libnvdimm-for-next (447b167bb60d nvdimm: Remove dead code fo=
r ENODEV checking in scan_labels())
Merging at24/at24/for-next (36e071d2a152 dt-bindings: eeprom: at24: Add com=
patible for Giantec GT24C04A)
Merging ntb/ntb-next (92aee2f6d156 NTB: ntb_transport: fix all kernel-doc w=
arnings)
Merging seccomp/for-next/seccomp (de9c2c66ad8e Linux 6.11-rc2)
Merging fsi/next (c5eeb63edac9 fsi: Fix panic on scom file read)
Merging slimbus/for-next (9b6e704955fa slimbus: generate MODULE_ALIAS() fro=
m MODULE_DEVICE_TABLE())
Merging nvmem/for-next (4744c5cbba44 dt-bindings: nvmem: sfp: add ref to nv=
mem-deprecated-cells.yaml)
  0a55faea9c90 ("nvmem: u-boot-env: error if NVMEM device is too small")
  6eabcb1b4fed ("dt-bindings: nvmem: Use soc-nvmem node name instead of nvm=
em")
  cd6acd8a1903 ("nvmem: Fix return type of devm_nvmem_device_get() in kerne=
ldoc")
CONFLICT (content): Merge conflict in drivers/nvmem/u-boot-env.c
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
Merging unicode/for-next (156bb2c569cd unicode: Fix utf8_load() error path)
Merging slab/slab/for-next (3ac40cd1a6fb Merge branch 'slab/for-6.12/rcu_ba=
rriers' into slab/for-next)
CONFLICT (content): Merge conflict in kernel/rcu/tree.c
Merging random/master (963233ff0133 selftests: vDSO: also test counter in v=
dso_test_chacha)
CONFLICT (content): Merge conflict in tools/include/linux/linkage.h
Merging landlock/next (ad1b27fc9877 Landlock: Document LANDLOCK_SCOPED_ABST=
RACT_UNIX_SOCKET and ABI versioning)
Merging rust/rust-next (68d3b6aa0870 MAINTAINERS: add Trevor Gross as Rust =
reviewer)
CONFLICT (content): Merge conflict in rust/kernel/lib.rs
Merging sysctl/sysctl-next (559d4c6a9d3b sysctl: avoid spurious permanent e=
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

--Sig_/JcL7.8u2jnNIaHEs1LXoemm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbYCWAACgkQAVBC80lX
0GzOVgf/dZS2zfR5n5z0fXq/usYR5ooF+JcrRBiLMjO1kIe2yDvFQZGXnNngDTep
UPkeAwaZVXqclz7TeFaIuMwbJdULixN+RDims90HO4CzmoQiRiK849sZv1yhGkqX
dsGczKMtcUqgOVCLvBzh+cX/5+JHkKIYh0Z4n3o0UM3stXneZUfIdm3qYeixximv
8cpxxdwtFqu0oYw3j+IX6CqrI+hTwc2JSjrcQvbLzyYyaHi/zJMjY1m+eR6V1Qpp
YhWxMxl1wWFNDz2xSiTBt4h650PgmwpluWU4xCNDPSMU9S4YAegJPOypMaYP4s0p
rxzhMNrPy0nEmiZPddXHnh//o9jS7g==
=Dmob
-----END PGP SIGNATURE-----

--Sig_/JcL7.8u2jnNIaHEs1LXoemm--

