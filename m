Return-Path: <linux-next+bounces-4914-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6969E8B62
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 07:14:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAD471885827
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 06:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B4F15AD9C;
	Mon,  9 Dec 2024 06:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BLPzg+aZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7BC2144D0;
	Mon,  9 Dec 2024 06:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733724874; cv=none; b=l4PnJ1QTVlrHxgmIAqzk+dDBYmiz+xaGyFQxdBIN19V66B9BElT+6avt9UsEKPu/q5o5WY3t3BJv7ysaVdodsz8+ZAfoKE+/yCrFhRKbSlL+SR055veGW5VgJVVzfTz6K3Cx9rHvNAv+253pHkDRR1xlC5tqcmAq5oXOpgSZqLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733724874; c=relaxed/simple;
	bh=7Cm1eAQQJ4yPybt2WNWJkm6iiIxjaUeykUaZdScY1BE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JVrnGhkYi3UB0y4+6BvsIS3Qs0dNNt5zIZ065zUYKjjGd1C2zduhl5LfNlTL/dYs6KCbkfQi2sezdF/bgUL87kkC9n+QrIGaX1yK4UZZ31+q6n3pz/CP1Dw02YNoW4Z3cN6ZyO0yItsGgziKUrDt9DiZcloWQo+Bd9ewgBNM7JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BLPzg+aZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1733724863;
	bh=A5RtX4vn9HKQksjV/jLjXRfpdgjxY3BC504HVFQdSng=;
	h=Date:From:To:Cc:Subject:From;
	b=BLPzg+aZra14zG82/7dmMRGidCh+jcZ7DUUtfr6jkIdJZ51yyJr5avvvdqXOq5Sxd
	 tg8RmDfpxDOq42wKl7G+9OrTRwuZUxQZQUKVfI/2PSgLZx1wnbdxUC/zS7ZJM8SzA+
	 keYZxUkIOiC3VpQnH2hFYjnnns4UknC0jfmP1AFNYa8QVAymXajzkqDdoQMEuX+9lH
	 8WYZdnqaztzS2tKl2osyoalz+rxvqXz5+mcTYw3xNKzfWg5/JozLzzs0OIYD6HBJRj
	 z9RvO/NzRNxlW6u6N7WUrcwN2tB5jTF9lPjccL8wMQi9UWQJM+0gqr/UJ8xsghNH5J
	 3yCkxiU2+Q6dg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y6BQl4w7cz4wcs;
	Mon,  9 Dec 2024 17:14:23 +1100 (AEDT)
Date: Mon, 9 Dec 2024 17:14:27 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Dec 9
Message-ID: <20241209171427.7a98722d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R=zqZfIAzXDUqRWqjSAnNX3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/R=zqZfIAzXDUqRWqjSAnNX3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20241206:

The mm tree gained a build failure for which I reverted a commit and
two more for which I applied patches.

The drm-misc tree gained a semantic conflict against Linus' tree.

The tip tree gained conflicts against the mm tree.

