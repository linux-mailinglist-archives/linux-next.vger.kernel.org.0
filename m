Return-Path: <linux-next+bounces-6374-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A54A9A2ED
	for <lists+linux-next@lfdr.de>; Thu, 24 Apr 2025 09:08:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F491921703
	for <lists+linux-next@lfdr.de>; Thu, 24 Apr 2025 07:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34821EDA1E;
	Thu, 24 Apr 2025 07:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="R02JzYmA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E8779F5;
	Thu, 24 Apr 2025 07:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745478452; cv=none; b=MhM+TXLXZ5lN2VuByUN9wXwi5u02JGMkbNDgSh9LO8Z82nEhYV91Tb5SUOlSn1MopuqPOzejept0Q67vo+bP+JCW9glCuthjr5W/W5LGqFAq0fFuIT8mp1KB5GeU837A1z9OP8dUQjKhqVxyNOjuYhwVInRNKipjERuAkTYvkT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745478452; c=relaxed/simple;
	bh=ZWOjAmQTXT20sRSzyWHFNohm8CNiNjRO40JVpiPhtsA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=i5ST6uKbqNfXDsku0wJbckJhaiLFdzkW0H91aFAU3GNhNhFh+qNTP/kGc98wco9H5v67hiPi0ADoU3232+jurDHVz+pvh77RgZTgDBTKy4TazKmVpZX0ebiqB/ID4C/9tIQ6QiOsvHSXDVwfFjQKd3MUZnb8EA4LPxWztzIY/t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=R02JzYmA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745478437;
	bh=juoIhyDMDVzgwP9b0P0Tw0VYVQ2NMRWx5586pUSNzNw=;
	h=Date:From:To:Cc:Subject:From;
	b=R02JzYmAE00MwfiCfr0uZu9MQLkMp2zlV6r5ULhWeKIZnr3tebTh3ECYACMSK75yp
	 hmF9UkOB21irsk5eLDFX4VVVdTDtANpQyOSEBES/hHVV1+HhWi4wAXtzs/zEczh1Co
	 8n1ZuA5LlKPta1mBrfNgH3waiLungLzFpB/YushxOV2sxXVtoI+dDU6bpSSNmfkLTb
	 llwVmlo+Z+wSL5mXHLzVc8ssjtSIA2Ph+TH6JN1vKip6D6ilxSMA0tel/BG9ypUC9a
	 Xlz5591yFkBy2RYnVYrQi7q0mwNetwIHY9zCF6dzNPizhJj2sQqeytYwk3uqOGpJUY
	 7vKPtv98RRECQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zjn9134xdz4wbf;
	Thu, 24 Apr 2025 17:07:17 +1000 (AEST)
Date: Thu, 24 Apr 2025 17:07:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 24
Message-ID: <20250424170716.35ad5123@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3ybo8+FvA49YqtAfK+E_NjY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3ybo8+FvA49YqtAfK+E_NjY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

News: there will be no linux-next release tomorrow.

Changes since 20250423:

The kvm-fixes tree still had its build failure so I used the version
from next-20250417.  This affected the kvm tree as well.

The mm-unstable tree lost its runtime warning messages.

The tip tree still had its build failure so I used the version from
next-20250414.

The workqueues tree lost its build failure.

