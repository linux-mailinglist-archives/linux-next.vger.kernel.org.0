Return-Path: <linux-next+bounces-5111-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A501BA06D7C
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 06:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BF11164754
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 05:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D2917C21E;
	Thu,  9 Jan 2025 05:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NuU0EFHk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E747EBA2D;
	Thu,  9 Jan 2025 05:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736400075; cv=none; b=gnD/myRHaQGYFoqx22Erct48uo3Wc4+GZbC2LHaa2hQlvGRkcUhzBu3aU3Qp822aByCI7XuIalifGZQjc7CixsbDojCzaMRuBqs7ImgtecF5S8UrL+Z82+2hftMmYjN4C8OdUrJSfPsUsYbeVvQuFt3vQEOytowXDUOysjURIqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736400075; c=relaxed/simple;
	bh=r+ErG1v0tRk7AFqVlQ0tiamTOwBnkl+RV1tuFY5wIjo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pf4Ot9IPlI82Bvkl4BM64syQ/7NhMNWOxZaFlbqrgyIwQHYIxB6J+AkWC3nzw9+u5dtn4VXddIF+bND7H/e5Kiomsaifxa/tD5Ykz1exfE3ECImpFLi1PNn4vqWMapH8s3XQFTLACCQqKTeuUEyOAWI93KlGEa/qyRXeljIz3vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NuU0EFHk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736400060;
	bh=wVtd5trp+wUifx3elHrUS0wp3qvRHUmyfwIy/cL/C1A=;
	h=Date:From:To:Cc:Subject:From;
	b=NuU0EFHk2uNnt6K/g8t2Qng/a3LY0qUoq/bUeZeYbbo8/bOMgFC9ba6UbxylIpe+K
	 Ph72tbZBKGnjA5uFPyopkhYXThq7DA592r7SCNPK8D943EpLhHk0KUEr28lTLmLNFC
	 U2j7+gjepDjQIpRDjurfd/3kyVMW4zV4ITvgpCeakpp0sPL7yMXYP7RN8ctjCfnnFN
	 q7LzNWPh5d8tiVIg/nO2pvrayY9vW1pEJnJhuKEntS/OmnR1svOOptXhRp4TOcwEGQ
	 bjsYG0ZH6Xu5ew0TPlwEB6NmZrnvQOk7om92kdNlbbXT2RO/mMvALoV2KzhOOEcZ/R
	 88mWMY1srIhiA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YTCmr0Vzvz4wbR;
	Thu,  9 Jan 2025 16:21:00 +1100 (AEDT)
Date: Thu, 9 Jan 2025 16:21:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jan 9
Message-ID: <20250109162106.53b15ec0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IBuunwMeurKje7DE7BURHCM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IBuunwMeurKje7DE7BURHCM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250108:

The staging.current tree lost its build failure.

The vfs-brauner tree gained a conflict against the nfs-anna tree.

The mm tree gained 2 build failures for which I applied patches.

The powerpc tree gained a conflict against the mm tree.

The nand tree lost its build failure.

The block tree gained a conflict against Linus' tree.

The pinctrl tree lost its build failure.

