Return-Path: <linux-next+bounces-4853-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E529DB17B
	for <lists+linux-next@lfdr.de>; Thu, 28 Nov 2024 03:32:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8614B281FEB
	for <lists+linux-next@lfdr.de>; Thu, 28 Nov 2024 02:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 124711EA90;
	Thu, 28 Nov 2024 02:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Lc9ryscF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD9628FC;
	Thu, 28 Nov 2024 02:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732761146; cv=none; b=fWtKDU5oKHg1ILK7AWDWUmXKLPeZnNJlCuEQrjEOSdUtYtqp0WLkOeT8iUGEkh/E01l+fSNO+CP8DynrsprEh42hz/9mkKbG6ZZgCDarl+RBdtJzUqp8Hot041KuyrZbcmJG0Ms9+/yyAWFR+SSUX+fT2JHVwR7dXfDHxfkbk/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732761146; c=relaxed/simple;
	bh=yeNr0FGnAIBXMV4p9Q1G2jviwkMTDPr8NNdidISkr6s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=P8WbDq/X2Y/ptuI0VSGhL15en7mn5sj0ZEORNbkI7Zzm24U+fEq2lSMB6aeCyUsBaxB6lxM8ESF07WbDzHY5+P48IfPu7wdMpAwNZy/CEOfRdA9glmM9eyxW4KewL0jOevZcweXWSc59EoOHPXzQhob5tMqNoFmT+Jbfqac0zNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Lc9ryscF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732761132;
	bh=4Is4IAbkpYImabs92ifKxWOxryTlorMV9hkZ/iD6ObM=;
	h=Date:From:To:Cc:Subject:From;
	b=Lc9ryscFERbyCzsnSaenQ+pIyxhFQJ2Ch05B8MnqNpcIHjclhFJuT8AJnswavtGGT
	 2TcGGpzEx8p2cFsW08GE0tZ9iOpeD2e31adNs06gqVVBo4/njX7GlU9eUN1QQh7fEd
	 MwLZh+4/Q5/yjt5CbsZfG2NdaidESpkG5Fmb7h85wHD24Hll/dfTrzbmg8VkkvE7YI
	 RukxqR3OytK+6YJFZ/3dGxmoYOopB1T4YlGDFFGFB9enIgFHx5KNW6+0Li+IXTjLdL
	 kI/EBVYDv/ZzxfNE3/4043MPcKmRjWE+vPLtQC+tatRHN7aC/Kt5jzqzpD5rkKTl9i
	 69kno0MFNqk7A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XzL1S0xFRz4x65;
	Thu, 28 Nov 2024 13:32:12 +1100 (AEDT)
Date: Thu, 28 Nov 2024 13:32:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 28
Message-ID: <20241128133214.6a39d091@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/I7vd312VYr3mVprI_QwvD2l";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/I7vd312VYr3mVprI_QwvD2l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

News: There will be no linux-next releases tomorrow or next week.

Changes since 20241127:

