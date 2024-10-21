Return-Path: <linux-next+bounces-4345-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E3C9A5A32
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2024 08:11:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9B721F216FB
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2024 06:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85CA91946A8;
	Mon, 21 Oct 2024 06:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qbCO5AWB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0348194141;
	Mon, 21 Oct 2024 06:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729491061; cv=none; b=LUcYZCPIoHdzMV1yuwHmF9ay9Pj0um40kU6svN1p8vpepGQMw09Qd6GiPMIOHslghVhJ4Y0J3LOQpWmMbIr2As74qWfWp1potoCNZzVO7P9yInsSk0ocFafncTNVS+JwpZM4sgF/JG8VB0U2zc/Usq65uwF1lJspadQL7RnhjkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729491061; c=relaxed/simple;
	bh=CNUrjslfJz7LYiUENcI+/rtFLkEhjGp0lq/xbXwPvz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BTgoGrGGWMrAu/YJyZ2HoBmPR9eY7X4s7oDIAXrZm0yS0vakKf4HjtpMk8Re1jfujBYvjX6QQx7gS2hZgHCxw9F38kRRUPA60NAH8e4+ttbNw0UfHwJuOPxscHzTlgGs8XGzx8sraOmznYZO7jNOUiIR9+VAV/a+UlSmUbh+8Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qbCO5AWB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729491051;
	bh=tBBAi7M3cOPgo23/ieZ+828J0M7mWptJ201NqqfcQ5E=;
	h=Date:From:To:Cc:Subject:From;
	b=qbCO5AWBstYNYHR9cOOCRGtctp3XHAOrUTxFmK5bEdM+bmTfEFWKhTnHFldvEVNpR
	 HywJ0RPXusrY26OhWa4FhYIylAj6V4i1Tb4guJJSA6BwQsLq0jzXOs9/ofmpzp/rjq
	 odhu9ykQqiZcEd9P5NZZr7OJ8xKy0UtvRdF0PyEvyMcQmVcHfC6ZQNm9TxNCxDVm6N
	 9Xwj/yNZV0OcN173nb1vH3V0OYDju60Hzjse08547rpoMs85AMaXIjRsXPIl6wEeS8
	 wzAx+VvuhUUDhNuLCGTbj3o1E3V7yfSYm3I9/LWDP8K9eiRAR285UfAT53lM0j/KST
	 Ec5YfU642ajaw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XX4gH5fnwz4wcy;
	Mon, 21 Oct 2024 17:10:51 +1100 (AEDT)
Date: Mon, 21 Oct 2024 17:10:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 21
Message-ID: <20241021171051.4d4a79c1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pt0JOE+TdclsDpbO1v.GmoO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/pt0JOE+TdclsDpbO1v.GmoO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20241018:

The mm-hotfixes tree gained a conflict against Linus' tree.

The block tree gained a conflict against Linus' tree.

The ftrace tree gained a conflict against Linus' tree.

