Return-Path: <linux-next+bounces-4773-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7199C69BF
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 08:16:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31DA3B2375E
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 07:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7646C175D5D;
	Wed, 13 Nov 2024 07:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rSTBT6sk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCAEBA34;
	Wed, 13 Nov 2024 07:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731482172; cv=none; b=WhY8YMQlyU4SxfCbpWp6CTdvYX3LAzNgSJhq96X4alhxzBbeLkFSF96YugqDARZ/JBcmj/VEnJZA4cQS2w0WmemkZ7sxZb2Hu7oBs8KFUQ1pPqYmtIS+wBdoZCRtK6Mlm00Sf1X2hEfk8qlN2O7PGpq5UYeH21YCUyfBU7lHItw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731482172; c=relaxed/simple;
	bh=0rSBHm4uSA42SQi2j8WThbYlNOJN7mFSZWqw1/4vdys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=W+2nyKxVRsO/aPu25cKjzjHS/cyGsC99aFhnqGP9yrfXPq2iQ7lvI3DUY+Y0v+WhndyIZufRs/t+YfNUi8WzFr6GdYZeeBLGeb8sOhTOm6yQGWFeNIqTgFoTt3xfdPF3Rze+2r0yhVYNBpIpOYJTpzAgIQrmKC0UGCKH3iPqJb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rSTBT6sk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731482162;
	bh=V0eVSwjp1MJ729bqyPJO3eb7nPucrVW4o9blaXaDFWI=;
	h=Date:From:To:Cc:Subject:From;
	b=rSTBT6skWDiAzp/OyE83oaF5n37fVXbRnxqzkQq606ePLgQ1W4YYvgDYKztu21gKl
	 edlnyGfV8GsJSghKJtZSUowc+ZYwvtUY4JMfy021BiPBJegGbUEFuvj9Clu2vN0PoQ
	 1i+8+9w1iyho4BDIedFIbSMcDgUJY7QcGClMwblw02QQr8YDxDhN3ssZD8QZqXusGJ
	 3X35Dqj1u0MjH49IMvBNC1OQBzS3utcAM4wCUURwFERTa2MTfkclAI13wW/JJAdoaQ
	 gtMJm+OOtVEmCdhGkG22ZOLcGsoTV3SnpY2VzbQXZR+iNmn/H2WL/7Iu1i5EfBLchV
	 lUTvn98BVz9cQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XpF1s6gMvz4wbR;
	Wed, 13 Nov 2024 18:16:01 +1100 (AEDT)
Date: Wed, 13 Nov 2024 18:16:03 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 13
Message-ID: <20241113181603.4b747541@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+siYw6yzY4_PPkc7419.LaR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+siYw6yzY4_PPkc7419.LaR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20241112:

The arm tree gained a build failure so I used the version from
next-20241112.

The powerpc tree gained a confict against the kbuild tree.

The net-next tree gained a confict against the net tree.

The rtc tree gained a build failure so I used the version from
next-20241113.

The rust tree gained conficts against the ftrace tree.

