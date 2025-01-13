Return-Path: <linux-next+bounces-5177-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8360CA0AEC4
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 06:30:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C9E518872A6
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 05:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3B6230D21;
	Mon, 13 Jan 2025 05:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rkHKhzpy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE36C8F77;
	Mon, 13 Jan 2025 05:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736746201; cv=none; b=FyFYhRShdP1LJBCln0nEPC0FWtpwicB8h7lnDCTm1S7W45Dm1Mf+UbNaDCosBTyKlsal5qegvg4Zqox7613NgUm2Uy2yf8f8X9t7sp6g/csk8cJs60ClCfKEPMrN6ThdeIyEtWPPBoWwQ3HQf2BNuFuocoH5B/MjL4Ln/6DWr1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736746201; c=relaxed/simple;
	bh=m1E87p+FmXBXO2w3nex7WpiZsLD31EVzhrenWzRwH8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jK2Z1D+olZBKtGzqciOS0keAoMzov7rLGJuIaxnXJqfE8HPMsYCA96VrR9U1DIGvwWXSGqaLcfKUwATwBJB9jsWY3+wj2rgXt7e2UvQMbPCClZQwBXWpZbe65V8Iod3nhL15IUmAc1RHUevhWx46X5qTNOGNUigYcbzTD08jg9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rkHKhzpy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736746182;
	bh=1TO4ipWQ43J4586e8XxbKO8YHXu/+AuZQm0oFKJjyWk=;
	h=Date:From:To:Cc:Subject:From;
	b=rkHKhzpyEEnLMpT4PQ9ykJ1seuLfSnYKVzlTWi5SqQgtTPNNOMb4cGQhX9iWP2//s
	 MbGryHiazaEvrhhJsDN4YRHo2LQ8eYXjyxo2HkQWWitGeN4B0slfmpc2dYOXIrgNqY
	 EoPkwBGeNB7+OsHeKZWlF8EQxxuN5z3lp7T5IRGC/tnURBfn6qnV1IGSef/O5Wgag4
	 JO8le5CKsYcbU0AAHGK9Q8WYpQthivipJXqy16sPt3VLRLJQ8Qqhz8xozqbm/kf6cs
	 i3LvLpz4uwbQe9x16nD59HJIvJKpe6qwQ1d7VDguL7evarLs8e3r0kmejA++OXIGV1
	 WBcvYsPZZg7mA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YWgn24xTrz4wj1;
	Mon, 13 Jan 2025 16:29:42 +1100 (AEDT)
Date: Mon, 13 Jan 2025 16:29:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jan 13
Message-ID: <20250113162949.78dac6df@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lV0QeohLieg7iGKAS7I.9k0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/lV0QeohLieg7iGKAS7I.9k0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250110:

The perf tree lost its build failure.

The hid tree lost its build failure.

The bluetooth tree lost its build failure.

The block tree gained a build failure so I used the version from
next-20250110.

The rust tree gained conflicts against the driver-core tree.

