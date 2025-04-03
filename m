Return-Path: <linux-next+bounces-6152-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFB0A79BD2
	for <lists+linux-next@lfdr.de>; Thu,  3 Apr 2025 08:13:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19F743AA0E5
	for <lists+linux-next@lfdr.de>; Thu,  3 Apr 2025 06:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 507F719F40B;
	Thu,  3 Apr 2025 06:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GETevmxS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980422E3365;
	Thu,  3 Apr 2025 06:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743660776; cv=none; b=TLiaYoS2drA/f7ImkudmvcahBtwAhF/cyzs5V8eLoxlOzlIFtMNzn3o0ee4pFPS49B22gTovrEqmkI9DGgqgvByhRKptdSB0wXdarkKbWGiyYCK2vJBWCULbhOCuWR8Fq2F6DgPtjXnQo0sznmueHWppPqsEiJBztL+8SQDqIBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743660776; c=relaxed/simple;
	bh=rbPFBQif19MlffqxOO3+95wsBpzjAcuf8ePyU8bUygs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LnATW+RDBOywKAWb/qqpXa04sxyUg+RAoQfl7nlF4TOqZDwxXKUYOOlCLcwtJ+SrdoQnYDilf3SXXjoJ+0xqt9eyYzHFRWw+Vyw1+En66d9OwaUZcngAWn0H+v+jEPF65Wb/q7frhtIquf48k/zf/tcxlupx+YJrRPO1MWz2YTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GETevmxS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743660768;
	bh=1w50heh4GIdFhvR/cKe3qC09sL4oyJoffk0fTOOs8fU=;
	h=Date:From:To:Cc:Subject:From;
	b=GETevmxSKJXYFDOtox2ar/v458uVs8SFv+rIuEoai4pNs9aZLhrnPiEYc89hv5JTR
	 cJh/u/9DIHO+BUDekmjEGI2KH0GZj95I6kUZmT1DAjGGPI05Cx1ziiNw49GnOM03ZF
	 yAi20Ay4GbE7wog4mnESLbm9BLzjI7eII2wOHijcDMk8lYQVBk9hYlqq7AtOL/LP8m
	 qCimC6/tNwfxTiXsgSCnhHZQT1IqJdvDM8mzUYBhPPEp8CWw3rcmVdffpq4d8RZ/XD
	 m81Cvs4lxGBbmI+JP348jdDbsYBUBjXVAG7IrISsl3DvzU/e6a+IM77zXd4Rtsu9Ua
	 dCsN7TaUTQvNA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZSrxr5D5Fz4wbr;
	Thu,  3 Apr 2025 17:12:48 +1100 (AEDT)
Date: Thu, 3 Apr 2025 17:12:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 3
Message-ID: <20250403171248.219e0e61@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rCFFsMaBo1oR74YEs3JZ8+9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/rCFFsMaBo1oR74YEs3JZ8+9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250402:

The kbuild tree still had its build failure for which I reverted a commit.

