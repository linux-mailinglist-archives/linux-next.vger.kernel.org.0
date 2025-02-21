Return-Path: <linux-next+bounces-5527-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D754FA3ECC1
	for <lists+linux-next@lfdr.de>; Fri, 21 Feb 2025 07:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68A743B3114
	for <lists+linux-next@lfdr.de>; Fri, 21 Feb 2025 06:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31111FBC94;
	Fri, 21 Feb 2025 06:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Dxp9fzNS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBEE17591;
	Fri, 21 Feb 2025 06:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740118727; cv=none; b=YA6Cg7I+EGryviH5goeUHzN/ztkmpJgBj1yRctL78hV6mZDFe0yn9GoCwuQaItYkQJuGqRHCHvAnyF9E9s6vUApGrW6AxyFpGONuxWrW/aZJPwW5kkFCZhk0W2oBLB85zX6UKLe16VcGn3kAmO96ECW5IjbsV8x24lWp3f9Hw6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740118727; c=relaxed/simple;
	bh=KBk5phPC7FWZiwI5hBMnoN/FH3xJHjL4iYq6+nYN0W4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JKTqoeXrXXBl4Lz3iuWFiv4PyAzmQA3audXIvRHP8knJvlD92F2nbroJzF84WN3dvaLbG3pGgKNs7PnPMhxMWOKKHQhvNortfXsBLqv0rfMEgfhvvnRfNt1pglLKQX6quIRzhclInHTWX+wN5gosCvFbBrn50OEUPgloA/56K98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Dxp9fzNS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740118712;
	bh=y8wYoW1yi4yLglTIhc27upMosEb+eyWJQOHt9vQOyoU=;
	h=Date:From:To:Cc:Subject:From;
	b=Dxp9fzNSiQ1fZn2nSkbDCxIf+lzy4jYZdhweKez86vMEu2kezimnbSAJAJjegFUVo
	 4kXkC+cF82pdIBAFS5tes2n5cvSZOkQDVT6ooDXFu2YzCh+dGDaolO/w5Ck2SQoHR0
	 tWQCLeL7FLBp0fU1h/OFIWRQTscitFEWxCXjaGyjD0C4VXRIgab50kXt01N4JxfuvW
	 JjZVim6weA27IuNpPik3kANoYwAbCfghP/bXa5xQ5VzDWpbG9Lb8f3OWbRQu9zlUxu
	 noexcFfvkwINZ7qq2faJcbQmhQT6pJvUjnxpbknhEqhU+nS0ziJizuUhdYDPp5X8jC
	 2Mf/VzAsT164Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yzg1N5jSkz4wcT;
	Fri, 21 Feb 2025 17:18:32 +1100 (AEDT)
Date: Fri, 21 Feb 2025 17:18:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 21
Message-ID: <20250221171831.7871c4bd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8jAtGCUh57rJeYjYeRp/HHq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8jAtGCUh57rJeYjYeRp/HHq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250220:

The mm tree lost its build failure.

The pmdomain tree still had its build failure so I used the version from
next-20250219.

The sound-asoc tree lost its build failure.

The leds-lj tree gained a build failure so I used the version from
next-20250220.

