Return-Path: <linux-next+bounces-3824-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B98977BF9
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 11:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A2702813EF
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 09:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D1C1BD4EA;
	Fri, 13 Sep 2024 09:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lPlY/Uhr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093C717BED3;
	Fri, 13 Sep 2024 09:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726218789; cv=none; b=IM3GlscRpcH5U0kUbjeaSm0fOY/fYg3XmaNodLlIAA1WlmEWmQKC9ZXFjDn1D2y4k1CodqazLT9OBiil0qAwLY95KlTaiB/PXf2YsMXOf1nmd6vEdY18OB1qmXni+uVxJQvHSUHPDF+EUw9hirKvAMB7vdfp1VVAeK+muFksg+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726218789; c=relaxed/simple;
	bh=95eRLN0H4fNO56q2u+dEj6CYzAT92Nejpghp1PnLJjw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fhVZCgVj8EbsJt7trTWYcnQ2SHsIdSTBWelQLPlF8GB9p6FwKCOznHNTIUfy6irWKvVI5OTf0f5GrOVYQCqsmu51Bn/KIhJlTtXjJxqMrhcB/8mVxLD+5xzaEnBnVtKE331IHNgTaYHFsRlfC6Zt6t8RE7YwBN5kPDSXlROGDx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lPlY/Uhr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726218778;
	bh=QiyAawVJyVDBhrvAU1FqbenTuXRBE7C4eWv00wFKgoE=;
	h=Date:From:To:Cc:Subject:From;
	b=lPlY/Uhr5vYcC5c3/tClFmcXz/YeI9HEDB9nJ4SVJ3E5BGAtOAOn/tI0IyzBYK4I2
	 FBZS8vK2zyqmfFy4X42lPO5Kv2r/jtpVcSYtSGS0tG4tITvx8RbPZMDt7aqwH9bhmk
	 bdASKi1uMvci6WyPRw4EK+al/lryS1h5uHgG+wB3oqOOH6p/g5lTp0VS0vOApqB3WJ
	 t8vkJYZx7Codp6o3X5t5GPG9a+yvUGUYl6zYB1Tc9lkw5jZs+soQo2N4Q6bDqon0HX
	 VaYApV8iBFBE2k4ZSP1QvQDF1j4MVQ6IseEFttsWu/Qt7xWSots9CtADEvcZcLrEck
	 wh+6Q/MmckUJw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X4pVy5TStz4wc3;
	Fri, 13 Sep 2024 19:12:58 +1000 (AEST)
Date: Fri, 13 Sep 2024 19:12:58 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 13
Message-ID: <20240913191258.19880da5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/I2VhGOsg.OiZVIN2PqYvSA/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/I2VhGOsg.OiZVIN2PqYvSA/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20240912:

I added a supplied patch to fix a reported build failure after the mm
tree was merged.

An interaction between the vfs-brauner and mm trees caused a build
failure, so for now I have reverted a commit from the mm tree.

The vfs-brauner tree gained a conflict against the cifs tree.

The loongarch tree lost its build failure.

The net-next tree gained a build failure for which I reverted a topic
branch.

The bpf-next tree gained semantic conflicts against the vfs-brauner and
xfs trees.

The watchdog tree still had its build failure so I used the version from
next-20240910.

The xen-tip tree lost its build failure.

