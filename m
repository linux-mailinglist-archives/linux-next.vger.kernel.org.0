Return-Path: <linux-next+bounces-8908-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D056AC44D3B
	for <lists+linux-next@lfdr.de>; Mon, 10 Nov 2025 04:27:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 612974E04B9
	for <lists+linux-next@lfdr.de>; Mon, 10 Nov 2025 03:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D374278E63;
	Mon, 10 Nov 2025 03:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="J5YUSv9B"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5E1278E47;
	Mon, 10 Nov 2025 03:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762745265; cv=none; b=tgljtNwgjUDRq5UfA/5K9jRnrIaRSpN5eU2QTj+zfeJjibSE/67hLQn7WCnVreQnn1Ef2yzfT38bAEnaMPBqCxdODbmCSD+7fnHrEeDrYO4hLmZcNA9CLD2hHKYsWsdCfY7BrFxfUNupP34j/s0RsD1a/O8ZVaZiAoKi1TY6O7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762745265; c=relaxed/simple;
	bh=OhlvgFVBuqr+Q6TMH4m80hm6JihZcCGUd9PAgLN+MAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pR2cwW4GNX0ckMv4uaTTFt9n9Z+5dSP0tb3RByM3dN54gyT9LFgctcuLd2MjSchOSk4Lkh/obnAB5j8iFuo8PgPYdYzdc1x9fzWIwIxRsDv/U6UH6LtH4sjXVHnDA0OUdkBfe/D2kBji7YUjpScOMxw/syBPBBH62y6ofpaFvb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=J5YUSv9B; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762745255;
	bh=oygYSgYxPlvrzJ//alDzLxHPuXF/1//8Pi43+oVI79g=;
	h=Date:From:To:Cc:Subject:From;
	b=J5YUSv9BPqN2JIOREYiVA1CKBZm+XApOKKxn5qN0cGgMwMM+2JglM065FouckSi1c
	 RKJgUhzF0b1JHmjENAcBTwRLtw1zz4u5jZkOHl/u6wnjPw/pFvAVK5tLPzgTN70yKt
	 wg0iaIataLiLXFGEbt+ZNSjEVyI/lWP0bDjibmgosgtaMCh/l/0RpSlagVDnBbqocQ
	 jZO8jnAp6o/CkD2cSgX+DG98gKVMeE4jHIDGKOBfctjIm21vzSZJFx1EaBvj+EMz9A
	 i5ymw1TD8m7rUukgmwj/+SY33qOyeK0B5aqN5XcXQiNw3UZsYdO4/gWsUEgIQK/xK6
	 mwvGkT1LbtSvQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d4ZqC4V62z4w93;
	Mon, 10 Nov 2025 14:27:35 +1100 (AEDT)
Date: Mon, 10 Nov 2025 14:27:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 10
Message-ID: <20251110142734.052b833c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dC1XcyMNKNw0a=d7T9IIK3M";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dC1XcyMNKNw0a=d7T9IIK3M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20251107:

The driver-core tree lost its build failure.

The rust tree gained a conflict against the driver-core tree.

