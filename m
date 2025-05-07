Return-Path: <linux-next+bounces-6568-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C285AAD80B
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 09:29:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B4424E0EB7
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 07:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F2A219A81;
	Wed,  7 May 2025 07:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QEmaezsB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD97F21885A;
	Wed,  7 May 2025 07:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746602947; cv=none; b=rsYQLsKJ+QYOKBcujRzdZIS0zO0yag4M1QztZpPJT5wf1ZOHQDhtX3fwVGpH2LgFNmknHLSe7EwvrrPVeD7jU5i/qhzQtfyxGvuhA07AZagA8g0lIWqcnb1jUgrpl+0XhOXLI954tn5eyovsNw8fWi8bvpNaFFgZKY6O0MVFAxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746602947; c=relaxed/simple;
	bh=rxtLnWX2HFAfTN1PEu74rTVUcm0VFjngrE6Thm+0ZTU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tItV1SkbnQiRYGxjBPjoltr59ZK52MWVk8SUGzOQ4M+4Ookmh01S8o8t5ripEzRKAkzZK0rJROGPUHAb/068M6O/goQZMSAezWwR8aSDM76yIRjj15wK9IeZR1fg24+iHzMZlMqsW1VxRrblzVhgPtKxzL9LfaCQe5PuA85fVfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QEmaezsB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746602939;
	bh=8HJnOxXu3ghdvJxylcJyht1dANeK1NqYm/jf3DSHuJU=;
	h=Date:From:To:Cc:Subject:From;
	b=QEmaezsB6Mrdhm//I+zJjAPtOV03dt5L2JXEH3hIpla9OSijzU5XRG29G2vaycFhR
	 yNlQbwcumyY5g8xWaf1xWuwDChfy7GeGUoewvala3xp4OTkPc/Abu3CnmlBK/xAtZW
	 n8pvz/Fr8GIr09+N0VSxzmEsagQjg1eFaKBC0ckTmCgK29Lw2Fa4mmxHDQoM2Q7p+Z
	 Ud+ilgT+t4hmhiNh2r4uC2M046jiAop441YdCaz9M6YUSd90KLh7FAeYm2bPFaYSws
	 s/ymCaQb8kHgiBdUbxUn2yBOq/tyeshQ56j267owBsFs5mRDgP71T5+JAqMbqSpKjj
	 IEsoL2naVkqWg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zsn2308Vkz4wj2;
	Wed,  7 May 2025 17:28:58 +1000 (AEST)
Date: Wed, 7 May 2025 17:28:58 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 7
Message-ID: <20250507172858.5b7d087c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.mwZhnMvn/ncQlmv42hi_xm";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.mwZhnMvn/ncQlmv42hi_xm
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250506:

New trees:	sophgo-soc and sophgo-soc-fixes

The i2c-host tree still had its build failure for which I reverted
a commit.

The iwlwifi-next tree still had conflicts against Linus' tree that were
too complex for me to fix up, but this time I merged the iwlwifi-next
tree from next-20250505 instead.

The crypto tree lost its build failures.

The tip tree gained a conflict against the net-next tree.
The tip tree lost its build failure.

The extcon tree lost its build failure.

The hyperv tree still had its build failure so I used the version from
next-20250505.

