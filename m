Return-Path: <linux-next+bounces-4257-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D38D099C406
	for <lists+linux-next@lfdr.de>; Mon, 14 Oct 2024 10:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E88201C22709
	for <lists+linux-next@lfdr.de>; Mon, 14 Oct 2024 08:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97834155742;
	Mon, 14 Oct 2024 08:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FQC9rw8v"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4A114F126;
	Mon, 14 Oct 2024 08:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728895889; cv=none; b=WG4IngiQs4ZM17Qfkg21AvPRLHbv6ph6xcJwRrakWr9V+BOr4rYarb8gzS3Kr3IlPNxorLIQ0e3OP0zwxNwFCHm9w4FqzZZzqy8rcPjp88mnUXyEntt1kKzDqwZMfti9UN1Dl30tii5j4YEOvuGFQ9EBbtmm1yKvgRKE7dQrzTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728895889; c=relaxed/simple;
	bh=VOTaZ/mVpCMXiU08H8gmbKRRNLzhK5ucrVybKLfPmlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KhwXhBMyn8+HUuBstcREXWkOQYcywkYLYAxwj7RJz2GMur+lRZgY5O8wJ/gSxSi9qj4EBEI6iSjLacSe1Ii9k/4ULOF++uMBtKdX9h3YT77lr8EqBazXBJWPoyZ1f/V1fs4riJFg/FZiye22nf/u3XzGi6mOlN7l+NpZl5nbcvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FQC9rw8v; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728895879;
	bh=86zIBkVEBJ4PS7Qw39EL6EqKjo/JGSDWfr6bGhsbPlU=;
	h=Date:From:To:Cc:Subject:From;
	b=FQC9rw8v1zkTUfI8dV2/JbuoNQgqfwAQZi7JZAGGDRqVI/vyr6QWtHz1D7BDnPAkj
	 HXpoJysUa0+XRRqJvTdilEnszk2fcnX2/7+BrNEqR19zYBINOArpo1Ui5voalfEEYl
	 DplnsZ6h7M9GyBQR6nZuJ7x0xMeTkckmPFZSLlWJj/ZFKqDLN1HqPnKAN1IJrpY4nI
	 WoM/kbjEhz+pFLm04TMJVB1mc1aQDs2dPCrWkVrv5YdMDSDk3hRwSee3H/o0UhWafh
	 Opad0OTzOG6HfO14855Qy7inDXbtLkareLZeimL4TbsT1g6GCJ3SnV+eNtcn0LU1qq
	 +Kvm/Y+VAiPSw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XRrYg3fx9z4wbv;
	Mon, 14 Oct 2024 19:51:19 +1100 (AEDT)
Date: Mon, 14 Oct 2024 19:51:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 14
Message-ID: <20241014195119.6bfa78a3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R_XfLeCFXxp2m7WoU/PCzWu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/R_XfLeCFXxp2m7WoU/PCzWu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20241011:

The bcachefs tree gained a build failure so I use the version from
next-20241011.

The perf tree lost its build failure.

The drm-xe tree gained a conflict against the drm-intel tree.

The sound tree lost its build failure.

The mfd tree still had its build failure so I used the version from
next-20241010.

The security tree gained a conflict against the mm tree.

The tip tree still had its build failure for which I applied a patch.

The ftrace tree lost its build failure.

The staging tree gained a build failure so I used the version from
next-20241011.

