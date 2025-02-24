Return-Path: <linux-next+bounces-5548-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F07A4195D
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 10:41:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84F7116AD50
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 09:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E96823CEF8;
	Mon, 24 Feb 2025 09:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YqyMiHOS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121A31482E8;
	Mon, 24 Feb 2025 09:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740390088; cv=none; b=junKST2UOEzyshK3m31GbwfX7ZZcGEQFdvn36uvdoJxlO2aAXO++fFxiP1B+m013wxvH+cVEbJ/ilNPO2EraLSQevLUkfx8THu1WRH3F4JLJDy+GO5JknGUJoxmaIc0yzOF2lUbTcMFGhK31Vf2Yk8mrfKCPmebQtPTfQnNYS4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740390088; c=relaxed/simple;
	bh=7GIN7VuzZ5heNXcK+awABlmd3wMHRZtU5uDKQUSfLXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ds8E+ja5aWyCqBia1uyyMi4O9quHTse8qnvvnzG+cSz06XTIKSEuql1eE99RQU57C8rXPnv1FXXep6tLvvuzPPLOYBx73w56igHTL5cD6wnYfCTi43frx4+gQTqXvVU4QDFv0uV+nr7jcl3dYvDs+e11R4MpzWP4jvvbjzKRxe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YqyMiHOS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740390079;
	bh=2T0Nk8iPFQBL6SbSBqiawnaYRWU1qz2+VhU15m/xYbg=;
	h=Date:From:To:Cc:Subject:From;
	b=YqyMiHOSAZnsgJmcBIeVKKAg1t4/VJpR0xwVeIOYd80eOE8Us89DDLEh/ZuWsrw6O
	 U4rd74TJJIeiH4rx4E2opHLS7SYYuDi8TSk/haILfUr/rUNcB+vyzcIdWrYUBjSVbX
	 V9tntdx64dTn53L0n2BZQa5qPXV2lugYPCeCxk7COOI/9WfhDrH5cWW27qC6HLMF1o
	 ZyVyd/t+Dm4reMKprnqXkBGTIoEfCCa+9se2RUA6SgaIn6mIXG4Lf1D8qarMWlHIHo
	 joJ4QjoEv4SBHVPCxghi+1P7hWfleB4B2RVuPPtyj1SqP05lBdJWyor/8wiW6MGlw5
	 5L0tuA4ZWoHJw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z1bMz1q10z4wby;
	Mon, 24 Feb 2025 20:41:19 +1100 (AEDT)
Date: Mon, 24 Feb 2025 20:41:17 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 24
Message-ID: <20250224204117.69c08303@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/W+KWzIz0s1mzmx/5aY=3Nro";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/W+KWzIz0s1mzmx/5aY=3Nro
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250221:

The mm tree lost its build failure.

The pmdomain tree still had its build failure so I used the version from
next-20250219.

The net-next tree gained a conflict against the net tree.

The tip tree gained a conflict against the mm tree.

The leds-lj tree lost its build failure.

The scsi-mkp tree picked up the build failure from the pmdomain tree so
I used the version from next-20250221.

The sysctl tree gained a conflict against the tip tree.

The execve tree gained a semantic conflict against the vfs-brauner tree.

The kspp tree gained a conflict against the tip tree.