Non-merge commits (relative to Linus' tree): 5378
 5589 files changed, 225802 insertions(+), 118752 deletions(-)

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

I am currently merging 391 trees (counting Linus' and 148 trees of bug
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
Merging origin/master (a79be02bba5c Fix mis-uses of 'cc-option' for warning=
 disablement)
Merging fixes/fixes (b3c623b9a94f Merge tag 'thermal-6.15-rc1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging ext4-fixes/fixes (4bbf9020becb Linux 6.13-rc4)
Merging vfs-brauner-fixes/vfs.fixes (d1f7256a5a52 fs: fall back to file_ref=
_put() for non-last reference)
Merging fscrypt-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging fsverity-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging btrfs-fixes/next-fixes (bac8105862c2 Merge branch 'misc-6.15' into =
next-fixes)
Merging vfs-fixes/fixes (00cdfdcfa080 hypfs_create_cpu_files(): add missing=
 check for hypfs_mkdir() failure)
Merging erofs-fixes/fixes (f5ffef9881a7 erofs: remove duplicate code)
Merging nfsd-fixes/nfsd-fixes (a1d14d931bf7 nfsd: decrease sc_count directl=
y if fail to queue dl_recall)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (a6eb9a4a69cc ovl: remove unused forward =
declaration)
Merging bcachefs/for-next (60041107a57b bcachefs: Make various async objs v=
isible in debugfs)
Merging fscrypt/for-next (c07d3aede2b2 fscrypt: add support for hardware-wr=
apped keys)
Merging btrfs/for-next (b258c62d4804 Merge branch 'for-next-next-v6.15-2025=
0423' into for-next-20250423)
Merging ceph/master (f452a2204614 ceph: Fix incorrect flush end position ca=
lculation)
Merging cifs/for-next (9c32cda43eb7 Linux 6.15-rc3)
Merging configfs/configfs-next (8ffd015db85f Linux 6.15-rc2)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (03d2b62208a3 dlm: make tcp still work in multi-link env)
Merging erofs/dev (0f24e3c05afe erofs: enable 48-bit layout support)
Merging exfat/dev (7819f9549ec0 exfat: do not clear volume dirty flag durin=
g sync)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (209e834cd5e6 Pull FAN_PRE_ACCESS on directory fanoti=
fy event support)
Merging ext4/dev (94824ac9a8aa ext4: fix off-by-one error in do_split)
Merging f2fs/dev (42cb74a92ada f2fs: prevent kernel warning due to negative=
 i_nlink from corrupted image)
Merging fsverity/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging fuse/for-next (0c58a97f919c fuse: remove tmp folio for writebacks a=
nd internal rb tree)
Merging gfs2/for-next (4e33dbf0d644 gfs2: Fix usage of bio->bi_status in gf=
s2_end_log_write)
Merging jfs/jfs-next (5dff41a86377 jfs: fix array-index-out-of-bounds read =
in add_missing_indices)
Merging ksmbd/ksmbd-for-next (4fa3122ddb3f Fix use-after-free in session lo=
goff)
Merging nfs/linux-next (0af2f6be1b42 Linux 6.15-rc1)
Merging nfs-anna/linux-next (9084ed79ddaa lsm,nfs: fix memory leak of lsm_c=
ontext)
Merging nfsd/nfsd-next (4462c4dbf465 MAINTAINERS: Update Neil Brown's email=
 address)
Merging ntfs3/master (0af2f6be1b42 Linux 6.15-rc1)
Merging orangefs/for-next (121a83ce6fe6 orangefs: Bufmap deadcoding)
Merging overlayfs/overlayfs-next (aabe43431746 ovl: Use str_on_off() helper=
 in ovl_show_options())
Merging ubifs/next (69146a8c893f ubi: ubi_get_ec_info: Fix compiling error =
'cast specifies array type')
Merging v9fs/9p-next (4210030d8bc4 docs: fs/9p: Add missing "not" in cache =
documentation)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (f0447f80aec8 xfs: remove duplicate Zoned Filesystems =
sections in admin-guide)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging vfs-brauner/vfs.all (e3f181b2471f Merge branch 'vfs-6.16.iomap' int=
o vfs.all)
Merging vfs/for-next (2e72b1e0aac2 Merge branch 'work.d_revalidate' into fo=
r-next)
Merging mm-hotfixes/mm-hotfixes-unstable (2f46598ca150 smaps: fix crash in =
smaps_hugetlb_range for non-present hugetlb entries)
Merging fs-current (16e4732dddd7 Merge branch 'next-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/kdave/linux.git)
Merging kbuild-current/fixes (80e54e84911a Linux 6.14-rc6)
Merging arc-current/for-curr (78d4f34e2115 Linux 6.13-rc3)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (f7edb07ad7c6 Fix mmu notifiers for rang=
e-based invalidates)
Merging arm-soc-fixes/arm/fixes (45d5fe1c53ba ARM: davinci: da850: fix sele=
cting ARCH_DAVINCI_DA8XX)
Merging davinci-current/davinci/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging drivers-memory-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging sophgo-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging m68k-current/for-linus (c94cf023dce3 m68k: defconfig: Update defcon=
figs for v6.14-rc1)
Merging powerpc-fixes/fixes (b2accfe7ca5b powerpc/boot: Check for ld-option=
 support)
Applying: powerpc/boot: Fix dash warning
Merging s390-fixes/fixes (8ffd015db85f Linux 6.15-rc2)
Merging net/main (491ef1117c56 net: ethernet: mtk_eth_soc: net: revise NETS=
YSv3 hardware configuration)
Merging bpf/master (f2858f308131 selftests/bpf: Mitigate sockmap_ktls disco=
nnect_after_delete failure)
Merging ipsec/master (e3fd05777685 xfrm: Fix UDP GRO handling for some corn=
er cases)
Merging netfilter/main (491ef1117c56 net: ethernet: mtk_eth_soc: net: revis=
e NETSYSv3 hardware configuration)
Merging ipvs/main (61f96e684edd Merge tag 'net-6.15-rc1' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/netdev/net)
Merging wireless/for-next (175e69e33c66 wifi: iwlwifi: restore missing init=
ialization of async_handlers_list)
Merging ath/for-current (0937cb5f345c Revert "wifi: mac80211: Update skb's =
control block key in ieee80211_tx_dequeue()")
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (ffc59e32c67e RDMA/bnxt_re: Remove unusable nq va=
riable)
Merging sound-current/for-linus (f406005e162b ALSA: usb-audio: Add retry on=
 -EPROTO from usb_set_interface())
Merging sound-asoc-fixes/for-linus (da6d7db8b162 ASoC: soc-acpi-intel-ptl-m=
atch: add empty item to ptl_cs42l43_l3[])
Merging regmap-fixes/for-linus (6ea36a3e12c5 Merge remote-tracking branch '=
regmap/for-6.14' into regmap-linus)
Merging regulator-fixes/for-linus (8ffd015db85f Linux 6.15-rc2)
Merging spi-fixes/for-linus (460b14b0929f spi: stm32-ospi: Fix an error han=
dling path in stm32_ospi_probe())
Merging pci-current/for-linus (442cacac2d99 misc: pci_endpoint_test: Defer =
IRQ allocation until ioctl(PCITEST_SET_IRQTYPE))
Merging driver-core.current/driver-core-linus (b9792abb76ae drivers/base/me=
mory: Avoid overhead from for_each_present_section_nr())
Merging tty.current/tty-linus (e1ca3ff28ab1 serial: sifive: lock port in st=
artup()/shutdown() callbacks)
Merging usb.current/usb-linus (9788792ad0a0 Merge tag 'usb-serial-6.15-rc3'=
 of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial int=
o usb-linus)
Merging usb-serial-fixes/usb-linus (4cc01410e1c1 USB: serial: simple: add O=
WON HDS200 series oscilloscope support)
Merging phy/fixes (9cf118aafd66 phy: rockchip-samsung-dcphy: Add missing as=
signment)
Merging staging.current/staging-linus (0af2f6be1b42 Linux 6.15-rc1)
Merging iio-fixes/fixes-togreg (609bc31eca06 iio: adis16201: Correct inclin=
ometer channel resolution)
Merging counter-current/counter-current (0af2f6be1b42 Linux 6.15-rc1)
Merging char-misc.current/char-misc-linus (4d239f447f96 firmware: stratix10=
-svc: Add of_platform_default_populate())
Merging soundwire-fixes/fixes (fd15594ba7d5 soundwire: bus: Fix race on the=
 creation of the IRQ domain)
Merging thunderbolt-fixes/fixes (9c32cda43eb7 Linux 6.15-rc3)
Merging input-current/for-linus (946661e3bef8 Merge branch 'next' into for-=
linus)
Merging crypto-current/master (8006aff15516 crypto: atmel-sha204a - Set hwr=
ng quality to lowest possible)
Merging vfio-fixes/for-linus (2bd42b03ab6b vfio/pci: Virtualize zero INTx P=
IN if no pdev->irq)
Merging kselftest-fixes/fixes (07be53cfa81a selftests/ftrace: Differentiate=
 bash and dash in dynevent_limitations.tc)
Merging dmaengine-fixes/fixes (fca280992af8 dmaengine: ti: k3-udma: Add mis=
sing locking)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (1c1fd374a2fe mtd: spinand: Fix build with gcc =
< 7.5)
Merging mfd-fixes/for-mfd-fixes (68f860426d50 mfd: axp20x: AXP717: Fix miss=
ing IRQ status registers range)
Merging v4l-dvb-fixes/fixes (d51adf038ebe media: cec: tda9950: add back i2c=
 dependency)
Merging reset-fixes/reset/fixes (38fec10eb60d Linux 6.14)
Merging mips-fixes/mips-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging at91-fixes/at91-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging omap-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging kvm-fixes/master (9cf353943e2a KVM: x86: Do not use kvm_rip_read() =
unconditionally for KVM_PROFILING)
$ git reset --hard HEAD^
Merging next-20250417 version of kvm-fixes
Merging kvms390-fixes/master (d8dfda5af0be KVM: s390: pv: fix race when mak=
ing a page secure)
Merging hwmon-fixes/hwmon (9c32cda43eb7 Linux 6.15-rc3)
Merging nvdimm-fixes/libnvdimm-fixes (265e98f72bac acpi: nfit: vmalloc-out-=
of-bounds Read in acpi_nfit_ctl)
Merging cxl-fixes/fixes (078d3ee7c162 cxl/core/regs.c: Skip Memory Space En=
able check for RCD and RCH Ports)
Merging dma-mapping-fixes/dma-mapping-fixes (89461db349cc dma-coherent: War=
n if OF reserved memory is beyond current coherent DMA mask)
Merging drivers-x86-fixes/fixes (4a8e04e2bdcb platform/x86: alienware-wmi-w=
max: Fix uninitialized variable due to bad error handling)
Merging samsung-krzk-fixes/fixes (dd303e021996 soc: samsung: usi: prevent w=
rong bits inversion during unconfiguring)
Merging pinctrl-samsung-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging devicetree-fixes/dt/linus (d5f49921707c dt-bindings: soc: fsl: fsl,=
ls1028a-reset: Fix maintainer entry)
Merging dt-krzk-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging scsi-fixes/fixes (b0b7ee3b574a scsi: mpi3mr: Add level check to con=
trol event logging)
Merging drm-fixes/drm-fixes (0467145fab3b Merge tag 'drm-msm-fixes-2025-04-=
18' of https://gitlab.freedesktop.org/drm/msm into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (7e21ea8149a0 drm/i915/pxp: fi=
x undefined reference to `intel_pxp_gsccs_is_ready_for_sessions')
Merging mmc-fixes/fixes (77183db6b8db mmc: renesas_sdhi: disable clocks if =
registering regulator failed)
Merging rtc-fixes/rtc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging gnss-fixes/gnss-linus (0af2f6be1b42 Linux 6.15-rc1)
Merging hyperv-fixes/hyperv-fixes (261ffd53cc8e Drivers: hv: Fix bad pointe=
r dereference in hv_get_partition_id)
Merging risc-v-fixes/fixes (615e705fc8c7 Merge tag 'riscv-fixes-6.15-rc3' o=
f ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into f=
ixes)
Merging riscv-dt-fixes/riscv-dt-fixes (1b133129ad6b riscv: dts: starfive: F=
ix a typo in StarFive JH7110 pin function definitions)
Merging riscv-soc-fixes/riscv-soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (0af2f6be1b42 Linux 6.15-rc1)
Merging gpio-brgl-fixes/gpio/for-current (9c32cda43eb7 Linux 6.15-rc3)
Merging gpio-intel-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging pinctrl-intel-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging auxdisplay-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging kunit-fixes/kunit-fixes (b26c1a85f3fc kunit: qemu_configs: SH: Resp=
ect kunit cmdline)
Merging memblock-fixes/fixes (ed471e198493 memblock tests: Fix mutex relate=
d build error)
Merging renesas-fixes/fixes (379c590113ce ARM: shmobile: smp: Enforce shmob=
ile_smp_* alignment)
Merging perf-current/perf-tools (2b7070291733 perf tools: Remove evsel__han=
dle_error_quirks())
Merging efi-fixes/urgent (11092db5b573 efivarfs: fix NULL dereference on re=
sume)
Merging battery-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging iommufd-fixes/for-rc (0af2f6be1b42 Linux 6.15-rc1)
Merging rust-fixes/rust-fixes (9d7a0577c9db gcc-15: disable '-Wunterminated=
-string-initialization' entirely for now)
Merging w1-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging pmdomain-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging i2c-host-fixes/i2c/i2c-host-fixes (424eafe65647 i2c: cros-ec-tunnel=
: defer probe if parent EC is not present)
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
Merging tip-fixes/tip/urgent (8f89d65a41f0 Merge branch into tip/master: 'x=
86/urgent')
Merging slab-fixes/slab/for-next-fixes (e33b7ae3d802 mm, slab: clean up sla=
b->obj_exts always)
Merging drm-msm-fixes/msm-fixes (9d78f0250322 drm/msm/a6xx+: Don't let IB_S=
IZE overflow)
Merging uml-fixes/fixes (96178631c3f5 um: convert irq_lock to raw spinlock)
Merging fwctl-fixes/for-rc (c92ae5d4f53e fwctl: Fix repeated device word in=
 log message)
Merging drm-misc-fixes/for-linux-next-fixes (bbe5679f30d7 drm/nouveau: Fix =
WARN_ON in nouveau_fence_context_kill())
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (fc96b232f8e7 Merge tag 'pci-v6.15-fixes-2' of =
git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci)
Merging mm-nonmm-stable/mm-nonmm-stable (fc96b232f8e7 Merge tag 'pci-v6.15-=
fixes-2' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci)
Merging mm-unstable/mm-unstable (c0ccad3ee864 mm/vmalloc.c: return explicit=
 error value in alloc_vmap_area())
CONFLICT (content): Merge conflict in arch/x86/kernel/e820.c
Merging mm-nonmm-unstable/mm-nonmm-unstable (e98c8882d7cb maccess: fix strn=
cpy_from_user_nofault() empty string handling)
Merging kbuild/for-next (a7c699d090a1 kbuild: rpm-pkg: build a debuginfo RP=
M)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (1741189d843a perf ui browser hists: Set actio=
ns->thread before calling do_zoom_thread())
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging asm-generic/master (47a60391ae0e rwonce: fix crash by removing READ=
_ONCE() for unaligned read)
Merging alpha/alpha-next (1523226edda5 alpha: Use str_yes_no() helper in pc=
i_dac_dma_supported())
Merging arm/for-next (96e0b3558830 ARM: 9447/1: arm/memremap: fix arch_memr=
emap_can_ram_remap())
Merging arm64/for-next/core (0af2f6be1b42 Linux 6.15-rc1)
Merging arm-perf/for-next/perf (70cbcb2850ec perf: Do not enable by default=
 during compile testing)
Merging arm-soc/for-next (1990c01f0bcc Merge branch 'cznic/platform' into f=
or-next)
Merging amlogic/for-next (8f5f9fc2ee8c Merge branch 'v6.16/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (a6cd41d3ae3e Merge remote-tracking br=
anch 'origin/asahi-soc/dt' into asahi-soc/for-next)
Merging aspeed/for-next (bf8f48263c0e Merge remote-tracking branches 'aspee=
d/dt', 'aspeed/drivers', 'aspeed/fixes' and 'nuvoton/dt' into for-next)
Merging at91/at91-next (eec6ff604b20 Merge branch 'microchip-dt64' into at9=
1-next)
Merging broadcom/next (87b8fa3195af Merge branch 'devicetree-arm64/next' in=
to next)
Merging davinci/davinci/for-next (78e6b545e558 ARM: davinci: remove support=
 for da830)
Merging drivers-memory/for-next (eda787a933ad Merge branch 'mem-ctrl-next' =
into for-next)
Merging imx-mxs/for-next (616589e08aef Merge branch 'imx/dt64' into for-nex=
t)
Merging mediatek/for-next (3a516904e5c1 Merge branch 'v6.15-next/dts64' int=
o for-next)
Merging mvebu/for-next (e85dce9d1b78 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (4349ce7c41af Merge branch 'omap-for-v6.16/drivers' i=
nto tmp/omap-next-20250410.174249)
Merging qcom/for-next (4ad3b5991a98 Merge branches 'arm32-for-6.16', 'arm64=
-defconfig-for-6.16', 'arm64-for-6.16', 'clk-for-6.16' and 'drivers-for-6.1=
6' into for-next)
Merging renesas/next (512c05ad0b88 Merge branches 'renesas-dts-for-v6.16' a=
nd 'renesas-r9a09g077-dt-binding-defs' into renesas-next)
Merging reset/reset/next (4a65326311ab reset: thead: Add TH1520 reset contr=
oller driver)
Merging rockchip/for-next (f92b0e5479aa Merge branch 'v6.16-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (430c1c7fbfcc Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (d520c7f6560e Merge branch 'for-next/scmi/updat=
es', tags 'juno-fix-6.15', 'ffa-fix-6.15' and 'scmi-fixes-6.15' of ssh://gi=
tolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-linu=
x-next)
Merging sophgo/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging spacemit/for-next (279d51ad9f6d riscv: dts: spacemit: Add clock tre=
e for SpacemiT K1)
Merging stm32/stm32-next (65954899a157 arm64: dts: st: add stm32mp215f-dk b=
oard support)
Merging sunxi/sunxi/for-next (69714722df19 arm64: dts: allwinner: h700: Add=
 hp-det-gpios for Anbernic RG35XX)
Merging tee/next (a7562ff02879 Merge branch 'optee_for_v6.14' into next)
Merging tegra/for-next (4e16110559c3 Merge branch for-6.15/arm64/dt into fo=
r-next)
Merging thead-dt/thead-dt-for-next (2bae46e3de2a riscv: dts: thead: Introdu=
ce power domain nodes with aon firmware)
Merging ti/ti-next (4ca9c20e98f6 Merge branches 'ti-k3-dts-next' and 'ti-dr=
ivers-soc-next' into ti-next)
Merging xilinx/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging clk/clk-next (0af2f6be1b42 Linux 6.15-rc1)
Merging clk-imx/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging clk-renesas/renesas-clk (93f287813626 clk: renesas: r9a09g057: Add =
clock and reset entries for USB2)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (17ba839c3c6c LoongArch: Update Loongson-3=
 default config file)
Merging m68k/for-next (c94cf023dce3 m68k: defconfig: Update defconfigs for =
v6.14-rc1)
Merging m68knommu/for-next (80d2737ea705 m68k: coldfire: gpio: use new line=
 value setter callbacks)
Merging microblaze/next (920354d7818b microblaze: Use of_property_present()=
 for non-boolean properties)
Merging mips/mips-next (0af2f6be1b42 Linux 6.15-rc1)
Merging openrisc/for-next (66ffd2f31611 Documentation: openrisc: Update too=
lchain binaries URL)
Merging parisc-hd/for-next (38fec10eb60d Linux 6.14)
Merging powerpc/next (8ffd015db85f Linux 6.15-rc2)
Merging risc-v/for-next (bafa451a96d0 riscv: defconfig: Remove EXPERT)
Merging riscv-dt/riscv-dt-for-next (38818f7c9c17 riscv: dts: starfive: jh71=
10-pine64-star64: enable USB 3.0 port)
Merging riscv-soc/riscv-soc-for-next (071afdd47346 Merge branches 'riscv-ca=
che-for-next' and 'riscv-config-for-next' into riscv-soc-for-next)
Merging s390/for-next (e7ae507c024c s390: Remove optional third argument of=
 strscpy() if possible)
Merging sh/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (33c9da5dfb18 um: Rewrite the sigio workaround based on ep=
oll and tgkill)
Merging xtensa/xtensa-for-next (3d6d238851df arch: xtensa: defconfig: Drop =
obsolete CONFIG_NET_CLS_TCINDEX)
Merging fs-next (4b4b5158d38e Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (9827cd0d6498 Merge branch 'for-6.15-printf-attribu=
te' into for-next)
Merging pci/next (b981b25ce67b Merge branch 'pci/misc')
Merging pstore/for-next/pstore (8ffd015db85f Linux 6.15-rc2)
Merging hid/for-next (160957abbf99 Merge branch 'for-6.15/intel-ish' into f=
or-next)
Merging i2c/i2c/for-next (02cfd9ef8917 Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i2c-host/i2c/i2c-host (7cfa6946c589 i2c: omap: fix deprecated of_pr=
operty_read_bool() use)
Merging i3c/i3c/next (0af2f6be1b42 Linux 6.15-rc1)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (8debd8511dd9 hwmon: (max77705) Add initia=
l support)
Merging jc_docs/docs-next (9d9bec3d90e3 docs: sphinx: kerneldoc: Use python=
 class if available)
Merging v4l-dvb/next (1d1e564fce1b media: rzg2l-cru: Add support for RZ/G3E=
 SoC)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (b6dde1ef1934 Merge branch 'fixes' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (a374f28700ab cpufreq: fix compi=
le-test defaults)
Merging cpupower/cpupower (0af2f6be1b42 Linux 6.15-rc1)
Merging devfreq/devfreq-next (f3253b23535f PM / devfreq: exynos: remove unu=
sed function parameter)
Merging pmdomain/next (08c42b51c804 pmdomain: core: Reset genpd->states to =
avoid freeing invalid data)
Merging opp/opp/linux-next (0af2f6be1b42 Linux 6.15-rc1)
Merging thermal/thermal/linux-next (1b4ef46fd666 thermal/drivers/qcom-spmi-=
temp-alarm: Drop unused driver data)
Merging rdma/for-next (d85080df12f3 RDMA/rxe: Remove unused rxe_run_task)
CONFLICT (content): Merge conflict in drivers/infiniband/sw/rxe/rxe_mr.c
CONFLICT (content): Merge conflict in drivers/infiniband/sw/rxe/rxe_resp.c
Merging net-next/main (cd7276ecac9c Merge branch 'r8169-merge-chip-versions=
')
Merging bpf-next/for-next (b0feb30ab412 Merge branch 'bpf-next/master' into=
 for-next)
Merging ipsec-next/master (86e530c84c97 Merge branch 'Update offload config=
uration with SA')
CONFLICT (content): Merge conflict in drivers/net/ethernet/intel/ixgbe/ixgb=
e_ipsec.c
Merging mlx5-next/mlx5-next (f550694e88b7 net/mlx5: Add IFC bits for PPCNT =
recovery counters group)
Merging netfilter-next/main (88922fe78540 Merge branch 'bridge-mc-per-vlan-=
qquery')
Merging ipvs-next/main (61f96e684edd Merge tag 'net-6.15-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging bluetooth/master (e0af21b30c82 Bluetooth: btmtksdio: Do close if SD=
IO card removed without close)
Merging wireless-next/for-next (f600832794c9 wifi: mac80211: restructure tx=
 profile retrieval for MLO MBSSID)
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/ml=
d/fw.c
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/ml=
d/mld.c
Merging ath-next/for-next (75f90ba47b2c wifi: wcn36xx: Don't use %pK throug=
h printk)
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (0af2f6be1b42 Linux 6.15-rc1)
Merging nand/nand/next (b0e63a0847ee dt-bindings: mtd: gpmi-nand: Add compa=
tible string for i.MX8 chips)
Merging spi-nor/spi-nor/next (eec373688d91 mtd: spi-nor: drop unused <linux=
/of_platform.h>)
Merging crypto/master (63dc06cd12f9 crypto: padlock-sha - Use API partial b=
lock handling)
Merging drm/drm-next (b60301774a8f Merge tag 'drm-intel-next-2025-04-11' of=
 https://gitlab.freedesktop.org/drm/i915/kernel into drm-next)
Merging drm-exynos/for-linux-next (81a50378559b drm/exynos: Remove unnecess=
ary checking)
Merging drm-misc/for-linux-next (ef6517ac5cf9 MAINTAINERS: add entry for Si=
tronix ST7571 LCD Controller)
Merging amdgpu/drm-next (127e612bf167 drm/amdgpu: update fence ptr with con=
text:seqno)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_mes=
.c
Merging drm-intel/for-linux-next (4332473e7ca8 drm/i915/display: Rename vbl=
ank DC workaround functions and variables)
Merging drm-msm/msm-next (83ee6d2ec52f dt-bindings: display/msm: dsi-contro=
ller-main: Add missing minItems)
Merging drm-msm-lumag/msm-next-lumag (83ee6d2ec52f dt-bindings: display/msm=
: dsi-controller-main: Add missing minItems)
Merging drm-nova/nova-next (0c848b3adb45 samples: rust: convert PCI rust sa=
mple driver to use try_access_with())
Merging drm-xe/drm-xe-next (4ea512714c42 drm/xe: Fix CFI violation when acc=
essing sysfs files)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_device.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_pc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_pci.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_pm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_survivability_m=
ode.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_survivability_m=
ode.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_wa_oob.rules
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging regmap/for-next (2385ba6d1dc4 Merge branch 'regmap-linus' into regm=
ap-next)
Merging sound/for-next (f28aa371b73a ALSA: HDA: Add Zhaoxin HDMI Controller=
 and Codec support)
Merging ieee1394/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging sound-asoc/for-next (2f6005456c20 Merge remote-tracking branch 'aso=
c/for-6.16' into asoc-next)
Merging modules/modules-next (1b7b9e30cf33 module: Make .static_call_sites =
read-only after init)
Merging input/next (4d395cb071a3 Input: goodix_berlin - add support for Ber=
lin-A series)
Merging block/for-next (38639724fa3e Merge branch 'userfaultfd-signal' into=
 for-next)
Merging device-mapper/for-next (275d38c68162 dm-bufio: remove maximum age b=
ased eviction)
Merging libata/for-next (ecd9ecc75d15 ata: libata-sata: Use BIT() macro to =
convert tag to bit field)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (1be38f81251f mmc: mtk-sd: Add condition to enable 'single=
' burst type)
Merging mfd/for-mfd-next (d0eceba4d133 dt-bindings: mfd: syscon: Add microc=
hip,sama7d65-secumod)
Merging backlight/for-backlight-next (e12d3e1624a0 backlight: pm8941: Add N=
ULL check in wled_configure())
Merging battery/for-next (51212ce95354 power: supply: gpio-charger: Fix wak=
eup source leaks on device unbind)
Merging regulator/for-next (382d4ee44552 regulator: max20086: Fixes chip id=
 and enable gpio)
Merging security/next (74e5b13a1b0f lsm: Move security_netlink_send to unde=
r CONFIG_SECURITY_NETWORK)
Merging apparmor/apparmor-next (3e45553acb14 apparmor: Remove unused variab=
le 'sock' in __file_sock_perm())
Merging integrity/next-integrity (976e5b974fef ima: process_measurement() n=
eedlessly takes inode_lock() on MAY_READ)
Merging selinux/next (05f1a939225e selinux: fix the kdoc header for task_av=
dcache_update)
Merging smack/next (a158a937d864 smack: recognize ipv4 CIPSO w/o categories)
Merging tomoyo/master (834a4a689699 Merge tag 'for-linus' of git://git.kern=
el.org/pub/scm/linux/kernel/git/rdma/rdma)
Merging tpmdd/next (ebaf911ba6e1 char: tpm: tpm-buf: Add sanity check fallb=
ack in read helpers)
Merging watchdog/master (9bc64d338b0b watchdog: sunxi_wdt: Add support for =
Allwinner A523)
Merging iommu/next (e52e6500a343 Merge branches 'fixes', 'mediatek', 's390'=
 and 'core' into next)
Merging audit/next (654d61b8e0e2 audit: record AUDIT_ANOM_* events regardle=
ss of presence of rules)
Merging devicetree/for-next (2b18eda58c86 dt-bindings: interrupt-controller=
: via,vt8500-intc: Convert to YAML)
Merging dt-krzk/for-next (62db22c2af6c Merge branch 'next/dt64' into for-ne=
xt)
Merging mailbox/for-next (1ec12fd31ecc mailbox: Remove unneeded semicolon)
Merging spi/for-next (fc7cceba3c87 Merge remote-tracking branch 'spi/for-6.=
16' into spi-next)
Merging tip/master (6fe20f70360a Merge branch into tip/master: 'x86/sev')
CONFLICT (content): Merge conflict in arch/x86/Kconfig.assembler
$ git reset --hard HEAD^
Merging next-20250414 version of tip
CONFLICT (content): Merge conflict in arch/x86/Kconfig.assembler
CONFLICT (content): Merge conflict in arch/x86/events/intel/core.c
CONFLICT (content): Merge conflict in arch/x86/kernel/e820.c
[master 244b1f05fbb6] next-20250414/tip
Merging clockevents/timers/drivers/next (0f920690a82c dt-bindings: timer: A=
dd SiFive CLINT2)
Merging edac/edac-for-next (f53deda1a997 Merge branch 'edac-drivers' into e=
dac-for-next)
Merging ftrace/for-next (d85852264728 Merge tools/for-next)
Merging rcu/next (7fca2a80b81a Merge branches 'rcu/misc-for-6.16', 'rcu/seq=
-counters-for-6.16' and 'rcu/torture-for-6.16' into rcu/for-next)
Merging paulmck/non-rcu/next (548be320be66 Merge branches 'lkmm.2025.04.22a=
' and 'ratelimit-next.2025.04.23a' into HEAD)
Merging kvm/next (2ae06ae44beb Merge branch 'kvm-fixes-6.15-rc3' into HEAD)
CONFLICT (content): Merge conflict in arch/x86/kvm/vmx/vmx.c
$ git reset --hard HEAD^
Merging next-20250417 version of kvm
CONFLICT (content): Merge conflict in arch/x86/kvm/vmx/vmx.c
[master c887bd0b06b6] next-20250417/kvm
Merging kvm-arm/next (369c0122682c Merge branch 'kvm-arm64/pmu-fixes' into =
kvmarm/next)
Merging kvms390/next (0c7fbae5bc78 KVM: s390: Don't use %pK through debug p=
rinting)
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (b3f263a98d30 RISC-V: KVM: Optimize commen=
ts in kvm_riscv_vcpu_isa_disable_allowed)
Merging kvm-x86/next (c9ea48bb6ee6 Merge branch 'xen')
Merging xen-tip/linux-next (715ad3e0ec2b xen: fix multicall debug feature)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (70e1683ca3a6 workqueue: Fix race condition in =
wq->stats incrementation)
Merging sched-ext/for-next (069ac9e161eb sched_ext: Clarify CPU context for=
 running/stopping callbacks)
Merging drivers-x86/for-next (981527828c30 platform/mellanox: Rename field =
to improve code readability)
CONFLICT (content): Merge conflict in drivers/platform/x86/dell/alienware-w=
mi-wmax.c
Merging chrome-platform/for-next (31d3bd592df5 platform/chrome: cros_kbd_le=
d_backlight: Fix build dependencies)
Merging chrome-platform-firmware/for-firmware-next (0af2f6be1b42 Linux 6.15=
-rc1)
Merging hsi/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging leds-lj/for-leds-next (cd704688cb84 leds: lp8860: Disable GPIO with=
 devm action)
Merging ipmi/for-next (37631eee2063 ipmi:si: Move SI type information into =
an info structure)
Merging driver-core/driver-core-next (8117b017f382 Merge tag 'topic/device-=
context-2025-04-17' into driver-core-next)
Merging usb/usb-next (f41f7b3d9daf MAINTAINERS: Update Intel LJCA maintaine=
r)
CONFLICT (content): Merge conflict in drivers/usb/chipidea/ci_hdrc_imx.c
CONFLICT (content): Merge conflict in drivers/usb/host/xhci.h
Merging thunderbolt/next (4fd7a1f0f7f2 usb: typec: Connect Type-C port with=
 associated USB4 port)
Merging usb-serial/usb-next (0af2f6be1b42 Linux 6.15-rc1)
Merging tty/tty-next (926040da6064 serial: 8250_of: manage bus clock in sus=
pend/resume)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/ser=
ial/snps-dw-apb-uart.yaml
Merging char-misc/char-misc-next (a7924f4c489b comedi: ni_atmio: avoid warn=
ing for unused device_ids[] table)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (5442d22da7db Coresight: Fix a NULL vs IS_ERR() bug =
in probe)
Merging fastrpc/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga/for-next (e19890a0088b fpga: versal: remove incorrect of_match=
_ptr annotation)
Merging icc/icc-next (be73df376a97 Merge branch 'icc-sa8775p' into icc-next)
Merging iio/togreg (b475195fecc7 staging: iio: ad5933: Correct settling cyc=
les encoding per datasheet)
Merging phy-next/next (9d0ec51d7c22 phy: rockchip: samsung-hdptx: Add high =
color depth management)
Merging soundwire/next (0af2f6be1b42 Linux 6.15-rc1)
Merging extcon/extcon-next (7041ed0dde83 extcon: Drop explicit initializati=
on of struct i2c_device_id::driver_data to 0)
Merging gnss/gnss-next (0af2f6be1b42 Linux 6.15-rc1)
Merging vfio/next (860be250fc32 vfio/pci: Handle INTx IRQ_NOTCONNECTED)
Merging w1/for-next (a9b3ecc7bcf6 w1: Avoid -Wflex-array-member-not-at-end =
warnings)
Merging spmi/spmi-next (a35fc095fc52 spmi: add a spmi driver for Apple SoC)
Merging staging/staging-next (4960bce324fe staging: gpib: Add return value =
to request_control)
Merging counter-next/counter-next (0af2f6be1b42 Linux 6.15-rc1)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (5d099706449d dmaengine: Add Arm DMA-350 driver)
Merging cgroup/for-next (68d22e7da593 Merge branch 'for-6.16' into for-next)
Merging scsi/for-next (75e7dd94417f Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (37c15b72815b Merge patch series "scsi: qedi dead=
coding")
Merging vhost/linux-next (1f69fe75a328 vhost-scsi: log event queue write de=
scriptors)
Merging rpmsg/for-next (afc760ba751c Merge branch 'rproc-next' into for-nex=
t)
Merging gpio-brgl/gpio/for-next (417b0f8d08f8 gpio: pca953x: Add support fo=
r level-triggered interrupts)
Merging gpio-intel/for-next (a02af05f41c7 Merge patch series "gpiolib: acpi=
: Fix missing info filling")
Merging pinctrl/for-next (201a63fba119 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging pinctrl-renesas/renesas-pinctrl (abcdeb4e299a pinctrl: renesas: rza=
2: Fix missing of_node_put() call)
Merging pinctrl-samsung/for-next (a30692b4f81b pinctrl: samsung: Add filter=
 selection support for alive bank on gs101)
Merging pwm/pwm/for-next (df674f63121f dt-bindings: pwm: mediatek,pwm-disp:=
 Add compatible for MT6893)
Merging ktest/for-next (5a1bed232781 ktest: Fix Test Failures Due to Missin=
g LOG_FILE Directories)
Merging kselftest/next (0af2f6be1b42 Linux 6.15-rc1)
Merging kunit/test (0af2f6be1b42 Linux 6.15-rc1)
Merging kunit-next/kunit (1d31d536871f kunit: qemu_configs: Disable faultin=
g tests on 32-bit SPARC)
Merging livepatching/for-next (a8e905a819fd Merge branch 'for-6.15/ftrace-t=
est' into for-next)
Merging rtc/rtc-next (d37058674646 rtc: da9063: simplify irq management)
Merging nvdimm/libnvdimm-for-next (ef1d3455bbc1 libnvdimm/labels: Fix divid=
e error in nd_label_data_init())
Merging at24/at24/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging ntb/ntb-next (0cadf92e93d4 NTB/msi: Remove unused functions)
Merging seccomp/for-next/seccomp (8ffd015db85f Linux 6.15-rc2)
Merging slimbus/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging nvmem/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (628cc040b3a2 x86/hyperv: fix an indentation iss=
ue in mshyperv.h)
Merging auxdisplay/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging kgdb/kgdb/for-next (afdbe49276ac kdb: Remove optional size argument=
s from strscpy() calls)
Merging hmm/hmm (c92ae5d4f53e fwctl: Fix repeated device word in log messag=
e)
Merging cfi/cfi/next (0af2f6be1b42 Linux 6.15-rc1)
Merging mhi/mhi-next (85a8ea8a0346 bus: mhi: host: pci_generic: Remove assi=
gn resource usage)
Merging memblock/for-next (3b394dff15e1 memblock tests: add test for memblo=
ck_set_node)
Merging cxl/next (73c117c17b56 cxl: core/region - ignore interleave granula=
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
Merging rust-pin-init/pin-init-next (39051adb0704 rust: pin-init: examples:=
 use `allow` instead of `expect`)
Merging rust-timekeeping/timekeeping-next (8ffd015db85f Linux 6.15-rc2)
Merging sysctl/sysctl-next (23b8bacf1547 sysctl: Close test ctl_headers wit=
h a for loop)
Merging execve/for-next/execve (8ffd015db85f Linux 6.15-rc2)
Merging bitmap/bitmap-for-next (1f11411b56ea bitfield: Add FIELD_MODIFY() h=
elper)
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (f4e2f3f28908 Merge branch 'for-linus/hardening'=
 into for-next/kspp)
Merging nolibc/nolibc (0af2f6be1b42 Linux 6.15-rc1)
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
Merging crc/crc-next (1ec3d4ff5c77 s390/crc32: Remove no-op module init and=
 exit functions)
Merging fwctl/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)

--Sig_/3ybo8+FvA49YqtAfK+E_NjY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgJ4yQACgkQAVBC80lX
0Gwvywf9H8gI9GV1SPlfo3fpEKoV7M/mGWIiIAMiGqhTaXq1ZfpRsWkDJGjcR+b+
fuUqCilNhHuR+zo3JGapmSP6uNOb2cCDNHiEfTjWhSPygE1LP+5TYVnf1jAe6sv/
8zKd9Y4jPi1Ez3r520/R7L11rjtNRj+DeyyiD1eQ0juMAJtPT157dJ/0n6ZYZoCC
VLViBOJk2T5EywLGnEB7CgFntaem0K3QbPdGE9+j1VcnaIhLfOuvY2kLwuP1r5e3
7+A7aELURlOYk26+qAnHLYH+b1QnmThZhBuyTwNtCOJs5hY5qiZHiaXlS1sOdLU0
aWLtqNAwoNXUCCwQpgBi5ds4QlvwOA==
=ZozG
-----END PGP SIGNATURE-----

--Sig_/3ybo8+FvA49YqtAfK+E_NjY--

