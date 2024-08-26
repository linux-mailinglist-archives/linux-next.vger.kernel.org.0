Return-Path: <linux-next+bounces-3421-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AEA95EEC5
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 12:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 648A9283A1C
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 10:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C6B143C67;
	Mon, 26 Aug 2024 10:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="q2DDVlBH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DF4F4EE;
	Mon, 26 Aug 2024 10:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724669278; cv=none; b=u7f+MjAwsqqK52SXNAN5WaN3XT8cWB9rVsKXLqu2DWsOKjUnUOWmzI3COua2RSbXbFsnfC611RWzONKqHYIp8G6ZI1TcMHUD7lQHj+P98h8Ih75BXHt7+by5VCQ5H/ynM2nWHBmwPbs1z2hGX/qfhT2cNtRafPqJ7xaeu0FZZxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724669278; c=relaxed/simple;
	bh=GSQRNJVWIVPH/tLjJFbKaZSh4rEqSryph3TCsan2vUk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=N6REcq02bGNdo/Uy8ZPmQ+Su7omNkM5Q20D6F0+BFDEh74FWxgP9v8l1k8cpkPnzYOikuN2OH/TkmBILZ/MD/H11PHCxsRwjyAj2PZgJuqImtw6D950CorB2YunYVEFsfDJue4Dq5XpFIhTLuCh/poSLU0uH5nGmZiOCzKfeDeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=q2DDVlBH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724669268;
	bh=PUJqaIZdBAv3aqyf5kwDdN/weNkCrltj/un3W9KHlyE=;
	h=Date:From:To:Cc:Subject:From;
	b=q2DDVlBH7RSKkmWjFI+FKKIZcZ74Bwz79xVZGCKqiJQSfWiqg7YsEhorZ/iJOP5A2
	 0o9xVJ8jxM/KVzbOgfLKGFQRZtDt2faRsZQNL8mDI3qyA8w0tQf2WSfpgOg4i9CPGe
	 3DasGUckj11ZcDzyRdD5mgE5jMvVQNNilXB+62SnTtET+MtjsFyJjY0DO+AeS07psA
	 ZSyIzBe3CANE0+z8QqKqqWFBD/rVuOBVyUFM+ap2kCCp2QyGJ8Mwt0Fb41yGkRNJ+7
	 tIFQbcXopxmU6UJSW05EBsu6sOBw1AeZI8kqejIUDI5kMutzoLOrVQ4wDL021U9iG0
	 XXDyRf/4QyEZA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WsnSh0NS7z4wcl;
	Mon, 26 Aug 2024 20:47:48 +1000 (AEST)
Date: Mon, 26 Aug 2024 20:47:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 26
Message-ID: <20240826204747.3b2b6593@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/y3MnG=DNSGedQCZ=P.w_rxx";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/y3MnG=DNSGedQCZ=P.w_rxx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20240823:

The mm tree gained a boot warning for which I reverted a commit.

The vfs-brauner tree gained a boot warning for which I reverted a
topic branch.

The amdgpu tree gained a conflict against the drm-misc tree.

The tip tree gained a build failure so I used the version from
next-20240823.

The drivers-x86 tree gained a conflict against Linus' tree.

