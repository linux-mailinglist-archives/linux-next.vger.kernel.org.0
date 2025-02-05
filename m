Return-Path: <linux-next+bounces-5367-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61420A2832F
	for <lists+linux-next@lfdr.de>; Wed,  5 Feb 2025 05:04:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5B8E1884373
	for <lists+linux-next@lfdr.de>; Wed,  5 Feb 2025 04:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A0ED25A64F;
	Wed,  5 Feb 2025 04:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FhG+5ag5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E5225A62E;
	Wed,  5 Feb 2025 04:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738728283; cv=none; b=olPNTwOe25/fuSOjyBHerlXqcU7JtLngY8d8eJHF1sGNQyqmNEk0gjDQ4ADNfSeKZVAiAZ9sTPvoNKvzj24iKLeGTgZKPvTFp44NH43XKoylt5fsCq4iQyCOHO+V5Vi32ghz/5WnQRUSUaQn2Q7ojR/SipOjH6s67iWmVzP4rEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738728283; c=relaxed/simple;
	bh=Vnzf0PFfB7nRf2S2e2qoftXNzJSdVw+bA8cIPdmYGYA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=akDw7u/VlwZevIr0DrRXAd7Jj57Ks88Jg6TJCDheuF2zpaN/qlY63yN9e/R4qRGIF0B0eZ6C2oBblevKrVb5S4PFJp6qJE/Pz81+3NCvNTdCUTBVZ6Xhjdz9lBFcrm2CXC6NyZhVQIfYGrVcTv+r6J4GetplorM1qEvj2QomOaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FhG+5ag5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738728255;
	bh=NtixGb975m1ovYKva0KwBljFRGVrM39XpZSVeYlgnMc=;
	h=Date:From:To:Cc:Subject:From;
	b=FhG+5ag5Mv5c2xwoQZ9wqDqiIowJBYsVZC18Va6jYTCNIbaDvYw5mVMl9udRqw6p7
	 Ef2VmH0sAyVvcy1fW+CqFS0owemEmvmXclIdYtNAkhn/YrjdZhIY8YEr2USySwg10a
	 LxbORgKuSllZp6aVl8999VXQWlmNUUjnzhIVYK6/IMY1Qu74a71rDiZoCz1FKp0ZiY
	 PO58A9SYSr32oiGYySzhDJnD13qnN0HifnZ/MX7vgh6Pyuk1e0FxUuSy6cP7FS0c8O
	 PWYOqACgFC0xtwb5AQTUMmBvk3BA3VIZesSEkjYPPXYWb4tzLDjb59cflLM9+Wv2V9
	 clr9Niq1wa6uA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ynmnq2FSVz4wyV;
	Wed,  5 Feb 2025 15:04:15 +1100 (AEDT)
Date: Wed, 5 Feb 2025 15:04:23 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 5
Message-ID: <20250205150423.2822dbeb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UzzK6vv..YYbVH1dDagQhj3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/UzzK6vv..YYbVH1dDagQhj3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20250204:

Linus' tree still has its build failure but the patch is in the block
tree.

