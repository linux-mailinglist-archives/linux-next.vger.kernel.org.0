Return-Path: <linux-next+bounces-1958-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC7E8A7BEA
	for <lists+linux-next@lfdr.de>; Wed, 17 Apr 2024 07:38:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A57A1F21549
	for <lists+linux-next@lfdr.de>; Wed, 17 Apr 2024 05:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7C8A4C3CD;
	Wed, 17 Apr 2024 05:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Sh+4mrna"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC1B2AF0A;
	Wed, 17 Apr 2024 05:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713332301; cv=none; b=JDh5usJBpaxbOsh7S1dcw5jtXI7WSwSYru88F3GEWe6NjW8FYY952DCyOrGMyLpxiSNOSpOYY3aDKERAxqr3Qu+w84WkCM/063nulQoZPJcHsHR1BYTHKMna1+C1FGsQbSLmk94K5wXOlQzgzRpig8MtTNDhgPxoFy22VuC12fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713332301; c=relaxed/simple;
	bh=y/piBzIFYzZ7xEBCHC3QT6GWoUlnt0M87yRKxFOlgic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JYuUdRkFP0tTUqr326bYjBmSSXugjF9WrJHPlPXlN1qk7hm+6Oo9btik2Hi1z+Ucy1RXVlfe/8i0p7oV5LvsOA3kohjKMSnwqilRSKzW/W/pp52Y6fmRI3yOBjAITNXPSXZpHZA9QbPpYV9lbJntv3XTE919XzC7EFyw9jKnKwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Sh+4mrna; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1713332296;
	bh=yr7HSHyFwO1uMx+5fftqA7LbzNX6WtsjcDryUeD7oPM=;
	h=Date:From:To:Cc:Subject:From;
	b=Sh+4mrna4lgslnFnpk67wuiLVr6wk0JNPnUT3XxEEckJaAAVRfQ6Yv9+wgn9udrTq
	 vgQeV7ortnAcFm0HocSW3ZCgmXtpEnsCcIXsNec6qNKJKYNFb002AJVmu9nroo1cpj
	 I2MvRTQaHjUcMmW54Iag+r7bohXJWkPT4XJyVWsiqhiqxQMfHBQU45NlCXV+q9N/7L
	 ICxrWAIuWQtuWuwAPmzF/msz1VaZ+5ZLJJsnrN3kXxOpM4blE6ZFMiLAFvxIdcDOrO
	 M5UGJM0BDA+WuFnCRBwIpGdL+5YFE6T/YxyBbwyzB0To2knEEnhDcbcrt6ptGzAZUd
	 SFz1ZEQJz09dA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VK8p003Nzz4wyf;
	Wed, 17 Apr 2024 15:38:15 +1000 (AEST)
Date: Wed, 17 Apr 2024 15:38:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 17
Message-ID: <20240417153815.49f2eebb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HMWcv20Uh0Q8+SHrvXJu4XB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HMWcv20Uh0Q8+SHrvXJu4XB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20240416:

The perf tree still had its build failure, but doing a clean then
rebuilding works.

The block tree gained conflicts against the vfs-brauner, vfs trees.

The iommu tree gained a conflict against the mm tree.

The devicetree tree gained a conflict against Linus' tree.

