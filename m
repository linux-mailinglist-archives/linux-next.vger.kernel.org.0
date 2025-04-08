Return-Path: <linux-next+bounces-6182-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEBBA7F36E
	for <lists+linux-next@lfdr.de>; Tue,  8 Apr 2025 06:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1D191893A13
	for <lists+linux-next@lfdr.de>; Tue,  8 Apr 2025 04:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07AF01FE478;
	Tue,  8 Apr 2025 04:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GdCTIH3z"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6484C17A30E;
	Tue,  8 Apr 2025 04:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744085125; cv=none; b=GswRL9XBP3OVK2S+t5EUkJ8x0Ly5P1zdfcLMTc6KA5VKSUwfvlhhYQ93guF4Xt61LKNOpMMT7WnqTPG2nfmTq5P688jek8JXDAli1mM5waD3wrFo/c9czAXjR/Fwe8I069DTuHPlfv6J5FyZQx6ceh5aJ/3o9JBYwjR1jgU+RhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744085125; c=relaxed/simple;
	bh=TKy+Pu1BnYuBXExlXP5zFJHlBEX5CYvZbvMnoVyQHAY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Xq12IlVsHC5bCd59gWXp518TJjDtWS3MLkXf18dHDG7/7qul7INzC2fs4akTBX80WEw8L1Y6Ge/9qnxW2drnElLGXGf1VretwIFIUTCF8WBrR6rdjRD9KewbA2H6kDEhaKa0Y5mE/WV/ZbflzUwfLPFNK/eh1a697F3IZOEhj1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GdCTIH3z; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744085114;
	bh=x78e0pU/ReH7MC9KCR3XXae1exS1WHWU4kv+slRv13Q=;
	h=Date:From:To:Cc:Subject:From;
	b=GdCTIH3zVKBEbr6SgCjpi5ny6HgdWrP8rzwzYOq/MILAW8W3GAfMXOYxu0LAdFASQ
	 vakRdSE3ZpQIeuKYp1zRjD5dyp5HJpHo7kOAUFb/ZFjaWZni3C9L9xmxCa2+2DaZZ/
	 AsWo91j+af0MjnE/hOmaB3GeM28S0aMIgEDZk3ELoocQwsFESh1pj6WG/ZxEjabG52
	 cZp9iYUjgGjzSGqIHAutsoYyjAKbk1BlrHR8/ERWhIwox6vJWqBjmDYLGcENNerq8q
	 9OGDZnyUkK8AWl01q3cJjkQnxAdtDevxAyTPnmloov5CVKIOaKoV1v5HQ8ifEyy0sd
	 QtKkqwmE4wkFw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZWstL0kSSz4wcD;
	Tue,  8 Apr 2025 14:05:14 +1000 (AEST)
Date: Tue, 8 Apr 2025 14:05:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 8
Message-ID: <20250408140513.0d6f2c0d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YhojJv+j_=yD=0N1DbbHu7K";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YhojJv+j_=yD=0N1DbbHu7K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250407:

The ath-next tree gained a build failure so I used the version from
next-20250407.

The tip tree gained a conflict against the crypto tree.

he xen-tip tree gained a conflict against the mm-hotfixes tree.

