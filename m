Return-Path: <linux-next+bounces-5696-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FFDA5640B
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 10:36:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8EEC1889BE6
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 09:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F182C20CCD3;
	Fri,  7 Mar 2025 09:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QavGfLQ5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3248320C015;
	Fri,  7 Mar 2025 09:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741339993; cv=none; b=jF2IUrSMqCSHhRpLqPsf/QvLTx4FsiptI9wg0eYpcxyv7Qf7mSEvAhyEIKrWZg5Sgwcs2bVviDrkaVbOiO6JAgrfuxC30soUfGguamp0RVcHjmvQnJY7oMQDzratPZdbz0Wyh8tc1un9Bl9eAo+LVoN1Uy2TD3Xq4CWIr152SGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741339993; c=relaxed/simple;
	bh=qVP4Z4cqNYwBCOMylWHtfXdm18gFAGI3z2KfIMBZX6E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qd2jQ99/qf4EFxDfs+9BpFTLSPdU6kTjnfkm1G14v7SilwajAlkr9ZyOrGYNZJ/tUUgQTaORzx7471Vd6Cg+5fSDScdhv/eXz8k6kUEoLRxEeqAp0FP2NPOn4SbAVvQGDffXTCsNVvRNpmWpHlj56a91v77062OH3sa/kelTqjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QavGfLQ5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741339988;
	bh=gro+u2x1SU/42LZ6nTeuNTPqZo3q9pFDQxcKAkrg8B8=;
	h=Date:From:To:Cc:Subject:From;
	b=QavGfLQ5Mm52Oy+RJZtY97v1m8HkCxkSNw8QP+pIbOv8eVML1H9uo+v3NOHoy5dbc
	 CTbsYQJIZ23Gid+5iCU3e69xjuWvDtjtxkV+/t0Du2rYi1psajZuQAbQOROT4M1Iqf
	 odm7NsP7pR+X2wvPnYjf+3v2YQf1KYeWp72xo5vT4QihJaUTKEHqdYchvBXKsMJG1k
	 M0pK96Tu1bEapGPQe62ftO4SfrXE2kk85+rBhE1mJ9fmu0cawS5vIH0mwVyl+2GbaI
	 2h3lxmQYmM+s01dyWJ3gXm4LHzuaNGpqw0BkPAjm5XDzJ6fZCCiqMdmwpLiy83aFq6
	 6Cq6N98gU3iqw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z8LgS2yTyz4wcj;
	Fri,  7 Mar 2025 20:33:08 +1100 (AEDT)
Date: Fri, 7 Mar 2025 20:33:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 7
Message-ID: <20250307203307.3cf84557@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tx8pVxbTwLyielJM/ZX2o9V";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tx8pVxbTwLyielJM/ZX2o9V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

News: there will be no linux-next release next Monday.

Changes since 20250306:

The bluetooth tree gained build failures so I used the version from
next-20250306.

The drm-msm tree gained a build failure so I used the version from
next-20250306.

The drm-xe tree gained a conflict and semantic conflicts against the
mm tree.

The tip tree gained conflicts agsinst the mm tree.
The tip tree still had its build failure so I used the version from
next-20250303.

The kvm-arm tree lost its build failure.

The cxl tree gained a conflict the hmm tree.

