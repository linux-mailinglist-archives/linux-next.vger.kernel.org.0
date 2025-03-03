Return-Path: <linux-next+bounces-5628-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D3DA4B8DD
	for <lists+linux-next@lfdr.de>; Mon,  3 Mar 2025 09:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56DCD3A3166
	for <lists+linux-next@lfdr.de>; Mon,  3 Mar 2025 08:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009761EE021;
	Mon,  3 Mar 2025 08:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CP9Gad/3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8B113A3F7;
	Mon,  3 Mar 2025 08:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740989536; cv=none; b=YdjA2ul5p/qTYC6JiA8GHZuGrsC6QSjVr8Nw1y97ZWKl4Z9T9sQKsKCWsRviUDF4VxFpn1yuirgTky4opBGcAHmF7hA5k6SPG52IRzNHsuaIdukyw49dBay+RwAuHi3OAoskGjjqpxbyfdRuI0q2kUa213HFHgps8W2WQculb5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740989536; c=relaxed/simple;
	bh=lLQqgtKJcouV6WDT3L/fPqueBO2DkTtoMDvdc+6uyTc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hPY7/oAOFZqI0uB7aNgrgP90Ls294HIBwEFf3uJMzrAOrgC9vjjSrNm3LsoDqUXSRU1oqAwDNbcJnpaMyhK+r38quKfNfCGriRax1EGRQFhVJZ2tqW1bOzphzNZQAR41H5G02Cj+0EXAQtUtz0Qn1s/LyJTjAweP6nWgrLwAMsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CP9Gad/3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740989530;
	bh=8CWGGg93znRF3ltD9fCSUxR2d/tOngV53u2cWci028c=;
	h=Date:From:To:Cc:Subject:From;
	b=CP9Gad/3eLTQV2HcYSDR8QaB8MCdh7gnuyNsbgUrZvlmbpE5xehAs6AL5X9aG5n/z
	 LCnoKjFZI0PdpsPc7Cwx3qRAcPnLMoCTLzlMjxYsaFeUoVSoVARKGNQhnASFBOs0ii
	 pBClYedrRujLkLIwDbdgP1jLX1Maw2Lq64OzFJ+9nuoiZ17CRWpc0K/cLGJtF6fjyY
	 8TpbUJ046TrfADL8aa+nQlL5n5WeQGk4a9QWItUR5jisct4EvuRY0sXzPsXiVf0wch
	 jGS8W/+r5SZMhNNx/SWwhN9To1o2FrvafpcUZI3BIKVERkyUFNThA6mKw65dMCJKQQ
	 WtegjmfIhCFCw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z5s3s62jpz4wbn;
	Mon,  3 Mar 2025 19:12:09 +1100 (AEDT)
Date: Mon, 3 Mar 2025 19:12:08 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 3
Message-ID: <20250303191208.15734e97@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Lw4WWUk5unCLEwl3Z0wkYmt";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Lw4WWUk5unCLEwl3Z0wkYmt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250228:

The drm tree gained a conflict against Linus' tree.

The tip tree gained conflicts against the loongarch and mailbox trees.

The gpio-brgl tree gained a conflict against the gpio-brgl-fixes tree.

