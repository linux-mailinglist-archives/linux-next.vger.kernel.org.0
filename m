Return-Path: <linux-next+bounces-5470-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D6DA37BD8
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2025 08:08:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A372169B6C
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2025 07:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD64A18DB1C;
	Mon, 17 Feb 2025 07:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JtbdGDFk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B96C4C70;
	Mon, 17 Feb 2025 07:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739776130; cv=none; b=pHfFlPM4e0dbmQmqoaDgwBJTV2KfZypuOjouopX2rV8vpEOACwbCLQ8TZ9HqnlVxw6DRE1EWHdllPw2DGOO00dvUPQUvSnvFJyZ4tblWGAE1Ip1/76800n4ac4yNggTDQFl1oskI/xvxbVIEjcVcyU/Nnjt4XyoCEKe/FHu8Vro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739776130; c=relaxed/simple;
	bh=CcNrfA4gf6dWidWVgs6om2GZXGWS7jl40GJPQPJn3P8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RGsckQj9Z3BrCxRcPiBD9nsj7rT8TWJZDJyyAJXc8TOzt7jeUvGVpxxE8NXbrn+vTMxJrC9LfGOmIztH9ug/Y+AICYf3WHm9g4UfwNDi2S145YPAfsciDMMQX2Wm81aGAthSQwfLuQpGwCgHlKJfgGrGHdhtsF1qyWLIS9F96aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JtbdGDFk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739776121;
	bh=E6LLZHn+NLSdVhdTE6OguWdq6aCY7VhMb9aq1fuztFY=;
	h=Date:From:To:Cc:Subject:From;
	b=JtbdGDFkEtaSC04v9LE6R/rSax4p52V//+5r5rVHP2bGFBYVbw+2ybK7N0kbHeNrZ
	 ZM8hSDU7ZeOBIZvoURA51EWmlfvq3Dh8+JNRqbg+Yk5Qo+GInU4srabtfawLE8GFGz
	 HRElZHbtiPBsYnYsHKdBgp+DXKNz5+LitSC1ofgbjryb8X3/yvUjohu3h30G2Wmoce
	 6v7kIGxkOlQ2PRkoFp1PPpGF7dZbae+vI3cYkbe/L4uvYdlaB+WVnjTe+DLUdsAxJC
	 AojSGhZQh1uFd9AbQqkP7SOxCn4i7q2NpP8/3ZrK3x1qSUCTdJW1cjRSExJHAqqf/9
	 Uz65wLWwun8OA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YxDK51kdXz4wcy;
	Mon, 17 Feb 2025 18:08:41 +1100 (AEDT)
Date: Mon, 17 Feb 2025 18:08:40 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 17
Message-ID: <20250217180840.5f4147af@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cFhiWa9hupAUhby_6LHb4iG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/cFhiWa9hupAUhby_6LHb4iG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250214:

New tree: alpha
Removed trees: file-locks, zstd-fixes, gpio, fsi, zstd,
	kspp-gustavo, tsm, header_cleanup
		all have not been updated for more than a year

The ext4 tree lost its build failure.

The perf tree lost its build failure.

The drm-xe tree gained a conflict against the drm-intel tree.

The gpio-brgl tree gained a conflict against the iio tree.

