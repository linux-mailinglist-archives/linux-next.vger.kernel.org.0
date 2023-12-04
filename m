Return-Path: <linux-next+bounces-213-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 250DC802B22
	for <lists+linux-next@lfdr.de>; Mon,  4 Dec 2023 05:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC2D4280C7F
	for <lists+linux-next@lfdr.de>; Mon,  4 Dec 2023 04:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0EBB15A4;
	Mon,  4 Dec 2023 04:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rufGYwfW"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9D0EE6;
	Sun,  3 Dec 2023 20:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701665870;
	bh=MTtLMkCrG4lhStFkvHOxbJXlmMO/Ua7sRSbz3o8oqUs=;
	h=Date:From:To:Cc:Subject:From;
	b=rufGYwfWivtMSRh42/GEAuzDg2RwbasSSjfOGHZ48O5xizc9pU4HGfq1HE6dDXu/A
	 4nlpoBNG85n0QFHvuVM+iBdZJDPDbA8GjIYCRftzrr77SlPGKJ7O8MDraGpH0uaZCI
	 yOuaL8OuDlItEDGdpUCtRjM7dAimLt+huw5k3CxwY2Ds1pxHs7UrkUv0uiEKU08tb0
	 sWWBidHqrV988PiIpDAhmqW34Ixt/cxCz+FAI0gkRp0lb8RNTE1qfQxTJ6lqsuGrKO
	 3gEQOXy5qw5AeY4uaTVC/pCJwTmtgh+7DRNBreVNlX6mXNAlUBd1QRZlF8nJqsAy8n
	 3Pc1PYOohdpsA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SkBHf4KtXz4xTx;
	Mon,  4 Dec 2023 15:57:50 +1100 (AEDT)
Date: Mon, 4 Dec 2023 15:57:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Dec 4
Message-ID: <20231204155749.492521bf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//+HBINEtyt=rzRwxBkx_1iw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//+HBINEtyt=rzRwxBkx_1iw
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20231201:

The mm tree lost its build failure.

The qcom tree gained conflicts and a semantic conflict against the arm-soc
tree and a build failure, so I used the version from next-20231201.

The scmi tree lost its build failure.

The vfs-brauner tree gained a conflict against Linus' tree.

The security tree gained a conflict against the block tree.

The drivers-x86 tree gained a conflict against the hwmon-staging tree.