Non-merge commits (relative to Linus' tree): 5213
 7140 files changed, 231303 insertions(+), 202110 deletions(-)

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

I am currently merging 378 trees (counting Linus' and 140 trees of bug
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
Merging origin/master (c55228220dd3 Merge tag 'char-misc-6.12-rc4' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc)
Merging fixes/fixes (87d6aab2389e Merge tag 'for_linus' of git://git.kernel=
.org/pub/scm/linux/kernel/git/mst/vhost)
Merging vfs-brauner-fixes/vfs.fixes (197231da7f6a proc: Fix W=3D1 build ker=
nel-doc warning)
Merging fscrypt-current/for-current (8e929cb546ee Linux 6.12-rc3)
Merging fsverity-current/for-current (8e929cb546ee Linux 6.12-rc3)
Merging btrfs-fixes/next-fixes (540bc5fc6460 Merge branch 'misc-6.12' into =
next-fixes)
Merging vfs-fixes/fixes (678379e1d4f7 close_range(): fix the logics in desc=
riptor table trimming)
Merging erofs-fixes/fixes (ae54567eaa87 erofs: get rid of kaddr in `struct =
z_erofs_maprecorder`)
Merging nfsd-fixes/nfsd-fixes (8dd91e8d31fe nfsd: fix race between laundrom=
at and free_stateid)
Merging v9fs-fixes/fixes/next (684a64bf32b6 Merge tag 'nfs-for-6.12-1' of g=
it://git.linux-nfs.org/projects/anna/linux-nfs)
Merging overlayfs-fixes/ovl-fixes (77a28aa47687 ovl: relax WARN_ON in ovl_v=
erify_area())
Merging bcachefs/for-next (1ea1b6b00bf8 bcachefs: Use str_write_read() help=
er function)
Merging fscrypt/for-next (8e929cb546ee Linux 6.12-rc3)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (40e66ce9b856 Merge branch 'for-next-next-v6.12-2024=
1015' into for-next-20241015)
Merging ceph/master (ccda9910d849 ceph: fix cap ref leak via netfs init_req=
uest)
Merging cifs/for-next (b04ae0f45168 Merge tag 'v6.12-rc3-smb3-client-fixes'=
 of git://git.samba.org/sfrench/cifs-2.6)
Merging configfs/for-next (4425c1d9b44d configfs: improve item creation per=
formance)
Merging dlm/next (dfe5a6cc4204 dlm: make add_to_waiters() that it can't fai=
l)
Merging erofs/dev (9852d85ec9d4 Linux 6.12-rc1)
Merging exfat/dev (cb7d85014fb1 MAINTAINERS: exfat: add myself as reviewer)
Merging exportfs/exportfs-next (98f7e32f20d2 Linux 6.11)
Merging ext3/for_next (230bb87c58ea Merge dropping of reiserfs.)
Merging ext4/dev (6121258c2b33 ext4: fix off by one issue in alloc_flex_gd(=
))
Merging f2fs/dev (eca631b8fe80 Merge tag 'f2fs-6.12-rc4' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/jaegeuk/f2fs)
Merging fsverity/for-next (8e929cb546ee Linux 6.12-rc3)
Merging fuse/for-next (af23b284a8c1 fuse: convert fuse_notify_store to use =
folios)
Merging gfs2/for-next (7e4a0a50b403 KMSAN: uninit-value in inode_go_dump (5=
))
Merging jfs/jfs-next (2b59ffad47db jfs: Fix uninit-value access of new_ea i=
n ea_buffer)
Merging ksmbd/ksmbd-for-next (9f635d44d766 Merge tag 'v6.12-rc3-ksmbd-fixes=
' of git://git.samba.org/ksmbd)
Merging nfs/linux-next (67784a74e258 Merge tag 'ata-6.11-rc7' of git://git.=
kernel.org/pub/scm/linux/kernel/git/libata/linux)
Merging nfs-anna/linux-next (7ef60108069b NFS: remove revoked delegation fr=
om server's delegation list)
Merging nfsd/nfsd-next (ec999ba8d5df lockd: Remove unneeded initialization =
of file_lock::c.flc_flags)
Merging ntfs3/master (8e929cb546ee Linux 6.12-rc3)
Merging orangefs/for-next (96319dacaf15 orangefs: Constify struct kobj_type)
Merging overlayfs/overlayfs-next (2d66a7cea561 ovl: convert ovl_real_fdget(=
) callers to ovl_real_file())
Merging ubifs/next (92a286e90203 ubi: Fix ubi_init() ubiblock_exit() sectio=
n mismatch)
Merging v9fs/9p-next (79efebae4afc 9p: Avoid creating multiple slab caches =
with the same name)
Merging v9fs-ericvh/ericvh/for-next (684a64bf32b6 Merge tag 'nfs-for-6.12-1=
' of git://git.linux-nfs.org/projects/anna/linux-nfs)
Merging xfs/for-next (f6f91d290c8b xfs: punch delalloc extents from the COW=
 fork for COW writes)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging file-locks/locks-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6-=
mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging iversion/iversion-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6=
-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging vfs-brauner/vfs.all (280056c9dca8 Merge branch 'vfs.exportfs' into =
vfs.all Signed-off-by: Christian Brauner <brauner@kernel.org>)
CONFLICT (content): Merge conflict in fs/btrfs/file.c
CONFLICT (content): Merge conflict in include/linux/iomap.h
Merging vfs/for-next (8f602276d390 Merge tag 'bcachefs-2024-10-05' of git:/=
/evilpiepirate.org/bcachefs)
Merging mm-hotfixes/mm-hotfixes-unstable (9228b1e93524 mm/gup: memfd: stop =
leaking pinned pages in low memory conditions)
CONFLICT (content): Merge conflict in mm/memory.c
Merging fs-current (9786682bd3e2 Merge branch 'nfsd-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/cel/linux)
Merging kbuild-current/fixes (8cf0b93919e1 Linux 6.12-rc2)
Merging arc-current/for-curr (bb5d272ed94d ARC: build: Use __force to suppr=
ess per-CPU cmpxchg warnings)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (7aed6a2c51ff kasan: Disable Software Ta=
g-Based KASAN with GCC)
Merging arm-soc-fixes/arm/fixes (1b59d6c19c2c Merge tag 'scmi-fixes-6.12' o=
f https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into a=
rm/fixes)
Merging davinci-current/davinci/for-current (9852d85ec9d4 Linux 6.12-rc1)
Merging drivers-memory-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging sophgo-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging m68k-current/for-linus (b90fae5df917 m68k: defconfig: Update defcon=
figs for v6.11-rc1)
Merging powerpc-fixes/fixes (cf8989d20d64 powerpc/powernv: Free name on err=
or in opal_event_init())
Merging s390-fixes/fixes (b4fa00fd428b s390: Update defconfigs)
Merging net/main (3b05b9c36ddd MAINTAINERS: add samples/pktgen to NETWORKIN=
G [GENERAL])
Merging bpf/master (5ac9b4e935df lib/buildid: Handle memfd_secret() files i=
n build_id_parse())
Merging ipsec/master (6889cd2a93e1 xfrm: fix one more kernel-infoleak in al=
go dumping)
Merging netfilter/main (1230fe7ad397 netfilter: bpf: must hold reference on=
 net namespace)
Merging ipvs/main (1230fe7ad397 netfilter: bpf: must hold reference on net =
namespace)
Merging wireless/for-next (a940b3a1ad0f Merge tag 'ath-current-20241016' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath)
Merging ath/for-current (befd716ed429 wifi: ath11k: Fix invalid ring usage =
in full monitor mode)
Merging wpan/master (09573b1cc76e net: ieee802154: mcr20a: Use IRQF_NO_AUTO=
EN flag in request_irq())
Merging rdma-fixes/for-rc (dc5006cfcf62 RDMA/bnxt_re: Fix the GID table len=
gth)
Merging sound-current/for-linus (164cd0e077a1 ALSA: hda/conexant - Use cach=
ed pin control for Node 0x1d on HP EliteOne 1000 G2)
Merging sound-asoc-fixes/for-linus (d641c164f8de ASoC/SoundWire: clean up l=
ink DMA during stop for IPC4)
Merging regmap-fixes/for-linus (8cf0b93919e1 Linux 6.12-rc2)
Merging regulator-fixes/for-linus (8e929cb546ee Linux 6.12-rc3)
Merging spi-fixes/for-linus (b5a468199b99 spi: stm32: fix missing device mo=
de capability in stm32mp25)
Merging pci-current/for-linus (1d59d474e1cb PCI: Hold rescan lock while add=
ing devices during host probe)
Merging driver-core.current/driver-core-linus (8e929cb546ee Linux 6.12-rc3)
Merging tty.current/tty-linus (be847a3a8d4e serial: qcom-geni: rename suspe=
nd functions)
Merging usb.current/usb-linus (1154a599214c Merge tag 'usb-serial-6.12-rc4'=
 of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial int=
o usb-linus)
Merging usb-serial-fixes/usb-linus (6d951576ee16 USB: serial: option: add T=
elit FN920C04 MBIM compositions)
Merging phy/fixes (d8f9d6d826fc phy: phy-rockchip-samsung-hdptx: Depend on =
CONFIG_COMMON_CLK)
Merging staging.current/staging-linus (807babf69027 staging: vchiq_arm: Use=
 devm_kzalloc() for drv_mgmt allocation)
Merging iio-fixes/fixes-togreg (6b8e9dbfaed4 iio: frequency: admv4420: fix =
missing select REMAP_SPI in Kconfig)
Merging counter-current/counter-current (9852d85ec9d4 Linux 6.12-rc1)
Merging char-misc.current/char-misc-linus (9b673c7551e6 misc: rtsx: list su=
pported models in Kconfig help)
Merging soundwire-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging thunderbolt-fixes/fixes (e9e1b20fae7d thunderbolt: Fix KASAN report=
ed stack out-of-bounds read in tb_retimer_scan())
Merging input-current/for-linus (2de01e0e57f3 Input: zinitix - don't fail i=
f linux,keycodes prop is absent)
Merging crypto-current/master (cd843399d706 crypto: lib/mpi - Fix an "Unini=
tialized scalar variable" issue)
Merging vfio-fixes/for-linus (5a88a3f67e37 vfio/pci: Init the count variabl=
e in collecting hot-reset devices)
Merging kselftest-fixes/fixes (fe05c40ca9c1 selftest: hid: add the missing =
tests directory)
Merging dmaengine-fixes/fixes (d35f40642904 dmaengine: ti: k3-udma: Set EOP=
 for all TRs in cyclic BCDMA transfer)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (bd92c1e07beb mtd: hyperbus: rpc-if: Add missin=
g MODULE_DEVICE_TABLE)
Merging mfd-fixes/for-mfd-fixes (68f860426d50 mfd: axp20x: AXP717: Fix miss=
ing IRQ status registers range)
Merging v4l-dvb-fixes/fixes (ba9cf6b43043 media: pulse8-cec: fix data times=
tamp at pulse8_setup())
Merging reset-fixes/reset/fixes (2cf596636607 reset: starfive: jh71x0: Fix =
accessing the empty member on JH7110 SoC)
Merging mips-fixes/mips-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging at91-fixes/at91-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging omap-fixes/fixes (5062d9c0cbbc ARM: dts: omap3-n900: correct the ac=
celerometer orientation)
Merging kvm-fixes/master (e9001a382fa2 Merge tag 'kvmarm-fixes-6.12-3' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvms390-fixes/master (cff59d8631e1 s390/uv: Panic for set and remov=
e shared access UVC errors)
Merging hwmon-fixes/hwmon (eabb03810194 [PATCH} hwmon: (jc42) Properly dete=
ct TSE2004-compliant devices again)
Merging nvdimm-fixes/libnvdimm-fixes (d5240fa65db0 nvdimm/pmem: Set dax fla=
g for all 'PFN_MAP' cases)
Merging cxl-fixes/fixes (ee1e3c46ed19 EINJ, CXL: Fix CXL device SBDF calcul=
ation)
Merging dma-mapping-fixes/for-linus (78b2770c935f dma-mapping: fix tracing =
dma_alloc/free with vmalloc'd memory)
Merging drivers-x86-fixes/fixes (2fae3129c0c0 platform/x86: x86-android-tab=
lets: Fix use after free on platform_device_register() errors)
Merging samsung-krzk-fixes/fixes (a03c246d4ec8 clk: samsung: Fix out-of-bou=
nd access of of_match_node())
Merging pinctrl-samsung-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging devicetree-fixes/dt/linus (6e0391e48cf9 of: Skip kunit tests when a=
rm64+ACPI doesn't populate root node)
Merging dt-krzk-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging scsi-fixes/fixes (fca6caeb4a61 scsi: target: core: Fix null-ptr-der=
ef in target_alloc_device())
Merging drm-fixes/drm-fixes (83f000784844 Merge tag 'drm-xe-fixes-2024-10-1=
7' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (2f54e71359eb drm/i915/dp_mst:=
 Don't require DSC hblank quirk for a non-DSC compatible mode)
Merging mmc-fixes/fixes (8e929cb546ee Linux 6.12-rc3)
Merging rtc-fixes/rtc-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging gnss-fixes/gnss-linus (8e929cb546ee Linux 6.12-rc3)
Merging hyperv-fixes/hyperv-fixes (895384881ec9 hv: vmbus: Constify struct =
kobj_type and struct attribute_group)
Merging risc-v-fixes/fixes (c05ad457ce8c riscv: Use '%u' to format the outp=
ut of 'cpu')
Merging riscv-dt-fixes/riscv-dt-fixes (7d9d88890f04 MAINTAINERS: invert Mis=
c RISC-V SoC Support's pattern)
Merging riscv-soc-fixes/riscv-soc-fixes (2e11e78667db riscv: dts: starfive:=
 disable unused csi/camss nodes)
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (47ac09b91bef Linux 6.11-rc4)
Merging gpio-brgl-fixes/gpio/for-current (8e929cb546ee Linux 6.12-rc3)
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
Merging i2c-host-fixes/i2c/i2c-host-fixes (8e929cb546ee Linux 6.12-rc3)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (6b5cca7868fd clk: test: Fix some memory leaks)
Merging pwrseq-fixes/pwrseq/for-current (a85bbe01a320 power: sequencing: ma=
ke the QCom PMU pwrseq driver depend on CONFIG_OF)
Merging thead-dt-fixes/thead-dt-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging drm-misc-fixes/for-linux-next-fixes (83f000784844 Merge tag 'drm-xe=
-fixes-2024-10-17' of https://gitlab.freedesktop.org/drm/xe/kernel into drm=
-fixes)
Merging mm-stable/mm-stable (8e929cb546ee Linux 6.12-rc3)
Merging mm-nonmm-stable/mm-nonmm-stable (8e929cb546ee Linux 6.12-rc3)
Merging mm/mm-everything (a8883372ec25 foo)
Merging kbuild/for-next (32f280d02aa5 kconfig: nconf: Use TAB to cycle thru=
 dialog buttons)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (5455d89bf3da perf build: Rename CONFIG_DWARF =
to CONFIG_LIBDW)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/for-next (bfc4a245a794 dma-mapping: fix DMA API tracing=
 for chained scatterlists)
Merging asm-generic/master (f822712a2c69 UAPI/ioctl: Improve parameter name=
 of ioctl request definition helpers)
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (9016915e3c5f Merge branches 'amba', 'fixes' and 'misc=
' into for-next)
Merging arm64/for-next/core (b8be9b42e20c Merge branch 'for-next/mops' into=
 for-next/core)
Merging arm-perf/for-next/perf (cc8476789983 drivers perf: remove unused fi=
eld pmu_node)
Merging arm-soc/for-next (1b59d6c19c2c Merge tag 'scmi-fixes-6.12' of https=
://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into arm/fixe=
s)
Merging amlogic/for-next (171aa289a6fe Merge branch 'v6.13/arm-dt' into for=
-next)
Merging asahi-soc/asahi-soc/for-next (ffc253263a13 Linux 6.6)
Merging aspeed/for-next (faabe02697d7 ARM: dts: aspeed: yosemite4: Add i2c-=
mux for ADC monitor on Spider Board)
Merging at91/at91-next (9415b23aa236 Merge branch 'at91-defconfig' into at9=
1-next)
Merging broadcom/next (f8078d7ae62b Merge branch 'soc/next' into next)
Merging davinci/davinci/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging drivers-memory/for-next (1f1d847a6575 arm64: defconfig: Update defc=
onfig with now user-visible CONFIG_FSL_IFC)
Merging imx-mxs/for-next (7900ba0b90ac Merge branch 'imx/dt64' into for-nex=
t)
Merging mediatek/for-next (367fceb7a8af Merge branches 'v6.12-next/dts32', =
'v6.12-next/soc' and 'v6.12-next/dts64' into for-next)
Merging mvebu/for-next (841dd5b122b4 arm64: dts: marvell: cn9130-sr-som: fi=
x cp0 mdio pin numbers)
Merging omap/for-next (f45840d172a0 Merge branch 'omap-for-v6.13/drivers' i=
nto tmp/omap-next-20241004.145243)
Merging qcom/for-next (7ad566b677b1 Merge branches 'arm32-for-6.13', 'arm64=
-defconfig-for-6.13', 'arm64-fixes-for-6.12', 'arm64-for-6.13', 'clk-fixes-=
for-6.12', 'clk-for-6.13', 'drivers-fixes-for-6.12' and 'drivers-for-6.13' =
into for-next)
Merging renesas/next (9c520ac4bc1c Merge branch 'renesas-dts-for-v6.13' int=
o renesas-next)
Merging reset/reset/next (c0260e2b0ed8 reset: uniphier-glue: Use devm_reset=
_control_bulk_get_shared_deasserted())
Merging rockchip/for-next (3b6c7fe2e0e2 Merge branch 'v6.13-armsoc/dts32' i=
nto for-next)
Merging samsung-krzk/for-next (9490ef507344 Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (73d536b8803d Merge branch 'for-next/scmi/updat=
es' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linu=
x into for-linux-next)
Merging sophgo/for-next (30003e3f802e riscv: dts: sophgo: cv1812h: add pinc=
trl support)
Merging stm32/stm32-next (b14c9f6bd0ba ARM: dts: stm32: Use SAI to generate=
 bit and frame clock on STM32MP15xx DHCOM PDK2)
Merging sunxi/sunxi/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging tee/next (9852d85ec9d4 Linux 6.12-rc1)
Merging tegra/for-next (6726d2c6a157 Merge branch for-6.12/arm64/defconfig =
into for-next)
Merging thead-dt/thead-dt-for-next (2a3bf75a9408 riscv: dts: thead: remove =
enabled property for spi0)
Merging ti/ti-next (30a9a1a26b95 arm64: dts: ti: k3-am64: Add ti,pa-stats p=
roperty)
Merging xilinx/for-next (0e355cb69e19 Merge branch 'zynq/soc' into for-next)
Merging clk/clk-next (94be1620fb60 Merge branch 'clk-nuvoton' into clk-next)
Merging clk-imx/for-next (32c055ef563c clk: imx6ul: fix clock parent for IM=
X6UL_CLK_ENETx_REF_SEL)
Merging clk-renesas/renesas-clk (92850bed9d4d clk: renesas: r8a779h0: Drop =
CLK_PLL2_DIV2 to clarify ZCn clocks)
Merging csky/linux-next (2c40c1c6adab Merge tag 'usb-6.7-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging loongarch/loongarch-next (5aecc4c8de12 LoongArch: KVM: Mark hrtimer=
 to expire in hard interrupt context)
Merging m68k/for-next (b90fae5df917 m68k: defconfig: Update defconfigs for =
v6.11-rc1)
Merging m68knommu/for-next (9384082e8417 m68k: mcfgpio: Fix incorrect regis=
ter offset for CONFIG_M5441x)
Merging microblaze/next (badf752b5e4b microblaze: Export xmb_manager functi=
ons)
Merging mips/mips-next (9852d85ec9d4 Linux 6.12-rc1)
Merging openrisc/for-next (4dc70e1aadfa openrisc: Move FPU state out of pt_=
regs)
Merging parisc-hd/for-next (98f7e32f20d2 Linux 6.11)
Merging powerpc/next (0882db7f928c Merge branch 'topic/vdso' into next)
Merging risc-v/for-next (77270206955d Merge patch series "cpuidle: riscv-sb=
i: Allow cpuidle pd used by other devices")
Merging riscv-dt/riscv-dt-for-next (7cf3e9bfc63d dt-bindings: vendor-prefix=
es: add spacemit)
Merging riscv-soc/riscv-soc-for-next (8400291e289e Linux 6.11-rc1)
Merging s390/for-next (cde6d9d63b06 Merge branch 'features' into for-next)
Merging sh/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging sparc/for-next (d21dffe51baa arch/sparc: remove unused varible padd=
rbase in function leon_swprobe())
Merging uml/next (8508a5e0e9db um: Fix misaligned stack in stub_exe)
Merging xtensa/xtensa-for-next (b7cf2a1d9881 xtensa: remove redundant flush=
_dcache_page and ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE macros)
Merging fs-next (cf38c48b73e3 Merge branch 'vfs.all' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/vfs/vfs.git)
Merging printk/for-next (16475a8fd500 Merge branch 'for-6.13' into for-next)
Merging pci/next (afb15ca28055 Merge branch 'pci/misc')
Merging pstore/for-next/pstore (1bf8012fc699 pstore: replace spinlock_t by =
raw_spinlock_t)
Merging hid/for-next (e9a6e717706b Merge branch 'for-6.13/bpf' into for-nex=
t)
Merging i2c/i2c/for-next (3b2af08fadc4 i2c: core: Remove extra space in Mak=
efile)
Merging i2c-host/i2c/i2c-host (dc3dbfa4231c i2c: designware: Add a new ACPI=
 HID for HJMC01 I2C controller)
Merging i3c/i3c/next (9852d85ec9d4 Linux 6.12-rc1)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (516ddbfef736 hwmon: (nct6775) Add 665-ACE=
/600M-CL to ASUS WMI monitoring list)
Merging jc_docs/docs-next (a1e42d2543b4 docs/zh_CN: add the translation of =
kbuild/kbuild.rst)
Merging v4l-dvb/next (698b6e3163ba media: atomisp: Replace ternary operator=
 with if)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (c1d51d7b3825 Merge branch 'fixes' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (5f856d71ccdf cpufreq: loongson2=
: Unregister platform_driver on failure)
Merging cpupower/cpupower (b78abc21b263 cpupower: Add Chinese Simplified tr=
anslation)
Merging devfreq/devfreq-next (d47552124bb0 PM / devfreq: imx-bus: Use of_pr=
operty_present())
Merging pmdomain/next (d6caca30a548 OPP: Drop redundant *_opp_attach|detach=
_genpd())
Merging opp/opp/linux-next (53205a790366 dt-bindings: opp: operating-points=
-v2-ti-cpu: Describe opp-supported-hw)
Merging thermal/thermal/linux-next (7d8abc5f3b5c thermal/drivers/imx_sc_the=
rmal: Use dev_err_probe)
Merging rdma/for-next (89e9ae55dc56 IB/hfi1: make clear_all_interrupts stat=
ic)
Merging net-next/main (906c68657850 net: ftgmac100: correct the phy interfa=
ce of NC-SI mode)
CONFLICT (content): Merge conflict in drivers/net/ethernet/mellanox/mlx5/co=
re/eswitch.c
Merging bpf-next/for-next (fbc520739752 Merge branch 'bpf-next/master' into=
 bpf-next/for-next)
Merging ipsec-next/master (30d9d8f6a2d7 net: airoha: Fix typo in REG_CDM2_F=
WD_CFG configuration)
Merging mlx5-next/mlx5-next (8cf0b93919e1 Linux 6.12-rc2)
Merging netfilter-next/main (08e52cccae11 netfilter: nf_tables: prefer nft_=
trans_elem_alloc helper)
Merging ipvs-next/main (08e52cccae11 netfilter: nf_tables: prefer nft_trans=
_elem_alloc helper)
Merging bluetooth/master (4d67eb2b5444 Bluetooth: btintel: Do no pass vendo=
r events to stack)
Merging wireless-next/for-next (1f3de77752a7 Merge tag 'rtw-next-2024-10-10=
' of https://github.com/pkshih/rtw)
CONFLICT (content): Merge conflict in Documentation/networking/net_cachelin=
es/net_device.rst
Merging ath-next/for-next (477cabfdb776 wifi: ath12k: modify link arvif cre=
ation and removal for MLO)
Merging wpan-next/master (ac49b950bea9 dt-bindings: net: add Microchip's LA=
N865X 10BASE-T1S MACPHY)
Merging wpan-staging/staging (ac49b950bea9 dt-bindings: net: add Microchip'=
s LAN865X 10BASE-T1S MACPHY)
Merging mtd/mtd/next (869acb874f2b Merge tag 'nand/for-6.12' into mtd/next)
Merging nand/nand/next (475aadeba5df mtd: spinand: macronix: Flag parts nee=
ding explicit plane select)
Merging spi-nor/spi-nor/next (afe1ea1344bb mtd: spi-nor: add support for Ma=
cronix Octal flash)
Merging crypto/master (0a53948477ca crypto: crypto4xx - use devm in probe)
  6100da511bd2 ("crypto: lib/mpi - Fix an "Uninitialized scalar variable" i=
ssue")
Merging drm/drm-next (0a4d0b2d9d84 Merge tag 'drm-xe-next-2024-10-17' of ht=
tps://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dp=
_mst.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/tegra/gr3d.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/regs/xe_gt_regs.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_ct.c
Merging drm-exynos/for-linux-next (5b272bf7dcf9 Merge tag 'drm-xe-fixes-202=
4-10-03' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes)
Merging drm-misc/for-linux-next (45608a3eb490 drm: panel: nv3052c: correct =
spi_device_id for RG35XX panel)
Merging amdgpu/drm-next (3d73327b748b drm/amdgpu/swsmu: add automatic param=
eter to set_soft_freq_range)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dc_typ=
es.h
Merging drm-intel/for-linux-next (682c9d3d7abb drm/i915/pxp: Add missing ta=
g for Wa_14019159160)
Merging drm-msm/msm-next (1fac1fa4a675 Merge branch 'msm-fixes' into msm-ne=
xt)
Merging drm-msm-lumag/msm-next-lumag (2196e9ac2465 drm/msm: Use video apert=
ure helpers)
  2196e9ac2465 ("drm/msm: Use video aperture helpers")
Merging drm-xe/drm-xe-next (2677520152bc drm/xe: Use __counted_by for flexi=
ble arrays)
Merging etnaviv/etnaviv/next (704d3d60fec4 drm/etnaviv: don't block schedul=
er when GPU is still active)
Merging fbdev/for-next (3805505f8137 fbdev: wm8505fb: select CONFIG_FB_IOME=
M_FOPS)
Merging regmap/for-next (c2288599691c regmap: Merge up v6.12-rc2)
Merging sound/for-next (52345d356220 ALSA: hda: Fix all stream interrupts d=
efinition)
Merging ieee1394/for-next (8f04019d71cb firewire: Correct some typos)
Merging sound-asoc/for-next (626297009d7d Merge remote-tracking branch 'aso=
c/for-6.13' into asoc-next)
Merging modules/modules-next (2295cf87ed5a module: Reformat struct for code=
 style)
Merging input/next (00850d7b542a Input: ts4800-ts - use cleanup facility fo=
r device_node)
Merging block/for-next (7aa2a4c1b52b Merge branch 'for-6.13/block' into for=
-next)
CONFLICT (content): Merge conflict in block/elevator.c
Merging device-mapper/for-next (29e11586b56a dm vdo: Remove unused uds_comp=
ute_index_size)
Merging libata/for-next (08b64eeee4d6 ata: libata-scsi: Refactor scsi_6_lba=
_len() with use of get_unaligned_be24())
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (328bda09cc91 mmc: mmc_spi: drop buggy snprintf())
Merging mfd/for-mfd-next (38d09a34b422 dt-bindings: mfd: Convert zii,rave-s=
p.txt to yaml format)
Merging backlight/for-backlight-next (0eda30af5880 dt-bindings: backlight: =
Convert zii,rave-sp-backlight.txt to yaml)
Merging battery/for-next (44fcc479a574 power: supply: hwmon: move interface=
 to private header)
Merging regulator/for-next (ee7905fa475e Merge remote-tracking branch 'regu=
lator/for-6.13' into regulator-next)
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
Merging tpmdd/next (2f87d0916ce0 Merge tag 'trace-ringbuffer-v6.12-rc3' of =
git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace)
Merging watchdog/master (9852d85ec9d4 Linux 6.12-rc1)
Merging iommu/next (acbec6fa25b5 Merge branches 'fixes', 's390', 'amd/amd-v=
i' and 'core' into next)
Merging audit/next (2132b355267f audit: Reorganize kerneldoc parameter name=
s)
Merging devicetree/for-next (2e030910fa90 of: module: remove strlen() call =
in of_modalias())
Merging dt-krzk/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging mailbox/for-next (54595f2807d2 mailbox, remoteproc: omap2+: fix com=
pile testing)
Merging spi/for-next (6bb46c405062 Merge remote-tracking branch 'spi/for-6.=
13' into spi-next)
Merging tip/master (bb05949e0918 Merge branch into tip/master: 'x86/sev')
Merging clockevents/timers/drivers/next (d7a87891e2f5 platform/x86:intel/pm=
c: fix build regression with pmtimer turned off)
CONFLICT (content): Merge conflict in include/linux/delay.h
CONFLICT (add/add): Merge conflict in kernel/time/sleep_timeout.c
Merging edac/edac-for-next (1fe774a93b46 EDAC/bluefield: Fix potential inte=
ger overflow)
Merging ftrace/for-next (90b19abd0c83 Merge tools/for-next)
CONFLICT (content): Merge conflict in kernel/trace/ring_buffer.c
Merging rcu/next (355debb83bf7 Merge branches 'context_tracking.15.08.24a',=
 'csd.lock.15.08.24a', 'nocb.09.09.24a', 'rcutorture.14.08.24a', 'rcustall.=
09.09.24a', 'srcu.12.08.24a', 'rcu.tasks.14.08.24a', 'rcu_scaling_tests.15.=
08.24a', 'fixes.12.08.24a' and 'misc.11.08.24a' into next.09.09.24a)
Merging paulmck/non-rcu/next (644cbf77cbcc Merge branches 'csd-lock.2024.10=
.11a' and 'lkmm.2024.10.11a' into HEAD)
Merging kvm/next (e9001a382fa2 Merge tag 'kvmarm-fixes-6.12-3' of git://git=
.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvm-arm/next (17a000564499 Merge branch kvm-arm64/visibility-cleanu=
ps into kvmarm-master/next)
Merging kvms390/next (f9b56b2c31e5 s390: Enable KVM_S390_UCONTROL config in=
 debug_defconfig)
Merging kvm-ppc/topic/ppc-kvm (8cf0b93919e1 Linux 6.12-rc2)
Merging kvm-riscv/riscv_kvm_next (5aa09297a3dc RISC-V: KVM: Fix to allow hp=
mcounter31 from the guest)
Merging kvm-x86/next (8cf0b93919e1 Linux 6.12-rc2)
Merging xen-tip/linux-next (0fd2a743301b xen: Remove dependency between pci=
back and privcmd)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (581434654e01 workqueue: Adjust WQ_MAX_ACTIVE f=
rom 512 to 2048)
Merging sched-ext/for-next (0e71bbf555e3 Merge branch 'for-6.13' into for-n=
ext)
Merging drivers-x86/for-next (8150408bfdb2 asus-laptop: prefer strscpy() ov=
er strcpy())
Merging chrome-platform/for-next (9c41f371457b platform/chrome: cros_ec_typ=
ec: fix missing fwnode reference decrement)
Merging chrome-platform-firmware/for-firmware-next (32b0901e141f firmware: =
google: Unregister driver_info on failure)
Merging hsi/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging leds-lj/for-leds-next (681d5fa6440c leds: lp5562: Add multicolor br=
ightness control)
Merging ipmi/for-next (2378bd0b264a ipmi: ipmb: Add check devm_kasprintf() =
returned value)
Merging driver-core/driver-core-next (9bd133f05b1d lib: devres: Simplify AP=
I devm_ioport_unmap() implementation)
Merging usb/usb-next (07b887f8236e xhci: add helper to stop endpoint and wa=
it for completion)
Merging thunderbolt/next (8cf0b93919e1 Linux 6.12-rc2)
Merging usb-serial/usb-next (8e929cb546ee Linux 6.12-rc3)
Merging tty/tty-next (f5927d832bb8 serial: 8250_exar: Remove old exar_ee_re=
ad() and other unneeded code)
Merging char-misc/char-misc-next (ffb4b4ed3e8f Merge tag 'iio-for-6.13a-tak=
e2' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/jic23/iio into ch=
ar-misc-next)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (988d40a4d4e7 coresight: Make trace ID map spinlock =
local to the map)
Merging fastrpc/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging fpga/for-next (8de36789bd03 fpga: zynq-fpga: Rename 'timeout' varia=
ble as 'time_left')
Merging icc/icc-next (a5733950fe35 Merge branch 'icc-sm8350' into icc-next)
Merging iio/togreg (57573ace0c1b iio: imu: bmi270: Remove duplicated includ=
e in bmi270_i2c.c)
Merging phy-next/next (26ac85e3adb4 dt-bindings: phy: ti,tcan104x-can: Docu=
ment Microchip ATA6561)
Merging soundwire/next (830f1aa53c02 soundwire: cadence: clear MCP BLOCK_WA=
KEUP in init)
Merging extcon/extcon-next (9852d85ec9d4 Linux 6.12-rc1)
Merging gnss/gnss-next (8e929cb546ee Linux 6.12-rc3)
Merging vfio/next (aab439ffa1ca vfio/pci: clean up a type in vfio_pci_ioctl=
_pci_hot_reset_groups())
Merging w1/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging spmi/spmi-next (917572b9aff1 dt-bindings: spmi: spmi-mtk-pmif: Add =
compatible for MT8188)
Merging staging/staging-next (0ef2fbdf7d4f staging: vchiq_dev: Drop userdat=
a local pointer)
CONFLICT (modify/delete): drivers/staging/media/omap4iss/iss.c deleted in H=
EAD and modified in staging/staging-next.  Version staging/staging-next of =
drivers/staging/media/omap4iss/iss.c left in tree.
$ git rm -f drivers/staging/media/omap4iss/iss.c
Merging counter-next/counter-next (a3911e087d62 counter: ftm-quaddec: Enabl=
e module autoloading)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (5be63fc19fca Linux 6.11-rc5)
Merging dmaengine/next (76355c25e4f7 dmaengine: Switch back to struct platf=
orm_driver::remove())
Merging cgroup/for-next (a6b3efd2cf3c Merge branch 'for-6.13' into for-next)
Merging scsi/for-next (c352c52452ab Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (a3517717c3c0 Merge patch series "scsi: hisi_sas:=
 Some fixes for hisi_sas")
Merging vhost/linux-next (221af82f606d vhost/scsi: null-ptr-dereference in =
vhost_scsi_get_req())
Merging rpmsg/for-next (be3e6529a8b9 remoteproc: k3-r5: Add compile testing=
 support)
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (b4c69d471b72 dt-bindings: gpio-mmio: Add n=
gpios property)
Merging gpio-intel/for-next (12b0e305f509 gpio: acpi: switch to device_for_=
each_child_node_scoped())
Merging pinctrl/for-next (fd716bb9e14b Merge fixup)
Merging pinctrl-intel/for-next (37756257093b pinctrl: intel: platform: Add =
Panther Lake to the list of supported)
Merging pinctrl-renesas/renesas-pinctrl (5dcde519a067 pinctrl: renesas: Sel=
ect PINCTRL_RZG2L for RZ/V2H(P) SoC)
Merging pinctrl-samsung/for-next (2193074458de pinctrl: samsung: Add Exynos=
 990 SoC pinctrl configuration)
Merging pwm/pwm/for-next (4f6938e6ed2e MAINTAINERS: add self as reviewer fo=
r AXI PWM GENERATOR)
Merging ktest/for-next (2351e8c65404 ktest.pl: Avoid false positives with g=
rub2 skip regex)
Merging kselftest/next (ecfe6870abac selftests:timers: remove local CLOCKID=
 defines)
Merging kunit/test (9852d85ec9d4 Linux 6.12-rc1)
Merging kunit-next/kunit (9852d85ec9d4 Linux 6.12-rc1)
Merging livepatching/for-next (9fbf78b6d6ce Merge branch 'for-6.12/trivial'=
 into for-next)
Merging rtc/rtc-next (f8560812be1d dt-bindings: rtc: mpfs-rtc: Properly nam=
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
Merging memblock/for-next (4bb21dbb6728 mm: Use str_on_off() helper functio=
n in report_meminit())
Merging cxl/next (2c70677dabb5 cxl: Add documentation to explain the shared=
 link bandwidth calculation)
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (63971b0f51fa libstub,tpm: do not ignore failure case when=
 reading final event log)
Merging unicode/for-next (66715f005bde unicode: change the reference of dat=
abase file)
Merging slab/slab/for-next (233fc3ca16e6 Merge branch 'slab/for-6.13/featur=
es' into slab/for-next)
Merging random/master (d18c13697b4d prandom: Include <linux/percpu.h> in <l=
inux/prandom.h>)
Applying: fix up for "random: Do not include <linux/prandom.h> in <linux/ra=
ndom.h>"
Merging landlock/next (fe76bd133024 landlock: Optimize scope enforcement)
Merging rust/rust-next (06b919e3fedf drm/panic: allow verbose version check)
CONFLICT (content): Merge conflict in rust/kernel/types.rs
Merging sysctl/sysctl-next (5cc3199ed06c const_structs.checkpatch: add ctl_=
table)
Merging execve/for-next/execve (44f65d900698 binfmt_elf: mseal address zero)
Merging bitmap/bitmap-for-next (d7bcc37436c7 lib/test_bits.c: Add tests for=
 GENMASK_U128())
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (0838c9ca0d76 MAINTAINERS: Add kernel hardening =
keywords __counted_by{_le|_be})
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
Merging ipe/next (917a15c37d37 MAINTAINERS: update IPE tree url and Fan Wu'=
s email)
Merging kcsan/next (b86f7c9fad06 kcsan: Remove redundant call of kallsyms_l=
ookup_name())
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)

--Sig_/pt0JOE+TdclsDpbO1v.GmoO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcV8GsACgkQAVBC80lX
0GwTUgf/Zp3n63qCJdcGRytcvcP2LgDsEjR+XpjIruyYkbw1EQmQTsdqEELsXvk4
OTxOljiGXhWmuL95la10M9xWpeUO3HCufgqP5l5dy2pX7Ye3tptFN1nejDkjOwSs
t7xiQuppz74g99I/eMiCqM4AqTk8HQ+wgtYOJbphSiBwq80wlXufL0doydHPotZG
TdxT+NE8RxxIyFEivmGDacuAKoEjQcTSGHHsFRcQBurZjFyLHSePxt79CJCp5B84
BQEJgBdQv4tYSVfmLO1Soy2SBOOQcH3nOyJyUBHoTc1Buqh7NGB9NCvKo9RvPVfH
+w9IaR3D+enK0bDGofHLsOB1XJEaLw==
=ubx1
-----END PGP SIGNATURE-----

--Sig_/pt0JOE+TdclsDpbO1v.GmoO--

