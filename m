Return-Path: <linux-next+bounces-8796-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A619EC2A0C6
	for <lists+linux-next@lfdr.de>; Mon, 03 Nov 2025 06:19:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D728188B022
	for <lists+linux-next@lfdr.de>; Mon,  3 Nov 2025 05:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 468D521D59C;
	Mon,  3 Nov 2025 05:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sc9yM4rq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA94D1E9919;
	Mon,  3 Nov 2025 05:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762147189; cv=none; b=hZppay3ngV/pDIn6efplajASxessCRLMG7iTemLbn7CdZFzje7LGZykYW1y47mI2y1V7+VWlYQceYktCndH2UwJ15eUa+bImr4jfX6YmavKF88HNH+poH1YfoBUR5nssN7fB+hxTk1gDoUKjKcCd3mGoP217YavcvB/4AZtfTx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762147189; c=relaxed/simple;
	bh=CXvwgyoGhdozm9VJuctL8jQIMpnsuvcrfgiS9Hnb+Nc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gStxyJKE4eUyuW7Z4oh8tbKBnZOux21ndN0Z7KZDXGTKFAjXWUrjo2hLH/l1T7R+WcsiYX8lW5CG05Y2QEQugZKFyy8BNfO9qQ1ZfOF5u/dtlxy1dTAyf0CkEWHHIpFlUDzaZok+M2qEol92tKpmqIqKgAVx45I08qeQx88ddYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sc9yM4rq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762147179;
	bh=4O9ub+zssadeIq9/m/luTmnUbT0JXol7aT1MjRocMjw=;
	h=Date:From:To:Cc:Subject:From;
	b=sc9yM4rqHBDCTBEduAEZRxtdTYPk9w7m/aaEXevj96eMUApifgJ9byrhoQBwGTJwL
	 qSq/udjRJANbYW34715Fg72FtHAGsd9EFrV3jCcms79EXj8h3PKePs2j33xtO15hOJ
	 EtkMs5A+XRMza4VZ37zxyVNYSGKaMehUbGRUCuV4ObgYhg8yz6PZ36A9OoMNhATvWC
	 KgtQTm/5w4T/841ZkSPvKdAqNwjBbYFb1EjPXXo4Zr8IPhf/RTfEk7XlolnKM5ZwU7
	 qH4+AO2vmd1enQQTA+qWV03yBqZ+46VbONBbW4+Mq5tqsgpx7qO2vo3o3+YxhWrqFf
	 5FdTXONei+HuA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d0Kdk6wGWz4w9w;
	Mon, 03 Nov 2025 16:19:38 +1100 (AEDT)
Date: Mon, 3 Nov 2025 16:19:37 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 3
Message-ID: <20251103161937.5e6d7d7e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sji+F=5gyve3QVKg.=M13EI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/sji+F=5gyve3QVKg.=M13EI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20251031:

The vfs-brauner tree lost its build failure.
The vfs-brauner tree gained a conflict against the btrfs tree.

The s390 tree gained a conflict against the mm-unstable tree.

The drm-misc tree gained build failures so I used the version from
next-20251031.

The drm-intel tree gained conflicts against the drm and drm-misc trees.

The tip tree lost its build failures.

The sysctl tree lost its build failure.

