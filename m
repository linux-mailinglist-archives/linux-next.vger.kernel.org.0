Return-Path: <linux-next+bounces-5337-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5998BA20356
	for <lists+linux-next@lfdr.de>; Tue, 28 Jan 2025 04:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 930FF3A57C1
	for <lists+linux-next@lfdr.de>; Tue, 28 Jan 2025 03:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E990642A92;
	Tue, 28 Jan 2025 03:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aknO1nD+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B47610C;
	Tue, 28 Jan 2025 03:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738034729; cv=none; b=cNypU09CJGqZcIwJY85KCZcrmZNpKvO9LS9AcpUj+/n00LZ7ur6UcPXFTl2W+jxOVQVTsjSvVtYefFaI5yKOYeYvX5rKjRk7j9SFvzhgL6BfFdBUXyI8VuEb73S4XZ74EWLfGbLE3u1xNmXif7ESE5q3sSofF+TQmI0GTURnb8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738034729; c=relaxed/simple;
	bh=GlH45AYnrNtzpeEVNL1P15nHyIVoUUACxl9+1lS5cXw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VnvP0TnRVsn46/g5tBVz8NchjQ8SwjzE1ViObE7mm6EoZu+TMIX+/wRWHT+Rn5zjuVxz9VKS3FTUDHP11ZHbqp5rkkR7hhtzxqb0FR1vR61sUxCFocAZcBuDKkHR4C1bwWSbrQbhaimO4cbThIy+2kLm06wk35ariBQaOp6I3T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aknO1nD+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738034706;
	bh=x3xu6lb8lXKzlgKSwsweRKEWCZaFFJx6+O8PhMqPnHY=;
	h=Date:From:To:Cc:Subject:From;
	b=aknO1nD+YcgqfSQXV7VAu/ci0jYd/mUXGdhOQnRGFbYUZC4q0RJ5AgD9VMBkA3WH5
	 I3hvR8Qefu9Y4dNSNN45CIF1kOcpnj8XDvznmHCLcKHDQnTRMsxw6zjd8B0Dwpjtou
	 dE42TADwoy1lW17fKA4Ygw3+oHynbC27Chzn39X0M0kgrewTHnyylgbkdXEYO8Qe92
	 +Dl0U9berEubF3Q8VBnQOcot5GEOBpH3Hm55jIpMzU2gYRW4DsC2oeGeqdMGnfxobP
	 ZiabAvrDUY+XrvjxvV3730GL2RR5/mvipdRtWsRYjTnP6jM4Y9OELv9+rqMk+WQKrx
	 yFwdJMJdUn0VQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YhrJL0SWTz4wc2;
	Tue, 28 Jan 2025 14:25:06 +1100 (AEDT)
Date: Tue, 28 Jan 2025 14:25:13 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jan 28
Message-ID: <20250128142513.39240572@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/p4L4wW9ZhpmpTn+=KAKbgHm";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/p4L4wW9ZhpmpTn+=KAKbgHm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Please do not add any material destined for v6.15 to your linux-next
included branches until after v6.14-rc1 has been released.

Changes since 20250124:

Trees removed: iversion, afs	at maintainer's requests

The vfs tree gained a conflict against Linus' tree.