Non-merge commits (relative to Linus' tree): 10262
 12872 files changed, 466574 insertions(+), 329267 deletions(-)

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

I am currently merging 388 trees (counting Linus' and 149 trees of bug
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
Merging origin/master (3022e9d00ebe Merge tag 'sched_ext-for-6.12-rc7-fixes=
' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext)
Merging fixes/fixes (87d6aab2389e Merge tag 'for_linus' of git://git.kernel=
.org/pub/scm/linux/kernel/git/mst/vhost)
Merging ext4-fixes/fixes (b2ef7a39bcaf ext4: fix FS_IOC_GETFSMAP handling)
Merging vfs-brauner-fixes/vfs.fixes (c749d9b7ebbc iov_iter: fix copy_page_f=
rom_iter_atomic() if KMAP_LOCAL_FORCE_MAP)
Merging fscrypt-current/for-current (8e929cb546ee Linux 6.12-rc3)
Merging fsverity-current/for-current (8e929cb546ee Linux 6.12-rc3)
Merging btrfs-fixes/next-fixes (2d5404caa8c7 Linux 6.12-rc7)
Merging vfs-fixes/fixes (678379e1d4f7 close_range(): fix the logics in desc=
riptor table trimming)
Merging erofs-fixes/fixes (ae54567eaa87 erofs: get rid of kaddr in `struct =
z_erofs_maprecorder`)
Merging nfsd-fixes/nfsd-fixes (bb1fb40f8beb NFSD: Fix READDIR on NFSv3 moun=
ts of ext4 exports)
Merging v9fs-fixes/fixes/next (684a64bf32b6 Merge tag 'nfs-for-6.12-1' of g=
it://git.linux-nfs.org/projects/anna/linux-nfs)
Merging overlayfs-fixes/ovl-fixes (77a28aa47687 ovl: relax WARN_ON in ovl_v=
erify_area())
Merging bcachefs/for-next (7391aa811665 bcachefs: Fix shutdown message)
Merging fscrypt/for-next (8e929cb546ee Linux 6.12-rc3)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (5f1be0369841 Merge branch 'for-next-next-v6.12-2024=
1111' into for-next-20241111)
Merging ceph/master (515f493a1ce5 MAINTAINERS: exclude net/ceph from networ=
king)
Merging cifs/for-next (85885a5990ea smb: During umount, flush any pending l=
ease breaks for cached dirs)
Merging configfs/for-next (4425c1d9b44d configfs: improve item creation per=
formance)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (dfe5a6cc4204 dlm: make add_to_waiters() that it can't fai=
l)
Merging erofs/dev (456ba36533b8 erofs: sunset `struct erofs_workgroup`)
Merging exfat/dev (a1d37a0236e9 exfat: fix file being changed by unaligned =
direct write)
Merging exportfs/exportfs-next (98f7e32f20d2 Linux 6.11)
Merging ext3/for_next (ad55df0d52f6 Merge isofs leak fix.)
Merging ext4/dev (e4765b185abd ext4: use string choices helpers)
Merging f2fs/dev (7b0033dbc483 f2fs: fix race in concurrent f2fs_stop_gc_th=
read)
Merging fsverity/for-next (8e929cb546ee Linux 6.12-rc3)
Merging fuse/for-next (68bfb7eb7f7d fuse: remove pages for requests and exc=
lusively use folios)
Merging gfs2/for-next (b6900ce15191 gfs2: Simplify DLM_LKF_QUECVT use)
Merging jfs/jfs-next (a174706ba4da jfs: add a check to prevent array-index-=
out-of-bounds in dbAdjTree)
Merging ksmbd/ksmbd-for-next (2d5404caa8c7 Linux 6.12-rc7)
Merging nfs/linux-next (8f52caf9d231 Revert "fs: nfs: fix missing refcnt by=
 replacing folio_set_private by folio_attach_private")
Merging nfs-anna/linux-next (867da60d463b nfs: avoid i_lock contention in n=
fs_clear_invalid_mapping)
Merging nfsd/nfsd-next (54220f06a615 nfsd: allow for up to 32 callback sess=
ion slots)
Merging ntfs3/master (bac89bb33d91 fs/ntfs3: Accumulated refactoring change=
s)
Merging orangefs/for-next (96319dacaf15 orangefs: Constify struct kobj_type)
Merging overlayfs/overlayfs-next (b2fceb6bc005 ovl: convert ovl_real_fdget(=
) callers to ovl_real_file())
Merging ubifs/next (92a286e90203 ubi: Fix ubi_init() ubiblock_exit() sectio=
n mismatch)
Merging v9fs/9p-next (be2ca3825372 Revert "fs/9p: simplify iget to remove u=
nnecessary paths")
Merging v9fs-ericvh/ericvh/for-next (684a64bf32b6 Merge tag 'nfs-for-6.12-1=
' of git://git.linux-nfs.org/projects/anna/linux-nfs)
Merging xfs/for-next (59b723cd2adb Linux 6.12-rc6)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging file-locks/locks-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6-=
mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging iversion/iversion-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6=
-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging vfs-brauner/vfs.all (9546bb9b209d Merge branch 'vfs.untorn.writes' =
into vfs.all Signed-off-by: Christian Brauner <brauner@kernel.org>)
CONFLICT (content): Merge conflict in fs/btrfs/file.c
Merging vfs/for-next (d670523a0c97 Merge branch 'work.xattr2' into for-next)
Merging mm-hotfixes/mm-hotfixes-unstable (a40ed295a59d mm, swap: fix alloca=
tion and scanning race with swapoff)
Merging fs-current (217d343c7ea4 Merge branch 'fixes' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/tytso/ext4.git)
Merging kbuild-current/fixes (59b723cd2adb Linux 6.12-rc6)
Merging arc-current/for-curr (9a1a5caeaa6d ARC: build: Use __force to suppr=
ess per-CPU cmpxchg warnings)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (81235ae0c846 arm64: Kconfig: Make SME d=
epend on BROKEN for now)
Merging arm-soc-fixes/arm/fixes (d62c9c5c4cbc Merge tag 'sunxi-fixes-for-6.=
12' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into arm=
/fixes)
Merging davinci-current/davinci/for-current (9852d85ec9d4 Linux 6.12-rc1)
Merging drivers-memory-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging sophgo-fixes/fixes (d99913e1b80b riscv: dts: Replace deprecated snp=
s,nr-gpios property for snps,dw-apb-gpio-port devices)
Merging m68k-current/for-linus (b90fae5df917 m68k: defconfig: Update defcon=
figs for v6.11-rc1)
Merging powerpc-fixes/fixes (a373830f96db KVM: PPC: Book3S HV: Mask off LPC=
R_MER for a vCPU before running it to avoid spurious interrupts)
Merging s390-fixes/fixes (b4fa00fd428b s390: Update defconfigs)
Merging net/main (20bbe5b80249 Merge branch 'virtio-vsock-fix-memory-leaks')
Merging bpf/master (fb86c42a2a5d bpf: Fix mismatched RCU unlock flavour in =
bpf_out_neigh_v6)
Merging ipsec/master (94c11e852955 usb: add support for new USB device ID 0=
x17EF:0x3098 for the r8152 driver)
Merging netfilter/main (c03d278fdf35 netfilter: nf_tables: wait for rcu gra=
ce period on net_device removal)
Merging ipvs/main (c03d278fdf35 netfilter: nf_tables: wait for rcu grace pe=
riod on net_device removal)
Merging wireless/for-next (c05c62850a8f Merge tag 'wireless-2024-10-29' of =
https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless)
Merging ath/for-current (c05c62850a8f Merge tag 'wireless-2024-10-29' of ht=
tps://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless)
Merging wpan/master (09573b1cc76e net: ieee802154: mcr20a: Use IRQF_NO_AUTO=
EN flag in request_irq())
Merging rdma-fixes/for-rc (aceee63a3aba RDMA/bnxt_re: Remove some dead code)
Merging sound-current/for-linus (fa59caa78598 Merge tag 'asoc-fix-v6.12-rc6=
' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for=
-linus)
Merging sound-asoc-fixes/for-linus (d859923faeca ASoC: intel: sof_sdw: add =
quirk for Dell SKU)
Merging regmap-fixes/for-linus (8cf0b93919e1 Linux 6.12-rc2)
Merging regulator-fixes/for-linus (5e53e4a66bc7 regulator: rk808: Add apply=
_bit for BUCK3 on RK809)
Merging spi-fixes/for-linus (ebdcba2126a8 MAINTAINERS: update AMD SPI maint=
ainer)
Merging pci-current/for-linus (f3c3ccc4fe49 PCI: Fix pci_enable_acs() suppo=
rt for the ACS quirks)
Merging driver-core.current/driver-core-linus (59b723cd2adb Linux 6.12-rc6)
Merging tty.current/tty-linus (42f7652d3eb5 Linux 6.12-rc4)
Merging usb.current/usb-linus (742afcc22d8e Merge tag 'usb-serial-6.12-rc7'=
 of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial int=
o usb-linus)
Merging usb-serial-fixes/usb-linus (2d5404caa8c7 Linux 6.12-rc7)
Merging phy/fixes (59b723cd2adb Linux 6.12-rc6)
Merging staging.current/staging-linus (807babf69027 staging: vchiq_arm: Use=
 devm_kzalloc() for drv_mgmt allocation)
Merging iio-fixes/fixes-togreg (64612ec9b909 iio: adc: ad7124: Disable all =
channels at probe time)
Merging counter-current/counter-current (1437d9f1c56f counter: ti-ecap-capt=
ure: Add check for clk_enable())
Merging char-misc.current/char-misc-linus (59b723cd2adb Linux 6.12-rc6)
Merging soundwire-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging thunderbolt-fixes/fixes (2d5404caa8c7 Linux 6.12-rc7)
Merging input-current/for-linus (5c822c0ce5cc Input: cs40l50 - fix wrong us=
age of INIT_WORK())
Merging crypto-current/master (dd41b283ef2f crypto: mips/crc32 - fix the CR=
C32C implementation)
Merging vfio-fixes/for-linus (5a88a3f67e37 vfio/pci: Init the count variabl=
e in collecting hot-reset devices)
Merging kselftest-fixes/fixes (dc1308bee1ed selftests/watchdog-test: Fix sy=
stem accidentally reset after watchdog-test)
Merging dmaengine-fixes/fixes (59b723cd2adb Linux 6.12-rc6)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging mfd-fixes/for-mfd-fixes (68f860426d50 mfd: axp20x: AXP717: Fix miss=
ing IRQ status registers range)
Merging v4l-dvb-fixes/fixes (702a47ce6dde media: videobuf2-core: copy vb pl=
anes unconditionally)
Merging reset-fixes/reset/fixes (2cf596636607 reset: starfive: jh71x0: Fix =
accessing the empty member on JH7110 SoC)
Merging mips-fixes/mips-fixes (819837584309 Linux 6.12-rc5)
Merging at91-fixes/at91-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging omap-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging kvm-fixes/master (5b47f5a72574 Documentation: kvm: reorganize intro=
duction)
Merging kvms390-fixes/master (cff59d8631e1 s390/uv: Panic for set and remov=
e shared access UVC errors)
Merging hwmon-fixes/hwmon (2d5404caa8c7 Linux 6.12-rc7)
Merging nvdimm-fixes/libnvdimm-fixes (d5240fa65db0 nvdimm/pmem: Set dax fla=
g for all 'PFN_MAP' cases)
Merging cxl-fixes/fixes (3a2b97b3210b cxl/test: Improve init-order fidelity=
 relative to real-world systems)
Merging dma-mapping-fixes/for-linus (78b2770c935f dma-mapping: fix tracing =
dma_alloc/free with vmalloc'd memory)
Merging drivers-x86-fixes/fixes (1be765b29257 platform/x86: thinkpad_acpi: =
Fix for ThinkPad's with ECFW showing incorrect fan speed)
Merging samsung-krzk-fixes/fixes (a03c246d4ec8 clk: samsung: Fix out-of-bou=
nd access of of_match_node())
Merging pinctrl-samsung-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging devicetree-fixes/dt/linus (6e0391e48cf9 of: Skip kunit tests when a=
rm64+ACPI doesn't populate root node)
Merging dt-krzk-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging scsi-fixes/fixes (54c814c8b23b scsi: ufs: core: Start the RTC updat=
e work later)
Merging drm-fixes/drm-fixes (2d5404caa8c7 Linux 6.12-rc7)
Merging drm-intel-fixes/for-linux-next-fixes (67e023b93d69 drm/i915: Grab i=
ntel_display from the encoder to avoid potential oopsies)
Merging mmc-fixes/fixes (1635e407a4a6 Revert "mmc: dw_mmc: Fix IDMAC operat=
ion with pages bigger than 4K")
Merging rtc-fixes/rtc-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging gnss-fixes/gnss-linus (8e929cb546ee Linux 6.12-rc3)
Merging hyperv-fixes/hyperv-fixes (895384881ec9 hv: vmbus: Constify struct =
kobj_type and struct attribute_group)
Merging risc-v-fixes/fixes (5f153a692bac Merge commit 'bf40167d54d5' into f=
ixes)
Merging riscv-dt-fixes/riscv-dt-fixes (8e929cb546ee Linux 6.12-rc3)
Merging riscv-soc-fixes/riscv-soc-fixes (384f2024e1a1 MAINTAINERS: invert M=
isc RISC-V SoC Support's pattern)
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (de2f378f2b77 Merge tag 'nfsd-6.12-4' of git://git.=
kernel.org/pub/scm/linux/kernel/git/cel/linux)
Merging gpio-brgl-fixes/gpio/for-current (59b723cd2adb Linux 6.12-rc6)
Merging gpio-intel-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging pinctrl-intel-fixes/fixes (2d5404caa8c7 Linux 6.12-rc7)
Merging auxdisplay-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging kunit-fixes/kunit-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging memblock-fixes/fixes (8043832e2a12 memblock: use numa_valid_node() =
helper to check for invalid node ID)
Merging renesas-fixes/fixes (124f4f1a1869 MAINTAINERS: Re-add cancelled Ren=
esas driver sections)
Merging perf-current/perf-tools (a5384c426744 perf cap: Add __NR_capget to =
arch/x86 unistd)
Merging efi-fixes/urgent (ae835a96d72c x86/efistub: Revert to heap allocate=
d boot_params for PE entrypoint)
Merging zstd-fixes/zstd-linus (77618db34645 zstd: Fix array-index-out-of-bo=
unds UBSAN warning)
Merging battery-fixes/fixes (7c626ce4bae1 Linux 6.11-rc3)
Merging iommufd-fixes/for-rc (9852d85ec9d4 Linux 6.12-rc1)
Merging rust-fixes/rust-fixes (2313ab74c300 cfi: tweak llvm version for HAV=
E_CFI_ICALL_NORMALIZE_INTEGERS)
Merging w1-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging pmdomain-fixes/fixes (d2fab3fc27cb mailbox: qcom-cpucp: Mark the ir=
q with IRQF_NO_SUSPEND flag)
Merging i2c-host-fixes/i2c/i2c-host-fixes (8de3e97f3d3d i2c: designware: do=
 not hold SCL low when I2C_DYNAMIC_TAR_UPDATE is not set)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (714398d8742d Merge tag 'qcom-clk-fixes-for-6.1=
2' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into clk-f=
ixes)
Merging pwrseq-fixes/pwrseq/for-current (9852d85ec9d4 Linux 6.12-rc1)
Merging thead-dt-fixes/thead-dt-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging ftrace-fixes/ftrace/fixes (fae4078c289a fgraph: Allocate ret_stack_=
list with proper size)
Merging ring-buffer-fixes/ring-buffer/fixes (09661f75e75c ring-buffer: Fix =
reader locking when changing the sub buffer order)
Merging trace-fixes/trace/fixes (2a13ca2e8abb tracing/hwlat: Fix a race dur=
ing cpuhp processing)
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (819837584309 Linux 6.12-rc5)
Merging tip-fixes/tip/urgent (486869edd7c8 Merge branch into tip/master: 'x=
86/urgent')
Merging slab-fixes/slab/for-next-fixes (9c9201afebea mm/slab: fix warning c=
aused by duplicate kmem_cache creation in kmem_buckets_create)
Merging drm-misc-fixes/for-linux-next-fixes (14062c267f09 Merge drm/drm-fix=
es into drm-misc-fixes)
Merging mm-stable/mm-stable (9b5c87d47949 mm: mmap_lock: check trace_mmap_l=
ock_$type_enabled() instead of regcount)
Merging mm-nonmm-stable/mm-nonmm-stable (45dac1959bbd kernel/reboot: replac=
e sprintf() with sysfs_emit())
Merging mm/mm-everything (24fd0471b547 foo)
Merging kbuild/for-next (06513ddaf77b kbuild: allow to start building exter=
nal modules in any directory)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (ddbfb6f20c1b perf build: Remove PERF_HAVE_DWA=
RF_REGS)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/for-next (d5bbfbad58ec dma-mapping: fix swapped dir/fla=
gs arguments to trace_dma_alloc_sgt_err)
Merging asm-generic/master (0af8e32343f8 empty include/asm-generic/vga.h)
CONFLICT (content): Merge conflict in lib/Makefile
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (315cfa0efa30 Merge branches 'fixes' and 'misc' into f=
or-next)
$ git reset --hard HEAD^
Merging next-20241112 version of arm
Merging arm64/for-next/core (6f72ad2cb804 Merge branch 'for-next/pkey-signa=
l' into for-next/core)
CONFLICT (content): Merge conflict in arch/arm64/include/asm/mman.h
CONFLICT (content): Merge conflict in arch/arm64/mm/pageattr.c
CONFLICT (content): Merge conflict in include/linux/mm.h
Merging arm-perf/for-next/perf (845fd2cbedaf perf: Switch back to struct pl=
atform_driver::remove())
Merging arm-soc/for-next (442dc67c98b3 soc: document merges)
Merging amlogic/for-next (171aa289a6fe Merge branch 'v6.13/arm-dt' into for=
-next)
Merging asahi-soc/asahi-soc/for-next (ffc253263a13 Linux 6.6)
Merging aspeed/for-next (2eff056a229e ARM: dts: aspeed: Blueridge and Fuji:=
 Fix LED node names)
Merging at91/at91-next (44339d0de195 Merge branch 'at91-dt' into at91-next)
Merging broadcom/next (f8078d7ae62b Merge branch 'soc/next' into next)
Merging davinci/davinci/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging drivers-memory/for-next (1f1d847a6575 arm64: defconfig: Update defc=
onfig with now user-visible CONFIG_FSL_IFC)
Merging imx-mxs/for-next (6451378c2735 Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (3102ce10f311 Merge branch 'v6.12-next/dts64' int=
o for-next)
Merging mvebu/for-next (5f55ff35bfaa Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (1aedd4a93c6c Merge branch 'omap-for-v6.13/drivers' i=
nto tmp/omap-next-20241104.135423)
Merging qcom/for-next (30eb6f0b08b1 Merge branches 'arm32-for-6.13', 'arm64=
-defconfig-for-6.13', 'arm64-fixes-for-6.12', 'arm64-for-6.13', 'clk-fixes-=
for-6.12', 'clk-for-6.13', 'drivers-fixes-for-6.12' and 'drivers-for-6.13' =
into for-next)
Merging renesas/next (96a483856323 Merge branch 'renesas-fixes-for-v6.12' i=
nto renesas-next)
Merging reset/reset/next (cf3e10cc0e88 misc: lan966x_pci: Fix dtc warn 'Mis=
sing interrupt-parent')
Merging rockchip/for-next (41286036c994 Merge branch 'v6.12-armsoc/dtsfixes=
' into for-next)
Merging samsung-krzk/for-next (59a22cf03f67 Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (7aaa234c5ac6 Merge tag 'scmi-updates-6.13' of =
ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into =
for-linux-next)
Merging sophgo/for-next (b5cf65cc0fd0 riscv: dts: sophgo: Add emmc support =
for Huashan Pi)
Merging spacemit/for-next (819837584309 Linux 6.12-rc5)
Merging stm32/stm32-next (b0191a5cbc22 arm64: dts: st: add DMA support on S=
PI instances of stm32mp25)
Merging sunxi/sunxi/for-next (f13fea5381e2 Merge branches 'sunxi/dt-for-6.1=
3' and 'sunxi/clk-for-6.13' into sunxi/for-next)
Merging tee/next (9852d85ec9d4 Linux 6.12-rc1)
Merging tegra/for-next (2a4425682b6f Merge branch for-6.13/arm64/dt into fo=
r-next)
Merging thead-dt/thead-dt-for-next (7e756671a664 riscv: dts: thead: Add TH1=
520 ethernet nodes)
Merging ti/ti-next (6eaad8fca267 Merge branch 'ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (0e355cb69e19 Merge branch 'zynq/soc' into for-next)
Merging clk/clk-next (118f0dcf6420 Merge branch 'clk-allwinner' into clk-ne=
xt)
Merging clk-imx/for-next (81a206d736c1 clk: imx: imx8-acm: Fix return value=
 check in clk_imx_acm_attach_pm_domains())
Merging clk-renesas/renesas-clk (3b42450ce177 clk: renesas: vbattb: Add VBA=
TTB clock driver)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (f7cc7a98fb71 Merge branch 'loongarch-kvm'=
 into loongarch-next)
Merging m68k/for-next (647619b6bd27 m68k: defconfig: Update defconfigs for =
v6.12-rc1)
Merging m68knommu/for-next (63a24cf8cc33 m68k: coldfire/device.c: only buil=
d FEC when HW macros are defined)
Merging microblaze/next (01a9664e0d9f microblaze: Remove empty #ifndef __AS=
SEMBLY__ statement)
Merging mips/mips-next (56131e6d1fcc mips: dts: realtek: Add I2C controller=
s)
Merging openrisc/for-next (4dc70e1aadfa openrisc: Move FPU state out of pt_=
regs)
Merging parisc-hd/for-next (98f7e32f20d2 Linux 6.11)
Merging powerpc/next (5b881c1f8379 powerpc/irq: use seq_put_decimal_ull_wid=
th() for decimal values)
CONFLICT (content): Merge conflict in arch/powerpc/Makefile
Merging risc-v/for-next (075fde581896 Merge patch series "riscv: Userspace =
pointer masking and tagged address ABI")
Merging riscv-dt/riscv-dt-for-next (c8b72c301dbe riscv: dts: starfive: add =
DeepComputing FML13V01 board device tree)
Merging riscv-soc/riscv-soc-for-next (8400291e289e Linux 6.11-rc1)
Merging s390/for-next (17502bfdbc9d Merge branch 'features' into for-next)
CONFLICT (content): Merge conflict in arch/s390/include/asm/set_memory.h
CONFLICT (content): Merge conflict in arch/s390/mm/pageattr.c
Merging sh/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging sparc/for-next (d21dffe51baa arch/sparc: remove unused varible padd=
rbase in function leon_swprobe())
Merging uml/next (2f681ba4b352 um: move thread info into task)
Merging xtensa/xtensa-for-next (43a611dc43e4 xtensa: annotate dtb_start var=
iable as static __initdata)
Merging fs-next (75a17e2c68b9 Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (bae28081440e Merge branch 'for-6.13-force-console'=
 into for-next)
Merging pci/next (ddbf8b2f0c40 Merge branch 'pci/typos')
Merging pstore/for-next/pstore (1bf8012fc699 pstore: replace spinlock_t by =
raw_spinlock_t)
Merging hid/for-next (9666e3c213de Merge branch 'for-6.12/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (0aca927d20d2 Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i2c-host/i2c/i2c-host (c5eb94dd4011 i2c: Add driver for the RTL9300=
 I2C controller)
Merging i3c/i3c/next (25bc99be5fe5 i3c: master: svc: Modify enabled_events =
bit 7:0 to act as IBI enable counter)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (c40655e33106 hwmon: (tmp108) Add support =
for I3C device)
Merging jc_docs/docs-next (623e5747c680 docs: fix typos and whitespace in D=
ocumentation/process/backporting.rst)
Merging v4l-dvb/next (5516200c466f Merge tag 'v6.12-rc7' into __tmp-hansg-l=
inux-tags_media_atomisp_6_13_1)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (2440ea1f52c4 Merge branch 'pm-cpuidle' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (078d2f22567f cpufreq: sun50i: a=
dd a100 cpufreq support)
Merging cpupower/cpupower (47d7650b9cb1 cpupower: add checks for xgettext a=
nd msgfmt)
Merging devfreq/devfreq-next (d47552124bb0 PM / devfreq: imx-bus: Use of_pr=
operty_present())
Merging pmdomain/next (5812b95b7ff4 pmdomain: Merge branch fixes into next)
Merging opp/opp/linux-next (53205a790366 dt-bindings: opp: operating-points=
-v2-ti-cpu: Describe opp-supported-hw)
Merging thermal/thermal/linux-next (7d8abc5f3b5c thermal/drivers/imx_sc_the=
rmal: Use dev_err_probe)
Merging rdma/for-next (6b526d17eed8 RDMA/hns: Fix NULL pointer derefernce i=
n hns_roce_map_mr_sg())
Merging net-next/main (a58f00ed24b8 net: sched: cls_api: improve the error =
message for ID allocation failure)
CONFLICT (content): Merge conflict in MAINTAINERS
CONFLICT (content): Merge conflict in tools/testing/selftests/net/.gitignore
Merging bpf-next/for-next (3e3a6e2df3a3 Merge branch 'bpf-next/master' into=
 for-next)
Merging ipsec-next/master (af2c4fa55972 Merge branch 'xfrm: Convert __xfrm4=
_dst_lookup() and its callers to dscp_t.')
Merging mlx5-next/mlx5-next (8ab3138a9b2d net/mlx5: Introduce data placemen=
t ordering bits)
Merging netfilter-next/main (544070db6c8b Merge branch 'mlx5-esw-qos-refact=
or-and-shampo-cleanup')
Merging ipvs-next/main (17bcfe66376c Merge tag 'nf-next-24-11-07' of git://=
git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next)
Merging bluetooth/master (e88b020190bf Bluetooth: btintel: Direct exception=
 event to bluetooth stack)
CONFLICT (content): Merge conflict in net/bluetooth/iso.c
CONFLICT (content): Merge conflict in net/bluetooth/sco.c
Merging wireless-next/for-next (11597043d748 Revert "wifi: iwlegacy: do not=
 skip frames with bad FCS")
Merging ath-next/for-next (78e154d42f2c wifi: ath11k: Fix unexpected return=
 buffer manager error for WCN6750/WCN6855)
Merging wpan-next/master (aad4b41a3419 Documentation: ieee802154: fix gramm=
ar)
Merging wpan-staging/staging (aad4b41a3419 Documentation: ieee802154: fix g=
rammar)
Merging mtd/mtd/next (f8470006c4d6 mtd: Switch back to struct platform_driv=
er::remove())
Merging nand/nand/next (af264e598905 mtd: spinand: Constify struct nand_ecc=
_engine_ops)
Merging spi-nor/spi-nor/next (98d1fb94ce75 mtd: spi-nor: core: replace dumm=
y buswidth from addr to data)
Merging crypto/master (35b2237f27c3 hwrng: bcm74110 - Add Broadcom BCM74110=
 RNG driver)
Merging drm/drm-next (56b70bf9ec46 Merge tag 'drm-misc-next-2024-11-08' of =
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/gma500/Kconfig
CONFLICT (content): Merge conflict in drivers/gpu/drm/qxl/Kconfig
CONFLICT (content): Merge conflict in drivers/gpu/drm/tiny/bochs.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_gt_ccs_mode.c
CONFLICT (content): Merge conflict in include/drm/intel/pciids.h
Merging drm-exynos/for-linux-next (086ed1d51544 Merge tag 'exynos-drm-next-=
for-v6.13' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exy=
nos into drm-next)
Merging drm-misc/for-linux-next (17558f97fe62 gpu: drm: replace of_graph_ge=
t_next_endpoint())
Merging amdgpu/drm-next (447a54a0f79c drm/amd: Fix initialization mistake f=
or NBIO 7.7.0)
Merging drm-intel/for-linux-next (56b70bf9ec46 Merge tag 'drm-misc-next-202=
4-11-08' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next)
Merging drm-msm/msm-next (86313a9cd152 drm/msm/dpu: rework documentation co=
mments)
Merging drm-msm-lumag/msm-next-lumag (86313a9cd152 drm/msm/dpu: rework docu=
mentation comments)
Merging drm-xe/drm-xe-next (7d4d1c54c40e drm/xe/guc: Support crash dump not=
ification from GuC)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_ct.c
Merging etnaviv/etnaviv/next (2c7ac7dd1b6c drm/etnaviv: etnaviv_cmdbuf.c: D=
rop the unneeded include of drm_mm.h)
Merging fbdev/for-next (819837584309 Linux 6.12-rc5)
Merging regmap/for-next (d1f4390dd28b regmap: provide regmap_assign_bits())
Merging sound/for-next (eab936aa8500 ALSA: ump: remove unnecessary check on=
 blk)
Merging ieee1394/for-next (b7688fcde3cf firewire: ohci: Replace deprecated =
PCI functions)
Merging sound-asoc/for-next (90c4f99ad127 Merge remote-tracking branch 'aso=
c/for-6.13' into asoc-next)
Merging modules/modules-next (2466b3120142 tests/module/gen_test_kallsyms.s=
h: use 0 value for variables)
Merging input/next (bed0f75909b2 Input: i8042 - fix typo dublicate to dupli=
cate)
Merging block/for-next (c6cf70b437c1 Merge branch 'for-6.13/block' into for=
-next)
Merging device-mapper/for-next (7aa197c2e3bd dm thin: Add missing destroy_w=
ork_on_stack())
Merging libata/for-next (e8a2389ea808 dt-bindings: ata: ahci-platform: add =
missing iommus property)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (c0baf6ead75d mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (8ece9d248b85 dt-bindings: mfd: bd71828: Use charg=
er resistor in mOhm instead of MOhm)
Merging backlight/for-backlight-next (3adec6f907b6 MAINTAINERS: Use Daniel =
Thompson's korg address for Backlight work)
Merging battery/for-next (05d9044177c3 dt-bindings: power: reset: Convert m=
ode-.* properties to array)
Merging regulator/for-next (e18da71634d1 Merge remote-tracking branch 'regu=
lator/for-6.13' into regulator-next)
Merging security/next (0554c22185fb Automated merge of 'dev' into 'next')
CONFLICT (content): Merge conflict in kernel/auditsc.c
Merging apparmor/apparmor-next (8c4f7960ae8a apparmor: replace misleading '=
scrubbing environment' phrase in debug print)
Merging integrity/next-integrity (08ae3e5f5fc8 integrity: Use static_assert=
() to check struct sizes)
Merging selinux/next (d7b6918e22c7 selinux: Deprecate /sys/fs/selinux/user)
Merging smack/next (2749749afa07 smackfs: Use rcu_assign_pointer() to ensur=
e safe assignment in smk_set_cipso)
Merging tomoyo/master (ada1986d0797 tomoyo: fallback to realpath if symlink=
's pathname does not exist)
Merging tpmdd/next (58e09c1d3172 tpm: atmel: Drop PPC64 specific MMIO setup)
Merging watchdog/master (a5cb13980e00 watchdog: s3c2410_wdt: add support fo=
r exynosautov920 SoC)
Merging iommu/next (711ca1352406 Merge branches 'intel/vt-d', 'amd/amd-vi' =
and 'iommufd/arm-smmuv3-nested' into next)
Merging audit/next (89282beaf75d audit: Use str_yes_no() helper function)
Merging devicetree/for-next (919e0dd4118e dt-bindings: interrupt-controller=
: qcom,pdc: Add SAR2130P compatible)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/cac=
he/qcom,llcc.yaml
Merging dt-krzk/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging mailbox/for-next (54595f2807d2 mailbox, remoteproc: omap2+: fix com=
pile testing)
Merging spi/for-next (38408d27f529 Merge remote-tracking branch 'spi/for-6.=
13' into spi-next)
Merging tip/master (be42adbe196a Merge branch into tip/master: 'x86/tdx')
CONFLICT (content): Merge conflict in kernel/time/timekeeping.c
CONFLICT (content): Merge conflict in tools/objtool/check.c
Applying: fix up for "hrtimers: Delete hrtimer_init_sleeper_on_stack()"
Merging clockevents/timers/drivers/next (57cbfd333c9d clocksource/drivers/r=
alink: Add Ralink System Tick Counter driver)
Merging edac/edac-for-next (21c093a1626a Merge branch 'edac-drivers' into e=
dac-for-next)
Merging ftrace/for-next (bd5b7e3a21ee Merge tools/for-next)
CONFLICT (content): Merge conflict in rust/helpers/helpers.c
Applying: fix up for "ftrace: Make ftrace_regs abstract from direct use"
Merging rcu/next (3d8269244e31 Merge branches 'rcu/fixes', 'rcu/nocb', 'rcu=
/torture', 'rcu/stall' and 'rcu/srcu' into rcu/dev)
Merging paulmck/non-rcu/next (55468927226f Merge branches 'csd-lock.2024.10=
.11a', 'lkmm.2024.11.09a' and 'scftorture.2024.11.09a', tag 'nolibc.2024.11=
.01a' into HEAD)
Merging kvm/next (185e02d61e99 Merge tag 'kvm-s390-next-6.13-1' of https://=
git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
CONFLICT (content): Merge conflict in arch/arm64/kvm/guest.c
Merging kvm-arm/next (60ad25e14ab5 KVM: arm64: Pass on SVE mapping failures)
CONFLICT (content): Merge conflict in arch/arm64/tools/sysreg
Merging kvms390/next (7a1f3143377a KVM: s390: selftests: Add regression tes=
ts for PFCR subfunctions)
Merging kvm-ppc/topic/ppc-kvm (96e266e3bcd6 KVM: PPC: Book3S HV: Add Power1=
1 capability support for Nested PAPR guests)
Merging kvm-riscv/riscv_kvm_next (332fa4a802b1 riscv: kvm: Fix out-of-bound=
s array access)
Merging kvm-x86/next (c55f6b8a2441 Merge branch 'vmx')
Merging xen-tip/linux-next (5c6808d1a9dd x86/pvh: Avoid absolute symbol ref=
erences in .head.text)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (581434654e01 workqueue: Adjust WQ_MAX_ACTIVE f=
rom 512 to 2048)
Merging sched-ext/for-next (e39cb85a9bcf Merge branch 'for-6.13' into for-n=
ext)
Merging drivers-x86/for-next (06f876def346 platform/x86: x86-android-tablet=
s: Add support for Vexia EDU ATLA 10 tablet)
Merging chrome-platform/for-next (ea45f3f46734 platform/chrome: Switch back=
 to struct platform_driver::remove())
Merging chrome-platform-firmware/for-firmware-next (32b0901e141f firmware: =
google: Unregister driver_info on failure)
Merging hsi/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging leds-lj/for-leds-next (e8501858035b leds: ss4200: Fix the wrong for=
mat specifier for 'blinking')
Merging ipmi/for-next (7868b3a94045 char:ipmi: Fix the wrong format specifi=
er)
Merging driver-core/driver-core-next (2d038efcb4b3 cacheinfo: Use of_proper=
ty_present() for non-boolean properties)
CONFLICT (modify/delete): drivers/platform/x86/amd/hsmp.c deleted in HEAD a=
nd modified in driver-core/driver-core-next.  Version driver-core/driver-co=
re-next of drivers/platform/x86/amd/hsmp.c left in tree.
$ git rm -f drivers/platform/x86/amd/hsmp.c
Applying: fix up for "sysfs: treewide: constify attribute callback of bin_i=
s_visible()"
Applying: another fix for "sysfs: treewide: constify attribute callback of =
bin_is_visible()"
Merging usb/usb-next (ba454a5d961a Merge tag 'thunderbolt-for-v6.13-rc1' of=
 ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt int=
o usb-next)
Merging thunderbolt/next (40aeea504447 thunderbolt: Replace deprecated PCI =
functions)
Merging usb-serial/usb-next (8b524944f92c USB: serial: ftdi_sio: Fix atomic=
ity violation in get_serial_info())
Merging tty/tty-next (3791ea69a485 serial: sh-sci: Clean sci_ports[0] after=
 at earlycon exit)
Merging char-misc/char-misc-next (5a5470dd8aa5 Merge tag 'icc-6.13-rc1' of =
ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/djakov/icc into char-mis=
c-next)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (42f7652d3eb5 Linux 6.12-rc4)
Merging fastrpc/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging fpga/for-next (dbbd975cc6df fpga: Switch back to struct platform_dr=
iver::remove())
Merging icc/icc-next (b1fd28da86aa Merge branch 'icc-sar2130p' into icc-nex=
t)
Merging iio/togreg (20fd1383cd61 iio: Move __private marking before struct =
element priv in struct iio_dev)
Merging phy-next/next (32f4a76b8e7c phy: qcom: qmp: Fix lecacy-legacy typo)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/phy=
/qcom,sc8280xp-qmp-pcie-phy.yaml
Merging soundwire/next (830f1aa53c02 soundwire: cadence: clear MCP BLOCK_WA=
KEUP in init)
Merging extcon/extcon-next (9852d85ec9d4 Linux 6.12-rc1)
Merging gnss/gnss-next (8e929cb546ee Linux 6.12-rc3)
Merging vfio/next (9283b7392570 vfio/qat: fix overflow check in qat_vf_resu=
me_write())
Merging w1/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging spmi/spmi-next (9852d85ec9d4 Linux 6.12-rc1)
Merging staging/staging-next (114eae3c9fde Staging: gpib: gpib_os.c - Remov=
e unnecessary OOM message)
CONFLICT (modify/delete): drivers/staging/media/omap4iss/iss.c deleted in H=
EAD and modified in staging/staging-next.  Version staging/staging-next of =
drivers/staging/media/omap4iss/iss.c left in tree.
$ git rm -f drivers/staging/media/omap4iss/iss.c
Merging counter-next/counter-next (522ae89b7858 counter: intel-qep: Replace=
 deprecated PCI functions)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (49a9b01803e4 mux: constify mux class)
Merging dmaengine/next (8974f34de2ef dmaengine: loongson2-apb: Rename the p=
refix ls2x to loongson2)
Merging cgroup/for-next (95ab67727b8f Merge branch 'for-6.13' into for-next)
Merging scsi/for-next (84ce8b0209fa Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (128faa1845a2 Merge patch series "scsi: st: Devic=
e reset patches")
Merging vhost/linux-next (6a39bb15b3d1 virtio_vdpa: remove redundant check =
on desc)
Merging rpmsg/for-next (ad64a7c4a49d remoteproc: Switch back to struct plat=
form_driver::remove())
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (8bcbd0379c05 gpio: rockchip: support new v=
ersion GPIO)
Merging gpio-intel/for-next (12b0e305f509 gpio: acpi: switch to device_for_=
each_child_node_scoped())
Merging pinctrl/for-next (8bd815bab7f7 Merge fixup)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging pinctrl-intel/for-next (c6235c426d2a pinctrl: elkhartlake: Add supp=
ort for DSW community)
Merging pinctrl-renesas/renesas-pinctrl (f407af78c8d3 pinctrl: renesas: rzg=
2l: Use gpiochip_populate_parent_fwspec_twocell helper)
Merging pinctrl-samsung/for-next (6d2dbd4cec89 pinctrl: samsung: Add Exynos=
9810 SoC specific data)
Merging pwm/pwm/for-next (b2eaa1170e45 pwm: Assume a disabled PWM to emit a=
 constant inactive output)
Merging ktest/for-next (2351e8c65404 ktest.pl: Avoid false positives with g=
rub2 skip regex)
Merging kselftest/next (a44c26d7fa74 selftests/resctrl: Replace magic const=
ants used as array size)
Merging kunit/test (9852d85ec9d4 Linux 6.12-rc1)
Merging kunit-next/kunit (ff6d85216d9f kunit: skb: add gfp to kernel doc fo=
r kunit_zalloc_skb())
Merging livepatching/for-next (9c66f50477e2 Merge branch 'for-6.13/selftest=
s-kprobe' into for-next)
Merging rtc/rtc-next (eb4ffa400104 rtc: amlogic-a4: drop error messages)
$ git reset --hard HEAD^
Merging next-20241112 version of rtc
Merging nvdimm/libnvdimm-for-next (447b167bb60d nvdimm: Remove dead code fo=
r ENODEV checking in scan_labels())
Merging at24/at24/for-next (339cb28b9ee6 eeprom: at24: add ST M24256E Addit=
ional Write lockable page support)
Merging ntb/ntb-next (c620f56c70eb MAINTAINERS: Update AMD NTB maintainers)
Merging seccomp/for-next/seccomp (8cf8dfceebda seccomp: Stub for !HAVE_ARCH=
_SECCOMP_FILTER)
Merging fsi/next (c5eeb63edac9 fsi: Fix panic on scom file read)
Merging slimbus/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging nvmem/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (94e86b174d10 tools/hv: Add memory allocation ch=
eck in hv_fcopy_start)
Merging auxdisplay/for-next (0b028ff7e70e auxdisplay: Remove unused functio=
ns)
Merging kgdb/kgdb/for-next (272fad470b65 kdb: Fix breakpoint enable to be s=
ilent if already enabled)
Merging hmm/hmm (8cf0b93919e1 Linux 6.12-rc2)
Merging cfi/cfi/next (9852d85ec9d4 Linux 6.12-rc1)
Merging mhi/mhi-next (bd23e836423e bus: mhi: host: pci_generic: Use pcim_io=
map_region() to request and map MHI BAR)
Merging memblock/for-next (98b7beba1ee6 memblock: uniformly initialize all =
reserved pages to MIGRATE_MOVABLE)
Merging cxl/next (a83383e2ae7c Merge branch 'cxl/for-6.13/dcd-prep' into cx=
l-for-next)
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (63971b0f51fa libstub,tpm: do not ignore failure case when=
 reading final event log)
Merging unicode/for-next (66715f005bde unicode: change the reference of dat=
abase file)
Merging slab/slab/for-next (1e1c23b244c1 Merge branch 'slab/for-6.13/featur=
es' into slab/for-next)
Merging random/master (d18c13697b4d prandom: Include <linux/percpu.h> in <l=
inux/prandom.h>)
Applying: fix up for "random: Do not include <linux/prandom.h> in <linux/ra=
ndom.h>"
Merging landlock/next (03197e40a22c landlock: Optimize scope enforcement)
Merging rust/rust-next (b2603f8ac821 rust: warn on bindgen < 0.69.5 and lib=
clang >=3D 19.1)
CONFLICT (content): Merge conflict in rust/kernel/lib.rs
CONFLICT (content): Merge conflict in rust/kernel/task.rs
CONFLICT (content): Merge conflict in rust/kernel/types.rs
CONFLICT (content): Merge conflict in rust/macros/module.rs
CONFLICT (content): Merge conflict in scripts/Makefile.build
Merging sysctl/sysctl-next (9c738dae9534 sysctl: Reduce dput(child) calls i=
n proc_sys_fill_cache())
Merging execve/for-next/execve (f14e5adc14c2 exec: NULL out bprm->argv0 whe=
n it is an ERR_PTR)
Merging bitmap/bitmap-for-next (d7bcc37436c7 lib/test_bits.c: Add tests for=
 GENMASK_U128())
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (a508ef4b1dcc lib: string_helpers: silence snpri=
ntf() output truncation warning)
Merging kspp-gustavo/for-next/kspp (6613476e225e Linux 6.8-rc1)
Merging nolibc/nolibc (9852d85ec9d4 Linux 6.12-rc1)
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (d68beb276ba2 iommu/arm-smmu-v3: Support IOMMU_HWP=
T_INVALIDATE using a VIOMMU object)
Merging turbostat/next (a119348cb685 tools/power turbostat: Honor --show CP=
U, even when even when num_cpus=3D1)
Merging pwrseq/pwrseq/for-next (bd4c8bafcf50 power: sequencing: qcom-wcn: i=
mprove support for wcn6855)
Merging capabilities-next/caps-next (de2433c608c2 capabilities: remove cap_=
mmap_file())
Merging ipe/next (d881f0eb6f23 scripts: ipe: polgen: remove redundant close=
 and error exit path)
Merging kcsan/next (b86f7c9fad06 kcsan: Remove redundant call of kallsyms_l=
ookup_name())
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)

--Sig_/+siYw6yzY4_PPkc7419.LaR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc0UjMACgkQAVBC80lX
0Gw1Cgf9FOFaIxsRWtCXQsPR2PDUwFOOUj7m4jn5cKGq/TqRFFJr2ihQ3Ps0W6zl
1lsZ5GcNDb3XH5NAbxqokB7cJbPABjcBIrlQvOnpQThVqPR93MeSvnzEB0jV2Zaf
xTaYb/3QROqogQn6INydJAsqFVxXVR9VBERvwnepd7KQ95RN3BhbhfDm/loroVr5
F//pAw1kU/lFWlS2x2Bjgib45GbpJgQd2h0Gb0cvIkpxkFsebP7Zj9VR6UTwgmtX
OraTcnjNmkhzc4RHbSrOv72ELoDhgcSaUnFNJ7j0D83/6nFhM+dLK+VXXzbCzaz9
+VXT2joJTyHrXh7dfvPpbesJ4V2rFA==
=jLfz
-----END PGP SIGNATURE-----

--Sig_/+siYw6yzY4_PPkc7419.LaR--

