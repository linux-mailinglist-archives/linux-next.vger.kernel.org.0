Return-Path: <linux-next+bounces-1642-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A893A87C7D3
	for <lists+linux-next@lfdr.de>; Fri, 15 Mar 2024 04:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1505A1F22A08
	for <lists+linux-next@lfdr.de>; Fri, 15 Mar 2024 03:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7BD4C8CE;
	Fri, 15 Mar 2024 03:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Bu6Famsj"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB9579E4;
	Fri, 15 Mar 2024 03:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710471981; cv=none; b=ciZc3jqTACryz9lV8tuoIYWAVopf7sVSnr+OHXLFvcbhctJq37df4/i/gIWRthIc27Yu38BSOzBHQNTFqyvHJlG8r0nQz/KpwRhTy+0uvH6ydDIqSS0zUd8SEVZxGwTfKRB/+Mw/da0ZdLbftnArd0EbrReNALREKDJEFQ7wyEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710471981; c=relaxed/simple;
	bh=WmBc9Q+HBdC023V+AqgcitUX2YFqD0pwp/S6JXThXj8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Nx5qQftKqAetLdG7ySH9pPOdIV/aoSjNPnCetnPTJHB6cz6O2xNbNC7kInryVPo6yNzSa7xCUZQH4QUjYbMIc5ZQyejyoipvF4A1aIQAyJfZg15obLjtqvRSwOhdpme6TfKECMJu4Rxrf098Ts+6ohuTexrqPYYDRC0hLl/61zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Bu6Famsj; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1710471972;
	bh=dmWgmXDw1TuF5oNXwLOMunRRAznpRf/qSafY3mqcTBo=;
	h=Date:From:To:Cc:Subject:From;
	b=Bu6Famsj/k0rh2yUSXmkmTdugk8YAIZRB+1CYHYSjgeUORdYnmevuooH3UYeuw3By
	 9eTpD5jDpAw2X9jgO3RGr/dulKVYKvAlfBAknGl/efkK7usXstSiWsRxuk21gMSg1a
	 GZZCSlTIYMadmq1X5Z8YyT/LHOL6EVFlYnV/COP8S6UHYj1scQoPsqQ3BoMqZGMDMi
	 EdTP7TEPQvzUqvocZtC4GIAtScUhByBDUsnvLSnBCUpjyZ2iTkc5NSsw/LJuRRUSV5
	 MsOTn1mHexKbX3JmoiauydgVA0499qtunt15HQMrjHE0eOadSFyZnAKYHgZ6xCxbhB
	 b8nKjOrOr8Yfg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Twpzm4vVmz4wc7;
	Fri, 15 Mar 2024 14:06:12 +1100 (AEDT)
Date: Fri, 15 Mar 2024 14:06:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 15
Message-ID: <20240315140611.7b9f04a0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4P+j1a2mAr5vbOXc1wf7Gn5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4P+j1a2mAr5vbOXc1wf7Gn5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20240314:

The mm-nonmm-stable tree gained a conflict against Linus' tree.

The risc-v tree gained a conflict against the arm64 tree.

