Return-Path: <linux-next+bounces-9391-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A525CB77AE
	for <lists+linux-next@lfdr.de>; Fri, 12 Dec 2025 01:49:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B36C63002FDC
	for <lists+linux-next@lfdr.de>; Fri, 12 Dec 2025 00:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E03323EA97;
	Fri, 12 Dec 2025 00:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pPhoFqNz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220F623184A;
	Fri, 12 Dec 2025 00:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765500589; cv=none; b=CsH110j7DBbqmjvCTnmqfvgl43jZlXJ1s6kvaT6Ef5qZSIX13CQvsSCN7PvJFpcGgcUZdfxPRCf6qGvWZvnBGUB/yxErAOlhZAKBZ6tU7r/hzQgENs8H1/6WNBTVNp1h1KEftO14c44xfAZsgMeTj5c6fxjhARw0jRs9cz0ZkCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765500589; c=relaxed/simple;
	bh=jDv7aEoVnWCbHo9tIV+aRaShgoYe4/TW4K5xP3ws6oU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=onYh9bL1JkiM/pypq3vOTq3HWfYG7sPmYp5irtbPEkkY25paW0dECyLaKqClJetxcclldcudJ75GPMT514ZyXS67hJzdyyl9qywaRC6364F+FJdBtC1rYBke8lYuXwz6PnOg7hfZAwhOeB99z1QA/+79q98LsiDynzb4cHyKpgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pPhoFqNz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1765500572;
	bh=30ESKJKCOYdkuJaikfZEBAc9U8g6FL79OOMZIxj70BM=;
	h=Date:From:To:Cc:Subject:From;
	b=pPhoFqNzJWgHK2y1b2rPcpjBqNRMRohSaqYoLn+YloMv7KEzwP4GQ+Qs7qVUx2Rx5
	 COSu7miPB7MR/YG1iWmauKJxUg36YkEC0PGlWjzBp/6c2QpTooj7CE33rBNrZnTcpH
	 Fc6y/rtOrJFszeIOIKCgl3tPf+f76BmL3cbEnqFPe0p0L8RDqNMcaGwImuMZQMHHm1
	 YUvy0OA1JeVWLsr/Eiuw6GC1b4YR3HhZw17jHyWHVFWaNY4PCF8gekFm9/RhQdzC28
	 GutdwDZ87cWvprjT91yAAwwlbI8I7hl7mJds2bOWGHRb78CZdpKVVFVSRbxda1GBsa
	 VbsoE5iJDOI+Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dS9p465RYz4wD7;
	Fri, 12 Dec 2025 11:49:32 +1100 (AEDT)
Date: Fri, 12 Dec 2025 11:49:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Dec 12
Message-ID: <20251212114932.4b916c34@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1m3m_eEgEAikYY/lT6NS9bl";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1m3m_eEgEAikYY/lT6NS9bl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The merge window is open, so please to not add any v6.20 (v7.0?) material
to your linux-next included branches until after the merge window closes.

Changes since 20251211:

The mailbox tree lost its build failure.

