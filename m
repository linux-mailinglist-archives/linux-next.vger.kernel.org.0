Return-Path: <linux-next+bounces-3758-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A70E9750F3
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 13:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 723F9B23279
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 11:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A4D0186E24;
	Wed, 11 Sep 2024 11:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YwkyzH96"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B5D1547CF;
	Wed, 11 Sep 2024 11:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726054900; cv=none; b=NE3XFF0STD/eDrLMy3yuH2ZvL/dyiGaFfONbONsuYclvYUw2BetokOCSRgoKc+8XBs7VXQPoUlDk5gGPtGIJyjPNQgao6eHqpj3URiN6hiX3yuS9uY3zSOv2w8O0cwYmH1aehbt0m8Gvhd86Nk2O4qx0KyA/gQJLSPjBmLP19mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726054900; c=relaxed/simple;
	bh=u04QIKQ2htX779pYkpJ+icdcggk40MfHQrX7Bbuer2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lSH171X4084Iwurs+C2IH5blgJX8kns7W9jmSUUDEMGH+khDVtNd9VbeQ/sctg1GOiu4h9JGkf7ieLA0KuDsfRN6qwlNvtcKV9e0Cv/+cITOxFMqGllulzQCxeDJHjVgVP0UH1DtJJKwBU0Th2M8/ZOQBe+ExhXeI8iQshABQhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YwkyzH96; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726054888;
	bh=VKrUz6hV1Cpzcf0+4CP7SaN3mHUDN47rgC8Xj1+Mulg=;
	h=Date:From:To:Cc:Subject:From;
	b=YwkyzH96FCnrYJzfcuN5p00cNFTwOg2BffeSCdSQorexI9YfB5yLN22ksLL1gUUkL
	 opMDwqWJFKEtN+DDgnVE2uULRgIHgQaep2gM+j11fgE9DPTtw3pmLypydk8xHCxDE1
	 gOgT4GPErw6yeRBW7ydg3OglyBC54xJV9v58rM7oBpivmUvsoIoFIkgiD4WQT2DeT9
	 RYgwieH9u0HBU13ev6Xt1lDkX1zAFwezr+lWwF10B4hMkf9987Mku+mhFvb5V3cvkM
	 mCXcSI0pGeUzzSEG8gmMcBU5g0ZCnpCV7quTeNKEpTIR99sm2dqXkkjaueNTi42OlS
	 1uEaGCXWFQETg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3dvD4jxXz4x21;
	Wed, 11 Sep 2024 21:41:28 +1000 (AEST)
Date: Wed, 11 Sep 2024 21:41:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 11
Message-ID: <20240911214127.4837ade4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/N+hasF+spYMj5r_Byu7ebuq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/N+hasF+spYMj5r_Byu7ebuq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20240910:

I added a supplied patch to fix a reported build failure after the mm
tree was merged.

The kbuild tree gained a build failure for which I installed gawk.

The bcachefs tree gained a conflict against the mm tree.

The vfs-brauner tree lost its build failure.

An interaction between the vfs-brauner and mm trees caused a build
failure, so for now I have reverted a commit from the mm tree.

The security tree gained a conflict against the mm tree.

The watchdog tree gained a build failure so I used the version from
next-20240910.

The devicetree tree gained a conflict against the input tree.

The tip tree gained a conflict against the mm tree.  It also gained a
build failure for which I reverted a commit.

The kvm-x86 tree gained a conflict against the kvm6390 tree.

The xen-tip tree gained a build failure so I used the version from
next-20240910.

The sched-ext tree gained a conflict against the tip tree.