Non-merge commits (relative to Linus' tree): 1986
 2523 files changed, 98167 insertions(+), 103054 deletions(-)

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

I am currently merging 388 trees (counting Linus' and 149 trees of bug
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
Merging origin/master (9ad55a67a788 Merge tag 'soundwire-6.13-rc1' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire)
Merging fixes/fixes (87d6aab2389e Merge tag 'for_linus' of git://git.kernel=
.org/pub/scm/linux/kernel/git/mst/vhost)
Merging ext4-fixes/fixes (4a622e4d477b ext4: fix FS_IOC_GETFSMAP handling)
Merging vfs-brauner-fixes/vfs.fixes (cf87766dd6f9 Merge branch 'ovl.fixes')
Merging fscrypt-current/for-current (8e929cb546ee Linux 6.12-rc3)
Merging fsverity-current/for-current (8e929cb546ee Linux 6.12-rc3)
Merging btrfs-fixes/next-fixes (d22160d9bdb1 Merge branch 'misc-6.12' into =
next-fixes)
Merging vfs-fixes/fixes (678379e1d4f7 close_range(): fix the logics in desc=
riptor table trimming)
Merging erofs-fixes/fixes (ae54567eaa87 erofs: get rid of kaddr in `struct =
z_erofs_maprecorder`)
Merging nfsd-fixes/nfsd-fixes (adc218676eef Linux 6.12)
Merging v9fs-fixes/fixes/next (684a64bf32b6 Merge tag 'nfs-for-6.12-1' of g=
it://git.linux-nfs.org/projects/anna/linux-nfs)
Merging overlayfs-fixes/ovl-fixes (228a1157fb9f Merge tag '6.13-rc-part1-SM=
B3-client-fixes' of git://git.samba.org/sfrench/cifs-2.6)
Merging bcachefs/for-next (825e4c749495 bcachefs: BCH_FS_recovery_running)
Merging fscrypt/for-next (8e929cb546ee Linux 6.12-rc3)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (5f1be0369841 Merge branch 'for-next-next-v6.12-2024=
1111' into for-next-20241111)
Merging ceph/master (c5cf42030325 ceph: fix cred leak in ceph_mds_check_acc=
ess())
CONFLICT (content): Merge conflict in MAINTAINERS
Merging cifs/for-next (e999c5dd8104 cifs: update internal version number)
Merging configfs/for-next (84147f4e84c4 configfs: improve item creation per=
formance)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (200b977ebbc3 dlm: fix dlm_recover_members refcount on err=
or)
Merging erofs/dev (0bc8061ffc73 erofs: handle NONHEAD !delta[1] lclusters g=
racefully)
Merging exfat/dev (8a3f5711ad74 exfat: reduce FAT chain traversal)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (ba8ed2997666 quota: flush quota_release_work upon qu=
ota writeback)
Merging ext4/dev (3e7c69cdb053 jbd2: Fix comment describing journal_init_co=
mmon())
Merging f2fs/dev (bc8aeb04fd80 f2fs: fix to drop all discards after creatin=
g snapshot on lvm device)
Merging fsverity/for-next (8e929cb546ee Linux 6.12-rc3)
Merging fuse/for-next (d1dfb5f52ffc virtiofs: dax: remove ->writepages() ca=
llback)
Merging gfs2/for-next (ff2a7a064a69 Merge tag 'gfs2-for-6.13' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2)
Merging jfs/jfs-next (a174706ba4da jfs: add a check to prevent array-index-=
out-of-bounds in dbAdjTree)
Merging ksmbd/ksmbd-for-next (9a8c5d89d327 ksmbd: fix use-after-free in SMB=
 request handling)
Merging nfs/linux-next (20fde6c34d8e fs/nfs/io: make nfs_start_io_*() killa=
ble)
Merging nfs-anna/linux-next (867da60d463b nfs: avoid i_lock contention in n=
fs_clear_invalid_mapping)
Merging nfsd/nfsd-next (583772eec7b0 nfsd: allow for up to 32 callback sess=
ion slots)
Merging ntfs3/master (bac89bb33d91 fs/ntfs3: Accumulated refactoring change=
s)
Merging orangefs/for-next (96319dacaf15 orangefs: Constify struct kobj_type)
Merging overlayfs/overlayfs-next (c8b359dddb41 ovl: Filter invalid inodes w=
ith missing lookup function)
Merging ubifs/next (bcdcb115eaed ubifs: Fix uninitialized use of err in ubi=
fs_jnl_write_inode())
Merging v9fs/9p-next (e0260d530b73 net/9p/usbg: allow building as standalon=
e module)
Merging v9fs-ericvh/ericvh/for-next (684a64bf32b6 Merge tag 'nfs-for-6.12-1=
' of git://git.linux-nfs.org/projects/anna/linux-nfs)
Merging xfs/for-next (a8581099604d xfs: prevent mount and log shutdown race)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging file-locks/locks-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6-=
mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging iversion/iversion-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6=
-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging vfs-brauner/vfs.all (b2abcb2a5ace Merge branch 'vfs-6.14.netfs' int=
o vfs.all)
CONFLICT (content): Merge conflict in rust/kernel/task.rs
Merging vfs/for-next (1751606ac8dc Merge branches 'work.ufs', 'work.fd', 'w=
ork.statx2' and 'work.xattr2' into for-next)
Merging mm-hotfixes/mm-hotfixes-unstable (e44738abfeef fs/proc/vmcore.c: fi=
x warning when CONFIG_MMU=3Dn)
Merging fs-current (19f9183f0763 Merge branch 'next-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/kdave/linux.git)
Merging kbuild-current/fixes (59b723cd2adb Linux 6.12-rc6)
Merging arc-current/for-curr (91544a63920f ARC: bpf: Correct conditional ch=
eck in 'check_jmp_32')
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (dfdf714fed55 perf/arm-cmn: Ensure port =
and device id bits are set properly)
Merging arm-soc-fixes/arm/fixes (d62c9c5c4cbc Merge tag 'sunxi-fixes-for-6.=
12' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into arm=
/fixes)
Merging davinci-current/davinci/for-current (9852d85ec9d4 Linux 6.12-rc1)
Merging drivers-memory-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging sophgo-fixes/fixes (d99913e1b80b riscv: dts: Replace deprecated snp=
s,nr-gpios property for snps,dw-apb-gpio-port devices)
Merging m68k-current/for-linus (647619b6bd27 m68k: defconfig: Update defcon=
figs for v6.12-rc1)
Merging powerpc-fixes/fixes (a373830f96db KVM: PPC: Book3S HV: Mask off LPC=
R_MER for a vCPU before running it to avoid spurious interrupts)
Merging s390-fixes/fixes (3f020399e4f1 Merge tag 'sched-core-2024-11-18' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging net/main (5dfd7d940094 Merge branch 'bnxt_en-bug-fixes')
Merging bpf/master (3448ad23b34e selftests/bpf: Add apply_bytes test to tes=
t_txmsg_redir_wait_sndmem in test_sockmap)
Merging ipsec/master (c05c5e5aa163 xfrm: replay: Fix the update of replay_e=
sn->oseq_hi for GSO)
Merging netfilter/main (8ffade77b633 gve: Flow steering trigger reset only =
for timeout error)
Merging ipvs/main (35f56c554eb1 netfilter: ipset: add missing range check i=
n bitmap_ip_uadt)
Merging wireless/for-next (c05c62850a8f Merge tag 'wireless-2024-10-29' of =
https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless)
Merging ath/for-current (c05c62850a8f Merge tag 'wireless-2024-10-29' of ht=
tps://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless)
Merging wpan/master (eb09fbeb4870 mac802154: check local interfaces before =
deleting sdata list)
Merging rdma-fixes/for-rc (6abe2a908081 Revert "RDMA/core: Fix ENODEV error=
 for iWARP test over vlan")
Merging sound-current/for-linus (7be34f6feedd ALSA: ump: Fix evaluation of =
MIDI 1.0 FB info)
Merging sound-asoc-fixes/for-linus (b682aa788e5f ASoC: amd: yc: Add a quirk=
 for microfone on Lenovo ThinkPad P14s Gen 5 21MES00B00)
Merging regmap-fixes/for-linus (8cf0b93919e1 Linux 6.12-rc2)
Merging regulator-fixes/for-linus (831e9a7556ac Merge remote-tracking branc=
h 'regulator/for-6.12' into regulator-linus)
Merging spi-fixes/for-linus (e61fcd6dfae8 Merge remote-tracking branch 'spi=
/for-6.12' into spi-linus)
Merging pci-current/for-linus (9852d85ec9d4 Linux 6.12-rc1)
Merging driver-core.current/driver-core-linus (59b723cd2adb Linux 6.12-rc6)
Merging tty.current/tty-linus (42f7652d3eb5 Linux 6.12-rc4)
Merging usb.current/usb-linus (742afcc22d8e Merge tag 'usb-serial-6.12-rc7'=
 of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial int=
o usb-linus)
Merging usb-serial-fixes/usb-linus (2d5404caa8c7 Linux 6.12-rc7)
Merging phy/fixes (59b723cd2adb Linux 6.12-rc6)
Merging staging.current/staging-linus (807babf69027 staging: vchiq_arm: Use=
 devm_kzalloc() for drv_mgmt allocation)
Merging iio-fixes/fixes-togreg (f5a0ea554ca9 iio: adc: ti-ads1298: Add NULL=
 check in ads1298_init)
Merging counter-current/counter-current (1437d9f1c56f counter: ti-ecap-capt=
ure: Add check for clk_enable())
Merging char-misc.current/char-misc-linus (59b723cd2adb Linux 6.12-rc6)
Merging soundwire-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging thunderbolt-fixes/fixes (adc218676eef Linux 6.12)
Merging input-current/for-linus (0201710ba630 Merge branch 'next' into for-=
linus)
Merging crypto-current/master (4223414efeae crypto: marvell/cesa - fix unin=
it value for struct mv_cesa_op_ctx)
Merging vfio-fixes/for-linus (5a88a3f67e37 vfio/pci: Init the count variabl=
e in collecting hot-reset devices)
Merging kselftest-fixes/fixes (dc1308bee1ed selftests/watchdog-test: Fix sy=
stem accidentally reset after watchdog-test)
Merging dmaengine-fixes/fixes (59b723cd2adb Linux 6.12-rc6)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging mfd-fixes/for-mfd-fixes (68f860426d50 mfd: axp20x: AXP717: Fix miss=
ing IRQ status registers range)
Merging v4l-dvb-fixes/fixes (ecf2b43018da media: uvcvideo: Skip parsing fra=
mes of type UVC_VS_UNDEFINED in uvc_parse_format)
Merging reset-fixes/reset/fixes (2cf596636607 reset: starfive: jh71x0: Fix =
accessing the empty member on JH7110 SoC)
Merging mips-fixes/mips-fixes (819837584309 Linux 6.12-rc5)
Merging at91-fixes/at91-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging omap-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging kvm-fixes/master (7d4050728c83 Merge tag 'vfs-6.13-rc1.fixes' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs)
Merging kvms390-fixes/master (cff59d8631e1 s390/uv: Panic for set and remov=
e shared access UVC errors)
Merging hwmon-fixes/hwmon (7d4050728c83 Merge tag 'vfs-6.13-rc1.fixes' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs)
Merging nvdimm-fixes/libnvdimm-fixes (d5240fa65db0 nvdimm/pmem: Set dax fla=
g for all 'PFN_MAP' cases)
Merging cxl-fixes/fixes (3a2b97b3210b cxl/test: Improve init-order fidelity=
 relative to real-world systems)
Merging dma-mapping-fixes/for-linus (78b2770c935f dma-mapping: fix tracing =
dma_alloc/free with vmalloc'd memory)
Merging drivers-x86-fixes/fixes (43fb83c17ba2 Merge tag 'soc-arm-6.13' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/soc/soc)
Merging samsung-krzk-fixes/fixes (a03c246d4ec8 clk: samsung: Fix out-of-bou=
nd access of of_match_node())
Merging pinctrl-samsung-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging devicetree-fixes/dt/linus (61a6ba233fe1 dt-bindings: Unify "fsl,lio=
dn" type definitions)
Merging dt-krzk-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging scsi-fixes/fixes (54c814c8b23b scsi: ufs: core: Start the RTC updat=
e work later)
Merging drm-fixes/drm-fixes (adc218676eef Linux 6.12)
Merging drm-intel-fixes/for-linux-next-fixes (adc218676eef Linux 6.12)
Merging mmc-fixes/fixes (1635e407a4a6 Revert "mmc: dw_mmc: Fix IDMAC operat=
ion with pages bigger than 4K")
Merging rtc-fixes/rtc-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging gnss-fixes/gnss-linus (8e929cb546ee Linux 6.12-rc3)
Merging hyperv-fixes/hyperv-fixes (895384881ec9 hv: vmbus: Constify struct =
kobj_type and struct attribute_group)
Merging risc-v-fixes/fixes (57f7c7dc78cd drivers: perf: Fix wrong put_cpu()=
 placement)
Merging riscv-dt-fixes/riscv-dt-fixes (8e929cb546ee Linux 6.12-rc3)
Merging riscv-soc-fixes/riscv-soc-fixes (384f2024e1a1 MAINTAINERS: invert M=
isc RISC-V SoC Support's pattern)
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (de2f378f2b77 Merge tag 'nfsd-6.12-4' of git://git.=
kernel.org/pub/scm/linux/kernel/git/cel/linux)
Merging gpio-brgl-fixes/gpio/for-current (f57c08492866 gpio: mpsse: Remove =
usage of the deprecated ida_simple_xx() API)
Merging gpio-intel-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging pinctrl-intel-fixes/fixes (adc218676eef Linux 6.12)
Merging auxdisplay-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging kunit-fixes/kunit-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging memblock-fixes/fixes (8043832e2a12 memblock: use numa_valid_node() =
helper to check for invalid node ID)
Merging renesas-fixes/fixes (124f4f1a1869 MAINTAINERS: Re-add cancelled Ren=
esas driver sections)
Merging perf-current/perf-tools (6d78089da980 perf tests: Fix hwmon parsing=
 with PMU name test)
Merging efi-fixes/urgent (ae835a96d72c x86/efistub: Revert to heap allocate=
d boot_params for PE entrypoint)
Merging zstd-fixes/zstd-linus (77618db34645 zstd: Fix array-index-out-of-bo=
unds UBSAN warning)
Merging battery-fixes/fixes (7c626ce4bae1 Linux 6.11-rc3)
Merging iommufd-fixes/for-rc (9852d85ec9d4 Linux 6.12-rc1)
Merging rust-fixes/rust-fixes (1dc707e647bc rust: fix up formatting after m=
erge)
Merging w1-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging pmdomain-fixes/fixes (d2fab3fc27cb mailbox: qcom-cpucp: Mark the ir=
q with IRQF_NO_SUSPEND flag)
Merging i2c-host-fixes/i2c/i2c-host-fixes (523930e4528f MAINTAINERS: transf=
er i2c-aspeed maintainership from Brendan to Ryan)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (714398d8742d Merge tag 'qcom-clk-fixes-for-6.1=
2' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into clk-f=
ixes)
Merging pwrseq-fixes/pwrseq/for-current (9852d85ec9d4 Linux 6.12-rc1)
Merging thead-dt-fixes/thead-dt-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging ftrace-fixes/ftrace/fixes (fae4078c289a fgraph: Allocate ret_stack_=
list with proper size)
Merging ring-buffer-fixes/ring-buffer/fixes (09663753bb7c tracing/ring-buff=
er: Clear all memory mapped CPU ring buffers on first recording)
Merging trace-fixes/trace/fixes (2a13ca2e8abb tracing/hwlat: Fix a race dur=
ing cpuhp processing)
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (819837584309 Linux 6.12-rc5)
Merging tip-fixes/tip/urgent (afb7955d33d6 Merge branch into tip/master: 'x=
86/urgent')
Merging slab-fixes/slab/for-next-fixes (9c9201afebea mm/slab: fix warning c=
aused by duplicate kmem_cache creation in kmem_buckets_create)
Merging drm-misc-fixes/for-linux-next-fixes (86e8f94789dd drm/sti: Add __io=
mem for mixer_dbg_mxn's parameter)
Merging mm-stable/mm-stable (2532e6c74a67 cma: enforce non-zero pageblock_o=
rder during cma_init_reserved_mem())
Merging mm-nonmm-stable/mm-nonmm-stable (2c259a91d8d2 gdb: lx-symbols: do n=
ot error out on monolithic build)
Merging mm/mm-everything (3f8828bf146a foo)
Merging kbuild/for-next (5f2d24bd887d kbuild: rename .tmp_vmlinux.kallsyms0=
.syms to .tmp_vmlinux0.syms)
CONFLICT (content): Merge conflict in arch/powerpc/Makefile
CONFLICT (content): Merge conflict in tools/objtool/check.c
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (6d78089da980 perf tests: Fix hwmon parsing wi=
th PMU name test)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/for-next (22293c33738c dma-mapping: save base/size inst=
ead of pointer to shared DMA pool)
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
Merging at91/at91-next (44339d0de195 Merge branch 'at91-dt' into at91-next)
Merging broadcom/next (f4733d5e7751 Merge branch 'devicetree/next' into nex=
t)
Merging davinci/davinci/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging drivers-memory/for-next (1f1d847a6575 arm64: defconfig: Update defc=
onfig with now user-visible CONFIG_FSL_IFC)
Merging imx-mxs/for-next (6451378c2735 Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (3102ce10f311 Merge branch 'v6.12-next/dts64' int=
o for-next)
Merging mvebu/for-next (5f55ff35bfaa Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (1aedd4a93c6c Merge branch 'omap-for-v6.13/drivers' i=
nto tmp/omap-next-20241104.135423)
Merging qcom/for-next (30eb6f0b08b1 Merge branches 'arm32-for-6.13', 'arm64=
-defconfig-for-6.13', 'arm64-fixes-for-6.12', 'arm64-for-6.13', 'clk-fixes-=
for-6.12', 'clk-for-6.13', 'drivers-fixes-for-6.12' and 'drivers-for-6.13' =
into for-next)
Merging renesas/next (96a483856323 Merge branch 'renesas-fixes-for-v6.12' i=
nto renesas-next)
Merging reset/reset/next (cf3e10cc0e88 misc: lan966x_pci: Fix dtc warn 'Mis=
sing interrupt-parent')
Merging rockchip/for-next (41286036c994 Merge branch 'v6.12-armsoc/dtsfixes=
' into for-next)
Merging samsung-krzk/for-next (59a22cf03f67 Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (7aaa234c5ac6 Merge tag 'scmi-updates-6.13' of =
ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into =
for-linux-next)
Merging sophgo/for-next (b5cf65cc0fd0 riscv: dts: sophgo: Add emmc support =
for Huashan Pi)
Merging spacemit/for-next (819837584309 Linux 6.12-rc5)
Merging stm32/stm32-next (b0191a5cbc22 arm64: dts: st: add DMA support on S=
PI instances of stm32mp25)
Merging sunxi/sunxi/for-next (f13fea5381e2 Merge branches 'sunxi/dt-for-6.1=
3' and 'sunxi/clk-for-6.13' into sunxi/for-next)
Merging tee/next (9852d85ec9d4 Linux 6.12-rc1)
Merging tegra/for-next (2a4425682b6f Merge branch for-6.13/arm64/dt into fo=
r-next)
Merging thead-dt/thead-dt-for-next (7e756671a664 riscv: dts: thead: Add TH1=
520 ethernet nodes)
Merging ti/ti-next (6eaad8fca267 Merge branch 'ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (0e355cb69e19 Merge branch 'zynq/soc' into for-next)
Merging clk/clk-next (21a5352dc702 Merge branches 'clk-marvell', 'clk-adi',=
 'clk-qcom' and 'clk-devm' into clk-next)
Merging clk-imx/for-next (81a206d736c1 clk: imx: imx8-acm: Fix return value=
 check in clk_imx_acm_attach_pm_domains())
Merging clk-renesas/renesas-clk (3b42450ce177 clk: renesas: vbattb: Add VBA=
TTB clock driver)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (3c272a7551af LoongArch: Update Loongson-3=
 default config file)
Merging m68k/for-next (647619b6bd27 m68k: defconfig: Update defconfigs for =
v6.12-rc1)
Merging m68knommu/for-next (63a24cf8cc33 m68k: coldfire/device.c: only buil=
d FEC when HW macros are defined)
Merging microblaze/next (eb01f8f3c446 microblaze: mb: Use str_yes_no() help=
er in show_cpuinfo())
Merging mips/mips-next (4fbd66d8254c MIPS: Loongson64: DTS: Really fix PCIe=
 port nodes for ls7a)
Merging openrisc/for-next (1037d186edfc openrisc: Implement fixmap to fix e=
arlycon)
Merging parisc-hd/for-next (adc218676eef Linux 6.12)
Merging powerpc/next (cf89c9434af1 powerpc/prom_init: Fixup missing powerma=
c #size-cells)
Merging risc-v/for-next (8d4f1e05ff82 RISC-V: Remove unnecessary include fr=
om compat.h)
Merging riscv-dt/riscv-dt-for-next (c8b72c301dbe riscv: dts: starfive: add =
DeepComputing FML13V01 board device tree)
Merging riscv-soc/riscv-soc-for-next (8400291e289e Linux 6.11-rc1)
Merging s390/for-next (487ef5d4d912 s390/mm: Add PTE_MARKER support for hug=
etlbfs mappings)
Merging sh/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging sparc/for-next (b6370b338e71 sparc/vdso: Add helper function for 64=
-bit right shift on 32-bit target)
Merging uml/next (bed2cc482600 hostfs: Fix the NULL vs IS_ERR() bug for __f=
ilemap_get_folio())
Merging xtensa/xtensa-for-next (43a611dc43e4 xtensa: annotate dtb_start var=
iable as static __initdata)
Merging fs-next (6e2914cbfb15 Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (4022ef25504d Merge branch 'for-6.13-force-console'=
 into for-next)
Merging pci/next (10099266dec8 Merge branch 'pci/typos')
Merging pstore/for-next/pstore (9852d85ec9d4 Linux 6.12-rc1)
Merging hid/for-next (3be025406a0e Merge branch 'for-6.13/goodix' into for-=
next)
Merging i2c/i2c/for-next (44b682694a0c i2c: Fix whitespace style issue)
Merging i2c-host/i2c/i2c-host (68e7aa7ae92f MAINTAINERS: transfer i2c-aspee=
d maintainership from Brendan to Ryan)
Merging i3c/i3c/next (6cf7b65f7029 i3c: Use i3cdev->desc->info instead of c=
alling i3c_device_get_info() to avoid deadlock)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (3996187f80a0 hwmon: (pmbus/isl68137) add =
support for voltage divider on Vout)
Merging jc_docs/docs-next (83a474c11e8c docs: Add debugging guide for the m=
edia subsystem)
Merging v4l-dvb/next (72ad4ff63804 docs: media: update location of the medi=
a patches)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (f99ee8b8d78b Merge branches 'thermal-core' and 'ther=
mal-intel' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (b5e2058a7a60 cpufreq: fix using=
 cpufreq-dt as module)
Merging cpupower/cpupower (47d7650b9cb1 cpupower: add checks for xgettext a=
nd msgfmt)
Merging devfreq/devfreq-next (d47552124bb0 PM / devfreq: imx-bus: Use of_pr=
operty_present())
Merging pmdomain/next (5812b95b7ff4 pmdomain: Merge branch fixes into next)
Merging opp/opp/linux-next (d78653dcd8bf opp: core: implement dev_pm_opp_ge=
t_bw)
Merging thermal/thermal/linux-next (7d8abc5f3b5c thermal/drivers/imx_sc_the=
rmal: Use dev_err_probe)
Merging rdma/for-next (68b3bca2df00 RDMA/bnxt_re: Correct the sequence of d=
evice suspend)
Merging net-next/main (fcc79e1714e8 Merge tag 'net-next-6.13' of git://git.=
kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging bpf-next/for-next (fc39fb56917b Merge tag 'jfs-6.13' of github.com:=
kleikamp/linux-shaggy)
Merging ipsec-next/master (a35672819f8d xfrm: Fix acquire state insertion.)
Merging mlx5-next/mlx5-next (8ab3138a9b2d net/mlx5: Introduce data placemen=
t ordering bits)
Merging netfilter-next/main (38f83a57aa8e Merge branch 'virtio-net-support-=
af_xdp-zero-copy-tx')
Merging ipvs-next/main (544070db6c8b Merge branch 'mlx5-esw-qos-refactor-an=
d-shampo-cleanup')
Merging bluetooth/master (ad0d88dc33bb Bluetooth: SCO: remove the redundant=
 sco_conn_put)
Merging wireless-next/for-next (a71c69f51d11 Merge branch 'net-dsa-microchi=
p-add-lan9646-switch-support')
Merging ath-next/for-next (cdad73716057 wifi: ath12k: convert tasklet to BH=
 workqueue for CE interrupts)
Merging wpan-next/master (aad4b41a3419 Documentation: ieee802154: fix gramm=
ar)
Merging wpan-staging/staging (aad4b41a3419 Documentation: ieee802154: fix g=
rammar)
Merging mtd/mtd/next (944477516bda Merge tag 'nand/for-6.13' into mtd/next)
Merging nand/nand/next (af264e598905 mtd: spinand: Constify struct nand_ecc=
_engine_ops)
Merging spi-nor/spi-nor/next (98d1fb94ce75 mtd: spi-nor: core: replace dumm=
y buswidth from addr to data)
Merging crypto/master (4223414efeae crypto: marvell/cesa - fix uninit value=
 for struct mv_cesa_op_ctx)
Merging drm/drm-next (f2fdcd586865 Merge tag 'amd-drm-fixes-6.13-2024-11-22=
' of https://gitlab.freedesktop.org/agd5f/linux into drm-next)
Merging drm-exynos/for-linux-next (086ed1d51544 Merge tag 'exynos-drm-next-=
for-v6.13' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exy=
nos into drm-next)
Merging drm-misc/for-linux-next (818956c76517 drm/rockchip: avoid 64-bit di=
vision)
Merging amdgpu/drm-next (979bfe291b5b Revert "drm/radeon: Delay Connector d=
etecting when HPD singals is unstable")
Merging drm-intel/for-linux-next (376a33c4a0d8 drm/i915/hdcp: Fix when the =
first read and write are retried)
Merging drm-msm/msm-next (86313a9cd152 drm/msm/dpu: rework documentation co=
mments)
Merging drm-msm-lumag/msm-next-lumag (86313a9cd152 drm/msm/dpu: rework docu=
mentation comments)
Merging drm-xe/drm-xe-next (febc689b27d2 drm/xe/migrate: use XE_BO_FLAG_PAG=
ETABLE)
  15cf53ece417 ("drm/xe: Mark preempt fence workqueue as reclaim")
  553a5d14fcd9 ("drm/xe/ufence: Wake up waiters after setting ufence->signa=
lled")
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_exec_queue.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_ct.c
CONFLICT (modify/delete): include/drm/intel/xe_pciids.h deleted in HEAD and=
 modified in drm-xe/drm-xe-next.  Version drm-xe/drm-xe-next of include/drm=
/intel/xe_pciids.h left in tree.
$ git rm -f include/drm/intel/xe_pciids.h
Applying: fix up for "drm/xe/ptl: Add another PTL PCI ID"
Merging etnaviv/etnaviv/next (2c7ac7dd1b6c drm/etnaviv: etnaviv_cmdbuf.c: D=
rop the unneeded include of drm_mm.h)
Merging fbdev/for-next (adc218676eef Linux 6.12)
Merging regmap/for-next (d1f4390dd28b regmap: provide regmap_assign_bits())
Merging sound/for-next (7be34f6feedd ALSA: ump: Fix evaluation of MIDI 1.0 =
FB info)
Merging ieee1394/for-next (4752e8cde834 tools/firewire: Fix several incorre=
ct format specifiers)
Merging sound-asoc/for-next (b682aa788e5f ASoC: amd: yc: Add a quirk for mi=
crofone on Lenovo ThinkPad P14s Gen 5 21MES00B00)
Merging modules/modules-next (2466b3120142 tests/module/gen_test_kallsyms.s=
h: use 0 value for variables)
Merging input/next (04337738629e Input: mpr121 - use devm_regulator_get_ena=
ble_read_voltage())
Merging block/for-next (c06eb6c7ce04 Merge branch 'for-6.13/block' into for=
-next)
Merging device-mapper/for-next (a573e404cbf2 dm-verity: remove the unused "=
data_start" variable)
Merging libata/for-next (e8a2389ea808 dt-bindings: ata: ahci-platform: add =
missing iommus property)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (c0baf6ead75d mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (8ece9d248b85 dt-bindings: mfd: bd71828: Use charg=
er resistor in mOhm instead of MOhm)
Merging backlight/for-backlight-next (3adec6f907b6 MAINTAINERS: Use Daniel =
Thompson's korg address for Backlight work)
Merging battery/for-next (b6d445f6724d power: reset: ep93xx: add AUXILIARY_=
BUS dependency)
Merging regulator/for-next (831e9a7556ac Merge remote-tracking branch 'regu=
lator/for-6.12' into regulator-linus)
Merging security/next (a65d9d1d893b ima: uncover hidden variable in ima_mat=
ch_rules())
Merging apparmor/apparmor-next (1432b850e9f3 apparmor: lift new_profile dec=
laration to remove C23 extension warning)
Merging integrity/next-integrity (08ae3e5f5fc8 integrity: Use static_assert=
() to check struct sizes)
Merging selinux/next (d7b6918e22c7 selinux: Deprecate /sys/fs/selinux/user)
Merging smack/next (2749749afa07 smackfs: Use rcu_assign_pointer() to ensur=
e safe assignment in smk_set_cipso)
Merging tomoyo/master (adc218676eef Linux 6.12)
Merging tpmdd/next (5578b4347bb5 tpm: atmel: Drop PPC64 specific MMIO setup)
Merging watchdog/master (4962ee045d8f watchdog: rti: of: honor timeout-sec =
property)
Merging iommu/next (42f0cbb2a253 Merge branches 'intel/vt-d', 'amd/amd-vi' =
and 'iommufd/arm-smmuv3-nested' into next)
Merging audit/next (89282beaf75d audit: Use str_yes_no() helper function)
Merging devicetree/for-next (28b513b5a683 Merge branch 'dt/linus' into dt/n=
ext)
Merging dt-krzk/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging mailbox/for-next (7f9e19f207be mailbox: pcc: Check before sending M=
CTP PCC response ACK)
Merging spi/for-next (e61fcd6dfae8 Merge remote-tracking branch 'spi/for-6.=
12' into spi-linus)
Merging tip/master (233556ac49d4 Merge branch into tip/master: 'x86/mm')
Merging clockevents/timers/drivers/next (08b97fbd13de clocksource/drivers/a=
rm_arch_timer: Use of_property_present() for non-boolean properties)
Merging edac/edac-for-next (21c093a1626a Merge branch 'edac-drivers' into e=
dac-for-next)
Merging ftrace/for-next (cf415e8c74c8 Merge branch 'trace/trace/core' into =
HEAD)
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
Merging workqueues/for-next (85f0d8e39aff workqueue: Reduce expensive locks=
 for unbound workqueue)
Merging sched-ext/for-next (fc39fb56917b Merge tag 'jfs-6.13' of github.com=
:kleikamp/linux-shaggy)
Merging drivers-x86/for-next (43fb83c17ba2 Merge tag 'soc-arm-6.13' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/soc/soc)
Merging chrome-platform/for-next (ea45f3f46734 platform/chrome: Switch back=
 to struct platform_driver::remove())
Merging chrome-platform-firmware/for-firmware-next (32b0901e141f firmware: =
google: Unregister driver_info on failure)
Merging hsi/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging leds-lj/for-leds-next (e8501858035b leds: ss4200: Fix the wrong for=
mat specifier for 'blinking')
Merging ipmi/for-next (7868b3a94045 char:ipmi: Fix the wrong format specifi=
er)
Merging driver-core/driver-core-next (acfeb6defcb9 Fix a potential abuse of=
 seq_printf() format string in drivers)
CONFLICT (modify/delete): drivers/platform/x86/amd/hsmp.c deleted in HEAD a=
nd modified in driver-core/driver-core-next.  Version driver-core/driver-co=
re-next of drivers/platform/x86/amd/hsmp.c left in tree.
$ git rm -f drivers/platform/x86/amd/hsmp.c
Applying: fix up for "sysfs: treewide: constify attribute callback of bin_i=
s_visible()"
Applying: another fix for "sysfs: treewide: constify attribute callback of =
bin_is_visible()"
Merging usb/usb-next (237d4e0f4113 usb: typec: tcpm: Add support for sink-b=
c12-completion-time-ms DT property)
Merging thunderbolt/next (40aeea504447 thunderbolt: Replace deprecated PCI =
functions)
Merging usb-serial/usb-next (8b524944f92c USB: serial: ftdi_sio: Fix atomic=
ity violation in get_serial_info())
Merging tty/tty-next (b5a23a60e8ab serial: amba-pl011: fix build regression)
Merging char-misc/char-misc-next (5a6c35258d10 mei: vsc: Fix typo "maintste=
pping" -> "mainstepping")
CONFLICT (content): Merge conflict in rust/macros/module.rs
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (42f7652d3eb5 Linux 6.12-rc4)
Merging fastrpc/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging fpga/for-next (dbbd975cc6df fpga: Switch back to struct platform_dr=
iver::remove())
Merging icc/icc-next (b1fd28da86aa Merge branch 'icc-sar2130p' into icc-nex=
t)
Merging iio/togreg (20fd1383cd61 iio: Move __private marking before struct =
element priv in struct iio_dev)
Merging phy-next/next (32f4a76b8e7c phy: qcom: qmp: Fix lecacy-legacy typo)
Merging soundwire/next (dd690b31de0e soundwire: Minor formatting fixups in =
sdw.h header)
Merging extcon/extcon-next (9852d85ec9d4 Linux 6.12-rc1)
Merging gnss/gnss-next (8e929cb546ee Linux 6.12-rc3)
Merging vfio/next (fe4bf8d0b671 vfio/pci: Properly hide first-in-list PCIe =
extended capability)
Merging w1/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging spmi/spmi-next (9852d85ec9d4 Linux 6.12-rc1)
Merging staging/staging-next (114eae3c9fde Staging: gpib: gpib_os.c - Remov=
e unnecessary OOM message)
CONFLICT (modify/delete): drivers/staging/media/omap4iss/iss.c deleted in H=
EAD and modified in staging/staging-next.  Version staging/staging-next of =
drivers/staging/media/omap4iss/iss.c left in tree.
$ git rm -f drivers/staging/media/omap4iss/iss.c
Merging counter-next/counter-next (522ae89b7858 counter: intel-qep: Replace=
 deprecated PCI functions)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (49a9b01803e4 mux: constify mux class)
Merging dmaengine/next (8974f34de2ef dmaengine: loongson2-apb: Rename the p=
refix ls2x to loongson2)
Merging cgroup/for-next (d6821c9e4391 Merge branch 'for-6.13' into for-next)
Merging scsi/for-next (93fec6ecce50 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (019880c08d05 Merge patch series "scsi: ufs: Bug =
fixes for ufs core and platform drivers")
Merging vhost/linux-next (6a39bb15b3d1 virtio_vdpa: remove redundant check =
on desc)
Merging rpmsg/for-next (f9cbf229fa3a Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (bef29ca3a645 gpio: tegra186: Allow to enab=
le driver on Tegra234)
Merging gpio-intel/for-next (12b0e305f509 gpio: acpi: switch to device_for_=
each_child_node_scoped())
Merging pinctrl/for-next (1aa06a2eb276 Merge fixup)
CONFLICT (content): Merge conflict in drivers/pinctrl/pinctrl-aw9523.c
Merging pinctrl-intel/for-next (c6235c426d2a pinctrl: elkhartlake: Add supp=
ort for DSW community)
Merging pinctrl-renesas/renesas-pinctrl (f407af78c8d3 pinctrl: renesas: rzg=
2l: Use gpiochip_populate_parent_fwspec_twocell helper)
Merging pinctrl-samsung/for-next (6d2dbd4cec89 pinctrl: samsung: Add Exynos=
9810 SoC specific data)
Merging pwm/pwm/for-next (b2eaa1170e45 pwm: Assume a disabled PWM to emit a=
 constant inactive output)
Merging ktest/for-next (2351e8c65404 ktest.pl: Avoid false positives with g=
rub2 skip regex)
Merging kselftest/next (a44c26d7fa74 selftests/resctrl: Replace magic const=
ants used as array size)
Merging kunit/test (9852d85ec9d4 Linux 6.12-rc1)
Merging kunit-next/kunit (62adcae479fe kunit: qemu_configs: loongarch: Enab=
le shutdown)
Merging livepatching/for-next (9c66f50477e2 Merge branch 'for-6.13/selftest=
s-kprobe' into for-next)
Merging rtc/rtc-next (e0779a0dcf41 rtc: ab-eoz9: don't fail temperature rea=
ds on undervoltage notification)
CONFLICT (content): Merge conflict in arch/m68k/mvme147/config.c
Merging nvdimm/libnvdimm-for-next (f3dd9ae7f03a dax: Remove an unused field=
 in struct dax_operations)
Merging at24/at24/for-next (339cb28b9ee6 eeprom: at24: add ST M24256E Addit=
ional Write lockable page support)
Merging ntb/ntb-next (c620f56c70eb MAINTAINERS: Update AMD NTB maintainers)
Merging seccomp/for-next/seccomp (8cf8dfceebda seccomp: Stub for !HAVE_ARCH=
_SECCOMP_FILTER)
Merging fsi/next (c5eeb63edac9 fsi: Fix panic on scom file read)
Merging slimbus/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging nvmem/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (94e86b174d10 tools/hv: Add memory allocation ch=
eck in hv_fcopy_start)
Merging auxdisplay/for-next (0b028ff7e70e auxdisplay: Remove unused functio=
ns)
Merging kgdb/kgdb/for-next (24b2455fe8fc kdb: fix ctrl+e/a/f/b/d/p/n broken=
 in keyboard mode)
Merging hmm/hmm (8cf0b93919e1 Linux 6.12-rc2)
Merging cfi/cfi/next (9852d85ec9d4 Linux 6.12-rc1)
Merging mhi/mhi-next (bd23e836423e bus: mhi: host: pci_generic: Use pcim_io=
map_region() to request and map MHI BAR)
Merging memblock/for-next (98b7beba1ee6 memblock: uniformly initialize all =
reserved pages to MIGRATE_MOVABLE)
Merging cxl/next (a83383e2ae7c Merge branch 'cxl/for-6.13/dcd-prep' into cx=
l-for-next)
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (c5d91b16f525 efi: Fix memory leak in efivar_ssdt_load)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (9008fe8fad82 slab: Fix too strict alignment che=
ck in create_cache())
Merging random/master (d18c13697b4d prandom: Include <linux/percpu.h> in <l=
inux/prandom.h>)
Merging landlock/next (adc218676eef Linux 6.12)
Merging rust/rust-next (1dc707e647bc rust: fix up formatting after merge)
Merging sysctl/sysctl-next (9c738dae9534 sysctl: Reduce dput(child) calls i=
n proc_sys_fill_cache())
Merging execve/for-next/execve (45bf05a51842 exec: remove legacy custom bin=
fmt modules autoloading)
Merging bitmap/bitmap-for-next (af206905fa22 riscv: Always inline bitops)
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (f06e108a3dc5 Compiler Attributes: disable __cou=
nted_by for clang < 19.1.3)
Merging kspp-gustavo/for-next/kspp (6613476e225e Linux 6.8-rc1)
Merging nolibc/nolibc (9852d85ec9d4 Linux 6.12-rc1)
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (d53764723ecd iommu: Rename ops->domain_alloc_user=
() to domain_alloc_paging_flags())
Merging turbostat/next (fe66a63cae83 tools/power turbostat: Add RAPL psys a=
s a built-in counter)
Merging pwrseq/pwrseq/for-next (bd4c8bafcf50 power: sequencing: qcom-wcn: i=
mprove support for wcn6855)
Merging capabilities-next/caps-next (de2433c608c2 capabilities: remove cap_=
mmap_file())
Merging ipe/next (d881f0eb6f23 scripts: ipe: polgen: remove redundant close=
 and error exit path)
Merging kcsan/next (b86f7c9fad06 kcsan: Remove redundant call of kallsyms_l=
ookup_name())
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)

--Sig_/I7vd312VYr3mVprI_QwvD2l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdH1i8ACgkQAVBC80lX
0GwYrgf/f3C12PaVSoD2taCEg0J1zKanzmQRjKJmdEg23zWdNk3hrh+nZeTYCUN+
LQ1/nXfHe7I7IkTbUc0dMGG4yjHn70EkcOAaj3ujD5LsR7Nf0/xF1MCLSUt5AJOH
rHHlEtOSlrwpvpaqsQXzJ/km80K4S5m0Au0Rnw9fbFZ1ewNPYyvYQ2QiBv+M9vxr
FpT+Ochl/7tXKbddFsbjsBCpKSksO1rwLhwwpJ/hRx93onZn8tDp/1Ebl22eiXJq
DuOPSOqL3hhkkYwOVNkU0nPuCq6KYyyzkgyaOOjM2dNhlOnz4t7OTBbthL4CDjaG
b5LDAFu/fIJX35Uukjz85QyeHXNJPw==
=0MCN
-----END PGP SIGNATURE-----

--Sig_/I7vd312VYr3mVprI_QwvD2l--

