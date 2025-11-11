Return-Path: <linux-next+bounces-8921-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 64699C4B739
	for <lists+linux-next@lfdr.de>; Tue, 11 Nov 2025 05:18:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2C4174E6E42
	for <lists+linux-next@lfdr.de>; Tue, 11 Nov 2025 04:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5FB81DE8AD;
	Tue, 11 Nov 2025 04:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kYpobtKC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010EC9476;
	Tue, 11 Nov 2025 04:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762834690; cv=none; b=iWjvkrFwTaNZVNUjaLUIgZxcXvrxKJnIyiWM5IwjN0tQgZbV/1IEsU3jZG+7ZKVUlsLS502NF6whWp6aalty/lhbx5UaOOS0JcU9g53AS+rLLRiRIWOllKStU+7izI2jU2Pjmf44MMynWvGJ77uITcPl3IgoTkX9VmT4pxHHgbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762834690; c=relaxed/simple;
	bh=NgIx8jWBKlMxxCQMDEqP0rnp2lJz5gRStURC8mjkGsA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MUU7DfAsCbC4jNeGgzXniF8I6jhzXEPDYw5hPdjPqJNVMzhqCEO5P9fnbfeYRKr4zUO7yfFgixxpmF2zVo7HHR/GH99lVcm3JX3tUGFO460zkCzJd54Et5pyBAJMzLuUcMIZJkNHQ3Spb52l5Rz2FgUXtXew8c/4W9aQDvhG4Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kYpobtKC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762834682;
	bh=jRFGLmQzg42fY+p7Tj7TEIPe4H96fbaLf/g2mHIYKxc=;
	h=Date:From:To:Cc:Subject:From;
	b=kYpobtKCkaU7TP5keKCOujiW1Ic4Nga1ZTk9RXhv6NZ4DMyKgMf9mqIAT80zfw0P9
	 M93bY0BhL3vCeaQMYCGrlKhgdl/YGPJ7TuoegSizIqhYxCYJSyXT2V3GRIFQA0vNBs
	 DC90ogf4Wmi5ZsBFzL477oXnGSe1CtfLlo0nFOTdF0W8lTbNLUk6+l/62eveRI+1zt
	 AzI08gkpXMxCE4/eoJxexdqTa0viywxer75DrF2mXRpUMXQ+QqHQEuy7T4UQnHin4O
	 AbH5V4h1PBfkEBqePZOnzMYdCBJ+zyum/Li7WmlQPIiorY+Dbh3ea6dOue5kFH2kSx
	 q/cXjSqEjwzJQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d5Cty4cSdz4wCy;
	Tue, 11 Nov 2025 15:18:02 +1100 (AEDT)
Date: Tue, 11 Nov 2025 15:18:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 11
Message-ID: <20251111151801.04688035@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CTZeyXwzy.3PNExtCIN.Cxd";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CTZeyXwzy.3PNExtCIN.Cxd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20251110:

The vfs-brauner tree gained a conflict against the nfs-anna tree.

