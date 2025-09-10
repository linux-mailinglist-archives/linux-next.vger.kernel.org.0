Return-Path: <linux-next+bounces-8249-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FEAB50F15
	for <lists+linux-next@lfdr.de>; Wed, 10 Sep 2025 09:18:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB33F164965
	for <lists+linux-next@lfdr.de>; Wed, 10 Sep 2025 07:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24563090D4;
	Wed, 10 Sep 2025 07:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SOyK7Ob7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370BF3074AF;
	Wed, 10 Sep 2025 07:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757488679; cv=none; b=YljZfk8QL8/T/bPae8FmTehYL8pCQj2BZplvQtCsitTS0vnhr/NUe3+Xct/xNccYNgWn54xcuQBmWwHVvMfTEEQD6T/rMeu8yaJvGQRZs61shetDSDDZbL7Uz5jFNqNnyU6VQAbo+u2h0WRuosw9t1UzhlBx4NOJYPiEHfgz0MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757488679; c=relaxed/simple;
	bh=9jhCRPLXbmGrDz7TB50Yr4ru8F3NPRkaAa0t7R31m+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oNYrhS4MMMUVpjR22pZGIhWDZmetY7hLYq8JtsMf9xXFCg7FCYnyJn+sv/uC3j13tAOJiyHFyKxGOfmNXvcpnONPBeSOtZFOV37lWTt0lfcuZfkRWova5vRWAWgEHx7/PB+sFXDXgA0UQmtmgrjOB60ruWgm2kQdXBh98CHYww0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SOyK7Ob7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757488669;
	bh=tJBd2zZOohw6MMumQOvdeXkalTKNkE90i6t1cfHuYa4=;
	h=Date:From:To:Cc:Subject:From;
	b=SOyK7Ob7/IHSHwaBmz1wwsbtyv9IQUr5jDLveaL9Tp7C1m3YdPoeikrUiU9qTJwJm
	 lWtxZKESAgseJ+J3QSFXBNImyqz2Frb/u/o1AW4wYizhUCEsE0xF0vNJOxhnt0dYBG
	 KoyNuEFu/c8bCjlz7tNiQlrdI9dj3JidevqKeiw/yEapeZsQ6XHUPDI9ha4PBxELNW
	 GhIy7pw9+tj1v9lISUvd5yyWgqqPwPZz11VStRYKbeUplwX6D79cmS5E6flsZdacj7
	 TzTB/qd+0ViPSaFs4I94p1hwambJi0nX1xHrSkQHMbRdg9jt0kE4GNfc9RaeYqN8hK
	 FfpDgtCwcpQ5w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cMBq11vsqz4w93;
	Wed, 10 Sep 2025 17:17:49 +1000 (AEST)
Date: Wed, 10 Sep 2025 17:17:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 10
Message-ID: <20250910171747.4843ac10@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_gv..SId/9yOxmrfAXcGHrE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_gv..SId/9yOxmrfAXcGHrE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250909:

The vfs-brauner tree still had its build failure for which I reverted
3 commits.

The drm-exynos tree still had its build failure for which I reverted
a commit.

The mfd tree still had its build failure so I used the version from
next-20250903.

