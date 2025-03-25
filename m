Return-Path: <linux-next+bounces-5995-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B34A6ED0C
	for <lists+linux-next@lfdr.de>; Tue, 25 Mar 2025 10:52:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 648E416F5C8
	for <lists+linux-next@lfdr.de>; Tue, 25 Mar 2025 09:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD4E25484F;
	Tue, 25 Mar 2025 09:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="caJ6hVNo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E595F1DE8A0;
	Tue, 25 Mar 2025 09:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742896341; cv=none; b=Vh8SAn2CEmZHDSw7lPuUx5ESHH5caXer8/sZzJ099joR+9JVk36g34GpSvsU9CPYCtzlhgJcyHlhNeYQGLdi8k8Fxh0PkYHPISQDdTa++DsY/qAqiLqwYNliemWZ0cHtNl1r0KUaRlJLRVpS8J7x7WGy7Y5B3tNOVtRcly2XSaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742896341; c=relaxed/simple;
	bh=WZoe2hl2IrbYrcefK/inrEfejd9iqjBmOkyjW3wdV4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=thpLNOd7lGxpJ1uIVxnNDA4TxDAdbRUREx+0YnIMhio8ewxSfo9MBTvqCizHEs0iI8yE52wdogVvBRAdr4PDRIis6J6xMWsiNdIA1EuSaamBpBQNWmn/b2jcosks9VN6pxsI4UVzESS8GFfxUTi1S7dE7/JWAFeIoXWk/8q0vK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=caJ6hVNo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742896332;
	bh=iCMpZIZXNcOpWkfcC+1lJ6SI71BTV+i5QXB42Hy2+MI=;
	h=Date:From:To:Cc:Subject:From;
	b=caJ6hVNo8jUajNrqBsLZxeYa0qhcu2f2A5ZLGrYnGp1Gmw55htVCaLmz4Ea4JyQ/7
	 WnktuIitenOkz8cm98vxUTeMVSkfKdwkOX73Thq/gHqf5GqEbUAY4/kXjF4l9j49Ql
	 LveaN8wNh3JYw0KqkfxULmkrskOVHSddtCvSks/cgULrdBrkA2vCRPBbvo0rUMrV8y
	 ygZgMdcnratTEhzACQLSkKx2CpK0N+js0RIhJPify5cx8RxvtOKfKLXvVPsoLB7pCa
	 xyzECr8WWb1vgTVBjOfTdIgkq8kRWMd/wKrPa70cB+iZpn3Sshvj8do+PlbTWfznpj
	 A3/M5SBCWuUXQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZMQF82w8Pz4w2H;
	Tue, 25 Mar 2025 20:52:12 +1100 (AEDT)
Date: Tue, 25 Mar 2025 20:52:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 25
Message-ID: <20250325205211.153361ff@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R6UYogQ6G51vT3n3YLkcqvZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/R6UYogQ6G51vT3n3YLkcqvZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250324:

The kbuild tree still had its build failure for which I reverted a commit.

the tip tree lost its build failure.

The tty tree lost its build failure.

The rust tree lost its build failure.

