Return-Path: <linux-next+bounces-8279-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CBAB541E0
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 07:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9C85AA08B2
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 05:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891C624C068;
	Fri, 12 Sep 2025 05:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nvwyw2LB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7691C1E2307;
	Fri, 12 Sep 2025 05:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757654213; cv=none; b=CE8aw85pyGBo3zOmdL2UMPEYAxptbdBhE3ZPdzhM2ceyp8SbeWMm5T9dHPoc8u4qUVsJQINxyG+sy3R2BKIbgJqgiTGvY4otw7p9Oz2asQnS0j+8tSEcmRA1ix5NkLB2Tzt4n9ztVA+maJ4mue9Tm75Cs674JoKgjOpCvS+mtKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757654213; c=relaxed/simple;
	bh=Ho9r3Tz+TiZJoIEnUWS0e7Gfy2WvFe3DByxK7/mADvU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lRBBOO3CO4EAQUR+Ny/5RWZS0TMphd7FNVKhyi02bBsHwDfaRvJ+tFntE6NmRbu/Mfcs1mBAVoiijQNRViB0++96YXtpH6M/O1dePS8JYNFmiQ6ycUsUUDmUkt7p3ZGgbw8zzm6cYlqitI6bx/B0v3hV4GLleOwpMk47z3BCKlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nvwyw2LB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757654203;
	bh=RaEeeXQ0eX2uUf7lDqKZxmP8twk6XyyXU84+pBvCmpw=;
	h=Date:From:To:Cc:Subject:From;
	b=nvwyw2LBQwJqayUMFVVsA/27iGI8Mq0U1b6QDxnHxlbnvTUGWkCsfTP+IJlk1Yy69
	 GYacej2CAwIwDe5S1iXQEWajV5ZppuLEb/4B5CO+rX1XDsIQ/YF6Hrcqdf1Q0DZjCF
	 4Cw3bS+tdU7nSdHOt7fw8w90GBZNGiIfqtEOaG9QChIDX3Tyifo7OVb/9YdfqLJJcR
	 vT2Rv6sVr2oVK5VpVH+0H6NCkGr4BWhyGyQSf1P2K0TCAQq25PqkDJjIXOYzdjE+hK
	 U++4I1wgBm09Tsy5eXhcGUuNssrDQ23dUaGS5qkctAC7Srwy/TzXVTju3iGbZZ3Xue
	 Xc/Ct/feZinPg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cNN2M2g9Mz4w9Z;
	Fri, 12 Sep 2025 15:16:43 +1000 (AEST)
Date: Fri, 12 Sep 2025 15:16:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 12
Message-ID: <20250912151642.7fc897cb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/W+_0Cb=Dwnktw5_QA+rcO1L";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/W+_0Cb=Dwnktw5_QA+rcO1L
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250911:

The vfs-brauner tree still had its build failure for which I reverted
3 commits.

The mm-unstable tree lost its build failure.

The net-next tree gained a conflict against the net tree.

The drm-exynos tree still had its build failure for which I reverted
a commit.

The drm-rust tree gained a conflict against the driver-core.current tree.

The mfd tree lost its build failure.

The tip tree gained a conflict against the bpf-next tree.

The kvm-x86 tree gained a conflict against Linus' tree.

The rust-pin-init tree gained a conflict against Linus' tree.