Non-merge commits (relative to Linus' tree): 10744
 10753 files changed, 431029 insertions(+), 193424 deletions(-)

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
Merging origin/master (fdf042df0463 Merge tag 'hwmon-for-v6.11-rc8' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging)
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
Merging bcachefs/for-next (b72bcc914244 bcachefs: return err ptr instead of=
 null in read sb clean)
Merging fscrypt/for-next (256abd8e550c Linux 6.10-rc7)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (d434adf7d94e Merge branch 'for-next-next-v6.11-2024=
0910' into for-next-20240910)
Merging ceph/master (ede0b1d30b82 libceph: use min() to simplify code in ce=
ph_dns_resolve_name())
Merging cifs/for-next (0d8e0a5d118c smb: client: compress: LZ77 code improv=
ements cleanup)
Merging configfs/for-next (4425c1d9b44d configfs: improve item creation per=
formance)
Merging dlm/next (652b0ae675fe dlm: add missing -ENOMEM if alloc_workqueue(=
) fails)
Merging erofs/dev (025497e1d176 erofs: reject inodes with negative i_size)
Merging exfat/dev (dbbd9a77c3de exfat: fix memory leak in exfat_load_bitmap=
())
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
Merging nfs-anna/linux-next (9d905b15aefc NFSv4: Fail mounts if the lease s=
etup times out)
Merging nfsd/nfsd-next (127b5a02dfd5 xdrgen: Prevent reordering of encoder =
and decoder functions)
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
Merging vfs-brauner/vfs.all (047b74d00949 Merge branch 'vfs.procfs' into vf=
s.all Signed-off-by: Christian Brauner <brauner@kernel.org>)
CONFLICT (content): Merge conflict in fs/btrfs/super.c
CONFLICT (content): Merge conflict in fs/exfat/inode.c
CONFLICT (content): Merge conflict in fs/ext4/inline.c
CONFLICT (content): Merge conflict in fs/ext4/inode.c
CONFLICT (content): Merge conflict in fs/ext4/super.c
CONFLICT (content): Merge conflict in fs/f2fs/data.c
CONFLICT (modify/delete): fs/netfs/io.c deleted in vfs-brauner/vfs.all and =
modified in HEAD.  Version HEAD of fs/netfs/io.c left in tree.
CONFLICT (content): Merge conflict in fs/smb/client/cifsencrypt.c
CONFLICT (content): Merge conflict in fs/smb/client/cifssmb.c
CONFLICT (content): Merge conflict in fs/xfs/xfs_super.c
CONFLICT (content): Merge conflict in include/linux/fs.h
$ git rm -f fs/netfs/io.c
Merging vfs/for-next (a38297e3fb01 Linux 6.9)
Merging fixes/fixes (2dde18cd1d8f Linux 6.5)
Merging mm-hotfixes/mm-hotfixes-unstable (4dcf20c99340 resource: fix region=
_intersects() vs add_memory_driver_managed())
Merging fs-current (790c8492e25c Merge branch 'fixes' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging kbuild-current/fixes (431c1646e1f8 Linux 6.11-rc6)
Merging arc-current/for-curr (e67572cd2204 Linux 6.9-rc6)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (c060f93253ca arm64: stacktrace: fix the=
 usage of ftrace_graph_ret_addr())
Merging arm-soc-fixes/arm/fixes (0e7af99aef5f Merge tag 'riscv-soc-fixes-fo=
r-v6.11-final' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/lin=
ux into arm/fixes)
Merging davinci-current/davinci/for-current (6613476e225e Linux 6.8-rc1)
Merging drivers-memory-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging sophgo-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging m68k-current/for-linus (21b9e722ad28 m68k: cmpxchg: Fix return valu=
e for default case in __arch_xchg())
Merging powerpc-fixes/fixes (734ad0af3609 powerpc/qspinlock: Fix deadlock i=
n MCS queue)
Merging s390-fixes/fixes (1642285e511c s390/boot: Fix KASLR base offset off=
 by __START_KERNEL bytes)
Merging net/main (3e705251d998 net: netfilter: move nf flowtable bpf initia=
lization in nf_flow_table_module_init())
Merging bpf/master (b831f83e40a2 Merge tag 'bpf-6.11-rc7' of git://git.kern=
el.org/pub/scm/linux/kernel/git/bpf/bpf)
Merging ipsec/master (9b0874286768 Merge branch 'mctp-serial-tx-escapes')
Merging netfilter/main (7f3287db6543 netfilter: nft_socket: make cgroupsv2 =
matching work with namespaces)
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
Merging sound-asoc-fixes/for-linus (4f9a71435953 ASoC: meson: axg-card: fix=
 'use-after-free')
Merging regmap-fixes/for-linus (10a650193899 Merge remote-tracking branch '=
regmap/for-6.10' into regmap-linus)
Merging regulator-fixes/for-linus (1a5caec7f80c regulator: core: Stub devm_=
regulator_bulk_get_const() if !CONFIG_REGULATOR)
Merging spi-fixes/for-linus (2a8787c1cdc7 spi: nxp-fspi: fix the KASAN repo=
rt out-of-bounds bug)
Merging pci-current/for-linus (fc8c818e7569 PCI: Fix potential deadlock in =
pcim_intx())
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
Merging soundwire-fixes/fixes (233a95fd574f soundwire: stream: Revert "soun=
dwire: stream: fix programming slave ports for non-continous port maps")
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
Merging cxl-fixes/fixes (da3ea35007d0 Linux 6.11-rc7)
Merging dma-mapping-fixes/for-linus (75961ffb5cb3 swiotlb: initialise restr=
icted pool list_head when SWIOTLB_DYNAMIC=3Dy)
Merging drivers-x86-fixes/fixes (d6de45e3c6f3 platform/x86: asus-wmi: Disab=
le OOBE experience on Zenbook S 16)
Merging samsung-krzk-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging pinctrl-samsung-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging devicetree-fixes/dt/linus (b739dffa5d57 of/irq: Prevent device addr=
ess out-of-bounds read in interrupt map walk)
Merging dt-krzk-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging scsi-fixes/fixes (0f9592ae26ff scsi: ufs: ufs-mediatek: Add UFSHCD_=
QUIRK_BROKEN_LSDBS_CAP)
Merging drm-fixes/drm-fixes (da3ea35007d0 Linux 6.11-rc7)
Merging drm-intel-fixes/for-linux-next-fixes (d3d37f74683e drm/i915/guc: pr=
event a possible int overflow in wq offsets)
Merging mmc-fixes/fixes (aea62c744a9a mmc: cqhci: Fix checking of CQHCI_HAL=
T state)
Merging rtc-fixes/rtc-fixes (8400291e289e Linux 6.11-rc1)
Merging gnss-fixes/gnss-linus (8400291e289e Linux 6.11-rc1)
Merging hyperv-fixes/hyperv-fixes (895384881ec9 hv: vmbus: Constify struct =
kobj_type and struct attribute_group)
Merging risc-v-fixes/fixes (7c1e5b9690b0 riscv: Disable preemption while ha=
ndling PR_RISCV_CTX_SW_FENCEI_OFF)
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
Merging i2c-host-fixes/i2c/i2c-host-fixes (e2c85d85a05f i2c: qcom-geni: Use=
 IRQF_NO_AUTOEN flag in request_irq())
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (a4d89b11aca3 clk: qcom: clk-alpha-pll: Simplif=
y the zonda_pll_adjust_l_val())
Merging pwrseq-fixes/pwrseq/for-current (431c1646e1f8 Linux 6.11-rc6)
Merging thead-dt-fixes/thead-dt-fixes (8400291e289e Linux 6.11-rc1)
Merging drm-misc-fixes/for-linux-next-fixes (4a33aa34e4ac drm/display: fix =
kerneldocs references)
Merging mm-stable/mm-stable (e0a955bf7f61 mm/codetag: add pgalloc_tag_copy(=
))
CONFLICT (content): Merge conflict in kernel/events/uprobes.c
Merging mm-nonmm-stable/mm-nonmm-stable (dab2214fec60 treewide: correct the=
 typo 'retun')
Merging mm/mm-everything (ee5dc43678cf foo)
CONFLICT (content): Merge conflict in kernel/resource.c
Applying: mm: fix PHYSMEM_END build error on m68k
Merging kbuild/for-next (40ea58d302ad kallsyms: change overflow variable to=
 bool type)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (1de5b5dcb835 perf trace: Mark the 'head' arg =
in the set_robust_list syscall as coming from user space)
Merging compiler-attributes/compiler-attributes (8400291e289e Linux 6.11-rc=
1)
Merging dma-mapping/for-next (a5fb217f13f7 dma-mapping: reflow dma_supporte=
d)
Merging asm-generic/master (b82c1d235a30 syscalls: add back legacy __NR_nfs=
servctl macro)
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (9016915e3c5f Merge branches 'amba', 'fixes' and 'misc=
' into for-next)
Merging arm64/for-next/core (75078ba2b38a Merge branch 'for-next/timers' in=
to for-next/core)
Merging arm-perf/for-next/perf (7c626ce4bae1 Linux 6.11-rc3)
Merging arm-soc/for-next (81c516425aed Merge branch 'soc/dt' into for-next)
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
Merging sunxi/sunxi/for-next (34180094bc07 Merge branch 'sunxi/dt-for-6.12'=
 into sunxi/for-next)
Merging tee/next (cd88a296582c Merge branch 'optee_notif_wait_timeout_for_v=
6.11' into next)
Merging tegra/for-next (6726d2c6a157 Merge branch for-6.12/arm64/defconfig =
into for-next)
Merging thead-dt/thead-dt-for-next (2d98fea7491a riscv: dts: thead: change =
TH1520 SPI node to use clock controller)
Merging ti/ti-next (657b48ad4c7a Merge branches 'ti-drivers-soc-next', 'ti-=
k3-config-next' and 'ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (31dba0dd2fa7 Merge branch 'zynqmp/soc' into for-ne=
xt)
Merging clk/clk-next (a9b0a2b6841a Merge branch 'clk-fixes' into clk-next)
Merging clk-imx/for-next (32c055ef563c clk: imx6ul: fix clock parent for IM=
X6UL_CLK_ENETx_REF_SEL)
Merging clk-renesas/renesas-clk (3aeccbe08171 clk: renesas: r9a09g057: Add =
clock and reset entries for GTM/RIIC/SDHI/WDT)
Merging csky/linux-next (2c40c1c6adab Merge tag 'usb-6.7-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging loongarch/loongarch-next (357da696640e LoongArch: KVM: Add irqfd su=
pport)
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
Merging parisc-hd/for-next (1634de90f68e mm: mmap: Allow mmap(MAP_STACK) to=
 map growable stack)
Merging powerpc/next (01d34cc93639 powerpc: Switch back to struct platform_=
driver::remove())
Merging risc-v/for-next (0e3f3649d44b riscv: Enable generic CPU vulnerabili=
tes support)
Merging riscv-dt/riscv-dt-for-next (8400291e289e Linux 6.11-rc1)
Merging riscv-soc/riscv-soc-for-next (8400291e289e Linux 6.11-rc1)
Merging s390/for-next (e84a8303f1ba Merge branch 'features' into for-next)
Applying: fixup for "s390/mm/ptdump: Generate address marker array dynamica=
lly"
Merging sh/for-next (8fe76a1c2264 sh: push-switch: Add missing MODULE_DESCR=
IPTION() macro)
Merging sparc/for-next (a3da15389112 sparc64: Fix prototype warnings in hib=
ernate.c)
Merging uml/next (381d2f95c8aa um: fix time-travel syscall scheduling hack)
Merging xtensa/xtensa-for-next (b7cf2a1d9881 xtensa: remove redundant flush=
_dcache_page and ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE macros)
Merging fs-next (e1f92950fa57 Merge branch 'vfs.all' of git://git.kernel.or=
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
Merging hid/for-next (c0c018662352 Merge branch 'i2c-hid' into for-next)
Merging i2c/i2c/for-next (642e257c3ec3 Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i2c-host/i2c/i2c-host (f56f4ba2fc1d i2c: designware: Use pci_get_dr=
vdata())
Merging i3c/i3c/next (061dd21ca712 i3c/master: cmd_v1: Fix the rule for get=
ting i3c mode)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (3017d28d6c0f hwmon: (sch5636) Print unkno=
wn ID in error string via %*pE)
Merging jc_docs/docs-next (052f172ef127 Merge branch 'docs-mw' into docs-ne=
xt)
Merging v4l-dvb/master (3f52e32445a1 media: MAINTAINERS: Add "qcom," substr=
ing for Qualcomm Camera Subsystem)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (1e39c60d14b8 Merge branch 'pm-sleep' into linux-next)
CONFLICT (content): Merge conflict in arch/riscv/include/asm/irq.h
Merging cpufreq-arm/cpufreq/arm/linux-next (6b612d1bac67 cpufreq: ti-cpufre=
q: Use socinfo to get revision in AM62 family)
Merging cpupower/cpupower (80e67f1802d0 pm:cpupower: Add error warning when=
 SWIG is not installed)
Merging devfreq/devfreq-next (d47552124bb0 PM / devfreq: imx-bus: Use of_pr=
operty_present())
Merging pmdomain/next (9e5eb7403cb6 pmdomain: Merge branch fixes into next)
Merging opp/opp/linux-next (a84372012e93 dt-bindings: opp: operating-points=
-v2-ti-cpu: Update maintainers)
Merging thermal/thermal/linux-next (7d8abc5f3b5c thermal/drivers/imx_sc_the=
rmal: Use dev_err_probe)
Merging rdma/for-next (f4ccc0a2a0c5 RDMA/hns: Fix restricted __le16 degrade=
s to integer issue)
Merging net-next/main (eda5891f5296 Merge branch 'ena-driver-metrics-change=
s')
CONFLICT (content): Merge conflict in drivers/net/ethernet/mellanox/mlxsw/c=
ore_thermal.c
CONFLICT (content): Merge conflict in include/linux/mlx5/mlx5_ifc.h
Applying: Revert "net: hsr: Use the seqnr lock for frames received via inte=
rlink port."
Applying: Revert "Merge branch 'device-memory-tcp'"
Merging bpf-next/for-next (a8e40fd0f127 Merge branch 'bpf-next/struct_fd' i=
nto for-next)
CONFLICT (content): Merge conflict in drivers/net/netkit.c
CONFLICT (content): Merge conflict in fs/coda/inode.c
Applying: fixe up for "introduce fd_file(), convert all accessors to it."
Applying: fix up 2 for "introduce fd_file(), convert all accessors to it."
Applying: fix up 3 for "introduce fd_file(), convert all accessors to it."
Merging ipsec-next/master (e62d39332d4b xfrm: policy: Restore dir assignmen=
ts in xfrm_hash_rebuild())
Merging mlx5-next/mlx5-next (c772a2c69018 net/mlx5: Add IFC related stuff f=
or data direct)
Merging netfilter-next/main (d5c4546062fd net: sched: consistently use rcu_=
replace_pointer() in taprio_change())
Merging ipvs-next/main (4201f3938914 netfilter: nf_tables: set element time=
out update support)
Merging bluetooth/master (7ffaa2002518 Bluetooth: btintel_pcie: Allocate me=
mory for driver private data)
Merging wireless-next/for-next (fe57beb026ef Merge tag 'ath-next-20240909' =
of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath)
Merging ath-next/for-next (fe57beb026ef Merge tag 'ath-next-20240909' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/ath/ath)
Merging wpan-next/master (3cfb5aa10cb7 Merge branch 'add-support-for-open-a=
lliance-10base-t1x-macphy-serial-interface')
Merging wpan-staging/staging (3cfb5aa10cb7 Merge branch 'add-support-for-op=
en-alliance-10base-t1x-macphy-serial-interface')
Merging mtd/mtd/next (395999829880 mtd: powernv: Add check devm_kasprintf()=
 returned value)
Merging nand/nand/next (475aadeba5df mtd: spinand: macronix: Flag parts nee=
ding explicit plane select)
Merging spi-nor/spi-nor/next (527d0fa65426 mtd: spi-nor: fix flash probing)
Merging crypto/master (c398cb8eb0a2 crypto: octeontx* - Select CRYPTO_AUTHE=
NC)
Merging drm/drm-next (b615b9c36cae Merge v6.11-rc7 into drm-next)
CONFLICT (content): Merge conflict in fs/pstore/platform.c
Merging drm-exynos/for-linux-next (94ebc3d3235c drivers:drm:exynos_drm_gsc:=
Fix wrong assignment in gsc_bind())
Merging drm-misc/for-linux-next (ba2b9de0c1ac drm/tegra: fix potential unin=
itialized variable use)
Merging amdgpu/drm-next (0c8c5bdd7eaf drm/amd/display: Add all planes on CR=
TC to state for overlay cursor)
Merging drm-intel/for-linux-next (0289507609dc drm/i915/bios: fix printk fo=
rmat width)
Merging drm-msm/msm-next (15302579373e drm/msm/dpu: enable writeback on SM6=
350)
Merging drm-msm-lumag/msm-next-lumag (15302579373e drm/msm/dpu: enable writ=
eback on SM6350)
Merging drm-xe/drm-xe-next (bbb1ed0b4437 drm/xe: Use ERR_CAST to return an =
error-valued pointer)
Merging etnaviv/etnaviv/next (704d3d60fec4 drm/etnaviv: don't block schedul=
er when GPU is still active)
Merging fbdev/for-next (de5e89b6654e fbdev: omapfb: Fix typo in comment)
Merging regmap/for-next (7da49f45bf04 Merge remote-tracking branch 'regmap/=
for-6.12' into regmap-next)
Merging sound/for-next (0b9f2bd00fc3 ALSA: memalloc: Use proper DMA mapping=
 API for x86 S/G buffer allocations)
Merging ieee1394/for-next (d9605d675625 firewire: core: use mutex to coordi=
nate concurrent calls to flush completions)
Merging sound-asoc/for-next (9c6148bcbec6 Merge remote-tracking branch 'aso=
c/for-6.12' into asoc-next)
CONFLICT (modify/delete): sound/soc/cirrus/edb93xx.c deleted in HEAD and mo=
dified in sound-asoc/for-next.  Version sound-asoc/for-next of sound/soc/ci=
rrus/edb93xx.c left in tree.
$ git rm -f sound/soc/cirrus/edb93xx.c
Merging modules/modules-next (71c0bab396aa module: Refine kmemleak scanned =
areas)
Merging input/next (4172a64ef2c4 Input: zforce_ts - switch to using asynchr=
onous probing)
Merging block/for-next (2c930c8bafd4 Merge branch 'for-6.12/io_uring-discar=
d' into for-next)
Merging device-mapper/for-next (9c2010bccc0c dm-integrity: check mac_size a=
gainst HASH_MAX_DIGESTSIZE in sb_mac())
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
Merging regulator/for-next (6865a63bac89 Merge remote-tracking branch 'regu=
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
Merging iommu/next (c75b5ebff710 Merge branches 'fixes', 'arm/smmu', 'intel=
/vt-d', 'amd/amd-vi' and 'core' into next)
Merging audit/next (8c1867a2f0fd audit: Make use of str_enabled_disabled() =
helper)
Merging devicetree/for-next (2d1ccb6b90ba drivers/of: Improve documentation=
 for match_string)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/pow=
er/wakeup-source.txt
Merging dt-krzk/for-next (08fd3b6e0df4 Merge branch 'next/dt64' into for-ne=
xt)
Merging mailbox/for-next (a8bd68e4329f mailbox: mtk-cmdq: Move devm_mbox_co=
ntroller_register() after devm_pm_runtime_enable())
Merging spi/for-next (58be528df758 Merge remote-tracking branch 'spi/for-6.=
12' into spi-next)
Merging tip/master (4c293d0fa315 Merge branch into tip/master: 'x86/timers')
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
Merging kvm-arm/next (17a000564499 Merge branch kvm-arm64/visibility-cleanu=
ps into kvmarm-master/next)
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
Merging xen-tip/linux-next (3adc73efad83 xen/xenbus: Convert to use ERR_CAS=
T())
Merging percpu/for-next (2d9ad81ef935 Merge branch 'for-6.8-fixes' into for=
-next)
Merging workqueues/for-next (90c6d73ac19d Merge branch 'for-6.11-fixes' int=
o for-next)
Merging sched-ext/for-next (902d67a2d40f sched: Move update_other_load_avgs=
() to kernel/sched/pelt.c)
Merging drivers-x86/for-next (8e8895c9dc81 platform/x86: asus-wmi: don't fa=
il if platform_profile already registered)
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
Merging driver-core/driver-core-next (efb0b309fa0d driver core: Trivially s=
implify ((struct device_private *)curr)->device->p to @curr)
Merging usb/usb-next (2193ede180dd net/9p/usbg: fix CONFIG_USB_GADGET depen=
dency)
Merging thunderbolt/next (10904df3f20c thunderbolt: Improve software receiv=
er lane margining)
Merging usb-serial/usb-next (4c0d9477ba69 USB: serial: kobil_sct: restore i=
nitial terminal settings)
Merging tty/tty-next (5ed771f17472 tty: serial: samsung: Fix serial rx on A=
pple A7-A9)
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
Merging iio/togreg (fec496684388 iio: adc: ad7173: add support for ad4113)
Merging phy-next/next (3c2ea12a625d phy: renesas: rcar-gen3-usb2: Add suppo=
rt for the RZ/G3S SoC)
Merging soundwire/next (5aedb8d8336b soundwire: intel_bus_common: enable in=
terrupts before exiting reset)
Merging extcon/extcon-next (2e01ac83c1c7 extcon: lc824206xa: Fix build erro=
r of POWER_SUPPLY_PROP_USB_TYPE)
Merging gnss/gnss-next (8400291e289e Linux 6.11-rc1)
Merging vfio/next (aab439ffa1ca vfio/pci: clean up a type in vfio_pci_ioctl=
_pci_hot_reset_groups())
Merging w1/for-next (8400291e289e Linux 6.11-rc1)
Merging spmi/spmi-next (7c626ce4bae1 Linux 6.11-rc3)
Merging staging/staging-next (17a1d7c5a49c staging: rtl8723bs: Remove unuse=
d file rtw_rf.c)
Merging counter-next/counter-next (0d0f611bdf8e counter: ftm-quaddec: Enabl=
e module autoloading)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (5be63fc19fca Linux 6.11-rc5)
Merging dmaengine/next (e0bee4bcdc32 dmaengine: loongson1-apb-dma: Fix the =
build warning caused by the size of pdev_irqname)
Merging cgroup/for-next (df57390127a2 Merge branch 'for-6.12' into for-next)
Merging scsi/for-next (8a1f405ed3bd Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (359aeb86480d Merge patch series "Update lpfc to =
revision 14.4.0.5")
Merging vhost/linux-next (1bc6f4910ae9 vsock/virtio: avoid queuing packets =
when intermediate queue is empty)
  fbb072d2d191 ("ack! vdpa/mlx5: Parallelize device suspend/resume")
Merging rpmsg/for-next (29a55480b9c3 Merge branches 'rproc-next', 'rpmsg-ne=
xt' and 'hwspinlock-next' into for-next)
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (6b5e97c02006 gpio: mpc8xxx: switch to usin=
g DEFINE_RUNTIME_DEV_PM_OPS())
CONFLICT (modify/delete): arch/arm/mach-ep93xx/vision_ep9307.c deleted in H=
EAD and modified in gpio-brgl/gpio/for-next.  Version gpio-brgl/gpio/for-ne=
xt of arch/arm/mach-ep93xx/vision_ep9307.c left in tree.
$ git rm -f arch/arm/mach-ep93xx/vision_ep9307.c
Merging gpio-intel/for-next (8400291e289e Linux 6.11-rc1)
Merging pinctrl/for-next (264c13114bd7 Merge tag 'intel-pinctrl-v6.12-1' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into devel)
CONFLICT (content): Merge conflict in drivers/pinctrl/Makefile
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
Merging kselftest/next (a0474b8d5974 selftests: kselftest: Use strerror() o=
n nolibc)
Merging kunit/test (8400291e289e Linux 6.11-rc1)
Merging kunit-next/kunit (7fcc9b53216c lib/math: Add int_pow test suite)
Merging livepatching/for-next (9fbf78b6d6ce Merge branch 'for-6.12/trivial'=
 into for-next)
Merging rtc/rtc-next (60a06efc56d7 rtc: m48t59: Remove division condition w=
ith direct comparison)
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
Merging cxl/next (b5209da36b19 cxl: Convert cxl_internal_send_cmd() to use =
'struct cxl_mailbox' as input)
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (77d48d39e991 efistub/tpm: Use ACPI reclaim memory for eve=
nt log to avoid corruption)
Merging unicode/for-next (156bb2c569cd unicode: Fix utf8_load() error path)
Merging slab/slab/for-next (b5f07550be43 Merge branch 'slab/for-6.12/kmem_c=
ache_args' into slab/for-next)
CONFLICT (content): Merge conflict in kernel/rcu/tree.c
Merging random/master (341e3832a912 selftests: vDSO: fix vdso_config for s3=
90)
CONFLICT (content): Merge conflict in tools/include/linux/linkage.h
Merging landlock/next (7ef7e9df9935 landlock: Document LANDLOCK_SCOPED_SIGN=
AL)
  191021d73803 ("fs: add f_pipe")
  3125ec2ef10b ("ufs: store cookie in private data")
  45c6e98705e0 ("fs: remove f_version")
  905fcc3a4ec0 ("udf: store cookie in private data")
  a6e2141e0b77 ("ubifs: store cookie in private data")
  ce22e70a947f ("pipe: use f_pipe")
  e2f00c032780 ("ocfs2: store cookie in private data")
  f2647a4fbe5e ("proc: store cookie in private data")
CONFLICT (content): Merge conflict in drivers/input/input.c
Merging rust/rust-next (d077242d68a3 rust: support for shadow call stack sa=
nitizer)
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

--Sig_/I2VhGOsg.OiZVIN2PqYvSA/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbkAhoACgkQAVBC80lX
0GyZtAf7BwILrXJisiX5rafDcd9FbkoTIvGPTDby+Ak0aljR82FUHG98Hk7J/rXc
d+8lCQ1xMOzFuCWcHp5L9UOiyd1O6IebVtrAenqYonyoNYgJvb9WFcoPjlsRhbHp
W+Xuv0QwGtOIRZLyeh6StTeo6CBEb8od8GSNtk4POBkcx/6K5zjpov8KqXHh7S9J
2qC1C4t2N4r6t4Cj+NyJiAONgPtKuB7oi9T2hXlP7SQJUr8pyU6bslDLPgQt8b+W
VoO7MWTPvNOpKC7AphHLP/BEfo63LhG2ONnRtsTKXdnPtnrof/YRwpHFmx9uwLV+
ACLS1AQnce15i5UJaFXl/Ax/ljIqTQ==
=qXLt
-----END PGP SIGNATURE-----

--Sig_/I2VhGOsg.OiZVIN2PqYvSA/--