Non-merge commits (relative to Linus' tree): 12026
 11634 files changed, 640266 insertions(+), 246012 deletions(-)

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
Merging origin/master (b0cb56cbbdb4 Merge tag 'kernel-6.15-rc1.tasklist_loc=
k' of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs)
Merging fixes/fixes (fac04efc5c79 Linux 6.13-rc2)
Merging ext4-fixes/fixes (4bbf9020becb Linux 6.13-rc4)
Merging vfs-brauner-fixes/vfs.fixes (f70681e9e606 libfs: Fix duplicate dire=
ctory entry in offset_dir_lookup)
Merging fscrypt-current/for-current (2014c95afece Linux 6.14-rc1)
Merging fsverity-current/for-current (2014c95afece Linux 6.14-rc1)
Merging btrfs-fixes/next-fixes (e83be4ca3b94 Merge branch 'misc-6.14' into =
next-fixes)
Merging vfs-fixes/fixes (00cdfdcfa080 hypfs_create_cpu_files(): add missing=
 check for hypfs_mkdir() failure)
Merging erofs-fixes/fixes (6422cde1b0d5 erofs: use buffered I/O for file-ba=
cked mounts by default)
Merging nfsd-fixes/nfsd-fixes (4990d098433d NFSD: Fix CB_GETATTR status fix)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (228a1157fb9f Merge tag '6.13-rc-part1-SM=
B3-client-fixes' of git://git.samba.org/sfrench/cifs-2.6)
Merging bcachefs/for-next (d8bdc8daac1d bcachefs: Kill unnecessary bch2_dev=
_usage_read())
Merging fscrypt/for-next (13dc8eb90067 fscrypt: mention init_on_free instea=
d of page poisoning)
Merging btrfs/for-next (23933a2b971c Merge branch 'for-next-next-v6.14-2025=
0318' into for-next-20250318)
Merging ceph/master (3981be13ec1b ceph: exchange hardcoded value on NAME_MA=
X)
Merging cifs/for-next (2f768943f110 cifs: add validation check for the fiel=
ds in smb_aces)
Merging configfs/for-next (84147f4e84c4 configfs: improve item creation per=
formance)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (03d2b62208a3 dlm: make tcp still work in multi-link env)
Merging erofs/dev (0f24e3c05afe erofs: enable 48-bit layout support)
Merging exfat/dev (063534931f90 exfat: fix missing shutdown check)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (82b6a8dd857d Merge reverts for HSM page fault events=
.)
Merging ext4/dev (d5e206778e96 ext4: fix OOB read when checking dotdot dir)
Merging f2fs/dev (21263d035ff2 f2fs: fix missing discard for active segment=
s)
Merging fsverity/for-next (a19bcde49998 Revert "fsverity: relax build time =
dependency on CRYPTO_SHA256")
Merging fuse/for-next (f44310a142d2 fuse: remove unneeded atomic set in uri=
ng creation)
CONFLICT (content): Merge conflict in fs/fuse/dev_uring.c
Merging gfs2/for-next (8cb70b91b20a gfs2: some comment clarifications)
Merging jfs/jfs-next (a8dfb2168906 jfs: add index corruption check to DT_GE=
TPAGE())
Merging ksmbd/ksmbd-for-next (cdd1471828f1 ksmbd: use aead_request_free to =
match aead_request_alloc)
Merging nfs/linux-next (aa42add73ce9 pNFS/flexfiles: Report ENETDOWN as a c=
onnection error)
Merging nfs-anna/linux-next (9084ed79ddaa lsm,nfs: fix memory leak of lsm_c=
ontext)
Merging nfsd/nfsd-next (26a80762153b NFSD: Add a Kconfig setting to enable =
delegated timestamps)
Merging ntfs3/master (8b12017c1b95 fs/ntfs3: Remove unused ntfs_flush_inode=
s)
Merging orangefs/for-next (121a83ce6fe6 orangefs: Bufmap deadcoding)
Merging overlayfs/overlayfs-next (c8b359dddb41 ovl: Filter invalid inodes w=
ith missing lookup function)
Merging ubifs/next (69146a8c893f ubi: ubi_get_ec_info: Fix compiling error =
'cast specifies array type')
Merging v9fs/9p-next (ad2e2a77dcc7 9p: Use hashtable.h for hash_errmap)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (cdb809a573c4 Merge branch 'xfs-6.15-cleanups' into fo=
r-next)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging vfs-brauner/vfs.all (4f76518956c0 Merge branch 'vfs-6.15.rust' into=
 vfs.all)
CONFLICT (content): Merge conflict in Documentation/filesystems/porting.rst
CONFLICT (content): Merge conflict in tools/testing/selftests/filesystems/o=
verlayfs/set_layers_via_fds.c
Merging vfs/for-next (2e72b1e0aac2 Merge branch 'work.d_revalidate' into fo=
r-next)
Merging mm-hotfixes/mm-hotfixes-unstable (7157bd430e59 mm: zswap: fix crypt=
o_free_acomp() deadlock in zswap_cpu_comp_dead())
Merging fs-current (25cbfedce94e Merge branch 'fixes' of git://git.kernel.o=
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
Merging drivers-memory-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging sophgo-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging m68k-current/for-linus (c94cf023dce3 m68k: defconfig: Update defcon=
figs for v6.14-rc1)
Merging powerpc-fixes/fixes (eff2eb592efd cxl: Fix cross-reference in docum=
entation and add deprecation warning)
Merging s390-fixes/fixes (b4a1dec11793 s390/ftrace: Fix return address reco=
very of traced function)
Merging net/main (cec7dde2a926 Merge branch 'mlx5-misc-fixes-2025-03-18')
Merging bpf/master (6ccf6adb05d0 xsk: Fix __xsk_generic_xmit() error code w=
hen cq is full)
Merging ipsec/master (0aae2867aa60 xfrm_output: Force software GSO only in =
tunnel mode)
Merging netfilter/main (4003c9e78778 Merge tag 'net-6.14-rc7' of git://git.=
kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ipvs/main (4003c9e78778 Merge tag 'net-6.14-rc7' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/netdev/net)
Merging wireless/for-next (081b575617e6 Merge tag 'wireless-2025-03-12' of =
https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless)
Merging ath/for-current (3640dbc1f75c wifi: iwlwifi: Fix A-MSDU TSO prepara=
tion)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (6b5e41a8b51f RDMA/hns: Fix wrong value of max_sg=
e_rd)
Merging sound-current/for-linus (829ee558f352 ALSA: hda/realtek: Fix built-=
in mic assignment on ASUS VivoBook X515UA)
Merging sound-asoc-fixes/for-linus (45ff65e30deb ASoC: ti: j721e-evm: Fix c=
lock configuration for ti,j7200-cpb-audio compatible)
Merging regmap-fixes/for-linus (32ffed055dce regmap-irq: Add missing kfree(=
))
Merging regulator-fixes/for-linus (b65439d90150 regulator: rtq2208: Fix the=
 LDO DVS capability)
Merging spi-fixes/for-linus (176fda56d72a spi: Fix reference count leak in =
slave_show())
Merging pci-current/for-linus (2014c95afece Linux 6.14-rc1)
Merging driver-core.current/driver-core-linus (80e54e84911a Linux 6.14-rc6)
Merging tty.current/tty-linus (0ad2507d5d93 Linux 6.14-rc3)
Merging usb.current/usb-linus (f2865c6300d7 usb: typec: tcpm: fix state tra=
nsition for SNK_WAIT_CAPABILITIES state in run_state_machine())
Merging usb-serial-fixes/usb-linus (4701f33a1070 Linux 6.14-rc7)
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
Merging thunderbolt-fixes/fixes (4701f33a1070 Linux 6.14-rc7)
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
Merging omap-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging kvm-fixes/master (abab683b972c Merge tag 'kvm-s390-master-6.14-1' o=
f https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging kvms390-fixes/master (d8dfda5af0be KVM: s390: pv: fix race when mak=
ing a page secure)
Merging hwmon-fixes/hwmon (815f80ad20b6 hwmon: (nct6775-core) Fix out of bo=
unds access for NCT679{8,9})
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
Merging drm-fixes/drm-fixes (41e09ef6c26f Merge tag 'amd-drm-fixes-6.14-202=
5-03-20' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (4701f33a1070 Linux 6.14-rc7)
Merging mmc-fixes/fixes (723ef0e20dbb mmc: sdhci-brcmstb: add cqhci suspend=
/resume to PM ops)
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
Merging gpio-brgl-fixes/gpio/for-current (4701f33a1070 Linux 6.14-rc7)
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
Merging efi-fixes/urgent (11092db5b573 efivarfs: fix NULL dereference on re=
sume)
Merging battery-fixes/fixes (98380110bd48 power: supply: axp20x_battery: Fi=
x fault handling for AXP717)
Merging iommufd-fixes/for-rc (2ca704f55e22 iommu/arm-smmu-v3: Improve uAPI =
comment for IOMMU_HW_INFO_TYPE_ARM_SMMUV3)
Merging rust-fixes/rust-fixes (a1eb95d6b5f4 scripts: generate_rust_analyzer=
: add uapi crate)
Merging w1-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging pmdomain-fixes/fixes (ef17b519088e pmdomain: amlogic: fix T7 ISP se=
cpower)
Merging i2c-host-fixes/i2c/i2c-host-fixes (6ea39cc38889 i2c: amd-mp2: drop =
free_irq() of devm_request_irq() allocated irq)
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
Merging tip-fixes/tip/urgent (586de92313fc Merge tag 'i2c-for-6.14-rc8' of =
git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging slab-fixes/slab/for-next-fixes (dfd3df31c9db mm/slab/kvfree_rcu: Sw=
itch to WQ_MEM_RECLAIM wq)
Merging drm-msm-fixes/msm-fixes (73f69c6be2a9 drm/msm/dsi/phy: Do not overw=
ite PHY_CMN_CLK_CFG1 when choosing bitclk source)
Merging uml-fixes/fixes (96178631c3f5 um: convert irq_lock to raw spinlock)
Merging drm-misc-fixes/for-linux-next-fixes (021ba7f1babd udmabuf: fix a bu=
f size overflow issue during udmabuf creation)
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (0a1e082b64cc mm/page_alloc: remove unnecessary=
 __maybe_unused in order_to_pindex())
Merging mm-nonmm-stable/mm-nonmm-stable (434333dd3f66 mailmap: consolidate =
email addresses of Alexander Sverdlin)
Merging mm/mm-everything (7514d3cb916f foo)
Merging kbuild/for-next (2c8725c1dca3 rust: kbuild: skip `--remap-path-pref=
ix` for `rustdoc`)
Applying: Revert "modpost: require a MODULE_DESCRIPTION()"
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (99476fa085da perf bench sched pipe: fix enfor=
ced blocking reads in worker_thread)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (2014c95afece Linux 6.14-rc1)
Merging asm-generic/master (dcce85484d3a m68k: coldfire: select PCI_IOMAP f=
or PCI)
Merging alpha/alpha-next (1523226edda5 alpha: Use str_yes_no() helper in pc=
i_dac_dma_supported())
Merging arm/for-next (f520fab580c9 ARM: 9440/1: cacheinfo fix format field =
mask)
Merging arm64/for-next/core (42dc31e2c4dd Merge branch 'for-next/smt-contro=
l' into for-next/core)
Merging arm-perf/for-next/perf (9651f7899cc5 perf/arm_cspmu: Fix missing io=
.h include)
Merging arm-soc/for-next (f7dd075de68d Merge branch 'soc/drivers' into for-=
next)
Merging amlogic/for-next (73a143e43631 Merge branch 'v6.16/arm64-dt' into f=
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
Merging omap/for-next (ea07a4775df0 ARM: dts: omap4-panda-a4: Add missing m=
odel and compatible properties)
Merging qcom/for-next (b6ae34803e82 Merge branches 'arm32-for-6.15', 'arm64=
-defconfig-for-6.15', 'arm64-fixes-for-6.14', 'arm64-for-6.15', 'clk-fixes-=
for-6.14', 'clk-for-6.15', 'drivers-fixes-for-6.14' and 'drivers-for-6.15' =
into for-next)
Merging renesas/next (3ade232c98a8 Merge branch 'renesas-fixes-for-v6.14' i=
nto renesas-next)
Merging reset/reset/next (c361baf67200 reset: imx: fix incorrect module dev=
ice table)
Merging rockchip/for-next (76728fe54f54 Merge branch 'v6.15-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (f0dbe0d40d08 Merge branch 'next/soc' into fo=
r-next)
Merging scmi/for-linux-next (de80bff15295 Merge branches 'for-next/ffa/fixe=
s' and 'for-next/scmi/fixes' of ssh://gitolite.kernel.org/pub/scm/linux/ker=
nel/git/sudeep.holla/linux into for-linux-next)
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
Merging clk/clk-next (98c612243fee Merge branch 'clk-amlogic' into clk-next)
Merging clk-imx/for-next (06a61b5cb6a8 clk: imx8mp: inform CCF of maximum f=
requency of clocks)
Merging clk-renesas/renesas-clk (e1a098330ef0 clk: renesas: r9a09g047: Add =
clock and reset signals for the TSU IP)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (4448c4c96a8a Merge branch 'loongarch-kvm'=
 into loongarch-next)
CONFLICT (content): Merge conflict in arch/loongarch/Kconfig
Merging m68k/for-next (c94cf023dce3 m68k: defconfig: Update defconfigs for =
v6.14-rc1)
Merging m68knommu/for-next (a7130910b807 m68k: mm: Replace deprecated strnc=
py() with strscpy())
Merging microblaze/next (920354d7818b microblaze: Use of_property_present()=
 for non-boolean properties)
Merging mips/mips-next (b73c3ccdca95 MIPS: cm: Fix warning if MIPS_CM is di=
sabled)
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
Merging s390/for-next (ee57c8aa47a2 Merge branch 'features' into for-next)
CONFLICT (content): Merge conflict in arch/s390/include/asm/io.h
Merging sh/for-next (2014c95afece Linux 6.14-rc1)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (33c9da5dfb18 um: Rewrite the sigio workaround based on ep=
oll and tgkill)
CONFLICT (content): Merge conflict in arch/um/kernel/mem.c
Merging xtensa/xtensa-for-next (47812144d395 xtensa: migrate to the generic=
 rule for built-in DTB)
Merging fs-next (e340e14fd4fa Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (4fed181ddb87 Merge branch 'for-6.15' into for-next)
Merging pci/next (cc080b865880 Merge branch 'pci/misc')
Merging pstore/for-next/pstore (5674609535ba pstore: Change kmsg_bytes stor=
age size to u32)
Merging hid/for-next (160957abbf99 Merge branch 'for-6.15/intel-ish' into f=
or-next)
Merging i2c/i2c/for-next (fb6927860a0b Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i2c-host/i2c/i2c-host (39f8d6380450 i2c: iproc: Refactor prototype =
and remove redundant error checks)
Merging i3c/i3c/next (e8d2d287e26d i3c: master: svc: Fix implicit fallthrou=
gh in svc_i3c_master_ibi_work())
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (2115cbeec8a3 hwmon: emc2305: Use devm_the=
rmal_of_cooling_device_register)
Merging jc_docs/docs-next (323cc36ef68b Merge tag 'chinese-doc-6.15-rc1' of=
 gitolite.kernel.org:pub/scm/linux/kernel/git/alexs/linux into docs-mw)
Merging v4l-dvb/next (90f9ede8f2b3 media: i2c: lt6911uxe: add two selects t=
o Kconfig)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (a2a678c7f4dc Merge branches 'thermal-core', 'thermal=
-intel' and 'thermal-misc' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (1efdea051738 cpufreq: sun50i: p=
revent out-of-bounds access)
Merging cpupower/cpupower (fffadbdd6b5a cpupower: Make lib versioning schem=
e more obvious and fix version link)
Merging devfreq/devfreq-next (f3253b23535f PM / devfreq: exynos: remove unu=
sed function parameter)
Merging pmdomain/next (51f0b8911ec4 firmware: thead: add CONFIG_MAILBOX dep=
endency)
Merging opp/opp/linux-next (2014c95afece Linux 6.14-rc1)
Merging thermal/thermal/linux-next (ecb642900deb dt-bindings: thermal: Corr=
ect indentation and style in DTS example)
Merging rdma/for-next (37826f0a8c2f IB/mad: Check available slots before po=
sting receive WRs)
CONFLICT (content): Merge conflict in drivers/infiniband/hw/mlx5/mr.c
CONFLICT (content): Merge conflict in drivers/infiniband/sw/rxe/rxe.c
Merging net-next/main (98b2c048e2e2 Merge branch 'mlxsw-add-vxlan-to-the-sa=
me-hardware-domain-as-physical-bridge-ports')
CONFLICT (content): Merge conflict in fs/eventpoll.c
Merging bpf-next/for-next (0905f2afa35c Merge branch 'bpf-next/res_spin_loc=
k' into for-next)
CONFLICT (content): Merge conflict in mm/page_owner.c
Applying: fix up for "memcg: Use trylock to access memcg stock_lock"
Merging ipsec-next/master (399e0aae5aab xfrm: Remove unnecessary NULL check=
 in xfrm_lookup_with_ifid())
Merging mlx5-next/mlx5-next (f550694e88b7 net/mlx5: Add IFC bits for PPCNT =
recovery counters group)
Merging netfilter-next/main (71ca3561c268 Merge branch 'mptcp-pm-code-reorg=
anisation')
Merging ipvs-next/main (71ca3561c268 Merge branch 'mptcp-pm-code-reorganisa=
tion')
Merging bluetooth/master (402f42938757 Bluetooth: MGMT: Add LL Privacy Sett=
ing)
Merging wireless-next/for-next (1794d7ab34d2 wifi: mt76: mt7996: fix lockin=
g in mt7996_mac_sta_rc_work())
Merging ath-next/for-next (0e28ee106c46 Merge tag 'ath-next-20250305' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/ath/ath)
Merging wpan-next/master (a5d4d993fac4 dt-bindings: ieee802154: ca8210: Upd=
ate polarity of the reset pin)
Merging wpan-staging/staging (a5d4d993fac4 dt-bindings: ieee802154: ca8210:=
 Update polarity of the reset pin)
Merging mtd/mtd/next (48a29721c967 dt-bindings: mtd: atmel,dataflash: conve=
rt txt to yaml)
Merging nand/nand/next (b0e63a0847ee dt-bindings: mtd: gpmi-nand: Add compa=
tible string for i.MX8 chips)
Merging spi-nor/spi-nor/next (eec373688d91 mtd: spi-nor: drop unused <linux=
/of_platform.h>)
Merging crypto/master (99585c2192cb crypto: testmgr - Add multibuffer acomp=
 testing)
Merging drm/drm-next (cf05922d63e2 Merge tag 'drm-intel-gt-next-2025-03-12'=
 of https://gitlab.freedesktop.org/drm/i915/kernel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_bo.h
CONFLICT (content): Merge conflict in mm/memory.c
Applying: fix up for "drm/gpusvm: Add support for GPU Shared Virtual Memory"
Applying: fixup for "drm/xe: Add drm_pagemap ops to SVM"
Merging drm-exynos/for-linux-next (81a50378559b drm/exynos: Remove unnecess=
ary checking)
Merging drm-misc/for-linux-next (ee20c69c789b drm: adp: Fix NULL vs IS_ERR(=
) check in adp_plane_new())
Merging amdgpu/drm-next (7547510d4a91 drm/amd/pm: Update feature list for s=
mu_v13_0_6)
Merging drm-intel/for-linux-next (af9ec6e4682c drm/i915/display: Fix build =
error without DRM_FBDEV_EMULATION)
Merging drm-msm/msm-next (83ee6d2ec52f dt-bindings: display/msm: dsi-contro=
ller-main: Add missing minItems)
Merging drm-msm-lumag/msm-next-lumag (83ee6d2ec52f dt-bindings: display/msm=
: dsi-controller-main: Add missing minItems)
Merging drm-nova/nova-next (b28786b190d1 gpu: nova-core: add initial docume=
ntation)
Merging drm-xe/drm-xe-next (ac7759c74a60 drm/xe/hw_engine_class_sysfs: Allo=
w to inject error during probe)
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (5bb4205c76ea fbdev: fsl-diu-fb: add missing device_=
remove_file())
Merging regmap/for-next (14b33926f576 Merge remote-tracking branch 'regmap/=
for-6.15' into regmap-next)
Merging sound/for-next (829ee558f352 ALSA: hda/realtek: Fix built-in mic as=
signment on ASUS VivoBook X515UA)
Merging ieee1394/for-next (ca2c736554c1 firewire: core: avoid -Wflex-array-=
member-not-at-end warning)
Merging sound-asoc/for-next (784d0de4af60 Merge remote-tracking branch 'aso=
c/for-6.15' into asoc-next)
Merging modules/modules-next (085c5e37427d module: Remove unnecessary size =
argument when calling strscpy())
Merging input/next (4d395cb071a3 Input: goodix_berlin - add support for Ber=
lin-A series)
Merging block/for-next (49b2b9421e9f Merge branch 'for-6.15/block' into for=
-next)
CONFLICT (content): Merge conflict in tools/testing/selftests/drivers/net/h=
w/Makefile
Merging device-mapper/for-next (d43929ef65a6 dm-delay: support zoned device=
s)
Merging libata/for-next (565d065acd7e ata: ahci: simplify init function)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (c48e13e83513 mmc: core: Remove redundant null check)
Merging mfd/for-mfd-next (b904243247d1 dt-bindings: mfd: syscon: Add the pb=
us-csr node for Airoha EN7581 SoC)
Merging backlight/for-backlight-next (dfc034a0494b backlight: pcf50633-back=
light: Remove unused driver)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging battery/for-next (0b8d073f6c66 power: supply: mt6370: Remove redund=
ant 'flush_workqueue()' calls)
Merging regulator/for-next (454d13c5d233 Merge remote-tracking branch 'regu=
lator/for-6.15' into regulator-next)
Merging security/next (65b796acea1e mailmap: map Stephen Smalley's old emai=
l addresses)
Applying: fix up for "perf: Remove unnecessary parameter of security check"
Merging apparmor/apparmor-next (3e45553acb14 apparmor: Remove unused variab=
le 'sock' in __file_sock_perm())
Merging integrity/next-integrity (672a4c654a08 ima: limit the number of ToM=
ToU integrity violations)
Merging selinux/next (a3d3043ef24a selinux: get netif_wildcard policycap fr=
om policy instead of cache)
Merging smack/next (a158a937d864 smack: recognize ipv4 CIPSO w/o categories)
Merging tomoyo/master (09fbf3d50205 Merge tag 'tomoyo-pr-20250211' of git:/=
/git.code.sf.net/p/tomoyo/tomoyo)
Merging tpmdd/next (ce9e99902ea9 MAINTAINERS: TPM DEVICE DRIVER: add missin=
g includes)
Merging watchdog/master (48a136639ec2 watchdog: aspeed: fix 64-bit division)
Merging iommu/next (22df63a23a9e Merge branches 'apple/dart', 'arm/smmu/upd=
ates', 'arm/smmu/bindings', 'rockchip', 's390', 'core', 'intel/vt-d' and 'a=
md/amd-vi' into next)
Merging audit/next (2014c95afece Linux 6.14-rc1)
Merging devicetree/for-next (31594827c3f4 of: Simplify of_dma_set_restricte=
d_buffer() to use of_for_each_phandle())
CONFLICT (content): Merge conflict in drivers/of/of_private.h
Merging dt-krzk/for-next (854a080f0b73 loongarch: dts: remove non-existent =
DAC from 2k1000-ref)
Merging mailbox/for-next (b278ae8edeb2 mailbox: Remove unneeded semicolon)
Merging spi/for-next (535cc3de69e8 Merge remote-tracking branch 'spi/for-6.=
15' into spi-next)
Merging tip/master (cc086afdd313 Merge branch into tip/master: 'x86/sev')
CONFLICT (content): Merge conflict in arch/arm64/include/asm/vdso/compat_ge=
ttimeofday.h
CONFLICT (content): Merge conflict in arch/arm64/include/asm/vdso/vsyscall.h
CONFLICT (content): Merge conflict in arch/loongarch/Kconfig
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/vdso/gettime=
ofday.h
CONFLICT (content): Merge conflict in arch/riscv/include/asm/io.h
CONFLICT (content): Merge conflict in arch/s390/kernel/time.c
CONFLICT (modify/delete): arch/x86/entry/common.c deleted in tip/master and=
 modified in HEAD.  Version HEAD of arch/x86/entry/common.c left in tree.
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
CONFLICT (content): Merge conflict in kernel/sysctl.c
CONFLICT (content): Merge conflict in kernel/time/namespace.c
CONFLICT (content): Merge conflict in kernel/time/vsyscall.c
CONFLICT (add/add): Merge conflict in lib/vdso/datastore.c
CONFLICT (content): Merge conflict in lib/vdso/gettimeofday.c
CONFLICT (content): Merge conflict in lib/zstd/common/portability_macros.h
CONFLICT (content): Merge conflict in net/core/dev.c
$ git rm -f arch/x86/entry/common.c
Merging clockevents/timers/drivers/next (0f920690a82c dt-bindings: timer: A=
dd SiFive CLINT2)
Merging edac/edac-for-next (ff719e243db5 Merge ras/edac-misc into for-next)
Merging ftrace/for-next (60b68d6d63fa Merge tools/for-next)
CONFLICT (content): Merge conflict in include/linux/module.h
CONFLICT (modify/delete): scripts/tracing/draw_functrace.py deleted in ftra=
ce/for-next and modified in HEAD.  Version HEAD of scripts/tracing/draw_fun=
ctrace.py left in tree.
$ git rm -f scripts/tracing/draw_functrace.py
Merging rcu/next (467c890f2d1a Merge branches 'docs.2025.02.04a', 'lazypree=
mpt.2025.03.04a', 'misc.2025.03.04a', 'srcu.2025.02.05a' and 'torture.2025.=
02.05a')
Merging paulmck/non-rcu/next (87d07e135725 Merge branches 'lkmm.2025.02.25a=
', 'nolibc.2025.03.07a' and 'stop-machine.2025.03.11a' into HEAD)
Merging kvm/next (782f9feaa951 Merge branch 'kvm-pre-tdx' into HEAD)
CONFLICT (content): Merge conflict in arch/arm64/kernel/proton-pack.c
Merging kvm-arm/next (369c0122682c Merge branch 'kvm-arm64/pmu-fixes' into =
kvmarm/next)
Merging kvms390/next (0c7fbae5bc78 KVM: s390: Don't use %pK through debug p=
rinting)
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (b3f263a98d30 RISC-V: KVM: Optimize commen=
ts in kvm_riscv_vcpu_isa_disable_allowed)
Merging kvm-x86/next (c9ea48bb6ee6 Merge branch 'xen')
Merging xen-tip/linux-next (d9f2164238d8 PCI/MSI: Convert pci_msi_ignore_ma=
sk to per MSI domain flag)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (1e5f94eb8ef7 Merge branch 'for-6.15' into for-=
next)
Merging sched-ext/for-next (d78027174482 Merge branch 'for-6.15' into for-n=
ext)
Merging drivers-x86/for-next (96b8f4658b70 platform/x86/amd/pmf: convert ti=
meouts to secs_to_jiffies())
  96b8f4658b70 ("platform/x86/amd/pmf: convert timeouts to secs_to_jiffies(=
)")
  b3e8dc1143b9 ("platform/x86: thinkpad_acpi: convert timeouts to secs_to_j=
iffies()")
Merging chrome-platform/for-next (9fc83373f0ff platform/chrome: cros_ec_typ=
ec: Add support for setting USB mode via sysfs)
Merging chrome-platform-firmware/for-firmware-next (2014c95afece Linux 6.14=
-rc1)
Merging hsi/for-next (e3f88665a780 HSI: ssi_protocol: Fix use after free vu=
lnerability in ssi_protocol Driver Due to Race Condition)
Merging leds-lj/for-leds-next (2528eec7da0e leds: rgb: leds-qcom-lpg: Fix c=
alculation of best period Hi-Res PWMs)
Merging ipmi/for-next (4701f33a1070 Linux 6.14-rc7)
Merging driver-core/driver-core-next (51d0de7596a4 rust: platform: require =
Send for Driver trait implementers)
Applying: fix up for "rust: io: rename `io::Io` accessors"
Applying: fix up for "rust: pci: fix unrestricted &mut pci::Device"
Merging usb/usb-next (ed492c95f13a Merge tag 'usb-serial-6.15-rc1' of ssh:/=
/gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-nex=
t)
Merging thunderbolt/next (ad79c278e478 thunderbolt: Do not add non-active N=
VM if NVM upgrade is disabled for retimer)
Merging usb-serial/usb-next (6a7713ec5337 USB: serial: mos7840: drop unused=
 defines)
Merging tty/tty-next (9f8fe348ac95 tty: serial: fsl_lpuart: Fix unused vari=
able 'sport' build warning)
  3c3cede051cd ("tty: caif: removed unused function debugfs_tx()")
Merging char-misc/char-misc-next (5d1a5c4f121f Merge tag 'coresight-next-v6=
.15' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/coresight/linux =
into char-misc-next)
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
Merging vfio/next (860be250fc32 vfio/pci: Handle INTx IRQ_NOTCONNECTED)
Merging w1/for-next (33c145297840 w1: w1_therm: w1: Use HWMON_CHANNEL_INFO =
macro to simplify code)
Merging spmi/spmi-next (092c49673431 spmi: Only use Hikey 970 SPMI controll=
er driver when ARM64)
Merging staging/staging-next (3b23d31e569c staging: rtl8723bs: fixed a unne=
cessary parentheses coding style issue)
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
Merging cgroup/for-next (1df3a1b56415 Merge branch 'for-6.15' into for-next)
Merging scsi/for-next (6cb447cade58 Merge branch 'misc' into for-next)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/rockchip/rk3576.d=
tsi
CONFLICT (content): Merge conflict in drivers/scsi/scsi_debug.c
Merging scsi-mkp/for-next (20b97acc4caf scsi: ufs: core: Fix a race conditi=
on related to device commands)
CONFLICT (content): Merge conflict in drivers/ufs/core/ufshcd.c
Merging vhost/linux-next (ac34bd6a617c virtio: console: Make resize control=
 event handling compliant with spec)
Merging rpmsg/for-next (63a63c50d2d1 Merge branches 'hwspinlock-next' and '=
rproc-next' into for-next)
Merging gpio-brgl/gpio/for-next (af54a2fbdf45 gpio: TODO: add an item to tr=
ack reworking the sysfs interface)
Merging gpio-intel/for-next (e646f0dae7b0 gpiolib-acpi: Drop unneeded ERR_C=
AST() in __acpi_find_gpio())
Merging pinctrl/for-next (89a32b6bc6bd Merge branch 'devel' into for-next)
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
Merging rtc/rtc-next (0176188220a7 rtc: cros-ec: Avoid a couple of -Wflex-a=
rray-member-not-at-end warnings)
Merging nvdimm/libnvdimm-for-next (ef1d3455bbc1 libnvdimm/labels: Fix divid=
e error in nd_label_data_init())
Merging at24/at24/for-next (f25f405d250f eeprom: at24: Drop of_match_ptr() =
and ACPI_PTR() protections)
Merging ntb/ntb-next (bf8a7ce7e4c7 ntb_hw_amd: Add NTB PCI ID for new gen C=
PU)
Merging seccomp/for-next/seccomp (8f19331384e6 seccomp: avoid the lock trip=
 seccomp_filter_release in common case)
Merging slimbus/for-next (2014c95afece Linux 6.14-rc1)
Merging nvmem/for-next (accd056fc20b dt-bindings: nvmem: Add compatible for=
 MSM8960)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (628cc040b3a2 x86/hyperv: fix an indentation iss=
ue in mshyperv.h)
Merging auxdisplay/for-next (67200d70e459 Merge patch series "auxdisplay: c=
harlcd: Refactor memory allocation")
Merging kgdb/kgdb/for-next (6beaa75cd24d kdb: Remove unused flags stack)
Merging hmm/hmm (403257070602 pds_fwctl: add Documentation entries)
Merging cfi/cfi/next (2014c95afece Linux 6.14-rc1)
Merging mhi/mhi-next (0686a818d77a bus: mhi: host: Fix race between unprepa=
re and queue_buf)
Merging memblock/for-next (98b7beba1ee6 memblock: uniformly initialize all =
reserved pages to MIGRATE_MOVABLE)
Merging cxl/next (aae0594a7053 cxl/region: Fix the first aliased address mi=
scalculation)
CONFLICT (content): Merge conflict in tools/testing/cxl/test/mem.c
Merging zstd/zstd-next (091697666ab0 zstd: Work around gcc segfault on vers=
ions older than 11.4)
CONFLICT (content): Merge conflict in lib/zstd/common/portability_macros.h
Merging efi/next (0dc1754e16b4 efi/libstub: Avoid legacy decompressor zlib/=
zstd wrappers)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (dea2d9221e83 Merge branch 'slab/for-6.15/kfree_=
rcu_tiny' into slab/for-next)
CONFLICT (content): Merge conflict in kernel/rcu/tiny.c
Merging random/master (602c988b7827 prandom: remove next_pseudo_random32)
Merging landlock/next (5d1bd467a9e5 landlock: Add audit documentation)
Merging rust/rust-next (28bb48c4cb34 rust: dma: add `Send` implementation f=
or `CoherentAllocation`)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_panic_qr.rs
CONFLICT (content): Merge conflict in rust/Makefile
CONFLICT (content): Merge conflict in rust/kernel/init.rs
CONFLICT (content): Merge conflict in rust/kernel/sync/condvar.rs
CONFLICT (content): Merge conflict in rust/kernel/sync/lock.rs
CONFLICT (content): Merge conflict in rust/pin-init/src/macros.rs
CONFLICT (content): Merge conflict in scripts/generate_rust_analyzer.py
Applying: fix up for "rust: init: fix `Zeroable` implementation for `Option=
<NonNull<T>>` and `Option<KBox<T>>`"
Applying: fix up for "samples: rust: add Rust dma test sample driver"
Merging rust-alloc/alloc-next (80e54e84911a Linux 6.14-rc6)
Merging rust-hrtimer/hrtimer-next (142d93914b85 rust: hrtimer: add maintain=
er entry)
Applying: fix up for merge between rust and rust-hrtimer
Merging rust-pin-init/pin-init-next (7eb172143d55 Linux 6.14-rc5)
Merging sysctl/sysctl-next (29fa7d793421 selftests/sysctl: fix wording of h=
elp messages)
CONFLICT (content): Merge conflict in include/linux/mm.h
CONFLICT (content): Merge conflict in kernel/sysctl.c
CONFLICT (content): Merge conflict in mm/filemap.c
Merging execve/for-next/execve (8d68cabeb1ff binfmt_elf_fdpic: fix variable=
 set but not used warning)
Merging bitmap/bitmap-for-next (1cf8e152e8c9 cpumask: align text in comment)
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (78ab93c78fb3 Merge branch 'for-next/hardening' =
into for-next/kspp)
CONFLICT (content): Merge conflict in lib/Makefile
Applying: fix up for "lib: Move KUnit tests into tests/ subdirectory"
Applying: fix up 2 for "lib: Move KUnit tests into tests/ subdirectory"
Merging nolibc/nolibc (a64dcfb451e2 Linux 6.14-rc2)
Merging iommufd/for-next (2f3fe4a0d271 iommufd/selftest: Add coverage for r=
eporting max_pasid_log2 via IOMMU_HW_INFO)
CONFLICT (content): Merge conflict in drivers/iommu/dma-iommu.c
Merging turbostat/next (447c98c1ca4a tools/power turbostat: Add idle govern=
or statistics reporting)
Merging pwrseq/pwrseq/for-next (2014c95afece Linux 6.14-rc1)
Merging capabilities-next/caps-next (4ae89b1fe7c2 capability: Remove unused=
 has_capability)
Merging ipe/next (0c363c7d56b8 ipe: add errno field to IPE policy load audi=
ting)
Merging kcsan/next (9d89551994a4 Linux 6.13-rc6)
Merging crc/crc-next (acf9f8da5e19 x86/crc: drop the avx10_256 functions an=
d rename avx10_512 to avx512)
Merging powerpc-cxl/topic/cxl (5a0fcb0ef558 cxl: Remove driver)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)

--Sig_/R6UYogQ6G51vT3n3YLkcqvZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfifMsACgkQAVBC80lX
0GzIrwf/RwgJOiVRao/oJHRkueKqEGE+7ecBNvEzEF5ndoINplLTjjJXALDHrMqb
tu9NT5bTCUIErJ9UXCJSkd3zEbqW1+GY1Hd0H1p37lv5LSzincb0Uz7pEynHdITg
aldWV1bL7oOlh+Um0TTvghM9BW2rPv8tagOwnW4VemDW8tJLD5+AZ6jdbzbfHYSw
+vt599b7Cz0g5+l04hwMGqrle6YIRSCkB5aVBZSpalqAEZ3ABs1PW6pvEhII1Uy/
kcI5ShRdrlibv6Y4LpXA9Hp5pnwI+VRP7vM43dCppNfKEN4mgMgVsJE2gugRoawF
dtpw1fZpouUakKn/mh5DFOl7Eq01TQ==
=uZho
-----END PGP SIGNATURE-----

--Sig_/R6UYogQ6G51vT3n3YLkcqvZ--