Non-merge commits (relative to Linus' tree): 5096
 5822 files changed, 221893 insertions(+), 69441 deletions(-)

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

I am currently merging 406 trees (counting Linus' and 405 trees of bug
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
Merging origin/master (6146a0f1dfae Linux 6.18-rc4)
Merging fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging ext4-fixes/fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging vfs-brauner-fixes/vfs.fixes (a20432b6571d virtio-fs: fix incorrect =
check for fsvq->kobj)
Merging fscrypt-current/for-current (211ddde0823f Linux 6.18-rc2)
Merging fsverity-current/for-current (211ddde0823f Linux 6.18-rc2)
Merging btrfs-fixes/next-fixes (1892dd18856e Merge branch 'misc-6.18' into =
next-fixes)
Merging vfs-fixes/fixes (00e782110428 nfs4_setup_readdir(): insufficient lo=
cking for ->d_parent->d_inode dereferencing)
Merging erofs-fixes/fixes (3bf692888f27 erofs: avoid infinite loop due to i=
ncomplete zstd-compressed data)
Merging nfsd-fixes/nfsd-fixes (3e7f011c2555 Revert "NFSD: Remove the cap on=
 number of operations per NFSv4 COMPOUND")
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (e8bd877fb76b ovl: fix possible double un=
link)
Merging fscrypt/for-next (211ddde0823f Linux 6.18-rc2)
Merging btrfs/for-next (8b39dcc552df Merge branch 'for-next-next-v6.18-2025=
1030' into for-next-20251030)
Merging ceph/master (d74d6c0e9895 ceph: add bug tracking system info to MAI=
NTAINERS)
Merging cifs/for-next (c24059424a07 smb: client: show smb lease key in open=
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
Merging ext4/dev (c065b6046b34 Use CONFIG_EXT4_FS instead of CONFIG_EXT3_FS=
 in all of the defconfigs)
Merging f2fs/dev (e4384545e220 f2fs: use folio_nr_pages() instead of shift =
operation)
Merging fsverity/for-next (211ddde0823f Linux 6.18-rc2)
Merging fuse/for-next (cb403594701c fuse: move CREATE_TRACE_POINTS to a sep=
arate file)
Merging gfs2/for-next (9f336dedd209 Revert "gfs2: Add GL_NOBLOCK flag")
Merging jfs/jfs-next (cafc6679824a jfs: replace hardcoded magic number with=
 DTPAGEMAXSLOT constant)
Merging ksmbd/ksmbd-for-next (e53642b87a4f Merge tag 'v6.18-rc3-smb-server-=
fixes' of git://git.samba.org/ksmbd)
Merging nfs/linux-next (dcb6fa37fd7b Linux 6.18-rc3)
Merging nfs-anna/linux-next (9bb3baa9d160 NFS4: Fix state renewals missing =
after boot)
Merging nfsd/nfsd-next (493b808398e4 nfsd: delete unreachable confusing cod=
e in nfs4_open_delegation())
Merging ntfs3/master (58bcc175c4c4 ntfs3: avoid memcpy size warning)
Merging orangefs/for-next (11f6bce77e27 fs/orangefs: Replace kzalloc + copy=
_from_user with memdup_user_nul)
Merging overlayfs/overlayfs-next (ad1423922781 ovl: make sure that ovl_crea=
te_real() returns a hashed dentry)
Merging ubifs/next (99dbb2a1bd66 ubifs: stop using write_cache_pages)
Merging v9fs/9p-next (a7ebee82ce9c fs/9p: delete unnnecessary condition)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (0db22d7ee462 xfs: document another racy GC case in xf=
s_zoned_map_extent)
Merging zonefs/for-next (a42938e80357 zonefs: correct some spelling mistake=
s)
Merging vfs-brauner/vfs.all (08479c4ebca2 Merge branch 'kernel-6.19.cred' i=
nto vfs.all)
CONFLICT (content): Merge conflict in fs/btrfs/file.c
Merging vfs/for-next (15f5e46385aa Merge branches 'work.fs_context', 'work.=
f_path', 'work.qstr', 'work.misc', 'work.nfsctl' and 'work.finish_no_open' =
into for-next)
Merging mm-hotfixes/mm-hotfixes-unstable (968964975445 mm/secretmem: fix us=
e-after-free race in fault handler)
Merging fs-current (a0aef97bd387 Merge branch 'fixes' of https://git.kernel=
.org/pub/scm/linux/kernel/git/xiang/erofs.git)
Merging kbuild-current/kbuild-fixes (43c2931a95e6 kconfig/nconf: Initialize=
 the default locale at startup)
Merging arc-current/for-curr (d7b8f8e20813 Linux 6.16-rc5)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (b98c94eed4a9 arm64: mte: Do not warn if=
 the page is already tagged in copy_highpage())
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
Merging net/main (d7d2fcf7ae31 netconsole: Acquire su_mutex before navigati=
ng configs hierarchy)
Merging bpf/master (ba36dd5ee6fd Merge tag 'bpf-fixes' of git://git.kernel.=
org/pub/scm/linux/kernel/git/bpf/bpf)
Merging ipsec/master (59630e2ccd72 xfrm: Prevent locally generated packets =
from direct output in tunnel mode)
Merging netfilter/main (6a2108c78069 net: devmem: refresh devmem TX dst in =
case of route invalidation)
Merging ipvs/main (e6cc7ac0d420 Merge branch 'eth-fbnic-fix-xdp_tx-and-xdp-=
vs-qstats')
Merging wireless/for-next (70e833548596 wifi: zd1211rw: fix potential memor=
y leak in __zd_usb_enable_rx())
Merging ath/for-current (9222582ec524 Revert "wifi: ath12k: Fix missing sta=
tion power save configuration")
Merging iwlwifi/fixes (3802f25a6b5d wifi: iwlwifi: fix aux ROC time event i=
terator usage)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (b8126205dbe0 MAINTAINERS: Update irdma maintaine=
rs)
Merging sound-current/for-linus (390db60f8e2b Merge tag 'asoc-fix-v6.18-rc2=
' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for=
-linus)
Merging sound-asoc-fixes/for-linus (5e5c8aa73d99 ASoC: dt-bindings: pm4125-=
sdw: correct number of soundwire ports)
Merging regmap-fixes/for-linus (48cbf50531d8 regmap: irq: Correct documenta=
tion of wake_invert flag)
Merging regulator-fixes/for-linus (47a0925ee4bd regulator: bd718x7: Fix vol=
tages scaled by resistor divider)
Merging spi-fixes/for-linus (e7dbfe6f15b4 spi: intel: Add support for Oak S=
tream SPI serial flash)
Merging pci-current/for-linus (3a8660878839 Linux 6.18-rc1)
Merging driver-core.current/driver-core-linus (dcb6fa37fd7b Linux 6.18-rc3)
Merging tty.current/tty-linus (eb4917f557d4 serial: amba-pl011: prefer dma_=
mapping_error() over explicit address checking)
Merging usb.current/usb-linus (ad8415a85703 Merge tag 'thunderbolt-for-v6.1=
8-rc4' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunde=
rbolt into usb-linus)
Merging usb-serial-fixes/usb-linus (2d8ab771d531 USB: serial: ftdi_sio: add=
 support for u-blox EVK-M101)
Merging phy/fixes (3a8660878839 Linux 6.18-rc1)
Merging staging.current/staging-linus (dcb6fa37fd7b Linux 6.18-rc3)
Merging iio-fixes/fixes-togreg (22e625565c17 iio: adc: at91-sama5d2_adc: Fi=
x potential use-after-free in sama5d2_adc driver)
Merging counter-current/counter-current (109ff654934a counter: microchip-tc=
b-capture: Allow shared IRQ for multi-channel TCBs)
Merging char-misc.current/char-misc-linus (76992675d7bc Merge tag 'counter-=
fixes-for-6.18' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/wbg/c=
ounter into char-misc-next)
Merging soundwire-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging thunderbolt-fixes/fixes (3575254546a2 thunderbolt: Add support for =
Intel Wildcat Lake)
Merging input-current/for-linus (69aeb5073123 Input: pegasus-notetaker - fi=
x potential out-of-bounds access)
Merging crypto-current/master (3c9bf72cc1ce crypto: aspeed - fix double fre=
e caused by devm)
Merging libcrypto-fixes/libcrypto-fixes (1af424b15401 lib/crypto: poly1305:=
 Restore dependency of arch code on !KMSAN)
Merging vfio-fixes/for-linus (de8d1f2fd5a5 vfio: selftests: add end of addr=
ess space DMA map/unmap tests)
Merging kselftest-fixes/fixes (920aa3a7705a selftests: cachestat: Fix warni=
ng on declaration under label)
Merging dmaengine-fixes/fixes (81935b90b6fc dmaengine: xilinx: xdma: Fix re=
gmap max_register)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (5c56bf214af8 mtd: rawnand: cadence: fix DMA de=
vice NULL pointer dereference)
Merging mfd-fixes/for-mfd-fixes (91a3e1f5453a mfd: ls2kbmc: Check for devm_=
mfd_add_devices() failure)
Merging v4l-dvb-fixes/fixes (27afd6e066cf media: videobuf2: forbid remove_b=
ufs when legacy fileio is active)
Merging reset-fixes/reset/fixes (9a52827a9bbb reset: eyeq: fix OF node leak)
Merging mips-fixes/mips-fixes (3a8660878839 Linux 6.18-rc1)
Merging at91-fixes/at91-fixes (3a8660878839 Linux 6.18-rc1)
Merging omap-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging kvm-fixes/master (4361f5aa8bfc Merge tag 'kvm-x86-fixes-6.18-rc2' o=
f https://github.com/kvm-x86/linux into HEAD)
Merging kvms390-fixes/master (5f9df945d4e8 KVM: s390: Fix FOLL_*/FAULT_FLAG=
_* confusion)
Merging hwmon-fixes/hwmon (8746b9ce4180 hwmon: (gpd-fan) initialize EC on d=
river load for Win 4)
Merging nvdimm-fixes/libnvdimm-fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging cxl-fixes/fixes (7c3643f204ed acpi,srat: Fix incorrect device handl=
e check for Generic Initiator)
Merging dma-mapping-fixes/dma-mapping-fixes (23ee8a2563a0 dma-mapping: benc=
hmark: Restore padding to ensure uABI remained consistent)
Merging drivers-x86-fixes/fixes (bd34bf518a5f platform: x86: Kconfig: fix m=
inor typo in help for WIRELESS_HOTKEY)
Merging samsung-krzk-fixes/fixes (0dac0b74c32a MAINTAINERS: Update Krzyszto=
f Kozlowski's email)
Merging pinctrl-samsung-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging devicetree-fixes/dt/linus (7209ff310083 of/irq: Export of_msi_xlate=
() for module usage)
Merging dt-krzk-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging scsi-fixes/fixes (a2b32bc1d9e3 scsi: ufs: core: Fix invalid probe e=
rror return value)
Merging drm-fixes/drm-fixes (41dacb39fe79 Merge tag 'drm-xe-fixes-2025-10-3=
0' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (dc8aa0cb87a7 drm/i915/dmc: Cl=
ear HRR EVT_CTL/HTP to zero on ADL-S)
Merging mmc-fixes/fixes (a28352cf2d2f mmc: sdhci-of-dwcmshc: Change DLL_STR=
BIN_TAPNUM_DEFAULT to 0x4)
Merging rtc-fixes/rtc-fixes (0d510778c2f4 Revert "rtc: cpcap: Fix initial e=
nable_irq/disable_irq balance")
Merging gnss-fixes/gnss-linus (dcb6fa37fd7b Linux 6.18-rc3)
Merging hyperv-fixes/hyperv-fixes (852bfe55e211 mshv: Fix deposit memory in=
 MSHV_ROOT_HVCALL)
Merging risc-v-fixes/fixes (2e448567839c cpuidle: riscv-sbi: Replace deprec=
ated strcpy in sbi_cpuidle_init_cpu)
Merging riscv-dt-fixes/riscv-dt-fixes (5ef13c363640 riscv: dts: microchip: =
remove BeagleV Fire fabric.dtsi)
Merging riscv-soc-fixes/riscv-soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging spdx/spdx-linus (89373f5695dc LICENSES: Add modern form of the LGPL=
-2.1 tags to the usage guide section)
Merging gpio-brgl-fixes/gpio/for-current (dcb6fa37fd7b Linux 6.18-rc3)
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
Merging perf-current/perf-tools (ccaba800e78f tools headers x86 cpufeatures=
: Sync with the kernel sources)
Merging efi-fixes/urgent (e5f0a698b34e Linux 6.17)
Merging battery-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging iommufd-fixes/for-rc (b09ed52db1e6 iommufd/selftest: Fix ioctl retu=
rn value in _test_cmd_trigger_vevents())
Merging rust-fixes/rust-fixes (09b1704f5b02 rust: condvar: fix broken intra=
-doc link)
Merging w1-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging pmdomain-fixes/fixes (7458f72cc28f pmdomain: arm: scmi: Fix genpd l=
eak on provider registration failure)
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
Merging trace-fixes/trace/fixes (54b91e54b113 tracing: Stop fortify-string =
from warning in tracing_mark_raw_write())
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (3a8660878839 Linux 6.18-rc1)
Merging tip-fixes/tip/urgent (691d401c7e0e Merge tag 'spi-fix-v6.18-rc3' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging slab-fixes/slab/for-next-fixes (7f434e1d9a17 slab: Fix obj_ext mist=
akenly considered NULL due to race condition)
Merging drm-msm-fixes/msm-fixes (f5d079564c44 drm/msm/dpu: Fix adjusted mod=
e clock check for 3d merge)
Merging uml-fixes/fixes (df447a3b4a4b um: Fix FD copy size in os_rcv_fd_msg=
())
Merging fwctl-fixes/for-rc (211ddde0823f Linux 6.18-rc2)
Merging devsec-tsm-fixes/fixes (fba4ceaa242d configfs-tsm-report: Fix NULL =
dereference of tsm_ops)
Merging drm-rust-fixes/drm-rust-fixes (211ddde0823f Linux 6.18-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (41dacb39fe79 Merge tag 'drm-xe=
-fixes-2025-10-30' of https://gitlab.freedesktop.org/drm/xe/kernel into drm=
-fixes)
Merging mm-stable/mm-stable (dcb6fa37fd7b Linux 6.18-rc3)
Merging mm-nonmm-stable/mm-nonmm-stable (dcb6fa37fd7b Linux 6.18-rc3)
Merging mm-unstable/mm-unstable (9ef7b0341163 mm: change type of parameter =
for memory_notify)
Merging mm-nonmm-unstable/mm-nonmm-unstable (97751db460a7 ceph: replace loc=
al base64 helpers with lib/base64)
Merging kbuild/kbuild-next (934cd53e1669 Merge branch 'kbuild-ms-extensions=
' into kbuild-next)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (352864787458 perf test workload: Add thread c=
ount argument to thloop)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (131971f67e25 dma-mapping: remove =
unused map_page callback)
Merging asm-generic/master (edcc8a38b5ac once: fix race by moving DO_ONCE t=
o separate section)
Merging alpha/alpha-next (1523226edda5 alpha: Use str_yes_no() helper in pc=
i_dac_dma_supported())
Merging arm/for-next (eca2ec8c85ae Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (3a8660878839 Linux 6.18-rc1)
Merging arm-perf/for-next/perf (2084660ad288 perf/dwc_pcie: Fix use of unin=
itialized variable)
Merging arm-soc/for-next (b8e5a95fb5f5 Merge branch 'arm/fixes' into for-ne=
xt)
Merging amlogic/for-next (cb718411c4c0 Merge branch 'v6.19/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (5d21b7ca05c8 Merge branch 'apple-soc/=
drivers-6.19' into asahi-soc/for-next)
Merging at91/at91-next (3a8660878839 Linux 6.18-rc1)
Merging bmc/for-next (39f0ed9219df Merge branches 'aspeed/arm/dt' and 'aspe=
ed/fixes' into for-next)
Merging broadcom/next (a72033e3bdc8 Merge branch 'devicetree-arm64/next' in=
to next)
Merging cix/for-next (011004af5d12 Merge remote-tracking branch 'cix/dt' in=
to for-next)
Merging davinci/davinci/for-next (3a8660878839 Linux 6.18-rc1)
Merging drivers-memory/for-next (de956297e420 Merge branch 'mem-ctrl-next' =
into for-next)
Merging fsl/soc_fsl (5498f07842cb soc/fsl/qbman: Use for_each_online_cpu() =
instead of for_each_cpu())
Merging imx-mxs/for-next (8b5f72630660 Merge branch 'imx/dt64' into for-nex=
t)
Merging mediatek/for-next (860a0efbb95d Merge branch 'v6.18-next/soc' into =
for-next)
Merging mvebu/for-next (86a99e9f5394 Merge branch 'mvebu/fixes' into mvebu/=
for-next)
Merging omap/for-next (462bfcbe8834 Merge branch 'omap-for-v6.18/soc' into =
tmp/omap-next-20250915.162436)
Merging qcom/for-next (bfc13ed9cce5 Merge branches 'arm32-for-6.19', 'arm64=
-defconfig-for-6.19', 'arm64-for-6.19', 'clk-for-6.19' and 'drivers-for-6.1=
9' into for-next)
Merging renesas/next (afade6fa8f17 Merge branch 'renesas-dts-for-v6.19' int=
o renesas-next)
Merging reset/reset/next (f5da5084e282 reset: th1520: Support reset control=
lers in more subsystems)
Merging rockchip/for-next (3c0431ad3284 Merge branch 'v6.19-armsoc/dts32' i=
nto for-next)
Merging samsung-krzk/for-next (73f7017e6636 Merge branch 'fixes' into for-n=
ext)
Merging scmi/for-linux-next (e5db90f4c044 Merge branch 'for-next/ffa/update=
s' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux=
 into for-linux-next)
Merging sophgo/for-next (8eff9c7a129e Merge branch 'dt/riscv' into for-next)
Merging sophgo-soc/soc-for-next (c8754c7deab4 soc: sophgo: cv1800: rtcsys: =
New driver (handling RTC only))
Merging spacemit/for-next (981339507835 riscv: dts: spacemit: add Ethernet =
and PDMA to OrangePi RV2)
Merging stm32/stm32-next (53c18dc078bb arm64: dts: st: fix memory region si=
ze on stm32mp235f-dk)
Merging sunxi/sunxi/for-next (28493fd26fd6 Merge branches 'sunxi/dt-for-6.1=
9' and 'sunxi/drivers-for-6.19' into sunxi/for-next)
Merging tee/next (e2c2e95934ea Merge branch 'tee_qcomtee_fixes_for_v6.18' i=
nto next)
Merging tegra/for-next (02f9977e97fa Merge branch for-6.19/arm64/dt into fo=
r-next)
Merging thead-dt/thead-dt-for-next (d8a174babf64 riscv: dts: thead: Add res=
et controllers of more subsystems for TH1520)
Merging ti/ti-next (da84d094ded6 arm64: dts: ti: k3-am62d2-evm: Remove unus=
ed ospi0 chip select pins)
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
Merging loongarch/loongarch-next (032676ff8217 LoongArch: Update Loongson-3=
 default config file)
Merging m68k/for-next (695f2c0c25f3 m68k: defconfig: Update defconfigs for =
v6.17-rc1)
Merging m68knommu/for-next (dcb6fa37fd7b Linux 6.18-rc3)
Merging microblaze/next (7f7072574127 Merge tag 'kbuild-6.18-1' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/kbuild/linux)
Merging mips/mips-next (3a8660878839 Linux 6.18-rc1)
Merging openrisc/for-next (8c30b0018f9d openrisc: Add jump label support)
Merging parisc-hd/for-next (1aa4524c0c1b parisc: entry.S: fix space adjustm=
ent on interruption for 64-bit userspace)
Merging powerpc/next (ef104054a312 powerpc/pseries: Define __u{8,32} types =
in papr_hvpipe_hdr struct)
Merging risc-v/for-next (3a8660878839 Linux 6.18-rc1)
Merging riscv-dt/riscv-dt-for-next (fa939a287224 dts: starfive: jh7110-comm=
on: split out mmc0 reset pins from common into boards)
Merging riscv-soc/riscv-soc-for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging s390/for-next (c23f812adcb9 Merge branch 'features' into for-next)
CONFLICT (content): Merge conflict in include/linux/memory.h
Merging sh/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging sparc/for-next (fe0126702a40 sparc: Replace deprecated strcpy() wit=
h strscpy() in handle_nextprop_quirks())
Merging uml/next (8e03c195cc4d um: Avoid circular dependency on asm-offsets=
 in pgtable.h)
Merging xtensa/xtensa-for-next (4c8bad3ed035 xtensa: use HZ_PER_MHZ in plat=
form_calibrate_ccount)
Merging fs-next (a1e94de7fbd5 Merge branch 'for-next' of https://git.kernel=
.org/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (fc2339f0cf6a Merge branch 'rework/atomic-flush-har=
dlockup' into for-next)
Merging pci/next (7efa17553b66 Merge branch 'pci/controller/sg2042')
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_vram.c
Merging pstore/for-next/pstore (b69255357368 pstore/ram: Update module para=
meters from platform data)
Merging hid/for-next (be0be4b1da64 Merge branch 'for-6.19/nintendo' into fo=
r-next)
Merging i2c/i2c/for-next (211ddde0823f Linux 6.18-rc2)
Merging i2c-host/i2c/i2c-host (eeaaf5bc1c5b dt-bindings: i2c: qcom-cci: Doc=
ument Kaanapali compatible)
Merging i3c/i3c/next (3a36273e5a07 i3c: master: svc: Prevent incomplete IBI=
 transaction)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (68c2a8b59d23 hwmon: (sy7636a) Fix sensor =
description)
Merging jc_docs/docs-next (e5e7ca66a7fc docs: kdoc: fix duplicate section w=
arning message)
Merging v4l-dvb/next (163917839c0e MAINTAINERS: Update Daniel Scally's emai=
l address)
Merging v4l-dvb-next/master (adc218676eef Linux 6.12)
Merging pm/linux-next (eda819ce75b9 Merge branches 'pm-runtime' and 'pm-cpu=
freq' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (1971b18785d1 cpufreq: CPPC: Don=
't warn if FIE init fails to read counters)
Merging cpupower/cpupower (3a8660878839 Linux 6.18-rc1)
Merging devfreq/devfreq-next (eddb5ba91b28 PM / devfreq: rockchip-dfi: add =
support for LPDDR5)
Merging pmdomain/next (1ff1f0db6aec pmdomain: mediatek: Add support for MFl=
exGraphics)
Merging opp/opp/linux-next (33ffb0aa8ce8 rust: opp: simplify callers of `to=
_c_str_array`)
Merging thermal/thermal/linux-next (dc67521c20b7 thermal/drivers/renesas/rz=
g3e: Fix add thermal driver for the Renesas RZ/G3E SoC)
Merging rdma/for-next (503a5e4690ae RDMA/rxe: Fix null deref on srq->rq.que=
ue after resize failure)
Merging net-next/main (01cc760632b8 Documentation: ARCnet: Update obsolete =
contact info)
Merging bpf-next/for-next (65ada09f577a Merge branch 'bpf-next/net' into fo=
r-next)
Merging ipsec-next/master (6b3b6e59c4f8 pfkey: Deprecate pfkey)
Merging mlx5-next/mlx5-next (eea31f21dce1 {rdma,net}/mlx5: Query vports mac=
 address from device)
Merging netfilter-next/main (0d0eb186421d cxgb4: flower: add support for fr=
agmentation)
Merging ipvs-next/main (18a7e218cfcd Merge tag 'net-6.18-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging bluetooth/master (e1e9d861e2f9 Bluetooth: MGMT: Fix OOB access in p=
arse_adv_monitor_pattern())
  4a3855790fba ("Bluetooth: btrtl: Fix memory leak in rtlbt_parse_firmware_=
v2()")
  e1e9d861e2f9 ("Bluetooth: MGMT: Fix OOB access in parse_adv_monitor_patte=
rn()")
  ff01c4cfe21f ("Bluetooth: hci_event: validate skb length for unknown CC o=
pcode")
Merging wireless-next/for-next (508dfc1f2ccd wifi: mac80211: Allow HT Actio=
n frame processing on 6 GHz when HE is supported)
Merging ath-next/for-next (059ca8fd692b wifi: ath10k: use =3D {} to initial=
ize bmi_target_info instead of memset)
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/mac.c
Merging iwlwifi-next/next (3df28496673b wifi: iwlwifi: mld: add null check =
for kzalloc() in iwl_mld_send_proto_offload())
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (3e9c49d4c306 mtd: intel-dg: wake card on operations)
Merging nand/nand/next (88fd4e4deae8 mtd: rawnand: sunxi: Add support for H=
616 nand controller)
Merging spi-nor/spi-nor/next (17926cd770ec mtd: spi-nor: core: avoid odd le=
ngth/address writes in 8D-8D-8D mode)
Merging crypto/master (d5b59ec33c5b crypto: qat - use simple_strtoull to im=
prove qat_uclo_parse_num)
Merging libcrypto/libcrypto-next (5a2a5e62a521 Merge remote-tracking branch=
 'ebiggers/libcrypto-tests' into libcrypto-next)
Merging drm/drm-next (f67d54e96bc9 Merge tag 'amd-drm-next-6.19-2025-10-29'=
 of https://gitlab.freedesktop.org/agd5f/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/inc/hw=
/hw_shared.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_gt.c
Merging drm-exynos/for-linux-next (3a8660878839 Linux 6.18-rc1)
Merging drm-misc/for-linux-next (8cde1c9b1972 drm/tidss: Set vblank (event)=
 time at crtc_atomic_enable)
$ git reset --hard HEAD^
Merging next-20251031 version of drm-misc
$ git am -3 ../patches/0001-fix-up-for-dropping-drm_print.h-includes.patch
Applying: fix up for dropping drm_print.h includes
[master a0a67ada50bd] next-20251031/drm-misc
Merging amdgpu/drm-next (1bc9d39275e0 drm/radeon: Remove redundant pm_runti=
me_mark_last_busy() calls)
Merging drm-intel/for-linux-next (ad7108f966fe drm/i915/ltphy: Modify the s=
tep that need to be skipped)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dm=
c.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_fb=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_pci.c
Merging drm-msm/msm-next (f5d079564c44 drm/msm/dpu: Fix adjusted mode clock=
 check for 3d merge)
Merging drm-msm-lumag/msm-next-lumag (a643abb67379 drm/msm/mdp4: remove the=
 use of dev_err_probe())
Merging drm-rust/drm-rust-next (9a3c2f8a4f84 gpu: nova-core: replace `as` w=
ith `from` conversions where possible)
Merging drm-nova/nova-next (93296e9d9528 gpu: nova-core: vbios: store refer=
ence to Device where relevant)
Merging drm-xe/drm-xe-next (6b514ed2d9a7 drm/xe/pf: Add documentation for s=
riov_admin attributes)
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (9c5ce8007887 fbdev: vesafb: Use dev_* fn's instead =
printk)
Merging regmap/for-next (fc9cda149ea0 Merge remote-tracking branch 'regmap/=
for-6.19' into regmap-next)
Merging sound/for-next (4e5a0a0ae83f ALSA: line6: add support for POD HD Pr=
o X)
Merging ieee1394/for-next (b330f98ff238 firewire: core: use cleanup functio=
n to release cached configuration ROM)
Merging sound-asoc/for-next (b2cb3cd68042 Merge remote-tracking branch 'aso=
c/for-6.19' into asoc-next)
Merging modules/modules-next (dcb6fa37fd7b Linux 6.18-rc3)
Merging input/next (e8ec34ed4616 dt-bindings: input: ti,twl4030-keypad: con=
vert to DT schema)
Merging block/for-next (ba6a8208cc20 Merge branch 'block-6.18' into for-nex=
t)
Merging device-mapper/for-next (c35cf4fe4b85 dm-bufio: align write boundary=
 on bdev_logical_block_size)
Merging libata/for-next (095d495cb897 dt-bindings: ata: snps,dwc-ahci: Allo=
w 'iommus' property)
Merging pcmcia/pcmcia-next (4a81f78caa53 pcmcia: Add error handling for add=
_interval() in do_validate_mem())
Merging mmc/next (c2afdd73e5ba mmc: core: Skip to set the default 200mA SD =
current limit)
Merging mfd/for-mfd-next (f17f1b16e905 dt-bindings: mfd: dlg,da9063: Allow =
wakeup-source property)
Merging backlight/for-backlight-next (243ce64b2b37 backlight: Do not includ=
e <linux/fb.h> in header file)
Merging battery/for-next (3a8660878839 Linux 6.18-rc1)
Merging regulator/for-next (b382f3687ded Merge remote-tracking branch 'regu=
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
Merging iommu/next (8f650600a37e Merge branches 'mediatek', 'nvidia/tegra' =
and 'core' into next)
Merging audit/next (4f7b54e17edd audit: fix comment misindentation in audit=
.h)
Merging devicetree/for-next (3b1728b74a52 of: overlay: Avoid spurious error=
 messages in of_overlay_remove())
Merging dt-krzk/for-next (7ee0f223cabe arm64: dts: toshiba: tmpv7708: Add d=
efault GIC address cells)
Merging mailbox/for-next (3f39f5652037 mailbox: mtk-cmdq: Remove pm_runtime=
 APIs from cmdq_mbox_send_data())
Merging spi/for-next (4fffc9c8c2e8 Merge remote-tracking branch 'spi/for-6.=
19' into spi-next)
Merging tip/master (3eaa2454f570 Merge branch into tip/master: 'timers/vdso=
')
Merging clockevents/timers/drivers/next (45d78cd0bf2c dt-bindings: timer: e=
xynos4210-mct: Add compatible for ARTPEC-9 SoC)
Merging edac/edac-for-next (be8145e8a77d Merge ras/edac-amd-atl into for-ne=
xt)
Merging ftrace/for-next (0eb16ea34a71 Merge unused-tracepoints/for-next)
Merging rcu/next (1d289fc5691c Merge branch 'torture.2025.08.14a' into HEAD)
Merging paulmck/non-rcu/next (b706eec9304f Merge branches 'lkmm.2025.07.09a=
', 'ratelimit.2025.06.24a' and 'stop-machine.2025.07.17a' into HEAD)
Merging kvm/next (6b36119b94d0 KVM: x86: Export KVM-internal symbols for su=
b-modules only)
Merging kvm-arm/next (dcb6fa37fd7b Linux 6.18-rc3)
Merging kvms390/next (182a258b5ec4 Documentation: kvm: Fix ordering)
Merging kvm-ppc/topic/ppc-kvm (c17b750b3ad9 Linux 6.17-rc2)
Merging kvm-riscv/riscv_kvm_next (8c5fa3764fac RISC-V: KVM: Remove automati=
c I/O mapping for VM_PFNMAP)
Merging kvm-x86/next (4cc167c50eb1 Merge branches 'generic', 'gmem', 'mmu',=
 'selftests', 'svm' and 'vmx')
CONFLICT (content): Merge conflict in arch/x86/include/asm/cpufeatures.h
Merging xen-tip/linux-next (9d52b0b41be5 xen: take system_transition_mutex =
on suspend)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (8b8cfc05ada8 Merge branch 'for-6.18' into for-=
next)
Merging sched-ext/for-next (28bc243f3ffe Merge branch 'for-6.19' into for-n=
ext)
CONFLICT (content): Merge conflict in kernel/sched/ext.c
Merging drivers-x86/for-next (1c72d9c3e0c6 platform/x86:intel/pmc: Remove r=
edundant has_die_c6 variable)
Merging chrome-platform/for-next (c862381bd03a platform/chrome: cros_ec_lig=
htbar: Check if ec supports suspend commands)
Merging chrome-platform-firmware/for-firmware-next (3a8660878839 Linux 6.18=
-rc1)
Merging hsi/for-next (3a8660878839 Linux 6.18-rc1)
Merging leds-lj/for-leds-next (c06a01743911 leds: upboard: Fix module alias)
Merging ipmi/for-next (35bcedc1a793 MAINTAINERS: Add entry on Loongson-2K I=
PMI driver)
Merging driver-core/driver-core-next (b0b7301b0043 samples: rust: auxiliary=
: illustrate driver interaction)
Merging usb/usb-next (18514fd70ea4 usb: typec: ucsi: Add support for orient=
ation)
Merging thunderbolt/next (56bcf64b6131 thunderbolt: Fix typo in tb_eeprom_c=
tl_read documentation)
Merging usb-serial/usb-next (53002803832b USB: serial: kobil_sct: drop unne=
cessary initialisations)
Merging tty/tty-next (719f3df3e113 serial: sh-sci: Merge sh-sci.h into sh-s=
ci.c)
Merging char-misc/char-misc-next (c428900703aa Merge 6.18-rc3 into char-mis=
c-next)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (dcb6fa37fd7b Linux 6.18-rc3)
Merging fastrpc/for-next (3a8660878839 Linux 6.18-rc1)
Merging fpga/for-next (e0650a9b38b8 MAINTAINERS: change maintainer for Inte=
l MAX10 BMC secure updates)
Merging icc/icc-next (41aa8dd5b19c Merge branch 'icc-kaanapali' into icc-ne=
xt)
Merging iio/togreg (59420a56a457 iio: adc: ad7124: fix possible OOB array a=
ccess)
Merging phy-next/next (3a8660878839 Linux 6.18-rc1)
Merging soundwire/next (3a8660878839 Linux 6.18-rc1)
Merging extcon/extcon-next (94d885eb8ffe dt-bindings: extcon: linux,extcon-=
usb-gpio: GPIO must be provided)
Merging gnss/gnss-next (dcb6fa37fd7b Linux 6.18-rc3)
Merging vfio/next (451bb9632898 vfio: Dump migration features under debugfs)
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
Merging cgroup/for-next (adbe49dc7eb3 Merge branch 'for-6.19' into for-next)
Merging scsi/for-next (558e705e922a Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (525a411f9a5f scsi: ufs: dt-bindings: qcom: Drop =
redundant "reg" constraints)
Merging vhost/linux-next (c6f3b304eb54 virtio_vdpa: fix misleading return i=
n void function)
Merging rpmsg/for-next (5f4d69f0ef4f Merge branches 'rpmsg-next' and 'rproc=
-next' into for-next)
Merging gpio-brgl/gpio/for-next (bac88be0d2a8 gpio: mm-lantiq: update kerne=
l docs)
Merging gpio-intel/for-next (3a8660878839 Linux 6.18-rc1)
Merging pinctrl/for-next (2aea4b47e7a5 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (3a8660878839 Linux 6.18-rc1)
Merging pinctrl-renesas/renesas-pinctrl (a5fad3aeff41 pinctrl: renesas: rzg=
2l: Remove useless wrappers)
Merging pinctrl-samsung/for-next (3cfc60e09bdc pinctrl: samsung: Add ARTPEC=
-9 SoC specific configuration)
Merging pwm/pwm/for-next (0c3a76eb000f pwm: th1520: Use module_pwm_platform=
_driver! macro)
Applying: fix up for "pwm: Add Rust driver for T-HEAD TH1520 SoC"
Merging ktest/for-next (a5e71638ddd7 ktest.pl: Add new PATCHCHECK_SKIP opti=
on to skip testing individual commits)
Merging kselftest/next (3a8660878839 Linux 6.18-rc1)
Merging kunit/test (3a8660878839 Linux 6.18-rc1)
Merging kunit-next/kunit (9de5f847ef8f Documentation: kunit: add descriptio=
n of kunit.enable parameter)
Merging livepatching/for-next (5cb5575308bc selftests: livepatch: use canon=
ical ftrace path)
Merging rtc/rtc-next (384150d7a5b6 rtc: amlogic-a4: fix double free caused =
by devm)
Merging nvdimm/libnvdimm-for-next (5c34f2b6f89a nvdimm: Remove duplicate li=
nux/slab.h header)
Merging at24/at24/for-next (aef72ebe9c86 dt-bindings: eeprom: at24: Add com=
patible for Belling BL24S64)
Merging ntb/ntb-next (68113d260674 NTB/msi: Remove unused functions)
Merging seccomp/for-next/seccomp (b0c9bfbab925 selftests/seccomp: Add a tes=
t for the WAIT_KILLABLE_RECV fast reply race)
Merging slimbus/for-next (4bb909aa44ed dt-bindings: slimbus: fix warning fr=
om example)
Merging nvmem/for-next (3a8660878839 Linux 6.18-rc1)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (31a365f1ea6b Drivers: hv: Resolve ambiguity in =
hypervisor version log)
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
Merging cxl/next (211ddde0823f Linux 6.18-rc2)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (99da5bf3dd6a efi/x86: Memory protection on EfiGcdMemoryTy=
peMoreReliable)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (8ad018dbd344 slab: use new API for remaining co=
mmand line parameters)
Merging random/master (933ecf591275 random: remove unused get_random_var_wa=
it functions)
Merging landlock/next (6dde339a3df8 landlock: Minor comments improvements)
Merging rust/rust-next (3b83f5d5e78a rust: replace `CStr` with `core::ffi::=
CStr`)
CONFLICT (content): Merge conflict in rust/kernel/opp.rs
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
Merging bitmap/bitmap-for-next (7e85ac9da1ac PM / devfreq: rockchip-dfi: sw=
itch to FIELD_PREP_WM16 macro)
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (c57f5fee54df libeth: xdp: Disable generic kCFI =
pass for libeth_xdp_tx_xmit_bulk())
Merging nolibc/for-next (7534b9bfe691 tools/nolibc: clean up outdated comme=
nts in generic arch.h)
Merging iommufd/for-next (211ddde0823f Linux 6.18-rc2)
Merging turbostat/next (447c98c1ca4a tools/power turbostat: Add idle govern=
or statistics reporting)
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.8
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.c
Merging pwrseq/pwrseq/for-next (3a8660878839 Linux 6.18-rc1)
Merging capabilities-next/caps-next (211ddde0823f Linux 6.18-rc2)
Merging ipe/next (c88788fe31a5 ipe: Drop a duplicated CONFIG_ prefix in the=
 ifdeffery)
Merging kcsan/next (dcb6fa37fd7b Linux 6.18-rc3)
Merging crc/crc-next (dcb6fa37fd7b Linux 6.18-rc3)
Merging fwctl/for-next (211ddde0823f Linux 6.18-rc2)
Merging devsec-tsm/next (9d948b880409 Merge branch 'for-6.16/tsm-mr' into t=
sm-next)
Merging hisilicon/for-next (6c177775dcc5 Merge branch 'next/drivers' into f=
or-next)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)

--Sig_/sji+F=5gyve3QVKg.=M13EI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkIO2kACgkQAVBC80lX
0GyJJwf/TUSCESGBKfb7/8vKEi75m+rszQ4wzkl164jwEbG2Nob7QbRhDmh4Mhps
Emtoz2x8/gKdi9aFbrEaauW4uzRJpJLrWaEMWhVBmqoXYG6/ps2QcXQZJLL9G6uU
llh1xSdN12ZU4GpXvmU5fjh083YFZXepoO/PcjSSsmEn0XrTkVo3/lu21bc8Llql
tNa0/XNWfVMyXKbHG/pU5rcTx5YmRiXDF2t/j41PdNeZXZvGmSwmuIYEIkVOZleJ
59yta++34LPVu9KKqOKaF4JkgQZ288uwIPTaBOJVdehu3xDBejpFPUgN925VU8hY
X4NOAs79XQixtWs9ziPX9N1yuwv5bA==
=Slho
-----END PGP SIGNATURE-----

--Sig_/sji+F=5gyve3QVKg.=M13EI--

