Return-Path: <linux-next+bounces-3379-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BA4959377
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2024 05:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 170EBB22655
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2024 03:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C02E7158522;
	Wed, 21 Aug 2024 03:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="diJi9Bf7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABAB132139;
	Wed, 21 Aug 2024 03:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724212424; cv=none; b=e7H9SFplc7FF5ObFr2zrm9o80OsEsF0Ys5wS3wOYKX1H2ytYHwpH9OOyIxHUPMvyKSCnVYD52IyT2uxfF/zTm17kE2sXMF6z+rsjfw5GJq9n+dSeSTYn549ancp869ZekChCdhEndpoLQ2gDwqEvNFI0kXJBv+C86BGK3eaZyXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724212424; c=relaxed/simple;
	bh=wtbAd6w6FIyrX2112m3e23UDMfmlmvMANzTCkwjBHCU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CX67aICUKxbHe8opFnT2TVii+9Lk1sjRSHcnDtBrgT5D9eX0In2+BBBtF10ca6Q/haW/OrJDAwCQlaMbZri3CknqYVRfWsSn3KURwOubDZCdNouxErh/U59+XN6ZfzS++7W0jPGSZ//M1Pp96a1cwU2yzoImoerVEWpFVc+j9vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=diJi9Bf7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724212418;
	bh=sX+IFx/GMNfHzy1SwtrN21kcw1u1k6AygAq48V1zi1o=;
	h=Date:From:To:Cc:Subject:From;
	b=diJi9Bf7tbWDS7RBNa0omL+FTlYAlp7f6sAlbHNqxunpe1bajN3UdCzIaGVM/6Bgm
	 cOdM+4VPHaTUPLDsqTAFYd71ZRkLMZHwAhtF7OIryzDk3uoCLGgJO+B7X4P6urebVp
	 NfNh0tgrOCnE85bzrLzVA57qq44191nOj6iQxrwbAq7+ihve/oXfh1ri7TStXG6ej0
	 556Y+me9E0FFENt/b2afYR3sSyBnFBtXRqV+geT5kbLuDyNZe0ub5/hUnEjvo2APwU
	 8YUEbPRUxVxOQyuBbaW5/LH5RUS30Id2oyavvmZDZClSzVwJRtBS/DsFRFIe9Phrht
	 Ui9syTYSa9PQg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WpXW56m77z4x7B;
	Wed, 21 Aug 2024 13:53:37 +1000 (AEST)
Date: Wed, 21 Aug 2024 13:53:37 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 21
Message-ID: <20240821135337.305d8804@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QeBQsq2NEFR9bZm1GEu.6Vm";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/QeBQsq2NEFR9bZm1GEu.6Vm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20240820:

The vfs-bauner tree still had its build failure so I used the version
from next-20240819.

The arm tree gained a build failure so I used the version from
next-20240820.