Non-merge commits (relative to Linus' tree): 7431
 7659 files changed, 343299 insertions(+), 122108 deletions(-)

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

I am currently merging 392 trees (counting Linus' and 150 trees of bug
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
Merging origin/master (be548645527a Merge tag 'for-linus' of git://git.kern=
el.org/pub/scm/virt/kvm/kvm)
Merging fixes/fixes (fac04efc5c79 Linux 6.13-rc2)
Merging ext4-fixes/fixes (4bbf9020becb Linux 6.13-rc4)
Merging vfs-brauner-fixes/vfs.fixes (1623bc27a85a Merge branch 'vfs-6.14.po=
ll' into vfs.fixes)
Merging fscrypt-current/for-current (8e929cb546ee Linux 6.12-rc3)
Merging fsverity-current/for-current (8e929cb546ee Linux 6.12-rc3)
Merging btrfs-fixes/next-fixes (0da3bb028ff9 Merge branch 'misc-6.13' into =
next-fixes)
Merging vfs-fixes/fixes (60a600243244 hostfs: fix string handling in __dent=
ry_name())
Merging erofs-fixes/fixes (6422cde1b0d5 erofs: use buffered I/O for file-ba=
cked mounts by default)
Merging nfsd-fixes/nfsd-fixes (7917f01a286c nfsd: restore callback function=
ality for NFSv4.0)
Merging v9fs-fixes/fixes/next (684a64bf32b6 Merge tag 'nfs-for-6.12-1' of g=
it://git.linux-nfs.org/projects/anna/linux-nfs)
Merging overlayfs-fixes/ovl-fixes (228a1157fb9f Merge tag '6.13-rc-part1-SM=
B3-client-fixes' of git://git.samba.org/sfrench/cifs-2.6)
Merging bcachefs/for-next (432522786827 bcachefs: check_unreachable_inodes =
is not actually PASS_ONLINE yet)
Merging fscrypt/for-next (8e929cb546ee Linux 6.12-rc3)
Merging afs/afs-next (3c9ca856fd12 afs: Make /afs/@cell and /afs/.@cell sym=
links)
Merging btrfs/for-next (ddeb840df10b Merge branch 'for-next-next-v6.13-2025=
0109' into for-next-20250109)
Merging ceph/master (18d44c5d062b ceph: allocate sparse_ext map only for sp=
arse reads)
Merging cifs/for-next (57162361c3c5 Merge tag '6.13-rc6-SMB3-client-fix' of=
 git://git.samba.org/sfrench/cifs-2.6)
Merging configfs/for-next (84147f4e84c4 configfs: improve item creation per=
formance)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (6784ed98fde5 dlm: return -ENOENT if no comm was found)
Merging erofs/dev (fcb9c5f9bf8f erofs: shorten bvecs[] for file-backed moun=
ts)
Merging exfat/dev (a5324b3a488d exfat: fix the infinite loop in __exfat_fre=
e_cluster())
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (94dfee45999c Merge fix for access beyond end of bitm=
ap in fanotify_init(2).)
Merging ext4/dev (4bbf9020becb Linux 6.13-rc4)
Merging f2fs/dev (df46161e4ed0 f2fs: fix to do sanity check correctly on i_=
inline_xattr_size)
Merging fsverity/for-next (8e929cb546ee Linux 6.12-rc3)
Merging fuse/for-next (78f2560fc9fa fuse: Set *nbytesp=3D0 in fuse_get_user=
_pages on allocation failure)
Merging gfs2/for-next (ead64b20f16e gfs2: reorder capability check last)
Merging jfs/jfs-next (a174706ba4da jfs: add a check to prevent array-index-=
out-of-bounds in dbAdjTree)
Merging ksmbd/ksmbd-for-next (2144da25584e Merge tag '6.13-rc6-ksmbd-server=
-fixes' of git://git.samba.org/ksmbd)
Merging nfs/linux-next (4bbf9020becb Linux 6.13-rc4)
Merging nfs-anna/linux-next (4ec1de34e938 nfs: Make NFS_FSCACHE select NETF=
S_SUPPORT instead of depending on it)
Merging nfsd/nfsd-next (29f6ab9b8cfc sunrpc: Remove gss_{de,en}crypt_xdr_bu=
f deadcode)
Merging ntfs3/master (55ad333de0f8 fs/ntfs3: Unify inode corruption marking=
 with _ntfs_bad_inode())
Merging orangefs/for-next (96319dacaf15 orangefs: Constify struct kobj_type)
Merging overlayfs/overlayfs-next (c8b359dddb41 ovl: Filter invalid inodes w=
ith missing lookup function)
Merging ubifs/next (b29bf7119d6b jffs2: Fix rtime decompressor)
Merging v9fs/9p-next (e0260d530b73 net/9p/usbg: allow building as standalon=
e module)
Merging v9fs-ericvh/ericvh/for-next (684a64bf32b6 Merge tag 'nfs-for-6.12-1=
' of git://git.linux-nfs.org/projects/anna/linux-nfs)
Merging xfs/for-next (111d36d62787 xfs: lock dquot buffer before detaching =
dquot from b_li_list)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging file-locks/locks-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6-=
mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging iversion/iversion-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6=
-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging vfs-brauner/vfs.all (eb2b43b98816 Merge branch 'vfs-6.14.afs' into =
vfs.all)
  30bca65bbbae ("afs: Make /afs/@cell and /afs/.@cell symlinks")
  3e914febd79a ("afs: Add rootcell checks")
  92f08e9d3cf0 ("afs: Make /afs/.<cell> as well as /afs/<cell> mountpoints")
CONFLICT (content): Merge conflict in fs/nfsd/filecache.c
Merging vfs/for-next (5cc68af412a9 fs/overlayfs/namei.c: get rid of include=
 ../internal.h)
Merging mm-hotfixes/mm-hotfixes-unstable (b2a095302e94 mm: khugepaged: fix =
call hpage_collapse_scan_file() for anonymous vma)
Merging fs-current (8dc23862ab0b Merge branch 'fixes' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging kbuild-current/fixes (385443057f47 kbuild: pacman-pkg: provide vers=
ioned linux-api-headers package)
Merging arc-current/for-curr (78d4f34e2115 Linux 6.13-rc3)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (926e86205897 arm64/signal: Silence spar=
se warning storing GCSPR_EL0)
Merging arm-soc-fixes/arm/fixes (5391c5d8e606 Merge tag 'v6.13-rockchip-dts=
fixes1' of https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rock=
chip into arm/fixes)
Merging davinci-current/davinci/for-current (9852d85ec9d4 Linux 6.12-rc1)
Merging drivers-memory-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging sophgo-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging m68k-current/for-linus (647619b6bd27 m68k: defconfig: Update defcon=
figs for v6.12-rc1)
Merging powerpc-fixes/fixes (05aa156e156e powerpc/pseries/vas: Add close() =
callback in vas_vm_ops struct)
Merging s390-fixes/fixes (441dd9c46191 s390/futex: Fix FUTEX_OP_ANDN implem=
entation)
Merging net/main (47e55e4b410f openvswitch: fix lockup on tx to unregisteri=
ng netdev with carrier)
Merging bpf/master (9d89551994a4 Linux 6.13-rc6)
Merging ipsec/master (600258d555f0 xfrm: delete intermediate secpath entry =
in packet offload mode)
Merging netfilter/main (8c7a6efc017e ipv4: route: fix drop reason being ove=
rridden in ip_route_input_slow)
Merging ipvs/main (8c7a6efc017e ipv4: route: fix drop reason being overridd=
en in ip_route_input_slow)
Merging wireless/for-next (146b6057e1fd wifi: cw1200: Fix potential NULL de=
reference)
Merging ath/for-current (f1d3334d604c wifi: cfg80211: sme: init n_channels =
before channels[] access)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (45d339fefaa3 RDMA/mlx5: Enable multiplane mode o=
nly when it is supported)
Merging sound-current/for-linus (44a48b26639e ALSA: hda/realtek: fixup ASUS=
 H7606W)
Merging sound-asoc-fixes/for-linus (139fa599cea0 ASoC: rsnd: check rsnd_adg=
_clk_enable() return value)
Merging regmap-fixes/for-linus (9d89551994a4 Linux 6.13-rc6)
Merging regulator-fixes/for-linus (907af7d6e0c8 regulator: Move OF_ API dec=
larations/definitions outside CONFIG_REGULATOR)
Merging spi-fixes/for-linus (9d89551994a4 Linux 6.13-rc6)
Merging pci-current/for-linus (15b8968dcb90 PCI/bwctrl: Fix NULL pointer de=
ref on unbind and bind)
Merging driver-core.current/driver-core-linus (67510d7e2e5f fs: debugfs: fi=
x open proxy for unsafe files)
Merging tty.current/tty-linus (0cfc36ea5168 serial: stm32: use port lock wr=
appers for break control)
Merging usb.current/usb-linus (f3149ed697dd Merge tag 'usb-serial-6.13-rc7'=
 of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial int=
o usb-linus)
Merging usb-serial-fixes/usb-linus (f5b435be70cb USB: serial: option: add N=
eoway N723-EA support)
Merging phy/fixes (17194c2998d3 phy: mediatek: phy-mtk-hdmi: add regulator =
dependency)
Merging staging.current/staging-linus (6f79db028e82 staging: gpib: mite: re=
move unused global functions)
Merging iio-fixes/fixes-togreg (012b8276f08a iio: dac: ad3552r-hs: clear re=
set status flag)
Merging counter-current/counter-current (fac04efc5c79 Linux 6.13-rc2)
Merging char-misc.current/char-misc-linus (c7a5378a0f70 misc: microchip: pc=
i1xxxx: Resolve return code mismatch during GPIO set config)
Merging soundwire-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging thunderbolt-fixes/fixes (9d89551994a4 Linux 6.13-rc6)
Merging input-current/for-linus (1863f213d3e8 Input: mma8450 - add chip ID =
check in probe)
Merging crypto-current/master (cd26cd654767 crypto: hisilicon/debugfs - fix=
 the struct pointer incorrectly offset problem)
Merging vfio-fixes/for-linus (09dfc8a5f2ce vfio/pci: Fallback huge faults f=
or unaligned pfn)
Merging kselftest-fixes/fixes (777f290ab328 selftests/ftrace: adjust offset=
 for kprobe syntax error test)
Merging dmaengine-fixes/fixes (ebc008699fd9 dmaengine: tegra: Return correc=
t DMA status when paused)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (140054a25f85 mtd: rawnand: omap2: Fix build wa=
rnings with W=3D1)
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
Merging hwmon-fixes/hwmon (82163d63ae7a hwmon: (drivetemp) Fix driver produ=
cing garbage data when SCSI errors occur)
Merging nvdimm-fixes/libnvdimm-fixes (265e98f72bac acpi: nfit: vmalloc-out-=
of-bounds Read in acpi_nfit_ctl)
Merging cxl-fixes/fixes (fc033cf25e61 Linux 6.13-rc5)
Merging dma-mapping-fixes/for-linus (78b2770c935f dma-mapping: fix tracing =
dma_alloc/free with vmalloc'd memory)
Merging drivers-x86-fixes/fixes (1d7461d0c833 platform/x86: intel/pmc: Fix =
ioremap() of bad address)
Merging samsung-krzk-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging pinctrl-samsung-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging devicetree-fixes/dt/linus (6e5773d52f4a of/address: Fix WARN when a=
ttempting translating non-translatable addresses)
Merging dt-krzk-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging scsi-fixes/fixes (63ca02221cc5 scsi: iscsi: Fix redundant response =
for ISCSI_UEVENT_GET_HOST_STATS request)
Merging drm-fixes/drm-fixes (fddb4fd91a95 Merge tag 'mediatek-drm-fixes-202=
50104' of https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linu=
x into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (77bf21a03a2a Revert "drm/i915=
/hdcp: Don't enable HDCP1.4 directly from check_link")
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
Merging gpio-brgl-fixes/gpio/for-current (e59f4c97172d gpio: loongson: Fix =
Loongson-2K2000 ACPI GPIO register offset)
Merging gpio-intel-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging pinctrl-intel-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging auxdisplay-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging kunit-fixes/kunit-fixes (40384c840ea1 Linux 6.13-rc1)
Merging memblock-fixes/fixes (180bbad69864 arch_numa: Restore nid checks be=
fore registering a memblock with a node)
Merging renesas-fixes/fixes (124f4f1a1869 MAINTAINERS: Re-add cancelled Ren=
esas driver sections)
Merging perf-current/perf-tools (434fffa926b1 perf probe: Fix uninitialized=
 variable)
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
Merging pmdomain-fixes/fixes (f64f610ec6ab pmdomain: core: add dummy releas=
e function to genpd device)
Merging i2c-host-fixes/i2c/i2c-host-fixes (9d89551994a4 Linux 6.13-rc6)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (590a094e7bd2 Merge tag 'sunxi-clk-fixes-for-6.=
13' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into clk=
-fixes)
Merging pwrseq-fixes/pwrseq/for-current (40384c840ea1 Linux 6.13-rc1)
Merging thead-dt-fixes/thead-dt-fixes (40384c840ea1 Linux 6.13-rc1)
Merging ftrace-fixes/ftrace/fixes (789a8cff8d2d ftrace: Fix function profil=
er's filtering functionality)
Merging ring-buffer-fixes/ring-buffer/fixes (8cd63406d081 trace/ring-buffer=
: Do not use TP_printk() formatting for boot mapped buffers)
Merging trace-fixes/trace/fixes (98feccbf32cf tracing: Prevent bad count fo=
r tracing_cpumask_write)
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (819837584309 Linux 6.12-rc5)
Merging tip-fixes/tip/urgent (18dd4d09c0ec Merge branch into tip/master: 'x=
86/urgent')
Merging slab-fixes/slab/for-next-fixes (b7ffecbe198e memcg: slub: fix SUnre=
claim for post charged objects)
Merging drm-msm-fixes/msm-fixes (789384eb1437 drm/msm/dpu: check dpu_plane_=
atomic_print_state() for valid sspp)
Merging drm-misc-fixes/for-linux-next-fixes (35243fc77756 drm/nouveau/disp:=
 Fix missing backlight control on Macbook 5,1)
Merging linus/for-next (fa47906ff358 vsnprintf: fix up kerneldoc for argume=
nt name changes)
Merging mm-stable/mm-stable (cd6313beaeae Revert "vmstat: disable vmstat_wo=
rk on vmstat_cpu_down_prep()")
Merging mm-nonmm-stable/mm-nonmm-stable (cd6313beaeae Revert "vmstat: disab=
le vmstat_work on vmstat_cpu_down_prep()")
Merging mm/mm-everything (972ccc84da30 foo)
Merging kbuild/for-next (be3d3e40bb56 rust: Use gendwarfksyms + extended mo=
dversions for CONFIG_MODVERSIONS)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (01d08f525d26 perf report: Fix misleading help=
 message about --demangle)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/for-next (aef7ee7649e0 dma-debug: fix physical address =
calculation for struct dma_debug_entry)
Merging asm-generic/master (0af8e32343f8 empty include/asm-generic/vga.h)
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (6139f7913689 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (897d99716424 Merge branches 'for-next/cca', 'f=
or-next/cpufeature', 'for-next/docs', 'for-next/misc' and 'for-next/mm' int=
o for-next/core)
Merging arm-perf/for-next/perf (ba113ecad81a perf docs: arm_spe: Document n=
ew discard mode)
Merging arm-soc/for-next (b5d57dcb2146 soc: document merges)
Merging amlogic/for-next (953913df9c3a Merge branch 'v6.15/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (ffc253263a13 Linux 6.6)
Merging aspeed/for-next (3540adcccc71 ARM: dts: aspeed: yosemite4: adjust s=
econdary flash name)
Merging at91/at91-next (bbc393c6e77b Merge branch 'at91-dt' into at91-next)
Merging broadcom/next (ed54a84051c6 Merge branch 'devicetree/next' into dev=
icetree-arm64/next)
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
Merging qcom/for-next (0725ce8ee655 Merge branches 'arm32-for-6.14', 'arm64=
-defconfig-for-6.14', 'arm64-fixes-for-6.13', 'arm64-for-6.14', 'clk-for-6.=
14' and 'drivers-for-6.14' into for-next)
Merging renesas/next (14af1e5de568 Merge branches 'renesas-arm-defconfig-fo=
r-v6.14', 'renesas-drivers-for-v6.14' and 'renesas-dts-for-v6.14' into rene=
sas-next)
Merging reset/reset/next (262c84cd062c reset: amlogic: aux: drop aux regist=
ration helper)
Merging rockchip/for-next (4ec376748558 Merge branch 'v6.14-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (228acaa82067 Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (b81ada150448 Merge tag 'scmi-updates-6.14' of =
ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into =
for-linux-next)
Merging sophgo/for-next (40384c840ea1 Linux 6.13-rc1)
Merging spacemit/for-next (e7cd95ad8013 riscv: dts: spacemit: add pinctrl p=
roperty to uart0 in BPI-F3)
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
Merging clk/clk-next (19ffddfddde1 Merge branch 'clk-imx' into clk-next)
Merging clk-imx/for-next (48806be08636 clk: imx: Apply some clks only for i=
.MX93)
Merging clk-renesas/renesas-clk (e91609f1c3b0 dt-bindings: clock: renesas,r=
9a08g045-vbattb: Fix include guard)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (7f71507851fc LoongArch: KVM: Protect kvm_=
io_bus_{read,write}() with SRCU)
Merging m68k/for-next (bb2e0fb1e6aa m68k: libgcc: Fix lvalue abuse in umul_=
ppmm())
Merging m68knommu/for-next (85876205ef8d m68k: coldfire: Use proper clock r=
ate for timers)
Merging microblaze/next (920354d7818b microblaze: Use of_property_present()=
 for non-boolean properties)
Merging mips/mips-next (04e4ec98e405 MIPS: migrate to generic rule for buil=
t-in DTBs)
Merging openrisc/for-next (f046ad11d5b7 Merge branch 'or1k-rseq-2' into or1=
k-6.14-updates)
Merging parisc-hd/for-next (df195d931a33 parisc: Remove memcpy_toio and mem=
set_io)
Merging powerpc/next (26bef359bc4f powerpc: Use str_on_off() helper in chec=
k_cache_coherency())
Merging risc-v/for-next (fac04efc5c79 Linux 6.13-rc2)
Merging riscv-dt/riscv-dt-for-next (708d55db3edb riscv: dts: starfive: jh71=
10-milkv-mars: enable usb0 host function)
Merging riscv-soc/riscv-soc-for-next (a5362510bafc Merge branch 'riscv-conf=
ig-for-next' into riscv-soc-for-next)
Merging s390/for-next (04524600c131 Merge branch 'features' into for-next)
Merging sh/for-next (63e72e551942 sh: intc: Fix use-after-free bug in regis=
ter_intc_controller())
Merging sparc/for-next (b6370b338e71 sparc/vdso: Add helper function for 64=
-bit right shift on 32-bit target)
Merging uml/next (af10dd166553 hostfs: Convert to writepages)
Merging xtensa/xtensa-for-next (d14b9a713b34 xtensa/simdisk: Use str_write_=
read() helper in simdisk_transfer())
Merging fs-next (82c97d935af9 Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (9022df7f5e05 Merge branch 'for-6.14-cpu_sync-fixup=
' into for-next)
Merging pci/next (94346fb4d119 Merge branch 'pci/misc')
Merging pstore/for-next/pstore (067cdf020329 pstore/zone: avoid dereferenci=
ng zero sized ptr after init zones)
Merging hid/for-next (733ed65dfca1 Merge branch 'for-6.14/lenovo' into for-=
next)
Merging i2c/i2c/for-next (2965fe939bf5 Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i2c-host/i2c/i2c-host (fd4e93083129 i2c: i801: Add lis3lv02d for De=
ll Precision M6800)
Merging i3c/i3c/next (5eb6d3561f6c i3c: master: Improve initialization of n=
umbered I2C adapters)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (74a2594a2767 hwmon: (asus_atk0110) Use st=
r_enabled_disabled() and str_enable_disable() helpers)
Merging jc_docs/docs-next (92183dbecf94 Merge branch 'docs-mw' into docs-ne=
xt)
CONFLICT (content): Merge conflict in scripts/checkpatch.pl
Merging v4l-dvb/next (c4b7779abc66 media: nuvoton: Fix an error check in np=
cm_video_ece_init())
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (2e00effb4009 Merge branch 'pm-tools' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (84ac7a8fa72a cpufreq: Move endi=
f to the end of Kconfig file)
Merging cpupower/cpupower (8d097444982d pm: cpupower: Add header changes fo=
r cpufreq.h to SWIG bindings)
Merging devfreq/devfreq-next (f3253b23535f PM / devfreq: exynos: remove unu=
sed function parameter)
Merging pmdomain/next (094041b17654 pmdomain: Merge branch fixes into next)
Merging opp/opp/linux-next (1d38eb7f7b26 OPP: OF: Fix an OF node leak in _o=
pp_add_static_v2())
Merging thermal/thermal/linux-next (7d8abc5f3b5c thermal/drivers/imx_sc_the=
rmal: Use dev_err_probe)
Merging rdma/for-next (c84f0f4f49d8 RDMA/bnxt_re: Fix to drop reference to =
the mmap entry in case of error)
CONFLICT (content): Merge conflict in drivers/infiniband/sw/rxe/rxe_net.c
CONFLICT (content): Merge conflict in drivers/infiniband/sw/siw/siw_main.c
CONFLICT (content): Merge conflict in drivers/infiniband/sw/siw/siw_verbs.c
Applying: fix up for "RDMA/rxe: Remove deliver net device event"
Merging net-next/main (7d0da8f86234 net: airoha: Fix channel configuration =
for ETS Qdisc)
Merging bpf-next/for-next (cb451fc2e104 Merge branch 'bpf-next/master' into=
 for-next)
Merging ipsec-next/master (7082a6dc84eb net/mlx5e: Update TX ESN context fo=
r IPSec hardware offload)
Merging mlx5-next/mlx5-next (6ca00ec47b70 net/mlx5: Add nic_cap_reg and vhc=
a_icm_ctrl registers)
Merging netfilter-next/main (4b252f2dab2e Merge branch 'selftests-net-packe=
tdrill-import-multiple-tests')
Merging ipvs-next/main (4b252f2dab2e Merge branch 'selftests-net-packetdril=
l-import-multiple-tests')
Merging bluetooth/master (a723753d039f Bluetooth: L2CAP: handle NULL sock p=
ointer in l2cap_sock_alloc)
Merging wireless-next/for-next (8221712a174a wifi: brcmfmac: Add missing Re=
turn: to function documentation)
Merging ath-next/for-next (a72eaa175656 wifi: ath9k: cleanup ath9k_hw_get_n=
f_hist_mid())
Merging wpan-next/master (3e5908172c05 Merge tag 'ieee802154-for-net-next-2=
025-01-03' of git://git.kernel.org/pub/scm/linux/kernel/git/wpan/wpan-next)
Merging wpan-staging/staging (3e5908172c05 Merge tag 'ieee802154-for-net-ne=
xt-2025-01-03' of git://git.kernel.org/pub/scm/linux/kernel/git/wpan/wpan-n=
ext)
Merging mtd/mtd/next (02ba194feacb mtd: mchp48l640: add support for Fujitsu=
 MB85RS128TY FRAM)
Merging nand/nand/next (6df2d9553e16 mtd: rawnand: davinci: Reduce polling =
interval in NAND_OP_WAITRDY_INSTR)
Merging spi-nor/spi-nor/next (93e00ccab5f7 mtd: spi-nor: macronix: remove m=
x25u25635f from parts list to enable SFDP)
Merging crypto/master (7fa481734016 crypto: ahash - make hash walk function=
s private to ahash.c)
Merging drm/drm-next (39388d53c57b Merge tag 'cgroup-dmem-drm-v2' of git://=
git.kernel.org/pub/scm/linux/kernel/git/mripard/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_di=
splay_driver.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_gt_tlb_invalida=
tion.c
Merging drm-exynos/for-linux-next (31b2be07afd0 drm/exynos: Remove unnecess=
ary checking)
Merging drm-misc/for-linux-next (34d813e45ecb drm/display: hdmi-state-helpe=
r: add drm_display_mode declaration)
Merging amdgpu/drm-next (812a33a65d00 drm/amd/display: 3.2.316)
Merging drm-intel/for-linux-next (a1c666ddfc0a MAINTAINERS: switch my mail =
address for GVT driver)
Merging drm-msm/msm-next (866e43b945bf drm/msm: UAPI error reporting)
Merging drm-msm-lumag/msm-next-lumag (a5463629299b drm/msm/dpu: Add RM supp=
ort for allocating CWB)
Merging drm-xe/drm-xe-next (6a04bb5a2046 drm/xe: remove unused xe_pciids.h =
harder, add missing PCI ID)
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (3a48b38f4843 fbdev: omapfb: Use syscon_regmap_looku=
p_by_phandle_args)
Merging regmap/for-next (d406b354df90 Expand SoundWire MBQ register map sup=
port)
Merging sound/for-next (3ab4a3199c78 ALSA: seq: Notify UMP EP and FB change=
s)
Merging ieee1394/for-next (ce4339d021c4 firewire: ohci: use generic power m=
anagement)
Merging sound-asoc/for-next (a8974c0f45b8 Merge remote-tracking branch 'aso=
c/for-6.14' into asoc-next)
Merging modules/modules-next (44c04fa989f7 module: sign with sha512 instead=
 of sha1 by default)
Merging input/next (21d8dd0daf4c Input: use guard notation in input core)
Merging block/for-next (3cdd05a45891 Merge branch 'for-6.14/block' into for=
-next)
Applying: fix up for "io_uring/memmap: implement kernel allocated regions"
$ git reset --hard HEAD^
Merging next-20250110 version of block
CONFLICT (content): Merge conflict in drivers/md/dm-verity-fec.c
CONFLICT (content): Merge conflict in io_uring/uring_cmd.c
[master c1be25b04b1d] next-20250110/block
Applying: fix up for "io_uring/memmap: implement kernel allocated regions"
[master 793960099d3b] next-20250110/block
Merging device-mapper/for-next (bab4d7a18e2a dm: change kzalloc to kcalloc)
Merging libata/for-next (c9b5be909e65 ahci: Introduce ahci_ignore_port() he=
lper)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (741521fa273f mmc: sdhci-msm: convert to use custom crypto=
 profile)
Merging mfd/for-mfd-next (c2b148f3bc94 mfd: Add support for AAEON UP board =
FPGA)
CONFLICT (content): Merge conflict in drivers/mfd/cs42l43.c
Merging backlight/for-backlight-next (40384c840ea1 Linux 6.13-rc1)
Merging battery/for-next (a3a8799165ff platform/x86: dell-laptop: Use power=
_supply_charge_types_show/_parse() helpers)
Merging regulator/for-next (36d9fc502ebc Merge remote-tracking branch 'regu=
lator/for-6.14' into regulator-next)
Merging security/next (714d87c90a76 lockdown: initialize local array before=
 use to quiet static analysis)
Merging apparmor/apparmor-next (40384c840ea1 Linux 6.13-rc1)
Merging integrity/next-integrity (4785ed362a24 ima: ignore suffixed policy =
rule comments)
Merging selinux/next (854bc7623602 Automated merge of 'dev' into 'next')
Merging smack/next (6f71ad02aae8 smack: deduplicate access to string conver=
sion)
Merging tomoyo/master (08ae2487b202 tomoyo: automatically use patterns for =
several situations in learning mode)
Merging tpmdd/next (1c486a6477a6 KEYS: trusted: dcp: fix improper sg use wi=
th CONFIG_VMAP_STACK=3Dy)
Merging watchdog/master (b3db0b5356ff dt-bindings: watchdog: Document Qualc=
omm IPQ5424)
Merging iommu/next (40a9e0c5db5f Merge branches 'arm/smmu/updates', 'arm/sm=
mu/bindings', 'qualcomm/msm', 'rockchip', 'riscv', 'core', 'intel/vt-d' and=
 'amd/amd-vi' into next)
Merging audit/next (8bea8f86f7a1 Automated merge of 'dev' into 'next')
Merging devicetree/for-next (e4c00c9b1f70 of: Correct child specifier used =
as input of the 2nd nexus node)
Merging dt-krzk/for-next (dcdd69c1e196 Merge branch 'next/dt' into for-next)
Merging mailbox/for-next (7f9e19f207be mailbox: pcc: Check before sending M=
CTP PCC response ACK)
Merging spi/for-next (fd85b6b7bc53 spi: Add spi_mem_calc_op_duration() help=
er)
Merging tip/master (d313ff87009f Merge branch into tip/master: 'x86/tdx')
CONFLICT (content): Merge conflict in include/linux/mm.h
CONFLICT (content): Merge conflict in include/linux/mm_types.h
CONFLICT (content): Merge conflict in include/linux/mmap_lock.h
CONFLICT (content): Merge conflict in kernel/fork.c
CONFLICT (content): Merge conflict in mm/init-mm.c
CONFLICT (content): Merge conflict in tools/testing/vma/vma_internal.h
Merging clockevents/timers/drivers/next (08b97fbd13de clocksource/drivers/a=
rm_arch_timer: Use of_property_present() for non-boolean properties)
Merging edac/edac-for-next (36e45ffa7e61 Merge ras/edac-drivers into for-ne=
xt)
CONFLICT (content): Merge conflict in drivers/edac/i10nm_base.c
Merging ftrace/for-next (6492781961ad Merge tools/for-next)
Merging rcu/next (4b5c2205526c Merge branches 'fixes.2024.12.14a', 'rcutort=
ure.2024.12.14a', 'srcu.2024.12.14a' and 'torture-test.2024.12.14a' into rc=
u-merge.2024.12.14a)
CONFLICT (content): Merge conflict in kernel/rcu/tree.c
Merging paulmck/non-rcu/next (b6f62437f431 Merge branches 'csd-lock.2024.10=
.11a', 'lkmm.2024.11.09a' and 'scftorture.2024.11.09a', tag 'nolibc.2024.11=
.01a' into HEAD)
Merging kvm/next (10b2c8a67c4b Merge tag 'kvm-x86-fixes-6.13-rcN' of https:=
//github.com/kvm-x86/linux into HEAD)
Merging kvm-arm/next (fc77862e06ca arm64/sysreg: Get rid of TRFCR_ELx Sysre=
gFields)
Merging kvms390/next (7a1f3143377a KVM: s390: selftests: Add regression tes=
ts for PFCR subfunctions)
Merging kvm-ppc/topic/ppc-kvm (fac04efc5c79 Linux 6.13-rc2)
Merging kvm-riscv/riscv_kvm_next (af79caa83f6a RISC-V: KVM: Add new exit st=
atstics for redirected traps)
Merging kvm-x86/next (10485c4bc3ca Merge branches 'misc', 'mmu', 'selftests=
', 'svm', 'vcpu_array' and 'vmx')
CONFLICT (content): Merge conflict in arch/x86/kvm/cpuid.c
Merging xen-tip/linux-next (fac04efc5c79 Linux 6.13-rc2)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (da30ba227c41 workqueue: warn if delayed_work i=
s queued to an offlined cpu.)
Merging sched-ext/for-next (261a7516f22c Merge branch 'for-6.13-fixes' into=
 for-next)
Merging drivers-x86/for-next (6b228cfc52a6 alienware-wmi: Use devm_platform=
_profile_register())
CONFLICT (content): Merge conflict in drivers/i2c/busses/i2c-i801.c
Applying: fix up for "platform/x86: dell-smo8800: Move instantiation of lis=
3lv02d i2c_client from i2c-i801 to dell-lis3lv02d"
Merging chrome-platform/for-next (be4fccb5e1fb platform/chrome: cros_ec_lpc=
: Support direct EC register memory access)
Merging chrome-platform-firmware/for-firmware-next (7543d5702c2c firmware: =
google: vpd: Use const 'struct bin_attribute' callback)
Merging hsi/for-next (40384c840ea1 Linux 6.13-rc1)
Merging leds-lj/for-leds-next (29df7025cff0 leds: pwm-multicolor: Disable P=
WM when going to suspend)
Merging ipmi/for-next (83d8c79aa958 ipmi: ssif_bmc: Fix new request loss wh=
en bmc ready for a response)
Merging driver-core/driver-core-next (8ff656643d30 rust: devres: remove act=
ion in `Devres::drop`)
CONFLICT (content): Merge conflict in kernel/module/sysfs.c
Applying: fix up for "driver core: Constify API device_find_child() and ada=
pt for various usages"
Applying: fix up 2 for "driver core: Constify API device_find_child() and a=
dapt for various usages"
Merging usb/usb-next (594c82329eef usb: host: xhci-plat: Assign shared_hcd-=
>rsrc_start)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/qcom/x1e80100-qcp=
.dts
Merging thunderbolt/next (43d84701d2aa thunderbolt: Expose router DROM thro=
ugh debugfs)
Merging usb-serial/usb-next (138a99ca4e20 USB: serial: ch341: use fix-width=
 types consistently)
Merging tty/tty-next (422c9727b07f serial: 8250: Revert "drop lockdep annot=
ation from serial8250_clear_IER()")
Merging char-misc/char-misc-next (44cefdf1cc6d Merge tag 'mhi-for-v6.14' of=
 ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/mani/mhi into char-misc=
-next)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/nvm=
em/qcom,qfprom.yaml
CONFLICT (content): Merge conflict in drivers/iio/adc/ti-ads1119.c
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (56e14a21cee4 coresight-tpda: Optimize the function =
of reading element size)
Merging fastrpc/for-next (40384c840ea1 Linux 6.13-rc1)
Merging fpga/for-next (46b155acbf4e fpga: dfl: destroy/recreate feature pla=
tform device on port release/assign)
Merging icc/icc-next (e20f7bfcd21e Merge branch 'icc-fixes' into icc-next)
Merging iio/togreg (577a66e2e634 iio: iio-mux: kzalloc instead of devm_kzal=
loc to ensure page alignment)
Merging phy-next/next (af1bc0ebe743 dt-bindings: phy: qcom,qmp-pcie: docume=
nt the SM8350 two lanes PCIe PHY)
Merging soundwire/next (74148bb59e20 soundwire: amd: clear wake enable regi=
ster for power off mode)
Merging extcon/extcon-next (7041ed0dde83 extcon: Drop explicit initializati=
on of struct i2c_device_id::driver_data to 0)
Merging gnss/gnss-next (40384c840ea1 Linux 6.13-rc1)
Merging vfio/next (e021e6cbfb5a vfio/pci: Expose setup ROM at ROM bar when =
needed)
Merging w1/for-next (419a40cc2bdd w1: core: use sysfs_emit() instead of spr=
intf())
Merging spmi/spmi-next (821b07853e32 spmi: hisi-spmi-controller: manage the=
 OF node reference in device initialization and cleanup)
Merging staging/staging-next (e7cd121cbf1b staging: rtl8723bs: Remove ioctl=
 interface)
Merging counter-next/counter-next (fac04efc5c79 Linux 6.13-rc2)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (49a9b01803e4 mux: constify mux class)
  49a9b01803e4 ("mux: constify mux class")
Merging dmaengine/next (98d187a98903 dmaengine: idxd: Enable Function Level=
 Reset (FLR) for halt)
Merging cgroup/for-next (3cb97a927fff cgroup/cpuset: remove kernfs active b=
reak)
Merging scsi/for-next (ad873b2c355c Merge branch 'misc' into for-next)
CONFLICT (content): Merge conflict in drivers/ata/ahci.h
CONFLICT (content): Merge conflict in drivers/ata/sata_mv.c
CONFLICT (content): Merge conflict in include/linux/libata.h
Merging scsi-mkp/for-next (295006f6e8c1 scsi: mpi3mr: Fix possible crash wh=
en setting up bsg fails)
Merging vhost/linux-next (a9e50e19ec45 virtio_blk: Add support for transpor=
t error recovery)
Merging rpmsg/for-next (8c8df9bd3851 remoteproc: k3-r5: Add devm action to =
release tsp)
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (5ab3b97ef9d4 gpio: regmap: Use generic req=
uest/free ops)
Merging gpio-intel/for-next (12b0e305f509 gpio: acpi: switch to device_for_=
each_child_node_scoped())
Merging pinctrl/for-next (a3ece0e44e8d Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (40384c840ea1 Linux 6.13-rc1)
Merging pinctrl-renesas/renesas-pinctrl (829356da700b pinctrl: renesas: rzg=
2l: Add support for RZ/G3E SoC)
Merging pinctrl-samsung/for-next (0ebb1e9e1b12 pinctrl: samsung: update chi=
ld reference drop comment)
Merging pwm/pwm/for-next (78dcad6daa40 dt-bindings: pwm: Correct indentatio=
n and style in DTS example)
Merging ktest/for-next (2351e8c65404 ktest.pl: Avoid false positives with g=
rub2 skip regex)
Merging kselftest/next (ebb6ab1525b9 selftests: tmpfs: Add kselftest suppor=
t to tmpfs)
CONFLICT (content): Merge conflict in tools/testing/selftests/kselftest/kta=
p_helpers.sh
Merging kunit/test (40384c840ea1 Linux 6.13-rc1)
Merging kunit-next/kunit (875aec2357cd kunit: platform: Resolve 'struct com=
pletion' warning)
  875aec2357cd ("kunit: platform: Resolve 'struct completion' warning")
Merging livepatching/for-next (7e17e80c3a7e Merge branch 'for-6.14/stack-or=
der' into for-next)
Merging rtc/rtc-next (2a388ff22d2c rtc: zynqmp: Fix optional clock name pro=
perty)
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
Merging hyperv/hyperv-next (f285d9957432 hyperv: Do not overlap the hvcall =
IO areas in hv_vtl_apicid_to_vp_id())
Merging auxdisplay/for-next (93b216cb312d auxdisplay: img-ascii-lcd: Consti=
fy struct img_ascii_lcd_config)
Merging kgdb/kgdb/for-next (24b2455fe8fc kdb: fix ctrl+e/a/f/b/d/p/n broken=
 in keyboard mode)
Merging hmm/hmm (40384c840ea1 Linux 6.13-rc1)
Merging cfi/cfi/next (40384c840ea1 Linux 6.13-rc1)
Merging mhi/mhi-next (29904a40127c bus: mhi: host: pci_generic: Enable MSI-=
X if the endpoint supports)
Merging memblock/for-next (98b7beba1ee6 memblock: uniformly initialize all =
reserved pages to MIGRATE_MOVABLE)
Merging cxl/next (2f84d072bdcb cxl/pci: Add CXL Type 1/2 support to cxl_dvs=
ec_rr_decode())
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (ac38e9c70c59 Merge branch 'efivarfs' into next)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (387d993b6dbf Merge branch 'slab/for-6.14/kfree_=
rcu_move' into slab/for-next)
CONFLICT (content): Merge conflict in kernel/rcu/tree.c
Applying: fix up for "mm/slab: Move kvfree_rcu() into SLAB"
Merging random/master (d18c13697b4d prandom: Include <linux/percpu.h> in <l=
inux/prandom.h>)
Merging landlock/next (b104e811998f landlock: Constify get_mode_access())
Merging rust/rust-next (0730422bced5 rust: use host dylib naming convention=
 to support macOS)
CONFLICT (content): Merge conflict in rust/kernel/miscdevice.rs
CONFLICT (content): Merge conflict in rust/kernel/security.rs
Merging sysctl/sysctl-next (9c738dae9534 sysctl: Reduce dput(child) calls i=
n proc_sys_fill_cache())
Merging execve/for-next/execve (8fa1179c840a Merge branch 'for-next/topic/e=
xecve/core' into for-next/execve)
Merging bitmap/bitmap-for-next (7f15d4abf925 cpu: Remove unused init_cpu_on=
line)
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (d9a67659846f Merge branch 'for-linus/hardening'=
 into for-next/kspp)
Merging kspp-gustavo/for-next/kspp (6613476e225e Linux 6.8-rc1)
Merging nolibc/nolibc (40384c840ea1 Linux 6.13-rc1)
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (11534b4de2a1 iommufd: Deal with IOMMU_HWPT_FAULT_=
ID_VALID in iommufd core)
Merging turbostat/next (75de0ab82fb4 tools/power turbostat: Add an NMI colu=
mn)
Merging pwrseq/pwrseq/for-next (93e3c990fcd9 power: sequencing: qcom-wcn: a=
dd support for the WCN6750 PMU)
Merging capabilities-next/caps-next (d48da4d5ed7b security: add trace event=
 for cap_capable)
Merging ipe/next (d881f0eb6f23 scripts: ipe: polgen: remove redundant close=
 and error exit path)
Merging kcsan/next (9d89551994a4 Linux 6.13-rc6)
Merging crc/crc-next (72914faebaab MAINTAINERS: add entry for CRC library)
Merging kthread/for-next (8044c5897674 rcu: Use kthread preferred affinity =
for RCU exp kworkers)
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)

--Sig_/lV0QeohLieg7iGKAS7I.9k0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeEpM0ACgkQAVBC80lX
0GybmQf/RtKtIDHHMeKqfz5vQdmCsOCsUFm9r2OzcqWAcCyirQz7uBbLM1CkuIzq
O+sJtLxmZZ7jRM/Nmaf5/0jiwDKEwoXfOByD+cF5GgddOBIendbMVlgx9Q+nF9rC
Jm869Yn01PfgLeRIbcqNVsxatIfcD0dS6w1VIPWYEZHIe5/mqsasTpRBs1um2Tg+
UWLoNb3eyxiu0rO86apAiEYdbw+QQl/aSq0Xvm2wyLXTzCXHa8zL7R442i6DQHXN
lg7PoR2bLw9PRS26mUzAa25qN6ycfIUfpmqj9qvIuftw6t0I2NiNcqN4Iz/Mhvbq
nv9BJbTozJ7NDXJnbnUdS5Ib/yx8Bg==
=W2VH
-----END PGP SIGNATURE-----

--Sig_/lV0QeohLieg7iGKAS7I.9k0--

