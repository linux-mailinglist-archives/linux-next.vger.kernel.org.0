Return-Path: <linux-next+bounces-6199-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7D2A8381C
	for <lists+linux-next@lfdr.de>; Thu, 10 Apr 2025 07:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34B618C1CD1
	for <lists+linux-next@lfdr.de>; Thu, 10 Apr 2025 05:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 768D61E5B71;
	Thu, 10 Apr 2025 05:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BdZPN71/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D3A29D0B;
	Thu, 10 Apr 2025 05:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744261914; cv=none; b=TbNwDTYNdbkF8/akCzGAzCiLsAGQeH645zs/4+FpH77aKH5GRAb/KF8Tl7LiSGS44XDD4oLeYZ8ZWdksVP59K1IXNzIv/VAUOyserK5djQxymvXJQjE+QdPoJt95Nhh8+RDz/Lr6YiJLSDrqtSeTFBlDb3Kc0b1j5pX76roCPfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744261914; c=relaxed/simple;
	bh=guKhoYKDrcw6AolZB/uZKeJpK42//mvHI9y4t/4v4so=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Deh9ajW9yrS8YocRMXGaHSC9Q3hQRnjCd+5SEbQFM3zTjVo2DP9dFqWFhMK5Ngt+Li7xMeixOOwk/sTIcIbu175WQOSz02BJqwPDEv2qYryPUkajFeiO1XQO/aZAtPPaidbEhxMXssVB/AeIJ6wS8jdrMiwWucj6v4/zm67nwEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BdZPN71/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744261906;
	bh=WtcFvn69aDFY/ITDYQuYfcK6WTM37/Fqwmgnh1a6EiA=;
	h=Date:From:To:Cc:Subject:From;
	b=BdZPN71/wmVz+enHu80IEdEAVze/5fv05pMZGOUo8QMnThbgUa131VpQ6guW2c/+u
	 GIWFt1fMgX5kUVyrf0Biywk3pI8CnqcaK2MIFgS1lQDPhrVQQdVYrfeoHGs1Dy4j+N
	 7ccRv6EPut3791o6rncI4AofjDmjZTW+wndvwS9gD4Erf5WeTPl05+R0uSJfPG995v
	 yBr/ndzPuk0Ok53TVu9ZSECh4R+A/PLWsiwYr3Ath0ML7fyDKELKEXtcD7XR0L9J3r
	 zdFsUdanJxllwYgjSrTM0lpthsvTjFmEgeOBEhDBlFkT5siTj6BOIHAMAo4m1PA4rw
	 PhK9riZ+FflWA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZY7GB658Qz4wcD;
	Thu, 10 Apr 2025 15:11:46 +1000 (AEST)
Date: Thu, 10 Apr 2025 15:11:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 10
Message-ID: <20250410151146.6a05dd21@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.F/khLUEMcMaUOlN+cqTpex";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.F/khLUEMcMaUOlN+cqTpex
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250409:

Tree removed:	mm
Trees added:	mm-unstable, mm-nonmm-unstable

The net-next tree gained a conflict against the net tree.

The ath-next tree lost its its build failure.

The device-mapper tree gained a build failure so I used the version
from next-20250409.

