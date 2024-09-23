Return-Path: <linux-next+bounces-3944-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D4C97E53A
	for <lists+linux-next@lfdr.de>; Mon, 23 Sep 2024 06:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F40ACB20C4E
	for <lists+linux-next@lfdr.de>; Mon, 23 Sep 2024 04:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA652114;
	Mon, 23 Sep 2024 04:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dVzfrxzJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B801D7464;
	Mon, 23 Sep 2024 04:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727064852; cv=none; b=dx3ltTJ1+VjtHh7YTlDJWZTX2zpM/2Roqa8mJ8FNkbiuk04fwzZYnBCs7CNyotE6m3lCxP5tvYvjOHPftVsugqwBXngxehfEjGCSGzHv736rGujT8IQfG3oLwMq8dsffvspgO0/Xk6HnfZzdC6poslXQB1GlhrM841INmMIiWCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727064852; c=relaxed/simple;
	bh=V62/lmTIukctqPzqhf5ZCBoMD3djxqOpJ5HulEEG5W4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YS42N6WaO/FGPtzavMRQg53QHBV8bZ0vI0Ooef9v/stsdh8aELUPrcI4efZ7PN6Hlm/7ussVxUNqS77faBL2aGuoouvAi8yjdsVHs6MRSzp1Zb64ENgSE+18ud3Nmo7nzJrEAt1+9QPWveXCvn/WYfjqGhB+fjCrtPSJf/TN0jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dVzfrxzJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727064845;
	bh=C/J+pNXfiUF33OCqbc2h82W3attdYII8sYAgdAYtK0w=;
	h=Date:From:To:Cc:Subject:From;
	b=dVzfrxzJJFh8nWZkYTKvDO2kUUj76srkO8Dl7vwyRvXl9WN5SjU+jwo2FIhBsqbxT
	 8SHKd64Jq8pb370bpIm5a475V1glxC/lgE1Voim/ZRXiycrIXoF48CG+i111dlyy2E
	 r0vomq5CA/+T8LK8WpODnW7+Y1Hf3LMBaUTsRxc0MH1UMUbk4Yw5eBNxiN3IhDSOE+
	 i5B99JGgYVnAkvtTEKG0G74h3iRqZwFh/N/1Tc+63oxifrv6wpUJ6KujhucIkITRN3
	 Ae3ovQgFqqN0xJsC9/vJkFc1Yce17X8Nzm5YLOn8MS2tklbSBRI4hSKZECFvFY6j+Z
	 zEtWAbZh+6qmA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XBqPT4ZBmz4wcr;
	Mon, 23 Sep 2024 14:14:05 +1000 (AEST)
Date: Mon, 23 Sep 2024 14:14:05 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 23
Message-ID: <20240923141405.76aaffee@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gRyFCLySdCSzCv+2ZX4KOY6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gRyFCLySdCSzCv+2ZX4KOY6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

During the merge window, please do not add any material destined for
v6.13 or later to your linux-next included branches until after v6.12-rc1
has been released.

Changes since 20240920:

I have dropped the -unstable parts of the mm tree (apart from the
hotfixes-unstable part) until the merge window closes.

My fixes tree is enpty again.