Non-merge commits (relative to Linus' tree): 4017
 4553 files changed, 180457 insertions(+), 114531 deletions(-)

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

I am currently merging 369 trees (counting Linus' and 105 trees of bug
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
Merging origin/master (33cc938e65a9 Linux 6.7-rc4)
Merging fixes/fixes (2dde18cd1d8f Linux 6.5)
Merging mm-hotfixes/mm-hotfixes-unstable (b9c23d24f753 kexec: select CRYPTO=
 from KEXEC_FILE instead of depending on it)
Merging kbuild-current/fixes (98b1cc82c4af Linux 6.7-rc2)
Merging arc-current/for-curr (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm-current/fixes (2dde18cd1d8f Linux 6.5)
Merging arm64-fixes/for-next/fixes (f5259997f3e8 arm64: Avoid enabling KPTI=
 unnecessarily)
Merging arm-soc-fixes/arm/fixes (736a4aad8a9f Merge tag 'renesas-fixes-for-=
v6.6-tag3' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel into arm/fixes)
Merging davinci-current/davinci/for-current (06c2afb862f9 Linux 6.5-rc1)
Merging drivers-memory-fixes/fixes (b85ea95d0864 Linux 6.7-rc1)
Merging tee-fixes/fixes (ceaa837f96ad Linux 6.2-rc8)
Merging m68k-current/for-linus (03191fb3db3d m68k: lib: Include <linux/libg=
cc.h> for __muldi3())
Merging powerpc-fixes/fixes (dc158d23b33d KVM: PPC: Book3S HV: Fix KVM_RUN =
clobbering FP/VEC user registers)
Merging s390-fixes/fixes (aab1f809d754 scripts/checkstack.pl: match all sta=
ck sizes for s390)
Merging sparc/master (2d2b17d08bfc sparc: Unbreak the build)
Merging fscrypt-current/for-current (4bcf6f827a79 fscrypt: check for NULL k=
eyring in fscrypt_put_master_key_activeref())
Merging fsverity-current/for-current (a075bacde257 fsverity: don't drop pag=
ecache at end of FS_IOC_ENABLE_VERITY)
Merging net/main (4b0768b6556a r8169: fix rtl8125b PAUSE frames blasting wh=
en suspended)
Merging bpf/master (dfce9cb31405 bpf: Fix a verifier bug due to incorrect b=
ranch offset comparison with cpu=3Dv4)
Merging ipsec/master (76df934c6d5f MAINTAINERS: Add netdev subsystem profil=
e link)
Merging netfilter/main (54d4434da824 Merge branch 'hv_netvsc-fix-race-of-ne=
tvsc-vf-register-and-slave-bit')
Merging ipvs/main (54d4434da824 Merge branch 'hv_netvsc-fix-race-of-netvsc-=
vf-register-and-slave-bit')
Merging wireless/for-next (91fdb30ddfdb net: libwx: fix memory leak on msix=
 entry)
Merging wpan/master (2d1c882d4434 Merge tag 'mlx5-fixes-2023-10-12' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/saeed/linux)
Merging rdma-fixes/for-rc (2b78832f50c4 RDMA/irdma: Fix UAF in irdma_sc_ccq=
_get_cqe_info())
Merging sound-current/for-linus (a337c355719c ALSA: hda: Disable power-save=
 on KONTRON SinglePC)
Merging sound-asoc-fixes/for-linus (c7095d154ddf ASoC: SOF: ipc4-topology: =
Correct data structures for the GAIN module)
Merging regmap-fixes/for-linus (b85ea95d0864 Linux 6.7-rc1)
Merging regulator-fixes/for-linus (b85ea95d0864 Linux 6.7-rc1)
Merging spi-fixes/for-linus (b85ea95d0864 Linux 6.7-rc1)
Merging pci-current/for-linus (b85ea95d0864 Linux 6.7-rc1)
Merging driver-core.current/driver-core-linus (2cc14f52aeb7 Linux 6.7-rc3)
Merging tty.current/tty-linus (58ac1b379979 ARM: PL011: Fix DMA support)
Merging usb.current/usb-linus (2cc14f52aeb7 Linux 6.7-rc3)
Merging usb-serial-fixes/usb-linus (2cc14f52aeb7 Linux 6.7-rc3)
Merging phy/fixes (2a9c713825b3 phy: sunplus: return negative error code in=
 sp_usb_phy_probe)
Merging staging.current/staging-linus (98b1cc82c4af Linux 6.7-rc2)
Merging iio-fixes/fixes-togreg (1cd2fe4fd63e iio: imu: adis16475: use bit n=
umbers in assign_bit())
Merging counter-current/counter-current (58720809f527 Linux 6.6-rc6)
Merging char-misc.current/char-misc-linus (af54d778a038 devcoredump: Send u=
event once devcd is ready)
Merging soundwire-fixes/fixes (393cae5f32d6 soundwire: intel_ace2x: fix AC =
timing setting for ACE2.x)
Merging thunderbolt-fixes/fixes (ac43c9122e42 thunderbolt: Fix memory leak =
in margining_port_remove())
Merging input-current/for-linus (42b8ff477202 Input: amimouse - convert to =
platform remove callback returning void)
Merging crypto-current/master (9aedd10fe384 crypto: ahash - Set using_shash=
 for cloned ahash wrapper over shash)
Merging vfio-fixes/for-linus (4ea95c04fa6b vfio: Drop vfio_file_iommu_group=
() stub to fudge around a KVM wart)
Merging kselftest-fixes/fixes (b85ea95d0864 Linux 6.7-rc1)
Merging modules-fixes/modules-linus (f412eef03938 Documentation: livepatch:=
 module-elf-format: Remove local klp_modinfo definition)
Merging dmaengine-fixes/fixes (54bed6bafa0f dmaengine: stm32-dma: avoid bit=
field overflow assertion)
Merging backlight-fixes/for-backlight-fixes (88603b6dc419 Linux 6.2-rc2)
Merging mtd-fixes/mtd/fixes (7c1b1906229d mtd: spinand: gigadevice: Fix the=
 get ecc status issue)
Merging mfd-fixes/for-mfd-fixes (88603b6dc419 Linux 6.2-rc2)
Merging v4l-dvb-fixes/fixes (32138be394e5 Merge tag 'media-renesas-fixes-20=
231113' of git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.gi=
t)
Merging reset-fixes/reset/fixes (4a6756f56bcf reset: Fix crash when freeing=
 non-existent optional resets)
Merging mips-fixes/mips-fixes (2cc14f52aeb7 Linux 6.7-rc3)
Merging at91-fixes/at91-fixes (b85ea95d0864 Linux 6.7-rc1)
Merging omap-fixes/fixes (c72b9c33ef96 ARM: OMAP2+: Fix null pointer derefe=
rence and memory leak in omap_soc_device_init)
Merging kvm-fixes/master (ffc253263a13 Linux 6.6)
Merging kvms390-fixes/master (27072b8e18a7 KVM: s390/mm: Properly reset no-=
dat)
Merging hwmon-fixes/hwmon (35fe2ad259a3 hwmon: (nzxt-kraken2) Fix error han=
dling path in kraken2_probe())
Merging nvdimm-fixes/libnvdimm-fixes (33908660e814 ACPI: NFIT: Fix incorrec=
t calculation of idt size)
Merging cxl-fixes/fixes (8f61d48c83f6 tools/testing/cxl: Slow down the mock=
 firmware transfer)
Merging btrfs-fixes/next-fixes (1472b846cf93 Merge branch 'misc-6.7' into n=
ext-fixes)
Merging vfs-fixes/fixes (dc32464a5fe4 ceph_wait_on_conflict_unlink(): grab =
reference before dropping ->d_lock)
Merging dma-mapping-fixes/for-linus (d5090484b021 swiotlb: do not try to al=
locate a TLB bigger than MAX_ORDER pages)
Merging drivers-x86-fixes/fixes (fb103b90e944 platform/x86: asus-wmi: Filte=
r Volume key presses if also reported via atkbd)
Merging samsung-krzk-fixes/fixes (b85ea95d0864 Linux 6.7-rc1)
Merging pinctrl-samsung-fixes/fixes (b85ea95d0864 Linux 6.7-rc1)
Merging devicetree-fixes/dt/linus (d79972789d17 of: dynamic: Fix of_reconfi=
g_get_state_change() return value documentation)
Merging dt-krzk-fixes/fixes (b85ea95d0864 Linux 6.7-rc1)
Merging scsi-fixes/fixes (b09d7f8fd50f scsi: sd: Fix system start for ATA d=
evices)
Merging drm-fixes/drm-fixes (908f60642441 Merge tag 'amd-drm-fixes-6.7-2023=
-11-30' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (96d7e7940136 drm/i915: Check =
pipe active state in {planes,vrr}_{enabling,disabling}())
Merging mmc-fixes/fixes (477865af60b2 mmc: sdhci-sprd: Fix vqmmc not shutti=
ng down after the card was pulled)
Merging rtc-fixes/rtc-fixes (08279468a294 rtc: sunplus: fix format string f=
or printing resource)
Merging gnss-fixes/gnss-linus (98b1cc82c4af Linux 6.7-rc2)
Merging hyperv-fixes/hyperv-fixes (18286883e779 x86/hyperv: Use atomic_try_=
cmpxchg() to micro-optimize hv_nmi_unknown())
Merging soc-fsl-fixes/fix (06c2afb862f9 Linux 6.5-rc1)
Merging risc-v-fixes/fixes (3ca112b71f35 Merge tag 'probes-fixes-v6.7-rc1' =
of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace)
Merging riscv-dt-fixes/riscv-dt-fixes (79997eda0d31 riscv: dts: microchip: =
move timebase-frequency to mpfs.dtsi)
Merging riscv-soc-fixes/riscv-soc-fixes (b85ea95d0864 Linux 6.7-rc1)
Merging fpga-fixes/fixes (b85ea95d0864 Linux 6.7-rc1)
Merging spdx/spdx-linus (2cc14f52aeb7 Linux 6.7-rc3)
Merging gpio-brgl-fixes/gpio/for-current (95dd1e34ff5b gpiolib: sysfs: Fix =
error handling on failed export)
Merging gpio-intel-fixes/fixes (b85ea95d0864 Linux 6.7-rc1)
Merging pinctrl-intel-fixes/fixes (b85ea95d0864 Linux 6.7-rc1)
Merging erofs-fixes/fixes (62b241efff99 MAINTAINERS: erofs: add EROFS webpa=
ge)
Merging kunit-fixes/kunit-fixes (1bddcf77ce66 kunit: test: Avoid cast warni=
ng when adding kfree() as an action)
Merging ubifs-fixes/fixes (2241ab53cbb5 Linux 6.2-rc5)
Merging memblock-fixes/fixes (55122e0130e5 memblock tests: fix warning =E2=
=80=98struct seq_file=E2=80=99 declared inside parameter list)
Merging nfsd-fixes/nfsd-fixes (bf51c52a1f3c NFSD: Fix checksum mismatches i=
n the duplicate reply cache)
Merging irqchip-fixes/irq/irqchip-fixes (b673fe1a6229 MAINTAINERS: Remove m=
yself from the general IRQ subsystem maintenance)
Merging renesas-fixes/fixes (9eab43facdad soc: renesas: ARCH_R9A07G043 depe=
nds on !RISCV_ISA_ZICBOM)
Merging broadcom-fixes/fixes (9abf2313adc1 Linux 6.1-rc1)
Merging perf-current/perf-tools (57686a72da08 tools: Disable __packed attri=
bute compiler warning due to -Werror=3Dattributes)
Merging efi-fixes/urgent (01b1e3ca0e5c efi/unaccepted: Fix off-by-one when =
checking for overlapping ranges)
Merging zstd-fixes/zstd-linus (77618db34645 zstd: Fix array-index-out-of-bo=
unds UBSAN warning)
Merging battery-fixes/fixes (f37669119423 power: supply: cw2015: correct ti=
me_to_empty units in sysfs)
Merging uml-fixes/fixes (73a23d771033 um: harddog: fix modular build)
Merging asahi-soc-fixes/asahi-soc/fixes (568035b01cfb Linux 6.0-rc1)
Merging iommufd-fixes/for-rc (6f9c4d8c468c iommufd: Do not UAF during iommu=
fd_put_object())
Merging rust-fixes/rust-fixes (cfd96726e611 rust: docs: fix logo replacemen=
t)
Merging v9fs-fixes/fixes/next (2dde18cd1d8f Linux 6.5)
Merging w1-fixes/fixes (b85ea95d0864 Linux 6.7-rc1)
Merging pmdomain-fixes/fixes (0cb19e50a911 pmdomain: arm: Avoid polling for=
 scmi_perf_domain)
Merging overlayfs-fixes/ovl-fixes (37f32f526438 ovl: fix memory leak in ovl=
_parse_param())
Merging drm-misc-fixes/for-linux-next-fixes (64111a0e22a9 drm/panfrost: Fix=
 incorrect updating of current device frequency)
Merging mm-stable/mm-stable (5b7ad877e4d8 Merge tag 'afs-fixes-20231124' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs)
Merging mm-nonmm-stable/mm-nonmm-stable (5b7ad877e4d8 Merge tag 'afs-fixes-=
20231124' of git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-f=
s)
Merging mm/mm-everything (b5614a55f1c5 Merge branch 'mm-nonmm-unstable' int=
o mm-everything)
Merging kbuild/for-next (6262afa10ef7 kconfig: default to zero if int/hex s=
ymbol lacks default property)
Merging clang-format/clang-format (5d0c230f1de8 Linux 6.5-rc4)
Merging perf/perf-tools-next (72a2a0a494ec perf test record+probe_libc_inet=
_pton: Fix call chain match on powerpc)
CONFLICT (content): Merge conflict in tools/perf/Makefile.perf
Merging compiler-attributes/compiler-attributes (5d0c230f1de8 Linux 6.5-rc4)
Merging dma-mapping/for-next (53c87e846e33 swiotlb: fix out-of-bounds TLB a=
llocations with CONFIG_SWIOTLB_DYNAMIC)
Merging asm-generic/master (0734f5c7eb15 Merge branch 'asm-generic-prototyp=
es' into asm-generic)
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (c7368ddba2ff ARM: 9326/1: make <linux/uaccess.h> self=
-contained for ARM)
Merging arm64/for-next/core (2cc14f52aeb7 Linux 6.7-rc3)
Merging arm-perf/for-next/perf (b805cafc604b perf: hisi: Fix use-after-free=
 when register pmu fails)
Merging arm-soc/for-next (1b52f65d88ad Merge branch 'soc/defconfig' into fo=
r-next)
Merging amlogic/for-next (093098370b46 Merge branch 'v6.8/arm64-dt' into fo=
r-next)
Merging asahi-soc/asahi-soc/for-next (ffc253263a13 Linux 6.6)
Merging aspeed/for-next (e9be9b34b841 ARM: dts: aspeed: Add ASRock E3C256D4=
I BMC)
Merging at91/at91-next (b766b70117ac Merge branch 'at91-dt' into at91-next)
Merging broadcom/next (62a3c97f8167 Merge branch 'devicetree/next' into nex=
t)
Merging davinci/davinci/for-next (06c2afb862f9 Linux 6.5-rc1)
Merging drivers-memory/for-next (0d6c918011ce memory: tegra: Skip SID progr=
amming if SID registers aren't set)
Merging imx-mxs/for-next (258bebe27695 Merge branch 'imx/dt64' into for-nex=
t)
Merging mediatek/for-next (9802b60bd6d8 Merge branch 'v6.6-next/soc' into f=
or-next)
Merging mvebu/for-next (93e6b023e552 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (0ea5e8402a47 Merge branches 'omap-for-v6.8/dt', 'oma=
p-for-v6.8/defconfig' and 'omap-for-v6.8/maintainers' into for-next)
Merging qcom/for-next (826c7a47ad68 Merge branches 'arm32-for-6.8', 'arm64-=
for-6.8', 'clk-for-6.8', 'drivers-fixes-for-6.7' and 'drivers-for-6.8' into=
 for-next)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/qcom/Makefile
CONFLICT (content): Merge conflict in arch/arm/boot/dts/qcom/qcom-msm8974.d=
tsi
$ git reset --hard HEAD^
Merging next-20231201 version of qcom
Merging renesas/next (a89ef75a0104 Merge branch 'renesas-dts-for-v6.8' into=
 renesas-next)
Merging reset/reset/next (c3c46acd5be9 dt-bindings: reset: hisilicon,hi3660=
-reset: Drop providers and consumers from example)
Merging rockchip/for-next (9ca47184fa65 Merge branch 'v6.8-armsoc/dts32' in=
to for-next)
Merging samsung-krzk/for-next (64041620130c Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (74e9faf5b501 Merge branches 'for-next/scmi/fix=
es' and 'for-next/scmi/updates' of git://git.kernel.org/pub/scm/linux/kerne=
l/git/sudeep.holla/linux into for-linux-next)
Merging stm32/stm32-next (9a7308232a11 ARM: dts: stm32: add SPI support on =
STM32F746)
Merging sunxi/sunxi/for-next (715a9e70bdd4 Merge branch 'sunxi/clk-for-6.8'=
 into sunxi/for-next)
Merging tee/next (352b5f33b950 Merge branch 'ffa_notif_for_v6.8' into next)
Merging tegra/for-next (650220c2b474 Merge branch for-6.7/arm64/dt into for=
-next)
Merging ti/ti-next (b98136714a9c Merge branch 'ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (1d4723dec415 Merge branch 'zynqmp/soc' into for-ne=
xt)
Merging clk/clk-next (b85ea95d0864 Linux 6.7-rc1)
Merging clk-imx/for-next (b85ea95d0864 Linux 6.7-rc1)
Merging clk-renesas/renesas-clk (5f9e29b9159a clk: renesas: rzg2l-cpg: Reus=
e code in rzg2l_cpg_reset())
Merging csky/linux-next (2c40c1c6adab Merge tag 'usb-6.7-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging loongarch/loongarch-next (c517fd2738f4 Docs/zh_CN/LoongArch: Update=
 links in LoongArch introduction.rst)
Merging m68k/for-next (03191fb3db3d m68k: lib: Include <linux/libgcc.h> for=
 __muldi3())
Merging m68knommu/for-next (2cc14f52aeb7 Linux 6.7-rc3)
Merging microblaze/next (ffb0399437ef microblaze: defconfig: Enable the Mar=
vell phy driver)
Merging mips/mips-next (2cc14f52aeb7 Linux 6.7-rc3)
Merging openrisc/for-next (c289330331eb openrisc: Remove kernel-doc marker =
from ioremap comment)
Merging parisc-hd/for-next (487635756198 parisc: Fix asm operand number out=
 of range build error in bug table)
Merging powerpc/next (ede66cd22441 powerpc/64s: Fix CONFIG_NUMA=3Dn build d=
ue to create_section_mapping())
Merging soc-fsl/next (fb9c384625dd bus: fsl-mc: fsl-mc-allocator: Drop a wr=
ite-only variable)
Merging risc-v/for-next (3ca112b71f35 Merge tag 'probes-fixes-v6.7-rc1' of =
git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace)
Merging riscv-dt/riscv-dt-for-next (637cb4b61b01 Merge patch series "Add Hu=
ashan Pi board support")
CONFLICT (content): Merge conflict in arch/riscv/boot/dts/sophgo/cv1800b.dt=
si
Applying: fixup for "riscv: dts: sophgo: Separate compatible specific for C=
V1800B soc"
Merging riscv-soc/riscv-soc-for-next (94f4018bc9f3 Merge branch 'riscv-cach=
e-for-next' into riscv-soc-for-next)
Merging s390/for-next (99babaaa23b2 Merge branch 'features' into for-next)
Merging sh/for-next (b85ea95d0864 Linux 6.7-rc1)
Merging uml/next (974b808d85ab um: virt-pci: fix missing declaration warnin=
g)
Merging xtensa/xtensa-for-next (791beae7335c xtensa: Use PCI_HEADER_TYPE_MF=
D instead of literal)
Merging bcachefs/for-next (f5c63f6e35e0 bcachefs: Remove obsolete comment a=
bout zstd)
Merging pidfd/for-next (a901a3568fd2 Merge tag 'iomap-6.5-merge-1' of git:/=
/git.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging fscrypt/for-next (15baf55481de fscrypt: track master key presence s=
eparately from secret)
Merging afs/afs-next (0a278bc196e7 afs: Automatically generate trace tag en=
ums)
Merging btrfs/for-next (6d3880a76eed Merge branch 'for-next-next-v6.7-20231=
129' into for-next-20231129)
Merging ceph/master (d30d7c57a64d ceph: select FS_ENCRYPTION_ALGS if FS_ENC=
RYPTION)
Merging cifs/for-next (12572fc09203 smb: client: Fix minor whitespace error=
s and warnings)
Merging configfs/for-next (4425c1d9b44d configfs: improve item creation per=
formance)
Merging ecryptfs/next (a3d78fe3e1ae fs: ecryptfs: comment typo fix)
Merging erofs/dev (8f146316b1dd erofs: fix memory leak on short-lived bounc=
ed pages)
Merging exfat/dev (1373ca10ec04 exfat: fix ctime is not updated)
Merging ext3/for_next (301846bb8c88 Merge fanotify fsid changes from Amir.)
Merging ext4/dev (619f75dae2cf ext4: fix warning in ext4_dio_write_end_io())
Merging f2fs/dev (d346fa09abff f2fs: sysfs: support discard_io_aware)
Merging fsverity/for-next (919dc320956e fsverity: skip PKCS#7 parser when k=
eyring is empty)
Merging fuse/for-next (18437366a3a1 fuse: share lookup state between submou=
nt and its parent)
Merging gfs2/for-next (8d859dc44163 gfs2: Fix inode_go_instantiate descript=
ion)
Merging jfs/jfs-next (cca974daeb6c jfs: fix shift-out-of-bounds in dbJoin)
Merging ksmbd/ksmbd-for-next (df60cee26a2e Merge tag '6.7-rc3-smb3-server-f=
ixes' of git://git.samba.org/ksmbd)
Merging nfs/linux-next (f003a717ae90 nfs: Convert nfs_symlink() to use a fo=
lio)
Merging nfs-anna/linux-next (379e4adfddd6 NFSv4.1: fixup use EXCHGID4_FLAG_=
USE_PNFS_DS for DS server)
Merging nfsd/nfsd-next (1ec134cfd5e2 svcrdma: Clean up locking)
Merging ntfs3/master (ffc253263a13 Linux 6.6)
Merging orangefs/for-next (31720a2b109b orangefs: Fix kmemleak in orangefs_=
{kernel,client}_debug_init())
Merging overlayfs/overlayfs-next (2c3ef4f89ced ovl: initialize ovl_copy_up_=
ctx.destname inside ovl_do_copy_up())
Merging ubifs/next (75690493591f ubifs: ubifs_link: Fix wrong name len calc=
ulating when UBIFS is encrypted)
Merging v9fs/9p-next (34fe67ad7500 9p: prevent read overrun in protocol dum=
p tracepoint)
Merging v9fs-ericvh/ericvh/for-next (2dde18cd1d8f Linux 6.5)
Merging xfs/for-next (9c235dfc3d3f xfs: dquot recovery does not validate th=
e recovered dquot)
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
Merging vfs-brauner/vfs.all (0bcb77184f52 Merge branch 'vfs.fscache' into v=
fs.all)
CONFLICT (content): Merge conflict in fs/btrfs/extent_io.c
CONFLICT (content): Merge conflict in fs/btrfs/subpage.c
CONFLICT (content): Merge conflict in fs/btrfs/super.c
CONFLICT (content): Merge conflict in fs/buffer.c
CONFLICT (content): Merge conflict in include/linux/blk_types.h
Applying: linux-next: manual merge of the vfs-brauner tree with the btrfs t=
ree
Merging vfs/for-next (bbe6a7c899e7 bch2_ioctl_subvolume_destroy(): fix lock=
ing)
Merging printk/for-next (b4908d68609b Merge branch 'for-6.7' into for-next)
Merging pci/next (b8d0cad57d3f Merge branch 'pci/switchtec')
Merging pstore/for-next/pstore (5281ff48b192 Merge branch 'for-linus/pstore=
' into for-next/pstore)
Merging hid/for-next (8674f6b6cdba Merge branch 'for-6.7/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (382561d16854 i2c: ocores: Move system PM hooks to=
 the NOIRQ phase)
Merging i3c/i3c/next (b4da37db3e2c i3c: master: Fix build error)
Merging dmi/dmi-for-next (13a0ac816d22 firmware: dmi: Fortify entry point l=
ength checks)
Merging hwmon-staging/hwmon-next (4aad81fa3af3 dt-bindings: hwmon: Increase=
 max number of io-channels)
Merging jc_docs/docs-next (d254d263f6c8 docs: submitting-patches: improve t=
he base commit explanation)
Merging v4l-dvb/master (a00b3f296eac media: mediatek: vcodec: Set the suppo=
rted vp9 profile for each platform)
Merging v4l-dvb-next/master (3b8551e73271 media: wave5: add OF and V4L_MEM2=
MEM_DRIVERS dependencies)
Merging pm/linux-next (d9670e2b2724 Merge branch 'pm-cpufreq' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (8f96e29aae31 pmdomain: qcom: rp=
mpd: Set GENPD_FLAG_ACTIVE_WAKEUP)
Merging cpupower/cpupower (997bbf2accf6 tools cpupower bench: Override CFLA=
GS assignments)
Merging devfreq/devfreq-next (b85ea95d0864 Linux 6.7-rc1)
Merging pmdomain/next (833811353f70 pmdomain: xilinx/zynqmp: Convert to pla=
tform remove callback returning void)
Merging opp/opp/linux-next (19cc8b1819a4 OPP: Check for invalid OPP in dev_=
pm_opp_find_level_ceil())
Merging thermal/thermal/linux-next (9618efe343ea thermal/qcom/tsens: Drop o=
ps_v0_1)
Merging dlm/next (0c08699744d2 dlm: implement EXPORT_OP_ASYNC_LOCK)
Merging rdma/for-next (50af5d12f7e2 RDMA/IPoIB: Add tx timeout work to reco=
ver queue stop situation)
Merging net-next/main (8470e4368b0f Merge branch 'net-cacheline-optimizatio=
ns')
Merging bpf-next/for-next (90679706d486 Merge branch 'bpf-verifier-retval-l=
ogic-fixes')
Merging ipsec-next/master (aadbd27f9674 net: phy: correctly check soft_rese=
t ret ONLY if defined for PHY)
Merging mlx5-next/mlx5-next (82f9378c443c net/mlx5: Handle IPsec steering u=
pon master unbind/bind)
Merging netfilter-next/main (ac40916a3f72 rtnetlink: introduce nlmsg_new_la=
rge and use it in rtnl_getlink)
Merging ipvs-next/main (ac40916a3f72 rtnetlink: introduce nlmsg_new_large a=
nd use it in rtnl_getlink)
Merging bluetooth/master (ab3d463ded5d Bluetooth: hci_event: shut up a fals=
e-positive warning)
Merging wireless-next/for-next (756b31203d48 wifi: rtw89: fix misbehavior o=
f TX beacon in concurrent mode)
Merging wpan-next/master (18b849f12dcc ieee802154: ca8210: Remove stray gpi=
od_unexport() call)
Merging wpan-staging/staging (18b849f12dcc ieee802154: ca8210: Remove stray=
 gpiod_unexport() call)
Merging mtd/mtd/next (b85ea95d0864 Linux 6.7-rc1)
Merging nand/nand/next (3cc4718fa644 mtd: rawnand: brcmnand: exec_op implem=
entation)
Merging spi-nor/spi-nor/next (9b3eae3486c8 docs: mtd: spi-nor: drop obsolet=
e info)
Merging crypto/master (ce852f1308ac crypto: sa2ul - Return crypto_aead_setk=
ey to transfer the error)
Merging drm/drm-next (a13fee31f564 Merge v6.7-rc3 into drm-next)
Merging drm-ci/topic/drm-ci (ad6bfe1b66a5 drm: ci: docs: fix build warning =
- add missing escape)
Merging drm-misc/for-linux-next (f730e7adfd69 drm: remove drm_bridge_hpd_di=
sable() from drm_bridge_connector_destroy())
Merging amdgpu/drm-next (b719a9c15d52 drm/amd/display: Fix NULL pointer der=
eference at hibernate)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm_mst_types.c
Merging drm-intel/for-linux-next (c952bf11ace5 drm/i915/display: use intel_=
bo_to_drm_bo in intel_fbdev)
Merging drm-tegra/for-next (2429b3c529da drm/tegra: Avoid potential 32-bit =
integer overflow)
Merging drm-msm/msm-next (07e6de738aa6 drm/msm/a690: Fix reg values for a69=
0)
Merging drm-msm-lumag/msm-next-lumag (6ab502bc1cf3 drm/msm/dsi: Enable runt=
ime PM)
Merging etnaviv/etnaviv/next (925b10728f20 drm/etnaviv: disable MLCG and pu=
lse eater on GPU reset)
Merging fbdev/for-next (64a1aed0aa07 fbdev: mmp: Fix typo and wording in co=
de comment)
Merging regmap/for-next (1957b92aaff0 regmap: fix regmap_noinc_write() desc=
ription)
Merging sound/for-next (f8ccb133c986 ASoC: Intel: avs: Unhardcode HDAudio B=
E DAI drivers description)
Merging ieee1394/for-next (c12d7aa7ffa4 firewire: Annotate struct fw_node w=
ith __counted_by)
Merging sound-asoc/for-next (baaecc2b07ce Merge remote-tracking branch 'aso=
c/for-6.8' into asoc-next)
Merging modules/modules-next (4652b8e4f3ff Merge tag '6.7-rc-ksmbd-server-f=
ixes' of git://git.samba.org/ksmbd)
Merging input/next (3717194f2492 Input: gpio-keys - add system suspend supp=
ort for dedicated wakeirqs)
Merging block/for-next (2932169948e5 Merge branch 'for-6.8/io_uring' into f=
or-next)
Merging device-mapper/for-next (41e05548fa6b dm-flakey: start allocating wi=
th MAX_ORDER)
Merging libata/for-next (804901fdd637 ata: pata_pxa: convert not to use dma=
_request_slave_channel())
Merging pcmcia/pcmcia-next (4f733de8b78a pcmcia: tcic: remove unneeded "&" =
in call to setup_timer())
Merging mmc/next (fee5a2a60089 mmc: core: Use mrq.sbc in close-ended ffu)
Merging mfd/for-mfd-next (95f44ef666a6 dt-bindings: mfd: qcom,spmi-pmic: Ad=
d pm8916 vm-bms and lbc)
Merging backlight/for-backlight-next (58793f263abc backlight: pwm_bl: Use d=
ev_err_probe)
Merging battery/for-next (b55d073e6501 power: supply: bq256xx: fix some pro=
blem in bq256xx_hw_init)
Merging regulator/for-next (753e4d5c433d regulator: add under-voltage suppo=
rt (part 2))
Merging security/next (80b4ff1d2c9b selftests: remove the LSM_ID_IMA check =
in lsm/lsm_list_modules_test)
CONFLICT (content): Merge conflict in arch/alpha/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/arm/tools/syscall.tbl
CONFLICT (content): Merge conflict in arch/arm64/include/asm/unistd32.h
CONFLICT (content): Merge conflict in arch/m68k/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/microblaze/kernel/syscalls/sysca=
ll.tbl
CONFLICT (content): Merge conflict in arch/mips/kernel/syscalls/syscall_n32=
.tbl
CONFLICT (content): Merge conflict in arch/mips/kernel/syscalls/syscall_n64=
.tbl
CONFLICT (content): Merge conflict in arch/mips/kernel/syscalls/syscall_o32=
.tbl
CONFLICT (content): Merge conflict in arch/parisc/kernel/syscalls/syscall.t=
bl
CONFLICT (content): Merge conflict in arch/powerpc/kernel/syscalls/syscall.=
tbl
CONFLICT (content): Merge conflict in arch/s390/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/sh/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/sparc/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_32.tbl
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_64.tbl
CONFLICT (content): Merge conflict in arch/xtensa/kernel/syscalls/syscall.t=
bl
CONFLICT (content): Merge conflict in include/uapi/asm-generic/unistd.h
CONFLICT (content): Merge conflict in security/selinux/hooks.c
CONFLICT (content): Merge conflict in security/smack/smack_lsm.c
CONFLICT (content): Merge conflict in tools/perf/arch/mips/entry/syscalls/s=
yscall_n64.tbl
CONFLICT (content): Merge conflict in tools/perf/arch/powerpc/entry/syscall=
s/syscall.tbl
CONFLICT (content): Merge conflict in tools/perf/arch/s390/entry/syscalls/s=
yscall.tbl
CONFLICT (content): Merge conflict in tools/perf/arch/x86/entry/syscalls/sy=
scall_64.tbl
Applying: fix up for "LSM: wireup Linux Security Module syscalls"
Merging apparmor/apparmor-next (a7e405a2de69 apparmor: add missing params t=
o aa_may_ptrace kernel-doc comments)
Merging integrity/next-integrity (b836c4d29f27 ima: detect changes to the b=
acking overlay file)
Merging safesetid/safesetid-next (64b634830c91 LSM: SafeSetID: add setgroup=
s() testing to selftest)
Merging selinux/next (ae254858ce07 selinux: introduce an initial SID for ea=
rly boot processes)
Merging smack/next (3ad49d37cf57 smackfs: Prevent underflow in smk_set_cips=
o())
Merging tomoyo/master (0bb80ecc33a8 Linux 6.6-rc1)
Merging tpmdd/next (c2d5304e6c64 Merge tag 'platform-drivers-x86-v6.7-2' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86)
Merging watchdog/master (b85ea95d0864 Linux 6.7-rc1)
Merging iommu/next (263219b72e28 Merge branches 'iommu/fixes', 'apple/dart'=
, 'virtio', 'x86/amd' and 'core' into next)
Merging audit/next (24fade412acf Automated merge of 'dev' into 'next')
Merging devicetree/for-next (e185a24eeab3 dt-bindings: correct white-spaces=
 in examples)
Merging dt-krzk/for-next (b85ea95d0864 Linux 6.7-rc1)
Merging mailbox/for-next (96cb7a4e296d dt-bindings: mailbox: qcom-ipcc: doc=
ument the SM8650 Inter-Processor Communication Controller)
Merging spi/for-next (7a030abc0185 mtd: spi-nor: Stop reporting warning mes=
sage when soft reset is not suported)
Merging tip/master (62eafa820714 Merge branch into tip/master: 'x86/percpu')
Merging clockevents/timers/drivers/next (c28ca80ba3b5 clocksource: ep93xx: =
Add driver for Cirrus Logic EP93xx)
Merging edac/edac-for-next (12f230c07a95 EDAC/amd64: Add support for family=
 0x19, models 0x90-9f devices)
Merging irqchip/irq/irqchip-next (19b5a44bee16 irqchip: Add support for Aml=
ogic-C3 SoCs)
Merging ftrace/for-next (e1742fa172d5 Merge probes/for-next)
Merging rcu/rcu/next (68f721e904b2 rcu: Restrict access to RCU CPU stall no=
tifiers)
Merging kvm/next (e9e60c82fe39 selftests/kvm: fix compilation on non-x86_64=
 platforms)
CONFLICT (content): Merge conflict in include/linux/pagemap.h
Applying: fs: Convert error_remove_page to error_remove_folio
Applying: fix up for "KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for guest-spe=
cific backing memory"
Merging kvm-arm/next (307c5436c3f4 Merge branch kvm-arm64/lpa2 into kvmarm-=
master/next)
Merging kvms390/next (70fea3019516 KVM: s390: add tracepoint in gmap notifi=
er)
Merging kvm-ppc/topic/ppc-kvm (98b1cc82c4af Linux 6.7-rc2)
Merging kvm-riscv/riscv_kvm_next (d9c00f44e5de KVM: riscv: selftests: Add S=
BI DBCN extension to get-reg-list test)
Merging kvm-x86/next (1ab097653e4d Merge branches 'fixes', 'generic', 'hype=
rv', 'lam', 'misc', 'mmu', 'pmu', 'selftests' and 'svm')
Merging xen-tip/linux-next (7f3da4b698bc xen/events: fix error code in xen_=
bind_pirq_msi_to_irq())
Merging percpu/for-next (3fcf62f24c80 Merge branch 'for-6.6' into for-next)
Merging workqueues/for-next (4a6c5607d450 workqueue: Make sure that wq_unbo=
und_cpumask is never empty)
Merging drivers-x86/for-next (3799b5d2323d platform/x86: asus-laptop: remov=
e redundant braces in if statements)
CONFLICT (content): Merge conflict in drivers/platform/x86/wmi.c
Merging chrome-platform/for-next (d131f1f3b459 platform/chrome: sensorhub: =
Implement quickselect for median calculation)
Merging chrome-platform-firmware/for-firmware-next (ecea08916418 firmware: =
coreboot: framebuffer: Avoid invalid zero physical address)
Merging hsi/for-next (fa72d143471d HSI: omap_ssi: Remove usage of the depre=
cated ida_simple_xx() API)
Merging leds/for-next (1b929c02afd3 Linux 6.2-rc1)
Merging leds-lj/for-leds-next (8171710be2d0 leds: max5970: Add support for =
max5970)
Merging ipmi/for-next (c5d03a0d8461 ipmi: Use regspacings passed as a modul=
e parameter)
Merging driver-core/driver-core-next (eec4954b81c3 driver core: make device=
_is_dependent() static)
Merging usb/usb-next (24af68a0ed53 usb: misc: onboard_usb_hub: Add support =
for Cypress CY7C6563x)
Merging thunderbolt/next (655b8af57d31 thunderbolt: Remove duplicated re-as=
signment of pointer 'out')
Merging usb-serial/usb-next (2cc14f52aeb7 Linux 6.7-rc3)
Merging tty/tty-next (d804987153e7 serial: 8250_dw: Decouple DLF register c=
heck from UCV)
Merging char-misc/char-misc-next (ad6bcdad2b67 vmgenid: emit uevent when VM=
GENID updates)
Merging accel/habanalabs-next (0d1d2a3fa73b accel/habanalabs/gaudi2: add si=
gned dev info uAPI)
Merging coresight/next (60e5f23dc5d6 coresight: ultrasoc-smb: Use guards to=
 cleanup)
Merging fastrpc/for-next (b85ea95d0864 Linux 6.7-rc1)
Merging fpga/for-next (5496fb8eedd6 drivers/fpga: use standard array-copy f=
unction)
Merging icc/icc-next (feaf241ae2da Merge branch 'icc-fixes' into icc-next)
Merging iio/togreg (6543f376ec8a iio: buffer: document known issue)
Merging phy-next/next (7f6f9e0def00 phy: qcom-qmp-usb: Add Qualcomm SDX75 U=
SB3 PHY support)
Merging soundwire/next (55d50ace6b88 soundwire: generic_bandwidth_allocatio=
n use bus->params.max_dr_freq)
Merging extcon/extcon-next (b85ea95d0864 Linux 6.7-rc1)
Merging gnss/gnss-next (98b1cc82c4af Linux 6.7-rc2)
Merging vfio/next (2b88119e35b0 vfio/mtty: Enable migration support)
Merging w1/for-next (271c81935801 w1: Add AXI 1-wire host driver for AMD pr=
ogrammable logic IP core)
Merging staging/staging-next (d488759416ed Staging: rtl8192e: Rename variab=
le TsCommonInfo)
Merging counter-next/counter-next (7904cdf1397c counter: chrdev: remove a t=
ypo in header file comment)
Merging mux/for-next (44c026a73be8 Linux 6.4-rc3)
Merging dmaengine/next (306f5df81fcc dmaengine: apple-admac: Keep upper bit=
s of REG_BUS_WIDTH)
Merging cgroup/for-next (357564d50da3 Merge branch 'for-6.8' into for-next)
Merging scsi/for-next (d85d85eab615 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (6bae38ddd3a8 Merge patch series "scsi: arcmsr: s=
upport Areca ARC-1688 Raid controller")
Merging vhost/linux-next (cefc9ba6aed4 pds_vdpa: set features order)
Merging rpmsg/for-next (3f978d9889a2 remoteproc: k3-dsp: Convert to platfor=
m remove callback returning void)
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (3fde49c5dd8b dt-bindings: gpio: modepin: D=
escribe label property)
Merging gpio-intel/for-next (92fc925f8386 gpio: tangier: simplify locking u=
sing cleanup helpers)
Merging pinctrl/for-next (20470f6b5038 pinctrl: Convert unsigned to unsigne=
d int)
Merging pinctrl-intel/for-next (6191e49de389 pinctrl: baytrail: Simplify co=
de with cleanup helpers)
Merging pinctrl-renesas/renesas-pinctrl (dc99d4c8ac46 dt-bindings: pinctrl:=
 renesas: Drop unneeded quotes)
Merging pinctrl-samsung/for-next (b77f5ef8ebe4 pinctrl: samsung: add irq_se=
t_affinity() for non wake up external gpio interrupt)
Merging pwm/for-next (aaa69b9d49de pwm: Stop referencing pwm->chip)
Merging userns/for-next (05bd6e0242b4 Merge of unpriv-ipc-sysctls-for-v6.2,=
 and fix-atomic_lock_inc_below-for-v6.2 for testing in linux-next)
Merging ktest/for-next (7dc8e24f0e09 ktest: Restore stty setting at first i=
n dodie)
Merging kselftest/next (130a83879954 selftests: sched: Remove initializatio=
n to 0 for a static variable)
Merging kunit/test (b85ea95d0864 Linux 6.7-rc1)
Merging kunit-next/kunit (5fd4a61acb8e kunit: string-stream-test: Avoid cas=
t warning when testing gfp_t flags)
Merging livepatching/for-next (602bf1830798 Merge branch 'for-6.7' into for=
-next)
Merging rtc/rtc-next (3d762e21d563 rtc: cmos: Use ACPI alarm for non-Intel =
x86 systems too)
Merging nvdimm/libnvdimm-for-next (9ea459e477dc libnvdimm: remove kernel-do=
c warnings:)
Merging at24/at24/for-next (c692086d74a0 dt-bindings: at24: add ROHM BR24G0=
4)
Merging ntb/ntb-next (9341b37ec17a ntb_perf: Fix printk format)
Merging seccomp/for-next/seccomp (31c65705a8cf perf/benchmark: fix seccomp_=
unotify benchmark for 32-bit)
Merging fsi/next (f04d61a379d6 fsi: fix some spelling mistakes in comment)
Merging slimbus/for-next (b85ea95d0864 Linux 6.7-rc1)
Merging nvmem/for-next (b85ea95d0864 Linux 6.7-rc1)
Merging xarray/main (2a15de80dd0f idr: fix param name in idr_alloc_cyclic()=
 doc)
Merging hyperv/hyperv-next (ce9ecca0238b Linux 6.6-rc2)
Merging auxdisplay/auxdisplay (c52391fafcef auxdisplay: img-ascii-lcd: Use =
device_get_match_data())
Merging kgdb/kgdb/for-next (23816724fdbd kdb: Corrects comment for kdballoc=
env)
Merging hmm/hmm (0bb80ecc33a8 Linux 6.6-rc1)
Merging cfi/cfi/next (06c2afb862f9 Linux 6.5-rc1)
Merging mhi/mhi-next (d63ddfb78b23 bus: mhi: ep: Add support for interrupt =
moderation timer)
Merging memblock/for-next (e96c6b8f212a memblock: report failures when memb=
lock_can_resize is not set)
Merging cxl/next (5d09c63f11f0 cxl/hdm: Remove broken error path)
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (b501d5b36f58 efivarfs: automatically update super block f=
lag)
Merging unicode/for-next (c1869dbd2957 Merge branch 'unicode/negative-dentr=
ies' into unicode/for-next)
Merging slab/slab/for-next (7eec549256f2 Merge branch 'slab/for-6.8/slab-re=
moval' into slab/for-next)
CONFLICT (content): Merge conflict in mm/kasan/quarantine.c
Merging random/master (512dee0c00ad Merge tag 'x86-urgent-2023-01-04' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging landlock/next (1c8f324fd1e2 landlock: Document IOCTL support)
Merging rust/rust-next (3857af38e57a docs: rust: add "The Rust experiment" =
section)
Merging sysctl/sysctl-next (8b793bcda61f watchdog: move softlockup_panic ba=
ck to early_param)
Merging execve/for-next/execve (21ca59b365c0 binfmt_misc: enable sandboxed =
mounts)
Merging bitmap/bitmap-for-next (27c82f14e6d2 lib/find: optimize find_*_bit_=
wrap)
Merging hte/for-next (b85ea95d0864 Linux 6.7-rc1)
Merging kspp/for-next/kspp (8a3750ecf810 tracing/uprobe: Replace strlcpy() =
with strscpy())
Merging kspp-gustavo/for-next/kspp (617ab3c357d2 init: Kconfig: Disable -Ws=
tringop-overflow for GCC-11)
Merging nolibc/nolibc (b85ea95d0864 Linux 6.7-rc1)
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (b2b67c997bf7 iommufd: Organize the mock domain al=
loc functions closer to Joerg's tree)

--Sig_//+HBINEtyt=rzRwxBkx_1iw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVtXE0ACgkQAVBC80lX
0GwB3Af5ASZ5huzs6zCJZWoXd5iqASBTMNzaQxXD8IS4aI278u/a4rh1yMjSKZNM
7U/r6VHJo9JMvgMKRHi+4JoYVVr9/bdIgeljGtShu5hGtW2EsPoC2Rg/L1ph6x2K
kB316wDzJKoNcvKlOBcFvUWwqbpDXtR+bJ0Y6KR+9n954X2AHI7ZZOU5jdrloWtL
moYZfVTSMcvJKQ6LMnc8kqs65PKIa0WBnosGqEqy32h2uZpPcH6uL+O2RdCZuwzQ
vKPUARQEZB69fCSdr+4fbIbV2VyfMliEz8QdA6dylLf7VSUkgvnQYHC2mAHqe4mf
Pv80aO/UottESh7J9ugEWfRRmj3reg==
=1Oq7
-----END PGP SIGNATURE-----

--Sig_//+HBINEtyt=rzRwxBkx_1iw--

