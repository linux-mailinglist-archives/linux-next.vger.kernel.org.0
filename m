Return-Path: <linux-next+bounces-6886-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7605CABF29C
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 13:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53AA51BC3006
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 11:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5204525FA3F;
	Wed, 21 May 2025 11:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WRTj9sbX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2B626280A;
	Wed, 21 May 2025 11:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747826434; cv=none; b=UV6zXBG0l12vIJdgg0goKIIR9bH5LuO1BvJkr9Gd/MRJh3AtY350jPQr3xJOvetAAqr7nCzw1/+MDrf/f4S8mvhU/PunZuXxW4VD4v3uYoMZwzdUwvFfjpTyjp9l08qUzpYjCf453x6ZBscJ5Qj9MpAZygcgU1OWUm9X/UCf6xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747826434; c=relaxed/simple;
	bh=SkYwnMCwVjQfhPaGU7rUMlkHYO0gtLkquh0poY+5E4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rG1NKnwr7K8m2JwrbFLB/gcXLybt8MUsaICbWnvMd5hmkIqv924kd96B9+OzYXSB2GXsQfNlRiBrOONKx2sCl/VU7Je9ONk1gHiGHXe38ZRFfaMOiOm80cMzEMsp3zoe2OtkYus65Hit+hjyqVIrZNiBkn96Ku0vbu6JAtXYEcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WRTj9sbX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747826425;
	bh=BJz2ArmaBXh1sqJPvazWWV/nCS2uQuEsj9V3zZnT5c0=;
	h=Date:From:To:Cc:Subject:From;
	b=WRTj9sbXkQubHMsLOy/taNQ1cs8jvexAN8uxJsHYfrMn2i0DOwzZz1oZKtdBPUVbs
	 w6mTVTWnnZVJslo+h+n6k2jCZxAlK8rqT13JDp25dXuZhYnmSlJld07WydAPCkU26i
	 1zskuA//QndECaYQNDYkPV52tSuomESIooh/KL2hTJ2BE0lPsblw0haegkrkww1bfC
	 xBXes1B3yeWavg7sfkoMtEjvHU0WcuV8Pfgwg7NiKIg6NXv5YXI83tQuc7xzlfgIc5
	 VWzEXic5In04FUF0iyT/3pyLL9sMJL7i4KtDv2N65yGEnsnqVzJwCe24wAMo8exZym
	 cAr4d2xZA/0Vg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2TVd3Cm4z4xM4;
	Wed, 21 May 2025 21:20:25 +1000 (AEST)
Date: Wed, 21 May 2025 21:20:24 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 21
Message-ID: <20250521212024.3dfd89f4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TcRXkRNMDhn_lpD1saH8eEy";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TcRXkRNMDhn_lpD1saH8eEy
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250516:

The vfs-brauner tree gained a build failure for which I applied a hack.

The arm64 tree gained a conflict against Linus' tree.

The cpufreq-arm tree gained a conflict against the configfs tree.

The drm tree gained conflicts against Linus' tree.

The mmc tree gained a build failure so I used the version from
next-20250516.

The tip tree gained a conflict against the pci tree.

The kvm-riscv tree gained a conflict against the kvm-arm tree.

The cgroup tree gained a conflict against the mm-stable and mm-unstable
trees.

The gpio-intel tree lost its build error.