Non-merge commits (relative to Linus' tree): 3689
 4450 files changed, 260539 insertions(+), 98871 deletions(-)

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

I am currently merging 384 trees (counting Linus' and 147 trees of bug
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
Merging origin/master (224e74511041 Merge tag 'kbuild-fixes-v6.14-2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild)
Merging fixes/fixes (fac04efc5c79 Linux 6.13-rc2)
Merging ext4-fixes/fixes (4bbf9020becb Linux 6.13-rc4)
Merging vfs-brauner-fixes/vfs.fixes (a33f72554adf Merge patch series "netfs=
: Miscellaneous fixes")
Merging fscrypt-current/for-current (2014c95afece Linux 6.14-rc1)
Merging fsverity-current/for-current (2014c95afece Linux 6.14-rc1)
Merging btrfs-fixes/next-fixes (7b78871b734d Merge branch 'misc-6.14' into =
next-fixes)
Merging vfs-fixes/fixes (60a600243244 hostfs: fix string handling in __dent=
ry_name())
Merging erofs-fixes/fixes (6422cde1b0d5 erofs: use buffered I/O for file-ba=
cked mounts by default)
Merging nfsd-fixes/nfsd-fixes (4990d098433d NFSD: Fix CB_GETATTR status fix)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (228a1157fb9f Merge tag '6.13-rc-part1-SM=
B3-client-fixes' of git://git.samba.org/sfrench/cifs-2.6)
Merging bcachefs/for-next (b32136a85a3d bcachefs: bcachefs_metadata_version=
_stripe_lru)
Merging fscrypt/for-next (2014c95afece Linux 6.14-rc1)
Merging btrfs/for-next (1c08f86eeada Merge branch 'for-next-next-v6.14-2025=
0211' into for-next-20250211)
Merging ceph/master (3981be13ec1b ceph: exchange hardcoded value on NAME_MA=
X)
Merging cifs/for-next (76f258eebb8a smb: client, common: Avoid multiple -Wf=
lex-array-member-not-at-end warnings)
Merging configfs/for-next (84147f4e84c4 configfs: improve item creation per=
formance)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (8e2bad543eca dlm: prevent NPD when writing a positive val=
ue to event_done)
Merging erofs/dev (8f9530aeeb4f erofs: refine z_erofs_get_extent_compressed=
len())
Merging exfat/dev (dda0407a2026 exfat: short-circuit zero-byte writes in ex=
fat_file_write_iter)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (ef51934a05d3 ext2: Remove reference to bh->b_page)
Merging ext4/dev (9e28059d5664 ext4: introduce linear search for dentries)
Merging f2fs/dev (48ea8b200414 f2fs: fix to avoid panic once fallocation fa=
ils for pinfile)
Merging fsverity/for-next (2014c95afece Linux 6.14-rc1)
Merging fuse/for-next (150b838b03e8 fuse: optmize missing FUSE_LINK support)
Merging gfs2/for-next (1259f36ab395 gfs2: Fix additional unlikely request c=
ancelation race)
Merging jfs/jfs-next (06f4613f3935 jfs: Remove reference to bh->b_page)
Merging ksmbd/ksmbd-for-next (a7a8a72c7c30 ksmbd: Use str_read_write() and =
str_true_false() helpers)
Merging nfs/linux-next (a64dcfb451e2 Linux 6.14-rc2)
Merging nfs-anna/linux-next (6f56971841a1 SUNRPC: do not retry on EKEYEXPIR=
ED when user TGT ticket expired)
Merging nfsd/nfsd-next (d520b70859e0 nfsd: put dl_stid if fail to queue dl_=
recall)
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
Merging vfs-brauner/vfs.all (cb5fe9b7f499 Merge branch 'vfs-6.15.async.dir'=
 into vfs.all)
Merging vfs/for-next (2e72b1e0aac2 Merge branch 'work.d_revalidate' into fo=
r-next)
Merging mm-hotfixes/mm-hotfixes-unstable (8a25b0818aed mm: page_isolation: =
avoid calling folio_hstate() without hugetlb_lock)
Merging fs-current (c29d072f1002 Merge branch 'next-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/kdave/linux.git)
Merging kbuild-current/fixes (b28fb1f2ef45 modpost: Fix a few typos in a co=
mment)
Merging arc-current/for-curr (78d4f34e2115 Linux 6.13-rc3)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (446a8351f160 arm64: rust: clean Rust 1.=
85.0 warning using softfloat target)
Merging arm-soc-fixes/arm/fixes (70b0d6b0a199 tee: optee: Fix supplicant wa=
it loop)
Merging davinci-current/davinci/for-current (2014c95afece Linux 6.14-rc1)
Merging drivers-memory-fixes/fixes (304e6c02b76f memory: omap-gpmc: drop no=
 compatible check)
Merging sophgo-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging m68k-current/for-linus (bb2e0fb1e6aa m68k: libgcc: Fix lvalue abuse=
 in umul_ppmm())
Merging powerpc-fixes/fixes (d262a192d38e powerpc/code-patching: Fix KASAN =
hit by not flagging text patching area as VM_ALLOC)
Merging s390-fixes/fixes (2844ddbd540f s390/pci: Fix handling of isolated V=
Fs)
Merging net/main (071ed42cff4f net/sched: cls_api: fix error handling causi=
ng NULL dereference)
Merging bpf/master (8784714d7f27 bpf: Handle allocation failure in acquire_=
lock_state)
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
Merging rdma-fixes/for-rc (12d044770e12 IB/mlx5: Set and get correct qp_num=
 for a DCT QP)
Merging sound-current/for-linus (6a7ed7ee16a9 ALSA: hda/cirrus: Reduce code=
c resume time)
Merging sound-asoc-fixes/for-linus (571b69f2f9b1 ASoC: imx-audmix: remove c=
pu_mclk which is from cpu dai device)
Merging regmap-fixes/for-linus (32ffed055dce regmap-irq: Add missing kfree(=
))
Merging regulator-fixes/for-linus (35e21de48e69 regulator: core: let dt pro=
perties override driver init_data)
Merging spi-fixes/for-linus (3588b1c0fde2 spi: sn-f-ospi: Fix division by z=
ero)
Merging pci-current/for-linus (81f64e925c29 PCI: Avoid FLR for Mediatek MT7=
922 WiFi)
Merging driver-core.current/driver-core-linus (78418f300d39 rust/kernel: Ad=
d faux device bindings)
Merging tty.current/tty-linus (9e512eaaf8f4 serial: 8250: Fix fifo underflo=
w on flush)
Merging usb.current/usb-linus (659f5d55feb7 usb: typec: tcpm: PSSourceOffTi=
mer timeout in PR_Swap enters ERROR_RECOVERY)
Merging usb-serial-fixes/usb-linus (6aa8a63c471e USB: serial: option: drop =
MeiG Smart defines)
Merging phy/fixes (55f1a5f7c97c phy: tegra: xusb: reset VBUS & ID OVERRIDE)
Merging staging.current/staging-linus (2014c95afece Linux 6.14-rc1)
Merging iio-fixes/fixes-togreg (cc2c3540d947 iio: filter: admv8818: Force i=
nitialization of SDO)
Merging counter-current/counter-current (2014c95afece Linux 6.14-rc1)
Merging char-misc.current/char-misc-linus (e45e07c16743 Merge tag 'iio-fixe=
s-for-6.14a' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/jic23/ii=
o into char-misc-linus)
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
Merging mtd-fixes/mtd/fixes (41758630dd7e dt-bindings: mtd: cadence: docume=
nt required clock-names)
Merging mfd-fixes/for-mfd-fixes (68f860426d50 mfd: axp20x: AXP717: Fix miss=
ing IRQ status registers range)
Merging v4l-dvb-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging reset-fixes/reset/fixes (2014c95afece Linux 6.14-rc1)
Merging mips-fixes/mips-fixes (733a90561ad0 MIPS: fix mips_get_syscall_arg(=
) for o32)
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
Merging scsi-fixes/fixes (5233e3235dec scsi: qla1280: Fix kernel oops when =
debug level > 2)
Merging drm-fixes/drm-fixes (04485cc34868 Merge tag 'drm-xe-fixes-2025-02-1=
3' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (53139b3f9998 drm/i915/selftes=
ts: avoid using uninitialized context)
Merging mmc-fixes/fixes (3e68abf2b9ce mmc: mtk-sd: Fix register settings fo=
r hs400(es) mode)
Merging rtc-fixes/rtc-fixes (2014c95afece Linux 6.14-rc1)
Merging gnss-fixes/gnss-linus (2014c95afece Linux 6.14-rc1)
Merging hyperv-fixes/hyperv-fixes (2a1852f9062b fbdev: hyperv_fb: iounmap()=
 the correct memory when removing a device)
Merging risc-v-fixes/fixes (245aece3750d MAINTAINERS: Add myself as a riscv=
 reviewer)
Merging riscv-dt-fixes/riscv-dt-fixes (1b133129ad6b riscv: dts: starfive: F=
ix a typo in StarFive JH7110 pin function definitions)
Merging riscv-soc-fixes/riscv-soc-fixes (2014c95afece Linux 6.14-rc1)
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (2014c95afece Linux 6.14-rc1)
Merging gpio-brgl-fixes/gpio/for-current (7b4aebeecbbd gpiolib: Fix crash o=
n error in gpiochip_get_ngpios())
Merging gpio-intel-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging pinctrl-intel-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging auxdisplay-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging kunit-fixes/kunit-fixes (a64dcfb451e2 Linux 6.14-rc2)
Merging memblock-fixes/fixes (180bbad69864 arch_numa: Restore nid checks be=
fore registering a memblock with a node)
Merging renesas-fixes/fixes (124f4f1a1869 MAINTAINERS: Re-add cancelled Ren=
esas driver sections)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging perf-current/perf-tools (9fae5884bb0e perf cpumap: Fix die and clus=
ter IDs)
Merging efi-fixes/urgent (bbc4578537e3 efi: Use BIT_ULL() constants for mem=
ory attributes)
Merging battery-fixes/fixes (98380110bd48 power: supply: axp20x_battery: Fi=
x fault handling for AXP717)
Merging iommufd-fixes/for-rc (2ca704f55e22 iommu/arm-smmu-v3: Improve uAPI =
comment for IOMMU_HW_INFO_TYPE_ARM_SMMUV3)
Merging rust-fixes/rust-fixes (2e4f982cf392 rust: rbtree: fix overindented =
list item)
Merging w1-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging pmdomain-fixes/fixes (a64dcfb451e2 Linux 6.14-rc2)
Merging i2c-host-fixes/i2c/i2c-host-fixes (7422c319fd80 MAINTAINERS: Add ma=
intainer for Qualcomm's I2C GENI driver)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (2014c95afece Linux 6.14-rc1)
Merging pwrseq-fixes/pwrseq/for-current (2014c95afece Linux 6.14-rc1)
Merging thead-dt-fixes/thead-dt-fixes (40384c840ea1 Linux 6.13-rc1)
Merging ftrace-fixes/ftrace/fixes (c8c9b1d2d5b4 fgraph: Fix set_graph_notra=
ce with setting TRACE_GRAPH_NOTRACE_BIT)
Merging ring-buffer-fixes/ring-buffer/fixes (97937834ae87 ring-buffer: Upda=
te pages_touched to reflect persistent buffer content)
Merging trace-fixes/trace/fixes (60295b944ff6 tracing: gfp: Fix the GFP enu=
m values shown for user space tracing tools)
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging tip-fixes/tip/urgent (ba643b6d8440 Merge tag 'irq_urgent_for_v6.14_=
rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging slab-fixes/slab/for-next-fixes (b7ffecbe198e memcg: slub: fix SUnre=
claim for post charged objects)
Merging drm-msm-fixes/msm-fixes (73f69c6be2a9 drm/msm/dsi/phy: Do not overw=
ite PHY_CMN_CLK_CFG1 when choosing bitclk source)
Merging uml-fixes/fixes (96178631c3f5 um: convert irq_lock to raw spinlock)
Merging drm-misc-fixes/for-linux-next-fixes (b3fefbb30a16 nouveau/svm: fix =
missing folio unlock + put after make_device_exclusive_range())
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (a64dcfb451e2 Linux 6.14-rc2)
Merging mm-nonmm-stable/mm-nonmm-stable (a64dcfb451e2 Linux 6.14-rc2)
Merging mm/mm-everything (ea5bf3ba15ab foo)
Applying: Revert "mm: make vma cache SLAB_TYPESAFE_BY_RCU"
Merging kbuild/for-next (3625f980635f modpost: use strstarts() to clean up =
parse_source_files())
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (20600b8aab73 perf tools: Fix compile error on=
 sample->user_regs)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/for-next (aef7ee7649e0 dma-debug: fix physical address =
calculation for struct dma_debug_entry)
Merging asm-generic/master (0af8e32343f8 empty include/asm-generic/vga.h)
Merging alpha/alpha-next (1523226edda5 alpha: Use str_yes_no() helper in pc=
i_dac_dma_supported())
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (f520fab580c9 ARM: 9440/1: cacheinfo fix format field =
mask)
Merging arm64/for-next/core (1dd3393696ef Merge branch 'for-next/perf' into=
 for-next/core)
Merging arm-perf/for-next/perf (ba113ecad81a perf docs: arm_spe: Document n=
ew discard mode)
Merging arm-soc/for-next (5bc55a333a2f Linux 6.13-rc7)
Merging amlogic/for-next (953913df9c3a Merge branch 'v6.15/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (c559645f343a soc: apple: rtkit: Pass =
the crashlog to the crashed() callback)
Merging aspeed/for-next (3540adcccc71 ARM: dts: aspeed: yosemite4: adjust s=
econdary flash name)
Merging at91/at91-next (2014c95afece Linux 6.14-rc1)
Merging broadcom/next (bdac656f1bb5 Merge branch 'devicetree/fixes' into ne=
xt)
Merging davinci/davinci/for-next (58abc69e479c ARM: dts: ti: davinci: Align=
 GPIO hog name with bindings)
Merging drivers-memory/for-next (b9c791c65ced Merge branch 'mem-ctrl-next' =
into for-next)
Merging imx-mxs/for-next (f89ee1bb86d7 Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (9767801cb7d7 arm64: dts: mediatek: mt8188: Add t=
ertiary eMMC/SD/SDIO controller)
Merging mvebu/for-next (960766b45fa2 arm64: dts: marvell: Add missing board=
 compatible for IEI-Puzzle-M801)
Merging omap/for-next (065f3bd4f22b Merge branch 'omap-for-v6.15/dt' into t=
mp/omap-next-20250205.163245)
Merging qcom/for-next (c177fed7617d Merge branches 'arm64-for-6.15', 'clk-f=
or-6.15', 'drivers-fixes-for-6.14' and 'drivers-for-6.15' into for-next)
Merging renesas/next (17765ca5d082 Merge branch 'renesas-dts-for-v6.15' int=
o renesas-next)
Merging reset/reset/next (2014c95afece Linux 6.14-rc1)
Merging rockchip/for-next (faf7db65e170 Merge branch 'v6.15-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (4ced2a571046 Merge branches 'next/defconfig'=
, 'next/drivers' and 'next/dt64' into for-next)
Merging scmi/for-linux-next (ab959987f086 Merge branches 'for-next/scmi/fix=
es', 'for-next/scmi/updates' and 'for-next/ffa/updates' of ssh://gitolite.k=
ernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-linux-next)
Merging sophgo/for-next (255f83ba5c16 riscv: sophgo: dts: add pwm controlle=
r for SG2042 SoC)
Merging spacemit/for-next (4a0c4e723c94 MAINTAINERS: spacemit: update vario=
us info)
Merging stm32/stm32-next (8c6d469f5249 ARM: dts: stm32: lxa-fairytux2: add =
Linux Automation GmbH FairyTux 2)
Merging sunxi/sunxi/for-next (6e085e64a290 ARM: dts: sunxi: add support for=
 NetCube Systems Kumquat)
Merging tee/next (a7562ff02879 Merge branch 'optee_for_v6.14' into next)
Merging tegra/for-next (0a891b9fcd9b Merge branch for-6.14/arm64/dt into fo=
r-next)
Merging thead-dt/thead-dt-for-next (c95c1362e5bc riscv: dts: thead: Add mai=
lbox node)
Merging ti/ti-next (c7691aec5e99 arm64: defconfig: Enable TISCI Interrupt R=
outer and Aggregator)
Merging xilinx/for-next (600d48b6f347 Merge branch 'zynq/dt' into for-next)
Merging clk/clk-next (2014c95afece Linux 6.14-rc1)
Merging clk-imx/for-next (48806be08636 clk: imx: Apply some clks only for i=
.MX93)
Merging clk-renesas/renesas-clk (5a1cb35ba37a clk: renesas: r9a09g047: Add =
ICU clock/reset)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (3011b29ec5a3 LoongArch: KVM: Set host wit=
h kernel mode when switch to VM mode)
Merging m68k/for-next (723be3c6ab31 m68k: sun3: Fix DEBUG_MMU_EMU build)
Merging m68knommu/for-next (e156413e8820 m68k: Do not include <linux/fb.h>)
Merging microblaze/next (920354d7818b microblaze: Use of_property_present()=
 for non-boolean properties)
Merging mips/mips-next (2014c95afece Linux 6.14-rc1)
Merging openrisc/for-next (ea1413e5b53a rseq/selftests: Add support for Ope=
nRISC)
Merging parisc-hd/for-next (4e3ff3c5854f parisc: Remove memcpy_fromio)
Merging powerpc/next (6aa989ab2bd0 powerpc/pseries/iommu: memory notifier i=
ncorrectly adds TCEs for pmemory)
Merging risc-v/for-next (2014c95afece Linux 6.14-rc1)
Merging riscv-dt/riscv-dt-for-next (3d20e619c9c0 riscv: dts: starfive: Unif=
y regulator naming scheme)
Merging riscv-soc/riscv-soc-for-next (2014c95afece Linux 6.14-rc1)
Merging s390/for-next (ce6bdbd583f3 Merge branch 'fixes' into for-next)
Merging sh/for-next (2014c95afece Linux 6.14-rc1)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (2d2b61ae38bd um: Remove unused asm/archparam.h header)
Merging xtensa/xtensa-for-next (d14b9a713b34 xtensa/simdisk: Use str_write_=
read() helper in simdisk_transfer())
Merging fs-next (a2f502147da2 Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (9022df7f5e05 Merge branch 'for-6.14-cpu_sync-fixup=
' into for-next)
Merging pci/next (c71f7bbc5d79 Merge branch 'pci/endpoint')
Merging pstore/for-next/pstore (5674609535ba pstore: Change kmsg_bytes stor=
age size to u32)
Merging hid/for-next (3bf0bccd7960 Merge branch 'for-6.15/pidff' into for-n=
ext)
Merging i2c/i2c/for-next (7e45b505e699 Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i2c-host/i2c/i2c-host (47c191e0d806 i2c: pxa: fix call balance of i=
2c->clk handling routines)
Merging i3c/i3c/next (2014c95afece Linux 6.14-rc1)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (8df0f002827e hwmon: (xgene-hwmon) use app=
ropriate type for the latency value)
Merging jc_docs/docs-next (629ecd68ccde Merge branch 'mauro' into docs-mw)
Merging v4l-dvb/next (2a1551665a85 media: dw9719: Add DW9761 support)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (7c2191495f2c Merge branch 'thermal-core' into fixes)
Merging cpufreq-arm/cpufreq/arm/linux-next (0322f3e89b4e cpufreq: Remove cp=
ufreq_enable_boost_support())
Merging cpupower/cpupower (a64dcfb451e2 Linux 6.14-rc2)
Merging devfreq/devfreq-next (f3253b23535f PM / devfreq: exynos: remove unu=
sed function parameter)
Merging pmdomain/next (c2851be5f183 pmdomain: renesas: rcar-sysc: Drop fwno=
de_dev_initialized() call)
Merging opp/opp/linux-next (2014c95afece Linux 6.14-rc1)
Merging thermal/thermal/linux-next (7d8abc5f3b5c thermal/drivers/imx_sc_the=
rmal: Use dev_err_probe)
Merging rdma/for-next (f26e648a978a RDMA/bnxt_re: Fix the condition check w=
hile programming congestion control)
Merging net-next/main (0784d83df3bf ndisc: ndisc_send_redirect() cleanup)
Merging bpf-next/for-next (4eb93fea5919 selftests/bpf: add test for LDX/STX=
/ST relocations over array field)
CONFLICT (content): Merge conflict in kernel/bpf/btf.c
Merging ipsec-next/master (e3aa43a50a64 xfrm: prevent high SEQ input in non=
-ESN mode)
Merging mlx5-next/mlx5-next (6ca00ec47b70 net/mlx5: Add nic_cap_reg and vhc=
a_icm_ctrl registers)
Merging netfilter-next/main (4e41231249f4 Merge branch '100GbE' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue)
Merging ipvs-next/main (4e41231249f4 Merge branch '100GbE' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/tnguy/next-queue)
Merging bluetooth/master (d0aa1ab4d278 Bluetooth: L2CAP: Fix corrupted list=
 in hci_chan_del)
Merging wireless-next/for-next (c61da149b9c2 Merge tag 'rtw-next-2025-02-10=
-v2' of https://github.com/pkshih/rtw)
Merging ath-next/for-next (7b19d5adadfe wifi: ath12k: Support Received FSE =
Stats)
Merging wpan-next/master (3e5908172c05 Merge tag 'ieee802154-for-net-next-2=
025-01-03' of git://git.kernel.org/pub/scm/linux/kernel/git/wpan/wpan-next)
Merging wpan-staging/staging (3e5908172c05 Merge tag 'ieee802154-for-net-ne=
xt-2025-01-03' of git://git.kernel.org/pub/scm/linux/kernel/git/wpan/wpan-n=
ext)
Merging mtd/mtd/next (3f930a52d715 mtd: capture device name setting failure=
 when adding mtd)
Merging nand/nand/next (1db50b96b059 mtd: rawnand: qcom: finish converting =
register to FIELD_PREP)
Merging spi-nor/spi-nor/next (8079d5bc5c3d mtd: spi-nor: winbond: Add suppo=
rt for w25q02jv)
Merging crypto/master (c346fef6fef5 crypto: inside-secure - Eliminate dupli=
cation in top-level Makefile)
Merging drm/drm-next (0ed1356af8f6 Merge tag 'drm-misc-next-2025-02-12' of =
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next)
Merging drm-exynos/for-linux-next (81a50378559b drm/exynos: Remove unnecess=
ary checking)
Merging drm-misc/for-linux-next (4fd6ca90fc7f accel/amdxdna: Refactor hardw=
are context destroy routine)
Merging amdgpu/drm-next (784543871841 drm/amdgpu/mes: Add cleaner shader fe=
nce address handling in MES for GFX12)
Merging drm-intel/for-linux-next (1bcba228535f drm/i915: s/state/plane_stat=
e/)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dp=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dp=
_mst.c
Merging drm-msm/msm-next (866e43b945bf drm/msm: UAPI error reporting)
Merging drm-msm-lumag/msm-next-lumag (a5463629299b drm/msm/dpu: Add RM supp=
ort for allocating CWB)
Merging drm-xe/drm-xe-next (611160b02a40 drm/xe/pf: Release all VFs configs=
 on device removal)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/display/xe_display=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_gt_sriov_pf.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_ct.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_log.c
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (720fcad9d12e fbdev: core: Split CFB and SYS pixel r=
eversing configuration)
Merging regmap/for-next (14b33926f576 Merge remote-tracking branch 'regmap/=
for-6.15' into regmap-next)
Merging sound/for-next (becc794c5e46 ALSA: hda: intel: Add Lenovo IdeaPad Z=
570 to probe denylist)
Merging ieee1394/for-next (2014c95afece Linux 6.14-rc1)
Merging sound-asoc/for-next (cc7708ae5e2a Merge remote-tracking branch 'aso=
c/for-6.15' into asoc-next)
Merging modules/modules-next (053842ec3c33 bug: Use RCU instead RCU-sched t=
o protect module_bug_list.)
Merging input/next (a7550ff59edf Input: Switch to use hrtimer_setup())
Merging block/for-next (7ef0fc266d78 Merge branch 'for-6.15/io_uring' into =
for-next)
Merging device-mapper/for-next (0ce46f4f751b dm vdo slab-depot: read refcou=
nt blocks in large chunks at load time)
Merging libata/for-next (deca423213cb ata: libata-core: Add 'external' to t=
he libata.force kernel parameter)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (cb71db3b2cea mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (0b1cfd51841c mfd: intel_soc_pmic_crc: Drop unneed=
ed assignment for cache_type)
Merging backlight/for-backlight-next (373dacfeb55e backlight: wm831x_bl: Do=
 not include <linux/fb.h>)
Merging battery/for-next (a8936109056b power: supply: max1720x: fix a comme=
nt typo)
Merging regulator/for-next (9195e28c207c Merge remote-tracking branch 'regu=
lator/for-6.15' into regulator-next)
Merging security/next (4632cd0ec3fa lsm: fix a missing security_uring_allow=
ed() prototype)
Merging apparmor/apparmor-next (3e45553acb14 apparmor: Remove unused variab=
le 'sock' in __file_sock_perm())
Merging integrity/next-integrity (57a0ef02fefa ima: Reset IMA_NONACTION_RUL=
E_FLAGS after post_setattr)
Merging selinux/next (5fc80fb5b776 selinux: always check the file label in =
selinux_kernel_read_file())
Merging smack/next (6f71ad02aae8 smack: deduplicate access to string conver=
sion)
Merging tomoyo/master (09fbf3d50205 Merge tag 'tomoyo-pr-20250211' of git:/=
/git.code.sf.net/p/tomoyo/tomoyo)
Merging tpmdd/next (34c26c5e1cb0 tpm: do not start chip while suspended)
Merging watchdog/master (a64dcfb451e2 Linux 6.14-rc2)
Merging iommu/next (add43c4fbc92 iommu/vt-d: Make intel_iommu_drain_pasid_p=
rq() cover faults for RID)
Merging audit/next (2014c95afece Linux 6.14-rc1)
Merging devicetree/for-next (b69cfaf884f3 dt-bindings: imx: fsl,aips-bus: E=
nsure all properties are defined)
Merging dt-krzk/for-next (854a080f0b73 loongarch: dts: remove non-existent =
DAC from 2k1000-ref)
Merging mailbox/for-next (4783ce32b080 riscv: export __cpuid_to_hartid_map)
Merging spi/for-next (35692d21291f Merge remote-tracking branch 'spi/for-6.=
15' into spi-next)
Merging tip/master (e9d68ca5f7a7 Merge branch into tip/master: 'x86/misc')
Merging clockevents/timers/drivers/next (fafc3058cc2f dt-bindings: timer: e=
xynos4210-mct: Add samsung,exynos990-mct compatible)
Merging edac/edac-for-next (c158647c1073 EDAC/qcom: Correct interrupt enabl=
e register configuration)
Merging ftrace/for-next (04787ae88833 Merge tools/for-next)
Merging rcu/next (236815038841 Merge branches 'docs.2025.02.04a', 'lazypree=
mpt.2025.02.05a', 'misc.2025.02.06a', 'srcu.2025.02.05a' and 'torture.2025.=
02.05a')
Merging paulmck/non-rcu/next (b6f62437f431 Merge branches 'csd-lock.2024.10=
.11a', 'lkmm.2024.11.09a' and 'scftorture.2024.11.09a', tag 'nolibc.2024.11=
.01a' into HEAD)
Merging kvm/next (d3d0b8dfe060 Merge tag 'kvm-x86-fixes-6.14-rcN' of https:=
//github.com/kvm-x86/linux into HEAD)
Merging kvm-arm/next (01009b06a6b5 arm64/sysreg: Get rid of TRFCR_ELx Sysre=
gFields)
Merging kvms390/next (32239066776a KVM: s390: selftests: Streamline uc_skey=
 test to issue iske after sske)
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (af79caa83f6a RISC-V: KVM: Add new exit st=
atstics for redirected traps)
Merging kvm-x86/next (fed48e2967f4 Merge branches 'fixes', 'misc', 'mmu', '=
pvclock', 'selftests', 'selftests_6.14', 'svm' and 'xen')
Merging xen-tip/linux-next (75ad02318af2 Xen/swiotlb: mark xen_swiotlb_fixu=
p() __init)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (8221fd1a7304 workqueue: Log additional details=
 when rejecting work)
Merging sched-ext/for-next (93e3161c0c50 Merge branch 'for-6.15' into for-n=
ext)
Merging drivers-x86/for-next (d497c47481f8 platform/x86: ideapad-laptop: us=
e dev_groups to register attribute groups)
Merging chrome-platform/for-next (435a3d78b87a platform/chrome: cros_ec_sys=
fs: Expose AP_MODE_ENTRY feature state)
Merging chrome-platform-firmware/for-firmware-next (2014c95afece Linux 6.14=
-rc1)
Merging hsi/for-next (40384c840ea1 Linux 6.13-rc1)
Merging leds-lj/for-leds-next (59670b23bfb6 leds: lp8860: Drop unneeded ass=
ignment for cache_type)
Merging ipmi/for-next (83d8c79aa958 ipmi: ssif_bmc: Fix new request loss wh=
en bmc ready for a response)
Merging driver-core/driver-core-next (741c10b096bc kernfs: Use RCU to acces=
s kernfs_node::name.)
Merging usb/usb-next (257a087c8b52 usb: typec: Add support for Parade PS883=
0 Type-C Retimer)
Merging thunderbolt/next (35ad0d62da83 MAINTAINERS: Use my kernel.org addre=
ss for USB4/Thunderbolt work)
Merging usb-serial/usb-next (2014c95afece Linux 6.14-rc1)
Merging tty/tty-next (eb07e3a94679 serial: tegra-utc: Add driver for Tegra =
UART Trace Controller (UTC))
Merging char-misc/char-misc-next (a64dcfb451e2 Linux 6.14-rc2)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (56e14a21cee4 coresight-tpda: Optimize the function =
of reading element size)
Merging fastrpc/for-next (2014c95afece Linux 6.14-rc1)
Merging fpga/for-next (cc1eb048e7ee fpga: m10bmc-sec: update email address =
for Peter Colberg)
Merging icc/icc-next (4cc004716977 Merge branch 'icc-sm8750' into icc-next)
Merging iio/togreg (ac856912f210 iio: adc: ad7606: add support for writing =
registers when using backend)
Merging phy-next/next (7dff18535b93 phy: PHY_LAN966X_SERDES should depend o=
n SOC_LAN966 || MCHP_LAN966X_PCI)
Merging soundwire/next (aac2f8363f77 soundwire: slave: fix an OF node refer=
ence leak in soundwire slave device)
Merging extcon/extcon-next (7041ed0dde83 extcon: Drop explicit initializati=
on of struct i2c_device_id::driver_data to 0)
Merging gnss/gnss-next (2014c95afece Linux 6.14-rc1)
Merging vfio/next (2bb447540e71 vfio/nvgrace-gpu: Add GB200 SKU to the devi=
d table)
Merging w1/for-next (33c145297840 w1: w1_therm: w1: Use HWMON_CHANNEL_INFO =
macro to simplify code)
Merging spmi/spmi-next (40384c840ea1 Linux 6.13-rc1)
Merging staging/staging-next (7b66aae77da5 staging: gpib: Remove depends on=
 BROKEN)
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
Merging scsi/for-next (2f9523091a97 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (3bcd901e4257 scsi: ufs: Constify the third pwr_c=
hange_notify() argument)
Merging vhost/linux-next (5820a3b08987 virtio_blk: Add support for transpor=
t error recovery)
Merging rpmsg/for-next (a64dcfb451e2 Linux 6.14-rc2)
Merging gpio-brgl/gpio/for-next (c88aa6829739 phy: mapphone-mdm6600: use gp=
iod_multi_set_value_cansleep)
CONFLICT (content): Merge conflict in drivers/iio/adc/ad7606_spi.c
Applying: fix up for "iio: adc: ad7606: use gpiod_multi_set_value_cansleep"
Merging gpio-intel/for-next (2014c95afece Linux 6.14-rc1)
Merging pinctrl/for-next (b1a67f9218de Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (0eee258cdf17 pinctrl: intel: Fix wrong bypa=
ss assignment in intel_pinctrl_probe_pwm())
Merging pinctrl-renesas/renesas-pinctrl (f752ee5b5b86 pinctrl: renesas: rza=
2: Fix potential NULL pointer dereference)
Merging pinctrl-samsung/for-next (2014c95afece Linux 6.14-rc1)
Merging pwm/pwm/for-next (e8af7c083520 pwm: Strengthen dependency for PWM_S=
IFIVE)
Merging ktest/for-next (f3a30016e4b5 ktest.pl: Fix typo "accesing")
Merging kselftest/next (a64dcfb451e2 Linux 6.14-rc2)
Merging kunit/test (a64dcfb451e2 Linux 6.14-rc2)
Merging kunit-next/kunit (e275f44e0a18 kunit: qemu_configs: sparc: use Zilo=
g console)
Merging livepatching/for-next (f76ad354146d Merge branch 'for-6.14/selftest=
s-dmesg' into for-next)
Merging rtc/rtc-next (97274527e8dc rtc: pcf2127: add BSM support)
Merging nvdimm/libnvdimm-for-next (f3dd9ae7f03a dax: Remove an unused field=
 in struct dax_operations)
Merging at24/at24/for-next (03480898cefe dt-bindings: eeprom: at24: Add com=
patible for Giantec GT24P128E)
Merging ntb/ntb-next (c620f56c70eb MAINTAINERS: Update AMD NTB maintainers)
Merging seccomp/for-next/seccomp (e1cec5107c39 seccomp: remove the 'sd' arg=
ument from __seccomp_filter())
Merging slimbus/for-next (2014c95afece Linux 6.14-rc1)
Merging nvmem/for-next (2014c95afece Linux 6.14-rc1)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (3a7f7785eae7 drivers/hv: add CPU offlining supp=
ort)
Merging auxdisplay/for-next (d5808b5b17e8 auxdisplay: seg-led-gpio: use gpi=
od_multi_set_value_cansleep)
Merging kgdb/kgdb/for-next (6beaa75cd24d kdb: Remove unused flags stack)
Merging hmm/hmm (40384c840ea1 Linux 6.13-rc1)
Merging cfi/cfi/next (2014c95afece Linux 6.14-rc1)
Merging mhi/mhi-next (c8006fbd0f4f bus: mhi: host: Remove unused functions)
Merging memblock/for-next (98b7beba1ee6 memblock: uniformly initialize all =
reserved pages to MIGRATE_MOVABLE)
Merging cxl/next (8760c1c0bf7e cxl/cdat: Remove redundant gp_port initializ=
ation)
Merging efi/next (2014c95afece Linux 6.14-rc1)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (c6bb909b8f11 Merge branch 'slab/for-6.15/kfree_=
rcu_tiny' into slab/for-next)
CONFLICT (content): Merge conflict in kernel/rcu/tiny.c
Merging random/master (93354d866ac4 prandom: remove next_pseudo_random32)
Merging landlock/next (78332fdb956f selftests/landlock: Add binaries to .gi=
tignore)
Merging rust/rust-next (beeb78d46249 MAINTAINERS: add Danilo Krummrich as R=
ust reviewer)
Merging sysctl/sysctl-next (dccf3c99febf sysctl: remove unneeded include)
Merging execve/for-next/execve (7e620b56d958 crash: Remove KEXEC_CORE_NOTE_=
NAME)
Merging bitmap/bitmap-for-next (65b98ea8b278 cpumask: drop cpumask_next_wra=
p_old())
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (0ef71a1dc3a5 Merge branch 'for-next/hardening' =
into for-next/kspp)
CONFLICT (content): Merge conflict in lib/Makefile
Applying: fix up for "lib: Move KUnit tests into tests/ subdirectory"
Merging nolibc/nolibc (a64dcfb451e2 Linux 6.14-rc2)
Merging iommufd/for-next (dc10ba25d43f iommufd/fault: Remove iommufd_fault_=
domain_attach/detach/replace_dev())
Merging turbostat/next (447c98c1ca4a tools/power turbostat: Add idle govern=
or statistics reporting)
Merging pwrseq/pwrseq/for-next (2014c95afece Linux 6.14-rc1)
Merging capabilities-next/caps-next (d48da4d5ed7b security: add trace event=
 for cap_capable)
Merging ipe/next (aefadf03b3e3 ipe: policy_fs: fix kernel-doc warnings)
Merging kcsan/next (9d89551994a4 Linux 6.13-rc6)
Merging crc/crc-next (cf1ea3a7c1f6 x86/crc32: improve crc32c_arch() code ge=
neration with clang)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)

--Sig_/cFhiWa9hupAUhby_6LHb4iG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmey4HgACgkQAVBC80lX
0GxVtgf9FJFqMblu4Hv5wzEjYNksB5KC/sLwWPo6m1X1V3/dJ8tOT+u3c5kybeDQ
aF4MZ5DAFPAgJWeHXEaMTGJCo1AD/J8N50vJE921m84cX4lUAD7PO44Nmog+T3no
VCgS+8+oLsiGcMQ5aIdx95NZxrPMGeid9KnNGB+FLrWvuwQ+ZWqH6oW00gg95zES
UhoJ/J3ow0myLi7ZeWfrc+7cylDfKlIeW6EnH4er5ZYj6NMb7KQZ/cHjbLdeaLs8
jgz8Uvu/vIxbQQG9mgHcYYq1mgzgMxCxliJIkq11NKG3veaQjyYg5YB+XGQ6TxCy
vprifDSAtpESOs8lccB5dI2NrXzOOw==
=JVN1
-----END PGP SIGNATURE-----

--Sig_/cFhiWa9hupAUhby_6LHb4iG--

