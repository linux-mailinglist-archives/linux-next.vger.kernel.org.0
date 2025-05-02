Return-Path: <linux-next+bounces-6504-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 099BDAA6E6E
	for <lists+linux-next@lfdr.de>; Fri,  2 May 2025 11:48:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 747711BC0159
	for <lists+linux-next@lfdr.de>; Fri,  2 May 2025 09:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D565E22D788;
	Fri,  2 May 2025 09:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UlRnGT0/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEA219DF66;
	Fri,  2 May 2025 09:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746179297; cv=none; b=ju+Ea/DqBwbNDdXOPz20euTKHGGC5VYGyDV8sUQXztnPBQPGnvI3c4chyeZ+a6E0wCLXYDT6Wq1kkTMq72x/sHmywuTdWyJUaQJcEw3F7Idz7OkHBiNWHF4VWoxX8HvRWpNt/7qmhwPZtu8/0L4u5+89jg9Z7sPL4mBnU9OBz0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746179297; c=relaxed/simple;
	bh=mu7OnMbQWNodRzHBZfvt660TTuqMitW9SWhESTnhqFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Fyap7kW/Np1oyZMpDBqxYRyf0WNFWrvtPloqo22XIm2bqHZVf4T39ZDw0YuoEP3ZzsufyPhYXMnLMGRJ+Mkns/ZwhIfpamOAuVsi+c7FVyqjivmy2e+TtPr8j+sy1rzsGpASmPBCUCT0IP/TVUTNevez1HIb3jbSBFhGiddW68k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UlRnGT0/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746179289;
	bh=sQQBoVPyCq1Pi3XEgsNaM1x6wqlx07ohCCG4FQB81+Y=;
	h=Date:From:To:Cc:Subject:From;
	b=UlRnGT0/S/3CUfMhImleR8nrgMxgGQ2DkQaPpr1cig+ssArDYWuHHKZl33qxG+dui
	 yKN7WrLVUB2jiSh0S/x+PguhEBXgFws8myMVAu25TLDz2KkxgazY8rBvg3sabial/O
	 TGTeLsY1X6opY0HEu984jlZzzpzfLh8IPSVBTKb3XhDIUctZ+RkpNcmmvx7keRNEMy
	 pbuXJx/g6hrTaXDu1AFO16D+sR1EuXizn0AGSk/p8nC5qgVCtXKAqt6ehqPaVEeysj
	 IJXVd6zvT2cdSGENrql4W733UsQi0LwNrnyq5mrOTJftXwNtbbfMNt1o6EQrTUYqjY
	 D5T3kv+RHib1g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZpmLx0MNNz4x07;
	Fri,  2 May 2025 19:48:09 +1000 (AEST)
Date: Fri, 2 May 2025 19:48:08 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 2
Message-ID: <20250502194808.67e5164f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ax71RB6Sef561rJBnCs0UGI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Ax71RB6Sef561rJBnCs0UGI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250501:

I have reverted a commit in the mm-nonmm-unstable tree that was causing
build failures.

The scmi tree gained a build failure for which I disabled a CONFIG option.

The tip tree still had its build failure so I used the version from
next-20250414.

The ipmi tree gained conflicts against Linus' tree.

The char-misc tree still had its build failure so I used the version
from next-20250428.

