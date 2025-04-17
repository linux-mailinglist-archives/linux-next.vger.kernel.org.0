Return-Path: <linux-next+bounces-6290-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 350EAA91577
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 09:41:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 945733AB8C5
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 07:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 080BE219A8C;
	Thu, 17 Apr 2025 07:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GyEESEcJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FE01E1DEB;
	Thu, 17 Apr 2025 07:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744875684; cv=none; b=XqFo+ajszAaZJRisPOY/6qrOaedXcyjq39Ktn2basS8jK5c93x0QEoEpJxNMvSKQU5O2vlama7qv5bEv29rc/oZUr5DUr2PBQXJxh8JepqHgAyWuypDQBCXNIEw8Awi9Pd73UW+9tKXkGiafANF2gpRO4Cx7j7kq6Ox5kINHtMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744875684; c=relaxed/simple;
	bh=HinRjpFpa5T45Uzh7RJ5HLk8Yr3NLWOejsx7Am5Q+iI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=njHTzLJoGSl9o29yDelD7KwiFbdof9i+eAAuE/GcUx6W9iZ+0mUzqwC5S+J4u9KddYTJesNe3B9zPnxwijmDWMenQob6ThST9kxeFJA1aIP0c0zLJp6azBIz3xJ1O1W1JEzG1pGFo1HSUPGEljLuW/IzxYrt0NiCrE+lpcA26r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GyEESEcJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744875677;
	bh=rj/TeWkF0sTXznINb13p+L2Vwb/VNH7+Lf6jNYPP0gI=;
	h=Date:From:To:Cc:Subject:From;
	b=GyEESEcJxgXXKpNwWWNfwWetqNreM0EO0jPQMQdEy5om4LMd3kdHDZDs53vxN/JeZ
	 f1glZ/6DqOYjSUw0lJ4j04nNAI5TdJNvyYSHW3pQT6oCyO1grec8o4Sf2nZ7faPr65
	 esdBZsQsxc/QQoUhwcUdAfw5Qi1dhwjFXNQ83sX7FKz9Xaga5IX/DSU7uH4O48a949
	 TfdlvuO8zM4/ZHYiNmWJ3Nagq30L9h8hQr6kfF4IMmJeC8DW1kNB9O5qs62O+K+bA8
	 EXsLnTcVAJnJ2E0Ana+iGldcGB07khAgBFySMJl1UctFRKgjGTPrSBrbnrwr/6AS3c
	 uu3AmODuPnETg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZdVFT5LTqz4x1w;
	Thu, 17 Apr 2025 17:41:17 +1000 (AEST)
Date: Thu, 17 Apr 2025 17:41:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 17
Message-ID: <20250417174117.014a23d2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/s8_Sal9FnY/DDjWakNZKc8e";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/s8_Sal9FnY/DDjWakNZKc8e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

News: there will be no linux-next releases tomorrow or Monday, next
Friday.

Changes since 20250416:

The mm-nonmm-unstable tree produced a lot of runtime messages for which
I reverted a commit.

The crypto tree gained a build failure so I used the version from
next-20250416.

The tip tree gained a conflict against the pm tree.
The tip tree still had its build failure so I used the version from
next-20250414.

The workqueues tree still had its build failure so I used the version
from next-20250414.

The tty tree gained a conflict against the devicetree tree.

