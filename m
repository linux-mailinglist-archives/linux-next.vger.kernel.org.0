Return-Path: <linux-next+bounces-5608-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1045FA492C7
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 09:04:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7827C3B942D
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 08:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656EB1C5F25;
	Fri, 28 Feb 2025 08:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PlEeeujw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C9D1C3C06;
	Fri, 28 Feb 2025 08:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740729666; cv=none; b=ZoHnGOYSwHhUrCkXCxkb31qVvuHfd/iNEAcNc9bAwPmoigYq28NT8fvi8joq+dQB+NiEvLwLIQbJej3TnEzwDYf1tyuuIZip0fnwp+P2/TqsiiTiOk2mGee4Px8t3Pq8GuD6z4673PvosdYHZaSwdsfypXNj+AXUQg/3SCphX3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740729666; c=relaxed/simple;
	bh=3SfKCxSF5dzGKZJrnk8vXDr9QRAD1f0nWgeyl1xkHlY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rsI9bOOmmlxa2YdqAi71kW1F9k4VuatPYHkc1DS1s62546Ohzee2n2Ftua5w5lVnOBSrKkmxMBVddpzJpcw7vh4V31M5liyy2tmmMvY9dlFkYqkVtxXRxAn0CiuyQ5sEEzPHTsj0284u2kF52JNrNTkd/xc/B5u+6KZTGT8Rkuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PlEeeujw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740729660;
	bh=tPHsyGCoDXHcQOg4WSYyQsTkHPTNGxBhxT7egfWRFMM=;
	h=Date:From:To:Cc:Subject:From;
	b=PlEeeujw25/GzgsjEGZDFO44uQ+HzGARiv282+FC+MEQfhsYymkiRd+NyRSDRqltx
	 mKJ4nVmZnXC4axDOWQNaZ0OgNWBwtWzBrptjFiVFSMiu4wyXsOKFJZoCTuibusFp64
	 RPaMLNLrxK/3u7XwQnTOYjASXB3f27kWxnGky37NAeMX0q4wTga/CEr9bTb9fg2u1q
	 nbqQl0AkQHWdStzBZEUzy2jN0EJaX1Ukmj5nmG6kEUEEFmePF9Hb29bCgkxg8gRl5Z
	 5QHl9WoqkiRbR289WwPc5+uia7ZbW//l/6yqJ4GH5rxTuUAX5m1WnIMEfPzK8Bozrr
	 mk3UycN5jui/w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z40yN05TBz4wcQ;
	Fri, 28 Feb 2025 19:00:59 +1100 (AEDT)
Date: Fri, 28 Feb 2025 19:00:59 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 28
Message-ID: <20250228190059.5d2c863b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Jj4qvteHugwXDlUNv6JnrdS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Jj4qvteHugwXDlUNv6JnrdS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250227:

The bcachefs tree gained conflicts against Linus' tree.

The btrfs tree lost its build failure.

The vfs-brauner tree gained a conflict against the fuse tree.

The mm tree lost its build failure.

The net-next tree gained a conflict against the vfs-brauner tree.

The drm-xe tree gained a conflict against the drm tree.

The block tree gained a conflict against the net-next tree.

The tip tree gained a conflict against the net-next tree.

