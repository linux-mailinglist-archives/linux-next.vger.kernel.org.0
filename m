Return-Path: <linux-next+bounces-4239-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 059C5999D53
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 09:00:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63DA328677B
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 07:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 339A0194C6F;
	Fri, 11 Oct 2024 07:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NnTgq6Ir"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F287635;
	Fri, 11 Oct 2024 07:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728630053; cv=none; b=rsi9nK9mrdqRFlPiNZcS+V9/Ig2rrfcKkqlYRUAFadhtCxOt5ybbK5fiUIvf133cTV53/pcWuPTsEKqhTbMW3BbrRHuqr5TE9DZLyX1DqP0VnlGlPYFn5Ey7ASLG8Un0Fq7yn0bNKLMWC8XmarkLMpNLTdpoVRItWNjsnxz6I2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728630053; c=relaxed/simple;
	bh=LU8T7WAm+hPfCJHwWbGHUKaOcN+O6bFZHWA7iqtvmys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=a9hNHHDtqneyNSHPBm+XaxYY+DoSS+6rkiXTasw18nhbOcppXIhSxa+fW1U0JtHSqRawvUjKEZxB3CLRp4xD7/evhpDS05lV71kK8XSZagbLUtjqnMH75zZ7hXvjhqtImSQXJmo2k1SdJQXAYwnTrY8wlUjo/mFtVwrcBUZVLPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NnTgq6Ir; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728630045;
	bh=tEmKyBlSrtKkPDdYnHiv35Z2kVjxj+nLjK8b79TiVOM=;
	h=Date:From:To:Cc:Subject:From;
	b=NnTgq6IrhM+2a5mT06PUo0UxE1tcNDmeCSHMoqjld78PwKtjBFPKnHZ1aG81vTaOr
	 uEcaqWUOLi4Xi+Utuwy0xQXLcvp6/be+kaW7zKAQ+niX8cg6L2ZemC0bd7nQ6ElH0t
	 +LpfjEKvfUYuA8xRqsc0tbEs/HWbODcogxTpifQbGvxEyc+b3sRzX7Q5+5fAuOoEqr
	 9ezfc6TC5uH976yT53EKojq29Z2Z4hjEMqkzwViLxgrwZqCXMDlQoamQxL7GavnHCk
	 rB2DcCicR8h7NNYeGsC6Tbi4jPI0eH2rPj08HeC9MuWsezmcVo+aOkfN6TpBzqtcft
	 Fje0srTZh+EYg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XPyFS6qM4z4xKl;
	Fri, 11 Oct 2024 18:00:44 +1100 (AEDT)
Date: Fri, 11 Oct 2024 18:00:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 11
Message-ID: <20241011180045.53d7d684@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6R63O9LCZy+yf6rUD=lkpYG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6R63O9LCZy+yf6rUD=lkpYG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20241010:

The perf tree gained a build failure so I used the version from
next-20241010.

The wireless-next tree gained a conflict against the net-next tree.

The sound tree gained a build failure so I used the version from
next-20241010.

The mfd tree gained a build failure so I used the version from
next-20241010.

The tip tree gained a build failure for which I applied a patch.

The ftrace tree still had its build failure so I used the version from
next-20241009.

The iio tree gained semantic conflicts against Linus' tree.

