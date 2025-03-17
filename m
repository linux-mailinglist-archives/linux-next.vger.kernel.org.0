Return-Path: <linux-next+bounces-5824-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C0FA65000
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 13:59:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66EBF7A6B6B
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 12:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0A623A562;
	Mon, 17 Mar 2025 12:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XlA+f4X/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7C11A3056;
	Mon, 17 Mar 2025 12:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742216381; cv=none; b=LV2t7q54AeNC3Do2ZTp8jy80e38xiBHX+5dFfDUgWHJopl2HWft2JLNxOBdcY5sXFwGxwu3+j+yX921ZIq4M1Ml5YYdIXc13Qz2ZTVlr2Zkl+W+EBSmsNINfxkgGiE8huzURbbErHRaf3WrdD2ZnBrd3UmNIoif1kWDS+exCvvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742216381; c=relaxed/simple;
	bh=rZa0j4f8m1HI6ijpDRkher8u4qHzlmvW0WfQ7eL9h68=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OWNvoUwzUOQc41EKWND9+ii1RGj4BjZoIIA6UTQ5h3PbTX2pFuMEWiTo7/iQb7MGJd3YMh1DS00v6JK1aByJSlD3FUEM1wOEmeYZ+sGdwf/utJ1VmfZHKHA2jadjuCnBakO+F7zRQ9tD4d7ZpGL4D36XF3KD58/PslkM0X+HooE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XlA+f4X/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742216375;
	bh=2CQx2dIH1SEf80nLX32PBWU5OLjySIidFnEkHlRbDfU=;
	h=Date:From:To:Cc:Subject:From;
	b=XlA+f4X/6ESYcVuOB71sSeVHjeOkyL86hoIygdaWyKvz/YwnMUJzrLVWtI7XcfTkM
	 TO9hdqjV3FzuQ+YpmSSQzC7On+C9gJimkOXvR6+tlwISy4XI726I4DM6CQLI4izmZU
	 ia00RCiCMz90rr8d6Ll5BBhBGC3RbhlS14iXFXILICWUxM0WdNEioDoN7zjsa3VqXr
	 a4K1bmu2q+CR1QumKhbR/nchAZYDn3RtpyKxTDgo0FgTUk5pX5gDy5y9905+FVEIzs
	 9w8fzzMBf3Y8TSg23bwuTpj449EV0hUDQiTJ0ZR8fE/pijagSlJzlFygiFQ6FGBTfa
	 Rq1RXwarVqjiQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGZn30C8Gz4wcw;
	Mon, 17 Mar 2025 23:59:35 +1100 (AEDT)
Date: Mon, 17 Mar 2025 23:59:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 17
Message-ID: <20250317235934.64c5ec9a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yt/adQrD+nt4ogM++TtjJzq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yt/adQrD+nt4ogM++TtjJzq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250314:

The vfs-brauner tree gained a build failure for which I reverted a commit.

The arm-perf tree gained a build failure so I used the version from
next-20250314.

The backlight tree gained a conflict against the arm-soc-fixes tree.

The tip tree still had its build failure so I used the version from
next-20250303.

The kvm-arm tree gained conflicts against the arm64 tree.

The char-misc tree gained a conflict against the regulator-fixes tree.

The pinctrl tree lost its build failure.

The kunit-next tree gained a conflict against the net-next tree.

The rust tree gained conflicts against Linus' and the kbuild trees and
the final resolutions presumably caused the build failure so I used the
version from next-20250314.

The kspp tree gained conflicts against the kunit-next and mm trees.