Non-merge commits (relative to Linus' tree): 7026
 7557 files changed, 272835 insertions(+), 114203 deletions(-)

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
Merging origin/master (9dd1835ecda5 Merge tag 'dma-mapping-6.17-2025-09-09'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/mszyprowski/linux)
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
Merging erofs-fixes/fixes (131897c65e2b erofs: fix invalid algorithm for en=
coded extents)
Merging nfsd-fixes/nfsd-fixes (bee47cb026e7 sunrpc: fix handling of server =
side tls alerts)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (e8bd877fb76b ovl: fix possible double un=
link)
Merging fscrypt/for-next (0e6608d4938e fscrypt: Remove redundant __GFP_NOWA=
RN)
Merging btrfs/for-next (dc92556ef591 Merge branch 'for-next-next-v6.17-2025=
0905' into for-next-20250905)
Merging ceph/master (e07ea6b92bd9 ceph: fix potential race condition on ope=
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
Merging ext3/for_next (57484755b4ba Pull mount notify null ptr deref fix.)
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
Merging ksmbd/ksmbd-for-next (9cb258650ad3 ksmbd: increase session and shar=
e hash table bits)
Merging nfs/linux-next (dd2fa8247345 NFSv4/flexfiles: Fix layout merge mirr=
or check.)
Merging nfs-anna/linux-next (38074de35b01 NFSv4/flexfiles: Fix handling of =
NFS level errors in I/O)
Merging nfsd/nfsd-next (b240a498e32a nfsd: decouple the xprtsec policy chec=
k from check_nfsd_access())
Merging ntfs3/master (8f5ae30d69d7 Linux 6.17-rc1)
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
Merging vfs/for-next (b388ff0454fb Merge branch 'work.mount' into for-next)
CONFLICT (content): Merge conflict in fs/namespace.c
Merging mm-hotfixes/mm-hotfixes-unstable (6966954fb672 nilfs2: fix CFI fail=
ure when accessing /sys/fs/nilfs2/features/*)
Merging fs-current (530190453287 Merge branch 'fixes' of https://git.kernel=
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
Merging net/main (e0d1c55501d3 net: phy: fix phy_uses_state_machine())
Merging bpf/master (6d78b4473cdb bpf: Tell memcg to use allow_spinning=3Dfa=
lse path in bpf_timer_init())
Merging ipsec/master (cd8ae32e4e46 xfrm: xfrm_alloc_spi shouldn't use 0 as =
SPI)
Merging netfilter/main (e3c674db356c tunnels: reset the GSO metadata before=
 reusing the skb)
Merging ipvs/main (e2a10daba849 net: phy: transfer phy_config_inband() lock=
ing responsibility to phylink)
Merging wireless/for-next (d69eb204c255 Merge tag 'net-6.17-rc5' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ath/for-current (82e2be57d544 wifi: ath12k: fix WMI TLV header misa=
lignment)
Merging iwlwifi/fixes (2682e7a31750 wifi: iwlwifi: fix 130/1030 configs)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (85fe9f565d2d IB/mlx5: Fix obj_type mismatch for =
SRQ event subscriptions)
Merging sound-current/for-linus (71d2893a235b ALSA: hda/tas2781: Fix the or=
der of TAS2781 calibrated-data)
Merging sound-asoc-fixes/for-linus (bfa4d097f24e More minor SDCA bug fixes)
Merging regmap-fixes/for-linus (1b237f190eb3 Linux 6.17-rc3)
Merging regulator-fixes/for-linus (c05d0b32eeba regulator: sy7636a: fix lif=
ecycle of power good gpio)
Merging spi-fixes/for-linus (1991a4585285 spi: spi-qpic-snand: unregister E=
CC engine on probe error and device remove)
Merging pci-current/for-linus (b816265396da PCI: mvebu: Fix use of for_each=
_of_range() iterator)
Merging driver-core.current/driver-core-linus (3c9ba2777d6c kernfs: Fix UAF=
 in polling when open file is released)
Merging tty.current/tty-linus (b5e3277c0f1c serial: xilinx_uartps: read reg=
 size from DTS)
Merging usb.current/usb-linus (116e79c679a1 usb: gadget: midi2: Fix MIDI2 I=
N EP max packet size)
Merging usb-serial-fixes/usb-linus (cba70aff623b USB: serial: option: add T=
elit Cinterion FN990A w/audio compositions)
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
Merging scsi-fixes/fixes (708e2371f77a scsi: sr: Reinstate rotational media=
 flag)
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
Merging pmdomain-fixes/fixes (d8f3ae7b38fe pmdomain: renesas: rcar-sysc: Ma=
ke rcar_sysc_onecell_np __initdata)
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
Merging tip-fixes/tip/urgent (e5772453af9b Merge branch into tip/master: 'x=
86/urgent')
Merging slab-fixes/slab/for-next-fixes (850470a8413a mm: slub: avoid wake u=
p kswapd in set_track_prepare)
Merging drm-msm-fixes/msm-fixes (3cf6147f2b51 soc: qcom: use no-UBWC config=
 for MSM8956/76)
Merging uml-fixes/fixes (2dca89df0d11 Merge tag 'uml-for-6.16-rc4' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/uml/linux)
Merging fwctl-fixes/for-rc (f12343013022 pds_fwctl: Remove the use of dev_e=
rr_probe())
Merging devsec-tsm-fixes/fixes (fba4ceaa242d configfs-tsm-report: Fix NULL =
dereference of tsm_ops)
Merging drm-rust-fixes/drm-rust-fixes (349510052f76 MAINTAINERS: Add drm-ru=
st tree for Rust DRM drivers and infrastructure)
Merging drm-misc-fixes/for-linux-next-fixes (a00f2015acdb drm/panthor: vali=
date group queue count)
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (e6b9dce0aeeb Merge tag 'sound-6.17-rc5' of git=
://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound)
Merging mm-nonmm-stable/mm-nonmm-stable (e6b9dce0aeeb Merge tag 'sound-6.17=
-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound)
Merging mm-unstable/mm-unstable (a3bff28df80b mm/memremap: remove unused ge=
t_dev_pagemap() parameter)
Merging mm-nonmm-unstable/mm-nonmm-unstable (a0717dff6926 docs: update dela=
ytop documentation for new interactive features)
Merging kbuild/kbuild-next (aa943a280e88 Merge patch series "Bump minimum s=
upported version of LLVM for building the kernel to 15.0.0")
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (75a7b9d29215 perf vendor events: Update tiger=
lake metrics)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (110aa2c74dbd swiotlb: Remove redu=
ndant __GFP_NOWARN)
Merging asm-generic/master (582847f97024 Makefile.kcov: apply needed compil=
er option unconditionally in CFLAGS_KCOV)
Merging alpha/alpha-next (1523226edda5 alpha: Use str_yes_no() helper in pc=
i_dac_dma_supported())
Merging arm/for-next (8dd85887ad83 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (db13de60e11b Merge branches 'for-next/docs', '=
for-next/selftests' and 'for-next/vdso' into for-next/core)
Merging arm-perf/for-next/perf (e480898e767c drivers/perf: hisi: Support PM=
Us with no interrupt)
Merging arm-soc/for-next (1cc98e294035 Merge branch 'arm/fixes' into for-ne=
xt)
Merging amlogic/for-next (d73967eca9ba Merge branch 'v6.18/drivers' into fo=
r-next)
Merging asahi-soc/asahi-soc/for-next (0b6344c954fc Merge branch 'apple-soc/=
drivers-6.18' into asahi-soc/for-next)
Merging at91/at91-next (cccff1ea4590 Merge branch 'microchip-soc' into at91=
-next)
Merging bmc/for-next (b4fa4985636c Merge branches 'aspeed/drivers', 'aspeed=
/dt', 'nuvoton/arm/dt' and 'nuvoton/arm64/dt' into for-next)
Merging broadcom/next (cd0e2df0bb0c Merge branch 'drivers/next' into next)
Merging cix/for-next (fad32e8ac460 arm64: dts: cix: add DT nodes for all I2=
C and I3C ports for sky1)
Merging davinci/davinci/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging drivers-memory/for-next (1aba1eab0bd8 dt-bindings: memory: Update b=
rcmstb-memc-ddr binding with older chips)
Merging fsl/soc_fsl (bcfdcd4bf4cc dt-bindings: soc: fsl: qe: Add support of=
 IRQ in QE GPIO)
Merging imx-mxs/for-next (d34bbb45b57c Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (6cbb623586d5 Merge branches 'v6.16-next/arm32', =
'v6.16-next/dts32', 'v6.16-next/dts64' and 'v6.16-next/soc' into for-next)
Merging mvebu/for-next (23f5a19d1fa3 Merge branch 'mvebu/fixes' into mvebu/=
for-next)
Merging omap/for-next (aef3e8287711 Merge branch 'omap-for-v6.18/soc' into =
tmp/omap-next-20250908.143120)
Merging qcom/for-next (f33301412d03 Merge branches 'arm32-defconfig-for-v6.=
18', 'arm32-for-6.18', 'arm64-defconfig-for-6.18', 'arm64-for-6.18', 'clk-f=
ixes-for-6.17', 'clk-for-6.18', 'drivers-fixes-for-6.17' and 'drivers-for-6=
.18' into for-next)
Merging renesas/next (fb4033e24970 Merge branch 'renesas-dts-for-v6.18' int=
o renesas-next)
Merging reset/reset/next (1527cd3b89f0 reset: remove unneeded 'fast_io' par=
ameter in regmap_config)
Merging rockchip/for-next (02761df1f09e Merge branch 'v6.17-armsoc/dtsfixes=
' into for-next)
Merging samsung-krzk/for-next (e414334883f4 Merge branch 'next/dt' into for=
-next)
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
Merging sunxi/sunxi/for-next (0239b6f7bfc4 Merge branches 'sunxi/fixes-for-=
6.17' and 'sunxi/dt-for-6.18' into sunxi/for-next)
Merging tee/next (8b8aefa5a5c7 Merge branch 'tee_prot_dma_buf_for_v6.18' in=
to next)
Merging tegra/for-next (499b75defe56 Merge branch for-6.17/arm64/defconfig =
into for-next)
Merging thead-dt/thead-dt-for-next (dfa743da83ab MAINTAINERS: Add RISC-V T-=
HEAD SoC patchwork)
Merging ti/ti-next (b6d89e53defc Merge branches 'ti-k3-dts-next' and 'ti-dr=
ivers-soc-next' into ti-next)
Merging xilinx/for-next (91cadb7d8981 Merge branch 'zynqmp/soc' into for-ne=
xt)
Merging clk/clk-next (54f5212c8f21 Merge branch 'clk-cleanup' into clk-next)
Merging clk-imx/for-next (c78865241ecf MAINTAINERS: Update i.MX Clock Entry)
Merging clk-renesas/renesas-clk (09e3a0467375 clk: renesas: r9a09g077: Add =
Ethernet Subsystem core and module clocks)
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
Merging openrisc/for-next (f0eedcf22581 openrisc: Replace __ASSEMBLY__ with=
 __ASSEMBLER__ in non-uapi headers)
Merging parisc-hd/for-next (89f686a0fb6e parisc: Revise __get_user() to pro=
be user read access)
Merging powerpc/next (46104a7d3ccd kbuild: Add missing $(objtree) prefix to=
 powerpc crtsavres.o artifact)
Merging risc-v/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging riscv-dt/riscv-dt-for-next (acc211539c81 riscv: dts: microchip: add=
 a device tree for Discovery Kit)
Merging riscv-soc/riscv-soc-for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging s390/for-next (0a61c48b2c13 Merge branch 'fixes' into for-next)
Merging sh/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (fc9ed2f6589d um: Replace __ASSEMBLY__ with __ASSEMBLER__ =
in the usermode headers)
Merging xtensa/xtensa-for-next (5d5f08fd0cd9 xtensa: simdisk: add input siz=
e check in proc_write_simdisk)
Merging fs-next (9a8d53a67579 Merge branch 'for-next' of https://git.kernel=
.org/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (8990f1983843 Merge branch 'rework/ringbuffer-kunit=
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
Merging v4l-dvb/next (39d919edea1d media: qcom: camss: remove a check for u=
navailable CAMSS endpoint)
Applying: fix up for "media: cadence: cdns-csi2rx: Support multiple pixels =
per clockcycle"
Merging v4l-dvb-next/master (adc218676eef Linux 6.12)
Merging pm/linux-next (f19d13d0c58f Merge branch 'acpi-processor' into linu=
x-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (3e681899cc6e cpufreq: mediatek:=
 avoid redundant conditions)
Merging cpupower/cpupower (357d1fc38aad cpupower: Allow control of boost fe=
ature on non-x86 based systems with boost support.)
Merging devfreq/devfreq-next (eddb5ba91b28 PM / devfreq: rockchip-dfi: add =
support for LPDDR5)
Merging pmdomain/next (b283b70967c0 pmdomain: amlogic: Add support for S6 S=
7 S7D power domains controller)
Merging opp/opp/linux-next (05db35963eef OPP: Add support to find OPP for a=
 set of keys)
Merging thermal/thermal/linux-next (59cc5d656ca4 drivers/thermal/qcom/lmh: =
Fix incorrect error message)
Merging rdma/for-next (2aa35b24ad12 RDMA/erdma: Use vcalloc() instead of vz=
alloc())
Merging net-next/main (4ea83b757351 Merge branch '200GbE' of git://git.kern=
el.org/pub/scm/linux/kernel/git/tnguy/next-queue)
Merging bpf-next/for-next (5b6d6fe1ca7b Merge branch 'bpf-next/net' into fo=
r-next)
Merging ipsec-next/master (9f4f591cd5a4 xfrm: xfrm_user: use strscpy() for =
alg_name)
Merging mlx5-next/mlx5-next (ff97bc38be34 net/mlx5: Add RS FEC histogram in=
frastructure)
Merging netfilter-next/main (f3883b1ea5a8 selftests: net: move netlink-dump=
s back to progs)
Merging ipvs-next/main (f3883b1ea5a8 selftests: net: move netlink-dumps bac=
k to progs)
Merging bluetooth/master (6c7e4432e56e Bluetooth: bcsp: receive data only i=
f registered)
Merging wireless-next/for-next (e3ac93e9d916 wifi: mwifiex: fix double free=
 in mwifiex_send_rgpower_table())
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/fw=
/uefi.c
Merging ath-next/for-next (ee6960bdbb74 Merge branch 'net-airoha-add-ppe-su=
pport-for-rx-wlan-offload')
Merging iwlwifi-next/next (bc4a45f8da56 wifi: iwlwifi: mld: CHANNEL_SURVEY_=
NOTIF is always supported)
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (1b2dd17dd514 mtd: core: skip badblocks increment for =
blocks already known bad)
Merging nand/nand/next (c9f62564252c mtd: rawnand: s3c2410: Drop driver (no=
 actual S3C64xx user))
Merging spi-nor/spi-nor/next (17926cd770ec mtd: spi-nor: core: avoid odd le=
ngth/address writes in 8D-8D-8D mode)
Merging crypto/master (886d69812082 crypto: hisilicon/zip - add hashjoin, g=
ather, and UDMA data move features)
Merging libcrypto/libcrypto-next (54e7bb6ade8a wireguard: kconfig: simplify=
 crypto kconfig selections)
Merging drm/drm-next (4bf83dd6e3b3 Merge tag 'drm-intel-gt-next-2025-09-01'=
 of https://gitlab.freedesktop.org/drm/i915/kernel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/nova/file.rs
Merging drm-exynos/for-linux-next (d07e4c00696f drm/exynos: dsi: add suppor=
t for exynos7870)
Applying: Revert "drm/exynos: dsi: add support for exynos7870"
Merging drm-misc/for-linux-next (f50b969bafaf drm/bridge: ite-it6263: Suppo=
rt HDMI vendor specific infoframe)
Merging amdgpu/drm-next (0855c764f7e6 drm/amdgpu/vcn: Change amdgpu_vcn_sw_=
fini return to void)
Merging drm-intel/for-linux-next (b69f8c496ea0 drm/i915: Remove todo and co=
mments about struct_mutex)
  7ea3baa6efe4 ("drm/i915/power: fix size for for_each_set_bit() in abox it=
eration")
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_tc=
.c
Merging drm-msm/msm-next (6341516bc25c drm/msm/a6xx: Enable IFPC on A750 GP=
U)
Merging drm-msm-lumag/msm-next-lumag (a643abb67379 drm/msm/mdp4: remove the=
 use of dev_err_probe())
Merging drm-rust/drm-rust-next (6b35936f058d rust: drm: gem: Drop Object::S=
IZE)
CONFLICT (content): Merge conflict in rust/kernel/alloc/allocator.rs
CONFLICT (content): Merge conflict in rust/kernel/alloc/allocator_test.rs
CONFLICT (content): Merge conflict in rust/kernel/alloc/kbox.rs
Merging drm-nova/nova-next (93296e9d9528 gpu: nova-core: vbios: store refer=
ence to Device where relevant)
Merging drm-xe/drm-xe-next (0d40ea784304 drm/xe/guc: Recommend GUC v70.49.4=
 for PTL, BMG)
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (6d85b579a9ca fbdev: Use string choices helpers)
Merging regmap/for-next (298834573197 Merge remote-tracking branch 'regmap/=
for-6.18' into regmap-next)
Merging sound/for-next (7095d688de38 ASoC: tas2781: Add tas2118, tas2x20, t=
as5825 support)
Merging ieee1394/for-next (a4bac55d99d3 firewire: core: code refactoring wh=
ether root node is cycle master capable)
Merging sound-asoc/for-next (7e897d544ac4 Merge remote-tracking branch 'aso=
c/for-6.18' into asoc-next)
Merging modules/modules-next (5eb4b9a4cdbb params: Replace deprecated strcp=
y() with strscpy() and memcpy())
Merging input/next (d5ad57fc428c dt-bindings: input: qcom,pm8941-pwrkey: Fi=
x formatting of descriptions)
Merging block/for-next (9a1282c6de24 Merge branch 'for-6.18/block' into for=
-next)
Merging device-mapper/for-next (4466dd3d719c dm-pcache: use int type to sto=
re negative error codes)
Merging libata/for-next (692173de3032 dt-bindings: ata: imx: Document 'targ=
et-supply')
Merging pcmcia/pcmcia-next (4a81f78caa53 pcmcia: Add error handling for add=
_interval() in do_validate_mem())
Merging mmc/next (c2ef7a03f5c8 mmc: sdio: Drop dev_pm_domain_detach() call)
Merging mfd/for-mfd-next (a4eb677652a5 mfd: core: Increment of_node's refco=
unt before linking it to the platform device)
$ git reset --hard HEAD^
Merging next-20250903 version of mfd
Merging backlight/for-backlight-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging battery/for-next (cc2ec444e461 power: supply: WQ_PERCPU added to al=
loc_workqueue users)
Merging regulator/for-next (661fa9d11fad Merge remote-tracking branch 'regu=
lator/for-6.18' into regulator-next)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging security/next (67fe7be7dffd MAINTAINERS: add the associated Rust he=
lper to the CREDENTIALS section)
Merging apparmor/apparmor-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging integrity/next-integrity (a4cc916bf572 lib/digsig: Use SHA-1 librar=
y instead of crypto_shash)
Merging selinux/next (084f547bd8e3 memfd,selinux: call security_inode_init_=
security_anon())
Merging smack/next (6ddd169d0288 smack: fix kernel-doc warnings for smk_imp=
ort_valid_label())
Merging tomoyo/master (038d61fd6422 Linux 6.16)
Merging tpmdd/next (be48bcf004f9 Merge tag 'for-6.17-rc2-tag' of git://git.=
kernel.org/pub/scm/linux/kernel/git/kdave/linux)
Merging watchdog/master (f777d1112ee5 Merge tag 'vfs-6.17-rc6.fixes' of git=
://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs)
Merging iommu/next (86052eb4519c Merge branches 'fixes', 'apple/dart', 'ti/=
omap', 'riscv' and 'amd/amd-vi' into next)
Merging audit/next (73ef7e24ee64 Automated merge of 'dev' into 'next')
Merging devicetree/for-next (b132e9745e8c dt-bindings: dp-connector: descri=
be separate DP and AUX lines)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/ven=
dor-prefixes.yaml
Merging dt-krzk/for-next (7ee0f223cabe arm64: dts: toshiba: tmpv7708: Add d=
efault GIC address cells)
Merging mailbox/for-next (5378bdf6a611 mailbox/pcc: support mailbox managem=
ent of the shared buffer)
Merging spi/for-next (2e80eaa2b3d4 Merge remote-tracking branch 'spi/for-6.=
18' into spi-next)
Merging tip/master (78eebbd6b628 Merge branch into tip/master: 'x86/tdx')
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
Merging kvm-x86/next (ecbcc2461839 Merge branches 'fixes', 'generic', 'misc=
', 'mmu', 'selftests', 'svm' and 'vmx')
Merging xen-tip/linux-next (f770c3d85868 xen/manage: Fix suspend error path)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (570129c58347 Merge branch 'for-6.18' into for-=
next)
Merging sched-ext/for-next (88485afa2d14 Merge branch 'for-6.18' into for-n=
ext)
Merging drivers-x86/for-next (f490253809c8 platform/x86/amd/pmf: Remove red=
undant ternary operators)
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
Merging driver-core/driver-core-next (4c48aed6dfcd driver core: auxiliary b=
us: Optimize logic of auxiliary_match_id())
Merging usb/usb-next (6f9871b3e8c3 usb: gadget: tegra-xudc: Remove redundan=
t ternary operators)
Merging thunderbolt/next (b06578497e6f thunderbolt: Use string choices help=
ers)
Merging usb-serial/usb-next (b3a333f8ac16 USB: serial: oti6858: remove extr=
anenous ; after comment)
Merging tty/tty-next (e81783899d7d Revert "m68k: make HPDCA and HPAPCI bool=
s")
Merging char-misc/char-misc-next (7704e6be4ed2 mei: hook mei_device on clas=
s device)
CONFLICT (content): Merge conflict in rust/kernel/lib.rs
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (811e07b1812a coresight: trbe: Return NULL pointer f=
or allocation failures)
Merging fastrpc/for-next (b52ebc078bb6 misc: fastrpc: add support for gdsp =
remoteproc)
Merging fpga/for-next (4f156ee58bb8 fpga: zynq_fpga: Fix the wrong usage of=
 dma_map_sgtable())
Merging icc/icc-next (500160770cb2 Merge branch 'icc-glymur' into icc-next)
Merging iio/togreg (19dc57d72d2b iio: adc: ad7124: use clamp())
Merging phy-next/next (356590cd61cf phy: renesas: rcar-gen3-usb2: Fix ID ch=
eck logic with VBUS valid)
Merging soundwire/next (88f5d2a477ec soundwire: Use min() to improve code)
Merging extcon/extcon-next (e6f75eba4a86 extcon: ptn5150: Support USB role =
switch via connector fwnode)
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
Merging cgroup/for-next (8bfb4580b4be Merge branch 'for-6.18' into for-next)
Merging scsi/for-next (27e3ac435788 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (fea2bfde3d52 scsi: bfa: Remove self-assignment c=
ode)
Merging vhost/linux-next (c67e16d30dca tools headers: Sync uapi/linux/vhost=
.h with the kernel source)
Merging rpmsg/for-next (03b95f41544d Merge branches 'rproc-next' and 'rpmsg=
-next' into for-next)
Merging gpio-brgl/gpio/for-next (52bdd69671b6 gpio: loongson-64bit: Remove =
unneeded semicolon)
Merging gpio-intel/for-next (3712ce9fa501 gpiolib: acpi: Ignore touchpad wa=
keup on GPD G1619-05)
Merging pinctrl/for-next (74eaab4da859 Merge branch 'devel' into for-next)
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
Merging at24/at24/for-next (8f5ae30d69d7 Linux 6.17-rc1)
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
Merging cxl/next (58b3de3bf523 cxl/acpi: Rename CFMW coherency restrictions)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (02eb7a8eee20 efi: add API doc entry for ovmf_debug_log)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (f10c36f90547 Merge branch 'slab/for-6.18/sheave=
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
Merging rust-pin-init/pin-init-next (8f5ae30d69d7 Linux 6.17-rc1)
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

--Sig_/_gv..SId/9yOxmrfAXcGHrE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmjBJhsACgkQAVBC80lX
0GxAQAf+I48+O0E1gVqVm3VCJ/S2xm14h07VQHDcbDVPvvsDk94PWIG8fZcxmJaN
nn2cWVFMb9D2lMzAGe/3aTU3hVwske1r78sLTFkeCwtPeeX1KdKjiudYX1lSpUNT
gK4xWC7PWgk4rD3d+RIqkGCoD/bqi/raGDPDkUHZxMXI7dSGRG+EUB7G71dUslal
LudVmFnq/FawiQu2BVePVw5Wz0WLJWylakIF1CGyuq6AvaQpqUzKOMm/8XMQ3UPT
GDCiA4hwcnC+1OasTh/wvHQHuYbq2YPSo8OTjkR85flxC8zfDHDO9d1LKbiU2LPd
sKUWKDdTYU3fqlITvIGqRkknMAZ6tA==
=WXzs
-----END PGP SIGNATURE-----

--Sig_/_gv..SId/9yOxmrfAXcGHrE--

