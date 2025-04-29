Return-Path: <linux-next+bounces-6434-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 006C7AA068E
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 11:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DE4D18966E3
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 09:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291242BD5AE;
	Tue, 29 Apr 2025 09:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Aa3MwkWh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8465529E077;
	Tue, 29 Apr 2025 09:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917387; cv=none; b=AIo48I4iHUnPIYCeUecY7Cu0gu7qRosiB3j0sabAY0RLrXb0hQikSAV8fE1pqYvZbmfUqxA+lj4DqD1+rFmo04UVf8LPGPdzbSmkfvIqMY0CgoO0AGmGNtRyye7VTRlgPlvVP/GxFI8rSXwHDQUGaXWUQbZAXa9H+P7QAvMaTLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917387; c=relaxed/simple;
	bh=/mJyV54vKrzaHMmzajAKJOBV6pwxXfpo8D5ZQppTdWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cRNwxcR9EhlDDkNGOegzVQ9Z3umcFZ4q4L8V7WyZLy94g3Uce7di/V/TKQDVF69b7u+CxWW/qVasbg8rIU87IcxKtVVQqyGpQmvco31i5ZVVaRK1zq0ncQkyO7ZOTCzuD8GLtPL98GkMIlbRMEI/jET/ae/dJvDVnv8bBIue53c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Aa3MwkWh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745917379;
	bh=TCR45brjMMkpyq4GCeiWLWw+iYwX8NpyQMLGLujvKz0=;
	h=Date:From:To:Cc:Subject:From;
	b=Aa3MwkWhL0KewRZ/rOaeMtsvS4AxileIrr7gaYdPdBGwaHUNpLtqdis/ocuDubQ+c
	 qjiYx/cfIXGBxXySKG6nV5OdZfQ316RAFDIjk9YVkOYEp0O5XW7irnw5DfzfAEcXgL
	 +Od7AzYb/ZhT5+7BfeBAXelV4c5UQg6V5bTZ+z0rxsXfZwl258RmijqruW/Jw0MThZ
	 TQp1Itfv2tNq4XkOw/Y+IKGmKAXQoFX+InJBWLeI3zI7osiP0y3Kzp4TNeSViBBiE0
	 pmdvtOV/9k0pwvdP1RY0j+SInUsEuCnFG03amgChmEIt0ms6YTcEj8yc6uvF85bFBk
	 orOCPN2RnCWPw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZmvVC5WM7z4wnp;
	Tue, 29 Apr 2025 19:02:59 +1000 (AEST)
Date: Tue, 29 Apr 2025 19:02:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 29
Message-ID: <20250429190259.1cc2d649@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BzX+gs9erq.pa5p_Z1RRPSM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BzX+gs9erq.pa5p_Z1RRPSM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250428:

The input-current tree gained a conflict against Linus' tree.

The rockchip tree lost its build failure.

The sunxi tree lost its build failure.

The cpufreq-arm tree still had its build failure so I used the version
from next-20250424.

The drm-nova tree lost its build failure.

The tip tree still had its build failure so I used the version from
next-20250414.

The char-misc tree gained a build failure so I used the version from
next-20250428.

The rust-xarray tree gained a conflict against the drm-nova tree.

The rust-xarray tree still had semantic conflicts against the mm-unstable
and drm-nova trees.  I have applied suggested patches.

