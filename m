Return-Path: <linux-next+bounces-8985-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B59C5B63E
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 06:33:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AED333BAAF1
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 05:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84060244664;
	Fri, 14 Nov 2025 05:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nEclx50o"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C772AE78;
	Fri, 14 Nov 2025 05:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763098422; cv=none; b=qF/Biajo9b8m+Uv49TOKZZbyX5dW2gPxU3Dt6vplpfRNfS4gFnz+3NjkCxzJWrf6EwsRPcy+d/0qf8Xxrrib3cb1i1u9Et7Y1vxRB1lYPCYKY0sNvjnYmIcMoPTbjcH6s9LsUyHF+NPSl45GYx3JJ1S+E9WAYURKSjFbKa2y4Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763098422; c=relaxed/simple;
	bh=p64MBbPN/69L+JFAoKxxDESnSHbZxTrxnKJSPflAc1U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Nmlm6v/hS0xCRSlaLowzT3hES+yaW5rigIf+PMrj/4FjuNIugtcEP0v43TdgJSRJ6nw4/HlM2gMVBdKJjlmP/DCNE6QIg0R3hGOn2Zlv2ZCd1Y7O9n9bGVhSXbG3Qns0J5ji/3ASq3GGiUqpODkcEVebVNRhfUX+HSBWcGSsrss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nEclx50o; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763098413;
	bh=0N+t2X03C1ThhWaU1/gs0NhPRkW0o9QJ8oxPeBp9ISQ=;
	h=Date:From:To:Cc:Subject:From;
	b=nEclx50o+gEpfO5DNZVHhcAnYjWqAwvqzE+EM7kh501z2aXJs2NFp1QRLyR6PTMnJ
	 S/6qQhpg+n9PI6bDxLvZcGBVmyJRVBNp9GjZr52zOvZohBsAe64TICeBIEFO/1Ox1y
	 8xZlsV03jhpB7yjrUHH11Ub/38+LkjMAIa7MBweKIKRmYbJCyEGAhHEIkEYx8q8Qn+
	 jF1J4sQoTBXGgvbfAkhRQju11N108mT1LdM9rwjfzQPPexyRUOICkEo4qYAVkH3uNj
	 9ZUuCzbLAyrv2HMfrJGlcGAF3igkPaNXKfmOsSl8B0mKo8GLh4fdt3e3UO1p7ROIuP
	 Q7seIfkt6Y1yg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d75Qj2Kl3z4wCB;
	Fri, 14 Nov 2025 16:33:33 +1100 (AEDT)
Date: Fri, 14 Nov 2025 16:33:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 14
Message-ID: <20251114163332.53dfe4cd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YhxPL=TgyjEtSg+HXoDIjXC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YhxPL=TgyjEtSg+HXoDIjXC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20251113:

The arm64 tree gained a conflict against the mm-unstable tree.

The tegra tree gained a build failure so I used the version from
next-20251113.

The pci tree gained a conflict against Linus' tree.

The rcu tree gained a conflict against the ftrace tree.

The char-misc tree gained a conflict against the char-misc.current tree.

The scsi-mkp tree gained a conflict against Linus' tree.

The slab tree gained a conflict against the mm-unstable tree.

The rust tree gained a conflict against the driver-core tree.

