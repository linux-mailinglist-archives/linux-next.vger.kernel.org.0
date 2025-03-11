Return-Path: <linux-next+bounces-5735-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 526D3A5BEBD
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 12:19:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A5B218937B3
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 11:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43ACA250C1D;
	Tue, 11 Mar 2025 11:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="da7ghazz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EF4227B94;
	Tue, 11 Mar 2025 11:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741691948; cv=none; b=n9Y64+wzD3AOEdyqE6aUSRGdhXC8aSk9PtPwgXAJTSkitDxFRdELnOILpBwBk3FGQKx4k2nSI/cTm8FT+gAhgzfDZ77jYqcH56A8VScxglHgsnpGsXHrvDyDmMBpN3SIpiuG281J30p1RyltG5XrexSQZ10UAamxZ4bewCw6WEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741691948; c=relaxed/simple;
	bh=XQomTKN67o5nqeza4Z/pVSrpG7gYx2FNcxQ49f3NGAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AEQUxBuJJqB++zEeWpzak8ZpB4kWcroVjtd7QOcmW25rkFh4iPMzyH9smmA1XlIfDrI4OwGUlUelpOhgaySo/Aow+CZu6XsqEIJqyzaYfwFw+Jyzo0q26MTq2CqgU1zSf28T9AbupSbYlgpx5XMu+xh3G+V1hJFJ3fFM3KCap/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=da7ghazz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741691938;
	bh=7zxuKNC2mESQd8afPJNpLLfe7A8DTJVsqoUiRfq9oKY=;
	h=Date:From:To:Cc:Subject:From;
	b=da7ghazze76SA9VmSorsCGl8lQLS/OUkb5UVoO4dtiZeR8qL6APPwgj19uYfQnUJa
	 u4uQuPEtoINy7r7hhvChZxJ2R+K3GjOFrIMO5H48/ud2gvT9RW67ZoMGNQD/ex/DVm
	 T0nk0tScjeN/Vy/lBewOb4Ru5k2bqhQloyY76pHS7e1PZFHWqWVy2tybwC7fyIO+FS
	 3PZZ/zgteRPtF45t6ykCwALeltgHZai/L0SCkYK3e9S9yET7coc2lmY+w59BC5E0VQ
	 vp28BGYxTovo9m2EGiLr9mXhav8Maxw1pfCDPcToLc6Ii9SIphCJe9374pL6tHsN9Q
	 UQS55YwRw58SA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZBrqk5GyLz4x3p;
	Tue, 11 Mar 2025 22:18:58 +1100 (AEDT)
Date: Tue, 11 Mar 2025 22:18:57 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 11
Message-ID: <20250311221857.62665ee9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bOYfkrHK4QDXWoSJQuUojNR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bOYfkrHK4QDXWoSJQuUojNR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250307:

New tree: rust-alloc

The mm tree gained a build failure for which I reverted 2 commits.

The net-next tree gained a conflict against the net tree.

The bpf-next tree gained a conflict against the mm tree.

The bluetooth tree lost its build failures.

The drm-msm tree lost its build failure.

The watchdog tree gained a build failure for which I applied a patch.

The tip tree still had its build failure so I used the version from
next-20250303.

The ftrace tree gained a conflict against the tip tree and a build
failure so I used the version from next-20250307.

The scsi tree gained a conflict against the rockchip tree.

The rust tree gained a conflict against the drm tree.

The sysctl tree gained a conflict against the mm tree.

