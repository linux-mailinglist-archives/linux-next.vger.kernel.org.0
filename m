Return-Path: <linux-next+bounces-7145-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAB9AD82AB
	for <lists+linux-next@lfdr.de>; Fri, 13 Jun 2025 07:42:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7E201680AE
	for <lists+linux-next@lfdr.de>; Fri, 13 Jun 2025 05:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5B22475CD;
	Fri, 13 Jun 2025 05:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Mb5Bubtp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6127E7082A;
	Fri, 13 Jun 2025 05:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749793336; cv=none; b=ksihWnJXtlAEupfk/LlQgzeRC6JQAp6nbsyflyBdhenId7rxasw9pUdp5L3+MFl1QCHOxUrV9GSl8SjNZoVNYdfeowTq+B6nk59h3K5iY/8+TvZxcnuegUm+3oXLEajLlYBsdzYFu6emm4nAil1U/C5bfwilZPRwptmufU/HJWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749793336; c=relaxed/simple;
	bh=QnKcuRp3qoLlt5c7pK59+PF2kHXGX/gbiaWYFE7d7tA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=URA1LrgAqbd96DkcoxzO2698Z84UWbItSWTyulJLZMwN13sbL4u5sSSSi3x3GCnTaDqFYL3alPeN1iBhk/d+8j/ShxmwbpO7AuYvmT3JPDYko/2IJLrZYHGUQpJl+38sWTK3ziefDVd7B4AyFw3HbIj0TmylIVzMuNGwkAKPb6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Mb5Bubtp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749793325;
	bh=5nJWLPs9bpFtePBN95O0rsPf8DTRQ6NxEIycy0hfL44=;
	h=Date:From:To:Cc:Subject:From;
	b=Mb5BubtpBOCRsBWYkVt3x6aGpK14SBkacG1cChOPgQOMpUlTFfTUhLVYEiw7Szpxh
	 jaEVnBqAdukobrTpyaG2JyfncYiWAyifVd9Ue+GjsENPcU0qAZiFjaROmDEeQJyK6o
	 3+fMNTb+V2LWb2AfF/pecFrNz4fFCHWAL0StSglqxPiZDgLTDexqrAmEhOuH44jW3F
	 64ZDQPdFwQ6qYRyv/SJ7YMbK4fyRuvoeT3zHpnvCaxIuopooY59dGb/YdON7jtfSup
	 JyRp6bUH6IryZD4MAnMr9NyDW1s7OvyoMEsU+TaQP2DGAIPxbR9z4uH0kuBjTVAkrl
	 zT7j+33H5TJDw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bJSvd3z70z4x07;
	Fri, 13 Jun 2025 15:42:05 +1000 (AEST)
Date: Fri, 13 Jun 2025 15:42:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 13
Message-ID: <20250613154204.42392ad4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JA_dKOryao9q+xNYCrqOiCe";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JA_dKOryao9q+xNYCrqOiCe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250612:

Non-merge commits (relative to Linus' tree): 1894
 2205 files changed, 70865 insertions(+), 30691 deletions(-)

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

I am currently merging 402 trees (counting Linus' and 153 trees of bug
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
Merging origin/master (27605c8c0f69 Merge tag 'net-6.16-rc2' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging fixes/fixes (b3c623b9a94f Merge tag 'thermal-6.15-rc1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging ext4-fixes/fixes (4bbf9020becb Linux 6.13-rc4)
Merging vfs-brauner-fixes/vfs.fixes (ad5a0351064c VFS: change try_lookup_no=
perm() to skip revalidation)
Merging fscrypt-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging fsverity-current/for-current (0af2f6be1b42 Linux 6.15-rc1)
Merging btrfs-fixes/next-fixes (336f36773aec Merge branch 'misc-6.16' into =
next-fixes)
Merging vfs-fixes/fixes (12f147ddd6de do_change_type(): refuse to operate o=
n unmounted/not ours mounts)
Merging erofs-fixes/fixes (35076d2223c7 erofs: ensure the extra temporary c=
opy is valid for shortened bvecs)
Merging nfsd-fixes/nfsd-fixes (d72c2f10a515 SUNRPC: Cleanup/fix initial rq_=
pages allocation)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (924577e4f6ca ovl: Fix nested backing fil=
e paths)
Merging bcachefs/for-next (d7db0758f154 bcachefs: btree iter tracepoints)
Merging fscrypt/for-next (c07d3aede2b2 fscrypt: add support for hardware-wr=
apped keys)
Merging btrfs/for-next (e281e86fc99f Merge branch 'for-next-next-v6.16-2025=
0611' into for-next-20250611)
Merging ceph/master (b828b4bf29d1 ceph: fix variable dereferenced before ch=
eck in ceph_umount_begin())
Merging cifs/for-next (9f2b27e4f9e3 cifs: Fix lstat() and AT_SYMLINK_NOFOLL=
OW to work on broken symlink nodes)
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
Merging f2fs/dev (19272b37aa4f Linux 6.16-rc1)
Merging fsverity/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging fuse/for-next (dabb90391028 fuse: increase readdir buffer size)
Merging gfs2/for-next (fe4281644c62 Merge tag 'gfs2-for-6.16-fix' of git://=
git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2)
Merging jfs/jfs-next (5dff41a86377 jfs: fix array-index-out-of-bounds read =
in add_missing_indices)
Merging ksmbd/ksmbd-for-next (19272b37aa4f Linux 6.16-rc1)
Merging nfs/linux-next (19272b37aa4f Linux 6.16-rc1)
Merging nfs-anna/linux-next (e3e3775392f3 flexfiles/pNFS: update stats on N=
FS4ERR_DELAY for v4.1 DSes)
Merging nfsd/nfsd-next (245f35685cdb sunrpc: unexport csum_partial_copy_to_=
xdr)
Merging ntfs3/master (19272b37aa4f Linux 6.16-rc1)
Merging orangefs/for-next (4dc784e92d4f orangefs: Convert to use the new mo=
unt API)
Merging overlayfs/overlayfs-next (6f9ccdad0fea ovl: Annotate struct ovl_ent=
ry with __counted_by())
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
Merging vfs-brauner/vfs.all (381011d6ae29 Merge branch 'vfs-6.17.async.dir'=
 into vfs.all)
Merging vfs/for-next (1b9892d82b6f Merge branch 'work.automount' into for-n=
ext)
Merging mm-hotfixes/mm-hotfixes-unstable (46697c7fa194 mm/hugetlb: remove u=
nnecessary holding of hugetlb_lock)
Merging fs-current (a36bcf06b42e Merge branch 'nfsd-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/cel/linux)
Merging kbuild-current/fixes (8630c59e9936 Merge tag 'kbuild-v6.16' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild)
Merging arc-current/for-curr (179e949719fe ARC: Replace __ASSEMBLY__ with _=
_ASSEMBLER__ in the non-uapi headers)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (39dfc971e42d arm64/ptrace: Fix stack-ou=
t-of-bounds read in regs_get_kernel_stack_nth())
Merging arm-soc-fixes/arm/fixes (070d04f002dd Merge tag 'mvebu-fixes-6.15-1=
' of https://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into ar=
m/fixes)
Merging davinci-current/davinci/for-current (19272b37aa4f Linux 6.16-rc1)
Merging drivers-memory-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging sophgo-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging sophgo-soc-fixes/soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging m68k-current/for-linus (f440518f379d m68k: defconfig: Update defcon=
figs for v6.15-rc1)
Merging powerpc-fixes/fixes (0d67f0dee6c9 powerpc/vas: Return -EINVAL if th=
e offset is non-zero in mmap())
Merging s390-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging net/main (27605c8c0f69 Merge tag 'net-6.16-rc2' of git://git.kernel=
.org/pub/scm/linux/kernel/git/netdev/net)
Merging bpf/master (9cc7d5904bab Merge tag 'pinctrl-v6.16-2' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl)
Merging ipsec/master (766f6a784bdf Merge branch 'xfrm: fixes for xfrm_state=
_find under preemption')
Merging netfilter/main (fdd9ebccfc32 Merge tag 'for-net-2025-06-05' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth)
Merging ipvs/main (57a92d14659d net: phy: mscc: Stop clearing the the UDPv4=
 checksum for L2 frames)
Merging wireless/for-next (27605c8c0f69 Merge tag 'net-6.16-rc2' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ath/for-current (27605c8c0f69 Merge tag 'net-6.16-rc2' of git://git=
.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging iwlwifi/fixes (f81aa834bfa9 wifi: iwlwifi: mld: Move regulatory dom=
ain initialization)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (19272b37aa4f Linux 6.16-rc1)
Merging sound-current/for-linus (4c267ae2ef34 ALSA: sb: Force to disable DM=
As once when DMA mode is changed)
Merging sound-asoc-fixes/for-linus (ba06528ad5a3 ASoC: amd: yc: Add quirk f=
or MSI Bravo 17 D7VF internal mic)
Merging regmap-fixes/for-linus (19272b37aa4f Linux 6.16-rc1)
Merging regulator-fixes/for-linus (06118ae36855 regulator: max20086: Fix re=
fcount leak in max20086_parse_regulators_dt())
Merging spi-fixes/for-linus (83f066fac3c2 spi: stm32-ospi: clean up on erro=
r in probe())
Merging pci-current/for-linus (19272b37aa4f Linux 6.16-rc1)
Merging driver-core.current/driver-core-linus (19272b37aa4f Linux 6.16-rc1)
Merging tty.current/tty-linus (19272b37aa4f Linux 6.16-rc1)
Merging usb.current/usb-linus (19272b37aa4f Linux 6.16-rc1)
Merging usb-serial-fixes/usb-linus (19272b37aa4f Linux 6.16-rc1)
Merging phy/fixes (19272b37aa4f Linux 6.16-rc1)
Merging staging.current/staging-linus (8630c59e9936 Merge tag 'kbuild-v6.16=
' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild)
Merging iio-fixes/fixes-togreg (7cdfbc0113d0 iio: adc: ad7944: mask high bi=
ts on direct read)
Merging counter-current/counter-current (19272b37aa4f Linux 6.16-rc1)
Merging char-misc.current/char-misc-linus (19272b37aa4f Linux 6.16-rc1)
Merging soundwire-fixes/fixes (86a4371b7697 soundwire: amd: fix for handlin=
g slave alerts after link is down)
Merging thunderbolt-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging input-current/for-linus (805f5bbaa507 Input: psmouse - switch to us=
e scnprintf() to suppress truncation warning)
Merging crypto-current/master (40a98e702b52 crypto: hkdf - move to late_ini=
tcall)
Merging libcrypto-fixes/libcrypto-fixes (34acef85bf47 crypto: lib/curve2551=
9-hacl64 - Disable KASAN with clang-17 and older)
Merging vfio-fixes/for-linus (c1d9dac0db16 vfio/pci: Align huge faults to o=
rder)
Merging kselftest-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging dmaengine-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (1c1fd374a2fe mtd: spinand: Fix build with gcc =
< 7.5)
Merging mfd-fixes/for-mfd-fixes (68f860426d50 mfd: axp20x: AXP717: Fix miss=
ing IRQ status registers range)
Merging v4l-dvb-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging reset-fixes/reset/fixes (38fec10eb60d Linux 6.14)
Merging mips-fixes/mips-fixes (c44572e0cc13 MIPS: Fix MAX_REG_OFFSET)
Merging at91-fixes/at91-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging omap-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging kvm-fixes/master (8046d29dde17 KVM: x86/mmu: Reject direct bits in =
gpa passed to KVM_PRE_FAULT_MEMORY)
Merging kvms390-fixes/master (d8dfda5af0be KVM: s390: pv: fix race when mak=
ing a page secure)
Merging hwmon-fixes/hwmon (78ca360f14d1 hwmon: (ltc4282) avoid repeated reg=
ister write)
Merging nvdimm-fixes/libnvdimm-fixes (62a65b32bddb dt-bindings: pmem: Conve=
rt binding to YAML)
Merging cxl-fixes/fixes (85cc50bfcb8b cxl/Documentation: Add more descripti=
on about min/max scrub cycle)
Merging dma-mapping-fixes/dma-mapping-fixes (aa807b9f22df dma-contiguous: h=
ornor the cma address limit setup by user)
Merging drivers-x86-fixes/fixes (3fbf25ecf8b7 MAINTAINERS: .mailmap: Update=
 Hans de Goede's email address)
Merging samsung-krzk-fixes/fixes (5cac59c59bbc mux: mmio: Fix missing CONFI=
G_REGMAP_MMIO)
Merging pinctrl-samsung-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging devicetree-fixes/dt/linus (f75794b6077e dt-bindings: serial: Conver=
t altr,uart-1.0 to DT schema)
Merging dt-krzk-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging scsi-fixes/fixes (5c3ba81923e0 scsi: error: alua: I/O errors for AL=
UA state transitions)
Merging drm-fixes/drm-fixes (19272b37aa4f Linux 6.16-rc1)
Merging drm-intel-fixes/for-linux-next-fixes (19272b37aa4f Linux 6.16-rc1)
Merging mmc-fixes/fixes (539d80575b81 mtk-sd: Fix a pagefault in dma_unmap_=
sg() for not prepared data)
Merging rtc-fixes/rtc-fixes (19272b37aa4f Linux 6.16-rc1)
Merging gnss-fixes/gnss-linus (19272b37aa4f Linux 6.16-rc1)
Merging hyperv-fixes/hyperv-fixes (14ae3003e73e Drivers: hv: Fix bad ref to=
 hv_synic_eventring_tail when CPU goes offline)
Merging risc-v-fixes/fixes (2aa5801ada29 RISC-V: uaccess: Wrap the get_user=
_8 uaccess macro)
Merging riscv-dt-fixes/riscv-dt-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging riscv-soc-fixes/riscv-soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (19272b37aa4f Linux 6.16-rc1)
Merging gpio-brgl-fixes/gpio/for-current (72f37957007d gpio: loongson-64bit=
: Correct Loongson-7A2000 ACPI GPIO access mode)
Merging gpio-intel-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging pinctrl-intel-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging auxdisplay-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging kunit-fixes/kunit-fixes (19272b37aa4f Linux 6.16-rc1)
Merging memblock-fixes/fixes (da8bf5daa5e5 memblock: Accept allocated memor=
y before use in memblock_double_array())
Merging renesas-fixes/fixes (379c590113ce ARM: shmobile: smp: Enforce shmob=
ile_smp_* alignment)
Merging perf-current/perf-tools (a913ef6fd883 perf callchain: Always popula=
te the addr_location map when adding IP)
Merging efi-fixes/urgent (c33453d08a56 efi: Drop preprocessor directives fr=
om zboot.lds)
Merging battery-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging iommufd-fixes/for-rc (19272b37aa4f Linux 6.16-rc1)
Merging rust-fixes/rust-fixes (5b2d595efbfc rust: time: Fix compile error i=
n impl_has_hr_timer macro)
Merging w1-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging pmdomain-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging i2c-host-fixes/i2c/i2c-host-fixes (903cc7096db2 dt-bindings: i2c: n=
vidia,tegra20-i2c: Specify the required properties)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (19272b37aa4f Linux 6.16-rc1)
Merging thead-clk-fixes/thead-clk-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging pwrseq-fixes/pwrseq/for-current (19272b37aa4f Linux 6.16-rc1)
Merging thead-dt-fixes/thead-dt-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging ftrace-fixes/ftrace/fixes (2fa6a01345b5 tracing: Fix memory leak wh=
en reading set_event file)
Merging ring-buffer-fixes/ring-buffer/fixes (e4d4b8670c44 ring-buffer: Use =
flush_kernel_vmap_range() over flush_dcache_folio())
Merging trace-fixes/trace/fixes (8a157d8a00e8 tracing: Do not free "head" o=
n error path of filter_free_subsystem_filters())
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging tip-fixes/tip/urgent (41b6f51a8347 Merge branch into tip/master: 'x=
86/urgent')
Merging slab-fixes/slab/for-next-fixes (be8250786ca9 mm, slab: clean up sla=
b->obj_exts always)
Merging drm-msm-fixes/msm-fixes (0838fc3e6718 drm/msm/adreno: Check for rec=
ognized GPU before bind)
Merging uml-fixes/fixes (01f95500a162 Merge tag 'uml-for-linux-6.15-rc6' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux)
Merging fwctl-fixes/for-rc (19272b37aa4f Linux 6.16-rc1)
Merging devsec-tsm-fixes/fixes (fba4ceaa242d configfs-tsm-report: Fix NULL =
dereference of tsm_ops)
Merging drm-misc-fixes/for-linux-next-fixes (8ecbad4853f8 drm/arm/malidp: S=
ilence informational message)
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (19272b37aa4f Linux 6.16-rc1)
Merging mm-nonmm-stable/mm-nonmm-stable (19272b37aa4f Linux 6.16-rc1)
Merging mm-unstable/mm-unstable (51418be98e2d mm/memfd: clarify error handl=
ing labels in memfd_create())
Merging mm-nonmm-unstable/mm-nonmm-unstable (00a61893568c bcache: fix the t=
ail IO latency regression by using equality-aware min heap API)
Merging kbuild/for-next (8630c59e9936 Merge tag 'kbuild-v6.16' of git://git=
.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (ae0756933e87 perf thread: Ensure comm_lock he=
ld for comm_list)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (19272b37aa4f Linux 6.16-rc1)
Merging asm-generic/master (582847f97024 Makefile.kcov: apply needed compil=
er option unconditionally in CFLAGS_KCOV)
Merging alpha/alpha-next (1523226edda5 alpha: Use str_yes_no() helper in pc=
i_dac_dma_supported())
Merging arm/for-next (293bb049380e ARM: 9446/1: Disallow kernel mode NEON w=
hen IRQs are disabled)
Merging arm64/for-next/core (19272b37aa4f Linux 6.16-rc1)
Merging arm-perf/for-next/perf (8c138a189f6d perf/arm-cmn: Add CMN S3 ACPI =
binding)
Merging arm-soc/for-next (ffa1d4e41f30 Merge branch 'soc/dt' into for-next)
Merging amlogic/for-next (9eefedf65051 Merge branch 'v6.17/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (19272b37aa4f Linux 6.16-rc1)
Merging aspeed/for-next (34c87a24e268 Merge branches 'aspeed/dt', 'aspeed/f=
ixes', 'aspeed/drivers', 'nuvoton/arm/dt' and 'nuvoton/arm64/dt' into for-n=
ext)
Merging at91/at91-next (05aeace8757f Merge branch 'at91-dt' into at91-next)
Merging broadcom/next (72538b5e06da Merge branch 'maintainers/next' into ne=
xt)
Merging davinci/davinci/for-next (19272b37aa4f Linux 6.16-rc1)
Merging drivers-memory/for-next (a0be20055d41 memory: omap-gpmx: Use dev_fw=
node())
Merging imx-mxs/for-next (1a2ad59da68d arm64: dts: imx8mp: Enable gpu passi=
ve throttling)
Merging mediatek/for-next (6df944d2cf58 Merge branch 'v6.15-next/dts64' int=
o for-next)
Merging mvebu/for-next (89373e7d4125 Merge branch 'mvebu/dt' into mvebu/for=
-next)
Merging omap/for-next (6d658392b3f0 Merge branch 'omap-for-v6.16/drivers' i=
nto tmp/omap-next-20250508.062442)
Merging qcom/for-next (82cd89a5220c Merge branches 'arm32-for-6.17', 'arm64=
-defconfig-fixes-for-6.16', 'arm64-defconfig-for-6.17', 'arm64-fixes-for-6.=
16', 'arm64-for-6.17' and 'clk-for-6.17' into for-next)
Merging renesas/next (a4b72ba3d3e5 Merge branches 'renesas-arm-defconfig-fo=
r-v6.17', 'renesas-drivers-for-v6.17', 'renesas-dt-bindings-for-v6.17' and =
'renesas-dts-for-v6.17' into renesas-next)
Merging reset/reset/next (1c64de886b88 dt-bindings: reset: sophgo: Add SG20=
44 bindings.)
Merging rockchip/for-next (44b0c3fa2f3a Merge branch 'v6.17-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (d1598ed132fa Merge branches 'next/clk' and '=
next/dt64' into for-next)
Merging scmi/for-linux-next (719a2bed3aab Merge branch 'for-next/smccc/upda=
tes' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/lin=
ux into for-linux-next)
Merging sophgo/for-next (3a8cef361be5 riscv: dts: sophgo: cv18xx: Add RTCSY=
S device node)
Merging sophgo-soc/soc-for-next (c8754c7deab4 soc: sophgo: cv1800: rtcsys: =
New driver (handling RTC only))
Merging spacemit/for-next (37df56ac5002 riscv: dts: spacemit: enable eMMC f=
or K1 SoC)
Merging stm32/stm32-next (dc392342b7bb ARM: dts: stm32: Add nvmem-cells to =
ethernet nodes for constant mac-addresses)
Merging sunxi/sunxi/for-next (19272b37aa4f Linux 6.16-rc1)
Merging tee/next (c580875fc93a Merge branch 'optee_fix_for_6.16' into next)
Merging tegra/for-next (5e98350146c3 Merge branch for-6.16/arm64/dt into fo=
r-next)
Merging thead-dt/thead-dt-for-next (a4c95b924d51 riscv: dts: thead: Add dev=
ice tree VO clock controller)
Merging ti/ti-next (19272b37aa4f Linux 6.16-rc1)
Merging xilinx/for-next (487e52a21734 firmware: xilinx: Add debugfs support=
 for PM_GET_NODE_STATUS)
Merging clk/clk-next (19272b37aa4f Linux 6.16-rc1)
Merging clk-imx/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging clk-renesas/renesas-clk (b263e653c372 clk: renesas: rzg2l: Rename m=
stp_clock to mod_clock)
Merging thead-clk/thead-clk-for-next (50d4b157fa96 clk: thead: Add clock su=
pport for VO subsystem in T-HEAD TH1520 SoC)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (f78fb2576f22 platform/loongarch: laptop: =
Unregister generic_sub_drivers on exit)
Merging m68k/for-next (f440518f379d m68k: defconfig: Update defconfigs for =
v6.15-rc1)
Merging m68knommu/for-next (19272b37aa4f Linux 6.16-rc1)
Merging microblaze/next (c0e7bb02f796 microblaze: Replace __ASSEMBLY__ with=
 __ASSEMBLER__ in non-uapi headers)
Merging mips/mips-next (5a0c749125c0 MIPS: loongson2ef: lemote-2f: add miss=
ing function prototypes)
Merging openrisc/for-next (f0eedcf22581 openrisc: Replace __ASSEMBLY__ with=
 __ASSEMBLER__ in non-uapi headers)
Merging parisc-hd/for-next (19272b37aa4f Linux 6.16-rc1)
Merging powerpc/next (8682a5749a3d MAINTAINERS: powerpc: Remove myself as a=
 reviewer)
Merging risc-v/for-next (306e57988197 Merge patch "riscv: defconfig: run sa=
vedefconfig to reorder it")
Merging riscv-dt/riscv-dt-for-next (d50108706a63 riscv: dts: starfive: jh71=
10-common: bootph-pre-ram hinting needed by boot loader)
Merging riscv-soc/riscv-soc-for-next (59986662d2f4 Merge branch 'riscv-cach=
e-for-next' into riscv-soc-for-next)
Merging s390/for-next (19272b37aa4f Linux 6.16-rc1)
Merging sh/for-next (19272b37aa4f Linux 6.16-rc1)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (cfc4ca8986bb Merge tag 'uml-for-linux-6.16-rc1' of git://=
git.kernel.org/pub/scm/linux/kernel/git/uml/linux)
Merging xtensa/xtensa-for-next (44a4ef59d550 xtensa: Replace __ASSEMBLY__ w=
ith __ASSEMBLER__ in non-uapi headers)
Merging fs-next (1e2fda2ad027 Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (87c59d7c12a1 Merge branch 'rework/optimizations' i=
nto for-next)
Merging pci/next (19272b37aa4f Linux 6.16-rc1)
Merging pstore/for-next/pstore (d679c2e1e8d9 pstore/zone: rewrite some comm=
ents for better understanding)
Merging hid/for-next (da04eb7791c4 Merge branch 'for-6.17/multitouch' into =
for-next)
Merging i2c/i2c/for-next (19272b37aa4f Linux 6.16-rc1)
Merging i2c-host/i2c/i2c-host (19272b37aa4f Linux 6.16-rc1)
Merging i3c/i3c/next (19272b37aa4f Linux 6.16-rc1)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (e8d63ffe031f hwmon: (ltc4282) fix copy pa=
ste on variable name)
Merging jc_docs/docs-next (d3f825032091 docs/sched: Make the sched-stats do=
cumentation consistent)
Merging v4l-dvb/next (19272b37aa4f Linux 6.16-rc1)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (87bcbb544a0c Merge branch 'fixes' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (c7f005f70d22 rust: cpu: Add Cpu=
Id::current() to retrieve current CPU ID)
Merging cpupower/cpupower (e044b8a9545c cpupower: split unitdir from libdir=
 in Makefile)
Merging devfreq/devfreq-next (a579e91b6fd2 PM / devfreq: rockchip-dfi: doub=
le count on RK3588)
Merging pmdomain/next (19272b37aa4f Linux 6.16-rc1)
Merging opp/opp/linux-next (03eadcbd981b OPP: switch to use kmemdup_array())
Merging thermal/thermal/linux-next (e23cba0ab49a thermal/drivers/airoha: Fi=
x spelling mistake)
Merging rdma/for-next (19272b37aa4f Linux 6.16-rc1)
Merging net-next/main (6d4e01d29d87 net: Use dev_fwnode())
Merging bpf-next/for-next (fa6932577c07 bpf: Initialize used but uninit var=
iable in propagate_liveness())
Merging ipsec-next/master (0097c4195b1d net: airoha: Add PPPoE offload supp=
ort)
Merging mlx5-next/mlx5-next (f550694e88b7 net/mlx5: Add IFC bits for PPCNT =
recovery counters group)
Merging netfilter-next/main (3e52667a9c32 Merge branch 'lan78xx-phylink-pre=
p')
Merging ipvs-next/main (6da5f1b4b4a0 selftests: netfilter: Fix skip of wild=
card interface test)
Merging bluetooth/master (6c31dab4ff1e driver: bluetooth: hci_qca:fix unabl=
e to load the BT driver)
Merging wireless-next/for-next (535de528015b Merge git://git.kernel.org/pub=
/scm/linux/kernel/git/netdev/net)
Merging ath-next/for-next (ed73728fd14e Merge tag 'mt76-next-2025-05-21' of=
 https://github.com/nbd168/wireless)
Merging iwlwifi-next/next (45f7fe7a7d3a wifi: iwlwifi: convert to use secs_=
to_jiffies())
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (aa702923258f Merge tag 'nand/for-6.16' into mtd/next)
Merging nand/nand/next (3bfb22cecfe6 mtd: rawnand: brcmnand: legacy exec_op=
 implementation)
Merging spi-nor/spi-nor/next (594c8df92b94 mtd: spi-nor: macronix: Add fixu=
ps for MX25L3255E)
Merging crypto/master (4ccd065a69df crypto: ahash - Add support for drivers=
 with no fallback)
Merging libcrypto/libcrypto-next (19272b37aa4f Linux 6.16-rc1)
Merging drm/drm-next (19272b37aa4f Linux 6.16-rc1)
Merging drm-exynos/for-linux-next (81a50378559b drm/exynos: Remove unnecess=
ary checking)
Merging drm-misc/for-linux-next (e2944dc6587f drm: renesas: rz-du: mipi_dsi=
: Add function pointers for configuring VCLK and mode validation)
CONFLICT (content): Merge conflict in drivers/gpu/drm/vc4/vc4_hdmi.c
Merging amdgpu/drm-next (78d7032b0838 drm/amd/display: Promote DAL to 3.2.3=
36)
Merging drm-intel/for-linux-next (ed3648b9ec4c drm/i915/dp: Disable the AUX=
 DPCD probe quirk if it's not required)
Merging drm-msm/msm-next (ee11d953fd23 MAINTAINERS: .mailmap: update Rob Cl=
ark's email address)
Merging drm-msm-lumag/msm-next-lumag (fc5c669c902c dt-bindings: display: ms=
m: correct example in SM8350 MDSS schema)
Merging drm-nova/nova-next (19272b37aa4f Linux 6.16-rc1)
Merging drm-xe/drm-xe-next (87c648c31322 drm/xe: Add helper function to inj=
ect fault into ct_dead_capture())
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (59d1fc7b3e1a fbdev: pm3fb: fix potential divide by =
zero)
Merging regmap/for-next (c8c4694ede7e regmap: kunit: Constify regmap_range_=
cfg array)
Merging sound/for-next (30f85eddbdeb ALSA: hda/ca0132: Use const char * for=
 strings)
Merging ieee1394/for-next (f657a680f84e firewire: core: use from_work() mac=
ro to expand parent structure of work_struct)
Merging sound-asoc/for-next (bc6adb5e0cc4 Merge remote-tracking branch 'aso=
c/for-6.17' into asoc-next)
Merging modules/modules-next (a0b018a495a3 module: Remove outdated comment =
about text_size)
Merging input/next (a95ef0199e80 Input: ims-pcu - check record size in ims_=
pcu_flash_firmware())
Merging block/for-next (c73e4b8bde5f Merge branch 'for-6.17/io_uring' into =
for-next)
Merging device-mapper/for-next (9f2f6316d753 dm-stripe: small code cleanup)
Merging libata/for-next (6f29d393061c ata: ahci: Use correct BIOS build dat=
e for ThinkPad W541 quirk)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (a18ed7f56d26 mmc: sdhci-uhs2: Adjust some error messages =
and register dump for SD UHS-II card)
Merging mfd/for-mfd-next (ffb006aa433e mfd: maxim: Correct Samsung "Electro=
nics" spelling in copyright headers)
Merging backlight/for-backlight-next (e12d3e1624a0 backlight: pm8941: Add N=
ULL check in wled_configure())
Merging battery/for-next (b1d8766052eb power: supply: rt9471: Simplify defi=
nition of some struct linear_range)
Merging regulator/for-next (c39ecd6007b4 Merge remote-tracking branch 'regu=
lator/for-6.17' into regulator-next)
Merging security/next (a7d6fb31a4db lsm: trivial comment fix)
Merging apparmor/apparmor-next (1fdb22c54a5f apparmor: mitigate parser gene=
rating large xtables)
Merging integrity/next-integrity (fe3aebf27dc1 ima: do not copy measurement=
 list to kdump kernel)
Merging selinux/next (be28fa230e05 selinux: add a 5 second sleep to /sys/fs=
/selinux/user)
Merging smack/next (4b59f4fd0a36 security/smack/smackfs: small kernel-doc f=
ixes)
Merging tomoyo/master (f09079bd04a9 Merge tag 'powerpc-6.16-2' of git://git=
.kernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging tpmdd/next (e271ed52b344 Merge tag 'pm-6.16-rc1-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging watchdog/master (158f9f2f7152 watchdog: iTCO_wdt: Update the heartb=
eat value after clamping timeout)
Merging iommu/next (879b141b7cfa Merge branches 'fixes', 'apple/dart', 'arm=
/smmu/updates', 'arm/smmu/bindings', 'fsl/pamu', 'mediatek', 'renesas/ipmmu=
', 's390', 'intel/vt-d', 'amd/amd-vi' and 'core' into next)
Merging audit/next (19272b37aa4f Linux 6.16-rc1)
Merging devicetree/for-next (d205b07e7e85 dt-bindings: display: convert him=
ax,hx8357d.txt to yaml format)
Merging dt-krzk/for-next (6cd594ed969d ARM: dts: vt8500: Add L2 cache contr=
oller on WM8850/WM8950)
Merging mailbox/for-next (d0b497df02e9 mailbox: qcom-apcs-ipc: Assign OF no=
de to clock controller child device)
Merging spi/for-next (39995b55b940 Merge remote-tracking branch 'spi/for-6.=
17' into spi-next)
Merging tip/master (b75dc5e1399d Merge branch into tip/master: 'sched/core')
Merging clockevents/timers/drivers/next (d204e391a0d8 clocksource/drivers/r=
enesas-ostm: Unconditionally enable reprobe support)
Merging edac/edac-for-next (855b5de2e562 Merge ras/edac-drivers into for-ne=
xt)
Merging ftrace/for-next (9cca84d73fae Merge tools/for-next)
Merging rcu/next (96d02a89721a rcutorture: Make BUSTED scenario check and l=
og readers)
Merging paulmck/non-rcu/next (e55dc2e5b2e3 Merge branches 'lkmm.2025.04.22a=
' and 'ratelimit.2025.05.08a' into HEAD)
Merging kvm/next (8046d29dde17 KVM: x86/mmu: Reject direct bits in gpa pass=
ed to KVM_PRE_FAULT_MEMORY)
Merging kvm-arm/next (1b85d923ba8c Merge branch kvm-arm64/misc-6.16 into kv=
marm-master/next)
Merging kvms390/next (d6c8097803cb KVM: s390: Simplify and move pv code)
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (7917be170928 RISC-V: KVM: lock the correc=
t mp_state during reset)
Merging kvm-x86/next (19272b37aa4f Linux 6.16-rc1)
Merging xen-tip/linux-next (7f9bbc1140ff xen/arm: call uaccess_ttbr0_enable=
 for dm_op hypercall)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (0998f0ac308c workqueue: fix opencoded cpumask_=
next_and_wrap() in wq_select_unbound_cpu())
Merging sched-ext/for-next (fd36ba4ea299 Merge branch 'for-6.16-fixes' into=
 for-next)
Merging drivers-x86/for-next (458957b8e3d5 platform/x86: intel_telemetry: R=
emove unused telemetry_raw_read_events())
Merging chrome-platform/for-next (8866f4e557eb platform/chrome: cros_ec_typ=
ec: Defer probe on missing EC parent)
Merging chrome-platform-firmware/for-firmware-next (19272b37aa4f Linux 6.16=
-rc1)
Merging hsi/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging leds-lj/for-leds-next (b338a2ae9b31 leds: tps6131x: Add support for=
 Texas Instruments TPS6131X flash LED driver)
Merging ipmi/for-next (cd2e103d57e5 Merge tag 'hardening-v6.16-rc1-fix1-tak=
e2' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging driver-core/driver-core-next (19272b37aa4f Linux 6.16-rc1)
Merging usb/usb-next (19272b37aa4f Linux 6.16-rc1)
Merging thunderbolt/next (19272b37aa4f Linux 6.16-rc1)
Merging usb-serial/usb-next (19272b37aa4f Linux 6.16-rc1)
Merging tty/tty-next (19272b37aa4f Linux 6.16-rc1)
Merging char-misc/char-misc-next (19272b37aa4f Linux 6.16-rc1)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (408c97c4a5e0 coresight: prevent deactivate active c=
onfig while enabling the config)
Merging fastrpc/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga/for-next (6ebf1982038a fpga: fix potential null pointer deref =
in fpga_mgr_test_img_load_sgt())
Merging icc/icc-next (5fed7fe33c2c Merge branch 'icc-sa8775p' into icc-next)
Merging iio/togreg (0c86e3381978 dt-bindings: iio: adc: Add ROHM BD79100G)
Merging phy-next/next (19272b37aa4f Linux 6.16-rc1)
Merging soundwire/next (393350c1691f soundwire: update Intel BPT message le=
ngth limitation)
Merging extcon/extcon-next (195609a5d811 extcon: fsa9480: Avoid buffer over=
flow in fsa9480_handle_change())
Merging gnss/gnss-next (19272b37aa4f Linux 6.16-rc1)
Merging vfio/next (4518e5a60c7f vfio/type1: Fix error unwind in migration d=
irty bitmap allocation)
Merging w1/for-next (19272b37aa4f Linux 6.16-rc1)
Merging spmi/spmi-next (0ff41df1cb26 Linux 6.15)
Merging staging/staging-next (8630c59e9936 Merge tag 'kbuild-v6.16' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild)
Merging counter-next/counter-next (19272b37aa4f Linux 6.16-rc1)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (19272b37aa4f Linux 6.16-rc1)
Merging cgroup/for-next (1486a0d1733a Merge branch 'for-6.17' into for-next)
Merging scsi/for-next (5c3ba81923e0 scsi: error: alua: I/O errors for ALUA =
state transitions)
Merging scsi-mkp/for-next (9d2c232d575a scsi: trace: Show rtn in string for=
 scsi_dispatch_cmd_error())
Merging vhost/linux-next (f248703d67a5 media: add virtio-media driver)
Merging rpmsg/for-next (148fc4ed6fa6 Merge branch 'rproc-next' into for-nex=
t)
Merging gpio-brgl/gpio/for-next (97a7ea2b8f4a gpio: TODO: add a task for re=
moving MMIO-specific fields from gpio_chip)
Merging gpio-intel/for-next (9ab29ed50555 gpiolib: acpi: Add a quirk for Ac=
er Nitro V15)
Merging pinctrl/for-next (b26c4958439c Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (3b4408038da9 pinctrl: intel: fix build warn=
ings about export.h)
Merging pinctrl-renesas/renesas-pinctrl (5488aa013e9e pinctrl: renesas: rzg=
2l: Add support for RZ/V2N SoC)
Merging pinctrl-samsung/for-next (19272b37aa4f Linux 6.16-rc1)
Merging pwm/pwm/for-next (60fdef1d4a99 dt-bindings: pwm: adi,axi-pwmgen: Up=
date documentation link)
Merging ktest/for-next (5a1bed232781 ktest: Fix Test Failures Due to Missin=
g LOG_FILE Directories)
Merging kselftest/next (19272b37aa4f Linux 6.16-rc1)
Merging kunit/test (19272b37aa4f Linux 6.16-rc1)
Merging kunit-next/kunit (19272b37aa4f Linux 6.16-rc1)
Merging livepatching/for-next (a8e905a819fd Merge branch 'for-6.15/ftrace-t=
est' into for-next)
Merging rtc/rtc-next (19272b37aa4f Linux 6.16-rc1)
Merging nvdimm/libnvdimm-for-next (ef1d3455bbc1 libnvdimm/labels: Fix divid=
e error in nd_label_data_init())
Merging at24/at24/for-next (19272b37aa4f Linux 6.16-rc1)
Merging ntb/ntb-next (0cadf92e93d4 NTB/msi: Remove unused functions)
Merging seccomp/for-next/seccomp (a9b33aae79ce selftests: seccomp: Fix "per=
formace" to "performance")
Merging slimbus/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging nvmem/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (96959283a58d Drivers: hv: Always select CONFIG_=
SYSFB for Hyper-V guests)
Merging auxdisplay/for-next (19272b37aa4f Linux 6.16-rc1)
Merging kgdb/kgdb/for-next (afdbe49276ac kdb: Remove optional size argument=
s from strscpy() calls)
Merging hmm/hmm (19272b37aa4f Linux 6.16-rc1)
Merging cfi/cfi/next (19272b37aa4f Linux 6.16-rc1)
Merging mhi/mhi-next (6348f62ef7ec bus: mhi: host: pci_generic: Add Telit F=
N920C04 modem support)
Merging memblock/for-next (3b394dff15e1 memblock tests: add test for memblo=
ck_set_node)
Merging cxl/next (529a56be66aa Documentation: fix typo in CXL driver docume=
ntation)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (46550e2b878d include: pe.h: Fix PE definitions)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (7819d7e0d830 Merge branch 'slab/for-6.16/testin=
g' into slab/for-next)
Merging random/master (3778dcb2dcc1 random: use offstack cpumask when neces=
sary)
Merging landlock/next (3039ed432745 landlock: Improve bit operations in aud=
it code)
Merging rust/rust-next (19272b37aa4f Linux 6.16-rc1)
Merging rust-alloc/alloc-next (47d8101924b5 rust: vec: impl Default for Vec=
 with any allocator)
Merging rust-pin-init/pin-init-next (fc3870dc5cad rust: pin-init: examples,=
 tests: use `ignore` instead of conditionally compiling tests)
Merging rust-timekeeping/timekeeping-next (679185904972 MAINTAINERS: rust: =
Add a new section for all of the time stuff)
Merging rust-xarray/xarray-next (fa616196fbea MAINTAINERS: add entry for Ru=
st XArray API)
Merging sysctl/sysctl-next (f8dd46ea3a2b sysctl: Remove superfluous include=
s from kernel/sysctl.c)
Merging execve/for-next/execve (11854fe263eb binfmt_elf: Move brk for stati=
c PIE even if ASLR disabled)
Merging bitmap/bitmap-for-next (11fcf368506d uapi: bitops: use UAPI-safe va=
riant of BITS_PER_LONG again)
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (c50b612bef51 ubsan: Fix incorrect hand-side use=
d in handle)
Merging nolibc/for-next (b2c765778a2e selftests/nolibc: make stackprotector=
 probing more robust)
Merging iommufd/for-next (19272b37aa4f Linux 6.16-rc1)
Merging turbostat/next (447c98c1ca4a tools/power turbostat: Add idle govern=
or statistics reporting)
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.8
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.c
Merging pwrseq/pwrseq/for-next (19272b37aa4f Linux 6.16-rc1)
Merging capabilities-next/caps-next (4ae89b1fe7c2 capability: Remove unused=
 has_capability)
Merging ipe/next (324692100cc9 ipe: use SHA-256 library API instead of cryp=
to_shash API)
Merging kcsan/next (9d89551994a4 Linux 6.13-rc6)
Merging crc/crc-next (7234baeec076 lib/crc: remove ARCH_HAS_* kconfig symbo=
ls)
Merging fwctl/for-next (19272b37aa4f Linux 6.16-rc1)
Merging devsec-tsm/next (9d948b880409 Merge branch 'for-6.16/tsm-mr' into t=
sm-next)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)

--Sig_/JA_dKOryao9q+xNYCrqOiCe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhLuiwACgkQAVBC80lX
0Gxwlwf+LUnA8n+T4mAYAY+dam5ypNail4gw54OxpCyOHQlAtddAqb5CGShRCaAe
P1m+eIEvtr0gDBv90VwEOEVLoiXZcX6cc3PDR0fgvzw2lQGulc1R36qlV/mWu9GA
eBDB4wKsNMgxQF79059aHXdgIylSPr6ZlmLWu1Ta93VGS/SoTPfaLjBvKfv2Ce4F
iXpJhoX4QU/61/J2FXF4FZ+45eSOtpSADqSkLF/+a/vLfJOSHjbrpMYi2ifo+YPc
rpZgTWPUDSiFkjWsUItWxBeXvQR+B7uu3+G/JpGpYw6mbQcrS71FgCD20Odv9uje
E32m6Lo2exbGWr7+A70E7+h/21zIOQ==
=ehv7
-----END PGP SIGNATURE-----

--Sig_/JA_dKOryao9q+xNYCrqOiCe--