Non-merge commits (relative to Linus' tree): 6498
 7055 files changed, 357624 insertions(+), 135430 deletions(-)

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

I am currently merging 383 trees (counting Linus' and 147 trees of bug
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
Merging origin/master (1e15510b71c9 Merge tag 'net-6.14-rc5' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging fixes/fixes (fac04efc5c79 Linux 6.13-rc2)
Merging ext4-fixes/fixes (4bbf9020becb Linux 6.13-rc4)
Merging vfs-brauner-fixes/vfs.fixes (d082ecbc71e9 Linux 6.14-rc4)
Merging fscrypt-current/for-current (2014c95afece Linux 6.14-rc1)
Merging fsverity-current/for-current (2014c95afece Linux 6.14-rc1)
Merging btrfs-fixes/next-fixes (f844c6fcebba Merge branch 'misc-6.14' into =
next-fixes)
Merging vfs-fixes/fixes (60a600243244 hostfs: fix string handling in __dent=
ry_name())
Merging erofs-fixes/fixes (6422cde1b0d5 erofs: use buffered I/O for file-ba=
cked mounts by default)
Merging nfsd-fixes/nfsd-fixes (4990d098433d NFSD: Fix CB_GETATTR status fix)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (228a1157fb9f Merge tag '6.13-rc-part1-SM=
B3-client-fixes' of git://git.samba.org/sfrench/cifs-2.6)
Merging bcachefs/for-next (ab215af397f4 Documentation: bcachefs: Submitting=
Patches: Convert footnotes to reST syntax)
CONFLICT (content): Merge conflict in fs/bcachefs/dirent.h
CONFLICT (content): Merge conflict in fs/bcachefs/fs-common.c
CONFLICT (content): Merge conflict in fs/bcachefs/sb-downgrade.c
Applying: fix up for "bcachefs: fix directory i_size checking for the last =
entry"
Merging fscrypt/for-next (75eb8b9410ee Revert "fscrypt: relax Kconfig depen=
dencies for crypto API algorithms")
Merging btrfs/for-next (9e3da16f1ba0 Merge branch 'for-next-next-v6.14-2025=
0227' into for-next-20250227)
Merging ceph/master (3981be13ec1b ceph: exchange hardcoded value on NAME_MA=
X)
Merging cifs/for-next (44f49aa9ba0e smb: client: Fix netns refcount imbalan=
ce causing leaks and use-after-free)
Merging configfs/for-next (84147f4e84c4 configfs: improve item creation per=
formance)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (8e2bad543eca dlm: prevent NPD when writing a positive val=
ue to event_done)
Merging erofs/dev (0fb25a2943e1 erofs: clean up header parsing for ztailpac=
king and fragments)
Merging exfat/dev (223720ae647b exfat: add a check for invalid data size)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (a7624ccdef4f ext2: Make ext2_params_spec static)
Merging ext4/dev (9e28059d5664 ext4: introduce linear search for dentries)
Merging f2fs/dev (a907f3a68ee2 f2fs: add a sysfs entry to reclaim POSIX_FAD=
V_NOREUSE pages)
Merging fsverity/for-next (a19bcde49998 Revert "fsverity: relax build time =
dependency on CRYPTO_SHA256")
Merging fuse/for-next (150b838b03e8 fuse: optmize missing FUSE_LINK support)
Merging gfs2/for-next (1259f36ab395 gfs2: Fix additional unlikely request c=
ancelation race)
Merging jfs/jfs-next (0d250b1c5248 fs/jfs: consolidate sanity checking in d=
bMount)
Merging ksmbd/ksmbd-for-next (a7a8a72c7c30 ksmbd: Use str_read_write() and =
str_true_false() helpers)
Merging nfs/linux-next (0ad2507d5d93 Linux 6.14-rc3)
Merging nfs-anna/linux-next (9084ed79ddaa lsm,nfs: fix memory leak of lsm_c=
ontext)
Merging nfsd/nfsd-next (f194595b9bd7 nfsd: eliminate special handling of NF=
S4ERR_SEQ_MISORDERED)
Merging ntfs3/master (b432163ebd15 fs/ntfs3: Update inode->i_mapping->a_ops=
 on compression state)
Merging orangefs/for-next (96319dacaf15 orangefs: Constify struct kobj_type)
Merging overlayfs/overlayfs-next (c8b359dddb41 ovl: Filter invalid inodes w=
ith missing lookup function)
Merging ubifs/next (69146a8c893f ubi: ubi_get_ec_info: Fix compiling error =
'cast specifies array type')
Merging v9fs/9p-next (a22a29655c42 net/9p/fd: support ipv6 for trans=3Dtcp)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (9b47d37496e2 xfs: remove the XBF_STALE check from xfs=
_buf_rele_cached)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging vfs-brauner/vfs.all (f5dfc2545cf1 Merge branch 'vfs-6.15.mount.name=
space' into vfs.all)
CONFLICT (content): Merge conflict in fs/fuse/dir.c
Merging vfs/for-next (2e72b1e0aac2 Merge branch 'work.d_revalidate' into fo=
r-next)
Merging mm-hotfixes/mm-hotfixes-unstable (9d0c9477c863 mm: page_isolation: =
avoid calling folio_hstate() without hugetlb_lock)
Merging fs-current (bfd1f93966cb Merge branch 'next-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/kdave/linux.git)
Merging kbuild-current/fixes (b28fb1f2ef45 modpost: Fix a few typos in a co=
mment)
Merging arc-current/for-curr (78d4f34e2115 Linux 6.13-rc3)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (eed6bfa8b282 arm64: hugetlb: Fix flush_=
hugetlb_tlb_range() invalidation level)
Merging arm-soc-fixes/arm/fixes (e31e3f6c0ce4 soc: loongson: loongson2_guts=
: Add check for devm_kstrdup())
Merging davinci-current/davinci/for-current (2014c95afece Linux 6.14-rc1)
Merging drivers-memory-fixes/fixes (304e6c02b76f memory: omap-gpmc: drop no=
 compatible check)
Merging sophgo-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging m68k-current/for-linus (bb2e0fb1e6aa m68k: libgcc: Fix lvalue abuse=
 in umul_ppmm())
Merging powerpc-fixes/fixes (eff2eb592efd cxl: Fix cross-reference in docum=
entation and add deprecation warning)
Merging s390-fixes/fixes (c3a589fd9fcb s390/boot: Fix ESSA detection)
Merging net/main (1e15510b71c9 Merge tag 'net-6.14-rc5' of git://git.kernel=
.org/pub/scm/linux/kernel/git/netdev/net)
Merging bpf/master (319fc77f8f45 Merge tag 'bpf-fixes' of git://git.kernel.=
org/pub/scm/linux/kernel/git/bpf/bpf)
Merging ipsec/master (0aae2867aa60 xfrm_output: Force software GSO only in =
tunnel mode)
Merging netfilter/main (1438f5d07b9a rtnetlink: fix netns leak with rtnl_se=
tlink())
Merging ipvs/main (1438f5d07b9a rtnetlink: fix netns leak with rtnl_setlink=
())
Merging wireless/for-next (8c3170628a9c wifi: brcmfmac: keep power during s=
uspend if board requires it)
Merging ath/for-current (3640dbc1f75c wifi: iwlwifi: Fix A-MSDU TSO prepara=
tion)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (b66535356a48 RDMA/bnxt_re: Fix the page details =
for the srq created by kernel consumers)
Merging sound-current/for-linus (fe1544deda60 Merge tag 'asoc-fix-v6.14-rc4=
' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for=
-linus)
Merging sound-asoc-fixes/for-linus (9da0ed4a8502 ASoC: Intel: don't check n=
umber of sdw links when set)
Merging regmap-fixes/for-linus (32ffed055dce regmap-irq: Add missing kfree(=
))
Merging regulator-fixes/for-linus (d082ecbc71e9 Linux 6.14-rc4)
Merging spi-fixes/for-linus (3d7a20f9ba7b MAINTAINERS: add tambarus as R fo=
r Samsung SPI)
Merging pci-current/for-linus (2014c95afece Linux 6.14-rc1)
Merging driver-core.current/driver-core-linus (78eb41f518f4 drivers: core: =
fix device leak in __fw_devlink_relax_cycles())
Merging tty.current/tty-linus (0ad2507d5d93 Linux 6.14-rc3)
Merging usb.current/usb-linus (c133ec0e5717 usb: xhci: Enable the TRB overf=
etch quirk on VIA VL805)
Merging usb-serial-fixes/usb-linus (0ad2507d5d93 Linux 6.14-rc3)
Merging phy/fixes (55f1a5f7c97c phy: tegra: xusb: reset VBUS & ID OVERRIDE)
Merging staging.current/staging-linus (2014c95afece Linux 6.14-rc1)
Merging iio-fixes/fixes-togreg (cc2c3540d947 iio: filter: admv8818: Force i=
nitialization of SDO)
Merging counter-current/counter-current (2014c95afece Linux 6.14-rc1)
Merging char-misc.current/char-misc-linus (2397d61ee45c Revert "drivers/car=
d_reader/rtsx_usb: Restore interrupt based detection")
Merging soundwire-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging thunderbolt-fixes/fixes (d082ecbc71e9 Linux 6.14-rc4)
Merging input-current/for-linus (d85862ccca45 Input: i8042 - swap old quirk=
 combination with new quirk for more devices)
Merging crypto-current/master (9d4f8e54cef2 rhashtable: Fix rhashtable_try_=
insert test)
Merging vfio-fixes/for-linus (09dfc8a5f2ce vfio/pci: Fallback huge faults f=
or unaligned pfn)
Merging kselftest-fixes/fixes (a64dcfb451e2 Linux 6.14-rc2)
Merging dmaengine-fixes/fixes (e521f516716d dmaengine: Revert "dmaengine: q=
com: bam_dma: Avoid writing unavailable register")
CONFLICT (content): Merge conflict in drivers/dma/tegra210-adma.c
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (1dbf60277e9b Merge tag 'spi-nor/fixes-for-6.14=
-rc4' of https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux into mtd=
/fixes)
Merging mfd-fixes/for-mfd-fixes (68f860426d50 mfd: axp20x: AXP717: Fix miss=
ing IRQ status registers range)
Merging v4l-dvb-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging reset-fixes/reset/fixes (2014c95afece Linux 6.14-rc1)
Merging mips-fixes/mips-fixes (6d48ad040757 MIPS: Ignore relocs against __e=
x_table for relocatable kernel)
Merging at91-fixes/at91-fixes (2014c95afece Linux 6.14-rc1)
Merging omap-fixes/fixes (c2a5f8c4f28f ARM: OMAP1: select CONFIG_GENERIC_IR=
Q_CHIP)
Merging kvm-fixes/master (982caaa11504 KVM: nVMX: Process events on nested =
VM-Exit if injectable IRQ or NMI is pending)
Merging kvms390-fixes/master (e376d958871c KVM: s390: selftests: Add has de=
vice attr check to uc_attr_mem_limit selftest)
Merging hwmon-fixes/hwmon (5797c04400ee hwmon: (peci/dimmtemp) Do not provi=
de fake thresholds data)
Merging nvdimm-fixes/libnvdimm-fixes (265e98f72bac acpi: nfit: vmalloc-out-=
of-bounds Read in acpi_nfit_ctl)
Merging cxl-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging dma-mapping-fixes/for-linus (78b2770c935f dma-mapping: fix tracing =
dma_alloc/free with vmalloc'd memory)
Merging drivers-x86-fixes/fixes (b3e127dacad6 platform/x86: thinkpad_acpi: =
Fix registration of tpacpi platform driver)
Merging samsung-krzk-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging pinctrl-samsung-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging devicetree-fixes/dt/linus (75f1f311d883 Revert "of: reserved-memory=
: Fix using wrong number of cells to get property 'alignment'")
Merging dt-krzk-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging scsi-fixes/fixes (f27a95845b01 scsi: ufs: core: bsg: Fix crash when=
 arpmb command fails)
Merging drm-fixes/drm-fixes (d082ecbc71e9 Linux 6.14-rc4)
Merging drm-intel-fixes/for-linux-next-fixes (16fef33fdb1e drm/i915/dp_mst:=
 Fix encoder HW state readout for UHBR MST)
Merging mmc-fixes/fixes (3e68abf2b9ce mmc: mtk-sd: Fix register settings fo=
r hs400(es) mode)
Merging rtc-fixes/rtc-fixes (2014c95afece Linux 6.14-rc1)
Merging gnss-fixes/gnss-linus (0ad2507d5d93 Linux 6.14-rc3)
Merging hyperv-fixes/hyperv-fixes (7241c886a717 fbdev: hyperv_fb: iounmap()=
 the correct memory when removing a device)
Merging risc-v-fixes/fixes (245aece3750d MAINTAINERS: Add myself as a riscv=
 reviewer)
Merging riscv-dt-fixes/riscv-dt-fixes (1b133129ad6b riscv: dts: starfive: F=
ix a typo in StarFive JH7110 pin function definitions)
Merging riscv-soc-fixes/riscv-soc-fixes (2014c95afece Linux 6.14-rc1)
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (2014c95afece Linux 6.14-rc1)
Merging gpio-brgl-fixes/gpio/for-current (d082ecbc71e9 Linux 6.14-rc4)
Merging gpio-intel-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging pinctrl-intel-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging auxdisplay-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging kunit-fixes/kunit-fixes (a64dcfb451e2 Linux 6.14-rc2)
Merging memblock-fixes/fixes (180bbad69864 arch_numa: Restore nid checks be=
fore registering a memblock with a node)
Merging renesas-fixes/fixes (124f4f1a1869 MAINTAINERS: Re-add cancelled Ren=
esas driver sections)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging perf-current/perf-tools (42367eca7604 tools: Remove redundant quiet=
 setup)
Merging efi-fixes/urgent (e3cf2d91d058 efi/mokvar-table: Avoid repeated map=
/unmap of the same page)
Merging battery-fixes/fixes (98380110bd48 power: supply: axp20x_battery: Fi=
x fault handling for AXP717)
Merging iommufd-fixes/for-rc (2ca704f55e22 iommu/arm-smmu-v3: Improve uAPI =
comment for IOMMU_HW_INFO_TYPE_ARM_SMMUV3)
Merging rust-fixes/rust-fixes (0ad2507d5d93 Linux 6.14-rc3)
Merging w1-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging pmdomain-fixes/fixes (a64dcfb451e2 Linux 6.14-rc2)
Merging i2c-host-fixes/i2c/i2c-host-fixes (9f3c507cb444 i2c: amd-asf: Fix E=
OI register write to enable successive interrupts)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (b8501febdc51 clk: qcom: dispcc-sm8750: Drop in=
correct CLK_SET_RATE_PARENT on byte intf parent)
Merging pwrseq-fixes/pwrseq/for-current (2014c95afece Linux 6.14-rc1)
Merging thead-dt-fixes/thead-dt-fixes (40384c840ea1 Linux 6.13-rc1)
Merging ftrace-fixes/ftrace/fixes (2fa6a01345b5 tracing: Fix memory leak wh=
en reading set_event file)
Merging ring-buffer-fixes/ring-buffer/fixes (97937834ae87 ring-buffer: Upda=
te pages_touched to reflect persistent buffer content)
Merging trace-fixes/trace/fixes (60295b944ff6 tracing: gfp: Fix the GFP enu=
m values shown for user space tracing tools)
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging tip-fixes/tip/urgent (0b3b01adfd52 Merge branch into tip/master: 'x=
86/urgent')
Merging slab-fixes/slab/for-next-fixes (b7ffecbe198e memcg: slub: fix SUnre=
claim for post charged objects)
Merging drm-msm-fixes/msm-fixes (73f69c6be2a9 drm/msm/dsi/phy: Do not overw=
ite PHY_CMN_CLK_CFG1 when choosing bitclk source)
Merging uml-fixes/fixes (96178631c3f5 um: convert irq_lock to raw spinlock)
Merging drm-misc-fixes/for-linux-next-fixes (6b481ab0e685 drm/nouveau: sele=
ct FW caching)
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (0ad2507d5d93 Linux 6.14-rc3)
Merging mm-nonmm-stable/mm-nonmm-stable (0ad2507d5d93 Linux 6.14-rc3)
Merging mm/mm-everything (9eed361731be foo)
Merging kbuild/for-next (a77b570b6c3f modpost: use strstarts() to clean up =
parse_source_files())
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (c760174401f6 perf cpumap: Reduce cpu size fro=
m int to int16_t)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/for-next (aef7ee7649e0 dma-debug: fix physical address =
calculation for struct dma_debug_entry)
Merging asm-generic/master (55d422e4e5bf io.h: drop unused headers)
Merging alpha/alpha-next (1523226edda5 alpha: Use str_yes_no() helper in pc=
i_dac_dma_supported())
Merging arm/for-next (f520fab580c9 ARM: 9440/1: cacheinfo fix format field =
mask)
Merging arm64/for-next/core (a73e2d60c4f2 Merge branches 'for-next/amuv1-av=
g-freq', 'for-next/pkey_unrestricted' and 'for-next/sysreg' into for-next/c=
ore)
Merging arm-perf/for-next/perf (ba113ecad81a perf docs: arm_spe: Document n=
ew discard mode)
Merging arm-soc/for-next (e31e3f6c0ce4 soc: loongson: loongson2_guts: Add c=
heck for devm_kstrdup())
Merging amlogic/for-next (953913df9c3a Merge branch 'v6.15/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (88d0b0d9d2cb Merge branch 'asahi-soc/=
dt' into asahi-soc/for-next)
Merging aspeed/for-next (3540adcccc71 ARM: dts: aspeed: yosemite4: adjust s=
econdary flash name)
Merging at91/at91-next (22ae29e60958 Merge branch 'at91-dt' into at91-next)
Merging broadcom/next (bdac656f1bb5 Merge branch 'devicetree/fixes' into ne=
xt)
Merging davinci/davinci/for-next (58abc69e479c ARM: dts: ti: davinci: Align=
 GPIO hog name with bindings)
Merging drivers-memory/for-next (b9c791c65ced Merge branch 'mem-ctrl-next' =
into for-next)
Merging imx-mxs/for-next (a76206a60d15 Merge branch 'imx/dt64' into for-nex=
t)
Merging mediatek/for-next (725c4999ffae Merge branch 'v6.14-next/dts64' int=
o for-next)
Merging mvebu/for-next (960766b45fa2 arm64: dts: marvell: Add missing board=
 compatible for IEI-Puzzle-M801)
Merging omap/for-next (065f3bd4f22b Merge branch 'omap-for-v6.15/dt' into t=
mp/omap-next-20250205.163245)
Merging qcom/for-next (e1ea406aaa19 Merge branches 'arm64-defconfig-for-6.1=
5', 'arm64-for-6.15', 'clk-for-6.15', 'drivers-fixes-for-6.14' and 'drivers=
-for-6.15' into for-next)
Merging renesas/next (b91c46c79497 Merge branches 'renesas-arm-defconfig-fo=
r-v6.15', 'renesas-arm-soc-for-v6.15', 'renesas-drivers-for-v6.15', 'renesa=
s-dt-bindings-for-v6.15' and 'renesas-dts-for-v6.15' into renesas-next)
Merging reset/reset/next (2014c95afece Linux 6.14-rc1)
Merging rockchip/for-next (5a3c40f58c1d Merge branch 'v6.15-clk/next' into =
for-next)
Merging samsung-krzk/for-next (db9af58db84e Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (43bf1e550734 Merge branches 'for-next/scmi/upd=
ates', 'for-next/ffa/updates' and 'for-next/juno/updates' of ssh://gitolite=
.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-linux-next)
Merging sophgo/for-next (5277657d5383 riscv: dts: sophgo: sg2042: add pinct=
rl support)
Merging spacemit/for-next (5b90a3d6092d riscv: dts: spacemit: Add Milk-V Ju=
piter board device tree)
Merging stm32/stm32-next (1e494daa7e28 ARM: dts: stm32: add usr3 LED node t=
o stm32f769-disco)
Merging sunxi/sunxi/for-next (e2d0b639a4d9 Merge branch 'sunxi/clk-for-6.15=
' into sunxi/for-next)
Merging tee/next (a7562ff02879 Merge branch 'optee_for_v6.14' into next)
Merging tegra/for-next (0a891b9fcd9b Merge branch for-6.14/arm64/dt into fo=
r-next)
Merging thead-dt/thead-dt-for-next (c95c1362e5bc riscv: dts: thead: Add mai=
lbox node)
Merging ti/ti-next (2faa017a6679 Merge branches 'ti-drivers-soc-next' and '=
ti-k3-config-next' into ti-next)
Merging xilinx/for-next (d6ccf528cb3c Merge branch 'zynqmp/dt' into for-nex=
t)
Merging clk/clk-next (6329b51f1494 Merge branch 'clk-mediatek' into clk-nex=
t)
Merging clk-imx/for-next (48806be08636 clk: imx: Apply some clks only for i=
.MX93)
Merging clk-renesas/renesas-clk (9b12504e8c8c clk: renesas: r9a09g047: Add =
CANFD clocks and resets)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (3011b29ec5a3 LoongArch: KVM: Set host wit=
h kernel mode when switch to VM mode)
Merging m68k/for-next (723be3c6ab31 m68k: sun3: Fix DEBUG_MMU_EMU build)
Merging m68knommu/for-next (63014a9e119f m68k: mm: Replace deprecated strnc=
py() with strscpy())
Merging microblaze/next (920354d7818b microblaze: Use of_property_present()=
 for non-boolean properties)
Merging mips/mips-next (a547dc46e393 MIPS: dec: Remove dec_irq_dispatch())
Merging openrisc/for-next (ea1413e5b53a rseq/selftests: Add support for Ope=
nRISC)
Merging parisc-hd/for-next (4e3ff3c5854f parisc: Remove memcpy_fromio)
Merging powerpc/next (65acbd1285f7 arch/powerpc: Remove unused function icp=
_native_cause_ipi_rm())
Merging risc-v/for-next (2014c95afece Linux 6.14-rc1)
Merging riscv-dt/riscv-dt-for-next (38818f7c9c17 riscv: dts: starfive: jh71=
10-pine64-star64: enable USB 3.0 port)
Merging riscv-soc/riscv-soc-for-next (2014c95afece Linux 6.14-rc1)
Merging s390/for-next (aa6b9c1da333 Merge branch 'features' into for-next)
Merging sh/for-next (2014c95afece Linux 6.14-rc1)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (2d2b61ae38bd um: Remove unused asm/archparam.h header)
Merging xtensa/xtensa-for-next (dbef257ab7fa xtensa: ptrace: Remove zero-le=
ngth alignment array)
Merging fs-next (fe4271742d97 Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (9022df7f5e05 Merge branch 'for-6.14-cpu_sync-fixup=
' into for-next)
Merging pci/next (87bb63918281 Merge branch 'pci/misc')
Merging pstore/for-next/pstore (5674609535ba pstore: Change kmsg_bytes stor=
age size to u32)
Merging hid/for-next (8fabf47931ed Merge branch 'for-6.15/bpf' into for-nex=
t)
Merging i2c/i2c/for-next (ef8c53714894 Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i2c-host/i2c/i2c-host (ad50946dbf74 i2c: qup: Vote for interconnect=
 bandwidth to DRAM)
Merging i3c/i3c/next (a892ee4cf22a i3c: master: svc: Flush FIFO before send=
ing Dynamic Address Assignment(DAA))
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (8df0f002827e hwmon: (xgene-hwmon) use app=
ropriate type for the latency value)
Merging jc_docs/docs-next (76a6782284df Documentation: input: Add section p=
ertaining to polled input devices)
Merging v4l-dvb/next (d98e9213a768 media: visl: Fix ERANGE error when setti=
ng enum controls)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (a4ebfa7379c8 Merge branches 'pm-misc' and 'pm-sleep'=
 into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (f2d32942026c cpufreq: enable 12=
00Mhz clock speed for armada-37xx)
Merging cpupower/cpupower (80d3175a7e07 cpupower: monitor: Exit with error =
status if execvp() fail)
Merging devfreq/devfreq-next (f3253b23535f PM / devfreq: exynos: remove unu=
sed function parameter)
Merging pmdomain/next (36ccabe59dda pmdomain: Merge branch rockchip into ne=
xt)
Merging opp/opp/linux-next (2014c95afece Linux 6.14-rc1)
Merging thermal/thermal/linux-next (ecb642900deb dt-bindings: thermal: Corr=
ect indentation and style in DTS example)
Merging rdma/for-next (ba7fbaa6a83e RDMA/hfi1: Remove unused one_qsfp_write)
Merging net-next/main (5a41a00cd5d5 geneve, specs: Add port range to rt_lin=
k specification)
CONFLICT (content): Merge conflict in fs/eventpoll.c
Merging bpf-next/for-next (b70c222ea9d6 Merge branch 'bpf-next/master' into=
 for-next)
Merging ipsec-next/master (9d381c77087b Merge branch 'Support-PMTU-in-tunne=
l-mode-for-packet-offload')
Merging mlx5-next/mlx5-next (80df31f384b4 net/mlx5: Change POOL_NEXT_SIZE d=
efine value and make it global)
Merging netfilter-next/main (4e41231249f4 Merge branch '100GbE' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue)
Merging ipvs-next/main (4e41231249f4 Merge branch '100GbE' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/tnguy/next-queue)
Merging bluetooth/master (7c2203f91aff Bluetooth: btusb: Configure altsetti=
ng for HCI_USER_CHANNEL)
Merging wireless-next/for-next (95da92e7c6ff wifi: iwlwifi: add Debug Host =
Command APIs)
Merging ath-next/for-next (6f2d839d11b3 wifi: ath11k/ath12k: Replace irq_se=
t_affinity_hint() with irq_set_affinity_and_hint())
Merging wpan-next/master (3e5908172c05 Merge tag 'ieee802154-for-net-next-2=
025-01-03' of git://git.kernel.org/pub/scm/linux/kernel/git/wpan/wpan-next)
Merging wpan-staging/staging (3e5908172c05 Merge tag 'ieee802154-for-net-ne=
xt-2025-01-03' of git://git.kernel.org/pub/scm/linux/kernel/git/wpan/wpan-n=
ext)
Merging mtd/mtd/next (3f930a52d715 mtd: capture device name setting failure=
 when adding mtd)
Merging nand/nand/next (1db50b96b059 mtd: rawnand: qcom: finish converting =
register to FIELD_PREP)
Merging spi-nor/spi-nor/next (03e7bb864d9a mtd: spi-nor: use scope-based mu=
tex cleanup helpers)
Merging crypto/master (b9874a66e404 crypto: ahash - Set default reqsize fro=
m ahash_alg)
Merging drm/drm-next (33e26f3544a5 Merge tag 'drm-xe-next-2025-02-24' of ht=
tps://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging drm-exynos/for-linux-next (81a50378559b drm/exynos: Remove unnecess=
ary checking)
Merging drm-misc/for-linux-next (77f183d151bd drm/nouveau: Avoid multiple -=
Wflex-array-member-not-at-end warnings)
Merging amdgpu/drm-next (7d83c129a8d7 drm/amdgpu: Fix parameter annotation =
in vcn_v5_0_0_is_idle)
Merging drm-intel/for-linux-next (67093883808b drm/i915/dsb: Allow DSB base=
d commits when scalers are in use)
Merging drm-msm/msm-next (89839e69f615 drm/msm/dpu: rate limit snapshot cap=
ture for mmu faults)
Merging drm-msm-lumag/msm-next-lumag (89839e69f615 drm/msm/dpu: rate limit =
snapshot capture for mmu faults)
Merging drm-xe/drm-xe-next (89eb42b5539f drm/xe: xe_gen_wa_oob: replace pro=
gram_invocation_short_name)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/display/xe_display=
.c
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (c454bc716854 fbcon: Use correct erase colour for cl=
earing in fbcon)
Merging regmap/for-next (14b33926f576 Merge remote-tracking branch 'regmap/=
for-6.15' into regmap-next)
Merging sound/for-next (e747104c99fd ALSA: opti9xx: fix inconsistent indent=
ing warning in snd_opti9xx_configure())
Merging ieee1394/for-next (1c745720bec2 drivers: firewire: firewire-cdev.h:=
 fix identation on a kernel-doc markup)
Merging sound-asoc/for-next (13a3b6d6fd8b Merge remote-tracking branch 'aso=
c/for-6.15' into asoc-next)
Merging modules/modules-next (afa92869776a params: Annotate struct module_p=
aram_attrs with __counted_by())
Merging input/next (aed2626f465e dt-bindings: input: matrix_keypad - add mi=
ssing property)
Merging block/for-next (083ef6f70f9f Merge branch 'for-6.15/block' into for=
-next)
CONFLICT (content): Merge conflict in tools/testing/selftests/drivers/net/h=
w/Makefile
Merging device-mapper/for-next (e678900df264 dm vdo indexer: reorder uds_re=
quest to reduce padding)
Merging libata/for-next (91ec84f8eadd ata: libata-eh: Do not use ATAPI DMA =
for a device limited to PIO mode)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (cb71db3b2cea mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (6a8f122c5f07 dt-bindings: mfd: qcom,tcsr: Add com=
patible for MSM8937)
Merging backlight/for-backlight-next (d1ebaf003a06 MAINTAINERS: Add entries=
 for Apple DWI backlight controller)
Merging battery/for-next (76d5fb0e58d8 power: supply: sc27xx: use devm_kmem=
dup_array())
Merging regulator/for-next (312a78aed357 Merge remote-tracking branch 'regu=
lator/for-6.15' into regulator-next)
Merging security/next (9ec84f79c5a7 perf: Remove unnecessary parameter of s=
ecurity check)
Merging apparmor/apparmor-next (3e45553acb14 apparmor: Remove unused variab=
le 'sock' in __file_sock_perm())
Merging integrity/next-integrity (57a0ef02fefa ima: Reset IMA_NONACTION_RUL=
E_FLAGS after post_setattr)
Merging selinux/next (2c2b1e059792 selinux: add permission checks for loadi=
ng other kinds of kernel files)
Merging smack/next (a158a937d864 smack: recognize ipv4 CIPSO w/o categories)
Merging tomoyo/master (09fbf3d50205 Merge tag 'tomoyo-pr-20250211' of git:/=
/git.code.sf.net/p/tomoyo/tomoyo)
Merging tpmdd/next (34c26c5e1cb0 tpm: do not start chip while suspended)
Merging watchdog/master (0ad2507d5d93 Linux 6.14-rc3)
Merging iommu/next (1485fa1aadcd Merge branches 'apple/dart' and 's390' int=
o next)
Merging audit/next (2014c95afece Linux 6.14-rc1)
Merging devicetree/for-next (44d755c1d698 dt-bindings: display/lvds-codec: =
add ti,sn65lvds822)
CONFLICT (content): Merge conflict in drivers/of/of_private.h
Merging dt-krzk/for-next (854a080f0b73 loongarch: dts: remove non-existent =
DAC from 2k1000-ref)
Merging mailbox/for-next (4783ce32b080 riscv: export __cpuid_to_hartid_map)
Merging spi/for-next (b5dd1a44eea8 Merge remote-tracking branch 'spi/for-6.=
15' into spi-next)
Merging tip/master (0b8c04b9207d Merge branch into tip/master: 'x86/sev')
CONFLICT (content): Merge conflict in arch/riscv/include/asm/io.h
CONFLICT (content): Merge conflict in arch/x86/kernel/paravirt.c
CONFLICT (content): Merge conflict in arch/x86/mm/pgtable.c
CONFLICT (content): Merge conflict in net/core/dev.c
Merging clockevents/timers/drivers/next (fafc3058cc2f dt-bindings: timer: e=
xynos4210-mct: Add samsung,exynos990-mct compatible)
Merging edac/edac-for-next (5feb8bbca3c1 Merge ras/edac-cxl into for-next)
Merging ftrace/for-next (48f920100b69 Merge sorttable/for-next)
Merging rcu/next (c0ebc65aaa4b Merge branches 'docs.2025.02.04a', 'lazypree=
mpt.2025.02.24a', 'misc.2025.02.27a', 'srcu.2025.02.05a' and 'torture.2025.=
02.05a')
Merging paulmck/non-rcu/next (a2bfbf847c96 tools/memory-model: glossary.txt=
: Fix indents)
Merging kvm/next (982caaa11504 KVM: nVMX: Process events on nested VM-Exit =
if injectable IRQ or NMI is pending)
Merging kvm-arm/next (11a7d6a19037 Merge branch 'kvm-arm64/misc' into kvmar=
m/next)
Merging kvms390/next (32239066776a KVM: s390: selftests: Streamline uc_skey=
 test to issue iske after sske)
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (d252435aca44 riscv: KVM: Remove unnecessa=
ry vcpu kick)
Merging kvm-x86/next (ead22377189e Merge branch 'xen')
Merging xen-tip/linux-next (75ad02318af2 Xen/swiotlb: mark xen_swiotlb_fixu=
p() __init)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (1e5f94eb8ef7 Merge branch 'for-6.15' into for-=
next)
Merging sched-ext/for-next (c237e781df07 Merge branch 'for-6.15' into for-n=
ext)
Merging drivers-x86/for-next (5ad6d62c9b18 MAINTAINERS: Add documentation r=
eference for Mellanox platform)
Merging chrome-platform/for-next (9fc83373f0ff platform/chrome: cros_ec_typ=
ec: Add support for setting USB mode via sysfs)
Merging chrome-platform-firmware/for-firmware-next (2014c95afece Linux 6.14=
-rc1)
Merging hsi/for-next (e3f88665a780 HSI: ssi_protocol: Fix use after free vu=
lnerability in ssi_protocol Driver Due to Race Condition)
Merging leds-lj/for-leds-next (7a3350495d9a leds: rgb: leds-qcom-lpg: Add s=
upport for 6-bit PWM resolution)
Merging ipmi/for-next (d082ecbc71e9 Linux 6.14-rc4)
Merging driver-core/driver-core-next (040b17ae0e15 rust: io: fix devres tes=
t with new io accessor functions)
Merging usb/usb-next (c749f058b437 USB: core: Add eUSB2 descriptor and pars=
ing in USB core)
CONFLICT (content): Merge conflict in drivers/usb/typec/ucsi/ucsi_acpi.c
Merging thunderbolt/next (72cef52b353c thunderbolt: Make tb_tunnel_alloc_us=
b3() error paths consistent with the rest)
Merging usb-serial/usb-next (6a7713ec5337 USB: serial: mos7840: drop unused=
 defines)
Merging tty/tty-next (d2fa8e52cf91 serial: xilinx_uartps: Switch to use hrt=
imer_setup())
Merging char-misc/char-misc-next (264ff8415aed ABI: pps: Add ABI documentat=
ion for Intel TIO)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (1e4e454223f7 dt-bindings: coresight: qcom,coresight=
-tpdm: Fix too many 'reg')
Merging fastrpc/for-next (2014c95afece Linux 6.14-rc1)
Merging fpga/for-next (cc1eb048e7ee fpga: m10bmc-sec: update email address =
for Peter Colberg)
Merging icc/icc-next (4cc004716977 Merge branch 'icc-sm8750' into icc-next)
Merging iio/togreg (66e80e2f2176 iio: resolver: ad2s1210: use bitmap_write)
Merging phy-next/next (49166afbf4ce phy: exynos5-usbdrd: Do not depend on T=
ype-C)
Merging soundwire/next (be2f35e15939 soundwire: amd: change the log level f=
or command response log)
Merging extcon/extcon-next (7041ed0dde83 extcon: Drop explicit initializati=
on of struct i2c_device_id::driver_data to 0)
Merging gnss/gnss-next (0ad2507d5d93 Linux 6.14-rc3)
Merging vfio/next (2bb447540e71 vfio/nvgrace-gpu: Add GB200 SKU to the devi=
d table)
Merging w1/for-next (33c145297840 w1: w1_therm: w1: Use HWMON_CHANNEL_INFO =
macro to simplify code)
Merging spmi/spmi-next (092c49673431 spmi: Only use Hikey 970 SPMI controll=
er driver when ARM64)
Merging staging/staging-next (20a351c36afc staging: gpib: tnt4882 console m=
essaging cleanup)
Merging counter-next/counter-next (c2a756660324 counter: ti-eqep: add direc=
tion support)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (6f9669f3634b dmaengine: Fix typo in comment)
CONFLICT (modify/delete): Documentation/devicetree/bindings/misc/atmel-ssc.=
txt deleted in HEAD and modified in dmaengine/next.  Version dmaengine/next=
 of Documentation/devicetree/bindings/misc/atmel-ssc.txt left in tree.
$ git rm -f Documentation/devicetree/bindings/misc/atmel-ssc.txt
Merging cgroup/for-next (9e9f46bd7e16 Merge branch 'for-6.15' into for-next)
Merging scsi/for-next (5d51aea46375 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (ac0fb4a55bde scsi: scsi_debug: Do not sleep in a=
tomic sections)
CONFLICT (content): Merge conflict in drivers/scsi/scsi_debug.c
Merging vhost/linux-next (9d8960672d63 vhost-scsi: Reduce response iov mem =
use)
Merging rpmsg/for-next (539c3845d320 remoteproc: omap: Add comment for is_i=
omem)
Merging gpio-brgl/gpio/for-next (8a5680bffb2f gpiolib: don't double-check t=
he gc->get callback's existence)
Merging gpio-intel/for-next (1f4c7f3b3afa Merge patch series "Split devres =
APIs to device/devres.h and introduce devm_kmemdup_array()")
Merging pinctrl/for-next (920d11593280 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (aa0554d3756a Merge tag 'ib-devres-iio-input=
-pinctrl-v6.15' into intel/pinctrl)
Merging pinctrl-renesas/renesas-pinctrl (ea4065345643 pinctrl: renesas: rzg=
2l: Suppress binding attributes)
Merging pinctrl-samsung/for-next (574d0f2120b8 pinctrl: samsung: add exynos=
2200 SoC pinctrl configuration)
Merging pwm/pwm/for-next (e8af7c083520 pwm: Strengthen dependency for PWM_S=
IFIVE)
Merging ktest/for-next (f3a30016e4b5 ktest.pl: Fix typo "accesing")
Merging kselftest/next (dc4b165855f2 selftests/ftrace: Use readelf to find =
entry point in uprobe test)
Merging kunit/test (a64dcfb451e2 Linux 6.14-rc2)
Merging kunit-next/kunit (0619a4868fc1 kunit: Clarify kunit_skip() argument=
 name)
Merging livepatching/for-next (f76ad354146d Merge branch 'for-6.14/selftest=
s-dmesg' into for-next)
Merging rtc/rtc-next (2014c95afece Linux 6.14-rc1)
Merging nvdimm/libnvdimm-for-next (f3dd9ae7f03a dax: Remove an unused field=
 in struct dax_operations)
Merging at24/at24/for-next (03480898cefe dt-bindings: eeprom: at24: Add com=
patible for Giantec GT24P128E)
Merging ntb/ntb-next (c620f56c70eb MAINTAINERS: Update AMD NTB maintainers)
Merging seccomp/for-next/seccomp (8f19331384e6 seccomp: avoid the lock trip=
 seccomp_filter_release in common case)
Merging slimbus/for-next (2014c95afece Linux 6.14-rc1)
Merging nvmem/for-next (d0ee061dec06 nvmem: make the misaligned raw_len non=
-fatal)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (21cfcbeb7bff hyperv: Add CONFIG_MSHV_ROOT to ga=
te root partition support)
Merging auxdisplay/for-next (72e1c440c848 auxdisplay: panel: Fix an API mis=
use in panel.c)
Merging kgdb/kgdb/for-next (6beaa75cd24d kdb: Remove unused flags stack)
Merging hmm/hmm (40384c840ea1 Linux 6.13-rc1)
Merging cfi/cfi/next (2014c95afece Linux 6.14-rc1)
Merging mhi/mhi-next (cba6bdfd7929 bus: mhi: host: pci_generic: Add support=
 for SA8775P endpoint)
Merging memblock/for-next (98b7beba1ee6 memblock: uniformly initialize all =
reserved pages to MIGRATE_MOVABLE)
Merging cxl/next (00d8107b0cbf cxl/test: Define a CFMWS capable of a 3 way =
HB interleave)
Merging efi/next (fb84cefd4ce7 x86/efi/mixed: Move mixed mode startup code =
into libstub)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (0bbb50750400 Merge branch 'slab/for-6.15/kfree_=
rcu_tiny' into slab/for-next)
CONFLICT (content): Merge conflict in kernel/rcu/tiny.c
Merging random/master (93354d866ac4 prandom: remove next_pseudo_random32)
Merging landlock/next (78332fdb956f selftests/landlock: Add binaries to .gi=
tignore)
Merging rust/rust-next (beeb78d46249 MAINTAINERS: add Danilo Krummrich as R=
ust reviewer)
Merging sysctl/sysctl-next (29fa7d793421 selftests/sysctl: fix wording of h=
elp messages)
CONFLICT (content): Merge conflict in kernel/sysctl.c
Merging execve/for-next/execve (07c29c78ca3a Merge branch 'for-linus/execve=
' into for-next/execve)
Merging bitmap/bitmap-for-next (14c384131ea0 cpumask: drop cpumask_next_wra=
p_old())
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (dc95913ce686 Merge branch 'for-next/hardening' =
into for-next/kspp)
CONFLICT (content): Merge conflict in lib/Makefile
Applying: fix up for "lib: Move KUnit tests into tests/ subdirectory"
Merging nolibc/nolibc (a64dcfb451e2 Linux 6.14-rc2)
Merging iommufd/for-next (598749522d42 iommufd: Implement sw_msi support na=
tively)
Merging turbostat/next (447c98c1ca4a tools/power turbostat: Add idle govern=
or statistics reporting)
Merging pwrseq/pwrseq/for-next (2014c95afece Linux 6.14-rc1)
Merging capabilities-next/caps-next (d48da4d5ed7b security: add trace event=
 for cap_capable)
Merging ipe/next (aefadf03b3e3 ipe: policy_fs: fix kernel-doc warnings)
Merging kcsan/next (9d89551994a4 Linux 6.13-rc6)
Merging crc/crc-next (a0bd462f3a13 x86/crc: add ANNOTATE_NOENDBR to suppres=
s objtool warnings)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)

--Sig_/Jj4qvteHugwXDlUNv6JnrdS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfBbTsACgkQAVBC80lX
0GxNVQf8CO99UnlUfxCbmUFq+QR5UBaBxqeu5mxFybF6MpICT4Fy9kd9ab9JdG7n
ZDJzj294bZSHECgEWYpGU8BT2oowC0S1GG1lUQEoWZiKih2m/Z8/c+O1ZktVYifE
9AYFx0xk5WOox5NFw5GxvqUQnOIf44KZ7pl7AtJYzYqfDXPcp5FPQEt5r+XODsW7
FtRYcTqX57xcHSLJVCnJNIIhApgUpXKQ7U5ghfVg8kfqxIAd44XERwG9fvjUNJVY
JaAekYVNqrQiJs6jkBzrbyRoJjZGYQA4PnFq2NoPOuY3XKQhkgCOTgTtq3+PIwzg
waJlvElR3RiiaWr0aVy0Rreh1d2jKw==
=cxKr
-----END PGP SIGNATURE-----

--Sig_/Jj4qvteHugwXDlUNv6JnrdS--