Non-merge commits (relative to Linus' tree): 2048
 2275 files changed, 95515 insertions(+), 42524 deletions(-)

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

I am currently merging 389 trees (counting Linus' and 149 trees of bug
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
Merging origin/master (fac04efc5c79 Linux 6.13-rc2)
Merging fixes/fixes (87d6aab2389e Merge tag 'for_linus' of git://git.kernel=
.org/pub/scm/linux/kernel/git/mst/vhost)
Merging ext4-fixes/fixes (4a622e4d477b ext4: fix FS_IOC_GETFSMAP handling)
Merging vfs-brauner-fixes/vfs.fixes (930e7c209b77 Merge patch series "jbd2:=
 two straightforward fixes")
Merging fscrypt-current/for-current (8e929cb546ee Linux 6.12-rc3)
Merging fsverity-current/for-current (8e929cb546ee Linux 6.12-rc3)
Merging btrfs-fixes/next-fixes (0505ca384128 Merge branch 'misc-6.13' into =
next-fixes)
Merging vfs-fixes/fixes (678379e1d4f7 close_range(): fix the logics in desc=
riptor table trimming)
Merging erofs-fixes/fixes (7fe57ae70902 erofs: fix PSI memstall accounting)
Merging nfsd-fixes/nfsd-fixes (583772eec7b0 nfsd: allow for up to 32 callba=
ck session slots)
Merging v9fs-fixes/fixes/next (684a64bf32b6 Merge tag 'nfs-for-6.12-1' of g=
it://git.linux-nfs.org/projects/anna/linux-nfs)
Merging overlayfs-fixes/ovl-fixes (228a1157fb9f Merge tag '6.13-rc-part1-SM=
B3-client-fixes' of git://git.samba.org/sfrench/cifs-2.6)
Merging bcachefs/for-next (55a65a994ed5 bcachefs: bcachefs_metadata_version=
_persistent_inode_cursors)
Merging fscrypt/for-next (8e929cb546ee Linux 6.12-rc3)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (4fdad3e3cc21 Merge branch 'for-next-next-v6.13-2024=
1203' into for-next-20241203)
  e9627e09313a ("btrfs: handle bio_split() error")
Merging ceph/master (157320e05e56 ceph: fix memory leaks in __ceph_sync_rea=
d())
Merging cifs/for-next (979e0d72510f cifs: Fix rmdir failure due to ongoing =
I/O on deleted file)
Merging configfs/for-next (84147f4e84c4 configfs: improve item creation per=
formance)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (200b977ebbc3 dlm: fix dlm_recover_members refcount on err=
or)
Merging erofs/dev (0bc8061ffc73 erofs: handle NONHEAD !delta[1] lclusters g=
racefully)
Merging exfat/dev (744e50c7e25a exfat: fix exfat_find_empty_entry() not ret=
urning error on failure)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (78765a8ed5f9 Merge fanotify HSM implementation.)
Merging ext4/dev (3e7c69cdb053 jbd2: Fix comment describing journal_init_co=
mmon())
Merging f2fs/dev (40384c840ea1 Linux 6.13-rc1)
Merging fsverity/for-next (8e929cb546ee Linux 6.12-rc3)
Merging fuse/for-next (40384c840ea1 Linux 6.13-rc1)
Merging gfs2/for-next (5e72345a34a5 gfs2: reorder capability check last)
Merging jfs/jfs-next (a174706ba4da jfs: add a check to prevent array-index-=
out-of-bounds in dbAdjTree)
Merging ksmbd/ksmbd-for-next (f65289a87128 Merge tag 'v6.13-rc1-ksmbd-serve=
r-fixes' of git://git.samba.org/ksmbd)
Merging nfs/linux-next (38a125b31504 fs/nfs/io: make nfs_start_io_*() killa=
ble)
Merging nfs-anna/linux-next (867da60d463b nfs: avoid i_lock contention in n=
fs_clear_invalid_mapping)
Merging nfsd/nfsd-next (40384c840ea1 Linux 6.13-rc1)
Merging ntfs3/master (40384c840ea1 Linux 6.13-rc1)
Merging orangefs/for-next (96319dacaf15 orangefs: Constify struct kobj_type)
Merging overlayfs/overlayfs-next (c8b359dddb41 ovl: Filter invalid inodes w=
ith missing lookup function)
Merging ubifs/next (b29bf7119d6b jffs2: Fix rtime decompressor)
Merging v9fs/9p-next (e0260d530b73 net/9p/usbg: allow building as standalon=
e module)
Merging v9fs-ericvh/ericvh/for-next (684a64bf32b6 Merge tag 'nfs-for-6.12-1=
' of git://git.linux-nfs.org/projects/anna/linux-nfs)
Merging xfs/for-next (cc2dba08cc33 xfs: don't call xfs_bmap_same_rtgroup in=
 xfs_bmap_add_extent_hole_delay)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging file-locks/locks-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6-=
mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging iversion/iversion-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6=
-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging vfs-brauner/vfs.all (cc77a926140c Merge branch 'kernel-6.14.pid' in=
to vfs.all)
Merging vfs/for-next (5cc68af412a9 fs/overlayfs/namei.c: get rid of include=
 ../internal.h)
  b4080c21aeaa ("fs/qnx6: Fix building with GCC 15")
Merging mm-hotfixes/mm-hotfixes-unstable (a3f8c1832181 mm: don't try THP al=
ignment for FS without get_unmapped_area)
Merging fs-current (89bb6e605e66 Merge branch 'fixes' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/xiang/erofs.git)
Merging kbuild-current/fixes (d8d326d64f67 kbuild: deb-pkg: fix build error=
 with O=3D)
Merging arc-current/for-curr (91544a63920f ARC: bpf: Correct conditional ch=
eck in 'check_jmp_32')
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (d60624f72d15 arm64: ptrace: fix partial=
 SETREGSET for NT_ARM_GCS)
Merging arm-soc-fixes/arm/fixes (d62c9c5c4cbc Merge tag 'sunxi-fixes-for-6.=
12' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into arm=
/fixes)
Merging davinci-current/davinci/for-current (9852d85ec9d4 Linux 6.12-rc1)
Merging drivers-memory-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging sophgo-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging m68k-current/for-linus (647619b6bd27 m68k: defconfig: Update defcon=
figs for v6.12-rc1)
Merging powerpc-fixes/fixes (a373830f96db KVM: PPC: Book3S HV: Mask off LPC=
R_MER for a vCPU before running it to avoid spurious interrupts)
Merging s390-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging net/main (09310cfd4ea5 rtnetlink: fix error code in rtnl_newlink())
Merging bpf/master (b5f217084ab3 Merge tag 'bpf-fixes' of git://git.kernel.=
org/pub/scm/linux/kernel/git/bpf/bpf)
Merging ipsec/master (e952837f3ddb xfrm: state: fix out-of-bounds read duri=
ng lookup)
Merging netfilter/main (31f1b55d5d7e net :mana :Request a V2 response versi=
on for MANA_QUERY_GF_STAT)
Merging ipvs/main (8ffade77b633 gve: Flow steering trigger reset only for t=
imeout error)
Merging wireless/for-next (f1d3334d604c wifi: cfg80211: sme: init n_channel=
s before channels[] access)
Merging ath/for-current (c05c62850a8f Merge tag 'wireless-2024-10-29' of ht=
tps://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless)
Merging wpan/master (eb09fbeb4870 mac802154: check local interfaces before =
deleting sdata list)
Merging rdma-fixes/for-rc (d507d29bfde3 RDMA/bnxt_re: Don't fail destroy QP=
 and cleanup debugfs earlier)
Merging sound-current/for-linus (82fdcf9b518b ALSA: usb-audio: Add implicit=
 feedback quirk for Yamaha THR5)
Merging sound-asoc-fixes/for-linus (ec16a3cdf37e ASoC: mediatek: mt8188-mt6=
359: Remove hardcoded dmic codec)
Merging regmap-fixes/for-linus (3061e170381a regmap: detach regmap from dev=
 on regmap_exit)
Merging regulator-fixes/for-linus (40384c840ea1 Linux 6.13-rc1)
Merging spi-fixes/for-linus (4c6ac5446d06 spi: omap2-mcspi: Fix the IS_ERR(=
) bug for devm_clk_get_optional_enabled())
Merging pci-current/for-linus (40384c840ea1 Linux 6.13-rc1)
Merging driver-core.current/driver-core-linus (cdd30ebb1b9f module: Convert=
 symbol namespace to string literal)
Merging tty.current/tty-linus (4e450dfd0f96 tty: serial: Work around warnin=
g backtrace in serial8250_set_defaults)
Merging usb.current/usb-linus (33ead7e53818 usb: typec: ucsi: Fix connector=
 status writing past buffer size)
Merging usb-serial-fixes/usb-linus (40384c840ea1 Linux 6.13-rc1)
Merging phy/fixes (9d23e4865462 phy: rockchip: samsung-hdptx: Set drvdata b=
efore enabling runtime PM)
Merging staging.current/staging-linus (48e8a8160dba staging: gpib: Fix i386=
 build issue)
Merging iio-fixes/fixes-togreg (54d394905c92 iio: adc: ti-ads1119: fix samp=
le size in scan struct for triggered buffer)
Merging counter-current/counter-current (1437d9f1c56f counter: ti-ecap-capt=
ure: Add check for clk_enable())
Merging char-misc.current/char-misc-linus (cdd30ebb1b9f module: Convert sym=
bol namespace to string literal)
Merging soundwire-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging thunderbolt-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging input-current/for-linus (0201710ba630 Merge branch 'next' into for-=
linus)
Merging crypto-current/master (4223414efeae crypto: marvell/cesa - fix unin=
it value for struct mv_cesa_op_ctx)
Merging vfio-fixes/for-linus (9c7c5430bca3 vfio/mlx5: Align the page tracki=
ng max message size with the device capability)
Merging kselftest-fixes/fixes (d28cb83b386b selftests/ftrace: adjust offset=
 for kprobe syntax error test)
Merging dmaengine-fixes/fixes (dcbef0798eb8 dmaengine: amd: qdma: Remove us=
ing the private get and set dma_ops APIs)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (140054a25f85 mtd: rawnand: omap2: Fix build wa=
rnings with W=3D1)
Merging mfd-fixes/for-mfd-fixes (68f860426d50 mfd: axp20x: AXP717: Fix miss=
ing IRQ status registers range)
Merging v4l-dvb-fixes/fixes (ecf2b43018da media: uvcvideo: Skip parsing fra=
mes of type UVC_VS_UNDEFINED in uvc_parse_format)
Merging reset-fixes/reset/fixes (1f8af9712413 reset: rzg2l-usbphy-ctrl: Ass=
ign proper of node to the allocated device)
Merging mips-fixes/mips-fixes (40384c840ea1 Linux 6.13-rc1)
Merging at91-fixes/at91-fixes (40384c840ea1 Linux 6.13-rc1)
Merging omap-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging kvm-fixes/master (7d4050728c83 Merge tag 'vfs-6.13-rc1.fixes' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs)
Merging kvms390-fixes/master (cff59d8631e1 s390/uv: Panic for set and remov=
e shared access UVC errors)
Merging hwmon-fixes/hwmon (40384c840ea1 Linux 6.13-rc1)
Merging nvdimm-fixes/libnvdimm-fixes (d5240fa65db0 nvdimm/pmem: Set dax fla=
g for all 'PFN_MAP' cases)
Merging cxl-fixes/fixes (3a2b97b3210b cxl/test: Improve init-order fidelity=
 relative to real-world systems)
Merging dma-mapping-fixes/for-linus (78b2770c935f dma-mapping: fix tracing =
dma_alloc/free with vmalloc'd memory)
Merging drivers-x86-fixes/fixes (e9fba20c29e2 platform/x86: asus-nb-wmi: Ig=
nore unknown event 0xCF)
Merging samsung-krzk-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging pinctrl-samsung-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging devicetree-fixes/dt/linus (d7dfa7fde63d of: Fix error path in of_pa=
rse_phandle_with_args_map())
Merging dt-krzk-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging scsi-fixes/fixes (6918141d815a scsi: scsi_debug: Fix hrtimer suppor=
t for ndelay)
Merging drm-fixes/drm-fixes (1995e7d05062 Merge tag 'amd-drm-fixes-6.13-202=
4-12-04' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (2b1980a063e6 drm/i915/color: =
Stop using non-posted DSB writes for legacy LUT)
Merging mmc-fixes/fixes (87a0d90fcd31 mmc: core: Further prevent card detec=
t during shutdown)
Merging rtc-fixes/rtc-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging gnss-fixes/gnss-linus (40384c840ea1 Linux 6.13-rc1)
Merging hyperv-fixes/hyperv-fixes (895384881ec9 hv: vmbus: Constify struct =
kobj_type and struct attribute_group)
Merging risc-v-fixes/fixes (57f7c7dc78cd drivers: perf: Fix wrong put_cpu()=
 placement)
Merging riscv-dt-fixes/riscv-dt-fixes (40384c840ea1 Linux 6.13-rc1)
Merging riscv-soc-fixes/riscv-soc-fixes (48808b55b07c firmware: microchip: =
fix UL_IAP lock check in mpfs_auto_update_state())
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (e70140ba0d2b Get rid of 'remove_new' relic from pl=
atform driver struct)
Merging gpio-brgl-fixes/gpio/for-current (3396995f9fb6 gpio: ljca: Initiali=
ze num before accessing item in ljca_gpio_config)
Merging gpio-intel-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging pinctrl-intel-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging auxdisplay-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging kunit-fixes/kunit-fixes (40384c840ea1 Linux 6.13-rc1)
Merging memblock-fixes/fixes (180bbad69864 arch_numa: Restore nid checks be=
fore registering a memblock with a node)
Merging renesas-fixes/fixes (124f4f1a1869 MAINTAINERS: Re-add cancelled Ren=
esas driver sections)
Merging perf-current/perf-tools (968121f0a649 perf tools: Fix build error o=
n generated/fs_at_flags_array.c)
Merging efi-fixes/urgent (0b2c29fb68f8 efi/zboot: Limit compression options=
 to GZIP and ZSTD)
Merging zstd-fixes/zstd-linus (77618db34645 zstd: Fix array-index-out-of-bo=
unds UBSAN warning)
Merging battery-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging iommufd-fixes/for-rc (2ca704f55e22 iommu/arm-smmu-v3: Improve uAPI =
comment for IOMMU_HW_INFO_TYPE_ARM_SMMUV3)
Merging rust-fixes/rust-fixes (40384c840ea1 Linux 6.13-rc1)
Merging w1-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging pmdomain-fixes/fixes (2379fb937de5 pmdomain: imx: gpcv2: Adjust del=
ay after power up handshake)
Merging i2c-host-fixes/i2c/i2c-host-fixes (40384c840ea1 Linux 6.13-rc1)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (52fd1709e41d clk: en7523: Initialize num befor=
e accessing hws in en7523_register_clocks())
Merging pwrseq-fixes/pwrseq/for-current (40384c840ea1 Linux 6.13-rc1)
Merging thead-dt-fixes/thead-dt-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging ftrace-fixes/ftrace/fixes (fae4078c289a fgraph: Allocate ret_stack_=
list with proper size)
Merging ring-buffer-fixes/ring-buffer/fixes (09663753bb7c tracing/ring-buff=
er: Clear all memory mapped CPU ring buffers on first recording)
Merging trace-fixes/trace/fixes (dc1b157b828d tracing: Fix archs that still=
 call tracepoints without RCU watching)
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (819837584309 Linux 6.12-rc5)
Merging tip-fixes/tip/urgent (84e099c4ecf0 Merge branch into tip/master: 's=
ched/urgent')
Merging slab-fixes/slab/for-next-fixes (9c9201afebea mm/slab: fix warning c=
aused by duplicate kmem_cache creation in kmem_buckets_create)
Merging drm-misc-fixes/for-linux-next-fixes (471f3a21addd Merge tag 'drm-mi=
sc-fixes-2024-12-05' of https://gitlab.freedesktop.org/drm/misc/kernel into=
 drm-fixes)
Merging mm-stable/mm-stable (40384c840ea1 Linux 6.13-rc1)
Merging mm-nonmm-stable/mm-nonmm-stable (40384c840ea1 Linux 6.13-rc1)
Merging mm/mm-everything (9ae810c2e468 foo)
Applying: Revert "mempolicy.h: remove unnecessary header file inclusions"
Merging kbuild/for-next (954fbf43e566 kbuild: deb-pkg: allow hooks also in =
/usr/share/kernel)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (6d78089da980 perf tests: Fix hwmon parsing wi=
th PMU name test)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/for-next (aef7ee7649e0 dma-debug: fix physical address =
calculation for struct dma_debug_entry)
Merging asm-generic/master (0af8e32343f8 empty include/asm-generic/vga.h)
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (6139f7913689 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (83ef4a378e56 Merge branch 'for-next/pkey-signa=
l' into for-next/core)
Merging arm-perf/for-next/perf (845fd2cbedaf perf: Switch back to struct pl=
atform_driver::remove())
Merging arm-soc/for-next (daa20223dee9 soc: document merges)
Merging amlogic/for-next (171aa289a6fe Merge branch 'v6.13/arm-dt' into for=
-next)
Merging asahi-soc/asahi-soc/for-next (ffc253263a13 Linux 6.6)
Merging aspeed/for-next (2eff056a229e ARM: dts: aspeed: Blueridge and Fuji:=
 Fix LED node names)
Merging at91/at91-next (40384c840ea1 Linux 6.13-rc1)
Merging broadcom/next (f4733d5e7751 Merge branch 'devicetree/next' into nex=
t)
Merging davinci/davinci/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging drivers-memory/for-next (40384c840ea1 Linux 6.13-rc1)
Merging imx-mxs/for-next (6451378c2735 Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (3102ce10f311 Merge branch 'v6.12-next/dts64' int=
o for-next)
Merging mvebu/for-next (5f55ff35bfaa Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (019fe4d9a8ef Merge branch 'omap-for-v6.14/soc' into =
tmp/omap-next-20241206.125819)
Merging qcom/for-next (f2b086fc9f03 Merge branches 'arm64-defconfig-for-6.1=
4', 'arm64-fixes-for-6.13', 'arm64-for-6.14', 'clk-for-6.14' and 'drivers-f=
or-6.14' into for-next)
Merging renesas/next (928967a6482d Merge branch 'renesas-dts-for-v6.14' int=
o renesas-next)
Merging reset/reset/next (3d99f9231bed reset: amlogic: add support for A1 S=
oC in auxiliary reset driver)
Merging rockchip/for-next (e0fc7a786945 Merge branch 'v6.14-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (706119fbbdff arm64: dts: exynos: Add initial=
 support for Samsung Galaxy S20 FE (r8s))
Merging scmi/for-linux-next (6f3002035c8d Merge tags 'juno-fix-6.13', 'scmi=
-fix-6.13' and 'ffa-fixes-6.13' of ssh://gitolite.kernel.org/pub/scm/linux/=
kernel/git/sudeep.holla/linux into for-linux-next)
Merging sophgo/for-next (40384c840ea1 Linux 6.13-rc1)
Merging spacemit/for-next (819837584309 Linux 6.12-rc5)
Merging stm32/stm32-next (b0191a5cbc22 arm64: dts: st: add DMA support on S=
PI instances of stm32mp25)
Merging sunxi/sunxi/for-next (20296f8baa25 ARM: dts: suniv: f1c100s: Activa=
te Audio Codec for Lichee Pi Nano)
Merging tee/next (9852d85ec9d4 Linux 6.12-rc1)
Merging tegra/for-next (ca398b41b0a3 Merge branch for-6.14/arm/dt into for-=
next)
Merging thead-dt/thead-dt-for-next (7e756671a664 riscv: dts: thead: Add TH1=
520 ethernet nodes)
Merging ti/ti-next (40384c840ea1 Linux 6.13-rc1)
Merging xilinx/for-next (0e355cb69e19 Merge branch 'zynq/soc' into for-next)
Merging clk/clk-next (ac3eb212a300 Merge branch 'clk-fixes' into clk-next)
Merging clk-imx/for-next (81a206d736c1 clk: imx: imx8-acm: Fix return value=
 check in clk_imx_acm_attach_pm_domains())
Merging clk-renesas/renesas-clk (b73435047ef7 clk: renesas: r9a08g045: Add =
clock, reset and power domain for the remaining SCIFs)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (7f71507851fc LoongArch: KVM: Protect kvm_=
io_bus_{read,write}() with SRCU)
Merging m68k/for-next (647619b6bd27 m68k: defconfig: Update defconfigs for =
v6.12-rc1)
Merging m68knommu/for-next (40384c840ea1 Linux 6.13-rc1)
Merging microblaze/next (eb01f8f3c446 microblaze: mb: Use str_yes_no() help=
er in show_cpuinfo())
Merging mips/mips-next (40384c840ea1 Linux 6.13-rc1)
Merging openrisc/for-next (1037d186edfc openrisc: Implement fixmap to fix e=
arlycon)
Merging parisc-hd/for-next (df195d931a33 parisc: Remove memcpy_toio and mem=
set_io)
Merging powerpc/next (cf89c9434af1 powerpc/prom_init: Fixup missing powerma=
c #size-cells)
Merging risc-v/for-next (8d4f1e05ff82 RISC-V: Remove unnecessary include fr=
om compat.h)
Merging riscv-dt/riscv-dt-for-next (708d55db3edb riscv: dts: starfive: jh71=
10-milkv-mars: enable usb0 host function)
Merging riscv-soc/riscv-soc-for-next (c813ef3c5f6c MAINTAINERS: drop riscv =
list from cache controllers)
Merging s390/for-next (40384c840ea1 Linux 6.13-rc1)
Merging sh/for-next (63e72e551942 sh: intc: Fix use-after-free bug in regis=
ter_intc_controller())
Merging sparc/for-next (b6370b338e71 sparc/vdso: Add helper function for 64=
-bit right shift on 32-bit target)
Merging uml/next (bed2cc482600 hostfs: Fix the NULL vs IS_ERR() bug for __f=
ilemap_get_folio())
Merging xtensa/xtensa-for-next (43a611dc43e4 xtensa: annotate dtb_start var=
iable as static __initdata)
Merging fs-next (8cc0a7d04f43 Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (4022ef25504d Merge branch 'for-6.13-force-console'=
 into for-next)
Merging pci/next (372089595366 Merge branch 'pci/resource')
Merging pstore/for-next/pstore (9852d85ec9d4 Linux 6.12-rc1)
Merging hid/for-next (8d355b56f295 selftests/hid: fix kfunc inclusions with=
 newer bpftool)
Merging i2c/i2c/for-next (40384c840ea1 Linux 6.13-rc1)
Merging i2c-host/i2c/i2c-host (2122319afd65 i2c: imx: fix divide by zero wa=
rning)
Merging i3c/i3c/next (6cf7b65f7029 i3c: Use i3cdev->desc->info instead of c=
alling i3c_device_get_info() to avoid deadlock)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (98b35a9a904f hwmon: (isl28022) Drop expli=
cit initialization of struct i2c_device_id::driver_data to 0)
Merging jc_docs/docs-next (010a08cbf0d6 x86/Documentation: Elaborate Intel =
MID device list)
Merging v4l-dvb/next (6c10d1adae82 media: rkisp1: Reduce min_queued_buffers=
 to 1)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (e70140ba0d2b Get rid of 'remove_new' relic from plat=
form driver struct)
Merging cpufreq-arm/cpufreq/arm/linux-next (b5e2058a7a60 cpufreq: fix using=
 cpufreq-dt as module)
Merging cpupower/cpupower (40384c840ea1 Linux 6.13-rc1)
Merging devfreq/devfreq-next (1f8ac4b95fee PM / devfreq: Switch back to str=
uct platform_driver::remove())
CONFLICT (content): Merge conflict in drivers/devfreq/event/exynos-nocp.c
CONFLICT (content): Merge conflict in drivers/devfreq/event/exynos-ppmu.c
CONFLICT (content): Merge conflict in drivers/devfreq/mtk-cci-devfreq.c
CONFLICT (content): Merge conflict in drivers/devfreq/rk3399_dmc.c
CONFLICT (content): Merge conflict in drivers/devfreq/sun8i-a33-mbus.c
Merging pmdomain/next (40384c840ea1 Linux 6.13-rc1)
Merging opp/opp/linux-next (e0460b08c67a OPP: fix dev_pm_opp_find_bw_*() wh=
en bandwidth table not initialized)
Merging thermal/thermal/linux-next (7d8abc5f3b5c thermal/drivers/imx_sc_the=
rmal: Use dev_err_probe)
Merging rdma/for-next (40384c840ea1 Linux 6.13-rc1)
Merging net-next/main (7ea2745766d7 rtase: Refine the if statement)
Merging bpf-next/for-next (3bfb49d73fc2 bpf: Refactor bpf_tracing_func_prot=
o() and remove bpf_get_probe_write_proto())
Merging ipsec-next/master (152d00a91396 r8169: simplify setting hwmon attri=
bute visibility)
Merging mlx5-next/mlx5-next (f09ed834a946 net/mlx5: qos: Add ifc support fo=
r cross-esw scheduling)
Merging netfilter-next/main (38f83a57aa8e Merge branch 'virtio-net-support-=
af_xdp-zero-copy-tx')
Merging ipvs-next/main (38f83a57aa8e Merge branch 'virtio-net-support-af_xd=
p-zero-copy-tx')
Merging bluetooth/master (269f7b219173 Bluetooth: iso: Fix recursive lockin=
g warning)
Merging wireless-next/for-next (b81e0211e9c7 wifi: mac80211_hwsim: add 6 GH=
z EHT Mesh capabilities)
Merging ath-next/for-next (da8656797ae1 wifi: ath12k: introduce mlo_capable=
 flag for device group)
Merging wpan-next/master (aad4b41a3419 Documentation: ieee802154: fix gramm=
ar)
Merging wpan-staging/staging (aad4b41a3419 Documentation: ieee802154: fix g=
rammar)
Merging mtd/mtd/next (02ba194feacb mtd: mchp48l640: add support for Fujitsu=
 MB85RS128TY FRAM)
Merging nand/nand/next (1a50e3612de9 mtd: spinand: Add support for SkyHigh =
S35ML-3 family)
Merging spi-nor/spi-nor/next (93e00ccab5f7 mtd: spi-nor: macronix: remove m=
x25u25635f from parts list to enable SFDP)
Merging crypto/master (4223414efeae crypto: marvell/cesa - fix uninit value=
 for struct mv_cesa_op_ctx)
Merging drm/drm-next (40384c840ea1 Linux 6.13-rc1)
Merging drm-exynos/for-linux-next (9794b89c50f7 Merge tag 'drm-xe-next-fixe=
s-2024-11-28' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging drm-misc/for-linux-next (76ba5467ecfd drm/panel: visionox-rm69299: =
Remove redundant assignments of panel fields)
Applying: fix up for "drm/virtio: Add a helper to map and note the dma addr=
s and lengths"
Merging amdgpu/drm-next (979bfe291b5b Revert "drm/radeon: Delay Connector d=
etecting when HPD singals is unstable")
Merging drm-intel/for-linux-next (d71ff85ad850 drm/i915/wm: Club initialize=
d variables of same type together)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_ds=
b.c
Merging drm-msm/msm-next (86313a9cd152 drm/msm/dpu: rework documentation co=
mments)
Merging drm-msm-lumag/msm-next-lumag (86313a9cd152 drm/msm/dpu: rework docu=
mentation comments)
Merging drm-xe/drm-xe-next (774b5fa509a9 drm/xe: Avoid evicting object of t=
he same vm in none fault mode)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_devcoredump.c
Applying: fix up for "drm/xe/ptl: Add another PTL PCI ID"
Applying: drm: Fix up xe build for mainline
Merging etnaviv/etnaviv/next (6bef484c5e9a drm/etnaviv: Add fdinfo support =
for memory stats)
Merging fbdev/for-next (40384c840ea1 Linux 6.13-rc1)
Merging regmap/for-next (3ad4bd982c5f Merge remote-tracking branch 'regmap/=
for-6.14' into regmap-next)
Merging sound/for-next (acf5a2f08f85 ALSA: seq: oss: fix typo in seq_oss_in=
it.c)
Merging ieee1394/for-next (ce4339d021c4 firewire: ohci: use generic power m=
anagement)
Merging sound-asoc/for-next (f9389229c2d2 Merge remote-tracking branch 'aso=
c/for-6.14' into asoc-next)
Merging modules/modules-next (40384c840ea1 Linux 6.13-rc1)
Merging input/next (04337738629e Input: mpr121 - use devm_regulator_get_ena=
ble_read_voltage())
Merging block/for-next (20512f8ad768 Merge branch 'for-6.14/io_uring' into =
for-next)
Merging device-mapper/for-next (a573e404cbf2 dm-verity: remove the unused "=
data_start" variable)
Merging libata/for-next (9986ce65bebb ata: Constify struct pci_device_id)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (e0dbb300d318 mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (8ece9d248b85 dt-bindings: mfd: bd71828: Use charg=
er resistor in mOhm instead of MOhm)
Merging backlight/for-backlight-next (3adec6f907b6 MAINTAINERS: Use Daniel =
Thompson's korg address for Backlight work)
Merging battery/for-next (88e4a7dc04b7 power: supply: bq24190_charger: Fix =
typo 'jeta' -> 'jeita')
Merging regulator/for-next (a8d77166fcfe regulator: bd96801: Add ERRB IRQ)
Merging security/next (9c76eaf78488 rust: replace lsm context+len with lsm_=
context)
Merging apparmor/apparmor-next (40384c840ea1 Linux 6.13-rc1)
Merging integrity/next-integrity (08ae3e5f5fc8 integrity: Use static_assert=
() to check struct sizes)
Merging selinux/next (40384c840ea1 Linux 6.13-rc1)
Merging smack/next (6f71ad02aae8 smack: deduplicate access to string conver=
sion)
Merging tomoyo/master (adc218676eef Linux 6.12)
Merging tpmdd/next (2ba9f676d0a2 Merge tag 'drm-next-2024-11-29' of https:/=
/gitlab.freedesktop.org/drm/kernel)
Merging watchdog/master (4962ee045d8f watchdog: rti: of: honor timeout-sec =
property)
Merging iommu/next (42f0cbb2a253 Merge branches 'intel/vt-d', 'amd/amd-vi' =
and 'iommufd/arm-smmuv3-nested' into next)
Merging audit/next (8bea8f86f7a1 Automated merge of 'dev' into 'next')
Merging devicetree/for-next (16ef9c9de0c4 of/fdt: Implement use BIN_ATTR_SI=
MPLE macro for fdt sysfs attribute)
Merging dt-krzk/for-next (5aab15cd4794 Merge branch 'next/dt64' into for-ne=
xt)
Merging mailbox/for-next (7f9e19f207be mailbox: pcc: Check before sending M=
CTP PCC response ACK)
Merging spi/for-next (d6c73354813a Merge remote-tracking branch 'spi/for-6.=
14' into spi-next)
Merging tip/master (3ed87cc428f6 Merge branch into tip/master: 'x86/tdx')
  96450ead1652 ("seqlock: add raw_seqcount_try_begin")
  eb449bd96954 ("mm: convert mm_lock_seq to a proper seqcount")
CONFLICT (content): Merge conflict in include/linux/mm.h
CONFLICT (content): Merge conflict in include/linux/mm_types.h
CONFLICT (content): Merge conflict in kernel/fork.c
CONFLICT (content): Merge conflict in tools/testing/vma/vma_internal.h
Merging clockevents/timers/drivers/next (08b97fbd13de clocksource/drivers/a=
rm_arch_timer: Use of_property_present() for non-boolean properties)
Merging edac/edac-for-next (21c093a1626a Merge branch 'edac-drivers' into e=
dac-for-next)
Merging ftrace/for-next (5bcee0dd9892 Merge probes/for-next)
Merging rcu/next (d8dfba2c606a Merge branches 'rcu/fixes', 'rcu/nocb', 'rcu=
/torture', 'rcu/stall' and 'rcu/srcu' into rcu/dev)
Merging paulmck/non-rcu/next (b6f62437f431 Merge branches 'csd-lock.2024.10=
.11a', 'lkmm.2024.11.09a' and 'scftorture.2024.11.09a', tag 'nolibc.2024.11=
.01a' into HEAD)
Merging kvm/next (4d911c7abee5 Merge tag 'kvm-riscv-6.13-2' of https://gith=
ub.com/kvm-riscv/linux into HEAD)
Merging kvm-arm/next (60ad25e14ab5 KVM: arm64: Pass on SVE mapping failures)
Merging kvms390/next (7a1f3143377a KVM: s390: selftests: Add regression tes=
ts for PFCR subfunctions)
Merging kvm-ppc/topic/ppc-kvm (590d2f9347f7 KVM: PPC: Book3S HV: Fix kmv ->=
 kvm typo)
Merging kvm-riscv/riscv_kvm_next (c74bfe4ffe8c KVM: riscv: selftests: Add S=
vade and Svadu Extension to get-reg-list test)
Merging kvm-x86/next (c55f6b8a2441 Merge branch 'vmx')
Merging xen-tip/linux-next (afc545da381b xen: Fix the issue of resource not=
 being properly released in xenbus_dev_probe())
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (b03917e02bf9 rust: add safety comment in workq=
ueue traits)
Merging sched-ext/for-next (4572541892ea sched_ext: Use the NUMA scheduling=
 domain for NUMA optimizations)
Merging drivers-x86/for-next (dd77ba8801a2 Merge import NS conversion from =
'https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git' into f=
or-next)
Merging chrome-platform/for-next (bd37caa72a61 platform/chrome: cros_ec_pro=
to: remove unnecessary retries)
Merging chrome-platform-firmware/for-firmware-next (40384c840ea1 Linux 6.13=
-rc1)
Merging hsi/for-next (40384c840ea1 Linux 6.13-rc1)
Merging leds-lj/for-leds-next (e8501858035b leds: ss4200: Fix the wrong for=
mat specifier for 'blinking')
Merging ipmi/for-next (7868b3a94045 char:ipmi: Fix the wrong format specifi=
er)
Merging driver-core/driver-core-next (cdd30ebb1b9f module: Convert symbol n=
amespace to string literal)
Merging usb/usb-next (d8d936c51388 usb: storage: add a macro for the upper =
limit of max LUN)
Merging thunderbolt/next (40384c840ea1 Linux 6.13-rc1)
Merging usb-serial/usb-next (40384c840ea1 Linux 6.13-rc1)
Merging tty/tty-next (535a07698b8b serial: 8250_pci: Share WCH IDs with par=
port_serial driver)
Merging char-misc/char-misc-next (cdd30ebb1b9f module: Convert symbol names=
pace to string literal)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (42f7652d3eb5 Linux 6.12-rc4)
Merging fastrpc/for-next (40384c840ea1 Linux 6.13-rc1)
Merging fpga/for-next (dbbd975cc6df fpga: Switch back to struct platform_dr=
iver::remove())
Merging icc/icc-next (40384c840ea1 Linux 6.13-rc1)
Merging iio/togreg (582d732bf689 iio: light: veml6030: add support for trig=
gered buffer)
Merging phy-next/next (b6096751a652 phy: sun4i-usb: Remove unused of_gpio.h)
  2318ca599459 ("dt-bindings: phy: imx8mq-usb: correct reference to usb-swi=
tch.yaml")
Merging soundwire/next (40384c840ea1 Linux 6.13-rc1)
Merging extcon/extcon-next (7041ed0dde83 extcon: Drop explicit initializati=
on of struct i2c_device_id::driver_data to 0)
Merging gnss/gnss-next (40384c840ea1 Linux 6.13-rc1)
Merging vfio/next (fe4bf8d0b671 vfio/pci: Properly hide first-in-list PCIe =
extended capability)
Merging w1/for-next (5f69c091a6c0 w1: ds2482: Fix datasheet URL)
Merging spmi/spmi-next (a45e4aa263d6 spmi: Set fwnode for spmi devices)
Merging staging/staging-next (0a4edbeef1e4 staging: gpib: Remove duplicate =
include)
Merging counter-next/counter-next (522ae89b7858 counter: intel-qep: Replace=
 deprecated PCI functions)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (49a9b01803e4 mux: constify mux class)
Merging dmaengine/next (7a155fefec85 dmaengine: amd: qdma: make read-only a=
rrays h2c_types and c2h_types static const)
Merging cgroup/for-next (d6821c9e4391 Merge branch 'for-6.13' into for-next)
Merging scsi/for-next (6918141d815a scsi: scsi_debug: Fix hrtimer support f=
or ndelay)
Merging scsi-mkp/for-next (2486e60bdd41 Merge patch series "Replace the "sl=
ave_*" function names")
Merging vhost/linux-next (6a39bb15b3d1 virtio_vdpa: remove redundant check =
on desc)
Merging rpmsg/for-next (1dc7c8ed7cb3 remoteproc: omap: Handle ARM dma_iommu=
_mapping)
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (26a4dedc5f3c gpio: twl4030: use gpiochip_g=
et_data)
Merging gpio-intel/for-next (12b0e305f509 gpio: acpi: switch to device_for_=
each_child_node_scoped())
Merging pinctrl/for-next (39c53afeb599 ARM: imx: Re-introduce the PINCTRL s=
election)
Merging pinctrl-intel/for-next (40384c840ea1 Linux 6.13-rc1)
Merging pinctrl-renesas/renesas-pinctrl (53967d9c146d pinctrl: renesas: rzg=
2l: Add audio clock pins)
Merging pinctrl-samsung/for-next (0ebb1e9e1b12 pinctrl: samsung: update chi=
ld reference drop comment)
Merging pwm/pwm/for-next (483082d78a09 pwm: stm32-lp: Add check for clk_ena=
ble())
Merging ktest/for-next (2351e8c65404 ktest.pl: Avoid false positives with g=
rub2 skip regex)
Merging kselftest/next (40384c840ea1 Linux 6.13-rc1)
Merging kunit/test (40384c840ea1 Linux 6.13-rc1)
Merging kunit-next/kunit (40384c840ea1 Linux 6.13-rc1)
Merging livepatching/for-next (9c66f50477e2 Merge branch 'for-6.13/selftest=
s-kprobe' into for-next)
Merging rtc/rtc-next (e0779a0dcf41 rtc: ab-eoz9: don't fail temperature rea=
ds on undervoltage notification)
Merging nvdimm/libnvdimm-for-next (f3dd9ae7f03a dax: Remove an unused field=
 in struct dax_operations)
Merging at24/at24/for-next (40384c840ea1 Linux 6.13-rc1)
Merging ntb/ntb-next (c620f56c70eb MAINTAINERS: Update AMD NTB maintainers)
Merging seccomp/for-next/seccomp (8cf8dfceebda seccomp: Stub for !HAVE_ARCH=
_SECCOMP_FILTER)
Merging fsi/next (c5eeb63edac9 fsi: Fix panic on scom file read)
Merging slimbus/for-next (40384c840ea1 Linux 6.13-rc1)
Merging nvmem/for-next (40384c840ea1 Linux 6.13-rc1)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (4d4ace979a30 hyperv: Remove the now unused hype=
rv-tlfs.h files)
Merging auxdisplay/for-next (0b028ff7e70e auxdisplay: Remove unused functio=
ns)
Merging kgdb/kgdb/for-next (24b2455fe8fc kdb: fix ctrl+e/a/f/b/d/p/n broken=
 in keyboard mode)
Merging hmm/hmm (40384c840ea1 Linux 6.13-rc1)
Merging cfi/cfi/next (40384c840ea1 Linux 6.13-rc1)
Merging mhi/mhi-next (33c792a22879 Merge branch 'mhi-fixes' into mhi-next)
Merging memblock/for-next (98b7beba1ee6 memblock: uniformly initialize all =
reserved pages to MIGRATE_MOVABLE)
Merging cxl/next (e2b952ffafce ACPI/HMAT: Move HMAT messages to pr_debug())
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (40384c840ea1 Linux 6.13-rc1)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (9008fe8fad82 slab: Fix too strict alignment che=
ck in create_cache())
Merging random/master (d18c13697b4d prandom: Include <linux/percpu.h> in <l=
inux/prandom.h>)
Merging landlock/next (adc218676eef Linux 6.12)
Merging rust/rust-next (40384c840ea1 Linux 6.13-rc1)
Merging sysctl/sysctl-next (9c738dae9534 sysctl: Reduce dput(child) calls i=
n proc_sys_fill_cache())
Merging execve/for-next/execve (fa1bdca98d74 exec: remove legacy custom bin=
fmt modules autoloading)
Merging bitmap/bitmap-for-next (af206905fa22 riscv: Always inline bitops)
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (f06e108a3dc5 Compiler Attributes: disable __cou=
nted_by for clang < 19.1.3)
Merging kspp-gustavo/for-next/kspp (6613476e225e Linux 6.8-rc1)
Merging nolibc/nolibc (40384c840ea1 Linux 6.13-rc1)
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (40384c840ea1 Linux 6.13-rc1)
Merging turbostat/next (86d237734091 tools/power turbostat: 2024.11.30)
Merging pwrseq/pwrseq/for-next (40384c840ea1 Linux 6.13-rc1)
Merging capabilities-next/caps-next (d48da4d5ed7b security: add trace event=
 for cap_capable)
Merging ipe/next (d881f0eb6f23 scripts: ipe: polgen: remove redundant close=
 and error exit path)
Merging kcsan/next (b86f7c9fad06 kcsan: Remove redundant call of kallsyms_l=
ookup_name())
Merging crc/crc-next (9902e01224c8 MAINTAINERS: add entry for CRC library)
  cc354fa7f016 ("bcachefs: Explicitly select CRYPTO from BCACHEFS_FS")
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)
Applying: fix up for "mm: perform all memfd seal checks in a single place"
Applying: fix up for "mm: move per-vma lock into vm_area_struct"

--Sig_/R=zqZfIAzXDUqRWqjSAnNX3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdWisMACgkQAVBC80lX
0GwThwgAoQVOVlcssjmVrSe6AlgGaAHSrLmPJN4ufQU4nYDex6ev/+UFUcWwl6Cp
kx9PrCWC++yYMq0II2JnRTNvodWnksg1jbxCpwQFPT9s/0MlEliMC40foQgPUxKG
sOqMB2qTaltZTy1dA64/KUQFDFez8HV7V+2HdtCyb2xveSBz7tKm8JkgHie+X0b7
8aZ+cpsM7FOMhp9w8ainR+yjwhJToxWY89yNqK8gBMkVOIH5WA4qRlWToOA6Lwcf
7a0KzFtChm/m/rJBQvYY/DA1Ut308SD/o6NkOnRJYBemYMsI2TOfiSXQZDSrc0l8
lfnYpkdMAOOQV3fz5mD4cDyT/KRpwA==
=rUyC
-----END PGP SIGNATURE-----

--Sig_/R=zqZfIAzXDUqRWqjSAnNX3--