Non-merge commits (relative to Linus' tree): 10409
 10386 files changed, 551332 insertions(+), 204998 deletions(-)

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

I am currently merging 388 trees (counting Linus' and 147 trees of bug
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
Merging origin/master (d1275e99d1c4 Merge tag 'media/v6.14-3' of git://git.=
kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media)
Merging fixes/fixes (fac04efc5c79 Linux 6.13-rc2)
Merging ext4-fixes/fixes (4bbf9020becb Linux 6.13-rc4)
Merging vfs-brauner-fixes/vfs.fixes (986a6f5eacb9 vboxsf: Add __nonstring a=
nnotations for unterminated strings)
Merging fscrypt-current/for-current (2014c95afece Linux 6.14-rc1)
Merging fsverity-current/for-current (2014c95afece Linux 6.14-rc1)
Merging btrfs-fixes/next-fixes (e83be4ca3b94 Merge branch 'misc-6.14' into =
next-fixes)
Merging vfs-fixes/fixes (bdb43af4fdb3 qibfs: fix _another_ leak)
Merging erofs-fixes/fixes (6422cde1b0d5 erofs: use buffered I/O for file-ba=
cked mounts by default)
Merging nfsd-fixes/nfsd-fixes (4990d098433d NFSD: Fix CB_GETATTR status fix)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (228a1157fb9f Merge tag '6.13-rc-part1-SM=
B3-client-fixes' of git://git.samba.org/sfrench/cifs-2.6)
Merging bcachefs/for-next (3d84872adbda bcachefs: use sha256() instead of c=
rypto_shash API)
Merging fscrypt/for-next (13dc8eb90067 fscrypt: mention init_on_free instea=
d of page poisoning)
Merging btrfs/for-next (95a5bce4d0c9 Merge branch 'for-next-next-v6.14-2025=
0314' into for-next-20250314)
Merging ceph/master (3981be13ec1b ceph: exchange hardcoded value on NAME_MA=
X)
Merging cifs/for-next (7c064a69d12c smb: client: Fix netns refcount imbalan=
ce causing leaks and use-after-free)
Merging configfs/for-next (84147f4e84c4 configfs: improve item creation per=
formance)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (a3672304abf2 dlm: fix error if active rsb is not hashed)
Merging erofs/dev (f81398b33aea erofs: enable 48-bit layout support)
Merging exfat/dev (e4b343c1706f exfat: remove count used cluster from exfat=
_statfs())
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (82b6a8dd857d Merge reverts for HSM page fault events=
.)
Merging ext4/dev (9e28059d5664 ext4: introduce linear search for dentries)
Merging f2fs/dev (c60b556bfe0a f2fs: fix to avoid atomicity corruption of a=
tomic file)
Merging fsverity/for-next (a19bcde49998 Revert "fsverity: relax build time =
dependency on CRYPTO_SHA256")
Merging fuse/for-next (bea8ae66d5e6 fuse: Increase FUSE_NAME_MAX to PATH_MA=
X)
Merging gfs2/for-next (951d701ef1bb gfs2: Fix a NULL vs IS_ERR() bug in gfs=
2_find_jhead())
Merging jfs/jfs-next (a8dfb2168906 jfs: add index corruption check to DT_GE=
TPAGE())
Merging ksmbd/ksmbd-for-next (5e8ad31dad38 ksmbd: Use str_read_write() and =
str_true_false() helpers)
Merging nfs/linux-next (7eb172143d55 Linux 6.14-rc5)
Merging nfs-anna/linux-next (9084ed79ddaa lsm,nfs: fix memory leak of lsm_c=
ontext)
Merging nfsd/nfsd-next (26a80762153b NFSD: Add a Kconfig setting to enable =
delegated timestamps)
Merging ntfs3/master (8b12017c1b95 fs/ntfs3: Remove unused ntfs_flush_inode=
s)
Merging orangefs/for-next (96319dacaf15 orangefs: Constify struct kobj_type)
Merging overlayfs/overlayfs-next (c8b359dddb41 ovl: Filter invalid inodes w=
ith missing lookup function)
Merging ubifs/next (69146a8c893f ubi: ubi_get_ec_info: Fix compiling error =
'cast specifies array type')
Merging v9fs/9p-next (44ca5412b274 9p/net: return error on bogus (longer th=
an requested) replies)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (a40830266566 Merge branch 'xfs-6.15-merge' into for-n=
ext)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging vfs-brauner/vfs.all (ac0200d71bca Merge branch 'vfs-6.15.orangefs' =
into vfs.all)
Merging vfs/for-next (2e72b1e0aac2 Merge branch 'work.d_revalidate' into fo=
r-next)
Merging mm-hotfixes/mm-hotfixes-unstable (34c830abb215 mm: page_isolation: =
avoid calling folio_hstate() without hugetlb_lock)
Merging fs-current (822b79b954ef Merge branch 'fixes' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging kbuild-current/fixes (80e54e84911a Linux 6.14-rc6)
Merging arc-current/for-curr (78d4f34e2115 Linux 6.13-rc3)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (f7edb07ad7c6 Fix mmu notifiers for rang=
e-based invalidates)
Merging arm-soc-fixes/arm/fixes (45d5fe1c53ba ARM: davinci: da850: fix sele=
cting ARCH_DAVINCI_DA8XX)
Merging davinci-current/davinci/for-current (2014c95afece Linux 6.14-rc1)
Merging drivers-memory-fixes/fixes (304e6c02b76f memory: omap-gpmc: drop no=
 compatible check)
  304e6c02b76f ("memory: omap-gpmc: drop no compatible check")
Merging sophgo-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging m68k-current/for-linus (bb2e0fb1e6aa m68k: libgcc: Fix lvalue abuse=
 in umul_ppmm())
Merging powerpc-fixes/fixes (eff2eb592efd cxl: Fix cross-reference in docum=
entation and add deprecation warning)
Merging s390-fixes/fixes (b4a1dec11793 s390/ftrace: Fix return address reco=
very of traced function)
Merging net/main (4003c9e78778 Merge tag 'net-6.14-rc7' of git://git.kernel=
.org/pub/scm/linux/kernel/git/netdev/net)
Merging bpf/master (6ccf6adb05d0 xsk: Fix __xsk_generic_xmit() error code w=
hen cq is full)
Merging ipsec/master (0aae2867aa60 xfrm_output: Force software GSO only in =
tunnel mode)
Merging netfilter/main (2409fa66e29a Merge tag 'nf-25-03-13' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/netfilter/nf)
Merging ipvs/main (1438f5d07b9a rtnetlink: fix netns leak with rtnl_setlink=
())
Merging wireless/for-next (8ae227f8a774 wifi: mac80211: fix MPDU length par=
sing for EHT 5/6 GHz)
Merging ath/for-current (3640dbc1f75c wifi: iwlwifi: Fix A-MSDU TSO prepara=
tion)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (556f93b90c18 RDMA/mlx5: Handle errors returned f=
rom mlx5r_ib_rate())
Merging sound-current/for-linus (de69d56daac6 Merge tag 'asoc-fix-v6.14-rc6=
' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for=
-linus)
Merging sound-asoc-fixes/for-linus (de74ec718e07 ASoC: simple-card-utils: D=
on't use __free(device_node) at graph_util_parse_dai())
Merging regmap-fixes/for-linus (32ffed055dce regmap-irq: Add missing kfree(=
))
Merging regulator-fixes/for-linus (2c7a50bec495 regulator: check that dummy=
 regulator has been probed before using it)
Merging spi-fixes/for-linus (91cf42c63f2d spi: microchip-core: prevent RX o=
verflows when transmit size > FIFO size)
Merging pci-current/for-linus (2014c95afece Linux 6.14-rc1)
Merging driver-core.current/driver-core-linus (80e54e84911a Linux 6.14-rc6)
Merging tty.current/tty-linus (0ad2507d5d93 Linux 6.14-rc3)
Merging usb.current/usb-linus (f2865c6300d7 usb: typec: tcpm: fix state tra=
nsition for SNK_WAIT_CAPABILITIES state in run_state_machine())
Merging usb-serial-fixes/usb-linus (18e0885bd2ca USB: serial: ftdi_sio: add=
 support for Altera USB Blaster 3)
Merging phy/fixes (7eb172143d55 Linux 6.14-rc5)
Merging staging.current/staging-linus (2014c95afece Linux 6.14-rc1)
Merging iio-fixes/fixes-togreg (2156789f74ea iio: adc: rockchip: Fix clock =
initialization sequence)
Merging counter-current/counter-current (c0c9c7343466 counter: microchip-tc=
b-capture: Fix undefined counter channel state on probe)
Merging char-misc.current/char-misc-linus (2dc25093218f Merge tag 'counter-=
fixes-for-6.14' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/wbg/c=
ounter into char-misc-linus)
Merging soundwire-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging thunderbolt-fixes/fixes (502843396ec2 thunderbolt: Prevent use-afte=
r-free in resume from hibernate)
Merging input-current/for-linus (fd10709e28d2 MAINTAINERS: Remove myself fr=
om the goodix touchscreen maintainers)
Merging crypto-current/master (9d4f8e54cef2 rhashtable: Fix rhashtable_try_=
insert test)
Merging vfio-fixes/for-linus (09dfc8a5f2ce vfio/pci: Fallback huge faults f=
or unaligned pfn)
Merging kselftest-fixes/fixes (a64dcfb451e2 Linux 6.14-rc2)
Merging dmaengine-fixes/fixes (7eb172143d55 Linux 6.14-rc5)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (1dbf60277e9b Merge tag 'spi-nor/fixes-for-6.14=
-rc4' of https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux into mtd=
/fixes)
Merging mfd-fixes/for-mfd-fixes (68f860426d50 mfd: axp20x: AXP717: Fix miss=
ing IRQ status registers range)
Merging v4l-dvb-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging reset-fixes/reset/fixes (0e2268f88bb2 reset: mchp: sparx5: Fix for =
lan966x)
Merging mips-fixes/mips-fixes (6d48ad040757 MIPS: Ignore relocs against __e=
x_table for relocatable kernel)
Merging at91-fixes/at91-fixes (2014c95afece Linux 6.14-rc1)
Merging omap-fixes/fixes (c2a5f8c4f28f ARM: OMAP1: select CONFIG_GENERIC_IR=
Q_CHIP)
Merging kvm-fixes/master (ea9bd29a9c0d Merge tag 'kvm-x86-fixes-6.14-rcN.2'=
 of https://github.com/kvm-x86/linux into HEAD)
Merging kvms390-fixes/master (d8dfda5af0be KVM: s390: pv: fix race when mak=
ing a page secure)
Merging hwmon-fixes/hwmon (10fce7ebe888 hwmon: fix a NULL vs IS_ERR_OR_NULL=
() check in xgene_hwmon_probe())
Merging nvdimm-fixes/libnvdimm-fixes (265e98f72bac acpi: nfit: vmalloc-out-=
of-bounds Read in acpi_nfit_ctl)
Merging cxl-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging dma-mapping-fixes/dma-mapping-fixes (8324993f6030 dma-mapping: fix =
missing clear bdr in check_ram_in_range_map())
Merging drivers-x86-fixes/fixes (03fc0a2dc9f8 MAINTAINERS: Update Ike Panhc=
's email address)
Merging samsung-krzk-fixes/fixes (53517a70873c clk: samsung: update PLL loc=
ktime for PLL142XX used on FSD platform)
Merging pinctrl-samsung-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging devicetree-fixes/dt/linus (75f1f311d883 Revert "of: reserved-memory=
: Fix using wrong number of cells to get property 'alignment'")
Merging dt-krzk-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging scsi-fixes/fixes (f27a95845b01 scsi: ufs: core: bsg: Fix crash when=
 arpmb command fails)
Merging drm-fixes/drm-fixes (d1d77326f585 Merge tag 'drm-xe-fixes-2025-03-1=
3' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (a8045e46c508 drm/i915: Increa=
se I915_PARAM_MMAP_GTT_VERSION version to indicate support for partial mmap=
s)
Merging mmc-fixes/fixes (e51a349d2dcf mmc: atmel-mci: Add missing clk_disab=
le_unprepare())
Merging rtc-fixes/rtc-fixes (2014c95afece Linux 6.14-rc1)
Merging gnss-fixes/gnss-linus (0ad2507d5d93 Linux 6.14-rc3)
Merging hyperv-fixes/hyperv-fixes (73fe9073c0cc Drivers: hv: vmbus: Don't r=
elease fb_mmio resource in vmbus_free_mmio())
Merging risc-v-fixes/fixes (245aece3750d MAINTAINERS: Add myself as a riscv=
 reviewer)
Merging riscv-dt-fixes/riscv-dt-fixes (1b133129ad6b riscv: dts: starfive: F=
ix a typo in StarFive JH7110 pin function definitions)
Merging riscv-soc-fixes/riscv-soc-fixes (2014c95afece Linux 6.14-rc1)
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (2014c95afece Linux 6.14-rc1)
Merging gpio-brgl-fixes/gpio/for-current (dcb73cbaaeb3 gpio: cdev: use raw =
notifier for line state events)
Merging gpio-intel-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging pinctrl-intel-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging auxdisplay-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging kunit-fixes/kunit-fixes (a64dcfb451e2 Linux 6.14-rc2)
Merging memblock-fixes/fixes (180bbad69864 arch_numa: Restore nid checks be=
fore registering a memblock with a node)
Merging renesas-fixes/fixes (379c590113ce ARM: shmobile: smp: Enforce shmob=
ile_smp_* alignment)
Merging perf-current/perf-tools (42367eca7604 tools: Remove redundant quiet=
 setup)
Merging efi-fixes/urgent (cb16dfed0093 efi/libstub: Avoid physical address =
0x0 when doing random allocation)
Merging battery-fixes/fixes (98380110bd48 power: supply: axp20x_battery: Fi=
x fault handling for AXP717)
Merging iommufd-fixes/for-rc (2ca704f55e22 iommu/arm-smmu-v3: Improve uAPI =
comment for IOMMU_HW_INFO_TYPE_ARM_SMMUV3)
Merging rust-fixes/rust-fixes (a1eb95d6b5f4 scripts: generate_rust_analyzer=
: add uapi crate)
Merging w1-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging pmdomain-fixes/fixes (ef17b519088e pmdomain: amlogic: fix T7 ISP se=
cpower)
Merging i2c-host-fixes/i2c/i2c-host-fixes (2b22459792fc i2c: sis630: Fix an=
 error handling path in sis630_probe())
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (54493279312f Merge tag 'samsung-clk-fixes-6.14=
' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into clk-fi=
xes)
Merging pwrseq-fixes/pwrseq/for-current (2014c95afece Linux 6.14-rc1)
Merging thead-dt-fixes/thead-dt-fixes (40384c840ea1 Linux 6.13-rc1)
Merging ftrace-fixes/ftrace/fixes (2fa6a01345b5 tracing: Fix memory leak wh=
en reading set_event file)
Merging ring-buffer-fixes/ring-buffer/fixes (97937834ae87 ring-buffer: Upda=
te pages_touched to reflect persistent buffer content)
Merging trace-fixes/trace/fixes (a1a7eb89ca0b ftrace: Avoid potential divis=
ion by zero in function_stat_show())
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging tip-fixes/tip/urgent (5ee2723f963d Merge branch into tip/master: 's=
ched/urgent')
Merging slab-fixes/slab/for-next-fixes (dfd3df31c9db mm/slab/kvfree_rcu: Sw=
itch to WQ_MEM_RECLAIM wq)
Merging drm-msm-fixes/msm-fixes (73f69c6be2a9 drm/msm/dsi/phy: Do not overw=
ite PHY_CMN_CLK_CFG1 when choosing bitclk source)
Merging uml-fixes/fixes (96178631c3f5 um: convert irq_lock to raw spinlock)
Merging drm-misc-fixes/for-linux-next-fixes (c3e4a25602f8 drm/v3d: Set job =
pointer to NULL when the job's fence has an error)
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (80e54e84911a Linux 6.14-rc6)
Merging mm-nonmm-stable/mm-nonmm-stable (80e54e84911a Linux 6.14-rc6)
Merging mm/mm-everything (f8a756a99e52 foo)
Merging kbuild/for-next (e3de46f775ec rust: kbuild: skip `--remap-path-pref=
ix` for `rustdoc`)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (02ba09c8ab94 perf test stat_all_pmu.sh: Corre=
ctly check 'perf stat' result)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (2014c95afece Linux 6.14-rc1)
Merging asm-generic/master (9d48cc07d0d7 m68k/nommu: stop using GENERIC_IOM=
AP)
Merging alpha/alpha-next (1523226edda5 alpha: Use str_yes_no() helper in pc=
i_dac_dma_supported())
Merging arm/for-next (f520fab580c9 ARM: 9440/1: cacheinfo fix format field =
mask)
Merging arm64/for-next/core (b60cf0c4d94f Merge branch 'for-next/smt-contro=
l' into for-next/core)
Merging arm-perf/for-next/perf (a28f3cbfd11f perf/arm_cspmu: Add PMEVFILT2R=
 support)
$ git reset --hard HEAD^
Merging next-20250314 version of arm-perf
Merging arm-soc/for-next (69e7831ba231 Merge branch 'arm/fixes' into for-ne=
xt)
Merging amlogic/for-next (73e4ffb27bb8 Merge branch 'v6.15/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (00a97a7f66d2 Merge branch 'asahi-soc/=
soc' into asahi-soc/for-next)
Merging aspeed/for-next (bf8f48263c0e Merge remote-tracking branches 'aspee=
d/dt', 'aspeed/drivers', 'aspeed/fixes' and 'nuvoton/dt' into for-next)
Merging at91/at91-next (a8aab30697c5 Merge branch 'at91-dt' into at91-next)
Merging broadcom/next (bdac656f1bb5 Merge branch 'devicetree/fixes' into ne=
xt)
Merging davinci/davinci/for-next (58abc69e479c ARM: dts: ti: davinci: Align=
 GPIO hog name with bindings)
Merging drivers-memory/for-next (90a0fbaac4a5 memory: mtk-smi: Add ostd set=
ting for mt8192)
Merging imx-mxs/for-next (90453dc4dee2 Merge branch 'imx/dt64' into for-nex=
t)
Merging mediatek/for-next (a8a297e8bb3d Merge branch 'v6.14-next/soc' into =
for-next)
Merging mvebu/for-next (ed9c2b28ebef arm64: dts: marvell: Use preferred nod=
e names for "simple-bus")
Merging omap/for-next (065f3bd4f22b Merge branch 'omap-for-v6.15/dt' into t=
mp/omap-next-20250205.163245)
Merging qcom/for-next (e1b3b837e020 Merge branches 'arm32-for-6.15', 'arm64=
-defconfig-for-6.15', 'arm64-fixes-for-6.14', 'arm64-for-6.15', 'clk-fixes-=
for-6.14', 'clk-for-6.15', 'drivers-fixes-for-6.14' and 'drivers-for-6.15' =
into for-next)
Merging renesas/next (3ade232c98a8 Merge branch 'renesas-fixes-for-v6.14' i=
nto renesas-next)
Merging reset/reset/next (c361baf67200 reset: imx: fix incorrect module dev=
ice table)
Merging rockchip/for-next (7131dad5dba8 Merge branch 'v6.15-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (f0dbe0d40d08 Merge branch 'next/soc' into fo=
r-next)
Merging scmi/for-linux-next (dbbf6170bba6 Merge branch 'for-next/scmi/fixes=
', tags 'scmi-updates-6.15', 'juno-updates-6.15', 'ffa-updates-6.15' and 's=
mccc-update-6.15' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/sud=
eep.holla/linux into for-linux-next)
Merging sophgo/for-next (f047a9285f9f riscv: sophgo: dts: add cooling maps =
for Milk-V Pioneer)
Merging spacemit/for-next (5b90a3d6092d riscv: dts: spacemit: Add Milk-V Ju=
piter board device tree)
Merging stm32/stm32-next (65954899a157 arm64: dts: st: add stm32mp215f-dk b=
oard support)
Merging sunxi/sunxi/for-next (96b0934c0283 Merge branch 'sunxi/clk-for-6.15=
' into sunxi/for-next)
Merging tee/next (a7562ff02879 Merge branch 'optee_for_v6.14' into next)
Merging tegra/for-next (4e16110559c3 Merge branch for-6.15/arm64/dt into fo=
r-next)
Merging thead-dt/thead-dt-for-next (c95c1362e5bc riscv: dts: thead: Add mai=
lbox node)
Merging ti/ti-next (15b2ed044c78 Merge branch 'ti-k3-config-next' into ti-n=
ext)
Merging xilinx/for-next (d6ccf528cb3c Merge branch 'zynqmp/dt' into for-nex=
t)
Merging clk/clk-next (82f69876ef45 Merge branch 'clk-imx' into clk-next)
Merging clk-imx/for-next (06a61b5cb6a8 clk: imx8mp: inform CCF of maximum f=
requency of clocks)
Merging clk-renesas/renesas-clk (e1a098330ef0 clk: renesas: r9a09g047: Add =
clock and reset signals for the TSU IP)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (6bdbb73dc8d9 LoongArch: KVM: Fix GPA size=
 issue about VM)
Merging m68k/for-next (3c4e4ec957b6 m68k: setup: Remove size argument when =
calling strscpy())
Merging m68knommu/for-next (184815cc99d1 m68k: mm: Replace deprecated strnc=
py() with strscpy())
Merging microblaze/next (920354d7818b microblaze: Use of_property_present()=
 for non-boolean properties)
Merging mips/mips-next (a547dc46e393 MIPS: dec: Remove dec_irq_dispatch())
Merging openrisc/for-next (ea1413e5b53a rseq/selftests: Add support for Ope=
nRISC)
Merging parisc-hd/for-next (e822b8f01b40 parisc: led: Use scnprintf() to av=
oid string truncation warning)
Merging powerpc/next (861efb8a48ee powerpc/kexec: fix physical address calc=
ulation in clear_utlb_entry())
Merging risc-v/for-next (2014c95afece Linux 6.14-rc1)
Merging riscv-dt/riscv-dt-for-next (38818f7c9c17 riscv: dts: starfive: jh71=
10-pine64-star64: enable USB 3.0 port)
Merging riscv-soc/riscv-soc-for-next (2014c95afece Linux 6.14-rc1)
Merging s390/for-next (745a0de1a0b2 Merge branch 'features' into for-next)
CONFLICT (content): Merge conflict in arch/s390/include/asm/io.h
Merging sh/for-next (2014c95afece Linux 6.14-rc1)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (2d2b61ae38bd um: Remove unused asm/archparam.h header)
Merging xtensa/xtensa-for-next (dbef257ab7fa xtensa: ptrace: Remove zero-le=
ngth alignment array)
Merging fs-next (2ba7f9e7fdd5 Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (b6e2174ef49b Merge branch 'for-6.15-console-suspen=
d-api-cleanup' into for-next)
Merging pci/next (df90ab163b75 Merge branch 'pci/misc')
Merging pstore/for-next/pstore (5674609535ba pstore: Change kmsg_bytes stor=
age size to u32)
Merging hid/for-next (160957abbf99 Merge branch 'for-6.15/intel-ish' into f=
or-next)
Merging i2c/i2c/for-next (7a098757ac56 Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i2c-host/i2c/i2c-host (42c1c13f4b70 i2c: i801: Use MMIO if availabl=
e)
Merging i3c/i3c/next (2a785307e41b i3c: master: svc: Fix npcm845 DAA proces=
s corruption)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (dbcfcb239b3b hwmon: (dell-smm) Increment =
the number of fans)
Merging jc_docs/docs-next (2d38f5fe1a20 Documentation: dma-buf: heaps: Add =
heap name definitions)
Merging v4l-dvb/next (f2151613e040 media: pci: mgb4: include linux/errno.h)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (ca47140abd6f Merge branch 'thermal-intel' into linux=
-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (be4ae8c19492 cpufreq: tegra186:=
 Share policy per cluster)
Merging cpupower/cpupower (fffadbdd6b5a cpupower: Make lib versioning schem=
e more obvious and fix version link)
Merging devfreq/devfreq-next (f3253b23535f PM / devfreq: exynos: remove unu=
sed function parameter)
Merging pmdomain/next (dc9a897dbb03 pmdomain: thead: Add power-domain drive=
r for TH1520)
Merging opp/opp/linux-next (2014c95afece Linux 6.14-rc1)
Merging thermal/thermal/linux-next (ecb642900deb dt-bindings: thermal: Corr=
ect indentation and style in DTS example)
Merging rdma/for-next (0a924decd4a3 RDMA/rxe: Improve readability of ODP pa=
gefault interface)
CONFLICT (content): Merge conflict in drivers/infiniband/sw/rxe/rxe.c
Merging net-next/main (bfc6c67ec2d6 net/smc: use the correct ndev to find p=
netid by pnetid table)
CONFLICT (content): Merge conflict in fs/eventpoll.c
Merging bpf-next/for-next (722ce03eaed9 Merge branch 'bpf-next/try_alloc_pa=
ges' into for-next)
CONFLICT (content): Merge conflict in mm/page_owner.c
Applying: fix up for "memcg: Use trylock to access memcg stock_lock"
Merging ipsec-next/master (2e460eefbd44 xfrm: state: make xfrm_state_lookup=
_byaddr lockless)
Merging mlx5-next/mlx5-next (f550694e88b7 net/mlx5: Add IFC bits for PPCNT =
recovery counters group)
Merging netfilter-next/main (71ca3561c268 Merge branch 'mptcp-pm-code-reorg=
anisation')
Merging ipvs-next/main (4e41231249f4 Merge branch '100GbE' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/tnguy/next-queue)
Merging bluetooth/master (5c301fb00b84 Bluetooth: hci_vhci: Mark Sync Flow =
Control as supported)
Merging wireless-next/for-next (54be64fdf3ba wifi: iwlwifi: Fix uninitializ=
ed variable with __free())
CONFLICT (content): Merge conflict in net/wireless/nl80211.c
Merging ath-next/for-next (0e28ee106c46 Merge tag 'ath-next-20250305' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/ath/ath)
Merging wpan-next/master (a5d4d993fac4 dt-bindings: ieee802154: ca8210: Upd=
ate polarity of the reset pin)
Merging wpan-staging/staging (a5d4d993fac4 dt-bindings: ieee802154: ca8210:=
 Update polarity of the reset pin)
Merging mtd/mtd/next (2a6a44555f07 mtd: Fix error handling in mtd_device_pa=
rse_register() error path)
Merging nand/nand/next (ddc210cf8b8a mtd: rawnand: brcmnand: fix PM resume =
warning)
Merging spi-nor/spi-nor/next (93020292fea7 mtd: spi-nor: explicitly include=
 <linux/math64.h>)
Merging crypto/master (d2d072a313c1 crypto: testmgr - Remove NULL dst acomp=
 tests)
Merging drm/drm-next (d115a38f3c07 Merge tag 'drm-intel-gt-next-2025-02-26'=
 of https://gitlab.freedesktop.org/drm/i915/kernel into drm-next)
CONFLICT (content): Merge conflict in mm/memory.c
Applying: fix up for "drm/gpusvm: Add support for GPU Shared Virtual Memory"
Applying: fixup for "drm/xe: Add drm_pagemap ops to SVM"
Merging drm-exynos/for-linux-next (81a50378559b drm/exynos: Remove unnecess=
ary checking)
Merging drm-misc/for-linux-next (914ee6e730e1 drm/appletbdrm: Fix ref-count=
ing on dmadev)
Merging amdgpu/drm-next (eb6cdfb807d0 drm/amdgpu: Restore uncached behaviou=
r on GFX12)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
Merging drm-intel/for-linux-next (d115a38f3c07 Merge tag 'drm-intel-gt-next=
-2025-02-26' of https://gitlab.freedesktop.org/drm/i915/kernel into drm-nex=
t)
Merging drm-msm/msm-next (83ee6d2ec52f dt-bindings: display/msm: dsi-contro=
ller-main: Add missing minItems)
Merging drm-msm-lumag/msm-next-lumag (83ee6d2ec52f dt-bindings: display/msm=
: dsi-controller-main: Add missing minItems)
Merging drm-nova/nova-next (b28786b190d1 gpu: nova-core: add initial docume=
ntation)
Merging drm-xe/drm-xe-next (278469ff569e drm/xe/eustall: Fix a possible poi=
nter dereference after free)
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (95c7757266fa MAINTAINERS: Add contact info for fbde=
v packed pixel drawing)
Merging regmap/for-next (14b33926f576 Merge remote-tracking branch 'regmap/=
for-6.15' into regmap-next)
Merging sound/for-next (c2820405ba55 ALSA: usb-audio: Fix CME quirk for UF =
series keyboards)
Merging ieee1394/for-next (2014c95afece Linux 6.14-rc1)
Merging sound-asoc/for-next (d9a06936ee9e ASoC: sun4i-codec: add headphone =
dectection for)
Merging modules/modules-next (085c5e37427d module: Remove unnecessary size =
argument when calling strscpy())
Merging input/next (4d395cb071a3 Input: goodix_berlin - add support for Ber=
lin-A series)
Merging block/for-next (8fb5da8b1939 Merge branch 'for-6.15/io_uring' into =
for-next)
CONFLICT (content): Merge conflict in tools/testing/selftests/drivers/net/h=
w/Makefile
Merging device-mapper/for-next (45fc728515c1 dm: restrict dm device size to=
 2^63-512 bytes)
Merging libata/for-next (725ad0283033 ata: libata: Improve return value of =
atapi_check_dma())
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (4139badab0d8 mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (be2314746229 mfd: mt6397-core: Add mfd_cell for m=
t6359-accdet)
  7f3e3e7228bb ("dt-bindings: mfd: syscon: Add rk3528 QoS register compatib=
le")
Merging backlight/for-backlight-next (d1ebaf003a06 MAINTAINERS: Add entries=
 for Apple DWI backlight controller)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging battery/for-next (aae075a93f77 power: supply: pcf50633: Remove char=
ger)
Merging regulator/for-next (557b4c79dfeb Merge remote-tracking branch 'regu=
lator/for-6.15' into regulator-next)
Merging security/next (65b796acea1e mailmap: map Stephen Smalley's old emai=
l addresses)
Merging apparmor/apparmor-next (3e45553acb14 apparmor: Remove unused variab=
le 'sock' in __file_sock_perm())
Merging integrity/next-integrity (672a4c654a08 ima: limit the number of ToM=
ToU integrity violations)
Merging selinux/next (8af43b61c17e selinux: support wildcard network interf=
ace names)
Merging smack/next (a158a937d864 smack: recognize ipv4 CIPSO w/o categories)
Merging tomoyo/master (09fbf3d50205 Merge tag 'tomoyo-pr-20250211' of git:/=
/git.code.sf.net/p/tomoyo/tomoyo)
Merging tpmdd/next (4576ad38bb9b tpm, tpm_tis: Workaround failed command re=
ception on Infineon devices)
Merging watchdog/master (48a136639ec2 watchdog: aspeed: fix 64-bit division)
Merging iommu/next (f5a5f66e2791 Merge branches 'apple/dart', 'arm/smmu/upd=
ates', 'arm/smmu/bindings', 's390', 'core', 'intel/vt-d' and 'amd/amd-vi' i=
nto next)
Merging audit/next (2014c95afece Linux 6.14-rc1)
Merging devicetree/for-next (590f5d6752f7 of: Move of_prop_val_eq() next to=
 the single user)
CONFLICT (content): Merge conflict in drivers/of/of_private.h
Merging dt-krzk/for-next (854a080f0b73 loongarch: dts: remove non-existent =
DAC from 2k1000-ref)
Merging mailbox/for-next (d44ee3bd382d MAINTAINERS: add mailbox API's tree =
type and location)
Merging spi/for-next (7c51d2d7f82a Merge remote-tracking branch 'spi/for-6.=
15' into spi-next)
Merging tip/master (7bd346e10c48 Merge branch into tip/master: 'x86/sev')
CONFLICT (content): Merge conflict in arch/arm64/include/asm/vdso/compat_ge=
ttimeofday.h
CONFLICT (content): Merge conflict in arch/arm64/include/asm/vdso/vsyscall.h
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/vdso/gettime=
ofday.h
CONFLICT (content): Merge conflict in arch/riscv/include/asm/io.h
CONFLICT (content): Merge conflict in arch/s390/kernel/time.c
CONFLICT (content): Merge conflict in arch/x86/include/asm/vdso/getrandom.h
CONFLICT (content): Merge conflict in arch/x86/include/asm/vdso/gettimeofda=
y.h
CONFLICT (content): Merge conflict in arch/x86/kernel/paravirt.c
CONFLICT (content): Merge conflict in arch/x86/mm/pgtable.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_pmu.c
CONFLICT (content): Merge conflict in drivers/mailbox/mailbox.c
CONFLICT (content): Merge conflict in include/asm-generic/vdso/vsyscall.h
CONFLICT (content): Merge conflict in include/vdso/datapage.h
CONFLICT (content): Merge conflict in include/vdso/helpers.h
CONFLICT (content): Merge conflict in kernel/time/namespace.c
CONFLICT (content): Merge conflict in kernel/time/vsyscall.c
CONFLICT (add/add): Merge conflict in lib/vdso/datastore.c
CONFLICT (content): Merge conflict in lib/vdso/gettimeofday.c
CONFLICT (content): Merge conflict in net/core/dev.c
$ git reset --hard HEAD^
Merging next-20250303 version of tip
CONFLICT (content): Merge conflict in arch/riscv/include/asm/io.h
CONFLICT (content): Merge conflict in arch/x86/kernel/paravirt.c
CONFLICT (content): Merge conflict in arch/x86/mm/pgtable.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_pmu.c
CONFLICT (content): Merge conflict in drivers/mailbox/mailbox.c
CONFLICT (add/add): Merge conflict in lib/vdso/datastore.c
CONFLICT (content): Merge conflict in net/core/dev.c
[master 895f90f6f264] next-20250303/tip
Merging clockevents/timers/drivers/next (96bf4b89a6ab clocksource/drivers/s=
tm32-lptimer: Use wakeup capable instead of init wakeup)
Merging edac/edac-for-next (af1a78613133 Merge branch 'edac-drivers' into e=
dac-for-next)
Merging ftrace/for-next (440358f4f179 Merge tools/for-next)
CONFLICT (content): Merge conflict in include/linux/module.h
Merging rcu/next (467c890f2d1a Merge branches 'docs.2025.02.04a', 'lazypree=
mpt.2025.03.04a', 'misc.2025.03.04a', 'srcu.2025.02.05a' and 'torture.2025.=
02.05a')
Merging paulmck/non-rcu/next (87d07e135725 Merge branches 'lkmm.2025.02.25a=
', 'nolibc.2025.03.07a' and 'stop-machine.2025.03.11a' into HEAD)
Merging kvm/next (ea9bd29a9c0d Merge tag 'kvm-x86-fixes-6.14-rcN.2' of http=
s://github.com/kvm-x86/linux into HEAD)
Merging kvm-arm/next (b33c5fbb042c Merge branch 'kvm-arm64/pkvm-6.15' into =
kvmarm/next)
CONFLICT (content): Merge conflict in arch/arm64/kernel/cpufeature.c
CONFLICT (content): Merge conflict in arch/arm64/kernel/proton-pack.c
CONFLICT (content): Merge conflict in arch/arm64/kvm/arm.c
CONFLICT (content): Merge conflict in arch/arm64/kvm/hypercalls.c
CONFLICT (content): Merge conflict in drivers/perf/apple_m1_cpu_pmu.c
Merging kvms390/next (32239066776a KVM: s390: selftests: Streamline uc_skey=
 test to issue iske after sske)
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (ee4e778c5802 KVM: riscv: selftests: Allow=
 number of interrupts to be configurable)
Merging kvm-x86/next (c9ea48bb6ee6 Merge branch 'xen')
Merging xen-tip/linux-next (421d62f47b7a xen/pciback: Remove unused pcistub=
_get_pci_dev)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (1e5f94eb8ef7 Merge branch 'for-6.15' into for-=
next)
Merging sched-ext/for-next (d78027174482 Merge branch 'for-6.15' into for-n=
ext)
Merging drivers-x86/for-next (01db3d1ff43a platform/x86/amd/pmc: fix leak i=
n probe())
Merging chrome-platform/for-next (9fc83373f0ff platform/chrome: cros_ec_typ=
ec: Add support for setting USB mode via sysfs)
Merging chrome-platform-firmware/for-firmware-next (2014c95afece Linux 6.14=
-rc1)
Merging hsi/for-next (e3f88665a780 HSI: ssi_protocol: Fix use after free vu=
lnerability in ssi_protocol Driver Due to Race Condition)
Merging leds-lj/for-leds-next (7a3350495d9a leds: rgb: leds-qcom-lpg: Add s=
upport for 6-bit PWM resolution)
Merging ipmi/for-next (d082ecbc71e9 Linux 6.14-rc4)
Merging driver-core/driver-core-next (e01968420a99 MAINTAINERS: driver core=
: mark Rafael and Danilo as co-maintainers)
Applying: fix up for "rust: io: rename `io::Io` accessors"
Merging usb/usb-next (3a85c1011540 usb: host: cdns3: forward lost power inf=
ormation to xhci)
Merging thunderbolt/next (72cef52b353c thunderbolt: Make tb_tunnel_alloc_us=
b3() error paths consistent with the rest)
Merging usb-serial/usb-next (6a7713ec5337 USB: serial: mos7840: drop unused=
 defines)
Merging tty/tty-next (d2fa8e52cf91 serial: xilinx_uartps: Switch to use hrt=
imer_setup())
Merging char-misc/char-misc-next (64612eb92d0e Merge tag 'w1-drv-6.15' of s=
sh://gitolite.kernel.org/pub/scm/linux/kernel/git/krzk/linux-w1 into char-m=
isc-next)
CONFLICT (content): Merge conflict in drivers/regulator/dummy.c
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (5442d22da7db Coresight: Fix a NULL vs IS_ERR() bug =
in probe)
Merging fastrpc/for-next (2014c95afece Linux 6.14-rc1)
Merging fpga/for-next (e19890a0088b fpga: versal: remove incorrect of_match=
_ptr annotation)
Merging icc/icc-next (4cc004716977 Merge branch 'icc-sm8750' into icc-next)
Merging iio/togreg (8dbeb413806f doc: iio: ad7380: describe offload support)
Merging phy-next/next (f13bff25161b phy: rockchip-naneng-combo: Support rk3=
562)
Merging soundwire/next (08ae0d61c3d7 soundwire: take in count the bandwidth=
 of a prepared stream)
Merging extcon/extcon-next (7041ed0dde83 extcon: Drop explicit initializati=
on of struct i2c_device_id::driver_data to 0)
Merging gnss/gnss-next (0ad2507d5d93 Linux 6.14-rc3)
Merging vfio/next (384a530111c6 vfio/virtio: Enable support for virtio-bloc=
k live migration)
Merging w1/for-next (33c145297840 w1: w1_therm: w1: Use HWMON_CHANNEL_INFO =
macro to simplify code)
Merging spmi/spmi-next (092c49673431 spmi: Only use Hikey 970 SPMI controll=
er driver when ARM64)
Merging staging/staging-next (20a351c36afc staging: gpib: tnt4882 console m=
essaging cleanup)
Merging counter-next/counter-next (ba27a0247b71 counter: microchip-tcb-capt=
ure: Add support for RC Compare)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (656543989457 dmaengine: ptdma: Utilize the AE4DMA e=
ngine's multi-queue functionality)
CONFLICT (modify/delete): Documentation/devicetree/bindings/misc/atmel-ssc.=
txt deleted in HEAD and modified in dmaengine/next.  Version dmaengine/next=
 of Documentation/devicetree/bindings/misc/atmel-ssc.txt left in tree.
$ git rm -f Documentation/devicetree/bindings/misc/atmel-ssc.txt
Merging cgroup/for-next (6ebc743512cc Merge branch 'for-6.15' into for-next)
Merging scsi/for-next (6888bc9da224 Merge branch 'misc' into for-next)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/rockchip/rk3576.d=
tsi
CONFLICT (content): Merge conflict in drivers/scsi/scsi_debug.c
Merging scsi-mkp/for-next (e402ee093f74 scsi: core: Use a switch statement =
when attaching VPD pages)
Merging vhost/linux-next (9d8960672d63 vhost-scsi: Reduce response iov mem =
use)
Merging rpmsg/for-next (340bec0b725c Merge branch 'rproc-next' into for-nex=
t)
Merging gpio-brgl/gpio/for-next (2eb5dc9a4b0d gpio: da9055: use new line va=
lue setter callbacks)
Merging gpio-intel/for-next (e646f0dae7b0 gpiolib-acpi: Drop unneeded ERR_C=
AST() in __acpi_find_gpio())
Merging pinctrl/for-next (fde88c7bdbd6 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (0ee2261d08aa pinctrl: intel: drop repeated =
config dependency)
Merging pinctrl-renesas/renesas-pinctrl (abcdeb4e299a pinctrl: renesas: rza=
2: Fix missing of_node_put() call)
Merging pinctrl-samsung/for-next (701d0e910955 pinctrl: samsung: add suppor=
t for eint_fltcon_offset)
Merging pwm/pwm/for-next (6df320abbb40 dt-bindings: pwm: imx: Add i.MX93, i=
.MX94 and i.MX95 support)
Merging ktest/for-next (f3a30016e4b5 ktest.pl: Fix typo "accesing")
Merging kselftest/next (82ef781f24ac selftests/ftrace: add 'poll' binary to=
 gitignore)
Merging kunit/test (a64dcfb451e2 Linux 6.14-rc2)
Merging kunit-next/kunit (2e0cf2b32f72 kunit: tool: add test to check parsi=
ng late test plan)
CONFLICT (content): Merge conflict in lib/Makefile
Merging livepatching/for-next (8bd10336f1af Merge branch 'for-6.15/trivial'=
 into for-next)
Merging rtc/rtc-next (8a9b1751b26c rtc: pl031: document struct pl031_vendor=
_data members)
Merging nvdimm/libnvdimm-for-next (2318fa87f808 libnvdimm: Remove unused nd=
_attach_ndns)
Merging at24/at24/for-next (f25f405d250f eeprom: at24: Drop of_match_ptr() =
and ACPI_PTR() protections)
Merging ntb/ntb-next (c620f56c70eb MAINTAINERS: Update AMD NTB maintainers)
Merging seccomp/for-next/seccomp (8f19331384e6 seccomp: avoid the lock trip=
 seccomp_filter_release in common case)
Merging slimbus/for-next (2014c95afece Linux 6.14-rc1)
Merging nvmem/for-next (accd056fc20b dt-bindings: nvmem: Add compatible for=
 MSM8960)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (302580630301 hyperv: Add definitions for root p=
artition driver to hv headers)
Merging auxdisplay/for-next (67200d70e459 Merge patch series "auxdisplay: c=
harlcd: Refactor memory allocation")
Merging kgdb/kgdb/for-next (6beaa75cd24d kdb: Remove unused flags stack)
Merging hmm/hmm (d05c69b64a3a debug)
Merging cfi/cfi/next (2014c95afece Linux 6.14-rc1)
Merging mhi/mhi-next (0686a818d77a bus: mhi: host: Fix race between unprepa=
re and queue_buf)
Merging memblock/for-next (98b7beba1ee6 memblock: uniformly initialize all =
reserved pages to MIGRATE_MOVABLE)
Merging cxl/next (74d9c59658e4 cxl/region: Quiet some dev_warn()s in extend=
ed linear cache setup)
Merging zstd/zstd-next (7eb172143d55 Linux 6.14-rc5)
Merging efi/next (0dc1754e16b4 efi/libstub: Avoid legacy decompressor zlib/=
zstd wrappers)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (541702a66640 Merge branch 'slab/for-6.15/kfree_=
rcu_tiny' into slab/for-next)
CONFLICT (content): Merge conflict in kernel/rcu/tiny.c
Merging random/master (93354d866ac4 prandom: remove next_pseudo_random32)
Merging landlock/next (d9dfd31d6c22 landlock: Add audit documentation)
Merging rust/rust-next (cf25bc61f8ae MAINTAINERS: add entry for the `pin-in=
it` crate)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_panic_qr.rs
CONFLICT (content): Merge conflict in rust/Makefile
CONFLICT (content): Merge conflict in rust/kernel/init.rs
CONFLICT (content): Merge conflict in rust/pin-init/src/macros.rs
CONFLICT (content): Merge conflict in scripts/generate_rust_analyzer.py
Applying: fix up for "rust: init: fix `Zeroable` implementation for `Option=
<NonNull<T>>` and `Option<KBox<T>>`"
$ git reset --hard HEAD^
Merging next-20250314 version of rust
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_panic_qr.rs
[master 03cc8b457d88] next-20250314/rust
Merging rust-alloc/alloc-next (80e54e84911a Linux 6.14-rc6)
Merging rust-hrtimer/hrtimer-next (15a3c03ca02b rust: hrtimer: add maintain=
er entry)
Merging rust-pin-init/pin-init-next (7eb172143d55 Linux 6.14-rc5)
Merging sysctl/sysctl-next (29fa7d793421 selftests/sysctl: fix wording of h=
elp messages)
CONFLICT (content): Merge conflict in include/linux/mm.h
CONFLICT (content): Merge conflict in kernel/sysctl.c
CONFLICT (content): Merge conflict in mm/filemap.c
Merging execve/for-next/execve (8d68cabeb1ff binfmt_elf_fdpic: fix variable=
 set but not used warning)
Merging bitmap/bitmap-for-next (e3f42c436d7e riscv: fix test_and_{set,clear=
}_bit ordering documentation)
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (78ab93c78fb3 Merge branch 'for-next/hardening' =
into for-next/kspp)
CONFLICT (content): Merge conflict in lib/Makefile
Applying: fix up for "lib: Move KUnit tests into tests/ subdirectory"
Applying: fix up 2 for "lib: Move KUnit tests into tests/ subdirectory"
Merging nolibc/nolibc (a64dcfb451e2 Linux 6.14-rc2)
Merging iommufd/for-next (a05df03a88bc iommufd: Fix uninitialized rc in iom=
mufd_access_rw())
Merging turbostat/next (447c98c1ca4a tools/power turbostat: Add idle govern=
or statistics reporting)
Merging pwrseq/pwrseq/for-next (2014c95afece Linux 6.14-rc1)
Merging capabilities-next/caps-next (4ae89b1fe7c2 capability: Remove unused=
 has_capability)
Merging ipe/next (aefadf03b3e3 ipe: policy_fs: fix kernel-doc warnings)
Merging kcsan/next (9d89551994a4 Linux 6.13-rc6)
Merging crc/crc-next (981b39dc6da6 lib/crc: remove unnecessary prompt for C=
ONFIG_CRC64)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)
Applying: Revert "pidfs: ensure that PIDFS_INFO_EXIT is available"

--Sig_/yt/adQrD+nt4ogM++TtjJzq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfYHLYACgkQAVBC80lX
0Gwg2wgAnkt+dMD5zmwtp9Ti86QC4yVInaDUp43v719QkaZKBfloMe3LSk7cfOcd
nZWz9Kqq6stmiD9i2fAfFpccR0zrCO+Yb5Udn/VzDABmHJ12EYn16jXuOjNvBnAT
WxV5CuQOhc/v9Fk/8ICrBmR16YtKfYNXv79tcK0CsBPG9Hc98rN21EsfUQLx+ltm
U0WtoztLdWL9R0YcWtyMDaoUPFTAcgXKwyCWvXIoKeWEDn3k91AkfsMHTd4yL82H
p8rC17fRotLk8cJPrPL4+mgVXyLpOhU4Q1c+g+C8FUBD9qt7RSbUqvqYW3g+BDlr
FyUBWG15jbbT0nEgOqlmZObhe82D0g==
=C1iy
-----END PGP SIGNATURE-----

--Sig_/yt/adQrD+nt4ogM++TtjJzq--