Non-merge commits (relative to Linus' tree): 1008
 1118 files changed, 112380 insertions(+), 13143 deletions(-)

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

I am currently merging 407 trees (counting Linus' and 121 trees of bug
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
Merging origin/master (d358e5254674 Merge tag 'for-6.19/dm-changes' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging ext4-fixes/fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging vfs-brauner-fixes/vfs.fixes (fe93446b5ebd vfs: use UAPI types for n=
ew struct delegation definition)
Merging fscrypt-current/for-current (1e39da974ce6 fscrypt: fix left shift u=
nderflow when inode->i_blkbits > PAGE_SHIFT)
Merging fsverity-current/for-current (211ddde0823f Linux 6.18-rc2)
Merging btrfs-fixes/next-fixes (df1fc7645847 Merge branch 'misc-6.19' into =
next-fixes)
Merging vfs-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging erofs-fixes/fixes (f2a12cc3b97f erofs: avoid infinite loop due to i=
ncomplete zstd-compressed data)
Merging nfsd-fixes/nfsd-fixes (ebae102897e7 nfsd: Mark variable __maybe_unu=
sed to avoid W=3D1 build break)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (e8bd877fb76b ovl: fix possible double un=
link)
Merging fscrypt/for-next (211ddde0823f Linux 6.18-rc2)
Merging btrfs/for-next (9e0e6577b3e5 btrfs: remove unnecessary inode key in=
 btrfs_log_all_parents())
Merging ceph/master (21c1466ea251 rbd: stop selecting CRC32, CRYPTO, and CR=
YPTO_AES)
Merging cifs/for-next (ab0347e67dac smb/client: remove DeviceType Flags and=
 Device Characteristics definitions)
Merging configfs/configfs-next (f7f78098690d configfs: Constify ct_item_ops=
 in struct config_item_type)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (8e4021078863 dlm: check for undefined release_option valu=
es)
Merging erofs/dev (0bdbf89a8bbe erofs: switch on-disk header `erofs_fs.h` t=
o MIT license)
Merging exfat/dev (f5a5c9b40490 fs: exfat: improve error code handling in e=
xfat_find_empty_entry())
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (25554ea0b42b Pull udf extent block verification.)
Merging ext4/dev (6fb67ac89690 ext4: drop the TODO comment in ext4_es_inser=
t_extent())
Merging f2fs/dev (cb015814f8b6 Merge tag 'f2fs-for-6.19-rc1' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs)
Merging fsverity/for-next (211ddde0823f Linux 6.18-rc2)
Merging fuse/for-next (8da059f2a497 fuse: Uninitialized variable in fuse_ep=
och_work())
Merging gfs2/for-next (c2ffb7a0cb4a gfs: Use fixed GL_GLOCK_MIN_HOLD time)
Merging jfs/jfs-next (eb0cfcf26571 jfs: Add missing set_freezable() for fre=
ezable kthread)
Merging ksmbd/ksmbd-for-next (2e0d224d8988 smb/server: add comment to FileS=
ystemName of FileFsAttributeInformation)
Merging nfs/linux-next (bd3b04b46c7a NFSv4: Handle NFS4ERR_NOTSUPP errors f=
or directory delegations)
Merging nfs-anna/linux-next (b623390045a8 NFS: Fix LTP test failures when t=
imestamps are delegated)
Merging nfsd/nfsd-next (c2f2b01b74be Merge tag 'i3c/for-6.19' of git://git.=
kernel.org/pub/scm/linux/kernel/git/i3c/linux)
Merging ntfs3/master (1b2ae190ea43 fs/ntfs3: check for shutdown in fsync)
Merging orangefs/for-next (11f6bce77e27 fs/orangefs: Replace kzalloc + copy=
_from_user with memdup_user_nul)
Merging overlayfs/overlayfs-next (ad1423922781 ovl: make sure that ovl_crea=
te_real() returns a hashed dentry)
Merging ubifs/next (0695aef23d67 ubifs: vmalloc(array_size()) -> vmalloc_ar=
ray())
Merging v9fs/9p-next (3e281113f871 9p: fix new mount API cache option handl=
ing)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (79c47bc68efb Merge branch 'xfs-6.19-merge' into for-n=
ext)
Merging zonefs/for-next (a42938e80357 zonefs: correct some spelling mistake=
s)
Merging vfs-brauner/vfs.all (5b629fa4cc9b Merge branch 'vfs.fixes' into vfs=
.all)
Merging vfs/for-next (eb028c33451a d_make_discardable(): warn if given a no=
n-persistent dentry)
Merging mm-hotfixes/mm-hotfixes-unstable (e540489acb50 kasan-unpoison-vms-a=
ddresses-with-a-common-tag-v4)
Merging fs-current (49e73452c673 Merge branch 'nfsd-fixes' of https://git.k=
ernel.org/pub/scm/linux/kernel/git/cel/linux)
Merging kbuild-current/kbuild-fixes (4ab2ee307983 kbuild: install-extmod-bu=
ild: Properly fix CC expansion when ccache is used)
Merging arc-current/for-curr (d7b8f8e20813 Linux 6.16-rc5)
Merging arm-current/fixes (fd2dee1c6e22 ARM: fix branch predictor hardening)
Merging arm64-fixes/for-next/fixes (165eb13e485c arm64: proton-pack: Fix ha=
rd lockup when !MITIGATE_SPECTRE_BRANCH_HISTORY)
Merging arm-soc-fixes/arm/fixes (e9191383d28d Merge tag 'sunxi-fixes-for-6.=
18' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into arm=
/fixes)
Merging davinci-current/davinci/for-current (3a8660878839 Linux 6.18-rc1)
Merging drivers-memory-fixes/fixes (6f37469a9330 memory: tegra210: Fix inco=
rrect client ids)
Merging sophgo-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging sophgo-soc-fixes/soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging m68k-current/for-linus (aaf4e92341b0 m68k: defconfig: Update defcon=
figs for v6.18-rc1)
Merging powerpc-fixes/fixes (0843ba458439 powerpc/fadump: skip parameter ar=
ea allocation when fadump is disabled)
Merging s390-fixes/fixes (51d90a15fedf Merge tag 'for-linus' of git://git.k=
ernel.org/pub/scm/virt/kvm/kvm)
Merging net/main (885bebac9909 nfc: pn533: Fix error code in pn533_acr122_p=
oweron_rdr())
Merging bpf/master (1d528e794f3d Merge branch 'bpf-fix-bpf_d_path-helper-pr=
ototype')
Merging ipsec/master (3d5221af9c77 xfrm: Fix inner mode lookup in tunnel mo=
de GSO segmentation)
Merging netfilter/main (885bebac9909 nfc: pn533: Fix error code in pn533_ac=
r122_poweron_rdr())
Merging ipvs/main (de0337d641bf net: ionic: map SKB after pseudo-header che=
cksum prep)
Merging wireless/for-next (0ff8eeafba5c Merge tag 'rtw-2025-11-20' of https=
://github.com/pkshih/rtw)
Merging ath/for-current (d0309c054362 Merge tag 'net-6.18-rc6' of git://git=
.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging iwlwifi/fixes (1a222625b468 wifi: iwlwifi: mld: always take beacon =
ies in link grading)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (ac3fd01e4c1e Linux 6.18-rc7)
Merging sound-current/for-linus (fd324768eb2c ALSA: hda/tas2781: Add new qu=
irk for HP new project)
Merging sound-asoc-fixes/for-linus (c8d8605fc53e Merge remote-tracking bran=
ch 'asoc/for-6.18' into asoc-linus)
Merging regmap-fixes/for-linus (6146a0f1dfae Linux 6.18-rc4)
Merging regulator-fixes/for-linus (56edaa508ed2 Merge remote-tracking branc=
h 'regulator/for-6.18' into regulator-linus)
Merging spi-fixes/for-linus (865a1f17d5e4 Merge remote-tracking branch 'spi=
/for-6.18' into spi-linus)
Merging pci-current/for-linus (94bf74830a97 PCI: rzg3s-host: Initialize MSI=
 status bitmap before use)
Merging driver-core.current/driver-core-linus (d358e5254674 Merge tag 'for-=
6.19/dm-changes' of git://git.kernel.org/pub/scm/linux/kernel/git/device-ma=
pper/linux-dm)
Merging tty.current/tty-linus (d358e5254674 Merge tag 'for-6.19/dm-changes'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging usb.current/usb-linus (d358e5254674 Merge tag 'for-6.19/dm-changes'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging usb-serial-fixes/usb-linus (523bf0a59e67 USB: serial: option: add s=
upport for Rolling RW101R-GL)
Merging phy/fixes (3a8660878839 Linux 6.18-rc1)
Merging staging.current/staging-linus (d358e5254674 Merge tag 'for-6.19/dm-=
changes' of git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/lin=
ux-dm)
Merging iio-fixes/fixes-togreg (74f97a468356 iio: adc: at91-sama5d2_adc: Fi=
x potential use-after-free in sama5d2_adc driver)
Merging counter-current/counter-current (109ff654934a counter: microchip-tc=
b-capture: Allow shared IRQ for multi-channel TCBs)
Merging char-misc.current/char-misc-linus (d358e5254674 Merge tag 'for-6.19=
/dm-changes' of git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper=
/linux-dm)
Merging soundwire-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging thunderbolt-fixes/fixes (7d0a66e4bb90 Linux 6.18)
Merging input-current/for-linus (429c4727011e Merge branch 'next' into for-=
linus)
Merging crypto-current/master (48bc9da3c97c crypto: zstd - fix double-free =
in per-CPU stream cleanup)
Merging libcrypto-fixes/libcrypto-fixes (f6a458746f90 crypto: arm64/ghash -=
 Fix incorrect output from ghash-neon)
Merging vfio-fixes/for-linus (d323ad739666 vfio: selftests: replace iova=3D=
vaddr with allocated iovas)
Merging kselftest-fixes/fixes (dd4adb986a86 selftests/tracing: Run sample e=
vents to clear page cache events)
Merging dmaengine-fixes/fixes (f52c6c5eb159 dmaengine: ti: k3-udma: fix dev=
ice leak on udma lookup)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (97315e7c901a mtd: onenand: Pass correct pointe=
r to IRQ handler)
Merging mfd-fixes/for-mfd-fixes (3a8660878839 Linux 6.18-rc1)
Merging v4l-dvb-fixes/fixes (27afd6e066cf media: videobuf2: forbid remove_b=
ufs when legacy fileio is active)
Merging reset-fixes/reset/fixes (997c06330fd5 reset: imx8mp-audiomix: Fix b=
ad mask values)
Merging mips-fixes/mips-fixes (7d0a66e4bb90 Linux 6.18)
Merging at91-fixes/at91-fixes (3a8660878839 Linux 6.18-rc1)
Merging omap-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging kvm-fixes/master (32bd348be3fa KVM: Fix last_boosted_vcpu index ass=
ignment bug)
Merging kvms390-fixes/master (5f9df945d4e8 KVM: s390: Fix FOLL_*/FAULT_FLAG=
_* confusion)
Merging hwmon-fixes/hwmon (cb015814f8b6 Merge tag 'f2fs-for-6.19-rc1' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs)
Merging nvdimm-fixes/libnvdimm-fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging cxl-fixes/fixes (214291cbaace acpi/hmat: Fix lockdep warning for hm=
em_register_resource())
Merging dma-mapping-fixes/dma-mapping-fixes (31b931bebd11 dma-mapping: Fix =
DMA_BIT_MASK() macro being broken)
Merging drivers-x86-fixes/fixes (9d588a1140b9 Merge tag 'platform-drivers-x=
86-v6.19-1' of git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform=
-drivers-x86)
Merging samsung-krzk-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging pinctrl-samsung-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging devicetree-fixes/dt/linus (3a058541627a cpufreq: dt-platdev: Fix cr=
eating device on OPPv1 platforms)
Merging dt-krzk-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging scsi-fixes/fixes (90449f2d1e1f scsi: sg: Do not sleep in atomic con=
text)
Merging drm-fixes/drm-fixes (7d0a66e4bb90 Linux 6.18)
Merging drm-intel-fixes/for-linux-next-fixes (7d0a66e4bb90 Linux 6.18)
Merging mmc-fixes/fixes (6cd5045ad470 dt-bindings: mmc: sdhci-of-aspeed: Sw=
itch ref to sdhci-common.yaml)
Merging rtc-fixes/rtc-fixes (162f24cbb0f6 rtc: rx8025: fix incorrect regist=
er reference)
Merging gnss-fixes/gnss-linus (dcb6fa37fd7b Linux 6.18-rc3)
Merging hyperv-fixes/hyperv-fixes (3a8660878839 Linux 6.18-rc1)
Merging risc-v-fixes/fixes (e2285bd4a467 riscv: fix KUnit test_kprobes cras=
h when building with Clang)
Merging riscv-dt-fixes/riscv-dt-fixes (5ef13c363640 riscv: dts: microchip: =
remove BeagleV Fire fabric.dtsi)
Merging riscv-soc-fixes/riscv-soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging spdx/spdx-linus (d358e5254674 Merge tag 'for-6.19/dm-changes' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging gpio-brgl-fixes/gpio/for-current (ea513dd3c066 gpio: shared: make l=
ocking more fine-grained)
Merging gpio-intel-fixes/fixes (6a23ae0a96a6 Linux 6.18-rc6)
Merging pinctrl-intel-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging auxdisplay-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging kunit-fixes/kunit-fixes (f3903ec76ae6 MAINTAINERS: Update KUnit ema=
il address for Rae Moar)
Merging memblock-fixes/fixes (c42af83c59b6 memblock: fix memblock_estimated=
_nr_free_pages() for soft-reserved memory)
Merging renesas-fixes/fixes (379c590113ce ARM: shmobile: smp: Enforce shmob=
ile_smp_* alignment)
Merging perf-current/perf-tools (2eeb09fe1c51 libperf: Use 'extern' in LIBP=
ERF_API visibility macro)
Merging efi-fixes/urgent (e5f0a698b34e Linux 6.17)
Merging battery-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging iommufd-fixes/for-rc (b07bf253ef8e iommufd/iommufd_private.h: Avoid=
 -Wflex-array-member-not-at-end warning)
Merging rust-fixes/rust-fixes (559e608c4655 Merge tag 'ntfs3_for_6.19' of h=
ttps://github.com/Paragon-Software-Group/linux-ntfs3)
Merging w1-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging pmdomain-fixes/fixes (c98c99d5dbdf pmdomain: tegra: Add GENPD_FLAG_=
NO_STAY_ON flag)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (3c493b524ffd Merge tag 'sunxi-clk-fixes-for-6.=
18' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into clk=
-fixes)
Merging thead-clk-fixes/thead-clk-fixes (3a8660878839 Linux 6.18-rc1)
Merging pwrseq-fixes/pwrseq/for-current (3a8660878839 Linux 6.18-rc1)
Merging thead-dt-fixes/thead-dt-fixes (3a8660878839 Linux 6.18-rc1)
Merging ftrace-fixes/ftrace/fixes (1650a1b6cb1a fgraph: Check ftrace_pids_e=
nabled on registration for early filtering)
Merging ring-buffer-fixes/ring-buffer/fixes (b042fdf18e89 tracing: Fix WARN=
_ON in tracing_buffers_mmap_close for split VMAs)
Merging trace-fixes/trace/fixes (2c22361ab628 MAINTAINERS: Add tracepoint-u=
pdate.c to TRACING section)
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging tip-fixes/tip/urgent (097fc16ddca6 Merge branch into tip/master: 'x=
86/urgent')
Merging slab-fixes/slab/for-next-fixes (53ca00a19d34 mm/slub: reset KASAN t=
ag in defer_free() before accessing freed memory)
Merging drm-msm-fixes/msm-fixes (f5d079564c44 drm/msm/dpu: Fix adjusted mod=
e clock check for 3d merge)
Merging uml-fixes/fixes (df447a3b4a4b um: Fix FD copy size in os_rcv_fd_msg=
())
Merging fwctl-fixes/for-rc (211ddde0823f Linux 6.18-rc2)
Merging devsec-tsm-fixes/fixes (fba4ceaa242d configfs-tsm-report: Fix NULL =
dereference of tsm_ops)
Merging drm-rust-fixes/drm-rust-fixes (211ddde0823f Linux 6.18-rc2)
Merging tenstorrent-dt-fixes/tenstorrent-dt-fixes (3a8660878839 Linux 6.18-=
rc1)
Merging drm-misc-fixes/for-linux-next-fixes (6cb31fba137d drm/mgag200: Fix =
big-endian support)
Merging mm-stable/mm-stable (dafdba0964bd mm/damon/tests/core-kunit: avoid =
damos_test_commit stack warning)
Merging mm-nonmm-stable/mm-nonmm-stable (601cc399a010 mm: memfd_luo: add CO=
NFIG_SHMEM dependency)
Merging mm-unstable/mm-unstable (f233a43c8ad7 mm/damon/vaddr: fix missing p=
te_unmap_unlock in damos_va_migrate_pmd_entry())
Merging mm-nonmm-unstable/mm-nonmm-unstable (c792b028db47 tests/liveupdate:=
 add in-kernel liveupdate test)
Merging kbuild/kbuild-next (2a9c8c0b59d3 kbuild: add target to build a cpio=
 containing modules)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (cb015814f8b6 Merge tag 'f2fs-for-6.19-rc1' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (131971f67e25 dma-mapping: remove =
unused map_page callback)
Merging asm-generic/master (edcc8a38b5ac once: fix race by moving DO_ONCE t=
o separate section)
Merging alpha/alpha-next (d58041d2c63e MAINTAINERS: Add Magnus Lindholm as =
maintainer for alpha port)
Merging arm/for-next (dd9143371a86 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (edde060637b9 Merge branch 'for-next/set_memory=
' into for-next/core)
Merging arm-perf/for-next/perf (e6a27290d800 perf: arm_spe: Add support for=
 filtering on data source)
Merging arm-soc/for-next (e5b2299997d3 soc: document merges)
Merging amlogic/for-next (3b2ecf0c3cc3 Merge branch 'v6.19/drivers' into fo=
r-next)
Merging asahi-soc/asahi-soc/for-next (5d21b7ca05c8 Merge branch 'apple-soc/=
drivers-6.19' into asahi-soc/for-next)
Merging at91/at91-next (fde90d654751 Merge branch 'at91-dt' into at91-next)
Merging bmc/for-next (a452f0ffe50b Merge branch 'aspeed/arm/dt' into for-ne=
xt)
Merging broadcom/next (37c3a91e9730 arm64: dts: broadcom: bcm2712: Add watc=
hdog DT node)
Merging cix/for-next (4889f68b824d Merge remote-tracking branch 'cix/dt' in=
to for-next)
Merging davinci/davinci/for-next (3a8660878839 Linux 6.18-rc1)
Merging drivers-memory/for-next (84ac371ee4b3 Merge branch 'mem-ctrl-next' =
into for-next)
Merging fsl/soc_fsl (40657ab03e20 bus: fsl-mc: Cope for unbound devices in =
fsl_mc_shutdown)
Merging imx-mxs/for-next (89d95dbad2a3 Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (67ed5843a67b Merge branch 'v6.18-next/dts64' int=
o for-next)
Merging mvebu/for-next (f0e6bc0c3ef4 clk: mvebu: cp110 add CLK_IGNORE_UNUSE=
D to pcie_x10, pcie_x11 & pcie_x4)
Merging omap/for-next (2c85858e7c68 Merge branch 'omap-for-v6.19/drivers' i=
nto tmp/omap-next-20251117.085514)
Merging qcom/for-next (82ed018b3df9 Merge branches 'arm32-fixes-for-6.19', =
'arm64-defconfig-for-6.19', 'arm64-fixes-for-6.19', 'clk-for-6.19' and 'dri=
vers-for-6.19' into for-next)
Merging renesas/next (fbec5d4783d5 Merge branches 'renesas-drivers-for-v6.1=
9' and 'renesas-dts-for-v6.19' into renesas-next)
Merging reset/reset/next (a0d57f7504b6 reset: gpio: add the "compatible" pr=
operty)
Merging rockchip/for-next (8e0b927d5848 Merge branch 'v6.19-clk/next' into =
for-next)
Merging samsung-krzk/for-next (bca42080637c Merge branch 'next/drivers-late=
' into for-next)
Merging scmi/for-linux-next (e5db90f4c044 Merge branch 'for-next/ffa/update=
s' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux=
 into for-linux-next)
Merging sophgo/for-next (c7f013d4c8c0 Merge branch 'dt/riscv' into for-next)
Merging sophgo-soc/soc-for-next (c8754c7deab4 soc: sophgo: cv1800: rtcsys: =
New driver (handling RTC only))
Merging spacemit/for-next (5a97a38c2279 riscv: dts: spacemit: define all mi=
ssing I2C controller nodes)
Merging stm32/stm32-next (a6961e2ced51 arm64: dts: st: set RIFSC as an acce=
ss controller on stm32mp21x platforms)
Merging sunxi/sunxi/for-next (ef541cc2e208 Merge branch 'sunxi/fixes-for-6.=
18' into sunxi/for-next)
Merging tee/next (eb4bb32c8117 Merge branch 'qcomtee_fixes_for_6.18' into n=
ext)
Merging tegra/for-next (e016a50e00e6 Merge branch for-6.19/arm64/defconfig =
into for-next)
Merging tenstorrent-dt/tenstorrent-dt-for-next (a71e6e8eea8a riscv: defconf=
ig: Enable Tenstorrent SoCs)
Merging thead-dt/thead-dt-for-next (d8a174babf64 riscv: dts: thead: Add res=
et controllers of more subsystems for TH1520)
Merging ti/ti-next (34729c8b27fd Merge branch 'ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (a35dc981c5d8 Merge branch 'zynqmp/defconfig' into =
for-next)
Merging clk/clk-next (6f172175b6f3 Merge branches 'clk-visconti', 'clk-imx'=
, 'clk-microchip', 'clk-rockchip' and 'clk-qcom' into clk-next)
Merging clk-imx/for-next (fdc1dc7dd53b clk: imx: add driver for imx8ulp's s=
im lpav)
Merging clk-renesas/renesas-clk (5fb2f67341bd clk: renesas: r9a09g077: Add =
SPI module clocks)
Merging thead-clk/thead-clk-for-next (3a8660878839 Linux 6.18-rc1)
Merging csky/linux-next (817d21578d51 csky: Remove compile warning for CONF=
IG_SMP)
Merging loongarch/loongarch-next (be77cf43d2fd LoongArch: Adjust default co=
nfig files for 32BIT/64BIT)
Merging m68k/for-next (aaf4e92341b0 m68k: defconfig: Update defconfigs for =
v6.18-rc1)
Merging m68knommu/for-next (ac3fd01e4c1e Linux 6.18-rc7)
Merging microblaze/next (7f7072574127 Merge tag 'kbuild-6.18-1' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/kbuild/linux)
Merging mips/mips-next (2b6d718c8dbe MIPS: Fix whitespace damage in r4k_wai=
t from VS timer fix)
Merging openrisc/for-next (8c30b0018f9d openrisc: Add jump label support)
Merging parisc-hd/for-next (7d0a66e4bb90 Linux 6.18)
Merging powerpc/next (9b36c7fc5aa5 macintosh/via-pmu-backlight: Include <li=
nux/fb.h> and <linux/of.h>)
Merging risc-v/for-next (0f226cf6026f kselftest/riscv: add kselftest for us=
er mode cfi)
CONFLICT (content): Merge conflict in arch/riscv/include/asm/hwcap.h
CONFLICT (content): Merge conflict in include/linux/mm.h
Merging riscv-dt/riscv-dt-for-next (a4aad736716d riscv: dts: microchip: con=
vert clock and reset to use syscon)
Merging riscv-soc/riscv-soc-for-next (719362b8a972 Merge branch 'riscv-cach=
e-for-next' into riscv-soc-for-next)
Merging s390/for-next (70075e3d0ca0 s390/bug: Add missing alignment)
Merging sh/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging sparc/for-next (fe0126702a40 sparc: Replace deprecated strcpy() wit=
h strscpy() in handle_nextprop_quirks())
Merging uml/next (a3209bb94b36 um: Disable KASAN_INLINE when STATIC_LINK is=
 selected)
Merging xtensa/xtensa-for-next (4c8bad3ed035 xtensa: use HZ_PER_MHZ in plat=
form_calibrate_ccount)
Merging fs-next (d411768e1372 Merge branch 'vfs.all' of https://git.kernel.=
org/pub/scm/linux/kernel/git/vfs/vfs.git)
Merging printk/for-next (322530a9c2ab Merge branch 'rework/nbcon-in-kdb' in=
to for-next)
Merging pci/next (43dfc13ca972 Merge tag 'pci-v6.19-changes' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/pci/pci)
Merging pstore/for-next/pstore (b69255357368 pstore/ram: Update module para=
meters from platform data)
Merging hid/for-next (1c772200c9dc Merge branch 'for-6.18/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (d202341d9b0c i2c: qcom-cci: Add msm8953 compatibl=
e)
Merging i2c-host/i2c/i2c-host (172368d01390 dt-bindings: i2c: qcom-cci: Doc=
ument SM8750 compatible)
Merging i3c/i3c/next (6a6d77ee7d61 i3c: adi: Fix confusing cleanup.h syntax)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (30ca0e049f50 hwmon: (dell-smm) Add Dell G=
5 5505 to fan control whitelist)
Merging jc_docs/docs-next (464257baf992 docs: makefile: move rustdoc check =
to the build wrapper)
Merging v4l-dvb/next (f7231cff1f3f media: uapi: c3-isp: Fix documentation w=
arning)
Merging v4l-dvb-next/master (adc218676eef Linux 6.12)
Merging pm/linux-next (d573d1f5141d Merge branch 'pm-runtime' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (49505d17fe59 rust: cpufreq: add=
 __rust_helper to helpers)
Merging cpupower/cpupower (059835bbfa28 tools/power/cpupower: Support build=
ing libcpupower statically)
Merging devfreq/devfreq-next (d9600d57668c PM / devfreq: Fix typo in DFSO_D=
OWNDIFFERENTIAL macro name)
Merging pmdomain/next (1f67707fafa5 pmdomain: Merge branch fixes into next)
Merging opp/opp/linux-next (33ffb0aa8ce8 rust: opp: simplify callers of `to=
_c_str_array`)
Merging thermal/thermal/linux-next (c411d8bf0699 thermal/drivers/imx91: Add=
 support for i.MX91 thermal monitoring unit)
Merging rdma/for-next (80a85a771deb RDMA/rxe: reclassify sockets in order t=
o avoid false positives from lockdep)
Merging net-next/main (8f7aa3d3c732 Merge tag 'net-next-6.19' of git://git.=
kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging bpf-next/for-next (835a50753579 selftests/bpf: Add -fms-extensions =
to bpf build flags)
Merging ipsec-next/master (8f7aa3d3c732 Merge tag 'net-next-6.19' of git://=
git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mlx5-next/mlx5-next (5422318e27d7 net/mlx5: Expose definition for 1=
600Gbps link mode)
Merging netfilter-next/main (8f7aa3d3c732 Merge tag 'net-next-6.19' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging ipvs-next/main (c9dfb92de073 Merge branch 'mlx5-next' of git://git.=
kernel.org/pub/scm/linux/kernel/git/mellanox/linux)
Merging bluetooth/master (305c1c5dd5f4 Bluetooth: hci_conn: Fix using conn-=
>le_{tx,rx}_phy as supported PHYs)
Merging wireless-next/for-next (8f7aa3d3c732 Merge tag 'net-next-6.19' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging ath-next/for-next (c99ebb613259 Merge git://git.kernel.org/pub/scm/=
linux/kernel/git/netdev/net)
Merging iwlwifi-next/next (85d002b2ac56 wifi: iwlwifi: mld: remove unused v=
ariable in d3.c)
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (801b0840b09d Merge tag 'nand/for-6.19' into mtd/next)
Merging nand/nand/next (f6dffe2a9ed1 mtd: spinand: add support for FudanMic=
ro FM25S01BI3)
Merging spi-nor/spi-nor/next (ed26bd40df11 mailmap: update Pratyush Yadav's=
 email address)
Merging crypto/master (48bc9da3c97c crypto: zstd - fix double-free in per-C=
PU stream cleanup)
Merging libcrypto/libcrypto-next (3f9f0252130e Merge tag 'random-6.19-rc1-f=
or-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/crng/random)
Merging drm/drm-next (c7685d11108a Merge tag 'topic/drm-intel-plane-color-p=
ipeline-2025-12-04' of https://gitlab.freedesktop.org/drm/i915/kernel into =
drm-next)
Merging drm-exynos/for-linux-next (3a8660878839 Linux 6.18-rc1)
Merging drm-misc/for-linux-next (308eeb8ca3fd drm/rcar-du: dsi: Handle both=
 DRM_MODE_FLAG_N.SYNC and !DRM_MODE_FLAG_P.SYNC)
Merging amdgpu/drm-next (f24e96d69f5b drm/amdgpu: Set xcp id for mes ring)
Merging drm-intel/for-linux-next (1c7f9e528f8f drm/i915: Fix format string =
truncation warning)
Merging drm-msm/msm-next (7bc29d5fb6fa dt-bindings: display/msm/gmu: Add Ad=
reno X2-85 GMU)
Merging drm-msm-lumag/msm-next-lumag (e2f085ab8636 dt-bindings: display: ms=
m: sm6150-mdss: Fix example indentation and OPP values)
Merging drm-rust/drm-rust-next (57dc2ea0b7bd rust: slice: fix broken intra-=
doc links)
Merging drm-nova/nova-next (93296e9d9528 gpu: nova-core: vbios: store refer=
ence to Device where relevant)
Merging drm-xe/drm-xe-next (7319c2ceb2d7 drm/xe/vf: Reset recovery_queued a=
fter issuing RESFIX_START)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/tests/xe_mocs.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_ct.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_submit.c
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (7d0a66e4bb90 Linux 6.18)
Merging regmap/for-next (d40e1d95246b Merge remote-tracking branch 'regmap/=
for-6.19' into regmap-next)
Merging sound/for-next (fd324768eb2c ALSA: hda/tas2781: Add new quirk for H=
P new project)
Merging ieee1394/for-next (036176d9dba7 firewire: core: abort pending trans=
actions at card removal)
Merging sound-asoc/for-next (c8d8605fc53e Merge remote-tracking branch 'aso=
c/for-6.18' into asoc-linus)
Merging modules/modules-next (1ddac5cd7f27 MAINTAINERS: Add myself as revie=
wer for module support)
Merging input/next (70f62e52176d Input: ti_am335x_tsc - clamp coordinate_re=
adouts to DT maximum (6))
Merging block/for-next (d678712ead73 Merge branch 'block-6.19' into for-nex=
t)
Merging device-mapper/for-next (13ea55ea2017 dm pcache: fix segment info in=
dexing)
Merging libata/for-next (a26a0b4b48e1 ata: libata: Allow more quirks)
Merging pcmcia/pcmcia-next (4a81f78caa53 pcmcia: Add error handling for add=
_interval() in do_validate_mem())
Merging mmc/next (79cf71c0b177 mmc: sdhci-of-dwcmshc: reduce CIT for better=
 performance)
Merging mfd/for-mfd-next (44c603f35cad mfd: sec: Drop a stray semicolon)
Merging backlight/for-backlight-next (d3cc7cd7bc46 backlight: aw99706: Fix =
unused function warnings from suspend/resume ops)
Merging battery/for-next (8e8856396b54 Revert "power: supply: qcom_battmgr:=
 support disabling charge control")
Merging regulator/for-next (56edaa508ed2 Merge remote-tracking branch 'regu=
lator/for-6.18' into regulator-linus)
Merging security/next (9a948eefad59 lsm: use unrcu_pointer() for current->c=
red in security_init())
Merging apparmor/apparmor-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging integrity/next-integrity (738c9738e690 ima: Handle error code retur=
ned by ima_filter_rule_match())
Merging selinux/next (cdcf0b369d40 Automated merge of 'dev' into 'next')
Merging smack/next (29c701f90b93 Smack: function parameter 'gfp' not descri=
bed)
Merging tomoyo/master (834a7ef0b9df RDMA/core: add device registration debu=
gging)
Merging tpmdd/next (416f99c3b16f Merge tag 'driver-core-6.19-rc1' of git://=
git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core)
Merging watchdog/master (5bcc5786a0cf watchdog: starfive: Fix resource leak=
 in probe error path)
Merging iommu/next (0d081b16946e Merge branches 'arm/smmu/updates', 'arm/sm=
mu/bindings', 'mediatek', 'nvidia/tegra', 'intel/vt-d', 'amd/amd-vi' and 'c=
ore' into next)
Merging audit/next (c8a3dfe73159 audit: merge loops in __audit_inode_child(=
))
Merging devicetree/for-next (954c55c658e1 dt-bindings: kbuild: Skip validat=
ing empty examples)
Merging dt-krzk/for-next (3a8660878839 Linux 6.18-rc1)
Merging mailbox/for-next (1ec6e0e8c0dd mailbox: mtk-cmdq: Add driver data t=
o support for MT8196)
Merging spi/for-next (865a1f17d5e4 Merge remote-tracking branch 'spi/for-6.=
18' into spi-linus)
Merging tip/master (528296f905ad Merge branch into tip/master: 'x86/boot')
Merging clockevents/timers/drivers/next (d1780dce9575 clocksource/drivers: =
Add Realtek system timer driver)
Merging edac/edac-for-next (814b332921b6 Merge ras/edac-amd-atl into for-ne=
xt)
Merging ftrace/for-next (5a63f3faf656 Merge unused-tracepoints/for-next)
Merging rcu/next (9a08942f1701 Merge branch 'rcu/misc' into next)
Merging paulmck/non-rcu/next (7f8fcc6f09fb memory-barriers.txt: Sort wait_e=
vent* and wait_on_bit* list alphabetically)
Merging kvm/next (e0c26d47def7 Merge tag 'kvm-s390-next-6.19-1' of https://=
git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging kvm-arm/next (3eef0c83c3f3 Merge branch 'kvm-arm64/nv-xnx-haf' into=
 kvmarm/next)
Merging kvms390/next (2bd1337a1295 KVM: s390: Use generic VIRT_XFER_TO_GUES=
T_WORK functions)
Merging kvm-ppc/topic/ppc-kvm (c17b750b3ad9 Linux 6.17-rc2)
Merging kvm-riscv/riscv_kvm_next (3239c52fd212 RISC-V: KVM: Flush VS-stage =
TLB after VCPU migration for Andes cores)
Merging kvm-x86/next (58e10b63777d Merge branch 'fixes')
Merging xen-tip/linux-next (150215b89bcf drivers/xen: use min() instead of =
min_t())
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (51cd2d2decf3 workqueue: Process extra works in=
 rescuer on memory pressure)
Merging sched-ext/for-next (9f769637a93f sched_ext: Fix bypass depth leak o=
n scx_enable() failure)
Merging drivers-x86/for-next (9d588a1140b9 Merge tag 'platform-drivers-x86-=
v6.19-1' of git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-dr=
ivers-x86)
Merging chrome-platform/for-next (52075d2c7595 platform/chrome: sensorhub: =
Support devices without FIFO_INT_ENABLE)
Merging chrome-platform-firmware/for-firmware-next (3a8660878839 Linux 6.18=
-rc1)
Merging hsi/for-next (3a8660878839 Linux 6.18-rc1)
Merging leds-lj/for-leds-next (072cd5f458d7 leds: rgb: leds-qcom-lpg: Don't=
 enable TRILED when configuring PWM)
Merging ipmi/for-next (35bcedc1a793 MAINTAINERS: Add entry on Loongson-2K I=
PMI driver)
Merging driver-core/driver-core-next (d358e5254674 Merge tag 'for-6.19/dm-c=
hanges' of git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linu=
x-dm)
Merging usb/usb-next (d358e5254674 Merge tag 'for-6.19/dm-changes' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging thunderbolt/next (479d186fc946 thunderbolt: Fix typos in xdomain.c)
Merging usb-serial/usb-next (072f2c495725 USB: serial: option: move Telit 0=
x10c7 composition in the right place)
Merging tty/tty-next (d358e5254674 Merge tag 'for-6.19/dm-changes' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging char-misc/char-misc-next (d358e5254674 Merge tag 'for-6.19/dm-chang=
es' of git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (9e9182cab5eb coresight: etm4x: Remove the state_nee=
ds_restore flag)
Merging fastrpc/for-next (3a8660878839 Linux 6.18-rc1)
Merging fpga/for-next (c9243d6df0d6 fpga: altera-cvp: Use pci_find_vsec_cap=
ability() when probing FPGA device)
Merging icc/icc-next (60b52af082b1 Merge branch 'icc-sm6350' into icc-next)
Merging iio/togreg (f9e057916428 staging: iio: adt7316: replace sprintf() w=
ith sysfs_emit())
Merging phy-next/next (716311dad200 MAINTAINERS: phy: Add Neil Armstrong as=
 reviewers for phy subsystem)
Merging soundwire/next (188d194be2bf soundwire: intel_ace2x: handle multi B=
PT sections)
Merging extcon/extcon-next (b4338338aa3d extcon: usbc-tusb320: Make typec-p=
ower-opmode optional)
Merging gnss/gnss-next (f5ef3f722d76 dt-bindings: gnss: fix timepulse descr=
iption)
Merging vfio/next (d721f52e3155 vfio: selftests: Add vfio_pci_device_init_p=
erf_test)
Merging w1/for-next (a5d908e0ec05 w1: omap-hdq: Remove redundant pm_runtime=
_mark_last_busy() calls)
Merging spmi/spmi-next (0ff41df1cb26 Linux 6.15)
Merging staging/staging-next (d358e5254674 Merge tag 'for-6.19/dm-changes' =
of git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging counter-next/counter-next (b462fcd08dd5 MAINTAINERS: Update Intel Q=
uadrature Encoder Peripheral maintainer)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (2b11e7403a8e dt-bindings: dma: xilinx: Simplify dma=
-coherent property)
Merging cgroup/for-next (6ee43047e8ad cpuset: Remove unnecessary checks in =
rebuild_sched_domains_locked)
Merging scsi/for-next (47ea32406252 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (946574434aa9 scsi: ufs: qcom: Fix confusing clea=
nup.h syntax)
Merging vhost/linux-next (1bac705c2ce7 vhost/vsock: improve RCU read sectio=
ns around vhost_vsock_get())
Merging rpmsg/for-next (f1f6eaa1e545 Merge branches 'rpmsg-next' and 'rproc=
-next' into for-next)
Merging gpio-brgl/gpio/for-next (dae9750105cf gpio: loongson: Switch 2K2000=
/3000 GPIO to BYTE_CTRL_MODE)
Merging gpio-intel/for-next (b2a186cced11 gpiolib: acpi: use min() instead =
of min_t())
Merging pinctrl/for-next (666065caa31a pinctrl: add CONFIG_OF dependencies =
for microchip drivers)
Merging pinctrl-intel/for-next (8daf70e6aa41 Merge patch series "pinctrl: i=
ntel: Export intel_gpio_add_pin_ranges() and use it")
Merging pinctrl-renesas/renesas-pinctrl (3b0cf6ab3590 pinctrl: renesas: rzg=
2l: Refactor OEN register PWPR handling)
Merging pinctrl-samsung/for-next (3cfc60e09bdc pinctrl: samsung: Add ARTPEC=
-9 SoC specific configuration)
Merging pwm/pwm/for-next (3c180003dffb pwm: th1520: Fix missing Kconfig dep=
endencies)
Merging ktest/for-next (d3042cbe84a0 ktest.pl: Fix uninitialized var in con=
fig-bisect.pl)
Merging kselftest/next (a2f7990d3309 selftests: tracing: Update fprobe self=
test for ftrace based fprobe)
Merging kunit/test (3a8660878839 Linux 6.18-rc1)
Merging kunit-next/kunit (7bc16e72ddb9 kunit: Make filter parameters config=
urable via Kconfig)
Merging livepatching/for-next (5cb5575308bc selftests: livepatch: use canon=
ical ftrace path)
Merging rtc/rtc-next (16bd954c9336 rtc: spacemit: MFD_SPACEMIT_P1 as depend=
encies)
Merging nvdimm/libnvdimm-for-next (30065e73d7c0 nvdimm: Prevent integer ove=
rflow in ramdax_get_config_data())
Merging at24/at24/for-next (aef72ebe9c86 dt-bindings: eeprom: at24: Add com=
patible for Belling BL24S64)
Merging ntb/ntb-next (68113d260674 NTB/msi: Remove unused functions)
Merging seccomp/for-next/seccomp (7d0a66e4bb90 Linux 6.18)
Merging slimbus/for-next (3a8660878839 Linux 6.18-rc1)
Merging nvmem/for-next (3a8660878839 Linux 6.18-rc1)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (01e70c839863 mshv: Move function prototypes to =
the generic header)
Merging auxdisplay/for-next (00de283c53c9 Merge patch series "auxdisplay: l=
inedisp: support attribute attachment to auxdisplay devices")
Merging kgdb/kgdb/for-next (fdbdd0ccb30a kdb: remove redundant check for sc=
ancode 0xe0)
Merging hmm/hmm (19272b37aa4f Linux 6.16-rc1)
Merging cfi/cfi/next (3a8660878839 Linux 6.18-rc1)
Merging mhi/mhi-next (ac35e04f8000 bus: mhi: host: pci_generic: Add Foxconn=
 T99W760 modem)
Merging memblock/for-next (83c8f7b5e194 mm/mm_init: Introduce a boot parame=
ter for check_pages)
Merging cxl/next (ea5514e30056 Merge branch 'for-6.19/cxl-misc' into cxl-fo=
r-next)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (7a2ff00c3b5e docs: efi: add CPER functions to driver-api)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (a8ec08bf3259 Merge branch 'slab/for-6.19/mempoo=
l_alloc_bulk' into slab/for-next)
Merging random/master (3f9f0252130e Merge tag 'random-6.19-rc1-for-linus' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/crng/random)
Merging landlock/next (eee654ca9a55 Merge tag 'landlock-6.19-rc1' of git://=
git.kernel.org/pub/scm/linux/kernel/git/mic/linux)
Merging rust/rust-next (559e608c4655 Merge tag 'ntfs3_for_6.19' of https://=
github.com/Paragon-Software-Group/linux-ntfs3)
Merging rust-alloc/alloc-next (3a8660878839 Linux 6.18-rc1)
Merging rust-io/io-next (86731a2a651e Linux 6.16-rc3)
Merging rust-pin-init/pin-init-next (42415d163e5d rust: pin-init: add refer=
ences to previously initialized fields)
Merging rust-timekeeping/timekeeping-next (4521438fb076 rust: time: Impleme=
nt basic arithmetic operations for Delta)
Merging rust-xarray/xarray-next (fa616196fbea MAINTAINERS: add entry for Ru=
st XArray API)
Merging sysctl/sysctl-next (564195c1a33c sysctl: Wrap do_proc_douintvec wit=
h the public function proc_douintvec_conv)
Merging execve/for-next/execve (7d0a66e4bb90 Linux 6.18)
Merging bitmap/bitmap-for-next (5ba71195a9cb rust_binder: use bitmap for al=
location of handles)
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (7454048db27d kbuild: Enable GCC diagnostic cont=
ext for value-tracking warnings)
Merging nolibc/for-next (1d573464749c selftests/nolibc: error out on linker=
 warnings)
Merging iommufd/for-next (c8ed57e24380 iommufd/selftest: Do not leak the hw=
pt if IOMMU_TEST_OP_MD_CHECK_MAP fails)
Merging turbostat/next (0aff79a1ff35 tools/power turbostat.8: Document the =
"--force" option)
Merging pwrseq/pwrseq/for-next (3a8660878839 Linux 6.18-rc1)
Merging capabilities-next/caps-next (9891d2f79a9f Clarify the rootid_owns_c=
urrentns)
Merging ipe/next (7d0a66e4bb90 Linux 6.18)
Merging kcsan/next (dcb6fa37fd7b Linux 6.18-rc3)
Merging crc/crc-next (dcb6fa37fd7b Linux 6.18-rc3)
Merging fwctl/for-next (211ddde0823f Linux 6.18-rc2)
Merging devsec-tsm/next (7dfbe9a67519 crypto/ccp: Fix CONFIG_PCI=3Dn build)
Merging hisilicon/for-next (6c177775dcc5 Merge branch 'next/drivers' into f=
or-next)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)

--Sig_/1m3m_eEgEAikYY/lT6NS9bl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmk7ZpwACgkQAVBC80lX
0GzC4AgAnp5M83lUdDm/UMY1Ilimj0016ulf0n+NdGP1pRMTcx6tYY5OtzCJiR99
IyNHzbrMD0poupqk4MGW/ZIQOEdXDg6uoM05lrHQDEY0RO9Wnebk48gINQoMj1FW
fAt1XM+QGOBhow86uqMO8ziAeXFaB4W7Mf2TRCsAkm/CGfr3HwH95t4BWN1biQ2T
n1tQoJxQH6t8LHH3d1lF7ZDgNjuUOG5IC4oJKfetlQRl7XewEZukgOnHBP8NJy24
H0wOiVk5i8vEQJsPxmBkYhXsxBQdQNCup9iOLyBJQtrNDVuPlAS6yXr+1+iDvjrP
cREWond+rmROMr5oN/q599bBMMqlNA==
=YkPk
-----END PGP SIGNATURE-----

--Sig_/1m3m_eEgEAikYY/lT6NS9bl--

