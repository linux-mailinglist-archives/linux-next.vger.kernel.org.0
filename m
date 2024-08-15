Return-Path: <linux-next+bounces-3328-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0F695289D
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2024 06:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D0B8281A37
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2024 04:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B981D39AE3;
	Thu, 15 Aug 2024 04:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iFF37X8Y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65902CA5;
	Thu, 15 Aug 2024 04:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723696847; cv=none; b=Is3VZGB/+TTzJBETKC3lawUp/+Z6S9ebYXxL91RqrBT45hK5mp3wt/OgfBP+t6zCgmmP5rVD5WtrREnK/1vndTMxNwzX1zIstX3tX+R7c9UHpFA5E3KoMXqIKbijsf2GaBPV4izZp+E8TZdZpEclIHIyn1bDOwNXf+C7TwcMvR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723696847; c=relaxed/simple;
	bh=KKj7Nl3ohfrSzPzAejp9+yQF5oI3H7/i76QfH5kfwzk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fKI+u44S+/1LZa9zMVWg8KA2tPiwcZUFtpXE/BL1m/3DGjypdne4P5Z8dTzsS+VSxn0p2eBxUUn6WK+E4SuHc2J74ptA6Bjz5OznXMSPisBv3IJbPTj0JHt269veEC2smGbRAhNxqc0TKxoA1eDsMXQEnPAJvGjUgSxS2/gIzMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iFF37X8Y; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723696837;
	bh=d7StHeXwRGxU0Q2j4rvz/p+K1AQUJGkXLdwaEa/NPN4=;
	h=Date:From:To:Cc:Subject:From;
	b=iFF37X8YWFwN5Vwcx37B7HFEnU+u8/rT462I5b6W+or6F4qOhpEbYS+XwQqS4BCdW
	 rbn6nxfQl3W0VecNl946NFdyt4hAMdqo4wo3QafkUqkKJEvQbi3QBc0/NmXLNjxcPc
	 3GRggs/7GlisBq76vX1hmkx1l2WZzp9yvfGqBjOFW5V09pkyc0vfMwp0lMP05E6s1F
	 NmR9lmxI6HSkMJopYUbNXVYL3gCEmPT9sn09hLqnc5EDaboq8qPNcU1ctTajHsWve1
	 UDGrSGL8wWMyV4rrIITOA+8vKJssWyMRHV/5zI9WDxM8X2qQXvmiLonrdHw8q17zZw
	 K9794kgQftlag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wksr53RVwz4x1V;
	Thu, 15 Aug 2024 14:40:37 +1000 (AEST)
Date: Thu, 15 Aug 2024 14:40:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 15
Message-ID: <20240815144036.483f3a8a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/seVi3Ow79q+=Qc8ulPbYoIB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/seVi3Ow79q+=Qc8ulPbYoIB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20240814:

The mm tree lost its build failure but gained others for which I reverted
2 commits and applied a patch.

The risc-v tree gained a conflict against the mm-hotfixes tree.

The net-next tree gained a conflict against the net tree.

The drm-xe tree gained a conflict against the drm-intel tree.

