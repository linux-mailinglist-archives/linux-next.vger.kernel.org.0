Return-Path: <linux-next+bounces-9137-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA2EC77819
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 07:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CFA3734E6E8
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 06:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9602836BE;
	Fri, 21 Nov 2025 06:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hbPPoHRD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2295271A94;
	Fri, 21 Nov 2025 06:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763705315; cv=none; b=uvlTOjKnOKaA9yW9cLctyhlhdPqe140VOkOO18vFwrYEYmppTKHM5VWSIKpUhtg3wKMNItxdn7EhNSKzC01YO2nQWJb4OMVUPPrZezkTkRkGv6KsTYe9hbuPE2V3LANmYIdZp/ndIqpsf3AhqxiKtLl6YVPKUBb64jtf6MjnSs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763705315; c=relaxed/simple;
	bh=/a40pqGu/lOMBsoS2CWS6C1rkA6yKddMGkPi5eaae1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UQGaVN0Xy5VKGkrHQiy8WNSqJGjUyVLa2MXH0Z9vU4DYRHgo3QN39vpvKE2DDWQ8jji5r9HZKL0h0wEnt7+AdwbcTn4N7Slr4mA9AnKD3rOAGTGjZbbw7/6HQrYZfDV/hsLrCtJUI/TUAM9pTJCSmzz16WC3dUe5CrXYH7FcUho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hbPPoHRD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763705303;
	bh=ZksRjJnjCN/v2drjhcHYoiE1yuAGCgclzxM5UfESjls=;
	h=Date:From:To:Cc:Subject:From;
	b=hbPPoHRDNFxHQs/Q0orvWJ2uGgpq0A2PxmcidtaMwWjx/tINnUfU/qW4ZueuWO1xb
	 8/w4VfezDQoFDGJSffjX3eTfsQtem/P5KNDP0+uykKKnjdmkfNZdcAr1pmUlb4xBSv
	 lVK9g+Q5DOQM8SYYROVmh/227JMldJRmmCFzOvKuoJUCVgTCFGsOaMkgQUg8VMX1mB
	 VGkhVft8Fxusa7uXgx8xaTLaVSZ594GorunT3dgzcM0yrGsLeZbMiAATpk1GMru0Af
	 cesPuovrvqszRNq788km4GiIq47mfEIX5ENSpth8Qkfgcm058MRnYVZIiXebNhOlPT
	 /UQQzod6jrjuQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dCPsg22RQz4wD7;
	Fri, 21 Nov 2025 17:08:23 +1100 (AEDT)
Date: Fri, 21 Nov 2025 17:08:22 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 21
Message-ID: <20251121170822.4a3d5302@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kUK73Sdl41kHX5hOzLz/F8P";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kUK73Sdl41kHX5hOzLz/F8P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20251120:

This kernel produces a warning at boot time.

The vfs-brauner tree still had its build failure so I used a supplied
patch.

The vfs tree gained conflicts against the vfs-brauner tree.

The mm-nonmm-unstable lost its build failure.

The reset tree gained a build failure so I used the version from
next-20251120.

The tip tree gained a semantic conflict against the arm64 tree.

The ftrace tree gained a conflict against the jc_docs tree.

The kvms390 tree gained a conflict against the kvm-arm tree.

The staging tree gained a conflict against the drivers-x86 tree.

The gpio-brgl tree gained the same build failure as the reset tree so
I used the version from next-20251120.

The landlock tree gained a conflict against the vfs-brauner tree.