Non-merge commits (relative to Linus' tree): 8353
 8551 files changed, 346190 insertions(+), 183068 deletions(-)

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

I am currently merging 397 trees (counting Linus' and 151 trees of bug
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
Merging origin/master (0d8d44db295c Merge tag 'for-6.15-rc5-tag' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/kdave/linux)
Merging fixes/fixes (b3c623b9a94f Merge tag 'thermal-6.15-rc1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging ext4-fixes/fixes (4bbf9020becb Linux 6.13-rc4)
Merging vfs-brauner-fixes/vfs.fixes (8b0ba61df5a1 fs/xattr.c: fix simple_xa=
ttr_list to always include security.* xattrs)
Merging fscrypt-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging fsverity-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging btrfs-fixes/next-fixes (076ca6e90d5a Merge branch 'misc-6.15' into =
next-fixes)
Merging vfs-fixes/fixes (93ddd3942493 do_move_mount(): don't leak MNTNS_PRO=
PAGATING on failures)
Merging erofs-fixes/fixes (51224bc0112e erofs: ensure the extra temporary c=
opy is valid for shortened bvecs)
Merging nfsd-fixes/nfsd-fixes (831e3f545b07 Revert "sunrpc: clean cache_det=
ail immediately when flush is written frequently")
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (924577e4f6ca ovl: Fix nested backing fil=
e paths)
Merging bcachefs/for-next (8ea7022fcf64 bcachefs: bcachefs_metadata_version=
_fast_device_removal)
Merging fscrypt/for-next (c07d3aede2b2 fscrypt: add support for hardware-wr=
apped keys)
Merging btrfs/for-next (bf227d9032ca Merge branch 'for-next-next-v6.15-2025=
0505' into for-next-20250505)
Merging ceph/master (f452a2204614 ceph: Fix incorrect flush end position ca=
lculation)
Merging cifs/for-next (bc35ced15f31 smb: client: fix delay on concurrent op=
ens)
Merging configfs/configfs-next (eae324ca6445 configfs: Add CONFIGFS_ATTR_PE=
RM helper)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (6f8b4788266c dlm: drop SCTP Kconfig dependency)
Merging erofs/dev (0f24e3c05afe erofs: enable 48-bit layout support)
Merging exfat/dev (7819f9549ec0 exfat: do not clear volume dirty flag durin=
g sync)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (79eeb515303b Pull ext2 dax deprecation warning.)
Merging ext4/dev (94824ac9a8aa ext4: fix off-by-one error in do_split)
Merging f2fs/dev (0427e811c9bc f2fs: drop usage of folio_index)
Merging fsverity/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging fuse/for-next (0c58a97f919c fuse: remove tmp folio for writebacks a=
nd internal rb tree)
Merging gfs2/for-next (4c3193aa413b gfs: don't check for AOP_WRITEPAGE_ACTI=
VATE in gfs2_write_jdata_batch)
Merging jfs/jfs-next (5dff41a86377 jfs: fix array-index-out-of-bounds read =
in add_missing_indices)
Merging ksmbd/ksmbd-for-next (36991c1ccde2 ksmbd: Fix UAF in __close_file_t=
able_ids)
Merging nfs/linux-next (fa7ab64f1e2f NFS/localio: Fix a race in nfs_local_o=
pen_fh())
Merging nfs-anna/linux-next (9084ed79ddaa lsm,nfs: fix memory leak of lsm_c=
ontext)
Merging nfsd/nfsd-next (25a3e2af74b6 nfsd: use SHA-256 library API instead =
of crypto_shash API)
Merging ntfs3/master (8b26c8c376b2 fs/ntfs3: Add missing direct_IO in ntfs_=
aops_cmpr)
Merging orangefs/for-next (121a83ce6fe6 orangefs: Bufmap deadcoding)
Merging overlayfs/overlayfs-next (b87e2318cdaa vfs: change 'struct file *' =
argument to 'const struct file *' where possible)
Merging ubifs/next (69146a8c893f ubi: ubi_get_ec_info: Fix compiling error =
'cast specifies array type')
Merging v9fs/9p-next (4210030d8bc4 docs: fs/9p: Add missing "not" in cache =
documentation)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (bfecc4091e07 xfs: allow ro mounts if rtdev or logdev =
are read-only)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging vfs-brauner/vfs.all (1f875b49e7ab Merge branch 'vfs-6.16.iomap' int=
o vfs.all)
Merging vfs/for-next (2e72b1e0aac2 Merge branch 'work.d_revalidate' into fo=
r-next)
Merging mm-hotfixes/mm-hotfixes-unstable (db454ada23ac mm/codetag: move tag=
 retrieval back upfront in __free_pages())
Merging fs-current (5dec07a432c3 Merge branch 'ovl-fixes' of git://git.kern=
el.org/pub/scm/linux/kernel/git/overlayfs/vfs.git)
Merging kbuild-current/fixes (80e54e84911a Linux 6.14-rc6)
Merging arc-current/for-curr (6ab657d8d2a4 ARC: unwind: Use built-in sort s=
wap to reduce code size and improve performance)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (363cd2b81cfd arm64: cpufeature: Move ar=
m64_use_ng_mappings to the .data section to prevent wrong idmap generation)
Merging arm-soc-fixes/arm/fixes (2ef5c66cba61 arm64: dts: st: Use 128kB siz=
e for aliased GIC400 register access on stm32mp23 SoCs)
Merging davinci-current/davinci/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging drivers-memory-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging sophgo-fixes/fixes (3e6244429ba3 riscv: dts: sophgo: fix DMA data-w=
idth configuration for CV18xx)
Merging sophgo-soc-fixes/soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging m68k-current/for-linus (c94cf023dce3 m68k: defconfig: Update defcon=
figs for v6.14-rc1)
Merging powerpc-fixes/fixes (e3f506b78d92 powerpc/boot: Fix dash warning)
Merging s390-fixes/fixes (3a47b1e3cea2 s390: Update defconfigs)
Merging net/main (e8716b5b0dff net: ethernet: mtk_eth_soc: do not reset PSE=
 when setting FE)
Merging bpf/master (b4432656b36e Linux 6.15-rc4)
Merging ipsec/master (417fae2c4089 xfrm: ipcomp: fix truesize computation o=
n receive)
Merging netfilter/main (ebd297a2affa Merge tag 'net-6.15-rc5' of git://git.=
kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ipvs/main (491ef1117c56 net: ethernet: mtk_eth_soc: net: revise NET=
SYSv3 hardware configuration)
Merging wireless/for-next (ebedf8b7f05b wifi: iwlwifi: add support for Kill=
er on MTL)
Merging ath/for-current (0937cb5f345c Revert "wifi: mac80211: Update skb's =
control block key in ieee80211_tx_dequeue()")
Merging iwlwifi/fixes (30763f1adf69 Merge tag 'wireless-2025-04-24' of http=
s://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (4bcc063939a5 ice, irdma: fix an off by one in er=
ror handling code)
Merging sound-current/for-linus (6e5bea1c9306 Merge tag 'asoc-fix-v6.15-rc4=
' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for=
-linus)
Merging sound-asoc-fixes/for-linus (315c84567001 ASoC: intel/sdw_utils: Add=
 volume limits to CS35L56)
Merging regmap-fixes/for-linus (433a06b68324 Merge remote-tracking branch '=
regmap/for-6.14' into regmap-linus)
Merging regulator-fixes/for-linus (b4432656b36e Linux 6.15-rc4)
Merging spi-fixes/for-linus (a73fa3690a1f spi: loopback-test: Do not split =
1024-byte hexdumps)
Merging pci-current/for-linus (69dcbfec5f02 MAINTAINERS: Update Krzysztof W=
ilczy=C5=84ski email address)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging driver-core.current/driver-core-linus (95deee37a123 platform: Fix r=
ace condition during DMA configure at IOMMU probe time)
Merging tty.current/tty-linus (b4432656b36e Linux 6.15-rc4)
Merging usb.current/usb-linus (cab63934c33b xhci: dbc: Avoid event polling =
busyloop if pending rx transfers are inactive.)
Merging usb-serial-fixes/usb-linus (b4432656b36e Linux 6.15-rc4)
Merging phy/fixes (9cf118aafd66 phy: rockchip-samsung-dcphy: Add missing as=
signment)
Merging staging.current/staging-linus (c6e8d85fafa7 staging: axis-fifo: Rem=
ove hardware resets for user errors)
Merging iio-fixes/fixes-togreg (b72f1157bfb9 iio: dac: adi-axi-dac: fix bus=
 read)
Merging counter-current/counter-current (7351312632e8 counter: interrupt-cn=
t: Protect enable/disable OPs with mutex)
Merging char-misc.current/char-misc-linus (65995e97a1ca Drivers: hv: Make t=
he sysfs node size for the ring buffer dynamic)
Merging soundwire-fixes/fixes (fd15594ba7d5 soundwire: bus: Fix race on the=
 creation of the IRQ domain)
Merging thunderbolt-fixes/fixes (92a09c47464d Linux 6.15-rc5)
Merging input-current/for-linus (11cdb506d0fb Input: mtk-pmic-keys - fix po=
ssible null pointer dereference)
CONFLICT (content): Merge conflict in drivers/input/joystick/magellan.c
Merging crypto-current/master (a32f1923c6d6 crypto: scompress - increment s=
comp_scratch_users when already allocated)
Merging vfio-fixes/for-linus (c1d9dac0db16 vfio/pci: Align huge faults to o=
rder)
Merging kselftest-fixes/fixes (07be53cfa81a selftests/ftrace: Differentiate=
 bash and dash in dynevent_limitations.tc)
Merging dmaengine-fixes/fixes (305245a2e1d6 dmaengine: ptdma: Move variable=
 condition check to the first place and remove redundancy)
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
Merging kvm-fixes/master (2d7124941a27 Merge tag 'kvmarm-fixes-6.15-2' of h=
ttps://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvms390-fixes/master (d8dfda5af0be KVM: s390: pv: fix race when mak=
ing a page secure)
Merging hwmon-fixes/hwmon (9c32cda43eb7 Linux 6.15-rc3)
Merging nvdimm-fixes/libnvdimm-fixes (265e98f72bac acpi: nfit: vmalloc-out-=
of-bounds Read in acpi_nfit_ctl)
Merging cxl-fixes/fixes (078d3ee7c162 cxl/core/regs.c: Skip Memory Space En=
able check for RCD and RCH Ports)
Merging dma-mapping-fixes/dma-mapping-fixes (89461db349cc dma-coherent: War=
n if OF reserved memory is beyond current coherent DMA mask)
Merging drivers-x86-fixes/fixes (02c6e43397c3 platform/x86: ideapad-laptop:=
 add support for some new buttons)
Merging samsung-krzk-fixes/fixes (dd303e021996 soc: samsung: usi: prevent w=
rong bits inversion during unconfiguring)
Merging pinctrl-samsung-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging devicetree-fixes/dt/linus (d5f49921707c dt-bindings: soc: fsl: fsl,=
ls1028a-reset: Fix maintainer entry)
Merging dt-krzk-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging scsi-fixes/fixes (0e9693b97a0e scsi: ufs: core: Remove redundant qu=
ery_complete trace)
Merging drm-fixes/drm-fixes (92a09c47464d Linux 6.15-rc5)
Merging drm-intel-fixes/for-linux-next-fixes (936b73feab5c drm/i915/slpc: B=
alance the inc/dec for num_waiters)
Merging mmc-fixes/fixes (77183db6b8db mmc: renesas_sdhi: disable clocks if =
registering regulator failed)
Merging rtc-fixes/rtc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging gnss-fixes/gnss-linus (9c32cda43eb7 Linux 6.15-rc3)
Merging hyperv-fixes/hyperv-fixes (14ae3003e73e Drivers: hv: Fix bad ref to=
 hv_synic_eventring_tail when CPU goes offline)
Merging risc-v-fixes/fixes (7d1d19a11cfb riscv: uprobes: Add missing fence.=
i after building the XOL buffer)
Merging riscv-dt-fixes/riscv-dt-fixes (1b133129ad6b riscv: dts: starfive: F=
ix a typo in StarFive JH7110 pin function definitions)
Merging riscv-soc-fixes/riscv-soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (0af2f6be1b42 Linux 6.15-rc1)
Merging gpio-brgl-fixes/gpio/for-current (b4432656b36e Linux 6.15-rc4)
Merging gpio-intel-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging pinctrl-intel-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging auxdisplay-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging kunit-fixes/kunit-fixes (b26c1a85f3fc kunit: qemu_configs: SH: Resp=
ect kunit cmdline)
Merging memblock-fixes/fixes (42e31f0daf80 mm,mm_init: Mark set_high_memory=
 as __init)
Merging renesas-fixes/fixes (379c590113ce ARM: shmobile: smp: Enforce shmob=
ile_smp_* alignment)
Merging perf-current/perf-tools (8988c4b91945 perf tools: Fix in-source lib=
perf build)
Merging efi-fixes/urgent (11092db5b573 efivarfs: fix NULL dereference on re=
sume)
Merging battery-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging iommufd-fixes/for-rc (0af2f6be1b42 Linux 6.15-rc1)
Merging rust-fixes/rust-fixes (f0b89d2c2026 rust: clean Rust 1.88.0's `clip=
py::uninlined_format_args` lint)
Merging w1-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging pmdomain-fixes/fixes (13a6d4265665 pmdomain: renesas: rcar: Remove =
obsolete nullify checks)
Merging i2c-host-fixes/i2c/i2c-host-fixes (e66b0a8f048b i2c: omap: fix depr=
ecated of_property_read_bool() use)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging pwrseq-fixes/pwrseq/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging thead-dt-fixes/thead-dt-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging ftrace-fixes/ftrace/fixes (2fa6a01345b5 tracing: Fix memory leak wh=
en reading set_event file)
Merging ring-buffer-fixes/ring-buffer/fixes (e4d4b8670c44 ring-buffer: Use =
flush_kernel_vmap_range() over flush_dcache_folio())
Merging trace-fixes/trace/fixes (0a8f11f8569e tracing: Do not take trace_ev=
ent_sem in print_event_fields())
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging tip-fixes/tip/urgent (1fd074da1cfb Merge branch into tip/master: 'x=
86/urgent')
Merging slab-fixes/slab/for-next-fixes (be8250786ca9 mm, slab: clean up sla=
b->obj_exts always)
Merging drm-msm-fixes/msm-fixes (9d78f0250322 drm/msm/a6xx+: Don't let IB_S=
IZE overflow)
Merging uml-fixes/fixes (01f95500a162 Merge tag 'uml-for-linux-6.15-rc6' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux)
Merging fwctl-fixes/for-rc (c92ae5d4f53e fwctl: Fix repeated device word in=
 log message)
Merging devsec-tsm-fixes/fixes (99b9d909187a configfs-tsm-report: Fix NULL =
dereference of tsm_ops)
Merging drm-misc-fixes/for-linux-next-fixes (7c6fa1797a72 drm/panel: simple=
: Update timings for AUO G101EVN010)
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (fc96b232f8e7 Merge tag 'pci-v6.15-fixes-2' of =
git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci)
Merging mm-nonmm-stable/mm-nonmm-stable (fc96b232f8e7 Merge tag 'pci-v6.15-=
fixes-2' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci)
Merging mm-unstable/mm-unstable (9ead4336d7c0 swapfile: disable swapon for =
bs > ps devices)
Merging mm-nonmm-unstable/mm-nonmm-unstable (3b838451ca8e kernel/rcu/tree_s=
tall: add /sys/kernel/rcu_stall_count)
Merging kbuild/for-next (a7c699d090a1 kbuild: rpm-pkg: build a debuginfo RP=
M)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (8feafba59c51 perf test: Add direct off-cpu te=
sts)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (3ee7d9496342 docs: core-api: docu=
ment the IOVA-based API)
Merging asm-generic/master (852faf805539 gcc-plugins: remove SANCOV gcc plu=
gin)
Merging alpha/alpha-next (1523226edda5 alpha: Use str_yes_no() helper in pc=
i_dac_dma_supported())
Merging arm/for-next (96e0b3558830 ARM: 9447/1: arm/memremap: fix arch_memr=
emap_can_ram_remap())
Merging arm64/for-next/core (f7c87741c22d Merge branches 'for-next/cpufeatu=
re', 'for-next/efi', 'for-next/entry', 'for-next/misc', 'for-next/mm', 'for=
-next/psci', 'for-next/sme-fixes' and 'for-next/vdso' into for-next/core)
Merging arm-perf/for-next/perf (70cbcb2850ec perf: Do not enable by default=
 during compile testing)
Merging arm-soc/for-next (2ef5c66cba61 arm64: dts: st: Use 128kB size for a=
liased GIC400 register access on stm32mp23 SoCs)
Merging amlogic/for-next (aba7d878839a Merge branch 'v6.16/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (fb84b3df3515 Merge remote-tracking br=
anch 'origin/asahi-soc/dt' into asahi-soc/for-next)
Merging aspeed/for-next (bf8f48263c0e Merge remote-tracking branches 'aspee=
d/dt', 'aspeed/drivers', 'aspeed/fixes' and 'nuvoton/dt' into for-next)
Merging at91/at91-next (a9c0a43cb22d Merge branch 'at91-dt' into at91-next)
Merging broadcom/next (87b8fa3195af Merge branch 'devicetree-arm64/next' in=
to next)
Merging davinci/davinci/for-next (78e6b545e558 ARM: davinci: remove support=
 for da830)
Merging drivers-memory/for-next (9be694f1a9d8 Merge branch 'for-v6.16/renes=
as-rpc-if' into for-next)
Merging imx-mxs/for-next (9bfe32fed9a8 Merge branch 'imx/dt64' into for-nex=
t)
Merging mediatek/for-next (6df944d2cf58 Merge branch 'v6.15-next/dts64' int=
o for-next)
Merging mvebu/for-next (e85dce9d1b78 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (1df28c539085 Merge branch 'omap-for-v6.16/drivers' i=
nto tmp/omap-next-20250501.110944)
Merging qcom/for-next (4ad3b5991a98 Merge branches 'arm32-for-6.16', 'arm64=
-defconfig-for-6.16', 'arm64-for-6.16', 'clk-for-6.16' and 'drivers-for-6.1=
6' into for-next)
Merging renesas/next (d849e3b35597 Merge branches 'renesas-arm-defconfig-fo=
r-v6.16' and 'renesas-dts-for-v6.16' into renesas-next)
Merging reset/reset/next (1c64de886b88 dt-bindings: reset: sophgo: Add SG20=
44 bindings.)
Merging rockchip/for-next (e86026c7f646 Merge branch 'v6.16-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (6417a4c554dd Merge branch 'for-v6.16/mux-var=
ious' into for-next)
Merging scmi/for-linux-next (a7c42186e7b1 Merge tag 'scmi-updates-6.16' of =
ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into =
for-linux-next)
Merging sophgo/for-next (ae246f5c0ce4 riscv: sophgo: dts: Add spi controlle=
r for SG2042)
Merging sophgo-soc/soc-for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging spacemit/for-next (cb9c3aeae509 riscv: dts: spacemit: add gpio LED =
for system heartbeat)
Merging stm32/stm32-next (7b6bbef62485 ARM: dts: stm32: support STM32h747i-=
disco board)
Merging sunxi/sunxi/for-next (18b2d5a21103 Merge branch 'sunxi/dt-for-6.16'=
 into sunxi/for-next)
Merging tee/next (40cfb51a6e93 Merge branch 'tee_for_v6_16' into next)
Merging tegra/for-next (4e16110559c3 Merge branch for-6.15/arm64/dt into fo=
r-next)
Merging thead-dt/thead-dt-for-next (1b136de08b5f riscv: dts: thead: Introdu=
ce reset controller node)
Merging ti/ti-next (b635b7dd785c Merge branches 'ti-drivers-soc-next' and '=
ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging clk/clk-next (7e12c8374040 Merge branch 'clk-bindings' into clk-nex=
t)
Merging clk-imx/for-next (6a55647af333 dt-bindings: clock: imx8m-clock: add=
 PLLs)
Merging clk-renesas/renesas-clk (aff664cc8cbc clk: renesas: Use str_on_off(=
) helper)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (0a08a7ddff7e LoongArch: Update Loongson-3=
 default config file)
Merging m68k/for-next (52ae3f5da7e5 m68k: mac: Fix macintosh_config for Mac=
 II)
Merging m68knommu/for-next (e5c6d91b521b m68k: Replace memcpy() + manual NU=
L-termination with strscpy())
Merging microblaze/next (920354d7818b microblaze: Use of_property_present()=
 for non-boolean properties)
Merging mips/mips-next (3b3704261e85 MIPS: Replace strcpy() with strscpy() =
in vpe_elfload())
Merging openrisc/for-next (218b8d897551 dt-bindings: interrupt-controller: =
Convert openrisc,ompic to DT schema)
Merging parisc-hd/for-next (cccaea1d66e9 parisc: Replace __ASSEMBLY__ with =
__ASSEMBLER__ in non-uapi headers)
Merging powerpc/next (03c9d1a5a30d Documentation: Fix description format fo=
r powerpc RTAS ioctls)
Merging risc-v/for-next (bafa451a96d0 riscv: defconfig: Remove EXPERT)
Merging riscv-dt/riscv-dt-for-next (38818f7c9c17 riscv: dts: starfive: jh71=
10-pine64-star64: enable USB 3.0 port)
Merging riscv-soc/riscv-soc-for-next (a41cd775a8f1 Merge branch 'riscv-conf=
ig-for-next' into riscv-soc-for-next)
Merging s390/for-next (595138256174 Merge branch 'features' into for-next)
Merging sh/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (e619e18ed462 um: Remove legacy network transport infrastr=
ucture)
Merging xtensa/xtensa-for-next (3d6d238851df arch: xtensa: defconfig: Drop =
obsolete CONFIG_NET_CLS_TCINDEX)
Merging fs-next (85d74114c0ff Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (9827cd0d6498 Merge branch 'for-6.15-printf-attribu=
te' into for-next)
Merging pci/next (1fa7eab22df3 Merge branch 'pci/misc')
Merging pstore/for-next/pstore (8ffd015db85f Linux 6.15-rc2)
Merging hid/for-next (f843dbd14f03 Merge branch 'for-6.15/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (ef579b9927e7 Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i2c-host/i2c/i2c-host (d871a96a97b8 i2c: mlxbf: Use str_read_write(=
) helper)
Applying: Revert "i2c: i801: don't instantiate spd5118 under SPD Write Disa=
ble"
Merging i3c/i3c/next (0af2f6be1b42 Linux 6.15-rc1)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (0c0c84e48698 hwmon: (ausus-ec-sensors) ad=
d MAXIMUS VI HERO.)
Merging jc_docs/docs-next (b91a0cbb6f27 docs: dmaengine: add explanation fo=
r DMA_ASYNC_TX capability)
  96476dfb1082 ("Documentation/kernel-parameters: Update memtest parameter")
  98d2ea56614b ("docs/mm/damon/design: Fix spelling mistake")
Merging v4l-dvb/next (48dbb76cef65 dt-bindings: media: convert imx.txt to y=
aml format)
CONFLICT (content): Merge conflict in drivers/media/i2c/ds90ub960.c
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (b3e0fe536420 Merge branch 'acpi-pm' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (0a89b0dc417d Merge branch 'rust=
/cpufreq-dt' into cpufreq/arm/linux-next)
Merging cpupower/cpupower (99d2fce9b44d cpupower: change binding's makefile=
 to use -lcpupower)
Merging devfreq/devfreq-next (92a09c47464d Linux 6.15-rc5)
Merging pmdomain/next (e3407cc5eeff pmdomain: amlogic: Constify some struct=
ures)
Merging opp/opp/linux-next (ee3de3cf7035 OPP: Add dev_pm_opp_set_level())
Merging thermal/thermal/linux-next (50085e27fe47 thermal/drivers/mediatek/l=
vts: Remove unused lvts_debugfs_exit)
Merging rdma/for-next (3db60cf9b7da IB/hfi1: Adjust fd->entry_to_rb allocat=
ion type)
CONFLICT (content): Merge conflict in drivers/infiniband/sw/rxe/rxe_mr.c
CONFLICT (content): Merge conflict in drivers/infiniband/sw/rxe/rxe_resp.c
Merging net-next/main (075001c9eb41 Merge branch 'net-phy-realtek-add-suppo=
rt-for-phy-leds')
CONFLICT (content): Merge conflict in MAINTAINERS
Merging bpf-next/for-next (fc47ea210a39 Merge branch 'bpf-next/net' into fo=
r-next)
Merging ipsec-next/master (86e530c84c97 Merge branch 'Update offload config=
uration with SA')
CONFLICT (content): Merge conflict in drivers/net/ethernet/intel/ixgbe/ixgb=
e_ipsec.c
Merging mlx5-next/mlx5-next (f550694e88b7 net/mlx5: Add IFC bits for PPCNT =
recovery counters group)
Merging netfilter-next/main (836b313a14a3 ipv4: Honor "ignore_routes_with_l=
inkdown" sysctl in nexthop selection)
Merging ipvs-next/main (88922fe78540 Merge branch 'bridge-mc-per-vlan-qquer=
y')
Merging bluetooth/master (f3daca9b4901 Bluetooth: separate CIS_LINK and BIS=
_LINK link types)
CONFLICT (content): Merge conflict in include/net/bluetooth/hci_core.h
CONFLICT (content): Merge conflict in net/bluetooth/hci_sync.c
Merging wireless-next/for-next (885e5cbaa0ee Revert "wifi: iwlwifi: clean u=
p config macro")
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/ml=
d/fw.c
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/ml=
d/mld.c
Merging ath-next/for-next (885e5cbaa0ee Revert "wifi: iwlwifi: clean up con=
fig macro")
Merging iwlwifi-next/next (bb19250c3b44 wifi: iwlwifi: handle v3 rates)
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/cf=
g/sc.c
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/iw=
l-config.h
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/iw=
l-nvm-parse.c
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/iw=
l-trans.c
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/iw=
l-trans.h
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/pc=
ie/drv.c
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/te=
sts/devinfo.c
$ git reset --hard HEAD^
Merging next-20250505 version of iwlwifi-next
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (843ce6ed4689 mtd: core: always create master device)
Merging nand/nand/next (e6031b11544b mtd: rawnand: qcom: Fix read len for o=
nfi param page)
Merging spi-nor/spi-nor/next (594c8df92b94 mtd: spi-nor: macronix: Add fixu=
ps for MX25L3255E)
Merging crypto/master (9b9d4ef0cf75 crypto: lib/poly1305 - Build main libra=
ry on LIB_POLY1305 and split generic code out)
Merging drm/drm-next (5e0c67998152 BackMerge tag 'v6.15-rc5' into drm-next)
Merging drm-exynos/for-linux-next (81a50378559b drm/exynos: Remove unnecess=
ary checking)
Merging drm-misc/for-linux-next (a6c0a91ccb25 checkpatch: remove %p4cn)
  d5d283d45c85 ("drm/panel: simple: Update timings for AUO G101EVN010")
Merging amdgpu/drm-next (3e50b1d625f2 drm/amdgpu: only keep most recent fen=
ce for each context)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_mes=
.c
Merging drm-intel/for-linux-next (d66f470f4da9 drm/i915/display: implement =
wa_14022269668)
Merging drm-msm/msm-next (db76003ade59 dt-bindings: opp: Add v2-qcom-adreno=
 vendor bindings)
Merging drm-msm-lumag/msm-next-lumag (479f23787226 drm/msm/dpu: remove DPU_=
CTL_SPLIT_DISPLAY from SAR2130P CTL blocks)
Merging drm-nova/nova-next (b75a99e1077b samples: rust: pci: take advantage=
 of Devres::access())
CONFLICT (content): Merge conflict in rust/helpers/helpers.c
Merging drm-xe/drm-xe-next (12370bfcc4f0 drm/xe/gsc: do not flush the GSC w=
orker from the reset path)
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (cbe82d46f7a5 vgacon: Add check for vc_origin addres=
s range in vgacon_scroll())
Merging regmap/for-next (631f2288a412 Merge remote-tracking branch 'regmap/=
for-6.16' into regmap-next)
Merging sound/for-next (f0ccc717c6c6 ALSA: hda/tas2781: select CONFIG_CRC8 =
for SND_HDA_SCODEC_TAS2781_I2C)
Merging ieee1394/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging sound-asoc/for-next (b5effe37b235 Merge remote-tracking branch 'aso=
c/for-6.16' into asoc-next)
Merging modules/modules-next (3b4c5b1f6d7d module: Remove outdated comment =
about text_size)
Merging input/next (5d511d93c0c3 dt-bindings: input: touchscreen: edt-ft5x0=
6: use unevaluatedProperties)
Merging block/for-next (41550d408721 Merge branch 'for-6.16/block' into for=
-next)
Merging device-mapper/for-next (e93912786e50 dm: pass through operations on=
 wrapped inline crypto keys)
Merging libata/for-next (b8ed9475384f dt-bindings: ata: rockchip-dwc-ahci: =
add RK3576 compatible)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (9e12816f9a61 mmc: rename mmc_boot_partition_access() to m=
mc_host_can_access_boot())
Merging mfd/for-mfd-next (88191aca808a dt-bindings: mfd: syscon: Add qcom,a=
pq8064-sps-sic)
Merging backlight/for-backlight-next (e12d3e1624a0 backlight: pm8941: Add N=
ULL check in wled_configure())
Merging battery/for-next (b1d8766052eb power: supply: rt9471: Simplify defi=
nition of some struct linear_range)
Merging regulator/for-next (5babd09e0922 Merge remote-tracking branch 'regu=
lator/for-6.16' into regulator-next)
Merging security/next (74e5b13a1b0f lsm: Move security_netlink_send to unde=
r CONFIG_SECURITY_NETWORK)
Merging apparmor/apparmor-next (3e45553acb14 apparmor: Remove unused variab=
le 'sock' in __file_sock_perm())
Merging integrity/next-integrity (591683d3944c ima: measure kexec load and =
exec events as critical data)
CONFLICT (content): Merge conflict in kernel/kexec_file.c
Merging selinux/next (05f1a939225e selinux: fix the kdoc header for task_av=
dcache_update)
Merging smack/next (a158a937d864 smack: recognize ipv4 CIPSO w/o categories)
Merging tomoyo/master (e9ddb37834eb tomoyo: update mailing lists)
Merging tpmdd/next (552c4ec0bf4b tpm_crb: ffa_tpm: fix/update comments desc=
ribing the CRB over FFA ABI)
Merging watchdog/master (9bc64d338b0b watchdog: sunxi_wdt: Add support for =
Allwinner A523)
Merging iommu/next (e5609ec5d325 Merge branches 'fixes', 'apple/dart', 'med=
iatek', 'renesas/ipmmu', 's390', 'amd/amd-vi' and 'core' into next)
Merging audit/next (654d61b8e0e2 audit: record AUDIT_ANOM_* events regardle=
ss of presence of rules)
Merging devicetree/for-next (1b765f8bdac2 devres: Export devm_ioremap_resou=
rce_wc())
Merging dt-krzk/for-next (9415cc61649d Merge branch 'next/soc-drivers' into=
 for-next)
Merging mailbox/for-next (1ec12fd31ecc mailbox: Remove unneeded semicolon)
Merging spi/for-next (b8cc2c49705c Merge remote-tracking branch 'spi/for-6.=
16' into spi-next)
Merging tip/master (da5fcea2fe31 Merge branch into tip/master: 'x86/sgx')
  48199713a6a8 ("um: Use irq_domain_create_linear() helper")
CONFLICT (content): Merge conflict in arch/loongarch/kernel/entry.S
CONFLICT (content): Merge conflict in arch/x86/Kconfig.assembler
CONFLICT (content): Merge conflict in drivers/net/ethernet/wangxun/txgbe/tx=
gbe_irq.c
Merging edac/edac-for-next (4521b86e4a6e Merge ras/edac-urgent into for-nex=
t)
Merging ftrace/for-next (d85852264728 Merge tools/for-next)
Merging rcu/next (dab9d2afaa3d Merge branches 'rcu/misc-for-6.16', 'rcu/seq=
-counters-for-6.16' and 'rcu/torture-for-6.16' into rcu/for-next)
Merging paulmck/non-rcu/next (9c147c183e3d Merge branches 'lkmm.2025.04.22a=
' and 'ratelimit.2025.05.05a' into HEAD)
Merging kvm/next (45eb29140e68 Merge branch 'kvm-fixes-6.15-rc4' into HEAD)
CONFLICT (content): Merge conflict in arch/x86/kvm/vmx/vmx.c
Merging kvm-arm/next (ce69dfe088be Merge branch kvm-arm64/misc-6.16 into kv=
marm-master/next)
Merging kvms390/next (0c7fbae5bc78 KVM: s390: Don't use %pK through debug p=
rinting)
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (87ec7d5249bb KVM: RISC-V: reset smstateen=
 CSRs)
Merging kvm-x86/next (94da2b969670 Merge branches 'fixes', 'misc', 'mmu', '=
pir', 'selftests', 'svm' and 'vmx')
Merging xen-tip/linux-next (715ad3e0ec2b xen: fix multicall debug feature)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (23227e71b69a workqueue: fix typo in comment)
Merging sched-ext/for-next (771641d7c9a7 Merge branch 'for-6.16' into for-n=
ext)
Merging drivers-x86/for-next (67e2635fe0cc platform/x86:intel/pmc: Improve =
pmc_core_get_lpm_req())
CONFLICT (content): Merge conflict in drivers/platform/x86/dell/alienware-w=
mi-wmax.c
Merging chrome-platform/for-next (3e552ccf405c platform/chrome: kunit: Avoi=
d -Wflex-array-member-not-at-end)
Merging chrome-platform-firmware/for-firmware-next (0af2f6be1b42 Linux 6.15=
-rc1)
Merging hsi/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging leds-lj/for-leds-next (9062209d453b leds: pca995x: Fix typo in pca9=
95x_of_match's of_device_id entry)
Merging ipmi/for-next (df37a8ba1da1 ipmi:msghandler: Fix potential memory c=
orruption in ipmi_create_user())
CONFLICT (content): Merge conflict in drivers/char/ipmi/ipmi_msghandler.c
CONFLICT (content): Merge conflict in drivers/char/ipmi/ipmi_ssif.c
Merging driver-core/driver-core-next (4f894483c902 firmware_loader: use SHA=
-256 library API instead of crypto_shash API)
Merging usb/usb-next (588d032e9e56 usb: misc: onboard_usb_dev: Add Parade P=
S5511 hub support)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging thunderbolt/next (36f6f7e2d4d0 Documentation/admin-guide: Document =
Thunderbolt/USB4 tunneling events)
Merging usb-serial/usb-next (692a497eb748 USB: serial: ti_usb_3410_5052: dr=
op bogus read urb check)
Merging tty/tty-next (5ee558c5d9e9 vt: add new dynamically generated files =
to .gitignore)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/ser=
ial/snps-dw-apb-uart.yaml
Merging char-misc/char-misc-next (97e72c1e0c54 virt: acrn: Remove unused li=
st 'acrn_irqfd_clients')
Applying: uio_hv_generic: constify bin_attribute definitions
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (6264f1dfaebc coresight: Disable MMIO logging for co=
resight stm driver)
Merging fastrpc/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga/for-next (6ebf1982038a fpga: fix potential null pointer deref =
in fpga_mgr_test_img_load_sgt())
Merging icc/icc-next (a0a532d59b8f Merge branch 'icc-sa8775p' into icc-next)
Merging iio/togreg (7a175d9667b2 HID: sensor-hub: Fix typo and improve docu=
mentation for sensor_hub_remove_callback())
CONFLICT (content): Merge conflict in drivers/iio/adc/Kconfig
CONFLICT (content): Merge conflict in drivers/iio/adc/ad7606.c
Merging phy-next/next (9d0ec51d7c22 phy: rockchip: samsung-hdptx: Add high =
color depth management)
Merging soundwire/next (0af2f6be1b42 Linux 6.15-rc1)
Merging extcon/extcon-next (dfe748f6ae51 extcon: qcom-spmi-misc: Fix wakeup=
 source leaks on device unbind)
Merging gnss/gnss-next (9c32cda43eb7 Linux 6.15-rc3)
Merging vfio/next (860be250fc32 vfio/pci: Handle INTx IRQ_NOTCONNECTED)
Merging w1/for-next (a9b3ecc7bcf6 w1: Avoid -Wflex-array-member-not-at-end =
warnings)
Merging spmi/spmi-next (02a0fd9c0c40 irqdomain: spmi: Switch to irq_domain_=
create_tree())
Merging staging/staging-next (417ce77ef466 staging: gpib: Avoid unused vari=
able warnings)
Merging counter-next/counter-next (08e2a660b160 counter: interrupt-cnt: Con=
vert atomic_t -> atomic_long_t)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (d175222f5e90 dmaegnine: fsl-edma: add edma error in=
terrupt handler)
Merging cgroup/for-next (9e1b9c12842f Merge branch 'for-6.16' into for-next)
Merging scsi/for-next (1b014517d12a Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (6d600a8c2a94 scsi: docs: Clean up some style in =
scsi_mid_low_api)
Merging vhost/linux-next (1f69fe75a328 vhost-scsi: log event queue write de=
scriptors)
Merging rpmsg/for-next (849dbc64790f Merge branches 'rproc-next' and 'rpmsg=
-next' into for-next)
Merging gpio-brgl/gpio/for-next (3a1e07184d78 gpio: blzp1600: remove incorr=
ect pf_match_ptr())
Merging gpio-intel/for-next (a02af05f41c7 Merge patch series "gpiolib: acpi=
: Fix missing info filling")
Merging pinctrl/for-next (de1742fe7d04 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging pinctrl-renesas/renesas-pinctrl (5488aa013e9e pinctrl: renesas: rzg=
2l: Add support for RZ/V2N SoC)
Merging pinctrl-samsung/for-next (a30692b4f81b pinctrl: samsung: Add filter=
 selection support for alive bank on gs101)
Merging pwm/pwm/for-next (2006016ec6b3 pwm: add support for NXPs high-side =
switch MC33XS2410)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging ktest/for-next (5a1bed232781 ktest: Fix Test Failures Due to Missin=
g LOG_FILE Directories)
Merging kselftest/next (9d4b78df5dc5 selftests/perf_events: Fix spelling mi=
stake "sycnhronize" -> "synchronize")
Merging kunit/test (0af2f6be1b42 Linux 6.15-rc1)
Merging kunit-next/kunit (c2493384e811 kunit: executor: Remove const from k=
unit_filter_suites() allocation type)
Merging livepatching/for-next (a8e905a819fd Merge branch 'for-6.15/ftrace-t=
est' into for-next)
Merging rtc/rtc-next (d37058674646 rtc: da9063: simplify irq management)
Merging nvdimm/libnvdimm-for-next (ef1d3455bbc1 libnvdimm/labels: Fix divid=
e error in nd_label_data_init())
Merging at24/at24/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging ntb/ntb-next (0cadf92e93d4 NTB/msi: Remove unused functions)
Merging seccomp/for-next/seccomp (797002deed03 selftests/seccomp: fix sysca=
ll_restart test for arm compat)
Merging slimbus/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging nvmem/for-next (a5d9b82ff4ed Merge branch 'nvmem-for-6.16' into nvm=
em-for-next)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (1b019573c966 PCI: hv: Get vPCI MSI IRQ domain f=
rom DeviceTree)
$ git reset --hard HEAD^
Merging next-20250505 version of hyperv
Merging auxdisplay/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging kgdb/kgdb/for-next (afdbe49276ac kdb: Remove optional size argument=
s from strscpy() calls)
Merging hmm/hmm (c92ae5d4f53e fwctl: Fix repeated device word in log messag=
e)
Merging cfi/cfi/next (0af2f6be1b42 Linux 6.15-rc1)
Merging mhi/mhi-next (ee593991be26 bus: mhi: host: pci_generic: Add Telit F=
N920C04 modem support)
Merging memblock/for-next (3b394dff15e1 memblock tests: add test for memblo=
ck_set_node)
Merging cxl/next (8e62ba590160 cxl/test: Address missing MODULE_DESCRIPTION=
 warnings for cxl_test)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (0dc1754e16b4 efi/libstub: Avoid legacy decompressor zlib/=
zstd wrappers)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (1cabeb548de6 Merge branch 'slab/for-6.16/testin=
g' into slab/for-next)
Merging random/master (602c988b7827 prandom: remove next_pseudo_random32)
Merging landlock/next (b1525d0a8d3a landlock: Remove KUnit test that trigge=
rs a warning)
Merging rust/rust-next (92a09c47464d Linux 6.15-rc5)
Merging rust-alloc/alloc-next (88d5d6a38d51 rust: alloc: replace `Vec::set_=
len` with `inc_len`)
Merging rust-pin-init/pin-init-next (9de1a293c8ec rust: pin-init: improve d=
ocumentation for `Zeroable` derive macros)
Merging rust-timekeeping/timekeeping-next (679185904972 MAINTAINERS: rust: =
Add a new section for all of the time stuff)
Merging rust-xarray/xarray-next (fa616196fbea MAINTAINERS: add entry for Ru=
st XArray API)
CONFLICT (content): Merge conflict in rust/bindings/bindings_helper.h
Applying: fix up for conflict against drm-nova
Applying: fixup for conflict with the mm-unstable tree
Applying: fix up for conflict with cpufreq-arm tree
Merging sysctl/sysctl-next (23b8bacf1547 sysctl: Close test ctl_headers wit=
h a for loop)
Merging execve/for-next/execve (811500687b73 binfmt_elf: Move brk for stati=
c PIE even if ASLR disabled)
Merging bitmap/bitmap-for-next (a256ae22570e bitfield: Add FIELD_MODIFY() h=
elper)
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (48b79238694d integer-wrap: Force full rebuild w=
hen .scl file changes)
Merging nolibc/for-next (2051d3b830c0 tools/nolibc: Add m68k support)
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
Merging crc/crc-next (46e3311607d6 crypto: crc32 - remove "generic" from fi=
le and module names)
Merging fwctl/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging devsec-tsm/next (152f07b4c292 coco/guest: Move shared guest CC infr=
astructure to drivers/virt/coco/guest/)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)

--Sig_/.mwZhnMvn/ncQlmv42hi_xm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgbC7oACgkQAVBC80lX
0GzGzwgAnJ8Yy0KYcknLB/nkTE3HH4D12mOdFg2e+Vy+R3NCr09SVsVp9wb2sp9C
zi2f3Na2Hqks1ocUYJdjkCEmtBEIAkld8Gm/2Y1vSol3Jsv+FvPhYVD25OitPYRa
IVqKfZcKwmHDi/GX0Wb5PYDQw3S2PGDMI2ONIPd/pvD59uKnPIypKOx3okaUzWq+
ApeFZxNge51orl1ktuN73WyyXJZ0HGVMK9eSHj5uHAzq3MXzP3GDB2NwVw5sqEC4
Kjzs+8HuPPWx5DsS1y70qoECxtCXihB2LQG72QAIShn0zZpQlWaV+y0UG5uJ4Xdg
fAuwX67DMYnH7D0/EiyZKrPTISjsXg==
=Ban4
-----END PGP SIGNATURE-----

--Sig_/.mwZhnMvn/ncQlmv42hi_xm--