Non-merge commits (relative to Linus' tree): 4096
 4140 files changed, 150164 insertions(+), 64613 deletions(-)

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

I am currently merging 371 trees (counting Linus' and 105 trees of bug
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
Merging origin/master (fe46a7dd189e Merge tag 'sound-6.9-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/tiwai/sound)
Merging fixes/fixes (2dde18cd1d8f Linux 6.5)
Merging mm-hotfixes/mm-hotfixes-unstable (ded79af42f11 scripts/gdb/symbols:=
 fix invalid escape sequence warning)
Merging kbuild-current/fixes (b401b621758e Linux 6.8-rc5)
Merging arc-current/for-curr (861deac3b092 Linux 6.7-rc7)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (2c79bd34af13 arm64: prohibit probing on=
 arch_kunwind_consume_entry())
Merging arm-soc-fixes/arm/fixes (1c7cfb6158f6 Merge tag 'riscv-firmware-for=
-v6.9' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into =
arm/fixes)
Merging davinci-current/davinci/for-current (6613476e225e Linux 6.8-rc1)
Merging drivers-memory-fixes/fixes (6613476e225e Linux 6.8-rc1)
Merging sophgo-fixes/fixes (41bccc98fb79 Linux 6.8-rc2)
Merging tee-fixes/fixes (ceaa837f96ad Linux 6.2-rc8)
Merging m68k-current/for-linus (e8a7824856de m68k: defconfig: Update defcon=
figs for v6.8-rc1)
Merging powerpc-fixes/fixes (380cb2f4df78 selftests/powerpc: Fix fpu_signal=
 failures)
Merging s390-fixes/fixes (b0546776ad3f Merge tag 'printk-for-6.9' of git://=
git.kernel.org/pub/scm/linux/kernel/git/printk/linux)
Merging fscrypt-current/for-current (4bcf6f827a79 fscrypt: check for NULL k=
eyring in fscrypt_put_master_key_activeref())
Merging fsverity-current/for-current (a075bacde257 fsverity: don't drop pag=
ecache at end of FS_IOC_ENABLE_VERITY)
Merging net/main (e30cef001da2 net: txgbe: fix clk_name exceed MAX_DEV_ID l=
imits)
Merging bpf/master (44d79142ede8 bpf: Temporarily disable atomic operations=
 in BPF arena)
Merging ipsec/master (e3fb8e8ba72b net: dsa: microchip: make sure drive str=
ength configuration is not lost by soft reset)
Merging netfilter/main (d7d75124965a devlink: Fix devlink parallel commands=
 processing)
Merging ipvs/main (767146637efc netfilter: nf_conntrack_h323: Add protectio=
n for bmp length out of range)
Merging wireless/for-next (cec60af1972d wifi: rtw89: coex: fix configuratio=
n for shared antenna for 8922A)
Merging wpan/master (b85ea95d0864 Linux 6.7-rc1)
Merging rdma-fixes/for-rc (eb5c7465c324 RDMA/srpt: fix function pointer cas=
t warnings)
Merging sound-current/for-linus (a39d51ff1f52 ALSA: usb-audio: Stop parsing=
 channels bits when all channels are found.)
Merging sound-asoc-fixes/for-linus (9846dcc3ccf7 Merge remote-tracking bran=
ch 'asoc/for-6.8' into asoc-linus)
Merging regmap-fixes/for-linus (2f0dbb24f78a regmap: kunit: Ensure that cha=
nged bytes are actually different)
Merging regulator-fixes/for-linus (a1f9fa6fcbb3 Merge remote-tracking branc=
h 'regulator/for-6.8' into regulator-linus)
Merging spi-fixes/for-linus (bd7e6fe2078e Merge remote-tracking branch 'spi=
/for-6.8' into spi-linus)
Merging pci-current/for-linus (6613476e225e Linux 6.8-rc1)
Merging driver-core.current/driver-core-linus (b401b621758e Linux 6.8-rc5)
Merging tty.current/tty-linus (3d9319c27ceb Revert "tty: serial: simplify q=
com_geni_serial_send_chunk_fifo()")
Merging usb.current/usb-linus (b234c70fefa7 xhci: Fix failure to detect rin=
g expansion need.)
Merging usb-serial-fixes/usb-linus (d206a76d7d27 Linux 6.8-rc6)
Merging phy/fixes (47b412c1ea77 phy: qcom-qmp-combo: fix type-c switch regi=
stration)
Merging staging.current/staging-linus (6613476e225e Linux 6.8-rc1)
Merging iio-fixes/fixes-togreg (11dadb631007 iio: accel: adxl367: fix I2C F=
IFO data register)
Merging counter-current/counter-current (c83ccdc9586b counter: fix privdata=
 alignment)
Merging char-misc.current/char-misc-linus (a0776c214d47 mei: gsc_proxy: mat=
ch component when GSC is on different bus)
Merging soundwire-fixes/fixes (6613476e225e Linux 6.8-rc1)
Merging thunderbolt-fixes/fixes (e8f897f4afef Linux 6.8)
Merging input-current/for-linus (fbf8d7174255 Input: synaptics-rmi4 - fix U=
AF of IRQ domain on driver removal)
Merging crypto-current/master (6a8dbd71a706 Revert "crypto: remove CONFIG_C=
RYPTO_STATS")
Merging vfio-fixes/for-linus (4ea95c04fa6b vfio: Drop vfio_file_iommu_group=
() stub to fudge around a KVM wart)
Merging kselftest-fixes/fixes (b54761f6e977 kselftest/seccomp: Report each =
expectation we assert as a KTAP test)
Merging modules-fixes/modules-linus (f412eef03938 Documentation: livepatch:=
 module-elf-format: Remove local klp_modinfo definition)
Merging dmaengine-fixes/fixes (90d35da658da Linux 6.8-rc7)
Merging backlight-fixes/for-backlight-fixes (6613476e225e Linux 6.8-rc1)
Merging mtd-fixes/mtd/fixes (e6a30d0c48a1 mtd: rawnand: marvell: fix layout=
s)
Merging mfd-fixes/for-mfd-fixes (6613476e225e Linux 6.8-rc1)
Merging v4l-dvb-fixes/fixes (346c84e281a9 media: pwm-ir-tx: Depend on CONFI=
G_HIGH_RES_TIMERS)
Merging reset-fixes/reset/fixes (4a6756f56bcf reset: Fix crash when freeing=
 non-existent optional resets)
Merging mips-fixes/mips-fixes (b401b621758e Linux 6.8-rc5)
Merging at91-fixes/at91-fixes (6613476e225e Linux 6.8-rc1)
Merging omap-fixes/fixes (9b6a51aab5f5 ARM: dts: Fix occasional boot hang f=
or am3 usb)
Merging kvm-fixes/master (5abf6dceb066 SEV: disable SEV-ES DebugSwap by def=
ault)
Merging kvms390-fixes/master (83303a4c776c KVM: s390: fix cc for successful=
 PQAP)
Merging hwmon-fixes/hwmon (d206a76d7d27 Linux 6.8-rc6)
Merging nvdimm-fixes/libnvdimm-fixes (33908660e814 ACPI: NFIT: Fix incorrec=
t calculation of idt size)
Merging cxl-fixes/fixes (d206a76d7d27 Linux 6.8-rc6)
Merging btrfs-fixes/next-fixes (5aaf38c4aef2 Merge branch 'misc-6.8' into n=
ext-fixes)
Merging vfs-fixes/fixes (aa23317d0268 qibfs: fix dentry leak)
Merging dma-mapping-fixes/for-linus (d5090484b021 swiotlb: do not try to al=
locate a TLB bigger than MAX_ORDER pages)
Merging drivers-x86-fixes/fixes (0314cebb29be platform/x86/amd/pmf: Fix mis=
sing error code in amd_pmf_init_smart_pc())
Merging samsung-krzk-fixes/fixes (eab4f56d3e75 ARM: dts: exynos4212-tab3: a=
dd samsung,invert-vclk flag to fimd)
Merging pinctrl-samsung-fixes/fixes (6613476e225e Linux 6.8-rc1)
Merging devicetree-fixes/dt/linus (7cb50f6c9fba of: property: fw_devlink: F=
ix stupid bug in remote-endpoint parsing)
Merging dt-krzk-fixes/fixes (6613476e225e Linux 6.8-rc1)
Merging scsi-fixes/fixes (ee0017c3ed8a scsi: mpt3sas: Prevent sending diag_=
reset when the controller is ready)
Merging drm-fixes/drm-fixes (b7cc4ff787a5 nouveau: lock the client object t=
ree.)
Merging drm-intel-fixes/for-linux-next-fixes (e8f897f4afef Linux 6.8)
Merging mmc-fixes/fixes (4af59a8df5ea mmc: core: Fix switch on gp3 partitio=
n)
Merging rtc-fixes/rtc-fixes (08279468a294 rtc: sunplus: fix format string f=
or printing resource)
Merging gnss-fixes/gnss-linus (54be6c6c5ae8 Linux 6.8-rc3)
Merging hyperv-fixes/hyperv-fixes (aa707b615ce1 Drivers: hv: vmbus: make hv=
_bus const)
Merging soc-fsl-fixes/fix (06c2afb862f9 Linux 6.5-rc1)
Merging risc-v-fixes/fixes (a11dd49dcb93 riscv: Sparse-Memory/vmemmap out-o=
f-bounds fix)
Merging riscv-dt-fixes/riscv-dt-fixes (2672031b20f6 riscv: dts: Move BUILTI=
N_DTB_SOURCE to common Kconfig)
Merging riscv-soc-fixes/riscv-soc-fixes (d206a76d7d27 Linux 6.8-rc6)
Merging fpga-fixes/fixes (6613476e225e Linux 6.8-rc1)
Merging spdx/spdx-linus (04b8076df253 Merge tag 'firewire-fixes-6.8-rc7' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394)
Merging gpio-brgl-fixes/gpio/for-current (90d35da658da Linux 6.8-rc7)
Merging gpio-intel-fixes/fixes (6613476e225e Linux 6.8-rc1)
Merging pinctrl-intel-fixes/fixes (6613476e225e Linux 6.8-rc1)
Merging auxdisplay-fixes/fixes (6613476e225e Linux 6.8-rc1)
Merging erofs-fixes/fixes (e8f897f4afef Linux 6.8)
Merging kunit-fixes/kunit-fixes (829388b725f8 kunit: device: Unregister the=
 kunit_bus on shutdown)
Merging ubifs-fixes/fixes (2241ab53cbb5 Linux 6.2-rc5)
Merging memblock-fixes/fixes (6a9531c3a880 memblock: fix crash when reserve=
d memory is not added to memory)
Merging nfsd-fixes/nfsd-fixes (5ea9a7c5fe41 nfsd: don't take fi_lock in nfs=
d_break_deleg_cb())
Merging renesas-fixes/fixes (8c987693dc2d ARM: dts: renesas: rcar-gen2: Add=
 missing #interrupt-cells to DA9063 nodes)
Merging perf-current/perf-tools (0f66dfe7b91d perf annotate: Add comments i=
n the data structures)
Merging efi-fixes/urgent (2ce507f57ba9 efivarfs: Drop 'duplicates' bool par=
ameter on efivar_init())
Merging zstd-fixes/zstd-linus (77618db34645 zstd: Fix array-index-out-of-bo=
unds UBSAN warning)
Merging battery-fixes/fixes (2df70149e73e power: supply: bq27xxx-i2c: Do no=
t free non existing IRQ)
Merging uml-fixes/fixes (73a23d771033 um: harddog: fix modular build)
Merging iommufd-fixes/for-rc (bb04d1335388 iommufd/selftest: Don't check ma=
p/unmap pairing with HUGE_PAGES)
Merging rust-fixes/rust-fixes (b401b621758e Linux 6.8-rc5)
Merging v9fs-fixes/fixes/next (6613476e225e Linux 6.8-rc1)
Merging w1-fixes/fixes (6613476e225e Linux 6.8-rc1)
Merging pmdomain-fixes/fixes (2a93c6cbd5a7 pmdomain: qcom: rpmhpd: Fix enab=
led_corner aggregation)
Merging overlayfs-fixes/ovl-fixes (420332b94119 ovl: mark xwhiteouts direct=
ory with overlay.opaque=3D'x')
Merging i2c-host-fixes/i2c/i2c-host-fixes (1f78f0901011 i2c: aspeed: Fix th=
e dummy irq expected print)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging drm-misc-fixes/for-linux-next-fixes (a2e7496b453e Merge drm/drm-fix=
es into drm-misc-fixes)
Merging mm-stable/mm-stable (270700dd06ca mm/zswap: remove the memcpy if ac=
omp is not sleepable)
CONFLICT (content): Merge conflict in include/linux/sched.h
CONFLICT (content): Merge conflict in init/main.c
CONFLICT (content): Merge conflict in mm/vmalloc.c
Merging mm-nonmm-stable/mm-nonmm-stable (269cdf353b5b nilfs2: prevent kerne=
l bug at submit_bh_wbc())
CONFLICT (content): Merge conflict in Documentation/process/changes.rst
CONFLICT (content): Merge conflict in arch/riscv/include/asm/ftrace.h
CONFLICT (content): Merge conflict in fs/ocfs2/super.c
Merging kbuild/for-next (44929bfaceaa kbuild: remove GCC's default -Wpacked=
-bitfield-compat flag)
CONFLICT (content): Merge conflict in arch/hexagon/Kconfig
CONFLICT (content): Merge conflict in scripts/Makefile.lib
Merging clang-format/clang-format (5a205c6a9f79 clang-format: Update with v=
6.7-rc4's `for_each` macro list)
Merging perf/perf-tools-next (0f66dfe7b91d perf annotate: Add comments in t=
he data structures)
Merging compiler-attributes/compiler-attributes (2993eb7a8d34 Compiler Attr=
ibutes: counted_by: fixup clang URL)
Merging dma-mapping/for-next (14cebf689a78 swiotlb: Reinstate page-alignmen=
t for mappings >=3D PAGE_SIZE)
Merging asm-generic/master (5394f1e9b687 arch: define CONFIG_PAGE_SIZE_*KB =
on all architectures)
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (5616fee8981b Merge branches 'misc' and 'fixes' into f=
or-next)
Merging arm64/for-next/core (1ef21fcd6a50 Revert "mm: add arch hook to vali=
date mmap() prot flags")
CONFLICT (content): Merge conflict in rust/Makefile
Merging arm-perf/for-next/perf (b037e40a6af2 docs: perf: Fix build warning =
of hisi-pcie-pmu.rst)
Merging arm-soc/for-next (a04a7da3982e bus: ts-nbus: Improve error reportin=
g)
Merging amlogic/for-next (7092cfae086f Merge branch 'v6.9/arm64-dt' into fo=
r-next)
Merging asahi-soc/asahi-soc/for-next (ffc253263a13 Linux 6.6)
Merging aspeed/for-next (0c30853731ec ARM: dts: aspeed: x4tf: Add dts for a=
sus x4tf project)
Merging at91/at91-next (6315946ad242 Merge branch 'at91-dt' into at91-next)
Merging broadcom/next (bbfdba3d4757 Merge branch 'soc/next' into next)
Merging davinci/davinci/for-next (6613476e225e Linux 6.8-rc1)
Merging drivers-memory/for-next (e46076906722 memory: stm32-fmc2-ebi: keep =
power domain on)
Merging imx-mxs/for-next (edb0d16255f6 Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (ba90af39ba57 arm64: dts: mediatek: mt8183-pico6:=
 Fix wake-on-X event node names)
Merging mvebu/for-next (6b6f1082cb46 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (69f4343fc41d Merge branch 'omap-for-v6.9/n8x0-fixes'=
 into for-next)
Merging qcom/for-next (d0e0a21a3cb9 Merge branches 'arm32-for-6.9', 'arm64-=
defconfig-for-6.9', 'arm64-fixes-for-6.8', 'arm64-for-6.9', 'clk-for-6.9' a=
nd 'drivers-for-6.9' into for-next)
Merging renesas/next (01fdf7d6f150 Merge branch 'renesas-dt-bindings-for-v6=
.9' into renesas-next)
Merging reset/reset/next (c721f189e89c reset: Instantiate reset GPIO contro=
ller for shared reset-gpios)
Merging rockchip/for-next (24f3ec49401a Merge branch 'v6.9-armsoc/dts64' in=
to for-next)
Merging samsung-krzk/for-next (fb1be31d4042 Merge branches 'fixes', 'next/c=
lk', 'next/drivers', 'next/dt', 'next/dt64' and 'next/soc' into for-next)
Merging scmi/for-linux-next (a2b8119375a1 Merge tags 'vexpress-update-6.9',=
 'ffa-update-6.9' and 'scmi-updates-6.9' of git://git.kernel.org/pub/scm/li=
nux/kernel/git/sudeep.holla/linux into for-linux-next)
Merging sophgo/for-next (0f46e1339ef1 MAINTAINERS: Setup proper info for SO=
PHGO vendor support)
Merging stm32/stm32-next (a7b9ab6c880d arm64: dts: st: add video encoder su=
pport to stm32mp255)
Merging sunxi/sunxi/for-next (c1d7282e4e92 Merge branch 'sunxi/dt-for-6.9' =
into sunxi/for-next)
Merging tee/next (90d35da658da Linux 6.8-rc7)
Merging tegra/for-next (c85c30fad06d Merge branch for-6.9/arm64/dt into for=
-next)
Merging ti/ti-next (68818060efdb Merge branch 'ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (2d81f5ef567c Merge remote-tracking branch 'git/zyn=
qmp/dt' into for-next)
Merging clk/clk-next (3066c521be9d Merge branches 'clk-samsung', 'clk-imx',=
 'clk-rockchip', 'clk-clkdev' and 'clk-rate-exclusive' into clk-next)
Merging clk-imx/for-next (13269dc6c704 clk: imx: imx8mp: Fix SAI_MCLK_SEL d=
efinition)
Merging clk-renesas/renesas-clk (81a7a88a9806 clk: renesas: r8a779h0: Add R=
PC-IF clock)
Merging csky/linux-next (2c40c1c6adab Merge tag 'usb-6.7-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging loongarch/loongarch-next (f5bbedf6c853 Merge branch 'loongarch-kvm'=
 into loongarch-next)
CONFLICT (content): Merge conflict in arch/loongarch/Makefile
Merging m68k/for-next (e8a7824856de m68k: defconfig: Update defconfigs for =
v6.8-rc1)
Merging m68knommu/for-next (b401b621758e Linux 6.8-rc5)
Merging microblaze/next (6613476e225e Linux 6.8-rc1)
Merging mips/mips-next (732932220078 mips: cm: Convert __mips_cm_phys_base(=
) to weak function)
Merging openrisc/for-next (7f1e2fc49348 openrisc: Use asm-generic's version=
 of fix_to_virt() & virt_to_fix())
Merging parisc-hd/for-next (26dd48780bd2 parisc: led: Convert to platform r=
emove callback returning void)
Merging powerpc/next (9db2235326c4 powerpc/macio: Make remove callback of m=
acio driver void returned)
Merging soc-fsl/next (fb9c384625dd bus: fsl-mc: fsl-mc-allocator: Drop a wr=
ite-only variable)
Merging risc-v/for-next (2b2ca354674b Merge patch series "riscv: Use Kconfi=
g to set unaligned access speed")
CONFLICT (content): Merge conflict in arch/riscv/include/asm/bitops.h
CONFLICT (content): Merge conflict in drivers/perf/Kconfig
Merging riscv-dt/riscv-dt-for-next (28ecaaa5af19 riscv: dts: starfive: jh71=
10: Add camera subsystem nodes)
Merging riscv-soc/riscv-soc-for-next (6613476e225e Linux 6.8-rc1)
Merging s390/for-next (69460c5e6be0 s390/raw3270: make class3270 constant)
Merging sh/for-next (0a2d3ce0031f sh: hd64461: Make setup_hd64461 static)
Merging sparc/for-next (84b76d05828a lib/fonts: Allow Sparc console 8x16 fo=
nt for sparc64 early boot text console)
Merging uml/next (83aec96c631e um: Mark 32bit syscall helpers as clobbering=
 memory)
Merging xtensa/xtensa-for-next (7ab7acb68adf xtensa: fix MAKE_PC_FROM_RA se=
cond argument)
Merging bcachefs/for-next (be28368b2ccb bcachefs: time_stats: shrink time_s=
tat_buffer for better alignment)
CONFLICT (content): Merge conflict in fs/bcachefs/super-io.c
Merging pidfd/for-next (a901a3568fd2 Merge tag 'iomap-6.5-merge-1' of git:/=
/git.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging fscrypt/for-next (8c62f31eddb7 fscrypt: shrink the size of struct f=
scrypt_inode_info slightly)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (a65b40c6858c Merge branch 'for-next-next-v6.8-20240=
305' into for-next-20240305)
Merging ceph/master (321e3c3de53c libceph: init the cursor when preparing s=
parse read in msgr2)
Merging cifs/for-next (2760161d149f cifs: remove redundant variable assignm=
ent)
Merging configfs/for-next (4425c1d9b44d configfs: improve item creation per=
formance)
Merging ecryptfs/next (a3d78fe3e1ae fs: ecryptfs: comment typo fix)
Merging erofs/dev (a1bafc3109d7 erofs: support compressed inodes over fscac=
he)
Merging exfat/dev (3b668b889ddb exfat: remove duplicate update parent dir)
Merging exportfs/exportfs-next (42c3732fa807 fs: Create a generic is_dot_do=
tdot() utility)
Merging ext3/for_next (9d7d0eb685f1 Pull fanotify fix to allow freezing of =
tasks waiting for event response.)
Merging ext4/dev (0ecae5410ab5 ext4: initialize sbi->s_freeclusters_counter=
 and sbi->s_dirtyclusters_counter before use in kunit test)
CONFLICT (content): Merge conflict in fs/ext4/super.c
Merging f2fs/dev (eb70d5a6c932 f2fs: fix to avoid use-after-free issue in f=
2fs_filemap_fault)
CONFLICT (content): Merge conflict in fs/f2fs/super.c
Merging fsverity/for-next (8e43fb06e10d fsverity: remove hash page spin loc=
k)
Merging fuse/for-next (cdf6ac2a03d2 fuse: get rid of ff->readdir.lock)
CONFLICT (content): Merge conflict in fs/fuse/file.c
CONFLICT (content): Merge conflict in fs/fuse/inode.c
Merging gfs2/for-next (6f18f897e3ff gfs2: Remove unnecessary gfs2_meta_chec=
k_ii argument)
Merging jfs/jfs-next (e42e29cc4423 Revert "jfs: fix shift-out-of-bounds in =
dbJoin")
Merging ksmbd/ksmbd-for-next (c8efcc786146 ksmbd: add support for durable h=
andles v1/v2)
Merging nfs/linux-next (0f2ca83f88d8 nfs: fix panic when nfs4_ff_layout_pre=
pare_ds() fails)
Merging nfs-anna/linux-next (57331a59ac0d NFSv4.1: Use the nfs_client's rpc=
 timeouts for backchannel)
Merging nfsd/nfsd-next (9b350d3e349f NFSD: Clean up nfsd4_encode_replay())
Merging ntfs3/master (622cd3daa8ea fs/ntfs3: Slightly simplify ntfs_inode_p=
rintk())
Merging orangefs/for-next (9bf93dcfc453 Julia Lawall reported this null poi=
nter dereference, this should fix it.)
Merging overlayfs/overlayfs-next (d17bb4620f90 overlayfs.rst: fix ReST form=
atting)
Merging ubifs/next (b8a77b9a5f9c mtd: ubi: fix NVMEM over UBI volumes on 32=
-bit systems)
Merging v9fs/9p-next (2a0505cdd8c8 9p: remove SLAB_MEM_SPREAD flag usage)
Merging v9fs-ericvh/ericvh/for-next (be57855f5050 fs/9p: fix dups even in u=
ncached mode)
Merging xfs/for-next (75bcffbb9e75 xfs: shrink failure needs to hold AGI bu=
ffer)
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
Merging vfs-brauner/vfs.all (ec0bd2fb770c Merge branch 'vfs.uuid' into vfs.=
all)
CONFLICT (content): Merge conflict in fs/bcachefs/super-io.c
CONFLICT (content): Merge conflict in fs/coredump.c
Merging vfs/for-next (052d534373b7 Merge tag 'exfat-for-6.8-rc1' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat)
Merging printk/for-next (e7081d5a9d97 Merge branch 'rework/console-flushing=
-fixes' into for-next)
Merging pci/next (aabf7173cdfe Merge branch 'pci/controller/qcom')
Merging pstore/for-next/pstore (c8d25d696f52 pstore/zone: Don't clear memor=
y twice)
Merging hid/for-next (f0cd2e82460c Merge branch 'for-6.9/amd-sfh' into for-=
next)
Merging i2c/i2c/for-next (91962feb9502 Merge tag 'i2c-host-6.9' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-mergewi=
ndow)
Merging i2c-host/i2c/i2c-host (bb271301b804 i2c: nomadik: sort includes)
Merging i3c/i3c/next (8f06fb458539 i3c: Make i3c_bus_type const)
Merging hwmon-staging/hwmon-next (8debe3c1295e hwmon: (dell-smm) Add XPS 93=
15 to fan control whitelist)
Merging jc_docs/docs-next (0c8e9b538ed7 docs: verify/bisect: fixes, finetun=
ing, and support for Arch)
Merging v4l-dvb/master (e0b8eb0f6d65 media: visl: Add codec specific variab=
ility on output frames)
  24b41af1f1d2 ("media: tc358743: register v4l2 async device only after suc=
cessful setup")
CONFLICT (content): Merge conflict in drivers/staging/media/atomisp/pci/ato=
misp_cmd.c
Merging v4l-dvb-next/master (b14257abe705 media: rcar-isp: Disallow unbind =
of devices)
Merging pm/linux-next (23f5faecc19e Merge branches 'pm-powercap', 'pm-em', =
'pm-sleep' and 'pm-cpufreq' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (ad2a91086e28 cpufreq: scmi: Set=
 transition_delay_us)
Merging cpupower/cpupower (a114d9f1f2cf Fix cpupower-frequency-info.1 man p=
age typo)
Merging devfreq/devfreq-next (68a8582befd4 PM / devfreq: rk3399_dmc: Conver=
t to platform remove callback returning void)
Merging pmdomain/next (ccabbb6768fc pmdomain: renesas: rcar-gen4-sysc: Redu=
ce atomic delays)
Merging opp/opp/linux-next (13c8cf339e1a dt-bindings: opp: drop maxItems fr=
om inner items)
Merging thermal/thermal/linux-next (1828c1c17bb2 thermal/drivers/rcar_gen3:=
 Add support for R-Car V4M)
Merging dlm/next (d7e75b6385da dlm: fix off-by-one waiters refcount handlin=
g)
Merging rdma/for-next (96d9cbe2f2ff RDMA/cm: add timeout to cm_destroy_id w=
ait)
Merging net-next/main (9187210eee7d Merge tag 'net-next-6.9' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging bpf-next/for-next (9187210eee7d Merge tag 'net-next-6.9' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging ipsec-next/master (aceb147b20a2 xfrm: Do not allocate stats in the =
driver)
Merging mlx5-next/mlx5-next (d727d27db536 RDMA/mlx5: Expose register c0 for=
 RDMA device)
Merging netfilter-next/main (ed1f164038b5 Merge git://git.kernel.org/pub/sc=
m/linux/kernel/git/netdev/net)
Merging ipvs-next/main (a4634aa71fee bonding: rate-limit bonding driver ins=
pect messages)
Merging bluetooth/master (32652c5a24c9 Bluetooth: btintel: Add support to d=
ownload intermediate loader)
Merging wireless-next/for-next (c2b25092864a Merge branch 'qmc-hdlc')
Merging wpan-next/master (b2d23256615c ieee802154: cfg802154: make wpan_phy=
_class constant)
Merging wpan-staging/staging (b2d23256615c ieee802154: cfg802154: make wpan=
_phy_class constant)
Merging mtd/mtd/next (2842dc9bc1a5 mtd: spi-nor: core: correct type of i)
Merging nand/nand/next (4120aa0e3961 mtd: rawnand: Ensure continuous reads =
are well disabled)
Merging spi-nor/spi-nor/next (6a9eda34418f mtd: spi-nor: core: set mtd->era=
seregions for non-uniform erase map)
Merging crypto/master (6a8dbd71a706 Revert "crypto: remove CONFIG_CRYPTO_ST=
ATS")
Merging drm/drm-next (119b225f01e4 Merge tag 'amd-drm-next-6.9-2024-03-08-1=
' of https://gitlab.freedesktop.org/agd5f/linux into drm-next)
Merging drm-exynos/for-linux-next (119b225f01e4 Merge tag 'amd-drm-next-6.9=
-2024-03-08-1' of https://gitlab.freedesktop.org/agd5f/linux into drm-next)
Merging drm-misc/for-linux-next (6d5501d59cf6 drm/bridge: correct DRM_BRIDG=
E_OP_EDID documentation)
Merging amdgpu/drm-next (7ea808d77cf3 drm/amd/display: Lock all enabled otg=
 pipes even with no planes)
Merging drm-intel/for-linux-next (f77772866385 drm/i915/display: Increase n=
umber of fast wake precharge pulses)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_di=
splay_power_well.c
Merging drm-tegra/for-next (2429b3c529da drm/tegra: Avoid potential 32-bit =
integer overflow)
Merging drm-msm/msm-next (4be445f5b6b6 drm/msm/dpu: capture snapshot on the=
 first commit_done timeout)
Merging drm-msm-lumag/msm-next-lumag (4be445f5b6b6 drm/msm/dpu: capture sna=
pshot on the first commit_done timeout)
Merging drm-xe/drm-xe-next (bde5d76785bc drm/xe: Add helper macro to loop e=
ach DSS)
Merging etnaviv/etnaviv/next (b735ee173f84 drm/etnaviv: Restore some id val=
ues)
Merging fbdev/for-next (72fee6b0a3a4 fbdev: Restrict FB_SH_MOBILE_LCDC to S=
uperH)
Merging regmap/for-next (62861ddcb27e Merge remote-tracking branch 'regmap/=
for-6.9' into regmap-next)
Merging sound/for-next (a39d51ff1f52 ALSA: usb-audio: Stop parsing channels=
 bits when all channels are found.)
Merging ieee1394/for-next (04f082d39b99 firewire: core: fix build failure d=
ue to the caller of fw_csr_string())
Merging sound-asoc/for-next (9846dcc3ccf7 Merge remote-tracking branch 'aso=
c/for-6.8' into asoc-linus)
Merging modules/modules-next (d1909c022173 module: Don't ignore errors from=
 set_memory_XX())
Merging input/next (2d77f70bb718 Input: imagis - add touch key support)
Merging block/for-next (d5ba465eb78b Merge branch 'io_uring-6.9' into for-n=
ext)
Merging device-mapper/for-next (61387b8dcf1d Merge tag 'for-6.9/dm-vdo' of =
git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging libata/for-next (c1bc6ed01c16 Merge remote-tracking branch 'libata/=
for-6.9' into HEAD)
Merging pcmcia/pcmcia-next (ccae53aa8aa2 pcmcia: cs: make pcmcia_socket_cla=
ss constant)
Merging mmc/next (faf3b8014c35 mmc: core: make mmc_host_class constant)
Merging mfd/for-mfd-next (78334c343bef mfd: cs42l43: Fix wrong GPIO_FN_SEL =
and SPI_CLK_CONFIG1 defaults)
Merging backlight/for-backlight-next (b49c1caca529 backlight: pandora_bl: D=
rop unneeded ENOMEM error message)
Merging battery/for-next (4e61f1e9d58f power: supply: core: fix charge_beha=
viour formatting)
Merging regulator/for-next (a1f9fa6fcbb3 Merge remote-tracking branch 'regu=
lator/for-6.8' into regulator-linus)
Merging security/next (8f49397828ee Automated merge of 'dev' into 'next')
Merging apparmor/apparmor-next (8ead196be219 apparmor: Fix memory leak in u=
npack_profile())
Merging integrity/next-integrity (85445b964290 integrity: eliminate unneces=
sary "Problem loading X.509 certificate" msg)
Merging selinux/next (a1fc79343abb selinux: fix style issues in security/se=
linux/ss/symtab.c)
Merging smack/next (69b6d71052b5 Smack: use init_task_smack() in smack_cred=
_transfer())
Merging tomoyo/master (0bb80ecc33a8 Linux 6.6-rc1)
Merging tpmdd/next (6fa6b796e037 tpm: tis_i2c: Add compatible string nuvoto=
n,npct75x)
Merging watchdog/master (6fe5aabf7fc6 watchdog: intel-mid_wdt: Get platform=
 data via dev_get_platdata())
Merging iommu/next (f379a7e9c3b5 Merge branches 'arm/mediatek', 'arm/renesa=
s', 'arm/smmu', 'x86/vt-d', 'x86/amd' and 'core' into next)
Merging audit/next (aa13b709084a audit: use KMEM_CACHE() instead of kmem_ca=
che_create())
Merging devicetree/for-next (2056b282ad19 of: unittest: Use for_each_child_=
of_node_scoped())
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/tri=
vial-devices.yaml
Merging dt-krzk/for-next (8c82b4eef297 ARM: dts: sti: minor whitespace clea=
nup around '=3D')
Merging mailbox/for-next (8df6bab6cb9a mailbox: imx: support i.MX95 Generic=
/ELE/V2X MU)
Merging spi/for-next (bd7e6fe2078e Merge remote-tracking branch 'spi/for-6.=
8' into spi-linus)
Merging tip/master (9ed4a756ed3a Merge branch into tip/master: 'x86/build')
Merging clockevents/timers/drivers/next (8248ca30ef89 clocksource/drivers/t=
imer-riscv: Clear timer interrupt on timer initialization)
Merging edac/edac-for-next (fc8235a79d73 Merge ras/edac-misc into for-next)
Merging ftrace/for-next (a641f0533adb tracing: Decrement the snapshot if th=
e snapshot trigger fails to register)
Merging rcu/rcu/next (3add00be5fe5 Merge branches 'rcu-doc.2024.02.14a', 'r=
cu-nocb.2024.02.14a', 'rcu-exp.2024.02.14a', 'rcu-tasks.2024.02.26a' and 'r=
cu-misc.2024.02.14a' into rcu.2024.02.26a)
Merging kvm/next (7d8942d8e738 Merge tag 'kvm-x86-guest_memfd_fixes-6.8' of=
 https://github.com/kvm-x86/linux into HEAD)
CONFLICT (content): Merge conflict in arch/loongarch/Kconfig
Merging kvm-arm/next (4a09ddb8333a Merge branch kvm-arm64/kerneldoc into kv=
marm/next)
CONFLICT (content): Merge conflict in arch/arm64/include/asm/kvm_arm.h
CONFLICT (content): Merge conflict in arch/arm64/kernel/cpufeature.c
Applying: fix up for "arm64/sysreg: Add register fields for ID_AA64DFR1_EL1"
Merging kvms390/next (00de073e2420 KVM: s390: selftest: memop: Fix undefine=
d behavior)
Merging kvm-ppc/topic/ppc-kvm (41bccc98fb79 Linux 6.8-rc2)
Merging kvm-riscv/riscv_kvm_next (d8c0831348e7 KVM: riscv: selftests: Add Z=
acas extension to get-reg-list test)
CONFLICT (content): Merge conflict in tools/testing/selftests/kvm/Makefile
Merging kvm-x86/next (964d0c614c7f Merge branch 'hyperv')
CONFLICT (content): Merge conflict in arch/x86/kvm/svm/sev.c
CONFLICT (content): Merge conflict in tools/testing/selftests/kvm/include/k=
vm_util_base.h
Merging xen-tip/linux-next (38620fc4e893 x86/xen: attempt to inflate the me=
mory balloon on PVH)
Merging percpu/for-next (2d9ad81ef935 Merge branch 'for-6.8-fixes' into for=
-next)
Merging workqueues/for-next (b111131e3ec7 Merge branch 'for-6.9' into for-n=
ext)
Merging drivers-x86/for-next (16f8091b4917 platform/x86/intel/pmc: Improve =
PKGC residency counters debug)
Merging chrome-platform/for-next (6613476e225e Linux 6.8-rc1)
Merging chrome-platform-firmware/for-firmware-next (8a0a62941a04 firmware: =
coreboot: Replace tag with id table in driver struct)
Merging hsi/for-next (3693760295e8 HSI: ssi_protocol: fix struct members ke=
rnel-doc warnings)
Merging leds-lj/for-leds-next (45066c4bbe8c leds: ncp5623: Add MS suffix to=
 time defines)
Merging ipmi/for-next (296455ade1fd Merge tag 'char-misc-6.8-rc1' of git://=
git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc)
Merging driver-core/driver-core-next (6aeb8850e0f3 device: core: Log warnin=
g for devices pending deferred probe on timeout)
Merging usb/usb-next (d99e42ce6b83 Merge tag 'usb-serial-6.9-rc1' of https:=
//git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/reg=
ulator/qcom,usb-vbus-regulator.yaml
Merging thunderbolt/next (b8a730836c6b thunderbolt: Constify the struct dev=
ice_type usage)
Merging usb-serial/usb-next (b1a8da9ff139 USB: serial: cp210x: add pid/vid =
for TDK NC0110013M and MM0110113M)
Merging tty/tty-next (d6c0d892b44c dt-bindings: serial: stm32: add power-do=
mains property)
Merging char-misc/char-misc-next (367b3560e10b binder: remove redundant var=
iable page_addr)
Merging accel/habanalabs-next (576d7cc5a9e2 accel: constify the struct devi=
ce_type usage)
Merging coresight/next (a4f3057d19ff coresight-tpda: Change qcom,dsb-elemen=
t-size to qcom,dsb-elem-bits)
Merging fastrpc/for-next (6613476e225e Linux 6.8-rc1)
Merging fpga/for-next (b1a91ca25f15 fpga: remove redundant checks for bridg=
e ops)
Merging icc/icc-next (7af14fe58e5e Merge branch 'icc-fixes' into icc-next)
Merging iio/togreg (a696ab17dafe Merge branch 'togreg-cleanup' into HEAD)
Merging phy-next/next (00ca8a15dafa phy: constify of_phandle_args in xlate)
CONFLICT (content): Merge conflict in drivers/phy/qualcomm/phy-qcom-qmp-usb=
.c
Merging soundwire/next (e17aae16acf5 soundwire: Use snd_soc_substream_to_rt=
d() to obtain rtd)
Merging extcon/extcon-next (abe83c4e5e4f extcon: realtek: Remove unused of_=
gpio.h)
Merging gnss/gnss-next (54be6c6c5ae8 Linux 6.8-rc3)
Merging vfio/next (7447d911af69 vfio/fsl-mc: Block calling interrupt handle=
r without trigger)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging w1/for-next (d97d263132a6 w1: w1-gpio: Convert to platform remove c=
allback returning void)
Merging spmi/spmi-next (b85ea95d0864 Linux 6.7-rc1)
Merging staging/staging-next (68bb540b1aef staging: greybus: Replaces direc=
tive __attribute__((packed)) by __packed as suggested by checkpatch)
Merging counter-next/counter-next (d5b71a36a6af MAINTAINERS: Update email a=
ddresses for William Breathitt Gray)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (44c026a73be8 Linux 6.4-rc3)
Merging dmaengine/next (716141d366f4 dmaengine: of: constify of_phandle_arg=
s in of_dma_find_controller())
Merging cgroup/for-next (13eb1d6e1cfc Merge branch 'for-6.8-fixes' into for=
-next)
Merging scsi/for-next (7b020ab8a009 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (52d8210ea45d Merge patch series "Update lpfc to =
revision 14.4.0.1")
Merging vhost/linux-next (ac20046227aa virtio-net: add cond_resched() to th=
e command waiting loop)
Merging rpmsg/for-next (929654e8f1ad Merge branches 'rpmsg-next' and 'rproc=
-next' into for-next)
CONFLICT (content): Merge conflict in drivers/remoteproc/imx_dsp_rproc.c
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (8636f19c2d1f gpio: sysfs: repair export re=
turning -EPERM on 1st attempt)
Merging gpio-intel/for-next (6613476e225e Linux 6.8-rc1)
Merging pinctrl/for-next (34675dc3a7c6 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (6613476e225e Linux 6.8-rc1)
Merging pinctrl-renesas/renesas-pinctrl (a6f06b909fee pinctrl: renesas: All=
ow the compiler to optimize away sh_pfc_pm)
Merging pinctrl-samsung/for-next (6613476e225e Linux 6.8-rc1)
Merging pwm/pwm/for-next (dd6c6d57ab61 pwm: imx-tpm: fix probe crash due to=
 access registers without clock)
Merging ktest/for-next (7dc8e24f0e09 ktest: Restore stty setting at first i=
n dodie)
Merging kselftest/next (5d94da7ff00e kselftest: Add basic test for probing =
the rust sample modules)
Merging kunit/test (6613476e225e Linux 6.8-rc1)
Merging kunit-next/kunit (806cb2270237 kunit: Annotate _MSG assertion varia=
nts with gnu printf specifiers)
Merging livepatching/for-next (602bf1830798 Merge branch 'for-6.7' into for=
-next)
Merging rtc/rtc-next (f0109900462d dt-bindings: rtc: zynqmp: Add support fo=
r Versal/Versal NET SoCs)
Merging nvdimm/libnvdimm-for-next (d9212b35da52 dax: remove SLAB_MEM_SPREAD=
 flag usage)
CONFLICT (content): Merge conflict in drivers/dax/super.c
Merging at24/at24/for-next (6613476e225e Linux 6.8-rc1)
Merging ntb/ntb-next (9341b37ec17a ntb_perf: Fix printk format)
Merging seccomp/for-next/seccomp (56af94aace8a samples: user-trap: fix stri=
ct-aliasing warning)
Merging fsi/next (c5eeb63edac9 fsi: Fix panic on scom file read)
Merging slimbus/for-next (6613476e225e Linux 6.8-rc1)
Merging nvmem/for-next (6613476e225e Linux 6.8-rc1)
Merging xarray/main (2a15de80dd0f idr: fix param name in idr_alloc_cyclic()=
 doc)
Merging hyperv/hyperv-next (2a07badb654a hv: vmbus: Convert to platform rem=
ove callback returning void)
Merging auxdisplay/for-next (5d9e12972259 auxdisplay: img-ascii-lcd: Conver=
t to platform remove callback returning void)
Merging kgdb/kgdb/for-next (4f41d30cd6dc kdb: Fix a potential buffer overfl=
ow in kdb_local())
Merging hmm/hmm (6613476e225e Linux 6.8-rc1)
Merging cfi/cfi/next (06c2afb862f9 Linux 6.5-rc1)
Merging mhi/mhi-next (2ec11b5d6d90 bus: mhi: host: pci_generic: constify mo=
dem_telit_fn980_hw_v1_config)
Merging memblock/for-next (2159bd4e9057 memblock: Return NUMA_NO_NODE inste=
ad of -1 to improve code readability)
Merging cxl/next (88482878c3b4 Merge branch 'for-6.9/cxl-fixes' into for-6.=
9/cxl)
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (021bc4b9d7ed virt: efi_secret: Convert to platform remove=
 callback returning void)
Merging unicode/for-next (0131c1f3cce7 unicode: make utf8 test count static)
Merging slab/slab/for-next (78e2606d5f55 Merge branch 'slab/for-6.9/slab-fl=
ag-cleanups' into slab/for-next)
Merging random/master (1f719a2f3fa6 Merge tag 'net-6.8-rc4' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/netdev/net)
Merging landlock/next (a17c60e533f5 samples/landlock: Don't error out if a =
file path cannot be opened)
Merging rust/rust-next (768409cff6cc rust: upgrade to Rust 1.76.0)
Merging sysctl/sysctl-next (4f1136a55dc8 scripts: check-sysctl-docs: handle=
 per-namespace sysctls)
Merging execve/for-next/execve (ab3bb12022d6 selftests/exec: execveat: Impr=
ove debug reporting)
Merging bitmap/bitmap-for-next (fd8ed16c2419 bitmap: Step down as a reviewe=
r)
Merging hte/for-next (b85ea95d0864 Linux 6.7-rc1)
Merging kspp/for-next/kspp (2a991a90c830 arch/Kconfig: eliminate needless U=
TF-8 character in Kconfig help)
Merging kspp-gustavo/for-next/kspp (6613476e225e Linux 6.8-rc1)
Merging nolibc/nolibc (6613476e225e Linux 6.8-rc1)
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (6613476e225e Linux 6.8-rc1)
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)

--Sig_/4P+j1a2mAr5vbOXc1wf7Gn5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmXzuyMACgkQAVBC80lX
0Gxqywf9GSQMfYn2udIoyIaZb7Eru5lDShnFtAAeHm1Z4oXfiVsblk+crKZRKyqK
7A63CqWh0o6Vj6YrxIpqmgwb2n5luCVynoQ9ccRKDkhVsa2+/WohOw6abUgBkFzn
xTpX1bQZI6Hhr7fbHYloaHsMAIAjJFtT2HnbyVbFXIpzcgx+yp1+H0TUBWWUug1e
VJOu36NYrjCJ/xKd7E5qlFLGlANzyA+c6ii3Mpd8pfcifhE4DDY6UvlcUimih5hM
8r4XigC23NJyGWS4gYOVxQgz3zEOSAcpfnQTezAlPeYccKMZ06jiAGEwHvhiozF7
jvGQoiQlBJSstpMa3s7MsIh3K1o4Nw==
=z2bI
-----END PGP SIGNATURE-----

--Sig_/4P+j1a2mAr5vbOXc1wf7Gn5--