Non-merge commits (relative to Linus' tree): 9961
 10061 files changed, 479216 insertions(+), 164569 deletions(-)

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
Merging origin/master (fd95357fd8c6 Merge tag 'sched_ext-for-6.18-rc6-fixes=
-2' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext)
Merging fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging ext4-fixes/fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging vfs-brauner-fixes/vfs.fixes (e9d50b78fdfe Merge patch series "fs: a=
dd iput_not_last()")
Merging fscrypt-current/for-current (1e39da974ce6 fscrypt: fix left shift u=
nderflow when inode->i_blkbits > PAGE_SHIFT)
Merging fsverity-current/for-current (211ddde0823f Linux 6.18-rc2)
Merging btrfs-fixes/next-fixes (6b512fe9e216 Merge branch 'misc-6.18' into =
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
Merging btrfs/for-next (37072829b484 Merge branch 'for-next-next-v6.18-2025=
1119' into for-next-20251119)
Merging ceph/master (87ab14795a89 libceph: drop started parameter of __ceph=
_open_session())
Merging cifs/for-next (ad44326d0f91 smb: client: show smb lease key in open=
_dirs output)
Merging configfs/configfs-next (462272dd734b configfs: use PTR_ERR_OR_ZERO(=
) to simplify code)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (8e4021078863 dlm: check for undefined release_option valu=
es)
Merging erofs/dev (e2d3af0d64e5 erofs: drop redundant sanity check for ztai=
lpacking inline)
Merging exfat/dev (3577231895ec exfat: fix divide-by-zero in exfat_allocate=
_bitmap)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (25554ea0b42b Pull udf extent block verification.)
Merging ext4/dev (103ce01cd045 ext4: add i_data_sem protection in ext4_dest=
roy_inline_data_nolock())
Merging f2fs/dev (ca244e9242a1 f2fs: fix to detect recoverable inode during=
 dryrun of find_fsync_dnodes())
Merging fsverity/for-next (211ddde0823f Linux 6.18-rc2)
Merging fuse/for-next (b4909ae8d4e9 fuse: refactor fuse_conn_put() to remov=
e negative logic.)
Merging gfs2/for-next (45c733b47f9b gfs2: Clean up SDF_JOURNAL_LIVE flag ha=
ndling)
Merging jfs/jfs-next (cafc6679824a jfs: replace hardcoded magic number with=
 DTPAGEMAXSLOT constant)
Merging ksmbd/ksmbd-for-next (6a23ae0a96a6 Linux 6.18-rc6)
Merging nfs/linux-next (6a23ae0a96a6 Linux 6.18-rc6)
Merging nfs-anna/linux-next (b623390045a8 NFS: Fix LTP test failures when t=
imestamps are delegated)
Merging nfsd/nfsd-next (78cd170d035f nfsd: Use MD5 library instead of crypt=
o_shash)
Merging ntfs3/master (2469f2e78d07 fs/ntfs3: Fix spelling mistake "recommen=
ed" -> "recommended")
Merging orangefs/for-next (11f6bce77e27 fs/orangefs: Replace kzalloc + copy=
_from_user with memdup_user_nul)
Merging overlayfs/overlayfs-next (ad1423922781 ovl: make sure that ovl_crea=
te_real() returns a hashed dentry)
Merging ubifs/next (99dbb2a1bd66 ubifs: stop using write_cache_pages)
Merging v9fs/9p-next (1f3e4142c0eb 9p: convert to the new mount API)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (9b0305968d60 xfs: remove the unused bv field in struc=
t xfs_gc_bio)
Merging zonefs/for-next (a42938e80357 zonefs: correct some spelling mistake=
s)
Merging vfs-brauner/vfs.all (e72adadba24a Merge branch 'vfs-6.19.autofs' in=
to vfs.all)
CONFLICT (content): Merge conflict in fs/btrfs/file.c
CONFLICT (content): Merge conflict in fs/nfs/localio.c
CONFLICT (content): Merge conflict in fs/nfsd/nfs4recover.c
Applying: vfs: add needed headers for new struct delegation definition
Merging vfs/for-next (eb028c33451a d_make_discardable(): warn if given a no=
n-persistent dentry)
CONFLICT (content): Merge conflict in Documentation/filesystems/porting.rst
CONFLICT (content): Merge conflict in fs/dcache.c
CONFLICT (content): Merge conflict in fs/debugfs/inode.c
CONFLICT (content): Merge conflict in security/apparmor/apparmorfs.c
Merging mm-hotfixes/mm-hotfixes-unstable (2db4c4cf7b00 mm/filemap: fix logi=
c around SIGBUS in filemap_map_pages())
Merging fs-current (ed92ad3db686 Merge branch 'fixes' of https://git.kernel=
.org/pub/scm/linux/kernel/git/viro/vfs.git)
Merging kbuild-current/kbuild-fixes (4ab2ee307983 kbuild: install-extmod-bu=
ild: Properly fix CC expansion when ccache is used)
Merging arc-current/for-curr (d7b8f8e20813 Linux 6.16-rc5)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (8e8ae788964a arm64: Reject modules with=
 internal alternative callbacks)
Merging arm-soc-fixes/arm/fixes (7a601324ac98 MAINTAINERS: sync omap device=
tree maintainers with omap platform)
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
Merging net/main (8e621c9a3375 Merge tag 'net-6.18-rc7' of git://git.kernel=
.org/pub/scm/linux/kernel/git/netdev/net)
Merging bpf/master (7a0892d2836e Merge tag 'pci-v6.18-fixes-5' of git://git=
.kernel.org/pub/scm/linux/kernel/git/pci/pci)
Merging ipsec/master (a55ef3bff84f xfrm: fix memory leak in xfrm_add_acquir=
e())
Merging netfilter/main (de0337d641bf net: ionic: map SKB after pseudo-heade=
r checksum prep)
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
Merging rdma-fixes/for-rc (da32d155f4a8 Merge tag 'gpio-fixes-for-v6.18-rc5=
' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux)
Merging sound-current/for-linus (5719a189c934 ALSA: hda/cirrus fix cs420x M=
acPro 6,1 inverted jack detection)
Merging sound-asoc-fixes/for-linus (2196e8172bee ASoC: codecs: Fix error ha=
ndling in pm4125 audio codec driver)
Merging regmap-fixes/for-linus (6146a0f1dfae Linux 6.18-rc4)
Merging regulator-fixes/for-linus (6a23ae0a96a6 Linux 6.18-rc6)
Merging spi-fixes/for-linus (295fe8406a35 spi: cadence-quadspi: Fix cqspi_p=
robe() error handling for runtime pm)
Merging pci-current/for-linus (3a8660878839 Linux 6.18-rc1)
Merging driver-core.current/driver-core-linus (dcb6fa37fd7b Linux 6.18-rc3)
Merging tty.current/tty-linus (eb4917f557d4 serial: amba-pl011: prefer dma_=
mapping_error() over explicit address checking)
Merging usb.current/usb-linus (2e558d86e097 Merge tag 'usb-serial-6.18-rc6'=
 of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial int=
o usb-linus)
Merging usb-serial-fixes/usb-linus (523bf0a59e67 USB: serial: option: add s=
upport for Rolling RW101R-GL)
Merging phy/fixes (3a8660878839 Linux 6.18-rc1)
Merging staging.current/staging-linus (dcb6fa37fd7b Linux 6.18-rc3)
Merging iio-fixes/fixes-togreg (74f97a468356 iio: adc: at91-sama5d2_adc: Fi=
x potential use-after-free in sama5d2_adc driver)
Merging counter-current/counter-current (109ff654934a counter: microchip-tc=
b-capture: Allow shared IRQ for multi-channel TCBs)
Merging char-misc.current/char-misc-linus (d6b9ce75e87c Merge tag 'stratix1=
0_svc_fix_v6.18' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/ding=
uyen/linux into char-misc-linus)
Merging soundwire-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging thunderbolt-fixes/fixes (3575254546a2 thunderbolt: Add support for =
Intel Wildcat Lake)
Merging input-current/for-linus (ae8966b7b5bd Input: rename INPUT_PROP_HAPT=
IC_TOUCHPAD to INPUT_PROP_PRESSUREPAD)
Merging crypto-current/master (59b0afd01b2c crypto: hisilicon/qm - Fix devi=
ce reference leak in qm_get_qos_value)
Merging libcrypto-fixes/libcrypto-fixes (44e8241c51f7 lib/crypto: arm/curve=
25519: Disable on CPU_BIG_ENDIAN)
Merging vfio-fixes/for-linus (d323ad739666 vfio: selftests: replace iova=3D=
vaddr with allocated iovas)
Merging kselftest-fixes/fixes (dd4adb986a86 selftests/tracing: Run sample e=
vents to clear page cache events)
Merging dmaengine-fixes/fixes (81935b90b6fc dmaengine: xilinx: xdma: Fix re=
gmap max_register)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (97315e7c901a mtd: onenand: Pass correct pointe=
r to IRQ handler)
Merging mfd-fixes/for-mfd-fixes (3a8660878839 Linux 6.18-rc1)
Merging v4l-dvb-fixes/fixes (27afd6e066cf media: videobuf2: forbid remove_b=
ufs when legacy fileio is active)
Merging reset-fixes/reset/fixes (997c06330fd5 reset: imx8mp-audiomix: Fix b=
ad mask values)
Merging mips-fixes/mips-fixes (09782e72eec4 mips: dts: econet: fix EN751221=
 core type)
Merging at91-fixes/at91-fixes (3a8660878839 Linux 6.18-rc1)
Merging omap-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging kvm-fixes/master (3fa05f96fc08 KVM: SVM: Fix redundant updates of L=
BR MSR intercepts)
Merging kvms390-fixes/master (5f9df945d4e8 KVM: s390: Fix FOLL_*/FAULT_FLAG=
_* confusion)
Merging hwmon-fixes/hwmon (6a23ae0a96a6 Linux 6.18-rc6)
Merging nvdimm-fixes/libnvdimm-fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging cxl-fixes/fixes (214291cbaace acpi/hmat: Fix lockdep warning for hm=
em_register_resource())
Merging dma-mapping-fixes/dma-mapping-fixes (a50f7456f853 dma-mapping: Allo=
w use of DMA_BIT_MASK(64) in global scope)
Merging drivers-x86-fixes/fixes (db30233361f9 platform/x86: intel-uncore-fr=
eq: fix all header kernel-doc warnings)
Merging samsung-krzk-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging pinctrl-samsung-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging devicetree-fixes/dt/linus (76841259ac09 of: dynamic: Fix overlayed =
devices not probing because of fw_devlink)
Merging dt-krzk-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging scsi-fixes/fixes (90449f2d1e1f scsi: sg: Do not sleep in atomic con=
text)
Merging drm-fixes/drm-fixes (6a23ae0a96a6 Linux 6.18-rc6)
Merging drm-intel-fixes/for-linux-next-fixes (547456038177 drm/i915/xe3: Re=
strict PTL intel_encoder_is_c10phy() to only PHY A)
Merging mmc-fixes/fixes (739f04f4a462 mmc: dw_mmc-rockchip: Fix wrong inter=
nal phase calculate)
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
Merging iommufd-fixes/for-rc (afb47765f923 iommufd: Make vfio_compat's unma=
p succeed if the range is already empty)
Merging rust-fixes/rust-fixes (1c44c8ba8969 kallsyms: Fix wrong "big" kerne=
l symbol type read from procfs)
Merging w1-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging pmdomain-fixes/fixes (6a23ae0a96a6 Linux 6.18-rc6)
Merging i2c-host-fixes/i2c/i2c-host-fixes (8738d626030f i2c: fix reference =
leak in MP2 PCI device)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (3c493b524ffd Merge tag 'sunxi-clk-fixes-for-6.=
18' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into clk=
-fixes)
Merging thead-clk-fixes/thead-clk-fixes (3a8660878839 Linux 6.18-rc1)
Merging pwrseq-fixes/pwrseq/for-current (3a8660878839 Linux 6.18-rc1)
Merging thead-dt-fixes/thead-dt-fixes (3a8660878839 Linux 6.18-rc1)
Merging ftrace-fixes/ftrace/fixes (327e28664307 fgraph: Do not enable funct=
ion_graph tracer when setting funcgraph-args)
Merging ring-buffer-fixes/ring-buffer/fixes (e4d4b8670c44 ring-buffer: Use =
flush_kernel_vmap_range() over flush_dcache_folio())
Merging trace-fixes/trace/fixes (53afec2c8fb2 tracing/tools: Fix incorrcet =
short option in usage text for --threads)
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging tip-fixes/tip/urgent (bbaaa09484b5 Merge branch into tip/master: 'p=
erf/urgent')
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
Merging drm-misc-fixes/for-linux-next-fixes (cead55e24cf9 drm/plane: Fix cr=
eate_in_format_blob() return value)
Merging mm-stable/mm-stable (c3f7c506e8f1 mm: introduce VMA flags bitmap ty=
pe)
Merging mm-nonmm-stable/mm-nonmm-stable (58b6fcd2ab34 ocfs2: mark inode bad=
 upon validation failure during read)
Merging mm-unstable/mm-unstable (8e450401f320 memcg: remove __lruvec_stat_m=
od_folio)
Merging mm-nonmm-unstable/mm-nonmm-unstable (70f59b71f36d fork: stop ignori=
ng NUMA while handling cached thread stacks)
Merging kbuild/kbuild-next (deab487e0f9b kbuild: allow architectures to ove=
rride CC_CAN_LINK)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (d53b4996584b perf evsel: Skip store_evsel_ids=
 for non-perf-event PMUs)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (131971f67e25 dma-mapping: remove =
unused map_page callback)
Merging asm-generic/master (edcc8a38b5ac once: fix race by moving DO_ONCE t=
o separate section)
Merging alpha/alpha-next (d58041d2c63e MAINTAINERS: Add Magnus Lindholm as =
maintainer for alpha port)
Merging arm/for-next (eca2ec8c85ae Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (5d8d48764484 Merge branches 'for-next/misc', '=
for-next/kselftest', 'for-next/efi-preempt', 'for-next/assembler-macro', 'f=
or-next/typos', 'for-next/sysreg', 'for-next/sme-ptrace-disable', 'for-next=
/local-tlbi-page-reused', 'for-next/mpam' and 'for-next/defconfig' into for=
-next/core)
CONFLICT (content): Merge conflict in arch/arm64/include/asm/el2_setup.h
CONFLICT (content): Merge conflict in arch/arm64/mm/mmu.c
CONFLICT (content): Merge conflict in mm/memory.c
Merging arm-perf/for-next/perf (7ab06ea41af5 arch_topology: Provide a stub =
topology_core_has_smt() for !CONFIG_GENERIC_ARCH_TOPOLOGY)
Merging arm-soc/for-next (6fc5c6e08a48 Merge branch 'arm/fixes' into for-ne=
xt)
Merging amlogic/for-next (677efa12e8f9 Merge branch 'v6.19/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (5d21b7ca05c8 Merge branch 'apple-soc/=
drivers-6.19' into asahi-soc/for-next)
Merging at91/at91-next (fde90d654751 Merge branch 'at91-dt' into at91-next)
Merging bmc/for-next (0d53f2dab724 Merge branches 'aspeed/arm/dt' and 'aspe=
ed/fixes' into for-next)
Merging broadcom/next (37c3a91e9730 arm64: dts: broadcom: bcm2712: Add watc=
hdog DT node)
Merging cix/for-next (4889f68b824d Merge remote-tracking branch 'cix/dt' in=
to for-next)
Merging davinci/davinci/for-next (3a8660878839 Linux 6.18-rc1)
Merging drivers-memory/for-next (4434602ef5a8 Merge branch 'mem-ctrl-next' =
into for-next)
Merging fsl/soc_fsl (bdedc7414642 soc: fsl: qbman: add WQ_PERCPU to alloc_w=
orkqueue users)
Merging imx-mxs/for-next (89d95dbad2a3 Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (67ed5843a67b Merge branch 'v6.18-next/dts64' int=
o for-next)
Merging mvebu/for-next (86a99e9f5394 Merge branch 'mvebu/fixes' into mvebu/=
for-next)
Merging omap/for-next (2c85858e7c68 Merge branch 'omap-for-v6.19/drivers' i=
nto tmp/omap-next-20251117.085514)
Merging qcom/for-next (c17e270dfb34 Merge branches 'arm32-for-6.19', 'arm64=
-defconfig-for-6.19', 'arm64-for-6.19', 'clk-for-6.19' and 'drivers-for-6.1=
9' into for-next)
Merging renesas/next (fbec5d4783d5 Merge branches 'renesas-drivers-for-v6.1=
9' and 'renesas-dts-for-v6.19' into renesas-next)
Merging reset/reset/next (e72a55efb677 Merge tag 'reset-gpio-for-v6.19' int=
o reset/next)
$ git reset --hard HEAD^
Merging next-20251120 version of reset
Merging rockchip/for-next (4f0744c46de2 Merge branch 'v6.19-clk/next' into =
for-next)
Merging samsung-krzk/for-next (62f9c9186bbe Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (e5db90f4c044 Merge branch 'for-next/ffa/update=
s' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux=
 into for-linux-next)
Merging sophgo/for-next (8edc486bb38b Merge branch 'dt/riscv' into for-next)
Merging sophgo-soc/soc-for-next (c8754c7deab4 soc: sophgo: cv1800: rtcsys: =
New driver (handling RTC only))
Merging spacemit/for-next (5a97a38c2279 riscv: dts: spacemit: define all mi=
ssing I2C controller nodes)
Merging stm32/stm32-next (a6961e2ced51 arm64: dts: st: set RIFSC as an acce=
ss controller on stm32mp21x platforms)
Merging sunxi/sunxi/for-next (28493fd26fd6 Merge branches 'sunxi/dt-for-6.1=
9' and 'sunxi/drivers-for-6.19' into sunxi/for-next)
Merging tee/next (eb4bb32c8117 Merge branch 'qcomtee_fixes_for_6.18' into n=
ext)
Merging tegra/for-next (e016a50e00e6 Merge branch for-6.19/arm64/defconfig =
into for-next)
CONFLICT (content): Merge conflict in arch/arm/configs/tegra_defconfig
Merging tenstorrent-dt/tenstorrent-dt-for-next (a71e6e8eea8a riscv: defconf=
ig: Enable Tenstorrent SoCs)
Merging thead-dt/thead-dt-for-next (d8a174babf64 riscv: dts: thead: Add res=
et controllers of more subsystems for TH1520)
Merging ti/ti-next (b3109b9c541b Merge branch 'ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (a35dc981c5d8 Merge branch 'zynqmp/defconfig' into =
for-next)
Merging clk/clk-next (cff69b2e54aa Merge branch 'clk-renesas' into clk-next)
Merging clk-imx/for-next (fdc1dc7dd53b clk: imx: add driver for imx8ulp's s=
im lpav)
Merging clk-renesas/renesas-clk (5fb2f67341bd clk: renesas: r9a09g077: Add =
SPI module clocks)
Merging thead-clk/thead-clk-for-next (3a8660878839 Linux 6.18-rc1)
Merging csky/linux-next (817d21578d51 csky: Remove compile warning for CONF=
IG_SMP)
Merging loongarch/loongarch-next (677e6123e3d2 LoongArch: BPF: Disable tram=
poline for kernel module function trace)
Merging m68k/for-next (695f2c0c25f3 m68k: defconfig: Update defconfigs for =
v6.17-rc1)
Merging m68knommu/for-next (6a23ae0a96a6 Linux 6.18-rc6)
Merging microblaze/next (7f7072574127 Merge tag 'kbuild-6.18-1' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/kbuild/linux)
Merging mips/mips-next (e9a6fb0bcdd7 Linux 6.18-rc5)
Merging openrisc/for-next (8c30b0018f9d openrisc: Add jump label support)
Merging parisc-hd/for-next (75b51437a4ac parisc: Drop linux/kernel.h includ=
e from asm/bug.h header)
Merging powerpc/next (fb2ff9fa72e2 powerpc/smp: Expose die_id and die_cpuma=
sk)
Merging risc-v/for-next (36313cea1273 riscv: mm: use xchg() on non-atomic_l=
ong_t variables, not atomic_long_xchg())
CONFLICT (content): Merge conflict in MAINTAINERS
Merging riscv-dt/riscv-dt-for-next (1088d49b6264 riscv: dts: microchip: ena=
ble qspi adc/mmc-spi-slot on BeagleV Fire)
Merging riscv-soc/riscv-soc-for-next (0e56677e5840 Merge branch 'riscv-cach=
e-for-next' into riscv-soc-for-next)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging s390/for-next (103e62c60298 Merge branch 'features' into for-next)
CONFLICT (content): Merge conflict in include/linux/memory.h
Merging sh/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging sparc/for-next (fe0126702a40 sparc: Replace deprecated strcpy() wit=
h strscpy() in handle_nextprop_quirks())
Merging uml/next (293f71435d14 um: Always set up AT_HWCAP and AT_PLATFORM)
Merging xtensa/xtensa-for-next (4c8bad3ed035 xtensa: use HZ_PER_MHZ in plat=
form_calibrate_ccount)
Merging fs-next (894f47ff8df5 Merge branch 'for-next' of https://git.kernel=
.org/pub/scm/linux/kernel/git/viro/vfs.git)
CONFLICT (content): Merge conflict in arch/s390/kernel/syscalls/syscall.tbl
Merging printk/for-next (0598dd4678b6 Merge branch 'rework/suspend-fixes' i=
nto for-next)
Merging pci/next (ea837d44d23e Merge branch 'pci/controller/stm32')
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_vram.c
Merging pstore/for-next/pstore (b69255357368 pstore/ram: Update module para=
meters from platform data)
Merging hid/for-next (bc5de60998ad Merge branch 'for-6.19/core' into for-ne=
xt)
Merging i2c/i2c/for-next (e9a6fb0bcdd7 Linux 6.18-rc5)
Merging i2c-host/i2c/i2c-host (eeaaf5bc1c5b dt-bindings: i2c: qcom-cci: Doc=
ument Kaanapali compatible)
Merging i3c/i3c/next (ddb37d5b130e i3c: mipi-i3c-hci-pci: Add support for I=
ntel Nova Lake-S I3C)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (d56933e74d0d hwmon: (k10temp) Add AMD Ste=
am Deck APU ID)
Merging jc_docs/docs-next (34a28245b6a5 Merge branch 'python-modules' into =
docs-mw)
Merging v4l-dvb/next (1f2353f5a1af media: rockchip: rkcif: add support for =
rk3568 vicap mipi capture)
Merging v4l-dvb-next/master (adc218676eef Linux 6.12)
Merging pm/linux-next (d019d946bd0c Merge branch 'fixes' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (0194066ac1ca cpufreq: qcom-nvme=
m: fix compilation warning for qcom_cpufreq_ipq806x_match_list)
Merging cpupower/cpupower (059835bbfa28 tools/power/cpupower: Support build=
ing libcpupower statically)
Merging devfreq/devfreq-next (6146a0f1dfae Linux 6.18-rc4)
Merging pmdomain/next (0346625cd7f1 pmdomain: Extend the genpd governor for=
 CPUs to account for IPIs)
Merging opp/opp/linux-next (33ffb0aa8ce8 rust: opp: simplify callers of `to=
_c_str_array`)
Merging thermal/thermal/linux-next (dc67521c20b7 thermal/drivers/renesas/rz=
g3e: Fix add thermal driver for the Renesas RZ/G3E SoC)
Merging rdma/for-next (d056bc45b62b RDMA/core: Prevent soft lockup during l=
arge user memory region cleanup)
Merging net-next/main (9e203721ec61 Merge git://git.kernel.org/pub/scm/linu=
x/kernel/git/netdev/net)
Merging bpf-next/for-next (34240f55a035 Merge branch 'bpf-next/master' into=
 for-next)
Merging ipsec-next/master (939ba8c5b81c MAINTAINERS: Add entry for XFRM doc=
umentation)
Merging mlx5-next/mlx5-next (5422318e27d7 net/mlx5: Expose definition for 1=
600Gbps link mode)
Merging netfilter-next/main (c9dfb92de073 Merge branch 'mlx5-next' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/mellanox/linux)
Merging ipvs-next/main (c9dfb92de073 Merge branch 'mlx5-next' of git://git.=
kernel.org/pub/scm/linux/kernel/git/mellanox/linux)
Merging bluetooth/master (74d9900f3087 Bluetooth: SMP: Fix not generating m=
ackey and ltk when repairing)
CONFLICT (content): Merge conflict in include/net/bluetooth/hci.h
CONFLICT (content): Merge conflict in net/bluetooth/iso.c
Merging wireless-next/for-next (b688a9447be3 wifi: mac80211: refactor CMAC =
packet handlers)
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
Merging spi-nor/spi-nor/next (5008c3ec3f89 mtd: spi-nor: core: Check read C=
R support)
Merging crypto/master (76ce17f6f7f7 crypto: iaa - Fix incorrect return valu=
e in save_iaa_wq())
Merging libcrypto/libcrypto-next (10a1140107e0 Merge remote-tracking branch=
es 'ebiggers/libcrypto-tests', 'ebiggers/libcrypto-aes-gcm' and 'ebiggers/l=
ibcrypto-fpsimd-on-stack' into libcrypto-next)
Merging drm/drm-next (f0ded972d371 Merge tag 'drm-rust-next-2025-11-18' of =
https://gitlab.freedesktop.org/drm/rust/kernel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/inc/hw=
/hw_shared.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dm=
c.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_gt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_pci.c
Merging drm-exynos/for-linux-next (3a8660878839 Linux 6.18-rc1)
Merging drm-misc/for-linux-next (f3a1d69f9b38 Merge tag 'amd-drm-next-6.19-=
2025-11-14' of https://gitlab.freedesktop.org/agd5f/linux into drm-next)
Merging amdgpu/drm-next (ee9b603ad43f drm/amdgpu: Add sriov vf check for VC=
N per queue reset support.)
Merging drm-intel/for-linux-next (e4c8fde0bf20 drm/xe/rps: build RPS as par=
t of xe)
Merging drm-msm/msm-next (7bc29d5fb6fa dt-bindings: display/msm/gmu: Add Ad=
reno X2-85 GMU)
Merging drm-msm-lumag/msm-next-lumag (e2f085ab8636 dt-bindings: display: ms=
m: sm6150-mdss: Fix example indentation and OPP values)
Merging drm-rust/drm-rust-next (57dc2ea0b7bd rust: slice: fix broken intra-=
doc links)
Merging drm-nova/nova-next (93296e9d9528 gpu: nova-core: vbios: store refer=
ence to Device where relevant)
Merging drm-xe/drm-xe-next (28aeaed130e8 drm/xe/oa: Fix potential UAF in xe=
_oa_add_config_ioctl())
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (7ecb5c36b136 fbdev: gxt4500fb: Use dev_err instead =
of printk)
Merging regmap/for-next (d40e1d95246b Merge remote-tracking branch 'regmap/=
for-6.19' into regmap-next)
Merging sound/for-next (c639065e1425 ALSA: realtek/alc288 fix headphone for=
 MS Surface 2/3)
Merging ieee1394/for-next (036176d9dba7 firewire: core: abort pending trans=
actions at card removal)
Merging sound-asoc/for-next (659757726825 Merge remote-tracking branch 'aso=
c/for-6.19' into asoc-next)
Merging modules/modules-next (1ddac5cd7f27 MAINTAINERS: Add myself as revie=
wer for module support)
Merging input/next (a311c777f298 dt-bindings: touchscreen: consolidate simp=
le touch controller to trivial-touch.yaml)
Merging block/for-next (fd196ceb0bfe Merge branch 'io_uring-6.18' into for-=
next)
CONFLICT (content): Merge conflict in io_uring/rw.c
Merging device-mapper/for-next (9488f3c7c4c5 dm-bufio: align write boundary=
 on physical block size)
Merging libata/for-next (1d779fa9962f ata: pata_pcmcia: Add Iomega Clik! PC=
MCIA ATA/ATAPI Adapter)
Merging pcmcia/pcmcia-next (4a81f78caa53 pcmcia: Add error handling for add=
_interval() in do_validate_mem())
Merging mmc/next (dcbce328d3a2 mmc: renesas_sdhi: Add suspend/resume hooks)
Merging mfd/for-mfd-next (a95419ff9f21 dt-bindings: mfd: syscon: Add mt7981=
-topmisc)
Merging backlight/for-backlight-next (1704e206cb98 backlight: lp855x: Fix l=
p855x.h kernel-doc warnings)
Merging battery/for-next (8e8856396b54 Revert "power: supply: qcom_battmgr:=
 support disabling charge control")
Merging regulator/for-next (20698eac9d65 Merge remote-tracking branch 'regu=
lator/for-6.19' into regulator-next)
Merging security/next (9a948eefad59 lsm: use unrcu_pointer() for current->c=
red in security_init())
Merging apparmor/apparmor-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging integrity/next-integrity (c200892b46ba ima: Access decompressed ker=
nel module to verify appended signature)
Merging selinux/next (cdcf0b369d40 Automated merge of 'dev' into 'next')
Merging smack/next (29c701f90b93 Smack: function parameter 'gfp' not descri=
bed)
Merging tomoyo/master (5ac798f79b48 net/can/j1939: add j1939_priv debugging)
Merging tpmdd/next (821e6e2a328b keys: Replace deprecated strncpy in ecrypt=
fs_fill_auth_tok)
Merging watchdog/master (5bcc5786a0cf watchdog: starfive: Fix resource leak=
 in probe error path)
Merging iommu/next (4c1dea32a97c Merge branches 'arm/smmu/updates', 'arm/sm=
mu/bindings', 'mediatek', 'nvidia/tegra', 'intel/vt-d', 'amd/amd-vi' and 'c=
ore' into next)
Merging audit/next (c8a3dfe73159 audit: merge loops in __audit_inode_child(=
))
Merging devicetree/for-next (df2602e1c68a dt-bindings: eeprom: at25: Add An=
vo ANV32C81W)
Merging dt-krzk/for-next (3a8660878839 Linux 6.18-rc1)
Merging mailbox/for-next (3f39f5652037 mailbox: mtk-cmdq: Remove pm_runtime=
 APIs from cmdq_mbox_send_data())
Merging spi/for-next (5c2226f50c5a Merge remote-tracking branch 'spi/for-6.=
19' into spi-next)
Merging tip/master (3ae58be84607 Merge branch into tip/master: 'x86/sgx')
CONFLICT (content): Merge conflict in kernel/bpf/stackmap.c
Applying: fix up for "sched/mmcid: Use proper data structures"
Merging clockevents/timers/drivers/next (534633aa8b7b Merge branch 'timers/=
drivers/fixes' into timers/drivers/next)
Merging edac/edac-for-next (33021388bc49 Merge branch 'edac-drivers' into e=
dac-for-next)
Merging ftrace/for-next (497da6d44990 Merge unused-tracepoints/for-next)
CONFLICT (content): Merge conflict in Documentation/tools/rtla/common_optio=
ns.txt
Merging rcu/next (9bc9bbad3800 Merge branches 'rcu/misc', 'rcu/srcu' and 'r=
cu/refscale' into next)
Merging paulmck/non-rcu/next (7f8fcc6f09fb memory-barriers.txt: Sort wait_e=
vent* and wait_on_bit* list alphabetically)
Merging kvm/next (6b36119b94d0 KVM: x86: Export KVM-internal symbols for su=
b-modules only)
Merging kvm-arm/next (c9155843cbbc Merge branch 'kvm-arm64/misc' into kvmar=
m/next)
CONFLICT (content): Merge conflict in arch/arm64/kvm/vgic/vgic-v3.c
Merging kvms390/next (cd18223397ec KVM: s390: Add capability that forwards =
operation exceptions)
CONFLICT (content): Merge conflict in Documentation/virt/kvm/api.rst
CONFLICT (content): Merge conflict in include/uapi/linux/kvm.h
Merging kvm-ppc/topic/ppc-kvm (c17b750b3ad9 Linux 6.17-rc2)
Merging kvm-riscv/riscv_kvm_next (8c5fa3764fac RISC-V: KVM: Remove automati=
c I/O mapping for VM_PFNMAP)
Merging kvm-x86/next (d209f1ea3677 Merge branch 'vmx')
CONFLICT (content): Merge conflict in arch/x86/include/asm/cpufeatures.h
CONFLICT (content): Merge conflict in arch/x86/kernel/cpu/bugs.c
Merging xen-tip/linux-next (a73d4a055622 drivers/xen/xenbus: Replace deprec=
ated strcpy in xenbus_transaction_end)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (c9c19e8bbc1e workqueue: Init rescuer's affinit=
ies as wq_unbound_cpumask)
Merging sched-ext/for-next (e090182ceee2 Merge branch 'for-6.19' into for-n=
ext)
CONFLICT (content): Merge conflict in kernel/sched/ext.c
Merging drivers-x86/for-next (e2c1b56f3dfa platform/x86: wmi: Move WMI core=
 code into a separate directory)
Merging chrome-platform/for-next (52075d2c7595 platform/chrome: sensorhub: =
Support devices without FIFO_INT_ENABLE)
Merging chrome-platform-firmware/for-firmware-next (3a8660878839 Linux 6.18=
-rc1)
Merging hsi/for-next (3a8660878839 Linux 6.18-rc1)
Merging leds-lj/for-leds-next (072cd5f458d7 leds: rgb: leds-qcom-lpg: Don't=
 enable TRILED when configuring PWM)
Merging ipmi/for-next (35bcedc1a793 MAINTAINERS: Add entry on Loongson-2K I=
PMI driver)
Merging driver-core/driver-core-next (e4addc7cc2df rust: Add trait to conve=
rt a device reference to a bus device reference)
CONFLICT (content): Merge conflict in drivers/gpu/nova-core/driver.rs
CONFLICT (content): Merge conflict in rust/kernel/debugfs/traits.rs
CONFLICT (content): Merge conflict in samples/rust/rust_debugfs.rs
CONFLICT (content): Merge conflict in samples/rust/rust_debugfs_scoped.rs
Merging usb/usb-next (18514fd70ea4 usb: typec: ucsi: Add support for orient=
ation)
Merging thunderbolt/next (479d186fc946 thunderbolt: Fix typos in xdomain.c)
Merging usb-serial/usb-next (4d822b0a4a27 USB: serial: ftdi_sio: drop NDI q=
uirk module parameter)
Merging tty/tty-next (719f3df3e113 serial: sh-sci: Merge sh-sci.h into sh-s=
ci.c)
Merging char-misc/char-misc-next (41289b4834c8 Merge tag 'socfpga_firmware_=
updates_for_v6.19' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/di=
nguyen/linux into char-misc-next)
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
Merging extcon/extcon-next (dcb6fa37fd7b Linux 6.18-rc3)
Merging gnss/gnss-next (f5ef3f722d76 dt-bindings: gnss: fix timepulse descr=
iption)
Merging vfio/next (0ed3a30fd996 hisi_acc_vfio_pci: Add .match_token_uuid ca=
llback in hisi_acc_vfio_pci_migrn_ops)
Merging w1/for-next (a5d908e0ec05 w1: omap-hdq: Remove redundant pm_runtime=
_mark_last_busy() calls)
Merging spmi/spmi-next (0ff41df1cb26 Linux 6.15)
Merging staging/staging-next (bd10acae08ae platform/raspberrypi: Destage VC=
HIQ MMAL driver)
CONFLICT (content): Merge conflict in drivers/platform/Kconfig
CONFLICT (content): Merge conflict in drivers/platform/Makefile
Merging counter-next/counter-next (b462fcd08dd5 MAINTAINERS: Update Intel Q=
uadrature Encoder Peripheral maintainer)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (398035178503 i2c: i2c-qcom-geni: Add Block event in=
terrupt support)
Merging cgroup/for-next (004d6fbaf4fc Merge branch 'for-6.19' into for-next)
Merging scsi/for-next (aec860a0d3d2 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (38725491e766 scsi: MAINTAINERS: Add the UFS incl=
ude directory)
Merging vhost/linux-next (d4077573349a virtio_pci: drop kernel.h)
Merging rpmsg/for-next (5109461bc5c7 Merge branch 'rproc-next' into for-nex=
t)
Merging gpio-brgl/gpio/for-next (e6dc6eab80e6 Merge tag 'reset-gpio-for-v6.=
19' of https://git.pengutronix.de/git/pza/linux into gpio/for-next)
$ git reset --hard HEAD^
Merging next-20251120 version of gpio-brgl
Merging gpio-intel/for-next (b2a186cced11 gpiolib: acpi: use min() instead =
of min_t())
Merging pinctrl/for-next (130eff6df1e4 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (8daf70e6aa41 Merge patch series "pinctrl: i=
ntel: Export intel_gpio_add_pin_ranges() and use it")
Merging pinctrl-renesas/renesas-pinctrl (3b0cf6ab3590 pinctrl: renesas: rzg=
2l: Refactor OEN register PWPR handling)
Merging pinctrl-samsung/for-next (3cfc60e09bdc pinctrl: samsung: Add ARTPEC=
-9 SoC specific configuration)
Merging pwm/pwm/for-next (cda323dbda76 pwm: bcm2835: Make sure the channel =
is enabled after pwm_request())
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
Merging nvdimm/libnvdimm-for-next (6e15364204db dax: add PROBE_PREFER_ASYNC=
HRONOUS to the hmem drivers)
Merging at24/at24/for-next (aef72ebe9c86 dt-bindings: eeprom: at24: Add com=
patible for Belling BL24S64)
Merging ntb/ntb-next (68113d260674 NTB/msi: Remove unused functions)
Merging seccomp/for-next/seccomp (b0c9bfbab925 selftests/seccomp: Add a tes=
t for the WAIT_KILLABLE_RECV fast reply race)
Merging slimbus/for-next (4bb909aa44ed dt-bindings: slimbus: fix warning fr=
om example)
Merging nvmem/for-next (96a5d8a96c0f Merge branches 'nvmem-fixes' and 'nvme=
m-for-6.19' into nvmem-for-next)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (a45a80914e51 mshv: Add ioctl for self targeted =
passthrough hvcalls)
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
Merging efi/next (e41ef37ddfe7 efi/libstub: x86: Store EDID in boot_params)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (38f35f5fc78f Merge branch 'slab/for-6.19/mempoo=
l_alloc_bulk' into slab/for-next)
Merging random/master (2db833312d7e random: drop check for static_key_initi=
alized)
Merging landlock/next (1d80ca4ab4b2 selftests/landlock: Fix makefile header=
 list)
CONFLICT (content): Merge conflict in include/linux/fs.h
Merging rust/rust-next (494de8f67b1e rust: sync: replace `kernel::c_str!` w=
ith C-Strings)
CONFLICT (content): Merge conflict in rust/kernel/debugfs/file_ops.rs
CONFLICT (content): Merge conflict in rust/kernel/debugfs/traits.rs
CONFLICT (content): Merge conflict in rust/kernel/opp.rs
CONFLICT (content): Merge conflict in rust/kernel/pci/id.rs
CONFLICT (content): Merge conflict in rust/kernel/str.rs
Applying: fix up for "rust: replace `CStr` with `core::ffi::CStr`"
Applying: fix up 2 for "rust: replace `CStr` with `core::ffi::CStr`"
Applying: fix up 3 for "rust: replace `CStr` with `core::ffi::CStr`"
Merging rust-alloc/alloc-next (3a8660878839 Linux 6.18-rc1)
Merging rust-io/io-next (86731a2a651e Linux 6.16-rc3)
Merging rust-pin-init/pin-init-next (42415d163e5d rust: pin-init: add refer=
ences to previously initialized fields)
Merging rust-timekeeping/timekeeping-next (4521438fb076 rust: time: Impleme=
nt basic arithmetic operations for Delta)
Merging rust-xarray/xarray-next (fa616196fbea MAINTAINERS: add entry for Ru=
st XArray API)
Merging sysctl/sysctl-next (9586c6c2d44a sysctl: Make ctl_table structure v=
isible in jiffies.h)
Merging execve/for-next/execve (8c94db0ae97c binfmt_elf: preserve original =
ELF e_flags for core dumps)
Merging bitmap/bitmap-for-next (d1cadd4bfc28 nodemask: use min() instead of=
 min_t())
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (b0bf5f96bfb4 Merge branch 'for-next/hardening' =
into for-next/kspp)
Merging nolibc/for-next (31b4d3af63f9 tools/nolibc: remove more __nolibc_en=
osys() fallbacks)
Merging iommufd/for-next (211ddde0823f Linux 6.18-rc2)
Merging turbostat/next (447c98c1ca4a tools/power turbostat: Add idle govern=
or statistics reporting)
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.8
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.c
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

--Sig_/kUK73Sdl41kHX5hOzLz/F8P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkgAdYACgkQAVBC80lX
0GyR8wf/e+m4osCsaUBWFhzBOkNHw93N9iL1Dv5XYwk3zc68TLSHoxGVWL4hHJ0k
49JbJM9demEXtARP6hJBKh0jx6w6ti4k/eJ6XMDUcSu5QT91pXVnS9+KnJrv35AQ
3hB9jlzW/Bwfhvx4D84z3rgwFiYe6EeTeYulcy4it/3lMyOsqjuHggeaCLrGavgr
cpjiCMlfe4DE45thMczfGg/jPEFEdqpVqC1As1675JTOgyr8d5/VZ/Li0zTPLqje
g2keCg/siOTeLJTGiRVcGShgJ4svxkfmqfiJF/zyRJCHE8g4EucO9Ftp/l4WwwOl
OwaHAEnuPhLfrw/il7ScuPvP/kC+fw==
=+y8D
-----END PGP SIGNATURE-----

--Sig_/kUK73Sdl41kHX5hOzLz/F8P--