Non-merge commits (relative to Linus' tree): 3414
 4706 files changed, 125842 insertions(+), 81611 deletions(-)

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
Merging origin/master (1d227fcc7222 Merge tag 'net-6.12-rc3' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging fixes/fixes (87d6aab2389e Merge tag 'for_linus' of git://git.kernel=
.org/pub/scm/linux/kernel/git/mst/vhost)
Merging vfs-brauner-fixes/vfs.fixes (f92f0a1b0569 openat2: explicitly retur=
n -E2BIG for (usize > PAGE_SIZE))
Merging fscrypt-current/for-current (256abd8e550c Linux 6.10-rc7)
Merging fsverity-current/for-current (256abd8e550c Linux 6.10-rc7)
Merging btrfs-fixes/next-fixes (6defc69844d3 Merge branch 'misc-6.12' into =
next-fixes)
Merging vfs-fixes/fixes (678379e1d4f7 close_range(): fix the logics in desc=
riptor table trimming)
Merging erofs-fixes/fixes (56bd565ea591 erofs: get rid of kaddr in `struct =
z_erofs_maprecorder`)
Merging nfsd-fixes/nfsd-fixes (c88c150a467f nfsd: fix possible badness in F=
REE_STATEID)
Merging v9fs-fixes/fixes/next (684a64bf32b6 Merge tag 'nfs-for-6.12-1' of g=
it://git.linux-nfs.org/projects/anna/linux-nfs)
Merging overlayfs-fixes/ovl-fixes (77a28aa47687 ovl: relax WARN_ON in ovl_v=
erify_area())
Merging bcachefs/for-next (b49ac4a2df9a bcachefs: fix incorrect show_option=
s results)
Merging fscrypt/for-next (256abd8e550c Linux 6.10-rc7)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (a6f63ff0d702 Merge branch 'for-next-next-v6.12-2024=
1009' into for-next-20241009)
Merging ceph/master (ccda9910d849 ceph: fix cap ref leak via netfs init_req=
uest)
Merging cifs/for-next (e25f5175ef11 smb: client: stop flooding dmesg with a=
utomounts)
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
Merging f2fs/dev (bdab38b79199 f2fs: allow parallel DIO reads)
Merging fsverity/for-next (256abd8e550c Linux 6.10-rc7)
Merging fuse/for-next (639ee6854c0f virtiofs: use GFP_NOFS when enqueuing r=
equest through kworker)
Merging gfs2/for-next (7e4a0a50b403 KMSAN: uninit-value in inode_go_dump (5=
))
Merging jfs/jfs-next (2b59ffad47db jfs: Fix uninit-value access of new_ea i=
n ea_buffer)
Merging ksmbd/ksmbd-for-next (77804ec24525 ksmbd: add support for supplemen=
tary groups)
Merging nfs/linux-next (67784a74e258 Merge tag 'ata-6.11-rc7' of git://git.=
kernel.org/pub/scm/linux/kernel/git/libata/linux)
Merging nfs-anna/linux-next (7ef60108069b NFS: remove revoked delegation fr=
om server's delegation list)
Merging nfsd/nfsd-next (144cb1225cd8 xdrgen: Add a utility for extracting X=
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
Merging mm-hotfixes/mm-hotfixes-unstable (fddc64a29e94 mm: remove unused st=
ub for can_swapin_thp())
Merging fs-current (a28aa23205e7 Merge branch 'fixes' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/xiang/erofs.git)
Merging kbuild-current/fixes (8cf0b93919e1 Linux 6.12-rc2)
Merging arc-current/for-curr (8bf275d61925 arc: rename aux.h to arc_aux.h)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (13f8f1e05f1d arm64: probes: Fix uprobes=
 for big-endian kernels)
Merging arm-soc-fixes/arm/fixes (0e7af99aef5f Merge tag 'riscv-soc-fixes-fo=
r-v6.11-final' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/lin=
ux into arm/fixes)
Merging davinci-current/davinci/for-current (9852d85ec9d4 Linux 6.12-rc1)
Merging drivers-memory-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging sophgo-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging m68k-current/for-linus (b90fae5df917 m68k: defconfig: Update defcon=
figs for v6.11-rc1)
Merging powerpc-fixes/fixes (4b058c9f281f powerpc/vdso: allow r30 in vDSO c=
ode generation of getrandom)
Merging s390-fixes/fixes (cad4b3d4ab1f KVM: s390: Change virtual to physica=
l address access in diag 0x258 handler)
Merging net/main (1d227fcc7222 Merge tag 'net-6.12-rc3' of git://git.kernel=
.org/pub/scm/linux/kernel/git/netdev/net)
Merging bpf/master (3f2ac59c0d7b Merge branch 'fix-caching-of-btf-for-kfunc=
s-in-the-verifier')
Merging ipsec/master (3f0ab59e6537 xfrm: validate new SA's prefixlen using =
SA family when sel.family is unset)
Merging netfilter/main (c6a0862bee69 selftests: netfilter: conntrack_vrf.sh=
: add fib test case)
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
Merging sound-current/for-linus (ad6639f143a0 sound: Make CONFIG_SND depend=
 on INDIRECT_IOMEM instead of UML)
Merging sound-asoc-fixes/for-linus (9eb2142a2ae8 ASoC: topology: Bump minim=
al topology ABI version)
Merging regmap-fixes/for-linus (8cf0b93919e1 Linux 6.12-rc2)
Merging regulator-fixes/for-linus (8cf0b93919e1 Linux 6.12-rc2)
Merging spi-fixes/for-linus (b5a468199b99 spi: stm32: fix missing device mo=
de capability in stm32mp25)
Merging pci-current/for-linus (9852d85ec9d4 Linux 6.12-rc1)
Merging driver-core.current/driver-core-linus (bd2b7f62a0d5 mailmap: update=
 mail for Fiona Behrens)
Merging tty.current/tty-linus (8cf0b93919e1 Linux 6.12-rc2)
Merging usb.current/usb-linus (faa34159d080 net/9p/usbg: Fix build error)
Merging usb-serial-fixes/usb-linus (9852d85ec9d4 Linux 6.12-rc1)
Merging phy/fixes (2d0f973b5f1c phy: cadence: Sierra: Fix offset of DEQ ope=
n eye algorithm control register)
Merging staging.current/staging-linus (8cf0b93919e1 Linux 6.12-rc2)
Merging iio-fixes/fixes-togreg (6b8e9dbfaed4 iio: frequency: admv4420: fix =
missing select REMAP_SPI in Kconfig)
Merging counter-current/counter-current (9852d85ec9d4 Linux 6.12-rc1)
Merging char-misc.current/char-misc-linus (8cf0b93919e1 Linux 6.12-rc2)
Merging soundwire-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging thunderbolt-fixes/fixes (8cf0b93919e1 Linux 6.12-rc2)
Merging input-current/for-linus (c684771630e6 Input: adp5589-keys - fix adp=
5589_gpio_get_value())
Merging crypto-current/master (e845d2399a00 crypto: marvell/cesa - Disable =
hash algorithms)
Merging vfio-fixes/for-linus (5a88a3f67e37 vfio/pci: Init the count variabl=
e in collecting hot-reset devices)
Merging kselftest-fixes/fixes (e26e42b5679e ftrace/selftest: Test combinati=
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
Merging at91-fixes/at91-fixes (e9408fa234fb MAINTAINERS: Update DTS path fo=
r ARM/Microchip (AT91) SoC)
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
Merging drm-fixes/drm-fixes (fc4d26272170 Merge tag 'amd-drm-fixes-6.12-202=
4-10-08' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (4cc2718f621a drm/i915/hdcp: f=
ix connector refcounting)
Merging mmc-fixes/fixes (27e8fe0da3b7 mmc: sdhci-of-dwcmshc: Prevent stale =
command interrupt handling)
Merging rtc-fixes/rtc-fixes (8400291e289e Linux 6.11-rc1)
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
Merging rust-fixes/rust-fixes (ab8851431bef lib/Kconfig.debug: fix grammar =
in RUST_BUILD_ASSERT_ALLOW)
Merging w1-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging pmdomain-fixes/fixes (7738568885f2 PM: domains: Fix alloc/free in d=
ev_pm_domain_attach|detach_list())
Merging i2c-host-fixes/i2c/i2c-host-fixes (8cf0b93919e1 Linux 6.12-rc2)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (ad1081a0da27 clk: rockchip: fix finding of max=
imum clock ID)
Merging pwrseq-fixes/pwrseq/for-current (a85bbe01a320 power: sequencing: ma=
ke the QCom PMU pwrseq driver depend on CONFIG_OF)
Merging thead-dt-fixes/thead-dt-fixes (8400291e289e Linux 6.11-rc1)
Merging drm-misc-fixes/for-linux-next-fixes (26498b8d5437 drm/vmwgfx: Handl=
e surface check failure correctly)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_submit.c
Merging mm-stable/mm-stable (8cf0b93919e1 Linux 6.12-rc2)
Merging mm-nonmm-stable/mm-nonmm-stable (8cf0b93919e1 Linux 6.12-rc2)
Merging mm/mm-everything (ff575a16f61a foo)
Merging kbuild/for-next (f8746e3712be kconfig: remove zconfprint())
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (57fb40d40f95 perf tools: Remove unused color_=
fwrite_lines)
$ git reset --hard HEAD^
Merging next-20241010 version of perf
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
Merging arm-soc/for-next (7c590fea8c11 soc: document merges)
Merging amlogic/for-next (58e2d28ed28e Merge branch 'v6.13/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (ffc253263a13 Linux 6.6)
Merging aspeed/for-next (b4c322c2783a ARM: dts: aspeed: catalina: Update io=
 expander line names)
Merging at91/at91-next (ee735afc2dae Merge branch 'at91-soc' into at91-next)
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
Merging rockchip/for-next (26cd756d5404 Merge branch 'v6.12-armsoc/dtsfixes=
' into for-next)
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
Merging thead-dt/thead-dt-for-next (2d98fea7491a riscv: dts: thead: change =
TH1520 SPI node to use clock controller)
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
Merging m68knommu/for-next (8cf0b93919e1 Linux 6.12-rc2)
Merging microblaze/next (badf752b5e4b microblaze: Export xmb_manager functi=
ons)
Merging mips/mips-next (9852d85ec9d4 Linux 6.12-rc1)
Merging openrisc/for-next (4dc70e1aadfa openrisc: Move FPU state out of pt_=
regs)
Merging parisc-hd/for-next (98f7e32f20d2 Linux 6.11)
Merging powerpc/next (9852d85ec9d4 Linux 6.12-rc1)
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
Merging fs-next (ffb5a365288b Merge branch 'vfs.all' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/vfs/vfs.git)
Merging printk/for-next (ebdf88c2479b Merge branch 'for-6.13' into for-next)
Merging pci/next (afb15ca28055 Merge branch 'pci/misc')
Merging pstore/for-next/pstore (1bf8012fc699 pstore: replace spinlock_t by =
raw_spinlock_t)
Merging hid/for-next (fe77331e3a36 Merge branch 'for-6.12/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (3b2af08fadc4 i2c: core: Remove extra space in Mak=
efile)
Merging i2c-host/i2c/i2c-host (c2d449ce0fbd i2c: designware: Add a new ACPI=
 HID for HJMC01 I2C controller)
Merging i3c/i3c/next (618507257797 i3c: master: svc: Fix use after free vul=
nerability in svc_i3c_master Driver Due to Race Condition)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (11fb69bb15c1 hwmon: Add static visibility=
 member to struct hwmon_ops)
Merging jc_docs/docs-next (6d41cc46619c Documentation/tracing: Mention that=
 RESET_ATTACK_MITIGATION can clear memory)
Merging v4l-dvb/next (67cefecf2a03 mailmap: add entries for Hans Verkuil)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (04fe2b1b0ff5 Merge branch 'pm-powercap' into linux-n=
ext)
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
Merging net-next/main (9c0fc36ec493 Merge git://git.kernel.org/pub/scm/linu=
x/kernel/git/netdev/net)
Merging bpf-next/for-next (98d9c5fae1f1 Merge branch 'bpf-next/net' into fo=
r-next)
Merging ipsec-next/master (36efaca9cb28 net: phy: microchip_t1: SQI support=
 for LAN887x)
Merging mlx5-next/mlx5-next (8cf0b93919e1 Linux 6.12-rc2)
Merging netfilter-next/main (f66ebf37d69c Merge git://git.kernel.org/pub/sc=
m/linux/kernel/git/netdev/net)
Merging ipvs-next/main (f66ebf37d69c Merge git://git.kernel.org/pub/scm/lin=
ux/kernel/git/netdev/net)
Merging bluetooth/master (7285f89d6a95 Bluetooth: hci_core: Fix not checkin=
g skb length on hci_scodata_packet)
Merging wireless-next/for-next (a0efa2f362a6 Merge net-next/main to resolve=
 conflicts)
CONFLICT (content): Merge conflict in Documentation/networking/net_cachelin=
es/net_device.rst
Merging ath-next/for-next (4c57ec6c4bb9 wifi: ath11k: Fix CE offset address=
 calculation for WCN6750 in SSR)
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
Merging drm-exynos/for-linux-next (5b272bf7dcf9 Merge tag 'drm-xe-fixes-202=
4-10-03' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes)
Merging drm-misc/for-linux-next (33c255312660 drm/mipi-dsi: fix kernel doc =
on mipi_dsi_compression_mode_multi)
Merging amdgpu/drm-next (01b64bc063d0 drm/radeon: always set GEM function p=
ointer)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dc_typ=
es.h
Merging drm-intel/for-linux-next (388629a219ac drm/i915/mtl: Update PLL c20=
 phy value for DP uhbr20)
Merging drm-msm/msm-next (a20a91fb1bfa Documentation: document adreno preem=
ption)
Merging drm-msm-lumag/msm-next-lumag (15302579373e drm/msm/dpu: enable writ=
eback on SM6350)
Merging drm-xe/drm-xe-next (46bcb0a1214a drm/xe/guc: Fix inverted logic on =
snapshot->copy check)
Applying: fix up for "drm/xe: Wire up device shutdown handler"
Merging etnaviv/etnaviv/next (704d3d60fec4 drm/etnaviv: don't block schedul=
er when GPU is still active)
Merging fbdev/for-next (01ecc142ef7c fbdev: Switch back to struct platform_=
driver::remove())
Merging regmap/for-next (c2288599691c regmap: Merge up v6.12-rc2)
Merging sound/for-next (0845b3e0d5c1 ALSA: usb-audio: Use snprintf instead =
of sprintf in build_mixer_unit_ctl)
$ git reset --hard HEAD^
Merging next-20241010 version of sound
Merging ieee1394/for-next (8f04019d71cb firewire: Correct some typos)
Merging sound-asoc/for-next (5a1891442683 Merge remote-tracking branch 'aso=
c/for-6.13' into asoc-next)
Merging modules/modules-next (b319cea80539 module: Refine kmemleak scanned =
areas)
Merging input/next (515ef92b4939 Input: correct typos in multiple comments =
across misc drivers)
Merging block/for-next (7a84944a4bf7 Merge branch 'for-6.13/block' into for=
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
Merging backlight/for-backlight-next (5461f3fd74a8 backlight: Remove notifi=
er)
Merging battery/for-next (e50a57d16f89 power: supply: hwmon: Fix missing te=
mp1_max_alarm attribute)
Merging regulator/for-next (fceffbfe57af regulator: max5970: Drop unused st=
ructs)
Applying: fix up for "clocksource: Remove unused clocksource_change_rating"

--Sig_/6R63O9LCZy+yf6rUD=lkpYG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcIzR0ACgkQAVBC80lX
0GwpcQf8C92tlTL0nillXpUopClMXY7u5Mk89xSbFMea52Zc7QBGh0zpFQFpJLUe
/lw7wIH9jrc7bUHHGvvfISQz6hWdIV+CjYfQbT82IZatLLbZAbKXXuvUEQRIOwdu
o2VQVHJ++VbMYHVZMdJBHvjdHrKpY99jJerePALvwTNfiu0U7TaLZxMCUiOarQbV
I2OmvQ8KZ8gDQwnIO6g8fB/3Ww/4TVmqYDTrqWE32ycbvukLYSMNMLXN174WNSQp
X95NNUvjtC8WevRxh98Z1LHL1PmghRHik6VAUljl88zDBMG2RlF5QmohUfxF/1NI
LgIUhI+o1VUdD2IYC6lNNUf0tRdRHg==
=acJ+
-----END PGP SIGNATURE-----

--Sig_/6R63O9LCZy+yf6rUD=lkpYG--