Non-merge commits (relative to Linus' tree): 11516
 11331 files changed, 510891 insertions(+), 244925 deletions(-)

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

I am currently merging 400 trees (counting Linus' and 152 trees of bug
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
Merging origin/master (b36ddb9210e6 Merge tag 'for-linus-6.15-ofs2' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/hubcap/linux)
Merging fixes/fixes (b3c623b9a94f Merge tag 'thermal-6.15-rc1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging ext4-fixes/fixes (4bbf9020becb Linux 6.13-rc4)
Merging vfs-brauner-fixes/vfs.fixes (a5806cd506af Linux 6.15-rc7)
Merging fscrypt-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging fsverity-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging btrfs-fixes/next-fixes (fc4ed91fb0ec Merge branch 'misc-6.15' into =
next-fixes)
Merging vfs-fixes/fixes (cfaefc95bfa7 fix a braino in "do_move_mount(): don=
't leak MNTNS_PROPAGATING on failures")
Merging erofs-fixes/fixes (35076d2223c7 erofs: ensure the extra temporary c=
opy is valid for shortened bvecs)
Merging nfsd-fixes/nfsd-fixes (831e3f545b07 Revert "sunrpc: clean cache_det=
ail immediately when flush is written frequently")
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (924577e4f6ca ovl: Fix nested backing fil=
e paths)
Merging bcachefs/for-next (86201ac9945d bcachefs: BCH_INODE_has_case_insens=
itive)
Merging fscrypt/for-next (c07d3aede2b2 fscrypt: add support for hardware-wr=
apped keys)
Merging btrfs/for-next (18e274f43253 Merge branch 'for-next-next-v6.15-2025=
0520' into for-next-20250520)
Merging ceph/master (f452a2204614 ceph: Fix incorrect flush end position ca=
lculation)
Merging cifs/for-next (ea9dfcac6371 smb: client: Reset all search buffer po=
inters when releasing buffer)
Merging configfs/configfs-next (c6b190822459 MAINTAINERS: add configfs Rust=
 abstractions)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (6f8b4788266c dlm: drop SCTP Kconfig dependency)
Merging erofs/dev (c94d54dab9f0 erofs: add 'fsoffset' mount option to speci=
fy filesystem offset)
Merging exfat/dev (602ac09f66e8 exfat: do not clear volume dirty flag durin=
g sync)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (e56f3c6159f2 Merge unpriviledged fanotify watching.)
Merging ext4/dev (e26268ff1dca ext4: only dirty folios when data journaling=
 regular files)
Merging f2fs/dev (2c19d65bab04 f2fs: introduce FAULT_VMALLOC)
Merging fsverity/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging fuse/for-next (65107cbe9585 fuse: increase readdir buffer size)
Merging gfs2/for-next (65347aa1b9a4 gfs2: No more gfs2_find_jhead caching)
Merging jfs/jfs-next (5dff41a86377 jfs: fix array-index-out-of-bounds read =
in add_missing_indices)
Merging ksmbd/ksmbd-for-next (6679ea7bc337 ksmbd: use list_first_entry_or_n=
ull for opinfo_get_list())
Merging nfs/linux-next (dcd21b609d4a NFS: Avoid flushing data while holding=
 directory locks in nfs_rename())
Merging nfs-anna/linux-next (9084ed79ddaa lsm,nfs: fix memory leak of lsm_c=
ontext)
Merging nfsd/nfsd-next (425364dc49f0 xdrgen: Fix code generated for counted=
 arrays)
Merging ntfs3/master (eeb0819318cc fs/ntfs3: remove ability to change compr=
ession on mounted volume)
Merging orangefs/for-next (ddaa7202a930 orangefs: adjust counting code to r=
ecover from 665575cf)
Merging overlayfs/overlayfs-next (b87e2318cdaa vfs: change 'struct file *' =
argument to 'const struct file *' where possible)
Merging ubifs/next (69146a8c893f ubi: ubi_get_ec_info: Fix compiling error =
'cast specifies array type')
Merging v9fs/9p-next (4210030d8bc4 docs: fs/9p: Add missing "not" in cache =
documentation)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (6d444c8db0ac Merge branch 'xfs-6.15-fixes' into for-n=
ext)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging vfs-brauner/vfs.all (5ddcb20f3315 Merge branch 'vfs-6.16.selftests'=
 into vfs.all)
  8d9117009dd6 ("fuse: don't allow signals to interrupt getdents copying")
  e0410e956b97 ("readdir: supply dir_context.count as readdir buffer size h=
int")
Merging vfs/for-next (1b9892d82b6f Merge branch 'work.automount' into for-n=
ext)
CONFLICT (content): Merge conflict in Documentation/filesystems/porting.rst
Merging mm-hotfixes/mm-hotfixes-unstable (f00f84c96c47 mm: vmalloc: only ze=
ro-init on vrealloc shrink)
Merging fs-current (0315fd1b8425 Merge branch 'ovl-fixes' of git://git.kern=
el.org/pub/scm/linux/kernel/git/overlayfs/vfs.git)
Merging kbuild-current/fixes (e0cd396d8998 kbuild: fix typos "module.builti=
n" to "modules.builtin")
Merging arc-current/for-curr (6ab657d8d2a4 ARC: unwind: Use built-in sort s=
wap to reduce code size and improve performance)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (363cd2b81cfd arm64: cpufeature: Move ar=
m64_use_ng_mappings to the .data section to prevent wrong idmap generation)
Merging arm-soc-fixes/arm/fixes (15eaaa71e8ef Merge tag 'imx-fixes-6.15-2' =
of https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/=
fixes)
Merging davinci-current/davinci/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging drivers-memory-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging sophgo-fixes/fixes (3e6244429ba3 riscv: dts: sophgo: fix DMA data-w=
idth configuration for CV18xx)
Merging sophgo-soc-fixes/soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging m68k-current/for-linus (c94cf023dce3 m68k: defconfig: Update defcon=
figs for v6.14-rc1)
Merging powerpc-fixes/fixes (e3f506b78d92 powerpc/boot: Fix dash warning)
Merging s390-fixes/fixes (05a2538f2b48 s390/pci: Fix duplicate pci_dev_put(=
) in disable_slot() when PF has child VFs)
Merging net/main (9e89db3d847f Merge tag 'linux-can-fixes-for-6.15-20250520=
' of git://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can)
Merging bpf/master (b4432656b36e Linux 6.15-rc4)
Merging ipsec/master (0b91fda3a1f0 xfrm: Sanitize marks before insert)
Merging netfilter/main (239af1970bcb llc: fix data loss when reading from a=
 socket in llc_ui_recvmsg())
Merging ipvs/main (491ef1117c56 net: ethernet: mtk_eth_soc: net: revise NET=
SYSv3 hardware configuration)
Merging wireless/for-next (ef935650e044 Merge tag 'net-6.15-rc7' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ath/for-current (ef935650e044 Merge tag 'net-6.15-rc7' of git://git=
.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging iwlwifi/fixes (30763f1adf69 Merge tag 'wireless-2025-04-24' of http=
s://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (d0706bfd3ee4 RDMA/core: Fix "KASAN: slab-use-aft=
er-free Read in ib_register_device" problem)
Merging sound-current/for-linus (f709b78aecab ALSA: hda/realtek - Add new H=
P ZBook laptop with micmute led fixup)
Merging sound-asoc-fixes/for-linus (e717c661e2d1 ASoC: apple: mca: Constrai=
n channels according to TDM mask)
Merging regmap-fixes/for-linus (433a06b68324 Merge remote-tracking branch '=
regmap/for-6.14' into regmap-linus)
Merging regulator-fixes/for-linus (a5806cd506af Linux 6.15-rc7)
Merging spi-fixes/for-linus (a5806cd506af Linux 6.15-rc7)
Merging pci-current/for-linus (69dcbfec5f02 MAINTAINERS: Update Krzysztof W=
ilczy=C5=84ski email address)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging driver-core.current/driver-core-linus (82f2b0b97b36 Linux 6.15-rc6)
Merging tty.current/tty-linus (b4432656b36e Linux 6.15-rc4)
Merging usb.current/usb-linus (82f2b0b97b36 Linux 6.15-rc6)
Merging usb-serial-fixes/usb-linus (b4432656b36e Linux 6.15-rc4)
Merging phy/fixes (b2ea5f49580c phy: Fix error handling in tegra_xusb_port_=
init)
Merging staging.current/staging-linus (82f2b0b97b36 Linux 6.15-rc6)
Merging iio-fixes/fixes-togreg (7cdfbc0113d0 iio: adc: ad7944: mask high bi=
ts on direct read)
Merging counter-current/counter-current (7351312632e8 counter: interrupt-cn=
t: Protect enable/disable OPs with mutex)
Merging char-misc.current/char-misc-linus (82f2b0b97b36 Linux 6.15-rc6)
Merging soundwire-fixes/fixes (fd15594ba7d5 soundwire: bus: Fix race on the=
 creation of the IRQ domain)
Merging thunderbolt-fixes/fixes (0f73628e9da1 thunderbolt: Do not double de=
queue a configuration request)
Merging input-current/for-linus (f0d17942ea3e Input: xpad - add more contro=
llers)
Merging crypto-current/master (b2df03ed4052 crypto: algif_hash - fix double=
 free in hash_accept)
Merging vfio-fixes/for-linus (c1d9dac0db16 vfio/pci: Align huge faults to o=
rder)
Merging kselftest-fixes/fixes (07be53cfa81a selftests/ftrace: Differentiate=
 bash and dash in dynevent_limitations.tc)
Merging dmaengine-fixes/fixes (811d6a923b40 dmaengine: mediatek: drop unuse=
d variable)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (1c1fd374a2fe mtd: spinand: Fix build with gcc =
< 7.5)
Merging mfd-fixes/for-mfd-fixes (68f860426d50 mfd: axp20x: AXP717: Fix miss=
ing IRQ status registers range)
Merging v4l-dvb-fixes/fixes (d51adf038ebe media: cec: tda9950: add back i2c=
 dependency)
Merging reset-fixes/reset/fixes (38fec10eb60d Linux 6.14)
Merging mips-fixes/mips-fixes (c44572e0cc13 MIPS: Fix MAX_REG_OFFSET)
Merging at91-fixes/at91-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging omap-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging kvm-fixes/master (add20321af2f Merge tag 'kvm-x86-fixes-6.15-rcN' o=
f https://github.com/kvm-x86/linux into HEAD)
Merging kvms390-fixes/master (d8dfda5af0be KVM: s390: pv: fix race when mak=
ing a page secure)
Merging hwmon-fixes/hwmon (9c32cda43eb7 Linux 6.15-rc3)
Merging nvdimm-fixes/libnvdimm-fixes (265e98f72bac acpi: nfit: vmalloc-out-=
of-bounds Read in acpi_nfit_ctl)
Merging cxl-fixes/fixes (078d3ee7c162 cxl/core/regs.c: Skip Memory Space En=
able check for RCD and RCH Ports)
Merging dma-mapping-fixes/dma-mapping-fixes (89461db349cc dma-coherent: War=
n if OF reserved memory is beyond current coherent DMA mask)
Merging drivers-x86-fixes/fixes (bfcfe6d335a9 platform/x86: asus-wmi: Fix w=
lan_ctrl_by_user detection)
Merging samsung-krzk-fixes/fixes (dd303e021996 soc: samsung: usi: prevent w=
rong bits inversion during unconfiguring)
Merging pinctrl-samsung-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging devicetree-fixes/dt/linus (d5f49921707c dt-bindings: soc: fsl: fsl,=
ls1028a-reset: Fix maintainer entry)
Merging dt-krzk-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging scsi-fixes/fixes (e8007fad5457 scsi: sd_zbc: block: Respect bio vec=
tor limits for REPORT ZONES buffer)
Merging drm-fixes/drm-fixes (a5806cd506af Linux 6.15-rc7)
Merging drm-intel-fixes/for-linux-next-fixes (a5806cd506af Linux 6.15-rc7)
Merging mmc-fixes/fixes (71c9475b1e2c mmc: sdhci_am654: Add SDHCI_QUIRK2_SU=
PPRESS_V1P8_ENA quirk to am62 compatible)
Merging rtc-fixes/rtc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging gnss-fixes/gnss-linus (9c32cda43eb7 Linux 6.15-rc3)
Merging hyperv-fixes/hyperv-fixes (14ae3003e73e Drivers: hv: Fix bad ref to=
 hv_synic_eventring_tail when CPU goes offline)
Merging risc-v-fixes/fixes (01534f3e0dd7 Merge tag 'riscv-fixes-6.15-rc6' o=
f ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into f=
ixes)
Merging riscv-dt-fixes/riscv-dt-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging riscv-soc-fixes/riscv-soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (0af2f6be1b42 Linux 6.15-rc1)
Merging gpio-brgl-fixes/gpio/for-current (a5806cd506af Linux 6.15-rc7)
Merging gpio-intel-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging pinctrl-intel-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging auxdisplay-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging kunit-fixes/kunit-fixes (b26c1a85f3fc kunit: qemu_configs: SH: Resp=
ect kunit cmdline)
Merging memblock-fixes/fixes (da8bf5daa5e5 memblock: Accept allocated memor=
y before use in memblock_double_array())
Merging renesas-fixes/fixes (379c590113ce ARM: shmobile: smp: Enforce shmob=
ile_smp_* alignment)
Merging perf-current/perf-tools (8988c4b91945 perf tools: Fix in-source lib=
perf build)
Merging efi-fixes/urgent (11092db5b573 efivarfs: fix NULL dereference on re=
sume)
Merging battery-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging iommufd-fixes/for-rc (0af2f6be1b42 Linux 6.15-rc1)
Merging rust-fixes/rust-fixes (82f2b0b97b36 Linux 6.15-rc6)
Merging w1-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging pmdomain-fixes/fixes (0f5757667ec0 pmdomain: core: Fix error checki=
ng in genpd_dev_pm_attach_by_id())
Merging i2c-host-fixes/i2c/i2c-host-fixes (a5806cd506af Linux 6.15-rc7)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (6a56880562d4 Merge tag 'sunxi-clk-fixes-for-6.=
15' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into clk=
-fixes)
Merging thead-clk-fixes/thead-clk-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging pwrseq-fixes/pwrseq/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging thead-dt-fixes/thead-dt-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging ftrace-fixes/ftrace/fixes (2fa6a01345b5 tracing: Fix memory leak wh=
en reading set_event file)
Merging ring-buffer-fixes/ring-buffer/fixes (e4d4b8670c44 ring-buffer: Use =
flush_kernel_vmap_range() over flush_dcache_folio())
Merging trace-fixes/trace/fixes (1d6c39c89f61 ring-buffer: Fix persistent b=
uffer when commit page is the reader page)
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging tip-fixes/tip/urgent (a5806cd506af Linux 6.15-rc7)
Merging slab-fixes/slab/for-next-fixes (be8250786ca9 mm, slab: clean up sla=
b->obj_exts always)
Merging drm-msm-fixes/msm-fixes (9d78f0250322 drm/msm/a6xx+: Don't let IB_S=
IZE overflow)
Merging uml-fixes/fixes (01f95500a162 Merge tag 'uml-for-linux-6.15-rc6' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux)
Merging fwctl-fixes/for-rc (c92ae5d4f53e fwctl: Fix repeated device word in=
 log message)
Merging devsec-tsm-fixes/fixes (fba4ceaa242d configfs-tsm-report: Fix NULL =
dereference of tsm_ops)
Merging drm-misc-fixes/for-linux-next-fixes (6692dbc15e5e drm/edid: fixed t=
he bug that hdr metadata was not reset)
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (9e619cd4fefd memcg: no irq disable for memcg s=
tock lock)
Merging mm-nonmm-stable/mm-nonmm-stable (cf80fdbc0a55 list: remove redundan=
t 'extern' for function prototypes)
Merging mm-unstable/mm-unstable (9f3e87f6c8d4 selftests/mm: deduplicate def=
ault page size test results in thuge-gen)
Merging mm-nonmm-unstable/mm-nonmm-unstable (140483a0fc61 scripts/gdb/symbo=
ls: determine KASLR offset on s390 during early boot)
Merging kbuild/for-next (188d818d66b7 init: remove unused CONFIG_CC_CAN_LIN=
K_STATIC)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (8cdf00b843ea perf record: Fix a asan runtime =
error in util/maps.c)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (3ee7d9496342 docs: core-api: docu=
ment the IOVA-based API)
Merging asm-generic/master (28d51df0dbaa Documentation: update binutils-2.3=
0 version reference)
Merging alpha/alpha-next (1523226edda5 alpha: Use str_yes_no() helper in pc=
i_dac_dma_supported())
Merging arm/for-next (96e0b3558830 ARM: 9447/1: arm/memremap: fix arch_memr=
emap_can_ram_remap())
Merging arm64/for-next/core (7d6644225937 Merge branches 'for-next/acpi', '=
for-next/cpufeature', 'for-next/efi', 'for-next/entry', 'for-next/fixes', '=
for-next/misc', 'for-next/mm', 'for-next/perf', 'for-next/psci', 'for-next/=
selftests', 'for-next/sme-fixes' and 'for-next/vdso' into for-next/core)
CONFLICT (content): Merge conflict in arch/arm64/kernel/image-vars.h
Merging arm-perf/for-next/perf (8c138a189f6d perf/arm-cmn: Add CMN S3 ACPI =
binding)
Merging arm-soc/for-next (f60018d6c5d0 soc: document merges)
Merging amlogic/for-next (a2ce7e3f919e Merge branch 'v6.16/arm-dt' into for=
-next)
Merging asahi-soc/asahi-soc/for-next (fb84b3df3515 Merge remote-tracking br=
anch 'origin/asahi-soc/dt' into asahi-soc/for-next)
Merging aspeed/for-next (34c87a24e268 Merge branches 'aspeed/dt', 'aspeed/f=
ixes', 'aspeed/drivers', 'nuvoton/arm/dt' and 'nuvoton/arm64/dt' into for-n=
ext)
Merging at91/at91-next (05aeace8757f Merge branch 'at91-dt' into at91-next)
Merging broadcom/next (87b8fa3195af Merge branch 'devicetree-arm64/next' in=
to next)
Merging davinci/davinci/for-next (55da73fa7a68 ARM: dts: davinci: da850-evm=
: Increase fifo threshold)
Merging drivers-memory/for-next (3c6f400411bb Merge branch 'mem-ctrl-next' =
into for-next)
Merging imx-mxs/for-next (68087d05675e Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (6df944d2cf58 Merge branch 'v6.15-next/dts64' int=
o for-next)
Merging mvebu/for-next (89373e7d4125 Merge branch 'mvebu/dt' into mvebu/for=
-next)
Merging omap/for-next (6d658392b3f0 Merge branch 'omap-for-v6.16/drivers' i=
nto tmp/omap-next-20250508.062442)
Merging qcom/for-next (44ef9ab4baaf Merge branches 'arm32-for-6.16', 'arm64=
-defconfig-for-6.16', 'arm64-for-6.16', 'clk-for-6.16' and 'drivers-for-6.1=
6' into for-next)
Merging renesas/next (f6a83ae2d61f Merge branch 'renesas-dts-for-v6.16' int=
o renesas-next)
Merging reset/reset/next (1c64de886b88 dt-bindings: reset: sophgo: Add SG20=
44 bindings.)
Merging rockchip/for-next (897af18e5d75 Merge branch 'v6.16-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (48af60cd8aaa Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (7326bb3aaaf9 Merge tags 'scmi-updates-6.16' an=
d 'juno-updates-6.16' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git=
/sudeep.holla/linux into for-linux-next)
Merging sophgo/for-next (108a76779829 riscv: dts: sophgo: switch precise co=
mpatible for existed clock device for CV18XX)
Merging sophgo-soc/soc-for-next (c8754c7deab4 soc: sophgo: cv1800: rtcsys: =
New driver (handling RTC only))
Merging spacemit/for-next (3aa64cd126b4 riscv: dts: spacemit: add gpio LED =
for system heartbeat)
Merging stm32/stm32-next (dc392342b7bb ARM: dts: stm32: Add nvmem-cells to =
ethernet nodes for constant mac-addresses)
Merging sunxi/sunxi/for-next (a697a32cab70 Merge branches 'sunxi/clk-fixes-=
for-6.15', 'sunxi/fixes-for-6.15', 'sunxi/clk-for-6.16' and 'sunxi/dt-for-6=
.16' into sunxi/for-next)
Merging tee/next (40cfb51a6e93 Merge branch 'tee_for_v6_16' into next)
Merging tegra/for-next (5e98350146c3 Merge branch for-6.16/arm64/dt into fo=
r-next)
Merging thead-dt/thead-dt-for-next (a4c95b924d51 riscv: dts: thead: Add dev=
ice tree VO clock controller)
Merging ti/ti-next (2332d042e9b2 Merge branches 'ti-k3-dts-next' and 'ti-dr=
ivers-soc-next' into ti-next)
Merging xilinx/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging clk/clk-next (32d090911499 Merge branch 'clk-fixes' into clk-next)
Merging clk-imx/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging clk-renesas/renesas-clk (28548f3f7994 clk: renesas: r9a09g047: Add =
XSPI clock/reset)
Merging thead-clk/thead-clk-for-next (50d4b157fa96 clk: thead: Add clock su=
pport for VO subsystem in T-HEAD TH1520 SoC)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (4d89432937f1 Merge branch 'loongarch-kvm'=
 into loongarch-next)
Merging m68k/for-next (f440518f379d m68k: defconfig: Update defconfigs for =
v6.15-rc1)
Merging m68knommu/for-next (eb43efd062d1 m68k: Replace memcpy() + manual NU=
L-termination with strscpy())
Merging microblaze/next (920354d7818b microblaze: Use of_property_present()=
 for non-boolean properties)
Merging mips/mips-next (faefb0a59c59 MAINTAINERS: Add entry for newly added=
 EcoNet platform.)
Merging openrisc/for-next (f698ee1f4003 dt-bindings: interrupt-controller: =
Convert openrisc,ompic to DT schema)
Merging parisc-hd/for-next (7cbb015e2d3d parisc: fix building with gcc-15)
Merging powerpc/next (f15e87340afd powerpc/iommu: Use str_disabled_enabled(=
) helper)
Merging risc-v/for-next (1a3f6980889d Merge patch series "riscv: Add vendor=
 extensions support for SiFive")
Merging riscv-dt/riscv-dt-for-next (d50108706a63 riscv: dts: starfive: jh71=
10-common: bootph-pre-ram hinting needed by boot loader)
Merging riscv-soc/riscv-soc-for-next (59986662d2f4 Merge branch 'riscv-cach=
e-for-next' into riscv-soc-for-next)
Merging s390/for-next (d536e1941e77 Merge branch 'features' into for-next)
Merging sh/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (e619e18ed462 um: Remove legacy network transport infrastr=
ucture)
Merging xtensa/xtensa-for-next (3d6d238851df arch: xtensa: defconfig: Drop =
obsolete CONFIG_NET_CLS_TCINDEX)
Merging fs-next (388aa5777a4f Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
CONFLICT (content): Merge conflict in fs/fuse/file.c
Merging printk/for-next (9827cd0d6498 Merge branch 'for-6.15-printf-attribu=
te' into for-next)
Merging pci/next (21642f5c2c31 Merge branch 'pci/misc')
Merging pstore/for-next/pstore (d679c2e1e8d9 pstore/zone: rewrite some comm=
ents for better understanding)
Merging hid/for-next (5e9f050d085e Merge branch 'for-6.16/core' into for-ne=
xt)
Merging i2c/i2c/for-next (2d89b80c59f5 Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i2c-host/i2c/i2c-host (a088ce22c118 i2c: mlxbf: avoid 64-bit divisi=
on)
Merging i3c/i3c/next (81f2a9af9821 i3c: master: svc: Emit STOP asap in the =
IBI transaction)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (46d40b2479ab doc: hwmon: acpi_power_meter=
: Add information about enabling the power capping feature.)
Merging jc_docs/docs-next (a556bd882b94 docs: align with scripts/syscall.tb=
l migration)
Merging v4l-dvb/next (5e1ff2314797 media: rkvdec: h264: Support High 10 and=
 4:2:2 profiles)
CONFLICT (content): Merge conflict in drivers/media/i2c/ds90ub960.c
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (e8ea543f21a0 Merge branch 'fixes' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (6c9bb8692272 cpufreq: scmi: Ski=
p SCMI devices that aren't used by the CPUs)
CONFLICT (content): Merge conflict in rust/bindings/bindings_helper.h
CONFLICT (content): Merge conflict in rust/kernel/lib.rs
Merging cpupower/cpupower (e5174365c132 cpupower: do not install files to /=
etc/default/)
Merging devfreq/devfreq-next (3de6497b9b1b PM / devfreq: sun8i-a33-mbus: Si=
mplify by using more devm functions)
Merging pmdomain/next (36795548dcc8 pmdomain: ti: Fix STANDBY handling of P=
ER power domain)
Merging opp/opp/linux-next (03eadcbd981b OPP: switch to use kmemdup_array())
Merging thermal/thermal/linux-next (e23cba0ab49a thermal/drivers/airoha: Fi=
x spelling mistake)
Merging rdma/for-next (21508c8c972c Merge branch 'for-next' of https://git.=
kernel.org/pub/scm/linux/kernel/git/tnguy/linux into wip/leon-for-next)
CONFLICT (content): Merge conflict in drivers/infiniband/core/umem_odp.c
CONFLICT (content): Merge conflict in drivers/infiniband/hw/irdma/main.c
CONFLICT (content): Merge conflict in drivers/infiniband/sw/rxe/rxe_mr.c
CONFLICT (content): Merge conflict in drivers/infiniband/sw/rxe/rxe_resp.c
Merging net-next/main (e6b3527c3b0a Merge branch 'net-airoha-add-per-flow-s=
tats-support-to-hw-flowtable-offloading')
CONFLICT (content): Merge conflict in MAINTAINERS
Merging bpf-next/for-next (f75514fe4cac Merge branch 'bpf-next/master' into=
 for-next)
Merging ipsec-next/master (c82b48b63a93 xfrm: prevent configuration of inte=
rface index when offload is used)
CONFLICT (content): Merge conflict in drivers/net/ethernet/intel/ixgbe/ixgb=
e_ipsec.c
Merging mlx5-next/mlx5-next (f550694e88b7 net/mlx5: Add IFC bits for PPCNT =
recovery counters group)
Merging netfilter-next/main (3e52667a9c32 Merge branch 'lan78xx-phylink-pre=
p')
Merging ipvs-next/main (88922fe78540 Merge branch 'bridge-mc-per-vlan-qquer=
y')
Merging bluetooth/master (a8f011879811 Bluetooth: MGMT: iterate over mesh c=
ommands in mgmt_mesh_foreach())
  18f5b2456b36 ("Bluetooth: L2CAP: Fix not checking l2cap_chan security lev=
el")
  259a6d602310 ("Bluetooth: btusb: use skb_pull to avoid unsafe access in Q=
CA dump handling")
CONFLICT (content): Merge conflict in include/net/bluetooth/hci_core.h
CONFLICT (content): Merge conflict in net/bluetooth/hci_conn.c
CONFLICT (content): Merge conflict in net/bluetooth/hci_sync.c
Merging wireless-next/for-next (68b44b05f4c8 wifi: mac80211: handle non-MLO=
 mode as well in ieee80211_num_beaconing_links())
Merging ath-next/for-next (0d777aa2ca77 wifi: ath12k: fix mac pdev frequenc=
y range update)
Merging iwlwifi-next/next (379f7682d062 wifi: iwlwifi: mld: allow 2 ROCs on=
 the same vif)
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (0aa7b390fc40 mtd: core: always create master device)
Merging nand/nand/next (4a5a99bc79cd mtd: nand: sunxi: Add randomizer confi=
guration before randomizer enable)
Merging spi-nor/spi-nor/next (594c8df92b94 mtd: spi-nor: macronix: Add fixu=
ps for MX25L3255E)
Merging crypto/master (bc8169003b41 crypto: powerpc/poly1305 - add depends =
on BROKEN for now)
Merging drm/drm-next (c4f8ac095fc9 Merge tag 'nova-next-v6.16-2025-05-20' o=
f https://gitlab.freedesktop.org/drm/nova into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/hdp_v5_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/hdp_v6_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/hdp_v7_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dml2/d=
ml21/dml21_translation_helper.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_lrc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_svm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_svm.h
CONFLICT (content): Merge conflict in samples/rust/Makefile
Merging drm-exynos/for-linux-next (81a50378559b drm/exynos: Remove unnecess=
ary checking)
Merging drm-misc/for-linux-next (7c1a9408ce5f Merge tag 'drm-msm-next-2025-=
05-16' of https://gitlab.freedesktop.org/drm/msm into drm-next)
Merging amdgpu/drm-next (2f0268ca1cac drm/amdgpu/jpeg: sriov support for jp=
eg_v5_0_1)
Merging drm-intel/for-linux-next (765165a5f035 drm/i915/gem: Allow EXEC_CAP=
TURE on recoverable contexts on DG1)
Merging drm-msm/msm-next (fc5c669c902c dt-bindings: display: msm: correct e=
xample in SM8350 MDSS schema)
Merging drm-msm-lumag/msm-next-lumag (fc5c669c902c dt-bindings: display: ms=
m: correct example in SM8350 MDSS schema)
Merging drm-nova/nova-next (276c53c66e03 gpu: drm: nova: select AUXILIARY_B=
US instead of depending on it)
Merging drm-xe/drm-xe-next (a7f87deac229 drm/xe: Default auto_link_downgrad=
e status to false)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_pt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_svm.c
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (54067cfc1efe fbdev: core: fbcvt: avoid division by =
0 in fb_cvt_hperiod())
Merging regmap/for-next (631f2288a412 Merge remote-tracking branch 'regmap/=
for-6.16' into regmap-next)
Merging sound/for-next (2bae25a802dc ALSA: amd7930: replace strcpy() with s=
trscpy())
Merging ieee1394/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging sound-asoc/for-next (68cc3327c2a8 Merge remote-tracking branch 'aso=
c/for-6.16' into asoc-next)
Merging modules/modules-next (a0b018a495a3 module: Remove outdated comment =
about text_size)
Merging input/next (0d5c604be4cd Input: xpad - send LED and auth done packe=
ts to all Xbox One controllers)
Merging block/for-next (346fd9bdd9ef Merge branch 'for-6.16/block' into for=
-next)
CONFLICT (content): Merge conflict in fs/gfs2/ops_fstype.c
Merging device-mapper/for-next (5c977f102315 dm-mpath: Don't grab work_mute=
x while probing paths)
Merging libata/for-next (a374cfbf6090 ata: libata-eh: Keep DIPM disabled wh=
ile modifying the allowed LPM states)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (aee11c5ac9a0 dt-bindings: mmc: sdhci-of-dwcmhsc: Allow us=
e of a power-domain)
$ git reset --hard HEAD^
Merging next-20250516 version of mmc
Merging mfd/for-mfd-next (a49b7d3746fe dt-bindings: mfd: qcom,tcsr: Add com=
patible for ipq5018)
Merging backlight/for-backlight-next (e12d3e1624a0 backlight: pm8941: Add N=
ULL check in wled_configure())
Merging battery/for-next (b1d8766052eb power: supply: rt9471: Simplify defi=
nition of some struct linear_range)
Merging regulator/for-next (a02c7665c216 Merge remote-tracking branch 'regu=
lator/for-6.16' into regulator-next)
Merging security/next (74e5b13a1b0f lsm: Move security_netlink_send to unde=
r CONFIG_SECURITY_NETWORK)
Merging apparmor/apparmor-next (3e45553acb14 apparmor: Remove unused variab=
le 'sock' in __file_sock_perm())
Merging integrity/next-integrity (fe3aebf27dc1 ima: do not copy measurement=
 list to kdump kernel)
CONFLICT (content): Merge conflict in kernel/kexec_file.c
Merging selinux/next (05f1a939225e selinux: fix the kdoc header for task_av=
dcache_update)
Merging smack/next (4b59f4fd0a36 security/smack/smackfs: small kernel-doc f=
ixes)
Merging tomoyo/master (e9ddb37834eb tomoyo: update mailing lists)
Merging tpmdd/next (4448bb4bff76 tpm_crb: ffa_tpm: fix/update comments desc=
ribing the CRB over FFA ABI)
Merging watchdog/master (9bc64d338b0b watchdog: sunxi_wdt: Add support for =
Allwinner A523)
Merging iommu/next (3a20d6f371e6 Merge branches 'apple/dart', 'arm/smmu/upd=
ates', 'arm/smmu/bindings', 'fsl/pamu', 'mediatek', 'renesas/ipmmu', 's390'=
, 'intel/vt-d', 'amd/amd-vi' and 'core' into next)
CONFLICT (content): Merge conflict in drivers/dma/idxd/init.c
Merging audit/next (654d61b8e0e2 audit: record AUDIT_ANOM_* events regardle=
ss of presence of rules)
Merging devicetree/for-next (3e3169e64e31 dt-bindings: display: bridge: ren=
esas,dsi: allow properties from dsi-controller)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging dt-krzk/for-next (78c8129aa236 Merge branches 'next/dt', 'next/dt64=
' and 'next/soc-drivers' into for-next)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging mailbox/for-next (1ec12fd31ecc mailbox: Remove unneeded semicolon)
Merging spi/for-next (f3ea8b2a7b18 Merge remote-tracking branch 'spi/for-6.=
16' into spi-next)
Merging tip/master (3ee84e3dd88e Merge branch into tip/master: 'x86/sgx')
CONFLICT (content): Merge conflict in arch/loongarch/kernel/entry.S
CONFLICT (content): Merge conflict in arch/x86/Kconfig.assembler
CONFLICT (content): Merge conflict in arch/x86/mm/pat/memtype.c
CONFLICT (content): Merge conflict in drivers/cpufreq/amd-pstate.c
CONFLICT (content): Merge conflict in drivers/idle/intel_idle.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/wangxun/txgbe/tx=
gbe_irq.c
CONFLICT (content): Merge conflict in drivers/pci/controller/pcie-apple.c
Applying: fix up for "x86/platform/amd: Move the <asm/amd_nb.h> header to <=
asm/amd/nb.h>"
Merging clockevents/timers/drivers/next (d204e391a0d8 clocksource/drivers/r=
enesas-ostm: Unconditionally enable reprobe support)
Merging edac/edac-for-next (4521b86e4a6e Merge ras/edac-urgent into for-nex=
t)
Merging ftrace/for-next (4716b1fedda2 Merge bootconfig/for-next)
CONFLICT (content): Merge conflict in include/trace/events/tcp.h
Merging rcu/next (9c80e4433798 Merge branches 'rcu/misc-for-6.16', 'rcu/seq=
-counters-for-6.16' and 'rcu/torture-for-6.16' into rcu/for-next)
Merging paulmck/non-rcu/next (e55dc2e5b2e3 Merge branches 'lkmm.2025.04.22a=
' and 'ratelimit.2025.05.08a' into HEAD)
Merging kvm/next (45eb29140e68 Merge branch 'kvm-fixes-6.15-rc4' into HEAD)
CONFLICT (content): Merge conflict in arch/x86/kvm/vmx/vmx.c
Merging kvm-arm/next (7f1a034977d0 Merge branch kvm-arm64/misc-6.16 into kv=
marm-master/next)
CONFLICT (content): Merge conflict in arch/arm64/kvm/hyp/vgic-v3-sr.c
Merging kvms390/next (9eb0537685ee s390/uv: improve splitting of large foli=
os that cannot be split while dirty)
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (5b9db9c16f42 RISC-V: KVM: add KVM_CAP_RIS=
CV_MP_STATE_RESET)
CONFLICT (content): Merge conflict in include/uapi/linux/kvm.h
Merging kvm-x86/next (3f7b307757ec Merge branches 'fixes', 'misc', 'mmu', '=
pir', 'selftests', 'svm' and 'vmx')
Merging xen-tip/linux-next (1f0304dfd9d2 xenbus: Use kref to track req life=
time)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (23227e71b69a workqueue: fix typo in comment)
Merging sched-ext/for-next (5b8c5ebaee69 Merge branch 'for-6.16' into for-n=
ext)
Merging drivers-x86/for-next (9f080c9f2099 platform/x86/tuxedo: Prevent inv=
alid Kconfig state)
CONFLICT (content): Merge conflict in drivers/platform/x86/intel/speed_sele=
ct_if/isst_if_common.c
Applying: fix up for "platform/x86/amd/hsmp: Report power via hwmon sensors"
Merging chrome-platform/for-next (3e552ccf405c platform/chrome: kunit: Avoi=
d -Wflex-array-member-not-at-end)
Merging chrome-platform-firmware/for-firmware-next (0af2f6be1b42 Linux 6.15=
-rc1)
Merging hsi/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging leds-lj/for-leds-next (6a09ae828198 leds: flash: Add support for fl=
ash/strobe duration)
Merging ipmi/for-next (08effa6b77f7 docs: ipmi: fix spelling and grammar mi=
stakes)
Merging driver-core/driver-core-next (f27ae3a6cebc Merge 6.15-rc6 into driv=
er-core-next)
Merging usb/usb-next (ab6dc9a6c721 Merge 6.15-rc6 into usb-next)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging thunderbolt/next (36f6f7e2d4d0 Documentation/admin-guide: Document =
Thunderbolt/USB4 tunneling events)
Merging usb-serial/usb-next (692a497eb748 USB: serial: ti_usb_3410_5052: dr=
op bogus read urb check)
Merging tty/tty-next (5ee558c5d9e9 vt: add new dynamically generated files =
to .gitignore)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/ser=
ial/snps-dw-apb-uart.yaml
Merging char-misc/char-misc-next (991919e96904 Merge 6.15-rc6 into char-mis=
c-next)
Applying: uio_hv_generic: constify bin_attribute definitions
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (408c97c4a5e0 coresight: prevent deactivate active c=
onfig while enabling the config)
Merging fastrpc/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga/for-next (6ebf1982038a fpga: fix potential null pointer deref =
in fpga_mgr_test_img_load_sgt())
Merging icc/icc-next (5fed7fe33c2c Merge branch 'icc-sa8775p' into icc-next)
Merging iio/togreg (43a9eee06bf8 dt-bindings: iio: adc: Add ROHM BD79100G)
CONFLICT (content): Merge conflict in drivers/iio/adc/ad7606.c
Merging phy-next/next (0c2228731974 phy: tegra: p2u: Broaden architecture d=
ependency)
CONFLICT (content): Merge conflict in drivers/phy/renesas/phy-rcar-gen3-usb=
2.c
CONFLICT (content): Merge conflict in drivers/phy/rockchip/phy-rockchip-sam=
sung-hdptx.c
Merging soundwire/next (62ada17a6217 soundwire: only compute port params in=
 specific stream states)
Merging extcon/extcon-next (f7736ebef6a4 extcon: max14526: avoid defined bu=
t not used warning)
Merging gnss/gnss-next (9c32cda43eb7 Linux 6.15-rc3)
Merging vfio/next (089803c40193 vfio/mlx5: Enable the DMA link API)
Merging w1/for-next (a9b3ecc7bcf6 w1: Avoid -Wflex-array-member-not-at-end =
warnings)
Merging spmi/spmi-next (02a0fd9c0c40 irqdomain: spmi: Switch to irq_domain_=
create_tree())
Merging staging/staging-next (3349e275067f Merge 6.15-rc6 into staging-next)
Merging counter-next/counter-next (ace2cd11a272 counter: stm32-timer-cnt: a=
dd support for stm32mp25)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (3c018bf5a0ee dmaengine: idxd: Remove unused pointer=
 and macro)
Merging cgroup/for-next (86aadd4d2347 Merge branch 'for-6.16' into for-next)
CONFLICT (content): Merge conflict in mm/memcontrol.c
Merging scsi/for-next (e6ee56b019da Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (fd2963e729ed scsi: target: core: Constify struct=
 target_opcode_descriptor)
Merging vhost/linux-next (8adc93f9c343 drm/virtio: implement virtio_gpu_shu=
tdown)
Merging rpmsg/for-next (dc8417021bcd Merge branches 'rpmsg-next', 'rproc-fi=
xes' and 'rproc-next' into for-next)
  5de775df3362 ("rpmsg: qcom_smd: Fix uninitialized return variable in __qc=
om_smd_send()")
Merging gpio-brgl/gpio/for-next (274fd5fe9119 gpiolib: remove unneeded #ifd=
ef)
Merging gpio-intel/for-next (6f09a17d6041 gpiolib-acpi: Update file referen=
ces in the Documentation and MAINTAINERS)
Merging pinctrl/for-next (566f64fd91ab Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging pinctrl-renesas/renesas-pinctrl (5488aa013e9e pinctrl: renesas: rzg=
2l: Add support for RZ/V2N SoC)
Merging pinctrl-samsung/for-next (a30692b4f81b pinctrl: samsung: Add filter=
 selection support for alive bank on gs101)
Merging pwm/pwm/for-next (c0c980f237e8 dt-bindings: timer: renesas,tpu: rem=
ove binding documentation)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging ktest/for-next (5a1bed232781 ktest: Fix Test Failures Due to Missin=
g LOG_FILE Directories)
Merging kselftest/next (1107dc4c5b06 selftests/run_kselftest.sh: Use readli=
nk if realpath is not available)
Merging kunit/test (0af2f6be1b42 Linux 6.15-rc1)
Merging kunit-next/kunit (ce7ff2660604 kunit: tool: add test counts to JSON=
 output)
Merging livepatching/for-next (a8e905a819fd Merge branch 'for-6.15/ftrace-t=
est' into for-next)
Merging rtc/rtc-next (d37058674646 rtc: da9063: simplify irq management)
Merging nvdimm/libnvdimm-for-next (ef1d3455bbc1 libnvdimm/labels: Fix divid=
e error in nd_label_data_init())
Merging at24/at24/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging ntb/ntb-next (0cadf92e93d4 NTB/msi: Remove unused functions)
Merging seccomp/for-next/seccomp (a9b33aae79ce selftests: seccomp: Fix "per=
formace" to "performance")
Merging slimbus/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging nvmem/for-next (a5d9b82ff4ed Merge branch 'nvmem-for-6.16' into nvm=
em-for-next)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (be9362bf03c1 PCI: hv: Remove unnecessary flex a=
rray in struct pci_packet)
CONFLICT (content): Merge conflict in arch/x86/coco/sev/core.c
Merging auxdisplay/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging kgdb/kgdb/for-next (afdbe49276ac kdb: Remove optional size argument=
s from strscpy() calls)
Merging hmm/hmm (c92ae5d4f53e fwctl: Fix repeated device word in log messag=
e)
Merging cfi/cfi/next (0af2f6be1b42 Linux 6.15-rc1)
Merging mhi/mhi-next (6348f62ef7ec bus: mhi: host: pci_generic: Add Telit F=
N920C04 modem support)
Merging memblock/for-next (3b394dff15e1 memblock tests: add test for memblo=
ck_set_node)
Merging cxl/next (6eed708a5693 cxl/feature: Remove redundant code of get su=
pported features)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (c8e1927e7f7d efi/libstub: Describe missing 'out' paramete=
r in efi_load_initrd)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (1cabeb548de6 Merge branch 'slab/for-6.16/testin=
g' into slab/for-next)
Merging random/master (602c988b7827 prandom: remove next_pseudo_random32)
Merging landlock/next (3039ed432745 landlock: Improve bit operations in aud=
it code)
Merging rust/rust-next (ae8b3a83fb9d rust: str: fix typo in comment)
CONFLICT (content): Merge conflict in rust/bindings/bindings_helper.h
Applying: fix up for conflict against drm-nova
Applying: fixup for conflict with the mm-unstable tree
Applying: fix up for conflict with cpufreq-arm tree
Merging rust-alloc/alloc-next (771c5a7d9843 rust: alloc: add Vec::insert_wi=
thin_capacity)
Merging rust-pin-init/pin-init-next (9de1a293c8ec rust: pin-init: improve d=
ocumentation for `Zeroable` derive macros)
Merging rust-timekeeping/timekeeping-next (679185904972 MAINTAINERS: rust: =
Add a new section for all of the time stuff)
Merging rust-xarray/xarray-next (fa616196fbea MAINTAINERS: add entry for Ru=
st XArray API)
Merging sysctl/sysctl-next (23b8bacf1547 sysctl: Close test ctl_headers wit=
h a for loop)
Merging execve/for-next/execve (11854fe263eb binfmt_elf: Move brk for stati=
c PIE even if ASLR disabled)
Merging bitmap/bitmap-for-next (895ee6a22e31 topology: make for_each_node_w=
ith_cpus() O(N))
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (723dc57027a7 string.h: Provide basic sanity che=
cks for fallback memcpy())
Merging nolibc/for-next (a7aa8b638d08 selftests: harness: Stop using setjmp=
()/longjmp())
Merging iommufd/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging turbostat/next (447c98c1ca4a tools/power turbostat: Add idle govern=
or statistics reporting)
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.8
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.c
Merging pwrseq/pwrseq/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging capabilities-next/caps-next (4ae89b1fe7c2 capability: Remove unused=
 has_capability)
Merging ipe/next (dfc8d7e6caa2 ipe: use SHA-256 library API instead of cryp=
to_shash API)
Merging kcsan/next (9d89551994a4 Linux 6.13-rc6)
Merging crc/crc-next (289c99bec7ee lib/crc32: add SPDX license identifier)
Merging fwctl/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging devsec-tsm/next (9d948b880409 Merge branch 'for-6.16/tsm-mr' into t=
sm-next)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)
Applying: hack for "coredump: add coredump socket" and !CONFIG_NET

--Sig_/TcRXkRNMDhn_lpD1saH8eEy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgttvgACgkQAVBC80lX
0GxwHAgAjT+FjOwIC63OkjOBM/0lf/T4LjE7vMrafwEDgAwwoT6nymdjOMPqvcGy
guqSV+mV/NVydTNl3xqqxidyT2uu1nP42H1IJN5BPOfDELFjoj5bFxylsRg6Ityi
pYhBA61eNIoqcMroGWIZnDygCK8QTp+M3cOOQJOlwci1GGCzk2biTUldEz3fSJUB
S1FW//FezvrdsFfXj1ph9tWnlkMWe32VjVfg46+cz4enaItdu3+WJtBuffMxoxuG
0aQ1EeuGtpWdRejU4JGjVq0USJ9hIUrb8+O/nZuvokwuh5ZQ52XF0QEPSyDsXdlh
2MHG6R+axbyWKm6mJ0uRcvG82pf3DA==
=XcCX
-----END PGP SIGNATURE-----

--Sig_/TcRXkRNMDhn_lpD1saH8eEy--