Non-merge commits (relative to Linus' tree): 4781
 5544 files changed, 291146 insertions(+), 109051 deletions(-)

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
Merging origin/master (27eddbf34490 Merge tag 'net-6.14-rc4' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging fixes/fixes (fac04efc5c79 Linux 6.13-rc2)
Merging ext4-fixes/fixes (4bbf9020becb Linux 6.13-rc4)
Merging vfs-brauner-fixes/vfs.fixes (b8d975e7cccf Merge tag 'fuse-fixes-6.1=
4-rc4' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse)
Merging fscrypt-current/for-current (2014c95afece Linux 6.14-rc1)
Merging fsverity-current/for-current (2014c95afece Linux 6.14-rc1)
Merging btrfs-fixes/next-fixes (94a4abd7e129 Merge branch 'misc-6.14' into =
next-fixes)
Merging vfs-fixes/fixes (60a600243244 hostfs: fix string handling in __dent=
ry_name())
Merging erofs-fixes/fixes (6422cde1b0d5 erofs: use buffered I/O for file-ba=
cked mounts by default)
Merging nfsd-fixes/nfsd-fixes (4990d098433d NFSD: Fix CB_GETATTR status fix)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (228a1157fb9f Merge tag '6.13-rc-part1-SM=
B3-client-fixes' of git://git.samba.org/sfrench/cifs-2.6)
Merging bcachefs/for-next (77308424ba26 bcachefs: bs > ps support)
Merging fscrypt/for-next (75eb8b9410ee Revert "fscrypt: relax Kconfig depen=
dencies for crypto API algorithms")
Merging btrfs/for-next (ac7c66c504ab Merge branch 'for-next-next-v6.14-2025=
0217' into for-next-20250217)
Merging ceph/master (3981be13ec1b ceph: exchange hardcoded value on NAME_MA=
X)
Merging cifs/for-next (0bddcdc69026 CIFS: Propagate min offload along with =
other parameters from primary to secondary channels.)
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
Merging f2fs/dev (48ea8b200414 f2fs: fix to avoid panic once fallocation fa=
ils for pinfile)
Merging fsverity/for-next (a19bcde49998 Revert "fsverity: relax build time =
dependency on CRYPTO_SHA256")
Merging fuse/for-next (150b838b03e8 fuse: optmize missing FUSE_LINK support)
Merging gfs2/for-next (1259f36ab395 gfs2: Fix additional unlikely request c=
ancelation race)
Merging jfs/jfs-next (06f4613f3935 jfs: Remove reference to bh->b_page)
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
Merging vfs-brauner/vfs.all (a6b0914a43ce Merge branch 'vfs-6.15.overlayfs'=
 into vfs.all)
Merging vfs/for-next (2e72b1e0aac2 Merge branch 'work.d_revalidate' into fo=
r-next)
Merging mm-hotfixes/mm-hotfixes-unstable (4e45f3755fc2 mm: page_isolation: =
avoid calling folio_hstate() without hugetlb_lock)
Merging fs-current (c8c39865c1fc Merge branch 'next-fixes' of git://git.ker=
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
Merging powerpc-fixes/fixes (d262a192d38e powerpc/code-patching: Fix KASAN =
hit by not flagging text patching area as VM_ALLOC)
Merging s390-fixes/fixes (c3a589fd9fcb s390/boot: Fix ESSA detection)
Merging net/main (992ee3ed6e9f net: phy: qcom: qca807x fix condition for DA=
C_DSP_BIAS_CURRENT)
Merging bpf/master (dbf7cc560007 Merge branch 'bpf-skip-non-exist-keys-in-g=
eneric_map_lookup_batch')
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
Merging rdma-fixes/for-rc (8238c7bd8420 RDMA/bnxt_re: Fix the statistics fo=
r Gen P7 VF)
Merging sound-current/for-linus (9af3b4f2d879 ALSA: usb-audio: Re-add sampl=
e rate quirk for Pioneer DJM-900NXS2)
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
Merging char-misc.current/char-misc-linus (32ce5d87d522 bus: simple-pm-bus:=
 fix forced runtime PM use)
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
Merging scsi-fixes/fixes (5233e3235dec scsi: qla1280: Fix kernel oops when =
debug level > 2)
Merging drm-fixes/drm-fixes (0ad2507d5d93 Linux 6.14-rc3)
Merging drm-intel-fixes/for-linux-next-fixes (8058b49bf6ff drm/i915/dp: Fix=
 disabling the transcoder function in 128b/132b mode)
Merging mmc-fixes/fixes (3e68abf2b9ce mmc: mtk-sd: Fix register settings fo=
r hs400(es) mode)
Merging rtc-fixes/rtc-fixes (2014c95afece Linux 6.14-rc1)
Merging gnss-fixes/gnss-linus (0ad2507d5d93 Linux 6.14-rc3)
Merging hyperv-fixes/hyperv-fixes (2a1852f9062b fbdev: hyperv_fb: iounmap()=
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
Merging efi-fixes/urgent (bbc4578537e3 efi: Use BIT_ULL() constants for mem=
ory attributes)
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
Merging ftrace-fixes/ftrace/fixes (c8c9b1d2d5b4 fgraph: Fix set_graph_notra=
ce with setting TRACE_GRAPH_NOTRACE_BIT)
Merging ring-buffer-fixes/ring-buffer/fixes (97937834ae87 ring-buffer: Upda=
te pages_touched to reflect persistent buffer content)
Merging trace-fixes/trace/fixes (60295b944ff6 tracing: gfp: Fix the GFP enu=
m values shown for user space tracing tools)
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging tip-fixes/tip/urgent (041e057fd5b9 Merge branch into tip/master: 'p=
erf/urgent')
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
Merging mm/mm-everything (152cf5b6d6c3 foo)
  456649bdb7f2 ("Revert "selftests/mm: remove local __NR_* definitions"")
  476efacf3ba8 ("mm: fix possible NULL pointer dereference in __swap_duplic=
ate")
  580fb64c28bf ("mm/hugetlb_vmemmap: fix memory loads ordering")
  6239c69de5ac ("mm/hugetlb: wait for hugetlb folios to be freed")
  748ed72e4188 ("arm: pgtable: fix NULL pointer dereference issue")
  7c6b0ea3c7b4 ("m68k: sun3: add check for __pgd_alloc()")
  7d8fbb29e925 ("x86/vmemmap: use direct-mapped VA instead of vmemmap-based=
 VA")
  8a9ef08056ab ("mm-memory-failure-update-ttu-flag-inside-unmap_poisoned_fo=
lio-v3")
  8f9a75a753c1 ("Documentation: fix doc link to fault-injection.rst")
  904c20596828 ("dma: kmsan: export kmsan_handle_dma() for modules")
  a2c12bc6be41 ("mm: page_isolation: avoid calling folio_hstate() without h=
ugetlb_lock")
  b31fb1a6575f ("selftests/damon/damos_quota_goal: handle minimum quota tha=
t cannot be further reduced")
  c7b0739e09f3 ("mm: memory-hotplug: check folio ref count first in do_migr=
ate_range")
  d2621ae461c5 ("mm: memory-failure: update ttu flag inside unmap_poisoned_=
folio")
  e7cf417467c5 ("hwpoison, memory_hotplug: lock folio before unmap hwpoison=
ed folio")
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
Merging arm64/for-next/core (e6747d19291c Merge branch 'for-next/el2-enable=
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
Merging imx-mxs/for-next (a8fd7fa3f984 Merge branch 'imx/dt64' into for-nex=
t)
Merging mediatek/for-next (b7e3ba5f431d Merge branch 'v6.14-next/soc' into =
for-next)
Merging mvebu/for-next (960766b45fa2 arm64: dts: marvell: Add missing board=
 compatible for IEI-Puzzle-M801)
Merging omap/for-next (065f3bd4f22b Merge branch 'omap-for-v6.15/dt' into t=
mp/omap-next-20250205.163245)
Merging qcom/for-next (c177fed7617d Merge branches 'arm64-for-6.15', 'clk-f=
or-6.15', 'drivers-fixes-for-6.14' and 'drivers-for-6.15' into for-next)
Merging renesas/next (ca67fdc09421 Merge branches 'renesas-arm-defconfig-fo=
r-v6.15', 'renesas-arm-soc-for-v6.15', 'renesas-drivers-for-v6.15', 'renesa=
s-dt-bindings-for-v6.15' and 'renesas-dts-for-v6.15' into renesas-next)
Merging reset/reset/next (2014c95afece Linux 6.14-rc1)
Merging rockchip/for-next (03fa18966647 Merge branch 'v6.14-armsoc/dtsfixes=
' into for-next)
Merging samsung-krzk/for-next (413415a525af Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (3fb3fc0015ff Merge branches 'for-next/scmi/upd=
ates' and 'for-next/ffa/updates', tag 'scmi-fix-6.14' of ssh://gitolite.ker=
nel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-linux-next)
Merging sophgo/for-next (f047a9285f9f riscv: sophgo: dts: add cooling maps =
for Milk-V Pioneer)
Merging spacemit/for-next (5b90a3d6092d riscv: dts: spacemit: Add Milk-V Ju=
piter board device tree)
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
Merging xilinx/for-next (ee797d72b9fc Merge branch 'zynqmp/dt' into for-nex=
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
Merging mips/mips-next (0ad2507d5d93 Linux 6.14-rc3)
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
Merging fs-next (8dca15f9e958 Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (9022df7f5e05 Merge branch 'for-6.14-cpu_sync-fixup=
' into for-next)
Merging pci/next (6f01230b1cac Merge branch 'pci/endpoint')
Merging pstore/for-next/pstore (5674609535ba pstore: Change kmsg_bytes stor=
age size to u32)
Merging hid/for-next (594050682df1 Merge branch 'for-6.14/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (7e45b505e699 Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i2c-host/i2c/i2c-host (3c59e2039afc i2c: amd-asf: Set cmd variable =
when encountering an error)
Merging i3c/i3c/next (a892ee4cf22a i3c: master: svc: Flush FIFO before send=
ing Dynamic Address Assignment(DAA))
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (8df0f002827e hwmon: (xgene-hwmon) use app=
ropriate type for the latency value)
Merging jc_docs/docs-next (56f2399f0e90 Documentation: typo fixes)
Merging v4l-dvb/next (955a999ca233 media: platform: rpi1-cfe: drop vb2_ops_=
wait_prepare/finish)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (f0293c861552 Merge branch 'pm-cpufreq' into linux-ne=
xt)
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
Merging net-next/main (7b5b7a597fbc eth: fbnic: Add ethtool support for IRQ=
 coalescing)
Merging bpf-next/for-next (d0da259de581 Merge branch 'selftests-bpf-tc_link=
s-tc_opts-unserialize-tests')
CONFLICT (content): Merge conflict in kernel/bpf/btf.c
Merging ipsec-next/master (e3aa43a50a64 xfrm: prevent high SEQ input in non=
-ESN mode)
Merging mlx5-next/mlx5-next (a64dcfb451e2 Linux 6.14-rc2)
Merging netfilter-next/main (4e41231249f4 Merge branch '100GbE' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue)
Merging ipvs-next/main (4e41231249f4 Merge branch '100GbE' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/tnguy/next-queue)
Merging bluetooth/master (74bd17f7fe37 Bluetooth: hci_qca: use the power se=
quencer for wcn6750)
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
Merging crypto/master (c346fef6fef5 crypto: inside-secure - Eliminate dupli=
cation in top-level Makefile)
Merging drm/drm-next (0ed1356af8f6 Merge tag 'drm-misc-next-2025-02-12' of =
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next)
Merging drm-exynos/for-linux-next (81a50378559b drm/exynos: Remove unnecess=
ary checking)
Merging drm-misc/for-linux-next (4ce2c7e201c2 drm/panel: ilitek-ili9882t: f=
ix GPIO name in error message)
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
Merging drm-xe/drm-xe-next (94030a1d3283 drm/xe/client: Skip show_run_ticks=
 if unable to read timestamp)
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
Merging ieee1394/for-next (1c745720bec2 drivers: firewire: firewire-cdev.h:=
 fix identation on a kernel-doc markup)
Merging sound-asoc/for-next (ccf62ac683c2 Merge remote-tracking branch 'aso=
c/for-6.15' into asoc-next)
Merging modules/modules-next (afa92869776a params: Annotate struct module_p=
aram_attrs with __counted_by())
Merging input/next (9995b98a4b2a MAINTAINERS: Add entries for Apple Z2 touc=
hscreen driver)
Merging block/for-next (d8a1d6ebcafc Merge branch 'for-6.15/io_uring-epoll-=
wait' into for-next)
Merging device-mapper/for-next (a8b8a126c857 dm: Enable inline crypto passt=
hrough for striped target)
Merging libata/for-next (0ce4a0d1551f ata: sata_via: Use str_up_down() help=
er in vt6420_prereset())
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (cb71db3b2cea mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (bd3152428217 dt-bindings: mfd: qcom,tcsr: Add com=
patible for MSM8937)
Merging backlight/for-backlight-next (d1ebaf003a06 MAINTAINERS: Add entries=
 for Apple DWI backlight controller)
Merging battery/for-next (bbcfe510ecd4 power: supply: axp20x_battery: Updat=
e temp sensor for AXP717 from device tree)
  a944cfd799e8 ("dt-bindings: power: reset: xilinx: Make "interrupts" prope=
rty optional")
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
Merging iommu/next (add43c4fbc92 iommu/vt-d: Make intel_iommu_drain_pasid_p=
rq() cover faults for RID)
Merging audit/next (2014c95afece Linux 6.14-rc1)
Merging devicetree/for-next (7526e4fe550f dt-bindings: trivial-devices: Add=
 ti,tps546b24)
Merging dt-krzk/for-next (854a080f0b73 loongarch: dts: remove non-existent =
DAC from 2k1000-ref)
Merging mailbox/for-next (4783ce32b080 riscv: export __cpuid_to_hartid_map)
Merging spi/for-next (155caaddc3e2 Merge remote-tracking branch 'spi/for-6.=
15' into spi-next)
Merging tip/master (929ce2d9f919 Merge branch into tip/master: 'x86/misc')
Merging clockevents/timers/drivers/next (fafc3058cc2f dt-bindings: timer: e=
xynos4210-mct: Add samsung,exynos990-mct compatible)
Merging edac/edac-for-next (b3205f5a415b Merge branch 'edac-drivers' into e=
dac-for-next)
Merging ftrace/for-next (04787ae88833 Merge tools/for-next)
Merging rcu/next (236815038841 Merge branches 'docs.2025.02.04a', 'lazypree=
mpt.2025.02.05a', 'misc.2025.02.06a', 'srcu.2025.02.05a' and 'torture.2025.=
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
Merging sched-ext/for-next (a7d8e69496ef Merge branch 'for-6.15' into for-n=
ext)
Merging drivers-x86/for-next (d497c47481f8 platform/x86: ideapad-laptop: us=
e dev_groups to register attribute groups)
Merging chrome-platform/for-next (9fc83373f0ff platform/chrome: cros_ec_typ=
ec: Add support for setting USB mode via sysfs)
Merging chrome-platform-firmware/for-firmware-next (2014c95afece Linux 6.14=
-rc1)
Merging hsi/for-next (40384c840ea1 Linux 6.13-rc1)
Merging leds-lj/for-leds-next (2f372a5dce68 leds: st1202: Refactor st1202_l=
ed_set() to use !! operator for boolean conversion)
$ git reset --hard HEAD^
Merging next-20250220 version of leds-lj
Merging ipmi/for-next (83d8c79aa958 ipmi: ssif_bmc: Fix new request loss wh=
en bmc ready for a response)
Merging driver-core/driver-core-next (2ce177e9b364 Merge 6.14-rc3 into driv=
er-core-next)
Merging usb/usb-next (f8da37e46253 Merge 6.14-rc3 into usb-next)
CONFLICT (content): Merge conflict in drivers/usb/typec/ucsi/ucsi_acpi.c
Merging thunderbolt/next (35ad0d62da83 MAINTAINERS: Use my kernel.org addre=
ss for USB4/Thunderbolt work)
Merging usb-serial/usb-next (6a7713ec5337 USB: serial: mos7840: drop unused=
 defines)
Merging tty/tty-next (1bd2aad57da9 serial: mctrl_gpio: split disable_ms int=
o sync and no_sync APIs)
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
Merging gnss/gnss-next (0ad2507d5d93 Linux 6.14-rc3)
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
Merging scsi/for-next (f6d13738292e Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (7e72900272b6 Merge patch series "Support Multi-f=
requency scale for UFS")
Merging vhost/linux-next (5820a3b08987 virtio_blk: Add support for transpor=
t error recovery)
Merging rpmsg/for-next (a64dcfb451e2 Linux 6.14-rc2)
Merging gpio-brgl/gpio/for-next (63cdf6241ac7 gpiolib: don't build HTE code=
 with CONFIG_HTE disabled)
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
Merging nvmem/for-next (4770132f37db nvmem: qfprom: switch to 4-byte aligne=
d reads)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (3a7f7785eae7 drivers/hv: add CPU offlining supp=
ort)
Merging auxdisplay/for-next (fce85f3da08b auxdisplay: MAX6959 should select=
 BITREVERSE)
Merging kgdb/kgdb/for-next (6beaa75cd24d kdb: Remove unused flags stack)
Merging hmm/hmm (40384c840ea1 Linux 6.13-rc1)
Merging cfi/cfi/next (2014c95afece Linux 6.14-rc1)
Merging mhi/mhi-next (0f96e4d32983 bus: mhi: host: pci_generic: Use pci_try=
_reset_function() to avoid deadlock)
  0f96e4d32983 ("bus: mhi: host: pci_generic: Use pci_try_reset_function() =
to avoid deadlock")
Merging memblock/for-next (98b7beba1ee6 memblock: uniformly initialize all =
reserved pages to MIGRATE_MOVABLE)
Merging cxl/next (d5d2106e2118 cxl: Document missing sysfs files)
Merging efi/next (1c30e381fe6e x86/efi/mixed: Move mixed mode startup code =
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
Merging sysctl/sysctl-next (2694b6bb871d MAINTAINERS: Update sysctl file li=
st in MAINTAINERS)
Merging execve/for-next/execve (7e620b56d958 crash: Remove KEXEC_CORE_NOTE_=
NAME)
Merging bitmap/bitmap-for-next (ea5fa879a1d4 cpumask: drop cpumask_next_wra=
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
Merging crc/crc-next (a0bd462f3a13 x86/crc: add ANNOTATE_NOENDBR to suppres=
s objtool warnings)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)

--Sig_/8jAtGCUh57rJeYjYeRp/HHq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme4GrcACgkQAVBC80lX
0GwuHAf8C0FDQtW6D+VViuMs66YrlS9K6PRVV3TaucP/n1M9l6XZBbmuENMBcRm2
3hg7QrQ0UE1Fnj3PmNC+F0d4ooRw3+AcemljEDx1pmF/tRjPb894fC2cAOXfE43I
urPMVu5SQ5lDgboPHt4GA95/UWLHrwvpppg3mDbCUvVlOq5w24IQyK+nxKBt45KS
jPvDtOTtcLbajjI51kLNgb2hbf90OCC+kPNSUww/dKNQil1O3xo/50Md/8np1XPN
7ITtuwGdmrWzr3BKfpnCvc2E3GUj/lcjQ4x9FjsR2gktB5rOsmOycPeAGxsHv7ML
v2dxX0Xa5BZEl+eLqy+dejYhdjrjKw==
=4o/1
-----END PGP SIGNATURE-----

--Sig_/8jAtGCUh57rJeYjYeRp/HHq--