Non-merge commits (relative to Linus' tree): 4094
 4470 files changed, 160875 insertions(+), 97303 deletions(-)

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

I am currently merging 389 trees (counting Linus' and 147 trees of bug
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
Merging origin/master (c1336865c4c9 Merge tag 'devicetree-fixes-for-6.15-1'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux)
Merging fixes/fixes (b3c623b9a94f Merge tag 'thermal-6.15-rc1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging ext4-fixes/fixes (4bbf9020becb Linux 6.13-rc4)
Merging vfs-brauner-fixes/vfs.fixes (a681b7c17dd2 fs: ensure that *path_loc=
ked*() helpers leave passed path pristine)
Merging fscrypt-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging fsverity-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging btrfs-fixes/next-fixes (16ce647f8360 Merge branch 'misc-6.15' into =
next-fixes)
Merging vfs-fixes/fixes (00cdfdcfa080 hypfs_create_cpu_files(): add missing=
 check for hypfs_mkdir() failure)
Merging erofs-fixes/fixes (f5ffef9881a7 erofs: remove duplicate code)
Merging nfsd-fixes/nfsd-fixes (a1d14d931bf7 nfsd: decrease sc_count directl=
y if fail to queue dl_recall)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (a6eb9a4a69cc ovl: remove unused forward =
declaration)
Merging bcachefs/for-next (b2dcbe2613ad docs: bcachefs: idle work schedulin=
g design doc)
Merging fscrypt/for-next (c07d3aede2b2 fscrypt: add support for hardware-wr=
apped keys)
Merging btrfs/for-next (2e23dc44f920 Merge branch 'for-next-next-v6.15-2025=
0415' into for-next-20250415)
Merging ceph/master (f452a2204614 ceph: Fix incorrect flush end position ca=
lculation)
Merging cifs/for-next (95d2b9f693ff Revert "smb: client: fix TCP timers dea=
dlock after rmmod")
Merging configfs/for-next (84147f4e84c4 configfs: improve item creation per=
formance)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (03d2b62208a3 dlm: make tcp still work in multi-link env)
Merging erofs/dev (0f24e3c05afe erofs: enable 48-bit layout support)
Merging exfat/dev (7819f9549ec0 exfat: do not clear volume dirty flag durin=
g sync)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (209e834cd5e6 Pull FAN_PRE_ACCESS on directory fanoti=
fy event support)
Merging ext4/dev (94824ac9a8aa ext4: fix off-by-one error in do_split)
Merging f2fs/dev (42cb74a92ada f2fs: prevent kernel warning due to negative=
 i_nlink from corrupted image)
Merging fsverity/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging fuse/for-next (0c58a97f919c fuse: remove tmp folio for writebacks a=
nd internal rb tree)
Merging gfs2/for-next (7ae29c71b7cc gfs2: check sb_min_blocksize return val=
ue)
Merging jfs/jfs-next (5dff41a86377 jfs: fix array-index-out-of-bounds read =
in add_missing_indices)
Merging ksmbd/ksmbd-for-next (a93ff742820f ksmbd: Prevent integer overflow =
in calculation of deadtime)
Merging nfs/linux-next (0af2f6be1b42 Linux 6.15-rc1)
Merging nfs-anna/linux-next (9084ed79ddaa lsm,nfs: fix memory leak of lsm_c=
ontext)
Merging nfsd/nfsd-next (fec8e74d6467 nfsd: nfsd4_spo_must_allow() must chec=
k this is a v4 compound request)
Merging ntfs3/master (0af2f6be1b42 Linux 6.15-rc1)
Merging orangefs/for-next (121a83ce6fe6 orangefs: Bufmap deadcoding)
Merging overlayfs/overlayfs-next (aabe43431746 ovl: Use str_on_off() helper=
 in ovl_show_options())
Merging ubifs/next (69146a8c893f ubi: ubi_get_ec_info: Fix compiling error =
'cast specifies array type')
Merging v9fs/9p-next (4210030d8bc4 docs: fs/9p: Add missing "not" in cache =
documentation)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (1c406526bd84 xfs: Fix spelling mistake "drity" -> "di=
rty")
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging vfs-brauner/vfs.all (43cb86c845a7 Merge branch 'vfs-6.16.iomap' int=
o vfs.all)
  b1eb86b028e1 ("fs: ensure that *path_locked*() helpers leave passed path =
pristine")
Merging vfs/for-next (2e72b1e0aac2 Merge branch 'work.d_revalidate' into fo=
r-next)
Merging mm-hotfixes/mm-hotfixes-unstable (ac750f9bcc4e mm: fix ratelimit_pa=
ges update error in dirty_ratio_handler())
Merging fs-current (8dd62d30180a Merge branch 'nfsd-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/cel/linux)
Merging kbuild-current/fixes (80e54e84911a Linux 6.14-rc6)
Merging arc-current/for-curr (78d4f34e2115 Linux 6.13-rc3)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (f7edb07ad7c6 Fix mmu notifiers for rang=
e-based invalidates)
Merging arm-soc-fixes/arm/fixes (45d5fe1c53ba ARM: davinci: da850: fix sele=
cting ARCH_DAVINCI_DA8XX)
Merging davinci-current/davinci/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging drivers-memory-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging sophgo-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging m68k-current/for-linus (c94cf023dce3 m68k: defconfig: Update defcon=
figs for v6.14-rc1)
Merging powerpc-fixes/fixes (8ffd015db85f Linux 6.15-rc2)
Merging s390-fixes/fixes (8ffd015db85f Linux 6.15-rc2)
Merging net/main (adf6b730fc8d Merge tag 'linux-can-fixes-for-6.15-20250415=
' of git://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can)
Merging bpf/master (82303a059aab selftests/bpf: Mitigate sockmap_ktls disco=
nnect_after_delete failure)
Merging ipsec/master (028363685bd0 espintcp: remove encap socket caching to=
 avoid reference leak)
Merging netfilter/main (eaa517b77e63 ethtool: cmis_cdb: Fix incorrect read =
/ write length extension)
Merging ipvs/main (61f96e684edd Merge tag 'net-6.15-rc1' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/netdev/net)
Merging wireless/for-next (0937cb5f345c Revert "wifi: mac80211: Update skb'=
s control block key in ieee80211_tx_dequeue()")
Merging ath/for-current (0937cb5f345c Revert "wifi: mac80211: Update skb's =
control block key in ieee80211_tx_dequeue()")
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (ffc59e32c67e RDMA/bnxt_re: Remove unusable nq va=
riable)
Merging sound-current/for-linus (7338856257fc Merge tag 'asoc-fix-v6.15-rc1=
' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for=
-linus)
Merging sound-asoc-fixes/for-linus (68715cb5c0e0 ASoC: Intel: sof_sdw: Add =
NULL check in asoc_sdw_rt_dmic_rtd_init())
Merging regmap-fixes/for-linus (6ea36a3e12c5 Merge remote-tracking branch '=
regmap/for-6.14' into regmap-linus)
Merging regulator-fixes/for-linus (8ffd015db85f Linux 6.15-rc2)
Merging spi-fixes/for-linus (21f4314e66ed spi: tegra210-quad: add rate limi=
ting and simplify timeout error message)
Merging pci-current/for-linus (bc0b828ef6e5 Revert "PCI: Avoid reset when d=
isabled via sysfs")
Merging driver-core.current/driver-core-linus (b9792abb76ae drivers/base/me=
mory: Avoid overhead from for_each_present_section_nr())
Merging tty.current/tty-linus (e1ca3ff28ab1 serial: sifive: lock port in st=
artup()/shutdown() callbacks)
Merging usb.current/usb-linus (429a98abfc01 usb: typec: class: Unlocked on =
error in typec_register_partner())
Merging usb-serial-fixes/usb-linus (4cc01410e1c1 USB: serial: simple: add O=
WON HDS200 series oscilloscope support)
Merging phy/fixes (9cf118aafd66 phy: rockchip-samsung-dcphy: Add missing as=
signment)
Merging staging.current/staging-linus (0af2f6be1b42 Linux 6.15-rc1)
Merging iio-fixes/fixes-togreg (4551383e78d5 iio: imu: st_lsm6dsx: Fix wake=
up source leaks on device unbind)
Merging counter-current/counter-current (0af2f6be1b42 Linux 6.15-rc1)
Merging char-misc.current/char-misc-linus (4d239f447f96 firmware: stratix10=
-svc: Add of_platform_default_populate())
Merging soundwire-fixes/fixes (fd15594ba7d5 soundwire: bus: Fix race on the=
 creation of the IRQ domain)
Merging thunderbolt-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging input-current/for-linus (946661e3bef8 Merge branch 'next' into for-=
linus)
Merging crypto-current/master (b2e689baf220 crypto: ahash - Disable request=
 chaining)
Merging vfio-fixes/for-linus (2bd42b03ab6b vfio/pci: Virtualize zero INTx P=
IN if no pdev->irq)
Merging kselftest-fixes/fixes (07be53cfa81a selftests/ftrace: Differentiate=
 bash and dash in dynevent_limitations.tc)
Merging dmaengine-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (1c1fd374a2fe mtd: spinand: Fix build with gcc =
< 7.5)
Merging mfd-fixes/for-mfd-fixes (68f860426d50 mfd: axp20x: AXP717: Fix miss=
ing IRQ status registers range)
Merging v4l-dvb-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging reset-fixes/reset/fixes (38fec10eb60d Linux 6.14)
Merging mips-fixes/mips-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging at91-fixes/at91-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging omap-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging kvm-fixes/master (c478032df078 Merge tag 'kvmarm-fixes-6.15-1' of h=
ttps://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvms390-fixes/master (d8dfda5af0be KVM: s390: pv: fix race when mak=
ing a page secure)
Merging hwmon-fixes/hwmon (0af2f6be1b42 Linux 6.15-rc1)
Merging nvdimm-fixes/libnvdimm-fixes (265e98f72bac acpi: nfit: vmalloc-out-=
of-bounds Read in acpi_nfit_ctl)
Merging cxl-fixes/fixes (36aace15d9bd cxl/pci: Drop the parameter is_port o=
f cxl_gpf_get_dvsec())
Merging dma-mapping-fixes/dma-mapping-fixes (2042c352e21d dma/mapping.c: de=
v_dbg support for dma_addressing_limited)
Merging drivers-x86-fixes/fixes (fcf27a6a926f platform/x86: amd: pmf: Fix S=
TT limits)
Merging samsung-krzk-fixes/fixes (dd303e021996 soc: samsung: usi: prevent w=
rong bits inversion during unconfiguring)
Merging pinctrl-samsung-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging devicetree-fixes/dt/linus (d5f49921707c dt-bindings: soc: fsl: fsl,=
ls1028a-reset: Fix maintainer entry)
Merging dt-krzk-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging scsi-fixes/fixes (569330a34a31 scsi: ufs: Introduce quirk to extend=
 PA_HIBERN8TIME for UFS devices)
Merging drm-fixes/drm-fixes (8ffd015db85f Linux 6.15-rc2)
Merging drm-intel-fixes/for-linux-next-fixes (3a47280b7687 drm/i915/dp: Che=
ck for HAS_DSC_3ENGINES while configuring DSC slices)
Merging mmc-fixes/fixes (77183db6b8db mmc: renesas_sdhi: disable clocks if =
registering regulator failed)
Merging rtc-fixes/rtc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging gnss-fixes/gnss-linus (0af2f6be1b42 Linux 6.15-rc1)
Merging hyperv-fixes/hyperv-fixes (261ffd53cc8e Drivers: hv: Fix bad pointe=
r dereference in hv_get_partition_id)
Merging risc-v-fixes/fixes (615e705fc8c7 Merge tag 'riscv-fixes-6.15-rc3' o=
f ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into f=
ixes)
Merging riscv-dt-fixes/riscv-dt-fixes (1b133129ad6b riscv: dts: starfive: F=
ix a typo in StarFive JH7110 pin function definitions)
Merging riscv-soc-fixes/riscv-soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (0af2f6be1b42 Linux 6.15-rc1)
Merging gpio-brgl-fixes/gpio/for-current (b424bb88afb6 gpiolib: Allow to us=
e setters with return value for output-only gpios)
Merging gpio-intel-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging pinctrl-intel-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging auxdisplay-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging kunit-fixes/kunit-fixes (b26c1a85f3fc kunit: qemu_configs: SH: Resp=
ect kunit cmdline)
Merging memblock-fixes/fixes (ed471e198493 memblock tests: Fix mutex relate=
d build error)
Merging renesas-fixes/fixes (379c590113ce ARM: shmobile: smp: Enforce shmob=
ile_smp_* alignment)
Merging perf-current/perf-tools (2b7070291733 perf tools: Remove evsel__han=
dle_error_quirks())
Merging efi-fixes/urgent (11092db5b573 efivarfs: fix NULL dereference on re=
sume)
Merging battery-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging iommufd-fixes/for-rc (0af2f6be1b42 Linux 6.15-rc1)
Merging rust-fixes/rust-fixes (c1b4071ec3a6 rust: helpers: Add dma_alloc_at=
trs() and dma_free_attrs())
Merging w1-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging pmdomain-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging i2c-host-fixes/i2c/i2c-host-fixes (424eafe65647 i2c: cros-ec-tunnel=
: defer probe if parent EC is not present)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging pwrseq-fixes/pwrseq/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging thead-dt-fixes/thead-dt-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging ftrace-fixes/ftrace/fixes (2fa6a01345b5 tracing: Fix memory leak wh=
en reading set_event file)
Merging ring-buffer-fixes/ring-buffer/fixes (e4d4b8670c44 ring-buffer: Use =
flush_kernel_vmap_range() over flush_dcache_folio())
Merging trace-fixes/trace/fixes (8d7861ac507d rv: Fix out-of-bound memory a=
ccess in rv_is_container_monitor())
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging tip-fixes/tip/urgent (f737ab93945f Merge branch into tip/master: 'x=
86/urgent')
Merging slab-fixes/slab/for-next-fixes (d2f5819b6ed3 slab: ensure slab->obj=
_exts is clear in a newly allocated slab page)
Merging drm-msm-fixes/msm-fixes (ddfa00afae80 drm/msm/dpu: drop rogue intr_=
tear_rd_ptr values)
Merging uml-fixes/fixes (96178631c3f5 um: convert irq_lock to raw spinlock)
Merging drm-misc-fixes/for-linux-next-fixes (d27326a99992 dma-buf/sw_sync: =
Decrement refcount on error in sw_sync_ioctl_get_deadline())
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (0af2f6be1b42 Linux 6.15-rc1)
Merging mm-nonmm-stable/mm-nonmm-stable (0af2f6be1b42 Linux 6.15-rc1)
Merging mm-unstable/mm-unstable (0e68b850b1d3 vmalloc: use atomic_long_add_=
return_relaxed())
Merging mm-nonmm-unstable/mm-nonmm-unstable (9dfefafd6c9a watchdog: fix wat=
chdog may detect false positive of softlockup)
Merging kbuild/for-next (a7c699d090a1 kbuild: rpm-pkg: build a debuginfo RP=
M)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (1741189d843a perf ui browser hists: Set actio=
ns->thread before calling do_zoom_thread())
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging asm-generic/master (47a60391ae0e rwonce: fix crash by removing READ=
_ONCE() for unaligned read)
Merging alpha/alpha-next (1523226edda5 alpha: Use str_yes_no() helper in pc=
i_dac_dma_supported())
Merging arm/for-next (96e0b3558830 ARM: 9447/1: arm/memremap: fix arch_memr=
emap_can_ram_remap())
Merging arm64/for-next/core (c28f31deeacd arm64: Don't call NULL in do_comp=
at_alignment_fixup())
Merging arm-perf/for-next/perf (9651f7899cc5 perf/arm_cspmu: Fix missing io=
.h include)
Merging arm-soc/for-next (1990c01f0bcc Merge branch 'cznic/platform' into f=
or-next)
Merging amlogic/for-next (660bd24947f5 Merge branch 'v6.16/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (c1f3dce2455c Merge branch 'asahi-soc/=
dt' into asahi-soc/for-next)
Merging aspeed/for-next (bf8f48263c0e Merge remote-tracking branches 'aspee=
d/dt', 'aspeed/drivers', 'aspeed/fixes' and 'nuvoton/dt' into for-next)
Merging at91/at91-next (eec6ff604b20 Merge branch 'microchip-dt64' into at9=
1-next)
Merging broadcom/next (87b8fa3195af Merge branch 'devicetree-arm64/next' in=
to next)
Merging davinci/davinci/for-next (78e6b545e558 ARM: davinci: remove support=
 for da830)
Merging drivers-memory/for-next (eda787a933ad Merge branch 'mem-ctrl-next' =
into for-next)
Merging imx-mxs/for-next (90453dc4dee2 Merge branch 'imx/dt64' into for-nex=
t)
Merging mediatek/for-next (7a24a1c3ef8e Merge branch 'v6.15-next/dts64' int=
o for-next)
Merging mvebu/for-next (e85dce9d1b78 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (4349ce7c41af Merge branch 'omap-for-v6.16/drivers' i=
nto tmp/omap-next-20250410.174249)
Merging qcom/for-next (0316f040a048 Merge branches 'arm32-for-6.16', 'arm64=
-defconfig-for-6.16', 'arm64-for-6.16' and 'clk-for-6.16' into for-next)
Merging renesas/next (947ab9879b53 Merge branches 'renesas-arm-defconfig-fo=
r-v6.16', 'renesas-drivers-for-v6.16' and 'renesas-dts-for-v6.16' into rene=
sas-next)
Merging reset/reset/next (4a65326311ab reset: thead: Add TH1520 reset contr=
oller driver)
Merging rockchip/for-next (9aaa8bad6587 Merge branch 'v6.16-clk/next' into =
for-next)
Merging samsung-krzk/for-next (9e4c72333b5d Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (d520c7f6560e Merge branch 'for-next/scmi/updat=
es', tags 'juno-fix-6.15', 'ffa-fix-6.15' and 'scmi-fixes-6.15' of ssh://gi=
tolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-linu=
x-next)
Merging sophgo/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging spacemit/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging stm32/stm32-next (65954899a157 arm64: dts: st: add stm32mp215f-dk b=
oard support)
Merging sunxi/sunxi/for-next (69714722df19 arm64: dts: allwinner: h700: Add=
 hp-det-gpios for Anbernic RG35XX)
Merging tee/next (a7562ff02879 Merge branch 'optee_for_v6.14' into next)
Merging tegra/for-next (4e16110559c3 Merge branch for-6.15/arm64/dt into fo=
r-next)
Merging thead-dt/thead-dt-for-next (2bae46e3de2a riscv: dts: thead: Introdu=
ce power domain nodes with aon firmware)
Merging ti/ti-next (0af2f6be1b42 Linux 6.15-rc1)
Merging xilinx/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging clk/clk-next (0af2f6be1b42 Linux 6.15-rc1)
Merging clk-imx/for-next (06a61b5cb6a8 clk: imx8mp: inform CCF of maximum f=
requency of clocks)
Merging clk-renesas/renesas-clk (f6462eb04f24 clk: renesas: rzv2h: Add supp=
ort for RZ/V2N SoC)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (17ba839c3c6c LoongArch: Update Loongson-3=
 default config file)
Merging m68k/for-next (c94cf023dce3 m68k: defconfig: Update defconfigs for =
v6.14-rc1)
Merging m68knommu/for-next (e11396cf70fc m68k: coldfire: gpio: use new line=
 value setter callbacks)
Merging microblaze/next (920354d7818b microblaze: Use of_property_present()=
 for non-boolean properties)
Merging mips/mips-next (0af2f6be1b42 Linux 6.15-rc1)
Merging openrisc/for-next (af83ece87a1e openrisc: Add cacheinfo support)
Merging parisc-hd/for-next (38fec10eb60d Linux 6.14)
Merging powerpc/next (8ffd015db85f Linux 6.15-rc2)
Merging risc-v/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging riscv-dt/riscv-dt-for-next (38818f7c9c17 riscv: dts: starfive: jh71=
10-pine64-star64: enable USB 3.0 port)
Merging riscv-soc/riscv-soc-for-next (071afdd47346 Merge branches 'riscv-ca=
che-for-next' and 'riscv-config-for-next' into riscv-soc-for-next)
Merging s390/for-next (1c745df519d7 watchdog: diag288_wdt: Implement module=
 autoload)
Merging sh/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (33c9da5dfb18 um: Rewrite the sigio workaround based on ep=
oll and tgkill)
Merging xtensa/xtensa-for-next (3d6d238851df arch: xtensa: defconfig: Drop =
obsolete CONFIG_NET_CLS_TCINDEX)
Merging fs-next (56577cd0e671 Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (9827cd0d6498 Merge branch 'for-6.15-printf-attribu=
te' into for-next)
Merging pci/next (9db6873afda1 Merge branch 'pci/irq')
Merging pstore/for-next/pstore (8ffd015db85f Linux 6.15-rc2)
Merging hid/for-next (160957abbf99 Merge branch 'for-6.15/intel-ish' into f=
or-next)
Merging i2c/i2c/for-next (e7b66c2a2447 Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i2c-host/i2c/i2c-host (97a2e9ff93c4 i2c: scx200_acb: Replace dev_er=
r() with dev_err_probe() in probe function)
Merging i3c/i3c/next (0af2f6be1b42 Linux 6.15-rc1)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (86d264b68309 hwmon: (aht10) Drop doctype =
annotations from static functions)
Merging jc_docs/docs-next (43e9076a00b1 docs: Fix conflicting contributor i=
dentity info)
Merging v4l-dvb/next (14423fc3a4a2 media: venus: pm_helpers: add compatibil=
ity for dev_pm_genpd_set_hwmode on V4)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (cc8dd99628a2 Merge branch 'fixes' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (2b8e6b58889c cpufreq: cppc: Fix=
 invalid return value in .get() callback)
Merging cpupower/cpupower (0af2f6be1b42 Linux 6.15-rc1)
Merging devfreq/devfreq-next (f3253b23535f PM / devfreq: exynos: remove unu=
sed function parameter)
Merging pmdomain/next (08c42b51c804 pmdomain: core: Reset genpd->states to =
avoid freeing invalid data)
Merging opp/opp/linux-next (2014c95afece Linux 6.14-rc1)
Merging thermal/thermal/linux-next (1b4ef46fd666 thermal/drivers/qcom-spmi-=
temp-alarm: Drop unused driver data)
Merging rdma/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging net-next/main (ac1df712442c Merge branch 'net-ptp-driver-opt-in-for=
-supported-ptp-ioctl-flags')
Merging bpf-next/for-next (7991bf94996f Merge branch 'bpf-next/net' into fo=
r-next)
Merging ipsec-next/master (20eb35da409f xfrm: Remove unnecessary strscpy_pa=
d() size arguments)
Merging mlx5-next/mlx5-next (f550694e88b7 net/mlx5: Add IFC bits for PPCNT =
recovery counters group)
Merging netfilter-next/main (61f96e684edd Merge tag 'net-6.15-rc1' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ipvs-next/main (61f96e684edd Merge tag 'net-6.15-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging bluetooth/master (ffd068349018 Bluetooth: ISO: Fix getpeername not =
returning sockaddr_iso_bc fields)
Merging wireless-next/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging ath-next/for-next (176f3009ae59 wifi: ath12k: support 2 channels fo=
r single pdev device)
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (0af2f6be1b42 Linux 6.15-rc1)
Merging nand/nand/next (b0e63a0847ee dt-bindings: mtd: gpmi-nand: Add compa=
tible string for i.MX8 chips)
Merging spi-nor/spi-nor/next (eec373688d91 mtd: spi-nor: drop unused <linux=
/of_platform.h>)
Merging crypto/master (5f7325fbb3d4 crypto: poly1305 - remove rset and sset=
 fields of poly1305_desc_ctx)
$ git reset --hard HEAD^
Merging next-20250416 version of crypto
Merging drm/drm-next (b60301774a8f Merge tag 'drm-intel-next-2025-04-11' of=
 https://gitlab.freedesktop.org/drm/i915/kernel into drm-next)
Merging drm-exynos/for-linux-next (81a50378559b drm/exynos: Remove unnecess=
ary checking)
Merging drm-misc/for-linux-next (4890d68db651 drm/bridge: dw-hdmi: Avoid in=
cluding uapi headers)
Merging amdgpu/drm-next (c3abed53ca13 drm/amdkfd: Add rec SDMA engines supp=
ort with limited XGMI)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_mes=
.c
Merging drm-intel/for-linux-next (b484c1e225a6 drm/i915/pxp: fix undefined =
reference to `intel_pxp_gsccs_is_ready_for_sessions')
Merging drm-msm/msm-next (e6d19c998c52 drm/msm/a6xx+: Don't let IB_SIZE ove=
rflow)
Merging drm-msm-lumag/msm-next-lumag (83ee6d2ec52f dt-bindings: display/msm=
: dsi-controller-main: Add missing minItems)
Merging drm-nova/nova-next (f5b444361435 gpu: nova-core: remove completed V=
ec extentions from task list)
Merging drm-xe/drm-xe-next (d755887f8e5a drm/xe/dma_buf: stop relying on pl=
acement in unmap)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_device.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_pc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_pci.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_survivability_m=
ode.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_survivability_m=
ode.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_wa_oob.rules
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging regmap/for-next (2385ba6d1dc4 Merge branch 'regmap-linus' into regm=
ap-next)
Merging sound/for-next (bbf9d313492a ALSA: hda/cirrus_scodec_test: Moderniz=
e creation of dummy devices)
Merging ieee1394/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging sound-asoc/for-next (e57217db4926 Merge remote-tracking branch 'aso=
c/for-6.16' into asoc-next)
Merging modules/modules-next (1b7b9e30cf33 module: Make .static_call_sites =
read-only after init)
Merging input/next (4d395cb071a3 Input: goodix_berlin - add support for Ber=
lin-A series)
Merging block/for-next (e39b82b4c218 Merge branch 'block-6.15' into for-nex=
t)
Merging device-mapper/for-next (9ec4fca1244b dm-delay: don't busy-wait in k=
thread)
Merging libata/for-next (6aac5eddb78b ata: libata-core: Simplify ata_print_=
version_once)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (6b8dba9a7fdb mmc: alcor: Use str_read_write() helper)
Merging mfd/for-mfd-next (d0eceba4d133 dt-bindings: mfd: syscon: Add microc=
hip,sama7d65-secumod)
Merging backlight/for-backlight-next (e12d3e1624a0 backlight: pm8941: Add N=
ULL check in wled_configure())
Merging battery/for-next (51212ce95354 power: supply: gpio-charger: Fix wak=
eup source leaks on device unbind)
Merging regulator/for-next (14daefd22065 Merge remote-tracking branch 'regu=
lator/for-6.16' into regulator-next)
Merging security/next (0af2f6be1b42 Linux 6.15-rc1)
Merging apparmor/apparmor-next (3e45553acb14 apparmor: Remove unused variab=
le 'sock' in __file_sock_perm())
Merging integrity/next-integrity (976e5b974fef ima: process_measurement() n=
eedlessly takes inode_lock() on MAY_READ)
Merging selinux/next (05f1a939225e selinux: fix the kdoc header for task_av=
dcache_update)
Merging smack/next (a158a937d864 smack: recognize ipv4 CIPSO w/o categories)
Merging tomoyo/master (834a4a689699 Merge tag 'for-linus' of git://git.kern=
el.org/pub/scm/linux/kernel/git/rdma/rdma)
Merging tpmdd/next (ebaf911ba6e1 char: tpm: tpm-buf: Add sanity check fallb=
ack in read helpers)
Merging watchdog/master (9bc64d338b0b watchdog: sunxi_wdt: Add support for =
Allwinner A523)
Merging iommu/next (767e22001dfc iommu/tegra241-cmdqv: Fix warnings due to =
dmam_free_coherent())
Merging audit/next (654d61b8e0e2 audit: record AUDIT_ANOM_* events regardle=
ss of presence of rules)
Merging devicetree/for-next (a75769029292 dt-bindings: backlight: add TI LP=
8864/LP8866 LED-backlight drivers)
Merging dt-krzk/for-next (62db22c2af6c Merge branch 'next/dt64' into for-ne=
xt)
Merging mailbox/for-next (1ec12fd31ecc mailbox: Remove unneeded semicolon)
Merging spi/for-next (65d420ff8cda Merge remote-tracking branch 'spi/for-6.=
16' into spi-next)
Merging tip/master (f30607220075 Merge branch into tip/master: 'x86/sev')
CONFLICT (content): Merge conflict in arch/x86/Kconfig.assembler
CONFLICT (content): Merge conflict in drivers/cpufreq/acpi-cpufreq.c
$ git reset --hard HEAD^
Merging next-20250414 version of tip
CONFLICT (content): Merge conflict in arch/x86/Kconfig.assembler
CONFLICT (content): Merge conflict in arch/x86/kernel/e820.c
CONFLICT (content): Merge conflict in drivers/cpufreq/acpi-cpufreq.c
[master 1403d7941b23] next-20250414/tip
Merging clockevents/timers/drivers/next (0f920690a82c dt-bindings: timer: A=
dd SiFive CLINT2)
Merging edac/edac-for-next (58029c39cdc5 RAS/AMD/FMPM: Get masked address)
Merging ftrace/for-next (d85852264728 Merge tools/for-next)
Merging rcu/next (75cf58ef310a Merge branches 'rcu/misc-for-6.16', 'rcu/seq=
-counters-for-6.16' and 'rcu/torture-for-6.16' into rcu/for-next)
Merging paulmck/non-rcu/next (87d07e135725 Merge branches 'lkmm.2025.02.25a=
', 'nolibc.2025.03.07a' and 'stop-machine.2025.03.11a' into HEAD)
Merging kvm/next (fd02aa45bda6 Merge branch 'kvm-tdx-initial' into HEAD)
CONFLICT (content): Merge conflict in arch/x86/kvm/vmx/vmx.c
Merging kvm-arm/next (369c0122682c Merge branch 'kvm-arm64/pmu-fixes' into =
kvmarm/next)
Merging kvms390/next (0c7fbae5bc78 KVM: s390: Don't use %pK through debug p=
rinting)
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (b3f263a98d30 RISC-V: KVM: Optimize commen=
ts in kvm_riscv_vcpu_isa_disable_allowed)
Merging kvm-x86/next (c9ea48bb6ee6 Merge branch 'xen')
Merging xen-tip/linux-next (715ad3e0ec2b xen: fix multicall debug feature)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (2762750ac5c6 workqueue: Better document teardo=
wn for delayed_work)
$ git reset --hard HEAD^
Merging next-20250414 version of workqueues
Merging sched-ext/for-next (0b3046179360 sched_ext: Make scx_has_op a bitma=
p)
Merging drivers-x86/for-next (8c173c39e347 platform/x86:intel/pmc: Remove u=
nneeded io operations)
Merging chrome-platform/for-next (31d3bd592df5 platform/chrome: cros_kbd_le=
d_backlight: Fix build dependencies)
Merging chrome-platform-firmware/for-firmware-next (0af2f6be1b42 Linux 6.15=
-rc1)
Merging hsi/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging leds-lj/for-leds-next (cd704688cb84 leds: lp8860: Disable GPIO with=
 devm action)
Merging ipmi/for-next (37631eee2063 ipmi:si: Move SI type information into =
an info structure)
Merging driver-core/driver-core-next (0af2f6be1b42 Linux 6.15-rc1)
Merging usb/usb-next (169263214645 USB: core: Correct API usb_(enable|disab=
le)_autosuspend() prototypes)
CONFLICT (content): Merge conflict in drivers/usb/chipidea/ci_hdrc_imx.c
CONFLICT (content): Merge conflict in drivers/usb/host/xhci.h
Merging thunderbolt/next (1a760d10ded3 thunderbolt: Fix a logic error in wa=
ke on connect)
Merging usb-serial/usb-next (0af2f6be1b42 Linux 6.15-rc1)
Merging tty/tty-next (043806bc9dbc serial: sh-sci: Introduced sci_of_data)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/ser=
ial/snps-dw-apb-uart.yaml
Merging char-misc/char-misc-next (0af2f6be1b42 Linux 6.15-rc1)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (5442d22da7db Coresight: Fix a NULL vs IS_ERR() bug =
in probe)
Merging fastrpc/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga/for-next (e19890a0088b fpga: versal: remove incorrect of_match=
_ptr annotation)
Merging icc/icc-next (be73df376a97 Merge branch 'icc-sa8775p' into icc-next)
Merging iio/togreg (3159d40a2ca0 docs: iio: ad3552r: fix malformed table)
Merging phy-next/next (9d0ec51d7c22 phy: rockchip: samsung-hdptx: Add high =
color depth management)
Merging soundwire/next (0af2f6be1b42 Linux 6.15-rc1)
Merging extcon/extcon-next (7041ed0dde83 extcon: Drop explicit initializati=
on of struct i2c_device_id::driver_data to 0)
Merging gnss/gnss-next (0af2f6be1b42 Linux 6.15-rc1)
Merging vfio/next (860be250fc32 vfio/pci: Handle INTx IRQ_NOTCONNECTED)
Merging w1/for-next (a9b3ecc7bcf6 w1: Avoid -Wflex-array-member-not-at-end =
warnings)
Merging spmi/spmi-next (092c49673431 spmi: Only use Hikey 970 SPMI controll=
er driver when ARM64)
Merging staging/staging-next (d486f2e07836 staging: rtl8723bs: Rename varia=
bles)
Merging counter-next/counter-next (0af2f6be1b42 Linux 6.15-rc1)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (0af2f6be1b42 Linux 6.15-rc1)
Merging cgroup/for-next (551cc5a27be3 Merge branch 'for-6.16' into for-next)
Merging scsi/for-next (a1af6f1a1433 Merge branch '6.15/scsi-queue' into 6.1=
5/scsi-fixes)
Merging scsi-mkp/for-next (1f8eb2957900 scsi: target: Remove size arguments=
 when calling strscpy())
CONFLICT (content): Merge conflict in Documentation/ABI/testing/sysfs-drive=
r-ufs
CONFLICT (content): Merge conflict in drivers/ufs/core/ufshcd.c
CONFLICT (content): Merge conflict in include/ufs/ufs.h
Merging vhost/linux-next (8f055ba5cfa1 virtgpu: don't reset on shutdown)
Merging rpmsg/for-next (8532691d0a85 Merge branch 'rproc-next' into for-nex=
t)
Merging gpio-brgl/gpio/for-next (a5d8e0cc96ee gpio: tn48m: enable building =
the module with COMPILE_TEST=3Dy)
Merging gpio-intel/for-next (a02af05f41c7 Merge patch series "gpiolib: acpi=
: Fix missing info filling")
  8f4543e980ff ("gpio: ich: use new line value setter callbacks")
  b7a49fd57be3 ("gpio: graniterapids: use new line value setter callbacks")
Merging pinctrl/for-next (370b7e8e4665 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging pinctrl-renesas/renesas-pinctrl (abcdeb4e299a pinctrl: renesas: rza=
2: Fix missing of_node_put() call)
Merging pinctrl-samsung/for-next (a30692b4f81b pinctrl: samsung: Add filter=
 selection support for alive bank on gs101)
Merging pwm/pwm/for-next (bde5547f2e87 pwm: Better document return value of=
 pwm_round_waveform_might_sleep())
Merging ktest/for-next (5a1bed232781 ktest: Fix Test Failures Due to Missin=
g LOG_FILE Directories)
Merging kselftest/next (0af2f6be1b42 Linux 6.15-rc1)
Merging kunit/test (0af2f6be1b42 Linux 6.15-rc1)
Merging kunit-next/kunit (1d31d536871f kunit: qemu_configs: Disable faultin=
g tests on 32-bit SPARC)
Merging livepatching/for-next (a8e905a819fd Merge branch 'for-6.15/ftrace-t=
est' into for-next)
Merging rtc/rtc-next (d37058674646 rtc: da9063: simplify irq management)
Merging nvdimm/libnvdimm-for-next (ef1d3455bbc1 libnvdimm/labels: Fix divid=
e error in nd_label_data_init())
Merging at24/at24/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging ntb/ntb-next (0cadf92e93d4 NTB/msi: Remove unused functions)
Merging seccomp/for-next/seccomp (8ffd015db85f Linux 6.15-rc2)
Merging slimbus/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging nvmem/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (628cc040b3a2 x86/hyperv: fix an indentation iss=
ue in mshyperv.h)
Merging auxdisplay/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging kgdb/kgdb/for-next (afdbe49276ac kdb: Remove optional size argument=
s from strscpy() calls)
Merging hmm/hmm (c92ae5d4f53e fwctl: Fix repeated device word in log messag=
e)
Merging cfi/cfi/next (0af2f6be1b42 Linux 6.15-rc1)
Merging mhi/mhi-next (b60a0538cd7f bus: mhi: host: Address conflict between=
 power_up and syserr)
Merging memblock/for-next (3b394dff15e1 memblock tests: add test for memblo=
ck_set_node)
Merging cxl/next (73c117c17b56 cxl: core/region - ignore interleave granula=
rity when ways=3D1)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (0dc1754e16b4 efi/libstub: Avoid legacy decompressor zlib/=
zstd wrappers)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (bfedb6b93bc8 mm: kvmalloc: make kmalloc fast pa=
th real fast path)
Merging random/master (602c988b7827 prandom: remove next_pseudo_random32)
Merging landlock/next (6b4566400a29 selftests/landlock: Add PID tests for a=
udit records)
Merging rust/rust-next (0af2f6be1b42 Linux 6.15-rc1)
Merging rust-alloc/alloc-next (c3152988c047 rust: alloc: use `spare_capacit=
y_mut` to reduce unsafe)
Merging rust-pin-init/pin-init-next (7eb172143d55 Linux 6.14-rc5)
Merging rust-timekeeping/timekeeping-next (142d93914b85 rust: hrtimer: add =
maintainer entry)
Merging sysctl/sysctl-next (23b8bacf1547 sysctl: Close test ctl_headers wit=
h a for loop)
Merging execve/for-next/execve (8ffd015db85f Linux 6.15-rc2)
Merging bitmap/bitmap-for-next (8190beee19a7 build_bug.h: more user friendl=
y error messages in BUILD_BUG_ON_ZERO())
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (ce9baf7ce6e6 Merge branches 'for-linus/hardenin=
g' and 'for-next/hardening' into for-next/kspp)
Merging nolibc/nolibc (0af2f6be1b42 Linux 6.15-rc1)
Merging iommufd/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging turbostat/next (447c98c1ca4a tools/power turbostat: Add idle govern=
or statistics reporting)
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.8
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.c
Merging pwrseq/pwrseq/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging capabilities-next/caps-next (4ae89b1fe7c2 capability: Remove unused=
 has_capability)
Merging ipe/next (925df32541da ipe: add errno field to IPE policy load audi=
ting)
Merging kcsan/next (9d89551994a4 Linux 6.13-rc6)
Merging crc/crc-next (eb204926104a lib/crc: make the CPU feature static key=
s __ro_after_init)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)
Applying: Revert "watchdog: fix watchdog may detect false positive of softl=
ockup"

--Sig_/s8_Sal9FnY/DDjWakNZKc8e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgAsJ0ACgkQAVBC80lX
0Gy0Bgf+PTQQ16AnZRIexRwBuLl/aQ9uGFom6ZrU6DlFdHrpbupxbNt4B3NcJkOr
hlDV3CF68TBwqcQ9y8KUA18BziBkbV1V6H5bv2tKS5iIVR8/YWMYGVRsmLzzomWG
zLvWzBFkv1GmVcGK/kTmEgko9g2RqyQimYqHa7jYaluh9mkn/UgyQ3V+yTlYSx6h
zP77VlJa01aeBkmwz8FWgN1E7P+oy38iZJuwKiiC9V8tztj6gJWPSUwoLl1kFxdJ
CN0Aj/LmqmI3A7xfrNelKr+lLgo3dxFVJq9BuH0sYXKEudtez4pnpmQ1rTP2b4DX
Hw362PI3posfNiUb+uP6sshmj9xXmQ==
=NVRc
-----END PGP SIGNATURE-----

--Sig_/s8_Sal9FnY/DDjWakNZKc8e--

