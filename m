Return-Path: <linux-next+bounces-6940-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6BCAC4C45
	for <lists+linux-next@lfdr.de>; Tue, 27 May 2025 12:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79D9816A8DD
	for <lists+linux-next@lfdr.de>; Tue, 27 May 2025 10:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D494B24DCFC;
	Tue, 27 May 2025 10:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hIPSOrLC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE004315C;
	Tue, 27 May 2025 10:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748341959; cv=none; b=PhRmXkOKGLcFo5paNlgCtWSssB6bWmEfp/Vxzsj0lRDxJF/Qc811U/gtfLAfK20E/KlGBJ8ww21MOei809qNCIXgr2PPjY9ZKgRWvXjVeBijq9Dyh/AmD3kC1VFgQq9R4E2Beincal9fa1ARyngA9W4+/UtLl0e/VhIaeauGfyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748341959; c=relaxed/simple;
	bh=b3nMVZgQwaV38TIrAXKq3PzzekdPKHQO8PKUIlK1TqE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aM3yOhOO+5YTYiQmmjAGd8kMQQLrcyI8GL7cbM+hXHb2rt79i1h8i9PO2SV750XNryY432cMCgdqWOKZdz4ot6f1I+WlLh3Y5I4kSrTF8zf720Y2Y5WKBD+T0MIhYIte9cGnQDMdoQVunmrdxFn8p3ZHgKeWinyz8sQy0lQsQ9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hIPSOrLC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748341951;
	bh=Gmn+ozsDfer3NzOTgY8ZFBJ9N3qdrzz3k6KTyRg806g=;
	h=Date:From:To:Cc:Subject:From;
	b=hIPSOrLCCvLZoftjB1i7AOff2FYKKicieOWcsAvy9hgCiotU6jo/Ql1nSB3nhgn7m
	 hoCdoeYQnZ96wZ4sHT0EecRDc3STiiABzQPRW7Xd04T9lnWEiWkkNx/x1ppbmvgA94
	 jmPBRGDOV6msCuZMsjqa9pECcINCEVRli04bFg1P0kz4V4mzm0R1oc74Tib/HaRdB4
	 eQndbtgy+wMhKyt2Zk3fIG5GOZlSgxvHIiMthYzQN7+9mZ81VUHIpbFhJVkWhxIYOj
	 4tLJCH04uwFmLkkFKfKuzjELJ0BfPPLIxmcTanwBMLlmWlcfN7RJ+UoMhjgVoxyZJp
	 PbcTIRy2K1guQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b688b52s5z4wbp;
	Tue, 27 May 2025 20:32:31 +1000 (AEST)
Date: Tue, 27 May 2025 20:32:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 27
Message-ID: <20250527203231.3c6c0b9d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/URdthK36D6XDrZEsJ_u+wIy";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/URdthK36D6XDrZEsJ_u+wIy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250526:

The mailbox tree gained a build failure so I used the version from
next-20250526.

The rust tree gained a build failure so I used the version from
next-20250526.