Non-merge commits (relative to Linus' tree): 6323
 6516 files changed, 269223 insertions(+), 142265 deletions(-)

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

I am currently merging 394 trees (counting Linus' and 149 trees of bug
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
Merging origin/master (78109c591b80 Merge tag 'for-6.15/dm-fixes' of git://=
git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging fixes/fixes (b3c623b9a94f Merge tag 'thermal-6.15-rc1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging ext4-fixes/fixes (4bbf9020becb Linux 6.13-rc4)
Merging vfs-brauner-fixes/vfs.fixes (f520bed25d17 fs/xattr: Fix handling of=
 AT_FDCWD in setxattrat(2) and getxattrat(2))
Merging fscrypt-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging fsverity-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging btrfs-fixes/next-fixes (6c456acbd0b2 Merge branch 'misc-6.15' into =
next-fixes)
Merging vfs-fixes/fixes (00cdfdcfa080 hypfs_create_cpu_files(): add missing=
 check for hypfs_mkdir() failure)
Merging erofs-fixes/fixes (8d16dd7b651b MAINTAINERS: erofs: add myself as r=
eviewer)
Merging nfsd-fixes/nfsd-fixes (831e3f545b07 Revert "sunrpc: clean cache_det=
ail immediately when flush is written frequently")
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (a6eb9a4a69cc ovl: remove unused forward =
declaration)
Merging bcachefs/for-next (e880cf00c27b bcachefs: bch2_trans_update_ip())
Merging fscrypt/for-next (c07d3aede2b2 fscrypt: add support for hardware-wr=
apped keys)
Merging btrfs/for-next (b25667588fc3 Merge branch 'for-next-next-v6.15-2025=
0428' into for-next-20250428)
Merging ceph/master (f452a2204614 ceph: Fix incorrect flush end position ca=
lculation)
Merging cifs/for-next (565d253a5ab1 cifs: Fix changing times and read-only =
attr over SMB1 smb_set_file_info() function)
Merging configfs/configfs-next (eae324ca6445 configfs: Add CONFIGFS_ATTR_PE=
RM helper)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (03d2b62208a3 dlm: make tcp still work in multi-link env)
Merging erofs/dev (0f24e3c05afe erofs: enable 48-bit layout support)
Merging exfat/dev (7819f9549ec0 exfat: do not clear volume dirty flag durin=
g sync)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (60af3aad7127 Pull fanotify mark flushing fix.)
Merging ext4/dev (94824ac9a8aa ext4: fix off-by-one error in do_split)
Merging f2fs/dev (42cb74a92ada f2fs: prevent kernel warning due to negative=
 i_nlink from corrupted image)
Merging fsverity/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging fuse/for-next (0c58a97f919c fuse: remove tmp folio for writebacks a=
nd internal rb tree)
Merging gfs2/for-next (2abc01ae2685 gfs2: Use SECTOR_SIZE and SECTOR_SHIFT)
Merging jfs/jfs-next (5dff41a86377 jfs: fix array-index-out-of-bounds read =
in add_missing_indices)
Merging ksmbd/ksmbd-for-next (2fc9feff45d9 ksmbd: fix use-after-free in ses=
sion logoff)
Merging nfs/linux-next (fa7ab64f1e2f NFS/localio: Fix a race in nfs_local_o=
pen_fh())
Merging nfs-anna/linux-next (9084ed79ddaa lsm,nfs: fix memory leak of lsm_c=
ontext)
Merging nfsd/nfsd-next (b5d9eaabbb5e MAINTAINERS: Update Neil Brown's email=
 address)
Merging ntfs3/master (8b26c8c376b2 fs/ntfs3: Add missing direct_IO in ntfs_=
aops_cmpr)
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
Merging vfs-brauner/vfs.all (1f875b49e7ab Merge branch 'vfs-6.16.iomap' int=
o vfs.all)
Merging vfs/for-next (2e72b1e0aac2 Merge branch 'work.d_revalidate' into fo=
r-next)
Merging mm-hotfixes/mm-hotfixes-unstable (352c03db61cd mm: vmalloc: support=
 more granular vrealloc() sizing)
Merging fs-current (a1a13081c831 Merge branch 'fixes' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/xiang/erofs.git)
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
Merging powerpc-fixes/fixes (e3f506b78d92 powerpc/boot: Fix dash warning)
Merging s390-fixes/fixes (8ffd015db85f Linux 6.15-rc2)
Merging net/main (8c47d5753a11 net: ethernet: mtk_eth_soc: sync mtk_clks_so=
urce_name array)
Merging bpf/master (b4432656b36e Linux 6.15-rc4)
Merging ipsec/master (e3fd05777685 xfrm: Fix UDP GRO handling for some corn=
er cases)
Merging netfilter/main (491ef1117c56 net: ethernet: mtk_eth_soc: net: revis=
e NETSYSv3 hardware configuration)
Merging ipvs/main (491ef1117c56 net: ethernet: mtk_eth_soc: net: revise NET=
SYSv3 hardware configuration)
Merging wireless/for-next (30763f1adf69 Merge tag 'wireless-2025-04-24' of =
https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless)
Merging ath/for-current (0937cb5f345c Revert "wifi: mac80211: Update skb's =
control block key in ieee80211_tx_dequeue()")
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (ffc59e32c67e RDMA/bnxt_re: Remove unusable nq va=
riable)
Merging sound-current/for-linus (1149719442d2 ALSA: usb-audio: Add second U=
SB ID for Jabra Evolve 65 headset)
Merging sound-asoc-fixes/for-linus (a549b927ea3f ASoC: Intel: bytcr_rt5640:=
 Add DMI quirk for Acer Aspire SW3-013)
Merging regmap-fixes/for-linus (6ea36a3e12c5 Merge remote-tracking branch '=
regmap/for-6.14' into regmap-linus)
Merging regulator-fixes/for-linus (8ffd015db85f Linux 6.15-rc2)
Merging spi-fixes/for-linus (15cfe55ec58a Add basic SPI support for SOPHGO =
SG2042 SoC)
Merging pci-current/for-linus (0af2f6be1b42 Linux 6.15-rc1)
Merging driver-core.current/driver-core-linus (b4432656b36e Linux 6.15-rc4)
Merging tty.current/tty-linus (b4432656b36e Linux 6.15-rc4)
Merging usb.current/usb-linus (b4432656b36e Linux 6.15-rc4)
Merging usb-serial-fixes/usb-linus (b4432656b36e Linux 6.15-rc4)
Merging phy/fixes (9cf118aafd66 phy: rockchip-samsung-dcphy: Add missing as=
signment)
Merging staging.current/staging-linus (c6e8d85fafa7 staging: axis-fifo: Rem=
ove hardware resets for user errors)
Merging iio-fixes/fixes-togreg (609bc31eca06 iio: adis16201: Correct inclin=
ometer channel resolution)
Merging counter-current/counter-current (0af2f6be1b42 Linux 6.15-rc1)
Merging char-misc.current/char-misc-linus (b4432656b36e Linux 6.15-rc4)
Merging soundwire-fixes/fixes (fd15594ba7d5 soundwire: bus: Fix race on the=
 creation of the IRQ domain)
Merging thunderbolt-fixes/fixes (b4432656b36e Linux 6.15-rc4)
Merging input-current/for-linus (22cd66a5db56 Input: xpad - add support for=
 8BitDo Ultimate 2 Wireless Controller)
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
Merging v4l-dvb-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging reset-fixes/reset/fixes (38fec10eb60d Linux 6.14)
Merging mips-fixes/mips-fixes (7f74c066e5d9 MIPS: CPS: Fix potential NULL p=
ointer dereferences in cps_prepare_cpus())
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
Merging scsi-fixes/fixes (b0b7ee3b574a scsi: mpi3mr: Add level check to con=
trol event logging)
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
Merging perf-current/perf-tools (bfb713ea53c7 perf tools: Fix arm64 build b=
y generating unistd_64.h)
Merging efi-fixes/urgent (11092db5b573 efivarfs: fix NULL dereference on re=
sume)
Merging battery-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging iommufd-fixes/for-rc (0af2f6be1b42 Linux 6.15-rc1)
Merging rust-fixes/rust-fixes (9d7a0577c9db gcc-15: disable '-Wunterminated=
-string-initialization' entirely for now)
Merging w1-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging pmdomain-fixes/fixes (9c32cda43eb7 Linux 6.15-rc3)
Merging i2c-host-fixes/i2c/i2c-host-fixes (9c32cda43eb7 Linux 6.15-rc3)
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
Merging tip-fixes/tip/urgent (2fb0916281b8 Merge branch into tip/master: 't=
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
Merging drm-misc-fixes/for-linux-next-fixes (76047483fe94 drm/ttm: fix the =
warning for hit_low and evict_low)
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (fc96b232f8e7 Merge tag 'pci-v6.15-fixes-2' of =
git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci)
Merging mm-nonmm-stable/mm-nonmm-stable (fc96b232f8e7 Merge tag 'pci-v6.15-=
fixes-2' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci)
Merging mm-unstable/mm-unstable (b18dec6a6ad3 mm/numa: remove unnecessary l=
ocal variable in alloc_node_data())
CONFLICT (content): Merge conflict in arch/x86/kernel/e820.c
Merging mm-nonmm-unstable/mm-nonmm-unstable (5e60baad2017 sort.h: hoist cmp=
_int() into generic header file)
Merging kbuild/for-next (a7c699d090a1 kbuild: rpm-pkg: build a debuginfo RP=
M)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (2d099ccaadf6 perf test: Add perf trace summar=
y test)
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
Merging at91/at91-next (a9c0a43cb22d Merge branch 'at91-dt' into at91-next)
Merging broadcom/next (87b8fa3195af Merge branch 'devicetree-arm64/next' in=
to next)
Merging davinci/davinci/for-next (78e6b545e558 ARM: davinci: remove support=
 for da830)
Merging drivers-memory/for-next (eda787a933ad Merge branch 'mem-ctrl-next' =
into for-next)
Merging imx-mxs/for-next (9bfe32fed9a8 Merge branch 'imx/dt64' into for-nex=
t)
Merging mediatek/for-next (6b4f49867f75 Merge branch 'v6.15-next/dts64' int=
o for-next)
Merging mvebu/for-next (e85dce9d1b78 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (4349ce7c41af Merge branch 'omap-for-v6.16/drivers' i=
nto tmp/omap-next-20250410.174249)
Merging qcom/for-next (4ad3b5991a98 Merge branches 'arm32-for-6.16', 'arm64=
-defconfig-for-6.16', 'arm64-for-6.16', 'clk-for-6.16' and 'drivers-for-6.1=
6' into for-next)
Merging renesas/next (f33d66f2f22a Merge branches 'renesas-dt-bindings-for-=
v6.16' and 'renesas-dts-for-v6.16' into renesas-next)
Merging reset/reset/next (4a65326311ab reset: thead: Add TH1520 reset contr=
oller driver)
Merging rockchip/for-next (ad4afdbc19ff Merge branch 'v6.16-clk/next' into =
for-next)
Merging samsung-krzk/for-next (ec48916a2164 Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (d520c7f6560e Merge branch 'for-next/scmi/updat=
es', tags 'juno-fix-6.15', 'ffa-fix-6.15' and 'scmi-fixes-6.15' of ssh://gi=
tolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-linu=
x-next)
Merging sophgo/for-next (ae246f5c0ce4 riscv: sophgo: dts: Add spi controlle=
r for SG2042)
Merging spacemit/for-next (cb9c3aeae509 riscv: dts: spacemit: add gpio LED =
for system heartbeat)
Merging stm32/stm32-next (65954899a157 arm64: dts: st: add stm32mp215f-dk b=
oard support)
Merging sunxi/sunxi/for-next (51e5f6ab27e1 Merge branches 'sunxi/dt-for-6.1=
6', 'sunxi/fixes-for-6.15' and 'sunxi/clk-for-6.16' into sunxi/for-next)
Merging tee/next (34e4aaeff2a8 Merge branch 'tee_for_v6_16' into next)
Merging tegra/for-next (4e16110559c3 Merge branch for-6.15/arm64/dt into fo=
r-next)
Merging thead-dt/thead-dt-for-next (1b136de08b5f riscv: dts: thead: Introdu=
ce reset controller node)
Merging ti/ti-next (794f282b1004 Merge branches 'ti-k3-dts-next' and 'ti-k3=
-config-next' into ti-next)
Merging xilinx/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging clk/clk-next (0af2f6be1b42 Linux 6.15-rc1)
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
Merging s390/for-next (e7ae507c024c s390: Remove optional third argument of=
 strscpy() if possible)
Merging sh/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (33c9da5dfb18 um: Rewrite the sigio workaround based on ep=
oll and tgkill)
Merging xtensa/xtensa-for-next (3d6d238851df arch: xtensa: defconfig: Drop =
obsolete CONFIG_NET_CLS_TCINDEX)
Merging fs-next (ad29da28cced Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (9827cd0d6498 Merge branch 'for-6.15-printf-attribu=
te' into for-next)
Merging pci/next (b981b25ce67b Merge branch 'pci/misc')
Merging pstore/for-next/pstore (8ffd015db85f Linux 6.15-rc2)
Merging hid/for-next (f843dbd14f03 Merge branch 'for-6.15/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (d9f25720f570 Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i2c-host/i2c/i2c-host (5891299b4668 i2c: pasemi: Log bus reset caus=
es)
Merging i3c/i3c/next (0af2f6be1b42 Linux 6.15-rc1)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (8debd8511dd9 hwmon: (max77705) Add initia=
l support)
Merging jc_docs/docs-next (c0fe189b590c docs: namespace: Tweak and reword r=
esource control doc)
Merging v4l-dvb/next (398a1b33f147 media: gspca: Add error handling for stv=
06xx_read_sensor())
CONFLICT (content): Merge conflict in drivers/media/i2c/ds90ub960.c
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (b999105a0587 Merge branch 'pm-sleep' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (1ade7a37ca60 Merge branch 'rust=
/cpufreq-dt' into cpufreq/arm/linux-next)
$ git reset --hard HEAD^
Merging next-20250424 version of cpufreq-arm
Merging cpupower/cpupower (0af2f6be1b42 Linux 6.15-rc1)
Merging devfreq/devfreq-next (f3253b23535f PM / devfreq: exynos: remove unu=
sed function parameter)
Merging pmdomain/next (0c1ddc7bb3e5 pmdomain: mediatek: Add error messages =
for missing regmaps)
Merging opp/opp/linux-next (cb4bdf07e512 OPP: Use mutex locking guards)
Merging thermal/thermal/linux-next (1b4ef46fd666 thermal/drivers/qcom-spmi-=
temp-alarm: Drop unused driver data)
Merging rdma/for-next (6bd18dabf1c9 RDMA/hns: Add trace for CMDQ dumping)
CONFLICT (content): Merge conflict in drivers/infiniband/sw/rxe/rxe_mr.c
CONFLICT (content): Merge conflict in drivers/infiniband/sw/rxe/rxe_resp.c
Merging net-next/main (0d15a26b247d net: ti: icssg-prueth: Add ICSSG FW Sta=
ts)
Merging bpf-next/for-next (e438aa4bef7c Merge branch 'bpf-next/master' into=
 for-next)
Merging ipsec-next/master (86e530c84c97 Merge branch 'Update offload config=
uration with SA')
CONFLICT (content): Merge conflict in drivers/net/ethernet/intel/ixgbe/ixgb=
e_ipsec.c
Merging mlx5-next/mlx5-next (f550694e88b7 net/mlx5: Add IFC bits for PPCNT =
recovery counters group)
Merging netfilter-next/main (88922fe78540 Merge branch 'bridge-mc-per-vlan-=
qquery')
Merging ipvs-next/main (88922fe78540 Merge branch 'bridge-mc-per-vlan-qquer=
y')
Merging bluetooth/master (7a53e2a5836c Bluetooth: add support for SIOCETHTO=
OL ETHTOOL_GET_TS_INFO)
Merging wireless-next/for-next (885e5cbaa0ee Revert "wifi: iwlwifi: clean u=
p config macro")
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/ml=
d/fw.c
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/ml=
d/mld.c
Merging ath-next/for-next (885e5cbaa0ee Revert "wifi: iwlwifi: clean up con=
fig macro")
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (0af2f6be1b42 Linux 6.15-rc1)
Merging nand/nand/next (b0e63a0847ee dt-bindings: mtd: gpmi-nand: Add compa=
tible string for i.MX8 chips)
Merging spi-nor/spi-nor/next (eec373688d91 mtd: spi-nor: drop unused <linux=
/of_platform.h>)
Merging crypto/master (2dfc7cd74a5e crypto: sun8i-ss - do not use sg_dma_le=
n before calling DMA functions)
Merging drm/drm-next (d2b9e2f8a15d Merge tag 'drm-xe-next-2025-04-17' of ht=
tps://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging drm-exynos/for-linux-next (81a50378559b drm/exynos: Remove unnecess=
ary checking)
Merging drm-misc/for-linux-next (69b8115fc8d1 drm/panfrost: reorder pd/clk/=
rst sequence)
Merging amdgpu/drm-next (127e612bf167 drm/amdgpu: update fence ptr with con=
text:seqno)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_mes=
.c
Merging drm-intel/for-linux-next (2af5615a5ba1 drm/i915/psr: Move PSR worka=
round to intel_psr.c)
Merging drm-msm/msm-next (83ee6d2ec52f dt-bindings: display/msm: dsi-contro=
ller-main: Add missing minItems)
Merging drm-msm-lumag/msm-next-lumag (83ee6d2ec52f dt-bindings: display/msm=
: dsi-controller-main: Add missing minItems)
Merging drm-xe/drm-xe-next (84a11c519234 drm/xe: Drop force_alloc from xe_b=
o_evict in selftests)
Merging drm-nova/nova-next (3be746ebc1e6 MAINTAINERS: add DRM Rust source f=
iles to DRM DRIVERS)
CONFLICT (content): Merge conflict in rust/helpers/helpers.c
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (c29fea5c7208 vgacon: Add check for vc_origin addres=
s range in vgacon_scroll())
Merging regmap/for-next (2385ba6d1dc4 Merge branch 'regmap-linus' into regm=
ap-next)
Merging sound/for-next (bdd9ea9187c4 ALSA: hda/hda_cs_dsp_ctl: Delete hda_c=
s_dsp_ctl module)
Merging ieee1394/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging sound-asoc/for-next (a9bfaf85aaf2 Merge remote-tracking branch 'aso=
c/for-6.16' into asoc-next)
Merging modules/modules-next (1b7b9e30cf33 module: Make .static_call_sites =
read-only after init)
Merging input/next (353bdd7d1456 Input: matrix_keypad - detect change durin=
g scan)
Merging block/for-next (aba591ac3e88 Merge branch 'for-6.16/io_uring' into =
for-next)
Merging device-mapper/for-next (7570e9bd6905 dm: remove unneeded kvfree fro=
m alloc_targets)
Merging libata/for-next (b8ed9475384f dt-bindings: ata: rockchip-dwc-ahci: =
add RK3576 compatible)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (b792cfd9d4a3 dt-bindings: mmc: sdhci-msm: Add the SM7150 =
compatible)
Merging mfd/for-mfd-next (d0eceba4d133 dt-bindings: mfd: syscon: Add microc=
hip,sama7d65-secumod)
Merging backlight/for-backlight-next (e12d3e1624a0 backlight: pm8941: Add N=
ULL check in wled_configure())
Merging battery/for-next (18672fe12367 power: reset: add Toradex Embedded C=
ontroller)
Merging regulator/for-next (5410aa3aa7f7 regulator: pf9453: convert to use =
maple tree register cache)
Merging security/next (74e5b13a1b0f lsm: Move security_netlink_send to unde=
r CONFIG_SECURITY_NETWORK)
Merging apparmor/apparmor-next (3e45553acb14 apparmor: Remove unused variab=
le 'sock' in __file_sock_perm())
Merging integrity/next-integrity (b4432656b36e Linux 6.15-rc4)
Merging selinux/next (05f1a939225e selinux: fix the kdoc header for task_av=
dcache_update)
Merging smack/next (a158a937d864 smack: recognize ipv4 CIPSO w/o categories)
Merging tomoyo/master (834a4a689699 Merge tag 'for-linus' of git://git.kern=
el.org/pub/scm/linux/kernel/git/rdma/rdma)
Merging tpmdd/next (ebaf911ba6e1 char: tpm: tpm-buf: Add sanity check fallb=
ack in read helpers)
Merging watchdog/master (9bc64d338b0b watchdog: sunxi_wdt: Add support for =
Allwinner A523)
Merging iommu/next (44e9f08cac9f Merge branches 'fixes', 'apple/dart', 'med=
iatek', 'renesas/ipmmu', 's390', 'amd/amd-vi' and 'core' into next)
Merging audit/next (654d61b8e0e2 audit: record AUDIT_ANOM_* events regardle=
ss of presence of rules)
Merging devicetree/for-next (10fc30eaf381 docs: dt: Update overlay file ext=
ension)
Merging dt-krzk/for-next (247ed81d323c Merge branch 'next/dt' into for-next)
Merging mailbox/for-next (1ec12fd31ecc mailbox: Remove unneeded semicolon)
Merging spi/for-next (aba9c2fee959 Merge remote-tracking branch 'spi/for-6.=
16' into spi-next)
Merging tip/master (397310f19ee8 Merge branch into tip/master: 'x86/sev')
CONFLICT (content): Merge conflict in arch/x86/Kconfig.assembler
$ git reset --hard HEAD^
Merging next-20250414 version of tip
CONFLICT (content): Merge conflict in arch/x86/Kconfig.assembler
CONFLICT (content): Merge conflict in arch/x86/events/intel/core.c
CONFLICT (content): Merge conflict in arch/x86/kernel/e820.c
[master dff3226767ef] next-20250414/tip
Merging clockevents/timers/drivers/next (0f920690a82c dt-bindings: timer: A=
dd SiFive CLINT2)
Merging edac/edac-for-next (4521b86e4a6e Merge ras/edac-urgent into for-nex=
t)
Merging ftrace/for-next (d85852264728 Merge tools/for-next)
Merging rcu/next (d837bd719040 Merge branches 'rcu/misc-for-6.16', 'rcu/seq=
-counters-for-6.16' and 'rcu/torture-for-6.16' into rcu/for-next)
Merging paulmck/non-rcu/next (c606767a2783 Merge branches 'lkmm.2025.04.22a=
' and 'ratelimit.2025.04.25a' into HEAD)
Merging kvm/next (45eb29140e68 Merge branch 'kvm-fixes-6.15-rc4' into HEAD)
CONFLICT (content): Merge conflict in arch/x86/kvm/vmx/vmx.c
Merging kvm-arm/next (369c0122682c Merge branch 'kvm-arm64/pmu-fixes' into =
kvmarm/next)
Merging kvms390/next (0c7fbae5bc78 KVM: s390: Don't use %pK through debug p=
rinting)
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (b3f263a98d30 RISC-V: KVM: Optimize commen=
ts in kvm_riscv_vcpu_isa_disable_allowed)
Merging kvm-x86/next (661b7ddb2d10 Merge branches 'fixes', 'misc', 'pir', '=
svm' and 'vmx')
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
Merging chrome-platform/for-next (a9635ef0ca12 platform/chrome: cros_ec_typ=
ec: Set Pin Assignment E in DP PORT VDO)
Merging chrome-platform-firmware/for-firmware-next (0af2f6be1b42 Linux 6.15=
-rc1)
Merging hsi/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging leds-lj/for-leds-next (c5b44f3d3b17 leds: turris-omnia: Drop commas=
 in the terminator entries)
Merging ipmi/for-next (37631eee2063 ipmi:si: Move SI type information into =
an info structure)
Merging driver-core/driver-core-next (0e4965c80ef0 Merge tag 'gpiod-devm-is=
-action-added-for-v6.16-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/ker=
nel/git/brgl/linux into driver-core-next)
Merging usb/usb-next (615dca38c2ea Merge 6.15-rc4 into usb-next)
Merging thunderbolt/next (36f6f7e2d4d0 Documentation/admin-guide: Document =
Thunderbolt/USB4 tunneling events)
Merging usb-serial/usb-next (43a23bb0d5bf USB: serial: ti_usb_3410_5052: dr=
op bogus read urb check)
Merging tty/tty-next (689835c00ec7 Merge 6.15-rc4 into tty-next)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/ser=
ial/snps-dw-apb-uart.yaml
Merging char-misc/char-misc-next (4f822ad5ee94 Merge 6.15-rc4 into char-mis=
c-next)
$ git reset --hard HEAD^
Merging next-20250428 version of char-misc
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (5442d22da7db Coresight: Fix a NULL vs IS_ERR() bug =
in probe)
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
Merging spmi/spmi-next (a35fc095fc52 spmi: add a spmi driver for Apple SoC)
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
Merging gpio-brgl/gpio/for-next (d1d52c6622a6 gpiolib: devres: Finish the c=
onversion to use devm_add_action())
Merging gpio-intel/for-next (a02af05f41c7 Merge patch series "gpiolib: acpi=
: Fix missing info filling")
Merging pinctrl/for-next (201a63fba119 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging pinctrl-renesas/renesas-pinctrl (abcdeb4e299a pinctrl: renesas: rza=
2: Fix missing of_node_put() call)
Merging pinctrl-samsung/for-next (0a5b9be31f78 pinctrl: samsung: use new GP=
IO line value setter callbacks)
Merging pwm/pwm/for-next (b6b5683e9692 dt-bindings: pwm: vt8500-pwm: Conver=
t to YAML)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging ktest/for-next (5a1bed232781 ktest: Fix Test Failures Due to Missin=
g LOG_FILE Directories)
Merging kselftest/next (64e11086feb4 selftests/perf_events: Fix spelling mi=
stake "sycnhronize" -> "synchronize")
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
Merging rust-pin-init/pin-init-next (39051adb0704 rust: pin-init: examples:=
 use `allow` instead of `expect`)
Merging rust-timekeeping/timekeeping-next (8ffd015db85f Linux 6.15-rc2)
Merging rust-xarray/xarray-next (1ec985434824 MAINTAINERS: add entry for Ru=
st XArray API)
CONFLICT (content): Merge conflict in rust/bindings/bindings_helper.h
Applying: fix up for conflict against drm-nova
Applying: fixup for conflict with the mm-unstable tree
Merging sysctl/sysctl-next (23b8bacf1547 sysctl: Close test ctl_headers wit=
h a for loop)
Merging execve/for-next/execve (8ffd015db85f Linux 6.15-rc2)
Merging bitmap/bitmap-for-next (1f11411b56ea bitfield: Add FIELD_MODIFY() h=
elper)
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (00d56ff2a584 Revert "hardening: Disable GCC ran=
dstruct for COMPILE_TEST")
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
Merging crc/crc-next (35984c730dea x86/crc: drop "glue" from filenames)
Merging fwctl/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging devsec-tsm/next (152f07b4c292 coco/guest: Move shared guest CC infr=
astructure to drivers/virt/coco/guest/)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)

--Sig_/BzX+gs9erq.pa5p_Z1RRPSM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgQlcMACgkQAVBC80lX
0Gx+YQf/RB7yJJApUO/1LkJI2zrPXEjSq+sVQNvd1dFiQfE86hr4r5obAjNeDSya
u7MpwTElajsWr5pzLAg5rnmake7k5aRBLEEeC8Zna+aLSkMqwwvihvHoewq3Ws2X
uVzpBbCdJRos3A99z63OfnuqedDUrOOJ34Z0w3HAHoJ52dqNu9lRPKa4fT7VGE7o
RFZsshLyQGxWbKdf8XhMNCMlXgPWZIArCaD0jVWD4XQEkjtmwTaubmU6VCDmpT27
3ZYWIM7XnpFT5axEinvCCXjmc/NwehloWvDye6YVOE0umoKcOXXWU79C2PGEGHzJ
guKJlclrmyqoWW5Tx9FMiFA5NPipDg==
=NFeu
-----END PGP SIGNATURE-----

--Sig_/BzX+gs9erq.pa5p_Z1RRPSM--

