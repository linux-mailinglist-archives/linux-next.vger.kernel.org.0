Return-Path: <linux-next+bounces-9257-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 83115C90E38
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 06:29:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 652064E122E
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 05:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20B31D5CC7;
	Fri, 28 Nov 2025 05:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WaJlTsGB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3636CAD2C;
	Fri, 28 Nov 2025 05:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764307776; cv=none; b=sOZi/LZfTu5CDHmjILCPHsbYEne0M3049IY8oJj6UOVX6vN+OhHbRkAGABhH0uZ31F+NTUC+bglLkq1PcXZHd1ZscF01XlXMht/Qci5hLzQpKgqyYU6KvzNgbcOfuA9BdB24hBtPb91CtSHVUeVa2VX0Zfu3/5SGFVH0+ZT3rAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764307776; c=relaxed/simple;
	bh=arWmAG5LV0Jx0zr1AEmgFr8cMzNqUPkLlExjAxzEk/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Zgtf1uwO2YJH3+SY6BlB3pUpHiMWGdpCi1HSPrA2CRl1cJp/tkixAo8Erob9jrVcRvZVYdnNJ5RhmkXYD5wzJvFNa7VqGFT4N0tnVDjKGCkytL8QB/omvpbLpAX/qdOIAxQybGF8md1dyI7lBiF6SX+vrcDaa1AiXO86fEkMORc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WaJlTsGB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764307769;
	bh=f0Pq/vaEHcS31ztG55JkGabK6O0S/dx8lpHBO40Y4xM=;
	h=Date:From:To:Cc:Subject:From;
	b=WaJlTsGBl4YrctoqL55rkdV3Jrx9RMHYaxckvWlB/CKT6P0jPGq/bfLDsa9weFvlh
	 ZESZTiv74P685g+H4Rt6D8IcVvlX1WIxxfHNBoUpEC10mJd1qRn3TDbqGFEQllQOSH
	 j2pem9cfcHRsLQGChaQ3R2jZcBRlu0MBE0+ivuzyG6WICR7WwAjdbCpIz8VW4at8fd
	 yS4Wqqyn/PzD2SpRzAsTMhIpy6TXaQvt8Jav5qNYCvrCMokxVLJlnjenjE7IxtKqXw
	 I6uKK6RSG+Dzl9ZUWB6dNpkCvBaEJ75ai35EABWPigde0cF7FIV4h3Z34i1MoRcNhi
	 k/foJo2+mgspw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dHhgY1SbRz4wH8;
	Fri, 28 Nov 2025 16:29:29 +1100 (AEDT)
Date: Fri, 28 Nov 2025 16:29:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 28
Message-ID: <20251128162928.36eec2d6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rYr+Fmk/HVVWCrDiHv+CsKx";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/rYr+Fmk/HVVWCrDiHv+CsKx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20251127:

This kernel produces a warning at boot time.

The vfs-brauner tree still had its build failure so I used a supplied
patch.

The risc-v tree gained conflicts against the mm-stable and mm-unstable
trees.