Non-merge commits (relative to Linus' tree): 9368
 9548 files changed, 514510 insertions(+), 189760 deletions(-)

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

I am currently merging 387 trees (counting Linus' and 147 trees of bug
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
Merging origin/master (4d872d51bc9d Merge tag 'x86-urgent-2025-03-10' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging fixes/fixes (fac04efc5c79 Linux 6.13-rc2)
Merging ext4-fixes/fixes (4bbf9020becb Linux 6.13-rc4)
Merging vfs-brauner-fixes/vfs.fixes (accdd1198eaa Merge afs RCU pathwalk fi=
x)
Merging fscrypt-current/for-current (2014c95afece Linux 6.14-rc1)
Merging fsverity-current/for-current (2014c95afece Linux 6.14-rc1)
Merging btrfs-fixes/next-fixes (e83be4ca3b94 Merge branch 'misc-6.14' into =
next-fixes)
Merging vfs-fixes/fixes (93b6a8f76084 qibfs: fix _another_ leak)
Merging erofs-fixes/fixes (6422cde1b0d5 erofs: use buffered I/O for file-ba=
cked mounts by default)
Merging nfsd-fixes/nfsd-fixes (4990d098433d NFSD: Fix CB_GETATTR status fix)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (228a1157fb9f Merge tag '6.13-rc-part1-SM=
B3-client-fixes' of git://git.samba.org/sfrench/cifs-2.6)
Merging bcachefs/for-next (06ae8829c7ec bcachefs: trace_stripe_create)
Merging fscrypt/for-next (13dc8eb90067 fscrypt: mention init_on_free instea=
d of page poisoning)
Merging btrfs/for-next (32c579bf954d Merge branch 'for-next-next-v6.14-2025=
0310' into for-next-20250310)
Merging ceph/master (3981be13ec1b ceph: exchange hardcoded value on NAME_MA=
X)
Merging cifs/for-next (994bf196b745 smb: client: Fix netns refcount imbalan=
ce causing leaks and use-after-free)
Merging configfs/for-next (84147f4e84c4 configfs: improve item creation per=
formance)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (a3672304abf2 dlm: fix error if active rsb is not hashed)
Merging erofs/dev (463a645b39e1 erofs: enable 48-bit layout support)
Merging exfat/dev (e4b343c1706f exfat: remove count used cluster from exfat=
_statfs())
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (a7624ccdef4f ext2: Make ext2_params_spec static)
Merging ext4/dev (9e28059d5664 ext4: introduce linear search for dentries)
Merging f2fs/dev (8a2d9f00d502 f2fs: set highest IO priority for checkpoint=
 thread)
Merging fsverity/for-next (a19bcde49998 Revert "fsverity: relax build time =
dependency on CRYPTO_SHA256")
Merging fuse/for-next (bea8ae66d5e6 fuse: Increase FUSE_NAME_MAX to PATH_MA=
X)
Merging gfs2/for-next (0776a508d1d4 gfs2: Convert gfs2_meta_read_endio() to=
 use a folio)
Merging jfs/jfs-next (0d250b1c5248 fs/jfs: consolidate sanity checking in d=
bMount)
Merging ksmbd/ksmbd-for-next (204e557af3b9 ksmbd: Use str_read_write() and =
str_true_false() helpers)
Merging nfs/linux-next (7eb172143d55 Linux 6.14-rc5)
Merging nfs-anna/linux-next (9084ed79ddaa lsm,nfs: fix memory leak of lsm_c=
ontext)
Merging nfsd/nfsd-next (87480a8ce567 sysctl: Fixes nsm_local_state bounds)
Merging ntfs3/master (8b12017c1b95 fs/ntfs3: Remove unused ntfs_flush_inode=
s)
Merging orangefs/for-next (96319dacaf15 orangefs: Constify struct kobj_type)
Merging overlayfs/overlayfs-next (c8b359dddb41 ovl: Filter invalid inodes w=
ith missing lookup function)
Merging ubifs/next (69146a8c893f ubi: ubi_get_ec_info: Fix compiling error =
'cast specifies array type')
Merging v9fs/9p-next (a22a29655c42 net/9p/fd: support ipv6 for trans=3Dtcp)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (32f6987f9384 Merge branch 'xfs-6.15-merge' into for-n=
ext)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging vfs-brauner/vfs.all (5f7f601674cd Merge branch 'vfs-6.15.orangefs' =
into vfs.all)
Merging vfs/for-next (2e72b1e0aac2 Merge branch 'work.d_revalidate' into fo=
r-next)
Merging mm-hotfixes/mm-hotfixes-unstable (de4d4b19d5c7 mm: page_isolation: =
avoid calling folio_hstate() without hugetlb_lock)
Merging fs-current (922949f9a002 Merge branch 'fixes' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging kbuild-current/fixes (b5e395653546 kbuild: install-extmod-build: Fi=
x build when specifying KBUILD_OUTPUT)
Merging arc-current/for-curr (78d4f34e2115 Linux 6.13-rc3)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (eed6bfa8b282 arm64: hugetlb: Fix flush_=
hugetlb_tlb_range() invalidation level)
Merging arm-soc-fixes/arm/fixes (98f3ab18a0a5 ARM: OMAP1: select CONFIG_GEN=
ERIC_IRQ_CHIP)
Merging davinci-current/davinci/for-current (2014c95afece Linux 6.14-rc1)
Merging drivers-memory-fixes/fixes (304e6c02b76f memory: omap-gpmc: drop no=
 compatible check)
Merging sophgo-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging m68k-current/for-linus (bb2e0fb1e6aa m68k: libgcc: Fix lvalue abuse=
 in umul_ppmm())
Merging powerpc-fixes/fixes (eff2eb592efd cxl: Fix cross-reference in docum=
entation and add deprecation warning)
Merging s390-fixes/fixes (b4a1dec11793 s390/ftrace: Fix return address reco=
very of traced function)
Merging net/main (77b2ab31fc65 MAINTAINERS: sfc: remove Martin Habets)
Merging bpf/master (6ccf6adb05d0 xsk: Fix __xsk_generic_xmit() error code w=
hen cq is full)
Merging ipsec/master (0aae2867aa60 xfrm_output: Force software GSO only in =
tunnel mode)
Merging netfilter/main (77b2ab31fc65 MAINTAINERS: sfc: remove Martin Habets)
Merging ipvs/main (1438f5d07b9a rtnetlink: fix netns leak with rtnl_setlink=
())
Merging wireless/for-next (72d520476a2f wifi: cfg80211: cancel wiphy_work b=
efore freeing wiphy)
Merging ath/for-current (3640dbc1f75c wifi: iwlwifi: Fix A-MSDU TSO prepara=
tion)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (e8e6087c2f74 RDMA/bnxt_re: Fix reporting maximum=
 SRQs on P7 chips)
Merging sound-current/for-linus (8463d2adbe19 ALSA: hda/realtek: Add suppor=
t for ASUS Zenbook UM3406KA Laptops using CS35L41 HDA)
Merging sound-asoc-fixes/for-linus (0704a15b930c ASoC: amd: yc: Support mic=
 on another Lenovo ThinkPad E16 Gen 2 model)
Merging regmap-fixes/for-linus (32ffed055dce regmap-irq: Add missing kfree(=
))
Merging regulator-fixes/for-linus (1c81a8c78ae6 regulator: core: Fix deadlo=
ck in create_regulator())
Merging spi-fixes/for-linus (91cf42c63f2d spi: microchip-core: prevent RX o=
verflows when transmit size > FIFO size)
Merging pci-current/for-linus (2014c95afece Linux 6.14-rc1)
Merging driver-core.current/driver-core-linus (80e54e84911a Linux 6.14-rc6)
Merging tty.current/tty-linus (0ad2507d5d93 Linux 6.14-rc3)
Merging usb.current/usb-linus (ac00bc2aeeac Merge tag 'thunderbolt-for-v6.1=
4-rc7' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunde=
rbolt into usb-linus)
Merging usb-serial-fixes/usb-linus (6232f0d8e100 USB: serial: option: fix T=
elit Cinterion FE990A name)
Merging phy/fixes (7eb172143d55 Linux 6.14-rc5)
Merging staging.current/staging-linus (2014c95afece Linux 6.14-rc1)
Merging iio-fixes/fixes-togreg (544eceeb10c9 iio: accel: adxl367: fix setti=
ng odr for activity time update)
Merging counter-current/counter-current (c0c9c7343466 counter: microchip-tc=
b-capture: Fix undefined counter channel state on probe)
Merging char-misc.current/char-misc-linus (80e54e84911a Linux 6.14-rc6)
Merging soundwire-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging thunderbolt-fixes/fixes (502843396ec2 thunderbolt: Prevent use-afte=
r-free in resume from hibernate)
Merging input-current/for-linus (fd10709e28d2 MAINTAINERS: Remove myself fr=
om the goodix touchscreen maintainers)
Merging crypto-current/master (9d4f8e54cef2 rhashtable: Fix rhashtable_try_=
insert test)
Merging vfio-fixes/for-linus (09dfc8a5f2ce vfio/pci: Fallback huge faults f=
or unaligned pfn)
Merging kselftest-fixes/fixes (a64dcfb451e2 Linux 6.14-rc2)
Merging dmaengine-fixes/fixes (7eb172143d55 Linux 6.14-rc5)
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
Merging kvm-fixes/master (ea9bd29a9c0d Merge tag 'kvm-x86-fixes-6.14-rcN.2'=
 of https://github.com/kvm-x86/linux into HEAD)
Merging kvms390-fixes/master (e376d958871c KVM: s390: selftests: Add has de=
vice attr check to uc_attr_mem_limit selftest)
Merging hwmon-fixes/hwmon (10fce7ebe888 hwmon: fix a NULL vs IS_ERR_OR_NULL=
() check in xgene_hwmon_probe())
Merging nvdimm-fixes/libnvdimm-fixes (265e98f72bac acpi: nfit: vmalloc-out-=
of-bounds Read in acpi_nfit_ctl)
Merging cxl-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging dma-mapping-fixes/for-linus (78b2770c935f dma-mapping: fix tracing =
dma_alloc/free with vmalloc'd memory)
Merging drivers-x86-fixes/fixes (376a8c2a1443 platform/x86/amd/pmf: Update =
PMF Driver for Compatibility with new PMF-TA)
Merging samsung-krzk-fixes/fixes (53517a70873c clk: samsung: update PLL loc=
ktime for PLL142XX used on FSD platform)
Merging pinctrl-samsung-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging devicetree-fixes/dt/linus (75f1f311d883 Revert "of: reserved-memory=
: Fix using wrong number of cells to get property 'alignment'")
Merging dt-krzk-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging scsi-fixes/fixes (f27a95845b01 scsi: ufs: core: bsg: Fix crash when=
 arpmb command fails)
Merging drm-fixes/drm-fixes (80e54e84911a Linux 6.14-rc6)
Merging drm-intel-fixes/for-linux-next-fixes (6266f4a78131 drm/i915/cdclk: =
Do cdclk post plane programming later)
Merging mmc-fixes/fixes (3e68abf2b9ce mmc: mtk-sd: Fix register settings fo=
r hs400(es) mode)
Merging rtc-fixes/rtc-fixes (2014c95afece Linux 6.14-rc1)
Merging gnss-fixes/gnss-linus (0ad2507d5d93 Linux 6.14-rc3)
Merging hyperv-fixes/hyperv-fixes (73fe9073c0cc Drivers: hv: vmbus: Don't r=
elease fb_mmio resource in vmbus_free_mmio())
Merging risc-v-fixes/fixes (245aece3750d MAINTAINERS: Add myself as a riscv=
 reviewer)
Merging riscv-dt-fixes/riscv-dt-fixes (1b133129ad6b riscv: dts: starfive: F=
ix a typo in StarFive JH7110 pin function definitions)
Merging riscv-soc-fixes/riscv-soc-fixes (2014c95afece Linux 6.14-rc1)
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (2014c95afece Linux 6.14-rc1)
Merging gpio-brgl-fixes/gpio/for-current (80e54e84911a Linux 6.14-rc6)
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
Merging rust-fixes/rust-fixes (6fbafe1cbed1 rust: task: fix `SAFETY` commen=
t in `Task::wake_up`)
Merging w1-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging pmdomain-fixes/fixes (ef17b519088e pmdomain: amlogic: fix T7 ISP se=
cpower)
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
Merging tip-fixes/tip/urgent (6ad6b27d95d5 Merge branch into tip/master: 's=
ched/urgent')
Merging slab-fixes/slab/for-next-fixes (dfd3df31c9db mm/slab/kvfree_rcu: Sw=
itch to WQ_MEM_RECLAIM wq)
Merging drm-msm-fixes/msm-fixes (73f69c6be2a9 drm/msm/dsi/phy: Do not overw=
ite PHY_CMN_CLK_CFG1 when choosing bitclk source)
Merging uml-fixes/fixes (96178631c3f5 um: convert irq_lock to raw spinlock)
Merging drm-misc-fixes/for-linux-next-fixes (de93ddf88088 drm/atomic: Filte=
r out redundant DPMS calls)
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (80e54e84911a Linux 6.14-rc6)
Merging mm-nonmm-stable/mm-nonmm-stable (80e54e84911a Linux 6.14-rc6)
Merging mm/mm-everything (5aad1c83f922 foo)
  067d21596458 ("x86/vmemmap: use direct-mapped VA instead of vmemmap-based=
 VA")
  081b931aebf3 ("mm/hugetlb_vmemmap: fix memory loads ordering")
  09b56a27b61c ("squashfs: fix invalid pointer dereference in squashfs_cach=
e_delete")
  1205c662429b ("mm/damon/core: initialize damos->walk_completed in damon_n=
ew_scheme()")
  21b7267a4eea ("filemap: move prefaulting out of hot write path")
  23d9a92f037b ("mm/hugetlb: fix surplus pages in dissolve_free_huge_page()=
")
  3763cd6d5d60 ("mm: memcontrol: fix swap counter leak from offline cgroup")
  46aba54a8c86 ("mm/damon: respect core layer filters' allowance decision o=
n ops layer")
  63593f5862a2 ("mm: page_isolation: avoid calling folio_hstate() without h=
ugetlb_lock")
  6d9925f95533 ("mm/migrate: fix shmem xarray update during migration")
  94ac46804164 ("selftests/mm: run_vmtests.sh: fix half_ufd_size_MB calcula=
tion")
  989dfcc148ab ("mm/vma: do not register private-anon mappings with khugepa=
ged during mmap")
  c5a8529b5fe0 ("proc: fix UAF in proc_get_inode()")
  cb2064a8de4d ("mm: fix error handling in __filemap_get_folio() with FGP_N=
OWAIT")
CONFLICT (content): Merge conflict in include/linux/damon.h
CONFLICT (content): Merge conflict in mm/damon/paddr.c
CONFLICT (content): Merge conflict in mm/memcontrol.c
Merging kbuild/for-next (a77b570b6c3f modpost: use strstarts() to clean up =
parse_source_files())
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (36e7748d33bf perf tests: Fix data symbol test=
 with LTO builds)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/for-next (aef7ee7649e0 dma-debug: fix physical address =
calculation for struct dma_debug_entry)
Merging asm-generic/master (51d1826adbe1 alpha: fix ioread64/iowrite64 macr=
os)
Merging alpha/alpha-next (1523226edda5 alpha: Use str_yes_no() helper in pc=
i_dac_dma_supported())
Merging arm/for-next (f520fab580c9 ARM: 9440/1: cacheinfo fix format field =
mask)
Merging arm64/for-next/core (13bfadb7f7f2 Merge branches 'for-next/amuv1-av=
g-freq', 'for-next/pkey_unrestricted', 'for-next/sysreg', 'for-next/pgtable=
-cleanups', 'for-next/kselftest', 'for-next/uaccess-mops', 'for-next/pie-po=
e-cleanup' and 'for-next/cputype-kryo' into for-next/core)
Merging arm-perf/for-next/perf (7f35b429802a perf/dwc_pcie: fix duplicate p=
ci_dev devices)
Merging arm-soc/for-next (a84db892511a soc: document merges)
Merging amlogic/for-next (73e4ffb27bb8 Merge branch 'v6.15/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (00a97a7f66d2 Merge branch 'asahi-soc/=
soc' into asahi-soc/for-next)
Merging aspeed/for-next (3540adcccc71 ARM: dts: aspeed: yosemite4: adjust s=
econdary flash name)
Merging at91/at91-next (a8aab30697c5 Merge branch 'at91-dt' into at91-next)
Merging broadcom/next (bdac656f1bb5 Merge branch 'devicetree/fixes' into ne=
xt)
Merging davinci/davinci/for-next (58abc69e479c ARM: dts: ti: davinci: Align=
 GPIO hog name with bindings)
Merging drivers-memory/for-next (90a0fbaac4a5 memory: mtk-smi: Add ostd set=
ting for mt8192)
Merging imx-mxs/for-next (a76206a60d15 Merge branch 'imx/dt64' into for-nex=
t)
Merging mediatek/for-next (a8a297e8bb3d Merge branch 'v6.14-next/soc' into =
for-next)
Merging mvebu/for-next (814ae20ada2c ARM: dts: marvell: armada: Align GPIO =
hog name with bindings)
Merging omap/for-next (065f3bd4f22b Merge branch 'omap-for-v6.15/dt' into t=
mp/omap-next-20250205.163245)
Merging qcom/for-next (b098bcd8278b Merge branches 'arm32-for-6.15', 'arm64=
-defconfig-for-6.15', 'arm64-fixes-for-6.14', 'arm64-for-6.15', 'clk-fixes-=
for-6.14', 'clk-for-6.15', 'drivers-fixes-for-6.14' and 'drivers-for-6.15' =
into for-next)
Merging renesas/next (1756f54e0750 Merge branch 'renesas-dts-for-v6.15' int=
o renesas-next)
Merging reset/reset/next (2014c95afece Linux 6.14-rc1)
Merging rockchip/for-next (7688f0a76b15 Merge branch 'v6.15-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (f0dbe0d40d08 Merge branch 'next/soc' into fo=
r-next)
Merging scmi/for-linux-next (31d6f5212bcd Merge branch 'for-next/scmi/fixes=
', tags 'scmi-updates-6.15', 'juno-updates-6.15', 'ffa-updates-6.15' and 's=
mccc-update-6.15' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/sud=
eep.holla/linux into for-linux-next)
Merging sophgo/for-next (5277657d5383 riscv: dts: sophgo: sg2042: add pinct=
rl support)
Merging spacemit/for-next (5b90a3d6092d riscv: dts: spacemit: Add Milk-V Ju=
piter board device tree)
Merging stm32/stm32-next (44525a456296 ARM: dts: stm32: Add support for STM=
32MP13xx DHCOR SoM and DHSBC rev.200 board)
Merging sunxi/sunxi/for-next (e2d0b639a4d9 Merge branch 'sunxi/clk-for-6.15=
' into sunxi/for-next)
Merging tee/next (a7562ff02879 Merge branch 'optee_for_v6.14' into next)
Merging tegra/for-next (4e16110559c3 Merge branch for-6.15/arm64/dt into fo=
r-next)
Merging thead-dt/thead-dt-for-next (c95c1362e5bc riscv: dts: thead: Add mai=
lbox node)
Merging ti/ti-next (15b2ed044c78 Merge branch 'ti-k3-config-next' into ti-n=
ext)
Merging xilinx/for-next (d6ccf528cb3c Merge branch 'zynqmp/dt' into for-nex=
t)
Merging clk/clk-next (fbe661983152 Merge branch 'clk-cleanup' into clk-next)
Merging clk-imx/for-next (06a61b5cb6a8 clk: imx8mp: inform CCF of maximum f=
requency of clocks)
Merging clk-renesas/renesas-clk (e1a098330ef0 clk: renesas: r9a09g047: Add =
clock and reset signals for the TSU IP)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (6bdbb73dc8d9 LoongArch: KVM: Fix GPA size=
 issue about VM)
Merging m68k/for-next (3c4e4ec957b6 m68k: setup: Remove size argument when =
calling strscpy())
Merging m68knommu/for-next (184815cc99d1 m68k: mm: Replace deprecated strnc=
py() with strscpy())
Merging microblaze/next (920354d7818b microblaze: Use of_property_present()=
 for non-boolean properties)
Merging mips/mips-next (a547dc46e393 MIPS: dec: Remove dec_irq_dispatch())
Merging openrisc/for-next (ea1413e5b53a rseq/selftests: Add support for Ope=
nRISC)
Merging parisc-hd/for-next (e822b8f01b40 parisc: led: Use scnprintf() to av=
oid string truncation warning)
Merging powerpc/next (aca95fb6bb57 powerpc/microwatt: Add SMP support)
Merging risc-v/for-next (2014c95afece Linux 6.14-rc1)
Merging riscv-dt/riscv-dt-for-next (38818f7c9c17 riscv: dts: starfive: jh71=
10-pine64-star64: enable USB 3.0 port)
Merging riscv-soc/riscv-soc-for-next (2014c95afece Linux 6.14-rc1)
Merging s390/for-next (66509a567844 Merge branch 'features' into for-next)
Merging sh/for-next (2014c95afece Linux 6.14-rc1)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (2d2b61ae38bd um: Remove unused asm/archparam.h header)
Merging xtensa/xtensa-for-next (dbef257ab7fa xtensa: ptrace: Remove zero-le=
ngth alignment array)
Merging fs-next (8c96f582b9bf Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (9022df7f5e05 Merge branch 'for-6.14-cpu_sync-fixup=
' into for-next)
Merging pci/next (1051d67de6c8 Merge branch 'pci/misc')
Merging pstore/for-next/pstore (5674609535ba pstore: Change kmsg_bytes stor=
age size to u32)
Merging hid/for-next (0f1e1944b14b Merge branch 'for-6.15/intel-thc' into f=
or-next)
Merging i2c/i2c/for-next (03358ce325bb Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i2c-host/i2c/i2c-host (ad50946dbf74 i2c: qup: Vote for interconnect=
 bandwidth to DRAM)
Merging i3c/i3c/next (2a785307e41b i3c: master: svc: Fix npcm845 DAA proces=
s corruption)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (7953605976f5 hwmon: (ntc_thermistor) retu=
rn error instead of clipping on OOB)
Merging jc_docs/docs-next (19b100b0116d scripts/kernel-doc: drop dead code =
for Wcontents_before_sections)
Merging v4l-dvb/next (fae8cab4ba3a media: platform: synopsys: hdmirx: Fix 6=
4-bit division for 32-bit targets)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (8a6f36b3c911 Merge branch 'pm-em' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (be4ae8c19492 cpufreq: tegra186:=
 Share policy per cluster)
Merging cpupower/cpupower (fffadbdd6b5a cpupower: Make lib versioning schem=
e more obvious and fix version link)
Merging devfreq/devfreq-next (f3253b23535f PM / devfreq: exynos: remove unu=
sed function parameter)
Merging pmdomain/next (b90a6e60619f pmdomain: Merge branch fixes into next)
Merging opp/opp/linux-next (2014c95afece Linux 6.14-rc1)
Merging thermal/thermal/linux-next (ecb642900deb dt-bindings: thermal: Corr=
ect indentation and style in DTS example)
Merging rdma/for-next (8820965c4852 docs: infiniband: document the UCAP API)
CONFLICT (content): Merge conflict in drivers/infiniband/sw/rxe/rxe.c
Merging net-next/main (71ca3561c268 Merge branch 'mptcp-pm-code-reorganisat=
ion')
CONFLICT (content): Merge conflict in fs/eventpoll.c
CONFLICT (content): Merge conflict in tools/testing/selftests/drivers/net/p=
ing.py
Merging bpf-next/for-next (d7be90dd108f Merge remote-tracking branch 'bpf-n=
ext/master' into for-next)
CONFLICT (content): Merge conflict in mm/page_owner.c
Merging ipsec-next/master (9d381c77087b Merge branch 'Support-PMTU-in-tunne=
l-mode-for-packet-offload')
Merging mlx5-next/mlx5-next (f550694e88b7 net/mlx5: Add IFC bits for PPCNT =
recovery counters group)
Merging netfilter-next/main (71ca3561c268 Merge branch 'mptcp-pm-code-reorg=
anisation')
Merging ipvs-next/main (4e41231249f4 Merge branch '100GbE' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/tnguy/next-queue)
Merging bluetooth/master (dfa48dfca48e Bluetooth: btintel_pci: Fix build wa=
rning)
  01aa72784e50 ("Bluetooth: SCO: fix sco_conn refcounting on sco_conn_ready=
")
  8da76b2ac810 ("Revert "Bluetooth: hci_core: Fix sleeping function called =
from invalid context"")
  c01c0d443bcd ("Bluetooth: btusb: Configure altsetting for HCI_USER_CHANNE=
L")
  c7c65369f5a3 ("Bluetooth: hci_event: Fix enabling passive scanning")
Merging wireless-next/for-next (fc56639937ce wifi: wfx: allow to enable WoW=
LAN using NL80211)
Merging ath-next/for-next (0e28ee106c46 Merge tag 'ath-next-20250305' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/ath/ath)
Merging wpan-next/master (a5d4d993fac4 dt-bindings: ieee802154: ca8210: Upd=
ate polarity of the reset pin)
Merging wpan-staging/staging (a5d4d993fac4 dt-bindings: ieee802154: ca8210:=
 Update polarity of the reset pin)
Merging mtd/mtd/next (2a6a44555f07 mtd: Fix error handling in mtd_device_pa=
rse_register() error path)
Merging nand/nand/next (ddc210cf8b8a mtd: rawnand: brcmnand: fix PM resume =
warning)
Merging spi-nor/spi-nor/next (93020292fea7 mtd: spi-nor: explicitly include=
 <linux/math64.h>)
Merging crypto/master (eca6828403b8 crypto: skcipher - fix mismatch between=
 mapping and unmapping order)
Merging drm/drm-next (11a5c6445ab8 Merge tag 'drm-xe-next-2025-03-07' of ht=
tps://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_gt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_pt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_vm.c
CONFLICT (content): Merge conflict in mm/memory.c
Applying: fix up for "drm/gpusvm: Add support for GPU Shared Virtual Memory"
Applying: fixup for "drm/xe: Add drm_pagemap ops to SVM"
Merging drm-exynos/for-linux-next (81a50378559b drm/exynos: Remove unnecess=
ary checking)
Merging drm-misc/for-linux-next (914ee6e730e1 drm/appletbdrm: Fix ref-count=
ing on dmadev)
Merging amdgpu/drm-next (099f273eff9c drm/amdgpu: Trigger a wedged event fo=
r ring reset)
Merging drm-intel/for-linux-next (eb4796d86259 drm/i915/xe3lpd: Map POWER_D=
OMAIN_AUDIO_PLAYBACK to DC_off)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dp=
_mst.c
Merging drm-msm/msm-next (83ee6d2ec52f dt-bindings: display/msm: dsi-contro=
ller-main: Add missing minItems)
Merging drm-msm-lumag/msm-next-lumag (83ee6d2ec52f dt-bindings: display/msm=
: dsi-controller-main: Add missing minItems)
Merging drm-xe/drm-xe-next (8da8aecf1f2d drm/xe: remove redundant check in =
xe_vm_create_ioctl())
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (2b999080744c MAINTAINERS: Add contact info for fbde=
v packed pixel drawing)
  f2b558988c7d ("fbdev: hyperv_fb: Fix hang in kdump kernel when on Hyper-V=
 Gen 2 VMs")
Merging regmap/for-next (14b33926f576 Merge remote-tracking branch 'regmap/=
for-6.15' into regmap-next)
Merging sound/for-next (ef749c8d9573 ALSA: seq: Avoid client data changes d=
uring proc reads)
Merging ieee1394/for-next (2014c95afece Linux 6.14-rc1)
Merging sound-asoc/for-next (8ecfae0248ab Merge remote-tracking branch 'aso=
c/for-6.15' into asoc-next)
Merging modules/modules-next (085c5e37427d module: Remove unnecessary size =
argument when calling strscpy())
Merging input/next (4d395cb071a3 Input: goodix_berlin - add support for Ber=
lin-A series)
Merging block/for-next (a18b4e6b9031 Merge branch 'for-6.15/io_uring' into =
for-next)
CONFLICT (content): Merge conflict in tools/testing/selftests/drivers/net/h=
w/Makefile
Merging device-mapper/for-next (c2662b1544cb dm cache: support shrinking th=
e origin device)
Merging libata/for-next (885251dc3576 ahci: add PCI ID for Marvell 88SE9215=
 SATA Controller)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (cb71db3b2cea mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (6a8f122c5f07 dt-bindings: mfd: qcom,tcsr: Add com=
patible for MSM8937)
Merging backlight/for-backlight-next (d1ebaf003a06 MAINTAINERS: Add entries=
 for Apple DWI backlight controller)
Merging battery/for-next (46d0c03c5503 power: supply: all: switch psy_cfg f=
rom of_node to fwnode)
Merging regulator/for-next (03626f01845d Merge remote-tracking branch 'regu=
lator/for-6.15' into regulator-next)
Merging security/next (65b796acea1e mailmap: map Stephen Smalley's old emai=
l addresses)
Merging apparmor/apparmor-next (3e45553acb14 apparmor: Remove unused variab=
le 'sock' in __file_sock_perm())
Merging integrity/next-integrity (672a4c654a08 ima: limit the number of ToM=
ToU integrity violations)
Merging selinux/next (8af43b61c17e selinux: support wildcard network interf=
ace names)
Merging smack/next (a158a937d864 smack: recognize ipv4 CIPSO w/o categories)
Merging tomoyo/master (09fbf3d50205 Merge tag 'tomoyo-pr-20250211' of git:/=
/git.code.sf.net/p/tomoyo/tomoyo)
Merging tpmdd/next (115be78c0bfe Documentation: tpm: add documentation for =
the CRB FF-A interface)
Merging watchdog/master (d127d9ce2c8e dt-bindings: watchdog: fsl-imx7ulp-wd=
t: Add i.MX94 support)
Merging iommu/next (e840414e5a73 Merge branches 'fixes', 'apple/dart' and '=
s390' into next)
Merging audit/next (2014c95afece Linux 6.14-rc1)
Merging devicetree/for-next (5935d1f1ea15 dt-bindings: memory-controllers: =
qcom,ebi2: Enforce child props)
CONFLICT (content): Merge conflict in drivers/of/of_private.h
Merging dt-krzk/for-next (854a080f0b73 loongarch: dts: remove non-existent =
DAC from 2k1000-ref)
Merging mailbox/for-next (d44ee3bd382d MAINTAINERS: add mailbox API's tree =
type and location)
Merging spi/for-next (c62f419e771f Merge remote-tracking branch 'spi/for-6.=
15' into spi-next)
Merging tip/master (bc6bc2e1d7fa Merge branch into tip/master: 'x86/sev')
  0b3bc3354eb9 ("arm64: vdso: Switch to generic storage implementation")
  127b0e05c166 ("vdso: Rename included Makefile")
  30533a55ec8e ("parisc: Remove unused symbol vdso_data")
  31e9fa2ba9ad ("arm: vdso: Switch to generic storage implementation")
  365841e1557a ("vdso: Add generic architecture-specific data storage")
  3ef32d90cdaa ("x86/vdso: Fix latent bug in vclock_pages calculation")
  46fe55b204bf ("riscv: vdso: Switch to generic storage implementation")
  51d6ca373f45 ("vdso: Add generic random data storage")
  5b47aba85810 ("vdso: Introduce vdso/align.h")
  69896119dc9d ("MIPS: vdso: Switch to generic storage implementation")
  9729dceab17b ("x86/vdso/vdso2c: Remove page handling")
  998a8a260819 ("vdso: Remove remnants of architecture-specific random stat=
e storage")
  ac1a42f4e4e2 ("vdso: Remove remnants of architecture-specific time storag=
e")
  d2862bb9d9ca ("LoongArch: vDSO: Switch to generic storage implementation")
  dafde29605eb ("x86/vdso: Switch to generic storage implementation")
  df7fcbefa710 ("vdso: Add generic time data storage")
CONFLICT (content): Merge conflict in arch/arm64/include/asm/vdso/compat_ge=
ttimeofday.h
CONFLICT (content): Merge conflict in arch/arm64/include/asm/vdso/vsyscall.h
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/vdso/gettime=
ofday.h
CONFLICT (content): Merge conflict in arch/riscv/include/asm/io.h
CONFLICT (content): Merge conflict in arch/s390/kernel/time.c
CONFLICT (content): Merge conflict in arch/x86/include/asm/vdso/gettimeofda=
y.h
CONFLICT (content): Merge conflict in arch/x86/kernel/paravirt.c
CONFLICT (content): Merge conflict in arch/x86/mm/pgtable.c
CONFLICT (content): Merge conflict in drivers/mailbox/mailbox.c
CONFLICT (content): Merge conflict in include/asm-generic/vdso/vsyscall.h
CONFLICT (content): Merge conflict in include/vdso/datapage.h
CONFLICT (content): Merge conflict in include/vdso/helpers.h
CONFLICT (content): Merge conflict in kernel/time/namespace.c
CONFLICT (content): Merge conflict in kernel/time/vsyscall.c
CONFLICT (add/add): Merge conflict in lib/vdso/datastore.c
CONFLICT (content): Merge conflict in lib/vdso/gettimeofday.c
CONFLICT (content): Merge conflict in net/core/dev.c
$ git reset --hard HEAD^
Merging next-20250303 version of tip
CONFLICT (content): Merge conflict in arch/riscv/include/asm/io.h
CONFLICT (content): Merge conflict in arch/x86/kernel/paravirt.c
CONFLICT (content): Merge conflict in arch/x86/mm/pgtable.c
CONFLICT (content): Merge conflict in drivers/mailbox/mailbox.c
CONFLICT (content): Merge conflict in net/core/dev.c
[master f70397476bb3] next-20250303/tip
Merging clockevents/timers/drivers/next (fafc3058cc2f dt-bindings: timer: e=
xynos4210-mct: Add samsung,exynos990-mct compatible)
Merging edac/edac-for-next (af1a78613133 Merge branch 'edac-drivers' into e=
dac-for-next)
Merging ftrace/for-next (9b66b6ede5c0 Merge tools/for-next)
CONFLICT (content): Merge conflict in include/linux/module.h
$ git reset --hard HEAD^
Merging next-20250307 version of ftrace
Merging rcu/next (69aa4876105b Revert "rcu/nocb: Fix rcuog wake-up from off=
line softirq")
Merging paulmck/non-rcu/next (654ac30fd535 Merge branches 'lkmm.2025.02.25a=
' and 'nolibc.2025.03.07a' into HEAD)
Merging kvm/next (ea9bd29a9c0d Merge tag 'kvm-x86-fixes-6.14-rcN.2' of http=
s://github.com/kvm-x86/linux into HEAD)
Merging kvm-arm/next (3d53f5c0c1f5 Merge branch 'kvm-arm64/pv-cpuid' into k=
vmarm/next)
CONFLICT (content): Merge conflict in arch/arm64/kvm/arm.c
Merging kvms390/next (32239066776a KVM: s390: selftests: Streamline uc_skey=
 test to issue iske after sske)
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (ee4e778c5802 KVM: riscv: selftests: Allow=
 number of interrupts to be configurable)
Merging kvm-x86/next (c9ea48bb6ee6 Merge branch 'xen')
Merging xen-tip/linux-next (75ad02318af2 Xen/swiotlb: mark xen_swiotlb_fixu=
p() __init)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (1e5f94eb8ef7 Merge branch 'for-6.15' into for-=
next)
Merging sched-ext/for-next (108963bba085 Merge branch 'for-6.15' into for-n=
ext)
Merging drivers-x86/for-next (f895f2493098 Merge branch 'intel-sst' of http=
s://github.com/spandruvada/linux-kernel into review-ilpo-next)
Merging chrome-platform/for-next (9fc83373f0ff platform/chrome: cros_ec_typ=
ec: Add support for setting USB mode via sysfs)
Merging chrome-platform-firmware/for-firmware-next (2014c95afece Linux 6.14=
-rc1)
Merging hsi/for-next (e3f88665a780 HSI: ssi_protocol: Fix use after free vu=
lnerability in ssi_protocol Driver Due to Race Condition)
Merging leds-lj/for-leds-next (7a3350495d9a leds: rgb: leds-qcom-lpg: Add s=
upport for 6-bit PWM resolution)
Merging ipmi/for-next (d082ecbc71e9 Linux 6.14-rc4)
Merging driver-core/driver-core-next (993a47bd7b99 Merge 6.14-rc6 into driv=
er-core-next)
Merging usb/usb-next (525b139fb403 Merge v6.14-rc6 into usb-next)
Merging thunderbolt/next (72cef52b353c thunderbolt: Make tb_tunnel_alloc_us=
b3() error paths consistent with the rest)
Merging usb-serial/usb-next (6a7713ec5337 USB: serial: mos7840: drop unused=
 defines)
Merging tty/tty-next (d2fa8e52cf91 serial: xilinx_uartps: Switch to use hrt=
imer_setup())
Merging char-misc/char-misc-next (046cc01be6b9 Merge 6.14-rc6 into char-mis=
c-next)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (d11eb31db269 coresight/ultrasoc: change smb_drv_dat=
a spinlock's type to raw_spinlock_t)
Merging fastrpc/for-next (2014c95afece Linux 6.14-rc1)
Merging fpga/for-next (e19890a0088b fpga: versal: remove incorrect of_match=
_ptr annotation)
Merging icc/icc-next (4cc004716977 Merge branch 'icc-sm8750' into icc-next)
Merging iio/togreg (66cadadbc94e iio: light: Add check for array bounds in =
veml6075_read_int_time_ms)
Merging phy-next/next (e45cc62c2342 phy: qcom: qmp-usbc: Add qmp configurat=
ion for QCS615)
Merging soundwire/next (08ae0d61c3d7 soundwire: take in count the bandwidth=
 of a prepared stream)
Merging extcon/extcon-next (7041ed0dde83 extcon: Drop explicit initializati=
on of struct i2c_device_id::driver_data to 0)
Merging gnss/gnss-next (0ad2507d5d93 Linux 6.14-rc3)
Merging vfio/next (384a530111c6 vfio/virtio: Enable support for virtio-bloc=
k live migration)
Merging w1/for-next (33c145297840 w1: w1_therm: w1: Use HWMON_CHANNEL_INFO =
macro to simplify code)
Merging spmi/spmi-next (092c49673431 spmi: Only use Hikey 970 SPMI controll=
er driver when ARM64)
Merging staging/staging-next (20a351c36afc staging: gpib: tnt4882 console m=
essaging cleanup)
Merging counter-next/counter-next (ba27a0247b71 counter: microchip-tcb-capt=
ure: Add support for RC Compare)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (656543989457 dmaengine: ptdma: Utilize the AE4DMA e=
ngine's multi-queue functionality)
CONFLICT (modify/delete): Documentation/devicetree/bindings/misc/atmel-ssc.=
txt deleted in HEAD and modified in dmaengine/next.  Version dmaengine/next=
 of Documentation/devicetree/bindings/misc/atmel-ssc.txt left in tree.
$ git rm -f Documentation/devicetree/bindings/misc/atmel-ssc.txt
Merging cgroup/for-next (34262c44e898 Merge branch 'for-6.15' into for-next)
Merging scsi/for-next (6888bc9da224 Merge branch 'misc' into for-next)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/rockchip/rk3576.d=
tsi
CONFLICT (content): Merge conflict in drivers/scsi/scsi_debug.c
Merging scsi-mkp/for-next (e402ee093f74 scsi: core: Use a switch statement =
when attaching VPD pages)
Merging vhost/linux-next (9d8960672d63 vhost-scsi: Reduce response iov mem =
use)
Merging rpmsg/for-next (3f7b2eb9f21e Merge branch 'rproc-next' into for-nex=
t)
Merging gpio-brgl/gpio/for-next (21c853ad9309 gpio: adnp: use new line valu=
e setter callbacks)
Merging gpio-intel/for-next (e646f0dae7b0 gpiolib-acpi: Drop unneeded ERR_C=
AST() in __acpi_find_gpio())
Merging pinctrl/for-next (e058c5f49cef Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (0ee2261d08aa pinctrl: intel: drop repeated =
config dependency)
Merging pinctrl-renesas/renesas-pinctrl (abcdeb4e299a pinctrl: renesas: rza=
2: Fix missing of_node_put() call)
Merging pinctrl-samsung/for-next (eb76dc973cef pinctrl: samsung: add suppor=
t for exynos7870 pinctrl)
Merging pwm/pwm/for-next (6df320abbb40 dt-bindings: pwm: imx: Add i.MX93, i=
.MX94 and i.MX95 support)
Merging ktest/for-next (f3a30016e4b5 ktest.pl: Fix typo "accesing")
Merging kselftest/next (82ef781f24ac selftests/ftrace: add 'poll' binary to=
 gitignore)
Merging kunit/test (a64dcfb451e2 Linux 6.14-rc2)
Merging kunit-next/kunit (0619a4868fc1 kunit: Clarify kunit_skip() argument=
 name)
Merging livepatching/for-next (8bd10336f1af Merge branch 'for-6.15/trivial'=
 into for-next)
Merging rtc/rtc-next (8a9b1751b26c rtc: pl031: document struct pl031_vendor=
_data members)
Merging nvdimm/libnvdimm-for-next (2318fa87f808 libnvdimm: Remove unused nd=
_attach_ndns)
Merging at24/at24/for-next (f25f405d250f eeprom: at24: Drop of_match_ptr() =
and ACPI_PTR() protections)
Merging ntb/ntb-next (c620f56c70eb MAINTAINERS: Update AMD NTB maintainers)
Merging seccomp/for-next/seccomp (8f19331384e6 seccomp: avoid the lock trip=
 seccomp_filter_release in common case)
Merging slimbus/for-next (2014c95afece Linux 6.14-rc1)
Merging nvmem/for-next (2014c95afece Linux 6.14-rc1)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (21cfcbeb7bff hyperv: Add CONFIG_MSHV_ROOT to ga=
te root partition support)
Merging auxdisplay/for-next (67200d70e459 Merge patch series "auxdisplay: c=
harlcd: Refactor memory allocation")
Merging kgdb/kgdb/for-next (6beaa75cd24d kdb: Remove unused flags stack)
Merging hmm/hmm (d05c69b64a3a debug)
Merging cfi/cfi/next (2014c95afece Linux 6.14-rc1)
Merging mhi/mhi-next (cba6bdfd7929 bus: mhi: host: pci_generic: Add support=
 for SA8775P endpoint)
Merging memblock/for-next (98b7beba1ee6 memblock: uniformly initialize all =
reserved pages to MIGRATE_MOVABLE)
Merging cxl/next (0a14566be090 cxl/Documentation: Remove 'mixed' from sysfs=
 mode doc)
Merging zstd/zstd-next (7eb172143d55 Linux 6.14-rc5)
Merging efi/next (ac2efaa84550 efi: efibc: change kmalloc(size * count, ...=
) to kmalloc_array())
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (541702a66640 Merge branch 'slab/for-6.15/kfree_=
rcu_tiny' into slab/for-next)
CONFLICT (content): Merge conflict in kernel/rcu/tiny.c
Merging random/master (93354d866ac4 prandom: remove next_pseudo_random32)
Merging landlock/next (53c13f61a2a8 landlock: Add audit documentation)
Merging rust/rust-next (ab2ebb7bc9d9 rust: types: add intra-doc links for `=
Opaque<T>`)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_panic_qr.rs
Merging rust-alloc/alloc-next (80e54e84911a Linux 6.14-rc6)
Merging rust-hrtimer/hrtimer-next (37d980c7f8c4 rust: hrtimer: add maintain=
er entry)
Merging rust-pin-init/pin-init-next (7eb172143d55 Linux 6.14-rc5)
Merging sysctl/sysctl-next (29fa7d793421 selftests/sysctl: fix wording of h=
elp messages)
CONFLICT (content): Merge conflict in include/linux/mm.h
CONFLICT (content): Merge conflict in kernel/sysctl.c
Merging execve/for-next/execve (8d68cabeb1ff binfmt_elf_fdpic: fix variable=
 set but not used warning)
Merging bitmap/bitmap-for-next (0312e94abe48 treewide: fix typo 'unsigned _=
_init128' -> 'unsigned __int128')
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (7f6688424bdc Merge branch 'for-next/hardening' =
into for-next/kspp)
CONFLICT (content): Merge conflict in lib/Makefile
Applying: fix up for "lib: Move KUnit tests into tests/ subdirectory"
Merging nolibc/nolibc (a64dcfb451e2 Linux 6.14-rc2)
Merging iommufd/for-next (a05df03a88bc iommufd: Fix uninitialized rc in iom=
mufd_access_rw())
Merging turbostat/next (447c98c1ca4a tools/power turbostat: Add idle govern=
or statistics reporting)
Merging pwrseq/pwrseq/for-next (2014c95afece Linux 6.14-rc1)
Merging capabilities-next/caps-next (4ae89b1fe7c2 capability: Remove unused=
 has_capability)
Merging ipe/next (aefadf03b3e3 ipe: policy_fs: fix kernel-doc warnings)
Merging kcsan/next (9d89551994a4 Linux 6.13-rc6)
Merging crc/crc-next (981b39dc6da6 lib/crc: remove unnecessary prompt for C=
ONFIG_CRC64)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)
Applying: watchdog: lenovo_se30_wdt: include io.h for devm_ioremap()
Applying: Revert "mm/shmem: use xas_try_split() in shmem_split_large_entry(=
)"
Applying: Revert "mm/filemap: use xas_try_split() in __filemap_add_folio()"

--Sig_/bOYfkrHK4QDXWoSJQuUojNR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfQHCIACgkQAVBC80lX
0GyeEQf+Itdjfy6Yo3NLi1SLGy33op420WnIa2W/AlvU42p9AdmbOGT3qdU0e1z5
CQL0jR8dlGmfDduIoBYD9wz5hn1H5nrySgh1V3cw2yZK0plWMVSJsp0KpDvr2KEb
cjnzKrMe4u0REGIHrw//KCVT5W/a72D8bGgX39S2zmvcrgxdfan/K7Dvdu9MHdLJ
hyfIHqdSQ9S5Uhw2L/rbSqV2tnKzO1EkDsKNby7VeRs9vbfywUiLLL5XssLkSqdh
yPJRJ28qxv2OUcMTnJcAJzOGhv2Eeafavl5EAVQ0Sw6sGgmYO71179KzjvGxpkSg
8yXkmR3vVUxLIj++kT7L/6qCudNXig==
=aTnZ
-----END PGP SIGNATURE-----

--Sig_/bOYfkrHK4QDXWoSJQuUojNR--

