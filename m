Return-Path: <linux-next+bounces-4939-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF71F9EC3C2
	for <lists+linux-next@lfdr.de>; Wed, 11 Dec 2024 04:53:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C95DF1883874
	for <lists+linux-next@lfdr.de>; Wed, 11 Dec 2024 03:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1746233993;
	Wed, 11 Dec 2024 03:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KcnFtIXj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F6F29A1;
	Wed, 11 Dec 2024 03:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733889216; cv=none; b=hXxBt59BM1jqc7QoOuL3dNoW3ehH3MVTmSkQtW+zhi8oe/A4X5ll+kjkYdc60apYQXP8FJ70VaI6pyWzdxTAaBLMa5NYaPic09dQgknVgS21HFJ9yMgAIMfAfGdFDHOi2AdmyvptCU5N1ssZgH9JxSsALNlR29lErP3FCChBjEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733889216; c=relaxed/simple;
	bh=UUxGvC5Tb7S68y0RPaDz5feFV9NRVmTH3R1loUnRqkI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tN0Rmk6T+q829yISRbZJGh9VQW8uM6RvA7QuG4hNwo/otj9BBagWdwI5p24LAlOS8w4CiCAUbAHnc/x+q+ZUxfne5EMTCoR6CZQB2L5C6Pd0USkoZVFXsI5h9ooreYeMnxQmCx+RH8D+GqiqwJ5TBdASK2mzcPu4+kWSHYgyu2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KcnFtIXj; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1733889204;
	bh=x+9nI8MMCPupaml0q87L9n4mVsUL8veJWvxco+gqKE8=;
	h=Date:From:To:Cc:Subject:From;
	b=KcnFtIXjj4jFIBxHYfqizwTNKBoFxfpcBGRzbdgSmrN8p3cUuzFPJZbOqCKcEem6q
	 i4MavmQoS9qF8uF1ewMdlGdSuqeXiT/RFR/mhfxwvKjAraMIeXZmOqUR8WafYuZlsp
	 6+Nu1T4+7XP9jY9XVkL6vajKSYOjnCzlX1SOUk5Wel5ghcfkpGWfh5JvZ8Hlb2Jkni
	 tuA/M6vbW92zM7tPqYrgTmUhdEuQtfuxoe6EpuYueHwGLHELOsmHhtV2I6dVpQAtVl
	 Tbhnm4IZjSR2u16vDCn4kTsJuTj+aW0HmsPwXRFFj+QC0F+dulfj+DHxEiYKsHyTP6
	 TItLuM0r7ojdg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y7MC83KTZz4wcy;
	Wed, 11 Dec 2024 14:53:24 +1100 (AEDT)
Date: Wed, 11 Dec 2024 14:53:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Dec 11
Message-ID: <20241211145328.5a8be1f6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tYdLsgz7K8ERKNo.gXbjtY0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tYdLsgz7K8ERKNo.gXbjtY0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20241210:

The xfs tree gained a build failure so I used the version from
next-20241210.

The mm tree lost its build failures.