Non-merge commits (relative to Linus' tree): 6839
 7690 files changed, 309105 insertions(+), 110718 deletions(-)

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
Merging origin/master (4ea7c1717f3f Merge tag 'for-linus' of git://git.kern=
el.org/pub/scm/virt/kvm/kvm)
Merging fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging ext4-fixes/fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging vfs-brauner-fixes/vfs.fixes (4cafd932679c power: always freeze efiv=
arfs)
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
Merging btrfs/for-next (85ec43b20570 Merge branch 'for-next-next-v6.18-2025=
1110' into for-next-20251110)
Merging ceph/master (87ab14795a89 libceph: drop started parameter of __ceph=
_open_session())
Merging cifs/for-next (17b905d0f1dd smb: client: show smb lease key in open=
_dirs output)
Merging configfs/configfs-next (462272dd734b configfs: use PTR_ERR_OR_ZERO(=
) to simplify code)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (8e4021078863 dlm: check for undefined release_option valu=
es)
Merging erofs/dev (e2d3af0d64e5 erofs: drop redundant sanity check for ztai=
lpacking inline)
Merging exfat/dev (cf77a65e954d exfat: zero out post-EOF page cache on file=
 extension)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (25554ea0b42b Pull udf extent block verification.)
Merging ext4/dev (9dbf945320b1 ext4: add two trace points for moving extent=
s)
Merging f2fs/dev (e4384545e220 f2fs: use folio_nr_pages() instead of shift =
operation)
Merging fsverity/for-next (211ddde0823f Linux 6.18-rc2)
Merging fuse/for-next (cb403594701c fuse: move CREATE_TRACE_POINTS to a sep=
arate file)
Merging gfs2/for-next (c002e7c9fc39 Revert "gfs2: Add GL_NOBLOCK flag")
Merging jfs/jfs-next (cafc6679824a jfs: replace hardcoded magic number with=
 DTPAGEMAXSLOT constant)
Merging ksmbd/ksmbd-for-next (98a5fd31cbf7 ksmbd: close accepted socket whe=
n per-IP limit rejects connection)
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
Merging xfs/for-next (d8a823c6f04e xfs: free xfs_busy_extents structure whe=
n no RT extents are queued)
Merging zonefs/for-next (a42938e80357 zonefs: correct some spelling mistake=
s)
Merging vfs-brauner/vfs.all (0413d2f2e3c2 Merge branch 'vfs-6.19.minix' int=
o vfs.all)
CONFLICT (content): Merge conflict in fs/btrfs/file.c
CONFLICT (content): Merge conflict in fs/nfs/localio.c
Merging vfs/for-next (15f5e46385aa Merge branches 'work.fs_context', 'work.=
f_path', 'work.qstr', 'work.misc', 'work.nfsctl' and 'work.finish_no_open' =
into for-next)
Merging mm-hotfixes/mm-hotfixes-unstable (8803a9822c09 kernel/kexec: fix IM=
A when allocation happens in CMA area)
Merging fs-current (d4909dc20e5b Merge branch 'nfsd-fixes' of https://git.k=
ernel.org/pub/scm/linux/kernel/git/cel/linux)
Merging kbuild-current/kbuild-fixes (002621a4df3c kbuild: Let kernel-doc.py=
 use PYTHON3 override)
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
Merging net/main (96a9178a29a6 net: phy: micrel: lan8814 fix reset of the Q=
SGMII interface)
Merging bpf/master (e427054ae7bc Merge branch 'x86-fgraph-bpf-fix-orc-stack=
-unwind-from-return-probe')
Merging ipsec/master (59630e2ccd72 xfrm: Prevent locally generated packets =
from direct output in tunnel mode)
Merging netfilter/main (de0337d641bf net: ionic: map SKB after pseudo-heade=
r checksum prep)
Merging ipvs/main (de0337d641bf net: ionic: map SKB after pseudo-header che=
cksum prep)
Merging wireless/for-next (a9da90e618cd wifi: mac80211: reject address chan=
ge while connecting)
Merging ath/for-current (9065b9687523 wifi: ath11k: zero init info->status =
in wmi_process_mgmt_tx_comp())
Merging iwlwifi/fixes (64be33a5d307 wifi: iwlwifi: mvm: fix beacon template=
/fixed rate)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (da32d155f4a8 Merge tag 'gpio-fixes-for-v6.18-rc5=
' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux)
Merging sound-current/for-linus (05a1fc5efdd8 ALSA: usb-audio: Fix potentia=
l overflow of PCM transfer buffer)
Merging sound-asoc-fixes/for-linus (eb2d6774cc0d ASoC: SDCA: bug fix while =
parsing mipi-sdca-control-cn-list)
Merging regmap-fixes/for-linus (6146a0f1dfae Linux 6.18-rc4)
Merging regulator-fixes/for-linus (636f4618b1cd regulator: fixed: fix GPIO =
descriptor leak on register failure)
Merging spi-fixes/for-linus (66e9feb03e7c spi: Add TODO comment about ACPI =
GPIO setup)
Merging pci-current/for-linus (2b8258e8694f PCI/ASPM: Avoid L0s and L1 on F=
reescale Root Ports)
Merging driver-core.current/driver-core-linus (dcb6fa37fd7b Linux 6.18-rc3)
Merging tty.current/tty-linus (eb4917f557d4 serial: amba-pl011: prefer dma_=
mapping_error() over explicit address checking)
Merging usb.current/usb-linus (23379a17334f usb: typec: ucsi: psy: Set max =
current to zero when disconnected)
Merging usb-serial-fixes/usb-linus (523bf0a59e67 USB: serial: option: add s=
upport for Rolling RW101R-GL)
Merging phy/fixes (3a8660878839 Linux 6.18-rc1)
Merging staging.current/staging-linus (dcb6fa37fd7b Linux 6.18-rc3)
Merging iio-fixes/fixes-togreg (fbe23e3ca052 iio: accel: bmc150: Fix irq as=
sumption regression)
Merging counter-current/counter-current (109ff654934a counter: microchip-tc=
b-capture: Allow shared IRQ for multi-channel TCBs)
Merging char-misc.current/char-misc-linus (baadf2a5c26e most: usb: fix doub=
le free on late probe failure)
Merging soundwire-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging thunderbolt-fixes/fixes (3575254546a2 thunderbolt: Add support for =
Intel Wildcat Lake)
Merging input-current/for-linus (e08969c4d65a Input: cros_ec_keyb - fix an =
invalid memory access)
Merging crypto-current/master (59b0afd01b2c crypto: hisilicon/qm - Fix devi=
ce reference leak in qm_get_qos_value)
Merging libcrypto-fixes/libcrypto-fixes (44e8241c51f7 lib/crypto: arm/curve=
25519: Disable on CPU_BIG_ENDIAN)
Merging vfio-fixes/for-linus (de8d1f2fd5a5 vfio: selftests: add end of addr=
ess space DMA map/unmap tests)
Merging kselftest-fixes/fixes (920aa3a7705a selftests: cachestat: Fix warni=
ng on declaration under label)
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
Merging mips-fixes/mips-fixes (3a8660878839 Linux 6.18-rc1)
Merging at91-fixes/at91-fixes (3a8660878839 Linux 6.18-rc1)
Merging omap-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging kvm-fixes/master (8a4821412cf2 KVM: nSVM: Fix and simplify LBR virt=
ualization handling with nested)
Merging kvms390-fixes/master (5f9df945d4e8 KVM: s390: Fix FOLL_*/FAULT_FLAG=
_* confusion)
Merging hwmon-fixes/hwmon (8746b9ce4180 hwmon: (gpd-fan) initialize EC on d=
river load for Win 4)
Merging nvdimm-fixes/libnvdimm-fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging cxl-fixes/fixes (b6cfddd26ec5 cxl: Adjust offset calculation for po=
ison injection)
Merging dma-mapping-fixes/dma-mapping-fixes (a50f7456f853 dma-mapping: Allo=
w use of DMA_BIT_MASK(64) in global scope)
Merging drivers-x86-fixes/fixes (f945afe01c67 platform/x86/amd: pmc: Add Le=
novo Legion Go 2 to pmc quirk list)
Merging samsung-krzk-fixes/fixes (0dac0b74c32a MAINTAINERS: Update Krzyszto=
f Kozlowski's email)
Merging pinctrl-samsung-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging devicetree-fixes/dt/linus (7209ff310083 of/irq: Export of_msi_xlate=
() for module usage)
Merging dt-krzk-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging scsi-fixes/fixes (a2b32bc1d9e3 scsi: ufs: core: Fix invalid probe e=
rror return value)
Merging drm-fixes/drm-fixes (e9a6fb0bcdd7 Linux 6.18-rc5)
Merging drm-intel-fixes/for-linux-next-fixes (994dec10991b drm/i915/psr: fi=
x pipe to vblank conversion)
Merging mmc-fixes/fixes (a28352cf2d2f mmc: sdhci-of-dwcmshc: Change DLL_STR=
BIN_TAPNUM_DEFAULT to 0x4)
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
Merging gpio-brgl-fixes/gpio/for-current (4436f484cb43 gpio: tb10x: Drop un=
used tb10x_set_bits() function)
Merging gpio-intel-fixes/fixes (b1055678a016 gpiolib: acpi: Use %pe when pa=
ssing an error pointer to dev_err())
Merging pinctrl-intel-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging auxdisplay-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging kunit-fixes/kunit-fixes (f3903ec76ae6 MAINTAINERS: Update KUnit ema=
il address for Rae Moar)
Merging memblock-fixes/fixes (b3dcc9d1d806 memblock: fix kernel-doc for MEM=
BLOCK_RSRV_NOINIT)
Merging renesas-fixes/fixes (379c590113ce ARM: shmobile: smp: Enforce shmob=
ile_smp_* alignment)
Merging perf-current/perf-tools (da32d155f4a8 Merge tag 'gpio-fixes-for-v6.=
18-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux)
Merging efi-fixes/urgent (e5f0a698b34e Linux 6.17)
Merging battery-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging iommufd-fixes/for-rc (afb47765f923 iommufd: Make vfio_compat's unma=
p succeed if the range is already empty)
Merging rust-fixes/rust-fixes (e9a6fb0bcdd7 Linux 6.18-rc5)
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
Merging tip-fixes/tip/urgent (e9a6fb0bcdd7 Linux 6.18-rc5)
Merging slab-fixes/slab/for-next-fixes (c379b745e12a slab: prevent infinite=
 loop in kmalloc_nolock() with debugging)
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
Merging drm-misc-fixes/for-linux-next-fixes (576c930e5e7d drm/panthor: Flus=
h shmem writes before mapping buffers CPU-uncached)
Merging mm-stable/mm-stable (e9a6fb0bcdd7 Linux 6.18-rc5)
Merging mm-nonmm-stable/mm-nonmm-stable (e9a6fb0bcdd7 Linux 6.18-rc5)
Merging mm-unstable/mm-unstable (93586dc935e6 mm: constify __dump_folio() a=
rguments)
Merging mm-nonmm-unstable/mm-nonmm-unstable (e50ff38f5183 include/linux/onc=
e_lite.h: fix judgment in WARN_ONCE with clang)
Merging kbuild/kbuild-next (9362d34acf91 scripts/clang-tools: Handle includ=
ed .c files in gen_compile_commands)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (081006b7c8e1 perf test: Add test that command=
 line period overrides sysfs/json values)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (131971f67e25 dma-mapping: remove =
unused map_page callback)
Merging asm-generic/master (edcc8a38b5ac once: fix race by moving DO_ONCE t=
o separate section)
Merging alpha/alpha-next (1523226edda5 alpha: Use str_yes_no() helper in pc=
i_dac_dma_supported())
Merging arm/for-next (eca2ec8c85ae Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (2dbddd9bb86e Merge branches 'for-next/misc' an=
d 'for-next/kselftest' into for-next/core)
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
Merging fsl/soc_fsl (5498f07842cb soc/fsl/qbman: Use for_each_online_cpu() =
instead of for_each_cpu())
Merging imx-mxs/for-next (8b5f72630660 Merge branch 'imx/dt64' into for-nex=
t)
Merging mediatek/for-next (67ed5843a67b Merge branch 'v6.18-next/dts64' int=
o for-next)
Merging mvebu/for-next (86a99e9f5394 Merge branch 'mvebu/fixes' into mvebu/=
for-next)
Merging omap/for-next (c9ec10221209 Merge branch 'omap-for-v6.19/drivers' i=
nto tmp/omap-next-20251105.163557)
Merging qcom/for-next (3c3d81183061 Merge branches 'arm32-for-6.19', 'arm64=
-defconfig-for-6.19', 'arm64-for-6.19', 'clk-for-6.19' and 'drivers-for-6.1=
9' into for-next)
Merging renesas/next (724f7daec118 Merge branch 'renesas-dts-for-v6.19' int=
o renesas-next)
Merging reset/reset/next (dae9b0708255 reset: fix BIT macro reference)
Merging rockchip/for-next (fb0a581e0696 Merge branch 'v6.19-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (4b67e4c65c1e Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (e5db90f4c044 Merge branch 'for-next/ffa/update=
s' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux=
 into for-linux-next)
Merging sophgo/for-next (8eff9c7a129e Merge branch 'dt/riscv' into for-next)
Merging sophgo-soc/soc-for-next (c8754c7deab4 soc: sophgo: cv1800: rtcsys: =
New driver (handling RTC only))
Merging spacemit/for-next (41d34e0b5497 riscv: dts: spacemit: enable K1 SoC=
 QSPI on BPI-F3)
Merging stm32/stm32-next (c23cb4565ad8 ARM: dts: stm32: lxa: drop unnecessa=
ry vusb_d/a-supply)
Merging sunxi/sunxi/for-next (28493fd26fd6 Merge branches 'sunxi/dt-for-6.1=
9' and 'sunxi/drivers-for-6.19' into sunxi/for-next)
Merging tee/next (b1a635dba104 Merge branch 'tee_fix_for_v6.18' into next)
Merging tegra/for-next (02f9977e97fa Merge branch for-6.19/arm64/dt into fo=
r-next)
Merging tenstorrent-dt/tenstorrent-dt-for-next (a71e6e8eea8a riscv: defconf=
ig: Enable Tenstorrent SoCs)
Merging thead-dt/thead-dt-for-next (d8a174babf64 riscv: dts: thead: Add res=
et controllers of more subsystems for TH1520)
Merging ti/ti-next (b22a83aff2e4 Merge branch 'ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (a35dc981c5d8 Merge branch 'zynqmp/defconfig' into =
for-next)
Merging clk/clk-next (3a8660878839 Linux 6.18-rc1)
Merging clk-imx/for-next (14be8b7b6cbc clk: imx95-blk-ctl: Save/restore reg=
isters when RPM routines are called)
Merging clk-renesas/renesas-clk (15b75dd2993e clk: renesas: r8a779a0: Add 3=
dge module clock)
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
Merging mips/mips-next (3a8660878839 Linux 6.18-rc1)
Merging openrisc/for-next (8c30b0018f9d openrisc: Add jump label support)
Merging parisc-hd/for-next (75b51437a4ac parisc: Drop linux/kernel.h includ=
e from asm/bug.h header)
Merging powerpc/next (ef104054a312 powerpc/pseries: Define __u{8,32} types =
in papr_hvpipe_hdr struct)
Merging risc-v/for-next (3a8660878839 Linux 6.18-rc1)
Merging riscv-dt/riscv-dt-for-next (fa939a287224 dts: starfive: jh7110-comm=
on: split out mmc0 reset pins from common into boards)
Merging riscv-soc/riscv-soc-for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging s390/for-next (85c8904db338 Merge branch 'features' into for-next)
CONFLICT (content): Merge conflict in include/linux/memory.h
Merging sh/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging sparc/for-next (fe0126702a40 sparc: Replace deprecated strcpy() wit=
h strscpy() in handle_nextprop_quirks())
Merging uml/next (293f71435d14 um: Always set up AT_HWCAP and AT_PLATFORM)
Merging xtensa/xtensa-for-next (4c8bad3ed035 xtensa: use HZ_PER_MHZ in plat=
form_calibrate_ccount)
Merging fs-next (1e4af614d0d1 Merge branch 'for-next' of https://git.kernel=
.org/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (48f9c9c1188b Merge branch 'for-6.19' into for-next)
Merging pci/next (7efa17553b66 Merge branch 'pci/controller/sg2042')
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
Merging hwmon-staging/hwmon-next (68c2a8b59d23 hwmon: (sy7636a) Fix sensor =
description)
Merging jc_docs/docs-next (77cbf5fbe572 Documentation: tps6594-pfsm: Fix ma=
cro cross-reference syntax)
Merging v4l-dvb/next (b4fbb13db86a media: qcom: camss: Add support for MSM8=
939)
Merging v4l-dvb-next/master (adc218676eef Linux 6.12)
Merging pm/linux-next (b0d1ea577f3c Merge branch 'fixes' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (47c303ba6e80 cpufreq: tegra194:=
 add WQ_PERCPU to alloc_workqueue users)
Merging cpupower/cpupower (059835bbfa28 tools/power/cpupower: Support build=
ing libcpupower statically)
Merging devfreq/devfreq-next (eddb5ba91b28 PM / devfreq: rockchip-dfi: add =
support for LPDDR5)
Merging pmdomain/next (bd4fae181ee0 pmdomain: mediatek: convert from clk ro=
und_rate() to determine_rate())
Merging opp/opp/linux-next (33ffb0aa8ce8 rust: opp: simplify callers of `to=
_c_str_array`)
Merging thermal/thermal/linux-next (dc67521c20b7 thermal/drivers/renesas/rz=
g3e: Fix add thermal driver for the Renesas RZ/G3E SoC)
Merging rdma/for-next (512c83265796 IB/rdmavt: rdmavt_qp.h: clean up kernel=
-doc comments)
Merging net-next/main (38f073a71e85 net: ravb: Correct bad check of timesta=
mp control flags)
Merging bpf-next/for-next (56bf36a859bd Merge branch 'bpf-next/net' into fo=
r-next)
CONFLICT (content): Merge conflict in kernel/bpf/helpers.c
Merging ipsec-next/master (6b3b6e59c4f8 pfkey: Deprecate pfkey)
Merging mlx5-next/mlx5-next (583b4fe1c19d net/mlx5: fs, set non default dev=
ice per namespace)
Merging netfilter-next/main (209ff7af79bf net: stmmac: rename devlink param=
eter ts_coarse into phc_coarse_adj)
Merging ipvs-next/main (209ff7af79bf net: stmmac: rename devlink parameter =
ts_coarse into phc_coarse_adj)
Merging bluetooth/master (9063119bdaee Bluetooth: btrtl: Avoid loading the =
config file on security chips)
CONFLICT (content): Merge conflict in net/bluetooth/iso.c
Merging wireless-next/for-next (473235677af4 wifi: cfg80211: fix doc of str=
uct key_params)
Merging ath-next/for-next (2977567b244f wifi: ath12k: Fix timeout error dur=
ing beacon stats retrieval)
Merging iwlwifi-next/next (1ec9871fbb80 Merge git://git.kernel.org/pub/scm/=
linux/kernel/git/netdev/net)
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
Merging libcrypto/libcrypto-next (ce59a87d1cbd Merge remote-tracking branch=
 'ebiggers/libcrypto-aes-gcm' into libcrypto-next)
Merging drm/drm-next (e237dfe70867 Merge tag 'drm-misc-next-2025-11-05-1' o=
f https://gitlab.freedesktop.org/drm/misc/kernel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/inc/hw=
/hw_shared.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dm=
c.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_device.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_gt.c
Merging drm-exynos/for-linux-next (3a8660878839 Linux 6.18-rc1)
Merging drm-misc/for-linux-next (be4cd2a13a31 accel/qaic: Format DBC states=
 table in sysfs ABI documentation)
Merging amdgpu/drm-next (2e640e8e7b9e drm/amd/pm: Update default power1_cap)
Merging drm-intel/for-linux-next (e109f644b871 drm/i915/dp_mst: Disable Pan=
el Replay)
  2750f6765d69 ("drm/i915/psr: fix pipe to vblank conversion")
Merging drm-msm/msm-next (227ec96232ba drm/msm: fix allocation of dumb buff=
ers for non-RGB formats)
Merging drm-msm-lumag/msm-next-lumag (a643abb67379 drm/msm/mdp4: remove the=
 use of dev_err_probe())
Merging drm-rust/drm-rust-next (e54ad0cd3673 rust/drm/gem: Fix missing head=
er in `Object` rustdoc)
Merging drm-nova/nova-next (93296e9d9528 gpu: nova-core: vbios: store refer=
ence to Device where relevant)
Merging drm-xe/drm-xe-next (3389c2be7fa0 drm/xe/vram: Move forcewake down t=
o get_flat_ccs_offset())
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (53be794e182f fbdev: vesafb: Use dev_* fn's instead =
printk)
Merging regmap/for-next (d40e1d95246b Merge remote-tracking branch 'regmap/=
for-6.19' into regmap-next)
Merging sound/for-next (4b1b92bdc4ca ALSA: au88x0: Fix array bounds warning=
 in EQ drivers)
Merging ieee1394/for-next (fa2dc2710076 firewire: core: code refactoring to=
 find and pop transaction entry)
Merging sound-asoc/for-next (e4dbcab57348 Merge remote-tracking branch 'aso=
c/for-6.19' into asoc-next)
Merging modules/modules-next (1ddac5cd7f27 MAINTAINERS: Add myself as revie=
wer for module support)
Merging input/next (a311c777f298 dt-bindings: touchscreen: consolidate simp=
le touch controller to trivial-touch.yaml)
Merging block/for-next (ae517822aead Merge branch 'for-6.19/io_uring' into =
for-next)
Merging device-mapper/for-next (5fc2367120ce dm mpath: enable DM_TARGET_ATO=
MIC_WRITES)
Merging libata/for-next (13f4d99582c8 ata: libata-sff: add WQ_PERCPU to all=
oc_workqueue users)
Merging pcmcia/pcmcia-next (4a81f78caa53 pcmcia: Add error handling for add=
_interval() in do_validate_mem())
Merging mmc/next (c2afdd73e5ba mmc: core: Skip to set the default 200mA SD =
current limit)
Merging mfd/for-mfd-next (f17f1b16e905 dt-bindings: mfd: dlg,da9063: Allow =
wakeup-source property)
Merging backlight/for-backlight-next (243ce64b2b37 backlight: Do not includ=
e <linux/fb.h> in header file)
Merging battery/for-next (8e8856396b54 Revert "power: supply: qcom_battmgr:=
 support disabling charge control")
Merging regulator/for-next (7db7d6de2738 Merge remote-tracking branch 'regu=
lator/for-6.19' into regulator-next)
Merging security/next (dfa024bc3f67 lsm: add a LSM_STARTED_ALL notification=
 event)
Merging apparmor/apparmor-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging integrity/next-integrity (43369273518f ima: add fs_subtype conditio=
n for distinguishing FUSE instances)
Merging selinux/next (20d387d7ceab selinux: improve bucket distribution uni=
formity of avc_hash())
Merging smack/next (6ddd169d0288 smack: fix kernel-doc warnings for smk_imp=
ort_valid_label())
Merging tomoyo/master (4cfad6d7da01 net/can/j1939: add j1939_priv debugging)
Merging tpmdd/next (dbfdaeb381a4 tpm_crb: Add idle support for the Arm FF-A=
 start method)
Merging watchdog/master (e9a6fb0bcdd7 Linux 6.18-rc5)
Merging iommu/next (91920a9d87f5 Merge branches 'arm/smmu/updates', 'arm/sm=
mu/bindings', 'mediatek', 'nvidia/tegra', 'amd/amd-vi' and 'core' into next)
Merging audit/next (c8a3dfe73159 audit: merge loops in __audit_inode_child(=
))
Merging devicetree/for-next (27a596298d00 dt-bindings: dma: Convert apm,xge=
ne-storm-dma to DT schema)
Merging dt-krzk/for-next (3a8660878839 Linux 6.18-rc1)
Merging mailbox/for-next (3f39f5652037 mailbox: mtk-cmdq: Remove pm_runtime=
 APIs from cmdq_mbox_send_data())
Merging spi/for-next (8b9311057969 Merge remote-tracking branch 'spi/for-6.=
19' into spi-next)
Merging tip/master (04ecb25c51b4 Merge branch into tip/master: 'x86/sgx')
CONFLICT (content): Merge conflict in kernel/bpf/stackmap.c
Merging clockevents/timers/drivers/next (dc57dfd57317 clocksource/drivers/s=
tm: Fix double deregistration on probe failure)
Merging edac/edac-for-next (9e18f240364a Merge branch 'edac-drivers' into e=
dac-for-next)
Merging ftrace/for-next (d81a2351e12a Merge unused-tracepoints/for-next)
Merging rcu/next (bde4a75124c6 Merge branches 'rcu/misc', 'rcu/srcu' and 'r=
cu/refscale' into next)
Merging paulmck/non-rcu/next (7f8fcc6f09fb memory-barriers.txt: Sort wait_e=
vent* and wait_on_bit* list alphabetically)
Merging kvm/next (6b36119b94d0 KVM: x86: Export KVM-internal symbols for su=
b-modules only)
Merging kvm-arm/next (dcb6fa37fd7b Linux 6.18-rc3)
Merging kvms390/next (182a258b5ec4 Documentation: kvm: Fix ordering)
Merging kvm-ppc/topic/ppc-kvm (c17b750b3ad9 Linux 6.17-rc2)
Merging kvm-riscv/riscv_kvm_next (8c5fa3764fac RISC-V: KVM: Remove automati=
c I/O mapping for VM_PFNMAP)
Merging kvm-x86/next (9052f4f6c539 Merge branch 'vmx')
CONFLICT (content): Merge conflict in arch/x86/include/asm/cpufeatures.h
Merging xen-tip/linux-next (9d52b0b41be5 xen: take system_transition_mutex =
on suspend)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (4457265c61f3 workqueue: Remove unused assert_r=
cu_or_wq_mutex_or_pool_mutex)
Merging sched-ext/for-next (ba53f22ebe9e Merge branch 'for-6.19' into for-n=
ext)
CONFLICT (content): Merge conflict in kernel/sched/ext.c
Merging drivers-x86/for-next (ba06b928f05b platform/x86: x86-android-tablet=
s: Omit a variable reassignment in lenovo_yoga_tab2_830_1050_init_codec())
Merging chrome-platform/for-next (944edca81e7a platform/chrome: cros_ec_ish=
tp: Fix UAF after unbinding driver)
Merging chrome-platform-firmware/for-firmware-next (3a8660878839 Linux 6.18=
-rc1)
Merging hsi/for-next (3a8660878839 Linux 6.18-rc1)
Merging leds-lj/for-leds-next (5246e3673eee leds: leds-lp50xx: LP5009 suppo=
rts 3 modules for a total of 9 LEDs)
Merging ipmi/for-next (35bcedc1a793 MAINTAINERS: Add entry on Loongson-2K I=
PMI driver)
Merging driver-core/driver-core-next (0bc605713f16 rust: debugfs: Implement=
 BinaryReader for Mutex<T> only when T is Unpin)
Merging usb/usb-next (18514fd70ea4 usb: typec: ucsi: Add support for orient=
ation)
Merging thunderbolt/next (9393a3a4207f thunderbolt: Replace use of system_w=
q with system_percpu_wq)
Merging usb-serial/usb-next (53002803832b USB: serial: kobil_sct: drop unne=
cessary initialisations)
Merging tty/tty-next (719f3df3e113 serial: sh-sci: Merge sh-sci.h into sh-s=
ci.c)
Merging char-misc/char-misc-next (c428900703aa Merge 6.18-rc3 into char-mis=
c-next)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (b139702a8896 coresight: change the sink_ops to acce=
pt coresight_path)
Merging fastrpc/for-next (3a8660878839 Linux 6.18-rc1)
Merging fpga/for-next (c9243d6df0d6 fpga: altera-cvp: Use pci_find_vsec_cap=
ability() when probing FPGA device)
Merging icc/icc-next (41aa8dd5b19c Merge branch 'icc-kaanapali' into icc-ne=
xt)
Merging iio/togreg (698dcf54282a iio: light: apds9960: convert to use maple=
 tree register cache)
Merging phy-next/next (3a8660878839 Linux 6.18-rc1)
Merging soundwire/next (3a8660878839 Linux 6.18-rc1)
Merging extcon/extcon-next (94d885eb8ffe dt-bindings: extcon: linux,extcon-=
usb-gpio: GPIO must be provided)
Merging gnss/gnss-next (dcb6fa37fd7b Linux 6.18-rc3)
Merging vfio/next (0ed3a30fd996 hisi_acc_vfio_pci: Add .match_token_uuid ca=
llback in hisi_acc_vfio_pci_migrn_ops)
Merging w1/for-next (f3c6353d801a w1: ds28e17: Replace deprecated strcpy + =
strcat in w1_f19_add_slave)
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
Merging cgroup/for-next (0177641333d8 Merge branch 'for-6.19' into for-next)
Merging scsi/for-next (558e705e922a Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (bb8222b6f358 Merge patch series "target: RW/num_=
cmds stats improvements")
Merging vhost/linux-next (c6f3b304eb54 virtio_vdpa: fix misleading return i=
n void function)
Merging rpmsg/for-next (f982fbb1a6ca Merge branches 'rpmsg-next' and 'rproc=
-next' into for-next)
Merging gpio-brgl/gpio/for-next (b6d31cd41814 gpio: cdev: replace use of sy=
stem_wq with system_percpu_wq)
Merging gpio-intel/for-next (3a8660878839 Linux 6.18-rc1)
Merging pinctrl/for-next (57916750bc08 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (396f45a34e83 Merge patch series "pinctrl: i=
ntel: Consolidate struct intel_padgroup initialisers")
Merging pinctrl-renesas/renesas-pinctrl (8903597df7b6 pinctrl: renesas: r8a=
779h0: Remove STPWT_EXTFXR)
Merging pinctrl-samsung/for-next (3cfc60e09bdc pinctrl: samsung: Add ARTPEC=
-9 SoC specific configuration)
Merging pwm/pwm/for-next (3bce60baca46 Merge branch 'pwm/th1520' into pwm/f=
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
Merging slimbus/for-next (79d84af33209 slimbus: ngd: Fix reference count le=
ak in qcom_slim_ngd_notify_slaves)
  79d84af33209 ("slimbus: ngd: Fix reference count leak in qcom_slim_ngd_no=
tify_slaves")
Merging nvmem/for-next (96a5d8a96c0f Merge branches 'nvmem-fixes' and 'nvme=
m-for-6.19' into nvmem-for-next)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (99310d8c930d mshv: Allow mappings that overlap =
in uaddr)
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
Merging cxl/next (c692f5a947ad Merge branch 'for-6.19/cxl-elc' into cxl-for=
-next)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (4f90742d4a09 efistub/x86: Add fallback for SMBIOS record =
lookup)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (3a404b75dc76 Merge branch 'slab/for-6.19/freeli=
st_aba_t_cleanups' into slab/for-next)
Merging random/master (2db833312d7e random: drop check for static_key_initi=
alized)
Merging landlock/next (6dde339a3df8 landlock: Minor comments improvements)
Merging rust/rust-next (5935461b4584 docs: rust: quick-start: add Debian 13=
 (Trixie))
CONFLICT (content): Merge conflict in rust/kernel/debugfs/file_ops.rs
CONFLICT (content): Merge conflict in rust/kernel/debugfs/traits.rs
CONFLICT (content): Merge conflict in rust/kernel/opp.rs
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

--Sig_/CTZeyXwzy.3PNExtCIN.Cxd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkSuPkACgkQAVBC80lX
0GzSuAf6Asvbo4SObjGqJudEn2LAoFtyKqMEso9+XQOjLw7igQP19VyZ7fqgS0ah
+apVo2dVXQVBZ9dQoEOqnqQ1AkpmkuJIFsj/XFTL2+Hp3yjsIL/lJXtPjufmI6ds
Jl5XLnUUidDyBmknuv76U8g973mAivXrvnQzo2olcpTntEPx98Aw9Yx4cl29NY57
bdMNpltmkikjo0E6q4WjTTS+s3ZM46L16rhJC9isOVIFxT5leNnwwz8g6xdHTkFv
ySXlZ2jxlqmIHk3kgu1vxvvGGXdGMcSkTQ0m4qlup5WuoteRlwXZ7k+fk6QnV95+
ViPyr0giU2M8vq5NUu/tj5NnpCvLMw==
=J2jw
-----END PGP SIGNATURE-----

--Sig_/CTZeyXwzy.3PNExtCIN.Cxd--