Non-merge commits (relative to Linus' tree): 1725
 1884 files changed, 63180 insertions(+), 26850 deletions(-)

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

I am currently merging 390 trees (counting Linus' and 148 trees of bug
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
Merging origin/master (805ba04cb7cc Merge tag 'mips_6.14' of git://git.kern=
el.org/pub/scm/linux/kernel/git/mips/linux)
Merging fixes/fixes (fac04efc5c79 Linux 6.13-rc2)
Merging ext4-fixes/fixes (4bbf9020becb Linux 6.13-rc4)
Merging vfs-brauner-fixes/vfs.fixes (1623bc27a85a Merge branch 'vfs-6.14.po=
ll' into vfs.fixes)
Merging fscrypt-current/for-current (8e929cb546ee Linux 6.12-rc3)
Merging fsverity-current/for-current (8e929cb546ee Linux 6.12-rc3)
Merging btrfs-fixes/next-fixes (e035c671070f Merge branch 'misc-6.14' into =
next-fixes)
Merging vfs-fixes/fixes (60a600243244 hostfs: fix string handling in __dent=
ry_name())
Merging erofs-fixes/fixes (6422cde1b0d5 erofs: use buffered I/O for file-ba=
cked mounts by default)
Merging nfsd-fixes/nfsd-fixes (ffd294d346d1 Linux 6.13)
Merging v9fs-fixes/fixes/next (ffd294d346d1 Linux 6.13)
Merging overlayfs-fixes/ovl-fixes (228a1157fb9f Merge tag '6.13-rc-part1-SM=
B3-client-fixes' of git://git.samba.org/sfrench/cifs-2.6)
Merging bcachefs/for-next (11fe16cf3622 bcachefs: bch2_btree_node_rewrite_k=
ey())
CONFLICT (content): Merge conflict in fs/bcachefs/move.c
Applying: fix up for "block: Delete bio_set_prio()"
Merging fscrypt/for-next (8e929cb546ee Linux 6.12-rc3)
Merging btrfs/for-next (2c32919597a7 Merge branch 'for-next-next-v6.14-2025=
0123' into for-next-20250123)
Merging ceph/master (3981be13ec1b ceph: exchange hardcoded value on NAME_MA=
X)
Merging cifs/for-next (96aca5fa96c0 cifs: Update description about ACL perm=
issions)
Merging configfs/for-next (84147f4e84c4 configfs: improve item creation per=
formance)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (6784ed98fde5 dlm: return -ENOENT if no comm was found)
Merging erofs/dev (8f9530aeeb4f erofs: refine z_erofs_get_extent_compressed=
len())
Merging exfat/dev (d86099d63786 exfat: fix just enough dentries but allocat=
e a new cluster to dir)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (94dfee45999c Merge fix for access beyond end of bitm=
ap in fanotify_init(2).)
Merging ext4/dev (4bbf9020becb Linux 6.13-rc4)
Merging f2fs/dev (03511e936916 f2fs: fix inconsistent dirty state of atomic=
 file)
Merging fsverity/for-next (8e929cb546ee Linux 6.12-rc3)
Merging fuse/for-next (9afd7336f3ac fuse: add default_request_timeout and m=
ax_request_timeout sysctls)
Merging gfs2/for-next (bcbda32b49d1 gfs2: Add GLF_PENDING_REPLY flag)
Merging jfs/jfs-next (a174706ba4da jfs: add a check to prevent array-index-=
out-of-bounds in dbAdjTree)
Merging ksmbd/ksmbd-for-next (e0b1f5914274 Merge tag 'v6.14-rc-smb3-client-=
fixes-part' of git://git.samba.org/sfrench/cifs-2.6)
Merging nfs/linux-next (4bbf9020becb Linux 6.13-rc4)
Merging nfs-anna/linux-next (6f56971841a1 SUNRPC: do not retry on EKEYEXPIR=
ED when user TGT ticket expired)
CONFLICT (content): Merge conflict in fs/nfsd/filecache.c
Merging nfsd/nfsd-next (c92066e78600 sunrpc: Remove gss_{de,en}crypt_xdr_bu=
f deadcode)
Merging ntfs3/master (334e1e91d5b1 fs/ntfs3: Fix WARNING in ntfs_extend_ini=
tialized_size)
Merging orangefs/for-next (96319dacaf15 orangefs: Constify struct kobj_type)
Merging overlayfs/overlayfs-next (c8b359dddb41 ovl: Filter invalid inodes w=
ith missing lookup function)
Merging ubifs/next (69146a8c893f ubi: ubi_get_ec_info: Fix compiling error =
'cast specifies array type')
Merging v9fs/9p-next (a22a29655c42 net/9p/fd: support ipv6 for trans=3Dtcp)
Merging v9fs-ericvh/ericvh/for-next (ffd294d346d1 Linux 6.13)
Merging xfs/for-next (ee10f6fcdb96 xfs: fix buffer lookup vs release race)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging file-locks/locks-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6-=
mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging vfs-brauner/vfs.all (6554b3d21309 Merge branch 'vfs-6.14.afs' into =
vfs.all)
Merging vfs/for-next (82884903ac97 Merge branches 'work.dcache' and 'work.d=
_revalidate' into for-next)
CONFLICT (content): Merge conflict in fs/afs/dir.c
CONFLICT (content): Merge conflict in fs/bcachefs/recovery.c
CONFLICT (content): Merge conflict in fs/fuse/dir.c
Merging mm-hotfixes/mm-hotfixes-unstable (b368cddc8e0e mailmap: add an entr=
y for Hamza Mahfooz)
Merging fs-current (9ae095e9b946 Merge branch 'fixes' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging kbuild-current/fixes (9d89551994a4 Linux 6.13-rc6)
Merging arc-current/for-curr (78d4f34e2115 Linux 6.13-rc3)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (926e86205897 arm64/signal: Silence spar=
se warning storing GCSPR_EL0)
Merging arm-soc-fixes/arm/fixes (352bba6c19cd Merge tag 'ti-driver-soc-for-=
v6.14' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into arm=
/fixes)
Merging davinci-current/davinci/for-current (9852d85ec9d4 Linux 6.12-rc1)
Merging drivers-memory-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging sophgo-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging m68k-current/for-linus (bb2e0fb1e6aa m68k: libgcc: Fix lvalue abuse=
 in umul_ppmm())
Merging powerpc-fixes/fixes (05aa156e156e powerpc/pseries/vas: Add close() =
callback in vas_vm_ops struct)
Merging s390-fixes/fixes (282da38b4653 s390/mm: Consider KMSAN modules meta=
data for paging levels)
Merging net/main (67e4bb2ced0f net: page_pool: don't try to stash the napi =
id)
Merging bpf/master (f9f03a0a6d2d selftests/bpf: Adjust data size to have ET=
H_HLEN)
Merging ipsec/master (6c9b7db96db6 xfrm: Don't disable preemption while loo=
king up cache state.)
Merging netfilter/main (0a5b8fff01bd selftests: net: Adapt ethtool mq tests=
 to fix in qdisc graft)
Merging ipvs/main (0a5b8fff01bd selftests: net: Adapt ethtool mq tests to f=
ix in qdisc graft)
Merging wireless/for-next (146b6057e1fd wifi: cw1200: Fix potential NULL de=
reference)
Merging ath/for-current (64a1ba4072b3 wifi: ath12k: fix handling of 6 GHz r=
ules)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (45d339fefaa3 RDMA/mlx5: Enable multiplane mode o=
nly when it is supported)
Merging sound-current/for-linus (0f3a822ae225 ALSA: hda/realtek: Fix quirk =
matching for Legion Pro 7)
Merging sound-asoc-fixes/for-linus (d91054313ab7 Merge remote-tracking bran=
ch 'asoc/for-6.13' into asoc-linus)
Merging regmap-fixes/for-linus (5bc55a333a2f Linux 6.13-rc7)
Merging regulator-fixes/for-linus (3c28eb3350c8 Merge remote-tracking branc=
h 'regulator/for-6.13' into regulator-linus)
Merging spi-fixes/for-linus (ff9e24437b18 Merge remote-tracking branch 'spi=
/for-6.13' into spi-linus)
Merging pci-current/for-linus (d555ed45a5a1 PCI: Restore original INTX_DISA=
BLE bit by pcim_intx())
Merging driver-core.current/driver-core-linus (5bc55a333a2f Linux 6.13-rc7)
Merging tty.current/tty-linus (5bc55a333a2f Linux 6.13-rc7)
Merging usb.current/usb-linus (5bc55a333a2f Linux 6.13-rc7)
Merging usb-serial-fixes/usb-linus (5bc55a333a2f Linux 6.13-rc7)
Merging phy/fixes (17194c2998d3 phy: mediatek: phy-mtk-hdmi: add regulator =
dependency)
Merging staging.current/staging-linus (5bc55a333a2f Linux 6.13-rc7)
Merging iio-fixes/fixes-togreg (012b8276f08a iio: dac: ad3552r-hs: clear re=
set status flag)
Merging counter-current/counter-current (fac04efc5c79 Linux 6.13-rc2)
Merging char-misc.current/char-misc-linus (5bc55a333a2f Linux 6.13-rc7)
Merging soundwire-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging thunderbolt-fixes/fixes (ffd294d346d1 Linux 6.13)
Merging input-current/for-linus (3a6e5ed2372b Input: xpad - add support for=
 Nacon Evol-X Xbox One Controller)
Merging crypto-current/master (9d4f8e54cef2 rhashtable: Fix rhashtable_try_=
insert test)
Merging vfio-fixes/for-linus (09dfc8a5f2ce vfio/pci: Fallback huge faults f=
or unaligned pfn)
Merging kselftest-fixes/fixes (777f290ab328 selftests/ftrace: adjust offset=
 for kprobe syntax error test)
Merging dmaengine-fixes/fixes (ebc008699fd9 dmaengine: tegra: Return correc=
t DMA status when paused)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (d15638bf76ad Revert "mtd: spi-nor: core: repla=
ce dummy buswidth from addr to data")
Merging mfd-fixes/for-mfd-fixes (68f860426d50 mfd: axp20x: AXP717: Fix miss=
ing IRQ status registers range)
Merging v4l-dvb-fixes/fixes (8b55f8818900 media: mediatek: vcodec: mark vde=
c_vp9_slice_map_counts_eob_coef noinline)
Merging reset-fixes/reset/fixes (1f8af9712413 reset: rzg2l-usbphy-ctrl: Ass=
ign proper of node to the allocated device)
Merging mips-fixes/mips-fixes (40384c840ea1 Linux 6.13-rc1)
Merging at91-fixes/at91-fixes (40384c840ea1 Linux 6.13-rc1)
Merging omap-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging kvm-fixes/master (a5546c2f0dc4 Merge tag 'kvm-s390-master-6.13-1' o=
f https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging kvms390-fixes/master (e376d958871c KVM: s390: selftests: Add has de=
vice attr check to uc_attr_mem_limit selftest)
Merging hwmon-fixes/hwmon (ffd294d346d1 Linux 6.13)
Merging nvdimm-fixes/libnvdimm-fixes (265e98f72bac acpi: nfit: vmalloc-out-=
of-bounds Read in acpi_nfit_ctl)
Merging cxl-fixes/fixes (fc033cf25e61 Linux 6.13-rc5)
Merging dma-mapping-fixes/for-linus (78b2770c935f dma-mapping: fix tracing =
dma_alloc/free with vmalloc'd memory)
Merging drivers-x86-fixes/fixes (59616a91e5e7 platform/x86: lenovo-yoga-tab=
2-pro-1380-fastcharger: fix serdev race)
Merging samsung-krzk-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging pinctrl-samsung-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging devicetree-fixes/dt/linus (6e5773d52f4a of/address: Fix WARN when a=
ttempting translating non-translatable addresses)
Merging dt-krzk-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging scsi-fixes/fixes (63ca02221cc5 scsi: iscsi: Fix redundant response =
for ISCSI_UEVENT_GET_HOST_STATS request)
Merging drm-fixes/drm-fixes (9b1c673a1648 Merge tag 'drm-xe-fixes-2025-01-1=
6' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (ffd294d346d1 Linux 6.13)
Merging mmc-fixes/fixes (8d90a86ed053 mmc: sdhci-msm: fix crypto key evicti=
on)
Merging rtc-fixes/rtc-fixes (40384c840ea1 Linux 6.13-rc1)
Merging gnss-fixes/gnss-linus (40384c840ea1 Linux 6.13-rc1)
Merging hyperv-fixes/hyperv-fixes (175c71c2acee tools/hv: reduce resource u=
sage in hv_kvp_daemon)
Merging risc-v-fixes/fixes (6f6ecce59d99 Merge patch series "SBI PMU event =
related fixes")
Merging riscv-dt-fixes/riscv-dt-fixes (8d19d5a76bf6 riscv: dts: starfive: F=
ix a typo in StarFive JH7110 pin function definitions)
Merging riscv-soc-fixes/riscv-soc-fixes (48808b55b07c firmware: microchip: =
fix UL_IAP lock check in mpfs_auto_update_state())
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (b62cef9a5c67 Merge tag 'hwmon-for-v6.13-rc7' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging)
Merging gpio-brgl-fixes/gpio/for-current (f8524ac33cd4 selftests: gpio: gpi=
o-sim: Fix missing chip disablements)
Merging gpio-intel-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging pinctrl-intel-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging auxdisplay-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging kunit-fixes/kunit-fixes (40384c840ea1 Linux 6.13-rc1)
Merging memblock-fixes/fixes (180bbad69864 arch_numa: Restore nid checks be=
fore registering a memblock with a node)
Merging renesas-fixes/fixes (124f4f1a1869 MAINTAINERS: Re-add cancelled Ren=
esas driver sections)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging perf-current/perf-tools (191f1bd6492a perf annotate: Use an array f=
or the disassembler preference)
Merging efi-fixes/urgent (145ac100b637 efi/esrt: remove esre_attribute::sto=
re())
Merging zstd-fixes/zstd-linus (77618db34645 zstd: Fix array-index-out-of-bo=
unds UBSAN warning)
Merging battery-fixes/fixes (b3ded6072c56 power: supply: bq24190: Fix BQ242=
96 Vbus regulator support)
Merging iommufd-fixes/for-rc (2ca704f55e22 iommu/arm-smmu-v3: Improve uAPI =
comment for IOMMU_HW_INFO_TYPE_ARM_SMMUV3)
Merging rust-fixes/rust-fixes (78d4f34e2115 Linux 6.13-rc3)
Merging w1-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging pmdomain-fixes/fixes (726efa92e02b pmdomain: imx8mp-blk-ctrl: add m=
issing loop break condition)
Merging i2c-host-fixes/i2c/i2c-host-fixes (9d89551994a4 Linux 6.13-rc6)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (5fb33b679763 clk: clk-loongson2: Fix the numbe=
r count of clk provider)
Merging pwrseq-fixes/pwrseq/for-current (40384c840ea1 Linux 6.13-rc1)
Merging thead-dt-fixes/thead-dt-fixes (40384c840ea1 Linux 6.13-rc1)
Merging ftrace-fixes/ftrace/fixes (789a8cff8d2d ftrace: Fix function profil=
er's filtering functionality)
Merging ring-buffer-fixes/ring-buffer/fixes (8cd63406d081 trace/ring-buffer=
: Do not use TP_printk() formatting for boot mapped buffers)
Merging trace-fixes/trace/fixes (60295b944ff6 tracing: gfp: Fix the GFP enu=
m values shown for user space tracing tools)
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (fac04efc5c79 Linux 6.13-rc2)
Merging tip-fixes/tip/urgent (df2194ec7890 Merge branch into tip/master: 'x=
86/urgent')
Merging slab-fixes/slab/for-next-fixes (b7ffecbe198e memcg: slub: fix SUnre=
claim for post charged objects)
Merging drm-msm-fixes/msm-fixes (789384eb1437 drm/msm/dpu: check dpu_plane_=
atomic_print_state() for valid sspp)
Merging drm-misc-fixes/for-linux-next-fixes (e0f63bc68f59 drm/print: Includ=
e drm_device.h)
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (d1366e74342e mm/compaction: fix UBSAN shift-ou=
t-of-bounds warning)
Merging mm-nonmm-stable/mm-nonmm-stable (beeba1eeec9c ocfs2: use str_yes_no=
() and str_no_yes() helper functions)
Merging mm/mm-everything (2ddac3b78f9c foo)
Merging kbuild/for-next (0939156bc07c genksyms: fix syntax error for attrib=
ute before init-declarator)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (66e99fd5a1a6 perf vendor events arm64: Add V3=
 events/metrics)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/for-next (aef7ee7649e0 dma-debug: fix physical address =
calculation for struct dma_debug_entry)
Merging asm-generic/master (0af8e32343f8 empty include/asm-generic/vga.h)
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (f520fab580c9 ARM: 9440/1: cacheinfo fix format field =
mask)
Merging arm64/for-next/core (1dd3393696ef Merge branch 'for-next/perf' into=
 for-next/core)
Merging arm-perf/for-next/perf (ba113ecad81a perf docs: arm_spe: Document n=
ew discard mode)
Merging arm-soc/for-next (5bc55a333a2f Linux 6.13-rc7)
Merging amlogic/for-next (953913df9c3a Merge branch 'v6.15/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (ffc253263a13 Linux 6.6)
Merging aspeed/for-next (3540adcccc71 ARM: dts: aspeed: yosemite4: adjust s=
econdary flash name)
Merging at91/at91-next (bbc393c6e77b Merge branch 'at91-dt' into at91-next)
Merging broadcom/next (86b708a7b20a Merge branch 'defconfig-arm64/next' int=
o next)
Merging davinci/davinci/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging drivers-memory/for-next (af995eea227f Merge branch 'mem-ctrl-next' =
into for-next)
Merging imx-mxs/for-next (f89ee1bb86d7 Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (7605336e9d13 Merge branch 'v6.13-next/soc' into =
for-next)
Merging mvebu/for-next (a34c9fac85b2 arm64: dts: marvell: drop additional p=
hy-names for sata)
Merging omap/for-next (e1fc1384cf70 Merge branch 'omap-for-v6.14/drivers' i=
nto tmp/omap-next-20250107.145157)
Merging qcom/for-next (aa82c3c323a6 Merge branches 'arm32-for-6.14', 'arm64=
-defconfig-for-6.14', 'arm64-fixes-for-6.13', 'arm64-for-6.14', 'clk-for-6.=
14' and 'drivers-for-6.14' into for-next)
Merging renesas/next (14af1e5de568 Merge branches 'renesas-arm-defconfig-fo=
r-v6.14', 'renesas-drivers-for-v6.14' and 'renesas-dts-for-v6.14' into rene=
sas-next)
Merging reset/reset/next (72bb8275a3b0 reset: amlogic: aux: drop aux regist=
ration helper)
Merging rockchip/for-next (4ec376748558 Merge branch 'v6.14-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (61a0af40d810 Merge branch 'next/clk' into fo=
r-next)
Merging scmi/for-linux-next (b81ada150448 Merge tag 'scmi-updates-6.14' of =
ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into =
for-linux-next)
Merging sophgo/for-next (40384c840ea1 Linux 6.13-rc1)
Merging spacemit/for-next (3d72d603afa7 riscv: dts: spacemit: move aliases =
to board dts)
Merging stm32/stm32-next (b7ebfb84a09d arm64: dts: st: enable imx335/csi/dc=
mipp pipeline on stm32mp257f-ev1)
Merging sunxi/sunxi/for-next (cc47f07a40d6 Merge branches 'sunxi/clk-fixes-=
for-6.13', 'sunxi/dt-for-6.14' and 'sunxi/clk-for-6.14' into sunxi/for-next)
Merging tee/next (a7562ff02879 Merge branch 'optee_for_v6.14' into next)
Merging tegra/for-next (0a891b9fcd9b Merge branch for-6.14/arm64/dt into fo=
r-next)
Merging thead-dt/thead-dt-for-next (c95c1362e5bc riscv: dts: thead: Add mai=
lbox node)
Merging ti/ti-next (86e856a18264 Merge branches 'ti-k3-dts-next' and 'ti-k3=
-config-next' into ti-next)
Merging xilinx/for-next (3d431068ed63 Merge branch 'zynq/dt' into for-next)
Merging clk/clk-next (53c9c27672bb Merge branch 'clk-fixes' into clk-next)
Merging clk-imx/for-next (48806be08636 clk: imx: Apply some clks only for i=
.MX93)
Merging clk-renesas/renesas-clk (e91609f1c3b0 dt-bindings: clock: renesas,r=
9a08g045-vbattb: Fix include guard)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (531936dee53e LoongArch: Extend the maximu=
m number of watchpoints)
Merging m68k/for-next (bb2e0fb1e6aa m68k: libgcc: Fix lvalue abuse in umul_=
ppmm())
Merging m68knommu/for-next (a0a8306c8239 m68k: coldfire: Use proper clock r=
ate for timers)
Merging microblaze/next (920354d7818b microblaze: Use of_property_present()=
 for non-boolean properties)
Merging mips/mips-next (df1b8d6e89db MIPS: pci-legacy: Override pci_address=
_to_pio)
Merging openrisc/for-next (ea1413e5b53a rseq/selftests: Add support for Ope=
nRISC)
Merging parisc-hd/for-next (ffd294d346d1 Linux 6.13)
Merging powerpc/next (17391cb2613b powerpc/pseries/iommu: Don't unset windo=
w if it was never set)
Merging risc-v/for-next (fac04efc5c79 Linux 6.13-rc2)
Merging riscv-dt/riscv-dt-for-next (708d55db3edb riscv: dts: starfive: jh71=
10-milkv-mars: enable usb0 host function)
Merging riscv-soc/riscv-soc-for-next (a5362510bafc Merge branch 'riscv-conf=
ig-for-next' into riscv-soc-for-next)
Merging s390/for-next (6abcbcab2999 s390: Add '-std=3Dgnu11' to decompresso=
r and purgatory CFLAGS)
Merging sh/for-next (63e72e551942 sh: intc: Fix use-after-free bug in regis=
ter_intc_controller())
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (2d2b61ae38bd um: Remove unused asm/archparam.h header)
Merging xtensa/xtensa-for-next (d14b9a713b34 xtensa/simdisk: Use str_write_=
read() helper in simdisk_transfer())
Merging fs-next (7acd138cb07e Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (9022df7f5e05 Merge branch 'for-6.14-cpu_sync-fixup=
' into for-next)
Merging pci/next (647d69605c70 Merge tag 'pci-v6.14-changes' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/pci/pci)
Merging pstore/for-next/pstore (067cdf020329 pstore/zone: avoid dereferenci=
ng zero sized ptr after init zones)
Merging hid/for-next (bb796ffb21b3 Merge branch 'for-6.13/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (83ae27d87cdc i2c: Fix core-managed per-client deb=
ugfs handling)
Merging i2c-host/i2c/i2c-host (fd4e93083129 i2c: i801: Add lis3lv02d for De=
ll Precision M6800)
Merging i3c/i3c/next (5eb6d3561f6c i3c: master: Improve initialization of n=
umbered I2C adapters)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (a76539b29367 hwmon: pmbus: dps920ab: Add =
ability to instantiate through i2c)
Merging jc_docs/docs-next (66dbcd532415 Merge branch 'docs-mw' into docs-ne=
xt)
CONFLICT (content): Merge conflict in Documentation/admin-guide/media/ipu3.=
rst
Merging v4l-dvb/next (c4b7779abc66 media: nuvoton: Fix an error check in np=
cm_video_ece_init())
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (6341c3474f92 Merge branch 'acpi-x86' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (236b227e929e cpufreq: s3c64xx: =
Fix compilation warning)
  236b227e929e ("cpufreq: s3c64xx: Fix compilation warning")
Merging cpupower/cpupower (3d6f25870d17 pm: cpupower: Add missing residency=
 header changes in cpuidle.h to SWIG)
Merging devfreq/devfreq-next (f3253b23535f PM / devfreq: exynos: remove unu=
sed function parameter)
Merging pmdomain/next (885f5669f2ab pmdomain: airoha: Fix compilation error=
 with Clang-20 and Thumb2 mode)
Merging opp/opp/linux-next (b489e7946656 PM / OPP: Add reference counting h=
elpers for Rust implementation)
Merging thermal/thermal/linux-next (7d8abc5f3b5c thermal/drivers/imx_sc_the=
rmal: Use dev_err_probe)
Merging rdma/for-next (d3d930411ce3 RDMA/mlx5: Fix implicit ODP use after f=
ree)
Merging net-next/main (0ad9617c78ac Merge tag 'net-next-6.14' of git://git.=
kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging bpf-next/for-next (d0d106a2bd21 Merge tag 'bpf-next-6.14' of git://=
git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next)
Merging ipsec-next/master (7082a6dc84eb net/mlx5e: Update TX ESN context fo=
r IPSec hardware offload)
Merging mlx5-next/mlx5-next (6ca00ec47b70 net/mlx5: Add nic_cap_reg and vhc=
a_icm_ctrl registers)
Merging netfilter-next/main (0ad9617c78ac Merge tag 'net-next-6.14' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging ipvs-next/main (9c7ad3563229 Merge branch 'arrange-pse-core-and-upd=
ate-tps23881-driver')
Merging bluetooth/master (02a3ad5b3506 Bluetooth: btusb: Add 13 USB device =
IDs for Qualcomm WCN785x)
Merging wireless-next/for-next (59372af69d4d Merge tag 'batadv-next-pullreq=
uest-20250117' of git://git.open-mesh.org/linux-merge)
Merging ath-next/for-next (89d62bcd2501 Merge tag 'ath-next-20250114' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/ath/ath)
Merging wpan-next/master (3e5908172c05 Merge tag 'ieee802154-for-net-next-2=
025-01-03' of git://git.kernel.org/pub/scm/linux/kernel/git/wpan/wpan-next)
Merging wpan-staging/staging (3e5908172c05 Merge tag 'ieee802154-for-net-ne=
xt-2025-01-03' of git://git.kernel.org/pub/scm/linux/kernel/git/wpan/wpan-n=
ext)
Merging mtd/mtd/next (0ddeb4fe9d3b Merge tag 'nand/for-6.14' into mtd/next)
Merging nand/nand/next (98b34d52004b mtd: spinand: skyhigh: Align with rece=
nt read from cache variant changes)
Merging spi-nor/spi-nor/next (943e5f856007 mtd: spi-nor: sysfs: constify 's=
truct bin_attribute')
Merging crypto/master (9d4f8e54cef2 rhashtable: Fix rhashtable_try_insert t=
est)
Merging drm/drm-next (64179a1416e1 Merge tag 'drm-misc-next-fixes-2025-01-2=
4' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next)
Merging drm-exynos/for-linux-next (31b2be07afd0 drm/exynos: Remove unnecess=
ary checking)
Merging drm-misc/for-linux-next (6e64d6b3a3c3 drm/v3d: Assign job pointer t=
o NULL before signaling the fence)
Merging amdgpu/drm-next (024771f3fb75 drm/amd/display: Optimize cursor posi=
tion updates)
Merging drm-intel/for-linux-next (951a6bf30667 Merge tag 'drm-misc-next-fix=
es-2025-01-16' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-n=
ext)
Merging drm-msm/msm-next (866e43b945bf drm/msm: UAPI error reporting)
Merging drm-msm-lumag/msm-next-lumag (a5463629299b drm/msm/dpu: Add RM supp=
ort for allocating CWB)
Merging drm-xe/drm-xe-next (ef34861098c0 drm/xe: Upgrade complaint about mi=
ssing slice info)
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (ffd294d346d1 Linux 6.13)
Merging regmap/for-next (78798d887531 Merge remote-tracking branch 'regmap/=
for-6.14' into regmap-next)
Merging sound/for-next (0f3a822ae225 ALSA: hda/realtek: Fix quirk matching =
for Legion Pro 7)
Merging ieee1394/for-next (352fafe97784 firewire: test: Fix potential null =
dereference in firewire kunit test)
Merging sound-asoc/for-next (d91054313ab7 Merge remote-tracking branch 'aso=
c/for-6.13' into asoc-linus)
Merging modules/modules-next (f3b93547b91a module: sign with sha512 instead=
 of sha1 by default)
Merging input/next (08bd5b7c9a24 Input: synaptics - fix crash when enabling=
 pass-through port)
Merging block/for-next (8c0aa6d362cb Merge branch 'block-6.14' into for-nex=
t)
Merging device-mapper/for-next (8b8f80377657 dm-crypt: track tag_offset in =
convert_context)
Merging libata/for-next (cc77e2ce187d ata: libata-core: Add ATA_QUIRK_NOLPM=
 for Samsung SSD 870 QVO drives)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (20a0c37e4406 mmc: sdhci-msm: Correctly set the load for t=
he regulator)
Merging mfd/for-mfd-next (2816b0c949af MAINTAINERS: Adjust the file entry f=
or the qnap-mcu header)
Merging backlight/for-backlight-next (40384c840ea1 Linux 6.13-rc1)
Merging battery/for-next (b4a95b8fd3e6 power: supply: max1720x: add support=
 for reading internal and thermistor temperatures)
Merging regulator/for-next (3c28eb3350c8 Merge remote-tracking branch 'regu=
lator/for-6.13' into regulator-linus)
Merging security/next (714d87c90a76 lockdown: initialize local array before=
 use to quiet static analysis)
Merging apparmor/apparmor-next (e6b087676954 apparmor: fix dbus permission =
queries to v9 ABI)
Merging integrity/next-integrity (4785ed362a24 ima: ignore suffixed policy =
rule comments)
Merging selinux/next (854bc7623602 Automated merge of 'dev' into 'next')
Merging smack/next (6f71ad02aae8 smack: deduplicate access to string conver=
sion)
Merging tomoyo/master (7788cabfc9cf tomoyo: use better patterns for procfs =
in learning mode)
Merging tpmdd/next (b46c89c08f41 Merge tag 'spi-fix-v6.14-merge-window' of =
git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging watchdog/master (b3db0b5356ff dt-bindings: watchdog: Document Qualc=
omm IPQ5424)
Merging iommu/next (125f34e4c107 Merge branches 'arm/smmu/updates', 'arm/sm=
mu/bindings', 'qualcomm/msm', 'rockchip', 'riscv', 'core', 'intel/vt-d' and=
 'amd/amd-vi' into next)
Merging audit/next (8bea8f86f7a1 Automated merge of 'dev' into 'next')
Merging devicetree/for-next (15e2f65f2ecf of: address: Fix empty resource h=
andling in __of_address_resource_bounds())
Merging dt-krzk/for-next (dcdd69c1e196 Merge branch 'next/dt' into for-next)
Merging mailbox/for-next (4783ce32b080 riscv: export __cpuid_to_hartid_map)
Merging spi/for-next (ff9e24437b18 Merge remote-tracking branch 'spi/for-6.=
13' into spi-linus)
Merging tip/master (3258b24fa741 Merge branch into tip/master: 'x86/mm')
Merging clockevents/timers/drivers/next (08b97fbd13de clocksource/drivers/a=
rm_arch_timer: Use of_property_present() for non-boolean properties)
Merging edac/edac-for-next (1d1a6ae52176 Merge edac-drivers into for-next)
Merging ftrace/for-next (04787ae88833 Merge tools/for-next)
Merging rcu/next (4b5c2205526c Merge branches 'fixes.2024.12.14a', 'rcutort=
ure.2024.12.14a', 'srcu.2024.12.14a' and 'torture-test.2024.12.14a' into rc=
u-merge.2024.12.14a)
Merging paulmck/non-rcu/next (b6f62437f431 Merge branches 'csd-lock.2024.10=
.11a', 'lkmm.2024.11.09a' and 'scftorture.2024.11.09a', tag 'nolibc.2024.11=
.01a' into HEAD)
Merging kvm/next (f7bafceba76e KVM: remove kvm_arch_post_init_vm)
Merging kvm-arm/next (01009b06a6b5 arm64/sysreg: Get rid of TRFCR_ELx Sysre=
gFields)
Merging kvms390/next (68358bc78ca2 KVM: s390: remove the last user of page-=
>index)
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (af79caa83f6a RISC-V: KVM: Add new exit st=
atstics for redirected traps)
Merging kvm-x86/next (eb723766b103 Merge branches 'memslots', 'misc', 'mmu'=
, 'selftests', 'svm', 'vcpu_array' and 'vmx')
Merging xen-tip/linux-next (bda50f7770e5 xen: update pvcalls_front_accept p=
rototype)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (e76946110137 workqueue: Put the pwq after deta=
ching the rescuer from the pool)
Merging sched-ext/for-next (337d1b354a29 sched_ext: Move built-in idle CPU =
selection policy to a separate file)
Merging drivers-x86/for-next (0da9a3f9ac8a Merge branch 'fixes' into 'for-n=
ext')
Merging chrome-platform/for-next (fccebbdde206 platform/chrome: cros_ec_lpc=
: Handle EC without CRS section)
Merging chrome-platform-firmware/for-firmware-next (7543d5702c2c firmware: =
google: vpd: Use const 'struct bin_attribute' callback)
Merging hsi/for-next (40384c840ea1 Linux 6.13-rc1)
Merging leds-lj/for-leds-next (daefd7fbd544 leds: triggers: Constify 'struc=
t bin_attribute')
Merging ipmi/for-next (83d8c79aa958 ipmi: ssif_bmc: Fix new request loss wh=
en bmc ready for a response)
Merging driver-core/driver-core-next (01b3cb620815 rust: device: Use as_cha=
r_ptr() to avoid explicit cast)
CONFLICT (content): Merge conflict in kernel/module/sysfs.c
CONFLICT (content): Merge conflict in rust/kernel/lib.rs
CONFLICT (content): Merge conflict in rust/kernel/miscdevice.rs
Applying: fix up for "driver core: Constify API device_find_child() and ada=
pt for various usages"
Applying: fix up 2 for "driver core: Constify API device_find_child() and a=
dapt for various usages"
Merging usb/usb-next (70cd0576aa39 usb: hcd: Bump local buffer size in rh_s=
tring())
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/qcom/x1e80100-qcp=
.dts
Merging thunderbolt/next (43d84701d2aa thunderbolt: Expose router DROM thro=
ugh debugfs)
Merging usb-serial/usb-next (575a5adf48b0 USB: serial: quatech2: fix null-p=
tr-deref in qt2_process_read_urb())
Merging tty/tty-next (f79b163c4231 Revert "serial: 8250: Switch to nbcon co=
nsole")
Merging char-misc/char-misc-next (970b9757cb44 ntsync: Fix reference leaks =
in the remaining create ioctls.)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/nvm=
em/qcom,qfprom.yaml
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (56e14a21cee4 coresight-tpda: Optimize the function =
of reading element size)
Merging fastrpc/for-next (40384c840ea1 Linux 6.13-rc1)
Merging fpga/for-next (46b155acbf4e fpga: dfl: destroy/recreate feature pla=
tform device on port release/assign)
Merging icc/icc-next (4cc004716977 Merge branch 'icc-sm8750' into icc-next)
Merging iio/togreg (577a66e2e634 iio: iio-mux: kzalloc instead of devm_kzal=
loc to ensure page alignment)
Merging phy-next/next (af1bc0ebe743 dt-bindings: phy: qcom,qmp-pcie: docume=
nt the SM8350 two lanes PCIe PHY)
Merging soundwire/next (74148bb59e20 soundwire: amd: clear wake enable regi=
ster for power off mode)
Merging extcon/extcon-next (7041ed0dde83 extcon: Drop explicit initializati=
on of struct i2c_device_id::driver_data to 0)
Merging gnss/gnss-next (40384c840ea1 Linux 6.13-rc1)
Merging vfio/next (2bb447540e71 vfio/nvgrace-gpu: Add GB200 SKU to the devi=
d table)
Merging w1/for-next (419a40cc2bdd w1: core: use sysfs_emit() instead of spr=
intf())
Merging spmi/spmi-next (40384c840ea1 Linux 6.13-rc1)
Merging staging/staging-next (579b6f18c5ca staging: gpib: Agilent usb code =
cleanup)
Merging counter-next/counter-next (ceb3075433d9 counter: ti-eqep: add direc=
tion support)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (98d187a98903 dmaengine: idxd: Enable Function Level=
 Reset (FLR) for halt)
Merging cgroup/for-next (dae68fba8e11 cgroup/cpuset: Move procfs cpuset att=
ribute under cgroup-v1.c)
Merging scsi/for-next (c57ef5d3d7bc Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (8c09f612b293 scsi: ufs: core: Simplify temperatu=
re exception event handling)
Merging vhost/linux-next (5820a3b08987 virtio_blk: Add support for transpor=
t error recovery)
Merging rpmsg/for-next (3a53ff95b0be remoteproc: st: Use syscon_regmap_look=
up_by_phandle_args)
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (b0fa00fe38f6 gpio: regmap: Use generic req=
uest/free ops)
Merging gpio-intel/for-next (12b0e305f509 gpio: acpi: switch to device_for_=
each_child_node_scoped())
Merging pinctrl/for-next (dadea124cc27 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (40384c840ea1 Linux 6.13-rc1)
Merging pinctrl-renesas/renesas-pinctrl (accabfaae094 pinctrl: renesas: rzg=
2l: Fix PFC_MASK for RZ/V2H and RZ/G3E)
Merging pinctrl-samsung/for-next (0ebb1e9e1b12 pinctrl: samsung: update chi=
ld reference drop comment)
Merging pwm/pwm/for-next (da6b35378699 pwm: Ensure callbacks exist before c=
alling them)
Merging ktest/for-next (f3a30016e4b5 ktest.pl: Fix typo "accesing")
Merging kselftest/next (336d02bc4c6b selftests/rseq: Fix handling of glibc =
without rseq support)
Merging kunit/test (40384c840ea1 Linux 6.13-rc1)
Merging kunit-next/kunit (31691914c392 kunit: Introduce autorun option)
Merging livepatching/for-next (f76ad354146d Merge branch 'for-6.14/selftest=
s-dmesg' into for-next)
Merging rtc/rtc-next (58589c6a6e9e rtc: Remove hpet_rtc_dropped_irq())
Merging nvdimm/libnvdimm-for-next (f3dd9ae7f03a dax: Remove an unused field=
 in struct dax_operations)
Merging at24/at24/for-next (36036a164fac dt-bindings: eeprom: at24: Add com=
patible for Puya P24C256C)
Merging ntb/ntb-next (c620f56c70eb MAINTAINERS: Update AMD NTB maintainers)
Merging seccomp/for-next/seccomp (f90877dd7fb5 seccomp: Stub for !CONFIG_SE=
CCOMP)
Merging fsi/next (c5eeb63edac9 fsi: Fix panic on scom file read)
Merging slimbus/for-next (40384c840ea1 Linux 6.13-rc1)
Merging nvmem/for-next (40384c840ea1 Linux 6.13-rc1)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (2e03358be78b Documentation: hyperv: Add overvie=
w of guest VM hibernation)
Merging auxdisplay/for-next (93b216cb312d auxdisplay: img-ascii-lcd: Consti=
fy struct img_ascii_lcd_config)
Merging kgdb/kgdb/for-next (6beaa75cd24d kdb: Remove unused flags stack)
Merging hmm/hmm (40384c840ea1 Linux 6.13-rc1)
Merging cfi/cfi/next (40384c840ea1 Linux 6.13-rc1)
Merging mhi/mhi-next (29904a40127c bus: mhi: host: pci_generic: Enable MSI-=
X if the endpoint supports)
Merging memblock/for-next (98b7beba1ee6 memblock: uniformly initialize all =
reserved pages to MIGRATE_MOVABLE)
Merging cxl/next (448a60e85ae2 cxl/core/regs: Refactor out functions to cou=
nt regblocks of given type)
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (64b45dd46e15 x86/efi: skip memattr table on kexec boot)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (e492fac3657b Merge branch 'slab/for-6.14/kfree_=
rcu_move' into slab/for-next)
Merging random/master (d18c13697b4d prandom: Include <linux/percpu.h> in <l=
inux/prandom.h>)
Merging landlock/next (24a8e44deae4 landlock: Fix grammar error)
Merging rust/rust-next (ceff0757f5da kbuild: rust: add PROCMACROLDFLAGS)
Merging sysctl/sysctl-next (9c738dae9534 sysctl: Reduce dput(child) calls i=
n proc_sys_fill_cache())
Merging execve/for-next/execve (87dd41e7faf2 Merge branch 'for-next/topic/e=
xecve/AT_EXECVE_CHECK' into for-next/execve)
CONFLICT (content): Merge conflict in include/linux/binfmts.h
Merging bitmap/bitmap-for-next (e876695aab1e cpumask: Rephrase comments for=
 cpumask_any*() APIs)
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (d9a67659846f Merge branch 'for-linus/hardening'=
 into for-next/kspp)
Merging kspp-gustavo/for-next/kspp (6613476e225e Linux 6.8-rc1)
Merging nolibc/nolibc (24728b70b036 Merge tag 'nolibc-20250113-for-6.14-1' =
of https://git.kernel.org/pub/scm/linux/kernel/git/nolibc/linux-nolibc into=
 nolibc)
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (e721f619e3ec iommufd: Fix struct iommu_hwpt_pgfau=
lt init and padding)
Merging turbostat/next (971f40ef6299 tools/power turbostat: Add tcore clock=
 PMT type)
Merging pwrseq/pwrseq/for-next (29da3e8748f9 power: sequencing: qcom-wcn: e=
xplain why we need the WLAN_EN GPIO hack)
Merging capabilities-next/caps-next (d48da4d5ed7b security: add trace event=
 for cap_capable)
Merging ipe/next (aefadf03b3e3 ipe: policy_fs: fix kernel-doc warnings)
Merging kcsan/next (9d89551994a4 Linux 6.13-rc6)
Merging crc/crc-next (6f4de54b31ef lib/crc32: remove other generic implemen=
tations)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)

--Sig_/p4L4wW9ZhpmpTn+=KAKbgHm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeYThkACgkQAVBC80lX
0GxQ/gf+If6HJCvVv7flkntYsLHCD3kNltBehCxSZm89ZIt0jckCrT5yAy8l/SlC
f1w1heHWYk2ooXyIWv0pVHweoflszuhblAbemSSxAOUCvNICnS5GIo0+jsoPER5B
CdIFn8o1lhJn/SgQckxC2rPug9iztjgF1nTE77qibU1IE/ez8OABqCtaGQZXtpZ8
Rrjl90uce+IJAfHf2jZK9gocpgYdBrRmujkz7triAABhufwTNLzgmIK9UNFYNm7q
lnrj2oJ9Dg0SHloDuMvSYNH05XQhxhPEbKB/NhiTufS2BsOVVQP08j/QZK6hQ1KV
N/ZVc/koWfOtp+ufE1JPQuE5VNFPNQ==
=DFLs
-----END PGP SIGNATURE-----

--Sig_/p4L4wW9ZhpmpTn+=KAKbgHm--