Non-merge commits (relative to Linus' tree): 1417
 1416 files changed, 38190 insertions(+), 23237 deletions(-)

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

I am currently merging 389 trees (counting Linus' and 147 trees of bug
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
Merging origin/master (0a87d6bb6fd2 Merge tag 'powerpc-6.15-2' of git://git=
.kernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging fixes/fixes (b3c623b9a94f Merge tag 'thermal-6.15-rc1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging ext4-fixes/fixes (4bbf9020becb Linux 6.13-rc4)
Merging vfs-brauner-fixes/vfs.fixes (f70681e9e606 libfs: Fix duplicate dire=
ctory entry in offset_dir_lookup)
Merging fscrypt-current/for-current (2014c95afece Linux 6.14-rc1)
Merging fsverity-current/for-current (2014c95afece Linux 6.14-rc1)
Merging btrfs-fixes/next-fixes (d0dbc6ceb573 Merge branch 'misc-6.15' into =
next-fixes)
Merging vfs-fixes/fixes (00cdfdcfa080 hypfs_create_cpu_files(): add missing=
 check for hypfs_mkdir() failure)
Merging erofs-fixes/fixes (38fec10eb60d Linux 6.14)
Merging nfsd-fixes/nfsd-fixes (26a80762153b NFSD: Add a Kconfig setting to =
enable delegated timestamps)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (228a1157fb9f Merge tag '6.13-rc-part1-SM=
B3-client-fixes' of git://git.samba.org/sfrench/cifs-2.6)
Merging bcachefs/for-next (c152917111a9 bcachefs: bch2_snapshot_table_make_=
room())
Merging fscrypt/for-next (13dc8eb90067 fscrypt: mention init_on_free instea=
d of page poisoning)
Merging btrfs/for-next (50167cf6b29b Merge branch 'for-next-next-v6.15-2025=
0326' into for-next-20250326)
Merging ceph/master (3981be13ec1b ceph: exchange hardcoded value on NAME_MA=
X)
Merging cifs/for-next (bac151c05d1d smb: client: optimize pathname checking)
Merging configfs/for-next (84147f4e84c4 configfs: improve item creation per=
formance)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (03d2b62208a3 dlm: make tcp still work in multi-link env)
Merging erofs/dev (0f24e3c05afe erofs: enable 48-bit layout support)
Merging exfat/dev (c73e680d1f84 exfat: call bh_read in get_block only when =
necessary)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (82b6a8dd857d Merge reverts for HSM page fault events=
.)
Merging ext4/dev (d5e206778e96 ext4: fix OOB read when checking dotdot dir)
Merging f2fs/dev (5c2a430e8599 Merge tag 'ext4-for_linus-6.15-rc1' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4)
Merging fsverity/for-next (a19bcde49998 Revert "fsverity: relax build time =
dependency on CRYPTO_SHA256")
Merging fuse/for-next (2d066800a427 fuse: remove unneeded atomic set in uri=
ng creation)
CONFLICT (content): Merge conflict in fs/fuse/dev_uring.c
Merging gfs2/for-next (10518797ca98 gfs2: move msleep to sleepable context)
Merging jfs/jfs-next (a8dfb2168906 jfs: add index corruption check to DT_GE=
TPAGE())
Merging ksmbd/ksmbd-for-next (c8b5b7c5da7d ksmbd: fix null pointer derefere=
nce in alloc_preauth_hash())
Merging nfs/linux-next (8e5419d6542f nfs: Add missing release on error in n=
fs_lock_and_join_requests())
Merging nfs-anna/linux-next (9084ed79ddaa lsm,nfs: fix memory leak of lsm_c=
ontext)
Merging nfsd/nfsd-next (fe43b5e8b5b6 NFSD: Add experimental setting to disa=
ble the use of splice read)
Merging ntfs3/master (8b12017c1b95 fs/ntfs3: Remove unused ntfs_flush_inode=
s)
Merging orangefs/for-next (121a83ce6fe6 orangefs: Bufmap deadcoding)
Merging overlayfs/overlayfs-next (c8b359dddb41 ovl: Filter invalid inodes w=
ith missing lookup function)
Merging ubifs/next (69146a8c893f ubi: ubi_get_ec_info: Fix compiling error =
'cast specifies array type')
Merging v9fs/9p-next (ad2e2a77dcc7 9p: Use hashtable.h for hash_errmap)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (cdb809a573c4 Merge branch 'xfs-6.15-cleanups' into fo=
r-next)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging vfs-brauner/vfs.all (4f76518956c0 Merge branch 'vfs-6.15.rust' into=
 vfs.all)
CONFLICT (content): Merge conflict in Documentation/filesystems/porting.rst
CONFLICT (content): Merge conflict in tools/testing/selftests/filesystems/o=
verlayfs/set_layers_via_fds.c
Merging vfs/for-next (2e72b1e0aac2 Merge branch 'work.d_revalidate' into fo=
r-next)
Merging mm-hotfixes/mm-hotfixes-unstable (f1e4864ab7df mm/page_alloc: fix d=
eadlock on cpu_hotplug_lock in __accept_page())
Merging fs-current (29693a667af4 Merge branch 'fixes' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging kbuild-current/fixes (80e54e84911a Linux 6.14-rc6)
Merging arc-current/for-curr (78d4f34e2115 Linux 6.13-rc3)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (f7edb07ad7c6 Fix mmu notifiers for rang=
e-based invalidates)
Merging arm-soc-fixes/arm/fixes (45d5fe1c53ba ARM: davinci: da850: fix sele=
cting ARCH_DAVINCI_DA8XX)
Merging davinci-current/davinci/for-current (2014c95afece Linux 6.14-rc1)
Merging drivers-memory-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging sophgo-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging m68k-current/for-linus (c94cf023dce3 m68k: defconfig: Update defcon=
figs for v6.14-rc1)
Merging powerpc-fixes/fixes (eff2eb592efd cxl: Fix cross-reference in docum=
entation and add deprecation warning)
Merging s390-fixes/fixes (38fec10eb60d Linux 6.14)
Merging net/main (acc4d5ff0b61 Merge tag 'net-6.15-rc0' of git://git.kernel=
.org/pub/scm/linux/kernel/git/netdev/net)
Merging bpf/master (0c2623cef4f4 selftests/bpf: Fix verifier_private_stack =
test failure)
Merging ipsec/master (0aae2867aa60 xfrm_output: Force software GSO only in =
tunnel mode)
Merging netfilter/main (4003c9e78778 Merge tag 'net-6.14-rc7' of git://git.=
kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ipvs/main (4003c9e78778 Merge tag 'net-6.14-rc7' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/netdev/net)
Merging wireless/for-next (081b575617e6 Merge tag 'wireless-2025-03-12' of =
https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless)
Merging ath/for-current (3640dbc1f75c wifi: iwlwifi: Fix A-MSDU TSO prepara=
tion)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (6b5e41a8b51f RDMA/hns: Fix wrong value of max_sg=
e_rd)
Merging sound-current/for-linus (02dc9b9617e4 Merge tag 'asoc-fix-v6.15-mer=
ge-window' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound=
 into for-linus)
Merging sound-asoc-fixes/for-linus (3a0f0a4355df Merge remote-tracking bran=
ch 'asoc/for-6.14' into asoc-linus)
Merging regmap-fixes/for-linus (32ffed055dce regmap-irq: Add missing kfree(=
))
Merging regulator-fixes/for-linus (b65439d90150 regulator: rtq2208: Fix the=
 LDO DVS capability)
Merging spi-fixes/for-linus (8ed0ca66eb33 Merge remote-tracking branch 'spi=
/for-6.14' into spi-linus)
Merging pci-current/for-linus (7d06015d936c Merge tag 'pci-v6.15-changes' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci)
Merging driver-core.current/driver-core-linus (92b71befc349 Merge tag 'objt=
ool-urgent-2025-04-01' of git://git.kernel.org/pub/scm/linux/kernel/git/tip=
/tip)
Merging tty.current/tty-linus (0ad2507d5d93 Linux 6.14-rc3)
Merging usb.current/usb-linus (f2865c6300d7 usb: typec: tcpm: fix state tra=
nsition for SNK_WAIT_CAPABILITIES state in run_state_machine())
Merging usb-serial-fixes/usb-linus (4701f33a1070 Linux 6.14-rc7)
Merging phy/fixes (7eb172143d55 Linux 6.14-rc5)
Merging staging.current/staging-linus (2014c95afece Linux 6.14-rc1)
Merging iio-fixes/fixes-togreg (2156789f74ea iio: adc: rockchip: Fix clock =
initialization sequence)
Merging counter-current/counter-current (c0c9c7343466 counter: microchip-tc=
b-capture: Fix undefined counter channel state on probe)
Merging char-misc.current/char-misc-linus (2dc25093218f Merge tag 'counter-=
fixes-for-6.14' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/wbg/c=
ounter into char-misc-linus)
Merging soundwire-fixes/fixes (fcc0f1692362 ASoC: SOF: Intel: Let SND_SOF_S=
OF_HDA_SDW_BPT select SND_HDA_EXT_CORE)
Merging thunderbolt-fixes/fixes (38fec10eb60d Linux 6.14)
Merging input-current/for-linus (fd10709e28d2 MAINTAINERS: Remove myself fr=
om the goodix touchscreen maintainers)
Merging crypto-current/master (9764d5b0cd0e Revert "crypto: testmgr - Add m=
ultibuffer hash testing")
Merging vfio-fixes/for-linus (09dfc8a5f2ce vfio/pci: Fallback huge faults f=
or unaligned pfn)
Merging kselftest-fixes/fixes (2f856325242c selftests: tpm2: test_smoke: us=
e POSIX-conformant expression operator)
Merging dmaengine-fixes/fixes (7eb172143d55 Linux 6.14-rc5)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (1dbf60277e9b Merge tag 'spi-nor/fixes-for-6.14=
-rc4' of https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux into mtd=
/fixes)
Merging mfd-fixes/for-mfd-fixes (68f860426d50 mfd: axp20x: AXP717: Fix miss=
ing IRQ status registers range)
Merging v4l-dvb-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging reset-fixes/reset/fixes (38fec10eb60d Linux 6.14)
Merging mips-fixes/mips-fixes (6d48ad040757 MIPS: Ignore relocs against __e=
x_table for relocatable kernel)
Merging at91-fixes/at91-fixes (2014c95afece Linux 6.14-rc1)
Merging omap-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging kvm-fixes/master (adb9061ecc02 Merge tag 'kvm-s390-next-6.15-1' of =
https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging kvms390-fixes/master (d8dfda5af0be KVM: s390: pv: fix race when mak=
ing a page secure)
Merging hwmon-fixes/hwmon (815f80ad20b6 hwmon: (nct6775-core) Fix out of bo=
unds access for NCT679{8,9})
Merging nvdimm-fixes/libnvdimm-fixes (265e98f72bac acpi: nfit: vmalloc-out-=
of-bounds Read in acpi_nfit_ctl)
Merging cxl-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging dma-mapping-fixes/dma-mapping-fixes (8324993f6030 dma-mapping: fix =
missing clear bdr in check_ram_in_range_map())
Merging drivers-x86-fixes/fixes (1a9239bb4253 Merge tag 'net-next-6.15' of =
git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging samsung-krzk-fixes/fixes (53517a70873c clk: samsung: update PLL loc=
ktime for PLL142XX used on FSD platform)
Merging pinctrl-samsung-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging devicetree-fixes/dt/linus (75f1f311d883 Revert "of: reserved-memory=
: Fix using wrong number of cells to get property 'alignment'")
Merging dt-krzk-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging scsi-fixes/fixes (f27a95845b01 scsi: ufs: core: bsg: Fix crash when=
 arpmb command fails)
Merging drm-fixes/drm-fixes (41e09ef6c26f Merge tag 'amd-drm-fixes-6.14-202=
5-03-20' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (38fec10eb60d Linux 6.14)
Merging mmc-fixes/fixes (723ef0e20dbb mmc: sdhci-brcmstb: add cqhci suspend=
/resume to PM ops)
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
Merging gpio-brgl-fixes/gpio/for-current (5143840cef6b Merge tag 'gpio-upda=
tes-for-v6.15-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/li=
nux)
Merging gpio-intel-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging pinctrl-intel-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging auxdisplay-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging kunit-fixes/kunit-fixes (a64dcfb451e2 Linux 6.14-rc2)
Merging memblock-fixes/fixes (e499d00056a9 memblock: don't release high mem=
ory to page allocator when HIGHMEM is off)
Merging renesas-fixes/fixes (379c590113ce ARM: shmobile: smp: Enforce shmob=
ile_smp_* alignment)
Merging perf-current/perf-tools (35d13f841a3d perf bpf-filter: Fix a parsin=
g error with comma)
Merging efi-fixes/urgent (11092db5b573 efivarfs: fix NULL dereference on re=
sume)
Merging battery-fixes/fixes (98380110bd48 power: supply: axp20x_battery: Fi=
x fault handling for AXP717)
Merging iommufd-fixes/for-rc (2ca704f55e22 iommu/arm-smmu-v3: Improve uAPI =
comment for IOMMU_HW_INFO_TYPE_ARM_SMMUV3)
Merging rust-fixes/rust-fixes (c1f4534b213d scripts: generate_rust_analyzer=
: fix pin-init name in kernel deps)
Merging w1-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging pmdomain-fixes/fixes (ef17b519088e pmdomain: amlogic: fix T7 ISP se=
cpower)
Merging i2c-host-fixes/i2c/i2c-host-fixes (38fec10eb60d Linux 6.14)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (54493279312f Merge tag 'samsung-clk-fixes-6.14=
' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into clk-fi=
xes)
Merging pwrseq-fixes/pwrseq/for-current (2014c95afece Linux 6.14-rc1)
Merging thead-dt-fixes/thead-dt-fixes (40384c840ea1 Linux 6.13-rc1)
Merging ftrace-fixes/ftrace/fixes (2fa6a01345b5 tracing: Fix memory leak wh=
en reading set_event file)
Merging ring-buffer-fixes/ring-buffer/fixes (e4d4b8670c44 ring-buffer: Use =
flush_kernel_vmap_range() over flush_dcache_folio())
Merging trace-fixes/trace/fixes (fc0585c7faa9 rv: Fix missing unlock on dou=
ble nested monitors return path)
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging tip-fixes/tip/urgent (22000aa03ffe Merge branch into tip/master: 'x=
86/urgent')
Merging slab-fixes/slab/for-next-fixes (dfd3df31c9db mm/slab/kvfree_rcu: Sw=
itch to WQ_MEM_RECLAIM wq)
Merging drm-msm-fixes/msm-fixes (73f69c6be2a9 drm/msm/dsi/phy: Do not overw=
ite PHY_CMN_CLK_CFG1 when choosing bitclk source)
Merging uml-fixes/fixes (96178631c3f5 um: convert irq_lock to raw spinlock)
Merging drm-misc-fixes/for-linux-next-fixes (395cc80051f8 drm/virtio: Fix m=
issed dmabuf unpinning in error path of prepare_fb())
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (e20706d5385b mseal sysmap: add arch-support tx=
t)
  7790c9c9265e ("memblock: don't release high memory to page allocator when=
 HIGHMEM is off")
Merging mm-nonmm-stable/mm-nonmm-stable (8b46fdaea819 lib: scatterlist: fix=
 sg_split_phys to preserve original scatterlist offsets)
Merging mm/mm-everything (33e8e7781099 foo)
Merging kbuild/for-next (2c8725c1dca3 rust: kbuild: skip `--remap-path-pref=
ix` for `rustdoc`)
CONFLICT (content): Merge conflict in rust/Makefile
CONFLICT (modify/delete): scripts/tracing/draw_functrace.py deleted in HEAD=
 and modified in kbuild/for-next.  Version kbuild/for-next of scripts/traci=
ng/draw_functrace.py left in tree.
$ git rm -f scripts/tracing/draw_functrace.py
Applying: Revert "modpost: require a MODULE_DESCRIPTION()"
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (35d13f841a3d perf bpf-filter: Fix a parsing e=
rror with comma)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (2014c95afece Linux 6.14-rc1)
Merging asm-generic/master (47a60391ae0e rwonce: fix crash by removing READ=
_ONCE() for unaligned read)
Merging alpha/alpha-next (1523226edda5 alpha: Use str_yes_no() helper in pc=
i_dac_dma_supported())
Merging arm/for-next (623c3015d8c9 ARM: 9445/1: clkdev: Mark some functions=
 with __printf() attribute)
CONFLICT (content): Merge conflict in init/Kconfig
CONFLICT (content): Merge conflict in rust/Makefile
Merging arm64/for-next/core (c28f31deeacd arm64: Don't call NULL in do_comp=
at_alignment_fixup())
Merging arm-perf/for-next/perf (9651f7899cc5 perf/arm_cspmu: Fix missing io=
.h include)
Merging arm-soc/for-next (23a708916ec7 Merge branch 'soc/arm' into for-next)
Merging amlogic/for-next (424e5bc8545b Merge branch 'v6.16/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (00a97a7f66d2 Merge branch 'asahi-soc/=
soc' into asahi-soc/for-next)
Merging aspeed/for-next (bf8f48263c0e Merge remote-tracking branches 'aspee=
d/dt', 'aspeed/drivers', 'aspeed/fixes' and 'nuvoton/dt' into for-next)
Merging at91/at91-next (a8aab30697c5 Merge branch 'at91-dt' into at91-next)
Merging broadcom/next (bdac656f1bb5 Merge branch 'devicetree/fixes' into ne=
xt)
Merging davinci/davinci/for-next (58abc69e479c ARM: dts: ti: davinci: Align=
 GPIO hog name with bindings)
Merging drivers-memory/for-next (90a0fbaac4a5 memory: mtk-smi: Add ostd set=
ting for mt8192)
Merging imx-mxs/for-next (90453dc4dee2 Merge branch 'imx/dt64' into for-nex=
t)
Merging mediatek/for-next (a8a297e8bb3d Merge branch 'v6.14-next/soc' into =
for-next)
Merging mvebu/for-next (ed9c2b28ebef arm64: dts: marvell: Use preferred nod=
e names for "simple-bus")
Merging omap/for-next (ea07a4775df0 ARM: dts: omap4-panda-a4: Add missing m=
odel and compatible properties)
Merging qcom/for-next (b6ae34803e82 Merge branches 'arm32-for-6.15', 'arm64=
-defconfig-for-6.15', 'arm64-fixes-for-6.14', 'arm64-for-6.15', 'clk-fixes-=
for-6.14', 'clk-for-6.15', 'drivers-fixes-for-6.14' and 'drivers-for-6.15' =
into for-next)
Merging renesas/next (3ade232c98a8 Merge branch 'renesas-fixes-for-v6.14' i=
nto renesas-next)
Merging reset/reset/next (c361baf67200 reset: imx: fix incorrect module dev=
ice table)
Merging rockchip/for-next (76728fe54f54 Merge branch 'v6.15-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (f0dbe0d40d08 Merge branch 'next/soc' into fo=
r-next)
Merging scmi/for-linux-next (de80bff15295 Merge branches 'for-next/ffa/fixe=
s' and 'for-next/scmi/fixes' of ssh://gitolite.kernel.org/pub/scm/linux/ker=
nel/git/sudeep.holla/linux into for-linux-next)
Merging sophgo/for-next (f047a9285f9f riscv: sophgo: dts: add cooling maps =
for Milk-V Pioneer)
Merging spacemit/for-next (5b90a3d6092d riscv: dts: spacemit: Add Milk-V Ju=
piter board device tree)
Merging stm32/stm32-next (65954899a157 arm64: dts: st: add stm32mp215f-dk b=
oard support)
Merging sunxi/sunxi/for-next (96b0934c0283 Merge branch 'sunxi/clk-for-6.15=
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
Merging clk/clk-next (e988adcb5dee Merge branches 'clk-allwinner', 'clk-aml=
ogic' and 'clk-qcom' into clk-next)
Merging clk-imx/for-next (06a61b5cb6a8 clk: imx8mp: inform CCF of maximum f=
requency of clocks)
Merging clk-renesas/renesas-clk (e1a098330ef0 clk: renesas: r9a09g047: Add =
clock and reset signals for the TSU IP)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (17ba839c3c6c LoongArch: Update Loongson-3=
 default config file)
Merging m68k/for-next (c94cf023dce3 m68k: defconfig: Update defconfigs for =
v6.14-rc1)
Merging m68knommu/for-next (a7130910b807 m68k: mm: Replace deprecated strnc=
py() with strscpy())
Merging microblaze/next (920354d7818b microblaze: Use of_property_present()=
 for non-boolean properties)
Merging mips/mips-next (855912be0b04 MIPS: config: omega2+, vocore2: enable=
 CLK_MTMIPS)
Merging openrisc/for-next (af83ece87a1e openrisc: Add cacheinfo support)
Merging parisc-hd/for-next (38fec10eb60d Linux 6.14)
Merging powerpc/next (892c4e465c36 docs: Fix references to IBM CAPI (cxl) r=
emoval version)
Merging risc-v/for-next (95c18b7ccdd1 riscv: Add norvc after .option arch i=
n runtime const)
Merging riscv-dt/riscv-dt-for-next (38818f7c9c17 riscv: dts: starfive: jh71=
10-pine64-star64: enable USB 3.0 port)
Merging riscv-soc/riscv-soc-for-next (2014c95afece Linux 6.14-rc1)
Merging s390/for-next (d33d729afcc8 s390/vfio-ap: Fix no AP queue sharing a=
llowed message written to kernel log)
CONFLICT (content): Merge conflict in arch/s390/Makefile
Merging sh/for-next (2014c95afece Linux 6.14-rc1)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (33c9da5dfb18 um: Rewrite the sigio workaround based on ep=
oll and tgkill)
Merging xtensa/xtensa-for-next (3d6d238851df arch: xtensa: defconfig: Drop =
obsolete CONFIG_NET_CLS_TCINDEX)
Merging fs-next (8d9ee39ac898 Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (9554264e302c Merge branch 'for-6.15-printf-attribu=
te' into for-next)
Merging pci/next (7d06015d936c Merge tag 'pci-v6.15-changes' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/pci/pci)
Merging pstore/for-next/pstore (5674609535ba pstore: Change kmsg_bytes stor=
age size to u32)
Merging hid/for-next (160957abbf99 Merge branch 'for-6.15/intel-ish' into f=
or-next)
Merging i2c/i2c/for-next (bec878219183 Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i2c-host/i2c/i2c-host (280deda134db i2c: iproc: Refactor prototype =
and remove redundant error checks)
Merging i3c/i3c/next (bd496a44f041 i3c: Add NULL pointer check in i3c_maste=
r_queue_ibi())
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (2115cbeec8a3 hwmon: emc2305: Use devm_the=
rmal_of_cooling_device_register)
Merging jc_docs/docs-next (323cc36ef68b Merge tag 'chinese-doc-6.15-rc1' of=
 gitolite.kernel.org:pub/scm/linux/kernel/git/alexs/linux into docs-mw)
Merging v4l-dvb/next (90f9ede8f2b3 media: i2c: lt6911uxe: add two selects t=
o Kconfig)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (4a195f6ce235 Merge branch 'pm-cpufreq' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (1efdea051738 cpufreq: sun50i: p=
revent out-of-bounds access)
Merging cpupower/cpupower (fffadbdd6b5a cpupower: Make lib versioning schem=
e more obvious and fix version link)
Merging devfreq/devfreq-next (f3253b23535f PM / devfreq: exynos: remove unu=
sed function parameter)
Merging pmdomain/next (51f0b8911ec4 firmware: thead: add CONFIG_MAILBOX dep=
endency)
Merging opp/opp/linux-next (2014c95afece Linux 6.14-rc1)
Merging thermal/thermal/linux-next (1b4ef46fd666 thermal/drivers/qcom-spmi-=
temp-alarm: Drop unused driver data)
Merging rdma/for-next (37826f0a8c2f IB/mad: Check available slots before po=
sting receive WRs)
Merging net-next/main (acc4d5ff0b61 Merge tag 'net-6.15-rc0' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging bpf-next/for-next (0a87d6bb6fd2 Merge tag 'powerpc-6.15-2' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging ipsec-next/master (399e0aae5aab xfrm: Remove unnecessary NULL check=
 in xfrm_lookup_with_ifid())
Merging mlx5-next/mlx5-next (f550694e88b7 net/mlx5: Add IFC bits for PPCNT =
recovery counters group)
Merging netfilter-next/main (acc4d5ff0b61 Merge tag 'net-6.15-rc0' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ipvs-next/main (71ca3561c268 Merge branch 'mptcp-pm-code-reorganisa=
tion')
Merging bluetooth/master (c00d13bc7c53 Bluetooth: btintel_pcie: Do not gene=
rate coredump for diagnostic events)
Merging wireless-next/for-next (1794d7ab34d2 wifi: mt76: mt7996: fix lockin=
g in mt7996_mac_sta_rc_work())
Merging ath-next/for-next (0e28ee106c46 Merge tag 'ath-next-20250305' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/ath/ath)
Merging wpan-next/master (a5d4d993fac4 dt-bindings: ieee802154: ca8210: Upd=
ate polarity of the reset pin)
Merging wpan-staging/staging (a5d4d993fac4 dt-bindings: ieee802154: ca8210:=
 Update polarity of the reset pin)
Merging mtd/mtd/next (2dd33fc2a81d Merge tag 'nand/for-6.15' into mtd/next)
Merging nand/nand/next (b0e63a0847ee dt-bindings: mtd: gpmi-nand: Add compa=
tible string for i.MX8 chips)
Merging spi-nor/spi-nor/next (eec373688d91 mtd: spi-nor: drop unused <linux=
/of_platform.h>)
Merging crypto/master (99585c2192cb crypto: testmgr - Add multibuffer acomp=
 testing)
Merging drm/drm-next (cf05922d63e2 Merge tag 'drm-intel-gt-next-2025-03-12'=
 of https://gitlab.freedesktop.org/drm/i915/kernel into drm-next)
Merging drm-exynos/for-linux-next (81a50378559b drm/exynos: Remove unnecess=
ary checking)
Merging drm-misc/for-linux-next (85a063b8b281 drm/i2c: tda998x: select CONF=
IG_DRM_KMS_HELPER)
Merging amdgpu/drm-next (dce8bd9137b8 drm/amdgpu/gfx12: fix num_mec)
Merging drm-intel/for-linux-next (af9ec6e4682c drm/i915/display: Fix build =
error without DRM_FBDEV_EMULATION)
Merging drm-msm/msm-next (83ee6d2ec52f dt-bindings: display/msm: dsi-contro=
ller-main: Add missing minItems)
Merging drm-msm-lumag/msm-next-lumag (83ee6d2ec52f dt-bindings: display/msm=
: dsi-controller-main: Add missing minItems)
Merging drm-nova/nova-next (b28786b190d1 gpu: nova-core: add initial docume=
ntation)
Merging drm-xe/drm-xe-next (89f306dc6dfd drm/xe/pmu: Add GT frequency event=
s)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_pc.c
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (38fec10eb60d Linux 6.14)
Merging regmap/for-next (14b33926f576 Merge remote-tracking branch 'regmap/=
for-6.15' into regmap-next)
Merging sound/for-next (02dc9b9617e4 Merge tag 'asoc-fix-v6.15-merge-window=
' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for=
-linus)
Merging ieee1394/for-next (ca2c736554c1 firewire: core: avoid -Wflex-array-=
member-not-at-end warning)
Merging sound-asoc/for-next (3a0f0a4355df Merge remote-tracking branch 'aso=
c/for-6.14' into asoc-linus)
Merging modules/modules-next (897c0b4e2713 MAINTAINERS: Update the MODULE S=
UPPORT section)
Merging input/next (4d395cb071a3 Input: goodix_berlin - add support for Ber=
lin-A series)
Merging block/for-next (7d39d21f7191 Merge branch 'block-6.15' into for-nex=
t)
Merging device-mapper/for-next (9c565428788f dm-ebs: fix prefetch-vs-suspen=
d race)
Merging libata/for-next (565d065acd7e ata: ahci: simplify init function)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (c48e13e83513 mmc: core: Remove redundant null check)
Merging mfd/for-mfd-next (a8d137656861 mfd: cgbc-core: Add support for cong=
a-SA8)
Merging backlight/for-backlight-next (dfc034a0494b backlight: pcf50633-back=
light: Remove unused driver)
Merging battery/for-next (0b8d073f6c66 power: supply: mt6370: Remove redund=
ant 'flush_workqueue()' calls)
Merging regulator/for-next (454d13c5d233 Merge remote-tracking branch 'regu=
lator/for-6.15' into regulator-next)
Merging security/next (65b796acea1e mailmap: map Stephen Smalley's old emai=
l addresses)
Merging apparmor/apparmor-next (3e45553acb14 apparmor: Remove unused variab=
le 'sock' in __file_sock_perm())
Merging integrity/next-integrity (a414016218ca ima: limit the number of ToM=
ToU integrity violations)
Merging selinux/next (a3d3043ef24a selinux: get netif_wildcard policycap fr=
om policy instead of cache)
Merging smack/next (a158a937d864 smack: recognize ipv4 CIPSO w/o categories)
Merging tomoyo/master (08733088b566 Merge tag 'rust-fixes-6.15-merge' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux)
Merging tpmdd/next (980a573621ea tpm: Make chip->{status,cancel,req_cancele=
d} opt)
Merging watchdog/master (9bc64d338b0b watchdog: sunxi_wdt: Add support for =
Allwinner A523)
Merging iommu/next (22df63a23a9e Merge branches 'apple/dart', 'arm/smmu/upd=
ates', 'arm/smmu/bindings', 'rockchip', 's390', 'core', 'intel/vt-d' and 'a=
md/amd-vi' into next)
Merging audit/next (2014c95afece Linux 6.14-rc1)
Merging devicetree/for-next (314655d41e65 scripts/make_fit: Print DT name b=
efore libfdt errors)
Merging dt-krzk/for-next (854a080f0b73 loongarch: dts: remove non-existent =
DAC from 2k1000-ref)
Merging mailbox/for-next (1ec12fd31ecc mailbox: Remove unneeded semicolon)
Merging spi/for-next (8ed0ca66eb33 Merge remote-tracking branch 'spi/for-6.=
14' into spi-linus)
Merging tip/master (d21d649c3da7 Merge branch into tip/master: 'x86/tdx')
Merging clockevents/timers/drivers/next (0f920690a82c dt-bindings: timer: A=
dd SiFive CLINT2)
Merging edac/edac-for-next (ff719e243db5 Merge ras/edac-misc into for-next)
Merging ftrace/for-next (d85852264728 Merge tools/for-next)
Merging rcu/next (1dc1e0b9d694 srcu: Make FORCE_NEED_SRCU_NMI_SAFE depend o=
n RCU_EXPERT)
Merging paulmck/non-rcu/next (87d07e135725 Merge branches 'lkmm.2025.02.25a=
', 'nolibc.2025.03.07a' and 'stop-machine.2025.03.11a' into HEAD)
Merging kvm/next (782f9feaa951 Merge branch 'kvm-pre-tdx' into HEAD)
Merging kvm-arm/next (369c0122682c Merge branch 'kvm-arm64/pmu-fixes' into =
kvmarm/next)
Merging kvms390/next (0c7fbae5bc78 KVM: s390: Don't use %pK through debug p=
rinting)
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (b3f263a98d30 RISC-V: KVM: Optimize commen=
ts in kvm_riscv_vcpu_isa_disable_allowed)
Merging kvm-x86/next (c9ea48bb6ee6 Merge branch 'xen')
Merging xen-tip/linux-next (acb4f33713b9 Merge tag 'm68knommu-for-v6.15' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (1e5f94eb8ef7 Merge branch 'for-6.15' into for-=
next)
Merging sched-ext/for-next (2bac648dab39 tools/sched_ext: Sync with scx rep=
o)
Merging drivers-x86/for-next (1a9239bb4253 Merge tag 'net-next-6.15' of git=
://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging chrome-platform/for-next (9fc83373f0ff platform/chrome: cros_ec_typ=
ec: Add support for setting USB mode via sysfs)
Merging chrome-platform-firmware/for-firmware-next (2014c95afece Linux 6.14=
-rc1)
Merging hsi/for-next (e3f88665a780 HSI: ssi_protocol: Fix use after free vu=
lnerability in ssi_protocol Driver Due to Race Condition)
Merging leds-lj/for-leds-next (161e3bea8fa5 leds: nic78bx: Tidy up ACPI ID =
table)
Merging ipmi/for-next (4701f33a1070 Linux 6.14-rc7)
Merging driver-core/driver-core-next (92b71befc349 Merge tag 'objtool-urgen=
t-2025-04-01' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging usb/usb-next (ed492c95f13a Merge tag 'usb-serial-6.15-rc1' of ssh:/=
/gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-nex=
t)
Merging thunderbolt/next (ad79c278e478 thunderbolt: Do not add non-active N=
VM if NVM upgrade is disabled for retimer)
Merging usb-serial/usb-next (6a7713ec5337 USB: serial: mos7840: drop unused=
 defines)
Merging tty/tty-next (9f8fe348ac95 tty: serial: fsl_lpuart: Fix unused vari=
able 'sport' build warning)
Merging char-misc/char-misc-next (92b71befc349 Merge tag 'objtool-urgent-20=
25-04-01' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (5442d22da7db Coresight: Fix a NULL vs IS_ERR() bug =
in probe)
Merging fastrpc/for-next (2014c95afece Linux 6.14-rc1)
Merging fpga/for-next (e19890a0088b fpga: versal: remove incorrect of_match=
_ptr annotation)
Merging icc/icc-next (4cc004716977 Merge branch 'icc-sm8750' into icc-next)
Merging iio/togreg (8dbeb413806f doc: iio: ad7380: describe offload support)
Merging phy-next/next (f13bff25161b phy: rockchip-naneng-combo: Support rk3=
562)
Merging soundwire/next (08ae0d61c3d7 soundwire: take in count the bandwidth=
 of a prepared stream)
Merging extcon/extcon-next (7041ed0dde83 extcon: Drop explicit initializati=
on of struct i2c_device_id::driver_data to 0)
Merging gnss/gnss-next (0ad2507d5d93 Linux 6.14-rc3)
Merging vfio/next (860be250fc32 vfio/pci: Handle INTx IRQ_NOTCONNECTED)
Merging w1/for-next (33c145297840 w1: w1_therm: w1: Use HWMON_CHANNEL_INFO =
macro to simplify code)
Merging spmi/spmi-next (092c49673431 spmi: Only use Hikey 970 SPMI controll=
er driver when ARM64)
Merging staging/staging-next (3b23d31e569c staging: rtl8723bs: fixed a unne=
cessary parentheses coding style issue)
Merging counter-next/counter-next (ba27a0247b71 counter: microchip-tcb-capt=
ure: Add support for RC Compare)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (656543989457 dmaengine: ptdma: Utilize the AE4DMA e=
ngine's multi-queue functionality)
Merging cgroup/for-next (765962b98e85 Merge branch 'for-6.15-fixes' into fo=
r-next)
Merging scsi/for-next (6cb447cade58 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (20b97acc4caf scsi: ufs: core: Fix a race conditi=
on related to device commands)
CONFLICT (content): Merge conflict in drivers/ufs/core/ufshcd.c
Merging vhost/linux-next (ac34bd6a617c virtio: console: Make resize control=
 event handling compliant with spec)
Merging rpmsg/for-next (63a63c50d2d1 Merge branches 'hwspinlock-next' and '=
rproc-next' into for-next)
Merging gpio-brgl/gpio/for-next (af54a2fbdf45 gpio: TODO: add an item to tr=
ack reworking the sysfs interface)
Merging gpio-intel/for-next (e646f0dae7b0 gpiolib-acpi: Drop unneeded ERR_C=
AST() in __acpi_find_gpio())
Merging pinctrl/for-next (89a32b6bc6bd Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (0ee2261d08aa pinctrl: intel: drop repeated =
config dependency)
Merging pinctrl-renesas/renesas-pinctrl (abcdeb4e299a pinctrl: renesas: rza=
2: Fix missing of_node_put() call)
Merging pinctrl-samsung/for-next (701d0e910955 pinctrl: samsung: add suppor=
t for eint_fltcon_offset)
Merging pwm/pwm/for-next (4fe924e43a5a pwm: fsl-ftm: Handle clk_get_rate() =
returning 0)
Merging ktest/for-next (5a1bed232781 ktest: Fix Test Failures Due to Missin=
g LOG_FILE Directories)
Merging kselftest/next (82ef781f24ac selftests/ftrace: add 'poll' binary to=
 gitignore)
Merging kunit/test (a64dcfb451e2 Linux 6.14-rc2)
Merging kunit-next/kunit (9fbde5d6ad5d kunit: Spelling s/slowm/slow/)
Merging livepatching/for-next (a8e905a819fd Merge branch 'for-6.15/ftrace-t=
est' into for-next)
Merging rtc/rtc-next (424dfcd441f0 rtc: remove 'setdate' test program)
Merging nvdimm/libnvdimm-for-next (ef1d3455bbc1 libnvdimm/labels: Fix divid=
e error in nd_label_data_init())
Merging at24/at24/for-next (f25f405d250f eeprom: at24: Drop of_match_ptr() =
and ACPI_PTR() protections)
Merging ntb/ntb-next (bf8a7ce7e4c7 ntb_hw_amd: Add NTB PCI ID for new gen C=
PU)
Merging seccomp/for-next/seccomp (8f19331384e6 seccomp: avoid the lock trip=
 seccomp_filter_release in common case)
Merging slimbus/for-next (2014c95afece Linux 6.14-rc1)
Merging nvmem/for-next (accd056fc20b dt-bindings: nvmem: Add compatible for=
 MSM8960)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (628cc040b3a2 x86/hyperv: fix an indentation iss=
ue in mshyperv.h)
Merging auxdisplay/for-next (67200d70e459 Merge patch series "auxdisplay: c=
harlcd: Refactor memory allocation")
Merging kgdb/kgdb/for-next (afdbe49276ac kdb: Remove optional size argument=
s from strscpy() calls)
Merging hmm/hmm (403257070602 pds_fwctl: add Documentation entries)
Merging cfi/cfi/next (2014c95afece Linux 6.14-rc1)
Merging mhi/mhi-next (0686a818d77a bus: mhi: host: Fix race between unprepa=
re and queue_buf)
Merging memblock/for-next (98b7beba1ee6 memblock: uniformly initialize all =
reserved pages to MIGRATE_MOVABLE)
Merging cxl/next (aae0594a7053 cxl/region: Fix the first aliased address mi=
scalculation)
CONFLICT (content): Merge conflict in tools/testing/cxl/test/mem.c
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (0dc1754e16b4 efi/libstub: Avoid legacy decompressor zlib/=
zstd wrappers)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (dea2d9221e83 Merge branch 'slab/for-6.15/kfree_=
rcu_tiny' into slab/for-next)
Merging random/master (602c988b7827 prandom: remove next_pseudo_random32)
Merging landlock/next (110faeb679e7 landlock: Remove incorrect warning)
Merging rust/rust-next (e6ea10d5dbe0 Merge tag 'rust-hrtimer-for-v6.15-v3' =
of https://github.com/Rust-for-Linux/linux into rust-next)
Merging rust-alloc/alloc-next (80e54e84911a Linux 6.14-rc6)
Merging rust-hrtimer/hrtimer-next (142d93914b85 rust: hrtimer: add maintain=
er entry)
Merging rust-pin-init/pin-init-next (7eb172143d55 Linux 6.14-rc5)
Merging sysctl/sysctl-next (29fa7d793421 selftests/sysctl: fix wording of h=
elp messages)
Merging execve/for-next/execve (8d68cabeb1ff binfmt_elf_fdpic: fix variable=
 set but not used warning)
Merging bitmap/bitmap-for-next (de305063001d test_bits: add tests for BIT_U=
*())
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (78ab93c78fb3 Merge branch 'for-next/hardening' =
into for-next/kspp)
Merging nolibc/nolibc (a64dcfb451e2 Linux 6.14-rc2)
Merging iommufd/for-next (7be11d34f660 iommufd: Test attach before detachin=
g pasid)
Merging turbostat/next (447c98c1ca4a tools/power turbostat: Add idle govern=
or statistics reporting)
Merging pwrseq/pwrseq/for-next (2014c95afece Linux 6.14-rc1)
Merging capabilities-next/caps-next (4ae89b1fe7c2 capability: Remove unused=
 has_capability)
Merging ipe/next (925df32541da ipe: add errno field to IPE policy load audi=
ting)
Merging kcsan/next (9d89551994a4 Linux 6.13-rc6)
Merging crc/crc-next (17c91f2a4511 lib/crc: remove CONFIG_LIBCRC32C)
Merging powerpc-cxl/topic/cxl (5a0fcb0ef558 cxl: Remove driver)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)

--Sig_/rCFFsMaBo1oR74YEs3JZ8+9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfuJuAACgkQAVBC80lX
0GweYAf/SEh2v54VdI4JlcNxyRoTp+mM2YxBn9iQ85GrhiGXoZfR/EzdGJ3VE0Om
S3YFSjTw1yFWMGJlMy6JTZzWnlmRe5d7xrdeno66N+EL0BwYcQ3Fsp+kaU2Upraj
zQriVQkgj9fhjEoS4WmbVgmPwJ81rugQ7MXBG19K8GVMwN+RhVh6zLjxSpddGYXF
otaldYBn5+lO19zobvyoCFvXHcXfTdOTFcll7QbW+TtuGT1vqZRUvZ/M1SLEY2k5
er+5Um/BQEUL9NRCbmL9mVD/3p0gCzRuCb+25jjMbZRainDzD0sDKLxUQJnGyD22
rPSKxIUpIHikt5hjYmXW/NoO+E7itA==
=nHGH
-----END PGP SIGNATURE-----

--Sig_/rCFFsMaBo1oR74YEs3JZ8+9--

