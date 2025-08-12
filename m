Return-Path: <linux-next+bounces-7910-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6D2B21C1C
	for <lists+linux-next@lfdr.de>; Tue, 12 Aug 2025 06:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8ED3B2A6B32
	for <lists+linux-next@lfdr.de>; Tue, 12 Aug 2025 04:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B6E2D3EC3;
	Tue, 12 Aug 2025 04:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hJ+dfK6W"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8321A9F8B;
	Tue, 12 Aug 2025 04:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754972839; cv=none; b=Z64yGiWqMJUiod8X9Lzf6qHb+xHvNAWOnrYCcev9vjF7xvj3t33VCW4lTtga2zwaw4x+XGTfueOcFaZ06igdqFycYMoSA32KzlCmV/YoS3UWPjDp0zFwCbmzClJOPWG1lvw/09ISKGtnnxSVKFD6nhSMpQotCrjo64DcHeKUvbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754972839; c=relaxed/simple;
	bh=D9Yr3mmcYQnBWLRAS1Qi7a2hySwat9vBQrSsa9zPyWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cHTf3y9Nubh1brGRgOqZWhmPettp4axOtU9uAGR4/Xxk/ntXP9zskdOE9hVltIuyTlMorjdKkWNcoeJiB7r+e6LkO6xO8HU+9CFwJQU46EXE8h7AWK49mg46Ax4QABQUzbnmNixhjvXbqiqoNim40PQKZqndpC/GtLrE2PJhj/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hJ+dfK6W; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754972828;
	bh=wQsh4Qi5GKQOg6f4gec+JLUwcZPKBmFLtBiEoWQKe7s=;
	h=Date:From:To:Cc:Subject:From;
	b=hJ+dfK6WDnzoKAQIpkg+KlBmusRdlFrJROrJvZno+b/pmPWC+4Qn/M9quzvwWfheA
	 Ls6AIEtnAPzv9JuI1uLn/h51kWU8e2KuF7LkhfENqBu6ezbZ/aqKEeA9dN+h55P5iS
	 /uA7wvRaIAXu81TKyMKBUXWetJMpI/+TdARf5A3b1olSwY8tIhWppU0ZUKaMY/nm2G
	 NrPwaa+OnnZtY5w8T9cq0qehTdzz3CTrdYEarqQ5ZsjURmY4wGZOYTyVpAoiU4XLhp
	 6sMW+SCQvBr2wfftqEV27YyCD5ZAOrz6AOevJJTr1HMj0GdNh7iRtm5Fmb+Zr0cwFi
	 Pc2Oe+qzYAtBQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c1JPR6wQmz4xf5;
	Tue, 12 Aug 2025 14:27:07 +1000 (AEST)
Date: Tue, 12 Aug 2025 14:27:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 12
Message-ID: <20250812142707.5b3b1c4f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BL6Tyh3yzvVOp6mqtmtdUXe";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BL6Tyh3yzvVOp6mqtmtdUXe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250808:

The pwm tree gained a semantic conflict against Linus' tree.

