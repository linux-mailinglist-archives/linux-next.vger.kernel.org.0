Return-Path: <linux-next+bounces-6791-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E013CAB836E
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 11:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 536E116A91B
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 09:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F613297119;
	Thu, 15 May 2025 09:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="e+JtRgKf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CED1AA795;
	Thu, 15 May 2025 09:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747303192; cv=none; b=EibO0/hTjDs4MGgYT6SPZr0dzwDHzT8ESKeVg9hdYwOZsk9nuF01ASS1qvcSU8ZhSKbMPuc4hzxaPXDRTqO1HN0ZgmqvZB30TcY02v4+P6aohHFBpKtfnfpewbkh7hpgsIFY3cT5hPkaGADkUPhfALzKgGO4p6ALGWjaB+n8PFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747303192; c=relaxed/simple;
	bh=ZnAr/7wHIQ0IwceuIqCkyw9bbP1DTESe4CyE9CpmRnE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IOQT9obclJ7BJK1/W1KHgaeYdacsfRPksYFbyyOruySP3puYcH2ANy0MgpejuxOnNG8T/3wWg8pFB7WabYc9vVLe+JEVKzNLHULV/aJiCP+yKzar6hrECawOYB6Gw3i8eXGcUOAbsk2pHMxyXnGGWZHmJeQ2Ks9WxLgBXGHcbrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=e+JtRgKf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747303180;
	bh=J48015JeHVxqOwwbgrP6xW0phNxU/0sG4wNiG/AMUzQ=;
	h=Date:From:To:Cc:Subject:From;
	b=e+JtRgKfkghXc5TfOW9OmAYdHbV/4k3whH9W6TkzmixAfjrGouqCWf7ZgDYeGldY8
	 VCXoel2Kyb3mtfARfqEbpW5qUD+Pn/Nw8kFOlDt+2o5T5LXM9lZHsuANuniDr0P1og
	 BxaZVNnS799jKtt9/kwYJRAS8tSoyltgKVyLCYbv1+hHqr2WL4bRc3tSKsxTeoJOHa
	 QICwSAUNTVR+YJkwevFqBTSsP1eoK7O2AjkGXFgxEVRm26Jz4zvpgtolyPUW/4nJwl
	 jkJkK3ULyt04iO8puI60IaIbrXOq7WGnE3i25Q11RSE3JSCfgWqjPi1iAHHiiPDoNY
	 SRGv8Hnk0FS/g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zym0D45tDz4wvg;
	Thu, 15 May 2025 19:59:40 +1000 (AEST)
Date: Thu, 15 May 2025 19:59:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 15
Message-ID: <20250515195939.557068f6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S4J/LZR/D26ElcuSF.LkSzt";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/S4J/LZR/D26ElcuSF.LkSzt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250514:

The dmaengine-fixes tree gained a build failure so I used the version
from next-20250914.

I reverted a commit from the powerpc tree that is causing build failures
with some configurations.

I applied a supplied patch to the pci tree for a build problem.

The tip tree gained a conflict against the mm-unstable tree.

The drivers-x86 tree gained a build failure so I used the version from
next-20250914.

The phy-next tree gained conflicts against the phy tree.

The hyperv tree ained a conflict against the tip-fixes tree.

