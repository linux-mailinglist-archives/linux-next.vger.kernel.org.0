Return-Path: <linux-next+bounces-8192-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8284CB43495
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 09:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1F3C1C252BA
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 07:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C852BE020;
	Thu,  4 Sep 2025 07:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Kz/CgbLN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B761F4168;
	Thu,  4 Sep 2025 07:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756972278; cv=none; b=nfpA3ESPaXM+e0OyKi2fFpIqs1/SNEi8TGIt4qRjw+bqfWRUzLRhcxuVXDAhJ7O9cZxww/ehsTQwFyQnRwF3wpmVmThFAfccaQ8K2ilEXHEXs2m36jSiYPE5DHB+BAQPFAcy+JO2QJkLU+ZnhaSyI5cw4N2raVyDPzkUeNYzMQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756972278; c=relaxed/simple;
	bh=9Gu7+5zshFRNwyxUhdJnDWvD1VKmBxfZgGhZuFK623c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uVDRxSLWAl56d7zA4yibcrMMW3p5dSUKdR4jQHHpUL4pG0v0C7HWeD7mS4MZGzDOqV97tlZBzrSEPvhlIIB0EdcUawaPJ7DPfdCjndRhn3BA+6/t8z8YicBFOe5Wx8WTVOj5gVo5gvvQADEPV/xqvLHmUaT+hXOXfkjO6gymWtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Kz/CgbLN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756972269;
	bh=SeRAkGUWZAZj4Wcn2xVRn09usHAFupvimRYPKD8e1J4=;
	h=Date:From:To:Cc:Subject:From;
	b=Kz/CgbLNmT3i7H+BN1DRIrJHjaOXnwx/EElnXHo8BAXISf5kSh6NIYlMgP9bx6wlt
	 jMokexci8dhZqAmsx/W0DJUeCxp3BcCNItNNllNUdnrIDBOzIxWZUEYn+lhnrhvDWZ
	 9rQBScGWhWkxOVa6KAsGyuDYzgbC/XppVzmQTHWUZyDD0x2o0eOpD7EcpSMgNwrQcd
	 4Zy32tkmWuoNhJiT2vkGv5RrmfbXtdKx2cxPpD3Rdm3M5a3UcadhTj73UlKoLBBO73
	 yt/kV41twtnB+QG9SfCzahACP8Ir4Zl+aHnzqT6xmkmNojndoolv2g30oH3rMTRyub
	 2xCKRnH9ScmTw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cHWrF12dPz4w1p;
	Thu,  4 Sep 2025 17:51:09 +1000 (AEST)
Date: Thu, 4 Sep 2025 17:51:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 4
Message-ID: <20250904175107.1fdea73f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DZF2TcOWZ8dlY.V9+/mLz6c";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DZF2TcOWZ8dlY.V9+/mLz6c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250903:

The vfs-brauner tree lost its build failure, but gained another, so I
used the version from next-20250829.

The mm-unstable tree gained a bad warning so I reverted a commit.

The mtd tree still had its build failure so I used the version from
next-20250901.

The drm-exynos tree still had its build failure for which I reverted
a commit.

The mfd tree gained a build failure so I used the version from
next-20250903.

The slab tree gained conflicts against the mm-unstable tree.

