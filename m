Return-Path: <linux-next+bounces-7652-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2E4B0BDE4
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 09:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34F33189293D
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 07:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91CC8283145;
	Mon, 21 Jul 2025 07:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ctGRa/O6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB842820B2;
	Mon, 21 Jul 2025 07:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753083693; cv=none; b=UGoA2SB4SUTsRYiqNotUW+3LeLH+roVaxuKVcDwpTYsXOohUMQ1gC4bOrZDYii+GsIIxfCZ8bl+QO5fHRFwI8uFpVZK+1eBoUHTyO4G8iAuZuZ2qqTJsDX3zyLnd0KnM70KjdJrrNiZ63fCNuBsNB41reDf22lliSQnxFrLZ3Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753083693; c=relaxed/simple;
	bh=gsZaC5DWUgHBrJBrLwpXu6QKvwsBRthlv2bWzxnZ1qg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Adl+m+h6Fw/MqJ/6o7hCOxkLDzPa+SWeG3n2wlZB6bEDZxWWDFcKZDY/idpjraOrD29UBjYdH3vsyR6pqH06sRcvhT9yp7LAjt54ZaQ/aX67sVR34vLCFqJQVPZHKtZB8hP+mAfJeqAieAoVkvNoMfjvwtzRAmTKxyyOCMZr6g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ctGRa/O6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753083535;
	bh=O5NTtpqaPywomJyPpdDWnX3mJsaevU/1XgJ2HJeOT5Q=;
	h=Date:From:To:Cc:Subject:From;
	b=ctGRa/O6u0mG8mYzkzygyslt/iuV996Mt6ZbwQCSfKVEtEvU2hnphRXi3rzjRJPp/
	 lmPEg61HXncj+/R/tF4Y6NMxo7jkHv9w+v9SIXTFfAGZpJCJqyJS81/OTkrzRY20q0
	 0RtxpZ5/frIKvei9PgskVzJeFbPs/VuFQZd2fmt0zcV0S6eX7KT/1UmTig07Um0JfX
	 SK4axMlGXXLyzWxNXTQex13YtIJh3KEPpjpgg4idmf7vV5LiBKI43oSM2uRe5PLlpc
	 jwpXTM7dz97Vm0NcldqaT8D8yRdcDx67+l21Py+4DKx+QI+4a19AjJEeL6+OS/EAWz
	 /o18KjZdxk0Ew==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4blshv5NkWz4wcg;
	Mon, 21 Jul 2025 17:38:55 +1000 (AEST)
Date: Mon, 21 Jul 2025 17:41:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 21
Message-ID: <20250721174126.75106f39@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eV0SNbsSfJH+HKHt_y0WH=1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/eV0SNbsSfJH+HKHt_y0WH=1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250718:

New tree: fsl

The xfs tree lost its build failure.

The pmdomain tree gained a conflict against the xilinx tree.

The crypto tree exposed a build failure for which I applied a patch.

The mailbox tree gained a build failure so I used the version from
next-20250718.

The vhost tree lost its build failure.

The slab tree gained a conflict against the mm-unstable tree.

The rust tree gained conflicts against Linus' tree and the driver-core
tree.

The kspp tree lost its build failure.