Non-merge commits (relative to Linus' tree): 5317
 6149 files changed, 310222 insertions(+), 118551 deletions(-)

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
Merging origin/master (d082ecbc71e9 Linux 6.14-rc4)
Merging fixes/fixes (fac04efc5c79 Linux 6.13-rc2)
Merging ext4-fixes/fixes (4bbf9020becb Linux 6.13-rc4)
Merging vfs-brauner-fixes/vfs.fixes (4c7a22bda684 Merge patch series "fixes=
 for uncached IO")
Merging fscrypt-current/for-current (2014c95afece Linux 6.14-rc1)
Merging fsverity-current/for-current (2014c95afece Linux 6.14-rc1)
Merging btrfs-fixes/next-fixes (db9dad9dfa9a Merge branch 'misc-6.14' into =
next-fixes)
Merging vfs-fixes/fixes (60a600243244 hostfs: fix string handling in __dent=
ry_name())
Merging erofs-fixes/fixes (6422cde1b0d5 erofs: use buffered I/O for file-ba=
cked mounts by default)
Merging nfsd-fixes/nfsd-fixes (4990d098433d NFSD: Fix CB_GETATTR status fix)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (228a1157fb9f Merge tag '6.13-rc-part1-SM=
B3-client-fixes' of git://git.samba.org/sfrench/cifs-2.6)
Merging bcachefs/for-next (fa2529b1824c bcachefs: bs > ps support)
Merging fscrypt/for-next (75eb8b9410ee Revert "fscrypt: relax Kconfig depen=
dencies for crypto API algorithms")
Merging btrfs/for-next (f9d3870b9957 Merge branch 'for-next-next-v6.14-2025=
0221' into for-next-20250221)
Merging ceph/master (3981be13ec1b ceph: exchange hardcoded value on NAME_MA=
X)
Merging cifs/for-next (3057df0190b4 smb: client: Fix netns refcount imbalan=
ce causing leaks and use-after-free)
Merging configfs/for-next (84147f4e84c4 configfs: improve item creation per=
formance)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (8e2bad543eca dlm: prevent NPD when writing a positive val=
ue to event_done)
Merging erofs/dev (78ee54f6e0e8 erofs: get rid of erofs_kmap_type)
Merging exfat/dev (dda0407a2026 exfat: short-circuit zero-byte writes in ex=
fat_file_write_iter)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (ef51934a05d3 ext2: Remove reference to bh->b_page)
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
Merging nfs-anna/linux-next (7a2f6f7687c5 SUNRPC: Handle -ETIMEDOUT return =
from tlshd)
Merging nfsd/nfsd-next (71cdb645faf2 nfsd: eliminate special handling of NF=
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
Merging xfs/for-next (2d873efd174b xfs: flush inodegc before swapon)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging vfs-brauner/vfs.all (bfbcac33564f Merge branch 'vfs-6.15.sysv' into=
 vfs.all)
Merging vfs/for-next (2e72b1e0aac2 Merge branch 'work.d_revalidate' into fo=
r-next)
Merging mm-hotfixes/mm-hotfixes-unstable (dfeb60df12bc mm: page_isolation: =
avoid calling folio_hstate() without hugetlb_lock)
Merging fs-current (a7929d91f15e Merge branch 'next-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/kdave/linux.git)
Merging kbuild-current/fixes (b28fb1f2ef45 modpost: Fix a few typos in a co=
mment)
Merging arc-current/for-curr (78d4f34e2115 Linux 6.13-rc3)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (446a8351f160 arm64: rust: clean Rust 1.=
85.0 warning using softfloat target)
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
Merging net/main (28b04731a38c MAINTAINERS: fix DWMAC S32 entry)
Merging bpf/master (319fc77f8f45 Merge tag 'bpf-fixes' of git://git.kernel.=
org/pub/scm/linux/kernel/git/bpf/bpf)
Merging ipsec/master (a1300691aed9 net: rose: lock the socket in rose_bind(=
))
Merging netfilter/main (1438f5d07b9a rtnetlink: fix netns leak with rtnl_se=
tlink())
Merging ipvs/main (1438f5d07b9a rtnetlink: fix netns leak with rtnl_setlink=
())
Merging wireless/for-next (3640dbc1f75c wifi: iwlwifi: Fix A-MSDU TSO prepa=
ration)
Merging ath/for-current (3640dbc1f75c wifi: iwlwifi: Fix A-MSDU TSO prepara=
tion)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (c534ffda781f RDMA/mlx5: Fix AH static rate parsi=
ng)
Merging sound-current/for-linus (c9ca8a4f8988 Merge tag 'asoc-fix-v6.14-rc3=
' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for=
-linus)
Merging sound-asoc-fixes/for-linus (f5468beeab1b ASoC: tas2764: Set the SDO=
UT polarity correctly)
Merging regmap-fixes/for-linus (32ffed055dce regmap-irq: Add missing kfree(=
))
Merging regulator-fixes/for-linus (35e21de48e69 regulator: core: let dt pro=
perties override driver init_data)
Merging spi-fixes/for-linus (3d7a20f9ba7b MAINTAINERS: add tambarus as R fo=
r Samsung SPI)
Merging pci-current/for-linus (2014c95afece Linux 6.14-rc1)
Merging driver-core.current/driver-core-linus (78eb41f518f4 drivers: core: =
fix device leak in __fw_devlink_relax_cycles())
Merging tty.current/tty-linus (0ad2507d5d93 Linux 6.14-rc3)
Merging usb.current/usb-linus (c783e1258f29 usb: gadget: Fix setting self-p=
owered state on suspend)
Merging usb-serial-fixes/usb-linus (0ad2507d5d93 Linux 6.14-rc3)
Merging phy/fixes (55f1a5f7c97c phy: tegra: xusb: reset VBUS & ID OVERRIDE)
Merging staging.current/staging-linus (2014c95afece Linux 6.14-rc1)
Merging iio-fixes/fixes-togreg (cc2c3540d947 iio: filter: admv8818: Force i=
nitialization of SDO)
Merging counter-current/counter-current (2014c95afece Linux 6.14-rc1)
Merging char-misc.current/char-misc-linus (92527e473911 ntsync: Check wait =
count based on byte size.)
Merging soundwire-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging thunderbolt-fixes/fixes (a64dcfb451e2 Linux 6.14-rc2)
Merging input-current/for-linus (3492321e2e60 Input: xpad - add multiple su=
pported devices)
Merging crypto-current/master (9d4f8e54cef2 rhashtable: Fix rhashtable_try_=
insert test)
Merging vfio-fixes/for-linus (09dfc8a5f2ce vfio/pci: Fallback huge faults f=
or unaligned pfn)
Merging kselftest-fixes/fixes (a64dcfb451e2 Linux 6.14-rc2)
Merging dmaengine-fixes/fixes (76ed9b7d177e dmaengine: tegra210-adma: check=
 for adma max page)
CONFLICT (content): Merge conflict in drivers/dma/tegra210-adma.c
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (1dbf60277e9b Merge tag 'spi-nor/fixes-for-6.14=
-rc4' of https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux into mtd=
/fixes)
Merging mfd-fixes/for-mfd-fixes (68f860426d50 mfd: axp20x: AXP717: Fix miss=
ing IRQ status registers range)
Merging v4l-dvb-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging reset-fixes/reset/fixes (2014c95afece Linux 6.14-rc1)
Merging mips-fixes/mips-fixes (0ad2507d5d93 Linux 6.14-rc3)
Merging at91-fixes/at91-fixes (2014c95afece Linux 6.14-rc1)
Merging omap-fixes/fixes (c2a5f8c4f28f ARM: OMAP1: select CONFIG_GENERIC_IR=
Q_CHIP)
Merging kvm-fixes/master (d3d0b8dfe060 Merge tag 'kvm-x86-fixes-6.14-rcN' o=
f https://github.com/kvm-x86/linux into HEAD)
Merging kvms390-fixes/master (e376d958871c KVM: s390: selftests: Add has de=
vice attr check to uc_attr_mem_limit selftest)
Merging hwmon-fixes/hwmon (f9e5312b6269 hwmon: (peci/dimmtemp) Do not provi=
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
Merging devicetree-fixes/dt/linus (038e33fcd40e dt-bindings: display: Add p=
owertip,{st7272|hx8238a} as DT Schema description)
Merging dt-krzk-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging scsi-fixes/fixes (f27a95845b01 scsi: ufs: core: bsg: Fix crash when=
 arpmb command fails)
Merging drm-fixes/drm-fixes (9a1cd7d6df5d Merge tag 'drm-msm-fixes-2025-02-=
20' of https://gitlab.freedesktop.org/drm/msm into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (8058b49bf6ff drm/i915/dp: Fix=
 disabling the transcoder function in 128b/132b mode)
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
Merging gpio-brgl-fixes/gpio/for-current (96fa9ec477ff gpiolib: don't bail =
out if get_direction() fails in gpiochip_add_data())
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
Merging efi-fixes/urgent (cb6ae457bc6a efivarfs: Defer PM notifier registra=
tion until .fill_super)
Merging battery-fixes/fixes (98380110bd48 power: supply: axp20x_battery: Fi=
x fault handling for AXP717)
Merging iommufd-fixes/for-rc (2ca704f55e22 iommu/arm-smmu-v3: Improve uAPI =
comment for IOMMU_HW_INFO_TYPE_ARM_SMMUV3)
Merging rust-fixes/rust-fixes (0ad2507d5d93 Linux 6.14-rc3)
Merging w1-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging pmdomain-fixes/fixes (a64dcfb451e2 Linux 6.14-rc2)
Merging i2c-host-fixes/i2c/i2c-host-fixes (0ad2507d5d93 Linux 6.14-rc3)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (2014c95afece Linux 6.14-rc1)
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
Merging tip-fixes/tip/urgent (27102b38b8ca Merge tag 'v6.14-rc3-smb3-client=
-fix-part2' of git://git.samba.org/sfrench/cifs-2.6)
Merging slab-fixes/slab/for-next-fixes (b7ffecbe198e memcg: slub: fix SUnre=
claim for post charged objects)
Merging drm-msm-fixes/msm-fixes (73f69c6be2a9 drm/msm/dsi/phy: Do not overw=
ite PHY_CMN_CLK_CFG1 when choosing bitclk source)
Merging uml-fixes/fixes (96178631c3f5 um: convert irq_lock to raw spinlock)
Merging drm-misc-fixes/for-linux-next-fixes (511a3444f72e MAINTAINERS: Add =
entry for DMEM cgroup controller)
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (0ad2507d5d93 Linux 6.14-rc3)
Merging mm-nonmm-stable/mm-nonmm-stable (0ad2507d5d93 Linux 6.14-rc3)
Merging mm/mm-everything (b0504a3cec10 foo)
Merging kbuild/for-next (a77b570b6c3f modpost: use strstarts() to clean up =
parse_source_files())
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (4bac7fb58627 perf tools: Improve startup time=
 by reducing unnecessary stat() calls)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/for-next (aef7ee7649e0 dma-debug: fix physical address =
calculation for struct dma_debug_entry)
Merging asm-generic/master (0af8e32343f8 empty include/asm-generic/vga.h)
Merging alpha/alpha-next (1523226edda5 alpha: Use str_yes_no() helper in pc=
i_dac_dma_supported())
Merging arm/for-next (f520fab580c9 ARM: 9440/1: cacheinfo fix format field =
mask)
Merging arm64/for-next/core (a1c24ab82279 Merge branch 'for-next/el2-enable=
-feat-pmuv3p9' into for-next/core)
Merging arm-perf/for-next/perf (ba113ecad81a perf docs: arm_spe: Document n=
ew discard mode)
Merging arm-soc/for-next (e31e3f6c0ce4 soc: loongson: loongson2_guts: Add c=
heck for devm_kstrdup())
Merging amlogic/for-next (953913df9c3a Merge branch 'v6.15/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (ef3903f59a49 Merge branch 'asahi-soc/=
soc' into asahi-soc/for-next)
Merging aspeed/for-next (3540adcccc71 ARM: dts: aspeed: yosemite4: adjust s=
econdary flash name)
Merging at91/at91-next (2e60cf9d46df ARM: dts: microchip: sama7d65_curiosit=
y: Add power monitor support)
Merging broadcom/next (bdac656f1bb5 Merge branch 'devicetree/fixes' into ne=
xt)
Merging davinci/davinci/for-next (58abc69e479c ARM: dts: ti: davinci: Align=
 GPIO hog name with bindings)
Merging drivers-memory/for-next (b9c791c65ced Merge branch 'mem-ctrl-next' =
into for-next)
Merging imx-mxs/for-next (6b85642caf39 Merge branch 'imx/dt64' into for-nex=
t)
Merging mediatek/for-next (b7e3ba5f431d Merge branch 'v6.14-next/soc' into =
for-next)
Merging mvebu/for-next (960766b45fa2 arm64: dts: marvell: Add missing board=
 compatible for IEI-Puzzle-M801)
Merging omap/for-next (065f3bd4f22b Merge branch 'omap-for-v6.15/dt' into t=
mp/omap-next-20250205.163245)
Merging qcom/for-next (c177fed7617d Merge branches 'arm64-for-6.15', 'clk-f=
or-6.15', 'drivers-fixes-for-6.14' and 'drivers-for-6.15' into for-next)
Merging renesas/next (b91c46c79497 Merge branches 'renesas-arm-defconfig-fo=
r-v6.15', 'renesas-arm-soc-for-v6.15', 'renesas-drivers-for-v6.15', 'renesa=
s-dt-bindings-for-v6.15' and 'renesas-dts-for-v6.15' into renesas-next)
Merging reset/reset/next (2014c95afece Linux 6.14-rc1)
Merging rockchip/for-next (4e09afea6eb9 Merge branch 'v6.15-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (db9af58db84e Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (a3c7c02d3db2 Merge branches 'for-next/scmi/upd=
ates' and 'for-next/ffa/updates' of ssh://gitolite.kernel.org/pub/scm/linux=
/kernel/git/sudeep.holla/linux into for-linux-next)
Merging sophgo/for-next (f047a9285f9f riscv: sophgo: dts: add cooling maps =
for Milk-V Pioneer)
Merging spacemit/for-next (5b90a3d6092d riscv: dts: spacemit: Add Milk-V Ju=
piter board device tree)
Merging stm32/stm32-next (8c6d469f5249 ARM: dts: stm32: lxa-fairytux2: add =
Linux Automation GmbH FairyTux 2)
Merging sunxi/sunxi/for-next (e2d0b639a4d9 Merge branch 'sunxi/clk-for-6.15=
' into sunxi/for-next)
Merging tee/next (a7562ff02879 Merge branch 'optee_for_v6.14' into next)
Merging tegra/for-next (0a891b9fcd9b Merge branch for-6.14/arm64/dt into fo=
r-next)
Merging thead-dt/thead-dt-for-next (c95c1362e5bc riscv: dts: thead: Add mai=
lbox node)
Merging ti/ti-next (c7691aec5e99 arm64: defconfig: Enable TISCI Interrupt R=
outer and Aggregator)
Merging xilinx/for-next (d6ccf528cb3c Merge branch 'zynqmp/dt' into for-nex=
t)
Merging clk/clk-next (2014c95afece Linux 6.14-rc1)
Merging clk-imx/for-next (48806be08636 clk: imx: Apply some clks only for i=
.MX93)
Merging clk-renesas/renesas-clk (9b12504e8c8c clk: renesas: r9a09g047: Add =
CANFD clocks and resets)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (3011b29ec5a3 LoongArch: KVM: Set host wit=
h kernel mode when switch to VM mode)
Merging m68k/for-next (723be3c6ab31 m68k: sun3: Fix DEBUG_MMU_EMU build)
Merging m68knommu/for-next (5b7d600664da m68k: mm: Replace deprecated strnc=
py() with strscpy())
Merging microblaze/next (920354d7818b microblaze: Use of_property_present()=
 for non-boolean properties)
Merging mips/mips-next (e64d19ed82fd mips: dts: ralink: mt7620a: update sys=
tem controller node and its consumers)
Merging openrisc/for-next (ea1413e5b53a rseq/selftests: Add support for Ope=
nRISC)
Merging parisc-hd/for-next (4e3ff3c5854f parisc: Remove memcpy_fromio)
Merging powerpc/next (6aa989ab2bd0 powerpc/pseries/iommu: memory notifier i=
ncorrectly adds TCEs for pmemory)
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
Merging fs-next (92c7d25eccf6 Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (9022df7f5e05 Merge branch 'for-6.14-cpu_sync-fixup=
' into for-next)
Merging pci/next (3bdee909e45d Merge branch 'pci/misc')
Merging pstore/for-next/pstore (5674609535ba pstore: Change kmsg_bytes stor=
age size to u32)
Merging hid/for-next (594050682df1 Merge branch 'for-6.14/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (ef8c53714894 Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i2c-host/i2c/i2c-host (3c59e2039afc i2c: amd-asf: Set cmd variable =
when encountering an error)
Merging i3c/i3c/next (a892ee4cf22a i3c: master: svc: Flush FIFO before send=
ing Dynamic Address Assignment(DAA))
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (8df0f002827e hwmon: (xgene-hwmon) use app=
ropriate type for the latency value)
Merging jc_docs/docs-next (76a6782284df Documentation: input: Add section p=
ertaining to polled input devices)
Merging v4l-dvb/next (c2b96a681815 media: platform: allgro-dvt: unregister =
v4l2_device on the error path)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (ee3f0ada079d Merge branch 'fixes' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (f2d32942026c cpufreq: enable 12=
00Mhz clock speed for armada-37xx)
Merging cpupower/cpupower (80d3175a7e07 cpupower: monitor: Exit with error =
status if execvp() fail)
Merging devfreq/devfreq-next (f3253b23535f PM / devfreq: exynos: remove unu=
sed function parameter)
Merging pmdomain/next (6568cb40e731 pmdomain: imx: gpcv2: use proper helper=
 for property detection)
$ git reset --hard HEAD^
Merging next-20250219 version of pmdomain
Merging opp/opp/linux-next (2014c95afece Linux 6.14-rc1)
Merging thermal/thermal/linux-next (ecb642900deb dt-bindings: thermal: Corr=
ect indentation and style in DTS example)
Merging rdma/for-next (486055f5e09d RDMA/core: Fix best page size finding w=
hen it can cross SG entries)
Merging net-next/main (b66e19dcf684 Merge branch 'mctp-add-mctp-over-usb-ha=
rdware-transport-binding')
CONFLICT (content): Merge conflict in drivers/net/ethernet/cadence/macb_mai=
n.c
Merging bpf-next/for-next (d806176814b4 Merge branch 'bpf-next/net' into fo=
r-next)
Merging ipsec-next/master (e3aa43a50a64 xfrm: prevent high SEQ input in non=
-ESN mode)
Merging mlx5-next/mlx5-next (80df31f384b4 net/mlx5: Change POOL_NEXT_SIZE d=
efine value and make it global)
Merging netfilter-next/main (4e41231249f4 Merge branch '100GbE' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue)
Merging ipvs-next/main (4e41231249f4 Merge branch '100GbE' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/tnguy/next-queue)
Merging bluetooth/master (2fc8906de82f Bluetooth: hci_qca: use the power se=
quencer for wcn6750)
  2a509818ec2d ("Bluetooth: L2CAP: Fix L2CAP_ECRED_CONN_RSP response")
  980d6e2904df ("Bluetooth: Always allow SCO packets for user channel")
Merging wireless-next/for-next (c61da149b9c2 Merge tag 'rtw-next-2025-02-10=
-v2' of https://github.com/pkshih/rtw)
Merging ath-next/for-next (af1c6007a64e wifi: ath12k: Add missing htt_metad=
ata flag in ath12k_dp_tx())
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
Merging drm/drm-next (7b91683e7de7 Merge tag 'drm-misc-next-2025-02-20' of =
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next)
Merging drm-exynos/for-linux-next (81a50378559b drm/exynos: Remove unnecess=
ary checking)
Merging drm-misc/for-linux-next (acf3256160bd bus: mhi: host: Avoid possibl=
e uninitialized fw_load_type)
Merging amdgpu/drm-next (3521276ad14f drm/amdgpu: update the handle ptr in =
get_clockgating_state)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.c
Merging drm-intel/for-linux-next (5b99dd12fe53 drm/i915/hdcp: Create force_=
hdcp14 debug fs entry)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dp=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dp=
_mst.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_reg.h
Merging drm-msm/msm-next (866e43b945bf drm/msm: UAPI error reporting)
Merging drm-msm-lumag/msm-next-lumag (ca3524d40556 drm/msm/dpu: rate limit =
snapshot capture for mmu faults)
Merging drm-xe/drm-xe-next (98c9d27ab30a drm/xe/oa: Ensure that polled read=
 returns latest data)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/display/xe_display=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_gt_sriov_pf.c
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (c454bc716854 fbcon: Use correct erase colour for cl=
earing in fbcon)
Merging regmap/for-next (14b33926f576 Merge remote-tracking branch 'regmap/=
for-6.15' into regmap-next)
Merging sound/for-next (0f1f26c59196 ALSA: arm: aaci: Constify amba_id tabl=
e)
Merging ieee1394/for-next (1c745720bec2 drivers: firewire: firewire-cdev.h:=
 fix identation on a kernel-doc markup)
Merging sound-asoc/for-next (ccf62ac683c2 Merge remote-tracking branch 'aso=
c/for-6.15' into asoc-next)
Merging modules/modules-next (afa92869776a params: Annotate struct module_p=
aram_attrs with __counted_by())
Merging input/next (9995b98a4b2a MAINTAINERS: Add entries for Apple Z2 touc=
hscreen driver)
Merging block/for-next (17e7cdf2b8db Merge branch 'for-6.15/block' into for=
-next)
Merging device-mapper/for-next (a8b8a126c857 dm: Enable inline crypto passt=
hrough for striped target)
Merging libata/for-next (91ec84f8eadd ata: libata-eh: Do not use ATAPI DMA =
for a device limited to PIO mode)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (cb71db3b2cea mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (bd3152428217 dt-bindings: mfd: qcom,tcsr: Add com=
patible for MSM8937)
Merging backlight/for-backlight-next (d1ebaf003a06 MAINTAINERS: Add entries=
 for Apple DWI backlight controller)
Merging battery/for-next (0c3cbeb89c49 power: supply: sc27xx: use devm_kmem=
dup_array())
Merging regulator/for-next (c80657ac85dc Merge remote-tracking branch 'regu=
lator/for-6.15' into regulator-next)
Merging security/next (4632cd0ec3fa lsm: fix a missing security_uring_allow=
ed() prototype)
Merging apparmor/apparmor-next (3e45553acb14 apparmor: Remove unused variab=
le 'sock' in __file_sock_perm())
Merging integrity/next-integrity (57a0ef02fefa ima: Reset IMA_NONACTION_RUL=
E_FLAGS after post_setattr)
Merging selinux/next (5fc80fb5b776 selinux: always check the file label in =
selinux_kernel_read_file())
Merging smack/next (a158a937d864 smack: recognize ipv4 CIPSO w/o categories)
Merging tomoyo/master (09fbf3d50205 Merge tag 'tomoyo-pr-20250211' of git:/=
/git.code.sf.net/p/tomoyo/tomoyo)
Merging tpmdd/next (34c26c5e1cb0 tpm: do not start chip while suspended)
Merging watchdog/master (0ad2507d5d93 Linux 6.14-rc3)
Merging iommu/next (1485fa1aadcd Merge branches 'apple/dart' and 's390' int=
o next)
Merging audit/next (2014c95afece Linux 6.14-rc1)
Merging devicetree/for-next (7526e4fe550f dt-bindings: trivial-devices: Add=
 ti,tps546b24)
Merging dt-krzk/for-next (854a080f0b73 loongarch: dts: remove non-existent =
DAC from 2k1000-ref)
Merging mailbox/for-next (4783ce32b080 riscv: export __cpuid_to_hartid_map)
Merging spi/for-next (155caaddc3e2 Merge remote-tracking branch 'spi/for-6.=
15' into spi-next)
Merging tip/master (82ede9c3e341 Merge branch into tip/master: 'x86/platfor=
m')
CONFLICT (content): Merge conflict in arch/riscv/include/asm/io.h
Merging clockevents/timers/drivers/next (fafc3058cc2f dt-bindings: timer: e=
xynos4210-mct: Add samsung,exynos990-mct compatible)
Merging edac/edac-for-next (b3205f5a415b Merge branch 'edac-drivers' into e=
dac-for-next)
Merging ftrace/for-next (264143c4e544 ftrace: Have ftrace pages output refl=
ect freed pages)
Merging rcu/next (83ad40ba2e4a Merge branches 'docs.2025.02.04a', 'lazypree=
mpt.2025.02.20a', 'misc.2025.02.06a', 'srcu.2025.02.05a' and 'torture.2025.=
02.05a')
Merging paulmck/non-rcu/next (de3ac915f986 tools/memory-model: Distinguish =
between syntactic and semantic tags)
Merging kvm/next (d3d0b8dfe060 Merge tag 'kvm-x86-fixes-6.14-rcN' of https:=
//github.com/kvm-x86/linux into HEAD)
Merging kvm-arm/next (01009b06a6b5 arm64/sysreg: Get rid of TRFCR_ELx Sysre=
gFields)
Merging kvms390/next (32239066776a KVM: s390: selftests: Streamline uc_skey=
 test to issue iske after sske)
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (d252435aca44 riscv: KVM: Remove unnecessa=
ry vcpu kick)
Merging kvm-x86/next (fed48e2967f4 Merge branches 'fixes', 'misc', 'mmu', '=
pvclock', 'selftests', 'selftests_6.14', 'svm' and 'xen')
Merging xen-tip/linux-next (75ad02318af2 Xen/swiotlb: mark xen_swiotlb_fixu=
p() __init)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (8221fd1a7304 workqueue: Log additional details=
 when rejecting work)
Merging sched-ext/for-next (a7d8e69496ef Merge branch 'for-6.15' into for-n=
ext)
Merging drivers-x86/for-next (d497c47481f8 platform/x86: ideapad-laptop: us=
e dev_groups to register attribute groups)
Merging chrome-platform/for-next (9fc83373f0ff platform/chrome: cros_ec_typ=
ec: Add support for setting USB mode via sysfs)
Merging chrome-platform-firmware/for-firmware-next (2014c95afece Linux 6.14=
-rc1)
Merging hsi/for-next (40384c840ea1 Linux 6.13-rc1)
Merging leds-lj/for-leds-next (012825dbd5aa Revert "leds-pca955x: Remove th=
e unused function pca95xx_num_led_regs()")
Merging ipmi/for-next (83d8c79aa958 ipmi: ssif_bmc: Fix new request loss wh=
en bmc ready for a response)
Merging driver-core/driver-core-next (c5020c5be9d2 kernfs: Move dput() outs=
ide of the RCU section.)
Merging usb/usb-next (c749f058b437 USB: core: Add eUSB2 descriptor and pars=
ing in USB core)
CONFLICT (content): Merge conflict in drivers/usb/typec/ucsi/ucsi_acpi.c
Merging thunderbolt/next (35ad0d62da83 MAINTAINERS: Use my kernel.org addre=
ss for USB4/Thunderbolt work)
Merging usb-serial/usb-next (6a7713ec5337 USB: serial: mos7840: drop unused=
 defines)
Merging tty/tty-next (d2fa8e52cf91 serial: xilinx_uartps: Switch to use hrt=
imer_setup())
  7ba2facc3f91 ("serial: sh-sci: Switch to use hrtimer_setup()")
  8cb44188b986 ("serial: amba-pl011: Switch to use hrtimer_setup()")
  a2d1afe65a15 ("serial: xilinx_uartps: Use helper function hrtimer_update_=
function()")
  afa51660033c ("serial: imx: Switch to use hrtimer_setup()")
  d2fa8e52cf91 ("serial: xilinx_uartps: Switch to use hrtimer_setup()")
  d45545c32904 ("serial: 8250: Switch to use hrtimer_setup()")
Merging char-misc/char-misc-next (264ff8415aed ABI: pps: Add ABI documentat=
ion for Intel TIO)
  74826b3fd7d2 ("sonypi: Use str_on_off() helper in sonypi_display_info()")
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (b47d1fcd0d4b Documentation: coresight: Panic suppor=
t)
Merging fastrpc/for-next (2014c95afece Linux 6.14-rc1)
Merging fpga/for-next (cc1eb048e7ee fpga: m10bmc-sec: update email address =
for Peter Colberg)
Merging icc/icc-next (4cc004716977 Merge branch 'icc-sm8750' into icc-next)
Merging iio/togreg (66e80e2f2176 iio: resolver: ad2s1210: use bitmap_write)
Merging phy-next/next (7dff18535b93 phy: PHY_LAN966X_SERDES should depend o=
n SOC_LAN966 || MCHP_LAN966X_PCI)
Merging soundwire/next (aac2f8363f77 soundwire: slave: fix an OF node refer=
ence leak in soundwire slave device)
Merging extcon/extcon-next (7041ed0dde83 extcon: Drop explicit initializati=
on of struct i2c_device_id::driver_data to 0)
Merging gnss/gnss-next (0ad2507d5d93 Linux 6.14-rc3)
Merging vfio/next (2bb447540e71 vfio/nvgrace-gpu: Add GB200 SKU to the devi=
d table)
Merging w1/for-next (33c145297840 w1: w1_therm: w1: Use HWMON_CHANNEL_INFO =
macro to simplify code)
Merging spmi/spmi-next (40384c840ea1 Linux 6.13-rc1)
Merging staging/staging-next (20a351c36afc staging: gpib: tnt4882 console m=
essaging cleanup)
Merging counter-next/counter-next (c2a756660324 counter: ti-eqep: add direc=
tion support)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (2c17e9ea0caa dmaengine: idxd: Delete unnecessary NU=
LL check)
CONFLICT (modify/delete): Documentation/devicetree/bindings/misc/atmel-ssc.=
txt deleted in HEAD and modified in dmaengine/next.  Version dmaengine/next=
 of Documentation/devicetree/bindings/misc/atmel-ssc.txt left in tree.
$ git rm -f Documentation/devicetree/bindings/misc/atmel-ssc.txt
Merging cgroup/for-next (d920908fe36c Merge branch 'for-6.14-fixes' into fo=
r-next)
Merging scsi/for-next (f6d13738292e Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (1d67c48947c6 Merge patch series "scsi: scsi_debu=
g: Add more tape support")
$ git reset --hard HEAD^
Merging next-20250221 version of scsi-mkp
Merging vhost/linux-next (5820a3b08987 virtio_blk: Add support for transpor=
t error recovery)
Merging rpmsg/for-next (a64dcfb451e2 Linux 6.14-rc2)
Merging gpio-brgl/gpio/for-next (db305161880a gpio: regmap: Allow ngpio to =
be read from the property)
Merging gpio-intel/for-next (9deb15de8ca2 Merge patch series "Split devres =
APIs to device/devres.h and introduce devm_kmemdup_array()")
Merging pinctrl/for-next (d01895c5b118 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (0eee258cdf17 pinctrl: intel: Fix wrong bypa=
ss assignment in intel_pinctrl_probe_pwm())
Merging pinctrl-renesas/renesas-pinctrl (ea4065345643 pinctrl: renesas: rzg=
2l: Suppress binding attributes)
Merging pinctrl-samsung/for-next (574d0f2120b8 pinctrl: samsung: add exynos=
2200 SoC pinctrl configuration)
Merging pwm/pwm/for-next (e8af7c083520 pwm: Strengthen dependency for PWM_S=
IFIVE)
Merging ktest/for-next (f3a30016e4b5 ktest.pl: Fix typo "accesing")
Merging kselftest/next (e35896f236f2 selftests/tracing: Allow some more tes=
ts to run in instances)
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
Merging seccomp/for-next/seccomp (e1cec5107c39 seccomp: remove the 'sd' arg=
ument from __seccomp_filter())
Merging slimbus/for-next (2014c95afece Linux 6.14-rc1)
Merging nvmem/for-next (d0ee061dec06 nvmem: make the misaligned raw_len non=
-fatal)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (21cfcbeb7bff hyperv: Add CONFIG_MSHV_ROOT to ga=
te root partition support)
Merging auxdisplay/for-next (fce85f3da08b auxdisplay: MAX6959 should select=
 BITREVERSE)
Merging kgdb/kgdb/for-next (6beaa75cd24d kdb: Remove unused flags stack)
Merging hmm/hmm (40384c840ea1 Linux 6.13-rc1)
Merging cfi/cfi/next (2014c95afece Linux 6.14-rc1)
Merging mhi/mhi-next (cba6bdfd7929 bus: mhi: host: pci_generic: Add support=
 for SA8775P endpoint)
Merging memblock/for-next (98b7beba1ee6 memblock: uniformly initialize all =
reserved pages to MIGRATE_MOVABLE)
Merging cxl/next (2bb67004903c tools/testing/cxl: Set Shutdown State suppor=
t)
Merging efi/next (fb84cefd4ce7 x86/efi/mixed: Move mixed mode startup code =
into libstub)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (c6bb909b8f11 Merge branch 'slab/for-6.15/kfree_=
rcu_tiny' into slab/for-next)
CONFLICT (content): Merge conflict in kernel/rcu/tiny.c
Merging random/master (93354d866ac4 prandom: remove next_pseudo_random32)
Merging landlock/next (78332fdb956f selftests/landlock: Add binaries to .gi=
tignore)
Merging rust/rust-next (beeb78d46249 MAINTAINERS: add Danilo Krummrich as R=
ust reviewer)
Merging sysctl/sysctl-next (ae9ebda1bc32 selftests: fix spelling/grammar er=
rors in sysctl/sysctl.sh)
CONFLICT (content): Merge conflict in kernel/sysctl.c
Merging execve/for-next/execve (9a3e62e7aff1 Merge branch 'for-next/topic/e=
xecve/core' into for-next/execve)
Applying: fix up for "coredump: Only sort VMAs when truncating or core_sort=
_vma sysctl is set"
Merging bitmap/bitmap-for-next (ea5fa879a1d4 cpumask: drop cpumask_next_wra=
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

--Sig_/W+KWzIz0s1mzmx/5aY=3Nro
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme8Pr0ACgkQAVBC80lX
0GxevwgApT80YjJgWcaM6Suw9y7srMxNlU1dJwNwH2k3vhy1Yj+aoZb0PqsNcZD+
KX2OMCBLVogxF/CW7o4Ngv4ESvcavWrOCBWRPblV3gtywkrNqI1C+ULJ8NlGW6xi
lJ+PDzpG1jx/r2I8GUB0hTv5CwDaphGfPisUB+abPNnY+fAJyNi69JF6FEed69W5
xCZCFy9GbgP0rVWVc8BCTwl+7eFVCQg9No9qlXw2wckmIXl7Y07v6PBLjsFwSria
FM2FnnrizuflWTC5d05vtGtHGs0p5BmWP8m3Eur2GM5tKtPUQVIoVVsSOVUtMbQE
drTwJnZhnPHRrEUZB64a+1fMxvD2Qw==
=6glO
-----END PGP SIGNATURE-----

--Sig_/W+KWzIz0s1mzmx/5aY=3Nro--