Non-merge commits (relative to Linus' tree): 10115
 10169 files changed, 390622 insertions(+), 183735 deletions(-)

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
Merging origin/master (8d8d276ba2fb Merge tag 'trace-v6.11-rc6' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace)
Merging vfs-brauner-fixes/vfs.fixes (72a6e22c604c fscache: delete fscache_c=
ookie_lru_timer when fscache exits to avoid UAF)
Merging fscrypt-current/for-current (256abd8e550c Linux 6.10-rc7)
Merging fsverity-current/for-current (256abd8e550c Linux 6.10-rc7)
Merging btrfs-fixes/next-fixes (da3ea35007d0 Linux 6.11-rc7)
Merging vfs-fixes/fixes (8c86f1a45749 close_range(): fix the logics in desc=
riptor table trimming)
Merging erofs-fixes/fixes (5be63fc19fca Linux 6.11-rc5)
Merging nfsd-fixes/nfsd-fixes (40927f3d0972 nfsd: fix nfsd4_deleg_getattr_c=
onflict in presence of third party lease)
Merging v9fs-fixes/fixes/next (0c3836482481 Linux 6.10)
Merging overlayfs-fixes/ovl-fixes (77a28aa47687 ovl: relax WARN_ON in ovl_v=
erify_area())
Merging bcachefs/for-next (5cf488d35f46 bcachefs: Remove duplicated include=
 in backpointers.c)
Merging fscrypt/for-next (256abd8e550c Linux 6.10-rc7)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (d434adf7d94e Merge branch 'for-next-next-v6.11-2024=
0910' into for-next-20240910)
Merging ceph/master (ede0b1d30b82 libceph: use min() to simplify code in ce=
ph_dns_resolve_name())
Merging cifs/for-next (84a8a03833ff smb: client: Use min() macro)
Merging configfs/for-next (4425c1d9b44d configfs: improve item creation per=
formance)
Merging dlm/next (652b0ae675fe dlm: add missing -ENOMEM if alloc_workqueue(=
) fails)
Merging erofs/dev (a71f78705a87 erofs: allocate more short-lived pages from=
 reserved pool first)
Merging exfat/dev (98ad7b9012b5 exfat: Implement sops->shutdown and ioctl)
Merging exportfs/exportfs-next (0c3836482481 Linux 6.10)
Merging ext3/for_next (802e492f2fda Merge fanotify HSM events implementatio=
n.)
CONFLICT (content): Merge conflict in fs/bcachefs/fs.c
Merging ext4/dev (ff2beee206d2 ext4: convert EXT4_B2C(sbi->s_stripe) users =
to EXT4_NUM_B2C)
Merging f2fs/dev (5697e94daab9 f2fs: get rid of page->index)
Merging fsverity/for-next (256abd8e550c Linux 6.10-rc7)
Merging fuse/for-next (9dc504f24489 virtio_fs: allow idmapped mounts)
Merging gfs2/for-next (6888c1e85f5d gfs2: Remove gfs2_aspace_writepage())
Merging jfs/jfs-next (2b59ffad47db jfs: Fix uninit-value access of new_ea i=
n ea_buffer)
Merging ksmbd/ksmbd-for-next (da3ea35007d0 Linux 6.11-rc7)
Merging nfs/linux-next (67784a74e258 Merge tag 'ata-6.11-rc7' of git://git.=
kernel.org/pub/scm/linux/kernel/git/libata/linux)
Merging nfs-anna/linux-next (f92214e4c312 NFS: Avoid unnecessary rescanning=
 of the per-server delegation list)
Merging nfsd/nfsd-next (42ff64ba8c7c nfsd: fix delegation_blocked() to bloc=
k correctly for at least 30 seconds)
Merging ntfs3/master (689ecd06ef8d fs/ntfs3: Rename ntfs3_setattr into ntfs=
_setattr)
Merging orangefs/for-next (96319dacaf15 orangefs: Constify struct kobj_type)
Merging overlayfs/overlayfs-next (6c4a5f964504 ovl: fail if trusted xattrs =
are needed but caller lacks permission)
Merging ubifs/next (92a286e90203 ubi: Fix ubi_init() ubiblock_exit() sectio=
n mismatch)
Merging v9fs/9p-next (2211561723a6 9p: Enable multipage folios)
Merging v9fs-ericvh/ericvh/for-next (0c3836482481 Linux 6.10)
Merging xfs/for-next (90fa22da6d6b xfs: ensure st_blocks never goes to zero=
 during COW writes)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging file-locks/locks-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6-=
mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging iversion/iversion-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6=
-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging vfs-brauner/vfs.all (e2376b68cb7c Merge branch 'vfs.procfs' into vf=
s.all Signed-off-by: Christian Brauner <brauner@kernel.org>)
CONFLICT (content): Merge conflict in fs/btrfs/super.c
CONFLICT (content): Merge conflict in fs/exfat/inode.c
CONFLICT (content): Merge conflict in fs/ext4/inline.c
CONFLICT (content): Merge conflict in fs/ext4/inode.c
CONFLICT (content): Merge conflict in fs/ext4/super.c
CONFLICT (content): Merge conflict in fs/f2fs/data.c
CONFLICT (modify/delete): fs/netfs/io.c deleted in vfs-brauner/vfs.all and =
modified in HEAD.  Version HEAD of fs/netfs/io.c left in tree.
CONFLICT (content): Merge conflict in fs/smb/client/cifssmb.c
CONFLICT (content): Merge conflict in fs/xfs/xfs_super.c
CONFLICT (content): Merge conflict in include/linux/fs.h
$ git rm -f fs/netfs/io.c
Merging vfs/for-next (a38297e3fb01 Linux 6.9)
Merging fixes/fixes (2dde18cd1d8f Linux 6.5)
Merging mm-hotfixes/mm-hotfixes-unstable (4dcf20c99340 resource: fix region=
_intersects() vs add_memory_driver_managed())
Merging fs-current (5fda420a76e9 Merge branch 'fixes' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging kbuild-current/fixes (431c1646e1f8 Linux 6.11-rc6)
Merging arc-current/for-curr (e67572cd2204 Linux 6.9-rc6)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (c060f93253ca arm64: stacktrace: fix the=
 usage of ftrace_graph_ret_addr())
Merging arm-soc-fixes/arm/fixes (2650fd867929 Merge tag 'v6.11-rockchip-dts=
fixes' of https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockc=
hip into arm/fixes)
Merging davinci-current/davinci/for-current (6613476e225e Linux 6.8-rc1)
Merging drivers-memory-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging sophgo-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging m68k-current/for-linus (21b9e722ad28 m68k: cmpxchg: Fix return valu=
e for default case in __arch_xchg())
Merging powerpc-fixes/fixes (734ad0af3609 powerpc/qspinlock: Fix deadlock i=
n MCS queue)
Merging s390-fixes/fixes (1642285e511c s390/boot: Fix KASLR base offset off=
 by __START_KERNEL bytes)
Merging net/main (48aa361c5db0 Merge branch 'revert-virtio_net-rx-enable-pr=
emapped-mode-by-default')
Merging bpf/master (b831f83e40a2 Merge tag 'bpf-6.11-rc7' of git://git.kern=
el.org/pub/scm/linux/kernel/git/bpf/bpf)
Merging ipsec/master (9b0874286768 Merge branch 'mctp-serial-tx-escapes')
Merging netfilter/main (d759ee240d3c Merge tag 'net-6.11-rc7' of git://git.=
kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ipvs/main (031ae72825ce ila: call nf_unregister_net_hooks() sooner)
Merging wireless/for-next (f0417c50fddd Merge branch '100GbE' of git://git.=
kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue)
Merging ath/for-current (2f833e8948d6 Revert "wifi: ath11k: support hiberna=
tion")
Merging wpan/master (addf89774e48 ieee802154: Fix build error)
Merging rdma-fixes/for-rc (8400291e289e Linux 6.11-rc1)
Merging sound-current/for-linus (c491b044cf5f Merge tag 'asoc-fix-v6.11-rc6=
' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for=
-linus)
Merging sound-asoc-fixes/for-linus (c6b9a92225d1 MAINTAINERS: update Pierre=
 Bossart's email and role)
Merging regmap-fixes/for-linus (10a650193899 Merge remote-tracking branch '=
regmap/for-6.10' into regmap-linus)
Merging regulator-fixes/for-linus (1a5caec7f80c regulator: core: Stub devm_=
regulator_bulk_get_const() if !CONFIG_REGULATOR)
Merging spi-fixes/for-linus (b787a3386412 spi: geni-qcom: Fix incorrect fre=
e_irq() sequence)
Merging pci-current/for-linus (8f62819aaace PCI/pwrctl: Rescan bus on a sep=
arate thread)
Merging driver-core.current/driver-core-linus (47ac09b91bef Linux 6.11-rc4)
Merging tty.current/tty-linus (47ac09b91bef Linux 6.11-rc4)
Merging usb.current/usb-linus (da3ea35007d0 Linux 6.11-rc7)
Merging usb-serial-fixes/usb-linus (7d47d22444bb USB: serial: pl2303: add d=
evice id for Macrosilicon MS3020)
Merging phy/fixes (431c1646e1f8 Linux 6.11-rc6)
Merging staging.current/staging-linus (8400291e289e Linux 6.11-rc1)
Merging iio-fixes/fixes-togreg (48b9a8dabcc3 VMCI: Fix use-after-free when =
removing resource in vmci_resource_remove())
Merging counter-current/counter-current (8400291e289e Linux 6.11-rc1)
Merging char-misc.current/char-misc-linus (da3ea35007d0 Linux 6.11-rc7)
Merging soundwire-fixes/fixes (431c1646e1f8 Linux 6.11-rc6)
Merging thunderbolt-fixes/fixes (da3ea35007d0 Linux 6.11-rc7)
Merging input-current/for-linus (e06edf96dea0 Input: i8042 - add TUXEDO Ste=
llaris 16 Gen5 AMD to i8042 quirk table)
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
Merging kvm-fixes/master (59cbd4eea48f KVM: Remove HIGH_RES_TIMERS dependen=
cy)
Merging kvms390-fixes/master (cff59d8631e1 s390/uv: Panic for set and remov=
e shared access UVC errors)
Merging hwmon-fixes/hwmon (20471071f198 hwmon: (pmbus) Conditionally clear =
individual status bits for pmbus rev >=3D 1.2)
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
Merging drm-fixes/drm-fixes (141bb6bc73cf Merge tag 'amd-drm-fixes-6.11-202=
4-09-05' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (d3d37f74683e drm/i915/guc: pr=
event a possible int overflow in wq offsets)
Merging mmc-fixes/fixes (aea62c744a9a mmc: cqhci: Fix checking of CQHCI_HAL=
T state)
Merging rtc-fixes/rtc-fixes (8400291e289e Linux 6.11-rc1)
Merging gnss-fixes/gnss-linus (8400291e289e Linux 6.11-rc1)
Merging hyperv-fixes/hyperv-fixes (895384881ec9 hv: vmbus: Constify struct =
kobj_type and struct attribute_group)
Merging risc-v-fixes/fixes (1ff95eb2bebd riscv: Fix RISCV_ALTERNATIVE_EARLY)
Merging riscv-dt-fixes/riscv-dt-fixes (7d9d88890f04 MAINTAINERS: invert Mis=
c RISC-V SoC Support's pattern)
Merging riscv-soc-fixes/riscv-soc-fixes (61f2e8a3a941 riscv: dts: starfive:=
 jh7110-common: Fix lower rate of CPUfreq by setting PLL0 rate to 1.5GHz)
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (47ac09b91bef Linux 6.11-rc4)
Merging gpio-brgl-fixes/gpio/for-current (da3ea35007d0 Linux 6.11-rc7)
Merging gpio-intel-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging pinctrl-intel-fixes/fixes (a366e46da10d pinctrl: meteorlake: Add Ar=
row Lake-H/U ACPI ID)
Merging auxdisplay-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging kunit-fixes/kunit-fixes (12cb32a52eb6 kunit: Fix missing kerneldoc =
comment)
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
Merging i2c-host-fixes/i2c/i2c-host-fixes (da3ea35007d0 Linux 6.11-rc7)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (a4d89b11aca3 clk: qcom: clk-alpha-pll: Simplif=
y the zonda_pll_adjust_l_val())
Merging pwrseq-fixes/pwrseq/for-current (431c1646e1f8 Linux 6.11-rc6)
Merging thead-dt-fixes/thead-dt-fixes (8400291e289e Linux 6.11-rc1)
Merging drm-misc-fixes/for-linux-next-fixes (45c690aea8ee drm/tegra: Use io=
mmu_paging_domain_alloc())
Merging mm-stable/mm-stable (e0a955bf7f61 mm/codetag: add pgalloc_tag_copy(=
))
CONFLICT (content): Merge conflict in kernel/events/uprobes.c
Merging mm-nonmm-stable/mm-nonmm-stable (dab2214fec60 treewide: correct the=
 typo 'retun')
Merging mm/mm-everything (ee5dc43678cf foo)
CONFLICT (content): Merge conflict in kernel/resource.c
Merging kbuild/for-next (40ea58d302ad kallsyms: change overflow variable to=
 bool type)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (003265bb6f02 perf mem: Fix the wrong referenc=
e in parse_record_events())
Merging compiler-attributes/compiler-attributes (8400291e289e Linux 6.11-rc=
1)
Merging dma-mapping/for-next (038eb433dc14 dma-mapping: add tracing for dma=
-mapping API calls)
Merging asm-generic/master (b82c1d235a30 syscalls: add back legacy __NR_nfs=
servctl macro)
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (9016915e3c5f Merge branches 'amba', 'fixes' and 'misc=
' into for-next)
Merging arm64/for-next/core (d2b460acf9e0 Merge branch 'for-next/poe' into =
for-next/core)
Merging arm-perf/for-next/perf (7c626ce4bae1 Linux 6.11-rc3)
Merging arm-soc/for-next (dba40c7311ec Merge branch 'soc/drivers' into for-=
next)
Merging amlogic/for-next (034835342aab Merge branch 'v6.12/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (ffc253263a13 Linux 6.6)
Merging aspeed/for-next (b4c322c2783a ARM: dts: aspeed: catalina: Update io=
 expander line names)
Merging at91/at91-next (ee735afc2dae Merge branch 'at91-soc' into at91-next)
Merging broadcom/next (7eff0651abbb Merge branch 'soc/next' into next)
Merging davinci/davinci/for-next (973d248c43f2 ARM: davinci: remove unused =
cpuidle code)
Merging drivers-memory/for-next (32960b4f25c2 memory: pl353-smc: simplify w=
ith scoped for each OF child loop)
Merging imx-mxs/for-next (79e1b8171ca4 Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (4f4b3263feee Merge branch 'v6.11-next/soc' into =
for-next)
Merging mvebu/for-next (dea56c781ed3 ARM: dove: Drop a write-only variable)
Merging omap/for-next (ba1b153f6d27 Merge branch 'omap-for-v6.12/drivers' i=
nto tmp/omap-next-20240904.164705)
Merging qcom/for-next (2adcf3941db7 Merge branches 'arm32-for-6.12', 'arm64=
-defconfig-fixes-for-6.11', 'arm64-defconfig-for-6.12', 'arm64-fixes-for-6.=
11', 'arm64-for-6.12', 'clk-fixes-for-6.11', 'clk-for-6.12', 'drivers-fixes=
-for-6.11' and 'drivers-for-6.12' into for-next)
Merging renesas/next (5379c9e0a6ad Merge branch 'renesas-dts-for-v6.12' int=
o renesas-next)
Merging reset/reset/next (487b1b32e317 reset: eyeq: add platform driver)
Merging rockchip/for-next (bae9cc0db172 Merge branch 'v6.12-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (6a8afff2166f Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (8aaf45bcb48e Merge branch 'for-next/scmi/updat=
es' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linu=
x into for-linux-next)
Merging sophgo/for-next (4ea8511c034b riscv: dts: sophgo: cv1812h: add pinc=
trl support)
Merging stm32/stm32-next (b14c9f6bd0ba ARM: dts: stm32: Use SAI to generate=
 bit and frame clock on STM32MP15xx DHCOM PDK2)
Merging sunxi/sunxi/for-next (0acd49860124 Merge branch 'sunxi/dt-for-6.12'=
 into sunxi/for-next)
Merging tee/next (cd88a296582c Merge branch 'optee_notif_wait_timeout_for_v=
6.11' into next)
Merging tegra/for-next (6726d2c6a157 Merge branch for-6.12/arm64/defconfig =
into for-next)
Merging thead-dt/thead-dt-for-next (2d98fea7491a riscv: dts: thead: change =
TH1520 SPI node to use clock controller)
Merging ti/ti-next (657b48ad4c7a Merge branches 'ti-drivers-soc-next', 'ti-=
k3-config-next' and 'ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (bc810ecbb30a Merge branch 'zynq/soc' into for-next)
Merging clk/clk-next (a9b0a2b6841a Merge branch 'clk-fixes' into clk-next)
Merging clk-imx/for-next (32c055ef563c clk: imx6ul: fix clock parent for IM=
X6UL_CLK_ENETx_REF_SEL)
Merging clk-renesas/renesas-clk (3aeccbe08171 clk: renesas: r9a09g057: Add =
clock and reset entries for GTM/RIIC/SDHI/WDT)
Merging csky/linux-next (2c40c1c6adab Merge tag 'usb-6.7-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging loongarch/loongarch-next (4956e07f05e2 LoongArch: KVM: Invalidate g=
uest steal time address on vCPU reset)
Merging m68k/for-next (b90fae5df917 m68k: defconfig: Update defconfigs for =
v6.11-rc1)
Merging m68knommu/for-next (aa99969ef591 m68k: remove trailing space after=
=20
Merging microblaze/next (d829e7ee6354 microblaze: Export xmb_manager functi=
ons)
Merging mips/mips-next (439667fb943c mips: Remove posix_types.h include fro=
m sigcontext.h)
Merging openrisc/for-next (4dc70e1aadfa openrisc: Move FPU state out of pt_=
regs)
Merging parisc-hd/for-next (2d442d1660bd parisc: Use PRIV_USER instead of h=
ardcoded value)
Merging powerpc/next (01d34cc93639 powerpc: Switch back to struct platform_=
driver::remove())
Merging risc-v/for-next (0e3f3649d44b riscv: Enable generic CPU vulnerabili=
tes support)
Merging riscv-dt/riscv-dt-for-next (8400291e289e Linux 6.11-rc1)
Merging riscv-soc/riscv-soc-for-next (8400291e289e Linux 6.11-rc1)
Merging s390/for-next (14f9faa84b02 Merge branch 'features' into for-next)
Applying: fixup for "s390/mm/ptdump: Generate address marker array dynamica=
lly"
Merging sh/for-next (8fe76a1c2264 sh: push-switch: Add missing MODULE_DESCR=
IPTION() macro)
Merging sparc/for-next (a3da15389112 sparc64: Fix prototype warnings in hib=
ernate.c)
Merging uml/next (98ff534ec2cd um: vector: always reset vp->opened)
Merging xtensa/xtensa-for-next (b7cf2a1d9881 xtensa: remove redundant flush=
_dcache_page and ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE macros)
Merging fs-next (812a5e570152 Merge branch 'vfs.all' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/vfs/vfs.git)
CONFLICT (content): Merge conflict in fs/bcachefs/fs.c
CONFLICT (content): Merge conflict in include/linux/huge_mm.h
CONFLICT (content): Merge conflict in mm/filemap.c
Applying: Reapply "mm: introduce PF_MEMALLOC_NORECLAIM, PF_MEMALLOC_NOWARN"
Merging printk/for-next (b794563ea12f Merge branch 'for-6.11-fixup' into fo=
r-next)
Merging pci/next (1b7d3f673001 Merge branch 'pci/misc')
Merging pstore/for-next/pstore (1bf8012fc699 pstore: replace spinlock_t by =
raw_spinlock_t)
Merging hid/for-next (5b09c15d1c11 Merge branch 'for-6.12/wacom' into for-n=
ext)
Merging i2c/i2c/for-next (642e257c3ec3 Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i2c-host/i2c/i2c-host (18024d60679a i2c: ljca: Remove unused "targe=
t_addr" parameter)
Merging i3c/i3c/next (061dd21ca712 i3c/master: cmd_v1: Fix the rule for get=
ting i3c mode)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (d22bd451d560 hwmon: (pmbus/mpq7932) Const=
ify struct regulator_desc)
Merging jc_docs/docs-next (052f172ef127 Merge branch 'docs-mw' into docs-ne=
xt)
Merging v4l-dvb/master (3f52e32445a1 media: MAINTAINERS: Add "qcom," substr=
ing for Qualcomm Camera Subsystem)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (5f7018f73bbf Merge branch 'pm-tools' into linux-next)
CONFLICT (content): Merge conflict in arch/riscv/include/asm/irq.h
Merging cpufreq-arm/cpufreq/arm/linux-next (6b612d1bac67 cpufreq: ti-cpufre=
q: Use socinfo to get revision in AM62 family)
Merging cpupower/cpupower (80e67f1802d0 pm:cpupower: Add error warning when=
 SWIG is not installed)
Merging devfreq/devfreq-next (d47552124bb0 PM / devfreq: imx-bus: Use of_pr=
operty_present())
Merging pmdomain/next (208e0280f776 OPP: Drop redundant _opp_attach|detach_=
genpd())
Merging opp/opp/linux-next (a84372012e93 dt-bindings: opp: operating-points=
-v2-ti-cpu: Update maintainers)
Merging thermal/thermal/linux-next (7d8abc5f3b5c thermal/drivers/imx_sc_the=
rmal: Use dev_err_probe)
Merging rdma/for-next (227f51743b61 RDMA/bnxt_re: Fix the max WQE size for =
static WQE support)
Merging net-next/main (ea403549daa6 Merge tag 'ipsec-next-2024-09-10' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec-next)
CONFLICT (content): Merge conflict in drivers/net/ethernet/mellanox/mlxsw/c=
ore_thermal.c
Merging bpf-next/for-next (52332699abc9 Merge branch 'bpf-next/master' into=
 for-next)
CONFLICT (content): Merge conflict in drivers/net/netkit.c
Merging ipsec-next/master (e62d39332d4b xfrm: policy: Restore dir assignmen=
ts in xfrm_hash_rebuild())
Merging mlx5-next/mlx5-next (c772a2c69018 net/mlx5: Add IFC related stuff f=
or data direct)
Merging netfilter-next/main (d5c4546062fd net: sched: consistently use rcu_=
replace_pointer() in taprio_change())
Merging ipvs-next/main (4201f3938914 netfilter: nf_tables: set element time=
out update support)
Merging bluetooth/master (fd8c0f820825 Bluetooth: hci_sync: Ignore errors f=
rom HCI_OP_REMOTE_NAME_REQ_CANCEL)
Merging wireless-next/for-next (fe57beb026ef Merge tag 'ath-next-20240909' =
of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath)
Merging ath-next/for-next (fe57beb026ef Merge tag 'ath-next-20240909' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/ath/ath)
Merging wpan-next/master (9187210eee7d Merge tag 'net-next-6.9' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging wpan-staging/staging (9187210eee7d Merge tag 'net-next-6.9' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mtd/mtd/next (395999829880 mtd: powernv: Add check devm_kasprintf()=
 returned value)
Merging nand/nand/next (475aadeba5df mtd: spinand: macronix: Flag parts nee=
ding explicit plane select)
Merging spi-nor/spi-nor/next (527d0fa65426 mtd: spi-nor: fix flash probing)
Merging crypto/master (c398cb8eb0a2 crypto: octeontx* - Select CRYPTO_AUTHE=
NC)
Applying: mm: fix PHYSMEM_END build error on m68k
Merging drm/drm-next (741d73f587d5 Merge tag 'amd-drm-next-6.12-2024-09-06'=
 of https://gitlab.freedesktop.org/agd5f/linux into drm-next)
  26dbffb2a4c4 ("drm/stm: add COMMON_CLK dependency")
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dp=
_mst.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dp=
_mst.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_qu=
irks.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/tegra/gr3d.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/display/xe_display=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_hwmon.c
CONFLICT (content): Merge conflict in fs/pstore/platform.c
Merging drm-exynos/for-linux-next (94ebc3d3235c drivers:drm:exynos_drm_gsc:=
Fix wrong assignment in gsc_bind())
Merging drm-misc/for-linux-next (ba2b9de0c1ac drm/tegra: fix potential unin=
itialized variable use)
Merging amdgpu/drm-next (4c3140fea627 drm/amdgpu: get rid of bogus includes=
 of fdtable.h)
Merging drm-intel/for-linux-next (54df34c5a243 drm/i915/bios: fix printk fo=
rmat width)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/display/xe_display=
.c
Merging drm-msm/msm-next (15302579373e drm/msm/dpu: enable writeback on SM6=
350)
Merging drm-msm-lumag/msm-next-lumag (15302579373e drm/msm/dpu: enable writ=
eback on SM6350)
Merging drm-xe/drm-xe-next (1c129ed07de4 drm/xe: fix build warning with CON=
FIG_PM=3Dn)
Merging etnaviv/etnaviv/next (704d3d60fec4 drm/etnaviv: don't block schedul=
er when GPU is still active)
Merging fbdev/for-next (27f22f897095 fbdev: hyperv_fb: Convert comma to sem=
icolon)
Merging regmap/for-next (7da49f45bf04 Merge remote-tracking branch 'regmap/=
for-6.12' into regmap-next)
Merging sound/for-next (5ced8b914ed4 ALSA: memalloc: Move snd_malloc_ops de=
finition into memalloc.c again)
Merging ieee1394/for-next (d9605d675625 firewire: core: use mutex to coordi=
nate concurrent calls to flush completions)
Merging sound-asoc/for-next (b082f361e1e5 Merge remote-tracking branch 'aso=
c/for-6.12' into asoc-next)
Merging modules/modules-next (907fa79d787f MAINTAINERS: scale modules with =
more reviewers)
Merging input/next (4172a64ef2c4 Input: zforce_ts - switch to using asynchr=
onous probing)
Merging block/for-next (6cc95f2658a7 Merge branch 'for-6.12/block' into for=
-next)
Merging device-mapper/for-next (90da77987dd5 dm-integrity: support recalcul=
ation in the 'I' mode)
Merging libata/for-next (e5dd410acb34 ata: libata: Clear DID_TIME_OUT for A=
TA PT commands with sense data)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (73048a832587 optee: Fix a NULL vs IS_ERR() check)
Merging mfd/for-mfd-next (ae3239408c5b mfd: intel-lpss: Add Intel Panther L=
ake LPSS PCI IDs)
Merging backlight/for-backlight-next (fea88a13a5d1 backlight: l4f00242t03: =
Add check for spi_setup)
Merging battery/for-next (eb1ea1351da0 power: supply: ab8500: Constify stru=
ct kobj_type)
Merging regulator/for-next (050ad39f0d6b Merge remote-tracking branch 'regu=
lator/for-6.12' into regulator-next)
CONFLICT (content): Merge conflict in drivers/mfd/axp20x.c
CONFLICT (content): Merge conflict in include/linux/mfd/axp20x.h
Merging security/next (81119f9b5e61 Automated merge of 'dev' into 'next')
CONFLICT (content): Merge conflict in fs/fcntl.c
CONFLICT (content): Merge conflict in include/linux/lsm_hooks.h
CONFLICT (content): Merge conflict in security/security.c
Merging apparmor/apparmor-next (8400291e289e Linux 6.11-rc1)
Merging integrity/next-integrity (fa8a4ce432e8 ima: fix buffer overrun in i=
ma_eventdigest_init_common)
Merging selinux/next (83f8b733c9b7 Automated merge of 'dev' into 'next')
Merging smack/next (2749749afa07 smackfs: Use rcu_assign_pointer() to ensur=
e safe assignment in smk_set_cipso)
Merging tomoyo/master (dc1c8034e31b minmax: simplify min()/max()/clamp() im=
plementation)
Merging tpmdd/next (ad9a5bcb00cd KEYS: Remove unused declarations)
Merging watchdog/master (ba60f951a098 dt-bindings: watchdog: Add Cirrus EP9=
3x)
$ git reset --hard HEAD^
Merging next-20240910 version of watchdog
Merging iommu/next (c720ab5f63f6 Merge branches 'arm/smmu', 'intel/vt-d', '=
amd/amd-vi' and 'core' into next)
Merging audit/next (8c1867a2f0fd audit: Make use of str_enabled_disabled() =
helper)
Merging devicetree/for-next (d97f8755c811 dt-bindings: dma: Add lpc32xx DMA=
 mux binding)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/pow=
er/wakeup-source.txt
Merging dt-krzk/for-next (08fd3b6e0df4 Merge branch 'next/dt64' into for-ne=
xt)
Merging mailbox/for-next (a8bd68e4329f mailbox: mtk-cmdq: Move devm_mbox_co=
ntroller_register() after devm_pm_runtime_enable())
Merging spi/for-next (c7b0e37c8434 Merge remote-tracking branch 'spi/for-6.=
12' into spi-next)
Merging tip/master (02ab769cb8f9 Merge branch into tip/master: 'x86/timers')
  6b9ccbc033cf ("kthread: Fix task state in kthread worker if being frozen")
CONFLICT (content): Merge conflict in arch/arm64/Kconfig
Merging clockevents/timers/drivers/next (d7a87891e2f5 platform/x86:intel/pm=
c: fix build regression with pmtimer turned off)
Merging edac/edac-for-next (61124f42dcaa Merge ras/edac-drivers into for-ne=
xt)
Merging ftrace/for-next (2a07e30c19f3 Merge ring-buffer/for-next)
Merging rcu/next (355debb83bf7 Merge branches 'context_tracking.15.08.24a',=
 'csd.lock.15.08.24a', 'nocb.09.09.24a', 'rcutorture.14.08.24a', 'rcustall.=
09.09.24a', 'srcu.12.08.24a', 'rcu.tasks.14.08.24a', 'rcu_scaling_tests.15.=
08.24a', 'fixes.12.08.24a' and 'misc.11.08.24a' into next.09.09.24a)
CONFLICT (content): Merge conflict in include/linux/context_tracking.h
Merging paulmck/non-rcu/next (f01f18f2ed7d Merge branches 'cmpxchg.2024.08.=
06a', 'lkmm.2024.08.02a', 'kcsan.2024.08.01a' and 'misc.2024.08.02a' into H=
EAD)
Merging kvm/next (15e1c3d65975 KVM: x86: Use this_cpu_ptr() instead of per_=
cpu_ptr(smp_processor_id()))
Merging kvm-arm/next (c2cc1cd73d7b Merge branch kvm-arm64/s2-ptdump into kv=
marm-master/next)
CONFLICT (content): Merge conflict in arch/arm64/include/asm/kvm_host.h
Merging kvms390/next (4d8f85eb77d7 s390: Enable KVM_S390_UCONTROL config in=
 debug_defconfig)
Merging kvm-ppc/topic/ppc-kvm (46765aaec4d7 KVM: PPC: Book3S HV: remove unu=
sed varible)
Merging kvm-riscv/riscv_kvm_next (5aa09297a3dc RISC-V: KVM: Fix to allow hp=
mcounter31 from the guest)
Merging kvm-x86/next (3cc25d5adcfd Merge branches 'fixes', 'generic', 'misc=
', 'mmu', 'pat_vmx_msrs', 'selftests', 'svm' and 'vmx')
CONFLICT (content): Merge conflict in tools/testing/selftests/kvm/.gitignore
Merging xen-tip/linux-next (66618315515f xen/xenbus: Convert to use ERR_CAS=
T())
$ git reset --hard HEAD^
Merging next-20240910 version of xen-tip
Merging percpu/for-next (2d9ad81ef935 Merge branch 'for-6.8-fixes' into for=
-next)
Merging workqueues/for-next (82e29ca33e36 Merge branch 'for-6.12' into for-=
next)
Merging sched-ext/for-next (513ed0c7ccc1 sched_ext: Don't trigger ops.quies=
cent/runnable() on migrations)
CONFLICT (content): Merge conflict in kernel/sched/fair.c
CONFLICT (content): Merge conflict in kernel/sched/syscalls.c
Merging drivers-x86/for-next (f5dd17e30a59 platform/x86: wmi: Call both leg=
acy and WMI driver notify handlers)
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
Merging driver-core/driver-core-next (fea64fa04c31 devres: Correclty strip =
percpu address space of devm_free_percpu() argument)
Merging usb/usb-next (f299cd11f753 Merge 6.11-rc7 into usb-next)
Merging thunderbolt/next (10904df3f20c thunderbolt: Improve software receiv=
er lane margining)
Merging usb-serial/usb-next (4c0d9477ba69 USB: serial: kobil_sct: restore i=
nitial terminal settings)
Merging tty/tty-next (f1ec92a066b2 tty: hvc: convert comma to semicolon)
Merging char-misc/char-misc-next (895b4fae931a Merge 6.11-rc7 into char-mis=
c-next)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (988d40a4d4e7 coresight: Make trace ID map spinlock =
local to the map)
Merging fastrpc/for-next (8400291e289e Linux 6.11-rc1)
Merging fpga/for-next (8de36789bd03 fpga: zynq-fpga: Rename 'timeout' varia=
ble as 'time_left')
Merging icc/icc-next (a5733950fe35 Merge branch 'icc-sm8350' into icc-next)
Merging iio/togreg (5ba0cb92584b iio: adc: axp20x_adc: add support for AXP7=
17 ADC)
Merging phy-next/next (3c2ea12a625d phy: renesas: rcar-gen3-usb2: Add suppo=
rt for the RZ/G3S SoC)
Merging soundwire/next (5aedb8d8336b soundwire: intel_bus_common: enable in=
terrupts before exiting reset)
Merging extcon/extcon-next (2e01ac83c1c7 extcon: lc824206xa: Fix build erro=
r of POWER_SUPPLY_PROP_USB_TYPE)
Merging gnss/gnss-next (8400291e289e Linux 6.11-rc1)
Merging vfio/next (27a8204b26ac vfio/mdev: Constify struct kobj_type)
Merging w1/for-next (8400291e289e Linux 6.11-rc1)
Merging spmi/spmi-next (7c626ce4bae1 Linux 6.11-rc3)
Merging staging/staging-next (fa42410edbf4 staging: vme_user: changed geoid=
 data type from int to u32)
Merging counter-next/counter-next (0d0f611bdf8e counter: ftm-quaddec: Enabl=
e module autoloading)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (5be63fc19fca Linux 6.11-rc5)
Merging dmaengine/next (e0bee4bcdc32 dmaengine: loongson1-apb-dma: Fix the =
build warning caused by the size of pdev_irqname)
Merging cgroup/for-next (df57390127a2 Merge branch 'for-6.12' into for-next)
  3c41382e920f ("cgroup: Disallow mounting v1 hierarchies without controlle=
r implementation")
  659f90f863a6 ("cgroup/cpuset: Expose cpuset filesystem with cpuset v1 onl=
y")
  af000ce85293 ("cgroup: Do not report unavailable v1 controllers in /proc/=
cgroups")
Merging scsi/for-next (8a1f405ed3bd Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (cff06a799dbe Merge patch series "smartpqi update=
s")
Merging vhost/linux-next (025b6cabd88a vsock/virtio: avoid queuing packets =
when intermediate queue is empty)
  040b4f437e17 ("vduse: avoid using __GFP_NOFAIL")
  7b6893c309d2 ("ack! vdpa/mlx5: Parallelize device suspend/resume")
Merging rpmsg/for-next (29a55480b9c3 Merge branches 'rproc-next', 'rpmsg-ne=
xt' and 'hwspinlock-next' into for-next)
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (6b5e97c02006 gpio: mpc8xxx: switch to usin=
g DEFINE_RUNTIME_DEV_PM_OPS())
Merging gpio-intel/for-next (8400291e289e Linux 6.11-rc1)
Merging pinctrl/for-next (b1ad05164eca Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (1652e95b17d5 pinctrl: intel: Constify struc=
t intel_pinctrl parameter)
Merging pinctrl-renesas/renesas-pinctrl (1325820dd085 pinctrl: renesas: rzg=
2l: Move pinconf_to_config_argument() call outside of switch cases)
Merging pinctrl-samsung/for-next (39dbbd4e6778 pinctrl: samsung: Use kmemdu=
p_array instead of kmemdup for multiple allocation)
Merging pwm/pwm/for-next (ab463a4d354a dt-bindings: pwm: amlogic: Add new b=
indings for meson A1 PWM)
Merging ktest/for-next (2351e8c65404 ktest.pl: Avoid false positives with g=
rub2 skip regex)
Merging kselftest/next (af1ec38c6ccc selftests/timers: Remove unused NSEC_P=
ER_SEC macro)
Merging kunit/test (8400291e289e Linux 6.11-rc1)
Merging kunit-next/kunit (a4311c274e08 kunit: Fix kernel-doc for EXPORT_SYM=
BOL_IF_KUNIT)
Merging livepatching/for-next (9fbf78b6d6ce Merge branch 'for-6.12/trivial'=
 into for-next)
Merging rtc/rtc-next (04dcadb87da6 rtc: stm32: add alarm A out feature)
Merging nvdimm/libnvdimm-for-next (447b167bb60d nvdimm: Remove dead code fo=
r ENODEV checking in scan_labels())
Merging at24/at24/for-next (36e071d2a152 dt-bindings: eeprom: at24: Add com=
patible for Giantec GT24C04A)
Merging ntb/ntb-next (92aee2f6d156 NTB: ntb_transport: fix all kernel-doc w=
arnings)
Merging seccomp/for-next/seccomp (de9c2c66ad8e Linux 6.11-rc2)
Merging fsi/next (c5eeb63edac9 fsi: Fix panic on scom file read)
Merging slimbus/for-next (8400291e289e Linux 6.11-rc1)
Merging nvmem/for-next (8400291e289e Linux 6.11-rc1)
Merging xarray/main (2a15de80dd0f idr: fix param name in idr_alloc_cyclic()=
 doc)
Merging hyperv/hyperv-next (94e86b174d10 tools/hv: Add memory allocation ch=
eck in hv_fcopy_start)
Merging auxdisplay/for-next (8400291e289e Linux 6.11-rc1)
Merging kgdb/kgdb/for-next (9bccbe7b2087 kdb: Get rid of redundant kdb_curr=
_task())
Merging hmm/hmm (6613476e225e Linux 6.8-rc1)
Merging cfi/cfi/next (8400291e289e Linux 6.11-rc1)
Merging mhi/mhi-next (84a5ae5b23ba bus: mhi: host: pci_generic: Enable EDL =
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
Merging slab/slab/for-next (b5f07550be43 Merge branch 'slab/for-6.12/kmem_c=
ache_args' into slab/for-next)
CONFLICT (content): Merge conflict in kernel/rcu/tree.c
Merging random/master (cb8ea88f4508 powerpc/vdso: Wire up getrandom() vDSO =
implementation on VDSO64)
CONFLICT (content): Merge conflict in tools/include/linux/linkage.h
Merging landlock/next (f954c5e52c45 landlock: Document LANDLOCK_SCOPED_SIGN=
AL)
Merging rust/rust-next (93dc3be19450 docs: rust: include other expressions =
in conditional compilation section)
CONFLICT (content): Merge conflict in rust/kernel/lib.rs
Merging sysctl/sysctl-next (559d4c6a9d3b sysctl: avoid spurious permanent e=
mpty tables)
Merging execve/for-next/execve (6da1cdef7907 Merge branch 'for-linus/execve=
' into for-next/execve)
CONFLICT (content): Merge conflict in fs/binfmt_elf.c
CONFLICT (content): Merge conflict in include/linux/mm.h
Merging bitmap/bitmap-for-next (f7f33633ebe9 cpumask: Implement cpumask_{fi=
rst,next}_{nor,andnot})
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (c00ac1f9fd7b Merge branches 'for-linus/hardenin=
g' and 'for-next/hardening' into for-next/kspp)
Applying: fix up for "lib/string_choices: Add str_true_false()/str_false_tr=
ue() helper'
Applying: fix up for "lib/string_choices: Add str_up_down() helper"
Merging kspp-gustavo/for-next/kspp (6613476e225e Linux 6.8-rc1)
Merging nolibc/nolibc (248f6b935bbd Merge tag 'nolibc-20240824-for-6.12-1' =
of https://git.kernel.org/pub/scm/linux/kernel/git/nolibc/linux-nolibc into=
 nolibc)
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (3e6a7e3cda77 iommufd: Reorder struct forward decl=
arations)
CONFLICT (content): Merge conflict in drivers/iommu/iommufd/selftest.c
Merging turbostat/next (1dd10efc87e8 tools/power turbostat: Fix trailing '
Merging pwrseq/pwrseq/for-next (8b7e0a6c443e Documentation: add a driver AP=
I doc for the power sequencing subsystem)
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)
Applying: Revert "cpufreq/cppc: Use NSEC_PER_MSEC for deadline task"

--Sig_/N+hasF+spYMj5r_Byu7ebuq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbhgecACgkQAVBC80lX
0Gy8Hgf7B3qToIjkZhn6+HhFtxBZqAQdGHm04kBldlOIarRzLAAL6vgLSiOrUVGG
pP4gejvwCxf/HzaBP0uu+i1dZ+Iykk0OlqzbHLYy09QOToW94lcF6HPhYAofgPsa
gsGsI6rsP42N+GpL0MeGhR8g7WVGRqbLHpWmJBcM2RNTwhp8CnbX8ovzB6o+2bZ1
Otmf8W2ngzLVDZfj5S5p8S2d0xjtRBRVzVICJ0112o1RmEElfEbNFouDuJrrxOqo
M5SsxGChVZPCsB91cO8pOKXgTJK6M/BaW/ocExp0vpaGLE/z1qcYk4gHj5i5bZRb
LsvK+IKrcpijzaFo8FaUUx9bijw0sg==
=nuy+
-----END PGP SIGNATURE-----

--Sig_/N+hasF+spYMj5r_Byu7ebuq--