Non-merge commits (relative to Linus' tree): 10295
 10549 files changed, 410857 insertions(+), 222989 deletions(-)

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

I am currently merging 404 trees (counting Linus' and 153 trees of bug
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
Merging origin/master (89be9a83ccf1 Linux 6.16-rc7)
Merging fixes/fixes (b3c623b9a94f Merge tag 'thermal-6.15-rc1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging ext4-fixes/fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging vfs-brauner-fixes/vfs.fixes (a88cddaaa3bf MAINTAINERS: add block an=
d fsdevel lists to iov_iter)
Merging fscrypt-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging fsverity-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging btrfs-fixes/next-fixes (296391a79b55 Merge branch 'misc-6.16' into =
next-fixes)
Merging vfs-fixes/fixes (c6b61cde229f fix the regression in ufs options par=
sing)
Merging erofs-fixes/fixes (347e9f5043c8 Linux 6.16-rc6)
Merging nfsd-fixes/nfsd-fixes (94d10a4dba0b sunrpc: handle SVC_GARBAGE duri=
ng svc auth processing as auth error)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (924577e4f6ca ovl: Fix nested backing fil=
e paths)
Merging bcachefs/for-next (decfbefb90a0 bcachefs: Don't allow mounting with=
 crazy numbers of dirty journal entries)
Merging fscrypt/for-next (fa65058063cb ceph: Remove gfp_t argument from cep=
h_fscrypt_encrypt_*())
Merging btrfs/for-next (b3aa7a8c53ee Merge branch 'for-next-next-v6.16-2025=
0715' into for-next-20250715)
CONFLICT (content): Merge conflict in fs/btrfs/qgroup.c
Merging ceph/master (b828b4bf29d1 ceph: fix variable dereferenced before ch=
eck in ceph_umount_begin())
Merging cifs/for-next (135dbf0ecd38 cifs: reset iface weights when we canno=
t find a candidate)
Merging configfs/configfs-next (c6b190822459 MAINTAINERS: add configfs Rust=
 abstractions)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (6f8b4788266c dlm: drop SCTP Kconfig dependency)
Merging erofs/dev (e484a15cdbd3 erofs: implement metadata compression)
Merging exfat/dev (1edbfabb7967 exfat: add cluster chain loop check for dir)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (8f975e4b413a Merge UDF partition map count fix.)
Merging ext4/dev (45c7ca41de7e ext4: do not BUG when INLINE_DATA_FL lacks s=
ystem.data xattr)
Merging f2fs/dev (026e81230291 f2fs: fix to avoid out-of-boundary access in=
 dnode page)
Merging fsverity/for-next (d0b3b7b22dfa Linux 6.16-rc4)
Merging fuse/for-next (f0e84022479b virtio_fs: Remove redundant spinlock in=
 virtio_fs_request_complete())
Merging gfs2/for-next (deb016c16690 gfs2: No more self recovery)
Merging jfs/jfs-next (b89798e79cf7 jfs: stop using write_cache_pages)
Merging ksmbd/ksmbd-for-next (c05882a3a0e3 smb/server: add ksmbd_vfs_kern_p=
ath())
Merging nfs/linux-next (12d0bee90f13 pNFS/flexfiles: don't attempt pnfs on =
fatal DS errors)
Merging nfs-anna/linux-next (38074de35b01 NFSv4/flexfiles: Fix handling of =
NFS level errors in I/O)
Merging nfsd/nfsd-next (e339967eecf1 nfsd: Drop dprintk in blocklayout xdr =
functions)
Merging ntfs3/master (a49f0abd8959 Revert "fs/ntfs3: Replace inode_trylock =
with inode_lock")
Merging orangefs/for-next (d03e0b97244d fs: orangefs: replace scnprintf() w=
ith sysfs_emit())
Merging overlayfs/overlayfs-next (6f9ccdad0fea ovl: Annotate struct ovl_ent=
ry with __counted_by())
Merging ubifs/next (2b6d96503255 jffs2: check jffs2_prealloc_raw_node_refs(=
) result in few other places)
Merging v9fs/9p-next (4210030d8bc4 docs: fs/9p: Add missing "not" in cache =
documentation)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (f69153451328 Merge branch 'xfs-6.16-fixes' into for-n=
ext)
Merging zonefs/for-next (6982100bb829 zonefs: use ZONEFS_SUPER_SIZE instead=
 of PAGE_SIZE)
Merging vfs-brauner/vfs.all (4c838c7672c3 Merge branch 'vfs-6.17.iomap' int=
o vfs.all)
Merging vfs/for-next (0c8854f631d4 Merge branch 'work.fd' into for-next)
Merging mm-hotfixes/mm-hotfixes-unstable (80056e209225 resource: fix false =
warning in __request_region())
Merging fs-current (ef58e9c780ae Merge branch 'fixes' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging kbuild-current/fixes (e04c78d86a96 Linux 6.16-rc2)
Merging arc-current/for-curr (d7b8f8e20813 Linux 6.16-rc5)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (9dd175749341 arm64/mm: Drop wrong write=
s into TCR2_EL1)
Merging arm-soc-fixes/arm/fixes (8f0837fdc5d8 Merge tag 'qcom-arm64-defconf=
ig-fixes-for-6.16' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/=
linux into arm/fixes)
Merging davinci-current/davinci/for-current (19272b37aa4f Linux 6.16-rc1)
Merging drivers-memory-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging sophgo-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging sophgo-soc-fixes/soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging m68k-current/for-linus (f440518f379d m68k: defconfig: Update defcon=
figs for v6.15-rc1)
Merging powerpc-fixes/fixes (ab107276607a powerpc: Fix struct termio relate=
d ioctl macros)
Merging s390-fixes/fixes (71eb775bb536 s390/mm: Remove possible false-posit=
ive warning in pte_free_defer())
Merging net/main (81e0db8e8398 Merge branch 'mlx5-misc-fixes-2025-07-17')
Merging bpf/master (7abc678e3084 Merge tag 'pmdomain-v6.16-rc2' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm)
Merging ipsec/master (28712d6ed320 Merge branch 'ipsec: fix splat due to ip=
comp fallback tunnel')
Merging netfilter/main (7727ec1523d7 net: emaclite: Fix missing pointer inc=
rement in aligned_read())
Merging ipvs/main (7727ec1523d7 net: emaclite: Fix missing pointer incremen=
t in aligned_read())
Merging wireless/for-next (6832a9317eee Merge tag 'net-6.16-rc7' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ath/for-current (bbc19fef5789 Merge tag 'iwlwifi-fixes-2025-07-15' =
of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next)
Merging iwlwifi/fixes (46345ed36296 wifi: iwlwifi: Fix botched indexing con=
version)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (a9a9e68954f2 RDMA/mlx5: Fix vport loopback for M=
PV device)
Merging sound-current/for-linus (348954f9b78e Merge tag 'asoc-fix-v6.16-rc6=
' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for=
-linus)
Merging sound-asoc-fixes/for-linus (6bea85979d05 ASoC: mediatek: mt8365-dai=
-i2s: pass correct size to mt8365_dai_set_priv)
Merging regmap-fixes/for-linus (c871c199accb regmap: fix potential memory l=
eak of regmap_bus)
Merging regulator-fixes/for-linus (d7b8f8e20813 Linux 6.16-rc5)
Merging spi-fixes/for-linus (710505212e32 spi: Add check for 8-bit transfer=
 with 8 IO mode support)
Merging pci-current/for-linus (19272b37aa4f Linux 6.16-rc1)
Merging driver-core.current/driver-core-linus (86731a2a651e Linux 6.16-rc3)
Merging tty.current/tty-linus (6c0e9f05c9d7 pch_uart: Fix dma_sync_sg_for_d=
evice() nents value)
Merging usb.current/usb-linus (2521106fc732 usb: hub: Don't try to recover =
devices lost during warm reset.)
Merging usb-serial-fixes/usb-linus (252f4ac08cd2 USB: serial: option: add T=
elit Cinterion FE910C04 (ECM) composition)
Merging phy/fixes (b7acfeab8af9 phy: qcom: fix error code in snps_eusb2_hsp=
hy_probe())
Merging staging.current/staging-linus (f2b8ebfb8670 staging: vchiq_arm: Mak=
e vchiq_shutdown never fail)
Merging iio-fixes/fixes-togreg (ae68ad3d7a93 MAINTAINERS: add miscdevice Ru=
st abstractions)
Merging counter-current/counter-current (19272b37aa4f Linux 6.16-rc1)
Merging char-misc.current/char-misc-linus (2d7521aa26ec nvmem: layouts: u-b=
oot-env: remove crc32 endianness conversion)
Merging soundwire-fixes/fixes (834bce6a715a soundwire: Revert "soundwire: q=
com: Add set_channel_map api support")
Merging thunderbolt-fixes/fixes (2cdde91c14ec thunderbolt: Fix bit masking =
in tb_dp_port_set_hops())
Merging input-current/for-linus (bcce05041b21 Input: xpad - set correct con=
troller type for Acer NGR200)
Merging crypto-current/master (ccafe2821cfa crypto: qat - Use crypto_shash_=
export_core)
Merging libcrypto-fixes/libcrypto-fixes (68279380266a crypto: s390/sha - Fi=
x uninitialized variable in SHA-1 and SHA-2)
Merging vfio-fixes/for-linus (c1d9dac0db16 vfio/pci: Align huge faults to o=
rder)
Merging kselftest-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging dmaengine-fixes/fixes (3df63fa8f2af dma: dw-edma: Fix build warning=
 in dw_edma_pcie_probe())
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (6463cbe08b0c mtd: spinand: fix memory leak of =
ECC engine conf)
Merging mfd-fixes/for-mfd-fixes (d9d79e4f7dc9 mfd: Fix building without CON=
FIG_OF)
Merging v4l-dvb-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging reset-fixes/reset/fixes (19272b37aa4f Linux 6.16-rc1)
Merging mips-fixes/mips-fixes (86731a2a651e Linux 6.16-rc3)
Merging at91-fixes/at91-fixes (19272b37aa4f Linux 6.16-rc1)
Merging omap-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging kvm-fixes/master (4b7d440de209 Merge tag 'kvm-x86-fixes-6.16-rc7' o=
f https://github.com/kvm-x86/linux into HEAD)
Merging kvms390-fixes/master (d8dfda5af0be KVM: s390: pv: fix race when mak=
ing a page secure)
Merging hwmon-fixes/hwmon (9c62e2282900 hwmon: (gsc-hwmon) fix fan pwm setp=
oint show functions)
Merging nvdimm-fixes/libnvdimm-fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging cxl-fixes/fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging dma-mapping-fixes/dma-mapping-fixes (aa807b9f22df dma-contiguous: h=
ornor the cma address limit setup by user)
Merging drivers-x86-fixes/fixes (aef9da333823 platform/x86: dell-lis3lv02d:=
 Add Precision 3551)
Merging samsung-krzk-fixes/fixes (8d2c2fa2209e firmware: exynos-acpm: fix t=
imeouts on xfers handling)
Merging pinctrl-samsung-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging devicetree-fixes/dt/linus (f75794b6077e dt-bindings: serial: Conver=
t altr,uart-1.0 to DT schema)
Merging dt-krzk-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging scsi-fixes/fixes (021f243627ea scsi: ufs: core: Fix spelling of a s=
ysfs attribute name)
Merging drm-fixes/drm-fixes (4d33ed640ffc Merge tag 'drm-xe-fixes-2025-07-1=
7' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (d34d6feaf4a7 drm/dp: Change A=
UX DPCD probe address from LANE0_1_STATUS to TRAINING_PATTERN_SET)
Merging mmc-fixes/fixes (21b34a3a204e memstick: core: Zero initialize id_re=
g in h_memstick_read_dev_id())
Merging rtc-fixes/rtc-fixes (08d82d0cad51 rtc: pcf2127: add missing semicol=
on after statement)
Merging gnss-fixes/gnss-linus (86731a2a651e Linux 6.16-rc3)
Merging hyperv-fixes/hyperv-fixes (a4131a50d072 tools/hv: fcopy: Fix irregu=
larities with size of ring buffer)
Merging risc-v-fixes/fixes (b65ca21835ed riscv: uaccess: Fix -Wuninitialize=
d and -Wshadow in __put_user_nocheck)
Merging riscv-dt-fixes/riscv-dt-fixes (19272b37aa4f Linux 6.16-rc1)
Merging riscv-soc-fixes/riscv-soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging spdx/spdx-linus (19272b37aa4f Linux 6.16-rc1)
Merging gpio-brgl-fixes/gpio/for-current (11ff5e06e023 gpiolib: devres: rel=
ease GPIOs in devm_gpiod_put_array())
Merging gpio-intel-fixes/fixes (9ab29ed50555 gpiolib: acpi: Add a quirk for=
 Acer Nitro V15)
Merging pinctrl-intel-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging auxdisplay-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging kunit-fixes/kunit-fixes (19272b37aa4f Linux 6.16-rc1)
Merging memblock-fixes/fixes (da8bf5daa5e5 memblock: Accept allocated memor=
y before use in memblock_double_array())
Merging renesas-fixes/fixes (379c590113ce ARM: shmobile: smp: Enforce shmob=
ile_smp_* alignment)
Merging perf-current/perf-tools (86731a2a651e Linux 6.16-rc3)
Merging efi-fixes/urgent (64e135f1eaba efivarfs: Fix memory leak of efivarf=
s_fs_info in fs_context error paths)
Merging battery-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging iommufd-fixes/for-rc (9a96876e3c65 iommufd/selftest: Fix build warn=
ings due to uninitialized mfd)
Merging rust-fixes/rust-fixes (749815922677 rust: use `#[used(compiler)]` t=
o fix build and `modpost` with Rust >=3D 1.89.0)
Merging w1-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging pmdomain-fixes/fixes (621a88dbfe90 cpuidle: psci: Fix cpuhotplug ro=
utine with PREEMPT_RT=3Dy)
Merging i2c-host-fixes/i2c/i2c-host-fixes (c39101198e73 i2c: qup: jump out =
of the loop in case of timeout)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (a42b4dcc4f9f dt-bindings: clock: mediatek: Add=
 #reset-cells property for MT8188)
Merging thead-clk-fixes/thead-clk-fixes (19272b37aa4f Linux 6.16-rc1)
Merging pwrseq-fixes/pwrseq/for-current (19272b37aa4f Linux 6.16-rc1)
Merging thead-dt-fixes/thead-dt-fixes (19272b37aa4f Linux 6.16-rc1)
Merging ftrace-fixes/ftrace/fixes (327e28664307 fgraph: Do not enable funct=
ion_graph tracer when setting funcgraph-args)
Merging ring-buffer-fixes/ring-buffer/fixes (e4d4b8670c44 ring-buffer: Use =
flush_kernel_vmap_range() over flush_dcache_folio())
Merging trace-fixes/trace/fixes (b5e8acc14dcb tracing: Add down_write(trace=
_event_sem) when adding trace event)
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging tip-fixes/tip/urgent (c5788f4706fc Merge branch into tip/master: 'x=
86/urgent')
Merging slab-fixes/slab/for-next-fixes (be8250786ca9 mm, slab: clean up sla=
b->obj_exts always)
Merging drm-msm-fixes/msm-fixes (d3deabe4c619 drm/msm: Fix inverted WARN_ON=
() logic)
Merging uml-fixes/fixes (2dca89df0d11 Merge tag 'uml-for-6.16-rc4' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/uml/linux)
Merging fwctl-fixes/for-rc (19272b37aa4f Linux 6.16-rc1)
Merging devsec-tsm-fixes/fixes (fba4ceaa242d configfs-tsm-report: Fix NULL =
dereference of tsm_ops)
Merging drm-misc-fixes/for-linux-next-fixes (1918e79be908 Revert "drm/gem-d=
ma: Use dma_buf from GEM object instance")
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (9989db9f2305 mm/page_owner: convert set_page_o=
wner_migrate_reason() to folios)
Merging mm-nonmm-stable/mm-nonmm-stable (a9ed4422adac lib/raid6: update rec=
ov_rvv.c zero page usage)
Merging mm-unstable/mm-unstable (47330e3b5c84 fs/Kconfig: enable HUGETLBFS =
only if ARCH_SUPPORTS_HUGETLBFS)
Merging mm-nonmm-unstable/mm-nonmm-unstable (ef354737e8f3 stackdepot: make =
max number of pools boot-time configurable)
Merging kbuild/for-next (cce56902b934 scripts: add zboot support to extract=
-vmlinux)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (39f473f6d0b2 perf sched timehist: decode proc=
ess names of processes in zombie state)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (fbf5e2234169 dma-mapping: properl=
y calculate offset in the page)
Merging asm-generic/master (582847f97024 Makefile.kcov: apply needed compil=
er option unconditionally in CFLAGS_KCOV)
Merging alpha/alpha-next (1523226edda5 alpha: Use str_yes_no() helper in pc=
i_dac_dma_supported())
Merging arm/for-next (293bb049380e ARM: 9446/1: Disallow kernel mode NEON w=
hen IRQs are disabled)
Merging arm64/for-next/core (a4b9cc015d0d Merge branches 'for-next/acpi', '=
for-next/debug-entry', 'for-next/feat_mte_store_only', 'for-next/kselftest'=
, 'for-next/livepatch', 'for-next/mdscr-cleanup', 'for-next/misc', 'for-nex=
t/user-contig-bbml2' and 'for-next/vmap-stack' into for-next/core)
Merging arm-perf/for-next/perf (e480898e767c drivers/perf: hisi: Support PM=
Us with no interrupt)
Merging arm-soc/for-next (bda58e97c081 Merge branch 'soc/newsoc' into for-n=
ext)
Merging amlogic/for-next (58abdca0eb65 Merge branch 'v6.17/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (a13d71f8024a Merge branch 'asahi-soc/=
drivers-6.17' into asahi-soc/for-next)
Merging at91/at91-next (e99113d11171 Merge branch 'clk-microchip' into at91=
-next)
Merging bmc/for-next (78b9ff05065d Merge branches 'aspeed/drivers', 'aspeed=
/dt' and 'nuvoton/arm64/dt' into for-next)
Merging broadcom/next (89abb622d518 Merge branch 'drivers/next' into next)
Merging davinci/davinci/for-next (19272b37aa4f Linux 6.16-rc1)
Merging drivers-memory/for-next (93a7aedc4cc4 dt-bindings: memory: renesas,=
rzg3e-xspi: Document RZ/V2H(P) and RZ/V2N support)
Merging fsl/soc_fsl (76760b9dbbf8 soc: Use dev_fwnode())
Merging imx-mxs/for-next (cdc22fb12eff Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (6cbb623586d5 Merge branches 'v6.16-next/arm32', =
'v6.16-next/dts32', 'v6.16-next/dts64' and 'v6.16-next/soc' into for-next)
Merging mvebu/for-next (88084e0358ff Merge branch 'mvebu/dt' into mvebu/for=
-next)
Merging omap/for-next (db91121f001a Merge branch 'omap-for-v6.17/soc' into =
tmp/omap-next-20250707.142928)
Merging qcom/for-next (ba94ec807b07 Merge branches 'arm32-for-6.17', 'arm64=
-defconfig-fixes-for-6.16', 'arm64-defconfig-for-6.17', 'arm64-fixes-for-6.=
16', 'arm64-for-6.17', 'clk-for-6.17' and 'drivers-for-6.17' into for-next)
Merging renesas/next (7a323accaf6b Merge branches 'renesas-arm-defconfig-fo=
r-v6.17', 'renesas-drivers-for-v6.17', 'renesas-dt-bindings-for-v6.17' and =
'renesas-dts-for-v6.17' into renesas-next)
Merging reset/reset/next (196dbace0824 dt-bindings: reset: Convert snps,dw-=
reset to DT schema)
Merging rockchip/for-next (7c35a350efe4 Merge branch 'v6.17-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (94f19ac4670d Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (08602c5ae0e8 Merge tags 'scmi-updates-6.17' an=
d 'smccc-updates-6.17' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/gi=
t/sudeep.holla/linux into for-linux-next)
Merging sophgo/for-next (8727665368cd riscv: dts: sophgo: fix mdio node nam=
e for CV180X)
Merging sophgo-soc/soc-for-next (c8754c7deab4 soc: sophgo: cv1800: rtcsys: =
New driver (handling RTC only))
Merging spacemit/for-next (6be7a5a768aa Merge branch 'spacemit-clk-for-6.17=
' into spacemit-for-next)
Merging stm32/stm32-next (1a32f7427eb3 arm64: dts: st: remove empty line in=
 stm32mp251.dtsi)
Merging sunxi/sunxi/for-next (cbe908fc8ebb Merge branch 'sunxi/dt-for-6.17'=
 into sunxi/for-next)
Merging tee/next (c580875fc93a Merge branch 'optee_fix_for_6.16' into next)
Merging tegra/for-next (cf61b4a773f8 Merge branch for-6.17/arm64/defconfig =
into for-next)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging thead-dt/thead-dt-for-next (c31f2899eab0 riscv: dts: thead: Add PVT=
 node)
Merging ti/ti-next (65f6e3eb6351 Merge branch 'ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (457680ee325c Merge branch 'zynqmp/dt' into for-nex=
t)
Merging clk/clk-next (4b77a02e57d9 Merge branch 'clk-spacemit' into clk-nex=
t)
Merging clk-imx/for-next (19272b37aa4f Linux 6.16-rc1)
Merging clk-renesas/renesas-clk (0ab2d84f94da clk: renesas: r9a08g045: Add =
MSTOP for coupled clocks as well)
Merging thead-clk/thead-clk-for-next (d274c77ffa20 clk: thead: th1520-ap: C=
orrectly refer the parent of osc_12m)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (49e734ecec1a LoongArch: KVM: Add tracepoi=
nts for CPUCFG and CSR emulation exits)
Merging m68k/for-next (c8995932db2b m68k: mac: Improve clocksource driver c=
ommentary)
Merging m68knommu/for-next (89be9a83ccf1 Linux 6.16-rc7)
Merging microblaze/next (c0e7bb02f796 microblaze: Replace __ASSEMBLY__ with=
 __ASSEMBLER__ in non-uapi headers)
Merging mips/mips-next (35ad7e181541 MIPS: mm: tlb-r4k: Uniquify TLB entrie=
s on init)
Merging openrisc/for-next (f0eedcf22581 openrisc: Replace __ASSEMBLY__ with=
 __ASSEMBLER__ in non-uapi headers)
Merging parisc-hd/for-next (19272b37aa4f Linux 6.16-rc1)
Merging powerpc/next (75cd37c5f28b arch: powerpc: defconfig: Drop obsolete =
CONFIG_NET_CLS_TCINDEX)
Merging risc-v/for-next (fda589c28604 Merge patch series "Move duplicated i=
nstructions macros into asm/insn.h")
Merging riscv-dt/riscv-dt-for-next (1ec99dfe9eb0 riscv: dts: starfive: jh71=
10-common: add status power led node)
Merging riscv-soc/riscv-soc-for-next (bd4d5d3faadc riscv: defconfig: spacem=
it: enable sdhci driver for K1 SoC)
Merging s390/for-next (bbc33f667095 Merge branch 'fixes' into for-next)
Merging sh/for-next (19272b37aa4f Linux 6.16-rc1)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (f7e9077a1649 um: Stop tracking stub's PID via userspace_p=
id[])
Merging xtensa/xtensa-for-next (44a4ef59d550 xtensa: Replace __ASSEMBLY__ w=
ith __ASSEMBLER__ in non-uapi headers)
Merging fs-next (e25b84cb9ec2 Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
CONFLICT (content): Merge conflict in include/linux/proc_fs.h
Merging printk/for-next (dcc3191a3dde Merge branch 'rework/ringbuffer-kunit=
-test' into for-next)
Merging pci/next (a6b18cb880f1 Merge branch 'pci/misc')
Merging pstore/for-next/pstore (d679c2e1e8d9 pstore/zone: rewrite some comm=
ents for better understanding)
Merging hid/for-next (effc405e02be Merge branch 'for-6.17/apple' into for-n=
ext)
Merging i2c/i2c/for-next (466c7203e5f9 Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i2c-host/i2c/i2c-host (77fcac95c1e8 i2c: lpi2c: convert to use secs=
_to_jiffies())
Merging i3c/i3c/next (12aa3e0cb0c6 i3c: prefix hexadecimal entries in sysfs)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (a2609b707b58 hwmon: ina238: Add support f=
or INA228)
Merging jc_docs/docs-next (dcaf9d315cb7 docs: document linked lists)
Merging v4l-dvb/next (d968e50b5c26 media: rkvdec: Unstage the driver)
CONFLICT (content): Merge conflict in .mailmap
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (dfb7659050ce Merge branch 'pm-sleep' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (a7ce9ca1aaf9 drivers: cpufreq: =
add Tegra114 support)
Merging cpupower/cpupower (b74710eaff31 cpupower: Improve Python binding's =
Makefile)
Merging devfreq/devfreq-next (7da2fdaaa1e6 PM / devfreq: Add HiSilicon unco=
re frequency scaling driver)
Merging pmdomain/next (a876a3aacc43 remoteproc: imx_rproc: detect and attac=
h to pre-booted remote cores)
CONFLICT (content): Merge conflict in drivers/firmware/xilinx/zynqmp.c
Merging opp/opp/linux-next (22679d807dea rust: opp: use c_* types via kerne=
l prelude)
Merging thermal/thermal/linux-next (e23cba0ab49a thermal/drivers/airoha: Fi=
x spelling mistake)
Merging rdma/for-next (aee80e6ffc58 RDMA/mlx5: remove redundant check on er=
r on return expression)
Merging net-next/main (4701ee5044fb be2net: Use correct byte order and form=
at string for TCP seq and ack_seq)
CONFLICT (content): Merge conflict in drivers/net/ethernet/microsoft/mana/g=
dma_main.c
CONFLICT (content): Merge conflict in net/core/net_namespace.c
Merging bpf-next/for-next (f227e9ed4fe4 Merge branch 'bpf-next/master' into=
 for-next)
CONFLICT (modify/delete): arch/s390/net/bpf_jit.h deleted in bpf-next/for-n=
ext and modified in HEAD.  Version HEAD of arch/s390/net/bpf_jit.h left in =
tree.
CONFLICT (content): Merge conflict in kernel/bpf/helpers.c
CONFLICT (add/add): Merge conflict in tools/testing/selftests/bpf/prog_test=
s/cgroup_xattr.c
CONFLICT (add/add): Merge conflict in tools/testing/selftests/bpf/progs/rea=
d_cgroupfs_xattr.c
$ git rm -f arch/s390/net/bpf_jit.h
Merging ipsec-next/master (95cfe23285a6 xfrm: Skip redundant statistics upd=
ate for crypto offload)
Merging mlx5-next/mlx5-next (9a0048e0ae14 net/mlx5: Expose cable_length fie=
ld in PFCC register)
Merging netfilter-next/main (a52f9f0d77f2 Merge tag 'batadv-next-pullreques=
t-20250710' of git://git.open-mesh.org/linux-merge)
Merging ipvs-next/main (a52f9f0d77f2 Merge tag 'batadv-next-pullrequest-202=
50710' of git://git.open-mesh.org/linux-merge)
Merging bluetooth/master (2215f5c93ed1 Bluetooth: hci_devcd_dump: fix out-o=
f-bounds via dev_coredumpv)
CONFLICT (content): Merge conflict in drivers/bluetooth/btusb.c
CONFLICT (content): Merge conflict in include/net/bluetooth/hci_core.h
Merging wireless-next/for-next (754fe848b3b2 Reapply "wifi: mac80211: Updat=
e skb's control block key in ieee80211_tx_dequeue()")
Merging ath-next/for-next (d29591d5b52e wifi: ath12k: Advertise encapsulati=
on/decapsulation offload support to mac80211)
Merging iwlwifi-next/next (24bc49d158c7 wifi: iwlwifi: remove support of se=
veral iwl_ppag_table_cmd versions)
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (9358bdb9f9f5 mtd: fix possible integer overflow in er=
ase_xfer())
Merging nand/nand/next (4b5532d4581d mtd: nand: brcmnand: replace manual st=
ring choices with standard helpers)
Merging spi-nor/spi-nor/next (2e3a7476ec39 mtd: spi-nor: Fix spi_nor_try_un=
lock_all())
Merging crypto/master (4fec76bcc535 crypto: jitter - replace ARRAY_SIZE def=
inition with header include)
Merging libcrypto/libcrypto-next (af33b690bce1 Merge branches 'libcrypto-co=
nversions' and 'libcrypto-tests' into libcrypto-next)
CONFLICT (modify/delete): arch/s390/crypto/sha1_s390.c deleted in libcrypto=
/libcrypto-next and modified in HEAD.  Version HEAD of arch/s390/crypto/sha=
1_s390.c left in tree.
CONFLICT (modify/delete): arch/s390/crypto/sha512_s390.c deleted in libcryp=
to/libcrypto-next and modified in HEAD.  Version HEAD of arch/s390/crypto/s=
ha512_s390.c left in tree.
CONFLICT (modify/delete): arch/s390/lib/crypto/sha256.c deleted in libcrypt=
o/libcrypto-next and modified in HEAD.  Version HEAD of arch/s390/lib/crypt=
o/sha256.c left in tree.
$ git rm -f arch/s390/crypto/sha512_s390.c arch/s390/lib/crypto/sha256.c ar=
ch/s390/crypto/sha1_s390.c
Merging drm/drm-next (acab5fbd77a5 Merge tag 'amd-drm-next-6.17-2025-07-17'=
 of https://gitlab.freedesktop.org/agd5f/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_dev=
ice.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_fen=
ce.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_rin=
g.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_sdm=
a.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_uco=
de.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/sdma_v4_4_=
2.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dc.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/display/drm_dp_helper=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/etnaviv/etnaviv_sched=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/virtio/virtgpu_prime.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/display/xe_display=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_ggtt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_gt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_gt_sriov_pf_con=
fig.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_ct.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_ct.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_hwmon.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_lmtt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_lrc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_module.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_uc_fw.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_wa_oob.rules
Applying: fix up bad merge of the amdgpu tree
Merging drm-exynos/for-linux-next (19272b37aa4f Linux 6.16-rc1)
Merging drm-misc/for-linux-next (b213eb34f857 drm/tidss: oldi: convert to d=
evm_drm_bridge_alloc() API)
Merging amdgpu/drm-next (6ac55eab4fc4 drm/amdgpu: move reset support type c=
hecks into the caller)
Merging drm-intel/for-linux-next (01e1575609f1 drm/i915: Don't pass crtc_st=
ate to foo_plane_ctl() & co.)
Merging drm-msm/msm-next (8290d37ad2b0 drm/msm: Small function param doc fi=
x)
Merging drm-msm-lumag/msm-next-lumag (cd86e80b77b2 drm/msm/dp: add linux/io=
.h header to fix build errors)
Merging drm-nova/nova-next (14ae91a81ec8 gpu: nova-core: fix bounds check i=
n PmuLookupTableEntry::new)
Merging drm-xe/drm-xe-next (4b5514f786dd drm/xe: Remove unnecessary EU stal=
l debug message)
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (59d1fc7b3e1a fbdev: pm3fb: fix potential divide by =
zero)
Merging regmap/for-next (5c3a02bdb0a8 Merge remote-tracking branch 'regmap/=
for-6.17' into regmap-next)
Merging sound/for-next (f261196d4bf1 mips: loongson3_defconfig: Update HD-a=
udio configs)
Merging ieee1394/for-next (95a042a0c8ec firewire: ohci: reduce the size of =
common context structure by extracting members into AT structure)
Merging sound-asoc/for-next (e31ecab02929 Merge remote-tracking branch 'aso=
c/for-6.17' into asoc-next)
CONFLICT (content): Merge conflict in sound/soc/codecs/hdac_hdmi.c
Merging modules/modules-next (699657e8e50a kunit: test: Drop CONFIG_MODULE =
ifdeffery)
Merging input/next (bc25e6bf032e Input: mtk-pmic-keys - add support for MT6=
359 PMIC keys)
Merging block/for-next (49fec8c6d49e Merge branch 'for-6.17/io_uring' into =
for-next)
CONFLICT (content): Merge conflict in Documentation/userspace-api/ioctl/ioc=
tl-number.rst
Merging device-mapper/for-next (84eafc3496bb vdo: omit need_resched() befor=
e cond_resched())
CONFLICT (content): Merge conflict in drivers/md/dm-stripe.c
Merging libata/for-next (546527b92d7e Documentation: driver-api: Update lib=
ata error handler information)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (c3ad4ec3fdab mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (8f3ef4da96dd mfd: mt6370: Fix the interrupt namin=
g typo)
CONFLICT (modify/delete): drivers/input/keyboard/adp5589-keys.c deleted in =
mfd/for-mfd-next and modified in HEAD.  Version HEAD of drivers/input/keybo=
ard/adp5589-keys.c left in tree.
$ git rm -f drivers/input/keyboard/adp5589-keys.c
Merging backlight/for-backlight-next (19272b37aa4f Linux 6.16-rc1)
Merging battery/for-next (7b41a2341fa6 power: supply: core: fix static chec=
ker warning)
Merging regulator/for-next (d511206dc744 regulator: core: repeat voltage se=
tting request for stepped regulators)
Merging security/next (5d8b97c94677 MAINTAINERS: Add Xiu and myself as Lock=
down maintainers)
Merging apparmor/apparmor-next (4d9d1a08b796 apparmor: fix: accept2 being s=
pecifie even when permission table is presnt)
Merging integrity/next-integrity (aa9bb1b32594 ima: add a knob ima=3D to al=
low disabling IMA in kdump kernel)
Merging selinux/next (850dada4b3af Automated merge of 'dev' into 'next')
Merging smack/next (6ddd169d0288 smack: fix kernel-doc warnings for smk_imp=
ort_valid_label())
Merging tomoyo/master (d7b8f8e20813 Linux 6.16-rc5)
Merging tpmdd/next (c2e040856a1b tpm: Use of_reserved_mem_region_to_resourc=
e() for "memory-region")
Merging watchdog/master (ddb8172cdf88 watchdog: Don't use "proxy" headers)
Merging iommu/next (c2a08479b5f8 Merge branches 'intel/vt-d', 'amd/amd-vi',=
 'mediatek', 'ti/omap', 'apple/dart', 'arm/smmu/bindings' and 'arm/smmu/upd=
ates' into next)
Merging audit/next (ae1ae11fb277 audit,module: restore audit logging in loa=
d failure case)
Merging devicetree/for-next (828e50188de5 dt-bindings: trivial-devices: Add=
 undocumented hwmon devices)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/tri=
vial-devices.yaml
Merging dt-krzk/for-next (6cd594ed969d ARM: dts: vt8500: Add L2 cache contr=
oller on WM8850/WM8950)
Merging mailbox/for-next (f094486342b0 dt-bindings: mailbox: qcom-ipcc: doc=
ument the SM7635 Inter-Processor Communication Controller)
$ git reset --hard HEAD^
Merging next-20250718 version of mailbox
Merging spi/for-next (b3038fd09644 Merge remote-tracking branch 'spi/for-6.=
17' into spi-next)
Merging tip/master (ed0272f0675f Merge branch into tip/master: 'x86/sev')
Merging clockevents/timers/drivers/next (7e477e9c4eb4 clocksource/drivers/e=
xynos_mct: Fix section mismatch from the module conversion)
Merging edac/edac-for-next (1fb0ddddf5d1 Merge branch 'edac-drivers' into e=
dac-for-next)
Merging ftrace/for-next (834396a1f88e Merge tools/for-next)
Merging rcu/next (553a3d47d269 Merge branches 'rcu-exp.08.07.2025', 'rcu.17=
.07.2025', 'torture-scripts.16.07.2025', 'srcu.19.07.2025', 'rcu.nocb.18.07=
.2025' and 'refscale.07.07.2025' into rcu.merge.19.07.2025)
Merging paulmck/non-rcu/next (b706eec9304f Merge branches 'lkmm.2025.07.09a=
', 'ratelimit.2025.06.24a' and 'stop-machine.2025.07.17a' into HEAD)
Merging kvm/next (4b7d440de209 Merge tag 'kvm-x86-fixes-6.16-rc7' of https:=
//github.com/kvm-x86/linux into HEAD)
Merging kvm-arm/next (811ec70dcf9c Merge branch 'kvm-arm64/config-masks' in=
to kvmarm/next)
Merging kvms390/next (d6c8097803cb KVM: s390: Simplify and move pv code)
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (4cec89db80ba RISC-V: KVM: Move HGEI[E|P] =
CSR access to IMSIC virtualization)
Merging kvm-x86/next (31bac41e4455 Merge branch 'svm')
Merging xen-tip/linux-next (70045cf6593c xen/gntdev: remove struct gntdev_c=
opy_batch from stack)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (324cee0c272c Merge branch 'for-6.17' into for-=
next)
Merging sched-ext/for-next (9f0744a0e87e Merge branch 'for-6.17' into for-n=
ext)
Merging drivers-x86/for-next (6e38b9fcbfa3 platform/x86: lenovo: gamezone n=
eeds "other mode")
CONFLICT (content): Merge conflict in drivers/platform/x86/Makefile
Merging chrome-platform/for-next (ab229c2b72c3 platform/chrome: cros_ec_typ=
ec: Add role swap ops)
Merging chrome-platform-firmware/for-firmware-next (19272b37aa4f Linux 6.16=
-rc1)
Merging hsi/for-next (19272b37aa4f Linux 6.16-rc1)
Merging leds-lj/for-leds-next (239afba8b9f3 leds: pca955x: Avoid potential =
overflow when filling default_label (take 2))
Merging ipmi/for-next (f6f9760320a9 char: ipmi: remove redundant variable '=
type' and check)
Merging driver-core/driver-core-next (9a8682f0875b rust: net::phy Change mo=
dule_phy_driver macro to use module_device_table macro)
CONFLICT (content): Merge conflict in drivers/gpu/nova-core/driver.rs
CONFLICT (modify/delete): drivers/infiniband/hw/qib/qib_sysfs.c deleted in =
HEAD and modified in driver-core/driver-core-next.  Version driver-core/dri=
ver-core-next of drivers/infiniband/hw/qib/qib_sysfs.c left in tree.
CONFLICT (content): Merge conflict in rust/helpers/helpers.c
$ git rm -f drivers/infiniband/hw/qib/qib_sysfs.c
Merging usb/usb-next (f72b9aa821a2 usb: xhci: Set avg_trb_len =3D 8 for EP0=
 during Address Device Command)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/freescale/s32g2.d=
tsi
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/freescale/s32g3.d=
tsi
Merging thunderbolt/next (2d1beba54fda thunderbolt: Fix typos in documentat=
ion comments)
Merging usb-serial/usb-next (bdf2ab177e2f USB: serial: cp210x: use new GPIO=
 line value setter callbacks)
Merging tty/tty-next (103f5d8c35b3 tty: omit need_resched() before cond_res=
ched())
Merging char-misc/char-misc-next (631ae0c01010 mei: more prints with client=
 prefix)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (26e20622a8ae coresight: add coresight Trace Network=
 On Chip driver)
Merging fastrpc/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga/for-next (37e00703228a zynq_fpga: use sgtable-based scatterlis=
t wrappers)
Merging icc/icc-next (0a41d93cb73a Merge branch 'icc-fixes' into icc-next)
Merging iio/togreg (0a686b9c4f84 iio: adc: ad_sigma_delta: Select IIO_BUFFE=
R_DMAENGINE and SPI_OFFLOAD)
Merging phy-next/next (304c102cff73 phy: qcom: qmp-combo: Add missing PLL (=
VCO) configuration on SM8750)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging soundwire/next (06f77ff9d852 soundwire: debugfs: move debug stateme=
nt outside of error handling)
Merging extcon/extcon-next (5f09caafc652 extcon: fsa9480: Avoid buffer over=
flow in fsa9480_handle_change())
Merging gnss/gnss-next (e326371f3002 dt-bindings: gnss: u-blox: add u-blox,=
neo-9m compatible)
Merging vfio/next (9c4a082c8347 vfio/type1: conditional rescheduling while =
pinning)
Merging w1/for-next (19272b37aa4f Linux 6.16-rc1)
Merging spmi/spmi-next (0ff41df1cb26 Linux 6.15)
Merging staging/staging-next (ce32eff1cf3a staging: greybus: gbphy: fix up =
const issue with the match callback)
Merging counter-next/counter-next (19272b37aa4f Linux 6.16-rc1)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (0044c5fcae3d dmaengine: idxd: Remove __packed from =
structures)
Merging cgroup/for-next (d445d2ab8129 Merge branch 'for-6.17' into for-next)
Merging scsi/for-next (62b38fb31831 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (add4c4850363 scsi: bfa: Double-free fix)
Merging vhost/linux-next (c7991b44d7b4 vsock/virtio: Allocate nonlinear SKB=
s for handling large transmit buffers)
CONFLICT (content): Merge conflict in drivers/vhost/net.c
CONFLICT (content): Merge conflict in include/uapi/linux/vhost.h
Merging rpmsg/for-next (76970c009cef Merge branches 'rproc-next' and 'rpmsg=
-next' into for-next)
Merging gpio-brgl/gpio/for-next (5607f5ed3c5f gpio: sysfs: Fix an end of lo=
op test in gpiod_unexport())
CONFLICT (content): Merge conflict in MAINTAINERS
Merging gpio-intel/for-next (9ab29ed50555 gpiolib: acpi: Add a quirk for Ac=
er Nitro V15)
Merging pinctrl/for-next (0bbd90c2c6b2 pinctrl: ingenic: use pinmux_generic=
_add_pinfunction())
Merging pinctrl-intel/for-next (3b4408038da9 pinctrl: intel: fix build warn=
ings about export.h)
Merging pinctrl-renesas/renesas-pinctrl (7000167796a0 pinctrl: renesas: Sim=
plify PINCTRL_RZV2M logic)
Merging pinctrl-samsung/for-next (683d532dfc96 pinctrl: samsung: Fix gs101 =
irq chip)
Merging pwm/pwm/for-next (a582469541a3 pwm: img: Remove redundant pm_runtim=
e_mark_last_busy() calls)
Merging ktest/for-next (19272b37aa4f Linux 6.16-rc1)
Merging kselftest/next (07b7c2b4eca3 selftests: breakpoints: use suspend_st=
ats to reliably check suspend success)
Merging kunit/test (19272b37aa4f Linux 6.16-rc1)
Merging kunit-next/kunit (34db4fba8191 kunit: fix longest symbol length tes=
t)
Merging livepatching/for-next (a8e905a819fd Merge branch 'for-6.15/ftrace-t=
est' into for-next)
Merging rtc/rtc-next (0bafe291cb42 dt-bindings: rtc: nxp,lpc1788-rtc: add c=
ompatible string nxp,lpc1850-rtc)
Merging nvdimm/libnvdimm-for-next (9f97e61bde6a cxl: Include range.h in cxl=
.h)
Merging at24/at24/for-next (19272b37aa4f Linux 6.16-rc1)
Merging ntb/ntb-next (0cadf92e93d4 NTB/msi: Remove unused functions)
Merging seccomp/for-next/seccomp (a9b33aae79ce selftests: seccomp: Fix "per=
formace" to "performance")
Merging slimbus/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging nvmem/for-next (19272b37aa4f Linux 6.16-rc1)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (d9016a249be5 hv/hv_kvp_daemon: Prevent similar =
logs in kvp_key_add_or_modify())
Merging auxdisplay/for-next (19272b37aa4f Linux 6.16-rc1)
Merging kgdb/kgdb/for-next (afdbe49276ac kdb: Remove optional size argument=
s from strscpy() calls)
Merging hmm/hmm (19272b37aa4f Linux 6.16-rc1)
Merging cfi/cfi/next (19272b37aa4f Linux 6.16-rc1)
Merging mhi/mhi-next (00559ba3ae74 bus: mhi: host: pci_generic: Add Telit F=
N990B40 modem support)
Merging memblock/for-next (3b394dff15e1 memblock tests: add test for memblo=
ck_set_node)
Merging cxl/next (3a32c5b3bb7d Merge branch 'for-6.17/cxl-events-updates' i=
nto cxl-for-next)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (02eb7a8eee20 efi: add API doc entry for ovmf_debug_log)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (3cf3ee6a0be4 slab: Update MAINTAINERS entry)
CONFLICT (content): Merge conflict in fs/proc/page.c
Merging random/master (3778dcb2dcc1 random: use offstack cpumask when neces=
sary)
Merging landlock/next (9d0cf86b259a selftests/landlock: Add disconnected le=
afs and branch test suites)
Merging rust/rust-next (152359020378 rust: kernel: use `core::ffi::CStr` me=
thod names)
CONFLICT (content): Merge conflict in drivers/cpufreq/rcpufreq_dt.rs
CONFLICT (content): Merge conflict in rust/helpers/helpers.c
CONFLICT (content): Merge conflict in rust/kernel/device_id.rs
CONFLICT (content): Merge conflict in rust/kernel/devres.rs
CONFLICT (content): Merge conflict in rust/kernel/drm/gem/mod.rs
CONFLICT (content): Merge conflict in rust/kernel/pci.rs
CONFLICT (content): Merge conflict in rust/kernel/platform.rs
CONFLICT (content): Merge conflict in rust/kernel/sync/poll.rs
CONFLICT (content): Merge conflict in scripts/Makefile.build
Merging rust-alloc/alloc-next (d49ac7744f57 MAINTAINERS: add mm folks as re=
viewers to rust alloc)
Merging rust-io/io-next (86731a2a651e Linux 6.16-rc3)
Merging rust-pin-init/pin-init-next (fc3870dc5cad rust: pin-init: examples,=
 tests: use `ignore` instead of conditionally compiling tests)
Merging rust-timekeeping/timekeeping-next (d4b29ddf82a4 rust: time: Add wra=
pper for fsleep() function)
Applying: fix up for "rust: time: Make Instant generic over ClockSource"
Merging rust-xarray/xarray-next (fa616196fbea MAINTAINERS: add entry for Ru=
st XArray API)
Merging sysctl/sysctl-next (060a1b0567f7 docs: Downgrade arm64 & riscv from=
 titles to comment)
CONFLICT (content): Merge conflict in include/linux/module.h
CONFLICT (content): Merge conflict in kernel/panic.c
Merging execve/for-next/execve (7f71195c15dc fork: reorder function qualifi=
ers for copy_clone_args_from_user)
Merging bitmap/bitmap-for-next (f66f9c3d09c1 bitfield: Ensure the return va=
lues of helper functions are checked)
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (934f40b2b68b seq_buf: Introduce KUnit tests)
Merging nolibc/for-next (b9e50363178a selftests/nolibc: add x32 test config=
uration)
Merging iommufd/for-next (ab6bc44159d8 iommufd: Rename some shortterm-relat=
ed identifiers)
CONFLICT (content): Merge conflict in include/linux/iommu.h
Merging turbostat/next (447c98c1ca4a tools/power turbostat: Add idle govern=
or statistics reporting)
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.8
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.c
Merging pwrseq/pwrseq/for-next (07d59dec6795 power: sequencing: qcom-wcn: f=
ix bluetooth-wifi copypasta for WCN6855)
Merging capabilities-next/caps-next (cdd73b166607 uapi: fix broken link in =
linux/capability.h)
Merging ipe/next (324692100cc9 ipe: use SHA-256 library API instead of cryp=
to_shash API)
Merging kcsan/next (9d89551994a4 Linux 6.13-rc6)
Merging crc/crc-next (118da22eb6fb lib/crc: x86/crc32c: Enable VPCLMULQDQ o=
ptimization where beneficial)
CONFLICT (content): Merge conflict in lib/crc/s390/crc32.h
Merging fwctl/for-next (19272b37aa4f Linux 6.16-rc1)
Merging devsec-tsm/next (9d948b880409 Merge branch 'for-6.16/tsm-mr' into t=
sm-next)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)
Applying: sprintf.h requires stdarg.h

--Sig_/eV0SNbsSfJH+HKHt_y0WH=1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh97yYACgkQAVBC80lX
0GzVsQf8C6ISqfm1YLs/jFMo/EHZlbDXYQxw6osHTl7JiD5iRJ/jAnJOiVnX+ZRL
HliHUS8Wi3cUuAPxcfgklwHi5nuaMCPPu3tiZJ62OMQ45gc01JU2vAkv9FaIJnLM
xsYNohpXnpKvE4WmHnyhN3AjrKsuKAOBYcDJbYGP2kDBOcc6ug58+8TO5RdJlXOG
wpGzu7UfzKuXwx4ogZi8PkXAakXj/g3IPzcqKBIst/fzU5PwjXrawa82E+n+yEas
uSIkuX1DkrAdTgaKUwK6tZLi0qdzcFu8QD2+QuhjNou+DF9WpWcatPCPTyRY3KRE
uD89YgdJwvgJ2053sY39SPAEzX3PGA==
=8IzM
-----END PGP SIGNATURE-----

--Sig_/eV0SNbsSfJH+HKHt_y0WH=1--