Non-merge commits (relative to Linus' tree): 11542
 11794 files changed, 589757 insertions(+), 183954 deletions(-)

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

I am currently merging 408 trees (counting Linus' and 122 trees of bug
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
Merging origin/master (e1afacb68573 Merge tag 'ceph-for-6.18-rc8' of https:=
//github.com/ceph/ceph-client)
Merging fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging ext4-fixes/fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging vfs-brauner-fixes/vfs.fixes (7b6dcd9bfd86 fs/namespace: fix referen=
ce leak in grab_requested_mnt_ns)
Merging fscrypt-current/for-current (1e39da974ce6 fscrypt: fix left shift u=
nderflow when inode->i_blkbits > PAGE_SHIFT)
Merging fsverity-current/for-current (211ddde0823f Linux 6.18-rc2)
Merging btrfs-fixes/next-fixes (62f1c85f62b3 Merge branch 'misc-6.18' into =
next-fixes)
Merging vfs-fixes/fixes (00e782110428 nfs4_setup_readdir(): insufficient lo=
cking for ->d_parent->d_inode dereferencing)
Merging erofs-fixes/fixes (f2a12cc3b97f erofs: avoid infinite loop due to i=
ncomplete zstd-compressed data)
Merging nfsd-fixes/nfsd-fixes (324be6dcbf09 Revert "SUNRPC: Make RPCSEC_GSS=
_KRB5 select CRYPTO instead of depending on it")
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (e8bd877fb76b ovl: fix possible double un=
link)
Merging fscrypt/for-next (211ddde0823f Linux 6.18-rc2)
Merging btrfs/for-next (42ea4b8c679c Merge branch 'for-next-current-v6.17-2=
0251125' into for-next-20251125)
CONFLICT (content): Merge conflict in fs/btrfs/ctree.c
Merging ceph/master (7fce830ecd0a libceph: prevent potential out-of-bounds =
writes in handle_auth_session_key())
Merging cifs/for-next (bda97f51ec68 cifs: Use netfs_alloc/free_folioq_buffe=
r())
Merging configfs/configfs-next (f7f78098690d configfs: Constify ct_item_ops=
 in struct config_item_type)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (8e4021078863 dlm: check for undefined release_option valu=
es)
Merging erofs/dev (0c4e8e72ff4f erofs: tidy up z_erofs_lz4_handle_overlap())
Merging exfat/dev (3577231895ec exfat: fix divide-by-zero in exfat_allocate=
_bitmap)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (25554ea0b42b Pull udf extent block verification.)
Merging ext4/dev (690243606a4f ext4: mark inodes without acls in __ext4_ige=
t())
Merging f2fs/dev (c0ee17208345 docs: f2fs: wrap ASCII tables in literal blo=
cks to fix LaTeX build)
Merging fsverity/for-next (211ddde0823f Linux 6.18-rc2)
Merging fuse/for-next (8da059f2a497 fuse: Uninitialized variable in fuse_ep=
och_work())
Merging gfs2/for-next (83348905e413 gfs2: Clean up SDF_JOURNAL_LIVE flag ha=
ndling)
Merging jfs/jfs-next (cafc6679824a jfs: replace hardcoded magic number with=
 DTPAGEMAXSLOT constant)
Merging ksmbd/ksmbd-for-next (8d86324b3544 ksmbd: Replace strcpy + strcat t=
o improve convert_to_nt_pathname)
Merging nfs/linux-next (6a23ae0a96a6 Linux 6.18-rc6)
Merging nfs-anna/linux-next (b623390045a8 NFS: Fix LTP test failures when t=
imestamps are delegated)
Merging nfsd/nfsd-next (99f5aa14f03e NFSD: Add trace point for SCSI fencing=
 operation.)
Merging ntfs3/master (1b2ae190ea43 fs/ntfs3: check for shutdown in fsync)
Merging orangefs/for-next (11f6bce77e27 fs/orangefs: Replace kzalloc + copy=
_from_user with memdup_user_nul)
Merging overlayfs/overlayfs-next (ad1423922781 ovl: make sure that ovl_crea=
te_real() returns a hashed dentry)
Merging ubifs/next (99dbb2a1bd66 ubifs: stop using write_cache_pages)
Merging v9fs/9p-next (1f3e4142c0eb 9p: convert to the new mount API)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (79c47bc68efb Merge branch 'xfs-6.19-merge' into for-n=
ext)
Merging zonefs/for-next (a42938e80357 zonefs: correct some spelling mistake=
s)
Merging vfs-brauner/vfs.all (73612a36da1a Merge branch 'vfs-6.19.fd_prepare=
' into vfs.all)
CONFLICT (content): Merge conflict in fs/btrfs/file.c
CONFLICT (content): Merge conflict in fs/nfsd/nfs4recover.c
Applying: vfs: add needed headers for new struct delegation definition
Merging vfs/for-next (eb028c33451a d_make_discardable(): warn if given a no=
n-persistent dentry)
CONFLICT (content): Merge conflict in Documentation/filesystems/porting.rst
CONFLICT (content): Merge conflict in fs/dcache.c
CONFLICT (content): Merge conflict in fs/debugfs/inode.c
CONFLICT (content): Merge conflict in security/apparmor/apparmorfs.c
Merging mm-hotfixes/mm-hotfixes-unstable (12299cbb821b arm64: kernel: initi=
alize missing kexec_buf->random field)
Merging fs-current (5dac3972a319 Merge branch 'fixes' of https://git.kernel=
.org/pub/scm/linux/kernel/git/viro/vfs.git)
Merging kbuild-current/kbuild-fixes (4ab2ee307983 kbuild: install-extmod-bu=
ild: Properly fix CC expansion when ccache is used)
Merging arc-current/for-curr (d7b8f8e20813 Linux 6.16-rc5)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
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
Merging m68k-current/for-linus (695f2c0c25f3 m68k: defconfig: Update defcon=
figs for v6.17-rc1)
Merging powerpc-fixes/fixes (0843ba458439 powerpc/fadump: skip parameter ar=
ea allocation when fadump is disabled)
Merging s390-fixes/fixes (31475b88110c s390/mm: Fix __ptep_rdp() inline ass=
embly)
Merging net/main (1f5e808aa63a Merge tag 'net-6.18-rc8' of git://git.kernel=
.org/pub/scm/linux/kernel/git/netdev/net)
Merging bpf/master (30f09200cc4a Merge tag 'arm64-fixes' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/arm64/linux)
Merging ipsec/master (a55ef3bff84f xfrm: fix memory leak in xfrm_add_acquir=
e())
Merging netfilter/main (8a4dfa8fa6b5 Merge tag 'for-net-2025-11-21' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth)
Merging ipvs/main (de0337d641bf net: ionic: map SKB after pseudo-header che=
cksum prep)
Merging wireless/for-next (d0309c054362 Merge tag 'net-6.18-rc6' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ath/for-current (d0309c054362 Merge tag 'net-6.18-rc6' of git://git=
.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging iwlwifi/fixes (1a222625b468 wifi: iwlwifi: mld: always take beacon =
ies in link grading)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (ac3fd01e4c1e Linux 6.18-rc7)
Merging sound-current/for-linus (d01a3aad7f2c Merge tag 'asoc-fix-v6.18-rc7=
' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for=
-linus)
Merging sound-asoc-fixes/for-linus (73b97d46dde6 ASoC: fsl_xcvr: clear the =
channel status control memory)
Merging regmap-fixes/for-linus (6146a0f1dfae Linux 6.18-rc4)
Merging regulator-fixes/for-linus (8684229e19c4 regulator: rtq2208: Correct=
 LDO2 logic judgment bits)
Merging spi-fixes/for-linus (40ad64ac25bb spi: nxp-fspi: Propagate fwnode i=
n ACPI case as well)
Merging pci-current/for-linus (3a8660878839 Linux 6.18-rc1)
Merging driver-core.current/driver-core-linus (dcb6fa37fd7b Linux 6.18-rc3)
Merging tty.current/tty-linus (2bf95a9bcb50 serial: 8250: Fix 8250_rsa symb=
ol loop)
Merging usb.current/usb-linus (74851fbb6d64 usb: gadget: renesas_usbf: Hand=
le devm_pm_runtime_enable() errors)
Merging usb-serial-fixes/usb-linus (523bf0a59e67 USB: serial: option: add s=
upport for Rolling RW101R-GL)
Merging phy/fixes (3a8660878839 Linux 6.18-rc1)
Merging staging.current/staging-linus (dcb6fa37fd7b Linux 6.18-rc3)
Merging iio-fixes/fixes-togreg (74f97a468356 iio: adc: at91-sama5d2_adc: Fi=
x potential use-after-free in sama5d2_adc driver)
Merging counter-current/counter-current (109ff654934a counter: microchip-tc=
b-capture: Allow shared IRQ for multi-channel TCBs)
Merging char-misc.current/char-misc-linus (03bc4831ef06 nvmem: layouts: fix=
 nvmem_layout_bus_uevent)
Merging soundwire-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging thunderbolt-fixes/fixes (3575254546a2 thunderbolt: Add support for =
Intel Wildcat Lake)
Merging input-current/for-linus (ae8966b7b5bd Input: rename INPUT_PROP_HAPT=
IC_TOUCHPAD to INPUT_PROP_PRESSUREPAD)
Merging crypto-current/master (8b36669b5f73 crypto: zstd - fix double-free =
in per-CPU stream cleanup)
Merging libcrypto-fixes/libcrypto-fixes (141fbbecec0e lib/crypto: tests: Fi=
x KMSAN warning in test_sha256_finup_2x())
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
Merging mips-fixes/mips-fixes (ac3fd01e4c1e Linux 6.18-rc7)
Merging at91-fixes/at91-fixes (3a8660878839 Linux 6.18-rc1)
Merging omap-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging kvm-fixes/master (32bd348be3fa KVM: Fix last_boosted_vcpu index ass=
ignment bug)
Merging kvms390-fixes/master (5f9df945d4e8 KVM: s390: Fix FOLL_*/FAULT_FLAG=
_* confusion)
Merging hwmon-fixes/hwmon (6a23ae0a96a6 Linux 6.18-rc6)
Merging nvdimm-fixes/libnvdimm-fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging cxl-fixes/fixes (214291cbaace acpi/hmat: Fix lockdep warning for hm=
em_register_resource())
Merging dma-mapping-fixes/dma-mapping-fixes (d0d08f4bd7f6 dma-direct: Fix m=
issing sg_dma_len assignment in P2PDMA bus mappings)
Merging drivers-x86-fixes/fixes (9b9c0adbc3f8 platform/x86: intel: punit_ip=
c: fix memory corruption)
Merging samsung-krzk-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging pinctrl-samsung-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging devicetree-fixes/dt/linus (7209ff310083 of/irq: Export of_msi_xlate=
() for module usage)
Merging dt-krzk-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging scsi-fixes/fixes (90449f2d1e1f scsi: sg: Do not sleep in atomic con=
text)
Merging drm-fixes/drm-fixes (ac3fd01e4c1e Linux 6.18-rc7)
Merging drm-intel-fixes/for-linux-next-fixes (7c373b3bd03c drm/i915/psr: Re=
ject async flips when selective fetch is enabled)
Merging mmc-fixes/fixes (747528729c9b mmc: sdhci-of-dwcmshc: Promote the th=
1520 reset handling to ip level)
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
Merging spdx/spdx-linus (89373f5695dc LICENSES: Add modern form of the LGPL=
-2.1 tags to the usage guide section)
Merging gpio-brgl-fixes/gpio/for-current (2b6d546ba83e MAINTAINERS: update =
my email address)
Merging gpio-intel-fixes/fixes (6a23ae0a96a6 Linux 6.18-rc6)
Merging pinctrl-intel-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging auxdisplay-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging kunit-fixes/kunit-fixes (f3903ec76ae6 MAINTAINERS: Update KUnit ema=
il address for Rae Moar)
Merging memblock-fixes/fixes (c42af83c59b6 memblock: fix memblock_estimated=
_nr_free_pages() for soft-reserved memory)
Merging renesas-fixes/fixes (379c590113ce ARM: shmobile: smp: Enforce shmob=
ile_smp_* alignment)
Merging perf-current/perf-tools (6a23ae0a96a6 Linux 6.18-rc6)
Merging efi-fixes/urgent (e5f0a698b34e Linux 6.17)
Merging battery-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging iommufd-fixes/for-rc (b07bf253ef8e iommufd/iommufd_private.h: Avoid=
 -Wflex-array-member-not-at-end warning)
Merging rust-fixes/rust-fixes (ac3fd01e4c1e Linux 6.18-rc7)
Merging w1-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging pmdomain-fixes/fixes (c98c99d5dbdf pmdomain: tegra: Add GENPD_FLAG_=
NO_STAY_ON flag)
Merging i2c-host-fixes/i2c/i2c-host-fixes (8738d626030f i2c: fix reference =
leak in MP2 PCI device)
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
Merging trace-fixes/trace/fixes (53afec2c8fb2 tracing/tools: Fix incorrcet =
short option in usage text for --threads)
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging tip-fixes/tip/urgent (a1ef372dbe4b Merge branch into tip/master: 't=
imers/urgent')
Merging slab-fixes/slab/for-next-fixes (ec33b59542d9 mm/mempool: fix poison=
ing order>0 pages with HIGHMEM)
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
Merging drm-misc-fixes/for-linux-next-fixes (eb76d0f55535 drm, fbcon, vga_s=
witcheroo: Avoid race condition in fbcon setup)
Merging mm-stable/mm-stable (84a8d467cc42 pagemap: update BUDDY flag docume=
ntation)
Merging mm-nonmm-stable/mm-nonmm-stable (aa514a297a0c calibrate: update hea=
der inclusion)
Merging mm-unstable/mm-unstable (f74b906e6ae7 mm/swapfile: use plist_for_ea=
ch_entry in __folio_throttle_swaprate)
Merging mm-nonmm-unstable/mm-nonmm-unstable (10758ed2f446 ocfs2: check tl_u=
sed after reading it from trancate log inode)
Merging kbuild/kbuild-next (deab487e0f9b kbuild: allow architectures to ove=
rride CC_CAN_LINK)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (834ebb5678d7 perf tools: Don't read build-ids=
 from non-regular files)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (131971f67e25 dma-mapping: remove =
unused map_page callback)
Merging asm-generic/master (edcc8a38b5ac once: fix race by moving DO_ONCE t=
o separate section)
Merging alpha/alpha-next (d58041d2c63e MAINTAINERS: Add Magnus Lindholm as =
maintainer for alpha port)
Merging arm/for-next (eca2ec8c85ae Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (c203c24f85a3 Merge branch 'for-next/sysreg' in=
to for-next/core)
CONFLICT (content): Merge conflict in arch/arm64/include/asm/el2_setup.h
CONFLICT (content): Merge conflict in arch/arm64/mm/mmu.c
CONFLICT (content): Merge conflict in mm/memory.c
Merging arm-perf/for-next/perf (e6a27290d800 perf: arm_spe: Add support for=
 filtering on data source)
Merging arm-soc/for-next (e5b2299997d3 soc: document merges)
Merging amlogic/for-next (3b2ecf0c3cc3 Merge branch 'v6.19/drivers' into fo=
r-next)
Merging asahi-soc/asahi-soc/for-next (5d21b7ca05c8 Merge branch 'apple-soc/=
drivers-6.19' into asahi-soc/for-next)
Merging at91/at91-next (fde90d654751 Merge branch 'at91-dt' into at91-next)
Merging bmc/for-next (028f6e376cb6 Merge branch 'aspeed/arm/dt' into for-ne=
xt)
Merging broadcom/next (37c3a91e9730 arm64: dts: broadcom: bcm2712: Add watc=
hdog DT node)
Merging cix/for-next (4889f68b824d Merge remote-tracking branch 'cix/dt' in=
to for-next)
Merging davinci/davinci/for-next (3a8660878839 Linux 6.18-rc1)
Merging drivers-memory/for-next (84ac371ee4b3 Merge branch 'mem-ctrl-next' =
into for-next)
Merging fsl/soc_fsl (760b8eec2cf8 soc: fsl: qbman: use kmalloc_array() inst=
ead of kmalloc())
Merging imx-mxs/for-next (89d95dbad2a3 Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (67ed5843a67b Merge branch 'v6.18-next/dts64' int=
o for-next)
Merging mvebu/for-next (f0e6bc0c3ef4 clk: mvebu: cp110 add CLK_IGNORE_UNUSE=
D to pcie_x10, pcie_x11 & pcie_x4)
Merging omap/for-next (2c85858e7c68 Merge branch 'omap-for-v6.19/drivers' i=
nto tmp/omap-next-20251117.085514)
Merging qcom/for-next (c17e270dfb34 Merge branches 'arm32-for-6.19', 'arm64=
-defconfig-for-6.19', 'arm64-for-6.19', 'clk-for-6.19' and 'drivers-for-6.1=
9' into for-next)
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
Merging clk/clk-next (e1132ddd5d4c Merge branch 'clk-imx' into clk-next)
Merging clk-imx/for-next (fdc1dc7dd53b clk: imx: add driver for imx8ulp's s=
im lpav)
Merging clk-renesas/renesas-clk (5fb2f67341bd clk: renesas: r9a09g077: Add =
SPI module clocks)
Merging thead-clk/thead-clk-for-next (3a8660878839 Linux 6.18-rc1)
Merging csky/linux-next (817d21578d51 csky: Remove compile warning for CONF=
IG_SMP)
Merging loongarch/loongarch-next (b1ca4204c312 KVM: LoongArch: selftests: A=
dd time counter test case)
Merging m68k/for-next (aaf4e92341b0 m68k: defconfig: Update defconfigs for =
v6.18-rc1)
Merging m68knommu/for-next (ac3fd01e4c1e Linux 6.18-rc7)
Merging microblaze/next (7f7072574127 Merge tag 'kbuild-6.18-1' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/kbuild/linux)
Merging mips/mips-next (ac3fd01e4c1e Linux 6.18-rc7)
Merging openrisc/for-next (8c30b0018f9d openrisc: Add jump label support)
Merging parisc-hd/for-next (dca7da244349 parisc: Do not reprogram affinitiy=
 on ASP chip)
Merging powerpc/next (5b3a426affbd powerpc/64s/slb: Add no_slb_preload earl=
y cmdline param)
Merging risc-v/for-next (0f226cf6026f kselftest/riscv: add kselftest for us=
er mode cfi)
CONFLICT (content): Merge conflict in arch/riscv/include/asm/hwcap.h
CONFLICT (content): Merge conflict in include/linux/mm.h
Merging riscv-dt/riscv-dt-for-next (a4aad736716d riscv: dts: microchip: con=
vert clock and reset to use syscon)
Merging riscv-soc/riscv-soc-for-next (719362b8a972 Merge branch 'riscv-cach=
e-for-next' into riscv-soc-for-next)
Merging s390/for-next (2f44a03a8d80 Merge branch 'features' into for-next)
CONFLICT (content): Merge conflict in include/linux/memory.h
Merging sh/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging sparc/for-next (fe0126702a40 sparc: Replace deprecated strcpy() wit=
h strscpy() in handle_nextprop_quirks())
Merging uml/next (54618003a145 um: drivers: virtio: use string choices help=
er)
Merging xtensa/xtensa-for-next (4c8bad3ed035 xtensa: use HZ_PER_MHZ in plat=
form_calibrate_ccount)
Merging fs-next (14ebe81f7d10 Merge branch 'for-next' of https://git.kernel=
.org/pub/scm/linux/kernel/git/viro/vfs.git)
CONFLICT (content): Merge conflict in arch/s390/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in mm/secretmem.c
Merging printk/for-next (322530a9c2ab Merge branch 'rework/nbcon-in-kdb' in=
to for-next)
Merging pci/next (e8c5d2fd8597 Merge branch 'pci/misc')
CONFLICT (content): Merge conflict in MAINTAINERS
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_vram.c
CONFLICT (content): Merge conflict in drivers/pci/controller/dwc/pcie-desig=
nware-host.c
Merging pstore/for-next/pstore (b69255357368 pstore/ram: Update module para=
meters from platform data)
Merging hid/for-next (1c772200c9dc Merge branch 'for-6.18/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (e9a6fb0bcdd7 Linux 6.18-rc5)
Merging i2c-host/i2c/i2c-host (eeaaf5bc1c5b dt-bindings: i2c: qcom-cci: Doc=
ument Kaanapali compatible)
Merging i3c/i3c/next (ddb37d5b130e i3c: mipi-i3c-hci-pci: Add support for I=
ntel Nova Lake-S I3C)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (fe5dbe3110c5 hwmon: (asus-ec-sensors) cor=
rect Pro WS TRX50-SAGE WIFI entry)
Merging jc_docs/docs-next (d879c2e0195b Merge branch 'mauro' into docs-mw)
Merging v4l-dvb/next (1f2353f5a1af media: rockchip: rkcif: add support for =
rk3568 vicap mipi capture)
Merging v4l-dvb-next/master (adc218676eef Linux 6.12)
Merging pm/linux-next (cb9e7e5a49cb Merge branch 'pm-devfreq' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (c3852d2ca465 cpufreq: qcom-nvme=
m: fix compilation warning for qcom_cpufreq_ipq806x_match_list)
Merging cpupower/cpupower (059835bbfa28 tools/power/cpupower: Support build=
ing libcpupower statically)
Merging devfreq/devfreq-next (d9600d57668c PM / devfreq: Fix typo in DFSO_D=
OWNDIFFERENTIAL macro name)
Merging pmdomain/next (1f67707fafa5 pmdomain: Merge branch fixes into next)
Merging opp/opp/linux-next (33ffb0aa8ce8 rust: opp: simplify callers of `to=
_c_str_array`)
Merging thermal/thermal/linux-next (c411d8bf0699 thermal/drivers/imx91: Add=
 support for i.MX91 thermal monitoring unit)
Merging rdma/for-next (4022c7b6342a RDMA/mlx5: Add support for 1600_8x lane=
 speed)
Merging net-next/main (db4029859d6f Merge git://git.kernel.org/pub/scm/linu=
x/kernel/git/netdev/net)
CONFLICT (content): Merge conflict in tools/testing/selftests/drivers/net/g=
ro.c
CONFLICT (content): Merge conflict in tools/testing/selftests/drivers/net/h=
w/toeplitz.c
Merging bpf-next/for-next (017822b63c72 Merge branch 'bpf-next/master' into=
 for-next)
Merging ipsec-next/master (939ba8c5b81c MAINTAINERS: Add entry for XFRM doc=
umentation)
Merging mlx5-next/mlx5-next (5422318e27d7 net/mlx5: Expose definition for 1=
600Gbps link mode)
Merging netfilter-next/main (61e628023d79 Merge branch 'net_sched-speedup-q=
disc-dequeue')
Merging ipvs-next/main (c9dfb92de073 Merge branch 'mlx5-next' of git://git.=
kernel.org/pub/scm/linux/kernel/git/mellanox/linux)
Merging bluetooth/master (74d9900f3087 Bluetooth: SMP: Fix not generating m=
ackey and ltk when repairing)
CONFLICT (content): Merge conflict in include/net/bluetooth/hci.h
CONFLICT (content): Merge conflict in net/bluetooth/iso.c
Merging wireless-next/for-next (f9e788c5fd3a wifi: mac80211: allow sharing =
identical chanctx for S1G interfaces)
Merging ath-next/for-next (c99ebb613259 Merge git://git.kernel.org/pub/scm/=
linux/kernel/git/netdev/net)
Merging iwlwifi-next/next (85d002b2ac56 wifi: iwlwifi: mld: remove unused v=
ariable in d3.c)
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (64ef5f454e16 mtd: mtdpart: ignore error -ENOENT from =
parsers on subpartitions)
Merging nand/nand/next (b98994cb9bc2 mtd: spinand: esmt: add support for F5=
0L1G41LC)
Merging spi-nor/spi-nor/next (ed26bd40df11 mailmap: update Pratyush Yadav's=
 email address)
Merging crypto/master (ebbdf6466b30 crypto: ahash - Zero positive err value=
 in ahash_update_finish)
Merging libcrypto/libcrypto-next (c0127f3ad65e Merge remote-tracking branch=
es 'ebiggers/libcrypto-tests', 'ebiggers/libcrypto-aes-gcm', 'ebiggers/libc=
rypto-fpsimd-on-stack' and 'ebiggers/libcrypto-at-least' into libcrypto-nex=
t)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging drm/drm-next (1a22e175b311 Merge tag 'drm-rust-next-2025-11-21' of =
https://gitlab.freedesktop.org/drm/rust/kernel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dm=
c.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_pci.c
Merging drm-exynos/for-linux-next (3a8660878839 Linux 6.18-rc1)
Merging drm-misc/for-linux-next (31d3354f42c0 drm/nouveau: verify that hard=
ware supports the flush page address)
Merging amdgpu/drm-next (5427e32fa3a0 drm/amdgpu: fix cyan_skillfish2 gpu i=
nfo fw handling)
Merging drm-intel/for-linux-next (611d4d160616 Merge tag 'mediatek-drm-next=
-20251120' of https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/=
linux into drm-next)
Merging drm-msm/msm-next (7bc29d5fb6fa dt-bindings: display/msm/gmu: Add Ad=
reno X2-85 GMU)
Merging drm-msm-lumag/msm-next-lumag (e2f085ab8636 dt-bindings: display: ms=
m: sm6150-mdss: Fix example indentation and OPP values)
Merging drm-rust/drm-rust-next (57dc2ea0b7bd rust: slice: fix broken intra-=
doc links)
Merging drm-nova/nova-next (93296e9d9528 gpu: nova-core: vbios: store refer=
ence to Device where relevant)
Merging drm-xe/drm-xe-next (43fb9e113bf1 drm/xe/gt: Introduce runtime suspe=
nd/resume)
  28aeaed130e8 ("drm/xe/oa: Fix potential UAF in xe_oa_add_config_ioctl()")
  562b0f254d8b ("drm/xe/pf: Fix kernel-doc warning in migration_save_consum=
e")
  78ff838a8ab7 ("drm/xe/pf: Check for fence error on VRAM save/restore")
  dab751b4240f ("drm/xe/pf: Drop the VF VRAM BO reference on successful res=
tore")
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/tests/xe_mocs.c
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (7ecb5c36b136 fbdev: gxt4500fb: Use dev_err instead =
of printk)
Merging regmap/for-next (d40e1d95246b Merge remote-tracking branch 'regmap/=
for-6.19' into regmap-next)
Merging sound/for-next (b72a6ddf6af2 ALSA: hda/realtek: fix mute/micmute LE=
Ds don't work for HP 200 G2i)
Merging ieee1394/for-next (036176d9dba7 firewire: core: abort pending trans=
actions at card removal)
Merging sound-asoc/for-next (3362786aaba1 Merge remote-tracking branch 'aso=
c/for-6.19' into asoc-next)
Merging modules/modules-next (1ddac5cd7f27 MAINTAINERS: Add myself as revie=
wer for module support)
Merging input/next (a311c777f298 dt-bindings: touchscreen: consolidate simp=
le touch controller to trivial-touch.yaml)
Merging block/for-next (e8a31aa2e00a Merge branch 'for-6.19/io_uring' into =
for-next)
CONFLICT (content): Merge conflict in io_uring/rw.c
Merging device-mapper/for-next (fcdfebc35f75 MAINTAINERS: add Benjamin Marz=
inski as a device mapper maintainer)
Merging libata/for-next (1d779fa9962f ata: pata_pcmcia: Add Iomega Clik! PC=
MCIA ATA/ATAPI Adapter)
Merging pcmcia/pcmcia-next (4a81f78caa53 pcmcia: Add error handling for add=
_interval() in do_validate_mem())
Merging mmc/next (79cf71c0b177 mmc: sdhci-of-dwcmshc: reduce CIT for better=
 performance)
Merging mfd/for-mfd-next (44c603f35cad mfd: sec: Drop a stray semicolon)
Merging backlight/for-backlight-next (d3cc7cd7bc46 backlight: aw99706: Fix =
unused function warnings from suspend/resume ops)
Merging battery/for-next (8e8856396b54 Revert "power: supply: qcom_battmgr:=
 support disabling charge control")
CONFLICT (content): Merge conflict in drivers/power/supply/intel_dc_ti_batt=
ery.c
Merging regulator/for-next (545fbfcbfb4b Merge remote-tracking branch 'regu=
lator/for-6.19' into regulator-next)
Merging security/next (9a948eefad59 lsm: use unrcu_pointer() for current->c=
red in security_init())
Merging apparmor/apparmor-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging integrity/next-integrity (738c9738e690 ima: Handle error code retur=
ned by ima_filter_rule_match())
Merging selinux/next (cdcf0b369d40 Automated merge of 'dev' into 'next')
Merging smack/next (29c701f90b93 Smack: function parameter 'gfp' not descri=
bed)
Merging tomoyo/master (b24e217157fd net/can/j1939: add j1939_session debugg=
ing)
Merging tpmdd/next (35ef1e24392f KEYS: trusted: Use tpm_ret_to_err() in tru=
sted_tpm2)
Merging watchdog/master (5bcc5786a0cf watchdog: starfive: Fix resource leak=
 in probe error path)
Merging iommu/next (138c5a509fa1 Merge branches 'arm/smmu/updates', 'arm/sm=
mu/bindings', 'mediatek', 'nvidia/tegra', 'intel/vt-d', 'amd/amd-vi' and 'c=
ore' into next)
Merging audit/next (c8a3dfe73159 audit: merge loops in __audit_inode_child(=
))
Merging devicetree/for-next (546dbb022310 of: Skip devicetree kunit tests w=
hen RISCV+ACPI doesn't populate root node)
Merging dt-krzk/for-next (3a8660878839 Linux 6.18-rc1)
Merging mailbox/for-next (3f39f5652037 mailbox: mtk-cmdq: Remove pm_runtime=
 APIs from cmdq_mbox_send_data())
Merging spi/for-next (5f8fbb72714e Merge remote-tracking branch 'spi/for-6.=
19' into spi-next)
Merging tip/master (3fde0f05218c Merge branch into tip/master: 'x86/sgx')
CONFLICT (content): Merge conflict in kernel/bpf/stackmap.c
Applying: fix up for "sched/mmcid: Use proper data structures"
Merging clockevents/timers/drivers/next (d1780dce9575 clocksource/drivers: =
Add Realtek system timer driver)
Merging edac/edac-for-next (814b332921b6 Merge ras/edac-amd-atl into for-ne=
xt)
Merging ftrace/for-next (b668bb6dfc3a Merge unused-tracepoints/for-next)
CONFLICT (content): Merge conflict in Documentation/tools/rtla/common_optio=
ns.txt
Merging rcu/next (3fa5aca16a36 Merge branches 'rcu/misc', 'rcu/srcu' and 'r=
cu/refscale' into next)
Merging paulmck/non-rcu/next (7f8fcc6f09fb memory-barriers.txt: Sort wait_e=
vent* and wait_on_bit* list alphabetically)
Merging kvm/next (6b36119b94d0 KVM: x86: Export KVM-internal symbols for su=
b-modules only)
Merging kvm-arm/next (caca1d7c3367 Merge branch 'kvm-arm64/vgic-lr-overflow=
' into kvmarm/next)
CONFLICT (content): Merge conflict in arch/arm64/kvm/vgic/vgic-v3.c
Merging kvms390/next (98afdebb1543 KVM: s390: Use generic VIRT_XFER_TO_GUES=
T_WORK functions)
CONFLICT (content): Merge conflict in Documentation/virt/kvm/api.rst
CONFLICT (content): Merge conflict in include/uapi/linux/kvm.h
Merging kvm-ppc/topic/ppc-kvm (c17b750b3ad9 Linux 6.17-rc2)
Merging kvm-riscv/riscv_kvm_next (3239c52fd212 RISC-V: KVM: Flush VS-stage =
TLB after VCPU migration for Andes cores)
Merging kvm-x86/next (115d5de2eef3 Merge branch 'vmx')
CONFLICT (content): Merge conflict in arch/x86/include/asm/cpufeatures.h
CONFLICT (content): Merge conflict in arch/x86/kernel/cpu/bugs.c
CONFLICT (content): Merge conflict in virt/kvm/guest_memfd.c
Merging xen-tip/linux-next (a73d4a055622 drivers/xen/xenbus: Replace deprec=
ated strcpy in xenbus_transaction_end)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (6d90215dc015 workqueue: Don't rely on wq->resc=
uer to stop rescuer)
Merging sched-ext/for-next (e090182ceee2 Merge branch 'for-6.19' into for-n=
ext)
CONFLICT (content): Merge conflict in kernel/sched/ext.c
Merging drivers-x86/for-next (5c14bff570dc platform/x86/uniwill: Add TUXEDO=
 devices)
Merging chrome-platform/for-next (52075d2c7595 platform/chrome: sensorhub: =
Support devices without FIFO_INT_ENABLE)
Merging chrome-platform-firmware/for-firmware-next (3a8660878839 Linux 6.18=
-rc1)
Merging hsi/for-next (3a8660878839 Linux 6.18-rc1)
Merging leds-lj/for-leds-next (072cd5f458d7 leds: rgb: leds-qcom-lpg: Don't=
 enable TRILED when configuring PWM)
Merging ipmi/for-next (35bcedc1a793 MAINTAINERS: Add entry on Loongson-2K I=
PMI driver)
Merging driver-core/driver-core-next (ea34511aaf75 driver core: Check drive=
rs_autoprobe for all added devices)
CONFLICT (content): Merge conflict in drivers/gpu/nova-core/driver.rs
CONFLICT (content): Merge conflict in rust/kernel/debugfs/traits.rs
CONFLICT (content): Merge conflict in samples/rust/rust_debugfs.rs
CONFLICT (content): Merge conflict in samples/rust/rust_debugfs_scoped.rs
Merging usb/usb-next (c7bbc43a1769 Merge tag 'usb-serial-6.19-rc1' of ssh:/=
/gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-nex=
t)
Merging thunderbolt/next (479d186fc946 thunderbolt: Fix typos in xdomain.c)
Merging usb-serial/usb-next (072f2c495725 USB: serial: option: move Telit 0=
x10c7 composition in the right place)
Merging tty/tty-next (75a9f4c54770 serial: sh-sci: Fix deadlock during RSCI=
 FIFO overrun error)
CONFLICT (content): Merge conflict in drivers/tty/serial/8250/8250_rsa.c
Merging char-misc/char-misc-next (cbe1d77ed84a hangcheck-timer: fix coding =
style spacing)
CONFLICT (content): Merge conflict in drivers/firmware/stratix10-svc.c
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
Merging phy-next/next (3b64ea4768e7 phy: fsl-imx8mq-usb: support alternate =
reference clock)
Merging soundwire/next (96e539b24be5 soundwire: send multi sections in one =
BPT stream)
Merging extcon/extcon-next (b4338338aa3d extcon: usbc-tusb320: Make typec-p=
ower-opmode optional)
Merging gnss/gnss-next (f5ef3f722d76 dt-bindings: gnss: fix timepulse descr=
iption)
Merging vfio/next (fa804aa4ac1b Merge tag 'vfio-v6.19-dma-buf-v9+' into v6.=
19/vfio/next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gvt/kvmgt.c
CONFLICT (content): Merge conflict in kernel/dma/direct.c
Merging w1/for-next (a5d908e0ec05 w1: omap-hdq: Remove redundant pm_runtime=
_mark_last_busy() calls)
Merging spmi/spmi-next (0ff41df1cb26 Linux 6.15)
Merging staging/staging-next (502ddcc405b6 staging: rtl8723bs: fix out-of-b=
ounds read in OnBeacon ESR IE parsing)
CONFLICT (content): Merge conflict in drivers/platform/Kconfig
CONFLICT (content): Merge conflict in drivers/platform/Makefile
Merging counter-next/counter-next (b462fcd08dd5 MAINTAINERS: Update Intel Q=
uadrature Encoder Peripheral maintainer)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (2b11e7403a8e dt-bindings: dma: xilinx: Simplify dma=
-coherent property)
Merging cgroup/for-next (004d6fbaf4fc Merge branch 'for-6.19' into for-next)
CONFLICT (content): Merge conflict in kernel/cgroup/cpuset.c
Merging scsi/for-next (87ff3a759db2 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (38725491e766 scsi: MAINTAINERS: Add the UFS incl=
ude directory)
Merging vhost/linux-next (f84451e7e54e vhost: use "checked" versions of get=
_user() and put_user())
Merging rpmsg/for-next (ba19afd42d91 Merge branches 'rproc-next' and 'rpmsg=
-next' into for-next)
Merging gpio-brgl/gpio/for-next (7b78b26757e0 gpio: shared: handle the rese=
t-gpios corner case)
Merging gpio-intel/for-next (b2a186cced11 gpiolib: acpi: use min() instead =
of min_t())
Merging pinctrl/for-next (2d432ce3a98d Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (8daf70e6aa41 Merge patch series "pinctrl: i=
ntel: Export intel_gpio_add_pin_ranges() and use it")
Merging pinctrl-renesas/renesas-pinctrl (3b0cf6ab3590 pinctrl: renesas: rzg=
2l: Refactor OEN register PWPR handling)
Merging pinctrl-samsung/for-next (3cfc60e09bdc pinctrl: samsung: Add ARTPEC=
-9 SoC specific configuration)
Merging pwm/pwm/for-next (fae00ea9f003 pwm: rzg2l-gpt: Allow checking perio=
d_tick cache value only if sibling channel is enabled)
CONFLICT (content): Merge conflict in rust/macros/module.rs
Applying: fix up for "pwm: Add Rust driver for T-HEAD TH1520 SoC"
Merging ktest/for-next (a5e71638ddd7 ktest.pl: Add new PATCHCHECK_SKIP opti=
on to skip testing individual commits)
Merging kselftest/next (a2f7990d3309 selftests: tracing: Update fprobe self=
test for ftrace based fprobe)
Merging kunit/test (3a8660878839 Linux 6.18-rc1)
Merging kunit-next/kunit (7bc16e72ddb9 kunit: Make filter parameters config=
urable via Kconfig)
Merging livepatching/for-next (5cb5575308bc selftests: livepatch: use canon=
ical ftrace path)
Merging rtc/rtc-next (9d6d6b06933c rtc: nvvrs: add NVIDIA VRS RTC device dr=
iver)
Merging nvdimm/libnvdimm-for-next (30065e73d7c0 nvdimm: Prevent integer ove=
rflow in ramdax_get_config_data())
Merging at24/at24/for-next (aef72ebe9c86 dt-bindings: eeprom: at24: Add com=
patible for Belling BL24S64)
Merging ntb/ntb-next (68113d260674 NTB/msi: Remove unused functions)
Merging seccomp/for-next/seccomp (b0c9bfbab925 selftests/seccomp: Add a tes=
t for the WAIT_KILLABLE_RECV fast reply race)
Merging slimbus/for-next (3a8660878839 Linux 6.18-rc1)
Merging nvmem/for-next (3a8660878839 Linux 6.18-rc1)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (a45a80914e51 mshv: Add ioctl for self targeted =
passthrough hvcalls)
CONFLICT (content): Merge conflict in drivers/hv/mshv_root_main.c
Merging auxdisplay/for-next (00de283c53c9 Merge patch series "auxdisplay: l=
inedisp: support attribute attachment to auxdisplay devices")
Merging kgdb/kgdb/for-next (fdbdd0ccb30a kdb: remove redundant check for sc=
ancode 0xe0)
Merging hmm/hmm (19272b37aa4f Linux 6.16-rc1)
Merging cfi/cfi/next (3a8660878839 Linux 6.18-rc1)
Merging mhi/mhi-next (ac35e04f8000 bus: mhi: host: pci_generic: Add Foxconn=
 T99W760 modem)
Merging memblock/for-next (e68f150bc11d memblock: drop for_each_free_mem_pf=
n_range_in_zone_from())
Merging cxl/next (ea5514e30056 Merge branch 'for-6.19/cxl-misc' into cxl-fo=
r-next)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (7a2ff00c3b5e docs: efi: add CPER functions to driver-api)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (a8ec08bf3259 Merge branch 'slab/for-6.19/mempoo=
l_alloc_bulk' into slab/for-next)
Merging random/master (90fb9b98fcf5 random: complete sentence of comment)
Merging landlock/next (3ef6e4434e3a selftests/landlock: Add disconnected le=
afs and branch test suites)
Merging rust/rust-next (54e3eae85562 Merge patch series "`syn` support")
CONFLICT (content): Merge conflict in rust/kernel/debugfs/file_ops.rs
CONFLICT (content): Merge conflict in rust/kernel/debugfs/traits.rs
CONFLICT (content): Merge conflict in rust/kernel/opp.rs
CONFLICT (content): Merge conflict in rust/kernel/pci/id.rs
CONFLICT (content): Merge conflict in rust/kernel/str.rs
Applying: fix up 3 for "rust: replace `CStr` with `core::ffi::CStr`"
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
Merging execve/for-next/execve (8c94db0ae97c binfmt_elf: preserve original =
ELF e_flags for core dumps)
Merging bitmap/bitmap-for-next (a322638c15a6 rust_binder: use bitmap for al=
location of handles)
Applying: fix up for "bitfield: Add non-constant field_{prep,get}() helpers"
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (7454048db27d kbuild: Enable GCC diagnostic cont=
ext for value-tracking warnings)
Merging nolibc/for-next (1d573464749c selftests/nolibc: error out on linker=
 warnings)
Merging iommufd/for-next (5185c4d8a56b Merge branch 'iommufd_dmabuf' into k=
.o-iommufd/for-next)
Merging turbostat/next (7d10c01f542a tools/power/turbostat: Set per_cpu_msr=
_sum to NULL after free)
Merging pwrseq/pwrseq/for-next (3a8660878839 Linux 6.18-rc1)
Merging capabilities-next/caps-next (9891d2f79a9f Clarify the rootid_owns_c=
urrentns)
Merging ipe/next (80bde9648247 ipe: Update documentation for script enforce=
ment)
Merging kcsan/next (dcb6fa37fd7b Linux 6.18-rc3)
Merging crc/crc-next (dcb6fa37fd7b Linux 6.18-rc3)
Merging fwctl/for-next (211ddde0823f Linux 6.18-rc2)
Merging devsec-tsm/next (f7ae6d4ec652 PCI/TSM: Add 'dsm' and 'bound' attrib=
utes for dependent functions)
Merging hisilicon/for-next (6c177775dcc5 Merge branch 'next/drivers' into f=
or-next)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)

--Sig_/rYr+Fmk/HVVWCrDiHv+CsKx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkpMzgACgkQAVBC80lX
0Gz5Agf/Wx0iuYXZwYm2D38K2+8XcSrHBBqYn49XXcH6jQ0fyR7vakvOCkIjSi3U
DYQxhvXWNUuVC7TtAJrxO0e4JqaLXzC4u/KtjwV8KOfEhPtjLahq6jZGGG0lWcwa
ASh/MnleZjFBm+krImcvB8kAxqpNroNDLTW/oSRWI14v4jtI2HbRDnQDDFsBiB4v
Qs0Lzwsqt8P/umtr7/xSRB7FXFtJ4OyMqLeqwAdkxwa1bbHA5QaFXVmp0+ih+P1r
Zq0Lgtjo+UVTLLCah6TtAFTLw05oNTxJZJYPv5VZrNMAoLMPmrGEjbuZ07L7vL8r
sjaSmI7MLsm2Nz7JoYC9w8Ay2zc8ig==
=HTjZ
-----END PGP SIGNATURE-----

--Sig_/rYr+Fmk/HVVWCrDiHv+CsKx--