Non-merge commits (relative to Linus' tree): 5938
 6194 files changed, 240287 insertions(+), 150880 deletions(-)

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

I am currently merging 370 trees (counting Linus' and 103 trees of bug
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
Merging origin/master (96fca68c4fbf Merge tag 'nfsd-6.9-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/cel/linux)
Merging fixes/fixes (2dde18cd1d8f Linux 6.5)
Merging mm-hotfixes/mm-hotfixes-unstable (2db870d5c1d8 selftests: mm: fix u=
nused and uninitialized variable warning)
Merging kbuild-current/fixes (89e5462bb5ae kconfig: Fix typo HEIGTH to HEIG=
HT)
Merging arc-current/for-curr (ebfc2fd8873b ARC: Fix typos)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (015a12a4a670 arm64/hugetlb: Fix page ta=
ble walk in huge_pte_alloc())
Merging arm-soc-fixes/arm/fixes (011d79ef1cfa MAINTAINERS: Change Krzysztof=
 Kozlowski's email address)
Merging davinci-current/davinci/for-current (6613476e225e Linux 6.8-rc1)
Merging drivers-memory-fixes/fixes (4cece7649650 Linux 6.9-rc1)
Merging sophgo-fixes/fixes (4cece7649650 Linux 6.9-rc1)
Merging m68k-current/for-linus (e8a7824856de m68k: defconfig: Update defcon=
figs for v6.8-rc1)
Merging powerpc-fixes/fixes (210cfef57926 selftests/powerpc/papr-vpd: Fix m=
issing variable initialization)
Merging s390-fixes/fixes (6f76592ef63a s390/cio: log fake IRB events)
Merging fscrypt-current/for-current (4cece7649650 Linux 6.9-rc1)
Merging fsverity-current/for-current (4cece7649650 Linux 6.9-rc1)
Merging net/main (e226eade8f50 Merge branch 'net-stmmac-fix-mac-capabilitie=
s-procedure')
Merging bpf/master (10541b374aa0 riscv, bpf: Fix incorrect runtime stats)
Merging ipsec/master (bccb798e07f8 octeontx2-pf: Fix transmit scheduler res=
ource leak)
Merging netfilter/main (6db5dc7b351b netfilter: flowtable: incorrect pppoe =
tuple)
Merging ipvs/main (7eaf837a4eb5 netfilter: nf_tables: Fix a memory leak in =
nf_tables_updchain)
Merging wireless/for-next (feafe59c8975 wifi: ath11k: use RCU when accessin=
g struct inet6_dev::ac_list)
Merging wpan/master (b85ea95d0864 Linux 6.7-rc1)
Merging rdma-fixes/for-rc (b68e1acb5834 RDMA/cm: Print the old state when c=
m_destroy_id gets timeout)
Merging sound-current/for-linus (0b6f0ff01a4a ALSA: hda/tas2781: correct th=
e register for pow calibrated data)
Merging sound-asoc-fixes/for-linus (cebfbc89ae25 ASoC: rt715: add vendor cl=
ear control register)
Merging regmap-fixes/for-linus (fec50db7033e Linux 6.9-rc3)
Merging regulator-fixes/for-linus (68adb581a39a regulator: vqmmc-ipq4019: f=
ix module autoloading)
Merging spi-fixes/for-linus (0064db9ce4aa spi: axi-spi-engine: fix version =
format string)
Merging pci-current/for-linus (4cece7649650 Linux 6.9-rc1)
Merging driver-core.current/driver-core-linus (156539fd6501 Documentation: =
embargoed-hardware-issues.rst: Add myself for Power)
Merging tty.current/tty-linus (1aa4ad4eb695 serial: core: Fix missing shutd=
own and startup for serial base port)
Merging usb.current/usb-linus (c281d18dda40 Merge tag 'thunderbolt-for-v6.9=
-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt =
into usb-linus)
Merging usb-serial-fixes/usb-linus (c840244aba7a USB: serial: option: suppo=
rt Quectel EM060K sub-models)
Merging phy/fixes (bf6e4ee5c436 phy: ti: tusb1210: Resolve charger-det cras=
h if charger psy is unregistered)
Merging staging.current/staging-linus (39cd87c4eb2b Linux 6.9-rc2)
Merging iio-fixes/fixes-togreg (74a72baf204f iio:imu: adis16475: Fix sync m=
ode setting)
Merging counter-current/counter-current (39cd87c4eb2b Linux 6.9-rc2)
Merging char-misc.current/char-misc-linus (ebaed6d4def8 peci: linux/peci.h:=
 fix Excess kernel-doc description warning)
Merging soundwire-fixes/fixes (63dc588e7af1 soundwire: amd: fix for wake in=
terrupt handling for clockstop mode)
Merging thunderbolt-fixes/fixes (dcd12acaf384 thunderbolt: Avoid notify PM =
core about runtime PM resume)
Merging input-current/for-linus (57ed9567e63b Merge branch 'next' into for-=
linus)
Merging crypto-current/master (5a7e89d3315d crypto: iaa - Fix nr_cpus < nr_=
iaa case)
Merging vfio-fixes/for-linus (4ea95c04fa6b vfio: Drop vfio_file_iommu_group=
() stub to fudge around a KVM wart)
Merging kselftest-fixes/fixes (72d7cb5c190b selftests/harness: Prevent infi=
nite loop due to Assert in FIXTURE_TEARDOWN)
Merging dmaengine-fixes/fixes (f221033f5c24 dmaengine: idxd: Fix oops durin=
g rmmod on single-CPU platforms)
Merging backlight-fixes/for-backlight-fixes (6613476e225e Linux 6.8-rc1)
Merging mtd-fixes/mtd/fixes (d2d73a6dd173 mtd: limit OTP NVMEM cell parse t=
o non-NAND devices)
Merging mfd-fixes/for-mfd-fixes (6613476e225e Linux 6.8-rc1)
Merging v4l-dvb-fixes/fixes (d353c3c34af0 media: mediatek: vcodec: support =
36 bits physical address)
Merging reset-fixes/reset/fixes (4a6756f56bcf reset: Fix crash when freeing=
 non-existent optional resets)
Merging mips-fixes/mips-fixes (0bbac3facb5d Linux 6.9-rc4)
Merging at91-fixes/at91-fixes (4cece7649650 Linux 6.9-rc1)
Merging omap-fixes/fixes (9b6a51aab5f5 ARM: dts: Fix occasional boot hang f=
or am3 usb)
Merging kvm-fixes/master (1c3bed800669 Merge tag 'kvm-x86-fixes-6.9-rcN' of=
 https://github.com/kvm-x86/linux into HEAD)
Merging kvms390-fixes/master (83303a4c776c KVM: s390: fix cc for successful=
 PQAP)
Merging hwmon-fixes/hwmon (4cece7649650 Linux 6.9-rc1)
Merging nvdimm-fixes/libnvdimm-fixes (33908660e814 ACPI: NFIT: Fix incorrec=
t calculation of idt size)
Merging cxl-fixes/fixes (7bcf809b1e78 cxl: Add checks to access_coordinate =
calculation to fail missing data)
Merging btrfs-fixes/next-fixes (9d6283f337cb Merge branch 'misc-6.9' into n=
ext-fixes)
Merging vfs-fixes/fixes (aa23317d0268 qibfs: fix dentry leak)
Merging dma-mapping-fixes/for-linus (d5090484b021 swiotlb: do not try to al=
locate a TLB bigger than MAX_ORDER pages)
Merging drivers-x86-fixes/fixes (e71c84816925 platform/x86: lg-laptop: fix =
%s null argument warning)
Merging samsung-krzk-fixes/fixes (4cece7649650 Linux 6.9-rc1)
Merging pinctrl-samsung-fixes/fixes (4cece7649650 Linux 6.9-rc1)
Merging devicetree-fixes/dt/linus (dab6bc78e981 of: module: add buffer over=
flow check in of_modalias())
Merging dt-krzk-fixes/fixes (4cece7649650 Linux 6.9-rc1)
Merging scsi-fixes/fixes (ca91259b775f scsi: core: Fix handling of SCMD_FAI=
L_IF_RECOVERING)
Merging drm-fixes/drm-fixes (0bbac3facb5d Linux 6.9-rc4)
Merging drm-intel-fixes/for-linux-next-fixes (0bbac3facb5d Linux 6.9-rc4)
Merging mmc-fixes/fixes (ace323f80b9b mmc: sdhci-of-dwcmshc: th1520: Increa=
se tuning loop count to 128)
Merging rtc-fixes/rtc-fixes (4cece7649650 Linux 6.9-rc1)
Merging gnss-fixes/gnss-linus (0bbac3facb5d Linux 6.9-rc4)
Merging hyperv-fixes/hyperv-fixes (30d18df6567b Drivers: hv: vmbus: Don't f=
ree ring buffers that couldn't be re-encrypted)
Merging soc-fsl-fixes/fix (06c2afb862f9 Linux 6.5-rc1)
Merging risc-v-fixes/fixes (a373a36fb6b0 Merge patch the fixes from "riscv:=
 64-bit NOMMU fixes and enhancements")
Merging riscv-dt-fixes/riscv-dt-fixes (e0503d47e93d riscv: dts: starfive: v=
isionfive 2: Remove non-existing I2S hardware)
Merging riscv-soc-fixes/riscv-soc-fixes (6b0856ee585d cache: sifive_ccache:=
 Silence unused variable warning)
Merging fpga-fixes/fixes (4cece7649650 Linux 6.9-rc1)
Merging spdx/spdx-linus (4cece7649650 Linux 6.9-rc1)
Merging gpio-brgl-fixes/gpio/for-current (11baa36d3173 gpio: lpc32xx: fix m=
odule autoloading)
Merging gpio-intel-fixes/fixes (7d045025a24b gpio: tangier: Use correct typ=
e for the IRQ chip data)
Merging pinctrl-intel-fixes/fixes (5d10a157ebe0 pinctrl: baytrail: Add pinc=
onf group for uart3)
Merging auxdisplay-fixes/fixes (4cece7649650 Linux 6.9-rc1)
Merging erofs-fixes/fixes (7557d296ad43 MAINTAINERS: erofs: add myself as r=
eviewer)
Merging kunit-fixes/kunit-fixes (cfedfb24c9dd kunit: configs: Enable CONFIG=
_DAMON_DBGFS_DEPRECATED for --alltests)
Merging memblock-fixes/fixes (592447f6cb3c memblock tests: fix undefined re=
ference to `BIT')
Merging nfsd-fixes/nfsd-fixes (f488138b5267 NFSD: fix endianness issue in n=
fsd4_encode_fattr4)
Merging renesas-fixes/fixes (8c987693dc2d ARM: dts: renesas: rcar-gen2: Add=
 missing #interrupt-cells to DA9063 nodes)
Merging perf-current/perf-tools (1cebd7f74976 tools/include: Sync arm64 asm=
/cputype.h with the kernel sources)
Merging efi-fixes/urgent (decd347c2a75 x86/efistub: Reinstate soft limit fo=
r initrd loading)
Merging zstd-fixes/zstd-linus (77618db34645 zstd: Fix array-index-out-of-bo=
unds UBSAN warning)
Merging battery-fixes/fixes (1e0fb1136461 power: supply: mt6360_charger: Fi=
x of_match for usb-otg-vbus regulator)
Merging uml-fixes/fixes (73a23d771033 um: harddog: fix modular build)
Merging iommufd-fixes/for-rc (2760c51b8040 iommufd: Add config needed for i=
ommufd_fail_nth)
Merging rust-fixes/rust-fixes (8933cf4651e0 rust: make mutually exclusive w=
ith CFI_CLANG)
Merging v9fs-fixes/fixes/next (6ae7784008d9  fs/9p: mitigate inode collisio=
ns)
Merging w1-fixes/fixes (4cece7649650 Linux 6.9-rc1)
Merging pmdomain-fixes/fixes (39cd87c4eb2b Linux 6.9-rc2)
Merging overlayfs-fixes/ovl-fixes (77a28aa47687 ovl: relax WARN_ON in ovl_v=
erify_area())
Merging i2c-host-fixes/i2c/i2c-host-fixes (0bbac3facb5d Linux 6.9-rc4)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (d3e8a91a848a clk: mediatek: mt7988-infracfg: f=
ix clocks for 2nd PCIe port)
Merging drm-misc-fixes/for-linux-next-fixes (941c0bdbc176 drm/panel: novate=
k-nt36682e: don't unregister DSI device)
Merging mm-stable/mm-stable (640958fde130 Merge branch 'master' into mm-sta=
ble)
Merging mm-nonmm-stable/mm-nonmm-stable (0bbac3facb5d Linux 6.9-rc4)
Merging mm/mm-everything (962694438027 Merge branch 'mm-nonmm-unstable' int=
o mm-everything)
Merging kbuild/for-next (961664cd2955 parisc: vdso: remove unused C build r=
ule in vdso32/Makefile)
Merging clang-format/clang-format (5a205c6a9f79 clang-format: Update with v=
6.7-rc4's `for_each` macro list)
Merging perf/perf-tools-next (a5a00497b9df perf annotate-data: Handle RSP i=
f it's not the FB register)
Merging compiler-attributes/compiler-attributes (2993eb7a8d34 Compiler Attr=
ibutes: counted_by: fixup clang URL)
Merging dma-mapping/for-next (a1255ccab8ec swiotlb: do not set total_used t=
o 0 in swiotlb_create_debugfs_files())
Merging asm-generic/master (5394f1e9b687 arch: define CONFIG_PAGE_SIZE_*KB =
on all architectures)
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (5616fee8981b Merge branches 'misc' and 'fixes' into f=
or-next)
Merging arm64/for-next/core (b5d2afe8745b Merge branches 'for-next/kbuild',=
 'for-next/misc', 'for-next/mm', 'for-next/perf' and 'for-next/tlbi' into f=
or-next/core)
Merging arm-perf/for-next/perf (b782e8d07baa arm64: arm_pmuv3: Correctly ex=
tract and check the PMUVer)
Merging arm-soc/for-next (011d79ef1cfa MAINTAINERS: Change Krzysztof Kozlow=
ski's email address)
Merging amlogic/for-next (70ce74fbef7e Merge branch 'v6.10/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (ffc253263a13 Linux 6.6)
Merging aspeed/for-next (0c30853731ec ARM: dts: aspeed: x4tf: Add dts for a=
sus x4tf project)
Merging at91/at91-next (fa8e55345b64 Merge branch 'microchip-dt64' into at9=
1-next)
Merging broadcom/next (2d32c3cbc47b Merge branch 'defconfig-arm64/next' int=
o next)
Merging davinci/davinci/for-next (6613476e225e Linux 6.8-rc1)
Merging drivers-memory/for-next (bf11908757ee memory: mtk-smi: fix module a=
utoloading)
Merging imx-mxs/for-next (6cf256f63478 Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (675a217e4e7c Merge branch 'v6.9-next/soc' into f=
or-next)
Merging mvebu/for-next (058bfa0ead87 arm64: dts: marvell: cn9130-crb: drop =
unneeded "status")
Merging omap/for-next (2a1e301bf479 Merge branch 'omap-for-v6.10/dt' into f=
or-next)
Merging qcom/for-next (4bec154a3f10 Merge branches 'arm32-for-6.10', 'arm64=
-defconfig-for-6.10', 'arm64-fixes-for-6.9', 'arm64-for-6.10', 'clk-fixes-f=
or-6.9', 'clk-for-6.10', 'drivers-fixes-for-6.9' and 'drivers-for-6.10' int=
o for-next)
Merging renesas/next (f4a6540ae2c4 Merge branch 'renesas-dts-for-v6.10' int=
o renesas-next)
Merging reset/reset/next (6d89df61650d reset: ti-sci: Convert to platform r=
emove callback returning void)
Merging rockchip/for-next (02c40b260a87 Merge branch 'v6.10-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (b7b2fe24038b Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (614b5ab9f92c Merge branches 'for-next/scmi/upd=
ates' and 'for-next/ffa/updates' of git://git.kernel.org/pub/scm/linux/kern=
el/git/sudeep.holla/linux into for-linux-next)
Merging sophgo/for-next (65fcc08b4cfe riscv: dts: sophgo: cv18xx: Add i2c d=
evices)
Merging stm32/stm32-next (b12a916d30dc ARM: dts: stm32: add heartbeat led f=
or stm32mp157c-ed1)
Merging sunxi/sunxi/for-next (7152a15f8c1d Merge branch 'sunxi/dt-for-6.10'=
 into sunxi/for-next)
Merging tee/next (60757f1264a2 Merge branch 'tee_ts_for_v6.10' into next)
Merging tegra/for-next (c85c30fad06d Merge branch for-6.9/arm64/dt into for=
-next)
Merging ti/ti-next (592695bed5f8 Merge branches 'ti-drivers-soc-next', 'ti-=
k3-dts-next' and 'ti-keystone-dts-next' into ti-next)
Merging xilinx/for-next (2d81f5ef567c Merge remote-tracking branch 'git/zyn=
qmp/dt' into for-next)
Merging clk/clk-next (071d51e4acf5 Merge branch 'clk-stm' into clk-next)
Merging clk-imx/for-next (13269dc6c704 clk: imx: imx8mp: Fix SAI_MCLK_SEL d=
efinition)
Merging clk-renesas/renesas-clk (c0516eb4cf04 clk: renesas: r8a779h0: Add t=
imer clocks)
Merging csky/linux-next (2c40c1c6adab Merge tag 'usb-6.7-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging loongarch/loongarch-next (a07c772fa658 LoongArch: Include linux/siz=
es.h in addrspace.h to prevent build errors)
Merging m68k/for-next (70d830e337f9 m68k: Calculate THREAD_SIZE from THREAD=
_SIZE_ORDER)
Merging m68knommu/for-next (8e0b6631dd62 m68k: Avoid CONFIG_COLDFIRE switch=
 in uapi header)
Merging microblaze/next (6613476e225e Linux 6.8-rc1)
Merging mips/mips-next (40e20fbccfb7 MIPS: SGI-IP27: micro-optimize arch_in=
it_irq())
Merging openrisc/for-next (4dc70e1aadfa openrisc: Move FPU state out of pt_=
regs)
Merging parisc-hd/for-next (e8f897f4afef Linux 6.8)
Merging powerpc/next (8884fc918f6a powerpc: Fix fatal warnings flag for LLV=
M's integrated assembler)
Merging soc-fsl/next (fb9c384625dd bus: fsl-mc: fsl-mc-allocator: Drop a wr=
ite-only variable)
Merging risc-v/for-next (ba5ea59f768f riscv: Do not save the scratch CSR du=
ring suspend)
CONFLICT (content): Merge conflict in Documentation/rust/arch-support.rst
Merging riscv-dt/riscv-dt-for-next (5db2c4dc413e riscv: dts: add initial ca=
nmv-k230 and k230-evb dts)
CONFLICT (content): Merge conflict in arch/riscv/Makefile
Merging riscv-soc/riscv-soc-for-next (16d9122246cc Merge branch 'riscv-conf=
ig' into riscv-soc-for-next)
Merging s390/for-next (583a8db15968 Merge branch 'features' into for-next)
Merging sh/for-next (4cece7649650 Linux 6.9-rc1)
Merging sparc/for-next (84b76d05828a lib/fonts: Allow Sparc console 8x16 fo=
nt for sparc64 early boot text console)
Merging uml/next (83aec96c631e um: Mark 32bit syscall helpers as clobbering=
 memory)
Merging xtensa/xtensa-for-next (11cca8ccf2c3 tty: xtensa/iss: Use min() to =
fix Coccinelle warning)
Merging bcachefs/for-next (ad29cf999a91 bcachefs: set_btree_iter_dontneed a=
lso clears should_be_locked)
Merging pidfd/for-next (a901a3568fd2 Merge tag 'iomap-6.5-merge-1' of git:/=
/git.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging fscrypt/for-next (8c62f31eddb7 fscrypt: shrink the size of struct f=
scrypt_inode_info slightly)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (46b3498aaf76 Merge branch 'for-next-next-v6.9-20240=
416' into for-next-20240416)
Merging ceph/master (d3e046930679 MAINTAINERS: remove myself as a Reviewer =
for Ceph)
Merging cifs/for-next (0bbac3facb5d Linux 6.9-rc4)
Merging configfs/for-next (4425c1d9b44d configfs: improve item creation per=
formance)
Merging erofs/dev (b351756059e3 erofs: derive fsid from on-disk UUID for .s=
tatfs() if possible)
Merging exfat/dev (6397cc21e5c0 exfat: move extend valid_size into ->page_m=
kwrite())
Merging exportfs/exportfs-next (e8f897f4afef Linux 6.8)
Merging ext3/for_next (d010696e06d5 Merge quota error handling improvements=
 and reiserfs README fixup.)
Merging ext4/dev (0ecae5410ab5 ext4: initialize sbi->s_freeclusters_counter=
 and sbi->s_dirtyclusters_counter before use in kunit test)
Merging f2fs/dev (b2cf5a1ff236 f2fs: allow direct io of pinned files for zo=
ned storage)
Merging fsverity/for-next (8e43fb06e10d fsverity: remove hash page spin loc=
k)
Merging fuse/for-next (09492cb45100 cuse: add kernel-doc comments to cuse_p=
rocess_init_reply())
Merging gfs2/for-next (de5bd4a04417 gfs2: Remove and replace gfs2_glock_que=
ue_work)
Merging jfs/jfs-next (e42e29cc4423 Revert "jfs: fix shift-out-of-bounds in =
dbJoin")
Merging ksmbd/ksmbd-for-next (b762f0a3e8b8 ksmbd: validate request buffer s=
ize in smb2_allocate_rsp_buf())
Merging nfs/linux-next (24457f1be29f nfs: Handle error of rpc_proc_register=
() in nfs_net_init().)
Merging nfs-anna/linux-next (57331a59ac0d NFSv4.1: Use the nfs_client's rpc=
 timeouts for backchannel)
Merging nfsd/nfsd-next (2c4b6138e4de nfsd: don't create nfsv4recoverydir in=
 nfsdfs when not used.)
Merging ntfs3/master (622cd3daa8ea fs/ntfs3: Slightly simplify ntfs_inode_p=
rintk())
Merging orangefs/for-next (9bf93dcfc453 Julia Lawall reported this null poi=
nter dereference, this should fix it.)
Merging overlayfs/overlayfs-next (d17bb4620f90 overlayfs.rst: fix ReST form=
atting)
Merging ubifs/next (b8a77b9a5f9c mtd: ubi: fix NVMEM over UBI volumes on 32=
-bit systems)
Merging v9fs/9p-next (2a0505cdd8c8 9p: remove SLAB_MEM_SPREAD flag usage)
Merging v9fs-ericvh/ericvh/for-next (4cece7649650 Linux 6.9-rc1)
Merging xfs/for-next (e23d7e82b707 xfs: allow cross-linking special files w=
ithout project quota)
Merging zonefs/for-next (567e629fd296 zonefs: convert zonefs to use the new=
 mount api)
Merging iomap/iomap-for-next (3ac974796e5d iomap: fix short copy in iomap_w=
rite_iter())
Merging djw-vfs/vfs-for-next (ce85a1e04645 xfs: stabilize fs summary counte=
rs for online fsck)
Merging file-locks/locks-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6-=
mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging iversion/iversion-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6=
-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging vfs-brauner/vfs.all (7d84b5666ea7 Merge branch 'vfs.super' into vfs=
.all)
Merging vfs/for-next (7c98f7cb8fda remove call_{read,write}_iter() function=
s)
Merging printk/for-next (a2b4cab9da77 Merge branch 'for-6.10' into for-next)
Merging pci/next (6e47dcb2ca22 Merge branch 'pci/endpoint')
Merging pstore/for-next/pstore (9dd12ed95c2d pstore/blk: replace deprecated=
 strncpy with strscpy)
Merging hid/for-next (d82775b90601 Merge branch 'for-6.10/sony' into for-ne=
xt)
Merging i2c/i2c/for-next (5ceeabb0eb2e Merge tag 'i2c-host-fixes-6.9-rc3' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/f=
or-current)
Merging i2c-host/i2c/i2c-host (08944c074592 i2c: i801: Annotate apanel_addr=
 as __ro_after_init)
Merging i3c/i3c/next (8f06fb458539 i3c: Make i3c_bus_type const)
Merging dmi/dmi-for-next (cf770af5645a firmware: dmi-id: add a release call=
back function)
Merging hwmon-staging/hwmon-next (e723f6ca39fb hwmon: jc42: Remove I2C_CLAS=
S_SPD support)
Merging jc_docs/docs-next (2309181eb018 Merge branch 'docs-fixes' into docs=
-next)
Merging v4l-dvb/master (4cece7649650 Linux 6.9-rc1)
Merging v4l-dvb-next/master (71b3ed53b08d media: atomisp: Implement link_se=
tup() op for ISP subdev MC entity)
Merging pm/linux-next (13b4807b53ff Merge branch 'thermal' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (4cece7649650 Linux 6.9-rc1)
Merging cpupower/cpupower (4cece7649650 Linux 6.9-rc1)
Merging devfreq/devfreq-next (6f3c0cfe2aa5 PM / devfreq: rk3399_dmc: Conver=
t to platform remove callback returning void)
Merging pmdomain/next (02e2a4b3638c cpuidle: psci: Update init level to cor=
e_initcall())
Merging opp/opp/linux-next (4cece7649650 Linux 6.9-rc1)
Merging thermal/thermal/linux-next (1828c1c17bb2 thermal/drivers/rcar_gen3:=
 Add support for R-Car V4M)
Merging dlm/next (15fd7e55177a dlm: use rwlock for lkbidr)
Merging rdma/for-next (dfcdb38b21e4 RDMA/rxe: Return the correct errno)
Merging net-next/main (86600ea11dc1 ip6_vti: fix memleak on netns dismantle)
CONFLICT (content): Merge conflict in include/trace/events/rpcgss.h
Merging bpf-next/for-next (ad2d22b617b7 bpftool: Address minor issues in ba=
sh completion)
Merging ipsec-next/master (267e31750ae8 Merge branch 'phy-listing-link_topo=
logy-tracking')
Merging mlx5-next/mlx5-next (d727d27db536 RDMA/mlx5: Expose register c0 for=
 RDMA device)
Merging netfilter-next/main (ed1f164038b5 Merge git://git.kernel.org/pub/sc=
m/linux/kernel/git/netdev/net)
Merging ipvs-next/main (ed1f164038b5 Merge git://git.kernel.org/pub/scm/lin=
ux/kernel/git/netdev/net)
Merging bluetooth/master (00567f70051a Bluetooth: qca: fix invalid device a=
ddress check)
Merging wireless-next/for-next (f236464f1db7 wifi: wilc1000: convert list m=
anagement to RCU)
Merging wpan-next/master (9187210eee7d Merge tag 'net-next-6.9' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging wpan-staging/staging (9187210eee7d Merge tag 'net-next-6.9' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mtd/mtd/next (6277967d872e mtd: mchp23k256: drop unneeded MODULE_AL=
IAS)
Merging nand/nand/next (6819db94e1cd mtd: rawnand: hynix: fixed typo)
Merging spi-nor/spi-nor/next (4cece7649650 Linux 6.9-rc1)
Merging crypto/master (751fb2528c12 crypto: x86/aes-xts - make non-AVX impl=
ementation use new glue code)
Merging drm/drm-next (6e1f415e7129 Merge tag 'drm-misc-next-2024-04-10' of =
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next)
Merging drm-exynos/for-linux-next (6633c7d2fd31 drm/exynos: mixer: drop dri=
ver owner initialization)
Merging drm-misc/for-linux-next (5289ed190643 drm/fb_dma: Fix parameter nam=
e in htmldocs)
Merging amdgpu/drm-next (ab956ed95b8b drm/amd/display: Add a function for c=
hecking tmds mode)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/core/d=
c.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dml/dc=
n351/dcn351_fpu.c
Merging drm-intel/for-linux-next (578ff98403ce drm/i915: Allow bigjoiner fo=
r MST)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_cd=
clk.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dp=
_mst.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_ps=
r.c
Merging drm-tegra/for-next (2429b3c529da drm/tegra: Avoid potential 32-bit =
integer overflow)
Merging drm-msm/msm-next (9dc23cba0927 drm/msm/adreno: Set highest_bank_bit=
 for A619)
Merging drm-msm-lumag/msm-next-lumag (ab556156cafa drm/msm: drop A6xx heade=
r)
Merging drm-xe/drm-xe-next (67a9e86dc130 drm/xe: select X86_PLATFORM_DEVICE=
S when ACPI_WMI is selected)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_device_types.h
Merging etnaviv/etnaviv/next (b735ee173f84 drm/etnaviv: Restore some id val=
ues)
Merging fbdev/for-next (fb3b9c2d217f video: logo: Drop full path of the inp=
ut filename in generated file)
Merging regmap/for-next (991b5e2aad87 regmap: kunit: Fix an NULL vs IS_ERR(=
) check)
Merging sound/for-next (a9b16d591874 Merge branch 'topic/emu10k1-fix' into =
for-next)
Merging ieee1394/for-next (0d4149e5e9b0 firewire: ohci: use pci_irq_vector(=
) to retrieve allocated interrupt line)
Merging sound-asoc/for-next (889c8eda1ea4 Merge remote-tracking branch 'aso=
c/for-6.10' into asoc-next)
Merging modules/modules-next (c75781a6e4c0 kallsyms: replace deprecated str=
ncpy with strscpy)
CONFLICT (content): Merge conflict in kernel/module/main.c
Merging input/next (48c0687a322d Input: pm8xxx-vibrator - correct VIB_MAX_L=
EVELS calculation)
Merging block/for-next (25d4ec36d5f6 Merge branch 'for-6.10/io_uring' into =
for-next)
CONFLICT (content): Merge conflict in io_uring/io_uring.c
CONFLICT (content): Merge conflict in io_uring/rw.c
Applying: fix up for "mm: switch mm->get_unmapped_area() to a flag"
Merging device-mapper/for-next (a98ecf716e30 dm-crypt: don't set WQ_CPU_INT=
ENSIVE for WQ_UNBOUND crypt_queue)
Merging libata/for-next (9e6938e14ea5 ata: libata-core: Remove ata_exec_int=
ernal_sg())
Merging pcmcia/pcmcia-next (ccae53aa8aa2 pcmcia: cs: make pcmcia_socket_cla=
ss constant)
Merging mmc/next (bce42d6108c9 mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (0398a09c7b13 mfd: bd71828: Remove commented code =
lines)
CONFLICT (content): Merge conflict in drivers/mfd/intel-lpss-pci.c
Merging backlight/for-backlight-next (df012cf5c42e backlight: otm3225a: Dro=
p driver owner assignment)
Merging battery/for-next (50f0ff7c8cc4 power: supply: bq27xxx: Move health =
reading out of update loop)
Merging regulator/for-next (15f992fa81eb Merge remote-tracking branch 'regu=
lator/for-6.10' into regulator-next)
Merging security/next (74560bb3685b lsm: remove the now superfluous sentine=
l element from ctl_table array)
Merging apparmor/apparmor-next (8ead196be219 apparmor: Fix memory leak in u=
npack_profile())
Merging integrity/next-integrity (9fa8e7625008 ima: add crypto agility supp=
ort for template-hash algorithm)
Merging selinux/next (d6fc1ee0b6c1 Automated merge of 'dev' into 'next')
Merging smack/next (69b6d71052b5 Smack: use init_task_smack() in smack_cred=
_transfer())
Merging tomoyo/master (0bb80ecc33a8 Linux 6.6-rc1)
Merging tpmdd/next (37c34331f194 Documentation: tpm_tis)
Merging watchdog/master (0bbac3facb5d Linux 6.9-rc4)
Merging iommu/next (d02a66d84baa Merge branches 'memory-observability' and =
'core' into next)
CONFLICT (content): Merge conflict in drivers/iommu/amd/amd_iommu.h
Merging audit/next (4cece7649650 Linux 6.9-rc1)
Merging devicetree/for-next (58d4b25c8831 dt-bindings: timer: renesas,tmu: =
Add R-Car V4M support)
CONFLICT (content): Merge conflict in drivers/of/dynamic.c
Merging dt-krzk/for-next (364be3ecd30d Merge branch 'next/dt' into for-next)
Merging mailbox/for-next (8df6bab6cb9a mailbox: imx: support i.MX95 Generic=
/ELE/V2X MU)
Merging spi/for-next (67eb8a648c71 Merge remote-tracking branch 'spi/for-6.=
10' into spi-next)
Merging tip/master (367dc2b68007 Merge branch into tip/master: 'sched/urgen=
t')
Merging clockevents/timers/drivers/next (8248ca30ef89 clocksource/drivers/t=
imer-riscv: Clear timer interrupt on timer initialization)
Merging edac/edac-for-next (8e95536e9495 Merge branch ras/edac-misc into fo=
r-next)
Merging ftrace/for-next (7604256cecef tracing: Add __string_src() helper to=
 help compilers not to get confused)
Merging rcu/rcu/next (5fd10857f131 rcu/tree: Reduce wake up for synchronize=
_rcu() common case)
CONFLICT (content): Merge conflict in arch/riscv/include/asm/cmpxchg.h
Applying: finish revert of "riscv: Emulate one-byte cmpxchg"
Merging kvm/next (1ab157ce573f KVM: SEV: use u64_to_user_ptr throughout)
Merging kvm-arm/next (9ac5bab4deee Merge branch kvm-arm64/misc-6.10 into kv=
marm-master/next)
Merging kvms390/next (39cd87c4eb2b Linux 6.9-rc2)
Merging kvm-ppc/topic/ppc-kvm (41bccc98fb79 Linux 6.8-rc2)
Merging kvm-riscv/riscv_kvm_next (f1c48c1ec735 RISC-V: KVM: selftests: Add =
ebreak test support)
Merging kvm-x86/next (2d181d84af38 Merge branches 'fixes', 'generic', 'misc=
', 'mmu', 'selftests', 'svm' and 'vmx')
CONFLICT (content): Merge conflict in arch/x86/kvm/svm/svm.c
Merging xen-tip/linux-next (d277f9d82802 xen/events: increment refcnt only =
if event channel is refcounted)
Merging percpu/for-next (2d9ad81ef935 Merge branch 'for-6.8-fixes' into for=
-next)
Merging workqueues/for-next (8a8a4bfdbe85 Merge branch 'for-6.10' into for-=
next)
Merging drivers-x86/for-next (88c0ef69dd88 platform/x86: asus-wmi: cleanup =
main struct to avoid some holes)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging chrome-platform/for-next (70a5f3005008 platform/chrome: cros_ec_lpc=
: add quirks for the Framework Laptop (AMD))
Merging chrome-platform-firmware/for-firmware-next (7f20f21c22aa firmware: =
google: cbmem: drop driver owner initialization)
Merging hsi/for-next (c076486b6a28 HSI: omap_ssi_port: Convert to platform =
remove callback returning void)
Merging leds-lj/for-leds-next (fd05e3698649 leds: mt6360: Fix the second LE=
D can not enable torch mode by V4L2)
Merging ipmi/for-next (6b4c04178660 ipmi: kcs_bmc_npcm7xx: Convert to platf=
orm remove callback returning void)
Merging driver-core/driver-core-next (66bc1a173328 treewide: Use sysfs_bin_=
attr_simple_read() helper)
Merging usb/usb-next (3d122e6d27e4 usb: typec: mux: gpio-sbu: Allow GPIO op=
erations to sleep)
CONFLICT (modify/delete): drivers/usb/misc/onboard_usb_hub.c deleted in usb=
/usb-next and modified in HEAD.  Version HEAD of drivers/usb/misc/onboard_u=
sb_hub.c left in tree.
$ git rm -f drivers/usb/misc/onboard_usb_hub.c
Applying: fix up for "usb: misc: onboard_hub: rename to onboard_dev"
Merging thunderbolt/next (25d905d2b819 thunderbolt: Allow USB3 bandwidth to=
 be lower than maximum supported)
Merging usb-serial/usb-next (39cd87c4eb2b Linux 6.9-rc2)
Merging tty/tty-next (b20172ca6bf4 serial: core: Fix ifdef for serial base =
console functions)
CONFLICT (content): Merge conflict in drivers/tty/serial/serial_core.c
Merging char-misc/char-misc-next (ebbc1a4789c6 uio: update kerneldoc commen=
ts for interrupt functions)
Merging accel/habanalabs-next (576d7cc5a9e2 accel: constify the struct devi=
ce_type usage)
Merging coresight/next (e0b97ddaf4b5 dt-bindings: arm: qcom,coresight-tpda:=
 fix indentation in the example)
Merging fastrpc/for-next (4cece7649650 Linux 6.9-rc1)
Merging fpga/for-next (4d2bc3f7dea4 fpga: tests: use KUnit devices instead =
of platform devices)
Merging icc/icc-next (7af14fe58e5e Merge branch 'icc-fixes' into icc-next)
Merging iio/togreg (aabc0aa90c92 Documentation: ABI: document in_temp_input=
 file)
Merging phy-next/next (a1fe1eca0d8b phy: rockchip-snps-pcie3: add support f=
or rockchip,rx-common-refclk-mode)
Merging soundwire/next (4cd5ea6de156 soundwire: intel_init: resume all devi=
ces on exit.)
Merging extcon/extcon-next (abe83c4e5e4f extcon: realtek: Remove unused of_=
gpio.h)
Merging gnss/gnss-next (0bbac3facb5d Linux 6.9-rc4)
Merging vfio/next (7447d911af69 vfio/fsl-mc: Block calling interrupt handle=
r without trigger)
Merging w1/for-next (cde37a5bdb0e w1: gpio: Don't use "proxy" headers)
Merging spmi/spmi-next (897268aef3fa spmi: pmic-arb: Replace three IS_ERR()=
 calls by null pointer checks in spmi_pmic_arb_probe())
Merging staging/staging-next (e4d5e3a9ae68 staging: nvec: update TODO)
Merging counter-next/counter-next (916baadd293a counter: ti-ecap-capture: U=
tilize COUNTER_COMP_FREQUENCY macro)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (44c026a73be8 Linux 6.4-rc3)
Merging dmaengine/next (4665be0e952f dmaengine: pch_dma: remove unused func=
tion chan2parent)
Merging cgroup/for-next (fc29e04ae1ad cgroup/rstat: add cgroup_rstat_lock h=
elpers and tracepoints)
Merging scsi/for-next (99033e81ab05 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (f92141e18c8b Merge patch series "convert SCSI to=
 atomic queue limits, part 1 (v3)")
Merging vhost/linux-next (5b9f214d0540 vhost: Merge tag 'vduse-virtio-net' =
into vhost)
Merging rpmsg/for-next (912ebe48bec5 Merge branches 'rpmsg-next' and 'rproc=
-next' into for-next)
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (9aeb26e3beaa gpio: sch: Switch to memory m=
apped IO accessors)
Merging gpio-intel/for-next (2d485d47560e gpio: sch: Utilise temporary vari=
able for struct device)
  abaed898da91 ("gpio: sch: Switch to memory mapped IO accessors")
Merging pinctrl/for-next (cdbd87951e21 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (5d10a157ebe0 pinctrl: baytrail: Add pinconf=
 group for uart3)
Merging pinctrl-renesas/renesas-pinctrl (aa43c15a790c pinctrl: renesas: rzg=
2l: Execute atomically the interrupt configuration)
Merging pinctrl-samsung/for-next (4184e4912ca6 dt-bindings: pinctrl: samsun=
g: drop unused header with register constants)
Merging pwm/pwm/for-next (bdcfd0997bd4 pwm: meson: Add generic compatible f=
or meson8 to sm1)
Merging ktest/for-next (07283c1873a4 ktest: force $buildonly =3D 1 for 'mak=
e_warnings_file' test type)
Merging kselftest/next (00ab560eb0e3 selftests: Mark ksft_exit_fail_perror(=
) as __noreturn)
Merging kunit/test (4cece7649650 Linux 6.9-rc1)
Merging kunit-next/kunit (8f571fc2488c kunit: Fix race condition in try-cat=
ch completion)
Merging livepatching/for-next (602bf1830798 Merge branch 'for-6.7' into for=
-next)
Merging rtc/rtc-next (393e3d290f61 rtc: mcp795: drop unneeded MODULE_ALIAS)
Merging nvdimm/libnvdimm-for-next (d9212b35da52 dax: remove SLAB_MEM_SPREAD=
 flag usage)
Merging at24/at24/for-next (4cece7649650 Linux 6.9-rc1)
Merging ntb/ntb-next (9341b37ec17a ntb_perf: Fix printk format)
Merging seccomp/for-next/seccomp (39cd87c4eb2b Linux 6.9-rc2)
Merging fsi/next (c5eeb63edac9 fsi: Fix panic on scom file read)
Merging slimbus/for-next (b12bd525ca6e slimbus: qcom-ngd-ctrl: Add timeout =
for wait operation)
Merging nvmem/for-next (9e29a1dba59b nvmem: meson-mx-efuse: Remove nvmem_de=
vice from efuse struct)
Merging xarray/main (2a15de80dd0f idr: fix param name in idr_alloc_cyclic()=
 doc)
Merging hyperv/hyperv-next (f2580a907e5c x86/hyperv: Use Hyper-V entropy to=
 seed guest random number generator)
Merging auxdisplay/for-next (93ee235f55d3 auxdisplay: charlcd: Don't rebuil=
d when CONFIG_PANEL_BOOT_MESSAGE=3Dy)
Merging kgdb/kgdb/for-next (4f41d30cd6dc kdb: Fix a potential buffer overfl=
ow in kdb_local())
Merging hmm/hmm (6613476e225e Linux 6.8-rc1)
Merging cfi/cfi/next (06c2afb862f9 Linux 6.5-rc1)
Merging mhi/mhi-next (813e0ae613d6 bus: mhi: host: Add mhi_power_down_keep_=
dev() API to support system suspend/hibernation)
Merging memblock/for-next (e5d1fdecfaf8 mm/memblock: remove empty dummy ent=
ry)
Merging cxl/next (ed1ff2fba7af Merge branch 'for-6.9/cxl-einj' into for-6.9=
/cxl)
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (cda30c6542c8 efi: Clear up misconceptions about a maximum=
 variable name size)
Merging unicode/for-next (0131c1f3cce7 unicode: make utf8 test count static)
Merging slab/slab/for-next (5b15f3fb89fc slub: Set __GFP_COMP in kmem_cache=
 by default)
Merging random/master (4cece7649650 Linux 6.9-rc1)
Merging landlock/next (028243655456 fs/ioctl: Add a comment to keep the log=
ic in sync with LSM policies)
Merging rust/rust-next (2c1092853f16 rust: kernel: remove usage of `allocat=
or_api` unstable feature)
Merging sysctl/sysctl-next (12e78b868481 sysctl: drop now unnecessary out-o=
f-bounds check)
Merging execve/for-next/execve (a9c3475dd67b Replace macro "ARCH_HAVE_EXTRA=
_ELF_NOTES" with kconfig)
Merging bitmap/bitmap-for-next (36a71c558b3e sched/topology: Optimize topol=
ogy_span_sane())
Merging hte/for-next (297f26dbf870 hte: tegra-194: Convert to platform remo=
ve callback returning void)
Merging kspp/for-next/kspp (f4626c12e4b5 ubsan: Add awareness of signed int=
eger overflow traps)
Merging kspp-gustavo/for-next/kspp (6613476e225e Linux 6.8-rc1)
Merging nolibc/nolibc (0adab2b6b733 tools/nolibc: add support for uname(2))
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (4cece7649650 Linux 6.9-rc1)
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)

--Sig_/HMWcv20Uh0Q8+SHrvXJu4XB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmYfYEcACgkQAVBC80lX
0GxNzQf3Wmm9hXCENHmf6AK80oEYngl3sjluVkwuPbY0dgrcwsJ19bbJy/ODkepP
mYyrMnYmCOvx7gFhQoWtujIC2WZ+mN3xBo6HIvGk0P8E/RlRWspL2TnHOGKpKm14
aleeCxj4mKaRbc8b5uErJhLSHVRQ79tBO8VHiNWNuxoKtokD6yGnBRGpEwp7f/IM
zmq6NIv9JgPFi9pNkZ+VRe/jJEJN+VX+YZj7s35luWx1C1bmqnrw/5rHIAXvdaJB
yTh7VuSlHiQYbvDxI850I77xHBcvXkc7z9n4QYiCHNe/2NXglXuWfVFQonLyOH+B
nS1bNXCMT2avLY8axg+jZu4+qtnS
=CM8k
-----END PGP SIGNATURE-----

--Sig_/HMWcv20Uh0Q8+SHrvXJu4XB--