Non-merge commits (relative to Linus' tree): 2336
 2298 files changed, 88217 insertions(+), 47705 deletions(-)

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
Merging origin/master (a24588245776 Merge tag 'linux_kselftest-kunit-6.15-r=
c2' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest)
Merging fixes/fixes (b3c623b9a94f Merge tag 'thermal-6.15-rc1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging ext4-fixes/fixes (4bbf9020becb Linux 6.13-rc4)
Merging vfs-brauner-fixes/vfs.fixes (bad440f4fdb4 mount: ensure we don't po=
intlessly walk the mount tree)
Merging fscrypt-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging fsverity-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging btrfs-fixes/next-fixes (16ce647f8360 Merge branch 'misc-6.15' into =
next-fixes)
Merging vfs-fixes/fixes (00cdfdcfa080 hypfs_create_cpu_files(): add missing=
 check for hypfs_mkdir() failure)
Merging erofs-fixes/fixes (be45319c9fb1 erofs: fix encoded extents handling)
Merging nfsd-fixes/nfsd-fixes (26a80762153b NFSD: Add a Kconfig setting to =
enable delegated timestamps)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (a6eb9a4a69cc ovl: remove unused forward =
declaration)
Merging bcachefs/for-next (f4e35e5f940c bcachefs: RO mounts now use less me=
mory)
Merging fscrypt/for-next (c07d3aede2b2 fscrypt: add support for hardware-wr=
apped keys)
Merging btrfs/for-next (54bdb701341f Merge branch 'for-next-next-v6.15-2025=
0408' into for-next-20250408)
Merging ceph/master (f452a2204614 ceph: Fix incorrect flush end position ca=
lculation)
Merging cifs/for-next (ef86ab131d91 cifs: Fix querying of WSL CHR and BLK r=
eparse points over SMB1)
Merging configfs/for-next (84147f4e84c4 configfs: improve item creation per=
formance)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (03d2b62208a3 dlm: make tcp still work in multi-link env)
Merging erofs/dev (0f24e3c05afe erofs: enable 48-bit layout support)
Merging exfat/dev (62b5c50f9e93 exfat: fix double free in delayed_free)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (209e834cd5e6 Pull FAN_PRE_ACCESS on directory fanoti=
fy event support)
Merging ext4/dev (d5e206778e96 ext4: fix OOB read when checking dotdot dir)
Merging f2fs/dev (479c7ff5899b f2fs: remove redundant assignment to variabl=
e err)
Merging fsverity/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging fuse/for-next (2d066800a427 fuse: remove unneeded atomic set in uri=
ng creation)
Merging gfs2/for-next (2d3716e20221 gfs2: only apply DLM_LKF_VALBLK if sb_l=
vbptr is not NULL)
Merging jfs/jfs-next (5dff41a86377 jfs: fix array-index-out-of-bounds read =
in add_missing_indices)
Merging ksmbd/ksmbd-for-next (06a22366d6a1 Merge tag 'v6.15rc-part2-ksmbd-s=
erver-fixes' of git://git.samba.org/ksmbd)
Merging nfs/linux-next (0af2f6be1b42 Linux 6.15-rc1)
Merging nfs-anna/linux-next (9084ed79ddaa lsm,nfs: fix memory leak of lsm_c=
ontext)
Merging nfsd/nfsd-next (6aee8b8ccbc7 nfs: add missing selections of CONFIG_=
CRC32)
Merging ntfs3/master (0af2f6be1b42 Linux 6.15-rc1)
Merging orangefs/for-next (121a83ce6fe6 orangefs: Bufmap deadcoding)
Merging overlayfs/overlayfs-next (05f774ffb442 ovl: don't require "metacopy=
=3Don" for "verity")
Merging ubifs/next (69146a8c893f ubi: ubi_get_ec_info: Fix compiling error =
'cast specifies array type')
Merging v9fs/9p-next (4210030d8bc4 docs: fs/9p: Add missing "not" in cache =
documentation)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (71700ac47ad8 Merge tag 'v6.15-rc1' into for-next)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging vfs-brauner/vfs.all (fed3ff67db86 Merge branch 'vfs-6.16.pidfs' int=
o vfs.all)
Merging vfs/for-next (2e72b1e0aac2 Merge branch 'work.d_revalidate' into fo=
r-next)
Merging mm-hotfixes/mm-hotfixes-unstable (ee9c9e2fca3e mailmap: add entry f=
or Jean-Michel Hautbois)
Merging fs-current (a482a6987052 Merge branch 'ovl-fixes' of git://git.kern=
el.org/pub/scm/linux/kernel/git/overlayfs/vfs.git)
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
Merging powerpc-fixes/fixes (0a87d6bb6fd2 Merge tag 'powerpc-6.15-2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging s390-fixes/fixes (aa1ac98268cd s390/cpumf: Fix double free on error=
 in cpumf_pmu_event_init())
Merging net/main (29d261466fa6 Merge branch 'sch_sfq-derived-limit')
Merging bpf/master (9bae8f4f2168 selftests/bpf: Make res_spin_lock test les=
s verbose)
Merging ipsec/master (0aae2867aa60 xfrm_output: Force software GSO only in =
tunnel mode)
Merging netfilter/main (61f96e684edd Merge tag 'net-6.15-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ipvs/main (61f96e684edd Merge tag 'net-6.15-rc1' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/netdev/net)
Merging wireless/for-next (a0f0dc96de03 wifi: wl1251: fix memory leak in wl=
1251_tx_work)
Merging ath/for-current (3640dbc1f75c wifi: iwlwifi: Fix A-MSDU TSO prepara=
tion)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (9beb2c91fb86 RDMA/hns: Fix wrong maximum DMA seg=
ment size)
Merging sound-current/for-linus (b5458fcabd96 ALSA: hda/realtek - Fixed ASU=
S platform headset Mic issue)
Merging sound-asoc-fixes/for-linus (5fc7d2b5cab4 ASoC: cs42l43: Reset clamp=
 override on jack removal)
Merging regmap-fixes/for-linus (6ea36a3e12c5 Merge remote-tracking branch '=
regmap/for-6.14' into regmap-linus)
Merging regulator-fixes/for-linus (0af2f6be1b42 Linux 6.15-rc1)
Merging spi-fixes/for-linus (0af2f6be1b42 Linux 6.15-rc1)
Merging pci-current/for-linus (47216638b6e7 PCI: Run quirk_huawei_pcie_sva(=
) before arm_smmu_probe_device())
Merging driver-core.current/driver-core-linus (0af2f6be1b42 Linux 6.15-rc1)
Merging tty.current/tty-linus (0af2f6be1b42 Linux 6.15-rc1)
Merging usb.current/usb-linus (0af2f6be1b42 Linux 6.15-rc1)
Merging usb-serial-fixes/usb-linus (4701f33a1070 Linux 6.14-rc7)
Merging phy/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging staging.current/staging-linus (0af2f6be1b42 Linux 6.15-rc1)
Merging iio-fixes/fixes-togreg (2d7b60f33da3 iio: adc: ad7380: fix event th=
reshold shift)
Merging counter-current/counter-current (0af2f6be1b42 Linux 6.15-rc1)
Merging char-misc.current/char-misc-linus (0af2f6be1b42 Linux 6.15-rc1)
Merging soundwire-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging thunderbolt-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging input-current/for-linus (946661e3bef8 Merge branch 'next' into for-=
linus)
Merging crypto-current/master (b7b39df7e710 crypto: caam/qi - Fix drv_ctx r=
efcount bug)
Merging vfio-fixes/for-linus (09dfc8a5f2ce vfio/pci: Fallback huge faults f=
or unaligned pfn)
Merging kselftest-fixes/fixes (197c1eaa7ba6 selftests/mincore: Allow read-a=
head pages to reach the end of the file)
Merging dmaengine-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (1c1fd374a2fe mtd: spinand: Fix build with gcc =
< 7.5)
Merging mfd-fixes/for-mfd-fixes (68f860426d50 mfd: axp20x: AXP717: Fix miss=
ing IRQ status registers range)
Merging v4l-dvb-fixes/fixes (d51adf038ebe media: cec: tda9950: add back i2c=
 dependency)
Merging reset-fixes/reset/fixes (38fec10eb60d Linux 6.14)
Merging mips-fixes/mips-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging at91-fixes/at91-fixes (2014c95afece Linux 6.14-rc1)
Merging omap-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging kvm-fixes/master (c478032df078 Merge tag 'kvmarm-fixes-6.15-1' of h=
ttps://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvms390-fixes/master (d8dfda5af0be KVM: s390: pv: fix race when mak=
ing a page secure)
Merging hwmon-fixes/hwmon (0af2f6be1b42 Linux 6.15-rc1)
Merging nvdimm-fixes/libnvdimm-fixes (265e98f72bac acpi: nfit: vmalloc-out-=
of-bounds Read in acpi_nfit_ctl)
Merging cxl-fixes/fixes (36aace15d9bd cxl/pci: Drop the parameter is_port o=
f cxl_gpf_get_dvsec())
Merging dma-mapping-fixes/dma-mapping-fixes (d7b98ae52210 dma/contiguous: a=
void warning about unused size_bytes)
Merging drivers-x86-fixes/fixes (d8455a63f731 platform/x86: intel_pmc_ipc: =
add option to build without ACPI)
Merging samsung-krzk-fixes/fixes (2908ffa53f8e firmware: exynos-acpm: check=
 saved RX before bailing out on empty RX queue)
Merging pinctrl-samsung-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging devicetree-fixes/dt/linus (f0b12d3f28b1 dt-bindings: timer: nxp,sys=
ctr-timer: Add i.MX94 support)
Merging dt-krzk-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging scsi-fixes/fixes (f27a95845b01 scsi: ufs: core: bsg: Fix crash when=
 arpmb command fails)
Merging drm-fixes/drm-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging drm-intel-fixes/for-linux-next-fixes (e3ea2eae7069 drm/i915/huc: Fi=
x fence not released on early probe errors)
Merging mmc-fixes/fixes (77183db6b8db mmc: renesas_sdhi: disable clocks if =
registering regulator failed)
Merging rtc-fixes/rtc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging gnss-fixes/gnss-linus (0ad2507d5d93 Linux 6.14-rc3)
Merging hyperv-fixes/hyperv-fixes (261ffd53cc8e Drivers: hv: Fix bad pointe=
r dereference in hv_get_partition_id)
Merging risc-v-fixes/fixes (4a1d8ababde6 Merge tag 'riscv-for-linus-6.15-mw=
1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging riscv-dt-fixes/riscv-dt-fixes (1b133129ad6b riscv: dts: starfive: F=
ix a typo in StarFive JH7110 pin function definitions)
Merging riscv-soc-fixes/riscv-soc-fixes (2014c95afece Linux 6.14-rc1)
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (0af2f6be1b42 Linux 6.15-rc1)
Merging gpio-brgl-fixes/gpio/for-current (b8c7a1ac884c gpiolib: of: Move At=
mel HSMCI quirk up out of the regulator comment)
Merging gpio-intel-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging pinctrl-intel-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging auxdisplay-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging kunit-fixes/kunit-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging memblock-fixes/fixes (ed471e198493 memblock tests: Fix mutex relate=
d build error)
Merging renesas-fixes/fixes (379c590113ce ARM: shmobile: smp: Enforce shmob=
ile_smp_* alignment)
Merging perf-current/perf-tools (35d13f841a3d perf bpf-filter: Fix a parsin=
g error with comma)
Merging efi-fixes/urgent (11092db5b573 efivarfs: fix NULL dereference on re=
sume)
Merging battery-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging iommufd-fixes/for-rc (0af2f6be1b42 Linux 6.15-rc1)
Merging rust-fixes/rust-fixes (c59026c0570a rust: kbuild: Don't export __pf=
x symbols)
Merging w1-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging pmdomain-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging i2c-host-fixes/i2c/i2c-host-fixes (38fec10eb60d Linux 6.14)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging pwrseq-fixes/pwrseq/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging thead-dt-fixes/thead-dt-fixes (40384c840ea1 Linux 6.13-rc1)
Merging ftrace-fixes/ftrace/fixes (2fa6a01345b5 tracing: Fix memory leak wh=
en reading set_event file)
Merging ring-buffer-fixes/ring-buffer/fixes (e4d4b8670c44 ring-buffer: Use =
flush_kernel_vmap_range() over flush_dcache_folio())
Merging trace-fixes/trace/fixes (fc0585c7faa9 rv: Fix missing unlock on dou=
ble nested monitors return path)
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging tip-fixes/tip/urgent (76963e62a212 Merge branch into tip/master: 'x=
86/urgent')
Merging slab-fixes/slab/for-next-fixes (dfd3df31c9db mm/slab/kvfree_rcu: Sw=
itch to WQ_MEM_RECLAIM wq)
Merging drm-msm-fixes/msm-fixes (83ee6d2ec52f dt-bindings: display/msm: dsi=
-controller-main: Add missing minItems)
Merging uml-fixes/fixes (96178631c3f5 um: convert irq_lock to raw spinlock)
Merging drm-misc-fixes/for-linux-next-fixes (8b6f2e28431b drm/tests: probe-=
helper: Fix drm_display_mode memory leak)
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (0af2f6be1b42 Linux 6.15-rc1)
Merging mm-nonmm-stable/mm-nonmm-stable (0af2f6be1b42 Linux 6.15-rc1)
Merging mm-unstable/mm-unstable (ee9c9e2fca3e mailmap: add entry for Jean-M=
ichel Hautbois)
Merging mm-nonmm-unstable/mm-nonmm-unstable (912f45c84099 exit: combine wor=
k under lock in synchronize_group_exit() and coredump_task_exit())
Merging kbuild/for-next (a7c699d090a1 kbuild: rpm-pkg: build a debuginfo RP=
M)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (35d13f841a3d perf bpf-filter: Fix a parsing e=
rror with comma)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging asm-generic/master (47a60391ae0e rwonce: fix crash by removing READ=
_ONCE() for unaligned read)
Merging alpha/alpha-next (1523226edda5 alpha: Use str_yes_no() helper in pc=
i_dac_dma_supported())
Merging arm/for-next (623c3015d8c9 ARM: 9445/1: clkdev: Mark some functions=
 with __printf() attribute)
Merging arm64/for-next/core (c28f31deeacd arm64: Don't call NULL in do_comp=
at_alignment_fixup())
Merging arm-perf/for-next/perf (9651f7899cc5 perf/arm_cspmu: Fix missing io=
.h include)
Merging arm-soc/for-next (1990c01f0bcc Merge branch 'cznic/platform' into f=
or-next)
Merging amlogic/for-next (49807ed87851 Merge branch 'v6.16/drivers' into fo=
r-next)
Merging asahi-soc/asahi-soc/for-next (00a97a7f66d2 Merge branch 'asahi-soc/=
soc' into asahi-soc/for-next)
Merging aspeed/for-next (bf8f48263c0e Merge remote-tracking branches 'aspee=
d/dt', 'aspeed/drivers', 'aspeed/fixes' and 'nuvoton/dt' into for-next)
Merging at91/at91-next (a8aab30697c5 Merge branch 'at91-dt' into at91-next)
Merging broadcom/next (bdac656f1bb5 Merge branch 'devicetree/fixes' into ne=
xt)
Merging davinci/davinci/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging drivers-memory/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging imx-mxs/for-next (90453dc4dee2 Merge branch 'imx/dt64' into for-nex=
t)
Merging mediatek/for-next (a8a297e8bb3d Merge branch 'v6.14-next/soc' into =
for-next)
Merging mvebu/for-next (ed9c2b28ebef arm64: dts: marvell: Use preferred nod=
e names for "simple-bus")
Merging omap/for-next (ea07a4775df0 ARM: dts: omap4-panda-a4: Add missing m=
odel and compatible properties)
Merging qcom/for-next (088f07a6bd61 Merge branches 'arm32-for-6.16' and 'ar=
m64-for-6.16' into for-next)
Merging renesas/next (16e65793bd2f Merge branch 'renesas-dts-for-v6.16' int=
o renesas-next)
Merging reset/reset/next (4a65326311ab reset: thead: Add TH1520 reset contr=
oller driver)
Merging rockchip/for-next (f9a0df8682f9 Merge branch 'v6.16-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (fa683526da6c Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (3e894e2a8c8f Merge branches 'for-next/scmi/fix=
es' and 'for-next/ffa/fixes' of ssh://gitolite.kernel.org/pub/scm/linux/ker=
nel/git/sudeep.holla/linux into for-linux-next)
Merging sophgo/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging spacemit/for-next (5b90a3d6092d riscv: dts: spacemit: Add Milk-V Ju=
piter board device tree)
Merging stm32/stm32-next (65954899a157 arm64: dts: st: add stm32mp215f-dk b=
oard support)
Merging sunxi/sunxi/for-next (6d1cb8de1573 arm64: dts: allwinner: h616: add=
 YuzukiHD Chameleon support)
Merging tee/next (a7562ff02879 Merge branch 'optee_for_v6.14' into next)
Merging tegra/for-next (4e16110559c3 Merge branch for-6.15/arm64/dt into fo=
r-next)
Merging thead-dt/thead-dt-for-next (c95c1362e5bc riscv: dts: thead: Add mai=
lbox node)
Merging ti/ti-next (0af2f6be1b42 Linux 6.15-rc1)
Merging xilinx/for-next (d6ccf528cb3c Merge branch 'zynqmp/dt' into for-nex=
t)
Merging clk/clk-next (0af2f6be1b42 Linux 6.15-rc1)
Merging clk-imx/for-next (06a61b5cb6a8 clk: imx8mp: inform CCF of maximum f=
requency of clocks)
Merging clk-renesas/renesas-clk (b6f2c6bd4e9e clk: renesas: r9a09g057: Add =
clock and reset entries for GE3D)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (17ba839c3c6c LoongArch: Update Loongson-3=
 default config file)
Merging m68k/for-next (c94cf023dce3 m68k: defconfig: Update defconfigs for =
v6.14-rc1)
Merging m68knommu/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging microblaze/next (920354d7818b microblaze: Use of_property_present()=
 for non-boolean properties)
Merging mips/mips-next (0af2f6be1b42 Linux 6.15-rc1)
Merging openrisc/for-next (af83ece87a1e openrisc: Add cacheinfo support)
Merging parisc-hd/for-next (38fec10eb60d Linux 6.14)
Merging powerpc/next (0a87d6bb6fd2 Merge tag 'powerpc-6.15-2' of git://git.=
kernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging risc-v/for-next (4a1d8ababde6 Merge tag 'riscv-for-linus-6.15-mw1' =
of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging riscv-dt/riscv-dt-for-next (38818f7c9c17 riscv: dts: starfive: jh71=
10-pine64-star64: enable USB 3.0 port)
Merging riscv-soc/riscv-soc-for-next (2014c95afece Linux 6.14-rc1)
Merging s390/for-next (23bf61c87a71 Merge branch 'fixes' into for-next)
Merging sh/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (33c9da5dfb18 um: Rewrite the sigio workaround based on ep=
oll and tgkill)
Merging xtensa/xtensa-for-next (3d6d238851df arch: xtensa: defconfig: Drop =
obsolete CONFIG_NET_CLS_TCINDEX)
Merging fs-next (3e3448c50c8b Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (9554264e302c Merge branch 'for-6.15-printf-attribu=
te' into for-next)
Merging pci/next (71a99d678d5f Merge branch 'pci/irq')
Merging pstore/for-next/pstore (5674609535ba pstore: Change kmsg_bytes stor=
age size to u32)
Merging hid/for-next (160957abbf99 Merge branch 'for-6.15/intel-ish' into f=
or-next)
Merging i2c/i2c/for-next (bec878219183 Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i2c-host/i2c/i2c-host (280deda134db i2c: iproc: Refactor prototype =
and remove redundant error checks)
Merging i3c/i3c/next (0af2f6be1b42 Linux 6.15-rc1)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (1d1a3692ba9c hwmon: Add KEBA battery moni=
toring controller support)
Merging jc_docs/docs-next (9f488ccd0f56 Merge branch 'mauro' into docs-mw)
Merging v4l-dvb/next (9ddc3d6c16ea media: mediatek: vcodec: Remove trailing=
 space after=20
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (6726432f34a7 Merge branch 'pm-cpufreq' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (d4f610a9bafd cpufreq: Do not en=
able by default during compile testing)
Merging cpupower/cpupower (0af2f6be1b42 Linux 6.15-rc1)
Merging devfreq/devfreq-next (f3253b23535f PM / devfreq: exynos: remove unu=
sed function parameter)
Merging pmdomain/next (08c42b51c804 pmdomain: core: Reset genpd->states to =
avoid freeing invalid data)
Merging opp/opp/linux-next (2014c95afece Linux 6.14-rc1)
Merging thermal/thermal/linux-next (1b4ef46fd666 thermal/drivers/qcom-spmi-=
temp-alarm: Drop unused driver data)
Merging rdma/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging net-next/main (311920774c40 configs/debug: run and debug PREEMPT)
CONFLICT (content): Merge conflict in Documentation/networking/netdevices.r=
st
CONFLICT (content): Merge conflict in net/core/lock_debug.c
Merging bpf-next/for-next (06a22366d6a1 Merge tag 'v6.15rc-part2-ksmbd-serv=
er-fixes' of git://git.samba.org/ksmbd)
Merging ipsec-next/master (399e0aae5aab xfrm: Remove unnecessary NULL check=
 in xfrm_lookup_with_ifid())
Merging mlx5-next/mlx5-next (f550694e88b7 net/mlx5: Add IFC bits for PPCNT =
recovery counters group)
Merging netfilter-next/main (61f96e684edd Merge tag 'net-6.15-rc1' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ipvs-next/main (61f96e684edd Merge tag 'net-6.15-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging bluetooth/master (061e4972c48c Bluetooth: btnxpuart: Add an error m=
essage if FW dump trigger fails)
Merging wireless-next/for-next (61f96e684edd Merge tag 'net-6.15-rc1' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ath-next/for-next (25b2f46bd7de wifi: ath12k: ahb: Replace del_time=
r_sync() with timer_delete_sync())
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (0af2f6be1b42 Linux 6.15-rc1)
Merging nand/nand/next (b0e63a0847ee dt-bindings: mtd: gpmi-nand: Add compa=
tible string for i.MX8 chips)
Merging spi-nor/spi-nor/next (eec373688d91 mtd: spi-nor: drop unused <linux=
/of_platform.h>)
Merging crypto/master (3be3f70ee95d crypto: x86/chacha - Restore SSSE3 fall=
back path)
Merging drm/drm-next (0af2f6be1b42 Linux 6.15-rc1)
Merging drm-exynos/for-linux-next (81a50378559b drm/exynos: Remove unnecess=
ary checking)
Merging drm-misc/for-linux-next (e8bf4a1bdaea drm/sysfb: efidrm: Support mo=
dule builds)
CONFLICT (content): Merge conflict in include/drm/drm_kunit_helpers.h
Merging amdgpu/drm-next (72801504fd09 drm/amdgpu/sdma7: add support for dis=
able_kq)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_mes=
.c
Merging drm-intel/for-linux-next (d35b913f0e1c drm/i915/wm: convert i9xx_wm=
.c internally to struct intel_display)
  ced5e64f011c ("drm/i915/vrr: Add vrr.vsync_{start, end} in vrr_params_cha=
nged")
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_bw=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_vb=
lank.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_drv.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_device_types.h
Merging drm-msm/msm-next (83ee6d2ec52f dt-bindings: display/msm: dsi-contro=
ller-main: Add missing minItems)
Merging drm-msm-lumag/msm-next-lumag (83ee6d2ec52f dt-bindings: display/msm=
: dsi-controller-main: Add missing minItems)
Merging drm-nova/nova-next (f5b444361435 gpu: nova-core: remove completed V=
ec extentions from task list)
Merging drm-xe/drm-xe-next (3ded92c43944 drm/xe: remove unused LE_COS)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_device.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_pc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_pci.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_survivability_m=
ode.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_survivability_m=
ode.h
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging regmap/for-next (2385ba6d1dc4 Merge branch 'regmap-linus' into regm=
ap-next)
Merging sound/for-next (ee9c3082f100 ALSA: cs46xx: Remove commented out cod=
e)
Merging ieee1394/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging sound-asoc/for-next (8d40b8e88dd4 Merge remote-tracking branch 'aso=
c/for-6.16' into asoc-next)
Merging modules/modules-next (b464e570f8e6 module: Make .static_call_sites =
read-only after init)
Merging input/next (4d395cb071a3 Input: goodix_berlin - add support for Ber=
lin-A series)
Merging block/for-next (88e581728f3f Merge branch 'io_uring-6.15' into for-=
next)
Merging device-mapper/for-next (713ff5c782f5 dm-bufio: improve the performa=
nce of __dm_bufio_prefetch)
$ git reset --hard HEAD^
Merging next-20250409 version of device-mapper
Merging libata/for-next (565d065acd7e ata: ahci: simplify init function)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (6b8dba9a7fdb mmc: alcor: Use str_read_write() helper)
Merging mfd/for-mfd-next (a8d137656861 mfd: cgbc-core: Add support for cong=
a-SA8)
Merging backlight/for-backlight-next (dfc034a0494b backlight: pcf50633-back=
light: Remove unused driver)
Merging battery/for-next (51212ce95354 power: supply: gpio-charger: Fix wak=
eup source leaks on device unbind)
Merging regulator/for-next (48e6872b467a Add support for ADP5055 triple buc=
k regulator.)
Merging security/next (0af2f6be1b42 Linux 6.15-rc1)
Merging apparmor/apparmor-next (3e45553acb14 apparmor: Remove unused variab=
le 'sock' in __file_sock_perm())
Merging integrity/next-integrity (976e5b974fef ima: process_measurement() n=
eedlessly takes inode_lock() on MAY_READ)
Merging selinux/next (0af2f6be1b42 Linux 6.15-rc1)
Merging smack/next (a158a937d864 smack: recognize ipv4 CIPSO w/o categories)
Merging tomoyo/master (08733088b566 Merge tag 'rust-fixes-6.15-merge' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux)
Merging tpmdd/next (c500cd3b62e3 tpm: Mask TPM RC in tpm2_start_auth_sessio=
n())
Merging watchdog/master (9bc64d338b0b watchdog: sunxi_wdt: Add support for =
Allwinner A523)
Merging iommu/next (22df63a23a9e Merge branches 'apple/dart', 'arm/smmu/upd=
ates', 'arm/smmu/bindings', 'rockchip', 's390', 'core', 'intel/vt-d' and 'a=
md/amd-vi' into next)
Merging audit/next (0af2f6be1b42 Linux 6.15-rc1)
Merging devicetree/for-next (af134b1145e6 dt-bindings: writing-schema: Expl=
ain sub-nodes with additionalProperties:true)
Merging dt-krzk/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging mailbox/for-next (1ec12fd31ecc mailbox: Remove unneeded semicolon)
Merging spi/for-next (e686365c0411 spi: spi_amd: Fix an IS_ERR() vs NULL ch=
eck in probe)
Merging tip/master (e357ddfe2236 Merge branch into tip/master: 'x86/nmi')
CONFLICT (content): Merge conflict in arch/x86/Kconfig.assembler
Merging clockevents/timers/drivers/next (0f920690a82c dt-bindings: timer: A=
dd SiFive CLINT2)
Merging edac/edac-for-next (6c44e5354d4d RAS/AMD/ATL: Include row[13] bit i=
n row retirement)
Merging ftrace/for-next (d85852264728 Merge tools/for-next)
Merging rcu/next (1dc1e0b9d694 srcu: Make FORCE_NEED_SRCU_NMI_SAFE depend o=
n RCU_EXPERT)
Merging paulmck/non-rcu/next (87d07e135725 Merge branches 'lkmm.2025.02.25a=
', 'nolibc.2025.03.07a' and 'stop-machine.2025.03.11a' into HEAD)
Merging kvm/next (fd02aa45bda6 Merge branch 'kvm-tdx-initial' into HEAD)
Merging kvm-arm/next (369c0122682c Merge branch 'kvm-arm64/pmu-fixes' into =
kvmarm/next)
Merging kvms390/next (0c7fbae5bc78 KVM: s390: Don't use %pK through debug p=
rinting)
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (b3f263a98d30 RISC-V: KVM: Optimize commen=
ts in kvm_riscv_vcpu_isa_disable_allowed)
Merging kvm-x86/next (c9ea48bb6ee6 Merge branch 'xen')
Merging xen-tip/linux-next (64a66e2c3b31 x86/xen: disable CPU idle and freq=
uency drivers for PVH dom0)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (c22cf2159031 workqueue: Better document teardo=
wn for delayed_work)
Merging sched-ext/for-next (0b3046179360 sched_ext: Make scx_has_op a bitma=
p)
Merging drivers-x86/for-next (70081121e24c platform: arm64: huawei-gaokun-e=
c: Remove unneeded semicolon)
Merging chrome-platform/for-next (ccf395bde6ae platform/chrome: cros_ec_pro=
to: Allow to build as module)
Merging chrome-platform-firmware/for-firmware-next (0af2f6be1b42 Linux 6.15=
-rc1)
Merging hsi/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging leds-lj/for-leds-next (161e3bea8fa5 leds: nic78bx: Tidy up ACPI ID =
table)
Merging ipmi/for-next (4701f33a1070 Linux 6.14-rc7)
Merging driver-core/driver-core-next (0af2f6be1b42 Linux 6.15-rc1)
Merging usb/usb-next (0af2f6be1b42 Linux 6.15-rc1)
Merging thunderbolt/next (0af2f6be1b42 Linux 6.15-rc1)
Merging usb-serial/usb-next (6a7713ec5337 USB: serial: mos7840: drop unused=
 defines)
Merging tty/tty-next (0af2f6be1b42 Linux 6.15-rc1)
Merging char-misc/char-misc-next (0af2f6be1b42 Linux 6.15-rc1)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (5442d22da7db Coresight: Fix a NULL vs IS_ERR() bug =
in probe)
Merging fastrpc/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga/for-next (e19890a0088b fpga: versal: remove incorrect of_match=
_ptr annotation)
Merging icc/icc-next (4cc004716977 Merge branch 'icc-sm8750' into icc-next)
Merging iio/togreg (8dbeb413806f doc: iio: ad7380: describe offload support)
Merging phy-next/next (0af2f6be1b42 Linux 6.15-rc1)
Merging soundwire/next (0af2f6be1b42 Linux 6.15-rc1)
Merging extcon/extcon-next (7041ed0dde83 extcon: Drop explicit initializati=
on of struct i2c_device_id::driver_data to 0)
Merging gnss/gnss-next (0ad2507d5d93 Linux 6.14-rc3)
Merging vfio/next (860be250fc32 vfio/pci: Handle INTx IRQ_NOTCONNECTED)
Merging w1/for-next (0af2f6be1b42 Linux 6.15-rc1)
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
Merging scsi/for-next (73d2fae8057c Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (1b4902f0a4f2 scsi: megaraid_sas: Driver version =
update to 07.734.00.00-rc1)
Merging vhost/linux-next (ac34bd6a617c virtio: console: Make resize control=
 event handling compliant with spec)
Merging rpmsg/for-next (8532691d0a85 Merge branch 'rproc-next' into for-nex=
t)
Merging gpio-brgl/gpio/for-next (6d7f0c1103ef selftests: gpio: add test cas=
es for gpio-aggregator)
Merging gpio-intel/for-next (a02af05f41c7 Merge patch series "gpiolib: acpi=
: Fix missing info filling")
Merging pinctrl/for-next (89a32b6bc6bd Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging pinctrl-renesas/renesas-pinctrl (abcdeb4e299a pinctrl: renesas: rza=
2: Fix missing of_node_put() call)
Merging pinctrl-samsung/for-next (a30692b4f81b pinctrl: samsung: Add filter=
 selection support for alive bank on gs101)
Merging pwm/pwm/for-next (957062f2ba47 pwm: pca9685: Use new GPIO line valu=
e setter callbacks)
Merging ktest/for-next (5a1bed232781 ktest: Fix Test Failures Due to Missin=
g LOG_FILE Directories)
Merging kselftest/next (0af2f6be1b42 Linux 6.15-rc1)
Merging kunit/test (0af2f6be1b42 Linux 6.15-rc1)
Merging kunit-next/kunit (d1be0cf3b8ae kunit: Spelling s/slowm/slow/)
Merging livepatching/for-next (a8e905a819fd Merge branch 'for-6.15/ftrace-t=
est' into for-next)
Merging rtc/rtc-next (d37058674646 rtc: da9063: simplify irq management)
Merging nvdimm/libnvdimm-for-next (ef1d3455bbc1 libnvdimm/labels: Fix divid=
e error in nd_label_data_init())
Merging at24/at24/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging ntb/ntb-next (0cadf92e93d4 NTB/msi: Remove unused functions)
Merging seccomp/for-next/seccomp (8f19331384e6 seccomp: avoid the lock trip=
 seccomp_filter_release in common case)
Merging slimbus/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging nvmem/for-next (a16627c46793 dt-bindings: nvmem: Add compatible for=
 MSM8960)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (628cc040b3a2 x86/hyperv: fix an indentation iss=
ue in mshyperv.h)
Merging auxdisplay/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging kgdb/kgdb/for-next (afdbe49276ac kdb: Remove optional size argument=
s from strscpy() calls)
Merging hmm/hmm (174ce1d5a55b fwctl: Fix repeated device word in log messag=
e)
Merging cfi/cfi/next (0af2f6be1b42 Linux 6.15-rc1)
Merging mhi/mhi-next (b60a0538cd7f bus: mhi: host: Address conflict between=
 power_up and syserr)
Merging memblock/for-next (3b394dff15e1 memblock tests: add test for memblo=
ck_set_node)
Merging cxl/next (a9d9a1272891 cxl: Remove always true condition for cxlctl=
_validate_hw_command())
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (0dc1754e16b4 efi/libstub: Avoid legacy decompressor zlib/=
zstd wrappers)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (bfedb6b93bc8 mm: kvmalloc: make kmalloc fast pa=
th real fast path)
Merging random/master (602c988b7827 prandom: remove next_pseudo_random32)
Merging landlock/next (fe81536af397 landlock: Remove incorrect warning)
Merging rust/rust-next (0af2f6be1b42 Linux 6.15-rc1)
Merging rust-alloc/alloc-next (c3152988c047 rust: alloc: use `spare_capacit=
y_mut` to reduce unsafe)
Merging rust-hrtimer/hrtimer-next (142d93914b85 rust: hrtimer: add maintain=
er entry)
Merging rust-pin-init/pin-init-next (7eb172143d55 Linux 6.14-rc5)
Merging sysctl/sysctl-next (bc4f328ff516 sparc: mv sparc sysctls into their=
 own file under arch/sparc/kernel)
Merging execve/for-next/execve (8d68cabeb1ff binfmt_elf_fdpic: fix variable=
 set but not used warning)
Merging bitmap/bitmap-for-next (a42d3efc9d98 test_bits: add tests for BIT_U=
*())
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (26fe62cc5e84 Merge branches 'for-linus/hardenin=
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
Merging crc/crc-next (e8c24520a133 crypto: crc32 - remove "_generic" from f=
ilenames)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)

--Sig_/.F/khLUEMcMaUOlN+cqTpex
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf3UxIACgkQAVBC80lX
0GyibAf+KSXAyXTYK108Nw1V5ebh4kCQROgMr9M25pVz5QnsFcADLTBw98LySsEz
BVdg/Sr6aO3/AQKLdZvBHWGl9S8DyvbzJoRaaeKacA+RFVBaG/M6SWI7fzeVDSYd
DYM3ibTstQFoINNhX8uvjfPEXcLtBnJwTv68xxZ9WIaR1dlP0iS1SYtwbJudZye8
1qUQoTOGTtzzCfMc6Xg4p05C3waTLyxnSuJtuqbCdzQ/2qS7235gLWS0QRyez2ga
lNkiv5ajFdmMvWHKDFRmCivM598m6MyNsUCuEkln702eDO+8vZGxb9ezD7Qw6JOR
xlc+DtrbmhM8mky/EuHZCtydPHt4LQ==
=F939
-----END PGP SIGNATURE-----

--Sig_/.F/khLUEMcMaUOlN+cqTpex--

