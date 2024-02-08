Return-Path: <linux-next+bounces-1075-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A38AB84D948
	for <lists+linux-next@lfdr.de>; Thu,  8 Feb 2024 04:56:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F16E61F21424
	for <lists+linux-next@lfdr.de>; Thu,  8 Feb 2024 03:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D66F2D79D;
	Thu,  8 Feb 2024 03:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="W2I/MmQG"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B782D044;
	Thu,  8 Feb 2024 03:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707364552; cv=none; b=pG9nv8JXPCnOO5YGh/9roYN1OFsqwdtiy0emoUn4ALDtZ2IXDA+pd6bShlQwCF6NbUSRg7OwnQav/QHfXMZcNpLEQpR2Vkqg5QkqbtH4NnvWSIfxOg1ocK+SEPqcajNdZ5sQi8ZpPKBuY5ySnnN8xU8vurXJvz4m54b1wPqXW4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707364552; c=relaxed/simple;
	bh=X67X2mij+Dpl22+jaIePSSUpENhiyBaVaal2bHoxhVs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WlBJ9i5M46gcgRAbrN/HNjBeETDAX/c4wOAzcBPE7r+X1+fPYq0KS5VCMWCmr2ciBaousZvz+wFj57xBJ7ONfJLWQmy+bSuDE1dl2eO9aowkuH39vFluI5f8C5xv8qpgrMj+pTINZC9T+F/6s+Wqcf59eAiDSZdpb98UvnM6Fvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=W2I/MmQG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1707364547;
	bh=rN4VImGfiad+jIVl/zJ/3/PDYKuB5Ay2UyWBESfBTRI=;
	h=Date:From:To:Cc:Subject:From;
	b=W2I/MmQG9rDZlDQtByUN/gN0CFfMapG0wpWz3idSKPGrSGhogu3EOQhok/6mjxUSD
	 e12urEtjCMSvU3j8et9aWtm6vp1ziPgec9ixs8p8yaZ3u8Fl0NDUUaDj9UmHZAVUrs
	 Iax6luhAzVkpYutUEgSk/CZCuW3XFyR2INc1kjt8EC+ax4pVlD8q14qwCS1G8plWOn
	 shFLIkmhuAtFpJV0nlE/ZygfRrF5BSIEGwTDtiy+DKYUHuFNIWk3ruy+LJXLOKTUCb
	 XxfmRq1v5/XbvAT0lRwvOocphPZFBCQ5tLfw3cRC13aZ/MgBIWOcyu3JTBtK/qIXYM
	 tmbGsDPexCryA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TVjnb34Nyz4wcR;
	Thu,  8 Feb 2024 14:55:47 +1100 (AEDT)
Date: Thu, 8 Feb 2024 14:55:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 8
Message-ID: <20240208145546.7acdf858@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/x04Yv3SZY0hcu8u8p/07OMd";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/x04Yv3SZY0hcu8u8p/07OMd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20240207:

The mm tree lost its build failure.

The perf tree losy its build failure.

The bcachefs tree still had its build failure so I used the version from
next-20240206.

The vfs-brauner tree gained a conflict against the cifs tree.

The pm tree gained a build failure for which I reverted a commit.

The drm-misc tree lost its build failure.

The device-mapper tree lost its build failure.

The tip tree gained a conflict against Linus' tree.

The drivers-x86 tree gained a conflict against Linus' tree.

The rpmsg tree gained a conflict against the pmdomain tree.