Non-merge commits (relative to Linus' tree): 10959
 10765 files changed, 509595 insertions(+), 219564 deletions(-)

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
Merging origin/master (3349ada3cffd Merge tag 'powerpc-6.16-1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging fixes/fixes (b3c623b9a94f Merge tag 'thermal-6.15-rc1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging ext4-fixes/fixes (4bbf9020becb Linux 6.13-rc4)
Merging vfs-brauner-fixes/vfs.fixes (7e69dd62bcda Merge patch series "fs/bu=
ffer: misc optimizations")
Merging fscrypt-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging fsverity-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging btrfs-fixes/next-fixes (fc4ed91fb0ec Merge branch 'misc-6.15' into =
next-fixes)
Merging vfs-fixes/fixes (3b5260d12b1f Don't propagate mounts into detached =
trees)
Merging erofs-fixes/fixes (35076d2223c7 erofs: ensure the extra temporary c=
opy is valid for shortened bvecs)
Merging nfsd-fixes/nfsd-fixes (831e3f545b07 Revert "sunrpc: clean cache_det=
ail immediately when flush is written frequently")
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (924577e4f6ca ovl: Fix nested backing fil=
e paths)
Merging bcachefs/for-next (7a1ec63cfc9c bcachefs: Fix missing commit in che=
ck_dirents)
Merging fscrypt/for-next (c07d3aede2b2 fscrypt: add support for hardware-wr=
apped keys)
Merging btrfs/for-next (18e274f43253 Merge branch 'for-next-next-v6.15-2025=
0520' into for-next-20250520)
Merging ceph/master (f452a2204614 ceph: Fix incorrect flush end position ca=
lculation)
Merging cifs/for-next (6c114d418e3d cifs: Fix validation of SMB1 query repa=
rse point response)
Merging configfs/configfs-next (c6b190822459 MAINTAINERS: add configfs Rust=
 abstractions)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (6f8b4788266c dlm: drop SCTP Kconfig dependency)
Merging erofs/dev (b4a29efc5146 erofs: support DEFLATE decompression by usi=
ng Intel QAT)
Merging exfat/dev (46a557694b46 exfat: do not clear volume dirty flag durin=
g sync)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (e56f3c6159f2 Merge unpriviledged fanotify watching.)
Merging ext4/dev (7acd1b315cdc ext4: Add a WARN_ON_ONCE for querying LAST_I=
N_LEAF instead)
Merging f2fs/dev (2c19d65bab04 f2fs: introduce FAULT_VMALLOC)
Merging fsverity/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging fuse/for-next (65107cbe9585 fuse: increase readdir buffer size)
Merging gfs2/for-next (e320050eb75e gfs2: No more gfs2_find_jhead caching)
Merging jfs/jfs-next (5dff41a86377 jfs: fix array-index-out-of-bounds read =
in add_missing_indices)
Merging ksmbd/ksmbd-for-next (d91c0751d0a6 ksmbd: remove unnecessary softde=
p on crc32)
Merging nfs/linux-next (0ff41df1cb26 Linux 6.15)
Merging nfs-anna/linux-next (9084ed79ddaa lsm,nfs: fix memory leak of lsm_c=
ontext)
Merging nfsd/nfsd-next (425364dc49f0 xdrgen: Fix code generated for counted=
 arrays)
Merging ntfs3/master (eeb0819318cc fs/ntfs3: remove ability to change compr=
ession on mounted volume)
Merging orangefs/for-next (4dc784e92d4f orangefs: Convert to use the new mo=
unt API)
Merging overlayfs/overlayfs-next (b87e2318cdaa vfs: change 'struct file *' =
argument to 'const struct file *' where possible)
Merging ubifs/next (2b6d96503255 jffs2: check jffs2_prealloc_raw_node_refs(=
) result in few other places)
Merging v9fs/9p-next (4210030d8bc4 docs: fs/9p: Add missing "not" in cache =
documentation)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (6d444c8db0ac Merge branch 'xfs-6.15-fixes' into for-n=
ext)
CONFLICT (content): Merge conflict in fs/xfs/xfs_super.c
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging vfs-brauner/vfs.all (e22d08229c2f Merge branch 'vfs-6.16.netfs' int=
o vfs.all)
Merging vfs/for-next (1b9892d82b6f Merge branch 'work.automount' into for-n=
ext)
CONFLICT (content): Merge conflict in Documentation/filesystems/porting.rst
Merging mm-hotfixes/mm-hotfixes-unstable (218baee79470 alloc_tag: handle mo=
dule codetag load errors as module load failures)
Merging fs-current (81e91bd407d3 Merge branch 'ovl-fixes' of git://git.kern=
el.org/pub/scm/linux/kernel/git/overlayfs/vfs.git)
Merging kbuild-current/fixes (e0cd396d8998 kbuild: fix typos "module.builti=
n" to "modules.builtin")
Merging arc-current/for-curr (6ab657d8d2a4 ARC: unwind: Use built-in sort s=
wap to reduce code size and improve performance)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (363cd2b81cfd arm64: cpufeature: Move ar=
m64_use_ng_mappings to the .data section to prevent wrong idmap generation)
Merging arm-soc-fixes/arm/fixes (070d04f002dd Merge tag 'mvebu-fixes-6.15-1=
' of https://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into ar=
m/fixes)
Merging davinci-current/davinci/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging drivers-memory-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging sophgo-fixes/fixes (3e6244429ba3 riscv: dts: sophgo: fix DMA data-w=
idth configuration for CV18xx)
Merging sophgo-soc-fixes/soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging m68k-current/for-linus (f440518f379d m68k: defconfig: Update defcon=
figs for v6.15-rc1)
Merging powerpc-fixes/fixes (e3f506b78d92 powerpc/boot: Fix dash warning)
Merging s390-fixes/fixes (05a2538f2b48 s390/pci: Fix duplicate pci_dev_put(=
) in disable_slot() when PF has child VFs)
Merging net/main (f0b50730bdd8 net/mlx5_core: Add error handling inmlx5_que=
ry_nic_vport_qkey_viol_cntr())
Merging bpf/master (b4432656b36e Linux 6.15-rc4)
Merging ipsec/master (0b91fda3a1f0 xfrm: Sanitize marks before insert)
Merging netfilter/main (239af1970bcb llc: fix data loss when reading from a=
 socket in llc_ui_recvmsg())
Merging ipvs/main (239af1970bcb llc: fix data loss when reading from a sock=
et in llc_ui_recvmsg())
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
Merging sound-current/for-linus (534e9cf3782f Merge tag 'asoc-v6.16-2' of h=
ttps://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-next)
Merging sound-asoc-fixes/for-linus (fbd6a836c109 Merge remote-tracking bran=
ch 'asoc/for-6.15' into asoc-linus)
Merging regmap-fixes/for-linus (a5806cd506af Linux 6.15-rc7)
Merging regulator-fixes/for-linus (469a5dcac8ab Merge remote-tracking branc=
h 'regulator/for-6.15' into regulator-linus)
Merging spi-fixes/for-linus (7aba292eb153 spi: spi-fsl-dspi: Reset SR flags=
 before sending a new message)
Merging pci-current/for-linus (1c75392cb7b0 PCI/pwrctrl: Skip creating plat=
form device unless CONFIG_PCI_PWRCTL enabled)
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
Merging input-current/for-linus (ca39500f6af9 Input: synaptics-rmi - fix cr=
ash with unsupported versions of F34)
Merging crypto-current/master (2297554f01df x86/fpu: Fix irq_fpu_usable() t=
o return false during CPU onlining)
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
Merging drivers-x86-fixes/fixes (f2eae58c4428 platform/x86/intel/pmc: Fix A=
rrow Lake U/H NPU PCI ID)
Merging samsung-krzk-fixes/fixes (dd303e021996 soc: samsung: usi: prevent w=
rong bits inversion during unconfiguring)
Merging pinctrl-samsung-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging devicetree-fixes/dt/linus (d5f49921707c dt-bindings: soc: fsl: fsl,=
ls1028a-reset: Fix maintainer entry)
Merging dt-krzk-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging scsi-fixes/fixes (e8007fad5457 scsi: sd_zbc: block: Respect bio vec=
tor limits for REPORT ZONES buffer)
Merging drm-fixes/drm-fixes (0ff41df1cb26 Linux 6.15)
Merging drm-intel-fixes/for-linux-next-fixes (0ff41df1cb26 Linux 6.15)
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
Merging spdx/spdx-linus (59c11a7a9a13 LICENSES: add CC0-1.0 license text)
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
Merging tip-fixes/tip/urgent (0ff41df1cb26 Linux 6.15)
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
Merging drm-misc-fixes/for-linux-next-fixes (03bcbbb3995b dummycon: Trigger=
 redraw when switching consoles with deferred takeover)
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (200577f69f29 memcg: objcg stock trylock withou=
t irq disabling)
Merging mm-nonmm-stable/mm-nonmm-stable (c164679bed3a scripts/gdb/symbols: =
determine KASLR offset on s390 during early boot)
Merging mm-unstable/mm-unstable (2d767343a77e mm/damon/Kconfig: enable CONF=
IG_DAMON by default)
Merging mm-nonmm-unstable/mm-nonmm-unstable (1ccd55eee43c llist: make llist=
_add_batch() a static inline)
Merging kbuild/for-next (40617439d572 docs/core-api/symbol-namespaces: drop=
 table of contents and section numbering)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (628e124404b3 perf tests switch-tracking: Fix =
timestamp comparison)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (3ee7d9496342 docs: core-api: docu=
ment the IOVA-based API)
Merging asm-generic/master (582847f97024 Makefile.kcov: apply needed compil=
er option unconditionally in CFLAGS_KCOV)
Merging alpha/alpha-next (1523226edda5 alpha: Use str_yes_no() helper in pc=
i_dac_dma_supported())
Merging arm/for-next (96e0b3558830 ARM: 9447/1: arm/memremap: fix arch_memr=
emap_can_ram_remap())
Merging arm64/for-next/core (1c1abfd151c8 Merge branches 'for-next/acpi', '=
for-next/cpufeature', 'for-next/efi', 'for-next/entry', 'for-next/fixes', '=
for-next/misc', 'for-next/mm', 'for-next/perf', 'for-next/psci', 'for-next/=
selftests', 'for-next/sme-fixes' and 'for-next/vdso' into for-next/core)
CONFLICT (content): Merge conflict in arch/arm64/kernel/image-vars.h
Merging arm-perf/for-next/perf (8c138a189f6d perf/arm-cmn: Add CMN S3 ACPI =
binding)
Merging arm-soc/for-next (827845769515 Merge branch 'soc/late' into for-nex=
t)
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
Merging samsung-krzk/for-next (51e8e732a06c Merge branch 'for-v6.16/mux-var=
ious' into for-next)
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
Merging clk/clk-next (ec1d8b9864b0 Merge branch 'clk-rockchip' into clk-nex=
t)
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
Merging microblaze/next (52b70e5b605c microblaze: Use of_property_present()=
 for non-boolean properties)
Merging mips/mips-next (ab535361efdf MIPS: SMP: Move the AP sync point befo=
re the calibration delay)
Merging openrisc/for-next (f698ee1f4003 dt-bindings: interrupt-controller: =
Convert openrisc,ompic to DT schema)
Merging parisc-hd/for-next (7cbb015e2d3d parisc: fix building with gcc-15)
Merging powerpc/next (8682a5749a3d MAINTAINERS: powerpc: Remove myself as a=
 reviewer)
Merging risc-v/for-next (1a3f6980889d Merge patch series "riscv: Add vendor=
 extensions support for SiFive")
Merging riscv-dt/riscv-dt-for-next (d50108706a63 riscv: dts: starfive: jh71=
10-common: bootph-pre-ram hinting needed by boot loader)
Merging riscv-soc/riscv-soc-for-next (59986662d2f4 Merge branch 'riscv-cach=
e-for-next' into riscv-soc-for-next)
Merging s390/for-next (13a85e690e37 Merge branch 'features' into for-next)
Merging sh/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (e619e18ed462 um: Remove legacy network transport infrastr=
ucture)
Merging xtensa/xtensa-for-next (3d6d238851df arch: xtensa: defconfig: Drop =
obsolete CONFIG_NET_CLS_TCINDEX)
Merging fs-next (ac4ec7b4fbb2 Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
CONFLICT (content): Merge conflict in fs/fuse/file.c
Merging printk/for-next (9827cd0d6498 Merge branch 'for-6.15-printf-attribu=
te' into for-next)
Merging pci/next (e07c193b4728 Merge branch 'pci/misc')
Merging pstore/for-next/pstore (d679c2e1e8d9 pstore/zone: rewrite some comm=
ents for better understanding)
Merging hid/for-next (5e9f050d085e Merge branch 'for-6.16/core' into for-ne=
xt)
Merging i2c/i2c/for-next (1ae2791f469b Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging i2c-host/i2c/i2c-host (a088ce22c118 i2c: mlxbf: avoid 64-bit divisi=
on)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging i3c/i3c/next (00286d7d643d i3c: controllers do not need to depend o=
n I3C)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (46d40b2479ab doc: hwmon: acpi_power_meter=
: Add information about enabling the power capping feature.)
Merging jc_docs/docs-next (d6d886005d32 Docs: doc-guide: update sphinx.rst =
Sphinx version number)
Merging v4l-dvb/next (5e1ff2314797 media: rkvdec: h264: Support High 10 and=
 4:2:2 profiles)
CONFLICT (content): Merge conflict in drivers/media/i2c/ds90ub960.c
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (b7ed8a4b0957 Merge branch 'pm-cpufreq-next' into lin=
ux-next)
CONFLICT (content): Merge conflict in rust/bindings/bindings_helper.h
CONFLICT (content): Merge conflict in rust/kernel/lib.rs
Merging cpufreq-arm/cpufreq/arm/linux-next (6c9bb8692272 cpufreq: scmi: Ski=
p SCMI devices that aren't used by the CPUs)
Merging cpupower/cpupower (753feb585a99 cpupower: Allow control of boost fe=
ature on non-x86 based systems with boost support.)
Merging devfreq/devfreq-next (3de6497b9b1b PM / devfreq: sun8i-a33-mbus: Si=
mplify by using more devm functions)
Merging pmdomain/next (36795548dcc8 pmdomain: ti: Fix STANDBY handling of P=
ER power domain)
Merging opp/opp/linux-next (03eadcbd981b OPP: switch to use kmemdup_array())
Merging thermal/thermal/linux-next (e23cba0ab49a thermal/drivers/airoha: Fi=
x spelling mistake)
Merging rdma/for-next (92a251c3df8e RDMA/cma: Fix hang when cma_netevent_ca=
llback fails to queue_work)
Merging net-next/main (5bccdc51f90c replace strncpy with strscpy_pad)
CONFLICT (content): Merge conflict in MAINTAINERS
CONFLICT (content): Merge conflict in net/unix/af_unix.c
Merging bpf-next/for-next (934d567b14aa Merge branch 'bpf-next/master' into=
 for-next)
Merging ipsec-next/master (e7a37c9e428a xfrm: use kfree_sensitive() for SA =
secret zeroization)
Merging mlx5-next/mlx5-next (f550694e88b7 net/mlx5: Add IFC bits for PPCNT =
recovery counters group)
Merging netfilter-next/main (3e52667a9c32 Merge branch 'lan78xx-phylink-pre=
p')
Merging ipvs-next/main (3e52667a9c32 Merge branch 'lan78xx-phylink-prep')
Merging bluetooth/master (2ab3abab237b Bluetooth: MGMT: reject malformed HC=
I_CMD_SYNC commands)
Merging wireless-next/for-next (ea15e046263b Merge tag 'wireless-next-2025-=
05-22' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless=
-next)
Merging ath-next/for-next (ed73728fd14e Merge tag 'mt76-next-2025-05-21' of=
 https://github.com/nbd168/wireless)
Merging iwlwifi-next/next (379f7682d062 wifi: iwlwifi: mld: allow 2 ROCs on=
 the same vif)
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (0aa7b390fc40 mtd: core: always create master device)
Merging nand/nand/next (3bfb22cecfe6 mtd: rawnand: brcmnand: legacy exec_op=
 implementation)
Merging spi-nor/spi-nor/next (594c8df92b94 mtd: spi-nor: macronix: Add fixu=
ps for MX25L3255E)
Merging crypto/master (2297554f01df x86/fpu: Fix irq_fpu_usable() to return=
 false during CPU onlining)
Merging drm/drm-next (f8bb3ed31979 drm/nouveau/tegra: Fix error pointer vs =
NULL return in nvkm_device_tegra_resource_addr())
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
Merging drm-misc/for-linux-next (4673dec88da8 drm/panel: nt37801: Fix IS_ER=
R() vs NULL check in probe())
Merging amdgpu/drm-next (e485502c37b0 Revert "drm/amd: Keep display off whi=
le going into S4")
Merging drm-intel/for-linux-next (7d476f18abeb drm/i915/dp: Fix the enablin=
g/disabling of audio SDP splitting)
Merging drm-msm/msm-next (fc5c669c902c dt-bindings: display: msm: correct e=
xample in SM8350 MDSS schema)
Merging drm-msm-lumag/msm-next-lumag (fc5c669c902c dt-bindings: display: ms=
m: correct example in SM8350 MDSS schema)
Merging drm-nova/nova-next (276c53c66e03 gpu: drm: nova: select AUXILIARY_B=
US instead of depending on it)
Merging drm-xe/drm-xe-next (20a07782dacf drm/xe/vf: Fail migration recovery=
 if fixups needed but platform not supported)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_pt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_svm.c
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (54067cfc1efe fbdev: core: fbcvt: avoid division by =
0 in fb_cvt_hperiod())
Merging regmap/for-next (b3614a5bf621 Merge remote-tracking branch 'regmap/=
for-6.16' into regmap-next)
Merging sound/for-next (534e9cf3782f Merge tag 'asoc-v6.16-2' of https://gi=
t.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-next)
Merging ieee1394/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging sound-asoc/for-next (fbd6a836c109 Merge remote-tracking branch 'aso=
c/for-6.15' into asoc-linus)
Merging modules/modules-next (a0b018a495a3 module: Remove outdated comment =
about text_size)
Merging input/next (21597378dd51 Input: atkbd - do not reset keyboard by de=
fault on Loongson)
Merging block/for-next (efe615cd8823 Merge branch 'for-6.16/block' into for=
-next)
Merging device-mapper/for-next (050a3e71ce24 dm mpath: replace spin_lock_ir=
qsave with spin_lock_irq)
Merging libata/for-next (a374cfbf6090 ata: libata-eh: Keep DIPM disabled wh=
ile modifying the allowed LPM states)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (d2c6acff6386 dt-bindings: mmc: sdhci-of-dwcmhsc: Allow us=
e of a power-domain)
Merging mfd/for-mfd-next (a4d156c491a2 mfd: maxim: Correct Samsung "Electro=
nics" spelling in copyright headers)
Merging backlight/for-backlight-next (e12d3e1624a0 backlight: pm8941: Add N=
ULL check in wled_configure())
Merging battery/for-next (b1d8766052eb power: supply: rt9471: Simplify defi=
nition of some struct linear_range)
Merging regulator/for-next (469a5dcac8ab Merge remote-tracking branch 'regu=
lator/for-6.15' into regulator-linus)
Merging security/next (74e5b13a1b0f lsm: Move security_netlink_send to unde=
r CONFIG_SECURITY_NETWORK)
Merging apparmor/apparmor-next (1fdb22c54a5f apparmor: mitigate parser gene=
rating large xtables)
Merging integrity/next-integrity (fe3aebf27dc1 ima: do not copy measurement=
 list to kdump kernel)
CONFLICT (content): Merge conflict in kernel/kexec_file.c
Merging selinux/next (05f1a939225e selinux: fix the kdoc header for task_av=
dcache_update)
Merging smack/next (4b59f4fd0a36 security/smack/smackfs: small kernel-doc f=
ixes)
Merging tomoyo/master (e9ddb37834eb tomoyo: update mailing lists)
Merging tpmdd/next (ecc1ca9185c3 tpm_crb: ffa_tpm: fix/update comments desc=
ribing the CRB over FFA ABI)
Merging watchdog/master (d01e2d096eaa watchdog: iTCO_wdt: Update the heartb=
eat value after clamping timeout)
Merging iommu/next (879b141b7cfa Merge branches 'fixes', 'apple/dart', 'arm=
/smmu/updates', 'arm/smmu/bindings', 'fsl/pamu', 'mediatek', 'renesas/ipmmu=
', 's390', 'intel/vt-d', 'amd/amd-vi' and 'core' into next)
Merging audit/next (654d61b8e0e2 audit: record AUDIT_ANOM_* events regardle=
ss of presence of rules)
Merging devicetree/for-next (70a299ed2e03 dt-bindings: display: rockchip: C=
onvert cdn-dp-rockchip.txt to yaml)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging dt-krzk/for-next (78c8129aa236 Merge branches 'next/dt', 'next/dt64=
' and 'next/soc-drivers' into for-next)
Merging mailbox/for-next (e87e3f289417 mailbox: mtk-cmdq: Add driver data t=
o support for MT8196)
$ git reset --hard HEAD^
Merging next-20250526 version of mailbox
Merging spi/for-next (6bb24ec0fdfb Merge remote-tracking branch 'spi/for-6.=
16' into spi-next)
Merging tip/master (f22368a9e2e8 Merge branch into tip/master: 'x86/sgx')
CONFLICT (content): Merge conflict in arch/loongarch/kernel/entry.S
CONFLICT (content): Merge conflict in arch/x86/Kconfig.assembler
CONFLICT (content): Merge conflict in arch/x86/mm/pat/memtype.c
CONFLICT (content): Merge conflict in drivers/cpufreq/amd-pstate.c
CONFLICT (content): Merge conflict in drivers/idle/intel_idle.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/wangxun/txgbe/tx=
gbe_irq.c
CONFLICT (content): Merge conflict in drivers/pci/controller/pcie-apple.c
CONFLICT (content): Merge conflict in drivers/pci/pci.h
CONFLICT (content): Merge conflict in fs/bcachefs/clock.c
CONFLICT (content): Merge conflict in tools/arch/x86/include/asm/cpufeature=
s.h
Applying: fix up for "x86/platform/amd: Move the <asm/amd_nb.h> header to <=
asm/amd/nb.h>"
Merging clockevents/timers/drivers/next (d204e391a0d8 clocksource/drivers/r=
enesas-ostm: Unconditionally enable reprobe support)
Merging edac/edac-for-next (855b5de2e562 Merge ras/edac-drivers into for-ne=
xt)
Merging ftrace/for-next (4716b1fedda2 Merge bootconfig/for-next)
CONFLICT (content): Merge conflict in include/trace/events/tcp.h
Merging rcu/next (9c80e4433798 Merge branches 'rcu/misc-for-6.16', 'rcu/seq=
-counters-for-6.16' and 'rcu/torture-for-6.16' into rcu/for-next)
Merging paulmck/non-rcu/next (e55dc2e5b2e3 Merge branches 'lkmm.2025.04.22a=
' and 'ratelimit.2025.05.08a' into HEAD)
Merging kvm/next (e9f17038d814 x86/tdx: mark tdh_vp_enter() as __flatten)
CONFLICT (content): Merge conflict in arch/x86/kvm/vmx/vmx.c
Merging kvm-arm/next (514f3f81195a arm64: sysreg: Drag linux/kconfig.h to w=
ork around vdso build issue)
Merging kvms390/next (7f6f80f4072b KVM: s390: simplify and move pv code)
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (7917be170928 RISC-V: KVM: lock the correc=
t mp_state during reset)
Merging kvm-x86/next (3f7b307757ec Merge branches 'fixes', 'misc', 'mmu', '=
pir', 'selftests', 'svm' and 'vmx')
Merging xen-tip/linux-next (7f9bbc1140ff xen/arm: call uaccess_ttbr0_enable=
 for dm_op hypercall)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (23227e71b69a workqueue: fix typo in comment)
Merging sched-ext/for-next (7a4f9ed91740 Merge branch 'for-6.16' into for-n=
ext)
Merging drivers-x86/for-next (9c96808f10d8 thermal/drivers/acerhdf: Constif=
y struct thermal_zone_device_ops)
CONFLICT (content): Merge conflict in drivers/platform/x86/intel/speed_sele=
ct_if/isst_if_common.c
Applying: fix up for "platform/x86/amd/hsmp: Report power via hwmon sensors"
Merging chrome-platform/for-next (3e552ccf405c platform/chrome: kunit: Avoi=
d -Wflex-array-member-not-at-end)
Merging chrome-platform-firmware/for-firmware-next (0af2f6be1b42 Linux 6.15=
-rc1)
Merging hsi/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging leds-lj/for-leds-next (b338a2ae9b31 leds: tps6131x: Add support for=
 Texas Instruments TPS6131X flash LED driver)
Merging ipmi/for-next (08effa6b77f7 docs: ipmi: fix spelling and grammar mi=
stakes)
Merging driver-core/driver-core-next (071d8e4c2a3b kernfs: Relax constraint=
 in draining guard)
Merging usb/usb-next (882826f58b2c ALSA: usb-audio: qcom: fix USB_XHCI depe=
ndency)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging thunderbolt/next (36f6f7e2d4d0 Documentation/admin-guide: Document =
Thunderbolt/USB4 tunneling events)
Merging usb-serial/usb-next (d3a889482bd5 USB: serial: pl2303: add new chip=
 PL2303GC-Q20 and PL2303GT-2AB)
Merging tty/tty-next (b495021a973e tty: serial: 8250_omap: fix TX with DMA =
for am33xx)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/ser=
ial/snps-dw-apb-uart.yaml
Merging char-misc/char-misc-next (9857af0fcff3 binder: fix yet another UAF =
in binder_devices)
Applying: uio_hv_generic: constify bin_attribute definitions
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (408c97c4a5e0 coresight: prevent deactivate active c=
onfig while enabling the config)
Merging fastrpc/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga/for-next (6ebf1982038a fpga: fix potential null pointer deref =
in fpga_mgr_test_img_load_sgt())
Merging icc/icc-next (5fed7fe33c2c Merge branch 'icc-sa8775p' into icc-next)
Merging iio/togreg (0c86e3381978 dt-bindings: iio: adc: Add ROHM BD79100G)
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
Merging vfio/next (4518e5a60c7f vfio/type1: Fix error unwind in migration d=
irty bitmap allocation)
Merging w1/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging spmi/spmi-next (02a0fd9c0c40 irqdomain: spmi: Switch to irq_domain_=
create_tree())
Merging staging/staging-next (a481f0ebf213 staging: rtl8723bs: remove unnec=
essary braces for single statement blocks)
Merging counter-next/counter-next (ae3392c0f12f counter: microchip-tcb-capt=
ure: Add watch validation support)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (3c018bf5a0ee dmaengine: idxd: Remove unused pointer=
 and macro)
Merging cgroup/for-next (089844ffdb39 Merge branch 'for-6.16' into for-next)
CONFLICT (content): Merge conflict in mm/memcontrol.c
Merging scsi/for-next (a11013da06f1 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (fd2963e729ed scsi: target: core: Constify struct=
 target_opcode_descriptor)
Merging vhost/linux-next (8adc93f9c343 drm/virtio: implement virtio_gpu_shu=
tdown)
Merging rpmsg/for-next (dc8417021bcd Merge branches 'rpmsg-next', 'rproc-fi=
xes' and 'rproc-next' into for-next)
Merging gpio-brgl/gpio/for-next (8b8ef309093f gpio: timberdale: select GPIO=
LIB_IRQCHIP)
Merging gpio-intel/for-next (ec0c0aab1524 gpiolib-acpi: Update file referen=
ces in the Documentation and MAINTAINERS)
Merging pinctrl/for-next (a08b2b34239e Merge branch 'devel' into for-next)
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
Merging kunit-next/kunit (772e50a76ee6 kunit: Fix wrong parameter to kunit_=
deactivate_static_stub())
Merging livepatching/for-next (a8e905a819fd Merge branch 'for-6.15/ftrace-t=
est' into for-next)
Merging rtc/rtc-next (c7622a4e44d9 rtc: m41t80: reduce verbosity)
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
Merging hyperv/hyperv-next (96959283a58d Drivers: hv: Always select CONFIG_=
SYSFB for Hyper-V guests)
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
Merging cxl/next (9f153b7fb5ae Merge branch 'for-6.16/cxl-features-ras' int=
o cxl-for-next)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (46550e2b878d include: pe.h: Fix PE definitions)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (7819d7e0d830 Merge branch 'slab/for-6.16/testin=
g' into slab/for-next)
Merging random/master (602c988b7827 prandom: remove next_pseudo_random32)
Merging landlock/next (3039ed432745 landlock: Improve bit operations in aud=
it code)
Merging rust/rust-next (bfc3cd87559b Documentation: rust: testing: add docs=
 on the new KUnit `#[test]` tests)
CONFLICT (content): Merge conflict in rust/bindings/bindings_helper.h
CONFLICT (content): Merge conflict in rust/kernel/task.rs
CONFLICT (content): Merge conflict in rust/macros/module.rs
Applying: fix up for conflict against drm-nova
Applying: fixup for conflict with the mm-unstable tree
Applying: fix up for conflict with cpufreq-arm tree
$ git reset --hard HEAD^
Merging next-20250526 version of rust
CONFLICT (content): Merge conflict in rust/bindings/bindings_helper.h
CONFLICT (content): Merge conflict in rust/kernel/task.rs
CONFLICT (content): Merge conflict in rust/macros/module.rs
[master 102c61254a10] next-20250526/rust
Applying: fix up for conflict against drm-nova
[master 29ddbf6e503e] next-20250526/rust
Applying: fixup for conflict with the mm-unstable tree
[master aaff7b5f9e20] next-20250526/rust
Applying: fix up for conflict with cpufreq-arm tree
[master a1d2b92d90df] next-20250526/rust
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
Merging kspp/for-next/kspp (f0cd6012c40d Revert "hardening: Disable GCC ran=
dstruct for COMPILE_TEST")
Merging nolibc/for-next (869c788909b9 selftests: harness: Stop using setjmp=
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

--Sig_/URdthK36D6XDrZEsJ_u+wIy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg1lL8ACgkQAVBC80lX
0GwuEQf/XIenB/FyT6wdIwSz0sAR0FDmxY2RCP+vlhDKx6Ci965SOAamAO+2ysWl
5J9KibKVowPmBRaIiNdPOb6r7+E5LR0iYosgJcxta9sCBuIiH6LcQOvHe8ptuVPq
QfbkRYfuhppRED0/pjd2UUDd8GDTPRdVbiP6yhXFyLvqwJ+PBk/p5KJtcqmQuE/w
eV+Cl80CJcoObJ6ANnA86tauHKKhGTS2jl6o/TCrJC2JwstLUzOD8eJWUik6Y9Vy
5avKAIkQp8XhXex3aBnz3q9i4fhEx2lQ/UlY2NIPyBQ6ikv0cQaFZp6JkQnxdRmB
uVg+bgWl6c/IYshMYkWlNai1Izj7Cg==
=Elh7
-----END PGP SIGNATURE-----

--Sig_/URdthK36D6XDrZEsJ_u+wIy--