Non-merge commits (relative to Linus' tree): 3104
 3658 files changed, 120997 insertions(+), 52897 deletions(-)

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

I am currently merging 374 trees (counting Linus' and 140 trees of bug
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
Merging origin/master (de5cb0dcb74c Merge branch 'address-masking')
Merging fixes/fixes (de5cb0dcb74c Merge branch 'address-masking')
Merging vfs-brauner-fixes/vfs.fixes (72a6e22c604c fscache: delete fscache_c=
ookie_lru_timer when fscache exits to avoid UAF)
Merging fscrypt-current/for-current (256abd8e550c Linux 6.10-rc7)
Merging fsverity-current/for-current (256abd8e550c Linux 6.10-rc7)
Merging btrfs-fixes/next-fixes (a064948e242c Merge branch 'misc-6.12' into =
next-fixes)
Merging vfs-fixes/fixes (8c86f1a45749 close_range(): fix the logics in desc=
riptor table trimming)
Merging erofs-fixes/fixes (da3ea35007d0 Linux 6.11-rc7)
Merging nfsd-fixes/nfsd-fixes (40927f3d0972 nfsd: fix nfsd4_deleg_getattr_c=
onflict in presence of third party lease)
Merging v9fs-fixes/fixes/next (0c3836482481 Linux 6.10)
Merging overlayfs-fixes/ovl-fixes (77a28aa47687 ovl: relax WARN_ON in ovl_v=
erify_area())
Merging bcachefs/for-next (87a3e08121cb bcachefs: Switch to memalloc_flags_=
do() for vmalloc allocations)
Merging fscrypt/for-next (256abd8e550c Linux 6.10-rc7)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (e7c10ac01f31 Merge branch 'for-next-next-v6.12-2024=
0916' into for-next-20240916)
Merging ceph/master (ede0b1d30b82 libceph: use min() to simplify code in ce=
ph_dns_resolve_name())
Merging cifs/for-next (689a22e871e2 smb3: fix incorrect mode displayed for =
read-only files)
Merging configfs/for-next (4425c1d9b44d configfs: improve item creation per=
formance)
Merging dlm/next (652b0ae675fe dlm: add missing -ENOMEM if alloc_workqueue(=
) fails)
Merging erofs/dev (fc0644e85005 erofs: ensure regular inodes for file-backe=
d mounts)
Merging exfat/dev (02dccfb631ad MAINTAINERS: exfat: add myself as reviewer)
Merging exportfs/exportfs-next (0c3836482481 Linux 6.10)
Merging ext3/for_next (802e492f2fda Merge fanotify HSM events implementatio=
n.)
CONFLICT (content): Merge conflict in fs/bcachefs/fs.c
CONFLICT (content): Merge conflict in mm/filemap.c
Merging ext4/dev (ff2beee206d2 ext4: convert EXT4_B2C(sbi->s_stripe) users =
to EXT4_NUM_B2C)
Merging f2fs/dev (755f18261376 f2fs: allow F2FS_IPU_NOCACHE for pinned file)
CONFLICT (content): Merge conflict in fs/f2fs/data.c
Merging fsverity/for-next (256abd8e550c Linux 6.10-rc7)
Merging fuse/for-next (9dc504f24489 virtio_fs: allow idmapped mounts)
Merging gfs2/for-next (6888c1e85f5d gfs2: Remove gfs2_aspace_writepage())
Merging jfs/jfs-next (2b59ffad47db jfs: Fix uninit-value access of new_ea i=
n ea_buffer)
Merging ksmbd/ksmbd-for-next (8bb04fb2b7e3 ksmbd: Replace one-element array=
s with flexible-array members)
Merging nfs/linux-next (67784a74e258 Merge tag 'ata-6.11-rc7' of git://git.=
kernel.org/pub/scm/linux/kernel/git/libata/linux)
Merging nfs-anna/linux-next (070602488190 nfs: add 'noalignwrite' option fo=
r lock-less 'lost writes' prevention)
Merging nfsd/nfsd-next (509abfc7a0ba xdrgen: Prevent reordering of encoder =
and decoder functions)
Merging ntfs3/master (689ecd06ef8d fs/ntfs3: Rename ntfs3_setattr into ntfs=
_setattr)
Merging orangefs/for-next (96319dacaf15 orangefs: Constify struct kobj_type)
Merging overlayfs/overlayfs-next (6c4a5f964504 ovl: fail if trusted xattrs =
are needed but caller lacks permission)
Merging ubifs/next (92a286e90203 ubi: Fix ubi_init() ubiblock_exit() sectio=
n mismatch)
Merging v9fs/9p-next (79efebae4afc 9p: Avoid creating multiple slab caches =
with the same name)
Merging v9fs-ericvh/ericvh/for-next (0c3836482481 Linux 6.10)
Merging xfs/for-next (90fa22da6d6b xfs: ensure st_blocks never goes to zero=
 during COW writes)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging file-locks/locks-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6-=
mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging iversion/iversion-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6=
-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging vfs-brauner/vfs.all (c72f8f06a2e8 Merge branch 'vfs.procfs' into vf=
s.all Signed-off-by: Christian Brauner <brauner@kernel.org>)
CONFLICT (content): Merge conflict in fs/btrfs/super.c
CONFLICT (content): Merge conflict in fs/ext4/super.c
CONFLICT (content): Merge conflict in fs/xfs/xfs_super.c
CONFLICT (content): Merge conflict in include/linux/fs.h
Merging vfs/for-next (de12c3391bce add struct fd constructors, get rid of _=
_to_fd())
CONFLICT (content): Merge conflict in fs/coda/inode.c
Applying: fixe up for "introduce fd_file(), convert all accessors to it."
Applying: fix up 3 for "introduce fd_file(), convert all accessors to it."
Merging mm-hotfixes/mm-hotfixes-unstable (5db0ec44c9b0 mm-hugetlb-simplify-=
refs-in-memfd_alloc_folio-v2)
Merging fs-current (0a0935f18a7d Merge branch 'fixes' of git://git.kernel.o=
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
Merging m68k-current/for-linus (b90fae5df917 m68k: defconfig: Update defcon=
figs for v6.11-rc1)
Merging powerpc-fixes/fixes (3af2e2f68cc6 powerpc/pseries/eeh: move pseries=
_eeh_err_inject() outside CONFIG_DEBUG_FS block)
Merging s390-fixes/fixes (1642285e511c s390/boot: Fix KASLR base offset off=
 by __START_KERNEL bytes)
Merging net/main (7ebf44c91069 MAINTAINERS: adjust file entry of the oa_tc6=
 header)
Merging bpf/master (b831f83e40a2 Merge tag 'bpf-6.11-rc7' of git://git.kern=
el.org/pub/scm/linux/kernel/git/bpf/bpf)
Merging ipsec/master (9b0874286768 Merge branch 'mctp-serial-tx-escapes')
Merging netfilter/main (b5109b60ee4f net: seeq: Fix use after free vulnerab=
ility in ether3 Driver Due to Race Condition)
Merging ipvs/main (031ae72825ce ila: call nf_unregister_net_hooks() sooner)
Merging wireless/for-next (d4cdc46ca16a wifi: iwlegacy: Fix "field-spanning=
 write" warning in il_enqueue_hcmd())
Merging ath/for-current (2f833e8948d6 Revert "wifi: ath11k: support hiberna=
tion")
Merging wpan/master (addf89774e48 ieee802154: Fix build error)
Merging rdma-fixes/for-rc (8400291e289e Linux 6.11-rc1)
Merging sound-current/for-linus (bf36793fa260 ALSA: Drop explicit initializ=
ation of struct i2c_device_id::driver_data to 0)
Merging sound-asoc-fixes/for-linus (36fad1157372 Merge remote-tracking bran=
ch 'asoc/for-6.11' into asoc-linus)
Merging regmap-fixes/for-linus (10a650193899 Merge remote-tracking branch '=
regmap/for-6.10' into regmap-linus)
Merging regulator-fixes/for-linus (1a5caec7f80c regulator: core: Stub devm_=
regulator_bulk_get_const() if !CONFIG_REGULATOR)
Merging spi-fixes/for-linus (55f79eb7b89e Merge remote-tracking branch 'spi=
/for-6.11' into spi-linus)
Merging pci-current/for-linus (fc8c818e7569 PCI: Fix potential deadlock in =
pcim_intx())
Merging driver-core.current/driver-core-linus (47ac09b91bef Linux 6.11-rc4)
Merging tty.current/tty-linus (47ac09b91bef Linux 6.11-rc4)
Merging usb.current/usb-linus (da3ea35007d0 Linux 6.11-rc7)
Merging usb-serial-fixes/usb-linus (7d47d22444bb USB: serial: pl2303: add d=
evice id for Macrosilicon MS3020)
Merging phy/fixes (431c1646e1f8 Linux 6.11-rc6)
Merging staging.current/staging-linus (8400291e289e Linux 6.11-rc1)
Merging iio-fixes/fixes-togreg (979f93ded950 iio: light: opt3001: add missi=
ng full-scale range value)
Merging counter-current/counter-current (8400291e289e Linux 6.11-rc1)
Merging char-misc.current/char-misc-linus (da3ea35007d0 Linux 6.11-rc7)
Merging soundwire-fixes/fixes (233a95fd574f soundwire: stream: Revert "soun=
dwire: stream: fix programming slave ports for non-continous port maps")
Merging thunderbolt-fixes/fixes (98f7e32f20d2 Linux 6.11)
Merging input-current/for-linus (b2142a22ef22 Input: hynitron_cstxxx - drop=
 explicit initialization of struct i2c_device_id::driver_data to 0)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/pow=
er/wakeup-source.txt
Merging crypto-current/master (44ac4625ea00 crypto: powerpc/p10-aes-gcm - D=
isable CRYPTO_AES_GCM_P10)
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
Merging hwmon-fixes/hwmon (6d30ed0b1c5a hwmon: intel-m10-bmc-hwmon: relabel=
 Columbiaville to CVL Die Temperature)
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
Merging drm-fixes/drm-fixes (135be1dc46c6 Merge tag 'drm-xe-fixes-2024-09-1=
2' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (98f7e32f20d2 Linux 6.11)
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
Merging perf-current/perf-tools (de5cb0dcb74c Merge branch 'address-masking=
')
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
Merging i2c-host-fixes/i2c/i2c-host-fixes (68414d4ca87b i2c: synquacer: Dea=
l with optional PCLK correctly)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (a4d89b11aca3 clk: qcom: clk-alpha-pll: Simplif=
y the zonda_pll_adjust_l_val())
Merging pwrseq-fixes/pwrseq/for-current (431c1646e1f8 Linux 6.11-rc6)
Merging thead-dt-fixes/thead-dt-fixes (8400291e289e Linux 6.11-rc1)
Merging drm-misc-fixes/for-linux-next-fixes (d92b90f9a54d drm/vboxvideo: Re=
place fake VLA at end of vbva_mouse_pointer_shape with real VLA)
Merging mm-stable/mm-stable (684826f8271a zram: free secondary algorithms n=
ames)
Merging mm-nonmm-stable/mm-nonmm-stable (5e06e08939df list: test: increase =
coverage of list_test_list_replace*())
Merging kbuild/for-next (3c705c801939 kbuild: doc: remove outdated descript=
ion of the limitation on -I usage)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (1de5b5dcb835 perf trace: Mark the 'head' arg =
in the set_robust_list syscall as coming from user space)
Merging compiler-attributes/compiler-attributes (8400291e289e Linux 6.11-rc=
1)
Merging dma-mapping/for-next (72f58a38c5bc dma-mapping: report unlimited DM=
A addressing in IOMMU DMA path)
Merging asm-generic/master (b82c1d235a30 syscalls: add back legacy __NR_nfs=
servctl macro)
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (9016915e3c5f Merge branches 'amba', 'fixes' and 'misc=
' into for-next)
Merging arm64/for-next/core (75078ba2b38a Merge branch 'for-next/timers' in=
to for-next/core)
Merging arm-perf/for-next/perf (7c626ce4bae1 Linux 6.11-rc3)
Merging arm-soc/for-next (7c590fea8c11 soc: document merges)
CONFLICT (modify/delete): arch/arm/mach-ep93xx/vision_ep9307.c deleted in a=
rm-soc/for-next and modified in HEAD.  Version HEAD of arch/arm/mach-ep93xx=
/vision_ep9307.c left in tree.
CONFLICT (modify/delete): sound/soc/cirrus/edb93xx.c deleted in arm-soc/for=
-next and modified in HEAD.  Version HEAD of sound/soc/cirrus/edb93xx.c lef=
t in tree.
$ git rm -f sound/soc/cirrus/edb93xx.c arch/arm/mach-ep93xx/vision_ep9307.c
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
Merging clk/clk-next (f00b45db02ae clk: Switch back to struct platform_driv=
er::remove())
Merging clk-imx/for-next (32c055ef563c clk: imx6ul: fix clock parent for IM=
X6UL_CLK_ENETx_REF_SEL)
Merging clk-renesas/renesas-clk (3aeccbe08171 clk: renesas: r9a09g057: Add =
clock and reset entries for GTM/RIIC/SDHI/WDT)
Merging csky/linux-next (2c40c1c6adab Merge tag 'usb-6.7-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging loongarch/loongarch-next (6f6f567ee081 Docs/LoongArch: Add advanced=
 extended IRQ model description)
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
Merging parisc-hd/for-next (98f7e32f20d2 Linux 6.11)
Merging powerpc/next (3a7101e9b27f Merge tag 'powerpc-6.12-1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging risc-v/for-next (583543760976 Merge patch series "riscv: Improve KA=
SAN coverage to fix unit tests")
CONFLICT (content): Merge conflict in arch/riscv/include/asm/irq.h
CONFLICT (content): Merge conflict in tools/testing/selftests/riscv/mm/mmap=
_test.h
Merging riscv-dt/riscv-dt-for-next (8400291e289e Linux 6.11-rc1)
Merging riscv-soc/riscv-soc-for-next (8400291e289e Linux 6.11-rc1)
Merging s390/for-next (e84a8303f1ba Merge branch 'features' into for-next)
Merging sh/for-next (8fe76a1c2264 sh: push-switch: Add missing MODULE_DESCR=
IPTION() macro)
Merging sparc/for-next (d21dffe51baa arch/sparc: remove unused varible padd=
rbase in function leon_swprobe())
Merging uml/next (381d2f95c8aa um: fix time-travel syscall scheduling hack)
Merging xtensa/xtensa-for-next (b7cf2a1d9881 xtensa: remove redundant flush=
_dcache_page and ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE macros)
Merging fs-next (b4fbaf0b3e3e Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (b794563ea12f Merge branch 'for-6.11-fixup' into fo=
r-next)
Merging pci/next (9706513e56af Merge branch 'pci/tools')
Merging pstore/for-next/pstore (1bf8012fc699 pstore: replace spinlock_t by =
raw_spinlock_t)
Merging hid/for-next (183650fd5428 Merge branch 'for-6.12/cp2112' into for-=
next)
Merging i2c/i2c/for-next (f69a9516e557 Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i2c-host/i2c/i2c-host (f56f4ba2fc1d i2c: designware: Use pci_get_dr=
vdata())
Merging i3c/i3c/next (618507257797 i3c: master: svc: Fix use after free vul=
nerability in svc_i3c_master Driver Due to Race Condition)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (2cb4acf2140b hwmon: Remove devm_hwmon_dev=
ice_unregister() API function)
Merging jc_docs/docs-next (052f172ef127 Merge branch 'docs-mw' into docs-ne=
xt)
Merging v4l-dvb/master (3f52e32445a1 media: MAINTAINERS: Add "qcom," substr=
ing for Qualcomm Camera Subsystem)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (1e39c60d14b8 Merge branch 'pm-sleep' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (6b612d1bac67 cpufreq: ti-cpufre=
q: Use socinfo to get revision in AM62 family)
Merging cpupower/cpupower (313312c84b42 pm: cpupower: rename raw_pylibcpupo=
wer.i)
Merging devfreq/devfreq-next (d47552124bb0 PM / devfreq: imx-bus: Use of_pr=
operty_present())
Merging pmdomain/next (c6ccb691d484 pmdomain: core: Reduce debug summary ta=
ble width)
Merging opp/opp/linux-next (a84372012e93 dt-bindings: opp: operating-points=
-v2-ti-cpu: Update maintainers)
Merging thermal/thermal/linux-next (7d8abc5f3b5c thermal/drivers/imx_sc_the=
rmal: Use dev_err_probe)
Merging rdma/for-next (709209419233 RDMA/bnxt_re: Remove the unused variabl=
e en_dev)
CONFLICT (content): Merge conflict in include/linux/mlx5/mlx5_ifc.h
Merging net-next/main (151ac45348af net: sparx5: Fix invalid timestamps)
Merging bpf-next/for-next (aa7e60b62ee2 Merge branch 'bpf-next/master' into=
 for-next)
Merging ipsec-next/master (e62d39332d4b xfrm: policy: Restore dir assignmen=
ts in xfrm_hash_rebuild())
Merging mlx5-next/mlx5-next (c772a2c69018 net/mlx5: Add IFC related stuff f=
or data direct)
Merging netfilter-next/main (9410645520e9 Merge tag 'net-next-6.12' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging ipvs-next/main (4201f3938914 netfilter: nf_tables: set element time=
out update support)
Merging bluetooth/master (eb3ad76a07b6 Bluetooth: MGMT: Fix possible crash =
on mgmt_index_removed)
Merging wireless-next/for-next (fe57beb026ef Merge tag 'ath-next-20240909' =
of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath)
Merging ath-next/for-next (fe57beb026ef Merge tag 'ath-next-20240909' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/ath/ath)
Merging wpan-next/master (ace2b5331355 net: ieee802154: mcr20a: Use IRQF_NO=
_AUTOEN flag in request_irq())
Merging wpan-staging/staging (ace2b5331355 net: ieee802154: mcr20a: Use IRQ=
F_NO_AUTOEN flag in request_irq())
Merging mtd/mtd/next (869acb874f2b Merge tag 'nand/for-6.12' into mtd/next)
Merging nand/nand/next (475aadeba5df mtd: spinand: macronix: Flag parts nee=
ding explicit plane select)
Merging spi-nor/spi-nor/next (ac5bfa968b60 mtd: spi-nor: fix flash probing)
Merging crypto/master (ce212d2afca4 crypto: n2 - Set err to EINVAL if snpri=
ntf fails for hmac)
Merging drm/drm-next (ae2c6d8b3b88 Merge tag 'drm-xe-next-fixes-2024-09-12'=
 of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging drm-exynos/for-linux-next (94ebc3d3235c drivers:drm:exynos_drm_gsc:=
Fix wrong assignment in gsc_bind())
Merging drm-misc/for-linux-next (ba2b9de0c1ac drm/tegra: fix potential unin=
itialized variable use)
Merging amdgpu/drm-next (84f76408abe9 drm/amdgpu/mes12: reduce timeout)
Merging drm-intel/for-linux-next (ec2231b8dd2d drm/i915/dp: Fix AUX IO powe=
r enabling for eDP PSR)
Merging drm-msm/msm-next (15302579373e drm/msm/dpu: enable writeback on SM6=
350)
Merging drm-msm-lumag/msm-next-lumag (15302579373e drm/msm/dpu: enable writ=
eback on SM6350)
Merging drm-xe/drm-xe-next (35667a033061 drm/xe/pciid: Add new PCI id for A=
RL)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_drm_client.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_oa.c
Applying: fix up for "lib/string_choices: Add str_up_down() helper"
Merging etnaviv/etnaviv/next (704d3d60fec4 drm/etnaviv: don't block schedul=
er when GPU is still active)
Merging fbdev/for-next (98f7e32f20d2 Linux 6.11)
Merging regmap/for-next (7da49f45bf04 Merge remote-tracking branch 'regmap/=
for-6.12' into regmap-next)
Merging sound/for-next (bf36793fa260 ALSA: Drop explicit initialization of =
struct i2c_device_id::driver_data to 0)
Merging ieee1394/for-next (f1cba5212e25 firewire: core: rename cause flag o=
f tracepoints event)
Merging sound-asoc/for-next (36fad1157372 Merge remote-tracking branch 'aso=
c/for-6.11' into asoc-linus)
Merging modules/modules-next (b319cea80539 module: Refine kmemleak scanned =
areas)
Merging input/next (55bef83509f0 Input: Convert comma to semicolon)
Merging block/for-next (62a4e13bf4cd Merge branch 'for-6.12/io_uring' into =
for-next)
Merging device-mapper/for-next (9bcd92395207 dm vdo indexer: Convert comma =
to semicolon)
Merging libata/for-next (e5dd410acb34 ata: libata: Clear DID_TIME_OUT for A=
TA PT commands with sense data)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (cd3689b6772f mmc: core: Use dev_err_probe for deferred re=
gulators)
Merging mfd/for-mfd-next (d7548a14ed7c mfd: atc260x: Convert a bunch of com=
mas to semicolons)
Merging backlight/for-backlight-next (fea88a13a5d1 backlight: l4f00242t03: =
Add check for spi_setup)
Merging battery/for-next (e50a57d16f89 power: supply: hwmon: Fix missing te=
mp1_max_alarm attribute)
Merging regulator/for-next (88df17649d5a Merge remote-tracking branch 'regu=
lator/for-6.12' into regulator-next)
Merging security/next (8a23c9e1ba46 selinux,smack: properly reference the L=
SM blob in security_watch_key())
Merging apparmor/apparmor-next (8400291e289e Linux 6.11-rc1)
Merging integrity/next-integrity (fa8a4ce432e8 ima: fix buffer overrun in i=
ma_eventdigest_init_common)
Merging selinux/next (83f8b733c9b7 Automated merge of 'dev' into 'next')
Merging smack/next (2749749afa07 smackfs: Use rcu_assign_pointer() to ensur=
e safe assignment in smk_set_cipso)
Merging tomoyo/master (dc1c8034e31b minmax: simplify min()/max()/clamp() im=
plementation)
Merging tpmdd/next (558bdc45dfb2 sign-file,extract-cert: use pkcs11 provide=
r for OPENSSL MAJOR >=3D 3)
Merging watchdog/master (134d2531ef82 watchdog: Convert comma to semicolon)
Merging iommu/next (97162f6093d2 Merge branches 'fixes', 'arm/smmu', 'intel=
/vt-d', 'amd/amd-vi' and 'core' into next)
Merging audit/next (8c1867a2f0fd audit: Make use of str_enabled_disabled() =
helper)
Merging devicetree/for-next (0c36680c0e2d dt-bindings: watchdog: Add rockch=
ip,rk3576-wdt compatible)
Merging dt-krzk/for-next (08fd3b6e0df4 Merge branch 'next/dt64' into for-ne=
xt)
Merging mailbox/for-next (5232544ea368 dt-bindings: mailbox: qcom-ipcc: Doc=
ument QCS8300 IPCC)
Merging spi/for-next (55f79eb7b89e Merge remote-tracking branch 'spi/for-6.=
11' into spi-linus)
Merging tip/master (6d3e8e28e20d Merge branch into tip/master: 'x86/splitlo=
ck')
Merging clockevents/timers/drivers/next (d7a87891e2f5 platform/x86:intel/pm=
c: fix build regression with pmtimer turned off)
Merging edac/edac-for-next (61124f42dcaa Merge ras/edac-drivers into for-ne=
xt)
Merging ftrace/for-next (ba807122956a Merge ring-buffer/for-next)
Merging rcu/next (355debb83bf7 Merge branches 'context_tracking.15.08.24a',=
 'csd.lock.15.08.24a', 'nocb.09.09.24a', 'rcutorture.14.08.24a', 'rcustall.=
09.09.24a', 'srcu.12.08.24a', 'rcu.tasks.14.08.24a', 'rcu_scaling_tests.15.=
08.24a', 'fixes.12.08.24a' and 'misc.11.08.24a' into next.09.09.24a)
Merging paulmck/non-rcu/next (3b27dde7b75d Merge branches 'cmpxchg.2024.09.=
13a', 'lkmm.2024.09.14a', 'kcsan.2024.08.01a' and 'misc.2024.08.02a' into H=
EAD)
Merging kvm/next (3f8df6285271 Merge tag 'kvm-x86-vmx-6.12' of https://gith=
ub.com/kvm-x86/linux into HEAD)
Merging kvm-arm/next (17a000564499 Merge branch kvm-arm64/visibility-cleanu=
ps into kvmarm-master/next)
Merging kvms390/next (f9b56b2c31e5 s390: Enable KVM_S390_UCONTROL config in=
 debug_defconfig)
Merging kvm-ppc/topic/ppc-kvm (3a7101e9b27f Merge tag 'powerpc-6.12-1' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging kvm-riscv/riscv_kvm_next (5aa09297a3dc RISC-V: KVM: Fix to allow hp=
mcounter31 from the guest)
Merging kvm-x86/next (3cc25d5adcfd Merge branches 'fixes', 'generic', 'misc=
', 'mmu', 'pat_vmx_msrs', 'selftests', 'svm' and 'vmx')
Merging xen-tip/linux-next (c3dea3d54f4d xen/swiotlb: fix allocated size)
Merging percpu/for-next (79125d57644c Merge branch 'for-6.12' into for-next)
Merging workqueues/for-next (90c6d73ac19d Merge branch 'for-6.11-fixes' int=
o for-next)
Merging sched-ext/for-next (902d67a2d40f sched: Move update_other_load_avgs=
() to kernel/sched/pelt.c)
Merging drivers-x86/for-next (837acb691c84 MAINTAINERS: adjust file entry i=
n INTEL MID PLATFORM)
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
Merging driver-core/driver-core-next (4f2c346e6216 driver core: fix async d=
evice shutdown hang)
Merging usb/usb-next (68d4209158f4 sub: cdns3: Use predefined PCI vendor ID=
 constant)
Merging thunderbolt/next (10904df3f20c thunderbolt: Improve software receiv=
er lane margining)
Merging usb-serial/usb-next (4c0d9477ba69 USB: serial: kobil_sct: restore i=
nitial terminal settings)
Merging tty/tty-next (5ed771f17472 tty: serial: samsung: Fix serial rx on A=
pple A7-A9)
Merging char-misc/char-misc-next (0cf7befa3ea2 greybus: gb-beagleplay: Add =
firmware upload API)
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
Merging staging/staging-next (b4fdf9b1cd8b staging: vt6655: Rename variable=
 apTD1Rings)
Merging counter-next/counter-next (0d0f611bdf8e counter: ftm-quaddec: Enabl=
e module autoloading)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (5be63fc19fca Linux 6.11-rc5)
Merging dmaengine/next (e0bee4bcdc32 dmaengine: loongson1-apb-dma: Fix the =
build warning caused by the size of pdev_irqname)
Merging cgroup/for-next (df57390127a2 Merge branch 'for-6.12' into for-next)
Merging scsi/for-next (5fe9a493006d Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (359aeb86480d Merge patch series "Update lpfc to =
revision 14.4.0.5")
Merging vhost/linux-next (1bc6f4910ae9 vsock/virtio: avoid queuing packets =
when intermediate queue is empty)
Merging rpmsg/for-next (752ce45a66ec Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (6b5e97c02006 gpio: mpc8xxx: switch to usin=
g DEFINE_RUNTIME_DEV_PM_OPS())
Merging gpio-intel/for-next (8400291e289e Linux 6.11-rc1)
Merging pinctrl/for-next (b8b23101552d Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in drivers/pinctrl/Makefile
Merging pinctrl-intel/for-next (1652e95b17d5 pinctrl: intel: Constify struc=
t intel_pinctrl parameter)
Merging pinctrl-renesas/renesas-pinctrl (1325820dd085 pinctrl: renesas: rzg=
2l: Move pinconf_to_config_argument() call outside of switch cases)
Merging pinctrl-samsung/for-next (39dbbd4e6778 pinctrl: samsung: Use kmemdu=
p_array instead of kmemdup for multiple allocation)
Merging pwm/pwm/for-next (d242feaf81d6 pwm: stm32: Fix a typo)
Merging ktest/for-next (2351e8c65404 ktest.pl: Avoid false positives with g=
rub2 skip regex)
Merging kselftest/next (a0474b8d5974 selftests: kselftest: Use strerror() o=
n nolibc)
Merging kunit/test (8400291e289e Linux 6.11-rc1)
Merging kunit-next/kunit (7fcc9b53216c lib/math: Add int_pow test suite)
Merging livepatching/for-next (9fbf78b6d6ce Merge branch 'for-6.12/trivial'=
 into for-next)
Merging rtc/rtc-next (690286214916 rtc: rc5t619: use proper module tables)
Merging nvdimm/libnvdimm-for-next (447b167bb60d nvdimm: Remove dead code fo=
r ENODEV checking in scan_labels())
Merging at24/at24/for-next (36e071d2a152 dt-bindings: eeprom: at24: Add com=
patible for Giantec GT24C04A)
Merging ntb/ntb-next (061a785a114f ntb: Force physically contiguous allocat=
ion of rx ring buffers)
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
CONFLICT (content): Merge conflict in tools/include/linux/linkage.h
CONFLICT (rename/delete): tools/testing/radix-tree/linux/init.h renamed to =
tools/testing/shared/linux/init.h in HEAD, but deleted in memblock/for-next.
$ git rm -f tools/testing/shared/linux/init.h
Merging cxl/next (43cb008f857f cxl: Add documentation to explain the shared=
 link bandwidth calculation)
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (04736f7d1945 efi: Remove redundant null pointer checks in=
 efi_debugfs_init())
Merging unicode/for-next (156bb2c569cd unicode: Fix utf8_load() error path)
Merging slab/slab/for-next (ecc4d6af979b Merge branch 'slab/for-6.12/kmem_c=
ache_args' into slab/for-next)
Merging random/master (456552f8e150 LoongArch: vDSO: Tune chacha implementa=
tion)
Merging landlock/next (1ca980815e1f landlock: Document LANDLOCK_SCOPE_SIGNA=
L)
Merging rust/rust-next (a2f115470520 kasan: rust: Add KASAN smoke test via =
UAF)
CONFLICT (content): Merge conflict in rust/Makefile
CONFLICT (content): Merge conflict in rust/kernel/lib.rs
CONFLICT (content): Merge conflict in scripts/Makefile.kasan
Merging sysctl/sysctl-next (732b47db1d6c MAINTAINERS: update email for Joel=
 Granados)
Merging execve/for-next/execve (44f65d900698 binfmt_elf: mseal address zero)
Merging bitmap/bitmap-for-next (d7bcc37436c7 lib/test_bits.c: Add tests for=
 GENMASK_U128())
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (c00ac1f9fd7b Merge branches 'for-linus/hardenin=
g' and 'for-next/hardening' into for-next/kspp)
Merging kspp-gustavo/for-next/kspp (6613476e225e Linux 6.8-rc1)
Merging nolibc/nolibc (248f6b935bbd Merge tag 'nolibc-20240824-for-6.12-1' =
of https://git.kernel.org/pub/scm/linux/kernel/git/nolibc/linux-nolibc into=
 nolibc)
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (79805c1bbbf9 iommu: Set iommu_attach_handle->doma=
in in core)
CONFLICT (content): Merge conflict in drivers/iommu/iommufd/selftest.c
Merging turbostat/next (a119348cb685 tools/power turbostat: Honor --show CP=
U, even when even when num_cpus=3D1)
Merging pwrseq/pwrseq/for-next (8b7e0a6c443e Documentation: add a driver AP=
I doc for the power sequencing subsystem)
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)

--Sig_/gRyFCLySdCSzCv+2ZX4KOY6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbw6w0ACgkQAVBC80lX
0GxoJQf/cAMq1+HKV7y46avkXZ4lzBSMqU80KO9HlT1ZifZHkov6oD+RkKpr9Nga
a1SmuvuJiXeF4YDLrc1Ynq0cGTLoPtH/QHLXlZD9rs7YpGAugVQ5+6wT58FsRdIp
XeMKr4pcSapuCbqJSma7Z7ux8EYxvPS+TADR05EPeysiOZBwL6x0yevA/XuFGbvi
7JkZhQmqfcxIZGQZ2bUYgFv25G9i3Df7MUForYCpHYwVl5cpLvLa1RBRq/ev6Adk
1CC8J7wszjaTMsbvMO8JrKxIDqPRl4GTl8k76whrl0jNQkLvaypofeq2vgo6fzOq
cJeSSGSsasEv//FgcbUBGspj33im/A==
=S4Jn
-----END PGP SIGNATURE-----

--Sig_/gRyFCLySdCSzCv+2ZX4KOY6--