Non-merge commits (relative to Linus' tree): 7899
 8455 files changed, 360001 insertions(+), 124279 deletions(-)

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
Merging origin/master (9b9e43704d2b Merge tag 'slab-for-6.18-rc6' of git://=
git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab)
Merging fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging ext4-fixes/fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging vfs-brauner-fixes/vfs.fixes (497b6977af8b fs/namespace: correctly h=
andle errors returned by grab_requested_mnt_ns)
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
Merging btrfs/for-next (e35f9c2f382e Merge branch 'for-next-next-v6.18-2025=
1112' into for-next-20251112)
Merging ceph/master (87ab14795a89 libceph: drop started parameter of __ceph=
_open_session())
Merging cifs/for-next (12b05919077f smb: client: show smb lease key in open=
_dirs output)
Merging configfs/configfs-next (462272dd734b configfs: use PTR_ERR_OR_ZERO(=
) to simplify code)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (8e4021078863 dlm: check for undefined release_option valu=
es)
Merging erofs/dev (e2d3af0d64e5 erofs: drop redundant sanity check for ztai=
lpacking inline)
Merging exfat/dev (85d297e7452b exfat: validate the cluster bitmap bits of =
directory)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (25554ea0b42b Pull udf extent block verification.)
Merging ext4/dev (9dbf945320b1 ext4: add two trace points for moving extent=
s)
Merging f2fs/dev (ca244e9242a1 f2fs: fix to detect recoverable inode during=
 dryrun of find_fsync_dnodes())
Merging fsverity/for-next (211ddde0823f Linux 6.18-rc2)
Merging fuse/for-next (b4909ae8d4e9 fuse: refactor fuse_conn_put() to remov=
e negative logic.)
Merging gfs2/for-next (105063e98b8d Revert "gfs2: Add GL_NOBLOCK flag")
Merging jfs/jfs-next (cafc6679824a jfs: replace hardcoded magic number with=
 DTPAGEMAXSLOT constant)
Merging ksmbd/ksmbd-for-next (967a72fa7f6b Merge tag 'v6.18-rc5-smb-server-=
fixes' of git://git.samba.org/ksmbd)
Merging nfs/linux-next (e9a6fb0bcdd7 Linux 6.18-rc5)
Merging nfs-anna/linux-next (b623390045a8 NFS: Fix LTP test failures when t=
imestamps are delegated)
Merging nfsd/nfsd-next (e97ca35f196b SUNRPC: Improve "fragment too large" w=
arning)
Merging ntfs3/master (f35590ee26f5 fs/ntfs3: remove ntfs_bio_pages and use =
page cache for compressed I/O)
Merging orangefs/for-next (11f6bce77e27 fs/orangefs: Replace kzalloc + copy=
_from_user with memdup_user_nul)
Merging overlayfs/overlayfs-next (ad1423922781 ovl: make sure that ovl_crea=
te_real() returns a hashed dentry)
Merging ubifs/next (99dbb2a1bd66 ubifs: stop using write_cache_pages)
Merging v9fs/9p-next (1f3e4142c0eb 9p: convert to the new mount API)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (bf3b8e915215 xfs: remove xarray mark for reclaimable =
zones)
Merging zonefs/for-next (a42938e80357 zonefs: correct some spelling mistake=
s)
Merging vfs-brauner/vfs.all (a5bbe4a7a08d Merge branch 'vfs-6.19.minix' int=
o vfs.all)
CONFLICT (content): Merge conflict in fs/btrfs/file.c
CONFLICT (content): Merge conflict in fs/nfs/localio.c
Merging vfs/for-next (15f5e46385aa Merge branches 'work.fs_context', 'work.=
f_path', 'work.qstr', 'work.misc', 'work.nfsctl' and 'work.finish_no_open' =
into for-next)
Merging mm-hotfixes/mm-hotfixes-unstable (21188c5b755f mm/mmap_lock: reset =
maple state on lock_vma_under_rcu() retry)
Merging fs-current (7e7e7f569102 Merge branch 'fixes' of https://git.kernel=
.org/pub/scm/linux/kernel/git/viro/vfs.git)
Merging kbuild-current/kbuild-fixes (4ab2ee307983 kbuild: install-extmod-bu=
ild: Properly fix CC expansion when ccache is used)
Merging arc-current/for-curr (d7b8f8e20813 Linux 6.16-rc5)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (8e8ae788964a arm64: Reject modules with=
 internal alternative callbacks)
Merging arm-soc-fixes/arm/fixes (b2a578f3127a soc: officially expand mainta=
inership team)
Merging davinci-current/davinci/for-current (3a8660878839 Linux 6.18-rc1)
Merging drivers-memory-fixes/fixes (6f37469a9330 memory: tegra210: Fix inco=
rrect client ids)
Merging sophgo-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging sophgo-soc-fixes/soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging m68k-current/for-linus (695f2c0c25f3 m68k: defconfig: Update defcon=
figs for v6.17-rc1)
Merging powerpc-fixes/fixes (0843ba458439 powerpc/fadump: skip parameter ar=
ea allocation when fadump is disabled)
Merging s390-fixes/fixes (64e2f60f355e s390: Disable ARCH_WANT_OPTIMIZE_HUG=
ETLB_VMEMMAP)
Merging net/main (d0309c054362 Merge tag 'net-6.18-rc6' of git://git.kernel=
.org/pub/scm/linux/kernel/git/netdev/net)
Merging bpf/master (91a78ce994e7 Merge branch 'mptcp-fix-conflicts-between-=
mptcp-and-sockmap')
Merging ipsec/master (59630e2ccd72 xfrm: Prevent locally generated packets =
from direct output in tunnel mode)
Merging netfilter/main (de0337d641bf net: ionic: map SKB after pseudo-heade=
r checksum prep)
Merging ipvs/main (de0337d641bf net: ionic: map SKB after pseudo-header che=
cksum prep)
Merging wireless/for-next (a35f64a216ca Merge tag 'iwlwifi-fixes-2025-11-12=
' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next)
Merging ath/for-current (c4e1ac09ee1c wifi: mwl8k: inject DSSS Parameter Se=
t element into beacons if missing)
Merging iwlwifi/fixes (1a222625b468 wifi: iwlwifi: mld: always take beacon =
ies in link grading)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (da32d155f4a8 Merge tag 'gpio-fixes-for-v6.18-rc5=
' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux)
Merging sound-current/for-linus (632108ec072a ALSA: usb-audio: Fix NULL poi=
nter dereference in snd_usb_mixer_controls_badd)
Merging sound-asoc-fixes/for-linus (360b3730f8ea ASoC: rsnd: fix OF node re=
ference leak in rsnd_ssiu_probe())
Merging regmap-fixes/for-linus (6146a0f1dfae Linux 6.18-rc4)
Merging regulator-fixes/for-linus (636f4618b1cd regulator: fixed: fix GPIO =
descriptor leak on register failure)
Merging spi-fixes/for-linus (66e9feb03e7c spi: Add TODO comment about ACPI =
GPIO setup)
Merging pci-current/for-linus (921b3f59b7b0 PCI/ASPM: Avoid L0s and L1 on H=
i1105 [19e5:1105] Wi-Fi)
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
Merging input-current/for-linus (e08969c4d65a Input: cros_ec_keyb - fix an =
invalid memory access)
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
Merging mfd-fixes/for-mfd-fixes (91a3e1f5453a mfd: ls2kbmc: Check for devm_=
mfd_add_devices() failure)
Merging v4l-dvb-fixes/fixes (27afd6e066cf media: videobuf2: forbid remove_b=
ufs when legacy fileio is active)
Merging reset-fixes/reset/fixes (997c06330fd5 reset: imx8mp-audiomix: Fix b=
ad mask values)
Merging mips-fixes/mips-fixes (09782e72eec4 mips: dts: econet: fix EN751221=
 core type)
Merging at91-fixes/at91-fixes (3a8660878839 Linux 6.18-rc1)
Merging omap-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging kvm-fixes/master (8a4821412cf2 KVM: nSVM: Fix and simplify LBR virt=
ualization handling with nested)
Merging kvms390-fixes/master (5f9df945d4e8 KVM: s390: Fix FOLL_*/FAULT_FLAG=
_* confusion)
Merging hwmon-fixes/hwmon (c55a8e24cd12 hwmon: (gpd-fan) initialize EC on d=
river load for Win 4)
Merging nvdimm-fixes/libnvdimm-fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging cxl-fixes/fixes (214291cbaace acpi/hmat: Fix lockdep warning for hm=
em_register_resource())
Merging dma-mapping-fixes/dma-mapping-fixes (a50f7456f853 dma-mapping: Allo=
w use of DMA_BIT_MASK(64) in global scope)
Merging drivers-x86-fixes/fixes (fa0498f80475 platform/x86: hp-wmi: Add Ome=
n MAX 16-ah0xx fan support and thermal profile)
Merging samsung-krzk-fixes/fixes (0dac0b74c32a MAINTAINERS: Update Krzyszto=
f Kozlowski's email)
Merging pinctrl-samsung-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging devicetree-fixes/dt/linus (11623998e325 of: Skip devicetree kunit t=
ests when RISCV+ACPI doesn't populate root node)
Merging dt-krzk-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging scsi-fixes/fixes (e6965188f84a scsi: target: tcm_loop: Fix segfault=
 in tcm_loop_tpg_address_show())
Merging drm-fixes/drm-fixes (e9a6fb0bcdd7 Linux 6.18-rc5)
Merging drm-intel-fixes/for-linux-next-fixes (f2687d3cc9f9 drm/i915/dp_mst:=
 Disable Panel Replay)
Merging mmc-fixes/fixes (739f04f4a462 mmc: dw_mmc-rockchip: Fix wrong inter=
nal phase calculate)
Merging rtc-fixes/rtc-fixes (162f24cbb0f6 rtc: rx8025: fix incorrect regist=
er reference)
Merging gnss-fixes/gnss-linus (dcb6fa37fd7b Linux 6.18-rc3)
Merging hyperv-fixes/hyperv-fixes (852bfe55e211 mshv: Fix deposit memory in=
 MSHV_ROOT_HVCALL)
Merging risc-v-fixes/fixes (dc20452e6caf riscv: Fix CONFIG_AS_HAS_INSN for =
new .insn usage)
Merging riscv-dt-fixes/riscv-dt-fixes (5ef13c363640 riscv: dts: microchip: =
remove BeagleV Fire fabric.dtsi)
Merging riscv-soc-fixes/riscv-soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging spdx/spdx-linus (89373f5695dc LICENSES: Add modern form of the LGPL=
-2.1 tags to the usage guide section)
Merging gpio-brgl-fixes/gpio/for-current (e9a6fb0bcdd7 Linux 6.18-rc5)
Merging gpio-intel-fixes/fixes (b1055678a016 gpiolib: acpi: Use %pe when pa=
ssing an error pointer to dev_err())
Merging pinctrl-intel-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging auxdisplay-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging kunit-fixes/kunit-fixes (f3903ec76ae6 MAINTAINERS: Update KUnit ema=
il address for Rae Moar)
Merging memblock-fixes/fixes (c42af83c59b6 memblock: fix memblock_estimated=
_nr_free_pages() for soft-reserved memory)
Merging renesas-fixes/fixes (379c590113ce ARM: shmobile: smp: Enforce shmob=
ile_smp_* alignment)
Merging perf-current/perf-tools (da32d155f4a8 Merge tag 'gpio-fixes-for-v6.=
18-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux)
Merging efi-fixes/urgent (e5f0a698b34e Linux 6.17)
Merging battery-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging iommufd-fixes/for-rc (afb47765f923 iommufd: Make vfio_compat's unma=
p succeed if the range is already empty)
Merging rust-fixes/rust-fixes (fdf302e6bea1 gendwarfksyms: Skip files with =
no exports)
Merging w1-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging pmdomain-fixes/fixes (bbde14682eba pmdomain: imx: Fix reference cou=
nt leak in imx_gpc_remove)
Merging i2c-host-fixes/i2c/i2c-host-fixes (8738d626030f i2c: fix reference =
leak in MP2 PCI device)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (3a8660878839 Linux 6.18-rc1)
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
Merging tip-fixes/tip/urgent (6fa9041b7177 Merge tag 'nfsd-6.18-3' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/cel/linux)
Merging slab-fixes/slab/for-next-fixes (cbcff934fa7d mm/slub: fix memory le=
ak in free_to_pcs_bulk())
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
Merging drm-misc-fixes/for-linux-next-fixes (0a4a18e888ae drm/client: fix M=
ODULE_PARM_DESC string for "active")
Merging mm-stable/mm-stable (e9a6fb0bcdd7 Linux 6.18-rc5)
Merging mm-nonmm-stable/mm-nonmm-stable (3e4b89e97036 nilfs2: replace vmall=
oc + copy_from_user with vmemdup_user)
Merging mm-unstable/mm-unstable (f58b4cb6b0c1 mm: replace remaining pte_to_=
swp_entry() with softleaf_from_pte())
Merging mm-nonmm-unstable/mm-nonmm-unstable (c3e0350a1f99 MAINTAINERS: remo=
ve Gustavo from sync framework)
Merging kbuild/kbuild-next (7bade3f7e919 scripts: headers_install.sh: Remov=
e two outdated config leak ignore entries)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (da8fcfba0854 perf stat: Align metric output w=
ithout events)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (131971f67e25 dma-mapping: remove =
unused map_page callback)
Merging asm-generic/master (edcc8a38b5ac once: fix race by moving DO_ONCE t=
o separate section)
Merging alpha/alpha-next (d58041d2c63e MAINTAINERS: Add Magnus Lindholm as =
maintainer for alpha port)
Merging arm/for-next (eca2ec8c85ae Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (c464aa07b92e Merge branches 'for-next/misc' an=
d 'for-next/sysreg' into for-next/core)
CONFLICT (content): Merge conflict in arch/arm64/include/asm/el2_setup.h
CONFLICT (content): Merge conflict in arch/arm64/mm/mmu.c
Merging arm-perf/for-next/perf (7ab06ea41af5 arch_topology: Provide a stub =
topology_core_has_smt() for !CONFIG_GENERIC_ARCH_TOPOLOGY)
Merging arm-soc/for-next (b8e5a95fb5f5 Merge branch 'arm/fixes' into for-ne=
xt)
Merging amlogic/for-next (8fd078f5b5fa Merge branch 'v6.19/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (5d21b7ca05c8 Merge branch 'apple-soc/=
drivers-6.19' into asahi-soc/for-next)
Merging at91/at91-next (370b4dfa592a Merge branch 'at91-defconfig' into at9=
1-next)
Merging bmc/for-next (39f0ed9219df Merge branches 'aspeed/arm/dt' and 'aspe=
ed/fixes' into for-next)
Merging broadcom/next (37c3a91e9730 arm64: dts: broadcom: bcm2712: Add watc=
hdog DT node)
Merging cix/for-next (c73bd34623b8 Merge remote-tracking branch 'cix/dt' in=
to for-next)
Merging davinci/davinci/for-next (3a8660878839 Linux 6.18-rc1)
Merging drivers-memory/for-next (4434602ef5a8 Merge branch 'mem-ctrl-next' =
into for-next)
Merging fsl/soc_fsl (bdedc7414642 soc: fsl: qbman: add WQ_PERCPU to alloc_w=
orkqueue users)
Merging imx-mxs/for-next (8c32f2f15cb9 Merge branch 'imx/dt64' into for-nex=
t)
Merging mediatek/for-next (67ed5843a67b Merge branch 'v6.18-next/dts64' int=
o for-next)
Merging mvebu/for-next (86a99e9f5394 Merge branch 'mvebu/fixes' into mvebu/=
for-next)
Merging omap/for-next (cfb81046a57c Merge branch 'omap-for-v6.19/drivers' i=
nto tmp/omap-next-20251111.121837)
Merging qcom/for-next (3c3d81183061 Merge branches 'arm32-for-6.19', 'arm64=
-defconfig-for-6.19', 'arm64-for-6.19', 'clk-for-6.19' and 'drivers-for-6.1=
9' into for-next)
Merging renesas/next (fbec5d4783d5 Merge branches 'renesas-drivers-for-v6.1=
9' and 'renesas-dts-for-v6.19' into renesas-next)
Merging reset/reset/next (3754bc97926e reset: Remove unused variables)
Merging rockchip/for-next (73ae77335a82 Merge branch 'v6.18-armsoc/dtsfixes=
' into for-next)
Merging samsung-krzk/for-next (4b67e4c65c1e Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (e5db90f4c044 Merge branch 'for-next/ffa/update=
s' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux=
 into for-linux-next)
Merging sophgo/for-next (8eff9c7a129e Merge branch 'dt/riscv' into for-next)
Merging sophgo-soc/soc-for-next (c8754c7deab4 soc: sophgo: cv1800: rtcsys: =
New driver (handling RTC only))
Merging spacemit/for-next (5a97a38c2279 riscv: dts: spacemit: define all mi=
ssing I2C controller nodes)
Merging stm32/stm32-next (c23cb4565ad8 ARM: dts: stm32: lxa: drop unnecessa=
ry vusb_d/a-supply)
Merging sunxi/sunxi/for-next (28493fd26fd6 Merge branches 'sunxi/dt-for-6.1=
9' and 'sunxi/drivers-for-6.19' into sunxi/for-next)
Merging tee/next (b1a635dba104 Merge branch 'tee_fix_for_v6.18' into next)
Merging tegra/for-next (8bd0139eafc3 Merge branch for-6.19/arm64/dt into fo=
r-next)
$ git reset --hard HEAD^
Merging next-20251113 version of tegra
Merging tenstorrent-dt/tenstorrent-dt-for-next (a71e6e8eea8a riscv: defconf=
ig: Enable Tenstorrent SoCs)
Merging thead-dt/thead-dt-for-next (d8a174babf64 riscv: dts: thead: Add res=
et controllers of more subsystems for TH1520)
Merging ti/ti-next (884de3538ffe Merge branch 'ti-drivers-soc-next' into ti=
-next)
Merging xilinx/for-next (a35dc981c5d8 Merge branch 'zynqmp/defconfig' into =
for-next)
Merging clk/clk-next (538eb94d904a Merge branch 'clk-cleanup' into clk-next)
Merging clk-imx/for-next (fdc1dc7dd53b clk: imx: add driver for imx8ulp's s=
im lpav)
Merging clk-renesas/renesas-clk (5fb2f67341bd clk: renesas: r9a09g077: Add =
SPI module clocks)
Merging thead-clk/thead-clk-for-next (3a8660878839 Linux 6.18-rc1)
Merging csky/linux-next (817d21578d51 csky: Remove compile warning for CONF=
IG_SMP)
Merging loongarch/loongarch-next (237e74bfa261 LoongArch: KVM: Fix max supp=
orted vCPUs set with EIOINTC)
Merging m68k/for-next (695f2c0c25f3 m68k: defconfig: Update defconfigs for =
v6.17-rc1)
Merging m68knommu/for-next (e9a6fb0bcdd7 Linux 6.18-rc5)
Merging microblaze/next (7f7072574127 Merge tag 'kbuild-6.18-1' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/kbuild/linux)
Merging mips/mips-next (e9a6fb0bcdd7 Linux 6.18-rc5)
Merging openrisc/for-next (8c30b0018f9d openrisc: Add jump label support)
Merging parisc-hd/for-next (75b51437a4ac parisc: Drop linux/kernel.h includ=
e from asm/bug.h header)
Merging powerpc/next (e9a6fb0bcdd7 Linux 6.18-rc5)
Merging risc-v/for-next (3a8660878839 Linux 6.18-rc1)
Merging riscv-dt/riscv-dt-for-next (1088d49b6264 riscv: dts: microchip: ena=
ble qspi adc/mmc-spi-slot on BeagleV Fire)
Merging riscv-soc/riscv-soc-for-next (e8d9aa2fb552 Merge branch 'anlogic-in=
itial' into riscv-soc-for-next)
Merging s390/for-next (85c8904db338 Merge branch 'features' into for-next)
CONFLICT (content): Merge conflict in include/linux/memory.h
Merging sh/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging sparc/for-next (fe0126702a40 sparc: Replace deprecated strcpy() wit=
h strscpy() in handle_nextprop_quirks())
Merging uml/next (293f71435d14 um: Always set up AT_HWCAP and AT_PLATFORM)
Merging xtensa/xtensa-for-next (4c8bad3ed035 xtensa: use HZ_PER_MHZ in plat=
form_calibrate_ccount)
Merging fs-next (9c73fbbc83f7 Merge branch 'for-next' of https://git.kernel=
.org/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (4482d5eb7817 Merge branch 'for-6.19' into for-next)
Merging pci/next (31115ecec74f Merge branch 'pci/controller/sg2042')
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_vram.c
Merging pstore/for-next/pstore (b69255357368 pstore/ram: Update module para=
meters from platform data)
Merging hid/for-next (30a000de0b50 Merge branch 'for-6.19/nintendo' into fo=
r-next)
Merging i2c/i2c/for-next (e9a6fb0bcdd7 Linux 6.18-rc5)
Merging i2c-host/i2c/i2c-host (eeaaf5bc1c5b dt-bindings: i2c: qcom-cci: Doc=
ument Kaanapali compatible)
Merging i3c/i3c/next (ddb37d5b130e i3c: mipi-i3c-hci-pci: Add support for I=
ntel Nova Lake-S I3C)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (3c48eb382e57 hwmon: (corsair-cpro) Replac=
e magic values with constants)
Merging jc_docs/docs-next (68f3d40ea0ce docs: parse-headers.rst: remove une=
eded parenthesis)
Merging v4l-dvb/next (d363bdfa0ec6 media: i2c: add Sony IMX111 CMOS camera =
sensor driver)
Merging v4l-dvb-next/master (adc218676eef Linux 6.12)
Merging pm/linux-next (399fb812cd15 Merge branch 'thermal-intel' into linux=
-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (47c303ba6e80 cpufreq: tegra194:=
 add WQ_PERCPU to alloc_workqueue users)
Merging cpupower/cpupower (059835bbfa28 tools/power/cpupower: Support build=
ing libcpupower statically)
Merging devfreq/devfreq-next (6146a0f1dfae Linux 6.18-rc4)
Merging pmdomain/next (bd4fae181ee0 pmdomain: mediatek: convert from clk ro=
und_rate() to determine_rate())
Merging opp/opp/linux-next (33ffb0aa8ce8 rust: opp: simplify callers of `to=
_c_str_array`)
Merging thermal/thermal/linux-next (dc67521c20b7 thermal/drivers/renesas/rz=
g3e: Fix add thermal driver for the Renesas RZ/G3E SoC)
Merging rdma/for-next (a338d6e849ab RDMA/rtrs: server: Fix error handling i=
n get_or_create_srv)
Merging net-next/main (de9c41624c9c net: usb: usbnet: adhere to style)
Merging bpf-next/for-next (56bf36a859bd Merge branch 'bpf-next/net' into fo=
r-next)
CONFLICT (content): Merge conflict in kernel/bpf/helpers.c
Merging ipsec-next/master (939ba8c5b81c MAINTAINERS: Add entry for XFRM doc=
umentation)
Merging mlx5-next/mlx5-next (5422318e27d7 net/mlx5: Expose definition for 1=
600Gbps link mode)
Merging netfilter-next/main (209ff7af79bf net: stmmac: rename devlink param=
eter ts_coarse into phc_coarse_adj)
Merging ipvs-next/main (209ff7af79bf net: stmmac: rename devlink parameter =
ts_coarse into phc_coarse_adj)
Merging bluetooth/master (486a25d25a4b Bluetooth: hci_core: Fix triggering =
cmd_timer for HCI_OP_NOP)
CONFLICT (content): Merge conflict in include/net/bluetooth/hci.h
CONFLICT (content): Merge conflict in net/bluetooth/iso.c
Merging wireless-next/for-next (0eb272033b64 Merge tag 'ath-next-20251111' =
of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath)
Merging ath-next/for-next (0eb272033b64 Merge tag 'ath-next-20251111' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/ath/ath)
Merging iwlwifi-next/next (ff3f4c52701d wifi: iwlwifi: mld: remove unused v=
ariable in d3.c)
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (c95de73da12b mtd: spear_smi: fix kernel-doc warnings =
<linux/mtd/spear_smi.h>)
Merging nand/nand/next (88fd4e4deae8 mtd: rawnand: sunxi: Add support for H=
616 nand controller)
Merging spi-nor/spi-nor/next (e8f288a115f4 mtd: spi-nor: spansion: SMPT fix=
ups for S25FS-S)
Merging crypto/master (d633730bb387 crypto: octeontx2 - Replace deprecated =
strcpy in cpt_ucode_load_fw)
Merging libcrypto/libcrypto-next (10a1140107e0 Merge remote-tracking branch=
es 'ebiggers/libcrypto-tests', 'ebiggers/libcrypto-aes-gcm' and 'ebiggers/l=
ibcrypto-fpsimd-on-stack' into libcrypto-next)
Merging drm/drm-next (2a084f4ad727 Merge tag 'amd-drm-next-6.19-2025-11-07'=
 of https://gitlab.freedesktop.org/agd5f/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/inc/hw=
/hw_shared.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dm=
c.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_device.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_gt.c
Merging drm-exynos/for-linux-next (3a8660878839 Linux 6.18-rc1)
Merging drm-misc/for-linux-next (ca2583412306 accel/amdxdna: Fix deadlock b=
etween context destroy and job timeout)
Merging amdgpu/drm-next (076470b9f6f8 drm/amdkfd: Fix GPU mappings for APU =
after prefetch)
Merging drm-intel/for-linux-next (b84befa31266 drm/i915/display: Add defaul=
t case to mipi_exec_send_packet)
Merging drm-msm/msm-next (227ec96232ba drm/msm: fix allocation of dumb buff=
ers for non-RGB formats)
Merging drm-msm-lumag/msm-next-lumag (a643abb67379 drm/msm/mdp4: remove the=
 use of dev_err_probe())
Merging drm-rust/drm-rust-next (e54ad0cd3673 rust/drm/gem: Fix missing head=
er in `Object` rustdoc)
Merging drm-nova/nova-next (93296e9d9528 gpu: nova-core: vbios: store refer=
ence to Device where relevant)
Merging drm-xe/drm-xe-next (6bcb180f6f45 drm/xe/oa: Store forcewake referen=
ce in stream structure)
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (53be794e182f fbdev: vesafb: Use dev_* fn's instead =
printk)
Merging regmap/for-next (d40e1d95246b Merge remote-tracking branch 'regmap/=
for-6.19' into regmap-next)
Merging sound/for-next (4b1b92bdc4ca ALSA: au88x0: Fix array bounds warning=
 in EQ drivers)
Merging ieee1394/for-next (036176d9dba7 firewire: core: abort pending trans=
actions at card removal)
Merging sound-asoc/for-next (476ebc4261aa Merge remote-tracking branch 'aso=
c/for-6.19' into asoc-next)
Merging modules/modules-next (1ddac5cd7f27 MAINTAINERS: Add myself as revie=
wer for module support)
Merging input/next (a311c777f298 dt-bindings: touchscreen: consolidate simp=
le touch controller to trivial-touch.yaml)
Merging block/for-next (1b76b99b4296 Merge branch 'for-6.19/io_uring' into =
for-next)
Merging device-mapper/for-next (5fc2367120ce dm mpath: enable DM_TARGET_ATO=
MIC_WRITES)
Merging libata/for-next (13f4d99582c8 ata: libata-sff: add WQ_PERCPU to all=
oc_workqueue users)
Merging pcmcia/pcmcia-next (4a81f78caa53 pcmcia: Add error handling for add=
_interval() in do_validate_mem())
Merging mmc/next (989019c969a2 mmc: core: add WQ_PERCPU to alloc_workqueue =
users)
Merging mfd/for-mfd-next (30ed024fb076 mfd: bcm2835-pm: Add support for BCM=
2712)
  30ed024fb076 ("mfd: bcm2835-pm: Add support for BCM2712")
Merging backlight/for-backlight-next (67d8eed26ead backlight: led-bl: Add d=
evlink to supplier LEDs)
Merging battery/for-next (8e8856396b54 Revert "power: supply: qcom_battmgr:=
 support disabling charge control")
Merging regulator/for-next (7db7d6de2738 Merge remote-tracking branch 'regu=
lator/for-6.19' into regulator-next)
Merging security/next (0e6ebf877843 device_cgroup: Refactor devcgroup_seq_s=
how to use seq_put* helpers)
Merging apparmor/apparmor-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging integrity/next-integrity (43369273518f ima: add fs_subtype conditio=
n for distinguishing FUSE instances)
Merging selinux/next (20d387d7ceab selinux: improve bucket distribution uni=
formity of avc_hash())
Merging smack/next (29c701f90b93 Smack: function parameter 'gfp' not descri=
bed)
Merging tomoyo/master (4cfad6d7da01 net/can/j1939: add j1939_priv debugging)
Merging tpmdd/next (dbfdaeb381a4 tpm_crb: Add idle support for the Arm FF-A=
 start method)
Merging watchdog/master (e9a6fb0bcdd7 Linux 6.18-rc5)
Merging iommu/next (91920a9d87f5 Merge branches 'arm/smmu/updates', 'arm/sm=
mu/bindings', 'mediatek', 'nvidia/tegra', 'amd/amd-vi' and 'core' into next)
Merging audit/next (c8a3dfe73159 audit: merge loops in __audit_inode_child(=
))
Merging devicetree/for-next (2095878ef17d of/address: Remove the incorrect =
and misleading comment)
Merging dt-krzk/for-next (3a8660878839 Linux 6.18-rc1)
Merging mailbox/for-next (3f39f5652037 mailbox: mtk-cmdq: Remove pm_runtime=
 APIs from cmdq_mbox_send_data())
Merging spi/for-next (4a0c9e9933c8 Merge remote-tracking branch 'spi/for-6.=
19' into spi-next)
Merging tip/master (a3f6e90bcfdc Merge branch into tip/master: 'objtool/cor=
e')
CONFLICT (content): Merge conflict in kernel/bpf/stackmap.c
Merging clockevents/timers/drivers/next (534633aa8b7b Merge branch 'timers/=
drivers/fixes' into timers/drivers/next)
Merging edac/edac-for-next (6b7abee1cd25 Merge ras/edac-urgent into for-nex=
t)
Merging ftrace/for-next (daef239013f1 Merge unused-tracepoints/for-next)
Merging rcu/next (e371d09a7192 Merge branches 'rcu/misc', 'rcu/srcu' and 'r=
cu/refscale' into next)
CONFLICT (content): Merge conflict in kernel/trace/trace_syscalls.c
Merging paulmck/non-rcu/next (7f8fcc6f09fb memory-barriers.txt: Sort wait_e=
vent* and wait_on_bit* list alphabetically)
Merging kvm/next (6b36119b94d0 KVM: x86: Export KVM-internal symbols for su=
b-modules only)
Merging kvm-arm/next (2ea7215187c5 Merge branch 'kvm-arm64/vgic-lr-overflow=
' into kvmarm/next)
CONFLICT (content): Merge conflict in arch/arm64/kvm/vgic/vgic-v3.c
Merging kvms390/next (182a258b5ec4 Documentation: kvm: Fix ordering)
Merging kvm-ppc/topic/ppc-kvm (c17b750b3ad9 Linux 6.17-rc2)
Merging kvm-riscv/riscv_kvm_next (8c5fa3764fac RISC-V: KVM: Remove automati=
c I/O mapping for VM_PFNMAP)
Merging kvm-x86/next (16ec4fb4ac95 Merge branch 'vmx')
CONFLICT (content): Merge conflict in arch/x86/include/asm/cpufeatures.h
Merging xen-tip/linux-next (9d52b0b41be5 xen: take system_transition_mutex =
on suspend)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (4457265c61f3 workqueue: Remove unused assert_r=
cu_or_wq_mutex_or_pool_mutex)
Merging sched-ext/for-next (d64133f9be48 Merge branch 'for-6.18-fixes' into=
 for-next)
CONFLICT (content): Merge conflict in kernel/sched/ext.c
Merging drivers-x86/for-next (2806623efb16 platform/x86: asus-armoury: add =
ppt_* and nv_* tuning knobs)
Merging chrome-platform/for-next (52075d2c7595 platform/chrome: sensorhub: =
Support devices without FIFO_INT_ENABLE)
Merging chrome-platform-firmware/for-firmware-next (3a8660878839 Linux 6.18=
-rc1)
Merging hsi/for-next (3a8660878839 Linux 6.18-rc1)
Merging leds-lj/for-leds-next (ea1c4c7e648d leds: Drop duplicate LEDS_EXPRE=
SSWIRE config)
Merging ipmi/for-next (35bcedc1a793 MAINTAINERS: Add entry on Loongson-2K I=
PMI driver)
Merging driver-core/driver-core-next (ededb7bcdfdb rust: dma: use NonNull<T=
> instead of *mut T)
Merging usb/usb-next (18514fd70ea4 usb: typec: ucsi: Add support for orient=
ation)
Merging thunderbolt/next (9393a3a4207f thunderbolt: Replace use of system_w=
q with system_percpu_wq)
Merging usb-serial/usb-next (53002803832b USB: serial: kobil_sct: drop unne=
cessary initialisations)
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
Merging icc/icc-next (41aa8dd5b19c Merge branch 'icc-kaanapali' into icc-ne=
xt)
Merging iio/togreg (d16d1c255324 iio: imu: inv_icm45600: Initializes inv_ic=
m45600_buffer_postdisable() sleep)
Merging phy-next/next (3a8660878839 Linux 6.18-rc1)
Merging soundwire/next (96e539b24be5 soundwire: send multi sections in one =
BPT stream)
Merging extcon/extcon-next (dcb6fa37fd7b Linux 6.18-rc3)
Merging gnss/gnss-next (dcb6fa37fd7b Linux 6.18-rc3)
Merging vfio/next (0ed3a30fd996 hisi_acc_vfio_pci: Add .match_token_uuid ca=
llback in hisi_acc_vfio_pci_migrn_ops)
Merging w1/for-next (a5d908e0ec05 w1: omap-hdq: Remove redundant pm_runtime=
_mark_last_busy() calls)
Merging spmi/spmi-next (0ff41df1cb26 Linux 6.15)
Merging staging/staging-next (bd10acae08ae platform/raspberrypi: Destage VC=
HIQ MMAL driver)
Merging counter-next/counter-next (b462fcd08dd5 MAINTAINERS: Update Intel Q=
uadrature Encoder Peripheral maintainer)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (398035178503 i2c: i2c-qcom-geni: Add Block event in=
terrupt support)
Merging cgroup/for-next (6e4ea39323e2 Merge branch 'for-6.19' into for-next)
Merging scsi/for-next (aec860a0d3d2 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (e360bb6dc843 Merge patch series "replace old wq(=
s), added WQ_PERCPU to alloc_workqueue")
CONFLICT (content): Merge conflict in drivers/ufs/core/ufshcd.c
Merging vhost/linux-next (c6f3b304eb54 virtio_vdpa: fix misleading return i=
n void function)
Merging rpmsg/for-next (f982fbb1a6ca Merge branches 'rpmsg-next' and 'rproc=
-next' into for-next)
Merging gpio-brgl/gpio/for-next (b6d31cd41814 gpio: cdev: replace use of sy=
stem_wq with system_percpu_wq)
Merging gpio-intel/for-next (3a8660878839 Linux 6.18-rc1)
Merging pinctrl/for-next (61cbe48d9d1f Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (885b92bad87a Merge patch series "pinctrl: i=
ntel: Convert the rest to use INTEL_GPP()")
Merging pinctrl-renesas/renesas-pinctrl (3b0cf6ab3590 pinctrl: renesas: rzg=
2l: Refactor OEN register PWPR handling)
Merging pinctrl-samsung/for-next (3cfc60e09bdc pinctrl: samsung: Add ARTPEC=
-9 SoC specific configuration)
Merging pwm/pwm/for-next (d4c7f6f969cb Merge branch 'pwm/th1520' into pwm/f=
or-next)
CONFLICT (content): Merge conflict in rust/macros/module.rs
Applying: fix up for "pwm: Add Rust driver for T-HEAD TH1520 SoC"
Merging ktest/for-next (a5e71638ddd7 ktest.pl: Add new PATCHCHECK_SKIP opti=
on to skip testing individual commits)
Merging kselftest/next (37f46601383a selftests/tracing: Add basic test for =
trace_marker_raw file)
Merging kunit/test (3a8660878839 Linux 6.18-rc1)
Merging kunit-next/kunit (9de5f847ef8f Documentation: kunit: add descriptio=
n of kunit.enable parameter)
Merging livepatching/for-next (5cb5575308bc selftests: livepatch: use canon=
ical ftrace path)
Merging rtc/rtc-next (9d6d6b06933c rtc: nvvrs: add NVIDIA VRS RTC device dr=
iver)
Merging nvdimm/libnvdimm-for-next (acd9ea1714bb Documentation: btt: Unwrap =
bit 31-30 nested table)
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
Merging hyperv/hyperv-next (f2329fd987a0 Drivers: hv: Introduce mshv_vtl dr=
iver)
Merging auxdisplay/for-next (00de283c53c9 Merge patch series "auxdisplay: l=
inedisp: support attribute attachment to auxdisplay devices")
Merging kgdb/kgdb/for-next (fdbdd0ccb30a kdb: remove redundant check for sc=
ancode 0xe0)
Merging hmm/hmm (19272b37aa4f Linux 6.16-rc1)
Merging cfi/cfi/next (3a8660878839 Linux 6.18-rc1)
Merging mhi/mhi-next (9e24bdfecdb0 bus: mhi: ep: add WQ_PERCPU to alloc_wor=
kqueue users)
Merging memblock/for-next (e68f150bc11d memblock: drop for_each_free_mem_pf=
n_range_in_zone_from())
Merging cxl/next (482dc84e91a5 Merge branch 'for-6.19/cxl-elc' into cxl-for=
-next)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (cb46a58d77e5 efi/memattr: Convert efi_memattr_init() retu=
rn type to void)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (4186b91a3463 Merge branch 'slab/for-6.19/mempoo=
l_alloc_bulk' into slab/for-next)
CONFLICT (content): Merge conflict in mm/mempool.c
Merging random/master (2db833312d7e random: drop check for static_key_initi=
alized)
Merging landlock/next (6dde339a3df8 landlock: Minor comments improvements)
Merging rust/rust-next (5935461b4584 docs: rust: quick-start: add Debian 13=
 (Trixie))
CONFLICT (content): Merge conflict in rust/kernel/debugfs/file_ops.rs
CONFLICT (content): Merge conflict in rust/kernel/debugfs/traits.rs
CONFLICT (content): Merge conflict in rust/kernel/opp.rs
CONFLICT (content): Merge conflict in rust/kernel/pci/id.rs
CONFLICT (content): Merge conflict in rust/kernel/str.rs
Applying: fix up for "rust: replace `CStr` with `core::ffi::CStr`"
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
Merging bitmap/bitmap-for-next (6f15c3d715f1 bitops: Update kernel-doc in h=
weight.c to fix the issues with it)
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (c57f5fee54df libeth: xdp: Disable generic kCFI =
pass for libeth_xdp_tx_xmit_bulk())
Merging nolibc/for-next (2d8482959efe tools/nolibc: avoid using plain integ=
er as NULL pointer)
Merging iommufd/for-next (211ddde0823f Linux 6.18-rc2)
Merging turbostat/next (447c98c1ca4a tools/power turbostat: Add idle govern=
or statistics reporting)
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.8
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.c
Merging pwrseq/pwrseq/for-next (3a8660878839 Linux 6.18-rc1)
Merging capabilities-next/caps-next (211ddde0823f Linux 6.18-rc2)
Merging ipe/next (80bde9648247 ipe: Update documentation for script enforce=
ment)
Merging kcsan/next (dcb6fa37fd7b Linux 6.18-rc3)
Merging crc/crc-next (dcb6fa37fd7b Linux 6.18-rc3)
Merging fwctl/for-next (211ddde0823f Linux 6.18-rc2)
Merging devsec-tsm/next (a4438f06b1db PCI/TSM: Report active IDE streams)
Merging hisilicon/for-next (6c177775dcc5 Merge branch 'next/drivers' into f=
or-next)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)

--Sig_/YhxPL=TgyjEtSg+HXoDIjXC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkWvywACgkQAVBC80lX
0Gx6xQf+Ke/LAucDejzAY1V/A/k5JRLZsbVAc8JSS0ur8Vb2DLT05e2MuKY0WBfW
kaDJqe2h+uUFj8P43+/yVwpLkZdEpx+ZeEtCDYZ/9T7pM3ZBSLuK4+VRpQbBmgm/
o8PNxS3xINM6peNXrgVC2djWysCtS/b6fOivJ/GJySCBVLc+295fjyY19uKtQGd/
EnOFi/YFa4geYaNNd8QPrbzSSokpB5ybtIt7pFE37o9JNQj1GEsmfOdMiwMNpWOu
uTCN+TWlgp1Ewcy6gO5IBTIbTBR0MYsFYVgPKCNsS1OQt8Udn4xmDYz9FSiN4ON+
cbUxKevY4VlNFfRuNRRU8ZaoZqU2UA==
=+80L
-----END PGP SIGNATURE-----

--Sig_/YhxPL=TgyjEtSg+HXoDIjXC--