Non-merge commits (relative to Linus' tree): 4335
 4774 files changed, 171179 insertions(+), 83206 deletions(-)

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

I am currently merging 380 trees (counting Linus' and 143 trees of bug
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
Merging origin/master (d07b43284ab3 Merge tag 'for-linus' of git://git.kern=
el.org/pub/scm/virt/kvm/kvm)
Merging vfs-brauner-fixes/vfs.fixes (8b30d568bd8d vfs: drop one lock trip i=
n evict())
Merging fscrypt-current/for-current (256abd8e550c Linux 6.10-rc7)
Merging fsverity-current/for-current (256abd8e550c Linux 6.10-rc7)
Merging btrfs-fixes/next-fixes (2691f6fae726 Merge branch 'misc-6.11' into =
next-fixes)
Merging vfs-fixes/fixes (046667c4d319 memcg_write_event_control(): fix a us=
er-triggerable oops)
Merging erofs-fixes/fixes (cb890c4388d3 erofs: get rid of check_layout_comp=
atibility())
Merging nfsd-fixes/nfsd-fixes (91da337e5d50 nfsd: don't set SVC_SOCK_ANONYM=
OUS when creating nfsd sockets)
Merging v9fs-fixes/fixes/next (0c3836482481 Linux 6.10)
Merging overlayfs-fixes/ovl-fixes (77a28aa47687 ovl: relax WARN_ON in ovl_v=
erify_area())
Merging bcachefs/for-next (a1c681866f29 bcachefs: Remove the prev array stu=
ff)
Merging pidfd/for-next (a901a3568fd2 Merge tag 'iomap-6.5-merge-1' of git:/=
/git.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging fscrypt/for-next (256abd8e550c Linux 6.10-rc7)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (00d7bc683dc6 Merge branch 'for-next-next-v6.11-2024=
0814' into for-next-20240814)
Merging ceph/master (31634d7597d8 ceph: force sending a cap update msg back=
 to MDS for revoke op)
Merging cifs/for-next (022ee3ac4807 smb: smb2pdu.h: Use static_assert() to =
check struct sizes)
Merging configfs/for-next (4425c1d9b44d configfs: improve item creation per=
formance)
Merging dlm/next (652b0ae675fe dlm: add missing -ENOMEM if alloc_workqueue(=
) fails)
Merging erofs/dev (7c626ce4bae1 Linux 6.11-rc3)
Merging exfat/dev (98ad7b9012b5 exfat: Implement sops->shutdown and ioctl)
Merging exportfs/exportfs-next (0c3836482481 Linux 6.10)
Merging ext3/for_next (85f22bb5d2c2 Merge UDF consistency fixes.)
Merging ext4/dev (8400291e289e Linux 6.11-rc1)
Merging f2fs/dev (087713725a12 f2fs: fix to use per-inode maxbytes and clea=
nup)
Merging fsverity/for-next (256abd8e550c Linux 6.10-rc7)
Merging fuse/for-next (529395d2ae64 virtio-fs: add multi-queue support)
Merging gfs2/for-next (6706415bf9f3 Merge tag 'gfs2-v6.10-rc1-fixes' of git=
://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2)
Merging jfs/jfs-next (d0fa70aca54c jfs: don't walk off the end of ealist)
Merging ksmbd/ksmbd-for-next (1151357ce194 ksmbd: fix field-spanning write =
warning from ntlm_negotiate())
Merging nfs/linux-next (7c626ce4bae1 Linux 6.11-rc3)
Merging nfs-anna/linux-next (b9fae9f06d84 SUNRPC: Fixup gss_status tracepoi=
nt error output)
Merging nfsd/nfsd-next (7a23210e0d5e NFSD: remove redundant assignment oper=
ation)
Merging ntfs3/master (8400291e289e Linux 6.11-rc1)
Merging orangefs/for-next (53e4efa470d5 orangefs: fix out-of-bounds fsid ac=
cess)
Merging overlayfs/overlayfs-next (004b8d1491b4 ovl: fix encoding fid for lo=
wer only root)
Merging ubifs/next (92a286e90203 ubi: Fix ubi_init() ubiblock_exit() sectio=
n mismatch)
Merging v9fs/9p-next (2211561723a6 9p: Enable multipage folios)
Merging v9fs-ericvh/ericvh/for-next (0c3836482481 Linux 6.10)
Merging xfs/for-next (4813305c621d xfs: fix handling of RCU freed inodes fr=
om other AGs in xrep_iunlink_mark_incore)
Merging zonefs/for-next (df2f9708ff1f zonefs: enable support for large foli=
os)
Merging file-locks/locks-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6-=
mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging iversion/iversion-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6=
-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging vfs-brauner/vfs.all (a5bc3f003261 Merge branch 'vfs.xattr' into vfs=
.all Signed-off-by: Christian Brauner <brauner@kernel.org>)
CONFLICT (content): Merge conflict in fs/exfat/inode.c
CONFLICT (content): Merge conflict in tools/testing/selftests/core/close_ra=
nge_test.c
Applying: fixup for "fs: Convert aops->write_end to take a folio"
Merging vfs/for-next (a38297e3fb01 Linux 6.9)
Merging fixes/fixes (2dde18cd1d8f Linux 6.5)
Merging mm-hotfixes/mm-hotfixes-unstable (645bc15631c4 nilfs2: fix missing =
cleanup on rollforward recovery error)
Merging fs-current (1feb6b2add6b Merge branch 'fixes' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/xiang/erofs.git)
Merging kbuild-current/fixes (1472464c6248 kbuild: avoid scripts/kallsyms p=
arsing /dev/null)
Merging arc-current/for-curr (e67572cd2204 Linux 6.9-rc6)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (a21dcf0ea856 arm64: ACPI: NUMA: initial=
ize all values of acpi_early_node_map to NUMA_NO_NODE)
Merging arm-soc-fixes/arm/fixes (6b1124c4526f Merge tag 'ti-k3-dt-fixes-for=
-v6.11' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into ar=
m/fixes)
Merging davinci-current/davinci/for-current (6613476e225e Linux 6.8-rc1)
Merging drivers-memory-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging sophgo-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging m68k-current/for-linus (21b9e722ad28 m68k: cmpxchg: Fix return valu=
e for default case in __arch_xchg())
Merging powerpc-fixes/fixes (227bbaabe64b powerpc/topology: Check if a core=
 is online)
Merging s390-fixes/fixes (de9c2c66ad8e Linux 6.11-rc2)
Merging net/main (a2cbb1603943 tcp: Update window clamping condition)
Merging bpf/master (9d5906799f7d Merge tag 'selinux-pr-20240814' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux)
Merging ipsec/master (89a2aefe4b08 xfrm: call xfrm_dev_policy_delete when k=
ill policy)
Merging netfilter/main (bd662c4218f9 netfilter: nf_tables: Add locking for =
NFT_MSG_GETOBJ_RESET requests)
Merging ipvs/main (14ab4792ee12 net/tcp: Disable TCP-AO static key after RC=
U grace period)
Merging wireless/for-next (e37a9184f270 Merge tag 'ath-current-20240812' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath)
Merging ath/for-current (38055789d151 wifi: ath12k: use 128 bytes aligned i=
ova in transmit path for WCN7850)
Merging wpan/master (b8ec0dc3845f net: mac802154: Fix racy device stats upd=
ates by DEV_STATS_INC() and DEV_STATS_ADD())
Merging rdma-fixes/for-rc (8400291e289e Linux 6.11-rc1)
Merging sound-current/for-linus (829e2a23121f ALSA: hda/tas2781: Use correc=
t endian conversion)
Merging sound-asoc-fixes/for-linus (2251db28edcc ASoC: codecs: wcd937x: Fix=
 missing de-assert of reset GPIO)
Merging regmap-fixes/for-linus (e0ee39920027 Merge remote-tracking branch '=
regmap/for-6.10' into regmap-linus)
Merging regulator-fixes/for-linus (7c626ce4bae1 Linux 6.11-rc3)
Merging spi-fixes/for-linus (5d61841c74db spi: zynqmp-gqspi: Scale timeout =
by data size)
Merging pci-current/for-linus (80a2a75a2a9c Merge branch 'controller/qcom' =
into for-linus)
Merging driver-core.current/driver-core-linus (cdd1fa91a6b8 mips: sgi-ip22:=
 Fix the build)
Merging tty.current/tty-linus (c9f6613b1612 tty: atmel_serial: use the corr=
ect RTS flag.)
Merging usb.current/usb-linus (3ed486e383cc usb: misc: ljca: Add Lunar Lake=
 ljca GPIO HID to ljca_gpio_hids[])
Merging usb-serial-fixes/usb-linus (00af4f3dda14 USB: serial: debug: do not=
 echo input by default)
Merging phy/fixes (5af9b304bc60 phy: xilinx: phy-zynqmp: Fix SGMII linkup f=
ailure on resume)
Merging staging.current/staging-linus (8400291e289e Linux 6.11-rc1)
Merging iio-fixes/fixes-togreg (61cbfb5368dd iio: adc: ad7124: fix DT confi=
guration parsing)
Merging counter-current/counter-current (8400291e289e Linux 6.11-rc1)
Merging char-misc.current/char-misc-linus (ccbde4b128ef char: xillybus: Don=
't destroy workqueue from work item running on it)
Merging soundwire-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging thunderbolt-fixes/fixes (e2006140ad2e thunderbolt: Mark XDomain as =
unplugged when router is removed)
Merging input-current/for-linus (206f533a0a7c Input: uinput - reject reques=
ts with unreasonable number of slots)
Merging crypto-current/master (df1e9791998a hwrng: core - remove (un)regist=
er_miscdev())
Merging vfio-fixes/for-linus (5a88a3f67e37 vfio/pci: Init the count variabl=
e in collecting hot-reset devices)
Merging kselftest-fixes/fixes (170c966cbe27 selftests: ksft: Fix finished()=
 helper exit code on skipped tests)
Merging dmaengine-fixes/fixes (b53b831919a0 dmaengine: stm32-dma3: Set lli_=
size after allocation)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (b27d8946b5ed mtd: rawnand: rockchip: ensure NV=
DDR timings are rejected)
Merging mfd-fixes/for-mfd-fixes (68f860426d50 mfd: axp20x: AXP717: Fix miss=
ing IRQ status registers range)
Merging v4l-dvb-fixes/fixes (63de936b513f media: atomisp: Fix streaming no =
longer working on BYT / ISP2400 devices)
Merging reset-fixes/reset/fixes (ab35896730a5 reset: hisilicon: hi6220: add=
 missing MODULE_DESCRIPTION() macro)
Merging mips-fixes/mips-fixes (1cb6ab446424 MIPS: Loongson64: Set timer mod=
e in cpu-probe)
Merging at91-fixes/at91-fixes (e9408fa234fb MAINTAINERS: Update DTS path fo=
r ARM/Microchip (AT91) SoC)
Merging omap-fixes/fixes (5062d9c0cbbc ARM: dts: omap3-n900: correct the ac=
celerometer orientation)
Merging kvm-fixes/master (1c0e5881691a KVM: SEV: uapi: fix typo in SEV_RET_=
INVALID_CONFIG)
Merging kvms390-fixes/master (cff59d8631e1 s390/uv: Panic for set and remov=
e shared access UVC errors)
Merging hwmon-fixes/hwmon (ff7a96571aa7 hwmon: (asus-ec-sensors) remove VRM=
 temp X570-E GAMING)
Merging nvdimm-fixes/libnvdimm-fixes (d5240fa65db0 nvdimm/pmem: Set dax fla=
g for all 'PFN_MAP' cases)
Merging cxl-fixes/fixes (2c402bd2e85b cxl/test: Skip cxl_setup_parent_dport=
() for emulated dports)
Merging dma-mapping-fixes/for-linus (75961ffb5cb3 swiotlb: initialise restr=
icted pool list_head when SWIOTLB_DYNAMIC=3Dy)
Merging drivers-x86-fixes/fixes (bc923d594db2 platform/surface: aggregator:=
 Fix warning when controller is destroyed in probe)
Merging samsung-krzk-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging pinctrl-samsung-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging devicetree-fixes/dt/linus (b739dffa5d57 of/irq: Prevent device addr=
ess out-of-bounds read in interrupt map walk)
Merging dt-krzk-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging scsi-fixes/fixes (8c6b808c8c2a scsi: mpi3mr: Avoid MAX_PAGE_ORDER W=
ARNING for buffer allocations)
Merging drm-fixes/drm-fixes (7c626ce4bae1 Linux 6.11-rc3)
Merging drm-intel-fixes/for-linux-next-fixes (7c626ce4bae1 Linux 6.11-rc3)
Merging mmc-fixes/fixes (9374ae912dbb mmc: mtk-sd: receive cmd8 data when h=
s400 tuning fail)
Merging rtc-fixes/rtc-fixes (8400291e289e Linux 6.11-rc1)
Merging gnss-fixes/gnss-linus (8400291e289e Linux 6.11-rc1)
Merging hyperv-fixes/hyperv-fixes (3b85a2eacd3d Documentation: hyperv: Add =
overview of Confidential Computing VM support)
Merging soc-fsl-fixes/fix (06c2afb862f9 Linux 6.5-rc1)
Merging risc-v-fixes/fixes (ee9a68394b4b riscv: Re-introduce global icache =
flush in patch_text_XXX())
Merging riscv-dt-fixes/riscv-dt-fixes (7d9d88890f04 MAINTAINERS: invert Mis=
c RISC-V SoC Support's pattern)
Merging riscv-soc-fixes/riscv-soc-fixes (8400291e289e Linux 6.11-rc1)
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (a3e18a540541 Merge tag 'xfs-6.10-fixes-3' of git:/=
/git.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging gpio-brgl-fixes/gpio/for-current (aad418323267 gpio: mlxbf3: Suppor=
t shutdown() function)
Merging gpio-intel-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging pinctrl-intel-fixes/fixes (a366e46da10d pinctrl: meteorlake: Add Ar=
row Lake-H/U ACPI ID)
Merging auxdisplay-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging kunit-fixes/kunit-fixes (8400291e289e Linux 6.11-rc1)
Merging memblock-fixes/fixes (8043832e2a12 memblock: use numa_valid_node() =
helper to check for invalid node ID)
Merging renesas-fixes/fixes (8c987693dc2d ARM: dts: renesas: rcar-gen2: Add=
 missing #interrupt-cells to DA9063 nodes)
Merging perf-current/perf-tools (4bbe60029319 perf daemon: Fix the build on=
 32-bit architectures)
Merging efi-fixes/urgent (ae835a96d72c x86/efistub: Revert to heap allocate=
d boot_params for PE entrypoint)
Merging zstd-fixes/zstd-linus (77618db34645 zstd: Fix array-index-out-of-bo=
unds UBSAN warning)
Merging battery-fixes/fixes (7c626ce4bae1 Linux 6.11-rc3)
Merging uml-fixes/fixes (73a23d771033 um: harddog: fix modular build)
Merging iommufd-fixes/for-rc (8400291e289e Linux 6.11-rc1)
Merging rust-fixes/rust-fixes (0eba65f0310d rust: x86: remove `-3dnow{,a}` =
from target features)
Merging w1-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging pmdomain-fixes/fixes (e4e512eedc8b pmdomain: imx: wait SSAR when i.=
MX93 power domain on)
Merging i2c-host-fixes/i2c/i2c-host-fixes (14d069d92951 i2c: tegra: Do not =
mark ACPI devices as irq safe)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (39a3396558fb clk: thead: fix dependency on clk=
_ignore_unused)
Merging pwrseq-fixes/pwrseq/for-current (8400291e289e Linux 6.11-rc1)
Merging thead-dt-fixes/thead-dt-fixes (8400291e289e Linux 6.11-rc1)
Merging drm-misc-fixes/for-linux-next-fixes (497d370a644d drm/v3d: Fix out-=
of-bounds read in `v3d_csd_job_run()`)
Merging mm-stable/mm-stable (7c626ce4bae1 Linux 6.11-rc3)
Merging mm-nonmm-stable/mm-nonmm-stable (7c626ce4bae1 Linux 6.11-rc3)
Merging mm/mm-everything (b2189248fc60 foo)
Applying: Revert "mm/kmemleak: use IS_ERR_PCPU() for pointer in the percpu =
address space"
Applying: Revert "err.h: add ERR_PTR_PCPU(), PTR_ERR_PCPU() and IS_ERR_PCPU=
() functions"
Applying: fix up for "fault-inject: improve build for CONFIG_FAULT_INJECTIO=
N=3Dn"
Merging kbuild/for-next (7809144639f6 kbuild: modinst: remove the multithre=
ad option from zstd compression)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (27ac597c0e2f perf test record.sh: Raise limit=
 of open file descriptors)
Merging compiler-attributes/compiler-attributes (8400291e289e Linux 6.11-rc=
1)
Merging dma-mapping/for-next (bd44ca3de49c dma-debug: avoid deadlock betwee=
n dma debug vs printk and netconsole)
Merging asm-generic/master (b82c1d235a30 syscalls: add back legacy __NR_nfs=
servctl macro)
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (ba954cad0ce7 Merge branches 'clkdev', 'fixes' and 'mi=
sc' into for-next)
Merging arm64/for-next/core (7c626ce4bae1 Linux 6.11-rc3)
Merging arm-perf/for-next/perf (7c626ce4bae1 Linux 6.11-rc3)
Merging arm-soc/for-next (6b1124c4526f Merge tag 'ti-k3-dt-fixes-for-v6.11'=
 of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into arm/fixes)
Merging amlogic/for-next (0c6580c514ec Merge branch 'v6.11/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (ffc253263a13 Linux 6.6)
Merging aspeed/for-next (73feb9cd46f1 ARM: dts: aspeed: System1: Updates to=
 BMC board)
Merging at91/at91-next (870c43904be2 Merge branch 'at91-defconfig' into at9=
1-next)
Merging broadcom/next (643a42808eb5 Merge branch 'soc/next' into next)
Merging davinci/davinci/for-next (8205d5c7463d ARM: davinci: remove unused =
davinci_init_ide() declaration)
Merging drivers-memory/for-next (67dd9e861add memory: tegra186-emc: drop un=
used to_tegra186_emc())
Merging imx-mxs/for-next (1d43464566cd Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (9dd04bf6bf1c Merge branch 'v6.11-next/dts64' int=
o for-next)
Merging mvebu/for-next (ffd0d7df6bdb Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (6cb1ac2b11b2 Merge branch 'omap-for-v6.12/drivers' i=
nto omap-reset)
Merging qcom/for-next (8f2662ff28a1 Merge branches 'arm32-for-6.12', 'arm64=
-defconfig-fixes-for-6.11', 'arm64-fixes-for-6.11', 'arm64-for-6.12', 'clk-=
fixes-for-6.11', 'clk-for-6.12', 'drivers-fixes-for-6.11' and 'drivers-for-=
6.12' into for-next)
Merging renesas/next (3f3b7f43c49a Merge branches 'renesas-arm-defconfig-fo=
r-v6.12' and 'renesas-dts-for-v6.12' into renesas-next)
Merging reset/reset/next (c1267e1afae6 arm64: dts: renesas: rz-smarc: Repla=
ce fixed regulator for USB VBUS)
Merging rockchip/for-next (593d719a2466 Merge branch 'v6.12-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (624c4f217ba7 Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (34ac893dc427 Merge branches 'for-next/juno/upd=
ates', 'for-next/scmi/updates' and 'for-next/ffa/updates' of ssh://gitolite=
.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-linux-next)
Merging sophgo/for-next (d9773e09addd riscv: dts: sophgo: Add i2c device su=
pport for sg2042)
Merging stm32/stm32-next (1eafc48af859 arm64: stm32: enable scmi regulator =
for stm32)
Merging sunxi/sunxi/for-next (2873085a8cd5 arm64: dts: allwinner: h700: Add=
 Anbernic RG35XX-SP)
Merging tee/next (cd88a296582c Merge branch 'optee_notif_wait_timeout_for_v=
6.11' into next)
Merging tegra/for-next (5211d93c551f Merge branch for-6.11/arm64/defconfig =
into for-next)
Merging thead-dt/thead-dt-for-next (2d98fea7491a riscv: dts: thead: change =
TH1520 SPI node to use clock controller)
Merging ti/ti-next (140b0b1e6e77 Merge branches 'ti-drivers-soc-next' and '=
ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (0c559f8a91de drivers: soc: xilinx: add the missing=
 kfree in xlnx_add_cb_for_suspend())
Merging clk/clk-next (96e52588fb2c Merge branch 'clk-mediatek' into clk-nex=
t)
Merging clk-imx/for-next (466da3d2d967 clk: imx: composite-7ulp: Use NULL i=
nstead of 0)
Merging clk-renesas/renesas-clk (42b54d52ecb7 clk: renesas: Add RZ/V2H(P) C=
PG driver)
Merging csky/linux-next (2c40c1c6adab Merge tag 'usb-6.7-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging loongarch/loongarch-next (494b0792d962 LoongArch: KVM: Remove undef=
ined a6 argument comment for kvm_hypercall())
Merging m68k/for-next (21b9e722ad28 m68k: cmpxchg: Fix return value for def=
ault case in __arch_xchg())
Merging m68knommu/for-next (7c626ce4bae1 Linux 6.11-rc3)
Merging microblaze/next (d829e7ee6354 microblaze: Export xmb_manager functi=
ons)
Merging mips/mips-next (8400291e289e Linux 6.11-rc1)
Merging openrisc/for-next (4dc70e1aadfa openrisc: Move FPU state out of pt_=
regs)
Merging parisc-hd/for-next (d173d4d9e831 parisc: Improve monotonic clock_ge=
ttime() resolution on SMP machines)
Merging powerpc/next (fa740ca82277 powerpc: Remove useless config comment i=
n asm/percpu.h)
Merging soc-fsl/next (fb9c384625dd bus: fsl-mc: fsl-mc-allocator: Drop a wr=
ite-only variable)
Merging risc-v/for-next (63dd775cc050 riscv: Enable generic CPU vulnerabili=
tes support)
CONFLICT (content): Merge conflict in kernel/crash_reserve.c
Merging riscv-dt/riscv-dt-for-next (8400291e289e Linux 6.11-rc1)
Merging riscv-soc/riscv-soc-for-next (8400291e289e Linux 6.11-rc1)
Merging s390/for-next (1baaf1ccf111 Merge branch 'features' into for-next)
Applying: fixup for "s390/mm/ptdump: Generate address marker array dynamica=
lly"
Merging sh/for-next (8fe76a1c2264 sh: push-switch: Add missing MODULE_DESCR=
IPTION() macro)
Merging sparc/for-next (a3da15389112 sparc64: Fix prototype warnings in hib=
ernate.c)
Merging uml/next (98ff534ec2cd um: vector: always reset vp->opened)
Merging xtensa/xtensa-for-next (b7cf2a1d9881 xtensa: remove redundant flush=
_dcache_page and ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE macros)
Merging fs-next (b0836ff81eaa Merge branch 'vfs.all' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/vfs/vfs.git)
Merging printk/for-next (bcc954c6caba printk/panic: Allow cpu backtraces to=
 be written into ringbuffer during panic)
Merging pci/next (79b01efa89b2 Merge branch 'pci/controller/affinity')
Merging pstore/for-next/pstore (a7050ca72480 pstore/ramoops: Fix typo as th=
ere is no "reserver")
Merging hid/for-next (047c6a90b836 Merge branch 'for-6.12/elan' into for-ne=
xt)
Merging i2c/i2c/for-next (1c1f79a06dc3 Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i2c-host/i2c/i2c-host (81ca8053244a i2c: imx: Switch to RUNTIME_PM_=
OPS())
Merging i3c/i3c/next (8400291e289e Linux 6.11-rc1)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (1754caf94b8c hwmon: (gsc-hwmon) fix modul=
e autoloading)
Merging jc_docs/docs-next (1f5e3920b5e4 Documentation: dontdiff: remove 'ut=
f8data.h')
Merging v4l-dvb/master (812765cd6954 media: vivid: add <Vendor Command With=
 ID> support)
Merging v4l-dvb-next/master (31aaa7d95e09 media: cec: cec-adap.c: improve C=
EC_MSG_FL_REPLY_VENDOR_ID check)
Merging pm/linux-next (ce80d5e667e0 Merge branch 'thermal-fixes' into linux=
-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (5da40dbc7742 cpufreq: Fix warni=
ng on unused of_device_id tables for !CONFIG_OF)
Merging cpupower/cpupower (76fb981ad677 tools/cpupower: display residency v=
alue in idle-info)
Merging devfreq/devfreq-next (1d143dde7679 PM / devfreq: exynos: Use Use de=
vm_clk_get_enabled() helpers)
Merging pmdomain/next (124ca7f2b3e6 pmdomain: Merge branch fixes into next)
Merging opp/opp/linux-next (8400291e289e Linux 6.11-rc1)
Merging thermal/thermal/linux-next (7eeb114a635a dt-bindings: thermal: conv=
ert hisilicon-thermal.txt to dt-schema)
Merging rdma/for-next (ec7ad6530909 RDMA/mlx5: Introduce GET_DATA_DIRECT_SY=
SFS_PATH ioctl)
Merging net-next/main (2984e69a24af net: ethernet: dlink: replace deprecate=
d macro)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/net=
/fsl,qoriq-mc-dpmac.yaml
CONFLICT (content): Merge conflict in drivers/net/dsa/vitesse-vsc73xx-core.c
Merging bpf-next/for-next (5cbe27fc0db3 Merge branch 'bpf-next/net' into fo=
r-next)
CONFLICT (content): Merge conflict in fs/coda/inode.c
Applying: fixup for "introduce fd_file(), convert all accessors to it."
Applying: fixup2 for "introduce fd_file(), convert all accessors to it."
Merging ipsec-next/master (8e0c0ec9b7dc Merge branch 'ethernet-convert-from=
-tasklet-to-bh-workqueue')
Merging mlx5-next/mlx5-next (c772a2c69018 net/mlx5: Add IFC related stuff f=
or data direct)
Merging netfilter-next/main (bbfeba260364 Merge branch 'mlx5-misc-patches-2=
024-08-08')
Merging ipvs-next/main (bbfeba260364 Merge branch 'mlx5-misc-patches-2024-0=
8-08')
Merging bluetooth/master (f173b220f9dc MAINTAINERS: Add an entry for Amlogi=
c HCI UART (M: Yang Li))
Merging wireless-next/for-next (ae98f5c9fd8b Merge tag 'ath-next-20240812' =
of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath)
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/hw.c
Merging ath-next/for-next (ae98f5c9fd8b Merge tag 'ath-next-20240812' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/ath/ath)
Merging wpan-next/master (9187210eee7d Merge tag 'net-next-6.9' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging wpan-staging/staging (9187210eee7d Merge tag 'net-next-6.9' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mtd/mtd/next (78a0b13f5744 Merge tag 'nand/for-6.11' into mtd/next)
Merging nand/nand/next (a503f91a3645 mtd: rawnand: lpx32xx: Fix dma_request=
_chan() error checks)
Merging spi-nor/spi-nor/next (b6491eb021e4 mtd: spi-nor: winbond: add Zetta=
 ZD25Q128C support)
Merging crypto/master (2d6213bd592b crypto: spacc - Add ifndef around MIN)
Merging drm/drm-next (4e996697a443 Merge tag 'drm-misc-next-2024-08-09' of =
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_rtp.c
Merging drm-exynos/for-linux-next (627a24f5f25d Merge tag 'amd-drm-fixes-6.=
11-2024-07-18' of https://gitlab.freedesktop.org/agd5f/linux into drm-next)
Merging drm-misc/for-linux-next (dfa5543193f3 drm/edid: make drm_edid_block=
_valid() static)
Merging amdgpu/drm-next (98aded657f50 drm/amd/display: Align hwss_wait_for_=
all_blank_complete descriptor with implementation)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/smu14/sm=
u_v14_0_2_ppt.c
Merging drm-intel/for-linux-next (db639278e621 drm/i915: use pdev_to_i915()=
 instead of pci_get_drvdata() directly)
Merging drm-tegra/for-next (2429b3c529da drm/tegra: Avoid potential 32-bit =
integer overflow)
Merging drm-msm/msm-next (fe34394ecdad dt-bindings: display/msm: dsi-contro=
ller-main: Add SM7150)
Merging drm-msm-lumag/msm-next-lumag (399af57ccca2 dt-bindings: display/msm=
/gpu: fix the schema being not applied)
Merging drm-xe/drm-xe-next (1eda95cba9df drm/xe: Rename enable_display modu=
le param)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/display/xe_display=
.c
Merging etnaviv/etnaviv/next (704d3d60fec4 drm/etnaviv: don't block schedul=
er when GPU is still active)
Merging fbdev/for-next (8b05b12e86ff fbdev/hpfb: Fix an error handling path=
 in hpfb_dio_probe())
Merging regmap/for-next (9eeca3012ae6 Merge remote-tracking branch 'regmap/=
for-6.12' into regmap-next)
Merging sound/for-next (d79e13f8e8ab ALSA: usb-audio: Replace complex quirk=
 lines with macros)
Merging ieee1394/for-next (fd1946198aa7 firewire: core/ohci: minor refactor=
ing for computation of configuration ROM size)
Merging sound-asoc/for-next (081d117b0b64 Merge remote-tracking branch 'aso=
c/for-6.12' into asoc-next)
Merging modules/modules-next (61842868de13 module: create weak dependecies)
Merging input/next (63f92f11385d Input: tsc2004/5 - use guard notation when=
 acquiring mutexes/locks)
Merging block/for-next (619693b2d81c Merge branch 'for-6.12/block' into for=
-next)
Merging device-mapper/for-next (0e70056eb822 dm: Remove unused declaration =
and empty definition "dm_zone_map_bio")
Merging libata/for-next (6773e058ae5a ata: ahci_imx: Correct the email addr=
ess)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (538076ce6b8d mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (d94fc0f04121 dt-bindings: mfd: mediatek: Add code=
c property for MT6357 PMIC)
Merging backlight/for-backlight-next (fea88a13a5d1 backlight: l4f00242t03: =
Add check for spi_setup)
Merging battery/for-next (8400291e289e Linux 6.11-rc1)
Merging regulator/for-next (c344718dca07 Merge remote-tracking branch 'regu=
lator/for-6.12' into regulator-next)
Merging security/next (63dff3e48871 lsm: add the inode_free_security_rcu() =
LSM implementation hook)
Merging apparmor/apparmor-next (8400291e289e Linux 6.11-rc1)
Merging integrity/next-integrity (fa8a4ce432e8 ima: fix buffer overrun in i=
ma_eventdigest_init_common)
Merging selinux/next (05da3fe161e9 Automated merge of 'dev' into 'next')
Merging smack/next (e86cac0acdb1 smack: unix sockets: fix accept()ed socket=
 label)
Merging tomoyo/master (dc1c8034e31b minmax: simplify min()/max()/clamp() im=
plementation)
Merging tpmdd/next (b4c635360613 KEYS: Remove unused declarations)
Merging watchdog/master (7c626ce4bae1 Linux 6.11-rc3)
Merging iommu/next (91fe40d93ec3 Merge branches 'fixes', 'amd/amd-vi' and '=
core' into next)
Merging audit/next (8400291e289e Linux 6.11-rc1)
Merging devicetree/for-next (14fcaf5081e1 dt-bindings: net: convert maxim,d=
s26522.txt to yaml format)
Merging dt-krzk/for-next (160f8902030e Merge branch 'next/dt' into for-next)
Merging mailbox/for-next (a8bd68e4329f mailbox: mtk-cmdq: Move devm_mbox_co=
ntroller_register() after devm_pm_runtime_enable())
Merging spi/for-next (a6bbfc9f0956 Merge remote-tracking branch 'spi/for-6.=
12' into spi-next)
Merging tip/master (1d00f3427bfd Merge branch into tip/master: 'x86/timers')
Merging clockevents/timers/drivers/next (b7625d67eb1a Merge tag 'timers-v6.=
11-rc1' of https://git.linaro.org/people/daniel.lezcano/linux into timers/c=
ore)
Merging edac/edac-for-next (090786479325 Merge ras/edac-misc into for-next)
Merging ftrace/for-next (656a95786db8 Merge ring-buffer/for-next)
Merging rcu/next (2b3afc0e5eeb Merge branches 'context_trackng.11.08.24a', =
'csd.lock.29.07.24a', 'nocb.29.07.24a', 'rcutorture.07.08.24a', 'rcustall.3=
1.07.24a', 'srcu.12.08.24a', 'rcu_scaling_tests.11.08.24b', 'fixes.12.08.24=
a' and 'misc.11.08.24a' into next.12.08.24a)
Merging paulmck/non-rcu/next (f01f18f2ed7d Merge branches 'cmpxchg.2024.08.=
06a', 'lkmm.2024.08.02a', 'kcsan.2024.08.01a' and 'misc.2024.08.02a' into H=
EAD)
Merging kvm/next (15e1c3d65975 KVM: x86: Use this_cpu_ptr() instead of per_=
cpu_ptr(smp_processor_id()))
Merging kvm-arm/next (bb032b2352c3 Merge branch kvm-arm64/docs into kvmarm/=
next)
Merging kvms390/next (7816e58967d0 kvm: s390: Reject memory region operatio=
ns for ucontrol VMs)
Merging kvm-ppc/topic/ppc-kvm (9739ff4887c7 KVM: PPC: Book3S HV: Refactor H=
FSCR emulation for KVM guests)
Merging kvm-riscv/riscv_kvm_next (dd4a799bcc13 KVM: riscv: selftests: Fix c=
ompile error)
Merging kvm-x86/next (332d2c1d713e crypto: ccp: Add the SNP_VLEK_LOAD comma=
nd)
Merging xen-tip/linux-next (4c006734898a x86/xen: fix memblock_reserve() us=
age on PVH)
Merging percpu/for-next (2d9ad81ef935 Merge branch 'for-6.8-fixes' into for=
-next)
Merging workqueues/for-next (85fba1b99317 Merge branch 'for-6.12' into for-=
next)
Merging sched-ext/for-next (89909296a51e sched_ext: Don't use double lockin=
g to migrate tasks across CPUs)
Merging drivers-x86/for-next (4c29e80ab885 platform/x86: int3472: make comm=
on part a separate module)
Merging chrome-platform/for-next (a1927fbbf74f platform/chrome: cros_ec_typ=
ec: add remove driver hook)
Merging chrome-platform-firmware/for-firmware-next (8400291e289e Linux 6.11=
-rc1)
Merging hsi/for-next (f02cfe695047 HSI: ssi_protocol: Remove unused linux/g=
pio.h)
Merging leds-lj/for-leds-next (6eefd65ba6ae leds: pca995x: Use device_for_e=
ach_child_node() to access device child nodes)
Merging ipmi/for-next (19a01155ddfe ipmi: Drop explicit initialization of s=
truct i2c_device_id::driver_data to 0)
Merging driver-core/driver-core-next (18ec12c97b39 driver core: Fix a poten=
tial null-ptr-deref in module_add_driver())
Merging usb/usb-next (82313624b2ae usb: gadget: f_uac1: Change volume name =
and remove alt names)
Merging thunderbolt/next (7c626ce4bae1 Linux 6.11-rc3)
Merging usb-serial/usb-next (da74a5100a2b USB: serial: drop driver owner in=
itialization)
Merging tty/tty-next (1241b384efa5 6pack: propagage new tty types)
Merging char-misc/char-misc-next (4a017c016383 kgdbts: fix hw_access_break_=
test)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (de9c2c66ad8e Linux 6.11-rc2)
Merging fastrpc/for-next (8400291e289e Linux 6.11-rc1)
Merging fpga/for-next (8de36789bd03 fpga: zynq-fpga: Rename 'timeout' varia=
ble as 'time_left')
Merging icc/icc-next (226e58b20975 Merge branch 'icc-rpmh-qos' into icc-nex=
t)
Merging iio/togreg (b4b4817bbf9a dt-bindings: iio: adc: Add rockchip,rk3576=
-saradc string)
Merging phy-next/next (c4b09c562086 phy: phy-rockchip-samsung-hdptx: Add cl=
ock provider support)
Merging soundwire/next (663229e24255 soundwire: bus: clean up probe warning=
s)
Merging extcon/extcon-next (e508f2606c0b extcon: Add LC824206XA microUSB sw=
itch driver)
Merging gnss/gnss-next (8400291e289e Linux 6.11-rc1)
Merging vfio/next (0756bec2e45b vfio-mdev: add missing MODULE_DESCRIPTION()=
 macros)
Merging w1/for-next (e940ff286ec4 w1: ds2482: Drop explicit initialization =
of struct i2c_device_id::driver_data to 0)
Merging spmi/spmi-next (7c626ce4bae1 Linux 6.11-rc3)
Merging staging/staging-next (d727f0217ad6 Staging: rtl8192e: Rename variab=
le nSubframe_Length)
Merging counter-next/counter-next (8400291e289e Linux 6.11-rc1)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (44c026a73be8 Linux 6.4-rc3)
Merging dmaengine/next (0204485c5a1e dt-bindings: fsl-qdma: allow compatibl=
e string fallback to fsl,ls1021a-qdma)
Merging cgroup/for-next (d8454758e6e4 Merge branch 'for-6.12' into for-next)
Merging scsi/for-next (5cadf9bb8103 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (f51d74819577 scsi: ufs: Add HCI capabilities sys=
fs group)
Merging vhost/linux-next (d820e8fcea38 net: virtio: unify code to init stat=
s)
Merging rpmsg/for-next (2e7d097f6bb7 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (789ce0f6028f dt-bindings: gpio: gpio-davin=
ci: Add the gpio-reserved-ranges property)
Merging gpio-intel/for-next (8400291e289e Linux 6.11-rc1)
Merging pinctrl/for-next (6fb214cdf7df Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (7c626ce4bae1 Linux 6.11-rc3)
Merging pinctrl-renesas/renesas-pinctrl (f73f63b24491 pinctrl: renesas: rzg=
2l: Use dev_err_probe())
Merging pinctrl-samsung/for-next (e61f1a729da8 pinctrl: samsung: Add suppor=
t for pull-up and pull-down)
Merging pwm/pwm/for-next (861a4272660a pwm: lp3943: Fix an incorrect type i=
n lp3943_pwm_parse_dt())
Merging ktest/for-next (07283c1873a4 ktest: force $buildonly =3D 1 for 'mak=
e_warnings_file' test type)
Merging kselftest/next (41f37c852ac3 selftests/ftrace: Add required depende=
ncy for kprobe tests)
Merging kunit/test (8400291e289e Linux 6.11-rc1)
Merging kunit-next/kunit (8400291e289e Linux 6.11-rc1)
Merging livepatching/for-next (9871e6af43db Merge branch 'for-6.11/sysfs-pa=
tch-replace' into for-next)
Merging rtc/rtc-next (04dcadb87da6 rtc: stm32: add alarm A out feature)
Merging nvdimm/libnvdimm-for-next (b0d478e34dbf testing: nvdimm: Add MODULE=
_DESCRIPTION() macros)
Merging at24/at24/for-next (36e071d2a152 dt-bindings: eeprom: at24: Add com=
patible for Giantec GT24C04A)
Merging ntb/ntb-next (92aee2f6d156 NTB: ntb_transport: fix all kernel-doc w=
arnings)
Merging seccomp/for-next/seccomp (de9c2c66ad8e Linux 6.11-rc2)
Merging fsi/next (c5eeb63edac9 fsi: Fix panic on scom file read)
Merging slimbus/for-next (9b6e704955fa slimbus: generate MODULE_ALIAS() fro=
m MODULE_DEVICE_TABLE())
Merging nvmem/for-next (a94699fa406d MAINTAINERS: Update path for U-Boot en=
vironment variables YAML)
Merging xarray/main (2a15de80dd0f idr: fix param name in idr_alloc_cyclic()=
 doc)
Merging hyperv/hyperv-next (f2580a907e5c x86/hyperv: Use Hyper-V entropy to=
 seed guest random number generator)
Merging auxdisplay/for-next (8400291e289e Linux 6.11-rc1)
Merging kgdb/kgdb/for-next (9bccbe7b2087 kdb: Get rid of redundant kdb_curr=
_task())
Merging hmm/hmm (6613476e225e Linux 6.8-rc1)
Merging cfi/cfi/next (8400291e289e Linux 6.11-rc1)
Merging mhi/mhi-next (65bc58c3dcad net: wwan: mhi: make default data link i=
d configurable)
Merging memblock/for-next (cb088e38aab4 s390/mm: get estimated free pages b=
y memblock api)
CONFLICT (rename/delete): tools/testing/radix-tree/linux/init.h renamed to =
tools/testing/shared/linux/init.h in HEAD, but deleted in memblock/for-next.
$ git rm -f tools/testing/shared/linux/init.h
Merging cxl/next (a0328b397f33 cxl/core/pci: Move reading of control regist=
er to immediately before usage)
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (4a2ebb082297 efi: Replace efi_memory_attributes_table_t 0=
-sized array with flexible array)
Merging unicode/for-next (68318904a775 unicode: add MODULE_DESCRIPTION() ma=
cros)
Merging slab/slab/for-next (248081776627 Merge branch 'slab/for-6.12/rcu_ba=
rriers' into slab/for-next)
CONFLICT (content): Merge conflict in kernel/rcu/tree.c
Merging random/master (c86927f528a8 selftests/vDSO: don't #include sodium h=
eader in chacha test)
Merging landlock/next (8400291e289e Linux 6.11-rc1)
Merging rust/rust-next (de9c2c66ad8e Linux 6.11-rc2)
Merging sysctl/sysctl-next (acc154691fc7 sysctl: Warn on an empty procname =
element)
Merging execve/for-next/execve (44f65d900698 binfmt_elf: mseal address zero)
CONFLICT (content): Merge conflict in fs/binfmt_elf.c
Merging bitmap/bitmap-for-next (7e516a1ef3f4 nodemask: Switch from inline t=
o __always_inline)
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (84c55b004573 lib/string_helpers: rework overflo=
w-dependent code)
Merging kspp-gustavo/for-next/kspp (6613476e225e Linux 6.8-rc1)
Merging nolibc/nolibc (8400291e289e Linux 6.11-rc1)
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (8400291e289e Linux 6.11-rc1)
Merging turbostat/next (75879bd898ee tools/power turbostat: fix GCC9 build =
regression)
Merging pwrseq/pwrseq/for-next (8400291e289e Linux 6.11-rc1)
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)

--Sig_/seVi3Ow79q+=Qc8ulPbYoIB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma9hsQACgkQAVBC80lX
0Gz12wgAk2JyVm+4WTi8r5jpoZ0u7Qg7Mn0Kx4/093yuHIZ9jfQRohZXRv1MVUcb
KOEKeMc2ak9sXlvgzQ4RMIOOe0rOtDhtskLYtNIOg/emTiZ9gzcBExbIfb3IBBNh
kGWj6PKHfkGxOZxvnVojoXQybPD6wLrnOzWiFvjkqC4L8+ARs/bVo5jGjIRwdS83
ZE3FkGXxHSiGbxAJNSxUDkpzCvtwM6ZgQHhLVoshyxBVB8VbUENNhKrVk06i0BH+
RFsT/brccHWYKFApwBhk9ajX1LevjaIIix0UAfJCalkJhLe8yi7lYxJsWbbi1I6B
0hwu/POaBBJBbpsKWG4WcAvNVejEGQ==
=3xJT
-----END PGP SIGNATURE-----

--Sig_/seVi3Ow79q+=Qc8ulPbYoIB--