Non-merge commits (relative to Linus' tree): 2716
 3071 files changed, 121879 insertions(+), 51032 deletions(-)

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
Merging origin/master (7cb1b4663150 Merge tag 'locking_urgent_for_v6.13_rc3=
' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
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
Merging bcachefs/for-next (dd7d7f29a7c7 bcachefs: Don't start rewriting btr=
ee nodes until after journal replay)
Merging fscrypt/for-next (8e929cb546ee Linux 6.12-rc3)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (4fdad3e3cc21 Merge branch 'for-next-next-v6.13-2024=
1203' into for-next-20241203)
Merging ceph/master (1f3c2fa362c5 ceph: validate snapdirname option length =
when mounting)
Merging cifs/for-next (57e8e822621d smb: client: destroy cfid_put_wq on mod=
ule exit)
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
Merging ext3/for_next (ff8d47dedea5 Merge fanotify HSM implementation.)
Merging ext4/dev (3e7c69cdb053 jbd2: Fix comment describing journal_init_co=
mmon())
Merging f2fs/dev (40384c840ea1 Linux 6.13-rc1)
Merging fsverity/for-next (8e929cb546ee Linux 6.12-rc3)
Merging fuse/for-next (40384c840ea1 Linux 6.13-rc1)
Merging gfs2/for-next (ead64b20f16e gfs2: reorder capability check last)
Merging jfs/jfs-next (a174706ba4da jfs: add a check to prevent array-index-=
out-of-bounds in dbAdjTree)
Merging ksmbd/ksmbd-for-next (f65289a87128 Merge tag 'v6.13-rc1-ksmbd-serve=
r-fixes' of git://git.samba.org/ksmbd)
Merging nfs/linux-next (38a125b31504 fs/nfs/io: make nfs_start_io_*() killa=
ble)
Merging nfs-anna/linux-next (867da60d463b nfs: avoid i_lock contention in n=
fs_clear_invalid_mapping)
Merging nfsd/nfsd-next (fac04efc5c79 Linux 6.13-rc2)
Merging ntfs3/master (40384c840ea1 Linux 6.13-rc1)
Merging orangefs/for-next (96319dacaf15 orangefs: Constify struct kobj_type)
Merging overlayfs/overlayfs-next (c8b359dddb41 ovl: Filter invalid inodes w=
ith missing lookup function)
Merging ubifs/next (b29bf7119d6b jffs2: Fix rtime decompressor)
Merging v9fs/9p-next (e0260d530b73 net/9p/usbg: allow building as standalon=
e module)
Merging v9fs-ericvh/ericvh/for-next (684a64bf32b6 Merge tag 'nfs-for-6.12-1=
' of git://git.linux-nfs.org/projects/anna/linux-nfs)
Merging xfs/for-next (3c171ea60082 Merge tag 'fixes-6.13_2024-12-03' of htt=
ps://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux into next-rc)
$ git reset --hard HEAD^
Merging next-20241210 version of xfs
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
Merging mm-hotfixes/mm-hotfixes-unstable (6a2c9ecf02d0 nilfs2: prevent use =
of deleted inode)
Merging fs-current (4a1e5d4e91b1 Merge branch 'fixes' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/xiang/erofs.git)
Merging kbuild-current/fixes (fac04efc5c79 Linux 6.13-rc2)
Merging arc-current/for-curr (91544a63920f ARC: bpf: Correct conditional ch=
eck in 'check_jmp_32')
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (fac04efc5c79 Linux 6.13-rc2)
Merging arm-soc-fixes/arm/fixes (d62c9c5c4cbc Merge tag 'sunxi-fixes-for-6.=
12' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into arm=
/fixes)
Merging davinci-current/davinci/for-current (9852d85ec9d4 Linux 6.12-rc1)
Merging drivers-memory-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging sophgo-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging m68k-current/for-linus (647619b6bd27 m68k: defconfig: Update defcon=
figs for v6.12-rc1)
Merging powerpc-fixes/fixes (fac04efc5c79 Linux 6.13-rc2)
Merging s390-fixes/fixes (41856638e6c4 s390/mm: Fix DirectMap accounting)
Merging net/main (51a00be6a099 udp: fix l4 hash after reconnect)
Merging bpf/master (7d0d673627e2 bpf: Fix theoretical prog_array UAF in __u=
probe_perf_func())
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
Merging sound-current/for-linus (b2e538a9827d ALSA: control: Avoid WARN() f=
or symlink errors)
Merging sound-asoc-fixes/for-linus (687630aa582a ASoC: audio-graph-card: Ca=
ll of_node_put() on correct node)
Merging regmap-fixes/for-linus (fac04efc5c79 Linux 6.13-rc2)
Merging regulator-fixes/for-linus (f07ae52f5cf6 regulator: axp20x: AXP717: =
set ramp_delay)
Merging spi-fixes/for-linus (25fb0e77b90e spi: spi-cadence-qspi: Disable ST=
IG mode for Altera SoCFPGA.)
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
Merging counter-current/counter-current (fac04efc5c79 Linux 6.13-rc2)
Merging char-misc.current/char-misc-linus (cdd30ebb1b9f module: Convert sym=
bol namespace to string literal)
Merging soundwire-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging thunderbolt-fixes/fixes (8644b48714dc thunderbolt: Add support for =
Intel Panther Lake-M/P)
Merging input-current/for-linus (0201710ba630 Merge branch 'next' into for-=
linus)
Merging crypto-current/master (cd26cd654767 crypto: hisilicon/debugfs - fix=
 the struct pointer incorrectly offset problem)
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
Merging nvdimm-fixes/libnvdimm-fixes (265e98f72bac acpi: nfit: vmalloc-out-=
of-bounds Read in acpi_nfit_ctl)
Merging cxl-fixes/fixes (3a2b97b3210b cxl/test: Improve init-order fidelity=
 relative to real-world systems)
Merging dma-mapping-fixes/for-linus (78b2770c935f dma-mapping: fix tracing =
dma_alloc/free with vmalloc'd memory)
Merging drivers-x86-fixes/fixes (e9fba20c29e2 platform/x86: asus-nb-wmi: Ig=
nore unknown event 0xCF)
Merging samsung-krzk-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging pinctrl-samsung-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging devicetree-fixes/dt/linus (0f7ca6f69354 of/irq: Fix using uninitial=
ized variable @addr_len in API of_irq_parse_one())
Merging dt-krzk-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging scsi-fixes/fixes (f103396ae318 scsi: ufs: core: Update compl_time_s=
tamp_local_clock after completing a cqe)
Merging drm-fixes/drm-fixes (fac04efc5c79 Linux 6.13-rc2)
Merging drm-intel-fixes/for-linux-next-fixes (2828e5808bcd drm/i915: Fix me=
mory leak by correcting cache object name in error handler)
Merging mmc-fixes/fixes (f3d87abe11ed mmc: mtk-sd: disable wakeup in .remov=
e() and in the error path of .probe())
Merging rtc-fixes/rtc-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging gnss-fixes/gnss-linus (40384c840ea1 Linux 6.13-rc1)
Merging hyperv-fixes/hyperv-fixes (175c71c2acee tools/hv: reduce resource u=
sage in hv_kvp_daemon)
Merging risc-v-fixes/fixes (57f7c7dc78cd drivers: perf: Fix wrong put_cpu()=
 placement)
Merging riscv-dt-fixes/riscv-dt-fixes (40384c840ea1 Linux 6.13-rc1)
Merging riscv-soc-fixes/riscv-soc-fixes (48808b55b07c firmware: microchip: =
fix UL_IAP lock check in mpfs_auto_update_state())
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (e70140ba0d2b Get rid of 'remove_new' relic from pl=
atform driver struct)
Merging gpio-brgl-fixes/gpio/for-current (9ac4b58fcef0 gpio: idio-16: Actua=
lly make use of the GPIO_IDIO_16 symbol namespace)
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
Merging efi-fixes/urgent (2ab0837cb91b efivarfs: Fix error on non-existent =
file)
Merging zstd-fixes/zstd-linus (77618db34645 zstd: Fix array-index-out-of-bo=
unds UBSAN warning)
Merging battery-fixes/fixes (c28dc9fc24f5 power: supply: cros_charge-contro=
l: hide start threshold on v2 cmd)
Merging iommufd-fixes/for-rc (2ca704f55e22 iommu/arm-smmu-v3: Improve uAPI =
comment for IOMMU_HW_INFO_TYPE_ARM_SMMUV3)
Merging rust-fixes/rust-fixes (7a5f93ea5862 rust: kbuild: set `bindgen`'s R=
ust target version)
Merging w1-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging pmdomain-fixes/fixes (fac04efc5c79 Linux 6.13-rc2)
Merging i2c-host-fixes/i2c/i2c-host-fixes (5751eee5c620 i2c: nomadik: Add m=
issing sentinel to match table)
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
Merging tip-fixes/tip/urgent (a6f16dbdceba Merge branch into tip/master: 's=
ched/urgent')
Merging slab-fixes/slab/for-next-fixes (b7ffecbe198e memcg: slub: fix SUnre=
claim for post charged objects)
Merging drm-misc-fixes/for-linux-next-fixes (efb113fc30e7 drm: rework FB_CO=
RE dependency)
Merging mm-stable/mm-stable (40384c840ea1 Linux 6.13-rc1)
Merging mm-nonmm-stable/mm-nonmm-stable (40384c840ea1 Linux 6.13-rc1)
Merging mm/mm-everything (e5aaf436eb73 foo)
Merging kbuild/for-next (8f2db654f79c kbuild: suppress stdout from merge_co=
nfig for silent builds)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (5e530a8287b7 perf tests: Enable tests disable=
d due to tracepoint parsing)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/for-next (aef7ee7649e0 dma-debug: fix physical address =
calculation for struct dma_debug_entry)
Merging asm-generic/master (0af8e32343f8 empty include/asm-generic/vga.h)
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (6139f7913689 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (146ff2c261f3 Merge branches 'for-next/cpufeatu=
re' and 'for-next/misc' into for-next/core)
Merging arm-perf/for-next/perf (f03241fbebdf drivers/perf: hisi: Delete red=
undant blank line of DDRC PMU)
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
Merging drivers-memory/for-next (df8e78607d47 memory: ti-aemif: Export aemi=
f_*_cs_timings())
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
Merging renesas/next (8ee2df3648fb Merge branches 'renesas-arm-defconfig-fo=
r-v6.14' and 'renesas-dts-for-v6.14' into renesas-next)
Merging reset/reset/next (3d99f9231bed reset: amlogic: add support for A1 S=
oC in auxiliary reset driver)
Merging rockchip/for-next (e0fc7a786945 Merge branch 'v6.14-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (9bd9a48b3547 Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (0abd3a8b7c2f Merge tags 'juno-fix-6.13', 'scmi=
-fix-6.13' and 'ffa-fix-6.13' of ssh://gitolite.kernel.org/pub/scm/linux/ke=
rnel/git/sudeep.holla/linux into for-linux-next)
Merging sophgo/for-next (40384c840ea1 Linux 6.13-rc1)
Merging spacemit/for-next (819837584309 Linux 6.12-rc5)
Merging stm32/stm32-next (08d312c94409 ARM: dts: stm32: lxa-tac: Add suppor=
t for generation 3 devices)
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
Merging clk-renesas/renesas-clk (f96274528995 clk: renesas: r9a08g045: Add =
clocks, resets and power domain support for the ADC IP)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (7f71507851fc LoongArch: KVM: Protect kvm_=
io_bus_{read,write}() with SRCU)
Merging m68k/for-next (e419ddeabe7e m68k: Use kernel's generic muldi3 libgc=
c function)
Merging m68knommu/for-next (fac04efc5c79 Linux 6.13-rc2)
Merging microblaze/next (eb01f8f3c446 microblaze: mb: Use str_yes_no() help=
er in show_cpuinfo())
Merging mips/mips-next (40384c840ea1 Linux 6.13-rc1)
Merging openrisc/for-next (c8f8d4344d50 openrisc: Fix misalignments in head=
.S)
Merging parisc-hd/for-next (df195d931a33 parisc: Remove memcpy_toio and mem=
set_io)
Merging powerpc/next (fac04efc5c79 Linux 6.13-rc2)
Merging risc-v/for-next (8d4f1e05ff82 RISC-V: Remove unnecessary include fr=
om compat.h)
Merging riscv-dt/riscv-dt-for-next (708d55db3edb riscv: dts: starfive: jh71=
10-milkv-mars: enable usb0 host function)
Merging riscv-soc/riscv-soc-for-next (c813ef3c5f6c MAINTAINERS: drop riscv =
list from cache controllers)
Merging s390/for-next (18a0ec28d4e1 Merge branch 'features' into for-next)
Merging sh/for-next (63e72e551942 sh: intc: Fix use-after-free bug in regis=
ter_intc_controller())
Merging sparc/for-next (b6370b338e71 sparc/vdso: Add helper function for 64=
-bit right shift on 32-bit target)
Merging uml/next (bed2cc482600 hostfs: Fix the NULL vs IS_ERR() bug for __f=
ilemap_get_folio())
Merging xtensa/xtensa-for-next (d14b9a713b34 xtensa/simdisk: Use str_write_=
read() helper in simdisk_transfer())
Merging fs-next (8a3a22f4bd79 Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (4022ef25504d Merge branch 'for-6.13-force-console'=
 into for-next)
Merging pci/next (372089595366 Merge branch 'pci/resource')
Merging pstore/for-next/pstore (9852d85ec9d4 Linux 6.12-rc1)
Merging hid/for-next (50a78409a215 selftests/hid: Add host-tools to .gitign=
ore)
Merging i2c/i2c/for-next (40384c840ea1 Linux 6.13-rc1)
Merging i2c-host/i2c/i2c-host (e7aa745f94a1 i2c: imx: fix divide by zero wa=
rning)
Merging i3c/i3c/next (6cf7b65f7029 i3c: Use i3cdev->desc->info instead of c=
alling i3c_device_get_info() to avoid deadlock)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (98b35a9a904f hwmon: (isl28022) Drop expli=
cit initialization of struct i2c_device_id::driver_data to 0)
Merging jc_docs/docs-next (a9e5f6a8598d Merge branch 'docs-fixes' into docs=
-next)
Merging v4l-dvb/next (6c10d1adae82 media: rkisp1: Reduce min_queued_buffers=
 to 1)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (c4b4f8e0829f Merge branch 'fixes' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (b5e2058a7a60 cpufreq: fix using=
 cpufreq-dt as module)
Merging cpupower/cpupower (46fd8c707b55 cpupower: revise is_valid flag hand=
ling for idle_monitor)
Merging devfreq/devfreq-next (1f8ac4b95fee PM / devfreq: Switch back to str=
uct platform_driver::remove())
CONFLICT (content): Merge conflict in drivers/devfreq/event/exynos-nocp.c
CONFLICT (content): Merge conflict in drivers/devfreq/event/exynos-ppmu.c
CONFLICT (content): Merge conflict in drivers/devfreq/mtk-cci-devfreq.c
CONFLICT (content): Merge conflict in drivers/devfreq/rk3399_dmc.c
CONFLICT (content): Merge conflict in drivers/devfreq/sun8i-a33-mbus.c
Merging pmdomain/next (b06bc4727991 pmdomain: ti_sci: handle wake IRQs for =
IO daisy chain wakeups)
Merging opp/opp/linux-next (e0460b08c67a OPP: fix dev_pm_opp_find_bw_*() wh=
en bandwidth table not initialized)
Merging thermal/thermal/linux-next (7d8abc5f3b5c thermal/drivers/imx_sc_the=
rmal: Use dev_err_probe)
Merging rdma/for-next (40384c840ea1 Linux 6.13-rc1)
Merging net-next/main (a0e1fc921cb0 Merge branch 'add-support-for-synopsis-=
dwmac-ip-on-nxp-automotive-socs-s32g2xx-s32g3xx-s32r45')
Merging bpf-next/for-next (c3b568ea7065 Merge branch 'bpf-next/net' into bp=
f-next/for-next)
Merging ipsec-next/master (59af653a6998 Merge branch 'Add IP-TFS mode to xf=
rm')
Merging mlx5-next/mlx5-next (f09ed834a946 net/mlx5: qos: Add ifc support fo=
r cross-esw scheduling)
Merging netfilter-next/main (38f83a57aa8e Merge branch 'virtio-net-support-=
af_xdp-zero-copy-tx')
Merging ipvs-next/main (38f83a57aa8e Merge branch 'virtio-net-support-af_xd=
p-zero-copy-tx')
Merging bluetooth/master (269f7b219173 Bluetooth: iso: Fix recursive lockin=
g warning)
Merging wireless-next/for-next (b20821248e26 Merge tag 'ath-next-20241209' =
of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath)
Merging ath-next/for-next (b20821248e26 Merge tag 'ath-next-20241209' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/ath/ath)
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
Merging crypto/master (f04be1dddc70 crypto: sig - Set maskset to CRYPTO_ALG=
_TYPE_MASK)
Merging drm/drm-next (fac04efc5c79 Linux 6.13-rc2)
Merging drm-exynos/for-linux-next (9794b89c50f7 Merge tag 'drm-xe-next-fixe=
s-2024-11-28' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging drm-misc/for-linux-next (6b4dfdcde357 drm/rockchip: vop2: Fix the m=
ixer alpha setup for layer 0)
Merging amdgpu/drm-next (7ecc7329c4dd drm/amdkfd: Uninitialized pointer rea=
d)
Merging drm-intel/for-linux-next (d82bb731e760 drm/i915/display: use drm_pr=
int_hex_dump() for buffer mismatch dumps)
  2504a316b35d ("drm/i915/color: Stop using non-posted DSB writes for legac=
y LUT")
  754302a5bc1b ("drm/i915: Fix NULL pointer dereference in capture_engine")
  9bc5e7dc694d ("drm/i915: Fix memory leak by correcting cache object name =
in error handler")
  ecba559a88ab ("drm/i915/dsb: Don't use indexed register writes needlessly=
")
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_ds=
b.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/display/xe_display=
.c
Merging drm-msm/msm-next (86313a9cd152 drm/msm/dpu: rework documentation co=
mments)
Merging drm-msm-lumag/msm-next-lumag (86313a9cd152 drm/msm/dpu: rework docu=
mentation comments)
Merging drm-xe/drm-xe-next (65338639b79c drm/xe: Call invalidation_fence_fi=
ni for PT inval fences in error state)
Applying: fix up for "drm/xe/ptl: Add another PTL PCI ID"
Merging etnaviv/etnaviv/next (6bef484c5e9a drm/etnaviv: Add fdinfo support =
for memory stats)
Merging fbdev/for-next (40384c840ea1 Linux 6.13-rc1)
Merging regmap/for-next (1331fb664044 regmap: Merge up v6.12-rc2)
Merging sound/for-next (acf5a2f08f85 ALSA: seq: oss: fix typo in seq_oss_in=
it.c)
Merging ieee1394/for-next (ce4339d021c4 firewire: ohci: use generic power m=
anagement)
Merging sound-asoc/for-next (01c8232ff5b4 Merge remote-tracking branch 'aso=
c/for-6.14' into asoc-next)
Merging modules/modules-next (3c9c790d218e module: Put known GPL offenders =
in an array)
Merging input/next (04337738629e Input: mpr121 - use devm_regulator_get_ena=
ble_read_voltage())
Merging block/for-next (20c9c19e1853 Merge branch 'for-6.14/io_uring' into =
for-next)
Merging device-mapper/for-next (a573e404cbf2 dm-verity: remove the unused "=
data_start" variable)
Merging libata/for-next (9986ce65bebb ata: Constify struct pci_device_id)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (df425814019f mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (8ece9d248b85 dt-bindings: mfd: bd71828: Use charg=
er resistor in mOhm instead of MOhm)
Merging backlight/for-backlight-next (3adec6f907b6 MAINTAINERS: Use Daniel =
Thompson's korg address for Backlight work)
Merging battery/for-next (94ba531bf9cb power: ip5xxx_power: Fix uninitializ=
ed variable read)
Merging regulator/for-next (fe42bf00dd57 Merge remote-tracking branch 'regu=
lator/for-6.14' into regulator-next)
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
Merging watchdog/master (7cb1b4663150 Merge tag 'locking_urgent_for_v6.13_r=
c3' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging iommu/next (91da87d38cca iommu/amd: Add lockdep asserts for domain-=
>dev_list)
Merging audit/next (8bea8f86f7a1 Automated merge of 'dev' into 'next')
Merging devicetree/for-next (3a973ce1b918 of/irq: Correct element count for=
 array @dummy_imask in API of_irq_parse_raw())
Merging dt-krzk/for-next (5aab15cd4794 Merge branch 'next/dt64' into for-ne=
xt)
Merging mailbox/for-next (7f9e19f207be mailbox: pcc: Check before sending M=
CTP PCC response ACK)
Merging spi/for-next (3f3b063e0c6d spi: Unify and simplify fwnode related c=
hecks)
Merging tip/master (f84722cbed6c Merge branch into tip/master: 'x86/tdx')
CONFLICT (content): Merge conflict in include/linux/mm.h
CONFLICT (content): Merge conflict in include/linux/mm_types.h
CONFLICT (content): Merge conflict in kernel/fork.c
CONFLICT (content): Merge conflict in tools/testing/vma/vma_internal.h
Merging clockevents/timers/drivers/next (08b97fbd13de clocksource/drivers/a=
rm_arch_timer: Use of_property_present() for non-boolean properties)
Merging edac/edac-for-next (2e55bb9b71e1 EDAC/i10nm: Add Intel Clearwater F=
orest server support)
Merging ftrace/for-next (7dbc10961c8a tracing/dynevent: Adopt guard() and s=
coped_guard())
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
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (c74bfe4ffe8c KVM: riscv: selftests: Add S=
vade and Svadu Extension to get-reg-list test)
Merging kvm-x86/next (fac04efc5c79 Linux 6.13-rc2)
Merging xen-tip/linux-next (fac04efc5c79 Linux 6.13-rc2)
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
Merging thunderbolt/next (fac04efc5c79 Linux 6.13-rc2)
Merging usb-serial/usb-next (40384c840ea1 Linux 6.13-rc1)
Merging tty/tty-next (535a07698b8b serial: 8250_pci: Share WCH IDs with par=
port_serial driver)
Merging char-misc/char-misc-next (cdd30ebb1b9f module: Convert symbol names=
pace to string literal)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (42f7652d3eb5 Linux 6.12-rc4)
Merging fastrpc/for-next (40384c840ea1 Linux 6.13-rc1)
Merging fpga/for-next (b658e40be3c1 fpga: dfl: destroy/recreate feature pla=
tform device on port release/assign)
Merging icc/icc-next (40384c840ea1 Linux 6.13-rc1)
Merging iio/togreg (582d732bf689 iio: light: veml6030: add support for trig=
gered buffer)
Merging phy-next/next (b6096751a652 phy: sun4i-usb: Remove unused of_gpio.h)
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
Merging counter-next/counter-next (fac04efc5c79 Linux 6.13-rc2)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (49a9b01803e4 mux: constify mux class)
Merging dmaengine/next (7a155fefec85 dmaengine: amd: qdma: make read-only a=
rrays h2c_types and c2h_types static const)
Merging cgroup/for-next (d6821c9e4391 Merge branch 'for-6.13' into for-next)
Merging scsi/for-next (1fb3855b8a12 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (c9a71ca13f71 scsi: Constify struct pci_device_id)
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
Merging kselftest/next (efd97ab76e45 selftests: kselftest: Add ksft_test_re=
sult_xpass)
Merging kunit/test (40384c840ea1 Linux 6.13-rc1)
Merging kunit-next/kunit (40384c840ea1 Linux 6.13-rc1)
Merging livepatching/for-next (7e17e80c3a7e Merge branch 'for-6.14/stack-or=
der' into for-next)
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
Merging nvmem/for-next (ea4ef69b81f0 nvmem: imx-ocotp-ele: set word length =
to 1)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (4d4ace979a30 hyperv: Remove the now unused hype=
rv-tlfs.h files)
Merging auxdisplay/for-next (93b216cb312d auxdisplay: img-ascii-lcd: Consti=
fy struct img_ascii_lcd_config)
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
Merging rust/rust-next (fac04efc5c79 Linux 6.13-rc2)
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
Merging pwrseq/pwrseq/for-next (93e3c990fcd9 power: sequencing: qcom-wcn: a=
dd support for the WCN6750 PMU)
Merging capabilities-next/caps-next (d48da4d5ed7b security: add trace event=
 for cap_capable)
Merging ipe/next (d881f0eb6f23 scripts: ipe: polgen: remove redundant close=
 and error exit path)
Merging kcsan/next (b86f7c9fad06 kcsan: Remove redundant call of kallsyms_l=
ookup_name())
Merging crc/crc-next (72914faebaab MAINTAINERS: add entry for CRC library)
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)

--Sig_/tYdLsgz7K8ERKNo.gXbjtY0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdZDLgACgkQAVBC80lX
0Gzwkwf/Vx4+12jGiDtIpx4Z33tILRXs7z5cjaepBJ/A09DRNUnq99Qfvv7o+CcM
sI0xjNGDO5Ja4KD5Jyb2ONTCEb01XC7zVWo1C+7j9kfWjgnmZFeYz1QQHtQtg/Kd
+4rpYpPmilFPJahDGP/SHuo0+4zb5XP5xpoMhMexJZaq1UVbvoZj0Ndp3waMyGtm
WkStnPLXgnEV4hYhYWBRqMq0FILGptAhdhwmVs0UoQrJyYXmJwTNWYjSpgEkRwzL
5azDpKHACbb+tjL0xRm5fsiZ2pXYws2ApPceUDUnEa1U84XGQ/w9l19BU+vkZ+p6
Ue8porRoD+Wbg45my3KXmarzVBS56Q==
=njqU
-----END PGP SIGNATURE-----

--Sig_/tYdLsgz7K8ERKNo.gXbjtY0--