Non-merge commits (relative to Linus' tree): 6749
 6929 files changed, 312927 insertions(+), 113168 deletions(-)

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

I am currently merging 392 trees (counting Linus' and 150 trees of bug
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
Merging origin/master (eea6e4b4dfb8 Merge tag 'scsi-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging fixes/fixes (fac04efc5c79 Linux 6.13-rc2)
Merging ext4-fixes/fixes (4bbf9020becb Linux 6.13-rc4)
Merging vfs-brauner-fixes/vfs.fixes (368fcc5d3f8b Merge patch series "Fix e=
ncoding overlayfs fid for fanotify delete events")
Merging fscrypt-current/for-current (8e929cb546ee Linux 6.12-rc3)
Merging fsverity-current/for-current (8e929cb546ee Linux 6.12-rc3)
Merging btrfs-fixes/next-fixes (0da3bb028ff9 Merge branch 'misc-6.13' into =
next-fixes)
Merging vfs-fixes/fixes (678379e1d4f7 close_range(): fix the logics in desc=
riptor table trimming)
Merging erofs-fixes/fixes (6422cde1b0d5 erofs: use buffered I/O for file-ba=
cked mounts by default)
Merging nfsd-fixes/nfsd-fixes (7917f01a286c nfsd: restore callback function=
ality for NFSv4.0)
Merging v9fs-fixes/fixes/next (684a64bf32b6 Merge tag 'nfs-for-6.12-1' of g=
it://git.linux-nfs.org/projects/anna/linux-nfs)
Merging overlayfs-fixes/ovl-fixes (228a1157fb9f Merge tag '6.13-rc-part1-SM=
B3-client-fixes' of git://git.samba.org/sfrench/cifs-2.6)
Merging bcachefs/for-next (432522786827 bcachefs: check_unreachable_inodes =
is not actually PASS_ONLINE yet)
Merging fscrypt/for-next (8e929cb546ee Linux 6.12-rc3)
Merging afs/afs-next (3c9ca856fd12 afs: Make /afs/@cell and /afs/.@cell sym=
links)
Merging btrfs/for-next (89d69a57662b Merge branch 'for-next-next-v6.13-2025=
0107' into for-next-20250107)
Merging ceph/master (18d44c5d062b ceph: allocate sparse_ext map only for sp=
arse reads)
Merging cifs/for-next (c9ffff69547c smb: client: sync the root session and =
superblock context passwords before automounting)
Merging configfs/for-next (84147f4e84c4 configfs: improve item creation per=
formance)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (6784ed98fde5 dlm: return -ENOENT if no comm was found)
Merging erofs/dev (fcb9c5f9bf8f erofs: shorten bvecs[] for file-backed moun=
ts)
Merging exfat/dev (a5324b3a488d exfat: fix the infinite loop in __exfat_fre=
e_cluster())
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (94dfee45999c Merge fix for access beyond end of bitm=
ap in fanotify_init(2).)
Merging ext4/dev (4bbf9020becb Linux 6.13-rc4)
Merging f2fs/dev (df46161e4ed0 f2fs: fix to do sanity check correctly on i_=
inline_xattr_size)
Merging fsverity/for-next (8e929cb546ee Linux 6.12-rc3)
Merging fuse/for-next (78f2560fc9fa fuse: Set *nbytesp=3D0 in fuse_get_user=
_pages on allocation failure)
Merging gfs2/for-next (ead64b20f16e gfs2: reorder capability check last)
Merging jfs/jfs-next (a174706ba4da jfs: add a check to prevent array-index-=
out-of-bounds in dbAdjTree)
Merging ksmbd/ksmbd-for-next (e8580b4c600e ksmbd: Implement new SMB3 POSIX =
type)
Merging nfs/linux-next (4bbf9020becb Linux 6.13-rc4)
Merging nfs-anna/linux-next (4ec1de34e938 nfs: Make NFS_FSCACHE select NETF=
S_SUPPORT instead of depending on it)
Merging nfsd/nfsd-next (e43aefc29f18 nfsd: implement OPEN_ARGS_SHARE_ACCESS=
_WANT_OPEN_XOR_DELEGATION)
Merging ntfs3/master (55ad333de0f8 fs/ntfs3: Unify inode corruption marking=
 with _ntfs_bad_inode())
Merging orangefs/for-next (96319dacaf15 orangefs: Constify struct kobj_type)
Merging overlayfs/overlayfs-next (c8b359dddb41 ovl: Filter invalid inodes w=
ith missing lookup function)
Merging ubifs/next (b29bf7119d6b jffs2: Fix rtime decompressor)
Merging v9fs/9p-next (e0260d530b73 net/9p/usbg: allow building as standalon=
e module)
Merging v9fs-ericvh/ericvh/for-next (684a64bf32b6 Merge tag 'nfs-for-6.12-1=
' of git://git.linux-nfs.org/projects/anna/linux-nfs)
Merging xfs/for-next (7ee7c9b39ed3 xfs: don't return an error from xfs_upda=
te_last_rtgroup_size for !XFS_RT)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging file-locks/locks-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6-=
mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging iversion/iversion-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6=
-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging vfs-brauner/vfs.all (2d1a3e6a54e3 Merge branch 'vfs-6.14.libfs' int=
o vfs.all)
CONFLICT (content): Merge conflict in fs/nfsd/filecache.c
Merging vfs/for-next (5cc68af412a9 fs/overlayfs/namei.c: get rid of include=
 ../internal.h)
Merging mm-hotfixes/mm-hotfixes-unstable (b74a9a90ec13 zram: fix potential =
UAF of zram table)
Merging fs-current (b7fe9b203d40 Merge branch 'next-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/kdave/linux.git)
Merging kbuild-current/fixes (385443057f47 kbuild: pacman-pkg: provide vers=
ioned linux-api-headers package)
Merging arc-current/for-curr (78d4f34e2115 Linux 6.13-rc3)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (926e86205897 arm64/signal: Silence spar=
se warning storing GCSPR_EL0)
Merging arm-soc-fixes/arm/fixes (a31ffd6ed5ee Merge tag 'arm-soc/for-6.13/d=
evicetree-arm64-fixes' of https://github.com/Broadcom/stblinux into arm/fix=
es)
Merging davinci-current/davinci/for-current (9852d85ec9d4 Linux 6.12-rc1)
Merging drivers-memory-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging sophgo-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging m68k-current/for-linus (647619b6bd27 m68k: defconfig: Update defcon=
figs for v6.12-rc1)
Merging powerpc-fixes/fixes (05aa156e156e powerpc/pseries/vas: Add close() =
callback in vas_vm_ops struct)
Merging s390-fixes/fixes (282da38b4653 s390/mm: Consider KMSAN modules meta=
data for paging levels)
Merging net/main (f552b3037d0c Merge branch 'there-are-some-bugfix-for-the-=
hns3-ethernet-driver')
Merging bpf/master (9d89551994a4 Linux 6.13-rc6)
Merging ipsec/master (600258d555f0 xfrm: delete intermediate secpath entry =
in packet offload mode)
Merging netfilter/main (31f1b55d5d7e net :mana :Request a V2 response versi=
on for MANA_QUERY_GF_STAT)
Merging ipvs/main (31f1b55d5d7e net :mana :Request a V2 response version fo=
r MANA_QUERY_GF_STAT)
Merging wireless/for-next (146b6057e1fd wifi: cw1200: Fix potential NULL de=
reference)
Merging ath/for-current (f1d3334d604c wifi: cfg80211: sme: init n_channels =
before channels[] access)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (45d339fefaa3 RDMA/mlx5: Enable multiplane mode o=
nly when it is supported)
Merging sound-current/for-linus (8765429279e7 ALSA: seq: Check UMP support =
for midi_version change)
Merging sound-asoc-fixes/for-linus (088fb4ee17fc ALSA: doc: cs35l56: Add in=
formation about Cirrus Logic CS35L54/56/57)
Merging regmap-fixes/for-linus (9d89551994a4 Linux 6.13-rc6)
Merging regulator-fixes/for-linus (907af7d6e0c8 regulator: Move OF_ API dec=
larations/definitions outside CONFIG_REGULATOR)
Merging spi-fixes/for-linus (7f9a1eed1ad8 spi: rockchip-sfc: Fix error in r=
emove progress)
Merging pci-current/for-linus (15b8968dcb90 PCI/bwctrl: Fix NULL pointer de=
ref on unbind and bind)
Merging driver-core.current/driver-core-linus (b4aee757f1ba MAINTAINERS: al=
ign Danilo's maintainer entries)
Merging tty.current/tty-linus (0cfc36ea5168 serial: stm32: use port lock wr=
appers for break control)
Merging usb.current/usb-linus (b0e525d7a22e usb: typec: fix pm usage counte=
r imbalance in ucsi_ccg_sync_control())
Merging usb-serial-fixes/usb-linus (f5b435be70cb USB: serial: option: add N=
eoway N723-EA support)
Merging phy/fixes (17194c2998d3 phy: mediatek: phy-mtk-hdmi: add regulator =
dependency)
Merging staging.current/staging-linus (6f79db028e82 staging: gpib: mite: re=
move unused global functions)
Merging iio-fixes/fixes-togreg (f248a1066cf0 iio: light: as73211: fix chann=
el handling in only-color triggered buffer)
Merging counter-current/counter-current (fac04efc5c79 Linux 6.13-rc2)
Merging char-misc.current/char-misc-linus (c7a5378a0f70 misc: microchip: pc=
i1xxxx: Resolve return code mismatch during GPIO set config)
Merging soundwire-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging thunderbolt-fixes/fixes (9d89551994a4 Linux 6.13-rc6)
Merging input-current/for-linus (1863f213d3e8 Input: mma8450 - add chip ID =
check in probe)
Merging crypto-current/master (cd26cd654767 crypto: hisilicon/debugfs - fix=
 the struct pointer incorrectly offset problem)
Merging vfio-fixes/for-linus (09dfc8a5f2ce vfio/pci: Fallback huge faults f=
or unaligned pfn)
Merging kselftest-fixes/fixes (777f290ab328 selftests/ftrace: adjust offset=
 for kprobe syntax error test)
Merging dmaengine-fixes/fixes (ebc008699fd9 dmaengine: tegra: Return correc=
t DMA status when paused)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (140054a25f85 mtd: rawnand: omap2: Fix build wa=
rnings with W=3D1)
Merging mfd-fixes/for-mfd-fixes (68f860426d50 mfd: axp20x: AXP717: Fix miss=
ing IRQ status registers range)
Merging v4l-dvb-fixes/fixes (8b55f8818900 media: mediatek: vcodec: mark vde=
c_vp9_slice_map_counts_eob_coef noinline)
Merging reset-fixes/reset/fixes (1f8af9712413 reset: rzg2l-usbphy-ctrl: Ass=
ign proper of node to the allocated device)
Merging mips-fixes/mips-fixes (40384c840ea1 Linux 6.13-rc1)
Merging at91-fixes/at91-fixes (40384c840ea1 Linux 6.13-rc1)
Merging omap-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging kvm-fixes/master (8afa5b10af9d Merge tag 'kvm-x86-fixes-6.13-rcN' o=
f https://github.com/kvm-x86/linux into HEAD)
Merging kvms390-fixes/master (e376d958871c KVM: s390: selftests: Add has de=
vice attr check to uc_attr_mem_limit selftest)
Merging hwmon-fixes/hwmon (82163d63ae7a hwmon: (drivetemp) Fix driver produ=
cing garbage data when SCSI errors occur)
Merging nvdimm-fixes/libnvdimm-fixes (265e98f72bac acpi: nfit: vmalloc-out-=
of-bounds Read in acpi_nfit_ctl)
Merging cxl-fixes/fixes (fc033cf25e61 Linux 6.13-rc5)
Merging dma-mapping-fixes/for-linus (78b2770c935f dma-mapping: fix tracing =
dma_alloc/free with vmalloc'd memory)
Merging drivers-x86-fixes/fixes (7e16ae558a87 platform/x86: thinkpad-acpi: =
Add support for hotkey 0x1401)
Merging samsung-krzk-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging pinctrl-samsung-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging devicetree-fixes/dt/linus (8600058ba28a of: Add coreboot firmware t=
o excluded default cells list)
Merging dt-krzk-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging scsi-fixes/fixes (3b2f56860b05 scsi: ufs: qcom: Power down the cont=
roller/device during system suspend for SM8550/SM8650 SoCs)
Merging drm-fixes/drm-fixes (9d89551994a4 Linux 6.13-rc6)
Merging drm-intel-fixes/for-linux-next-fixes (77bf21a03a2a Revert "drm/i915=
/hdcp: Don't enable HDCP1.4 directly from check_link")
Merging mmc-fixes/fixes (8d90a86ed053 mmc: sdhci-msm: fix crypto key evicti=
on)
Merging rtc-fixes/rtc-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging gnss-fixes/gnss-linus (40384c840ea1 Linux 6.13-rc1)
Merging hyperv-fixes/hyperv-fixes (175c71c2acee tools/hv: reduce resource u=
sage in hv_kvp_daemon)
Merging risc-v-fixes/fixes (498d5b14db8c riscv: selftests: Fix warnings poi=
nter masking test)
Merging riscv-dt-fixes/riscv-dt-fixes (8d19d5a76bf6 riscv: dts: starfive: F=
ix a typo in StarFive JH7110 pin function definitions)
Merging riscv-soc-fixes/riscv-soc-fixes (48808b55b07c firmware: microchip: =
fix UL_IAP lock check in mpfs_auto_update_state())
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (e70140ba0d2b Get rid of 'remove_new' relic from pl=
atform driver struct)
Merging gpio-brgl-fixes/gpio/for-current (e59f4c97172d gpio: loongson: Fix =
Loongson-2K2000 ACPI GPIO register offset)
Merging gpio-intel-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging pinctrl-intel-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging auxdisplay-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging kunit-fixes/kunit-fixes (40384c840ea1 Linux 6.13-rc1)
Merging memblock-fixes/fixes (180bbad69864 arch_numa: Restore nid checks be=
fore registering a memblock with a node)
Merging renesas-fixes/fixes (124f4f1a1869 MAINTAINERS: Re-add cancelled Ren=
esas driver sections)
Merging perf-current/perf-tools (434fffa926b1 perf probe: Fix uninitialized=
 variable)
Merging efi-fixes/urgent (145ac100b637 efi/esrt: remove esre_attribute::sto=
re())
Merging zstd-fixes/zstd-linus (77618db34645 zstd: Fix array-index-out-of-bo=
unds UBSAN warning)
Merging battery-fixes/fixes (b3ded6072c56 power: supply: bq24190: Fix BQ242=
96 Vbus regulator support)
Merging iommufd-fixes/for-rc (2ca704f55e22 iommu/arm-smmu-v3: Improve uAPI =
comment for IOMMU_HW_INFO_TYPE_ARM_SMMUV3)
Merging rust-fixes/rust-fixes (78d4f34e2115 Linux 6.13-rc3)
Merging w1-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging pmdomain-fixes/fixes (f64f610ec6ab pmdomain: core: add dummy releas=
e function to genpd device)
Merging i2c-host-fixes/i2c/i2c-host-fixes (9d89551994a4 Linux 6.13-rc6)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (c38448100647 clk: clk-imx8mp-audiomix: fix fun=
ction signature)
Merging pwrseq-fixes/pwrseq/for-current (40384c840ea1 Linux 6.13-rc1)
Merging thead-dt-fixes/thead-dt-fixes (40384c840ea1 Linux 6.13-rc1)
Merging ftrace-fixes/ftrace/fixes (789a8cff8d2d ftrace: Fix function profil=
er's filtering functionality)
Merging ring-buffer-fixes/ring-buffer/fixes (8cd63406d081 trace/ring-buffer=
: Do not use TP_printk() formatting for boot mapped buffers)
Merging trace-fixes/trace/fixes (98feccbf32cf tracing: Prevent bad count fo=
r tracing_cpumask_write)
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (819837584309 Linux 6.12-rc5)
Merging tip-fixes/tip/urgent (e3b2cc94f5a7 Merge branch into tip/master: 'x=
86/urgent')
Merging slab-fixes/slab/for-next-fixes (b7ffecbe198e memcg: slub: fix SUnre=
claim for post charged objects)
Merging drm-msm-fixes/msm-fixes (789384eb1437 drm/msm/dpu: check dpu_plane_=
atomic_print_state() for valid sspp)
Merging drm-misc-fixes/for-linux-next-fixes (35243fc77756 drm/nouveau/disp:=
 Fix missing backlight control on Macbook 5,1)
Merging linus/for-next (fa47906ff358 vsnprintf: fix up kerneldoc for argume=
nt name changes)
Merging mm-stable/mm-stable (4bbf9020becb Linux 6.13-rc4)
Merging mm-nonmm-stable/mm-nonmm-stable (4bbf9020becb Linux 6.13-rc4)
Merging mm/mm-everything (9c6acd4366cf foo)
Applying: fix up for "mm: remove devmap related functions and page table bi=
ts"
Merging kbuild/for-next (b925599c78bc modpost: zero-pad CRC values in modve=
rsion_info array)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (ed60738a9b7e perf stat: Document and clarify =
outstate members)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/for-next (aef7ee7649e0 dma-debug: fix physical address =
calculation for struct dma_debug_entry)
Merging asm-generic/master (0af8e32343f8 empty include/asm-generic/vga.h)
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (6139f7913689 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (c64158747116 Merge branches 'for-next/cca', 'f=
or-next/cpufeature', 'for-next/docs', 'for-next/misc' and 'for-next/mm' int=
o for-next/core)
Merging arm-perf/for-next/perf (555c6e9b03c1 drivers/perf: hisi: Set correc=
t IRQ affinity for PMUs with no association)
Merging arm-soc/for-next (b5d57dcb2146 soc: document merges)
Merging amlogic/for-next (953913df9c3a Merge branch 'v6.15/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (ffc253263a13 Linux 6.6)
Merging aspeed/for-next (2eff056a229e ARM: dts: aspeed: Blueridge and Fuji:=
 Fix LED node names)
Merging at91/at91-next (bbc393c6e77b Merge branch 'at91-dt' into at91-next)
Merging broadcom/next (ed54a84051c6 Merge branch 'devicetree/next' into dev=
icetree-arm64/next)
Merging davinci/davinci/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging drivers-memory/for-next (af995eea227f Merge branch 'mem-ctrl-next' =
into for-next)
Merging imx-mxs/for-next (f89ee1bb86d7 Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (7605336e9d13 Merge branch 'v6.13-next/soc' into =
for-next)
Merging mvebu/for-next (a34c9fac85b2 arm64: dts: marvell: drop additional p=
hy-names for sata)
Merging omap/for-next (e1fc1384cf70 Merge branch 'omap-for-v6.14/drivers' i=
nto tmp/omap-next-20250107.145157)
Merging qcom/for-next (142c5153a81c Merge branches 'arm32-for-6.14', 'arm64=
-defconfig-for-6.14', 'arm64-fixes-for-6.13', 'arm64-for-6.14', 'clk-for-6.=
14' and 'drivers-for-6.14' into for-next)
Merging renesas/next (14af1e5de568 Merge branches 'renesas-arm-defconfig-fo=
r-v6.14', 'renesas-drivers-for-v6.14' and 'renesas-dts-for-v6.14' into rene=
sas-next)
Merging reset/reset/next (3d99f9231bed reset: amlogic: add support for A1 S=
oC in auxiliary reset driver)
Merging rockchip/for-next (1c2951978c84 Merge branch 'v6.14-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (228acaa82067 Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (b81ada150448 Merge tag 'scmi-updates-6.14' of =
ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into =
for-linux-next)
Merging sophgo/for-next (40384c840ea1 Linux 6.13-rc1)
Merging spacemit/for-next (e7cd95ad8013 riscv: dts: spacemit: add pinctrl p=
roperty to uart0 in BPI-F3)
Merging stm32/stm32-next (b7ebfb84a09d arm64: dts: st: enable imx335/csi/dc=
mipp pipeline on stm32mp257f-ev1)
Merging sunxi/sunxi/for-next (cc47f07a40d6 Merge branches 'sunxi/clk-fixes-=
for-6.13', 'sunxi/dt-for-6.14' and 'sunxi/clk-for-6.14' into sunxi/for-next)
Merging tee/next (a7562ff02879 Merge branch 'optee_for_v6.14' into next)
Merging tegra/for-next (ca398b41b0a3 Merge branch for-6.14/arm/dt into for-=
next)
Merging thead-dt/thead-dt-for-next (c95c1362e5bc riscv: dts: thead: Add mai=
lbox node)
Merging ti/ti-next (86e856a18264 Merge branches 'ti-k3-dts-next' and 'ti-k3=
-config-next' into ti-next)
Merging xilinx/for-next (3d431068ed63 Merge branch 'zynq/dt' into for-next)
Merging clk/clk-next (541b92fba641 Merge branch 'clk-xilinx' into clk-next)
Merging clk-imx/for-next (48806be08636 clk: imx: Apply some clks only for i=
.MX93)
Merging clk-renesas/renesas-clk (e91609f1c3b0 dt-bindings: clock: renesas,r=
9a08g045-vbattb: Fix include guard)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (7f71507851fc LoongArch: KVM: Protect kvm_=
io_bus_{read,write}() with SRCU)
Merging m68k/for-next (53036937a101 m68k: vga: Fix I/O defines)
Merging m68knommu/for-next (85876205ef8d m68k: coldfire: Use proper clock r=
ate for timers)
Merging microblaze/next (920354d7818b microblaze: Use of_property_present()=
 for non-boolean properties)
Merging mips/mips-next (40384c840ea1 Linux 6.13-rc1)
Merging openrisc/for-next (252b06459e7a openrisc: migrate to the generic ru=
le for built-in DTB)
Merging parisc-hd/for-next (df195d931a33 parisc: Remove memcpy_toio and mem=
set_io)
Merging powerpc/next (26bef359bc4f powerpc: Use str_on_off() helper in chec=
k_cache_coherency())
CONFLICT (content): Merge conflict in arch/powerpc/Kconfig
Merging risc-v/for-next (fac04efc5c79 Linux 6.13-rc2)
Merging riscv-dt/riscv-dt-for-next (708d55db3edb riscv: dts: starfive: jh71=
10-milkv-mars: enable usb0 host function)
Merging riscv-soc/riscv-soc-for-next (a5362510bafc Merge branch 'riscv-conf=
ig-for-next' into riscv-soc-for-next)
Merging s390/for-next (9012a436be9f Merge branch 'features' into for-next)
Merging sh/for-next (63e72e551942 sh: intc: Fix use-after-free bug in regis=
ter_intc_controller())
Merging sparc/for-next (b6370b338e71 sparc/vdso: Add helper function for 64=
-bit right shift on 32-bit target)
Merging uml/next (bed2cc482600 hostfs: Fix the NULL vs IS_ERR() bug for __f=
ilemap_get_folio())
Merging xtensa/xtensa-for-next (d14b9a713b34 xtensa/simdisk: Use str_write_=
read() helper in simdisk_transfer())
Merging fs-next (29f6c68c6b54 Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
  af6505e5745b ("fs: add RWF_DONTCACHE iocb and FOP_DONTCACHE file_operatio=
ns flag")
Merging printk/for-next (9022df7f5e05 Merge branch 'for-6.14-cpu_sync-fixup=
' into for-next)
Merging pci/next (94346fb4d119 Merge branch 'pci/misc')
Merging pstore/for-next/pstore (542243af7182 pstore/blk: trivial typo fixes)
Merging hid/for-next (2f18ba6583d1 Merge branch 'for-6.13/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (3cfe39b3a845 i2c: Replace list-based mechanism fo=
r handling userspace-created clients)
Merging i2c-host/i2c/i2c-host (4262df2a69c3 i2c: imx-lpi2c: make controller=
 available until the system enters suspend_noirq() and from resume_noirq().)
Merging i3c/i3c/next (6cf7b65f7029 i3c: Use i3cdev->desc->info instead of c=
alling i3c_device_get_info() to avoid deadlock)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (788bd792c74a hwmon: (pmbus/max15301) Add =
support for MAX15303)
Merging jc_docs/docs-next (9339d3587cff Merge branch 'docs-mw' into docs-ne=
xt)
CONFLICT (content): Merge conflict in scripts/checkpatch.pl
Merging v4l-dvb/next (94794b5ce4d9 media: platform: rzg2l-cru: rzg2l-video:=
 Fix the comment in rzg2l_cru_start_streaming_vq())
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (9a97e58e79aa Merge branch 'fixes' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (af6cc45af3db cpufreq: sparc: ch=
ange kzalloc to kcalloc)
Merging cpupower/cpupower (8d097444982d pm: cpupower: Add header changes fo=
r cpufreq.h to SWIG bindings)
Merging devfreq/devfreq-next (1f8ac4b95fee PM / devfreq: Switch back to str=
uct platform_driver::remove())
CONFLICT (content): Merge conflict in drivers/devfreq/event/exynos-nocp.c
CONFLICT (content): Merge conflict in drivers/devfreq/event/exynos-ppmu.c
CONFLICT (content): Merge conflict in drivers/devfreq/mtk-cci-devfreq.c
CONFLICT (content): Merge conflict in drivers/devfreq/rk3399_dmc.c
CONFLICT (content): Merge conflict in drivers/devfreq/sun8i-a33-mbus.c
Merging pmdomain/next (094041b17654 pmdomain: Merge branch fixes into next)
Merging opp/opp/linux-next (1d38eb7f7b26 OPP: OF: Fix an OF node leak in _o=
pp_add_static_v2())
Merging thermal/thermal/linux-next (7d8abc5f3b5c thermal/drivers/imx_sc_the=
rmal: Use dev_err_probe)
Merging rdma/for-next (c84f0f4f49d8 RDMA/bnxt_re: Fix to drop reference to =
the mmap entry in case of error)
CONFLICT (content): Merge conflict in drivers/infiniband/sw/rxe/rxe_net.c
CONFLICT (content): Merge conflict in drivers/infiniband/sw/siw/siw_main.c
CONFLICT (content): Merge conflict in drivers/infiniband/sw/siw/siw_verbs.c
Applying: fix up for "RDMA/rxe: Remove deliver net device event"
Merging net-next/main (7bf1659bad4e Merge branch 'intel-wired-lan-driver-up=
dates-2025-01-06-igb-igc-ixgbe-ixgbevf-i40e-fm10k')
Merging bpf-next/for-next (c125511d11b2 Merge branch 'bpf-next/master' into=
 for-next)
Merging ipsec-next/master (7082a6dc84eb net/mlx5e: Update TX ESN context fo=
r IPSec hardware offload)
Merging mlx5-next/mlx5-next (aeb3ec990269 net/mlx5: Add device cap abs_nati=
ve_port_num)
Merging netfilter-next/main (4b252f2dab2e Merge branch 'selftests-net-packe=
tdrill-import-multiple-tests')
Merging ipvs-next/main (4b252f2dab2e Merge branch 'selftests-net-packetdril=
l-import-multiple-tests')
Merging bluetooth/master (0eb19b741e48 Bluetooth: btmtk: Fix failed to send=
 func ctrl for MediaTek devices.)
Merging wireless-next/for-next (7bf1659bad4e Merge branch 'intel-wired-lan-=
driver-updates-2025-01-06-igb-igc-ixgbe-ixgbevf-i40e-fm10k')
Merging ath-next/for-next (3540bba855b4 wifi: ath12k: fix tx power, max reg=
 power update to firmware)
Merging wpan-next/master (3e5908172c05 Merge tag 'ieee802154-for-net-next-2=
025-01-03' of git://git.kernel.org/pub/scm/linux/kernel/git/wpan/wpan-next)
Merging wpan-staging/staging (3e5908172c05 Merge tag 'ieee802154-for-net-ne=
xt-2025-01-03' of git://git.kernel.org/pub/scm/linux/kernel/git/wpan/wpan-n=
ext)
Merging mtd/mtd/next (02ba194feacb mtd: mchp48l640: add support for Fujitsu=
 MB85RS128TY FRAM)
Merging nand/nand/next (6df2d9553e16 mtd: rawnand: davinci: Reduce polling =
interval in NAND_OP_WAITRDY_INSTR)
Merging spi-nor/spi-nor/next (93e00ccab5f7 mtd: spi-nor: macronix: remove m=
x25u25635f from parts list to enable SFDP)
Merging crypto/master (7fa481734016 crypto: ahash - make hash walk function=
s private to ahash.c)
Merging drm/drm-next (9cc06dbaf437 Merge tag 'drm-intel-next-2024-12-11' of=
 https://gitlab.freedesktop.org/drm/i915/kernel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_job=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_di=
splay_driver.c
Merging drm-exynos/for-linux-next (31b2be07afd0 drm/exynos: Remove unnecess=
ary checking)
Merging drm-misc/for-linux-next (34d813e45ecb drm/display: hdmi-state-helpe=
r: add drm_display_mode declaration)
Merging amdgpu/drm-next (6c9c97387be1 drm/amdgpu: Remove unnecessary NULL c=
heck)
Merging drm-intel/for-linux-next (3566784817ae drm/i915/display: Update DBU=
F_TRACKER_STATE_SERVICE only on appropriate platforms)
  fcf73e20cd1f ("Revert "drm/i915/hdcp: Don't enable HDCP1.4 directly from =
check_link"")
Merging drm-msm/msm-next (866e43b945bf drm/msm: UAPI error reporting)
Merging drm-msm-lumag/msm-next-lumag (a5463629299b drm/msm/dpu: Add RM supp=
ort for allocating CWB)
Merging drm-xe/drm-xe-next (3259ff4eff33 drm/xe/slpc: Remove unnecessary fo=
rce wakes)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_exec_queue.c
Applying: fix up for "drm/xe/ptl: Add another PTL PCI ID"
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (e4b6b665df81 fbdev: omap: use threaded IRQ for LCD =
DMA)
Merging regmap/for-next (d406b354df90 Expand SoundWire MBQ register map sup=
port)
Merging sound/for-next (2be952ee5f05 ALSA: firewire: Simplify with str_on_o=
ff())
Merging ieee1394/for-next (ce4339d021c4 firewire: ohci: use generic power m=
anagement)
Merging sound-asoc/for-next (d49e4cb59a82 Merge remote-tracking branch 'aso=
c/for-6.14' into asoc-next)
Merging modules/modules-next (b7e601302d58 module: sign with sha512 instead=
 of sha1 by default)
Merging input/next (21d8dd0daf4c Input: use guard notation in input core)
Merging block/for-next (20124a63d707 Merge branch 'for-6.14/block' into for=
-next)
CONFLICT (content): Merge conflict in drivers/md/dm-verity-fec.c
CONFLICT (content): Merge conflict in io_uring/uring_cmd.c
Merging device-mapper/for-next (bab4d7a18e2a dm: change kzalloc to kcalloc)
Merging libata/for-next (8c87215dd3a2 ata: libahci_platform: support non-co=
nsecutive port numbers)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (741521fa273f mmc: sdhci-msm: convert to use custom crypto=
 profile)
Merging mfd/for-mfd-next (c2b148f3bc94 mfd: Add support for AAEON UP board =
FPGA)
CONFLICT (content): Merge conflict in drivers/mfd/cs42l43.c
Merging backlight/for-backlight-next (40384c840ea1 Linux 6.13-rc1)
Merging battery/for-next (a3a8799165ff platform/x86: dell-laptop: Use power=
_supply_charge_types_show/_parse() helpers)
Merging regulator/for-next (d06f5e172aa6 Merge remote-tracking branch 'regu=
lator/for-6.14' into regulator-next)
Merging security/next (714d87c90a76 lockdown: initialize local array before=
 use to quiet static analysis)
Merging apparmor/apparmor-next (40384c840ea1 Linux 6.13-rc1)
Merging integrity/next-integrity (4785ed362a24 ima: ignore suffixed policy =
rule comments)
Merging selinux/next (854bc7623602 Automated merge of 'dev' into 'next')
Merging smack/next (6f71ad02aae8 smack: deduplicate access to string conver=
sion)
Merging tomoyo/master (08ae2487b202 tomoyo: automatically use patterns for =
several situations in learning mode)
Merging tpmdd/next (1c486a6477a6 KEYS: trusted: dcp: fix improper sg use wi=
th CONFIG_VMAP_STACK=3Dy)
Merging watchdog/master (b3db0b5356ff dt-bindings: watchdog: Document Qualc=
omm IPQ5424)
Merging iommu/next (e87528eafdc7 Merge branches 'arm/smmu/updates', 'arm/sm=
mu/bindings', 'qualcomm/msm', 'rockchip', 'riscv', 'core', 'intel/vt-d' and=
 'amd/amd-vi' into next)
Merging audit/next (8bea8f86f7a1 Automated merge of 'dev' into 'next')
Merging devicetree/for-next (456f3000f825 dt-bindings: soc: altera: convert=
 socfpga-system.txt to yaml)
Merging dt-krzk/for-next (dcdd69c1e196 Merge branch 'next/dt' into for-next)
Merging mailbox/for-next (7f9e19f207be mailbox: pcc: Check before sending M=
CTP PCC response ACK)
Merging spi/for-next (ccdfe4a50bad Merge remote-tracking branch 'spi/for-6.=
14' into spi-next)
Merging tip/master (bca469ddda2d Merge branch into tip/master: 'x86/tdx')
CONFLICT (content): Merge conflict in include/linux/mm.h
CONFLICT (content): Merge conflict in include/linux/mm_types.h
CONFLICT (content): Merge conflict in include/linux/mmap_lock.h
CONFLICT (content): Merge conflict in kernel/fork.c
CONFLICT (content): Merge conflict in mm/init-mm.c
CONFLICT (content): Merge conflict in tools/testing/vma/vma_internal.h
Merging clockevents/timers/drivers/next (08b97fbd13de clocksource/drivers/a=
rm_arch_timer: Use of_property_present() for non-boolean properties)
Merging edac/edac-for-next (36e45ffa7e61 Merge ras/edac-drivers into for-ne=
xt)
CONFLICT (content): Merge conflict in drivers/edac/i10nm_base.c
Merging ftrace/for-next (6492781961ad Merge tools/for-next)
Merging rcu/next (4b5c2205526c Merge branches 'fixes.2024.12.14a', 'rcutort=
ure.2024.12.14a', 'srcu.2024.12.14a' and 'torture-test.2024.12.14a' into rc=
u-merge.2024.12.14a)
CONFLICT (content): Merge conflict in kernel/rcu/tree.c
Merging paulmck/non-rcu/next (b6f62437f431 Merge branches 'csd-lock.2024.10=
.11a', 'lkmm.2024.11.09a' and 'scftorture.2024.11.09a', tag 'nolibc.2024.11=
.01a' into HEAD)
Merging kvm/next (10b2c8a67c4b Merge tag 'kvm-x86-fixes-6.13-rcN' of https:=
//github.com/kvm-x86/linux into HEAD)
Merging kvm-arm/next (88416867ce0a Merge branch kvm-arm64/misc-6.14 into kv=
marm-master/next)
Merging kvms390/next (7a1f3143377a KVM: s390: selftests: Add regression tes=
ts for PFCR subfunctions)
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (af79caa83f6a RISC-V: KVM: Add new exit st=
atstics for redirected traps)
Merging kvm-x86/next (13e98294d7ce Merge branches 'fixes', 'misc', 'mmu', '=
svm', 'vcpu_array' and 'vmx')
CONFLICT (content): Merge conflict in arch/x86/kvm/cpuid.c
Merging xen-tip/linux-next (fac04efc5c79 Linux 6.13-rc2)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (d57212f281fd workqueue: add printf attribute t=
o __alloc_workqueue())
Merging sched-ext/for-next (1708bce4cfe2 Merge branch 'for-6.13-fixes' into=
 for-next)
Merging drivers-x86/for-next (6b228cfc52a6 alienware-wmi: Use devm_platform=
_profile_register())
Merging chrome-platform/for-next (be4fccb5e1fb platform/chrome: cros_ec_lpc=
: Support direct EC register memory access)
Merging chrome-platform-firmware/for-firmware-next (7543d5702c2c firmware: =
google: vpd: Use const 'struct bin_attribute' callback)
Merging hsi/for-next (40384c840ea1 Linux 6.13-rc1)
Merging leds-lj/for-leds-next (29df7025cff0 leds: pwm-multicolor: Disable P=
WM when going to suspend)
Merging ipmi/for-next (83d8c79aa958 ipmi: ssif_bmc: Fix new request loss wh=
en bmc ready for a response)
Merging driver-core/driver-core-next (7687c66c18c6 kunit: platform: Resolve=
 'struct completion' warning)
Applying: fix up for "driver core: Constify API device_find_child() and ada=
pt for various usages"
Applying: fix up 2 for "driver core: Constify API device_find_child() and a=
dapt for various usages"
Merging usb/usb-next (f1a2241778d9 usb: typec: ucsi: Implement ChromeOS UCS=
I driver)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/qcom/x1e80100-qcp=
.dts
Merging thunderbolt/next (43d84701d2aa thunderbolt: Expose router DROM thro=
ugh debugfs)
Merging usb-serial/usb-next (138a99ca4e20 USB: serial: ch341: use fix-width=
 types consistently)
Merging tty/tty-next (4a495b97b273 tty: n_gsm: Fix control dlci ADM mode pr=
ocessing)
Merging char-misc/char-misc-next (148b88be249a MAINTAINERS: add slimbus doc=
umentation)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/nvm=
em/qcom,qfprom.yaml
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (56e14a21cee4 coresight-tpda: Optimize the function =
of reading element size)
Merging fastrpc/for-next (652631fe700a Merge branch 'fastrpc-for-6.14' into=
 fastrpc-for-next)
Merging fpga/for-next (46b155acbf4e fpga: dfl: destroy/recreate feature pla=
tform device on port release/assign)
Merging icc/icc-next (e20f7bfcd21e Merge branch 'icc-fixes' into icc-next)
Merging iio/togreg (577a66e2e634 iio: iio-mux: kzalloc instead of devm_kzal=
loc to ensure page alignment)
CONFLICT (content): Merge conflict in drivers/iio/adc/ti-ads1119.c
Merging phy-next/next (af1bc0ebe743 dt-bindings: phy: qcom,qmp-pcie: docume=
nt the SM8350 two lanes PCIe PHY)
Merging soundwire/next (74148bb59e20 soundwire: amd: clear wake enable regi=
ster for power off mode)
Merging extcon/extcon-next (7041ed0dde83 extcon: Drop explicit initializati=
on of struct i2c_device_id::driver_data to 0)
Merging gnss/gnss-next (40384c840ea1 Linux 6.13-rc1)
Merging vfio/next (e021e6cbfb5a vfio/pci: Expose setup ROM at ROM bar when =
needed)
Merging w1/for-next (419a40cc2bdd w1: core: use sysfs_emit() instead of spr=
intf())
Merging spmi/spmi-next (821b07853e32 spmi: hisi-spmi-controller: manage the=
 OF node reference in device initialization and cleanup)
Merging staging/staging-next (1737aaefa335 staging: gpib: tnt4882: Handle g=
pib_register_driver() errors)
Merging counter-next/counter-next (fac04efc5c79 Linux 6.13-rc2)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (49a9b01803e4 mux: constify mux class)
Merging dmaengine/next (98d187a98903 dmaengine: idxd: Enable Function Level=
 Reset (FLR) for halt)
Merging cgroup/for-next (3cb97a927fff cgroup/cpuset: remove kernfs active b=
reak)
Merging scsi/for-next (1fb3855b8a12 Merge branch 'fixes' into for-next)
CONFLICT (content): Merge conflict in drivers/ata/ahci.h
CONFLICT (content): Merge conflict in drivers/ata/sata_mv.c
CONFLICT (content): Merge conflict in include/linux/libata.h
Merging scsi-mkp/for-next (9673c075d8ee scsi: documentation: Corrections fo=
r struct updates)
CONFLICT (content): Merge conflict in drivers/ufs/host/ufs-qcom.c
Merging vhost/linux-next (a9e50e19ec45 virtio_blk: Add support for transpor=
t error recovery)
  006f0492f363 ("fs/proc/vmcore: disallow vmcore modifications while the vm=
core is open")
  23365031b34f ("fs/proc/vmcore: prefix all pr_* with "vmcore:"")
  26b866c242e5 ("fs/proc/vmcore: replace vmcoredd_mutex by vmcore_mutex")
  5488433f810c ("fs/proc/vmcore: move vmcore definitions out of kcore.h")
  5c04c6205add ("fs/proc/vmcore: convert vmcore_cb_lock into vmcore_mutex")
  98c5f8c3827a ("fs/proc/vmcore: factor out allocating a vmcore range and a=
dding it to a list")
  a127bc45d3de ("fs/proc/vmcore: factor out freeing a list of vmcore ranges=
")
  a4bba3b65c20 ("virtio-mem: support CONFIG_PROC_VMCORE_DEVICE_RAM")
  a8328b40b3b0 ("virtio-mem: mark device ready before registering callbacks=
 in kdump mode")
  b9ad8a711a3c ("virtio-mem: remember usable region size")
  e981e8d8b23e ("s390/kdump: virtio-mem kdump support (CONFIG_PROC_VMCORE_D=
EVICE_RAM)")
  ef78030ec96f ("fs/proc/vmcore: introduce PROC_VMCORE_DEVICE_RAM to detect=
 device RAM ranges in 2nd kernel")
Merging rpmsg/for-next (8c8df9bd3851 remoteproc: k3-r5: Add devm action to =
release tsp)
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (401239e1ec97 gpio: mpc8xxx: Add MPC8314 su=
pport)
Merging gpio-intel/for-next (12b0e305f509 gpio: acpi: switch to device_for_=
each_child_node_scoped())
Merging pinctrl/for-next (a3ece0e44e8d Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (40384c840ea1 Linux 6.13-rc1)
Merging pinctrl-renesas/renesas-pinctrl (829356da700b pinctrl: renesas: rzg=
2l: Add support for RZ/G3E SoC)
Merging pinctrl-samsung/for-next (0ebb1e9e1b12 pinctrl: samsung: update chi=
ld reference drop comment)
Merging pwm/pwm/for-next (78dcad6daa40 dt-bindings: pwm: Correct indentatio=
n and style in DTS example)
Merging ktest/for-next (2351e8c65404 ktest.pl: Avoid false positives with g=
rub2 skip regex)
Merging kselftest/next (ebb6ab1525b9 selftests: tmpfs: Add kselftest suppor=
t to tmpfs)
CONFLICT (content): Merge conflict in tools/testing/selftests/kselftest/kta=
p_helpers.sh
Merging kunit/test (40384c840ea1 Linux 6.13-rc1)
Merging kunit-next/kunit (40384c840ea1 Linux 6.13-rc1)
Merging livepatching/for-next (7e17e80c3a7e Merge branch 'for-6.14/stack-or=
der' into for-next)
Merging rtc/rtc-next (e0779a0dcf41 rtc: ab-eoz9: don't fail temperature rea=
ds on undervoltage notification)
Merging nvdimm/libnvdimm-for-next (f3dd9ae7f03a dax: Remove an unused field=
 in struct dax_operations)
Merging at24/at24/for-next (36036a164fac dt-bindings: eeprom: at24: Add com=
patible for Puya P24C256C)
Merging ntb/ntb-next (c620f56c70eb MAINTAINERS: Update AMD NTB maintainers)
Merging seccomp/for-next/seccomp (f90877dd7fb5 seccomp: Stub for !CONFIG_SE=
CCOMP)
Merging fsi/next (c5eeb63edac9 fsi: Fix panic on scom file read)
Merging slimbus/for-next (40384c840ea1 Linux 6.13-rc1)
Merging nvmem/for-next (40384c840ea1 Linux 6.13-rc1)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (d987b1de3c11 hv_balloon: Fallback to generic_on=
line_page() for non-HV hot added mem)
Merging auxdisplay/for-next (93b216cb312d auxdisplay: img-ascii-lcd: Consti=
fy struct img_ascii_lcd_config)
Merging kgdb/kgdb/for-next (24b2455fe8fc kdb: fix ctrl+e/a/f/b/d/p/n broken=
 in keyboard mode)
Merging hmm/hmm (40384c840ea1 Linux 6.13-rc1)
Merging cfi/cfi/next (40384c840ea1 Linux 6.13-rc1)
Merging mhi/mhi-next (29904a40127c bus: mhi: host: pci_generic: Enable MSI-=
X if the endpoint supports)
Merging memblock/for-next (98b7beba1ee6 memblock: uniformly initialize all =
reserved pages to MIGRATE_MOVABLE)
Merging cxl/next (2f84d072bdcb cxl/pci: Add CXL Type 1/2 support to cxl_dvs=
ec_rr_decode())
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (461fd55d17f0 efi/libstub: Use __free() helper for pool de=
allocations)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (c44d336ad5ba mm/slab: Move kvfree_rcu() into SL=
AB)
CONFLICT (content): Merge conflict in kernel/rcu/tree.c
Applying: fix up for "mm/slab: Move kvfree_rcu() into SLAB"
Merging random/master (d18c13697b4d prandom: Include <linux/percpu.h> in <l=
inux/prandom.h>)
Merging landlock/next (78d4f34e2115 Linux 6.13-rc3)
Merging rust/rust-next (0c5928deada1 rust: block: fix formatting in GenDisk=
 doc)
CONFLICT (content): Merge conflict in rust/kernel/miscdevice.rs
CONFLICT (content): Merge conflict in rust/kernel/security.rs
Merging sysctl/sysctl-next (9c738dae9534 sysctl: Reduce dput(child) calls i=
n proc_sys_fill_cache())
Merging execve/for-next/execve (c7c1167fcbbd Merge branch 'for-next/topic/e=
xecve/core' into for-next/execve)
Merging bitmap/bitmap-for-next (7f15d4abf925 cpu: Remove unused init_cpu_on=
line)
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (d9a67659846f Merge branch 'for-linus/hardening'=
 into for-next/kspp)
Merging kspp-gustavo/for-next/kspp (6613476e225e Linux 6.8-rc1)
Merging nolibc/nolibc (40384c840ea1 Linux 6.13-rc1)
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (11534b4de2a1 iommufd: Deal with IOMMU_HWPT_FAULT_=
ID_VALID in iommufd core)
Merging turbostat/next (75de0ab82fb4 tools/power turbostat: Add an NMI colu=
mn)
Merging pwrseq/pwrseq/for-next (93e3c990fcd9 power: sequencing: qcom-wcn: a=
dd support for the WCN6750 PMU)
Merging capabilities-next/caps-next (d48da4d5ed7b security: add trace event=
 for cap_capable)
Merging ipe/next (d881f0eb6f23 scripts: ipe: polgen: remove redundant close=
 and error exit path)
Merging kcsan/next (9d89551994a4 Linux 6.13-rc6)
Merging crc/crc-next (72914faebaab MAINTAINERS: add entry for CRC library)
Merging kthread/for-next (8044c5897674 rcu: Use kthread preferred affinity =
for RCU exp kworkers)
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)
Applying: fix up for "rmap: add support for PUD sized mappings to rmap"

--Sig_/IBuunwMeurKje7DE7BURHCM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd/XMIACgkQAVBC80lX
0GyIqAf7BlVp9Nu12oeTNRdWO4f8KINXvPm9yPnyEznupZeaUZ1YXeLXcDUdxO9z
ovBsCuaMOlpQGunL/Mg5ydR74/fhNO0gF2doPQ6XRjsL7ZgD+2r5LWYm3F9hZVqF
75IPxKN2TEC33rhMVA/rQRmHxPp2IyewBtT3/nfr+9fH7nSzKnsfJI6eDpwQdUfr
76iWZVmHskMalW/CIPDDflzfJ8wshVcnedbxFau4L/6pcvPGseggplTVRcx2IKeF
gXI5Oa7zs0VpTSJBvWl8NWHBd1EVCGuene3cDp1UlcejUa8lOz+DuecHgnjq+mtk
VVndpMxz/yTa5OFH90yzL8qhX78v1A==
=jPsG
-----END PGP SIGNATURE-----

--Sig_/IBuunwMeurKje7DE7BURHCM--