Non-merge commits (relative to Linus' tree): 6945
 7528 files changed, 379420 insertions(+), 155892 deletions(-)

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
Merging origin/master (7eb172143d55 Linux 6.14-rc5)
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
Merging bcachefs/for-next (a32d248c6670 bcachefs: bcachefs_metadata_version=
_extent_flags)
Merging fscrypt/for-next (75eb8b9410ee Revert "fscrypt: relax Kconfig depen=
dencies for crypto API algorithms")
Merging btrfs/for-next (1bae279be2cf Merge branch 'for-next-next-v6.14-2025=
0228' into for-next-20250228)
Merging ceph/master (3981be13ec1b ceph: exchange hardcoded value on NAME_MA=
X)
Merging cifs/for-next (52cf576a3aaf smb: client: Fix netns refcount imbalan=
ce causing leaks and use-after-free)
Merging configfs/for-next (84147f4e84c4 configfs: improve item creation per=
formance)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (a3672304abf2 dlm: fix error if active rsb is not hashed)
Merging erofs/dev (0fb25a2943e1 erofs: clean up header parsing for ztailpac=
king and fragments)
Merging exfat/dev (223720ae647b exfat: add a check for invalid data size)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (a7624ccdef4f ext2: Make ext2_params_spec static)
Merging ext4/dev (9e28059d5664 ext4: introduce linear search for dentries)
Merging f2fs/dev (5fb6336caa8b f2fs: support F2FS_NOLINEAR_LOOKUP_FL)
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
Merging nfsd/nfsd-next (fdbad10e1342 nfsd: filecache: drop the list_lru loc=
k during lock gc scans)
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
Merging vfs-brauner/vfs.all (c87c0d865302 Merge branch 'vfs-6.15.shared.afs=
' into vfs.all)
CONFLICT (content): Merge conflict in fs/fuse/dir.c
Merging vfs/for-next (2e72b1e0aac2 Merge branch 'work.d_revalidate' into fo=
r-next)
Merging mm-hotfixes/mm-hotfixes-unstable (7f2b74018b41 mm: page_isolation: =
avoid calling folio_hstate() without hugetlb_lock)
Merging fs-current (5ea9daa71171 Merge branch 'next-fixes' of git://git.ker=
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
Merging net/main (a466fd7e9faf caif_virtio: fix wrong pointer check in cfv_=
probe())
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
Merging sound-current/for-linus (c9ce148ea753 ALSA: seq: Avoid module auto-=
load handling at event delivery)
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
Merging kvm-fixes/master (916b7f42b3b3 kvm: retry nx_huge_page_recovery_thr=
ead creation)
Merging kvms390-fixes/master (e376d958871c KVM: s390: selftests: Add has de=
vice attr check to uc_attr_mem_limit selftest)
Merging hwmon-fixes/hwmon (e278d5e8aef4 hwmon: (ad7314) Validate leading ze=
ro bits and return error)
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
Merging drm-fixes/drm-fixes (6a5884f20069 Merge tag 'drm-xe-fixes-2025-02-2=
7' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes)
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
Merging gpio-brgl-fixes/gpio/for-current (64407f4b5807 gpiolib: Fix Oops in=
 gpiod_direction_input_nonotify())
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
Merging rust-fixes/rust-fixes (d082ecbc71e9 Linux 6.14-rc4)
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
Merging trace-fixes/trace/fixes (a1a7eb89ca0b ftrace: Avoid potential divis=
ion by zero in function_stat_show())
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging tip-fixes/tip/urgent (8aa827611b0a Merge branch into tip/master: 'p=
erf/urgent')
Merging slab-fixes/slab/for-next-fixes (6b789b1849ba mm/slab/kvfree_rcu: Sw=
itch to WQ_MEM_RECLAIM wq)
Merging drm-msm-fixes/msm-fixes (73f69c6be2a9 drm/msm/dsi/phy: Do not overw=
ite PHY_CMN_CLK_CFG1 when choosing bitclk source)
Merging uml-fixes/fixes (96178631c3f5 um: convert irq_lock to raw spinlock)
Merging drm-misc-fixes/for-linux-next-fixes (6b481ab0e685 drm/nouveau: sele=
ct FW caching)
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (0ad2507d5d93 Linux 6.14-rc3)
Merging mm-nonmm-stable/mm-nonmm-stable (0ad2507d5d93 Linux 6.14-rc3)
Merging mm/mm-everything (3dec9c0e67aa foo)
Merging kbuild/for-next (a77b570b6c3f modpost: use strstarts() to clean up =
parse_source_files())
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (fad07a5c0f07 tools/x86: Fix linux/unaligned.h=
 include path in lib/insn.c)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/for-next (aef7ee7649e0 dma-debug: fix physical address =
calculation for struct dma_debug_entry)
Merging asm-generic/master (9e81c965742c io.h: drop unused headers)
Merging alpha/alpha-next (1523226edda5 alpha: Use str_yes_no() helper in pc=
i_dac_dma_supported())
Merging arm/for-next (f520fab580c9 ARM: 9440/1: cacheinfo fix format field =
mask)
Merging arm64/for-next/core (fc52aa3e265b Merge branches 'for-next/amuv1-av=
g-freq', 'for-next/pkey_unrestricted' and 'for-next/sysreg' into for-next/c=
ore)
Merging arm-perf/for-next/perf (7f35b429802a perf/dwc_pcie: fix duplicate p=
ci_dev devices)
Merging arm-soc/for-next (e31e3f6c0ce4 soc: loongson: loongson2_guts: Add c=
heck for devm_kstrdup())
Merging amlogic/for-next (73e4ffb27bb8 Merge branch 'v6.15/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (64c6db7b2657 Merge branch 'asahi-soc/=
soc' into asahi-soc/for-next)
Merging aspeed/for-next (3540adcccc71 ARM: dts: aspeed: yosemite4: adjust s=
econdary flash name)
Merging at91/at91-next (c9fd7cab2121 Merge branch 'at91-dt' into at91-next)
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
Merging rockchip/for-next (982a5cb7c8b0 Merge branch 'v6.15-clk/next' into =
for-next)
Merging samsung-krzk/for-next (e57b17c06ae5 Merge branch 'next/clk' into fo=
r-next)
Merging scmi/for-linux-next (ee1000a7d8f0 Merge branches 'for-next/juno/upd=
ates', 'for-next/ffa/updates' and 'for-next/scmi/updates' of ssh://gitolite=
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
Merging ti/ti-next (27786792cca9 Merge branch 'ti-k3-dts-next' into ti-next)
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
Merging loongarch/loongarch-next (529f5ff3fc23 Merge branch 'loongarch-kvm'=
 into loongarch-next)
Merging m68k/for-next (723be3c6ab31 m68k: sun3: Fix DEBUG_MMU_EMU build)
Merging m68knommu/for-next (63014a9e119f m68k: mm: Replace deprecated strnc=
py() with strscpy())
Merging microblaze/next (920354d7818b microblaze: Use of_property_present()=
 for non-boolean properties)
Merging mips/mips-next (a547dc46e393 MIPS: dec: Remove dec_irq_dispatch())
Merging openrisc/for-next (ea1413e5b53a rseq/selftests: Add support for Ope=
nRISC)
Merging parisc-hd/for-next (559eda6c3380 Input: gscps2 - Describe missing f=
unction parameters)
Merging powerpc/next (aca95fb6bb57 powerpc/microwatt: Add SMP support)
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
Merging fs-next (f0db905c41c1 Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (9022df7f5e05 Merge branch 'for-6.14-cpu_sync-fixup=
' into for-next)
Merging pci/next (d774bdc86cfa Merge branch 'pci/misc')
Merging pstore/for-next/pstore (5674609535ba pstore: Change kmsg_bytes stor=
age size to u32)
Merging hid/for-next (8fabf47931ed Merge branch 'for-6.15/bpf' into for-nex=
t)
Merging i2c/i2c/for-next (28072f001288 Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i2c-host/i2c/i2c-host (ad50946dbf74 i2c: qup: Vote for interconnect=
 bandwidth to DRAM)
Merging i3c/i3c/next (a892ee4cf22a i3c: master: svc: Flush FIFO before send=
ing Dynamic Address Assignment(DAA))
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (0ea627381eb5 hwmon: (acpi_power_meter) Fi=
x the fake power alarm reporting)
Merging jc_docs/docs-next (76a6782284df Documentation: input: Add section p=
ertaining to polled input devices)
Merging v4l-dvb/next (d98e9213a768 media: visl: Fix ERANGE error when setti=
ng enum controls)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (b25eff369f3c Merge branch 'thermal-misc' into linux-=
next)
Merging cpufreq-arm/cpufreq/arm/linux-next (f2d32942026c cpufreq: enable 12=
00Mhz clock speed for armada-37xx)
Merging cpupower/cpupower (80d3175a7e07 cpupower: monitor: Exit with error =
status if execvp() fail)
Merging devfreq/devfreq-next (f3253b23535f PM / devfreq: exynos: remove unu=
sed function parameter)
Merging pmdomain/next (db6df2e3fc16 pmdomain: rockchip: add regulator suppo=
rt)
Merging opp/opp/linux-next (2014c95afece Linux 6.14-rc1)
Merging thermal/thermal/linux-next (ecb642900deb dt-bindings: thermal: Corr=
ect indentation and style in DTS example)
Merging rdma/for-next (230804a89319 Merge branch 'mlx5-next' into wip/leon-=
for-next)
Merging net-next/main (f77f12010f67 Merge branch 'add-usb-net-support-for-t=
elit-cinterion-fn990b')
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
Merging bluetooth/master (ebbeaffb5622 Bluetooth: SCO: fix sco_conn refcoun=
ting on sco_conn_ready)
  02aa832d1403 ("bluetooth: btusb: Initialize .owner field of force_poll_sy=
nc_fops")
  62ee156d6b29 ("Bluetooth: Add check for mgmt_alloc_skb() in mgmt_remote_n=
ame()")
  a4ce2f1cceba ("Bluetooth: Add check for mgmt_alloc_skb() in mgmt_device_c=
onnected()")
Merging wireless-next/for-next (e5328c14590d wifi: mac80211: refactor popul=
ating mesh related fields in sinfo)
Merging ath-next/for-next (9a0dddfb30f1 wifi: ath12k: Fix invalid data acce=
ss in ath12k_dp_rx_h_undecap_nwifi)
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
Merging crypto/master (17ec3e71ba79 crypto: lib/Kconfig - Hide arch options=
 from user)
Merging drm/drm-next (33e26f3544a5 Merge tag 'drm-xe-next-2025-02-24' of ht=
tps://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_gfx=
.c
Merging drm-exynos/for-linux-next (81a50378559b drm/exynos: Remove unnecess=
ary checking)
Merging drm-misc/for-linux-next (301618ed1d8a drm/rockchip: vop2: Introduce=
 vop hardware version)
Merging amdgpu/drm-next (7d83c129a8d7 drm/amdgpu: Fix parameter annotation =
in vcn_v5_0_0_is_idle)
Merging drm-intel/for-linux-next (5c91b5ad7155 drm/i915/display: Make POWER=
_DOMAIN_*() always result in enum intel_display_power_domain)
Merging drm-msm/msm-next (78e70fa099b9 dt-bindings: display/msm/gmu: Add Ad=
reno 623 GMU)
Merging drm-msm-lumag/msm-next-lumag (445a7e288cad drm/msm/dpu: handle perf=
 mode in _dpu_core_perf_crtc_update_bus())
Merging drm-xe/drm-xe-next (067a974fd8a9 drm/xe: Add performance tunings to=
 debugfs)
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (c454bc716854 fbcon: Use correct erase colour for cl=
earing in fbcon)
Merging regmap/for-next (14b33926f576 Merge remote-tracking branch 'regmap/=
for-6.15' into regmap-next)
Merging sound/for-next (3abe3d342fc6 ALSA: seq: seq_oss_event: fix inconsis=
tent indenting warning in note_on_event())
Merging ieee1394/for-next (1c745720bec2 drivers: firewire: firewire-cdev.h:=
 fix identation on a kernel-doc markup)
Merging sound-asoc/for-next (6eafe4db9b50 Merge remote-tracking branch 'aso=
c/for-6.15' into asoc-next)
Merging modules/modules-next (afa92869776a params: Annotate struct module_p=
aram_attrs with __counted_by())
Merging input/next (aed2626f465e dt-bindings: input: matrix_keypad - add mi=
ssing property)
Merging block/for-next (638b0a2557cb Merge branch 'for-6.15/io_uring' into =
for-next)
CONFLICT (content): Merge conflict in tools/testing/selftests/drivers/net/h=
w/Makefile
Merging device-mapper/for-next (254f4a76f2db dm cache: support shrinking th=
e origin device)
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
Merging regulator/for-next (3876b360323f Merge remote-tracking branch 'regu=
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
Merging tpmdd/next (000dc9d2c721 tpm: ftpm_tee: remove incorrect of_match_p=
tr annotation)
Merging watchdog/master (0ad2507d5d93 Linux 6.14-rc3)
Merging iommu/next (e840414e5a73 Merge branches 'fixes', 'apple/dart' and '=
s390' into next)
Merging audit/next (2014c95afece Linux 6.14-rc1)
Merging devicetree/for-next (39fc02692236 dt-bindings: interrupt-controller=
: Convert nxp,lpc3220-mic.txt to yaml format)
CONFLICT (content): Merge conflict in drivers/of/of_private.h
Merging dt-krzk/for-next (854a080f0b73 loongarch: dts: remove non-existent =
DAC from 2k1000-ref)
Merging mailbox/for-next (d44ee3bd382d MAINTAINERS: add mailbox API's tree =
type and location)
Merging spi/for-next (b5dd1a44eea8 Merge remote-tracking branch 'spi/for-6.=
15' into spi-next)
Merging tip/master (16c52ca75455 Merge branch into tip/master: 'x86/sev')
CONFLICT (content): Merge conflict in arch/loongarch/Kconfig
CONFLICT (content): Merge conflict in arch/riscv/include/asm/io.h
CONFLICT (content): Merge conflict in arch/x86/kernel/paravirt.c
CONFLICT (content): Merge conflict in arch/x86/mm/pgtable.c
CONFLICT (content): Merge conflict in drivers/mailbox/mailbox.c
CONFLICT (content): Merge conflict in net/core/dev.c
Merging clockevents/timers/drivers/next (fafc3058cc2f dt-bindings: timer: e=
xynos4210-mct: Add samsung,exynos990-mct compatible)
Merging edac/edac-for-next (95486144d13b Merge ras/edac-misc into for-next)
Merging ftrace/for-next (48f920100b69 Merge sorttable/for-next)
Merging rcu/next (dacf15a5f3a6 Merge branches 'docs.2025.02.04a', 'lazypree=
mpt.2025.02.24a', 'misc.2025.03.02a', 'srcu.2025.02.05a' and 'torture.2025.=
02.05a')
Merging paulmck/non-rcu/next (a2bfbf847c96 tools/memory-model: glossary.txt=
: Fix indents)
Merging kvm/next (916b7f42b3b3 kvm: retry nx_huge_page_recovery_thread crea=
tion)
Merging kvm-arm/next (11a7d6a19037 Merge branch 'kvm-arm64/misc' into kvmar=
m/next)
Merging kvms390/next (32239066776a KVM: s390: selftests: Streamline uc_skey=
 test to issue iske after sske)
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (d252435aca44 riscv: KVM: Remove unnecessa=
ry vcpu kick)
Merging kvm-x86/next (c28b3cac581c Merge branch 'xen')
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
Merging driver-core/driver-core-next (21b0dc55bed6 driver core: faux: only =
create the device if probe() succeeds)
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
Merging fpga/for-next (e19890a0088b fpga: versal: remove incorrect of_match=
_ptr annotation)
Merging icc/icc-next (4cc004716977 Merge branch 'icc-sm8750' into icc-next)
Merging iio/togreg (9cbc49c91d2f iio: imu: bmi270: move private struct decl=
aration to source file)
Merging phy-next/next (49166afbf4ce phy: exynos5-usbdrd: Do not depend on T=
ype-C)
Merging soundwire/next (be2f35e15939 soundwire: amd: change the log level f=
or command response log)
Merging extcon/extcon-next (7041ed0dde83 extcon: Drop explicit initializati=
on of struct i2c_device_id::driver_data to 0)
Merging gnss/gnss-next (0ad2507d5d93 Linux 6.14-rc3)
Merging vfio/next (0fd06844de5d vfio/type1: Use mapping page mask for pfnma=
ps)
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
CONFLICT (content): Merge conflict in drivers/gpio/gpiolib.c
Merging gpio-intel/for-next (1f4c7f3b3afa Merge patch series "Split devres =
APIs to device/devres.h and introduce devm_kmemdup_array()")
Merging pinctrl/for-next (920d11593280 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (aa0554d3756a Merge tag 'ib-devres-iio-input=
-pinctrl-v6.15' into intel/pinctrl)
Merging pinctrl-renesas/renesas-pinctrl (ea4065345643 pinctrl: renesas: rzg=
2l: Suppress binding attributes)
Merging pinctrl-samsung/for-next (574d0f2120b8 pinctrl: samsung: add exynos=
2200 SoC pinctrl configuration)
Merging pwm/pwm/for-next (4b31eb55dbc6 pwm: Check for CONFIG_PWM using IS_R=
EACHABLE() in main header)
Merging ktest/for-next (f3a30016e4b5 ktest.pl: Fix typo "accesing")
Merging kselftest/next (dc4b165855f2 selftests/ftrace: Use readelf to find =
entry point in uprobe test)
Merging kunit/test (a64dcfb451e2 Linux 6.14-rc2)
Merging kunit-next/kunit (0619a4868fc1 kunit: Clarify kunit_skip() argument=
 name)
Merging livepatching/for-next (f76ad354146d Merge branch 'for-6.14/selftest=
s-dmesg' into for-next)
Merging rtc/rtc-next (72ce39bc61fa rtc: pl030: Constify amba_id table)
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
Merging cxl/next (26600bf10173 cxl: Fix warning from emitting resource_size=
_t as long long int on 32bit systems)
Merging efi/next (fb84cefd4ce7 x86/efi/mixed: Move mixed mode startup code =
into libstub)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (51d71f18be57 Merge branch 'slab/for-6.15/kfree_=
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
Merging bitmap/bitmap-for-next (a30047129e09 MAINTAINERS: add rust bindings=
 entry for bitmap API)
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (710aa36aee40 Merge branch 'for-next/hardening' =
into for-next/kspp)
CONFLICT (content): Merge conflict in lib/Makefile
Applying: fix up for "lib: Move KUnit tests into tests/ subdirectory"
Merging nolibc/nolibc (a64dcfb451e2 Linux 6.14-rc2)
Merging iommufd/for-next (5e9f822c9c68 iommu: Swap the order of setting gro=
up->pasid_array and calling attach op of iommu drivers)
Merging turbostat/next (447c98c1ca4a tools/power turbostat: Add idle govern=
or statistics reporting)
Merging pwrseq/pwrseq/for-next (2014c95afece Linux 6.14-rc1)
Merging capabilities-next/caps-next (d48da4d5ed7b security: add trace event=
 for cap_capable)
Merging ipe/next (aefadf03b3e3 ipe: policy_fs: fix kernel-doc warnings)
Merging kcsan/next (9d89551994a4 Linux 6.13-rc6)
Merging crc/crc-next (13f3d13d88b5 riscv/crc64: add Zbc optimized CRC64 fun=
ctions)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)

--Sig_/Lw4WWUk5unCLEwl3Z0wkYmt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfFZFgACgkQAVBC80lX
0GxdCwf/fTiaU9ho0oJ9ojkFZJ+a89SPKK4eO2sH0mQw4C/D2MzZckMAjNIbpFWr
d9qsEN/J8wu/Yxsenf7XlCfYWWjPz0gUOPLdmBR3L+CG1giOvAMY0p6XDb1gzi81
l8Xb7ze+GumuMEdjTs74o4X+jekmJ3ZDMd6SEfb5q76WcOfNgKbrKBwuTzCDcmb7
LDQfgO/CFMdD2LknMNpx6g/nJiADJ5C62hA/zzGU2VklM1LubBiYAFiM1QQ8LQ/t
CIl/G5BiaIHacfm2zUo2tngh6FsHiPI0D1m8MED9Ys0JDqSExKw69cqBCs0DT7wi
Am9rDNtiGaU/b1akEDDx8M9y0UnJdg==
=gKhD
-----END PGP SIGNATURE-----

--Sig_/Lw4WWUk5unCLEwl3Z0wkYmt--