Non-merge commits (relative to Linus' tree): 1495
 1644 files changed, 47508 insertions(+), 32055 deletions(-)

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
Merging origin/master (0af2f6be1b42 Linux 6.15-rc1)
Merging fixes/fixes (b3c623b9a94f Merge tag 'thermal-6.15-rc1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging ext4-fixes/fixes (4bbf9020becb Linux 6.13-rc4)
Merging vfs-brauner-fixes/vfs.fixes (f5ff87a84a88 fs: actually hold the nam=
espace semaphore)
Merging fscrypt-current/for-current (2014c95afece Linux 6.14-rc1)
Merging fsverity-current/for-current (2014c95afece Linux 6.14-rc1)
Merging btrfs-fixes/next-fixes (16ce647f8360 Merge branch 'misc-6.15' into =
next-fixes)
Merging vfs-fixes/fixes (00cdfdcfa080 hypfs_create_cpu_files(): add missing=
 check for hypfs_mkdir() failure)
Merging erofs-fixes/fixes (38fec10eb60d Linux 6.14)
Merging nfsd-fixes/nfsd-fixes (26a80762153b NFSD: Add a Kconfig setting to =
enable delegated timestamps)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (228a1157fb9f Merge tag '6.13-rc-part1-SM=
B3-client-fixes' of git://git.samba.org/sfrench/cifs-2.6)
Merging bcachefs/for-next (f4e35e5f940c bcachefs: RO mounts now use less me=
mory)
Merging fscrypt/for-next (13dc8eb90067 fscrypt: mention init_on_free instea=
d of page poisoning)
Merging btrfs/for-next (4160400a5334 Merge branch 'for-next-next-v6.15-2025=
0407' into for-next-20250407)
Merging ceph/master (aa5364618146 libceph: fix slab-use-after-free in have_=
mon_and_osd_map())
Merging cifs/for-next (b77d90938623 Revert "smb: client: fix TCP timers dea=
dlock after rmmod")
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
Merging fsverity/for-next (a19bcde49998 Revert "fsverity: relax build time =
dependency on CRYPTO_SHA256")
Merging fuse/for-next (2d066800a427 fuse: remove unneeded atomic set in uri=
ng creation)
Merging gfs2/for-next (10518797ca98 gfs2: move msleep to sleepable context)
Merging jfs/jfs-next (5dff41a86377 jfs: fix array-index-out-of-bounds read =
in add_missing_indices)
Merging ksmbd/ksmbd-for-next (06a22366d6a1 Merge tag 'v6.15rc-part2-ksmbd-s=
erver-fixes' of git://git.samba.org/ksmbd)
Merging nfs/linux-next (0af2f6be1b42 Linux 6.15-rc1)
Merging nfs-anna/linux-next (9084ed79ddaa lsm,nfs: fix memory leak of lsm_c=
ontext)
Merging nfsd/nfsd-next (d0aeaab89dad NFSD: Add experimental setting to disa=
ble the use of splice read)
Merging ntfs3/master (8b12017c1b95 fs/ntfs3: Remove unused ntfs_flush_inode=
s)
Merging orangefs/for-next (121a83ce6fe6 orangefs: Bufmap deadcoding)
Merging overlayfs/overlayfs-next (c8b359dddb41 ovl: Filter invalid inodes w=
ith missing lookup function)
Merging ubifs/next (69146a8c893f ubi: ubi_get_ec_info: Fix compiling error =
'cast specifies array type')
Merging v9fs/9p-next (4210030d8bc4 docs: fs/9p: Add missing "not" in cache =
documentation)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (71700ac47ad8 Merge tag 'v6.15-rc1' into for-next)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging vfs-brauner/vfs.all (504b80e20cbe Merge branch 'vfs-6.16.pidfs' int=
o vfs.all)
Merging vfs/for-next (2e72b1e0aac2 Merge branch 'work.d_revalidate' into fo=
r-next)
Merging mm-hotfixes/mm-hotfixes-unstable (ed174fe429b1 kunit: slub: add mod=
ule description)
Merging fs-current (42ea255e9b20 Merge branch 'next-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/kdave/linux.git)
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
Merging sophgo-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging m68k-current/for-linus (c94cf023dce3 m68k: defconfig: Update defcon=
figs for v6.14-rc1)
Merging powerpc-fixes/fixes (0a87d6bb6fd2 Merge tag 'powerpc-6.15-2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging s390-fixes/fixes (38fec10eb60d Linux 6.14)
Merging net/main (04efcee6ef8d net: hold instance lock during NETDEV_CHANGE)
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
Merging rdma-fixes/for-rc (0af2f6be1b42 Linux 6.15-rc1)
Merging sound-current/for-linus (df540af51fa8 ALSA: azt2320: Replace deprec=
ated strcpy() with strscpy())
Merging sound-asoc-fixes/for-linus (3b57c568a314 Merge remote-tracking bran=
ch 'asoc/for-6.14' into asoc-linus)
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
Merging crypto-current/master (1ddaff40c08a crypto: tegra - Fix IV usage fo=
r AES ECB)
Merging vfio-fixes/for-linus (09dfc8a5f2ce vfio/pci: Fallback huge faults f=
or unaligned pfn)
Merging kselftest-fixes/fixes (2f856325242c selftests: tpm2: test_smoke: us=
e POSIX-conformant expression operator)
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
Merging kvm-fixes/master (c77eee50caa2 Merge branch 'kvm-pi-fix-lockdep' in=
to HEAD)
Merging kvms390-fixes/master (d8dfda5af0be KVM: s390: pv: fix race when mak=
ing a page secure)
Merging hwmon-fixes/hwmon (0af2f6be1b42 Linux 6.15-rc1)
Merging nvdimm-fixes/libnvdimm-fixes (265e98f72bac acpi: nfit: vmalloc-out-=
of-bounds Read in acpi_nfit_ctl)
Merging cxl-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging dma-mapping-fixes/dma-mapping-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging drivers-x86-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging samsung-krzk-fixes/fixes (2908ffa53f8e firmware: exynos-acpm: check=
 saved RX before bailing out on empty RX queue)
Merging pinctrl-samsung-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging devicetree-fixes/dt/linus (1296dcbad231 dt-bindings: xilinx: Remove=
 myself from maintainership)
Merging dt-krzk-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging scsi-fixes/fixes (f27a95845b01 scsi: ufs: core: bsg: Fix crash when=
 arpmb command fails)
Merging drm-fixes/drm-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging drm-intel-fixes/for-linux-next-fixes (bc1feb8174b7 drm/i915/xe2hpd:=
 Identify the memory type for SKUs with GDDR + ECC)
Merging mmc-fixes/fixes (77183db6b8db mmc: renesas_sdhi: disable clocks if =
registering regulator failed)
Merging rtc-fixes/rtc-fixes (2014c95afece Linux 6.14-rc1)
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
Merging gpio-brgl-fixes/gpio/for-current (8323f3a69de6 gpio: tegra186: fix =
resource handling in ACPI probe path)
Merging gpio-intel-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging pinctrl-intel-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging auxdisplay-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging kunit-fixes/kunit-fixes (a64dcfb451e2 Linux 6.14-rc2)
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
Merging rust-fixes/rust-fixes (a2cc6ff5ec8f Merge tag 'firewire-updates-6.1=
5' of git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394)
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
Merging tip-fixes/tip/urgent (6a54ff526979 Merge branch into tip/master: 'x=
86/urgent')
Merging slab-fixes/slab/for-next-fixes (dfd3df31c9db mm/slab/kvfree_rcu: Sw=
itch to WQ_MEM_RECLAIM wq)
Merging drm-msm-fixes/msm-fixes (73f69c6be2a9 drm/msm/dsi/phy: Do not overw=
ite PHY_CMN_CLK_CFG1 when choosing bitclk source)
Merging uml-fixes/fixes (96178631c3f5 um: convert irq_lock to raw spinlock)
Merging drm-misc-fixes/for-linux-next-fixes (7fb6afa9125f drm/sti: remove d=
uplicate object names)
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (0af2f6be1b42 Linux 6.15-rc1)
Merging mm-nonmm-stable/mm-nonmm-stable (0af2f6be1b42 Linux 6.15-rc1)
Merging mm/mm-everything (3dfb2d765291 foo)
  209c23a0bc56 ("radix-tree-add-missing-cleanuph-fix")
  2d393bf889b2 ("ASN.1: add module description")
  357370fac829 ("xenbus: add module description")
  366fa0d65d8a ("mseal: fix typo and style in documentation")
  377936132d4d ("fpga: tests: add module descriptions")
  3ea5cf59f16d ("test suite: use %zu to print size_t")
  5449bbb3f84a ("zlib: add module description")
  601dcd7dfb5b ("selftests/mm: generate a temporary mountpoint for cgroup f=
ilesystem")
  66dedc17139e ("radix-tree: add missing cleanup.h")
  81bfa729a592 ("mm/contig_alloc: fix alloc_contig_range when __GFP_COMP an=
d order < MAX_ORDER")
  8b704c16d723 ("mm/compaction: fix bug in hugetlb handling pathway")
  8ca8ecc35859 ("mm-kasan-add-module-decription-fix")
  9ac05de27d87 ("mm/vma: add give_up_on_oom option on modify/merge, use in =
uffd release")
  a2877e0bc675 ("mm/kasan: add module decription")
  a52eac1d1c26 ("mm/page_alloc: fix deadlock on cpu_hotplug_lock in __accep=
t_page()")
  a74cb36b5d40 ("MAINTAINERS: add Andrew and Baoquan as kexec maintainers")
  aa1e1ac36654 ("samples-livepatch-add-module-descriptions-fix")
  bc819bc26b58 ("mm/page_alloc: avoid second trylock of zone->lock")
  c19473f7b51b ("x86/mm/pat: (un)track_pfn_copy() fix + improvements")
  c7d477c931ba ("locking/local_lock, mm: replace localtry_ helpers with loc=
al_trylock_t type")
  dd392854de5c ("lib/iov_iter: fix to increase non slab folio refcount")
  debba7623587 ("ucs2_string: add module description")
  eb9b13ed7e24 ("mm/hugetlb: fix nid mismatch in alloc_surplus_hugetlb_foli=
o()")
  f3dc4e7d3c23 ("mailmap: map Loic Poulain's old email addresses")
  f5043c085144 ("samples/livepatch: add module descriptions")
  fac11041dfce ("kunit: slub: add module description")
CONFLICT (content): Merge conflict in mm/memcontrol.c
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
Merging qcom/for-next (7483c7cc0b2c Merge branch 'arm64-for-6.16' into for-=
next)
Merging renesas/next (16e65793bd2f Merge branch 'renesas-dts-for-v6.16' int=
o renesas-next)
Merging reset/reset/next (4a65326311ab reset: thead: Add TH1520 reset contr=
oller driver)
Merging rockchip/for-next (2d7a29f6d4da Merge branch 'v6.16-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (50b46f3a5b6b Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (de80bff15295 Merge branches 'for-next/ffa/fixe=
s' and 'for-next/scmi/fixes' of ssh://gitolite.kernel.org/pub/scm/linux/ker=
nel/git/sudeep.holla/linux into for-linux-next)
Merging sophgo/for-next (f047a9285f9f riscv: sophgo: dts: add cooling maps =
for Milk-V Pioneer)
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
Merging clk-renesas/renesas-clk (e1a098330ef0 clk: renesas: r9a09g047: Add =
clock and reset signals for the TSU IP)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (17ba839c3c6c LoongArch: Update Loongson-3=
 default config file)
Merging m68k/for-next (c94cf023dce3 m68k: defconfig: Update defconfigs for =
v6.14-rc1)
Merging m68knommu/for-next (a7130910b807 m68k: mm: Replace deprecated strnc=
py() with strscpy())
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
Merging s390/for-next (d33d729afcc8 s390/vfio-ap: Fix no AP queue sharing a=
llowed message written to kernel log)
Merging sh/for-next (5f2efd67a17e sh: defconfig: Drop obsolete CONFIG_NET_C=
LS_TCINDEX)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (33c9da5dfb18 um: Rewrite the sigio workaround based on ep=
oll and tgkill)
Merging xtensa/xtensa-for-next (3d6d238851df arch: xtensa: defconfig: Drop =
obsolete CONFIG_NET_CLS_TCINDEX)
Merging fs-next (b36215701c2b Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (9554264e302c Merge branch 'for-6.15-printf-attribu=
te' into for-next)
Merging pci/next (0af2f6be1b42 Linux 6.15-rc1)
Merging pstore/for-next/pstore (5674609535ba pstore: Change kmsg_bytes stor=
age size to u32)
Merging hid/for-next (160957abbf99 Merge branch 'for-6.15/intel-ish' into f=
or-next)
Merging i2c/i2c/for-next (bec878219183 Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i2c-host/i2c/i2c-host (280deda134db i2c: iproc: Refactor prototype =
and remove redundant error checks)
Merging i3c/i3c/next (bd496a44f041 i3c: Add NULL pointer check in i3c_maste=
r_queue_ibi())
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (e56d78daf95e hwmon: (max6639) : Allow set=
ting target RPM)
Merging jc_docs/docs-next (0af2f6be1b42 Linux 6.15-rc1)
Merging v4l-dvb/next (f81f69a0e3da media: uapi: v4l: Fix V4L2_TYPE_IS_OUTPU=
T condition)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (6f9717c95654 Merge branch 'fixes' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (1efdea051738 cpufreq: sun50i: p=
revent out-of-bounds access)
Merging cpupower/cpupower (fffadbdd6b5a cpupower: Make lib versioning schem=
e more obvious and fix version link)
Merging devfreq/devfreq-next (f3253b23535f PM / devfreq: exynos: remove unu=
sed function parameter)
Merging pmdomain/next (08c42b51c804 pmdomain: core: Reset genpd->states to =
avoid freeing invalid data)
Merging opp/opp/linux-next (2014c95afece Linux 6.14-rc1)
Merging thermal/thermal/linux-next (1b4ef46fd666 thermal/drivers/qcom-spmi-=
temp-alarm: Drop unused driver data)
Merging rdma/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging net-next/main (61f96e684edd Merge tag 'net-6.15-rc1' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/netdev/net)
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
Merging ath-next/for-next (68218fa0862a wifi: ath12k: Fix misspelling "upto=
" in dp.c)
$ git reset --hard HEAD^
Merging next-20250407 version of ath-next
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (0af2f6be1b42 Linux 6.15-rc1)
Merging nand/nand/next (b0e63a0847ee dt-bindings: mtd: gpmi-nand: Add compa=
tible string for i.MX8 chips)
Merging spi-nor/spi-nor/next (eec373688d91 mtd: spi-nor: drop unused <linux=
/of_platform.h>)
Merging crypto/master (d23fce15abd4 crypto: chacha - remove <crypto/interna=
l/chacha.h>)
Merging drm/drm-next (0af2f6be1b42 Linux 6.15-rc1)
Merging drm-exynos/for-linux-next (81a50378559b drm/exynos: Remove unnecess=
ary checking)
Merging drm-misc/for-linux-next (85a063b8b281 drm/i2c: tda998x: select CONF=
IG_DRM_KMS_HELPER)
Merging amdgpu/drm-next (fd4948494dc9 drm/amdgpu/gfx9.4.3: dump full CP pac=
ket header FIFOs)
Merging drm-intel/for-linux-next (8b6b67938ed5 drm/i915/dp_mst: Rename inte=
l_dp::mst.active_links to mst.active_streams)
  38188a7f575d ("drm/i915/dp: Reject HBR3 when sink doesn't support TPS4")
  4f8207469094 ("drm/i915/gvt: fix unterminated-string-initialization warni=
ng")
  fede97b72b95 ("drm/i915: Fix scanline_offset for LNL+ and BMG+")
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
Merging drm-xe/drm-xe-next (1e1981b16bb1 drm/xe: Fix taking invalid lock on=
 wedge)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_pc.c
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging regmap/for-next (2385ba6d1dc4 Merge branch 'regmap-linus' into regm=
ap-next)
Merging sound/for-next (a81aca6f8ed8 ASoC: loongson: Replace deprecated PCI=
 functions)
Merging ieee1394/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging sound-asoc/for-next (b8817e6f6f24 Merge remote-tracking branch 'aso=
c/for-6.16' into asoc-next)
  7288aa73e5cf ("ASoC: loongson: Replace deprecated PCI functions")
Merging modules/modules-next (b464e570f8e6 module: Make .static_call_sites =
read-only after init)
Merging input/next (4d395cb071a3 Input: goodix_berlin - add support for Ber=
lin-A series)
Merging block/for-next (88e581728f3f Merge branch 'io_uring-6.15' into for-=
next)
Merging device-mapper/for-next (9c565428788f dm-ebs: fix prefetch-vs-suspen=
d race)
Merging libata/for-next (565d065acd7e ata: ahci: simplify init function)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (68a3b37b2ccf mmc: Add quirk to disable DDR50 tuning)
Merging mfd/for-mfd-next (a8d137656861 mfd: cgbc-core: Add support for cong=
a-SA8)
Merging backlight/for-backlight-next (dfc034a0494b backlight: pcf50633-back=
light: Remove unused driver)
Merging battery/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging regulator/for-next (16b19bfd8040 regulator: s5m8767: Convert to GPI=
O descriptors)
Merging security/next (0af2f6be1b42 Linux 6.15-rc1)
Merging apparmor/apparmor-next (3e45553acb14 apparmor: Remove unused variab=
le 'sock' in __file_sock_perm())
Merging integrity/next-integrity (976e5b974fef ima: process_measurement() n=
eedlessly takes inode_lock() on MAY_READ)
Merging selinux/next (0af2f6be1b42 Linux 6.15-rc1)
Merging smack/next (a158a937d864 smack: recognize ipv4 CIPSO w/o categories)
Merging tomoyo/master (08733088b566 Merge tag 'rust-fixes-6.15-merge' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux)
Merging tpmdd/next (0af2f6be1b42 Linux 6.15-rc1)
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
Merging spi/for-next (b644c2776652 spi: spi_amd: Add PCI-based driver for A=
MD HID2 SPI controller)
Merging tip/master (0468431b616d Merge branch into tip/master: 'x86/nmi')
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
Merging kvm/next (782f9feaa951 Merge branch 'kvm-pre-tdx' into HEAD)
Merging kvm-arm/next (369c0122682c Merge branch 'kvm-arm64/pmu-fixes' into =
kvmarm/next)
Merging kvms390/next (0c7fbae5bc78 KVM: s390: Don't use %pK through debug p=
rinting)
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (b3f263a98d30 RISC-V: KVM: Optimize commen=
ts in kvm_riscv_vcpu_isa_disable_allowed)
Merging kvm-x86/next (c9ea48bb6ee6 Merge branch 'xen')
Merging xen-tip/linux-next (87af633689ce x86/xen: fix balloon target initia=
lization for PVH dom0)
CONFLICT (content): Merge conflict in drivers/xen/xenbus/xenbus_probe_front=
end.c
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (c22cf2159031 workqueue: Better document teardo=
wn for delayed_work)
Merging sched-ext/for-next (01d541baedd7 selftests/sched_ext: Add test for =
scx_bpf_select_cpu_and())
Merging drivers-x86/for-next (0af2f6be1b42 Linux 6.15-rc1)
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
Merging fastrpc/for-next (2014c95afece Linux 6.14-rc1)
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
Merging gpio-brgl/gpio/for-next (602ae04f5654 gpio: Enable Blaize BLZP1600 =
GPIO support)
Merging gpio-intel/for-next (8f4543e980ff gpio: ich: use new line value set=
ter callbacks)
Merging pinctrl/for-next (89a32b6bc6bd Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging pinctrl-renesas/renesas-pinctrl (abcdeb4e299a pinctrl: renesas: rza=
2: Fix missing of_node_put() call)
Merging pinctrl-samsung/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging pwm/pwm/for-next (e1ec1ccce0a9 pwm: Do stricter return value checki=
ng for .round_waveform_tohw())
Merging ktest/for-next (5a1bed232781 ktest: Fix Test Failures Due to Missin=
g LOG_FILE Directories)
Merging kselftest/next (82ef781f24ac selftests/ftrace: add 'poll' binary to=
 gitignore)
Merging kunit/test (a64dcfb451e2 Linux 6.14-rc2)
Merging kunit-next/kunit (9fbde5d6ad5d kunit: Spelling s/slowm/slow/)
Merging livepatching/for-next (a8e905a819fd Merge branch 'for-6.15/ftrace-t=
est' into for-next)
Merging rtc/rtc-next (424dfcd441f0 rtc: remove 'setdate' test program)
Merging nvdimm/libnvdimm-for-next (ef1d3455bbc1 libnvdimm/labels: Fix divid=
e error in nd_label_data_init())
Merging at24/at24/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging ntb/ntb-next (0cadf92e93d4 NTB/msi: Remove unused functions)
Merging seccomp/for-next/seccomp (8f19331384e6 seccomp: avoid the lock trip=
 seccomp_filter_release in common case)
Merging slimbus/for-next (2014c95afece Linux 6.14-rc1)
Merging nvmem/for-next (accd056fc20b dt-bindings: nvmem: Add compatible for=
 MSM8960)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (628cc040b3a2 x86/hyperv: fix an indentation iss=
ue in mshyperv.h)
Merging auxdisplay/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging kgdb/kgdb/for-next (afdbe49276ac kdb: Remove optional size argument=
s from strscpy() calls)
Merging hmm/hmm (3ac7390cfe2f pds_fwctl: Fix type and endian complaints)
Merging cfi/cfi/next (0af2f6be1b42 Linux 6.15-rc1)
Merging mhi/mhi-next (0686a818d77a bus: mhi: host: Fix race between unprepa=
re and queue_buf)
Merging memblock/for-next (98b7beba1ee6 memblock: uniformly initialize all =
reserved pages to MIGRATE_MOVABLE)
Merging cxl/next (aae0594a7053 cxl/region: Fix the first aliased address mi=
scalculation)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (0dc1754e16b4 efi/libstub: Avoid legacy decompressor zlib/=
zstd wrappers)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (dea2d9221e83 Merge branch 'slab/for-6.15/kfree_=
rcu_tiny' into slab/for-next)
Merging random/master (602c988b7827 prandom: remove next_pseudo_random32)
Merging landlock/next (110faeb679e7 landlock: Remove incorrect warning)
Merging rust/rust-next (a2cc6ff5ec8f Merge tag 'firewire-updates-6.15' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394)
Merging rust-alloc/alloc-next (c3152988c047 rust: alloc: use `spare_capacit=
y_mut` to reduce unsafe)
Merging rust-hrtimer/hrtimer-next (142d93914b85 rust: hrtimer: add maintain=
er entry)
Merging rust-pin-init/pin-init-next (7eb172143d55 Linux 6.14-rc5)
Merging sysctl/sysctl-next (29fa7d793421 selftests/sysctl: fix wording of h=
elp messages)
Merging execve/for-next/execve (8d68cabeb1ff binfmt_elf_fdpic: fix variable=
 set but not used warning)
Merging bitmap/bitmap-for-next (de305063001d test_bits: add tests for BIT_U=
*())
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (a734dc37b5ba Merge branch 'for-next/hardening' =
into for-next/kspp)
Merging nolibc/nolibc (a64dcfb451e2 Linux 6.14-rc2)
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
Merging crc/crc-next (b261d2222063 lib/crc: remove CONFIG_LIBCRC32C)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)

--Sig_/YhojJv+j_=yD=0N1DbbHu7K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf0oHkACgkQAVBC80lX
0GxspwgAjT/YmjdHmS+tU7t0OwEhMAWc8A563HBXPJOHtVdSXUc2Ut6UXdUmuqKg
J9luobvH4oWZlwV5W88xc2LTyd6SkVtv75L9Zo6+geRJDqb5rdG9PTO6WMhUNnPK
cFiM5uxI9U8hgJj7UT+PJmOIpP4FGQjf6mADokwdZY4sZn7pLq5/vs941scGb6sg
NmP2Uoa/lub+qcTzOvSPxePcelNRFhFlm9tONTsIMJENcQYpWo6WrMJl1029I2JK
o+jrQVkh2G24p5IYRtKTtl30Nu3E1RmVi27etOsbMaDFHRHbLsBNq4KjyRjLbrcK
Y8/WIyN3eXlaSNw1r1l+87erOx+KtA==
=KaT6
-----END PGP SIGNATURE-----

--Sig_/YhojJv+j_=yD=0N1DbbHu7K--