Non-merge commits (relative to Linus' tree): 3672
 5004 files changed, 143738 insertions(+), 86927 deletions(-)

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

I am currently merging 377 trees (counting Linus' and 140 trees of bug
fix patches pending for the current merge release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Status of my local build tests will be at
http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
advice about cross compilers/configs that work, we are always open to add
more builds.

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--=20
Cheers,
Stephen Rothwell

$ git checkout master
$ git reset --hard stable
Merging origin/master (8e929cb546ee Linux 6.12-rc3)
Merging fixes/fixes (87d6aab2389e Merge tag 'for_linus' of git://git.kernel=
.org/pub/scm/linux/kernel/git/mst/vhost)
Merging vfs-brauner-fixes/vfs.fixes (f92f0a1b0569 openat2: explicitly retur=
n -E2BIG for (usize > PAGE_SIZE))
Merging fscrypt-current/for-current (256abd8e550c Linux 6.10-rc7)
Merging fsverity-current/for-current (256abd8e550c Linux 6.10-rc7)
Merging btrfs-fixes/next-fixes (b2399f21633c Merge branch 'misc-6.12' into =
next-fixes)
Merging vfs-fixes/fixes (678379e1d4f7 close_range(): fix the logics in desc=
riptor table trimming)
Merging erofs-fixes/fixes (ae54567eaa87 erofs: get rid of kaddr in `struct =
z_erofs_maprecorder`)
Merging nfsd-fixes/nfsd-fixes (c88c150a467f nfsd: fix possible badness in F=
REE_STATEID)
Merging v9fs-fixes/fixes/next (684a64bf32b6 Merge tag 'nfs-for-6.12-1' of g=
it://git.linux-nfs.org/projects/anna/linux-nfs)
Merging overlayfs-fixes/ovl-fixes (77a28aa47687 ovl: relax WARN_ON in ovl_v=
erify_area())
Merging bcachefs/for-next (c37fd6772eea bcachefs: Fix sysfs warning in fste=
sts generic/730,731)
$ git reset --hard HEAD^
Merging next-20241011 version of bcachefs
Merging fscrypt/for-next (256abd8e550c Linux 6.10-rc7)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (a6f63ff0d702 Merge branch 'for-next-next-v6.12-2024=
1009' into for-next-20241009)
CONFLICT (content): Merge conflict in fs/btrfs/delayed-ref.c
CONFLICT (content): Merge conflict in fs/btrfs/qgroup.c
Merging ceph/master (ccda9910d849 ceph: fix cap ref leak via netfs init_req=
uest)
Merging cifs/for-next (20e3cf2a888d cifs: Fix parsing native symlinks direc=
tory/file type)
Merging configfs/for-next (4425c1d9b44d configfs: improve item creation per=
formance)
Merging dlm/next (dfe5a6cc4204 dlm: make add_to_waiters() that it can't fai=
l)
Merging erofs/dev (9852d85ec9d4 Linux 6.12-rc1)
Merging exfat/dev (cb7d85014fb1 MAINTAINERS: exfat: add myself as reviewer)
Merging exportfs/exportfs-next (98f7e32f20d2 Linux 6.11)
Merging ext3/for_next (282f03136b06 Merge fsnotify fixes.)
Merging ext4/dev (6121258c2b33 ext4: fix off by one issue in alloc_flex_gd(=
))
Merging f2fs/dev (332fade75d0e f2fs: allow parallel DIO reads)
Merging fsverity/for-next (256abd8e550c Linux 6.10-rc7)
Merging fuse/for-next (639ee6854c0f virtiofs: use GFP_NOFS when enqueuing r=
equest through kworker)
Merging gfs2/for-next (7e4a0a50b403 KMSAN: uninit-value in inode_go_dump (5=
))
Merging jfs/jfs-next (2b59ffad47db jfs: Fix uninit-value access of new_ea i=
n ea_buffer)
Merging ksmbd/ksmbd-for-next (a77e0e02af1c ksmbd: add support for supplemen=
tary groups)
Merging nfs/linux-next (67784a74e258 Merge tag 'ata-6.11-rc7' of git://git.=
kernel.org/pub/scm/linux/kernel/git/libata/linux)
Merging nfs-anna/linux-next (7ef60108069b NFS: remove revoked delegation fr=
om server's delegation list)
Merging nfsd/nfsd-next (a8c3e76fe94c xdrgen: Add a utility for extracting X=
DR from RFCs)
Merging ntfs3/master (48dbc127836a fs/ntfs3: Format output messages like ot=
hers fs in kernel)
Merging orangefs/for-next (96319dacaf15 orangefs: Constify struct kobj_type)
Merging overlayfs/overlayfs-next (87d8f162a474 ovl: convert ovl_real_fdget(=
) callers to ovl_real_file())
Merging ubifs/next (92a286e90203 ubi: Fix ubi_init() ubiblock_exit() sectio=
n mismatch)
Merging v9fs/9p-next (79efebae4afc 9p: Avoid creating multiple slab caches =
with the same name)
Merging v9fs-ericvh/ericvh/for-next (684a64bf32b6 Merge tag 'nfs-for-6.12-1=
' of git://git.linux-nfs.org/projects/anna/linux-nfs)
Merging xfs/for-next (77bfe1b11ea0 xfs: fix a typo)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging file-locks/locks-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6-=
mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging iversion/iversion-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6=
-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging vfs-brauner/vfs.all (b859ed2dac21 Merge branch 'vfs.file' into vfs.=
all Signed-off-by: Christian Brauner <brauner@kernel.org>)
Merging vfs/for-next (8f602276d390 Merge tag 'bcachefs-2024-10-05' of git:/=
/evilpiepirate.org/bcachefs)
Merging mm-hotfixes/mm-hotfixes-unstable (1c992f78f25e mm: don't install PM=
D mappings when THPs are disabled by the hw/process/vma)
Merging fs-current (d73e86382550 Merge branch 'fixes' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/xiang/erofs.git)
Merging kbuild-current/fixes (8cf0b93919e1 Linux 6.12-rc2)
Merging arc-current/for-curr (8bf275d61925 arc: rename aux.h to arc_aux.h)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (13f8f1e05f1d arm64: probes: Fix uprobes=
 for big-endian kernels)
Merging arm-soc-fixes/arm/fixes (b72cd67a0300 Merge tag 'arm-soc/for-6.12/d=
evicetree-fixes' of https://github.com/Broadcom/stblinux into arm/fixes)
Merging davinci-current/davinci/for-current (9852d85ec9d4 Linux 6.12-rc1)
Merging drivers-memory-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging sophgo-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging m68k-current/for-linus (b90fae5df917 m68k: defconfig: Update defcon=
figs for v6.11-rc1)
Merging powerpc-fixes/fixes (8956c582ac6b powerpc/8xx: Fix kernel DTLB miss=
 on dcbz)
Merging s390-fixes/fixes (cad4b3d4ab1f KVM: s390: Change virtual to physica=
l address access in diag 0x258 handler)
Merging net/main (174714f0e505 selftests: drivers: net: fix name not define=
d)
Merging bpf/master (b836cbdf3b81 selftests/bpf: Assert link info uprobe_mul=
ti count & path_size if unset)
Merging ipsec/master (3f0ab59e6537 xfrm: validate new SA's prefixlen using =
SA family when sel.family is unset)
Merging netfilter/main (174714f0e505 selftests: drivers: net: fix name not =
defined)
Merging ipvs/main (c6a0862bee69 selftests: netfilter: conntrack_vrf.sh: add=
 fib test case)
Merging wireless/for-next (52009b419355 wifi: mac80211: skip non-uploaded k=
eys in ieee80211_iter_keys)
Merging ath/for-current (2f833e8948d6 Revert "wifi: ath11k: support hiberna=
tion")
Merging wpan/master (09573b1cc76e net: ieee802154: mcr20a: Use IRQF_NO_AUTO=
EN flag in request_irq())
Merging rdma-fixes/for-rc (6ff57a2ea7c2 RDMA/nldev: Fix NULL pointer derefe=
rences issue in rdma_nl_notify_event)
Merging sound-current/for-linus (fd5f14c126a6 ALSA: scarlett2: Add error ch=
eck after retrieving PEQ filter values)
Merging sound-asoc-fixes/for-linus (b930d8647869 ASoC: qcom: Select missing=
 common Soundwire module code on SDM845)
Merging regmap-fixes/for-linus (8cf0b93919e1 Linux 6.12-rc2)
Merging regulator-fixes/for-linus (8cf0b93919e1 Linux 6.12-rc2)
Merging spi-fixes/for-linus (b5a468199b99 spi: stm32: fix missing device mo=
de capability in stm32mp25)
Merging pci-current/for-linus (1d59d474e1cb PCI: Hold rescan lock while add=
ing devices during host probe)
Merging driver-core.current/driver-core-linus (bd2b7f62a0d5 mailmap: update=
 mail for Fiona Behrens)
Merging tty.current/tty-linus (be847a3a8d4e serial: qcom-geni: rename suspe=
nd functions)
Merging usb.current/usb-linus (faa34159d080 net/9p/usbg: Fix build error)
Merging usb-serial-fixes/usb-linus (9852d85ec9d4 Linux 6.12-rc1)
Merging phy/fixes (1e48fd0574ee phy: usb: disable COMMONONN for dual mode)
Merging staging.current/staging-linus (8cf0b93919e1 Linux 6.12-rc2)
Merging iio-fixes/fixes-togreg (6b8e9dbfaed4 iio: frequency: admv4420: fix =
missing select REMAP_SPI in Kconfig)
Merging counter-current/counter-current (9852d85ec9d4 Linux 6.12-rc1)
Merging char-misc.current/char-misc-linus (2471787c1f0d misc: microchip: pc=
i1xxxx: add support for NVMEM_DEVID_AUTO for OTP device)
Merging soundwire-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging thunderbolt-fixes/fixes (e9e1b20fae7d thunderbolt: Fix KASAN report=
ed stack out-of-bounds read in tb_retimer_scan())
Merging input-current/for-linus (c684771630e6 Input: adp5589-keys - fix adp=
5589_gpio_get_value())
Merging crypto-current/master (e845d2399a00 crypto: marvell/cesa - Disable =
hash algorithms)
Merging vfio-fixes/for-linus (5a88a3f67e37 vfio/pci: Init the count variabl=
e in collecting hot-reset devices)
Merging kselftest-fixes/fixes (4ee5ca9a2938 ftrace/selftest: Test combinati=
on of function_graph tracer and function profiler)
Merging dmaengine-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (bd92c1e07beb mtd: hyperbus: rpc-if: Add missin=
g MODULE_DEVICE_TABLE)
Merging mfd-fixes/for-mfd-fixes (68f860426d50 mfd: axp20x: AXP717: Fix miss=
ing IRQ status registers range)
Merging v4l-dvb-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging reset-fixes/reset/fixes (2cf596636607 reset: starfive: jh71x0: Fix =
accessing the empty member on JH7110 SoC)
Merging mips-fixes/mips-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging at91-fixes/at91-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging omap-fixes/fixes (5062d9c0cbbc ARM: dts: omap3-n900: correct the ac=
celerometer orientation)
Merging kvm-fixes/master (c8d430db8eec Merge tag 'kvmarm-fixes-6.12-1' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvms390-fixes/master (cff59d8631e1 s390/uv: Panic for set and remov=
e shared access UVC errors)
Merging hwmon-fixes/hwmon (2d6c668902e5 hwmon: (max1668) Add missing depend=
ency on REGMAP_I2C)
Merging nvdimm-fixes/libnvdimm-fixes (d5240fa65db0 nvdimm/pmem: Set dax fla=
g for all 'PFN_MAP' cases)
Merging cxl-fixes/fixes (ee1e3c46ed19 EINJ, CXL: Fix CXL device SBDF calcul=
ation)
Merging dma-mapping-fixes/for-linus (75961ffb5cb3 swiotlb: initialise restr=
icted pool list_head when SWIOTLB_DYNAMIC=3Dy)
Merging drivers-x86-fixes/fixes (2fae3129c0c0 platform/x86: x86-android-tab=
lets: Fix use after free on platform_device_register() errors)
Merging samsung-krzk-fixes/fixes (a03c246d4ec8 clk: samsung: Fix out-of-bou=
nd access of of_match_node())
Merging pinctrl-samsung-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging devicetree-fixes/dt/linus (6e0391e48cf9 of: Skip kunit tests when a=
rm64+ACPI doesn't populate root node)
Merging dt-krzk-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging scsi-fixes/fixes (d539a871ae47 scsi: scsi_transport_fc: Allow setti=
ng rport state to current state)
Merging drm-fixes/drm-fixes (ac44ff7cec33 Merge tag 'drm-xe-fixes-2024-10-1=
0' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (4cc2718f621a drm/i915/hdcp: f=
ix connector refcounting)
Merging mmc-fixes/fixes (27e8fe0da3b7 mmc: sdhci-of-dwcmshc: Prevent stale =
command interrupt handling)
Merging rtc-fixes/rtc-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging gnss-fixes/gnss-linus (9852d85ec9d4 Linux 6.12-rc1)
Merging hyperv-fixes/hyperv-fixes (895384881ec9 hv: vmbus: Constify struct =
kobj_type and struct attribute_group)
Merging risc-v-fixes/fixes (cfb10de18538 riscv: Fix kernel stack size when =
KASAN is enabled)
Merging riscv-dt-fixes/riscv-dt-fixes (7d9d88890f04 MAINTAINERS: invert Mis=
c RISC-V SoC Support's pattern)
Merging riscv-soc-fixes/riscv-soc-fixes (61f2e8a3a941 riscv: dts: starfive:=
 jh7110-common: Fix lower rate of CPUfreq by setting PLL0 rate to 1.5GHz)
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (47ac09b91bef Linux 6.11-rc4)
Merging gpio-brgl-fixes/gpio/for-current (a6191a3d1811 gpio: aspeed: Use de=
vm_clk api to manage clock source)
Merging gpio-intel-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging pinctrl-intel-fixes/fixes (37756257093b pinctrl: intel: platform: A=
dd Panther Lake to the list of supported)
Merging auxdisplay-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging kunit-fixes/kunit-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging memblock-fixes/fixes (8043832e2a12 memblock: use numa_valid_node() =
helper to check for invalid node ID)
Merging renesas-fixes/fixes (8c987693dc2d ARM: dts: renesas: rcar-gen2: Add=
 missing #interrupt-cells to DA9063 nodes)
Merging perf-current/perf-tools (e934a35e3cc1 perf cs-etm: Fix the assert()=
 to handle captured and unprocessed cpu trace)
Merging efi-fixes/urgent (ae835a96d72c x86/efistub: Revert to heap allocate=
d boot_params for PE entrypoint)
Merging zstd-fixes/zstd-linus (77618db34645 zstd: Fix array-index-out-of-bo=
unds UBSAN warning)
Merging battery-fixes/fixes (7c626ce4bae1 Linux 6.11-rc3)
Merging iommufd-fixes/for-rc (9852d85ec9d4 Linux 6.12-rc1)
Merging rust-fixes/rust-fixes (8b8ca9c25fe6 cfi: fix conditions for HAVE_CF=
I_ICALL_NORMALIZE_INTEGERS)
Merging w1-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging pmdomain-fixes/fixes (7738568885f2 PM: domains: Fix alloc/free in d=
ev_pm_domain_attach|detach_list())
Merging i2c-host-fixes/i2c/i2c-host-fixes (8cf0b93919e1 Linux 6.12-rc2)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (ad1081a0da27 clk: rockchip: fix finding of max=
imum clock ID)
Merging pwrseq-fixes/pwrseq/for-current (a85bbe01a320 power: sequencing: ma=
ke the QCom PMU pwrseq driver depend on CONFIG_OF)
Merging thead-dt-fixes/thead-dt-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging drm-misc-fixes/for-linux-next-fixes (c5e8e93897b7 accel/qaic: Fix t=
he for loop used to walk SG table)
Merging mm-stable/mm-stable (8cf0b93919e1 Linux 6.12-rc2)
Merging mm-nonmm-stable/mm-nonmm-stable (8cf0b93919e1 Linux 6.12-rc2)
Merging mm/mm-everything (174046d42134 foo)
Merging kbuild/for-next (f8746e3712be kconfig: remove zconfprint())
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (c7c1bb78f3ee perf tools: Remove unused color_=
fwrite_lines)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/for-next (bfc4a245a794 dma-mapping: fix DMA API tracing=
 for chained scatterlists)
Merging asm-generic/master (f822712a2c69 UAPI/ioctl: Improve parameter name=
 of ioctl request definition helpers)
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (9016915e3c5f Merge branches 'amba', 'fixes' and 'misc=
' into for-next)
Merging arm64/for-next/core (bb9ae1a66c85 kselftest/arm64: Enable GCS for t=
he FP stress tests)
Merging arm-perf/for-next/perf (7c626ce4bae1 Linux 6.11-rc3)
Merging arm-soc/for-next (b72cd67a0300 Merge tag 'arm-soc/for-6.12/devicetr=
ee-fixes' of https://github.com/Broadcom/stblinux into arm/fixes)
Merging amlogic/for-next (58e2d28ed28e Merge branch 'v6.13/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (ffc253263a13 Linux 6.6)
Merging aspeed/for-next (b4c322c2783a ARM: dts: aspeed: catalina: Update io=
 expander line names)
Merging at91/at91-next (9852d85ec9d4 Linux 6.12-rc1)
Merging broadcom/next (f8078d7ae62b Merge branch 'soc/next' into next)
Merging davinci/davinci/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging drivers-memory/for-next (89e6684538f5 dt-bindings: memory-controlle=
rs: fsl,ifc: split child node differences)
Merging imx-mxs/for-next (995b96e17150 Merge branch 'imx/dt64' into for-nex=
t)
Merging mediatek/for-next (0246ff57b1ea Merge branches 'v6.12-next/soc', 'v=
6.12-next/dts32' and 'v6.12-next/dts64' into for-next)
Merging mvebu/for-next (841dd5b122b4 arm64: dts: marvell: cn9130-sr-som: fi=
x cp0 mdio pin numbers)
Merging omap/for-next (f45840d172a0 Merge branch 'omap-for-v6.13/drivers' i=
nto tmp/omap-next-20241004.145243)
Merging qcom/for-next (cea73ac3d218 Merge branches 'arm32-for-6.13', 'arm64=
-fixes-for-6.12', 'arm64-for-6.13', 'clk-for-6.13', 'drivers-fixes-for-6.12=
' and 'drivers-for-6.13' into for-next)
Merging renesas/next (8e1066071250 Merge branch 'renesas-dts-for-v6.13' int=
o renesas-next)
Merging reset/reset/next (c0260e2b0ed8 reset: uniphier-glue: Use devm_reset=
_control_bulk_get_shared_deasserted())
Merging rockchip/for-next (45f5ca26a241 Merge branch 'v6.13-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (c1461d6ef750 Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (62fa69e6f8cc Merge branches 'for-next/ffa/fixe=
s', 'for-next/scmi/fixes' and 'for-next/scmi/updates' of ssh://gitolite.ker=
nel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-linux-next)
Merging sophgo/for-next (30003e3f802e riscv: dts: sophgo: cv1812h: add pinc=
trl support)
Merging stm32/stm32-next (b14c9f6bd0ba ARM: dts: stm32: Use SAI to generate=
 bit and frame clock on STM32MP15xx DHCOM PDK2)
Merging sunxi/sunxi/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging tee/next (cd88a296582c Merge branch 'optee_notif_wait_timeout_for_v=
6.11' into next)
Merging tegra/for-next (6726d2c6a157 Merge branch for-6.12/arm64/defconfig =
into for-next)
Merging thead-dt/thead-dt-for-next (ddc5ab7259a5 riscv: dtb: thead: Add Bea=
gleV Ahead LEDs)
Merging ti/ti-next (9852d85ec9d4 Linux 6.12-rc1)
Merging xilinx/for-next (0e355cb69e19 Merge branch 'zynq/soc' into for-next)
Merging clk/clk-next (206cf5697410 Merge branch 'clk-xilinx' into clk-next)
Merging clk-imx/for-next (32c055ef563c clk: imx6ul: fix clock parent for IM=
X6UL_CLK_ENETx_REF_SEL)
Merging clk-renesas/renesas-clk (44d13e198cbf clk: renesas: r9a09g057: Add =
clock and reset entries for ICU)
Merging csky/linux-next (2c40c1c6adab Merge tag 'usb-6.7-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging loongarch/loongarch-next (f339bd3b51da Docs/LoongArch: Add advanced=
 extended IRQ model description)
Merging m68k/for-next (b90fae5df917 m68k: defconfig: Update defconfigs for =
v6.11-rc1)
Merging m68knommu/for-next (8e929cb546ee Linux 6.12-rc3)
Merging microblaze/next (badf752b5e4b microblaze: Export xmb_manager functi=
ons)
Merging mips/mips-next (9852d85ec9d4 Linux 6.12-rc1)
Merging openrisc/for-next (4dc70e1aadfa openrisc: Move FPU state out of pt_=
regs)
Merging parisc-hd/for-next (98f7e32f20d2 Linux 6.11)
Merging powerpc/next (8cf0b93919e1 Linux 6.12-rc2)
Merging risc-v/for-next (1540def11f0c Merge patch series "riscv: Per-thread=
 envcfg CSR support")
Merging riscv-dt/riscv-dt-for-next (8400291e289e Linux 6.11-rc1)
Merging riscv-soc/riscv-soc-for-next (8400291e289e Linux 6.11-rc1)
Merging s390/for-next (7c974a82bc45 Merge branch 'features' into for-next)
Merging sh/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging sparc/for-next (d21dffe51baa arch/sparc: remove unused varible padd=
rbase in function leon_swprobe())
Merging uml/next (41ab5fe7471f um: Switch to 4 level page tables on 64 bit)
Merging xtensa/xtensa-for-next (b7cf2a1d9881 xtensa: remove redundant flush=
_dcache_page and ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE macros)
Merging fs-next (22f759c4f94c Merge branch 'vfs.all' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/vfs/vfs.git)
Merging printk/for-next (ebdf88c2479b Merge branch 'for-6.13' into for-next)
Merging pci/next (afb15ca28055 Merge branch 'pci/misc')
Merging pstore/for-next/pstore (1bf8012fc699 pstore: replace spinlock_t by =
raw_spinlock_t)
Merging hid/for-next (af27f2c22f5e Merge branch 'for-6.13/intel-ish' into f=
or-next)
Merging i2c/i2c/for-next (3b2af08fadc4 i2c: core: Remove extra space in Mak=
efile)
Merging i2c-host/i2c/i2c-host (c2d449ce0fbd i2c: designware: Add a new ACPI=
 HID for HJMC01 I2C controller)
Merging i3c/i3c/next (9852d85ec9d4 Linux 6.12-rc1)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (031e6b6f3df1 hwmon: (nzxt-kraken2) Simpli=
fy specifying static visibility attribute)
Merging jc_docs/docs-next (6d41cc46619c Documentation/tracing: Mention that=
 RESET_ATTACK_MITIGATION can clear memory)
  6330e80ef1a2 ("Documentation/process: maintainer-soc: clarify submitting =
patches")
Merging v4l-dvb/next (67cefecf2a03 mailmap: add entries for Hans Verkuil)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (54ad5ae82ff8 Merge branch 'pm-cpufreq' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (41baf662a0c2 cpufreq: ti-cpufre=
q: Remove revision offsets in AM62 family)
Merging cpupower/cpupower (b6a2dbf88aa7 pm: cpupower: bindings: Add test to=
 confirm cpu state is disabled)
Merging devfreq/devfreq-next (d47552124bb0 PM / devfreq: imx-bus: Use of_pr=
operty_present())
Merging pmdomain/next (d6caca30a548 OPP: Drop redundant *_opp_attach|detach=
_genpd())
Merging opp/opp/linux-next (53205a790366 dt-bindings: opp: operating-points=
-v2-ti-cpu: Describe opp-supported-hw)
Merging thermal/thermal/linux-next (7d8abc5f3b5c thermal/drivers/imx_sc_the=
rmal: Use dev_err_probe)
Merging rdma/for-next (615b94746a54 RDMA/hns: Disassociate mmap pages for a=
ll uctx when HW is being reset)
Merging net-next/main (6aac56631831 Merge branch 'ethtool-write-firmware')
Merging bpf-next/for-next (50283bd23a2f Merge branch 'bpf-next/net' into fo=
r-next)
Merging ipsec-next/master (36efaca9cb28 net: phy: microchip_t1: SQI support=
 for LAN887x)
Merging mlx5-next/mlx5-next (8cf0b93919e1 Linux 6.12-rc2)
Merging netfilter-next/main (cb3d289366b0 netfilter: Make legacy configs us=
er selectable)
Merging ipvs-next/main (f66ebf37d69c Merge git://git.kernel.org/pub/scm/lin=
ux/kernel/git/netdev/net)
Merging bluetooth/master (fdc32fdd5952 Bluetooth: btintel_pcie: Add recover=
y mechanism)
Merging wireless-next/for-next (a0efa2f362a6 Merge net-next/main to resolve=
 conflicts)
CONFLICT (content): Merge conflict in Documentation/networking/net_cachelin=
es/net_device.rst
Merging ath-next/for-next (e805272f8c2d wifi: ath12k: ath12k_mac_op_sta_sta=
te(): clean up update_wk cancellation)
Merging wpan-next/master (ac49b950bea9 dt-bindings: net: add Microchip's LA=
N865X 10BASE-T1S MACPHY)
Merging wpan-staging/staging (ac49b950bea9 dt-bindings: net: add Microchip'=
s LAN865X 10BASE-T1S MACPHY)
Merging mtd/mtd/next (869acb874f2b Merge tag 'nand/for-6.12' into mtd/next)
Merging nand/nand/next (475aadeba5df mtd: spinand: macronix: Flag parts nee=
ding explicit plane select)
Merging spi-nor/spi-nor/next (afe1ea1344bb mtd: spi-nor: add support for Ma=
cronix Octal flash)
Merging crypto/master (5c20772738e1 crypto: doc - Fix akcipher title refere=
nce)
Merging drm/drm-next (26bb2dc10278 Merge tag 'drm-xe-next-2024-10-10' of ht=
tps://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/tegra/gr3d.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_ct.c
Merging drm-exynos/for-linux-next (5b272bf7dcf9 Merge tag 'drm-xe-fixes-202=
4-10-03' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes)
Merging drm-misc/for-linux-next (b8128f7815ff accel/qaic: Add AIC080 suppor=
t)
Merging amdgpu/drm-next (01b64bc063d0 drm/radeon: always set GEM function p=
ointer)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dc_typ=
es.h
Merging drm-intel/for-linux-next (171596bfc36c drm/i915/xe3lpd: Add new dis=
play power wells)
Merging drm-msm/msm-next (a20a91fb1bfa Documentation: document adreno preem=
ption)
Merging drm-msm-lumag/msm-next-lumag (15302579373e drm/msm/dpu: enable writ=
eback on SM6350)
Merging drm-xe/drm-xe-next (735be7acc52f drm/xe/query: Tidy up error EFAULT=
 returns)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/display/xe_display=
.c
Applying: fix up for "drm/xe: Wire up device shutdown handler"
Merging etnaviv/etnaviv/next (704d3d60fec4 drm/etnaviv: don't block schedul=
er when GPU is still active)
Merging fbdev/for-next (8cf0b93919e1 Linux 6.12-rc2)
Merging regmap/for-next (c2288599691c regmap: Merge up v6.12-rc2)
Merging sound/for-next (0ddf2784d6c2 ALSA: hda: Fix build error without CON=
FIG_SND_DEBUG)
Merging ieee1394/for-next (8f04019d71cb firewire: Correct some typos)
Merging sound-asoc/for-next (f646b12ad4a0 Merge remote-tracking branch 'aso=
c/for-6.13' into asoc-next)
Merging modules/modules-next (b319cea80539 module: Refine kmemleak scanned =
areas)
Merging input/next (515ef92b4939 Input: correct typos in multiple comments =
across misc drivers)
Merging block/for-next (09259c492b02 Merge branch 'for-6.13/block' into for=
-next)
Merging device-mapper/for-next (579b2ba40ece dm verity: fallback to platfor=
m keyring also if key in trusted keyring is rejected)
Merging libata/for-next (06e314c0ab47 Merge remote-tracking branch 'libata/=
for-6.13' into for-next)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (f46fcfd09473 mmc: Merge branch fixes into next)
Applying: fix up for "mmc: core: Adjust ACMD22 to SDUC"
Merging mfd/for-mfd-next (bc37b44978d3 mfd: intel_soc_pmic_bxtwc: Fix IRQ d=
omain names duplication)
$ git reset --hard HEAD^
Merging next-20241010 version of mfd
Merging backlight/for-backlight-next (5461f3fd74a8 backlight: Remove notifi=
er)
Merging battery/for-next (e50a57d16f89 power: supply: hwmon: Fix missing te=
mp1_max_alarm attribute)
Merging regulator/for-next (e1037106b691 Add Samsung s2dos05 pmic support)
Merging security/next (904059fc295f Automated merge of 'dev' into 'next')
CONFLICT (content): Merge conflict in kernel/auditsc.c
Merging apparmor/apparmor-next (8400291e289e Linux 6.11-rc1)
Merging integrity/next-integrity (08ae3e5f5fc8 integrity: Use static_assert=
() to check struct sizes)
Merging selinux/next (d7b6918e22c7 selinux: Deprecate /sys/fs/selinux/user)
Merging smack/next (2749749afa07 smackfs: Use rcu_assign_pointer() to ensur=
e safe assignment in smk_set_cipso)
Merging tomoyo/master (ada1986d0797 tomoyo: fallback to realpath if symlink=
's pathname does not exist)
Merging tpmdd/next (558bdc45dfb2 sign-file,extract-cert: use pkcs11 provide=
r for OPENSSL MAJOR >=3D 3)
Merging watchdog/master (9852d85ec9d4 Linux 6.12-rc1)
Merging iommu/next (97162f6093d2 Merge branches 'fixes', 'arm/smmu', 'intel=
/vt-d', 'amd/amd-vi' and 'core' into next)
Merging audit/next (2132b355267f audit: Reorganize kerneldoc parameter name=
s)
Merging devicetree/for-next (1d31c6fc86c0 dt-bindings: writing-schema: Add =
details on YAML text blocks)
Merging dt-krzk/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging mailbox/for-next (54595f2807d2 mailbox, remoteproc: omap2+: fix com=
pile testing)
Merging spi/for-next (f2213b1e5942 Merge remote-tracking branch 'spi/for-6.=
13' into spi-next)
Merging tip/master (b89c62b65ebd Merge branch into tip/master: 'x86/misc')
CONFLICT (content): Merge conflict in fs/bcachefs/fs.c
Applying: fix up for "clocksource: Remove unused clocksource_change_rating"
Merging clockevents/timers/drivers/next (d7a87891e2f5 platform/x86:intel/pm=
c: fix build regression with pmtimer turned off)
Merging edac/edac-for-next (61124f42dcaa Merge ras/edac-drivers into for-ne=
xt)
Merging ftrace/for-next (bc81cc8ea68b Merge ftrace/for-next)
Merging rcu/next (355debb83bf7 Merge branches 'context_tracking.15.08.24a',=
 'csd.lock.15.08.24a', 'nocb.09.09.24a', 'rcutorture.14.08.24a', 'rcustall.=
09.09.24a', 'srcu.12.08.24a', 'rcu.tasks.14.08.24a', 'rcu_scaling_tests.15.=
08.24a', 'fixes.12.08.24a' and 'misc.11.08.24a' into next.09.09.24a)
Merging paulmck/non-rcu/next (c87bf8b02737 Merge branches 'cmpxchg.2024.10.=
11a', 'csd-lock.2024.10.11a' and 'lkmm.2024.10.11a' into HEAD)
Merging kvm/next (c8d430db8eec Merge tag 'kvmarm-fixes-6.12-1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvm-arm/next (17a000564499 Merge branch kvm-arm64/visibility-cleanu=
ps into kvmarm-master/next)
Merging kvms390/next (f9b56b2c31e5 s390: Enable KVM_S390_UCONTROL config in=
 debug_defconfig)
Merging kvm-ppc/topic/ppc-kvm (8cf0b93919e1 Linux 6.12-rc2)
Merging kvm-riscv/riscv_kvm_next (5aa09297a3dc RISC-V: KVM: Fix to allow hp=
mcounter31 from the guest)
Merging kvm-x86/next (8cf0b93919e1 Linux 6.12-rc2)
Merging xen-tip/linux-next (bf56c410162d x86/xen: mark boot CPU of PV guest=
 in MSR_IA32_APICBASE)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (581434654e01 workqueue: Adjust WQ_MAX_ACTIVE f=
rom 512 to 2048)
Merging sched-ext/for-next (750832ae55fa Merge branch 'for-6.12-fixes' into=
 for-next)
Merging drivers-x86/for-next (8150408bfdb2 asus-laptop: prefer strscpy() ov=
er strcpy())
Merging chrome-platform/for-next (9c41f371457b platform/chrome: cros_ec_typ=
ec: fix missing fwnode reference decrement)
Merging chrome-platform-firmware/for-firmware-next (67f488dff17e firmware: =
coreboot: Don't register a pdev if screen_info data is present)
Merging hsi/for-next (c3eddf5e8c30 HSI: omap-ssi: Remove unnecessary debugf=
s_create_dir() error check)
Merging leds-lj/for-leds-next (0791e9106c22 leds: Switch back to struct pla=
tform_driver::remove())
Merging ipmi/for-next (2378bd0b264a ipmi: ipmb: Add check devm_kasprintf() =
returned value)
Merging driver-core/driver-core-next (9852d85ec9d4 Linux 6.12-rc1)
Merging usb/usb-next (4a9fe2a8ac53 dt-bindings: usb: dwc3-imx8mp: add compa=
tible string for imx95)
Merging thunderbolt/next (8cf0b93919e1 Linux 6.12-rc2)
Merging usb-serial/usb-next (9852d85ec9d4 Linux 6.12-rc1)
Merging tty/tty-next (f5927d832bb8 serial: 8250_exar: Remove old exar_ee_re=
ad() and other unneeded code)
Merging char-misc/char-misc-next (f893691e7426 rust: miscdevice: add base m=
iscdevice abstraction)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (988d40a4d4e7 coresight: Make trace ID map spinlock =
local to the map)
Merging fastrpc/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging fpga/for-next (8de36789bd03 fpga: zynq-fpga: Rename 'timeout' varia=
ble as 'time_left')
Merging icc/icc-next (a5733950fe35 Merge branch 'icc-sm8350' into icc-next)
Merging iio/togreg (8fa714ca334e iio: Convert unsigned to unsigned int)
Merging phy-next/next (11dad94b5026 phy: sun4i-usb: Fix a typo)
Merging soundwire/next (830f1aa53c02 soundwire: cadence: clear MCP BLOCK_WA=
KEUP in init)
Merging extcon/extcon-next (9852d85ec9d4 Linux 6.12-rc1)
Merging gnss/gnss-next (9852d85ec9d4 Linux 6.12-rc1)
Merging vfio/next (aab439ffa1ca vfio/pci: clean up a type in vfio_pci_ioctl=
_pci_hot_reset_groups())
Merging w1/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging spmi/spmi-next (917572b9aff1 dt-bindings: spmi: spmi-mtk-pmif: Add =
compatible for MT8188)
Merging staging/staging-next (728b72f4d40e staging: vchiq_core: Indent stat=
ic_assert on single line)
$ git reset --hard HEAD^
Merging next-20241011 version of staging
Merging counter-next/counter-next (a3911e087d62 counter: ftm-quaddec: Enabl=
e module autoloading)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (5be63fc19fca Linux 6.11-rc5)
Merging dmaengine/next (9852d85ec9d4 Linux 6.12-rc1)
Merging cgroup/for-next (e53dd32b55e4 Merge branch 'for-6.13' into for-next)
Merging scsi/for-next (d539a871ae47 scsi: scsi_transport_fc: Allow setting =
rport state to current state)
Merging scsi-mkp/for-next (94c4c5d78b0f scsi: ufs: ufs-qcom: Add fixup_dev_=
quirks vops)
Merging vhost/linux-next (221af82f606d vhost/scsi: null-ptr-dereference in =
vhost_scsi_get_req())
Merging rpmsg/for-next (8a8622b7c206 remoteproc: Use iommu_paging_domain_al=
loc())
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (ea7f2dfd13e0 Merge tag 'ib-mfd-gpio-i2c-wa=
tchdog-v6.13' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd=
 into gpio/for-next)
Merging gpio-intel/for-next (12b0e305f509 gpio: acpi: switch to device_for_=
each_child_node_scoped())
Merging pinctrl/for-next (6dbd1577b7dc Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (37756257093b pinctrl: intel: platform: Add =
Panther Lake to the list of supported)
Merging pinctrl-renesas/renesas-pinctrl (6f1c758cb2ee pinctrl: renesas: rzg=
2l: Add support for configuring schmitt-trigger)
Merging pinctrl-samsung/for-next (eed2e79221e2 pinctrl: samsung: Add exynos=
8895 SoC pinctrl configuration)
Merging pwm/pwm/for-next (74fed3d16280 pwm: axi-pwmgen: Enable FORCE_ALIGN =
by default)
Merging ktest/for-next (2351e8c65404 ktest.pl: Avoid false positives with g=
rub2 skip regex)
Merging kselftest/next (edd435390c55 docs: dev-tools: Add documentation for=
 the device focused kselftests)
Merging kunit/test (9852d85ec9d4 Linux 6.12-rc1)
Merging kunit-next/kunit (9852d85ec9d4 Linux 6.12-rc1)
Merging livepatching/for-next (9fbf78b6d6ce Merge branch 'for-6.12/trivial'=
 into for-next)
Merging rtc/rtc-next (0fb155d499f8 dt-bindings: rtc: mpfs-rtc: Properly nam=
e file)
Merging nvdimm/libnvdimm-for-next (447b167bb60d nvdimm: Remove dead code fo=
r ENODEV checking in scan_labels())
Merging at24/at24/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging ntb/ntb-next (c620f56c70eb MAINTAINERS: Update AMD NTB maintainers)
Merging seccomp/for-next/seccomp (de9c2c66ad8e Linux 6.11-rc2)
Merging fsi/next (c5eeb63edac9 fsi: Fix panic on scom file read)
Merging slimbus/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging nvmem/for-next (3e93f43ae64b nvmem: Correct some typos in comments)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (94e86b174d10 tools/hv: Add memory allocation ch=
eck in hv_fcopy_start)
Merging auxdisplay/for-next (0b028ff7e70e auxdisplay: Remove unused functio=
ns)
Merging kgdb/kgdb/for-next (9bccbe7b2087 kdb: Get rid of redundant kdb_curr=
_task())
Merging hmm/hmm (8cf0b93919e1 Linux 6.12-rc2)
Merging cfi/cfi/next (9852d85ec9d4 Linux 6.12-rc1)
Merging mhi/mhi-next (6d61859bbe76 bus: mhi: host: pci_generic: Use pcim_io=
map_region() to request and map MHI BAR)
Merging memblock/for-next (cb088e38aab4 s390/mm: get estimated free pages b=
y memblock api)
Merging cxl/next (2c70677dabb5 cxl: Add documentation to explain the shared=
 link bandwidth calculation)
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (04736f7d1945 efi: Remove redundant null pointer checks in=
 efi_debugfs_init())
Merging unicode/for-next (66715f005bde unicode: change the reference of dat=
abase file)
Merging slab/slab/for-next (2976584dd1bc Merge branch 'slab/for-6.13/featur=
es' into slab/for-next)
Merging random/master (d18c13697b4d prandom: Include <linux/percpu.h> in <l=
inux/prandom.h>)
Applying: fix up for "random: Do not include <linux/prandom.h> in <linux/ra=
ndom.h>"
Merging landlock/next (7cc2f07b4cab landlock: Improve documentation of prev=
ious limitations)
Merging rust/rust-next (f807649e32be MAINTAINERS: add entry for the Rust `a=
lloc` module)
CONFLICT (content): Merge conflict in rust/kernel/types.rs
Merging sysctl/sysctl-next (5cc3199ed06c const_structs.checkpatch: add ctl_=
table)
Merging execve/for-next/execve (44f65d900698 binfmt_elf: mseal address zero)
Merging bitmap/bitmap-for-next (d7bcc37436c7 lib/test_bits.c: Add tests for=
 GENMASK_U128())
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (c00ac1f9fd7b Merge branches 'for-linus/hardenin=
g' and 'for-next/hardening' into for-next/kspp)
Merging kspp-gustavo/for-next/kspp (6613476e225e Linux 6.8-rc1)
Merging nolibc/nolibc (9852d85ec9d4 Linux 6.12-rc1)
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (e2d8fe9148b7 Documentation: userspace-api: iommuf=
d: Update HWPT_PAGING and HWPT_NESTED)
Merging turbostat/next (a119348cb685 tools/power turbostat: Honor --show CP=
U, even when even when num_cpus=3D1)
Merging pwrseq/pwrseq/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging capabilities-next/caps-next (de2433c608c2 capabilities: remove cap_=
mmap_file())
Merging ipe/next (b51a254cebc9 ipe: fallback to platform keyring also if ke=
y in trusted keyring is rejected)
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)

--Sig_/R_XfLeCFXxp2m7WoU/PCzWu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcM24cACgkQAVBC80lX
0Gyc5wgAlF1BA/68vHxTWRF7REqEKbnBEFJ2DG12Op1KGmuoaPfBpBUtkPu17qhz
IIxyLCm4KZaNqfAtjiU+ApmcMLgkCb7hEoet0GHBlhg0vmomdvmG6LNbLxYM4O7C
Mo53uyNG8brHOxJtxQ2m11JXZQJCTRSXK9sa0ZsqoNaKRdAcCcvRxGKFuDFIySs5
9o7zGe4hf4X1avFP69LhfSmeVX1vCcn23Mapj6JTU+/GX4CDGmzWwyeC7xjuedWS
LrdSsbTIVMPYvICopC1wAiR5u29onnvNFtJQ5uX6DLIriv6Y7enQyl3HGcOKk/Xv
H4GzLbGpNF25djpi8rJ5TE/SFfv4EA==
=sxBj
-----END PGP SIGNATURE-----

--Sig_/R_XfLeCFXxp2m7WoU/PCzWu--