Non-merge commits (relative to Linus' tree): 8612
 8890 files changed, 449382 insertions(+), 174421 deletions(-)

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

I am currently merging 386 trees (counting Linus' and 147 trees of bug
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
Merging origin/master (f315296c92fd Merge tag 'net-6.14-rc6' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging fixes/fixes (fac04efc5c79 Linux 6.13-rc2)
Merging ext4-fixes/fixes (4bbf9020becb Linux 6.13-rc4)
Merging vfs-brauner-fixes/vfs.fixes (d385c8bceb14 pid: Do not set pid_max i=
n new pid namespaces)
Merging fscrypt-current/for-current (2014c95afece Linux 6.14-rc1)
Merging fsverity-current/for-current (2014c95afece Linux 6.14-rc1)
Merging btrfs-fixes/next-fixes (e83be4ca3b94 Merge branch 'misc-6.14' into =
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
Merging fscrypt/for-next (13dc8eb90067 fscrypt: mention init_on_free instea=
d of page poisoning)
Merging btrfs/for-next (9a4c4b52b49f Merge branch 'for-next-next-v6.14-2025=
0303' into for-next-20250303)
Merging ceph/master (3981be13ec1b ceph: exchange hardcoded value on NAME_MA=
X)
Merging cifs/for-next (391fe8d410e5 CIFS: Propagate min offload along with =
other parameters from primary to secondary channels.)
Merging configfs/for-next (84147f4e84c4 configfs: improve item creation per=
formance)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (a3672304abf2 dlm: fix error if active rsb is not hashed)
Merging erofs/dev (e6e330b7b0ca erofs: move {in,out}pages into struct z_ero=
fs_decompress_req)
Merging exfat/dev (dad067a20620 exfat: remove count used cluster from exfat=
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
Merging gfs2/for-next (104b4d597ff2 gfs2: remove redundant warnings)
Merging jfs/jfs-next (0d250b1c5248 fs/jfs: consolidate sanity checking in d=
bMount)
Merging ksmbd/ksmbd-for-next (a46b9b0d7451 ksmbd: Use str_read_write() and =
str_true_false() helpers)
Merging nfs/linux-next (7eb172143d55 Linux 6.14-rc5)
Merging nfs-anna/linux-next (9084ed79ddaa lsm,nfs: fix memory leak of lsm_c=
ontext)
Merging nfsd/nfsd-next (614a76b50822 nfsd: handle errors from rpc_call_asyn=
c())
Merging ntfs3/master (8b12017c1b95 fs/ntfs3: Remove unused ntfs_flush_inode=
s)
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
Merging vfs-brauner/vfs.all (d893b3945fca Merge branch 'vfs-6.15.orangefs' =
into vfs.all)
Merging vfs/for-next (2e72b1e0aac2 Merge branch 'work.d_revalidate' into fo=
r-next)
Merging mm-hotfixes/mm-hotfixes-unstable (9260084bcf8c mm: page_isolation: =
avoid calling folio_hstate() without hugetlb_lock)
Merging fs-current (e70067f24954 Merge branch 'next-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/kdave/linux.git)
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
Merging net/main (f315296c92fd Merge tag 'net-6.14-rc6' of git://git.kernel=
.org/pub/scm/linux/kernel/git/netdev/net)
Merging bpf/master (6ccf6adb05d0 xsk: Fix __xsk_generic_xmit() error code w=
hen cq is full)
Merging ipsec/master (0aae2867aa60 xfrm_output: Force software GSO only in =
tunnel mode)
Merging netfilter/main (1438f5d07b9a rtnetlink: fix netns leak with rtnl_se=
tlink())
Merging ipvs/main (1438f5d07b9a rtnetlink: fix netns leak with rtnl_setlink=
())
Merging wireless/for-next (3c6a041b317a Merge tag 'wireless-2025-03-04' of =
https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless)
Merging ath/for-current (3640dbc1f75c wifi: iwlwifi: Fix A-MSDU TSO prepara=
tion)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (e8e6087c2f74 RDMA/bnxt_re: Fix reporting maximum=
 SRQs on P7 chips)
Merging sound-current/for-linus (8463d2adbe19 ALSA: hda/realtek: Add suppor=
t for ASUS Zenbook UM3406KA Laptops using CS35L41 HDA)
Merging sound-asoc-fixes/for-linus (e26f1cfeac67 ASoC: cs42l43: Fix maximum=
 ADC Volume)
Merging regmap-fixes/for-linus (32ffed055dce regmap-irq: Add missing kfree(=
))
Merging regulator-fixes/for-linus (1c81a8c78ae6 regulator: core: Fix deadlo=
ck in create_regulator())
Merging spi-fixes/for-linus (91cf42c63f2d spi: microchip-core: prevent RX o=
verflows when transmit size > FIFO size)
Merging pci-current/for-linus (2014c95afece Linux 6.14-rc1)
Merging driver-core.current/driver-core-linus (78eb41f518f4 drivers: core: =
fix device leak in __fw_devlink_relax_cycles())
Merging tty.current/tty-linus (0ad2507d5d93 Linux 6.14-rc3)
Merging usb.current/usb-linus (b13abcb7ddd8 usb: typec: ucsi: Fix NULL poin=
ter access)
Merging usb-serial-fixes/usb-linus (6232f0d8e100 USB: serial: option: fix T=
elit Cinterion FE990A name)
Merging phy/fixes (7eb172143d55 Linux 6.14-rc5)
Merging staging.current/staging-linus (2014c95afece Linux 6.14-rc1)
Merging iio-fixes/fixes-togreg (cc2c3540d947 iio: filter: admv8818: Force i=
nitialization of SDO)
Merging counter-current/counter-current (8744dcd4fc78 counter: stm32-lptime=
r-cnt: fix error handling when enabling)
Merging char-misc.current/char-misc-linus (2397d61ee45c Revert "drivers/car=
d_reader/rtsx_usb: Restore interrupt based detection")
Merging soundwire-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging thunderbolt-fixes/fixes (7eb172143d55 Linux 6.14-rc5)
Merging input-current/for-linus (d85862ccca45 Input: i8042 - swap old quirk=
 combination with new quirk for more devices)
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
  c2a5f8c4f28f ("ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP")
Merging kvm-fixes/master (916b7f42b3b3 kvm: retry nx_huge_page_recovery_thr=
ead creation)
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
Merging drm-fixes/drm-fixes (7eb172143d55 Linux 6.14-rc5)
Merging drm-intel-fixes/for-linux-next-fixes (d1039a3c12ff drm/i915/mst: up=
date max stream count to match number of pipes)
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
Merging gpio-brgl-fixes/gpio/for-current (391b41f983bf gpio: rcar: Fix miss=
ing of_node_put() call)
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
Merging rust-fixes/rust-fixes (0ea4c3906416 rust: workqueue: add missing ne=
wline to pr_info! examples)
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
Merging tip-fixes/tip/urgent (4c2880349d6c Merge branch into tip/master: 'x=
86/urgent')
Merging slab-fixes/slab/for-next-fixes (dfd3df31c9db mm/slab/kvfree_rcu: Sw=
itch to WQ_MEM_RECLAIM wq)
Merging drm-msm-fixes/msm-fixes (73f69c6be2a9 drm/msm/dsi/phy: Do not overw=
ite PHY_CMN_CLK_CFG1 when choosing bitclk source)
Merging uml-fixes/fixes (96178631c3f5 um: convert irq_lock to raw spinlock)
Merging drm-misc-fixes/for-linux-next-fixes (9af152dcf1a0 drm/gma500: Add N=
ULL check for pci_gfx_root in mid_get_vbt_data())
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (0ad2507d5d93 Linux 6.14-rc3)
Merging mm-nonmm-stable/mm-nonmm-stable (0ad2507d5d93 Linux 6.14-rc3)
Merging mm/mm-everything (f7502622028b foo)
Merging kbuild/for-next (a77b570b6c3f modpost: use strstarts() to clean up =
parse_source_files())
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (41453107bfc3 perf machine: Fix insertion of P=
ERF_RECORD_KSYMBOL related kernel maps)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/for-next (aef7ee7649e0 dma-debug: fix physical address =
calculation for struct dma_debug_entry)
Merging asm-generic/master (9e81c965742c io.h: drop unused headers)
Merging alpha/alpha-next (1523226edda5 alpha: Use str_yes_no() helper in pc=
i_dac_dma_supported())
Merging arm/for-next (f520fab580c9 ARM: 9440/1: cacheinfo fix format field =
mask)
Merging arm64/for-next/core (eb1df6e758a0 Merge branches 'for-next/amuv1-av=
g-freq', 'for-next/pkey_unrestricted', 'for-next/sysreg', 'for-next/pgtable=
-cleanups' and 'for-next/kselftest' into for-next/core)
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
  d0b7662f9a68 ("ARM: dts: bcm2711: Fix xHCI power-domain")
Merging davinci/davinci/for-next (58abc69e479c ARM: dts: ti: davinci: Align=
 GPIO hog name with bindings)
Merging drivers-memory/for-next (b9c791c65ced Merge branch 'mem-ctrl-next' =
into for-next)
Merging imx-mxs/for-next (a76206a60d15 Merge branch 'imx/dt64' into for-nex=
t)
Merging mediatek/for-next (a8a297e8bb3d Merge branch 'v6.14-next/soc' into =
for-next)
Merging mvebu/for-next (960766b45fa2 arm64: dts: marvell: Add missing board=
 compatible for IEI-Puzzle-M801)
Merging omap/for-next (065f3bd4f22b Merge branch 'omap-for-v6.15/dt' into t=
mp/omap-next-20250205.163245)
Merging qcom/for-next (b098bcd8278b Merge branches 'arm32-for-6.15', 'arm64=
-defconfig-for-6.15', 'arm64-fixes-for-6.14', 'arm64-for-6.15', 'clk-fixes-=
for-6.14', 'clk-for-6.15', 'drivers-fixes-for-6.14' and 'drivers-for-6.15' =
into for-next)
Merging renesas/next (1756f54e0750 Merge branch 'renesas-dts-for-v6.15' int=
o renesas-next)
Merging reset/reset/next (2014c95afece Linux 6.14-rc1)
Merging rockchip/for-next (e06522d35715 Merge branch 'v6.15-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (dd633bdf9dbf Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (e16503f08126 Merge tags 'scmi-updates-6.15', '=
juno-updates-6.15', 'ffa-updates-6.15' and 'smccc-update-6.15' of ssh://git=
olite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-linux=
-next)
Merging sophgo/for-next (5277657d5383 riscv: dts: sophgo: sg2042: add pinct=
rl support)
Merging spacemit/for-next (5b90a3d6092d riscv: dts: spacemit: Add Milk-V Ju=
piter board device tree)
Merging stm32/stm32-next (1e494daa7e28 ARM: dts: stm32: add usr3 LED node t=
o stm32f769-disco)
Merging sunxi/sunxi/for-next (e2d0b639a4d9 Merge branch 'sunxi/clk-for-6.15=
' into sunxi/for-next)
Merging tee/next (a7562ff02879 Merge branch 'optee_for_v6.14' into next)
Merging tegra/for-next (208057641b46 Merge branch for-6.15/arm64/dt into fo=
r-next)
  90a1dc90d08b ("arm64: tegra: Remove unused and undocumented "regulator-ra=
mp-delay-scale" property")
Merging thead-dt/thead-dt-for-next (c95c1362e5bc riscv: dts: thead: Add mai=
lbox node)
Merging ti/ti-next (6ef7e3d1f941 Merge branch 'ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (d6ccf528cb3c Merge branch 'zynqmp/dt' into for-nex=
t)
Merging clk/clk-next (fbe661983152 Merge branch 'clk-cleanup' into clk-next)
Merging clk-imx/for-next (06a61b5cb6a8 clk: imx8mp: inform CCF of maximum f=
requency of clocks)
Merging clk-renesas/renesas-clk (e1a098330ef0 clk: renesas: r9a09g047: Add =
clock and reset signals for the TSU IP)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (ddd3dc132472 Merge branch 'loongarch-kvm'=
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
Merging s390/for-next (66509a567844 Merge branch 'features' into for-next)
Merging sh/for-next (2014c95afece Linux 6.14-rc1)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (2d2b61ae38bd um: Remove unused asm/archparam.h header)
Merging xtensa/xtensa-for-next (dbef257ab7fa xtensa: ptrace: Remove zero-le=
ngth alignment array)
Merging fs-next (692b72d4ecf3 Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (9022df7f5e05 Merge branch 'for-6.14-cpu_sync-fixup=
' into for-next)
Merging pci/next (43d1f46dd9d0 Merge branch 'e76c86997bcf')
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
Merging hwmon-staging/hwmon-next (ee65d9e63046 hwmon: (pt5161l) Use per-cli=
ent debugfs entry)
Merging jc_docs/docs-next (19b100b0116d scripts/kernel-doc: drop dead code =
for Wcontents_before_sections)
Merging v4l-dvb/next (143d75583f24 media: vim2m: print device name after re=
gistering device)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (bc641f99ee1b Merge branch 'acpi-button' into linux-n=
ext)
Merging cpufreq-arm/cpufreq/arm/linux-next (4a1e3bf61fc7 cpufreq: tegra194:=
 Allow building for Tegra234)
Merging cpupower/cpupower (f89cb9cba7a2 cpupower: Implement CPU physical co=
re querying)
Merging devfreq/devfreq-next (f3253b23535f PM / devfreq: exynos: remove unu=
sed function parameter)
Merging pmdomain/next (b90a6e60619f pmdomain: Merge branch fixes into next)
Merging opp/opp/linux-next (2014c95afece Linux 6.14-rc1)
Merging thermal/thermal/linux-next (ecb642900deb dt-bindings: thermal: Corr=
ect indentation and style in DTS example)
Merging rdma/for-next (3745242ad1e1 RDMA/mlx5: Reorder capability check las=
t)
CONFLICT (content): Merge conflict in drivers/infiniband/sw/rxe/rxe.c
Merging net-next/main (8e0e8bef4841 tcp: clamp window like before the clean=
up)
CONFLICT (content): Merge conflict in fs/eventpoll.c
Merging bpf-next/for-next (d7be90dd108f Merge remote-tracking branch 'bpf-n=
ext/master' into for-next)
Merging ipsec-next/master (9d381c77087b Merge branch 'Support-PMTU-in-tunne=
l-mode-for-packet-offload')
Merging mlx5-next/mlx5-next (80df31f384b4 net/mlx5: Change POOL_NEXT_SIZE d=
efine value and make it global)
Merging netfilter-next/main (4e41231249f4 Merge branch '100GbE' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue)
Merging ipvs-next/main (4e41231249f4 Merge branch '100GbE' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/tnguy/next-queue)
Merging bluetooth/master (8968f507940c Bluetooth: btintel_pcie: Trigger dev=
ice coredump on hardware exception)
$ git reset --hard HEAD^
Merging next-20250306 version of bluetooth
Merging wireless-next/for-next (71f8992e34a9 Merge tag 'wireless-next-2025-=
03-04-v2' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wirel=
ess-next)
Merging ath-next/for-next (9a0dddfb30f1 wifi: ath12k: Fix invalid data acce=
ss in ath12k_dp_rx_h_undecap_nwifi)
Merging wpan-next/master (a5d4d993fac4 dt-bindings: ieee802154: ca8210: Upd=
ate polarity of the reset pin)
Merging wpan-staging/staging (a5d4d993fac4 dt-bindings: ieee802154: ca8210:=
 Update polarity of the reset pin)
Merging mtd/mtd/next (2a6a44555f07 mtd: Fix error handling in mtd_device_pa=
rse_register() error path)
Merging nand/nand/next (ddc210cf8b8a mtd: rawnand: brcmnand: fix PM resume =
warning)
Merging spi-nor/spi-nor/next (03e7bb864d9a mtd: spi-nor: use scope-based mu=
tex cleanup helpers)
Merging crypto/master (17ec3e71ba79 crypto: lib/Kconfig - Hide arch options=
 from user)
Merging drm/drm-next (e21cba704714 Merge tag 'drm-misc-next-2025-02-27' of =
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_gfx=
.c
Merging drm-exynos/for-linux-next (81a50378559b drm/exynos: Remove unnecess=
ary checking)
Merging drm-misc/for-linux-next (fc51acfca9ca drm/tegra: move to devm_platf=
orm_ioremap_resource() usage)
Merging amdgpu/drm-next (a29936bcd21e drm/amdgpu: Fix core reset sequence f=
or JPEG5_0_1)
Merging drm-intel/for-linux-next (fb64f5568c0e drm/i915/cdclk: Do cdclk pos=
t plane programming later)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dp=
_mst.c
Merging drm-msm/msm-next (69d02730431e drm/msm/dpu: Support YUV formats on =
writeback for DPU 5.x+)
$ git reset --hard HEAD^
Merging next-20250306 version of drm-msm
Merging drm-msm-lumag/msm-next-lumag (6d3175a72cc0 drm/msm/dpu: handle perf=
 mode in _dpu_core_perf_crtc_update_bus())
Merging drm-xe/drm-xe-next (45f5a1efac90 drm/doc: gpusvm: Add GPU SVM docum=
entation)
CONFLICT (content): Merge conflict in mm/memory.c
Applying: fix up for "drm/gpusvm: Add support for GPU Shared Virtual Memory"
Applying: fixup for "drm/xe: Add drm_pagemap ops to SVM"
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (c454bc716854 fbcon: Use correct erase colour for cl=
earing in fbcon)
Merging regmap/for-next (14b33926f576 Merge remote-tracking branch 'regmap/=
for-6.15' into regmap-next)
Merging sound/for-next (aa85822c611a ALSA: hda/realtek: Enable PC beep pass=
through for HP EliteBook 855 G7)
Merging ieee1394/for-next (2014c95afece Linux 6.14-rc1)
Merging sound-asoc/for-next (f468b07d1c07 Merge remote-tracking branch 'aso=
c/for-6.15' into asoc-next)
Merging modules/modules-next (afa92869776a params: Annotate struct module_p=
aram_attrs with __counted_by())
Merging input/next (aed2626f465e dt-bindings: input: matrix_keypad - add mi=
ssing property)
Merging block/for-next (e4b8b4ee37d9 Merge branch 'for-6.15/io_uring-epoll-=
wait' into for-next)
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
Merging battery/for-next (76d5fb0e58d8 power: supply: sc27xx: use devm_kmem=
dup_array())
Merging regulator/for-next (03626f01845d Merge remote-tracking branch 'regu=
lator/for-6.15' into regulator-next)
Merging security/next (ab938b59e9de cred,rust: mark Credential methods inli=
ne)
Merging apparmor/apparmor-next (3e45553acb14 apparmor: Remove unused variab=
le 'sock' in __file_sock_perm())
Merging integrity/next-integrity (672a4c654a08 ima: limit the number of ToM=
ToU integrity violations)
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
Merging devicetree/for-next (eeb237f7970f dt-bindings: display: mitsubishi,=
aa104xd12: Adjust allowed and required properties)
CONFLICT (content): Merge conflict in drivers/of/of_private.h
Merging dt-krzk/for-next (854a080f0b73 loongarch: dts: remove non-existent =
DAC from 2k1000-ref)
Merging mailbox/for-next (d44ee3bd382d MAINTAINERS: add mailbox API's tree =
type and location)
Merging spi/for-next (c62f419e771f Merge remote-tracking branch 'spi/for-6.=
15' into spi-next)
Merging tip/master (277255aa69e5 Merge branch into tip/master: 'x86/sev')
CONFLICT (content): Merge conflict in arch/arm64/kernel/vdso.c
CONFLICT (content): Merge conflict in arch/loongarch/Kconfig
CONFLICT (content): Merge conflict in arch/riscv/include/asm/io.h
CONFLICT (content): Merge conflict in arch/x86/entry/vdso/vma.c
CONFLICT (content): Merge conflict in arch/x86/kernel/paravirt.c
CONFLICT (content): Merge conflict in arch/x86/mm/pgtable.c
CONFLICT (content): Merge conflict in drivers/mailbox/mailbox.c
CONFLICT (content): Merge conflict in net/core/dev.c
Applying: finish revert of "mseal sysmap: enable x86-64"
$ git reset --hard HEAD^
Merging next-20250303 version of tip
CONFLICT (content): Merge conflict in arch/arm64/kernel/vdso.c
CONFLICT (content): Merge conflict in arch/loongarch/Kconfig
CONFLICT (content): Merge conflict in arch/riscv/include/asm/io.h
CONFLICT (content): Merge conflict in arch/x86/entry/vdso/vma.c
CONFLICT (content): Merge conflict in arch/x86/kernel/paravirt.c
CONFLICT (content): Merge conflict in arch/x86/mm/pgtable.c
CONFLICT (content): Merge conflict in drivers/mailbox/mailbox.c
CONFLICT (content): Merge conflict in net/core/dev.c
[master b594c38cc60e] next-20250303/tip
Applying: finish revert of "mseal sysmap: enable x86-64"
[master 589f0325fd48] next-20250303/tip
Merging clockevents/timers/drivers/next (fafc3058cc2f dt-bindings: timer: e=
xynos4210-mct: Add samsung,exynos990-mct compatible)
Merging edac/edac-for-next (079b06b8b3a0 Merge ras/edac-cxl into for-next)
Merging ftrace/for-next (741ed3cefd73 Merge sorttable/for-next)
Merging rcu/next (05edc0076dc0 srcu: Use rcu_seq_done_exact() for polling A=
PI)
Merging paulmck/non-rcu/next (ec20d53540aa Merge branches 'clocksource.2025=
.03.05a' and 'lkmm.2025.02.25a' into HEAD)
Merging kvm/next (916b7f42b3b3 kvm: retry nx_huge_page_recovery_thread crea=
tion)
Merging kvm-arm/next (3d53f5c0c1f5 Merge branch 'kvm-arm64/pv-cpuid' into k=
vmarm/next)
CONFLICT (content): Merge conflict in arch/arm64/kvm/arm.c
Merging kvms390/next (32239066776a KVM: s390: selftests: Streamline uc_skey=
 test to issue iske after sske)
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (d252435aca44 riscv: KVM: Remove unnecessa=
ry vcpu kick)
Merging kvm-x86/next (c9ea48bb6ee6 Merge branch 'xen')
Merging xen-tip/linux-next (75ad02318af2 Xen/swiotlb: mark xen_swiotlb_fixu=
p() __init)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (1e5f94eb8ef7 Merge branch 'for-6.15' into for-=
next)
Merging sched-ext/for-next (108963bba085 Merge branch 'for-6.15' into for-n=
ext)
Merging drivers-x86/for-next (e57eabe2fb04 platform/x86: thinkpad_acpi: che=
ck the return value of devm_mutex_init())
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
Merging usb/usb-next (811d22141369 usb: dwc3: exynos: add support for exyno=
s7870)
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
Merging coresight/next (f78d206f3d73 Coresight: Add Coresight TMC Control U=
nit driver)
Merging fastrpc/for-next (2014c95afece Linux 6.14-rc1)
Merging fpga/for-next (e19890a0088b fpga: versal: remove incorrect of_match=
_ptr annotation)
Merging icc/icc-next (4cc004716977 Merge branch 'icc-sm8750' into icc-next)
Merging iio/togreg (08808b3ef384 iio: adc: ad7192: Grab direct mode for cal=
ibration)
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
Merging cgroup/for-next (34262c44e898 Merge branch 'for-6.15' into for-next)
Merging scsi/for-next (ae142f3e458c Merge branch 'misc' into for-next)
CONFLICT (content): Merge conflict in drivers/scsi/scsi_debug.c
Merging scsi-mkp/for-next (f421692be101 scsi: fnic: Remove unnecessary spin=
lock locking and unlocking)
Merging vhost/linux-next (9d8960672d63 vhost-scsi: Reduce response iov mem =
use)
Merging rpmsg/for-next (3f7b2eb9f21e Merge branch 'rproc-next' into for-nex=
t)
Merging gpio-brgl/gpio/for-next (9b443b68d979 gpiolib: fix kerneldoc)
Merging gpio-intel/for-next (e646f0dae7b0 gpiolib-acpi: Drop unneeded ERR_C=
AST() in __acpi_find_gpio())
Merging pinctrl/for-next (e058c5f49cef Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (0ee2261d08aa pinctrl: intel: drop repeated =
config dependency)
Merging pinctrl-renesas/renesas-pinctrl (abcdeb4e299a pinctrl: renesas: rza=
2: Fix missing of_node_put() call)
Merging pinctrl-samsung/for-next (eb76dc973cef pinctrl: samsung: add suppor=
t for exynos7870 pinctrl)
Merging pwm/pwm/for-next (a2b8191ab695 pwm: stmpe: Allow to compile as a mo=
dule)
Merging ktest/for-next (f3a30016e4b5 ktest.pl: Fix typo "accesing")
Merging kselftest/next (82ef781f24ac selftests/ftrace: add 'poll' binary to=
 gitignore)
Merging kunit/test (a64dcfb451e2 Linux 6.14-rc2)
Merging kunit-next/kunit (0619a4868fc1 kunit: Clarify kunit_skip() argument=
 name)
Merging livepatching/for-next (8bd10336f1af Merge branch 'for-6.15/trivial'=
 into for-next)
Merging rtc/rtc-next (6571ef7dc9cf rtc: pl031: document struct pl031_vendor=
_data members)
Merging nvdimm/libnvdimm-for-next (2318fa87f808 libnvdimm: Remove unused nd=
_attach_ndns)
Merging at24/at24/for-next (f25f405d250f eeprom: at24: Drop of_match_ptr() =
and ACPI_PTR() protections)
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
Merging auxdisplay/for-next (4711f852e78a Merge patch series "auxdisplay: c=
harlcd: Refactor memory allocation")
Merging kgdb/kgdb/for-next (6beaa75cd24d kdb: Remove unused flags stack)
Merging hmm/hmm (da0dd17604d4 fwctl/cxl: Add documentation to FWCTL CXL)
Merging cfi/cfi/next (2014c95afece Linux 6.14-rc1)

--Sig_/tx8pVxbTwLyielJM/ZX2o9V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfKvVMACgkQAVBC80lX
0GyVdgf/Rbmb9xil76BrSUSGRgCkQC3FVQgktmjkF9RbbkbUHAabMJpnBcDanzUa
EwAX0Co9Bx+KYYIbghBkAkh9My3pGHxEI27xL1ax0Wst7w92FyR0lgxx1eSDkycj
Ba/WtKzd2MOoKTJcrjMjjMz69gaRx1IIvlaMnYSjfAixMLB7ihEJyKK8PhCSx2oV
flLdCs7w1m8BwbxFidpfq1+EAJxCiW5sz6NvJ87EWy9IXSFbHOXvKLR96mgjUyk0
pC7bkxWNDyW3IyB7crnpGmw9yTAEiPno9y3MHBfdYLJxTFxgR4nOUOmO/6r+F8uY
p7OKtQCevpwbl1ylcWdq1VYZEdkpaQ==
=Kd7c
-----END PGP SIGNATURE-----

--Sig_/tx8pVxbTwLyielJM/ZX2o9V--