Non-merge commits (relative to Linus' tree): 7756
 8320 files changed, 317102 insertions(+), 128120 deletions(-)

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

I am currently merging 407 trees (counting Linus' and 406 trees of bug
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
Merging origin/master (e59a039119c3 Merge tag 's390-6.17-4' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/s390/linux)
Merging fixes/fixes (89be9a83ccf1 Linux 6.16-rc7)
Merging ext4-fixes/fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging vfs-brauner-fixes/vfs.fixes (e1bf212d0604 fuse: virtio_fs: fix page=
 fault for DAX page address)
Merging fscrypt-current/for-current (8f5ae30d69d7 Linux 6.17-rc1)
Merging fsverity-current/for-current (8f5ae30d69d7 Linux 6.17-rc1)
Merging btrfs-fixes/next-fixes (5fdd2d91176a Merge branch 'misc-6.17' into =
next-fixes)
Merging vfs-fixes/fixes (fb924b7b8669 change_mnt_propagation(): calculate p=
ropagation source only if we'll need it)
Merging erofs-fixes/fixes (1fcf686def19 erofs: fix long xattr name prefix p=
lacement)
Merging nfsd-fixes/nfsd-fixes (bee47cb026e7 sunrpc: fix handling of server =
side tls alerts)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (e8bd877fb76b ovl: fix possible double un=
link)
Merging fscrypt/for-next (19591f7e781f fscrypt: use HMAC-SHA512 library for=
 HKDF)
Merging btrfs/for-next (dc92556ef591 Merge branch 'for-next-next-v6.17-2025=
0905' into for-next-20250905)
Merging ceph/master (c22ec9a59b43 ceph: fix potential race condition on ope=
rations with CEPH_I_ODIRECT flag)
Merging cifs/for-next (14590d82f1b2 smb: client: short-circuit negative loo=
kups when parent dir is fully cached)
Merging configfs/configfs-next (462272dd734b configfs: use PTR_ERR_OR_ZERO(=
) to simplify code)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (8e4021078863 dlm: check for undefined release_option valu=
es)
Merging erofs/dev (df0ce6cefa45 erofs: support to readahead dirent blocks i=
n erofs_readdir())
Merging exfat/dev (a7d23a176730 exfat: optimize allocation bitmap loading t=
ime)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (ccb5d3bf81a3 Pull fanotify permission event watchdog=
.)
Merging ext4/dev (9d98cf463225 jbd2: prevent softlockup in jbd2_log_do_chec=
kpoint())
Merging f2fs/dev (c872b6279cd2 f2fs: allocate HOT_DATA for IPU writes)
Merging fsverity/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging fuse/for-next (ebbe7d7bb1ea mm: fix lockdep issues in writeback han=
dling)
Merging gfs2/for-next (2557f2e2c0e4 gfs2: Fix unlikely race in gdlm_put_loc=
k)
Merging jfs/jfs-next (856db3759202 jfs: fix metapage reference count leak i=
n dbAllocCtl)
Merging ksmbd/ksmbd-for-next (bfd34e6f84d5 ksmbd: smbdirect: validate data_=
offset and data_length field of smb_direct_data_transfer)
Merging nfs/linux-next (dd2fa8247345 NFSv4/flexfiles: Fix layout merge mirr=
or check.)
Merging nfs-anna/linux-next (38074de35b01 NFSv4/flexfiles: Fix handling of =
NFS level errors in I/O)
Merging nfsd/nfsd-next (b240a498e32a nfsd: decouple the xprtsec policy chec=
k from check_nfsd_access())
Merging ntfs3/master (7d460636b640 ntfs3: stop using write_cache_pages)
Merging orangefs/for-next (2138e89cb066 fs/orangefs: Allow 2 more character=
s in do_c_string())
Merging overlayfs/overlayfs-next (e98d6b6b9e25 ovl: make sure that ovl_crea=
te_real() returns a hashed dentry)
Merging ubifs/next (99dbb2a1bd66 ubifs: stop using write_cache_pages)
Merging v9fs/9p-next (674b56aa57f9 net/9p: fix double req put in p9_fd_canc=
elled)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (e90dcba0a350 Merge tag 'kconfig-2025-changes_2025-09-=
05' of https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux int=
o xfs-6.18-merge)
Merging zonefs/for-next (a42938e80357 zonefs: correct some spelling mistake=
s)
Merging vfs-brauner/vfs.all (d02ae3528998 Merge branch 'kernel-6.18.clone3'=
 into vfs.all)
Applying: Revert "nios2: implement architecture-specific portion of sys_clo=
ne3"
Applying: Revert "arch: copy_thread: pass clone_flags as u64"
Applying: Revert "copy_process: pass clone_flags as u64 across calltree"
Merging vfs/for-next (23bf7166fb4a Merge branch 'work.qstr' into for-next)
CONFLICT (content): Merge conflict in fs/namespace.c
Merging mm-hotfixes/mm-hotfixes-unstable (c41e198f131c zram: fix slot write=
 race condition)
Merging fs-current (8f2c324051de Merge branch 'fixes' of https://git.kernel=
.org/pub/scm/linux/kernel/git/xiang/erofs.git)
Merging kbuild-current/kbuild-fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging arc-current/for-curr (d7b8f8e20813 Linux 6.16-rc5)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (a7ed7b9d0ebb arm64: ftrace: fix unreach=
able PLT for ftrace_caller in init_module with CONFIG_DYNAMIC_FTRACE)
Merging arm-soc-fixes/arm/fixes (f2e8f1f5f5c8 Merge tag 'v6.17-rockchip-dts=
fixes1' of git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockch=
ip into arm/fixes)
Merging davinci-current/davinci/for-current (8f5ae30d69d7 Linux 6.17-rc1)
Merging drivers-memory-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging sophgo-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging sophgo-soc-fixes/soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging m68k-current/for-linus (c8995932db2b m68k: mac: Improve clocksource=
 driver commentary)
Merging powerpc-fixes/fixes (8763d2257f52 powerpc/boot/install.sh: Fix shel=
lcheck warnings)
Merging s390-fixes/fixes (ce971233242b s390/cpum_cf: Deny all sampling even=
ts by counter PMU)
Merging net/main (63a796558bc2 Revert "net: usb: asix: ax88772: drop phylin=
k use in PM to avoid MDIO runtime PM wakeups")
Merging bpf/master (e59a039119c3 Merge tag 's390-6.17-4' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/s390/linux)
Merging ipsec/master (cd8ae32e4e46 xfrm: xfrm_alloc_spi shouldn't use 0 as =
SPI)
Merging netfilter/main (63a796558bc2 Revert "net: usb: asix: ax88772: drop =
phylink use in PM to avoid MDIO runtime PM wakeups")
Merging ipvs/main (e2a10daba849 net: phy: transfer phy_config_inband() lock=
ing responsibility to phylink)
Merging wireless/for-next (c3f8d13357de wifi: nl80211: completely disable p=
er-link stats for now)
Merging ath/for-current (82e2be57d544 wifi: ath12k: fix WMI TLV header misa=
lignment)
Merging iwlwifi/fixes (9c600589e14f wifi: virt_wifi: Fix page fault on conn=
ect)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (85fe9f565d2d IB/mlx5: Fix obj_type mismatch for =
SRQ event subscriptions)
Merging sound-current/for-linus (b0035df56dcd ALSA: hda/tas2781: Fix a pote=
ntial race condition that causes a NULL pointer in case no efi.get_variable=
 exsits)
Merging sound-asoc-fixes/for-linus (bfa4d097f24e More minor SDCA bug fixes)
Merging regmap-fixes/for-linus (1b237f190eb3 Linux 6.17-rc3)
Merging regulator-fixes/for-linus (c05d0b32eeba regulator: sy7636a: fix lif=
ecycle of power good gpio)
Merging spi-fixes/for-linus (1991a4585285 spi: spi-qpic-snand: unregister E=
CC engine on probe error and device remove)
Merging pci-current/for-linus (b816265396da PCI: mvebu: Fix use of for_each=
_of_range() iterator)
Merging driver-core.current/driver-core-linus (f6d2900f2806 MAINTAINERS: Up=
date the DMA Rust entry)
Merging tty.current/tty-linus (b5e3277c0f1c serial: xilinx_uartps: read reg=
 size from DTS)
Merging usb.current/usb-linus (116e79c679a1 usb: gadget: midi2: Fix MIDI2 I=
N EP max packet size)
Merging usb-serial-fixes/usb-linus (a5a261bea9bf USB: serial: option: add T=
elit Cinterion LE910C4-WWX new compositions)
Merging phy/fixes (6cb8c1f957f6 phy: qcom: qmp-pcie: Fix PHY initialization=
 when powered down by firmware)
Merging staging.current/staging-linus (52ff2b840bc7 staging: axis-fifo: fix=
 maximum TX packet length check)
Merging iio-fixes/fixes-togreg (875e7d357a7f iio: dac: ad5421: use int type=
 to store negative error codes)
Merging counter-current/counter-current (c17b750b3ad9 Linux 6.17-rc2)
Merging char-misc.current/char-misc-linus (1b237f190eb3 Linux 6.17-rc3)
Merging soundwire-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging thunderbolt-fixes/fixes (76eeb9b8de98 Linux 6.17-rc5)
Merging input-current/for-linus (5f9efb6b7667 Input: mtk-pmic-keys - MT6359=
 has a specific release irq)
Merging crypto-current/master (9d9b193ed73a crypto: hash - Increase HASH_MA=
X_DESCSIZE for hmac(sha3-224-s390))
Merging libcrypto-fixes/libcrypto-fixes (cdb03b6d1896 crypto: sha512 - Impl=
ement export_core() and import_core())
Merging vfio-fixes/for-linus (c1d9dac0db16 vfio/pci: Align huge faults to o=
rder)
Merging kselftest-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging dmaengine-fixes/fixes (aa2e1e4563d3 dmaengine: dw: dmamux: Fix devi=
ce reference leak in rzn1_dmamux_route_allocate)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (4550d33e1811 mtd: spinand: winbond: Fix oob_la=
yout for W25N01JW)
Merging mfd-fixes/for-mfd-fixes (d9d79e4f7dc9 mfd: Fix building without CON=
FIG_OF)
Merging v4l-dvb-fixes/fixes (6f6fbd9a0c5a media: Remove redundant pm_runtim=
e_mark_last_busy() calls)
Merging reset-fixes/reset/fixes (9a52827a9bbb reset: eyeq: fix OF node leak)
Merging mips-fixes/mips-fixes (1b237f190eb3 Linux 6.17-rc3)
Merging at91-fixes/at91-fixes (217efb440933 ARM: dts: microchip: sama7d65: =
Force SDMMC Legacy mode)
Merging omap-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging kvm-fixes/master (42a0305ab114 Merge tag 'kvmarm-fixes-6.17-1' of h=
ttps://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvms390-fixes/master (5f9df945d4e8 KVM: s390: Fix FOLL_*/FAULT_FLAG=
_* confusion)
Merging hwmon-fixes/hwmon (d1d10cea0895 Merge tag 'perf-tools-fixes-for-v6.=
17-2025-09-05' of git://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-t=
ools)
Merging nvdimm-fixes/libnvdimm-fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging cxl-fixes/fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging dma-mapping-fixes/dma-mapping-fixes (7e2368a21741 dma-debug: don't =
enforce dma mapping check on noncoherent allocations)
Merging drivers-x86-fixes/fixes (aa28991fd5dc platform/x86/intel: power-dom=
ains: Use topology_logical_package_id() for package ID)
Merging samsung-krzk-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging pinctrl-samsung-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging devicetree-fixes/dt/linus (80af3745ca46 of: dynamic: Fix use after =
free in of_changeset_add_prop_helper())
Merging dt-krzk-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging scsi-fixes/fixes (5cb782ff3c62 scsi: ufs: mcq: Fix memory allocatio=
n checks for SQE and CQE)
Merging drm-fixes/drm-fixes (76eeb9b8de98 Linux 6.17-rc5)
Merging drm-intel-fixes/for-linux-next-fixes (cfa7b7659757 drm/i915/power: =
fix size for for_each_set_bit() in abox iteration)
Merging mmc-fixes/fixes (d2d7a96b29ea mmc: sdhci_am654: Disable HS400 for A=
M62P SR1.0 and SR1.1)
Merging rtc-fixes/rtc-fixes (08d82d0cad51 rtc: pcf2127: add missing semicol=
on after statement)
Merging gnss-fixes/gnss-linus (1b237f190eb3 Linux 6.17-rc3)
Merging hyperv-fixes/hyperv-fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging risc-v-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging riscv-dt-fixes/riscv-dt-fixes (19272b37aa4f Linux 6.16-rc1)
Merging riscv-soc-fixes/riscv-soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging spdx/spdx-linus (8f5ae30d69d7 Linux 6.17-rc1)
Merging gpio-brgl-fixes/gpio/for-current (76eeb9b8de98 Linux 6.17-rc5)
Merging gpio-intel-fixes/fixes (3712ce9fa501 gpiolib: acpi: Ignore touchpad=
 wakeup on GPD G1619-05)
Merging pinctrl-intel-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging auxdisplay-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging kunit-fixes/kunit-fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging memblock-fixes/fixes (b3dcc9d1d806 memblock: fix kernel-doc for MEM=
BLOCK_RSRV_NOINIT)
Merging renesas-fixes/fixes (379c590113ce ARM: shmobile: smp: Enforce shmob=
ile_smp_* alignment)
Merging perf-current/perf-tools (ca81e74dc347 perf symbol-elf: Add support =
for the block argument for libbfd)
Merging efi-fixes/urgent (05e75ac35ee9 efi: Explain OVMF acronym in OVMF_DE=
BUG_LOG help text)
Merging battery-fixes/fixes (1e451977e170 power: supply: bq27xxx: restrict =
no-battery detection to bq27000)
Merging iommufd-fixes/for-rc (1b237f190eb3 Linux 6.17-rc3)
Merging rust-fixes/rust-fixes (76eeb9b8de98 Linux 6.17-rc5)
Merging w1-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging pmdomain-fixes/fixes (303010f4658c pmdomain: renesas: rmobile-sysc:=
 Don't keep unused PM domains powered-on)
Merging i2c-host-fixes/i2c/i2c-host-fixes (ede965fd555a i2c: rtl9300: remov=
e broken SMBus Quick operation support)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging thead-clk-fixes/thead-clk-fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging pwrseq-fixes/pwrseq/for-current (8f5ae30d69d7 Linux 6.17-rc1)
Merging thead-dt-fixes/thead-dt-fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging ftrace-fixes/ftrace/fixes (327e28664307 fgraph: Do not enable funct=
ion_graph tracer when setting funcgraph-args)
Merging ring-buffer-fixes/ring-buffer/fixes (e4d4b8670c44 ring-buffer: Use =
flush_kernel_vmap_range() over flush_dcache_folio())
Merging trace-fixes/trace/fixes (cd4453c5e983 tracing: Silence warning when=
 chunk allocation fails in trace_pid_write)
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging tip-fixes/tip/urgent (1da2cf67f789 Merge branch into tip/master: 'x=
86/urgent')
Merging slab-fixes/slab/for-next-fixes (850470a8413a mm: slub: avoid wake u=
p kswapd in set_track_prepare)
Merging drm-msm-fixes/msm-fixes (3cf6147f2b51 soc: qcom: use no-UBWC config=
 for MSM8956/76)
Merging uml-fixes/fixes (df447a3b4a4b um: Fix FD copy size in os_rcv_fd_msg=
())
Merging fwctl-fixes/for-rc (f12343013022 pds_fwctl: Remove the use of dev_e=
rr_probe())
Merging devsec-tsm-fixes/fixes (fba4ceaa242d configfs-tsm-report: Fix NULL =
dereference of tsm_ops)
Merging drm-rust-fixes/drm-rust-fixes (349510052f76 MAINTAINERS: Add drm-ru=
st tree for Rust DRM drivers and infrastructure)
Merging drm-misc-fixes/for-linux-next-fixes (87b90cee22d8 MAINTAINERS: drm-=
misc: fix X: entries for nova/nouveau)
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (e6b9dce0aeeb Merge tag 'sound-6.17-rc5' of git=
://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound)
Merging mm-nonmm-stable/mm-nonmm-stable (e6b9dce0aeeb Merge tag 'sound-6.17=
-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound)
Merging mm-unstable/mm-unstable (6df84c63828f gpu/drm/nouveau: enable THP s=
upport for GPU memory migration)
Merging mm-nonmm-unstable/mm-nonmm-unstable (1388471c598a lib/decompress: u=
se designated initializers for struct compress_format)
Merging kbuild/kbuild-next (aa943a280e88 Merge patch series "Bump minimum s=
upported version of LLVM for building the kernel to 15.0.0")
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (1e5881b168b9 perf annotate: Fix title line af=
ter return from call)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (ec818caebc08 mm/hmm: properly tak=
e MMIO path)
Merging asm-generic/master (582847f97024 Makefile.kcov: apply needed compil=
er option unconditionally in CFLAGS_KCOV)
Merging alpha/alpha-next (1523226edda5 alpha: Use str_yes_no() helper in pc=
i_dac_dma_supported())
Merging arm/for-next (8dd85887ad83 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (cbf805469617 Merge branches 'for-next/docs', '=
for-next/entry', 'for-next/selftests', 'for-next/sysregs' and 'for-next/vds=
o' into for-next/core)
Merging arm-perf/for-next/perf (e480898e767c drivers/perf: hisi: Support PM=
Us with no interrupt)
Merging arm-soc/for-next (1cc98e294035 Merge branch 'arm/fixes' into for-ne=
xt)
Merging amlogic/for-next (a0c59ce817bc Merge branch 'v6.18/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (0b6344c954fc Merge branch 'apple-soc/=
drivers-6.18' into asahi-soc/for-next)
Merging at91/at91-next (cccff1ea4590 Merge branch 'microchip-soc' into at91=
-next)
Merging bmc/for-next (efd497649191 Merge branches 'aspeed/drivers', 'aspeed=
/arm/dt', 'nuvoton/arm/dt' and 'nuvoton/arm64/dt' into for-next)
Merging broadcom/next (cd0e2df0bb0c Merge branch 'drivers/next' into next)
Merging cix/for-next (fad32e8ac460 arm64: dts: cix: add DT nodes for all I2=
C and I3C ports for sky1)
Merging davinci/davinci/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging drivers-memory/for-next (3804cef4c597 memory: tegra210: Use binding=
s for client ids)
Merging fsl/soc_fsl (bcfdcd4bf4cc dt-bindings: soc: fsl: qe: Add support of=
 IRQ in QE GPIO)
Merging imx-mxs/for-next (d262bfe2cb62 Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (4d8b219b2be3 Merge branch 'v6.17-next/soc' into =
for-next)
Merging mvebu/for-next (23f5a19d1fa3 Merge branch 'mvebu/fixes' into mvebu/=
for-next)
Merging omap/for-next (aef3e8287711 Merge branch 'omap-for-v6.18/soc' into =
tmp/omap-next-20250908.143120)
Merging qcom/for-next (2acbe89a158c Merge branches 'arm32-defconfig-for-v6.=
18', 'arm32-for-6.18', 'arm64-defconfig-for-6.18', 'arm64-for-6.18', 'clk-f=
ixes-for-6.17', 'clk-for-6.18', 'drivers-fixes-for-6.17' and 'drivers-for-6=
.18' into for-next)
Merging renesas/next (a4aa3bef0ab1 Merge branches 'renesas-drivers-for-v6.1=
8', 'renesas-dt-bindings-for-v6.18' and 'renesas-dts-for-v6.18' into renesa=
s-next)
Merging reset/reset/next (1527cd3b89f0 reset: remove unneeded 'fast_io' par=
ameter in regmap_config)
Merging rockchip/for-next (2f814430bb5a Merge branch 'v6.18-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (541a89b87cb6 Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (79a43d226cd9 Merge branch 'for-next/scmi/updat=
es' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linu=
x into for-linux-next)
Merging sophgo/for-next (859ce3430569 Merge branch 'dt/riscv' into for-next)
Merging sophgo-soc/soc-for-next (c8754c7deab4 soc: sophgo: cv1800: rtcsys: =
New driver (handling RTC only))
Merging spacemit/for-next (d2b7cd9be23b Merge branch 'spacemit-clk-for-6.18=
' into spacemit-for-next)
Merging stm32/stm32-next (6d40d5ecf683 ARM: dts: stm32: add missing PTP ref=
erence clocks on stm32mp13x SoCs)
Merging sunxi/sunxi/for-next (606541cb9769 Merge branch 'sunxi/clk-for-6.18=
' into sunxi/for-next)
Merging tee/next (4bb98dc1b2f0 Merge branch 'tee_prot_dma_buf_for_v6.18' in=
to next)
Merging tegra/for-next (da2b9ee104d7 Merge branch for-6.18/arm64/dt into fo=
r-next)
Merging thead-dt/thead-dt-for-next (dfa743da83ab MAINTAINERS: Add RISC-V T-=
HEAD SoC patchwork)
Merging ti/ti-next (b6d89e53defc Merge branches 'ti-k3-dts-next' and 'ti-dr=
ivers-soc-next' into ti-next)
Merging xilinx/for-next (227cbbdee8c0 Merge branch 'zynqmp/dt' into for-nex=
t)
Merging clk/clk-next (54f5212c8f21 Merge branch 'clk-cleanup' into clk-next)
Merging clk-imx/for-next (c78865241ecf MAINTAINERS: Update i.MX Clock Entry)
Merging clk-renesas/renesas-clk (bf13ec1441a0 clk: renesas: r9a09g05[67]: R=
educe differences)
Merging thead-clk/thead-clk-for-next (c567bc5fc68c clk: thead: th1520-ap: s=
et all AXI clocks to CLK_IS_CRITICAL)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (58ea0ee79133 LoongArch: KVM: Move kvm_ioc=
sr tracepoint out of generic code)
Merging m68k/for-next (c8995932db2b m68k: mac: Improve clocksource driver c=
ommentary)
Merging m68knommu/for-next (76eeb9b8de98 Linux 6.17-rc5)
Merging microblaze/next (c0e7bb02f796 microblaze: Replace __ASSEMBLY__ with=
 __ASSEMBLER__ in non-uapi headers)
Merging mips/mips-next (ad79935dbc22 MIPS: configs: Consolidate Loongson1 d=
efconfigs)
Merging openrisc/for-next (8c30b0018f9d openrisc: Add jump label support)
Merging parisc-hd/for-next (c12503903873 parisc: Remove spurious if stateme=
nt from raw_copy_from_user())
Merging powerpc/next (daaa574aba6f powerpc/pseries/msi: Switch to msi_creat=
e_parent_irq_domain())
Merging risc-v/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging riscv-dt/riscv-dt-for-next (acc211539c81 riscv: dts: microchip: add=
 a device tree for Discovery Kit)
Merging riscv-soc/riscv-soc-for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging s390/for-next (0a61c48b2c13 Merge branch 'fixes' into for-next)
Merging sh/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (e66ae377fe21 um: Remove unused ipi_pipe field from cpuinf=
o_um)
Merging xtensa/xtensa-for-next (5d5f08fd0cd9 xtensa: simdisk: add input siz=
e check in proc_write_simdisk)
Merging fs-next (24d149923933 Merge branch 'for-next' of https://git.kernel=
.org/pub/scm/linux/kernel/git/viro/vfs.git)
  7d460636b640 ("ntfs3: stop using write_cache_pages")
Merging printk/for-next (37dbd4203b42 Merge branch 'rework/ringbuffer-kunit=
-test' into for-next)
Merging pci/next (bfd2c81b061c Merge branch 'pci/misc')
Merging pstore/for-next/pstore (d679c2e1e8d9 pstore/zone: rewrite some comm=
ents for better understanding)
Merging hid/for-next (9ba479eca512 Merge branch 'for-6.17/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (8fd62b154ce6 Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i2c-host/i2c/i2c-host (8cbfa1972619 dt-bindings: i2c: samsung,s3c24=
10-i2c: Drop S3C2410)
Merging i3c/i3c/next (3b661ca549b9 i3c: add missing include to internal hea=
der)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (80038a758b7f hwmon: sy7636a: add alias)
Merging jc_docs/docs-next (f44a29784f68 Documentation: update maintainer-pg=
p-guide for latest best practices)
Merging v4l-dvb/next (ecba852dc9f4 media: redrat3: use int type to store ne=
gative error codes)
Applying: fix up for "media: cadence: cdns-csi2rx: Support multiple pixels =
per clockcycle"
Merging v4l-dvb-next/master (adc218676eef Linux 6.12)
Merging pm/linux-next (141e2b2b2928 Merge branch 'pm-devfreq' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (3e681899cc6e cpufreq: mediatek:=
 avoid redundant conditions)
Merging cpupower/cpupower (357d1fc38aad cpupower: Allow control of boost fe=
ature on non-x86 based systems with boost support.)
Merging devfreq/devfreq-next (eddb5ba91b28 PM / devfreq: rockchip-dfi: add =
support for LPDDR5)
Merging pmdomain/next (1d97d9492076 pmdomain: Merge branch fixes into next)
Merging opp/opp/linux-next (05db35963eef OPP: Add support to find OPP for a=
 set of keys)
Merging thermal/thermal/linux-next (59cc5d656ca4 drivers/thermal/qcom/lmh: =
Fix incorrect error message)
Merging rdma/for-next (eba165b29097 RDMA/bnxt_re: Avoid GID level QoS updat=
e from the driver)
CONFLICT (content): Merge conflict in drivers/infiniband/hw/bnxt_re/main.c
Merging net-next/main (5f790208d68f net: phy: fixed_phy: remove two functio=
n stubs)
CONFLICT (content): Merge conflict in Documentation/networking/device_drive=
rs/ethernet/index.rst
CONFLICT (content): Merge conflict in net/netfilter/nft_set_pipapo.c
CONFLICT (content): Merge conflict in net/netfilter/nft_set_pipapo_avx2.c
Merging bpf-next/for-next (bfa447c63703 Merge branch 'bpf-next/master' into=
 for-next)
Merging ipsec-next/master (9f4f591cd5a4 xfrm: xfrm_user: use strscpy() for =
alg_name)
Merging mlx5-next/mlx5-next (ff97bc38be34 net/mlx5: Add RS FEC histogram in=
frastructure)
Merging netfilter-next/main (1f24a2409745 doc: mptcp: fix Netlink specs lin=
k)
Merging ipvs-next/main (f3883b1ea5a8 selftests: net: move netlink-dumps bac=
k to progs)
Merging bluetooth/master (6c7e4432e56e Bluetooth: bcsp: receive data only i=
f registered)
Merging wireless-next/for-next (1b2e9feb3514 wifi: mwifiex: fix endianness =
handling in mwifiex_send_rgpower_table)
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/fw=
/uefi.c
Merging ath-next/for-next (ee6960bdbb74 Merge branch 'net-airoha-add-ppe-su=
pport-for-rx-wlan-offload')
Merging iwlwifi-next/next (6f4f8abad4f2 Merge tag 'iwlwifi-next-2025-09-09'=
 of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next)
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (9781c381c159 mtd: core: skip badblocks increment for =
blocks already known bad)
Merging nand/nand/next (5808ae66f22e mtd: rawnand: loongson: Add Loongson-2=
K1000 NAND controller support)
Merging spi-nor/spi-nor/next (17926cd770ec mtd: spi-nor: core: avoid odd le=
ngth/address writes in 8D-8D-8D mode)
Merging crypto/master (886d69812082 crypto: hisilicon/zip - add hashjoin, g=
ather, and UDMA data move features)
Merging libcrypto/libcrypto-next (b94bc4398bec crypto: md5 - Implement expo=
rt_core() and import_core())
Merging drm/drm-next (6dc1d3c191ac Merge tag 'drm-misc-next-2025-09-04' of =
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/nova/file.rs
Merging drm-exynos/for-linux-next (d07e4c00696f drm/exynos: dsi: add suppor=
t for exynos7870)
Applying: Revert "drm/exynos: dsi: add support for exynos7870"
Merging drm-misc/for-linux-next (9e16c8bf9aeb accel/amdxdna: Fix an integer=
 overflow in aie2_query_ctx_status_array())
Merging amdgpu/drm-next (0855c764f7e6 drm/amdgpu/vcn: Change amdgpu_vcn_sw_=
fini return to void)
Merging drm-intel/for-linux-next (72136efb875d drm/i915/backlight: Honor VE=
SA eDP backlight luminance control capability)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_tc=
.c
Merging drm-msm/msm-next (b5bad77e1e3c drm/msm/registers: Sync GPU register=
s from mesa)
Merging drm-msm-lumag/msm-next-lumag (a643abb67379 drm/msm/mdp4: remove the=
 use of dev_err_probe())
Merging drm-rust/drm-rust-next (cf4fd52e3236 rust: drm: Introduce the Tyr d=
river for Arm Mali GPUs)
CONFLICT (content): Merge conflict in MAINTAINERS
CONFLICT (content): Merge conflict in rust/kernel/alloc/allocator.rs
CONFLICT (content): Merge conflict in rust/kernel/alloc/allocator_test.rs
CONFLICT (content): Merge conflict in rust/kernel/alloc/kbox.rs
Merging drm-nova/nova-next (93296e9d9528 gpu: nova-core: vbios: store refer=
ence to Device where relevant)
Merging drm-xe/drm-xe-next (88434448438e drm/xe/guc: Set RCS/CCS yield poli=
cy)
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (6d85b579a9ca fbdev: Use string choices helpers)
Merging regmap/for-next (298834573197 Merge remote-tracking branch 'regmap/=
for-6.18' into regmap-next)
Merging sound/for-next (3c30d57544bf ALSA: sparc/dbri: Use guard() for spin=
 locks)
Merging ieee1394/for-next (a4bac55d99d3 firewire: core: code refactoring wh=
ether root node is cycle master capable)
Merging sound-asoc/for-next (7e897d544ac4 Merge remote-tracking branch 'aso=
c/for-6.18' into asoc-next)
Merging modules/modules-next (5eb4b9a4cdbb params: Replace deprecated strcp=
y() with strscpy() and memcpy())
Merging input/next (d5ad57fc428c dt-bindings: input: qcom,pm8941-pwrkey: Fi=
x formatting of descriptions)
Merging block/for-next (1c0eb8215e82 Merge branch 'for-6.18/block' into for=
-next)
Merging device-mapper/for-next (4466dd3d719c dm-pcache: use int type to sto=
re negative error codes)
Merging libata/for-next (692173de3032 dt-bindings: ata: imx: Document 'targ=
et-supply')
Merging pcmcia/pcmcia-next (4a81f78caa53 pcmcia: Add error handling for add=
_interval() in do_validate_mem())
Merging mmc/next (c2ef7a03f5c8 mmc: sdio: Drop dev_pm_domain_detach() call)
Merging mfd/for-mfd-next (58cd9c86b240 mfd: bd71828, bd71815: Prepare for p=
ower-supply support)
Merging backlight/for-backlight-next (7a5e9040f418 backlight: led_bl: Use d=
evm_kcalloc() for array space allocation)
Merging battery/for-next (cc2ec444e461 power: supply: WQ_PERCPU added to al=
loc_workqueue users)
Merging regulator/for-next (487a49391967 Merge remote-tracking branch 'regu=
lator/for-6.18' into regulator-next)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging security/next (54d94c422fed lsm: CONFIG_LSM can depend on CONFIG_SE=
CURITY)
Merging apparmor/apparmor-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging integrity/next-integrity (a4cc916bf572 lib/digsig: Use SHA-1 librar=
y instead of crypto_shash)
Merging selinux/next (68e1e908cb76 selinux: enable per-file labeling for fu=
nctionfs)
Merging smack/next (6ddd169d0288 smack: fix kernel-doc warnings for smk_imp=
ort_valid_label())
Merging tomoyo/master (038d61fd6422 Linux 6.16)
Merging tpmdd/next (72f6cd8ad0db tpm: Use HMAC-SHA256 library instead of op=
en-coded HMAC)
Merging watchdog/master (f777d1112ee5 Merge tag 'vfs-6.17-rc6.fixes' of git=
://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs)
Merging iommu/next (86052eb4519c Merge branches 'fixes', 'apple/dart', 'ti/=
omap', 'riscv' and 'amd/amd-vi' into next)
Merging audit/next (26cbca1db23a Automated merge of 'dev' into 'next')
Merging devicetree/for-next (fc9cd2ffa02d dt-bindings: edac: Convert apm,xg=
ene-edac to DT schema)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/ven=
dor-prefixes.yaml
Merging dt-krzk/for-next (7ee0f223cabe arm64: dts: toshiba: tmpv7708: Add d=
efault GIC address cells)
Merging mailbox/for-next (5378bdf6a611 mailbox/pcc: support mailbox managem=
ent of the shared buffer)
Merging spi/for-next (9ca01e9226db support for Amlogic SPI Flash Controller=
 IP)
Merging tip/master (0a5f56aff154 Merge branch into tip/master: 'x86/tdx')
  23fc2a41a2c6 ("dt-bindings: mfd: aspeed: Add AST2700 SCU compatibles")
CONFLICT (content): Merge conflict in tools/testing/selftests/bpf/prog_test=
s/usdt.c
Merging clockevents/timers/drivers/next (461f124656e6 clocksource/drivers/a=
rm_arch_timer_mmio: Add MMIO clocksource)
Merging edac/edac-for-next (501973598d05 Merge branch 'edac-drivers' into e=
dac-for-next)
Merging ftrace/for-next (32f92a5456e6 Merge probes/for-next)
Merging rcu/next (97caae2d1494 Merge branch 'torture.2025.08.14a' into HEAD)
Merging paulmck/non-rcu/next (b706eec9304f Merge branches 'lkmm.2025.07.09a=
', 'ratelimit.2025.06.24a' and 'stop-machine.2025.07.17a' into HEAD)
Merging kvm/next (a6ad54137af9 Merge branch 'guest-memfd-mmap' into HEAD)
CONFLICT (content): Merge conflict in arch/x86/kvm/Kconfig
Merging kvm-arm/next (aae5a9834b38 Merge branch kvm-arm64/misc-6.18 into kv=
marm-master/next)
Merging kvms390/next (352ccf890a3e KVM: s390: improve interrupt cpu for wak=
eup)
Merging kvm-ppc/topic/ppc-kvm (c17b750b3ad9 Linux 6.17-rc2)
Merging kvm-riscv/riscv_kvm_next (799766208f09 RISC-V: KVM: fix stack overr=
un when loading vlenb)
Merging kvm-x86/next (b33f3c899e27 Merge branches 'fixes', 'generic', 'gues=
t', 'misc', 'mmu', 'selftests', 'svm' and 'vmx')
CONFLICT (content): Merge conflict in arch/x86/include/asm/cpufeatures.h
Merging xen-tip/linux-next (f770c3d85868 xen/manage: Fix suspend error path)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (570129c58347 Merge branch 'for-6.18' into for-=
next)
Merging sched-ext/for-next (88485afa2d14 Merge branch 'for-6.18' into for-n=
ext)
Merging drivers-x86/for-next (c4f8b11bacd5 platform/x86: quickstart: Use de=
vm_mutex_init())
Merging chrome-platform/for-next (f7439a723e5a platform/chrome: wilco_ec: R=
emove redundant semicolons)
Merging chrome-platform-firmware/for-firmware-next (8f5ae30d69d7 Linux 6.17=
-rc1)
Merging hsi/for-next (ca50b295fd47 HSI: omap_ssi_port: Remove redundant pm_=
runtime_mark_last_busy() calls)
Merging leds-lj/for-leds-next (d6058316d16e leds: leds-lp55xx: Use correct =
address for memory programming)
Merging ipmi/for-next (bc3a9d217755 ipmi:si: Gracefully handle if the BMC i=
s non-functional)
Merging driver-core/driver-core-next (d4a5d397c7fb samples: rust: Add scope=
d debugfs sample driver)
Merging usb/usb-next (6f9871b3e8c3 usb: gadget: tegra-xudc: Remove redundan=
t ternary operators)
Merging thunderbolt/next (b06578497e6f thunderbolt: Use string choices help=
ers)
Merging usb-serial/usb-next (b3a333f8ac16 USB: serial: oti6858: remove extr=
anenous ; after comment)
Merging tty/tty-next (e81783899d7d Revert "m68k: make HPDCA and HPAPCI bool=
s")
Merging char-misc/char-misc-next (63f0c6a270be Merge tag 'w1-drv-6.18' of s=
sh://gitolite.kernel.org/pub/scm/linux/kernel/git/krzk/linux-w1 into char-m=
isc-next)
CONFLICT (content): Merge conflict in rust/kernel/lib.rs
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (6292413be002 coresight: Fix incorrect handling for =
return value of devm_kzalloc)
Merging fastrpc/for-next (b52ebc078bb6 misc: fastrpc: add support for gdsp =
remoteproc)
Merging fpga/for-next (4f156ee58bb8 fpga: zynq_fpga: Fix the wrong usage of=
 dma_map_sgtable())
Merging icc/icc-next (500160770cb2 Merge branch 'icc-glymur' into icc-next)
Merging iio/togreg (b8902d55155c iio: magnetometer: tmag5273: remove unused=
 IIO_CHAN_INFO_PROCESSED handling)
Merging phy-next/next (bdb978979ed1 phy: rockchip: phy-rockchip-inno-csidph=
y: add support for rk3588 variant)
Merging soundwire/next (88f5d2a477ec soundwire: Use min() to improve code)
Merging extcon/extcon-next (94d885eb8ffe dt-bindings: extcon: linux,extcon-=
usb-gpio: GPIO must be provided)
Merging gnss/gnss-next (1b237f190eb3 Linux 6.17-rc3)
Merging vfio/next (093458c58f83 docs: proc.rst: Fix VFIO Device title forma=
tting)
Merging w1/for-next (25fb0ea986dc w1: matrox: Remove some deadcode in matro=
x_w1_remove())
Merging spmi/spmi-next (0ff41df1cb26 Linux 6.15)
Merging staging/staging-next (7cce3d7bce7f staging: rtl8723bs: Hal_EfusePar=
seAntennaDiversity_8723B is empty)
Merging counter-next/counter-next (51548c36b37d counter: ti-ecap-capture: U=
se devm_pm_runtime_enable())
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (cc0bacac6de7 dt-bindings: dma: rz-dmac: Document RZ=
/G3E family of SoCs)
Merging cgroup/for-next (cf9c2bbba273 Merge branch 'for-6.18' into for-next)
Merging scsi/for-next (c9dd1e6348a9 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (fea2bfde3d52 scsi: bfa: Remove self-assignment c=
ode)
Merging vhost/linux-next (c67e16d30dca tools headers: Sync uapi/linux/vhost=
.h with the kernel source)
Merging rpmsg/for-next (03b95f41544d Merge branches 'rproc-next' and 'rpmsg=
-next' into for-next)
Merging gpio-brgl/gpio/for-next (4c91b0ee35db gpio: loongson-64bit: Fix a l=
ess than zero check on an unsigned int struct field)
  1efbee6852f1 ("mfd: vexpress-sysreg: Check the return value of devm_gpioc=
hip_add_data()")
  9b33bbc084ac ("mfd: vexpress-sysreg: Use new generic GPIO chip API")
Merging gpio-intel/for-next (3712ce9fa501 gpiolib: acpi: Ignore touchpad wa=
keup on GPD G1619-05)
Merging pinctrl/for-next (1c84a6b2ca94 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging pinctrl-renesas/renesas-pinctrl (512bf60226c6 pinctrl: renesas: r8a=
779g0: Fix trivial typo in SoC type comment)
Merging pinctrl-samsung/for-next (d37db94b0781 dt-bindings: pinctrl: samsun=
g: Drop S3C2410)
Merging pwm/pwm/for-next (9e31679a90a2 dt-bindings: pwm: nxp,lpc1850-sct-pw=
m: Minor whitespace cleanup in example)
Merging ktest/for-next (a5e71638ddd7 ktest.pl: Add new PATCHCHECK_SKIP opti=
on to skip testing individual commits)
Merging kselftest/next (8f5ae30d69d7 Linux 6.17-rc1)
Merging kunit/test (8f5ae30d69d7 Linux 6.17-rc1)
Merging kunit-next/kunit (93cf798e7610 Documentation: kunit: Document new p=
arameterized test features)
Applying: fix up for "kunit: Pass parameterized test context to generate_pa=
rams()"
Merging livepatching/for-next (dcf9f31c62b3 Merge tag 'livepatching-for-6.1=
5' of git://git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepatchi=
ng)
Merging rtc/rtc-next (bb5b0b4317c9 rtc: ds1685: Update Joshua Kinard's emai=
l address.)
Merging nvdimm/libnvdimm-for-next (9f97e61bde6a cxl: Include range.h in cxl=
.h)
Merging at24/at24/for-next (c7ec58c39b02 dt-bindings: eeprom: at24: Add com=
patible for Giantec GT24C256C)
Merging ntb/ntb-next (0cadf92e93d4 NTB/msi: Remove unused functions)
Merging seccomp/for-next/seccomp (b0c9bfbab925 selftests/seccomp: Add a tes=
t for the WAIT_KILLABLE_RECV fast reply race)
Merging slimbus/for-next (b549602f781e slimbus: messaging: fix "transfered"=
->"transferred")
Merging nvmem/for-next (ea4aaa05a7e4 Merge branch 'nvmem-for-6.18' into nvm=
em-for-next)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (553d825fb2f0 x86/hyperv: Switch to msi_create_p=
arent_irq_domain())
Merging auxdisplay/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging kgdb/kgdb/for-next (afdbe49276ac kdb: Remove optional size argument=
s from strscpy() calls)
Merging hmm/hmm (19272b37aa4f Linux 6.16-rc1)
Merging cfi/cfi/next (19272b37aa4f Linux 6.16-rc1)
Merging mhi/mhi-next (d0856a6dff57 bus: mhi: host: Do not use uninitialized=
 'dev' pointer in mhi_init_irq_setup())
Merging memblock/for-next (79533628b74b memblock: drop for_each_free_mem_pf=
n_range_in_zone_from())
Merging cxl/next (c4272905c379 cxl/acpi: Rename CFMW coherency restrictions)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (02eb7a8eee20 efi: add API doc entry for ovmf_debug_log)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (b0998b4bccab Merge branch 'slab/for-6.18/sheave=
s' into slab/for-next)
Merging random/master (3778dcb2dcc1 random: use offstack cpumask when neces=
sary)
Merging landlock/next (6dde339a3df8 landlock: Minor comments improvements)
Merging rust/rust-next (099381a08db3 rust: error: improve `to_result` docum=
entation)
CONFLICT (content): Merge conflict in rust/kernel/alloc.rs
CONFLICT (modify/delete): rust/kernel/alloc/allocator_test.rs deleted in ru=
st/rust-next and modified in HEAD.  Version HEAD of rust/kernel/alloc/alloc=
ator_test.rs left in tree.
CONFLICT (content): Merge conflict in samples/rust/rust_dma.rs
$ git rm -f rust/kernel/alloc/allocator_test.rs
Merging rust-alloc/alloc-next (fe927defbb4f rust: alloc: remove `allocator_=
test`)
Merging rust-io/io-next (86731a2a651e Linux 6.16-rc3)
Merging rust-pin-init/pin-init-next (42415d163e5d rust: pin-init: add refer=
ences to previously initialized fields)
CONFLICT (content): Merge conflict in rust/kernel/devres.rs
Merging rust-timekeeping/timekeeping-next (4521438fb076 rust: time: Impleme=
nt basic arithmetic operations for Delta)
Merging rust-xarray/xarray-next (fa616196fbea MAINTAINERS: add entry for Ru=
st XArray API)
Merging sysctl/sysctl-next (19272b37aa4f Linux 6.16-rc1)
Merging execve/for-next/execve (8c94db0ae97c binfmt_elf: preserve original =
ELF e_flags for core dumps)
Merging bitmap/bitmap-for-next (b927629bf30d rust: add dynamic ID pool abst=
raction for bitmap)
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (df4abb8b7f43 Merge branches 'for-next/v6.18-rc1=
/ffs-const', 'for-next/hardening' and 'for-linus/hardening' into for-next/k=
spp)
CONFLICT (content): Merge conflict in arch/s390/include/asm/bitops.h
Merging nolibc/for-next (ca38943e83c7 selftests/nolibc: remove outdated com=
ment about construct order)
Merging iommufd/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging turbostat/next (447c98c1ca4a tools/power turbostat: Add idle govern=
or statistics reporting)
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.8
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.c
Merging pwrseq/pwrseq/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging capabilities-next/caps-next (cdd73b166607 uapi: fix broken link in =
linux/capability.h)
Merging ipe/next (038d61fd6422 Linux 6.16)
Merging kcsan/next (800348aa34b2 kcsan: test: Replace deprecated strcpy() w=
ith strscpy())
Merging crc/crc-next (136d029662cd Documentation/staging: Fix typo and inco=
rrect citation in crc32.rst)
Merging fwctl/for-next (19272b37aa4f Linux 6.16-rc1)
Merging devsec-tsm/next (9d948b880409 Merge branch 'for-6.16/tsm-mr' into t=
sm-next)
Merging hisilicon/for-next (6c177775dcc5 Merge branch 'next/drivers' into f=
or-next)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)

--Sig_/W+_0Cb=Dwnktw5_QA+rcO1L
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmjDrLoACgkQAVBC80lX
0Gy8bQgAm5pzYn7MK0qB6A2c+mcKLIzZb0k3jndAe5RQtDujjnGj/UdjwEY3ymz2
Lz9d6oYBzKNHThaGb0mar45/H4ME8vnmETou3jqOOCJkJKD7JQ3TgiKhnjgir62z
2RIBCuERKNczlqa+jFM+RDANGhpLnIcff39mPFZKO3lgu69uRln7jhW6HSNbwtJC
/Kwa0mnAQBJ6JiedU4jPhFk9YTAL7v8mz5YcvuqbCb86/XVHxT5BegQCx9/erZza
VO8p2KSXnSKKiuF1/SVCa1auwTQ9vd8KuLejAwucgn6GG2HBVDFJpEd25Pc3/pzC
R4OXWqgdvz3LlJmXlS9HuF2RHVJVaQ==
=DRoY
-----END PGP SIGNATURE-----

--Sig_/W+_0Cb=Dwnktw5_QA+rcO1L--