Non-merge commits (relative to Linus' tree): 1234
 1508 files changed, 44230 insertions(+), 30988 deletions(-)

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

I am currently merging 391 trees (counting Linus' and 149 trees of bug
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
Merging origin/master (5c8c229261f1 Merge tag 'kthreads-fixes-2025-02-04' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks)
Merging fixes/fixes (fac04efc5c79 Linux 6.13-rc2)
Merging ext4-fixes/fixes (4bbf9020becb Linux 6.13-rc4)
Merging vfs-brauner-fixes/vfs.fixes (6470d2c6d423 Merge patch series "Fix f=
or huge faults regression")
Merging fscrypt-current/for-current (8e929cb546ee Linux 6.12-rc3)
Merging fsverity-current/for-current (8e929cb546ee Linux 6.12-rc3)
Merging btrfs-fixes/next-fixes (e035c671070f Merge branch 'misc-6.14' into =
next-fixes)
Merging vfs-fixes/fixes (60a600243244 hostfs: fix string handling in __dent=
ry_name())
Merging erofs-fixes/fixes (6422cde1b0d5 erofs: use buffered I/O for file-ba=
cked mounts by default)
Merging nfsd-fixes/nfsd-fixes (ebbdc9429c39 NFSD: fix hang in nfsd4_shutdow=
n_callback)
Merging v9fs-fixes/fixes/next (ffd294d346d1 Linux 6.13)
Merging overlayfs-fixes/ovl-fixes (228a1157fb9f Merge tag '6.13-rc-part1-SM=
B3-client-fixes' of git://git.samba.org/sfrench/cifs-2.6)
Merging bcachefs/for-next (63bbe0ca4167 bcachefs: Scrub)
Merging fscrypt/for-next (8e929cb546ee Linux 6.12-rc3)
Merging btrfs/for-next (2c32919597a7 Merge branch 'for-next-next-v6.14-2025=
0123' into for-next-20250123)
Merging ceph/master (3981be13ec1b ceph: exchange hardcoded value on NAME_MA=
X)
Merging cifs/for-next (2014c95afece Linux 6.14-rc1)
Merging configfs/for-next (84147f4e84c4 configfs: improve item creation per=
formance)
Merging ecryptfs/next (fba133a34118 ecryptfs: Remove unused declartion ecry=
ptfs_fill_zeros())
Merging dlm/next (6784ed98fde5 dlm: return -ENOENT if no comm was found)
Merging erofs/dev (8f9530aeeb4f erofs: refine z_erofs_get_extent_compressed=
len())
Merging exfat/dev (d8efe986116d exfat: fix soft lockup in exfat_clear_bitma=
p)
Merging exportfs/exportfs-next (adc218676eef Linux 6.12)
Merging ext3/for_next (94dfee45999c Merge fix for access beyond end of bitm=
ap in fanotify_init(2).)
Merging ext4/dev (4bbf9020becb Linux 6.13-rc4)
Merging f2fs/dev (f286757b644c Merge tag 'timers-urgent-2025-02-03' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging fsverity/for-next (8e929cb546ee Linux 6.12-rc3)
Merging fuse/for-next (9afd7336f3ac fuse: add default_request_timeout and m=
ax_request_timeout sysctls)
CONFLICT (content): Merge conflict in fs/fuse/sysctl.c
Merging gfs2/for-next (bcbda32b49d1 gfs2: Add GLF_PENDING_REPLY flag)
Merging jfs/jfs-next (a174706ba4da jfs: add a check to prevent array-index-=
out-of-bounds in dbAdjTree)
Merging ksmbd/ksmbd-for-next (2014c95afece Linux 6.14-rc1)
Merging nfs/linux-next (2014c95afece Linux 6.14-rc1)
Merging nfs-anna/linux-next (6f56971841a1 SUNRPC: do not retry on EKEYEXPIR=
ED when user TGT ticket expired)
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
Merging xfs/for-next (a9ab28b3d21a xfs: remove xfs_buf_cache.bc_lock)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging file-locks/locks-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6-=
mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging vfs-brauner/vfs.all (6554b3d21309 Merge branch 'vfs-6.14.afs' into =
vfs.all)
CONFLICT (content): Merge conflict in fs/dcache.c
CONFLICT (content): Merge conflict in fs/erofs/zdata.c
CONFLICT (content): Merge conflict in fs/gfs2/quota.c
CONFLICT (content): Merge conflict in include/linux/lockref.h
Merging vfs/for-next (2e72b1e0aac2 Merge branch 'work.d_revalidate' into fo=
r-next)
Merging mm-hotfixes/mm-hotfixes-unstable (7b7977a3e41a mm: page_isolation: =
avoid calling folio_hstate() without hugetlb_lock)
Merging fs-current (09d79f0f5767 Merge branch 'nfsd-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/cel/linux)
Merging kbuild-current/fixes (2014c95afece Linux 6.14-rc1)
Merging arc-current/for-curr (78d4f34e2115 Linux 6.13-rc3)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (21fed7c223e2 arm64/hwcap: Remove stray =
references to SF8MMx)
Merging arm-soc-fixes/arm/fixes (352bba6c19cd Merge tag 'ti-driver-soc-for-=
v6.14' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into arm=
/fixes)
Merging davinci-current/davinci/for-current (2014c95afece Linux 6.14-rc1)
Merging drivers-memory-fixes/fixes (304e6c02b76f memory: omap-gpmc: drop no=
 compatible check)
Merging sophgo-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging m68k-current/for-linus (bb2e0fb1e6aa m68k: libgcc: Fix lvalue abuse=
 in umul_ppmm())
Merging powerpc-fixes/fixes (05aa156e156e powerpc/pseries/vas: Add close() =
callback in vas_vm_ops struct)
Merging s390-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging net/main (a1300691aed9 net: rose: lock the socket in rose_bind())
Merging bpf/master (fc610c8c586c net: Add rx_skb of kfree_skb to raw_tp_nul=
l_args[].)
Merging ipsec/master (6c9b7db96db6 xfrm: Don't disable preemption while loo=
king up cache state.)
Merging netfilter/main (dfffaccffc53 Merge tag 'nf-25-01-30' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/netfilter/nf)
Merging ipvs/main (dfffaccffc53 Merge tag 'nf-25-01-30' of git://git.kernel=
.org/pub/scm/linux/kernel/git/netfilter/nf)
Merging wireless/for-next (3319569bf9d8 Merge tag 'ath-current-20250124' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath)
Merging ath/for-current (3319569bf9d8 Merge tag 'ath-current-20250124' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/ath/ath)
Merging wpan/master (8ce4f287524c net: libwx: fix firmware mailbox abnormal=
 return)
Merging rdma-fixes/for-rc (2014c95afece Linux 6.14-rc1)
Merging sound-current/for-linus (8c2fa44132e8 ALSA: hda/realtek: Workaround=
 for resume on Dell Venue 11 Pro 7130)
Merging sound-asoc-fixes/for-linus (6b24e67b4056 ASoC: rockchip: i2s-tdm: f=
ix shift config for SND_SOC_DAIFMT_DSP_[AB])
Merging regmap-fixes/for-linus (2014c95afece Linux 6.14-rc1)
Merging regulator-fixes/for-linus (2014c95afece Linux 6.14-rc1)
Merging spi-fixes/for-linus (4fd2707e3e71 spi: atmel-quadspi: Fix warning i=
n doc-comment)
Merging pci-current/for-linus (be6358acefc1 PCI/ASPM: Fix L1SS saving)
Merging driver-core.current/driver-core-linus (2014c95afece Linux 6.14-rc1)
Merging tty.current/tty-linus (0f3fd9cf6491 serial: 8250_pnp: Remove unneed=
ed ->iotype assignment)
Merging usb.current/usb-linus (da1668997052 usb: gadget: f_midi: fix MIDI S=
treaming descriptor lengths)
Merging usb-serial-fixes/usb-linus (2014c95afece Linux 6.14-rc1)
Merging phy/fixes (3126ea9be66b phy: rockchip: naneng-combphy: compatible r=
eset with old DT)
Merging staging.current/staging-linus (2014c95afece Linux 6.14-rc1)
Merging iio-fixes/fixes-togreg (bead181694df iio: adc: ad7606: fix wrong sc=
ale available)
Merging counter-current/counter-current (fac04efc5c79 Linux 6.13-rc2)
Merging char-misc.current/char-misc-linus (2014c95afece Linux 6.14-rc1)
Merging soundwire-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging thunderbolt-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging input-current/for-linus (3492321e2e60 Input: xpad - add multiple su=
pported devices)
Merging crypto-current/master (9d4f8e54cef2 rhashtable: Fix rhashtable_try_=
insert test)
Merging vfio-fixes/for-linus (09dfc8a5f2ce vfio/pci: Fallback huge faults f=
or unaligned pfn)
Merging kselftest-fixes/fixes (777f290ab328 selftests/ftrace: adjust offset=
 for kprobe syntax error test)
Merging dmaengine-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (d15638bf76ad Revert "mtd: spi-nor: core: repla=
ce dummy buswidth from addr to data")
Merging mfd-fixes/for-mfd-fixes (68f860426d50 mfd: axp20x: AXP717: Fix miss=
ing IRQ status registers range)
Merging v4l-dvb-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging reset-fixes/reset/fixes (2014c95afece Linux 6.14-rc1)
Merging mips-fixes/mips-fixes (2014c95afece Linux 6.14-rc1)
Merging at91-fixes/at91-fixes (2014c95afece Linux 6.14-rc1)
Merging omap-fixes/fixes (40384c840ea1 Linux 6.13-rc1)
Merging kvm-fixes/master (a5546c2f0dc4 Merge tag 'kvm-s390-master-6.13-1' o=
f https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging kvms390-fixes/master (e376d958871c KVM: s390: selftests: Add has de=
vice attr check to uc_attr_mem_limit selftest)
Merging hwmon-fixes/hwmon (84426506171b hwmon: (peci/dimmtemp) Do not provi=
de fake thresholds data)
Merging nvdimm-fixes/libnvdimm-fixes (265e98f72bac acpi: nfit: vmalloc-out-=
of-bounds Read in acpi_nfit_ctl)
Merging cxl-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging dma-mapping-fixes/for-linus (78b2770c935f dma-mapping: fix tracing =
dma_alloc/free with vmalloc'd memory)
Merging drivers-x86-fixes/fixes (a787ab73e2e4 platform/x86/intel/ifs: Updat=
e documentation with image download path)
Merging samsung-krzk-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging pinctrl-samsung-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging devicetree-fixes/dt/linus (2a03d2da55b4 dt-bindings: nvmem: qcom,qf=
prom: Add SAR2130P compatible)
Merging dt-krzk-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging scsi-fixes/fixes (5233e3235dec scsi: qla1280: Fix kernel oops when =
debug level > 2)
Merging drm-fixes/drm-fixes (9b1c673a1648 Merge tag 'drm-xe-fixes-2025-01-1=
6' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (230b19bc2bcc drm/i915/dp: Ite=
rate DSC BPP from high to low on all platforms)
Merging mmc-fixes/fixes (3e68abf2b9ce mmc: mtk-sd: Fix register settings fo=
r hs400(es) mode)
Merging rtc-fixes/rtc-fixes (40384c840ea1 Linux 6.13-rc1)
Merging gnss-fixes/gnss-linus (2014c95afece Linux 6.14-rc1)
Merging hyperv-fixes/hyperv-fixes (175c71c2acee tools/hv: reduce resource u=
sage in hv_kvp_daemon)
Merging risc-v-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging riscv-dt-fixes/riscv-dt-fixes (1b133129ad6b riscv: dts: starfive: F=
ix a typo in StarFive JH7110 pin function definitions)
Merging riscv-soc-fixes/riscv-soc-fixes (2014c95afece Linux 6.14-rc1)
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (2014c95afece Linux 6.14-rc1)
Merging gpio-brgl-fixes/gpio/for-current (d6179f6c6204 gpio: pca953x: Impro=
ve interrupt support)
Merging gpio-intel-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging pinctrl-intel-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging auxdisplay-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging kunit-fixes/kunit-fixes (40384c840ea1 Linux 6.13-rc1)
Merging memblock-fixes/fixes (180bbad69864 arch_numa: Restore nid checks be=
fore registering a memblock with a node)
Merging renesas-fixes/fixes (124f4f1a1869 MAINTAINERS: Re-add cancelled Ren=
esas driver sections)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging perf-current/perf-tools (9fae5884bb0e perf cpumap: Fix die and clus=
ter IDs)
Merging efi-fixes/urgent (bbc4578537e3 efi: Use BIT_ULL() constants for mem=
ory attributes)
Merging zstd-fixes/zstd-linus (77618db34645 zstd: Fix array-index-out-of-bo=
unds UBSAN warning)
Merging battery-fixes/fixes (98380110bd48 power: supply: axp20x_battery: Fi=
x fault handling for AXP717)
Merging iommufd-fixes/for-rc (2ca704f55e22 iommu/arm-smmu-v3: Improve uAPI =
comment for IOMMU_HW_INFO_TYPE_ARM_SMMUV3)
Merging rust-fixes/rust-fixes (2014c95afece Linux 6.14-rc1)
Merging w1-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging pmdomain-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging i2c-host-fixes/i2c/i2c-host-fixes (9d89551994a4 Linux 6.13-rc6)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (2014c95afece Linux 6.14-rc1)
Merging pwrseq-fixes/pwrseq/for-current (2014c95afece Linux 6.14-rc1)
Merging thead-dt-fixes/thead-dt-fixes (40384c840ea1 Linux 6.13-rc1)
Merging ftrace-fixes/ftrace/fixes (789a8cff8d2d ftrace: Fix function profil=
er's filtering functionality)
Merging ring-buffer-fixes/ring-buffer/fixes (8cd63406d081 trace/ring-buffer=
: Do not use TP_printk() formatting for boot mapped buffers)
Merging trace-fixes/trace/fixes (60295b944ff6 tracing: gfp: Fix the GFP enu=
m values shown for user space tracing tools)
Merging tracefs-fixes/tracefs/fixes (8b55572e5180 tracing/selftests: Add tr=
acefs mount options test)
Merging spacemit-fixes/fixes (2014c95afece Linux 6.14-rc1)
Merging tip-fixes/tip/urgent (a869ffcd79a0 Merge branch into tip/master: 'x=
86/urgent')
Merging slab-fixes/slab/for-next-fixes (b7ffecbe198e memcg: slub: fix SUnre=
claim for post charged objects)
Merging drm-msm-fixes/msm-fixes (789384eb1437 drm/msm/dpu: check dpu_plane_=
atomic_print_state() for valid sspp)
Merging uml-fixes/fixes (095f7a647ccd um: convert irq_lock to raw spinlock)
Merging drm-misc-fixes/for-linux-next-fixes (41a2d8286c90 accel/ivpu: Fix e=
rror handling in recovery/reset)
Merging linus/for-next (ffd294d346d1 Linux 6.13)
Merging mm-stable/mm-stable (b4b0881156fb Merge tag 'docs-6.14-2' of git://=
git.lwn.net/linux)
Merging mm-nonmm-stable/mm-nonmm-stable (b4b0881156fb Merge tag 'docs-6.14-=
2' of git://git.lwn.net/linux)
Merging mm/mm-everything (f853185cdf0f foo)
Merging kbuild/for-next (2014c95afece Linux 6.14-rc1)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (23e0a63c6dd3 perf script: force stdin for fla=
megraph in live mode)
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
Merging at91/at91-next (2014c95afece Linux 6.14-rc1)
Merging broadcom/next (82a9d82d35f9 Merge branch 'devicetree-arm64/next' in=
to next)
Merging davinci/davinci/for-next (58abc69e479c ARM: dts: ti: davinci: Align=
 GPIO hog name with bindings)
Merging drivers-memory/for-next (b9c791c65ced Merge branch 'mem-ctrl-next' =
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
Merging renesas/next (7e9ab8c11f60 Merge branches 'renesas-arm-defconfig-fo=
r-v6.15', 'renesas-arm-soc-for-v6.15', 'renesas-drivers-for-v6.15', 'renesa=
s-dt-bindings-for-v6.15' and 'renesas-dts-for-v6.15' into renesas-next)
Merging reset/reset/next (2014c95afece Linux 6.14-rc1)
Merging rockchip/for-next (6399b505aad2 Merge branch 'v6.15-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (972589c50bb8 Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (b81ada150448 Merge tag 'scmi-updates-6.14' of =
ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into =
for-linux-next)
Merging sophgo/for-next (40384c840ea1 Linux 6.13-rc1)
Merging spacemit/for-next (2014c95afece Linux 6.14-rc1)
Merging stm32/stm32-next (8c6d469f5249 ARM: dts: stm32: lxa-fairytux2: add =
Linux Automation GmbH FairyTux 2)
Merging sunxi/sunxi/for-next (2014c95afece Linux 6.14-rc1)
Merging tee/next (a7562ff02879 Merge branch 'optee_for_v6.14' into next)
Merging tegra/for-next (0a891b9fcd9b Merge branch for-6.14/arm64/dt into fo=
r-next)
Merging thead-dt/thead-dt-for-next (c95c1362e5bc riscv: dts: thead: Add mai=
lbox node)
Merging ti/ti-next (2014c95afece Linux 6.14-rc1)
Merging xilinx/for-next (600d48b6f347 Merge branch 'zynq/dt' into for-next)
Merging clk/clk-next (2014c95afece Linux 6.14-rc1)
Merging clk-imx/for-next (48806be08636 clk: imx: Apply some clks only for i=
.MX93)
Merging clk-renesas/renesas-clk (5a1cb35ba37a clk: renesas: r9a09g047: Add =
ICU clock/reset)
Merging csky/linux-next (2b48804336be csky: fix csky_cmpxchg_fixup not work=
ing)
Merging loongarch/loongarch-next (531936dee53e LoongArch: Extend the maximu=
m number of watchpoints)
Merging m68k/for-next (723be3c6ab31 m68k: sun3: Fix DEBUG_MMU_EMU build)
Merging m68knommu/for-next (c70f5de8738e m68k: Do not include <linux/fb.h>)
Merging microblaze/next (920354d7818b microblaze: Use of_property_present()=
 for non-boolean properties)
Merging mips/mips-next (2014c95afece Linux 6.14-rc1)
Merging openrisc/for-next (ea1413e5b53a rseq/selftests: Add support for Ope=
nRISC)
Merging parisc-hd/for-next (4e3ff3c5854f parisc: Remove memcpy_fromio)
Merging powerpc/next (17391cb2613b powerpc/pseries/iommu: Don't unset windo=
w if it was never set)
Merging risc-v/for-next (2014c95afece Linux 6.14-rc1)
Merging riscv-dt/riscv-dt-for-next (9b181f4a9538 riscv: dts: microchip: upd=
ate pcie reg properties to new format)
Merging riscv-soc/riscv-soc-for-next (2014c95afece Linux 6.14-rc1)
Merging s390/for-next (2014c95afece Linux 6.14-rc1)
Merging sh/for-next (2014c95afece Linux 6.14-rc1)
Merging sparc/for-next (2cec2c4dc90c sparc/irq: Remove unneeded if check in=
 sun4v_cookie_only_virqs())
Merging uml/next (2d2b61ae38bd um: Remove unused asm/archparam.h header)
Merging xtensa/xtensa-for-next (d14b9a713b34 xtensa/simdisk: Use str_write_=
read() helper in simdisk_transfer())
Merging fs-next (0e3c9e4d9bc8 Merge branch 'for-next' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging printk/for-next (9022df7f5e05 Merge branch 'for-6.14-cpu_sync-fixup=
' into for-next)
Merging pci/next (2014c95afece Linux 6.14-rc1)
Merging pstore/for-next/pstore (067cdf020329 pstore/zone: avoid dereferenci=
ng zero sized ptr after init zones)
Merging hid/for-next (899da1f9df45 Merge branch 'for-6.14/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (2014c95afece Linux 6.14-rc1)
Merging i2c-host/i2c/i2c-host (fd4e93083129 i2c: i801: Add lis3lv02d for De=
ll Precision M6800)
Merging i3c/i3c/next (5eb6d3561f6c i3c: master: Improve initialization of n=
umbered I2C adapters)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (bfbb730c4255 hwmon: (sht3x) Use per-clien=
t debugfs entry)
Merging jc_docs/docs-next (e8bcda12176c docs: admin-guide: rename GTK+ to G=
TK)
Merging v4l-dvb/next (2014c95afece Linux 6.14-rc1)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (d3b6770a5971 Merge branch 'pm-powercap' into fixes)
Merging cpufreq-arm/cpufreq/arm/linux-next (7b258df4269f cpufreq: Remove cp=
ufreq_enable_boost_support())
Merging cpupower/cpupower (3d6f25870d17 pm: cpupower: Add missing residency=
 header changes in cpuidle.h to SWIG)
Merging devfreq/devfreq-next (f3253b23535f PM / devfreq: exynos: remove unu=
sed function parameter)
Merging pmdomain/next (432a6d050b0e pmdomain: bcm2835-power: set flag GENPD=
_FLAG_ACTIVE_WAKEUP)
Merging opp/opp/linux-next (2014c95afece Linux 6.14-rc1)
Merging thermal/thermal/linux-next (7d8abc5f3b5c thermal/drivers/imx_sc_the=
rmal: Use dev_err_probe)
Merging rdma/for-next (2014c95afece Linux 6.14-rc1)
Merging net-next/main (b565a8c750ef cavium/liquidio: Remove unused lio_get_=
device_id)
Merging bpf-next/for-next (03f3aa4a6b66 Merge branch 'selftests-bpf-migrate=
-test_xdp_redirect_multi-sh-to-test_progs')
Merging ipsec-next/master (7082a6dc84eb net/mlx5e: Update TX ESN context fo=
r IPSec hardware offload)
Merging mlx5-next/mlx5-next (6ca00ec47b70 net/mlx5: Add nic_cap_reg and vhc=
a_icm_ctrl registers)
Merging netfilter-next/main (0ad9617c78ac Merge tag 'net-next-6.14' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging ipvs-next/main (0ad9617c78ac Merge tag 'net-next-6.14' of git://git=
.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging bluetooth/master (c411c62cc133 Bluetooth: hci_uart: fix race during=
 initialization)
Merging wireless-next/for-next (22f3551b60be wifi: ipw2x00: Remove unused l=
ibipw_rx_any())
Merging ath-next/for-next (f5c90ff80b4c wifi: ath12k: Add Support to Calcul=
ate and Display TPC Values)
Merging wpan-next/master (3e5908172c05 Merge tag 'ieee802154-for-net-next-2=
025-01-03' of git://git.kernel.org/pub/scm/linux/kernel/git/wpan/wpan-next)
Merging wpan-staging/staging (3e5908172c05 Merge tag 'ieee802154-for-net-ne=
xt-2025-01-03' of git://git.kernel.org/pub/scm/linux/kernel/git/wpan/wpan-n=
ext)
Merging mtd/mtd/next (0ddeb4fe9d3b Merge tag 'nand/for-6.14' into mtd/next)
Merging nand/nand/next (98b34d52004b mtd: spinand: skyhigh: Align with rece=
nt read from cache variant changes)
Merging spi-nor/spi-nor/next (8079d5bc5c3d mtd: spi-nor: winbond: Add suppo=
rt for w25q02jv)
Merging crypto/master (9d4f8e54cef2 rhashtable: Fix rhashtable_try_insert t=
est)
Merging drm/drm-next (2014c95afece Linux 6.14-rc1)
Merging drm-exynos/for-linux-next (31b2be07afd0 drm/exynos: Remove unnecess=
ary checking)
Merging drm-misc/for-linux-next (ecee4d069506 accel/amdxdna: Add MODULE_FIR=
MWARE() declarations)
Merging amdgpu/drm-next (f245b400a223 Revert "drm/amd/display: Use HW lock =
mgr for PSR1")
Merging drm-intel/for-linux-next (71be80200507 drm/i915/dmc_wl: Track INITI=
ATE_PM_DMD_REQ for DC5)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dp=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_fb=
.c
Merging drm-msm/msm-next (866e43b945bf drm/msm: UAPI error reporting)
Merging drm-msm-lumag/msm-next-lumag (a5463629299b drm/msm/dpu: Add RM supp=
ort for allocating CWB)
Merging drm-xe/drm-xe-next (9c9dc9ba4a00 drm/xe/pxp: Fail the load if PXP f=
ails to initialize)
Merging etnaviv/etnaviv/next (6bde14ba5f7e drm/etnaviv: add optional reset =
support)
Merging fbdev/for-next (c454bc716854 fbcon: Use correct erase colour for cl=
earing in fbcon)
Merging regmap/for-next (995cf0e014b0 regmap: Reorder 'struct regmap')
Merging sound/for-next (8c2fa44132e8 ALSA: hda/realtek: Workaround for resu=
me on Dell Venue 11 Pro 7130)
Merging ieee1394/for-next (352fafe97784 firewire: test: Fix potential null =
dereference in firewire kunit test)
Merging sound-asoc/for-next (6b24e67b4056 ASoC: rockchip: i2s-tdm: fix shif=
t config for SND_SOC_DAIFMT_DSP_[AB])
Merging modules/modules-next (053842ec3c33 bug: Use RCU instead RCU-sched t=
o protect module_bug_list.)
Merging input/next (ab4976976ee1 Input: drop vb2_ops_wait_prepare/finish)
Merging block/for-next (948a05092398 Merge branch 'for-6.15/io_uring' into =
for-next)
Merging device-mapper/for-next (0ce46f4f751b dm vdo slab-depot: read refcou=
nt blocks in large chunks at load time)
Merging libata/for-next (deca423213cb ata: libata-core: Add 'external' to t=
he libata.force kernel parameter)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (cb71db3b2cea mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (2816b0c949af MAINTAINERS: Adjust the file entry f=
or the qnap-mcu header)
Merging backlight/for-backlight-next (40384c840ea1 Linux 6.13-rc1)
Merging battery/for-next (2014c95afece Linux 6.14-rc1)
Merging regulator/for-next (3c32a4386909 regulator: Add device tree support=
 to AD5398)
Merging security/next (2014c95afece Linux 6.14-rc1)
Merging apparmor/apparmor-next (e6b087676954 apparmor: fix dbus permission =
queries to v9 ABI)
Merging integrity/next-integrity (4785ed362a24 ima: ignore suffixed policy =
rule comments)
Merging selinux/next (2014c95afece Linux 6.14-rc1)
Merging smack/next (6f71ad02aae8 smack: deduplicate access to string conver=
sion)
Merging tomoyo/master (bdc35f164b0f tomoyo: use better patterns for procfs =
in learning mode)
Merging tpmdd/next (b46c89c08f41 Merge tag 'spi-fix-v6.14-merge-window' of =
git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging watchdog/master (2014c95afece Linux 6.14-rc1)
Merging iommu/next (125f34e4c107 Merge branches 'arm/smmu/updates', 'arm/sm=
mu/bindings', 'qualcomm/msm', 'rockchip', 'riscv', 'core', 'intel/vt-d' and=
 'amd/amd-vi' into next)
Merging audit/next (2014c95afece Linux 6.14-rc1)
Merging devicetree/for-next (40fc0083a9db dt-bindings: xilinx: Remove desci=
ption for 16550 uart)
Merging dt-krzk/for-next (2014c95afece Linux 6.14-rc1)
Merging mailbox/for-next (4783ce32b080 riscv: export __cpuid_to_hartid_map)
Merging spi/for-next (696d6db2b6df Merge remote-tracking branch 'spi/for-6.=
15' into spi-next)
Merging tip/master (3e9fc9c9698d Merge branch into tip/master: 'x86/mm')
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
Merging kvms390/next (32239066776a KVM: s390: selftests: Streamline uc_skey=
 test to issue iske after sske)
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
Merging sched-ext/for-next (8bb761bb2d50 Merge branch 'for-6.15' into for-n=
ext)
Merging drivers-x86/for-next (2014c95afece Linux 6.14-rc1)
Merging chrome-platform/for-next (d83c45aeec9b platform/chrome: cros_ec_lpc=
: Match on Framework ACPI device)
Merging chrome-platform-firmware/for-firmware-next (2014c95afece Linux 6.14=
-rc1)
Merging hsi/for-next (40384c840ea1 Linux 6.13-rc1)
Merging leds-lj/for-leds-next (daefd7fbd544 leds: triggers: Constify 'struc=
t bin_attribute')
Merging ipmi/for-next (83d8c79aa958 ipmi: ssif_bmc: Fix new request loss wh=
en bmc ready for a response)
Merging driver-core/driver-core-next (2014c95afece Linux 6.14-rc1)
Merging usb/usb-next (9682c35ff6ec usb: typec: thunderbolt: Remove IS_ERR c=
heck for plug)
Merging thunderbolt/next (2014c95afece Linux 6.14-rc1)
Merging usb-serial/usb-next (2014c95afece Linux 6.14-rc1)
Merging tty/tty-next (2014c95afece Linux 6.14-rc1)
Merging char-misc/char-misc-next (2014c95afece Linux 6.14-rc1)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (56e14a21cee4 coresight-tpda: Optimize the function =
of reading element size)
Merging fastrpc/for-next (40384c840ea1 Linux 6.13-rc1)
Merging fpga/for-next (46b155acbf4e fpga: dfl: destroy/recreate feature pla=
tform device on port release/assign)
Merging icc/icc-next (4cc004716977 Merge branch 'icc-sm8750' into icc-next)
Merging iio/togreg (56fb2dd839b3 iio: pressure: zpa2326: Drop unneeded assi=
gnment for cache_type)
Merging phy-next/next (2014c95afece Linux 6.14-rc1)
Merging soundwire/next (2014c95afece Linux 6.14-rc1)
Merging extcon/extcon-next (7041ed0dde83 extcon: Drop explicit initializati=
on of struct i2c_device_id::driver_data to 0)
Merging gnss/gnss-next (2014c95afece Linux 6.14-rc1)
Merging vfio/next (2bb447540e71 vfio/nvgrace-gpu: Add GB200 SKU to the devi=
d table)
Merging w1/for-next (33c145297840 w1: w1_therm: w1: Use HWMON_CHANNEL_INFO =
macro to simplify code)
Merging spmi/spmi-next (40384c840ea1 Linux 6.13-rc1)
Merging staging/staging-next (7b66aae77da5 staging: gpib: Remove depends on=
 BROKEN)
Merging counter-next/counter-next (ceb3075433d9 counter: ti-eqep: add direc=
tion support)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (59b723cd2adb Linux 6.12-rc6)
Merging dmaengine/next (2014c95afece Linux 6.14-rc1)
Merging cgroup/for-next (f548f3f002f7 Merge branch 'for-6.14-fixes' into fo=
r-next)
Merging scsi/for-next (c57ef5d3d7bc Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (640a6af5099a scsi: ufs: qcom: Enable UFS Shared =
ICE Feature)
Merging vhost/linux-next (5820a3b08987 virtio_blk: Add support for transpor=
t error recovery)
Merging rpmsg/for-next (3a53ff95b0be remoteproc: st: Use syscon_regmap_look=
up_by_phandle_args)
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (de454ac4fc5a gpio: Use str_enable_disable-=
like helpers)
Merging gpio-intel/for-next (2014c95afece Linux 6.14-rc1)
Merging pinctrl/for-next (1ddee69108d3 pinctrl: cy8c95x0: Respect IRQ trigg=
er settings from firmware)
Merging pinctrl-intel/for-next (112f5e0917cf pwm: lpss: Actually use a modu=
le namespace by defining the namespace earlier)
Merging pinctrl-renesas/renesas-pinctrl (accabfaae094 pinctrl: renesas: rzg=
2l: Fix PFC_MASK for RZ/V2H and RZ/G3E)
Merging pinctrl-samsung/for-next (2014c95afece Linux 6.14-rc1)
Merging pwm/pwm/for-next (444053e3c42a pwm: lpss: Only include <linux/pwm.h=
> where needed)
Merging ktest/for-next (f3a30016e4b5 ktest.pl: Fix typo "accesing")
Merging kselftest/next (336d02bc4c6b selftests/rseq: Fix handling of glibc =
without rseq support)
Merging kunit/test (40384c840ea1 Linux 6.13-rc1)
Merging kunit-next/kunit (31691914c392 kunit: Introduce autorun option)
Merging livepatching/for-next (f76ad354146d Merge branch 'for-6.14/selftest=
s-dmesg' into for-next)
Merging rtc/rtc-next (97274527e8dc rtc: pcf2127: add BSM support)
Merging nvdimm/libnvdimm-for-next (f3dd9ae7f03a dax: Remove an unused field=
 in struct dax_operations)
Merging at24/at24/for-next (2014c95afece Linux 6.14-rc1)
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
Merging auxdisplay/for-next (2014c95afece Linux 6.14-rc1)
Merging kgdb/kgdb/for-next (6beaa75cd24d kdb: Remove unused flags stack)
Merging hmm/hmm (40384c840ea1 Linux 6.13-rc1)
Merging cfi/cfi/next (40384c840ea1 Linux 6.13-rc1)
Merging mhi/mhi-next (29904a40127c bus: mhi: host: pci_generic: Enable MSI-=
X if the endpoint supports)
Merging memblock/for-next (98b7beba1ee6 memblock: uniformly initialize all =
reserved pages to MIGRATE_MOVABLE)
Merging cxl/next (6cd498f39cf5 Merge branch 'for-6.15/dpa-partition-cleanup=
' into cxl-for-next)
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (2014c95afece Linux 6.14-rc1)
Merging unicode/for-next (6b56a63d286f MAINTAINERS: Add Unicode tree)
Merging slab/slab/for-next (e492fac3657b Merge branch 'slab/for-6.14/kfree_=
rcu_move' into slab/for-next)
Merging random/master (d18c13697b4d prandom: Include <linux/percpu.h> in <l=
inux/prandom.h>)
Merging landlock/next (24a8e44deae4 landlock: Fix grammar error)
Merging rust/rust-next (2014c95afece Linux 6.14-rc1)
Merging sysctl/sysctl-next (9c738dae9534 sysctl: Reduce dput(child) calls i=
n proc_sys_fill_cache())
Merging execve/for-next/execve (87dd41e7faf2 Merge branch 'for-next/topic/e=
xecve/AT_EXECVE_CHECK' into for-next/execve)
CONFLICT (content): Merge conflict in include/linux/binfmts.h
Merging bitmap/bitmap-for-next (404e6d88ddaf bitmap: Align documentation be=
tween bitmap_gather() and bitmap_scatter())
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (28d00b3e5953 stackinit: Fix comment for test_sm=
all_end)
Merging kspp-gustavo/for-next/kspp (6613476e225e Linux 6.8-rc1)
Merging nolibc/nolibc (24728b70b036 Merge tag 'nolibc-20250113-for-6.14-1' =
of https://git.kernel.org/pub/scm/linux/kernel/git/nolibc/linux-nolibc into=
 nolibc)
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (e721f619e3ec iommufd: Fix struct iommu_hwpt_pgfau=
lt init and padding)
Merging turbostat/next (2c4627c8ced7 tools/power turbostat: version 2025.02=
.02)
Merging pwrseq/pwrseq/for-next (2014c95afece Linux 6.14-rc1)
Merging capabilities-next/caps-next (d48da4d5ed7b security: add trace event=
 for cap_capable)
Merging ipe/next (aefadf03b3e3 ipe: policy_fs: fix kernel-doc warnings)
Merging kcsan/next (9d89551994a4 Linux 6.13-rc6)
Merging crc/crc-next (b79059781ad0 lib/crc64: add support for arch-optimize=
d implementations)
Merging kthread/for-next (d8b4bf4ea04d kthread: modify kernel-doc function =
name to match code)
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)

--Sig_/UzzK6vv..YYbVH1dDagQhj3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmei40cACgkQAVBC80lX
0Gzs8wf/XSbrEV7lBmFYV3mriB3nVNknmFn61bUFFNt1AnlZUM6oXB51cvBFtvkg
DuTJsA1h9vwsl+LsgQsV6vMZ/HxggeQltz5O/skgzv4LCGO+s+8j8qaVH26fhqbx
4AUK5NrC61DQGrjlXaVaKV3DYXU3Vi2Ffv99PKquEBCMH2PElmEUE6g+1PFFDNCy
fzjrBYdVvut77MUBT6H6+gbGX6A7ZnjGDUoMZVoY3V4Z8by3M9N8InJ+9J9ZD620
z+7Le6PNqR1/CWdoHUcChSu9TZYKSYOUtDI122wqBShNZ7ZsgR1KM51jXA49nK6N
zIReR3u0dhMu93K7hYYNmwB/d1sn5A==
=BHCX
-----END PGP SIGNATURE-----

--Sig_/UzzK6vv..YYbVH1dDagQhj3--