Non-merge commits (relative to Linus' tree): 7260
 7323 files changed, 304374 insertions(+), 157636 deletions(-)

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

I am currently merging 395 trees (counting Linus' and 150 trees of bug
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
Merging origin/master (ebd297a2affa Merge tag 'net-6.15-rc5' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging fixes/fixes (b3c623b9a94f Merge tag 'thermal-6.15-rc1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging ext4-fixes/fixes (4bbf9020becb Linux 6.13-rc4)
Merging vfs-brauner-fixes/vfs.fixes (8b0ba61df5a1 fs/xattr.c: fix simple_xa=
ttr_list to always include security.* xattrs)
Merging fscrypt-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging fsverity-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging btrfs-fixes/next-fixes (390be52f352b Merge branch 'misc-6.15' into =
next-fixes)
Merging vfs-fixes/fixes (93ddd3942493 do_move_mount(): don't leak MNTNS_PRO=
PAGATING on failures)
Merging erofs-fixes/fixes (9fcd53c32066 erofs: remove unused enum type)
Merging nfsd-fixes/nfsd-fixes (831e3f545b07 Revert "sunrpc: clean cache_det=
ail immediately when flush is written frequently")
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (924577e4f6ca ovl: Fix nested backing fil=
e paths)
Merging bcachefs/for-next (0286e67f0342 bcachefs: sysfs trigger_recalc_capa=
city)
Merging fscrypt/for-next (c07d3aede2b2 fscrypt: add support for hardware-wr=
apped keys)
Merging btrfs/for-next (fdcbb186629d Merge branch 'for-next-next-v6.15-2025=
0430' into for-next-20250430)
Merging ceph/master (f452a2204614 ceph: Fix incorrect flush end position ca=
lculation)
Merging cifs/for-next (fe00edbc3249 cifs: add new field to track the last a=
ccess time of cfid)
Merging configfs/configfs-next (eae324ca6445 configfs: Add CONFIGFS_ATTR_PE=
RM helper)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (6f8b4788266c dlm: drop SCTP Kconfig dependency)
Merging erofs/dev (0f24e3c05afe erofs: enable 48-bit layout support)
Merging exfat/dev (7819f9549ec0 exfat: do not clear volume dirty flag durin=
g sync)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (79eeb515303b Pull ext2 dax deprecation warning.)
Merging ext4/dev (94824ac9a8aa ext4: fix off-by-one error in do_split)
Merging f2fs/dev (7724284838ee f2fs: support FAULT_TIMEOUT)
Merging fsverity/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging fuse/for-next (0c58a97f919c fuse: remove tmp folio for writebacks a=
nd internal rb tree)
Merging gfs2/for-next (2abc01ae2685 gfs2: Use SECTOR_SIZE and SECTOR_SHIFT)
Merging jfs/jfs-next (5dff41a86377 jfs: fix array-index-out-of-bounds read =
in add_missing_indices)
Merging ksmbd/ksmbd-for-next (ca91b9500108 Merge tag 'v6.15-rc4-ksmbd-serve=
r-fixes' of git://git.samba.org/ksmbd)
Merging nfs/linux-next (fa7ab64f1e2f NFS/localio: Fix a race in nfs_local_o=
pen_fh())
Merging nfs-anna/linux-next (9084ed79ddaa lsm,nfs: fix memory leak of lsm_c=
ontext)
Merging nfsd/nfsd-next (b5d9eaabbb5e MAINTAINERS: Update Neil Brown's email=
 address)
Merging ntfs3/master (8b26c8c376b2 fs/ntfs3: Add missing direct_IO in ntfs_=
aops_cmpr)
Merging orangefs/for-next (121a83ce6fe6 orangefs: Bufmap deadcoding)
Merging overlayfs/overlayfs-next (50e638beb67e ovl: Use str_on_off() helper=
 in ovl_show_options())
Merging ubifs/next (69146a8c893f ubi: ubi_get_ec_info: Fix compiling error =
'cast specifies array type')
Merging v9fs/9p-next (4210030d8bc4 docs: fs/9p: Add missing "not" in cache =
documentation)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (bfecc4091e07 xfs: allow ro mounts if rtdev or logdev =
are read-only)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging vfs-brauner/vfs.all (1f875b49e7ab Merge branch 'vfs-6.16.iomap' int=
o vfs.all)
Merging vfs/for-next (2e72b1e0aac2 Merge branch 'work.d_revalidate' into fo=
r-next)
Merging mm-hotfixes/mm-hotfixes-unstable (ac51644ecfa2 mm/hugetlb: copy the=
 CMA flag when demoting)
Merging fs-current (fbf8c7087399 Merge branch 'ovl-fixes' of git://git.kern=
el.org/pub/scm/linux/kernel/git/overlayfs/vfs.git)
Merging kbuild-current/fixes (80e54e84911a Linux 6.14-rc6)
Merging arc-current/for-curr (78d4f34e2115 Linux 6.13-rc3)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (fee4d171451c arm64: errata: Add missing=
 sentinels to Spectre-BHB MIDR arrays)
Merging arm-soc-fixes/arm/fixes (2ef5c66cba61 arm64: dts: st: Use 128kB siz=
e for aliased GIC400 register access on stm32mp23 SoCs)
Merging davinci-current/davinci/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging drivers-memory-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging sophgo-fixes/fixes (3e6244429ba3 riscv: dts: sophgo: fix DMA data-w=
idth configuration for CV18xx)
Merging m68k-current/for-linus (c94cf023dce3 m68k: defconfig: Update defcon=
figs for v6.14-rc1)
Merging powerpc-fixes/fixes (e3f506b78d92 powerpc/boot: Fix dash warning)
Merging s390-fixes/fixes (8ffd015db85f Linux 6.15-rc2)
Merging net/main (ebd297a2affa Merge tag 'net-6.15-rc5' of git://git.kernel=
.org/pub/scm/linux/kernel/git/netdev/net)
Merging bpf/master (b4432656b36e Linux 6.15-rc4)
Merging ipsec/master (e3fd05777685 xfrm: Fix UDP GRO handling for some corn=
er cases)
Merging netfilter/main (0a7bc4d6b04b Merge branch 'bnxt_en-fixes')
Merging ipvs/main (491ef1117c56 net: ethernet: mtk_eth_soc: net: revise NET=
SYSv3 hardware configuration)
Merging wireless/for-next (30763f1adf69 Merge tag 'wireless-2025-04-24' of =
https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless)
Merging ath/for-current (0937cb5f345c Revert "wifi: mac80211: Update skb's =
control block key in ieee80211_tx_dequeue()")
Merging iwlwifi/fixes (30763f1adf69 Merge tag 'wireless-2025-04-24' of http=
s://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (ffc59e32c67e RDMA/bnxt_re: Remove unusable nq va=
riable)
Merging sound-current/for-linus (6e5bea1c9306 Merge tag 'asoc-fix-v6.15-rc4=
' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for=
-linus)
Merging sound-asoc-fixes/for-linus (315c84567001 ASoC: intel/sdw_utils: Add=
 volume limits to CS35L56)
Merging regmap-fixes/for-linus (433a06b68324 Merge remote-tracking branch '=
regmap/for-6.14' into regmap-linus)
Merging regulator-fixes/for-linus (8ffd015db85f Linux 6.15-rc2)
Merging spi-fixes/for-linus (36fd6275818e spi: spi-qpic-snand: fix NAND_REA=
D_LOCATION_2 register handling)
Merging pci-current/for-linus (0af2f6be1b42 Linux 6.15-rc1)
Merging driver-core.current/driver-core-linus (95deee37a123 platform: Fix r=
ace condition during DMA configure at IOMMU probe time)
Merging tty.current/tty-linus (b4432656b36e Linux 6.15-rc4)
Merging usb.current/usb-linus (e918d3959b5a usb: typec: tcpm: delay SNK_TRY=
_WAIT_DEBOUNCE to SRC_TRYWAIT transition)
Merging usb-serial-fixes/usb-linus (b4432656b36e Linux 6.15-rc4)
Merging phy/fixes (9cf118aafd66 phy: rockchip-samsung-dcphy: Add missing as=
signment)
Merging staging.current/staging-linus (c6e8d85fafa7 staging: axis-fifo: Rem=
ove hardware resets for user errors)
Merging iio-fixes/fixes-togreg (609bc31eca06 iio: adis16201: Correct inclin=
ometer channel resolution)
Merging counter-current/counter-current (0af2f6be1b42 Linux 6.15-rc1)
Merging char-misc.current/char-misc-linus (f55aaec4fc17 Merge tag 'iio-fixe=
s-for-6.15a' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/jic23/ii=
o into char-misc-linus)
Merging soundwire-fixes/fixes (fd15594ba7d5 soundwire: bus: Fix race on the=
 creation of the IRQ domain)
Merging thunderbolt-fixes/fixes (b4432656b36e Linux 6.15-rc4)
Merging input-current/for-linus (11cdb506d0fb Input: mtk-pmic-keys - fix po=
ssible null pointer dereference)
CONFLICT (content): Merge conflict in drivers/input/joystick/magellan.c
Merging crypto-current/master (a32f1923c6d6 crypto: scompress - increment s=
comp_scratch_users when already allocated)
Merging vfio-fixes/for-linus (2bd42b03ab6b vfio/pci: Virtualize zero INTx P=
IN if no pdev->irq)
Merging kselftest-fixes/fixes (07be53cfa81a selftests/ftrace: Differentiate=
 bash and dash in dynevent_limitations.tc)
Merging dmaengine-fixes/fixes (305245a2e1d6 dmaengine: ptdma: Move variable=
 condition check to the first place and remove redundancy)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (1c1fd374a2fe mtd: spinand: Fix build with gcc =
< 7.5)
Merging mfd-fixes/for-mfd-fixes (68f860426d50 mfd: axp20x: AXP717: Fix miss=
ing IRQ status registers range)
Merging v4l-dvb-fixes/fixes (d51adf038ebe media: cec: tda9950: add back i2c=
 dependency)
Merging reset-fixes/reset/fixes (38fec10eb60d Linux 6.14)
Merging mips-fixes/mips-fixes (c44572e0cc13 MIPS: Fix MAX_REG_OFFSET)
Merging at91-fixes/at91-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging omap-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging kvm-fixes/master (2d7124941a27 Merge tag 'kvmarm-fixes-6.15-2' of h=
ttps://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvms390-fixes/master (d8dfda5af0be KVM: s390: pv: fix race when mak=
ing a page secure)
Merging hwmon-fixes/hwmon (9c32cda43eb7 Linux 6.15-rc3)
Merging nvdimm-fixes/libnvdimm-fixes (265e98f72bac acpi: nfit: vmalloc-out-=
of-bounds Read in acpi_nfit_ctl)
Merging cxl-fixes/fixes (078d3ee7c162 cxl/core/regs.c: Skip Memory Space En=
able check for RCD and RCH Ports)
Merging dma-mapping-fixes/dma-mapping-fixes (89461db349cc dma-coherent: War=
n if OF reserved memory is beyond current coherent DMA mask)
Merging drivers-x86-fixes/fixes (02c6e43397c3 platform/x86: ideapad-laptop:=
 add support for some new buttons)
Merging samsung-krzk-fixes/fixes (dd303e021996 soc: samsung: usi: prevent w=
rong bits inversion during unconfiguring)
Merging pinctrl-samsung-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging devicetree-fixes/dt/linus (d5f49921707c dt-bindings: soc: fsl: fsl,=
ls1028a-reset: Fix maintainer entry)
Merging dt-krzk-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging scsi-fixes/fixes (0e9693b97a0e scsi: ufs: core: Remove redundant qu=
ery_complete trace)
Merging drm-fixes/drm-fixes (b4432656b36e Linux 6.15-rc4)
Merging drm-intel-fixes/for-linux-next-fixes (7e21ea8149a0 drm/i915/pxp: fi=
x undefined reference to `intel_pxp_gsccs_is_ready_for_sessions')
Merging mmc-fixes/fixes (77183db6b8db mmc: renesas_sdhi: disable clocks if =
registering regulator failed)
Merging rtc-fixes/rtc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging gnss-fixes/gnss-linus (9c32cda43eb7 Linux 6.15-rc3)
Merging hyperv-fixes/hyperv-fixes (14ae3003e73e Drivers: hv: Fix bad ref to=
 hv_synic_eventring_tail when CPU goes offline)
Merging risc-v-fixes/fixes (7d1d19a11cfb riscv: uprobes: Add missing fence.=
i after building the XOL buffer)
Merging riscv-dt-fixes/riscv-dt-fixes (1b133129ad6b riscv: dts: starfive: F=
ix a typo in StarFive JH7110 pin function definitions)
Merging riscv-soc-fixes/riscv-soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (0af2f6be1b42 Linux 6.15-rc1)
Merging gpio-brgl-fixes/gpio/for-current (b4432656b36e Linux 6.15-rc4)
Merging gpio-intel-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging pinctrl-intel-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging auxdisplay-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging kunit-fixes/kunit-fixes (b26c1a85f3fc kunit: qemu_configs: SH: Resp=
ect kunit cmdline)
Merging memblock-fixes/fixes (ed471e198493 memblock tests: Fix mutex relate=
d build error)
Merging renesas-fixes/fixes (379c590113ce ARM: shmobile: smp: Enforce shmob=
ile_smp_* alignment)
Merging perf-current/perf-tools (8988c4b91945 perf tools: Fix in-source lib=
perf build)
Merging efi-fixes/urgent (11092db5b573 efivarfs: fix NULL dereference on re=
sume)
Merging battery-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging iommufd-fixes/for-rc (0af2f6be1b42 Linux 6.15-rc1)
Merging rust-fixes/rust-fixes (9d7a0577c9db gcc-15: disable '-Wunterminated=
-string-initialization' entirely for now)
Merging w1-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging pmdomain-fixes/fixes (13a6d4265665 pmdomain: renesas: rcar: Remove =
obsolete nullify checks)
Merging i2c-host-fixes/i2c/i2c-host-fixes (b1852c5de2f2 i2c: imx-lpi2c: Fix=
 clock count when probe defers)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging pwrseq-fixes/pwrseq/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging thead-dt-fixes/thead-dt-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging ftrace-fixes/ftrace/fixes (2fa6a01345b5 tracing: Fix memory leak wh=
en reading set_event file)
Merging ring-buffer-fixes/ring-buffer/fixes (e4d4b8670c44 ring-buffer: Use =
flush_kernel_vmap_range() over flush_dcache_folio())
Merging trace-fixes/trace/fixes (d481ee35247d tracing: selftests: Add testi=
ng a user string to filters)
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging tip-fixes/tip/urgent (cf5dc97c2ebf Merge branch into tip/master: 't=
imers/urgent')
Merging slab-fixes/slab/for-next-fixes (be8250786ca9 mm, slab: clean up sla=
b->obj_exts always)
Merging drm-msm-fixes/msm-fixes (9d78f0250322 drm/msm/a6xx+: Don't let IB_S=
IZE overflow)
Merging uml-fixes/fixes (96178631c3f5 um: convert irq_lock to raw spinlock)
Merging fwctl-fixes/for-rc (c92ae5d4f53e fwctl: Fix repeated device word in=
 log message)
Merging devsec-tsm-fixes/fixes (99b9d909187a configfs-tsm-report: Fix NULL =
dereference of tsm_ops)
Merging drm-misc-fixes/for-linux-next-fixes (75680b7cd461 accel/ivpu: Corre=
ct mutex unlock order in job submission)
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (fc96b232f8e7 Merge tag 'pci-v6.15-fixes-2' of =
git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci)
Merging mm-nonmm-stable/mm-nonmm-stable (fc96b232f8e7 Merge tag 'pci-v6.15-=
fixes-2' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci)
Merging mm-unstable/mm-unstable (3f602528bea9 mm: kmemleak: mark variables =
as __read_mostly)
CONFLICT (content): Merge conflict in arch/x86/kernel/e820.c
Merging mm-nonmm-unstable/mm-nonmm-unstable (9be21dbdefa8 lib/oid_registry.=
c: remove unused sprint_OID)
Applying: Revert "watchdog: fix watchdog may detect false positive of softl=
ockup"
Merging kbuild/for-next (a7c699d090a1 kbuild: rpm-pkg: build a debuginfo RP=
M)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (2d099ccaadf6 perf test: Add perf trace summar=
y test)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging asm-generic/master (852faf805539 gcc-plugins: remove SANCOV gcc plu=
gin)
Merging alpha/alpha-next (1523226edda5 alpha: Use str_yes_no() helper in pc=
i_dac_dma_supported())
Merging arm/for-next (96e0b3558830 ARM: 9447/1: arm/memremap: fix arch_memr=
emap_can_ram_remap())
Merging arm64/for-next/core (f7c87741c22d Merge branches 'for-next/cpufeatu=
re', 'for-next/efi', 'for-next/entry', 'for-next/misc', 'for-next/mm', 'for=
-next/psci', 'for-next/sme-fixes' and 'for-next/vdso' into for-next/core)
Merging arm-perf/for-next/perf (70cbcb2850ec perf: Do not enable by default=
 during compile testing)
Merging arm-soc/for-next (2ef5c66cba61 arm64: dts: st: Use 128kB size for a=
liased GIC400 register access on stm32mp23 SoCs)
Merging amlogic/for-next (8f5f9fc2ee8c Merge branch 'v6.16/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (fb84b3df3515 Merge remote-tracking br=
anch 'origin/asahi-soc/dt' into asahi-soc/for-next)
Merging aspeed/for-next (bf8f48263c0e Merge remote-tracking branches 'aspee=
d/dt', 'aspeed/drivers', 'aspeed/fixes' and 'nuvoton/dt' into for-next)
Merging at91/at91-next (a9c0a43cb22d Merge branch 'at91-dt' into at91-next)
Merging broadcom/next (87b8fa3195af Merge branch 'devicetree-arm64/next' in=
to next)
Merging davinci/davinci/for-next (78e6b545e558 ARM: davinci: remove support=
 for da830)
Merging drivers-memory/for-next (9be694f1a9d8 Merge branch 'for-v6.16/renes=
as-rpc-if' into for-next)
Merging imx-mxs/for-next (9bfe32fed9a8 Merge branch 'imx/dt64' into for-nex=
t)
Merging mediatek/for-next (6b4f49867f75 Merge branch 'v6.15-next/dts64' int=
o for-next)
Merging mvebu/for-next (e85dce9d1b78 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (1df28c539085 Merge branch 'omap-for-v6.16/drivers' i=
nto tmp/omap-next-20250501.110944)
Merging qcom/for-next (4ad3b5991a98 Merge branches 'arm32-for-6.16', 'arm64=
-defconfig-for-6.16', 'arm64-for-6.16', 'clk-for-6.16' and 'drivers-for-6.1=
6' into for-next)
Merging renesas/next (f33d66f2f22a Merge branches 'renesas-dt-bindings-for-=
v6.16' and 'renesas-dts-for-v6.16' into renesas-next)
Merging reset/reset/next (4a65326311ab reset: thead: Add TH1520 reset contr=
oller driver)
Merging rockchip/for-next (f7a7c324b934 Merge branch 'v6.16-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (6417a4c554dd Merge branch 'for-v6.16/mux-var=
ious' into for-next)
Merging scmi/for-linux-next (a49e95953d88 Merge branch 'for-next/scmi/updat=
es', tags 'scmi-fixes-6.15', 'juno-fix-6.15' and 'ffa-fix-6.15' of ssh://gi=
tolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-linu=
x-next)
Merging sophgo/for-next (ae246f5c0ce4 riscv: sophgo: dts: Add spi controlle=
r for SG2042)
Merging spacemit/for-next (cb9c3aeae509 riscv: dts: spacemit: add gpio LED =
for system heartbeat)
Merging stm32/stm32-next (7b6bbef62485 ARM: dts: stm32: support STM32h747i-=
disco board)
Merging sunxi/sunxi/for-next (51e5f6ab27e1 Merge branches 'sunxi/dt-for-6.1=
6', 'sunxi/fixes-for-6.15' and 'sunxi/clk-for-6.16' into sunxi/for-next)
Merging tee/next (40cfb51a6e93 Merge branch 'tee_for_v6_16' into next)
Merging tegra/for-next (4e16110559c3 Merge branch for-6.15/arm64/dt into fo=
r-next)
Merging thead-dt/thead-dt-for-next (1b136de08b5f riscv: dts: thead: Introdu=
ce reset controller node)
Merging ti/ti-next (794f282b1004 Merge branches 'ti-k3-dts-next' and 'ti-k3=
-config-next' into ti-next)
Merging xilinx/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging clk/clk-next (7e12c8374040 Merge branch 'clk-bindings' into clk-nex=
t)
Merging clk-imx/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging clk-renesas/renesas-clk (93f287813626 clk: renesas: r9a09g057: Add =
clock and reset entries for USB2)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (5add0dbbebd6 LoongArch: KVM: Fix PMU pass=
-through issue if VM exits to host finally)
Merging m68k/for-next (52ae3f5da7e5 m68k: mac: Fix macintosh_config for Mac=
 II)
Merging m68knommu/for-next (64795b7cc049 m68k: Replace memcpy() + manual NU=
L-termination with strscpy())
Merging microblaze/next (920354d7818b microblaze: Use of_property_present()=
 for non-boolean properties)
Merging mips/mips-next (3b3704261e85 MIPS: Replace strcpy() with strscpy() =
in vpe_elfload())
Merging openrisc/for-next (66ffd2f31611 Documentation: openrisc: Update too=
lchain binaries URL)
Merging parisc-hd/for-next (38fec10eb60d Linux 6.14)
Merging powerpc/next (86900ab620a4 powerpc/pseries: Add a char driver for p=
hysical-attestation RTAS)
Merging risc-v/for-next (bafa451a96d0 riscv: defconfig: Remove EXPERT)
Merging riscv-dt/riscv-dt-for-next (38818f7c9c17 riscv: dts: starfive: jh71=
10-pine64-star64: enable USB 3.0 port)
Merging riscv-soc/riscv-soc-for-next (a41cd775a8f1 Merge branch 'riscv-conf=
ig-for-next' into riscv-soc-for-next)
Merging s390/for-next (de6b4f99010a s390/string: Remove strcpy() implementa=
tion)
Merging sh/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (33c9da5dfb18 um: Rewrite the sigio workaround based on ep=
oll and tgkill)
Merging xtensa/xtensa-for-next (3d6d238851df arch: xtensa: defconfig: Drop =
obsolete CONFIG_NET_CLS_TCINDEX)
Merging fs-next (87ee5b1cab88 Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (9827cd0d6498 Merge branch 'for-6.15-printf-attribu=
te' into for-next)
Merging pci/next (b981b25ce67b Merge branch 'pci/misc')
Merging pstore/for-next/pstore (8ffd015db85f Linux 6.15-rc2)
Merging hid/for-next (f843dbd14f03 Merge branch 'for-6.15/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (d9f25720f570 Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i2c-host/i2c/i2c-host (090882bbae0d i2c: riic: Implement bus recove=
ry)
Merging i3c/i3c/next (0af2f6be1b42 Linux 6.15-rc1)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (928e1c67c13e dt-bindings: hwmon: Add Soph=
go SG2044 external hardware monitor support)
Merging jc_docs/docs-next (c0fe189b590c docs: namespace: Tweak and reword r=
esource control doc)
Merging v4l-dvb/next (2e79181dfc85 media: rkisp1: Remove unnecessary define=
s)
CONFLICT (content): Merge conflict in drivers/media/i2c/ds90ub960.c
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (0751d284c9bd Merge branch 'acpica' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (0a89b0dc417d Merge branch 'rust=
/cpufreq-dt' into cpufreq/arm/linux-next)
Merging cpupower/cpupower (0af2f6be1b42 Linux 6.15-rc1)
Merging devfreq/devfreq-next (f3253b23535f PM / devfreq: exynos: remove unu=
sed function parameter)
Merging pmdomain/next (4133b1c46915 pmdomain: Merge branch fixes into next)
Merging opp/opp/linux-next (63ff8239d593 OPP: Use mutex locking guards)
Merging thermal/thermal/linux-next (ef280c17a840 thermal/drivers/mediatek/l=
vts: Fix debugfs unregister on failure)
Merging rdma/for-next (6bd18dabf1c9 RDMA/hns: Add trace for CMDQ dumping)
CONFLICT (content): Merge conflict in drivers/infiniband/sw/rxe/rxe_mr.c
CONFLICT (content): Merge conflict in drivers/infiniband/sw/rxe/rxe_resp.c
Merging net-next/main (630cb33ccfcd dt-bindings: net: via-rhine: Convert to=
 YAML)
Merging bpf-next/for-next (e438aa4bef7c Merge branch 'bpf-next/master' into=
 for-next)
Merging ipsec-next/master (86e530c84c97 Merge branch 'Update offload config=
uration with SA')
CONFLICT (content): Merge conflict in drivers/net/ethernet/intel/ixgbe/ixgb=
e_ipsec.c
Merging mlx5-next/mlx5-next (f550694e88b7 net/mlx5: Add IFC bits for PPCNT =
recovery counters group)
Merging netfilter-next/main (deeed351e982 Merge branch 'pds_core-cleanups')
Merging ipvs-next/main (88922fe78540 Merge branch 'bridge-mc-per-vlan-qquer=
y')
Merging bluetooth/master (c03e896217f7 Bluetooth: btusb: Add new VID/PID 13=
d3/3630 for MT7925)
CONFLICT (content): Merge conflict in net/bluetooth/hci_sync.c
Merging wireless-next/for-next (885e5cbaa0ee Revert "wifi: iwlwifi: clean u=
p config macro")
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/ml=
d/fw.c
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/ml=
d/mld.c
Merging ath-next/for-next (885e5cbaa0ee Revert "wifi: iwlwifi: clean up con=
fig macro")
Merging iwlwifi-next/next (885e5cbaa0ee Revert "wifi: iwlwifi: clean up con=
fig macro")
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (843ce6ed4689 mtd: core: always create master device)
Merging nand/nand/next (e6031b11544b mtd: rawnand: qcom: Fix read len for o=
nfi param page)
Merging spi-nor/spi-nor/next (eec373688d91 mtd: spi-nor: drop unused <linux=
/of_platform.h>)
Merging crypto/master (5b39aa368bcf crypto: s390/sha512 - Fix sha512 state =
size)
Merging drm/drm-next (9924db4a75ca Merge tag 'drm-xe-next-2025-04-28-1' of =
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging drm-exynos/for-linux-next (81a50378559b drm/exynos: Remove unnecess=
ary checking)
Merging drm-misc/for-linux-next (4f1a965d592a drm/rockchip: add CONFIG_OF d=
ependency)
Merging amdgpu/drm-next (da072da2c8ca drm/amd/display: Rename program_timin=
g function for better debugging)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_mes=
.c
Merging drm-intel/for-linux-next (c53372dfb630 drm/i915/display: move min_h=
blank from dp_mst.c to dp.c)
Merging drm-msm/msm-next (844e31bbaef7 Merge remote-tracking branch 'drm-mi=
sc/drm-misc-next' into msm-next)
Merging drm-msm-lumag/msm-next-lumag (249a965c3759 drm/msm/dsi: add DSI sup=
port for SA8775P)
Merging drm-nova/nova-next (fc55584e00fc rust: device: conditionally expect=
 `dead_code` for `parent()`)
CONFLICT (content): Merge conflict in rust/helpers/helpers.c
Merging drm-xe/drm-xe-next (3182f3634f29 drm/xe: Do not print timedout job =
message on killed exec queues)
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (cbe82d46f7a5 vgacon: Add check for vc_origin addres=
s range in vgacon_scroll())
Merging regmap/for-next (631f2288a412 Merge remote-tracking branch 'regmap/=
for-6.16' into regmap-next)
Merging sound/for-next (9fa6a693ad8d ALSA: hda/tas2781: Remove tas2781_spi_=
fwlib.c and leverage SND_SOC_TAS2781_FMWLIB)
Merging ieee1394/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging sound-asoc/for-next (efd3ba1e2dea Merge remote-tracking branch 'aso=
c/for-6.16' into asoc-next)
Merging modules/modules-next (1b7b9e30cf33 module: Make .static_call_sites =
read-only after init)
Merging input/next (95ea0cf3f613 Input: snvs_pwrkey - support power-off-tim=
e-sec)
Merging block/for-next (a2adfdb6635f Merge branch 'for-6.16/block' into for=
-next)
Merging device-mapper/for-next (d5d16fabe431 dm mpath: Interface for explic=
it probing of active paths)
Merging libata/for-next (b8ed9475384f dt-bindings: ata: rockchip-dwc-ahci: =
add RK3576 compatible)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (c0b5481043a4 mmc: sdhci-esdhc-imx: fix defined but not us=
ed warnings)
Merging mfd/for-mfd-next (ad89f425ae78 mfd: exynos-lpass: Fix another error=
 handling path in exynos_lpass_probe())
Merging backlight/for-backlight-next (e12d3e1624a0 backlight: pm8941: Add N=
ULL check in wled_configure())
Merging battery/for-next (60cd40eee4f4 power: supply: Add support for Maxim=
 MAX8971 charger)
Merging regulator/for-next (ff9ae9b9d938 ASoC: codec: twl4030: Convert to G=
PIO descriptors)
Merging security/next (74e5b13a1b0f lsm: Move security_netlink_send to unde=
r CONFIG_SECURITY_NETWORK)
Merging apparmor/apparmor-next (3e45553acb14 apparmor: Remove unused variab=
le 'sock' in __file_sock_perm())
Merging integrity/next-integrity (591683d3944c ima: measure kexec load and =
exec events as critical data)
CONFLICT (content): Merge conflict in kernel/kexec_file.c
Merging selinux/next (05f1a939225e selinux: fix the kdoc header for task_av=
dcache_update)
Merging smack/next (a158a937d864 smack: recognize ipv4 CIPSO w/o categories)
Merging tomoyo/master (834a4a689699 Merge tag 'for-linus' of git://git.kern=
el.org/pub/scm/linux/kernel/git/rdma/rdma)
Merging tpmdd/next (552c4ec0bf4b tpm_crb: ffa_tpm: fix/update comments desc=
ribing the CRB over FFA ABI)
Merging watchdog/master (9bc64d338b0b watchdog: sunxi_wdt: Add support for =
Allwinner A523)
Merging iommu/next (44e9f08cac9f Merge branches 'fixes', 'apple/dart', 'med=
iatek', 'renesas/ipmmu', 's390', 'amd/amd-vi' and 'core' into next)
Merging audit/next (654d61b8e0e2 audit: record AUDIT_ANOM_* events regardle=
ss of presence of rules)
Merging devicetree/for-next (67dd139c917a psci: MAINTAINERS: Include DT bin=
ding in the entry)
Merging dt-krzk/for-next (247ed81d323c Merge branch 'next/dt' into for-next)
Merging mailbox/for-next (1ec12fd31ecc mailbox: Remove unneeded semicolon)
Merging spi/for-next (1bd51ec2c375 Merge remote-tracking branch 'spi/for-6.=
16' into spi-next)
Merging tip/master (6c201ee95a30 Merge branch into tip/master: 'x86/sgx')
CONFLICT (content): Merge conflict in arch/x86/Kconfig.assembler
CONFLICT (content): Merge conflict in drivers/cpufreq/intel_pstate.c
$ git reset --hard HEAD^
Merging next-20250414 version of tip
CONFLICT (content): Merge conflict in arch/x86/Kconfig.assembler
CONFLICT (content): Merge conflict in arch/x86/events/intel/core.c
CONFLICT (content): Merge conflict in arch/x86/kernel/e820.c
CONFLICT (content): Merge conflict in drivers/cpufreq/intel_pstate.c
[master d0cbb85d070e] next-20250414/tip
Merging edac/edac-for-next (4521b86e4a6e Merge ras/edac-urgent into for-nex=
t)
Merging ftrace/for-next (d85852264728 Merge tools/for-next)
Merging rcu/next (dab9d2afaa3d Merge branches 'rcu/misc-for-6.16', 'rcu/seq=
-counters-for-6.16' and 'rcu/torture-for-6.16' into rcu/for-next)
Merging paulmck/non-rcu/next (99fe3bc36927 Merge branches 'lkmm.2025.04.22a=
' and 'ratelimit.2025.04.29a' into HEAD)
Merging kvm/next (45eb29140e68 Merge branch 'kvm-fixes-6.15-rc4' into HEAD)
CONFLICT (content): Merge conflict in arch/x86/kvm/vmx/vmx.c
Merging kvm-arm/next (68ec8b4e8444 Merge branch kvm-arm64/pkvm-6.16 into kv=
marm-master/next)
Merging kvms390/next (0c7fbae5bc78 KVM: s390: Don't use %pK through debug p=
rinting)
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (87ec7d5249bb KVM: RISC-V: reset smstateen=
 CSRs)
Merging kvm-x86/next (661b7ddb2d10 Merge branches 'fixes', 'misc', 'pir', '=
svm' and 'vmx')
Merging xen-tip/linux-next (715ad3e0ec2b xen: fix multicall debug feature)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (70e1683ca3a6 workqueue: Fix race condition in =
wq->stats incrementation)
Merging sched-ext/for-next (771641d7c9a7 Merge branch 'for-6.16' into for-n=
ext)
Merging drivers-x86/for-next (f618f1b298d3 platform: mellanox: mlx-platform=
: Add support for new Nvidia system)
CONFLICT (content): Merge conflict in drivers/platform/x86/dell/alienware-w=
mi-wmax.c
Merging chrome-platform/for-next (a9635ef0ca12 platform/chrome: cros_ec_typ=
ec: Set Pin Assignment E in DP PORT VDO)
Merging chrome-platform-firmware/for-firmware-next (0af2f6be1b42 Linux 6.15=
-rc1)
Merging hsi/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging leds-lj/for-leds-next (72a3aadde656 leds: Provide skeleton KUnit te=
sting for the LEDs framework)
Merging ipmi/for-next (e7fd30e36f4a ipmi:watchdog: Use the new interface fo=
r panic messages)
CONFLICT (content): Merge conflict in drivers/char/ipmi/ipmi_msghandler.c
CONFLICT (content): Merge conflict in drivers/char/ipmi/ipmi_ssif.c
Merging driver-core/driver-core-next (0e4965c80ef0 Merge tag 'gpiod-devm-is=
-action-added-for-v6.16-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/ker=
nel/git/brgl/linux into driver-core-next)
Merging usb/usb-next (615dca38c2ea Merge 6.15-rc4 into usb-next)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging thunderbolt/next (36f6f7e2d4d0 Documentation/admin-guide: Document =
Thunderbolt/USB4 tunneling events)
Merging usb-serial/usb-next (43a23bb0d5bf USB: serial: ti_usb_3410_5052: dr=
op bogus read urb check)
Merging tty/tty-next (689835c00ec7 Merge 6.15-rc4 into tty-next)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/ser=
ial/snps-dw-apb-uart.yaml
Merging char-misc/char-misc-next (20acf4dd46e4 char: misc: make miscdevice =
unit test built-in only)
$ git reset --hard HEAD^
Merging next-20250428 version of char-misc
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (b104a941a94e coresight: Add a KUnit test for coresi=
ght_find_default_sink())
Merging fastrpc/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga/for-next (e31ba38c1b82 fpga: fix potential null pointer deref =
in fpga_mgr_test_img_load_sgt())
Merging icc/icc-next (a0a532d59b8f Merge branch 'icc-sa8775p' into icc-next)
Merging iio/togreg (b475195fecc7 staging: iio: ad5933: Correct settling cyc=
les encoding per datasheet)
Merging phy-next/next (9d0ec51d7c22 phy: rockchip: samsung-hdptx: Add high =
color depth management)
Merging soundwire/next (0af2f6be1b42 Linux 6.15-rc1)
Merging extcon/extcon-next (7041ed0dde83 extcon: Drop explicit initializati=
on of struct i2c_device_id::driver_data to 0)
Merging gnss/gnss-next (9c32cda43eb7 Linux 6.15-rc3)
Merging vfio/next (860be250fc32 vfio/pci: Handle INTx IRQ_NOTCONNECTED)
Merging w1/for-next (a9b3ecc7bcf6 w1: Avoid -Wflex-array-member-not-at-end =
warnings)
Merging spmi/spmi-next (02a0fd9c0c40 irqdomain: spmi: Switch to irq_domain_=
create_tree())
Merging staging/staging-next (31c2d3287abd staging: sm750fb: change `enum d=
pms` to snake_case)
Merging counter-next/counter-next (0af2f6be1b42 Linux 6.15-rc1)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (d175222f5e90 dmaegnine: fsl-edma: add edma error in=
terrupt handler)
Merging cgroup/for-next (9e1b9c12842f Merge branch 'for-6.16' into for-next)
Merging scsi/for-next (1b014517d12a Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (e142de4aac2a Merge patch series "scsi: ufs-qcom:=
 Enable Hibern8, MCQ, and Testbus registers Dump")
Merging vhost/linux-next (1f69fe75a328 vhost-scsi: log event queue write de=
scriptors)
Merging rpmsg/for-next (afc760ba751c Merge branch 'rproc-next' into for-nex=
t)
Merging gpio-brgl/gpio/for-next (127da457c4e0 gpio: lp3943: use new line va=
lue setter callbacks)
Merging gpio-intel/for-next (a02af05f41c7 Merge patch series "gpiolib: acpi=
: Fix missing info filling")
Merging pinctrl/for-next (de1742fe7d04 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging pinctrl-renesas/renesas-pinctrl (abcdeb4e299a pinctrl: renesas: rza=
2: Fix missing of_node_put() call)
Merging pinctrl-samsung/for-next (a30692b4f81b pinctrl: samsung: Add filter=
 selection support for alive bank on gs101)
Merging pwm/pwm/for-next (e373991eb9ff pwm: rzg2l-gpt: Accept requests for =
too high period length)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging ktest/for-next (5a1bed232781 ktest: Fix Test Failures Due to Missin=
g LOG_FILE Directories)
Merging kselftest/next (9d4b78df5dc5 selftests/perf_events: Fix spelling mi=
stake "sycnhronize" -> "synchronize")
Merging kunit/test (0af2f6be1b42 Linux 6.15-rc1)
Merging kunit-next/kunit (c2493384e811 kunit: executor: Remove const from k=
unit_filter_suites() allocation type)
Merging livepatching/for-next (a8e905a819fd Merge branch 'for-6.15/ftrace-t=
est' into for-next)
Merging rtc/rtc-next (d37058674646 rtc: da9063: simplify irq management)
Merging nvdimm/libnvdimm-for-next (ef1d3455bbc1 libnvdimm/labels: Fix divid=
e error in nd_label_data_init())
Merging at24/at24/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging ntb/ntb-next (0cadf92e93d4 NTB/msi: Remove unused functions)
Merging seccomp/for-next/seccomp (797002deed03 selftests/seccomp: fix sysca=
ll_restart test for arm compat)
Merging slimbus/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging nvmem/for-next (a5d9b82ff4ed Merge branch 'nvmem-for-6.16' into nvm=
em-for-next)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (c1c117422589 tools: hv: Enable debug logs for h=
v_kvp_daemon)
Merging auxdisplay/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging kgdb/kgdb/for-next (afdbe49276ac kdb: Remove optional size argument=
s from strscpy() calls)
Merging hmm/hmm (c92ae5d4f53e fwctl: Fix repeated device word in log messag=
e)
Merging cfi/cfi/next (0af2f6be1b42 Linux 6.15-rc1)
Merging mhi/mhi-next (ee593991be26 bus: mhi: host: pci_generic: Add Telit F=
N920C04 modem support)
Merging memblock/for-next (3b394dff15e1 memblock tests: add test for memblo=
ck_set_node)
Merging cxl/next (ce32b0c9c522 cxl: core/region - ignore interleave granula=
rity when ways=3D1)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (0dc1754e16b4 efi/libstub: Avoid legacy decompressor zlib/=
zstd wrappers)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (1cabeb548de6 Merge branch 'slab/for-6.16/testin=
g' into slab/for-next)
Merging random/master (602c988b7827 prandom: remove next_pseudo_random32)
Merging landlock/next (47ce2af848b7 landlock: Update log documentation)
Merging rust/rust-next (9d7a0577c9db gcc-15: disable '-Wunterminated-string=
-initialization' entirely for now)
Merging rust-alloc/alloc-next (88d5d6a38d51 rust: alloc: replace `Vec::set_=
len` with `inc_len`)
Merging rust-pin-init/pin-init-next (9de1a293c8ec rust: pin-init: improve d=
ocumentation for `Zeroable` derive macros)
Merging rust-timekeeping/timekeeping-next (679185904972 MAINTAINERS: rust: =
Add a new section for all of the time stuff)
Merging rust-xarray/xarray-next (fa616196fbea MAINTAINERS: add entry for Ru=
st XArray API)
CONFLICT (content): Merge conflict in rust/bindings/bindings_helper.h
Applying: fix up for conflict against drm-nova
Applying: fixup for conflict with the mm-unstable tree
Applying: fix up for conflict with cpufreq-arm tree
Merging sysctl/sysctl-next (23b8bacf1547 sysctl: Close test ctl_headers wit=
h a for loop)
Merging execve/for-next/execve (811500687b73 binfmt_elf: Move brk for stati=
c PIE even if ASLR disabled)
Merging bitmap/bitmap-for-next (a256ae22570e bitfield: Add FIELD_MODIFY() h=
elper)
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (c42afe9a494d integer-wrap: Force full rebuild w=
hen .scl file changes)
Merging nolibc/for-next (e1896bb9e079 selftests: harness: Guard includes on=
 nolibc)
Merging iommufd/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging turbostat/next (447c98c1ca4a tools/power turbostat: Add idle govern=
or statistics reporting)
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.8
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.c
Merging pwrseq/pwrseq/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging capabilities-next/caps-next (4ae89b1fe7c2 capability: Remove unused=
 has_capability)
Merging ipe/next (925df32541da ipe: add errno field to IPE policy load audi=
ting)
Merging kcsan/next (9d89551994a4 Linux 6.13-rc6)
Merging crc/crc-next (46e3311607d6 crypto: crc32 - remove "generic" from fi=
le and module names)
Merging fwctl/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging devsec-tsm/next (152f07b4c292 coco/guest: Move shared guest CC infr=
astructure to drivers/virt/coco/guest/)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)
Applying: mark ARM_SCMI_QUIRKS as BROKEN

--Sig_/Ax71RB6Sef561rJBnCs0UGI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgUlNgACgkQAVBC80lX
0GzAjQgAmTbVvyKk71h8uLvIZhvhdJsoEBFdEuaDLjvZk//7hBH+kxIgXVvCXj4W
lCQo3bHHLcb6L3NqIs9fKhNRSUPhszCl21fb4xNreBhpA1hxYFXIN+w39hgI5K8C
AXyZWRae5PpT4GgHVnhOfLZ/OZSlL3zjll4Re94WVFSVyBtqr3jdwaHSdAZSK6On
9qZ/l709+oksq+NXDfkPdzeHyqxGtJxcj83tUEDZY4znWsyDlEnWD/KFQiywPAhH
WJWWxQuPTyEgO0sFIiQ7BhtvxpmEnXz8BfNwOlkwb5QPTIstQC7tvUEylJDOytOA
GxEGmTPZI/vSFlCqBVjvB+zUH+fThg==
=6qmC
-----END PGP SIGNATURE-----

--Sig_/Ax71RB6Sef561rJBnCs0UGI--