Non-merge commits (relative to Linus' tree): 4854
 5193 files changed, 243202 insertions(+), 104187 deletions(-)

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

I am currently merging 368 trees (counting Linus' and 103 trees of bug
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
Merging origin/master (547ab8fc4cb0 Merge tag 'loongarch-fixes-6.8-2' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson)
Merging fixes/fixes (2dde18cd1d8f Linux 6.5)
Merging mm-hotfixes/mm-hotfixes-unstable (04508c6ed250 mm/swap: fix race wh=
en skipping swapcache)
Merging kbuild-current/fixes (41b9fb381a48 Merge tag 'net-6.8-rc3' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging arc-current/for-curr (861deac3b092 Linux 6.7-rc7)
Merging arm-current/fixes (f54e8634d136 ARM: 9330/1: davinci: also select P=
INCTRL)
Merging arm64-fixes/for-next/fixes (c7767f5c43df arm64: vdso32: Remove unus=
ed vdso32-offsets.h)
Merging arm-soc-fixes/arm/fixes (1b5af823d703 soc/tegra: fix build failure =
on Tegra241)
Merging davinci-current/davinci/for-current (6613476e225e Linux 6.8-rc1)
Merging drivers-memory-fixes/fixes (6613476e225e Linux 6.8-rc1)
Merging sophgo-fixes/fixes (41bccc98fb79 Linux 6.8-rc2)
Merging tee-fixes/fixes (ceaa837f96ad Linux 6.2-rc8)
Merging m68k-current/for-linus (6b9c045b0602 m68k: defconfig: Update defcon=
figs for v6.7-rc1)
Merging powerpc-fixes/fixes (1c57b9f63ab3 powerpc: 85xx: mark local functio=
ns static)
Merging s390-fixes/fixes (6613476e225e Linux 6.8-rc1)
Merging fscrypt-current/for-current (4bcf6f827a79 fscrypt: check for NULL k=
eyring in fscrypt_put_master_key_activeref())
Merging fsverity-current/for-current (a075bacde257 fsverity: don't drop pag=
ecache at end of FS_IOC_ENABLE_VERITY)
Merging net/main (335bac1daae3 Merge tag 'wireless-2024-02-06' of git://git=
.kernel.org/pub/scm/linux/kernel/git/wireless/wireless)
Merging bpf/master (577e4432f3ac tcp: add sanity checks to rx zerocopy)
Merging ipsec/master (983a73da1f99 xfrm: Pass UDP encapsulation in TX packe=
t offload)
Merging netfilter/main (8059918a1377 netfilter: nft_ct: sanitize layer 3 an=
d 4 protocol number in custom expectations)
Merging ipvs/main (8059918a1377 netfilter: nft_ct: sanitize layer 3 and 4 p=
rotocol number in custom expectations)
Merging wireless/for-next (0647903efbc8 wifi: mt76: mt7996: fix fortify war=
ning)
Merging wpan/master (b85ea95d0864 Linux 6.7-rc1)
Merging rdma-fixes/for-rc (fdfa083549de RDMA/srpt: Support specifying the s=
rpt_service_guid parameter)
Merging sound-current/for-linus (fddab35fd064 ALSA: hda/realtek: add IDs fo=
r Dell dual spk platform)
Merging sound-asoc-fixes/for-linus (44d3b8a19b91 ASoC: Intel: avs: Fix dyna=
mic port assignment when TDM is set)
Merging regmap-fixes/for-linus (7011b51f13b3 regmap: kunit: fix raw noinc w=
rite test wrapping)
Merging regulator-fixes/for-linus (46d5baf046ab MAINTAINERS: repair entry f=
or MICROCHIP MCP16502 PMIC DRIVER)
Merging spi-fixes/for-linus (c712c05e46c8 spi: imx: fix the burst length at=
 DMA mode and CPU mode)
Merging pci-current/for-linus (67057f48df79 PCI: dwc: Clean up dw_pcie_ep_r=
aise_msi_irq() alignment)
Merging driver-core.current/driver-core-linus (6e7ad1aebb4f driver core: fw=
_devlink: Improve logs for cycle detection)
Merging tty.current/tty-linus (7be50f2e8f20 serial: mxs-auart: fix tx)
Merging usb.current/usb-linus (b55fe36efc22 Merge tag 'thunderbolt-for-v6.8=
-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt =
into usb-linus)
Merging usb-serial-fixes/usb-linus (54be6c6c5ae8 Linux 6.8-rc3)
Merging phy/fixes (734550d60cdf phy: qualcomm: eusb2-repeater: Rework init =
to drop redundant zero-out loop)
Merging staging.current/staging-linus (6613476e225e Linux 6.8-rc1)
Merging iio-fixes/fixes-togreg (4cb81840d8f2 iio: accel: bma400: Fix a comp=
ilation problem)
Merging counter-current/counter-current (6613476e225e Linux 6.8-rc1)
Merging char-misc.current/char-misc-linus (51c161008e04 Merge tag 'icc-6.8-=
rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc into char-=
misc-linus)
Merging soundwire-fixes/fixes (6613476e225e Linux 6.8-rc1)
Merging thunderbolt-fixes/fixes (ec4d82f855ce thunderbolt: Fix setting the =
CNS bit in ROUTER_CS_5)
Merging input-current/for-linus (4255447ad34c Input: i8042 - add Fujitsu Li=
febook U728 to i8042 quirk table)
Merging crypto-current/master (24c890dd712f crypto: algif_hash - Remove bog=
us SGL free on zero-length error path)
Merging vfio-fixes/for-linus (4ea95c04fa6b vfio: Drop vfio_file_iommu_group=
() stub to fudge around a KVM wart)
Merging kselftest-fixes/fixes (b54761f6e977 kselftest/seccomp: Report each =
expectation we assert as a KTAP test)
Merging modules-fixes/modules-linus (f412eef03938 Documentation: livepatch:=
 module-elf-format: Remove local klp_modinfo definition)
Merging dmaengine-fixes/fixes (9ba17defd9ed dmaengine: fsl-edma: correct ca=
lculation of 'nbytes' in multi-fifo scenario)
Merging backlight-fixes/for-backlight-fixes (6613476e225e Linux 6.8-rc1)
Merging mtd-fixes/mtd/fixes (e6a30d0c48a1 mtd: rawnand: marvell: fix layout=
s)
Merging mfd-fixes/for-mfd-fixes (6613476e225e Linux 6.8-rc1)
Merging v4l-dvb-fixes/fixes (346c84e281a9 media: pwm-ir-tx: Depend on CONFI=
G_HIGH_RES_TIMERS)
Merging reset-fixes/reset/fixes (4a6756f56bcf reset: Fix crash when freeing=
 non-existent optional resets)
Merging mips-fixes/mips-fixes (59be5c358501 mips: Call lose_fpu(0) before i=
nitializing fcr31 in mips_set_personality_nan)
Merging at91-fixes/at91-fixes (6613476e225e Linux 6.8-rc1)
Merging omap-fixes/fixes (9b6a51aab5f5 ARM: dts: Fix occasional boot hang f=
or am3 usb)
Merging kvm-fixes/master (e45964771007 x86/coco: Define cc_vendor without C=
ONFIG_ARCH_HAS_CC_PLATFORM)
Merging kvms390-fixes/master (83303a4c776c KVM: s390: fix cc for successful=
 PQAP)
Merging hwmon-fixes/hwmon (34cf8c657cf0 hwmon: (coretemp) Enlarge per packa=
ge core count limit)
Merging nvdimm-fixes/libnvdimm-fixes (33908660e814 ACPI: NFIT: Fix incorrec=
t calculation of idt size)
Merging cxl-fixes/fixes (6be99530c92c x86/numa: Fix the sort compare func u=
sed in numa_fill_memblks())
Merging btrfs-fixes/next-fixes (c94bd41cb0b6 Merge branch 'misc-6.8' into n=
ext-fixes)
Merging vfs-fixes/fixes (dac853a94365 Revert "get rid of DCACHE_GENOCIDE")
Merging dma-mapping-fixes/for-linus (d5090484b021 swiotlb: do not try to al=
locate a TLB bigger than MAX_ORDER pages)
Merging drivers-x86-fixes/fixes (1abdf288b0ef platform/x86: touchscreen_dmi=
: Add info for the TECLAST X16 Plus tablet)
Merging samsung-krzk-fixes/fixes (eab4f56d3e75 ARM: dts: exynos4212-tab3: a=
dd samsung,invert-vclk flag to fimd)
Merging pinctrl-samsung-fixes/fixes (6613476e225e Linux 6.8-rc1)
Merging devicetree-fixes/dt/linus (17adc3f329e9 net: marvell,prestera: Fix =
example PCI bus addressing)
Merging dt-krzk-fixes/fixes (6613476e225e Linux 6.8-rc1)
Merging scsi-fixes/fixes (17e94b258541 scsi: ufs: core: Remove the ufshcd_r=
elease() in ufshcd_err_handling_prepare())
Merging drm-fixes/drm-fixes (d0399da9fb5f drm/sched: Re-queue run job worke=
r when drm_sched_entity_pop_job() returns NULL)
Merging drm-intel-fixes/for-linux-next-fixes (a99682e839af Merge tag 'gvt-f=
ixes-2024-02-05' of https://github.com/intel/gvt-linux into drm-intel-fixes)
Merging mmc-fixes/fixes (cc9432c4fb15 mmc: slot-gpio: Allow non-sleeping GP=
IO ro)
Merging rtc-fixes/rtc-fixes (08279468a294 rtc: sunplus: fix format string f=
or printing resource)
Merging gnss-fixes/gnss-linus (54be6c6c5ae8 Linux 6.8-rc3)
Merging hyperv-fixes/hyperv-fixes (564eac2860bd hv_utils: Allow implicit IC=
TIMESYNCFLAG_SYNC)
Merging soc-fsl-fixes/fix (06c2afb862f9 Linux 6.5-rc1)
Merging risc-v-fixes/fixes (6613476e225e Linux 6.8-rc1)
Merging riscv-dt-fixes/riscv-dt-fixes (6613476e225e Linux 6.8-rc1)
Merging riscv-soc-fixes/riscv-soc-fixes (a9d022ae8c4f Merge branch 'riscv-s=
oc-drivers-fixes' into riscv-soc-fixes)
Merging fpga-fixes/fixes (6613476e225e Linux 6.8-rc1)
Merging spdx/spdx-linus (6613476e225e Linux 6.8-rc1)
Merging gpio-brgl-fixes/gpio/for-current (41bccc98fb79 Linux 6.8-rc2)
Merging gpio-intel-fixes/fixes (6613476e225e Linux 6.8-rc1)
Merging pinctrl-intel-fixes/fixes (6613476e225e Linux 6.8-rc1)
Merging erofs-fixes/fixes (d9281660ff3f erofs: relaxed temporary buffers al=
location on readahead)
Merging kunit-fixes/kunit-fixes (829388b725f8 kunit: device: Unregister the=
 kunit_bus on shutdown)
Merging ubifs-fixes/fixes (2241ab53cbb5 Linux 6.2-rc5)
Merging memblock-fixes/fixes (6a9531c3a880 memblock: fix crash when reserve=
d memory is not added to memory)
Merging nfsd-fixes/nfsd-fixes (5ea9a7c5fe41 nfsd: don't take fi_lock in nfs=
d_break_deleg_cb())
Merging renesas-fixes/fixes (9eab43facdad soc: renesas: ARCH_R9A07G043 depe=
nds on !RISCV_ISA_ZICBOM)
Merging perf-current/perf-tools (fdd0ae72b34e perf tools headers: update th=
e asm-generic/unaligned.h copy with the kernel sources)
Merging efi-fixes/urgent (1ad55cecf22f x86/efistub: Use 1:1 file:memory map=
ping for PE/COFF .compat section)
Merging zstd-fixes/zstd-linus (77618db34645 zstd: Fix array-index-out-of-bo=
unds UBSAN warning)
Merging battery-fixes/fixes (d0266d7ab161 Revert "power: supply: qcom_battm=
gr: Register the power supplies after PDR is up")
Merging uml-fixes/fixes (73a23d771033 um: harddog: fix modular build)
Merging iommufd-fixes/for-rc (28b9f669e10f iommufd/iova_bitmap: Consider pa=
ge offset for the pages to be pinned)
Merging rust-fixes/rust-fixes (6613476e225e Linux 6.8-rc1)
Merging v9fs-fixes/fixes/next (6613476e225e Linux 6.8-rc1)
Merging w1-fixes/fixes (6613476e225e Linux 6.8-rc1)
Merging pmdomain-fixes/fixes (c41336f4d690 pmdomain: mediatek: fix race con=
ditions with genpd)
Merging overlayfs-fixes/ovl-fixes (420332b94119 ovl: mark xwhiteouts direct=
ory with overlay.opaque=3D'x')
Merging i2c-host-fixes/i2c/i2c-host-fixes (9189526c46f2 MAINTAINERS: Update=
 i2c host drivers repository)
Merging drm-misc-fixes/for-linux-next-fixes (5f8408aca667 accel/ivpu: Add j=
ob status for jobs aborted by the driver)
Merging mm-stable/mm-stable (54be6c6c5ae8 Linux 6.8-rc3)
Merging mm-nonmm-stable/mm-nonmm-stable (54be6c6c5ae8 Linux 6.8-rc3)
Merging mm/mm-everything (e936bc08e894 Merge branch 'mm-nonmm-unstable' int=
o mm-everything)
Merging kbuild/for-next (a8fdabe1e15d kbuild: deb-pkg: call more misc debhe=
lper commands)
Merging clang-format/clang-format (5a205c6a9f79 clang-format: Update with v=
6.7-rc4's `for_each` macro list)
Merging perf/perf-tools-next (5b9e4eefc5f8 perf record: Display data size o=
n pipe mode)
Merging compiler-attributes/compiler-attributes (2993eb7a8d34 Compiler Attr=
ibutes: counted_by: fixup clang URL)
Merging dma-mapping/for-next (7c65aa3cc072 dma-debug: fix kernel-doc warnin=
gs)
Merging asm-generic/master (34b2321cc648 MAINTAINERS: Add Andreas Larsson a=
s co-maintainer for arch/sparc)
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (8790fade1a19 Merge branches 'misc' and 'fixes' into f=
or-next)
Merging arm64/for-next/core (1b20d0486a60 arm64: Fix silcon-errata.rst form=
atting)
Merging arm-perf/for-next/perf (bb339db4d363 arm: perf: Fix ARCH=3Darm buil=
d with GCC)
Merging arm-soc/for-next (de4b6d6705a7 Merge branch 'soc/defconfig' into fo=
r-next)
Merging amlogic/for-next (0dd3ee311255 Linux 6.7)
Merging asahi-soc/asahi-soc/for-next (ffc253263a13 Linux 6.6)
Merging aspeed/for-next (e60f7a99d378 ARM: dts: aspeed: minerva: add sgpio =
line name)
Merging at91/at91-next (859f600457cc Merge branch 'clk-microchip' into at91=
-next)
Merging broadcom/next (412c6bd2c649 Merge branch 'soc/next' into next)
Merging davinci/davinci/for-next (6613476e225e Linux 6.8-rc1)
Merging drivers-memory/for-next (2f542c937c48 dt-bindings: memory-controlle=
rs: narrow regex for unit address to hex numbers)
Merging imx-mxs/for-next (d93b6c641bc9 Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (8645a7bbcb27 Merge branch 'v6.8-next/dts64' into=
 for-next)
Merging mvebu/for-next (476887312c60 Merge branch 'mvebu/drivers' into mveb=
u/for-next)
Merging omap/for-next (0012c1958460 Merge branches 'sgx-for-v6.9' and 'omap=
-for-v6.9/soc' into for-next)
Merging qcom/for-next (fdec1fa91eb7 Merge branches 'arm32-for-6.9', 'arm64-=
defconfig-for-6.9', 'arm64-fixes-for-6.8', 'arm64-for-6.9', 'clk-for-6.9' a=
nd 'drivers-for-6.9' into for-next)
Merging renesas/next (91487349a9c3 Merge branch 'renesas-dts-for-v6.9' into=
 renesas-next)
Merging reset/reset/next (c3c46acd5be9 dt-bindings: reset: hisilicon,hi3660=
-reset: Drop providers and consumers from example)
Merging rockchip/for-next (13c241737fc0 Merge branch 'v6.9-armsoc/dts64' in=
to for-next)
Merging samsung-krzk/for-next (a5cfa2d41f4a Merge branches 'fixes', 'next/c=
lk', 'next/defconfig', 'next/drivers', 'next/dt', 'next/dt64' and 'next/soc=
' into for-next)
Merging scmi/for-linux-next (99f798bdfb75 Merge tags 'scmi-fixes-6.8' and '=
ffa-fixes-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holl=
a/linux into for-linux-next)
Merging sophgo/for-next (41bccc98fb79 Linux 6.8-rc2)
Merging stm32/stm32-next (bda732fda193 ARM: dts: stm32: fix DSI peripheral =
clock on stm32mp15 boards)
Merging sunxi/sunxi/for-next (38ed19495066 Merge branch 'sunxi/dt-for-6.9' =
into sunxi/for-next)
Merging tee/next (84ec4fd88831 Merge branch 'tee_iov_iter_for_v6.8' into ne=
xt)
Merging tegra/for-next (b762ac6498e6 Merge branch for-6.9/soc into for-next)
Merging ti/ti-next (bc805e337f69 Merge branch 'ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (2d81f5ef567c Merge remote-tracking branch 'git/zyn=
qmp/dt' into for-next)
Merging clk/clk-next (efe5a1b888ab Merge branch 'clk-fixes' into clk-next)
Merging clk-imx/for-next (6613476e225e Linux 6.8-rc1)
Merging clk-renesas/renesas-clk (5aaa139b9a03 clk: renesas: r8a779h0: Add I=
2C clocks)
Merging csky/linux-next (2c40c1c6adab Merge tag 'usb-6.7-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging loongarch/loongarch-next (cca5efe77a6a LoongArch: vDSO: Disable UBS=
AN instrumentation)
Merging m68k/for-next (6b9c045b0602 m68k: defconfig: Update defconfigs for =
v6.7-rc1)
Merging m68knommu/for-next (54be6c6c5ae8 Linux 6.8-rc3)
Merging microblaze/next (6613476e225e Linux 6.8-rc1)
Merging mips/mips-next (6613476e225e Linux 6.8-rc1)
Merging openrisc/for-next (c289330331eb openrisc: Remove kernel-doc marker =
from ioremap comment)
Merging parisc-hd/for-next (82b143aeb169 Revert "parisc: Only list existing=
 CPUs in cpu_possible_mask")
Merging powerpc/next (41bccc98fb79 Linux 6.8-rc2)
Merging soc-fsl/next (fb9c384625dd bus: fsl-mc: fsl-mc-allocator: Drop a wr=
ite-only variable)
Merging risc-v/for-next (cb4ede926134 riscv: Avoid code duplication with ge=
neric bitops implementation)
Merging riscv-dt/riscv-dt-for-next (5669bb5a16a0 riscv: dts: microchip: add=
 specific compatible for mpfs pdma)
Merging riscv-soc/riscv-soc-for-next (6613476e225e Linux 6.8-rc1)
Merging s390/for-next (8eb3db95a8c8 Merge branch 'features' into for-next)
Merging sh/for-next (6613476e225e Linux 6.8-rc1)
Merging uml/next (83aec96c631e um: Mark 32bit syscall helpers as clobbering=
 memory)
Merging xtensa/xtensa-for-next (a03cd7602a09 xtensa: don't produce FDPIC ou=
tput with fdpic toolchain)
Merging bcachefs/for-next (011776b8e325 time_stats: Kill TIME_STATS_HAVE_QU=
ANTILES)
$ git reset --hard HEAD^
Merging next-20240206 version of bcachefs
Merging pidfd/for-next (a901a3568fd2 Merge tag 'iomap-6.5-merge-1' of git:/=
/git.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging fscrypt/for-next (d3a7bd420076 fscrypt: clear keyring before callin=
g key_put())
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (c76800fdde78 Merge branch 'for-next-next-v6.8-20240=
206' into for-next-20240206)
Merging ceph/master (07045648c07c ceph: always check dir caps asynchronousl=
y)
Merging cifs/for-next (1e007c3c6457 cifs: Remove some code that's no longer=
 used, part 3)
Merging configfs/for-next (4425c1d9b44d configfs: improve item creation per=
formance)
Merging ecryptfs/next (a3d78fe3e1ae fs: ecryptfs: comment typo fix)
Merging erofs/dev (aa12a790d31b erofs: make erofs_{err,info}() support NULL=
 sb parameter)
Merging exfat/dev (0991abeddefa exfat: fix zero the unwritten part for dio =
read)
Merging exportfs/exportfs-next (42c3732fa807 fs: Create a generic is_dot_do=
tdot() utility)
Merging ext3/for_next (9e9a976eaa1d Pull UDF and quota fix.)
Merging ext4/dev (ec9d669eba4c ext4: make ext4_set_iomap() recognize IOMAP_=
DELALLOC map type)
Merging f2fs/dev (21ec68234826 f2fs: fix to avoid potential panic during re=
covery)
Merging fsverity/for-next (8e43fb06e10d fsverity: remove hash page spin loc=
k)
Merging fuse/for-next (3f29f1c336c0 fuse: disable FOPEN_PARALLEL_DIRECT_WRI=
TES with FUSE_DIRECT_IO_ALLOW_MMAP)
Merging gfs2/for-next (6b89b6af459f Merge tag 'gfs2-v6.8-rc2-revert' of git=
://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2)
Merging jfs/jfs-next (e42e29cc4423 Revert "jfs: fix shift-out-of-bounds in =
dbJoin")
Merging ksmbd/ksmbd-for-next (54be6c6c5ae8 Linux 6.8-rc3)
Merging nfs/linux-next (052d534373b7 Merge tag 'exfat-for-6.8-rc1' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat)
Merging nfs-anna/linux-next (57331a59ac0d NFSv4.1: Use the nfs_client's rpc=
 timeouts for backchannel)
Merging nfsd/nfsd-next (d89b6563e116 svcrdma: Add Write chunk WRs to the RP=
C's Send WR chain)
Merging ntfs3/master (622cd3daa8ea fs/ntfs3: Slightly simplify ntfs_inode_p=
rintk())
Merging orangefs/for-next (31720a2b109b orangefs: Fix kmemleak in orangefs_=
{kernel,client}_debug_init())
Merging overlayfs/overlayfs-next (d17bb4620f90 overlayfs.rst: fix ReST form=
atting)
Merging ubifs/next (adbf4c4954e3 ubi: block: fix memleak in ubiblock_create=
())
Merging v9fs/9p-next (ff49bf186757 net: 9p: avoid freeing uninit memory in =
p9pdu_vreadf)
Merging v9fs-ericvh/ericvh/for-next (be57855f5050 fs/9p: fix dups even in u=
ncached mode)
Merging xfs/for-next (881f78f47255 xfs: remove conditional building of rt g=
eometry validator functions)
Merging zonefs/for-next (8812387d0569 zonefs: set FMODE_CAN_ODIRECT instead=
 of a dummy direct_IO method)
Merging iomap/iomap-for-next (3ac974796e5d iomap: fix short copy in iomap_w=
rite_iter())
Merging djw-vfs/vfs-for-next (ce85a1e04645 xfs: stabilize fs summary counte=
rs for online fsck)
Merging file-locks/locks-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6-=
mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging iversion/iversion-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6=
-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging vfs-brauner/vfs.all (22ab450a1856 Merge branch 'vfs.super' into vfs=
.all)
CONFLICT (content): Merge conflict in fs/nfsd/nfs4layouts.c
CONFLICT (content): Merge conflict in fs/smb/client/file.c
Merging vfs/for-next (052d534373b7 Merge tag 'exfat-for-6.8-rc1' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat)
Merging printk/for-next (e7081d5a9d97 Merge branch 'rework/console-flushing=
-fixes' into for-next)
Merging pci/next (36c5585292fe Merge branch 'pci/endpoint')
Merging pstore/for-next/pstore (69f381e67d6f pstore/zone: Add a null pointe=
r check to the psz_kmsg_read)
Merging hid/for-next (b582e8c3ccc7 Merge branch 'for-6.8/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (957bd221ac7b Merge tag 'i2c-host-fixes-6.8-rc3' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/f=
or-current)
Merging i2c-host/i2c/i2c-host (4b5cb5c1a346 dt-bindings: i2c: renesas,rcar-=
i2c: Add r8a779h0 support)
Merging i3c/i3c/next (4fa0888f6f3e i3c: document hotjoin sysfs entry)
Merging hwmon-staging/hwmon-next (186ba25a7a11 hwmon: chipcap2: fix return =
path in cc2_request_alarm_irqs())
Merging jc_docs/docs-next (f9197538d71a Documentation: admin-guide: tainted=
-kernels.rst: Add missing article and comma)
Merging v4l-dvb/master (feb8831be9d4 media: ov08x40: Reduce start streaming=
 time)
  592bb51d048c ("media: atomisp: Adjust for v4l2_subdev_state handling chan=
ges in 6.8")
CONFLICT (content): Merge conflict in drivers/staging/media/atomisp/pci/ato=
misp_cmd.c
Merging v4l-dvb-next/master (8c64f4cdf4e6 media: edia: dvbdev: fix a use-af=
ter-free)
Merging pm/linux-next (da60429b5e6b Merge branch 'acpi-video' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (eaffb10b51bf cpufreq: mediatek-=
hw: Don't error out if supply is not found)
Merging cpupower/cpupower (0086ffec768b tools cpupower bench: Override CFLA=
GS assignments)
Merging devfreq/devfreq-next (aed5ed595960 PM / devfreq: Synchronize devfre=
q_monitor_[start/stop])
Merging pmdomain/next (d99abefade74 media: venus: Convert to dev_pm_domain_=
attach|detach_list() for vcodec)
Merging opp/opp/linux-next (ace4b31b297d cpufreq: Move dev_pm_opp_{init|fre=
e}_cpufreq_table() to pm_opp.h)
Merging thermal/thermal/linux-next (5314b1543787 thermal/drivers/exynos: Us=
e set_trips ops)
Merging dlm/next (5beebc1dda47 dlm: update format header reflect current fo=
rmat)
Merging rdma/for-next (aafe4cc50969 RDMA/rxe: Remove unused 'iova' paramete=
r from rxe_mr_init_user)
Merging net-next/main (9736c648370d dpll: check that pin is registered in _=
_dpll_pin_unregister())
Merging bpf-next/for-next (92a871ab9fa5 libbpf: Use OPTS_SET() macro in bpf=
_xdp_query())
Merging ipsec-next/master (ab1e1a38de24 xfrm6_tunnel: Use KMEM_CACHE instea=
d of kmem_cache_create)
Merging mlx5-next/mlx5-next (d727d27db536 RDMA/mlx5: Expose register c0 for=
 RDMA device)
Merging netfilter-next/main (5264ab612e28 selftests/net: calibrate txtimest=
amp)
Merging ipvs-next/main (5264ab612e28 selftests/net: calibrate txtimestamp)
Merging bluetooth/master (854c513be130 Bluetooth: hci_event: Remove code to=
 removed CONFIG_BT_HS)
Merging wireless-next/for-next (94dd7ce1885e wifi: rtl8xxxu: update rate ma=
sk per sta)
Merging wpan-next/master (2373699560a7 mac802154: Avoid new associations wh=
ile disassociating)
Merging wpan-staging/staging (2373699560a7 mac802154: Avoid new association=
s while disassociating)
Merging mtd/mtd/next (18af7e357033 mtd: flashchip: explicitly include <linu=
x/wait.h>)
Merging nand/nand/next (4bd14b2fd8a8 mtd: spinand: esmt: Extend IDs to 5 by=
tes)
Merging spi-nor/spi-nor/next (3c0e1dfa703c MAINTAINERS: change my mail to t=
he kernel.org one)
Merging crypto/master (9a14b311f2f7 crypto: ahash - unexport crypto_hash_al=
g_has_setkey())
Merging drm/drm-next (f8e4806e0dfa Merge tag 'drm-misc-next-2024-01-11' of =
git://anongit.freedesktop.org/drm/drm-misc into drm-next)
Merging drm-ci/topic/drm-ci (ad6bfe1b66a5 drm: ci: docs: fix build warning =
- add missing escape)
Merging drm-exynos/for-linux-next (f8e4806e0dfa Merge tag 'drm-misc-next-20=
24-01-11' of git://anongit.freedesktop.org/drm/drm-misc into drm-next)
Merging drm-misc/for-linux-next (ef8d8df3cb06 drm: xlnx: zynqmp_dpsub: Filt=
er interrupts against mask)
Applying: drm/ttm: initialise places
Merging amdgpu/drm-next (d5597444032b drm/amdgpu: Fix HDP flush for VFs on =
nbio v7.9)
  fb38ad0aab41 ("drm/amdgpu/pm: Use inline function for IP version check")
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dc.h
Merging drm-intel/for-linux-next (449c2d5948ba drm/i915/alpm: Alpm aux wake=
 configuration for lnl)
Merging drm-tegra/for-next (2429b3c529da drm/tegra: Avoid potential 32-bit =
integer overflow)
Merging drm-msm/msm-next (8d35217149da drm/msm/mdss: specify cfg bandwidth =
for SDM670)
Merging drm-msm-lumag/msm-next-lumag (d4ca26ac4be0 drm/msm/dp: call dp_disp=
lay_get_next_bridge() during probe)
Merging etnaviv/etnaviv/next (c9959996a8fc drm/etnaviv: add sensitive state=
 for PE_RT_ADDR_4_PIPE(3, 0|1) address)
Merging fbdev/for-next (72fee6b0a3a4 fbdev: Restrict FB_SH_MOBILE_LCDC to S=
uperH)
Merging regmap/for-next (7289fa4dffc2 Merge remote-tracking branch 'regmap/=
for-6.9' into regmap-next)
Merging sound/for-next (498e963ec7f0 ALSA: hda/realtek: Remove two HP Lapto=
ps using CS35L41)
Merging ieee1394/for-next (8dff232f6b2d firewire: core: fix build failure d=
ue to the caller of fw_csr_string())
Merging sound-asoc/for-next (0c82cc048450 Merge remote-tracking branch 'aso=
c/for-6.9' into asoc-next)
Merging modules/modules-next (157285397f6a lib/test_kmod: fix kernel-doc wa=
rnings)
Merging input/next (d03f030115fe Input: gameport - make gameport_bus const)
Merging block/for-next (5bf46578103b Merge branch 'io_uring-napi' into for-=
next)
CONFLICT (content): Merge conflict in block/blk.h
Merging device-mapper/for-next (8d3b230c00e0 dm vdo logger: update logging =
to start with "device-mapper: vdo")
Merging libata/for-next (7f7f2b7624d4 dt-bindings: ata: atmel: remove at91 =
compact flash documentation)
Merging pcmcia/pcmcia-next (4f733de8b78a pcmcia: tcic: remove unneeded "&" =
in call to setup_timer())
Merging mmc/next (40d83f40c44b mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (1e0ea9e75ff3 mfd: wm831x: Remove redundant foreve=
r while loop)
Merging backlight/for-backlight-next (3b75d271e161 backlight: hx8357: Fix p=
otential NULL pointer dereference)
Merging battery/for-next (aa08a0d10f5e power: supply: axp20x_usb_power: ena=
ble usb_type reporting)
Merging regulator/for-next (3240695334aa Merge remote-tracking branch 'regu=
lator/for-6.9' into regulator-next)
Merging security/next (54be6c6c5ae8 Linux 6.8-rc3)
Merging apparmor/apparmor-next (8ead196be219 apparmor: Fix memory leak in u=
npack_profile())
Merging integrity/next-integrity (1ed4b5631002 Revert "KEYS: encrypted: Add=
 check for strsep")
Merging selinux/next (7c655bee5cd8 selinux: only filter copy-up xattrs foll=
owing initialization)
Merging smack/next (f0816d4332c3 ramfs: Initialize security of in-memory in=
odes)
Merging tomoyo/master (0bb80ecc33a8 Linux 6.6-rc1)
Merging tpmdd/next (cebb9ce9b939 tpm/tpm_ftpm_tee: fix all kernel-doc warni=
ngs)
Merging watchdog/master (41bccc98fb79 Linux 6.8-rc2)
Merging iommu/next (d2d00e15808c powerpc: iommu: Bring back table group rel=
ease_ownership() call)
Merging audit/next (aa13b709084a audit: use KMEM_CACHE() instead of kmem_ca=
che_create())
Merging devicetree/for-next (574849054d97 of: property: use unsigned int re=
turn on of_graph_get_endpoint_count())
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/tri=
vial-devices.yaml
Merging dt-krzk/for-next (8c82b4eef297 ARM: dts: sti: minor whitespace clea=
nup around '=3D')
Merging mailbox/for-next (cd795fb0c352 mailbox: mtk-cmdq: Add CMDQ driver s=
upport for mt8188)
Merging spi/for-next (a38b305cf404 Merge remote-tracking branch 'spi/for-6.=
9' into spi-next)
Merging tip/master (93e1e1fe2f97 Merge branch into tip/master: 'x86/mm')
CONFLICT (content): Merge conflict in arch/x86/include/asm/coco.h
Merging clockevents/timers/drivers/next (0076a37a426b dt-bindings: timer: r=
enesas,tmu: Document input capture interrupt)
Merging edac/edac-for-next (2f412b51fb42 Merge ras/edac-amd-atl into for-ne=
xt)
Merging ftrace/for-next (4af12c95cbe8 Merge probes/for-next)
Merging rcu/rcu/next (895fbfa1f53b tsc: Check for sockets instead of CPUs t=
o make code match comment)
Merging kvm/next (e45964771007 x86/coco: Define cc_vendor without CONFIG_AR=
CH_HAS_CC_PLATFORM)
Merging kvm-arm/next (93c28484d2a0 Merge branch kvm-arm64/kerneldoc into kv=
marm/next)
Merging kvms390/next (10f7b1dcdfe0 KVM: s390: cpu model: Use proper define =
for facility mask size)
Merging kvm-ppc/topic/ppc-kvm (41bccc98fb79 Linux 6.8-rc2)
Merging kvm-riscv/riscv_kvm_next (4d0e8f9a361b KVM: riscv: selftests: Add Z=
fa extension to get-reg-list test)
Merging kvm-x86/next (873eef46b33c Merge branches 'asyncpf', 'asyncpf_abi',=
 'fixes', 'generic', 'misc', 'mmu', 'pmu', 'selftests' and 'svm')
CONFLICT (content): Merge conflict in arch/x86/kvm/svm/sev.c
Merging xen-tip/linux-next (2d2db7d40254 xen/gntdev: Fix the abuse of under=
lying struct page in DMA-buf import)
Merging percpu/for-next (2d9ad81ef935 Merge branch 'for-6.8-fixes' into for=
-next)
Merging workqueues/for-next (40911d4457f2 Merge branch 'for-6.8-fixes' into=
 for-6.9)
Merging drivers-x86/for-next (197b980644ea platform/surface: aggregator_reg=
istry: add entry for fan speed)
CONFLICT (content): Merge conflict in drivers/platform/x86/wmi.c
Merging chrome-platform/for-next (6613476e225e Linux 6.8-rc1)
Merging chrome-platform-firmware/for-firmware-next (e3c5df138169 firmware: =
coreboot: make coreboot_bus_type const)
Merging hsi/for-next (a0e35a173a86 hsi: hsi_core: make hsi_bus_type const)
Merging leds-lj/for-leds-next (54602f38551e leds: Make flash and multicolor=
 dependencies unconditional)
Merging ipmi/for-next (296455ade1fd Merge tag 'char-misc-6.8-rc1' of git://=
git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc)
Merging driver-core/driver-core-next (f297a3844aa0 driver core: component: =
fix spellos)
Merging usb/usb-next (ed5551279c91 Merge 6.8-rc3 into usb-next)
Merging thunderbolt/next (dec6a613574c thunderbolt: Remove usage of the dep=
recated ida_simple_xx() API)
Merging usb-serial/usb-next (54be6c6c5ae8 Linux 6.8-rc3)
Merging tty/tty-next (6cc3028f797a tty: vt: decrypt magic constants in vc_i=
s_control())
Merging char-misc/char-misc-next (e21817acb23e Merge 6.8-rc3 into char-misc=
-next)
Merging accel/habanalabs-next (dddb2e526a36 accel/habanalabs: use kcalloc()=
 instead of kzalloc())
Merging coresight/next (41bccc98fb79 Linux 6.8-rc2)
Merging fastrpc/for-next (6613476e225e Linux 6.8-rc1)
Merging fpga/for-next (ff49b00e9621 fpga: dfl: make dfl_bus_type const)
Merging icc/icc-next (8b6da6178c6a Merge branch 'icc-fixes' into icc-next)
Merging iio/togreg (a0295c1bd4a7 iio: frequency: admfm2000: New driver)
Merging phy-next/next (bc25f0b57133 phy: ti: gmii-sel: add resume support)
CONFLICT (content): Merge conflict in drivers/phy/qualcomm/phy-qcom-qmp-usb=
.c
Merging soundwire/next (9282cfa2eb08 soundwire: intel_auxdevice: remove red=
undant assignment to variable link_flags)
Merging extcon/extcon-next (7803680964c0 extcon: qcom-spmi-misc: don't use =
kernel-doc marker for comment)
Merging gnss/gnss-next (54be6c6c5ae8 Linux 6.8-rc3)
Merging vfio/next (78f70c02bdbc vfio/virtio: fix virtio-pci dependency)
Merging w1/for-next (8650843ca42a w1: make w1_bus_type const)
Merging spmi/spmi-next (b85ea95d0864 Linux 6.7-rc1)
Merging staging/staging-next (ce54e9342124 staging: Remove board staging co=
de)
Merging counter-next/counter-next (0b3bbd8f9baf counter: linux/counter.h: f=
ix Excess kernel-doc description warning)
Merging mux/for-next (44c026a73be8 Linux 6.4-rc3)
Merging dmaengine/next (de7d9cb3b064 dmaengine: fsl-edma: integrate TCD64 s=
upport for i.MX95)
Merging cgroup/for-next (8d4c171f451d docs: cgroup-v1: add missing code-blo=
ck tags)
Merging scsi/for-next (59828c7b5975 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (4ad946536537 scsi: target: tcm_loop: Make tcm_lo=
op_lld_bus const)
Merging vhost/linux-next (f16d65124380 vdpa/mlx5: Add mkey leak detection)
Merging rpmsg/for-next (929654e8f1ad Merge branches 'rpmsg-next' and 'rproc=
-next' into for-next)
CONFLICT (content): Merge conflict in drivers/remoteproc/imx_dsp_rproc.c
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (a875746f603b gpio: gpiolib: make gpio_bus_=
type const)
CONFLICT (content): Merge conflict in Documentation/userspace-api/index.rst
Merging gpio-intel/for-next (6613476e225e Linux 6.8-rc1)
Merging pinctrl/for-next (ee7a19a4782d Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (6613476e225e Linux 6.8-rc1)
Merging pinctrl-renesas/renesas-pinctrl (fea58424e252 pinctrl: renesas: pin=
ctrl-rzg2l: Add the missing port pins P19 to P28)
Merging pinctrl-samsung/for-next (6613476e225e Linux 6.8-rc1)
Merging pwm/pwm/for-next (ab105bfee277 pwm: bcm2835: Drop write-only member=
 of driver private data)
Merging ktest/for-next (7dc8e24f0e09 ktest: Restore stty setting at first i=
n dodie)
Merging kselftest/next (6a71770442b5 selftests: livepatch: Test livepatchin=
g a heavily called syscall)
Merging kunit/test (6613476e225e Linux 6.8-rc1)
Merging kunit-next/kunit (76021a887a50 kunit: Mark filter* params as rw)
Merging livepatching/for-next (602bf1830798 Merge branch 'for-6.7' into for=
-next)
Merging rtc/rtc-next (14688f1a91e1 rtc: nuvoton: Compatible with NCT3015Y-R=
 and NCT3018Y-R)
Merging nvdimm/libnvdimm-for-next (a085a5eb6594 acpi/nfit: Use sysfs_emit()=
 for all attributes)
Merging at24/at24/for-next (6613476e225e Linux 6.8-rc1)
Merging ntb/ntb-next (9341b37ec17a ntb_perf: Fix printk format)
Merging seccomp/for-next/seccomp (55e68669b131 selftests/seccomp: Pin bench=
mark to single CPU)
Merging fsi/next (c5eeb63edac9 fsi: Fix panic on scom file read)
Merging slimbus/for-next (04b945e4cf81 slimbus: qcom-ngd-ctrl: Make QMI mes=
sage rules const)
Merging nvmem/for-next (a0cfd5e99782 dt-bindings: nvmem: Convert xlnx,zynqm=
p-nvmem.txt to yaml)
Merging xarray/main (2a15de80dd0f idr: fix param name in idr_alloc_cyclic()=
 doc)
Merging hyperv/hyperv-next (ce9ecca0238b Linux 6.6-rc2)
Merging auxdisplay/auxdisplay (c52391fafcef auxdisplay: img-ascii-lcd: Use =
device_get_match_data())
Merging kgdb/kgdb/for-next (4f41d30cd6dc kdb: Fix a potential buffer overfl=
ow in kdb_local())
Merging hmm/hmm (6613476e225e Linux 6.8-rc1)
Merging cfi/cfi/next (06c2afb862f9 Linux 6.5-rc1)
Merging mhi/mhi-next (ceeb64f41fe6 bus: mhi: host: Add tracing support)
Merging memblock/for-next (2159bd4e9057 memblock: Return NUMA_NO_NODE inste=
ad of -1 to improve code readability)
Merging cxl/next (73bf93edeeea cxl/core: use sysfs_emit() for attr's _show(=
))
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (4afa688d7141 efi: memmap: fix kernel-doc warnings)
Merging unicode/for-next (367122c529f3 libfs: Attempt exact-match compariso=
n first during casefolded lookup)
Merging slab/slab/for-next (7d2ec24bd8a5 Merge branch 'slab/for-6.9/optimiz=
e-get-freelist' into slab/for-next)
Merging random/master (615d30064886 Merge tag 'trace-v6.8-rc1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace)
Merging landlock/next (305aea29fd67 landlock: Document IOCTL support)
Merging rust/rust-next (f090f0d0eea9 rust: sync: update integer types in Co=
ndVar)
CONFLICT (content): Merge conflict in Documentation/process/changes.rst
Merging sysctl/sysctl-next (6613476e225e Linux 6.8-rc1)
Merging execve/for-next/execve (15fd1dc3dadb fs: binfmt_elf_efpic: don't us=
e missing interpreter's properties)
Merging bitmap/bitmap-for-next (071ad962baf5 bitmap: Step down as a reviewe=
r)
CONFLICT (content): Merge conflict in drivers/tty/serial/sc16is7xx.c
Merging hte/for-next (b85ea95d0864 Linux 6.7-rc1)
Merging kspp/for-next/kspp (a0e452100f6c overflow: Introduce wrapping_inc()=
 and wrapping_dec())
Merging kspp-gustavo/for-next/kspp (6613476e225e Linux 6.8-rc1)
Merging nolibc/nolibc (6613476e225e Linux 6.8-rc1)
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (6613476e225e Linux 6.8-rc1)
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)
Applying: Revert "ACPI: video: Handle fetching EDID that is longer than 256=
 bytes"

--Sig_/x04Yv3SZY0hcu8u8p/07OMd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmXEUMIACgkQAVBC80lX
0Gy9Wgf/dqnQgmemie0S506alRn9doSZ1o9UYByGQJ9B1RABmx4UkILJIq3VeCal
wKxcz7BJ3Iz8A977V4+FLcWr2+oEw3kcUBTLlDecXT4Fxv73Ld6xq2hEQ3GTdB3I
1R+r96dVVGvFmfFF0nZH3AvqZ9WQKCV4VUKQaB4Y35IblrVqpJ7pACqam4gpfVit
Gn4IcUt6xR5ZVH51dYaNZ2izkXiXCWgVdblSQANSsbtDw8wAxNW+4mx7G59gMpJ6
KsC23YERhSmKiBy++eLOsGEbHUXpXjip8kkmM67S76Qyxwh3+RVWNUzFVSeBLQTf
ZEi3aQnIguidF2a1wk5DX27N+pVmvw==
=WCx3
-----END PGP SIGNATURE-----

--Sig_/x04Yv3SZY0hcu8u8p/07OMd--