Non-merge commits (relative to Linus' tree): 5539
 6062 files changed, 199452 insertions(+), 90031 deletions(-)

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

I am currently merging 406 trees (counting Linus' and 405 trees of bug
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
Merging origin/master (b9a10f876409 Merge tag 'soc-fixes-6.17-2' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/soc/soc)
Merging fixes/fixes (89be9a83ccf1 Linux 6.16-rc7)
Merging ext4-fixes/fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging vfs-brauner-fixes/vfs.fixes (e51bd0e59547 selftests/fs/mount-notify=
: Fix compilation failure.)
Merging fscrypt-current/for-current (8f5ae30d69d7 Linux 6.17-rc1)
Merging fsverity-current/for-current (8f5ae30d69d7 Linux 6.17-rc1)
Merging btrfs-fixes/next-fixes (5bde317fa7b9 Merge branch 'misc-6.17' into =
next-fixes)
Merging vfs-fixes/fixes (fb924b7b8669 change_mnt_propagation(): calculate p=
ropagation source only if we'll need it)
Merging erofs-fixes/fixes (131897c65e2b erofs: fix invalid algorithm for en=
coded extents)
Merging nfsd-fixes/nfsd-fixes (bee47cb026e7 sunrpc: fix handling of server =
side tls alerts)
Merging v9fs-fixes/fixes/next (2014c95afece Linux 6.14-rc1)
Merging overlayfs-fixes/ovl-fixes (e8bd877fb76b ovl: fix possible double un=
link)
Merging fscrypt/for-next (0e6608d4938e fscrypt: Remove redundant __GFP_NOWA=
RN)
Merging btrfs/for-next (e78a4fb890a3 Merge branch 'for-next-next-v6.17-2025=
0902' into for-next-20250902)
Merging ceph/master (c6d08336aadd ceph: fix potential race condition on ope=
rations with CEPH_I_ODIRECT flag)
Merging cifs/for-next (e406be0c28dd smb: client: show negotiated cipher in =
DebugData)
Merging configfs/configfs-next (c6b190822459 MAINTAINERS: add configfs Rust=
 abstractions)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (8e4021078863 dlm: check for undefined release_option valu=
es)
Merging erofs/dev (df0ce6cefa45 erofs: support to readahead dirent blocks i=
n erofs_readdir())
Merging exfat/dev (a5e2e395476f exfat: Remove unnecessary parentheses)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (7acea6d0e0ab Pull fsnotify spelling fix.)
Merging ext4/dev (9d98cf463225 jbd2: prevent softlockup in jbd2_log_do_chec=
kpoint())
Merging f2fs/dev (c872b6279cd2 f2fs: allocate HOT_DATA for IPU writes)
Merging fsverity/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging fuse/for-next (bdf75dcbef0f mm: fix lockdep issues in writeback han=
dling)
Merging gfs2/for-next (702dc4b956f8 gfs2: Fix unlikely race in gdlm_put_loc=
k)
Merging jfs/jfs-next (856db3759202 jfs: fix metapage reference count leak i=
n dbAllocCtl)
Merging ksmbd/ksmbd-for-next (a8bf6ef38292 ksmbd: increase session and shar=
e hash table bits)
Merging nfs/linux-next (1b237f190eb3 Linux 6.17-rc3)
Merging nfs-anna/linux-next (38074de35b01 NFSv4/flexfiles: Fix handling of =
NFS level errors in I/O)
Merging nfsd/nfsd-next (4a0de50a44bb nfsd: decouple the xprtsec policy chec=
k from check_nfsd_access())
Merging ntfs3/master (8f5ae30d69d7 Linux 6.17-rc1)
Merging orangefs/for-next (2138e89cb066 fs/orangefs: Allow 2 more character=
s in do_c_string())
Merging overlayfs/overlayfs-next (e98d6b6b9e25 ovl: make sure that ovl_crea=
te_real() returns a hashed dentry)
Merging ubifs/next (99dbb2a1bd66 ubifs: stop using write_cache_pages)
Merging v9fs/9p-next (674b56aa57f9 net/9p: fix double req put in p9_fd_canc=
elled)
Merging v9fs-ericvh/ericvh/for-next (2014c95afece Linux 6.14-rc1)
Merging xfs/for-next (851c4c96db00 xfs: implement XFS_IOC_DIOINFO in terms =
of vfs_getattr)
Merging zonefs/for-next (a42938e80357 zonefs: correct some spelling mistake=
s)
Merging vfs-brauner/vfs.all (d02ae3528998 Merge branch 'kernel-6.18.clone3'=
 into vfs.all)
$ git reset --hard HEAD^
Merging next-20250829 version of vfs-brauner
Merging vfs/for-next (9ac7f0dca753 do_nfs4_mount(): switch to vfs_parse_fs_=
string())
Merging mm-hotfixes/mm-hotfixes-unstable (2b4b9154f9a3 mm: lru_add_drain_al=
l() do local lru_add_drain() first)
Merging fs-current (657e021836ec Merge branch 'fixes' of https://git.kernel=
.org/pub/scm/linux/kernel/git/xiang/erofs.git)
Merging kbuild-current/kbuild-fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging arc-current/for-curr (d7b8f8e20813 Linux 6.16-rc5)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (9a6d3ff10f7f arm64: uapi: Provide corre=
ct __BITS_PER_LONG for the compat vDSO)
Merging arm-soc-fixes/arm/fixes (f2e8f1f5f5c8 Merge tag 'v6.17-rockchip-dts=
fixes1' of git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockch=
ip into arm/fixes)
Merging davinci-current/davinci/for-current (8f5ae30d69d7 Linux 6.17-rc1)
Merging drivers-memory-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging sophgo-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging sophgo-soc-fixes/soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging m68k-current/for-linus (c8995932db2b m68k: mac: Improve clocksource=
 driver commentary)
Merging powerpc-fixes/fixes (8763d2257f52 powerpc/boot/install.sh: Fix shel=
lcheck warnings)
Merging s390-fixes/fixes (ce971233242b s390/cpum_cf: Deny all sampling even=
ts by counter PMU)
Merging net/main (8156210d36a4 ax25: properly unshare skbs in ax25_kiss_rcv=
())
Merging bpf/master (71ca59e23445 Merge branch 'fix-bpf_strnstr-len-error')
Merging ipsec/master (cd8ae32e4e46 xfrm: xfrm_alloc_spi shouldn't use 0 as =
SPI)
Merging netfilter/main (b4ada0618eed tools: ynl-gen: fix nested array count=
ing)
Merging ipvs/main (aca701c61822 Merge tag 'batadv-net-pullrequest-20250901'=
 of https://git.open-mesh.org/linux-merge)
Merging wireless/for-next (27893dd6341b Merge tag 'ath-current-20250902' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath)
Merging ath/for-current (27893dd6341b Merge tag 'ath-current-20250902' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/ath/ath)
Merging iwlwifi/fixes (2c72c8d356db Merge tag 'iwlwifi-fixes-2025-08-28' of=
 https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (85fe9f565d2d IB/mlx5: Fix obj_type mismatch for =
SRQ event subscriptions)
Merging sound-current/for-linus (ad64c073c9a0 ALSA: docs: Remove 3rd person=
 singular s in *to indicate*)
Merging sound-asoc-fixes/for-linus (3254959b4dd0 ASoC: amd: amd_sdw: Add qu=
irks for some new Dell laptops)
Merging regmap-fixes/for-linus (1b237f190eb3 Linux 6.17-rc3)
Merging regulator-fixes/for-linus (b320789d6883 Linux 6.17-rc4)
Merging spi-fixes/for-linus (1991a4585285 spi: spi-qpic-snand: unregister E=
CC engine on probe error and device remove)
Merging pci-current/for-linus (8f5ae30d69d7 Linux 6.17-rc1)
Merging driver-core.current/driver-core-linus (f1b55db08d52 rust: device: f=
ix unresolved link to drm::Device)
Merging tty.current/tty-linus (cfd956dcb101 tty: hvc_console: Call hvc_kick=
 in hvc_write unconditionally)
Merging usb.current/usb-linus (1b237f190eb3 Linux 6.17-rc3)
Merging usb-serial-fixes/usb-linus (cba70aff623b USB: serial: option: add T=
elit Cinterion FN990A w/audio compositions)
Merging phy/fixes (6cb8c1f957f6 phy: qcom: qmp-pcie: Fix PHY initialization=
 when powered down by firmware)
Merging staging.current/staging-linus (52ff2b840bc7 staging: axis-fifo: fix=
 maximum TX packet length check)
Merging iio-fixes/fixes-togreg (875e7d357a7f iio: dac: ad5421: use int type=
 to store negative error codes)
Merging counter-current/counter-current (c17b750b3ad9 Linux 6.17-rc2)
Merging char-misc.current/char-misc-linus (1b237f190eb3 Linux 6.17-rc3)
Merging soundwire-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging thunderbolt-fixes/fixes (b320789d6883 Linux 6.17-rc4)
Merging input-current/for-linus (ab93e0dd72c3 Merge branch 'next' into for-=
linus)
Merging crypto-current/master (9d9b193ed73a crypto: hash - Increase HASH_MA=
X_DESCSIZE for hmac(sha3-224-s390))
Merging libcrypto-fixes/libcrypto-fixes (cdb03b6d1896 crypto: sha512 - Impl=
ement export_core() and import_core())
Merging vfio-fixes/for-linus (c1d9dac0db16 vfio/pci: Align huge faults to o=
rder)
Merging kselftest-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging dmaengine-fixes/fixes (aa2e1e4563d3 dmaengine: dw: dmamux: Fix devi=
ce reference leak in rzn1_dmamux_route_allocate)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (fd779eac2d65 mtd: nand: raw: atmel: Respect tA=
R, tCLR in read setup timing)
Merging mfd-fixes/for-mfd-fixes (d9d79e4f7dc9 mfd: Fix building without CON=
FIG_OF)
Merging v4l-dvb-fixes/fixes (6f6fbd9a0c5a media: Remove redundant pm_runtim=
e_mark_last_busy() calls)
Merging reset-fixes/reset/fixes (9a52827a9bbb reset: eyeq: fix OF node leak)
Merging mips-fixes/mips-fixes (1b237f190eb3 Linux 6.17-rc3)
Merging at91-fixes/at91-fixes (217efb440933 ARM: dts: microchip: sama7d65: =
Force SDMMC Legacy mode)
Merging omap-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging kvm-fixes/master (42a0305ab114 Merge tag 'kvmarm-fixes-6.17-1' of h=
ttps://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvms390-fixes/master (460a803bee81 KVM: s390: Fix FOLL_*/FAULT_FLAG=
_* confusion)
Merging hwmon-fixes/hwmon (c2623573178b hwmon: (ina238) Correctly clamp pow=
er limits)
Merging nvdimm-fixes/libnvdimm-fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging cxl-fixes/fixes (d0b3b7b22dfa Linux 6.16-rc4)
Merging dma-mapping-fixes/dma-mapping-fixes (7e2368a21741 dma-debug: don't =
enforce dma mapping check on noncoherent allocations)
Merging drivers-x86-fixes/fixes (aa28991fd5dc platform/x86/intel: power-dom=
ains: Use topology_logical_package_id() for package ID)
Merging samsung-krzk-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging pinctrl-samsung-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging devicetree-fixes/dt/linus (80af3745ca46 of: dynamic: Fix use after =
free in of_changeset_add_prop_helper())
Merging dt-krzk-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging scsi-fixes/fixes (708e2371f77a scsi: sr: Reinstate rotational media=
 flag)
Merging drm-fixes/drm-fixes (b320789d6883 Linux 6.17-rc4)
Merging drm-intel-fixes/for-linux-next-fixes (b320789d6883 Linux 6.17-rc4)
Merging mmc-fixes/fixes (d2d7a96b29ea mmc: sdhci_am654: Disable HS400 for A=
M62P SR1.0 and SR1.1)
Merging rtc-fixes/rtc-fixes (08d82d0cad51 rtc: pcf2127: add missing semicol=
on after statement)
Merging gnss-fixes/gnss-linus (1b237f190eb3 Linux 6.17-rc3)
Merging hyperv-fixes/hyperv-fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging risc-v-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging riscv-dt-fixes/riscv-dt-fixes (19272b37aa4f Linux 6.16-rc1)
Merging riscv-soc-fixes/riscv-soc-fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging fpga-fixes/fixes (19272b37aa4f Linux 6.16-rc1)
Merging spdx/spdx-linus (8f5ae30d69d7 Linux 6.17-rc1)
Merging gpio-brgl-fixes/gpio/for-current (ef9f21c3f370 gpio: fix GPIO subme=
nu in Kconfig)
Merging gpio-intel-fixes/fixes (3712ce9fa501 gpiolib: acpi: Ignore touchpad=
 wakeup on GPD G1619-05)
Merging pinctrl-intel-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging auxdisplay-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging kunit-fixes/kunit-fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging memblock-fixes/fixes (b3dcc9d1d806 memblock: fix kernel-doc for MEM=
BLOCK_RSRV_NOINIT)
Merging renesas-fixes/fixes (379c590113ce ARM: shmobile: smp: Enforce shmob=
ile_smp_* alignment)
Merging perf-current/perf-tools (77adb9e1fd52 perf test: Checking BPF metad=
ata collection fails on version string)
Merging efi-fixes/urgent (05e75ac35ee9 efi: Explain OVMF acronym in OVMF_DE=
BUG_LOG help text)
Merging battery-fixes/fixes (0af2f6be1b42 Linux 6.15-rc1)
Merging iommufd-fixes/for-rc (1b237f190eb3 Linux 6.17-rc3)
Merging rust-fixes/rust-fixes (8851e27d2cb9 rust: support Rust >=3D 1.91.0 =
target spec)
Merging w1-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging pmdomain-fixes/fixes (d8f3ae7b38fe pmdomain: renesas: rcar-sysc: Ma=
ke rcar_sysc_onecell_np __initdata)
Merging i2c-host-fixes/i2c/i2c-host-fixes (ede965fd555a i2c: rtl9300: remov=
e broken SMBus Quick operation support)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging thead-clk-fixes/thead-clk-fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging pwrseq-fixes/pwrseq/for-current (8f5ae30d69d7 Linux 6.17-rc1)
Merging thead-dt-fixes/thead-dt-fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging ftrace-fixes/ftrace/fixes (327e28664307 fgraph: Do not enable funct=
ion_graph tracer when setting funcgraph-args)
Merging ring-buffer-fixes/ring-buffer/fixes (e4d4b8670c44 ring-buffer: Use =
flush_kernel_vmap_range() over flush_dcache_folio())
Merging trace-fixes/trace/fixes (bfb336cf97df ftrace: Also allocate and cop=
y hash for reading of filter files)
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (8f5ae30d69d7 Linux 6.17-rc1)
Merging tip-fixes/tip/urgent (1ed628f80ef5 Merge branch into tip/master: 'l=
ocking/urgent')
Merging slab-fixes/slab/for-next-fixes (850470a8413a mm: slub: avoid wake u=
p kswapd in set_track_prepare)
Merging drm-msm-fixes/msm-fixes (3cf6147f2b51 soc: qcom: use no-UBWC config=
 for MSM8956/76)
Merging uml-fixes/fixes (2dca89df0d11 Merge tag 'uml-for-6.16-rc4' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/uml/linux)
Merging fwctl-fixes/for-rc (f12343013022 pds_fwctl: Remove the use of dev_e=
rr_probe())
Merging devsec-tsm-fixes/fixes (fba4ceaa242d configfs-tsm-report: Fix NULL =
dereference of tsm_ops)
Merging drm-rust-fixes/drm-rust-fixes (5c5a41a75452 gpu: nova-core: depend =
on CONFIG_64BIT)
Merging drm-misc-fixes/for-linux-next-fixes (d5067034725b Revert "drm/nouve=
au: Remove waitque for sched teardown")
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (e6b9dce0aeeb Merge tag 'sound-6.17-rc5' of git=
://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound)
Merging mm-nonmm-stable/mm-nonmm-stable (e6b9dce0aeeb Merge tag 'sound-6.17=
-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound)
Merging mm-unstable/mm-unstable (21bb4dc65bb8 mm-filemap-align-last_index-t=
o-folio-size-fix-fix)
Applying: Revert "mm: constify highmem related functions for improved const=
-correctness"
Merging mm-nonmm-unstable/mm-nonmm-unstable (63b1114cd57a fs/proc/base.c: f=
ix the wrong format specifier)
Merging kbuild/kbuild-next (aa943a280e88 Merge patch series "Bump minimum s=
upported version of LLVM for building the kernel to 15.0.0")
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (414bf79debdc perf dwarf-aux: Use signed varia=
ble types in match_var_offset)
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
Merging arm-soc/for-next (1cc98e294035 Merge branch 'arm/fixes' into for-ne=
xt)
Merging amlogic/for-next (58abdca0eb65 Merge branch 'v6.17/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (33879a80c413 Merge branch 'apple-soc/=
dt-6.18' into asahi-soc/for-next)
Merging at91/at91-next (7d788f2ff443 Merge branch 'clk-microchip' into at91=
-next)
Merging bmc/for-next (b4fa4985636c Merge branches 'aspeed/drivers', 'aspeed=
/dt', 'nuvoton/arm/dt' and 'nuvoton/arm64/dt' into for-next)
Merging broadcom/next (a69d28984f18 Merge branch 'drivers/next' into next)
Merging davinci/davinci/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging drivers-memory/for-next (1aba1eab0bd8 dt-bindings: memory: Update b=
rcmstb-memc-ddr binding with older chips)
Merging fsl/soc_fsl (c37fd8d610d9 dt-bindings: soc: fsl: qe: Add an interru=
pt controller for QUICC Engine Ports)
Merging imx-mxs/for-next (d34bbb45b57c Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (6cbb623586d5 Merge branches 'v6.16-next/arm32', =
'v6.16-next/dts32', 'v6.16-next/dts64' and 'v6.16-next/soc' into for-next)
Merging mvebu/for-next (23f5a19d1fa3 Merge branch 'mvebu/fixes' into mvebu/=
for-next)
Merging omap/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging qcom/for-next (d77fc758a43d Merge branches 'arm32-defconfig-for-v6.=
18', 'arm32-for-6.18', 'arm64-defconfig-for-6.18', 'arm64-for-6.18', 'clk-f=
ixes-for-6.17', 'clk-for-6.18', 'drivers-fixes-for-6.17' and 'drivers-for-6=
.18' into for-next)
Merging renesas/next (2267d9509084 Merge branches 'renesas-arm-defconfig-fo=
r-v6.18', 'renesas-arm-soc-for-v6.18', 'renesas-drivers-for-v6.18' and 'ren=
esas-dts-for-v6.18' into renesas-next)
Merging reset/reset/next (1527cd3b89f0 reset: remove unneeded 'fast_io' par=
ameter in regmap_config)
Merging rockchip/for-next (6cc18e940db6 Merge branch 'v6.18-clk/next' into =
for-next)
Merging samsung-krzk/for-next (6660df3ef453 Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (3e00cba83ce4 Merge branch 'for-next/scmi/updat=
es' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linu=
x into for-linux-next)
Merging sophgo/for-next (859ce3430569 Merge branch 'dt/riscv' into for-next)
Merging sophgo-soc/soc-for-next (c8754c7deab4 soc: sophgo: cv1800: rtcsys: =
New driver (handling RTC only))
Merging spacemit/for-next (9977b865ecbf Merge branch 'spacemit-clk-for-6.18=
' into spacemit-for-next)
Merging stm32/stm32-next (08a5d1b176ed ARM: dts: stm32: add Hardware debug =
port (HDP) on stm32mp157c-dk2 board)
Merging sunxi/sunxi/for-next (0239b6f7bfc4 Merge branches 'sunxi/fixes-for-=
6.17' and 'sunxi/dt-for-6.18' into sunxi/for-next)
Merging tee/next (8b8aefa5a5c7 Merge branch 'tee_prot_dma_buf_for_v6.18' in=
to next)
Merging tegra/for-next (499b75defe56 Merge branch for-6.17/arm64/defconfig =
into for-next)
Merging thead-dt/thead-dt-for-next (5052d5cf1359 riscv: dts: thead: th1520:=
 Add IMG BXM-4-64 GPU node)
Merging ti/ti-next (b6d89e53defc Merge branches 'ti-k3-dts-next' and 'ti-dr=
ivers-soc-next' into ti-next)
Merging xilinx/for-next (91cadb7d8981 Merge branch 'zynqmp/soc' into for-ne=
xt)
Merging clk/clk-next (54f5212c8f21 Merge branch 'clk-cleanup' into clk-next)
Merging clk-imx/for-next (c78865241ecf MAINTAINERS: Update i.MX Clock Entry)
Merging clk-renesas/renesas-clk (6bbf77bb2256 clk: renesas: r9a09g047: Add =
GPT clocks and resets)
Merging thead-clk/thead-clk-for-next (c567bc5fc68c clk: thead: th1520-ap: s=
et all AXI clocks to CLK_IS_CRITICAL)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (58ea0ee79133 LoongArch: KVM: Move kvm_ioc=
sr tracepoint out of generic code)
Merging m68k/for-next (c8995932db2b m68k: mac: Improve clocksource driver c=
ommentary)
Merging m68knommu/for-next (b320789d6883 Linux 6.17-rc4)
Merging microblaze/next (c0e7bb02f796 microblaze: Replace __ASSEMBLY__ with=
 __ASSEMBLER__ in non-uapi headers)
Merging mips/mips-next (ad79935dbc22 MIPS: configs: Consolidate Loongson1 d=
efconfigs)
Merging openrisc/for-next (f0eedcf22581 openrisc: Replace __ASSEMBLY__ with=
 __ASSEMBLER__ in non-uapi headers)
Merging parisc-hd/for-next (89f686a0fb6e parisc: Revise __get_user() to pro=
be user read access)
Merging powerpc/next (b320789d6883 Linux 6.17-rc4)
Merging risc-v/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging riscv-dt/riscv-dt-for-next (f66eb149b876 riscv: dts: microchip: add=
 a device tree for Discovery Kit)
Merging riscv-soc/riscv-soc-for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging s390/for-next (6e01943fd661 Merge branch 'fixes' into for-next)
Merging sh/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (fc9ed2f6589d um: Replace __ASSEMBLY__ with __ASSEMBLER__ =
in the usermode headers)
Merging xtensa/xtensa-for-next (5d5f08fd0cd9 xtensa: simdisk: add input siz=
e check in proc_write_simdisk)
Merging fs-next (21bf723652dd Merge branch 'for-next' of https://git.kernel=
.org/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (8990f1983843 Merge branch 'rework/ringbuffer-kunit=
-test' into for-next)
Merging pci/next (3d62ecaf14d4 Merge branch 'pci/misc')
Merging pstore/for-next/pstore (d679c2e1e8d9 pstore/zone: rewrite some comm=
ents for better understanding)
Merging hid/for-next (9ba479eca512 Merge branch 'for-6.17/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (5f6cbecd84b5 Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i2c-host/i2c/i2c-host (8cbfa1972619 dt-bindings: i2c: samsung,s3c24=
10-i2c: Drop S3C2410)
Merging i3c/i3c/next (3b661ca549b9 i3c: add missing include to internal hea=
der)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (44df80829d53 hwmon: (asus-ec-sensors) add=
 ROG STRIX Z690-E GAMING WIFI)
Merging jc_docs/docs-next (7e5a0fe4e8ae doc: filesystems: proc: remove stal=
e information from intro)
Merging v4l-dvb/next (603957ae903e media: rkisp1: Add support for multiple =
power domains)
Applying: fix up for "media: cadence: cdns-csi2rx: Support multiple pixels =
per clockcycle"
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (3d5824dd2c7f Merge branch 'pm-em' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (592532a77b73 cpufreq/longhaul: =
handle NULL policy in longhaul_exit)
Merging cpupower/cpupower (357d1fc38aad cpupower: Allow control of boost fe=
ature on non-x86 based systems with boost support.)
Merging devfreq/devfreq-next (1b237f190eb3 Linux 6.17-rc3)
Merging pmdomain/next (ffeebf7587f5 pmdomain: mediatek: Convert all SoCs to=
 new style regmap retrieval)
Merging opp/opp/linux-next (05db35963eef OPP: Add support to find OPP for a=
 set of keys)
Merging thermal/thermal/linux-next (59cc5d656ca4 drivers/thermal/qcom/lmh: =
Fix incorrect error message)
Merging rdma/for-next (2aa35b24ad12 RDMA/erdma: Use vcalloc() instead of vz=
alloc())
Merging net-next/main (94fc5015ea7e Merge branch 'net-phy-micrel-add-ptp-su=
pport-for-lan8842')
Merging bpf-next/for-next (5b6d6fe1ca7b Merge branch 'bpf-next/net' into fo=
r-next)
Merging ipsec-next/master (9f4f591cd5a4 xfrm: xfrm_user: use strscpy() for =
alg_name)
Merging mlx5-next/mlx5-next (04a3134f88a4 net/mlx5: Add PSP capabilities st=
ructures and bits)
Merging netfilter-next/main (864ecc4a6dad Merge branch 'net-add-rcu-safety-=
to-dst-dev')
Merging ipvs-next/main (864ecc4a6dad Merge branch 'net-add-rcu-safety-to-ds=
t-dev')
Merging bluetooth/master (16ebf6c26de5 Bluetooth: Fix build after header cl=
eanup)
Merging wireless-next/for-next (74e2ef72bd4b wifi: brcmfmac: fix 43752 SDIO=
 FWVID incorrectly labelled as Cypress (CYW))
Merging ath-next/for-next (ee6960bdbb74 Merge branch 'net-airoha-add-ppe-su=
pport-for-rx-wlan-offload')
Merging iwlwifi-next/next (9b273ee9c084 wifi: iwlwifi: don't support WH a s=
tep)
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/fw=
/uefi.c
Merging wpan-next/master (1dd9291eb903 ieee802154: Remove WARN_ON() in cfg8=
02154_pernet_exit())
Merging wpan-staging/staging (1dd9291eb903 ieee802154: Remove WARN_ON() in =
cfg802154_pernet_exit())
Merging mtd/mtd/next (84908cb0d46a mtd: use vmalloc_array and vcalloc to si=
mplify code)
$ git reset --hard HEAD^
Merging next-20250901 version of mtd
Merging nand/nand/next (c9f62564252c mtd: rawnand: s3c2410: Drop driver (no=
 actual S3C64xx user))
Merging spi-nor/spi-nor/next (17926cd770ec mtd: spi-nor: core: avoid odd le=
ngth/address writes in 8D-8D-8D mode)
Merging crypto/master (41eab2a95950 crypto: hisilicon - use kcalloc() inste=
ad of kzalloc())
Merging libcrypto/libcrypto-next (362f92286065 lib/crypto: tests: Add KUnit=
 tests for BLAKE2s)
Merging drm/drm-next (4bf83dd6e3b3 Merge tag 'drm-intel-gt-next-2025-09-01'=
 of https://gitlab.freedesktop.org/drm/i915/kernel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/nova/file.rs
Merging drm-exynos/for-linux-next (d07e4c00696f drm/exynos: dsi: add suppor=
t for exynos7870)
Applying: Revert "drm/exynos: dsi: add support for exynos7870"
Merging drm-misc/for-linux-next (a3ae3384be77 drm: panel-backlight-quirks: =
Log applied panel brightness quirks)
Merging amdgpu/drm-next (1e6d36e15b88 drm/amdgpu/amdkfd: Avoid a couple hun=
dred -Wflex-array-member-not-at-end warnings)
Merging drm-intel/for-linux-next (e9a1d54ed923 drm/i915/bios: Remove unnece=
ssary checks of PSR idle frames in VBT binary)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_tc=
.c
Merging drm-msm/msm-next (8290d37ad2b0 drm/msm: Small function param doc fi=
x)
Merging drm-msm-lumag/msm-next-lumag (9be5c47908e6 dt-bindings: display/msm=
: expand to support MST)
Merging drm-nova/nova-next (93296e9d9528 gpu: nova-core: vbios: store refer=
ence to Device where relevant)
Merging drm-rust/drm-rust-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging drm-xe/drm-xe-next (4208fac3dce5 drm/xe: Add more SVM GT stats)
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (6d85b579a9ca fbdev: Use string choices helpers)
Merging regmap/for-next (298834573197 Merge remote-tracking branch 'regmap/=
for-6.18' into regmap-next)
Merging sound/for-next (c3c9a75ede23 ALSA: hda/conexant: Fix typos in comme=
nts)
Merging ieee1394/for-next (a901f493d066 firewire: ohci: remove module-local=
 workqueue)
Merging sound-asoc/for-next (f717e2194932 Merge remote-tracking branch 'aso=
c/for-6.18' into asoc-next)
Merging modules/modules-next (5eb4b9a4cdbb params: Replace deprecated strcp=
y() with strscpy() and memcpy())
Merging input/next (9a12e2fb3f51 Input: tsc2007 - prevent overflow in press=
ure calculation)
Merging block/for-next (dd7e47db149b Merge branch 'for-6.18/block' into for=
-next)
Merging device-mapper/for-next (4466dd3d719c dm-pcache: use int type to sto=
re negative error codes)
Merging libata/for-next (692173de3032 dt-bindings: ata: imx: Document 'targ=
et-supply')
Merging pcmcia/pcmcia-next (4a81f78caa53 pcmcia: Add error handling for add=
_interval() in do_validate_mem())
Merging mmc/next (c2ef7a03f5c8 mmc: sdio: Drop dev_pm_domain_detach() call)
Merging mfd/for-mfd-next (a4eb677652a5 mfd: core: Increment of_node's refco=
unt before linking it to the platform device)
$ git reset --hard HEAD^
Merging next-20250903 version of mfd
Merging backlight/for-backlight-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging battery/for-next (1b237f190eb3 Linux 6.17-rc3)
Merging regulator/for-next (b2393c80ee60 Merge remote-tracking branch 'regu=
lator/for-6.18' into regulator-next)
Merging security/next (67fe7be7dffd MAINTAINERS: add the associated Rust he=
lper to the CREDENTIALS section)
Merging apparmor/apparmor-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging integrity/next-integrity (a4cc916bf572 lib/digsig: Use SHA-1 librar=
y instead of crypto_shash)
Merging selinux/next (59ffc9beeb8b selinux: fix sel_read_bool() allocation =
and error handling)
Merging smack/next (6ddd169d0288 smack: fix kernel-doc warnings for smk_imp=
ort_valid_label())
Merging tomoyo/master (038d61fd6422 Linux 6.16)
Merging tpmdd/next (be48bcf004f9 Merge tag 'for-6.17-rc2-tag' of git://git.=
kernel.org/pub/scm/linux/kernel/git/kdave/linux)
Merging watchdog/master (48defdf6b083 watchdog: sbsa: Adjust keepalive time=
out to avoid MediaTek WS0 race condition)
Merging iommu/next (9ba0de19f4ca Merge branch 'fixes' into next)
Merging audit/next (55f866735e16 Automated merge of 'dev' into 'next')
Merging devicetree/for-next (9756ff114601 dt-bindings: gpu: Convert aspeed,=
ast2400-gfx to DT schema)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/ven=
dor-prefixes.yaml
Merging dt-krzk/for-next (a29bf0b10a1a arm64: dts: socionext: uniphier-pxs3=
: Add default PCI interrup controller address cells)
Merging mailbox/for-next (5378bdf6a611 mailbox/pcc: support mailbox managem=
ent of the shared buffer)
Merging spi/for-next (9edc28c8e273 Merge remote-tracking branch 'spi/for-6.=
18' into spi-next)
Merging tip/master (7005ad1c5fa6 Merge branch into tip/master: 'x86/tdx')
Merging clockevents/timers/drivers/next (461f124656e6 clocksource/drivers/a=
rm_arch_timer_mmio: Add MMIO clocksource)
Merging edac/edac-for-next (501973598d05 Merge branch 'edac-drivers' into e=
dac-for-next)
Merging ftrace/for-next (9a2e88b1f8ab Merge probes/for-next)
Merging rcu/next (97caae2d1494 Merge branch 'torture.2025.08.14a' into HEAD)
Merging paulmck/non-rcu/next (b706eec9304f Merge branches 'lkmm.2025.07.09a=
', 'ratelimit.2025.06.24a' and 'stop-machine.2025.07.17a' into HEAD)
Merging kvm/next (a6ad54137af9 Merge branch 'guest-memfd-mmap' into HEAD)
CONFLICT (content): Merge conflict in arch/x86/kvm/Kconfig
Merging kvm-arm/next (7b8346bd9fce KVM: arm64: Don't attempt vLPI mappings =
when vPE allocation is disabled)
Merging kvms390/next (efe54612bdb6 improve interrupt cpu)
Merging kvm-ppc/topic/ppc-kvm (c17b750b3ad9 Linux 6.17-rc2)
Merging kvm-riscv/riscv_kvm_next (799766208f09 RISC-V: KVM: fix stack overr=
un when loading vlenb)
Merging kvm-x86/next (ecbcc2461839 Merge branches 'fixes', 'generic', 'misc=
', 'mmu', 'selftests', 'svm' and 'vmx')
Merging xen-tip/linux-next (efdaa61d73a1 drivers/xen/xenbus: remove quirk f=
or Xen 3.x)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (324cee0c272c Merge branch 'for-6.17' into for-=
next)
Merging sched-ext/for-next (484af61c434b Merge branch 'for-6.18' into for-n=
ext)
Merging drivers-x86/for-next (ee1cb9b0e6a8 platform/x86/amd/hsmp: Replace d=
ev_err() with dev_info() for non-fatal errors)
Merging chrome-platform/for-next (f7439a723e5a platform/chrome: wilco_ec: R=
emove redundant semicolons)
Merging chrome-platform-firmware/for-firmware-next (8f5ae30d69d7 Linux 6.17=
-rc1)
Merging hsi/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging leds-lj/for-leds-next (d6058316d16e leds: leds-lp55xx: Use correct =
address for memory programming)
Merging ipmi/for-next (44c942f84d3b ipmi:si: Gracefully handle if the BMC i=
s non-functional)
Merging driver-core/driver-core-next (7bb02685fb5a rust: pci: inline severa=
l tiny functions)
Merging usb/usb-next (3474a19736f3 Merge 6.17-rc3 into usb-next)
Merging thunderbolt/next (b06578497e6f thunderbolt: Use string choices help=
ers)
Merging usb-serial/usb-next (b3a333f8ac16 USB: serial: oti6858: remove extr=
anenous ; after comment)
Merging tty/tty-next (706c3c02eecd tty: serial: Modify the use of dev_err_p=
robe())
Merging char-misc/char-misc-next (2d2664fdd7c7 Merge tag 'peci-next-6.18-rc=
1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/iwi/linux into cha=
r-misc-next)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (fa71e9cb4cfa coresight-etm4x: Conditionally access =
register TRCEXTINSELR)
Merging fastrpc/for-next (b52ebc078bb6 misc: fastrpc: add support for gdsp =
remoteproc)
Merging fpga/for-next (4f156ee58bb8 fpga: zynq_fpga: Fix the wrong usage of=
 dma_map_sgtable())
Merging icc/icc-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging iio/togreg (6c2a7d221f4c iio: temperature: Remove redundant pm_runt=
ime_mark_last_busy() calls)
Merging phy-next/next (356590cd61cf phy: renesas: rcar-gen3-usb2: Fix ID ch=
eck logic with VBUS valid)
Merging soundwire/next (88f5d2a477ec soundwire: Use min() to improve code)
Merging extcon/extcon-next (a373ef789d65 extcon: fsa9480: Avoid buffer over=
flow in fsa9480_handle_change())
Merging gnss/gnss-next (1b237f190eb3 Linux 6.17-rc3)
Merging vfio/next (093458c58f83 docs: proc.rst: Fix VFIO Device title forma=
tting)
Merging w1/for-next (25fb0ea986dc w1: matrox: Remove some deadcode in matro=
x_w1_remove())
Merging spmi/spmi-next (0ff41df1cb26 Linux 6.15)
Merging staging/staging-next (5141ae32d4b8 staging: rtl8723bs: fix coding s=
tyle issues in core/rtw_mlme.c)
Merging counter-next/counter-next (51548c36b37d counter: ti-ecap-capture: U=
se devm_pm_runtime_enable())
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (cc0bacac6de7 dt-bindings: dma: rz-dmac: Document RZ=
/G3E family of SoCs)
Merging cgroup/for-next (10c7885f01bc Merge branch 'for-6.18' into for-next)
Merging scsi/for-next (27e3ac435788 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (b620462bba66 scsi: ufs: core: Move the tracing e=
numeration types into a new file)
Merging vhost/linux-next (c67e16d30dca tools headers: Sync uapi/linux/vhost=
.h with the kernel source)
Merging rpmsg/for-next (03b95f41544d Merge branches 'rproc-next' and 'rpmsg=
-next' into for-next)
Merging gpio-brgl/gpio/for-next (d3441febbba8 Merge tag 'ib-mfd-gpio-v6.18'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd into gpio/for-nex=
t)
Merging gpio-intel/for-next (3712ce9fa501 gpiolib: acpi: Ignore touchpad wa=
keup on GPD G1619-05)
Merging pinctrl/for-next (154f61c6bf25 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging pinctrl-renesas/renesas-pinctrl (d1d31e2739ff pinctrl: renesas: rzt=
2h: Add support for RZ/N2H)
Applying: fix up for "pinctrl: renesas: Add support for RZ/T2H"
Merging pinctrl-samsung/for-next (d37db94b0781 dt-bindings: pinctrl: samsun=
g: Drop S3C2410)
Merging pwm/pwm/for-next (cd9d4e5029c0 dt-bindings: pwm: nxp,lpc1850-sct-pw=
m: Minor whitespace cleanup in example)
Merging ktest/for-next (a5e71638ddd7 ktest.pl: Add new PATCHCHECK_SKIP opti=
on to skip testing individual commits)
Merging kselftest/next (8f5ae30d69d7 Linux 6.17-rc1)
Merging kunit/test (8f5ae30d69d7 Linux 6.17-rc1)
Merging kunit-next/kunit (93cf798e7610 Documentation: kunit: Document new p=
arameterized test features)
Merging livepatching/for-next (dcf9f31c62b3 Merge tag 'livepatching-for-6.1=
5' of git://git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepatchi=
ng)
Merging rtc/rtc-next (bb5b0b4317c9 rtc: ds1685: Update Joshua Kinard's emai=
l address.)
Merging nvdimm/libnvdimm-for-next (9f97e61bde6a cxl: Include range.h in cxl=
.h)
Merging at24/at24/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging ntb/ntb-next (0cadf92e93d4 NTB/msi: Remove unused functions)
Merging seccomp/for-next/seccomp (b0c9bfbab925 selftests/seccomp: Add a tes=
t for the WAIT_KILLABLE_RECV fast reply race)
Merging slimbus/for-next (e1aab955386f slimbus: qcom: remove unused qcom co=
ntroller driver)
Merging nvmem/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (90bf73b8c30e mshv: Add support for a new parent=
 partition configuration)
Merging auxdisplay/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging kgdb/kgdb/for-next (afdbe49276ac kdb: Remove optional size argument=
s from strscpy() calls)
Merging hmm/hmm (19272b37aa4f Linux 6.16-rc1)
Merging cfi/cfi/next (19272b37aa4f Linux 6.16-rc1)
Merging mhi/mhi-next (00559ba3ae74 bus: mhi: host: pci_generic: Add Telit F=
N990B40 modem support)
Merging memblock/for-next (79533628b74b memblock: drop for_each_free_mem_pf=
n_range_in_zone_from())
Merging cxl/next (02f6c6a36549 Merge branch 'for-6.18/cxl-update-access-coo=
rdinates' into cxl-for-next)
Merging zstd/zstd-next (65d1f5507ed2 zstd: Import upstream v1.5.7)
Merging efi/next (02eb7a8eee20 efi: add API doc entry for ovmf_debug_log)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (55377e68b4d0 Merge branch 'slab/for-6.18/sheave=
s' into slab/for-next)
CONFLICT (content): Merge conflict in lib/maple_tree.c
CONFLICT (content): Merge conflict in tools/testing/vma/vma_internal.h
Merging random/master (3778dcb2dcc1 random: use offstack cpumask when neces=
sary)
Merging landlock/next (6dde339a3df8 landlock: Minor comments improvements)
Merging rust/rust-next (1b237f190eb3 Linux 6.17-rc3)
Merging rust-alloc/alloc-next (fe927defbb4f rust: alloc: remove `allocator_=
test`)
CONFLICT (content): Merge conflict in rust/kernel/alloc.rs
CONFLICT (modify/delete): rust/kernel/alloc/allocator_test.rs deleted in ru=
st-alloc/alloc-next and modified in HEAD.  Version HEAD of rust/kernel/allo=
c/allocator_test.rs left in tree.
$ git rm -f rust/kernel/alloc/allocator_test.rs
Merging rust-io/io-next (86731a2a651e Linux 6.16-rc3)
Merging rust-pin-init/pin-init-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging rust-timekeeping/timekeeping-next (d4b29ddf82a4 rust: time: Add wra=
pper for fsleep() function)
Merging rust-xarray/xarray-next (fa616196fbea MAINTAINERS: add entry for Ru=
st XArray API)
Merging sysctl/sysctl-next (19272b37aa4f Linux 6.16-rc1)
Merging execve/for-next/execve (8c94db0ae97c binfmt_elf: preserve original =
ELF e_flags for core dumps)
Merging bitmap/bitmap-for-next (fda4e34f6dae phy: rockchip-pcie: switch to =
FIELD_PREP_WM16 macro)
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (6a38fe1a7d9c Merge branches 'for-next/v6.18-rc1=
/ffs-const', 'for-next/hardening' and 'for-linus/hardening' into for-next/k=
spp)
CONFLICT (content): Merge conflict in arch/s390/include/asm/bitops.h
Merging nolibc/for-next (ca38943e83c7 selftests/nolibc: remove outdated com=
ment about construct order)
Merging iommufd/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging turbostat/next (447c98c1ca4a tools/power turbostat: Add idle govern=
or statistics reporting)
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.8
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.c
Merging pwrseq/pwrseq/for-next (8f5ae30d69d7 Linux 6.17-rc1)
Merging capabilities-next/caps-next (cdd73b166607 uapi: fix broken link in =
linux/capability.h)
Merging ipe/next (038d61fd6422 Linux 6.16)
Merging kcsan/next (800348aa34b2 kcsan: test: Replace deprecated strcpy() w=
ith strscpy())
Merging crc/crc-next (136d029662cd Documentation/staging: Fix typo and inco=
rrect citation in crc32.rst)
Merging fwctl/for-next (19272b37aa4f Linux 6.16-rc1)
Merging devsec-tsm/next (9d948b880409 Merge branch 'for-6.16/tsm-mr' into t=
sm-next)
Merging hisilicon/for-next (6c177775dcc5 Merge branch 'next/drivers' into f=
or-next)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)

--Sig_/DZF2TcOWZ8dlY.V9+/mLz6c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi5ROwACgkQAVBC80lX
0GwyoQf/eNDHT4Yx83etCjCLQQUiOTsa21FSoWdzs+38Lb4zU3TXQu87PGqbYlQZ
EwY6asOOIezr4OqLt58Oaew7kQUx4yzQ9GlVKUs6SEBSUfSL1YkcbAXss+ouRdey
hzoTNE4PEt9waJmn3Lb5Ekhq/4KQa5GT4Fxfo7A8PMdvrLqvFsLVQ79nGOFB47PC
AEOZaZIPWrzuY9rf3EUmRm757IE0+zMj9sBkOpXnu91L+VO/jbNx7IFZB8CQRWPi
kPzHIA1cyHFVZNu/umJF59xpn71ylyHYNdvwyQfksxPKXfMhg06bzaFVB0LGzyX1
AKtPirEFwaQ9jkWjfGQ0rQRvGoxRpw==
=w8eK
-----END PGP SIGNATURE-----

--Sig_/DZF2TcOWZ8dlY.V9+/mLz6c--