Non-merge commits (relative to Linus' tree): 6669
 7492 files changed, 299626 insertions(+), 99568 deletions(-)

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
Merging origin/master (f850568efe3a Merge tag 'i2c-for-6.18-rc5' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging ext4-fixes/fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging vfs-brauner-fixes/vfs.fixes (4cafd932679c power: always freeze efiv=
arfs)
Merging fscrypt-current/for-current (1e39da974ce6 fscrypt: fix left shift u=
nderflow when inode->i_blkbits > PAGE_SHIFT)
Merging fsverity-current/for-current (211ddde0823f Linux 6.18-rc2)
Merging btrfs-fixes/next-fixes (4f0e317ac310 Merge branch 'misc-6.18' into =
next-fixes)
Merging vfs-fixes/fixes (00e782110428 nfs4_setup_readdir(): insufficient lo=
cking for ->d_parent->d_inode dereferencing)
Merging erofs-fixes/fixes (f2a12cc3b97f erofs: avoid infinite loop due to i=
ncomplete zstd-compressed data)
Merging nfsd-fixes/nfsd-fixes (4d3dbc2386fe nfsd: add missing FATTR4_WORD2_=
CLONE_BLKSIZE from supported attributes)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (e8bd877fb76b ovl: fix possible double un=
link)
Merging fscrypt/for-next (211ddde0823f Linux 6.18-rc2)
Merging btrfs/for-next (6a58f7761975 Merge branch 'for-next-next-v6.18-2025=
1105' into for-next-20251105)
Merging ceph/master (87ab14795a89 libceph: drop started parameter of __ceph=
_open_session())
Merging cifs/for-next (e09d3791b73c smb: client: show smb lease key in open=
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
Merging ksmbd/ksmbd-for-next (cff0a1be08ae Merge tag 'v6.18-rc4-smb-server-=
fixes' of git://git.samba.org/ksmbd)
Merging nfs/linux-next (6146a0f1dfae Linux 6.18-rc4)
Merging nfs-anna/linux-next (9bb3baa9d160 NFS4: Fix state renewals missing =
after boot)
Merging nfsd/nfsd-next (738ac6af2c3d NFSD/blocklayout: Support multiple ext=
ents per LAYOUTGET)
Merging ntfs3/master (58bcc175c4c4 ntfs3: avoid memcpy size warning)
Applying: Revert "ntfs: set dummy blocksize to read boot_block when mountin=
g"
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
Merging vfs/for-next (15f5e46385aa Merge branches 'work.fs_context', 'work.=
f_path', 'work.qstr', 'work.misc', 'work.nfsctl' and 'work.finish_no_open' =
into for-next)
Merging mm-hotfixes/mm-hotfixes-unstable (c24c13212a29 kernel/kexec: fix IM=
A when allocation happens in CMA area)
Merging fs-current (fb6e427c3120 Merge branch 'nfsd-fixes' of https://git.k=
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
Merging ipvs/main (6a2108c78069 net: devmem: refresh devmem TX dst in case =
of route invalidation)
Merging wireless/for-next (a9da90e618cd wifi: mac80211: reject address chan=
ge while connecting)
Merging ath/for-current (9065b9687523 wifi: ath11k: zero init info->status =
in wmi_process_mgmt_tx_comp())
Merging iwlwifi/fixes (3802f25a6b5d wifi: iwlwifi: fix aux ROC time event i=
terator usage)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (da32d155f4a8 Merge tag 'gpio-fixes-for-v6.18-rc5=
' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux)
Merging sound-current/for-linus (7a39c723b747 ALSA: hda/tas2781: Add new qu=
irk for HP new projects)
Merging sound-asoc-fixes/for-linus (29528c8e643b ASoC: tas2781: fix getting=
 the wrong device number)
Merging regmap-fixes/for-linus (6146a0f1dfae Linux 6.18-rc4)
Merging regulator-fixes/for-linus (636f4618b1cd regulator: fixed: fix GPIO =
descriptor leak on register failure)
Merging spi-fixes/for-linus (939edfaa10f1 spi: xilinx: increase number of r=
etries before declaring stall)
Merging pci-current/for-linus (2b8258e8694f PCI/ASPM: Avoid L0s and L1 on F=
reescale Root Ports)
Merging driver-core.current/driver-core-linus (dcb6fa37fd7b Linux 6.18-rc3)
Merging tty.current/tty-linus (eb4917f557d4 serial: amba-pl011: prefer dma_=
mapping_error() over explicit address checking)
Merging usb.current/usb-linus (23379a17334f usb: typec: ucsi: psy: Set max =
current to zero when disconnected)
Merging usb-serial-fixes/usb-linus (2d8ab771d531 USB: serial: ftdi_sio: add=
 support for u-blox EVK-M101)
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
Merging dt-krzk-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging scsi-fixes/fixes (a2b32bc1d9e3 scsi: ufs: core: Fix invalid probe e=
rror return value)
Merging drm-fixes/drm-fixes (411336159064 Revert "drm/nouveau: set DMA mask=
 before creating the flush page")
Merging drm-intel-fixes/for-linux-next-fixes (7d44ad6b43d0 drm/i915: Fix co=
nversion between clock ticks and nanoseconds)
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
Merging rust-fixes/rust-fixes (789521b4717f rust: kbuild: support `-Cjump-t=
ables=3Dn` for Rust 1.93.0)
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
Merging tip-fixes/tip/urgent (439fc29dfd3b Merge tag 'drm-fixes-2025-11-09'=
 of https://gitlab.freedesktop.org/drm/kernel)
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
Merging drm-misc-fixes/for-linux-next-fixes (eef295a85082 drm/vmwgfx: Resto=
re Guest-Backed only cursor plane support)
Merging mm-stable/mm-stable (6146a0f1dfae Linux 6.18-rc4)
Merging mm-nonmm-stable/mm-nonmm-stable (6146a0f1dfae Linux 6.18-rc4)
Merging mm-unstable/mm-unstable (4450d244e9f4 mm/damon/tests/core-kunit: re=
move unused ctx in damon_test_split_regions_of())
Merging mm-nonmm-unstable/mm-nonmm-unstable (2fa523fd0829 MAINTAINERS: upda=
te nilfs2 entry)
Merging kbuild/kbuild-next (9362d34acf91 scripts/clang-tools: Handle includ=
ed .c files in gen_compile_commands)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (6331b2669359 perf tool: Add a delegate_tool t=
hat just delegates actions to another tool)
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
Merging amlogic/for-next (cb718411c4c0 Merge branch 'v6.19/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (5d21b7ca05c8 Merge branch 'apple-soc/=
drivers-6.19' into asahi-soc/for-next)
Merging at91/at91-next (c6f2dddfa7f9 clk: microchip: mpfs: use regmap for c=
locks)
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
Merging renesas/next (afade6fa8f17 Merge branch 'renesas-dts-for-v6.19' int=
o renesas-next)
Merging reset/reset/next (ce2883a0339c reset: rzg2l-usbphy-ctrl: Fix a NULL=
 vs IS_ERR() bug in probe)
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
Merging spacemit/for-next (0ee59934662d riscv: dts: spacemit: add MusePi Pr=
o board device tree)
Merging stm32/stm32-next (53c18dc078bb arm64: dts: st: fix memory region si=
ze on stm32mp235f-dk)
Merging sunxi/sunxi/for-next (28493fd26fd6 Merge branches 'sunxi/dt-for-6.1=
9' and 'sunxi/drivers-for-6.19' into sunxi/for-next)
Merging tee/next (e2c2e95934ea Merge branch 'tee_qcomtee_fixes_for_v6.18' i=
nto next)
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
Merging clk-renesas/renesas-clk (07525a693a5f clk: renesas: r9a09g056: Add =
clock and reset entries for ISP)
Merging thead-clk/thead-clk-for-next (3a8660878839 Linux 6.18-rc1)
Merging csky/linux-next (817d21578d51 csky: Remove compile warning for CONF=
IG_SMP)
Merging loongarch/loongarch-next (7b5f3a458d79 LoongArch: KVM: Fix max supp=
orted vCPUs set with EIOINTC)
Merging m68k/for-next (695f2c0c25f3 m68k: defconfig: Update defconfigs for =
v6.17-rc1)
Merging m68knommu/for-next (6146a0f1dfae Linux 6.18-rc4)
Merging microblaze/next (7f7072574127 Merge tag 'kbuild-6.18-1' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/kbuild/linux)
Merging mips/mips-next (3a8660878839 Linux 6.18-rc1)
Merging openrisc/for-next (8c30b0018f9d openrisc: Add jump label support)
Merging parisc-hd/for-next (3317aaca33dc parisc: remove unneeded semicolon =
in perf_regs.c)
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
Merging fs-next (175e9b9d956d Merge branch 'for-next' of https://git.kernel=
.org/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (f10f4006e547 Merge branch 'rework/write_atomic-uns=
afe' into for-next)
Merging pci/next (7efa17553b66 Merge branch 'pci/controller/sg2042')
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_vram.c
Merging pstore/for-next/pstore (b69255357368 pstore/ram: Update module para=
meters from platform data)
Merging hid/for-next (30a000de0b50 Merge branch 'for-6.19/nintendo' into fo=
r-next)
Merging i2c/i2c/for-next (6a0dddc53f6f i2c: muxes: pca954x: Fix broken rese=
t-gpio usage)
Merging i2c-host/i2c/i2c-host (eeaaf5bc1c5b dt-bindings: i2c: qcom-cci: Doc=
ument Kaanapali compatible)
Merging i3c/i3c/next (ddb37d5b130e i3c: mipi-i3c-hci-pci: Add support for I=
ntel Nova Lake-S I3C)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (68c2a8b59d23 hwmon: (sy7636a) Fix sensor =
description)
Merging jc_docs/docs-next (8710524f3fc9 docs: ABI: sysfs-module: update mod=
ules taint flags)
Merging v4l-dvb/next (b4fbb13db86a media: qcom: camss: Add support for MSM8=
939)
Merging v4l-dvb-next/master (adc218676eef Linux 6.12)
Merging pm/linux-next (b0d1ea577f3c Merge branch 'fixes' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (1971b18785d1 cpufreq: CPPC: Don=
't warn if FIE init fails to read counters)
Merging cpupower/cpupower (059835bbfa28 tools/power/cpupower: Support build=
ing libcpupower statically)
Merging devfreq/devfreq-next (eddb5ba91b28 PM / devfreq: rockchip-dfi: add =
support for LPDDR5)
Merging pmdomain/next (060d111e8a56 mfd: bcm2835-pm: Add support for BCM271=
2)
Merging opp/opp/linux-next (33ffb0aa8ce8 rust: opp: simplify callers of `to=
_c_str_array`)
Merging thermal/thermal/linux-next (dc67521c20b7 thermal/drivers/renesas/rz=
g3e: Fix add thermal driver for the Renesas RZ/G3E SoC)
Merging rdma/for-next (512c83265796 IB/rdmavt: rdmavt_qp.h: clean up kernel=
-doc comments)
Merging net-next/main (a0c3aefb08cd Merge branch '40GbE' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/tnguy/next-queue)
Merging bpf-next/for-next (ee7f5564309a Merge branch 'bpf-next/master' into=
 for-next)
CONFLICT (content): Merge conflict in kernel/bpf/helpers.c
Merging ipsec-next/master (6b3b6e59c4f8 pfkey: Deprecate pfkey)
Merging mlx5-next/mlx5-next (583b4fe1c19d net/mlx5: fs, set non default dev=
ice per namespace)
Merging netfilter-next/main (209ff7af79bf net: stmmac: rename devlink param=
eter ts_coarse into phc_coarse_adj)
Merging ipvs-next/main (0d0eb186421d cxgb4: flower: add support for fragmen=
tation)
Merging bluetooth/master (59e5396a2579 Bluetooth: hci_event: Fix not handli=
ng PA Sync Lost event)
CONFLICT (content): Merge conflict in net/bluetooth/iso.c
Merging wireless-next/for-next (1ec9871fbb80 Merge git://git.kernel.org/pub=
/scm/linux/kernel/git/netdev/net)
Merging ath-next/for-next (2977567b244f wifi: ath12k: Fix timeout error dur=
ing beacon stats retrieval)
Merging iwlwifi-next/next (3df28496673b wifi: iwlwifi: mld: add null check =
for kzalloc() in iwl_mld_send_proto_offload())
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (c95de73da12b mtd: spear_smi: fix kernel-doc warnings =
<linux/mtd/spear_smi.h>)
Merging nand/nand/next (88fd4e4deae8 mtd: rawnand: sunxi: Add support for H=
616 nand controller)
Merging spi-nor/spi-nor/next (604cf6a40157 mtd: spi-nor: winbond: Add suppo=
rt for W25H02NWxxAM chips)
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
Merging drm-misc/for-linux-next (a2b0c33e9423 accel/qaic: Add qaic_ prefix =
to irq_polling_work)
Merging amdgpu/drm-next (2e640e8e7b9e drm/amd/pm: Update default power1_cap)
Merging drm-intel/for-linux-next (d5230cd5c493 drm/i915/pmdemand: Use the d=
efault 2 usec fast polling timeout)
Merging drm-msm/msm-next (227ec96232ba drm/msm: fix allocation of dumb buff=
ers for non-RGB formats)
Merging drm-msm-lumag/msm-next-lumag (a643abb67379 drm/msm/mdp4: remove the=
 use of dev_err_probe())
Merging drm-rust/drm-rust-next (80b3dc0a5a2e gpu: nova-core: justify remain=
ing uses of `as`)
Merging drm-nova/nova-next (93296e9d9528 gpu: nova-core: vbios: store refer=
ence to Device where relevant)
Merging drm-xe/drm-xe-next (a46768ef5f91 drm/xe/tests: Add KUnit tests for =
PF fair provisioning)
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
Merging sound-asoc/for-next (9d531e65d505 Merge remote-tracking branch 'aso=
c/for-6.19' into asoc-next)
Merging modules/modules-next (ae83f3b72621 module: Add compile-time check f=
or embedded NUL characters)
Merging input/next (a311c777f298 dt-bindings: touchscreen: consolidate simp=
le touch controller to trivial-touch.yaml)
Merging block/for-next (0d7a41359405 Merge branch 'for-6.19/block' into for=
-next)
Merging device-mapper/for-next (9a04fe0edbb2 dm verity fec: Expose correcte=
d block count via status)
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
Merging watchdog/master (c64c2a50cdd4 watchdog/hpwdt New maintianer)
Merging iommu/next (91920a9d87f5 Merge branches 'arm/smmu/updates', 'arm/sm=
mu/bindings', 'mediatek', 'nvidia/tegra', 'amd/amd-vi' and 'core' into next)
Merging audit/next (c8a3dfe73159 audit: merge loops in __audit_inode_child(=
))
Merging devicetree/for-next (3b1728b74a52 of: overlay: Avoid spurious error=
 messages in of_overlay_remove())
Merging dt-krzk/for-next (7ee0f223cabe arm64: dts: toshiba: tmpv7708: Add d=
efault GIC address cells)
Merging mailbox/for-next (3f39f5652037 mailbox: mtk-cmdq: Remove pm_runtime=
 APIs from cmdq_mbox_send_data())
Merging spi/for-next (555ab9f99879 Merge remote-tracking branch 'spi/for-6.=
19' into spi-next)
Merging tip/master (5322b728568c Merge branch into tip/master: 'x86/sgx')
CONFLICT (content): Merge conflict in kernel/bpf/stackmap.c
Merging clockevents/timers/drivers/next (dc57dfd57317 clocksource/drivers/s=
tm: Fix double deregistration on probe failure)
Merging edac/edac-for-next (3e4244743110 Merge ras/edac-urgent into for-nex=
t)
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
Merging workqueues/for-next (8b8cfc05ada8 Merge branch 'for-6.18' into for-=
next)
Merging sched-ext/for-next (ba53f22ebe9e Merge branch 'for-6.19' into for-n=
ext)
CONFLICT (content): Merge conflict in kernel/sched/ext.c
Merging drivers-x86/for-next (ba06b928f05b platform/x86: x86-android-tablet=
s: Omit a variable reassignment in lenovo_yoga_tab2_830_1050_init_codec())
Merging chrome-platform/for-next (c862381bd03a platform/chrome: cros_ec_lig=
htbar: Check if ec supports suspend commands)
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
Merging coresight/next (aa5edd1b5ece coresight: tpdm: remove redundant chec=
k for drvdata)
Merging fastrpc/for-next (3a8660878839 Linux 6.18-rc1)
Merging fpga/for-next (3ff616a014a1 dt-bindings: fpga: update link for Alte=
ra's and AMD partial recon)
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
Merging staging/staging-next (d68eb9096fb0 Merge 6.18-rc3 into staging-next)
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
Merging rpmsg/for-next (5f4d69f0ef4f Merge branches 'rpmsg-next' and 'rproc=
-next' into for-next)
Merging gpio-brgl/gpio/for-next (b6d31cd41814 gpio: cdev: replace use of sy=
stem_wq with system_percpu_wq)
Merging gpio-intel/for-next (3a8660878839 Linux 6.18-rc1)
Merging pinctrl/for-next (f0c8ede3f4d2 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (396f45a34e83 Merge patch series "pinctrl: i=
ntel: Consolidate struct intel_padgroup initialisers")
Merging pinctrl-renesas/renesas-pinctrl (a5fad3aeff41 pinctrl: renesas: rzg=
2l: Remove useless wrappers)
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
Merging slimbus/for-next (4bb909aa44ed dt-bindings: slimbus: fix warning fr=
om example)
Merging nvmem/for-next (db5d5b9a07c3 Merge branches 'nvmem-fixes' and 'nvme=
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
Merging mhi/mhi-next (6eaee77923dd bus: mhi: host: pci_generic: Add Telit F=
E990B40 modem support)
Merging memblock/for-next (e68f150bc11d memblock: drop for_each_free_mem_pf=
n_range_in_zone_from())
Merging cxl/next (c692f5a947ad Merge branch 'for-6.19/cxl-elc' into cxl-for=
-next)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (4f90742d4a09 efistub/x86: Add fallback for SMBIOS record =
lookup)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (35e9d88daae5 Merge branch 'slab/for-6.19/sheave=
s_cleanups' into slab/for-next)
Merging random/master (933ecf591275 random: remove unused get_random_var_wa=
it functions)
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

--Sig_/dC1XcyMNKNw0a=d7T9IIK3M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkRW6YACgkQAVBC80lX
0GxaMQf/WQ3tFrG79Kqiedfv4kLzTPotCBDu9REtYGLXpsMsbBd12VYiuwgX14MC
52o+jAKTd5/7zgOD+9W//fwc7pznD0KQWKZ9IX3+8UopGtqXCMNr6EbLiHcdA+Pa
NnMw5BtlVS//vY0vagzVbu63mA7Q4Q7rB8G3aW88NmcHCOasTMEr3Wsbd2rH59La
PGjNVzUQ/xb/qjZv5ofdWOMxXFqjFRZ0jYJors4mDsVkjsnLVxz7eHyElQkrLk9+
qTCgtvdm6UvSLmsj3MQSEN6Fb1yLKNVsIx6HCPFcoNsIZyBeaDcV6WULQLXXPxHl
sn9qQgXeXsh/reDsIEUqxxmeBU1HTg==
=MOAB
-----END PGP SIGNATURE-----

--Sig_/dC1XcyMNKNw0a=d7T9IIK3M--