Non-merge commits (relative to Linus' tree): 1205
 1180 files changed, 33029 insertions(+), 19720 deletions(-)

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

I am currently merging 405 trees (counting Linus' and 153 trees of bug
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
Merging origin/master (8f5ae30d69d7 Linux 6.17-rc1)
Merging fixes/fixes (89be9a83ccf1 Linux 6.16-rc7)
Merging ext4-fixes/fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging vfs-brauner-fixes/vfs.fixes (542ede096e48 fuse: keep inode->i_blkbi=
ts constant)
Merging fscrypt-current/for-current (8f5ae30d69d7 Linux 6.17-rc1)
Merging fsverity-current/for-current (8f5ae30d69d7 Linux 6.17-rc1)
Merging btrfs-fixes/next-fixes (c712ad523510 Merge branch 'misc-6.17' into =
next-fixes)
Merging vfs-fixes/fixes (33927f3d0ecd habanalabs: fix UAF in export_dmabuf(=
))
Merging erofs-fixes/fixes (0b96d9bed324 erofs: fix block count report when =
48-bit layout is on)
Merging nfsd-fixes/nfsd-fixes (bee47cb026e7 sunrpc: fix handling of server =
side tls alerts)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (924577e4f6ca ovl: Fix nested backing fil=
e paths)
Merging bcachefs/for-next (65c604dba89a bcachefs: Lift multi-pass range che=
ck out of check_bp_exists())
Merging fscrypt/for-next (0e6608d4938e fscrypt: Remove redundant __GFP_NOWA=
RN)
Merging btrfs/for-next (442ee950ea05 Merge branch 'for-next-current-v6.15-2=
0250722' into for-next-20250722)
Merging ceph/master (b828b4bf29d1 ceph: fix variable dereferenced before ch=
eck in ceph_umount_begin())
Merging cifs/for-next (127b561b9b85 smb: client: make use of smbdirect_sock=
et.status_wait)
Merging configfs/configfs-next (c6b190822459 MAINTAINERS: add configfs Rust=
 abstractions)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (6f8b4788266c dlm: drop SCTP Kconfig dependency)
Merging erofs/dev (df0ce6cefa45 erofs: support to readahead dirent blocks i=
n erofs_readdir())
Merging exfat/dev (150e5bf74c98 exfat: optimize allocation bitmap loading t=
ime)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (17e58687367a Merge fsnotify changes with fixed up au=
thorship.)
Merging ext4/dev (261a2abe20b0 ext4: fix unused variable warning in ext4_in=
it_new_dir)
Merging f2fs/dev (8f5ae30d69d7 Linux 6.17-rc1)
Merging fsverity/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging fuse/for-next (f0e84022479b virtio_fs: Remove redundant spinlock in=
 virtio_fs_request_complete())
Merging gfs2/for-next (a90f1b6ad664 Merge tag 'gfs2-for-6.17' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2)
Merging jfs/jfs-next (856db3759202 jfs: fix metapage reference count leak i=
n dbAllocCtl)
Merging ksmbd/ksmbd-for-next (1241ca6b8582 smb: server: make use of smbdire=
ct_socket.{send,recv}_io.mem.{cache,pool})
Merging nfs/linux-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging nfs-anna/linux-next (38074de35b01 NFSv4/flexfiles: Fix handling of =
NFS level errors in I/O)
Merging nfsd/nfsd-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging ntfs3/master (a49f0abd8959 Revert "fs/ntfs3: Replace inode_trylock =
with inode_lock")
Merging orangefs/for-next (2138e89cb066 fs/orangefs: Allow 2 more character=
s in do_c_string())
Merging overlayfs/overlayfs-next (6f9ccdad0fea ovl: Annotate struct ovl_ent=
ry with __counted_by())
Merging ubifs/next (99dbb2a1bd66 ubifs: stop using write_cache_pages)
Merging v9fs/9p-next (4210030d8bc4 docs: fs/9p: Add missing "not" in cache =
documentation)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging zonefs/for-next (6982100bb829 zonefs: use ZONEFS_SUPER_SIZE instead=
 of PAGE_SIZE)
Merging vfs-brauner/vfs.all (0eeabb222c2a Merge branch 'vfs-6.18.mount' int=
o vfs.all)
Merging vfs/for-next (dd589648208a Merge branch 'work.mount' into for-next)
CONFLICT (content): Merge conflict in Documentation/filesystems/porting.rst
Merging mm-hotfixes/mm-hotfixes-unstable (f1f0068165a4 mm/userfaultfd: fix =
kmap_local LIFO ordering for CONFIG_HIGHPTE)
Merging fs-current (92d632a9772b Merge branch 'nfsd-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/cel/linux)
Merging kbuild-current/kbuild-fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging arc-current/for-curr (d7b8f8e20813 Linux 6.16-rc5)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging arm-soc-fixes/arm/fixes (0c952efa0d7c Merge tag 'tegra-for-6.17-arm=
64-dt-v3' of https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux in=
to arm/fixes)
Merging davinci-current/davinci/for-current (8f5ae30d69d7 Linux 6.17-rc1)
Merging drivers-memory-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging sophgo-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging sophgo-soc-fixes/soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging m68k-current/for-linus (c8995932db2b m68k: mac: Improve clocksource=
 driver commentary)
Merging powerpc-fixes/fixes (ab107276607a powerpc: Fix struct termio relate=
d ioctl macros)
Merging s390-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging net/main (33caa208dba6 hv_netvsc: Fix panic during namespace deleti=
on with VF)
Merging bpf/master (561c80369df0 Merge tag 'tty-6.16-rc1-2' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/gregkh/tty)
Merging ipsec/master (d8369183a01a Merge branch 'xfrm: some fixes for GSO w=
ith SW crypto')
Merging netfilter/main (33caa208dba6 hv_netvsc: Fix panic during namespace =
deletion with VF)
Merging ipvs/main (d942fe13f72b net: ti: icssg-prueth: Fix skb handling for=
 XDP_PASS)
Merging wireless/for-next (6832a9317eee Merge tag 'net-6.16-rc7' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ath/for-current (d9104cec3e8f Merge tag 'bpf-next-6.17' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next)
Merging iwlwifi/fixes (6832a9317eee Merge tag 'net-6.16-rc7' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (a9a9e68954f2 RDMA/mlx5: Fix vport loopback for M=
PV device)
Merging sound-current/for-linus (b26e2afb3834 ALSA: hda/realtek: Fix headse=
t mic on HONOR BRB-X)
Merging sound-asoc-fixes/for-linus (4bafaff30f0f Merge remote-tracking bran=
ch 'asoc/for-6.16' into asoc-linus)
Merging regmap-fixes/for-linus (067aa458a064 Merge remote-tracking branch '=
regmap/for-6.16' into regmap-linus)
Merging regulator-fixes/for-linus (10dfd36f0784 regulator: core: correct co=
nvergence check in regulator_set_voltage())
Merging spi-fixes/for-linus (afa03b83aa4d Merge remote-tracking branch 'spi=
/for-6.16' into spi-linus)
Merging pci-current/for-linus (a50e96a4214f PCI: vmd: Remove MSI-X check on=
 child devices)
Merging driver-core.current/driver-core-linus (eb5ca9094a18 mm/vmscan: fix =
inverted polarity in lru_gen_seq_show())
Merging tty.current/tty-linus (2b38afce25c4 Merge tag 'turbostat-2025.09.09=
' of git://git.kernel.org/pub/scm/linux/kernel/git/lenb/linux)
Merging usb.current/usb-linus (2b38afce25c4 Merge tag 'turbostat-2025.09.09=
' of git://git.kernel.org/pub/scm/linux/kernel/git/lenb/linux)
Merging usb-serial-fixes/usb-linus (ad1244e1ce18 USB: serial: option: add F=
oxconn T99W709)
Merging phy/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging staging.current/staging-linus (8f5ae30d69d7 Linux 6.17-rc1)
Merging iio-fixes/fixes-togreg (80e8c3730645 iio: adc: ad7124: fix channel =
lookup in syscalib functions)
Merging counter-current/counter-current (19272b37aa4f Linux 6.16-rc1)
Merging char-misc.current/char-misc-linus (8f5ae30d69d7 Linux 6.17-rc1)
Merging soundwire-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging thunderbolt-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging input-current/for-linus (ab93e0dd72c3 Merge branch 'next' into for-=
linus)
Merging crypto-current/master (9d9b193ed73a crypto: hash - Increase HASH_MA=
X_DESCSIZE for hmac(sha3-224-s390))
Merging libcrypto-fixes/libcrypto-fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging vfio-fixes/for-linus (c1d9dac0db16 vfio/pci: Align huge faults to o=
rder)
Merging kselftest-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging dmaengine-fixes/fixes (5068b5254812 dmaengine: qcom: bam_dma: Fix D=
T error handling for num-channels/ees)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (6463cbe08b0c mtd: spinand: fix memory leak of =
ECC engine conf)
Merging mfd-fixes/for-mfd-fixes (d9d79e4f7dc9 mfd: Fix building without CON=
FIG_OF)
Merging v4l-dvb-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging reset-fixes/reset/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging mips-fixes/mips-fixes (86731a2a651e Linux 6.16-rc3)
Merging at91-fixes/at91-fixes (19272b37aa4f Linux 6.16-rc1)
Merging omap-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging kvm-fixes/master (038d61fd6422 Linux 6.16)
Merging kvms390-fixes/master (d8dfda5af0be KVM: s390: pv: fix race when mak=
ing a page secure)
Merging hwmon-fixes/hwmon (6d24d3a1a5c6 hwmon: mlxreg-fan: Prevent fans fro=
m getting stuck at 0 RPM)
Merging nvdimm-fixes/libnvdimm-fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging cxl-fixes/fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging dma-mapping-fixes/dma-mapping-fixes (2c223f7239f3 of: reserved_mem:=
 Restructure call site for dma_contiguous_early_fixup())
Merging drivers-x86-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging samsung-krzk-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging pinctrl-samsung-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging devicetree-fixes/dt/linus (79aef1a3705b of: Clarify OF device conte=
xt in of_match_device() comment)
Merging dt-krzk-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging scsi-fixes/fixes (021f243627ea scsi: ufs: core: Fix spelling of a s=
ysfs attribute name)
Merging drm-fixes/drm-fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging drm-intel-fixes/for-linux-next-fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging mmc-fixes/fixes (4b290aae788e Merge tag 'sysctl-6.17-rc1' of git://=
git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl)
Merging rtc-fixes/rtc-fixes (08d82d0cad51 rtc: pcf2127: add missing semicol=
on after statement)
Merging gnss-fixes/gnss-linus (86731a2a651e Linux 6.16-rc3)
Merging hyperv-fixes/hyperv-fixes (a4131a50d072 tools/hv: fcopy: Fix irregu=
larities with size of ring buffer)
Merging risc-v-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging riscv-dt-fixes/riscv-dt-fixes (19272b37aa4f Linux 6.16-rc1)
Merging riscv-soc-fixes/riscv-soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging spdx/spdx-linus (2b38afce25c4 Merge tag 'turbostat-2025.09.09' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/lenb/linux)
Merging gpio-brgl-fixes/gpio/for-current (8f5ae30d69d7 Linux 6.17-rc1)
Merging gpio-intel-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging pinctrl-intel-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging auxdisplay-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging kunit-fixes/kunit-fixes (19272b37aa4f Linux 6.16-rc1)
Merging memblock-fixes/fixes (da8bf5daa5e5 memblock: Accept allocated memor=
y before use in memblock_double_array())
Merging renesas-fixes/fixes (379c590113ce ARM: shmobile: smp: Enforce shmob=
ile_smp_* alignment)
Merging perf-current/perf-tools (6235ce77749f perf record: Cache build-ID o=
f hit DSOs only)
Merging efi-fixes/urgent (64e135f1eaba efivarfs: Fix memory leak of efivarf=
s_fs_info in fs_context error paths)
Merging battery-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging iommufd-fixes/for-rc (9a96876e3c65 iommufd/selftest: Fix build warn=
ings due to uninitialized mfd)
Merging rust-fixes/rust-fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging w1-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging pmdomain-fixes/fixes (b6bcbce33596 soc/tegra: pmc: Ensure power-dom=
ains are in a known state)
Merging i2c-host-fixes/i2c/i2c-host-fixes (7e161a991ea7 Merge tag 'i2c-for-=
6.17-rc1-part2' of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (e4b2a0c2b9be Merge tag 'sunxi-clk-fixes-for-6.=
16' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into clk=
-fixes)
Merging thead-clk-fixes/thead-clk-fixes (19272b37aa4f Linux 6.16-rc1)
Merging pwrseq-fixes/pwrseq/for-current (8f5ae30d69d7 Linux 6.17-rc1)
Merging thead-dt-fixes/thead-dt-fixes (19272b37aa4f Linux 6.16-rc1)
Merging ftrace-fixes/ftrace/fixes (327e28664307 fgraph: Do not enable funct=
ion_graph tracer when setting funcgraph-args)
Merging ring-buffer-fixes/ring-buffer/fixes (e4d4b8670c44 ring-buffer: Use =
flush_kernel_vmap_range() over flush_dcache_folio())
Merging trace-fixes/trace/fixes (b5e8acc14dcb tracing: Add down_write(trace=
_event_sem) when adding trace event)
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging tip-fixes/tip/urgent (8f5ae30d69d7 Linux 6.17-rc1)
Merging slab-fixes/slab/for-next-fixes (be8250786ca9 mm, slab: clean up sla=
b->obj_exts always)
Merging drm-msm-fixes/msm-fixes (42464c51cccc drm/msm: Fix objtool warning =
in submit_lock_objects())
Merging uml-fixes/fixes (2dca89df0d11 Merge tag 'uml-for-6.16-rc4' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/uml/linux)
Merging fwctl-fixes/for-rc (19272b37aa4f Linux 6.16-rc1)
Merging devsec-tsm-fixes/fixes (fba4ceaa242d configfs-tsm-report: Fix NULL =
dereference of tsm_ops)
Merging drm-misc-fixes/for-linux-next-fixes (360077278ba6 rust: drm: don't =
pass the address of drm::Device to drm_dev_put())
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (6bcdbd62bd56 Merge tag 'for-linus' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/rmk/linux)
Merging mm-nonmm-stable/mm-nonmm-stable (6bcdbd62bd56 Merge tag 'for-linus'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/rmk/linux)
Merging mm-unstable/mm-unstable (c2144e09b922 mm-filemap-align-last_index-t=
o-folio-size-fix)
Merging mm-nonmm-unstable/mm-nonmm-unstable (0624b0aa7c6e ocfs2: kill osb->=
system_file_mutex lock)
Merging kbuild/kbuild-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (6235ce77749f perf record: Cache build-ID of h=
it DSOs only)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/dma-mapping-for-next (110aa2c74dbd swiotlb: Remove redu=
ndant __GFP_NOWARN)
Merging asm-generic/master (582847f97024 Makefile.kcov: apply needed compil=
er option unconditionally in CFLAGS_KCOV)
Merging alpha/alpha-next (1523226edda5 alpha: Use str_yes_no() helper in pc=
i_dac_dma_supported())
Merging arm/for-next (8dd85887ad83 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (5b1ae9de7133 Merge branch 'for-next/feat_mte_s=
tore_only' into for-next/core)
Merging arm-perf/for-next/perf (e480898e767c drivers/perf: hisi: Support PM=
Us with no interrupt)
Merging arm-soc/for-next (9f9d41d64322 Merge tag 'arm-soc/for-6.17/drivers-=
part2' of https://github.com/Broadcom/stblinux into arm/fixes)
Merging amlogic/for-next (58abdca0eb65 Merge branch 'v6.17/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (a0d983779391 Merge branch 'apple-soc/=
drivers-6.18' into asahi-soc/for-next)
Merging at91/at91-next (e99113d11171 Merge branch 'clk-microchip' into at91=
-next)
Merging bmc/for-next (f070580abddc Merge branches 'aspeed/dt', 'aspeed/driv=
ers', 'nuvoton/arm/dt' and 'nuvoton/arm64/dt' into for-next)
Merging broadcom/next (89abb622d518 Merge branch 'drivers/next' into next)
Merging davinci/davinci/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging drivers-memory/for-next (d140f3ba76ac memory: stm32_omm: Fix req2ac=
k update test)
Merging fsl/soc_fsl (8b3da0519ae6 soc: fsl: qe: convert set_multiple() to r=
eturning an integer)
CONFLICT (content): Merge conflict in drivers/soc/fsl/qe/gpio.c
Merging imx-mxs/for-next (cdc22fb12eff Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (6cbb623586d5 Merge branches 'v6.16-next/arm32', =
'v6.16-next/dts32', 'v6.16-next/dts64' and 'v6.16-next/soc' into for-next)
Merging mvebu/for-next (88084e0358ff Merge branch 'mvebu/dt' into mvebu/for=
-next)
Merging omap/for-next (db91121f001a Merge branch 'omap-for-v6.17/soc' into =
tmp/omap-next-20250707.142928)
Merging qcom/for-next (f4ef1f67036f Merge branches 'arm32-for-6.18', 'arm64=
-for-6.18', 'clk-fixes-for-6.17', 'clk-for-6.18', 'drivers-fixes-for-6.17' =
and 'drivers-for-6.18' into for-next)
Merging renesas/next (7a323accaf6b Merge branches 'renesas-arm-defconfig-fo=
r-v6.17', 'renesas-drivers-for-v6.17', 'renesas-dt-bindings-for-v6.17' and =
'renesas-dts-for-v6.17' into renesas-next)
Merging reset/reset/next (8d81298d87f4 MAINTAINERS: Use https:// protocol f=
or Reset Controller Framework tree)
Merging rockchip/for-next (7f0817eee7ba Merge branch 'v6.18-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (187a3426a664 dt-bindings: soc: samsung: usi:=
 add samsung,exynos2200-usi compatible)
Merging scmi/for-linux-next (d2eedaa3909b Merge tag 'rtc-6.17' of git://git=
.kernel.org/pub/scm/linux/kernel/git/abelloni/linux)
Merging sophgo/for-next (349ae53a949c Merge branch 'dt/riscv' into for-next)
Merging sophgo-soc/soc-for-next (c8754c7deab4 soc: sophgo: cv1800: rtcsys: =
New driver (handling RTC only))
Merging spacemit/for-next (6be7a5a768aa Merge branch 'spacemit-clk-for-6.17=
' into spacemit-for-next)
Merging stm32/stm32-next (1a32f7427eb3 arm64: dts: st: remove empty line in=
 stm32mp251.dtsi)
Merging sunxi/sunxi/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging tee/next (84c5f44d24c6 Merge branch 'tee_fixes_for_v6.17' into next)
Merging tegra/for-next (499b75defe56 Merge branch for-6.17/arm64/defconfig =
into for-next)
Merging thead-dt/thead-dt-for-next (c31f2899eab0 riscv: dts: thead: Add PVT=
 node)
Merging ti/ti-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging xilinx/for-next (3a0e3f82b8ee Merge branch 'zynqmp/dt' into for-nex=
t)
Merging clk/clk-next (64c21f253a37 Merge branch 'clk-fixes' into clk-next)
Merging clk-imx/for-next (c78865241ecf MAINTAINERS: Update i.MX Clock Entry)
Merging clk-renesas/renesas-clk (0ab2d84f94da clk: renesas: r9a08g045: Add =
MSTOP for coupled clocks as well)
Merging thead-clk/thead-clk-for-next (54edba916e29 clk: thead: th1520-ap: D=
escribe mux clocks with clk_mux)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (d35ec48fa6c8 LoongArch: vDSO: Remove -nos=
tdlib complier flag)
Merging m68k/for-next (c8995932db2b m68k: mac: Improve clocksource driver c=
ommentary)
Merging m68knommu/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging microblaze/next (c0e7bb02f796 microblaze: Replace __ASSEMBLY__ with=
 __ASSEMBLER__ in non-uapi headers)
Merging mips/mips-next (3ebcbf079c26 MIPS: Don't use %pK through printk)
Merging openrisc/for-next (f0eedcf22581 openrisc: Replace __ASSEMBLY__ with=
 __ASSEMBLER__ in non-uapi headers)
Merging parisc-hd/for-next (89f686a0fb6e parisc: Revise __get_user() to pro=
be user read access)
Merging powerpc/next (cf2a6de32cab powerpc64/bpf: Add jit support for load_=
acquire and store_release)
Merging risc-v/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging riscv-dt/riscv-dt-for-next (cb69daf085b5 dt-bindings: riscv: Add Si=
Five vendor extensions description)
Merging riscv-soc/riscv-soc-for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging s390/for-next (85f744617f1a Merge branch 'features' into for-next)
Merging sh/for-next (c32969d0362a sh: Do not use hyphen in exported variabl=
e name)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (fc9ed2f6589d um: Replace __ASSEMBLY__ with __ASSEMBLER__ =
in the usermode headers)
Merging xtensa/xtensa-for-next (44a4ef59d550 xtensa: Replace __ASSEMBLY__ w=
ith __ASSEMBLER__ in non-uapi headers)
Merging fs-next (fd29e1b82864 Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (dcc3191a3dde Merge branch 'rework/ringbuffer-kunit=
-test' into for-next)
Merging pci/next (8f5ae30d69d7 Linux 6.17-rc1)
Merging pstore/for-next/pstore (d679c2e1e8d9 pstore/zone: rewrite some comm=
ents for better understanding)
Merging hid/for-next (0239373b578e Merge branch 'for-6.17/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (94c296776403 i2c: muxes: pca954x: Reset if (de)se=
lect fails)
Merging i2c-host/i2c/i2c-host (7e161a991ea7 Merge tag 'i2c-for-6.17-rc1-par=
t2' of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging i3c/i3c/next (3b661ca549b9 i3c: add missing include to internal hea=
der)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (9703c672af8d MAINTAINERS: Mark coretemp d=
river as orphaned)
Merging jc_docs/docs-next (2115dc3e3376 docs: filesystems: sysfs: Recommend=
 sysfs_emit() for new code only)
Merging v4l-dvb/next (8f5ae30d69d7 Linux 6.17-rc1)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (c5e1d62cf743 Merge branch 'fixes' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (2b5066a3a19a cpufreq: qcom-nvme=
m: Enable cpufreq for ipq5424)
Merging cpupower/cpupower (e6c3f96141eb cpupower: Allow control of boost fe=
ature on non-x86 based systems with boost support.)
Merging devfreq/devfreq-next (7da2fdaaa1e6 PM / devfreq: Add HiSilicon unco=
re frequency scaling driver)
Merging pmdomain/next (8f5ae30d69d7 Linux 6.17-rc1)
Merging opp/opp/linux-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging thermal/thermal/linux-next (1d264d3a1988 dt-bindings: thermal: tegr=
a: Document Tegra210B01)
Merging rdma/for-next (c18646248fed RDMA/siw: Fix the sendmsg byte count in=
 siw_tcp_sendpages)
Merging net-next/main (37816488247d Merge tag 'net-6.17-rc1' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging bpf-next/for-next (821c9e515db5 Merge tag 'for_linus' of git://git.=
kernel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging ipsec-next/master (d9104cec3e8f Merge tag 'bpf-next-6.17' of git://=
git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next)
Merging mlx5-next/mlx5-next (888a7776f4fb net/mlx5: Add support for device =
steering tag)
Merging netfilter-next/main (37816488247d Merge tag 'net-6.17-rc1' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ipvs-next/main (d9104cec3e8f Merge tag 'bpf-next-6.17' of git://git=
.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next)
Merging bluetooth/master (159053f1b531 MAINTAINERS: add a sub-entry for the=
 Qualcomm bluetooth driver)
Merging wireless-next/for-next (126d85fb0405 Merge tag 'wireless-next-2025-=
07-24' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless=
-next)
Merging ath-next/for-next (d9104cec3e8f Merge tag 'bpf-next-6.17' of git://=
git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next)
Merging iwlwifi-next/next (d2af710d6d50 wifi: iwlwifi: mvm/fw: Avoid -Wflex=
-array-member-not-at-end warnings)
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (9cf9db888f38 Merge tag 'nand/for-6.17' into mtd/next)
Merging nand/nand/next (fb2fae70e7e9 mtd: spinand: winbond: Add comment abo=
ut the maximum frequency)
Merging spi-nor/spi-nor/next (2e3a7476ec39 mtd: spi-nor: Fix spi_nor_try_un=
lock_all())
Merging crypto/master (9d9b193ed73a crypto: hash - Increase HASH_MAX_DESCSI=
ZE for hmac(sha3-224-s390))
Merging libcrypto/libcrypto-next (f5cd8fd81a88 lib/crypto: tests: Add KUnit=
 tests for MD5 and HMAC-MD5)
Merging drm/drm-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging drm-exynos/for-linux-next (19272b37aa4f Linux 6.16-rc1)
Merging drm-misc/for-linux-next (216d6d913861 drm/panfrost: Print RSS for t=
iler heap BO's in debugfs GEMS file)
Merging amdgpu/drm-next (260dcf5b06d5 drm/radeon/r600_cs: clean up of dead =
code in r600_cs)
Merging drm-intel/for-linux-next (46fb38cb20c0 drm/i915/psr: Do not trigger=
 Frame Change events from frontbuffer flush)
Merging drm-msm/msm-next (8290d37ad2b0 drm/msm: Small function param doc fi=
x)
Merging drm-msm-lumag/msm-next-lumag (cd86e80b77b2 drm/msm/dp: add linux/io=
.h header to fix build errors)
Merging drm-nova/nova-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging drm-xe/drm-xe-next (17593a69b75f drm/xe: rework PDE PAT index selec=
tion)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_configfs.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_gt_sriov_pf.c
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (cfef940e162b fbdev: xenfb: Use vmalloc_array to sim=
plify code)
Merging regmap/for-next (067aa458a064 Merge remote-tracking branch 'regmap/=
for-6.16' into regmap-linus)
Merging sound/for-next (f4ee43ae6ea8 ALSA: hda: Add TAS5825 support)
Merging ieee1394/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging sound-asoc/for-next (4bafaff30f0f Merge remote-tracking branch 'aso=
c/for-6.16' into asoc-linus)
Merging modules/modules-next (40a826bd6c82 module: Rename MAX_PARAM_PREFIX_=
LEN to __MODULE_NAME_LEN)
Merging input/next (4f67c4189467 HID: hid-steam: Use new BTN_GRIP* buttons)
Merging block/for-next (9c28ff6c60ff Merge branch 'block-6.17' into for-nex=
t)
Merging device-mapper/for-next (6fde633b1934 dm bufio: remove redundant __G=
FP_NOWARN)
Merging libata/for-next (6cb43739b93c ata: pata_pdc2027x: Remove space befo=
re newline and abbreviations)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (4b290aae788e Merge tag 'sysctl-6.17-rc1' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/sysctl/sysctl)
Merging mfd/for-mfd-next (006aa8f57f55 mfd: dt-bindings: Convert TPS65910 t=
o DT schema)
Merging backlight/for-backlight-next (19272b37aa4f Linux 6.16-rc1)
Merging battery/for-next (7b41a2341fa6 power: supply: core: fix static chec=
ker warning)
Merging regulator/for-next (10dfd36f0784 regulator: core: correct convergen=
ce check in regulator_set_voltage())
Merging security/next (5816bf4273ed lsm,selinux: Add LSM blob support for B=
PF objects)
Merging apparmor/apparmor-next (5f49c2d1f422 apparmor: fix: oops when tryin=
g to free null ruleset)
Merging integrity/next-integrity (aa9bb1b32594 ima: add a knob ima=3D to al=
low disabling IMA in kdump kernel)
Merging selinux/next (d4e8dc8e8b34 selinux: use a consistent method to get =
full socket from skb)
Merging smack/next (6ddd169d0288 smack: fix kernel-doc warnings for smk_imp=
ort_valid_label())
Merging tomoyo/master (038d61fd6422 Linux 6.16)
Merging tpmdd/next (7f0c6675b319 tpm_crb_ffa: handle tpm busy return code)
Merging watchdog/master (48defdf6b083 watchdog: sbsa: Adjust keepalive time=
out to avoid MediaTek WS0 race condition)
Merging iommu/next (b9e6e8ae0a5f Merge branch 'arm/smmu/updates' into next)
Merging audit/next (ce8370e2e62a audit: record fanotify event regardless of=
 presence of rules)
Merging devicetree/for-next (c2a1a5ede471 dt-bindings: powerpc: Drop duplic=
ate fsl/mpic.txt)
Merging dt-krzk/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging mailbox/for-next (5378bdf6a611 mailbox/pcc: support mailbox managem=
ent of the shared buffer)
Merging spi/for-next (afa03b83aa4d Merge remote-tracking branch 'spi/for-6.=
16' into spi-linus)
Merging tip/master (4b6b14d20bc0 Merge branch into tip/master: 'timers/cloc=
ksource')
Merging clockevents/timers/drivers/next (d7b8f8e20813 Linux 6.16-rc5)
Merging edac/edac-for-next (1fb0ddddf5d1 Merge branch 'edac-drivers' into e=
dac-for-next)
CONFLICT (content): Merge conflict in drivers/edac/mem_repair.c
Merging ftrace/for-next (39f069d5a466 Merge unwind/for-next)
Merging rcu/next (61399e0c5410 rcu: Fix racy re-initialization of irq_work =
causing hangs)
Merging paulmck/non-rcu/next (b706eec9304f Merge branches 'lkmm.2025.07.09a=
', 'ratelimit.2025.06.24a' and 'stop-machine.2025.07.17a' into HEAD)
Merging kvm/next (196d9e72c4b0 Merge tag 'kvm-s390-next-6.17-1' of https://=
git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging kvm-arm/next (7b8346bd9fce KVM: arm64: Don't attempt vLPI mappings =
when vPE allocation is disabled)
Merging kvms390/next (efe54612bdb6 improve interrupt cpu)
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (07a289a03140 RISC-V: KVM: Avoid re-acquir=
ing memslot in kvm_riscv_gstage_map())
Merging kvm-x86/next (33f843444e28 Merge branch 'vmx')
Merging xen-tip/linux-next (114a2de6fa86 xen/netfront: Fix TX response spur=
ious interrupts)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (324cee0c272c Merge branch 'for-6.17' into for-=
next)
Merging sched-ext/for-next (4b3570b49067 Merge branch 'for-6.17-fixes' into=
 for-next)
Merging drivers-x86/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging chrome-platform/for-next (032c59c1d3cd platform/chrome: cros_ec_cha=
rdev: Decouple fops from struct cros_ec_dev)
Merging chrome-platform-firmware/for-firmware-next (8f5ae30d69d7 Linux 6.17=
-rc1)
Merging hsi/for-next (19272b37aa4f Linux 6.16-rc1)
Merging leds-lj/for-leds-next (4903924ac7ef dt-bindings: leds: ncp5623: Add=
 0x39 as a valid I2C address)
Merging ipmi/for-next (ec50ec378e3f ipmi: Use dev_warn_ratelimited() for in=
correct message warnings)
Merging driver-core/driver-core-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging usb/usb-next (2b38afce25c4 Merge tag 'turbostat-2025.09.09' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/lenb/linux)
Merging thunderbolt/next (0eff12ce88e1 thunderbolt: Use HMAC-SHA256 library=
 instead of crypto_shash)
Merging usb-serial/usb-next (bdf2ab177e2f USB: serial: cp210x: use new GPIO=
 line value setter callbacks)
Merging tty/tty-next (2b38afce25c4 Merge tag 'turbostat-2025.09.09' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/lenb/linux)
Merging char-misc/char-misc-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (a80198ba650f coresight: fix indentation error in cs=
cfg_remove_owned_csdev_configs())
Merging fastrpc/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga/for-next (4f156ee58bb8 fpga: zynq_fpga: Fix the wrong usage of=
 dma_map_sgtable())
Merging icc/icc-next (ca652cf0c261 Merge branch 'icc-milos' into icc-next)
Merging iio/togreg (0a686b9c4f84 iio: adc: ad_sigma_delta: Select IIO_BUFFE=
R_DMAENGINE and SPI_OFFLOAD)
Merging phy-next/next (8f5ae30d69d7 Linux 6.17-rc1)
Merging soundwire/next (8f5ae30d69d7 Linux 6.17-rc1)
Merging extcon/extcon-next (5f09caafc652 extcon: fsa9480: Avoid buffer over=
flow in fsa9480_handle_change())
Merging gnss/gnss-next (e326371f3002 dt-bindings: gnss: u-blox: add u-blox,=
neo-9m compatible)
Merging vfio/next (b1779e4f209c vfio/type1: conditional rescheduling while =
pinning)
Merging w1/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging spmi/spmi-next (0ff41df1cb26 Linux 6.15)
Merging staging/staging-next (5f5743e5b599 staging: axis-fifo: remove unnec=
essary dev_set_drvdata() calls)
Merging counter-next/counter-next (19272b37aa4f Linux 6.16-rc1)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (8f5ae30d69d7 Linux 6.17-rc1)
Merging cgroup/for-next (eea51c6e3f66 cgroup: avoid null de-ref in css_rsta=
t_exit())
Merging scsi/for-next (3aaa3b2d116e Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (72fc388d8bc0 scsi: ufs: core: Remove error print=
 for devm_add_action_or_reset())
Merging vhost/linux-next (cf3409c6a41a Revert "virtio: reject shm region if=
 length is zero")
Merging rpmsg/for-next (01d7d9241256 Merge branches 'rproc-next' and 'rpmsg=
-next' into for-next)
Merging gpio-brgl/gpio/for-next (38f7b4a6a051 Merge tag 'gpio-aggregator-re=
factoring-for-v6.18-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/b=
rgl/linux into gpio/for-next)
Merging gpio-intel/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging pinctrl/for-next (a3fe1324c3c5 pinctrl: mediatek: Add pinctrl drive=
r for mt8189)
Merging pinctrl-intel/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging pinctrl-renesas/renesas-pinctrl (7000167796a0 pinctrl: renesas: Sim=
plify PINCTRL_RZV2M logic)
Merging pinctrl-samsung/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging pwm/pwm/for-next (48fbc945565e pwm: mediatek: Lock and cache clock =
rate)
Applying: fix up for "pwm: Provide a gpio device for waveform drivers"
Merging ktest/for-next (a5e71638ddd7 ktest.pl: Add new PATCHCHECK_SKIP opti=
on to skip testing individual commits)
Merging kselftest/next (30fb5e134f05 selftests/pidfd: Fix duplicate-symbol =
warnings for SCHED_ CPP symbols)
Merging kunit/test (19272b37aa4f Linux 6.16-rc1)
Merging kunit-next/kunit (34db4fba8191 kunit: fix longest symbol length tes=
t)
Merging livepatching/for-next (a8e905a819fd Merge branch 'for-6.15/ftrace-t=
est' into for-next)
Merging rtc/rtc-next (bb5b0b4317c9 rtc: ds1685: Update Joshua Kinard's emai=
l address.)
Merging nvdimm/libnvdimm-for-next (9f97e61bde6a cxl: Include range.h in cxl=
.h)
Merging at24/at24/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging ntb/ntb-next (0cadf92e93d4 NTB/msi: Remove unused functions)
Merging seccomp/for-next/seccomp (b0c9bfbab925 selftests/seccomp: Add a tes=
t for the WAIT_KILLABLE_RECV fast reply race)
Merging slimbus/for-next (0af2f6be1b42 Linux 6.15-rc1)
Merging nvmem/for-next (19272b37aa4f Linux 6.16-rc1)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (d9016a249be5 hv/hv_kvp_daemon: Prevent similar =
logs in kvp_key_add_or_modify())
Merging auxdisplay/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging kgdb/kgdb/for-next (afdbe49276ac kdb: Remove optional size argument=
s from strscpy() calls)
Merging hmm/hmm (19272b37aa4f Linux 6.16-rc1)
Merging cfi/cfi/next (19272b37aa4f Linux 6.16-rc1)
Merging mhi/mhi-next (00559ba3ae74 bus: mhi: host: pci_generic: Add Telit F=
N990B40 modem support)
Merging memblock/for-next (3b394dff15e1 memblock tests: add test for memblo=
ck_set_node)
Merging cxl/next (f11a5f89910a Documentation/ABI/testing/debugfs-cxl: Add '=
cxl' to clear_poison path)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (02eb7a8eee20 efi: add API doc entry for ovmf_debug_log)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (8185696483dc MAINTAINERS: add missing files to =
slab section)
Merging random/master (3778dcb2dcc1 random: use offstack cpumask when neces=
sary)
Merging landlock/next (6dde339a3df8 landlock: Minor comments improvements)
Merging rust/rust-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging rust-alloc/alloc-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging rust-io/io-next (86731a2a651e Linux 6.16-rc3)
Merging rust-pin-init/pin-init-next (fc3870dc5cad rust: pin-init: examples,=
 tests: use `ignore` instead of conditionally compiling tests)
Merging rust-timekeeping/timekeeping-next (d4b29ddf82a4 rust: time: Add wra=
pper for fsleep() function)
Merging rust-xarray/xarray-next (fa616196fbea MAINTAINERS: add entry for Ru=
st XArray API)
Merging sysctl/sysctl-next (19272b37aa4f Linux 6.16-rc1)
Merging execve/for-next/execve (7f71195c15dc fork: reorder function qualifi=
ers for copy_clone_args_from_user)
Merging bitmap/bitmap-for-next (89748acdf226 Merge tag 'drm-next-2025-08-01=
' of https://gitlab.freedesktop.org/drm/kernel)
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (f627b51aaa04 compiler_types: Provide __no_kstac=
k_erase to disable coverage only on Clang)
Merging nolibc/for-next (b9e50363178a selftests/nolibc: add x32 test config=
uration)
Merging iommufd/for-next (2c78e74493d3 iommu/arm-smmu-v3: Replace vsmmu_siz=
e/type with get_viommu_size)
Merging turbostat/next (447c98c1ca4a tools/power turbostat: Add idle govern=
or statistics reporting)
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.8
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.c
Merging pwrseq/pwrseq/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging capabilities-next/caps-next (cdd73b166607 uapi: fix broken link in =
linux/capability.h)
Merging ipe/next (038d61fd6422 Linux 6.16)
Merging kcsan/next (9872916ad1a1 kcsan: test: Initialize dummy variable)
Merging crc/crc-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging fwctl/for-next (19272b37aa4f Linux 6.16-rc1)
Merging devsec-tsm/next (9d948b880409 Merge branch 'for-6.16/tsm-mr' into t=
sm-next)
Merging hisilicon/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)

--Sig_/BL6Tyh3yzvVOp6mqtmtdUXe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiawpsACgkQAVBC80lX
0Gxu7Qf/RVUdFV3uehx/rjQodtdwoWarSTc2igN3xaFIlj6KUujgciL1uk7TRlnK
bttkzhGH315Zc8eH5DOEDBsY1JpM4YKtjOZM09JcvilxFe3dwKBBhtbAqit0xWeR
xw+zYuGTq0c34s+olymtZN+U89SgfLxLq5qFsl5Hq+hxxMkpRUIY/wesUKUALpr4
TnhZCgOuAsDUf31aGBwZxCXymxVGCDJAdeeCUIiwbM9OgukkS6yo2Q2G2GvNOj0c
PpogUjMc9GSSz0w7CqkXP6ui24LSU4bgib3kyUrFMc+EM9qUh7WLMSsqnQWKJl/0
HiqLrJC4h2f6NC/dPR7bb4Q9EOnoqg==
=YT9E
-----END PGP SIGNATURE-----

--Sig_/BL6Tyh3yzvVOp6mqtmtdUXe--