Non-merge commits (relative to Linus' tree): 5109
 5606 files changed, 209086 insertions(+), 118393 deletions(-)

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
Merging origin/master (521b1e7f4cf0 Merge tag 'cxl-fixes-6.11-rc5' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl)
Merging vfs-brauner-fixes/vfs.fixes (780d60bac21e Revert "pidfd: prevent cr=
eation of pidfds for kthreads")
Merging fscrypt-current/for-current (256abd8e550c Linux 6.10-rc7)
Merging fsverity-current/for-current (256abd8e550c Linux 6.10-rc7)
Merging btrfs-fixes/next-fixes (8e4f925b8523 Merge branch 'misc-6.11' into =
next-fixes)
Merging vfs-fixes/fixes (046667c4d319 memcg_write_event_control(): fix a us=
er-triggerable oops)
Merging erofs-fixes/fixes (db2cc8a6b8ec erofs: fix out-of-bound access when=
 z_erofs_gbuf_growsize() partially fails)
Merging nfsd-fixes/nfsd-fixes (91da337e5d50 nfsd: don't set SVC_SOCK_ANONYM=
OUS when creating nfsd sockets)
Merging v9fs-fixes/fixes/next (0c3836482481 Linux 6.10)
Merging overlayfs-fixes/ovl-fixes (77a28aa47687 ovl: relax WARN_ON in ovl_v=
erify_area())
Merging bcachefs/for-next (b3f1b3d6afa2 bcachefs: Do not check folio_has_pr=
ivate())
Merging fscrypt/for-next (256abd8e550c Linux 6.10-rc7)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (9e321fefa0e1 Merge branch 'for-next-next-v6.11-2024=
0820' into for-next-20240820)
Merging ceph/master (43f5b8b50fb5 ceph: Remove unused declarations)
Merging cifs/for-next (b5e99e6c6dcd smb3: fix problem unloading module due =
to leaked refcount on shutdown)
Merging configfs/for-next (4425c1d9b44d configfs: improve item creation per=
formance)
Merging dlm/next (652b0ae675fe dlm: add missing -ENOMEM if alloc_workqueue(=
) fails)
Merging erofs/dev (7c626ce4bae1 Linux 6.11-rc3)
Merging exfat/dev (98ad7b9012b5 exfat: Implement sops->shutdown and ioctl)
Merging exportfs/exportfs-next (0c3836482481 Linux 6.10)
Merging ext3/for_next (85f22bb5d2c2 Merge UDF consistency fixes.)
Merging ext4/dev (8400291e289e Linux 6.11-rc1)
Merging f2fs/dev (d33ebd57b987 f2fs: fix to use per-inode maxbytes and clea=
nup)
Merging fsverity/for-next (256abd8e550c Linux 6.10-rc7)
Merging fuse/for-next (529395d2ae64 virtio-fs: add multi-queue support)
Merging gfs2/for-next (6706415bf9f3 Merge tag 'gfs2-v6.10-rc1-fixes' of git=
://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2)
Merging jfs/jfs-next (d0fa70aca54c jfs: don't walk off the end of ealist)
Merging ksmbd/ksmbd-for-next (7c525dddbee7 ksmbd: Replace one-element array=
s with flexible-array members)
Merging nfs/linux-next (47ac09b91bef Linux 6.11-rc4)
Merging nfs-anna/linux-next (b9fae9f06d84 SUNRPC: Fixup gss_status tracepoi=
nt error output)
Merging nfsd/nfsd-next (3cd8719c4fd9 nfsd: map the EBADMSG to nfserr_io to =
avoid warning)
Merging ntfs3/master (8400291e289e Linux 6.11-rc1)
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
Merging vfs-brauner/vfs.all (d4c416e18e3b Merge branch 'vfs.idmap' into vfs=
.all Signed-off-by: Christian Brauner <brauner@kernel.org>)
CONFLICT (content): Merge conflict in fs/exfat/inode.c
Applying: fixup for "fs: Convert aops->write_end to take a folio"
$ git reset --hard HEAD^
Merging next-20240819 version of vfs-brauner
CONFLICT (content): Merge conflict in fs/exfat/inode.c
CONFLICT (content): Merge conflict in tools/testing/selftests/core/close_ra=
nge_test.c
[fs-next 83caa94409db] next-20240819/vfs-brauner
Applying: fixup for "fs: Convert aops->write_end to take a folio"
[fs-next 675987e9caa2] next-20240819/vfs-brauner
Merging vfs/for-next (a38297e3fb01 Linux 6.9)
Merging fixes/fixes (2dde18cd1d8f Linux 6.5)
Merging mm-hotfixes/mm-hotfixes-unstable (4d51e6e105d5 kexec_file: fix elfc=
orehdr digest exclusion when CONFIG_CRASH_HOTPLUG=3Dy)
Merging fs-current (9ab334e1b1b7 Merge branch 'fixes' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/xiang/erofs.git)
Merging kbuild-current/fixes (145082ebfcf0 Documentation/llvm: turn make co=
mmand for ccache into code block)
Merging arc-current/for-curr (e67572cd2204 Linux 6.9-rc6)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (f75c235565f9 arm64: Fix KASAN random ta=
g seed initialization)
Merging arm-soc-fixes/arm/fixes (6b1124c4526f Merge tag 'ti-k3-dt-fixes-for=
-v6.11' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into ar=
m/fixes)
Merging davinci-current/davinci/for-current (6613476e225e Linux 6.8-rc1)
Merging drivers-memory-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging sophgo-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging m68k-current/for-linus (21b9e722ad28 m68k: cmpxchg: Fix return valu=
e for default case in __arch_xchg())
Merging powerpc-fixes/fixes (227bbaabe64b powerpc/topology: Check if a core=
 is online)
Merging s390-fixes/fixes (de9c2c66ad8e Linux 6.11-rc2)
Merging net/main (c50e7475961c dpaa2-switch: Fix error checking in dpaa2_sw=
itch_seed_bp())
Merging bpf/master (9d5906799f7d Merge tag 'selinux-pr-20240814' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux)
Merging ipsec/master (89a2aefe4b08 xfrm: call xfrm_dev_policy_delete when k=
ill policy)
Merging netfilter/main (a0b39e2dc701 netfilter: nft_counter: Synchronize nf=
t_counter_reset() against reader.)
Merging ipvs/main (a0b39e2dc701 netfilter: nft_counter: Synchronize nft_cou=
nter_reset() against reader.)
Merging wireless/for-next (27ec3c57fcad wifi: mwifiex: duplicate static str=
ucts used in driver instances)
Merging ath/for-current (38055789d151 wifi: ath12k: use 128 bytes aligned i=
ova in transmit path for WCN7850)
Merging wpan/master (b8ec0dc3845f net: mac802154: Fix racy device stats upd=
ates by DEV_STATS_INC() and DEV_STATS_ADD())
Merging rdma-fixes/for-rc (8400291e289e Linux 6.11-rc1)
Merging sound-current/for-linus (32108c22ac61 ALSA: seq: Skip event type fi=
ltering for UMP events)
Merging sound-asoc-fixes/for-linus (a42db293e598 ASoC: SOF: amd: Fix for ac=
p init sequence)
Merging regmap-fixes/for-linus (e0ee39920027 Merge remote-tracking branch '=
regmap/for-6.10' into regmap-linus)
Merging regulator-fixes/for-linus (7c626ce4bae1 Linux 6.11-rc3)
Merging spi-fixes/for-linus (783bf5d09f86 spi: spi-fsl-lpspi: limit PRESCAL=
E bit in TCR register)
Merging pci-current/for-linus (80a2a75a2a9c Merge branch 'controller/qcom' =
into for-linus)
Merging driver-core.current/driver-core-linus (47ac09b91bef Linux 6.11-rc4)
Merging tty.current/tty-linus (47ac09b91bef Linux 6.11-rc4)
Merging usb.current/usb-linus (47ac09b91bef Linux 6.11-rc4)
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
Merging mtd-fixes/mtd/fixes (b27d8946b5ed mtd: rawnand: rockchip: ensure NV=
DDR timings are rejected)
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
Merging drivers-x86-fixes/fixes (bc923d594db2 platform/surface: aggregator:=
 Fix warning when controller is destroyed in probe)
Merging samsung-krzk-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging pinctrl-samsung-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging devicetree-fixes/dt/linus (b739dffa5d57 of/irq: Prevent device addr=
ess out-of-bounds read in interrupt map walk)
Merging dt-krzk-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging scsi-fixes/fixes (cbaac68987b8 scsi: sd: Do not attempt to configur=
e discard unless LBPME is set)
Merging drm-fixes/drm-fixes (47ac09b91bef Linux 6.11-rc4)
Merging drm-intel-fixes/for-linux-next-fixes (5d41eeb6725e drm/i915/hdcp: U=
se correct cp_irq_count)
Merging mmc-fixes/fixes (a1e627af32ed mmc: mmc_test: Fix NULL dereference o=
n allocation failure)
Merging rtc-fixes/rtc-fixes (8400291e289e Linux 6.11-rc1)
Merging gnss-fixes/gnss-linus (8400291e289e Linux 6.11-rc1)
Merging hyperv-fixes/hyperv-fixes (3b85a2eacd3d Documentation: hyperv: Add =
overview of Confidential Computing VM support)
Merging risc-v-fixes/fixes (32d5f7add080 Merge patch series "RISC-V: hwprob=
e: Misaligned scalar perf fix and rename")
Merging riscv-dt-fixes/riscv-dt-fixes (7d9d88890f04 MAINTAINERS: invert Mis=
c RISC-V SoC Support's pattern)
Merging riscv-soc-fixes/riscv-soc-fixes (8400291e289e Linux 6.11-rc1)
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
Merging rust-fixes/rust-fixes (47ac09b91bef Linux 6.11-rc4)
Merging w1-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging pmdomain-fixes/fixes (52dd070c62e4 pmdomain: imx: wait SSAR when i.=
MX93 power domain on)
Merging i2c-host-fixes/i2c/i2c-host-fixes (47ac09b91bef Linux 6.11-rc4)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (39a3396558fb clk: thead: fix dependency on clk=
_ignore_unused)
Merging pwrseq-fixes/pwrseq/for-current (a9aaf1ff88a8 power: sequencing: re=
quest the WLAN enable GPIO as-is)
Merging thead-dt-fixes/thead-dt-fixes (8400291e289e Linux 6.11-rc1)
Merging drm-misc-fixes/for-linux-next-fixes (9b340aeb26d5 nouveau/firmware:=
 use dma non-coherent allocator)
Merging mm-stable/mm-stable (7c626ce4bae1 Linux 6.11-rc3)
Merging mm-nonmm-stable/mm-nonmm-stable (7c626ce4bae1 Linux 6.11-rc3)
Merging mm/mm-everything (75bee94793d1 foo)
Merging kbuild/for-next (7809144639f6 kbuild: modinst: remove the multithre=
ad option from zstd compression)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (6236ebe07131 perf daemon: Fix the build on mo=
re 32-bit architectures)
Merging compiler-attributes/compiler-attributes (8400291e289e Linux 6.11-rc=
1)
Merging dma-mapping/for-next (bd44ca3de49c dma-debug: avoid deadlock betwee=
n dma debug vs printk and netconsole)
Merging asm-generic/master (b82c1d235a30 syscalls: add back legacy __NR_nfs=
servctl macro)
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (2ba94d53af55 Merge branches 'fixes' and 'misc' into f=
or-next)
$ git reset --hard HEAD^
Merging next-20240820 version of arm
Merging arm64/for-next/core (c459bbcd7e6c Merge branches 'for-next/acpi', '=
for-next/misc' and 'for-next/perf' into for-next/core)
Merging arm-perf/for-next/perf (7c626ce4bae1 Linux 6.11-rc3)
Merging arm-soc/for-next (6b1124c4526f Merge tag 'ti-k3-dt-fixes-for-v6.11'=
 of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into arm/fixes)
Merging amlogic/for-next (dc055bba23da Merge branch 'v6.12/drivers' into fo=
r-next)
Merging asahi-soc/asahi-soc/for-next (ffc253263a13 Linux 6.6)
Merging aspeed/for-next (995d8fe0341e ARM: dts: aspeed: System1: Updates to=
 BMC board)
Merging at91/at91-next (870c43904be2 Merge branch 'at91-defconfig' into at9=
1-next)
Merging broadcom/next (7eff0651abbb Merge branch 'soc/next' into next)
Merging davinci/davinci/for-next (973d248c43f2 ARM: davinci: remove unused =
cpuidle code)
Merging drivers-memory/for-next (67dd9e861add memory: tegra186-emc: drop un=
used to_tegra186_emc())
Merging imx-mxs/for-next (1d43464566cd Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (9dd04bf6bf1c Merge branch 'v6.11-next/dts64' int=
o for-next)
Merging mvebu/for-next (ffd0d7df6bdb Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (6cb1ac2b11b2 Merge branch 'omap-for-v6.12/drivers' i=
nto omap-reset)
Merging qcom/for-next (8fd286bf891d Merge branches 'arm32-for-6.12', 'arm64=
-defconfig-fixes-for-6.11', 'arm64-defconfig-for-6.12', 'arm64-fixes-for-6.=
11', 'arm64-for-6.12', 'clk-fixes-for-6.11', 'clk-for-6.12', 'drivers-fixes=
-for-6.11' and 'drivers-for-6.12' into for-next)
Merging renesas/next (d5dfb18787de Merge branch 'renesas-dts-for-v6.12' int=
o renesas-next)
Merging reset/reset/next (c1267e1afae6 arm64: dts: renesas: rz-smarc: Repla=
ce fixed regulator for USB VBUS)
Merging rockchip/for-next (c5d143c77327 Merge branch 'v6.12-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (0c280f9bf41c Merge branch 'next/drivers' int=
o for-next)
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
Merging ti/ti-next (140b0b1e6e77 Merge branches 'ti-drivers-soc-next' and '=
ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (0c559f8a91de drivers: soc: xilinx: add the missing=
 kfree in xlnx_add_cb_for_suspend())
Merging clk/clk-next (96e52588fb2c Merge branch 'clk-mediatek' into clk-nex=
t)
Merging clk-imx/for-next (466da3d2d967 clk: imx: composite-7ulp: Use NULL i=
nstead of 0)
Merging clk-renesas/renesas-clk (120c2833b72f clk: renesas: r8a779h0: Add C=
ANFD clock)
Merging csky/linux-next (2c40c1c6adab Merge tag 'usb-6.7-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging loongarch/loongarch-next (494b0792d962 LoongArch: KVM: Remove undef=
ined a6 argument comment for kvm_hypercall())
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
Merging powerpc/next (fa740ca82277 powerpc: Remove useless config comment i=
n asm/percpu.h)
Merging risc-v/for-next (0e3f3649d44b riscv: Enable generic CPU vulnerabili=
tes support)
Merging riscv-dt/riscv-dt-for-next (8400291e289e Linux 6.11-rc1)
Merging riscv-soc/riscv-soc-for-next (8400291e289e Linux 6.11-rc1)
Merging s390/for-next (1baaf1ccf111 Merge branch 'features' into for-next)
Applying: fixup for "s390/mm/ptdump: Generate address marker array dynamica=
lly"
Merging sh/for-next (8fe76a1c2264 sh: push-switch: Add missing MODULE_DESCR=
IPTION() macro)
Merging sparc/for-next (a3da15389112 sparc64: Fix prototype warnings in hib=
ernate.c)
Merging uml/next (98ff534ec2cd um: vector: always reset vp->opened)
Merging xtensa/xtensa-for-next (b7cf2a1d9881 xtensa: remove redundant flush=
_dcache_page and ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE macros)
Merging fs-next (675987e9caa2 next-20240819/vfs-brauner)
  f01d25bb77d1 ("scripts/decode_stacktrace.sh: nix-ify")
Merging printk/for-next (bcc954c6caba printk/panic: Allow cpu backtraces to=
 be written into ringbuffer during panic)
Merging pci/next (79b01efa89b2 Merge branch 'pci/controller/affinity')
Merging pstore/for-next/pstore (a7050ca72480 pstore/ramoops: Fix typo as th=
ere is no "reserver")
Merging hid/for-next (3e088ad7ce04 Merge branch 'for-6.12/goodix-spi' into =
for-next)
Merging i2c/i2c/for-next (e3310fb8dede Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i2c-host/i2c/i2c-host (8bc921e413c3 i2c: imx: Switch to RUNTIME_PM_=
OPS())
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
Merging pm/linux-next (5807af07cb47 Merge branch 'acpi-video' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (ea24b529e345 cpufreq: Add SM732=
5 to cpufreq-dt-platdev blocklist)
Merging cpupower/cpupower (76fb981ad677 tools/cpupower: display residency v=
alue in idle-info)
Merging devfreq/devfreq-next (1d143dde7679 PM / devfreq: exynos: Use Use de=
vm_clk_get_enabled() helpers)
Merging pmdomain/next (157519c026ec cpuidle: dt_idle_genpd: Simplify with s=
coped for each OF child loop)
Merging opp/opp/linux-next (8400291e289e Linux 6.11-rc1)
Merging thermal/thermal/linux-next (7eeb114a635a dt-bindings: thermal: conv=
ert hisilicon-thermal.txt to dt-schema)
Merging rdma/for-next (ec7ad6530909 RDMA/mlx5: Introduce GET_DATA_DIRECT_SY=
SFS_PATH ioctl)
Merging net-next/main (bc3dd9ed04d6 l2tp: use skb_queue_purge in l2tp_ip_de=
stroy_sock)
Merging bpf-next/for-next (8ccd382ffd07 Merge branch 'bpf-next/net' into fo=
r-next)
CONFLICT (content): Merge conflict in fs/coda/inode.c
Applying: fixup for "introduce fd_file(), convert all accessors to it."
Applying: fixup2 for "introduce fd_file(), convert all accessors to it."
Merging ipsec-next/master (9b49f55838b1 xfrm: Remove documentation WARN_ON =
to limit return values for offloaded SA)
Merging mlx5-next/mlx5-next (c772a2c69018 net/mlx5: Add IFC related stuff f=
or data direct)
Merging netfilter-next/main (c88baabf16d1 netfilter: nf_tables: don't initi=
alize registers in nft_do_chain())
Merging ipvs-next/main (c88baabf16d1 netfilter: nf_tables: don't initialize=
 registers in nft_do_chain())
Merging bluetooth/master (7a6abe8d0fdb Bluetooth: hci_conn: Remove redundan=
t memset after kzalloc)
CONFLICT (content): Merge conflict in drivers/bluetooth/btusb.c
Merging wireless-next/for-next (daaf0dd0398d wifi: mwifiex: keep mwifiex_cf=
g80211_ops constant)
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/hw.c
Merging ath-next/for-next (94745807f3eb wifi: ath9k_htc: Use __skb_set_leng=
th() for resetting urb before resubmit)
Merging wpan-next/master (9187210eee7d Merge tag 'net-next-6.9' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging wpan-staging/staging (9187210eee7d Merge tag 'net-next-6.9' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mtd/mtd/next (78a0b13f5744 Merge tag 'nand/for-6.11' into mtd/next)
Merging nand/nand/next (a503f91a3645 mtd: rawnand: lpx32xx: Fix dma_request=
_chan() error checks)
Merging spi-nor/spi-nor/next (b6491eb021e4 mtd: spi-nor: winbond: add Zetta=
 ZD25Q128C support)
Merging crypto/master (8e84a650079a crypto: octeontx2 - Remove custom swap =
functions in favor of built-in sort swap)
Merging drm/drm-next (a809b92ee0f8 Merge tag 'drm-intel-next-2024-08-13' of=
 https://gitlab.freedesktop.org/drm/i915/kernel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_device.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_device_types.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_submit.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_rtp.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_vm.c
Merging drm-exynos/for-linux-next (627a24f5f25d Merge tag 'amd-drm-fixes-6.=
11-2024-07-18' of https://gitlab.freedesktop.org/agd5f/linux into drm-next)
Merging drm-misc/for-linux-next (04b5b362bc2a drm/panel: jdi-fhd-r63452: tr=
ansition to mipi_dsi wrapped functions)
Merging amdgpu/drm-next (19cff16559a4 drm/amdgpu: abort KIQ waits when ther=
e is a pending reset)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/smu14/sm=
u_v14_0_2_ppt.c
Applying: fixup for "drm/amdgpu: add per ring reset support (v5)"
Merging drm-intel/for-linux-next (fbc64aafc99b drm/i915: make intel_display=
_power_domain_str() static)
Merging drm-msm/msm-next (fe34394ecdad dt-bindings: display/msm: dsi-contro=
ller-main: Add SM7150)
Merging drm-msm-lumag/msm-next-lumag (399af57ccca2 dt-bindings: display/msm=
/gpu: fix the schema being not applied)
Merging drm-xe/drm-xe-next (60db6f540af9 drm/xe: Drop HW fence pointer to H=
W fence ctx)
Merging etnaviv/etnaviv/next (704d3d60fec4 drm/etnaviv: don't block schedul=
er when GPU is still active)
Merging fbdev/for-next (8b05b12e86ff fbdev/hpfb: Fix an error handling path=
 in hpfb_dio_probe())
Merging regmap/for-next (9eeca3012ae6 Merge remote-tracking branch 'regmap/=
for-6.12' into regmap-next)
Merging sound/for-next (b29ba8f1f942 ALSA: hda/realtek: Convert existing CS=
35L56 products to use autodetect fixup function)
Merging ieee1394/for-next (9377acc34c13 firewire: ohci: fix error path to d=
etect initiated reset in TI TSB41BA3D phy)
Merging sound-asoc/for-next (aaf55d12fb51 ASoC: dt-bindings: Convert tpa613=
0a2.txt to yaml)
Merging modules/modules-next (f94ce04e5403 module: Clean up the description=
 of MODULE_SIG_<type>)
Merging input/next (105a0c76fd0c Input: colibri-vf50-ts - make use of the h=
elper function dev_err_probe())
CONFLICT (modify/delete): drivers/input/touchscreen/cyttsp4_core.c deleted =
in input/next and modified in HEAD.  Version HEAD of drivers/input/touchscr=
een/cyttsp4_core.c left in tree.
$ git rm -f drivers/input/touchscreen/cyttsp4_core.c
Merging block/for-next (611c88af494f Merge branch 'for-6.12/io_uring' into =
for-next)
Merging device-mapper/for-next (8dd5000d9dff dm: Remove unused declaration =
and empty definition "dm_zone_map_bio")
Merging libata/for-next (66afec7c6992 ata: ahci_imx: Fix error code in prob=
e())
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (5cc5d08b873d mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (d94fc0f04121 dt-bindings: mfd: mediatek: Add code=
c property for MT6357 PMIC)
Merging backlight/for-backlight-next (fea88a13a5d1 backlight: l4f00242t03: =
Add check for spi_setup)
Merging battery/for-next (8400291e289e Linux 6.11-rc1)
Merging regulator/for-next (88e01f1bd4b9 Merge remote-tracking branch 'regu=
lator/for-6.12' into regulator-next)
Merging security/next (7dfb6ffb7d4c lsm: replace indirect LSM hook calls wi=
th static calls)
Merging apparmor/apparmor-next (8400291e289e Linux 6.11-rc1)
Merging integrity/next-integrity (fa8a4ce432e8 ima: fix buffer overrun in i=
ma_eventdigest_init_common)
Merging selinux/next (05da3fe161e9 Automated merge of 'dev' into 'next')
Merging smack/next (e86cac0acdb1 smack: unix sockets: fix accept()ed socket=
 label)
Merging tomoyo/master (dc1c8034e31b minmax: simplify min()/max()/clamp() im=
plementation)
Merging tpmdd/next (5e1c39cbccba tpm: ibmvtpm: Call tpm2_sessions_init() to=
 initialize session support)
Merging watchdog/master (7c626ce4bae1 Linux 6.11-rc3)
Merging iommu/next (91fe40d93ec3 Merge branches 'fixes', 'amd/amd-vi' and '=
core' into next)
Merging audit/next (8400291e289e Linux 6.11-rc1)
Merging devicetree/for-next (ee74817b0d66 ASoC: dt-bindings: serial-midi: r=
eference serial-peripheral-props.yaml)
Merging dt-krzk/for-next (08fd3b6e0df4 Merge branch 'next/dt64' into for-ne=
xt)
Merging mailbox/for-next (a8bd68e4329f mailbox: mtk-cmdq: Move devm_mbox_co=
ntroller_register() after devm_pm_runtime_enable())
Merging spi/for-next (7e2de823e080 Merge remote-tracking branch 'spi/for-6.=
12' into spi-next)
Merging tip/master (2c227ab41750 Merge branch into tip/master: 'x86/timers')
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
Merging kvm-arm/next (1541ef1a8194 Merge branch kvm-arm64/tlbi-fixes-6.12 i=
nto kvmarm-master/next)
Merging kvms390/next (7816e58967d0 kvm: s390: Reject memory region operatio=
ns for ucontrol VMs)
Merging kvm-ppc/topic/ppc-kvm (9739ff4887c7 KVM: PPC: Book3S HV: Refactor H=
FSCR emulation for KVM guests)
Merging kvm-riscv/riscv_kvm_next (dd4a799bcc13 KVM: riscv: selftests: Fix c=
ompile error)
Merging kvm-x86/next (332d2c1d713e crypto: ccp: Add the SNP_VLEK_LOAD comma=
nd)
Merging xen-tip/linux-next (4c006734898a x86/xen: fix memblock_reserve() us=
age on PVH)
Merging percpu/for-next (2d9ad81ef935 Merge branch 'for-6.8-fixes' into for=
-next)
Merging workqueues/for-next (22de962e8a69 Merge branch 'for-6.12' into for-=
next)
Merging sched-ext/for-next (89909296a51e sched_ext: Don't use double lockin=
g to migrate tasks across CPUs)
Merging drivers-x86/for-next (6c1fa8edfef8 platform/x86: ideapad-laptop: mo=
ve ACPI helpers from header to source file)
Merging chrome-platform/for-next (a1927fbbf74f platform/chrome: cros_ec_typ=
ec: add remove driver hook)
Merging chrome-platform-firmware/for-firmware-next (8400291e289e Linux 6.11=
-rc1)
Merging hsi/for-next (f02cfe695047 HSI: ssi_protocol: Remove unused linux/g=
pio.h)
Merging leds-lj/for-leds-next (6eefd65ba6ae leds: pca995x: Use device_for_e=
ach_child_node() to access device child nodes)
Merging ipmi/for-next (0108b7be2a18 Merge tag 'for-linus-iommufd' of git://=
git.kernel.org/pub/scm/linux/kernel/git/jgg/iommufd)
Merging driver-core/driver-core-next (87ee9981d1f8 Merge 6.11-rc4 into driv=
er-core-next)
Merging usb/usb-next (ca7df2c7bb5f Merge 6.11-rc4 into usb-next)
Merging thunderbolt/next (47ac09b91bef Linux 6.11-rc4)
Merging usb-serial/usb-next (da74a5100a2b USB: serial: drop driver owner in=
itialization)
Merging tty/tty-next (ebbe30f4bba1 Merge 6.11-rc4 into tty-next)
Merging char-misc/char-misc-next (10c8d1bd7865 Merge 6.11-rc4 into char-mis=
c-next)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (c58dc5a1f886 coresight: tmc: sg: Do not leak sg_tab=
le)
Merging fastrpc/for-next (590c42d9e278 misc: fastrpc: Add support for cdsp1=
 remoteproc)
Merging fpga/for-next (8de36789bd03 fpga: zynq-fpga: Rename 'timeout' varia=
ble as 'time_left')
Merging icc/icc-next (226e58b20975 Merge branch 'icc-rpmh-qos' into icc-nex=
t)
Merging iio/togreg (0f718e10da81 iio: ABI: add missing calibbias attributes)
Merging phy-next/next (c4b09c562086 phy: phy-rockchip-samsung-hdptx: Add cl=
ock provider support)
Merging soundwire/next (5aedb8d8336b soundwire: intel_bus_common: enable in=
terrupts before exiting reset)
Merging extcon/extcon-next (e508f2606c0b extcon: Add LC824206XA microUSB sw=
itch driver)
Merging gnss/gnss-next (8400291e289e Linux 6.11-rc1)
Merging vfio/next (0756bec2e45b vfio-mdev: add missing MODULE_DESCRIPTION()=
 macros)
Merging w1/for-next (e940ff286ec4 w1: ds2482: Drop explicit initialization =
of struct i2c_device_id::driver_data to 0)
Merging spmi/spmi-next (7c626ce4bae1 Linux 6.11-rc3)
Merging staging/staging-next (d727f0217ad6 Staging: rtl8192e: Rename variab=
le nSubframe_Length)
Merging counter-next/counter-next (8400291e289e Linux 6.11-rc1)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (44c026a73be8 Linux 6.4-rc3)
Merging dmaengine/next (0204485c5a1e dt-bindings: fsl-qdma: allow compatibl=
e string fallback to fsl,ls1021a-qdma)
Merging cgroup/for-next (d8454758e6e4 Merge branch 'for-6.12' into for-next)
Merging scsi/for-next (580d1a3e1560 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (3ba963597d19 scsi: ufs: ufshcd-pltfrm: Signednes=
s bug in ufshcd_parse_clock_info())
Merging vhost/linux-next (d820e8fcea38 net: virtio: unify code to init stat=
s)
Merging rpmsg/for-next (1a491aaf1d1c Merge branches 'rproc-next', 'rpmsg-ne=
xt' and 'hwspinlock-next' into for-next)
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (4b91188dced8 gpiolib: Replace gpio_suffix_=
count with NULL-terminated array)
Merging gpio-intel/for-next (8400291e289e Linux 6.11-rc1)
Merging pinctrl/for-next (6fb214cdf7df Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (47ac09b91bef Linux 6.11-rc4)
Merging pinctrl-renesas/renesas-pinctrl (f73f63b24491 pinctrl: renesas: rzg=
2l: Use dev_err_probe())
Merging pinctrl-samsung/for-next (e61f1a729da8 pinctrl: samsung: Add suppor=
t for pull-up and pull-down)
Merging pwm/pwm/for-next (861a4272660a pwm: lp3943: Fix an incorrect type i=
n lp3943_pwm_parse_dt())
Merging ktest/for-next (07283c1873a4 ktest: force $buildonly =3D 1 for 'mak=
e_warnings_file' test type)
Merging kselftest/next (41f37c852ac3 selftests/ftrace: Add required depende=
ncy for kprobe tests)
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
Merging hyperv/hyperv-next (f2580a907e5c x86/hyperv: Use Hyper-V entropy to=
 seed guest random number generator)
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
Merging slab/slab/for-next (248081776627 Merge branch 'slab/for-6.12/rcu_ba=
rriers' into slab/for-next)
CONFLICT (content): Merge conflict in kernel/rcu/tree.c
Merging random/master (c86927f528a8 selftests/vDSO: don't #include sodium h=
eader in chacha test)
Merging landlock/next (ad1b27fc9877 Landlock: Document LANDLOCK_SCOPED_ABST=
RACT_UNIX_SOCKET and ABI versioning)
Merging rust/rust-next (e26fa546042a rust: kbuild: auto generate helper exp=
orts)
Merging sysctl/sysctl-next (acc154691fc7 sysctl: Warn on an empty procname =
element)
Merging execve/for-next/execve (44f65d900698 binfmt_elf: mseal address zero)
CONFLICT (content): Merge conflict in fs/binfmt_elf.c
Merging bitmap/bitmap-for-next (54c9e0085bd1 nodemask: Switch from inline t=
o __always_inline)
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (05269aaef889 Merge branches 'for-next/hardening=
' and 'for-linus/hardening' into for-next/kspp)
Merging kspp-gustavo/for-next/kspp (6613476e225e Linux 6.8-rc1)
Merging nolibc/nolibc (8400291e289e Linux 6.11-rc1)
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (4be8b00b2b0f iommufd: Reorder include files)
CONFLICT (content): Merge conflict in drivers/iommu/iommufd/selftest.c
Merging turbostat/next (75879bd898ee tools/power turbostat: fix GCC9 build =
regression)
Merging pwrseq/pwrseq/for-next (b8e4b0529d59 power: sequencing: qcom-wcn: a=
dd support for the WCN6855 PMU)
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)

--Sig_/QeBQsq2NEFR9bZm1GEu.6Vm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbFZMEACgkQAVBC80lX
0GwTBgf/QdrQCodL2Zrvl0LUH600cOTBFsM/Cn3rJhdYfsrQF2MfsGKAnm7UHMYS
QWMNhsHsej4uBqM0C6VjZF4Y5bgeJqAmJK9BpD4kdtHHy2C7KjDq21EBiNOytkpM
pzX+6kgCjNqCs8oAiMhsFu1dAEVJQzf5HtJmEv7x85jR1WOgGG0nUPflmLKPYldt
MqBBp7NT/QbR8QN4bVCBPT/NAoAfLO7CK/UdZJ8u+NIkZBVpNJ+qxnzTwXW44uyR
C7rawX/YsZc65pUXuV5ayYFifnIByN4cJK0rhQ6D8j7ln4I3FCtYYw/Q1q/Vl3fz
PxIkjDCQoKPJUO7OZ8N68tb2CHxvzg==
=NrwM
-----END PGP SIGNATURE-----

--Sig_/QeBQsq2NEFR9bZm1GEu.6Vm--