Non-merge commits (relative to Linus' tree): 6061
 6349 files changed, 238379 insertions(+), 133399 deletions(-)

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

I am currently merging 375 trees (counting Linus' and 140 trees of bug
fix patches pending for the current merge release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Status of my local build tests will be at
http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
advice about cross compilers/configs that work, we are always open to add
more builds.

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--=20
Cheers,
Stephen Rothwell

$ git checkout master
$ git reset --hard stable
Merging origin/master (5be63fc19fca Linux 6.11-rc5)
Merging vfs-brauner-fixes/vfs.fixes (e00e99ba6c6b netfs: Fix interaction of=
 streaming writes with zero-point tracker)
Merging fscrypt-current/for-current (256abd8e550c Linux 6.10-rc7)
Merging fsverity-current/for-current (256abd8e550c Linux 6.10-rc7)
Merging btrfs-fixes/next-fixes (f0447f1e9335 Merge branch 'misc-6.11' into =
next-fixes)
Merging vfs-fixes/fixes (8c86f1a45749 close_range(): fix the logics in desc=
riptor table trimming)
Merging erofs-fixes/fixes (0005e01e1e87 erofs: fix out-of-bound access when=
 z_erofs_gbuf_growsize() partially fails)
Merging nfsd-fixes/nfsd-fixes (b0367a7cf033 fs/nfsd: fix update of inode at=
trs in CB_GETATTR)
Merging v9fs-fixes/fixes/next (0c3836482481 Linux 6.10)
Merging overlayfs-fixes/ovl-fixes (77a28aa47687 ovl: relax WARN_ON in ovl_v=
erify_area())
Merging bcachefs/for-next (6f03ad775d21 bcachefs: Switch gc bucket array to=
 a genradix)
Merging fscrypt/for-next (256abd8e550c Linux 6.10-rc7)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (cb46b77b279c Merge branch 'for-next-next-v6.11-2024=
0825' into for-next-20240825)
Merging ceph/master (43f5b8b50fb5 ceph: Remove unused declarations)
Merging cifs/for-next (06f646e2d0d4 netfs, cifs: Improve some debugging bit=
s)
Merging configfs/for-next (4425c1d9b44d configfs: improve item creation per=
formance)
Merging dlm/next (652b0ae675fe dlm: add missing -ENOMEM if alloc_workqueue(=
) fails)
Merging erofs/dev (7c626ce4bae1 Linux 6.11-rc3)
Merging exfat/dev (98ad7b9012b5 exfat: Implement sops->shutdown and ioctl)
Merging exportfs/exportfs-next (0c3836482481 Linux 6.10)
Merging ext3/for_next (85f22bb5d2c2 Merge UDF consistency fixes.)
Merging ext4/dev (dd7895c6e4a7 ext4: no need to continue when the number of=
 entries is 1)
Merging f2fs/dev (d33ebd57b987 f2fs: fix to use per-inode maxbytes and clea=
nup)
Merging fsverity/for-next (256abd8e550c Linux 6.10-rc7)
Merging fuse/for-next (529395d2ae64 virtio-fs: add multi-queue support)
Merging gfs2/for-next (6cb9df81a2c4 gfs2: fix double destroy_workqueue erro=
r)
Merging jfs/jfs-next (e63866a47556 jfs: fix out-of-bounds in dbNextAG() and=
 diAlloc())
Merging ksmbd/ksmbd-for-next (780bdc1ba776 Merge tag '6.11-rc5-server-fixes=
' of git://git.samba.org/ksmbd)
Merging nfs/linux-next (47ac09b91bef Linux 6.11-rc4)
Merging nfs-anna/linux-next (f92214e4c312 NFS: Avoid unnecessary rescanning=
 of the per-server delegation list)
Merging nfsd/nfsd-next (a7821990757c nfsd: fix some spelling errors in comm=
ents)
Merging ntfs3/master (7529036a025a fs/ntfs3: Rename ntfs3_setattr into ntfs=
_setattr)
Merging orangefs/for-next (53e4efa470d5 orangefs: fix out-of-bounds fsid ac=
cess)
Merging overlayfs/overlayfs-next (004b8d1491b4 ovl: fix encoding fid for lo=
wer only root)
Merging ubifs/next (92a286e90203 ubi: Fix ubi_init() ubiblock_exit() sectio=
n mismatch)
Merging v9fs/9p-next (2211561723a6 9p: Enable multipage folios)
Merging v9fs-ericvh/ericvh/for-next (0c3836482481 Linux 6.10)
Merging xfs/for-next (8d16762047c6 xfs: conditionally allow FS_XFLAG_REALTI=
ME changes if S_DAX is set)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging file-locks/locks-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6-=
mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging iversion/iversion-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6=
-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging vfs-brauner/vfs.all (2396dcd007ef Merge branch 'vfs.blocksize' into=
 vfs.all Signed-off-by: Christian Brauner <brauner@kernel.org>)
  c4c9c89c8c8e ("ntfs3: Remove reset_log_file()")
CONFLICT (content): Merge conflict in fs/exfat/inode.c
Applying: fixup for "fs: Convert aops->write_end to take a folio"
Merging vfs/for-next (a38297e3fb01 Linux 6.9)
Merging fixes/fixes (2dde18cd1d8f Linux 6.5)
Merging mm-hotfixes/mm-hotfixes-unstable (81c87e0a531b mm/memcontrol: respe=
ct zswap.writeback setting from parent cg too)
Merging fs-current (4b28c2c47e22 Merge branch 'nfsd-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/cel/linux)
Merging kbuild-current/fixes (d2bafcf224f3 Merge tag 'cgroup-for-6.11-rc4-f=
ixes' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup)
Merging arc-current/for-curr (e67572cd2204 Linux 6.9-rc6)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (75c8f387dd16 Merge tag 'kvmarm-fixes-6.=
11-2' of git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into f=
or-next/fixes)
Merging arm-soc-fixes/arm/fixes (6b1124c4526f Merge tag 'ti-k3-dt-fixes-for=
-v6.11' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into ar=
m/fixes)
Merging davinci-current/davinci/for-current (6613476e225e Linux 6.8-rc1)
Merging drivers-memory-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging sophgo-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging m68k-current/for-linus (21b9e722ad28 m68k: cmpxchg: Fix return valu=
e for default case in __arch_xchg())
Merging powerpc-fixes/fixes (3b1f7a46977f powerpc/mm: Fix return type of pg=
d_val())
Merging s390-fixes/fixes (1642285e511c s390/boot: Fix KASLR base offset off=
 by __START_KERNEL bytes)
Merging net/main (8af174ea863c net: mana: Fix race of mana_hwc_post_rx_wqe =
and new hwc response)
Merging bpf/master (872cf28b8df9 Merge tag 'platform-drivers-x86-v6.11-4' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86)
Merging ipsec/master (89a2aefe4b08 xfrm: call xfrm_dev_policy_delete when k=
ill policy)
Merging netfilter/main (6ea14ccb60c8 netfilter: flowtable: validate vlan he=
ader)
Merging ipvs/main (6ea14ccb60c8 netfilter: flowtable: validate vlan header)
Merging wireless/for-next (27ec3c57fcad wifi: mwifiex: duplicate static str=
ucts used in driver instances)
Merging ath/for-current (9abf199943a6 wifi: ath11k: fix NULL pointer derefe=
rence in ath11k_mac_get_eirp_power())
Merging wpan/master (b8ec0dc3845f net: mac802154: Fix racy device stats upd=
ates by DEV_STATS_INC() and DEV_STATS_ADD())
Merging rdma-fixes/for-rc (8400291e289e Linux 6.11-rc1)
Merging sound-current/for-linus (44ceabdec12f ALSA: hda/realtek: Fix the sp=
eaker output on Samsung Galaxy Book3 Ultra)
Merging sound-asoc-fixes/for-linus (6781b962d97b ASoC: tegra: Fix CBB error=
 during probe())
Merging regmap-fixes/for-linus (9c5f8c385701 Merge remote-tracking branch '=
regmap/for-6.10' into regmap-linus)
Merging regulator-fixes/for-linus (7c626ce4bae1 Linux 6.11-rc3)
Merging spi-fixes/for-linus (e17465f78eb9 spi: pxa2xx: Move PM runtime hand=
ling to the glue drivers)
Merging pci-current/for-linus (db1ec60fba4a PCI: qcom: Use OPP only if the =
platform supports it)
Merging driver-core.current/driver-core-linus (47ac09b91bef Linux 6.11-rc4)
Merging tty.current/tty-linus (47ac09b91bef Linux 6.11-rc4)
Merging usb.current/usb-linus (740f2e2791b9 usb: cdnsp: fix for Link TRB wi=
th TC)
Merging usb-serial-fixes/usb-linus (00af4f3dda14 USB: serial: debug: do not=
 echo input by default)
Merging phy/fixes (5af9b304bc60 phy: xilinx: phy-zynqmp: Fix SGMII linkup f=
ailure on resume)
Merging staging.current/staging-linus (8400291e289e Linux 6.11-rc1)
Merging iio-fixes/fixes-togreg (0a3b517c8089 iio: imu: inv_mpu6050: fix int=
errupt status read for old buggy chips)
Merging counter-current/counter-current (8400291e289e Linux 6.11-rc1)
Merging char-misc.current/char-misc-linus (47ac09b91bef Linux 6.11-rc4)
Merging soundwire-fixes/fixes (ab8d66d132bc soundwire: stream: fix programm=
ing slave ports for non-continous port maps)
Merging thunderbolt-fixes/fixes (47ac09b91bef Linux 6.11-rc4)
Merging input-current/for-linus (4e870e6bbec5 Input: himax_hx83112b - fix i=
ncorrect size when reading product ID)
Merging crypto-current/master (df1e9791998a hwrng: core - remove (un)regist=
er_miscdev())
Merging vfio-fixes/for-linus (5a88a3f67e37 vfio/pci: Init the count variabl=
e in collecting hot-reset devices)
Merging kselftest-fixes/fixes (170c966cbe27 selftests: ksft: Fix finished()=
 helper exit code on skipped tests)
Merging dmaengine-fixes/fixes (b53b831919a0 dmaengine: stm32-dma3: Set lli_=
size after allocation)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (bd92c1e07beb mtd: hyperbus: rpc-if: Add missin=
g MODULE_DEVICE_TABLE)
Merging mfd-fixes/for-mfd-fixes (68f860426d50 mfd: axp20x: AXP717: Fix miss=
ing IRQ status registers range)
Merging v4l-dvb-fixes/fixes (63de936b513f media: atomisp: Fix streaming no =
longer working on BYT / ISP2400 devices)
Merging reset-fixes/reset/fixes (ab35896730a5 reset: hisilicon: hi6220: add=
 missing MODULE_DESCRIPTION() macro)
Merging mips-fixes/mips-fixes (50f2b98dc83d MIPS: cevt-r4k: Don't call get_=
c0_compare_int if timer irq is installed)
Merging at91-fixes/at91-fixes (e9408fa234fb MAINTAINERS: Update DTS path fo=
r ARM/Microchip (AT91) SoC)
Merging omap-fixes/fixes (5062d9c0cbbc ARM: dts: omap3-n900: correct the ac=
celerometer orientation)
Merging kvm-fixes/master (1c0e5881691a KVM: SEV: uapi: fix typo in SEV_RET_=
INVALID_CONFIG)
Merging kvms390-fixes/master (cff59d8631e1 s390/uv: Panic for set and remov=
e shared access UVC errors)
Merging hwmon-fixes/hwmon (ff7a96571aa7 hwmon: (asus-ec-sensors) remove VRM=
 temp X570-E GAMING)
Merging nvdimm-fixes/libnvdimm-fixes (d5240fa65db0 nvdimm/pmem: Set dax fla=
g for all 'PFN_MAP' cases)
Merging cxl-fixes/fixes (2c402bd2e85b cxl/test: Skip cxl_setup_parent_dport=
() for emulated dports)
Merging dma-mapping-fixes/for-linus (75961ffb5cb3 swiotlb: initialise restr=
icted pool list_head when SWIOTLB_DYNAMIC=3Dy)
Merging drivers-x86-fixes/fixes (46ee21e9f592 platform/x86: ISST: Fix retur=
n value on last invalid resource)
Merging samsung-krzk-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging pinctrl-samsung-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging devicetree-fixes/dt/linus (b739dffa5d57 of/irq: Prevent device addr=
ess out-of-bounds read in interrupt map walk)
Merging dt-krzk-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging scsi-fixes/fixes (4f9eedfa27ae scsi: sd: Ignore command SYNCHRONIZE=
 CACHE error if format in progress)
Merging drm-fixes/drm-fixes (76f461867800 Merge tag 'drm-xe-fixes-2024-08-2=
2' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (5d41eeb6725e drm/i915/hdcp: U=
se correct cp_irq_count)
Merging mmc-fixes/fixes (a1e627af32ed mmc: mmc_test: Fix NULL dereference o=
n allocation failure)
Merging rtc-fixes/rtc-fixes (8400291e289e Linux 6.11-rc1)
Merging gnss-fixes/gnss-linus (8400291e289e Linux 6.11-rc1)
Merging hyperv-fixes/hyperv-fixes (4430556935db Drivers: hv: vmbus: Fix the=
 misplaced function description)
Merging risc-v-fixes/fixes (32d5f7add080 Merge patch series "RISC-V: hwprob=
e: Misaligned scalar perf fix and rename")
Merging riscv-dt-fixes/riscv-dt-fixes (7d9d88890f04 MAINTAINERS: invert Mis=
c RISC-V SoC Support's pattern)
Merging riscv-soc-fixes/riscv-soc-fixes (591940e22e28 firmware: microchip: =
fix incorrect error report of programming:timeout on success)
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (47ac09b91bef Linux 6.11-rc4)
Merging gpio-brgl-fixes/gpio/for-current (47ac09b91bef Linux 6.11-rc4)
Merging gpio-intel-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging pinctrl-intel-fixes/fixes (a366e46da10d pinctrl: meteorlake: Add Ar=
row Lake-H/U ACPI ID)
Merging auxdisplay-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging kunit-fixes/kunit-fixes (8400291e289e Linux 6.11-rc1)
Merging memblock-fixes/fixes (8043832e2a12 memblock: use numa_valid_node() =
helper to check for invalid node ID)
Merging renesas-fixes/fixes (8c987693dc2d ARM: dts: renesas: rcar-gen2: Add=
 missing #interrupt-cells to DA9063 nodes)
Merging perf-current/perf-tools (4bbe60029319 perf daemon: Fix the build on=
 32-bit architectures)
Merging efi-fixes/urgent (ae835a96d72c x86/efistub: Revert to heap allocate=
d boot_params for PE entrypoint)
Merging zstd-fixes/zstd-linus (77618db34645 zstd: Fix array-index-out-of-bo=
unds UBSAN warning)
Merging battery-fixes/fixes (7c626ce4bae1 Linux 6.11-rc3)
Merging iommufd-fixes/for-rc (cf1e515c9a40 iommufd/selftest: Make dirty_ops=
 static)
Merging rust-fixes/rust-fixes (0ff8f3f09795 rust: kernel: fix typos in code=
 comments)
Merging w1-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging pmdomain-fixes/fixes (9ec87c5957ea OPP: Fix support for required OP=
Ps for multiple PM domains)
Merging i2c-host-fixes/i2c/i2c-host-fixes (5be63fc19fca Linux 6.11-rc5)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (39a3396558fb clk: thead: fix dependency on clk=
_ignore_unused)
Merging pwrseq-fixes/pwrseq/for-current (06802616488c power: sequencing: qc=
om-wcn: set the wlan-enable GPIO to output)
Merging thead-dt-fixes/thead-dt-fixes (8400291e289e Linux 6.11-rc1)
Merging drm-misc-fixes/for-linux-next-fixes (c358a809cb58 Revert "drm/ttm: =
increase ttm pre-fault value to PMD size")
Merging mm-stable/mm-stable (47ac09b91bef Linux 6.11-rc4)
Merging mm-nonmm-stable/mm-nonmm-stable (47ac09b91bef Linux 6.11-rc4)
Merging mm/mm-everything (96c7a3c478fc foo)
Merging kbuild/for-next (184a282d540c kbuild: remove *.symversions left-ove=
r)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (e25ebda78e23 perf cap: Tidy up and improve ca=
pability testing)
Merging compiler-attributes/compiler-attributes (8400291e289e Linux 6.11-rc=
1)
Merging dma-mapping/for-next (b5c58b2fdc42 dma-mapping: direct calls for dm=
a-iommu)
Merging asm-generic/master (b82c1d235a30 syscalls: add back legacy __NR_nfs=
servctl macro)
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (3cbbf97c8ea7 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (5d16da41490d Merge branches 'for-next/acpi', '=
for-next/misc', 'for-next/perf' and 'for-next/selftests' into for-next/core)
Merging arm-perf/for-next/perf (7c626ce4bae1 Linux 6.11-rc3)
Merging arm-soc/for-next (6b1124c4526f Merge tag 'ti-k3-dt-fixes-for-v6.11'=
 of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into arm/fixes)
Merging amlogic/for-next (dff71e5c6076 Merge branch 'v6.12/drivers' into fo=
r-next)
Merging asahi-soc/asahi-soc/for-next (ffc253263a13 Linux 6.6)
Merging aspeed/for-next (d212c55cc811 ARM: dts: aspeed: harma: Remove pca95=
46)
Merging at91/at91-next (870c43904be2 Merge branch 'at91-defconfig' into at9=
1-next)
Merging broadcom/next (7eff0651abbb Merge branch 'soc/next' into next)
Merging davinci/davinci/for-next (973d248c43f2 ARM: davinci: remove unused =
cpuidle code)
Merging drivers-memory/for-next (ff390189b7f2 memory: mtk-smi: Use devm_clk=
_get_enabled())
Merging imx-mxs/for-next (1d43464566cd Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (9dd04bf6bf1c Merge branch 'v6.11-next/dts64' int=
o for-next)
Merging mvebu/for-next (ffd0d7df6bdb Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (6cb1ac2b11b2 Merge branch 'omap-for-v6.12/drivers' i=
nto omap-reset)
Merging qcom/for-next (d7b69f6e9e1c Merge branches 'arm32-for-6.12', 'arm64=
-defconfig-fixes-for-6.11', 'arm64-defconfig-for-6.12', 'arm64-fixes-for-6.=
11', 'arm64-for-6.12', 'clk-fixes-for-6.11', 'clk-for-6.12', 'drivers-fixes=
-for-6.11' and 'drivers-for-6.12' into for-next)
Merging renesas/next (66001d1d5cde Merge branch 'renesas-dts-for-v6.12' int=
o renesas-next)
Merging reset/reset/next (c1267e1afae6 arm64: dts: renesas: rz-smarc: Repla=
ce fixed regulator for USB VBUS)
Merging rockchip/for-next (4f25a522649f Merge branch 'v6.12-clk/next' into =
for-next)
Merging samsung-krzk/for-next (3727c4f06868 Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (1241a9b4c9e7 Merge branches 'for-next/juno/upd=
ates', 'for-next/scmi/updates' and 'for-next/ffa/updates' of ssh://gitolite=
.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-linux-next)
Merging sophgo/for-next (d9773e09addd riscv: dts: sophgo: Add i2c device su=
pport for sg2042)
Merging stm32/stm32-next (1eafc48af859 arm64: stm32: enable scmi regulator =
for stm32)
Merging sunxi/sunxi/for-next (2873085a8cd5 arm64: dts: allwinner: h700: Add=
 Anbernic RG35XX-SP)
Merging tee/next (cd88a296582c Merge branch 'optee_notif_wait_timeout_for_v=
6.11' into next)
Merging tegra/for-next (5211d93c551f Merge branch for-6.11/arm64/defconfig =
into for-next)
Merging thead-dt/thead-dt-for-next (2d98fea7491a riscv: dts: thead: change =
TH1520 SPI node to use clock controller)
Merging ti/ti-next (d5a0fdaa4d33 Merge branch 'ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (0c559f8a91de drivers: soc: xilinx: add the missing=
 kfree in xlnx_add_cb_for_suspend())
Merging clk/clk-next (5cbecabe63a8 Merge branch 'clk-assigned-rates' into c=
lk-next)
Merging clk-imx/for-next (466da3d2d967 clk: imx: composite-7ulp: Use NULL i=
nstead of 0)
Merging clk-renesas/renesas-clk (0dec2d0c8a7e dt-bindings: clock: renesas,c=
pg-clocks: Add top-level constraints)
Merging csky/linux-next (2c40c1c6adab Merge tag 'usb-6.7-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging loongarch/loongarch-next (ac4f535b9682 LoongArch: KVM: Invalidate g=
uest steal time address on vCPU reset)
Merging m68k/for-next (21b9e722ad28 m68k: cmpxchg: Fix return value for def=
ault case in __arch_xchg())
Merging m68knommu/for-next (47ac09b91bef Linux 6.11-rc4)
Merging microblaze/next (d829e7ee6354 microblaze: Export xmb_manager functi=
ons)
Merging mips/mips-next (8400291e289e Linux 6.11-rc1)
Merging openrisc/for-next (4dc70e1aadfa openrisc: Move FPU state out of pt_=
regs)
Merging parisc-hd/for-next (d173d4d9e831 parisc: Improve monotonic clock_ge=
ttime() resolution on SMP machines)
Merging powerpc/next (b7d47339d00d powerpc/code-patching: Add boot selftest=
 for data patching)
Merging risc-v/for-next (0e3f3649d44b riscv: Enable generic CPU vulnerabili=
tes support)
Merging riscv-dt/riscv-dt-for-next (8400291e289e Linux 6.11-rc1)
Merging riscv-soc/riscv-soc-for-next (8400291e289e Linux 6.11-rc1)
Merging s390/for-next (a8f6346975ea Merge branch 'features' into for-next)
Applying: fixup for "s390/mm/ptdump: Generate address marker array dynamica=
lly"
Merging sh/for-next (8fe76a1c2264 sh: push-switch: Add missing MODULE_DESCR=
IPTION() macro)
Merging sparc/for-next (a3da15389112 sparc64: Fix prototype warnings in hib=
ernate.c)
Merging uml/next (98ff534ec2cd um: vector: always reset vp->opened)
Merging xtensa/xtensa-for-next (b7cf2a1d9881 xtensa: remove redundant flush=
_dcache_page and ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE macros)
Merging fs-next (3f0cf7f4383a Merge branch 'vfs.all' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/vfs/vfs.git)
Merging printk/for-next (59cd94ef8009 lockdep: Mark emergency sections in l=
ockdep splats)
Merging pci/next (ac716a2a3d2f Merge branch 'pci/misc')
Merging pstore/for-next/pstore (a7050ca72480 pstore/ramoops: Fix typo as th=
ere is no "reserver")
Merging hid/for-next (07de761d43c6 Merge branch 'for-6.12/hid-playstation' =
into for-next)
Merging i2c/i2c/for-next (e3310fb8dede Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i2c-host/i2c/i2c-host (0bcd5edc7ef6 dt-bindings: i2c: aspeed: drop =
redundant multi-master)
Merging i3c/i3c/next (8400291e289e Linux 6.11-rc1)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (df9686ab8ee9 hwmon: (ntc_thermistor) fix =
module autoloading)
Merging jc_docs/docs-next (0769a1b7cf30 Documentation: Capitalize Fahrenhei=
t in watchdog-api.rst)
CONFLICT (content): Merge conflict in Documentation/admin-guide/device-mapp=
er/dm-crypt.rst
Merging v4l-dvb/master (31aaa7d95e09 media: cec: cec-adap.c: improve CEC_MS=
G_FL_REPLY_VENDOR_ID check)
Merging v4l-dvb-next/master (a043ea54bbb9 Merge tag 'next-media-rkisp1-2024=
0814' of git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git)
Merging pm/linux-next (f88177a5f870 Merge branch 'pm-powercap' into linux-n=
ext)
Merging cpufreq-arm/cpufreq/arm/linux-next (ea24b529e345 cpufreq: Add SM732=
5 to cpufreq-dt-platdev blocklist)
Merging cpupower/cpupower (76fb981ad677 tools/cpupower: display residency v=
alue in idle-info)
Merging devfreq/devfreq-next (1d143dde7679 PM / devfreq: exynos: Use Use de=
vm_clk_get_enabled() helpers)
Merging pmdomain/next (d4ee3c1c364d OPP: Drop redundant _opp_attach|detach_=
genpd())
Merging opp/opp/linux-next (8400291e289e Linux 6.11-rc1)
Merging thermal/thermal/linux-next (7eeb114a635a dt-bindings: thermal: conv=
ert hisilicon-thermal.txt to dt-schema)
Merging rdma/for-next (e2e641fe1c69 RDMA/ipoib: Remove unused declarations)
Merging net-next/main (7d3aed652d09 net: refactor ->ndo_bpf calls into dev_=
xdp_propagate)
CONFLICT (content): Merge conflict in drivers/net/ethernet/mellanox/mlxsw/c=
ore_thermal.c
Merging bpf-next/for-next (c4b767fc2b39 Merge branch 'bpf-next/master' into=
 bpf-next/for-next)
CONFLICT (content): Merge conflict in fs/coda/inode.c
Applying: fixup for "introduce fd_file(), convert all accessors to it."
Applying: fixup2 for "introduce fd_file(), convert all accessors to it."
Merging ipsec-next/master (54f2f78d6b9f xfrm: Correct spelling in xfrm.h)
Merging mlx5-next/mlx5-next (c772a2c69018 net/mlx5: Add IFC related stuff f=
or data direct)
Merging netfilter-next/main (c88baabf16d1 netfilter: nf_tables: don't initi=
alize registers in nft_do_chain())
Merging ipvs-next/main (c88baabf16d1 netfilter: nf_tables: don't initialize=
 registers in nft_do_chain())
Merging bluetooth/master (61bea6923172 Bluetooth: qca: If memdump doesn't w=
ork, re-enable IBS)
Merging wireless-next/for-next (67a72043aa2e wifi: mwifiex: remove unnecess=
ary checks for valid priv)
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/hw.c
Merging ath-next/for-next (94745807f3eb wifi: ath9k_htc: Use __skb_set_leng=
th() for resetting urb before resubmit)
Merging wpan-next/master (9187210eee7d Merge tag 'net-next-6.9' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging wpan-staging/staging (9187210eee7d Merge tag 'net-next-6.9' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mtd/mtd/next (175086cf4acd mtd: concat: Use kmemdup_array instead o=
f kmemdup for multiple allocation)
Merging nand/nand/next (ccce71013406 mtd: rawnand: davinci: make platform_d=
ata private)
Merging spi-nor/spi-nor/next (b6491eb021e4 mtd: spi-nor: winbond: add Zetta=
 ZD25Q128C support)
Merging crypto/master (3c44d31cb34c crypto: simd - Do not call crypto_alloc=
_tfm during registration)
Merging drm/drm-next (11df68c26546 Merge tag 'drm-misc-next-2024-08-16' of =
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/Makefile
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/display/xe_display=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_device.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_device_types.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_submit.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_rtp.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_vm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_wa_oob.rules
Merging drm-exynos/for-linux-next (627a24f5f25d Merge tag 'amd-drm-fixes-6.=
11-2024-07-18' of https://gitlab.freedesktop.org/agd5f/linux into drm-next)
Merging drm-misc/for-linux-next (58a261bfc967 drm/amd/display: use a more l=
ax vblank enable policy for older ASICs)
Merging amdgpu/drm-next (3376f922bfe0 drm/amd/pm: Drop unsupported features=
 on smu v14_0_2)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/smu14/sm=
u_v14_0_2_ppt.c
Applying: fixup for "drm/amdgpu: add per ring reset support (v5)"
Merging drm-intel/for-linux-next (a4dbe45c4c14 drm/i915/dsi: Make Lenovo Yo=
ga Tab 3 X90F DMI match less strict)
Merging drm-msm/msm-next (fe34394ecdad dt-bindings: display/msm: dsi-contro=
ller-main: Add SM7150)
Merging drm-msm-lumag/msm-next-lumag (399af57ccca2 dt-bindings: display/msm=
/gpu: fix the schema being not applied)
Merging drm-xe/drm-xe-next (ff9c674d1127 drm/xe: Fix total initialization i=
n xe_ggtt_print_holes())
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/display/xe_display=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_gt_pagefault.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_mmio.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_wa.c
Merging etnaviv/etnaviv/next (704d3d60fec4 drm/etnaviv: don't block schedul=
er when GPU is still active)
Merging fbdev/for-next (8b05b12e86ff fbdev/hpfb: Fix an error handling path=
 in hpfb_dio_probe())
Merging regmap/for-next (18a6399396ad Merge remote-tracking branch 'regmap/=
for-6.12' into regmap-next)
Merging sound/for-next (b29ba8f1f942 ALSA: hda/realtek: Convert existing CS=
35L56 products to use autodetect fixup function)
Merging ieee1394/for-next (c652a6d7e10a firewire: core: update fw_device ou=
tside of device_find_child())
Merging sound-asoc/for-next (02d3a370a7bc Merge remote-tracking branch 'aso=
c/for-6.12' into asoc-next)
Merging modules/modules-next (f94ce04e5403 module: Clean up the description=
 of MODULE_SIG_<type>)
Merging input/next (6994d8b84bfd Input: evdev - limit amount of data for wr=
ites)
CONFLICT (modify/delete): drivers/input/touchscreen/cyttsp4_core.c deleted =
in input/next and modified in HEAD.  Version HEAD of drivers/input/touchscr=
een/cyttsp4_core.c left in tree.
$ git rm -f drivers/input/touchscreen/cyttsp4_core.c
Merging block/for-next (58838298c419 Merge branch 'for-6.12/io_uring' into =
for-next)
Merging device-mapper/for-next (02c0207ecdcc dm bufio: Remove NULL check of=
 list_entry())
Merging libata/for-next (66afec7c6992 ata: ahci_imx: Fix error code in prob=
e())
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (5cc5d08b873d mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (630d7615539a mfd: cros_ec: Update module descript=
ion)
Merging backlight/for-backlight-next (fea88a13a5d1 backlight: l4f00242t03: =
Add check for spi_setup)
Merging battery/for-next (8400291e289e Linux 6.11-rc1)
Merging regulator/for-next (5ba58cdc9589 Merge remote-tracking branch 'regu=
lator/for-6.12' into regulator-next)
Merging security/next (f5dafb8909dc ipe: Remove duplicated include in ipe.c)
Merging apparmor/apparmor-next (8400291e289e Linux 6.11-rc1)
Merging integrity/next-integrity (fa8a4ce432e8 ima: fix buffer overrun in i=
ma_eventdigest_init_common)
Merging selinux/next (05da3fe161e9 Automated merge of 'dev' into 'next')
Merging smack/next (eabc10e60dac security: smack: Fix indentation in smack_=
netfilter.c)
Merging tomoyo/master (dc1c8034e31b minmax: simplify min()/max()/clamp() im=
plementation)
Merging tpmdd/next (5e1c39cbccba tpm: ibmvtpm: Call tpm2_sessions_init() to=
 initialize session support)
Merging watchdog/master (7c626ce4bae1 Linux 6.11-rc3)
Merging iommu/next (5027d28ef58b Merge branches 'fixes', 'amd/amd-vi' and '=
core' into next)
Merging audit/next (8400291e289e Linux 6.11-rc1)
Merging devicetree/for-next (ee74817b0d66 ASoC: dt-bindings: serial-midi: r=
eference serial-peripheral-props.yaml)
Merging dt-krzk/for-next (08fd3b6e0df4 Merge branch 'next/dt64' into for-ne=
xt)
Merging mailbox/for-next (a8bd68e4329f mailbox: mtk-cmdq: Move devm_mbox_co=
ntroller_register() after devm_pm_runtime_enable())
Merging spi/for-next (7a3ebbfe99fe Merge remote-tracking branch 'spi/for-6.=
12' into spi-next)
Merging tip/master (e77f8f275278 Merge branch into tip/master: 'x86/timers')
$ git reset --hard HEAD^
Merging next-20240823 version of tip
Merging clockevents/timers/drivers/next (b7625d67eb1a Merge tag 'timers-v6.=
11-rc1' of https://git.linaro.org/people/daniel.lezcano/linux into timers/c=
ore)
Merging edac/edac-for-next (090786479325 Merge ras/edac-misc into for-next)
Merging ftrace/for-next (2a07e30c19f3 Merge ring-buffer/for-next)
Merging rcu/next (1e98bce39ad2 rcu/nocb: Remove superfluous memory barrier =
after bypass enqueue)
Merging paulmck/non-rcu/next (f01f18f2ed7d Merge branches 'cmpxchg.2024.08.=
06a', 'lkmm.2024.08.02a', 'kcsan.2024.08.01a' and 'misc.2024.08.02a' into H=
EAD)
Merging kvm/next (15e1c3d65975 KVM: x86: Use this_cpu_ptr() instead of per_=
cpu_ptr(smp_processor_id()))
Merging kvm-arm/next (cf1903f019aa Merge branch kvm-arm64/idregs-6.12 into =
kvmarm-master/next)
Merging kvms390/next (7816e58967d0 kvm: s390: Reject memory region operatio=
ns for ucontrol VMs)
Merging kvm-ppc/topic/ppc-kvm (9739ff4887c7 KVM: PPC: Book3S HV: Refactor H=
FSCR emulation for KVM guests)
Merging kvm-riscv/riscv_kvm_next (dd4a799bcc13 KVM: riscv: selftests: Fix c=
ompile error)
Merging kvm-x86/next (a1206bc992c3 Merge branches 'fixes', 'generic', 'misc=
', 'mmu', 'pat_vmx_msrs', 'selftests', 'svm' and 'vmx')
Merging xen-tip/linux-next (4c006734898a x86/xen: fix memblock_reserve() us=
age on PVH)
Merging percpu/for-next (2d9ad81ef935 Merge branch 'for-6.8-fixes' into for=
-next)
Merging workqueues/for-next (82e29ca33e36 Merge branch 'for-6.12' into for-=
next)
Merging sched-ext/for-next (9ad2861b773d sched_ext: Allow dequeue_task_scx =
to fail)
Merging drivers-x86/for-next (1e701372d7ac platform/x86/intel/ifs: Fix SBAF=
 title underline length)
CONFLICT (content): Merge conflict in drivers/platform/surface/surface_aggr=
egator_registry.c
Merging chrome-platform/for-next (d1b35e6d34e9 platform/chrome: chromeos_la=
ptop: Use kmemdup_array)
Merging chrome-platform-firmware/for-firmware-next (8400291e289e Linux 6.11=
-rc1)
Merging hsi/for-next (f02cfe695047 HSI: ssi_protocol: Remove unused linux/g=
pio.h)
Merging leds-lj/for-leds-next (e5ae4083d32d dt-bindings: leds: Convert leds=
-lm3692x to YAML format)
Merging ipmi/for-next (0108b7be2a18 Merge tag 'for-linus-iommufd' of git://=
git.kernel.org/pub/scm/linux/kernel/git/jgg/iommufd)
Merging driver-core/driver-core-next (888f67e621dd driver core: Use 2-argum=
ent strscpy())
Merging usb/usb-next (fb9804096bb3 usb: typec: ucsi: Remove useless error c=
heck from ucsi_read_error())
Merging thunderbolt/next (10904df3f20c thunderbolt: Improve software receiv=
er lane margining)
Merging usb-serial/usb-next (da74a5100a2b USB: serial: drop driver owner in=
itialization)
Merging tty/tty-next (ebbe30f4bba1 Merge 6.11-rc4 into tty-next)
Merging char-misc/char-misc-next (10c8d1bd7865 Merge 6.11-rc4 into char-mis=
c-next)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (988d40a4d4e7 coresight: Make trace ID map spinlock =
local to the map)
Merging fastrpc/for-next (590c42d9e278 misc: fastrpc: Add support for cdsp1=
 remoteproc)
Merging fpga/for-next (8de36789bd03 fpga: zynq-fpga: Rename 'timeout' varia=
ble as 'time_left')
Merging icc/icc-next (be659e18627d Merge branch 'icc-sm4450' into icc-next)
Merging iio/togreg (c4b43d8336e5 drivers:iio:Fix the NULL vs IS_ERR() bug f=
or debugfs_create_dir())
Merging phy-next/next (c4b09c562086 phy: phy-rockchip-samsung-hdptx: Add cl=
ock provider support)
Merging soundwire/next (5aedb8d8336b soundwire: intel_bus_common: enable in=
terrupts before exiting reset)
Merging extcon/extcon-next (8daf1c28478d dt-bindings: extcon: convert extco=
n-usb-gpio.txt to yaml format)
Merging gnss/gnss-next (8400291e289e Linux 6.11-rc1)
Merging vfio/next (0756bec2e45b vfio-mdev: add missing MODULE_DESCRIPTION()=
 macros)
Merging w1/for-next (e940ff286ec4 w1: ds2482: Drop explicit initialization =
of struct i2c_device_id::driver_data to 0)
Merging spmi/spmi-next (7c626ce4bae1 Linux 6.11-rc3)
Merging staging/staging-next (b0b79119cea2 staging: rtl8192e: remove set bu=
t otherwise unused local variable iv16)
Merging counter-next/counter-next (8400291e289e Linux 6.11-rc1)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (44c026a73be8 Linux 6.4-rc3)
Merging dmaengine/next (0204485c5a1e dt-bindings: fsl-qdma: allow compatibl=
e string fallback to fsl,ls1021a-qdma)
Merging cgroup/for-next (9d7165c343d0 Merge branch 'for-6.12' into for-next)
Merging scsi/for-next (f682c0f62af8 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (70302fc7adcd Merge patch series "Simplify multip=
le create*_workqueue() invocations")
Merging vhost/linux-next (d820e8fcea38 net: virtio: unify code to init stat=
s)
Merging rpmsg/for-next (fb73da4ca1e3 Merge branches 'rproc-next', 'rpmsg-ne=
xt' and 'hwspinlock-next' into for-next)
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (b41a9bf2c64e gpio: pca953x: Print the erro=
r code on read/write failures)
Merging gpio-intel/for-next (8400291e289e Linux 6.11-rc1)
Merging pinctrl/for-next (9f7674dfebe0 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (47ac09b91bef Linux 6.11-rc4)
Merging pinctrl-renesas/renesas-pinctrl (5e633f572bba pinctrl: renesas: Swi=
tch to use kmemdup_array())
Merging pinctrl-samsung/for-next (39dbbd4e6778 pinctrl: samsung: Use kmemdu=
p_array instead of kmemdup for multiple allocation)
Merging pwm/pwm/for-next (861a4272660a pwm: lp3943: Fix an incorrect type i=
n lp3943_pwm_parse_dt())
Merging ktest/for-next (07283c1873a4 ktest: force $buildonly =3D 1 for 'mak=
e_warnings_file' test type)
Merging kselftest/next (611fbeb44a77 selftests:core: test coverage for dup_=
fd() failure handling in unshare_fd())
Merging kunit/test (8400291e289e Linux 6.11-rc1)
Merging kunit-next/kunit (8400291e289e Linux 6.11-rc1)
Merging livepatching/for-next (9871e6af43db Merge branch 'for-6.11/sysfs-pa=
tch-replace' into for-next)
Merging rtc/rtc-next (04dcadb87da6 rtc: stm32: add alarm A out feature)
Merging nvdimm/libnvdimm-for-next (b0d478e34dbf testing: nvdimm: Add MODULE=
_DESCRIPTION() macros)
Merging at24/at24/for-next (36e071d2a152 dt-bindings: eeprom: at24: Add com=
patible for Giantec GT24C04A)
Merging ntb/ntb-next (92aee2f6d156 NTB: ntb_transport: fix all kernel-doc w=
arnings)
Merging seccomp/for-next/seccomp (de9c2c66ad8e Linux 6.11-rc2)
Merging fsi/next (c5eeb63edac9 fsi: Fix panic on scom file read)
Merging slimbus/for-next (9b6e704955fa slimbus: generate MODULE_ALIAS() fro=
m MODULE_DEVICE_TABLE())
Merging nvmem/for-next (a94699fa406d MAINTAINERS: Update path for U-Boot en=
vironment variables YAML)
Merging xarray/main (2a15de80dd0f idr: fix param name in idr_alloc_cyclic()=
 doc)
Merging hyperv/hyperv-next (0b5530861eec x86/hyperv: use helpers to read co=
ntrol registers in hv_snp_boot_ap())
Merging auxdisplay/for-next (8400291e289e Linux 6.11-rc1)
Merging kgdb/kgdb/for-next (9bccbe7b2087 kdb: Get rid of redundant kdb_curr=
_task())
Merging hmm/hmm (6613476e225e Linux 6.8-rc1)
Merging cfi/cfi/next (8400291e289e Linux 6.11-rc1)
Merging mhi/mhi-next (65bc58c3dcad net: wwan: mhi: make default data link i=
d configurable)
Merging memblock/for-next (cb088e38aab4 s390/mm: get estimated free pages b=
y memblock api)
CONFLICT (rename/delete): tools/testing/radix-tree/linux/init.h renamed to =
tools/testing/shared/linux/init.h in HEAD, but deleted in memblock/for-next.
$ git rm -f tools/testing/shared/linux/init.h
Merging cxl/next (a0328b397f33 cxl/core/pci: Move reading of control regist=
er to immediately before usage)
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (4a2ebb082297 efi: Replace efi_memory_attributes_table_t 0=
-sized array with flexible array)
Merging unicode/for-next (68318904a775 unicode: add MODULE_DESCRIPTION() ma=
cros)
Merging slab/slab/for-next (7fee0ddd8c56 Merge branch 'slab/for-6.12/rcu_ba=
rriers' into slab/for-next)
CONFLICT (content): Merge conflict in kernel/rcu/tree.c
Merging random/master (c86927f528a8 selftests/vDSO: don't #include sodium h=
eader in chacha test)
Merging landlock/next (ad1b27fc9877 Landlock: Document LANDLOCK_SCOPED_ABST=
RACT_UNIX_SOCKET and ABI versioning)
Merging rust/rust-next (6e6efc5fef4a rust: enable rustdoc's `--generate-lin=
k-to-definition`)
Merging sysctl/sysctl-next (acc154691fc7 sysctl: Warn on an empty procname =
element)
Merging execve/for-next/execve (44f65d900698 binfmt_elf: mseal address zero)
CONFLICT (content): Merge conflict in fs/binfmt_elf.c
Merging bitmap/bitmap-for-next (227428f1b724 lib/test_bits.c: Add tests for=
 GENMASK_U128())
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (7c26646068f5 Merge branches 'for-linus/hardenin=
g' and 'for-next/hardening' into for-next/kspp)
Merging kspp-gustavo/for-next/kspp (6613476e225e Linux 6.8-rc1)
Merging nolibc/nolibc (8400291e289e Linux 6.11-rc1)
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (4be8b00b2b0f iommufd: Reorder include files)
CONFLICT (content): Merge conflict in drivers/iommu/iommufd/selftest.c
Merging turbostat/next (75879bd898ee tools/power turbostat: fix GCC9 build =
regression)
Merging pwrseq/pwrseq/for-next (8b7e0a6c443e Documentation: add a driver AP=
I doc for the power sequencing subsystem)
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)
Applying: Revert "Merge patch series "enable bs > ps in XFS""
Applying: Revert "vma remove the unneeded avc bound with non-CoWed folio"

--Sig_/y3MnG=DNSGedQCZ=P.w_rxx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbMXVMACgkQAVBC80lX
0GzSHAf/UrCFg58KJJ45OiQvjPD9Syea1/gaBUCFxLVXu6LNigYUMJhAkyc5xpBL
jCnVulyfs4uDFSyc2zkRq1NNOgkoYo6YDMsiZpy0hLVcxrJAwiVvaffNbEE2YNpi
XjMxpBSwW3Tz4pgAbRjPR863fTvXmaQR0x4iAaz30eF+lN0hbgYgNkvxIAVYSQlL
Xx1P0wHksCSpwnYtcuIKqw2a4StoOcQjLZnM0Pr+9hkiH7a+MtCsfMjIOkOwO6zF
bunqCZfZzAHC+7tC1Db6QsXQiJCs8bwwwZ9aASxRin4RyHAoiiAtA2711F1fxpz4
TN8pnnGvNr6JepvRFTROSy/Z01Nf/w==
=fws0
-----END PGP SIGNATURE-----

--Sig_/y3MnG=DNSGedQCZ=P.w_rxx--