Non-merge commits (relative to Linus' tree): 10287
 10211 files changed, 452102 insertions(+), 212268 deletions(-)

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

I am currently merging 399 trees (counting Linus' and 152 trees of bug
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
Merging origin/master (c94d59a126cb Merge tag 'trace-v6.15-rc6' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace)
Merging fixes/fixes (b3c623b9a94f Merge tag 'thermal-6.15-rc1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging ext4-fixes/fixes (4bbf9020becb Linux 6.13-rc4)
Merging vfs-brauner-fixes/vfs.fixes (04679f3c27e1 fs: Remove redundant errs=
eq_set call in mark_buffer_write_io_error.)
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
Merging bcachefs/for-next (d9b33bcadc31 bcachefs: Add tracepoint, counter f=
or io_move_created_rebalance)
Merging fscrypt/for-next (c07d3aede2b2 fscrypt: add support for hardware-wr=
apped keys)
Merging btrfs/for-next (990615ca2722 Merge branch 'for-next-next-v6.15-2025=
0512' into for-next-20250512)
CONFLICT (content): Merge conflict in fs/btrfs/discard.c
Merging ceph/master (f452a2204614 ceph: Fix incorrect flush end position ca=
lculation)
Merging cifs/for-next (98e5036ed526 smb: client: fix delay on concurrent op=
ens)
Merging configfs/configfs-next (c6b190822459 MAINTAINERS: add configfs Rust=
 abstractions)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (6f8b4788266c dlm: drop SCTP Kconfig dependency)
Merging erofs/dev (82f2b0b97b36 Linux 6.15-rc6)
Merging exfat/dev (7819f9549ec0 exfat: do not clear volume dirty flag durin=
g sync)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (a678afe9434b Pull fsnotify flex array warning fix)
Merging ext4/dev (94824ac9a8aa ext4: fix off-by-one error in do_split)
Merging f2fs/dev (2c19d65bab04 f2fs: introduce FAULT_VMALLOC)
Merging fsverity/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging fuse/for-next (3a7d67252c63 fuse: support large folios for writebac=
k)
Merging gfs2/for-next (4b6f23f4cf26 gfs2: Don't call gfs2_jdata_writepages =
during journal flush)
Merging jfs/jfs-next (5dff41a86377 jfs: fix array-index-out-of-bounds read =
in add_missing_indices)
Merging ksmbd/ksmbd-for-next (f98798fd7e1c ksmbd: fix stream write failure)
Merging nfs/linux-next (fa7ab64f1e2f NFS/localio: Fix a race in nfs_local_o=
pen_fh())
Merging nfs-anna/linux-next (9084ed79ddaa lsm,nfs: fix memory leak of lsm_c=
ontext)
Merging nfsd/nfsd-next (155a14150881 nfsd: remove legacy dprintks from GETA=
TTR and STATFS codepaths)
Merging ntfs3/master (8b26c8c376b2 fs/ntfs3: Add missing direct_IO in ntfs_=
aops_cmpr)
Merging orangefs/for-next (cfa6cdbf8e5a orangefs: adjust counting code to r=
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
Merging vfs-brauner/vfs.all (feaa00dbff45 Merge branch 'vfs-6.16.selftests'=
 into vfs.all)
Merging vfs/for-next (2e72b1e0aac2 Merge branch 'work.d_revalidate' into fo=
r-next)
Merging mm-hotfixes/mm-hotfixes-unstable (ab8bc93526d2 MAINTAINERS: add hun=
g-task detector section)
Merging fs-current (8f2b08b8bae0 Merge branch 'ovl-fixes' of git://git.kern=
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
Merging net/main (314007549d89 octeontx2-pf: Fix ethtool support for SDP re=
presentors)
Merging bpf/master (b4432656b36e Linux 6.15-rc4)
Merging ipsec/master (417fae2c4089 xfrm: ipcomp: fix truesize computation o=
n receive)
Merging netfilter/main (3c44b2d615e6 Merge branch 'virtio-net-fix-total-qst=
at-values')
Merging ipvs/main (491ef1117c56 net: ethernet: mtk_eth_soc: net: revise NET=
SYSv3 hardware configuration)
Merging wireless/for-next (2c89c1b655c0 Merge tag 'net-6.15-rc6' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ath/for-current (9540984da649 Merge tag 'wireless-2025-05-06' of ht=
tps://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless)
Merging iwlwifi/fixes (30763f1adf69 Merge tag 'wireless-2025-04-24' of http=
s://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (d0706bfd3ee4 RDMA/core: Fix "KASAN: slab-use-aft=
er-free Read in ib_register_device" problem)
Merging sound-current/for-linus (66e48ef6ef50 ALSA: sh: SND_AICA should dep=
end on SH_DMA_API)
Merging sound-asoc-fixes/for-linus (6052f05254b4 ASoc: SOF: topology: conne=
ct DAI to a single DAI link)
Merging regmap-fixes/for-linus (433a06b68324 Merge remote-tracking branch '=
regmap/for-6.14' into regmap-linus)
Merging regulator-fixes/for-linus (92a09c47464d Linux 6.15-rc5)
Merging spi-fixes/for-linus (e979a7c79fbc spi: tegra114: Use value to check=
 for invalid delays)
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
Merging iio-fixes/fixes-togreg (e2f820014239 iio: imu: inv_icm42600: Fix te=
mperature calculation)
Merging counter-current/counter-current (7351312632e8 counter: interrupt-cn=
t: Protect enable/disable OPs with mutex)
Merging char-misc.current/char-misc-linus (82f2b0b97b36 Linux 6.15-rc6)
Merging soundwire-fixes/fixes (fd15594ba7d5 soundwire: bus: Fix race on the=
 creation of the IRQ domain)
Merging thunderbolt-fixes/fixes (0f73628e9da1 thunderbolt: Do not double de=
queue a configuration request)
Merging input-current/for-linus (93406e9d0240 Input: xpad - fix xpad_device=
 sorting)
Merging crypto-current/master (a32f1923c6d6 crypto: scompress - increment s=
comp_scratch_users when already allocated)
Merging vfio-fixes/for-linus (c1d9dac0db16 vfio/pci: Align huge faults to o=
rder)
Merging kselftest-fixes/fixes (07be53cfa81a selftests/ftrace: Differentiate=
 bash and dash in dynevent_limitations.tc)
Merging dmaengine-fixes/fixes (5e27af0514e2 dmaengine: fsl-edma: Fix return=
 code for unhandled interrupts)
$ git reset --hard HEAD^
Merging next-20250514 version of dmaengine-fixes
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
Merging drm-fixes/drm-fixes (82f2b0b97b36 Linux 6.15-rc6)
Merging drm-intel-fixes/for-linux-next-fixes (82f2b0b97b36 Linux 6.15-rc6)
Merging mmc-fixes/fixes (08f959759e1e mmc: sdhci-of-dwcmshc: add PD workaro=
und on RK3576)
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
Merging gpio-brgl-fixes/gpio/for-current (7118be7c6072 gpio: virtuser: fix =
potential out-of-bound write)
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
Merging pmdomain-fixes/fixes (13a6d4265665 pmdomain: renesas: rcar: Remove =
obsolete nullify checks)
Merging i2c-host-fixes/i2c/i2c-host-fixes (1cfe51ef07ca i2c: designware: Fi=
x an error handling path in i2c_dw_pci_probe())
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (2bc3ada0906f Merge tag 'v6.15-rockchip-clkfixe=
s1' of git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip i=
nto clk-fixes)
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
Merging tip-fixes/tip/urgent (6d46c5702716 Merge branch into tip/master: 'x=
86/urgent')
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
Merging drm-misc-fixes/for-linux-next-fixes (72c7d62583eb dma-buf: insert m=
emory barrier before updating num_fences)
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (9e619cd4fefd memcg: no irq disable for memcg s=
tock lock)
Merging mm-nonmm-stable/mm-nonmm-stable (cf80fdbc0a55 list: remove redundan=
t 'extern' for function prototypes)
Merging mm-unstable/mm-unstable (2f6baf8dadec MAINTAINERS: add kernel/fork.=
c to relevant sections)
Merging mm-nonmm-unstable/mm-nonmm-unstable (acffffccb862 fork: define a lo=
cal GFP_VMAP_STACK)
Merging kbuild/for-next (188d818d66b7 init: remove unused CONFIG_CC_CAN_LIN=
K_STATIC)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (f3061d526714 perf tests: Harden branch stack =
sampling test)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (3ee7d9496342 docs: core-api: docu=
ment the IOVA-based API)
Merging asm-generic/master (852faf805539 gcc-plugins: remove SANCOV gcc plu=
gin)
Merging alpha/alpha-next (1523226edda5 alpha: Use str_yes_no() helper in pc=
i_dac_dma_supported())
Merging arm/for-next (96e0b3558830 ARM: 9447/1: arm/memremap: fix arch_memr=
emap_can_ram_remap())
Merging arm64/for-next/core (ae19997feedf Merge branches 'for-next/acpi', '=
for-next/cpufeature', 'for-next/efi', 'for-next/entry', 'for-next/misc', 'f=
or-next/mm', 'for-next/perf', 'for-next/psci', 'for-next/selftests', 'for-n=
ext/sme-fixes' and 'for-next/vdso' into for-next/core)
Merging arm-perf/for-next/perf (097469a2b0f1 perf/amlogic: Replace smp_proc=
essor_id() with raw_smp_processor_id() in meson_ddr_pmu_create())
Merging arm-soc/for-next (f60018d6c5d0 soc: document merges)
Merging amlogic/for-next (a2ce7e3f919e Merge branch 'v6.16/arm-dt' into for=
-next)
Merging asahi-soc/asahi-soc/for-next (fb84b3df3515 Merge remote-tracking br=
anch 'origin/asahi-soc/dt' into asahi-soc/for-next)
Merging aspeed/for-next (34c87a24e268 Merge branches 'aspeed/dt', 'aspeed/f=
ixes', 'aspeed/drivers', 'nuvoton/arm/dt' and 'nuvoton/arm64/dt' into for-n=
ext)
Merging at91/at91-next (2d521696ad76 Merge branch 'at91-dt' into at91-next)
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
Merging mvebu/for-next (e85dce9d1b78 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (6d658392b3f0 Merge branch 'omap-for-v6.16/drivers' i=
nto tmp/omap-next-20250508.062442)
Merging qcom/for-next (512f1ef88222 Merge branches 'arm32-for-6.16', 'arm64=
-defconfig-for-6.16', 'arm64-for-6.16', 'clk-for-6.16' and 'drivers-for-6.1=
6' into for-next)
Merging renesas/next (de219001e8b3 Merge branch 'renesas-dts-for-v6.16' int=
o renesas-next)
Merging reset/reset/next (1c64de886b88 dt-bindings: reset: sophgo: Add SG20=
44 bindings.)
Merging rockchip/for-next (14a9a162f238 Merge branch 'v6.16-clk/next' into =
for-next)
Merging samsung-krzk/for-next (48af60cd8aaa Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (7326bb3aaaf9 Merge tags 'scmi-updates-6.16' an=
d 'juno-updates-6.16' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git=
/sudeep.holla/linux into for-linux-next)
Merging sophgo/for-next (478f3197388f riscv: dts: sophgo: switch precise co=
mpatible for existed clock device for CV18XX)
Merging sophgo-soc/soc-for-next (c8754c7deab4 soc: sophgo: cv1800: rtcsys: =
New driver (handling RTC only))
Merging spacemit/for-next (3aa64cd126b4 riscv: dts: spacemit: add gpio LED =
for system heartbeat)
Merging stm32/stm32-next (3f70ddb86143 ARM: dts: stm32: add initial support=
 for stm32mp157-ultra-fly-sbc board)
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
Merging clk/clk-next (da0d5e233780 Merge branch 'clk-cleanup' into clk-next)
Merging clk-imx/for-next (293fc0252d3b arm64: dts: imx8mp: add PLLs to cloc=
k controller module (CCM))
Merging clk-renesas/renesas-clk (28548f3f7994 clk: renesas: r9a09g047: Add =
XSPI clock/reset)
Merging thead-clk/thead-clk-for-next (50d4b157fa96 clk: thead: Add clock su=
pport for VO subsystem in T-HEAD TH1520 SoC)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (cd01778df672 LoongArch: dts: Add PWM supp=
ort to Loongson-2K2000)
Merging m68k/for-next (52ae3f5da7e5 m68k: mac: Fix macintosh_config for Mac=
 II)
Merging m68knommu/for-next (ee4d637cf705 m68k: Replace memcpy() + manual NU=
L-termination with strscpy())
Merging microblaze/next (920354d7818b microblaze: Use of_property_present()=
 for non-boolean properties)
Merging mips/mips-next (3b3704261e85 MIPS: Replace strcpy() with strscpy() =
in vpe_elfload())
Merging openrisc/for-next (f698ee1f4003 dt-bindings: interrupt-controller: =
Convert openrisc,ompic to DT schema)
Merging parisc-hd/for-next (cccaea1d66e9 parisc: Replace __ASSEMBLY__ with =
__ASSEMBLER__ in non-uapi headers)
Merging powerpc/next (5a821e2d69e2 powerpc/boot: Fix build with gcc 15)
Applying: Revert "powerpc: do not build ppc_save_regs.o always"
Merging risc-v/for-next (1a3f6980889d Merge patch series "riscv: Add vendor=
 extensions support for SiFive")
Merging riscv-dt/riscv-dt-for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging riscv-soc/riscv-soc-for-next (59986662d2f4 Merge branch 'riscv-cach=
e-for-next' into riscv-soc-for-next)
Merging s390/for-next (e94a9f451445 Merge branch 'features' into for-next)
Merging sh/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (e619e18ed462 um: Remove legacy network transport infrastr=
ucture)
Merging xtensa/xtensa-for-next (3d6d238851df arch: xtensa: defconfig: Drop =
obsolete CONFIG_NET_CLS_TCINDEX)
Merging fs-next (06b051a55f41 Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
CONFLICT (content): Merge conflict in fs/fuse/file.c
Merging printk/for-next (9827cd0d6498 Merge branch 'for-6.15-printf-attribu=
te' into for-next)
Merging pci/next (1fa7eab22df3 Merge branch 'pci/misc')
Applying: PCI/bwctrl: Remove unused pcie_bwctrl_lbms_rwsem
Merging pstore/for-next/pstore (d679c2e1e8d9 pstore/zone: rewrite some comm=
ents for better understanding)
Merging hid/for-next (5e9f050d085e Merge branch 'for-6.16/core' into for-ne=
xt)
Merging i2c/i2c/for-next (8930ef557c4d Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i2c-host/i2c/i2c-host (3126aebbc93b i2c: designware: Invoke runtime=
 suspend on quick slave re-registration)
Merging i3c/i3c/next (0af2f6be1b42 Linux 6.15-rc1)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (0ddce5549012 hwmon: (lm75) Fix I3C transf=
er buffer pointer for incoming data)
Merging jc_docs/docs-next (fea017a99ba5 docs: dmaengine: add explanation fo=
r DMA_ASYNC_TX capability)
Merging v4l-dvb/next (1b83a9f41bd1 media: amlogic: c3-mipi-csi2: Handle 64-=
bits division)
CONFLICT (content): Merge conflict in drivers/media/i2c/ds90ub960.c
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (7e144d8f5497 Merge branch 'pm-cpufreq' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (0a89b0dc417d Merge branch 'rust=
/cpufreq-dt' into cpufreq/arm/linux-next)
CONFLICT (content): Merge conflict in rust/bindings/bindings_helper.h
CONFLICT (content): Merge conflict in rust/kernel/lib.rs
Merging cpupower/cpupower (e5174365c132 cpupower: do not install files to /=
etc/default/)
Merging devfreq/devfreq-next (7d342e4c88c5 PM / devfreq: Check governor bef=
ore using governor->name)
Merging pmdomain/next (36114344675d pmdomain: Merge branch fixes into next)
Merging opp/opp/linux-next (ee3de3cf7035 OPP: Add dev_pm_opp_set_level())
Merging thermal/thermal/linux-next (50085e27fe47 thermal/drivers/mediatek/l=
vts: Remove unused lvts_debugfs_exit)
Merging rdma/for-next (21508c8c972c Merge branch 'for-next' of https://git.=
kernel.org/pub/scm/linux/kernel/git/tnguy/linux into wip/leon-for-next)
CONFLICT (content): Merge conflict in drivers/infiniband/core/umem_odp.c
CONFLICT (content): Merge conflict in drivers/infiniband/hw/irdma/main.c
CONFLICT (content): Merge conflict in drivers/infiniband/sw/rxe/rxe_mr.c
CONFLICT (content): Merge conflict in drivers/infiniband/sw/rxe/rxe_resp.c
Merging net-next/main (4cde0e4224ce net: cpsw: isolate cpsw_ndo_ioctl() to =
just the old driver)
CONFLICT (content): Merge conflict in MAINTAINERS
CONFLICT (content): Merge conflict in tools/testing/selftests/drivers/net/h=
w/ncdevmem.c
Merging bpf-next/for-next (c667d55a2bac Merge branch 'bpf-next/master' into=
 for-next)
Merging ipsec-next/master (86e530c84c97 Merge branch 'Update offload config=
uration with SA')
CONFLICT (content): Merge conflict in drivers/net/ethernet/intel/ixgbe/ixgb=
e_ipsec.c
Merging mlx5-next/mlx5-next (f550694e88b7 net/mlx5: Add IFC bits for PPCNT =
recovery counters group)
Merging netfilter-next/main (3e52667a9c32 Merge branch 'lan78xx-phylink-pre=
p')
Merging ipvs-next/main (88922fe78540 Merge branch 'bridge-mc-per-vlan-qquer=
y')
Merging bluetooth/master (259a6d602310 Bluetooth: btusb: use skb_pull to av=
oid unsafe access in QCA dump handling)
CONFLICT (content): Merge conflict in drivers/bluetooth/btusb.c
CONFLICT (content): Merge conflict in include/net/bluetooth/hci_core.h
CONFLICT (content): Merge conflict in net/bluetooth/hci_conn.c
CONFLICT (content): Merge conflict in net/bluetooth/hci_sync.c
CONFLICT (content): Merge conflict in net/bluetooth/l2cap_core.c
Merging wireless-next/for-next (63a9a727d373 wireless: purelifi: plfxlc: fi=
x memory leak in plfxlc_usb_wreq_asyn())
Merging ath-next/for-next (9daaf1978600 Merge tag 'wireless-next-2025-05-06=
' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next)
Merging iwlwifi-next/next (2e7bedc442cf wifi: iwlwifi: mld: allow 2 ROCs on=
 the same vif)
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
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/ml=
d/agg.c
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/pc=
ie/drv.c
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/pc=
ie/internal.h
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/te=
sts/devinfo.c
Applying: iwlwifi: remove the left over bits of 2 commits from Linus' tree
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (0aa7b390fc40 mtd: core: always create master device)
Merging nand/nand/next (615f8f5077fc mtd: rawnand: loongson1: Fix inconsist=
ent refcounting in ls1x_nand_chip_init())
Merging spi-nor/spi-nor/next (594c8df92b94 mtd: spi-nor: macronix: Add fixu=
ps for MX25L3255E)
Merging crypto/master (1bafd82d9a40 crypto: marvell/cesa - Avoid empty tran=
sfer descriptor)
Merging drm/drm-next (1faeeb315fdb Merge tag 'amd-drm-next-6.16-2025-05-09'=
 of https://gitlab.freedesktop.org/agd5f/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/hdp_v5_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/hdp_v6_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/hdp_v7_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_svm.h
Merging drm-exynos/for-linux-next (81a50378559b drm/exynos: Remove unnecess=
ary checking)
Merging drm-misc/for-linux-next (9934ab180511 drm/vmwgfx: Use non-hybrid PC=
I devres API)
Merging amdgpu/drm-next (72ea78335e78 drm/amdgpu: add debugfs for spirom IF=
WI dump)
Merging drm-intel/for-linux-next (eff82fb0d266 drm/i915/alpm: Stop writing =
ALPM registers when PSR is enabled)
Merging drm-msm/msm-next (fc5c669c902c dt-bindings: display: msm: correct e=
xample in SM8350 MDSS schema)
Merging drm-msm-lumag/msm-next-lumag (fc5c669c902c dt-bindings: display: ms=
m: correct example in SM8350 MDSS schema)
Merging drm-nova/nova-next (61479ae38cb7 gpu: nova-core: move Firmware to f=
irmware module)
CONFLICT (content): Merge conflict in rust/helpers/helpers.c
CONFLICT (content): Merge conflict in samples/rust/Makefile
Merging drm-xe/drm-xe-next (5aee6e33e195 drm/xe/vm: Add debug prints for SV=
M range prefetch)
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (efc82ab59a78 fbcon: Make sure modelist not set on u=
nregistered console)
Merging regmap/for-next (631f2288a412 Merge remote-tracking branch 'regmap/=
for-6.16' into regmap-next)
Merging sound/for-next (eef5bccfb1b7 ALSA: hda/tas2781: Fix the ld issue re=
ported by kernel test robot)
Merging ieee1394/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging sound-asoc/for-next (cd38c414b21d Merge remote-tracking branch 'aso=
c/for-6.16' into asoc-next)
Merging modules/modules-next (20b3cad07f3c module: Remove outdated comment =
about text_size)
Merging input/next (74d3da135f69 MAINTAINERS: update dlg,da72??.txt to yaml)
Merging block/for-next (141862ea9b59 Merge branch 'for-6.16/block' into for=
-next)
CONFLICT (content): Merge conflict in fs/gfs2/ops_fstype.c
Merging device-mapper/for-next (e93912786e50 dm: pass through operations on=
 wrapped inline crypto keys)
Merging libata/for-next (f07f2b3fecac dt-bindings: ata: Convert ti,dm816-ah=
ci to DT schema)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (eb68ba4af6da mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (6103b87af895 mfd: sm501: Remove unused sm501_find=
_clock)
Merging backlight/for-backlight-next (e12d3e1624a0 backlight: pm8941: Add N=
ULL check in wled_configure())
Merging battery/for-next (b1d8766052eb power: supply: rt9471: Simplify defi=
nition of some struct linear_range)
Merging regulator/for-next (1f3e26effeeb Merge remote-tracking branch 'regu=
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
Merging smack/next (a158a937d864 smack: recognize ipv4 CIPSO w/o categories)
Merging tomoyo/master (e9ddb37834eb tomoyo: update mailing lists)
Merging tpmdd/next (4448bb4bff76 tpm_crb: ffa_tpm: fix/update comments desc=
ribing the CRB over FFA ABI)
Merging watchdog/master (9bc64d338b0b watchdog: sunxi_wdt: Add support for =
Allwinner A523)
Merging iommu/next (e5609ec5d325 Merge branches 'fixes', 'apple/dart', 'med=
iatek', 'renesas/ipmmu', 's390', 'amd/amd-vi' and 'core' into next)
Merging audit/next (654d61b8e0e2 audit: record AUDIT_ANOM_* events regardle=
ss of presence of rules)
Merging devicetree/for-next (d8a9ea5d3beb media: dt-bindings: renesas,vsp1:=
 add top-level constraints)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging dt-krzk/for-next (78c8129aa236 Merge branches 'next/dt', 'next/dt64=
' and 'next/soc-drivers' into for-next)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging mailbox/for-next (1ec12fd31ecc mailbox: Remove unneeded semicolon)
Merging spi/for-next (7b9b091c2af9 Merge remote-tracking branch 'spi/for-6.=
16' into spi-next)
Merging tip/master (a55dcafdb33e Merge branch into tip/master: 'x86/sgx')
CONFLICT (content): Merge conflict in arch/loongarch/kernel/entry.S
CONFLICT (content): Merge conflict in arch/x86/Kconfig.assembler
CONFLICT (content): Merge conflict in arch/x86/mm/pat/memtype.c
CONFLICT (content): Merge conflict in drivers/cpufreq/amd-pstate.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/wangxun/txgbe/tx=
gbe_irq.c
Applying: fix up for "x86/platform/amd: Move the <asm/amd_nb.h> header to <=
asm/amd/nb.h>"
Merging edac/edac-for-next (4521b86e4a6e Merge ras/edac-urgent into for-nex=
t)
Merging ftrace/for-next (7b382efd5e8a tracing: Allow the top level trace_ma=
rker to write into another instances)
Merging rcu/next (131d2b2075fd Merge branches 'rcu/misc-for-6.16', 'rcu/seq=
-counters-for-6.16' and 'rcu/torture-for-6.16' into rcu/for-next)
Merging paulmck/non-rcu/next (e55dc2e5b2e3 Merge branches 'lkmm.2025.04.22a=
' and 'ratelimit.2025.05.08a' into HEAD)
Merging kvm/next (45eb29140e68 Merge branch 'kvm-fixes-6.15-rc4' into HEAD)
CONFLICT (content): Merge conflict in arch/x86/kvm/vmx/vmx.c
Merging kvm-arm/next (4b1119fc4e72 Merge branch kvm-arm64/fgt-masks into kv=
marm-master/next)
Merging kvms390/next (0c7fbae5bc78 KVM: s390: Don't use %pK through debug p=
rinting)
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (87ec7d5249bb KVM: RISC-V: reset smstateen=
 CSRs)
Merging kvm-x86/next (19040824931b Merge branches 'fixes', 'misc', 'mmu', '=
pir', 'selftests', 'svm' and 'vmx')
Merging xen-tip/linux-next (1f0304dfd9d2 xenbus: Use kref to track req life=
time)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (23227e71b69a workqueue: fix typo in comment)
Merging sched-ext/for-next (a6d8c4bc4495 Merge branch 'for-6.16' into for-n=
ext)
Merging drivers-x86/for-next (9f080c9f2099 platform/x86/tuxedo: Prevent inv=
alid Kconfig state)
CONFLICT (content): Merge conflict in drivers/platform/x86/intel/speed_sele=
ct_if/isst_if_common.c
$ git reset --hard HEAD^
Merging next-20250514 version of drivers-x86
CONFLICT (content): Merge conflict in drivers/platform/x86/asus-wmi.c
CONFLICT (content): Merge conflict in drivers/platform/x86/dell/alienware-w=
mi-wmax.c
CONFLICT (content): Merge conflict in drivers/platform/x86/intel/speed_sele=
ct_if/isst_if_common.c
[master a9fa7bc073ef] next-20250514/drivers-x86
Merging chrome-platform/for-next (3e552ccf405c platform/chrome: kunit: Avoi=
d -Wflex-array-member-not-at-end)
Merging chrome-platform-firmware/for-firmware-next (0af2f6be1b42 Linux 6.15=
-rc1)
Merging hsi/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging leds-lj/for-leds-next (6a09ae828198 leds: flash: Add support for fl=
ash/strobe duration)
Merging ipmi/for-next (fa332f5dc6fc ipmi:msghandler: Fix potential memory c=
orruption in ipmi_create_user())
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
Merging coresight/next (3b0b40d8f210 Documentation: coresight: Document AUX=
 pause and resume)
Merging fastrpc/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga/for-next (6ebf1982038a fpga: fix potential null pointer deref =
in fpga_mgr_test_img_load_sgt())
Merging icc/icc-next (a0a532d59b8f Merge branch 'icc-sa8775p' into icc-next)
Merging iio/togreg (d820bea88e27 iio: pressure: zpa2326_spi: remove bits_pe=
r_word =3D 8)
CONFLICT (content): Merge conflict in drivers/iio/adc/ad7606.c
Merging phy-next/next (0c2228731974 phy: tegra: p2u: Broaden architecture d=
ependency)
CONFLICT (content): Merge conflict in drivers/phy/renesas/phy-rcar-gen3-usb=
2.c
CONFLICT (content): Merge conflict in drivers/phy/rockchip/phy-rockchip-sam=
sung-hdptx.c
Merging soundwire/next (62ada17a6217 soundwire: only compute port params in=
 specific stream states)
Merging extcon/extcon-next (c2aeb8647e53 extcon: Add basic support for Maxi=
m MAX14526 MUIC)
Merging gnss/gnss-next (9c32cda43eb7 Linux 6.15-rc3)
Merging vfio/next (860be250fc32 vfio/pci: Handle INTx IRQ_NOTCONNECTED)
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
Merging cgroup/for-next (a7e10091f3ad Merge branch 'for-6.16' into for-next)
Merging scsi/for-next (e6ee56b019da Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (8f9c9384cde8 scsi: ufs: core: Support updating d=
evice command timeout)
Merging vhost/linux-next (1f69fe75a328 vhost-scsi: log event queue write de=
scriptors)
Merging rpmsg/for-next (c0560805744e Merge branches 'rpmsg-fixes', 'rpmsg-n=
ext', 'rproc-fixes' and 'rproc-next' into for-next)
Merging gpio-brgl/gpio/for-next (1275c70c4c1c dt-bindings: gpio: tegra186: =
Add gpio-ranges)
Merging gpio-intel/for-next (a02af05f41c7 Merge patch series "gpiolib: acpi=
: Fix missing info filling")
Merging pinctrl/for-next (8f5a1cb2e8aa Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging pinctrl-renesas/renesas-pinctrl (5488aa013e9e pinctrl: renesas: rzg=
2l: Add support for RZ/V2N SoC)
Merging pinctrl-samsung/for-next (a30692b4f81b pinctrl: samsung: Add filter=
 selection support for alive bank on gs101)
Merging pwm/pwm/for-next (25ac4834cae9 pwm: Tidyup PWM menu for Renesas)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging ktest/for-next (5a1bed232781 ktest: Fix Test Failures Due to Missin=
g LOG_FILE Directories)
Merging kselftest/next (1efe2022286d selftests/timens: timerfd: Use correct=
 clockid type in tclock_gettime())
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
Merging seccomp/for-next/seccomp (73989c998814 selftests/seccomp: fix negat=
ive_ENOSYS tracer tests on arm32)
Merging slimbus/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging nvmem/for-next (a5d9b82ff4ed Merge branch 'nvmem-for-6.16' into nvm=
em-for-next)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (970d87c1c6d2 Drivers: hv: Remove hv_alloc/free_=
* helpers)
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
Merging cxl/next (128ad8fa385b Documentation: Update the CXL Maturity Map)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (c8e1927e7f7d efi/libstub: Describe missing 'out' paramete=
r in efi_load_initrd)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (1cabeb548de6 Merge branch 'slab/for-6.16/testin=
g' into slab/for-next)
Merging random/master (602c988b7827 prandom: remove next_pseudo_random32)
Merging landlock/next (3039ed432745 landlock: Improve bit operations in aud=
it code)
Merging rust/rust-next (edc5e6e019c9 rust: replace rustdoc references to al=
loc::format)
Merging rust-alloc/alloc-next (771c5a7d9843 rust: alloc: add Vec::insert_wi=
thin_capacity)
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
Merging execve/for-next/execve (11854fe263eb binfmt_elf: Move brk for stati=
c PIE even if ASLR disabled)
Merging bitmap/bitmap-for-next (895ee6a22e31 topology: make for_each_node_w=
ith_cpus() O(N))
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (f0cd6012c40d Revert "hardening: Disable GCC ran=
dstruct for COMPILE_TEST")
Merging nolibc/for-next (6a25f787912a selftests: harness: Stop using setjmp=
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

--Sig_/S4J/LZR/D26ElcuSF.LkSzt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgluwsACgkQAVBC80lX
0GyMDAf/ebPfF7mhUe9+jfaidweGV/fUmsb+o/djVmGQ7ECRZYKwB9te/BYc8tjx
+RkEiGTMb/DrT2P8HN/uhGpIrRPEi9rGkQMBPCBdd8zMGNrdXSD6ElEQLwhbGbyw
AXtlYGFVWpFEux2vsRhojwQZavgoPb1gP6LmvskS2DmeAOGAiJdCyRKin3DJLoYB
3ldoxHrlUFnPBYBCNfIqpQ9WEqgNpw1i9+S9gPJLmSWh+anUf/FH/QfBuadBzaYN
auzFg1OFOcO3iXdRnbnzViuU78rVF2MaXWRaGu+UxkdYfZAzH6hwD26corBK+InT
bCdTWbqjQRb+vKeDuqkzCGEDtUxg5w==
=zHKX
-----END PGP SIGNATURE-----

--Sig_/S4J/LZR/D26ElcuSF.LkSzt--

